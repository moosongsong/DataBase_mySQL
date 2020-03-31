-- MySQL dump 10.16  Distrib 10.1.43-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: example
-- ------------------------------------------------------
-- Server version	10.1.43-MariaDB-0ubuntu0.18.04.1

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_code` char(4) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('ACTI','액션'),('COME','코미디'),('FANT','판타지'),('ROME','로멘스'),('SFST','SF'),('THRI','스릴러');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comics`
--

DROP TABLE IF EXISTS `comics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `category_code` char(4) NOT NULL,
  `publisher_code` char(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_code` (`category_code`),
  KEY `publisher_code` (`publisher_code`),
  CONSTRAINT `comics_ibfk_1` FOREIGN KEY (`category_code`) REFERENCES `category` (`category_code`) ON UPDATE CASCADE,
  CONSTRAINT `comics_ibfk_2` FOREIGN KEY (`publisher_code`) REFERENCES `publisher` (`publisher_code`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comics`
--

LOCK TABLES `comics` WRITE;
/*!40000 ALTER TABLE `comics` DISABLE KEYS */;
INSERT INTO `comics` VALUES (1,'전생했더니 슬라임이었던 건에 대하여',15000,'FANT','GODN'),(2,'성계의 전기',18000,'SFST','MITS'),(3,'엔젤비트',17000,'THRI','MITS'),(4,'고블린 슬레이어',15000,'ACTI','TIAR'),(6,'해와 환상의 그림갈',16000,'FANT','HUNI'),(7,'후르츠 바스켓',13000,'ROME','HUNI'),(8,'슬레이어즈',14000,'FANT','MITS'),(9,'플래스틱 메모리즈',18000,'ROME','GODN'),(10,'XXX HOLIC',12000,'FANT','GODN'),(11,'化物語',19000,'FANT','MITS'),(12,'충사',15000,'FANT','TIAR'),(13,'학생회 임원들',17000,'COME','MITS'),(14,'풀 메탈 패닉',13000,'SFST','HUNI'),(15,'카우보이 비밥',12000,'SFST','GODN'),(16,'인류는 쇠퇴했습니다.',13000,'FANT','HUNI'),(17,'이브의 시간',19000,'SFST','TIAR'),(18,'이것은 좀비 입니까?',19000,'COME','GODN'),(19,'요르문간드',17000,'ACTI','HUNI'),(20,'오타쿠에게 사랑은 어려워',18000,'ROME','GODN'),(21,'十二國記',11000,'FANT','GODN'),(22,'블랙라군',15000,'ACTI','MITS'),(23,'마오유우 마왕용사',14000,'FANT','TIAR'),(24,'던전에서 만남을 추구하면 안 되는 걸까?',16000,'FANT','REGI'),(25,'나츠메 우인장',14000,'FANT','HUNI'),(26,'늑대와 향신료',14000,'FANT','HUNI'),(27,'학원묵시록',17000,'ACTI','REGI');
/*!40000 ALTER TABLE `comics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comics_to_tags`
--

DROP TABLE IF EXISTS `comics_to_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comics_to_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comics_id` int(10) unsigned NOT NULL,
  `tags_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comics_id` (`comics_id`),
  KEY `tags_id` (`tags_id`),
  CONSTRAINT `comics_to_tags_ibfk_1` FOREIGN KEY (`comics_id`) REFERENCES `comics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comics_to_tags_ibfk_2` FOREIGN KEY (`tags_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comics_to_tags`
--

LOCK TABLES `comics_to_tags` WRITE;
/*!40000 ALTER TABLE `comics_to_tags` DISABLE KEYS */;
INSERT INTO `comics_to_tags` VALUES (1,1,4),(2,1,8),(3,2,3),(4,2,5),(5,3,1),(6,3,4),(7,3,9),(8,4,5),(9,4,8),(13,6,5),(14,6,8),(15,7,1),(16,7,9),(17,8,2),(18,8,8),(19,8,10),(20,9,1),(21,9,9),(22,10,8),(23,11,8),(24,12,8),(25,13,7),(26,13,11),(27,14,5),(28,14,10),(29,14,12),(30,15,3),(31,15,10),(32,16,8),(33,18,8),(34,18,13),(35,19,5),(36,19,10),(37,20,1),(38,20,9),(39,21,8),(40,21,13),(41,22,10),(42,23,1),(43,23,8),(44,24,8),(45,27,6),(46,27,10),(47,27,11);
/*!40000 ALTER TABLE `comics_to_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `member_id` varchar(20) NOT NULL,
  `member_name` varchar(200) NOT NULL,
  `member_email` varchar(50) NOT NULL,
  `member_password` char(32) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES ('edison','에디슨','edison@naver.com','81dc9bdb52d04dc20036dbd8313ed055'),('gildong','홍길동','gildong@naver.com','81dc9bdb52d04dc20036dbd8313ed055'),('sato','변사또','mrbyun@google.com','81dc9bdb52d04dc20036dbd8313ed055'),('simchung','심청이','chung@google.com','81dc9bdb52d04dc20036dbd8313ed055'),('sunsin','이순신','turtlelee@naver.com','81dc9bdb52d04dc20036dbd8313ed055');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher` (
  `publisher_code` char(4) NOT NULL,
  `publisher_name` varchar(100) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `fax` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`publisher_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES ('GODN','고단샤문고','032-658-7485','032-698-7458'),('HUNI','허니문고','02-341-3247','02-4544-6342'),('MITS','미츠네코문고','032-4343-9898','032-4343-7685'),('REGI','레진코믹스','02-6945-5965','02-9484-4495'),('TIAR','티아라문고','02-343-2234','02-3444-5345');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comics_id` int(10) unsigned NOT NULL,
  `rating_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rating_count` int(10) unsigned NOT NULL,
  `rating_price` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,6,'2020-03-22 11:30:24',5,16000),(2,1,'2020-03-22 12:12:39',8,15000),(3,8,'2020-03-23 11:00:23',2,18000),(4,14,'2020-03-23 12:34:21',9,14000),(5,24,'2020-03-23 15:45:33',10,16000),(6,27,'2020-03-24 10:03:34',12,17000),(7,15,'2020-03-24 11:39:32',4,12000),(8,22,'2020-03-24 12:54:56',6,15000),(9,11,'2020-03-25 11:44:34',2,19000),(10,18,'2020-03-25 12:39:22',9,19000),(11,4,'2020-03-25 13:23:22',3,15000),(12,2,'2020-03-26 09:15:41',9,18000),(13,3,'2020-03-26 10:36:11',4,17000),(14,13,'2020-03-27 11:22:01',10,17000),(15,18,'2020-03-27 12:05:54',2,19000),(16,17,'2020-03-27 13:00:24',3,19000);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'로멘스'),(2,'마법사'),(3,'우주'),(4,'전생'),(5,'전쟁'),(6,'좀비'),(7,'코미디'),(8,'판타지'),(9,'행복'),(10,'액션'),(11,'학원'),(12,'메카닉'),(13,'이세계');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-31 16:43:42
