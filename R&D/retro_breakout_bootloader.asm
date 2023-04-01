[org 0x7C00]
[bits 16]



; Boot sector
load_game:

; Padding and boot signature
times 510-($-$$) db 0
dw 0xAA55