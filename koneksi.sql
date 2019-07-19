-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2019 at 02:26 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.1.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `koneksi`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kode_barang` char(5) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `berat_barang` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`kode_barang`, `nama_barang`, `berat_barang`) VALUES
('KB001', 'Meja', 10),
('KB002', 'Kursi', 5),
('KB003', 'Baju', 2),
('KB004', 'Celana', 2),
('KB005', 'laptop', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_login`
--

CREATE TABLE `tb_login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `hak` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_login`
--

INSERT INTO `tb_login` (`username`, `password`, `hak`) VALUES
('aan', 'rahayu', 'ADMIN'),
('joko', 'kindarso', 'BOS');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengirim`
--

CREATE TABLE `tb_pengirim` (
  `kode_pengirim` char(5) NOT NULL,
  `nama_pengirim` varchar(50) NOT NULL,
  `alamat_pengirim` varchar(50) NOT NULL,
  `no_telp` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengirim`
--

INSERT INTO `tb_pengirim` (`kode_pengirim`, `nama_pengirim`, `alamat_pengirim`, `no_telp`) VALUES
('KP001', 'Aan', 'Ngawi', '000000000000'),
('KP002', 'Rahayu', 'Nganjuk', '088999977788'),
('KP003', 'aswan', 'magelang', '999999999999'),
('KP004', 'joki', 'Surakarta', '089999777888');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengiriman`
--

CREATE TABLE `tb_pengiriman` (
  `no_pengiriman` char(5) NOT NULL,
  `kode_pengirim` char(5) NOT NULL,
  `nama_pengirim` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `kode_barang` char(5) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `tujuan` varchar(50) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `biaya` int(11) NOT NULL,
  `bayar` int(50) NOT NULL,
  `kembali` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengiriman`
--

INSERT INTO `tb_pengiriman` (`no_pengiriman`, `kode_pengirim`, `nama_pengirim`, `alamat`, `kode_barang`, `nama_barang`, `tujuan`, `jenis`, `biaya`, `bayar`, `kembali`) VALUES
('P001', 'KP001', 'Aan', 'Ngawi', 'KB001', 'Meja', 'nganjuk', 'Darat', 10000, 20000, 10000),
('P002', 'KP002', 'Rahayu', 'Nganjuk', 'KB002', 'Kursi', 'jakarta', 'Laut', 10000, 15000, 5000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `tb_pengirim`
--
ALTER TABLE `tb_pengirim`
  ADD PRIMARY KEY (`kode_pengirim`);

--
-- Indexes for table `tb_pengiriman`
--
ALTER TABLE `tb_pengiriman`
  ADD PRIMARY KEY (`no_pengiriman`),
  ADD KEY `kode_pengirim` (`kode_pengirim`,`kode_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
