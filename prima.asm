section .data
    hello db "Masukkan angka (maks 20 digit): ", 0xA
    helloLen equ $ - hello

    no db "Bukan angka prima", 0xA
    noLen equ $ - no

    yes db "Angka prima", 0xA
    yesLen equ $ - yes

section .bss
    angka resb 20     ; buffer input angka

section .text
    global _start

_start:
    ; Tampilkan pesan input
    mov rax, 1              ; syscall: write
    mov rdi, 1              ; stdout
    mov rsi, hello
    mov rdx, helloLen
    syscall

    ; Baca input dari stdin
    mov rax, 0              ; syscall: read
    mov rdi, 0              ; stdin
    mov rsi, angka
    mov rdx, 20             ; max 20 bytes input
    syscall

    ; Konversi dari ASCII ke integer
    mov rsi, angka
    xor rax, rax            ; total = 0

.convert_loop:
    mov bl, byte [rsi]
    cmp bl, 0xA             ; newline?
    je .done_convert
    sub bl, '0'
    imul rax, rax, 10
    add rax, rbx
    inc rsi
    jmp .convert_loop

.done_convert:
    mov rsi, rax            ; simpan angka asli di rsi
    mov rcx, 2              ; divisor = 2

.check_loop:
    cmp rcx, rsi
    jge .is_prime

    mov rax, rsi
    xor rdx, rdx
    div rcx
    cmp rdx, 0
    je .not_prime

    inc rcx
    jmp .check_loop

.not_prime:
    mov rax, 1
    mov rdi, 1
    mov rsi, no
    mov rdx, noLen
    syscall
    jmp .exit

.is_prime:
    mov rax, 1
    mov rdi, 1
    mov rsi, yes
    mov rdx, yesLen
    syscall

.exit:
    mov rax, 60
    xor rdi, rdi
    syscall
