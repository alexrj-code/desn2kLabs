			AREA basic_arith, CODE  ; This compiler directive tells the 
									; compiler that this section is called "basic_arith"
									; and that executable instructions follow.

			EXPORT asm_entry        ; This compiler directive tells the linker that 
									; "main" is in here, tells the linker where to 
									; go after running the startup code.

asm_entry                 			; This is a label, the entry to the main function.

			;;;;;;;;;;;;;;;;;;;;;;;;
	
			mov r0, #0				; set r0 to 0
			ldr r1, [pc, #24]		; load a into r1

			ldr r2, [pc #32]		; load d into r2
			add r1, r1, r2			; r1 = (a+d)

			ldr r3, [pc, #16]		; load c into r3

			ldr r4, [pc #20]		; load b into r4
			add r3, r3, r4			; r3 = (c+b)

			sub r0, r1, r3			; r0 = (a+d) - (c+b)

			;;;;;;;;;;;;;;;;;;;;;;;;
                                                                         
			b   asm_entry          	; this is an instruction which sets pc back to main

a   		DCD 32	
b   		DCD 14
c			DCD 1
d			DCD 3

			END