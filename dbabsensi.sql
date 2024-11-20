-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2024 at 09:34 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbabsensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `idabsensi` int(11) NOT NULL,
  `idpeserta` int(11) NOT NULL DEFAULT 1,
  `tanggal` date NOT NULL DEFAULT current_timestamp(),
  `keterangan` varchar(25) DEFAULT 'Hadir',
  `barcode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`idabsensi`, `idpeserta`, `tanggal`, `keterangan`, `barcode`) VALUES
(1, 5, '2024-06-11', 'Hadir', 'BC1724281698'),
(2, 2, '2024-06-11', 'Hadir', 'BC1724346124'),
(3, 6, '2024-06-11', 'Hadir', ''),
(4, 3, '2024-06-11', 'Hadir', ''),
(5, 4, '2024-06-11', 'Hadir', ''),
(6, 7, '2024-06-11', 'Hadir', ''),
(7, 14, '2024-08-22', 'Hadir', ''),
(8, 11, '2024-08-22', 'Hadir', '');

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int(11) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `scanned_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `absen` varchar(15) NOT NULL DEFAULT 'Hadir'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `barcode`, `scanned_at`, `absen`) VALUES
(1, 'BC1724346124', '2024-08-29 07:26:58', 'Hadir');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `idevent` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `event` varchar(255) NOT NULL,
  `lokasi` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`idevent`, `tanggal`, `event`, `lokasi`) VALUES
(1, '2024-06-11', 'Promo Barang Shopee', 'Bandung'),
(2, '2024-06-12', 'Promo Elektronik Shopee', 'Jakarta'),
(3, '2024-06-13', 'Promo Baju Shopee', 'Surabaya'),
(4, '2024-06-14', 'Promo Mobil Shopee', 'Jakarta'),
(5, '2024-06-15', 'Promo Barang Kecantikan Shopee', 'Bandung'),
(6, '2024-06-16', 'Promo Barang Brandet Shopee', 'Bandung');

-- --------------------------------------------------------

--
-- Stand-in structure for view `laporan`
-- (See below for the actual view)
--
CREATE TABLE `laporan` (
`namelengkap` varchar(70)
,`event` varchar(110)
,`barcode` varchar(255)
,`scanned_at` timestamp
,`absen` varchar(15)
);

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `idpeserta` int(11) NOT NULL,
  `username` varchar(70) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `namelengkap` varchar(70) NOT NULL,
  `event` varchar(110) NOT NULL,
  `email` varchar(100) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `login_session_key` varchar(255) DEFAULT NULL,
  `email_status` varchar(255) DEFAULT NULL,
  `password_expire_date` datetime DEFAULT '2024-09-11 00:00:00',
  `password_reset_key` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peserta`
--

INSERT INTO `peserta` (`idpeserta`, `username`, `password`, `namelengkap`, `event`, `email`, `photo`, `login_session_key`, `email_status`, `password_expire_date`, `password_reset_key`, `barcode`) VALUES
(8, 'Suherlan', '$2y$10$hupBSzMT6t6AQ0VusA/j3.NFx6PhBTeVhmqIU44JxidlxddFBv5AC', 'Suherlan', 'Promo Baju Shopee', 'suherlan@gmail.com', 'http://localhost/e-event/uploads/files/osdrt6bg29nfpwl.png', NULL, NULL, '2024-09-11 00:00:00', NULL, 'BC1724281698'),
(10, 'Dadang', '$2y$10$gD0DJ2fYGGdXs4IXKTCMcOwzjHO3O/UdDVgzgPH/S6j2WE1f4Iul.', 'Dadang', 'Promo Baju Shopee', 'dadang@gmail.com', 'http://localhost/e-event/uploads/files/zrhe7_m29y1kxa3.png', NULL, NULL, '2024-09-11 00:00:00', NULL, 'BC1724282014'),
(11, 'Asep Suteja', '$2y$10$9ih.ImMSofUC8DEm4Sjs4uvZXzIffbZwwJ.Q1s4fKBgdioZMhXXlW', 'Asep Suteja', 'Promo Baju Shopee', 'asepsuteja@gmail.com', 'http://localhost/e-event/uploads/files/vb4_uzalyow7frx.png', NULL, NULL, '2024-09-11 00:00:00', NULL, 'BC1724282079'),
(12, 'Nanang', '$2y$10$2sRZK.MyQm8aO03egjNTMuj62A6WUxfiwlv9qoZYyKzC51zPVvLWW', 'Nanang', 'Promo Barang Brandet Shopee', 'nanang@gmail.com', 'http://localhost/e-event/uploads/files/b3lqpcadv7_kr5j.png', NULL, NULL, '2024-09-11 00:00:00', NULL, 'BC1724283344'),
(13, 'Wahyudin', '$2y$10$4RgQXqy9C94NSzHtkfcvi.qx19gQD2MvomHIyHspW2aXbq62L93AW', 'Wahyudin', 'Promo Barang Brandet Shopee', 'wahyudin@gmail.com', 'http://localhost/e-event/uploads/files/m6uelpgrvta42bw.png', NULL, NULL, '2024-09-11 00:00:00', NULL, 'BC1724286180'),
(15, 'Putri', '$2y$10$sKIzhvsM7if2LZI962eAtu3uz3uKut9ySfU43.3DZEhyPvTy7ELZ2', 'Putri', 'Promo Baju Shopee', 'putri@gmail.com', 'http://localhost/e-event/uploads/files/s0hr753ne2jmawt.png', NULL, NULL, '2024-09-11 00:00:00', NULL, 'BC1724346077'),
(16, 'admin', '$2y$10$WpNquNmOmkU6RVMMKepjauA03tcnmnM97wtY5B1kVwOV4bs0Pyk8u', 'Admin', 'Promo Baju Shopee', 'admin@gmail.com', 'http://localhost/e-event/uploads/files/18jh06nl9x_u4ck.png', NULL, NULL, '2024-09-11 00:00:00', NULL, 'BC1724346124');

-- --------------------------------------------------------

--
-- Structure for view `laporan`
--
DROP TABLE IF EXISTS `laporan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `laporan`  AS SELECT `p`.`namelengkap` AS `namelengkap`, `p`.`event` AS `event`, `b`.`barcode` AS `barcode`, `b`.`scanned_at` AS `scanned_at`, `b`.`absen` AS `absen` FROM (`peserta` `p` join `barcodes` `b` on(`p`.`barcode` = `b`.`barcode`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`idabsensi`);

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`idevent`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`idpeserta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `idabsensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `idevent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `peserta`
--
ALTER TABLE `peserta`
  MODIFY `idpeserta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
