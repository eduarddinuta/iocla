%include "../utils/printf32.asm"

section .data
source_text: db "ABCABCBABCBABCBBBABABBCBABCBAAACCCB", 0
substring: db "BABC", 0
len1 dd 36
len2 dd 4
print_format: db "Substring found at index: %d", 10, 0

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    ; TODO: Print the start indices for all occurrences of the substring in source_text
    mov edx, dword[len1]
    mov ebx, dword[len2]
    ; nu am reusit sa fac cu printf mi-a mers doar cu print32. cu printf mi se modifica tot dupa apel
search:
    dec edx
    cmp edx, 0
    jne comp
    jmp final

comp:
    xor ecx, ecx
    mov cl, byte[source_text + edx - 1]
    mov ch, byte[substring + ebx - 1]
    cmp ch, cl
    je substr
    mov ebx, dword[len2]
    jmp search

substr:
    dec ebx
    cmp ebx, 0
    je print_pos
    jmp search

print_pos:
    PRINTF32 `Substring found at index: %d\n\x0`, edx
    mov ebx, dword[len2]
    jmp search

final:

    xor eax, eax
    leave
    ret
