-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: bank
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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id_account` int NOT NULL AUTO_INCREMENT,
  `currency` varchar(45) NOT NULL,
  `balance` double NOT NULL,
  `date_of_balance_change` date NOT NULL,
  `id_client` int NOT NULL,
  `open_date` date DEFAULT NULL,
  PRIMARY KEY (`id_account`),
  KEY `client id_idx` (`id_client`),
  CONSTRAINT `client id` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_contract`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'RUB',2100,'2021-01-10',1,NULL),(2,'RUB',8396,'2022-12-10',2,NULL),(3,'RUB',20002,'2021-11-10',3,NULL),(4,'RUB',35000,'2021-11-01',4,NULL),(5,'RUB',70084,'2021-07-05',5,NULL),(6,'USD',10000,'2021-03-30',5,NULL),(7,'RUB',90,'2021-01-10',1,NULL),(8,'RUB',90000,'2023-12-09',11,NULL),(9,'RUB',57894,'2022-01-01',12,NULL),(10,'RUB',23160,'2022-01-29',13,NULL),(11,'RUB',86237,'2022-02-26',14,NULL),(12,'RUB',40752,'2022-03-26',15,NULL),(13,'RUB',71961,'2022-04-23',16,NULL),(14,'RUB',9952,'2022-05-21',17,NULL),(15,'RUB',62846,'2022-06-18',18,NULL),(16,'RUB',3709,'2022-07-16',19,NULL),(17,'RUB',48216,'2022-08-13',20,NULL),(18,'RUB',76238,'2022-09-10',21,NULL),(19,'RUB',32541,'2022-10-08',22,NULL),(20,'RUB',89973,'2022-11-05',23,NULL),(21,'RUB',62407,'2022-12-03',24,NULL),(22,'RUB',14103,'2022-07-01',25,NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_history`
--

DROP TABLE IF EXISTS `account_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_history` (
  `id_account_history` int NOT NULL AUTO_INCREMENT,
  `old_amount` double NOT NULL,
  `new_amount` double NOT NULL,
  `balance_update_date` datetime NOT NULL,
  `id_account` int NOT NULL,
  `id_reason` int NOT NULL,
  PRIMARY KEY (`id_account_history`),
  KEY `reason_idx` (`id_reason`),
  KEY `account id_idx` (`id_account`),
  CONSTRAINT `account id` FOREIGN KEY (`id_account`) REFERENCES `account` (`id_account`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reason` FOREIGN KEY (`id_reason`) REFERENCES `balance_update_reason` (`id_reason`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_history`
--

LOCK TABLES `account_history` WRITE;
/*!40000 ALTER TABLE `account_history` DISABLE KEYS */;
INSERT INTO `account_history` VALUES (8,1000,2000,'2020-03-10 00:00:00',2,2),(9,2500,3000,'2020-06-11 00:00:00',1,3),(10,50000,25000,'2020-01-25 00:00:00',3,1),(11,100000,99990,'2020-08-01 00:00:00',4,2),(12,2600,3600,'2020-01-09 00:00:00',4,3),(13,25000,50000,'2020-11-18 00:00:00',5,1),(14,75000,50000,'2020-02-11 00:00:00',6,3),(15,2500,1500,'2023-04-12 00:32:02',1,1),(16,7000,8000,'2023-04-12 00:32:02',2,1),(17,0,10000,'2023-04-12 00:58:15',6,2),(18,10001,20001,'2023-04-12 00:58:15',3,2),(19,10000,20000,'2023-04-12 00:58:45',6,2),(20,20001,30001,'2023-04-12 00:58:45',3,2),(21,60000,50000,'2023-04-12 00:59:57',5,2),(22,30001,40001,'2023-04-12 00:59:57',3,2),(23,20001,10001,'2023-04-12 01:00:29',3,2),(24,70000,80000,'2023-04-12 01:00:29',5,2),(25,1300,1200,'2023-04-25 22:56:23',1,2),(26,8200,8300,'2023-04-25 22:56:23',2,2),(27,1200,1190,'2023-04-25 23:41:30',1,2),(28,8300,8310,'2023-04-25 23:41:30',2,2),(29,111,91,'2023-11-25 03:53:56',7,2),(30,8310,8330,'2023-11-25 03:53:56',2,2),(69,948,946,'2023-12-11 17:08:30',1,2),(70,8398,8400,'2023-12-11 17:08:30',2,2),(71,946,944,'2023-12-11 17:08:30',1,2),(72,8398,8400,'2023-12-11 17:08:30',2,2),(73,8398,8396,'2023-12-11 17:10:49',2,2),(74,70002,70004,'2023-12-11 17:10:49',5,2),(75,8396,8394,'2023-12-11 17:10:49',2,2),(76,70002,70004,'2023-12-11 17:10:49',5,2),(77,875,804,'2023-12-11 17:36:51',1,2),(78,1325,1396,'2023-12-11 17:36:51',7,2),(79,1390,1384,'2023-12-11 18:07:37',7,2),(80,70004,70010,'2023-12-11 18:07:37',5,2),(81,874,873,'2023-12-11 18:18:25',1,2),(82,20001,20002,'2023-12-11 18:18:25',3,2),(83,869,864,'2023-12-11 18:18:41',1,2),(84,70010,70015,'2023-12-11 18:18:41',5,2),(85,800,731,'2023-12-12 00:01:39',1,2),(86,70015,70084,'2023-12-12 00:01:39',5,2),(87,790,780,'2023-12-13 18:35:37',1,2),(88,1390,1400,'2023-12-13 18:35:37',7,2),(89,1000,600,'2023-12-13 21:07:07',7,2),(90,790,1190,'2023-12-13 21:07:07',1,2),(91,1100,1010,'2023-12-15 22:05:11',1,2),(92,1000,1090,'2023-12-15 22:05:11',7,2),(93,1000,910,'2023-12-15 23:34:10',7,2),(94,1100,1190,'2023-12-15 23:34:10',1,2),(95,1100,1010,'2023-12-15 23:34:59',1,2),(96,1000,1090,'2023-12-15 23:34:59',7,2),(97,0,-1090,'2023-12-15 23:35:08',7,2),(98,1100,2190,'2023-12-15 23:35:08',1,2),(99,2290,2390,'2023-12-15 23:35:42',1,2),(100,0,-100,'2023-12-15 23:35:42',7,2),(101,2190,2090,'2023-12-15 23:35:55',1,2),(102,-100,0,'2023-12-15 23:35:55',7,2),(103,2100,2010,'2023-12-15 23:36:56',1,2),(104,0,90,'2023-12-15 23:36:56',7,2),(105,2000,1900,'2023-12-15 23:38:08',1,2),(106,90,190,'2023-12-15 23:38:08',7,2),(107,1000,0,'2023-12-16 16:38:10',1,2),(108,190,1190,'2023-12-16 16:38:10',7,2),(109,1100,1010,'2023-12-16 17:02:00',7,2),(110,1000,1090,'2023-12-16 17:02:00',1,2),(111,0,-1100,'2023-12-16 17:02:09',7,2),(112,1090,2190,'2023-12-16 17:02:09',1,2),(113,2100,2010,'2023-12-16 17:24:37',1,2),(114,0,90,'2023-12-16 17:24:37',7,2);
/*!40000 ALTER TABLE `account_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `balance_update_reason`
--

DROP TABLE IF EXISTS `balance_update_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `balance_update_reason` (
  `id_reason` int NOT NULL AUTO_INCREMENT,
  `reason` varchar(45) NOT NULL,
  PRIMARY KEY (`id_reason`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balance_update_reason`
--

LOCK TABLES `balance_update_reason` WRITE;
/*!40000 ALTER TABLE `balance_update_reason` DISABLE KEYS */;
INSERT INTO `balance_update_reason` VALUES (1,'Top up'),(2,'Transfer'),(3,'Withdrawal');
/*!40000 ALTER TABLE `balance_update_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_contract` int NOT NULL AUTO_INCREMENT,
  `surname` varchar(45) NOT NULL,
  `birth` date NOT NULL,
  `address` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `open_date` date NOT NULL,
  `close_date` date DEFAULT NULL,
  `close_reason` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_contract`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Petrov','2000-01-01','Moscow','+79267662030','2020-03-10',NULL,NULL),(2,'Ivanov','2003-08-01','Saint P.','+79153273829','2020-03-10',NULL,NULL),(3,'Mikhailov','1990-05-14','Sochi','+79163748392','2020-03-10',NULL,NULL),(4,'Kuznetsov','1991-03-25','Vladivostok','+79265971208','2020-03-10','2023-03-10',NULL),(5,'Smirnov','1975-11-07','Paris','+79258965899','2020-03-10',NULL,NULL),(11,'Fedotov','2024-12-06','Volgograd','+79163729192','2023-12-07',NULL,NULL),(12,'Simakov','2003-12-17','Moscow','+79267261283','2021-08-01','2023-12-01','Мошенничество'),(13,'Volkov','1990-07-20','Klin','+79237128329','2022-06-10','2022-12-30','Длительная неактивность'),(14,'Sokolov','1995-12-08','Dubna','+79123828123','2021-03-30','2022-08-30','Решение клиента'),(15,'Kuznetsov','1999-12-30','Moscow','+79123829128','2020-12-01','2023-08-01','Мошенничество'),(16,'Lebedev','1985-09-24','Nizhny Novgorod','+79261234567','2022-08-17','2023-12-01','Мошенничество'),(17,'Gorbunov','1972-02-11','Rostov-on-Don','+79267654321','2023-07-15','2023-07-16','Длительная неактивность'),(18,'Belov','1998-08-14','Kazan','+79269876543','2020-03-30','2021-08-10','Решение клиента'),(19,'Medvedev','2001-05-16','Samara','+79269012345','2018-09-15','2023-01-15','Решение клиента'),(20,'Ershov','1989-03-30','Saratov','+79263334455','2019-12-15','2023-01-01','Мошенничество'),(21,'Nikitin','1994-07-20','Kaliningrad','+79262223344','2023-07-01','2023-10-30','Длительная неактивность'),(22,'Soloviev','1978-12-01','Voronezh','+79261112233','2023-01-13','2023-01-14','Решение клиента'),(23,'Timofeev','1965-10-05','Volgograd','+79260011223','2022-11-09','2022-12-30','Мошенничество'),(24,'Orlov','2003-09-09','Krasnodar','+79268887766','2023-12-17','2023-12-18','Длительная неактивность'),(25,'Afanasyev','1996-06-12','Ufa','+79267775544','2023-12-17','2023-12-18','Решение клиента');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange_currencies`
--

DROP TABLE IF EXISTS `exchange_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exchange_currencies` (
  `id_pair` int NOT NULL AUTO_INCREMENT,
  `currency_from` varchar(45) NOT NULL,
  `currency_to` varchar(45) NOT NULL,
  PRIMARY KEY (`id_pair`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_currencies`
--

LOCK TABLES `exchange_currencies` WRITE;
/*!40000 ALTER TABLE `exchange_currencies` DISABLE KEYS */;
INSERT INTO `exchange_currencies` VALUES (1,'RUB','USD'),(2,'USD','RUB');
/*!40000 ALTER TABLE `exchange_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange_rate`
--

DROP TABLE IF EXISTS `exchange_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exchange_rate` (
  `id_rate` int NOT NULL AUTO_INCREMENT,
  `rate_date` date NOT NULL,
  `exchange_rate` decimal(10,2) NOT NULL,
  `id_pair` int NOT NULL,
  PRIMARY KEY (`id_rate`),
  KEY `pair id_idx` (`id_pair`),
  CONSTRAINT `pair id` FOREIGN KEY (`id_pair`) REFERENCES `exchange_currencies` (`id_pair`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_rate`
--

LOCK TABLES `exchange_rate` WRITE;
/*!40000 ALTER TABLE `exchange_rate` DISABLE KEYS */;
INSERT INTO `exchange_rate` VALUES (1,'2020-03-17',0.01,1),(2,'2020-03-17',76.68,2);
/*!40000 ALTER TABLE `exchange_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_users`
--

DROP TABLE IF EXISTS `external_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_users`
--

LOCK TABLES `external_users` WRITE;
/*!40000 ALTER TABLE `external_users` DISABLE KEYS */;
INSERT INTO `external_users` VALUES (1,'misha','misha','customer'),(27,'fewewf','fewewf','customer'),(28,'wref','wref','customer'),(29,'wewefw','wewefw','customer'),(30,'asdasd','asdasd','customer'),(31,'wrwef','wrwef','customer');
/*!40000 ALTER TABLE `external_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internal_users`
--

DROP TABLE IF EXISTS `internal_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internal_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internal_users`
--

LOCK TABLES `internal_users` WRITE;
/*!40000 ALTER TABLE `internal_users` DISABLE KEYS */;
INSERT INTO `internal_users` VALUES (1,'ann_mngr','ann_mngr','manager'),(2,'oleg_ceo','oleg_ceo','ceo'),(3,'vlad_support','vlad_support','support');
/*!40000 ALTER TABLE `internal_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `most_frequent_client_2020`
--

DROP TABLE IF EXISTS `most_frequent_client_2020`;
/*!50001 DROP VIEW IF EXISTS `most_frequent_client_2020`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `most_frequent_client_2020` AS SELECT 
 1 AS `id_contract`,
 1 AS `surname`,
 1 AS `birth`,
 1 AS `address`,
 1 AS `phone`,
 1 AS `open_date`,
 1 AS `close_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reports_lost_customers`
--

DROP TABLE IF EXISTS `reports_lost_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports_lost_customers` (
  `id_report` int NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `birthday_from` date DEFAULT NULL,
  `birthday_to` date DEFAULT NULL,
  PRIMARY KEY (`id_report`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_lost_customers`
--

LOCK TABLES `reports_lost_customers` WRITE;
/*!40000 ALTER TABLE `reports_lost_customers` DISABLE KEYS */;
INSERT INTO `reports_lost_customers` VALUES (1,'23','ann_mngr','2000-08-26','2023-12-16','2013-12-16','2003-12-16'),(2,'Отчет по итогам встречи 20.11','ann_mngr','2000-01-01','2023-12-17','1923-12-17','2005-12-17');
/*!40000 ALTER TABLE `reports_lost_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_lost_customers_data`
--

DROP TABLE IF EXISTS `reports_lost_customers_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports_lost_customers_data` (
  `id_data` int NOT NULL AUTO_INCREMENT,
  `id_report` int DEFAULT NULL,
  `id_customer` int NOT NULL,
  `surname` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `open_date` date NOT NULL,
  `close_date` date DEFAULT NULL,
  `close_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_data`),
  KEY `id_report` (`id_report`),
  CONSTRAINT `reports_lost_customers_data_ibfk_1` FOREIGN KEY (`id_report`) REFERENCES `reports_lost_customers` (`id_report`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_lost_customers_data`
--

LOCK TABLES `reports_lost_customers_data` WRITE;
/*!40000 ALTER TABLE `reports_lost_customers_data` DISABLE KEYS */;
INSERT INTO `reports_lost_customers_data` VALUES (1,2,4,'Kuznetsov','1991-03-25','2020-03-10','2023-03-10',NULL),(2,2,12,'Simakov','2003-12-17','2021-08-01','2023-12-01','Мошенничество'),(3,2,13,'Volkov','1990-07-20','2022-06-10','2022-12-30','Длительная неактивность'),(4,2,14,'Sokolov','1995-12-08','2021-03-30','2022-08-30','Решение клиента'),(5,2,15,'Kuznetsov','1999-12-30','2020-12-01','2023-08-01','Мошенничество'),(6,2,16,'Lebedev','1985-09-24','2022-08-17','2023-12-01','Мошенничество'),(7,2,17,'Gorbunov','1972-02-11','2023-07-15','2023-07-16','Длительная неактивность'),(8,2,18,'Belov','1998-08-14','2020-03-30','2021-08-10','Решение клиента'),(9,2,19,'Medvedev','2001-05-16','2018-09-15','2023-01-15','Решение клиента'),(10,2,20,'Ershov','1989-03-30','2019-12-15','2023-01-01','Мошенничество'),(11,2,21,'Nikitin','1994-07-20','2023-07-01','2023-10-30','Длительная неактивность'),(12,2,22,'Soloviev','1978-12-01','2023-01-13','2023-01-14','Решение клиента'),(13,2,23,'Timofeev','1965-10-05','2022-11-09','2022-12-30','Мошенничество');
/*!40000 ALTER TABLE `reports_lost_customers_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_new_customers`
--

DROP TABLE IF EXISTS `reports_new_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports_new_customers` (
  `id_report` int NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `birthday_from` date DEFAULT NULL,
  `birthday_to` date DEFAULT NULL,
  PRIMARY KEY (`id_report`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_new_customers`
--

LOCK TABLES `reports_new_customers` WRITE;
/*!40000 ALTER TABLE `reports_new_customers` DISABLE KEYS */;
INSERT INTO `reports_new_customers` VALUES (15,'Отчет по итогам встречи 16.12','ann_mngr','2000-12-17','2023-12-17','1923-12-17','2023-12-17'),(16,'Отчет по итогам встречи 29.11','ann_mngr','2000-12-17','2023-12-17','1998-12-16','2005-12-16');
/*!40000 ALTER TABLE `reports_new_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_new_customers_data`
--

DROP TABLE IF EXISTS `reports_new_customers_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports_new_customers_data` (
  `id_data` int NOT NULL AUTO_INCREMENT,
  `id_report` int DEFAULT NULL,
  `id_customer` int NOT NULL,
  `surname` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `open_date` date NOT NULL,
  `accounts` int NOT NULL,
  PRIMARY KEY (`id_data`),
  KEY `id_report` (`id_report`),
  CONSTRAINT `reports_new_customers_data_ibfk_1` FOREIGN KEY (`id_report`) REFERENCES `reports_new_customers` (`id_report`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_new_customers_data`
--

LOCK TABLES `reports_new_customers_data` WRITE;
/*!40000 ALTER TABLE `reports_new_customers_data` DISABLE KEYS */;
INSERT INTO `reports_new_customers_data` VALUES (38,15,1,'Petrov','2000-01-01','2020-03-10',2),(39,15,2,'Ivanov','2003-08-01','2020-03-10',1),(40,15,3,'Petrov','1990-05-14','2020-03-10',1),(41,15,4,'Kuznetsov','1991-03-25','2020-03-10',1),(42,15,5,'Smirnov','1975-11-07','2020-03-10',2),(45,16,1,'Petrov','2000-01-01','2020-03-10',2),(46,16,2,'Ivanov','2003-08-01','2020-03-10',1);
/*!40000 ALTER TABLE `reports_new_customers_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_requests`
--

DROP TABLE IF EXISTS `reports_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports_requests` (
  `id_report` int NOT NULL AUTO_INCREMENT,
  `request_topic` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  PRIMARY KEY (`id_report`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_requests`
--

LOCK TABLES `reports_requests` WRITE;
/*!40000 ALTER TABLE `reports_requests` DISABLE KEYS */;
INSERT INTO `reports_requests` VALUES (1,'wife','ann_mngr','2000-12-16 00:00:00','2023-12-16 00:00:00'),(2,'Отчет по итогам собрания 20.10','ann_mngr','2000-12-17 00:00:00','2023-12-17 00:00:00');
/*!40000 ALTER TABLE `reports_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_requests_data`
--

DROP TABLE IF EXISTS `reports_requests_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports_requests_data` (
  `id_data` int NOT NULL AUTO_INCREMENT,
  `id_report` int DEFAULT NULL,
  `request_id` int DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `request_status` enum('open','closed','pending') DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_data`),
  KEY `id_report` (`id_report`),
  KEY `request_id` (`request_id`),
  CONSTRAINT `reports_requests_data_ibfk_1` FOREIGN KEY (`id_report`) REFERENCES `reports_requests` (`id_report`),
  CONSTRAINT `reports_requests_data_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `requests` (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_requests_data`
--

LOCK TABLES `reports_requests_data` WRITE;
/*!40000 ALTER TABLE `reports_requests_data` DISABLE KEYS */;
INSERT INTO `reports_requests_data` VALUES (1,1,1,'2023-12-12 00:52:12','2023-12-13 01:00:35','pending','11'),(2,1,4,'2023-12-12 01:22:47','2023-12-13 01:24:16','closed','123'),(3,1,5,'2023-12-12 01:23:50','2023-12-13 01:28:15','closed','123'),(4,1,6,'2023-12-12 01:24:32','2023-12-13 20:56:15','pending','123'),(5,1,7,'2023-12-12 01:30:21','2023-12-13 20:59:47','closed','123'),(6,1,8,'2023-12-13 21:13:42','2023-12-13 21:13:42','open','qwd'),(7,1,9,'2023-12-13 21:17:08','2023-12-13 21:17:08','open','option1'),(8,1,10,'2023-12-13 21:18:40','2023-12-13 21:18:40','open','Проблемы с банковским счетом'),(9,1,11,'2023-12-13 21:36:30','2023-12-13 21:36:30','open','Переводы'),(16,2,1,'2023-12-12 00:52:12','2023-12-13 01:00:35','pending','11'),(17,2,4,'2023-12-12 01:22:47','2023-12-13 01:24:16','closed','123'),(18,2,5,'2023-12-12 01:23:50','2023-12-13 01:28:15','closed','123'),(19,2,6,'2023-12-12 01:24:32','2023-12-13 20:56:15','pending','123'),(20,2,7,'2023-12-12 01:30:21','2023-12-13 20:59:47','closed','123'),(21,2,8,'2023-12-13 21:13:42','2023-12-13 21:13:42','open','qwd'),(22,2,9,'2023-12-13 21:17:08','2023-12-13 21:17:08','open','option1'),(23,2,10,'2023-12-13 21:18:40','2023-12-13 21:18:40','open','Проблемы с банковским счетом'),(24,2,11,'2023-12-13 21:36:30','2023-12-13 21:36:30','open','Переводы');
/*!40000 ALTER TABLE `reports_requests_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `request_status` enum('open','closed','pending') NOT NULL DEFAULT 'open',
  `request_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text,
  `response` text,
  `topic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `external_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (1,1,'pending','2023-12-12 00:52:12','2023-12-13 01:00:35','erg','wr','11'),(4,1,'closed','2023-12-12 01:22:47','2023-12-13 01:24:16','123','lol','123'),(5,1,'closed','2023-12-12 01:23:50','2023-12-13 01:28:15','123','ne tuda napisal','123'),(6,1,'pending','2023-12-12 01:24:32','2023-12-13 20:56:15','123',NULL,'123'),(7,1,'closed','2023-12-12 01:30:21','2023-12-13 20:59:47','123','не наша проблема','123'),(8,1,'open','2023-12-13 21:13:42','2023-12-13 21:13:42','fwd',NULL,'qwd'),(9,1,'open','2023-12-13 21:17:08','2023-12-13 21:17:08','123',NULL,'option1'),(10,1,'open','2023-12-13 21:18:40','2023-12-13 21:18:40','верните деньги',NULL,'Проблемы с банковским счетом'),(11,1,'open','2023-12-13 21:36:30','2023-12-13 21:36:30','не дошел перевод',NULL,'Переводы');
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions_history`
--

DROP TABLE IF EXISTS `transactions_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions_history` (
  `id_transaction` int NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `transfer_date` datetime NOT NULL,
  `account_from` int NOT NULL,
  `account_to` int NOT NULL,
  PRIMARY KEY (`id_transaction`),
  KEY `account from_idx` (`account_from`),
  KEY `account to_idx` (`account_to`),
  CONSTRAINT `account from` FOREIGN KEY (`account_from`) REFERENCES `account` (`id_account`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account to` FOREIGN KEY (`account_to`) REFERENCES `account` (`id_account`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions_history`
--

LOCK TABLES `transactions_history` WRITE;
/*!40000 ALTER TABLE `transactions_history` DISABLE KEYS */;
INSERT INTO `transactions_history` VALUES (1,1000,'2020-03-01 00:00:00',1,2),(2,2450,'2020-05-10 00:00:00',1,3),(3,7500,'2020-04-25 00:00:00',1,4),(4,10000,'2020-06-11 00:00:00',1,5),(5,5000,'2020-07-17 00:00:00',5,1),(6,15000,'2020-08-09 00:00:00',4,2),(7,45000,'2020-09-05 00:00:00',3,4),(8,50000,'2020-10-23 00:00:00',2,3),(9,6000,'2020-11-18 00:00:00',5,1),(11,100,'2020-03-01 01:01:01',1,2),(12,10000,'2023-04-12 00:58:15',6,3),(13,10000,'2023-04-12 00:58:45',6,3),(14,10000,'2023-04-12 00:59:57',5,3),(15,10000,'2023-04-12 01:00:29',3,5),(16,10,'2023-04-25 23:20:59',1,2),(18,10,'2023-04-25 23:41:30',1,2),(19,20,'2023-11-25 03:53:27',7,2),(20,1234,'2023-11-25 03:53:44',1,7),(21,1,'2023-12-11 16:24:14',1,2),(22,1,'2023-12-11 16:25:24',1,2),(23,1,'2023-12-11 16:25:32',1,2),(24,1,'2023-12-11 16:31:59',1,2),(25,1,'2023-12-11 16:52:03',1,1),(26,1,'2023-12-11 16:54:20',1,2),(27,1,'2023-12-11 16:54:26',1,2),(28,1,'2023-12-11 17:00:25',1,2),(29,1,'2023-12-11 17:00:31',1,2),(30,25,'2023-12-11 17:06:29',1,2),(31,2,'2023-12-11 17:08:30',1,2),(32,2,'2023-12-11 17:10:49',2,5),(33,71,'2023-12-11 17:36:51',1,7),(34,6,'2023-12-11 18:07:37',7,5),(35,1,'2023-12-11 18:18:25',1,3),(36,5,'2023-12-11 18:18:41',1,5),(39,69,'2023-12-12 00:01:39',1,5),(40,10,'2023-12-13 18:35:37',1,7),(41,400,'2023-12-13 21:07:07',7,1),(42,90,'2023-12-15 22:05:11',1,7),(43,90,'2023-12-15 23:34:10',7,1),(44,90,'2023-12-15 23:34:59',1,7),(45,1090,'2023-12-15 23:35:08',7,1),(46,-100,'2023-12-15 23:35:42',1,7),(47,100,'2023-12-15 23:35:55',1,7),(48,90,'2023-12-15 23:36:56',1,7),(49,100,'2023-12-15 23:38:08',1,7),(50,1000,'2023-12-16 16:38:10',1,7),(51,90,'2023-12-16 17:02:00',7,1),(52,1100,'2023-12-16 17:02:09',7,1),(53,90,'2023-12-16 17:24:37',1,7);
/*!40000 ALTER TABLE `transactions_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bank'
--

--
-- Dumping routines for database 'bank'
--
/*!50003 DROP PROCEDURE IF EXISTS `CreateLostCustomersReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateLostCustomersReport`(IN p_topic varchar(255), IN p_created_by varchar(255),
                                                                 IN p_date_from date, IN p_date_to date,
                                                                 IN p_birthday_from date, IN p_birthday_to date)
BEGIN
    DECLARE v_id_report INT;

    INSERT INTO reports_lost_customers(topic, created_by, date_from, date_to, birthday_from, birthday_to)
    VALUES (p_topic, p_created_by, p_date_from, p_date_to, p_birthday_from, p_birthday_to);

    SET v_id_report = LAST_INSERT_ID();

    INSERT INTO reports_lost_customers_data(id_report, id_customer, surname, birthday, open_date, close_date, close_reason)
    SELECT v_id_report, c.id_contract, c.surname, c.birth, c.open_date, c.close_date, c.close_reason
    FROM client c
    WHERE c.close_date BETWEEN p_date_from AND p_date_to
        AND
        c.birth BETWEEN p_birthday_from AND p_birthday_to;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateNewCustomersReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateNewCustomersReport`(IN p_topic varchar(255), IN p_created_by varchar(255),
                                                                IN p_date_from date, IN p_date_to date,
                                                                IN p_birthday_from date, IN p_birthday_to date)
BEGIN
    DECLARE v_id_report INT;

    INSERT INTO reports_new_customers(topic, created_by, date_from, date_to, birthday_from, birthday_to)
    VALUES (p_topic, p_created_by, p_date_from, p_date_to, p_birthday_from, p_birthday_to);

    SET v_id_report = LAST_INSERT_ID();

    INSERT INTO reports_new_customers_data(id_report, id_customer, surname, birthday, open_date, accounts)
    SELECT v_id_report, c.id_contract, c.surname, c.birth, c.open_date, COUNT(a.id_account)
    FROM client c
    JOIN account a ON c.id_contract = a.id_client
    WHERE (c.open_date BETWEEN p_date_from AND p_date_to) AND (c.birth BETWEEN p_birthday_from AND p_birthday_to)
    GROUP BY c.id_contract;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateRequestsReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateRequestsReport`(IN request_date_from datetime, IN request_date_to datetime,
                                                            IN in_topic varchar(255), IN creator varchar(255))
BEGIN
  INSERT INTO reports_requests (request_topic, created_by, date_from, date_to)
  VALUES (in_topic, creator, request_date_from, request_date_to);

  SET @last_id_report = LAST_INSERT_ID();

  INSERT INTO reports_requests_data (id_report, request_id, request_date, last_updated, request_status, topic)
  SELECT @last_id_report, request_id, request_date, last_updated, request_status, topic
  FROM requests
  WHERE request_date BETWEEN request_date_from AND request_date_to AND (request_status = 'pending' OR request_status = 'open');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `most_frequent_client_2020`
--

/*!50001 DROP VIEW IF EXISTS `most_frequent_client_2020`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `most_frequent_client_2020` AS select `client`.`id_contract` AS `id_contract`,`client`.`surname` AS `surname`,`client`.`birth` AS `birth`,`client`.`address` AS `address`,`client`.`phone` AS `phone`,`client`.`open_date` AS `open_date`,`client`.`close_date` AS `close_date` from `client` where (`client`.`id_contract` = (select `tx_history`.`account_from` from `transactions_history` `tx_history` where (year(`tx_history`.`transfer_date`) = 2020) group by `tx_history`.`account_from` order by count(0) desc limit 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-18 14:28:29
