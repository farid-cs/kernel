org 7C00h
use16

define VIDEO 10h
define TTY_WRITE 0Eh
define ENDL 0Dh, 0Ah

main:
	; data segment
	mov ax, 0
	mov ds, ax
	mov es, ax

	; stack segment
	mov ss, ax
	mov sp, 7C00h

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
