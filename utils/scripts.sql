-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: elearning
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `hash` varchar(1000) NOT NULL,
  `salt` varchar(100) NOT NULL,
  `createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `otp` char(6) DEFAULT NULL,
  `otpexpired` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`email`),
  KEY `accounts_users_fk` (`userid`),
  CONSTRAINT `accounts_users_fk` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (7,19,'hoangvietnguyen99@gmail.com','07a1e2afd2b669cd9ad8e645784f724c5dd5a17a9223db60020b9ed860d4b869e59bc74ad6a96e38bcd6abf05ff7dc30589576344481db8c52017264d199ee28','0fb20f1e763acc161b85cfcccbfa202a','2021-01-08 02:43:57','MyC5TP','2021-01-24 08:42:54'),(8,20,'ngovantai1999@gmail.com','3d825cce99f988afb780c7b96912ff49616ba6db6acf58a782a714ad2e5307437c6b31516bf2a3f96a793ea47d217b25c8918bb70674db142658f21d4b0c2368','76333bf121a8174fc5801d52fd299a79','2021-01-10 07:57:09',NULL,NULL),(9,21,'nhviet1712905@student.hcmus.edu.vn','74abbf7d1c2ee3a8e1dd0c537ae2022c25991f834edc754185d3151d26bebe193d0d53ae3081ddbeca42c942f739e236f004ab062a91a9aac48ea945f4e14be4','3e70054fec0de973a74ea6876adaa9bf','2021-01-12 01:34:08',NULL,NULL),(10,22,'vantai1@gmail.com','e6fef4f3d37c4548b44817e0bae484139914fa0df55922ed66ebaee9bbbd92af2738498bf72f1e2eae483eac65aebbcb7acce39018115103b65263c42ead70cc','d29e9e296bc35f1f0e914768c79153ff','2021-01-14 06:22:49',NULL,NULL),(11,23,'vantai@gmail.com','4086437a828a21a2e330f88d502c80a61ce26073046a214227d4166bf7ad379ceb5b9c898992f8a2bde68409f03ce91d919718f68551cf7cf3b83845a5709e40','addfe58b8f2c88d3e8a443cff057526d','2021-01-14 06:23:09',NULL,NULL),(12,24,'hoangvietnguyen99@hotmail.com','2ea213f7bb6a5a2f8730a6d9c147cb27f4f2f9d6be9bd246d91a367cd7c545b480d94a453aa7d6e71c858ed1e0832b436004b9acf1f87c737424ecdfc8a827fb','c30fe6d4ce2e74f5551ae4a39779c34c','2021-01-17 12:58:13','cvTSAS','2021-01-27 04:13:28'),(13,25,'1712905@student.hcmus.edu.vn','4200da98ad2e75b91ea1c016e0be913795f514079658a20ca70bfe928e95b5854d0a6f9c964259fe3b1bbb4bacd84f3e816c6362f9d7226f86f6ac7b958fe823','f9ebb5d325fa695d1f6cbecf7da9c1e0','2021-01-19 09:09:56','fVC0o0','2021-01-26 16:09:59'),(14,26,'nntrung0403@gmail.com','90305d0d24be45ecff3663b903af7863ba5898244d245624b8097851ea8ca1b38aa2192455c7030fd7636b5a60ff2089c32899173be742570ca2746ed2337ebc','75d0c5f97fff1020730050dbd0b0c7b8','2021-01-19 11:08:05','kepaYy','2021-01-26 18:08:03');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `discount` int DEFAULT NULL,
  `ispaid` tinyint DEFAULT '0',
  `paiddate` datetime DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `amount` bigint DEFAULT '0',
  `discountamount` bigint DEFAULT '0',
  `total` bigint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `carts_users_fk` (`userid`),
  CONSTRAINT `carts_users_fk` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (2,19,NULL,1,'2021-01-16 18:35:38',NULL,400000,0,400000),(3,20,NULL,1,'2021-01-13 13:08:03',NULL,1000000,0,1000000),(5,21,NULL,1,'2021-01-12 16:46:11',NULL,1300000,0,1300000),(6,21,NULL,1,'2021-01-12 20:03:45',NULL,350000,0,350000),(7,21,NULL,1,'2021-01-14 18:08:54',NULL,50000,0,50000),(8,20,NULL,1,'2021-01-14 11:48:22',NULL,50000,0,50000),(9,20,NULL,1,'2021-01-14 19:51:20',NULL,350000,0,350000),(10,22,NULL,0,NULL,NULL,0,0,0),(11,23,NULL,0,NULL,NULL,0,0,0),(12,21,NULL,1,'2021-01-14 19:08:34',NULL,100000,0,100000),(13,21,NULL,0,NULL,NULL,0,0,0),(14,20,NULL,1,'2021-01-19 19:34:59',NULL,100000,0,100000),(15,19,NULL,0,NULL,NULL,0,0,0),(16,24,NULL,1,'2021-01-19 15:18:43',NULL,150000,0,150000),(17,24,NULL,1,'2021-01-19 19:28:59',NULL,1000000,0,1000000),(18,25,NULL,1,'2021-01-19 22:53:35',NULL,1000000,0,1000000),(19,26,NULL,0,NULL,NULL,0,0,0),(20,24,NULL,1,'2021-01-19 21:41:46',NULL,100000,0,100000),(21,20,NULL,1,'2021-01-19 20:16:50',NULL,100000,0,100000),(22,20,NULL,1,'2021-01-20 10:01:53',NULL,100000,0,100000),(23,24,NULL,1,'2021-01-19 23:59:10',NULL,150000,0,150000),(24,25,NULL,1,'2021-01-20 09:56:44',NULL,100000,20000,80000),(25,24,NULL,1,'2021-01-20 04:14:33',NULL,200000,0,200000),(26,24,NULL,0,NULL,NULL,0,0,0),(27,25,NULL,1,'2021-01-20 11:04:49',NULL,1000000,0,1000000),(28,20,NULL,0,NULL,NULL,0,0,0),(29,25,NULL,0,NULL,NULL,0,0,0);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts_courses`
--

