-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: booknest_order
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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `flat_number` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Bhopal','12A','Ritesh Thakre','9876543210','462001','Madhya Pradesh'),(2,'Bhopal','12A','Ritesh Thakre','9876543210','462001','Madhya Pradesh'),(3,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh00','9131993514','262022','Madhya Pradesh'),(4,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Admin','9131993514','262022','Madhya Pradesh'),(5,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Admin','9131993514','262022','Madhya Pradesh'),(6,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Admin','9131993514','262022','Madhya Pradesh'),(7,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','rajaa','9131993514','262022','Madhya Pradesh'),(8,'Tirodi','Tirodi','Ritesh Thakrer','8602219154','481449','Madhya Pradesh'),(9,'','','Ritesh Thakre','9131993514','',''),(10,'','','Ritesh Thakrer','8602219154','',''),(11,'','','Ritesh Thakrer','8602219154','',''),(12,'','','rajaa','9131993514','',''),(13,'','','Admin','9131993514','',''),(14,'','','Ritesh Thakrer','8602219154','',''),(15,'Tirodi','Tirodi','Admin','9131993514','481449','Madhya Pradesh'),(16,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakrer','8602219154','262022','Madhya Pradesh'),(17,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakrer','8602219154','262022','Madhya Pradesh'),(18,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','rajaa','9131993514','262022','Madhya Pradesh'),(19,'Bhopal','LIG 221, Sonagiri sector A, Piplani','Admin','9131993514','462022','Madhya Pradesh'),(20,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Admin','9131993514','262022','Madhya Pradesh'),(21,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Admin','9131993514','262022','Madhya Pradesh'),(22,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','rajaa','9131993514','262022','Madhya Pradesh'),(23,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakrer','8602219154','262022','Madhya Pradesh'),(24,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Admin','9131993514','262022','Madhya Pradesh'),(25,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Admin','9131993514','262022','Madhya Pradesh'),(26,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Admin','9131993514','262022','Madhya Pradesh'),(27,'Bhopal','LIG 221, Sonagiri sector A, Piplani','rajaa','9131993514','462022','Madhya Pradesh'),(28,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','rajaa','9131993514','262022','Madhya Pradesh'),(29,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','rajaa','9131993514','262022','Madhya Pradesh'),(30,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','rajaa','9131993514','262022','Madhya Pradesh'),(31,'Bhopal','LIG 221, Sonagiri sector A, Piplani','rajaa','9131993514','262022','Madhya Pradesh'),(32,'Bhopal','LIG 221, Sonagiri sector A, Piplani','rajaa','9131993514','262022','Madhya Pradesh'),(33,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','rajaa','9131993514','262022','Madhya Pradesh'),(34,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Admin','9131993514','262022','Madhya Pradesh'),(35,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Admin','9131993514','262022','Madhya Pradesh'),(36,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Admin','9131993514','262022','Madhya Pradesh'),(37,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Admin','9131993514','262022','Madhya Pradesh'),(38,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Admin','9131993514','262022','Madhya Pradesh'),(39,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Admin','9131993514','262022','Madhya Pradesh'),(40,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','262022','Madhya Pradesh'),(41,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','262022','Madhya Pradesh'),(42,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','262022','Madhya Pradesh'),(43,'Bhopal','LIG 221, Sonagiri sector A, Piplani','Ritesh Thakre','9131993514','462022','Madhya Pradesh'),(44,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','262022','Madhya Pradesh'),(45,'Tirodi','Tirodi','Ritesh Thakre','9131993514','481449','Madhya Pradesh'),(46,'Bhopal','LIG 221, Sonagiri sector A, Piplani','Ritesh Thakre','9131993514','262022','Madhya Pradesh'),(47,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','262022','Madhya Pradesh'),(48,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','262022','Madhya Pradesh'),(49,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','262022','Madhya Pradesh'),(50,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','262022','Madhya Pradesh'),(51,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','262022','Madhya Pradesh'),(52,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','262022','Madhya Pradesh'),(53,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','262022','Madhya Pradesh'),(54,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','262022','Madhya Pradesh'),(55,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','462022','Madhya Pradesh'),(56,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','462022','Madhya Pradesh'),(57,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','262022','Madhya Pradesh'),(58,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','262022','Madhya Pradesh'),(59,'Bhopal','piplani lig 221','Swap','9131993514','462022','Madhya Pradesh'),(60,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','462022','Madhya Pradesh'),(61,'Bhopal','ppp','Swap','9131993514','262022','Madhya Pradesh'),(62,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','262022','Madhya Pradesh'),(63,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','262022','Madhya Pradesh'),(64,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','262022','Madhya Pradesh'),(65,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','262022','Madhya Pradesh'),(66,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','262022','Madhya Pradesh'),(67,'Bhopal','Piplani petrol pump, Sonagiri sector A, LIG 221, near Milkha Singh garden','Ritesh Thakre','9131993514','462022','Madhya Pradesh');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `amount_paid` double DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `mode_of_payment` varchar(255) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK8jm5yqj0fhbl1qp9i1loqhc5w` (`customer_id`),
  CONSTRAINT `FK8jm5yqj0fhbl1qp9i1loqhc5w` FOREIGN KEY (`customer_id`) REFERENCES `addresses` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2,1198,1,'Clean Code Updated','COD','2026-04-27',NULL,2,1,2),(3,1198,1,'Clean Code Updated','COD','2026-04-29','SHIPPED',2,8,3),(4,899,4,'Spider man','WALLET','2026-04-30','SHIPPED',1,9,4),(5,899,4,'Spider man','COD','2026-04-30','CONFIRMED',1,9,5),(6,1798,4,'Spider man','COD','2026-04-30','DELIVERED',2,9,6),(7,1798,4,'Spider man','WALLET','2026-04-30','CANCELLED',2,10,7),(8,1200,1,'codeX','COD','2026-04-30','CANCELLED',2,11,8),(9,899,4,'Spider man','COD','2026-04-30','CANCELLED',1,4,9),(10,899,4,'Spider man','COD','2026-04-30','CANCELLED',1,11,10),(11,1798,4,'Spider man','COD','2026-04-30','PLACED',2,11,11),(12,1798,4,'Spider man','COD','2026-04-30','PLACED',2,10,12),(13,1000,1,'Iron Man','COD','2026-04-30','DELIVERED',1,9,13),(14,899,4,'Spider man','COD','2026-04-30','PLACED',1,11,14),(15,31465,4,'Spider man','COD','2026-04-30','PLACED',35,9,15),(16,8990,4,'Spider man','COD','2026-04-30','PLACED',10,11,16),(17,122,5,'ss','COD','2026-04-30','DELIVERED',1,11,17),(18,3000,1,'Iron Man','COD','2026-04-30','PLACED',3,10,18),(19,121,6,'ok','COD','2026-04-30','PLACED',1,9,19),(20,3000,1,'Iron Man','COD','2026-04-30','PLACED',3,9,20),(21,3000,1,'Iron Man','WALLET','2026-04-30','CONFIRMED',3,9,21),(22,1000,1,'Iron Man','WALLET','2026-04-30','CONFIRMED',1,10,22),(23,244,5,'ss','COD','2026-04-30','PLACED',2,11,23),(24,1848,10,'The Amazing Spider-Man Vol. 2: The Sinister Six','COD','2026-04-30','PLACED',2,9,24),(25,17460,9,'Spider-Man: Kraven\'s Last Hunt','COD','2026-04-30','DELIVERED',20,9,25),(26,18480,10,'The Amazing Spider-Man Vol. 2: The Sinister Six','COD','2026-04-30','DELIVERED',20,9,26),(27,1786,11,'The Avengers Vol. 1: The Coming of the Avengers','COD','2026-05-02','CONFIRMED',2,10,27),(28,9690,14,'DC Versus Marvel Omnibus','COD','2026-05-02','DELIVERED',1,10,28),(29,2012,15,'Secret Wars 2016','WALLET','2026-05-02','SHIPPED',1,10,29),(30,2012,15,'Secret Wars 2016','COD','2026-05-02','SHIPPED',1,10,30),(31,924,10,'The Amazing Spider-Man Vol. 2: The Sinister Six','COD','2026-05-02','CANCELLED',1,10,31),(32,1663,13,'Ultimate Spider-Man by Jonathan Hickman Vol. 1: Married With Children','COD','2026-05-02','CANCELLED',1,10,32),(33,9690,14,'DC Versus Marvel Omnibus','WALLET','2026-05-02','CANCELLED',1,10,33),(34,24064,22,'Marvel Comics Library: Avengers. Vol. 1. 1963–1965','COD','2026-05-02','DELIVERED',2,9,34),(35,31597,13,'Ultimate Spider-Man by Jonathan Hickman Vol. 1: Married With Children','COD','2026-05-02','CANCELLED',19,9,35),(36,359800,25,'Marvel Comics Library: Spider-Man. Vol. 2. 1965–1966','COD','2026-05-02','CANCELLED',20,9,36),(37,16074,11,'The Avengers Vol. 1: The Coming of the Avengers','COD','2026-05-02','CANCELLED',18,9,37),(38,2012,15,'Secret Wars 2016','WALLET','2026-05-02','CANCELLED',1,9,38),(39,4989,13,'Ultimate Spider-Man by Jonathan Hickman Vol. 1: Married With Children','COD','2026-05-02','CANCELLED',3,9,39),(40,7719,16,'Secret Wars: Battleworld Omnibus Vol. 2','WALLET','2026-05-03','PLACED',1,4,40),(41,7719,16,'Secret Wars: Battleworld Omnibus Vol. 2','RAZORPAY','2026-05-03','PLACED',1,4,41),(42,7719,16,'Secret Wars: Battleworld Omnibus Vol. 2','RAZORPAY','2026-05-03','PLACED',1,4,42),(43,7719,16,'Secret Wars: Battleworld Omnibus Vol. 2','RAZORPAY','2026-05-03','PLACED',1,4,43),(44,7719,16,'Secret Wars: Battleworld Omnibus Vol. 2','RAZORPAY','2026-05-03','PLACED',1,4,44),(45,7719,16,'Secret Wars: Battleworld Omnibus Vol. 2','RAZORPAY','2026-05-03','PLACED',1,4,45),(46,7719,16,'Secret Wars: Battleworld Omnibus Vol. 2','COD','2026-05-03','PLACED',1,4,46),(47,9690,14,'DC Versus Marvel Omnibus','RAZORPAY','2026-05-03','CONFIRMED',1,4,47),(48,873,9,'Spider-Man: Kraven\'s Last Hunt','RAZORPAY','2026-05-03','CONFIRMED',1,4,48),(49,10465,12,'X-Factor: The Original X-Men Omnibus Vol. 2','WALLET','2026-05-03','CONFIRMED',1,4,49),(50,2012,15,'Secret Wars 2016','RAZORPAY','2026-05-04','CONFIRMED',1,4,50),(51,9690,14,'DC Versus Marvel Omnibus','WALLET','2026-05-04','PLACED',1,4,51),(52,9690,14,'DC Versus Marvel Omnibus','RAZORPAY','2026-05-04','DELIVERED',1,4,52),(53,10465,12,'X-Factor: The Original X-Men Omnibus Vol. 2','RAZORPAY','2026-05-04','CANCELLED',1,20,53),(54,17990,25,'Marvel Comics Library: Spider-Man. Vol. 2. 1965–1966','RAZORPAY','2026-05-04','CONFIRMED',1,20,54),(55,10465,12,'X-Factor: The Original X-Men Omnibus Vol. 2','RAZORPAY','2026-05-04','CONFIRMED',1,20,55),(56,924,10,'The Amazing Spider-Man Vol. 2: The Sinister Six','WALLET','2026-05-04','CANCELLED',1,20,56),(57,2565,27,'Atomic Habits: An Easy & Proven Way to Build Good Habits & Break Bad Ones','COD','2026-05-05','DELIVERED',1,4,57),(58,9690,14,'DC Versus Marvel Omnibus','RAZORPAY','2026-05-05','CONFIRMED',1,4,58),(59,2565,27,'Atomic Habits: An Easy & Proven Way to Build Good Habits & Break Bad Ones','RAZORPAY','2026-05-05','DELIVERED',1,21,59),(60,2565,27,'Atomic Habits: An Easy & Proven Way to Build Good Habits & Break Bad Ones','WALLET','2026-05-05','CONFIRMED',1,20,60),(61,2565,27,'Atomic Habits: An Easy & Proven Way to Build Good Habits & Break Bad Ones','WALLET','2026-05-05','CONFIRMED',1,21,61),(62,450,37,'How to Talk to Anyone: 92 Little Tricks for Big Success in Relationships','COD','2026-05-06','PLACED',1,4,62),(63,4024,19,'Moon Knight By Lemire & Smallwood: The Complete Collection','RAZORPAY','2026-05-06','DELIVERED',2,4,63),(64,2565,27,'Atomic Habits: An Easy & Proven Way to Build Good Habits & Break Bad Ones','RAZORPAY','2026-05-08','DELIVERED',1,4,64),(65,3818,34,'Mahabharata: The Birth of Bhagavad Gita','WALLET','2026-05-09','PLACED',1,4,65),(66,3818,34,'Mahabharata: The Birth of Bhagavad Gita','RAZORPAY','2026-05-09','CANCELLED',1,4,66),(67,2619,9,'Spider-Man: Kraven\'s Last Hunt','WALLET','2026-05-11','CONFIRMED',3,4,67);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'booknest_order'
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
