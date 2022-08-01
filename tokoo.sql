-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 29, 2022 at 04:49 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokoo`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `gambar_barang` varchar(255) NOT NULL,
  `jumlah_stok` int(11) NOT NULL,
  `satuan` varchar(255) NOT NULL,
  `harga_jual_satuan` int(200) NOT NULL,
  `penjualan` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `kode_barang`, `nama_barang`, `gambar_barang`, `jumlah_stok`, `satuan`, `harga_jual_satuan`, `penjualan`) VALUES
(1, 'SP-AJ-000231', 'Sepatu Air Jordan', 'x301ek7aw7igfj477vbt.jpg', 0, 'Pcs', 1290000, NULL),
(2, 'HD-Rexus-02312', 'Headset Rexus', 'l3p7uqdzsyg0l5gmqno5.jpg', 10, 'Pcs', 790000, NULL),
(3, 'BJ-KMJ-01239', 'Baju Kemeja Pria Hitam', 'pkt94lsz81lb5lr3sr1t.jpg', 98, 'Pcs', 240000, NULL),
(4, 'JM-T-32189', 'Jam Tangan Pria', '80fw5v50pd56ld35fjfu.jpg', 470, 'Pcs', 325000, NULL),
(5, 'HS-A3128', 'Hand Sanitizer Antiseptic', 'kl5jox5qnhmvaz4ubj29.jpg', 360, 'Pcs', 15000, NULL),
(6, 'TS-P319', 'Tas Selempang', 'a2e5zmt6y3vgb8yhkuat.jpg', 328, 'Pcs', 79000, NULL),
(7, 'KM-Can3219', 'Kamera Canon', 's4bznitxqwyaa4v2a1x2.jpg', 49, 'Pcs', 3900000, NULL),
(8, 'CL-B32198', 'Celana Bahan Pria', 'kk9ueb658acbyz87v7yx.jpg', 420, 'Pcs', 200000, NULL),
(9, 'KYB-G321890', 'Keyboard Komputer', 'm0wb8ql7nhcrvkm0tgul.jpg', 213, 'Pcs', 700000, NULL),
(10, 'HLM-B14390', 'Helm Variasi', 'cjl7tg4agyfoj4njbuuu.jpg', 152, 'Pcs', 1290000, NULL),
(11, 'IP-PM12', 'Iphone 12 Pro Max', 'm2q4sawzgd01xu9rjatz.jpg', 27, 'Pcs', 27000000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id_cart` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `harga` int(200) NOT NULL,
  `gambar_barang` varchar(255) NOT NULL,
  `tgl_beli` date NOT NULL,
  `qty` int(11) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `total` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `id_pembeli` int(11) NOT NULL,
  `nama_pembeli` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `total_bayar` int(255) NOT NULL,
  `nominal_bayar` int(255) NOT NULL,
  `kembalian` int(255) NOT NULL,
  `id_pembeli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama_depan` varchar(255) NOT NULL,
  `nama_belakang` varchar(255) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `level` enum('pimpinan','admin') NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama_depan`, `nama_belakang`, `no_hp`, `email`, `tgl_lahir`, `level`, `username`, `password`) VALUES
(4, 'Admin', 'Toko', '0812-3456-7890', 'admintoko@toko.budi', '2002-02-02', 'admin', 'Admin9971', '$2y$10$atCJY3Zpf2xkhTH5n8GOnO1GIY4j5co/fJJhblCAyccENSQCxO3U6'),
(8, 'Pimpinan', 'Toko', '0812-3456-7890', 'pimpinan@toko.budi', '1999-01-01', 'pimpinan', 'Pimpinan2545', '$2y$10$kI.mBEXtuUneTk47VXgp0.UTbZjQLloosm34WzBtIooxaala8cZuC');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id_pembeli`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `id_pembeli` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
