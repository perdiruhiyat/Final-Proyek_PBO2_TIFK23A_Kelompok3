package com.example.trsystem.repository;

import com.example.trsystem.model.RekapPerawatan;
import com.example.trsystem.model.User;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RekapPerawatanRepository extends JpaRepository<RekapPerawatan, Long> {
    List<RekapPerawatan> findByTeknisiOrderByTanggalLaporanAsc(User teknisi);
    List<RekapPerawatan> findAllByOrderByTanggalLaporanAsc();
    long countByTeknisi(User teknisi);
    long countByStatusAndTeknisi(String status, User teknisi);
    @Query(value = """
    SELECT u.nama 
    FROM rekap_perawatan r 
    JOIN users u ON r.teknisi_id = u.id 
    WHERE MONTH(r.tanggal_laporan) = :bulan 
    GROUP BY u.nama 
    ORDER BY COUNT(*) DESC 
    LIMIT 1
    """, nativeQuery = true)
    List<String> findMostContributorByMonth(@Param("bulan") int bulan);

}
