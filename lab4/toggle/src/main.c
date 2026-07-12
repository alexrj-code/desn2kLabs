
// toggle project

#include "lpc24xx.h"
// Define the bit masks for PINS 
#define BTN_LEFT     (1 << 10)   // P0.10
#define LED_L_RED    (1 << 16)   // P3.16
#define LED_L_GRN    (1 << 17)   // P3.17

int main(void) {
		// Make a tracking variable for our state machine kind of thing
	int prev_state = 0;  
	int current_state = 0;
	
	// Set the direction pins (tell it we want button as INPUT, LED output)
	FIO0DIR = FIO0DIR & (~BTN_LEFT);                  // Input
    FIO3DIR |= (LED_L_RED | LED_L_GRN);    // Output (|= combined mask)

	// Set the default state as green ON, red OFF
	FIO3SET = LED_L_GRN;
    FIO3CLR = LED_L_RED;
	
	while(1) {
        // current button status
        if ((FIO0PIN & BTN_LEFT) != 0) {
            current_state = 1; 
        } else {
            current_state = 0;
        }
        
        // check if button press is 'new' 
        if (current_state == 1) {
            if (prev_state == 0) {
                // if button is pressed but wasn't pressed b4:
                // toggle LEDs
                if ((FIO3PIN & LED_L_GRN) != 0) {
                    // change from green to red
                    FIO3CLR = LED_L_GRN; // grn off
                    FIO3SET = LED_L_RED; // red on
                } else {
                    // chng from red to green
                    FIO3CLR = LED_L_RED; // red off
                    FIO3SET = LED_L_GRN; // green on
                }
                
            }
        }
        
		// change 'previous state' 
        prev_state = current_state;
    }
	
	return 0;
}
