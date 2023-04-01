;Setup memory starting address
; 0x7C00 is the default address for the bootloader for historical reasons
; realmode.asm
[org 0x7C00]
[bits 16]

; grid times 320*200 db 0x00 ; allocate memory for the grid
prison times 320 / 4 * 50 db 0x0004 ; allocate memory for the prison
; ball_pos times 2 db 0x00 ; allocate memory for the ball position
; paddle_pos times 2 db 0x00 ; allocate memory for the paddle position


; Switch to Mode 13h
mov ah, 0x00
mov al, 0x13
int 0x10

; Draw a row of red boxes
mov ax, 0xA000     ; Set video memory segment address
mov es, ax
mov di, 0          ; Set screen offset to top left corner

mov cx, 320*150       ; Set loop counter to number of pixels in a row
red_loop:
  mov [es:di], 0x04 ; Set pixel color to red
  inc di           ; Move to next pixel
  loop red_loop    ; Repeat for entire row



; Disable interrupts and then
; Halt the system
cli
hlt

; Padding and boot signature
times 510-($-$$) db 0
dw 0xAA55


; MAIN_LOOP: 
; # render game
; # check for user inputs
; # check if th ball is colliding with the walls or the paddle
; # update the walls
; # update the ball position
; # update the paddle position
; # update the score
; # update the screen
; # check if the game is over
; # if not, go to MAIN_LOOP



; # development steps

