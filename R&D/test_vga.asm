[org 0x7C00]
[bits 16]

mov ah, 0x00        ; Set video mode
mov al, 0x03        ; VGA text mode
int 0x10

mov ah, 0x02        ; Set cursor position
mov bh, 0x00        ; Page number
mov dh, 0x06        ; Row
mov dl, 0x0B        ; Column
int 0x10

mov ah, 0x09        ; Write string to screen
mov al, 0x0F        ; Green text on red background
mov bx, 0x000F      ; String attribute
mov cx, 0x000D      ; String length
mov si, message     ; String to write
int 0x21

cli
hlt

message db "Hello, World!", 0

times 510-($-$$) db 0
dw 0xAA55
