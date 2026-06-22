			AREA char_touper, CODE
			EXPORT asm_entry  
						
asm_entry                      		
					
			; Write your code here.
			mov r0, =char
			ldrb r1, [r0]
			
			sub r1, r1, #32
			
			strb r1, [r0]
		
			
			;b   asm_entry

			AREA character, DATA
char		DCB "f"				; identical to DCB 0x66

			END