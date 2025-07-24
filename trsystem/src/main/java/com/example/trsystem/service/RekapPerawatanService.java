package com.example.trsystem.service;

import com.example.trsystem.model.RekapPerawatan;
import com.example.trsystem.model.User;
import com.example.trsystem.repository.RekapPerawatanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Month;
import java.time.format.TextStyle;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;
import java.util.TreeMap;
import java.util.stream.Collectors;

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

    public List<RekapPerawatan> getRekapByTeknisi(User teknisi) {
        return rekapRepo.findByTeknisi(teknisi);
    }

    public long countRekapByTeknisi(User teknisi) {
        return rekapRepo.countByTeknisi(teknisi);
    }

    public long countByStatusAndTeknisi(String status, User teknisi) {
        return rekapRepo.countByStatusAndTeknisi(status, teknisi);
    }

    public Map<String, Long> getRekapPerMonthByTeknisi(User teknisi) {
        List<RekapPerawatan> rekapList = rekapRepo.findByTeknisi(teknisi);

        Map<Month, Long> monthMap = rekapList.stream()
        .collect(Collectors.groupingBy(
            r -> r.getTanggalLaporan().getMonth(),
            TreeMap::new,
            Collectors.counting()
        ));

        return monthMap.entrySet().stream()
        .collect(Collectors.toMap(
            e -> e.getKey().getDisplayName(TextStyle.FULL, new Locale("id")),
            Map.Entry::getValue,
            (v1, v2) -> v1,
            LinkedHashMap::new
        ));
    }

    public Map<String, Long> getRekapPerMonth() {
        List<RekapPerawatan> rekapList = rekapRepo.findAll();

        Map<Month, Long> monthMap = rekapList.stream()
        .collect(Collectors.groupingBy(
            r -> r.getTanggalLaporan().getMonth(),
            TreeMap::new,
            Collectors.counting()
        ));

        return monthMap.entrySet().stream()
        .collect(Collectors.toMap(
            e -> e.getKey().getDisplayName(TextStyle.FULL, new Locale("id")),
            Map.Entry::getValue,
            (v1, v2) -> v1,
            LinkedHashMap::new
        ));
    }
}
