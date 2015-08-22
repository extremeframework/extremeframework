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
-- Table structure for table `DASHBOARD`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `DASHBOARD` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBTITLE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_ADMIN_PACKAGE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_ADMIN_MENU` int(11) DEFAULT NULL,
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
  KEY `IDX_ID_ADMIN_MENU` (`ID_ADMIN_MENU`),
  KEY `IDX_ID_ADMIN_PACKAGE` (`ID_ADMIN_PACKAGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DASHBOARD`
--

/*!40000 ALTER TABLE `DASHBOARD` DISABLE KEYS */;
INSERT IGNORE INTO `DASHBOARD` (`ID`, `REFID`, `NAME`, `TITLE`, `SUBTITLE`, `ID_ADMIN_PACKAGE`, `ID_ADMIN_MENU`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (1,'DSH0000000001','Admin Dashboard','Welcome to Extreme Framework','Where do you want to start?','',1,1,'{\"DASHBOARD_ITEM\":[{\"ID\":\"1\",\"REFID\":\"DSI0000000001\",\"TITLE\":\"View your apps\",\"ID_DASHBOARD\":\"3\",\"IMAGE\":\"dashboarditem\\/image\\/chq.png\",\"PATH\":\"desktop\",\"ID_DASHBOARD_ITEM_TYPE\":\"block\",\"ORDERING\":null,\"GUID\":\"1\",\"JSON\":null,\"WFID\":null,\"UDID\":\"0\",\"UUID\":\"c988bdf6-3a67-451f-b397-4a7fddace211\",\"N\":5},{\"ID\":\"2\",\"REFID\":\"DSI0000000002\",\"TITLE\":\"Install new apps\",\"ID_DASHBOARD\":\"3\",\"IMAGE\":\"dashboarditem\\/image\\/pie.png\",\"PATH\":\"installation\\/userpackages\",\"ID_DASHBOARD_ITEM_TYPE\":\"block\",\"ORDERING\":null,\"GUID\":\"1\",\"JSON\":null,\"WFID\":null,\"UDID\":\"0\",\"UUID\":\"01f24b6b-9df2-4f53-b968-262e19a4d0cd\",\"N\":5},{\"ID\":\"3\",\"REFID\":\"DSI0000000003\",\"TITLE\":\"Set up account\",\"ID_DASHBOARD\":\"3\",\"IMAGE\":\"dashboarditem\\/image\\/chq.png\",\"PATH\":\"user\\/edit-account\",\"ID_DASHBOARD_ITEM_TYPE\":\"block\",\"ORDERING\":null,\"GUID\":\"1\",\"JSON\":null,\"WFID\":null,\"UDID\":\"0\",\"UUID\":\"de2774ca-5eb5-4d89-84b2-d6f5fff13fc2\",\"N\":5},{\"ID\":\"4\",\"REFID\":\"DSI0000000004\",\"TITLE\":\"Watch a tutorial video\",\"ID_DASHBOARD\":\"3\",\"IMAGE\":\"\",\"PATH\":\"tutorial\",\"ID_DASHBOARD_ITEM_TYPE\":\"link\",\"ORDERING\":null,\"GUID\":\"1\",\"JSON\":null,\"WFID\":null,\"UDID\":\"0\",\"UUID\":\"008667b7-a09f-4905-b503-c51101fb10d7\",\"N\":5},{\"ID\":\"5\",\"REFID\":null,\"TITLE\":\"Read user guides\",\"ID_DASHBOARD\":\"3\",\"IMAGE\":\"\",\"PATH\":\"guides\",\"ID_DASHBOARD_ITEM_TYPE\":\"link\",\"ORDERING\":null,\"GUID\":\"1\",\"JSON\":null,\"WFID\":null,\"UDID\":\"0\",\"UUID\":\"6233b44d-3f9c-4412-bd54-0118f9934b61\",\"N\":5}]}',0,NULL,'5fc81069-6f37-4b65-bee8-d6b3e8ec075a');
INSERT IGNORE INTO `DASHBOARD` (`ID`, `REFID`, `NAME`, `TITLE`, `SUBTITLE`, `ID_ADMIN_PACKAGE`, `ID_ADMIN_MENU`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES (2,'DSH0000000002','Base User Dashboard',NULL,NULL,NULL,2,1,NULL,0,NULL,'06fe2719-1a1a-11e5-b2f8-cc52af77857f');
/*!40000 ALTER TABLE `DASHBOARD` ENABLE KEYS */;

--
-- Table structure for table `DASHBOARD_ITEM`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `DASHBOARD_ITEM` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_DASHBOARD` int(11) DEFAULT NULL,
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATH` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_DASHBOARD_ITEM_TYPE` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  KEY `IDX_ID_DASHBOARD` (`ID_DASHBOARD`),
  KEY `IDX_ID_DASHBOARD_ITEM_TYPE` (`ID_DASHBOARD_ITEM_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DASHBOARD_ITEM`
--

/*!40000 ALTER TABLE `DASHBOARD_ITEM` DISABLE KEYS */;
INSERT IGNORE INTO `DASHBOARD_ITEM` (`ID`, `REFID`, `TITLE`, `ID_DASHBOARD`, `IMAGE`, `PATH`, `ID_DASHBOARD_ITEM_TYPE`, `ORDERING`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES (1,'DSI0000000001','View your apps',1,'dashboarditem/image/chq.png','desktop','block',NULL,1,NULL,NULL,0,'c988bdf6-3a67-451f-b397-4a7fddace211');
INSERT IGNORE INTO `DASHBOARD_ITEM` (`ID`, `REFID`, `TITLE`, `ID_DASHBOARD`, `IMAGE`, `PATH`, `ID_DASHBOARD_ITEM_TYPE`, `ORDERING`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES (2,'DSI0000000002','Install new apps',1,'dashboarditem/image/pie.png','installation/userpackages','block',NULL,1,NULL,NULL,0,'01f24b6b-9df2-4f53-b968-262e19a4d0cd');
INSERT IGNORE INTO `DASHBOARD_ITEM` (`ID`, `REFID`, `TITLE`, `ID_DASHBOARD`, `IMAGE`, `PATH`, `ID_DASHBOARD_ITEM_TYPE`, `ORDERING`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES (3,'DSI0000000003','Set up account',1,'dashboarditem/image/chq.png','user/edit-account','block',NULL,1,NULL,NULL,0,'de2774ca-5eb5-4d89-84b2-d6f5fff13fc2');
INSERT IGNORE INTO `DASHBOARD_ITEM` (`ID`, `REFID`, `TITLE`, `ID_DASHBOARD`, `IMAGE`, `PATH`, `ID_DASHBOARD_ITEM_TYPE`, `ORDERING`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES (4,'DSI0000000004','Watch a tutorial video',1,'','tutorial','link',NULL,1,NULL,NULL,0,'008667b7-a09f-4905-b503-c51101fb10d7');
/*!40000 ALTER TABLE `DASHBOARD_ITEM` ENABLE KEYS */;

--
-- Table structure for table `DASHBOARD_ITEM_TYPE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `DASHBOARD_ITEM_TYPE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORDERING` tinyint(2) DEFAULT NULL,
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
  KEY `IDX_WFID` (`WFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DASHBOARD_ITEM_TYPE`
--

/*!40000 ALTER TABLE `DASHBOARD_ITEM_TYPE` DISABLE KEYS */;
INSERT IGNORE INTO `DASHBOARD_ITEM_TYPE` (`ID`, `REFID`, `NAME`, `CODE`, `ORDERING`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES (1,'DIT0000000001','Block','block',0,1,NULL,NULL,0,'4bb869cb-002e-4530-beec-5771cb89c576');
INSERT IGNORE INTO `DASHBOARD_ITEM_TYPE` (`ID`, `REFID`, `NAME`, `CODE`, `ORDERING`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES (2,'DIT0000000002','Link','link',0,1,NULL,NULL,0,'ec568162-df56-479a-b985-01d6f5ebeb6f');
/*!40000 ALTER TABLE `DASHBOARD_ITEM_TYPE` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `ID_USER_ROLE`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000027', '1', '', 'dashboard', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '1', '', '0', '', '93e30d09-340b-11e5-acf4-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `ID_USER_ROLE`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000259', '1', '', 'dashboarditem', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer customfields', '1', '', '0', '', 'b7e71523-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `ID_USER_ROLE`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ACR0000000260', '1', '', 'dashboarditemtype', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer customfields', '1', '', '0', '', 'b7e8e5ce-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000021007', 'All', 'dashboard', 'NAME,ID_ADMIN_PACKAGE', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000021090', 'All', 'dashboarditem', 'TITLE,ID_DASHBOARD,IMAGE,PATH,ID_DASHBOARD_ITEM_TYPE,ORDERING', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('ADF0000021172', 'All', 'dashboarditemtype', 'NAME,CODE,ORDERING', '1', '1', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Admin menu', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Admin package', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Code', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Dashboard item type', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Dashboard name', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Dashboard title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Dashboard', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Image', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Path', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Subtitle', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Admin menu'), 'Admin menu', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Admin package'), 'Admin package', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Code'), 'Code', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Dashboard item type'), 'Dashboard item type', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Dashboard name'), 'Dashboard name', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Dashboard title'), 'Dashboard title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Dashboard'), 'Dashboard', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Image'), 'Image', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Path'), 'Path', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Subtitle'), 'Subtitle', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000593', 'Dashboards', '1', '0', 'dashboard', '', 'fa-arrows-alt', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '7aafd2ee-304f-11e5-95d9-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000927', 'Dashboard Items', '1', '0', 'dashboarditem', '', 'fa-foursquare', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c31565ce-489e-11e5-b2ec-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('AMI0000000928', 'Dashboard Item Types', '1', '0', 'dashboarditemtype', '', 'fa-frown-o', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', 'c31e4715-489e-11e5-b2ec-cc52af77857f', '-0-');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `TABLE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000010', 'Dashboard', 'dashboard', 'DASHBOARD', 'admin.ui', 'DSH', 'menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer', '', '1', '', '0', '', 'b4426d25-1a1c-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `TABLE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000266', 'Dashboard Item', 'dashboarditem', 'DASHBOARD_ITEM', 'admin.ui', 'DSI', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer customfields', '', '1', '', '0', '', 'b7cf0ac9-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `TABLE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADD0000000267', 'Dashboard Item Type', 'dashboarditemtype', 'DASHBOARD_ITEM_TYPE', 'admin.ui', 'DIT', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer customfields', '', '1', '', '0', '', 'b7de97d2-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000022', 'dashboard', 'DSHxxxxxxxxxx', 'DSH0000000001', '1', '1', '', '0', '', '5db55da5-2f54-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000243', 'dashboarditem', 'DSIxxxxxxxxxx', 'DSI0000000005', '1', '1', '', '0', '', 'b7cf29f2-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('ADS0000000244', 'dashboarditemtype', 'DITxxxxxxxxxx', 'DIT0000000002', '1', '1', '', '0', '', 'b7deaf10-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000064', 'dashboard', 'view', '2', '', '*', '1', '1', '', '0', '', 'cb56a96a-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000065', 'dashboard', 'edit', '2', '', '*', '1', '1', '', '0', '', 'cb56c3aa-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000066', 'dashboard', 'new', '2', '', '*', '1', '1', '', '0', '', 'cb56dc97-2f55-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000724', 'dashboarditem', 'view', '2', '', '*', '1', '1', '', '0', '', 'b83e5e3c-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000725', 'dashboarditem', 'edit', '2', '', '*', '1', '1', '', '0', '', 'b83e7ac9-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000726', 'dashboarditem', 'new', '2', '', '*', '1', '1', '', '0', '', 'b8407105-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000727', 'dashboarditemtype', 'view', '2', '', '*', '1', '1', '', '0', '', 'b853950e-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000728', 'dashboarditemtype', 'edit', '2', '', '*', '1', '1', '', '0', '', 'b853b03d-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLA0000000729', 'dashboarditemtype', 'new', '2', '', '*', '1', '1', '', '0', '', 'b853c8e6-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000049', 'Refid', 'dashboard', 'REFID', '', '', '1', '', '0', '', '881cfd89-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000050', 'Name', 'dashboard', 'NAME', '', '', '1', '', '0', '', '881d21ba-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000051', 'Admin menu', 'dashboard', 'ID_ADMIN_MENU', '', '', '1', '', '0', '', '881d43dc-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000052', 'Dashboard layout', 'dashboard', 'ID_DASHBOARD_LAYOUT', '', '', '1', '', '0', '', '881d63c6-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000053', 'Dashboard file path', 'dashboard', 'DASHBOARD_FILE_PATH', '', '', '1', '', '0', '', '881d88bb-1a1a-11e5-b2f8-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000000167', 'Json', 'dashboard', 'JSON', '', '', '1', '', '0', '', 'c83a7587-1a1b-11e5-aee6-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000001286', 'Title', 'dashboard', 'TITLE', '', '', '1', '', '0', '', '9cdc5ee2-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000001287', 'Subtitle', 'dashboard', 'SUBTITLE', '', '', '1', '', '0', '', '9cdc744e-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000001288', 'Admin package', 'dashboard', 'ID_ADMIN_PACKAGE', '', '', '1', '', '0', '', '9cdcbac3-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000001289', 'Refid', 'dashboarditem', 'REFID', '', '', '1', '', '0', '', '9cdd3247-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000001290', 'Title', 'dashboarditem', 'TITLE', '', '', '1', '', '0', '', '9cdd4758-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000001291', 'Dashboard', 'dashboarditem', 'ID_DASHBOARD', '', '', '1', '', '0', '', '9cdd5c66-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000001292', 'Image', 'dashboarditem', 'IMAGE', '', '', '1', '', '0', '', '9cdd7151-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000001293', 'Path', 'dashboarditem', 'PATH', '', '', '1', '', '0', '', '9cdd852a-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000001294', 'Json', 'dashboarditem', 'JSON', '', '', '1', '', '0', '', '9cdd99af-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000001295', 'Refid', 'dashboarditemtype', 'REFID', '', '', '1', '', '0', '', '9cddb605-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000001296', 'Name', 'dashboarditemtype', 'NAME', '', '', '1', '', '0', '', '9cddd286-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000001297', 'Code', 'dashboarditemtype', 'CODE', 'This is an edit-once field. Its value cannot be modified afterward.', '', '1', '', '0', '', '9cdde7c7-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000001298', 'Ordering', 'dashboarditemtype', 'ORDERING', '', '', '1', '', '0', '', '9cddfc20-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000001299', 'Json', 'dashboarditemtype', 'JSON', '', '', '1', '', '0', '', '9cde10c7-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000001300', 'Ordering', 'dashboarditem', 'ORDERING', '', '', '1', '', '0', '', '03e8a998-48a1-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000001301', 'Dashboard item type', 'dashboarditem', 'ID_DASHBOARD_ITEM_TYPE', '', '', '1', '', '0', '', '52248efc-48a1-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('FLD0000001302', 'Home dashboard?', 'dashboard', 'IS_HOME_DASHBOARD', '', '', '1', '', '0', '', '3dfc0e1a-48a9-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000046', 'dashboard', '*', '', '1', '', '', '1', '1', '', '0', '', '6e2113d2-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000047', 'dashboard', 'self', '2', '', '', '', '1', '1', '', '0', '', '6e21249c-2f56-11e5-8947-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000790', 'dashboarditem', '*', '', '1', '', '', '1', '1', '', '0', '', 'b8058194-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000791', 'dashboarditem', 'self', '2', '', '', '', '1', '1', '', '0', '', 'b805a14b-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000792', 'dashboarditem', 'inherited', '2', '', '', '', '1', '1', '', '0', '', 'b805b8a2-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000793', 'dashboarditemtype', '*', '', '1', '', '', '1', '1', '', '0', '', 'b81d23ec-489e-11e5-b2ec-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('OBA0000000794', 'dashboarditemtype', 'self', '2', '', '', '', '1', '1', '', '0', '', 'b81d3f0a-489e-11e5-b2ec-cc52af77857f');