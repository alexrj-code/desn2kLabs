#include "touch.h"
#include "lpc24xx.h"

#define CS_PIN            0x00100000        //P0.20

static unsigned char touch_read(unsigned char command);

// control byte to read x-ord is 0xD8
// control byte to read y-ord is 0x98

void touch_init(void)
{
	// need to set bits 31:30 of pinsel 0 to 11 to get SCK mode
	PINSEL0 &= ~((unsigned long)3 << 30);		// clears pins 31:30 
	PINSEL0 |=  ((unsigned long)3 << 30);		// sets to pins 31:30 to 11

	// P0.17 -> bits 3:2 in PINSEL1 need to become 11 to get MISO mode
	PINSEL1 &= ~((unsigned long)3 << 2);
	PINSEL1 |=  ((unsigned long)3 << 2);

	// P0.18 -> bits 5:4 in PINSEL1 need to become 11 to get MOSI mode
	PINSEL1 &= ~((unsigned long)3 << 4);
	PINSEL1 |=  ((unsigned long)3 << 4);

	// set CS_TP as a GPIO output
	FIO0DIR |= CS_PIN;
	FIO0SET = CS_PIN;		// set CS_PIN to high (good practice), page 73 lab manual

	S0SPCR = 0x093C;		// set SPI specs as per page 74

	S0SPCCR = 0x24;			// set SPI clock to 36 MHz (page 74)
}

void touch_read_xy(char *x, char* y)
{
	//Read X co-ordinate from the touch screen controller
	*x = touch_read(0xD8);
	//Read Y co-ordinate from the touch screen controller
	*y = touch_read(0x98);
}

static unsigned char touch_read(unsigned char command)
{
	unsigned short result;		// stores data from SPI (16 bits)

	FIO0CLR = CS_PIN;			// set CS_TP pin low to begin SPI transmission

	//Transmit command byte on MOSI
	S0SPDR = command;			// give it a value to transfer
	while (!(S0SPSR & 0x80));   // wait for SPIF -> MSB goes high when complete
	result = S0SPDR;            // read SOSPDR (whatevers in MISO) just to make it happy (clears SPIF flag too)

	//Transmit 0x00 on MOSI, read in requested result on MISO (another full read/write cycle)
	S0SPDR = 0x00;				// send 0 as command to trigger it to send back data
	while (!(S0SPSR & 0x80));   // wait for SPIF
	result = S0SPDR;            // bit 8 = useless, bits 7:0 = data

	
	FIO0SET = CS_PIN;			// transmission complete, set CS_TP pin back to high (good practice)

	//Return 8 bit result (bottom 8 bits)
	return (unsigned char) (result & 0xFF);
}	

