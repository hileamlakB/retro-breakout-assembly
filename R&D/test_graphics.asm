; Compile with: nasm -f elf -o program.o program.asm
; Link with: gcc -o program program.o -lSDL

%include "SDL/SDL.inc"
%include "SDL/SDL_mixer.inc"
%include "SDL/SDL_image.inc"


section .data
    message db "Hello, world!", 0
    
section .bss
    screen resd 1
    
section .text
    global main
    
main:
    ; Initialize SDL
    call SDL_Init, 0
    
    ; Create a 640x480 window
    mov eax, 640
    mov ebx, 480
    push ebx
    push eax
    push dword 0
    call SDL_SetVideoMode
    
    ; Load an image
    push dword 0
    push dword 0
    push dword 0
    push dword 0
    push dword 0
    push dword 0
    push dword 0
    push dword message
    call IMG_Load
    
    ; Draw the image
    mov ebx, eax
    mov eax, dword [screen]
    mov [eax], ebx
    mov eax, dword [screen]
    push eax
    call SDL_BlitSurface
    
    ; Update the screen
    mov eax, dword [screen]
    push eax
    call SDL_UpdateRect
    
    ; Wait for a keypress
    call SDL_PollEvent
    mov eax, dword [screen]
    push eax
    call SDL_WaitEvent
    
    ; Quit SDL
    call SDL_Quit
    
    ; Exit the program
    mov eax, 0
    ret
