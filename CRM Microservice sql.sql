-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: crmleadsesdb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `lead`
--

DROP TABLE IF EXISTS `lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `company` varchar(255) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead`
--

LOCK TABLES `lead` WRITE;
/*!40000 ALTER TABLE `lead` DISABLE KEYS */;
INSERT INTO `lead` VALUES (1,'Globex Corporation','2024-06-15 19:11:04.957793','alice@example.com','Marketing Manager','Alice Johnson','9876543210','2024-06-15 19:11:04.957793'),(2,'Initech','2024-06-15 19:14:35.220687','bob@example.com','Product Manager','Bob Smith','5551234567','2024-06-15 19:14:35.220687'),(3,'Globex Corporation','2024-06-15 19:33:11.864754','alice@example.com','Marketing Manager','Alice Johnson','9876543210','2024-06-15 19:33:11.864754'),(4,'Initech','2024-06-15 19:33:24.172231','bob@example.com','Product Manager','Bob Smith','5551234567','2024-06-15 19:33:24.172231'),(5,'Wayne Enterprises','2024-06-15 19:33:52.092351','eve@example.com','Operations Manager','Eve Black','6546546543','2024-06-15 19:33:52.092351'),(6,'Stark Industries','2024-06-15 19:34:09.949539','frank@example.com','Technical Lead','Frank Green','4564564567','2024-06-15 19:34:09.949539');
/*!40000 ALTER TABLE `lead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_activity`
--

DROP TABLE IF EXISTS `lead_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_activity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activity_type` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `lead_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1xtvbot5f1worx7wja7qed7m0` (`lead_id`),
  CONSTRAINT `FK1xtvbot5f1worx7wja7qed7m0` FOREIGN KEY (`lead_id`) REFERENCES `lead` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_activity`
--

LOCK TABLES `lead_activity` WRITE;
/*!40000 ALTER TABLE `lead_activity` DISABLE KEYS */;
INSERT INTO `lead_activity` VALUES (2,'Email','John Doe','Sent an introductory email to the lead','2023-06-14 09:00:00.000000',1),(3,'Meeting','Alice Johnson','In-person meeting to discuss project details','2023-06-15 14:00:00.000000',2),(4,'Demo','John Doe','Conducted a product demo for the lead','2023-06-16 10:00:00.000000',3),(5,'Follow-up','Jane Smith','Follow-up call to check on lead\'s interest','2023-06-17 15:30:00.000000',5),(6,'Webinar','Alice Johnson','Lead attended our product webinar','2023-06-18 11:00:00.000000',6),(7,'Networking Event','Bob Smith','Met the lead at a networking event','2023-06-19 09:00:00.000000',6);
/*!40000 ALTER TABLE `lead_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_score`
--

DROP TABLE IF EXISTS `lead_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_score` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_score_update` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `score` int NOT NULL,
  `lead_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlt59ec8yuie5psrlp72de6ar3` (`lead_id`),
  CONSTRAINT `FKlt59ec8yuie5psrlp72de6ar3` FOREIGN KEY (`lead_id`) REFERENCES `lead` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_score`
--

LOCK TABLES `lead_score` WRITE;
/*!40000 ALTER TABLE `lead_score` DISABLE KEYS */;
INSERT INTO `lead_score` VALUES (2,'2023-06-13 12:00:00.000000','Lead Score',90,1),(3,'2023-06-14 08:30:00.000000','Lead Score',70,2),(4,'2023-06-15 10:45:00.000000','Lead Score',85,3),(5,'2023-06-15 10:45:00.000000','Lead Score',85,4),(6,NULL,'Conference',0,5),(7,NULL,'Cold Call',0,6);
/*!40000 ALTER TABLE `lead_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_source`
--

DROP TABLE IF EXISTS `lead_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_source` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `lead_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgd8sur0y3olkusa6k9ls3w5dk` (`lead_id`),
  CONSTRAINT `FKgd8sur0y3olkusa6k9ls3w5dk` FOREIGN KEY (`lead_id`) REFERENCES `lead` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_source`
--

LOCK TABLES `lead_source` WRITE;
/*!40000 ALTER TABLE `lead_source` DISABLE KEYS */;
INSERT INTO `lead_source` VALUES (1,NULL,'Lead Score',1),(2,'Lead found us through a LinkedIn ad','LinkedIn',2);
/*!40000 ALTER TABLE `lead_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_status`
--

DROP TABLE IF EXISTS `lead_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assigned_to` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `last_contact_date` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `lead_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnjysx2jh7nfqn9c2585rnhasu` (`lead_id`),
  CONSTRAINT `FKnjysx2jh7nfqn9c2585rnhasu` FOREIGN KEY (`lead_id`) REFERENCES `lead` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_status`
--

LOCK TABLES `lead_status` WRITE;
/*!40000 ALTER TABLE `lead_status` DISABLE KEYS */;
INSERT INTO `lead_status` VALUES (2,'Alice Johnson','Newly acquired lead, not yet contacted',NULL,'New',1),(3,'Bob Smith','Lead is being actively engaged','2023-06-14 11:00:00.000000','In Progress',2),(4,'David Brown','Initial contact made with lead','2023-06-15 14:30:00.000000','Contacted',3),(5,'Carol White','Lead has been converted to a customer','2023-06-17 12:00:00.000000','Closed - Won',4),(6,'Eve Black','Proposal sent to the lead','2023-06-17 16:00:00.000000','Proposal Sent',5),(7,'Frank Green','Lead decided not to proceed','2023-06-18 13:30:00.000000','Closed - Lost',6);
/*!40000 ALTER TABLE `lead_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-16 23:41:27
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: crmsalesesdb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount_due` double NOT NULL,
  `due_date` datetime(6) DEFAULT NULL,
  `paid` bit(1) NOT NULL,
  `opportunity_id` bigint DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_gnfabg6rvhoc3c9o4deqb1hn4` (`order_id`),
  KEY `FKl6oq3f49icgved0an1hfthvd` (`opportunity_id`),
  CONSTRAINT `FKl6oq3f49icgved0an1hfthvd` FOREIGN KEY (`opportunity_id`) REFERENCES `opportunity` (`id`),
  CONSTRAINT `FKr27vrfyll0shs80upv1rmctie` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,5000,'2024-07-14 00:00:00.000000',_binary '\0',1,NULL),(2,15000,'2024-07-15 00:00:00.000000',_binary '\0',2,NULL),(3,100000,'2024-07-16 00:00:00.000000',_binary '\0',3,NULL),(4,500000,'2024-07-17 00:00:00.000000',_binary '\0',4,NULL),(5,1000000,'2024-07-18 00:00:00.000000',_binary '\0',5,NULL),(6,400000,'2024-07-19 00:00:00.000000',_binary '\0',6,NULL),(7,750000,'2024-07-20 00:00:00.000000',_binary '\0',7,NULL);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunity`
--

DROP TABLE IF EXISTS `opportunity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opportunity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assigned_to` varchar(255) DEFAULT NULL,
  `creation_date` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunity`
--

LOCK TABLES `opportunity` WRITE;
/*!40000 ALTER TABLE `opportunity` DISABLE KEYS */;
INSERT INTO `opportunity` VALUES (1,'John Doe','2024-06-14 10:00:00.000000','Potential sale of our premium package to a new client','New Client Acquisition'),(2,'Jane Smith','2024-06-15 10:00:00.000000','Upselling a higher-tier package to an existing client','Existing Client Upsell'),(3,'Alice Johnson','2024-06-16 10:00:00.000000','Exploring new market opportunities in Europe','New Market Expansion'),(4,'Mark Spencer','2024-06-17 10:00:00.000000','Negotiation for a strategic partnership with a major corporation','Strategic Partnership'),(5,'Susan Clarke','2024-06-18 10:00:00.000000','Proposal for a government contract for our security solutions','Government Contract'),(6,'Michael Johnson','2024-06-19 10:00:00.000000','Collaboration with a non-profit organization for educational software','Non-Profit Collaboration'),(7,'Emily Davis','2024-06-20 10:00:00.000000','Offering healthcare management software to hospitals','Healthcare Sector');
/*!40000 ALTER TABLE `opportunity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_date` datetime(6) DEFAULT NULL,
  `product` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `total_price` double NOT NULL,
  `opportunity_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqf0hgg3516q572m6hmfvxt7ic` (`opportunity_id`),
  CONSTRAINT `FKqf0hgg3516q572m6hmfvxt7ic` FOREIGN KEY (`opportunity_id`) REFERENCES `opportunity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2024-06-14 11:00:00.000000','Premium Software Package',5,5000,1),(2,'2024-06-15 11:00:00.000000','Advanced Analytics Module',3,15000,2),(3,'2024-06-16 11:00:00.000000','International Expansion Kit',10,100000,3),(4,'2024-06-17 11:00:00.000000','Strategic Management Tool',50,500000,4),(5,'2024-06-18 11:00:00.000000','Security Suite',100,1000000,5),(6,'2024-06-19 11:00:00.000000','Educational Software Suite',20,400000,6),(7,'2024-06-20 11:00:00.000000','Healthcare Management System',30,750000,7);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `opportunity_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK34oiiof4vt87iqj6e355w38xg` (`opportunity_id`),
  CONSTRAINT `FK34oiiof4vt87iqj6e355w38xg` FOREIGN KEY (`opportunity_id`) REFERENCES `opportunity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'A comprehensive software package for large enterprises','Enterprise Software Solution',10000,1),(2,'A suite of advanced data analytics tools','Data Analytics Suite',20000,2),(3,'A toolset for localizing software for international markets','Localization Toolset',50000,3),(4,'A comprehensive tool for strategic planning and management','Strategic Management Tool',10000,4),(5,'An advanced security suite for government use','Security Suite',10000,5),(6,'A software suite designed for educational institutions','Educational Software Suite',20000,6),(7,'A comprehensive management system for healthcare facilities','Healthcare Management System',25000,7);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote`
--

DROP TABLE IF EXISTS `quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quote` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `quote_date` datetime(6) DEFAULT NULL,
  `opportunity_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKo59o02dnblndwyytriw00ghsw` (`opportunity_id`),
  CONSTRAINT `FKo59o02dnblndwyytriw00ghsw` FOREIGN KEY (`opportunity_id`) REFERENCES `opportunity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote`
--

LOCK TABLES `quote` WRITE;
/*!40000 ALTER TABLE `quote` DISABLE KEYS */;
INSERT INTO `quote` VALUES (1,95000,'Quote for 10 licenses of our Enterprise Software Solution','2024-06-14 09:00:00.000000',1),(2,95000,'Quote for 5 licenses of our Data Analytics Suite','2024-06-15 09:00:00.000000',2),(3,950000,'Quote for 20 licenses of our Localization Toolset','2024-06-16 09:00:00.000000',3),(4,500000,'Quote for 50 licenses of our Strategic Management Tool','2024-06-17 09:00:00.000000',4),(5,1000000,'Quote for 100 licenses of our Security Suite','2024-06-18 09:00:00.000000',5),(6,400000,'Quote for 20 licenses of our Educational Software Suite','2024-06-19 09:00:00.000000',6),(7,750000,'Quote for 30 licenses of our Healthcare Management System','2024-06-20 09:00:00.000000',7);
/*!40000 ALTER TABLE `quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_target`
--

DROP TABLE IF EXISTS `sales_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_target` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `quote_date` datetime(6) DEFAULT NULL,
  `salesperson` varchar(255) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `target_amount` double NOT NULL,
  `opportunity_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfpf3b36svdu1fe76ljo3qnyrr` (`opportunity_id`),
  CONSTRAINT `FKfpf3b36svdu1fe76ljo3qnyrr` FOREIGN KEY (`opportunity_id`) REFERENCES `opportunity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_target`
--

LOCK TABLES `sales_target` WRITE;
/*!40000 ALTER TABLE `sales_target` DISABLE KEYS */;
INSERT INTO `sales_target` VALUES (1,0,'Annual sales target for the year 2024','2024-12-31 23:59:59.000000',NULL,'Jane Smith','2024-01-01 00:00:00.000000',1000000,1),(2,0,'Annual sales target for the year 2024','2024-12-31 23:59:59.000000',NULL,'John Doe','2024-01-01 00:00:00.000000',750000,2),(3,0,'Annual sales target for the year 2024','2024-12-31 23:59:59.000000',NULL,'Alice Johnson','2024-01-01 00:00:00.000000',500000,3),(4,0,'Annual sales target for the year 2024','2024-12-31 23:59:59.000000',NULL,'Mark Spencer','2024-01-01 00:00:00.000000',1500000,4),(5,0,'Annual sales target for the year 2024','2024-12-31 23:59:59.000000',NULL,'Susan Clarke','2024-01-01 00:00:00.000000',2000000,5),(6,0,'Annual sales target for the year 2024','2024-12-31 23:59:59.000000',NULL,'Michael Johnson','2024-01-01 00:00:00.000000',1200000,6),(7,0,'Annual sales target for the year 2024','2024-12-31 23:59:59.000000',NULL,'Emily Davis','2024-01-01 00:00:00.000000',1800000,7);
/*!40000 ALTER TABLE `sales_target` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-16 23:41:28
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: crmemployeessdb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `present` bit(1) NOT NULL,
  `employee_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKr7q0h8jfngkyybll6o9r3h9ua` (`employee_id`),
  CONSTRAINT `FKr7q0h8jfngkyybll6o9r3h9ua` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,'2024-06-10',_binary '',5),(2,'2023-06-12',_binary '',7),(3,'2024-05-15',_binary '',8),(4,'2023-08-16',_binary '',9),(5,'2024-03-25',_binary '',10),(6,'2023-10-10',_binary '',11);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `team_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8d7lrsr6kwirr93rx0tafnoqa` (`team_id`),
  CONSTRAINT `FK8d7lrsr6kwirr93rx0tafnoqa` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (5,'john.doe@example.com','John','Doe',2),(7,'venu.d@example.com','venu','madhav',3),(8,'alice.smith@example.com','Alice','Smith',4),(9,'bob.johnson@example.com','Bob','Johnson',5),(10,'charlie.brown@example.com','Charlie','Brown',6),(11,'david.williams@example.com','David','Williams',7);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `payment_date` date DEFAULT NULL,
  `salary` decimal(38,2) DEFAULT NULL,
  `employee_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5o7fr6cbvrkgud2unv0p5rqlm` (`employee_id`),
  CONSTRAINT `FK5o7fr6cbvrkgud2unv0p5rqlm` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll`
--

LOCK TABLES `payroll` WRITE;
/*!40000 ALTER TABLE `payroll` DISABLE KEYS */;
INSERT INTO `payroll` VALUES (1,'2024-06-01',5000.00,5),(2,'2023-06-15',5000.00,7),(3,'2024-05-30',5500.00,8),(4,'2023-08-20',5200.00,9),(5,'2024-03-30',6000.00,10),(6,'2023-10-20',5800.00,11);
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance_review`
--

DROP TABLE IF EXISTS `performance_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comments` varchar(255) DEFAULT NULL,
  `review_date` date DEFAULT NULL,
  `employee_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9159yuocyhexftv11wmay20cg` (`employee_id`),
  CONSTRAINT `FK9159yuocyhexftv11wmay20cg` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_review`
