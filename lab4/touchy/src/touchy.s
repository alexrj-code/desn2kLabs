			AREA touchy, CODE
			EXPORT asm_entry
			
			; ------------------
			; Define any required constants here
			; ------------------

asm_entry    
									; Setup GPIO as required

touchy_loop

									; Read P0.10
									; Branch to left_switch_pushed if input is high
			
			b	touchy_loop	

left_switch_pushed					; does nothing yet
			nop
			b	left_switch_pushed
			
			END
