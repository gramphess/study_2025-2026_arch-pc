%include 'in_out.asm'

SECTION .data
    msg_x: DB 'Введите значение переменной x: ', 0
    msg_result: DB 'Результат: ', 0

SECTION .bss
    x: RESB 80

SECTION .text
GLOBAL _start

_start:
    mov eax, msg_x
    call sprint

    mov ecx, x
    mov edx, 80
    call sread

    mov eax, x
    call atoi

    mov ebx, 8
    mul ebx

    add eax, 6

    mov ebx, 10
    mul ebx

    mov edi, eax

    mov eax, msg_result
    call sprint

    mov eax, edi
    call iprint

    mov eax, 1
    xor ebx, ebx
    int 0x80
