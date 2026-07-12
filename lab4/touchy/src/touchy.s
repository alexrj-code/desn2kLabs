			AREA touchy, CODE
			EXPORT asm_entry
			
			; ------------------
			; Define any required constants here
			; ------------------
FIO0DIR	EQU 0x3FFFC000  ; Port 0 DIR
FIO0PIN EQU 0x3FFFC014  ; Port 0 PINS
FIO0SET EQU 0x3FFFC018  ; Port 0 SET
FIO0CLR EQU 0x3FFFC01C  ; Port 0 CLEAR

BUTTON EQU (1 << 10)    ; lab says P0.10
asm_entry    
	; Setup GPIO as required (not really needed because input by default)
		LDR R0, =FIO0DIR		; load addy of port 0 direction
		LDR R1, [R0]			; reads the value @ addy (port 0)
		LDR R2, =BUTTON		; get the bit mask for button
		BIC R1, R1, R2			; sets the 'button' bit to 0 (input)
		STR R1, [R0]			; store the config to the button address
		 


touchy_loop

									; Read P0.10
									; Branch to left_switch_pushed if input is high
	; Read button addy
		LDR R0, =FIO0PIN		; Load port 0 PIN addy into R0	
		LDR R1, [R0]			; Retrieve the PIN value
	; Check if pressed
		LDR R2, =BUTTON			; Set R2 to button mask
		ANDS R3, R1, R2			; Find out if button bit is high or low
								; result will be 1 if button is pressed

		BNE left_switch_pushed	; Branch if NOT EQUAL TO 0 
		b	touchy_loop	

left_switch_pushed					; does nothing yet
		nop					; CMD-F HERE
		b	left_switch_pushed
		
		END