DROP TABLE IF EXISTS `carts_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts_courses` (
  `cartid` int NOT NULL,
  `courseid` int NOT NULL,
  PRIMARY KEY (`cartid`,`courseid`),
  KEY `carts_courses_fk_courses` (`courseid`),
  CONSTRAINT `carts_courses_fk_carts` FOREIGN KEY (`cartid`) REFERENCES `carts` (`id`),
  CONSTRAINT `carts_courses_fk_courses` FOREIGN KEY (`courseid`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts_courses`
--

LOCK TABLES `carts_courses` WRITE;
/*!40000 ALTER TABLE `carts_courses` DISABLE KEYS */;
INSERT INTO `carts_courses` VALUES (3,4),(5,4),(17,4),(18,4),(2,7),(5,7),(14,7),(20,7),(24,7),(5,8),(9,8),(25,8),(6,9),(21,9),(23,9),(20,10),(24,10),(8,11),(12,11),(23,11),(12,12),(6,13),(6,15),(7,16),(16,16),(2,17),(7,17),(2,21),(9,21),(16,21),(2,23),(22,23),(27,33);
/*!40000 ALTER TABLE `carts_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `idParent` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'IT',NULL),(2,'Cooking',NULL),(3,'Design',NULL),(8,'Kinh t???',NULL),(9,'L???p tr??nh web',1),(10,'L???p tr??nh di ?????ng',1),(11,'L???p tr??nh c?? b???n',1),(12,'Kinh t??? vi m??',8),(13,'Kinh t??? ?????i ngo???i',8);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_discount`
--

DROP TABLE IF EXISTS `course_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_discount` (
  `discountid` int NOT NULL,
  `courseid` int NOT NULL,
  PRIMARY KEY (`discountid`,`courseid`),
  KEY `course_discount_courses_fk` (`courseid`),
  CONSTRAINT `course_discount_courses_fk` FOREIGN KEY (`courseid`) REFERENCES `courses` (`id`),
  CONSTRAINT `course_discount_discounts_fk` FOREIGN KEY (`discountid`) REFERENCES `discounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_discount`
--

LOCK TABLES `course_discount` WRITE;
/*!40000 ALTER TABLE `course_discount` DISABLE KEYS */;
INSERT INTO `course_discount` VALUES (1,4),(1,7),(1,10),(1,11),(1,12),(1,16),(1,19),(1,20),(1,25);
/*!40000 ALTER TABLE `course_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `author` int NOT NULL,
  `uploaddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `lastupdatedat` datetime DEFAULT NULL,
  `description` text,
  `viewscount` int DEFAULT '0',
  `lessonscount` int DEFAULT '0',
  `getscount` int DEFAULT '0',
  `ratingscount` int DEFAULT '0',
  `rating` double DEFAULT '0',
  `statuscode` varchar(15) DEFAULT 'INCOMPLETE',
  `approvedby` int DEFAULT NULL,
  `price` bigint DEFAULT NULL,
  `commentscount` int DEFAULT '0',
  `imgpath` text,
  `tinydes` text,
  `currenlessonorder` int DEFAULT '1',
  `categoryId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_users_fk` (`author`),
  KEY `courses_users_fk2` (`approvedby`),
  KEY `courses_category_fk3_idx` (`categoryId`),
  FULLTEXT KEY `name` (`name`),
  FULLTEXT KEY `name_2` (`name`),
  CONSTRAINT `courses_users_fk` FOREIGN KEY (`author`) REFERENCES `users` (`id`),
  CONSTRAINT `courses_users_fk2` FOREIGN KEY (`approvedby`) REFERENCES `users` (`id`)
) /*!50100 TABLESPACE `innodb_system` */ ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (4,'MEAN stack 2',19,'2021-01-10 08:21:05','2021-01-20 10:25:38','<p><strong>This stack combines four technologies:<br /></strong></p>\r\n<ul>\r\n<li>MongoDB: NoSQL database</li>\r\n<li>Express: Nodejs backend framework</li>\r\n<li>Angular: Web application framework</li>\r\n<li>Node.js: runtime environment</li>\r\n</ul>',216,4,4,0,4.333333333333333,'INCOMPLETE',20,1000000,3,NULL,'Fullstack course web development with nodejs',5,1),(7,'L???p tr??nh Python c?? b???n',19,'2021-01-12 01:25:49','2021-01-20 00:55:45','<p>Th&ocirc;ng qua kh&oacute;a h???c L???P TR&Igrave;NH PYTHON C?? B???N, ch&uacute;ng t&ocirc;i s??? h?????ng d???n c&aacute;c b???n ki???n th???c c?? b???n c???a Python. ????? t??? ??&oacute;, c&oacute; ???????c n???n t???ng cho ph&eacute;p b???n ti???p t???c t&igrave;m hi???u nh???ng ki???n th???c tuy???t v???i kh&aacute;c c???a Python ho???c l&agrave; m???t ng&ocirc;n ng??? kh&aacute;c.</p>',215,3,5,1,5,'INCOMPLETE',20,100000,1,NULL,'Basic knowledge of Python programing language',3,1),(8,'L???p tr??nh H?????ng ?????i T?????ng v???i Python',19,'2021-01-12 01:25:49','2021-01-20 00:55:57','<p>??? kh&oacute;a h???c n&agrave;y, ch&uacute;ng t&ocirc;i s??? gi???i thi???u v???i c&aacute;c b???n nh???ng ki???n th???c c?? b???n v??? L???p tr&igrave;nh h?????ng ?????i t?????ng trong Python m???t c&aacute;ch d??? hi???u, t??? ??&oacute; b???n c&oacute; th??? ???ng d???ng ki???n th???c h?????ng ?????i t?????ng khi ti???p x&uacute;c v???i c&aacute;c framework, package c???a Python.</p>',6,0,3,0,0,'INCOMPLETE',20,200000,0,NULL,'Learn how to OOP with python',1,1),(9,'B??i to??n kinh ??i???n trong l???p tr??nh',19,'2021-01-12 01:25:50','2021-01-20 00:56:12','<p>Serial d&agrave;nh cho nh???ng b???n c???n luy???n t???p ph????ng ph&aacute;p, tu duy l???p tr&igrave;nh. L&agrave;m quen v???i c&aacute;c b&agrave;i to&aacute;n trong l???p tr&igrave;nh, ng???u nhi&ecirc;n&nbsp;t??? c?? b???n ?????n n&acirc;ng cao. N???i dung Serial n&agrave;y ???????c ph&acirc;n t&aacute;ch&nbsp;chi ti???t nh???t&nbsp;c&oacute; th???, nh???m gi&uacute;p c&aacute;c b???n&nbsp;d??? hi???u&nbsp;v&agrave;&nbsp;th???c h&agrave;nh ???????c ngay. Th???i l?????ng m???i video trung b&igrave;nh t???&nbsp;5 &ndash; 30p B???n n&ecirc;n t??? l&agrave;m l???i&nbsp;t???ng b&agrave;i t???p tr&ecirc;n&nbsp;video ????? c&oacute; k???t qu??? t???t nh???t.</p>',11,0,3,1,5,'INCOMPLETE',20,100000,1,NULL,'Some populer problems and solvings in programing',1,1),(10,'L???p tr??nh OOP v???i C#',19,'2021-01-12 01:25:51','2021-01-20 00:57:36','<p>Serial d&agrave;nh cho c&aacute;c b???n ch??a c&oacute; ki???n th???c v??? l???p tr&igrave;nh h?????ng ?????i t?????ng. Ho???c c???n c???ng c??? l???i l???p tr&igrave;nh h?????ng ?????i t?????ng trong C#. N???i dung serial ???????c ph&acirc;n t&iacute;ch chi ti???t nh???t c&oacute; th???, nh???m gi&uacute;p c&aacute;c b???n d??? hi???u v&agrave; th??c h&agrave;nh ngay ???????c. Th???i l?????ng m???i video trung b&igrave;nh c??? 5 - 30p</p>',43,0,2,1,5,'INCOMPLETE',20,0,1,NULL,'Learn how to OOP with C Sharp',1,1),(11,'L???p tr??nh game Flappy bird v???i unity3D',19,'2021-01-12 01:25:51','2021-01-20 01:00:00','<p>Serial h?????ng d???n l???p tr&igrave;nh game Flappy bird v???i Unity3D</p>',15,0,3,0,5,'INCOMPLETE',20,50000,1,NULL,'Make a simple game Flappy bird with Unity 3D',1,10),(12,'L???p tr??nh JavaFX C?? b???n',19,'2021-01-12 01:25:52','2021-01-20 01:00:35','<p>JavaFX&nbsp;l&agrave; m???t c&ocirc;ng ngh??? ph&aacute;t tri???n giao di???n m&aacute;y t&iacute;nh tr&ecirc;n n???n t???ng Java nh???m thay th??? c&ocirc;ng ngh??? c??&nbsp;Java Swing,&nbsp;Java AWT&nbsp;v???i nh???ng c???u tr&uacute;c v&agrave; c&aacute;ch vi???t d??? s??? d???ng, th&acirc;n thi???n v???i l???p tr&igrave;nh vi&ecirc;n nhi???u h??n Qua kho&aacute; h???c&nbsp;JavaFX C?? b???n, m&igrave;nh s??? cung c???p nh???ng ki???n th???c l???p tr&igrave;nh c?? b???n v??? thi???t k??? giao di???n ph???n m???m, gi&uacute;p c&aacute;c b???n c&oacute; th??? t???o ra nh???ng ph???n m???m ph???c v??? cho h???c t???p v&agrave; c&ocirc;ng vi???c Tham gia ??&oacute;ng g&oacute;p kh&oacute;a h???c c???ng ?????ng N???u b???n mu???n g???i ?????n c???ng ?????ng nh???ng kh&oacute;a h???c do ch&iacute;nh b???n/ team c???a b???n th???c hi???n.</p>',14,0,1,0,0,'INCOMPLETE',20,50000,0,NULL,'Simple desktop application with JAVA FX',1,1),(13,'L???p tr??nh ph???n m???m qu???n l?? kho WPF - MVVM',19,'2021-01-12 01:25:52','2021-01-20 01:01:02','<p>N???u b???n ??&atilde; t???ng r???t th&iacute;ch th&uacute; v???i vi???c t??? l&agrave;m d??? &aacute;n th???c t??? qua serial h?????ng d???n l???p tr&igrave;nh PH???N M???M QU???N L&Yacute; QU&Aacute;N C&Agrave; PH&Ecirc;&nbsp;b???ng Winform th&igrave; ch???ng c&oacute; l&yacute; do g&igrave; ????? kh&ocirc;ng ti???p t???c n&acirc;ng cao kinh nghi???m c&aacute; nh&acirc;n v???i serial l???p tr&igrave;nh&nbsp;Ph???n m???m qu???n l&yacute; kho WPF &ndash; MVVM. Serial Ph???n m???m qu???n l&yacute; kho s??? d???ng c&ocirc;ng ngh???&nbsp;WPF&nbsp;c&ugrave;ng v???i m&ocirc; h&igrave;nh&nbsp;MVVM, s??? d???ng&nbsp;entity&nbsp;framework v&agrave; theme giao di???n c???a WPF Material design,... c&ugrave;ng r???t nhi???u k??? thu???t, kinh nghi???m kh&aacute;c. Kh&ocirc;ng c&oacute; g&igrave; tuy???t v???i h??n l&agrave; luy???n t???p v???i d??? &aacute;n th???c t???. N&agrave;o c&ugrave;ng nhau th??? th&aacute;ch b???n th&acirc;n v???i&nbsp;ph???n m???m Qu???n l&yacute; kho WPF &ndash; MVVM.</p>',1,0,1,0,0,'INCOMPLETE',20,200000,0,NULL,'Develop a software to manage a coffee shop with WPF',1,1),(14,'Kho?? h???c l???p tr??nh C# n??ng cao',19,'2021-01-12 01:25:53','2021-01-14 19:04:30','<p>B???n nghe n&oacute;i m&atilde;i v??? .NET nh??ng v???n th???c m???c n&oacute; c&oacute; g&igrave; hay ho b&ecirc;n trong ??&oacute;? Hay ????n gi???n b???n vi???t mu???n 1 ??o???n code c???c k??? nguy hi???m khi???n ng?????i kh&aacute;c khi nh&igrave;n v&agrave;o ph???i th???t l&ecirc;n: &ldquo;???!!!......... Tr??? tr&acirc;u&hellip;&rdquo; Kho&aacute; h???c l???n n&agrave;y s??? gi&uacute;p b???n gi???i ??&aacute;p nh???ng th???c m???c tr&ecirc;n. Ch&agrave;o m???ng c&aacute;c b???n ??&atilde; ?????n v???i kho&aacute; h???c&nbsp;L???p tr&igrave;nh C# n&acirc;ng cao</p>',3,0,0,0,0,'INCOMPLETE',20,50000,0,NULL,'Advanced C++',1,1),(15,'L???p tr??nh Java c?? b???n ?????n h?????ng ?????i t?????ng',19,'2021-01-12 01:25:53','2021-01-14 19:04:43','<p>V???i m???c ??&iacute;ch gi???i thi???u ?????n m???i ng?????i&nbsp;v&ecirc;??&nbsp;Ng&ocirc;n ng???? Java&nbsp;-&nbsp; m???t ng&ocirc;n ng??? l???p tr&igrave;nh kh&aacute; m???i m??? so v???i C, C++, Java, PHP ??? Vi???t Nam. Th&ocirc;ng qua kh&oacute;a h???c&nbsp;L???P TR&Igrave;NH JAVA C?? BA??N ?????N H?????NG ?????I T?????NG, m&igrave;nh s??? h?????ng d???n c&aacute;c b???n ki???n th???c c?? b???n c???a Java. ????? t??? ??&oacute;,&nbsp;c&oacute; ???????c n???n t???ng cho ph&eacute;p b???n ti???p t???c t&igrave;m hi???u nh???ng ki???n th???c tuy???t v???i kh&aacute;c c???a Java ho???c l&agrave; m???t ng&ocirc;n ng??? kh&aacute;c. C??? th??? trong kh&oacute;a h???c n&agrave;y, m&igrave;nh s??? gi???i thi???u v???i c&aacute;c b???n&nbsp;Java&nbsp;??? phi&ecirc;n b???n&nbsp;Java 8 Tham gia ??&oacute;ng g&oacute;p kh&oacute;a h???c c???ng ?????ng N???u b???n mu???n g???i ?????n c???ng ?????ng nh???ng kh&oacute;a h???c do ch&iacute;nh b???n/ team c???a b???n th???c hi???n.</p>',0,0,1,0,0,'INCOMPLETE',20,50000,0,NULL,'Java from zeoro to hero',1,1),(16,'Kh??a h???c l???p tr??nh C++ c??n b???n',19,'2021-01-12 01:25:54','2021-01-20 01:01:24','<p>Hi???n nay,&nbsp;C++&nbsp;??&atilde; l&agrave; c&aacute;i t&ecirc;n r???t quen thu???c trong ng&agrave;nh l???p tr&igrave;nh. M???c d&ugrave; C++ l&agrave; ng&ocirc;n ng??? l???p tr&igrave;nh ??&atilde; ra ?????i kh&aacute; l&acirc;u, nh??ng kh&ocirc;ng ph???i ai c??ng c&oacute; c?? h???i ????? t&igrave;m hi???u v??? n&oacute;. V&igrave; v???y,&nbsp;m&igrave;nh&nbsp;??&atilde; x&acirc;y d???ng l&ecirc;n kh&oacute;a h???c&nbsp;L???P TR&Igrave;NH C++ C??N B???N&nbsp;????? cung c???p m???t l?????ng ki???n th???c v??? ng&ocirc;n ng??? C++ n&oacute;i ri&ecirc;ng, v&agrave; c&aacute;c kh&aacute;i ni???m kh&aacute;c trong l???p tr&igrave;nh n&oacute;i chung. N???i dung kh&oacute;a h???c s??? ???????c ph&acirc;n t&aacute;ch m???t c&aacute;ch chi ti???t, nh???m gi&uacute;p c&aacute;c b???n d??? hi???u v&agrave; th???c h&agrave;nh ???????c ngay.</p>',7,0,2,0,0,'INCOMPLETE',20,0,0,NULL,'Basic C++',1,1),(17,'L???p tr??nh Doge game v???i Unity3D',19,'2021-01-12 01:25:54','2021-01-20 01:01:41','<p>Serial h?????ng d???n l???p tr&igrave;nh Doge game v???i Unity3D</p>',11,0,2,0,0,'INCOMPLETE',20,50000,0,NULL,'Develop Doge game with Unity 3D and C Sharp',1,10),(18,'S??? d???ng SQL server',19,'2021-01-12 01:25:54','2021-01-20 01:02:00','<p>V???i h??? th???ng nh???, ch&uacute;ng ta ho&agrave;n to&agrave;n c&oacute; th??? l??u tr??? d??? li???u b???ng file ????? khi t???t ???ng d???ng d??? li???u ch&uacute;ng ta v???n c&ograve;n ???????c l??u gi???. Nh??ng v???i h??? th???ng l???n, truy v???n t&igrave;m ki???m, thao t&aacute;c v???i d??? li???u tr&ecirc;n file kh&ocirc;ng c&ograve;n d??? d&agrave;ng v&agrave; hi???u qu??? n???a. V&agrave; SQL ra ?????i ????? gi???i quy???t v???n ????? ??&oacute;. Ch&uacute;ng ta c&ugrave;ng nhau t&igrave;m hi???u v??? SQL v&agrave; SQL Server th&ocirc;ng qua serial H?????NG D???N S??? D???NG SQL SERVER nh&eacute;!</p>',4,0,0,0,0,'INCOMPLETE',20,0,0,NULL,'Basic using of SQL Server',1,1),(19,'L???p tr??nh game Zombie Hunter v???i Unity3D',19,'2021-01-12 01:25:55','2021-01-20 01:02:38','<p>Serial h?????ng d???n l???p tr&igrave;nh game Zombie Hunter v???i Unity3D</p>',2,0,0,0,0,'INCOMPLETE',20,300000,0,NULL,'Develop Zombie Hunter game with Unity 3D from scatch',1,10),(20,'L???p tr??nh WPF c?? b???n',19,'2021-01-12 01:25:55','2021-01-20 01:02:56','<p>Serial d&agrave;nh cho nh???ng b???n ??&atilde; bi???t&nbsp;v???&nbsp;l???p tr&igrave;nh Winform&nbsp;v&agrave; mu???n h???c ti???p m???t ng&ocirc;n ng??? m???nh v&agrave; hi???u qu??? h??n c??? Winform. ??&oacute; l&agrave; WPF v???i c?? ch??? v??? ???nh Vector thay cho Bitmap c???a Winform. C?? ch??? Binding v&agrave; ng&ocirc;n ng??? XAML ????? gi&uacute;p cho designer v&agrave; developer c&oacute; th??? l&agrave;m vi???c ?????c l???p m&agrave; v???n h??? tr??? nhau.&nbsp;N???i dung Serial n&agrave;y ???????c ph&acirc;n t&aacute;ch&nbsp;chi ti???t nh???t&nbsp;c&oacute; th???, nh???m gi&uacute;p c&aacute;c b???n&nbsp;d??? hi???u&nbsp;v&agrave;&nbsp;th???c h&agrave;nh ???????c ngay. Th???i l?????ng m???i video trung b&igrave;nh t???&nbsp;5 &ndash; 30p</p>',13,0,0,0,0,'INCOMPLETE',20,100000,0,NULL,'Basic development by WPF',1,10),(21,'L???p tr??nh web v???i Python b???ng Django',19,'2021-01-12 01:25:56','2021-01-20 01:03:14','<p>L???p tr&igrave;nh web ch??a bao gi??? h???t hot. C&ograve;n Ng&ocirc;n ng??? Python ??ang b???t ?????u ???????c s??? d???ng r???ng r&atilde;i. V???y l???p tr&igrave;nh web v???i Python th&igrave; s??? th??? n&agrave;o? H&atilde;y c&ugrave;ng t&igrave;m hi???u qua serial L???P TR&Igrave;NH WEBSITE V???I PYTHON B???NG DJANGO ???????c ??&oacute;ng g&oacute;p t??? c???ng ?????ng.</p>',17,1,3,0,0,'INCOMPLETE',20,150000,0,NULL,'Simple web development with Python and Django framework',1,9),(22,'L???p tr??nh Winform c?? b???n',19,'2021-01-12 01:25:56','2021-01-20 01:03:36','<p>Serial d&agrave;nh cho nh???ng b???n&nbsp;ch??a c&oacute; b???t k??? ki???n th???c&nbsp;g&igrave; v???&nbsp;l???p tr&igrave;nh Winform, ho???c nh???ng b???n&nbsp;m???t c??n b???n&nbsp;mu???n l???y l???i ki???n th???c n???n t???ng&nbsp;C# Winform. N???i dung Serial n&agrave;y ???????c ph&acirc;n t&aacute;ch&nbsp;chi ti???t nh???t&nbsp;c&oacute; th???, nh???m gi&uacute;p c&aacute;c b???n&nbsp;d??? hi???u&nbsp;v&agrave;&nbsp;th???c h&agrave;nh ???????c ngay. Th???i l?????ng m???i video trung b&igrave;nh t???&nbsp;5 &ndash; 30p</p>',1,0,0,0,0,'INCOMPLETE',20,0,0,NULL,'Basic Winform application',1,1),(23,'Machine Learning c?? b???n v???i NumPy',19,'2021-01-12 01:25:57',NULL,'Th??ng qua kh??a h???c MACHINE LEARNING V???I NUMPY, ch??ng t??i s??? h?????ng d???n c??c ki???n th???c c?? b???n c???a thu???t to??n Machine Learning ????? c??c b???n c?? th??? t???o ra nh???ng s???n ph???m Machine Learning c???a ri??ng m??nh.\n',7,0,2,0,5,'INCOMPLETE',20,100000,1,NULL,'Machine learning with Numpy and Python',1,1),(24,'Kh??a Th???c chi???n SQL - D??? ??n qu???n l?? sinh vi??n',19,'2021-01-12 01:25:57',NULL,'??? combo Th???c chi???n SQL, ch??ng ta s??? c??ng nhau ph??n t??ch c??c CSDL ???? t??? ?????c t??? v?? ???ng d???ng c??c ki???n th???c ???? h???c ??? hai kh??a tr??n v??o vi???c gi???i quy???t c??c y??u c???u th???c t??? c???a m???t CSDL. Trong b??? kh??a h???c n??y c??c b???n s??? ??i qua c??c ki???n th???c t??? c?? b???n ?????n n??ng cao qua c??c d??? ??n kh??c nhau.',3,0,0,0,0,'INCOMPLETE',20,0,0,NULL,'SQL Server in real life application',1,1),(25,'Ph??n t??ch thi???t k??? ph???n m???m 2',19,'2021-01-12 01:25:58','2021-01-20 01:06:08','<p>Kh&oacute;a h???c ph&acirc;n t&iacute;ch thi???t k??? ph???n m???m. Gi&uacute;p b???n n???m ???????c t?? duy ph&acirc;n t&iacute;ch. Thi???t k??? m???t h??? th???ng. Kh&ocirc;ng ch??? ph???n m???m, m&agrave; c??? cho cu???c s???ng c???a b???n.</p>',0,0,0,0,0,'INCOMPLETE',20,100000,0,NULL,'Software design and analysics',1,1),(26,'Zero in hero Python 2',26,'2021-01-19 13:11:05',NULL,'<p>Looking for work or have a Python related position that you\'re trying to hire for? Our&nbsp;<strong>relaunched community-run job board</strong>&nbsp;is the place to go.</p>',19,2,0,0,0,'INCOMPLETE',20,15000000,0,NULL,'Python from zero to hero',1,1),(27,'Zero in hero Python 3',19,'2021-01-19 15:10:30','2021-01-20 01:05:34','<p>bbbbb</p>',0,2,0,0,0,'INCOMPLETE',20,1000,0,NULL,'aaaaaaaaaaaaa',1,1),(28,'Ph??n t??ch thi???t k??? ph???n m???m 2',19,'2021-01-19 15:40:38',NULL,'<div><span style=\"font-family: verdana, sans-serif; font-size: medium;\"><strong>Ph&acirc;n t&iacute;ch ph???n m???m</strong>&nbsp;(n&oacute;i ?????y ????? l&agrave;&nbsp;<strong>ph&acirc;n t&iacute;ch y&ecirc;u c???u ph???n m???m</strong>)</span></div>\r\n<div><span style=\"font-family: verdana, sans-serif; font-size: medium;\">&nbsp;</span></div>\r\n<div><span style=\"font-family: verdana, sans-serif; font-size: medium;\">Trong c&aacute;c ng&agrave;nh k??? thu???t h??? th???ng v&agrave; k??? ngh??? ph???n m???m,&nbsp;<strong>ph&acirc;n t&iacute;ch y&ecirc;u c???u</strong>&nbsp;l&agrave; c&ocirc;ng vi???c bao g???m c&aacute;c t&aacute;c v??? x&aacute;c ?????nh c&aacute;c y&ecirc;u c???u cho m???t h??? th???ng m???i ho???c ???????c thay ?????i, d???a tr&ecirc;n c?? s??? l&agrave; c&aacute;c y&ecirc;u c???u (c&oacute; th??? m&acirc;u thu???n) m&agrave; nh???ng ng?????i c&oacute; vai tr&ograve; quan tr???ng ?????i v???i h??? th???ng, ch???ng h???n ng?????i s??? d???ng, ????a ra. Vi???c ph&acirc;n t&iacute;ch y&ecirc;u c???u c&oacute; &yacute; ngh??a quan tr???ng ?????i v???i th&agrave;nh c&ocirc;ng c???a m???t d??? &aacute;n.</span></div>',0,3,0,0,0,'INCOMPLETE',25,1500000,0,NULL,'Phan tich phan mem',1,1),(29,'B???a s??ng nhanh g???n 02',19,'2021-01-19 18:11:03',NULL,'<div class=\"document-title-container\">\r\n<h2 class=\"text-cookpad-16 xs:text-cookpad-24 font-semibold\">C&aacute;c b?????c</h2>\r\n</div>\r\n<ol class=\"numbered-list\" dir=\"auto\" data-dir-target=\"auto\">\r\n<li id=\"step_40168717\" class=\"step numbered-list__item\" dir=\"auto\" data-dir-target=\"auto\">\r\n<div class=\"numbered-list__contents\">\r\n<div class=\"text-cookpad-14 xs:text-cookpad-18\">\r\n<div data-dir-attribute=\"auto\">\r\n<p class=\"mb-sm inline\">G???o ng&acirc;m t??? t???i h&ocirc;m tr?????c. S&aacute;ng h&ocirc;m sau ??&atilde;i th???t s???ch. S?????n r???a s???ch, tr???n s??, x&agrave;o qua cho ng???m gia v???. ????? n?????c v&agrave;o ??un s&ocirc;i, th??? g???o v&agrave;o ninh trong 45 ph&uacute;t l&agrave; nh???. (m&igrave;nh ??un b???ng n???i &aacute;p su???t)</p>\r\n</div>\r\n</div>\r\n<div class=\"flex space-x-sm\">&nbsp;</div>\r\n</div>\r\n</li>\r\n<li id=\"step_40168718\" class=\"step numbered-list__item\" dir=\"auto\" data-dir-target=\"auto\">\r\n<div class=\"numbered-list__contents\">\r\n<div class=\"text-cookpad-14 xs:text-cookpad-18\">\r\n<div data-dir-attribute=\"auto\">\r\n<p class=\"mb-sm inline\">Tr???ng r???a s???ch cho v&agrave;o n???i lu???c ch&iacute;n.</p>\r\n</div>\r\n</div>\r\n<div class=\"flex space-x-sm\">&nbsp;</div>\r\n</div>\r\n</li>\r\n<li id=\"step_40168719\" class=\"step numbered-list__item\" dir=\"auto\" data-dir-target=\"auto\">\r\n<div class=\"numbered-list__contents\">\r\n<div class=\"text-cookpad-14 xs:text-cookpad-18\">\r\n<div data-dir-attribute=\"auto\">\r\n<p class=\"mb-sm inline\">Rau r??m r???a s???ch. N???u th&iacute;ch c&oacute; th??? th&aacute;i th&ecirc;m l&aacute;t g???ng ??n chung v???i tr???ng c??ng ngon l???m. Nh??ng ch???ng m&igrave;nh kh&ocirc;ng th&iacute;ch ??n g???ng n&ecirc;n m&igrave;nh c??ng l?????i th&aacute;i lu&ocirc;n</p>\r\n</div>\r\n</div>\r\n<div class=\"flex space-x-sm\">&nbsp;</div>\r\n</div>\r\n</li>\r\n<li id=\"step_40168720\" class=\"step numbered-list__item\" dir=\"auto\" data-dir-target=\"auto\">\r\n<div class=\"numbered-list__contents\">\r\n<div class=\"text-cookpad-14 xs:text-cookpad-18\">\r\n<div data-dir-attribute=\"auto\">\r\n<p class=\"mb-sm inline\">Yummy th&ocirc;i n&agrave;o</p>\r\n</div>\r\n</div>\r\n</div>\r\n</li>\r\n</ol>',3,0,0,0,0,'INCOMPLETE',25,100000,0,NULL,'S??ng n??o m??nh c??ng n???u ????? ??n cho c??? gia ????nh. V???n bi???t b???n m???i ?????y nh??ng ??t ra ???????c ch??m s??c m???i ng?????i t???ng b???a ??n v???i m??nh v???n l?? ??i???u h???nh ph??c...',1,2),(30,'S???a chua b?? chu???i y???n m???ch',19,'2021-01-19 18:14:43',NULL,'<section id=\"ingredients\" class=\"ingredients-container document-section border-b border-t border-cookpad-gray-400 bg-cookpad-white\">\r\n<div class=\"document-title-container\">\r\n<h2 class=\"text-cookpad-16 xs:text-cookpad-24 font-semibold\">Nguy&ecirc;n Li???u</h2>\r\n</div>\r\n<div class=\"ingredient-list\">\r\n<ol class=\"list-unstyled text-cookpad-14 xs:text-cookpad-18 divide-y\" dir=\"auto\" data-dir-target=\"auto\">\r\n<li id=\"ingredient_23921618\" class=\"ingredient py-xs border-cookpad-gray-400 border-dashed\">\r\n<div><bdi class=\"ingredient__quantity\">1</bdi>&nbsp;qu??? b??</div>\r\n</li>\r\n<li id=\"ingredient_23921619\" class=\"ingredient py-xs border-cookpad-gray-400 border-dashed\">\r\n<div><bdi class=\"ingredient__quantity\">1</bdi>&nbsp;qu??? chu???i</div>\r\n</li>\r\n<li id=\"ingredient_23921620\" class=\"ingredient py-xs border-cookpad-gray-400 border-dashed\">\r\n<div><bdi class=\"ingredient__quantity\">1</bdi>&nbsp;h???p s???a chua kh&ocirc;ng ???????ng</div>\r\n</li>\r\n<li id=\"ingredient_23921621\" class=\"ingredient py-xs border-cookpad-gray-400 border-dashed\">\r\n<div><bdi class=\"ingredient__quantity\">1 mu???ng canh</bdi>&nbsp;y???n m???ch</div>\r\n</li>\r\n</ol>\r\n</div>\r\n</section>\r\n<section id=\"steps\" class=\"steps-container document-section bg-cookpad-white\">\r\n<div class=\"document-title-container\">\r\n<h2 class=\"text-cookpad-16 xs:text-cookpad-24 font-semibold\">C&aacute;c b?????c</h2>\r\n</div>\r\n<ol class=\"numbered-list\" dir=\"auto\" data-dir-target=\"auto\">\r\n<li id=\"step_16090442\" class=\"step numbered-list__item\" dir=\"auto\" data-dir-target=\"auto\">\r\n<div class=\"numbered-list__contents\">\r\n<div class=\"text-cookpad-14 xs:text-cookpad-18\">\r\n<div data-dir-attribute=\"auto\">\r\n<p class=\"mb-sm inline\">C???t nh??? b??, chu???i, cho s???a chua v&agrave;o xay c&ugrave;ng. N???u th&iacute;ch ??n l???nh c&oacute; th??? cho qu??? chu???i ??&ocirc;ng ??&aacute; tr?????c r???i xay ho???c xay xong b??? v&agrave;o t??? m&aacute;t. M&igrave;nh kh&ocirc;ng ??n l???nh n&ecirc;n d&ugrave;ng t????i lu&ocirc;n&nbsp;</p>\r\n</div>\r\n</div>\r\n</div>\r\n</li>\r\n<li id=\"step_16090443\" class=\"step numbered-list__item\" dir=\"auto\" data-dir-target=\"auto\">\r\n<div class=\"numbered-list__contents\">\r\n<div class=\"text-cookpad-14 xs:text-cookpad-18\">\r\n<div data-dir-attribute=\"auto\">\r\n<p class=\"mb-sm inline\">Cho ra ly v&agrave; cho y???n m???ch l&ecirc;n. M??m m??m th&ocirc;i</p>\r\n</div>\r\n</div>\r\n</div>\r\n</li>\r\n</ol>\r\n</section>',0,0,0,0,0,'INCOMPLETE',25,50000,0,NULL,'B???a s??ng nhanh g???n gi??u dinh d?????ng',1,2),(31,'Ch??o y???n m???ch tr??i c??y',19,'2021-01-19 18:16:10',NULL,'<section id=\"ingredients\" class=\"ingredients-container document-section border-b border-t border-cookpad-gray-400 bg-cookpad-white\">\r\n<div class=\"document-title-container\">\r\n<h2 class=\"text-cookpad-16 xs:text-cookpad-24 font-semibold\">Nguy&ecirc;n Li???u</h2>\r\n</div>\r\n<div class=\"ingredient-list\">\r\n<ol class=\"list-unstyled text-cookpad-14 xs:text-cookpad-18 divide-y\" dir=\"auto\" data-dir-target=\"auto\">\r\n<li id=\"ingredient_23825953\" class=\"ingredient py-xs border-cookpad-gray-400 border-dashed\">\r\n<div><bdi class=\"ingredient__quantity\">3 mu???ng canh</bdi>&nbsp;y???n m???ch</div>\r\n</li>\r\n<li id=\"ingredient_23825954\" class=\"ingredient py-xs border-cookpad-gray-400 border-dashed\">\r\n<div><bdi class=\"ingredient__quantity\">1/2</bdi>&nbsp;qu??? t&aacute;o(chu???i, nho,kiwi,....)</div>\r\n</li>\r\n<li id=\"ingredient_23825955\" class=\"ingredient py-xs border-cookpad-gray-400 border-dashed\">\r\n<div><bdi class=\"ingredient__quantity\">200 ml</bdi>&nbsp;n?????c</div>\r\n</li>\r\n<li id=\"ingredient_23825956\" class=\"ingredient py-xs border-cookpad-gray-400 border-dashed\">\r\n<div><bdi class=\"ingredient__quantity\">200 ml</bdi>&nbsp;s???a t????i kh&ocirc;ng ???????ng</div>\r\n</li>\r\n<li id=\"ingredient_23882127\" class=\"ingredient py-xs border-cookpad-gray-400 border-dashed\">\r\n<div><bdi class=\"ingredient__quantity\"></bdi>(tu??? lo???i y???n m???ch v&agrave; tu??? s??? th&iacute;ch ??i???u ch???nh ????? ?????c lo&atilde;ng c???a ch&aacute;o)</div>\r\n</li>\r\n</ol>\r\n</div>\r\n</section>\r\n<section id=\"steps\" class=\"steps-container document-section bg-cookpad-white\">\r\n<div class=\"document-title-container\">\r\n<h2 class=\"text-cookpad-16 xs:text-cookpad-24 font-semibold\">C&aacute;c b?????c</h2>\r\n</div>\r\n<ol class=\"numbered-list\" dir=\"auto\" data-dir-target=\"auto\">\r\n<li id=\"step_16020721\" class=\"step numbered-list__item\" dir=\"auto\" data-dir-target=\"auto\">\r\n<div class=\"numbered-list__contents\">\r\n<div class=\"text-cookpad-14 xs:text-cookpad-18\">\r\n<div data-dir-attribute=\"auto\">\r\n<p class=\"mb-sm inline\">Nguy&ecirc;n li???u</p>\r\n</div>\r\n</div>\r\n</div>\r\n</li>\r\n<li id=\"step_16020722\" class=\"step numbered-list__item\" dir=\"auto\" data-dir-target=\"auto\">\r\n<div class=\"numbered-list__contents\">\r\n<div class=\"text-cookpad-14 xs:text-cookpad-18\">\r\n<div data-dir-attribute=\"auto\">\r\n<p class=\"mb-sm inline\">Cho n?????c v&agrave; y???n m???ch v&agrave;o noi ??un s&ocirc;i l???a v???a nh??? cho m???m ra, l&uacute;c n&agrave;y h???n h???p s??? ?????c l???i do n?????c r&uacute;t v&agrave;o y???n m???ch.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</li>\r\n<li id=\"step_16020723\" class=\"step numbered-list__item\" dir=\"auto\" data-dir-target=\"auto\">\r\n<div class=\"numbered-list__contents\">\r\n<div class=\"text-cookpad-14 xs:text-cookpad-18\">\r\n<div data-dir-attribute=\"auto\">\r\n<p class=\"mb-sm inline\">Khi y???n m???ch m???m t???t b???p th&ecirc;m s???a v&agrave;o. Chao kh&ocirc;ng qu&aacute; lo&atilde;ng kh&ocirc;ng qu&aacute; ?????c l&agrave; v???a ??n</p>\r\n</div>\r\n</div>\r\n<div class=\"flex space-x-sm\"><a class=\"md:w-auto w-full\" href=\"https://cookpad.com/vn/step_attachment/images/d6579f908e01f462\" rel=\"nofollow\" data-action=\"modal#advance\"><picture class=\"\"><source srcset=\"https://img-global.cpcdn.com/steps/d6579f908e01f462/160x128cq70/eat-clean-chao-y???n-m???ch-trai-cay-b???a-sang-nhanh-g???n-d???-ch???t-recipe-step-3-photo.webp 1x, https://img-global.cpcdn.com/steps/d6579f908e01f462/320x256cq70/eat-clean-chao-y???n-m???ch-trai-cay-b???a-sang-nhanh-g???n-d???-ch???t-recipe-step-3-photo.webp 2x\" type=\"image/webp\" data-srcset=\"https://img-global.cpcdn.com/steps/d6579f908e01f462/160x128cq70/eat-clean-chao-y???n-m???ch-trai-cay-b???a-sang-nhanh-g???n-d???-ch???t-recipe-step-3-photo.webp 1x, https://img-global.cpcdn.com/steps/d6579f908e01f462/320x256cq70/eat-clean-chao-y???n-m???ch-trai-cay-b???a-sang-nhanh-g???n-d???-ch???t-recipe-step-3-photo.webp 2x\" /><source srcset=\"https://img-global.cpcdn.com/steps/d6579f908e01f462/160x128cq70/eat-clean-chao-y???n-m???ch-trai-cay-b???a-sang-nhanh-g???n-d???-ch???t-recipe-step-3-photo.jpg 1x, https://img-global.cpcdn.com/steps/d6579f908e01f462/320x256cq70/eat-clean-chao-y???n-m???ch-trai-cay-b???a-sang-nhanh-g???n-d???-ch???t-recipe-step-3-photo.jpg 2x\" type=\"image/jpeg\" data-srcset=\"https://img-global.cpcdn.com/steps/d6579f908e01f462/160x128cq70/eat-clean-chao-y???n-m???ch-trai-cay-b???a-sang-nhanh-g???n-d???-ch???t-recipe-step-3-photo.jpg 1x, https://img-global.cpcdn.com/steps/d6579f908e01f462/320x256cq70/eat-clean-chao-y???n-m???ch-trai-cay-b???a-sang-nhanh-g???n-d???-ch???t-recipe-step-3-photo.jpg 2x\" /></picture></a></div>\r\n</div>\r\n</li>\r\n<li id=\"step_16020724\" class=\"step numbered-list__item\" dir=\"auto\" data-dir-target=\"auto\">\r\n<div class=\"numbered-list__contents\">\r\n<div class=\"text-cookpad-14 xs:text-cookpad-18\">\r\n<div data-dir-attribute=\"auto\">\r\n<p class=\"mb-sm inline\">C???t t&aacute;o cho l&ecirc;n tr&ecirc;n</p>\r\n</div>\r\n</div>\r\n</div>\r\n</li>\r\n<li id=\"step_16020725\" class=\"step numbered-list__item\" dir=\"auto\" data-dir-target=\"auto\">\r\n<div class=\"numbered-list__contents\">\r\n<div class=\"text-cookpad-14 xs:text-cookpad-18\">\r\n<div data-dir-attribute=\"auto\">\r\n<p class=\"mb-sm inline\">M??m m??m th&ocirc;i, ai ??n kh&ocirc;ng quen s??? ng&aacute;n nh??ng m&igrave;nh ??n ri???t b??? ghi???n</p>\r\n</div>\r\n</div>\r\n</div>\r\n</li>\r\n</ol>\r\n</section>',2,0,0,0,0,'INCOMPLETE',25,150000,0,NULL,'B???a ??n nhanh g???n m?? gi??u dinh d?????ng, ch??? v???i 5 ph??t th??i. H??? tr??? gi???m c??n hi???u qu???.',1,2),(32,'Zero in hero Python 4',19,'2021-01-20 03:26:36',NULL,'<p>Python is the best</p>',2,2,0,0,0,'INCOMPLETE',20,12000000,0,NULL,'zero to hero Python',1,1),(33,'L???p tr??nh website c?? b???n',19,'2021-01-20 04:02:26',NULL,'<ol>\r\n<li>B&agrave;i h???c 1</li>\r\n<li>...</li>\r\n</ol>',4,2,1,0,0,'INCOMPLETE',20,1000000,0,NULL,'Basic knowledge of Python programing language',1,9);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `description` text,
  `percent` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,'SUMMER25',NULL,'2021-05-01 00:00:00','20% discount for cooking courses',20);
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_course`
--

DROP TABLE IF EXISTS `field_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `field_course` (
  `fieldid` int NOT NULL,
  `courseid` int NOT NULL,
  PRIMARY KEY (`fieldid`,`courseid`),
  KEY `field_course_courses_fk` (`courseid`),
  CONSTRAINT `field_course_courses_fk` FOREIGN KEY (`courseid`) REFERENCES `courses` (`id`),
  CONSTRAINT `field_course_fields_fk` FOREIGN KEY (`fieldid`) REFERENCES `fields` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_course`
--

LOCK TABLES `field_course` WRITE;
/*!40000 ALTER TABLE `field_course` DISABLE KEYS */;
INSERT INTO `field_course` VALUES (1,4),(3,4),(1,7),(3,7),(22,7),(1,8),(2,8),(3,8),(22,8),(2,9),(3,9),(1,10),(2,10),(7,11),(8,11),(23,11),(1,12),(2,12),(3,12),(7,12),(1,13),(2,13),(3,13),(7,13),(2,14),(6,14),(19,14),(1,15),(5,15),(6,15),(8,15),(2,16),(22,16),(23,16),(7,17),(8,17),(23,17),(2,18),(22,18),(7,19),(8,19),(23,19),(2,20),(7,20),(1,21),(7,21),(2,22),(7,22),(1,25),(2,25),(3,25),(23,25),(1,26),(22,26),(2,27),(22,27),(1,28),(2,28),(3,28),(4,29),(4,30),(4,31),(5,31),(6,31),(3,32),(22,32),(1,33);
/*!40000 ALTER TABLE `field_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `categoryid` int NOT NULL,
  `imgpath` text,
  `getscount` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fields_categories_fk` (`categoryid`),
  FULLTEXT KEY `namefts` (`name`),
  CONSTRAINT `fields_categories_fk` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`id`)
) /*!50100 TABLESPACE `innodb_system` */ ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,'L???p tr??nh web',1,'/assets/admin/images/fields/lap-trinh-web.jpg',13),(2,'L???p tr??nh windows',1,'/assets/admin/images/fields/Windows_Product_Family_9-30-Event.png',5),(3,'L???p tr??nh mobile',1,'/assets/admin/images/fields/mobile.jpeg',11),(4,'B???a s??ng',2,'/assets/admin/images/fields/lunch.jpeg',0),(5,'B???a tr??a',2,'/assets/admin/images/fields/lunch2.jpg',4),(6,'B???a t???i',2,'/assets/admin/images/fields/dinner.jpg',8),(7,'Thi???t k??? 2D',3,'/assets/admin/images/fields/2d.jpg',4),(8,'Thi???t k??? 3D',3,'/assets/admin/images/fields/3d.jpg',0),(18,'test123',1,'/assets/admin/images/fields/a.jpg',4),(19,'test123',1,'/assets/admin/images/fields/andreas-m-ykfjtb0kphU-unsplash.jpg',5),(22,'Data Science',1,'/assets/admin/images/fields/jan-styblo-v_JzMR1rlTw-unsplash.jpg',2),(23,'L???p tr??nh game',1,'/assets/admin/images/fields/88ac308bf82c4e57876e039aa5a53e14_20200818120924.png',0);
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `courseid` int NOT NULL,
  `description` text,
  `videourl` text,
  `title` varchar(50) DEFAULT NULL,
  `order` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lessons_courses_fk` (`courseid`),
  CONSTRAINT `lessons_courses_fk` FOREIGN KEY (`courseid`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES (2,4,'<p>adadadad</p>','/assets/client/videos/Cshap.mp4','lession 1',1),(3,4,'<p>In this course you will learn about:</p>\r\n<ol>\r\n<li>HTML</li>\r\n<li>CSS</li>\r\n<li>JS</li>\r\n<li>Angular</li>\r\n</ol>','/assets/client/videos/React.mp4','Lesson 2: Angular',2),(4,4,'<p>Express is an backend framework by javascript on Nodejs platform.</p>','/assets/client/videos/Cshap.mp4','Lesson 3: Express js',3),(6,4,'<p><strong>React makes it painless to create interactive UIs. Design simple views for each state in your application, and React will efficiently update and render just the right components when your data changes.</strong></p>\r\n<p><strong>Declarative views make your code more predictable and easier to&nbsp;</strong></p>','/assets/client/videos/python.mp4','Lesson 4: React',4),(7,26,'<p><strong>Transistor NPN</strong>&nbsp;l&agrave; c&aacute;c thi???t b??? ba c???c, ba l???p c&oacute; th??? ho???t ?????ng nh?? b??? khu???ch ?????i ho???c c&ocirc;ng t???c ??i???n t???. Trong h?????ng d???n n&agrave;y v??? c&aacute;c b&oacute;ng b&aacute;n d???n l?????ng c???c, ch&uacute;ng ta s??? xem x&eacute;t k??? h??n v??? c???u h&igrave;nh c???a B??? ph&aacute;t chung chung Emitter s??? d???ng&nbsp;<strong>Transistor NPN l?????ng c???c</strong>&nbsp;v???i m???t v&iacute; d??? v??? vi???c ch??? t???o m???t b&oacute;ng b&aacute;n d???n NPN c&ugrave;ng v???i c&aacute;c ?????c t&iacute;nh d&ograve;ng ??i???n c???a b&oacute;ng b&aacute;n d???n ???????c ????a ra d?????i ??&acirc;y. B&acirc;y gi??? ch&uacute;ng ta c&ugrave;ng t&igrave;m hi???u&nbsp;<strong>Transistor l&agrave; g&igrave;, c???u t???o c???a Transistor NPN</strong></p>','/assets/client/videos/nodejs.mp4','introduction java',1),(8,21,'<p>as dasd asd</p>','/assets/client/videos/Cshap.mp4','Lesson 1: Syntax',1),(9,7,'<p>Angular is better than React</p>','/assets/client/videos/nodejs.mp4','Lesson 1: Angular',1),(10,7,'<p>More about angular</p>','/assets/client/videos/learnC.mp4','Lesson 2: Angular 2',2),(11,7,'<p>Express JS is the best</p>','/assets/client/videos/Cshap.mp4','Lesson 3: Express js',2);
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `userid` int NOT NULL,
  `courseid` int NOT NULL,
  `createddat` datetime DEFAULT CURRENT_TIMESTAMP,
  `point` int DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`userid`,`courseid`),
  KEY `ratings_courses_fk` (`courseid`),
  CONSTRAINT `ratings_courses_fk` FOREIGN KEY (`courseid`) REFERENCES `courses` (`id`),
  CONSTRAINT `ratings_users_fk` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (20,4,'2021-01-20 11:15:17',5,'fdfd'),(20,7,'2021-01-19 20:03:13',5,'adada'),(20,9,'2021-01-19 20:17:26',5,'V???i s??? ph??t tri???n ch??ng m???t c???a th????ng m???i ??i???n t??? (TM??T), kh??ng thi???u nh???ng ng?????i nhanh nh???y bi???t n???m b???t th???i c?? v?? tr??? n??n gi??u c?? v???i vi???c kinh doanh tr??n c??c s??n . N???u l?? ng?????i m???i v?? kh??ng mu???n b??? ???? ???ng???p th?????? tr??n s??n ch??i Facebook ??? n??i v???n c?? ???'),(20,11,'2021-01-20 00:15:25',5,'Kh??a h???c r???t hay'),(20,23,'2021-01-20 10:02:15',5,'amazing course'),(24,4,'2021-01-20 00:50:30',5,'First review is the best'),(24,10,'2021-01-19 21:47:07',5,'This course is amazing!'),(25,4,'2021-01-20 01:23:34',3,'This course is too expensive.');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('-y4GnOGE08fuKYU-xKiMS21OzJcNOQjk',1611198444,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isAuth\":true,\"authUser\":{\"id\":20,\"role\":\"ADMIN\",\"status\":\"AVAILABLE\",\"fullname\":\"Ng?? V??n T??i\",\"gender\":\"MALE\",\"address\":\"Th??? ?????c\",\"phone\":\"0382999365\",\"purchasedcount\":6,\"totalmoneyspend\":1600000,\"uploadedcount\":0,\"totalmoneyearn\":0,\"teachingdescription\":null,\"joinedat\":\"2021-01-10T00:57:09.000Z\",\"teachstatus\":\"\",\"imgpath\":\"/assets/client/images/users/yan-ots-lpWb5mCXqP8-unsplash.jpg\",\"isvalid\":1},\"authAccount\":{\"id\":8,\"userid\":20,\"email\":\"ngovantai1999@gmail.com\",\"hash\":\"3d825cce99f988afb780c7b96912ff49616ba6db6acf58a782a714ad2e5307437c6b31516bf2a3f96a793ea47d217b25c8918bb70674db142658f21d4b0c2368\",\"salt\":\"76333bf121a8174fc5801d52fd299a79\",\"createdat\":\"2021-01-10T00:57:09.000Z\",\"otp\":null,\"otpexpired\":null},\"retUrl\":\"http://localhost:3000/\"}'),('2EZi9Go13wyU4-17XM0TFkz9-HfCLqxg',1611173003,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isAuth\":true,\"authUser\":{\"id\":20,\"role\":\"ADMIN\",\"status\":\"AVAILABLE\",\"fullname\":\"Ng?? V??n T??i\",\"gender\":\"MALE\",\"address\":\"Th??? ?????c\",\"phone\":\"0382999365\",\"purchasedcount\":6,\"totalmoneyspend\":1600000,\"uploadedcount\":0,\"totalmoneyearn\":0,\"teachingdescription\":null,\"joinedat\":\"2021-01-10T00:57:09.000Z\",\"teachstatus\":\"\",\"imgpath\":\"/assets/client/images/users/yan-ots-lpWb5mCXqP8-unsplash.jpg\",\"isvalid\":1},\"authAccount\":{\"id\":8,\"userid\":20,\"email\":\"ngovantai19999@gmail.com\",\"hash\":\"62a5c849552ebf9b7b28f0c9a9b309fbd5f82fc0851d56f2faadba9f7cd151ddd029ae07b9b35fbc25d1ed71ec0fbd4061bf7cdb9d5c3f57ce934e08c7f8a7b9\",\"salt\":\"08ae7f255fe3d8defe6e7981d4330ec8\",\"createdat\":\"2021-01-10T00:57:09.000Z\",\"otp\":null,\"otpexpired\":null},\"retUrl\":\"http://localhost:3000/\"}'),('Eg9uUSsD6utoYBwa-7ufjG4y-hhOpXNC',1611158083,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isAuth\":true,\"authUser\":{\"id\":25,\"role\":\"ADMIN\",\"status\":\"AVAILABLE\",\"fullname\":\"Nguy???n Ho??ng Vi???t\",\"gender\":\"MALE\",\"address\":null,\"phone\":null,\"purchasedcount\":0,\"totalmoneyspend\":0,\"uploadedcount\":0,\"totalmoneyearn\":0,\"teachingdescription\":null,\"joinedat\":\"2021-01-19T02:09:56.000Z\",\"teachstatus\":null,\"imgpath\":null,\"isvalid\":1},\"authAccount\":{\"id\":13,\"userid\":25,\"email\":\"1712905@student.hcmus.edu.vn\",\"hash\":\"4200da98ad2e75b91ea1c016e0be913795f514079658a20ca70bfe928e95b5854d0a6f9c964259fe3b1bbb4bacd84f3e816c6362f9d7226f86f6ac7b958fe823\",\"salt\":\"f9ebb5d325fa695d1f6cbecf7da9c1e0\",\"createdat\":\"2021-01-19T02:09:56.000Z\",\"otp\":\"fVC0o0\",\"otpexpired\":\"2021-01-26T09:09:59.000Z\"},\"retUrl\":\"http://localhost:3000/courses/4\"}'),('FJ5mIJ9VhOFXsv_seNSjA8kIIJYVrrlt',1611149250,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isAuth\":true,\"authUser\":{\"id\":20,\"role\":\"ADMIN\",\"status\":\"AVAILABLE\",\"fullname\":\"Ng?? V??n T??i\",\"gender\":\"MALE\",\"address\":\"Th??? ?????c\",\"phone\":\"0382999365\",\"purchasedcount\":4,\"totalmoneyspend\":1400000,\"uploadedcount\":0,\"totalmoneyearn\":0,\"teachingdescription\":null,\"joinedat\":\"2021-01-10T00:57:09.000Z\",\"teachstatus\":\"\",\"imgpath\":\"/assets/client/images/users/yan-ots-lpWb5mCXqP8-unsplash.jpg\",\"isvalid\":1},\"authAccount\":{\"id\":8,\"userid\":20,\"email\":\"ngovantai1999@gmail.com\",\"hash\":\"88142a3e509d029da3ef97643ffa4310b7a8eca6eddb08358fc7586e0037216ca12ab128bd37254c72a669b4c2ef1c51237c917e37d3c9c7a766f3517bcc42df\",\"salt\":\"e3973a183b8992a7ea8cd81070be4b2c\",\"createdat\":\"2021-01-10T00:57:09.000Z\",\"otp\":null,\"otpexpired\":null},\"retUrl\":\"/admin/user\"}'),('JOFNIWy3Uva3jbQilFEEXZIs_XyAqaGH',1611202312,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isAuth\":true,\"authUser\":{\"id\":24,\"role\":\"STUDENT\",\"status\":\"AVAILABLE\",\"fullname\":\"Nguy???n Ho??ng Vi???t\",\"gender\":\"MALE\",\"address\":null,\"phone\":null,\"purchasedcount\":8,\"totalmoneyspend\":1600000,\"uploadedcount\":0,\"totalmoneyearn\":0,\"teachingdescription\":null,\"joinedat\":\"2021-01-17T05:58:12.000Z\",\"teachstatus\":null,\"imgpath\":null,\"isvalid\":1},\"authAccount\":{\"id\":12,\"userid\":24,\"email\":\"hoangvietnguyen99@hotmail.com\",\"hash\":\"2ea213f7bb6a5a2f8730a6d9c147cb27f4f2f9d6be9bd246d91a367cd7c545b480d94a453aa7d6e71c858ed1e0832b436004b9acf1f87c737424ecdfc8a827fb\",\"salt\":\"c30fe6d4ce2e74f5551ae4a39779c34c\",\"createdat\":\"2021-01-17T05:58:13.000Z\",\"otp\":\"cvTSAS\",\"otpexpired\":\"2021-01-26T21:13:28.000Z\"},\"retUrl\":\"http://localhost:3000/\"}'),('MHrUGwQJ-VvK5iIT_N9tGr3Q-z3Kfbvt',1611146722,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isAuth\":true,\"authUser\":{\"id\":19,\"role\":\"TEACHER\",\"status\":\"AVAILABLE\",\"fullname\":\"Nguy???n Ho??ng Vi???t\",\"gender\":\"MALE\",\"address\":\"656/20 c??ch m???ng th??ng 8\",\"phone\":\"0382999365\",\"purchasedcount\":4,\"totalmoneyspend\":400000,\"uploadedcount\":20,\"totalmoneyearn\":4450000,\"teachingdescription\":\"<p>My name is Hung and I am a Vietnamese. I am twenty-one years old. and I am a student at Hanoi Architectural University at the moment. My major is Engineering, and I am studying in year three. Now I live in Hanoi city, the capital of Vietnam.&nbsp;</p>\\r\\n<p>I have a big family with six people. I have two sisters and a brother. My sisters are older and my brother is younger than me. My father is a teacher at a secondary school. He has worked for 35 years in the field and he is my biggest role model in life. My mother is a housewife. She is nice and she is really good at cooking. I love my family so much. However they live in my hometown, and I have to live away from them due to my study.&nbsp;</p>\",\"joinedat\":\"2021-01-07T19:43:57.000Z\",\"teachstatus\":\"APPROVED\",\"imgpath\":\"/assets/client/images/users/jan-styblo-v_JzMR1rlTw-unsplash.jpg\",\"isvalid\":1},\"authAccount\":{\"id\":7,\"userid\":19,\"email\":\"hoangvietnguyen99@gmail.com\",\"hash\":\"07a1e2afd2b669cd9ad8e645784f724c5dd5a17a9223db60020b9ed860d4b869e59bc74ad6a96e38bcd6abf05ff7dc30589576344481db8c52017264d199ee28\",\"salt\":\"0fb20f1e763acc161b85cfcccbfa202a\",\"createdat\":\"2021-01-07T19:43:57.000Z\",\"otp\":\"MyC5TP\",\"otpexpired\":\"2021-01-24T01:42:54.000Z\"},\"retUrl\":\"http://localhost:3000/courses/4\"}'),('X9L5OFZRoyCAml_mdge8TDFpItr-XRzk',1611200543,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isAuth\":true,\"authUser\":{\"id\":25,\"role\":\"ADMIN\",\"status\":\"AVAILABLE\",\"fullname\":\"Nguy???n Ho??ng Vi???t\",\"gender\":\"MALE\",\"address\":null,\"phone\":null,\"purchasedcount\":3,\"totalmoneyspend\":1080000,\"uploadedcount\":0,\"totalmoneyearn\":0,\"teachingdescription\":null,\"joinedat\":\"2021-01-19T02:09:56.000Z\",\"teachstatus\":null,\"imgpath\":null,\"isvalid\":1},\"authAccount\":{\"id\":13,\"userid\":25,\"email\":\"1712905@student.hcmus.edu.vn\",\"hash\":\"4200da98ad2e75b91ea1c016e0be913795f514079658a20ca70bfe928e95b5854d0a6f9c964259fe3b1bbb4bacd84f3e816c6362f9d7226f86f6ac7b958fe823\",\"salt\":\"f9ebb5d325fa695d1f6cbecf7da9c1e0\",\"createdat\":\"2021-01-19T02:09:56.000Z\",\"otp\":\"fVC0o0\",\"otpexpired\":\"2021-01-26T09:09:59.000Z\"},\"retUrl\":\"http://localhost:3000/\"}'),('bRf2eXZ-l8ObxCmUUNto53s3rhviP4fa',1611202506,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isAuth\":false,\"authUser\":null,\"authAccount\":null}'),('cJc80BYPCzyW6FNM2I5jmgjmIQQe_QF4',1611202533,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isAuth\":true,\"authUser\":{\"id\":20,\"role\":\"ADMIN\",\"status\":\"AVAILABLE\",\"fullname\":\"Ng?? V??n T??i\",\"gender\":\"MALE\",\"address\":\"Th??? ?????c\",\"phone\":\"0382999365\",\"purchasedcount\":7,\"totalmoneyspend\":1700000,\"uploadedcount\":0,\"totalmoneyearn\":0,\"teachingdescription\":null,\"joinedat\":\"2021-01-10T00:57:09.000Z\",\"teachstatus\":\"\",\"imgpath\":\"/assets/client/images/users/yan-ots-lpWb5mCXqP8-unsplash.jpg\",\"isvalid\":1},\"authAccount\":{\"id\":8,\"userid\":20,\"email\":\"ngovantai1999@gmail.com\",\"hash\":\"3d825cce99f988afb780c7b96912ff49616ba6db6acf58a782a714ad2e5307437c6b31516bf2a3f96a793ea47d217b25c8918bb70674db142658f21d4b0c2368\",\"salt\":\"76333bf121a8174fc5801d52fd299a79\",\"createdat\":\"2021-01-10T00:57:09.000Z\",\"otp\":null,\"otpexpired\":null},\"retUrl\":\"http://localhost:3000/users/detail/20\"}'),('mzfIExXtsHETjla9gitqf9DK0nO2H3l8',1611126981,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isAuth\":true,\"authUser\":{\"id\":20,\"role\":\"ADMIN\",\"status\":\"AVAILABLE\",\"fullname\":\"Ng?? V??n T??i\",\"gender\":\"MALE\",\"address\":\"Th??? ?????c\",\"phone\":\"0382999365\",\"purchasedcount\":4,\"totalmoneyspend\":1400000,\"uploadedcount\":0,\"totalmoneyearn\":0,\"teachingdescription\":null,\"joinedat\":\"2021-01-10T00:57:09.000Z\",\"teachstatus\":\"\",\"imgpath\":\"/assets/client/images/users/yan-ots-lpWb5mCXqP8-unsplash.jpg\",\"isvalid\":1},\"authAccount\":{\"id\":8,\"userid\":20,\"email\":\"ngovantai1999@gmail.com\",\"hash\":\"88142a3e509d029da3ef97643ffa4310b7a8eca6eddb08358fc7586e0037216ca12ab128bd37254c72a669b4c2ef1c51237c917e37d3c9c7a766f3517bcc42df\",\"salt\":\"e3973a183b8992a7ea8cd81070be4b2c\",\"createdat\":\"2021-01-10T00:57:09.000Z\",\"otp\":null,\"otpexpired\":null},\"retUrl\":\"/admin/course\"}'),('pCbAY03eHq9iuALb7d3rzptaYRIcwUP5',1611177721,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isAuth\":true,\"authUser\":{\"id\":25,\"role\":\"ADMIN\",\"status\":\"AVAILABLE\",\"fullname\":\"Nguy???n Ho??ng Vi???t\",\"gender\":\"MALE\",\"address\":null,\"phone\":null,\"purchasedcount\":1,\"totalmoneyspend\":1000000,\"uploadedcount\":0,\"totalmoneyearn\":0,\"teachingdescription\":null,\"joinedat\":\"2021-01-19T02:09:56.000Z\",\"teachstatus\":null,\"imgpath\":null,\"isvalid\":1},\"authAccount\":{\"id\":13,\"userid\":25,\"email\":\"1712905@student.hcmus.edu.vn\",\"hash\":\"4200da98ad2e75b91ea1c016e0be913795f514079658a20ca70bfe928e95b5854d0a6f9c964259fe3b1bbb4bacd84f3e816c6362f9d7226f86f6ac7b958fe823\",\"salt\":\"f9ebb5d325fa695d1f6cbecf7da9c1e0\",\"createdat\":\"2021-01-19T02:09:56.000Z\",\"otp\":\"fVC0o0\",\"otpexpired\":\"2021-01-26T09:09:59.000Z\"},\"retUrl\":\"http://localhost:3000/users/detail/24\"}'),('tU8uuLrmOYYgsaZ7tbnKnIEOlCMOzmYs',1611191356,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isAuth\":true,\"authUser\":{\"id\":25,\"role\":\"ADMIN\",\"status\":\"AVAILABLE\",\"fullname\":\"Nguy???n Ho??ng Vi???t\",\"gender\":\"MALE\",\"address\":null,\"phone\":null,\"purchasedcount\":1,\"totalmoneyspend\":1000000,\"uploadedcount\":0,\"totalmoneyearn\":0,\"teachingdescription\":null,\"joinedat\":\"2021-01-19T02:09:56.000Z\",\"teachstatus\":null,\"imgpath\":null,\"isvalid\":1},\"authAccount\":{\"id\":13,\"userid\":25,\"email\":\"1712905@student.hcmus.edu.vn\",\"hash\":\"4200da98ad2e75b91ea1c016e0be913795f514079658a20ca70bfe928e95b5854d0a6f9c964259fe3b1bbb4bacd84f3e816c6362f9d7226f86f6ac7b958fe823\",\"salt\":\"f9ebb5d325fa695d1f6cbecf7da9c1e0\",\"createdat\":\"2021-01-19T02:09:56.000Z\",\"otp\":\"fVC0o0\",\"otpexpired\":\"2021-01-26T09:09:59.000Z\"},\"retUrl\":\"http://localhost:3000/courses/4\"}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_course`