--

LOCK TABLES `performance_review` WRITE;
/*!40000 ALTER TABLE `performance_review` DISABLE KEYS */;
INSERT INTO `performance_review` VALUES (1,'Excellent performance','2024-06-01',5),(2,'Excellent performance this quarter.','2023-06-01',7),(3,'Outstanding commitment to the project','2024-05-01',8),(4,'Strong performance throughout the year','2023-08-15',9),(5,'Exceptional creativity and marketing strategies','2024-04-10',10),(6,'Achieved sales targets consistently','2023-11-05',11);
/*!40000 ALTER TABLE `performance_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (2,'Team Alpha'),(3,'Super Team beta'),(4,'Development Team'),(5,'QA Team'),(6,'Marketing Team'),(7,'Sales Team');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `employee_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfitr8q8r2mg9va0p8xfeo023w` (`employee_id`),
  CONSTRAINT `FKfitr8q8r2mg9va0p8xfeo023w` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
INSERT INTO `training` VALUES (1,'Java Basics','2024-06-10','2024-06-01',5),(2,'Java Fundamentals','2023-07-15','2023-07-01',7),(3,'Advanced Java','2024-04-10','2024-04-01',8),(4,'Advanced Java','2024-04-10','2024-04-01',8),(5,'Software Testing Basics','2023-07-15','2023-07-01',9),(6,'Digital Marketing Advanced','2024-02-10','2024-02-01',10),(7,'Advanced Sales Techniques','2023-09-10','2023-09-01',11);
/*!40000 ALTER TABLE `training` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-16 23:41:28
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: crmcustomersdb
-- ------------------------------------------------------
-- Server version	8.0.35

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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnnwpo0lfq4xai1rs6887sx02k` (`customer_id`),
  CONSTRAINT `FKnnwpo0lfq4xai1rs6887sx02k` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'ABC123','123 Main Street, Anytown USA','Manufacturing','Acme Inc.',1),(2,'DEF456','456 Elm Street, Somewhere USA','Technology','Tech Solutions Ltd.',2),(3,'GHI789','789 Oak Avenue, Anycity USA','Healthcare','Health Plus',3),(4,'JKL012','101 Pine Street, Green City USA','Energy','Green Energy Corp.',4),(5,'MNO345','202 Maple Drive, Fin City USA','Finance','FinTech Innovators',5),(6,'ABC123','123 Main Street, Anytown USA','Manufacturing','Acme Inc.',6);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activity_type` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKse269fvw3ft70lc8sf7mp5kpo` (`customer_id`),
  CONSTRAINT `FKse269fvw3ft70lc8sf7mp5kpo` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'Call','Call the customer to follow up on their recent order.','2023-06-15','Pending','Follow-up on order',1),(2,'Email','Email the customer the invoice for their recent purchase.','2023-06-20','Completed','Send invoice',2),(3,'Meeting','Schedule a kickoff meeting for the new project.','2023-06-22','Scheduled','Project kickoff',3),(4,'Visit','Visit the customer site for an inspection.','2023-06-25','Pending','Site inspection',4),(5,'Support','Provide technical support over the phone.','2023-06-28','In Progress','Technical support call',5),(6,'Call','Call the customer to follow up on their recent order.','2023-06-15','Pending','Follow-up on order',6);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case`
--

DROP TABLE IF EXISTS `case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `case_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKiniedyvyf9ce9ha661l9ffhpw` (`customer_id`),
  CONSTRAINT `FKiniedyvyf9ce9ha661l9ffhpw` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case`
--

LOCK TABLES `case` WRITE;
/*!40000 ALTER TABLE `case` DISABLE KEYS */;
INSERT INTO `case` VALUES (1,'CASE001','The customer is experiencing an issue with the product.','High',NULL,'Open','Product issue',1),(2,'CASE002','The customer has a discrepancy in their latest bill.','Medium',NULL,'Open','Billing discrepancy',2),(3,'CASE003','The customer is requesting a new feature for the product.','Low',NULL,'Closed','Feature request',3),(4,'CASE004','The customer reported a delay in their shipment.','High',NULL,'Open','Shipping delay',4),(5,'CASE005','The customer is unable to log into their account.','Medium',NULL,'Resolved','Login issues',5),(6,'CASE001','The customer is experiencing an issue with the product.','High',NULL,'Open','Product issue',6);
/*!40000 ALTER TABLE `case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKckoarj5a5jmet3b3smgdhaopw` (`customer_id`),
  CONSTRAINT `FKckoarj5a5jmet3b3smgdhaopw` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'jane.smith@customer.com','Manager','Jane Smith','987-654-3210',1),(2,'robert.green@customer.com','CEO','Robert Green','876-543-2109',2),(3,'emily.white@customer.com','CFO','Emily White','765-432-1098',3),(4,'helen.brown@customer.com','CTO','Helen Brown','654-321-0987',4),(5,'michael.lee@customer.com','COO','Michael Lee','543-210-9876',5),(6,'jane.smith@customer.com','Manager','Jane Smith','987-654-3210',6);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'venu.d@example.com','venu madhav','8919524324'),(2,'karim.sk@example.com','karim','8975675699'),(3,'alice.johnson@example.com','Alice Johnson','2345678901'),(4,'charlie.davis@example.com','Charlie Davis','456-789-0123'),(5,'danielle.martin@example.com','Danielle Martin','567-890-1234'),(6,'john.doe@example.com','John Doe','123-456-7890');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowledge_article`
--

DROP TABLE IF EXISTS `knowledge_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledge_article` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKque0kib707qp84v7tn5vh2gly` (`customer_id`),
  CONSTRAINT `FKque0kib707qp84v7tn5vh2gly` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledge_article`
--

LOCK TABLES `knowledge_article` WRITE;
/*!40000 ALTER TABLE `knowledge_article` DISABLE KEYS */;
INSERT INTO `knowledge_article` VALUES (1,'Follow these steps to reset your password...','password, reset','Published','How to reset your password',1),(2,'Here are the steps to update your profile...','profile, update','Draft','How to update your profile',2),(3,'Steps to troubleshoot network connectivity issues...','network, troubleshoot','Published','Troubleshooting network issues',3),(4,'Steps to create a new account on our platform...','account, create','Published','How to create an account',4),(5,'Follow these steps to reset your password...','password, reset','Published','How to reset your password',6);
/*!40000 ALTER TABLE `knowledge_article` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-16 23:41:28
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: crmsupportanalyticsesdb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `analytics_report`
--

DROP TABLE IF EXISTS `analytics_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analytics_report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `generated_date` datetime(6) DEFAULT NULL,
  `report_data` varchar(255) DEFAULT NULL,
  `report_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_report`
--

LOCK TABLES `analytics_report` WRITE;
/*!40000 ALTER TABLE `analytics_report` DISABLE KEYS */;
INSERT INTO `analytics_report` VALUES (1,'2024-06-14 12:00:00.000000','Detailed analysis of the monthly sales.','Monthly Sales Report'),(2,'2023-06-10 11:00:00.000000','{\'total_sales\': 15000, \'total_revenue\': 75000}','Weekly Sales Report'),(3,'2023-06-15 18:00:00.000000','{\'page_views\': 8000, \'time_spent\': 34000}','Daily User Engagement'),(4,'2023-06-30 17:00:00.000000','{\'total_income\': 500000, \'total_expenses\': 300000}','Quarterly Financial Summary');
/*!40000 ALTER TABLE `analytics_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comments` varchar(255) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `feedback_date` datetime(6) DEFAULT NULL,
  `rating` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'Great service, very satisfied!','1','2024-06-14 10:30:00.000000',5),(4,'Great product, very satisfied!','2','2023-06-15 09:00:00.000000',5),(5,'The user interface is very intuitive.','2','2023-06-15 12:00:00.000000',4),(6,'Good value for money.','3','2023-06-14 15:30:00.000000',4),(7,'I had some issues with the customer service.','4','2023-06-13 11:45:00.000000',3);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance_metric`
--

DROP TABLE IF EXISTS `performance_metric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance_metric` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `metric_name` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `value` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_metric`
--

LOCK TABLES `performance_metric` WRITE;
/*!40000 ALTER TABLE `performance_metric` DISABLE KEYS */;
INSERT INTO `performance_metric` VALUES (1,'API Response Time','ms',250.5),(2,'Database Query Time','ms',120.4),(3,'Memory Usage','MB',512),(4,'CPU Load','%',75.5);
/*!40000 ALTER TABLE `performance_metric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_ticket`
--

DROP TABLE IF EXISTS `support_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_ticket` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `issue_description` varchar(255) DEFAULT NULL,
  `resolved_date` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_ticket`
--

LOCK TABLES `support_ticket` WRITE;
/*!40000 ALTER TABLE `support_ticket` DISABLE KEYS */;
INSERT INTO `support_ticket` VALUES (1,'2023-06-15 14:30:00.000000','1','Unable to log in to the application',NULL,'OPEN'),(2,'2023-06-15 16:45:00.000000','2','App crashes frequently on startup.',NULL,'OPEN'),(3,'2023-06-14 10:15:00.000000','3','Unable to reset my password.',NULL,'OPEN'),(4,'2023-06-13 13:20:00.000000','4','Payment method not being accepted.',NULL,'OPEN');
/*!40000 ALTER TABLE `support_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_response`
--

DROP TABLE IF EXISTS `survey_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_response` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(255) DEFAULT NULL,
  `response` varchar(255) DEFAULT NULL,
  `survey_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_response`
--

LOCK TABLES `survey_response` WRITE;
/*!40000 ALTER TABLE `survey_response` DISABLE KEYS */;
INSERT INTO `survey_response` VALUES (3,'2','{\'question1\': \'Yes\', \'question2\': \'Neutral\', \'question3\': \'Very Satisfied\'}','1'),(4,'2','{\'question1\': \'No\', \'question2\': \'Dissatisfied\', \'question3\': \'Maybe\'}','2'),(5,'3','{\'question1\': \'Yes\', \'question2\': \'Satisfied\', \'question3\': \'Yes\'}','2'),(6,'4','{\'question1\': \'No\', \'question2\': \'Neutral\', \'question3\': \'No\'}','1');
/*!40000 ALTER TABLE `survey_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usaage_data`
--

DROP TABLE IF EXISTS `usaage_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usaage_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `usage_amount` double NOT NULL,
  `usage_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usaage_data`
--

LOCK TABLES `usaage_data` WRITE;
/*!40000 ALTER TABLE `usaage_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `usaage_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_data`
--

DROP TABLE IF EXISTS `usage_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `usage_amount` double NOT NULL,
  `usage_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_data`
--

LOCK TABLES `usage_data` WRITE;
/*!40000 ALTER TABLE `usage_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-16 23:41:29
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: crmmarketingsdb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign` (
  `campaign_id` bigint NOT NULL AUTO_INCREMENT,
  `budget` double DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`campaign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign`
--

LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
INSERT INTO `campaign` VALUES (1,50000,'Promote summer products with discounts','2023-08-31 05:30:00.000000','Summer Sale Campaign','2023-06-01 05:30:00.000000','ACTIVE'),(2,75000,'Promote winter products with special offers','2024-01-31 05:30:00.000000','Winter Wonderland Campaign','2023-11-01 05:30:00.000000','ACTIVE');
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_activity`
--

DROP TABLE IF EXISTS `campaign_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_activity` (
  `activity_id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) DEFAULT NULL,
  `response_rate` double DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `campaign_campaign_id` bigint DEFAULT NULL,
  PRIMARY KEY (`activity_id`),
  KEY `FK5tc2rve25l9xafqkk2ivtyykb` (`campaign_campaign_id`),
  CONSTRAINT `FK5tc2rve25l9xafqkk2ivtyykb` FOREIGN KEY (`campaign_campaign_id`) REFERENCES `campaign` (`campaign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_activity`
--

LOCK TABLES `campaign_activity` WRITE;
/*!40000 ALTER TABLE `campaign_activity` DISABLE KEYS */;
INSERT INTO `campaign_activity` VALUES (1,'2023-06-15 05:30:00.000000',0,'SCHEDULED','Email',1),(2,'2023-12-01 05:30:00.000000',0,'SCHEDULED','Social Media',2);
/*!40000 ALTER TABLE `campaign_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `event_id` bigint NOT NULL AUTO_INCREMENT,
  `attendees_count` int DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `organizer` varchar(255) DEFAULT NULL,
  `campaign_campaign_id` bigint DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `FKhdd7x7hxxwbj0klhdtyxp1ovk` (`campaign_campaign_id`),
  CONSTRAINT `FKhdd7x7hxxwbj0klhdtyxp1ovk` FOREIGN KEY (`campaign_campaign_id`) REFERENCES `campaign` (`campaign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,500,'2023-06-01 05:30:00.000000','Launch event for the Summer Sale Campaign','New York City','Summer Kickoff Event','Marketing Team',1),(2,800,'2023-11-15 05:30:00.000000','Celebrate the start of the Winter Wonderland Campaign','Chicago','Winter Fest','Sales Team',2);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_list`
--

DROP TABLE IF EXISTS `marketing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_list` (
  `list_id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `creation_date` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `list_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `campaign_campaign_id` bigint DEFAULT NULL,
  PRIMARY KEY (`list_id`),
  KEY `FK2v30evpvc89dnjj5x70lcwfch` (`campaign_campaign_id`),
  CONSTRAINT `FK2v30evpvc89dnjj5x70lcwfch` FOREIGN KEY (`campaign_campaign_id`) REFERENCES `campaign` (`campaign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_list`
--

LOCK TABLES `marketing_list` WRITE;
/*!40000 ALTER TABLE `marketing_list` DISABLE KEYS */;
INSERT INTO `marketing_list` VALUES (1,'summer_customers.csv','2023-05-15 05:30:00.000000','List of customers interested in summer products','EMAIL','Summer Customers',1),(2,'winter_enthusiasts.csv','2023-10-01 05:30:00.000000','List of customers interested in winter products','EMAIL','Winter Enthusiasts',2);
/*!40000 ALTER TABLE `marketing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey` (
  `survey_id` bigint NOT NULL AUTO_INCREMENT,
  `creation_date` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `campaign_campaign_id` bigint DEFAULT NULL,
  PRIMARY KEY (`survey_id`),
  KEY `FKo2320kgvnglba1vulji5y25ec` (`campaign_campaign_id`),
  CONSTRAINT `FKo2320kgvnglba1vulji5y25ec` FOREIGN KEY (`campaign_campaign_id`) REFERENCES `campaign` (`campaign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (1,'2023-06-10 05:30:00.000000','Survey to gather feedback on summer products','Summer Product Survey',1),(2,'2023-11-10 05:30:00.000000','Survey to gather feedback on winter products','Winter Product Survey',2);
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_questions`
--

DROP TABLE IF EXISTS `survey_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_questions` (
  `survey_survey_id` bigint NOT NULL,
  `questions` varchar(255) DEFAULT NULL,
  KEY `FKsu5uj0v39bs01tgfv0i6718vl` (`survey_survey_id`),
  CONSTRAINT `FKsu5uj0v39bs01tgfv0i6718vl` FOREIGN KEY (`survey_survey_id`) REFERENCES `survey` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_questions`
--

LOCK TABLES `survey_questions` WRITE;
/*!40000 ALTER TABLE `survey_questions` DISABLE KEYS */;
INSERT INTO `survey_questions` VALUES (1,'How satisfied are you with our summer product range?'),(1,'Which summer product categories would you like to see more options for?'),(1,'How likely are you to recommend our summer products to others?'),(2,'How satisfied are you with our winter product range?'),(2,'Which winter product categories would you like to see more options for?'),(2,'How likely are you to recommend our winter products to others?');
/*!40000 ALTER TABLE `survey_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_responses`
--

DROP TABLE IF EXISTS `survey_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_responses` (
  `survey_survey_id` bigint NOT NULL,
  `responses` varchar(255) DEFAULT NULL,
  KEY `FKn3wne5502w1fgi5ophif5swl7` (`survey_survey_id`),
  CONSTRAINT `FKn3wne5502w1fgi5ophif5swl7` FOREIGN KEY (`survey_survey_id`) REFERENCES `survey` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_responses`
--

LOCK TABLES `survey_responses` WRITE;
/*!40000 ALTER TABLE `survey_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_responses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-16 23:41:29
