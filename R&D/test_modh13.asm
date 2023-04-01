; realmode.asm
[org 0x7C00]
[bits 16]

; Switch to Mode 13h
mov ax, 0x0013
int 0x10

; Wait for a keypress
xor ah, ah
int 0x16

; Reset to text mode
mov ax, 0x0003
int 0x10

; Print a message
mov si, message      ; Load the address of the message string into SI
mov ah, 0x0E         ; Set AH to 0x0E (BIOS teletype function)
mov bh, 0x00         ; Set BH to 0x00 (display page number)
xor cx, cx           ; Clear CX register
print_char:
  lodsb               ; Load the next character from SI into AL and increment SI
  or al, al           ; Check if the character is zero (end of the string)
  jz done             ; If the character is zero, jump to 'done'
  mov cl, 0x0A        ; Set CL to 0x0A (background color = red, text color = green)
  int 0x10            ; Call BIOS interrupt 0x10 to print the character in AL with the specified color
  jmp print_char      ; Jump back to 'print_char' to print the next character
done:

; Halt the system
cli
hlt

; Message string
message db "Hello, World!", 0

; Padding and boot signature
times 510-($-$$) db 0
dw 0xAA55
