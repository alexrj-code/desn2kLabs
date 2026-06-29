		AREA char_touper, CODE
		EXPORT asm_entry  
						
asm_entry                      		
					
		; check if between 0x61 and 0x7A inclusive
		; if so, minus 32_d
		; else break
		ldr r0, =char 			; loads address of char into r0
		ldrb r1, [r0]			; load the actual letter from address

		cmp r1, #0x61			; cmp with 'a'
		blt skip				; if less than 'a' we don't care
		cmp r1, #0x7A			; cmp with 'z'
		bgt skip				; if greater than 'z' its beyond the scope

		; executes if a <= r1 <= z
		sub r1, r1, #32			; subtract 32 to convert to uppercase
		strb r1, [r0]

skip
		bx lr					; return to caller
		
		b	asm_entry

		AREA character, DATA
		
		
		
char	
		DCB "f"				; identical to DCB 0x66

		END