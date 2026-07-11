			AREA blinky, CODE
			EXPORT asm_entry
			IMPORT delay 			;delay function from delay.s
			
			; ------------------
			; Define any required constants here
			; ------------------
			FIO3DIR	EQU 0x3FFFC060  ; Port 3 DIR
			FIO3PIN EQU 0x3FFFC074  ; Port 3 PINS
			FIO3SET EQU 0x3FFFC078  ; Port 3 SET
			FIO3CLR EQU 0x3FFFC07C  ; Port 3 CLEAR

			TOP_RED	EQU (1 << 16)   ; silkscreen says P3.16
			BOTTOM_RED EQU (1 << 19); silkscreen says P3.19

asm_entry    
	; Setup GPIO, tell system we want LEDs as OUTPUTS
		LDR	R0, =FIO3DIR			; loads addy of port 3 direction
		LDR	R1, [R0]				; reads the value @ addy
		LDR R2, =(TOP_RED | BOTTOM_RED	; composite bit mask for top and bottom
		ORR	R1, R1, R2				; bitwise or to get the value @ the bits corspnd to LED
		STR	R1, [R0]				; saves congif back to addy

blinky_loop
	; TURN ON LEDs
		; Method 1: Read-Modify-Write (Top LED - Pin 16)
		LDR     R0, =FIO3PIN		; loads addy of port 3 PIN
		LDR     R1, [R0]        	; gets the value at addy
		LDR     R2, =TOP_RED    	; gets the value for red
		ORR     R1, R1, R2      	; force bit 16 to be 1, tells it we want RED
		STR     R1, [R0]       		; save this config

		; Method 2: SET Register (Bottom LED - Pin 19)
		LDR     R3, =FIO3SET    	; gets the SET addy
		LDR     R4, =BOTTOM_RED 	; gets the BOTTOM_RED pattern (bit 19 = 1)
		STR     R4, [R3]        	; stores BOTTOM_RED pattern at location specified by addy

		; Wait for 200ms
		BL      delay           
	
	; -------------------------------------------------------------
	; Turn LEDs OFF
	; -------------------------------------------------------------
		; Method 1: Read-Modify-Write (Top LED - Pin 16)
		LDR     R0, =FIO3PIN    	; loads addy of port 3 PIN
		LDR     R1, [R0]        	; stores value at port 3 pin addy
		LDR     R2, =TOP_RED    	; gets the top red mask
		BIC     R1, R1, R2      	; turns OFF the bit specified by mask
		STR     R1, [R0]        	; stores led instruction in addy
		
		; Method 2: CLR Register (Bottom LED - Pin 19)
		LDR     R5, =FIO3CLR    	; gets the clear pattern
		LDR     R4, =BOTTOM_RED 	; gets the bottom red led pattern
		STR     R4, [R5]        	; goes to clear pattern addy, saves red led pattern

		; Wait for 200ms   
		BL      delay           
		
		B       blinky_loop     
	
	END
