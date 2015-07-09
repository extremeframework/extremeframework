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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HIERACHY` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
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
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  UNIQUE KEY `uniquekey` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  UNIQUE KEY `uniquekey` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
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
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
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
  PRIMARY KEY (`ID`)
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
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
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
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000038', '1', 'page', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', '1260f3bc-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000039', '1', 'menu', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', '1265b5ba-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000040', '1', 'post', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', '1265e095-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000041', '1', 'template', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', '126602cd-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000042', '1', 'menuitem', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', '126625b4-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000043', '1', 'posttype', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', '126641ca-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000044', '1', 'pagelink', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', '126659a2-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000045', '1', 'widgettype', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', '126671b1-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000046', '1', 'pagewidget', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', '12668989-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000047', '1', 'pagegallery', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', '1266a4fd-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000048', '1', 'postsection', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', '1266bef3-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000049', '1', 'pagesection', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', '1266dcba-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000050', '1', 'postcategory', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', '1266f66c-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000051', '1', 'widgetposition', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', '12670f04-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000052', '1', 'postgallery', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'a8079a61-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000053', '1', 'postrelation', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'a80a4d4d-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000054', '1', 'pagelinktype', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'a80a6efc-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000055', '1', 'postrelationtype', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '1', '', '0', '', 'a80a99a4-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000002484', 'All', 'page', 'NAME,ID_TEMPLATE', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000002485', 'All', 'post', 'TITLE,IMAGE,ID_POST_CATEGORY,ID_TEMPLATE', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000002486', 'All', 'menu', 'NAME,CODE,CLASS', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000002490', 'All', 'template', 'NAME,CODE,MODULE', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000002494', 'All', 'pagelink', 'TITLE,ID_PAGE,ID_PAGE_LINK_TYPE,ORDERING', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000002498', 'All', 'menuitem', 'TITLE,ID_MENU,ID_PAGE,ID_POST,ID_POST_CATEGORY,ORDERING', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000002499', 'All', 'posttype', 'NAME,CODE', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000002507', 'All', 'widgettype', 'NAME,CODE', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000002509', 'All', 'pagewidget', 'TITLE,ID_PAGE,IMAGE,ID_WIDGET_TYPE,ORDERING', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000002513', 'All', 'postgallery', 'TITLE,ID_POST,IMAGE,ORDERING', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000002515', 'All', 'postsection', 'TITLE,ID_POST,IMAGE,ORDERING', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000002517', 'All', 'pagesection', 'TITLE,ID_PAGE,IMAGE,ORDERING', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000002518', 'All', 'pagegallery', 'TITLE,ID_PAGE,IMAGE,ORDERING', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000002523', 'All', 'postrelation', 'ID_POST,PEER_ID_POST,ID_POST_RELATION_TYPE', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000002524', 'All', 'postcategory', 'NAME,ID_TEMPLATE,ORDERING', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000002528', 'All', 'pagelinktype', 'NAME,CODE,ORDERING', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000002530', 'All', 'widgetposition', 'NAME,CODE', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000002537', 'All', 'postrelationtype', 'NAME,CODE', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_ACL_USER_GROUP', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_ADDITIONAL_CSS', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_AUTHOR', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_BACKGROUND_COLOR', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_BACKGROUND_COLOR', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_BACKGROUND_IMAGE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_BACKGROUND_IMAGE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_BACKGROUND_IMAGE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_CLASS', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_CLASS', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_CODE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_CODE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_CODE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_CODE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_CODE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_CODE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_CODE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_CODE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_CODE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_CONTENT', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_CONTENT', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_CONTENT', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_CONTENT', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_CONTENT', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_CREATION_DATE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_CUSTOM_CONTENT', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_CUSTOM_SIDE_MENU', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_CUSTOM_TOP_MENU', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_DESCRIPTION', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_DESCRIPTION', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_DESCRIPTION', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_EXCERPT', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_EXTERNAL_LINK', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_FONT_AWESOME_ICON', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_FONT_AWESOME_ICON', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_FOOTER', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_HAS_BREAK_AFTER', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_HIDE_TITLE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_HIDE_TITLE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_IMAGE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_IMAGE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_IMAGE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_IMAGE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_IMAGE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_IMAGE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_IMAGE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_INTRODUCTION', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_IS_FEATURED', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_IS_TAB_ANCHOR_SECTION', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_LATEST_UPDATE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_LATEST_UPDATE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_LINK', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_LINK_PAGE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_LINK_PAGE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_LINK_PATH', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_LINK_PATH', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_LINK_PATH', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_MENU', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_MENU_NAME', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_META_DESCRIPTION', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_META_DESCRIPTION', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_META_KEYWORDS', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_META_KEYWORDS', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_MODULE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_NBR_VIEWS', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_NBR_VIEWS', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_PAGE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_PAGE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_PAGE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_PAGE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_PAGE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_PAGE_LINK_TYPE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_PAGE_LINK_TYPE_NAME', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_PAGE_NAME', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_PARENT', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_PARENT', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_PARENT', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_PARENT', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_PATH', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_PEER_POST', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_POST', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_POST', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_POST', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_POST', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_POST_CATEGORY', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_POST_CATEGORY', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_POST_CATEGORY_NAME', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_POST_RELATION_TYPE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_POST_RELATION_TYPE_NAME', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_POST_TYPE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_POST_TYPE_NAME', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_SLUG', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_SLUG', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_SLUG', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_TAB_ANCHOR_TITLE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_TAGS', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_TAGS', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_TAG_LINE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_TAG_LINE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_TAG_LINE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_TAG_LINE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_TEMPLATE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_TEMPLATE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_TEMPLATE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_TEMPLATE_NAME', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_THUMB', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_TITLE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_TITLE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_TITLE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_TITLE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_TITLE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_TITLE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_TITLE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_TITLE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_TITLE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_VIDEO', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_VIDEO', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_VIDEO', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_VIEW_MORE_LINK', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_VIEW_MORE_LINK', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_VIEW_MORE_PAGE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_VIEW_MORE_PAGE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_VIEW_MORE_TITLE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_VIEW_MORE_TITLE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_WIDGET_POSITION', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_WIDGET_POSITION_NAME', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_WIDGET_TYPE', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('L_WIDGET_TYPE_NAME', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_ACL_USER_GROUP'), 'Acl user group', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_ADDITIONAL_CSS'), 'Additional css', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_AUTHOR'), 'Author', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_BACKGROUND_COLOR'), 'Background color', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_BACKGROUND_COLOR'), 'Background color', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_BACKGROUND_IMAGE'), 'Background image', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_BACKGROUND_IMAGE'), 'Background image', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_BACKGROUND_IMAGE'), 'Background image', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_CLASS'), 'Class', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_CLASS'), 'Class', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_CODE'), 'Code', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_CODE'), 'Code', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_CODE'), 'Code', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_CODE'), 'Code', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_CODE'), 'Code', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_CODE'), 'Code', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_CODE'), 'Code', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_CODE'), 'Code', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_CODE'), 'Code', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_CONTENT'), 'Content', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_CONTENT'), 'Content', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_CONTENT'), 'Content', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_CONTENT'), 'Content', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_CONTENT'), 'Content', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_CREATION_DATE'), 'Creation date', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_CUSTOM_CONTENT'), 'Custom content', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_CUSTOM_SIDE_MENU'), 'Custom side menu', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_CUSTOM_TOP_MENU'), 'Custom top menu', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_DESCRIPTION'), 'Description', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_DESCRIPTION'), 'Description', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_DESCRIPTION'), 'Description', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_EXCERPT'), 'Excerpt', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_EXTERNAL_LINK'), 'External link', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_FONT_AWESOME_ICON'), 'Font awesome icon', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_FONT_AWESOME_ICON'), 'Font awesome icon', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_FOOTER'), 'Footer', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_HAS_BREAK_AFTER'), 'Has break after?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_HIDE_TITLE'), 'Hide title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_HIDE_TITLE'), 'Hide title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_IMAGE'), 'Image', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_IMAGE'), 'Image', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_IMAGE'), 'Image', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_IMAGE'), 'Image', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_IMAGE'), 'Image', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_IMAGE'), 'Image', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_IMAGE'), 'Image', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_INTRODUCTION'), 'Introduction', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_IS_FEATURED'), 'Featured?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_IS_TAB_ANCHOR_SECTION'), 'Tab anchor section?', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_LATEST_UPDATE'), 'Latest update', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_LATEST_UPDATE'), 'Latest update', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_LINK'), 'Link', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_LINK_PAGE'), 'Link page', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_LINK_PAGE'), 'Link page', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_LINK_PATH'), 'Link path', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_LINK_PATH'), 'Link path', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_LINK_PATH'), 'Link path', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_MENU'), 'Menu', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_MENU_NAME'), 'Menu name', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_META_DESCRIPTION'), 'Meta description', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_META_DESCRIPTION'), 'Meta description', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_META_KEYWORDS'), 'Meta keywords', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_META_KEYWORDS'), 'Meta keywords', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_MODULE'), 'Module', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_NBR_VIEWS'), '# views', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_NBR_VIEWS'), '# views', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_PAGE'), 'Page', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_PAGE'), 'Page', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_PAGE'), 'Page', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_PAGE'), 'Page', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_PAGE'), 'Page', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_PAGE_LINK_TYPE'), 'Page link type', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_PAGE_LINK_TYPE_NAME'), 'Page link type name', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_PAGE_NAME'), 'Page name', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_PARENT'), 'Parent', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_PARENT'), 'Parent', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_PARENT'), 'Parent', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_PARENT'), 'Parent', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_PATH'), 'Path', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_PEER_POST'), 'Peer post', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_POST'), 'Post', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_POST'), 'Post', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_POST'), 'Post', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_POST'), 'Post', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_POST_CATEGORY'), 'Post category', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_POST_CATEGORY'), 'Post category', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_POST_CATEGORY_NAME'), 'Post category name', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_POST_RELATION_TYPE'), 'Post relation type', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_POST_RELATION_TYPE_NAME'), 'Post relation type name', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_POST_TYPE'), 'Post type', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_POST_TYPE_NAME'), 'Post type name', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_SLUG'), 'Slug', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_SLUG'), 'Slug', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_SLUG'), 'Slug', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_TAB_ANCHOR_TITLE'), 'Tab anchor title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_TAGS'), 'Tags', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_TAGS'), 'Tags', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_TAG_LINE'), 'Tag line', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_TAG_LINE'), 'Tag line', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_TAG_LINE'), 'Tag line', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_TAG_LINE'), 'Tag line', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_TEMPLATE'), 'Template', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_TEMPLATE'), 'Template', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_TEMPLATE'), 'Template', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_TEMPLATE_NAME'), 'Template name', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_THUMB'), 'Thumb', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_TITLE'), 'Title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_TITLE'), 'Title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_TITLE'), 'Title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_TITLE'), 'Title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_TITLE'), 'Title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_TITLE'), 'Title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_TITLE'), 'Title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_TITLE'), 'Title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_TITLE'), 'Title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_VIDEO'), 'Video', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_VIDEO'), 'Video', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_VIDEO'), 'Video', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_VIEW_MORE_LINK'), 'View more link', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_VIEW_MORE_LINK'), 'View more link', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_VIEW_MORE_PAGE'), 'View more page', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_VIEW_MORE_PAGE'), 'View more page', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_VIEW_MORE_TITLE'), 'View more title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_VIEW_MORE_TITLE'), 'View more title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_WIDGET_POSITION'), 'Widget position', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_WIDGET_POSITION_NAME'), 'Widget position name', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_WIDGET_TYPE'), 'Widget type', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'L_WIDGET_TYPE_NAME'), 'Widget type name', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000004', 'Template', '1', '2', 'template', '', 'fa-paypal', '1', '', '', '', '', '', '', '14', '1', '', '0', '', '0880fe9d-1a1a-11e5-b2f8-cc52af77857f', '-0-2-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000042', 'Pages', '1', '0', 'page', '', 'fa-file-audio-o', '1', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '01a0cd46-1baa-11e5-a175-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000043', 'Menus', '1', '0', 'menu', '', 'fa-plus-square', '1', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '01a0f3d6-1baa-11e5-a175-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000044', 'Posts', '1', '0', 'post', '', 'fa-cube', '1', '1', '1', '1', '0', '', '', '99', '1', '', '0', '', '01a1144d-1baa-11e5-a175-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000045', 'Menu Items', '1', '0', 'menuitem', '', 'fa-taxi', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '01a1f547-1baa-11e5-a175-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000046', 'Post Types', '1', '0', 'posttype', '', 'fa-file-code-o', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '01a26a5a-1baa-11e5-a175-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000047', 'Page Links', '1', '0', 'pagelink', '', 'fa-wifi', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '01a29940-1baa-11e5-a175-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000048', 'Widget Types', '1', '0', 'widgettype', '', 'fa-italic', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '01a8ce48-1baa-11e5-a175-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000049', 'Page Widgets', '1', '0', 'pagewidget', '', 'fa-github-square', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '01a91fda-1baa-11e5-a175-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000050', 'Page Galleries', '1', '0', 'pagegallery', '', 'fa-trash', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '01a9a611-1baa-11e5-a175-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000051', 'Post Sections', '1', '0', 'postsection', '', 'fa-users', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '01a9d298-1baa-11e5-a175-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000052', 'Page Sections', '1', '0', 'pagesection', '', 'fa-plus-square-o', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '01aa3215-1baa-11e5-a175-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000053', 'Post Categories', '1', '0', 'postcategory', '', 'fa-sitemap', '1', '0', '1', '1', '0', '', '', '99', '1', '', '0', '', '01aa857d-1baa-11e5-a175-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000054', 'Widget Positions', '1', '0', 'widgetposition', '', 'fa-chevron-left', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '01ab7dac-1baa-11e5-a175-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000055', 'Post Galleries', '1', '0', 'postgallery', '', 'fa-inr', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '93436fad-1bbc-11e5-ac15-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000056', 'Post Relations', '1', '0', 'postrelation', '', 'fa-outdent', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '9343c2da-1bbc-11e5-ac15-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000057', 'Page Link Types', '1', '0', 'pagelinktype', '', 'fa-signal', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '9343eefa-1bbc-11e5-ac15-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000058', 'Post Relation Types', '1', '0', 'postrelationtype', '', 'fa-stack-exchange', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '9344622a-1bbc-11e5-ac15-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000038', 'Page', 'page', 'PGE', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '12589946-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000039', 'Menu', 'menu', 'MNU', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '1258d8f3-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000040', 'Post', 'post', 'PST', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125905c7-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000041', 'Template', 'template', 'TMP', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '1259f706-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000042', 'Menu Item', 'menuitem', 'MNI', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125a9764-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000043', 'Post Type', 'posttype', 'PSP', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125b3074-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000044', 'Page Link', 'pagelink', 'PGL', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125b58f8-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000045', 'Widget Type', 'widgettype', 'WDT', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125cb2b2-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000046', 'Page Widget', 'pagewidget', 'PGW', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125d0605-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000047', 'Page Gallery', 'pagegallery', 'PGG', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125dc32c-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000048', 'Post Section', 'postsection', 'PSS', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125deefb-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000049', 'Page Section', 'pagesection', 'PGS', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125e53ea-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000050', 'Post Category', 'postcategory', 'PSC', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125e7cc4-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000051', 'Widget Position', 'widgetposition', 'WDP', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', '125f2c81-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000052', 'Post Gallery', 'postgallery', 'PSG', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'a803a87c-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000053', 'Post Relation', 'postrelation', 'PSR', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'a804855a-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000054', 'Page Link Type', 'pagelinktype', 'PLT', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'a804f970-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000055', 'Post Relation Type', 'postrelationtype', 'PRP', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'a806223f-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000038', 'page', 'PGExxxxxxxxxx', 'PGE0000000022', '1', '1', '', '0', '', '1258bdb7-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000039', 'menu', 'MNUxxxxxxxxxx', 'MNU0000000007', '1', '1', '', '0', '', '1258e8d2-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000040', 'post', 'PSTxxxxxxxxxx', 'PST0000000011', '1', '1', '', '0', '', '12591648-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000041', 'template', 'TMPxxxxxxxxxx', 'TMP0000000014', '1', '1', '', '0', '', '125a0ff4-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000042', 'menuitem', 'MNIxxxxxxxxxx', 'MNI0000000068', '1', '1', '', '0', '', '125ab156-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000043', 'posttype', 'PSPxxxxxxxxxx', 'PSP0000000003', '1', '1', '', '0', '', '125b41ea-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000044', 'pagelink', 'PGLxxxxxxxxxx', 'PGL0000000007', '1', '1', '', '0', '', '125b7d32-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000045', 'widgettype', 'WDTxxxxxxxxxx', 'WDT0000000007', '1', '1', '', '0', '', '125cc2b8-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000046', 'pagewidget', 'PGWxxxxxxxxxx', 'PGW0000000009', '1', '1', '', '0', '', '125d1e7f-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000047', 'pagegallery', 'PGGxxxxxxxxxx', 'PGG0000000004', '1', '1', '', '0', '', '125dd5a3-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000048', 'postsection', 'PSSxxxxxxxxxx', 'PSS0000000000', '1', '1', '', '0', '', '125dffa4-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000049', 'pagesection', 'PGSxxxxxxxxxx', 'PGS0000000000', '1', '1', '', '0', '', '125e659c-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000050', 'postcategory', 'PSCxxxxxxxxxx', 'PSC0000000011', '1', '1', '', '0', '', '125e8b85-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000051', 'widgetposition', 'WDPxxxxxxxxxx', 'WDP0000000004', '1', '1', '', '0', '', '125f3a81-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000052', 'postgallery', 'PSGxxxxxxxxxx', 'PSG0000000000', '1', '1', '', '0', '', 'a803b8fe-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000053', 'postrelation', 'PSRxxxxxxxxxx', 'PSR0000000000', '1', '1', '', '0', '', 'a804967a-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000054', 'pagelinktype', 'PLTxxxxxxxxxx', 'PLT0000000002', '1', '1', '', '0', '', 'a8050943-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000055', 'postrelationtype', 'PRPxxxxxxxxxx', 'PRP0000000000', '1', '1', '', '0', '', 'a806312a-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000112', 'page', 'view', '2', '', '*', '1', '1', '', '0', '', '1270f7da-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000113', 'page', 'edit', '2', '', '*', '1', '1', '', '0', '', '12710c33-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000114', 'page', 'new', '2', '', '*', '1', '1', '', '0', '', '12711c13-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000115', 'menu', 'view', '2', '', '*', '1', '1', '', '0', '', '12712bff-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000116', 'menu', 'edit', '2', '', '*', '1', '1', '', '0', '', '12713b56-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000117', 'menu', 'new', '2', '', '*', '1', '1', '', '0', '', '12714ac2-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000118', 'post', 'view', '2', '', '*', '1', '1', '', '0', '', '127159ba-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000119', 'post', 'edit', '2', '', '*', '1', '1', '', '0', '', '1271692f-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000120', 'post', 'new', '2', '', '*', '1', '1', '', '0', '', '127178df-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000121', 'template', 'view', '2', '', '*', '1', '1', '', '0', '', '12723a78-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000122', 'template', 'edit', '2', '', '*', '1', '1', '', '0', '', '12724ff0-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000123', 'template', 'new', '2', '', '*', '1', '1', '', '0', '', '127265c2-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000124', 'menuitem', 'view', '2', '', '*', '1', '1', '', '0', '', '1272babd-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000125', 'menuitem', 'edit', '2', '', '*', '1', '1', '', '0', '', '1272ce74-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000126', 'menuitem', 'new', '2', '', '*', '1', '1', '', '0', '', '1272e6d9-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000127', 'posttype', 'view', '2', '', '*', '1', '1', '', '0', '', '127340f0-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000128', 'posttype', 'edit', '2', '', '*', '1', '1', '', '0', '', '127351c7-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000129', 'posttype', 'new', '2', '', '*', '1', '1', '', '0', '', '12736267-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000130', 'pagelink', 'view', '2', '', '*', '1', '1', '', '0', '', '127372a0-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000131', 'pagelink', 'edit', '2', '', '*', '1', '1', '', '0', '', '1273823b-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000132', 'pagelink', 'new', '2', '', '*', '1', '1', '', '0', '', '12739252-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000133', 'widgettype', 'view', '2', '', '*', '1', '1', '', '0', '', '127494d9-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000134', 'widgettype', 'edit', '2', '', '*', '1', '1', '', '0', '', '1274a69c-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000135', 'widgettype', 'new', '2', '', '*', '1', '1', '', '0', '', '1274b61d-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000136', 'pagewidget', 'view', '2', '', '*', '1', '1', '', '0', '', '1274e5c0-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000137', 'pagewidget', 'edit', '2', '', '*', '1', '1', '', '0', '', '1274f6cf-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000138', 'pagewidget', 'new', '2', '', '*', '1', '1', '', '0', '', '1275095b-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000139', 'pagegallery', 'view', '2', '', '*', '1', '1', '', '0', '', '1275b6b8-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000140', 'pagegallery', 'edit', '2', '', '*', '1', '1', '', '0', '', '1275cd4a-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000141', 'pagegallery', 'new', '2', '', '*', '1', '1', '', '0', '', '1275e041-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000142', 'postsection', 'view', '2', '', '*', '1', '1', '', '0', '', '1275f2de-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000143', 'postsection', 'edit', '2', '', '*', '1', '1', '', '0', '', '127604d4-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000144', 'postsection', 'new', '2', '', '*', '1', '1', '', '0', '', '12761739-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000145', 'pagesection', 'view', '2', '', '*', '1', '1', '', '0', '', '12766d45-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000146', 'pagesection', 'edit', '2', '', '*', '1', '1', '', '0', '', '127c3a3a-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000147', 'pagesection', 'new', '2', '', '*', '1', '1', '', '0', '', '127c5166-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000148', 'postcategory', 'view', '2', '', '*', '1', '1', '', '0', '', '127c66c5-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000149', 'postcategory', 'edit', '2', '', '*', '1', '1', '', '0', '', '127c79d5-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000150', 'postcategory', 'new', '2', '', '*', '1', '1', '', '0', '', '127c8bf2-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000151', 'widgetposition', 'view', '2', '', '*', '1', '1', '', '0', '', '127d49e2-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000152', 'widgetposition', 'edit', '2', '', '*', '1', '1', '', '0', '', '127d5d99-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000153', 'widgetposition', 'new', '2', '', '*', '1', '1', '', '0', '', '127d6ff2-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000154', 'postgallery', 'view', '2', '', '*', '1', '1', '', '0', '', 'a8175c73-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000155', 'postgallery', 'edit', '2', '', '*', '1', '1', '', '0', '', 'a81772d2-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000156', 'postgallery', 'new', '2', '', '*', '1', '1', '', '0', '', 'a81786bd-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000157', 'postrelation', 'view', '2', '', '*', '1', '1', '', '0', '', 'a818864f-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000158', 'postrelation', 'edit', '2', '', '*', '1', '1', '', '0', '', 'a8189afe-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000159', 'postrelation', 'new', '2', '', '*', '1', '1', '', '0', '', 'a818ae75-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000160', 'pagelinktype', 'view', '2', '', '*', '1', '1', '', '0', '', 'a81923ef-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000161', 'pagelinktype', 'edit', '2', '', '*', '1', '1', '', '0', '', 'a8193795-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000162', 'pagelinktype', 'new', '2', '', '*', '1', '1', '', '0', '', 'a8194b6e-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000163', 'postrelationtype', 'view', '2', '', '*', '1', '1', '', '0', '', 'a81adde6-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000164', 'postrelationtype', 'edit', '2', '', '*', '1', '1', '', '0', '', 'a81af33c-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000165', 'postrelationtype', 'new', '2', '', '*', '1', '1', '', '0', '', 'a81b072f-1bbc-11e5-ac15-cc52af77857f');
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
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000085', 'page', '*', '', '1', '', '', '1', '1', '', '0', '', '1267880d-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000086', 'page', 'self', '2', '', '', '', '1', '1', '', '0', '', '1267a043-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000087', 'menu', '*', '', '1', '', '', '1', '1', '', '0', '', '1267b608-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000088', 'menu', 'self', '2', '', '', '', '1', '1', '', '0', '', '1267cb3c-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000089', 'post', '*', '', '1', '', '', '1', '1', '', '0', '', '1267da81-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000090', 'post', 'self', '2', '', '', '', '1', '1', '', '0', '', '1267e8c6-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000091', 'template', '*', '', '1', '', '', '1', '1', '', '0', '', '12686f35-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000092', 'template', 'self', '2', '', '', '', '1', '1', '', '0', '', '12687ebb-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000093', 'menuitem', '*', '', '1', '', '', '1', '1', '', '0', '', '1268bba6-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000094', 'menuitem', 'self', '2', '', '', '', '1', '1', '', '0', '', '1268cc28-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000095', 'menuitem', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '1268dd55-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000096', 'posttype', '*', '', '1', '', '', '1', '1', '', '0', '', '12691384-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000097', 'posttype', 'self', '2', '', '', '', '1', '1', '', '0', '', '12692518-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000098', 'pagelink', '*', '', '1', '', '', '1', '1', '', '0', '', '126b8e8f-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000099', 'pagelink', 'self', '2', '', '', '', '1', '1', '', '0', '', '126ba0d7-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000100', 'pagelink', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '126bb602-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000101', 'widgettype', '*', '', '1', '', '', '1', '1', '', '0', '', '126c67d5-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000102', 'widgettype', 'self', '2', '', '', '', '1', '1', '', '0', '', '126c7c04-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000103', 'pagewidget', '*', '', '1', '', '', '1', '1', '', '0', '', '126ca21c-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000104', 'pagewidget', 'self', '2', '', '', '', '1', '1', '', '0', '', '126cb4a8-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000105', 'pagewidget', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '126cc3cb-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000106', 'pagegallery', '*', '', '1', '', '', '1', '1', '', '0', '', '126d4354-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000107', 'pagegallery', 'self', '2', '', '', '', '1', '1', '', '0', '', '126d5367-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000108', 'pagegallery', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '126d6268-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000109', 'postsection', '*', '', '1', '', '', '1', '1', '', '0', '', '126d71dc-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000110', 'postsection', 'self', '2', '', '', '', '1', '1', '', '0', '', '126d85a0-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000111', 'postsection', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '126d9522-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000112', 'pagesection', '*', '', '1', '', '', '1', '1', '', '0', '', '126dda05-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000113', 'pagesection', 'self', '2', '', '', '', '1', '1', '', '0', '', '126de975-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000114', 'pagesection', 'inherited', '2', '', '', '', '1', '1', '', '0', '', '126df937-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000115', 'postcategory', '*', '', '1', '', '', '1', '1', '', '0', '', '126e09db-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000116', 'postcategory', 'self', '2', '', '', '', '1', '1', '', '0', '', '126e1942-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000117', 'widgetposition', '*', '', '1', '', '', '1', '1', '', '0', '', '126e89db-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000118', 'widgetposition', 'self', '2', '', '', '', '1', '1', '', '0', '', '126e998b-1baa-11e5-a175-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000119', 'postgallery', '*', '', '1', '', '', '1', '1', '', '0', '', 'a80ddec1-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000120', 'postgallery', 'self', '2', '', '', '', '1', '1', '', '0', '', 'a80df50f-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000121', 'postgallery', 'inherited', '2', '', '', '', '1', '1', '', '0', '', 'a80e09b6-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000122', 'postrelation', '*', '', '1', '', '', '1', '1', '', '0', '', 'a80ee8d5-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000123', 'postrelation', 'self', '2', '', '', '', '1', '1', '', '0', '', 'a80efb14-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000124', 'postrelation', 'inherited', '2', '', '', '', '1', '1', '', '0', '', 'a80f0f88-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000125', 'pagelinktype', '*', '', '1', '', '', '1', '1', '', '0', '', 'a80f6adb-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000126', 'pagelinktype', 'self', '2', '', '', '', '1', '1', '', '0', '', 'a80f7db8-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000127', 'postrelationtype', '*', '', '1', '', '', '1', '1', '', '0', '', 'a810ac02-1bbc-11e5-ac15-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000128', 'postrelationtype', 'self', '2', '', '', '', '1', '1', '', '0', '', 'a810bea7-1bbc-11e5-ac15-cc52af77857f');