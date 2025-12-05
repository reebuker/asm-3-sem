section .data

	enter_type db 'Размерность чисел? знак. / без знак. (i / u):', 10

	enter_a db 'Введите a:'

	enter_b db 'Введите b:'

	program_calc db 'Программа посчитала:'

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

; резервируем 64 байта для буфера
	global buffer
	buffer resb 64

section .text
; передаем функии из файла func
	extern asmfunc_16 
	extern asmfunc_u16
	extern strlen
	extern println
	extern get_input	
	global _start

_start:
	mov rdi, enter_type;
	call println
	
	mov rsi, 63		; размер буфера (+1 для нуля)
	mov rdi, buffer		; адрес буфера
	call get_input	

	mov rax, 60
	xor rdi, rdi
	syscall
