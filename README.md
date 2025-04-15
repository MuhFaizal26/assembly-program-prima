# assembly-program-prima

# Menjalankan Program Assembly di Kali Linux
![be05cc39-c6db-4ce8-be03-778df3dcd3c2](https://github.com/user-attachments/assets/758a9c60-7d43-48fe-93e8-16b67cb878f5)

# 🔢 Pengecek Angka Prima dengan x86-64 Assembly

Ini adalah program **Assembly (NASM)** sederhana yang dijalankan di Linux untuk memeriksa apakah input angka dari pengguna merupakan **bilangan prima** atau bukan.

## 🧠 Alur Program

### 1. Menampilkan Pesan Input

```asm
mov rax, 1          ; syscall write
mov rdi, 1          ; stdout
mov rsi, hello      ; pesan "Masukkan angka..."
mov rdx, helloLen
syscall
Menampilkan instruksi agar user memasukkan angka.

mov rax, 0      ; syscall read
mov rdi, 0      ; stdin
mov rsi, angka  ; buffer input
mov rdx, 20     ; baca maks 20 karakter
syscall
Membaca input user ke dalam buffer angka.

.convert_loop:
    ...
    sub bl, '0'         ; ubah ASCII ke angka
    imul rax, rax, 10   ; kalikan total dengan 10
    add rax, rbx        ; tambahkan digit baru
Loop ini akan membaca digit demi digit, mengubah dari karakter ASCII ke integer asli.

mov rcx, 2
.check_loop:
    ...
    div rcx
    cmp rdx, 0
    je .not_prime
Loop sederhana: membagi angka input (rsi) dengan semua angka dari 2 sampai n-1.

Jika ada sisa 0 → bukan prima

Jika tidak ada → prima

Output Hasil
.not_prime:
    mov rsi, no   ; tampilkan "Bukan angka prima"

.is_prime:
    mov rsi, yes  ; tampilkan "Angka prima"

---

## 💡 Contoh Penggunaan

```bash
$ ./prime_checker
Masukkan angka (maks 20 digit):
3
Angka prima

$ ./prime_checker
Masukkan angka (maks 20 digit):
20
Bukan angka prima

