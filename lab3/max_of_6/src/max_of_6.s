			AREA maxof6, CODE
			EXPORT max_of_6
			; extern int max_of_6(int a, int b, int c, int d, int e, int f)
						
max_of_6                      		
					
			;;;;;;;;;;;;;;;;;;;;;;;;
	
			; save the v registers, pull the arguments from stack
			stmfd sp!, {v1-v2, lr} 			; push v1-v2 and lr onto the stack
			ldr v1, [sp, #12] 				; load e (sp + 12) bc we pushed 3 registers onto the stack
			ldr v2, [sp, #16] 				; load f (sp + 16) 

			; run the comparisons with linear scan
			cmp r0, r1						; compare a and b
			movlt r0, r1					; if b > a... move b into r0
			cmp r0, r2						; compare max(a,b) and c
			movlt r0, r2					; if c > max(a,b)... move c into r0
			cmp r0, r3						; compare max(a,b,c) and d
			movlt r0, r3					; if d > max(a,b,c)... move d into r0
			cmp r0, r4						; compare max(a,b,c,d) and e
			movlt r0, r4					; if e > max(a,b,c,d): move e into r0
			cmp r0, r5						; compare max(a,b,c,d,e) and f
			movlt r0, r5					; if f > max(a,b,c,d,e): move f into r0


			ldmfd sp!, {v1-v2, lr}			; pop v1-v2 + lr
			;;;;;;;;;;;;;;;;;;;;;;;;

			mov pc, lr
			
			
			END