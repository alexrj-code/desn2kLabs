			AREA gcd, CODE
			EXPORT asm_entry  

asm_entry                      		
			; Here a is 12 and b is 2, make sure
            ; you try different values when testing.

			mov r0, #12		; a
			mov r1, #12      ; b

asm_entry_cond_0
			cmp r0, r1
			beq asm_entry_end
			subgt r0, r0, r1
			suble r1, r1, r0
			b 	 asm_entry_cond_0

asm_entry_end
			END