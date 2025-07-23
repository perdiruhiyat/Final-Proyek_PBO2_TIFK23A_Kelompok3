package com.example.trsystem.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.trsystem.model.StandarWaktu;
import com.example.trsystem.repository.StandarWaktuRepository;

@Service
public class StandarWaktuService {
    @Autowired
    private StandarWaktuRepository swRepo;

    public StandarWaktuService(StandarWaktuRepository swRepo) {
        this.swRepo = swRepo;
    }

    public List<StandarWaktu> getAllSw() {
        return swRepo.findAll();
    }

    public Optional<StandarWaktu> findById(Long id) {
        return swRepo.findById(id);
    }

    public void createStandarWaktu(String deskripsi, Integer waktu) {
        StandarWaktu sw = new StandarWaktu();
        sw.setDeskripsi(deskripsi);
        sw.setWaktu(waktu);
        swRepo.save(sw);
    }

    public void updateStandarWaktu(Long id, String deskripsi, Integer waktu){
        Optional<StandarWaktu> optionalSw = swRepo.findById(id);
        if (optionalSw.isPresent()) {
            StandarWaktu sw = optionalSw.get();
            sw.setDeskripsi(deskripsi);
            sw.setWaktu(waktu);
            swRepo.save(sw);;
        }
    }

    public void deleteStandarWaktu(Long id) {
        swRepo.deleteById(id);
    }
}