--

DROP TABLE IF EXISTS `user_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_course` (
  `userid` int NOT NULL,
  `courseid` int NOT NULL,
  `purchasedat` datetime DEFAULT CURRENT_TIMESTAMP,
  `amount` bigint DEFAULT NULL,
  `isinwatchlist` tinyint(1) DEFAULT '0',
  `process` int DEFAULT '0',
  `currentlesson` int DEFAULT '0',
  `lessonorder` int DEFAULT '0',
  `currentpause` double DEFAULT '0',
  PRIMARY KEY (`userid`,`courseid`),
  KEY `user_course_courses_fk` (`courseid`),
  CONSTRAINT `user_course_courses_fk` FOREIGN KEY (`courseid`) REFERENCES `courses` (`id`),
  CONSTRAINT `user_course_users_fk` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) /*!50100 TABLESPACE `innodb_system` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_course`
--

LOCK TABLES `user_course` WRITE;
/*!40000 ALTER TABLE `user_course` DISABLE KEYS */;
INSERT INTO `user_course` VALUES (20,4,'2021-01-13 13:08:03',1000000,0,0,2,0,0),(20,7,'2021-01-19 19:34:59',100000,0,0,0,0,0),(20,8,'2021-01-14 19:51:20',200000,0,0,0,0,0),(20,9,'2021-01-19 20:16:50',100000,0,0,0,0,0),(20,11,'2021-01-14 11:48:22',50000,0,0,0,0,0),(20,21,'2021-01-14 19:51:20',150000,1,0,0,0,0),(20,23,'2021-01-20 10:01:53',100000,0,0,0,0,0),(21,4,'2021-01-12 16:46:11',1000000,0,0,3,0,0),(21,7,'2021-01-12 16:46:11',100000,0,0,0,0,0),(21,8,'2021-01-12 16:46:11',200000,0,0,0,0,0),(21,9,'2021-01-12 20:03:45',100000,0,0,0,0,0),(21,11,'2021-01-14 19:08:34',50000,0,0,0,0,0),(21,12,'2021-01-14 19:08:34',50000,0,0,0,0,0),(21,13,'2021-01-12 20:03:45',200000,0,0,0,0,0),(21,15,'2021-01-12 20:03:45',50000,0,0,0,0,0),(21,16,'2021-01-14 18:08:54',0,0,0,0,1,0),(21,17,'2021-01-14 18:08:54',50000,0,0,0,1,0),(24,4,'2021-01-19 19:28:59',1000000,1,2,3,2,4.088381),(24,7,'2021-01-19 21:41:46',100000,0,0,9,1,0),(24,8,'2021-01-20 04:14:33',200000,0,0,0,1,0),(24,9,'2021-01-19 23:59:10',100000,0,0,0,1,0),(24,10,'2021-01-19 21:41:46',0,1,0,0,1,0),(24,11,'2021-01-19 23:59:10',50000,0,0,0,1,0),(24,16,'2021-01-19 15:18:43',0,0,0,0,1,0),(24,21,'2021-01-19 15:18:43',150000,0,0,0,1,0),(25,4,'2021-01-19 22:53:35',1000000,1,0,2,1,330.140773),(25,7,'2021-01-20 09:56:44',100000,0,0,9,1,0),(25,10,'2021-01-20 09:56:44',0,0,0,0,1,0),(25,33,'2021-01-20 11:04:49',1000000,0,0,0,0,0);
/*!40000 ALTER TABLE `user_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(15) DEFAULT 'STUDENT',
  `status` varchar(15) DEFAULT 'AVAILABLE',
  `fullname` varchar(100) DEFAULT NULL,
  `gender` varchar(6) DEFAULT 'MALE',
  `address` varchar(500) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `purchasedcount` int DEFAULT '0',
  `totalmoneyspend` bigint DEFAULT '0',
  `uploadedcount` int DEFAULT '0',
  `totalmoneyearn` bigint DEFAULT '0',
  `teachingdescription` text,
  `joinedat` datetime DEFAULT CURRENT_TIMESTAMP,
  `teachstatus` varchar(15) DEFAULT NULL,
  `imgpath` text,
  `isvalid` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (19,'TEACHER','AVAILABLE','Nguy???n Ho??ng Vi???t','MALE','656/20 c??ch m???ng th??ng 8','0382999365',4,400000,20,7200000,'<p>My name is Hung and I am a Vietnamese. I am twenty-one years old. and I am a student at Hanoi Architectural University at the moment. My major is Engineering, and I am studying in year three. Now I live in Hanoi city, the capital of Vietnam.&nbsp;</p>\r\n<p>I have a big family with six people. I have two sisters and a brother. My sisters are older and my brother is younger than me. My father is a teacher at a secondary school. He has worked for 35 years in the field and he is my biggest role model in life. My mother is a housewife. She is nice and she is really good at cooking. I love my family so much. However they live in my hometown, and I have to live away from them due to my study.&nbsp;</p>','2021-01-08 02:43:57','APPROVED','/assets/client/images/users/52504067_934101783461173_933886749560537088_n.jpg',1),(20,'ADMIN','AVAILABLE','Ng?? V??n T??i','MALE','Th??? ?????c','0382999368',7,1700000,0,0,NULL,'2021-01-10 07:57:09','','/assets/client/images/users/yan-ots-lpWb5mCXqP8-unsplash.jpg',1),(21,'STUDENT','AVAILABLE','Nguy???n Ho??ng Vi???t','MALE',NULL,NULL,10,1800000,0,0,NULL,'2021-01-12 01:34:08',NULL,NULL,1),(22,'STUDENT','UNAVAILABLE','','MALE','','',0,0,0,0,NULL,'2021-01-14 06:22:49',NULL,NULL,1),(23,'STUDENT','AVAILABLE','','MALE',NULL,NULL,0,0,0,0,NULL,'2021-01-14 06:23:09',NULL,NULL,1),(24,'STUDENT','AVAILABLE','Nguy???n Ho??ng Vi???t','MALE',NULL,NULL,8,1600000,0,0,NULL,'2021-01-17 12:58:12',NULL,NULL,1),(25,'ADMIN','AVAILABLE','Nguy???n Ho??ng Vi???t','MALE','','',4,2080000,0,0,NULL,'2021-01-19 09:09:56',NULL,'/assets/client/images/users/ban-muon-mua-ti-vi-1480944422-650.jpg',1),(26,'TEACHER','AVAILABLE','Nguy???n Ng???c Trung','MALE','527 Phan V??n tr???','1230456789',0,0,0,0,'<p>My name is Hung and I am a Vietnamese. I am twenty-one years old. and I am a student at Hanoi Architectural University at the moment. My major is Engineering, and I am studying in year three. Now I live in Hanoi city, the capital of Vietnam.&nbsp;</p>','2021-01-19 11:08:05','APPROVED',NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'elearning'
--
/*!50003 DROP PROCEDURE IF EXISTS `SearchCourse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchCourse`(keysearch varchar(100), offsetCount int, limited int, typeFilter int)
BEGIN
	if(typeFilter = 0) then
		SELECT c.* FROM courses as c join categories as cr on c.categoryId = cr.id where match(c.name) against(keysearch 
		in natural language mode) or match(cr.name) against(keysearch in natural language mode) limit limited offset offsetCount;
    end if;
    
    if(typeFilter = 1) then
		SELECT c.* FROM courses as c join categories as cr on c.categoryId = cr.id where match(c.name) against(keysearch 
		in natural language mode) or match(cr.name) against(keysearch in natural language mode) order by c.price asc limit limited offset offsetCount;
    end if;
    
    if(typeFilter = 2) then
		SELECT c.* FROM courses as c join categories as cr on c.categoryId = cr.id where match(c.name) against(keysearch
		in natural language mode) or match(cr.name) against(keysearch in natural language mode) order by c.price desc limit limited offset offsetCount;
    end if;
    
    if(typeFilter = 3) then
		SELECT c.* FROM courses as c join categories as cr on c.categoryId = cr.id join course_discount as cd on c.id = cd.courseid where 
        match(c.name) against(keysearch in natural language mode) or match(cr.name) against(keysearch in natural language mode) limit limited offset offsetCount;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchCourseCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchCourseCount`(keysearch varchar(100), typeFilter int)
BEGIN
	select count(*) as count FROM courses as c join categories as cr on c.categoryId = cr.id where match(c.name) against(keysearch 
					in natural language mode) or match(cr.name) against(keysearch in natural language mode);
    
    if(typeFilter = 3) then
		SELECT count(*) as count FROM courses as c join categories as cr on c.categoryId = cr.id join course_discount as cd on c.id = cd.courseid where 
						match(c.name) against(keysearch in natural language mode) or match(cr.name) against(keysearch in natural language mode);
    end if;
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

-- Dump completed on 2021-08-05 23:42:06
