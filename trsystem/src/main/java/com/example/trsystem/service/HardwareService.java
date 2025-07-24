package com.example.trsystem.service;

import com.example.trsystem.model.Hardware;
import com.example.trsystem.repository.HardwareRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class HardwareService {

    @Autowired
    private HardwareRepository hardwareRepository;

    /**
     * Mengambil semua data hardware dari database.
     * @return List semua objek Hardware.
     */
    public List<Hardware> getAllHardware() {
        return hardwareRepository.findAll();
    }

    /**
     * Membuat dan menyimpan data hardware baru.
     * @param hardwareId ID unik untuk hardware.
     * @param nama Nama hardware.
     * @param tipe Tipe atau model hardware.
     * @param kategori Kategori hardware.
     */
    public void createHardware(String hardwareId, String nama, String tipe, String kategori) {
        Hardware hardware = new Hardware();
        hardware.setHardwareId(hardwareId);
        hardware.setNama(nama);
        hardware.setTipe(tipe);
        hardware.setKategori(kategori);
        hardwareRepository.save(hardware);
    }

    /**
     * Mengambil satu data hardware berdasarkan ID primary key.
     * @param id Primary key dari hardware.
     * @return Optional yang berisi objek Hardware jika ada.
     */
    public Optional<Hardware> getHardwareById(Long id) {
        return hardwareRepository.findById(id);
    }

    /**
     * Menghapus data hardware berdasarkan ID.
     * @param id Primary key dari hardware yang akan dihapus.
     */
    public void deleteHardware(Long id) {
        hardwareRepository.deleteById(id);
    }

    /**
     * Memperbarui data hardware yang sudah ada.
     * @param id Primary key dari hardware yang akan diupdate.
     * @param hardwareId ID unik baru.
     * @param nama Nama baru.
     * @param tipe Tipe baru.
     * @param kategori Kategori baru.
     */
    public void updateHardware(Long id, String hardwareId, String nama, String tipe, String kategori) {
        // Cari hardware berdasarkan ID
        Optional<Hardware> optionalHardware = hardwareRepository.findById(id);
        
        // Jika hardware ditemukan, update nilainya
        if (optionalHardware.isPresent()) {
            Hardware hardware = optionalHardware.get();
            hardware.setHardwareId(hardwareId);
            hardware.setNama(nama);
            hardware.setTipe(tipe);
            hardware.setKategori(kategori);
            hardwareRepository.save(hardware); // Simpan perubahan
        }
    }

    /**
     * Mencari hardware berdasarkan hardwareId unik.
     * @param hardwareId ID unik yang ingin dicari.
     * @return Optional yang berisi objek Hardware jika ditemukan.
     */
    public Optional<Hardware> findByHardwareId(String hardwareId) {
        return hardwareRepository.findByHardwareId(hardwareId);
    }

    public String generateHardwareId(String kategori) {
    String prefix = switch (kategori.toLowerCase()) {
        case "komputer", "laptop" -> "PC";
        case "printer" -> "PR";
        case "cctv" -> "CAM";
        case "switch" -> "SW";
        case "switch poe" -> "SWP";
        case "access point" -> "AP";
        case "mesin absen" -> "MA";
        default -> "HW";
    };

    long count = hardwareRepository.countByKategori(kategori);
        return String.format("%s-%03d", prefix, count + 1);
    }

    public Map<String, Long> getKategoriChart() {
        Map<String, Long> data = new LinkedHashMap<>();

        List<String> kategoriList = List.of("Komputer", "Laptop", "Printer", "Access Point", "Mesin Absen", "Switch", "Switch PoE", "CAM");

        for (String kategori : kategoriList) {
            long jumlah = hardwareRepository.countByKategori(kategori);
            data.put(kategori, jumlah);
        }

        return data;
    }
}