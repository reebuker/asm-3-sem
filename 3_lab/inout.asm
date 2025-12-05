section .data

section .text
	global strlen
	global println

strlen:
; RDI - строка на вход, заканчивается 0
; RAX - выход программы, длина строки
	xor rax, rax				; побитовое ИСКЛЮЧАЮЩЕЕ ИЛИ (обнуление)

.loop:
	cmp byte [rax + rdi], 0		; сравниваем n-ый символ строки с нуль 
	je .done
	inc rax
	jmp .loop

.done:
	ret


println:
; RDI - строка на вход, заканчивается 0
push rax
push rdx
push rdi
push rsi
push r11

call strlen					; rax - длина строки

mov rdx, rax					; длина
mov rsi, rdi					; адрес
mov rax, 1 					; sys_write
mov rdi, 1					; stdout
syscall

pop r11
pop rsi
pop rdi
pop rdx
pop rax

ret
