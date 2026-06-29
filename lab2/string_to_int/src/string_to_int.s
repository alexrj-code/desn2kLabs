			AREA string_to_int, CODE
			EXPORT asm_entry  
						
asm_entry                      		
	
            ; Place your code here
			mov r0, #0				; result = r0 = 0
			ldr r1, =thestring		; set r1 to thestring*

loop
			ldrb r2, [r1] 			; set r2 to character
			cmp r2, #0				; check for \0
			beq end					; if it is null terminator, we done

			sub r3, r2, #0x30		; minus 0 from ascii digit to numberic value

			; MULTIPLY PREV_RESULT BY 10 AND ADD MOST RECENT DIGIT TO GET NEW RESULT
			add r0, r0, r0, lsl #2	; r0 = result + result<<2 (running: mul by 5)
			add r0, r0, r0			; double it (running: mul by 10)
			add r0, r0, r3			; r0 = result = result*10 + (s[i] - '0')

			add r1, r1, #1			; increment pointer by a single byte (next char)
			b loop

end			
			b   asm_entry			; but this never ends, so we can see the result in r0 in the debugger

            AREA stringData, DATA
			; Here are the characters of the string
thestring   DCB "12345"
			DCB 0x00 	;explicit null termination
			
			END


