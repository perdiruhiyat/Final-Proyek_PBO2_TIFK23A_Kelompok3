-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 22, 2025 at 03:55 PM
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
  `hardware_id` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hardware`
--

INSERT INTO `hardware` (`id`, `hardware_id`, `nama`, `tipe`, `kategori`) VALUES
(1, 'PC-001', 'Marketing 1', 'Intel Core i3-1240u 8GB', 'Komputer');

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
  `waktu_menit` int NOT NULL,
  `waktu` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `standar_waktu`
--

INSERT INTO `standar_waktu` (`id`, `deskripsi`, `waktu_menit`, `waktu`) VALUES
(1, 'Check & Repair HDD 250GB', 50, NULL),
(2, 'Check & Repair HDD 500GB', 100, NULL),
(3, 'Check & Repair HDD 1TB', 200, NULL),
(4, 'Check & Repair HDD 2TB', 400, NULL),
(5, 'Ganti Komponen Hardware (Plug & Play)', 20, NULL),
(6, 'Install OS Standard ADM', 120, NULL),
(7, 'Install OS Standard Non ADM', 240, NULL),
(8, 'Isi Ulang Tinta', 15, NULL),
(9, 'Isi Ulang Toner', 15, NULL),
(10, 'Isi Ulang/Ganti Pita', 20, NULL),
(11, 'Lain-lain', 120, NULL),
(12, 'Isi Ulang Tinta + Tindakan', 30, NULL),
(13, 'Isi Ulang Toner + Tindakan', 35, NULL),
(14, 'Ganti Komponen Hardware (Solder)', 45, NULL),
(15, 'Instalasi Jaringan/CCTV 60 Meter', 110, NULL),
(16, 'Instalasi Jaringan/CCTV 80 Meter', 180, NULL),
(17, 'Instalasi Jaringan/CCTV 100 Meter', 210, NULL),
(18, 'Troubleshoot + Pengujian', 300, NULL),
(19, 'Ganti Komponen Hardware (Plug & Play + Bongkar total)', 60, NULL),
(20, 'Ganti Komponen Hardware (Solder + Bongkar Total)', 80, NULL),
(21, 'Instalasi Acces Door', 180, NULL),
(22, 'Instalasi Acces Door + Bobok', 360, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `nama`, `password`, `role`) VALUES
(1, 'admin', 'Administrator', '$2a$12$SoTonQALCkGGAoeLSTh1WekVMfzCQtw8okG953Dq1sV5M3yaaWS8S', 'ADMIN'),
(2, 'perdi', 'Perdi Ruhiyat', '$2a$12$mdjE2EgnBfUgKPAuUnibpOrUt4CMYqsnEn.VAA/atHyXGxygC8maK', 'TEKNISI'),
(5, 'wendi', 'Wendi Rahmawan', '$2a$10$ZRCz42VRFIYI5DFapskmjedzob7P1mNMr2QpHlNO9XNS31fV3THHO', 'TEKNISI');

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
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rekap_perawatan`
--
ALTER TABLE `rekap_perawatan`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `standar_waktu`
--
ALTER TABLE `standar_waktu`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
