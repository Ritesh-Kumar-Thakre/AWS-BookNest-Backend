-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: booknest_auth
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `mobile` bigint NOT NULL,
  `pass_word_hash` varchar(255) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `role` enum('ADMIN','CUSTOMER','SELLER') DEFAULT NULL,
  `profile_image_url` varchar(255) DEFAULT NULL,
  `address_city` varchar(255) DEFAULT NULL,
  `address_pincode` varchar(255) DEFAULT NULL,
  `address_state` varchar(255) DEFAULT NULL,
  `address_street` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'2026-04-25 15:14:12.676999','anabel404@gmail.com','ana bel',8999422433,'$2a$10$zv.hC4gnjztyRkkn/2p1EOIC4./ALbCjyCLKfP83MzikIHvrVsvyW','local','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(4,'2026-04-28 16:08:09.140785','riteshthakre976@gmail.com','Ritesh Thakre',9131993514,'$2a$10$u./nfOjxQlQ.6wuYSD191urZYbh7v/XcNtb427w/tjtfLFM53NWsG','local','ADMIN','/auth/uploads/283934ac-7e72-42ba-8657-5aef821370d3.JPG','Bhopal','462022','Madhya Pradesh','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden'),(5,'2026-04-28 16:10:42.274633','ritesh@gmail.com','Ritesh Thakre',9131993514,'$2a$10$sQ8xdmZc9.wDTkFfZXfr2OH5QqUgad8NGP0xnjo5llS3MVHAUramC','local','SELLER',NULL,NULL,NULL,NULL,NULL),(6,'2026-04-28 16:27:09.288775','123@gmail.com','Ritesh Thakre',9131993514,'$2a$10$L/bChWHXqR2BW9Nr8fNqUebBjn1FpVao9EgujCPOXm1bRepK9B7wG','local','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(7,'2026-04-28 16:33:00.562596','RR@gmail.com','Ritesh Thakre',9131993514,'$2a$10$SyW0kTbntPeGivru/oPQEeH1pOfjMiGDbUXLdjAWOah3o6PHFN2xi','local','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(8,'2026-04-28 23:42:24.544060','pk@gmail.com','Ritesh004',9131993514,'$2a$10$/7fW47pvo3p44iCpu6oPCeRMAPSevMjXw9YVo2OkZcPvu0CFyvDPi','local','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(9,'2026-04-29 00:42:23.002196','admin@gmail.com','Admin',9131993514,'$2a$10$vP1coxdo1GV3EFTgGlDTk.etWKXWUPBGvA0c0ca5Bq02NbfcjnlLC','local','ADMIN','/auth/uploads/72ab2748-d23e-425f-866e-fb61f9c7975d.png',NULL,NULL,NULL,NULL),(10,'2026-04-29 22:02:45.090760','raja@gmail.com','rajaa',9131993514,'$2a$10$SvUmbaPvL5dajzJYIxQUXe1UqqKUnj5wQg5jrc/PHU2xhb2jAd9Ii','local','CUSTOMER','/auth/uploads/6549f274-7f7d-452d-8e29-a1b1ec26cb7f.JPG',NULL,NULL,NULL,NULL),(11,'2026-04-29 23:21:27.562684','raju@gmail.com','Ritesh Thakre',8602219154,'$2a$10$mHcaJx5CJaXoRqkzECEUZO7q/MxZaq8Cm79WG1QXWuZuA4M6NDd72','local','SELLER','/auth/uploads/0bdbecea-d33d-489e-9116-89fce964a722.JPG',NULL,NULL,NULL,NULL),(12,'2026-05-04 06:09:31.362274','976@gmal.com','Ritesh Thakre',8602219154,'$2a$10$HRZZRYL0dAaLp8w8gevpDeJmx3afXL0e/mUPH.1qupdGb9CVrGnxG','local','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(13,'2026-05-04 06:17:43.958401','1212@gmal.com','Ritesh Thakre',8602219154,'$2a$10$scHDyVTV/Ob/vYBz8CNQ8O.WjaKm1XJJG40d4GWAQkNVxjV.dtFo.','local','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(14,'2026-05-04 06:18:22.388537','976@gmalk.com','Ritesh Thakre',9131993514,'$2a$10$RKmskd749ak/2SFSJKHjBOcc1bPlc5M0W4zHZVm0jsoc0w8L1J.p6','local','SELLER',NULL,NULL,NULL,NULL,NULL),(15,'2026-05-04 06:28:56.893131','123@gail.com','Ritesh Thakre',9131993514,'$2a$10$eqjM1ywC/2yTS1jRIyoMNO0bHp85YTnCqC6lDDDDdNZCcgiXNf9SK','local','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(16,'2026-05-04 06:58:01.483647','riteshthakre976@ail.com','Ritesh Thakre',8602219154,'$2a$10$hRkJ8Cr1Y0D.DcZMl4uLS.oF8m2XjbgpqQ2Z9u2/GTU8gVALU6JiW','local','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(17,'2026-05-04 07:16:58.967763','riteshthakre976@gail.com','Ritesh Thakre',9131993514,'$2a$10$OSnK18SuzwwENiRgdCSF5.As8ZmHj1UaTqe.rofWBDhLGqQI4fS6K','local','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(18,'2026-05-04 07:17:30.155796','976@gmil.cm','Ritesh Thakre',8602219154,'$2a$10$hF2VeI6JZRPTy0QYjcuIL.RZFSfJWQFUx81Z4039BXoQ28WeoVBgG','local','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(19,'2026-05-04 08:27:01.287545','ok@gmail.com','Ritesh Thakre',9131993514,'$2a$10$NcveXQz09F0cZHBf3zGETO4K5rX4znHeKczE1Sh028fwS7R4MWnIK','local','SELLER',NULL,NULL,NULL,NULL,NULL),(20,'2026-05-04 09:36:47.882513','riteshthakre2004@gmail.com','Ritesh Thakre',9131993514,'$2a$10$vJkQeFTMtO5zu0UnlYVqJuXjebh4NNgA5rbotTxEpQH/OoEO/X3B2','google','ADMIN','https://lh3.googleusercontent.com/a/ACg8ocKQImj2nfEaO3FZRkYUZ2szoLvp3hTbsPGKg9qiYaNR7G8K-wA=s96-c','Bhopal','462022','Madhya Pradesh','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden'),(21,'2026-05-05 10:56:32.203115','swapnilchoudhary211@gmail.com','Swap',9131993514,'$2a$10$fmxeNaJwX3g6zxf5EZlteOB2DW7kZYOnGOLvBaXhgUI3dONTba3HG','local','CUSTOMER',NULL,NULL,NULL,NULL,NULL),(22,'2026-05-12 09:07:45.873657','tatiya112@gmail.com','tatiya bicchu',9131332433,'$2a$10$rH.dL.d4LabD2hFw8EPzAOuSIdvp6snQOi8uDl64yMKOU1QzwS3zK','local','CUSTOMER',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'booknest_auth'
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
