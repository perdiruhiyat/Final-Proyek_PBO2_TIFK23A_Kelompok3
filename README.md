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
  
- **Studi Kasus:** Aplikasi TRSystem (Teknisi Rekap System)

## 📋 Judul Studi Kasus

**TRSystem**: Aplikasi rekap perawatan perangkat keras (hardware) dengan autentikasi login, manajemen teknisi, dan standar waktu pengerjaan.

## 🧾 Penjelasan Studi Kasus

Aplikasi TRSystem (singkatan dari Technical Report System) adalah sistem berbasis web yang digunakan untuk mencatat, mengelola, dan merekap aktivitas perawatan hardware oleh teknisi dalam sebuah organisasi. Sistem ini dirancang dengan pendekatan berbasis OOP (Object-Oriented Programming) dan dibangun menggunakan teknologi Spring Boot, Thymeleaf, dan MySQL.

Fitur utama dari aplikasi ini meliputi:

✅ Login User (dengan enkripsi password)

👥 Manajemen user (Admin dapat menambahkan/mengedit user teknisi)

🛠️ Manajemen data hardware

📊 Standar waktu perawatan berdasarkan jenis aktivitas

📋 Rekap perawatan oleh teknisi yang mencatat aktivitas seperti:

- Tanggal & jam perawatan

- Durasi dan status

- Hardware terkait

- Keterangan tambahan

🔎 Fitur filter dan rekap berdasarkan teknisi maupun status

🔐 Otentikasi & otorisasi menggunakan Spring Security

Aplikasi ini tidak hanya sebagai alat pencatat kerja teknisi, tetapi juga sebagai alat evaluasi performa kerja melalui perbandingan durasi aktual perawatan dengan standar waktu yang telah ditentukan.

Sistem ini dirancang dengan arsitektur MVC (Model-View-Controller) dan memanfaatkan fitur OOP seperti inheritance, encapsulation, polymorphism, dan abstraction agar kode tetap modular, reusable, dan maintainable.
---

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
