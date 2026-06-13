			AREA char_touper, CODE
			EXPORT asm_entry  
						
asm_entry                      		
					
			; Write your code here.

			b   asm_entry

			AREA character, DATA
char		DCB "f"				; identical to DCB 0x66

			END