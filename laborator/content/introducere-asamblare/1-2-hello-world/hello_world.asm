%include "printf32.asm"

section .data
    myString: db "Hello, World!", 0
    string: db "Goodbye, World!", 0

section .text
    global main
    extern printf

main:
    mov ecx, 6 
back:                     ; N = valoarea registrului ecx
    cmp ecx, 0
    jg print
    mov eax, 2
    mov ebx, 1
    cmp eax, ebx
    jg print2                        ; TODO1: eax > ebx?
    ret

print:
    PRINTF32 `%s\n\x0`, myString
    dec ecx
    cmp ecx, 0
    jg back
print2
    PRINTF32 `%s\n\x0`, string                               ; TODO2.2: afisati "Hello, World!" de N ori
                                    ; TODO2.1: afisati "Goodbye, World!"
exit:
    ret
