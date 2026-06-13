			AREA gcd, CODE
			EXPORT asm_entry  
						
asm_entry                      		
			; Here a is 12 and b is 2, make sure
            ; you try different values when testing.

			mov r0, #12		; a
			mov r1, #2      ; b
			
            ; Place your code here

			b   asm_entry


			END