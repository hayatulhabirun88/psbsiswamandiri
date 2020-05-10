-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2020 at 12:22 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `psbsiswamandiri`
--

-- --------------------------------------------------------

--
-- Table structure for table `agama`
--

CREATE TABLE `agama` (
  `agama_id` int(11) NOT NULL,
  `agama_nama` varchar(64) NOT NULL,
  `agama_keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gelombang`
--

CREATE TABLE `gelombang` (
  `gel_id` int(11) NOT NULL,
  `gel_ta` year(4) NOT NULL,
  `gel_kode` int(4) NOT NULL,
  `gel_nama` varchar(128) NOT NULL,
  `gel_tanggal_mulai` date NOT NULL,
  `gel_tanggal_selesai` date NOT NULL,
  `gel_jumlah_pilihan` smallint(2) NOT NULL DEFAULT 1,
  `gel_keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orang_tua`
--

CREATE TABLE `orang_tua` (
  `ot_id` int(11) NOT NULL,
  `ot_siswa` int(11) DEFAULT NULL,
  `ot_nama_ayah` varchar(255) DEFAULT NULL,
  `ot_pend_ayah` int(11) DEFAULT NULL,
  `ot_pek_ayah` int(11) DEFAULT NULL,
  `ot_gaji_ayah` char(16) DEFAULT NULL,
  `ot_hp_ayah` varchar(16) DEFAULT NULL,
  `ot_nama_ibu` varchar(255) DEFAULT NULL,
  `ot_pend_ibu` int(11) DEFAULT NULL,
  `ot_pek_ibu` int(11) DEFAULT NULL,
  `ot_gaji_ibu` char(16) DEFAULT NULL,
  `ot_hp_ibu` varchar(16) DEFAULT NULL,
  `ot_alamat_ortu` varchar(255) DEFAULT NULL,
  `ot_nama_wali` varchar(255) DEFAULT NULL,
  `ot_pend_wali` int(11) DEFAULT NULL,
  `ot_pek_wali` int(11) DEFAULT NULL,
  `ot_gaji_wali` char(16) DEFAULT NULL,
  `ot_hp_wali` varchar(16) DEFAULT NULL,
  `ot_alamat_wali` varchar(255) DEFAULT NULL,
  `ot_status_asuh` enum('ortu','wali') DEFAULT 'ortu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pekerjaan`
--

CREATE TABLE `pekerjaan` (
  `pek_id` int(11) NOT NULL,
  `pek_nama` varchar(64) NOT NULL,
  `pek_keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pendidikan`
--

CREATE TABLE `pendidikan` (
  `pend_id` int(11) NOT NULL,
  `pend_nama` varchar(64) NOT NULL,
  `pend_keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `prov_id` int(11) NOT NULL,
  `prov_nama` varchar(64) NOT NULL,
  `prov_pulau` varchar(64) DEFAULT NULL,
  `prov_keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `setting_id` int(11) NOT NULL,
  `setting_nama` char(128) DEFAULT NULL,
  `setting_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `siswa_id` int(11) NOT NULL,
  `siswa_gel` int(11) NOT NULL,
  `siswa_no_pendaftaran` int(8) NOT NULL,
  `siswa_nama` varchar(128) NOT NULL,
  `siswa_nama_panggilan` varchar(32) DEFAULT NULL,
  `siswa_jenis_kelamin` enum('l','p') DEFAULT 'l',
  `siswa_tempat_lahir` varchar(64) NOT NULL,
  `siswa_tanggal_lahir` date NOT NULL,
  `siswa_agama` int(11) DEFAULT NULL,
  `siswa_suku` varchar(64) DEFAULT NULL,
  `siswa_sekolah_asal` varchar(128) NOT NULL,
  `siswa_sekolah_alamat` varchar(255) DEFAULT NULL,
  `siswa_jumlah_saudara` int(2) DEFAULT NULL,
  `siswa_alamat` varchar(255) DEFAULT NULL,
  `siswa_prov` int(11) DEFAULT NULL,
  `siswa_kabupaten` varchar(64) DEFAULT NULL,
  `siswa_kecamatan` varchar(64) DEFAULT NULL,
  `siswa_kode_pos` char(16) DEFAULT NULL,
  `siswa_alamat_pos` varchar(255) DEFAULT NULL,
  `siswa_telepon` char(16) DEFAULT NULL,
  `siswa_hp` char(16) DEFAULT NULL,
  `siswa_email` varchar(128) DEFAULT NULL,
  `siswa_gol_darah` enum('none','a','b','ab','o') DEFAULT 'none',
  `siswa_anak_ke` int(2) DEFAULT NULL,
  `siswa_tinggi_badan` char(16) DEFAULT NULL,
  `siswa_berat_badan` char(16) DEFAULT NULL,
  `siswa_penyakit` varchar(255) DEFAULT NULL,
  `siswa_tanggal_daftar` date DEFAULT NULL,
  `siswa_status` enum('blm_dicek','sdh_dicek') NOT NULL DEFAULT 'blm_dicek',
  `siswa_ulang` enum('sudah','belum') DEFAULT 'belum',
  `siswa_tanggal_ulang` date DEFAULT NULL,
  `siswa_keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_username` varchar(128) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_pangkat` enum('admin','user') NOT NULL DEFAULT 'user',
  `user_nama` varchar(128) DEFAULT NULL,
  `user_tanggal` date DEFAULT NULL,
  `user_keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`agama_id`),
  ADD UNIQUE KEY `UNIQUE` (`agama_nama`);

--
-- Indexes for table `gelombang`
--
ALTER TABLE `gelombang`
  ADD PRIMARY KEY (`gel_id`);

--
-- Indexes for table `orang_tua`
--
ALTER TABLE `orang_tua`
  ADD PRIMARY KEY (`ot_id`),
  ADD UNIQUE KEY `UNIQUE` (`ot_siswa`),
  ADD KEY `ot_siswa` (`ot_siswa`),
  ADD KEY `ot_pen_ayah` (`ot_pend_ayah`),
  ADD KEY `ot_pen_ibu` (`ot_pend_ibu`),
  ADD KEY `ot_pen_wali` (`ot_pend_wali`),
  ADD KEY `ot_pek_ayah` (`ot_pek_ayah`),
  ADD KEY `ot_pek_ibu` (`ot_pek_ibu`),
  ADD KEY `ot_pek_wali` (`ot_pek_wali`);

--
-- Indexes for table `pekerjaan`
--
ALTER TABLE `pekerjaan`
  ADD PRIMARY KEY (`pek_id`),
  ADD UNIQUE KEY `UNIQUE` (`pek_nama`);

--
-- Indexes for table `pendidikan`
--
ALTER TABLE `pendidikan`
  ADD PRIMARY KEY (`pend_id`),
  ADD UNIQUE KEY `UNIQUE` (`pend_nama`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`prov_id`),
  ADD UNIQUE KEY `UNIQUE` (`prov_nama`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD UNIQUE KEY `UNIQUE` (`setting_nama`),
  ADD KEY `setting_id` (`setting_id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`siswa_id`),
  ADD UNIQUE KEY `UNIQUE` (`siswa_no_pendaftaran`),
  ADD KEY `siswa_agama` (`siswa_agama`),
  ADD KEY `siswa_suku` (`siswa_suku`),
  ADD KEY `siswa_prov` (`siswa_prov`),
  ADD KEY `siswa_gel` (`siswa_gel`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UNIQUE` (`user_username`,`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agama`
--
ALTER TABLE `agama`
  MODIFY `agama_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gelombang`
--
ALTER TABLE `gelombang`
  MODIFY `gel_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orang_tua`
--
ALTER TABLE `orang_tua`
  MODIFY `ot_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pekerjaan`
--
ALTER TABLE `pekerjaan`
  MODIFY `pek_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pendidikan`
--
ALTER TABLE `pendidikan`
  MODIFY `pend_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provinsi`
--
ALTER TABLE `provinsi`
  MODIFY `prov_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `siswa_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orang_tua`
--
ALTER TABLE `orang_tua`
  ADD CONSTRAINT `ot_pek_ayah` FOREIGN KEY (`ot_pek_ayah`) REFERENCES `pekerjaan` (`pek_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ot_pek_ibu` FOREIGN KEY (`ot_pek_ibu`) REFERENCES `pekerjaan` (`pek_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ot_pek_wali` FOREIGN KEY (`ot_pek_wali`) REFERENCES `pekerjaan` (`pek_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ot_pen_ayah` FOREIGN KEY (`ot_pend_ayah`) REFERENCES `pendidikan` (`pend_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ot_pen_ibu` FOREIGN KEY (`ot_pend_ibu`) REFERENCES `pendidikan` (`pend_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ot_pen_wali` FOREIGN KEY (`ot_pend_wali`) REFERENCES `pendidikan` (`pend_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ot_siswa` FOREIGN KEY (`ot_siswa`) REFERENCES `siswa` (`siswa_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_agama` FOREIGN KEY (`siswa_agama`) REFERENCES `agama` (`agama_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `siswa_gel` FOREIGN KEY (`siswa_gel`) REFERENCES `gelombang` (`gel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `siswa_prov` FOREIGN KEY (`siswa_prov`) REFERENCES `provinsi` (`prov_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
