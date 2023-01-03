-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2023 at 04:15 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qlks`
--

-- --------------------------------------------------------

--
-- Table structure for table `datphong`
--

CREATE TABLE `datphong` (
  `MaKH` int(11) NOT NULL,
  `NgayDen` date NOT NULL,
  `NgayDi` date NOT NULL,
  `MaPhong` varchar(10) NOT NULL,
  `TienCoc` double NOT NULL,
  `MaNV` varchar(10) NOT NULL,
  `NgayThucHien` date NOT NULL,
  `TrangThai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dichvu`
--

CREATE TABLE `dichvu` (
  `MaDV` varchar(10) NOT NULL,
  `TenDV` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `GiaDV` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `dichvu`
--

INSERT INTO `dichvu` (`MaDV`, `TenDV`, `GiaDV`) VALUES
('DV01', 'Cafe', 24000),
('DV02', 'Nước chanh', 17000),
('DV03', 'Nước khoáng', 15000),
('DV04', 'Bò né', 100000);

-- --------------------------------------------------------

--
-- Table structure for table `hoadon`
--

CREATE TABLE `hoadon` (
  `MaHD` int(11) NOT NULL,
  `MaKH` int(11) NOT NULL,
  `ThanhTien` double NOT NULL,
  `TrangThai` int(11) DEFAULT NULL,
  `NgayThanhToan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `hoadon`
--

INSERT INTO `hoadon` (`MaHD`, `MaKH`, `ThanhTien`, `TrangThai`, `NgayThanhToan`) VALUES
(39, 9, 1230000, 1, '2023-01-03'),
(40, 9, 1230000, 1, '2023-01-03'),
(41, 14, 760000, 1, '2023-01-03');

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `MaKH` int(11) NOT NULL,
  `TenKH` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `CMND` varchar(10) NOT NULL,
  `SDT` varchar(10) NOT NULL,
  `QuocTich` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `VIP` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`MaKH`, `TenKH`, `CMND`, `SDT`, `QuocTich`, `VIP`) VALUES
(1, 'Liễu', '215589255', '0367724451', 'Việt Nam', 1),
(2, 'Hạnh', '248797865', '678894453', 'Việt Nam', 0),
(3, 'Trần Ngọc Tiền', '215520605', '0383522852', 'Việt Nam', 0),
(4, 'Trần Nguyên', '215520606', '0383522113', 'Việt Nam', 0),
(7, '', '21550605', '', '', 0),
(8, 'k', '2157896433', '0357894562', 'VN', 0),
(9, 't', '2157896432', '0367894521', 'VN', 0),
(14, 'Tiền', '215520601', '0383522851', 'VN', 0);

-- --------------------------------------------------------

--
-- Table structure for table `kho`
--

