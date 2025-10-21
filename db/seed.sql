-- =========================
--  HETHONGBANSACH - CLEAN
-- =========================

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
 /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
 /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
 /*!40103 SET TIME_ZONE='+00:00' */;
 /*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
 /*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
 /*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
 /*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- =========================
-- binh_luan
-- =========================
DROP TABLE IF EXISTS `binh_luan`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `binh_luan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `diem_so` varchar(255) DEFAULT NULL,
  `mabl` varchar(255) DEFAULT NULL,
  `noi_dung` varchar(255) DEFAULT NULL,
  `trang_thai` bit(1) DEFAULT NULL,
  `macthd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKkn0ynx6vb98ai6w1ecx5x28rf` (`mabl`),
  KEY `FKffqciuixtoatv07nxhrdu3chg` (`macthd`),
  CONSTRAINT `FKffqciuixtoatv07nxhrdu3chg` FOREIGN KEY (`macthd`) REFERENCES `chi_tiet_hoa_don` (`macthd`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
SET character_set_client = @saved_cs_client;

LOCK TABLES `binh_luan` WRITE;
INSERT INTO `binh_luan` VALUES
(1,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000','5','BL001','Sách hay, giao nhanh',b'1','CTHD001'),
(2,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000','4','BL002','Bút viết êm',b'1','CTHD003');
UNLOCK TABLES;

-- =========================
-- chi_tiet_hoa_don
-- =========================
DROP TABLE IF EXISTS `chi_tiet_hoa_don`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `chi_tiet_hoa_don` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `gia_ban` decimal(18,2) DEFAULT NULL,
  `macthd` varchar(255) DEFAULT NULL,
  `so_luong` int(11) DEFAULT NULL,
  `tong_tien` decimal(18,2) DEFAULT NULL,
  `mactpn` varchar(255) DEFAULT NULL,
  `mahd` varchar(255) DEFAULT NULL,
  `masp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK1488ob8r0m2iwfq552a0fdvjg` (`macthd`),
  KEY `FKduso63cl77wmb8ois5cpm18ms` (`mactpn`),
  KEY `FKrfuih1bfmfj53i7h3663hfmk3` (`mahd`),
  KEY `FK5tl3yfydpsdiswtdtg4cgoogy` (`masp`),
  CONSTRAINT `FK5tl3yfydpsdiswtdtg4cgoogy` FOREIGN KEY (`masp`) REFERENCES `san_pham` (`masp`),
  CONSTRAINT `FKduso63cl77wmb8ois5cpm18ms` FOREIGN KEY (`mactpn`) REFERENCES `chi_tiet_phieu_nhap` (`mactpn`),
  CONSTRAINT `FKrfuih1bfmfj53i7h3663hfmk3` FOREIGN KEY (`mahd`) REFERENCES `hoa_don` (`mahd`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
SET character_set_client = @saved_cs_client;

LOCK TABLES `chi_tiet_hoa_don` WRITE;
INSERT INTO `chi_tiet_hoa_don` VALUES
(1,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000',150000.00,'CTHD001',1,150000.00,'CTPN001','HD001','SP001'),
(2,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000',20000.00,'CTHD002',1,20000.00,'CTPN002','HD001','SP003'),
(3,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000',20000.00,'CTHD003',1,20000.00,'CTPN002','HD002','SP003');
UNLOCK TABLES;

-- =========================
-- chi_tiet_phieu_nhap
-- =========================
DROP TABLE IF EXISTS `chi_tiet_phieu_nhap`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `chi_tiet_phieu_nhap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `gia_nhap` decimal(18,2) DEFAULT NULL,
  `mactpn` varchar(255) DEFAULT NULL,
  `so_luong` int(11) DEFAULT NULL,
  `tong_tien` decimal(18,2) DEFAULT NULL,
  `mapn` varchar(255) DEFAULT NULL,
  `masp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKh62aa4hkm2edqlado2duukykb` (`mactpn`),
  KEY `FKkl3e6ypo8mcm8st8axnq3yj4g` (`mapn`),
  KEY `FKdjxtx10fxow826rs8ju4rlcvq` (`masp`),
  CONSTRAINT `FKdjxtx10fxow826rs8ju4rlcvq` FOREIGN KEY (`masp`) REFERENCES `san_pham` (`masp`),
  CONSTRAINT `FKkl3e6ypo8mcm8st8axnq3yj4g` FOREIGN KEY (`mapn`) REFERENCES `phieu_nhap` (`mapn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
SET character_set_client = @saved_cs_client;

LOCK TABLES `chi_tiet_phieu_nhap` WRITE;
INSERT INTO `chi_tiet_phieu_nhap` VALUES
(1,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000',100000.00,'CTPN001',3,300000.00,'PN001','SP001'),
(2,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000',15000.00,'CTPN002',10,150000.00,'PN002','SP003');
UNLOCK TABLES;

-- =========================
-- gio_hang  (đã cập nhật tổng tiền SP002)
-- =========================
DROP TABLE IF EXISTS `gio_hang`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `gio_hang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `so_luong` int(11) DEFAULT NULL,
  `tong_tien` decimal(18,2) DEFAULT NULL,
  `makh` varchar(255) DEFAULT NULL,
  `masp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKr918hcrsa82ly9duc4jsec5n8` (`makh`),
  KEY `FKahs2bb598hqvw7ap3d305mjo8` (`masp`),
  CONSTRAINT `FKahs2bb598hqvw7ap3d305mjo8` FOREIGN KEY (`masp`) REFERENCES `san_pham` (`masp`),
  CONSTRAINT `FKr918hcrsa82ly9duc4jsec5n8` FOREIGN KEY (`makh`) REFERENCES `khach_hang` (`makh`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
SET character_set_client = @saved_cs_client;

LOCK TABLES `gio_hang` WRITE;
INSERT INTO `gio_hang` VALUES
(1,'2025-10-17 10:02:48.000000','2025-10-17 10:01:24.000000',2,240000.00,'KH001','SP002'),
(2,'2025-10-17 10:02:48.000000','2025-10-17 10:01:24.000000',5,100000.00,'KH002','SP003');
UNLOCK TABLES;

-- =========================
-- hoa_don (giữ nguyên số liệu gốc)
-- =========================
DROP TABLE IF EXISTS `hoa_don`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `hoa_don` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `chiet_khau` decimal(18,2) DEFAULT NULL,
  `loaihd` bit(1) DEFAULT NULL,
  `mahd` varchar(255) DEFAULT NULL,
  `phuong_thuc_thanh_toan` bit(1) DEFAULT NULL,
  `tong_tien` decimal(18,2) DEFAULT NULL,
  `tong_tien_saukm` decimal(18,2) DEFAULT NULL,
  `trang_thai` varchar(255) DEFAULT NULL,
  `makh` varchar(255) DEFAULT NULL,
  `makm` varchar(255) DEFAULT NULL,
  `manv` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKmfvnkyeiv6g60ib6fjufigjil` (`mahd`),
  KEY `FKaj3rv1elsf8cymqgktx04q5rx` (`makh`),
  KEY `FK82nf58owekfnnp9baegivy2ag` (`makm`),
  KEY `FKr67k5gttxaonk5trdfwvcgk80` (`manv`),
  CONSTRAINT `FK82nf58owekfnnp9baegivy2ag` FOREIGN KEY (`makm`) REFERENCES `khuyen_mai` (`makm`),
  CONSTRAINT `FKaj3rv1elsf8cymqgktx04q5rx` FOREIGN KEY (`makh`) REFERENCES `khach_hang` (`makh`),
  CONSTRAINT `FKr67k5gttxaonk5trdfwvcgk80` FOREIGN KEY (`manv`) REFERENCES `nhan_vien` (`manv`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
SET character_set_client = @saved_cs_client;

LOCK TABLES `hoa_don` WRITE;
INSERT INTO `hoa_don` VALUES
(1,'2025-10-17 10:02:52.000000','2025-10-17 10:01:24.000000',0.00,b'1','HD001',b'1',170000.00,153000.00,'DA_THANH_TOAN','KH001','KM001','NV002'),
(2,'2025-10-17 10:02:52.000000','2025-10-17 10:01:24.000000',0.00,b'1','HD002',b'0',20000.00,20000.00,'CHO_THANH_TOAN','KH002',NULL,'NV002');
UNLOCK TABLES;

-- =========================
-- khach_hang
-- =========================
DROP TABLE IF EXISTS `khach_hang`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `khach_hang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `dia_chi` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ho_tenkh` varchar(255) DEFAULT NULL,
  `makh` varchar(255) DEFAULT NULL,
  `sdt` varchar(255) DEFAULT NULL,
  `tich_diem` decimal(18,2) DEFAULT NULL,
  `trang_thai` bit(1) DEFAULT NULL,
  `malkh` varchar(255) DEFAULT NULL,
  `matk` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKjv6ured1laqm2hnya5w8u7bjg` (`makh`),
  KEY `FKowuhbx70u8n2gtjyoqsyft9hd` (`malkh`),
  KEY `FK3bea9rksf7348cnohppt8i91t` (`matk`),
  CONSTRAINT `FK3bea9rksf7348cnohppt8i91t` FOREIGN KEY (`matk`) REFERENCES `tai_khoan` (`matk`),
  CONSTRAINT `FKowuhbx70u8n2gtjyoqsyft9hd` FOREIGN KEY (`malkh`) REFERENCES `loai_khach_hang` (`malkh`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
SET character_set_client = @saved_cs_client;

LOCK TABLES `khach_hang` WRITE;
INSERT INTO `khach_hang` VALUES
(1,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000','Q.1, TP.HCM','kh1@example.com','Phạm Quốc Khánh','KH001','0903000001',120.00,b'1','THANH_VIEN','TK_KH_001'),
(2,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000','Q.3, TP.HCM','kh2@example.com','Lê Thu Trang','KH002','0903000002',560.00,b'1','VIP',NULL);
UNLOCK TABLES;

-- =========================
-- kho
-- =========================
DROP TABLE IF EXISTS `kho`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `kho` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `ma_kho` varchar(255) DEFAULT NULL,
  `so_luong_ton` int(11) DEFAULT NULL,
  `trang_thai` bit(1) DEFAULT NULL,
  `mactpn` varchar(255) DEFAULT NULL,
  `masp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKoiha7s4wae8iwbisgcygnkstc` (`ma_kho`),
  KEY `FKnx6jkvbx35okiau78m523maca` (`mactpn`),
  KEY `FKlrrlt1vrmy7se6mlsak15ern1` (`masp`),
  CONSTRAINT `FKlrrlt1vrmy7se6mlsak15ern1` FOREIGN KEY (`masp`) REFERENCES `san_pham` (`masp`),
  CONSTRAINT `FKnx6jkvbx35okiau78m523maca` FOREIGN KEY (`mactpn`) REFERENCES `chi_tiet_phieu_nhap` (`mactpn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
SET character_set_client = @saved_cs_client;

LOCK TABLES `kho` WRITE;
INSERT INTO `kho` VALUES
(1,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000','KHO001',3,b'1','CTPN001','SP001'),
(2,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000','KHO002',10,b'1','CTPN002','SP003');
UNLOCK TABLES;

-- =========================
-- khuyen_mai
-- =========================
DROP TABLE IF EXISTS `khuyen_mai`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `khuyen_mai` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `gia_tri` decimal(18,2) DEFAULT NULL,
  `makm` varchar(255) DEFAULT NULL,
  `ngay_ket_thuc` datetime(6) DEFAULT NULL,
  `tenkm` varchar(255) DEFAULT NULL,
  `trang_thai` bit(1) DEFAULT NULL,
  `malkm` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK4983avd64qlec1v7iqxh0dahu` (`makm`),
  KEY `FKk8qs2dgla2i8x5wp6tu4qwn1e` (`malkm`),
  CONSTRAINT `FKk8qs2dgla2i8x5wp6tu4qwn1e` FOREIGN KEY (`malkm`) REFERENCES `loai_khuyen_mai` (`malkm`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
SET character_set_client = @saved_cs_client;

LOCK TABLES `khuyen_mai` WRITE;
INSERT INTO `khuyen_mai` VALUES
(1,'2025-10-17 10:01:15.000000','2025-10-17 10:01:15.000000',10.00,'KM001','2025-11-16 10:01:15.000000','Giảm 10%',b'1','PERCENT'),
(2,'2025-10-17 10:01:15.000000','2025-10-17 10:01:15.000000',20000.00,'KM002','2025-12-16 10:01:15.000000','Giảm 20K',b'1','AMOUNT');
UNLOCK TABLES;

-- =========================
-- lich_su_gia  (thêm giá cho SP002: LSG003)
-- =========================
DROP TABLE IF EXISTS `lich_su_gia`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `lich_su_gia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `gia_ban` decimal(18,2) DEFAULT NULL,
  `malsg` varchar(255) DEFAULT NULL,
  `ngay_ket_thuc` datetime(6) DEFAULT NULL,
  `trang_thai` bit(1) DEFAULT NULL,
  `mactpn` varchar(255) DEFAULT NULL,
  `masp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKkc1eec61igfogf8u945rcsana` (`malsg`),
  KEY `FKg85qp5htei6j0os3hedc6fc59` (`mactpn`),
  KEY `FKlbil1uvof0j3dtmwd64ds9o4` (`masp`),
  CONSTRAINT `FKg85qp5htei6j0os3hedc6fc59` FOREIGN KEY (`mactpn`) REFERENCES `chi_tiet_phieu_nhap` (`mactpn`),
  CONSTRAINT `FKlbil1uvof0j3dtmwd64ds9o4` FOREIGN KEY (`masp`) REFERENCES `san_pham` (`masp`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
SET character_set_client = @saved_cs_client;

LOCK TABLES `lich_su_gia` WRITE;
INSERT INTO `lich_su_gia` VALUES
(1,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000',150000.00,'LSG001',NULL,b'1','CTPN001','SP001'),
(2,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000',20000.00,'LSG002',NULL,b'1','CTPN002','SP003'),
(3,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000',120000.00,'LSG003',NULL,b'1',NULL,'SP002');
UNLOCK TABLES;

-- =========================
-- loai_khach_hang
-- =========================
DROP TABLE IF EXISTS `loai_khach_hang`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `loai_khach_hang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `malkh` varchar(255) DEFAULT NULL,
  `mo_ta` varchar(255) DEFAULT NULL,
  `ten_loaikh` varchar(255) DEFAULT NULL,
  `makm` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKs7vo6xdw9n7go89fyff8asueq` (`malkh`),
  KEY `FKrpjeyc5llubsyj838jvxfgf0j` (`makm`),
  CONSTRAINT `FKrpjeyc5llubsyj838jvxfgf0j` FOREIGN KEY (`makm`) REFERENCES `khuyen_mai` (`makm`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
SET character_set_client = @saved_cs_client;

LOCK TABLES `loai_khach_hang` WRITE;
INSERT INTO `loai_khach_hang` VALUES
(1,'2025-10-17 10:01:15.000000','2025-10-17 10:01:15.000000','THANH_VIEN','Khách hàng thành viên','Thành viên',NULL),
(2,'2025-10-17 10:01:15.000000','2025-10-17 10:01:15.000000','VIP','Khách hàng VIP','VIP',NULL);
UNLOCK TABLES;

-- =========================
-- loai_khuyen_mai
-- =========================
DROP TABLE IF EXISTS `loai_khuyen_mai`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `loai_khuyen_mai` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `malkm` varchar(255) DEFAULT NULL,
  `mo_ta` varchar(255) DEFAULT NULL,
  `ten_loaikm` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK1m7aj690i6tpexhyiut5e958x` (`malkm`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
SET character_set_client = @saved_cs_client;

LOCK TABLES `loai_khuyen_mai` WRITE;
INSERT INTO `loai_khuyen_mai` VALUES
(1,'2025-10-17 10:01:15.000000','2025-10-17 10:01:15.000000','PERCENT','Giảm theo phần trăm','Giảm theo %'),
(2,'2025-10-17 10:01:15.000000','2025-10-17 10:01:15.000000','AMOUNT','Giảm số tiền cố định','Giảm tiền mặt');
UNLOCK TABLES;

-- =========================
-- loai_san_pham
-- =========================
DROP TABLE IF EXISTS `loai_san_pham`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `loai_san_pham` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `malsp` varchar(255) DEFAULT NULL,
  `mo_ta` varchar(255) DEFAULT NULL,
  `ten_loai` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKcqo4xyg9mw9ndj6pb5oelay2a` (`malsp`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
SET character_set_client = @saved_cs_client;

LOCK TABLES `loai_san_pham` WRITE;
INSERT INTO `loai_san_pham` VALUES
(1,'2025-10-17 10:01:15.000000','2025-10-17 10:01:15.000000','SACH','Danh mục sách','Sách'),
(2,'2025-10-17 10:01:15.000000','2025-10-17 10:01:15.000000','VPP','Bút, vở, dụng cụ','Văn phòng phẩm');
UNLOCK TABLES;

-- =========================
-- nha_cung_cap
-- =========================
DROP TABLE IF EXISTS `nha_cung_cap`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `nha_cung_cap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `dia_chi` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mancc` varchar(255) DEFAULT NULL,
  `ngay_ket_thuc` datetime(6) DEFAULT NULL,
  `sdt` varchar(255) DEFAULT NULL,
  `tenncc` varchar(255) DEFAULT NULL,
  `trang_thai` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKj9tneodxnkoiusw74jbi5c8tf` (`mancc`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
SET character_set_client = @saved_cs_client;

LOCK TABLES `nha_cung_cap` WRITE;
INSERT INTO `nha_cung_cap` VALUES
(1,'2025-10-17 10:01:15.000000','2025-10-17 10:01:15.000000','TP.HCM','contact@nxbtre.vn','NCC001',NULL,'0901000001','NXB Trẻ',b'1'),
(2,'2025-10-17 10:01:15.000000','2025-10-17 10:01:15.000000','Hà Nội','contact@alphabooks.vn','NCC002',NULL,'0901000002','Alpha Books',b'1'),
(3,NULL,NULL,'TP.HCM','kd@gmail.com','NCC003',NULL,'0987643382','NXB Kim Đồng',b'1'),
(4,NULL,NULL,'TP.HCM','tl@gmail.com','NCC004',NULL,'0347684232','Thiên Long',b'1'),
(5	NULL,NULL,'TP.HCM','Nn@gmail.com','NCC005',NULL,'0533422224','NXB Nhã Nam',b'1'),
(6,NULL,NULL,'TP.HCM','Dd@gmail.com','NCC006',NULL,'0739343333','NXB Đương Đại',b'1'),
(7,NULL,NULL,'TP.HCM','Tho@gmail.com','NCC007',NULL,'0993423444','NXB Thơ',b'1'),
(8,NULL,NULL,'TP.HCM','Nt@gmail.com','NCC008',NULL,'0942323455','NXB Nghệ Thuật',b'1'),
(9,NULL,NULL,'TP.HCM','Kt@gmail.com','NCC009',NULL,'0653828222','NXB Kiến Trúc',b'1'),
(10,NULL,NULL,'TP.HCM','Bk@gmail.com','NCC010',NULL,'0234733733','NXB Bách Khoa',b'1');
UNLOCK TABLES;

-- =========================
-- nhan_vien
-- =========================
DROP TABLE IF EXISTS `nhan_vien`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `nhan_vien` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gioi_tinh` bit(1) DEFAULT NULL,
  `ho_tennv` varchar(255) DEFAULT NULL,
  `manv` varchar(255) DEFAULT NULL,
  `ngay_sinh` datetime(6) DEFAULT NULL,
  `sdt` varchar(255) DEFAULT NULL,
  `trang_thai` bit(1) DEFAULT NULL,
  `matk` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKbjuvygrfxuvbainixc04llvd3` (`manv`),
  KEY `FKdjvbcvjauxfuhhx0778pin58j` (`matk`),
  CONSTRAINT `FKdjvbcvjauxfuhhx0778pin58j` FOREIGN KEY (`matk`) REFERENCES `tai_khoan` (`matk`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
SET character_set_client = @saved_cs_client;

LOCK TABLES `nhan_vien` WRITE;
INSERT INTO `nhan_vien` VALUES
(1,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000','nv.kho@example.com',b'1','Nguyễn Văn Kho','NV001','1995-05-05 00:00:00.000000','0902000001',b'1','TK_NV_KHO'),
(2,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000','nv.banhang@example.com',b'0','Trần Thu Bán','NV002','1998-08-20 00:00:00.000000','0902000002',b'1','TK_NV_BH');
UNLOCK TABLES;

-- =========================
-- phieu_doi_tra
-- =========================
DROP TABLE IF EXISTS `phieu_doi_tra`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `phieu_doi_tra` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `ly_do` varchar(255) DEFAULT NULL,
  `mapdt` varchar(255) DEFAULT NULL,
  `trang_thai` bit(1) DEFAULT NULL,
  `mahd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKsts62mmv9edcrrwfi6r5hjsae` (`mapdt`),
  KEY `FKhjukeyklnsi2j59oxc3mraudu` (`mahd`),
  CONSTRAINT `FKhjukeyklnsi2j59oxc3mraudu` FOREIGN KEY (`mahd`) REFERENCES `hoa_don` (`mahd`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
SET character_set_client = @saved_cs_client;

LOCK TABLES `phieu_doi_tra` WRITE;
INSERT INTO `phieu_doi_tra` VALUES
(1,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000','Sách lỗi gáy','PDT001',b'0','HD001');
UNLOCK TABLES;

-- =========================
-- phieu_nhap
-- =========================
DROP TABLE IF EXISTS `phieu_nhap`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `phieu_nhap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `chiet_khau` decimal(18,2) DEFAULT NULL,
  `madxpn` varchar(255) DEFAULT NULL,
  `mapn` varchar(255) DEFAULT NULL,
  `mo_ta` varchar(255) DEFAULT NULL,
  `tong_tien` decimal(18,2) DEFAULT NULL,
  `trang_thai` varchar(255) DEFAULT NULL,
  `mancc` varchar(255) DEFAULT NULL,
  `manv` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK29aeb3x6exhv57qxf5wtnqlfc` (`mapn`),
  KEY `FKbw2u0ber2va865kg948efhlm5` (`mancc`),
  KEY `FKlavt7ihi8dug436gh1vq69w1y` (`manv`),
  CONSTRAINT `FKbw2u0ber2va865kg948efhlm5` FOREIGN KEY (`mancc`) REFERENCES `nha_cung_cap` (`mancc`),
  CONSTRAINT `FKlavt7ihi8dug436gh1vq69w1y` FOREIGN KEY (`manv`) REFERENCES `nhan_vien` (`manv`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
SET character_set_client = @saved_cs_client;

LOCK TABLES `phieu_nhap` WRITE;
INSERT INTO `phieu_nhap` VALUES
(1,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000',0.00,NULL,'PN001','Nhập sách Java',300000.00,'DA_NHAP','NCC001','NV001'),
(2,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000',0.00,NULL,'PN002','Nhập VPP',150000.00,'DA_NHAP','NCC002','NV001');
UNLOCK TABLES;

-- =========================
-- san_pham (giữ nguyên data gốc)
-- =========================
-- =========================
-- san_pham (SẢN PHẨM)
-- =========================
DROP TABLE IF EXISTS `san_pham`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `san_pham` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  `masp` varchar(255) DEFAULT NULL,
  `mo_ta` varchar(255) DEFAULT NULL,
  `tensp` varchar(255) DEFAULT NULL,
  `trang_thai` bit(1) DEFAULT NULL,
  `makm` varchar(255) DEFAULT NULL,
  `malsp` varchar(255) DEFAULT NULL,
  `thu_muc_anh` varchar(255) DEFAULT NULL,
  `thuong_hieu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKdijmg6lhg4a4pdp5pv23mp06e` (`masp`),
  KEY `FKifilii8gw5j3p2d5nri9jbe2d` (`makm`),
  KEY `FK83y0wb1w2v05exel3ndfdyb50` (`malsp`),
  CONSTRAINT `FK83y0wb1w2v05exel3ndfdyb50` FOREIGN KEY (`malsp`) REFERENCES `loai_san_pham` (`malsp`),
  CONSTRAINT `FKifilii8gw5j3p2d5nri9jbe2d` FOREIGN KEY (`makm`) REFERENCES `khuyen_mai` (`makm`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4;
SET character_set_client = @saved_cs_client;

LOCK TABLES `san_pham` WRITE;
/*!40000 ALTER TABLE `san_pham` DISABLE KEYS */;

