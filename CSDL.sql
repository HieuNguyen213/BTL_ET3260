-- --------------------------------------------------------
-- Máy chủ:                      127.0.0.1
-- Server version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Phiên bản:           12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for cafemanage
CREATE DATABASE IF NOT EXISTS `cafemanage` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `cafemanage`;

-- Dumping structure for table cafemanage.giao_ca
CREATE TABLE IF NOT EXISTS `giao_ca` (
  `caLamViec_ID` tinyint(4) NOT NULL DEFAULT 0,
  `thoiGianBatDau` time NOT NULL,
  `thoiGianKetThuc` time NOT NULL,
  PRIMARY KEY (`caLamViec_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table cafemanage.giao_ca: ~5 rows (approximately)
DELETE FROM `giao_ca`;
INSERT INTO `giao_ca` (`caLamViec_ID`, `thoiGianBatDau`, `thoiGianKetThuc`) VALUES
	(1, '07:00:00', '10:00:00'),
	(2, '10:00:00', '13:00:00'),
	(3, '13:00:00', '16:00:00'),
	(4, '16:00:00', '19:00:00'),
	(5, '19:00:00', '23:00:00');

-- Dumping structure for table cafemanage.hoa_don
CREATE TABLE IF NOT EXISTS `hoa_don` (
  `hoaDon_ID` varchar(50) NOT NULL,
  `thoiGianThanhToan` datetime DEFAULT NULL,
  `khuyenMai` int(11) NOT NULL DEFAULT 0,
  `tongTien` double NOT NULL,
  `nhanVien_ID` varchar(50) NOT NULL,
  `trangThaiDon` varchar(50) DEFAULT NULL,
  `loaiDon` varchar(50) DEFAULT NULL,
  `hinhThucThanhToan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`hoaDon_ID`),
  KEY `FK_hoa_don_thong_tin_nhan_vien` (`nhanVien_ID`),
  CONSTRAINT `FK_hoa_don_thong_tin_nhan_vien` FOREIGN KEY (`nhanVien_ID`) REFERENCES `thong_tin_nhan_vien` (`nhanVien_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table cafemanage.hoa_don: ~10 rows (approximately)
DELETE FROM `hoa_don`;
INSERT INTO `hoa_don` (`hoaDon_ID`, `thoiGianThanhToan`, `khuyenMai`, `tongTien`, `nhanVien_ID`, `trangThaiDon`, `loaiDon`, `hinhThucThanhToan`) VALUES
	('0701240001', '2024-01-07 22:56:01', 10, 52200, '100', 'Đã hoàn thành', 'Tại quán', 'Tiền mặt'),
	('0701240002', '2024-01-07 22:56:13', 10, 63000, '100', 'Đã hoàn thành', 'Tại quán', 'Chuyển khoản'),
	('0701240003', '2024-01-07 17:09:21', 10, 28800, '105', 'Đã hoàn thành', 'Tại quán', 'Chuyển khoản'),
	('0701240004', '2024-01-07 11:13:03', 10, 28800, '101', 'Đã hoàn thành', 'Tại quán', 'Chuyển khoản'),
	('0701240005', '2024-01-07 11:13:41', 10, 31500, '101', 'Đã hoàn thành', 'Tại quán', 'Tiền mặt'),
	('0701240006', '2024-01-07 23:18:24', 0, 30000, '105', 'Đã hoàn thành', 'Tại quán', 'Tiền mặt'),
	('0801240001', '2024-01-08 04:06:39', 10, 28800, '100', 'Đã hoàn thành', 'Tại quán', 'Tiền mặt'),
	('0801240002', '2024-01-08 04:06:51', 10, 31500, '100', 'Chưa hoàn thành', 'Đơn ship', 'Tiền mặt'),
	('0801240003', '2024-01-08 07:02:46', 10, 31500, '107', 'Đã hoàn thành', 'Tại quán', 'Tiền mặt'),
	('0801240004', '2024-01-08 07:22:06', 10, 57600, '100', 'Chưa hoàn thành', 'Tại quán', 'Tiền mặt'),
	('0801240005', '2024-01-08 07:32:45', 10, 157500, '100', 'Chưa hoàn thành', 'Tại quán', 'Tiền mặt');

-- Dumping structure for table cafemanage.kho
CREATE TABLE IF NOT EXISTS `kho` (
  `loaiNguyenLieu_ID` tinyint(4) NOT NULL AUTO_INCREMENT,
  `tenLoaiNguyenLieu` varchar(50) DEFAULT NULL,
  `ngayNhapHang` date DEFAULT NULL,
  `soLuongNhap` int(11) DEFAULT NULL,
  `conLai` int(11) DEFAULT NULL,
  `donVi` varchar(50) DEFAULT '0',
  `giaTien` double DEFAULT NULL,
  `hanSuDung` double DEFAULT NULL,
  PRIMARY KEY (`loaiNguyenLieu_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table cafemanage.kho: ~20 rows (approximately)
DELETE FROM `kho`;
INSERT INTO `kho` (`loaiNguyenLieu_ID`, `tenLoaiNguyenLieu`, `ngayNhapHang`, `soLuongNhap`, `conLai`, `donVi`, `giaTien`, `hanSuDung`) VALUES
	(1, 'Bánh kem bắp', '2024-01-02', 50, 150, 'CÁI', 1, 12),
	(2, 'Vải', '2024-01-02', 50, 996, 'TRÁI', 500, 12),
	(3, 'Sữa chua', '2024-01-01', 100, 86, 'HỘP', 3000, 6),
	(4, 'Trà xanh Thái Nguyên', '2024-01-01', 1000, 1000, 'GAM', 20000, 12),
	(5, 'Cà phê rang xay', '2024-01-01', 5000, 5000, 'GAM', 1000, 12),
	(6, 'Hồng trà Lipton', '2024-01-01', 1000, 1000, 'TÚI', 5000, 6),
	(7, 'Sữa đặc Ngôi Sao Phương Nam', '2024-01-01', 100, 100, 'HỘP', 20000, 6),
	(8, 'Sữa tươi TH truemilk có đường', '2024-01-01', 50, 50, 'HỘP', 20000, 12),
	(9, 'Sữa tươi TH truemilk không đường', '2024-01-03', 50, 50, 'HỘP', 20000, 6),
	(10, 'Bột trà xanh', '2024-01-02', 1000, 116, 'GAM', 1000, 12),
	(11, 'Kem cheese', '2024-01-02', 1000, 950, 'GAM', 2000, 6),
	(12, 'Bánh oreo', '2024-01-07', 10, 0, 'HỘP', 50, 6),
	(13, 'Chanh', '2024-01-02', 100, 86, 'TRÁI', 500, 12),
	(14, 'Dâu', '2024-01-01', 100, 98, 'TRÁI', 1000, 12),
	(15, 'Việt quất', '2024-01-02', 100, 100, 'TRÁI', 1000, 12),
	(16, 'Chocolate', '2024-01-02', 100, 100, 'HỘP', 10000, 12),
	(17, 'Chanh dây', '2024-01-02', 100, 100, 'TRÁI', 2000, 12),
	(18, 'Trân châu đường đen', '2024-01-02', 1000, 1000, 'ML', 10000, 6),
	(19, 'Mật ong', '2024-01-03', 1000, 1000, 'ML', 5000, 6),
	(20, 'Đào', '2024-01-07', 20, 996, 'TRÁI', 2, 12),
	(21, 'Đường', '2024-01-07', 5, 5, 'KG', 5000, 12);

-- Dumping structure for table cafemanage.loai_mon
CREATE TABLE IF NOT EXISTS `loai_mon` (
  `CategoryID` tinyint(4) NOT NULL DEFAULT 0,
  `CategoryName` varchar(50) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table cafemanage.loai_mon: ~7 rows (approximately)
DELETE FROM `loai_mon`;
INSERT INTO `loai_mon` (`CategoryID`, `CategoryName`) VALUES
	(1, 'Cà phê năng lượng'),
	(2, 'Cà phê Ý'),
	(3, 'Thanh nhiệt/Thanh lọc'),
	(4, 'Đá xay'),
	(5, 'Trà hoa quả'),
	(6, 'Sinh tố'),
	(7, 'Nước ép/Thanh nhiệt'),
	(8, 'Bánh');

-- Dumping structure for table cafemanage.loai_tai_khoan
CREATE TABLE IF NOT EXISTS `loai_tai_khoan` (
  `TypeID` tinyint(1) NOT NULL DEFAULT 1,
  `TypeName` varchar(10) NOT NULL,
  PRIMARY KEY (`TypeID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table cafemanage.loai_tai_khoan: ~2 rows (approximately)
DELETE FROM `loai_tai_khoan`;
INSERT INTO `loai_tai_khoan` (`TypeID`, `TypeName`) VALUES
	(0, 'Quản lý'),
	(1, 'Nhân viên');

-- Dumping structure for table cafemanage.nguyen_lieu
CREATE TABLE IF NOT EXISTS `nguyen_lieu` (
  `nguyenLieu_ID` varchar(50) NOT NULL DEFAULT '0',
  `loaiNguyenLieu_ID` tinyint(4) DEFAULT NULL,
  `mon_ID` tinyint(4) DEFAULT NULL,
  `soLuong` int(11) DEFAULT NULL,
  PRIMARY KEY (`nguyenLieu_ID`),
  KEY `FK_nguyenlieu_kho` (`loaiNguyenLieu_ID`),
  KEY `FK_nguyenlieu_thuc_don` (`mon_ID`),
  CONSTRAINT `FK_nguyenlieu_kho` FOREIGN KEY (`loaiNguyenLieu_ID`) REFERENCES `kho` (`loaiNguyenLieu_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_nguyenlieu_thuc_don` FOREIGN KEY (`mon_ID`) REFERENCES `thuc_don` (`mon_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table cafemanage.nguyen_lieu: ~44 rows (approximately)
DELETE FROM `nguyen_lieu`;
INSERT INTO `nguyen_lieu` (`nguyenLieu_ID`, `loaiNguyenLieu_ID`, `mon_ID`, `soLuong`) VALUES
	('101', 9, 10, 2),
	('11', 2, 1, 1),
	('111', 7, 11, 1),
	('12', 3, 1, 1),
	('121', 4, 12, 2),
	('131', 3, 13, 1),
	('141', 19, 14, 2),
	('151', 7, 15, 2),
	('161', 17, 16, 2),
	('171', 16, 17, 2),
	('181', 17, 18, 2),
	('191', 17, 19, 1),
	('201', 10, 20, 3),
	('21', 18, 2, 1),
	('211', 10, 21, 2),
	('22', 3, 2, 1),
	('221', 10, 22, 1),
	('231', 12, 23, 1),
	('241', 2, 24, 3),
	('251', 20, 25, 2),
	('261', 20, 26, 2),
	('271', 9, 27, 1),
	('281', 17, 28, 1),
	('291', 18, 29, 2),
	('301', 4, 30, 2),
	('31', 10, 3, 2),
	('311', 18, 31, 3),
	('321', 17, 32, 2),
	('331', 4, 33, 2),
	('341', 5, 34, 3),
	('351', 10, 35, 2),
	('361', 4, 36, 1),
	('371', 13, 37, 2),
	('381', 17, 38, 2),
	('391', 1, 39, 2),
	('401', 14, 40, 2),
	('41', 13, 4, 3),
	('411', 11, 41, 2),
	('42', 3, 4, 1),
	('421', 21, 42, 1),
	('51', 14, 5, 2),
	('61', 12, 6, 2),
	('71', 13, 7, 3),
	('81', 5, 8, 5),
	('91', 3, 9, 3);

-- Dumping structure for table cafemanage.tai_khoan
CREATE TABLE IF NOT EXISTS `tai_khoan` (
  `userName` varchar(50) NOT NULL,
  `password` varchar(15) NOT NULL DEFAULT '',
  `email` varchar(30) NOT NULL DEFAULT '',
  `nhanVien_ID` varchar(50) NOT NULL DEFAULT '',
  `typeID` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`userName`),
  KEY `FK_account_account_type` (`typeID`),
  KEY `FK_tai_khoan_thong_tin_nhan_vien` (`nhanVien_ID`),
  CONSTRAINT `FK_account_account_type` FOREIGN KEY (`typeID`) REFERENCES `loai_tai_khoan` (`TypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tai_khoan_thong_tin_nhan_vien` FOREIGN KEY (`nhanVien_ID`) REFERENCES `thong_tin_nhan_vien` (`nhanVien_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table cafemanage.tai_khoan: ~6 rows (approximately)
DELETE FROM `tai_khoan`;
INSERT INTO `tai_khoan` (`userName`, `password`, `email`, `nhanVien_ID`, `typeID`) VALUES
	('admin', '0', 'hsku2009@gmail.com', '100', 0),
	('nhanvien1', '1', 'tdhl4112@gmail.com', '101', 1),
	('nhanvien3', '3', 'kakashi@gmail.com', '103', 1),
	('nhanvien4', '4', 'andyLau@gmail.com', '104', 1),
	('nhanvien5', '5', 'kakashi@gmail.com', '105', 1),
	('nhanvien6', '6', 'leminh@gmail.com', '106', 1),
	('nhanvien7', '7', 'tranhaonam@gmail.com', '107', 1),
	('nhanvien8', '8', 'quachPhuThanh@gmail.com', '108', 1);

-- Dumping structure for table cafemanage.thong_tin_ca_lam_viec
CREATE TABLE IF NOT EXISTS `thong_tin_ca_lam_viec` (
  `thongTinCa_ID` varchar(50) NOT NULL,
  `caLamViec_ID` tinyint(4) NOT NULL DEFAULT 0,
  `tienBanDau` double DEFAULT 1000000,
  `tienMat` double DEFAULT NULL,
  `tienChuyenKhoan` double DEFAULT NULL,
  `tienPhatSinh` double DEFAULT NULL,
  `ghiChu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`thongTinCa_ID`),
  KEY `FK_thong_tin_ca_lam_viec_giao_ca` (`caLamViec_ID`),
  CONSTRAINT `FK_thong_tin_ca_lam_viec_giao_ca` FOREIGN KEY (`caLamViec_ID`) REFERENCES `giao_ca` (`caLamViec_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table cafemanage.thong_tin_ca_lam_viec: ~6 rows (approximately)
DELETE FROM `thong_tin_ca_lam_viec`;
INSERT INTO `thong_tin_ca_lam_viec` (`thongTinCa_ID`, `caLamViec_ID`, `tienBanDau`, `tienMat`, `tienChuyenKhoan`, `tienPhatSinh`, `ghiChu`) VALUES
	('0201241', 1, 1000000, 200000, 200000, 200000, 'Chủ thêm'),
	('0201242', 2, 1100000, 400000, 145000, NULL, NULL),
	('0201243', 3, 1100000, 350000, 450000, NULL, NULL),
	('0201244', 4, 1000000, 450000, 550000, NULL, NULL),
	('0201245', 5, 1000000, 172800, 0, 0, 'Hiếu Nguyễn'),
	('0701245', 5, 1000000, 1684800, 28800, 100000, 'anh trưởng thêm'),
	('0801241', 1, 1000000, 0, 0, 100000, 'a Hiếu tip');

-- Dumping structure for table cafemanage.thong_tin_hoa_don
CREATE TABLE IF NOT EXISTS `thong_tin_hoa_don` (
  `thongTinHoaDon_ID` varchar(50) NOT NULL,
  `mon_ID` tinyint(4) NOT NULL,
  `soLuong` tinyint(4) DEFAULT NULL,
  `hoaDon_ID` varchar(50) NOT NULL,
  PRIMARY KEY (`thongTinHoaDon_ID`),
  KEY `FK_thong_tin_hoa_don_hoa_don` (`hoaDon_ID`),
  KEY `FK_thong_tin_hoa_don_thuc_don` (`mon_ID`) USING BTREE,
  CONSTRAINT `FK_thong_tin_hoa_don_hoa_don` FOREIGN KEY (`hoaDon_ID`) REFERENCES `hoa_don` (`hoaDon_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table cafemanage.thong_tin_hoa_don: ~14 rows (approximately)
DELETE FROM `thong_tin_hoa_don`;
INSERT INTO `thong_tin_hoa_don` (`thongTinHoaDon_ID`, `mon_ID`, `soLuong`, `hoaDon_ID`) VALUES
	('0701240001_1', 1, 1, '0701240001'),
	('0701240001_2', 2, 1, '0701240001'),
	('0701240002_1', 7, 1, '0701240002'),
	('0701240002_2', 5, 1, '0701240002'),
	('0701240003_1', 4, 1, '0701240003'),
	('0701240004_1', 4, 1, '0701240004'),
	('0701240005_1', 7, 1, '0701240005'),
	('0701240006_1', 42, 1, '0701240006'),
	('0701240006_2', 43, 1, '0701240006'),
	('0801240001_1', 3, 1, '0801240001'),
	('0801240002_1', 7, 1, '0801240002'),
	('0801240003_1', 7, 1, '0801240003'),
	('0801240004_1', 2, 1, '0801240004'),
	('0801240004_2', 7, 1, '0801240004'),
	('0801240005_1', 6, 5, '0801240005');

-- Dumping structure for table cafemanage.thong_tin_nhan_vien
CREATE TABLE IF NOT EXISTS `thong_tin_nhan_vien` (
  `nhanVien_ID` varchar(50) NOT NULL DEFAULT '',
  `hoTenNhanVien` varchar(50) NOT NULL DEFAULT '',
  `queQuan` varchar(50) NOT NULL DEFAULT '',
  `soDienThoai` varchar(50) NOT NULL DEFAULT '',
  `luongCoBan` double NOT NULL DEFAULT 0,
  `caLamViec_ID` tinyint(4) NOT NULL DEFAULT 0,
  `hinhAnh` varchar(100) DEFAULT '',
  `soCCCD` varchar(50) NOT NULL DEFAULT '',
  `trangThai` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`nhanVien_ID`),
  KEY `FK_thong_tin_nhan_vien_giao_ca` (`caLamViec_ID`),
  CONSTRAINT `FK_thong_tin_nhan_vien_giao_ca` FOREIGN KEY (`caLamViec_ID`) REFERENCES `giao_ca` (`caLamViec_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table cafemanage.thong_tin_nhan_vien: ~8 rows (approximately)
DELETE FROM `thong_tin_nhan_vien`;
INSERT INTO `thong_tin_nhan_vien` (`nhanVien_ID`, `hoTenNhanVien`, `queQuan`, `soDienThoai`, `luongCoBan`, `caLamViec_ID`, `hinhAnh`, `soCCCD`, `trangThai`) VALUES
	('100', 'Ngô Quang Tùng', 'Quảng Ninh', '12345', 100000000, 1, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\boss.jpg', '0000000', 1),
	('101', 'Nguyễn Thạc Hiếu', 'Đình Bảng, Từ Sơn, Bắc Ninh', '8888888888', 10000000, 1, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\nhanvien2.jpg', '000000000001', 1),
	('103', 'Seshoumaru', 'Nhật Bản thời Chiến quốc', '12345678', 15000000, 4, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\sesshomaru.jpg', '1234567', 1),
	('104', 'Lưu Đức Hoa', 'Tiêm Sa Chuỷ', '22222222', 7000000, 5, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\AndyLau.jpg', '1111111111', 0),
	('105', 'Kakashi', 'Konoha', '777777', 1000000, 5, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\Kakashi.jpg', '6666666666', 0),
	('106', 'Lê Minh', 'HongKong', '1122334555', 10000000, 3, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\LeMinh.jpg', '5345535345', 1),
	('107', 'Trần Hạo Nam', 'Vịnh Đồng La', '2222222222', 1000000, 1, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\TranHaoNam.jpg', '111111111', 1),
	('108', 'Quách Phú Thành', 'HongKong', '123456789', 10000000, 5, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\QuachPhuThanh.jpg', '0333333333', 1);

-- Dumping structure for table cafemanage.thuc_don
CREATE TABLE IF NOT EXISTS `thuc_don` (
  `mon_ID` tinyint(4) NOT NULL,
  `tenMon` varchar(50) NOT NULL,
  `CategoryID` tinyint(4) NOT NULL DEFAULT 0,
  `giaTien` double NOT NULL DEFAULT 0,
  `hinhAnh` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mon_ID`) USING BTREE,
  KEY `FK_drink_categoryid` (`CategoryID`),
  CONSTRAINT `FK_drink_categoryid` FOREIGN KEY (`CategoryID`) REFERENCES `loai_mon` (`CategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table cafemanage.thuc_don: ~41 rows (approximately)
DELETE FROM `thuc_don`;
INSERT INTO `thuc_don` (`mon_ID`, `tenMon`, `CategoryID`, `giaTien`, `hinhAnh`) VALUES
	(1, 'Cà phê năng lượng (đen, nóng)', 1, 29000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\1.jpg'),
	(2, 'Cà phê năng lượng (đen, đá)', 1, 29000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\2.jpg'),
	(3, 'Cà phê năng lượng (sữa, nóng)', 1, 32000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\3.jpg'),
	(4, 'Cà phê năng lượng (sữa, đá)', 1, 32000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\4.jpg'),
	(5, 'Bạc xỉu đá', 1, 35000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\5.jpg'),
	(6, 'Latte đá', 1, 35000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\6.jpg'),
	(7, 'Cappuccino đá', 1, 35000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\7.jpg'),
	(8, 'Espresso', 2, 35000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\8.jpg'),
	(9, 'Cappuccino nóng', 2, 40000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\9.jpg'),
	(10, 'Latte nóng', 2, 40000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\10.jpg'),
	(11, 'Mocha nóng', 2, 40000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\11.jpg'),
	(12, 'Cà phê cốt dừa', 2, 40000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\12.jpg'),
	(13, 'Trà đào hạt chia', 3, 32000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\13.jpg'),
	(14, 'Trà Atisô đỏ hạt chia', 3, 32000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\14.jpg'),
	(15, 'Trà hoa đậu biếc hạt chia', 3, 32000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\15.jpg'),
	(16, 'Nước ép dưa hấu hạt chia', 3, 32000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\16.jpg'),
	(17, 'Nước ép dứa/thơm hạt chia', 3, 32000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\17.jpg'),
	(18, 'Nước chanh sả gừng hạt chia', 3, 32000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\18.jpg'),
	(19, 'Chanh muối mật ong', 3, 32000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\19.jpg'),
	(20, 'Trà sữa thạch cà phê', 3, 32000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\20.jpg'),
	(21, 'Cà phê đá xay Caramel', 4, 40000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\21.jpg'),
	(22, 'Cookies đá xay', 4, 45000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\22.jpg'),
	(23, 'Freeze đá xay', 4, 40000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\23.jpg'),
	(24, 'Matcha đá xay', 4, 40000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\24.jpg'),
	(25, 'Việt quất đá xay', 4, 40000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\25.jpg'),
	(26, 'Kim quất đá xay', 4, 40000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\26.jpg'),
	(27, 'Trà đào cam sả', 5, 40000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\27.jpg'),
	(28, 'Trà sen vàng', 5, 40000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\28.jpg'),
	(29, 'Trà vải', 5, 40000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\29.jpg'),
	(30, 'Trà đào nhài', 5, 40000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\30.jpg'),
	(31, 'Trà thạch đào Macchiato', 5, 45000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\31.jpg'),
	(32, 'Trà nhài Macchiato', 5, 45000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\32.jpg'),
	(33, 'Matcha Macchiato', 5, 45000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\33.jpg'),
	(34, 'Chanh dây Macchiato', 5, 45000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\34.jpg'),
	(35, 'Sinh tố bơ', 6, 45000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\35.jpg'),
	(36, 'Sinh tố xoài', 6, 45000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\36.jpg'),
	(37, 'Sinh tố chanh leo', 6, 45000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\37.jpg'),
	(38, 'Nước ép dưa hấu', 7, 45000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\38.jpg'),
	(39, 'Nước ép dứa', 7, 45000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\39.jpg'),
	(40, 'Nước ép táo', 7, 45000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\40.jpg'),
	(41, 'Nước ép cam', 7, 45000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\41.jpg'),
	(42, 'Bánh tiramisu', 8, 20000, 'D:\\IT\\BE Web\\code\\code Eclipse\\BTL_cafeManage\\hinh_anh\\tiramisu.jpg');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
