%include "printf32.asm"

section .text
    global main
    extern printf

main:
    ;cele doua multimi se gasesc in eax si ebx
    mov eax, 139
    mov ebx, 169
    PRINTF32 `%u\n\x0`, eax ; afiseaza prima multime
    PRINTF32 `%u\n\x0`, ebx ; afiseaza cea de-a doua multime

    ; TODO1: reuniunea a doua multimi
    mov ecx, eax
    or ecx, ebx
    PRINTF32 `Reuniunea este: \x0`
    PRINTF32 `%u\n\x0`, ecx
    ; TODO2: adaugarea unui element in multime
    or eax, 4
    PRINTF32 `%u\n\x0`, ecx
    ; TODO3: intersectia a doua multimi
    mov ecx, eax
    and eax, ebx
    PRINTF32 `intersectia este: \x0`
    PRINTF32 `%u\n\x0`, ecx

    ; TODO4: complementul unei multimi
    mov ecx, eax
    not ecx
    PRINTF32 `Complementul este: \x0`
    PRINTF32 `%u\n\x0`, ecx
    ; TODO5: eliminarea unui element
    mov ecx, 2
    not ecx
    and eax, ecx
    PRINTF32 `%u\n\x0`, eax
    ; TODO6: diferenta de multimi EAX-EBX
    push ebx
    not ebx
    push eax
    and eax, ebx
    PRINTF32 `Diferenta este: \x0`
    PRINTF32 `%u\n\x0`, eax
    pop eax
    pop ebx

    xor eax, eax
    ret
