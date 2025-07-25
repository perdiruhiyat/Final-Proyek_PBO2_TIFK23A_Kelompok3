package com.example.trsystem.repository;

import com.example.trsystem.model.Hardware;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface HardwareRepository extends JpaRepository<Hardware, Long> {
    Optional<Hardware> findByHardwareId(String hardwareId);
    long countByKategori(String kategori);
    
    @Query("SELECT MAX(CAST(SUBSTRING(h.hardwareId, LENGTH(:prefix) + 2) AS int)) " +
       "FROM Hardware h WHERE h.hardwareId LIKE CONCAT(:prefix, '-%')")
    Integer findMaxNumberByPrefix(@Param("prefix") String prefix);


}
