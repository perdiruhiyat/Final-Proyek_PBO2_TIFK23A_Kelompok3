# 📚 UAS Pemrograman Berorientasi Obyek 2

- **Mata Kuliah:** Pemrograman Berorientasi Obyek 2  
- **Dosen Pengampu:** [Muhammad Ikhwan Fathulloh](https://github.com/Muhammad-Ikhwan-Fathulloh)

## 👤 Profil
- **Kelompok 3**
- **Ketua**
- **Perdi Ruhiyat (23552011207)**
- **Anggota**
- **Wendi Rahmawan**
- **Yeremia Adrianto S (23552011227)**
- **Studi Kasus:** Aplikasi TRSystem (Teknisi Rekap System)

## 📋 Judul Studi Kasus

**TRSystem**: Aplikasi rekap perawatan perangkat keras (hardware) dengan autentikasi login, manajemen teknisi, dan standar waktu pengerjaan.

## 🧾 Penjelasan Studi Kasus

Aplikasi ini dibangun menggunakan Java Spring Boot dan MySQL dengan konsep MVC. Fitur utama aplikasi:

- Login & register user
- CRUD data perawatan
- Relasi antara `RekapPerawatan`, `StandarWaktu`, `User`, dan `Hardware`
- Dashboard jumlah perawatan berdasarkan status dan teknisi
- Role-based access (admin vs teknisi)

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
