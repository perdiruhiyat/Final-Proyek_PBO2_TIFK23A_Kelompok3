package com.example.trsystem.repository;

import com.example.trsystem.model.RekapPerawatan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RekapPerawatanRepository extends JpaRepository<RekapPerawatan, Long> {
}
