			AREA	array_add, CODE 
			EXPORT 	asm_entry
					
scalar		EQU 4					
					
asm_entry	ldr 	r0, =src	 	; R0 is the address of src
			ldr 	r1, =dst	 	; R1 is the address of dst
			mov		r2, #scalar	 	; Add this to every array element
					
			;;;;;;;;;;;;;;;;;;;;;

			; Your code here   
			; Each entry of dst needs to equal 
			; the corresponding entry of src, plus
			; scalar.
			; Use r3-r10 to temporarily store the array
			
			;;;;;;;;;;;;;;;;;;;;;
										
			b 		asm_entry
			
					
			AREA	variables, DATA
src			DCD 	3, 4, 5, 7, 13, 54, 92, 1034
dst			DCD 	0, 0, 0, 0, 0, 0, 0, 0
			
			END
					