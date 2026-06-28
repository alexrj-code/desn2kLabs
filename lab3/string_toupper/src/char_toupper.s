AREA char_toupper_code, CODE
	EXPORT char_toupper

; Paste your char_toupper.s from Lab 2
; Adjust it as described to operate as a function
; Argument must be passed in R0
; Return result must be passed back in R0
; You must NOT use R10
; ------------------------------------------------------------------
; Function: char_toupper (char)
; This function converts a lowercase letter to uppercase.
; It takes a character in R0 and returns the uppercase version in R0.
char_toupper
		; check if between 0x61 and 0x7A inclusive
		; if so, minus 32_d
		; else break

		cmp r0, #0x61			; cmp with 'a'
		blt skip				; if less than 'a' its either uppercase already or invalid, we don't care
		cmp r0, #0x7A			; cmp with 'z'
		bgt skip				; if greater than 'z' its beyond the scope, skip

		; executes if a<= r0 <= z
		sub r0, r0, #32

skip
		bx lr					; return to caller
								; branch & exchange (looks at bit 0 to check if its small instruction or large instruction)
		END