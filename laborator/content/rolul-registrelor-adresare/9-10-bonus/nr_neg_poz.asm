%include "../utils/printf32.asm"

%define ARRAY_SIZE    10

section .data
    byte_array db 1, 2, 3, -4, -5, 6, 7, -8, -9, 10
    print_pos db "The number of positive elements is: ", 0
    print_neg db "The number of negative elements is: ", 0

section .text
    extern printf
    global main

main:
    push ebp
    mov ebp, esp

    mov ecx, ARRAY_SIZE
    xor eax, eax ; number of positive elements
    xor ebx, ebx ; number of negative elements
    xor edx, edx ; current element

count_poz_neg_elements:
    mov dl, byte [byte_array + ecx - 1]
    cmp dl, 0
    jl add_neg
    jmp add_poz

add_neg:
    inc ebx
    jmp end

add_poz:
    inc eax
    jmp end

end:
    loop count_poz_neg_elements

    PRINTF32 `%s\x0`, print_pos
    PRINTF32 `%u\n\x0`, eax
    PRINTF32 `%s\x0`, print_neg
    PRINTF32 `%u\n\x0`, ebx

    xor eax, eax
    leave
    ret
