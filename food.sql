-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: food
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `cust_address`
--

DROP TABLE IF EXISTS `cust_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_address` (
  `ADDRID` bigint NOT NULL AUTO_INCREMENT,
  `AREA` varchar(255) DEFAULT NULL,
  `CITY` varchar(255) DEFAULT NULL,
  `HOUSENO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ADDRID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_address`
--

LOCK TABLES `cust_address` WRITE;
/*!40000 ALTER TABLE `cust_address` DISABLE KEYS */;
INSERT INTO `cust_address` VALUES (1,'gangaghat','patna','123'),(2,'laxminagar','Delhi','123'),(3,'lxminagar','Delhi','1234'),(4,'Raxaul','Simla','123'),(5,'mainroad','Raxaul','123'),(6,'Raxaul','Patna','1-2-3'),(7,'rampur','UP','1-4-6');
/*!40000 ALTER TABLE `cust_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CID` bigint NOT NULL AUTO_INCREMENT,
  `CEMAIL` varchar(255) DEFAULT NULL,
  `CNAME` varchar(255) DEFAULT NULL,
  `CPASSWORD` varchar(255) DEFAULT NULL,
  `CPHONE` varchar(255) DEFAULT NULL,
  `CUSERNAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'anshu@gmal.com','Anshu','anu123','985132570','anshu'),(2,'ankush@gmail.com','Ankush','anku123','987643210','anku'),(3,'manu@gmail.com','Manshi','manu123','987651054','manu'),(4,'akash@gmail.com','Akash','aks123','9861110044','akash');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_cust_address`
--

DROP TABLE IF EXISTS `customer_cust_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_cust_address` (
  `Customer_CID` bigint NOT NULL,
  `addresses_ADDRID` bigint NOT NULL,
  PRIMARY KEY (`Customer_CID`,`addresses_ADDRID`),
  KEY `FK_customer_cust_address_addresses_ADDRID` (`addresses_ADDRID`),
  CONSTRAINT `FK_customer_cust_address_addresses_ADDRID` FOREIGN KEY (`addresses_ADDRID`) REFERENCES `cust_address` (`ADDRID`),
  CONSTRAINT `FK_customer_cust_address_Customer_CID` FOREIGN KEY (`Customer_CID`) REFERENCES `customer` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_cust_address`
--

LOCK TABLES `customer_cust_address` WRITE;
/*!40000 ALTER TABLE `customer_cust_address` DISABLE KEYS */;
INSERT INTO `customer_cust_address` VALUES (1,1),(1,2),(2,3),(2,4),(3,5),(4,6),(4,7);
/*!40000 ALTER TABLE `customer_cust_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dboy_address`
--

DROP TABLE IF EXISTS `dboy_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dboy_address` (
  `ADDRID` bigint NOT NULL AUTO_INCREMENT,
  `AREA` varchar(255) DEFAULT NULL,
  `CITY` varchar(255) DEFAULT NULL,
  `HOUSENO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ADDRID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dboy_address`
--

LOCK TABLES `dboy_address` WRITE;
/*!40000 ALTER TABLE `dboy_address` DISABLE KEYS */;
INSERT INTO `dboy_address` VALUES (1,'Rampur','UP','123'),(2,'mfg','Patna','7-8-8');
/*!40000 ALTER TABLE `dboy_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryboy`
--

DROP TABLE IF EXISTS `deliveryboy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveryboy` (
  `DID` bigint NOT NULL AUTO_INCREMENT,
  `DEMAIL` varchar(255) DEFAULT NULL,
  `DNAME` varchar(255) DEFAULT NULL,
  `DPASSWORD` varchar(255) DEFAULT NULL,
  `DPHONE` varchar(255) DEFAULT NULL,
  `DUSERNAME` varchar(255) DEFAULT NULL,
  `DADD_ADDRID` bigint DEFAULT NULL,
  PRIMARY KEY (`DID`),
  KEY `FK_deliveryboy_DADD_ADDRID` (`DADD_ADDRID`),
  CONSTRAINT `FK_deliveryboy_DADD_ADDRID` FOREIGN KEY (`DADD_ADDRID`) REFERENCES `dboy_address` (`ADDRID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryboy`
--

LOCK TABLES `deliveryboy` WRITE;
/*!40000 ALTER TABLE `deliveryboy` DISABLE KEYS */;
INSERT INTO `deliveryboy` VALUES (1,'ram@gamil.com','Ramesh','ram123','9876511100','ram',1),(2,'suraj@gmail.com','suraj','sur123','987511144','suraj',2);
/*!40000 ALTER TABLE `deliveryboy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fooditem`
--

DROP TABLE IF EXISTS `fooditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fooditem` (
  `ITEMID` bigint NOT NULL AUTO_INCREMENT,
  `ITEMQTY` int DEFAULT NULL,
  PRIMARY KEY (`ITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fooditem`
--

LOCK TABLES `fooditem` WRITE;
/*!40000 ALTER TABLE `fooditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `fooditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fooditems`
--

DROP TABLE IF EXISTS `fooditems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fooditems` (
  `ITEMID` bigint NOT NULL AUTO_INCREMENT,
  `ITEMNAME` varchar(255) DEFAULT NULL,
  `ITEMPRICE` bigint DEFAULT NULL,
  `ITEMUNIT` int DEFAULT NULL,
  PRIMARY KEY (`ITEMID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fooditems`
--

LOCK TABLES `fooditems` WRITE;
/*!40000 ALTER TABLE `fooditems` DISABLE KEYS */;
INSERT INTO `fooditems` VALUES (1,'mottonBiryani',800,20),(2,'HandiMotton',1000,20),(3,'VegBiryani',500,20),(4,'Pasta',200,20),(5,'noodle',200,20),(6,'Noodle',300,20);
/*!40000 ALTER TABLE `fooditems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order  _orderfooditem`
--

DROP TABLE IF EXISTS `order  _orderfooditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order  _orderfooditem` (
  `Order_ORDID` bigint NOT NULL,
  `ordFoodItem_ITEMID` bigint NOT NULL,
  PRIMARY KEY (`Order_ORDID`,`ordFoodItem_ITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order  _orderfooditem`
--

LOCK TABLES `order  _orderfooditem` WRITE;
/*!40000 ALTER TABLE `order  _orderfooditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `order  _orderfooditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderfooditem`
--

DROP TABLE IF EXISTS `order_orderfooditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_orderfooditem` (
  `Order_ORDID` bigint NOT NULL,
  `ordFoodItem_ITEMID` bigint NOT NULL,
  PRIMARY KEY (`Order_ORDID`,`ordFoodItem_ITEMID`),
  KEY `FK_order_orderfooditem_ordFoodItem_ITEMID` (`ordFoodItem_ITEMID`),
  CONSTRAINT `FK_order_orderfooditem_ordFoodItem_ITEMID` FOREIGN KEY (`ordFoodItem_ITEMID`) REFERENCES `orderfooditem` (`ITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderfooditem`
--

LOCK TABLES `order_orderfooditem` WRITE;
/*!40000 ALTER TABLE `order_orderfooditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_orderfooditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderfooditem`
--

DROP TABLE IF EXISTS `orderfooditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderfooditem` (
  `ITEMID` bigint NOT NULL AUTO_INCREMENT,
  `ITEMQTY` int DEFAULT NULL,
  `RID` bigint DEFAULT NULL,
  PRIMARY KEY (`ITEMID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderfooditem`
--

LOCK TABLES `orderfooditem` WRITE;
/*!40000 ALTER TABLE `orderfooditem` DISABLE KEYS */;
INSERT INTO `orderfooditem` VALUES (1,2,NULL);
/*!40000 ALTER TABLE `orderfooditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ORDID` bigint NOT NULL AUTO_INCREMENT,
  `CUSTID` varchar(255) DEFAULT NULL,
  `ORDDATE` varchar(255) DEFAULT NULL,
  `ORDPMNTSTATUS` varchar(255) DEFAULT NULL,
  `ORDSTATUS` varchar(255) DEFAULT NULL,
  `ORDTOTALBILL` int DEFAULT NULL,
  `ORDDBID` bigint DEFAULT NULL,
  PRIMARY KEY (`ORDID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'manu','06/23/2022','No','order for approval',1600,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_orderfooditem`
--

DROP TABLE IF EXISTS `orders_orderfooditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_orderfooditem` (
  `Order_ORDID` bigint NOT NULL,
  `ordFoodItem_ITEMID` bigint NOT NULL,
  PRIMARY KEY (`Order_ORDID`,`ordFoodItem_ITEMID`),
  KEY `FK_orders_orderfooditem_ordFoodItem_ITEMID` (`ordFoodItem_ITEMID`),
  CONSTRAINT `FK_orders_orderfooditem_Order_ORDID` FOREIGN KEY (`Order_ORDID`) REFERENCES `orders` (`ORDID`),
  CONSTRAINT `FK_orders_orderfooditem_ordFoodItem_ITEMID` FOREIGN KEY (`ordFoodItem_ITEMID`) REFERENCES `orderfooditem` (`ITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_orderfooditem`
--

LOCK TABLES `orders_orderfooditem` WRITE;
/*!40000 ALTER TABLE `orders_orderfooditem` DISABLE KEYS */;
INSERT INTO `orders_orderfooditem` VALUES (1,1);
/*!40000 ALTER TABLE `orders_orderfooditem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-23 12:03:25
