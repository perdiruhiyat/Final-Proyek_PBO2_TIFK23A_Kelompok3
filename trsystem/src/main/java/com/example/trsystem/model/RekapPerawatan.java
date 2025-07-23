package com.example.trsystem.model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "rekap_perawatan")
public class RekapPerawatan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "hardware_id", nullable = false)
    private Hardware hardware;

    private LocalDate tanggalLaporan;
    private LocalTime jamLaporan;
    private String keteranganMasalah;

    private LocalDate tanggalPengerjaan;
    private LocalTime jamPengerjaan;
    private LocalDate tanggalSelesai;
    private LocalTime jamSelesai;

    private int istirahat;
    private int durasiPengerjaan;

    @ManyToOne
    @JoinColumn(name = "standar_waktu_id", referencedColumnName = "id")
    private StandarWaktu standarWaktu;

    private String status;
    private String keteranganPerbaikan;
    private String kategoriPerbaikan;
    private String namaUser;

    @ManyToOne
    @JoinColumn(name = "teknisi_id", nullable = false)
    private User teknisi;
    
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Hardware getHardware() { return hardware; }
    public void setHardware(Hardware hardware) { this.hardware = hardware; }

    public LocalDate getTanggalLaporan() { return tanggalLaporan; }
    public void setTanggalLaporan(LocalDate tanggalLaporan) { this.tanggalLaporan = tanggalLaporan; }

    public LocalTime getJamLaporan() { return jamLaporan; }
    public void setJamLaporan(LocalTime jamLaporan) { this.jamLaporan = jamLaporan; }

    public String getKeteranganMasalah() { return keteranganMasalah; }
    public void setKeteranganMasalah(String keteranganMasalah) { this.keteranganMasalah = keteranganMasalah; }

    public LocalDate getTanggalPengerjaan() { return tanggalPengerjaan; }
    public void setTanggalPengerjaan(LocalDate tanggalPengerjaan) { this.tanggalPengerjaan = tanggalPengerjaan; }

    public LocalTime getJamPengerjaan() { return jamPengerjaan; }
    public void setJamPengerjaan(LocalTime jamPengerjaan) { this.jamPengerjaan = jamPengerjaan; }

    public LocalDate getTanggalSelesai() { return tanggalSelesai; }
    public void setTanggalSelesai(LocalDate tanggalSelesai) { this.tanggalSelesai = tanggalSelesai; }

    public LocalTime getJamSelesai() { return jamSelesai; }
    public void setJamSelesai(LocalTime jamSelesai) { this.jamSelesai = jamSelesai; }

    public Integer getIstirahat() { return istirahat; }
    public void setIstirahat(Integer istirahat) { this.istirahat = istirahat; }

    public Integer getDurasiPengerjaan() { return durasiPengerjaan; }
    public void setDurasiPengerjaan(Integer durasiPengerjaan) { this.durasiPengerjaan = durasiPengerjaan; }

    public StandarWaktu getStandarWaktu() { return standarWaktu; }
    public void setStandarWaktu(StandarWaktu standarWaktu) { this.standarWaktu = standarWaktu; }

     public String getStatus() {return status;}

    public void setStatus(String status) {this.status = status;}

    public String getKeteranganPerbaikan() { return keteranganPerbaikan; }
    public void setKeteranganPerbaikan(String keteranganPerbaikan) { this.keteranganPerbaikan = keteranganPerbaikan; }

    public String getKategoriPerbaikan() { return kategoriPerbaikan; }
    public void setKategoriPerbaikan(String kategoriPerbaikan) { this.kategoriPerbaikan = kategoriPerbaikan; }

    public String getNamaUser() { return namaUser; }
    public void setNamaUser(String namaUser) { this.namaUser = namaUser; }

     public User getTeknisi() {return teknisi; }

    public void setTeknisi(User teknisi) {this.teknisi = teknisi;}
}
