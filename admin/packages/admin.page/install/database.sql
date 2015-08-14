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
-- Table structure for table `ADMIN_PAGE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `ADMIN_PAGE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SLUG` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci,
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
-- Dumping data for table `ADMIN_PAGE`
--

/*!40000 ALTER TABLE `ADMIN_PAGE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_PAGE` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
INSERT IGNORE INTO `ACCESS_RIGHT` (`REFID`, `ID_USER_GROUP`, `MODULE`, `ACTIONS`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('', '1', 'adminpage', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '1', '', '0', '', '25c121e9-426f-11e5-9457-cc52af77857f');
INSERT IGNORE INTO `ADMIN_FILTER` (`REFID`, `NAME`, `MODULE`, `COLUMNS`, `IS_DEFAULT`, `GUID`, `JSON`, `WFID`, `UDID`, `UUID`) VALUES ('', 'All', 'adminpage', 'TITLE,SLUG', '1', '', '', '', '0', '');
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Admin page title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Content', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LABEL` (`LABEL`, `GUID`, `UDID`, `UUID`) VALUES ('Slug', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Admin page title'), 'Admin page title', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Content'), 'Content', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_LANGUAGE_ITEM` (`ID_ADMIN_LANGUAGE`, `ID_ADMIN_LABEL`, `TRANSLATION`, `GUID`, `UDID`, `UUID`) VALUES (1, (SELECT ID FROM ADMIN_LABEL WHERE LABEL = 'Slug'), 'Slug', 1, 0, UUID());
INSERT IGNORE INTO `ADMIN_MENU_ITEM` (`REFID`, `NAME`, `ID_ADMIN_MENU`, `PARENT`, `MODULE`, `PATH`, `FONT_AWESOME_ICON`, `ENABLE_LEFT`, `ENABLE_TOP`, `ENABLE_QUICK`, `ENABLE_ALL`, `ENABLE_SETTINGS`, `OPEN_IN_NEW_WINDOW`, `IS_STARRED`, `ORDERING`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`, `HIERACHY`) VALUES ('', 'Admin Pages', '1', '0', 'adminpage', '', 'fa-weibo', '0', '0', '0', '0', '0', '', '', '99', '1', '', '0', '', '2a9b91b8-426f-11e5-9457-cc52af77857f', '');
INSERT IGNORE INTO `ADMIN_MODULE` (`REFID`, `NAME`, `MODULE`, `ID_ADMIN_PACKAGE`, `PREFIX`, `AVAILABLE_ACTIONS`, `IS_COMMENT_ENABLED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('', 'Admin Page', 'adminpage', '', 'ADP', 'menu list view new edit copy delete search import export report listpeer viewpeer editpeer deletepeer', '', '1', '', '0', '', '25b212d2-426f-11e5-9457-cc52af77857f');
INSERT IGNORE INTO `ADMIN_SEQUENCE` (`REFID`, `MODULE`, `SEQUENCE_FORMAT`, `CURRENT_VALUE`, `SEQUENCE_STEP`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('', 'adminpage', 'ADPxxxxxxxxxx', 'ADP0000000000', '1', '1', '', '0', '', '25b47c57-426f-11e5-9457-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('', 'adminpage', 'edit', '2', '', '*', '1', '1', '', '0', '', '26232670-426f-11e5-9457-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('', 'adminpage', 'new', '2', '', '*', '1', '1', '', '0', '', '2623414e-426f-11e5-9457-cc52af77857f');
INSERT IGNORE INTO `FIELD_ACL` (`REFID`, `MODULE`, `ACTION`, `ID_USER_GROUP`, `ID_USER`, `FIELDS`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('', 'adminpage', 'view', '2', '', '*', '1', '1', '', '0', '', '2621a469-426f-11e5-9457-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('', 'Content', 'adminpage', 'CONTENT', '', '', '', '', '0', '', '16f40d4b-426f-11e5-9457-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('', 'Json', 'adminpage', 'JSON', '', '', '', '', '0', '', '16f42dc2-426f-11e5-9457-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('', 'Refid', 'adminpage', 'REFID', '', '', '', '', '0', '', '16f3ac67-426f-11e5-9457-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('', 'Slug', 'adminpage', 'SLUG', '', '', '', '', '0', '', '16f3ed0c-426f-11e5-9457-cc52af77857f');
INSERT IGNORE INTO `FIELD` (`REFID`, `NAME`, `MODULE`, `COLUMN`, `TOOLTIP`, `IS_EXCLUDED`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('', 'Title', 'adminpage', 'TITLE', '', '', '', '', '0', '', '16f3cdc9-426f-11e5-9457-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('', 'adminpage', '*', '', '1', '', '', '1', '1', '', '0', '', '25ef2c04-426f-11e5-9457-cc52af77857f');
INSERT IGNORE INTO `OBJECT_ACL` (`REFID`, `MODULE`, `OBJECT_ID`, `ID_USER_GROUP`, `ID_USER`, `ARG_ID_USER_GROUP`, `ARG_ID_USER`, `ID_ACL_TYPE`, `GUID`, `JSON`, `UDID`, `WFID`, `UUID`) VALUES ('', 'adminpage', 'self', '2', '', '', '', '1', '1', '', '0', '', '25f147ad-426f-11e5-9457-cc52af77857f');