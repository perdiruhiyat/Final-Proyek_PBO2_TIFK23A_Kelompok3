-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 20, 2025 at 02:29 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trsystem_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `hardware`
--

CREATE TABLE `hardware` (
  `id` bigint NOT NULL,
  `hardware_id` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tipe` varchar(100) NOT NULL,
  `kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rekap_perawatan`
--

CREATE TABLE `rekap_perawatan` (
  `id` bigint NOT NULL,
  `hardware_id` bigint NOT NULL,
  `tanggal_laporan` date NOT NULL,
  `jam_laporan` time NOT NULL,
  `keterangan_masalah` text NOT NULL,
  `tanggal_pengerjaan` date NOT NULL,
  `jam_pengerjaan` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `istirahat` int DEFAULT '0',
  `durasi_pengerjaan` int DEFAULT NULL,
  `parameter_waktu` varchar(100) DEFAULT NULL,
  `standar_waktu_id` bigint DEFAULT NULL,
  `keterangan_perbaikan` text,
  `kategori_perbaikan` varchar(100) DEFAULT NULL,
  `nama_user` varchar(100) DEFAULT NULL,
  `teknisi_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `standar_waktu`
--

CREATE TABLE `standar_waktu` (
  `id` bigint NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `waktu_menit` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `nama`, `password`, `role`) VALUES
(1, 'admin', 'Administrator', '$2a$12$SoTonQALCkGGAoeLSTh1WekVMfzCQtw8okG953Dq1sV5M3yaaWS8S', 'ADMIN'),
(2, 'perdi', 'Perdi Ruhiyat', '$2a$12$mdjE2EgnBfUgKPAuUnibpOrUt4CMYqsnEn.VAA/atHyXGxygC8maK', 'TEKNISI');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hardware`
--
ALTER TABLE `hardware`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hardware_id` (`hardware_id`);

--
-- Indexes for table `rekap_perawatan`
--
ALTER TABLE `rekap_perawatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rekap_perawatan_ibfk_1` (`hardware_id`),
  ADD KEY `rekap_perawatan_ibfk_2` (`standar_waktu_id`),
  ADD KEY `rekap_perawatan_ibfk_3` (`teknisi_id`);

--
-- Indexes for table `standar_waktu`
--
ALTER TABLE `standar_waktu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hardware`
--
ALTER TABLE `hardware`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rekap_perawatan`
--
ALTER TABLE `rekap_perawatan`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `standar_waktu`
--
ALTER TABLE `standar_waktu`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rekap_perawatan`
--
ALTER TABLE `rekap_perawatan`
  ADD CONSTRAINT `rekap_perawatan_ibfk_1` FOREIGN KEY (`hardware_id`) REFERENCES `hardware` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rekap_perawatan_ibfk_2` FOREIGN KEY (`standar_waktu_id`) REFERENCES `standar_waktu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rekap_perawatan_ibfk_3` FOREIGN KEY (`teknisi_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
