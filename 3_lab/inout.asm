section .data

section .text
	global strlen
	global println
	global get_input

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

get_input:
    ; 1. Читаем с клавиатуры
    mov rax, 0          ; sys_read = 0
    mov rdx, rsi        ; размер буфера
    mov rsi, rdi        ; адрес буфера
    mov rdi, 0          ; stdin = 0
    syscall
    
    ; 2. Проверяем ошибку
    test rax, rax
    js .error           ; если < 0
    
    ; 3. Заменяем \n на 0
    cmp rax, 0
    je .done            ; пустая строка
    
    dec rax                    ; последний символ
    cmp byte [rsi + rax], 10   ; 10 = \n
    jne .no_newline
    
    mov byte [rsi + rax], 0    ; заменяем \n на 0
    ; rax уже = длина без \n
    ret

.no_newline:
    ; Если \n нет - добавляем 0 в конец
    inc rax                    ; восстанавливаем длину
    mov byte [rsi + rax], 0    ; ставим 0
    
.done:
    ret

.error:
    mov rax, -1
    ret

