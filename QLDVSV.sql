CREATE DATABASE  IF NOT EXISTS `qldvsv` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `qldvsv`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: qldvsv
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ctsv`
--

DROP TABLE IF EXISTS `ctsv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctsv` (
  `MaCTSV` int NOT NULL AUTO_INCREMENT,
  `Id_tk` int DEFAULT NULL,
  `MaTT` int DEFAULT NULL,
  `TrangThai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaCTSV`),
  KEY `fkey_taikhoan_ctsv_idx` (`Id_tk`),
  KEY `fkey_ttcanhan_ctsv_idx` (`MaTT`),
  CONSTRAINT `fkey_taikhoan_ctsv` FOREIGN KEY (`Id_tk`) REFERENCES `taikhoan` (`Id_tk`),
  CONSTRAINT `fkey_ttcanhan_ctsv` FOREIGN KEY (`MaTT`) REFERENCES `thongtincanhan` (`MaTT`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctsv`
--

LOCK TABLES `ctsv` WRITE;
/*!40000 ALTER TABLE `ctsv` DISABLE KEYS */;
INSERT INTO `ctsv` VALUES (1,2,3,'Đang làm'),(2,3,4,'Đang làm');
/*!40000 ALTER TABLE `ctsv` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_TT_CTSV_trigger` AFTER UPDATE ON `ctsv` FOR EACH ROW BEGIN
    IF NEW.TrangThai = 'Đã nghỉ việc' THEN
        UPDATE TaiKhoan
        SET TrangThai = 'disable'
        WHERE id_tk = NEW.id_tk;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ctxh`
--

DROP TABLE IF EXISTS `ctxh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctxh` (
  `MaHD` int NOT NULL AUTO_INCREMENT,
  `TenHD` varchar(100) DEFAULT NULL,
  `Diem` int DEFAULT NULL,
  `NoiDung` varchar(500) DEFAULT NULL,
  `TgDienRa` datetime DEFAULT NULL,
  `TgKetThuc` datetime DEFAULT NULL,
  `TrangThai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaHD`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctxh`
--

LOCK TABLES `ctxh` WRITE;
/*!40000 ALTER TABLE `ctxh` DISABLE KEYS */;
INSERT INTO `ctxh` VALUES (6,'Cuộc thi Tin học',5,'Cuộc thi về Tin học','2023-12-01 08:00:00','2023-12-01 17:00:00',NULL),(7,'Chương trình Tình nguyện',10,'Chương trình tình nguyện','2023-12-05 09:00:00','2023-12-05 16:00:00',NULL),(8,'Hội thảo Khoa học',5,'Hội thảo nghiên cứu khoa học','2023-12-10 13:00:00','2023-12-10 18:00:00',NULL),(9,'Đêm nhạc Sinh viên',5,'Đêm nhạc sinh viên nổi tiếng','2023-12-20 19:00:00','2023-12-20 23:00:00',NULL),(10,'Buổi workshop Sáng tạo',5,'Sáng tạo và khởi nghiệp','2023-12-25 10:00:00','2023-12-25 15:00:00',NULL);
/*!40000 ALTER TABLE `ctxh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dki_giay_xac_nhan`
--

DROP TABLE IF EXISTS `dki_giay_xac_nhan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dki_giay_xac_nhan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TenDichVu` varchar(500) DEFAULT NULL,
  `SoLuong` int DEFAULT NULL,
  `MaLoaiGiay` int DEFAULT NULL,
  `MSSV` varchar(45) DEFAULT NULL,
  `ThoiGianDki` datetime DEFAULT NULL,
  `ThoiGianPhanHoi` datetime DEFAULT NULL,
  `TieuDe` varchar(500) DEFAULT NULL,
  `MaCTSV` int DEFAULT NULL,
  `NdPhanHoi` varchar(500) DEFAULT NULL,
  `TrangThai` varchar(45) DEFAULT NULL,
  `STT` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkey_sv_giayxn_idx` (`MSSV`),
  KEY `fkey_ctsv_giayxn_idx` (`MaCTSV`),
  KEY `fkey_loaigiay_giayxn_idx` (`MaLoaiGiay`),
  CONSTRAINT `fkey_ctsv_giayxn` FOREIGN KEY (`MaCTSV`) REFERENCES `ctsv` (`MaCTSV`),
  CONSTRAINT `fkey_loaigiay_giayxn` FOREIGN KEY (`MaLoaiGiay`) REFERENCES `loai_giay` (`MaLoaiGiay`),
  CONSTRAINT `fkey_sv_giayxn` FOREIGN KEY (`MSSV`) REFERENCES `sinhvien` (`MSSV`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dki_giay_xac_nhan`
--

LOCK TABLES `dki_giay_xac_nhan` WRITE;
/*!40000 ALTER TABLE `dki_giay_xac_nhan` DISABLE KEYS */;
INSERT INTO `dki_giay_xac_nhan` VALUES (1,'Giấy xác nhận sinh viên',2,1,'21110894','2023-12-13 16:29:43',NULL,NULL,NULL,NULL,'Chưa duyệt',1),(2,'Giấy xác nhận sinh viên',2,1,'22146123','2023-12-14 14:40:09',NULL,NULL,NULL,NULL,'Chưa duyệt',2),(3,'Giấy xác nhận sinh viên',1,1,'21110538','2023-12-14 14:45:02',NULL,NULL,NULL,NULL,'Chưa duyệt',3),(4,'Giấy vay vốn',1,2,'21110538','2023-12-14 14:50:11','2023-12-14 00:00:00','Yêu cầu  Giấy vay vốn đã được duyệt ',1,'Đã in giấy xác nhận, vui lòng đến phòng CTSV để nhận giấy','Đã nhận',4),(5,'Giấy xác nhận sinh viên',1,1,'19110247','2023-12-14 22:35:14','2023-12-14 00:00:00','Yêu cầu  Giấy xác nhận sinh viên đã được duyệt ',1,'Đã in giấy xác nhận, vui lòng đến phòng CTSV để nhận giấy','Đã nhận',5),(6,'Giấy vay vốn',1,2,'19110247','2023-12-14 22:35:44',NULL,NULL,NULL,NULL,'Chưa duyệt',6),(7,'Giấy xác nhận sinh viên',1,1,'21133004','2023-12-15 02:16:51','2023-12-15 00:00:00','Yêu cầu  Giấy xác nhận sinh viên đã được duyệt ',1,'Đã in giấy, vui lòng đến phòng CTSV trước ngày 22/12/2023 để lấy giấy xác nhận.','Đã duyệt',7);
/*!40000 ALTER TABLE `dki_giay_xac_nhan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `auto_increment_STT` BEFORE INSERT ON `dki_giay_xac_nhan` FOR EACH ROW BEGIN
  DECLARE max_stt INT;
  SELECT MAX(`STT`) INTO max_stt FROM `dki_giay_xac_nhan` WHERE `TrangThai` != 'Đã xóa';
  IF max_stt IS NULL THEN
    SET NEW.`STT` = 1;
  ELSE
    SET NEW.`STT` = max_stt + 1;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dki_tham_gia_ctxh`
--

DROP TABLE IF EXISTS `dki_tham_gia_ctxh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dki_tham_gia_ctxh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TenDichVu` varchar(500) DEFAULT NULL,
  `MaHD` int DEFAULT NULL,
  `ThoiGianDKI` datetime DEFAULT NULL,
  `MSSV` varchar(45) DEFAULT NULL,
  `ThoiGianPhanHoi` datetime DEFAULT NULL,
  `TieuDe` varchar(500) DEFAULT NULL,
  `MaCTSV` int DEFAULT NULL,
  `NDPhanHoi` varchar(500) DEFAULT NULL,
  `TrangThai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkey_ctxh_dkictxh_idx` (`MaHD`),
  KEY `fkey_sv_dkictxh_idx` (`MSSV`),
  KEY `fkey_ctsv_dkictxh_idx` (`MaCTSV`),
  CONSTRAINT `fkey_ctsv_dkictxh` FOREIGN KEY (`MaCTSV`) REFERENCES `ctsv` (`MaCTSV`),
  CONSTRAINT `fkey_ctxh_dkictxh` FOREIGN KEY (`MaHD`) REFERENCES `ctxh` (`MaHD`),
  CONSTRAINT `fkey_sv_dkictxh` FOREIGN KEY (`MSSV`) REFERENCES `sinhvien` (`MSSV`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dki_tham_gia_ctxh`
--

LOCK TABLES `dki_tham_gia_ctxh` WRITE;
/*!40000 ALTER TABLE `dki_tham_gia_ctxh` DISABLE KEYS */;
INSERT INTO `dki_tham_gia_ctxh` VALUES (4,'Đăng ký CTXH: Đêm nhạc Sinh viên',9,'2023-12-14 14:40:32','22146123','2023-12-14 00:00:00','Yêu cầu tham gia CTXH đã được duyệt',1,'đi đi em','Đã duyệt'),(5,'Đăng ký CTXH: Đêm nhạc Sinh viên',9,'2023-12-14 14:44:55','21110538','2023-12-14 00:00:00','Yêu cầu tham gia CTXH đã được duyệt',1,'Nhớ đi nhé em','Đã tham gia'),(6,'Đăng ký CTXH: Đêm nhạc Sinh viên',9,'2023-12-14 22:36:21','19110247','2023-12-14 00:00:00','Yêu cầu tham gia CTXH đã được duyệt',1,'Yêu cầu tham gia đã được duyệt, hãy tham gia và nộp chứng nhận để được cộng điểm','Đã tham gia'),(7,'Đăng ký CTXH: Buổi workshop Sáng tạo',10,'2023-12-15 02:17:00','21133004',NULL,NULL,NULL,NULL,'Chưa duyệt');
/*!40000 ALTER TABLE `dki_tham_gia_ctxh` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_DiemCTXH` AFTER UPDATE ON `dki_tham_gia_ctxh` FOR EACH ROW BEGIN
    IF NEW.TrangThai = 'Đã tham gia' THEN
        -- Lấy số điểm tương ứng từ bảng ctxh
        SELECT Diem INTO @diemToAdd
        FROM ctxh
        WHERE MaHD = NEW.MaHD;

        -- Cập nhật cột DiemCTXH trong bảng sinhvien
        UPDATE sinhvien
        SET DiemCTXH = DiemCTXH + @diemToAdd
        WHERE MSSV = NEW.MSSV;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dki_xn_nganh_nghe`
--

DROP TABLE IF EXISTS `dki_xn_nganh_nghe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dki_xn_nganh_nghe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TenDichVu` varchar(500) DEFAULT NULL,
  `ThoiGianDki` datetime DEFAULT NULL,
  `NamHoc` varchar(45) DEFAULT NULL,
  `HocKy` varchar(45) DEFAULT NULL,
  `MSSV` varchar(45) DEFAULT NULL,
  `MaLyDo` int DEFAULT NULL,
  `ThoiGianPhanHoi` datetime DEFAULT NULL,
  `TieuDe` varchar(500) DEFAULT NULL,
  `MaCTSV` int DEFAULT NULL,
  `NdPhanHoi` varchar(500) DEFAULT NULL,
  `TrangThai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkey_sv_xnnghe_idx` (`MSSV`),
  KEY `fkey_ctsv_xnnghe_idx` (`MaCTSV`),
  KEY `fkey_lydo_xnnghe_idx` (`MaLyDo`),
  CONSTRAINT `fkey_ctsv_xnnghe` FOREIGN KEY (`MaCTSV`) REFERENCES `ctsv` (`MaCTSV`),
  CONSTRAINT `fkey_lydo_xnnghe` FOREIGN KEY (`MaLyDo`) REFERENCES `lydo` (`MaLyDo`),
  CONSTRAINT `fkey_sv_xnnghe` FOREIGN KEY (`MSSV`) REFERENCES `sinhvien` (`MSSV`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dki_xn_nganh_nghe`
--

LOCK TABLES `dki_xn_nganh_nghe` WRITE;
/*!40000 ALTER TABLE `dki_xn_nganh_nghe` DISABLE KEYS */;
INSERT INTO `dki_xn_nganh_nghe` VALUES (2,'Đăng ký xác nhận ngành nghề','2023-12-14 14:39:58','2020-2021','HK01','22146123',1,'2023-12-14 00:00:00','Yêu cầu xác nhận ngành nghề đã được duyệt',1,'abc','Đã duyệt'),(3,'Đăng ký xác nhận ngành nghề','2023-12-14 14:40:01','2020-2021','HK01','22146123',1,NULL,NULL,NULL,NULL,'Chưa duyệt'),(4,'Đăng ký xác nhận ngành nghề','2023-12-14 15:10:24','2021-2022','HK01','21110538',4,NULL,NULL,NULL,NULL,'Chưa duyệt'),(5,'Đăng ký xác nhận ngành nghề','2023-12-14 22:34:40','2023-2024','HK01','19110247',1,NULL,NULL,NULL,NULL,'Đã xóa'),(6,'Đăng ký xác nhận ngành nghề','2023-12-14 22:34:59','2019-2020','HK01','19110247',1,NULL,NULL,NULL,NULL,'Chưa duyệt'),(7,'Đăng ký xác nhận ngành nghề','2023-12-15 12:01:37','2019-2020','HK01','21110538',1,NULL,NULL,NULL,NULL,'Đã xóa'),(8,'Đăng ký xác nhận ngành nghề','2023-12-15 12:01:40','2019-2020','HK01','21110538',1,NULL,NULL,NULL,NULL,'Đã xóa'),(9,'Đăng ký xác nhận ngành nghề','2023-12-15 12:01:43','2019-2020','HK01','21110538',1,NULL,NULL,NULL,NULL,'Đã xóa'),(10,'Đăng ký xác nhận ngành nghề','2023-12-15 12:01:45','2019-2020','HK01','21110538',1,NULL,NULL,NULL,NULL,'Đã xóa');
/*!40000 ALTER TABLE `dki_xn_nganh_nghe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoa`
--

DROP TABLE IF EXISTS `khoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khoa` (
  `MaKhoa` int NOT NULL AUTO_INCREMENT,
  `TenKhoa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaKhoa`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoa`
--

LOCK TABLES `khoa` WRITE;
/*!40000 ALTER TABLE `khoa` DISABLE KEYS */;
INSERT INTO `khoa` VALUES (1,'Công nghệ thông tin '),(2,'Điện điện tử'),(3,'Ô tô'),(4,'Thiết kế thời trang'),(5,'Công nghệ hóa học'),(6,'Cơ khí');
/*!40000 ALTER TABLE `khoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoahoc`
--

DROP TABLE IF EXISTS `khoahoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khoahoc` (
  `MaKhoaHoc` int NOT NULL AUTO_INCREMENT,
  `TenKH` varchar(45) DEFAULT NULL,
  `NamBD` int DEFAULT NULL,
  `NamKT` int DEFAULT NULL,
  PRIMARY KEY (`MaKhoaHoc`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoahoc`
--

LOCK TABLES `khoahoc` WRITE;
/*!40000 ALTER TABLE `khoahoc` DISABLE KEYS */;
INSERT INTO `khoahoc` VALUES (1,'K19',2019,2027),(2,'K20',2020,2028),(3,'K21',2021,2029),(4,'K22',2022,2030),(5,'K23',2023,2031),(6,'K18',2018,2026);
/*!40000 ALTER TABLE `khoahoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_giay`
--

DROP TABLE IF EXISTS `loai_giay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loai_giay` (
  `MaLoaiGiay` int NOT NULL AUTO_INCREMENT,
  `TenLoaiGiay` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaLoaiGiay`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_giay`
--

LOCK TABLES `loai_giay` WRITE;
/*!40000 ALTER TABLE `loai_giay` DISABLE KEYS */;
INSERT INTO `loai_giay` VALUES (1,'Giấy xác nhận sinh viên'),(2,'Giấy vay vốn'),(3,'Giấy xin đăng kí KTX');
/*!40000 ALTER TABLE `loai_giay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lydo`
--

DROP TABLE IF EXISTS `lydo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lydo` (
  `MaLyDo` int NOT NULL AUTO_INCREMENT,
  `TenLyDo` varchar(45) DEFAULT NULL,
  `NoiDung` varchar(300) DEFAULT NULL,
  `TrangThai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaLyDo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lydo`
--

LOCK TABLES `lydo` WRITE;
/*!40000 ALTER TABLE `lydo` DISABLE KEYS */;
INSERT INTO `lydo` VALUES (1,'Công nghệ thông tin và máy tính','Công nghệ thông tin & máy tính: Công việc đơn điệu, thường xuyên tiếp xúc với màn hình máy tính, căng thẳng thần kinh, tâm lý.','enable'),(2,'Cơ khí','Cơ khí: Hàn điện, hàn hơi; Mài khô kim loại; Vận hành máy đột dập kim loại; Tiếp xúc với bụi đá, bụi kim loại, rung và ồn, căng thẳng thị giác.','enable'),(3,'Điện, điện tử','Điện, điện tử: ảnh hưởng của điện từ trường, thường xuyên tiếp xúc với điện cao áp nên rất nguy hiểm đến tính mạng. Tiếp xúc với các chất độc hại như: chì, nhựa thông và các chất tẩy rửa bo mạch.','enable'),(4,'Hóa học','Độc hại, hóa chất chết người','enable');
/*!40000 ALTER TABLE `lydo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qtv`
--

DROP TABLE IF EXISTS `qtv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qtv` (
  `MaQTV` int NOT NULL AUTO_INCREMENT,
  `Id_tk` int DEFAULT NULL,
  `MaTT` int DEFAULT NULL,
  `TrangThai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaQTV`),
  KEY `fkey_taikhoan_qtv_idx` (`Id_tk`),
  KEY `fkey_ttcanhan_qtv_idx` (`MaTT`),
  CONSTRAINT `fkey_taikhoan_qtv` FOREIGN KEY (`Id_tk`) REFERENCES `taikhoan` (`Id_tk`),
  CONSTRAINT `fkey_ttcanhan_qtv` FOREIGN KEY (`MaTT`) REFERENCES `thongtincanhan` (`MaTT`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qtv`
--

LOCK TABLES `qtv` WRITE;
/*!40000 ALTER TABLE `qtv` DISABLE KEYS */;
INSERT INTO `qtv` VALUES (1,1,1,'Đang làm'),(2,4,2,'Đang làm');
/*!40000 ALTER TABLE `qtv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinhvien`
--

DROP TABLE IF EXISTS `sinhvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sinhvien` (
  `MSSV` varchar(20) NOT NULL,
  `MaKhoa` int DEFAULT NULL,
  `MaKhoaHoc` int DEFAULT NULL,
  `MaTT` int DEFAULT NULL,
  `Id_tk` int DEFAULT NULL,
  `DiemCTXH` int DEFAULT NULL,
  `TrangThai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MSSV`),
  KEY `fkey_ttcanhan_idx` (`MaTT`),
  KEY `fkey_taikhoan_idx` (`Id_tk`),
  KEY `fkey_khoa_sv_idx` (`MaKhoa`),
  KEY `fkey_khoahoc_sv_idx` (`MaKhoaHoc`),
  CONSTRAINT `fkey_khoa_sv` FOREIGN KEY (`MaKhoa`) REFERENCES `khoa` (`MaKhoa`),
  CONSTRAINT `fkey_khoahoc_sv` FOREIGN KEY (`MaKhoaHoc`) REFERENCES `khoahoc` (`MaKhoaHoc`),
  CONSTRAINT `fkey_taikhoan_sv` FOREIGN KEY (`Id_tk`) REFERENCES `taikhoan` (`Id_tk`),
  CONSTRAINT `fkey_ttcanhan_sv` FOREIGN KEY (`MaTT`) REFERENCES `thongtincanhan` (`MaTT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinhvien`
--

LOCK TABLES `sinhvien` WRITE;
/*!40000 ALTER TABLE `sinhvien` DISABLE KEYS */;
INSERT INTO `sinhvien` VALUES ('19110111',3,1,40,33,0,'Đang học'),('19110125',1,1,30,23,0,'Đã tốt nghiệp'),('19110127',1,1,37,30,0,'Đang học'),('19110247',1,1,34,27,5,'Đang học'),('19140922',4,1,11,11,0,'Đang học'),('19145237',1,1,36,29,0,'Đang học'),('20110147',1,1,31,24,0,'Đang học'),('20110148',1,1,38,31,0,'Đang học'),('20130540',3,2,9,9,0,'Đang học'),('20130541',3,2,10,10,0,'Đang học'),('20146123',1,1,35,28,0,'Đang học'),('21110126',2,2,39,32,0,'Đang học'),('21110135',2,2,32,25,0,'Đang học'),('21110538',1,1,20,13,5,'Đang học'),('21110666',1,1,27,20,0,'Đang học'),('21110800',1,3,6,6,0,'Đang học'),('21110894',1,3,5,5,0,'Đang học'),('21110895',1,3,7,7,0,'Đang học'),('21110923',1,1,21,14,0,'Đang học'),('21133004',1,3,42,35,0,'Đang học'),('21145237',1,1,29,22,0,'Đang học'),('21146123',1,1,28,21,0,'Đang học'),('22110456',1,4,41,34,0,'Đang học'),('22120200',2,4,8,8,0,'Đang học'),('22120201',2,4,8,9,0,'Đang học'),('22133004',2,2,25,18,0,'Đang học'),('22145638',3,1,26,19,0,'Đang học'),('22146123',4,2,19,12,0,'Đang học'),('22146130',1,1,24,17,0,'Đang học'),('22146178',1,1,22,15,0,'Đang học'),('23146897',1,1,23,16,0,'Đang học');
/*!40000 ALTER TABLE `sinhvien` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_TT_SV_trigger` AFTER UPDATE ON `sinhvien` FOR EACH ROW BEGIN
    IF NEW.TrangThai = 'Đã tốt nghiệp' THEN
        UPDATE TaiKhoan
        SET TrangThai = 'disable'
        WHERE id_tk = NEW.id_tk;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `taikhoan`
--

DROP TABLE IF EXISTS `taikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taikhoan` (
  `Id_tk` int NOT NULL AUTO_INCREMENT,
  `TenTk` varchar(45) NOT NULL,
  `MatKhau` varchar(45) NOT NULL,
  `PhanQuyen` varchar(45) NOT NULL,
  `TrangThai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id_tk`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taikhoan`
--

LOCK TABLES `taikhoan` WRITE;
/*!40000 ALTER TABLE `taikhoan` DISABLE KEYS */;
INSERT INTO `taikhoan` VALUES (1,'admin1','123','qtv','enable'),(2,'ctsv1','123','ctsv','enable'),(3,'ctsv2','123','ctsv','enable'),(4,'admin2','123','qtv','enable'),(5,'21110894','123','sv','enable'),(6,'21110800','123','sv','enable'),(7,'21110895','123','sv','enable'),(8,'22120200','123','sv','enable'),(9,'22120201','123','sv','enable'),(10,'20130541','123','sv','enable'),(11,'19140922','123','sv','enable'),(12,'22146123','123','sv','enable'),(13,'21110538','123','sv','enable'),(14,'21110923','123','sv','enable'),(15,'22146178','123','sv','enable'),(16,'23146897','123','sv','enable'),(17,'22146130','123','sv','enable'),(18,'22133004','123','sv','enable'),(19,'22145638','123','sv','enable'),(20,'21110666','123','sv','enable'),(21,'21146123','123','sv','enable'),(22,'21145237','123','sv','enable'),(23,'19110125','123','sv','disable'),(24,'20110147','123','sv','enable'),(25,'21110135','123','sv','enable'),(26,'19110125','123','sv','enable'),(27,'19110247','1234','sv','enable'),(28,'20146123','123','sv','enable'),(29,'19145237','123','sv','enable'),(30,'19110127','123','sv','enable'),(31,'20110148','123','sv','enable'),(32,'21110126','123','sv','enable'),(33,'19110111','123','sv','enable'),(34,'22110456','123','sv','enable'),(35,'21133004','123','sv','enable');
/*!40000 ALTER TABLE `taikhoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thongtincanhan`
--

DROP TABLE IF EXISTS `thongtincanhan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thongtincanhan` (
  `MaTT` int NOT NULL AUTO_INCREMENT,
  `HoTen` varchar(45) DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `DiaChi` varchar(45) DEFAULT NULL,
  `Quequan` varchar(45) DEFAULT NULL,
  `SoDienThoai` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `GioiTinh` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaTT`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thongtincanhan`
--

LOCK TABLES `thongtincanhan` WRITE;
/*!40000 ALTER TABLE `thongtincanhan` DISABLE KEYS */;
INSERT INTO `thongtincanhan` VALUES (1,'Nguyễn Văn Lâm','1990-01-01','Hà Nội','Hà Nội','0918456789','nguyenvana@gmail.com','Nam'),(2,'Trần Thị Bình','1992-05-15','Hồ Chí Minh','Cần Thơ','9876543210','tranthibinh@gmail.com','Nữ'),(3,'Lê Minh Châu','1988-11-20','Đà Nẵng','Quảng Nam','5556667770','leminhchau@gmail.com','Nữ'),(4,'Phạm Thúy Dung','1995-03-10','Hải Phòng','Hải Phòng','1112223330','phamthuydung@gmail.com','Nữ'),(5,'Đặng Xuân Hạ','1993-09-05','Huế','Quảng Bình','4445556660','dangxuaneo@gmail.com','Nam'),(6,'Vũ Thị Phương','1991-07-25','Cần Thơ','Cần Thơ','9998887770','vuthifong@gmail.com','Nữ'),(7,'Ngô Gia Hải','1994-12-30','TP Hồ Chí Minh','Tiền Giang','1234567890','ngogiahai@gmail.com','Nam'),(8,'Trần Văn Nguyên','1989-06-18','Đà Nẵng','Quảng Ngãi','9876543210','tranvaniu@gmail.com','Nam'),(9,'Lê Thị Kim','1996-04-22','Hà Nội','Hà Nội','5556667770','lethikim@gmail.com','Nữ'),(10,'Phan Xuân Lộc','1992-08-14','Hải Phòng','Hải Phòng','1112223330','phanxuanloc@gmail.com','Nam'),(11,'Đinh Quang Minh','1993-10-08','Huế','Quảng Bình','4445556660','dinhquangminh@gmail.com','Nam'),(12,'Võ Thị Ngọc','1991-09-27','Cần Thơ','Cần Thơ','9998887770','vothingoc@gmail.com','Nữ'),(13,'Lý Văn Oanh','1998-03-05','Hồ Chí Minh','Vĩnh Long','1234567890','lyvanoanh@gmail.com','Nữ'),(14,'Nguyễn Hữu Phong','1990-02-14','Đà Nẵng','Quảng Nam','9876543210','nguyenhuuphong@gmail.com','Nam'),(15,'Trần Thị Quỳnh','1987-06-20','Hải Phòng','Hải Phòng','5556667770','tranquynh@gmail.com','Nữ'),(16,'Lê Quang Lâm','2003-05-21','Lâm Đồng','Lâm Đồng','1234567890','lamlq@gmail.com','Nam'),(17,'Phạm Bá Thành','2003-01-01','Bình Dương','Bình Dương','3214567980','thanhpb@gmail.com','Nam'),(18,'Nguyễn Thiện Luân','2003-02-02','Lâm Đồng','Lâm Đồng','1237894560','luannt@gmail.com','Nam'),(19,'Nguyễn Thị Hằng','2002-08-12','An Giang','An Giang','0918423756','baonun@gmail.com','Nữ'),(20,'Nguyễn Thiện Luân','2003-01-03','TP Hồ Chí Minh','Lâm Đồng','0333444555','thienluan678@gmail.com','Nam'),(21,'Phạm Bá Thành','2003-01-01','TP Hồ Chí Minh','Bình Dương','0786954321','thanhp@gmail.com','Nam'),(22,'Lê Quang Lâm','2003-01-02','TP Hồ Chí Minh','Lâm Đồng','0222334455','work.lamsun@gmail.com','Nam'),(23,'Nguyễn Thiện Luân','2003-01-03','TP Hồ Chí Minh','Lâm Đồng','0333444555','thienluan678@gmail.com','Nam'),(24,'Hoàng Công Thiên','2003-01-04','TP Hồ Chí Minh','Huế','0111222333','thien5cm@gmail.com','Nam'),(25,'Nguyễn Văn Ba','2003-01-04','TP Hồ Chí Minh','Huế','0333555999','dragon@gmail.com','Nam'),(26,'Nguyễn Hoàng Thùy Linh','2003-01-04','TP Hồ Chí Minh','Cà Mau','0123654789','frog@gmail.com','Nữ'),(27,'Nguyễn Bình','2003-12-12','An Giang','An Giang','0124578963','thienluan678@gmail.com','Nam'),(28,'Phạm Bá Thành','2003-01-01','TP Hồ Chí Minh','Bình Dương','0786954321','thanhp@gmail.com','Nam'),(29,'Lê Quang Lâm','2003-01-02','TP Hồ Chí Minh','Lâm Đồng','0222334455','work.lamsun@gmail.com','Nam'),(30,'Nguyễn Quốc Tuấn','2003-01-03','TP Hồ Chí Minh','Lâm Đồng','0333444555','thienluan678@gmail.com','Nam'),(31,'Hoàng Công Thiên','2003-01-04','TP Hồ Chí Minh','Huế','0111222333','thien5cm@gmail.com','Nam'),(32,'Nguyễn Văn Ba','2003-01-04','TP Hồ Chí Minh','Huế','0333555999','dragon@gmail.com','Nam'),(33,'Nguyễn Hoàng Thùy Linh','2003-01-04','TP Hồ Chí Minh','Cà Mau','0123654789','frog@gmail.com','Nữ'),(34,'Đỗ Thái Duy','2000-12-20','An Giang','An Giang','0123478956','thienluan0001@gmail.com','Nam'),(35,'Đỗ Thái Duy','2003-01-01','TP Hồ Chí Minh','Bình Dương','0786954321','thanhp@gmail.com','Nam'),(36,'Nguyễn Quốc Tuấn','2003-01-02','TP Hồ Chí Minh','Lâm Đồng','0222334455','work.lamsun@gmail.com','Nam'),(37,'Nguyễn Hữu Thịnh','2003-01-03','TP Hồ Chí Minh','Lâm Đồng','0333444555','thienluan678@gmail.com','Nam'),(38,'Trần Thanh Hiếu','2003-01-04','TP Hồ Chí Minh','Huế','0111222333','thien5cm@gmail.com','Nam'),(39,'Lê Nguyễn Bảo','2003-01-04','TP Hồ Chí Minh','Huế','0333555999','dragon@gmail.com','Nam'),(40,'Nguyễn Hoàng Thùy Chi','2003-01-04','TP Hồ Chí Minh','Cà Mau','0123654789','frog@gmail.com','Nữ'),(41,'Nguyễn Thiện Luân','2004-12-10','An Giang','An Giang','0111222333','thienluan678@gmail.com','Nam'),(42,'Nguyễn Thị Phương Anh','2003-07-23','Đắk Nông','Nghệ An','0972484322','nguyenthiphuonganh237@gmail.com','Nữ');
/*!40000 ALTER TABLE `thongtincanhan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truycap`
--

DROP TABLE IF EXISTS `truycap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truycap` (
  `id_TruyCap` int NOT NULL AUTO_INCREMENT,
  `Id_Tk` int DEFAULT NULL,
  `ThoiGian` datetime DEFAULT NULL,
  PRIMARY KEY (`id_TruyCap`),
  KEY `fkey_taikhoan_truycap_idx` (`Id_Tk`),
  CONSTRAINT `fkey_taikhoan_truycap` FOREIGN KEY (`Id_Tk`) REFERENCES `taikhoan` (`Id_tk`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truycap`
--

LOCK TABLES `truycap` WRITE;
/*!40000 ALTER TABLE `truycap` DISABLE KEYS */;
INSERT INTO `truycap` VALUES (1,2,'2023-12-13 00:00:00'),(2,1,'2023-12-13 00:00:00'),(3,2,'2023-12-13 00:00:00'),(4,5,'2023-12-13 00:00:00'),(5,5,'2023-12-13 00:00:00'),(6,5,'2023-12-13 00:00:00'),(7,2,'2023-12-13 00:00:00'),(8,5,'2023-12-13 00:00:00'),(9,2,'2023-12-13 00:00:00'),(10,5,'2023-12-13 00:00:00'),(11,2,'2023-12-13 00:00:00'),(12,1,'2023-12-14 00:00:00'),(13,2,'2023-12-14 00:00:00'),(14,2,'2023-12-14 00:00:00'),(15,1,'2023-12-14 00:00:00'),(16,12,'2023-12-14 00:00:00'),(17,1,'2023-12-14 00:00:00'),(18,12,'2023-12-14 00:00:00'),(19,2,'2023-12-14 00:00:00'),(20,1,'2023-12-14 00:00:00'),(21,13,'2023-12-14 00:00:00'),(22,2,'2023-12-14 00:00:00'),(23,13,'2023-12-14 00:00:00'),(24,1,'2023-12-14 00:00:00'),(25,13,'2023-12-14 00:00:00'),(26,2,'2023-12-14 00:00:00'),(27,13,'2023-12-14 00:00:00'),(28,2,'2023-12-14 00:00:00'),(29,2,'2023-12-14 00:00:00'),(30,2,'2023-12-14 00:00:00'),(31,2,'2023-12-14 00:00:00'),(32,2,'2023-12-14 00:00:00'),(33,1,'2023-12-14 00:00:00'),(34,13,'2023-12-14 00:00:00'),(35,13,'2023-12-14 00:00:00'),(36,13,'2023-12-14 00:00:00'),(37,13,'2023-12-14 00:00:00'),(38,13,'2023-12-14 00:00:00'),(39,13,'2023-12-14 00:00:00'),(40,13,'2023-12-14 00:00:00'),(41,1,'2023-12-14 00:00:00'),(42,1,'2023-12-14 00:00:00'),(43,1,'2023-12-14 00:00:00'),(44,1,'2023-12-14 00:00:00'),(45,27,'2023-12-14 00:00:00'),(46,27,'2023-12-14 00:00:00'),(47,2,'2023-12-14 00:00:00'),(48,27,'2023-12-14 00:00:00'),(49,2,'2023-12-14 00:00:00'),(50,27,'2023-12-14 00:00:00'),(51,1,'2023-12-14 00:00:00'),(52,1,'2023-12-14 00:00:00'),(53,1,'2023-12-14 00:00:00'),(54,1,'2023-12-14 00:00:00'),(55,1,'2023-12-14 00:00:00'),(56,2,'2023-12-14 00:00:00'),(57,2,'2023-12-14 00:00:00'),(58,13,'2023-12-14 00:00:00'),(59,1,'2023-12-14 00:00:00'),(60,23,'2023-12-14 00:00:00'),(61,1,'2023-12-14 00:00:00'),(62,1,'2023-12-14 00:00:00'),(63,1,'2023-12-15 00:00:00'),(64,35,'2023-12-15 00:00:00'),(65,35,'2023-12-15 00:00:00'),(66,2,'2023-12-15 00:00:00'),(67,35,'2023-12-15 00:00:00'),(68,1,'2023-12-15 00:00:00'),(69,1,'2023-12-15 00:00:00'),(70,1,'2023-12-15 00:00:00'),(71,1,'2023-12-15 00:00:00'),(72,1,'2023-12-15 00:00:00'),(73,1,'2023-12-15 00:00:00'),(74,1,'2023-12-15 00:00:00'),(75,1,'2023-12-15 00:00:00'),(76,1,'2023-12-15 00:00:00'),(77,1,'2023-12-15 00:00:00'),(78,1,'2023-12-15 00:00:00'),(79,1,'2023-12-15 00:00:00'),(80,1,'2023-12-15 00:00:00'),(81,1,'2023-12-15 00:00:00'),(82,1,'2023-12-15 00:00:00'),(83,1,'2023-12-15 00:00:00'),(84,1,'2023-12-15 00:00:00'),(85,1,'2023-12-15 00:00:00'),(86,2,'2023-12-15 00:00:00'),(87,35,'2023-12-15 00:00:00'),(88,13,'2023-12-15 00:00:00'),(89,1,'2023-12-15 00:00:00'),(90,2,'2023-12-15 00:00:00'),(91,13,'2023-12-15 00:00:00'),(92,2,'2023-12-15 00:00:00'),(93,13,'2023-12-15 00:00:00'),(94,2,'2023-12-15 00:00:00');
/*!40000 ALTER TABLE `truycap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'qldvsv'
--

--
-- Dumping routines for database 'qldvsv'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-15 12:38:52
