section .data
extern a_16, b_16
extern a_u16, b_u16
extern resasm

section .text
global asmfunc_16
asmfunc_16:
	movsx rax, word[a_16];	rax = a_16
	movsx rbx, word[b_16];	rbx = b_16
	cmp rax, rbx

	jg var1;	a > b
	jl var2;	a < b
	je var3;	a == b

	ret
global asmfunc_u16
asmfunc_u16:
	movzx rax, word[a_u16];	rax = a_u16
	movzx rbx, word[b_u16];	rbx = b_u16
	cmp rax, rbx

	jg var1;	a > b
	jl var2;	a < b
	je var3;	a == b

	ret	

var1:
	mov rcx, rax;			rcx = a_u16
	mov rax, rbx;			rax = b_u16
	cqo;					rax --> rdx:rax
	idiv rcx;				rax = a_u16 / b_u16 
	add rax, 86;			rax = a_u16 / b_u16 + 86

	mov qword[resasm], rax;

	ret

var2:
	sub rax, 32;			rax = a_u16 - 32
	cqo;					rax --> rdx:rax
	idiv rbx;				rax = a_u16 / b_u16

	mov qword[resasm], rax;

	ret

var3:
	mov qword[resasm], 16;

	ret
