-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 24, 2025 at 05:02 PM
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
  `hardware_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hardware`
--

INSERT INTO `hardware` (`id`, `hardware_id`, `nama`, `tipe`, `kategori`) VALUES
(1, 'PC-001', 'Marketing 1', 'Intel Core i3-1240u 8GB', 'Laptop'),
(2, 'PC-002', 'Marketing 2', 'Intel Core i5-1145G7 8GB', 'Laptop'),
(3, 'PC-003', 'Finance 1', 'Intel Core i5-1240p 16GB', 'Komputer'),
(4, 'PC-004', 'Finance 2', 'Intel Core i3-10110U 4GB', 'Komputer'),
(5, 'PC-005', 'HRD 1', 'Intel Core i7-1165G7 8GB', 'Laptop'),
(6, 'PC-006', 'HRD 2', 'AMD Ryzen 5 5500U 8GB', 'Komputer'),
(7, 'PC-007', 'Gudang 1', 'Intel Core i5-8250U 8GB', 'Komputer'),
(8, 'PC-008', 'Gudang 2', 'Intel Core i3-8145U 4GB', 'Komputer'),
(9, 'PC-009', 'Teknisi 1', 'Intel Core i5-1235U 16GB', 'Komputer'),
(10, 'PC-010', 'Teknisi 2', 'AMD Ryzen 7 5700U 16GB', 'Laptop'),
(11, 'PR-001', 'Printer Marketing', 'Epson L3210 All-in-One', 'Printer'),
(12, 'PR-002', 'Printer Finance', 'Canon PIXMA G2020', 'Printer'),
(13, 'PR-003', 'Printer HRD', 'Brother HL-L2321D Mono Laser', 'Printer'),
(14, 'AP-001', 'Access Point Lantai 1', 'Ubiquiti UniFi AP AC Lite', 'Access Point'),
(15, 'AP-002', 'Access Point Lantai 2', 'TP-Link EAP225', 'Access Point'),
(16, 'AP-003', 'Access Point Gudang', 'Ubiquiti Unifi U6-LR AC', 'Access Point'),
(17, 'MA-001', 'Mesin Absen Kantor', 'Solution X601 Face + Fingerprint', 'Mesin Absen'),
(18, 'MA-002', 'Mesin Absen Gudang', 'Innovation F202 Face + RFID', 'Mesin Absen'),
(19, 'SW-001', 'Switch Lantai 1', 'TP-Link TL-SF1016D 16-Port', 'Switch'),
(20, 'SW-002', 'Switch Lantai 2', 'D-Link DES-1024D 24-Port', 'Switch'),
(21, 'SWP-001', 'PoE Switch Server Room', 'TP-Link TL-SF1008P 8-Port PoE', 'Switch PoE'),
(22, 'SWP-002', 'PoE Switch Lantai 3', 'Ubiquiti UniFi Switch 8 PoE-60W', 'Switch PoE'),
(23, 'CAM-001', 'CAM Depan Kantor', 'Dahua IPC-HFW1230S1P 2MP', 'CCTV'),
(24, 'CAM-002', 'CAM Belakang Kantor', 'Hikvision DS-2CE16D0T-IRPF 2MP', 'CCTV'),
(25, 'CAM-003', 'CAM Gudang', 'Ezviz C3WN 2MP Wi-Fi', 'CCTV'),
(26, 'CAM-004', 'CAM Depan Gudang', 'Hikvision DS-2CE56D0T-IRF 2MP', 'CCTV'),
(27, 'CAM-005', 'CAM Ruang Server', 'Dahua IPC-C22EP-IMOU 2MP Wi-Fi', 'CCTV'),
(28, 'CAM-006', 'CAM Pos Satpam', 'Ezviz C6N 2MP PTZ', 'CCTV'),
(29, 'CAM-007', 'CAM Ruang Meeting', 'Hikvision DS-2CD1023G0E-I 2MP', 'CCTV'),
(30, 'CAM-008', 'CAM Parkiran Motor', 'Dahua HAC-HFW1200TLP 2MP', 'CCTV'),
(31, 'CAM-009', 'CAM Pintu Masuk Utama', 'Hikvision DS-2CE76D0T-ITPFS 2MP Mic', 'CCTV'),
(32, 'CAM-010', 'CAM Kantin', 'Xiaomi Mi Home Security Camera 360° 2MP', 'CCTV');

