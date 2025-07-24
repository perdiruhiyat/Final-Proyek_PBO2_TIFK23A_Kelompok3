package com.example.trsystem.repository;

import com.example.trsystem.model.RekapPerawatan;
import com.example.trsystem.model.User;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RekapPerawatanRepository extends JpaRepository<RekapPerawatan, Long> {
    List<RekapPerawatan> findByTeknisi(User teknisi);
    long countByTeknisi(User teknisi);
    long countByStatusAndTeknisi(String status, User teknisi);
}
