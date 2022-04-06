%include "printf32.asm"

section .text
    global main
    extern printf

main:
    mov eax, 7       ; vrem sa aflam al N-lea numar; N = 7

    ; TODO: calculati al N-lea numar fibonacci (f(0) = 0, f(1) = 1)
    push 0
    push 1
back:
    cmp eax, 1
    jg next
    jmp print

next:
    add eax, -1
    pop ebx
    pop ecx
    push ebx
    add ebx, ecx
    push ebx
    jmp back

print:
    pop eax
    PRINTF32 `%d\n\x0`, eax

    popf
    ret
