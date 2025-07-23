package com.example.trsystem.service;

import com.example.trsystem.model.RekapPerawatan;
import com.example.trsystem.repository.RekapPerawatanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RekapPerawatanService {

    @Autowired
    private RekapPerawatanRepository rekapRepo;

    public List<RekapPerawatan> getAllRekap() {
        return rekapRepo.findAll();
    }

    public Optional<RekapPerawatan> getById(Long id) {
        return rekapRepo.findById(id);
    }

    public RekapPerawatan save(RekapPerawatan rekapPerawatan) {
        return rekapRepo.save(rekapPerawatan);
    }

    public void delete(Long id) {
        rekapRepo.deleteById(id);
    }
}
