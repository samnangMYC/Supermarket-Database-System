-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: SnMart
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Table structure for table `Card`
--

DROP TABLE IF EXISTS `Card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Card` (
  `Card_id` smallint NOT NULL AUTO_INCREMENT,
  `Customer_id` smallint DEFAULT NULL,
  `Card_number` varchar(20) DEFAULT NULL,
  `Card_Type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Card_id`),
  UNIQUE KEY `Card_number` (`Card_number`),
  KEY `fk_Customer_card` (`Customer_id`),
  CONSTRAINT `fk_Customer_card` FOREIGN KEY (`Customer_id`) REFERENCES `Customer` (`Customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Card`
--

LOCK TABLES `Card` WRITE;
/*!40000 ALTER TABLE `Card` DISABLE KEYS */;
INSERT INTO `Card` VALUES (1,1,'	4001919257537193	','VisaCard');
/*!40000 ALTER TABLE `Card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categorys`
--

DROP TABLE IF EXISTS `Categorys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categorys` (
  `Category_id` smallint NOT NULL,
  `Category_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorys`
--

LOCK TABLES `Categorys` WRITE;
/*!40000 ALTER TABLE `Categorys` DISABLE KEYS */;
INSERT INTO `Categorys` VALUES (1,'Alcohol'),(2,'Fruits'),(3,'Vegetables'),(4,'Dairy'),(5,'KidZone'),(6,'Oil Cooking'),(7,'Personal Care'),(8,'Snacks'),(9,'Supplements'),(10,'Household'),(11,'Drinks');
/*!40000 ALTER TABLE `Categorys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `Customer_id` smallint NOT NULL AUTO_INCREMENT,
  `Customer_name` varchar(100) DEFAULT NULL,
  `Email` varchar(125) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Adress` varchar(255) DEFAULT NULL,
  `Image` longblob,
  PRIMARY KEY (`Customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Vong dara','Vongdara_777@gmail.com','0928283334','#404Eo, St.93 (Monivong) S/K Boeng Keng Kang I, Khan Daun Penh,PP',NULL);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employees` (
  `Emp_id` smallint NOT NULL AUTO_INCREMENT,
  `Emp_name` varchar(100) NOT NULL,
  `Gender` varchar(6) DEFAULT NULL,
  `DOB` date NOT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Position` varchar(100) NOT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `StopWork` bit(1) DEFAULT NULL,
  `Image` blob,
  PRIMARY KEY (`Emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
INSERT INTO `Employees` VALUES (1,'Chhin dara','M','1999-10-20','012939367','Administrator',400.00,'2022-12-11',_binary '\0',NULL),(2,'Tith veasna','M','1995-02-20','096777777','Stock Manager',1200.00,'2020-01-09',_binary '\0',NULL);
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExportDetail`
--

DROP TABLE IF EXISTS `ExportDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ExportDetail` (
  `Export_id` smallint NOT NULL,
  `Item_id` smallint NOT NULL,
  `Import_id` smallint NOT NULL,
  `EmpQty` smallint NOT NULL,
  `ExportUnitPrice` decimal(5,2) NOT NULL,
  `ExportDate` date DEFAULT NULL,
  UNIQUE KEY `Export_id_UNIQUE` (`Export_id`),
  UNIQUE KEY `Item_id_UNIQUE` (`Item_id`),
  UNIQUE KEY `Import_id_UNIQUE` (`Import_id`),
  KEY `fk_ExportDetail_Exports1_idx` (`Export_id`),
  KEY `fk_ExportDetail_Items1_idx` (`Item_id`),
  KEY `fk_ExportDetail_Imports1_idx` (`Import_id`),
  CONSTRAINT `fk_ExportDetail_Exports1` FOREIGN KEY (`Export_id`) REFERENCES `Exports` (`Export_id`),
  CONSTRAINT `fk_ExportDetail_Imports1` FOREIGN KEY (`Import_id`) REFERENCES `Imports` (`Import_id`),
  CONSTRAINT `fk_ExportDetail_Items1` FOREIGN KEY (`Item_id`) REFERENCES `Items` (`Item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExportDetail`
--

LOCK TABLES `ExportDetail` WRITE;
/*!40000 ALTER TABLE `ExportDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExportDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Exports`
--

DROP TABLE IF EXISTS `Exports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Exports` (
  `Export_id` smallint NOT NULL AUTO_INCREMENT,
  `Export_Date` date DEFAULT NULL,
  `Emp_id` smallint NOT NULL,
  PRIMARY KEY (`Export_id`),
  KEY `fk_Exports_Employees1_idx` (`Emp_id`),
  CONSTRAINT `fk_Exports_Employees1` FOREIGN KEY (`Emp_id`) REFERENCES `Employees` (`Emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exports`
--

LOCK TABLES `Exports` WRITE;
/*!40000 ALTER TABLE `Exports` DISABLE KEYS */;
/*!40000 ALTER TABLE `Exports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Imports`
--

DROP TABLE IF EXISTS `Imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Imports` (
  `Import_id` smallint NOT NULL AUTO_INCREMENT,
  `Item_id` smallint DEFAULT NULL,
  `Sup_id` smallint NOT NULL,
  `Wholsale_price` decimal(10,2) DEFAULT NULL,
  `Wholsale_Qty` smallint DEFAULT NULL,
  `Emp_id` smallint DEFAULT NULL,
  `ImportDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Import_id`),
  KEY `fk_Supplier_Imp` (`Sup_id`),
  KEY `fk_Items_Imp` (`Item_id`),
  KEY `fk_Employee_Imp` (`Emp_id`),
  CONSTRAINT `fk_Employee_Imp` FOREIGN KEY (`Emp_id`) REFERENCES `Employees` (`Emp_id`),
  CONSTRAINT `fk_Items_Imp` FOREIGN KEY (`Item_id`) REFERENCES `Items` (`Item_id`),
  CONSTRAINT `fk_Supplier_Imp` FOREIGN KEY (`Sup_id`) REFERENCES `Supplier` (`Sup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1008 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Imports`
--

LOCK TABLES `Imports` WRITE;
/*!40000 ALTER TABLE `Imports` DISABLE KEYS */;
INSERT INTO `Imports` VALUES (1000,100,1,1333.00,90,2,'2024-01-25 02:49:43'),(1001,111,2,1250.00,50,2,'2024-01-25 03:25:14'),(1002,112,6,1120.00,100,2,'2024-01-25 03:27:30'),(1003,113,3,1102.00,100,2,'2024-02-01 03:50:13'),(1004,114,4,1100.00,100,2,'2024-02-01 03:50:13'),(1005,115,5,1100.00,100,2,'2024-02-01 03:50:13'),(1006,116,4,1102.00,100,2,'2024-02-01 03:50:13'),(1007,156,5,450.00,50,2,'2024-02-01 04:33:09');
/*!40000 ALTER TABLE `Imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImportsDetail`
--

DROP TABLE IF EXISTS `ImportsDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ImportsDetail` (
  `Import_id` smallint NOT NULL,
  `Category_id` smallint DEFAULT NULL,
  `Item_id` smallint NOT NULL,
  `Brand_name` varchar(100) DEFAULT NULL,
  `Item_name` varchar(255) DEFAULT NULL,
  `Descriptions` text,
  `isActive` tinyint(1) NOT NULL,
  UNIQUE KEY `Import_id` (`Import_id`,`Item_id`),
  CONSTRAINT `fk_ImportDe_Imports` FOREIGN KEY (`Import_id`) REFERENCES `Imports` (`Import_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImportsDetail`
--

LOCK TABLES `ImportsDetail` WRITE;
/*!40000 ALTER TABLE `ImportsDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ImportsDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Items`
--

DROP TABLE IF EXISTS `Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Items` (
  `Item_id` smallint NOT NULL AUTO_INCREMENT,
  `Item_name` varchar(200) NOT NULL,
  `Category_id` smallint NOT NULL,
  `Sup_id` smallint DEFAULT NULL,
  PRIMARY KEY (`Item_id`),
  KEY `fk_Category_Items` (`Category_id`),
  KEY `fk_Supplier_Items` (`Sup_id`),
  CONSTRAINT `fk_Category_Items` FOREIGN KEY (`Category_id`) REFERENCES `Categorys` (`Category_id`),
  CONSTRAINT `fk_Supplier_Items` FOREIGN KEY (`Sup_id`) REFERENCES `Supplier` (`Sup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Items`
--

LOCK TABLES `Items` WRITE;
/*!40000 ALTER TABLE `Items` DISABLE KEYS */;
INSERT INTO `Items` VALUES (100,'Angkor',1,1),(111,'ABC',1,2),(112,'Ganzberg',1,6),(113,'Krud Pilsner',1,3),(114,'Anchor White',1,4),(115,'Cambodia Beer',1,5),(116,'Tiger Crystal',1,4),(156,'Express strawberry',11,5);
/*!40000 ALTER TABLE `Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ItemsDetail`
--

DROP TABLE IF EXISTS `ItemsDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ItemsDetail` (
  `Item_id` smallint NOT NULL,
  `Unit_price` decimal(10,2) DEFAULT NULL,
  `Unit_Qty` smallint NOT NULL,
  `Wholesale_price` decimal(10,2) DEFAULT NULL,
  `Wholesale_Qty` smallint NOT NULL,
  `Category_id` smallint NOT NULL,
  `Expire_date` date DEFAULT NULL,
  `Image` longblob,
  `URL` varchar(255) DEFAULT NULL,
  `Descriptions` text,
  PRIMARY KEY (`Item_id`,`Category_id`),
  KEY `fk_Category_itemde` (`Category_id`),
  CONSTRAINT `fk_Category_itemde` FOREIGN KEY (`Category_id`) REFERENCES `Categorys` (`Category_id`),
  CONSTRAINT `fk_ItemDe_item` FOREIGN KEY (`Item_id`) REFERENCES `Items` (`Item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ItemsDetail`
--

LOCK TABLES `ItemsDetail` WRITE;
/*!40000 ALTER TABLE `ItemsDetail` DISABLE KEYS */;
INSERT INTO `ItemsDetail` VALUES (100,0.60,1,13.33,1,1,'2027-02-24',NULL,'a','a'),(111,1.30,1,26.70,1,1,'2027-02-24',NULL,NULL,NULL),(112,0.65,1,12.70,1,1,'2027-02-24',NULL,NULL,NULL),(113,0.65,1,13.50,1,1,'2027-02-24',NULL,NULL,NULL),(114,0.70,1,12.40,1,1,'2027-02-24',NULL,NULL,NULL),(115,0.65,1,12.70,1,1,'2027-02-24',NULL,NULL,NULL),(116,0.80,1,13.65,1,1,'2027-02-24',NULL,NULL,NULL),(156,0.60,1,10.00,1,11,'2026-09-10',NULL,'www.khmerbeverages.com',NULL);
/*!40000 ALTER TABLE `ItemsDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `Order_id` smallint NOT NULL AUTO_INCREMENT,
  `Customer_id` smallint NOT NULL,
  `Order_name` varchar(200) DEFAULT NULL,
  `Category_id` smallint NOT NULL,
  `Item_id` smallint NOT NULL,
  `Orders_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Order_id`),
  KEY `fk_Orders_Customers1_idx` (`Customer_id`),
  KEY `fk_Orders_Categorys1_idx` (`Category_id`),
  KEY `fk_Orders_Items1_idx` (`Item_id`),
  CONSTRAINT `fk_Cus_ord` FOREIGN KEY (`Category_id`) REFERENCES `Categorys` (`Category_id`),
  CONSTRAINT `fk_Customers_ord` FOREIGN KEY (`Customer_id`) REFERENCES `Customer` (`Customer_id`),
  CONSTRAINT `fk_Items_ord` FOREIGN KEY (`Item_id`) REFERENCES `Items` (`Item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,1,'24 can of Krud beer',1,113,'2024-02-01 12:05:00');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Promotion`
--

DROP TABLE IF EXISTS `Promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Promotion` (
  `Promotion_id` smallint NOT NULL AUTO_INCREMENT,
  `Promotion_name` varchar(200) NOT NULL,
  `Promotion_code` varchar(100) DEFAULT NULL,
  `Category_id` smallint DEFAULT NULL,
  `Item_id` smallint DEFAULT NULL,
  `Dis_percentage` tinyint NOT NULL,
  `Start_date` date NOT NULL,
  `End_date` date DEFAULT NULL,
  `Promotion_status` enum('active','expired') DEFAULT NULL,
  `Note` text,
  PRIMARY KEY (`Promotion_id`),
  KEY `fk_Categorys_Pro` (`Category_id`),
  KEY `fk_Items_Pro` (`Item_id`),
  CONSTRAINT `fk_Categorys_Pro` FOREIGN KEY (`Category_id`) REFERENCES `Categorys` (`Category_id`),
  CONSTRAINT `fk_Items_Pro` FOREIGN KEY (`Item_id`) REFERENCES `Items` (`Item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Promotion`
--

LOCK TABLES `Promotion` WRITE;
/*!40000 ALTER TABLE `Promotion` DISABLE KEYS */;
INSERT INTO `Promotion` VALUES (1000,'Chinese New Year Discount','SNCHN24',1,NULL,5,'2024-02-01','2024-02-20','active','All Items');
/*!40000 ALTER TABLE `Promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stock`
--

DROP TABLE IF EXISTS `Stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stock` (
  `Category_id` smallint NOT NULL,
  `Item_id` smallint NOT NULL,
  `Wholesale_Qty` smallint NOT NULL,
  `Stock_status` enum('InStock','OutStock') DEFAULT NULL,
  `Note` text,
  KEY `fk_Categorys_Stock` (`Category_id`),
  KEY `fk_Items_Stock` (`Item_id`),
  CONSTRAINT `fk_Categorys_Stock` FOREIGN KEY (`Category_id`) REFERENCES `Categorys` (`Category_id`),
  CONSTRAINT `fk_Items_Stock` FOREIGN KEY (`Item_id`) REFERENCES `Items` (`Item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stock`
--

LOCK TABLES `Stock` WRITE;
/*!40000 ALTER TABLE `Stock` DISABLE KEYS */;
INSERT INTO `Stock` VALUES (1,100,90,'InStock',NULL),(2,111,50,'InStock',NULL);
/*!40000 ALTER TABLE `Stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supplier` (
  `Sup_id` smallint NOT NULL AUTO_INCREMENT,
  `Sup_name` varchar(100) NOT NULL,
  `Category_id` smallint DEFAULT NULL,
  PRIMARY KEY (`Sup_id`),
  KEY `fk_Categorys_Sup` (`Category_id`),
  CONSTRAINT `fk_Categorys_Sup` FOREIGN KEY (`Category_id`) REFERENCES `Categorys` (`Category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
INSERT INTO `Supplier` VALUES (1,'Cambrew Cambodia',1),(2,'ABC Beer Cambodia',1),(3,'Krud Beer',1),(4,'Heineken Cambodia',1),(5,'Khmer Beverages',1),(6,'Ganzberg Beer',1);
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transactions`
--

DROP TABLE IF EXISTS `Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transactions` (
  `Transaction_id` int NOT NULL AUTO_INCREMENT,
  `Order_id` smallint NOT NULL,
  `Transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Amount` decimal(5,2) NOT NULL,
  `Qty` smallint NOT NULL,
  `Payment_method` enum('cash','card','other') NOT NULL,
  `Card_id` smallint DEFAULT NULL,
  `Promotion_id` smallint DEFAULT NULL,
  `Discount_amount` decimal(5,2) DEFAULT NULL,
  `Tax_amount` decimal(5,2) DEFAULT NULL,
  `Tran_status` enum('completed','pending','canceled') DEFAULT NULL,
  `Descriptions` text,
  `SubTotal` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Transaction_id`),
  KEY `fk_Orders_Tran` (`Order_id`),
  KEY `fk_Transactions_Card1_idx` (`Card_id`),
  KEY `fk_promotion_tran` (`Promotion_id`),
  CONSTRAINT `fk_Orders_Tran` FOREIGN KEY (`Order_id`) REFERENCES `Orders` (`Order_id`),
  CONSTRAINT `fk_promotion_tran` FOREIGN KEY (`Promotion_id`) REFERENCES `Promotion` (`Promotion_id`),
  CONSTRAINT `fk_Transactions_Card1` FOREIGN KEY (`Card_id`) REFERENCES `Card` (`Card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transactions`
--

LOCK TABLES `Transactions` WRITE;
/*!40000 ALTER TABLE `Transactions` DISABLE KEYS */;
INSERT INTO `Transactions` VALUES (1,1,'2024-02-01 12:31:15',0.65,24,'card',1,1000,0.07,NULL,'pending',NULL,12.82);
/*!40000 ALTER TABLE `Transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'SnMart'
--

--
-- Dumping routines for database 'SnMart'
--
/*!50003 DROP PROCEDURE IF EXISTS `ItemsAndDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ItemsAndDetail`()
BEGIN
SELECT * FROM Items AS I 
LEFT JOIN ItemsDetail AS ID
ON I.Item_id = ID.Item_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-01 19:45:20
