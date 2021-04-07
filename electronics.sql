-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: electronics
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `application_logs`
--

DROP TABLE IF EXISTS `application_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pid` int DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `message` text,
  `priority` enum('emergency','alert','critical','error','warning','notice','info','debug') DEFAULT NULL,
  `fileobject` varchar(1024) DEFAULT NULL,
  `info` varchar(1024) DEFAULT NULL,
  `component` varchar(190) DEFAULT NULL,
  `source` varchar(190) DEFAULT NULL,
  `relatedobject` int unsigned DEFAULT NULL,
  `relatedobjecttype` enum('object','document','asset') DEFAULT NULL,
  `maintenanceChecked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `component` (`component`),
  KEY `timestamp` (`timestamp`),
  KEY `relatedobject` (`relatedobject`),
  KEY `priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_logs`
--

LOCK TABLES `application_logs` WRITE;
/*!40000 ALTER TABLE `application_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int unsigned DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `path` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mimetype` varchar(190) DEFAULT NULL,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  `userOwner` int unsigned DEFAULT NULL,
  `userModification` int unsigned DEFAULT NULL,
  `customSettings` longtext,
  `hasMetaData` tinyint(1) NOT NULL DEFAULT '0',
  `versionCount` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fullpath` (`path`,`filename`),
  KEY `parentId` (`parentId`),
  KEY `filename` (`filename`),
  KEY `modificationDate` (`modificationDate`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,0,'folder','','/',NULL,1617206059,1617206059,1,1,NULL,0,0),(2,1,'folder','Digital assets','/',NULL,1617264005,1617366034,2,2,'a:0:{}',0,2),(4,1,'folder','_default_upload_bucket','/',NULL,1617512971,1617512971,1,0,'a:0:{}',0,1),(6,4,'text','newfile.csv','/_default_upload_bucket/','text/csv',1617643726,1617643726,2,2,'a:0:{}',0,1),(7,4,'text','newfile_1.csv','/_default_upload_bucket/','text/csv',1617644652,1617644652,2,2,'a:0:{}',0,1),(8,4,'text','newfile_2.csv','/_default_upload_bucket/','text/csv',1617646260,1617646260,2,2,'a:0:{}',0,1),(9,4,'text','newfile_3.csv','/_default_upload_bucket/','text/csv',1617700788,1617700788,2,2,'a:0:{}',0,1),(10,4,'text','newfile_4.csv','/_default_upload_bucket/','text/csv',1617729061,1617729061,2,2,'a:0:{}',0,1),(15,4,'image','electrical.jpg','/_default_upload_bucket/','image/jpeg',1617730088,1617730088,2,2,'a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:1899;s:11:\"imageHeight\";i:938;s:16:\"embeddedMetaData\";a:5:{s:12:\"FileDateTime\";i:1617730088;s:8:\"FileSize\";i:63379;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";}s:25:\"embeddedMetaDataExtracted\";b:1;}',0,1),(19,2,'image','ac.jpeg','/Digital assets/','image/jpeg',1617769316,1617769316,2,2,'a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:343;s:11:\"imageHeight\";i:147;s:16:\"embeddedMetaData\";a:5:{s:12:\"FileDateTime\";i:1617769316;s:8:\"FileSize\";i:4145;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";}s:25:\"embeddedMetaDataExtracted\";b:1;}',0,1),(20,4,'image','Screenshot from 2021-03-16 15-16-10.png','/_default_upload_bucket/','image/png',1617790140,1617790140,2,2,'a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:1366;s:11:\"imageHeight\";i:768;s:16:\"embeddedMetaData\";a:0:{}s:25:\"embeddedMetaDataExtracted\";b:1;}',0,1),(21,1,'folder','image','/',NULL,1617790599,1617790599,2,2,'a:0:{}',0,1),(22,21,'image','download.jpeg','/image/','image/jpeg',1617790615,1617790615,2,2,'a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:225;s:11:\"imageHeight\";i:225;s:16:\"embeddedMetaData\";a:5:{s:12:\"FileDateTime\";i:1617790615;s:8:\"FileSize\";i:2447;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";}s:25:\"embeddedMetaDataExtracted\";b:1;}',0,1),(23,4,'text','newfile_5.csv','/_default_upload_bucket/','text/csv',1617790669,1617790669,2,2,'a:0:{}',0,1),(24,4,'image','download (1).jpeg','/_default_upload_bucket/','image/jpeg',1617812702,1617812702,2,2,'a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:159;s:11:\"imageHeight\";i:159;s:16:\"embeddedMetaData\";a:5:{s:12:\"FileDateTime\";i:1617812702;s:8:\"FileSize\";i:3224;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";}s:25:\"embeddedMetaDataExtracted\";b:1;}',0,1);
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_metadata`
--

DROP TABLE IF EXISTS `assets_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_metadata` (
  `cid` int NOT NULL,
  `name` varchar(190) NOT NULL,
  `language` varchar(10) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `type` enum('input','textarea','asset','document','object','date','select','checkbox') DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`cid`,`name`,`language`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_metadata`
--

LOCK TABLES `assets_metadata` WRITE;
/*!40000 ALTER TABLE `assets_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `id` varchar(165) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `data` longblob,
  `mtime` int unsigned DEFAULT NULL,
  `expire` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('asset_1',_binary 's:574:\"O:26:\"Pimcore\\Model\\Asset\\Folder\":20:{s:7:\"\0*\0type\";s:6:\"folder\";s:5:\"\0*\0id\";i:1;s:11:\"\0*\0parentId\";i:0;s:11:\"\0*\0filename\";s:0:\"\";s:7:\"\0*\0path\";s:1:\"/\";s:11:\"\0*\0mimetype\";N;s:15:\"\0*\0creationDate\";i:1617206059;s:19:\"\0*\0modificationDate\";i:1617206059;s:12:\"\0*\0userOwner\";i:1;s:19:\"\0*\0userModification\";i:1;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:0:{}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:0;s:25:\"\0*\0__dataVersionTimestamp\";i:1617206059;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790302,1620209501),('asset_10',_binary 's:622:\"O:24:\"Pimcore\\Model\\Asset\\Text\":20:{s:7:\"\0*\0type\";s:4:\"text\";s:5:\"\0*\0id\";i:10;s:11:\"\0*\0parentId\";i:4;s:11:\"\0*\0filename\";s:13:\"newfile_4.csv\";s:7:\"\0*\0path\";s:24:\"/_default_upload_bucket/\";s:11:\"\0*\0mimetype\";s:8:\"text/csv\";s:15:\"\0*\0creationDate\";i:1617729061;s:19:\"\0*\0modificationDate\";i:1617729061;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:0:{}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617729061;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790307,1620209506),('asset_15',_binary 's:918:\"O:25:\"Pimcore\\Model\\Asset\\Image\":20:{s:7:\"\0*\0type\";s:5:\"image\";s:5:\"\0*\0id\";i:15;s:11:\"\0*\0parentId\";i:4;s:11:\"\0*\0filename\";s:14:\"electrical.jpg\";s:7:\"\0*\0path\";s:24:\"/_default_upload_bucket/\";s:11:\"\0*\0mimetype\";s:10:\"image/jpeg\";s:15:\"\0*\0creationDate\";i:1617730088;s:19:\"\0*\0modificationDate\";i:1617730088;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:1899;s:11:\"imageHeight\";i:938;s:16:\"embeddedMetaData\";a:5:{s:12:\"FileDateTime\";i:1617730088;s:8:\"FileSize\";i:63379;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";}s:25:\"embeddedMetaDataExtracted\";b:1;}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617730088;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790303,1620209502),('asset_19',_binary 's:900:\"O:25:\"Pimcore\\Model\\Asset\\Image\":20:{s:7:\"\0*\0type\";s:5:\"image\";s:5:\"\0*\0id\";i:19;s:11:\"\0*\0parentId\";i:2;s:11:\"\0*\0filename\";s:7:\"ac.jpeg\";s:7:\"\0*\0path\";s:16:\"/Digital assets/\";s:11:\"\0*\0mimetype\";s:10:\"image/jpeg\";s:15:\"\0*\0creationDate\";i:1617769316;s:19:\"\0*\0modificationDate\";i:1617769316;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:343;s:11:\"imageHeight\";i:147;s:16:\"embeddedMetaData\";a:5:{s:12:\"FileDateTime\";i:1617769316;s:8:\"FileSize\";i:4145;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";}s:25:\"embeddedMetaDataExtracted\";b:1;}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617769316;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790303,1620209502),('asset_2',_binary 's:589:\"O:26:\"Pimcore\\Model\\Asset\\Folder\":20:{s:7:\"\0*\0type\";s:6:\"folder\";s:5:\"\0*\0id\";i:2;s:11:\"\0*\0parentId\";i:1;s:11:\"\0*\0filename\";s:14:\"Digital assets\";s:7:\"\0*\0path\";s:1:\"/\";s:11:\"\0*\0mimetype\";N;s:15:\"\0*\0creationDate\";i:1617264005;s:19:\"\0*\0modificationDate\";i:1617366034;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:0:{}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617366034;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790302,1620209502),('asset_20',_binary 's:805:\"O:25:\"Pimcore\\Model\\Asset\\Image\":20:{s:7:\"\0*\0type\";s:5:\"image\";s:5:\"\0*\0id\";i:20;s:11:\"\0*\0parentId\";i:4;s:11:\"\0*\0filename\";s:39:\"Screenshot from 2021-03-16 15-16-10.png\";s:7:\"\0*\0path\";s:24:\"/_default_upload_bucket/\";s:11:\"\0*\0mimetype\";s:9:\"image/png\";s:15:\"\0*\0creationDate\";i:1617790140;s:19:\"\0*\0modificationDate\";i:1617790140;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:1366;s:11:\"imageHeight\";i:768;s:16:\"embeddedMetaData\";a:0:{}s:25:\"embeddedMetaDataExtracted\";b:1;}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617790140;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790303,1620209502),('asset_21',_binary 's:580:\"O:26:\"Pimcore\\Model\\Asset\\Folder\":20:{s:7:\"\0*\0type\";s:6:\"folder\";s:5:\"\0*\0id\";i:21;s:11:\"\0*\0parentId\";i:1;s:11:\"\0*\0filename\";s:5:\"image\";s:7:\"\0*\0path\";s:1:\"/\";s:11:\"\0*\0mimetype\";N;s:15:\"\0*\0creationDate\";i:1617790599;s:19:\"\0*\0modificationDate\";i:1617790599;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:0:{}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617790599;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790601,1620209801),('asset_22',_binary 's:898:\"O:25:\"Pimcore\\Model\\Asset\\Image\":20:{s:7:\"\0*\0type\";s:5:\"image\";s:5:\"\0*\0id\";i:22;s:11:\"\0*\0parentId\";i:21;s:11:\"\0*\0filename\";s:13:\"download.jpeg\";s:7:\"\0*\0path\";s:7:\"/image/\";s:11:\"\0*\0mimetype\";s:10:\"image/jpeg\";s:15:\"\0*\0creationDate\";i:1617790615;s:19:\"\0*\0modificationDate\";i:1617790615;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:225;s:11:\"imageHeight\";i:225;s:16:\"embeddedMetaData\";a:5:{s:12:\"FileDateTime\";i:1617790615;s:8:\"FileSize\";i:2447;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";}s:25:\"embeddedMetaDataExtracted\";b:1;}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617790615;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790616,1620209816),('asset_24',_binary 's:919:\"O:25:\"Pimcore\\Model\\Asset\\Image\":20:{s:7:\"\0*\0type\";s:5:\"image\";s:5:\"\0*\0id\";i:24;s:11:\"\0*\0parentId\";i:4;s:11:\"\0*\0filename\";s:17:\"download (1).jpeg\";s:7:\"\0*\0path\";s:24:\"/_default_upload_bucket/\";s:11:\"\0*\0mimetype\";s:10:\"image/jpeg\";s:15:\"\0*\0creationDate\";i:1617812702;s:19:\"\0*\0modificationDate\";i:1617812702;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:159;s:11:\"imageHeight\";i:159;s:16:\"embeddedMetaData\";a:5:{s:12:\"FileDateTime\";i:1617812702;s:8:\"FileSize\";i:3224;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";}s:25:\"embeddedMetaDataExtracted\";b:1;}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617812702;s:12:\"\0*\0_fulldump\";b:0;}\";',1617812703,1620231903),('asset_4',_binary 's:597:\"O:26:\"Pimcore\\Model\\Asset\\Folder\":20:{s:7:\"\0*\0type\";s:6:\"folder\";s:5:\"\0*\0id\";i:4;s:11:\"\0*\0parentId\";i:1;s:11:\"\0*\0filename\";s:22:\"_default_upload_bucket\";s:7:\"\0*\0path\";s:1:\"/\";s:11:\"\0*\0mimetype\";N;s:15:\"\0*\0creationDate\";i:1617512971;s:19:\"\0*\0modificationDate\";i:1617512971;s:12:\"\0*\0userOwner\";i:1;s:19:\"\0*\0userModification\";i:0;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:0:{}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617512971;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790303,1620209502),('asset_6',_binary 's:619:\"O:24:\"Pimcore\\Model\\Asset\\Text\":20:{s:7:\"\0*\0type\";s:4:\"text\";s:5:\"\0*\0id\";i:6;s:11:\"\0*\0parentId\";i:4;s:11:\"\0*\0filename\";s:11:\"newfile.csv\";s:7:\"\0*\0path\";s:24:\"/_default_upload_bucket/\";s:11:\"\0*\0mimetype\";s:8:\"text/csv\";s:15:\"\0*\0creationDate\";i:1617643726;s:19:\"\0*\0modificationDate\";i:1617643726;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:0:{}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617643726;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790306,1620209506),('asset_7',_binary 's:621:\"O:24:\"Pimcore\\Model\\Asset\\Text\":20:{s:7:\"\0*\0type\";s:4:\"text\";s:5:\"\0*\0id\";i:7;s:11:\"\0*\0parentId\";i:4;s:11:\"\0*\0filename\";s:13:\"newfile_1.csv\";s:7:\"\0*\0path\";s:24:\"/_default_upload_bucket/\";s:11:\"\0*\0mimetype\";s:8:\"text/csv\";s:15:\"\0*\0creationDate\";i:1617644652;s:19:\"\0*\0modificationDate\";i:1617644652;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:0:{}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617644652;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790306,1620209506),('asset_8',_binary 's:621:\"O:24:\"Pimcore\\Model\\Asset\\Text\":20:{s:7:\"\0*\0type\";s:4:\"text\";s:5:\"\0*\0id\";i:8;s:11:\"\0*\0parentId\";i:4;s:11:\"\0*\0filename\";s:13:\"newfile_2.csv\";s:7:\"\0*\0path\";s:24:\"/_default_upload_bucket/\";s:11:\"\0*\0mimetype\";s:8:\"text/csv\";s:15:\"\0*\0creationDate\";i:1617646260;s:19:\"\0*\0modificationDate\";i:1617646260;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:0:{}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617646260;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790306,1620209506),('asset_9',_binary 's:621:\"O:24:\"Pimcore\\Model\\Asset\\Text\":20:{s:7:\"\0*\0type\";s:4:\"text\";s:5:\"\0*\0id\";i:9;s:11:\"\0*\0parentId\";i:4;s:11:\"\0*\0filename\";s:13:\"newfile_3.csv\";s:7:\"\0*\0path\";s:24:\"/_default_upload_bucket/\";s:11:\"\0*\0mimetype\";s:8:\"text/csv\";s:15:\"\0*\0creationDate\";i:1617700788;s:19:\"\0*\0modificationDate\";i:1617700788;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:0:{}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617700788;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790306,1620209506),('document_1',_binary 's:886:\"O:27:\"Pimcore\\Model\\Document\\Page\":31:{s:8:\"\0*\0title\";s:0:\"\";s:14:\"\0*\0description\";s:0:\"\";s:11:\"\0*\0metaData\";a:0:{}s:7:\"\0*\0type\";s:4:\"page\";s:12:\"\0*\0prettyUrl\";N;s:17:\"\0*\0targetGroupIds\";s:0:\"\";s:9:\"\0*\0module\";N;s:13:\"\0*\0controller\";s:7:\"default\";s:9:\"\0*\0action\";s:7:\"default\";s:11:\"\0*\0template\";s:0:\"\";s:11:\"\0*\0elements\";N;s:12:\"\0*\0editables\";R:12;s:26:\"\0*\0contentMasterDocumentId\";N;s:24:\"\0*\0supportsContentMaster\";b:1;s:26:\"\0*\0missingRequiredEditable\";N;s:5:\"\0*\0id\";i:1;s:11:\"\0*\0parentId\";i:0;s:6:\"\0*\0key\";s:0:\"\";s:7:\"\0*\0path\";s:1:\"/\";s:8:\"\0*\0index\";i:999999;s:12:\"\0*\0published\";b:1;s:15:\"\0*\0creationDate\";i:1617206059;s:19:\"\0*\0modificationDate\";i:1617206059;s:12:\"\0*\0userOwner\";i:1;s:19:\"\0*\0userModification\";i:1;s:11:\"\0*\0siblings\";a:0:{}s:14:\"\0*\0hasSiblings\";a:0:{}s:9:\"\0*\0locked\";N;s:15:\"\0*\0versionCount\";i:0;s:25:\"\0*\0__dataVersionTimestamp\";i:1617206059;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790298,1620209498),('document_2',_binary 's:937:\"O:27:\"Pimcore\\Model\\Document\\Page\":31:{s:8:\"\0*\0title\";s:8:\"feedback\";s:14:\"\0*\0description\";s:0:\"\";s:11:\"\0*\0metaData\";a:0:{}s:7:\"\0*\0type\";s:4:\"page\";s:12:\"\0*\0prettyUrl\";N;s:17:\"\0*\0targetGroupIds\";s:0:\"\";s:9:\"\0*\0module\";s:9:\"AppBundle\";s:13:\"\0*\0controller\";s:7:\"Default\";s:9:\"\0*\0action\";s:7:\"default\";s:11:\"\0*\0template\";s:25:\"content/feedback.html.php\";s:11:\"\0*\0elements\";N;s:12:\"\0*\0editables\";R:12;s:26:\"\0*\0contentMasterDocumentId\";N;s:24:\"\0*\0supportsContentMaster\";b:1;s:26:\"\0*\0missingRequiredEditable\";N;s:5:\"\0*\0id\";i:2;s:11:\"\0*\0parentId\";i:1;s:6:\"\0*\0key\";s:8:\"feedback\";s:7:\"\0*\0path\";s:1:\"/\";s:8:\"\0*\0index\";i:1;s:12:\"\0*\0published\";b:1;s:15:\"\0*\0creationDate\";i:1617698680;s:19:\"\0*\0modificationDate\";i:1617698920;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0siblings\";a:0:{}s:14:\"\0*\0hasSiblings\";a:0:{}s:9:\"\0*\0locked\";N;s:15:\"\0*\0versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617698920;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790305,1620209504),('document_4',_binary 's:939:\"O:28:\"Pimcore\\Model\\Document\\Email\":32:{s:7:\"\0*\0type\";s:5:\"email\";s:10:\"\0*\0subject\";s:0:\"\";s:7:\"\0*\0from\";s:0:\"\";s:10:\"\0*\0replyTo\";s:0:\"\";s:5:\"\0*\0to\";s:0:\"\";s:5:\"\0*\0cc\";s:0:\"\";s:6:\"\0*\0bcc\";s:0:\"\";s:24:\"\0*\0supportsContentMaster\";b:0;s:9:\"\0*\0module\";s:9:\"AppBundle\";s:13:\"\0*\0controller\";s:7:\"Default\";s:9:\"\0*\0action\";s:7:\"default\";s:11:\"\0*\0template\";s:29:\"content/feedbackMail.html.php\";s:11:\"\0*\0elements\";N;s:12:\"\0*\0editables\";R:14;s:26:\"\0*\0contentMasterDocumentId\";N;s:26:\"\0*\0missingRequiredEditable\";N;s:5:\"\0*\0id\";i:4;s:11:\"\0*\0parentId\";i:1;s:6:\"\0*\0key\";s:12:\"feedbackMail\";s:7:\"\0*\0path\";s:1:\"/\";s:8:\"\0*\0index\";i:2;s:12:\"\0*\0published\";b:1;s:15:\"\0*\0creationDate\";i:1617700180;s:19:\"\0*\0modificationDate\";i:1617701039;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0siblings\";a:0:{}s:14:\"\0*\0hasSiblings\";a:0:{}s:9:\"\0*\0locked\";N;s:15:\"\0*\0versionCount\";i:5;s:25:\"\0*\0__dataVersionTimestamp\";i:1617701039;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790302,1620209502),('document_5',_binary 's:937:\"O:28:\"Pimcore\\Model\\Document\\Email\":32:{s:7:\"\0*\0type\";s:5:\"email\";s:10:\"\0*\0subject\";s:0:\"\";s:7:\"\0*\0from\";s:0:\"\";s:10:\"\0*\0replyTo\";s:0:\"\";s:5:\"\0*\0to\";s:0:\"\";s:5:\"\0*\0cc\";s:0:\"\";s:6:\"\0*\0bcc\";s:0:\"\";s:24:\"\0*\0supportsContentMaster\";b:0;s:9:\"\0*\0module\";s:9:\"AppBundle\";s:13:\"\0*\0controller\";s:7:\"Default\";s:9:\"\0*\0action\";s:7:\"default\";s:11:\"\0*\0template\";s:28:\"content/importEmail.html.php\";s:11:\"\0*\0elements\";N;s:12:\"\0*\0editables\";R:14;s:26:\"\0*\0contentMasterDocumentId\";N;s:26:\"\0*\0missingRequiredEditable\";N;s:5:\"\0*\0id\";i:5;s:11:\"\0*\0parentId\";i:1;s:6:\"\0*\0key\";s:11:\"importEmail\";s:7:\"\0*\0path\";s:1:\"/\";s:8:\"\0*\0index\";i:3;s:12:\"\0*\0published\";b:1;s:15:\"\0*\0creationDate\";i:1617700338;s:19:\"\0*\0modificationDate\";i:1617701032;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0siblings\";a:0:{}s:14:\"\0*\0hasSiblings\";a:0:{}s:9:\"\0*\0locked\";N;s:15:\"\0*\0versionCount\";i:5;s:25:\"\0*\0__dataVersionTimestamp\";i:1617701032;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790302,1620209502),('document_properties_1',_binary 's:6:\"a:0:{}\";',1617790299,1620209498),('document_properties_2',_binary 's:268:\"a:1:{s:15:\"navigation_name\";O:22:\"Pimcore\\Model\\Property\":8:{s:7:\"\0*\0name\";s:15:\"navigation_name\";s:7:\"\0*\0data\";s:8:\"feedback\";s:7:\"\0*\0type\";s:4:\"text\";s:8:\"\0*\0ctype\";s:8:\"document\";s:8:\"\0*\0cpath\";N;s:6:\"\0*\0cid\";i:2;s:14:\"\0*\0inheritable\";b:0;s:12:\"\0*\0inherited\";b:0;}}\";',1617790303,1620209502),('document_properties_4',_binary 's:6:\"a:0:{}\";',1617790303,1620209502),('document_properties_5',_binary 's:6:\"a:0:{}\";',1617790303,1620209502),('object_1',_binary 's:598:\"O:31:\"Pimcore\\Model\\DataObject\\Folder\":19:{s:9:\"\0*\0o_type\";s:6:\"folder\";s:7:\"\0*\0o_id\";i:1;s:13:\"\0*\0o_parentId\";i:0;s:8:\"\0*\0o_key\";s:0:\"\";s:9:\"\0*\0o_path\";s:1:\"/\";s:10:\"\0*\0o_index\";i:999999;s:17:\"\0*\0o_creationDate\";i:1617206059;s:21:\"\0*\0o_modificationDate\";i:1617206059;s:14:\"\0*\0o_userOwner\";i:1;s:21:\"\0*\0o_userModification\";i:1;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:0;s:25:\"\0*\0__dataVersionTimestamp\";i:1617206059;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790302,1620209501),('object_10',_binary 's:599:\"O:31:\"Pimcore\\Model\\DataObject\\Folder\":19:{s:9:\"\0*\0o_type\";s:6:\"folder\";s:7:\"\0*\0o_id\";i:10;s:13:\"\0*\0o_parentId\";i:1;s:8:\"\0*\0o_key\";s:5:\"brand\";s:9:\"\0*\0o_path\";s:1:\"/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617264471;s:21:\"\0*\0o_modificationDate\";i:1617264471;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617264471;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790303,1620209502),('object_11',_binary 's:751:\"O:30:\"Pimcore\\Model\\DataObject\\Brand\":24:{s:12:\"\0*\0o_classId\";s:5:\"brand\";s:14:\"\0*\0o_className\";s:5:\"brand\";s:7:\"\0*\0name\";s:2:\"LG\";s:20:\"\0*\0__rawRelationData\";a:0:{}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:11;s:13:\"\0*\0o_parentId\";i:10;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:2:\"LG\";s:9:\"\0*\0o_path\";s:7:\"/brand/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617264547;s:21:\"\0*\0o_modificationDate\";i:1617264554;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617264554;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790368,1620209568),('object_12',_binary 's:824:\"O:33:\"Pimcore\\Model\\DataObject\\Category\":27:{s:12:\"\0*\0o_classId\";s:8:\"category\";s:14:\"\0*\0o_className\";s:8:\"category\";s:7:\"\0*\0name\";s:3:\"Fan\";s:14:\"\0*\0description\";N;s:8:\"\0*\0image\";N;s:9:\"\0*\0active\";N;s:20:\"\0*\0__rawRelationData\";a:0:{}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:12;s:13:\"\0*\0o_parentId\";i:3;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:3:\"Fan\";s:9:\"\0*\0o_path\";s:10:\"/category/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617264936;s:21:\"\0*\0o_modificationDate\";i:1617264942;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617264942;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790370,1620209568),('object_13',_binary 's:844:\"O:33:\"Pimcore\\Model\\DataObject\\Category\":27:{s:12:\"\0*\0o_classId\";s:8:\"category\";s:14:\"\0*\0o_className\";s:8:\"category\";s:7:\"\0*\0name\";s:12:\"Refrigerator\";s:14:\"\0*\0description\";N;s:8:\"\0*\0image\";N;s:9:\"\0*\0active\";N;s:20:\"\0*\0__rawRelationData\";a:0:{}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:13;s:13:\"\0*\0o_parentId\";i:3;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:12:\"Refrigerator\";s:9:\"\0*\0o_path\";s:10:\"/category/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617265057;s:21:\"\0*\0o_modificationDate\";i:1617265068;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617265068;s:12:\"\0*\0_fulldump\";b:0;}\";',1617812622,1620231822),('object_14',_binary 's:761:\"O:30:\"Pimcore\\Model\\DataObject\\Brand\":24:{s:12:\"\0*\0o_classId\";s:5:\"brand\";s:14:\"\0*\0o_className\";s:5:\"brand\";s:7:\"\0*\0name\";s:7:\"Samsung\";s:20:\"\0*\0__rawRelationData\";a:0:{}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:14;s:13:\"\0*\0o_parentId\";i:10;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:7:\"Samsung\";s:9:\"\0*\0o_path\";s:7:\"/brand/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617365473;s:21:\"\0*\0o_modificationDate\";i:1617365483;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617365483;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790368,1620209568),('object_15',_binary 's:3617:\"O:32:\"Pimcore\\Model\\DataObject\\Product\":37:{s:12:\"\0*\0o_classId\";s:7:\"product\";s:14:\"\0*\0o_className\";s:7:\"product\";s:8:\"\0*\0brand\";s:7:\"Samsung\";s:10:\"\0*\0modelNo\";s:4:\"2345\";s:7:\"\0*\0name\";s:10:\"Lg sony Ac\";s:14:\"\0*\0description\";N;s:8:\"\0*\0price\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:20000;s:9:\"\0*\0unitId\";s:6:\"rupees\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:6:\"rupees\";s:12:\"abbreviation\";s:2:\"Rs\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:18:\"\0*\0quantityInStock\";i:3;s:9:\"\0*\0colour\";O:39:\"Pimcore\\Model\\DataObject\\Data\\RgbaColor\":7:{s:4:\"\0*\0r\";i:70;s:4:\"\0*\0g\";i:196;s:4:\"\0*\0b\";i:26;s:4:\"\0*\0a\";i:255;s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:8:\"\0*\0image\";N;s:9:\"\0*\0weight\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:3;s:9:\"\0*\0unitId\";s:2:\"kg\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:2:\"kg\";s:12:\"abbreviation\";s:2:\"kg\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:10:\"\0*\0ratings\";s:6:\"4 Star\";s:10:\"\0*\0voltage\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:220;s:9:\"\0*\0unitId\";N;s:7:\"\0*\0unit\";N;s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:10:\"\0*\0wattage\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:1.5;s:9:\"\0*\0unitId\";N;s:7:\"\0*\0unit\";N;s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:19:\"\0*\0specificFeatures\";O:49:\"Pimcore\\Model\\DataObject\\Product\\SpecificFeatures\":8:{s:15:\"\0*\0brickGetters\";a:4:{i:0;s:20:\"RefrigeratorFeatures\";i:1;s:10:\"AcFeatures\";i:2;s:11:\"FanFeatures\";i:3;s:14:\"GeyserFeatures\";}s:23:\"\0*\0RefrigeratorFeatures\";N;s:13:\"\0*\0AcFeatures\";O:52:\"Pimcore\\Model\\DataObject\\Objectbrick\\Data\\AcFeatures\":7:{s:7:\"\0*\0type\";s:10:\"AcFeatures\";s:11:\"\0*\0capacity\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:2;s:9:\"\0*\0unitId\";s:2:\"kg\";s:7:\"\0*\0unit\";r:37;s:9:\"\0*\0_owner\";r:65;s:13:\"\0*\0_fieldname\";s:8:\"capacity\";s:12:\"\0*\0_language\";N;}s:19:\"\0*\0installationType\";s:5:\"split\";s:12:\"\0*\0fieldname\";s:16:\"specificFeatures\";s:11:\"\0*\0doDelete\";N;s:11:\"\0*\0objectId\";i:15;s:12:\"\0*\0_fulldump\";b:0;}s:14:\"\0*\0FanFeatures\";N;s:17:\"\0*\0GeyserFeatures\";N;s:8:\"\0*\0items\";a:0:{}s:12:\"\0*\0fieldname\";s:16:\"specificFeatures\";s:11:\"\0*\0objectId\";i:15;}s:13:\"\0*\0launchDate\";O:13:\"Carbon\\Carbon\":3:{s:4:\"date\";s:26:\"2021-04-05 20:30:00.000000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:13:\"Europe/Berlin\";}s:20:\"\0*\0__rawRelationData\";a:1:{i:0;a:9:{s:2:\"id\";s:1:\"5\";s:6:\"src_id\";s:2:\"15\";s:7:\"dest_id\";s:1:\"8\";s:4:\"type\";s:6:\"object\";s:9:\"fieldname\";s:8:\"category\";s:5:\"index\";s:1:\"0\";s:9:\"ownertype\";s:6:\"object\";s:9:\"ownername\";s:0:\"\";s:8:\"position\";s:1:\"0\";}}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:15;s:13:\"\0*\0o_parentId\";i:4;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:4:\"sony\";s:9:\"\0*\0o_path\";s:9:\"/product/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617512858;s:21:\"\0*\0o_modificationDate\";i:1617619428;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:7;s:25:\"\0*\0__dataVersionTimestamp\";i:1617619428;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790368,1620209568),('object_16',_binary 's:600:\"O:31:\"Pimcore\\Model\\DataObject\\Folder\":19:{s:9:\"\0*\0o_type\";s:6:\"folder\";s:7:\"\0*\0o_id\";i:16;s:13:\"\0*\0o_parentId\";i:1;s:8:\"\0*\0o_key\";s:6:\"import\";s:9:\"\0*\0o_path\";s:1:\"/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617643105;s:21:\"\0*\0o_modificationDate\";i:1617643104;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617643104;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790303,1620209502),('object_18',_binary 's:4317:\"O:32:\"Pimcore\\Model\\DataObject\\Product\":37:{s:12:\"\0*\0o_classId\";s:7:\"product\";s:14:\"\0*\0o_className\";s:7:\"product\";s:8:\"\0*\0brand\";s:0:\"\";s:10:\"\0*\0modelNo\";s:3:\"abc\";s:7:\"\0*\0name\";s:11:\"FanFeatures\";s:14:\"\0*\0description\";s:11:\"description\";s:8:\"\0*\0price\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:100;s:9:\"\0*\0unitId\";s:6:\"rupees\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:6:\"rupees\";s:12:\"abbreviation\";s:2:\"Rs\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:18:\"\0*\0quantityInStock\";i:2;s:9:\"\0*\0colour\";O:39:\"Pimcore\\Model\\DataObject\\Data\\RgbaColor\":7:{s:4:\"\0*\0r\";i:0;s:4:\"\0*\0g\";i:0;s:4:\"\0*\0b\";i:0;s:4:\"\0*\0a\";i:255;s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:8:\"\0*\0image\";N;s:9:\"\0*\0weight\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:20;s:9:\"\0*\0unitId\";s:2:\"kg\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:2:\"kg\";s:12:\"abbreviation\";s:2:\"kg\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:10:\"\0*\0ratings\";s:6:\"5 Star\";s:10:\"\0*\0voltage\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:220;s:9:\"\0*\0unitId\";s:5:\"volts\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:5:\"volts\";s:12:\"abbreviation\";s:1:\"V\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:10:\"\0*\0wattage\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:10;s:9:\"\0*\0unitId\";s:4:\"watt\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:4:\"watt\";s:12:\"abbreviation\";s:1:\"W\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:19:\"\0*\0specificFeatures\";O:49:\"Pimcore\\Model\\DataObject\\Product\\SpecificFeatures\":8:{s:15:\"\0*\0brickGetters\";a:4:{i:0;s:20:\"RefrigeratorFeatures\";i:1;s:10:\"AcFeatures\";i:2;s:11:\"FanFeatures\";i:3;s:14:\"GeyserFeatures\";}s:23:\"\0*\0RefrigeratorFeatures\";N;s:13:\"\0*\0AcFeatures\";N;s:14:\"\0*\0FanFeatures\";O:53:\"Pimcore\\Model\\DataObject\\Objectbrick\\Data\\FanFeatures\":7:{s:7:\"\0*\0type\";s:11:\"FanFeatures\";s:8:\"\0*\0speed\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:20;s:9:\"\0*\0unitId\";s:5:\"speed\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:5:\"speed\";s:12:\"abbreviation\";s:3:\"Rpm\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";r:83;s:13:\"\0*\0_fieldname\";s:5:\"speed\";s:12:\"\0*\0_language\";N;}s:9:\"\0*\0blades\";i:4;s:12:\"\0*\0fieldname\";s:16:\"specificFeatures\";s:11:\"\0*\0doDelete\";N;s:11:\"\0*\0objectId\";i:18;s:12:\"\0*\0_fulldump\";b:0;}s:17:\"\0*\0GeyserFeatures\";N;s:8:\"\0*\0items\";a:0:{}s:12:\"\0*\0fieldname\";s:16:\"specificFeatures\";s:11:\"\0*\0objectId\";i:18;}s:13:\"\0*\0launchDate\";O:13:\"Carbon\\Carbon\":3:{s:4:\"date\";s:26:\"2021-05-27 00:00:00.000000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:13:\"Europe/Berlin\";}s:20:\"\0*\0__rawRelationData\";a:1:{i:0;a:9:{s:2:\"id\";s:1:\"6\";s:6:\"src_id\";s:2:\"18\";s:7:\"dest_id\";s:2:\"12\";s:4:\"type\";s:6:\"object\";s:9:\"fieldname\";s:8:\"category\";s:5:\"index\";s:1:\"0\";s:9:\"ownertype\";s:6:\"object\";s:9:\"ownername\";s:0:\"\";s:8:\"position\";s:1:\"0\";}}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:18;s:13:\"\0*\0o_parentId\";i:4;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:6:\"919101\";s:9:\"\0*\0o_path\";s:9:\"/product/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617646090;s:21:\"\0*\0o_modificationDate\";i:1617646090;s:14:\"\0*\0o_userOwner\";i:0;s:21:\"\0*\0o_userModification\";i:0;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617646090;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790369,1620209568),('object_19',_binary 's:4327:\"O:32:\"Pimcore\\Model\\DataObject\\Product\":37:{s:12:\"\0*\0o_classId\";s:7:\"product\";s:14:\"\0*\0o_className\";s:7:\"product\";s:8:\"\0*\0brand\";s:2:\"LG\";s:10:\"\0*\0modelNo\";s:3:\"abc\";s:7:\"\0*\0name\";s:11:\"FanFeatures\";s:14:\"\0*\0description\";s:11:\"description\";s:8:\"\0*\0price\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:100;s:9:\"\0*\0unitId\";s:6:\"rupees\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:6:\"rupees\";s:12:\"abbreviation\";s:2:\"Rs\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:18:\"\0*\0quantityInStock\";i:2;s:9:\"\0*\0colour\";O:39:\"Pimcore\\Model\\DataObject\\Data\\RgbaColor\":7:{s:4:\"\0*\0r\";i:0;s:4:\"\0*\0g\";i:0;s:4:\"\0*\0b\";i:0;s:4:\"\0*\0a\";i:255;s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:8:\"\0*\0image\";N;s:9:\"\0*\0weight\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:20;s:9:\"\0*\0unitId\";s:2:\"kg\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:2:\"kg\";s:12:\"abbreviation\";s:2:\"kg\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:10:\"\0*\0ratings\";s:6:\"5 Star\";s:10:\"\0*\0voltage\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:220;s:9:\"\0*\0unitId\";s:5:\"volts\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:5:\"volts\";s:12:\"abbreviation\";s:1:\"V\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:10:\"\0*\0wattage\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:10;s:9:\"\0*\0unitId\";s:4:\"watt\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:4:\"watt\";s:12:\"abbreviation\";s:1:\"W\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:19:\"\0*\0specificFeatures\";O:49:\"Pimcore\\Model\\DataObject\\Product\\SpecificFeatures\":8:{s:15:\"\0*\0brickGetters\";a:4:{i:0;s:20:\"RefrigeratorFeatures\";i:1;s:10:\"AcFeatures\";i:2;s:11:\"FanFeatures\";i:3;s:14:\"GeyserFeatures\";}s:23:\"\0*\0RefrigeratorFeatures\";N;s:13:\"\0*\0AcFeatures\";N;s:14:\"\0*\0FanFeatures\";O:53:\"Pimcore\\Model\\DataObject\\Objectbrick\\Data\\FanFeatures\":7:{s:7:\"\0*\0type\";s:11:\"FanFeatures\";s:8:\"\0*\0speed\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:20;s:9:\"\0*\0unitId\";s:5:\"speed\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:5:\"speed\";s:12:\"abbreviation\";s:3:\"Rpm\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";r:83;s:13:\"\0*\0_fieldname\";s:5:\"speed\";s:12:\"\0*\0_language\";N;}s:9:\"\0*\0blades\";i:4;s:12:\"\0*\0fieldname\";s:16:\"specificFeatures\";s:11:\"\0*\0doDelete\";N;s:11:\"\0*\0objectId\";i:19;s:12:\"\0*\0_fulldump\";b:0;}s:17:\"\0*\0GeyserFeatures\";N;s:8:\"\0*\0items\";a:0:{}s:12:\"\0*\0fieldname\";s:16:\"specificFeatures\";s:11:\"\0*\0objectId\";i:19;}s:13:\"\0*\0launchDate\";O:13:\"Carbon\\Carbon\":3:{s:4:\"date\";s:26:\"2021-05-27 00:00:00.000000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:13:\"Europe/Berlin\";}s:20:\"\0*\0__rawRelationData\";a:1:{i:0;a:9:{s:2:\"id\";s:1:\"7\";s:6:\"src_id\";s:2:\"19\";s:7:\"dest_id\";s:2:\"12\";s:4:\"type\";s:6:\"object\";s:9:\"fieldname\";s:8:\"category\";s:5:\"index\";s:1:\"0\";s:9:\"ownertype\";s:6:\"object\";s:9:\"ownername\";s:0:\"\";s:8:\"position\";s:1:\"0\";}}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:19;s:13:\"\0*\0o_parentId\";i:4;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:13:\"LG ka product\";s:9:\"\0*\0o_path\";s:9:\"/product/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617646268;s:21:\"\0*\0o_modificationDate\";i:1617646268;s:14:\"\0*\0o_userOwner\";i:0;s:21:\"\0*\0o_userModification\";i:0;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617646268;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790369,1620209568),('object_20',_binary 's:602:\"O:31:\"Pimcore\\Model\\DataObject\\Folder\":19:{s:9:\"\0*\0o_type\";s:6:\"folder\";s:7:\"\0*\0o_id\";i:20;s:13:\"\0*\0o_parentId\";i:1;s:8:\"\0*\0o_key\";s:8:\"feedback\";s:9:\"\0*\0o_path\";s:1:\"/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617699350;s:21:\"\0*\0o_modificationDate\";i:1617699350;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617699350;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790303,1620209502),('object_29',_binary 's:4335:\"O:32:\"Pimcore\\Model\\DataObject\\Product\":37:{s:12:\"\0*\0o_classId\";s:7:\"product\";s:14:\"\0*\0o_className\";s:7:\"product\";s:8:\"\0*\0brand\";s:2:\"LG\";s:10:\"\0*\0modelNo\";s:3:\"abc\";s:7:\"\0*\0name\";s:11:\"FanFeatures\";s:14:\"\0*\0description\";s:11:\"description\";s:8:\"\0*\0price\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:100;s:9:\"\0*\0unitId\";s:6:\"rupees\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:6:\"rupees\";s:12:\"abbreviation\";s:2:\"Rs\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:18:\"\0*\0quantityInStock\";i:2;s:9:\"\0*\0colour\";O:39:\"Pimcore\\Model\\DataObject\\Data\\RgbaColor\":7:{s:4:\"\0*\0r\";i:0;s:4:\"\0*\0g\";i:0;s:4:\"\0*\0b\";i:0;s:4:\"\0*\0a\";i:255;s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:8:\"\0*\0image\";N;s:9:\"\0*\0weight\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:20;s:9:\"\0*\0unitId\";s:2:\"kg\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:2:\"kg\";s:12:\"abbreviation\";s:2:\"kg\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:10:\"\0*\0ratings\";s:6:\"5 Star\";s:10:\"\0*\0voltage\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:220;s:9:\"\0*\0unitId\";s:5:\"volts\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:5:\"volts\";s:12:\"abbreviation\";s:1:\"V\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:10:\"\0*\0wattage\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:10;s:9:\"\0*\0unitId\";s:4:\"watt\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:4:\"watt\";s:12:\"abbreviation\";s:1:\"W\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:19:\"\0*\0specificFeatures\";O:49:\"Pimcore\\Model\\DataObject\\Product\\SpecificFeatures\":8:{s:15:\"\0*\0brickGetters\";a:4:{i:0;s:20:\"RefrigeratorFeatures\";i:1;s:10:\"AcFeatures\";i:2;s:11:\"FanFeatures\";i:3;s:14:\"GeyserFeatures\";}s:23:\"\0*\0RefrigeratorFeatures\";N;s:13:\"\0*\0AcFeatures\";N;s:14:\"\0*\0FanFeatures\";O:53:\"Pimcore\\Model\\DataObject\\Objectbrick\\Data\\FanFeatures\":7:{s:7:\"\0*\0type\";s:11:\"FanFeatures\";s:8:\"\0*\0speed\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:20;s:9:\"\0*\0unitId\";s:5:\"speed\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:5:\"speed\";s:12:\"abbreviation\";s:3:\"Rpm\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";r:83;s:13:\"\0*\0_fieldname\";s:5:\"speed\";s:12:\"\0*\0_language\";N;}s:9:\"\0*\0blades\";i:4;s:12:\"\0*\0fieldname\";s:16:\"specificFeatures\";s:11:\"\0*\0doDelete\";N;s:11:\"\0*\0objectId\";i:29;s:12:\"\0*\0_fulldump\";b:0;}s:17:\"\0*\0GeyserFeatures\";N;s:8:\"\0*\0items\";a:0:{}s:12:\"\0*\0fieldname\";s:16:\"specificFeatures\";s:11:\"\0*\0objectId\";i:29;}s:13:\"\0*\0launchDate\";O:13:\"Carbon\\Carbon\":3:{s:4:\"date\";s:26:\"2021-05-27 00:00:00.000000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:13:\"Europe/Berlin\";}s:20:\"\0*\0__rawRelationData\";a:1:{i:0;a:9:{s:2:\"id\";s:2:\"10\";s:6:\"src_id\";s:2:\"29\";s:7:\"dest_id\";s:2:\"12\";s:4:\"type\";s:6:\"object\";s:9:\"fieldname\";s:8:\"category\";s:5:\"index\";s:1:\"0\";s:9:\"ownertype\";s:6:\"object\";s:9:\"ownername\";s:0:\"\";s:8:\"position\";s:1:\"0\";}}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:29;s:13:\"\0*\0o_parentId\";i:4;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:20:\"LG ka product ek aur\";s:9:\"\0*\0o_path\";s:9:\"/product/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617700982;s:21:\"\0*\0o_modificationDate\";i:1617700982;s:14:\"\0*\0o_userOwner\";i:0;s:21:\"\0*\0o_userModification\";i:0;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617700982;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790370,1620209568),('object_3',_binary 's:601:\"O:31:\"Pimcore\\Model\\DataObject\\Folder\":19:{s:9:\"\0*\0o_type\";s:6:\"folder\";s:7:\"\0*\0o_id\";i:3;s:13:\"\0*\0o_parentId\";i:1;s:8:\"\0*\0o_key\";s:8:\"category\";s:9:\"\0*\0o_path\";s:1:\"/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617209699;s:21:\"\0*\0o_modificationDate\";i:1617209699;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617209699;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790303,1620209502),('object_30',_binary 's:597:\"O:31:\"Pimcore\\Model\\DataObject\\Folder\":19:{s:9:\"\0*\0o_type\";s:6:\"folder\";s:7:\"\0*\0o_id\";i:30;s:13:\"\0*\0o_parentId\";i:1;s:8:\"\0*\0o_key\";s:3:\"log\";s:9:\"\0*\0o_path\";s:1:\"/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617728533;s:21:\"\0*\0o_modificationDate\";i:1617728533;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617728533;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790304,1620209502),('object_33',_binary 's:4336:\"O:32:\"Pimcore\\Model\\DataObject\\Product\":37:{s:12:\"\0*\0o_classId\";s:7:\"product\";s:14:\"\0*\0o_className\";s:7:\"product\";s:8:\"\0*\0brand\";s:2:\"LG\";s:10:\"\0*\0modelNo\";s:3:\"abc\";s:7:\"\0*\0name\";s:11:\"FanFeatures\";s:14:\"\0*\0description\";s:11:\"description\";s:8:\"\0*\0price\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:100;s:9:\"\0*\0unitId\";s:6:\"rupees\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:6:\"rupees\";s:12:\"abbreviation\";s:2:\"Rs\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:18:\"\0*\0quantityInStock\";i:2;s:9:\"\0*\0colour\";O:39:\"Pimcore\\Model\\DataObject\\Data\\RgbaColor\":7:{s:4:\"\0*\0r\";i:0;s:4:\"\0*\0g\";i:0;s:4:\"\0*\0b\";i:0;s:4:\"\0*\0a\";i:255;s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:8:\"\0*\0image\";N;s:9:\"\0*\0weight\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:20;s:9:\"\0*\0unitId\";s:2:\"kg\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:2:\"kg\";s:12:\"abbreviation\";s:2:\"kg\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:10:\"\0*\0ratings\";s:6:\"5 Star\";s:10:\"\0*\0voltage\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:220;s:9:\"\0*\0unitId\";s:5:\"volts\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:5:\"volts\";s:12:\"abbreviation\";s:1:\"V\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:10:\"\0*\0wattage\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:10;s:9:\"\0*\0unitId\";s:4:\"watt\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:4:\"watt\";s:12:\"abbreviation\";s:1:\"W\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:19:\"\0*\0specificFeatures\";O:49:\"Pimcore\\Model\\DataObject\\Product\\SpecificFeatures\":8:{s:15:\"\0*\0brickGetters\";a:4:{i:0;s:20:\"RefrigeratorFeatures\";i:1;s:10:\"AcFeatures\";i:2;s:11:\"FanFeatures\";i:3;s:14:\"GeyserFeatures\";}s:23:\"\0*\0RefrigeratorFeatures\";N;s:13:\"\0*\0AcFeatures\";N;s:14:\"\0*\0FanFeatures\";O:53:\"Pimcore\\Model\\DataObject\\Objectbrick\\Data\\FanFeatures\":7:{s:7:\"\0*\0type\";s:11:\"FanFeatures\";s:8:\"\0*\0speed\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:20;s:9:\"\0*\0unitId\";s:5:\"speed\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:5:\"speed\";s:12:\"abbreviation\";s:3:\"Rpm\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";r:83;s:13:\"\0*\0_fieldname\";s:5:\"speed\";s:12:\"\0*\0_language\";N;}s:9:\"\0*\0blades\";i:4;s:12:\"\0*\0fieldname\";s:16:\"specificFeatures\";s:11:\"\0*\0doDelete\";N;s:11:\"\0*\0objectId\";i:33;s:12:\"\0*\0_fulldump\";b:0;}s:17:\"\0*\0GeyserFeatures\";N;s:8:\"\0*\0items\";a:0:{}s:12:\"\0*\0fieldname\";s:16:\"specificFeatures\";s:11:\"\0*\0objectId\";i:33;}s:13:\"\0*\0launchDate\";O:13:\"Carbon\\Carbon\":3:{s:4:\"date\";s:26:\"2021-05-27 00:00:00.000000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:13:\"Europe/Berlin\";}s:20:\"\0*\0__rawRelationData\";a:1:{i:0;a:9:{s:2:\"id\";s:2:\"12\";s:6:\"src_id\";s:2:\"33\";s:7:\"dest_id\";s:2:\"12\";s:4:\"type\";s:6:\"object\";s:9:\"fieldname\";s:8:\"category\";s:5:\"index\";s:1:\"0\";s:9:\"ownertype\";s:6:\"object\";s:9:\"ownername\";s:0:\"\";s:8:\"position\";s:1:\"0\";}}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:33;s:13:\"\0*\0o_parentId\";i:4;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:21:\"LG ka product ek aurs\";s:9:\"\0*\0o_path\";s:9:\"/product/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617729365;s:21:\"\0*\0o_modificationDate\";i:1617729365;s:14:\"\0*\0o_userOwner\";i:0;s:21:\"\0*\0o_userModification\";i:0;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617729365;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790370,1620209568),('object_34',_binary 's:794:\"O:28:\"Pimcore\\Model\\DataObject\\Log\":24:{s:12:\"\0*\0o_classId\";s:3:\"log\";s:14:\"\0*\0o_className\";s:3:\"log\";s:10:\"\0*\0message\";s:28:\"Data Imported Successfully.\n\";s:20:\"\0*\0__rawRelationData\";a:0:{}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:34;s:13:\"\0*\0o_parentId\";i:30;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:21:\"LG ka product ek aurs\";s:9:\"\0*\0o_path\";s:5:\"/log/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617729365;s:21:\"\0*\0o_modificationDate\";i:1617729365;s:14:\"\0*\0o_userOwner\";i:0;s:21:\"\0*\0o_userModification\";i:0;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617729365;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790842,1620210042),('object_35',_binary 's:5269:\"O:32:\"Pimcore\\Model\\DataObject\\Product\":37:{s:12:\"\0*\0o_classId\";s:7:\"product\";s:14:\"\0*\0o_className\";s:7:\"product\";s:8:\"\0*\0brand\";s:2:\"LG\";s:10:\"\0*\0modelNo\";s:3:\"abc\";s:7:\"\0*\0name\";s:11:\"FanFeatures\";s:14:\"\0*\0description\";s:11:\"description\";s:8:\"\0*\0price\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:100;s:9:\"\0*\0unitId\";s:6:\"rupees\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:6:\"rupees\";s:12:\"abbreviation\";s:2:\"Rs\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:18:\"\0*\0quantityInStock\";i:2;s:9:\"\0*\0colour\";O:39:\"Pimcore\\Model\\DataObject\\Data\\RgbaColor\":7:{s:4:\"\0*\0r\";i:0;s:4:\"\0*\0g\";i:0;s:4:\"\0*\0b\";i:0;s:4:\"\0*\0a\";i:255;s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:8:\"\0*\0image\";O:25:\"Pimcore\\Model\\Asset\\Image\":21:{s:7:\"\0*\0type\";s:5:\"image\";s:5:\"\0*\0id\";i:22;s:11:\"\0*\0parentId\";i:21;s:11:\"\0*\0filename\";s:13:\"download.jpeg\";s:7:\"\0*\0path\";s:7:\"/image/\";s:11:\"\0*\0mimetype\";s:10:\"image/jpeg\";s:15:\"\0*\0creationDate\";i:1617790615;s:19:\"\0*\0modificationDate\";i:1617790615;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:225;s:11:\"imageHeight\";i:225;s:16:\"embeddedMetaData\";a:5:{s:12:\"FileDateTime\";i:1617790615;s:8:\"FileSize\";i:2447;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";}s:25:\"embeddedMetaDataExtracted\";b:1;}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617790615;s:12:\"\0*\0_fulldump\";b:0;s:24:\"____pimcore_cache_item__\";s:8:\"asset_22\";}s:9:\"\0*\0weight\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:20;s:9:\"\0*\0unitId\";s:2:\"kg\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:2:\"kg\";s:12:\"abbreviation\";s:2:\"kg\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:10:\"\0*\0ratings\";s:6:\"5 Star\";s:10:\"\0*\0voltage\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:220;s:9:\"\0*\0unitId\";s:5:\"volts\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:5:\"volts\";s:12:\"abbreviation\";s:1:\"V\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:10:\"\0*\0wattage\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:10;s:9:\"\0*\0unitId\";s:4:\"watt\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:4:\"watt\";s:12:\"abbreviation\";s:1:\"W\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:19:\"\0*\0specificFeatures\";O:49:\"Pimcore\\Model\\DataObject\\Product\\SpecificFeatures\":8:{s:15:\"\0*\0brickGetters\";a:4:{i:0;s:20:\"RefrigeratorFeatures\";i:1;s:10:\"AcFeatures\";i:2;s:11:\"FanFeatures\";i:3;s:14:\"GeyserFeatures\";}s:23:\"\0*\0RefrigeratorFeatures\";N;s:13:\"\0*\0AcFeatures\";N;s:14:\"\0*\0FanFeatures\";O:53:\"Pimcore\\Model\\DataObject\\Objectbrick\\Data\\FanFeatures\":7:{s:7:\"\0*\0type\";s:11:\"FanFeatures\";s:8:\"\0*\0speed\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:20;s:9:\"\0*\0unitId\";s:5:\"speed\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:5:\"speed\";s:12:\"abbreviation\";s:3:\"Rpm\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";r:114;s:13:\"\0*\0_fieldname\";s:5:\"speed\";s:12:\"\0*\0_language\";N;}s:9:\"\0*\0blades\";i:4;s:12:\"\0*\0fieldname\";s:16:\"specificFeatures\";s:11:\"\0*\0doDelete\";N;s:11:\"\0*\0objectId\";i:35;s:12:\"\0*\0_fulldump\";b:0;}s:17:\"\0*\0GeyserFeatures\";N;s:8:\"\0*\0items\";a:0:{}s:12:\"\0*\0fieldname\";s:16:\"specificFeatures\";s:11:\"\0*\0objectId\";i:35;}s:13:\"\0*\0launchDate\";O:13:\"Carbon\\Carbon\":3:{s:4:\"date\";s:26:\"2021-05-27 00:00:00.000000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:13:\"Europe/Berlin\";}s:20:\"\0*\0__rawRelationData\";a:1:{i:0;a:9:{s:2:\"id\";s:2:\"13\";s:6:\"src_id\";s:2:\"35\";s:7:\"dest_id\";s:2:\"12\";s:4:\"type\";s:6:\"object\";s:9:\"fieldname\";s:8:\"category\";s:5:\"index\";s:1:\"0\";s:9:\"ownertype\";s:6:\"object\";s:9:\"ownername\";s:0:\"\";s:8:\"position\";s:1:\"0\";}}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:35;s:13:\"\0*\0o_parentId\";i:4;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:10:\"samsung Ac\";s:9:\"\0*\0o_path\";s:9:\"/product/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617790797;s:21:\"\0*\0o_modificationDate\";i:1617790797;s:14:\"\0*\0o_userOwner\";i:0;s:21:\"\0*\0o_userModification\";i:0;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617790797;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790818,1620210017),('object_36',_binary 's:783:\"O:28:\"Pimcore\\Model\\DataObject\\Log\":24:{s:12:\"\0*\0o_classId\";s:3:\"log\";s:14:\"\0*\0o_className\";s:3:\"log\";s:10:\"\0*\0message\";s:28:\"Data Imported Successfully.\n\";s:20:\"\0*\0__rawRelationData\";a:0:{}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:36;s:13:\"\0*\0o_parentId\";i:30;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:10:\"samsung Ac\";s:9:\"\0*\0o_path\";s:5:\"/log/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617790797;s:21:\"\0*\0o_modificationDate\";i:1617790797;s:14:\"\0*\0o_userOwner\";i:0;s:21:\"\0*\0o_userModification\";i:0;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617790797;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790842,1620210042),('object_37',_binary 's:2980:\"O:32:\"Pimcore\\Model\\DataObject\\Product\":37:{s:12:\"\0*\0o_classId\";s:7:\"product\";s:14:\"\0*\0o_className\";s:7:\"product\";s:8:\"\0*\0brand\";s:7:\"havells\";s:10:\"\0*\0modelNo\";s:7:\"a209378\";s:7:\"\0*\0name\";s:14:\"havells geyser\";s:14:\"\0*\0description\";s:15:\"great capactity\";s:8:\"\0*\0price\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:2250;s:9:\"\0*\0unitId\";N;s:7:\"\0*\0unit\";N;s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:18:\"\0*\0quantityInStock\";N;s:9:\"\0*\0colour\";N;s:8:\"\0*\0image\";O:25:\"Pimcore\\Model\\Asset\\Image\":21:{s:7:\"\0*\0type\";s:5:\"image\";s:5:\"\0*\0id\";i:24;s:11:\"\0*\0parentId\";i:4;s:11:\"\0*\0filename\";s:17:\"download (1).jpeg\";s:7:\"\0*\0path\";s:24:\"/_default_upload_bucket/\";s:11:\"\0*\0mimetype\";s:10:\"image/jpeg\";s:15:\"\0*\0creationDate\";i:1617812702;s:19:\"\0*\0modificationDate\";i:1617812702;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:159;s:11:\"imageHeight\";i:159;s:16:\"embeddedMetaData\";a:5:{s:12:\"FileDateTime\";i:1617812702;s:8:\"FileSize\";i:3224;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";}s:25:\"embeddedMetaDataExtracted\";b:1;}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1617812702;s:12:\"\0*\0_fulldump\";b:0;s:24:\"____pimcore_cache_item__\";s:8:\"asset_24\";}s:9:\"\0*\0weight\";N;s:10:\"\0*\0ratings\";s:0:\"\";s:10:\"\0*\0voltage\";N;s:10:\"\0*\0wattage\";N;s:19:\"\0*\0specificFeatures\";O:49:\"Pimcore\\Model\\DataObject\\Product\\SpecificFeatures\":8:{s:15:\"\0*\0brickGetters\";a:4:{i:0;s:20:\"RefrigeratorFeatures\";i:1;s:10:\"AcFeatures\";i:2;s:11:\"FanFeatures\";i:3;s:14:\"GeyserFeatures\";}s:23:\"\0*\0RefrigeratorFeatures\";N;s:13:\"\0*\0AcFeatures\";N;s:14:\"\0*\0FanFeatures\";N;s:17:\"\0*\0GeyserFeatures\";N;s:8:\"\0*\0items\";a:0:{}s:12:\"\0*\0fieldname\";s:16:\"specificFeatures\";s:11:\"\0*\0objectId\";i:37;}s:13:\"\0*\0launchDate\";O:13:\"Carbon\\Carbon\":3:{s:4:\"date\";s:26:\"2021-04-07 20:30:00.000000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:13:\"Europe/Berlin\";}s:20:\"\0*\0__rawRelationData\";a:1:{i:0;a:9:{s:2:\"id\";s:2:\"14\";s:6:\"src_id\";s:2:\"37\";s:7:\"dest_id\";s:2:\"39\";s:4:\"type\";s:6:\"object\";s:9:\"fieldname\";s:8:\"category\";s:5:\"index\";s:1:\"0\";s:9:\"ownertype\";s:6:\"object\";s:9:\"ownername\";s:0:\"\";s:8:\"position\";s:1:\"0\";}}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:37;s:13:\"\0*\0o_parentId\";i:4;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:14:\"havells geyser\";s:9:\"\0*\0o_path\";s:9:\"/product/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617812542;s:21:\"\0*\0o_modificationDate\";i:1617812723;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617812723;s:12:\"\0*\0_fulldump\";b:0;}\";',1617812725,1620231924),('object_38',_binary 's:761:\"O:30:\"Pimcore\\Model\\DataObject\\Brand\":24:{s:12:\"\0*\0o_classId\";s:5:\"brand\";s:14:\"\0*\0o_className\";s:5:\"brand\";s:7:\"\0*\0name\";s:7:\"havells\";s:20:\"\0*\0__rawRelationData\";a:0:{}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:38;s:13:\"\0*\0o_parentId\";i:10;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:7:\"havells\";s:9:\"\0*\0o_path\";s:7:\"/brand/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617812566;s:21:\"\0*\0o_modificationDate\";i:1617812574;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617812574;s:12:\"\0*\0_fulldump\";b:0;}\";',1617812576,1620231775),('object_39',_binary 's:839:\"O:33:\"Pimcore\\Model\\DataObject\\Category\":27:{s:12:\"\0*\0o_classId\";s:8:\"category\";s:14:\"\0*\0o_className\";s:8:\"category\";s:7:\"\0*\0name\";s:6:\"geyser\";s:14:\"\0*\0description\";s:4:\"name\";s:8:\"\0*\0image\";N;s:9:\"\0*\0active\";N;s:20:\"\0*\0__rawRelationData\";a:0:{}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:39;s:13:\"\0*\0o_parentId\";i:3;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:6:\"geyser\";s:9:\"\0*\0o_path\";s:10:\"/category/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617812633;s:21:\"\0*\0o_modificationDate\";i:1617812647;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617812647;s:12:\"\0*\0_fulldump\";b:0;}\";',1617812648,1620231848),('object_4',_binary 's:600:\"O:31:\"Pimcore\\Model\\DataObject\\Folder\":19:{s:9:\"\0*\0o_type\";s:6:\"folder\";s:7:\"\0*\0o_id\";i:4;s:13:\"\0*\0o_parentId\";i:1;s:8:\"\0*\0o_key\";s:7:\"product\";s:9:\"\0*\0o_path\";s:1:\"/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617209706;s:21:\"\0*\0o_modificationDate\";i:1617209706;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617209706;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790304,1620209502),('object_8',_binary 's:983:\"O:33:\"Pimcore\\Model\\DataObject\\Category\":27:{s:12:\"\0*\0o_classId\";s:8:\"category\";s:14:\"\0*\0o_className\";s:8:\"category\";s:7:\"\0*\0name\";s:2:\"AC\";s:14:\"\0*\0description\";s:153:\"A system for controlling the humidity, ventilation, and temperature in a building or vehicle, typically to maintain a cool atmosphere in warm conditions.\";s:8:\"\0*\0image\";N;s:9:\"\0*\0active\";b:1;s:20:\"\0*\0__rawRelationData\";a:0:{}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:8;s:13:\"\0*\0o_parentId\";i:3;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:2:\"AC\";s:9:\"\0*\0o_path\";s:10:\"/category/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617264289;s:21:\"\0*\0o_modificationDate\";i:1617264380;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:3;s:25:\"\0*\0__dataVersionTimestamp\";i:1617264380;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790370,1620209568),('object_9',_binary 's:4402:\"O:32:\"Pimcore\\Model\\DataObject\\Product\":37:{s:12:\"\0*\0o_classId\";s:7:\"product\";s:14:\"\0*\0o_className\";s:7:\"product\";s:8:\"\0*\0brand\";s:2:\"LG\";s:10:\"\0*\0modelNo\";s:3:\"abc\";s:7:\"\0*\0name\";s:50:\"LG 1.5 Ton 5-Star Inverter Split AC – KS-Q18YNZA\";s:14:\"\0*\0description\";N;s:8:\"\0*\0price\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:101;s:9:\"\0*\0unitId\";s:6:\"rupees\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:6:\"rupees\";s:12:\"abbreviation\";s:2:\"Rs\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:18:\"\0*\0quantityInStock\";i:5;s:9:\"\0*\0colour\";O:39:\"Pimcore\\Model\\DataObject\\Data\\RgbaColor\":7:{s:4:\"\0*\0r\";i:253;s:4:\"\0*\0g\";i:8;s:4:\"\0*\0b\";i:8;s:4:\"\0*\0a\";i:255;s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:8:\"\0*\0image\";N;s:9:\"\0*\0weight\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:100;s:9:\"\0*\0unitId\";s:2:\"kg\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:2:\"kg\";s:12:\"abbreviation\";s:2:\"kg\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:10:\"\0*\0ratings\";s:6:\"5 Star\";s:10:\"\0*\0voltage\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:1;s:9:\"\0*\0unitId\";s:5:\"volts\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:5:\"volts\";s:12:\"abbreviation\";s:1:\"V\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:10:\"\0*\0wattage\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:1;s:9:\"\0*\0unitId\";s:4:\"watt\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:4:\"watt\";s:12:\"abbreviation\";s:1:\"W\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:19:\"\0*\0specificFeatures\";O:49:\"Pimcore\\Model\\DataObject\\Product\\SpecificFeatures\":8:{s:15:\"\0*\0brickGetters\";a:4:{i:0;s:20:\"RefrigeratorFeatures\";i:1;s:10:\"AcFeatures\";i:2;s:11:\"FanFeatures\";i:3;s:14:\"GeyserFeatures\";}s:23:\"\0*\0RefrigeratorFeatures\";N;s:13:\"\0*\0AcFeatures\";O:52:\"Pimcore\\Model\\DataObject\\Objectbrick\\Data\\AcFeatures\":7:{s:7:\"\0*\0type\";s:10:\"AcFeatures\";s:11:\"\0*\0capacity\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:1;s:9:\"\0*\0unitId\";s:3:\"ton\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:3:\"ton\";s:12:\"abbreviation\";s:4:\"ton \";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";r:83;s:13:\"\0*\0_fieldname\";s:8:\"capacity\";s:12:\"\0*\0_language\";N;}s:19:\"\0*\0installationType\";s:5:\"split\";s:12:\"\0*\0fieldname\";s:16:\"specificFeatures\";s:11:\"\0*\0doDelete\";N;s:11:\"\0*\0objectId\";i:9;s:12:\"\0*\0_fulldump\";b:0;}s:14:\"\0*\0FanFeatures\";N;s:17:\"\0*\0GeyserFeatures\";N;s:8:\"\0*\0items\";a:0:{}s:12:\"\0*\0fieldname\";s:16:\"specificFeatures\";s:11:\"\0*\0objectId\";i:9;}s:13:\"\0*\0launchDate\";O:13:\"Carbon\\Carbon\":3:{s:4:\"date\";s:26:\"2021-04-02 20:30:00.000000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:13:\"Europe/Berlin\";}s:20:\"\0*\0__rawRelationData\";a:1:{i:0;a:9:{s:2:\"id\";s:1:\"4\";s:6:\"src_id\";s:1:\"9\";s:7:\"dest_id\";s:1:\"8\";s:4:\"type\";s:6:\"object\";s:9:\"fieldname\";s:8:\"category\";s:5:\"index\";s:1:\"0\";s:9:\"ownertype\";s:6:\"object\";s:9:\"ownername\";s:0:\"\";s:8:\"position\";s:1:\"0\";}}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:9;s:13:\"\0*\0o_parentId\";i:4;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:50:\"LG 1.5 Ton 5-Star Inverter Split AC – KS-Q18YNZA\";s:9:\"\0*\0o_path\";s:9:\"/product/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1617264399;s:21:\"\0*\0o_modificationDate\";i:1617367307;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:6;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:13;s:25:\"\0*\0__dataVersionTimestamp\";i:1617367307;s:12:\"\0*\0_fulldump\";b:0;}\";',1617790368,1620209568),('quantityvalue_units_table',_binary 's:1967:\"a:8:{s:6:\"dollar\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:6:\"dollar\";s:12:\"abbreviation\";s:1:\"$\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:2:\"gm\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:2:\"gm\";s:12:\"abbreviation\";s:1:\"g\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:2:\"kg\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:2:\"kg\";s:12:\"abbreviation\";s:2:\"kg\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:5:\"speed\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:5:\"speed\";s:12:\"abbreviation\";s:3:\"Rpm\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:6:\"rupees\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:6:\"rupees\";s:12:\"abbreviation\";s:2:\"Rs\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:3:\"ton\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:3:\"ton\";s:12:\"abbreviation\";s:4:\"ton \";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:5:\"volts\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:5:\"volts\";s:12:\"abbreviation\";s:1:\"V\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:4:\"watt\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:4:\"watt\";s:12:\"abbreviation\";s:1:\"W\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}}\";',1617790300,1620209500),('site_domain_ef3d53ccb1590e6c44140f57feae89c9',_binary 's:13:\"s:6:\"failed\";\";',1617790298,1620209496),('system_resource_columns_edit_lock',_binary 's:101:\"a:6:{i:0;s:2:\"id\";i:1;s:3:\"cid\";i:2;s:5:\"ctype\";i:3;s:6:\"userId\";i:4;s:9:\"sessionId\";i:5;s:4:\"date\";}\";',1617790304,1620209504),('system_route_redirect',_binary 's:6:\"a:0:{}\";',1617790297,1620209497),('system_supported_locales_en',_binary 's:26248:\"a:751:{s:2:\"af\";s:9:\"Afrikaans\";s:5:\"af_NA\";s:19:\"Afrikaans (Namibia)\";s:5:\"af_ZA\";s:24:\"Afrikaans (South Africa)\";s:3:\"agq\";s:5:\"Aghem\";s:6:\"agq_CM\";s:16:\"Aghem (Cameroon)\";s:2:\"ak\";s:4:\"Akan\";s:5:\"ak_GH\";s:12:\"Akan (Ghana)\";s:2:\"sq\";s:8:\"Albanian\";s:5:\"sq_AL\";s:18:\"Albanian (Albania)\";s:5:\"sq_XK\";s:17:\"Albanian (Kosovo)\";s:5:\"sq_MK\";s:26:\"Albanian (North Macedonia)\";s:2:\"am\";s:7:\"Amharic\";s:5:\"am_ET\";s:18:\"Amharic (Ethiopia)\";s:2:\"ar\";s:6:\"Arabic\";s:5:\"ar_DZ\";s:16:\"Arabic (Algeria)\";s:5:\"ar_BH\";s:16:\"Arabic (Bahrain)\";s:5:\"ar_TD\";s:13:\"Arabic (Chad)\";s:5:\"ar_KM\";s:16:\"Arabic (Comoros)\";s:5:\"ar_DJ\";s:17:\"Arabic (Djibouti)\";s:5:\"ar_EG\";s:14:\"Arabic (Egypt)\";s:5:\"ar_ER\";s:16:\"Arabic (Eritrea)\";s:5:\"ar_IQ\";s:13:\"Arabic (Iraq)\";s:5:\"ar_IL\";s:15:\"Arabic (Israel)\";s:5:\"ar_JO\";s:15:\"Arabic (Jordan)\";s:5:\"ar_KW\";s:15:\"Arabic (Kuwait)\";s:5:\"ar_LB\";s:16:\"Arabic (Lebanon)\";s:5:\"ar_LY\";s:14:\"Arabic (Libya)\";s:5:\"ar_MR\";s:19:\"Arabic (Mauritania)\";s:5:\"ar_MA\";s:16:\"Arabic (Morocco)\";s:5:\"ar_OM\";s:13:\"Arabic (Oman)\";s:5:\"ar_PS\";s:32:\"Arabic (Palestinian Territories)\";s:5:\"ar_QA\";s:14:\"Arabic (Qatar)\";s:5:\"ar_SA\";s:21:\"Arabic (Saudi Arabia)\";s:5:\"ar_SO\";s:16:\"Arabic (Somalia)\";s:5:\"ar_SS\";s:20:\"Arabic (South Sudan)\";s:5:\"ar_SD\";s:14:\"Arabic (Sudan)\";s:5:\"ar_SY\";s:14:\"Arabic (Syria)\";s:5:\"ar_TN\";s:16:\"Arabic (Tunisia)\";s:5:\"ar_AE\";s:29:\"Arabic (United Arab Emirates)\";s:5:\"ar_EH\";s:23:\"Arabic (Western Sahara)\";s:6:\"ar_001\";s:14:\"Arabic (World)\";s:5:\"ar_YE\";s:14:\"Arabic (Yemen)\";s:2:\"hy\";s:8:\"Armenian\";s:5:\"hy_AM\";s:18:\"Armenian (Armenia)\";s:2:\"as\";s:8:\"Assamese\";s:5:\"as_IN\";s:16:\"Assamese (India)\";s:3:\"ast\";s:8:\"Asturian\";s:6:\"ast_ES\";s:16:\"Asturian (Spain)\";s:3:\"asa\";s:3:\"Asu\";s:6:\"asa_TZ\";s:14:\"Asu (Tanzania)\";s:2:\"az\";s:11:\"Azerbaijani\";s:7:\"az_Latn\";s:11:\"Azerbaijani\";s:7:\"az_Cyrl\";s:11:\"Azerbaijani\";s:10:\"az_Latn_AZ\";s:24:\"Azerbaijani (Azerbaijan)\";s:10:\"az_Cyrl_AZ\";s:24:\"Azerbaijani (Azerbaijan)\";s:3:\"ksf\";s:5:\"Bafia\";s:6:\"ksf_CM\";s:16:\"Bafia (Cameroon)\";s:2:\"bm\";s:7:\"Bambara\";s:5:\"bm_ML\";s:14:\"Bambara (Mali)\";s:2:\"bn\";s:6:\"Bangla\";s:5:\"bn_BD\";s:19:\"Bangla (Bangladesh)\";s:5:\"bn_IN\";s:14:\"Bangla (India)\";s:3:\"bas\";s:5:\"Basaa\";s:6:\"bas_CM\";s:16:\"Basaa (Cameroon)\";s:2:\"eu\";s:6:\"Basque\";s:5:\"eu_ES\";s:14:\"Basque (Spain)\";s:2:\"be\";s:10:\"Belarusian\";s:5:\"be_BY\";s:20:\"Belarusian (Belarus)\";s:3:\"bem\";s:5:\"Bemba\";s:6:\"bem_ZM\";s:14:\"Bemba (Zambia)\";s:3:\"bez\";s:4:\"Bena\";s:6:\"bez_TZ\";s:15:\"Bena (Tanzania)\";s:3:\"brx\";s:4:\"Bodo\";s:6:\"brx_IN\";s:12:\"Bodo (India)\";s:2:\"bs\";s:7:\"Bosnian\";s:7:\"bs_Cyrl\";s:7:\"Bosnian\";s:7:\"bs_Latn\";s:7:\"Bosnian\";s:10:\"bs_Cyrl_BA\";s:30:\"Bosnian (Bosnia & Herzegovina)\";s:10:\"bs_Latn_BA\";s:30:\"Bosnian (Bosnia & Herzegovina)\";s:2:\"br\";s:6:\"Breton\";s:5:\"br_FR\";s:15:\"Breton (France)\";s:2:\"bg\";s:9:\"Bulgarian\";s:5:\"bg_BG\";s:20:\"Bulgarian (Bulgaria)\";s:2:\"my\";s:7:\"Burmese\";s:5:\"my_MM\";s:25:\"Burmese (Myanmar (Burma))\";s:3:\"yue\";s:9:\"Cantonese\";s:8:\"yue_Hans\";s:9:\"Cantonese\";s:8:\"yue_Hant\";s:9:\"Cantonese\";s:11:\"yue_Hans_CN\";s:17:\"Cantonese (China)\";s:11:\"yue_Hant_HK\";s:31:\"Cantonese (Hong Kong SAR China)\";s:2:\"ca\";s:7:\"Catalan\";s:5:\"ca_AD\";s:17:\"Catalan (Andorra)\";s:5:\"ca_FR\";s:16:\"Catalan (France)\";s:5:\"ca_IT\";s:15:\"Catalan (Italy)\";s:5:\"ca_ES\";s:15:\"Catalan (Spain)\";s:3:\"ceb\";s:7:\"Cebuano\";s:6:\"ceb_PH\";s:21:\"Cebuano (Philippines)\";s:3:\"tzm\";s:23:\"Central Atlas Tamazight\";s:6:\"tzm_MA\";s:33:\"Central Atlas Tamazight (Morocco)\";s:3:\"ckb\";s:15:\"Central Kurdish\";s:6:\"ckb_IR\";s:22:\"Central Kurdish (Iran)\";s:6:\"ckb_IQ\";s:22:\"Central Kurdish (Iraq)\";s:3:\"ccp\";s:6:\"Chakma\";s:6:\"ccp_BD\";s:19:\"Chakma (Bangladesh)\";s:6:\"ccp_IN\";s:14:\"Chakma (India)\";s:2:\"ce\";s:7:\"Chechen\";s:5:\"ce_RU\";s:16:\"Chechen (Russia)\";s:3:\"chr\";s:8:\"Cherokee\";s:6:\"chr_US\";s:24:\"Cherokee (United States)\";s:3:\"cgg\";s:5:\"Chiga\";s:6:\"cgg_UG\";s:14:\"Chiga (Uganda)\";s:7:\"zh_Hans\";s:7:\"Chinese\";s:7:\"zh_Hant\";s:7:\"Chinese\";s:2:\"zh\";s:7:\"Chinese\";s:10:\"zh_Hans_CN\";s:15:\"Chinese (China)\";s:10:\"zh_Hans_HK\";s:29:\"Chinese (Hong Kong SAR China)\";s:10:\"zh_Hant_HK\";s:29:\"Chinese (Hong Kong SAR China)\";s:10:\"zh_Hant_MO\";s:25:\"Chinese (Macao SAR China)\";s:10:\"zh_Hans_MO\";s:25:\"Chinese (Macao SAR China)\";s:10:\"zh_Hans_SG\";s:19:\"Chinese (Singapore)\";s:10:\"zh_Hant_TW\";s:16:\"Chinese (Taiwan)\";s:3:\"ksh\";s:9:\"Colognian\";s:6:\"ksh_DE\";s:19:\"Colognian (Germany)\";s:2:\"kw\";s:7:\"Cornish\";s:5:\"kw_GB\";s:24:\"Cornish (United Kingdom)\";s:2:\"hr\";s:8:\"Croatian\";s:5:\"hr_BA\";s:31:\"Croatian (Bosnia & Herzegovina)\";s:5:\"hr_HR\";s:18:\"Croatian (Croatia)\";s:2:\"cs\";s:5:\"Czech\";s:5:\"cs_CZ\";s:15:\"Czech (Czechia)\";s:2:\"da\";s:6:\"Danish\";s:5:\"da_DK\";s:16:\"Danish (Denmark)\";s:5:\"da_GL\";s:18:\"Danish (Greenland)\";s:3:\"dua\";s:5:\"Duala\";s:6:\"dua_CM\";s:16:\"Duala (Cameroon)\";s:2:\"nl\";s:5:\"Dutch\";s:5:\"nl_AW\";s:13:\"Dutch (Aruba)\";s:5:\"nl_BE\";s:15:\"Dutch (Belgium)\";s:5:\"nl_BQ\";s:29:\"Dutch (Caribbean Netherlands)\";s:5:\"nl_CW\";s:16:\"Dutch (Curaçao)\";s:5:\"nl_NL\";s:19:\"Dutch (Netherlands)\";s:5:\"nl_SX\";s:20:\"Dutch (Sint Maarten)\";s:5:\"nl_SR\";s:16:\"Dutch (Suriname)\";s:2:\"dz\";s:8:\"Dzongkha\";s:5:\"dz_BT\";s:17:\"Dzongkha (Bhutan)\";s:3:\"ebu\";s:4:\"Embu\";s:6:\"ebu_KE\";s:12:\"Embu (Kenya)\";s:2:\"en\";s:7:\"English\";s:5:\"en_AS\";s:24:\"English (American Samoa)\";s:5:\"en_AI\";s:18:\"English (Anguilla)\";s:5:\"en_AG\";s:27:\"English (Antigua & Barbuda)\";s:5:\"en_AU\";s:19:\"English (Australia)\";s:5:\"en_AT\";s:17:\"English (Austria)\";s:5:\"en_BS\";s:17:\"English (Bahamas)\";s:5:\"en_BB\";s:18:\"English (Barbados)\";s:5:\"en_BE\";s:17:\"English (Belgium)\";s:5:\"en_BZ\";s:16:\"English (Belize)\";s:5:\"en_BM\";s:17:\"English (Bermuda)\";s:5:\"en_BW\";s:18:\"English (Botswana)\";s:5:\"en_IO\";s:40:\"English (British Indian Ocean Territory)\";s:5:\"en_VG\";s:32:\"English (British Virgin Islands)\";s:5:\"en_BI\";s:17:\"English (Burundi)\";s:5:\"en_CM\";s:18:\"English (Cameroon)\";s:5:\"en_CA\";s:16:\"English (Canada)\";s:5:\"en_KY\";s:24:\"English (Cayman Islands)\";s:5:\"en_CX\";s:26:\"English (Christmas Island)\";s:5:\"en_CC\";s:33:\"English (Cocos (Keeling) Islands)\";s:5:\"en_CK\";s:22:\"English (Cook Islands)\";s:5:\"en_CY\";s:16:\"English (Cyprus)\";s:5:\"en_DK\";s:17:\"English (Denmark)\";s:5:\"en_DG\";s:22:\"English (Diego Garcia)\";s:5:\"en_DM\";s:18:\"English (Dominica)\";s:5:\"en_ER\";s:17:\"English (Eritrea)\";s:5:\"en_SZ\";s:18:\"English (Eswatini)\";s:6:\"en_150\";s:16:\"English (Europe)\";s:5:\"en_FK\";s:26:\"English (Falkland Islands)\";s:5:\"en_FJ\";s:14:\"English (Fiji)\";s:5:\"en_FI\";s:17:\"English (Finland)\";s:5:\"en_GM\";s:16:\"English (Gambia)\";s:5:\"en_DE\";s:17:\"English (Germany)\";s:5:\"en_GH\";s:15:\"English (Ghana)\";s:5:\"en_GI\";s:19:\"English (Gibraltar)\";s:5:\"en_GD\";s:17:\"English (Grenada)\";s:5:\"en_GU\";s:14:\"English (Guam)\";s:5:\"en_GG\";s:18:\"English (Guernsey)\";s:5:\"en_GY\";s:16:\"English (Guyana)\";s:5:\"en_HK\";s:29:\"English (Hong Kong SAR China)\";s:5:\"en_IN\";s:15:\"English (India)\";s:5:\"en_IE\";s:17:\"English (Ireland)\";s:5:\"en_IM\";s:21:\"English (Isle of Man)\";s:5:\"en_IL\";s:16:\"English (Israel)\";s:5:\"en_JM\";s:17:\"English (Jamaica)\";s:5:\"en_JE\";s:16:\"English (Jersey)\";s:5:\"en_KE\";s:15:\"English (Kenya)\";s:5:\"en_KI\";s:18:\"English (Kiribati)\";s:5:\"en_LS\";s:17:\"English (Lesotho)\";s:5:\"en_LR\";s:17:\"English (Liberia)\";s:5:\"en_MO\";s:25:\"English (Macao SAR China)\";s:5:\"en_MG\";s:20:\"English (Madagascar)\";s:5:\"en_MW\";s:16:\"English (Malawi)\";s:5:\"en_MY\";s:18:\"English (Malaysia)\";s:5:\"en_MT\";s:15:\"English (Malta)\";s:5:\"en_MH\";s:26:\"English (Marshall Islands)\";s:5:\"en_MU\";s:19:\"English (Mauritius)\";s:5:\"en_FM\";s:20:\"English (Micronesia)\";s:5:\"en_MS\";s:20:\"English (Montserrat)\";s:5:\"en_NA\";s:17:\"English (Namibia)\";s:5:\"en_NR\";s:15:\"English (Nauru)\";s:5:\"en_NL\";s:21:\"English (Netherlands)\";s:5:\"en_NZ\";s:21:\"English (New Zealand)\";s:5:\"en_NG\";s:17:\"English (Nigeria)\";s:5:\"en_NU\";s:14:\"English (Niue)\";s:5:\"en_NF\";s:24:\"English (Norfolk Island)\";s:5:\"en_MP\";s:34:\"English (Northern Mariana Islands)\";s:5:\"en_PK\";s:18:\"English (Pakistan)\";s:5:\"en_PW\";s:15:\"English (Palau)\";s:5:\"en_PG\";s:26:\"English (Papua New Guinea)\";s:5:\"en_PH\";s:21:\"English (Philippines)\";s:5:\"en_PN\";s:26:\"English (Pitcairn Islands)\";s:5:\"en_PR\";s:21:\"English (Puerto Rico)\";s:5:\"en_RW\";s:16:\"English (Rwanda)\";s:5:\"en_WS\";s:15:\"English (Samoa)\";s:5:\"en_SC\";s:20:\"English (Seychelles)\";s:5:\"en_SL\";s:22:\"English (Sierra Leone)\";s:5:\"en_SG\";s:19:\"English (Singapore)\";s:5:\"en_SX\";s:22:\"English (Sint Maarten)\";s:5:\"en_SI\";s:18:\"English (Slovenia)\";s:5:\"en_SB\";s:25:\"English (Solomon Islands)\";s:5:\"en_ZA\";s:22:\"English (South Africa)\";s:5:\"en_SS\";s:21:\"English (South Sudan)\";s:5:\"en_SH\";s:20:\"English (St. Helena)\";s:5:\"en_KN\";s:27:\"English (St. Kitts & Nevis)\";s:5:\"en_LC\";s:19:\"English (St. Lucia)\";s:5:\"en_VC\";s:34:\"English (St. Vincent & Grenadines)\";s:5:\"en_SD\";s:15:\"English (Sudan)\";s:5:\"en_SE\";s:16:\"English (Sweden)\";s:5:\"en_CH\";s:21:\"English (Switzerland)\";s:5:\"en_TZ\";s:18:\"English (Tanzania)\";s:5:\"en_TK\";s:17:\"English (Tokelau)\";s:5:\"en_TO\";s:15:\"English (Tonga)\";s:5:\"en_TT\";s:27:\"English (Trinidad & Tobago)\";s:5:\"en_TC\";s:32:\"English (Turks & Caicos Islands)\";s:5:\"en_TV\";s:16:\"English (Tuvalu)\";s:5:\"en_UM\";s:31:\"English (U.S. Outlying Islands)\";s:5:\"en_VI\";s:29:\"English (U.S. Virgin Islands)\";s:5:\"en_UG\";s:16:\"English (Uganda)\";s:5:\"en_AE\";s:30:\"English (United Arab Emirates)\";s:5:\"en_GB\";s:24:\"English (United Kingdom)\";s:11:\"en_US_POSIX\";s:23:\"English (United States)\";s:5:\"en_US\";s:23:\"English (United States)\";s:5:\"en_VU\";s:17:\"English (Vanuatu)\";s:6:\"en_001\";s:15:\"English (World)\";s:5:\"en_ZM\";s:16:\"English (Zambia)\";s:5:\"en_ZW\";s:18:\"English (Zimbabwe)\";s:2:\"eo\";s:9:\"Esperanto\";s:6:\"eo_001\";s:17:\"Esperanto (World)\";s:2:\"et\";s:8:\"Estonian\";s:5:\"et_EE\";s:18:\"Estonian (Estonia)\";s:2:\"ee\";s:3:\"Ewe\";s:5:\"ee_GH\";s:11:\"Ewe (Ghana)\";s:5:\"ee_TG\";s:10:\"Ewe (Togo)\";s:3:\"ewo\";s:6:\"Ewondo\";s:6:\"ewo_CM\";s:17:\"Ewondo (Cameroon)\";s:2:\"fo\";s:7:\"Faroese\";s:5:\"fo_DK\";s:17:\"Faroese (Denmark)\";s:5:\"fo_FO\";s:23:\"Faroese (Faroe Islands)\";s:3:\"fil\";s:8:\"Filipino\";s:6:\"fil_PH\";s:22:\"Filipino (Philippines)\";s:2:\"fi\";s:7:\"Finnish\";s:5:\"fi_FI\";s:17:\"Finnish (Finland)\";s:2:\"fr\";s:6:\"French\";s:5:\"fr_DZ\";s:16:\"French (Algeria)\";s:5:\"fr_BE\";s:16:\"French (Belgium)\";s:5:\"fr_BJ\";s:14:\"French (Benin)\";s:5:\"fr_BF\";s:21:\"French (Burkina Faso)\";s:5:\"fr_BI\";s:16:\"French (Burundi)\";s:5:\"fr_CM\";s:17:\"French (Cameroon)\";s:5:\"fr_CA\";s:15:\"French (Canada)\";s:5:\"fr_CF\";s:33:\"French (Central African Republic)\";s:5:\"fr_TD\";s:13:\"French (Chad)\";s:5:\"fr_KM\";s:16:\"French (Comoros)\";s:5:\"fr_CG\";s:28:\"French (Congo - Brazzaville)\";s:5:\"fr_CD\";s:25:\"French (Congo - Kinshasa)\";s:5:\"fr_CI\";s:25:\"French (Côte d’Ivoire)\";s:5:\"fr_DJ\";s:17:\"French (Djibouti)\";s:5:\"fr_GQ\";s:26:\"French (Equatorial Guinea)\";s:5:\"fr_FR\";s:15:\"French (France)\";s:5:\"fr_GF\";s:22:\"French (French Guiana)\";s:5:\"fr_PF\";s:25:\"French (French Polynesia)\";s:5:\"fr_GA\";s:14:\"French (Gabon)\";s:5:\"fr_GP\";s:19:\"French (Guadeloupe)\";s:5:\"fr_GN\";s:15:\"French (Guinea)\";s:5:\"fr_HT\";s:14:\"French (Haiti)\";s:5:\"fr_LU\";s:19:\"French (Luxembourg)\";s:5:\"fr_MG\";s:19:\"French (Madagascar)\";s:5:\"fr_ML\";s:13:\"French (Mali)\";s:5:\"fr_MQ\";s:19:\"French (Martinique)\";s:5:\"fr_MR\";s:19:\"French (Mauritania)\";s:5:\"fr_MU\";s:18:\"French (Mauritius)\";s:5:\"fr_YT\";s:16:\"French (Mayotte)\";s:5:\"fr_MC\";s:15:\"French (Monaco)\";s:5:\"fr_MA\";s:16:\"French (Morocco)\";s:5:\"fr_NC\";s:22:\"French (New Caledonia)\";s:5:\"fr_NE\";s:14:\"French (Niger)\";s:5:\"fr_RW\";s:15:\"French (Rwanda)\";s:5:\"fr_RE\";s:17:\"French (Réunion)\";s:5:\"fr_SN\";s:16:\"French (Senegal)\";s:5:\"fr_SC\";s:19:\"French (Seychelles)\";s:5:\"fr_BL\";s:24:\"French (St. Barthélemy)\";s:5:\"fr_MF\";s:19:\"French (St. Martin)\";s:5:\"fr_PM\";s:30:\"French (St. Pierre & Miquelon)\";s:5:\"fr_CH\";s:20:\"French (Switzerland)\";s:5:\"fr_SY\";s:14:\"French (Syria)\";s:5:\"fr_TG\";s:13:\"French (Togo)\";s:5:\"fr_TN\";s:16:\"French (Tunisia)\";s:5:\"fr_VU\";s:16:\"French (Vanuatu)\";s:5:\"fr_WF\";s:24:\"French (Wallis & Futuna)\";s:3:\"fur\";s:8:\"Friulian\";s:6:\"fur_IT\";s:16:\"Friulian (Italy)\";s:7:\"ff_Latn\";s:5:\"Fulah\";s:2:\"ff\";s:5:\"Fulah\";s:10:\"ff_Latn_BF\";s:20:\"Fulah (Burkina Faso)\";s:10:\"ff_Latn_CM\";s:16:\"Fulah (Cameroon)\";s:10:\"ff_Latn_GM\";s:14:\"Fulah (Gambia)\";s:10:\"ff_Latn_GH\";s:13:\"Fulah (Ghana)\";s:10:\"ff_Latn_GN\";s:14:\"Fulah (Guinea)\";s:10:\"ff_Latn_GW\";s:21:\"Fulah (Guinea-Bissau)\";s:10:\"ff_Latn_LR\";s:15:\"Fulah (Liberia)\";s:10:\"ff_Latn_MR\";s:18:\"Fulah (Mauritania)\";s:10:\"ff_Latn_NE\";s:13:\"Fulah (Niger)\";s:10:\"ff_Latn_NG\";s:15:\"Fulah (Nigeria)\";s:10:\"ff_Latn_SN\";s:15:\"Fulah (Senegal)\";s:10:\"ff_Latn_SL\";s:20:\"Fulah (Sierra Leone)\";s:2:\"gl\";s:8:\"Galician\";s:5:\"gl_ES\";s:16:\"Galician (Spain)\";s:2:\"lg\";s:5:\"Ganda\";s:5:\"lg_UG\";s:14:\"Ganda (Uganda)\";s:2:\"ka\";s:8:\"Georgian\";s:5:\"ka_GE\";s:18:\"Georgian (Georgia)\";s:2:\"de\";s:6:\"German\";s:5:\"de_AT\";s:16:\"German (Austria)\";s:5:\"de_BE\";s:16:\"German (Belgium)\";s:5:\"de_DE\";s:16:\"German (Germany)\";s:5:\"de_IT\";s:14:\"German (Italy)\";s:5:\"de_LI\";s:22:\"German (Liechtenstein)\";s:5:\"de_LU\";s:19:\"German (Luxembourg)\";s:5:\"de_CH\";s:20:\"German (Switzerland)\";s:2:\"el\";s:5:\"Greek\";s:5:\"el_CY\";s:14:\"Greek (Cyprus)\";s:5:\"el_GR\";s:14:\"Greek (Greece)\";s:2:\"gu\";s:8:\"Gujarati\";s:5:\"gu_IN\";s:16:\"Gujarati (India)\";s:3:\"guz\";s:5:\"Gusii\";s:6:\"guz_KE\";s:13:\"Gusii (Kenya)\";s:2:\"ha\";s:5:\"Hausa\";s:5:\"ha_GH\";s:13:\"Hausa (Ghana)\";s:5:\"ha_NE\";s:13:\"Hausa (Niger)\";s:5:\"ha_NG\";s:15:\"Hausa (Nigeria)\";s:3:\"haw\";s:8:\"Hawaiian\";s:6:\"haw_US\";s:24:\"Hawaiian (United States)\";s:2:\"he\";s:6:\"Hebrew\";s:5:\"he_IL\";s:15:\"Hebrew (Israel)\";s:2:\"hi\";s:5:\"Hindi\";s:5:\"hi_IN\";s:13:\"Hindi (India)\";s:2:\"hu\";s:9:\"Hungarian\";s:5:\"hu_HU\";s:19:\"Hungarian (Hungary)\";s:2:\"is\";s:9:\"Icelandic\";s:5:\"is_IS\";s:19:\"Icelandic (Iceland)\";s:2:\"ig\";s:4:\"Igbo\";s:5:\"ig_NG\";s:14:\"Igbo (Nigeria)\";s:3:\"smn\";s:10:\"Inari Sami\";s:6:\"smn_FI\";s:20:\"Inari Sami (Finland)\";s:2:\"id\";s:10:\"Indonesian\";s:5:\"id_ID\";s:22:\"Indonesian (Indonesia)\";s:2:\"ia\";s:11:\"Interlingua\";s:6:\"ia_001\";s:19:\"Interlingua (World)\";s:2:\"ga\";s:5:\"Irish\";s:5:\"ga_IE\";s:15:\"Irish (Ireland)\";s:5:\"ga_GB\";s:22:\"Irish (United Kingdom)\";s:2:\"it\";s:7:\"Italian\";s:5:\"it_IT\";s:15:\"Italian (Italy)\";s:5:\"it_SM\";s:20:\"Italian (San Marino)\";s:5:\"it_CH\";s:21:\"Italian (Switzerland)\";s:5:\"it_VA\";s:22:\"Italian (Vatican City)\";s:2:\"ja\";s:8:\"Japanese\";s:5:\"ja_JP\";s:16:\"Japanese (Japan)\";s:2:\"jv\";s:8:\"Javanese\";s:5:\"jv_ID\";s:20:\"Javanese (Indonesia)\";s:3:\"dyo\";s:10:\"Jola-Fonyi\";s:6:\"dyo_SN\";s:20:\"Jola-Fonyi (Senegal)\";s:3:\"kea\";s:12:\"Kabuverdianu\";s:6:\"kea_CV\";s:25:\"Kabuverdianu (Cape Verde)\";s:3:\"kab\";s:6:\"Kabyle\";s:6:\"kab_DZ\";s:16:\"Kabyle (Algeria)\";s:3:\"kkj\";s:4:\"Kako\";s:6:\"kkj_CM\";s:15:\"Kako (Cameroon)\";s:2:\"kl\";s:11:\"Kalaallisut\";s:5:\"kl_GL\";s:23:\"Kalaallisut (Greenland)\";s:3:\"kln\";s:8:\"Kalenjin\";s:6:\"kln_KE\";s:16:\"Kalenjin (Kenya)\";s:3:\"kam\";s:5:\"Kamba\";s:6:\"kam_KE\";s:13:\"Kamba (Kenya)\";s:2:\"kn\";s:7:\"Kannada\";s:5:\"kn_IN\";s:15:\"Kannada (India)\";s:2:\"ks\";s:8:\"Kashmiri\";s:5:\"ks_IN\";s:16:\"Kashmiri (India)\";s:2:\"kk\";s:6:\"Kazakh\";s:5:\"kk_KZ\";s:19:\"Kazakh (Kazakhstan)\";s:2:\"km\";s:5:\"Khmer\";s:5:\"km_KH\";s:16:\"Khmer (Cambodia)\";s:2:\"ki\";s:6:\"Kikuyu\";s:5:\"ki_KE\";s:14:\"Kikuyu (Kenya)\";s:2:\"rw\";s:11:\"Kinyarwanda\";s:5:\"rw_RW\";s:20:\"Kinyarwanda (Rwanda)\";s:3:\"kok\";s:7:\"Konkani\";s:6:\"kok_IN\";s:15:\"Konkani (India)\";s:2:\"ko\";s:6:\"Korean\";s:5:\"ko_KP\";s:20:\"Korean (North Korea)\";s:5:\"ko_KR\";s:20:\"Korean (South Korea)\";s:3:\"khq\";s:12:\"Koyra Chiini\";s:6:\"khq_ML\";s:19:\"Koyra Chiini (Mali)\";s:3:\"ses\";s:15:\"Koyraboro Senni\";s:6:\"ses_ML\";s:22:\"Koyraboro Senni (Mali)\";s:2:\"ku\";s:7:\"Kurdish\";s:5:\"ku_TR\";s:16:\"Kurdish (Turkey)\";s:3:\"nmg\";s:6:\"Kwasio\";s:6:\"nmg_CM\";s:17:\"Kwasio (Cameroon)\";s:2:\"ky\";s:6:\"Kyrgyz\";s:5:\"ky_KG\";s:19:\"Kyrgyz (Kyrgyzstan)\";s:3:\"lkt\";s:6:\"Lakota\";s:6:\"lkt_US\";s:22:\"Lakota (United States)\";s:3:\"lag\";s:5:\"Langi\";s:6:\"lag_TZ\";s:16:\"Langi (Tanzania)\";s:2:\"lo\";s:3:\"Lao\";s:5:\"lo_LA\";s:10:\"Lao (Laos)\";s:2:\"lv\";s:7:\"Latvian\";s:5:\"lv_LV\";s:16:\"Latvian (Latvia)\";s:2:\"ln\";s:7:\"Lingala\";s:5:\"ln_AO\";s:16:\"Lingala (Angola)\";s:5:\"ln_CF\";s:34:\"Lingala (Central African Republic)\";s:5:\"ln_CG\";s:29:\"Lingala (Congo - Brazzaville)\";s:5:\"ln_CD\";s:26:\"Lingala (Congo - Kinshasa)\";s:2:\"lt\";s:10:\"Lithuanian\";s:5:\"lt_LT\";s:22:\"Lithuanian (Lithuania)\";s:3:\"nds\";s:10:\"Low German\";s:6:\"nds_DE\";s:20:\"Low German (Germany)\";s:6:\"nds_NL\";s:24:\"Low German (Netherlands)\";s:3:\"dsb\";s:13:\"Lower Sorbian\";s:6:\"dsb_DE\";s:23:\"Lower Sorbian (Germany)\";s:2:\"lu\";s:12:\"Luba-Katanga\";s:5:\"lu_CD\";s:31:\"Luba-Katanga (Congo - Kinshasa)\";s:3:\"luo\";s:3:\"Luo\";s:6:\"luo_KE\";s:11:\"Luo (Kenya)\";s:2:\"lb\";s:13:\"Luxembourgish\";s:5:\"lb_LU\";s:26:\"Luxembourgish (Luxembourg)\";s:3:\"luy\";s:5:\"Luyia\";s:6:\"luy_KE\";s:13:\"Luyia (Kenya)\";s:2:\"mk\";s:10:\"Macedonian\";s:5:\"mk_MK\";s:28:\"Macedonian (North Macedonia)\";s:3:\"jmc\";s:7:\"Machame\";s:6:\"jmc_TZ\";s:18:\"Machame (Tanzania)\";s:3:\"mgh\";s:14:\"Makhuwa-Meetto\";s:6:\"mgh_MZ\";s:27:\"Makhuwa-Meetto (Mozambique)\";s:3:\"kde\";s:7:\"Makonde\";s:6:\"kde_TZ\";s:18:\"Makonde (Tanzania)\";s:2:\"mg\";s:8:\"Malagasy\";s:5:\"mg_MG\";s:21:\"Malagasy (Madagascar)\";s:2:\"ms\";s:5:\"Malay\";s:5:\"ms_BN\";s:14:\"Malay (Brunei)\";s:5:\"ms_MY\";s:16:\"Malay (Malaysia)\";s:5:\"ms_SG\";s:17:\"Malay (Singapore)\";s:2:\"ml\";s:9:\"Malayalam\";s:5:\"ml_IN\";s:17:\"Malayalam (India)\";s:2:\"mt\";s:7:\"Maltese\";s:5:\"mt_MT\";s:15:\"Maltese (Malta)\";s:2:\"gv\";s:4:\"Manx\";s:5:\"gv_IM\";s:18:\"Manx (Isle of Man)\";s:2:\"mi\";s:5:\"Maori\";s:5:\"mi_NZ\";s:19:\"Maori (New Zealand)\";s:2:\"mr\";s:7:\"Marathi\";s:5:\"mr_IN\";s:15:\"Marathi (India)\";s:3:\"mas\";s:5:\"Masai\";s:6:\"mas_KE\";s:13:\"Masai (Kenya)\";s:6:\"mas_TZ\";s:16:\"Masai (Tanzania)\";s:3:\"mzn\";s:11:\"Mazanderani\";s:6:\"mzn_IR\";s:18:\"Mazanderani (Iran)\";s:3:\"mer\";s:4:\"Meru\";s:6:\"mer_KE\";s:12:\"Meru (Kenya)\";s:3:\"mgo\";s:6:\"Metaʼ\";s:6:\"mgo_CM\";s:17:\"Metaʼ (Cameroon)\";s:2:\"mn\";s:9:\"Mongolian\";s:5:\"mn_MN\";s:20:\"Mongolian (Mongolia)\";s:3:\"mfe\";s:8:\"Morisyen\";s:6:\"mfe_MU\";s:20:\"Morisyen (Mauritius)\";s:3:\"mua\";s:7:\"Mundang\";s:6:\"mua_CM\";s:18:\"Mundang (Cameroon)\";s:3:\"naq\";s:4:\"Nama\";s:6:\"naq_NA\";s:14:\"Nama (Namibia)\";s:2:\"ne\";s:6:\"Nepali\";s:5:\"ne_IN\";s:14:\"Nepali (India)\";s:5:\"ne_NP\";s:14:\"Nepali (Nepal)\";s:3:\"nnh\";s:9:\"Ngiemboon\";s:6:\"nnh_CM\";s:20:\"Ngiemboon (Cameroon)\";s:3:\"jgo\";s:6:\"Ngomba\";s:6:\"jgo_CM\";s:17:\"Ngomba (Cameroon)\";s:2:\"nd\";s:13:\"North Ndebele\";s:5:\"nd_ZW\";s:24:\"North Ndebele (Zimbabwe)\";s:3:\"lrc\";s:13:\"Northern Luri\";s:6:\"lrc_IR\";s:20:\"Northern Luri (Iran)\";s:6:\"lrc_IQ\";s:20:\"Northern Luri (Iraq)\";s:2:\"se\";s:13:\"Northern Sami\";s:5:\"se_FI\";s:23:\"Northern Sami (Finland)\";s:5:\"se_NO\";s:22:\"Northern Sami (Norway)\";s:5:\"se_SE\";s:22:\"Northern Sami (Sweden)\";s:2:\"nb\";s:17:\"Norwegian Bokmål\";s:5:\"nb_NO\";s:26:\"Norwegian Bokmål (Norway)\";s:5:\"nb_SJ\";s:40:\"Norwegian Bokmål (Svalbard & Jan Mayen)\";s:2:\"nn\";s:17:\"Norwegian Nynorsk\";s:5:\"nn_NO\";s:26:\"Norwegian Nynorsk (Norway)\";s:3:\"nus\";s:4:\"Nuer\";s:6:\"nus_SS\";s:18:\"Nuer (South Sudan)\";s:3:\"nyn\";s:8:\"Nyankole\";s:6:\"nyn_UG\";s:17:\"Nyankole (Uganda)\";s:2:\"or\";s:4:\"Odia\";s:5:\"or_IN\";s:12:\"Odia (India)\";s:2:\"om\";s:5:\"Oromo\";s:5:\"om_ET\";s:16:\"Oromo (Ethiopia)\";s:5:\"om_KE\";s:13:\"Oromo (Kenya)\";s:2:\"os\";s:7:\"Ossetic\";s:5:\"os_GE\";s:17:\"Ossetic (Georgia)\";s:5:\"os_RU\";s:16:\"Ossetic (Russia)\";s:2:\"ps\";s:6:\"Pashto\";s:5:\"ps_AF\";s:20:\"Pashto (Afghanistan)\";s:5:\"ps_PK\";s:17:\"Pashto (Pakistan)\";s:2:\"fa\";s:7:\"Persian\";s:5:\"fa_AF\";s:21:\"Persian (Afghanistan)\";s:5:\"fa_IR\";s:14:\"Persian (Iran)\";s:2:\"pl\";s:6:\"Polish\";s:5:\"pl_PL\";s:15:\"Polish (Poland)\";s:2:\"pt\";s:10:\"Portuguese\";s:5:\"pt_AO\";s:19:\"Portuguese (Angola)\";s:5:\"pt_BR\";s:19:\"Portuguese (Brazil)\";s:5:\"pt_CV\";s:23:\"Portuguese (Cape Verde)\";s:5:\"pt_GQ\";s:30:\"Portuguese (Equatorial Guinea)\";s:5:\"pt_GW\";s:26:\"Portuguese (Guinea-Bissau)\";s:5:\"pt_LU\";s:23:\"Portuguese (Luxembourg)\";s:5:\"pt_MO\";s:28:\"Portuguese (Macao SAR China)\";s:5:\"pt_MZ\";s:23:\"Portuguese (Mozambique)\";s:5:\"pt_PT\";s:21:\"Portuguese (Portugal)\";s:5:\"pt_CH\";s:24:\"Portuguese (Switzerland)\";s:5:\"pt_ST\";s:35:\"Portuguese (São Tomé & Príncipe)\";s:5:\"pt_TL\";s:24:\"Portuguese (Timor-Leste)\";s:7:\"pa_Guru\";s:7:\"Punjabi\";s:7:\"pa_Arab\";s:7:\"Punjabi\";s:2:\"pa\";s:7:\"Punjabi\";s:10:\"pa_Guru_IN\";s:15:\"Punjabi (India)\";s:10:\"pa_Arab_PK\";s:18:\"Punjabi (Pakistan)\";s:2:\"qu\";s:7:\"Quechua\";s:5:\"qu_BO\";s:17:\"Quechua (Bolivia)\";s:5:\"qu_EC\";s:17:\"Quechua (Ecuador)\";s:5:\"qu_PE\";s:14:\"Quechua (Peru)\";s:2:\"ro\";s:8:\"Romanian\";s:5:\"ro_MD\";s:18:\"Romanian (Moldova)\";s:5:\"ro_RO\";s:18:\"Romanian (Romania)\";s:2:\"rm\";s:7:\"Romansh\";s:5:\"rm_CH\";s:21:\"Romansh (Switzerland)\";s:3:\"rof\";s:5:\"Rombo\";s:6:\"rof_TZ\";s:16:\"Rombo (Tanzania)\";s:2:\"rn\";s:5:\"Rundi\";s:5:\"rn_BI\";s:15:\"Rundi (Burundi)\";s:2:\"ru\";s:7:\"Russian\";s:5:\"ru_BY\";s:17:\"Russian (Belarus)\";s:5:\"ru_KZ\";s:20:\"Russian (Kazakhstan)\";s:5:\"ru_KG\";s:20:\"Russian (Kyrgyzstan)\";s:5:\"ru_MD\";s:17:\"Russian (Moldova)\";s:5:\"ru_RU\";s:16:\"Russian (Russia)\";s:5:\"ru_UA\";s:17:\"Russian (Ukraine)\";s:3:\"rwk\";s:3:\"Rwa\";s:6:\"rwk_TZ\";s:14:\"Rwa (Tanzania)\";s:3:\"sah\";s:5:\"Sakha\";s:6:\"sah_RU\";s:14:\"Sakha (Russia)\";s:3:\"saq\";s:7:\"Samburu\";s:6:\"saq_KE\";s:15:\"Samburu (Kenya)\";s:2:\"sg\";s:5:\"Sango\";s:5:\"sg_CF\";s:32:\"Sango (Central African Republic)\";s:3:\"sbp\";s:5:\"Sangu\";s:6:\"sbp_TZ\";s:16:\"Sangu (Tanzania)\";s:2:\"gd\";s:15:\"Scottish Gaelic\";s:5:\"gd_GB\";s:32:\"Scottish Gaelic (United Kingdom)\";s:3:\"seh\";s:4:\"Sena\";s:6:\"seh_MZ\";s:17:\"Sena (Mozambique)\";s:2:\"sr\";s:7:\"Serbian\";s:7:\"sr_Latn\";s:7:\"Serbian\";s:7:\"sr_Cyrl\";s:7:\"Serbian\";s:10:\"sr_Cyrl_BA\";s:30:\"Serbian (Bosnia & Herzegovina)\";s:10:\"sr_Latn_BA\";s:30:\"Serbian (Bosnia & Herzegovina)\";s:10:\"sr_Latn_XK\";s:16:\"Serbian (Kosovo)\";s:10:\"sr_Cyrl_XK\";s:16:\"Serbian (Kosovo)\";s:10:\"sr_Latn_ME\";s:20:\"Serbian (Montenegro)\";s:10:\"sr_Cyrl_ME\";s:20:\"Serbian (Montenegro)\";s:10:\"sr_Cyrl_RS\";s:16:\"Serbian (Serbia)\";s:10:\"sr_Latn_RS\";s:16:\"Serbian (Serbia)\";s:3:\"ksb\";s:8:\"Shambala\";s:6:\"ksb_TZ\";s:19:\"Shambala (Tanzania)\";s:2:\"sn\";s:5:\"Shona\";s:5:\"sn_ZW\";s:16:\"Shona (Zimbabwe)\";s:2:\"ii\";s:10:\"Sichuan Yi\";s:5:\"ii_CN\";s:18:\"Sichuan Yi (China)\";s:2:\"sd\";s:6:\"Sindhi\";s:5:\"sd_PK\";s:17:\"Sindhi (Pakistan)\";s:2:\"si\";s:7:\"Sinhala\";s:5:\"si_LK\";s:19:\"Sinhala (Sri Lanka)\";s:2:\"sk\";s:6:\"Slovak\";s:5:\"sk_SK\";s:17:\"Slovak (Slovakia)\";s:2:\"sl\";s:9:\"Slovenian\";s:5:\"sl_SI\";s:20:\"Slovenian (Slovenia)\";s:3:\"xog\";s:4:\"Soga\";s:6:\"xog_UG\";s:13:\"Soga (Uganda)\";s:2:\"so\";s:6:\"Somali\";s:5:\"so_DJ\";s:17:\"Somali (Djibouti)\";s:5:\"so_ET\";s:17:\"Somali (Ethiopia)\";s:5:\"so_KE\";s:14:\"Somali (Kenya)\";s:5:\"so_SO\";s:16:\"Somali (Somalia)\";s:2:\"es\";s:7:\"Spanish\";s:5:\"es_AR\";s:19:\"Spanish (Argentina)\";s:5:\"es_BZ\";s:16:\"Spanish (Belize)\";s:5:\"es_BO\";s:17:\"Spanish (Bolivia)\";s:5:\"es_BR\";s:16:\"Spanish (Brazil)\";s:5:\"es_IC\";s:24:\"Spanish (Canary Islands)\";s:5:\"es_EA\";s:25:\"Spanish (Ceuta & Melilla)\";s:5:\"es_CL\";s:15:\"Spanish (Chile)\";s:5:\"es_CO\";s:18:\"Spanish (Colombia)\";s:5:\"es_CR\";s:20:\"Spanish (Costa Rica)\";s:5:\"es_CU\";s:14:\"Spanish (Cuba)\";s:5:\"es_DO\";s:28:\"Spanish (Dominican Republic)\";s:5:\"es_EC\";s:17:\"Spanish (Ecuador)\";s:5:\"es_SV\";s:21:\"Spanish (El Salvador)\";s:5:\"es_GQ\";s:27:\"Spanish (Equatorial Guinea)\";s:5:\"es_GT\";s:19:\"Spanish (Guatemala)\";s:5:\"es_HN\";s:18:\"Spanish (Honduras)\";s:6:\"es_419\";s:23:\"Spanish (Latin America)\";s:5:\"es_MX\";s:16:\"Spanish (Mexico)\";s:5:\"es_NI\";s:19:\"Spanish (Nicaragua)\";s:5:\"es_PA\";s:16:\"Spanish (Panama)\";s:5:\"es_PY\";s:18:\"Spanish (Paraguay)\";s:5:\"es_PE\";s:14:\"Spanish (Peru)\";s:5:\"es_PH\";s:21:\"Spanish (Philippines)\";s:5:\"es_PR\";s:21:\"Spanish (Puerto Rico)\";s:5:\"es_ES\";s:15:\"Spanish (Spain)\";s:5:\"es_US\";s:23:\"Spanish (United States)\";s:5:\"es_UY\";s:17:\"Spanish (Uruguay)\";s:5:\"es_VE\";s:19:\"Spanish (Venezuela)\";s:3:\"zgh\";s:27:\"Standard Moroccan Tamazight\";s:6:\"zgh_MA\";s:37:\"Standard Moroccan Tamazight (Morocco)\";s:2:\"sw\";s:7:\"Swahili\";s:5:\"sw_CD\";s:26:\"Swahili (Congo - Kinshasa)\";s:5:\"sw_KE\";s:15:\"Swahili (Kenya)\";s:5:\"sw_TZ\";s:18:\"Swahili (Tanzania)\";s:5:\"sw_UG\";s:16:\"Swahili (Uganda)\";s:2:\"sv\";s:7:\"Swedish\";s:5:\"sv_FI\";s:17:\"Swedish (Finland)\";s:5:\"sv_SE\";s:16:\"Swedish (Sweden)\";s:5:\"sv_AX\";s:24:\"Swedish (Åland Islands)\";s:3:\"gsw\";s:12:\"Swiss German\";s:6:\"gsw_FR\";s:21:\"Swiss German (France)\";s:6:\"gsw_LI\";s:28:\"Swiss German (Liechtenstein)\";s:6:\"gsw_CH\";s:26:\"Swiss German (Switzerland)\";s:8:\"shi_Tfng\";s:9:\"Tachelhit\";s:8:\"shi_Latn\";s:9:\"Tachelhit\";s:3:\"shi\";s:9:\"Tachelhit\";s:11:\"shi_Tfng_MA\";s:19:\"Tachelhit (Morocco)\";s:11:\"shi_Latn_MA\";s:19:\"Tachelhit (Morocco)\";s:3:\"dav\";s:5:\"Taita\";s:6:\"dav_KE\";s:13:\"Taita (Kenya)\";s:2:\"tg\";s:5:\"Tajik\";s:5:\"tg_TJ\";s:18:\"Tajik (Tajikistan)\";s:2:\"ta\";s:5:\"Tamil\";s:5:\"ta_IN\";s:13:\"Tamil (India)\";s:5:\"ta_MY\";s:16:\"Tamil (Malaysia)\";s:5:\"ta_SG\";s:17:\"Tamil (Singapore)\";s:5:\"ta_LK\";s:17:\"Tamil (Sri Lanka)\";s:3:\"twq\";s:7:\"Tasawaq\";s:6:\"twq_NE\";s:15:\"Tasawaq (Niger)\";s:2:\"tt\";s:5:\"Tatar\";s:5:\"tt_RU\";s:14:\"Tatar (Russia)\";s:2:\"te\";s:6:\"Telugu\";s:5:\"te_IN\";s:14:\"Telugu (India)\";s:3:\"teo\";s:4:\"Teso\";s:6:\"teo_KE\";s:12:\"Teso (Kenya)\";s:6:\"teo_UG\";s:13:\"Teso (Uganda)\";s:2:\"th\";s:4:\"Thai\";s:5:\"th_TH\";s:15:\"Thai (Thailand)\";s:2:\"bo\";s:7:\"Tibetan\";s:5:\"bo_CN\";s:15:\"Tibetan (China)\";s:5:\"bo_IN\";s:15:\"Tibetan (India)\";s:2:\"ti\";s:8:\"Tigrinya\";s:5:\"ti_ER\";s:18:\"Tigrinya (Eritrea)\";s:5:\"ti_ET\";s:19:\"Tigrinya (Ethiopia)\";s:2:\"to\";s:6:\"Tongan\";s:5:\"to_TO\";s:14:\"Tongan (Tonga)\";s:2:\"tr\";s:7:\"Turkish\";s:5:\"tr_CY\";s:16:\"Turkish (Cyprus)\";s:5:\"tr_TR\";s:16:\"Turkish (Turkey)\";s:2:\"tk\";s:7:\"Turkmen\";s:5:\"tk_TM\";s:22:\"Turkmen (Turkmenistan)\";s:2:\"uk\";s:9:\"Ukrainian\";s:5:\"uk_UA\";s:19:\"Ukrainian (Ukraine)\";s:3:\"hsb\";s:13:\"Upper Sorbian\";s:6:\"hsb_DE\";s:23:\"Upper Sorbian (Germany)\";s:2:\"ur\";s:4:\"Urdu\";s:5:\"ur_IN\";s:12:\"Urdu (India)\";s:5:\"ur_PK\";s:15:\"Urdu (Pakistan)\";s:2:\"ug\";s:6:\"Uyghur\";s:5:\"ug_CN\";s:14:\"Uyghur (China)\";s:7:\"uz_Latn\";s:5:\"Uzbek\";s:7:\"uz_Arab\";s:5:\"Uzbek\";s:2:\"uz\";s:5:\"Uzbek\";s:7:\"uz_Cyrl\";s:5:\"Uzbek\";s:10:\"uz_Arab_AF\";s:19:\"Uzbek (Afghanistan)\";s:10:\"uz_Latn_UZ\";s:18:\"Uzbek (Uzbekistan)\";s:10:\"uz_Cyrl_UZ\";s:18:\"Uzbek (Uzbekistan)\";s:8:\"vai_Vaii\";s:3:\"Vai\";s:3:\"vai\";s:3:\"Vai\";s:8:\"vai_Latn\";s:3:\"Vai\";s:11:\"vai_Vaii_LR\";s:13:\"Vai (Liberia)\";s:11:\"vai_Latn_LR\";s:13:\"Vai (Liberia)\";s:2:\"vi\";s:10:\"Vietnamese\";s:5:\"vi_VN\";s:20:\"Vietnamese (Vietnam)\";s:3:\"vun\";s:5:\"Vunjo\";s:6:\"vun_TZ\";s:16:\"Vunjo (Tanzania)\";s:3:\"wae\";s:6:\"Walser\";s:6:\"wae_CH\";s:20:\"Walser (Switzerland)\";s:2:\"cy\";s:5:\"Welsh\";s:5:\"cy_GB\";s:22:\"Welsh (United Kingdom)\";s:2:\"fy\";s:15:\"Western Frisian\";s:5:\"fy_NL\";s:29:\"Western Frisian (Netherlands)\";s:2:\"wo\";s:5:\"Wolof\";s:5:\"wo_SN\";s:15:\"Wolof (Senegal)\";s:2:\"xh\";s:5:\"Xhosa\";s:5:\"xh_ZA\";s:20:\"Xhosa (South Africa)\";s:3:\"yav\";s:7:\"Yangben\";s:6:\"yav_CM\";s:18:\"Yangben (Cameroon)\";s:2:\"yi\";s:7:\"Yiddish\";s:6:\"yi_001\";s:15:\"Yiddish (World)\";s:2:\"yo\";s:6:\"Yoruba\";s:5:\"yo_BJ\";s:14:\"Yoruba (Benin)\";s:5:\"yo_NG\";s:16:\"Yoruba (Nigeria)\";s:3:\"dje\";s:5:\"Zarma\";s:6:\"dje_NE\";s:13:\"Zarma (Niger)\";s:2:\"zu\";s:4:\"Zulu\";s:5:\"zu_ZA\";s:19:\"Zulu (South Africa)\";}\";',1617790297,1620209497);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_tags`
--

DROP TABLE IF EXISTS `cache_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_tags` (
  `id` varchar(165) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `tag` varchar(165) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`tag`),
  KEY `tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_tags`
--

LOCK TABLES `cache_tags` WRITE;
/*!40000 ALTER TABLE `cache_tags` DISABLE KEYS */;
INSERT INTO `cache_tags` VALUES ('asset_1','asset_1'),('asset_10','asset_10'),('asset_15','asset_15'),('asset_19','asset_19'),('asset_2','asset_2'),('asset_20','asset_20'),('asset_21','asset_21'),('asset_22','asset_22'),('object_35','asset_22'),('asset_24','asset_24'),('object_37','asset_24'),('asset_4','asset_4'),('asset_6','asset_6'),('asset_7','asset_7'),('asset_8','asset_8'),('asset_9','asset_9'),('object_11','class_brand'),('object_14','class_brand'),('object_38','class_brand'),('object_12','class_category'),('object_13','class_category'),('object_39','class_category'),('object_8','class_category'),('object_34','class_log'),('object_36','class_log'),('object_15','class_product'),('object_18','class_product'),('object_19','class_product'),('object_29','class_product'),('object_33','class_product'),('object_35','class_product'),('object_37','class_product'),('object_9','class_product'),('document_1','document_1'),('document_properties_1','document_1'),('document_2','document_2'),('document_properties_2','document_2'),('document_4','document_4'),('document_properties_4','document_4'),('document_5','document_5'),('document_properties_5','document_5'),('document_properties_1','document_properties'),('document_properties_2','document_properties'),('document_properties_4','document_properties'),('document_properties_5','document_properties'),('object_1','object_1'),('object_10','object_10'),('object_11','object_11'),('object_12','object_12'),('object_13','object_13'),('object_14','object_14'),('object_15','object_15'),('object_16','object_16'),('object_18','object_18'),('object_19','object_19'),('object_20','object_20'),('object_29','object_29'),('object_3','object_3'),('object_30','object_30'),('object_33','object_33'),('object_34','object_34'),('object_35','object_35'),('object_36','object_36'),('object_37','object_37'),('object_38','object_38'),('object_39','object_39'),('object_4','object_4'),('object_8','object_8'),('object_9','object_9'),('system_route_redirect','redirect'),('system_resource_columns_edit_lock','resource'),('system_route_redirect','route'),('site_domain_ef3d53ccb1590e6c44140f57feae89c9','site'),('site_domain_ef3d53ccb1590e6c44140f57feae89c9','system'),('system_resource_columns_edit_lock','system'),('system_route_redirect','system'),('system_supported_locales_en','system');
/*!40000 ALTER TABLE `cache_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` varchar(50) NOT NULL,
  `name` varchar(190) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES ('brand','brand'),('category','category'),('feedback','feedback'),('import','import'),('log','log'),('product','product');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_collectionrelations`
--

DROP TABLE IF EXISTS `classificationstore_collectionrelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_collectionrelations` (
  `colId` int unsigned NOT NULL,
  `groupId` int unsigned NOT NULL,
  `sorter` int DEFAULT '0',
  PRIMARY KEY (`colId`,`groupId`),
  KEY `FK_classificationstore_collectionrelations_groups` (`groupId`),
  CONSTRAINT `FK_classificationstore_collectionrelations_groups` FOREIGN KEY (`groupId`) REFERENCES `classificationstore_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_collectionrelations`
--

LOCK TABLES `classificationstore_collectionrelations` WRITE;
/*!40000 ALTER TABLE `classificationstore_collectionrelations` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_collectionrelations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_collections`
--

DROP TABLE IF EXISTS `classificationstore_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_collections` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `storeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `storeId` (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_collections`
--

LOCK TABLES `classificationstore_collections` WRITE;
/*!40000 ALTER TABLE `classificationstore_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_groups`
--

DROP TABLE IF EXISTS `classificationstore_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `storeId` int DEFAULT NULL,
  `parentId` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(190) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `storeId` (`storeId`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_groups`
--

LOCK TABLES `classificationstore_groups` WRITE;
/*!40000 ALTER TABLE `classificationstore_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_keys`
--

DROP TABLE IF EXISTS `classificationstore_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_keys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `storeId` int DEFAULT NULL,
  `name` varchar(190) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `type` varchar(190) DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  `definition` longtext,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `enabled` (`enabled`),
  KEY `type` (`type`),
  KEY `storeId` (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_keys`
--

LOCK TABLES `classificationstore_keys` WRITE;
/*!40000 ALTER TABLE `classificationstore_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_relations`
--

DROP TABLE IF EXISTS `classificationstore_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_relations` (
  `groupId` int unsigned NOT NULL,
  `keyId` int unsigned NOT NULL,
  `sorter` int DEFAULT NULL,
  `mandatory` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`groupId`,`keyId`),
  KEY `FK_classificationstore_relations_classificationstore_keys` (`keyId`),
  KEY `mandatory` (`mandatory`),
  CONSTRAINT `FK_classificationstore_relations_classificationstore_groups` FOREIGN KEY (`groupId`) REFERENCES `classificationstore_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_classificationstore_relations_classificationstore_keys` FOREIGN KEY (`keyId`) REFERENCES `classificationstore_keys` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_relations`
--

LOCK TABLES `classificationstore_relations` WRITE;
/*!40000 ALTER TABLE `classificationstore_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_stores`
--

DROP TABLE IF EXISTS `classificationstore_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_stores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(190) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_stores`
--

LOCK TABLES `classificationstore_stores` WRITE;
/*!40000 ALTER TABLE `classificationstore_stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_layouts`
--

DROP TABLE IF EXISTS `custom_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_layouts` (
  `id` varchar(64) NOT NULL,
  `classId` varchar(50) NOT NULL,
  `name` varchar(190) DEFAULT NULL,
  `description` text,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  `userOwner` int unsigned DEFAULT NULL,
  `userModification` int unsigned DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_layouts`
--

LOCK TABLES `custom_layouts` WRITE;
/*!40000 ALTER TABLE `custom_layouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependencies`
--

DROP TABLE IF EXISTS `dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependencies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sourcetype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `sourceid` int unsigned NOT NULL DEFAULT '0',
  `targettype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `targetid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `combi` (`sourcetype`,`sourceid`,`targettype`,`targetid`),
  KEY `targettype_targetid` (`targettype`,`targetid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependencies`
--

LOCK TABLES `dependencies` WRITE;
/*!40000 ALTER TABLE `dependencies` DISABLE KEYS */;
INSERT INTO `dependencies` VALUES (1,'object',8,'asset',3),(3,'object',9,'asset',3),(2,'object',9,'object',8),(5,'object',15,'asset',5),(4,'object',15,'object',8),(18,'object',17,'asset',23),(8,'object',18,'object',12),(10,'object',19,'object',12),(14,'object',29,'object',12),(17,'object',33,'object',12),(20,'object',35,'asset',22),(19,'object',35,'object',12),(22,'object',37,'asset',24),(21,'object',37,'object',39);
/*!40000 ALTER TABLE `dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int unsigned DEFAULT NULL,
  `type` enum('page','link','snippet','folder','hardlink','email','newsletter','printpage','printcontainer') DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `path` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `index` int unsigned DEFAULT '0',
  `published` tinyint unsigned DEFAULT '1',
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  `userOwner` int unsigned DEFAULT NULL,
  `userModification` int unsigned DEFAULT NULL,
  `versionCount` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fullpath` (`path`,`key`),
  KEY `parentId` (`parentId`),
  KEY `key` (`key`),
  KEY `published` (`published`),
  KEY `modificationDate` (`modificationDate`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,0,'page','','/',999999,1,1617206059,1617206059,1,1,0),(2,1,'page','feedback','/',1,1,1617698680,1617698920,2,2,2),(4,1,'email','feedbackMail','/',2,1,1617700180,1617701039,2,2,5),(5,1,'email','importEmail','/',3,1,1617700338,1617701032,2,2,5);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_elements`
--

DROP TABLE IF EXISTS `documents_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_elements` (
  `documentId` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(750) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `type` varchar(50) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`documentId`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_elements`
--

LOCK TABLES `documents_elements` WRITE;
/*!40000 ALTER TABLE `documents_elements` DISABLE KEYS */;
INSERT INTO `documents_elements` VALUES (4,'content','wysiwyg','<p>feedback was given</p>\n'),(5,'content','wysiwyg','<p>new products have been added</p>\n');
/*!40000 ALTER TABLE `documents_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_email`
--

DROP TABLE IF EXISTS `documents_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_email` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `replyTo` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_email`
--

LOCK TABLES `documents_email` WRITE;
/*!40000 ALTER TABLE `documents_email` DISABLE KEYS */;
INSERT INTO `documents_email` VALUES (4,'AppBundle','Default','default','content/feedbackMail.html.php','','','','','','',NULL),(5,'AppBundle','Default','default','content/importEmail.html.php','','','','','','',NULL);
/*!40000 ALTER TABLE `documents_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_hardlink`
--

DROP TABLE IF EXISTS `documents_hardlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_hardlink` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `sourceId` int DEFAULT NULL,
  `propertiesFromSource` tinyint(1) DEFAULT NULL,
  `childrenFromSource` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sourceId` (`sourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_hardlink`
--

LOCK TABLES `documents_hardlink` WRITE;
/*!40000 ALTER TABLE `documents_hardlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_hardlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_link`
--

DROP TABLE IF EXISTS `documents_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_link` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `internalType` enum('document','asset','object') DEFAULT NULL,
  `internal` int unsigned DEFAULT NULL,
  `direct` varchar(1000) DEFAULT NULL,
  `linktype` enum('direct','internal') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_link`
--

LOCK TABLES `documents_link` WRITE;
/*!40000 ALTER TABLE `documents_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_newsletter`
--

DROP TABLE IF EXISTS `documents_newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_newsletter` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `trackingParameterSource` varchar(255) DEFAULT NULL,
  `trackingParameterMedium` varchar(255) DEFAULT NULL,
  `trackingParameterName` varchar(255) DEFAULT NULL,
  `enableTrackingParameters` tinyint unsigned DEFAULT NULL,
  `sendingMode` varchar(20) DEFAULT NULL,
  `plaintext` longtext,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_newsletter`
--

LOCK TABLES `documents_newsletter` WRITE;
/*!40000 ALTER TABLE `documents_newsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_page`
--

DROP TABLE IF EXISTS `documents_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_page` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(383) DEFAULT NULL,
  `metaData` text,
  `prettyUrl` varchar(190) DEFAULT NULL,
  `contentMasterDocumentId` int DEFAULT NULL,
  `targetGroupIds` varchar(255) DEFAULT NULL,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prettyUrl` (`prettyUrl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_page`
--

LOCK TABLES `documents_page` WRITE;
/*!40000 ALTER TABLE `documents_page` DISABLE KEYS */;
INSERT INTO `documents_page` VALUES (1,NULL,'default','default','','','',NULL,NULL,NULL,NULL,NULL),(2,'AppBundle','Default','default','content/feedback.html.php','feedback','','a:0:{}',NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `documents_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_printpage`
--

DROP TABLE IF EXISTS `documents_printpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_printpage` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `lastGenerated` int DEFAULT NULL,
  `lastGenerateMessage` text,
  `contentMasterDocumentId` int DEFAULT NULL,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_printpage`
--

LOCK TABLES `documents_printpage` WRITE;
/*!40000 ALTER TABLE `documents_printpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_printpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_snippet`
--

DROP TABLE IF EXISTS `documents_snippet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_snippet` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `contentMasterDocumentId` int DEFAULT NULL,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_snippet`
--

LOCK TABLES `documents_snippet` WRITE;
/*!40000 ALTER TABLE `documents_snippet` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_snippet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_translations`
--

DROP TABLE IF EXISTS `documents_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_translations` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `sourceId` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`sourceId`,`language`),
  KEY `id` (`id`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_translations`
--

LOCK TABLES `documents_translations` WRITE;
/*!40000 ALTER TABLE `documents_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_lock`
--

DROP TABLE IF EXISTS `edit_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edit_lock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int unsigned NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `userId` int unsigned NOT NULL DEFAULT '0',
  `sessionId` varchar(255) DEFAULT NULL,
  `date` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ctype` (`ctype`),
  KEY `cidtype` (`cid`,`ctype`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_lock`
--

LOCK TABLES `edit_lock` WRITE;
/*!40000 ALTER TABLE `edit_lock` DISABLE KEYS */;
INSERT INTO `edit_lock` VALUES (52,10,'object',2,'pd7mqurt7d0rd7esbo7gegcuat',1617365079),(91,14,'object',2,'dk5tivh15fqbm8cfr2kp8ktf2s',1617636840),(92,8,'object',2,'dk5tivh15fqbm8cfr2kp8ktf2s',1617636846),(94,13,'object',2,'dk5tivh15fqbm8cfr2kp8ktf2s',1617636849),(198,34,'object',2,'66bq9i7s81snp8tf81sbl6nk9o',1617769598),(203,20,'asset',2,'hp64b32dfui2s3i13gr3luq6kj',1617790304),(204,2,'asset',2,'hp64b32dfui2s3i13gr3luq6kj',1617790304),(205,4,'asset',2,'hp64b32dfui2s3i13gr3luq6kj',1617790304),(206,2,'document',2,'hp64b32dfui2s3i13gr3luq6kj',1617790304),(207,22,'asset',2,'hp64b32dfui2s3i13gr3luq6kj',1617790623),(208,16,'object',2,'hp64b32dfui2s3i13gr3luq6kj',1617790632),(209,17,'object',2,'hp64b32dfui2s3i13gr3luq6kj',1617790642),(210,4,'object',2,'hp64b32dfui2s3i13gr3luq6kj',1617790816),(211,35,'object',2,'hp64b32dfui2s3i13gr3luq6kj',1617790824),(212,36,'object',2,'hp64b32dfui2s3i13gr3luq6kj',1617790845),(214,38,'object',2,'hp64b32dfui2s3i13gr3luq6kj',1617812567),(215,37,'object',2,'hp64b32dfui2s3i13gr3luq6kj',1617812585),(216,39,'object',2,'hp64b32dfui2s3i13gr3luq6kj',1617812634);
/*!40000 ALTER TABLE `edit_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element_workflow_state`
--

DROP TABLE IF EXISTS `element_workflow_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `element_workflow_state` (
  `cid` int NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') NOT NULL,
  `place` text,
  `workflow` varchar(100) NOT NULL,
  PRIMARY KEY (`cid`,`ctype`,`workflow`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_workflow_state`
--

LOCK TABLES `element_workflow_state` WRITE;
/*!40000 ALTER TABLE `element_workflow_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `element_workflow_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_blacklist`
--

DROP TABLE IF EXISTS `email_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_blacklist` (
  `address` varchar(190) NOT NULL DEFAULT '',
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  PRIMARY KEY (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_blacklist`
--

LOCK TABLES `email_blacklist` WRITE;
/*!40000 ALTER TABLE `email_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `documentId` int DEFAULT NULL,
  `requestUri` varchar(500) DEFAULT NULL,
  `params` text,
  `from` varchar(500) DEFAULT NULL,
  `replyTo` varchar(255) DEFAULT NULL,
  `to` longtext,
  `cc` longtext,
  `bcc` longtext,
  `sentDate` int unsigned DEFAULT NULL,
  `subject` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sentDate` (`sentDate`,`id`),
  FULLTEXT KEY `fulltext` (`from`,`to`,`cc`,`bcc`,`subject`,`params`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES (1,3,'/feedback?pimcore_preview=true&amp;time=1617699973542&amp;forceDeviceType=full&amp;pimcore_override_output_timestamp=1617647400','[]','vashu sharma <vashusharma2625@gmail.com>',NULL,NULL,NULL,NULL,1617699993,'Products Feedback'),(2,4,'/feedback?pimcore_preview=true&amp;time=1617699973542&amp;forceDeviceType=full&amp;pimcore_override_output_timestamp=1617647400','[]','vashu sharma <vashusharma2625@gmail.com>',NULL,NULL,NULL,NULL,1617700249,'Products Feedback'),(3,5,'','[]','vashu sharma <vashusharma2625@gmail.com>',NULL,NULL,NULL,NULL,1617700987,'New Arrival'),(4,5,'','[]','vashu sharma <vashusharma2625@gmail.com>',NULL,NULL,NULL,NULL,1617729135,'New Arrival'),(5,5,'','[]','vashu sharma <vashusharma2625@gmail.com>',NULL,NULL,NULL,NULL,1617729370,'New Arrival');
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glossary`
--

DROP TABLE IF EXISTS `glossary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glossary` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(10) DEFAULT NULL,
  `casesensitive` tinyint(1) DEFAULT NULL,
  `exactmatch` tinyint(1) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `abbr` varchar(255) DEFAULT NULL,
  `acronym` varchar(255) DEFAULT NULL,
  `site` int unsigned DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `language` (`language`),
  KEY `site` (`site`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glossary`
--

LOCK TABLES `glossary` WRITE;
/*!40000 ALTER TABLE `glossary` DISABLE KEYS */;
/*!40000 ALTER TABLE `glossary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gridconfig_favourites`
--

DROP TABLE IF EXISTS `gridconfig_favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gridconfig_favourites` (
  `ownerId` int NOT NULL,
  `classId` varchar(50) NOT NULL,
  `objectId` int NOT NULL DEFAULT '0',
  `gridConfigId` int DEFAULT NULL,
  `searchType` varchar(50) NOT NULL DEFAULT '',
  `type` enum('asset','object') NOT NULL DEFAULT 'object',
  PRIMARY KEY (`ownerId`,`classId`,`searchType`,`objectId`),
  KEY `classId` (`classId`),
  KEY `searchType` (`searchType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gridconfig_favourites`
--

LOCK TABLES `gridconfig_favourites` WRITE;
/*!40000 ALTER TABLE `gridconfig_favourites` DISABLE KEYS */;
/*!40000 ALTER TABLE `gridconfig_favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gridconfig_shares`
--

DROP TABLE IF EXISTS `gridconfig_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gridconfig_shares` (
  `gridConfigId` int NOT NULL,
  `sharedWithUserId` int NOT NULL,
  PRIMARY KEY (`gridConfigId`,`sharedWithUserId`),
  KEY `sharedWithUserId` (`sharedWithUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gridconfig_shares`
--

LOCK TABLES `gridconfig_shares` WRITE;
/*!40000 ALTER TABLE `gridconfig_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `gridconfig_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gridconfigs`
--

DROP TABLE IF EXISTS `gridconfigs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gridconfigs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ownerId` int DEFAULT NULL,
  `classId` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `searchType` varchar(50) DEFAULT NULL,
  `type` enum('asset','object') NOT NULL DEFAULT 'object',
  `config` longtext,
  `description` longtext,
  `creationDate` int DEFAULT NULL,
  `modificationDate` int DEFAULT NULL,
  `shareGlobally` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerId` (`ownerId`),
  KEY `classId` (`classId`),
  KEY `searchType` (`searchType`),
  KEY `shareGlobally` (`shareGlobally`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gridconfigs`
--

LOCK TABLES `gridconfigs` WRITE;
/*!40000 ALTER TABLE `gridconfigs` DISABLE KEYS */;
/*!40000 ALTER TABLE `gridconfigs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `http_error_log`
--

DROP TABLE IF EXISTS `http_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `http_error_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `code` int DEFAULT NULL,
  `parametersGet` longtext,
  `parametersPost` longtext,
  `cookies` longtext,
  `serverVars` longtext,
  `date` int unsigned DEFAULT NULL,
  `count` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uri` (`uri`),
  KEY `code` (`code`),
  KEY `date` (`date`),
  KEY `count` (`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `http_error_log`
--

LOCK TABLES `http_error_log` WRITE;
/*!40000 ALTER TABLE `http_error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `http_error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `importconfig_shares`
--

DROP TABLE IF EXISTS `importconfig_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `importconfig_shares` (
  `importConfigId` int NOT NULL,
  `sharedWithUserId` int NOT NULL,
  PRIMARY KEY (`importConfigId`,`sharedWithUserId`),
  KEY `sharedWithUserId` (`sharedWithUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importconfig_shares`
--

LOCK TABLES `importconfig_shares` WRITE;
/*!40000 ALTER TABLE `importconfig_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `importconfig_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `importconfigs`
--

DROP TABLE IF EXISTS `importconfigs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `importconfigs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ownerId` int DEFAULT NULL,
  `classId` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `config` longtext,
  `description` longtext,
  `creationDate` int DEFAULT NULL,
  `modificationDate` int DEFAULT NULL,
  `shareGlobally` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerId` (`ownerId`),
  KEY `classId` (`classId`),
  KEY `shareGlobally` (`shareGlobally`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importconfigs`
--

LOCK TABLES `importconfigs` WRITE;
/*!40000 ALTER TABLE `importconfigs` DISABLE KEYS */;
/*!40000 ALTER TABLE `importconfigs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lock_keys`
--

DROP TABLE IF EXISTS `lock_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lock_keys` (
  `key_id` varchar(64) NOT NULL,
  `key_token` varchar(44) NOT NULL,
  `key_expiration` int unsigned NOT NULL,
  PRIMARY KEY (`key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lock_keys`
--

LOCK TABLES `lock_keys` WRITE;
/*!40000 ALTER TABLE `lock_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `lock_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locks`
--

DROP TABLE IF EXISTS `locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locks` (
  `id` varchar(150) NOT NULL DEFAULT '',
  `date` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locks`
--

LOCK TABLES `locks` WRITE;
/*!40000 ALTER TABLE `locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `cid` int DEFAULT NULL,
  `ctype` enum('asset','document','object') DEFAULT NULL,
  `date` int DEFAULT NULL,
  `user` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `cid_ctype` (`cid`,`ctype`),
  KEY `date` (`date`),
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes_data`
--

DROP TABLE IF EXISTS `notes_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes_data` (
  `id` int NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `type` enum('text','date','document','asset','object','bool') DEFAULT NULL,
  `data` text,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes_data`
--

LOCK TABLES `notes_data` WRITE;
/*!40000 ALTER TABLE `notes_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'info',
  `title` varchar(250) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `sender` int DEFAULT NULL,
  `recipient` int NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modificationDate` timestamp NULL DEFAULT NULL,
  `linkedElementType` enum('document','asset','object') DEFAULT NULL,
  `linkedElement` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipient` (`recipient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `object_brand`
--

DROP TABLE IF EXISTS `object_brand`;
/*!50001 DROP VIEW IF EXISTS `object_brand`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `object_brand` AS SELECT 
 1 AS `oo_id`,
 1 AS `oo_classId`,
 1 AS `oo_className`,
 1 AS `name`,
 1 AS `o_id`,
 1 AS `o_parentId`,
 1 AS `o_type`,
 1 AS `o_key`,
 1 AS `o_path`,
 1 AS `o_index`,
 1 AS `o_published`,
 1 AS `o_creationDate`,
 1 AS `o_modificationDate`,
 1 AS `o_userOwner`,
 1 AS `o_userModification`,
 1 AS `o_classId`,
 1 AS `o_className`,
 1 AS `o_childrenSortBy`,
 1 AS `o_childrenSortOrder`,
 1 AS `o_versionCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `object_brick_query_AcFeatures_product`
--

DROP TABLE IF EXISTS `object_brick_query_AcFeatures_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_query_AcFeatures_product` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `capacity__value` double DEFAULT NULL,
  `capacity__unit` varchar(50) DEFAULT NULL,
  `installationType` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_query_AcFeatures_product`
--

LOCK TABLES `object_brick_query_AcFeatures_product` WRITE;
/*!40000 ALTER TABLE `object_brick_query_AcFeatures_product` DISABLE KEYS */;
INSERT INTO `object_brick_query_AcFeatures_product` VALUES (9,'specificFeatures',1,'ton','split'),(15,'specificFeatures',2,'kg','split');
/*!40000 ALTER TABLE `object_brick_query_AcFeatures_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_query_FanFeatures_product`
--

DROP TABLE IF EXISTS `object_brick_query_FanFeatures_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_query_FanFeatures_product` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `speed__value` double DEFAULT NULL,
  `speed__unit` varchar(50) DEFAULT NULL,
  `blades` double DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_query_FanFeatures_product`
--

LOCK TABLES `object_brick_query_FanFeatures_product` WRITE;
/*!40000 ALTER TABLE `object_brick_query_FanFeatures_product` DISABLE KEYS */;
INSERT INTO `object_brick_query_FanFeatures_product` VALUES (18,'specificFeatures',20,'speed',4),(19,'specificFeatures',20,'speed',4),(29,'specificFeatures',20,'speed',4),(33,'specificFeatures',20,'speed',4),(35,'specificFeatures',20,'speed',4);
/*!40000 ALTER TABLE `object_brick_query_FanFeatures_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_query_GeyserFeatures_product`
--

DROP TABLE IF EXISTS `object_brick_query_GeyserFeatures_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_query_GeyserFeatures_product` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `capacity__value` double DEFAULT NULL,
  `capacity__unit` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_query_GeyserFeatures_product`
--

LOCK TABLES `object_brick_query_GeyserFeatures_product` WRITE;
/*!40000 ALTER TABLE `object_brick_query_GeyserFeatures_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_brick_query_GeyserFeatures_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_query_RefrigeratorFeatures_product`
--

DROP TABLE IF EXISTS `object_brick_query_RefrigeratorFeatures_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_query_RefrigeratorFeatures_product` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `capacity__value` double DEFAULT NULL,
  `capacity__unit` varchar(50) DEFAULT NULL,
  `doorStyle` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_query_RefrigeratorFeatures_product`
--

LOCK TABLES `object_brick_query_RefrigeratorFeatures_product` WRITE;
/*!40000 ALTER TABLE `object_brick_query_RefrigeratorFeatures_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_brick_query_RefrigeratorFeatures_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_store_AcFeatures_product`
--

DROP TABLE IF EXISTS `object_brick_store_AcFeatures_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_store_AcFeatures_product` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `capacity__value` double DEFAULT NULL,
  `capacity__unit` varchar(50) DEFAULT NULL,
  `installationType` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_store_AcFeatures_product`
--

LOCK TABLES `object_brick_store_AcFeatures_product` WRITE;
/*!40000 ALTER TABLE `object_brick_store_AcFeatures_product` DISABLE KEYS */;
INSERT INTO `object_brick_store_AcFeatures_product` VALUES (9,'specificFeatures',1,'ton','split'),(15,'specificFeatures',2,'kg','split');
/*!40000 ALTER TABLE `object_brick_store_AcFeatures_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_store_FanFeatures_product`
--

DROP TABLE IF EXISTS `object_brick_store_FanFeatures_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_store_FanFeatures_product` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `speed__value` double DEFAULT NULL,
  `speed__unit` varchar(50) DEFAULT NULL,
  `blades` double DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_store_FanFeatures_product`
--

LOCK TABLES `object_brick_store_FanFeatures_product` WRITE;
/*!40000 ALTER TABLE `object_brick_store_FanFeatures_product` DISABLE KEYS */;
INSERT INTO `object_brick_store_FanFeatures_product` VALUES (18,'specificFeatures',20,'speed',4),(19,'specificFeatures',20,'speed',4),(29,'specificFeatures',20,'speed',4),(33,'specificFeatures',20,'speed',4),(35,'specificFeatures',20,'speed',4);
/*!40000 ALTER TABLE `object_brick_store_FanFeatures_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_store_GeyserFeatures_product`
--

DROP TABLE IF EXISTS `object_brick_store_GeyserFeatures_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_store_GeyserFeatures_product` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `capacity__value` double DEFAULT NULL,
  `capacity__unit` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_store_GeyserFeatures_product`
--

LOCK TABLES `object_brick_store_GeyserFeatures_product` WRITE;
/*!40000 ALTER TABLE `object_brick_store_GeyserFeatures_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_brick_store_GeyserFeatures_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_store_RefrigeratorFeatures_product`
--

DROP TABLE IF EXISTS `object_brick_store_RefrigeratorFeatures_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_store_RefrigeratorFeatures_product` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `capacity__value` double DEFAULT NULL,
  `capacity__unit` varchar(50) DEFAULT NULL,
  `doorStyle` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_store_RefrigeratorFeatures_product`
--

LOCK TABLES `object_brick_store_RefrigeratorFeatures_product` WRITE;
/*!40000 ALTER TABLE `object_brick_store_RefrigeratorFeatures_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_brick_store_RefrigeratorFeatures_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `object_category`
--

DROP TABLE IF EXISTS `object_category`;
/*!50001 DROP VIEW IF EXISTS `object_category`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `object_category` AS SELECT 
 1 AS `oo_id`,
 1 AS `oo_classId`,
 1 AS `oo_className`,
 1 AS `name`,
 1 AS `description`,
 1 AS `image`,
 1 AS `active`,
 1 AS `o_id`,
 1 AS `o_parentId`,
 1 AS `o_type`,
 1 AS `o_key`,
 1 AS `o_path`,
 1 AS `o_index`,
 1 AS `o_published`,
 1 AS `o_creationDate`,
 1 AS `o_modificationDate`,
 1 AS `o_userOwner`,
 1 AS `o_userModification`,
 1 AS `o_classId`,
 1 AS `o_className`,
 1 AS `o_childrenSortBy`,
 1 AS `o_childrenSortOrder`,
 1 AS `o_versionCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `object_feedback`
--

DROP TABLE IF EXISTS `object_feedback`;
/*!50001 DROP VIEW IF EXISTS `object_feedback`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `object_feedback` AS SELECT 
 1 AS `oo_id`,
 1 AS `oo_classId`,
 1 AS `oo_className`,
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `email`,
 1 AS `comment`,
 1 AS `o_id`,
 1 AS `o_parentId`,
 1 AS `o_type`,
 1 AS `o_key`,
 1 AS `o_path`,
 1 AS `o_index`,
 1 AS `o_published`,
 1 AS `o_creationDate`,
 1 AS `o_modificationDate`,
 1 AS `o_userOwner`,
 1 AS `o_userModification`,
 1 AS `o_classId`,
 1 AS `o_className`,
 1 AS `o_childrenSortBy`,
 1 AS `o_childrenSortOrder`,
 1 AS `o_versionCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `object_import`
--

DROP TABLE IF EXISTS `object_import`;
/*!50001 DROP VIEW IF EXISTS `object_import`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `object_import` AS SELECT 
 1 AS `oo_id`,
 1 AS `oo_classId`,
 1 AS `oo_className`,
 1 AS `name`,
 1 AS `file__id`,
 1 AS `file__type`,
 1 AS `status`,
 1 AS `o_id`,
 1 AS `o_parentId`,
 1 AS `o_type`,
 1 AS `o_key`,
 1 AS `o_path`,
 1 AS `o_index`,
 1 AS `o_published`,
 1 AS `o_creationDate`,
 1 AS `o_modificationDate`,
 1 AS `o_userOwner`,
 1 AS `o_userModification`,
 1 AS `o_classId`,
 1 AS `o_className`,
 1 AS `o_childrenSortBy`,
 1 AS `o_childrenSortOrder`,
 1 AS `o_versionCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `object_log`
--

DROP TABLE IF EXISTS `object_log`;
/*!50001 DROP VIEW IF EXISTS `object_log`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `object_log` AS SELECT 
 1 AS `oo_id`,
 1 AS `oo_classId`,
 1 AS `oo_className`,
 1 AS `message`,
 1 AS `o_id`,
 1 AS `o_parentId`,
 1 AS `o_type`,
 1 AS `o_key`,
 1 AS `o_path`,
 1 AS `o_index`,
 1 AS `o_published`,
 1 AS `o_creationDate`,
 1 AS `o_modificationDate`,
 1 AS `o_userOwner`,
 1 AS `o_userModification`,
 1 AS `o_classId`,
 1 AS `o_className`,
 1 AS `o_childrenSortBy`,
 1 AS `o_childrenSortOrder`,
 1 AS `o_versionCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `object_product`
--

DROP TABLE IF EXISTS `object_product`;
/*!50001 DROP VIEW IF EXISTS `object_product`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `object_product` AS SELECT 
 1 AS `oo_id`,
 1 AS `oo_classId`,
 1 AS `oo_className`,
 1 AS `brand`,
 1 AS `modelNo`,
 1 AS `name`,
 1 AS `category__id`,
 1 AS `category__type`,
 1 AS `price__value`,
 1 AS `price__unit`,
 1 AS `quantityInStock`,
 1 AS `colour__rgb`,
 1 AS `colour__a`,
 1 AS `image`,
 1 AS `weight__value`,
 1 AS `weight__unit`,
 1 AS `ratings`,
 1 AS `voltage__value`,
 1 AS `voltage__unit`,
 1 AS `wattage__value`,
 1 AS `wattage__unit`,
 1 AS `launchDate`,
 1 AS `description`,
 1 AS `o_id`,
 1 AS `o_parentId`,
 1 AS `o_type`,
 1 AS `o_key`,
 1 AS `o_path`,
 1 AS `o_index`,
 1 AS `o_published`,
 1 AS `o_creationDate`,
 1 AS `o_modificationDate`,
 1 AS `o_userOwner`,
 1 AS `o_userModification`,
 1 AS `o_classId`,
 1 AS `o_className`,
 1 AS `o_childrenSortBy`,
 1 AS `o_childrenSortOrder`,
 1 AS `o_versionCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `object_query_brand`
--

DROP TABLE IF EXISTS `object_query_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_query_brand` (
  `oo_id` int NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'brand',
  `oo_className` varchar(255) DEFAULT 'brand',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_query_brand`
--

LOCK TABLES `object_query_brand` WRITE;
/*!40000 ALTER TABLE `object_query_brand` DISABLE KEYS */;
INSERT INTO `object_query_brand` VALUES (11,'brand','brand','LG'),(14,'brand','brand','Samsung'),(38,'brand','brand','havells');
/*!40000 ALTER TABLE `object_query_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_query_category`
--

DROP TABLE IF EXISTS `object_query_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_query_category` (
  `oo_id` int NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'category',
  `oo_className` varchar(255) DEFAULT 'category',
  `name` varchar(190) DEFAULT NULL,
  `description` longtext,
  `image` int DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_query_category`
--

LOCK TABLES `object_query_category` WRITE;
/*!40000 ALTER TABLE `object_query_category` DISABLE KEYS */;
INSERT INTO `object_query_category` VALUES (8,'category','category','AC','A system for controlling the humidity, ventilation, and temperature in a building or vehicle, typically to maintain a cool atmosphere in warm conditions.',3,1),(12,'category','category','Fan',NULL,NULL,NULL),(13,'category','category','Refrigerator',NULL,NULL,NULL),(39,'category','category','geyser','name',NULL,NULL);
/*!40000 ALTER TABLE `object_query_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_query_feedback`
--

DROP TABLE IF EXISTS `object_query_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_query_feedback` (
  `oo_id` int NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'feedback',
  `oo_className` varchar(255) DEFAULT 'feedback',
  `firstname` varchar(190) DEFAULT NULL,
  `lastname` varchar(190) DEFAULT NULL,
  `email` varchar(190) DEFAULT NULL,
  `comment` longtext,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_query_feedback`
--

LOCK TABLES `object_query_feedback` WRITE;
/*!40000 ALTER TABLE `object_query_feedback` DISABLE KEYS */;
INSERT INTO `object_query_feedback` VALUES (23,'feedback','feedback','rahul','sharma','vashusharma1104@gmail.com','some'),(24,'feedback','feedback','ramesh','sh','vashusharma1104@gmail.com','some'),(25,'feedback','feedback','r','s','vashusharma1104@gmail.com','s'),(26,'feedback','feedback','v','s','vashusharma1104@gmail.com','s');
/*!40000 ALTER TABLE `object_query_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_query_import`
--

DROP TABLE IF EXISTS `object_query_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_query_import` (
  `oo_id` int NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'import',
  `oo_className` varchar(255) DEFAULT 'import',
  `name` varchar(190) DEFAULT NULL,
  `file__id` int DEFAULT NULL,
  `file__type` enum('document','asset','object') DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_query_import`
--

LOCK TABLES `object_query_import` WRITE;
/*!40000 ALTER TABLE `object_query_import` DISABLE KEYS */;
INSERT INTO `object_query_import` VALUES (17,'import','import','Product',23,'asset',1);
/*!40000 ALTER TABLE `object_query_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_query_log`
--

DROP TABLE IF EXISTS `object_query_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_query_log` (
  `oo_id` int NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'log',
  `oo_className` varchar(255) DEFAULT 'log',
  `message` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_query_log`
--

LOCK TABLES `object_query_log` WRITE;
/*!40000 ALTER TABLE `object_query_log` DISABLE KEYS */;
INSERT INTO `object_query_log` VALUES (34,'log','log','Data Imported Successfully.\n'),(36,'log','log','Data Imported Successfully.\n');
/*!40000 ALTER TABLE `object_query_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_query_product`
--

DROP TABLE IF EXISTS `object_query_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_query_product` (
  `oo_id` int NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT 'product',
  `oo_className` varchar(255) DEFAULT 'product',
  `brand` varchar(190) DEFAULT NULL,
  `modelNo` varchar(190) DEFAULT NULL,
  `name` varchar(190) DEFAULT NULL,
  `category__id` int DEFAULT NULL,
  `category__type` enum('document','asset','object') DEFAULT NULL,
  `price__value` double DEFAULT NULL,
  `price__unit` varchar(50) DEFAULT NULL,
  `quantityInStock` double DEFAULT NULL,
  `colour__rgb` varchar(6) DEFAULT NULL,
  `colour__a` varchar(2) DEFAULT NULL,
  `image` int DEFAULT NULL,
  `weight__value` double DEFAULT NULL,
  `weight__unit` varchar(50) DEFAULT NULL,
  `ratings` varchar(190) DEFAULT NULL,
  `voltage__value` double DEFAULT NULL,
  `voltage__unit` varchar(50) DEFAULT NULL,
  `wattage__value` double DEFAULT NULL,
  `wattage__unit` varchar(50) DEFAULT NULL,
  `launchDate` bigint DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_query_product`
--

LOCK TABLES `object_query_product` WRITE;
/*!40000 ALTER TABLE `object_query_product` DISABLE KEYS */;
INSERT INTO `object_query_product` VALUES (9,'product','product','LG','abc','LG 1.5 Ton 5-Star Inverter Split AC – KS-Q18YNZA',8,'object',101,'rupees',5,'fd0808','ff',3,100,'kg','5 Star',1,'volts',1,'watt',1617388200,NULL),(15,'product','product','Samsung','2345','Lg sony Ac',8,'object',20000,'rupees',3,'46c41a','ff',5,3,'kg','4 Star',220,NULL,1.5,NULL,1617647400,NULL),(18,'product','product','','abc','FanFeatures',12,'object',100,'rupees',2,'000000','ff',NULL,20,'kg','5 Star',220,'volts',10,'watt',1622066400,'description'),(19,'product','product','LG','abc','FanFeatures',12,'object',100,'rupees',2,'000000','ff',NULL,20,'kg','5 Star',220,'volts',10,'watt',1622066400,'description'),(29,'product','product','LG','abc','FanFeatures',12,'object',100,'rupees',2,'000000','ff',NULL,20,'kg','5 Star',220,'volts',10,'watt',1622066400,'description'),(33,'product','product','LG','abc','FanFeatures',12,'object',100,'rupees',2,'000000','ff',NULL,20,'kg','5 Star',220,'volts',10,'watt',1622066400,'description'),(35,'product','product','LG','abc','FanFeatures',12,'object',100,'rupees',2,'000000','ff',22,20,'kg','5 Star',220,'volts',10,'watt',1622066400,'description'),(37,'product','product','havells','a209378','havells geyser',39,'object',2250,NULL,NULL,NULL,NULL,24,NULL,NULL,'',NULL,NULL,NULL,NULL,1617820200,'great capactity');
/*!40000 ALTER TABLE `object_query_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_relations_brand`
--

DROP TABLE IF EXISTS `object_relations_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_relations_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int NOT NULL DEFAULT '0',
  `dest_id` int NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_relations_brand`
--

LOCK TABLES `object_relations_brand` WRITE;
/*!40000 ALTER TABLE `object_relations_brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_relations_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_relations_category`
--

DROP TABLE IF EXISTS `object_relations_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_relations_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int NOT NULL DEFAULT '0',
  `dest_id` int NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_relations_category`
--

LOCK TABLES `object_relations_category` WRITE;
/*!40000 ALTER TABLE `object_relations_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_relations_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_relations_feedback`
--

DROP TABLE IF EXISTS `object_relations_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_relations_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int NOT NULL DEFAULT '0',
  `dest_id` int NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_relations_feedback`
--

LOCK TABLES `object_relations_feedback` WRITE;
/*!40000 ALTER TABLE `object_relations_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_relations_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_relations_import`
--

DROP TABLE IF EXISTS `object_relations_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_relations_import` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int NOT NULL DEFAULT '0',
  `dest_id` int NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_relations_import`
--

LOCK TABLES `object_relations_import` WRITE;
/*!40000 ALTER TABLE `object_relations_import` DISABLE KEYS */;
INSERT INTO `object_relations_import` VALUES (6,17,23,'asset','file',0,'object','','0');
/*!40000 ALTER TABLE `object_relations_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_relations_log`
--

DROP TABLE IF EXISTS `object_relations_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_relations_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int NOT NULL DEFAULT '0',
  `dest_id` int NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_relations_log`
--

LOCK TABLES `object_relations_log` WRITE;
/*!40000 ALTER TABLE `object_relations_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_relations_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_relations_product`
--

DROP TABLE IF EXISTS `object_relations_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_relations_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int NOT NULL DEFAULT '0',
  `dest_id` int NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_relations_product`
--

LOCK TABLES `object_relations_product` WRITE;
/*!40000 ALTER TABLE `object_relations_product` DISABLE KEYS */;
INSERT INTO `object_relations_product` VALUES (4,9,8,'object','category',0,'object','','0'),(5,15,8,'object','category',0,'object','','0'),(6,18,12,'object','category',0,'object','','0'),(7,19,12,'object','category',0,'object','','0'),(10,29,12,'object','category',0,'object','','0'),(12,33,12,'object','category',0,'object','','0'),(13,35,12,'object','category',0,'object','','0'),(14,37,39,'object','category',0,'object','','0');
/*!40000 ALTER TABLE `object_relations_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_store_brand`
--

DROP TABLE IF EXISTS `object_store_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_store_brand` (
  `oo_id` int NOT NULL DEFAULT '0',
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_store_brand`
--

LOCK TABLES `object_store_brand` WRITE;
/*!40000 ALTER TABLE `object_store_brand` DISABLE KEYS */;
INSERT INTO `object_store_brand` VALUES (11,'LG'),(14,'Samsung'),(38,'havells');
/*!40000 ALTER TABLE `object_store_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_store_category`
--

DROP TABLE IF EXISTS `object_store_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_store_category` (
  `oo_id` int NOT NULL DEFAULT '0',
  `name` varchar(190) DEFAULT NULL,
  `description` longtext,
  `image` int DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_store_category`
--

LOCK TABLES `object_store_category` WRITE;
/*!40000 ALTER TABLE `object_store_category` DISABLE KEYS */;
INSERT INTO `object_store_category` VALUES (8,'AC','A system for controlling the humidity, ventilation, and temperature in a building or vehicle, typically to maintain a cool atmosphere in warm conditions.',3,1),(12,'Fan',NULL,NULL,NULL),(13,'Refrigerator',NULL,NULL,NULL),(39,'geyser','name',NULL,NULL);
/*!40000 ALTER TABLE `object_store_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_store_feedback`
--

DROP TABLE IF EXISTS `object_store_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_store_feedback` (
  `oo_id` int NOT NULL DEFAULT '0',
  `firstname` varchar(190) DEFAULT NULL,
  `lastname` varchar(190) DEFAULT NULL,
  `email` varchar(190) DEFAULT NULL,
  `comment` longtext,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_store_feedback`
--

LOCK TABLES `object_store_feedback` WRITE;
/*!40000 ALTER TABLE `object_store_feedback` DISABLE KEYS */;
INSERT INTO `object_store_feedback` VALUES (23,'rahul','sharma','vashusharma1104@gmail.com','some'),(24,'ramesh','sh','vashusharma1104@gmail.com','some'),(25,'r','s','vashusharma1104@gmail.com','s'),(26,'v','s','vashusharma1104@gmail.com','s');
/*!40000 ALTER TABLE `object_store_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_store_import`
--

DROP TABLE IF EXISTS `object_store_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_store_import` (
  `oo_id` int NOT NULL DEFAULT '0',
  `name` varchar(190) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_store_import`
--

LOCK TABLES `object_store_import` WRITE;
/*!40000 ALTER TABLE `object_store_import` DISABLE KEYS */;
INSERT INTO `object_store_import` VALUES (17,'Product',1);
/*!40000 ALTER TABLE `object_store_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_store_log`
--

DROP TABLE IF EXISTS `object_store_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_store_log` (
  `oo_id` int NOT NULL DEFAULT '0',
  `message` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_store_log`
--

LOCK TABLES `object_store_log` WRITE;
/*!40000 ALTER TABLE `object_store_log` DISABLE KEYS */;
INSERT INTO `object_store_log` VALUES (34,'Data Imported Successfully.\n'),(36,'Data Imported Successfully.\n');
/*!40000 ALTER TABLE `object_store_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_store_product`
--

DROP TABLE IF EXISTS `object_store_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_store_product` (
  `oo_id` int NOT NULL DEFAULT '0',
  `brand` varchar(190) DEFAULT NULL,
  `modelNo` varchar(190) DEFAULT NULL,
  `name` varchar(190) DEFAULT NULL,
  `price__value` double DEFAULT NULL,
  `price__unit` varchar(50) DEFAULT NULL,
  `quantityInStock` double DEFAULT NULL,
  `colour__rgb` varchar(6) DEFAULT NULL,
  `colour__a` varchar(2) DEFAULT NULL,
  `image` int DEFAULT NULL,
  `weight__value` double DEFAULT NULL,
  `weight__unit` varchar(50) DEFAULT NULL,
  `ratings` varchar(190) DEFAULT NULL,
  `voltage__value` double DEFAULT NULL,
  `voltage__unit` varchar(50) DEFAULT NULL,
  `wattage__value` double DEFAULT NULL,
  `wattage__unit` varchar(50) DEFAULT NULL,
  `launchDate` bigint DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_store_product`
--

LOCK TABLES `object_store_product` WRITE;
/*!40000 ALTER TABLE `object_store_product` DISABLE KEYS */;
INSERT INTO `object_store_product` VALUES (9,'LG','abc','LG 1.5 Ton 5-Star Inverter Split AC – KS-Q18YNZA',101,'rupees',5,'fd0808','ff',3,100,'kg','5 Star',1,'volts',1,'watt',1617388200,NULL),(15,'Samsung','2345','Lg sony Ac',20000,'rupees',3,'46c41a','ff',5,3,'kg','4 Star',220,NULL,1.5,NULL,1617647400,NULL),(18,'','abc','FanFeatures',100,'rupees',2,'000000','ff',NULL,20,'kg','5 Star',220,'volts',10,'watt',1622066400,'description'),(19,'LG','abc','FanFeatures',100,'rupees',2,'000000','ff',NULL,20,'kg','5 Star',220,'volts',10,'watt',1622066400,'description'),(29,'LG','abc','FanFeatures',100,'rupees',2,'000000','ff',NULL,20,'kg','5 Star',220,'volts',10,'watt',1622066400,'description'),(33,'LG','abc','FanFeatures',100,'rupees',2,'000000','ff',NULL,20,'kg','5 Star',220,'volts',10,'watt',1622066400,'description'),(35,'LG','abc','FanFeatures',100,'rupees',2,'000000','ff',22,20,'kg','5 Star',220,'volts',10,'watt',1622066400,'description'),(37,'havells','a209378','havells geyser',2250,NULL,NULL,NULL,NULL,24,NULL,NULL,'',NULL,NULL,NULL,NULL,1617820200,'great capactity');
/*!40000 ALTER TABLE `object_store_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_url_slugs`
--

DROP TABLE IF EXISTS `object_url_slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_url_slugs` (
  `objectId` int NOT NULL DEFAULT '0',
  `classId` varchar(50) NOT NULL DEFAULT '0',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  `slug` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `siteId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`slug`,`siteId`),
  KEY `index` (`index`),
  KEY `objectId` (`objectId`),
  KEY `classId` (`classId`),
  KEY `fieldname` (`fieldname`),
  KEY `position` (`position`),
  KEY `ownertype` (`ownertype`),
  KEY `ownername` (`ownername`),
  KEY `slug` (`slug`),
  KEY `siteId` (`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_url_slugs`
--

LOCK TABLES `object_url_slugs` WRITE;
/*!40000 ALTER TABLE `object_url_slugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_url_slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objects`
--

DROP TABLE IF EXISTS `objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objects` (
  `o_id` int unsigned NOT NULL AUTO_INCREMENT,
  `o_parentId` int unsigned DEFAULT NULL,
  `o_type` enum('object','folder','variant') DEFAULT NULL,
  `o_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `o_path` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `o_index` int unsigned DEFAULT '0',
  `o_published` tinyint unsigned DEFAULT '1',
  `o_creationDate` int unsigned DEFAULT NULL,
  `o_modificationDate` int unsigned DEFAULT NULL,
  `o_userOwner` int unsigned DEFAULT NULL,
  `o_userModification` int unsigned DEFAULT NULL,
  `o_classId` varchar(50) DEFAULT NULL,
  `o_className` varchar(255) DEFAULT NULL,
  `o_childrenSortBy` enum('key','index') DEFAULT NULL,
  `o_childrenSortOrder` enum('ASC','DESC') DEFAULT NULL,
  `o_versionCount` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`o_id`),
  UNIQUE KEY `fullpath` (`o_path`,`o_key`),
  KEY `key` (`o_key`),
  KEY `index` (`o_index`),
  KEY `published` (`o_published`),
  KEY `parentId` (`o_parentId`),
  KEY `type` (`o_type`),
  KEY `o_modificationDate` (`o_modificationDate`),
  KEY `o_classId` (`o_classId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objects`
--

LOCK TABLES `objects` WRITE;
/*!40000 ALTER TABLE `objects` DISABLE KEYS */;
INSERT INTO `objects` VALUES (1,0,'folder','','/',999999,1,1617206059,1617206059,1,1,NULL,NULL,NULL,NULL,0),(3,1,'folder','category','/',NULL,1,1617209699,1617209699,2,2,NULL,NULL,NULL,NULL,2),(4,1,'folder','product','/',NULL,1,1617209706,1617209706,2,2,NULL,NULL,NULL,NULL,2),(8,3,'object','AC','/category/',0,1,1617264289,1617264380,2,2,'category','category',NULL,NULL,3),(9,4,'object','LG 1.5 Ton 5-Star Inverter Split AC – KS-Q18YNZA','/product/',0,1,1617264399,1617367307,2,6,'product','product',NULL,NULL,13),(10,1,'folder','brand','/',NULL,1,1617264471,1617264471,2,2,NULL,NULL,NULL,NULL,2),(11,10,'object','LG','/brand/',0,1,1617264547,1617264554,2,2,'brand','brand',NULL,NULL,2),(12,3,'object','Fan','/category/',0,1,1617264936,1617264942,2,2,'category','category',NULL,NULL,2),(13,3,'object','Refrigerator','/category/',0,1,1617265057,1617265068,2,2,'category','category',NULL,NULL,2),(14,10,'object','Samsung','/brand/',0,1,1617365473,1617365483,2,2,'brand','brand',NULL,NULL,2),(15,4,'object','sony','/product/',0,1,1617512858,1617619428,2,2,'product','product',NULL,NULL,7),(16,1,'folder','import','/',NULL,1,1617643105,1617643104,2,2,NULL,NULL,NULL,NULL,2),(17,16,'object','import1','/import/',0,1,1617643700,1617790798,2,0,'import','import',NULL,NULL,10),(18,4,'object','919101','/product/',NULL,1,1617646090,1617646090,0,0,'product','product',NULL,NULL,1),(19,4,'object','LG ka product','/product/',NULL,1,1617646268,1617646268,0,0,'product','product',NULL,NULL,1),(20,1,'folder','feedback','/',NULL,1,1617699350,1617699350,2,2,NULL,NULL,NULL,NULL,2),(23,20,'object','rahul','/feedback/',NULL,1,1617699599,1617699599,0,0,'feedback','feedback',NULL,NULL,1),(24,20,'object','ramesh','/feedback/',NULL,1,1617699798,1617699798,0,0,'feedback','feedback',NULL,NULL,1),(25,20,'object','r','/feedback/',NULL,1,1617699989,1617699989,0,0,'feedback','feedback',NULL,NULL,1),(26,20,'object','v','/feedback/',NULL,1,1617700245,1617700245,0,0,'feedback','feedback',NULL,NULL,1),(29,4,'object','LG ka product ek aur','/product/',NULL,1,1617700982,1617700982,0,0,'product','product',NULL,NULL,1),(30,1,'folder','log','/',NULL,1,1617728533,1617728533,2,2,NULL,NULL,NULL,NULL,2),(33,4,'object','LG ka product ek aurs','/product/',NULL,1,1617729365,1617729365,0,0,'product','product',NULL,NULL,1),(34,30,'object','LG ka product ek aurs','/log/',NULL,1,1617729365,1617729365,0,0,'log','log',NULL,NULL,1),(35,4,'object','samsung Ac','/product/',NULL,1,1617790797,1617790797,0,0,'product','product',NULL,NULL,1),(36,30,'object','samsung Ac','/log/',NULL,1,1617790797,1617790797,0,0,'log','log',NULL,NULL,1),(37,4,'object','havells geyser','/product/',0,1,1617812542,1617812723,2,2,'product','product',NULL,NULL,2),(38,10,'object','havells','/brand/',0,1,1617812566,1617812574,2,2,'brand','brand',NULL,NULL,2),(39,3,'object','geyser','/category/',0,1,1617812633,1617812647,2,2,'category','category',NULL,NULL,2);
/*!40000 ALTER TABLE `objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimcore_migrations`
--

DROP TABLE IF EXISTS `pimcore_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pimcore_migrations` (
  `migration_set` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `migrated_at` datetime NOT NULL,
  PRIMARY KEY (`migration_set`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimcore_migrations`
--

LOCK TABLES `pimcore_migrations` WRITE;
/*!40000 ALTER TABLE `pimcore_migrations` DISABLE KEYS */;
INSERT INTO `pimcore_migrations` VALUES ('pimcore_core','20180724144005','2021-03-31 21:24:20'),('pimcore_core','20180830113528','2021-03-31 21:24:20'),('pimcore_core','20180830122128','2021-03-31 21:24:20'),('pimcore_core','20180904201947','2021-03-31 21:24:20'),('pimcore_core','20180906142115','2021-03-31 21:24:20'),('pimcore_core','20180907115436','2021-03-31 21:24:20'),('pimcore_core','20180912140913','2021-03-31 21:24:20'),('pimcore_core','20180913132106','2021-03-31 21:24:20'),('pimcore_core','20180924111736','2021-03-31 21:24:20'),('pimcore_core','20181008132414','2021-03-31 21:24:20'),('pimcore_core','20181009135158','2021-03-31 21:24:20'),('pimcore_core','20181115114003','2021-03-31 21:24:20'),('pimcore_core','20181126094412','2021-03-31 21:24:20'),('pimcore_core','20181126144341','2021-03-31 21:24:20'),('pimcore_core','20181128074035','2021-03-31 21:24:20'),('pimcore_core','20181128112320','2021-03-31 21:24:20'),('pimcore_core','20181214145532','2021-03-31 21:24:20'),('pimcore_core','20190102143436','2021-03-31 21:24:20'),('pimcore_core','20190102153226','2021-03-31 21:24:20'),('pimcore_core','20190108131401','2021-03-31 21:24:20'),('pimcore_core','20190124105627','2021-03-31 21:24:20'),('pimcore_core','20190131074054','2021-03-31 21:24:20'),('pimcore_core','20190131095936','2021-03-31 21:24:20'),('pimcore_core','20190320133439','2021-03-31 21:24:20'),('pimcore_core','20190402073052','2021-03-31 21:24:20'),('pimcore_core','20190403120728','2021-03-31 21:24:20'),('pimcore_core','20190405112707','2021-03-31 21:24:20'),('pimcore_core','20190408084129','2021-03-31 21:24:20'),('pimcore_core','20190508074339','2021-03-31 21:24:20'),('pimcore_core','20190515130651','2021-03-31 21:24:20'),('pimcore_core','20190520151448','2021-03-31 21:24:20'),('pimcore_core','20190522130545','2021-03-31 21:24:20'),('pimcore_core','20190527121800','2021-03-31 21:24:20'),('pimcore_core','20190618154000','2021-03-31 21:24:20'),('pimcore_core','20190701141857','2021-03-31 21:24:20'),('pimcore_core','20190708175236','2021-03-31 21:24:20'),('pimcore_core','20190729085052','2021-03-31 21:24:20'),('pimcore_core','20190802090149','2021-03-31 21:24:20'),('pimcore_core','20190806160450','2021-03-31 21:24:21'),('pimcore_core','20190807121356','2021-03-31 21:24:21'),('pimcore_core','20190828142756','2021-03-31 21:24:21'),('pimcore_core','20190902085052','2021-03-31 21:24:21'),('pimcore_core','20190904154339','2021-03-31 21:24:21'),('pimcore_core','20191015131700','2021-03-31 21:24:21'),('pimcore_core','20191107141816','2021-03-31 21:24:21'),('pimcore_core','20191114123638','2021-03-31 21:24:21'),('pimcore_core','20191114132014','2021-03-31 21:24:21'),('pimcore_core','20191121150326','2021-03-31 21:24:21'),('pimcore_core','20191125135853','2021-03-31 21:24:21'),('pimcore_core','20191125200416','2021-03-31 21:24:21'),('pimcore_core','20191126130004','2021-03-31 21:24:21'),('pimcore_core','20191208175348','2021-03-31 21:24:21'),('pimcore_core','20191213115045','2021-03-31 21:24:21'),('pimcore_core','20191218073528','2021-03-31 21:24:21'),('pimcore_core','20191230103524','2021-03-31 21:24:21'),('pimcore_core','20191230104529','2021-03-31 21:24:21'),('pimcore_core','20200113120101','2021-03-31 21:24:21'),('pimcore_core','20200116181758','2021-03-31 21:24:21'),('pimcore_core','20200121095650','2021-03-31 21:24:21'),('pimcore_core','20200121131304','2021-03-31 21:24:21'),('pimcore_core','20200127102432','2021-03-31 21:24:21'),('pimcore_core','20200129102132','2021-03-31 21:24:21'),('pimcore_core','20200210101048','2021-03-31 21:24:21'),('pimcore_core','20200210164037','2021-03-31 21:24:21'),('pimcore_core','20200211115044','2021-03-31 21:24:21'),('pimcore_core','20200212130011','2021-03-31 21:24:21'),('pimcore_core','20200218104052','2021-03-31 21:24:21'),('pimcore_core','20200226102938','2021-03-31 21:24:21'),('pimcore_core','20200310122412','2021-03-31 21:24:21'),('pimcore_core','20200313092019','2021-03-31 21:24:21'),('pimcore_core','20200317163018','2021-03-31 21:24:21'),('pimcore_core','20200318100042','2021-03-31 21:24:21'),('pimcore_core','20200324141723','2021-03-31 21:24:21'),('pimcore_core','20200407120641','2021-03-31 21:24:21'),('pimcore_core','20200407132737','2021-03-31 21:24:21'),('pimcore_core','20200407145422','2021-03-31 21:24:21'),('pimcore_core','20200410112354','2021-03-31 21:24:21'),('pimcore_core','20200421142950','2021-03-31 21:24:21'),('pimcore_core','20200422090352','2021-03-31 21:24:21'),('pimcore_core','20200428082346','2021-03-31 21:24:21'),('pimcore_core','20200428111313','2021-03-31 21:24:21'),('pimcore_core','20200529121630','2021-03-31 21:24:21'),('pimcore_core','20200604110336','2021-03-31 21:24:21'),('pimcore_core','20200619071650','2021-03-31 21:24:21'),('pimcore_core','20200703093410','2021-03-31 21:24:21'),('pimcore_core','20200721123847','2021-03-31 21:24:21'),('pimcore_core','20200807105448','2021-03-31 21:24:21'),('pimcore_core','20200812160035','2021-03-31 21:24:21'),('pimcore_core','20200817133132','2021-03-31 21:24:21'),('pimcore_core','20200820151104','2021-03-31 21:24:21'),('pimcore_core','20200828091305','2021-03-31 21:24:21'),('pimcore_core','20200902111642','2021-03-31 21:24:21'),('pimcore_core','20201001133558','2021-03-31 21:24:21'),('pimcore_core','20201207132025','2021-03-31 21:24:21'),('pimcore_core','20210211152319','2021-03-31 21:24:21');
/*!40000 ALTER TABLE `pimcore_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties` (
  `cid` int unsigned NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `cpath` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(190) NOT NULL DEFAULT '',
  `type` enum('text','document','asset','object','bool','select') DEFAULT NULL,
  `data` text,
  `inheritable` tinyint unsigned DEFAULT '1',
  PRIMARY KEY (`cid`,`ctype`,`name`),
  KEY `getall` (`cpath`,`ctype`,`inheritable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (2,'document','/feedback','navigation_name','text','feedback',0);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quantityvalue_units`
--

DROP TABLE IF EXISTS `quantityvalue_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quantityvalue_units` (
  `id` varchar(50) NOT NULL,
  `group` varchar(50) DEFAULT NULL,
  `abbreviation` varchar(20) DEFAULT NULL,
  `longname` varchar(250) DEFAULT NULL,
  `baseunit` varchar(50) DEFAULT NULL,
  `factor` double DEFAULT NULL,
  `conversionOffset` double DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `converter` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_baseunit` (`baseunit`),
  CONSTRAINT `fk_baseunit` FOREIGN KEY (`baseunit`) REFERENCES `quantityvalue_units` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quantityvalue_units`
--

LOCK TABLES `quantityvalue_units` WRITE;
/*!40000 ALTER TABLE `quantityvalue_units` DISABLE KEYS */;
INSERT INTO `quantityvalue_units` VALUES ('dollar',NULL,'$',NULL,NULL,NULL,NULL,NULL,''),('gm',NULL,'g',NULL,NULL,NULL,NULL,NULL,''),('kg',NULL,'kg',NULL,NULL,NULL,NULL,NULL,''),('rupees',NULL,'Rs',NULL,NULL,NULL,NULL,NULL,''),('speed',NULL,'Rpm',NULL,NULL,NULL,NULL,NULL,''),('ton',NULL,'ton ',NULL,NULL,NULL,NULL,NULL,''),('volts',NULL,'V',NULL,NULL,NULL,NULL,NULL,''),('watt',NULL,'W',NULL,NULL,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `quantityvalue_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recyclebin`
--

DROP TABLE IF EXISTS `recyclebin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recyclebin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(20) DEFAULT NULL,
  `path` varchar(765) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date` int unsigned DEFAULT NULL,
  `deletedby` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recyclebin`
--

LOCK TABLES `recyclebin` WRITE;
/*!40000 ALTER TABLE `recyclebin` DISABLE KEYS */;
INSERT INTO `recyclebin` VALUES (1,'object','object','/cat1',1,1617209687,'admin'),(2,'object','object','/category/cat1',1,1617261527,'admin'),(3,'object','object','/category/Ac',1,1617263771,'admin'),(4,'object','object','/product/product1',1,1617264445,'admin'),(5,'object','object','/vashu',1,1617699569,'admin'),(6,'object','object','/feedback/vashu',1,1617699582,'admin'),(7,'document','page','/feedbackMail',1,1617700169,'admin'),(8,'object','object','/product/LG ka product ek aur',1,1617700866,'admin'),(9,'object','object','/product/LG ka product ek aur',1,1617700882,'admin'),(10,'object','object','/log/LG ka product ek aurs',1,1617729280,'admin'),(11,'object','object','/product/LG ka product ek aurs',1,1617729289,'admin'),(12,'asset','image','/Digital assets/ac.jpeg',1,1617729901,'admin'),(13,'asset','image','/Digital assets/ac.jpeg',1,1617729937,'admin'),(14,'asset','image','/_default_upload_bucket/image1.png',1,1617729945,'admin'),(15,'asset','image','/Digital assets/fan.jpeg',1,1617730007,'admin'),(16,'asset','image','/_default_upload_bucket/fridge.jpeg',1,1617730013,'admin'),(17,'asset','image','/electrical.jpg',1,1617730067,'admin'),(18,'asset','image','/Digital assets/1080957.jpg',1,1617730669,'admin'),(19,'asset','image','/Digital assets/el.jpg',1,1617730674,'admin'),(20,'asset','image','/Digital assets/ac.jpeg',1,1617730979,'admin');
/*!40000 ALTER TABLE `recyclebin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirects`
--

DROP TABLE IF EXISTS `redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redirects` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('entire_uri','path_query','path','auto_create') NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `sourceSite` int DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `targetSite` int DEFAULT NULL,
  `statusCode` varchar(3) DEFAULT NULL,
  `priority` int DEFAULT '0',
  `regex` tinyint(1) DEFAULT NULL,
  `passThroughParameters` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `expiry` int unsigned DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  `userOwner` int unsigned DEFAULT NULL,
  `userModification` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `priority` (`priority`),
  KEY `routing_lookup` (`active`,`regex`,`sourceSite`,`source`,`type`,`expiry`,`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirects`
--

LOCK TABLES `redirects` WRITE;
/*!40000 ALTER TABLE `redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanitycheck`
--

DROP TABLE IF EXISTS `sanitycheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanitycheck` (
  `id` int unsigned NOT NULL,
  `type` enum('document','asset','object') NOT NULL,
  PRIMARY KEY (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanitycheck`
--

LOCK TABLES `sanitycheck` WRITE;
/*!40000 ALTER TABLE `sanitycheck` DISABLE KEYS */;
INSERT INTO `sanitycheck` VALUES (8,'object'),(9,'object'),(15,'object');
/*!40000 ALTER TABLE `sanitycheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_tasks`
--

DROP TABLE IF EXISTS `schedule_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_tasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cid` int unsigned DEFAULT NULL,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `date` int unsigned DEFAULT NULL,
  `action` enum('publish','unpublish','delete','publish-version') DEFAULT NULL,
  `version` bigint unsigned DEFAULT NULL,
  `active` tinyint unsigned DEFAULT '0',
  `userId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`),
  KEY `active` (`active`),
  KEY `version` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_tasks`
--

LOCK TABLES `schedule_tasks` WRITE;
/*!40000 ALTER TABLE `schedule_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_backend_data`
--

DROP TABLE IF EXISTS `search_backend_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_backend_data` (
  `id` int NOT NULL,
  `fullpath` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `maintype` varchar(8) NOT NULL DEFAULT '',
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(190) DEFAULT NULL,
  `published` tinyint unsigned DEFAULT NULL,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  `userOwner` int DEFAULT NULL,
  `userModification` int DEFAULT NULL,
  `data` longtext,
  `properties` text,
  PRIMARY KEY (`id`,`maintype`),
  KEY `fullpath` (`fullpath`),
  KEY `maintype` (`maintype`),
  KEY `type` (`type`),
  KEY `subtype` (`subtype`),
  KEY `published` (`published`),
  FULLTEXT KEY `fulltext` (`data`,`properties`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_backend_data`
--

LOCK TABLES `search_backend_data` WRITE;
/*!40000 ALTER TABLE `search_backend_data` DISABLE KEYS */;
INSERT INTO `search_backend_data` VALUES (2,'/Digital assets','asset','folder','folder',1,1617264005,1617366034,2,2,'ID: 2  \nPath: /Digital assets  \nDigital assets Digital assets',''),(2,'/feedback','document','page','page',1,1617698680,1617698920,2,2,'ID: 2  \nPath: /feedback  \nfeedback feedback feedback','navigation_name:feedback '),(3,'/category','object','folder','folder',1,1617209699,1617209699,2,2,'ID: 3  \nPath: /category  \ncategory category',''),(4,'/_default_upload_bucket','asset','folder','folder',1,1617512971,1617512971,1,0,'ID: 4  \nPath: /_default_upload_bucket  \n_default_upload_bucket default upload bucket',''),(4,'/feedbackMail','document','email','email',1,1617700180,1617701039,2,2,'ID: 4  \nPath: /feedbackMail  \nfeedbackMailfeedback was given feedbackMail',''),(4,'/product','object','folder','folder',1,1617209706,1617209706,2,2,'ID: 4  \nPath: /product  \nproduct product',''),(5,'/importEmail','document','email','email',1,1617700338,1617701032,2,2,'ID: 5  \nPath: /importEmail  \nimportEmailnew products have been added importEmail',''),(6,'/_default_upload_bucket/newfile.csv','asset','text','text',1,1617643726,1617643726,2,2,'ID: 6  \nPath: /_default_upload_bucket/newfile.csv  \nnewfile.csv key name price colour modelNo description quantityInStock weight voltage wattage image speed blades ratings launchDate category colour 919101 FanFeatures 100 255 255 100 100 abc description 220 /image/fridge.jpeg Star 27-05-2021 flats 255 default upload bucket newfile csv',''),(7,'/_default_upload_bucket/newfile_1.csv','asset','text','text',1,1617644652,1617644652,2,2,'ID: 7  \nPath: /_default_upload_bucket/newfile_1.csv  \nnewfile_1.csv key name price modelNo description quantityInStock weight voltage wattage image speed blades ratings launchDate category colour 919101 FanFeatures 100 abc description 220 /image/fridge.jpeg Star 27-05-2021 Fan 255 255 default upload bucket newfile csv',''),(8,'/_default_upload_bucket/newfile_2.csv','asset','text','text',1,1617646260,1617646260,2,2,'ID: 8  \nPath: /_default_upload_bucket/newfile_2.csv  \nnewfile_2.csv key name price modelNo description quantityInStock weight voltage wattage image speed blades ratings launchDate category colour brand product FanFeatures 100 abc description 220 /image/fridge.jpeg Star 27-05-2021 Fan 255 255 default upload bucket newfile csv',''),(8,'/category/AC','object','object','category',1,1617264289,1617264380,2,2,'ID: 8  \nPath: /category/AC  \nsystem for controlling the humidity ventilation and temperature building vehicle typically maintain cool atmosphere warm conditions. category',''),(9,'/_default_upload_bucket/newfile_3.csv','asset','text','text',1,1617700788,1617700788,2,2,'ID: 9  \nPath: /_default_upload_bucket/newfile_3.csv  \nnewfile_3.csv key name price modelNo description quantityInStock weight voltage wattage image speed blades ratings launchDate category colour brand product aur FanFeatures 100 abc description 220 /image/fridge.jpeg Star 27-05-2021 Fan 255 255 default upload bucket newfile csv',''),(9,'/product/LG 1.5 Ton 5-Star Inverter Split AC – KS-Q18YNZA','object','object','product',1,1617264399,1617367307,2,6,'ID: 9  \nPath: /product/LG 1.5 Ton 5-Star Inverter Split AC – KS-Q18YNZA  \n1.5 Ton 5-Star Inverter Split KS-Q18YNZA abc 1.5 Ton 5-Star Inverter Split KS-Q18YNZA 101 #fd0808ff 100 Star ton split product Ton Star Inverter Split Q18YNZA',''),(10,'/_default_upload_bucket/newfile_4.csv','asset','text','text',1,1617729061,1617729061,2,2,'ID: 10  \nPath: /_default_upload_bucket/newfile_4.csv  \nnewfile_4.csv key name price modelNo description quantityInStock weight voltage wattage image speed blades ratings launchDate category colour brand product aurs FanFeatures 100 abc description 220 /image/fridge.jpeg Star 27-05-2021 Fan 255 255 default upload bucket newfile csv',''),(10,'/brand','object','folder','folder',1,1617264471,1617264471,2,2,'ID: 10  \nPath: /brand  \nbrand brand',''),(11,'/brand/LG','object','object','brand',1,1617264547,1617264554,2,2,'ID: 11  \nPath: /brand/LG  \nbrand',''),(12,'/category/Fan','object','object','category',1,1617264936,1617264942,2,2,'ID: 12  \nPath: /category/Fan  \nFan Fan category Fan',''),(13,'/category/Refrigerator','object','object','category',1,1617265057,1617265068,2,2,'ID: 13  \nPath: /category/Refrigerator  \nRefrigerator Refrigerator category Refrigerator',''),(14,'/brand/Samsung','object','object','brand',1,1617365473,1617365483,2,2,'ID: 14  \nPath: /brand/Samsung  \nSamsung Samsung brand Samsung',''),(15,'/_default_upload_bucket/electrical.jpg','asset','image','image',1,1617730088,1617730088,2,2,'ID: 15  \nPath: /_default_upload_bucket/electrical.jpg  \nelectrical.jpg FileName electrical.jpg FileDateTime 1617730088 FileSize 63379 FileType MimeType image/jpeg SectionsFound default upload bucket electrical jpg',''),(15,'/product/sony','object','object','product',1,1617512858,1617619428,2,2,'ID: 15  \nPath: /product/sony  \nsony Samsung 2345 sony 20000 #46c41aff Star 220 1.5 split product sony',''),(16,'/import','object','folder','folder',1,1617643105,1617643104,2,2,'ID: 16  \nPath: /import  \nimport import',''),(17,'/import/import1','object','object','import',1,1617643700,1617790798,2,0,'ID: 17  \nPath: /import/import1  \nimport1 Product import import1',''),(18,'/product/919101','object','object','product',1,1617646090,1617646090,0,0,'ID: 18  \nPath: /product/919101  \n919101 abc FanFeatures 100 #000000ff Star 220 Rpm description product 919101',''),(19,'/Digital assets/ac.jpeg','asset','image','image',1,1617769316,1617769316,2,2,'ID: 19  \nPath: /Digital assets/ac.jpeg  \nac.jpeg FileName ac.jpeg FileDateTime 1617769316 FileSize 4145 FileType MimeType image/jpeg SectionsFound Digital assets jpeg',''),(19,'/product/LG ka product','object','object','product',1,1617646268,1617646268,0,0,'ID: 19  \nPath: /product/LG ka product  \nproduct abc FanFeatures description 100 #000000ff Star 220 Rpm product product',''),(20,'/_default_upload_bucket/Screenshot from 2021-03-16 15-16-10.png','asset','image','image',1,1617790140,1617790140,2,2,'ID: 20  \nPath: /_default_upload_bucket/Screenshot from 2021-03-16 15-16-10.png  \nScreenshot from 2021-03-16 15-16-10.png default upload bucket Screenshot from 2021 png',''),(20,'/feedback','object','folder','folder',1,1617699350,1617699350,2,2,'ID: 20  \nPath: /feedback  \nfeedback feedback',''),(21,'/image','asset','folder','folder',1,1617790599,1617790599,2,2,'ID: 21  \nPath: /image  \nimage image',''),(22,'/image/download.jpeg','asset','image','image',1,1617790615,1617790615,2,2,'ID: 22  \nPath: /image/download.jpeg  \ndownload.jpeg FileName download.jpeg FileDateTime 1617790615 FileSize 2447 FileType MimeType image/jpeg SectionsFound image download jpeg',''),(23,'/_default_upload_bucket/newfile_5.csv','asset','text','text',1,1617790669,1617790669,2,2,'ID: 23  \nPath: /_default_upload_bucket/newfile_5.csv  \nnewfile_5.csv key name price modelNo description quantityInStock weight voltage wattage image speed blades ratings launchDate category colour brand samsung FanFeatures 100 abc description 220 /image/download.jpeg Star 27-05-2021 Fan 255 255 default upload bucket newfile csv',''),(23,'/feedback/rahul','object','object','feedback',1,1617699599,1617699599,0,0,'ID: 23  \nPath: /feedback/rahul  \nrahul rahul sharma vashusharma1104#gmail.com some feedback rahul',''),(24,'/_default_upload_bucket/download (1).jpeg','asset','image','image',1,1617812702,1617812702,2,2,'ID: 24  \nPath: /_default_upload_bucket/download (1).jpeg  \ndownload (1).jpeg FileName download (1).jpeg FileDateTime 1617812702 FileSize 3224 FileType MimeType image/jpeg SectionsFound default upload bucket download jpeg',''),(24,'/feedback/ramesh','object','object','feedback',1,1617699798,1617699798,0,0,'ID: 24  \nPath: /feedback/ramesh  \nramesh ramesh vashusharma1104#gmail.com some feedback ramesh',''),(25,'/feedback/r','object','object','feedback',1,1617699989,1617699989,0,0,'ID: 25  \nPath: /feedback/r  \nvashusharma1104#gmail.com feedback',''),(26,'/feedback/v','object','object','feedback',1,1617700245,1617700245,0,0,'ID: 26  \nPath: /feedback/v  \nvashusharma1104#gmail.com feedback',''),(29,'/product/LG ka product ek aur','object','object','product',1,1617700982,1617700982,0,0,'ID: 29  \nPath: /product/LG ka product ek aur  \nproduct aur abc FanFeatures description 100 #000000ff Star 220 Rpm product product aur',''),(30,'/log','object','folder','folder',1,1617728533,1617728533,2,2,'ID: 30  \nPath: /log  \nlog log',''),(33,'/product/LG ka product ek aurs','object','object','product',1,1617729365,1617729365,0,0,'ID: 33  \nPath: /product/LG ka product ek aurs  \nproduct aurs abc FanFeatures description 100 #000000ff Star 220 Rpm product product aurs',''),(34,'/log/LG ka product ek aurs','object','object','log',1,1617729365,1617729365,0,0,'ID: 34  \nPath: /log/LG ka product ek aurs  \nproduct aurs Data Imported Successfully. log product aurs',''),(35,'/product/samsung Ac','object','object','product',1,1617790797,1617790797,0,0,'ID: 35  \nPath: /product/samsung Ac  \nsamsung abc FanFeatures description 100 #000000ff Star 220 Rpm product samsung',''),(36,'/log/samsung Ac','object','object','log',1,1617790797,1617790797,0,0,'ID: 36  \nPath: /log/samsung Ac  \nsamsung Data Imported Successfully. log samsung',''),(37,'/product/havells geyser','object','object','product',1,1617812542,1617812723,2,2,'ID: 37  \nPath: /product/havells geyser  \nhavells geyser havells a209378 havells geyser great capactity 2250 product geyser',''),(38,'/brand/havells','object','object','brand',1,1617812566,1617812574,2,2,'ID: 38  \nPath: /brand/havells  \nhavells havells brand havells',''),(39,'/category/geyser','object','object','category',1,1617812633,1617812647,2,2,'ID: 39  \nPath: /category/geyser  \ngeyser geyser name category geyser','');
/*!40000 ALTER TABLE `search_backend_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mainDomain` varchar(255) DEFAULT NULL,
  `domains` text,
  `rootId` int unsigned DEFAULT NULL,
  `errorDocument` varchar(255) DEFAULT NULL,
  `redirectToMainDomain` tinyint(1) DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rootId` (`rootId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int unsigned DEFAULT NULL,
  `idPath` varchar(190) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idPath_name` (`idPath`,`name`),
  KEY `idpath` (`idPath`),
  KEY `parentid` (`parentId`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_assignment`
--

DROP TABLE IF EXISTS `tags_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_assignment` (
  `tagid` int unsigned NOT NULL DEFAULT '0',
  `cid` int NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') NOT NULL,
  PRIMARY KEY (`tagid`,`cid`,`ctype`),
  KEY `ctype` (`ctype`),
  KEY `ctype_cid` (`cid`,`ctype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_assignment`
--

LOCK TABLES `tags_assignment` WRITE;
/*!40000 ALTER TABLE `tags_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targeting_rules`
--

DROP TABLE IF EXISTS `targeting_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `targeting_rules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `scope` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `prio` smallint unsigned NOT NULL DEFAULT '0',
  `conditions` longtext,
  `actions` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targeting_rules`
--

LOCK TABLES `targeting_rules` WRITE;
/*!40000 ALTER TABLE `targeting_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `targeting_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targeting_storage`
--

DROP TABLE IF EXISTS `targeting_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `targeting_storage` (
  `visitorId` varchar(100) NOT NULL,
  `scope` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text,
  `creationDate` datetime DEFAULT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`visitorId`,`scope`,`name`),
  KEY `targeting_storage_scope_index` (`scope`),
  KEY `targeting_storage_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targeting_storage`
--

LOCK TABLES `targeting_storage` WRITE;
/*!40000 ALTER TABLE `targeting_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `targeting_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targeting_target_groups`
--

DROP TABLE IF EXISTS `targeting_target_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `targeting_target_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `threshold` int DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targeting_target_groups`
--

LOCK TABLES `targeting_target_groups` WRITE;
/*!40000 ALTER TABLE `targeting_target_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `targeting_target_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_store`
--

DROP TABLE IF EXISTS `tmp_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_store` (
  `id` varchar(190) NOT NULL DEFAULT '',
  `tag` varchar(190) DEFAULT NULL,
  `data` longtext,
  `serialized` tinyint NOT NULL DEFAULT '0',
  `date` int unsigned DEFAULT NULL,
  `expiryDate` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tag` (`tag`),
  KEY `date` (`date`),
  KEY `expiryDate` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp_store`
--

LOCK TABLES `tmp_store` WRITE;
/*!40000 ALTER TABLE `tmp_store` DISABLE KEYS */;
INSERT INTO `tmp_store` VALUES ('document_session_2_hp64b32dfui2s3i13gr3luq6kj','document-session','O:27:\"Pimcore\\Model\\Document\\Page\":34:{s:8:\"\0*\0title\";s:8:\"feedback\";s:14:\"\0*\0description\";s:0:\"\";s:11:\"\0*\0metaData\";a:0:{}s:7:\"\0*\0type\";s:4:\"page\";s:12:\"\0*\0prettyUrl\";N;s:17:\"\0*\0targetGroupIds\";s:0:\"\";s:9:\"\0*\0module\";s:9:\"AppBundle\";s:13:\"\0*\0controller\";s:7:\"Default\";s:9:\"\0*\0action\";s:7:\"default\";s:11:\"\0*\0template\";s:25:\"content/feedback.html.php\";s:11:\"\0*\0elements\";a:0:{}s:12:\"\0*\0editables\";R:12;s:26:\"\0*\0contentMasterDocumentId\";N;s:24:\"\0*\0supportsContentMaster\";b:1;s:26:\"\0*\0missingRequiredEditable\";N;s:5:\"\0*\0id\";i:2;s:11:\"\0*\0parentId\";i:1;s:6:\"\0*\0key\";s:8:\"feedback\";s:7:\"\0*\0path\";s:1:\"/\";s:8:\"\0*\0index\";i:1;s:12:\"\0*\0published\";b:1;s:15:\"\0*\0creationDate\";i:1617698680;s:19:\"\0*\0modificationDate\";i:1617698920;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:13:\"\0*\0properties\";a:1:{s:15:\"navigation_name\";O:22:\"Pimcore\\Model\\Property\":8:{s:7:\"\0*\0name\";s:15:\"navigation_name\";s:7:\"\0*\0data\";s:8:\"feedback\";s:7:\"\0*\0type\";s:4:\"text\";s:8:\"\0*\0ctype\";s:8:\"document\";s:8:\"\0*\0cpath\";N;s:6:\"\0*\0cid\";i:2;s:14:\"\0*\0inheritable\";b:0;s:12:\"\0*\0inherited\";b:0;}}s:11:\"\0*\0children\";a:0:{}s:11:\"\0*\0siblings\";a:0:{}s:14:\"\0*\0hasSiblings\";a:0:{}s:9:\"\0*\0locked\";N;s:15:\"\0*\0versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1617698920;s:12:\"\0*\0_fulldump\";b:1;s:24:\"____pimcore_cache_item__\";s:10:\"document_2\";}',0,1617790206,1618395006),('thumb_11__7fc98ccfe1b0235c245edf47d7299b72','image-optimize-queue','image-thumbnails/Digital assets/image-thumb__11__pimcore-system-treepreview/ac@2x.jpg',0,1617729919,1618334719),('thumb_11__81d2c091569537953acc192201cdb2de','image-optimize-queue','image-thumbnails/Digital assets/image-thumb__11__pimcore-system-treepreview/ac.jpg',0,1617729916,1618334716),('thumb_12__49bfe0c53b89bbb5c4d77c5ea6d6ad7a','image-optimize-queue','image-thumbnails/Digital assets/image-thumb__12__pimcore-system-treepreview/fan@2x.jpg',0,1617729960,1618334760),('thumb_12__bf4537daab37c795d89bc49a0af43259','image-optimize-queue','image-thumbnails/Digital assets/image-thumb__12__pimcore-system-treepreview/fan.jpg',0,1617729957,1618334757),('thumb_13__8ee5c7e508c759b9a91ed8aa83a26251','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__13__pimcore-system-treepreview/fridge.jpg',0,1617729996,1618334796),('thumb_13__b103d3038abf064966b70b077b63bb62','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__13__pimcore-system-treepreview/fridge@2x.jpg',0,1617730000,1618334800),('thumb_14__b6662b84c5f87645697b0ce513dcf3ab','image-optimize-queue','image-thumbnails/image-thumb__14__pimcore-system-treepreview/electrical@2x.jpg',0,1617730029,1618334829),('thumb_14__d656800da0707c77af32f1b9dfb4d1d2','image-optimize-queue','image-thumbnails/image-thumb__14__pimcore-system-treepreview/electrical.jpg',0,1617730026,1618334826),('thumb_15__5316726fc9fd37ebfbc2474ba9effc90','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__15__pimcore-system-treepreview/electrical.jpg',0,1617730088,1618334888),('thumb_15__90c8b802ef4a2b5d0bd2b9f1e90e0612','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__15__pimcore-system-treepreview/electrical@2x.jpg',0,1617730678,1618335478),('thumb_15__a23bb4e7a3f7eefb48246b3005d9850a','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__15__auto_6eff904a1a9a57680d726da3d5459ac7/electrical.png',0,1617730089,1618334889),('thumb_16__6b357ca1437cef9673f9bfd9cdfa5f27','image-optimize-queue','image-thumbnails/Digital assets/image-thumb__16__pimcore-system-treepreview/el.jpg',0,1617730225,1618335025),('thumb_16__80696f609554fa684bd549a9303f9063','image-optimize-queue','image-thumbnails/Digital assets/image-thumb__16__pimcore-system-treepreview/el@2x.jpg',0,1617730229,1618335029),('thumb_17__4ca4c21464a62e01bf83d63f377c2683','image-optimize-queue','image-thumbnails/Digital assets/image-thumb__17__pimcore-system-treepreview/1080957.jpg',0,1617730659,1618335459),('thumb_18__0a5d3f5e6394256d883398cc59715b41','image-optimize-queue','image-thumbnails/Digital assets/image-thumb__18__pimcore-system-treepreview/ac.jpg',0,1617730965,1618335765),('thumb_18__be3957e01582d9fadca55f13fe01ffb3','image-optimize-queue','image-thumbnails/Digital assets/image-thumb__18__pimcore-system-treepreview/ac@2x.jpg',0,1617730968,1618335768),('thumb_19__49c31ffff78a02da8499120c02a6f583','image-optimize-queue','image-thumbnails/Digital assets/image-thumb__19__pimcore-system-treepreview/ac.jpg',0,1617769316,1618374116),('thumb_19__ffaf41b4684e875922a77bd7588cb298','image-optimize-queue','image-thumbnails/Digital assets/image-thumb__19__pimcore-system-treepreview/ac@2x.jpg',0,1617769320,1618374120),('thumb_20__96305924634837275cccf8b9e805cc08','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__20__pimcore-system-treepreview/Screenshot from 2021-03-16 15-16-10.jpg',0,1617790140,1618394940),('thumb_20__ee27996a461f70d174e3c19fd70ea14c','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__20__pimcore-system-treepreview/Screenshot from 2021-03-16 15-16-10@2x.jpg',0,1617790148,1618394948),('thumb_22__1699c6bc5e2103e6342f873d0a962c5b','image-optimize-queue','image-thumbnails/image/image-thumb__22__auto_6eff904a1a9a57680d726da3d5459ac7/download.png',0,1617790826,1618395626),('thumb_22__53bb54d38d34b304bfd9491c31e464bc','image-optimize-queue','image-thumbnails/image/image-thumb__22__pimcore-system-treepreview/download.jpg',0,1617790615,1618395415),('thumb_22__c84ea3409b97e2890f2d8c1fcc0aab44','image-optimize-queue','image-thumbnails/image/image-thumb__22__pimcore-system-treepreview/download@2x.jpg',0,1617790624,1618395424),('thumb_24__2c2223977ed4647ed1380782d4517504','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__24__pimcore-system-treepreview/download (1).jpg',0,1617812702,1618417502),('thumb_24__3fb0af74c55545a723452adfe6693ed6','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__24__auto_6eff904a1a9a57680d726da3d5459ac7/download (1).png',0,1617812703,1618417503),('thumb_3__a3110463e7eb0ea5d689cbd97ff0a589','image-optimize-queue','image-thumbnails/Digital assets/image-thumb__3__auto_6eff904a1a9a57680d726da3d5459ac7/ac.png',0,1617264367,1617869167),('thumb_3__c39b5426102bf244b972ed807d3bfd75','image-optimize-queue','image-thumbnails/Digital assets/image-thumb__3__pimcore-system-treepreview/ac.jpg',0,1617264022,1617868822),('thumb_3__d55b09a0391a7e7db18e7348dde9e6fe','image-optimize-queue','image-thumbnails/Digital assets/image-thumb__3__pimcore-system-treepreview/ac@2x.jpg',0,1617270282,1617875082),('thumb_5__c0ded1b935270f5fef4587b8e9ee4141','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__5__pimcore-system-treepreview/image1.jpg',0,1617512971,1618117771),('thumb_5__ce0d193df6f25036cfdd07b20c70c259','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__5__auto_6eff904a1a9a57680d726da3d5459ac7/image1.png',0,1617512972,1618117772);
/*!40000 ALTER TABLE `tmp_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking_events`
--

DROP TABLE IF EXISTS `tracking_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracking_events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(190) DEFAULT NULL,
  `action` varchar(190) DEFAULT NULL,
  `label` varchar(190) DEFAULT NULL,
  `data` varchar(190) DEFAULT NULL,
  `timestamp` int unsigned DEFAULT NULL,
  `year` int unsigned DEFAULT NULL,
  `month` int unsigned DEFAULT NULL,
  `day` int unsigned DEFAULT NULL,
  `dayOfWeek` int unsigned DEFAULT NULL,
  `dayOfYear` int unsigned DEFAULT NULL,
  `weekOfYear` int unsigned DEFAULT NULL,
  `hour` int unsigned DEFAULT NULL,
  `minute` int unsigned DEFAULT NULL,
  `second` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timestamp` (`timestamp`),
  KEY `year` (`year`),
  KEY `month` (`month`),
  KEY `day` (`day`),
  KEY `dayOfWeek` (`dayOfWeek`),
  KEY `dayOfYear` (`dayOfYear`),
  KEY `weekOfYear` (`weekOfYear`),
  KEY `hour` (`hour`),
  KEY `minute` (`minute`),
  KEY `second` (`second`),
  KEY `category` (`category`),
  KEY `action` (`action`),
  KEY `label` (`label`),
  KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking_events`
--

LOCK TABLES `tracking_events` WRITE;
/*!40000 ALTER TABLE `tracking_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracking_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations_admin`
--

DROP TABLE IF EXISTS `translations_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations_admin` (
  `key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `text` text,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  PRIMARY KEY (`key`,`language`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations_admin`
--

LOCK TABLES `translations_admin` WRITE;
/*!40000 ALTER TABLE `translations_admin` DISABLE KEYS */;
INSERT INTO `translations_admin` VALUES ('$','cs','',1617265380,1617265380),('$','de','',1617265380,1617265380),('$','en','',1617265380,1617265380),('$','es','',1617265380,1617265380),('$','fa','',1617265380,1617265380),('$','fr','',1617265380,1617265380),('$','hu','',1617265380,1617265380),('$','it','',1617265380,1617265380),('$','ja','',1617265380,1617265380),('$','nl','',1617265380,1617265380),('$','pl','',1617265380,1617265380),('$','pt_BR','',1617265380,1617265380),('$','ru','',1617265380,1617265380),('$','sk','',1617265380,1617265380),('$','sv','',1617265380,1617265380),('$','sv_FI','',1617265380,1617265380),('$','th','',1617265380,1617265380),('$','tr','',1617265380,1617265380),('$','uk','',1617265380,1617265380),('$','zh_Hans','',1617265380,1617265380),('1 Star','cs','',1617264423,1617264423),('1 Star','de','',1617264423,1617264423),('1 Star','en','',1617264423,1617264423),('1 Star','es','',1617264423,1617264423),('1 Star','fa','',1617264423,1617264423),('1 Star','fr','',1617264423,1617264423),('1 Star','hu','',1617264423,1617264423),('1 Star','it','',1617264423,1617264423),('1 Star','ja','',1617264423,1617264423),('1 Star','nl','',1617264423,1617264423),('1 Star','pl','',1617264423,1617264423),('1 Star','pt_BR','',1617264423,1617264423),('1 Star','ru','',1617264423,1617264423),('1 Star','sk','',1617264423,1617264423),('1 Star','sv','',1617264423,1617264423),('1 Star','sv_FI','',1617264423,1617264423),('1 Star','th','',1617264423,1617264423),('1 Star','tr','',1617264423,1617264423),('1 Star','uk','',1617264423,1617264423),('1 Star','zh_Hans','',1617264423,1617264423),('2 Star','cs','',1617264423,1617264423),('2 Star','de','',1617264423,1617264423),('2 Star','en','',1617264423,1617264423),('2 Star','es','',1617264423,1617264423),('2 Star','fa','',1617264423,1617264423),('2 Star','fr','',1617264423,1617264423),('2 Star','hu','',1617264423,1617264423),('2 Star','it','',1617264423,1617264423),('2 Star','ja','',1617264423,1617264423),('2 Star','nl','',1617264423,1617264423),('2 Star','pl','',1617264423,1617264423),('2 Star','pt_BR','',1617264423,1617264423),('2 Star','ru','',1617264423,1617264423),('2 Star','sk','',1617264423,1617264423),('2 Star','sv','',1617264423,1617264423),('2 Star','sv_FI','',1617264423,1617264423),('2 Star','th','',1617264423,1617264423),('2 Star','tr','',1617264423,1617264423),('2 Star','uk','',1617264423,1617264423),('2 Star','zh_Hans','',1617264423,1617264423),('3 Star','cs','',1617264423,1617264423),('3 Star','de','',1617264423,1617264423),('3 Star','en','',1617264423,1617264423),('3 Star','es','',1617264423,1617264423),('3 Star','fa','',1617264423,1617264423),('3 Star','fr','',1617264423,1617264423),('3 Star','hu','',1617264423,1617264423),('3 Star','it','',1617264423,1617264423),('3 Star','ja','',1617264423,1617264423),('3 Star','nl','',1617264423,1617264423),('3 Star','pl','',1617264423,1617264423),('3 Star','pt_BR','',1617264423,1617264423),('3 Star','ru','',1617264423,1617264423),('3 Star','sk','',1617264423,1617264423),('3 Star','sv','',1617264423,1617264423),('3 Star','sv_FI','',1617264423,1617264423),('3 Star','th','',1617264423,1617264423),('3 Star','tr','',1617264423,1617264423),('3 Star','uk','',1617264423,1617264423),('3 Star','zh_Hans','',1617264423,1617264423),('4 Star','cs','',1617264423,1617264423),('4 Star','de','',1617264423,1617264423),('4 Star','en','',1617264423,1617264423),('4 Star','es','',1617264423,1617264423),('4 Star','fa','',1617264423,1617264423),('4 Star','fr','',1617264423,1617264423),('4 Star','hu','',1617264423,1617264423),('4 Star','it','',1617264423,1617264423),('4 Star','ja','',1617264423,1617264423),('4 Star','nl','',1617264423,1617264423),('4 Star','pl','',1617264423,1617264423),('4 Star','pt_BR','',1617264423,1617264423),('4 Star','ru','',1617264423,1617264423),('4 Star','sk','',1617264423,1617264423),('4 Star','sv','',1617264423,1617264423),('4 Star','sv_FI','',1617264423,1617264423),('4 Star','th','',1617264423,1617264423),('4 Star','tr','',1617264423,1617264423),('4 Star','uk','',1617264423,1617264423),('4 Star','zh_Hans','',1617264423,1617264423),('5 Star','cs','',1617264423,1617264423),('5 Star','de','',1617264423,1617264423),('5 Star','en','',1617264423,1617264423),('5 Star','es','',1617264423,1617264423),('5 Star','fa','',1617264423,1617264423),('5 Star','fr','',1617264423,1617264423),('5 Star','hu','',1617264423,1617264423),('5 Star','it','',1617264423,1617264423),('5 Star','ja','',1617264423,1617264423),('5 Star','nl','',1617264423,1617264423),('5 Star','pl','',1617264423,1617264423),('5 Star','pt_BR','',1617264423,1617264423),('5 Star','ru','',1617264423,1617264423),('5 Star','sk','',1617264423,1617264423),('5 Star','sv','',1617264423,1617264423),('5 Star','sv_FI','',1617264423,1617264423),('5 Star','th','',1617264423,1617264423),('5 Star','tr','',1617264423,1617264423),('5 Star','uk','',1617264423,1617264423),('5 Star','zh_Hans','',1617264423,1617264423),(':','cs','',1617526660,1617526660),(':','de','',1617526660,1617526660),(':','en','',1617526660,1617526660),(':','es','',1617526660,1617526660),(':','fa','',1617526660,1617526660),(':','fr','',1617526660,1617526660),(':','hu','',1617526660,1617526660),(':','it','',1617526660,1617526660),(':','ja','',1617526660,1617526660),(':','nl','',1617526660,1617526660),(':','pl','',1617526660,1617526660),(':','pt_BR','',1617526660,1617526660),(':','ru','',1617526660,1617526660),(':','sk','',1617526660,1617526660),(':','sv','',1617526660,1617526660),(':','sv_FI','',1617526660,1617526660),(':','th','',1617526660,1617526660),(':','tr','',1617526660,1617526660),(':','uk','',1617526660,1617526660),(':','zh_Hans','',1617526660,1617526660),('AcFeatures','cs','',1617264902,1617264902),('AcFeatures','de','',1617264902,1617264902),('AcFeatures','en','',1617264902,1617264902),('AcFeatures','es','',1617264902,1617264902),('AcFeatures','fa','',1617264902,1617264902),('AcFeatures','fr','',1617264902,1617264902),('AcFeatures','hu','',1617264902,1617264902),('AcFeatures','it','',1617264902,1617264902),('AcFeatures','ja','',1617264902,1617264902),('AcFeatures','nl','',1617264902,1617264902),('AcFeatures','pl','',1617264902,1617264902),('AcFeatures','pt_BR','',1617264902,1617264902),('AcFeatures','ru','',1617264902,1617264902),('AcFeatures','sk','',1617264902,1617264902),('AcFeatures','sv','',1617264902,1617264902),('AcFeatures','sv_FI','',1617264902,1617264902),('AcFeatures','th','',1617264902,1617264902),('AcFeatures','tr','',1617264902,1617264902),('AcFeatures','uk','',1617264902,1617264902),('AcFeatures','zh_Hans','',1617264902,1617264902),('Alt','cs','',1617366204,1617366204),('Alt','de','',1617366204,1617366204),('Alt','en','',1617366204,1617366204),('Alt','es','',1617366204,1617366204),('Alt','fa','',1617366204,1617366204),('Alt','fr','',1617366204,1617366204),('Alt','hu','',1617366204,1617366204),('Alt','it','',1617366204,1617366204),('Alt','ja','',1617366204,1617366204),('Alt','nl','',1617366204,1617366204),('Alt','pl','',1617366204,1617366204),('Alt','pt_BR','',1617366204,1617366204),('Alt','ru','',1617366204,1617366204),('Alt','sk','',1617366204,1617366204),('Alt','sv','',1617366204,1617366204),('Alt','sv_FI','',1617366204,1617366204),('Alt','th','',1617366204,1617366204),('Alt','tr','',1617366204,1617366204),('Alt','uk','',1617366204,1617366204),('Alt','zh_Hans','',1617366204,1617366204),('Blades','cs','',1617646130,1617646130),('Blades','de','',1617646130,1617646130),('Blades','en','',1617646130,1617646130),('Blades','es','',1617646130,1617646130),('Blades','fa','',1617646130,1617646130),('Blades','fr','',1617646130,1617646130),('Blades','hu','',1617646130,1617646130),('Blades','it','',1617646130,1617646130),('Blades','ja','',1617646130,1617646130),('Blades','nl','',1617646130,1617646130),('Blades','pl','',1617646130,1617646130),('Blades','pt_BR','',1617646130,1617646130),('Blades','ru','',1617646130,1617646130),('Blades','sk','',1617646130,1617646130),('Blades','sv','',1617646130,1617646130),('Blades','sv_FI','',1617646130,1617646130),('Blades','th','',1617646130,1617646130),('Blades','tr','',1617646130,1617646130),('Blades','uk','',1617646130,1617646130),('Blades','zh_Hans','',1617646130,1617646130),('Brand','cs','',1617264422,1617264422),('Brand','de','',1617264422,1617264422),('Brand','en','',1617264422,1617264422),('Brand','es','',1617264422,1617264422),('Brand','fa','',1617264422,1617264422),('Brand','fr','',1617264422,1617264422),('Brand','hu','',1617264422,1617264422),('Brand','it','',1617264422,1617264422),('Brand','ja','',1617264422,1617264422),('Brand','nl','',1617264422,1617264422),('Brand','pl','',1617264422,1617264422),('Brand','pt_BR','',1617264422,1617264422),('Brand','ru','',1617264422,1617264422),('Brand','sk','',1617264422,1617264422),('Brand','sv','',1617264422,1617264422),('Brand','sv_FI','',1617264422,1617264422),('Brand','th','',1617264422,1617264422),('Brand','tr','',1617264422,1617264422),('Brand','uk','',1617264422,1617264422),('Brand','zh_Hans','',1617264422,1617264422),('CSV Export','cs','',1617264392,1617264392),('CSV Export','de','',1617264392,1617264392),('CSV Export','en','',1617264392,1617264392),('CSV Export','es','',1617264392,1617264392),('CSV Export','fa','',1617264392,1617264392),('CSV Export','fr','',1617264392,1617264392),('CSV Export','hu','',1617264392,1617264392),('CSV Export','it','',1617264392,1617264392),('CSV Export','ja','',1617264392,1617264392),('CSV Export','nl','',1617264392,1617264392),('CSV Export','pl','',1617264392,1617264392),('CSV Export','pt_BR','',1617264392,1617264392),('CSV Export','ru','',1617264392,1617264392),('CSV Export','sk','',1617264392,1617264392),('CSV Export','sv','',1617264392,1617264392),('CSV Export','sv_FI','',1617264392,1617264392),('CSV Export','th','',1617264392,1617264392),('CSV Export','tr','',1617264392,1617264392),('CSV Export','uk','',1617264392,1617264392),('CSV Export','zh_Hans','',1617264392,1617264392),('Capacity','cs','',1617264902,1617264902),('Capacity','de','',1617264902,1617264902),('Capacity','en','',1617264902,1617264902),('Capacity','es','',1617264902,1617264902),('Capacity','fa','',1617264902,1617264902),('Capacity','fr','',1617264902,1617264902),('Capacity','hu','',1617264902,1617264902),('Capacity','it','',1617264902,1617264902),('Capacity','ja','',1617264902,1617264902),('Capacity','nl','',1617264902,1617264902),('Capacity','pl','',1617264902,1617264902),('Capacity','pt_BR','',1617264902,1617264902),('Capacity','ru','',1617264902,1617264902),('Capacity','sk','',1617264902,1617264902),('Capacity','sv','',1617264902,1617264902),('Capacity','sv_FI','',1617264902,1617264902),('Capacity','th','',1617264902,1617264902),('Capacity','tr','',1617264902,1617264902),('Capacity','uk','',1617264902,1617264902),('Capacity','zh_Hans','',1617264902,1617264902),('Colour','cs','',1617264423,1617264423),('Colour','de','',1617264423,1617264423),('Colour','en','',1617264423,1617264423),('Colour','es','',1617264423,1617264423),('Colour','fa','',1617264423,1617264423),('Colour','fr','',1617264423,1617264423),('Colour','hu','',1617264423,1617264423),('Colour','it','',1617264423,1617264423),('Colour','ja','',1617264423,1617264423),('Colour','nl','',1617264423,1617264423),('Colour','pl','',1617264423,1617264423),('Colour','pt_BR','',1617264423,1617264423),('Colour','ru','',1617264423,1617264423),('Colour','sk','',1617264423,1617264423),('Colour','sv','',1617264423,1617264423),('Colour','sv_FI','',1617264423,1617264423),('Colour','th','',1617264423,1617264423),('Colour','tr','',1617264423,1617264423),('Colour','uk','',1617264423,1617264423),('Colour','zh_Hans','',1617264423,1617264423),('Ctrl','cs','',1617366200,1617366200),('Ctrl','de','',1617366200,1617366200),('Ctrl','en','',1617366200,1617366200),('Ctrl','es','',1617366200,1617366200),('Ctrl','fa','',1617366200,1617366200),('Ctrl','fr','',1617366200,1617366200),('Ctrl','hu','',1617366200,1617366200),('Ctrl','it','',1617366200,1617366200),('Ctrl','ja','',1617366200,1617366200),('Ctrl','nl','',1617366200,1617366200),('Ctrl','pl','',1617366200,1617366200),('Ctrl','pt_BR','',1617366200,1617366200),('Ctrl','ru','',1617366200,1617366200),('Ctrl','sk','',1617366200,1617366200),('Ctrl','sv','',1617366200,1617366200),('Ctrl','sv_FI','',1617366200,1617366200),('Ctrl','th','',1617366200,1617366200),('Ctrl','tr','',1617366200,1617366200),('Ctrl','uk','',1617366200,1617366200),('Ctrl','zh_Hans','',1617366200,1617366200),('Description','cs','',1617688471,1617688471),('Description','de','',1617688471,1617688471),('Description','en','',1617688471,1617688471),('Description','es','',1617688471,1617688471),('Description','fa','',1617688471,1617688471),('Description','fr','',1617688471,1617688471),('Description','hu','',1617688471,1617688471),('Description','it','',1617688471,1617688471),('Description','ja','',1617688471,1617688471),('Description','nl','',1617688471,1617688471),('Description','pl','',1617688471,1617688471),('Description','pt_BR','',1617688471,1617688471),('Description','ru','',1617688471,1617688471),('Description','sk','',1617688471,1617688471),('Description','sv','',1617688471,1617688471),('Description','sv_FI','',1617688471,1617688471),('Description','th','',1617688471,1617688471),('Description','tr','',1617688471,1617688471),('Description','uk','',1617688471,1617688471),('Description','zh_Hans','',1617688471,1617688471),('English','cs','',1617365568,1617365568),('English','de','',1617365568,1617365568),('English','en','',1617365568,1617365568),('English','es','',1617365568,1617365568),('English','fa','',1617365568,1617365568),('English','fr','',1617365568,1617365568),('English','hu','',1617365568,1617365568),('English','it','',1617365568,1617365568),('English','ja','',1617365568,1617365568),('English','nl','',1617365568,1617365568),('English','pl','',1617365568,1617365568),('English','pt_BR','',1617365568,1617365568),('English','ru','',1617365568,1617365568),('English','sk','',1617365568,1617365568),('English','sv','',1617365568,1617365568),('English','sv_FI','',1617365568,1617365568),('English','th','',1617365568,1617365568),('English','tr','',1617365568,1617365568),('English','uk','',1617365568,1617365568),('English','zh_Hans','',1617365568,1617365568),('FanFeatures','cs','',1617265112,1617265112),('FanFeatures','de','',1617265112,1617265112),('FanFeatures','en','',1617265112,1617265112),('FanFeatures','es','',1617265112,1617265112),('FanFeatures','fa','',1617265112,1617265112),('FanFeatures','fr','',1617265112,1617265112),('FanFeatures','hu','',1617265112,1617265112),('FanFeatures','it','',1617265112,1617265112),('FanFeatures','ja','',1617265112,1617265112),('FanFeatures','nl','',1617265112,1617265112),('FanFeatures','pl','',1617265112,1617265112),('FanFeatures','pt_BR','',1617265112,1617265112),('FanFeatures','ru','',1617265112,1617265112),('FanFeatures','sk','',1617265112,1617265112),('FanFeatures','sv','',1617265112,1617265112),('FanFeatures','sv_FI','',1617265112,1617265112),('FanFeatures','th','',1617265112,1617265112),('FanFeatures','tr','',1617265112,1617265112),('FanFeatures','uk','',1617265112,1617265112),('FanFeatures','zh_Hans','',1617265112,1617265112),('File','cs','',1617643729,1617643729),('File','de','',1617643729,1617643729),('File','en','',1617643729,1617643729),('File','es','',1617643729,1617643729),('File','fa','',1617643729,1617643729),('File','fr','',1617643729,1617643729),('File','hu','',1617643729,1617643729),('File','it','',1617643729,1617643729),('File','ja','',1617643729,1617643729),('File','nl','',1617643729,1617643729),('File','pl','',1617643729,1617643729),('File','pt_BR','',1617643729,1617643729),('File','ru','',1617643729,1617643729),('File','sk','',1617643729,1617643729),('File','sv','',1617643729,1617643729),('File','sv_FI','',1617643729,1617643729),('File','th','',1617643729,1617643729),('File','tr','',1617643729,1617643729),('File','uk','',1617643729,1617643729),('File','zh_Hans','',1617643729,1617643729),('Firstname','cs','',1617699590,1617699590),('Firstname','de','',1617699590,1617699590),('Firstname','en','',1617699590,1617699590),('Firstname','es','',1617699590,1617699590),('Firstname','fa','',1617699590,1617699590),('Firstname','fr','',1617699590,1617699590),('Firstname','hu','',1617699590,1617699590),('Firstname','it','',1617699590,1617699590),('Firstname','ja','',1617699590,1617699590),('Firstname','nl','',1617699590,1617699590),('Firstname','pl','',1617699590,1617699590),('Firstname','pt_BR','',1617699590,1617699590),('Firstname','ru','',1617699590,1617699590),('Firstname','sk','',1617699590,1617699590),('Firstname','sv','',1617699590,1617699590),('Firstname','sv_FI','',1617699590,1617699590),('Firstname','th','',1617699590,1617699590),('Firstname','tr','',1617699590,1617699590),('Firstname','uk','',1617699590,1617699590),('Firstname','zh_Hans','',1617699590,1617699590),('Generate','cs','',1617366198,1617366198),('Generate','de','',1617366198,1617366198),('Generate','en','',1617366198,1617366198),('Generate','es','',1617366198,1617366198),('Generate','fa','',1617366198,1617366198),('Generate','fr','',1617366198,1617366198),('Generate','hu','',1617366198,1617366198),('Generate','it','',1617366198,1617366198),('Generate','ja','',1617366198,1617366198),('Generate','nl','',1617366198,1617366198),('Generate','pl','',1617366198,1617366198),('Generate','pt_BR','',1617366198,1617366198),('Generate','ru','',1617366198,1617366198),('Generate','sk','',1617366198,1617366198),('Generate','sv','',1617366198,1617366198),('Generate','sv_FI','',1617366198,1617366198),('Generate','th','',1617366198,1617366198),('Generate','tr','',1617366198,1617366198),('Generate','uk','',1617366198,1617366198),('Generate','zh_Hans','',1617366198,1617366198),('GeyserFeatures','cs','',1617265112,1617265112),('GeyserFeatures','de','',1617265112,1617265112),('GeyserFeatures','en','',1617265112,1617265112),('GeyserFeatures','es','',1617265112,1617265112),('GeyserFeatures','fa','',1617265112,1617265112),('GeyserFeatures','fr','',1617265112,1617265112),('GeyserFeatures','hu','',1617265112,1617265112),('GeyserFeatures','it','',1617265112,1617265112),('GeyserFeatures','ja','',1617265112,1617265112),('GeyserFeatures','nl','',1617265112,1617265112),('GeyserFeatures','pl','',1617265112,1617265112),('GeyserFeatures','pt_BR','',1617265112,1617265112),('GeyserFeatures','ru','',1617265112,1617265112),('GeyserFeatures','sk','',1617265112,1617265112),('GeyserFeatures','sv','',1617265112,1617265112),('GeyserFeatures','sv_FI','',1617265112,1617265112),('GeyserFeatures','th','',1617265112,1617265112),('GeyserFeatures','tr','',1617265112,1617265112),('GeyserFeatures','uk','',1617265112,1617265112),('GeyserFeatures','zh_Hans','',1617265112,1617265112),('Image','cs','',1617270306,1617270306),('Image','de','',1617270306,1617270306),('Image','en','',1617270306,1617270306),('Image','es','',1617270306,1617270306),('Image','fa','',1617270306,1617270306),('Image','fr','',1617270306,1617270306),('Image','hu','',1617270306,1617270306),('Image','it','',1617270306,1617270306),('Image','ja','',1617270306,1617270306),('Image','nl','',1617270306,1617270306),('Image','pl','',1617270306,1617270306),('Image','pt_BR','',1617270306,1617270306),('Image','ru','',1617270306,1617270306),('Image','sk','',1617270306,1617270306),('Image','sv','',1617270306,1617270306),('Image','sv_FI','',1617270306,1617270306),('Image','th','',1617270306,1617270306),('Image','tr','',1617270306,1617270306),('Image','uk','',1617270306,1617270306),('Image','zh_Hans','',1617270306,1617270306),('Installation Type','cs','',1617264902,1617264902),('Installation Type','de','',1617264902,1617264902),('Installation Type','en','',1617264902,1617264902),('Installation Type','es','',1617264902,1617264902),('Installation Type','fa','',1617264902,1617264902),('Installation Type','fr','',1617264902,1617264902),('Installation Type','hu','',1617264902,1617264902),('Installation Type','it','',1617264902,1617264902),('Installation Type','ja','',1617264902,1617264902),('Installation Type','nl','',1617264902,1617264902),('Installation Type','pl','',1617264902,1617264902),('Installation Type','pt_BR','',1617264902,1617264902),('Installation Type','ru','',1617264902,1617264902),('Installation Type','sk','',1617264902,1617264902),('Installation Type','sv','',1617264902,1617264902),('Installation Type','sv_FI','',1617264902,1617264902),('Installation Type','th','',1617264902,1617264902),('Installation Type','tr','',1617264902,1617264902),('Installation Type','uk','',1617264902,1617264902),('Installation Type','zh_Hans','',1617264902,1617264902),('LG','cs','',1617365478,1617365478),('LG','de','',1617365478,1617365478),('LG','en','',1617365478,1617365478),('LG','es','',1617365478,1617365478),('LG','fa','',1617365478,1617365478),('LG','fr','',1617365478,1617365478),('LG','hu','',1617365478,1617365478),('LG','it','',1617365478,1617365478),('LG','ja','',1617365478,1617365478),('LG','nl','',1617365478,1617365478),('LG','pl','',1617365478,1617365478),('LG','pt_BR','',1617365478,1617365478),('LG','ru','',1617365478,1617365478),('LG','sk','',1617365478,1617365478),('LG','sv','',1617365478,1617365478),('LG','sv_FI','',1617365478,1617365478),('LG','th','',1617365478,1617365478),('LG','tr','',1617365478,1617365478),('LG','uk','',1617365478,1617365478),('LG','zh_Hans','',1617365478,1617365478),('Lastname','cs','',1617699590,1617699590),('Lastname','de','',1617699590,1617699590),('Lastname','en','',1617699590,1617699590),('Lastname','es','',1617699590,1617699590),('Lastname','fa','',1617699590,1617699590),('Lastname','fr','',1617699590,1617699590),('Lastname','hu','',1617699590,1617699590),('Lastname','it','',1617699590,1617699590),('Lastname','ja','',1617699590,1617699590),('Lastname','nl','',1617699590,1617699590),('Lastname','pl','',1617699590,1617699590),('Lastname','pt_BR','',1617699590,1617699590),('Lastname','ru','',1617699590,1617699590),('Lastname','sk','',1617699590,1617699590),('Lastname','sv','',1617699590,1617699590),('Lastname','sv_FI','',1617699590,1617699590),('Lastname','th','',1617699590,1617699590),('Lastname','tr','',1617699590,1617699590),('Lastname','uk','',1617699590,1617699590),('Lastname','zh_Hans','',1617699590,1617699590),('Launch Date','cs','',1617264424,1617264424),('Launch Date','de','',1617264424,1617264424),('Launch Date','en','',1617264424,1617264424),('Launch Date','es','',1617264424,1617264424),('Launch Date','fa','',1617264424,1617264424),('Launch Date','fr','',1617264424,1617264424),('Launch Date','hu','',1617264424,1617264424),('Launch Date','it','',1617264424,1617264424),('Launch Date','ja','',1617264424,1617264424),('Launch Date','nl','',1617264424,1617264424),('Launch Date','pl','',1617264424,1617264424),('Launch Date','pt_BR','',1617264424,1617264424),('Launch Date','ru','',1617264424,1617264424),('Launch Date','sk','',1617264424,1617264424),('Launch Date','sv','',1617264424,1617264424),('Launch Date','sv_FI','',1617264424,1617264424),('Launch Date','th','',1617264424,1617264424),('Launch Date','tr','',1617264424,1617264424),('Launch Date','uk','',1617264424,1617264424),('Launch Date','zh_Hans','',1617264424,1617264424),('Master','cs','',1617206776,1617206776),('Master','de','',1617206776,1617206776),('Master','en','',1617206776,1617206776),('Master','es','',1617206776,1617206776),('Master','fa','',1617206776,1617206776),('Master','fr','',1617206776,1617206776),('Master','hu','',1617206776,1617206776),('Master','it','',1617206776,1617206776),('Master','ja','',1617206776,1617206776),('Master','nl','',1617206776,1617206776),('Master','pl','',1617206776,1617206776),('Master','pt_BR','',1617206776,1617206776),('Master','ru','',1617206776,1617206776),('Master','sk','',1617206776,1617206776),('Master','sv','',1617206776,1617206776),('Master','sv_FI','',1617206776,1617206776),('Master','th','',1617206776,1617206776),('Master','tr','',1617206776,1617206776),('Master','uk','',1617206776,1617206776),('Master','zh_Hans','',1617206776,1617206776),('Master (Admin Mode)','cs','',1617206776,1617206776),('Master (Admin Mode)','de','',1617206776,1617206776),('Master (Admin Mode)','en','',1617206776,1617206776),('Master (Admin Mode)','es','',1617206776,1617206776),('Master (Admin Mode)','fa','',1617206776,1617206776),('Master (Admin Mode)','fr','',1617206776,1617206776),('Master (Admin Mode)','hu','',1617206776,1617206776),('Master (Admin Mode)','it','',1617206776,1617206776),('Master (Admin Mode)','ja','',1617206776,1617206776),('Master (Admin Mode)','nl','',1617206776,1617206776),('Master (Admin Mode)','pl','',1617206776,1617206776),('Master (Admin Mode)','pt_BR','',1617206776,1617206776),('Master (Admin Mode)','ru','',1617206776,1617206776),('Master (Admin Mode)','sk','',1617206776,1617206776),('Master (Admin Mode)','sv','',1617206776,1617206776),('Master (Admin Mode)','sv_FI','',1617206776,1617206776),('Master (Admin Mode)','th','',1617206776,1617206776),('Master (Admin Mode)','tr','',1617206776,1617206776),('Master (Admin Mode)','uk','',1617206776,1617206776),('Master (Admin Mode)','zh_Hans','',1617206776,1617206776),('Message','cs','',1617729170,1617729170),('Message','de','',1617729170,1617729170),('Message','en','',1617729170,1617729170),('Message','es','',1617729170,1617729170),('Message','fa','',1617729170,1617729170),('Message','fr','',1617729170,1617729170),('Message','hu','',1617729170,1617729170),('Message','it','',1617729170,1617729170),('Message','ja','',1617729170,1617729170),('Message','nl','',1617729170,1617729170),('Message','pl','',1617729170,1617729170),('Message','pt_BR','',1617729170,1617729170),('Message','ru','',1617729170,1617729170),('Message','sk','',1617729170,1617729170),('Message','sv','',1617729170,1617729170),('Message','sv_FI','',1617729170,1617729170),('Message','th','',1617729170,1617729170),('Message','tr','',1617729170,1617729170),('Message','uk','',1617729170,1617729170),('Message','zh_Hans','',1617729170,1617729170),('Model Number ','cs','',1617264422,1617264422),('Model Number ','de','',1617264422,1617264422),('Model Number ','en','',1617264422,1617264422),('Model Number ','es','',1617264422,1617264422),('Model Number ','fa','',1617264422,1617264422),('Model Number ','fr','',1617264422,1617264422),('Model Number ','hu','',1617264422,1617264422),('Model Number ','it','',1617264422,1617264422),('Model Number ','ja','',1617264422,1617264422),('Model Number ','nl','',1617264422,1617264422),('Model Number ','pl','',1617264422,1617264422),('Model Number ','pt_BR','',1617264422,1617264422),('Model Number ','ru','',1617264422,1617264422),('Model Number ','sk','',1617264422,1617264422),('Model Number ','sv','',1617264422,1617264422),('Model Number ','sv_FI','',1617264422,1617264422),('Model Number ','th','',1617264422,1617264422),('Model Number ','tr','',1617264422,1617264422),('Model Number ','uk','',1617264422,1617264422),('Model Number ','zh_Hans','',1617264422,1617264422),('Name','cs','',1617209686,1617209686),('Name','de','',1617209686,1617209686),('Name','en','',1617209686,1617209686),('Name','es','',1617209686,1617209686),('Name','fa','',1617209686,1617209686),('Name','fr','',1617209686,1617209686),('Name','hu','',1617209686,1617209686),('Name','it','',1617209686,1617209686),('Name','ja','',1617209686,1617209686),('Name','nl','',1617209686,1617209686),('Name','pl','',1617209686,1617209686),('Name','pt_BR','',1617209686,1617209686),('Name','ru','',1617209686,1617209686),('Name','sk','',1617209686,1617209686),('Name','sv','',1617209686,1617209686),('Name','sv_FI','',1617209686,1617209686),('Name','th','',1617209686,1617209686),('Name','tr','',1617209686,1617209686),('Name','uk','',1617209686,1617209686),('Name','zh_Hans','',1617209686,1617209686),('Price','cs','',1617264422,1617264422),('Price','de','',1617264422,1617264422),('Price','en','',1617264422,1617264422),('Price','es','',1617264422,1617264422),('Price','fa','',1617264422,1617264422),('Price','fr','',1617264422,1617264422),('Price','hu','',1617264422,1617264422),('Price','it','',1617264422,1617264422),('Price','ja','',1617264422,1617264422),('Price','nl','',1617264422,1617264422),('Price','pl','',1617264422,1617264422),('Price','pt_BR','',1617264422,1617264422),('Price','ru','',1617264422,1617264422),('Price','sk','',1617264422,1617264422),('Price','sv','',1617264422,1617264422),('Price','sv_FI','',1617264422,1617264422),('Price','th','',1617264422,1617264422),('Price','tr','',1617264422,1617264422),('Price','uk','',1617264422,1617264422),('Price','zh_Hans','',1617264422,1617264422),('Quantity in stock','cs','',1617264423,1617264423),('Quantity in stock','de','',1617264423,1617264423),('Quantity in stock','en','',1617264423,1617264423),('Quantity in stock','es','',1617264423,1617264423),('Quantity in stock','fa','',1617264423,1617264423),('Quantity in stock','fr','',1617264423,1617264423),('Quantity in stock','hu','',1617264423,1617264423),('Quantity in stock','it','',1617264423,1617264423),('Quantity in stock','ja','',1617264423,1617264423),('Quantity in stock','nl','',1617264423,1617264423),('Quantity in stock','pl','',1617264423,1617264423),('Quantity in stock','pt_BR','',1617264423,1617264423),('Quantity in stock','ru','',1617264423,1617264423),('Quantity in stock','sk','',1617264423,1617264423),('Quantity in stock','sv','',1617264423,1617264423),('Quantity in stock','sv_FI','',1617264423,1617264423),('Quantity in stock','th','',1617264423,1617264423),('Quantity in stock','tr','',1617264423,1617264423),('Quantity in stock','uk','',1617264423,1617264423),('Quantity in stock','zh_Hans','',1617264423,1617264423),('Ratings','cs','',1617264423,1617264423),('Ratings','de','',1617264423,1617264423),('Ratings','en','',1617264423,1617264423),('Ratings','es','',1617264423,1617264423),('Ratings','fa','',1617264423,1617264423),('Ratings','fr','',1617264423,1617264423),('Ratings','hu','',1617264423,1617264423),('Ratings','it','',1617264423,1617264423),('Ratings','ja','',1617264423,1617264423),('Ratings','nl','',1617264423,1617264423),('Ratings','pl','',1617264423,1617264423),('Ratings','pt_BR','',1617264423,1617264423),('Ratings','ru','',1617264423,1617264423),('Ratings','sk','',1617264423,1617264423),('Ratings','sv','',1617264423,1617264423),('Ratings','sv_FI','',1617264423,1617264423),('Ratings','th','',1617264423,1617264423),('Ratings','tr','',1617264423,1617264423),('Ratings','uk','',1617264423,1617264423),('Ratings','zh_Hans','',1617264423,1617264423),('RefrigeratorFeatures','cs','',1617265022,1617265022),('RefrigeratorFeatures','de','',1617265022,1617265022),('RefrigeratorFeatures','en','',1617265022,1617265022),('RefrigeratorFeatures','es','',1617265022,1617265022),('RefrigeratorFeatures','fa','',1617265022,1617265022),('RefrigeratorFeatures','fr','',1617265022,1617265022),('RefrigeratorFeatures','hu','',1617265022,1617265022),('RefrigeratorFeatures','it','',1617265022,1617265022),('RefrigeratorFeatures','ja','',1617265022,1617265022),('RefrigeratorFeatures','nl','',1617265022,1617265022),('RefrigeratorFeatures','pl','',1617265022,1617265022),('RefrigeratorFeatures','pt_BR','',1617265022,1617265022),('RefrigeratorFeatures','ru','',1617265022,1617265022),('RefrigeratorFeatures','sk','',1617265022,1617265022),('RefrigeratorFeatures','sv','',1617265022,1617265022),('RefrigeratorFeatures','sv_FI','',1617265022,1617265022),('RefrigeratorFeatures','th','',1617265022,1617265022),('RefrigeratorFeatures','tr','',1617265022,1617265022),('RefrigeratorFeatures','uk','',1617265022,1617265022),('RefrigeratorFeatures','zh_Hans','',1617265022,1617265022),('Rpm','cs','',1617643945,1617643945),('Rpm','de','',1617643945,1617643945),('Rpm','en','',1617643945,1617643945),('Rpm','es','',1617643945,1617643945),('Rpm','fa','',1617643945,1617643945),('Rpm','fr','',1617643945,1617643945),('Rpm','hu','',1617643945,1617643945),('Rpm','it','',1617643945,1617643945),('Rpm','ja','',1617643945,1617643945),('Rpm','nl','',1617643945,1617643945),('Rpm','pl','',1617643945,1617643945),('Rpm','pt_BR','',1617643945,1617643945),('Rpm','ru','',1617643945,1617643945),('Rpm','sk','',1617643945,1617643945),('Rpm','sv','',1617643945,1617643945),('Rpm','sv_FI','',1617643945,1617643945),('Rpm','th','',1617643945,1617643945),('Rpm','tr','',1617643945,1617643945),('Rpm','uk','',1617643945,1617643945),('Rpm','zh_Hans','',1617643945,1617643945),('Rs','cs','',1617267259,1617267259),('Rs','de','',1617267259,1617267259),('Rs','en','',1617267259,1617267259),('Rs','es','',1617267259,1617267259),('Rs','fa','',1617267259,1617267259),('Rs','fr','',1617267259,1617267259),('Rs','hu','',1617267259,1617267259),('Rs','it','',1617267259,1617267259),('Rs','ja','',1617267259,1617267259),('Rs','nl','',1617267259,1617267259),('Rs','pl','',1617267259,1617267259),('Rs','pt_BR','',1617267259,1617267259),('Rs','ru','',1617267259,1617267259),('Rs','sk','',1617267259,1617267259),('Rs','sv','',1617267259,1617267259),('Rs','sv_FI','',1617267259,1617267259),('Rs','th','',1617267259,1617267259),('Rs','tr','',1617267259,1617267259),('Rs','uk','',1617267259,1617267259),('Rs','zh_Hans','',1617267259,1617267259),('SEO','cs','',1617206656,1617206656),('SEO','de','',1617206656,1617206656),('SEO','en','',1617206656,1617206656),('SEO','es','',1617206656,1617206656),('SEO','fa','',1617206656,1617206656),('SEO','fr','',1617206656,1617206656),('SEO','hu','',1617206656,1617206656),('SEO','it','',1617206656,1617206656),('SEO','ja','',1617206656,1617206656),('SEO','nl','',1617206656,1617206656),('SEO','pl','',1617206656,1617206656),('SEO','pt_BR','',1617206656,1617206656),('SEO','ru','',1617206656,1617206656),('SEO','sk','',1617206656,1617206656),('SEO','sv','',1617206656,1617206656),('SEO','sv_FI','',1617206656,1617206656),('SEO','th','',1617206656,1617206656),('SEO','tr','',1617206656,1617206656),('SEO','uk','',1617206656,1617206656),('SEO','zh_Hans','',1617206656,1617206656),('Samsung','cs','',1617365508,1617365508),('Samsung','de','',1617365508,1617365508),('Samsung','en','',1617365508,1617365508),('Samsung','es','',1617365508,1617365508),('Samsung','fa','',1617365508,1617365508),('Samsung','fr','',1617365508,1617365508),('Samsung','hu','',1617365508,1617365508),('Samsung','it','',1617365508,1617365508),('Samsung','ja','',1617365508,1617365508),('Samsung','nl','',1617365508,1617365508),('Samsung','pl','',1617365508,1617365508),('Samsung','pt_BR','',1617365508,1617365508),('Samsung','ru','',1617365508,1617365508),('Samsung','sk','',1617365508,1617365508),('Samsung','sv','',1617365508,1617365508),('Samsung','sv_FI','',1617365508,1617365508),('Samsung','th','',1617365508,1617365508),('Samsung','tr','',1617365508,1617365508),('Samsung','uk','',1617365508,1617365508),('Samsung','zh_Hans','',1617365508,1617365508),('Shift','cs','',1617366202,1617366202),('Shift','de','',1617366202,1617366202),('Shift','en','',1617366202,1617366202),('Shift','es','',1617366202,1617366202),('Shift','fa','',1617366202,1617366202),('Shift','fr','',1617366202,1617366202),('Shift','hu','',1617366202,1617366202),('Shift','it','',1617366202,1617366202),('Shift','ja','',1617366202,1617366202),('Shift','nl','',1617366202,1617366202),('Shift','pl','',1617366202,1617366202),('Shift','pt_BR','',1617366202,1617366202),('Shift','ru','',1617366202,1617366202),('Shift','sk','',1617366202,1617366202),('Shift','sv','',1617366202,1617366202),('Shift','sv_FI','',1617366202,1617366202),('Shift','th','',1617366202,1617366202),('Shift','tr','',1617366202,1617366202),('Shift','uk','',1617366202,1617366202),('Shift','zh_Hans','',1617366202,1617366202),('Specific Features','cs','',1617264424,1617264424),('Specific Features','de','',1617264424,1617264424),('Specific Features','en','',1617264424,1617264424),('Specific Features','es','',1617264424,1617264424),('Specific Features','fa','',1617264424,1617264424),('Specific Features','fr','',1617264424,1617264424),('Specific Features','hu','',1617264424,1617264424),('Specific Features','it','',1617264424,1617264424),('Specific Features','ja','',1617264424,1617264424),('Specific Features','nl','',1617264424,1617264424),('Specific Features','pl','',1617264424,1617264424),('Specific Features','pt_BR','',1617264424,1617264424),('Specific Features','ru','',1617264424,1617264424),('Specific Features','sk','',1617264424,1617264424),('Specific Features','sv','',1617264424,1617264424),('Specific Features','sv_FI','',1617264424,1617264424),('Specific Features','th','',1617264424,1617264424),('Specific Features','tr','',1617264424,1617264424),('Specific Features','uk','',1617264424,1617264424),('Specific Features','zh_Hans','',1617264424,1617264424),('Speed','cs','',1617646129,1617646129),('Speed','de','',1617646129,1617646129),('Speed','en','',1617646129,1617646129),('Speed','es','',1617646129,1617646129),('Speed','fa','',1617646129,1617646129),('Speed','fr','',1617646129,1617646129),('Speed','hu','',1617646129,1617646129),('Speed','it','',1617646129,1617646129),('Speed','ja','',1617646129,1617646129),('Speed','nl','',1617646129,1617646129),('Speed','pl','',1617646129,1617646129),('Speed','pt_BR','',1617646129,1617646129),('Speed','ru','',1617646129,1617646129),('Speed','sk','',1617646129,1617646129),('Speed','sv','',1617646129,1617646129),('Speed','sv_FI','',1617646129,1617646129),('Speed','th','',1617646129,1617646129),('Speed','tr','',1617646129,1617646129),('Speed','uk','',1617646129,1617646129),('Speed','zh_Hans','',1617646129,1617646129),('Status','cs','',1617643730,1617643730),('Status','de','',1617643730,1617643730),('Status','en','',1617643730,1617643730),('Status','es','',1617643730,1617643730),('Status','fa','',1617643730,1617643730),('Status','fr','',1617643730,1617643730),('Status','hu','',1617643730,1617643730),('Status','it','',1617643730,1617643730),('Status','ja','',1617643730,1617643730),('Status','nl','',1617643730,1617643730),('Status','pl','',1617643730,1617643730),('Status','pt_BR','',1617643730,1617643730),('Status','ru','',1617643730,1617643730),('Status','sk','',1617643730,1617643730),('Status','sv','',1617643730,1617643730),('Status','sv_FI','',1617643730,1617643730),('Status','th','',1617643730,1617643730),('Status','tr','',1617643730,1617643730),('Status','uk','',1617643730,1617643730),('Status','zh_Hans','',1617643730,1617643730),('V','cs','',1617265399,1617265399),('V','de','',1617265399,1617265399),('V','en','',1617265399,1617265399),('V','es','',1617265399,1617265399),('V','fa','',1617265399,1617265399),('V','fr','',1617265399,1617265399),('V','hu','',1617265399,1617265399),('V','it','',1617265399,1617265399),('V','ja','',1617265399,1617265399),('V','nl','',1617265399,1617265399),('V','pl','',1617265399,1617265399),('V','pt_BR','',1617265399,1617265399),('V','ru','',1617265399,1617265399),('V','sk','',1617265399,1617265399),('V','sv','',1617265399,1617265399),('V','sv_FI','',1617265399,1617265399),('V','th','',1617265399,1617265399),('V','tr','',1617265399,1617265399),('V','uk','',1617265399,1617265399),('V','zh_Hans','',1617265399,1617265399),('Voltage','cs','',1617264424,1617264424),('Voltage','de','',1617264424,1617264424),('Voltage','en','',1617264424,1617264424),('Voltage','es','',1617264424,1617264424),('Voltage','fa','',1617264424,1617264424),('Voltage','fr','',1617264424,1617264424),('Voltage','hu','',1617264424,1617264424),('Voltage','it','',1617264424,1617264424),('Voltage','ja','',1617264424,1617264424),('Voltage','nl','',1617264424,1617264424),('Voltage','pl','',1617264424,1617264424),('Voltage','pt_BR','',1617264424,1617264424),('Voltage','ru','',1617264424,1617264424),('Voltage','sk','',1617264424,1617264424),('Voltage','sv','',1617264424,1617264424),('Voltage','sv_FI','',1617264424,1617264424),('Voltage','th','',1617264424,1617264424),('Voltage','tr','',1617264424,1617264424),('Voltage','uk','',1617264424,1617264424),('Voltage','zh_Hans','',1617264424,1617264424),('W','cs','',1617265408,1617265408),('W','de','',1617265408,1617265408),('W','en','',1617265408,1617265408),('W','es','',1617265408,1617265408),('W','fa','',1617265408,1617265408),('W','fr','',1617265408,1617265408),('W','hu','',1617265408,1617265408),('W','it','',1617265408,1617265408),('W','ja','',1617265408,1617265408),('W','nl','',1617265408,1617265408),('W','pl','',1617265408,1617265408),('W','pt_BR','',1617265408,1617265408),('W','ru','',1617265408,1617265408),('W','sk','',1617265408,1617265408),('W','sv','',1617265408,1617265408),('W','sv_FI','',1617265408,1617265408),('W','th','',1617265408,1617265408),('W','tr','',1617265408,1617265408),('W','uk','',1617265408,1617265408),('W','zh_Hans','',1617265408,1617265408),('Wattage','cs','',1617264424,1617264424),('Wattage','de','',1617264424,1617264424),('Wattage','en','',1617264424,1617264424),('Wattage','es','',1617264424,1617264424),('Wattage','fa','',1617264424,1617264424),('Wattage','fr','',1617264424,1617264424),('Wattage','hu','',1617264424,1617264424),('Wattage','it','',1617264424,1617264424),('Wattage','ja','',1617264424,1617264424),('Wattage','nl','',1617264424,1617264424),('Wattage','pl','',1617264424,1617264424),('Wattage','pt_BR','',1617264424,1617264424),('Wattage','ru','',1617264424,1617264424),('Wattage','sk','',1617264424,1617264424),('Wattage','sv','',1617264424,1617264424),('Wattage','sv_FI','',1617264424,1617264424),('Wattage','th','',1617264424,1617264424),('Wattage','tr','',1617264424,1617264424),('Wattage','uk','',1617264424,1617264424),('Wattage','zh_Hans','',1617264424,1617264424),('Weight','cs','',1617264423,1617264423),('Weight','de','',1617264423,1617264423),('Weight','en','',1617264423,1617264423),('Weight','es','',1617264423,1617264423),('Weight','fa','',1617264423,1617264423),('Weight','fr','',1617264423,1617264423),('Weight','hu','',1617264423,1617264423),('Weight','it','',1617264423,1617264423),('Weight','ja','',1617264423,1617264423),('Weight','nl','',1617264423,1617264423),('Weight','pl','',1617264423,1617264423),('Weight','pt_BR','',1617264423,1617264423),('Weight','ru','',1617264423,1617264423),('Weight','sk','',1617264423,1617264423),('Weight','sv','',1617264423,1617264423),('Weight','sv_FI','',1617264423,1617264423),('Weight','th','',1617264423,1617264423),('Weight','tr','',1617264423,1617264423),('Weight','uk','',1617264423,1617264423),('Weight','zh_Hans','',1617264423,1617264423),('XLSX Export','cs','',1617264391,1617264391),('XLSX Export','de','',1617264391,1617264391),('XLSX Export','en','',1617264391,1617264391),('XLSX Export','es','',1617264391,1617264391),('XLSX Export','fa','',1617264391,1617264391),('XLSX Export','fr','',1617264391,1617264391),('XLSX Export','hu','',1617264391,1617264391),('XLSX Export','it','',1617264391,1617264391),('XLSX Export','ja','',1617264391,1617264391),('XLSX Export','nl','',1617264391,1617264391),('XLSX Export','pl','',1617264391,1617264391),('XLSX Export','pt_BR','',1617264391,1617264391),('XLSX Export','ru','',1617264391,1617264391),('XLSX Export','sk','',1617264391,1617264391),('XLSX Export','sv','',1617264391,1617264391),('XLSX Export','sv_FI','',1617264391,1617264391),('XLSX Export','th','',1617264391,1617264391),('XLSX Export','tr','',1617264391,1617264391),('XLSX Export','uk','',1617264391,1617264391),('XLSX Export','zh_Hans','',1617264391,1617264391),('brand','cs','',1617264486,1617264486),('brand','de','',1617264486,1617264486),('brand','en','',1617264486,1617264486),('brand','es','',1617264486,1617264486),('brand','fa','',1617264486,1617264486),('brand','fr','',1617264486,1617264486),('brand','hu','',1617264486,1617264486),('brand','it','',1617264486,1617264486),('brand','ja','',1617264486,1617264486),('brand','nl','',1617264486,1617264486),('brand','pl','',1617264486,1617264486),('brand','pt_BR','',1617264486,1617264486),('brand','ru','',1617264486,1617264486),('brand','sk','',1617264486,1617264486),('brand','sv','',1617264486,1617264486),('brand','sv_FI','',1617264486,1617264486),('brand','th','',1617264486,1617264486),('brand','tr','',1617264486,1617264486),('brand','uk','',1617264486,1617264486),('brand','zh_Hans','',1617264486,1617264486),('category','cs','',1617206659,1617206659),('category','de','',1617206659,1617206659),('category','en','',1617206659,1617206659),('category','es','',1617206659,1617206659),('category','fa','',1617206659,1617206659),('category','fr','',1617206659,1617206659),('category','hu','',1617206659,1617206659),('category','it','',1617206659,1617206659),('category','ja','',1617206659,1617206659),('category','nl','',1617206659,1617206659),('category','pl','',1617206659,1617206659),('category','pt_BR','',1617206659,1617206659),('category','ru','',1617206659,1617206659),('category','sk','',1617206659,1617206659),('category','sv','',1617206659,1617206659),('category','sv_FI','',1617206659,1617206659),('category','th','',1617206659,1617206659),('category','tr','',1617206659,1617206659),('category','uk','',1617206659,1617206659),('category','zh_Hans','',1617206659,1617206659),('centralized','cs','',1617265202,1617265202),('centralized','de','',1617265202,1617265202),('centralized','en','',1617265202,1617265202),('centralized','es','',1617265202,1617265202),('centralized','fa','',1617265202,1617265202),('centralized','fr','',1617265202,1617265202),('centralized','hu','',1617265202,1617265202),('centralized','it','',1617265202,1617265202),('centralized','ja','',1617265202,1617265202),('centralized','nl','',1617265202,1617265202),('centralized','pl','',1617265202,1617265202),('centralized','pt_BR','',1617265202,1617265202),('centralized','ru','',1617265202,1617265202),('centralized','sk','',1617265202,1617265202),('centralized','sv','',1617265202,1617265202),('centralized','sv_FI','',1617265202,1617265202),('centralized','th','',1617265202,1617265202),('centralized','tr','',1617265202,1617265202),('centralized','uk','',1617265202,1617265202),('centralized','zh_Hans','',1617265202,1617265202),('comment','cs','',1617699590,1617699590),('comment','de','',1617699590,1617699590),('comment','en','',1617699590,1617699590),('comment','es','',1617699590,1617699590),('comment','fa','',1617699590,1617699590),('comment','fr','',1617699590,1617699590),('comment','hu','',1617699590,1617699590),('comment','it','',1617699590,1617699590),('comment','ja','',1617699590,1617699590),('comment','nl','',1617699590,1617699590),('comment','pl','',1617699590,1617699590),('comment','pt_BR','',1617699590,1617699590),('comment','ru','',1617699590,1617699590),('comment','sk','',1617699590,1617699590),('comment','sv','',1617699590,1617699590),('comment','sv_FI','',1617699590,1617699590),('comment','th','',1617699590,1617699590),('comment','tr','',1617699590,1617699590),('comment','uk','',1617699590,1617699590),('comment','zh_Hans','',1617699590,1617699590),('default_value_warning','cs','',1617261869,1617261869),('default_value_warning','de','',1617261869,1617261869),('default_value_warning','en','',1617261869,1617261869),('default_value_warning','es','',1617261869,1617261869),('default_value_warning','fa','',1617261869,1617261869),('default_value_warning','fr','',1617261869,1617261869),('default_value_warning','hu','',1617261869,1617261869),('default_value_warning','it','',1617261869,1617261869),('default_value_warning','ja','',1617261869,1617261869),('default_value_warning','nl','',1617261869,1617261869),('default_value_warning','pl','',1617261869,1617261869),('default_value_warning','pt_BR','',1617261869,1617261869),('default_value_warning','ru','',1617261869,1617261869),('default_value_warning','sk','',1617261869,1617261869),('default_value_warning','sv','',1617261869,1617261869),('default_value_warning','sv_FI','',1617261869,1617261869),('default_value_warning','th','',1617261869,1617261869),('default_value_warning','tr','',1617261869,1617261869),('default_value_warning','uk','',1617261869,1617261869),('default_value_warning','zh_Hans','',1617261869,1617261869),('down','cs','',1617261989,1617261989),('down','de','',1617261989,1617261989),('down','en','',1617261989,1617261989),('down','es','',1617261989,1617261989),('down','fa','',1617261989,1617261989),('down','fr','',1617261989,1617261989),('down','hu','',1617261989,1617261989),('down','it','',1617261989,1617261989),('down','ja','',1617261989,1617261989),('down','nl','',1617261989,1617261989),('down','pl','',1617261989,1617261989),('down','pt_BR','',1617261989,1617261989),('down','ru','',1617261989,1617261989),('down','sk','',1617261989,1617261989),('down','sv','',1617261989,1617261989),('down','sv_FI','',1617261989,1617261989),('down','th','',1617261989,1617261989),('down','tr','',1617261989,1617261989),('down','uk','',1617261989,1617261989),('down','zh_Hans','',1617261989,1617261989),('false','cs','',1617261869,1617261869),('false','de','',1617261869,1617261869),('false','en','',1617261869,1617261869),('false','es','',1617261869,1617261869),('false','fa','',1617261869,1617261869),('false','fr','',1617261869,1617261869),('false','hu','',1617261869,1617261869),('false','it','',1617261869,1617261869),('false','ja','',1617261869,1617261869),('false','nl','',1617261869,1617261869),('false','pl','',1617261869,1617261869),('false','pt_BR','',1617261869,1617261869),('false','ru','',1617261869,1617261869),('false','sk','',1617261869,1617261869),('false','sv','',1617261869,1617261869),('false','sv_FI','',1617261869,1617261869),('false','th','',1617261869,1617261869),('false','tr','',1617261869,1617261869),('false','uk','',1617261869,1617261869),('false','zh_Hans','',1617261869,1617261869),('feedback','cs','',1617698476,1617698476),('feedback','de','',1617698476,1617698476),('feedback','en','',1617698476,1617698476),('feedback','es','',1617698476,1617698476),('feedback','fa','',1617698476,1617698476),('feedback','fr','',1617698476,1617698476),('feedback','hu','',1617698476,1617698476),('feedback','it','',1617698476,1617698476),('feedback','ja','',1617698476,1617698476),('feedback','nl','',1617698476,1617698476),('feedback','pl','',1617698476,1617698476),('feedback','pt_BR','',1617698476,1617698476),('feedback','ru','',1617698476,1617698476),('feedback','sk','',1617698476,1617698476),('feedback','sv','',1617698476,1617698476),('feedback','sv_FI','',1617698476,1617698476),('feedback','th','',1617698476,1617698476),('feedback','tr','',1617698476,1617698476),('feedback','uk','',1617698476,1617698476),('feedback','zh_Hans','',1617698476,1617698476),('g','cs','',1617267199,1617267199),('g','de','',1617267199,1617267199),('g','en','',1617267199,1617267199),('g','es','',1617267199,1617267199),('g','fa','',1617267199,1617267199),('g','fr','',1617267199,1617267199),('g','hu','',1617267199,1617267199),('g','it','',1617267199,1617267199),('g','ja','',1617267199,1617267199),('g','nl','',1617267199,1617267199),('g','pl','',1617267199,1617267199),('g','pt_BR','',1617267199,1617267199),('g','ru','',1617267199,1617267199),('g','sk','',1617267199,1617267199),('g','sv','',1617267199,1617267199),('g','sv_FI','',1617267199,1617267199),('g','th','',1617267199,1617267199),('g','tr','',1617267199,1617267199),('g','uk','',1617267199,1617267199),('g','zh_Hans','',1617267199,1617267199),('havells','cs','',1617812590,1617812590),('havells','de','',1617812590,1617812590),('havells','en','',1617812590,1617812590),('havells','es','',1617812590,1617812590),('havells','fa','',1617812590,1617812590),('havells','fr','',1617812590,1617812590),('havells','hu','',1617812590,1617812590),('havells','it','',1617812590,1617812590),('havells','ja','',1617812590,1617812590),('havells','nl','',1617812590,1617812590),('havells','pl','',1617812590,1617812590),('havells','pt_BR','',1617812590,1617812590),('havells','ru','',1617812590,1617812590),('havells','sk','',1617812590,1617812590),('havells','sv','',1617812590,1617812590),('havells','sv_FI','',1617812590,1617812590),('havells','th','',1617812590,1617812590),('havells','tr','',1617812590,1617812590),('havells','uk','',1617812590,1617812590),('havells','zh_Hans','',1617812590,1617812590),('import','cs','',1617643013,1617643013),('import','de','',1617643013,1617643013),('import','en','',1617643013,1617643013),('import','es','',1617643013,1617643013),('import','fa','',1617643013,1617643013),('import','fr','',1617643013,1617643013),('import','hu','',1617643013,1617643013),('import','it','',1617643013,1617643013),('import','ja','',1617643013,1617643013),('import','nl','',1617643013,1617643013),('import','pl','',1617643013,1617643013),('import','pt_BR','',1617643013,1617643013),('import','ru','',1617643013,1617643013),('import','sk','',1617643013,1617643013),('import','sv','',1617643013,1617643013),('import','sv_FI','',1617643013,1617643013),('import','th','',1617643013,1617643013),('import','tr','',1617643013,1617643013),('import','uk','',1617643013,1617643013),('import','zh_Hans','',1617643013,1617643013),('kg','cs','',1617265268,1617265268),('kg','de','',1617265268,1617265268),('kg','en','',1617265268,1617265268),('kg','es','',1617265268,1617265268),('kg','fa','',1617265268,1617265268),('kg','fr','',1617265268,1617265268),('kg','hu','',1617265268,1617265268),('kg','it','',1617265268,1617265268),('kg','ja','',1617265268,1617265268),('kg','nl','',1617265268,1617265268),('kg','pl','',1617265268,1617265268),('kg','pt_BR','',1617265268,1617265268),('kg','ru','',1617265268,1617265268),('kg','sk','',1617265268,1617265268),('kg','sv','',1617265268,1617265268),('kg','sv_FI','',1617265268,1617265268),('kg','th','',1617265268,1617265268),('kg','tr','',1617265268,1617265268),('kg','uk','',1617265268,1617265268),('kg','zh_Hans','',1617265268,1617265268),('log','cs','',1617728478,1617728478),('log','de','',1617728478,1617728478),('log','en','',1617728478,1617728478),('log','es','',1617728478,1617728478),('log','fa','',1617728478,1617728478),('log','fr','',1617728478,1617728478),('log','hu','',1617728478,1617728478),('log','it','',1617728478,1617728478),('log','ja','',1617728478,1617728478),('log','nl','',1617728478,1617728478),('log','pl','',1617728478,1617728478),('log','pt_BR','',1617728478,1617728478),('log','ru','',1617728478,1617728478),('log','sk','',1617728478,1617728478),('log','sv','',1617728478,1617728478),('log','sv_FI','',1617728478,1617728478),('log','th','',1617728478,1617728478),('log','tr','',1617728478,1617728478),('log','uk','',1617728478,1617728478),('log','zh_Hans','',1617728478,1617728478),('null','cs','',1617261869,1617261869),('null','de','',1617261869,1617261869),('null','en','',1617261869,1617261869),('null','es','',1617261869,1617261869),('null','fa','',1617261869,1617261869),('null','fr','',1617261869,1617261869),('null','hu','',1617261869,1617261869),('null','it','',1617261869,1617261869),('null','ja','',1617261869,1617261869),('null','nl','',1617261869,1617261869),('null','pl','',1617261869,1617261869),('null','pt_BR','',1617261869,1617261869),('null','ru','',1617261869,1617261869),('null','sk','',1617261869,1617261869),('null','sv','',1617261869,1617261869),('null','sv_FI','',1617261869,1617261869),('null','th','',1617261869,1617261869),('null','tr','',1617261869,1617261869),('null','uk','',1617261869,1617261869),('null','zh_Hans','',1617261869,1617261869),('object_add_dialog_custom_text.brand','cs','',1617264542,1617264542),('object_add_dialog_custom_text.brand','de','',1617264542,1617264542),('object_add_dialog_custom_text.brand','en','',1617264542,1617264542),('object_add_dialog_custom_text.brand','es','',1617264542,1617264542),('object_add_dialog_custom_text.brand','fa','',1617264542,1617264542),('object_add_dialog_custom_text.brand','fr','',1617264542,1617264542),('object_add_dialog_custom_text.brand','hu','',1617264542,1617264542),('object_add_dialog_custom_text.brand','it','',1617264542,1617264542),('object_add_dialog_custom_text.brand','ja','',1617264542,1617264542),('object_add_dialog_custom_text.brand','nl','',1617264542,1617264542),('object_add_dialog_custom_text.brand','pl','',1617264542,1617264542),('object_add_dialog_custom_text.brand','pt_BR','',1617264542,1617264542),('object_add_dialog_custom_text.brand','ru','',1617264542,1617264542),('object_add_dialog_custom_text.brand','sk','',1617264542,1617264542),('object_add_dialog_custom_text.brand','sv','',1617264542,1617264542),('object_add_dialog_custom_text.brand','sv_FI','',1617264542,1617264542),('object_add_dialog_custom_text.brand','th','',1617264542,1617264542),('object_add_dialog_custom_text.brand','tr','',1617264542,1617264542),('object_add_dialog_custom_text.brand','uk','',1617264542,1617264542),('object_add_dialog_custom_text.brand','zh_Hans','',1617264542,1617264542),('object_add_dialog_custom_text.category','cs','',1617206776,1617206776),('object_add_dialog_custom_text.category','de','',1617206776,1617206776),('object_add_dialog_custom_text.category','en','',1617206776,1617206776),('object_add_dialog_custom_text.category','es','',1617206776,1617206776),('object_add_dialog_custom_text.category','fa','',1617206776,1617206776),('object_add_dialog_custom_text.category','fr','',1617206776,1617206776),('object_add_dialog_custom_text.category','hu','',1617206776,1617206776),('object_add_dialog_custom_text.category','it','',1617206776,1617206776),('object_add_dialog_custom_text.category','ja','',1617206776,1617206776),('object_add_dialog_custom_text.category','nl','',1617206776,1617206776),('object_add_dialog_custom_text.category','pl','',1617206776,1617206776),('object_add_dialog_custom_text.category','pt_BR','',1617206776,1617206776),('object_add_dialog_custom_text.category','ru','',1617206776,1617206776),('object_add_dialog_custom_text.category','sk','',1617206776,1617206776),('object_add_dialog_custom_text.category','sv','',1617206776,1617206776),('object_add_dialog_custom_text.category','sv_FI','',1617206776,1617206776),('object_add_dialog_custom_text.category','th','',1617206776,1617206776),('object_add_dialog_custom_text.category','tr','',1617206776,1617206776),('object_add_dialog_custom_text.category','uk','',1617206776,1617206776),('object_add_dialog_custom_text.category','zh_Hans','',1617206776,1617206776),('object_add_dialog_custom_text.import','cs','',1617643699,1617643699),('object_add_dialog_custom_text.import','de','',1617643699,1617643699),('object_add_dialog_custom_text.import','en','',1617643699,1617643699),('object_add_dialog_custom_text.import','es','',1617643699,1617643699),('object_add_dialog_custom_text.import','fa','',1617643699,1617643699),('object_add_dialog_custom_text.import','fr','',1617643699,1617643699),('object_add_dialog_custom_text.import','hu','',1617643699,1617643699),('object_add_dialog_custom_text.import','it','',1617643699,1617643699),('object_add_dialog_custom_text.import','ja','',1617643699,1617643699),('object_add_dialog_custom_text.import','nl','',1617643699,1617643699),('object_add_dialog_custom_text.import','pl','',1617643699,1617643699),('object_add_dialog_custom_text.import','pt_BR','',1617643699,1617643699),('object_add_dialog_custom_text.import','ru','',1617643699,1617643699),('object_add_dialog_custom_text.import','sk','',1617643699,1617643699),('object_add_dialog_custom_text.import','sv','',1617643699,1617643699),('object_add_dialog_custom_text.import','sv_FI','',1617643699,1617643699),('object_add_dialog_custom_text.import','th','',1617643699,1617643699),('object_add_dialog_custom_text.import','tr','',1617643699,1617643699),('object_add_dialog_custom_text.import','uk','',1617643699,1617643699),('object_add_dialog_custom_text.import','zh_Hans','',1617643699,1617643699),('object_add_dialog_custom_text.product','cs','',1617209776,1617209776),('object_add_dialog_custom_text.product','de','',1617209776,1617209776),('object_add_dialog_custom_text.product','en','',1617209776,1617209776),('object_add_dialog_custom_text.product','es','',1617209776,1617209776),('object_add_dialog_custom_text.product','fa','',1617209776,1617209776),('object_add_dialog_custom_text.product','fr','',1617209776,1617209776),('object_add_dialog_custom_text.product','hu','',1617209776,1617209776),('object_add_dialog_custom_text.product','it','',1617209776,1617209776),('object_add_dialog_custom_text.product','ja','',1617209776,1617209776),('object_add_dialog_custom_text.product','nl','',1617209776,1617209776),('object_add_dialog_custom_text.product','pl','',1617209776,1617209776),('object_add_dialog_custom_text.product','pt_BR','',1617209776,1617209776),('object_add_dialog_custom_text.product','ru','',1617209776,1617209776),('object_add_dialog_custom_text.product','sk','',1617209776,1617209776),('object_add_dialog_custom_text.product','sv','',1617209776,1617209776),('object_add_dialog_custom_text.product','sv_FI','',1617209776,1617209776),('object_add_dialog_custom_text.product','th','',1617209776,1617209776),('object_add_dialog_custom_text.product','tr','',1617209776,1617209776),('object_add_dialog_custom_text.product','uk','',1617209776,1617209776),('object_add_dialog_custom_text.product','zh_Hans','',1617209776,1617209776),('object_add_dialog_custom_title.brand','cs','',1617264542,1617264542),('object_add_dialog_custom_title.brand','de','',1617264542,1617264542),('object_add_dialog_custom_title.brand','en','',1617264542,1617264542),('object_add_dialog_custom_title.brand','es','',1617264542,1617264542),('object_add_dialog_custom_title.brand','fa','',1617264542,1617264542),('object_add_dialog_custom_title.brand','fr','',1617264542,1617264542),('object_add_dialog_custom_title.brand','hu','',1617264542,1617264542),('object_add_dialog_custom_title.brand','it','',1617264542,1617264542),('object_add_dialog_custom_title.brand','ja','',1617264542,1617264542),('object_add_dialog_custom_title.brand','nl','',1617264542,1617264542),('object_add_dialog_custom_title.brand','pl','',1617264542,1617264542),('object_add_dialog_custom_title.brand','pt_BR','',1617264542,1617264542),('object_add_dialog_custom_title.brand','ru','',1617264542,1617264542),('object_add_dialog_custom_title.brand','sk','',1617264542,1617264542),('object_add_dialog_custom_title.brand','sv','',1617264542,1617264542),('object_add_dialog_custom_title.brand','sv_FI','',1617264542,1617264542),('object_add_dialog_custom_title.brand','th','',1617264542,1617264542),('object_add_dialog_custom_title.brand','tr','',1617264542,1617264542),('object_add_dialog_custom_title.brand','uk','',1617264542,1617264542),('object_add_dialog_custom_title.brand','zh_Hans','',1617264542,1617264542),('object_add_dialog_custom_title.category','cs','',1617206776,1617206776),('object_add_dialog_custom_title.category','de','',1617206776,1617206776),('object_add_dialog_custom_title.category','en','',1617206776,1617206776),('object_add_dialog_custom_title.category','es','',1617206776,1617206776),('object_add_dialog_custom_title.category','fa','',1617206776,1617206776),('object_add_dialog_custom_title.category','fr','',1617206776,1617206776),('object_add_dialog_custom_title.category','hu','',1617206776,1617206776),('object_add_dialog_custom_title.category','it','',1617206776,1617206776),('object_add_dialog_custom_title.category','ja','',1617206776,1617206776),('object_add_dialog_custom_title.category','nl','',1617206776,1617206776),('object_add_dialog_custom_title.category','pl','',1617206776,1617206776),('object_add_dialog_custom_title.category','pt_BR','',1617206776,1617206776),('object_add_dialog_custom_title.category','ru','',1617206776,1617206776),('object_add_dialog_custom_title.category','sk','',1617206776,1617206776),('object_add_dialog_custom_title.category','sv','',1617206776,1617206776),('object_add_dialog_custom_title.category','sv_FI','',1617206776,1617206776),('object_add_dialog_custom_title.category','th','',1617206776,1617206776),('object_add_dialog_custom_title.category','tr','',1617206776,1617206776),('object_add_dialog_custom_title.category','uk','',1617206776,1617206776),('object_add_dialog_custom_title.category','zh_Hans','',1617206776,1617206776),('object_add_dialog_custom_title.import','cs','',1617643700,1617643700),('object_add_dialog_custom_title.import','de','',1617643700,1617643700),('object_add_dialog_custom_title.import','en','',1617643700,1617643700),('object_add_dialog_custom_title.import','es','',1617643700,1617643700),('object_add_dialog_custom_title.import','fa','',1617643700,1617643700),('object_add_dialog_custom_title.import','fr','',1617643700,1617643700),('object_add_dialog_custom_title.import','hu','',1617643700,1617643700),('object_add_dialog_custom_title.import','it','',1617643700,1617643700),('object_add_dialog_custom_title.import','ja','',1617643700,1617643700),('object_add_dialog_custom_title.import','nl','',1617643700,1617643700),('object_add_dialog_custom_title.import','pl','',1617643700,1617643700),('object_add_dialog_custom_title.import','pt_BR','',1617643700,1617643700),('object_add_dialog_custom_title.import','ru','',1617643700,1617643700),('object_add_dialog_custom_title.import','sk','',1617643700,1617643700),('object_add_dialog_custom_title.import','sv','',1617643700,1617643700),('object_add_dialog_custom_title.import','sv_FI','',1617643700,1617643700),('object_add_dialog_custom_title.import','th','',1617643700,1617643700),('object_add_dialog_custom_title.import','tr','',1617643700,1617643700),('object_add_dialog_custom_title.import','uk','',1617643700,1617643700),('object_add_dialog_custom_title.import','zh_Hans','',1617643700,1617643700),('object_add_dialog_custom_title.product','cs','',1617209776,1617209776),('object_add_dialog_custom_title.product','de','',1617209776,1617209776),('object_add_dialog_custom_title.product','en','',1617209776,1617209776),('object_add_dialog_custom_title.product','es','',1617209776,1617209776),('object_add_dialog_custom_title.product','fa','',1617209776,1617209776),('object_add_dialog_custom_title.product','fr','',1617209776,1617209776),('object_add_dialog_custom_title.product','hu','',1617209776,1617209776),('object_add_dialog_custom_title.product','it','',1617209776,1617209776),('object_add_dialog_custom_title.product','ja','',1617209776,1617209776),('object_add_dialog_custom_title.product','nl','',1617209776,1617209776),('object_add_dialog_custom_title.product','pl','',1617209776,1617209776),('object_add_dialog_custom_title.product','pt_BR','',1617209776,1617209776),('object_add_dialog_custom_title.product','ru','',1617209776,1617209776),('object_add_dialog_custom_title.product','sk','',1617209776,1617209776),('object_add_dialog_custom_title.product','sv','',1617209776,1617209776),('object_add_dialog_custom_title.product','sv_FI','',1617209776,1617209776),('object_add_dialog_custom_title.product','th','',1617209776,1617209776),('object_add_dialog_custom_title.product','tr','',1617209776,1617209776),('object_add_dialog_custom_title.product','uk','',1617209776,1617209776),('object_add_dialog_custom_title.product','zh_Hans','',1617209776,1617209776),('product','cs','',1617209747,1617209747),('product','de','',1617209747,1617209747),('product','en','',1617209747,1617209747),('product','es','',1617209747,1617209747),('product','fa','',1617209747,1617209747),('product','fr','',1617209747,1617209747),('product','hu','',1617209747,1617209747),('product','it','',1617209747,1617209747),('product','ja','',1617209747,1617209747),('product','nl','',1617209747,1617209747),('product','pl','',1617209747,1617209747),('product','pt_BR','',1617209747,1617209747),('product','ru','',1617209747,1617209747),('product','sk','',1617209747,1617209747),('product','sv','',1617209747,1617209747),('product','sv_FI','',1617209747,1617209747),('product','th','',1617209747,1617209747),('product','tr','',1617209747,1617209747),('product','uk','',1617209747,1617209747),('product','zh_Hans','',1617209747,1617209747),('split','cs','',1617265202,1617265202),('split','de','',1617265202,1617265202),('split','en','',1617265202,1617265202),('split','es','',1617265202,1617265202),('split','fa','',1617265202,1617265202),('split','fr','',1617265202,1617265202),('split','hu','',1617265202,1617265202),('split','it','',1617265202,1617265202),('split','ja','',1617265202,1617265202),('split','nl','',1617265202,1617265202),('split','pl','',1617265202,1617265202),('split','pt_BR','',1617265202,1617265202),('split','ru','',1617265202,1617265202),('split','sk','',1617265202,1617265202),('split','sv','',1617265202,1617265202),('split','sv_FI','',1617265202,1617265202),('split','th','',1617265202,1617265202),('split','tr','',1617265202,1617265202),('split','uk','',1617265202,1617265202),('split','zh_Hans','',1617265202,1617265202),('ton ','cs','',1617265260,1617265260),('ton ','de','',1617265260,1617265260),('ton ','en','',1617265260,1617265260),('ton ','es','',1617265260,1617265260),('ton ','fa','',1617265260,1617265260),('ton ','fr','',1617265260,1617265260),('ton ','hu','',1617265260,1617265260),('ton ','it','',1617265260,1617265260),('ton ','ja','',1617265260,1617265260),('ton ','nl','',1617265260,1617265260),('ton ','pl','',1617265260,1617265260),('ton ','pt_BR','',1617265260,1617265260),('ton ','ru','',1617265260,1617265260),('ton ','sk','',1617265260,1617265260),('ton ','sv','',1617265260,1617265260),('ton ','sv_FI','',1617265260,1617265260),('ton ','th','',1617265260,1617265260),('ton ','tr','',1617265260,1617265260),('ton ','uk','',1617265260,1617265260),('ton ','zh_Hans','',1617265260,1617265260),('true','cs','',1617261869,1617261869),('true','de','',1617261869,1617261869),('true','en','',1617261869,1617261869),('true','es','',1617261869,1617261869),('true','fa','',1617261869,1617261869),('true','fr','',1617261869,1617261869),('true','hu','',1617261869,1617261869),('true','it','',1617261869,1617261869),('true','ja','',1617261869,1617261869),('true','nl','',1617261869,1617261869),('true','pl','',1617261869,1617261869),('true','pt_BR','',1617261869,1617261869),('true','ru','',1617261869,1617261869),('true','sk','',1617261869,1617261869),('true','sv','',1617261869,1617261869),('true','sv_FI','',1617261869,1617261869),('true','th','',1617261869,1617261869),('true','tr','',1617261869,1617261869),('true','uk','',1617261869,1617261869),('true','zh_Hans','',1617261869,1617261869),('up','cs','',1617261989,1617261989),('up','de','',1617261989,1617261989),('up','en','',1617261989,1617261989),('up','es','',1617261989,1617261989),('up','fa','',1617261989,1617261989),('up','fr','',1617261989,1617261989),('up','hu','',1617261989,1617261989),('up','it','',1617261989,1617261989),('up','ja','',1617261989,1617261989),('up','nl','',1617261989,1617261989),('up','pl','',1617261989,1617261989),('up','pt_BR','',1617261989,1617261989),('up','ru','',1617261989,1617261989),('up','sk','',1617261989,1617261989),('up','sv','',1617261989,1617261989),('up','sv_FI','',1617261989,1617261989),('up','th','',1617261989,1617261989),('up','tr','',1617261989,1617261989),('up','uk','',1617261989,1617261989),('up','zh_Hans','',1617261989,1617261989),('window','cs','',1617265202,1617265202),('window','de','',1617265202,1617265202),('window','en','',1617265202,1617265202),('window','es','',1617265202,1617265202),('window','fa','',1617265202,1617265202),('window','fr','',1617265202,1617265202),('window','hu','',1617265202,1617265202),('window','it','',1617265202,1617265202),('window','ja','',1617265202,1617265202),('window','nl','',1617265202,1617265202),('window','pl','',1617265202,1617265202),('window','pt_BR','',1617265202,1617265202),('window','ru','',1617265202,1617265202),('window','sk','',1617265202,1617265202),('window','sv','',1617265202,1617265202),('window','sv_FI','',1617265202,1617265202),('window','th','',1617265202,1617265202),('window','tr','',1617265202,1617265202),('window','uk','',1617265202,1617265202),('window','zh_Hans','',1617265202,1617265202);
/*!40000 ALTER TABLE `translations_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations_website`
--

DROP TABLE IF EXISTS `translations_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations_website` (
  `key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `text` text,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  PRIMARY KEY (`key`,`language`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations_website`
--

LOCK TABLES `translations_website` WRITE;
/*!40000 ALTER TABLE `translations_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tree_locks`
--

DROP TABLE IF EXISTS `tree_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tree_locks` (
  `id` int NOT NULL DEFAULT '0',
  `type` enum('asset','document','object') NOT NULL DEFAULT 'asset',
  `locked` enum('self','propagate') DEFAULT NULL,
  PRIMARY KEY (`id`,`type`),
  KEY `type` (`type`),
  KEY `locked` (`locked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tree_locks`
--

LOCK TABLES `tree_locks` WRITE;
/*!40000 ALTER TABLE `tree_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tree_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int unsigned DEFAULT NULL,
  `type` enum('user','userfolder','role','rolefolder') NOT NULL DEFAULT 'user',
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(190) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `contentLanguages` longtext,
  `admin` tinyint unsigned DEFAULT '0',
  `active` tinyint unsigned DEFAULT '1',
  `permissions` text,
  `roles` varchar(1000) DEFAULT NULL,
  `welcomescreen` tinyint(1) DEFAULT NULL,
  `closeWarning` tinyint(1) DEFAULT NULL,
  `memorizeTabs` tinyint(1) DEFAULT NULL,
  `allowDirtyClose` tinyint unsigned DEFAULT '1',
  `docTypes` varchar(255) DEFAULT NULL,
  `classes` text,
  `apiKey` varchar(255) DEFAULT NULL,
  `twoFactorAuthentication` varchar(255) DEFAULT NULL,
  `activePerspective` varchar(255) DEFAULT NULL,
  `perspectives` longtext,
  `websiteTranslationLanguagesEdit` longtext,
  `websiteTranslationLanguagesView` longtext,
  `lastLogin` int unsigned DEFAULT NULL,
  `keyBindings` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type`,`name`),
  KEY `parentId` (`parentId`),
  KEY `name` (`name`),
  KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,0,'user','system',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,0,'user','admin','$2y$10$Xsa5QaRtBxpk7ge0zYp7F.nixBa0SuvQvH1b1UNnniLttRp9ExU.q','','','','en','en',1,1,'admin_translations,application_logging,asset_metadata,assets,classes,clear_cache,clear_fullpage_cache,clear_temp_files,dashboards,document_types,documents,emails,gdpr_data_extractor,glossary,http_errors,notes_events,notifications,notifications_send,objects,piwik_reports,piwik_settings,plugins,predefined_properties,qr_codes,recyclebin,redirects,reports,reports_config,robots.txt,routes,seemode,seo_document_editor,share_configurations,system_settings,tag_snippet_management,tags_assignment,tags_configuration,tags_search,targeting,thumbnails,translations,users,web2print_settings,website_settings,workflow_details','',0,1,1,0,'','','b0f4cb17bd557c98ede3d4ac968b9c5813d86473069158ff0c0f1c1ee2780283','{\"required\":false,\"enabled\":false,\"secret\":\"\",\"type\":\"\"}','default','','','',1617790070,'[{\"action\":\"save\",\"key\":83,\"ctrl\":true},{\"action\":\"publish\",\"key\":80,\"ctrl\":true,\"shift\":true},{\"action\":\"unpublish\",\"key\":85,\"ctrl\":true,\"shift\":true},{\"action\":\"rename\",\"key\":82,\"alt\":true,\"shift\":true},{\"action\":\"refresh\",\"key\":116},{\"action\":\"openDocument\",\"key\":68,\"ctrl\":true,\"shift\":true},{\"action\":\"openAsset\",\"key\":65,\"ctrl\":true,\"shift\":true},{\"action\":\"openObject\",\"key\":79,\"ctrl\":true,\"shift\":true},{\"action\":\"openClassEditor\",\"key\":67,\"ctrl\":true,\"shift\":true},{\"action\":\"openInTree\",\"key\":76,\"ctrl\":true,\"shift\":true},{\"action\":\"showMetaInfo\",\"key\":73,\"alt\":true},{\"action\":\"searchDocument\",\"key\":87,\"alt\":true},{\"action\":\"searchAsset\",\"key\":65,\"alt\":true},{\"action\":\"searchObject\",\"key\":79,\"alt\":true},{\"action\":\"showElementHistory\",\"key\":72,\"alt\":true},{\"action\":\"closeAllTabs\",\"key\":84,\"alt\":true},{\"action\":\"searchAndReplaceAssignments\",\"key\":83,\"alt\":true},{\"action\":\"glossary\",\"key\":71,\"shift\":true,\"alt\":true},{\"action\":\"redirects\",\"key\":82,\"ctrl\":false,\"alt\":true},{\"action\":\"sharedTranslations\",\"key\":84,\"ctrl\":true,\"alt\":true},{\"action\":\"recycleBin\",\"key\":82,\"ctrl\":true,\"alt\":true},{\"action\":\"notesEvents\",\"key\":78,\"ctrl\":true,\"alt\":true},{\"action\":\"applicationLogger\",\"key\":76,\"ctrl\":true,\"alt\":true},{\"action\":\"reports\",\"key\":77,\"ctrl\":true,\"alt\":true},{\"action\":\"tagManager\",\"key\":72,\"ctrl\":true,\"alt\":true},{\"action\":\"seoDocumentEditor\",\"key\":83,\"ctrl\":true,\"alt\":true},{\"action\":\"robots\",\"key\":74,\"ctrl\":true,\"alt\":true},{\"action\":\"httpErrorLog\",\"key\":79,\"ctrl\":true,\"alt\":true},{\"action\":\"customReports\",\"key\":67,\"ctrl\":true,\"alt\":true},{\"action\":\"tagConfiguration\",\"key\":78,\"ctrl\":true,\"alt\":true},{\"action\":\"users\",\"key\":85,\"ctrl\":true,\"alt\":true},{\"action\":\"roles\",\"key\":80,\"ctrl\":true,\"alt\":true},{\"action\":\"clearAllCaches\",\"key\":81,\"ctrl\":false,\"alt\":true},{\"action\":\"clearDataCache\",\"key\":67,\"ctrl\":false,\"alt\":true},{\"action\":\"quickSearch\",\"key\":70,\"ctrl\":true,\"shift\":true}]'),(3,0,'role','BusinessManager',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'assets,dashboards,documents,objects',NULL,NULL,NULL,NULL,1,'','category,brand,product',NULL,NULL,NULL,'','','',NULL,NULL),(4,0,'user','BusinessManager','$2y$10$BFd0pPEkyy5xxjkdVTNAjuuMiNBs8WWtPwyvnShEdtbsntxODbL9G','prachi','oberai','','en','en',0,1,'','3',0,1,1,0,'','','','{\"required\":false,\"enabled\":false,\"secret\":\"\",\"type\":\"\"}',NULL,'','','',1617366687,'[{\"action\":\"save\",\"key\":83,\"ctrl\":true},{\"action\":\"publish\",\"key\":80,\"ctrl\":true,\"shift\":true},{\"action\":\"unpublish\",\"key\":85,\"ctrl\":true,\"shift\":true},{\"action\":\"rename\",\"key\":82,\"alt\":true,\"shift\":true},{\"action\":\"refresh\",\"key\":116},{\"action\":\"openDocument\",\"key\":68,\"ctrl\":true,\"shift\":true},{\"action\":\"openAsset\",\"key\":65,\"ctrl\":true,\"shift\":true},{\"action\":\"openObject\",\"key\":79,\"ctrl\":true,\"shift\":true},{\"action\":\"openClassEditor\",\"key\":67,\"ctrl\":true,\"shift\":true},{\"action\":\"openInTree\",\"key\":76,\"ctrl\":true,\"shift\":true},{\"action\":\"showMetaInfo\",\"key\":73,\"alt\":true},{\"action\":\"searchDocument\",\"key\":87,\"alt\":true},{\"action\":\"searchAsset\",\"key\":65,\"alt\":true},{\"action\":\"searchObject\",\"key\":79,\"alt\":true},{\"action\":\"showElementHistory\",\"key\":72,\"alt\":true},{\"action\":\"closeAllTabs\",\"key\":84,\"alt\":true},{\"action\":\"searchAndReplaceAssignments\",\"key\":83,\"alt\":true},{\"action\":\"glossary\",\"key\":71,\"shift\":true,\"alt\":true},{\"action\":\"redirects\",\"key\":82,\"ctrl\":false,\"alt\":true},{\"action\":\"sharedTranslations\",\"key\":84,\"ctrl\":true,\"alt\":true},{\"action\":\"recycleBin\",\"key\":82,\"ctrl\":true,\"alt\":true},{\"action\":\"notesEvents\",\"key\":78,\"ctrl\":true,\"alt\":true},{\"action\":\"applicationLogger\",\"key\":76,\"ctrl\":true,\"alt\":true},{\"action\":\"reports\",\"key\":77,\"ctrl\":true,\"alt\":true},{\"action\":\"tagManager\",\"key\":72,\"ctrl\":true,\"alt\":true},{\"action\":\"seoDocumentEditor\",\"key\":83,\"ctrl\":true,\"alt\":true},{\"action\":\"robots\",\"key\":74,\"ctrl\":true,\"alt\":true},{\"action\":\"httpErrorLog\",\"key\":79,\"ctrl\":true,\"alt\":true},{\"action\":\"customReports\",\"key\":67,\"ctrl\":true,\"alt\":true},{\"action\":\"tagConfiguration\",\"key\":78,\"ctrl\":true,\"alt\":true},{\"action\":\"users\",\"key\":85,\"ctrl\":true,\"alt\":true},{\"action\":\"roles\",\"key\":80,\"ctrl\":true,\"alt\":true},{\"action\":\"clearAllCaches\",\"key\":81,\"ctrl\":false,\"alt\":true},{\"action\":\"clearDataCache\",\"key\":67,\"ctrl\":false,\"alt\":true},{\"action\":\"quickSearch\",\"key\":70,\"ctrl\":true,\"shift\":true}]'),(5,0,'role','DataEntry',NULL,NULL,NULL,NULL,NULL,NULL,0,1,'assets,dashboards,objects',NULL,NULL,NULL,NULL,1,'','category,brand,product',NULL,NULL,NULL,'','','',NULL,NULL),(6,0,'user','DataEntry','$2y$10$Snnn1aovM2frJMkHvzqxT.RqHv.ICtBJdfr4U.CdZbzh0hNUuHXZ.','vashu','sharma','','en','en',0,1,'','5',0,1,1,0,'','','','{\"required\":false,\"enabled\":false,\"secret\":\"\",\"type\":\"\"}',NULL,'','','',1617367258,'[{\"action\":\"save\",\"key\":83,\"ctrl\":true},{\"action\":\"publish\",\"key\":80,\"ctrl\":true,\"shift\":true},{\"action\":\"unpublish\",\"key\":85,\"ctrl\":true,\"shift\":true},{\"action\":\"rename\",\"key\":82,\"alt\":true,\"shift\":true},{\"action\":\"refresh\",\"key\":116},{\"action\":\"openDocument\",\"key\":68,\"ctrl\":true,\"shift\":true},{\"action\":\"openAsset\",\"key\":65,\"ctrl\":true,\"shift\":true},{\"action\":\"openObject\",\"key\":79,\"ctrl\":true,\"shift\":true},{\"action\":\"openClassEditor\",\"key\":67,\"ctrl\":true,\"shift\":true},{\"action\":\"openInTree\",\"key\":76,\"ctrl\":true,\"shift\":true},{\"action\":\"showMetaInfo\",\"key\":73,\"alt\":true},{\"action\":\"searchDocument\",\"key\":87,\"alt\":true},{\"action\":\"searchAsset\",\"key\":65,\"alt\":true},{\"action\":\"searchObject\",\"key\":79,\"alt\":true},{\"action\":\"showElementHistory\",\"key\":72,\"alt\":true},{\"action\":\"closeAllTabs\",\"key\":84,\"alt\":true},{\"action\":\"searchAndReplaceAssignments\",\"key\":83,\"alt\":true},{\"action\":\"glossary\",\"key\":71,\"shift\":true,\"alt\":true},{\"action\":\"redirects\",\"key\":82,\"ctrl\":false,\"alt\":true},{\"action\":\"sharedTranslations\",\"key\":84,\"ctrl\":true,\"alt\":true},{\"action\":\"recycleBin\",\"key\":82,\"ctrl\":true,\"alt\":true},{\"action\":\"notesEvents\",\"key\":78,\"ctrl\":true,\"alt\":true},{\"action\":\"applicationLogger\",\"key\":76,\"ctrl\":true,\"alt\":true},{\"action\":\"reports\",\"key\":77,\"ctrl\":true,\"alt\":true},{\"action\":\"tagManager\",\"key\":72,\"ctrl\":true,\"alt\":true},{\"action\":\"seoDocumentEditor\",\"key\":83,\"ctrl\":true,\"alt\":true},{\"action\":\"robots\",\"key\":74,\"ctrl\":true,\"alt\":true},{\"action\":\"httpErrorLog\",\"key\":79,\"ctrl\":true,\"alt\":true},{\"action\":\"customReports\",\"key\":67,\"ctrl\":true,\"alt\":true},{\"action\":\"tagConfiguration\",\"key\":78,\"ctrl\":true,\"alt\":true},{\"action\":\"users\",\"key\":85,\"ctrl\":true,\"alt\":true},{\"action\":\"roles\",\"key\":80,\"ctrl\":true,\"alt\":true},{\"action\":\"clearAllCaches\",\"key\":81,\"ctrl\":false,\"alt\":true},{\"action\":\"clearDataCache\",\"key\":67,\"ctrl\":false,\"alt\":true},{\"action\":\"quickSearch\",\"key\":70,\"ctrl\":true,\"shift\":true}]');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_permission_definitions`
--

DROP TABLE IF EXISTS `users_permission_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_permission_definitions` (
  `key` varchar(50) NOT NULL DEFAULT '',
  `category` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_permission_definitions`
--

LOCK TABLES `users_permission_definitions` WRITE;
/*!40000 ALTER TABLE `users_permission_definitions` DISABLE KEYS */;
INSERT INTO `users_permission_definitions` VALUES ('admin_translations',''),('application_logging',''),('asset_metadata',''),('assets',''),('classes',''),('clear_cache',''),('clear_fullpage_cache',''),('clear_temp_files',''),('dashboards',''),('document_types',''),('documents',''),('emails',''),('gdpr_data_extractor',''),('glossary',''),('http_errors',''),('notes_events',''),('notifications',''),('notifications_send',''),('objects',''),('piwik_reports',''),('piwik_settings',''),('plugins',''),('predefined_properties',''),('qr_codes',''),('recyclebin',''),('redirects',''),('reports',''),('reports_config',''),('robots.txt',''),('routes',''),('seemode',''),('seo_document_editor',''),('share_configurations',''),('system_settings',''),('tag_snippet_management',''),('tags_assignment',''),('tags_configuration',''),('tags_search',''),('targeting',''),('thumbnails',''),('translations',''),('users',''),('web2print_settings',''),('website_settings',''),('workflow_details','');
/*!40000 ALTER TABLE `users_permission_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_asset`
--

DROP TABLE IF EXISTS `users_workspaces_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_workspaces_asset` (
  `cid` int unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userId` int NOT NULL DEFAULT '0',
  `list` tinyint(1) DEFAULT '0',
  `view` tinyint(1) DEFAULT '0',
  `publish` tinyint(1) DEFAULT '0',
  `delete` tinyint(1) DEFAULT '0',
  `rename` tinyint(1) DEFAULT '0',
  `create` tinyint(1) DEFAULT '0',
  `settings` tinyint(1) DEFAULT '0',
  `versions` tinyint(1) DEFAULT '0',
  `properties` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`cid`,`userId`),
  UNIQUE KEY `cpath_userId` (`cpath`,`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_asset`
--

LOCK TABLES `users_workspaces_asset` WRITE;
/*!40000 ALTER TABLE `users_workspaces_asset` DISABLE KEYS */;
INSERT INTO `users_workspaces_asset` VALUES (2,'/Digital assets',3,1,1,1,1,1,1,0,0,0),(2,'/Digital assets',5,1,1,1,0,0,0,0,0,0);
/*!40000 ALTER TABLE `users_workspaces_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_document`
--

DROP TABLE IF EXISTS `users_workspaces_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_workspaces_document` (
  `cid` int unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userId` int NOT NULL DEFAULT '0',
  `list` tinyint unsigned DEFAULT '0',
  `view` tinyint unsigned DEFAULT '0',
  `save` tinyint unsigned DEFAULT '0',
  `publish` tinyint unsigned DEFAULT '0',
  `unpublish` tinyint unsigned DEFAULT '0',
  `delete` tinyint unsigned DEFAULT '0',
  `rename` tinyint unsigned DEFAULT '0',
  `create` tinyint unsigned DEFAULT '0',
  `settings` tinyint unsigned DEFAULT '0',
  `versions` tinyint unsigned DEFAULT '0',
  `properties` tinyint unsigned DEFAULT '0',
  PRIMARY KEY (`cid`,`userId`),
  UNIQUE KEY `cpath_userId` (`cpath`,`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_document`
--

LOCK TABLES `users_workspaces_document` WRITE;
/*!40000 ALTER TABLE `users_workspaces_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_workspaces_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_object`
--

DROP TABLE IF EXISTS `users_workspaces_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_workspaces_object` (
  `cid` int unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userId` int NOT NULL DEFAULT '0',
  `list` tinyint unsigned DEFAULT '0',
  `view` tinyint unsigned DEFAULT '0',
  `save` tinyint unsigned DEFAULT '0',
  `publish` tinyint unsigned DEFAULT '0',
  `unpublish` tinyint unsigned DEFAULT '0',
  `delete` tinyint unsigned DEFAULT '0',
  `rename` tinyint unsigned DEFAULT '0',
  `create` tinyint unsigned DEFAULT '0',
  `settings` tinyint unsigned DEFAULT '0',
  `versions` tinyint unsigned DEFAULT '0',
  `properties` tinyint unsigned DEFAULT '0',
  `lEdit` text,
  `lView` text,
  `layouts` text,
  PRIMARY KEY (`cid`,`userId`),
  UNIQUE KEY `cpath_userId` (`cpath`,`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_object`
--

LOCK TABLES `users_workspaces_object` WRITE;
/*!40000 ALTER TABLE `users_workspaces_object` DISABLE KEYS */;
INSERT INTO `users_workspaces_object` VALUES (3,'/category',3,1,1,1,1,1,1,1,1,0,0,0,'','',''),(3,'/category',5,1,1,1,1,0,0,0,0,0,0,0,'','',''),(4,'/product',3,1,1,1,1,1,1,1,1,0,0,0,'','',''),(4,'/product',5,1,1,1,1,0,0,0,0,0,0,0,'','',''),(10,'/brand',3,1,1,1,1,1,1,1,1,0,0,0,'','',''),(10,'/brand',5,1,1,1,1,0,0,0,0,0,0,0,'','','');
/*!40000 ALTER TABLE `users_workspaces_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uuids`
--

DROP TABLE IF EXISTS `uuids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uuids` (
  `uuid` char(36) NOT NULL,
  `itemId` int unsigned NOT NULL,
  `type` varchar(25) NOT NULL,
  `instanceIdentifier` varchar(50) NOT NULL,
  PRIMARY KEY (`uuid`,`itemId`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uuids`
--

LOCK TABLES `uuids` WRITE;
/*!40000 ALTER TABLE `uuids` DISABLE KEYS */;
/*!40000 ALTER TABLE `uuids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cid` int unsigned DEFAULT NULL,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `userId` int unsigned DEFAULT NULL,
  `note` text,
  `stackTrace` text,
  `date` int unsigned DEFAULT NULL,
  `public` tinyint unsigned NOT NULL DEFAULT '0',
  `serialized` tinyint unsigned DEFAULT '0',
  `versionCount` int unsigned NOT NULL DEFAULT '0',
  `binaryFileHash` varchar(128) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `binaryFileId` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype_cid` (`ctype`,`cid`),
  KEY `date` (`date`),
  KEY `binaryFileHash` (`binaryFileHash`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (10,8,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617264289,0,1,1,NULL,NULL),(11,8,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1040): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->updateAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617264304,0,1,2,NULL,NULL),(12,8,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617264380,0,1,3,NULL,NULL),(13,9,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617264399,0,1,1,NULL,NULL),(14,9,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1040): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->updateAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617264435,0,1,2,NULL,NULL),(15,11,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617264547,0,1,1,NULL,NULL),(16,11,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617264554,0,1,2,NULL,NULL),(17,9,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617264719,0,1,3,NULL,NULL),(18,9,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617264776,0,1,4,NULL,NULL),(19,12,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617264936,0,1,1,NULL,NULL),(20,12,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617264942,0,1,2,NULL,NULL),(21,13,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617265057,0,1,1,NULL,NULL),(22,13,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617265068,0,1,2,NULL,NULL),(23,9,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617265177,0,1,5,NULL,NULL),(24,9,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617265192,0,1,6,NULL,NULL),(25,9,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617265462,0,1,7,NULL,NULL),(26,9,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617267385,0,1,8,NULL,NULL),(27,9,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617267455,0,1,9,NULL,NULL),(28,9,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617298906,0,1,10,NULL,NULL),(29,9,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617299147,0,1,11,NULL,NULL),(30,9,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617339120,0,1,12,NULL,NULL),(31,14,'object',2,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617365473,0,1,1,NULL,NULL),(32,14,'object',2,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617365483,0,1,2,NULL,NULL),(33,9,'object',6,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617367307,0,1,13,NULL,NULL),(34,15,'object',2,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617512859,0,1,1,NULL,NULL),(36,15,'object',2,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617513057,0,1,2,NULL,NULL),(37,15,'object',2,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617513076,0,1,3,NULL,NULL),(38,15,'object',2,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617530199,0,1,4,NULL,NULL),(39,15,'object',2,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617530212,0,1,5,NULL,NULL),(40,15,'object',2,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617533856,0,1,6,NULL,NULL),(41,15,'object',2,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617619428,0,1,7,NULL,NULL),(42,17,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617643701,0,1,1,NULL,NULL),(43,6,'asset',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(850): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(537): Pimcore\\Model\\Asset->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(371): Pimcore\\Model\\Asset->save()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(493): Pimcore\\Model\\Asset::create()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(370): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAsset()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAssetCompatibilityAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617643726,0,1,1,'e11b55edaf79cbd636d63a32f8a5cdfca08b36b25b9f73358a236f1d8e248877b989c72fc61de925dee48a01ce6c8c697220b55f02858bfd0228b7bbd75984da',NULL),(44,17,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617643729,0,1,2,NULL,NULL),(45,7,'asset',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(850): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(537): Pimcore\\Model\\Asset->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(371): Pimcore\\Model\\Asset->save()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(493): Pimcore\\Model\\Asset::create()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(370): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAsset()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAssetCompatibilityAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617644652,0,1,1,'9a8896453126dbc0704d84b37d503f8e2a1a5e5ff5b4748ad46753c009d1fed4c538d721d07bbf84e8331c12ac2dc40564c9327711b01817bb63cc94c46b1d8b',NULL),(46,17,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617644653,0,1,3,NULL,NULL),(47,18,'object',0,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/src/AppBundle/Command/ProductCommand.php(153): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Command/Command.php(255): AppBundle\\Command\\ProductCommand->execute()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(1027): Symfony\\Component\\Console\\Command\\Command->run()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Console/Application.php(97): Symfony\\Component\\Console\\Application->doRunCommand()\n#9 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(273): Symfony\\Bundle\\FrameworkBundle\\Console\\Application->doRunCommand()\n#10 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Console/Application.php(83): Symfony\\Component\\Console\\Application->doRun()\n#11 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(149): Symfony\\Bundle\\FrameworkBundle\\Console\\Application->doRun()\n#12 /var/www/html/Electronics-Group-5/bin/console(36): Symfony\\Component\\Console\\Application->run()\n#13 {main}',1617646090,0,1,1,NULL,NULL),(48,8,'asset',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(850): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(537): Pimcore\\Model\\Asset->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(371): Pimcore\\Model\\Asset->save()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(493): Pimcore\\Model\\Asset::create()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(370): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAsset()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAssetCompatibilityAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617646260,0,1,1,'69fcea995c4fd00065525da262209fb80cc3d61fefafbde61cde233572e89ee855236020931d1ba766276bc733089ab7293021c79d0fd1bcc56ad7579ce92d12',NULL),(49,17,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617646263,0,1,4,NULL,NULL),(50,19,'object',0,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/src/AppBundle/Command/ProductCommand.php(154): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Command/Command.php(255): AppBundle\\Command\\ProductCommand->execute()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(1027): Symfony\\Component\\Console\\Command\\Command->run()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Console/Application.php(97): Symfony\\Component\\Console\\Application->doRunCommand()\n#9 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(273): Symfony\\Bundle\\FrameworkBundle\\Console\\Application->doRunCommand()\n#10 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Console/Application.php(83): Symfony\\Component\\Console\\Application->doRun()\n#11 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(149): Symfony\\Bundle\\FrameworkBundle\\Console\\Application->doRun()\n#12 /var/www/html/Electronics-Group-5/bin/console(36): Symfony\\Component\\Console\\Application->run()\n#13 {main}',1617646268,0,1,1,NULL,NULL),(51,2,'document',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(191): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(151): Pimcore\\Model\\Document\\PageSnippet->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document.php(424): Pimcore\\Model\\Document\\PageSnippet->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/Document/DocumentController.php(281): Pimcore\\Model\\Document->save()\n#5 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\Document\\DocumentController->addAction()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#8 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#9 {main}',1617698680,0,1,1,NULL,NULL),(53,2,'document',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(191): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(151): Pimcore\\Model\\Document\\PageSnippet->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document.php(424): Pimcore\\Model\\Document\\PageSnippet->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/Document/PageController.php(184): Pimcore\\Model\\Document->save()\n#5 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\Document\\PageController->saveAction()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#8 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#9 {main}',1617698920,0,1,2,NULL,NULL),(58,23,'object',0,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/app/Resources/views/content/feedback.html.php(137): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Templating/PhpEngine.php(147): require(\'/var/www/html/E...\')\n#7 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/lib/Templating/PhpEngine.php(171): Symfony\\Component\\Templating\\PhpEngine->evaluate()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Templating/PhpEngine.php(76): Pimcore\\Templating\\PhpEngine->evaluate()\n#9 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/lib/Templating/TimedPhpEngine.php(59): Symfony\\Component\\Templating\\PhpEngine->render()\n#10 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Templating/PhpEngine.php(78): Pimcore\\Templating\\TimedPhpEngine->render()\n#11 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Templating/DelegatingEngine.php(55): Symfony\\Bundle\\FrameworkBundle\\Templating\\PhpEngine->renderResponse()\n#12 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/CoreBundle/EventListener/LegacyTemplateListener.php(83): Symfony\\Bundle\\FrameworkBundle\\Templating\\DelegatingEngine->renderResponse()\n#13 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/EventDispatcher/Debug/WrappedListener.php(126): Pimcore\\Bundle\\CoreBundle\\EventListener\\LegacyTemplateListener->onKernelView()\n#14 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/EventDispatcher/EventDispatcher.php(264): Symfony\\Component\\EventDispatcher\\Debug\\WrappedListener->__invoke()\n#15 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/EventDispatcher/EventDispatcher.php(239): Symfony\\Component\\EventDispatcher\\EventDispatcher->doDispatch()\n#16 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/EventDispatcher/EventDispatcher.php(73): Symfony\\Component\\EventDispatcher\\EventDispatcher->callListeners()\n#17 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/EventDispatcher/Debug/TraceableEventDispatcher.php(168): Symfony\\Component\\EventDispatcher\\EventDispatcher->dispatch()\n#18 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(163): Symfony\\Component\\EventDispatcher\\Debug\\TraceableEventDispatcher->dispatch()\n#19 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#20 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#21 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#22 {main}',1617699599,0,1,1,NULL,NULL),(59,24,'object',0,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/app/Resources/views/content/feedback.html.php(137): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Templating/PhpEngine.php(147): require(\'/var/www/html/E...\')\n#7 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/lib/Templating/PhpEngine.php(171): Symfony\\Component\\Templating\\PhpEngine->evaluate()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Templating/PhpEngine.php(76): Pimcore\\Templating\\PhpEngine->evaluate()\n#9 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/lib/Templating/TimedPhpEngine.php(59): Symfony\\Component\\Templating\\PhpEngine->render()\n#10 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Templating/PhpEngine.php(78): Pimcore\\Templating\\TimedPhpEngine->render()\n#11 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Templating/DelegatingEngine.php(55): Symfony\\Bundle\\FrameworkBundle\\Templating\\PhpEngine->renderResponse()\n#12 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/CoreBundle/EventListener/LegacyTemplateListener.php(83): Symfony\\Bundle\\FrameworkBundle\\Templating\\DelegatingEngine->renderResponse()\n#13 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/EventDispatcher/Debug/WrappedListener.php(126): Pimcore\\Bundle\\CoreBundle\\EventListener\\LegacyTemplateListener->onKernelView()\n#14 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/EventDispatcher/EventDispatcher.php(264): Symfony\\Component\\EventDispatcher\\Debug\\WrappedListener->__invoke()\n#15 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/EventDispatcher/EventDispatcher.php(239): Symfony\\Component\\EventDispatcher\\EventDispatcher->doDispatch()\n#16 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/EventDispatcher/EventDispatcher.php(73): Symfony\\Component\\EventDispatcher\\EventDispatcher->callListeners()\n#17 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/EventDispatcher/Debug/TraceableEventDispatcher.php(168): Symfony\\Component\\EventDispatcher\\EventDispatcher->dispatch()\n#18 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(163): Symfony\\Component\\EventDispatcher\\Debug\\TraceableEventDispatcher->dispatch()\n#19 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#20 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#21 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#22 {main}',1617699798,0,1,1,NULL,NULL),(60,25,'object',0,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/app/Resources/views/content/feedback.html.php(137): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Templating/PhpEngine.php(147): require(\'/var/www/html/E...\')\n#7 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/lib/Templating/PhpEngine.php(171): Symfony\\Component\\Templating\\PhpEngine->evaluate()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Templating/PhpEngine.php(76): Pimcore\\Templating\\PhpEngine->evaluate()\n#9 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/lib/Templating/TimedPhpEngine.php(59): Symfony\\Component\\Templating\\PhpEngine->render()\n#10 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Templating/PhpEngine.php(78): Pimcore\\Templating\\TimedPhpEngine->render()\n#11 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Templating/DelegatingEngine.php(55): Symfony\\Bundle\\FrameworkBundle\\Templating\\PhpEngine->renderResponse()\n#12 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/CoreBundle/EventListener/LegacyTemplateListener.php(83): Symfony\\Bundle\\FrameworkBundle\\Templating\\DelegatingEngine->renderResponse()\n#13 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/EventDispatcher/Debug/WrappedListener.php(126): Pimcore\\Bundle\\CoreBundle\\EventListener\\LegacyTemplateListener->onKernelView()\n#14 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/EventDispatcher/EventDispatcher.php(264): Symfony\\Component\\EventDispatcher\\Debug\\WrappedListener->__invoke()\n#15 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/EventDispatcher/EventDispatcher.php(239): Symfony\\Component\\EventDispatcher\\EventDispatcher->doDispatch()\n#16 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/EventDispatcher/EventDispatcher.php(73): Symfony\\Component\\EventDispatcher\\EventDispatcher->callListeners()\n#17 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/EventDispatcher/Debug/TraceableEventDispatcher.php(168): Symfony\\Component\\EventDispatcher\\EventDispatcher->dispatch()\n#18 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(163): Symfony\\Component\\EventDispatcher\\Debug\\TraceableEventDispatcher->dispatch()\n#19 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#20 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#21 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#22 {main}',1617699989,0,1,1,NULL,NULL),(61,4,'document',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(191): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(151): Pimcore\\Model\\Document\\PageSnippet->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document.php(424): Pimcore\\Model\\Document\\PageSnippet->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document.php(332): Pimcore\\Model\\Document->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/Document/DocumentController.php(289): Pimcore\\Model\\Document::create()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\Document\\DocumentController->addAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617700180,0,1,1,NULL,NULL),(62,4,'document',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(191): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/Document/EmailController.php(159): Pimcore\\Model\\Document\\PageSnippet->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\Document\\EmailController->saveAction()\n#4 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#5 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#6 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#7 {main}',1617700197,0,1,2,NULL,NULL),(63,4,'document',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(191): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(151): Pimcore\\Model\\Document\\PageSnippet->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document.php(424): Pimcore\\Model\\Document\\PageSnippet->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/Document/EmailController.php(143): Pimcore\\Model\\Document->save()\n#5 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\Document\\EmailController->saveAction()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#8 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#9 {main}',1617700198,0,1,3,NULL,NULL),(64,4,'document',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(191): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(151): Pimcore\\Model\\Document\\PageSnippet->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document.php(424): Pimcore\\Model\\Document\\PageSnippet->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/Document/EmailController.php(143): Pimcore\\Model\\Document->save()\n#5 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\Document\\EmailController->saveAction()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#8 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#9 {main}',1617700215,0,1,4,NULL,NULL),(65,26,'object',0,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/app/Resources/views/content/feedback.html.php(137): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Templating/PhpEngine.php(147): require(\'/var/www/html/E...\')\n#7 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/lib/Templating/PhpEngine.php(171): Symfony\\Component\\Templating\\PhpEngine->evaluate()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Templating/PhpEngine.php(76): Pimcore\\Templating\\PhpEngine->evaluate()\n#9 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/lib/Templating/TimedPhpEngine.php(59): Symfony\\Component\\Templating\\PhpEngine->render()\n#10 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Templating/PhpEngine.php(78): Pimcore\\Templating\\TimedPhpEngine->render()\n#11 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Templating/DelegatingEngine.php(55): Symfony\\Bundle\\FrameworkBundle\\Templating\\PhpEngine->renderResponse()\n#12 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/CoreBundle/EventListener/LegacyTemplateListener.php(83): Symfony\\Bundle\\FrameworkBundle\\Templating\\DelegatingEngine->renderResponse()\n#13 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/EventDispatcher/Debug/WrappedListener.php(126): Pimcore\\Bundle\\CoreBundle\\EventListener\\LegacyTemplateListener->onKernelView()\n#14 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/EventDispatcher/EventDispatcher.php(264): Symfony\\Component\\EventDispatcher\\Debug\\WrappedListener->__invoke()\n#15 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/EventDispatcher/EventDispatcher.php(239): Symfony\\Component\\EventDispatcher\\EventDispatcher->doDispatch()\n#16 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/EventDispatcher/EventDispatcher.php(73): Symfony\\Component\\EventDispatcher\\EventDispatcher->callListeners()\n#17 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/EventDispatcher/Debug/TraceableEventDispatcher.php(168): Symfony\\Component\\EventDispatcher\\EventDispatcher->dispatch()\n#18 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(163): Symfony\\Component\\EventDispatcher\\Debug\\TraceableEventDispatcher->dispatch()\n#19 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#20 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#21 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#22 {main}',1617700245,0,1,1,NULL,NULL),(66,5,'document',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(191): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(151): Pimcore\\Model\\Document\\PageSnippet->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document.php(424): Pimcore\\Model\\Document\\PageSnippet->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document.php(332): Pimcore\\Model\\Document->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/Document/DocumentController.php(289): Pimcore\\Model\\Document::create()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\Document\\DocumentController->addAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617700338,0,1,1,NULL,NULL),(67,5,'document',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(191): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(151): Pimcore\\Model\\Document\\PageSnippet->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document.php(424): Pimcore\\Model\\Document\\PageSnippet->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/Document/EmailController.php(143): Pimcore\\Model\\Document->save()\n#5 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\Document\\EmailController->saveAction()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#8 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#9 {main}',1617700422,0,1,2,NULL,NULL),(68,9,'asset',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(850): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(537): Pimcore\\Model\\Asset->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(371): Pimcore\\Model\\Asset->save()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(493): Pimcore\\Model\\Asset::create()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(370): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAsset()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAssetCompatibilityAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617700788,0,1,1,'66f5160966079686bf0d72a0aacebf406d34d66bf7eff0e9bc56e42fe81da65d3092e77d860655df82b636852071dc2fef181b74b448169b325ff1837d4bf372',NULL),(69,17,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617700789,0,1,5,NULL,NULL),(72,5,'document',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(191): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(151): Pimcore\\Model\\Document\\PageSnippet->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document.php(424): Pimcore\\Model\\Document\\PageSnippet->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/Document/EmailController.php(143): Pimcore\\Model\\Document->save()\n#5 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\Document\\EmailController->saveAction()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#8 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#9 {main}',1617700905,0,1,3,NULL,NULL),(73,5,'document',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(191): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(151): Pimcore\\Model\\Document\\PageSnippet->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document.php(424): Pimcore\\Model\\Document\\PageSnippet->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/Document/EmailController.php(143): Pimcore\\Model\\Document->save()\n#5 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\Document\\EmailController->saveAction()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#8 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#9 {main}',1617700961,0,1,4,NULL,NULL),(74,29,'object',0,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/src/AppBundle/Command/ProductCommand.php(154): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Command/Command.php(255): AppBundle\\Command\\ProductCommand->execute()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(1027): Symfony\\Component\\Console\\Command\\Command->run()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Console/Application.php(97): Symfony\\Component\\Console\\Application->doRunCommand()\n#9 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(273): Symfony\\Bundle\\FrameworkBundle\\Console\\Application->doRunCommand()\n#10 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Console/Application.php(83): Symfony\\Component\\Console\\Application->doRun()\n#11 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(149): Symfony\\Bundle\\FrameworkBundle\\Console\\Application->doRun()\n#12 /var/www/html/Electronics-Group-5/bin/console(36): Symfony\\Component\\Console\\Application->run()\n#13 {main}',1617700982,0,1,1,NULL,NULL),(75,5,'document',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(191): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(151): Pimcore\\Model\\Document\\PageSnippet->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document.php(424): Pimcore\\Model\\Document\\PageSnippet->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/Document/EmailController.php(143): Pimcore\\Model\\Document->save()\n#5 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\Document\\EmailController->saveAction()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#8 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#9 {main}',1617701032,0,1,5,NULL,NULL),(76,4,'document',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(191): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document/PageSnippet.php(151): Pimcore\\Model\\Document\\PageSnippet->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Document.php(424): Pimcore\\Model\\Document\\PageSnippet->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/Document/EmailController.php(143): Pimcore\\Model\\Document->save()\n#5 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\Document\\EmailController->saveAction()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#8 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#9 {main}',1617701039,0,1,5,NULL,NULL),(77,10,'asset',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(850): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(537): Pimcore\\Model\\Asset->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(371): Pimcore\\Model\\Asset->save()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(493): Pimcore\\Model\\Asset::create()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(370): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAsset()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAssetCompatibilityAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617729061,0,1,1,'86b6e3f1039403a13884dcccbbbcd190e99d3c31d741d1c680b791a455a89adb6d4f758938c6a1bf1ccdd69dadd8ab3eb5a8001018f6b5fc165f48eb2c402be6',NULL),(78,17,'object',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617729063,0,1,6,NULL,NULL),(81,17,'object',0,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/src/AppBundle/Command/ProductCommand.php(176): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Command/Command.php(255): AppBundle\\Command\\ProductCommand->execute()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(1027): Symfony\\Component\\Console\\Command\\Command->run()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Console/Application.php(97): Symfony\\Component\\Console\\Application->doRunCommand()\n#9 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(273): Symfony\\Bundle\\FrameworkBundle\\Console\\Application->doRunCommand()\n#10 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Console/Application.php(83): Symfony\\Component\\Console\\Application->doRun()\n#11 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(149): Symfony\\Bundle\\FrameworkBundle\\Console\\Application->doRun()\n#12 /var/www/html/Electronics-Group-5/bin/console(36): Symfony\\Component\\Console\\Application->run()\n#13 {main}',1617729128,0,1,7,NULL,NULL),(82,33,'object',0,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/src/AppBundle/Command/ProductCommand.php(154): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Command/Command.php(255): AppBundle\\Command\\ProductCommand->execute()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(1027): Symfony\\Component\\Console\\Command\\Command->run()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Console/Application.php(97): Symfony\\Component\\Console\\Application->doRunCommand()\n#9 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(273): Symfony\\Bundle\\FrameworkBundle\\Console\\Application->doRunCommand()\n#10 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Console/Application.php(83): Symfony\\Component\\Console\\Application->doRun()\n#11 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(149): Symfony\\Bundle\\FrameworkBundle\\Console\\Application->doRun()\n#12 /var/www/html/Electronics-Group-5/bin/console(36): Symfony\\Component\\Console\\Application->run()\n#13 {main}',1617729365,0,1,1,NULL,NULL),(83,34,'object',0,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/src/AppBundle/Command/ProductCommand.php(169): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Command/Command.php(255): AppBundle\\Command\\ProductCommand->execute()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(1027): Symfony\\Component\\Console\\Command\\Command->run()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Console/Application.php(97): Symfony\\Component\\Console\\Application->doRunCommand()\n#9 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(273): Symfony\\Bundle\\FrameworkBundle\\Console\\Application->doRunCommand()\n#10 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Console/Application.php(83): Symfony\\Component\\Console\\Application->doRun()\n#11 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(149): Symfony\\Bundle\\FrameworkBundle\\Console\\Application->doRun()\n#12 /var/www/html/Electronics-Group-5/bin/console(36): Symfony\\Component\\Console\\Application->run()\n#13 {main}',1617729365,0,1,1,NULL,NULL),(84,17,'object',0,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Electronics-Group-5/src/AppBundle/Command/ProductCommand.php(176): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Command/Command.php(255): AppBundle\\Command\\ProductCommand->execute()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(1027): Symfony\\Component\\Console\\Command\\Command->run()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Console/Application.php(97): Symfony\\Component\\Console\\Application->doRunCommand()\n#9 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(273): Symfony\\Bundle\\FrameworkBundle\\Console\\Application->doRunCommand()\n#10 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Console/Application.php(83): Symfony\\Component\\Console\\Application->doRun()\n#11 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(149): Symfony\\Bundle\\FrameworkBundle\\Console\\Application->doRun()\n#12 /var/www/html/Electronics-Group-5/bin/console(36): Symfony\\Component\\Console\\Application->run()\n#13 {main}',1617729366,0,1,8,NULL,NULL),(89,15,'asset',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(850): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(537): Pimcore\\Model\\Asset->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(371): Pimcore\\Model\\Asset->save()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(493): Pimcore\\Model\\Asset::create()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(370): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAsset()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAssetCompatibilityAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617730088,0,1,1,'9bb253b358fa7f100ac44f669341a6e7b97ca3c6cf4083b1f5cb3dddd871133e2f58d3aa8bd89990dd30337fcf2985d1b2d5c2ff41ffc8a09aaa741f1eacc0a1',NULL),(94,19,'asset',2,'','#0 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(850): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(537): Pimcore\\Model\\Asset->saveVersion()\n#3 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/models/Asset.php(371): Pimcore\\Model\\Asset->save()\n#4 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(493): Pimcore\\Model\\Asset::create()\n#5 /var/www/html/Electronics-Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(335): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAsset()\n#6 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAssetAction()\n#7 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Electronics-Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Electronics-Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617769316,0,1,1,'9efa385258c9314fb3cfe9e94ee6c76519ed5c4f2c1498c60345e312bfed866de1f4691070acdc60b83f1e95b71427a4a9efc06fa6b91a19b4a1d7d0654d5477',NULL),(95,20,'asset',2,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Asset.php(850): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Asset.php(537): Pimcore\\Model\\Asset->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Asset.php(371): Pimcore\\Model\\Asset->save()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(493): Pimcore\\Model\\Asset::create()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(335): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAsset()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAssetAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617790140,0,1,1,'8116ff126e3dd045ade26709ebff77d9779ecfffa5071223304a56d0e7807a012e4c1353f991c2e72ea73ebb11ac210369452b4e135e5073e95bc46b500d4616',NULL),(96,22,'asset',2,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Asset.php(850): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Asset.php(537): Pimcore\\Model\\Asset->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Asset.php(371): Pimcore\\Model\\Asset->save()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(493): Pimcore\\Model\\Asset::create()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(335): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAsset()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAssetAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617790615,0,1,1,'4c5b96904ea28f32d4b722b2b28ab9adede0ead5eeb2237d9738e0bfc1c15da0c2eb7ef9291e681db880e32e276d11be50334fe842b18eeff245a85291969435',NULL),(97,23,'asset',2,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Asset.php(850): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Asset.php(537): Pimcore\\Model\\Asset->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Asset.php(371): Pimcore\\Model\\Asset->save()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(493): Pimcore\\Model\\Asset::create()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(370): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAsset()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAssetCompatibilityAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617790669,0,1,1,'928c11c7804944ba8641c0bfce93523f997f968e7f4f0501ef955766fdacd5c39fe507b23cc3a6cd4bf8d7d9ff1c43cd72f2a4e08d1e113196581f952f224db5',NULL),(98,17,'object',2,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617790673,0,1,9,NULL,NULL),(99,35,'object',0,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Group-5/src/AppBundle/Command/ProductCommand.php(154): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Command/Command.php(255): AppBundle\\Command\\ProductCommand->execute()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(1027): Symfony\\Component\\Console\\Command\\Command->run()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Console/Application.php(97): Symfony\\Component\\Console\\Application->doRunCommand()\n#9 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(273): Symfony\\Bundle\\FrameworkBundle\\Console\\Application->doRunCommand()\n#10 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Console/Application.php(83): Symfony\\Component\\Console\\Application->doRun()\n#11 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(149): Symfony\\Bundle\\FrameworkBundle\\Console\\Application->doRun()\n#12 /var/www/html/Group-5/bin/console(36): Symfony\\Component\\Console\\Application->run()\n#13 {main}',1617790797,0,1,1,NULL,NULL),(100,36,'object',0,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Group-5/src/AppBundle/Command/ProductCommand.php(169): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Command/Command.php(255): AppBundle\\Command\\ProductCommand->execute()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(1027): Symfony\\Component\\Console\\Command\\Command->run()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Console/Application.php(97): Symfony\\Component\\Console\\Application->doRunCommand()\n#9 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(273): Symfony\\Bundle\\FrameworkBundle\\Console\\Application->doRunCommand()\n#10 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Console/Application.php(83): Symfony\\Component\\Console\\Application->doRun()\n#11 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(149): Symfony\\Bundle\\FrameworkBundle\\Console\\Application->doRun()\n#12 /var/www/html/Group-5/bin/console(36): Symfony\\Component\\Console\\Application->run()\n#13 {main}',1617790797,0,1,1,NULL,NULL),(101,17,'object',0,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Group-5/src/AppBundle/Command/ProductCommand.php(176): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Command/Command.php(255): AppBundle\\Command\\ProductCommand->execute()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(1027): Symfony\\Component\\Console\\Command\\Command->run()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Console/Application.php(97): Symfony\\Component\\Console\\Application->doRunCommand()\n#9 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(273): Symfony\\Bundle\\FrameworkBundle\\Console\\Application->doRunCommand()\n#10 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Bundle/FrameworkBundle/Console/Application.php(83): Symfony\\Component\\Console\\Application->doRun()\n#11 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/Console/Application.php(149): Symfony\\Bundle\\FrameworkBundle\\Console\\Application->doRun()\n#12 /var/www/html/Group-5/bin/console(36): Symfony\\Component\\Console\\Application->run()\n#13 {main}',1617790798,0,1,10,NULL,NULL),(102,37,'object',2,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617812542,0,1,1,NULL,NULL),(103,38,'object',2,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617812566,0,1,1,NULL,NULL),(104,38,'object',2,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617812574,0,1,2,NULL,NULL),(105,39,'object',2,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617812633,0,1,1,NULL,NULL),(106,39,'object',2,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617812647,0,1,2,NULL,NULL),(107,24,'asset',2,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Asset.php(850): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Asset.php(537): Pimcore\\Model\\Asset->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Asset.php(371): Pimcore\\Model\\Asset->save()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(493): Pimcore\\Model\\Asset::create()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(370): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAsset()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAssetCompatibilityAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617812702,0,1,1,'4a20fd40d0279024388b293349d0f3aa43677406b211840942d204bac6a79ebe7f28c1ac1c5662059e958b7535640a61440acb04c86273cc1f39d88d432c54a9',NULL),(108,37,'object',2,'','#0 /var/www/html/Group-5/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/Group-5/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/Group-5/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/Group-5/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/Group-5/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1617812723,0,1,2,NULL,NULL);
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `object_brand`
--

/*!50001 DROP VIEW IF EXISTS `object_brand`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`prachi`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `object_brand` AS select `object_query_brand`.`oo_id` AS `oo_id`,`object_query_brand`.`oo_classId` AS `oo_classId`,`object_query_brand`.`oo_className` AS `oo_className`,`object_query_brand`.`name` AS `name`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className`,`objects`.`o_childrenSortBy` AS `o_childrenSortBy`,`objects`.`o_childrenSortOrder` AS `o_childrenSortOrder`,`objects`.`o_versionCount` AS `o_versionCount` from (`object_query_brand` join `objects` on((`objects`.`o_id` = `object_query_brand`.`oo_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `object_category`
--

/*!50001 DROP VIEW IF EXISTS `object_category`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`prachi`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `object_category` AS select `object_query_category`.`oo_id` AS `oo_id`,`object_query_category`.`oo_classId` AS `oo_classId`,`object_query_category`.`oo_className` AS `oo_className`,`object_query_category`.`name` AS `name`,`object_query_category`.`description` AS `description`,`object_query_category`.`image` AS `image`,`object_query_category`.`active` AS `active`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className`,`objects`.`o_childrenSortBy` AS `o_childrenSortBy`,`objects`.`o_childrenSortOrder` AS `o_childrenSortOrder`,`objects`.`o_versionCount` AS `o_versionCount` from (`object_query_category` join `objects` on((`objects`.`o_id` = `object_query_category`.`oo_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `object_feedback`
--

/*!50001 DROP VIEW IF EXISTS `object_feedback`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`prachi`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `object_feedback` AS select `object_query_feedback`.`oo_id` AS `oo_id`,`object_query_feedback`.`oo_classId` AS `oo_classId`,`object_query_feedback`.`oo_className` AS `oo_className`,`object_query_feedback`.`firstname` AS `firstname`,`object_query_feedback`.`lastname` AS `lastname`,`object_query_feedback`.`email` AS `email`,`object_query_feedback`.`comment` AS `comment`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className`,`objects`.`o_childrenSortBy` AS `o_childrenSortBy`,`objects`.`o_childrenSortOrder` AS `o_childrenSortOrder`,`objects`.`o_versionCount` AS `o_versionCount` from (`object_query_feedback` join `objects` on((`objects`.`o_id` = `object_query_feedback`.`oo_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `object_import`
--

/*!50001 DROP VIEW IF EXISTS `object_import`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`prachi`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `object_import` AS select `object_query_import`.`oo_id` AS `oo_id`,`object_query_import`.`oo_classId` AS `oo_classId`,`object_query_import`.`oo_className` AS `oo_className`,`object_query_import`.`name` AS `name`,`object_query_import`.`file__id` AS `file__id`,`object_query_import`.`file__type` AS `file__type`,`object_query_import`.`status` AS `status`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className`,`objects`.`o_childrenSortBy` AS `o_childrenSortBy`,`objects`.`o_childrenSortOrder` AS `o_childrenSortOrder`,`objects`.`o_versionCount` AS `o_versionCount` from (`object_query_import` join `objects` on((`objects`.`o_id` = `object_query_import`.`oo_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `object_log`
--

/*!50001 DROP VIEW IF EXISTS `object_log`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`prachi`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `object_log` AS select `object_query_log`.`oo_id` AS `oo_id`,`object_query_log`.`oo_classId` AS `oo_classId`,`object_query_log`.`oo_className` AS `oo_className`,`object_query_log`.`message` AS `message`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className`,`objects`.`o_childrenSortBy` AS `o_childrenSortBy`,`objects`.`o_childrenSortOrder` AS `o_childrenSortOrder`,`objects`.`o_versionCount` AS `o_versionCount` from (`object_query_log` join `objects` on((`objects`.`o_id` = `object_query_log`.`oo_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `object_product`
--

/*!50001 DROP VIEW IF EXISTS `object_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`prachi`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `object_product` AS select `object_query_product`.`oo_id` AS `oo_id`,`object_query_product`.`oo_classId` AS `oo_classId`,`object_query_product`.`oo_className` AS `oo_className`,`object_query_product`.`brand` AS `brand`,`object_query_product`.`modelNo` AS `modelNo`,`object_query_product`.`name` AS `name`,`object_query_product`.`category__id` AS `category__id`,`object_query_product`.`category__type` AS `category__type`,`object_query_product`.`price__value` AS `price__value`,`object_query_product`.`price__unit` AS `price__unit`,`object_query_product`.`quantityInStock` AS `quantityInStock`,`object_query_product`.`colour__rgb` AS `colour__rgb`,`object_query_product`.`colour__a` AS `colour__a`,`object_query_product`.`image` AS `image`,`object_query_product`.`weight__value` AS `weight__value`,`object_query_product`.`weight__unit` AS `weight__unit`,`object_query_product`.`ratings` AS `ratings`,`object_query_product`.`voltage__value` AS `voltage__value`,`object_query_product`.`voltage__unit` AS `voltage__unit`,`object_query_product`.`wattage__value` AS `wattage__value`,`object_query_product`.`wattage__unit` AS `wattage__unit`,`object_query_product`.`launchDate` AS `launchDate`,`object_query_product`.`description` AS `description`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className`,`objects`.`o_childrenSortBy` AS `o_childrenSortBy`,`objects`.`o_childrenSortOrder` AS `o_childrenSortOrder`,`objects`.`o_versionCount` AS `o_versionCount` from (`object_query_product` join `objects` on((`objects`.`o_id` = `object_query_product`.`oo_id`))) */;
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

-- Dump completed on 2021-04-07 21:58:08
