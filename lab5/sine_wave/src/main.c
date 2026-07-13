// Sine Wave Output Program

#include "lpc24xx.h"

extern unsigned int sinewave_data[];

// WE R TOLD DAC ON QVGA IS PHYSICALLY CONNECTED TO SPEAKER 

int main(void) {
	int i = 0;
	
	// Setup Pin Connect for AOUT
	PINSEL1 = PINSEL1 & ~(3 << 20);			// we want bits 20-21 to be 00 initially and everything else the same
	PINSEL1 = PINSEL1 | (2 << 20);			// set them to 10 (DAC OUTPUT) -> see table ss

	
	while (1) {
		//Write next value of sinewave_data[] to the DAC
		DACR = (sinewave_data[i] << 6);		// put the data into DACR, shift so we don't touch forbidden section
		i = i + 1;
		// i = i + 16; // LOWER SAMPLING RATE FOR 2nd PART
		
		// won't this be way too high freq to hear???

		if (i == 256) {
            i = 0;
        }
	}
	
	return 0;
}