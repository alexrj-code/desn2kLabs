
// toggle project

#include "lpc24xx.h"
// Define the bit masks for PINS 
#define BTN_LEFT     (1 << 10)   // P0.10
#define BTN_RIGHT     (1 << 11)   // P0.11
#define LED_L_RED    (1 << 16)   // P3.16
#define LED_L_GRN    (1 << 17)   // P3.17

#define LED_R_RED    (1 << 19)   // P3.19
#define LED_R_GRN    (1 << 20)   // P3.20

int main(void) {
		// Make a tracking variable for our state machine kind of thing
	int left_prev_state = 0;  
	int left_current_state = 0;

    int right_prev_state = 0;  
	int right_current_state = 0;
	
	                                                                                                                                                               
	// Set the direction pins (tell it we want button as INPUT, LED output)
	FIO0DIR = FIO0DIR & (~(BTN_LEFT | BTN_RIGHT));                  // Input
    FIO3DIR |= (LED_L_RED | LED_L_GRN | LED_R_GRN | LED_R_RED);    // Output (|= combined mask)

	// Set the default state as green ON, red OFF
	FIO3SET = (LED_L_GRN | LED_R_GRN);
    FIO3CLR = (LED_L_RED | LED_R_RED);


	while(1) {
        // current button status
        if ((FIO0PIN & BTN_LEFT) != 0) {
            left_current_state = 1; 
        } else {
            left_current_state = 0;
        }
        
        // check if button press is 'new' 
        if (left_current_state == 1) {
            if (left_prev_state == 0) {
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
				left_prev_state = left_current_state;
        right_prev_state = right_current_state;

        // current button status
        if ((FIO0PIN & BTN_RIGHT) != 0) {
            right_current_state = 1; 
        } else {
            right_current_state = 0;
        }
        
        // check if button press is 'new' 
        if (right_current_state == 1) {
            if (right_prev_state == 0) {
                // if button is pressed but wasn't pressed b4:
                // toggle LEDs
                if ((FIO3PIN & LED_R_GRN) != 0) {
                    // change from green to red
                    FIO3CLR = LED_R_GRN; // grn off
                    FIO3SET = LED_R_RED; // red on
                } else {
                    // chng from red to green
                    FIO3CLR = LED_R_RED; // red off
                    FIO3SET = LED_R_GRN; // green on
                }
                
            }
        }
        
		// change 'previous state' 
        right_prev_state = right_current_state;
    }
	
	return 0;
}
