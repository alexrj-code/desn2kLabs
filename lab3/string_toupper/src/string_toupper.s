;comment like a good programmer!
			EXPORT asm_entry  
			IMPORT char_toupper			;Import your function
			
NULL		EQU 0						;Define NULL character


			AREA string_toupper, CODE						
asm_entry                      		
			ldr r10, =string			;Load the address of string into R10.
										;Your function should NOT use R10.
										
loop		ldrb r0, [r10]				;Load the next character into R0,

			;Call char_toupper here
			
			strb r0, [r10], #1			;Store the result back into memeory
										;and post increment R10
			
			cmp r0, #NULL				;If the character is null, string is complete.
			bne loop					;Otherwise, branch back to loop
			
finished	nop							;Job done, do nothing now.
			b finished					
			
			AREA string_data, DATA
string		DCB "MaKe m3 upPer Case! :D"

			END
			