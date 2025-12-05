section .data
	enter_type db 'Размерность чисел? знак. / без знак. (i / u):', 10
	enter_type_len equ $ - enter_type

	enter_a db 'Введите a:'
	enter_a_len equ $ - enter_a

;	enter_b db 'Введите b:'

;	program_calc db 'Программа посчитала:'

;	var_more db 'a > b ==>'

;	var_less db 'a < b ==>'

;	var_equal db 'a == b ==>'

section .bss
; резервируем 1 qword для каждой переменной
	global a_16
	a_16 	resq 1

	global b_16
	b_16 	resq 1

	global a_u16
	a_u16 	resq 1

	global b_u16
	b_u16 	resq 1

	global resasm
	resasm 	resq 1

section .text
; передаем функии из файла func
	extern asmfunc_16 
	extern asmfunc_u16
	extern strlen
	extern println
	global main

main:
	mov rax, 1; 				sys_call write
	mov rdi, 1; 				вывод в терминал
	mov rsi, enter_type;		сообщение
	mov rdx, enter_type_len; 	длина сообщения
	syscall

	mov rdi, enter_type;
	call strlen
	call println

	mov rax, 0;					успешный выход из программы
	ret

	
