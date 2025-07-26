# 📚 UAS Pemrograman Berorientasi Obyek 2

- **Mata Kuliah:** Pemrograman Berorientasi Obyek 2  
- **Dosen Pengampu:** [Muhammad Ikhwan Fathulloh](https://github.com/Muhammad-Ikhwan-Fathulloh)

## 👤 Profil
- **Kelompok 3**
- **Ketua**
  
  - **Perdi Ruhiyat (23552011207)**
- **Anggota**
  
   - **Wendi Rahmawan (23552011208)**
  
   - **Yeremia Adrianto S (23552011227)**
  
- **Studi Kasus:** Aplikasi TRSystem (Technical Report System)

## 📋 Judul Studi Kasus

**TRSystem**

## 🧾 Penjelasan Studi Kasus

Aplikasi TRSystem (singkatan dari Technical Report System) adalah sistem berbasis web yang digunakan untuk mencatat, mengelola, dan merekap aktivitas perawatan hardware oleh teknisi dalam sebuah organisasi. Sistem ini dirancang dengan pendekatan berbasis OOP (Object-Oriented Programming) dan dibangun menggunakan teknologi Spring Boot, Thymeleaf, dan MySQL. Aplikasi TRSystem dirancang dengan sistem login berbasis role, sehingga setiap jenis user memiliki hak akses dan fitur yang berbeda. Role yang digunakan adalah:


🎯 Role-Based Usage Aplikasi TRSystem

**Role :**

- Admin

- Teknisi
  

👑 Admin Role
    Admin memiliki akses penuh untuk mengelola data dan pengguna dalam sistem. Fitur-fitur yang dapat digunakan oleh Admin antara lain:

✅ Login Sebagai Admin
🔐 Autentikasi menggunakan username dan password terenkripsi dengan BCrypt.

👥 Manajemen User

  - Menambahkan user teknisi baru

  - Mengedit data user teknisi (nama, username, role)

  - Menghapus user teknisi

🛠️ Manajemen Data Hardware

  - Menambah, mengedit, dan menghapus data perangkat (hardware)

📊 Manajemen Standar Waktu Perawatan

  - Menambah, mengedit, dan menghapus standar waktu berdasarkan deskripsi aktivitas

📋 Monitoring Rekap Perawatan

  - Melihat semua rekap perawatan dari semua teknisi

  - Melihat status dan durasi perawatan teknisi

  - Melakukan validasi atau review data teknisi

🧑‍🔧 Teknisi Role
    Teknisi adalah user yang bertugas melakukan perawatan dan mengisi laporan melalui sistem. Fitur yang tersedia untuk teknisi antara lain:

✅ Login Sebagai Teknisi
🔐 Autentikasi untuk masuk dan mengakses halaman teknisi

📝 Input Rekap Perawatan

  - Mengisi tanggal dan waktu perawatan

  - Memilih hardware yang dirawat

  - Memasukkan deskripsi dan keterangan perawatan
  
  - Menentukan durasi dan status kegiatan

📜 Melihat Riwayat Rekap Pribadi

  - Menampilkan semua kegiatan perawatan yang pernah dilakukan

  - Melihat durasi dan hasil perawatan yang sudah diinput

⏱️ Standar Waktu Referensi

  - Dapat melihat standar waktu untuk tiap jenis kegiatan (untuk membandingkan durasi aktual)


## 💡 Penjelasan 4 Pilar OOP dalam Studi Kasus

### 1. 🧬 Inheritance

Inheritance adalah pewarisan properti dan method dari class lain. Dalam studi kasus ini, `UserService` mewarisi interface `UserDetailsService` milik Spring Security untuk keperluan autentikasi pengguna.

```java
public class UserService implements UserDetailsService {
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // implementasi method
    }
}
```

---

### 2. 🔒 Encapsulation

Encapsulation adalah membungkus data dan method dalam satu unit, serta menyembunyikan akses langsung ke data. Digunakan di model seperti `User`, di mana atribut dibuat `private` dan hanya dapat diakses lewat method getter/setter.

```java
public class User {
    private String username;
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
```

---

### 3. 🔁 Polymorphism

Polymorphism memungkinkan objek memiliki banyak bentuk. Contohnya, `UserService` mengimplementasikan interface `UserDetailsService`. Dengan ini, objek `UserService` bisa diperlakukan sebagai `UserDetailsService`.

```java
@Override
public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    return new org.springframework.security.core.userdetails.User(
        user.getUsername(),
        user.getPassword(),
        Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + user.getRole()))
    );
}
```

---

### 4. 🧩 Abstraction

Abstraction menyembunyikan detail implementasi. Contoh nyatanya adalah `UserRepository`, `RekapPerawatanRepository`, dan `StandarWaktuRepository` yang mewarisi dari `JpaRepository`. Kita bisa langsung menggunakan method seperti `findByUsername()` atau `findByTeknisi()` tanpa tahu bagaimana query SQL-nya dibuat.

```java
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);
}
```

---

## 🎥 Demo Proyek

<ul>
  <li><strong>GitHub:</strong> <a href="https:github.com/perdiruhiyat/Final-Proyek_PBO2_TIFK23A_Kelompok3">https://github.com/perdiruhiyat/Final-Proyek_PBO2_TIFK23A_Kelompok3</a></li>
  <li><strong>YouTube:</strong> 
</ul>
