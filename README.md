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

## 📌 Judul Studi Kasus

**Aplikasi TRSystem (Teknisi Rekap System)**

## 📝 Penjelasan Studi Kasus

TRSystem adalah aplikasi berbasis web yang digunakan untuk mencatat dan memantau aktivitas perawatan yang dilakukan oleh teknisi. Aplikasi ini memiliki fitur:

- Login user menggunakan Spring Security  
- CRUD data teknisi (User)  
- CRUD data Standar Waktu perbaikan  
- CRUD data Rekap Perawatan oleh teknisi  
- Statistik pekerjaan teknisi per bulan  

---

## 💡 Penjelasan 4 Pilar OOP dalam Studi Kasus

### 1. 🧬 Inheritance

Inheritance adalah pewarisan properti dan method dari sebuah class induk ke class turunannya. Dalam aplikasi ini, penerapan inheritance terlihat saat `UserService` mewarisi perilaku dari interface `UserDetailsService` milik Spring Security.

```java
public class UserService implements UserDetailsService {
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // implementasi login user
    }
}

### 2. 🧬 Encapsulation
Encapsulation berarti menyembunyikan data agar tidak bisa diakses langsung dari luar class, melainkan melalui getter dan setter. Ini dapat dilihat di model StandarWaktu yang memiliki field privat dan setter/getter.

public class StandarWaktu {
    private String deskripsi;
    private Integer waktu;

    public String getDeskripsi() {
        return deskripsi;
    }

    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }
}

### 3. 🧬 Polymorphs
Polymorphism memungkinkan sebuah objek memiliki banyak bentuk, biasanya melalui method overriding. Contohnya pada class UserService yang mengimplementasikan method loadUserByUsername dari UserDetailsService.

@Override
public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    User user = userRepository.findByUsername(username)
        .orElseThrow(() -> new UsernameNotFoundException("Username tidak ditemukan"));

    return new org.springframework.security.core.userdetails.User(
        user.getUsername(),
        user.getPassword(),
        Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + user.getRole()))
    );
}

### 4. 🧬 Abstraksi
Abstraksi menyembunyikan detail implementasi dan hanya menampilkan fungsi penting. Contohnya adalah penggunaan StandarWaktuService, di mana controller cukup memanggil method tanpa tahu bagaimana data disimpan di database

public void createStandarWaktu(String deskripsi, Integer waktu) {
    StandarWaktu sw = new StandarWaktu();
    sw.setDeskripsi(deskripsi);
    sw.setWaktu(waktu);
    swRepo.save(sw);
}

🎥 Demo Proyek
GitHub: Final-Proyek_PBO2_TIFK23A_Kelompok3

YouTube: Demo TRSystem
