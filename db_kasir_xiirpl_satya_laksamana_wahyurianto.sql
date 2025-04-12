-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_kasir_xiirpl_satya_laksamana_wahyurianto
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `detailpenjualan`
--

DROP TABLE IF EXISTS `detailpenjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detailpenjualan` (
  `DetailID` int(11) NOT NULL AUTO_INCREMENT,
  `PenjualanID` int(11) DEFAULT NULL,
  `ProdukID` int(11) DEFAULT NULL,
  `JumlahProduk` int(11) NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`DetailID`),
  KEY `PenjualanID` (`PenjualanID`),
  KEY `ProdukID` (`ProdukID`),
  CONSTRAINT `detailpenjualan_ibfk_1` FOREIGN KEY (`PenjualanID`) REFERENCES `penjualan` (`PenjualanID`),
  CONSTRAINT `detailpenjualan_ibfk_2` FOREIGN KEY (`ProdukID`) REFERENCES `produk` (`ProdukID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detailpenjualan`
--

LOCK TABLES `detailpenjualan` WRITE;
/*!40000 ALTER TABLE `detailpenjualan` DISABLE KEYS */;
INSERT INTO `detailpenjualan` VALUES (1,1,1,1,10000000.00),(2,1,2,1,5000000.00),(3,1,3,1,3500000.00),(4,2,4,1,4000000.00),(5,2,5,2,6000000.00),(6,2,6,1,6500000.00),(7,3,7,2,4000000.00),(8,3,8,1,7000000.00),(9,3,9,1,12000000.00),(10,4,10,1,4500000.00),(11,4,11,1,1500000.00),(12,4,12,1,1200000.00),(13,5,13,1,2800000.00),(14,5,14,1,9000000.00),(15,5,15,1,1800000.00),(16,6,16,3,1500000.00),(17,6,17,1,5500000.00),(18,6,18,2,1500000.00),(19,7,19,1,600000.00),(20,7,20,1,15000000.00),(21,7,1,1,10000000.00),(22,8,2,2,10000000.00),(23,8,3,1,3500000.00),(24,8,4,1,3000000.00),(25,9,5,1,6500000.00),(26,9,6,2,4000000.00),(27,9,7,1,7000000.00),(28,10,8,1,12000000.00),(29,10,9,1,4500000.00),(30,10,10,1,1500000.00);
/*!40000 ALTER TABLE `detailpenjualan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelanggan`
--

DROP TABLE IF EXISTS `pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelanggan` (
  `PelangganID` int(11) NOT NULL AUTO_INCREMENT,
  `NamaPelanggan` varchar(255) NOT NULL,
  `Alamat` text DEFAULT NULL,
  `NomorTelepon` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`PelangganID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan`
--

LOCK TABLES `pelanggan` WRITE;
/*!40000 ALTER TABLE `pelanggan` DISABLE KEYS */;
INSERT INTO `pelanggan` VALUES (1,'Andi Wijaya','Jakarta','81234567890'),(2,'Budi Santoso','Bandung','81298765432'),(3,'Siti Aisyah','Surabaya','81367891234'),(4,'Rina Marlina','Yogyakarta','81278934561'),(5,'Dedi Suhendra','Medan','81345678912'),(6,'Eko Prasetyo','Semarang','81356789123'),(7,'Fajar Rahman','Makasar','81312345678'),(8,'Gita Purnama','Bali','81398765432'),(9,'Hana Kartika','Malang','81376543219'),(10,'Indra Setiawan','Palembang','81367812345');
/*!40000 ALTER TABLE `pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penjualan`
--

DROP TABLE IF EXISTS `penjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penjualan` (
  `PenjualanID` int(11) NOT NULL AUTO_INCREMENT,
  `TanggalPenjualan` date NOT NULL,
  `TotalHarga` decimal(10,2) DEFAULT NULL,
  `PelangganID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PenjualanID`),
  KEY `PelangganID` (`PelangganID`),
  CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`PelangganID`) REFERENCES `pelanggan` (`PelangganID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penjualan`
--

LOCK TABLES `penjualan` WRITE;
/*!40000 ALTER TABLE `penjualan` DISABLE KEYS */;
INSERT INTO `penjualan` VALUES (1,'2024-01-02',18500000.00,1),(2,'2024-02-02',16500000.00,2),(3,'2024-03-02',23000000.00,3),(4,'2024-04-02',7200000.00,4),(5,'2024-05-02',13600000.00,5),(6,'2024-06-02',8500000.00,6),(7,'2024-07-02',25600000.00,7),(8,'2024-08-02',16500000.00,8),(9,'2024-09-02',17500000.00,9),(10,'2024-10-02',18000000.00,10);
/*!40000 ALTER TABLE `penjualan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produk`
--

DROP TABLE IF EXISTS `produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produk` (
  `ProdukID` int(11) NOT NULL AUTO_INCREMENT,
  `NamaProduk` varchar(255) NOT NULL,
  `Harga` decimal(10,2) NOT NULL,
  `Stok` int(11) NOT NULL,
  PRIMARY KEY (`ProdukID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produk`
--

LOCK TABLES `produk` WRITE;
/*!40000 ALTER TABLE `produk` DISABLE KEYS */;
INSERT INTO `produk` VALUES (1,'Laptop Asus',10000000.00,15),(2,'HP Samsung',5000000.00,20),(3,'TV LG',3500000.00,10),(4,'Kulkas Sharp',4000000.00,12),(5,'Mesin Cuci',3000000.00,8),(6,'AC Parasonic',6500000.00,10),(7,'Speaker JBL',2000000.00,25),(8,'Smartwatch Apple',7000000.00,15),(9,'Ipad Pro',12000000.00,10),(10,'Monitor Dell',4500000.00,30),(11,'Keyboard Logitech',1500000.00,30),(12,'Mouse Razer',1200000.00,22),(13,'Printer Epson',2800000.00,15),(14,'Kamera Sony',9000000.00,5),(15,'Hard Disk Seagate',1800000.00,25),(16,'Flashdisk Sandisk',500000.00,50),(17,'Proyektor BenQ',5500000.00,8),(18,'Power Bank Anker',750000.00,40),(19,'Tripod Kamera',600000.00,12),(20,'Drone DJI',15000000.00,4);
/*!40000 ALTER TABLE `produk` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-12 11:08:01
