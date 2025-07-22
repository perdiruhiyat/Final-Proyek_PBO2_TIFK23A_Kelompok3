package com.example.trsystem.repository;

import com.example.trsystem.model.Hardware;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface HardwareRepository extends JpaRepository<Hardware, Long> {
    Optional<Hardware> findByHardwareId(String hardwareId);
}