CREATE TABLE `kho` (
  `MaMH` varchar(10) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `DonGia` double NOT NULL,
  `NgayNhap` date DEFAULT NULL,
  `TrangThai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mathang`
--

CREATE TABLE `mathang` (
  `MaMH` varchar(10) NOT NULL,
  `TenMH` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NoiCungCap` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MaNV` varchar(10) NOT NULL,
  `TenNV` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NgaySinh` date NOT NULL,
  `GioiTinh` tinyint(1) NOT NULL,
  `SDT` varchar(10) NOT NULL,
  `MatKhau` varchar(20) NOT NULL,
  `ChucVu` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Luong` double NOT NULL,
  `TinhTrang` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`MaNV`, `TenNV`, `NgaySinh`, `GioiTinh`, `SDT`, `MatKhau`, `ChucVu`, `Luong`, `TinhTrang`) VALUES
('admin', 'Admin', '2001-09-12', 1, '0383522852', 'admin', 'Admin', 5000000, 1),
('NV1', 'Sallen', '2022-10-15', 0, '0367724451', 'thulieu', 'Lễ tân', 5000000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `phong`
--

CREATE TABLE `phong` (
  `MaPhong` varchar(10) NOT NULL,
  `TenPhong` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LoaiPhong` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `Gia` bigint(20) NOT NULL,
  `HinhAnh` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TrangThai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `phong`
--

INSERT INTO `phong` (`MaPhong`, `TenPhong`, `LoaiPhong`, `Gia`, `HinhAnh`, `TrangThai`) VALUES
('P103', 'Phòng 103', 'Phòng đơn', 380000, NULL, 0),
('P104', 'Phòng 104', 'Phòng đơn', 350000, NULL, 1),
('P105', 'Phòng 105', 'Phòng đơn', 350000, NULL, 1),
('P106', 'Phòng 106', 'Phòng đơn', 600000, NULL, 0),
('P107', 'Phòng 107', 'Phòng đơn', 600000, NULL, 0),
('P108', 'Phòng 108', 'Phòng đơn', 600000, NULL, 0),
('P201', 'Phòng 201', 'Phòng đơn', 370000, NULL, 0),
('P202', 'Phòng 202', 'Phòng đơn', 430000, NULL, 0),
('P203', 'Phòng 203', 'Phòng đơn', 410000, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sddv`
--

CREATE TABLE `sddv` (
  `MaKH` int(11) NOT NULL,
  `MaPhong` varchar(10) NOT NULL,
  `MaDV` varchar(10) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `NgaySD` date NOT NULL,
  `TrangThai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sddv`
--

INSERT INTO `sddv` (`MaKH`, `MaPhong`, `MaDV`, `SoLuong`, `NgaySD`, `TrangThai`) VALUES
(1, 'P103', 'DV01', 0, '2022-11-15', 0),
(2, 'P104', 'DV01', 0, '2022-11-15', 2),
(1, 'P103', 'DV02', 0, '2022-11-23', 2),
(1, 'P104', 'DV01', 1, '2022-11-24', 2),
(1, 'P104', 'DV01', 1, '2022-11-24', 2),
(1, 'P104', 'DV01', 7, '2022-11-24', 2),
(1, 'P104', 'DV02', 1, '2022-11-24', 2);

-- --------------------------------------------------------

--
-- Table structure for table `thuchi`
--

CREATE TABLE `thuchi` (
  `MaThuChi` int(11) NOT NULL,
  `NgayThucHien` date NOT NULL,
  `SoTien` double NOT NULL,
  `ChiTiet` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MaMH` varchar(10) DEFAULT NULL,
  `ThuChi` tinyint(1) DEFAULT NULL,
  `TrangThai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `thuephong`
--

CREATE TABLE `thuephong` (
  `MaKH` int(11) NOT NULL,
  `NgayDen` date NOT NULL,
  `NgayDi` date NOT NULL,
  `MaPhong` varchar(10) NOT NULL,
  `MaNV` varchar(10) NOT NULL,
  `TrangThai` int(11) DEFAULT NULL,
  `NgayThucHien` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `thuephong`
--

INSERT INTO `thuephong` (`MaKH`, `NgayDen`, `NgayDi`, `MaPhong`, `MaNV`, `TrangThai`, `NgayThucHien`) VALUES
(8, '2023-01-03', '2023-01-04', 'P104', 'admin', 0, '2023-01-03'),
(9, '2023-01-03', '2023-01-05', 'P105', 'admin', 0, '2023-01-03'),
(9, '2023-01-03', '2023-01-06', 'P203', 'admin', 1, '2023-01-03'),
(14, '2023-01-03', '2023-01-05', 'P103', 'admin', 1, '2023-01-03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `datphong`
--
ALTER TABLE `datphong`
  ADD KEY `MaKH` (`MaKH`),
  ADD KEY `MaPhong` (`MaPhong`),
  ADD KEY `MaNV` (`MaNV`);

--
-- Indexes for table `dichvu`
--
ALTER TABLE `dichvu`
  ADD PRIMARY KEY (`MaDV`);

--
-- Indexes for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`MaHD`),
  ADD KEY `MaKH` (`MaKH`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MaKH`),
  ADD UNIQUE KEY `CMND` (`CMND`),
  ADD UNIQUE KEY `SDT` (`SDT`);

--
-- Indexes for table `kho`
--
ALTER TABLE `kho`
  ADD KEY `MaMH` (`MaMH`);

--
-- Indexes for table `mathang`
--
ALTER TABLE `mathang`
  ADD PRIMARY KEY (`MaMH`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MaNV`),
  ADD UNIQUE KEY `SDT` (`SDT`);

--
-- Indexes for table `phong`
--
ALTER TABLE `phong`
  ADD PRIMARY KEY (`MaPhong`);

--
-- Indexes for table `sddv`
--
ALTER TABLE `sddv`
  ADD KEY `MaKH` (`MaKH`),
  ADD KEY `MaDV` (`MaDV`),
  ADD KEY `MaPhong` (`MaPhong`);

--
-- Indexes for table `thuchi`
--
ALTER TABLE `thuchi`
  ADD PRIMARY KEY (`MaThuChi`),
  ADD KEY `MaMH` (`MaMH`);

--
-- Indexes for table `thuephong`
--
ALTER TABLE `thuephong`
  ADD KEY `MaPhong` (`MaPhong`),
  ADD KEY `MaKH` (`MaKH`),
  ADD KEY `MaNV` (`MaNV`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `MaHD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `MaKH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `thuchi`
--
ALTER TABLE `thuchi`
  MODIFY `MaThuChi` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `datphong`
--
ALTER TABLE `datphong`
  ADD CONSTRAINT `datphong_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`),
  ADD CONSTRAINT `datphong_ibfk_2` FOREIGN KEY (`MaPhong`) REFERENCES `phong` (`MaPhong`),
  ADD CONSTRAINT `datphong_ibfk_3` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`);

--
-- Constraints for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`);

--
-- Constraints for table `kho`
--
ALTER TABLE `kho`
  ADD CONSTRAINT `kho_ibfk_1` FOREIGN KEY (`MaMH`) REFERENCES `mathang` (`MaMH`);

--
-- Constraints for table `sddv`
--
ALTER TABLE `sddv`
  ADD CONSTRAINT `sddv_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`),
  ADD CONSTRAINT `sddv_ibfk_2` FOREIGN KEY (`MaDV`) REFERENCES `dichvu` (`MaDV`),
  ADD CONSTRAINT `sddv_ibfk_3` FOREIGN KEY (`MaPhong`) REFERENCES `phong` (`MaPhong`);

--
-- Constraints for table `thuchi`
--
ALTER TABLE `thuchi`
  ADD CONSTRAINT `thuchi_ibfk_1` FOREIGN KEY (`MaMH`) REFERENCES `mathang` (`MaMH`);

--
-- Constraints for table `thuephong`
--
ALTER TABLE `thuephong`
  ADD CONSTRAINT `phong_ibfk_3` FOREIGN KEY (`MaPhong`) REFERENCES `phong` (`MaPhong`),
  ADD CONSTRAINT `thuephong_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`),
  ADD CONSTRAINT `thuephong_ibfk_2` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
