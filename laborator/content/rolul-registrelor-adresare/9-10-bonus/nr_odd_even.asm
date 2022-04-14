%include "../utils/printf32.asm"

%define ARRAY_SIZE    10

section .data
    byte_array db 2, 2, 2, 2, 2, 2, 2, 1, 1, 1
    print_even db "The number of even elements is: ", 0
    print_odd db "The number of odd elements is: ", 0

section .text
    extern printf
    global main

main:
    push ebp
    mov ebp, esp

    mov ecx, ARRAY_SIZE
    xor eax, eax ; number of even elements
    xor ebx, ebx ; number of odd elements
    xor edx, edx ; current element

count_even_odd_elements:
    mov dl, byte [byte_array + ecx - 1]
    test dl, 1
    jnz add_odd
    jmp add_even

add_odd:
    inc ebx
    jmp end

add_even:
    inc eax
    jmp end

end:
    loop count_even_odd_elements

    PRINTF32 `%s\x0`, print_even
    PRINTF32 `%u\n\x0`, eax
    PRINTF32 `%s\x0`, print_odd
    PRINTF32 `%u\n\x0`, ebx

    xor eax, eax
    leave
    ret
