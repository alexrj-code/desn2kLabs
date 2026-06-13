			AREA iter_mul, CODE
			EXPORT asm_entry  
			
multiplicand EQU 6					; Change these to test your program
multiplier	 EQU 4					; Change these to test your program.
			
asm_entry                      		
			
			mov r0, #multiplicand	; Moves the immediate value of the symbol into R0
			mov r1, #multiplier		; Moves the immediate value of the symbol into R1
			
			;;;;;;;;;;;;;;;;;;;;;;;;
	
			; Your code goes here.			
			
			;;;;;;;;;;;;;;;;;;;;;;;;

			b   asm_entry

			AREA varbs, DATA

result		DCD 0	              	; Store your result here with a str command

			END
			