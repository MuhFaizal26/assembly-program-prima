# assembly-program-prima

# Menjalankan Program Assembly di Kali Linux
![be05cc39-c6db-4ce8-be03-778df3dcd3c2](https://github.com/user-attachments/assets/758a9c60-7d43-48fe-93e8-16b67cb878f5)

# 🔢 Pengecek Angka Prima dengan x86-64 Assembly

Program sederhana namun powerful ini memungkinkan kamu untuk **memasukkan angka (maksimal 20 digit)** dan memeriksa apakah angka tersebut **bilangan prima** atau bukan. Ditulis sepenuhnya menggunakan **bahasa Assembly x86-64 (sintaks NASM)** untuk sistem operasi Linux. 🧠💻

## 🧠 Cara Kerja

### ✅ Alur Langkah demi Langkah

1. **Tampilkan Permintaan Input**  
   Menampilkan pesan berikut:


2. **Menerima Input dari Pengguna**  
Program menunggu kamu mengetik angka dan menekan Enter. Input tersebut disimpan dalam buffer.

3. **Konversi dari ASCII ke Integer**  
Input berupa teks seperti `"123\n"` akan dikonversi menjadi angka asli di register.

4. **Pemeriksaan Bilangan Prima**  
Pemeriksaan dilakukan dengan cara sederhana:
- Mulai dari angka 2
- Bagi angka yang dimasukkan dengan angka-angka berturut-turut (2, 3, 4, ...)
- Jika hasil bagi **tidak bersisa**, maka bukan prima
- Jika tidak ada pembagi yang cocok sampai akhir, maka itu angka prima!

5. **Tampilkan Hasil**  
- Jika bukan prima:
  ```
  Bukan angka prima
  ```
- Jika prima:
  ```
  Angka prima
  ```

6. **Keluar dari Program Secara Bersih**

---

## 🔧 Penjelasan Tiap Bagian

### `.data`
Menyimpan pesan statis:
- `hello`: pesan untuk meminta input
- `no`: pesan jika angka bukan prima
- `yes`: pesan jika angka adalah prima

### `.bss`
Mendeklarasikan `angka`, sebuah buffer 20 byte untuk menampung input.

### `.text`
Bagian utama dari program.

#### `_start`
Titik masuk program, berisi:
- Syscall untuk menampilkan pesan dan membaca input
- Logika konversi string ke angka
- Perulangan pengecekan angka prima
- Menampilkan hasil
- Keluar dari program

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

