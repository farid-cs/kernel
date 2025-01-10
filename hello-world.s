org 0x7C00
use16

define VIDEO 0x10
define TTY_WRITE 0x0E
define ENDL 13, 10

main:
	; data segment
	mov ax, 0
	mov ds, ax
	mov es, ax

	; stack segment
	mov ss, ax
	mov sp, 0x7C00

	mov si, message
	call puts

	hlt

.halt:
	jmp .halt

puts:
	push si
	push ax

.loop:
	lodsb              ; loads a byte from ds:si into al register and advances si register

	mov ah, TTY_WRITE
	mov bh, 0          ; page number
	int VIDEO

	or al, al
	jz .done

	jmp .loop

.done:
	pop ax
	pop si
	ret

message: db 'Hello World', ENDL, 0

times 510 - ($ - $$) db 0
dw 0AA55h
