			AREA blinky, CODE
			EXPORT asm_entry
			IMPORT delay 			;delay function from delay.s
			
			; ------------------
			; Define any required constants here
			; ------------------

asm_entry    
									; Setup GPIO as required

blinky_loop

									; Turn LED on
			
			bl 	delay				; Delay for 200ms
			
									; Turn LED off	

			bl 	delay				; Delay for 200ms	
			
			b	blinky_loop			; loop back, blinking the LED
			
			END
