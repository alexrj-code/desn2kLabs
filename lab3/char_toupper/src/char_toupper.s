			AREA char_touper, CODE
			EXPORT asm_entry  
						
asm_entry                      		
					
			# check if between 0x61 and 0x67 inclusive
			# if so, minus 32_d
			# else break
			ldr r0, =char 			# loads address of char into r0
			ldrb r1, [r0]			# tells it to load the actual char BYTE from address

			cmp r1, #0x61			# cmp with 'a'
			blt skip				# if less than 'a' its either uppercase already or invalid, we don't care
			cmp r1, #0x67			# cmp with 'g'
			bgt skip				# if greater than 'g' its beyond the scope, skip

			# executes if a<= r1 <= g
			sub r1, r1, #32
			strb r1, [r0]

skip
			END

			AREA character, DATA
char		DCB "f"				; identical to DCB 0x66

			END