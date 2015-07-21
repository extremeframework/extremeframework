-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: extremeframework-git
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `ACCESS_RIGHT`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `ACCESS_RIGHT` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_USER_GROUP` int(11) DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIONS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE` (`ID_USER_GROUP`,`MODULE`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCESS_RIGHT`
--

/*!40000 ALTER TABLE `ACCESS_RIGHT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACCESS_RIGHT` ENABLE KEYS */;

--
-- Table structure for table `ACL_TYPE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `ACL_TYPE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORDERING` tinyint(2) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACL_TYPE`
--

/*!40000 ALTER TABLE `ACL_TYPE` DISABLE KEYS */;
INSERT IGNORE INTO `ACL_TYPE` (`ID`, `REFID`, `NAME`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (1,'ACT0000000001','Include',1,1,NULL,0,NULL,'06acd842-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `ACL_TYPE` (`ID`, `REFID`, `NAME`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (2,'ACT0000000002','Exclude',3,1,NULL,0,NULL,'06acdc2a-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `ACL_TYPE` (`ID`, `REFID`, `NAME`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (3,'ACT0000000003','Forced Include',2,1,NULL,0,NULL,'06acdd89-1a1a-11e5-b2f8-cc52af77857f');
/*!40000 ALTER TABLE `ACL_TYPE` ENABLE KEYS */;

--
-- Table structure for table `ADMIN_FILTER`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `ADMIN_FILTER` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMNS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_DEFAULT` tinyint(1) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UDID` int(11) DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE` (`MODULE`,`COLUMNS`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_MODULE` (`MODULE`),
  KEY `IDX_COLUMNS` (`COLUMNS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_FILTER`
--

/*!40000 ALTER TABLE `ADMIN_FILTER` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_FILTER` ENABLE KEYS */;

--
-- Table structure for table `ADMIN_FILTER_CONDITION`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `ADMIN_FILTER_CONDITION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_ADMIN_FILTER` int(11) DEFAULT NULL,
  `ID_FIELD` int(11) DEFAULT NULL,
  `ID_VALUE_OPERATOR` int(11) DEFAULT NULL,
  `VALUE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_CONDITION_OPERATOR` int(11) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_ID_ADMIN_FILTER` (`ID_ADMIN_FILTER`),
  KEY `IDX_ID_FIELD` (`ID_FIELD`),
  KEY `IDX_ID_VALUE_OPERATOR` (`ID_VALUE_OPERATOR`),
  KEY `IDX_ID_CONDITION_OPERATOR` (`ID_CONDITION_OPERATOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_FILTER_CONDITION`
--

/*!40000 ALTER TABLE `ADMIN_FILTER_CONDITION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_FILTER_CONDITION` ENABLE KEYS */;

--
-- Table structure for table `ADMIN_LABEL`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `ADMIN_LABEL` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LABEL` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE` (`LABEL`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_LABEL`
--

/*!40000 ALTER TABLE `ADMIN_LABEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_LABEL` ENABLE KEYS */;

--
-- Table structure for table `ADMIN_LANGUAGE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `ADMIN_LANGUAGE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uniquekey` (`CODE`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_LANGUAGE`
--

/*!40000 ALTER TABLE `ADMIN_LANGUAGE` DISABLE KEYS */;
INSERT IGNORE INTO `ADMIN_LANGUAGE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (1,'ADN0000000001','English','en',1,NULL,0,NULL,'083bef04-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `ADMIN_LANGUAGE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (2,'ADN0000000002','Tiếng Việt','vi',1,NULL,0,NULL,'083bf217-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `ADMIN_LANGUAGE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (3,'ADN0000000003','Francais','fr',1,NULL,0,NULL,'083bf31c-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `ADMIN_LANGUAGE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (4,'ADN0000000004','中国','zh-CN',1,NULL,0,NULL,'083bf3e5-1a1a-11e5-b2f8-cc52af77857f');
/*!40000 ALTER TABLE `ADMIN_LANGUAGE` ENABLE KEYS */;

--
-- Table structure for table `ADMIN_LANGUAGE_ITEM`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `ADMIN_LANGUAGE_ITEM` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_ADMIN_LANGUAGE` int(11) DEFAULT NULL,
  `ID_ADMIN_LABEL` int(11) DEFAULT NULL,
  `TRANSLATION` text COLLATE utf8_unicode_ci,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE` (`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_LANGUAGE_ITEM`
--

/*!40000 ALTER TABLE `ADMIN_LANGUAGE_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_LANGUAGE_ITEM` ENABLE KEYS */;

--
-- Table structure for table `ADMIN_MENU`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `ADMIN_MENU` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORDERING` tinyint(2) DEFAULT NULL,
  `IS_ENABLED` tinyint(1) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_MENU`
--

/*!40000 ALTER TABLE `ADMIN_MENU` DISABLE KEYS */;
INSERT IGNORE INTO `ADMIN_MENU` (`ID`, `REFID`, `NAME`, `ORDERING`, `IS_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (1,'ADM0000000001','Admin Menu',1,1,1,'{\"ADMIN_MENU_ITEM\":[{\"ID\":\"1\",\"REFID\":\"AMI0000000001\",\"NAME\":\"Dashboard\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"index\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-linkedin\",\"ENABLE_LEFT\":\"1\",\"ENABLE_TOP\":null,\"ENABLE_QUICK\":null,\"ENABLE_ALL\":null,\"ENABLE_SETTINGS\":null,\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"0\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"0880f761-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"2\",\"REFID\":\"AMI0000000002\",\"NAME\":\"Admin\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminmenu\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-bullhorn\",\"ENABLE_LEFT\":\"1\",\"ENABLE_TOP\":null,\"ENABLE_QUICK\":null,\"ENABLE_ALL\":null,\"ENABLE_SETTINGS\":null,\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"11\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"0880fb79-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"5\",\"REFID\":\"AMI0000000003\",\"NAME\":\"Toolbox\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"2\",\"MODULE\":\"toolbox\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-moon-o\",\"ENABLE_LEFT\":\"1\",\"ENABLE_TOP\":null,\"ENABLE_QUICK\":null,\"ENABLE_ALL\":null,\"ENABLE_SETTINGS\":null,\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"13\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"0880fd1d-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-2-\",\"N\":119},{\"ID\":\"6\",\"REFID\":\"AMI0000000004\",\"NAME\":\"Template\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"2\",\"MODULE\":\"template\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-paypal\",\"ENABLE_LEFT\":\"1\",\"ENABLE_TOP\":null,\"ENABLE_QUICK\":null,\"ENABLE_ALL\":null,\"ENABLE_SETTINGS\":null,\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"14\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"0880fe9d-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-2-\",\"N\":119},{\"ID\":\"8\",\"REFID\":\"AMI0000000005\",\"NAME\":\"Access Right\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"accessright\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-leaf\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":null,\"ENABLE_QUICK\":null,\"ENABLE_ALL\":null,\"ENABLE_SETTINGS\":null,\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"19\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"0881001a-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"9\",\"REFID\":\"AMI0000000006\",\"NAME\":\"Report Builder\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"reportbuilder\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-italic\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":null,\"ENABLE_QUICK\":null,\"ENABLE_ALL\":null,\"ENABLE_SETTINGS\":null,\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"18\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"088101a4-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"10\",\"REFID\":\"AMI0000000007\",\"NAME\":\"Users\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"user\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-building\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"1\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f415386-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"11\",\"REFID\":\"AMI0000000008\",\"NAME\":\"Fields\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"field\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-chevron-down\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f417007-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"12\",\"REFID\":\"AMI0000000009\",\"NAME\":\"Options\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"option\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-code\",\"ENABLE_LEFT\":\"1\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f4192e2-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"13\",\"REFID\":\"AMI0000000010\",\"NAME\":\"User Logs\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"userlog\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-ioxhost\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f41bad1-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"14\",\"REFID\":\"AMI0000000011\",\"NAME\":\"Acl Types\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"acltype\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-exclamation-circle\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f41e118-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"15\",\"REFID\":\"AMI0000000012\",\"NAME\":\"User Roles\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"userrole\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-expand\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f4201db-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"16\",\"REFID\":\"AMI0000000013\",\"NAME\":\"Parameters\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"parameter\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-trash-o\",\"ENABLE_LEFT\":\"1\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"1\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f421888-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"17\",\"REFID\":\"AMI0000000014\",\"NAME\":\"Dashboards\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"dashboard\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-star-half\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f423321-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"18\",\"REFID\":\"AMI0000000015\",\"NAME\":\"Field Acls\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"fieldacl\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-anchor\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f424adb-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"19\",\"REFID\":\"AMI0000000016\",\"NAME\":\"Change Logs\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"changelog\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-font\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f426501-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"20\",\"REFID\":\"AMI0000000017\",\"NAME\":\"User Groups\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"usergroup\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-smile-o\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f42883e-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"21\",\"REFID\":\"AMI0000000018\",\"NAME\":\"Object Acls\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"objectacl\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-university\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f42b068-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"22\",\"REFID\":\"AMI0000000019\",\"NAME\":\"Admin Views\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminview\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-caret-up\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f43111d-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"23\",\"REFID\":\"AMI0000000020\",\"NAME\":\"Admin Labels\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminlabel\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-list-alt\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f434406-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"24\",\"REFID\":\"AMI0000000021\",\"NAME\":\"Recycle Bins\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"recyclebin\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-vk\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f43735b-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"25\",\"REFID\":\"AMI0000000022\",\"NAME\":\"Admin Modules\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminmodule\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-volume-off\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f43aca2-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"26\",\"REFID\":\"AMI0000000023\",\"NAME\":\"Admin Languages\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminlanguage\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-linkedin-square\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"1\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f43c5fa-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"27\",\"REFID\":\"AMI0000000024\",\"NAME\":\"Parameter Types\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"parametertype\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-jsfiddle\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f43dfa9-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"28\",\"REFID\":\"AMI0000000025\",\"NAME\":\"User Memberships\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"usermembership\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-caret-square-o-up\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f43f7eb-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"29\",\"REFID\":\"AMI0000000026\",\"NAME\":\"User Preferences\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"userpreference\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-css3\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f441047-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"30\",\"REFID\":\"AMI0000000027\",\"NAME\":\"Parameter Groups\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"parametergroup\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-folder\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f4429fe-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"31\",\"REFID\":\"AMI0000000028\",\"NAME\":\"Admin Menu Items\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminmenuitem\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-money\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"1\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f444289-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"32\",\"REFID\":\"AMI0000000029\",\"NAME\":\"Admin Language Items\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminlanguageitem\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-linkedin\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9f445b9e-1a1a-11e5-b2f8-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"33\",\"REFID\":\"AMI0000000030\",\"NAME\":\"Screens\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"screen\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-trello\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"d3cb8e3b-1a1b-11e5-aee6-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"34\",\"REFID\":\"AMI0000000031\",\"NAME\":\"Workflows\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"workflow\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-reply-all\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"d3cbdf9a-1a1b-11e5-aee6-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"35\",\"REFID\":\"AMI0000000032\",\"NAME\":\"Value Types\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"valuetype\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-spinner\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"d3cc6488-1a1b-11e5-aee6-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"36\",\"REFID\":\"AMI0000000033\",\"NAME\":\"Admin Filters\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminfilter\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-print\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"d3cd0d26-1a1b-11e5-aee6-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"37\",\"REFID\":\"AMI0000000034\",\"NAME\":\"Screen Fields\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"screenfield\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-crop\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"d3cd31ce-1a1b-11e5-aee6-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"38\",\"REFID\":\"AMI0000000035\",\"NAME\":\"Workflow Logs\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"workflowlog\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-quote-left\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"d3cd7821-1a1b-11e5-aee6-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"39\",\"REFID\":\"AMI0000000036\",\"NAME\":\"Workflow Stages\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"workflowstage\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-tags\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"d3cda755-1a1b-11e5-aee6-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"40\",\"REFID\":\"AMI0000000037\",\"NAME\":\"Admin Layout Fields\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminlayoutfield\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-header\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"d3ce1e69-1a1b-11e5-aee6-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"41\",\"REFID\":\"AMI0000000038\",\"NAME\":\"Workflow Transitions\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"workflowtransition\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-paint-brush\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"d3ce39cb-1a1b-11e5-aee6-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"42\",\"REFID\":\"AMI0000000039\",\"NAME\":\"Workflow Applications\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"workflowapplication\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-comment\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"d3ce6082-1a1b-11e5-aee6-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"43\",\"REFID\":\"AMI0000000040\",\"NAME\":\"Admin Layout Sections\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminlayoutsection\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-moon-o\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"d3ce77d0-1a1b-11e5-aee6-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"44\",\"REFID\":\"AMI0000000041\",\"NAME\":\"Admin Sequences\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminsequence\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-upload\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"a736e018-1a1c-11e5-aee6-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"45\",\"REFID\":\"AMI0000000042\",\"NAME\":\"Pages\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"page\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-file-audio-o\",\"ENABLE_LEFT\":\"1\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"01a0cd46-1baa-11e5-a175-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"46\",\"REFID\":\"AMI0000000043\",\"NAME\":\"Menus\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"menu\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-plus-square\",\"ENABLE_LEFT\":\"1\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"01a0f3d6-1baa-11e5-a175-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"47\",\"REFID\":\"AMI0000000044\",\"NAME\":\"Posts\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"post\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-cube\",\"ENABLE_LEFT\":\"1\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"01a1144d-1baa-11e5-a175-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"48\",\"REFID\":\"AMI0000000045\",\"NAME\":\"Menu Items\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"menuitem\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-taxi\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"01a1f547-1baa-11e5-a175-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"49\",\"REFID\":\"AMI0000000046\",\"NAME\":\"Post Types\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"posttype\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-file-code-o\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"01a26a5a-1baa-11e5-a175-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"50\",\"REFID\":\"AMI0000000047\",\"NAME\":\"Page Links\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"pagelink\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-wifi\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"01a29940-1baa-11e5-a175-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"51\",\"REFID\":\"AMI0000000048\",\"NAME\":\"Widget Types\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"widgettype\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-italic\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"01a8ce48-1baa-11e5-a175-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"52\",\"REFID\":\"AMI0000000049\",\"NAME\":\"Page Widgets\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"pagewidget\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-github-square\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"01a91fda-1baa-11e5-a175-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"53\",\"REFID\":\"AMI0000000050\",\"NAME\":\"Page Galleries\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"pagegallery\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-trash\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"01a9a611-1baa-11e5-a175-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"54\",\"REFID\":\"AMI0000000051\",\"NAME\":\"Post Sections\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"postsection\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-users\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"01a9d298-1baa-11e5-a175-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"55\",\"REFID\":\"AMI0000000052\",\"NAME\":\"Page Sections\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"pagesection\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-plus-square-o\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"01aa3215-1baa-11e5-a175-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"56\",\"REFID\":\"AMI0000000053\",\"NAME\":\"Post Categories\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"postcategory\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-sitemap\",\"ENABLE_LEFT\":\"1\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"01aa857d-1baa-11e5-a175-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"57\",\"REFID\":\"AMI0000000054\",\"NAME\":\"Widget Positions\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"widgetposition\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-chevron-left\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"01ab7dac-1baa-11e5-a175-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"58\",\"REFID\":\"AMI0000000055\",\"NAME\":\"Post Galleries\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"postgallery\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-inr\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"93436fad-1bbc-11e5-ac15-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"59\",\"REFID\":\"AMI0000000056\",\"NAME\":\"Post Relations\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"postrelation\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-outdent\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9343c2da-1bbc-11e5-ac15-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"60\",\"REFID\":\"AMI0000000057\",\"NAME\":\"Page Link Types\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"pagelinktype\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-signal\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9343eefa-1bbc-11e5-ac15-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"61\",\"REFID\":\"AMI0000000058\",\"NAME\":\"Post Relation Types\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"postrelationtype\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-stack-exchange\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"9344622a-1bbc-11e5-ac15-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"62\",\"REFID\":\"AMI0000000059\",\"NAME\":\"Admin Orders\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorder\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-th\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"2847d5ed-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"63\",\"REFID\":\"AMI0000000060\",\"NAME\":\"Payment Types\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"paymenttype\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-joomla\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"284859e7-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"64\",\"REFID\":\"AMI0000000061\",\"NAME\":\"Admin Products\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminproduct\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-vimeo-square\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"2848efd2-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"65\",\"REFID\":\"AMI0000000062\",\"NAME\":\"Admin Order Items\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorderitem\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-chevron-circle-right\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"284a2ade-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"66\",\"REFID\":\"AMI0000000063\",\"NAME\":\"Admin Order Statuses\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorderstatus\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-gamepad\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"284a80e1-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"67\",\"REFID\":\"AMI0000000059\",\"NAME\":\"Admin Orders\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorder\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-th\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"2847d5ed-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"68\",\"REFID\":\"AMI0000000060\",\"NAME\":\"Payment Types\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"paymenttype\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-joomla\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284859e7-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"69\",\"REFID\":\"AMI0000000061\",\"NAME\":\"Admin Products\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminproduct\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-vimeo-square\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"2848efd2-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"70\",\"REFID\":\"AMI0000000062\",\"NAME\":\"Admin Order Items\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorderitem\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-chevron-circle-right\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284a2ade-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"71\",\"REFID\":\"AMI0000000063\",\"NAME\":\"Admin Order Statuses\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorderstatus\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-gamepad\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284a80e1-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"72\",\"REFID\":\"AMI0000000059\",\"NAME\":\"Admin Orders\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorder\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-th\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"2847d5ed-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"73\",\"REFID\":\"AMI0000000060\",\"NAME\":\"Payment Types\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"paymenttype\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-joomla\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284859e7-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"74\",\"REFID\":\"AMI0000000061\",\"NAME\":\"Admin Products\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminproduct\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-vimeo-square\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"2848efd2-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"75\",\"REFID\":\"AMI0000000062\",\"NAME\":\"Admin Order Items\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorderitem\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-chevron-circle-right\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284a2ade-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"76\",\"REFID\":\"AMI0000000063\",\"NAME\":\"Admin Order Statuses\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorderstatus\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-gamepad\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284a80e1-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"77\",\"REFID\":\"AMI0000000059\",\"NAME\":\"Admin Orders\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorder\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-th\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"2847d5ed-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"78\",\"REFID\":\"AMI0000000060\",\"NAME\":\"Payment Types\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"paymenttype\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-joomla\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284859e7-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"79\",\"REFID\":\"AMI0000000061\",\"NAME\":\"Admin Products\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminproduct\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-vimeo-square\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"2848efd2-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"80\",\"REFID\":\"AMI0000000062\",\"NAME\":\"Admin Order Items\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorderitem\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-chevron-circle-right\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284a2ade-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"81\",\"REFID\":\"AMI0000000063\",\"NAME\":\"Admin Order Statuses\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorderstatus\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-gamepad\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284a80e1-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"82\",\"REFID\":\"AMI0000000059\",\"NAME\":\"Admin Orders\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorder\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-th\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"2847d5ed-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"83\",\"REFID\":\"AMI0000000060\",\"NAME\":\"Payment Types\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"paymenttype\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-joomla\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284859e7-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"84\",\"REFID\":\"AMI0000000061\",\"NAME\":\"Admin Products\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminproduct\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-vimeo-square\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"2848efd2-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"85\",\"REFID\":\"AMI0000000062\",\"NAME\":\"Admin Order Items\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorderitem\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-chevron-circle-right\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284a2ade-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"86\",\"REFID\":\"AMI0000000063\",\"NAME\":\"Admin Order Statuses\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorderstatus\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-gamepad\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284a80e1-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"87\",\"REFID\":\"AMI0000000059\",\"NAME\":\"Admin Orders\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorder\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-th\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"2847d5ed-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"88\",\"REFID\":\"AMI0000000060\",\"NAME\":\"Payment Types\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"paymenttype\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-joomla\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284859e7-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"89\",\"REFID\":\"AMI0000000061\",\"NAME\":\"Admin Products\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminproduct\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-vimeo-square\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"2848efd2-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"90\",\"REFID\":\"AMI0000000062\",\"NAME\":\"Admin Order Items\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorderitem\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-chevron-circle-right\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284a2ade-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"91\",\"REFID\":\"AMI0000000063\",\"NAME\":\"Admin Order Statuses\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorderstatus\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-gamepad\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284a80e1-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"92\",\"REFID\":\"AMI0000000059\",\"NAME\":\"Admin Orders\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorder\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-th\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"2847d5ed-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"93\",\"REFID\":\"AMI0000000060\",\"NAME\":\"Payment Types\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"paymenttype\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-joomla\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284859e7-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"94\",\"REFID\":\"AMI0000000061\",\"NAME\":\"Admin Products\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminproduct\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-vimeo-square\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"2848efd2-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"95\",\"REFID\":\"AMI0000000062\",\"NAME\":\"Admin Order Items\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorderitem\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-chevron-circle-right\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284a2ade-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"96\",\"REFID\":\"AMI0000000063\",\"NAME\":\"Admin Order Statuses\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorderstatus\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-gamepad\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284a80e1-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"97\",\"REFID\":\"AMI0000000059\",\"NAME\":\"Admin Orders\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorder\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-th\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"2847d5ed-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"98\",\"REFID\":\"AMI0000000060\",\"NAME\":\"Payment Types\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"paymenttype\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-joomla\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284859e7-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"99\",\"REFID\":\"AMI0000000061\",\"NAME\":\"Admin Products\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminproduct\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-vimeo-square\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"2848efd2-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"100\",\"REFID\":\"AMI0000000062\",\"NAME\":\"Admin Order Items\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorderitem\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-chevron-circle-right\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284a2ade-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"101\",\"REFID\":\"AMI0000000063\",\"NAME\":\"Admin Order Statuses\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorderstatus\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-gamepad\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284a80e1-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"102\",\"REFID\":\"AMI0000000059\",\"NAME\":\"Admin Orders\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorder\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-th\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"2847d5ed-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"103\",\"REFID\":\"AMI0000000060\",\"NAME\":\"Payment Types\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"paymenttype\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-joomla\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284859e7-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"104\",\"REFID\":\"AMI0000000061\",\"NAME\":\"Admin Products\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminproduct\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-vimeo-square\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"2848efd2-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"105\",\"REFID\":\"AMI0000000062\",\"NAME\":\"Admin Order Items\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorderitem\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-chevron-circle-right\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284a2ade-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"106\",\"REFID\":\"AMI0000000063\",\"NAME\":\"Admin Order Statuses\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"adminorderstatus\",\"PATH\":\"\",\"FONT_AWESOME_ICON\":\"fa-gamepad\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":\"0\",\"IS_STARRED\":\"0\",\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":\"\",\"UDID\":\"0\",\"WFID\":\"\",\"UUID\":\"284a80e1-2004-11e5-b60c-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"107\",\"REFID\":\"AMI0000000064\",\"NAME\":\"Issues\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"issue\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-file-word-o\",\"ENABLE_LEFT\":\"1\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"19df68ed-2653-11e5-b76e-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"108\",\"REFID\":\"AMI0000000065\",\"NAME\":\"Projects\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"project\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-caret-square-o-up\",\"ENABLE_LEFT\":\"1\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"19dff900-2653-11e5-b76e-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"109\",\"REFID\":\"AMI0000000066\",\"NAME\":\"Priorities\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"priority\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-stethoscope\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"19e0456c-2653-11e5-b76e-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"110\",\"REFID\":\"AMI0000000067\",\"NAME\":\"Documents\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"document\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-vine\",\"ENABLE_LEFT\":\"1\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"19e072e7-2653-11e5-b76e-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"111\",\"REFID\":\"AMI0000000068\",\"NAME\":\"Issue Types\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"issuetype\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-unlock-alt\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"19e5f8c7-2653-11e5-b76e-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"112\",\"REFID\":\"AMI0000000069\",\"NAME\":\"Project Users\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"projectuser\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-credit-card\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"19e78736-2653-11e5-b76e-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"113\",\"REFID\":\"AMI0000000070\",\"NAME\":\"Issue Statuses\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"issuestatus\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-unlock\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"19e80d8b-2653-11e5-b76e-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"114\",\"REFID\":\"AMI0000000071\",\"NAME\":\"Issue Comments\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"issuecomment\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-minus-square-o\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"19e84472-2653-11e5-b76e-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"115\",\"REFID\":\"AMI0000000072\",\"NAME\":\"Issue Worklogs\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"issueworklog\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-heart-o\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"19e88d5c-2653-11e5-b76e-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"116\",\"REFID\":\"AMI0000000073\",\"NAME\":\"Linking Issues\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"linkingissue\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-compress\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"19e8af4b-2653-11e5-b76e-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"117\",\"REFID\":\"AMI0000000074\",\"NAME\":\"Issue Activities\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"issueactivity\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-list-ol\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"19e91ae9-2653-11e5-b76e-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"118\",\"REFID\":\"AMI0000000075\",\"NAME\":\"Project Versions\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"projectversion\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-briefcase\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"19e9c7bd-2653-11e5-b76e-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"119\",\"REFID\":\"AMI0000000076\",\"NAME\":\"Issue Attachments\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"issueattachment\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-outdent\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"19e9ea01-2653-11e5-b76e-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"120\",\"REFID\":\"AMI0000000077\",\"NAME\":\"Issue Resolutions\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"issueresolution\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-circle-thin\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"19ea0e03-2653-11e5-b76e-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"121\",\"REFID\":\"AMI0000000078\",\"NAME\":\"Project Components\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"projectcomponent\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-arrow-circle-up\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"19ea4902-2653-11e5-b76e-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119},{\"ID\":\"122\",\"REFID\":\"AMI0000000079\",\"NAME\":\"Issue Linking Types\",\"ID_ADMIN_MENU\":\"1\",\"PARENT\":\"0\",\"MODULE\":\"issuelinkingtype\",\"PATH\":null,\"FONT_AWESOME_ICON\":\"fa-chevron-circle-up\",\"ENABLE_LEFT\":\"0\",\"ENABLE_TOP\":\"0\",\"ENABLE_QUICK\":\"0\",\"ENABLE_ALL\":\"0\",\"ENABLE_SETTINGS\":\"0\",\"OPEN_IN_NEW_WINDOW\":null,\"IS_STARRED\":null,\"ORDERING\":\"99\",\"GUID\":\"1\",\"JSON\":null,\"UDID\":\"0\",\"WFID\":null,\"UUID\":\"19ea71a0-2653-11e5-b76e-cc52af77857f\",\"HIERACHY\":\"-0-\",\"N\":119}]}',0,NULL,'078ad597-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MENU` (`ID`, `REFID`, `NAME`, `ORDERING`, `IS_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (2,'ADM0000000002','Base User Menu',2,0,1,NULL,0,NULL,'078ad93b-1a1a-11e5-b2f8-cc52af77857f');
/*!40000 ALTER TABLE `ADMIN_MENU` ENABLE KEYS */;

--
-- Table structure for table `ADMIN_MENU_ITEM`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `ADMIN_MENU_ITEM` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_ADMIN_MENU` int(11) DEFAULT NULL,
  `PARENT` int(11) DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATH` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FONT_AWESOME_ICON` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENABLE_LEFT` tinyint(1) DEFAULT NULL,
  `ENABLE_TOP` tinyint(1) DEFAULT NULL,
  `ENABLE_QUICK` tinyint(1) DEFAULT NULL,
  `ENABLE_ALL` tinyint(1) DEFAULT NULL,
  `ENABLE_SETTINGS` tinyint(1) DEFAULT NULL,
  `OPEN_IN_NEW_WINDOW` tinyint(1) DEFAULT NULL,
  `IS_STARRED` tinyint(1) DEFAULT NULL,
  `ORDERING` tinyint(2) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HIERACHY` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_ID_ADMIN_MENU` (`ID_ADMIN_MENU`),
  KEY `IDX_PARENT` (`PARENT`),
  KEY `IDX_MODULE` (`MODULE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_MENU_ITEM`
--

/*!40000 ALTER TABLE `ADMIN_MENU_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_MENU_ITEM` ENABLE KEYS */;

--
-- Table structure for table `ADMIN_MODULE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `ADMIN_MODULE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREFIX` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AVAILABLE_ACTIONS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_COMMENT_ENABLED` tinyint(1) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE` (`MODULE`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_MODULE`
--

/*!40000 ALTER TABLE `ADMIN_MODULE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_MODULE` ENABLE KEYS */;

--
-- Table structure for table `ADMIN_SEQUENCE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `ADMIN_SEQUENCE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEQUENCE_FORMAT` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CURRENT_VALUE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEQUENCE_STEP` smallint(3) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE` (`MODULE`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_MODULE` (`MODULE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_SEQUENCE`
--

/*!40000 ALTER TABLE `ADMIN_SEQUENCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_SEQUENCE` ENABLE KEYS */;

--
-- Table structure for table `CHANGE_LOG`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `CHANGE_LOG` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTION` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_TIME` datetime DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `DETAILS` text COLLATE utf8_unicode_ci,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_MODULE` (`MODULE`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_ID_USER` (`ID_USER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHANGE_LOG`
--

/*!40000 ALTER TABLE `CHANGE_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `CHANGE_LOG` ENABLE KEYS */;

--
-- Table structure for table `CONDITION_OPERATOR`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `CONDITION_OPERATOR` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OPERATOR` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONDITION_OPERATOR`
--

/*!40000 ALTER TABLE `CONDITION_OPERATOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `CONDITION_OPERATOR` ENABLE KEYS */;

--
-- Table structure for table `DASHBOARD`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `DASHBOARD` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_ADMIN_MENU` int(11) DEFAULT NULL,
  `ID_DASHBOARD_LAYOUT` int(11) DEFAULT NULL,
  `DASHBOARD_FILE_PATH` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_ID_ADMIN_MENU` (`ID_ADMIN_MENU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DASHBOARD`
--

/*!40000 ALTER TABLE `DASHBOARD` DISABLE KEYS */;
INSERT IGNORE INTO `DASHBOARD` (`ID`, `REFID`, `NAME`, `ID_ADMIN_MENU`, `ID_DASHBOARD_LAYOUT`, `DASHBOARD_FILE_PATH`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (1,'DSH0000000001','Admin Dashboard',1,1,NULL,1,NULL,0,NULL,'06fe2356-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `DASHBOARD` (`ID`, `REFID`, `NAME`, `ID_ADMIN_MENU`, `ID_DASHBOARD_LAYOUT`, `DASHBOARD_FILE_PATH`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (2,'DSH0000000002','Base User Dashboard',2,0,NULL,1,NULL,0,NULL,'06fe2719-1a1a-11e5-b2f8-cc52af77857f');
/*!40000 ALTER TABLE `DASHBOARD` ENABLE KEYS */;

--
-- Table structure for table `FIELD`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `FIELD` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TOOLTIP` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_EXCLUDED` tinyint(1) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE` (`MODULE`,`COLUMN`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FIELD`
--

/*!40000 ALTER TABLE `FIELD` DISABLE KEYS */;
/*!40000 ALTER TABLE `FIELD` ENABLE KEYS */;

--
-- Table structure for table `FIELD_ACL`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `FIELD_ACL` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTION` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_USER_GROUP` int(11) DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `FIELDS` text COLLATE utf8_unicode_ci,
  `ID_ACL_TYPE` int(11) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE` (`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_ACL_TYPE`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_MODULE` (`MODULE`),
  KEY `IDX_ID_USER_GROUP` (`ID_USER_GROUP`),
  KEY `IDX_ID_USER` (`ID_USER`),
  KEY `IDX_ID_ACL_TYPE` (`ID_ACL_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FIELD_ACL`
--

/*!40000 ALTER TABLE `FIELD_ACL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FIELD_ACL` ENABLE KEYS */;

--
-- Table structure for table `OBJECT_ACL`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `OBJECT_ACL` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OBJECT_ID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_USER_GROUP` int(11) DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `ARG_ID_USER_GROUP` int(11) DEFAULT NULL,
  `ARG_ID_USER` int(11) DEFAULT NULL,
  `ID_ACL_TYPE` int(11) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_MODULE` (`MODULE`),
  KEY `IDX_ID_USER_GROUP` (`ID_USER_GROUP`),
  KEY `IDX_ID_USER` (`ID_USER`),
  KEY `IDX_ARG_ID_USER_GROUP` (`ARG_ID_USER_GROUP`),
  KEY `IDX_ARG_ID_USER` (`ARG_ID_USER`),
  KEY `IDX_ID_ACL_TYPE` (`ID_ACL_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OBJECT_ACL`
--

/*!40000 ALTER TABLE `OBJECT_ACL` DISABLE KEYS */;
/*!40000 ALTER TABLE `OBJECT_ACL` ENABLE KEYS */;

--
-- Table structure for table `OPTION`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `OPTION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `CONTEXT` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uniquekey` (`CODE`,`CONTEXT`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPTION`
--

/*!40000 ALTER TABLE `OPTION` DISABLE KEYS */;
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (1,'OPT0000000001','Site URL','site-url','http://www.yahoo.com',NULL,1,NULL,0,NULL,'066081d2-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (2,'OPT0000000002','Site Author','site-author','Viet Tran',NULL,1,NULL,0,NULL,'066085dd-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (3,'OPT0000000003','Top contact info','top-contact-info','<b>Số điện thoại</b> (204) 272-3725 / <b>Đường dây nóng</b> (905) 326-3444',NULL,1,NULL,0,NULL,'0660875e-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (4,'OPT0000000004','Facebook url','facebook-url','https://www.facebook.com/NhomMua.HCMC',NULL,1,NULL,0,NULL,'066088d6-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (5,'OPT0000000005','Google Plus URL','google-plus-url','http://plus.google.com',NULL,1,NULL,0,NULL,'06608a46-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (6,'OPT0000000006','Twitter URL','twitter-url','http://www.twitter.com/tqviet1978',NULL,1,NULL,0,NULL,'06608bbf-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (7,'OPT0000000007','YouTube URL','youtube-url','http://www.youtube.com/tqviet1978',NULL,1,NULL,0,NULL,'06608d19-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (8,'OPT0000000008','Web designer name','web-designer-name','GoMedia',NULL,1,NULL,0,NULL,'06608e78-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (9,'OPT0000000009','Web designer URL','web-designer-url','http://www.gomedia.vn',NULL,1,NULL,0,NULL,'06608fbd-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (10,'OPT0000000010','Copyright Notice','copyright-notice','© 2014 Your Company Name.',NULL,1,NULL,0,NULL,'06609128-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (11,'OPT0000000011','Logo','logo','logo.png',NULL,1,NULL,0,NULL,'06609276-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (12,'OPT0000000012','Admin menu style [flat|adminex|easytree]','admin-menu-style','adminex',NULL,1,NULL,0,NULL,'066093d9-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (13,'OPT0000000013','Global meta keywords','global-meta-keywords','extremeframework, extreme framework',NULL,1,NULL,0,NULL,'0660952b-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (14,'OPT0000000014','Default meta description','default-meta-description','',NULL,1,NULL,0,NULL,'0660969b-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (15,'OPT0000000015','Global meta title','global-meta-title','',NULL,1,NULL,0,NULL,'066097f1-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (16,'OPT0000000016','Footer support phone','footer-support-phone','1900 6617',NULL,1,NULL,0,NULL,'0660993a-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (17,'OPT0000000017','Footer support hours','footer-support-hours','Từ 8h-21h, kể cả Thứ 7-CN',NULL,1,NULL,0,NULL,'06609a8c-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (18,'OPT0000000018','Footer company line 1','footer-company-line-1','Công ty TNHH Nhóm Mua',NULL,1,NULL,0,NULL,'06609be7-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (19,'OPT0000000019','Footer company line 2','footer-company-line-2','331 Nguyễn Trọng Tuyển, P. 10, Q. Phú Nhuận, TP.HCM',NULL,1,NULL,0,NULL,'06609d34-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (20,'OPT0000000020','Footer company line 3','footer-company-line-3','Tầng 4 – Lô 07-3A Khu CN Hoàng Mai, Q.Hoàng Mai, Hà Nội',NULL,1,NULL,0,NULL,'06609e97-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (21,'OPT0000000021','Footer company line 4','footer-company-line-4','ĐT: (08) 7305 6616 - Fax: (08) 3844 6316 - Email: support@nhommua.com',NULL,1,NULL,0,NULL,'06609ff2-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (22,'OPT0000000022','Footer company line 5','footer-company-line-5','Mã số doanh nghiệp: 0310426944',NULL,1,NULL,0,NULL,'0660a14c-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (23,'OPT0000000023','Footer support email','footer-support-email','support@nhommua.com',NULL,1,NULL,0,NULL,'0660a29e-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (24,'OPT0000000024','Code of home slideshow','home-slideshow-code','main',NULL,1,NULL,0,NULL,'0660a3f9-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (25,'OPT0000000025','Code of home post menu','home-post-menu-code','nm-home-posts',NULL,1,NULL,0,NULL,'0660a546-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (26,'OPT0000000026','Code of main menu','main-menu-code','nhom-mua-main',NULL,1,NULL,0,NULL,'0660a6a1-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (27,'OPT0000000027','Pinterest URL','pinterest-url','http://www.pinterest.com',NULL,1,NULL,0,NULL,'0660a7ea-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (28,'OPT0000000028','Code of the main organization','main-organization-code','nhom-mua',NULL,1,NULL,0,NULL,'0660a94d-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (29,'OPT0000000029','Google OAuth 2.0 Client ID','google-oauth2-client-id','356091694084-quei5u71n8ncsi2d9shpulf27j69mkdc.apps.googleusercontent.com',NULL,1,NULL,0,NULL,'0660aaa3-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (30,'OPT0000000030','Google OAuth 2.0 Client Secret','google-oauth2-client-secret','SrMGebYFzk1GbnF1uc3WQDlS',NULL,1,NULL,0,NULL,'0660abfe-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (31,'OPT0000000031','Google OAuth 2.0 Redirect URL','google-oauth2-redirect-uri','http://localhost/apps4clouds.com/apps/retailworld/front/google/oauth2callback',NULL,1,NULL,0,NULL,'0660ad58-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (32,'OPT0000000032','Yahoo OAuth 2.0 Consumer Key','yahoo-oauth2-consumer-key','dj0yJmk9MHhyQUwwR29NeE1mJmQ9WVdrOWJXWjVNR2RuTm0wbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD1hMw--',NULL,1,NULL,0,NULL,'0660aec4-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (33,'OPT0000000033','Yahoo OAuth 2.0 Consumer Secret','yahoo-oauth2-consumer-secret','7c558f4ad0edf200bfeeea1408589c9c89338bcb',NULL,1,NULL,0,NULL,'0660b040-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (34,'OPT0000000034','Yahoo OAuth 2.0 App ID','yahoo-oauth2-app-id','mfy0gg6m',NULL,1,NULL,0,NULL,'0660b1a4-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (35,'OPT0000000035','Facebook OAuth 2.0 App ID','facebook-oauth2-app-id','1546420508951644',NULL,1,NULL,0,NULL,'0660b307-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (36,'OPT0000000036','Facebook OAuth 2.0 App Secret','facebook-oauth2-app-secret','6887ec3d95f5162ec6471e40883486ba',NULL,1,NULL,0,NULL,'0660b454-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (37,'OPT0000000037','Organization name','organization-name','Your Organization Name',NULL,1,NULL,0,NULL,'0660b5a6-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (38,'OPT0000000038','Default currency text','default-currency-text','USD',NULL,1,NULL,0,NULL,'0660b6fc-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (39,'OPT0000000039','Admin menu style [flat|adminex|easytree]','admin-menu-style','adminex',NULL,1,NULL,0,NULL,'0660b852-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (40,'OPT0000000040','Site name','site-name','Hello','extreme',1,NULL,0,NULL,'36d27ea9-ce61-43b3-9076-98807d098998');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (41,'OPT0000000041','Site tag line','site-tag-line','Hello','extreme',1,NULL,0,NULL,'727f8efe-42e9-490a-b1d4-06923a47a0b8');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (42,'OPT0000000042','Copyright notice','copyright-notice','Hello','extreme',1,NULL,0,NULL,'243cc102-9621-4d67-a6a6-d79ab269c4f8');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (43,'OPT0000000043','Site logo','site-logo','themes/extreme/extremeframework.png','extreme',1,NULL,0,NULL,'98511f26-fe19-4545-9242-bd8b8d6eb933');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (44,'OPT0000000044','Favicon','site-favicon','themes/extreme/extremeframework.png','extreme',1,NULL,0,NULL,'015500d9-e6d5-4749-9a5a-b5b214c33865');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (45,'OPT0000000045','Favicon (for touch devices)','site-favicon-touch','themes/extreme/extremeframework.png','extreme',1,NULL,0,NULL,'5ca98528-88b8-4045-830e-1166065859a3');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (46,'OPT0000000046','Global meta title','global-meta-title','Extreme','extreme',1,NULL,0,NULL,'ed1368a4-dfbd-492d-a7db-17850ecf9ceb');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (47,'OPT0000000047','Global meta keywords','global-meta-keywords','Extreme','extreme',1,NULL,0,NULL,'424f8de0-96d8-4538-97c7-66b3968b06d5');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (48,'OPT0000000048','Default meta description','default-meta-description','Extreme','extreme',1,NULL,0,NULL,'3f3fd37f-565f-4422-b5b3-1b2e879c12f0');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (49,'OPT0000000049','Home page','home-page','1','extreme',1,NULL,0,NULL,'463da5ce-f63a-44e6-a301-372c8599e2c5');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (50,'OPT0000000050','Home URL','home-url','','extreme',1,NULL,0,NULL,'1b5399b2-ff31-466a-86c9-cbae5a24baac');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (51,'OPT0000000051','Main menu','main-menu','main-menu','extreme',1,NULL,0,NULL,'23bff44d-7d1c-4faf-a52d-a0b7bc6b7795');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (52,'OPT0000000052','Footer menu','footer-menu','main-menu','extreme',1,NULL,0,NULL,'afb45b50-9c4a-48f3-8f98-1dfb4282d4f4');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (53,'OPT0000000053','Documentation sidebar menu','documentation-sidebar-menu','main-menu','extreme',1,NULL,0,NULL,'c0c8a750-7fac-494d-a51e-51bc6f0a10e7');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (54,'OPT0000000054','Product sidebar menu','product-sidebar-menu','main-menu','extreme',1,NULL,0,NULL,'4a336089-43d1-44b4-967a-6d27a664e7b5');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (55,'OPT0000000055','Documentation root category','documentation-category-id','1','extreme',1,NULL,0,NULL,'bf730052-cf5c-4b96-acfb-589e6cb4f388');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (56,'OPT0000000056','News root category','news-root-category-id','2','extreme',1,NULL,0,NULL,'005267dc-bbc6-4a66-bf68-a9d27f3b9112');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (57,'OPT0000000057','url-rewrite-suffix','url-rewrite-suffix','/','',1,NULL,0,NULL,'8edae28a-c57f-41b1-a92f-36bb7e217d2d');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (58,'OPT0000000058','Site name','site-name','Hongkiat','hongkiat',1,NULL,0,NULL,'4e54f3de-148e-4e58-87fa-77cb562915fa');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (59,'OPT0000000059','Site tag line','site-tag-line','Hongkiat','hongkiat',1,NULL,0,NULL,'85cceb69-9805-4ef2-a6d2-763052284b95');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (60,'OPT0000000060','Copyright notice','copyright-notice','2015 Hongkiat','hongkiat',1,NULL,0,NULL,'a1c3cc21-d4da-4340-bf05-b4b31542729a');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (61,'OPT0000000061','Site logo','site-logo','','hongkiat',1,NULL,0,NULL,'2a579c62-c3f8-4f69-aeee-b2f22aa297dc');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (62,'OPT0000000062','Favicon','site-favicon','','hongkiat',1,NULL,0,NULL,'4b513e18-5f0a-46d1-b302-1f40c64861d5');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (63,'OPT0000000063','Favicon (for touch devices)','site-favicon-touch','','hongkiat',1,NULL,0,NULL,'3509bb1a-324f-4a2c-8617-d36348a56dec');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (64,'OPT0000000064','Global meta title','global-meta-title','Hongkiat','hongkiat',1,NULL,0,NULL,'bd98a030-62f2-4a1d-9466-354d4d58990a');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (65,'OPT0000000065','Global meta keywords','global-meta-keywords','Hongkiat','hongkiat',1,NULL,0,NULL,'1d84eb75-b199-4d95-a250-c5482490db17');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (66,'OPT0000000066','Default meta description','default-meta-description','Hongkiat','hongkiat',1,NULL,0,NULL,'3dea8869-8ecd-4248-b54d-f0963604e29c');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (67,'OPT0000000067','Home page','home-page','','hongkiat',1,NULL,0,NULL,'4eccbd1e-a3a0-42a7-8534-4862705c9e55');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (68,'OPT0000000068','Home URL','home-url','blog','hongkiat',1,NULL,0,NULL,'5f3b328c-63b6-43d3-9bc0-ac2b10476d0c');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (69,'OPT0000000069','Main menu','main-menu','main-menu','hongkiat',1,NULL,0,NULL,'8c0e4a09-075b-405a-8952-a01fecdd1841');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (70,'OPT0000000070','Footer menu','footer-menu','footer-menu','hongkiat',1,NULL,0,NULL,'bcfa1dd8-a773-4cf8-8572-ec0a23a8d8c6');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (71,'OPT0000000071','Documentation sidebar menu','documentation-sidebar-menu','','hongkiat',1,NULL,0,NULL,'9015eaae-f565-4191-89df-98f2cee4170f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (72,'OPT0000000072','Product sidebar menu','product-sidebar-menu','','hongkiat',1,NULL,0,NULL,'8b142b9a-2f55-4d40-ba40-0433eb24dedd');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (73,'OPT0000000073','Documentation root category','documentation-category-id','','hongkiat',1,NULL,0,NULL,'6e11e5a9-7042-42d3-bbd8-891663730824');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (74,'OPT0000000074','News root category','news-root-category-id','','hongkiat',1,NULL,0,NULL,'80f76f1f-0e88-48a5-8b1c-099cb2709d1b');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (75,'OPT0000000075','Facebook URL','facebook-url','#','hongkiat',1,NULL,0,NULL,'e3b4c87d-f665-4e69-9519-11a1222ad2d0');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (76,'OPT0000000076','Twitter URL','twitter-url','#','hongkiat',1,NULL,0,NULL,'bb471592-c77d-4a8d-a807-205c52d82213');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (77,'OPT0000000077','Google Plus URL','google-plus-url','#','hongkiat',1,NULL,0,NULL,'2b750e79-72d9-4cdf-b327-94891ffa5a6a');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (78,'OPT0000000078','Disqus short name','disqus_shortname','demo','hongkiat',1,NULL,0,NULL,'ae8903d3-1f4f-4edb-b858-17e0085851ec');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (79,'OPT0000000079','Blog root category','blog-root-category-id','30','hongkiat',1,NULL,0,NULL,'95cdda8f-1122-44e6-8cda-1c7acd70527d');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (80,'OPT0000000080','Site name','site-name','','admin.commerce',1,NULL,0,NULL,'a035219e-92f8-4300-89b8-67524196570b');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (81,'OPT0000000081','Site tag line','site-tag-line','','admin.commerce',1,NULL,0,NULL,'56f33c67-0a44-4658-82b3-03d1e3e02f10');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (82,'OPT0000000082','Copyright notice','copyright-notice','','admin.commerce',1,NULL,0,NULL,'29794c34-011c-4568-90a7-fe3f6cb34452');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (83,'OPT0000000083','Site logo','site-logo','','admin.commerce',1,NULL,0,NULL,'de911dd2-a03a-463c-8b21-d46592b40625');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (84,'OPT0000000084','Favicon','site-favicon','','admin.commerce',1,NULL,0,NULL,'afbede66-eaf9-4900-9053-bd3c414439f1');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (85,'OPT0000000085','Favicon (for touch devices)','site-favicon-touch','','admin.commerce',1,NULL,0,NULL,'5c116605-55b6-418b-96b1-bcfc691e6f2a');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (86,'OPT0000000086','Global meta title','global-meta-title','','admin.commerce',1,NULL,0,NULL,'8cee2de7-b88c-4ff3-b2b6-b340d2c60e8b');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (87,'OPT0000000087','Global meta keywords','global-meta-keywords','','admin.commerce',1,NULL,0,NULL,'9d16bebc-212f-47cd-b154-cdf396c3444c');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (88,'OPT0000000088','Default meta description','default-meta-description','','admin.commerce',1,NULL,0,NULL,'f268eb70-ee53-4c71-ace8-8711d7ef1c03');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (89,'OPT0000000089','Facebook URL','facebook-url','','admin.commerce',1,NULL,0,NULL,'759b14b7-9f04-4adf-959a-22858a112b19');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (90,'OPT0000000090','Twitter URL','twitter-url','','admin.commerce',1,NULL,0,NULL,'44522a89-64d0-41fb-9627-ac2bd88e43d0');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (91,'OPT0000000091','Google Plus URL','google-plus-url','','admin.commerce',1,NULL,0,NULL,'2fad9270-b8e7-4aa7-ad4d-83b3f06e15e9');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (92,'OPT0000000092','Disqus short name','disqus_shortname','','admin.commerce',1,NULL,0,NULL,'264434d7-f0c6-4594-871f-8b14a915dddd');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (93,'OPT0000000093','Home page','home-page','','admin.commerce',1,NULL,0,NULL,'b6c01eaa-c302-4d06-bac9-cd7bd630f6d1');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (94,'OPT0000000094','Home URL','home-url','','admin.commerce',1,NULL,0,NULL,'7f8ed216-c885-4e70-bcab-448e21c77c7e');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (95,'OPT0000000095','Main menu','main-menu','','admin.commerce',1,NULL,0,NULL,'2b40a0a8-850e-432a-a5c9-dbdca8435e9a');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (96,'OPT0000000096','Footer menu','footer-menu','','admin.commerce',1,NULL,0,NULL,'bbcb2b73-1c3c-43d6-a199-3e79933215a8');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (97,'OPT0000000097','Blog root category','blog-root-category-id','','admin.commerce',1,NULL,0,NULL,'52df642a-8d2c-42aa-b98e-9e04a0836719');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (98,'OPT0000000098','PAYPAL_API_URL','PAYPAL_API_URL','https://api-3t.sandbox.paypal.com/nvp','admin.commerce',1,NULL,0,NULL,'0b4d9f9b-ada1-4cbd-a813-96d74e0ccd59');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (99,'OPT0000000099','PAYPAL_WEB_URL','PAYPAL_WEB_URL','https://www.sandbox.paypal.com','admin.commerce',1,NULL,0,NULL,'71d10c2d-473d-4722-a3d5-b6356512abd1');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (100,'OPT0000000100','PayPal version','PAYPAL_VERSION','93','admin.commerce',1,NULL,0,NULL,'f9ac3ac0-cfdf-4698-a82e-2371f7d4062d');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (101,'OPT0000000101','PayPal username','PAYPAL_USERNAME','tqviet1978','admin.commerce',1,NULL,0,NULL,'1c51f962-d7cc-4b5b-8e4f-bdc8a34476c6');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (102,'OPT0000000102','PayPal password','PAYPAL_PASSWORD','123','admin.commerce',1,NULL,0,NULL,'a5db9cd5-dc82-4efd-b2cb-d5ac1c15292a');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (103,'OPT0000000103','PayPal signature','PAYPAL_SIGNATURE','123','admin.commerce',1,NULL,0,NULL,'cf94ae45-30b3-42a9-aed9-7b827d6a0de1');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (104,'OPT0000000104','Site name','site-name','University of Nebraska Medical Center','scholar',1,NULL,0,NULL,'17c2391a-b6d7-4d1b-83a1-4125015c9a50');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (105,'OPT0000000105','Site tag line','site-tag-line','University of Nebraska Medical Center','scholar',1,NULL,0,NULL,'b47adee4-fe1d-40f5-ab4a-1b5d469ce3d1');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (106,'OPT0000000106','Copyright notice','copyright-notice','© 2015 University of Nebraska Medical Center','scholar',1,NULL,0,NULL,'bbd2700f-7f57-4401-9bde-b9ee66d227a6');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (107,'OPT0000000107','Site logo','site-logo','themes/scholar/logo-unmc-www-large.png','scholar',1,NULL,0,NULL,'772d3a1c-8f3d-4f90-9ee3-be44ec171578');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (108,'OPT0000000108','Site logo (small version)','site-logo-small','themes/scholar/logo-unmc-subsites.png','scholar',1,NULL,0,NULL,'120f66f8-4efe-4cbd-9099-de14f6c39d55');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (109,'OPT0000000109','Footer site logo','site-logo-footer','themes/scholar/logo-wordmark.png','scholar',1,NULL,0,NULL,'ab1b5d5b-c5d9-47d7-b3a2-d38d52a6d53e');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (110,'OPT0000000110','Favicon','site-favicon','themes/scholar/favicon.extreme-framework.ico','scholar',1,NULL,0,NULL,'dafd5791-931c-4b5c-9239-b7846c829e3d');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (111,'OPT0000000111','Favicon (for touch devices)','site-favicon-touch','themes/scholar/icon-touch.e4872c4da341.png','scholar',1,NULL,0,NULL,'b86b5ded-3ad8-4f34-90c7-8d094db0d6e6');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (112,'OPT0000000112','Global meta title','global-meta-title','University of Nebraska Medical Center','scholar',1,NULL,0,NULL,'cade64ba-cf4d-45ab-83e6-f3ff0456c499');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (113,'OPT0000000113','Global meta keywords','global-meta-keywords','University of Nebraska Medical Center','scholar',1,NULL,0,NULL,'5ec5ae04-d5ad-4ca3-a456-f80fd1a9251a');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (114,'OPT0000000114','Default meta description','default-meta-description','University of Nebraska Medical Center','scholar',1,NULL,0,NULL,'11e39472-4089-4a93-a9bb-f7416a07c7d4');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (115,'OPT0000000115','Organization name','organization-name','University of Nebraska Medical Center','scholar',1,NULL,0,NULL,'4a3412fe-57ef-4819-bc1f-06b601bba8bb');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (116,'OPT0000000116','Organization address','organization-address','42nd and Emile, Omaha, NE 68198 ','scholar',1,NULL,0,NULL,'4cb2d656-9f83-48d9-9d67-a23db3263305');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (117,'OPT0000000117','Organization phone','organization-phone','402-559-4000','scholar',1,NULL,0,NULL,'168a2e32-032e-4dd8-9795-59b33825971c');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (118,'OPT0000000118','Organization contact URL','organization-contact-url','http://www.unmc.edu/contact/','scholar',1,NULL,0,NULL,'84f03c44-923d-4a62-b8b8-f0a26faa66c1');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (119,'OPT0000000119','Facebook URL','facebook-url','#','scholar',1,NULL,0,NULL,'16f8e287-1795-4562-b35c-74194ad10211');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (120,'OPT0000000120','Twitter URL','twitter-url','#','scholar',1,NULL,0,NULL,'48d14660-6c15-4fa9-8649-6c4668f8d74e');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (121,'OPT0000000121','YouTube URL','youtube-url','#','scholar',1,NULL,0,NULL,'6a905cb4-37de-4e35-a17e-eb6f7e965298');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (122,'OPT0000000122','Flickr URL','flickr-url','#','scholar',1,NULL,0,NULL,'f80b494b-46f8-4755-b95d-74f3538df60d');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (123,'OPT0000000123','Pinterest URL','pinterest-url','#','scholar',1,NULL,0,NULL,'c0c413d0-ed0b-4b5b-8bea-a2d0e1093d6a');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (124,'OPT0000000124','Linkedin URL','linkedin-url','#','scholar',1,NULL,0,NULL,'beaea616-ac1e-4de1-9344-4c95a3f67248');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (125,'OPT0000000125','Home page','home-page','1','scholar',1,NULL,0,NULL,'cc4e08f1-f1a6-424f-9a22-2983b8c2a03b');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (126,'OPT0000000126','Home URL','home-url','','scholar',1,NULL,0,NULL,'49ba06d6-7ffd-436a-8d99-e2e7bff0a3b3');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (127,'OPT0000000127','Main menu','main-menu','main-menu','scholar',1,NULL,0,NULL,'e0d0492b-0c83-4e78-88c2-48000862ccc4');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (128,'OPT0000000128','Main top links','main-top-links','main-top-links','scholar',1,NULL,0,NULL,'e04ed070-562f-4ac6-929e-5c87045596d8');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (129,'OPT0000000129','News root category','news-root-category-id','1','scholar',1,NULL,0,NULL,'8a965a02-e01a-4af3-92ca-4af5fc8d2c62');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (130,'OPT0000000130','Global news footer','global-news-footer','<p><em>We are </em><a href=\"http://www.nebraskamed.com/\"><em>Nebraska Medicine</em></a><em> and </em><a href=\"http://www.unmc.edu/\"><em>UNMC</em></a><em>. Our mission is to lead the world in transforming lives to create a healthy future for all individuals and communities through premier educational programs, innovative research and extraordinary patient care.</em></p>\r\n<p><a href=\"https://twitter.com/unmc\">Twitter</a>  |  <a href=\"https://www.facebook.com/unmcedu\">Facebook</a>  |  <a href=\"http://www.pinterest.com/unmc\">Pinterest</a>  |  <a href=\"http://www.youtube.com/user/UNMCEDU\">YouTube</a></p>','scholar',1,NULL,0,NULL,'e7a25d14-e12e-495c-ac3a-cfd789caa7dc');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (131,'OPT0000000131','Footer menu','footer-menu','footer-menu','scholar',1,NULL,0,NULL,'d46bdd24-6808-441d-a4fe-dae1d39c5882');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (132,'OPT0000000132','Footer links','footer-links','footer-links','scholar',1,NULL,0,NULL,'d0c2d5ba-4d7c-4889-8428-a202831b81e7');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (133,'OPT0000000133','xxxx','xxxx','','',1,NULL,0,NULL,'f3689aea-f0eb-4496-ae2c-91574067fe8f');
INSERT IGNORE INTO `OPTION` (`ID`, `REFID`, `NAME`, `CODE`, `VALUE`, `CONTEXT`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (134,'OPT0000000134','yyyxxx','yyy','','',1,NULL,0,NULL,'16a324db-97c7-4b15-a139-3f888aed8a36');
/*!40000 ALTER TABLE `OPTION` ENABLE KEYS */;

--
-- Table structure for table `PARAMETER`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `PARAMETER` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_PARAMETER_GROUP` int(11) DEFAULT NULL,
  `ID_PARAMETER_TYPE` int(11) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uniquekey` (`CODE`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_ID_PARAMETER_GROUP` (`ID_PARAMETER_GROUP`),
  KEY `IDX_ID_PARAMETER_TYPE` (`ID_PARAMETER_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARAMETER`
--

/*!40000 ALTER TABLE `PARAMETER` DISABLE KEYS */;
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (1,'PRM0000000001','Default currency','DEFAULT_CURRENCY_SYMBOL',1,8,'$','',1,NULL,0,NULL,'b181f0a5-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (2,'PRM0000000002','Application name','CONFIG_APPLICATION_NAME',1,1,'Apps4Clouds','',1,NULL,0,NULL,'b181f3da-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (3,'PRM0000000003','CSV separator','CSV_SEPARATOR',1,1,',','',1,NULL,0,NULL,'b181f4e4-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (4,'PRM0000000004','Date format','DATE_FORMAT',1,1,'mm-dd-yy','',1,NULL,0,NULL,'b181f5e0-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (5,'PRM0000000005','Date format (in Smarty)','SMARTY_DATE_FORMAT',1,1,'%m-%d-%Y','',1,NULL,0,NULL,'b181f6c7-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (7,'PRM0000000006','Default user group','DEFAULT_USER_GROUP',1,3,'2','',1,NULL,0,NULL,'b181f7b2-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (8,'PRM0000000007','Positive currency format','POSITIVE_CURRENCY_FORMAT',1,1,'%s%n','',1,NULL,0,NULL,'b181f895-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (9,'PRM0000000008','Negative currency format','NEGATIVE_CURRENCY_FORMAT',1,1,'(%s%n)','',1,NULL,0,NULL,'b181f980-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (10,'PRM0000000009','Organization name','ORGANIZATION_NAME',1,1,'Apps4Clouds Corporation','',1,NULL,0,NULL,'b181fa63-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (11,'PRM0000000010','Organization name (short)','ORGANIZATION_NAME_SHORT',1,1,'Apps4Clouds','',1,NULL,0,NULL,'b181fb46-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (12,'PRM0000000011','Support name','SUPPORT_NAME',1,1,'Apps4Clouds Support','',1,NULL,0,NULL,'b181fc28-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (13,'PRM0000000012','Support email','SUPPORT_EMAIL',1,1,'support@apps4clouds.com','',1,NULL,0,NULL,'b181fd02-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (14,'PRM0000000013','Default public dashboard','DEFAULT_PUBLIC_DASHBOARD',1,3,'3','',1,NULL,0,NULL,'b181fde1-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (15,'PRM0000000014','GetResponse API key','GETRESPONSE_API_KEY',1,1,'','',1,NULL,0,NULL,'b181feb7-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (16,'PRM0000000015','Use SMTP for sending emails?','MAILER_USE_SMTP',1,1,'1','',1,NULL,0,NULL,'b181ff99-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (17,'PRM0000000016','SMTP host','MAILER_SMTP_HOST',1,1,'smtp.gmail.com','',1,NULL,0,NULL,'b1820074-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (18,'PRM0000000017','SMTP port','MAILER_SMTP_PORT',1,1,'465','',1,NULL,0,NULL,'b1820156-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (19,'PRM0000000018','SMTP username','MAILER_SMTP_USERNAME',1,1,'support@apps4clouds.com','',1,NULL,0,NULL,'b1820235-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (20,'PRM0000000019','SMTP password','MAILER_SMTP_PASSWORD',1,1,'******','',1,NULL,0,NULL,'b182031c-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (21,'PRM0000000020','Save draft interval (seconds)','SAVE_DRAFT_INTERVAL',1,3,'10','',1,NULL,0,NULL,'b18203fa-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (22,'PRM0000000021','Social :: Facebook URL','SOCIAL_FACEBOOK_URL',2,1,'https://www.facebook.com/pages/C%E1%BB%99ng-%C4%91%E1%BB%93ng-PHP-Vi%E1%BB%87t-Nam/261573760536525','',1,NULL,0,NULL,'b18204e1-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (23,'PRM0000000022','Social :: Disqus short name','SOCIAL_DISQUS_SHORTNAME',2,1,'vietmaisolutionscorporation','',1,NULL,0,NULL,'b18205dd-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (24,'PRM0000000023','Social :: Disqus language','SOCIAL_DISQUS_LANGUAGE',2,1,'vi','',1,NULL,0,NULL,'b18206d5-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (25,'PRM0000000024','Cloud sync option','CLOUD_SYNC_ENABLED',3,2,'1','',1,NULL,0,NULL,'b18207b4-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (26,'PRM0000000025','PayPal :: Mode','PAYPAL_MODE',4,1,'sandbox','',1,NULL,0,NULL,'b1820897-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (27,'PRM0000000026','PayPal :: API Username','PAYPAL_API_USERNAME',4,1,'nguyenlehuutai-facilitator_api1.gmail.com','',1,NULL,0,NULL,'b1820982-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (28,'PRM0000000027','PayPal :: API Password','PAYPAL_API_PASSWORD',4,1,'1402304047','',1,NULL,0,NULL,'b1820a71-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (29,'PRM0000000028','PayPal :: API Signature','PAYPAL_API_SIGNATURE',4,1,'AFcWxV21C7fd0v3bYYYRCpSSRl31AwWb1ql-fAwJI-x4hq28oZC2iRt3','',1,NULL,0,NULL,'b1820b54-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (30,'PRM0000000029','PayPal :: Currency Code','PAYPAL_CURRENCY_CODE',4,1,'USD','',1,NULL,0,NULL,'b1820c44-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (31,'PRM0000000030','Social :: Twitter URL','SOCIAL_TWITTER_URL',2,1,'','',1,NULL,0,NULL,'b1820d2b-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (32,'PRM0000000031','Social :: Google Plus URL','SOCIAL_GOOGLEPLUS_URL',2,1,'','',1,NULL,0,NULL,'b1820e09-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (33,'PRM0000000032','Social :: YouTube URL','SOCIAL_YOUTUBE_URL',2,1,'','',1,NULL,0,NULL,'b1820ee7-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (34,'PRM0000000033','Social :: Pinterest URL','SOCIAL_PINTEREST_URL',2,1,'','',1,NULL,0,NULL,'b1820fc2-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (35,'PRM0000000034','Social :: LinkedIn URL','SOCIAL_LINKEDIN_URL',2,1,'','',1,NULL,0,NULL,'b18210a0-2fc8-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `PARAMETER` (`ID`, `REFID`, `NAME`, `CODE`, `ID_PARAMETER_GROUP`, `ID_PARAMETER_TYPE`, `VALUE`, `DESCRIPTION`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (36,'PRM0000000035','SMTP encryption (tls|ssl)','MAILER_SMTP_ENCRYPTION',1,1,'ssl','',1,NULL,0,NULL,'b182117e-2fc8-11e5-95d9-cc52af77857f');
/*!40000 ALTER TABLE `PARAMETER` ENABLE KEYS */;

--
-- Table structure for table `PARAMETER_GROUP`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `PARAMETER_GROUP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORDERING` tinyint(2) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARAMETER_GROUP`
--

/*!40000 ALTER TABLE `PARAMETER_GROUP` DISABLE KEYS */;
INSERT IGNORE INTO `PARAMETER_GROUP` (`ID`, `REFID`, `NAME`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (1,'PRG0000000001','System',1,1,NULL,0,NULL,'08dbc0d6-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `PARAMETER_GROUP` (`ID`, `REFID`, `NAME`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (2,'PRG0000000002','Social',1,1,NULL,0,NULL,'08dbc483-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `PARAMETER_GROUP` (`ID`, `REFID`, `NAME`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (3,'PRG0000000003','Sync',1,1,NULL,0,NULL,'08dbc5d5-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `PARAMETER_GROUP` (`ID`, `REFID`, `NAME`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (4,'PRG0000000004','Payment',1,1,NULL,0,NULL,'08dbc705-1a1a-11e5-b2f8-cc52af77857f');
/*!40000 ALTER TABLE `PARAMETER_GROUP` ENABLE KEYS */;

--
-- Table structure for table `PARAMETER_TYPE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `PARAMETER_TYPE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BASE_TYPE_CODE` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTRA` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORDERING` tinyint(2) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARAMETER_TYPE`
--

/*!40000 ALTER TABLE `PARAMETER_TYPE` DISABLE KEYS */;
INSERT IGNORE INTO `PARAMETER_TYPE` (`ID`, `REFID`, `NAME`, `BASE_TYPE_CODE`, `EXTRA`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (1,'PRT0000000001','Text','text','',1,1,NULL,0,NULL,'085c7e32-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `PARAMETER_TYPE` (`ID`, `REFID`, `NAME`, `BASE_TYPE_CODE`, `EXTRA`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (2,'PRT0000000002','Boolean','truefalse','',2,1,NULL,0,NULL,'085c8242-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `PARAMETER_TYPE` (`ID`, `REFID`, `NAME`, `BASE_TYPE_CODE`, `EXTRA`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (3,'PRT0000000003','Number','number','',4,1,NULL,0,NULL,'085c83ba-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `PARAMETER_TYPE` (`ID`, `REFID`, `NAME`, `BASE_TYPE_CODE`, `EXTRA`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (4,'PRT0000000004','Date','date','',5,1,NULL,0,NULL,'085c8515-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `PARAMETER_TYPE` (`ID`, `REFID`, `NAME`, `BASE_TYPE_CODE`, `EXTRA`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (5,'PRT0000000005','List (Simple)','listsimple','1|True,2|False,3|Fuzzy',6,1,NULL,0,NULL,'085c865a-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `PARAMETER_TYPE` (`ID`, `REFID`, `NAME`, `BASE_TYPE_CODE`, `EXTRA`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (6,'PRT0000000006','List (SQL)','listsql','SELECT LOGIN AS TITLE, ID AS VALUE FROM USER',8,1,NULL,0,NULL,'085c87ac-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `PARAMETER_TYPE` (`ID`, `REFID`, `NAME`, `BASE_TYPE_CODE`, `EXTRA`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (7,'PRT0000000007','List (Web Service)','listws','http://www.example.com/api/samplelist',9,1,NULL,0,NULL,'085c88fe-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `PARAMETER_TYPE` (`ID`, `REFID`, `NAME`, `BASE_TYPE_CODE`, `EXTRA`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (8,'PRT0000000008','HTML','html','',12,1,NULL,0,NULL,'085c8a32-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `PARAMETER_TYPE` (`ID`, `REFID`, `NAME`, `BASE_TYPE_CODE`, `EXTRA`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (9,'PRT0000000009','Checkbox','checkbox','',3,1,NULL,0,NULL,'085c8b6a-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `PARAMETER_TYPE` (`ID`, `REFID`, `NAME`, `BASE_TYPE_CODE`, `EXTRA`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (10,'PRT0000000010','Image','image','',10,1,NULL,0,NULL,'085c8caf-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `PARAMETER_TYPE` (`ID`, `REFID`, `NAME`, `BASE_TYPE_CODE`, `EXTRA`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (11,'PRT0000000011','File','file','',11,1,NULL,0,NULL,'085c8de3-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `PARAMETER_TYPE` (`ID`, `REFID`, `NAME`, `BASE_TYPE_CODE`, `EXTRA`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (12,'PRT0000000012','Password','password',NULL,13,1,NULL,0,NULL,'085c8f1f-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `PARAMETER_TYPE` (`ID`, `REFID`, `NAME`, `BASE_TYPE_CODE`, `EXTRA`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (13,'PRT0000000013','List (Reference)','listref','{\"datasource\":\"PROJECT_CATEGORY\",\"valuecol\":\"ID\",\"textcol\":\"NAME\"}',7,1,NULL,0,NULL,'085c905c-1a1a-11e5-b2f8-cc52af77857f');
/*!40000 ALTER TABLE `PARAMETER_TYPE` ENABLE KEYS */;

--
-- Table structure for table `RECYCLE_BIN`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `RECYCLE_BIN` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_TIME` datetime DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_MODULE` (`MODULE`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_ID_USER` (`ID_USER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RECYCLE_BIN`
--

/*!40000 ALTER TABLE `RECYCLE_BIN` DISABLE KEYS */;
/*!40000 ALTER TABLE `RECYCLE_BIN` ENABLE KEYS */;

--
-- Table structure for table `SCREEN`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `SCREEN` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_WORKFLOW` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UDID` int(11) DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uniquekey` (`CODE`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_CODE` (`CODE`),
  KEY `IDX_ID_WORKFLOW` (`ID_WORKFLOW`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCREEN`
--

/*!40000 ALTER TABLE `SCREEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCREEN` ENABLE KEYS */;

--
-- Table structure for table `SCREEN_FIELD`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `SCREEN_FIELD` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_SCREEN` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_VALUE_TYPE` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATASOURCE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUECOL` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEXTCOL` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_MANDATORY` tinyint(1) DEFAULT NULL,
  `ORDERING` smallint(2) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UDID` int(11) DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_CODE` (`CODE`),
  KEY `IDX_ID_SCREEN` (`ID_SCREEN`),
  KEY `IDX_ID_VALUE_TYPE` (`ID_VALUE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCREEN_FIELD`
--

/*!40000 ALTER TABLE `SCREEN_FIELD` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCREEN_FIELD` ENABLE KEYS */;

--
-- Table structure for table `USER`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `USER` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIRST_NAME` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHOTO` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GENDER` tinyint(1) DEFAULT NULL,
  `DATE_OF_BIRTH` date DEFAULT NULL,
  `FORCE_PASSWORD_CHANGE` tinyint(1) DEFAULT NULL,
  `IS_EMAIL_VERIFIED` tinyint(1) DEFAULT NULL,
  `FACEBOOK_ID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FACEBOOK_OAUTH_ID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GOOGLE_ID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GOOGLE_OAUTH_ID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `YAHOO_ID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `YAHOO_OAUTH_ID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_ENABLED` tinyint(1) DEFAULT NULL,
  `CREATION_DATE` datetime DEFAULT NULL,
  `LATEST_LOGIN` datetime DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT IGNORE INTO `USER` (`ID`, `REFID`, `FIRST_NAME`, `LAST_NAME`, `PHOTO`, `EMAIL`, `LOGIN`, `PASSWORD`, `PHONE`, `GENDER`, `DATE_OF_BIRTH`, `FORCE_PASSWORD_CHANGE`, `IS_EMAIL_VERIFIED`, `FACEBOOK_ID`, `FACEBOOK_OAUTH_ID`, `GOOGLE_ID`, `GOOGLE_OAUTH_ID`, `YAHOO_ID`, `YAHOO_OAUTH_ID`, `IS_ENABLED`, `CREATION_DATE`, `LATEST_LOGIN`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (1,'USR0000000001','Administratorx','','','vtq@vietmaisolutions.com','admin','3d9188577cc9bfe9291ac66b5cc872b7','',0,NULL,0,0,'','','','','','',1,NULL,'2015-07-21 11:47:48',1,NULL,1,NULL,'062ed3f9-1a1a-11e5-b2f8-cc52af77857f');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;

--
-- Table structure for table `USER_GROUP`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `USER_GROUP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_ID_DASHBOARD` int(11) DEFAULT NULL,
  `PARENT` int(11) DEFAULT NULL,
  `HIERACHY` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_DEFAULT_ID_DASHBOARD` (`DEFAULT_ID_DASHBOARD`),
  KEY `IDX_PARENT` (`PARENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP`
--

/*!40000 ALTER TABLE `USER_GROUP` DISABLE KEYS */;
INSERT IGNORE INTO `USER_GROUP` (`ID`, `REFID`, `NAME`, `DEFAULT_ID_DASHBOARD`, `PARENT`, `HIERACHY`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (1,'USG0000000001','Admin',1,NULL,'--',1,NULL,0,NULL,'072fbdc6-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `USER_GROUP` (`ID`, `REFID`, `NAME`, `DEFAULT_ID_DASHBOARD`, `PARENT`, `HIERACHY`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (2,'USG0000000002','Base User',2,NULL,'--',1,NULL,0,NULL,'072fc18c-1a1a-11e5-b2f8-cc52af77857f');
/*!40000 ALTER TABLE `USER_GROUP` ENABLE KEYS */;

--
-- Table structure for table `USER_LOG`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `USER_LOG` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `DATE_TIME` datetime DEFAULT NULL,
  `IP` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_ID_USER` (`ID_USER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_LOG`
--

/*!40000 ALTER TABLE `USER_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_LOG` ENABLE KEYS */;

--
-- Table structure for table `USER_MEMBERSHIP`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `USER_MEMBERSHIP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `ID_USER_GROUP` int(11) DEFAULT NULL,
  `ID_USER_ROLE` int(11) DEFAULT NULL,
  `VALID_FROM` datetime DEFAULT NULL,
  `VALID_UNTIL` datetime DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_ID_USER` (`ID_USER`),
  KEY `IDX_ID_USER_GROUP` (`ID_USER_GROUP`),
  KEY `IDX_ID_USER_ROLE` (`ID_USER_ROLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_MEMBERSHIP`
--

/*!40000 ALTER TABLE `USER_MEMBERSHIP` DISABLE KEYS */;
INSERT IGNORE INTO `USER_MEMBERSHIP` (`ID`, `REFID`, `ID_USER`, `ID_USER_GROUP`, `ID_USER_ROLE`, `VALID_FROM`, `VALID_UNTIL`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (1,'USM0000000001',1,1,NULL,NULL,NULL,1,NULL,0,NULL,'08c36700-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `USER_MEMBERSHIP` (`ID`, `REFID`, `ID_USER`, `ID_USER_GROUP`, `ID_USER_ROLE`, `VALID_FROM`, `VALID_UNTIL`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (2,'USM0000000002',1,2,NULL,NULL,NULL,1,NULL,0,NULL,'08c36ab9-1a1a-11e5-b2f8-cc52af77857f');
/*!40000 ALTER TABLE `USER_MEMBERSHIP` ENABLE KEYS */;

--
-- Table structure for table `USER_PREFERENCE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `USER_PREFERENCE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `ID_DASHBOARD` int(11) DEFAULT NULL,
  `ID_WALLPAPER` int(11) DEFAULT NULL,
  `ID_ADMIN_STYLE` int(11) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE` (`ID_USER`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_ID_DASHBOARD` (`ID_DASHBOARD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_PREFERENCE`
--

/*!40000 ALTER TABLE `USER_PREFERENCE` DISABLE KEYS */;
INSERT IGNORE INTO `USER_PREFERENCE` (`ID`, `REFID`, `ID_USER`, `ID_DASHBOARD`, `ID_WALLPAPER`, `ID_ADMIN_STYLE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (1,'USP0000000001',1,1,NULL,NULL,1,NULL,0,NULL,'08abded4-1a1a-11e5-b2f8-cc52af77857f');
/*!40000 ALTER TABLE `USER_PREFERENCE` ENABLE KEYS */;

--
-- Table structure for table `USER_ROLE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `USER_ROLE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE`
--

/*!40000 ALTER TABLE `USER_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ROLE` ENABLE KEYS */;

--
-- Table structure for table `VALUE_OPERATOR`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `VALUE_OPERATOR` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OPERATOR` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VALUE_OPERATOR`
--

/*!40000 ALTER TABLE `VALUE_OPERATOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `VALUE_OPERATOR` ENABLE KEYS */;

--
-- Table structure for table `VALUE_TYPE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `VALUE_TYPE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UDID` int(11) DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uniquekey` (`CODE`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VALUE_TYPE`
--

/*!40000 ALTER TABLE `VALUE_TYPE` DISABLE KEYS */;
INSERT IGNORE INTO `VALUE_TYPE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES (1,'VLT0000000001','Text','text',1,NULL,NULL,0,'1ab50bbe-125b-4fb3-ab76-ff49bf2fafaf');
INSERT IGNORE INTO `VALUE_TYPE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES (2,'VLT0000000002','Text area','textarea',1,NULL,NULL,0,'4325b078-fca4-4938-8483-2e6ad4e16a2a');
INSERT IGNORE INTO `VALUE_TYPE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES (3,'VLT0000000003','Number','number',1,NULL,NULL,0,'497b7ff7-12e2-4238-9830-675dd3722bf6');
INSERT IGNORE INTO `VALUE_TYPE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES (4,'VLT0000000004','Radio','radio',1,NULL,NULL,0,'7fb27f90-11fe-4ba3-b435-8c4df3bb283e');
INSERT IGNORE INTO `VALUE_TYPE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES (5,'VLT0000000005','Checkbox','checkbox',1,NULL,NULL,0,'9dd445a1-0574-4db2-9657-9ab47e930f20');
INSERT IGNORE INTO `VALUE_TYPE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES (6,'VLT0000000006','Refselect','refselect',1,NULL,NULL,0,'20b3212d-58e4-483d-85aa-ec466914b76a');
INSERT IGNORE INTO `VALUE_TYPE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES (7,'VLT0000000007','Date','date',1,NULL,NULL,0,'20b3212d-58e4-483d-85aa-ec466914b76b');
/*!40000 ALTER TABLE `VALUE_TYPE` ENABLE KEYS */;

--
-- Table structure for table `WORKFLOW`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `WORKFLOW` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `GUID` int(11) DEFAULT NULL,
  `WFID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uniquekey` (`CODE`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_CODE` (`CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKFLOW`
--

/*!40000 ALTER TABLE `WORKFLOW` DISABLE KEYS */;
/*!40000 ALTER TABLE `WORKFLOW` ENABLE KEYS */;

--
-- Table structure for table `WORKFLOW_APPLICATION`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `WORKFLOW_APPLICATION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_WORKFLOW` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UDID` int(11) DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE` (`MODULE`,`ID_WORKFLOW`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_MODULE` (`MODULE`),
  KEY `IDX_ID_WORKFLOW` (`ID_WORKFLOW`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKFLOW_APPLICATION`
--

/*!40000 ALTER TABLE `WORKFLOW_APPLICATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `WORKFLOW_APPLICATION` ENABLE KEYS */;

--
-- Table structure for table `WORKFLOW_LOG`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `WORKFLOW_LOG` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_WORKFLOW` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_WORKFLOW_TRANSITION` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OBJECT_ID` int(11) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `DETAILS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UDID` int(11) DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_ID_WORKFLOW` (`ID_WORKFLOW`),
  KEY `IDX_ID_WORKFLOW_TRANSITION` (`ID_WORKFLOW_TRANSITION`),
  KEY `IDX_MODULE` (`MODULE`),
  KEY `IDX_ID_USER` (`ID_USER`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKFLOW_LOG`
--

/*!40000 ALTER TABLE `WORKFLOW_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `WORKFLOW_LOG` ENABLE KEYS */;

--
-- Table structure for table `WORKFLOW_STAGE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `WORKFLOW_STAGE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_WORKFLOW` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_DEFAULT` tinyint(1) DEFAULT NULL,
  `IS_BINDING_OBJECT_EDITABLE` tinyint(1) DEFAULT NULL,
  `IS_BINDING_OBJECT_DELETABLE` tinyint(1) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UDID` int(11) DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_CODE` (`CODE`),
  KEY `IDX_ID_WORKFLOW` (`ID_WORKFLOW`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKFLOW_STAGE`
--

/*!40000 ALTER TABLE `WORKFLOW_STAGE` DISABLE KEYS */;
/*!40000 ALTER TABLE `WORKFLOW_STAGE` ENABLE KEYS */;

--
-- Table structure for table `WORKFLOW_TRANSITION`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `WORKFLOW_TRANSITION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_WORKFLOW` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_ID_WORKFLOW_STAGE` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `END_ID_WORKFLOW_STAGE` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTION` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_USER_GROUP` int(11) DEFAULT NULL,
  `ID_USER_ROLE` int(11) DEFAULT NULL,
  `TRANSITION_ID_SCREEN` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORDERING` tinyint(2) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `WFID` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UDID` int(11) DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_CODE` (`CODE`),
  KEY `IDX_ID_WORKFLOW` (`ID_WORKFLOW`),
  KEY `IDX_START_ID_WORKFLOW_STAGE` (`START_ID_WORKFLOW_STAGE`),
  KEY `IDX_END_ID_WORKFLOW_STAGE` (`END_ID_WORKFLOW_STAGE`),
  KEY `IDX_ID_USER_GROUP` (`ID_USER_GROUP`),
  KEY `IDX_ID_USER_ROLE` (`ID_USER_ROLE`),
  KEY `IDX_TRANSITION_ID_SCREEN` (`TRANSITION_ID_SCREEN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKFLOW_TRANSITION`
--

/*!40000 ALTER TABLE `WORKFLOW_TRANSITION` DISABLE KEYS */;
/*!40000 ALTER TABLE `WORKFLOW_TRANSITION` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000001', '1', 'user', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b445ada4-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000001', '1', 'valueoperator', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', '05136581-2f97-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000002', '1', 'conditionoperator', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', '05169b20-2f97-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000002', '1', 'field', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b445e011-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000003', '1', 'screen', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44607ea-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000004', '1', 'option', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44632ec-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000005', '1', 'acltype', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b446618a-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000006', '1', 'workflow', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44688b4-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000007', '1', 'userlog', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b446ae3f-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000008', '1', 'parameter', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b446d0f3-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000009', '1', 'userrole', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b446f98c-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000010', '1', 'dashboard', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b449230e-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000011', '1', 'fieldacl', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b4495df7-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000012', '1', 'adminmenu', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44991f2-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000013', '1', 'usergroup', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b449b307-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000014', '1', 'objectacl', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b449cef7-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000015', '1', 'valuetype', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b449eb91-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000016', '1', 'changelog', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44a05c4-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000018', '1', 'recyclebin', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44a41dd-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000019', '1', 'adminlabel', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44a6404-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000020', '1', 'adminfilter', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44a8197-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000021', '1', 'screenfield', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44aa1d6-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000022', '1', 'workflowlog', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44abc85-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000023', '1', 'accessright', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44aeb27-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000024', '1', 'adminmodule', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44b1747-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000025', '1', 'workflowstage', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44b4025-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000026', '1', 'parametertype', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44b65ac-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000027', '1', 'adminlanguage', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44b8d63-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000028', '1', 'adminsequence', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44bb154-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000029', '1', 'userpreference', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44bd906-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000030', '1', 'parametergroup', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44c0214-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000031', '1', 'usermembership', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44c2447-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000032', '1', 'adminmenuitem', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44c5d74-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000034', '1', 'workflowtransition', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44cb5c1-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000035', '1', 'adminlanguageitem', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44cdde8-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000036', '1', 'workflowapplication', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'b44d0a8c-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000077', '1', 'adminfiltercondition', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'fae3bb11-2720-11e5-9ed7-cc52af77857f');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000239', 'All', 'user', 'FIRST_NAME,LAST_NAME,PHOTO,EMAIL,LOGIN,PHONE,IS_ENABLED', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000242', 'All', 'field', 'NAME,MODULE,COLUMN,TOOLTIP,IS_EXCLUDED', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000244', 'All', 'option', 'NAME,CODE,VALUE,CONTEXT', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000245', 'All', 'screen', 'TITLE,ID_WORKFLOW,CODE', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000250', 'All', 'userlog', 'ID_USER,DATE_TIME,IP', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000251', 'All', 'workflow', 'NAME,CODE', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000252', 'All', 'acltype', 'NAME,ORDERING', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000253', 'All', 'fieldacl', 'MODULE,ACTION,ID_USER_GROUP,ID_USER,ID_ACL_TYPE', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000254', 'All', 'parameter', 'NAME,CODE,VALUE', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000258', 'All', 'dashboard', 'NAME,ID_ADMIN_MENU,ID_DASHBOARD_LAYOUT,DASHBOARD_FILE_PATH', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000259', 'All', 'userrole', 'NAME', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000260', 'All', 'adminmenu', 'NAME,ORDERING,IS_ENABLED', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000261', 'All', 'valuetype', 'NAME,CODE', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000262', 'All', 'objectacl', 'MODULE,OBJECT_ID,ID_USER_GROUP,ID_USER,ARG_ID_USER_GROUP,ARG_ID_USER,ID_ACL_TYPE', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000264', 'All', 'usergroup', 'NAME,DEFAULT_ID_DASHBOARD', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000265', 'All', 'changelog', 'ACTION,ITEM,MODULE,DATE_TIME,ID_USER', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000268', 'All', 'adminlabel', 'LABEL', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000271', 'All', 'recyclebin', 'ITEM,MODULE,DATE_TIME,ID_USER', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000273', 'All', 'workflowlog', 'ID_WORKFLOW,ID_WORKFLOW_TRANSITION,MODULE,OBJECT_ID,DATE,ID_USER', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000276', 'All', 'screenfield', 'ID_SCREEN,TITLE,CODE,ID_VALUE_TYPE,DATASOURCE,VALUECOL,ORDERING', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000280', 'All', 'adminmodule', 'NAME,MODULE,PREFIX,AVAILABLE_ACTIONS,IS_COMMENT_ENABLED', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000281', 'All', 'adminfilter', 'NAME,MODULE,COLUMNS,IS_DEFAULT', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000283', 'All', 'accessright', 'ID_USER_GROUP,MODULE,ACTIONS', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000290', 'All', 'adminlanguage', 'NAME,CODE', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000292', 'All', 'workflowstage', 'ID_WORKFLOW,NAME,CODE,IS_DEFAULT,IS_BINDING_OBJECT_EDITABLE,IS_BINDING_OBJECT_DELETABLE', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000293', 'All', 'valueoperator', 'NAME,OPERATOR', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000294', 'All', 'adminsequence', 'MODULE,SEQUENCE_FORMAT,CURRENT_VALUE,SEQUENCE_STEP', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000296', 'All', 'parametertype', 'NAME,BASE_TYPE_CODE,EXTRA,ORDERING', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000297', 'All', 'userpreference', 'ID_USER,ID_DASHBOARD,ID_WALLPAPER,ID_ADMIN_STYLE', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000299', 'All', 'parametergroup', 'NAME,ORDERING', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000300', 'All', 'adminmenuitem', 'NAME,MODULE,ORDERING,ENABLE_LEFT,ENABLE_TOP,ENABLE_QUICK,ENABLE_ALL', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000301', 'All', 'usermembership', 'ID_USER,ID_USER_GROUP,ID_USER_ROLE,VALID_FROM,VALID_UNTIL', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000307', 'All', 'conditionoperator', 'NAME,OPERATOR', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000312', 'All', 'workflowtransition', 'ID_WORKFLOW,NAME,CODE,START_ID_WORKFLOW_STAGE,END_ID_WORKFLOW_STAGE,TRANSITION_ID_SCREEN,ORDERING', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000313', 'All', 'adminlanguageitem', 'ID_ADMIN_LANGUAGE,ID_ADMIN_LABEL', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000314', 'All', 'workflowapplication', 'MODULE,ID_WORKFLOW', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000000316', 'All', 'adminfiltercondition', 'ID_ADMIN_FILTER,ID_FIELD,ID_VALUE_OPERATOR,VALUE,ID_CONDITION_OPERATOR', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Acl type', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Action', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Actions', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Admin filter', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Admin label', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Admin language', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Admin menu', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Admin style', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Arg user group', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Arg user', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Available actions', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Base type code', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Binding object deletable?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Binding object editable?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Code', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Column', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Columns', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Comment enabled?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Condition operator', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Condition', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Context', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Creation date', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Current value', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Dashboard file path', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Dashboard layout', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Dashboard', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Datasource', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Date of birth', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Date time', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Date', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Default dashboard', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Default?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Description', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Details', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Email verified?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Email', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Enable all?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Enable left?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Enable quick?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Enable settings?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Enable top?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Enabled?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('End workflow stage', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Excluded?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Extra', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Facebook oauth', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Facebook', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Field', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Fields', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('First name', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Font awesome icon', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Force password change?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Gender', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Google oauth', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Google', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('IP', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Item', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Label', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Last name', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Latest login', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Login', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Mandatory?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Module', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Name', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Object', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Open in new window', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Operator', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Parameter group', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Parameter type', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Parent', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Password', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Path', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Phone', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Photo', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Prefix', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Screen', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Sequence format', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Sequence step', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Starred?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Start workflow stage', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Textcol', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Tooltip', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Transition screen', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Translation', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('User group', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('User role', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('User', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Valid from', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Valid until', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Value operator', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Value type', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Value', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Valuecol', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Wallpaper', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Workflow transition', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Workflow', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Yahoo oauth', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Yahoo', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Acl type'), 'Acl type', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Action'), 'Action', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Actions'), 'Actions', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Admin filter'), 'Admin filter', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Admin label'), 'Admin label', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Admin language'), 'Admin language', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Admin menu'), 'Admin menu', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Admin style'), 'Admin style', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Arg user group'), 'Arg user group', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Arg user'), 'Arg user', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Available actions'), 'Available actions', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Base type code'), 'Base type code', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Binding object deletable?'), 'Binding object deletable?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Binding object editable?'), 'Binding object editable?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Code'), 'Code', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Column'), 'Column', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Columns'), 'Columns', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Comment enabled?'), 'Comment enabled?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Condition operator'), 'Condition operator', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Condition'), 'Condition', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Context'), 'Context', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Creation date'), 'Creation date', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Current value'), 'Current value', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Dashboard file path'), 'Dashboard file path', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Dashboard layout'), 'Dashboard layout', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Dashboard'), 'Dashboard', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Datasource'), 'Datasource', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Date of birth'), 'Date of birth', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Date time'), 'Date time', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Date'), 'Date', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Default dashboard'), 'Default dashboard', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Default?'), 'Default?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Description'), 'Description', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Details'), 'Details', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Email verified?'), 'Email verified?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Email'), 'Email', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Enable all?'), 'Enable all??', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Enable left?'), 'Enable left??', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Enable quick?'), 'Enable quick??', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Enable settings?'), 'Enable settings??', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Enable top?'), 'Enable top??', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Enabled?'), 'Enabled?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'End workflow stage'), 'End workflow stage', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Excluded?'), 'Excluded?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Extra'), 'Extra', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Facebook oauth'), 'Facebook oauth', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Facebook'), 'Facebook', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Field'), 'Field', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Fields'), 'Fields', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'First name'), 'First name', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Font awesome icon'), 'Font awesome icon', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Force password change?'), 'Force password change??', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Gender'), 'Gender', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Google oauth'), 'Google oauth', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Google'), 'Google', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'IP'), 'IP', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Item'), 'Item', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Label'), 'Label', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Last name'), 'Last name', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Latest login'), 'Latest login', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Login'), 'Login', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Mandatory?'), 'Mandatory?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Module'), 'Module', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Name'), 'Name', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Object'), 'Object', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Open in new window'), 'Open in new window', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Operator'), 'Operator', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Parameter group'), 'Parameter group', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Parameter type'), 'Parameter type', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Parent'), 'Parent', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Password'), 'Password', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Path'), 'Path', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Phone'), 'Phone', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Photo'), 'Photo', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Prefix'), 'Prefix', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Screen'), 'Screen', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Sequence format'), 'Sequence format', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Sequence step'), 'Sequence step', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Starred?'), 'Starred?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Start workflow stage'), 'Start workflow stage', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Textcol'), 'Textcol', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Title'), 'Title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Tooltip'), 'Tooltip', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Transition screen'), 'Transition screen', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Translation'), 'Translation', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'User group'), 'User group', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'User role'), 'User role', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'User'), 'User', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Valid from'), 'Valid from', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Valid until'), 'Valid until', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Value operator'), 'Value operator', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Value type'), 'Value type', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Value'), 'Value', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Valuecol'), 'Valuecol', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Wallpaper'), 'Wallpaper', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Workflow transition'), 'Workflow transition', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Workflow'), 'Workflow', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Yahoo oauth'), 'Yahoo oauth', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Yahoo'), 'Yahoo', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000001', 'Value Operators', '1', '0', 'valueoperator', '', 'fa-file-archive-o', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '0db199fc-2f97-11e5-95d9-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000002', 'Condition Operators', '1', '0', 'conditionoperator', '', 'fa-arrow-circle-o-right', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '0e6266e7-2f97-11e5-95d9-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000081', 'Users', '1', '0', 'user', '', 'fa-moon-o', '0', '0', '0', '0', '1', '', '', '99', '1', '', '0', '', 'c49b11e6-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000086', 'Fields', '1', '0', 'field', '', 'fa-tag', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c49dcb68-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000087', 'Screens', '1', '0', 'screen', '', 'fa-thumbs-o-up', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c49e0418-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000088', 'Options', '1', '0', 'option', '', 'fa-sort-amount-asc', '1', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c49e3864-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000093', 'Workflows', '1', '0', 'workflow', '', 'fa-wifi', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c49f1825-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000094', 'Acl Types', '1', '0', 'acltype', '', 'fa-text-width', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c49f44f5-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000095', 'User Logs', '1', '0', 'userlog', '', 'fa-git', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c49f72e7-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000096', 'User Roles', '1', '0', 'userrole', '', 'fa-file-text-o', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c49fa1ef-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000099', 'Parameters', '1', '0', 'parameter', '', 'fa-external-link-square', '1', '0', '0', '0', '1', '', '', '99', '1', '', '0', '', 'c4a02a0a-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000100', 'Field Acls', '1', '0', 'fieldacl', '', 'fa-jsfiddle', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4a05834-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000102', 'Dashboards', '1', '0', 'dashboard', '', 'fa-th-large', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4a4f08f-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000104', 'User Groups', '1', '0', 'usergroup', '', 'fa-css3', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4a53335-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000106', 'Object Acls', '1', '0', 'objectacl', '', 'fa-paperclip', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4a56d5e-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000107', 'Value Types', '1', '0', 'valuetype', '', 'fa-file-o', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4a58b0f-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000108', 'Admin Menus', '1', '0', 'adminmenu', '', 'fa-bell-slash', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4a5a854-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000109', 'Change Logs', '1', '0', 'changelog', '', 'fa-sun-o', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4a5c589-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000110', 'Admin Labels', '1', '0', 'adminlabel', '', 'fa-chevron-circle-up', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4a5e331-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000114', 'Recycle Bins', '1', '0', 'recyclebin', '', 'fa-trophy', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4a658b3-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000116', 'Screen Fields', '1', '0', 'screenfield', '', 'fa-mobile', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4a695eb-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000118', 'Workflow Logs', '1', '0', 'workflowlog', '', 'fa-chain-broken', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4a6db12-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000123', 'Admin Modules', '1', '0', 'adminmodule', '', 'fa-facebook', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4a77a88-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000125', 'Admin Filters', '1', '0', 'adminfilter', '', 'fa-quote-left', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4a7bb7e-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000126', 'Access Rights', '1', '0', 'accessright', '', 'fa-sort-amount-desc', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4a7dc68-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000134', 'Workflow Stages', '1', '0', 'workflowstage', '', 'fa-youtube-square', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4a8e3cb-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000135', 'Admin Languages', '1', '0', 'adminlanguage', '', 'fa-wifi', '0', '0', '0', '0', '1', '', '', '99', '1', '', '0', '', 'c4a903ac-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000137', 'Admin Sequences', '1', '0', 'adminsequence', '', 'fa-volume-off', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4a94bfb-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000138', 'Parameter Types', '1', '0', 'parametertype', '', 'fa-stack-overflow', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4a96bbf-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000139', 'User Preferences', '1', '0', 'userpreference', '', 'fa-openid', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4a98bac-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000141', 'Admin Menu Items', '1', '0', 'adminmenuitem', '', 'fa-folder', '0', '0', '0', '0', '1', '', '', '99', '1', '', '0', '', 'c4a9e040-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000142', 'Parameter Groups', '1', '0', 'parametergroup', '', 'fa-arrow-circle-right', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4aa05a0-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000143', 'User Memberships', '1', '0', 'usermembership', '', 'fa-truck', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4aa280f-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000153', 'Workflow Transitions', '1', '0', 'workflowtransition', '', 'fa-random', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4acbbe8-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000154', 'Admin Language Items', '1', '0', 'adminlanguageitem', '', 'fa-angle-up', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4aceb13-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000155', 'Workflow Applications', '1', '0', 'workflowapplication', '', 'fa-h-square', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4ad1469-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000157', 'Admin Filter Conditions', '1', '0', 'adminfiltercondition', '', 'fa-cc-discover', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c4ad6048-2f53-11e5-8947-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000001', 'User', 'user', 'USR', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'e61d6459-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000001', 'Value Operator', 'valueoperator', 'VLO', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '050b21e5-2f97-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000002', 'Condition Operator', 'conditionoperator', 'CNO', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '050dd55b-2f97-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000002', 'Field', 'field', 'FLD', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b4415df5-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000003', 'Screen', 'screen', 'SCR', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b441826a-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000004', 'Option', 'option', 'OPT', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b441b219-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000005', 'Acl Type', 'acltype', 'ACT', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b441df60-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000006', 'Workflow', 'workflow', 'WRK', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b442048d-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000007', 'User Log', 'userlog', 'USL', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b4421df3-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000008', 'Parameter', 'parameter', 'PRM', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b44237b6-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000009', 'User Role', 'userrole', 'USE', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b4425258-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000010', 'Dashboard', 'dashboard', 'DSH', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b4426d25-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000011', 'Field Acl', 'fieldacl', 'FLA', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b44286d7-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000012', 'Admin Menu', 'adminmenu', 'ADM', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b442a012-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000013', 'User Group', 'usergroup', 'USG', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b442b9a7-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000014', 'Object Acl', 'objectacl', 'OBA', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b442d3af-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000015', 'Value Type', 'valuetype', 'VLT', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b442ec98-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000016', 'Change Log', 'changelog', 'CHL', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b443067a-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000018', 'Recycle Bin', 'recyclebin', 'RCB', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b4433fb3-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000019', 'Admin Label', 'adminlabel', 'ADL', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b44358ea-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000020', 'Admin Filter', 'adminfilter', 'ADF', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b44372e9-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000021', 'Screen Field', 'screenfield', 'SCF', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b4438e29-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000022', 'Workflow Log', 'workflowlog', 'WRL', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b443a8f2-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000023', 'Access Right', 'accessright', 'ACR', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b443c2fe-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000024', 'Admin Module', 'adminmodule', 'ADD', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b443df65-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000025', 'Workflow Stage', 'workflowstage', 'WRS', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b443fafb-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000026', 'Parameter Type', 'parametertype', 'PRT', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b4441600-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000027', 'Admin Language', 'adminlanguage', 'ADN', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b444307b-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000028', 'Admin Sequence', 'adminsequence', 'ADS', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b4444a47-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000029', 'User Preference', 'userpreference', 'USP', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b4446587-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000030', 'Parameter Group', 'parametergroup', 'PRG', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b4448058-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000031', 'User Membership', 'usermembership', 'USM', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b4449bcc-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000032', 'Admin Menu Item', 'adminmenuitem', 'AMI', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b444bc43-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000034', 'Workflow Transition', 'workflowtransition', 'WRT', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b444f5d2-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000035', 'Admin Language Item', 'adminlanguageitem', 'ALI', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b44511ec-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000036', 'Workflow Application', 'workflowapplication', 'WRA', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b4452e87-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000077', 'Admin Filter Condition', 'adminfiltercondition', 'AFC', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'fae16b05-2720-11e5-9ed7-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000001', 'user', 'USRxxxxxxxxxx', 'USR0000000000', '1', '1', '', '0', '', '5db08bc7-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000006', 'field', 'FLDxxxxxxxxxx', 'FLD0000000008', '1', '1', '', '0', '', '5db1af40-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000007', 'screen', 'SCRxxxxxxxxxx', 'SCR0000000000', '1', '1', '', '0', '', '5db1d6bb-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000008', 'option', 'OPTxxxxxxxxxx', 'OPT0000000000', '1', '1', '', '0', '', '5db1fb92-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000013', 'workflow', 'WRKxxxxxxxxxx', 'WRK0000000000', '1', '1', '', '0', '', '5db2b282-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000014', 'acltype', 'ACTxxxxxxxxxx', 'ACT0000000000', '1', '1', '', '0', '', '5db2d7e6-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000015', 'userlog', 'USLxxxxxxxxxx', 'USL0000000002', '1', '1', '', '0', '', '5db2fcfe-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000016', 'userrole', 'USExxxxxxxxxx', 'USE0000000000', '1', '1', '', '0', '', '5db330c0-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000019', 'parameter', 'PRMxxxxxxxxxx', 'PRM0000000035', '1', '1', '', '0', '', '5db3cfba-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000020', 'fieldacl', 'FLAxxxxxxxxxx', 'FLA0000000237', '1', '1', '', '0', '', '5db40507-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000022', 'dashboard', 'DSHxxxxxxxxxx', 'DSH0000000000', '1', '1', '', '0', '', '5db55da5-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000024', 'usergroup', 'USGxxxxxxxxxx', 'USG0000000000', '1', '1', '', '0', '', '5db5cfc3-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000026', 'objectacl', 'OBAxxxxxxxxxx', 'OBA0000000185', '1', '1', '', '0', '', '5db63b31-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000027', 'valuetype', 'VLTxxxxxxxxxx', 'VLT0000000000', '1', '1', '', '0', '', '5db67556-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000028', 'adminmenu', 'ADMxxxxxxxxxx', 'ADM0000000000', '1', '1', '', '0', '', '5db6af18-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000029', 'changelog', 'CHLxxxxxxxxxx', 'CHL0000000002', '1', '1', '', '0', '', '5db6e56e-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000030', 'adminlabel', 'ADLxxxxxxxxxx', 'ADL0000001040', '1', '1', '', '0', '', '5db71986-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000034', 'recyclebin', 'RCBxxxxxxxxxx', 'RCB0000000000', '1', '1', '', '0', '', '5db7d8f3-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000036', 'screenfield', 'SCFxxxxxxxxxx', 'SCF0000000000', '1', '1', '', '0', '', '5db835a5-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000038', 'workflowlog', 'WRLxxxxxxxxxx', 'WRL0000000000', '1', '1', '', '0', '', '5db89979-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000043', 'adminmodule', 'ADDxxxxxxxxxx', 'ADD0000000002', '1', '1', '', '0', '', '5db9b3ec-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000045', 'adminfilter', 'ADFxxxxxxxxxx', 'ADF0000000316', '1', '1', '', '0', '', '5dba1a7a-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000046', 'accessright', 'ACRxxxxxxxxxx', 'ACR0000000002', '1', '1', '', '0', '', '5dba4bfb-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000054', 'workflowstage', 'WRSxxxxxxxxxx', 'WRS0000000000', '1', '1', '', '0', '', '5dbc0ea1-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000055', 'adminlanguage', 'ADNxxxxxxxxxx', 'ADN0000000000', '1', '1', '', '0', '', '5dbc442d-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000057', 'adminsequence', 'ADSxxxxxxxxxx', 'ADS0000000079', '1', '1', '', '0', '', '5dbcb7e1-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000058', 'parametertype', 'PRTxxxxxxxxxx', 'PRT0000000000', '1', '1', '', '0', '', '5dbce7d9-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000059', 'userpreference', 'USPxxxxxxxxxx', 'USP0000000000', '1', '1', '', '0', '', '5dbd17b7-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000061', 'adminmenuitem', 'AMIxxxxxxxxxx', 'AMI0000000002', '1', '1', '', '0', '', '5dbd8028-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000062', 'parametergroup', 'PRGxxxxxxxxxx', 'PRG0000000000', '1', '1', '', '0', '', '5dbdae9f-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000063', 'usermembership', 'USMxxxxxxxxxx', 'USM0000000000', '1', '1', '', '0', '', '5dbde89e-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000073', 'workflowtransition', 'WRTxxxxxxxxxx', 'WRT0000000000', '1', '1', '', '0', '', '5dbff979-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000074', 'adminlanguageitem', 'ALIxxxxxxxxxx', 'ALI0000004160', '1', '1', '', '0', '', '5dc02738-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000075', 'workflowapplication', 'WRAxxxxxxxxxx', 'WRA0000000001', '1', '1', '', '0', '', '5dc0550d-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000077', 'adminfiltercondition', 'AFCxxxxxxxxxx', 'AFC0000000000', '1', '1', '', '0', '', '5dc0c6cc-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000078', 'valueoperator', 'VLOxxxxxxxxxx', 'VLO0000000000', '1', '1', '', '0', '', '050b3900-2f97-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000079', 'conditionoperator', 'CNOxxxxxxxxxx', 'CNO0000000000', '1', '1', '', '0', '', '050de9e9-2f97-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000001', 'user', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb4db05b-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000002', 'user', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb4dca16-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000003', 'user', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb4de290-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000016', 'field', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb4f202a-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000017', 'field', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb4f3448-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000018', 'field', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb4f484c-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000019', 'screen', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb4f5c07-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000020', 'screen', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb4f6f4f-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000021', 'screen', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb4f8335-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000022', 'option', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb4f96a4-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000023', 'option', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb4fabdc-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000024', 'option', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb4fbf8f-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000037', 'workflow', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb542ee1-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000038', 'workflow', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb544419-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000039', 'workflow', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb5458af-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000040', 'acltype', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb546c80-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000041', 'acltype', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb548151-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000042', 'acltype', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb5495bc-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000043', 'userlog', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb54a9af-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000044', 'userlog', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb54be92-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000045', 'userlog', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb54d2c5-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000046', 'userrole', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb54e6a2-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000047', 'userrole', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb54fac0-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000048', 'userrole', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb550fdf-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000055', 'parameter', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb55d280-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000056', 'parameter', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb55e834-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000057', 'parameter', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb55fcf9-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000058', 'fieldacl', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb5611b5-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000059', 'fieldacl', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb56258a-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000060', 'fieldacl', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb563a4f-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000064', 'dashboard', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb56a96a-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000065', 'dashboard', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb56c3aa-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000066', 'dashboard', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb56dc97-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000070', 'usergroup', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb57400e-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000071', 'usergroup', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb57581d-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000072', 'usergroup', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb577344-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000076', 'objectacl', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb57c638-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000077', 'objectacl', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb57db68-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000078', 'objectacl', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb57f08a-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000079', 'valuetype', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb5804ed-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000080', 'valuetype', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb58207a-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000081', 'valuetype', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb5835a1-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000082', 'adminmenu', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb584b48-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000083', 'adminmenu', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb585fbb-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000084', 'adminmenu', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb587440-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000085', 'changelog', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb58886f-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000086', 'changelog', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb589d11-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000087', 'changelog', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb58b1b3-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000088', 'adminlabel', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb58d49f-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000089', 'adminlabel', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb58e841-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000090', 'adminlabel', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb58fd63-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000100', 'recyclebin', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb59f4b3-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000101', 'recyclebin', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb5a152a-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000102', 'recyclebin', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb5a352d-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000106', 'screenfield', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb5a91bd-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000107', 'screenfield', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb5aa3e6-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000108', 'screenfield', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb5ab58b-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000112', 'workflowlog', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb5afdb0-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000113', 'workflowlog', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb5b106f-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000114', 'workflowlog', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb5b225c-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000127', 'adminmodule', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb5c1bf2-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000128', 'adminmodule', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb5c2f47-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000129', 'adminmodule', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb5c41f9-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000133', 'adminfilter', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb5c8ca0-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000134', 'adminfilter', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb5c9e9a-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000135', 'adminfilter', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb5cb1d1-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000136', 'accessright', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb5cc458-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000137', 'accessright', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb5cd634-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000138', 'accessright', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb5ce804-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000160', 'workflowstage', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb5eb4a3-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000161', 'workflowstage', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb5ecef0-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000162', 'workflowstage', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb5ee2f8-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000163', 'adminlanguage', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb5ef57f-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000164', 'adminlanguage', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb5f07d4-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000165', 'adminlanguage', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb5f1a5b-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000169', 'adminsequence', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb5f646c-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000170', 'adminsequence', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb5f9726-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000171', 'adminsequence', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb5fa9fe-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000172', 'parametertype', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb5fbe0f-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000173', 'parametertype', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb5fd1b1-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000174', 'parametertype', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb5fe45b-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000175', 'userpreference', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb5ff7e3-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000176', 'userpreference', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb600f7f-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000177', 'userpreference', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb6027ce-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000181', 'adminmenuitem', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb60867d-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000182', 'adminmenuitem', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb609e91-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000183', 'adminmenuitem', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb60b6fe-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000184', 'parametergroup', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb60ceb3-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000185', 'parametergroup', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb60e73a-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000186', 'parametergroup', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb60ffa3-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000187', 'usermembership', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb61174c-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000188', 'usermembership', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb6130d8-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000189', 'usermembership', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb6148e7-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000217', 'workflowtransition', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb63ee9c-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000218', 'workflowtransition', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb64062b-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000219', 'workflowtransition', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb641e43-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000220', 'adminlanguageitem', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb643623-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000221', 'adminlanguageitem', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb644dae-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000222', 'adminlanguageitem', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb6467e5-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000223', 'workflowapplication', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb6481b5-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000224', 'workflowapplication', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb649af4-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000225', 'workflowapplication', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb64ca85-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000229', 'adminfiltercondition', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb652b18-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000230', 'adminfiltercondition', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb654211-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000231', 'adminfiltercondition', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb6557d2-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000232', 'valueoperator', 'view', '2', '', '*', '1', '1', '', '0', '', '0542451b-2f97-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000233', 'valueoperator', 'edit', '2', '', '*', '1', '1', '', '0', '', '05427a63-2f97-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000234', 'valueoperator', 'new', '2', '', '*', '1', '1', '', '0', '', '05429194-2f97-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000235', 'conditionoperator', 'view', '2', '', '*', '1', '1', '', '0', '', '0545a0db-2f97-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000236', 'conditionoperator', 'edit', '2', '', '*', '1', '1', '', '0', '', '0545b6e9-2f97-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000237', 'conditionoperator', 'new', '2', '', '*', '1', '1', '', '0', '', '0545ceb8-2f97-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000001', 'Refid', 'conditionoperator', 'REFID', '', '', '1', '', '0', '', '17123d11-2f96-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000001', 'Refid', 'user', 'REFID', '', '', '1', '', '0', '', '880d3d9b-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000002', 'First name', 'user', 'FIRST_NAME', '', '', '1', '', '0', '', '880d4f44-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000002', 'Name', 'conditionoperator', 'NAME', '', '', '1', '', '0', '', '17126182-2f96-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000003', 'Last name', 'user', 'LAST_NAME', '', '', '1', '', '0', '', '880d61e6-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000003', 'Operator', 'conditionoperator', 'OPERATOR', '', '', '1', '', '0', '', '17128722-2f96-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000004', 'Json', 'conditionoperator', 'JSON', '', '', '1', '', '0', '', '1712b135-2f96-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000004', 'Photo', 'user', 'PHOTO', '', '', '1', '', '0', '', '880d72a3-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000005', 'Email', 'user', 'EMAIL', '', '', '1', '', '0', '', '880d7fd6-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000005', 'Refid', 'valueoperator', 'REFID', '', '', '1', '', '0', '', '174151c4-2f96-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000006', 'Login', 'user', 'LOGIN', '', '', '1', '', '0', '', '880d8d74-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000006', 'Name', 'valueoperator', 'NAME', '', '', '1', '', '0', '', '17416c6b-2f96-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000007', 'Operator', 'valueoperator', 'OPERATOR', '', '', '1', '', '0', '', '174186ea-2f96-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000007', 'Password', 'user', 'PASSWORD', '', '', '1', '', '0', '', '880d9b3d-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000008', 'Json', 'valueoperator', 'JSON', '', '', '1', '', '0', '', '1741a018-2f96-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000008', 'Phone', 'user', 'PHONE', '', '', '1', '', '0', '', '880da852-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000009', 'Gender', 'user', 'GENDER', '', '', '1', '', '0', '', '880db567-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000010', 'Date of birth', 'user', 'DATE_OF_BIRTH', '', '', '1', '', '0', '', '880dc2b4-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000011', 'Force password change?', 'user', 'FORCE_PASSWORD_CHANGE', '', '', '1', '', '0', '', '880dd66b-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000012', 'Email verified?', 'user', 'IS_EMAIL_VERIFIED', '', '', '1', '', '0', '', '880de70b-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000013', 'Facebook', 'user', 'FACEBOOK_ID', '', '', '1', '', '0', '', '880dfaba-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000014', 'Facebook oauth', 'user', 'FACEBOOK_OAUTH_ID', '', '', '1', '', '0', '', '880e0c09-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000015', 'Google', 'user', 'GOOGLE_ID', '', '', '1', '', '0', '', '880e1cc7-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000016', 'Google oauth', 'user', 'GOOGLE_OAUTH_ID', '', '', '1', '', '0', '', '880e2c88-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000017', 'Yahoo', 'user', 'YAHOO_ID', '', '', '1', '', '0', '', '880e3e76-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000018', 'Yahoo oauth', 'user', 'YAHOO_OAUTH_ID', '', '', '1', '', '0', '', '880e4e84-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000019', 'Enabled?', 'user', 'IS_ENABLED', '', '', '1', '', '0', '', '880e5ee4-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000020', 'Creation date', 'user', 'CREATION_DATE', '', '', '1', '', '0', '', '880e6e83-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000021', 'Latest login', 'user', 'LATEST_LOGIN', '', '', '1', '', '0', '', '880e7e6f-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000022', 'Refid', 'field', 'REFID', '', '', '1', '', '0', '', '880e9095-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000023', 'Name', 'field', 'NAME', '', '', '1', '', '0', '', '880e9fcd-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000024', 'Module', 'field', 'MODULE', '', '', '1', '', '0', '', '880eaef5-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000025', 'Column', 'field', 'COLUMN', '', '', '1', '', '0', '', '880ebe3e-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000026', 'Tooltip', 'field', 'TOOLTIP', '', '', '1', '', '0', '', '880ecd80-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000027', 'Excluded?', 'field', 'IS_EXCLUDED', '', '', '1', '', '0', '', '880edd9b-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000028', 'Refid', 'option', 'REFID', '', '', '1', '', '0', '', '880eef44-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000029', 'Name', 'option', 'NAME', '', '', '1', '', '0', '', '880efe9a-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000030', 'Code', 'option', 'CODE', 'This is an edit-once field. Its value cannot be modified afterward.', '', '1', '', '0', '', '880f0de8-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000031', 'Value', 'option', 'VALUE', '', '', '1', '', '0', '', '880f1ca9-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000032', 'Context', 'option', 'CONTEXT', '', '', '1', '', '0', '', '880f2be6-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000033', 'Refid', 'userlog', 'REFID', '', '', '1', '', '0', '', '880f3da5-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000034', 'User', 'userlog', 'ID_USER', '', '', '1', '', '0', '', '880f4cf7-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000035', 'Date time', 'userlog', 'DATE_TIME', '', '', '1', '', '0', '', '880f5c89-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000036', 'IP', 'userlog', 'IP', '', '', '1', '', '0', '', '880f6cc7-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000037', 'Refid', 'acltype', 'REFID', '', '', '1', '', '0', '', '881b4800-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000038', 'Name', 'acltype', 'NAME', '', '', '1', '', '0', '', '881b6bf5-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000039', 'Ordering', 'acltype', 'ORDERING', '', '', '1', '', '0', '', '881b8ed0-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000040', 'Refid', 'userrole', 'REFID', '', '', '1', '', '0', '', '881bb86a-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000041', 'Name', 'userrole', 'NAME', '', '', '1', '', '0', '', '881bdb9a-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000042', 'Refid', 'parameter', 'REFID', '', '', '1', '', '0', '', '881c02c4-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000043', 'Name', 'parameter', 'NAME', '', '', '1', '', '0', '', '881c252b-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000044', 'Code', 'parameter', 'CODE', 'This is an edit-once field. Its value cannot be modified afterward.', '', '1', '', '0', '', '881c47f8-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000045', 'Parameter group', 'parameter', 'ID_PARAMETER_GROUP', '', '', '1', '', '0', '', '881c6c58-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000046', 'Parameter type', 'parameter', 'ID_PARAMETER_TYPE', '', '', '1', '', '0', '', '881c8fee-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000047', 'Value', 'parameter', 'VALUE', '', '', '1', '', '0', '', '881cb2da-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000048', 'Description', 'parameter', 'DESCRIPTION', '', '', '1', '', '0', '', '881cd657-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000049', 'Refid', 'dashboard', 'REFID', '', '', '1', '', '0', '', '881cfd89-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000050', 'Name', 'dashboard', 'NAME', '', '', '1', '', '0', '', '881d21ba-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000051', 'Admin menu', 'dashboard', 'ID_ADMIN_MENU', '', '', '1', '', '0', '', '881d43dc-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000052', 'Dashboard layout', 'dashboard', 'ID_DASHBOARD_LAYOUT', '', '', '1', '', '0', '', '881d63c6-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000053', 'Dashboard file path', 'dashboard', 'DASHBOARD_FILE_PATH', '', '', '1', '', '0', '', '881d88bb-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000054', 'Refid', 'fieldacl', 'REFID', '', '', '1', '', '0', '', '881dad06-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000055', 'Module', 'fieldacl', 'MODULE', '', '', '1', '', '0', '', '881dcd63-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000056', 'Action', 'fieldacl', 'ACTION', '', '', '1', '', '0', '', '881ded3b-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000057', 'User group', 'fieldacl', 'ID_USER_GROUP', '', '', '1', '', '0', '', '881e0e48-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000058', 'User', 'fieldacl', 'ID_USER', '', '', '1', '', '0', '', '881e2e58-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000059', 'Fields', 'fieldacl', 'FIELDS', '', '', '1', '', '0', '', '881e4e8e-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000060', 'Acl type', 'fieldacl', 'ID_ACL_TYPE', '', '', '1', '', '0', '', '881e6eab-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000061', 'Refid', 'changelog', 'REFID', '', '', '1', '', '0', '', '881e93c7-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000062', 'Action', 'changelog', 'ACTION', '', '', '1', '', '0', '', '881eb0a2-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000063', 'Item', 'changelog', 'ITEM', '', '', '1', '', '0', '', '881ed1e2-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000064', 'Module', 'changelog', 'MODULE', '', '', '1', '', '0', '', '881ef1e5-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000065', 'Date time', 'changelog', 'DATE_TIME', '', '', '1', '', '0', '', '881f10ce-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000066', 'User', 'changelog', 'ID_USER', '', '', '1', '', '0', '', '881f30bc-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000067', 'Details', 'changelog', 'DETAILS', '', '', '1', '', '0', '', '881f50fb-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000068', 'Refid', 'usergroup', 'REFID', '', '', '1', '', '0', '', '881f7556-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000069', 'Name', 'usergroup', 'NAME', '', '', '1', '', '0', '', '881f961a-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000070', 'Default dashboard', 'usergroup', 'DEFAULT_ID_DASHBOARD', '', '', '1', '', '0', '', '881fb73c-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000071', 'Parent', 'usergroup', 'PARENT', '', '', '1', '', '0', '', '881fd750-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000072', 'Refid', 'objectacl', 'REFID', '', '', '1', '', '0', '', '881ffca8-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000073', 'Module', 'objectacl', 'MODULE', '', '', '1', '', '0', '', '88201cde-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000074', 'Object', 'objectacl', 'OBJECT_ID', '', '', '1', '', '0', '', '88203eeb-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000075', 'User group', 'objectacl', 'ID_USER_GROUP', '', '', '1', '', '0', '', '88206023-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000076', 'User', 'objectacl', 'ID_USER', '', '', '1', '', '0', '', '88208026-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000077', 'Arg user group', 'objectacl', 'ARG_ID_USER_GROUP', '', '', '1', '', '0', '', '8820a18c-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000078', 'Arg user', 'objectacl', 'ARG_ID_USER', '', '', '1', '', '0', '', '8820c1f6-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000079', 'Acl type', 'objectacl', 'ID_ACL_TYPE', '', '', '1', '', '0', '', '8820e24f-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000080', 'Refid', 'adminmenu', 'REFID', '', '', '1', '', '0', '', '882106c0-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000081', 'Name', 'adminmenu', 'NAME', '', '', '1', '', '0', '', '882126b2-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000082', 'Ordering', 'adminmenu', 'ORDERING', '', '', '1', '', '0', '', '882146cf-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000083', 'Enabled?', 'adminmenu', 'IS_ENABLED', '', '', '1', '', '0', '', '88216bbb-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000093', 'Refid', 'adminlabel', 'REFID', '', '', '1', '', '0', '', '88227fe2-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000094', 'Label', 'adminlabel', 'LABEL', '', '', '1', '', '0', '', '8822996a-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000095', 'Refid', 'recyclebin', 'REFID', '', '', '1', '', '0', '', '8822b2dc-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000096', 'Item', 'recyclebin', 'ITEM', '', '', '1', '', '0', '', '8822cbc1-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000097', 'Module', 'recyclebin', 'MODULE', '', '', '1', '', '0', '', '8822e462-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000098', 'Date time', 'recyclebin', 'DATE_TIME', '', '', '1', '', '0', '', '8822fe2e-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000099', 'User', 'recyclebin', 'ID_USER', '', '', '1', '', '0', '', '882317c7-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000100', 'Refid', 'accessright', 'REFID', '', '', '1', '', '0', '', '88233444-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000101', 'User group', 'accessright', 'ID_USER_GROUP', '', '', '1', '', '0', '', '88234ef2-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000102', 'Module', 'accessright', 'MODULE', '', '', '1', '', '0', '', '8823685c-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000103', 'Actions', 'accessright', 'ACTIONS', '', '', '1', '', '0', '', '882381c6-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000104', 'Refid', 'adminmodule', 'REFID', '', '', '1', '', '0', '', '88239da0-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000105', 'Name', 'adminmodule', 'NAME', '', '', '1', '', '0', '', '8823b73d-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000106', 'Module', 'adminmodule', 'MODULE', '', '', '1', '', '0', '', '8823d10d-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000107', 'Prefix', 'adminmodule', 'PREFIX', '', '', '1', '', '0', '', '8823eaf3-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000108', 'Available actions', 'adminmodule', 'AVAILABLE_ACTIONS', '', '', '1', '', '0', '', '88240495-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000109', 'Comment enabled?', 'adminmodule', 'IS_COMMENT_ENABLED', '', '', '1', '', '0', '', '88241fa6-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000110', 'Refid', 'adminlanguage', 'REFID', '', '', '1', '', '0', '', '88243bf8-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000111', 'Name', 'adminlanguage', 'NAME', '', '', '1', '', '0', '', '8824556a-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000112', 'Code', 'adminlanguage', 'CODE', '', '', '1', '', '0', '', '88246ee9-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000113', 'Refid', 'parametertype', 'REFID', '', '', '1', '', '0', '', '88248b80-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000114', 'Name', 'parametertype', 'NAME', '', '', '1', '', '0', '', '8824a4d4-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000115', 'Base type code', 'parametertype', 'BASE_TYPE_CODE', '', '', '1', '', '0', '', '8824bf76-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000116', 'Extra', 'parametertype', 'EXTRA', '', '', '1', '', '0', '', '8824d924-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000117', 'Ordering', 'parametertype', 'ORDERING', '', '', '1', '', '0', '', '8824f31b-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000118', 'Refid', 'usermembership', 'REFID', '', '', '1', '', '0', '', '88250f8b-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000119', 'User', 'usermembership', 'ID_USER', '', '', '1', '', '0', '', '88252745-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000120', 'User group', 'usermembership', 'ID_USER_GROUP', '', '', '1', '', '0', '', '882540f3-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000121', 'User role', 'usermembership', 'ID_USER_ROLE', '', '', '1', '', '0', '', '88255a69-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000122', 'Valid from', 'usermembership', 'VALID_FROM', '', '', '1', '', '0', '', '8825748b-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000123', 'Valid until', 'usermembership', 'VALID_UNTIL', '', '', '1', '', '0', '', '88258ecf-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000124', 'Refid', 'userpreference', 'REFID', '', '', '1', '', '0', '', '8825ab3a-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000125', 'User', 'userpreference', 'ID_USER', '', '', '1', '', '0', '', '8825c4f5-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000126', 'Dashboard', 'userpreference', 'ID_DASHBOARD', '', '', '1', '', '0', '', '8825ded3-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000127', 'Wallpaper', 'userpreference', 'ID_WALLPAPER', '', '', '1', '', '0', '', '8825f896-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000128', 'Admin style', 'userpreference', 'ID_ADMIN_STYLE', '', '', '1', '', '0', '', '8826129a-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000129', 'Refid', 'parametergroup', 'REFID', '', '', '1', '', '0', '', '88262ec5-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000130', 'Name', 'parametergroup', 'NAME', '', '', '1', '', '0', '', '88264784-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000131', 'Ordering', 'parametergroup', 'ORDERING', '', '', '1', '', '0', '', '882663d6-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000132', 'Refid', 'adminmenuitem', 'REFID', '', '', '1', '', '0', '', '8826810f-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000133', 'Name', 'adminmenuitem', 'NAME', '', '', '1', '', '0', '', '88269c24-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000134', 'Admin menu', 'adminmenuitem', 'ID_ADMIN_MENU', '', '', '1', '', '0', '', '8826b6b5-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000135', 'Parent', 'adminmenuitem', 'PARENT', '', '', '1', '', '0', '', '8826d0ca-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000136', 'Module', 'adminmenuitem', 'MODULE', '', '', '1', '', '0', '', '8826eb9b-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000137', 'Path', 'adminmenuitem', 'PATH', '', '', '1', '', '0', '', '88270612-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000138', 'Font awesome icon', 'adminmenuitem', 'FONT_AWESOME_ICON', '', '', '1', '', '0', '', '8827219b-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000139', 'Enable left?', 'adminmenuitem', 'ENABLE_LEFT', '', '', '1', '', '0', '', '88273cdc-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000140', 'Enable top?', 'adminmenuitem', 'ENABLE_TOP', '', '', '1', '', '0', '', '882757e4-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000141', 'Enable quick?', 'adminmenuitem', 'ENABLE_QUICK', '', '', '1', '', '0', '', '882773a0-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000142', 'Enable all?', 'adminmenuitem', 'ENABLE_ALL', '', '', '1', '', '0', '', '88278f47-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000143', 'Enable settings?', 'adminmenuitem', 'ENABLE_SETTINGS', '', '', '1', '', '0', '', '8827ab15-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000144', 'Open in new window', 'adminmenuitem', 'OPEN_IN_NEW_WINDOW', '', '', '1', '', '0', '', '8827c68d-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000145', 'Starred?', 'adminmenuitem', 'IS_STARRED', '', '', '1', '', '0', '', '8827e3f9-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000146', 'Ordering', 'adminmenuitem', 'ORDERING', '', '', '1', '', '0', '', '8827f846-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000147', 'Refid', 'adminlanguageitem', 'REFID', '', '', '1', '', '0', '', '8828130e-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000148', 'Admin language', 'adminlanguageitem', 'ID_ADMIN_LANGUAGE', '', '', '1', '', '0', '', '88282c09-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000149', 'Admin label', 'adminlanguageitem', 'ID_ADMIN_LABEL', '', '', '1', '', '0', '', '882847a7-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000150', 'Translation', 'adminlanguageitem', 'TRANSLATION', '', '', '1', '', '0', '', '882861eb-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000151', 'Json', 'user', 'JSON', '', '', '1', '', '0', '', 'c8240399-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000152', 'Json', 'field', 'JSON', '', '', '1', '', '0', '', 'c8345eae-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000153', 'Refid', 'screen', 'REFID', '', '', '1', '', '0', '', 'c83481f7-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000154', 'Title', 'screen', 'TITLE', '', '', '1', '', '0', '', 'c834b7de-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000155', 'Workflow', 'screen', 'ID_WORKFLOW', '', '', '1', '', '0', '', 'c834d9fc-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000156', 'Code', 'screen', 'CODE', 'This is an edit-once field. Its value cannot be modified afterward.', '', '1', '', '0', '', 'c834fe71-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000157', 'Json', 'option', 'JSON', '', '', '1', '', '0', '', 'c835fdb5-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000158', 'Json', 'acltype', 'JSON', '', '', '1', '', '0', '', 'c8369670-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000159', 'Refid', 'workflow', 'REFID', '', '', '1', '', '0', '', 'c836bb94-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000160', 'Name', 'workflow', 'NAME', '', '', '1', '', '0', '', 'c836dd50-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000161', 'Code', 'workflow', 'CODE', 'This is an edit-once field. Its value cannot be modified afterward.', '', '1', '', '0', '', 'c8370238-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000162', 'Description', 'workflow', 'DESCRIPTION', '', '', '1', '', '0', '', 'c837250e-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000163', 'Json', 'workflow', 'JSON', '', '', '1', '', '0', '', 'c8374c74-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000164', 'Json', 'userlog', 'JSON', '', '', '1', '', '0', '', 'c8380393-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000165', 'Json', 'parameter', 'JSON', '', '', '1', '', '0', '', 'c8392b5c-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000166', 'Json', 'userrole', 'JSON', '', '', '1', '', '0', '', 'c8399ac9-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000167', 'Json', 'dashboard', 'JSON', '', '', '1', '', '0', '', 'c83a7587-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000168', 'Json', 'fieldacl', 'JSON', '', '', '1', '', '0', '', 'c83b9ff7-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000169', 'Refid', 'valuetype', 'REFID', '', '', '1', '', '0', '', 'c83bc122-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000170', 'Name', 'valuetype', 'NAME', '', '', '1', '', '0', '', 'c83be2ae-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000171', 'Code', 'valuetype', 'CODE', 'This is an edit-once field. Its value cannot be modified afterward.', '', '1', '', '0', '', 'c83c047b-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000172', 'Json', 'objectacl', 'JSON', '', '', '1', '', '0', '', 'c83d552f-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000175', 'Json', 'adminmenu', 'JSON', '', '', '1', '', '0', '', 'c83faee0-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000176', 'Json', 'changelog', 'JSON', '', '', '1', '', '0', '', 'c840d501-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000177', 'Json', 'usergroup', 'JSON', '', '', '1', '', '0', '', 'c8418e19-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000178', 'Json', 'recyclebin', 'JSON', '', '', '1', '', '0', '', 'c8426dc5-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000179', 'Json', 'adminlabel', 'JSON', '', '', '1', '', '0', '', 'c842db97-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000180', 'Refid', 'adminfilter', 'REFID', '', '', '1', '', '0', '', 'c842ffff-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000181', 'Name', 'adminfilter', 'NAME', '', '', '1', '', '0', '', 'c84322a2-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000182', 'Module', 'adminfilter', 'MODULE', '', '', '1', '', '0', '', 'c8434478-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000183', 'Columns', 'adminfilter', 'COLUMNS', '', '', '1', '', '0', '', 'c8436727-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000184', 'Default?', 'adminfilter', 'IS_DEFAULT', '', '', '1', '', '0', '', 'c8438a60-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000185', 'Refid', 'screenfield', 'REFID', '', '', '1', '', '0', '', 'c843ae83-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000186', 'Screen', 'screenfield', 'ID_SCREEN', '', '', '1', '', '0', '', 'c843d066-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000187', 'Title', 'screenfield', 'TITLE', '', '', '1', '', '0', '', 'c843f255-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000188', 'Code', 'screenfield', 'CODE', 'This is an edit-once field. Its value cannot be modified afterward.', '', '1', '', '0', '', 'c84415fd-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000189', 'Value type', 'screenfield', 'ID_VALUE_TYPE', '', '', '1', '', '0', '', 'c84439ba-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000190', 'Datasource', 'screenfield', 'DATASOURCE', '', '', '1', '', '0', '', 'c8445cf2-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000191', 'Condition', 'screenfield', 'CONDITION', '', '', '1', '', '0', '', 'c8447db2-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000192', 'Valuecol', 'screenfield', 'VALUECOL', '', '', '1', '', '0', '', 'c844a032-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000193', 'Textcol', 'screenfield', 'TEXTCOL', '', '', '1', '', '0', '', 'c844c087-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000194', 'Mandatory?', 'screenfield', 'IS_MANDATORY', '', '', '1', '', '0', '', 'c844e1be-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000195', 'Ordering', 'screenfield', 'ORDERING', '', '', '1', '', '0', '', 'c84501bd-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000196', 'Json', 'accessright', 'JSON', '', '', '1', '', '0', '', 'c845c233-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000197', 'Workflow', 'workflowlog', 'ID_WORKFLOW', '', '', '1', '', '0', '', 'c845e3d9-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000198', 'Workflow transition', 'workflowlog', 'ID_WORKFLOW_TRANSITION', '', '', '1', '', '0', '', 'c84606fc-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000199', 'Module', 'workflowlog', 'MODULE', '', '', '1', '', '0', '', 'c8462885-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000200', 'Object', 'workflowlog', 'OBJECT_ID', '', '', '1', '', '0', '', 'c846453d-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000201', 'Date', 'workflowlog', 'DATE', '', '', '1', '', '0', '', 'c8466017-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000202', 'User', 'workflowlog', 'ID_USER', '', '', '1', '', '0', '', 'c8467c18-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000203', 'Details', 'workflowlog', 'DETAILS', '', '', '1', '', '0', '', 'c8469a44-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000204', 'Json', 'adminmodule', 'JSON', '', '', '1', '', '0', '', 'c8479f48-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000205', 'Refid', 'workflowstage', 'REFID', '', '', '1', '', '0', '', 'c847c3df-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000206', 'Workflow', 'workflowstage', 'ID_WORKFLOW', '', '', '1', '', '0', '', 'c847e64f-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000207', 'Name', 'workflowstage', 'NAME', '', '', '1', '', '0', '', 'c8480853-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000208', 'Code', 'workflowstage', 'CODE', 'This is an edit-once field. Its value cannot be modified afterward.', '', '1', '', '0', '', 'c8482a4f-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000209', 'Default?', 'workflowstage', 'IS_DEFAULT', '', '', '1', '', '0', '', 'c8484eb7-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000210', 'Binding object editable?', 'workflowstage', 'IS_BINDING_OBJECT_EDITABLE', '', '', '1', '', '0', '', 'c848744f-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000211', 'Binding object deletable?', 'workflowstage', 'IS_BINDING_OBJECT_DELETABLE', '', '', '1', '', '0', '', 'c8489a49-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000212', 'Json', 'adminlanguage', 'JSON', '', '', '1', '', '0', '', 'c8492526-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000213', 'Json', 'parametertype', 'JSON', '', '', '1', '', '0', '', 'c84a040d-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000214', 'Json', 'userpreference', 'JSON', '', '', '1', '', '0', '', 'c84ae2a7-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000215', 'Json', 'parametergroup', 'JSON', '', '', '1', '', '0', '', 'c84b74aa-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000216', 'Json', 'usermembership', 'JSON', '', '', '1', '', '0', '', 'c84c7c00-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000217', 'Json', 'adminmenuitem', 'JSON', '', '', '1', '', '0', '', 'c84ee009-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000224', 'Refid', 'workflowtransition', 'REFID', '', '', '1', '', '0', '', 'c84fd6c8-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000225', 'Workflow', 'workflowtransition', 'ID_WORKFLOW', '', '', '1', '', '0', '', 'c84ff908-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000226', 'Name', 'workflowtransition', 'NAME', '', '', '1', '', '0', '', 'c8501b0d-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000227', 'Start workflow stage', 'workflowtransition', 'START_ID_WORKFLOW_STAGE', '', '', '1', '', '0', '', 'c8503f1f-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000228', 'End workflow stage', 'workflowtransition', 'END_ID_WORKFLOW_STAGE', '', '', '1', '', '0', '', 'c850634b-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000229', 'Action', 'workflowtransition', 'ACTION', '', '', '1', '', '0', '', 'c8508559-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000230', 'User group', 'workflowtransition', 'ID_USER_GROUP', '', '', '1', '', '0', '', 'c850a7fb-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000231', 'User role', 'workflowtransition', 'ID_USER_ROLE', '', '', '1', '', '0', '', 'c850cb41-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000232', 'Transition screen', 'workflowtransition', 'TRANSITION_ID_SCREEN', '', '', '1', '', '0', '', 'c850eb88-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000233', 'Json', 'adminlanguageitem', 'JSON', '', '', '1', '', '0', '', 'c8519a73-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000234', 'Refid', 'workflowapplication', 'REFID', '', '', '1', '', '0', '', 'c851bb91-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000235', 'Module', 'workflowapplication', 'MODULE', '', '', '1', '', '0', '', 'c851db20-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000236', 'Workflow', 'workflowapplication', 'ID_WORKFLOW', '', '', '1', '', '0', '', 'c851fb2c-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000242', 'Json', 'screen', 'JSON', '', '', '1', '', '0', '', '8b4459c0-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000243', 'Json', 'valuetype', 'JSON', '', '', '1', '', '0', '', '8b504f02-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000244', 'Json', 'adminfilter', 'JSON', '', '', '1', '', '0', '', '8b5442e7-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000245', 'Json', 'screenfield', 'JSON', '', '', '1', '', '0', '', '8b559798-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000246', 'Refid', 'workflowlog', 'REFID', '', '', '1', '', '0', '', '8b55b505-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000247', 'Json', 'workflowlog', 'JSON', '', '', '1', '', '0', '', '8b56963a-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000248', 'Json', 'workflowstage', 'JSON', '', '', '1', '', '0', '', '8b58d422-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000249', 'Module', 'adminsequence', 'MODULE', '', '', '1', '', '0', '', '8b5a1217-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000250', 'Sequence format', 'adminsequence', 'SEQUENCE_FORMAT', '', '', '1', '', '0', '', '8b5a264e-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000251', 'Current value', 'adminsequence', 'CURRENT_VALUE', '', '', '1', '', '0', '', '8b5a4123-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000252', 'Sequence step', 'adminsequence', 'SEQUENCE_STEP', '', '', '1', '', '0', '', '8b5a5c39-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000254', 'Json', 'workflowtransition', 'JSON', '', '', '1', '', '0', '', '8b6016d3-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000255', 'Json', 'workflowapplication', 'JSON', '', '', '1', '', '0', '', '8b6123f5-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000257', 'Refid', 'adminsequence', 'REFID', '', '', '1', '', '0', '', '81e71001-1a1e-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000258', 'Json', 'adminsequence', 'JSON', '', '', '1', '', '0', '', '81e75862-1a1e-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000590', 'Code', 'workflowtransition', 'CODE', 'This is an edit-once field. Its value cannot be modified afterward.', '', '1', '', '0', '', 'e9bd9b99-2720-11e5-9ed7-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000591', 'Refid', 'adminfiltercondition', 'REFID', '', '', '1', '', '0', '', 'e9c01bf6-2720-11e5-9ed7-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000592', 'Admin filter', 'adminfiltercondition', 'ID_ADMIN_FILTER', '', '', '1', '', '0', '', 'e9c038c4-2720-11e5-9ed7-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000593', 'Field', 'adminfiltercondition', 'ID_FIELD', '', '', '1', '', '0', '', 'e9c05315-2720-11e5-9ed7-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000594', 'Value operator', 'adminfiltercondition', 'ID_VALUE_OPERATOR', '', '', '1', '', '0', '', 'e9c06f96-2720-11e5-9ed7-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000595', 'Value', 'adminfiltercondition', 'VALUE', '', '', '1', '', '0', '', 'e9c09109-2720-11e5-9ed7-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000596', 'Condition operator', 'adminfiltercondition', 'ID_CONDITION_OPERATOR', '', '', '1', '', '0', '', 'e9c1fa65-2720-11e5-9ed7-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000597', 'Json', 'adminfiltercondition', 'JSON', '', '', '1', '', '0', '', 'e9c2261f-2720-11e5-9ed7-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000601', 'Xxx', 'workflow', 'XXX', '', '', '1', '', '0', '', '8bb8dbdb-29e4-11e5-9ed7-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000602', 'Yyy', 'workflow', 'YYY', '', '', '1', '', '0', '', '7914e0fd-29e5-11e5-9ed7-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000603', 'Ordering', 'workflowtransition', 'ORDERING', '', '', '1', '', '0', '', 'f8ba72f7-2c39-11e5-9ed7-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000001', 'user', '*', '', '1', '', '', '1', '1', '', '0', '', '6e16e82b-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000002', 'user', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e170121-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000011', 'field', '*', '', '1', '', '', '1', '1', '', '0', '', '6e1e86e4-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000012', 'field', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e1e9a6c-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000013', 'screen', '*', '', '1', '', '', '1', '1', '', '0', '', '6e1eabb7-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000014', 'screen', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e1ebea1-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000015', 'option', '*', '', '1', '', '', '1', '1', '', '0', '', '6e1ed197-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000016', 'option', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e1ee3fc-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000025', 'workflow', '*', '', '1', '', '', '1', '1', '', '0', '', '6e1f9927-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000026', 'workflow', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e1fa90e-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000027', 'acltype', '*', '', '1', '', '', '1', '1', '', '0', '', '6e1fc122-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000028', 'acltype', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e1fd3c3-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000029', 'userlog', '*', '', '1', '', '', '1', '1', '', '0', '', '6e1fe718-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000030', 'userlog', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e1ff849-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000031', 'userlog', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '6e200ae2-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000032', 'userrole', '*', '', '1', '', '', '1', '1', '', '0', '', '6e201ca0-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000033', 'userrole', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e202fa8-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000039', 'parameter', '*', '', '1', '', '', '1', '1', '', '0', '', '6e209a00-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000040', 'parameter', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e20abd9-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000041', 'fieldacl', '*', '', '1', '', '', '1', '1', '', '0', '', '6e20bc38-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000042', 'fieldacl', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e20cd36-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000046', 'dashboard', '*', '', '1', '', '', '1', '1', '', '0', '', '6e2113d2-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000047', 'dashboard', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e21249c-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000050', 'usergroup', '*', '', '1', '', '', '1', '1', '', '0', '', '6e215dbc-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000051', 'usergroup', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e216f76-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000054', 'objectacl', '*', '', '1', '', '', '1', '1', '', '0', '', '6e21cd25-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000055', 'objectacl', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e21e56c-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000056', 'valuetype', '*', '', '1', '', '', '1', '1', '', '0', '', '6e220f28-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000057', 'valuetype', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e2222f9-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000058', 'adminmenu', '*', '', '1', '', '', '1', '1', '', '0', '', '6e2233f3-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000059', 'adminmenu', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e224520-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000060', 'changelog', '*', '', '1', '', '', '1', '1', '', '0', '', '6e22561e-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000061', 'changelog', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e2266c6-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000062', 'adminlabel', '*', '', '1', '', '', '1', '1', '', '0', '', '6e2279f4-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000063', 'adminlabel', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e228b2a-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000071', 'recyclebin', '*', '', '1', '', '', '1', '1', '', '0', '', '6e232ac6-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000072', 'recyclebin', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e233c22-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000076', 'screenfield', '*', '', '1', '', '', '1', '1', '', '0', '', '6e2383fb-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000077', 'screenfield', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e23968b-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000078', 'screenfield', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '6e23a849-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000082', 'workflowlog', '*', '', '1', '', '', '1', '1', '', '0', '', '6e23f144-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000083', 'workflowlog', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e2402ba-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000084', 'workflowlog', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '6e2415df-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000096', 'adminmodule', '*', '', '1', '', '', '1', '1', '', '0', '', '6e250e4e-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000097', 'adminmodule', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e252607-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000100', 'adminfilter', '*', '', '1', '', '', '1', '1', '', '0', '', '6e25617e-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000101', 'adminfilter', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e25740a-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000102', 'accessright', '*', '', '1', '', '', '1', '1', '', '0', '', '6e2586de-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000103', 'accessright', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e259898-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000121', 'workflowstage', '*', '', '1', '', '', '1', '1', '', '0', '', '6e272b93-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000122', 'workflowstage', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e273fe0-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000123', 'workflowstage', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '6e2754ad-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000124', 'adminlanguage', '*', '', '1', '', '', '1', '1', '', '0', '', '6e276853-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000125', 'adminlanguage', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e277c79-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000129', 'adminsequence', '*', '', '1', '', '', '1', '1', '', '0', '', '6e27c129-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000130', 'adminsequence', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e27d13c-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000131', 'parametertype', '*', '', '1', '', '', '1', '1', '', '0', '', '6e27e09f-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000132', 'parametertype', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e27f09c-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000133', 'userpreference', '*', '', '1', '', '', '1', '1', '', '0', '', '6e2801d2-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000134', 'userpreference', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e281198-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000135', 'userpreference', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '6e2821fc-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000138', 'adminmenuitem', '*', '', '1', '', '', '1', '1', '', '0', '', '6e2850cc-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000139', 'adminmenuitem', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e286096-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000140', 'adminmenuitem', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '6e2870fa-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000141', 'parametergroup', '*', '', '1', '', '', '1', '1', '', '0', '', '6e2880c0-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000142', 'parametergroup', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e289070-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000143', 'usermembership', '*', '', '1', '', '', '1', '1', '', '0', '', '6e289fe1-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000144', 'usermembership', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e28afc4-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000145', 'usermembership', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '6e28bfce-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000168', 'workflowtransition', '*', '', '1', '', '', '1', '1', '', '0', '', '6e2a2fcd-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000169', 'workflowtransition', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e2a4024-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000170', 'workflowtransition', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '6e2a5083-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000171', 'adminlanguageitem', '*', '', '1', '', '', '1', '1', '', '0', '', '6e2a7cc2-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000172', 'adminlanguageitem', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e2a8d43-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000173', 'adminlanguageitem', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '6e2a9f53-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000174', 'workflowapplication', '*', '', '1', '', '', '1', '1', '', '0', '', '6e2aaf7b-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000175', 'workflowapplication', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e2abfd2-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000176', 'workflowapplication', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '6e2ad021-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000179', 'adminfiltercondition', '*', '', '1', '', '', '1', '1', '', '0', '', '6e2b0010-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000180', 'adminfiltercondition', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e2b104e-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000181', 'adminfiltercondition', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '6e2b20cb-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000182', 'valueoperator', '*', '', '1', '', '', '1', '1', '', '0', '', '05285af5-2f97-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000183', 'valueoperator', 'self', '2', '', '', '', '1', '1', '', '0', '', '052aaf30-2f97-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000184', 'conditionoperator', '*', '', '1', '', '', '1', '1', '', '0', '', '052e17b7-2f97-11e5-95d9-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000185', 'conditionoperator', 'self', '2', '', '', '', '1', '1', '', '0', '', '052e330d-2f97-11e5-95d9-cc52af77857f');