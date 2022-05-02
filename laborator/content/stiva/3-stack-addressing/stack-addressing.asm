%include "../utils/printf32.asm"

%define NUM 5
   
section .text

extern printf
global main
main:
    mov ebp, esp

    ; TODO 1: replace every push by an equivalent sequence of commands (use direct addressing of memory. Hint: esp)
    mov ecx, NUM
push_nums:
    sub esp, 4
    mov [esp], ecx
    loop push_nums

    sub esp, 16
    mov byte[esp + 12], 0

    mov dword[esp + 8], 'mere'

    mov dword[esp + 4], 'are '

    mov dword[esp], 'Ana '

    lea esi, [esp]
    PRINTF32 `%s\n\x0`, esi

    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    ; use PRINTF32 macro - see format above
    mov eax, esp;
print_stuff:
    cmp eax, ebp
    je final
    PRINTF32 `0x%x: \x0`, eax 
    PRINTF32 `%hhu\n\x0`, [eax]
    inc eax
    jmp print_stuff
final:

    ; TODO 3: print the string
    mov eax, esp;
    lea ebx, [esp + 12];
print_string:
    cmp eax, ebx
    je final1
    PRINTF32 `%c\x0`, [eax]
    inc eax
    jmp print_string
final1: 
    PRINTF32 `\n\x0`

    ; TODO 4: print the array on the stack, element by element.
    lea eax, [esp + 16];
print_int:
    cmp eax, ebp
    je final2
    PRINTF32 `%hhu \x0`, [eax]
    add eax, 4
    jmp print_int
final2:
    PRINTF32 `\n\x0`
    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
