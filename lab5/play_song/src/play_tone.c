#include "lpc24xx.h"

// Initialize DAC.
// This should be the same as the previous exercise.
void setup_DAC(void) {
	PINSEL1 = PINSEL1 & ~(3 << 20);			// we want bits 20-21 to be 00 initially and everything else the same
	PINSEL1 = PINSEL1 | (2 << 20);			// set them to 10 (DAC OUTPUT) -> see table ss
}

// udelay should delay the processor for 'delay_in_us' number of microseconds.
// * LPC24XX.h contains a definition for the PCLK, "Fpclk"
//   use this definition for PCLK as defined in the manual.
// * Use Timer 0. This means you MUST use the prefix T0 for every control
//   register, i.e. T0TCR.
// * Make sure you reset the timer, and when you start the timer ENSURE you
//   set the reset bit back to zero!
void udelay(unsigned int delay_in_us) {
    T0TCR = 0b00000010;                 // reset the timer by setting bit 1 to 1. 

    T0PR = (Fpclk / 1000000) - 1;       // prescaler set to 

    T0TCR = 0b00000001;                 // set reset bit to 0, enable clock

    while (T0TC < delay_in_us) {
        // do nothing while count
    }
	
    T0TCR = 0b00000000;                 // set timer 0 ctrl register to 0 again
}
	

// play_tone should play a tone for 'duration' number of microseconds at the pitch
// given by 1/'period'. Played at the volume given by 'vol', which ranges from																   
// 0 (off) to 0x3FF (max volume).																		   

void play_tone(unsigned int duration, int period, int vol) {
    unsigned int cycles = duration / period;   // how many full periods fit in duration
    unsigned int i;

    for (i = 0; i < cycles; i++) {
        DACR = ((unsigned int)vol << 6);   // vol is output voltage, shift 6 to occupy bits 6-15
        udelay(period / 2);                // hold
        DACR = 0;                          // dac 0
        udelay(period / 2);                // hold
    }   
}
