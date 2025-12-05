section .data
extern a8, a_16, c8, c16, d8, d16
extern resasm8
extern resasm16

section .text
global asmfunc8, asmfunc16
asmfunc8:
    mov ebx, 29
    mov edi, 6

; TOP NUM
    movsx eax, byte[c8];    eax = c
    movsx ecx, byte[d8];    ecx = d
    imul ecx;               eax = c * d
    add eax, ebx;           eax = c*d + 29 (top number)     

; BOTTOM NUM
    movsx ebx, byte[a8];    ebx = a
    movsx edx, byte[c8];    edx = c
    add ebx, edx;           ebx = a+c
    sub ebx, edi;           ebx = a+c - 6 (bottom number)

    cdq;                    eax -> edx:eax
    idiv ebx;               edx:eax = eax / ebx

    mov [resasm8], eax
    ret

asmfunc16:

    mov rbx, 29
    mov rdi, 6

; TOP NUM
    movzx rax, word[c16];    rax = c
    movzx rcx, word[d16];    rcx = d
    mul rcx;                 rax = c * d
    add rax, rbx;            rax = c*d + 29 (top number)     

; BOTTOM NUM
    movzx rbx, word[a_16];   rbx = a
    movzx rdx, word[c16];    rdx = c
    add rbx, rdx;            rbx = a+c
    sub rbx, rdi;            rbx = a+c - 6 (bottom number)

    mov rdx, 0;              rax -> rdx:rax
    idiv rbx;                rdx:rax = rax / rbx

    mov [resasm16], rax
    ret
