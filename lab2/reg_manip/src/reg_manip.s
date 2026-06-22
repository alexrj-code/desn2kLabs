			AREA reg_manip, CODE    
			EXPORT asm_entry        

scalar		EQU 3					; The compiler directive EQU defines the symbol
									; "scalar" to have the value 3, you can think of this
									; as the same definition as a #define in c.

asm_entry                      		


			;;;;;;;;;;;;;;;;;;;;;;;;
	
			mov	R0, #scalar 		; R0 = scalar
			
			mov R1, R0, LSL #1		; R1 = scalar * 2^1
			mov R2, R0, LSL #2		; R2 = scalar * 2^2
			mov R3, R0, LSL #3		; R3 = scalar * 2^3
			mov R4, R0, LSL #4		; R4 = scalar * 2^4
			mov R5, R0, LSL #5		; R5 = scalar * 2^5
			mov R6, R0, LSL #6		; 61 = scalar * 2^6
			mov R7, R0, LSL #7		; R7 = scalar * 2^7
			
			;;;;;;;;;;;;;;;;;;;;;;;;
                                                                         
			b   asm_entry          	
			END