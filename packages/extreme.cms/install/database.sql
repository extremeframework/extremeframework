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
-- Table structure for table `MENU`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `MENU` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLASS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MENU`
--

/*!40000 ALTER TABLE `MENU` DISABLE KEYS */;
/*!40000 ALTER TABLE `MENU` ENABLE KEYS */;

--
-- Table structure for table `MENU_ITEM`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `MENU_ITEM` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLASS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG_LINE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_MENU` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARENT` int(11) DEFAULT NULL,
  `ID_PAGE` int(11) DEFAULT NULL,
  `ID_POST` int(11) DEFAULT NULL,
  `ID_POST_CATEGORY` int(11) DEFAULT NULL,
  `PATH` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CUSTOM_CONTENT` text COLLATE utf8_unicode_ci,
  `HAS_BREAK_AFTER` tinyint(1) DEFAULT NULL,
  `ORDERING` tinyint(2) DEFAULT NULL,
  `ACL_ID_USER_GROUP` int(11) DEFAULT NULL,
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
  KEY `IDX_ID_MENU` (`ID_MENU`),
  KEY `IDX_PARENT` (`PARENT`),
  KEY `IDX_ID_PAGE` (`ID_PAGE`),
  KEY `IDX_ID_POST` (`ID_POST`),
  KEY `IDX_ID_POST_CATEGORY` (`ID_POST_CATEGORY`),
  KEY `IDX_ACL_ID_USER_GROUP` (`ACL_ID_USER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MENU_ITEM`
--

/*!40000 ALTER TABLE `MENU_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `MENU_ITEM` ENABLE KEYS */;

--
-- Table structure for table `PAGE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `PAGE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARENT` int(11) DEFAULT NULL,
  `SLUG` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG_LINE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `THUMB` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BACKGROUND_IMAGE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VIDEO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `META_KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `META_DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INTRODUCTION` text COLLATE utf8_unicode_ci,
  `CONTENT` text COLLATE utf8_unicode_ci,
  `FOOTER` text COLLATE utf8_unicode_ci,
  `ID_TEMPLATE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_CSS` text COLLATE utf8_unicode_ci,
  `CUSTOM_TOP_ID_MENU` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CUSTOM_SIDE_ID_MENU` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VIEW_MORE_TITLE` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VIEW_MORE_ID_PAGE` int(11) DEFAULT NULL,
  `VIEW_MORE_LINK` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LATEST_UPDATE` datetime DEFAULT NULL,
  `NBR_VIEWS` double(10,2) DEFAULT NULL,
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
  KEY `IDX_PARENT` (`PARENT`),
  KEY `IDX_ID_TEMPLATE` (`ID_TEMPLATE`),
  KEY `IDX_CUSTOM_TOP_ID_MENU` (`CUSTOM_TOP_ID_MENU`),
  KEY `IDX_CUSTOM_SIDE_ID_MENU` (`CUSTOM_SIDE_ID_MENU`),
  KEY `IDX_VIEW_MORE_ID_PAGE` (`VIEW_MORE_ID_PAGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAGE`
--

/*!40000 ALTER TABLE `PAGE` DISABLE KEYS */;
/*!40000 ALTER TABLE `PAGE` ENABLE KEYS */;

--
-- Table structure for table `PAGE_GALLERY`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `PAGE_GALLERY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_PAGE` int(11) DEFAULT NULL,
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_ID_PAGE` int(11) DEFAULT NULL,
  `LINK_PATH` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `ORDERING` tinyint(2) DEFAULT NULL,
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
  KEY `IDX_ID_PAGE` (`ID_PAGE`),
  KEY `IDX_LINK_ID_PAGE` (`LINK_ID_PAGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAGE_GALLERY`
--

/*!40000 ALTER TABLE `PAGE_GALLERY` DISABLE KEYS */;
/*!40000 ALTER TABLE `PAGE_GALLERY` ENABLE KEYS */;

--
-- Table structure for table `PAGE_LINK`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `PAGE_LINK` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_PAGE` int(11) DEFAULT NULL,
  `FONT_AWESOME_ICON` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_ID_PAGE` int(11) DEFAULT NULL,
  `LINK_PATH` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_PAGE_LINK_TYPE` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORDERING` tinyint(2) DEFAULT NULL,
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
  KEY `IDX_ID_PAGE` (`ID_PAGE`),
  KEY `IDX_LINK_ID_PAGE` (`LINK_ID_PAGE`),
  KEY `IDX_ID_PAGE_LINK_TYPE` (`ID_PAGE_LINK_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAGE_LINK`
--

/*!40000 ALTER TABLE `PAGE_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `PAGE_LINK` ENABLE KEYS */;

--
-- Table structure for table `PAGE_LINK_TYPE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `PAGE_LINK_TYPE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAGE_LINK_TYPE`
--

/*!40000 ALTER TABLE `PAGE_LINK_TYPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `PAGE_LINK_TYPE` ENABLE KEYS */;

--
-- Table structure for table `PAGE_SECTION`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `PAGE_SECTION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_PAGE` int(11) DEFAULT NULL,
  `CODE` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARENT` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG_LINE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FONT_AWESOME_ICON` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BACKGROUND_IMAGE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BACKGROUND_COLOR` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VIDEO` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci,
  `TAGS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VIEW_MORE_TITLE` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VIEW_MORE_ID_PAGE` int(11) DEFAULT NULL,
  `VIEW_MORE_LINK` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HIDE_TITLE` tinyint(1) DEFAULT NULL,
  `IS_TAB_ANCHOR_SECTION` tinyint(1) DEFAULT NULL,
  `TAB_ANCHOR_TITLE` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORDERING` tinyint(2) DEFAULT NULL,
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
  KEY `IDX_CODE` (`CODE`),
  KEY `IDX_ID_PAGE` (`ID_PAGE`),
  KEY `IDX_PARENT` (`PARENT`),
  KEY `IDX_VIEW_MORE_ID_PAGE` (`VIEW_MORE_ID_PAGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAGE_SECTION`
--

/*!40000 ALTER TABLE `PAGE_SECTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `PAGE_SECTION` ENABLE KEYS */;

--
-- Table structure for table `PAGE_WIDGET`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `PAGE_WIDGET` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_PAGE` int(11) DEFAULT NULL,
  `TITLE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_WIDGET_TYPE` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_WIDGET_POSITION` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci,
  `HIDE_TITLE` tinyint(1) DEFAULT NULL,
  `ORDERING` tinyint(2) DEFAULT NULL,
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
  KEY `IDX_CODE` (`CODE`),
  KEY `IDX_ID_PAGE` (`ID_PAGE`),
  KEY `IDX_ID_WIDGET_TYPE` (`ID_WIDGET_TYPE`),
  KEY `IDX_ID_WIDGET_POSITION` (`ID_WIDGET_POSITION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAGE_WIDGET`
--

/*!40000 ALTER TABLE `PAGE_WIDGET` DISABLE KEYS */;
/*!40000 ALTER TABLE `PAGE_WIDGET` ENABLE KEYS */;

--
-- Table structure for table `WIDGET_TYPE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `WIDGET_TYPE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WIDGET_TYPE`
--

/*!40000 ALTER TABLE `WIDGET_TYPE` DISABLE KEYS */;
INSERT IGNORE INTO `WIDGET_TYPE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (1,'WDT0000000001','Links','links',1,NULL,0,NULL,'cd857fa6-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `WIDGET_TYPE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (2,'WDT0000000002','General','general',1,NULL,0,NULL,'cd85837a-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `WIDGET_TYPE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (3,'WDT0000000003','Video','video',1,NULL,0,NULL,'cd8584cc-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `WIDGET_TYPE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (4,'WDT0000000004','Audio','audio',1,NULL,0,NULL,'cd858600-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `WIDGET_TYPE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (5,'WDT0000000005','Image','image',1,NULL,0,NULL,'cd85872b-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `WIDGET_TYPE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (6,'WDT0000000006','Button','button',1,NULL,0,NULL,'cd858852-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `WIDGET_TYPE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (7,'WDT0000000007','Spotlight','spotlight',1,NULL,0,NULL,'b6c6c1ce-eac3-4761-a3d6-3054eabdebca');
/*!40000 ALTER TABLE `WIDGET_TYPE` ENABLE KEYS */;

--
-- Table structure for table `WIDGET_POSITION`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `WIDGET_POSITION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WIDGET_POSITION`
--

/*!40000 ALTER TABLE `WIDGET_POSITION` DISABLE KEYS */;
INSERT IGNORE INTO `WIDGET_POSITION` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (1,'WDP0000000001','Side bar left','side-bar-left',1,NULL,0,NULL,'ce10ae14-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `WIDGET_POSITION` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (2,'WDP0000000002','Side bar right','side-bar-right',1,NULL,0,NULL,'ce10b0e6-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `WIDGET_POSITION` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (3,'WDP0000000003','Main bottom','main-bottom',1,NULL,0,NULL,'ce10b1a7-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `WIDGET_POSITION` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (4,'WDP0000000004','Main top','main-top',1,NULL,0,NULL,'ce10b241-1ba9-11e5-a175-cc52af77857f');
/*!40000 ALTER TABLE `WIDGET_POSITION` ENABLE KEYS */;

--
-- Table structure for table `POST`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `POST` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SLUG` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_POST_TYPE` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_POST_CATEGORY` int(11) DEFAULT NULL,
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `META_KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `META_DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXCERPT` text COLLATE utf8_unicode_ci,
  `CONTENT` text COLLATE utf8_unicode_ci,
  `TAGS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_LINK` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_TEMPLATE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATION_DATE` datetime DEFAULT NULL,
  `LATEST_UPDATE` datetime DEFAULT NULL,
  `IS_FEATURED` tinyint(1) DEFAULT NULL,
  `NBR_VIEWS` double(10,2) DEFAULT NULL,
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
  KEY `IDX_ID_POST_TYPE` (`ID_POST_TYPE`),
  KEY `IDX_ID_POST_CATEGORY` (`ID_POST_CATEGORY`),
  KEY `IDX_ID_TEMPLATE` (`ID_TEMPLATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POST`
--

/*!40000 ALTER TABLE `POST` DISABLE KEYS */;
/*!40000 ALTER TABLE `POST` ENABLE KEYS */;

--
-- Table structure for table `POST_TYPE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `POST_TYPE` (
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
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POST_TYPE`
--

/*!40000 ALTER TABLE `POST_TYPE` DISABLE KEYS */;
INSERT IGNORE INTO `POST_TYPE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (1,'PSP0000000001','Article','article',1,NULL,0,NULL,'cd46cd30-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `POST_TYPE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (2,'PSP0000000002','Video','video',1,NULL,0,NULL,'cd46d114-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `POST_TYPE` (`ID`, `REFID`, `NAME`, `CODE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (3,'PSP0000000003','Image','image',1,NULL,0,NULL,'cd46d277-1ba9-11e5-a175-cc52af77857f');
/*!40000 ALTER TABLE `POST_TYPE` ENABLE KEYS */;

--
-- Table structure for table `POST_CATEGORY`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `POST_CATEGORY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SLUG` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARENT` int(11) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `ID_TEMPLATE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORDERING` tinyint(2) DEFAULT NULL,
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
  KEY `IDX_PARENT` (`PARENT`),
  KEY `IDX_ID_TEMPLATE` (`ID_TEMPLATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POST_CATEGORY`
--

/*!40000 ALTER TABLE `POST_CATEGORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `POST_CATEGORY` ENABLE KEYS */;

--
-- Table structure for table `POST_GALLERY`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `POST_GALLERY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_POST` int(11) DEFAULT NULL,
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `ORDERING` tinyint(2) DEFAULT NULL,
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
  KEY `IDX_ID_POST` (`ID_POST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POST_GALLERY`
--

/*!40000 ALTER TABLE `POST_GALLERY` DISABLE KEYS */;
/*!40000 ALTER TABLE `POST_GALLERY` ENABLE KEYS */;

--
-- Table structure for table `POST_RELATION`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `POST_RELATION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_POST` int(11) DEFAULT NULL,
  `PEER_ID_POST` int(11) DEFAULT NULL,
  `ID_POST_RELATION_TYPE` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  KEY `IDX_ID_POST` (`ID_POST`),
  KEY `IDX_PEER_ID_POST` (`PEER_ID_POST`),
  KEY `IDX_ID_POST_RELATION_TYPE` (`ID_POST_RELATION_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POST_RELATION`
--

/*!40000 ALTER TABLE `POST_RELATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `POST_RELATION` ENABLE KEYS */;

--
-- Table structure for table `POST_RELATION_TYPE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `POST_RELATION_TYPE` (
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
  KEY `IDX_GUID` (`GUID`),
  KEY `IDX_UUID` (`UUID`),
  KEY `IDX_UDID` (`UDID`),
  KEY `IDX_WFID` (`WFID`),
  KEY `IDX_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POST_RELATION_TYPE`
--

/*!40000 ALTER TABLE `POST_RELATION_TYPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `POST_RELATION_TYPE` ENABLE KEYS */;

--
-- Table structure for table `POST_SECTION`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `POST_SECTION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_POST` int(11) DEFAULT NULL,
  `TAG_LINE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BACKGROUND_IMAGE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BACKGROUND_COLOR` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VIDEO` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci,
  `LINK_PATH` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORDERING` tinyint(2) DEFAULT NULL,
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
  KEY `IDX_ID_POST` (`ID_POST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POST_SECTION`
--

/*!40000 ALTER TABLE `POST_SECTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `POST_SECTION` ENABLE KEYS */;

--
-- Table structure for table `TEMPLATE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `TEMPLATE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  KEY `IDX_CODE` (`CODE`),
  KEY `IDX_MODULE` (`MODULE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEMPLATE`
--

/*!40000 ALTER TABLE `TEMPLATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TEMPLATE` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000009', '1', 'menu', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '1', '', '0', '', '93db7fde-340b-11e5-acf4-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000012', '1', 'post', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '1', '', '0', '', '93de1055-340b-11e5-acf4-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000013', '1', 'page', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '1', '', '0', '', '93dff1d8-340b-11e5-acf4-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000019', '1', 'template', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '1', '', '0', '', '93e10ca9-340b-11e5-acf4-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000025', '1', 'menuitem', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '1', '', '0', '', '93e23d5a-340b-11e5-acf4-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000026', '1', 'posttype', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '1', '', '0', '', '93e2cf5d-340b-11e5-acf4-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000028', '1', 'pagelink', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '1', '', '0', '', '93e33d01-340b-11e5-acf4-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000040', '1', 'pagewidget', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '1', '', '0', '', '93e54514-340b-11e5-acf4-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000043', '1', 'widgettype', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '1', '', '0', '', '93e5c490-340b-11e5-acf4-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000046', '1', 'postsection', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '1', '', '0', '', '93e64cda-340b-11e5-acf4-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000047', '1', 'postgallery', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '1', '', '0', '', '93e67e4a-340b-11e5-acf4-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000049', '1', 'pagesection', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '1', '', '0', '', '93e6d2fc-340b-11e5-acf4-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000052', '1', 'pagegallery', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '1', '', '0', '', '93e74057-340b-11e5-acf4-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000059', '1', 'postrelation', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '1', '', '0', '', '93e86bbb-340b-11e5-acf4-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000060', '1', 'postcategory', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '1', '', '0', '', '93e8930c-340b-11e5-acf4-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000067', '1', 'pagelinktype', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '1', '', '0', '', '93e9e1b6-340b-11e5-acf4-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000073', '1', 'widgetposition', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '1', '', '0', '', '93eaeec7-340b-11e5-acf4-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000081', '1', 'postrelationtype', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '1', '', '0', '', '93ec47b8-340b-11e5-acf4-cc52af77857f');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('', 'All', 'menu', 'NAME,CODE,CLASS', '1', '', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('', 'All', 'menuitem', 'TITLE,ID_MENU,ID_PAGE,ID_POST,ID_POST_CATEGORY,ORDERING', '1', '', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('', 'All', 'page', 'NAME,ID_TEMPLATE', '1', '', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('', 'All', 'pagegallery', 'TITLE,ID_PAGE,IMAGE,ORDERING', '1', '', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('', 'All', 'pagelink', 'TITLE,ID_PAGE,ID_PAGE_LINK_TYPE,ORDERING', '1', '', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('', 'All', 'pagelinktype', 'NAME,CODE,ORDERING', '1', '', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('', 'All', 'pagesection', 'TITLE,ID_PAGE,IMAGE,ORDERING', '1', '', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('', 'All', 'pagewidget', 'TITLE,ID_PAGE,IMAGE,ID_WIDGET_TYPE,ORDERING', '1', '', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('', 'All', 'post', 'TITLE,IMAGE,ID_POST_CATEGORY,ID_TEMPLATE', '1', '', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('', 'All', 'postcategory', 'NAME,ID_TEMPLATE,ORDERING', '1', '', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('', 'All', 'postgallery', 'TITLE,ID_POST,IMAGE,ORDERING', '1', '', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('', 'All', 'postrelation', 'ID_POST,PEER_ID_POST,ID_POST_RELATION_TYPE', '1', '', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('', 'All', 'postrelationtype', 'NAME,CODE', '1', '', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('', 'All', 'postsection', 'TITLE,ID_POST,IMAGE,ORDERING', '1', '', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('', 'All', 'posttype', 'NAME,CODE', '1', '', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('', 'All', 'template', 'NAME,CODE,MODULE', '1', '', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('', 'All', 'widgetposition', 'NAME,CODE', '1', '', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('', 'All', 'widgettype', 'NAME,CODE', '1', '', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('# views', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Acl user group', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Additional css', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Author', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Background color', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Background image', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Class', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Code', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Content', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Creation date', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Custom content', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Custom side menu', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Custom top menu', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Description', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Excerpt', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('External link', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Featured?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Font awesome icon', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Footer', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Has break after?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Hide title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Image', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Introduction', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Latest update', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Link page', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Link path', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Link', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Menu item title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Menu name', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Menu', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Meta description', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Meta keywords', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Module', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Page link type', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Page', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Parent', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Path', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Peer post', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Post category', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Post relation type', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Post type', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Post', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Slug', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Tab anchor section?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Tab anchor title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Tag line', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Tags', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Template', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Thumb', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Video', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('View more link', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('View more page', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('View more title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Widget position', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Widget type', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = '# views'), '# views', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Acl user group'), 'Acl user group', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Additional css'), 'Additional css', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Author'), 'Author', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Background color'), 'Background color', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Background image'), 'Background image', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Class'), 'Class', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Code'), 'Code', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Content'), 'Content', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Creation date'), 'Creation date', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Custom content'), 'Custom content', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Custom side menu'), 'Custom side menu', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Custom top menu'), 'Custom top menu', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Description'), 'Description', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Excerpt'), 'Excerpt', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'External link'), 'External link', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Featured?'), 'Featured?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Font awesome icon'), 'Font awesome icon', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Footer'), 'Footer', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Has break after?'), 'Has break after??', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Hide title'), 'Hide title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Image'), 'Image', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Introduction'), 'Introduction', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Latest update'), 'Latest update', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Link page'), 'Link page', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Link path'), 'Link path', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Link'), 'Link', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Menu item title'), 'Menu item title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Menu name'), 'Menu name', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Menu'), 'Menu', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Meta description'), 'Meta description', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Meta keywords'), 'Meta keywords', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Module'), 'Module', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Page link type'), 'Page link type', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Page'), 'Page', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Parent'), 'Parent', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Path'), 'Path', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Peer post'), 'Peer post', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Post category'), 'Post category', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Post relation type'), 'Post relation type', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Post type'), 'Post type', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Post'), 'Post', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Slug'), 'Slug', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Tab anchor section?'), 'Tab anchor section?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Tab anchor title'), 'Tab anchor title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Tag line'), 'Tag line', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Tags'), 'Tags', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Template'), 'Template', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Thumb'), 'Thumb', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Video'), 'Video', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'View more link'), 'View more link', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'View more page'), 'View more page', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'View more title'), 'View more title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Widget position'), 'Widget position', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Widget type'), 'Widget type', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000573', 'Posts', '1', '0', 'post', '', 'fa-paper-plane-o', '1', '1', '1', '1', '0', '', '', '99', '1', '', '0', '', '7aa827a1-304f-11e5-95d9-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000575', 'Pages', '1', '1', 'page', '', 'fa-globe', '1', '1', '0', '0', '0', '0', '0', '0', '1', '', '0', '', '7aa90856-304f-11e5-95d9-cc52af77857f', '-0-1-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000576', 'Menus', '1', '0', 'menu', '', 'fa-bars', '1', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '7aa95c0b-304f-11e5-95d9-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000583', 'Templates', '1', '0', 'template', '', 'fa-newspaper-o', '1', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '7aabb717-304f-11e5-95d9-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000590', 'Page Links', '1', '0', 'pagelink', '', 'fa-moon-o', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '7aae6a12-304f-11e5-95d9-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000591', 'Menu Items', '1', '0', 'menuitem', '', 'fa-level-up', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '7aaec331-304f-11e5-95d9-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000592', 'Post Types', '1', '0', 'posttype', '', 'fa-table', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '7aaf55c5-304f-11e5-95d9-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000602', 'Widget Types', '1', '0', 'widgettype', '', 'fa-caret-square-o-up', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '7ab32c8f-304f-11e5-95d9-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000604', 'Page Widgets', '1', '0', 'pagewidget', '', 'fa-minus-circle', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '7ab42980-304f-11e5-95d9-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000607', 'Post Sections', '1', '0', 'postsection', '', 'fa-hdd-o', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '7aba199a-304f-11e5-95d9-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000609', 'Post Galleries', '1', '0', 'postgallery', '', 'fa-crosshairs', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '7aba5921-304f-11e5-95d9-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000610', 'Page Sections', '1', '0', 'pagesection', '', 'fa-text-height', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '7aba7953-304f-11e5-95d9-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000614', 'Page Galleries', '1', '0', 'pagegallery', '', 'fa-stumbleupon', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '7abafb07-304f-11e5-95d9-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000620', 'Post Relations', '1', '0', 'postrelation', '', 'fa-flask', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '7abbbce0-304f-11e5-95d9-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000621', 'Post Categories', '1', '0', 'postcategory', '', 'fa-try', '1', '0', '1', '1', '0', '', '', '99', '1', '', '0', '', '7abbd92a-304f-11e5-95d9-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000626', 'Page Link Types', '1', '0', 'pagelinktype', '', 'fa-stumbleupon', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '7abc69ac-304f-11e5-95d9-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000633', 'Widget Positions', '1', '0', 'widgetposition', '', 'fa-lastfm-square', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '7abd628e-304f-11e5-95d9-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000645', 'Post Relation Types', '1', '0', 'postrelationtype', '', 'fa-align-right', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '7abf197a-304f-11e5-95d9-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000038', 'Page', 'page', 'extreme.cms', 'PGE', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '0', '1', '', '0', '', '12589946-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000039', 'Menu', 'menu', 'extreme.mindmap', 'MNU', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '1258d8f3-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000040', 'Post', 'post', 'extreme.cms', 'PST', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '0', '1', '', '0', '', '125905c7-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000041', 'Template', 'template', 'extreme.cms', 'TMP', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '1259f706-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000042', 'Menu Item', 'menuitem', 'extreme.cms', 'MNI', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125a9764-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000043', 'Post Type', 'posttype', 'extreme.cms', 'PSP', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125b3074-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000044', 'Page Link', 'pagelink', 'extreme.cms', 'PGL', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125b58f8-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000045', 'Widget Type', 'widgettype', 'extreme.cms', 'WDT', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125cb2b2-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000046', 'Page Widget', 'pagewidget', 'extreme.cms', 'PGW', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125d0605-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000047', 'Page Gallery', 'pagegallery', 'extreme.cms', 'PGG', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125dc32c-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000048', 'Post Section', 'postsection', 'extreme.cms', 'PSS', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125deefb-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000049', 'Page Section', 'pagesection', 'extreme.cms', 'PGS', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125e53ea-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000050', 'Post Category', 'postcategory', 'extreme.cms', 'PSC', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125e7cc4-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000051', 'Widget Position', 'widgetposition', 'extreme.cms', 'WDP', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125f2c81-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000052', 'Post Gallery', 'postgallery', 'extreme.cms', 'PSG', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'a803a87c-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000053', 'Post Relation', 'postrelation', 'extreme.cms', 'PSR', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'a804855a-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000054', 'Page Link Type', 'pagelinktype', 'extreme.cms', 'PLT', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'a804f970-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000055', 'Post Relation Type', 'postrelationtype', 'extreme.cms', 'PRP', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'a806223f-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000002', 'menu', 'MNUxxxxxxxxxx', 'MNU0000000001', '1', '1', '', '0', '', '5db0bb65-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000003', 'post', 'PSTxxxxxxxxxx', 'PST0000000000', '1', '1', '', '0', '', '5db0feb6-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000004', 'page', 'PGExxxxxxxxxx', 'PGE0000000000', '1', '1', '', '0', '', '5db14a73-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000010', 'template', 'TMPxxxxxxxxxx', 'TMP0000000000', '1', '1', '', '0', '', '5db244e3-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000017', 'posttype', 'PSPxxxxxxxxxx', 'PSP0000000000', '1', '1', '', '0', '', '5db35f84-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000018', 'menuitem', 'MNIxxxxxxxxxx', 'MNI0000000000', '1', '1', '', '0', '', '5db39b15-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000021', 'pagelink', 'PGLxxxxxxxxxx', 'PGL0000000000', '1', '1', '', '0', '', '5db52635-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000031', 'pagewidget', 'PGWxxxxxxxxxx', 'PGW0000000000', '1', '1', '', '0', '', '5db7427a-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000032', 'widgettype', 'WDTxxxxxxxxxx', 'WDT0000000000', '1', '1', '', '0', '', '5db76957-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000035', 'pagesection', 'PGSxxxxxxxxxx', 'PGS0000000000', '1', '1', '', '0', '', '5db80815-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000039', 'postgallery', 'PSGxxxxxxxxxx', 'PSG0000000000', '1', '1', '', '0', '', '5db8d3bc-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000040', 'postsection', 'PSSxxxxxxxxxx', 'PSS0000000000', '1', '1', '', '0', '', '5db91056-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000042', 'pagegallery', 'PGGxxxxxxxxxx', 'PGG0000000000', '1', '1', '', '0', '', '5db98072-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000047', 'postrelation', 'PSRxxxxxxxxxx', 'PSR0000000000', '1', '1', '', '0', '', '5dba7be6-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000050', 'postcategory', 'PSCxxxxxxxxxx', 'PSC0000000000', '1', '1', '', '0', '', '5dbb169d-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000053', 'pagelinktype', 'PLTxxxxxxxxxx', 'PLT0000000000', '1', '1', '', '0', '', '5dbbd422-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000060', 'widgetposition', 'WDPxxxxxxxxxx', 'WDP0000000000', '1', '1', '', '0', '', '5dbd4889-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000070', 'postrelationtype', 'PRPxxxxxxxxxx', 'PRP0000000000', '1', '1', '', '0', '', '5dbf53d0-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000004', 'menu', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb4dfd14-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000005', 'menu', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb4e17c7-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000006', 'menu', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb4e3224-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000007', 'post', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb4e4cc6-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000008', 'post', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb4e66bd-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000009', 'post', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb4e8519-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000010', 'page', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb4ea05d-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000011', 'page', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb4eb600-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000012', 'page', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb4ecc35-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000028', 'template', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb537132-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000029', 'template', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb538934-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000030', 'template', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb539fd8-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000049', 'posttype', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb552a63-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000050', 'posttype', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb554958-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000051', 'posttype', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb55690f-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000052', 'menuitem', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb55886b-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000053', 'menuitem', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb55a68f-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000054', 'menuitem', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb55be62-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000061', 'pagelink', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb564fa0-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000062', 'pagelink', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb567225-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000063', 'pagelink', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb568e73-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000091', 'pagewidget', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb591213-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000092', 'pagewidget', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb5926f1-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000093', 'pagewidget', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb593b0a-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000094', 'widgettype', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb594f75-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000095', 'widgettype', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb5964be-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000096', 'widgettype', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb597882-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000103', 'pagesection', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb5a4e49-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000104', 'pagesection', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb5a659d-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000105', 'pagesection', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb5a7d27-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000115', 'postgallery', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb5b39fc-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000116', 'postgallery', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb5b4e49-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000117', 'postgallery', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb5b6278-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000118', 'postsection', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb5b7692-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000119', 'postsection', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb5b8aa3-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000120', 'postsection', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb5b9d1d-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000124', 'pagegallery', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb5be5e9-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000125', 'pagegallery', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb5bf7a8-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000126', 'pagegallery', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb5c09d1-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000139', 'postrelation', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb5cf98f-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000140', 'postrelation', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb5d0b92-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000141', 'postrelation', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb5d1dd5-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000148', 'postcategory', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb5d9bc3-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000149', 'postcategory', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb5dbf08-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000150', 'postcategory', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb5dd187-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000157', 'pagelinktype', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb5e5692-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000158', 'pagelinktype', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb5e6d76-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000159', 'pagelinktype', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb5e9603-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000178', 'widgetposition', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb603ecb-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000179', 'widgetposition', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb605685-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000180', 'widgetposition', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb606e9d-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000208', 'postrelationtype', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb631642-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000209', 'postrelationtype', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb632e96-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000210', 'postrelationtype', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb634672-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000259', 'Name', 'page', 'NAME', '', '', '1', '', '0', '', 'd0e2586f-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000260', 'Title', 'page', 'TITLE', '', '', '1', '', '0', '', 'd0e774f3-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000261', 'Parent', 'page', 'PARENT', '', '', '1', '', '0', '', 'd0e78323-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000262', 'Slug', 'page', 'SLUG', '', '', '1', '', '0', '', 'd0e78f19-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000263', 'Tag line', 'page', 'TAG_LINE', '', '', '1', '', '0', '', 'd0e79b03-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000264', 'Thumb', 'page', 'THUMB', '', '', '1', '', '0', '', 'd0e7a6d3-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000265', 'Background image', 'page', 'BACKGROUND_IMAGE', '', '', '1', '', '0', '', 'd0e7b30e-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000266', 'Image', 'page', 'IMAGE', '', '', '1', '', '0', '', 'd0e7bed1-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000267', 'Video', 'page', 'VIDEO', '', '', '1', '', '0', '', 'd0e7ca83-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000268', 'Meta keywords', 'page', 'META_KEYWORDS', '', '', '1', '', '0', '', 'd0e7d694-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000269', 'Meta description', 'page', 'META_DESCRIPTION', '', '', '1', '', '0', '', 'd0e7e2d3-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000270', 'Introduction', 'page', 'INTRODUCTION', '', '', '1', '', '0', '', 'd0e7eedf-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000271', 'Content', 'page', 'CONTENT', '', '', '1', '', '0', '', 'd0e7fa95-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000272', 'Footer', 'page', 'FOOTER', '', '', '1', '', '0', '', 'd0e80643-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000273', 'Template', 'page', 'ID_TEMPLATE', '', '', '1', '', '0', '', 'd0e8120a-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000274', 'Additional css', 'page', 'ADDITIONAL_CSS', '', '', '1', '', '0', '', 'd0e81e16-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000275', 'Custom top menu', 'page', 'CUSTOM_TOP_ID_MENU', '', '', '1', '', '0', '', 'd0e82a2b-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000276', 'Custom side menu', 'page', 'CUSTOM_SIDE_ID_MENU', '', '', '1', '', '0', '', 'd0e8367f-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000277', 'View more title', 'page', 'VIEW_MORE_TITLE', '', '', '1', '', '0', '', 'd0e8428b-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000278', 'View more page', 'page', 'VIEW_MORE_ID_PAGE', '', '', '1', '', '0', '', 'd0e84eb5-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000279', 'View more link', 'page', 'VIEW_MORE_LINK', '', '', '1', '', '0', '', 'd0e85e3b-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000280', 'Latest update', 'page', 'LATEST_UPDATE', '', '', '1', '', '0', '', 'd0e86a69-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000281', '# views', 'page', 'NBR_VIEWS', '', '', '1', '', '0', '', 'd0e87630-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000282', 'Name', 'menu', 'NAME', '', '', '1', '', '0', '', 'd0e882ac-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000283', 'Code', 'menu', 'CODE', 'This is an edit-once field. Its value cannot be modified afterward.', '', '1', '', '0', '', 'd0e88e5e-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000284', 'Class', 'menu', 'CLASS', '', '', '1', '', '0', '', 'd0f62895-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000285', 'Title', 'post', 'TITLE', '', '', '1', '', '0', '', 'd0f64b33-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000286', 'Slug', 'post', 'SLUG', '', '', '1', '', '0', '', 'd0f66bd9-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000287', 'Post type', 'post', 'ID_POST_TYPE', '', '', '1', '', '0', '', 'd0f6963d-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000288', 'Post category', 'post', 'ID_POST_CATEGORY', '', '', '1', '', '0', '', 'd0f6c172-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000289', 'Image', 'post', 'IMAGE', '', '', '1', '', '0', '', 'd0f6e59a-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000290', 'Meta keywords', 'post', 'META_KEYWORDS', '', '', '1', '', '0', '', 'd0f7071e-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000291', 'Meta description', 'post', 'META_DESCRIPTION', '', '', '1', '', '0', '', 'd0f7292f-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000292', 'Description', 'post', 'DESCRIPTION', '', '', '1', '', '0', '', 'd0f74d46-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000293', 'Content', 'post', 'CONTENT', '', '', '1', '', '0', '', 'd0f7706a-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000294', 'Tags', 'post', 'TAGS', '', '', '1', '', '0', '', 'd0f79319-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000295', 'Author', 'post', 'AUTHOR', '', '', '1', '', '0', '', 'd0f7b674-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000296', 'External link', 'post', 'EXTERNAL_LINK', '', '', '1', '', '0', '', 'd0f7da87-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000297', 'Template', 'post', 'ID_TEMPLATE', '', '', '1', '', '0', '', 'd0f7fdf2-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000298', 'Creation date', 'post', 'CREATION_DATE', '', '', '1', '', '0', '', 'd0f8246d-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000299', 'Latest update', 'post', 'LATEST_UPDATE', '', '', '1', '', '0', '', 'd0f846c3-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000300', 'Post status', 'post', 'ID_POST_STATUS', '', '', '1', '', '0', '', 'd0f86f7f-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000301', 'Featured?', 'post', 'IS_FEATURED', '', '', '1', '', '0', '', 'd0f8ab69-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000302', '# views', 'post', 'NBR_VIEWS', '', '', '1', '', '0', '', 'd0f8cbad-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000303', 'Name', 'template', 'NAME', '', '', '1', '', '0', '', 'd1079033-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000304', 'Code', 'template', 'CODE', 'This is an edit-once field. Its value cannot be modified afterward.', '', '1', '', '0', '', 'd107b300-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000305', 'Downloadable?', 'template', 'IS_DOWNLOADABLE', '', '', '1', '', '0', '', 'd107d8dc-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000306', 'Content type', 'template', 'CONTENT_TYPE', '', '', '1', '', '0', '', 'd107fce7-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000307', 'Extension', 'template', 'EXTENSION', '', '', '1', '', '0', '', 'd1082131-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000308', 'Title', 'menuitem', 'TITLE', '', '', '1', '', '0', '', 'd10a352e-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000309', 'Class', 'menuitem', 'CLASS', '', '', '1', '', '0', '', 'd10a5815-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000310', 'Tag line', 'menuitem', 'TAG_LINE', '', '', '1', '', '0', '', 'd10a7b41-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000311', 'Menu', 'menuitem', 'ID_MENU', '', '', '1', '', '0', '', 'd10a9e42-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000312', 'Parent', 'menuitem', 'PARENT', '', '', '1', '', '0', '', 'd10ac214-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000313', 'Page', 'menuitem', 'ID_PAGE', '', '', '1', '', '0', '', 'd10ae562-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000314', 'Post', 'menuitem', 'ID_POST', '', '', '1', '', '0', '', 'd10b08db-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000315', 'Post category', 'menuitem', 'ID_POST_CATEGORY', '', '', '1', '', '0', '', 'd10b2cf6-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000316', 'Path', 'menuitem', 'PATH', '', '', '1', '', '0', '', 'd10b503b-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000317', 'Custom content', 'menuitem', 'CUSTOM_CONTENT', '', '', '1', '', '0', '', 'd10b745b-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000318', 'Has break after?', 'menuitem', 'HAS_BREAK_AFTER', '', '', '1', '', '0', '', 'd10b9990-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000319', 'Ordering', 'menuitem', 'ORDERING', '', '', '1', '', '0', '', 'd10bbceb-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000320', 'Acl user group', 'menuitem', 'ACL_ID_USER_GROUP', '', '', '1', '', '0', '', 'd10be3b3-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000321', 'Name', 'posttype', 'NAME', '', '', '1', '', '0', '', 'd10dacbc-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000322', 'Code', 'posttype', 'CODE', 'This is an edit-once field. Its value cannot be modified afterward.', '', '1', '', '0', '', 'd10dd272-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000323', 'Title', 'pagelink', 'TITLE', '', '', '1', '', '0', '', 'd10df6e2-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000324', 'Page', 'pagelink', 'ID_PAGE', '', '', '1', '', '0', '', 'd10e19e3-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000325', 'Font awesome icon', 'pagelink', 'FONT_AWESOME_ICON', '', '', '1', '', '0', '', 'd10e3e87-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000326', 'Link page', 'pagelink', 'LINK_ID_PAGE', '', '', '1', '', '0', '', 'd10e5f6d-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000327', 'Link path', 'pagelink', 'LINK_PATH', '', '', '1', '', '0', '', 'd10e83a2-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000328', 'Page link type', 'pagelink', 'ID_PAGE_LINK_TYPE', '', '', '1', '', '0', '', 'd10ea5e7-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000329', 'Ordering', 'pagelink', 'ORDERING', '', '', '1', '', '0', '', 'd10ec957-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000330', 'Name', 'widgettype', 'NAME', '', '', '1', '', '0', '', 'd11614c7-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000331', 'Code', 'widgettype', 'CODE', 'This is an edit-once field. Its value cannot be modified afterward.', '', '1', '', '0', '', 'd1163889-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000332', 'Page', 'pagewidget', 'ID_PAGE', '', '', '1', '', '0', '', 'd117447b-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000333', 'Title', 'pagewidget', 'TITLE', '', '', '1', '', '0', '', 'd117b051-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000334', 'Code', 'pagewidget', 'CODE', 'This is an edit-once field. Its value cannot be modified afterward.', '', '1', '', '0', '', 'd117d428-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000335', 'Link', 'pagewidget', 'LINK', '', '', '1', '', '0', '', 'd117f765-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000336', 'Image', 'pagewidget', 'IMAGE', '', '', '1', '', '0', '', 'd1181fff-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000337', 'Widget type', 'pagewidget', 'ID_WIDGET_TYPE', '', '', '1', '', '0', '', 'd1184462-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000338', 'Widget position', 'pagewidget', 'ID_WIDGET_POSITION', '', '', '1', '', '0', '', 'd11868cf-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000339', 'Content', 'pagewidget', 'CONTENT', '', '', '1', '', '0', '', 'd1188c50-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000340', 'Hide title', 'pagewidget', 'HIDE_TITLE', '', '', '1', '', '0', '', 'd118b246-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000341', 'Ordering', 'pagewidget', 'ORDERING', '', '', '1', '', '0', '', 'd118d5ff-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000342', 'Title', 'pagegallery', 'TITLE', '', '', '1', '', '0', '', 'd11d3826-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000343', 'Page', 'pagegallery', 'ID_PAGE', '', '', '1', '', '0', '', 'd11d5e2d-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000344', 'Image', 'pagegallery', 'IMAGE', '', '', '1', '', '0', '', 'd11d7dac-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000345', 'Link page', 'pagegallery', 'LINK_ID_PAGE', '', '', '1', '', '0', '', 'd11da1a9-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000346', 'Link path', 'pagegallery', 'LINK_PATH', '', '', '1', '', '0', '', 'd11dc54d-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000347', 'Description', 'pagegallery', 'DESCRIPTION', '', '', '1', '', '0', '', 'd11deb43-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000348', 'Ordering', 'pagegallery', 'ORDERING', '', '', '1', '', '0', '', 'd11e0a05-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000349', 'Title', 'postsection', 'TITLE', '', '', '1', '', '0', '', 'd11e2c24-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000350', 'Post', 'postsection', 'ID_POST', '', '', '1', '', '0', '', 'd11e4efa-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000351', 'Tag line', 'postsection', 'TAG_LINE', '', '', '1', '', '0', '', 'd11e72a6-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000352', 'Image', 'postsection', 'IMAGE', '', '', '1', '', '0', '', 'd11e9584-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000353', 'Background image', 'postsection', 'BACKGROUND_IMAGE', '', '', '1', '', '0', '', 'd11eb9dc-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000354', 'Background color', 'postsection', 'BACKGROUND_COLOR', '', '', '1', '', '0', '', 'd11edfbc-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000355', 'Video', 'postsection', 'VIDEO', '', '', '1', '', '0', '', 'd11f045c-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000356', 'Content', 'postsection', 'CONTENT', '', '', '1', '', '0', '', 'd11f262d-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000357', 'Link path', 'postsection', 'LINK_PATH', '', '', '1', '', '0', '', 'd11f47dc-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000358', 'Ordering', 'postsection', 'ORDERING', '', '', '1', '', '0', '', 'd11f68dc-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000359', 'Title', 'pagesection', 'TITLE', '', '', '1', '', '0', '', 'd124b0af-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000360', 'Page', 'pagesection', 'ID_PAGE', '', '', '1', '', '0', '', 'd124d4a8-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000361', 'Code', 'pagesection', 'CODE', 'This is an edit-once field. Its value cannot be modified afterward.', '', '1', '', '0', '', 'd124f7dc-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000362', 'Parent', 'pagesection', 'PARENT', '', '', '1', '', '0', '', 'd1251c2b-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000363', 'Tag line', 'pagesection', 'TAG_LINE', '', '', '1', '', '0', '', 'd1253ff5-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000364', 'Image', 'pagesection', 'IMAGE', '', '', '1', '', '0', '', 'd125618e-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000365', 'Font awesome icon', 'pagesection', 'FONT_AWESOME_ICON', '', '', '1', '', '0', '', 'd12586b7-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000366', 'Background image', 'pagesection', 'BACKGROUND_IMAGE', '', '', '1', '', '0', '', 'd125b358-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000367', 'Background color', 'pagesection', 'BACKGROUND_COLOR', '', '', '1', '', '0', '', 'd125d885-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000368', 'Video', 'pagesection', 'VIDEO', '', '', '1', '', '0', '', 'd125f528-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000369', 'Content', 'pagesection', 'CONTENT', '', '', '1', '', '0', '', 'd126113a-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000370', 'Tags', 'pagesection', 'TAGS', '', '', '1', '', '0', '', 'd1262e44-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000371', 'View more title', 'pagesection', 'VIEW_MORE_TITLE', '', '', '1', '', '0', '', 'd12652e3-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000372', 'View more page', 'pagesection', 'VIEW_MORE_ID_PAGE', '', '', '1', '', '0', '', 'd1267502-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000373', 'View more link', 'pagesection', 'VIEW_MORE_LINK', '', '', '1', '', '0', '', 'd12695e8-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000374', 'Hide title', 'pagesection', 'HIDE_TITLE', '', '', '1', '', '0', '', 'd126b2d4-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000375', 'Tab anchor section?', 'pagesection', 'IS_TAB_ANCHOR_SECTION', '', '', '1', '', '0', '', 'd126d39c-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000376', 'Tab anchor title', 'pagesection', 'TAB_ANCHOR_TITLE', '', '', '1', '', '0', '', 'd126f3bd-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000377', 'Ordering', 'pagesection', 'ORDERING', '', '', '1', '', '0', '', 'd1271344-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000378', 'Name', 'postcategory', 'NAME', '', '', '1', '', '0', '', 'd1273509-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000379', 'Slug', 'postcategory', 'SLUG', '', '', '1', '', '0', '', 'd12757ec-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000380', 'Parent', 'postcategory', 'PARENT', '', '', '1', '', '0', '', 'd1276b05-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000381', 'Ordering', 'postcategory', 'ORDERING', '', '', '1', '', '0', '', 'd1277d8c-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000382', 'Name', 'widgetposition', 'NAME', '', '', '1', '', '0', '', 'd12a2efe-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000383', 'Code', 'widgetposition', 'CODE', 'This is an edit-once field. Its value cannot be modified afterward.', '', '1', '', '0', '', 'd12a49b6-1ba9-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000384', 'Refid', 'page', 'REFID', '', '', '1', '', '0', '', '560e8a99-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000385', 'Json', 'page', 'JSON', '', '', '1', '', '0', '', '561076b8-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000386', 'Refid', 'menu', 'REFID', '', '', '1', '', '0', '', '56108e1c-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000387', 'Json', 'menu', 'JSON', '', '', '1', '', '0', '', '5610c6af-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000388', 'Refid', 'post', 'REFID', '', '', '1', '', '0', '', '5610d538-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000389', 'Json', 'post', 'JSON', '', '', '1', '', '0', '', '56120ab0-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000390', 'Refid', 'template', 'REFID', '', '', '1', '', '0', '', '56155edb-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000391', 'Json', 'template', 'JSON', '', '', '1', '', '0', '', '5615b408-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000392', 'Refid', 'menuitem', 'REFID', '', '', '1', '', '0', '', '5617e740-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000393', 'Json', 'menuitem', 'JSON', '', '', '1', '', '0', '', '5618d90d-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000394', 'Refid', 'posttype', 'REFID', '', '', '1', '', '0', '', '5619a1fb-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000395', 'Json', 'posttype', 'JSON', '', '', '1', '', '0', '', '5619d16a-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000396', 'Refid', 'pagelink', 'REFID', '', '', '1', '', '0', '', '5619dff8-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000397', 'Json', 'pagelink', 'JSON', '', '', '1', '', '0', '', '561a51e7-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000398', 'Refid', 'widgettype', 'REFID', '', '', '1', '', '0', '', '561d52ba-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000399', 'Json', 'widgettype', 'JSON', '', '', '1', '', '0', '', '561d7f8a-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000400', 'Refid', 'pagewidget', 'REFID', '', '', '1', '', '0', '', '561df886-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000401', 'Json', 'pagewidget', 'JSON', '', '', '1', '', '0', '', '561ea7e0-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000402', 'Refid', 'pagegallery', 'REFID', '', '', '1', '', '0', '', '562053f9-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000403', 'Json', 'pagegallery', 'JSON', '', '', '1', '', '0', '', '5620ba29-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000404', 'Refid', 'postsection', 'REFID', '', '', '1', '', '0', '', '5620c77e-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000405', 'Json', 'postsection', 'JSON', '', '', '1', '', '0', '', '56215a24-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000406', 'Refid', 'pagesection', 'REFID', '', '', '1', '', '0', '', '562220af-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000407', 'Json', 'pagesection', 'JSON', '', '', '1', '', '0', '', '56233377-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000408', 'Refid', 'postcategory', 'REFID', '', '', '1', '', '0', '', '562340e6-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000409', 'Json', 'postcategory', 'JSON', '', '', '1', '', '0', '', '5623801f-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000410', 'Refid', 'widgetposition', 'REFID', '', '', '1', '', '0', '', '5624d046-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000411', 'Json', 'widgetposition', 'JSON', '', '', '1', '', '0', '', '5624f5a6-1bad-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000412', 'Title', 'postgallery', 'TITLE', '', '', '1', '', '0', '', '729b4781-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000413', 'Post', 'postgallery', 'ID_POST', '', '', '1', '', '0', '', '729b5ac9-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000414', 'Image', 'postgallery', 'IMAGE', '', '', '1', '', '0', '', '729b6d95-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000415', 'Description', 'postgallery', 'DESCRIPTION', '', '', '1', '', '0', '', '729b7fba-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000416', 'Ordering', 'postgallery', 'ORDERING', '', '', '1', '', '0', '', '729df61d-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000417', 'Post', 'postrelation', 'ID_POST', '', '', '1', '', '0', '', '72af3ccc-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000418', 'Peer post', 'postrelation', 'PEER_ID_POST', '', '', '1', '', '0', '', '72af620f-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000419', 'Post relation type', 'postrelation', 'ID_POST_RELATION_TYPE', '', '', '1', '', '0', '', '72af8715-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000420', 'Refid', 'pagelinktype', 'REFID', '', '', '1', '', '0', '', '72b1f931-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000421', 'Name', 'pagelinktype', 'NAME', '', '', '1', '', '0', '', '72b21d59-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000422', 'Code', 'pagelinktype', 'CODE', 'This is an edit-once field. Its value cannot be modified afterward.', '', '1', '', '0', '', '72b24145-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000423', 'Ordering', 'pagelinktype', 'ORDERING', '', '', '1', '', '0', '', '72b26479-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000424', 'Name', 'postrelationtype', 'NAME', '', '', '1', '', '0', '', '72bca5b0-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000425', 'Code', 'postrelationtype', 'CODE', 'This is an edit-once field. Its value cannot be modified afterward.', '', '1', '', '0', '', '72bccb84-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000426', 'Refid', 'postgallery', 'REFID', '', '', '1', '', '0', '', 'dfc219a5-1bbd-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000427', 'Json', 'postgallery', 'JSON', '', '', '1', '', '0', '', 'dfc5afae-1bbd-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000428', 'Refid', 'postrelation', 'REFID', '', '', '1', '', '0', '', 'dfc9e3fe-1bbd-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000429', 'Json', 'postrelation', 'JSON', '', '', '1', '', '0', '', 'dfca2489-1bbd-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000430', 'Json', 'pagelinktype', 'JSON', '', '', '1', '', '0', '', 'dfcce859-1bbd-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000431', 'Refid', 'postrelationtype', 'REFID', '', '', '1', '', '0', '', 'dfd64d6a-1bbd-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000432', 'Json', 'postrelationtype', 'JSON', '', '', '1', '', '0', '', 'dfd6ded3-1bbd-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000433', 'Excerpt', 'post', 'EXCERPT', '', '', '1', '', '0', '', '427c18a5-1bc8-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000434', 'Module', 'template', 'MODULE', '', '', '1', '', '0', '', '1a76a705-1bd2-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000435', 'Description', 'postcategory', 'DESCRIPTION', '', '', '1', '', '0', '', 'e75de16c-1bd2-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000436', 'Template', 'postcategory', 'ID_TEMPLATE', '', '', '1', '', '0', '', 'e75df405-1bd2-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000003', 'menu', '*', '', '1', '', '', '1', '1', '', '0', '', '6e171324-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000004', 'menu', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e172411-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000005', 'post', '*', '', '1', '', '', '1', '1', '', '0', '', '6e17347e-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000006', 'post', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e17459e-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000007', 'page', '*', '', '1', '', '', '1', '1', '', '0', '', '6e1755e8-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000008', 'page', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e176695-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000019', 'template', '*', '', '1', '', '', '1', '1', '', '0', '', '6e1f3b27-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000020', 'template', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e1f4b24-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000034', 'posttype', '*', '', '1', '', '', '1', '1', '', '0', '', '6e204330-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000035', 'posttype', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e20549d-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000036', 'menuitem', '*', '', '1', '', '', '1', '1', '', '0', '', '6e2065e4-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000037', 'menuitem', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e207722-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000038', 'menuitem', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '6e2088dc-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000043', 'pagelink', '*', '', '1', '', '', '1', '1', '', '0', '', '6e20de34-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000044', 'pagelink', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e20ef59-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000045', 'pagelink', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '6e21020f-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000064', 'pagewidget', '*', '', '1', '', '', '1', '1', '', '0', '', '6e229d82-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000065', 'pagewidget', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e22aeaf-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000066', 'pagewidget', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '6e22c0a5-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000067', 'widgettype', '*', '', '1', '', '', '1', '1', '', '0', '', '6e22daff-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000068', 'widgettype', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e22ed5b-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000073', 'pagesection', '*', '', '1', '', '', '1', '1', '', '0', '', '6e234e6e-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000074', 'pagesection', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e235ff5-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000075', 'pagesection', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '6e23714d-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000085', 'postgallery', '*', '', '1', '', '', '1', '1', '', '0', '', '6e242755-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000086', 'postgallery', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e2439fa-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000087', 'postgallery', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '6e244bdb-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000088', 'postsection', '*', '', '1', '', '', '1', '1', '', '0', '', '6e2466d7-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000089', 'postsection', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e24792f-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000090', 'postsection', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '6e248c66-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000093', 'pagegallery', '*', '', '1', '', '', '1', '1', '', '0', '', '6e24ce5d-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000094', 'pagegallery', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e24e071-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000095', 'pagegallery', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '6e24f808-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000104', 'postrelation', '*', '', '1', '', '', '1', '1', '', '0', '', '6e25aba9-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000105', 'postrelation', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e25bdce-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000106', 'postrelation', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '6e25d1d2-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000112', 'postcategory', '*', '', '1', '', '', '1', '1', '', '0', '', '6e26585e-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000113', 'postcategory', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e266f82-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000119', 'pagelinktype', '*', '', '1', '', '', '1', '1', '', '0', '', '6e27032d-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000120', 'pagelinktype', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e27179c-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000136', 'widgetposition', '*', '', '1', '', '', '1', '1', '', '0', '', '6e28314a-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000137', 'widgetposition', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e284125-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000162', 'postrelationtype', '*', '', '1', '', '', '1', '1', '', '0', '', '6e29d0b7-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000163', 'postrelationtype', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e29e0b4-2f56-11e5-8947-cc52af77857f');