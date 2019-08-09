CREATE DATABASE  IF NOT EXISTS `radio-station` /*!40100 DEFAULT CHARACTER SET gbk */;
USE `radio-station`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: radio-station
-- ------------------------------------------------------
-- Server version	5.5.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `usertable`
--

DROP TABLE IF EXISTS `usertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertable` (
  `userid` int(11) NOT NULL,
  `author` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `album` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `iscanuse` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `headimg` varchar(2083) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Category` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertable`
--

LOCK TABLES `usertable` WRITE;
/*!40000 ALTER TABLE `usertable` DISABLE KEYS */;
INSERT INTO `usertable` VALUES (10003,'郭德纲','郭德纲相声精选','false','郭德纲.png','相声'),(10004,'Eva','英语三分钟','true','英语三分钟.png','英语'),(10005,'阿哈东北','东北讲笑话','true','阿哈东北.jpg','笑话'),(10006,'大宇茶馆','话说明朝','false','话说明朝.png','历史'),(10007,'梨子','口语天天练','true','口语天天练.jpg','英语'),(10008,' 李峙','李峙的不老歌','true','李峙的不老歌.jpg','听歌'),(10009,'谢涛','听谢涛.秦汉','true','听谢涛 秦汉.jpg','历史'),(10010,'紫依','勿忘初心 不负流年','true','勿忘初心 不负流年  紫依.jpg','听歌'),(10011,'笑话事务所','笑话事务所','true','笑话事务所.png','笑话'),(10012,'岳云鹏','岳云鹏最新相声  相声','true','岳云鹏.png','相声'),(10032,'岩','我的专辑','true','wxc28aa3218c79e8f6.o6zAJs4i341ERP8FrVPBrIpVVqdw.P6fdRjdVZDO9ea6d8f98e1dfb466431cf3ceb876ced7.png\r\n','无');
/*!40000 ALTER TABLE `usertable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-18 19:27:51
