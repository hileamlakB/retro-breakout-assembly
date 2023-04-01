section .data
    newline db 0x0a     
    gridWidth equ 100
    gridHeight equ 30     
    grid times 30 * 100 db 0x2E
section .text
    global _start
	
	
; call the write system call
print:
    ; setup inputs for write system call
    mov rax,4            
	mov rbx,1            
	mov rcx,rdi      
	mov rdx, rsi    
	                    
	int 80h ; call the write system call
	ret

print_line:
    mov rdi, newline
    mov rsi, 1
    call print
    ret

print_grid:
    mov rcx, gridHeight
    OUTERLOOP:
        mov r10, rcx

        ; row
        mov r11, gridHeight
        sub r11, rcx
        imul r11, gridHeight
        ; imul r11, 4

        mov rcx, gridWidth
        INNERLOOP:
            mov r13, rcx
            ;col
            mov r12, gridWidth
            sub r12, rcx
            ; imul r12, 4

            lea rdi, [grid + r11 + r12]
            mov rsi, 1
            call print


            mov rcx, r13
            loop INNERLOOP


        call print_line


        mov rcx, r10
        loop OUTERLOOP 
    ret



_start:
      
	
	call print_grid;
	

	
	mov eax,1            ; The system call for exit (sys_exit)
	mov ebx,0            ; Exit with return "code" of 0 (no error)
	int 80h;