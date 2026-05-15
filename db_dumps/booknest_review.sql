-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: booknest_review
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
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `status` enum('APPROVED','PENDING','REJECTED') DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `verified_purchase` bit(1) DEFAULT NULL,
  `reviewer_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `idx_review_book` (`book_id`),
  KEY `idx_review_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,'good book','2026-04-29 00:10:28.261619',5,'APPROVED','2026-04-29 00:10:28.261619',8,_binary '\0',NULL),(2,3,'good','2026-04-29 21:33:41.059366',5,'APPROVED','2026-04-29 21:33:41.059366',9,_binary '\0',NULL),(3,1,'very good\n','2026-04-30 10:01:32.621209',5,'APPROVED','2026-04-30 10:01:32.621209',9,_binary '\0',NULL),(4,4,'superb','2026-04-30 10:06:32.387626',5,'APPROVED','2026-04-30 10:06:32.387626',10,_binary '\0',NULL),(5,6,'good','2026-04-30 12:55:05.176094',5,'APPROVED','2026-04-30 12:55:05.176094',9,_binary '\0',NULL),(6,10,'good','2026-04-30 15:21:35.942507',5,'APPROVED','2026-04-30 15:21:35.942507',11,_binary '\0',NULL),(8,10,'good','2026-04-30 16:21:43.700238',5,'APPROVED','2026-04-30 16:21:43.700238',9,_binary '\0',NULL),(10,22,'Test review\n','2026-05-01 23:21:47.357981',5,'APPROVED','2026-05-01 23:21:47.357981',9,_binary '\0',NULL),(11,11,'very nice book\n','2026-05-02 00:38:22.444998',5,'APPROVED','2026-05-02 00:38:22.444998',10,_binary '\0',NULL),(12,14,'good','2026-05-02 10:06:07.467271',5,'APPROVED','2026-05-02 10:06:07.467271',10,_binary '\0',NULL),(13,11,'good','2026-05-02 11:36:39.509389',4,'APPROVED','2026-05-02 11:36:39.509389',9,_binary '\0',NULL),(15,12,'good','2026-05-02 12:38:47.291474',5,'APPROVED','2026-05-02 12:38:47.291474',10,_binary '\0','rajaa'),(16,25,'amazing like the amazing spider man','2026-05-02 13:03:10.330521',5,'APPROVED','2026-05-02 13:03:10.330521',9,_binary '\0','Admin'),(17,34,'Jai shree krishna','2026-05-02 23:36:52.577720',5,'APPROVED','2026-05-02 23:36:52.577720',9,_binary '\0','Admin'),(18,9,'nice book','2026-05-03 18:49:06.939946',5,'APPROVED','2026-05-03 18:49:17.686423',4,_binary '\0','Ritesh Thakre'),(19,12,'goood','2026-05-04 13:45:57.707258',5,'APPROVED','2026-05-04 13:45:57.707258',20,_binary '\0','Ritesh Thakre'),(20,27,'nice book\n','2026-05-05 04:41:08.838447',5,'APPROVED','2026-05-05 04:41:20.988815',4,_binary '\0','Ritesh Thakre');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'booknest_review'
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
