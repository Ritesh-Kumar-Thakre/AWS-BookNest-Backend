-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: booknest_wallet
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `statements`
--

DROP TABLE IF EXISTS `statements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statements` (
  `statement_id` int NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `date_time` datetime(6) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `transaction_remarks` varchar(255) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `wallet_id` int DEFAULT NULL,
  PRIMARY KEY (`statement_id`),
  KEY `FK9v33n143lf17hi62bj86kobvi` (`wallet_id`),
  CONSTRAINT `FK9v33n143lf17hi62bj86kobvi` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`wallet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statements`
--

LOCK TABLES `statements` WRITE;
/*!40000 ALTER TABLE `statements` DISABLE KEYS */;
INSERT INTO `statements` VALUES (1,5000,'2026-04-27 15:15:41.611186',NULL,'deposit','DEPOSIT',1),(2,1200,'2026-04-27 15:22:22.940478',1,'OrderPayment','WITHDRAW',1),(3,1200,'2026-04-27 15:26:31.663422',2,'OrderPayment','WITHDRAW',1),(4,200,'2026-04-27 15:26:40.240673',2,'OrderPayment','WITHDRAW',1),(5,1200,'2026-04-27 15:34:59.953200',2,'OrderPayment','WITHDRAW',1),(6,1198,'2026-04-27 15:36:48.119378',2,'Order payment','WITHDRAW',1),(7,2000,'2026-04-29 11:48:00.652494',NULL,'TopUp','DEPOSIT',2),(8,500,'2026-04-29 11:48:08.596830',NULL,'TopUp','DEPOSIT',2),(9,5000,'2026-04-29 11:48:16.346729',NULL,'TopUp','DEPOSIT',2),(10,500,'2026-04-29 12:16:13.661088',NULL,'TopUp','DEPOSIT',2),(11,5000,'2026-04-29 23:20:24.351641',NULL,'TopUp','DEPOSIT',3),(12,500,'2026-04-30 10:03:52.415450',NULL,'TopUp','DEPOSIT',4),(13,1798,'2026-04-30 10:07:05.074378',7,'Order payment','WITHDRAW',3),(14,5000,'2026-04-30 12:51:44.499192',NULL,'TopUp','DEPOSIT',4),(15,3000,'2026-04-30 14:41:21.797896',21,'Order payment','WITHDRAW',4),(16,1000,'2026-04-30 14:42:19.224590',22,'Order payment','WITHDRAW',3),(17,5000,'2026-04-30 16:22:43.946355',NULL,'TopUp','DEPOSIT',4),(18,2012,'2026-05-02 12:03:52.848534',29,'Order payment','WITHDRAW',3),(19,5000,'2026-05-02 12:49:22.910251',NULL,'TopUp','DEPOSIT',3),(20,5000,'2026-05-02 12:49:25.589503',NULL,'TopUp','DEPOSIT',3),(21,9690,'2026-05-02 12:49:40.723342',33,'Order payment','WITHDRAW',3),(22,2012,'2026-05-02 14:14:31.407416',38,'Order payment','WITHDRAW',4),(23,2012,'2026-05-02 14:14:37.890559',38,'Order cancellation refund','REFUND',4),(24,5000,'2026-05-03 15:10:52.172138',NULL,'TopUp','DEPOSIT',5),(25,5000,'2026-05-03 15:11:32.379145',NULL,'Razorpay TopUp (pay_SkqTgDcf70QWvV)','DEPOSIT',5),(26,500,'2026-05-03 15:17:32.939864',NULL,'Razorpay TopUp (pay_Skqa2OBDEB9oh9)','DEPOSIT',5),(27,10465,'2026-05-03 19:14:04.299055',49,'Order payment','WITHDRAW',5),(28,500,'2026-05-04 00:52:32.885815',NULL,'Razorpay TopUp (pay_Sl0NQZTrSZYpwH)','DEPOSIT',5),(29,535,'2026-05-04 00:52:36.463542',NULL,'Withdrawal','WITHDRAW',5),(30,5000,'2026-05-04 10:46:26.805831',NULL,'Razorpay TopUp (pay_SlG7JxiOtH9vYa)','DEPOSIT',7),(31,5000,'2026-05-04 10:47:44.001099',NULL,'Withdrawal','WITHDRAW',7),(32,10465,'2026-05-04 10:54:52.878150',53,'Order cancellation refund','REFUND',7),(33,10465,'2026-05-04 13:33:28.168378',NULL,'Withdrawal','WITHDRAW',7),(34,5000,'2026-05-04 13:38:40.548804',NULL,'Razorpay TopUp (pay_SlJ3I61SuIlmyC)','DEPOSIT',7),(35,924,'2026-05-04 13:53:58.283982',56,'Order payment','WITHDRAW',7),(36,924,'2026-05-04 13:55:06.932334',56,'Order cancellation refund','REFUND',7),(37,5000,'2026-05-04 13:55:44.994733',NULL,'Withdrawal','WITHDRAW',7),(38,5000,'2026-05-04 13:56:23.384644',NULL,'Razorpay TopUp (pay_SlJM4TlfyfQo5b)','DEPOSIT',7),(39,6500,'2026-05-05 10:59:23.986416',NULL,'Razorpay TopUp (pay_SlesFuaMc1iNhA)','DEPOSIT',8),(40,2565,'2026-05-05 11:02:18.182939',60,'Order payment','WITHDRAW',7),(41,2435,'2026-05-05 11:04:03.067847',NULL,'Withdrawal','WITHDRAW',7),(42,2565,'2026-05-05 11:30:27.755348',61,'Order payment','WITHDRAW',8),(43,3935,'2026-05-05 11:31:12.225017',NULL,'Withdrawal','WITHDRAW',8),(44,6500,'2026-05-05 11:31:55.255569',NULL,'Razorpay TopUp (pay_SlfQbVLSLWkyBv)','DEPOSIT',8),(45,3818,'2026-05-09 07:00:33.270385',66,'Order cancellation refund','REFUND',5),(46,72,'2026-05-11 09:40:16.063153',NULL,'Razorpay TopUp (pay_So0jcz6GPunhEv)','DEPOSIT',5),(47,2619,'2026-05-11 10:10:07.520683',67,'Order payment','WITHDRAW',5);
/*!40000 ALTER TABLE `statements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallets` (
  `wallet_id` int NOT NULL AUTO_INCREMENT,
  `current_balance` double DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`wallet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
INSERT INTO `wallets` VALUES (1,2,1),(2,8000,8),(3,500,10),(4,7500,9),(5,1271,4),(6,0,19),(7,0,20),(8,6500,21);
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'booknest_wallet'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-14 11:10:04
