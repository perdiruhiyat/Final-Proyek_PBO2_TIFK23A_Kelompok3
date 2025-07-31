# UAS Pemrograman Berorientasi Obyek 2

- **Mata Kuliah:** Pemrograman Berorientasi Obyek 2  
- **Dosen Pengampu:** [Muhammad Ikhwan Fathulloh](https://github.com/Muhammad-Ikhwan-Fathulloh)

## Profil
- **Kelompok 3**
- **Ketua**
  
  - **Perdi Ruhiyat (23552011207)**
- **Anggota**
  
   - **Wendi Rahmawan (23552011208)**
  
   - **Yeremia Adrianto S (23552011227)**
  
- **Studi Kasus:** Aplikasi TRSystem (Technical Report System)

## Judul Studi Kasus

**TRSystem - Technical Report System**

## Penjelasan Studi Kasus

TRSystem (Technical Report System) adalah aplikasi berbasis web yang dirancang untuk membantu proses pencatatan, pengelolaan, dan pelaporan kegiatan perawatan perangkat - perangkat yang ada oleh teknisi dalam sebuah organisasi atau perusahaan.

Aplikasi ini dibangun menggunakan pendekatan **Object-Oriented Programming (OOP)** dengan stack teknologi:
- Spring Boot  
- Thymeleaf  
- MySQL 

Aplikasi ini juga menerapkan **role-based login** agar setiap jenis pengguna memiliki hak akses yang sesuai.

### Role Akses

#### 1. Admin
Admin memiliki hak akses penuh terhadap sistem.

**Fitur Admin:**
- Login dengan autentikasi terenkripsi (BCrypt)
- Manajemen User Teknisi:
  - Tambah/Edit/Hapus user
- Manajemen Data Hardware:
  - Tambah/Edit/Hapus hardware
- Manajemen Standar Waktu:
  - Tambah/Edit/Hapus standar waktu / parameter waktu pengerjaan
- Monitoring Rekap:
  - Melihat semua rekap teknisi
  - Melihat durasi dan status kegiatan
  - Review/Validasi data teknisi
  - Export Rekap Perawatan

#### 2. Teknisi
Teknisi hanya memiliki akses untuk input dan melihat data miliknya sendiri.

**Fitur Teknisi:**
- Login sebagai teknisi
- Lihat Data Hardware
- Input Rekap Perawatan:
  - Tambah/Edit/Hapus Rekap Perawatan
- Lihat Riwayat Rekap Pribadi
## Penjelasan 4 Pilar OOP dalam Studi Kasus

### 1. Inheritance

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

### 2. Encapsulation

Encapsulation adalah membungkus data dan method dalam satu unit, serta menyembunyikan akses langsung ke data.Setiap class model seperti `User`, `Hardware`, dan `RekapPerawatan` menggunakan modifier `private` untuk field-nya dan menyediakan getter/setter sebagai akses.
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

### 3. Polymorphism

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

### 4. Abstraction

Abstraction menyembunyikan detail implementasi. Contoh nyatanya adalah `UserRepository`, `RekapPerawatanRepository`, dan `StandarWaktuRepository` yang mewarisi dari `JpaRepository`. Kita bisa langsung menggunakan method seperti `findByUsername()` atau `findByTeknisi()` tanpa tahu bagaimana query SQL-nya dibuat.

```java
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);
}
```

Selain dari UserRepository, abstraksi juga diterapkan pada beberapa service seperti HardwareService dan RekapPerawatanService.Pada contoh ini, pengguna service tidak perlu mengetahui bagaimana `findAll()` atau `deleteById()` bekerja. Mereka cukup memanggil method `getAllHardware()` atau `deleteHardware()` yang menyederhanakan penggunaan logika database.
```java
@Service
public class HardwareService {

    @Autowired
    private HardwareRepository hwRepo;

    public List<Hardware> getAllHardware() {
        return hwRepo.findAll();
    }

    public void deleteHardware(Long id) {
        hwRepo.deleteById(id);
    }

    // dst...
}

```

---



## 🎥 Demo Proyek

<ul>
  <li><strong>GitHub:</strong> <a href="https://github.com/perdiruhiyat/UAS_PBO2_TIFK23A_Kelompok3.git">Github</a></li>
  <li><strong>Google Drive:</strong> <a href="https://drive.google.com/drive/folders/1xX5S-G0BUNAkuJnKovUl855w5K4thdGj?usp=sharing">Google Drive</a></li>
</ul>
