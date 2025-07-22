package com.example.trsystem.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.trsystem.model.StandarWaktu;

public interface StandarWaktuRepository extends JpaRepository<StandarWaktu, Long> {
    Optional<StandarWaktu> findByDeskripsi(String deskripsi);
}
