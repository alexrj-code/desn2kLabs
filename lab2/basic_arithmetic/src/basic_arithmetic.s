			AREA basic_arith, CODE  ; This compiler directive tells the 
									; compiler that this section is called "basic_arith"
									; and that executable instructions follow.

			EXPORT asm_entry        ; This compiler directive tells the linker that 
									; "main" is in here, tells the linker where to 
									; go after running the startup code.

asm_entry                 			; This is a label, the entry to the main function.

			;;;;;;;;;;;;;;;;;;;;;;;;
	
			; Your code goes here.			
			
			;;;;;;;;;;;;;;;;;;;;;;;;
                                                                         
			b   asm_entry          	; this is an instruction which sets pc back to main

a   		DCD 32	
b   		DCD 14
c			DCD 1
d			DCD 3

			END