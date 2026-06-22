			AREA xor_cipher, CODE
			EXPORT asm_entry  
						
asm_entry                      		
					
			
			;;;;;;;;;;;;;;;;;;;;;;;;
	
			; Your code goes here.		
			; Remember to use ldrh/ldrb.
			
			;;;;;;;;;;;;;;;;;;;;;;;;

			b   asm_entry


			AREA cipher_data, DATA
			; the 16-bit key to decrypt the ciper text
key			DCW 0x5E08

			; the number of bytes in the cipher text
length		DCW 24

			; This is the encrypted string.
cipher_text DCB 0x4e, 0x31, 0x64, 0x32, 0x67, 0x29, 0x28, 0x2a, 0x60, 0x3b, 0x28, 0x29
			DCB 0x60, 0x37, 0x7c, 0x3b, 0x28, 0x2c, 0x69, 0x3c, 0x6a, 0x37, 0x7c, 0x7f
			
			; Store your decrypted string here.
clear_text  SPACE 24 ;leave space for 24 bytes

			END