-- --------------------------------------------------------

--
-- Table structure for table `rekap_perawatan`
--

CREATE TABLE `rekap_perawatan` (
  `id` bigint NOT NULL,
  `hardware_id` bigint NOT NULL,
  `tanggal_laporan` date NOT NULL,
  `jam_laporan` time NOT NULL,
  `keterangan_masalah` varchar(255) DEFAULT NULL,
  `tanggal_pengerjaan` date NOT NULL,
  `jam_pengerjaan` time NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `jam_selesai` time NOT NULL,
  `istirahat` int DEFAULT '0',
  `durasi_pengerjaan` int DEFAULT NULL,
  `standar_waktu_id` bigint DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `keterangan_perbaikan` varchar(255) DEFAULT NULL,
  `kategori_perbaikan` varchar(255) DEFAULT NULL,
  `nama_user` varchar(255) DEFAULT NULL,
  `teknisi_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rekap_perawatan`
--

INSERT INTO `rekap_perawatan` (`id`, `hardware_id`, `tanggal_laporan`, `jam_laporan`, `keterangan_masalah`, `tanggal_pengerjaan`, `jam_pengerjaan`, `tanggal_selesai`, `jam_selesai`, `istirahat`, `durasi_pengerjaan`, `standar_waktu_id`, `status`, `keterangan_perbaikan`, `kategori_perbaikan`, `nama_user`, `teknisi_id`) VALUES
(1, 1, '2025-07-23', '17:02:00', 'tes', '2025-07-23', '17:05:00', '2025-07-23', '17:55:00', 0, 50, 11, 'Tepat Waktu', 'tes', 'Hardware', 'tes', 2),
(2, 1, '2025-07-23', '18:45:00', 'tes2', '2025-07-23', '18:46:00', '2025-07-23', '20:36:00', 0, 110, 6, 'Tepat Waktu', 'tes2', 'Software', 'tes', 2),
(3, 1, '2025-07-23', '19:04:00', 'tes3', '2025-07-23', '19:04:00', '2025-07-23', '20:04:00', 0, 60, 11, 'Tepat Waktu', 'tes3', 'Software', 'tes', 2),
(6, 2, '2025-07-24', '09:15:00', 'BSOD saat booting', '2025-07-24', '09:30:00', '2025-07-24', '10:30:00', 10, 50, 6, 'Tepat Waktu', 'Install ulang OS dan scan malware', 'Software', 'admin1', 2),
(7, 7, '2025-07-22', '13:00:00', 'Kipas berisik', '2025-07-22', '13:15:00', '2025-07-22', '14:00:00', 5, 40, 4, 'Tepat Waktu', 'Ganti kipas casing', 'Hardware', 'admin2', 5),
(8, 5, '2025-07-20', '08:45:00', 'Tidak bisa konek ke internet', '2025-07-20', '09:00:00', '2025-07-20', '09:30:00', 0, 30, 9, 'Tepat Waktu', 'Periksa konfigurasi jaringan & reset adapter', 'Jaringan', 'admin3', 2),
(9, 23, '2025-07-18', '15:00:00', 'Gambar tidak muncul', '2025-07-18', '15:15:00', '2025-07-18', '16:00:00', 10, 35, 10, 'Tepat Waktu', 'Ganti kabel BNC dan power', 'CCTV', 'security1', 5),
(10, 24, '2025-07-17', '10:10:00', 'Sudut kamera berubah sendiri', '2025-07-17', '10:30:00', '2025-07-17', '11:15:00', 5, 40, 11, 'Tepat Waktu', 'Rekalibrasi bracket & ganti baut', 'CCTV', 'security2', 2),
(11, 19, '2025-07-19', '14:00:00', 'Port 3 mati', '2025-07-19', '14:15:00', '2025-07-19', '15:00:00', 10, 35, 8, 'Tepat Waktu', 'Ganti switch dengan cadangan', 'Jaringan', 'admin-jaringan', 5),
(12, 18, '2025-07-21', '07:30:00', 'Fingerprint error', '2025-07-21', '07:45:00', '2025-07-21', '08:30:00', 5, 40, 12, 'Tepat Waktu', 'Reset sensor dan update firmware', 'Absensi', 'hrd1', 2),
(13, 21, '2025-07-23', '16:00:00', 'Tidak supply PoE ke IP Phone', '2025-07-23', '16:15:00', '2025-07-23', '17:10:00', 10, 45, 7, 'Tepat Waktu', 'Perbaikan modul power PoE', 'Jaringan', 'admin-voip', 5),
(14, 4, '2025-07-20', '11:00:00', 'Lemot saat buka Excel', '2025-07-20', '11:15:00', '2025-07-20', '12:00:00', 5, 40, 6, 'Tepat Waktu', 'Upgrade RAM & install ulang Office', 'Software', 'admin4', 2),
(15, 8, '2025-07-19', '10:00:00', 'Layar tidak menyala', '2025-07-19', '10:15:00', '2025-07-19', '11:00:00', 5, 40, 5, 'Tepat Waktu', 'Ganti kabel VGA dan cek PSU', 'Hardware', 'admin5', 5),
(16, 3, '2025-08-02', '09:00:00', 'Suhu CPU tinggi', '2025-08-02', '09:20:00', '2025-08-02', '10:00:00', 10, 30, 6, 'Tepat Waktu', 'Ganti thermal paste dan bersihkan heatsink', 'Hardware', 'admin6', 2),
(17, 25, '2025-08-05', '14:30:00', 'Gambar buram', '2025-08-05', '14:45:00', '2025-08-05', '15:30:00', 5, 40, 10, 'Tepat Waktu', 'Bersihkan lensa & atur fokus', 'CCTV', 'security3', 5),
(18, 20, '2025-08-10', '08:00:00', 'Switch tidak merespons', '2025-08-10', '08:15:00', '2025-08-10', '09:00:00', 5, 40, 8, 'Tepat Waktu', 'Hard reset dan update firmware', 'Jaringan', 'admin-jaringan', 2),
(19, 6, '2025-08-12', '13:00:00', 'Popup iklan muncul terus', '2025-08-12', '13:15:00', '2025-08-12', '14:00:00', 5, 40, 9, 'Tepat Waktu', 'Scan adware & reset browser', 'Software', 'admin7', 5),
(20, 17, '2025-08-14', '10:30:00', 'Layar touchscreen tidak merespons', '2025-08-14', '10:45:00', '2025-08-14', '11:30:00', 5, 40, 12, 'Tepat Waktu', 'Kalibrasi layar dan update driver', 'Absensi', 'hrd2', 2),
(21, 26, '2025-09-03', '11:30:00', 'Kabel power longgar', '2025-09-03', '11:45:00', '2025-09-03', '12:15:00', 5, 25, 11, 'Tepat Waktu', 'Ganti konektor dan ikat kabel ulang', 'CCTV', 'security4', 5),
(22, 22, '2025-09-07', '09:00:00', 'Broadcast storm terdeteksi', '2025-09-07', '09:15:00', '2025-09-07', '10:00:00', 5, 40, 7, 'Tepat Waktu', 'Disable port looping dan update VLAN', 'Jaringan', 'admin-net', 2),
(23, 9, '2025-09-10', '15:00:00', 'No bootable device', '2025-09-10', '15:15:00', '2025-09-10', '16:00:00', 5, 40, 5, 'Tepat Waktu', 'Cek BIOS dan pasang ulang HDD', 'Hardware', 'admin8', 5),
(24, 10, '2025-09-13', '10:00:00', 'Auto restart saat digunakan', '2025-09-13', '10:15:00', '2025-09-13', '11:00:00', 5, 40, 6, 'Tepat Waktu', 'Ganti PSU dan cek suhu', 'Hardware', 'admin9', 2),
(25, 27, '2025-09-15', '08:45:00', 'Delay video cukup besar', '2025-09-15', '09:00:00', '2025-09-15', '09:45:00', 5, 40, 10, 'Tepat Waktu', 'Reset DVR & ganti kabel LAN', 'CCTV', 'security5', 5),
(26, 25, '2025-03-10', '10:15:00', 'Masalah pada Instalasi Acces Door', '2025-03-10', '10:15:00', '2025-03-10', '11:15:00', 5, 60, 21, 'Tepat Waktu', 'Perbaikan untuk Instalasi Acces Door', 'CCTV', 'security1', 2),
(27, 6, '2025-01-25', '09:00:00', 'Masalah pada Install OS Standard ADM', '2025-01-25', '09:00:00', '2025-01-25', '10:30:00', 10, 90, 6, 'Tepat Waktu', 'Perbaikan untuk Install OS Standard ADM', 'Software', 'admin2', 5),
(28, 19, '2025-02-15', '13:00:00', 'Masalah pada Instalasi Jaringan/CCTV 80 Meter', '2025-02-15', '13:00:00', '2025-02-15', '14:30:00', 5, 85, 16, 'Terlambat', 'Perbaikan untuk Instalasi Jaringan/CCTV 80 Meter', 'Jaringan', 'admin-jaringan', 2),
(29, 11, '2025-05-12', '08:30:00', 'Masalah pada Isi Ulang Toner', '2025-05-12', '08:30:00', '2025-05-12', '09:00:00', 0, 30, 9, 'Tepat Waktu', 'Perbaikan untuk Isi Ulang Toner', 'Printer', 'admin3', 5);

-- --------------------------------------------------------

--
-- Table structure for table `standar_waktu`
--

CREATE TABLE `standar_waktu` (
  `id` bigint NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `waktu` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `standar_waktu`
--

INSERT INTO `standar_waktu` (`id`, `deskripsi`, `waktu`) VALUES
(1, 'Check & Repair HDD 250GB', 50),
(2, 'Check & Repair HDD 500GB', 100),
(3, 'Check & Repair HDD 1TB', 200),
(4, 'Check & Repair HDD 2TB', 400),
(5, 'Ganti Komponen Hardware (Plug & Play)', 20),
(6, 'Install OS Standard ADM', 120),
(7, 'Install OS Standard Non ADM', 240),
(8, 'Isi Ulang Tinta', 15),
(9, 'Isi Ulang Toner', 15),
(10, 'Isi Ulang/Ganti Pita', 20),
(11, 'Lain-lain', 120),
(12, 'Isi Ulang Tinta + Tindakan', 30),
(13, 'Isi Ulang Toner + Tindakan', 35),
(14, 'Ganti Komponen Hardware (Solder)', 45),
(15, 'Instalasi Jaringan/CCTV 60 Meter', 110),
(16, 'Instalasi Jaringan/CCTV 80 Meter', 180),
(17, 'Instalasi Jaringan/CCTV 100 Meter', 210),
(18, 'Troubleshoot + Pengujian', 300),
(19, 'Ganti Komponen Hardware (Plug & Play + Bongkar total)', 60),
(20, 'Ganti Komponen Hardware (Solder + Bongkar Total)', 80),
(21, 'Instalasi Acces Door', 180),
(22, 'Instalasi Acces Door + Bobok', 360);

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
  ADD KEY `rekap_perawatan_ibfk_3` (`teknisi_id`),
  ADD KEY `fk_standar_waktu` (`standar_waktu_id`);

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
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `rekap_perawatan`
--
ALTER TABLE `rekap_perawatan`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `standar_waktu`
--
ALTER TABLE `standar_waktu`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
  ADD CONSTRAINT `fk_standar_waktu` FOREIGN KEY (`standar_waktu_id`) REFERENCES `standar_waktu` (`id`),
  ADD CONSTRAINT `rekap_perawatan_ibfk_1` FOREIGN KEY (`hardware_id`) REFERENCES `hardware` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rekap_perawatan_ibfk_3` FOREIGN KEY (`teknisi_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