INSERT INTO `san_pham` (`id`,`ngay_cap_nhat`,`ngay_tao`,`hinh_anh`,`masp`,`mo_ta`,`tensp`,`trang_thai`,`makm`,`malsp`,`thu_muc_anh`,`thuong_hieu`) VALUES
(1,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000','1.1.jpg','SP001','','Define The Relationship - Định Rõ Mối Quan Hệ',b'1','KM001','SACH','ngon-tinh','NXB Trẻ'),
(2,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000','1.2.jpg','SP002','','Vũ Khúc Đoạn Tình (Tái bản năm 2025)',b'1',NULL,'SACH','ngon-tinh','NXB Kim Đồng'),
(3,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000','2.jpg','SP003','','Vẫn Cứ Yêu',b'1','KM002','SACH','ngon-tinh','Thiên Long'),
(4,NULL,NULL,'4.1.jpg','SP004',NULL,'Khi Anh Cười, Hào Hoa Phong Nhã',NULL,NULL,'SACH','ngon-tinh','NXB Trẻ'),
(5,NULL,NULL,'5.jpg','SP005',NULL,'Reminders Of Him - Hồi Ức Vụn Vỡ',NULL,NULL,'SACH','ngon-tinh','NXB Trẻ'),
(6,NULL,NULL,'6.jpg','SP006',NULL,'Đuổi Theo Mùa Hạ',NULL,NULL,'SACH','ngon-tinh','NXB Trẻ'),
(7,NULL,NULL,'1.jpg','SP007',NULL,'Tết Ở Làng Địa Ngục',NULL,NULL,'SACH','kinh-di','NXB Trẻ'),
(8,NULL,NULL,'1.4.jpg','SP008',NULL,'Đũa: Chuyện Linh Dị',NULL,NULL,'SACH','kinh-di','NXB Trẻ'),
(9,NULL,NULL,'3.jpg','SP009',NULL,'Ngôi Nhà Kỳ Quái',NULL,NULL,'SACH','kinh-di','NXB Trẻ'),
(10,NULL,NULL,'4.jpg','SP010',NULL,'Sĩ Số Lớp Vắng 0',NULL,NULL,'SACH','kinh-di','NXB Trẻ'),
(15,NULL,NULL,'7.jpg','SP011',NULL,'Tình Yêu Đau Dạ Dày',b'1',NULL,'SACH','ngon-tinh','NXB Trẻ'),
(16	NULL,NULL,'8.jpg','SP012',NULL,'Heart Bones - Lời Nói Dối Mùa Hè',b'1',NULL,'SACH','ngon-tinh','NXB Trẻ'),
(17,NULL,NULL,'9.jpg','SP013',NULL,'Con Dao Nhỏ Của Emiri',b'1',NULL,'SACH','ngon-tinh','NXB Trẻ'),
(18,NULL,NULL,'10.jpg','SP014',NULL,'Yêu Anh Hơn Cả Tử Thần',b'1',NULL,'SACH','ngon-tinh','NXB Trẻ'),
(19,NULL,NULL,'11.jpg','SP015',NULL,'Phán Quan',b'1',NULL,'SACH','ngon-tinh','NXB Trẻ'),
(20,NULL,NULL,'5.jpg','SP016',NULL,'Đôi Mắt Trũng Sâu',b'1',NULL,'SACH','kinh-di','NXB Kim Đồng'),
(21	NULL,NULL,'6.jpg','SP017',NULL,'Những Đồ Vật Có Linh Hồn',b'1',NULL,'SACH','kinh-di','NXB Nhã Nam'),
(22,NULL,NULL,'7.jpg','SP018',NULL,'Bức Họa Múa Rối Xương',b'1',NULL,'SACH','kinh-di','NXB Trẻ'),
(23,NULL,NULL,'8.jpg','SP019',NULL,'Tứ Trấn Huyền Linh',b'1',NULL,'SACH','kinh-di','NXB Nhã Nam'),
(24,NULL,NULL,'9.jpg','SP020',NULL,'Bóng Trăng Trắng Ngà',b'1',NULL,'SACH','kinh-di','NXB Trẻ'),
(25	NULL,NULL,'10.jpg','SP021',NULL,'Ám Ảnh',b'1',NULL,'SACH','kinh-di','NXB Trẻ'),
(26	NULL,NULL,'11.jpg','SP022','17 Âm 1','17 Âm 1',b'1',NULL,'SACH','kinh-di','NXB Trẻ'),
(27	NULL,NULL,'1.jpg','SP023',NULL,'Xứ Tháng Mười',b'1',NULL,'SACH','vien-tuong','NXB Trẻ'),
(28	NULL,NULL,'2.jpg','SP024',NULL,'Trường Ca Achilles',b'1',NULL,'SACH','vien-tuong','NXB Trẻ'),
(29	NULL,NULL,'4.jpg','SP026',NULL,'Biên Niên Ký Sao Hỏa',b'1',NULL,'SACH','vien-tuong','NXB Trẻ'),
(30	NULL,NULL,'5.jpg','SP027',NULL,'Cái Chết Của Những Xác Sống - Tập 1',b'1',NULL,'SACH','vien-tuong','NXB Trẻ'),
(31	NULL,NULL,'6.jpg','SP028',NULL,'Hòn Đá Mù - Medusa Những Chuyện Chưa Kể',b'1',NULL,'SACH','vien-tuong','NXB Trẻ'),
(32	NULL,NULL,'7.jpg','SP029',NULL,'Cựu Tộc - Quyển 1: Huyền Thoại Về Rồng Tuyết',b'1',NULL,'SACH','vien-tuong','NXB Trẻ'),
(33	NULL,NULL,'8.jpg','SP030','','Hội Bàn Tròn Ma Thuật - Tập 1: Legendborn',b'1',NULL,'SACH','vien-tuong','NXB Trẻ'),
(34	NULL,NULL,'9.jpg','SP031','Thế Giới Atlantis','Thế Giới Atlantis',b'1',NULL,'SACH','vien-tuong','NXB Trẻ'),
(35	NULL,NULL,'10.jpg','SP032',NULL,'Fourth Wing - Cánh Tư',b'1',NULL,'SACH','vien-tuong','NXB Trẻ'),
(36	NULL,NULL,'11.jpg','SP033','Kẻ Canh Gác Bầu Trời - Những Chân Trời Đã Mất','Kẻ Canh Gác Bầu Trời - Những Chân Trời Đã Mất',b'1',NULL,'SACH','vien-tuong','NXB Trẻ'),
(37	NULL,NULL,'1.jpg','SP034',NULL,'Ghi Chép Pháp Y - Những Thi Thể Không Hoàn Chỉnh',b'1',NULL,'SACH','trinh-tham','NXB Trẻ'),
(38	NULL,NULL,'2.jpg','SP035',NULL,'Tội Ác Liên Hoàn - Tập 1: Ván Bài Đô Mi Nô',b'1',NULL,'SACH','trinh-tham','NXB Trẻ'),
(39	NULL,NULL,'3.jpg','SP036',NULL,'Sự Thật Bị Che Khuất',b'1',NULL,'SACH','trinh-tham','NXB Trẻ'),
(40	NULL,NULL,'5.jpg','SP038',NULL,'Nhân Chứng Cuối Cùng',b'1',NULL,'SACH','trinh-tham','NXB Trẻ'),
(41	NULL,NULL,'6.jpg','SP039',NULL,'8 Vụ Án Hoàn Hảo - Vạch Trần Tâm Lý Kẻ Phạm Tội',b'1',NULL,'SACH','trinh-tham','NXB Trẻ'),
(42	NULL,NULL,'7.jpg','SP040',NULL,'Sherlock Holmes: Tuyển Tập Những Vụ Án Hóc Búa Nhất',b'1',NULL,'SACH','trinh-tham','NXB Trẻ'),
(43	NULL,NULL,'8.jpg','SP041',NULL,'Cô Hầu Gái',b'1',NULL,'SACH','trinh-tham','NXB Trẻ'),
(44	NULL,NULL,'9.jpg','SP042',NULL,'Hải Quỳ',b'1',NULL,'SACH','trinh-tham','NXB Trẻ'),
(45	NULL,NULL,'1.jpg','SP044',NULL,'Nếu Gặp Lại Em Trên Ngọn Đồi Hoa Nở',b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
(46	NULL,NULL,'2.jpg','SP045',NULL,'Hôn Nhân Hạnh Phúc Của Tôi',b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
(47	NULL	NULL,'3.jpg','SP046',NULL,'Đêm Nay Dẫu Tình Yêu Này Biến Mất Khỏi Thế Gian',b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
(48	NULL,NULL,'4.jpg','SP047',NULL,'Hội Chứng Tuổi Thanh Xuân',b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
(49	NULL,NULL,'5.jpg','SP048',NULL,'Thiên Sứ Nhà Bên',b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
(50	NULL	NULL,'6.jpg','SP049',NULL,'Chúa Tể Bóng Tối',b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
(51	NULL	NULL,'7.jpg','SP050',NULL,'Dược Sư Tự Sự',b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
(52	NULL,NULL,'8.jpg','SP051','Tôi Muốn Bảo Vệ Cậu, Dù Phải Mất Đi... Tình Yêu Này','Tôi Muốn Bảo Vệ Cậu, Dù Phải Mất Đi... Tình Yêu Này',b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
(53	NULL	NULL,'9.jpg','SP052',NULL,'Thám Tử Đã Chết',b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
(54	NULL	NULL,'10.jpg','SP053',NULL,'Arya Bàn Bên Thỉnh Thoảng Lại Trêu Ghẹo Tôi Bằng Tiếng Nga',b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
(55	NULL,NULL,'11.jpg','SP054',NULL,'Nguyệt Đạo Dị Giới',b'1',NULL,'SACH','tieu-thuyet','NXB Trẻ'),
(56	NULL	NULL,'1.jpg','SP055',NULL,'Thắng Pháp Trên Bầu Trời Điện Biên Phủ',b'1',NULL,'SACH','truyen-lich-su','NXB Trẻ'),
(57	NULL	NULL,'2.jpg','SP056',NULL,'Hồ Xuân Hương',b'1',NULL,'SACH','truyen-lich-su','NXB Kim Đồng'),
(58	NULL	NULL,'4.jpg','SP058',NULL,'Bốn Năm Sau Và Những Trang Viết Về Điện Biên',b'1',NULL,'SACH','truyen-lich-su','NXB Kim Đồng'),
(59	NULL	NULL,'6.jpg','SP060',NULL,'Ngự Tiền Quan Án - Đại Án Quảng Nam',b'1',NULL,'SACH','truyen-lich-su','NXB Kim Đồng'),
(60	NULL	NULL,'7.jpg','SP061','Nước Non Vạn Dặm 3 - Từ Việt Bắc Về Hà Nội','Nước Non Vạn Dặm 3 - Từ Việt Bắc Về Hà Nội',b'1',NULL,'SACH','truyen-lich-su','NXB Kim Đồng'),
(61	NULL	NULL,'8.jpg','SP062',NULL,'Ấn Kiếm Hồng Nhan',b'1',NULL,'SACH','truyen-lich-su','NXB Kim Đồng'),
(62	NULL	NULL,'9.jpg','SP063',NULL,'Hoàng Lê Nhất Thống Chí',b'1',NULL,'SACH','truyen-lich-su','NXB Kim Đồng'),
(63	NULL	NULL,'10.jpg','SP064','Như Sơ','Như Sơ',b'1',NULL,'SACH','truyen-lich-su','NXB Kim Đồng'),
(64	NULL	NULL,'11.jpg','SP065','Trần Triều Nhàn Thoại','Trần Triều Nhàn Thoại',b'1',NULL,'SACH','truyen-lich-su','NXB Kim Đồng'),
(65	NULL	NULL,'1.jpg','SP066','Khó Dỗ Dành','Khó Dỗ Dành',b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
(66	NULL	NULL,'2.jpg','SP067',NULL,'Nếu Gặp Lại Em Trên Ngọn Đồi Hoa Nở',b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
(67	NULL	NULL,'3.jpg','SP068',NULL,'Những Chiếc Cầu Ở Quận Madison (Tái bản năm 2022)',b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
(68	NULL	NULL,'4.jpg','SP069',NULL,'Lưỡng Giới (Giải Pulitzer 2003) (Bìa Mềm)',b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
(69	NULL	NULL,'5.jpg','SP070',NULL,'Điều Kỳ Diệu Của Tiệm Tạp Hóa Namiya (Tái bản năm 2018)',b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
(70	NULL	NULL,'6.jpg','SP071',NULL,'Người Đẹp Ngủ Mê (Tái bản năm 2023)',b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
(71	NULL	NULL,'7.jpg','SP072',NULL,'Chiến Binh Cầu Vồng',b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
(72	NULL	NULL,'8.jpg','SP073',NULL,'Gã Du Đãng Chúng Ta Đang Lùng Kiếm',b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
(73	NULL	NULL,'9.jpg','SP074',NULL,'Đêm Nay Dẫu Tình Yêu Này Biến Mất Khỏi Thế Gian',b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
(74	NULL	NULL,'10.jpg','SP075',NULL,'Thoát Đến Phương Tây',b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
(75	NULL	NULL,'11.jpg','SP076',NULL,'Truyện Kiều Văn Xuôi: Dành Cho Người Trẻ (Tái bản năm 2022)',b'1',NULL,'SACH','van-hoc-duong-dai','NXB Đương Đại'),
(76	NULL	NULL,'1.jpg','SP077',NULL,'Tục Ngữ, Ca Dao, Dân Ca Việt Nam',b'1',NULL,'SACH','tho-van','NXB Thơ'),
(77	NULL	NULL,'2.jpg','SP078',NULL,'Ai Tưới Tình Để Hồn Thơ Lén Nở',b'1',NULL,'SACH','tho-van','NXB Thơ'),
(78	NULL	NULL,'3.jpg','SP079',NULL,'Vườn Tôi Có Cây Lá Bình Yên',b'1',NULL,'SACH','tho-van','NXB Thơ'),
(79	NULL	NULL,'4.jpg','SP080',NULL,'Tặng Người, Người Ấy Em Thương',b'1',NULL,'SACH','tho-van','NXB Thơ'),
(80	NULL	NULL,'5.jpg','SP081',NULL,'Cảm Ơn Bạn Đã Không Từ Bỏ Chính Mình',b'1',NULL,'SACH','tho-van','NXB Thơ'),
(81	NULL	NULL,'6.jpg','SP082',NULL,'Thanh Xuân Là Gì Em Nhỉ?',b'1',NULL,'SACH','tho-van','NXB Thơ'),
(82	NULL	NULL,'7.jpg','SP083',NULL,'Không Sao Mà Chúng Ta Rồi Sẽ Ổn',b'1',NULL,'SACH','tho-van','NXB Thơ'),
(83	NULL	NULL,'8.jpg','SP084',NULL,'Người Con Gái Ta Thương',b'1',NULL,'SACH','tho-van','NXB Thơ'),
(84	NULL	NULL,'9.jpg','SP085',NULL,'Thơ Từng Ôm Và Mặt Trời Từng Hạt (Bộ 4 quyển + CD 32 bài thơ của Thiền sư Thích Nhất Hạnh)',b'1',NULL,'SACH','tho-van','NXB Thơ'),
(85	NULL	NULL,'10.jpg','SP086',NULL,'Như Sao Trời Ôm Lấy Đại Dương',b'1',NULL,'SACH','tho-van','NXB Thơ'),
(86	NULL	NULL,'11.jpg','SP087',NULL,'An (Thơ @yenlamtho)',b'1',NULL,'SACH','tho-van','NXB Thơ'),
(87	NULL	NULL,'1.jpg','SP088',NULL,'Tranh Dân Gian Việt Nam: Sưu Tầm Và Nghiên Cứu',b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
(88	NULL	NULL,'2.jpg','SP089',NULL,'Để Hiểu Nghệ Thuật',b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
(89	NULL	NULL,'3.jpg','SP090',NULL,'Xem Tranh',b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
(90	NULL	NULL,'4.jpg','SP091',NULL,'Kiến Thức Căn Bản Cần Biết - Theo Dòng Lịch Sử Nghệ Thuật',b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
(91	NULL	NULL,'5.jpg','SP092',NULL,'Nghệ Thuật Với Thị Giác',b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
(92	NULL	NULL,'6.jpg','SP093',NULL,'Dẫn Luận Về Lịch Sử Nghệ Thuật',b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
(93	NULL	NULL,'7.jpg','SP094',NULL,'Mỹ Thuật Huế - Nhìn Từ Góc Độ Ý Nghĩa Và Biểu Tượng Trang Trí',b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
(94	NULL	NULL,'8.jpg','SP095',NULL,'Câu Chuyện Nghệ Thuật - Lịch Sử Nghệ Thuật Qua Các Trào Lưu Lớn Và Những Kiệt Tác Truyền Cảm Hứng',b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
(95	NULL	NULL,'9.jpg','SP096',NULL,'Vẻ Đẹp Của Những Vật Dụng Hàng Ngày',b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
(96	NULL	NULL,'10.jpg','SP097',NULL,'Nghệ Thuật Không Chỉ Để Ngắm',b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
(97	NULL	NULL,'11.jpg','SP098',NULL,'How Art Works - Hiểu Hết Về Nghệ Thuật',b'1',NULL,'SACH','nghe-thuat','NXB Nghệ Thuật'),
(98	NULL	NULL,'1.jpg','SP099',NULL,'Thái Công - A Passion for Aesthetics (Sách tiếng Anh)',b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
(99	NULL	NULL,'2.jpg','SP100',NULL,'Kiến Trúc Hiện Đại Miền Nam Việt Nam - Chủ Nghĩa Bản Địa Hiện Đại Giữa Thế Kỷ XX',b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
(100,NULL,NULL,'3.jpg','SP101',NULL,'Kỹ Thuật Kiến Trúc Cảnh Quan',b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
(101,NULL,NULL,'4.jpg','SP102',NULL,'Ngôi Nhà Điên (Sách ảnh) (Ngôn ngữ Việt-Anh-Trung-Nga)',b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
(102,NULL,NULL,'5.jpg','SP103',NULL,'Dẫn Luận Về Kiến Trúc',b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
(103,NULL,NULL,'6.jpg','SP104',NULL,'Lịch Sử Kiến Trúc Cảnh Quan Thế Giới Qua Hình Vẽ',b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
(104,NULL,NULL,'7.jpg','SP105',NULL,'Nhận Diện Đô Thị Việt Nam Đương Đại: Câu Chuyện Quy Hoạch - Kiến Trúc',b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
(105,NULL,NULL,'8.jpg','SP106',NULL,'A Crash Course Series: Đọc Hiểu Công Trình Kiến Trúc',b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
(106,NULL,NULL,'9.jpg','SP107',NULL,'Có Ngôi Nhà Ở Trong Ta',b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
(107	NULL,NULL,'10.jpg','SP108',NULL,'Kiến Trúc Pháp - Đông Dương: Dấu Tích "Sài Gòn - Hòn Ngọc Viễn Đông"',b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
(108	NULL,NULL,'11.jpg','SP109',NULL,'Kiến Trúc Hà Nội',b'1',NULL,'SACH','kien-truc-xay-dung','NXB Kiến Trúc'),
(109	NULL,NULL,'1.jpg','SP110',NULL,'Atlas Thế Giới',b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa'),
(110	NULL,NULL,'2.jpg','SP111',NULL,'Combo Em Vào Bếp (Bộ 5 cuốn)',b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa'),
(111	NULL	NULL,'3.jpg','SP112',NULL,'A Lê Hấp! Thế Giới Chim',b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa'),
(112	NULL	NULL,'4.jpg','SP113',NULL,'Từ Điển Muôn Loài - Những Người Bạn Rừng Xanh (Tái bản năm 2020)',b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa'),
(113	NULL	NULL,'5.jpg','SP114',NULL,'Từ Điển Muôn Loài - Những Người Bạn Côn Trùng',b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa'),
(114	NULL	NULL,'6.jpg','SP115',NULL,'Từ Điển Muôn Loài - Chúng Mình Thích Bay Lượn',b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa'),
(115	NULL	NULL,'7.jpg','SP116',NULL,'Từ Điển Muôn Loài - Những Người Bạn Lạ Kì (Tái bản năm 2020)',b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa'),
(116	NULL	NULL,'8.jpg','SP117',NULL,'Từ Điển Muôn Loài - Chúng Mình Thích Nước (Tái bản năm 2020)',b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa'),
(117	NULL	NULL,'9.jpg','SP118',NULL,'Combo Lịch Sử Việt Nam Bằng Tranh (Bộ 8 cuốn)',b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa'),
(118	NULL	NULL,'10.jpg','SP119',NULL,'Bách Khoa Thư Về Thế Giới Động Vật (Bìa cứng)',b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa'),
(119,NULL,NULL,'11.jpg','SP120',NULL,'Mở Khóa Trí Tưởng Tượng - Hơn 250 Cách Đập Tan Buồn Chán',b'1',NULL,'SACH','kien-thuc-bach-khoa','NXB Bách Khoa');

 /*!40000 ALTER TABLE `san_pham` ENABLE KEYS */;
UNLOCK TABLES;

-- tai_khoan
-- =========================
DROP TABLE IF EXISTS `tai_khoan`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `tai_khoan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `matk` varchar(255) DEFAULT NULL,
  `mat_khau` varchar(255) DEFAULT NULL,
  `ten_dang_nhap` varchar(255) DEFAULT NULL,
  `trang_thai` bit(1) DEFAULT NULL,
  `mavt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKbxghbwgockjhb16k9op6j5sja` (`matk`),
  UNIQUE KEY `UKgkh4qh51gkiu8ccu1ybn1q7h7` (`ten_dang_nhap`),
  KEY `FK5j4uu98lrnv6k85sc98ggxbs` (`mavt`),
  CONSTRAINT `FK5j4uu98lrnv6k85sc98ggxbs` FOREIGN KEY (`mavt`) REFERENCES `vai_tro` (`mavt`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
SET character_set_client = @saved_cs_client;

LOCK TABLES `tai_khoan` WRITE;
INSERT INTO `tai_khoan` VALUES
(1,'2025-10-17 10:01:15.000000','2025-10-17 10:01:15.000000','TK_ADMIN','$2a$10$bz.P4YnSDtcS.derj5g9AuwvYylZU7gGk1jBGngg2PWBFZBdS3T0G','admin',b'1','ADMIN'),
(2,'2025-10-17 10:01:15.000000','2025-10-17 10:01:15.000000','TK_NV_KHO','$2a$10$bz.P4YnSDtcS.derj5g9AuwvYylZU7gGk1jBGngg2PWBFZBdS3T0G','nvkho',b'1','NV_KHO'),
(3,'2025-10-17 10:01:15.000000','2025-10-17 10:01:15.000000','TK_NV_BH','$2a$10$bz.P4YnSDtcS.derj5g9AuwvYylZU7gGk1jBGngg2PWBFZBdS3T0G','nvbanhang',b'1','NV_BANHANG'),
(4,'2025-10-17 10:01:15.000000','2025-10-17 10:01:15.000000','TK_KH_001','$2a$10$bz.P4YnSDtcS.derj5g9AuwvYylZU7gGk1jBGngg2PWBFZBdS3T0G','kh001',b'1','KHACH_HANG');
UNLOCK TABLES;

-- =========================
-- vai_tro (đã bỏ dòng trùng NV_BAN_HANG)
-- =========================
DROP TABLE IF EXISTS `vai_tro`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `vai_tro` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `mavt` varchar(255) DEFAULT NULL,
  `ten_vai_tro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKafdl9jfjhytekk4q69e2mxylk` (`mavt`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
SET character_set_client = @saved_cs_client;

LOCK TABLES `vai_tro` WRITE;
INSERT INTO `vai_tro` VALUES
(1,'2025-10-17 10:01:15.000000','2025-10-17 10:01:15.000000','ADMIN','Quản trị'),
(2,'2025-10-17 10:01:15.000000','2025-10-17 10:01:15.000000','NV_KHO','Nhân viên kho'),
(3,'2025-10-17 10:01:15.000000','2025-10-17 10:01:15.000000','NV_BANHANG','Nhân viên bán hàng'),
(4,'2025-10-17 10:01:15.000000','2025-10-17 10:01:15.000000','KHACH_HANG','Khách hàng');
UNLOCK TABLES;

-- =========================
-- yeu_thich
-- =========================
DROP TABLE IF EXISTS `yeu_thich`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `yeu_thich` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_cap_nhat` datetime(6) DEFAULT NULL,
  `ngay_tao` datetime(6) DEFAULT NULL,
  `makh` varchar(255) DEFAULT NULL,
  `masp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKityv2l4uh7mplgjoe791ef9a4` (`makh`),
  KEY `FKeebb36u6565kyck38o4v4n2kn` (`masp`),
  CONSTRAINT `FKeebb36u6565kyck38o4v4n2kn` FOREIGN KEY (`masp`) REFERENCES `san_pham` (`masp`),
  CONSTRAINT `FKityv2l4uh7mplgjoe791ef9a4` FOREIGN KEY (`makh`) REFERENCES `khach_hang` (`makh`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
SET character_set_client = @saved_cs_client;

LOCK TABLES `yeu_thich` WRITE;
INSERT INTO `yeu_thich` VALUES
(1,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000','KH001','SP002'),
(2,'2025-10-17 10:01:24.000000','2025-10-17 10:01:24.000000','KH001','SP003');
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
 /*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
 /*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
 /*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
 /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
 /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
 /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
 /*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed (clean)
