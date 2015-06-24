/*
SQLyog Community v11.3 (64 bit)
MySQL - 5.6.17 : Database - extremeframework-git
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `ACCESS_RIGHT` */

DROP TABLE IF EXISTS `ACCESS_RIGHT`;

CREATE TABLE `ACCESS_RIGHT` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_USER_GROUP` int(11) DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIONS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE` (`ID_USER_GROUP`,`MODULE`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ACCESS_RIGHT` */

insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'ACR0000000001',1,'user','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b445ada4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2,'ACR0000000002',1,'field','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b445e011-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (3,'ACR0000000003',1,'screen','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44607ea-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (4,'ACR0000000004',1,'option','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44632ec-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (5,'ACR0000000005',1,'acltype','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b446618a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (6,'ACR0000000006',1,'workflow','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44688b4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (7,'ACR0000000007',1,'userlog','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b446ae3f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (8,'ACR0000000008',1,'parameter','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b446d0f3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (9,'ACR0000000009',1,'userrole','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b446f98c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (10,'ACR0000000010',1,'dashboard','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b449230e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (11,'ACR0000000011',1,'fieldacl','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b4495df7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (12,'ACR0000000012',1,'adminmenu','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44991f2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (13,'ACR0000000013',1,'usergroup','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b449b307-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (14,'ACR0000000014',1,'objectacl','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b449cef7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (15,'ACR0000000015',1,'valuetype','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b449eb91-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (16,'ACR0000000016',1,'changelog','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44a05c4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (17,'ACR0000000017',1,'adminview','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44a2503-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (18,'ACR0000000018',1,'recyclebin','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44a41dd-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (19,'ACR0000000019',1,'adminlabel','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44a6404-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (20,'ACR0000000020',1,'adminfilter','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44a8197-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (21,'ACR0000000021',1,'screenfield','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44aa1d6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (22,'ACR0000000022',1,'workflowlog','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44abc85-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (23,'ACR0000000023',1,'accessright','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44aeb27-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (24,'ACR0000000024',1,'adminmodule','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44b1747-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (25,'ACR0000000025',1,'workflowstage','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44b4025-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (26,'ACR0000000026',1,'parametertype','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44b65ac-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (27,'ACR0000000027',1,'adminlanguage','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44b8d63-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (28,'ACR0000000028',1,'adminsequence','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44bb154-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (29,'ACR0000000029',1,'userpreference','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44bd906-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (30,'ACR0000000030',1,'parametergroup','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44c0214-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (31,'ACR0000000031',1,'usermembership','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44c2447-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (32,'ACR0000000032',1,'adminmenuitem','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44c5d74-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (33,'ACR0000000033',1,'adminlayoutfield','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44c8894-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (34,'ACR0000000034',1,'workflowtransition','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44cb5c1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (35,'ACR0000000035',1,'adminlanguageitem','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44cdde8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (36,'ACR0000000036',1,'workflowapplication','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44d0a8c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ACCESS_RIGHT`(`ID`,`REFID`,`ID_USER_GROUP`,`MODULE`,`ACTIONS`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (37,'ACR0000000037',1,'adminlayoutsection','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',1,NULL,0,NULL,'b44d3b74-1a1c-11e5-aee6-cc52af77857f');

/*Table structure for table `ACL_TYPE` */

DROP TABLE IF EXISTS `ACL_TYPE`;

CREATE TABLE `ACL_TYPE` (
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
  KEY `IDX_GUID` (`GUID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ACL_TYPE` */

insert  into `ACL_TYPE`(`ID`,`REFID`,`NAME`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'ACT0000000001','Include',1,1,NULL,0,NULL,'06acd842-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ACL_TYPE`(`ID`,`REFID`,`NAME`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2,'ACT0000000002','Exclude',3,1,NULL,0,NULL,'06acdc2a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ACL_TYPE`(`ID`,`REFID`,`NAME`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (3,'ACT0000000003','Forced Include',2,1,NULL,0,NULL,'06acdd89-1a1a-11e5-b2f8-cc52af77857f');

/*Table structure for table `ADMIN_FILTER` */

DROP TABLE IF EXISTS `ADMIN_FILTER`;

CREATE TABLE `ADMIN_FILTER` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMNS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_DEFAULT` tinyint(1) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UDID` int(11) DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=839 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ADMIN_FILTER` */

insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (802,NULL,'All','user','FIRST_NAME,LAST_NAME,PHOTO,EMAIL,LOGIN,PHONE,IS_ENABLED',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (803,NULL,'All','field','NAME,MODULE,COLUMN,TOOLTIP,IS_EXCLUDED',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (804,NULL,'All','screen','TITLE,ID_WORKFLOW,CODE',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (805,NULL,'All','option','NAME,CODE,VALUE,CONTEXT',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (806,NULL,'All','acltype','NAME,ORDERING',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (807,NULL,'All','workflow','NAME,CODE',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (808,NULL,'All','userlog','ID_USER,DATE_TIME,IP',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (809,NULL,'All','parameter','NAME,CODE,ID_PARAMETER_GROUP,ID_PARAMETER_TYPE,VALUE',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (810,NULL,'All','userrole','NAME',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (811,NULL,'All','dashboard','NAME,ID_ADMIN_MENU,ID_DASHBOARD_LAYOUT,DASHBOARD_FILE_PATH',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (812,NULL,'All','fieldacl','MODULE,ACTION,ID_USER_GROUP,ID_USER,ID_ACL_TYPE',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (813,NULL,'All','adminmenu','NAME,ORDERING,IS_ENABLED',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (814,NULL,'All','usergroup','NAME,DEFAULT_ID_DASHBOARD',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (815,NULL,'All','objectacl','MODULE,OBJECT_ID,ID_USER_GROUP,ID_USER,ARG_ID_USER_GROUP,ARG_ID_USER,ID_ACL_TYPE',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (816,NULL,'All','valuetype','NAME,CODE',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (817,NULL,'All','changelog','ACTION,ITEM,MODULE,DATE_TIME,ID_USER',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (818,NULL,'All','adminview','TITLE,CODE,MODULE,SCREEN,CONDITION_FIELD,CONDITION_VALUE,ORDERING',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (819,NULL,'All','recyclebin','ITEM,MODULE,DATE_TIME,ID_USER',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (820,NULL,'All','adminlabel','LABEL',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (821,NULL,'All','adminfilter','NAME,MODULE,COLUMNS,IS_DEFAULT',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (822,NULL,'All','screenfield','ID_SCREEN,TITLE,CODE,ID_VALUE_TYPE,DATASOURCE,VALUECOL,ORDERING',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (823,NULL,'All','workflowlog','ID_WORKFLOW,ID_WORKFLOW_TRANSITION,MODULE,OBJECT_ID,DATE,ID_USER',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (824,NULL,'All','accessright','ID_USER_GROUP,MODULE,ACTIONS',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (825,NULL,'All','adminmodule','NAME,MODULE,PREFIX,AVAILABLE_ACTIONS,IS_COMMENT_ENABLED',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (826,NULL,'All','workflowstage','ID_WORKFLOW,NAME,CODE,IS_DEFAULT,IS_BINDING_OBJECT_EDITABLE,IS_BINDING_OBJECT_DELETABLE',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (827,NULL,'All','parametertype','NAME,BASE_TYPE_CODE,EXTRA,ORDERING',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (828,NULL,'All','adminlanguage','NAME,CODE',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (829,NULL,'All','adminsequence','MODULE,SEQUENCE_FORMAT,CURRENT_VALUE,SEQUENCE_STEP',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (830,NULL,'All','userpreference','ID_USER,ID_DASHBOARD,ID_WALLPAPER,ID_ADMIN_STYLE',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (831,NULL,'All','parametergroup','NAME,ORDERING',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (832,NULL,'All','usermembership','ID_USER,ID_USER_GROUP,ID_USER_ROLE,VALID_FROM,VALID_UNTIL',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (833,NULL,'All','adminmenuitem','NAME,MODULE,ORDERING,ENABLE_LEFT,ENABLE_TOP,ENABLE_QUICK,ENABLE_ALL',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (834,NULL,'All','adminlayoutfield','MODULE,ID_ADMIN_LAYOUT_SECTION,COLUMN,POSITION,ORDERING',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (835,NULL,'All','workflowtransition','ID_WORKFLOW,NAME,ACTION,ID_USER_GROUP,ID_USER_ROLE,TRANSITION_ID_SCREEN',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (836,NULL,'All','adminlanguageitem','ID_ADMIN_LANGUAGE,ID_ADMIN_LABEL',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (837,NULL,'All','workflowapplication','MODULE,ID_WORKFLOW',1,NULL,NULL,NULL,0,NULL);
insert  into `ADMIN_FILTER`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMNS`,`IS_DEFAULT`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (838,NULL,'All','adminlayoutsection','NAME,MODULE,SHOW_TITLE,ORDERING',1,NULL,NULL,NULL,0,NULL);

/*Table structure for table `ADMIN_LABEL` */

DROP TABLE IF EXISTS `ADMIN_LABEL`;

CREATE TABLE `ADMIN_LABEL` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LABEL` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE` (`LABEL`)
) ENGINE=InnoDB AUTO_INCREMENT=2805 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ADMIN_LABEL` */

insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'ADL0000000001','L_ENGLISH',1,NULL,0,NULL,'07cb5c2e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2,'ADL0000000002','L_VIETNAMESE',1,NULL,0,NULL,'07cb600e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (3,'ADL0000000003','L_TOTAL',1,NULL,0,NULL,'07cb618f-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (4,'ADL0000000004','L_NEW',1,NULL,0,NULL,'07cb62d4-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (5,'ADL0000000005','L_ADD',1,NULL,0,NULL,'07cb640c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (6,'ADL0000000006','L_CLONE',1,NULL,0,NULL,'07cb653c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (7,'ADL0000000007','L_COPY',1,NULL,0,NULL,'07cb666c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (8,'ADL0000000008','L_DELETE',1,NULL,0,NULL,'07cb67a4-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (9,'ADL0000000009','L_CANCEL',1,NULL,0,NULL,'07cb68cb-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (10,'ADL0000000010','L_CLOSE',1,NULL,0,NULL,'07cb69ff-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (11,'ADL0000000011','L_EDIT',1,NULL,0,NULL,'07cb6b2f-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (12,'ADL0000000012','L_IMPORT',1,NULL,0,NULL,'07cb6c52-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (13,'ADL0000000013','L_BTN_IMPORT',1,NULL,0,NULL,'07cb6d74-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (14,'ADL0000000014','L_EXPORT',1,NULL,0,NULL,'07cb6ea0-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (15,'ADL0000000015','L_BATCH_EDIT',1,NULL,0,NULL,'07cb6fbe-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (16,'ADL0000000016','L_SEARCH',1,NULL,0,NULL,'07cb70dd-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (17,'ADL0000000017','L_RESET',1,NULL,0,NULL,'07cb7200-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (18,'ADL0000000018','L_SAVE',1,NULL,0,NULL,'07cb731e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (19,'ADL0000000019','L_VIEW',1,NULL,0,NULL,'07cb7446-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (20,'ADL0000000020','L_HELLO',1,NULL,0,NULL,'07cb756d-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (21,'ADL0000000021','L_SIGN_IN',1,NULL,0,NULL,'07cb7690-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (22,'ADL0000000022','L_USER_NAME',1,NULL,0,NULL,'07cb77b2-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (23,'ADL0000000023','L_PASSWORD',1,NULL,0,NULL,'07cb78de-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (24,'ADL0000000024','L_FORGOT_YOUR_PASSWORD',1,NULL,0,NULL,'07cb7a09-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (25,'ADL0000000025','L_KEEP_ME_SIGNED_IN',1,NULL,0,NULL,'07cb7b39-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (26,'ADL0000000026','L_CONTACT_US',1,NULL,0,NULL,'07cb7c5c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (27,'ADL0000000027','L_HELP',1,NULL,0,NULL,'07cb7d7f-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (28,'ADL0000000028','L_ACCOUNT',1,NULL,0,NULL,'07cb7ea6-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (29,'ADL0000000029','L_SIGN_OUT',1,NULL,0,NULL,'07cb7fc4-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (30,'ADL0000000030','L_ID',1,NULL,0,NULL,'07cb80e3-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (31,'ADL0000000031','L_USER_GROUP',1,NULL,0,NULL,'07cb820a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (32,'ADL0000000032','L_MODULE',1,NULL,0,NULL,'07cb8329-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (33,'ADL0000000033','L_ACTIONS',1,NULL,0,NULL,'07cb844c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (34,'ADL0000000034','L_NAME',1,NULL,0,NULL,'07cb856e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (35,'ADL0000000035','L_EDIT_ENTRIES',1,NULL,0,NULL,'07cb8691-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (36,'ADL0000000036','L_STATUS',1,NULL,0,NULL,'07cb87b4-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (37,'ADL0000000037','L_ORDERING',1,NULL,0,NULL,'07cb88db-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (38,'ADL0000000038','L_IS_ENABLED',1,NULL,0,NULL,'07cb89fe-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (39,'ADL0000000039','L_MENU',1,NULL,0,NULL,'07cb8b1d-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (40,'ADL0000000040','L_SETUP',1,NULL,0,NULL,'07cb8c44-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (41,'ADL0000000041','L_LOGIN',1,NULL,0,NULL,'07cb8d62-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (42,'ADL0000000042','L_USER_MEMBERSHIP',1,NULL,0,NULL,'07cb8e85-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (43,'ADL0000000043','L_ACCESS_RIGHT',1,NULL,0,NULL,'07cb8fb1-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (44,'ADL0000000044','L_ACCESS_RIGHT_ADVANCED',1,NULL,0,NULL,'07cb90d8-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (45,'ADL0000000045','L_USER',1,NULL,0,NULL,'07cb91ff-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (46,'ADL0000000046','L_USERS',1,NULL,0,NULL,'07cb9322-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (47,'ADL0000000047','L_YOU_ARE_NOT_CURRENTLY_SIGNED_IN',1,NULL,0,NULL,'07cb9440-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (48,'ADL0000000048','L_YES',1,NULL,0,NULL,'07cb9592-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (49,'ADL0000000049','L_NO',1,NULL,0,NULL,'07cb96b5-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (50,'ADL0000000050','L_TRUE',1,NULL,0,NULL,'07cb97d8-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (51,'ADL0000000051','L_FALSE',1,NULL,0,NULL,'07cb98ff-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (52,'ADL0000000052','L_ENABLE',1,NULL,0,NULL,'07cb9a1e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (53,'ADL0000000053','L_DISABLE',1,NULL,0,NULL,'07cb9b38-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (54,'ADL0000000054','L_ENABLED',1,NULL,0,NULL,'07cb9c63-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (55,'ADL0000000055','L_DISABLED',1,NULL,0,NULL,'07cb9d82-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (56,'ADL0000000056','L_CSV_FILE_CONTAINS_DATA_ABOUT',1,NULL,0,NULL,'07cb9ea5-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (57,'ADL0000000057','L_GUIDELINES_IMPORT',1,NULL,0,NULL,'07cb9ff2-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (58,'ADL0000000058','L_VALIDATION_NOT_EMPTY',1,NULL,0,NULL,'07cba11a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (59,'ADL0000000059','L_VALIDATION_ALREADY_EXISTS',1,NULL,0,NULL,'07cba241-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (60,'ADL0000000060','L_VALIDATION_NUMBER',1,NULL,0,NULL,'07cba375-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (61,'ADL0000000061','L_VALIDATION_CODE',1,NULL,0,NULL,'07cba49c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (62,'ADL0000000062','L_VALIDATION_MAXVAL',1,NULL,0,NULL,'07cba5bf-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (63,'ADL0000000063','L_VALIDATION_MINVAL',1,NULL,0,NULL,'07cba6d9-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (64,'ADL0000000064','L_VALIDATION_MAXLENGTH',1,NULL,0,NULL,'07cba7f7-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (65,'ADL0000000065','L_VALIDATION_MINLENGTH',1,NULL,0,NULL,'07cba91a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (66,'ADL0000000066','L_VALIDATION_URL',1,NULL,0,NULL,'07cbaa39-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (67,'ADL0000000067','L_VALIDATION_DATE',1,NULL,0,NULL,'07cbad21-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (68,'ADL0000000068','L_VALIDATION_IMAGE',1,NULL,0,NULL,'07cbae77-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (69,'ADL0000000069','L_VALIDATION_PHONE',1,NULL,0,NULL,'07cbafc1-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (70,'ADL0000000070','L_VALIDATION_FAX',1,NULL,0,NULL,'07cbb10a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (71,'ADL0000000071','L_VALIDATION_PASSPORT',1,NULL,0,NULL,'07cbb24f-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (72,'ADL0000000072','L_VALIDATION_EMAIL',1,NULL,0,NULL,'07cbb390-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (73,'ADL0000000073','L_VALIDATION_PASSWORD',1,NULL,0,NULL,'07cbb4d1-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (74,'ADL0000000074','L_VALIDATION_GENERAL',1,NULL,0,NULL,'07cbb616-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (75,'ADL0000000075','L_WELCOME',1,NULL,0,NULL,'07cbb757-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (76,'ADL0000000076','L_MSG_PRODUCT_INTRO',1,NULL,0,NULL,'07cbb8a0-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (77,'ADL0000000077','L_GUIDELINES_COPY_RELS',1,NULL,0,NULL,'07cbb9e1-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (78,'ADL0000000078','L_COPY_ALSO',1,NULL,0,NULL,'07cbbb26-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (79,'ADL0000000079','L_GUIDELINES_DELETE_RELS',1,NULL,0,NULL,'07cbbc2f-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (80,'ADL0000000080','L_DELETE_ALSO',1,NULL,0,NULL,'07cbbd2b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (81,'ADL0000000081','L_VIEW_ALSO_OTHER_ITEMS',1,NULL,0,NULL,'07cbbe30-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (82,'ADL0000000082','L_CANNOT_OPEN_IMPORT_FILE',1,NULL,0,NULL,'07cbbf31-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (83,'ADL0000000083','L_INVALID_IMPORT_FILE_FORMAT',1,NULL,0,NULL,'07cbc03e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (84,'ADL0000000084','L_NO_VALID_COLUMN_IN_IMPORT_FILE',1,NULL,0,NULL,'07cbc14c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (85,'ADL0000000085','L_IS_VISIBLE',1,NULL,0,NULL,'07cbc255-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (86,'ADL0000000086','L_IMAGE',1,NULL,0,NULL,'07cbc356-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (87,'ADL0000000087','L_DESCRIPTION',1,NULL,0,NULL,'07cbc456-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (88,'ADL0000000088','L_ACCESS_RIGHT_LC',1,NULL,0,NULL,'07cbc553-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (89,'ADL0000000089','L_USER_LC',1,NULL,0,NULL,'07cbc653-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (90,'ADL0000000090','L_USER_MEMBERSHIP_LC',1,NULL,0,NULL,'07cbc74b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (91,'ADL0000000091','L_USER_GROUP_LC',1,NULL,0,NULL,'07cbc843-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (92,'ADL0000000092','L_USER_GROUP_NAME',1,NULL,0,NULL,'07cbc944-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (93,'ADL0000000093','L_NOTE',1,NULL,0,NULL,'07cbca40-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (94,'ADL0000000094','L_APPROVED_BY',1,NULL,0,NULL,'07cbcb41-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (95,'ADL0000000095','L_APPROVED_AT',1,NULL,0,NULL,'07cbcc4a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (96,'ADL0000000096','L_APPROVE',1,NULL,0,NULL,'07cbcd4b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (97,'ADL0000000097','L_GUIDELINES_APPROVE_RELS',1,NULL,0,NULL,'07cbce4c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (98,'ADL0000000098','L_APPROVE_ALSO',1,NULL,0,NULL,'07cbcf5d-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (99,'ADL0000000099','L_ERROR_ACTION_NOT_ALLOWED_ON_APPROVED_ITEM',1,NULL,0,NULL,'07cbd05a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (100,'ADL0000000100','L_PRINT',1,NULL,0,NULL,'07cbd17c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (101,'ADL0000000101','L_PAGING_VIEW_ALL',1,NULL,0,NULL,'07cbd279-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (102,'ADL0000000102','L_PAGING_START',1,NULL,0,NULL,'07cbd375-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (103,'ADL0000000103','L_PAGING_PREV',1,NULL,0,NULL,'07cbd47a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (104,'ADL0000000104','L_PAGING_NEXT',1,NULL,0,NULL,'07cbd57b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (105,'ADL0000000105','L_PAGING_END',1,NULL,0,NULL,'07cbd673-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (106,'ADL0000000106','L_ADMIN',1,NULL,0,NULL,'07cbd76f-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (107,'ADL0000000107','L_CMS',1,NULL,0,NULL,'07cbd870-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (108,'ADL0000000108','L_PAGE_TEMPLATE',1,NULL,0,NULL,'07cbd970-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (109,'ADL0000000109','L_PAGE_LAYOUT',1,NULL,0,NULL,'07cbda75-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (110,'ADL0000000110','L_LAYOUT',1,NULL,0,NULL,'07cbdb72-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (111,'ADL0000000111','L_CUSTOM_LAYOUT',1,NULL,0,NULL,'07cbdc72-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (112,'ADL0000000112','L_MODULE_HANDLER',1,NULL,0,NULL,'07cbdd73-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (113,'ADL0000000113','L_SYNC',1,NULL,0,NULL,'07cbde6f-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (114,'ADL0000000114','L_FORCE_PASSWORD_CHANGE',1,NULL,0,NULL,'07cbdf74-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (115,'ADL0000000115','L_NEW_PASSWORD',1,NULL,0,NULL,'07cbe075-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (116,'ADL0000000116','L_CONFIRM_NEW_PASSWORD',1,NULL,0,NULL,'07cbe171-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (117,'ADL0000000117','L_CHANGE',1,NULL,0,NULL,'07cbe276-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (118,'ADL0000000118','L_RECORDS',1,NULL,0,NULL,'6a3488cc-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (119,'ADL0000000119','L_ADD_ITEM',1,NULL,0,NULL,'6a348c01-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (120,'ADL0000000120','L_PREV',1,NULL,0,NULL,'6a348cdc-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (121,'ADL0000000121','L_NEXT',1,NULL,0,NULL,'6a348da5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (122,'ADL0000000122','L_ADDITIONAL_INFORMATION',1,NULL,0,NULL,'6a349525-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (123,'ADL0000000123','L_QUICK_CREATE',1,NULL,0,NULL,'6a3495ee-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (124,'ADL0000000124','L_ACL_TYPE',1,NULL,0,NULL,'6a34976f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (125,'ADL0000000125','L_FIELD_ACL',1,NULL,0,NULL,'6a349cbb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (126,'ADL0000000126','L_OBJECT_ACL',1,NULL,0,NULL,'6a349d66-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (127,'ADL0000000127','L_ACL_TYPE_NAME',1,NULL,0,NULL,'6a34a17e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (128,'ADL0000000128','L_ADMIN_LABEL',1,NULL,0,NULL,'6a34ab78-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (129,'ADL0000000129','L_ADMIN_LANGUAGE_ITEM',1,NULL,0,NULL,'6a34ac16-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (130,'ADL0000000130','L_LABEL',1,NULL,0,NULL,'6a34ac85-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (131,'ADL0000000131','L_ADMIN_LANGUAGE',1,NULL,0,NULL,'6a34acfd-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (132,'ADL0000000132','L_ADMIN_LANGUAGE_NAME',1,NULL,0,NULL,'6a34ad6c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (133,'ADL0000000133','L_CODE',1,NULL,0,NULL,'6a34adec-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (134,'ADL0000000134','L_TRANSLATION',1,NULL,0,NULL,'6a34b21e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (135,'ADL0000000135','L_ADMIN_MENU',1,NULL,0,NULL,'6a34b2eb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (136,'ADL0000000136','L_ADMIN_MENU_ITEM',1,NULL,0,NULL,'6a34b392-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (137,'ADL0000000137','L_DASHBOARD',1,NULL,0,NULL,'6a34b43d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (138,'ADL0000000138','L_ADMIN_MENU_NAME',1,NULL,0,NULL,'6a34b4e0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (139,'ADL0000000139','L_ADMIN_MENU_ITEM_NAME',1,NULL,0,NULL,'6a34b586-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (140,'ADL0000000140','L_PATH',1,NULL,0,NULL,'6a34b636-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (141,'ADL0000000141','L_FONT_AWESOME_ICON',1,NULL,0,NULL,'6a34b6d4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (142,'ADL0000000142','L_ENABLE_LEFT',1,NULL,0,NULL,'6a34b77b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (143,'ADL0000000143','L_ENABLE_TOP',1,NULL,0,NULL,'6a34b826-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (144,'ADL0000000144','L_ENABLE_QUICK',1,NULL,0,NULL,'6a34b8c4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (145,'ADL0000000145','L_ENABLE_ALL',1,NULL,0,NULL,'6a34b96b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (146,'ADL0000000146','L_ENABLE_SETTINGS',1,NULL,0,NULL,'6a34ba0e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (147,'ADL0000000147','L_OPEN_IN_NEW_WINDOW',1,NULL,0,NULL,'6a34bab0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (148,'ADL0000000148','L_IS_STARRED',1,NULL,0,NULL,'6a34bb53-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (149,'ADL0000000149','L_PARENT',1,NULL,0,NULL,'6a34bbf1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (150,'ADL0000000150','L_GO_TO_FULL_FORM',1,NULL,0,NULL,'6a34bc93-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (151,'ADL0000000151','L_ADMIN_MODULE',1,NULL,0,NULL,'6a34bd36-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (152,'ADL0000000152','L_CHANGE_LOG',1,NULL,0,NULL,'6a34bdd4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (153,'ADL0000000153','L_FIELD',1,NULL,0,NULL,'6a34be7b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (154,'ADL0000000154','L_RECYCLE_BIN',1,NULL,0,NULL,'6a34bf1e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (155,'ADL0000000155','L_ADMIN_MODULE_NAME',1,NULL,0,NULL,'6a34bfc4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (156,'ADL0000000156','L_PREFIX',1,NULL,0,NULL,'6a34c063-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (157,'ADL0000000157','L_AVAILABLE_ACTIONS',1,NULL,0,NULL,'6a34c105-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (158,'ADL0000000158','L_IS_COMMENT_ENABLED',1,NULL,0,NULL,'6a34c1a3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (159,'ADL0000000159','L_ADMIN_VIEW',1,NULL,0,NULL,'6a34c246-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (160,'ADL0000000160','L_TITLE',1,NULL,0,NULL,'6a34c2e9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (161,'ADL0000000161','L_SCREEN',1,NULL,0,NULL,'6a34c387-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (162,'ADL0000000162','L_CONDITION_FIELD',1,NULL,0,NULL,'6a34c429-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (163,'ADL0000000163','L_CONDITION_VALUE',1,NULL,0,NULL,'6a34c4d0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (164,'ADL0000000164','L_TEMPLATE',1,NULL,0,NULL,'6a34c573-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (165,'ADL0000000165','L_IS_PRINT_VIEW',1,NULL,0,NULL,'6a34c61a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (166,'ADL0000000166','L_CREATE_NEW_FILTER',1,NULL,0,NULL,'6a34c6bc-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (167,'ADL0000000167','L_ACTION',1,NULL,0,NULL,'6a34c763-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (168,'ADL0000000168','L_ITEM',1,NULL,0,NULL,'6a34c805-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (169,'ADL0000000169','L_DATE_TIME',1,NULL,0,NULL,'6a34c8a8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (170,'ADL0000000170','L_DETAILS',1,NULL,0,NULL,'6a34c94a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (171,'ADL0000000171','L_USER_PREFERENCE',1,NULL,0,NULL,'6a34c9f1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (172,'ADL0000000172','L_DASHBOARD_NAME',1,NULL,0,NULL,'6a34ca90-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (173,'ADL0000000173','L_DASHBOARD_LAYOUT',1,NULL,0,NULL,'6a34cb32-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (174,'ADL0000000174','L_DASHBOARD_FILE_PATH',1,NULL,0,NULL,'6a34cba6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (175,'ADL0000000175','L_FIELD_NAME',1,NULL,0,NULL,'6a34cc15-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (176,'ADL0000000176','L_COLUMN',1,NULL,0,NULL,'6a34cc84-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (177,'ADL0000000177','L_TOOLTIP',1,NULL,0,NULL,'6a34ccef-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (178,'ADL0000000178','L_IS_EXCLUDED',1,NULL,0,NULL,'6a34cd5e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (179,'ADL0000000179','L_FIELDS',1,NULL,0,NULL,'6a34cdc9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (180,'ADL0000000180','L_OBJECT',1,NULL,0,NULL,'6a34ce34-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (181,'ADL0000000181','L_ARG_USER_GROUP',1,NULL,0,NULL,'6a34ce9f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (182,'ADL0000000182','L_ARG_USER',1,NULL,0,NULL,'6a34cf0e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (183,'ADL0000000183','L_OPTION',1,NULL,0,NULL,'6a34cf79-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (184,'ADL0000000184','L_OPTION_NAME',1,NULL,0,NULL,'6a34cfe8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (185,'ADL0000000185','L_VALUE',1,NULL,0,NULL,'6a34d057-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (186,'ADL0000000186','L_CONTEXT',1,NULL,0,NULL,'6a34d0c7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (187,'ADL0000000187','L_PARAMETER',1,NULL,0,NULL,'6a34d13a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (188,'ADL0000000188','L_PARAMETER_NAME',1,NULL,0,NULL,'6a34d1a9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (189,'ADL0000000189','L_PARAMETER_GROUP',1,NULL,0,NULL,'6a34d214-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (190,'ADL0000000190','L_PARAMETER_TYPE',1,NULL,0,NULL,'6a34d284-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (191,'ADL0000000191','L_PARAMETER_GROUP_NAME',1,NULL,0,NULL,'6a34d2f3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (192,'ADL0000000192','L_PARAMETER_TYPE_NAME',1,NULL,0,NULL,'6a34d362-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (193,'ADL0000000193','L_BASE_TYPE_CODE',1,NULL,0,NULL,'6a34d3cd-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (194,'ADL0000000194','L_EXTRA',1,NULL,0,NULL,'6a34d43c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (195,'ADL0000000195','L_USER_LOG',1,NULL,0,NULL,'6a34d4ab-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (196,'ADL0000000196','L_FIRST_NAME',1,NULL,0,NULL,'6a34d51a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (197,'ADL0000000197','L_LAST_NAME',1,NULL,0,NULL,'6a34d585-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (198,'ADL0000000198','L_PHOTO',1,NULL,0,NULL,'6a34d5f0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (199,'ADL0000000199','L_EMAIL',1,NULL,0,NULL,'6a34d65b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (200,'ADL0000000200','L_PHONE',1,NULL,0,NULL,'6a34d6ca-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (201,'ADL0000000201','L_GENDER',1,NULL,0,NULL,'6a34d735-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (202,'ADL0000000202','L_DATE_OF_BIRTH',1,NULL,0,NULL,'6a34d7ad-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (203,'ADL0000000203','L_IS_EMAIL_VERIFIED',1,NULL,0,NULL,'6a34d81c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (204,'ADL0000000204','L_FACEBOOK',1,NULL,0,NULL,'6a34d88c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (205,'ADL0000000205','L_FACEBOOK_OAUTH',1,NULL,0,NULL,'6a34d8f7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (206,'ADL0000000206','L_GOOGLE',1,NULL,0,NULL,'6a34d966-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (207,'ADL0000000207','L_GOOGLE_OAUTH',1,NULL,0,NULL,'6a34d9d1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (208,'ADL0000000208','L_YAHOO',1,NULL,0,NULL,'6a34da3c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (209,'ADL0000000209','L_YAHOO_OAUTH',1,NULL,0,NULL,'6a34daaf-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (210,'ADL0000000210','L_CREATION_DATE',1,NULL,0,NULL,'6a34db1e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (211,'ADL0000000211','L_LATEST_LOGIN',1,NULL,0,NULL,'6a34db8e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (212,'ADL0000000212','L_MALE',1,NULL,0,NULL,'6a34dbfd-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (213,'ADL0000000213','L_FEMALE',1,NULL,0,NULL,'6a34dc6c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (214,'ADL0000000214','L_DEFAULT_DASHBOARD',1,NULL,0,NULL,'6a34dcdb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (215,'ADL0000000215','L_IP',1,NULL,0,NULL,'6a34dd4a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (216,'ADL0000000216','L_USER_ROLE',1,NULL,0,NULL,'6a34ddbe-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (217,'ADL0000000217','L_VALID_FROM',1,NULL,0,NULL,'6a34de2d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (218,'ADL0000000218','L_VALID_UNTIL',1,NULL,0,NULL,'6a34de9c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (219,'ADL0000000219','L_WALLPAPER',1,NULL,0,NULL,'6a34df0b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (220,'ADL0000000220','L_ADMIN_STYLE',1,NULL,0,NULL,'6a34df7b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (221,'ADL0000000221','L_USER_ROLE_NAME',1,NULL,0,NULL,'6a34dfea-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (222,'ADL0000000222','L_MENU_QUICK_SEARCH',1,NULL,0,NULL,'6a34e059-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (223,'ADL0000000223','L_MNU_USER',1,NULL,0,NULL,'6a34e0cd-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (224,'ADL0000000224','L_MNU_FIELD',1,NULL,0,NULL,'6a34e13c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (225,'ADL0000000225','L_MNU_OPTION',1,NULL,0,NULL,'6a34e1a7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (226,'ADL0000000226','L_MNU_USER_LOG',1,NULL,0,NULL,'6a34e21a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (227,'ADL0000000227','L_MNU_ACL_TYPE',1,NULL,0,NULL,'6a34e289-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (228,'ADL0000000228','L_MNU_USER_ROLE',1,NULL,0,NULL,'6a34e2f4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (229,'ADL0000000229','L_MNU_PARAMETER',1,NULL,0,NULL,'6a34e364-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (230,'ADL0000000230','L_MNU_DASHBOARD',1,NULL,0,NULL,'6a34e3d3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (231,'ADL0000000231','L_MNU_FIELD_ACL',1,NULL,0,NULL,'6a34e43e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (232,'ADL0000000232','L_MNU_CHANGE_LOG',1,NULL,0,NULL,'6a34e4b1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (233,'ADL0000000233','L_MNU_USER_GROUP',1,NULL,0,NULL,'6a34e520-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (234,'ADL0000000234','L_MNU_OBJECT_ACL',1,NULL,0,NULL,'6a34e58b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (235,'ADL0000000235','L_MNU_ADMIN_MENU',1,NULL,0,NULL,'6a34e5fb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (236,'ADL0000000236','L_MNU_ADMIN_VIEW',1,NULL,0,NULL,'6a34e665-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (237,'ADL0000000237','L_MNU_ADMIN_LABEL',1,NULL,0,NULL,'6a34e6d5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (238,'ADL0000000238','L_MNU_RECYCLE_BIN',1,NULL,0,NULL,'6a34e744-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (239,'ADL0000000239','L_MNU_ACCESS_RIGHT',1,NULL,0,NULL,'6a34e7af-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (240,'ADL0000000240','L_MNU_ADMIN_MODULE',1,NULL,0,NULL,'6a34e81e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (241,'ADL0000000241','L_MNU_ADMIN_LANGUAGE',1,NULL,0,NULL,'6a34e88d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (242,'ADL0000000242','L_MNU_PARAMETER_TYPE',1,NULL,0,NULL,'6a34e8f8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (243,'ADL0000000243','L_MNU_USER_MEMBERSHIP',1,NULL,0,NULL,'6a34e967-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (244,'ADL0000000244','L_MNU_USER_PREFERENCE',1,NULL,0,NULL,'6a34e9d7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (245,'ADL0000000245','L_MNU_PARAMETER_GROUP',1,NULL,0,NULL,'6a34ea42-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (246,'ADL0000000246','L_MNU_ADMIN_MENU_ITEM',1,NULL,0,NULL,'6a34eaac-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (247,'ADL0000000247','L_MNU_ADMIN_LANGUAGE_ITEM',1,NULL,0,NULL,'6a34eb17-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (248,'ADL0000000248','L_ADMIN_FILTER',1,NULL,0,NULL,'6a34eb87-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (249,'ADL0000000249','L_ADMIN_FILTER_NAME',1,NULL,0,NULL,'6a34ef9a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (250,'ADL0000000250','L_COLUMNS',1,NULL,0,NULL,'6a34f01f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (251,'ADL0000000251','L_IS_DEFAULT',1,NULL,0,NULL,'6a34f092-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (252,'ADL0000000252','L_ADMIN_LAYOUT_FIELD',1,NULL,0,NULL,'6a34f102-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (253,'ADL0000000253','L_ADMIN_LAYOUT_SECTION',1,NULL,0,NULL,'6a34f171-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (254,'ADL0000000254','L_POSITION',1,NULL,0,NULL,'6a34f1e4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (255,'ADL0000000255','L_ADMIN_LAYOUT_SECTION_NAME',1,NULL,0,NULL,'6a34f253-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (256,'ADL0000000256','L_SHOW_TITLE',1,NULL,0,NULL,'6a34f2c3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (257,'ADL0000000257','L_WORKFLOW',1,NULL,0,NULL,'6a34f336-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (258,'ADL0000000258','L_SCREEN_FIELD',1,NULL,0,NULL,'6a34f3a5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (259,'ADL0000000259','L_VALUE_TYPE',1,NULL,0,NULL,'6a34f419-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (260,'ADL0000000260','L_DATASOURCE',1,NULL,0,NULL,'6a34f488-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (261,'ADL0000000261','L_CONDITION',1,NULL,0,NULL,'6a34f4f7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (262,'ADL0000000262','L_VALUECOL',1,NULL,0,NULL,'6a34f566-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (263,'ADL0000000263','L_TEXTCOL',1,NULL,0,NULL,'6a34f5d6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (264,'ADL0000000264','L_IS_MANDATORY',1,NULL,0,NULL,'6a34f649-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (265,'ADL0000000265','L_VALUE_TYPE_NAME',1,NULL,0,NULL,'6a34f6b8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (266,'ADL0000000266','L_WORKFLOW_NAME',1,NULL,0,NULL,'6a34f728-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (267,'ADL0000000267','L_WORKFLOW_APPLICATION',1,NULL,0,NULL,'6a34f797-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (268,'ADL0000000268','L_WORKFLOW_LOG',1,NULL,0,NULL,'6a34f80a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (269,'ADL0000000269','L_WORKFLOW_TRANSITION',1,NULL,0,NULL,'6a34f879-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (270,'ADL0000000270','L_DATE',1,NULL,0,NULL,'6a34f8ed-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (271,'ADL0000000271','L_WORKFLOW_STAGE',1,NULL,0,NULL,'6a34f958-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (272,'ADL0000000272','L_WORKFLOW_STAGE_NAME',1,NULL,0,NULL,'6a34f9c7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (273,'ADL0000000273','L_IS_BINDING_OBJECT_EDITABLE',1,NULL,0,NULL,'6a34fa36-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (274,'ADL0000000274','L_IS_BINDING_OBJECT_DELETABLE',1,NULL,0,NULL,'6a34fb8c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (275,'ADL0000000275','L_WORKFLOW_TRANSITION_NAME',1,NULL,0,NULL,'6a34fc3c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (276,'ADL0000000276','L_TRANSITION_SCREEN',1,NULL,0,NULL,'6a34fcc0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (277,'ADL0000000277','L_START_WORKFLOW_STAGE',1,NULL,0,NULL,'6a34fd3c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (278,'ADL0000000278','L_END_WORKFLOW_STAGE',1,NULL,0,NULL,'6a34fdb9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (279,'ADL0000000279','L_MNU_SCREEN',1,NULL,0,NULL,'6a34fe30-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (280,'ADL0000000280','L_MNU_WORKFLOW',1,NULL,0,NULL,'6a34fea8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (281,'ADL0000000281','L_MNU_VALUE_TYPE',1,NULL,0,NULL,'6a34ff24-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (282,'ADL0000000282','L_MNU_ADMIN_FILTER',1,NULL,0,NULL,'6a34ff9c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (283,'ADL0000000283','L_MNU_SCREEN_FIELD',1,NULL,0,NULL,'6a350014-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (284,'ADL0000000284','L_MNU_WORKFLOW_LOG',1,NULL,0,NULL,'6a350090-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (285,'ADL0000000285','L_MNU_WORKFLOW_STAGE',1,NULL,0,NULL,'6a350110-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (286,'ADL0000000286','L_MNU_ADMIN_LAYOUT_FIELD',1,NULL,0,NULL,'6a35018c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (287,'ADL0000000287','L_MNU_WORKFLOW_TRANSITION',1,NULL,0,NULL,'6a350208-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (288,'ADL0000000288','L_MNU_WORKFLOW_APPLICATION',1,NULL,0,NULL,'6a350284-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (289,'ADL0000000289','L_MNU_ADMIN_LAYOUT_SECTION',1,NULL,0,NULL,'6a350300-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (334,'ADL0000000290','L_ADMIN_SEQUENCE',1,NULL,0,NULL,'7fdc1a42-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (335,'ADL0000000291','L_SEQUENCE_FORMAT',1,NULL,0,NULL,'7fdc1cea-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (336,'ADL0000000292','L_CURRENT_VALUE',1,NULL,0,NULL,'7fdc1d88-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (337,'ADL0000000293','L_SEQUENCE_STEP',1,NULL,0,NULL,'7fdc1e11-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (338,'ADL0000000294','L_MNU_ADMIN_SEQUENCE',1,NULL,0,NULL,'7fdc1e95-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (997,'ADL0000000295','L_FORGOT_PASSWORD',1,NULL,0,NULL,'29b67c38-1a22-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (998,'ADL0000000296','L_CREATE_AN_ACCOUNT_NOW',1,NULL,0,NULL,'29b67e79-1a22-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1223,'ADL0000000297','Authentication',1,NULL,0,NULL,'47a476ad-e8f4-43cb-9337-fce58d1c7256');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1224,'ADL0000000298','Sign in',1,NULL,0,NULL,'508303be-3fa7-4b1a-be1e-1b2341608fd0');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1225,'ADL0000000299','Username',1,NULL,0,NULL,'058e819d-0712-4772-8240-c0c50d6ab041');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1226,'ADL0000000300','Username or Email',1,NULL,0,NULL,'9b808de8-493c-4d7d-92fd-5d2b8d1c1e1e');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1227,'ADL0000000301','Sign in with Facebook',1,NULL,0,NULL,'e21a6db5-df34-4cab-b203-8f6c7a6d959f');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1228,'ADL0000000302','Sign in with Yahoo',1,NULL,0,NULL,'3bbbae5f-f03f-4e28-90e2-3983cd3e7a79');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1677,'ADL0000000303','Admin',1,NULL,0,NULL,'06617841-8632-4d51-a34f-a4afb0f28b32');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1678,'ADL0000000304','Options',1,NULL,0,NULL,'2152f0b3-425c-4e2e-9bb3-399fd4d992c2');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1679,'ADL0000000305','Parameters',1,NULL,0,NULL,'9afe4872-a2ed-4d3e-b7ac-a39519565b11');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1904,'ADL0000000306','Quick search',1,NULL,0,NULL,'ac95dc46-9ea8-45f5-92a7-f27c603d93aa');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2129,'ADL0000000307','Users',1,NULL,0,NULL,'4f1191cb-e86a-4861-be7f-b3d80dbbda4b');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2130,'ADL0000000308','Admin Languages',1,NULL,0,NULL,'926f7846-28e5-4364-a7d4-2d641ceed262');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2131,'ADL0000000309','Admin Menu Items',1,NULL,0,NULL,'fae1635c-7f2a-4836-af03-a5665e69aa12');
insert  into `ADMIN_LABEL`(`ID`,`REFID`,`LABEL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2132,'ADL0000000310','Add More',1,NULL,0,NULL,'56762295-f080-4eef-8b58-c141c6676ab4');

/*Table structure for table `ADMIN_LANGUAGE` */

DROP TABLE IF EXISTS `ADMIN_LANGUAGE`;

CREATE TABLE `ADMIN_LANGUAGE` (
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
  UNIQUE KEY `uniquekey` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ADMIN_LANGUAGE` */

insert  into `ADMIN_LANGUAGE`(`ID`,`REFID`,`NAME`,`CODE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'ADN0000000001','English','en',1,NULL,0,NULL,'083bef04-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE`(`ID`,`REFID`,`NAME`,`CODE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2,'ADN0000000002','Tiếng Việt','vi',1,NULL,0,NULL,'083bf217-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE`(`ID`,`REFID`,`NAME`,`CODE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (3,'ADN0000000003','Francais','fr',1,NULL,0,NULL,'083bf31c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE`(`ID`,`REFID`,`NAME`,`CODE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (4,'ADN0000000004','中国','zh-CN',1,NULL,0,NULL,'083bf3e5-1a1a-11e5-b2f8-cc52af77857f');

/*Table structure for table `ADMIN_LANGUAGE_ITEM` */

DROP TABLE IF EXISTS `ADMIN_LANGUAGE_ITEM`;

CREATE TABLE `ADMIN_LANGUAGE_ITEM` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_ADMIN_LANGUAGE` int(11) DEFAULT NULL,
  `ID_ADMIN_LABEL` int(11) DEFAULT NULL,
  `TRANSLATION` text COLLATE utf8_unicode_ci,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE` (`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`)
) ENGINE=InnoDB AUTO_INCREMENT=1279 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ADMIN_LANGUAGE_ITEM` */

insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'ALI0000000001',1,1,'English',1,NULL,0,NULL,'08f87fc0-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2,'ALI0000000002',1,2,'Tiếng Việt',1,NULL,0,NULL,'08f8834f-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (3,'ALI0000000003',1,3,'Total',1,NULL,0,NULL,'08f8848c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (4,'ALI0000000004',1,4,'New',1,NULL,0,NULL,'08f8859d-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (5,'ALI0000000005',1,5,'Add',1,NULL,0,NULL,'08f886a2-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (6,'ALI0000000006',1,6,'Clone',1,NULL,0,NULL,'08f887a3-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (7,'ALI0000000007',1,7,'Copy',1,NULL,0,NULL,'08f888ac-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (8,'ALI0000000008',1,8,'Delete',1,NULL,0,NULL,'08f889ad-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (9,'ALI0000000009',1,9,'Cancel',1,NULL,0,NULL,'08f88ab2-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (10,'ALI0000000010',1,10,'Close',1,NULL,0,NULL,'08f88bb6-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (11,'ALI0000000011',1,11,'Edit',1,NULL,0,NULL,'08f88cb3-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (12,'ALI0000000012',1,12,'Import',1,NULL,0,NULL,'08f88db8-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (13,'ALI0000000013',1,13,'Import',1,NULL,0,NULL,'08f88eb4-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (14,'ALI0000000014',1,14,'Export',1,NULL,0,NULL,'08f88fac-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (15,'ALI0000000015',1,15,'Batch edit',1,NULL,0,NULL,'08f890b1-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (16,'ALI0000000016',1,16,'Search',1,NULL,0,NULL,'08f891b2-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (17,'ALI0000000017',1,17,'Reset',1,NULL,0,NULL,'08f892ae-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (18,'ALI0000000018',1,18,'Save',1,NULL,0,NULL,'08f893bc-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (19,'ALI0000000019',1,19,'View',1,NULL,0,NULL,'08f894b8-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (20,'ALI0000000020',1,20,'Hello',1,NULL,0,NULL,'08f895b0-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (21,'ALI0000000021',1,21,'Sign in',1,NULL,0,NULL,'08f896b5-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (22,'ALI0000000022',1,22,'User name',1,NULL,0,NULL,'08f8a5cb-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (23,'ALI0000000023',1,23,'Password',1,NULL,0,NULL,'08f8a719-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (24,'ALI0000000024',1,24,'Forgot your password?',1,NULL,0,NULL,'08f8a81e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (25,'ALI0000000025',1,25,'Keep me signed in',1,NULL,0,NULL,'08f8a941-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (26,'ALI0000000026',1,26,'Contact us',1,NULL,0,NULL,'08f8aa52-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (27,'ALI0000000027',1,27,'Help',1,NULL,0,NULL,'08f8ab57-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (28,'ALI0000000028',1,28,'Account',1,NULL,0,NULL,'08f8ac5c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (29,'ALI0000000029',1,29,'Sign out',1,NULL,0,NULL,'08f8ad54-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (30,'ALI0000000030',1,30,'ID',1,NULL,0,NULL,'08f8ae4c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (31,'ALI0000000031',1,31,'User group',1,NULL,0,NULL,'08f8af4d-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (32,'ALI0000000032',1,32,'Module',1,NULL,0,NULL,'08f8b049-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (33,'ALI0000000033',1,33,'Actions',1,NULL,0,NULL,'08f8bd78-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (34,'ALI0000000034',1,34,'Name',1,NULL,0,NULL,'08f8be9b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (35,'ALI0000000035',1,35,'Edit entries',1,NULL,0,NULL,'08f8bfa4-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (36,'ALI0000000036',1,36,'Status',1,NULL,0,NULL,'08f8c147-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (37,'ALI0000000037',1,37,'Ordering',1,NULL,0,NULL,'08f8c2af-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (38,'ALI0000000038',1,38,'Is enabled?',1,NULL,0,NULL,'08f8c405-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (39,'ALI0000000039',1,39,'Menu',1,NULL,0,NULL,'08f8c6ed-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (40,'ALI0000000040',1,40,'Setup',1,NULL,0,NULL,'08f8d0c4-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (41,'ALI0000000041',1,41,'Login',1,NULL,0,NULL,'08f8d257-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (42,'ALI0000000042',1,42,'User membership',1,NULL,0,NULL,'08f8d3be-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (43,'ALI0000000043',1,43,'Access right',1,NULL,0,NULL,'08f8d51d-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (44,'ALI0000000044',1,44,'Access right (advanced)',1,NULL,0,NULL,'08f8de78-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (45,'ALI0000000045',1,45,'User',1,NULL,0,NULL,'08f8e00a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (46,'ALI0000000046',1,46,'User',1,NULL,0,NULL,'08f8e95d-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (47,'ALI0000000047',1,47,'You are not currently signed in',1,NULL,0,NULL,'08f8f2bc-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (48,'ALI0000000048',1,48,'Yes',1,NULL,0,NULL,'08f911ae-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (49,'ALI0000000049',1,49,'No',1,NULL,0,NULL,'08f9130c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (50,'ALI0000000050',1,50,'True',1,NULL,0,NULL,'08f91427-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (51,'ALI0000000051',1,51,'False',1,NULL,0,NULL,'08f9152c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (52,'ALI0000000052',1,52,'Enable',1,NULL,0,NULL,'08f91639-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (53,'ALI0000000053',1,53,'Disable',1,NULL,0,NULL,'08f91747-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (54,'ALI0000000054',1,54,'Enabled',1,NULL,0,NULL,'08f91847-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (55,'ALI0000000055',1,55,'Disabled',1,NULL,0,NULL,'08f91950-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (56,'ALI0000000056',1,56,'Excel file (format .csv) containing data about',1,NULL,0,NULL,'08f91a62-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (57,'ALI0000000057',1,57,'<p>You can import or update %s data via an Excel file (in .csv format).</p><p>For your reference about the importing template, y',1,NULL,0,NULL,'08f91b81-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (58,'ALI0000000058',1,58,'%s should not be empty',1,NULL,0,NULL,'08f91ca8-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (59,'ALI0000000059',1,59,'%s already exists',1,NULL,0,NULL,'08f91dba-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (60,'ALI0000000060',1,60,'%s should be a number',1,NULL,0,NULL,'08f91ed4-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (61,'ALI0000000061',1,61,'%s only accepts alphabet characters, numbers, underscore character (_), hyphen character (-), @ or dot character (.)',1,NULL,0,NULL,'08f91fe1-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (62,'ALI0000000062',1,62,'%s should be a number with a maximum value of %s',1,NULL,0,NULL,'08f92108-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (63,'ALI0000000063',1,63,'%s should be a number with a minumum value of %s',1,NULL,0,NULL,'08f9221e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (64,'ALI0000000064',1,64,'%s should not exceed %s characters',1,NULL,0,NULL,'08f92339-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (65,'ALI0000000065',1,65,'%s should have at least %s characters',1,NULL,0,NULL,'08f92446-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (66,'ALI0000000066',1,66,'%s should be a valid URL',1,NULL,0,NULL,'08f92558-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (67,'ALI0000000067',1,67,'%s should be a valid date',1,NULL,0,NULL,'08f9266e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (68,'ALI0000000068',1,68,'%s should be a valid image',1,NULL,0,NULL,'08f92780-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (69,'ALI0000000069',1,69,'%s should be a valid phone number (only numbers and spaces are allowed)',1,NULL,0,NULL,'08f92896-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (70,'ALI0000000070',1,70,'%s should be a valid fax number (only numbers and spaces are allowed)',1,NULL,0,NULL,'08f929ac-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (71,'ALI0000000071',1,71,'%s only accepts alphabet characters, numbers, underscore character (_), hyphen character (-) or dash character (/)',1,NULL,0,NULL,'08f92ac6-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (72,'ALI0000000072',1,72,'%s should be a valid email address',1,NULL,0,NULL,'08f92bd8-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (73,'ALI0000000073',1,73,'%s should be a valid password',1,NULL,0,NULL,'08f92cea-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (74,'ALI0000000074',1,74,'%s should contain a valid value',1,NULL,0,NULL,'08f92dfb-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (75,'ALI0000000075',1,75,'Welcome',1,NULL,0,NULL,'08f92f11-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (76,'ALI0000000076',1,76,'Welcome to Apps4Clouds!',1,NULL,0,NULL,'08f93016-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (77,'ALI0000000077',1,77,'You can copy also the following related data of this %s:',1,NULL,0,NULL,'08f93124-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (78,'ALI0000000078',1,78,'Copy also',1,NULL,0,NULL,'08f93231-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (79,'ALI0000000079',1,79,'If you delete this %s, related data (if any) would become garbage. Please check carefully before before deletion, or you can cho',1,NULL,0,NULL,'08f9333a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (80,'ALI0000000080',1,80,'Delete also',1,NULL,0,NULL,'08f93450-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (81,'ALI0000000081',1,81,'View also other %s items:',1,NULL,0,NULL,'08f9355a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (82,'ALI0000000082',1,82,'Cannot open import file',1,NULL,0,NULL,'08f93670-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (83,'ALI0000000083',1,83,'Invalid import file format',1,NULL,0,NULL,'08f93779-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (84,'ALI0000000084',1,84,'No valid column in import file',1,NULL,0,NULL,'08f9388f-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (85,'ALI0000000085',1,85,'Is visible?',1,NULL,0,NULL,'08f9399c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (86,'ALI0000000086',1,86,'Image',1,NULL,0,NULL,'08f93aa1-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (87,'ALI0000000087',1,87,'Description',1,NULL,0,NULL,'08f93baa-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (88,'ALI0000000088',1,88,'access right',1,NULL,0,NULL,'08f93ca7-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (89,'ALI0000000089',1,89,'user',1,NULL,0,NULL,'08f93dac-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (90,'ALI0000000090',1,90,'user membership',1,NULL,0,NULL,'08f93eb5-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (91,'ALI0000000091',1,91,'user group',1,NULL,0,NULL,'08f93fba-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (92,'ALI0000000092',1,92,'User group name',1,NULL,0,NULL,'08f940c7-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (93,'ALI0000000093',1,93,'Note',1,NULL,0,NULL,'08f941c8-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (94,'ALI0000000094',1,94,'Approved by',1,NULL,0,NULL,'08f942c9-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (95,'ALI0000000095',1,95,'Approved at',1,NULL,0,NULL,'08f943d2-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (96,'ALI0000000096',1,96,'Approve',1,NULL,0,NULL,'08f944d2-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (97,'ALI0000000097',1,97,'Guidelines approve rels',1,NULL,0,NULL,'08f945dc-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (98,'ALI0000000098',1,98,'Approve also',1,NULL,0,NULL,'08f946e9-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (99,'ALI0000000099',1,99,'This action is not allowed for an approved %s.',1,NULL,0,NULL,'08f947ee-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (100,'ALI0000000100',1,100,'Print',1,NULL,0,NULL,'08f94904-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (101,'ALI0000000101',1,101,'All',1,NULL,0,NULL,'08f94a0d-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (102,'ALI0000000102',1,102,'Start',1,NULL,0,NULL,'08f94b0e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (103,'ALI0000000103',1,103,'Prev',1,NULL,0,NULL,'08f94c0e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (104,'ALI0000000104',1,104,'Next',1,NULL,0,NULL,'08f94d0b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (105,'ALI0000000105',1,105,'End',1,NULL,0,NULL,'08f94e10-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (106,'ALI0000000106',1,106,'Admin',1,NULL,0,NULL,'08f94f10-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (107,'ALI0000000107',1,107,'CMS',1,NULL,0,NULL,'08f95011-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (108,'ALI0000000108',1,108,'Template',1,NULL,0,NULL,'08f9511a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (109,'ALI0000000109',1,109,'Layout',1,NULL,0,NULL,'08f9521b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (110,'ALI0000000110',1,110,'Layout',1,NULL,0,NULL,'08f95320-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (111,'ALI0000000111',1,111,'Custom layout',1,NULL,0,NULL,'08f9541c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (112,'ALI0000000112',1,112,'Handler',1,NULL,0,NULL,'08f9551d-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (113,'ALI0000000113',1,113,'Sync',1,NULL,0,NULL,'08f95626-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (114,'ALI0000000114',1,114,'Force password change',1,NULL,0,NULL,'08f95722-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (115,'ALI0000000115',1,115,'New password',1,NULL,0,NULL,'08f95830-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (116,'ALI0000000116',1,116,'Confirm new password',1,NULL,0,NULL,'08f95939-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (117,'ALI0000000117',1,117,'Change',1,NULL,0,NULL,'08f95a46-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (118,'ALI0000000118',2,1,'English',1,NULL,0,NULL,'08f95b65-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (119,'ALI0000000119',2,2,'Tiếng Việt',1,NULL,0,NULL,'08f95d1e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (120,'ALI0000000120',2,3,'Tổng',1,NULL,0,NULL,'08f95eab-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (121,'ALI0000000121',2,4,'Thêm',1,NULL,0,NULL,'08f96035-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (122,'ALI0000000122',2,5,'Thêm vào',1,NULL,0,NULL,'08f9632e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (123,'ALI0000000123',2,6,'Nhân bản',1,NULL,0,NULL,'08f964e7-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (124,'ALI0000000124',2,7,'Tạo bản sao',1,NULL,0,NULL,'08f9669b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (125,'ALI0000000125',2,8,'Xóa bỏ',1,NULL,0,NULL,'08f9683e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (126,'ALI0000000126',2,9,'Đóng lại',1,NULL,0,NULL,'08f969e6-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (127,'ALI0000000127',2,10,'Đóng',1,NULL,0,NULL,'08f96b85-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (128,'ALI0000000128',2,11,'Chỉnh sửa',1,NULL,0,NULL,'08f96d23-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (129,'ALI0000000129',2,12,'Nhập liệu từ Excel',1,NULL,0,NULL,'08f96ec7-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (130,'ALI0000000130',2,13,'Nhập liệu',1,NULL,0,NULL,'08f97077-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (131,'ALI0000000131',2,14,'Xuất ra Excel',1,NULL,0,NULL,'08f971a6-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (132,'ALI0000000132',2,15,'Chỉnh sửa gộp',1,NULL,0,NULL,'08f972c1-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (133,'ALI0000000133',2,16,'Tìm kiếm',1,NULL,0,NULL,'08f973e3-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (134,'ALI0000000134',2,17,'Reset',1,NULL,0,NULL,'08f97502-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (135,'ALI0000000135',2,18,'Lưu',1,NULL,0,NULL,'08f97618-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (136,'ALI0000000136',2,19,'Chi tiết',1,NULL,0,NULL,'08f97737-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (137,'ALI0000000137',2,20,'Xin chào',1,NULL,0,NULL,'08f9784d-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (138,'ALI0000000138',2,21,'Đăng nhập',1,NULL,0,NULL,'08f97963-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (139,'ALI0000000139',2,22,'Tên đăng nhập',1,NULL,0,NULL,'08f97a81-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (140,'ALI0000000140',2,23,'Mật khẩu',1,NULL,0,NULL,'08f97ba4-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (141,'ALI0000000141',2,24,'Bạn quên mật khẩu?',1,NULL,0,NULL,'08f97cc7-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (142,'ALI0000000142',2,25,'Giữ chế độ đăng nhập',1,NULL,0,NULL,'08f97dea-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (143,'ALI0000000143',2,26,'Liên hệ',1,NULL,0,NULL,'08f97f0d-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (144,'ALI0000000144',2,27,'Trợ giúp',1,NULL,0,NULL,'08f9802b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (145,'ALI0000000145',2,28,'Tài khoản',1,NULL,0,NULL,'08f98146-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (146,'ALI0000000146',2,29,'Thoát',1,NULL,0,NULL,'08f98268-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (147,'ALI0000000147',2,30,'ID',1,NULL,0,NULL,'08f9837e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (148,'ALI0000000148',2,31,'Nhóm người dùng',1,NULL,0,NULL,'08f98499-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (149,'ALI0000000149',2,32,'Mô-đun',1,NULL,0,NULL,'08f985c4-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (150,'ALI0000000150',2,33,'Tác vụ',1,NULL,0,NULL,'08f986e3-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (151,'ALI0000000151',2,34,'Tên',1,NULL,0,NULL,'08f987f9-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (152,'ALI0000000152',2,35,'Cập nhật các tiểu mục',1,NULL,0,NULL,'08f9891c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (153,'ALI0000000153',2,36,'Trạng thái',1,NULL,0,NULL,'08f98a43-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (154,'ALI0000000154',2,37,'Thứ tự',1,NULL,0,NULL,'08f98b5d-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (155,'ALI0000000155',2,38,'Kích hoạt?',1,NULL,0,NULL,'08f98c73-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (156,'ALI0000000156',2,39,'Menu',1,NULL,0,NULL,'08f98d89-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (157,'ALI0000000157',2,40,'Cấu hình',1,NULL,0,NULL,'08f98ea8-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (158,'ALI0000000158',2,41,'Đăng nhập',1,NULL,0,NULL,'08f98fbe-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (159,'ALI0000000159',2,42,'Thành viên',1,NULL,0,NULL,'08f990e1-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (160,'ALI0000000160',2,43,'Phân quyền',1,NULL,0,NULL,'08f991f7-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (161,'ALI0000000161',2,44,'Phân quyền (nâng cao)',1,NULL,0,NULL,'08f99311-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (162,'ALI0000000162',2,45,'Người dùng',1,NULL,0,NULL,'08f99438-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (163,'ALI0000000163',2,46,'Người dùng',1,NULL,0,NULL,'08f99552-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (164,'ALI0000000164',2,47,'Bạn hiện chưa đăng nhập',1,NULL,0,NULL,'08f99679-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (165,'ALI0000000165',2,48,'Có',1,NULL,0,NULL,'08f997a1-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (166,'ALI0000000166',2,49,'Không',1,NULL,0,NULL,'08f998b7-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (167,'ALI0000000167',2,50,'Đúng',1,NULL,0,NULL,'08f999d9-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (168,'ALI0000000168',2,51,'Sai',1,NULL,0,NULL,'08f99af4-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (169,'ALI0000000169',2,52,'Kích hoạt',1,NULL,0,NULL,'08f99c0e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (170,'ALI0000000170',2,53,'Vô hiệu hóa',1,NULL,0,NULL,'08f99d31-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (171,'ALI0000000171',2,54,'Đã được kích hoạt',1,NULL,0,NULL,'08f99e4b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (172,'ALI0000000172',2,55,'Đã bị vô hiệu hóa',1,NULL,0,NULL,'08f99f77-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (173,'ALI0000000173',2,56,'Tập tin Excel (định dạng .csv) chứa dữ liệu về',1,NULL,0,NULL,'08f9a099-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (174,'ALI0000000174',2,57,'<p>Bạn có thể nhập hoặc cập nhập dữ liệu %s thông qua tập tin Excel (định dạng .csv).</p><p>Để tham khảo về template nhập liệu, ',1,NULL,0,NULL,'08f9a1bc-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (175,'ALI0000000175',2,58,'%s không được để trống',1,NULL,0,NULL,'08f9a2f0-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (176,'ALI0000000176',2,59,'%s đã tồn tại trong cơ sở dữ liệu',1,NULL,0,NULL,'08f9a41c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (177,'ALI0000000177',2,60,'%s phải là một con số',1,NULL,0,NULL,'08f9a543-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (178,'ALI0000000178',2,61,'%s chỉ chấp nhận các ký tự chữ, số, gạch dưới (_), gạch ngang (-), @ hoặc dấu chấm (.)',1,NULL,0,NULL,'08f9a66e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (179,'ALI0000000179',2,62,'%s phải là một con số với giá trị tối đa là %s',1,NULL,0,NULL,'08f9a79e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (180,'ALI0000000180',2,63,'%s phải là một con số với giá trị tối thiểu là %s',1,NULL,0,NULL,'08f9a8c5-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (181,'ALI0000000181',2,64,'%s không được vượt quá %s ký tự',1,NULL,0,NULL,'08f9a9ec-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (182,'ALI0000000182',2,65,'%s phải có tối thiểu %s ký tự',1,NULL,0,NULL,'08f9ab13-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (183,'ALI0000000183',2,66,'%s phải là một địa chỉ web hợp lệ',1,NULL,0,NULL,'08f9ac32-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (184,'ALI0000000184',2,67,'%s phải là một ngày hợp lệ',1,NULL,0,NULL,'08f9ad73-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (185,'ALI0000000185',2,68,'%s phải là một ảnh hợp lệ',1,NULL,0,NULL,'08f9ae9e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (186,'ALI0000000186',2,69,'%s phải là một số điện thoại hợp lệ (chỉ cho phép chữ số và khoảng trắng)',1,NULL,0,NULL,'08f9afc9-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (187,'ALI0000000187',2,70,'%s phải là một số fax hợp lệ (chỉ cho phép chữ số và khoảng trắng)',1,NULL,0,NULL,'08f9b10a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (188,'ALI0000000188',2,71,'%s chỉ chấp nhận các ký tự chữ, số, gạch dưới (_), gạch ngang (-), @ hoặc gạch chéo (/)',1,NULL,0,NULL,'08f9b23e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (189,'ALI0000000189',2,72,'%s phải là một địa chỉ email hợp lệ',1,NULL,0,NULL,'08f9b36e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (190,'ALI0000000190',2,73,'%s phải là một mật khẩu hợp lệ',1,NULL,0,NULL,'08f9b495-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (191,'ALI0000000191',2,74,'%s phải là một giá trị hợp lệ',1,NULL,0,NULL,'08f9b5c0-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (192,'ALI0000000192',2,75,'Xin chào',1,NULL,0,NULL,'08f9b6e8-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (193,'ALI0000000193',2,76,'Welcome to Apps4Clouds!',1,NULL,0,NULL,'08f9b80f-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (194,'ALI0000000194',2,77,'Bạn có thể copy luôn các dữ liệu có liên quan dưới đây của %s này:',1,NULL,0,NULL,'08f9b93e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (195,'ALI0000000195',2,78,'Copy luôn các ',1,NULL,0,NULL,'08f9ba61-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (196,'ALI0000000196',2,79,'Nếu bạn xóa %s, một số dữ liệu có liên quan có thể trở thành dữ liệu rác. Bạn hãy kiểm tra kỹ trước khi xóa, hoặc bạn có thể chọ',1,NULL,0,NULL,'08f9bb84-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (197,'ALI0000000197',2,80,'Xóa luôn các ',1,NULL,0,NULL,'08f9bcb8-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (198,'ALI0000000198',2,81,'Xem các %s khác:',1,NULL,0,NULL,'08f9bddb-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (199,'ALI0000000199',2,82,'Không thể mở file nhập liệu',1,NULL,0,NULL,'08f9c5be-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (200,'ALI0000000200',2,83,'Định dạng của file nhập liêu không đúng',1,NULL,0,NULL,'08f9c707-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (201,'ALI0000000201',2,84,'Không có dữ liệu hợp lệ nào trong file nhập liệu',1,NULL,0,NULL,'08f9c826-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (202,'ALI0000000202',2,85,'Hiển thị?',1,NULL,0,NULL,'08f9c949-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (203,'ALI0000000203',2,86,'Hình ảnh',1,NULL,0,NULL,'08f9ca6b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (204,'ALI0000000204',2,87,'Mô tả',1,NULL,0,NULL,'08f9cb8a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (205,'ALI0000000205',2,88,'phân quyền',1,NULL,0,NULL,'08f9cca4-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (206,'ALI0000000206',2,89,'người dùng',1,NULL,0,NULL,'08f9cdcb-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (207,'ALI0000000207',2,90,'thành viên',1,NULL,0,NULL,'08f9cee6-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (208,'ALI0000000208',2,91,'nhóm người dùng',1,NULL,0,NULL,'08f9d009-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (209,'ALI0000000209',2,92,'Tên nhóm người dùng',1,NULL,0,NULL,'08f9d130-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (210,'ALI0000000210',2,93,'Ghi chú',1,NULL,0,NULL,'08f9d25b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (211,'ALI0000000211',2,94,'Người duyệt',1,NULL,0,NULL,'08f9d37e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (212,'ALI0000000212',2,95,'Ngày duyệt',1,NULL,0,NULL,'08f9d494-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (213,'ALI0000000213',2,96,'Duyệt',1,NULL,0,NULL,'08f9d5b3-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (214,'ALI0000000214',2,97,'Nếu bạn muốn duyệt %s, bạn phải chọn duyệt luôn các dữ liệu con của nó để bảo đảm tính nhất quán của dữ liệu. Bạn hãy kiểm tra k',1,NULL,0,NULL,'08f9d6cd-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (215,'ALI0000000215',2,98,'Duyệt luôn các',1,NULL,0,NULL,'08f9d801-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (216,'ALI0000000216',2,99,'Nghiệp vụ này không được phép thực hiện đối với một %s đã được duyệt.',1,NULL,0,NULL,'08f9d931-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (217,'ALI0000000217',2,100,'In',1,NULL,0,NULL,'08f9da69-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (218,'ALI0000000218',2,101,'Tất cả',1,NULL,0,NULL,'08f9db83-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (219,'ALI0000000219',2,102,'Đầu',1,NULL,0,NULL,'08f9dc9d-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (220,'ALI0000000220',2,103,'Trước',1,NULL,0,NULL,'08f9ddc0-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (221,'ALI0000000221',2,104,'Sau',1,NULL,0,NULL,'08f9dedb-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (222,'ALI0000000222',2,105,'Cuối',1,NULL,0,NULL,'08f9dff9-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (223,'ALI0000000223',2,106,'Cấu hình',1,NULL,0,NULL,'08f9e113-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (224,'ALI0000000224',2,107,'CMS',1,NULL,0,NULL,'08f9e232-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (225,'ALI0000000225',2,108,'Template',1,NULL,0,NULL,'08f9e351-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (226,'ALI0000000226',2,109,'Layout',1,NULL,0,NULL,'08f9e46b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (227,'ALI0000000227',2,110,'Layout',1,NULL,0,NULL,'08f9e581-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (228,'ALI0000000228',2,111,'Custom layout',1,NULL,0,NULL,'08f9e69f-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (229,'ALI0000000229',2,112,'Handler',1,NULL,0,NULL,'08f9e7be-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (230,'ALI0000000230',2,113,'Đồng bộ',1,NULL,0,NULL,'08f9e8dd-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (231,'ALI0000000231',2,114,'Đổi mật khẩu',1,NULL,0,NULL,'08f9e9fb-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (232,'ALI0000000232',2,115,'Mật khẩu mới',1,NULL,0,NULL,'08f9eb27-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (233,'ALI0000000233',2,116,'Xác nhận mật khẩu mới',1,NULL,0,NULL,'08f9ec56-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (234,'ALI0000000234',2,117,'Cập nhật',1,NULL,0,NULL,'08f9ed82-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (235,'ALI0000000235',1,124,'Acl type',1,NULL,0,NULL,'6a5c60a3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (236,'ALI0000000236',1,127,'Acl type name',1,NULL,0,NULL,'6a5c6886-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (237,'ALI0000000237',1,167,'Action',1,NULL,0,NULL,'6a5c6982-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (238,'ALI0000000238',1,119,'Add item',1,NULL,0,NULL,'6a5c6a54-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (239,'ALI0000000239',1,122,'Additional information',1,NULL,0,NULL,'6a5c6b10-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (240,'ALI0000000240',1,248,'Admin filter',1,NULL,0,NULL,'6a5c6be2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (241,'ALI0000000241',1,249,'Admin filter name',1,NULL,0,NULL,'6a5c6d40-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (242,'ALI0000000242',1,128,'Admin label',1,NULL,0,NULL,'6a5c6e1f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (243,'ALI0000000243',1,131,'Admin language',1,NULL,0,NULL,'6a5c6ee8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (244,'ALI0000000244',1,129,'Admin language item',1,NULL,0,NULL,'6a5c6fb1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (245,'ALI0000000245',1,132,'Admin language name',1,NULL,0,NULL,'6a5c707e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (246,'ALI0000000246',1,252,'Admin layout field',1,NULL,0,NULL,'6a5c710b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (247,'ALI0000000247',1,253,'Admin layout section',1,NULL,0,NULL,'6a5c7198-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (248,'ALI0000000248',1,255,'Admin layout section name',1,NULL,0,NULL,'6a5c722a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (249,'ALI0000000249',1,135,'Admin menu',1,NULL,0,NULL,'6a5c72b3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (250,'ALI0000000250',1,136,'Admin menu item',1,NULL,0,NULL,'6a5c733c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (251,'ALI0000000251',1,139,'Admin menu item name',1,NULL,0,NULL,'6a5c73c0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (252,'ALI0000000252',1,138,'Admin menu name',1,NULL,0,NULL,'6a5c744d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (253,'ALI0000000253',1,151,'Admin module',1,NULL,0,NULL,'6a5c74da-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (254,'ALI0000000254',1,155,'Admin module name',1,NULL,0,NULL,'6a5c755f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (255,'ALI0000000255',1,220,'Admin style',1,NULL,0,NULL,'6a5c75e8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (256,'ALI0000000256',1,159,'Admin view',1,NULL,0,NULL,'6a5c7668-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (257,'ALI0000000257',1,182,'Arg user',1,NULL,0,NULL,'6a5c76ed-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (258,'ALI0000000258',1,181,'Arg user group',1,NULL,0,NULL,'6a5c7776-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (259,'ALI0000000259',1,157,'Available actions',1,NULL,0,NULL,'6a5c77ff-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (260,'ALI0000000260',1,193,'Base type code',1,NULL,0,NULL,'6a5c7887-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (261,'ALI0000000261',1,152,'Change log',1,NULL,0,NULL,'6a5c7915-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (262,'ALI0000000262',1,133,'Code',1,NULL,0,NULL,'6a5c7995-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (263,'ALI0000000263',1,176,'Column',1,NULL,0,NULL,'6a5c7a1a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (264,'ALI0000000264',1,250,'Columns',1,NULL,0,NULL,'6a5c7a9a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (265,'ALI0000000265',1,261,'Condition',1,NULL,0,NULL,'6a5c7b1a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (266,'ALI0000000266',1,162,'Condition field',1,NULL,0,NULL,'6a5c7b9f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (267,'ALI0000000267',1,163,'Condition value',1,NULL,0,NULL,'6a5c7c28-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (268,'ALI0000000268',1,186,'Context',1,NULL,0,NULL,'6a5c7cb5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (269,'ALI0000000269',1,166,'Create new filter',1,NULL,0,NULL,'6a5c7d35-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (270,'ALI0000000270',1,210,'Creation date',1,NULL,0,NULL,'6a5c7dbe-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (271,'ALI0000000271',1,137,'Dashboard',1,NULL,0,NULL,'6a5c7e47-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (272,'ALI0000000272',1,174,'Dashboard file path',1,NULL,0,NULL,'6a5c7ec7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (273,'ALI0000000273',1,173,'Dashboard layout',1,NULL,0,NULL,'6a5c7f54-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (274,'ALI0000000274',1,172,'Dashboard name',1,NULL,0,NULL,'6a5c7fdd-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (275,'ALI0000000275',1,260,'Datasource',1,NULL,0,NULL,'6a5c8062-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (276,'ALI0000000276',1,270,'Date',1,NULL,0,NULL,'6a5c80e6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (277,'ALI0000000277',1,202,'Date of birth',1,NULL,0,NULL,'6a5c816b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (278,'ALI0000000278',1,169,'Date time',1,NULL,0,NULL,'6a5c81f4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (279,'ALI0000000279',1,214,'Default dashboard',1,NULL,0,NULL,'6a5c8278-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (280,'ALI0000000280',1,170,'Details',1,NULL,0,NULL,'6a5c82fd-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (281,'ALI0000000281',1,199,'Email',1,NULL,0,NULL,'6a5c8382-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (282,'ALI0000000282',1,145,'Enable all?',1,NULL,0,NULL,'6a5c8406-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (283,'ALI0000000283',1,142,'Enable left?',1,NULL,0,NULL,'6a5c84c2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (284,'ALI0000000284',1,144,'Enable quick?',1,NULL,0,NULL,'6a5c8550-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (285,'ALI0000000285',1,146,'Enable settings?',1,NULL,0,NULL,'6a5c85d4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (286,'ALI0000000286',1,143,'Enable top?',1,NULL,0,NULL,'6a5c8659-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (287,'ALI0000000287',1,278,'End workflow stage',1,NULL,0,NULL,'6a5c86dd-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (288,'ALI0000000288',1,194,'Extra',1,NULL,0,NULL,'6a5c8762-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (289,'ALI0000000289',1,204,'Facebook',1,NULL,0,NULL,'6a5c87e2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (290,'ALI0000000290',1,205,'Facebook oauth',1,NULL,0,NULL,'6a5c8867-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (291,'ALI0000000291',1,213,'Female',1,NULL,0,NULL,'6a5c88f0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (292,'ALI0000000292',1,153,'Field',1,NULL,0,NULL,'6a5c8974-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (293,'ALI0000000293',1,125,'Field acl',1,NULL,0,NULL,'6a5c89f0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (294,'ALI0000000294',1,175,'Field name',1,NULL,0,NULL,'6a5c8a79-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (295,'ALI0000000295',1,179,'Fields',1,NULL,0,NULL,'6a5c8afa-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (296,'ALI0000000296',1,196,'First name',1,NULL,0,NULL,'6a5c8b7e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (297,'ALI0000000297',1,141,'Font awesome icon',1,NULL,0,NULL,'6a5c8bfa-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (298,'ALI0000000298',1,201,'Gender',1,NULL,0,NULL,'6a5c8c83-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (299,'ALI0000000299',1,150,'Go to full form',1,NULL,0,NULL,'6a5c8d08-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (300,'ALI0000000300',1,206,'Google',1,NULL,0,NULL,'6a5c8d91-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (301,'ALI0000000301',1,207,'Google oauth',1,NULL,0,NULL,'6a5c8e11-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (302,'ALI0000000302',1,215,'IP',1,NULL,0,NULL,'6a5c8e9a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (303,'ALI0000000303',1,274,'Binding object deletable?',1,NULL,0,NULL,'6a5c8f1e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (304,'ALI0000000304',1,273,'Binding object editable?',1,NULL,0,NULL,'6a5c8fb0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (305,'ALI0000000305',1,158,'Comment enabled?',1,NULL,0,NULL,'6a5c9039-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (306,'ALI0000000306',1,251,'Default?',1,NULL,0,NULL,'6a5c90c2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (307,'ALI0000000307',1,203,'Email verified?',1,NULL,0,NULL,'6a5c9146-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (308,'ALI0000000308',1,178,'Excluded?',1,NULL,0,NULL,'6a5c91cf-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (309,'ALI0000000309',1,264,'Mandatory?',1,NULL,0,NULL,'6a5c924f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (310,'ALI0000000310',1,165,'Print view?',1,NULL,0,NULL,'6a5c92d0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (311,'ALI0000000311',1,148,'Starred?',1,NULL,0,NULL,'6a5c9350-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (312,'ALI0000000312',1,168,'Item',1,NULL,0,NULL,'6a5c93d0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (313,'ALI0000000313',1,130,'Label',1,NULL,0,NULL,'6a5c944c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (314,'ALI0000000314',1,197,'Last name',1,NULL,0,NULL,'6a5c94d1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (315,'ALI0000000315',1,211,'Latest login',1,NULL,0,NULL,'6a5c9551-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (316,'ALI0000000316',1,212,'Male',1,NULL,0,NULL,'6a5c95d6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (317,'ALI0000000317',1,222,'Menu quick search',1,NULL,0,NULL,'6a5c965a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (318,'ALI0000000318',1,239,'Access right',1,NULL,0,NULL,'6a5c96df-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (319,'ALI0000000319',1,227,'Acl type',1,NULL,0,NULL,'6a5c9764-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (320,'ALI0000000320',1,282,'Admin filter',1,NULL,0,NULL,'6a5c97e4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (321,'ALI0000000321',1,237,'Admin label',1,NULL,0,NULL,'6a5c9869-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (322,'ALI0000000322',1,241,'Admin language',1,NULL,0,NULL,'6a5c98ed-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (323,'ALI0000000323',1,247,'Admin language item',1,NULL,0,NULL,'6a5c9976-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (324,'ALI0000000324',1,286,'Admin layout field',1,NULL,0,NULL,'6a5c99ff-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (325,'ALI0000000325',1,289,'Admin layout section',1,NULL,0,NULL,'6a5c9a88-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (326,'ALI0000000326',1,235,'Admin menu',1,NULL,0,NULL,'6a5c9b15-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (327,'ALI0000000327',1,246,'Admin menu item',1,NULL,0,NULL,'6a5c9b95-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (328,'ALI0000000328',1,240,'Admin module',1,NULL,0,NULL,'6a5c9c1a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (329,'ALI0000000329',1,236,'Admin view',1,NULL,0,NULL,'6a5c9c9e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (330,'ALI0000000330',1,232,'Change log',1,NULL,0,NULL,'6a5c9d1f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (331,'ALI0000000331',1,230,'Dashboard',1,NULL,0,NULL,'6a5c9d9f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (332,'ALI0000000332',1,224,'Field',1,NULL,0,NULL,'6a5c9e1f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (333,'ALI0000000333',1,231,'Field acl',1,NULL,0,NULL,'6a5ca289-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (334,'ALI0000000334',1,234,'Object acl',1,NULL,0,NULL,'6a5ca323-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (335,'ALI0000000335',1,225,'Option',1,NULL,0,NULL,'6a5ca3a3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (336,'ALI0000000336',1,229,'Parameter',1,NULL,0,NULL,'6a5ca427-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (337,'ALI0000000337',1,245,'Parameter group',1,NULL,0,NULL,'6a5ca4a8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (338,'ALI0000000338',1,242,'Parameter type',1,NULL,0,NULL,'6a5ca52c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (339,'ALI0000000339',1,238,'Recycle bin',1,NULL,0,NULL,'6a5ca5b5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (340,'ALI0000000340',1,279,'Screen',1,NULL,0,NULL,'6a5ca63a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (341,'ALI0000000341',1,283,'Screen field',1,NULL,0,NULL,'6a5ca6ba-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (342,'ALI0000000342',1,223,'User',1,NULL,0,NULL,'6a5ca743-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (343,'ALI0000000343',1,233,'User group',1,NULL,0,NULL,'6a5ca7c8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (344,'ALI0000000344',1,226,'User log',1,NULL,0,NULL,'6a5ca848-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (345,'ALI0000000345',1,243,'User membership',1,NULL,0,NULL,'6a5ca8c8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (346,'ALI0000000346',1,244,'User preference',1,NULL,0,NULL,'6a5ca94d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (347,'ALI0000000347',1,228,'User role',1,NULL,0,NULL,'6a5ca9d6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (348,'ALI0000000348',1,281,'Value type',1,NULL,0,NULL,'6a5caa5a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (349,'ALI0000000349',1,280,'Workflow',1,NULL,0,NULL,'6a5caadb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (350,'ALI0000000350',1,288,'Workflow application',1,NULL,0,NULL,'6a5cab5b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (351,'ALI0000000351',1,284,'Workflow log',1,NULL,0,NULL,'6a5cabe4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (352,'ALI0000000352',1,285,'Workflow stage',1,NULL,0,NULL,'6a5cac68-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (353,'ALI0000000353',1,287,'Workflow transition',1,NULL,0,NULL,'6a5cacf1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (354,'ALI0000000354',1,121,'Next',1,NULL,0,NULL,'6a5cad76-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (355,'ALI0000000355',1,180,'Object',1,NULL,0,NULL,'6a5cadff-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (356,'ALI0000000356',1,126,'Object acl',1,NULL,0,NULL,'6a5cae7f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (357,'ALI0000000357',1,147,'Open in new window',1,NULL,0,NULL,'6a5caefb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (358,'ALI0000000358',1,183,'Option',1,NULL,0,NULL,'6a5caf84-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (359,'ALI0000000359',1,184,'Name?',1,NULL,0,NULL,'6a5cb009-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (360,'ALI0000000360',1,187,'Parameter',1,NULL,0,NULL,'6a5cb089-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (361,'ALI0000000361',1,189,'Parameter group',1,NULL,0,NULL,'6a5cb109-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (362,'ALI0000000362',1,191,'Parameter group name',1,NULL,0,NULL,'6a5cb192-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (363,'ALI0000000363',1,188,'Parameter name',1,NULL,0,NULL,'6a5cb21f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (364,'ALI0000000364',1,190,'Parameter type',1,NULL,0,NULL,'6a5cb2a4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (365,'ALI0000000365',1,192,'Parameter type name',1,NULL,0,NULL,'6a5cb328-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (366,'ALI0000000366',1,149,'Parent',1,NULL,0,NULL,'6a5cb3b1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (367,'ALI0000000367',1,140,'Path',1,NULL,0,NULL,'6a5cb432-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (368,'ALI0000000368',1,200,'Phone',1,NULL,0,NULL,'6a5cb4b2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (369,'ALI0000000369',1,198,'Photo',1,NULL,0,NULL,'6a5cb532-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (370,'ALI0000000370',1,254,'Position',1,NULL,0,NULL,'6a5cb5b3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (371,'ALI0000000371',1,156,'Prefix',1,NULL,0,NULL,'6a5cb637-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (372,'ALI0000000372',1,120,'Prev',1,NULL,0,NULL,'6a5cb6bc-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (373,'ALI0000000373',1,123,'Quick create',1,NULL,0,NULL,'6a5cb73c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (374,'ALI0000000374',1,118,'Records',1,NULL,0,NULL,'6a5cb7c1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (375,'ALI0000000375',1,154,'Recycle bin',1,NULL,0,NULL,'6a5cb845-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (376,'ALI0000000376',1,161,'Screen',1,NULL,0,NULL,'6a5cb8ce-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (377,'ALI0000000377',1,258,'Screen field',1,NULL,0,NULL,'6a5cb94a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (378,'ALI0000000378',1,256,'Show title',1,NULL,0,NULL,'6a5cb9d3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (379,'ALI0000000379',1,277,'Start workflow stage',1,NULL,0,NULL,'6a5cba53-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (380,'ALI0000000380',1,164,'Template',1,NULL,0,NULL,'6a5cbadc-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (381,'ALI0000000381',1,263,'Textcol',1,NULL,0,NULL,'6a5cbb5d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (382,'ALI0000000382',1,160,'Title',1,NULL,0,NULL,'6a5cbbdd-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (383,'ALI0000000383',1,177,'Tooltip',1,NULL,0,NULL,'6a5cbc5d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (384,'ALI0000000384',1,276,'Transition screen',1,NULL,0,NULL,'6a5cbcde-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (385,'ALI0000000385',1,134,'Translation',1,NULL,0,NULL,'6a5cbd66-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (386,'ALI0000000386',1,195,'User log',1,NULL,0,NULL,'6a5cbde7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (387,'ALI0000000387',1,171,'User preference',1,NULL,0,NULL,'6a5cbe67-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (388,'ALI0000000388',1,216,'User role',1,NULL,0,NULL,'6a5cbef8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (389,'ALI0000000389',1,221,'User role name',1,NULL,0,NULL,'6a5cbf8e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (390,'ALI0000000390',1,217,'Valid from',1,NULL,0,NULL,'6a5cc017-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (391,'ALI0000000391',1,218,'Valid until',1,NULL,0,NULL,'6a5cc09c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (392,'ALI0000000392',1,185,'Value',1,NULL,0,NULL,'6a5cc120-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (393,'ALI0000000393',1,259,'Value type',1,NULL,0,NULL,'6a5cc1a5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (394,'ALI0000000394',1,265,'Value type name',1,NULL,0,NULL,'6a5cc22e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (395,'ALI0000000395',1,262,'Valuecol',1,NULL,0,NULL,'6a5cc2b7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (396,'ALI0000000396',1,219,'Wallpaper',1,NULL,0,NULL,'6a5cc33b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (397,'ALI0000000397',1,257,'Workflow',1,NULL,0,NULL,'6a5cc3c0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (398,'ALI0000000398',1,267,'Workflow application',1,NULL,0,NULL,'6a5cc444-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (399,'ALI0000000399',1,268,'Workflow log',1,NULL,0,NULL,'6a5cc4d2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (400,'ALI0000000400',1,266,'Workflow name',1,NULL,0,NULL,'6a5cc556-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (401,'ALI0000000401',1,271,'Workflow stage',1,NULL,0,NULL,'6a5cc5db-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (402,'ALI0000000402',1,272,'Workflow stage name',1,NULL,0,NULL,'6a5cc668-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (403,'ALI0000000403',1,269,'Workflow transition',1,NULL,0,NULL,'6a5cc6f1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (404,'ALI0000000404',1,275,'Workflow transition name',1,NULL,0,NULL,'6a5cc77a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (405,'ALI0000000405',1,208,'Yahoo',1,NULL,0,NULL,'6a5cc802-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (406,'ALI0000000406',1,209,'Yahoo oauth',1,NULL,0,NULL,'6a5cc883-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (407,'ALI0000000407',3,43,'Droit d\'accès',1,NULL,0,NULL,'6a5cc907-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (408,'ALI0000000408',3,44,'Droit d\'accès (avancé)',1,NULL,0,NULL,'6a5cc990-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (409,'ALI0000000409',3,88,'Droit d\'accès',1,NULL,0,NULL,'6a5cca22-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (410,'ALI0000000410',3,28,'Compte',1,NULL,0,NULL,'6a5ccaa6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (411,'ALI0000000411',3,124,'Type Acl',1,NULL,0,NULL,'6a5ccb27-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (412,'ALI0000000412',3,127,'Nom de type Acl',1,NULL,0,NULL,'6a5ccbab-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (413,'ALI0000000413',3,167,'Action',1,NULL,0,NULL,'6a5ccc30-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (414,'ALI0000000414',3,33,'Actions',1,NULL,0,NULL,'6a5cccb0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (415,'ALI0000000415',3,5,'Ajouter',1,NULL,0,NULL,'6a5ccd35-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (416,'ALI0000000416',3,119,'Ajouter un élément',1,NULL,0,NULL,'6a5ccdb9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (417,'ALI0000000417',3,122,'Informations complémentaires',1,NULL,0,NULL,'6a5cce4b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (418,'ALI0000000418',3,106,'Admin',1,NULL,0,NULL,'6a5cced4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (419,'ALI0000000419',3,248,'Filtre Admin',1,NULL,0,NULL,'6a5ccf58-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (420,'ALI0000000420',3,249,'Nom du filtre Admin',1,NULL,0,NULL,'6a5ccfe1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (421,'ALI0000000421',3,128,'Étiquette Admin',1,NULL,0,NULL,'6a5cd06e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (422,'ALI0000000422',3,131,'Admin langue',1,NULL,0,NULL,'6a5cd0fb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (423,'ALI0000000423',3,129,'Élément de langage Admin',1,NULL,0,NULL,'6a5cd184-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (424,'ALI0000000424',3,132,'Nom de langue Admin',1,NULL,0,NULL,'6a5cd211-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (425,'ALI0000000425',3,252,'Champ présentation Admin',1,NULL,0,NULL,'6a5cd29a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (426,'ALI0000000426',3,253,'Section Admin layout',1,NULL,0,NULL,'6a5cd323-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (427,'ALI0000000427',3,255,'Nom Admin mise en section',1,NULL,0,NULL,'6a5cd3b0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (428,'ALI0000000428',3,135,'Menu Admin',1,NULL,0,NULL,'6a5cd439-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (429,'ALI0000000429',3,136,'Admin menu item',1,NULL,0,NULL,'6a5cd4c2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (430,'ALI0000000430',3,139,'Nom Admin menu item',1,NULL,0,NULL,'6a5cd54b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (431,'ALI0000000431',3,138,'Nom de menu Admin',1,NULL,0,NULL,'6a5cd5cf-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (432,'ALI0000000432',3,151,'Module Admin',1,NULL,0,NULL,'6a5cd658-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (433,'ALI0000000433',3,155,'Nom du module Admin',1,NULL,0,NULL,'6a5cd6dd-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (434,'ALI0000000434',3,220,'Style  Admin',1,NULL,0,NULL,'6a5cd766-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (435,'ALI0000000435',3,159,'Admin view',1,NULL,0,NULL,'6a5cd7ea-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (436,'ALI0000000436',3,96,'Approuver',1,NULL,0,NULL,'6a5cd86f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (437,'ALI0000000437',3,98,'Approuver également',1,NULL,0,NULL,'6a5cd8f4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (438,'ALI0000000438',3,95,'Approuvé à',1,NULL,0,NULL,'6a5cd97c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (439,'ALI0000000439',3,94,'Approuvé par',1,NULL,0,NULL,'6a5cda05-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (440,'ALI0000000440',3,182,'Arg utilisateur',1,NULL,0,NULL,'6a5cda8a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (441,'ALI0000000441',3,181,'Arg user group',1,NULL,0,NULL,'6a5cdb13-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (442,'ALI0000000442',3,157,'Actions disponibles',1,NULL,0,NULL,'6a5cdb97-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (443,'ALI0000000443',3,193,'Code de type de base',1,NULL,0,NULL,'6a5cdc20-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (444,'ALI0000000444',3,15,'Lotedit',1,NULL,0,NULL,'6a5cdcad-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (445,'ALI0000000445',3,13,'Import',1,NULL,0,NULL,'6a5cdd32-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (446,'ALI0000000446',3,9,'Annuler',1,NULL,0,NULL,'6a5cddb7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (447,'ALI0000000447',3,82,'Impossible d\'ouvrir fichier d\'importation',1,NULL,0,NULL,'6a5cde37-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (448,'ALI0000000448',3,117,'Changement',1,NULL,0,NULL,'6a5cdebc-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (449,'ALI0000000449',3,152,'Journal des  modifications',1,NULL,0,NULL,'6a5cdf40-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (450,'ALI0000000450',3,6,'Clone',1,NULL,0,NULL,'6a5ce43b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (451,'ALI0000000451',3,10,'Fermer',1,NULL,0,NULL,'6a5ce4d9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (452,'ALI0000000452',3,107,'CMS',1,NULL,0,NULL,'6a5ce55e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (453,'ALI0000000453',3,133,'Code',1,NULL,0,NULL,'6a5ce5e2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (454,'ALI0000000454',3,176,'Colonne',1,NULL,0,NULL,'6a5ce663-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (455,'ALI0000000455',3,250,'Colonnes',1,NULL,0,NULL,'6a5ce6e3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (456,'ALI0000000456',3,261,'Condition',1,NULL,0,NULL,'6a5ce767-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (457,'ALI0000000457',3,162,'Champ de condition',1,NULL,0,NULL,'6a5ce7f0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (458,'ALI0000000458',3,163,'État valeur',1,NULL,0,NULL,'6a5ce875-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (459,'ALI0000000459',3,116,'Confirmer le nouveau mot de passe',1,NULL,0,NULL,'6a5ce8fa-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (460,'ALI0000000460',3,26,'Contactez-nous',1,NULL,0,NULL,'6a5ce982-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (461,'ALI0000000461',3,186,'Contexte',1,NULL,0,NULL,'6a5cea07-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (462,'ALI0000000462',3,7,'Copie',1,NULL,0,NULL,'6a5cea8c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (463,'ALI0000000463',3,78,'Copier aussi',1,NULL,0,NULL,'6a5ceb10-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (464,'ALI0000000464',3,166,'Créer un nouveau filtre',1,NULL,0,NULL,'6a5ceb95-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (465,'ALI0000000465',3,210,'Date de la création',1,NULL,0,NULL,'6a5cec26-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (466,'ALI0000000466',3,56,'Fichier (format .csv) contenant des données sur excel',1,NULL,0,NULL,'6a5cecaf-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (467,'ALI0000000467',3,111,'Mise en page personnalisée',1,NULL,0,NULL,'6a5ced3c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (468,'ALI0000000468',3,137,'Dashboard',1,NULL,0,NULL,'6a5cedc9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (469,'ALI0000000469',3,174,'Tableau de bord file path',1,NULL,0,NULL,'6a5cee4e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (470,'ALI0000000470',3,173,'Disposition du tableau de bord',1,NULL,0,NULL,'6a5ceed7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (471,'ALI0000000471',3,172,'Nom du tableau de bord',1,NULL,0,NULL,'6a5cef5b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (472,'ALI0000000472',3,260,'Datasource',1,NULL,0,NULL,'6a5cefe9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (473,'ALI0000000473',3,270,'Date',1,NULL,0,NULL,'6a5cf06d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (474,'ALI0000000474',3,202,'Date de naissance',1,NULL,0,NULL,'6a5cf0f2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (475,'ALI0000000475',3,169,'Date heure',1,NULL,0,NULL,'6a5cf176-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (476,'ALI0000000476',3,214,'Tableau de bord par défaut',1,NULL,0,NULL,'6a5cf1f7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (477,'ALI0000000477',3,8,'Supprimer',1,NULL,0,NULL,'6a5cf288-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (478,'ALI0000000478',3,80,'Supprimer aussi',1,NULL,0,NULL,'6a5cf30d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (479,'ALI0000000479',3,87,'Description',1,NULL,0,NULL,'6a5cf39a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (480,'ALI0000000480',3,170,'Détails',1,NULL,0,NULL,'6a5cf41e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (481,'ALI0000000481',3,53,'Disable',1,NULL,0,NULL,'6a5cf49f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (482,'ALI0000000482',3,55,'Disabled',1,NULL,0,NULL,'6a5cf523-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (483,'ALI0000000483',3,11,'Edit',1,NULL,0,NULL,'6a5cf5a4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (484,'ALI0000000484',3,35,'Edit entrées',1,NULL,0,NULL,'6a5cf628-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (485,'ALI0000000485',3,199,'Email',1,NULL,0,NULL,'6a5cf6b1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (486,'ALI0000000486',3,52,'Enable',1,NULL,0,NULL,'6a5cf72d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (487,'ALI0000000487',3,145,'Activer tous?',1,NULL,0,NULL,'6a5cf7b2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (488,'ALI0000000488',3,142,'Activer la gauche?',1,NULL,0,NULL,'6a5cf836-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (489,'ALI0000000489',3,144,'Activer rapide?',1,NULL,0,NULL,'6a5cf8bb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (490,'ALI0000000490',3,146,'Activer la configuration?',1,NULL,0,NULL,'6a5cf940-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (491,'ALI0000000491',3,143,'Activer dessus?',1,NULL,0,NULL,'6a5cf9cd-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (492,'ALI0000000492',3,54,'Enabled',1,NULL,0,NULL,'6a5cfa51-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (493,'ALI0000000493',3,278,'Étape de fin',1,NULL,0,NULL,'6a5cfad6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (494,'ALI0000000494',3,1,'Anglais',1,NULL,0,NULL,'6a5cfb5b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (495,'ALI0000000495',3,99,'Cette action ne convient pas pour une homologué %s.',1,NULL,0,NULL,'6a5cfbdf-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (496,'ALI0000000496',3,14,'Export',1,NULL,0,NULL,'6a5cfc64-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (497,'ALI0000000497',3,194,'Extra',1,NULL,0,NULL,'6a5cfce8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (498,'ALI0000000498',3,204,'Facebook',1,NULL,0,NULL,'6a5cfd6d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (499,'ALI0000000499',3,205,'Facebook oauth',1,NULL,0,NULL,'6a5cfded-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (500,'ALI0000000500',3,51,'False',1,NULL,0,NULL,'6a5cfe76-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (501,'ALI0000000501',3,213,'Femelle',1,NULL,0,NULL,'6a5cfef6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (502,'ALI0000000502',3,153,'Field',1,NULL,0,NULL,'6a5cff77-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (503,'ALI0000000503',3,125,'Field acl',1,NULL,0,NULL,'6a5cfff7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (504,'ALI0000000504',3,175,'Nom du champ',1,NULL,0,NULL,'6a5d007c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (505,'ALI0000000505',3,179,'Champs',1,NULL,0,NULL,'6a5d0109-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (506,'ALI0000000506',3,196,'First name',1,NULL,0,NULL,'6a5d0189-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (507,'ALI0000000507',3,141,'Icône génial polices',1,NULL,0,NULL,'6a5d020e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (508,'ALI0000000508',3,114,'Forcer le changement de mot de passe',1,NULL,0,NULL,'6a5d029b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (509,'ALI0000000509',3,24,'Forgot your password?',1,NULL,0,NULL,'6a5d031f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (510,'ALI0000000510',3,201,'Gender',1,NULL,0,NULL,'6a5d03ad-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (511,'ALI0000000511',3,150,'Aller au formulaire complet',1,NULL,0,NULL,'6a5d0431-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (512,'ALI0000000512',3,206,'Google',1,NULL,0,NULL,'6a5d08b0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (513,'ALI0000000513',3,207,'Google oauth',1,NULL,0,NULL,'6a5d094e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (514,'ALI0000000514',3,97,'Lignes directrices approuvent rels',1,NULL,0,NULL,'6a5d09d3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (515,'ALI0000000515',3,77,'Vous pouvez copier également les données connexes suivantes de cette % s:',1,NULL,0,NULL,'6a5d0a5c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (516,'ALI0000000516',3,79,'Si vous supprimez ce %s, les données associées (le cas échéant) deviendrait garbage. Veuillez vérifier attentivement avant avant la suppression, ou vous pouvez cho',1,NULL,0,NULL,'6a5d0ae9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (517,'ALI0000000517',3,57,'<p>vous pouvez importer ou mettre à jour de données %s via un fichier Excel (au format .csv).<\\/p> <p>Pour votre référence sur le modèle de l\'importateur, y',1,NULL,0,NULL,'6a5d0b83-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (518,'ALI0000000518',3,20,'Hello',1,NULL,0,NULL,'6a5d0c0c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (519,'ALI0000000519',3,27,'Help',1,NULL,0,NULL,'6a5d0c94-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (520,'ALI0000000520',3,30,'ID',1,NULL,0,NULL,'6a5d0d19-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (521,'ALI0000000521',3,86,'Image',1,NULL,0,NULL,'6a5d0d99-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (522,'ALI0000000522',3,12,'Import',1,NULL,0,NULL,'6a5d0e1a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (523,'ALI0000000523',3,83,'Format de fichier importation non valide',1,NULL,0,NULL,'6a5d0e9e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (524,'ALI0000000524',3,215,'IP',1,NULL,0,NULL,'6a5d0f1f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (525,'ALI0000000525',3,274,'Objet binding à supprimer?',1,NULL,0,NULL,'6a5d0fa3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (526,'ALI0000000526',3,273,'Objet binding modifiable?',1,NULL,0,NULL,'6a5d1030-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (527,'ALI0000000527',3,158,'Commentaire activé?',1,NULL,0,NULL,'6a5d10b9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (528,'ALI0000000528',3,251,'Default  ?',1,NULL,0,NULL,'6a5d1142-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (529,'ALI0000000529',3,203,'Email vérifié?',1,NULL,0,NULL,'6a5d11c7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (530,'ALI0000000530',3,38,'Est activé?',1,NULL,0,NULL,'6a5d1254-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (531,'ALI0000000531',3,178,'Exclus  ?',1,NULL,0,NULL,'6a5d12d8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (532,'ALI0000000532',3,264,'Obligatoire  ?',1,NULL,0,NULL,'6a5d135d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (533,'ALI0000000533',3,165,'Imprimer vue?',1,NULL,0,NULL,'6a5d13e6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (534,'ALI0000000534',3,148,'La  vedette  ?',1,NULL,0,NULL,'6a5d146a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (535,'ALI0000000535',3,85,'Est visible  ?',1,NULL,0,NULL,'6a5d14f3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (537,'ALI0000000536',3,25,'Keep me signé en',1,NULL,0,NULL,'6a5d1578-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (538,'ALI0000000537',3,130,'Label',1,NULL,0,NULL,'6a5d15fc-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (539,'ALI0000000538',3,197,'Last name',1,NULL,0,NULL,'6a5d1681-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (540,'ALI0000000539',3,211,'Dernière connexion',1,NULL,0,NULL,'6a5d1701-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (541,'ALI0000000540',3,110,'Layout',1,NULL,0,NULL,'6a5d178a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (542,'ALI0000000541',3,41,'Login',1,NULL,0,NULL,'6a5d180f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (543,'ALI0000000542',3,212,'Male',1,NULL,0,NULL,'6a5d1893-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (544,'ALI0000000543',3,39,'Menu',1,NULL,0,NULL,'6a5d1918-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (545,'ALI0000000544',3,222,'Menu quick search',1,NULL,0,NULL,'6a5d1d8a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (546,'ALI0000000545',3,239,'Droit d\'accès',1,NULL,0,NULL,'6a5d1e2c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (547,'ALI0000000546',3,227,'Type Acl',1,NULL,0,NULL,'6a5d1eba-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (548,'ALI0000000547',3,282,'Filtre Admin',1,NULL,0,NULL,'6a5d1f4b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (549,'ALI0000000548',3,237,'Étiquette Admin',1,NULL,0,NULL,'6a5d22ab-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (550,'ALI0000000549',3,241,'Admin langue',1,NULL,0,NULL,'6a5d2452-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (551,'ALI0000000550',3,247,'Élément de langage Admin',1,NULL,0,NULL,'6a5d24e8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (552,'ALI0000000551',3,286,'Champ présentation Admin',1,NULL,0,NULL,'6a5d2571-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (553,'ALI0000000552',3,289,'Section Admin layout',1,NULL,0,NULL,'6a5d2602-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (554,'ALI0000000553',3,235,'Menu Admin',1,NULL,0,NULL,'6a5d2690-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (555,'ALI0000000554',3,246,'Admin menu item',1,NULL,0,NULL,'6a5d2714-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (556,'ALI0000000555',3,240,'Module Admin',1,NULL,0,NULL,'6a5d27a1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (557,'ALI0000000556',3,236,'Admin view',1,NULL,0,NULL,'6a5d282a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (558,'ALI0000000557',3,232,'Journal des modifications',1,NULL,0,NULL,'6a5d28af-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (559,'ALI0000000558',3,230,'Dashboard',1,NULL,0,NULL,'6a5d293c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (560,'ALI0000000559',3,224,'Field',1,NULL,0,NULL,'6a5d29bc-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (561,'ALI0000000560',3,231,'Acl field',1,NULL,0,NULL,'6a5d2a41-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (562,'ALI0000000561',3,234,'Objets acl',1,NULL,0,NULL,'6a5d2ac5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (563,'ALI0000000562',3,225,'Option',1,NULL,0,NULL,'6a5d2b4a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (564,'ALI0000000563',3,229,'Paramètre',1,NULL,0,NULL,'6a5d2bcf-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (565,'ALI0000000564',3,245,'Groupe de paramètres',1,NULL,0,NULL,'6a5d2d9d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (566,'ALI0000000565',3,242,'Type de paramètre',1,NULL,0,NULL,'6a5d2e3b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (567,'ALI0000000566',3,238,'Corbeille',1,NULL,0,NULL,'6a5d2ec4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (568,'ALI0000000567',3,279,'Screen',1,NULL,0,NULL,'6a5d2f48-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (569,'ALI0000000568',3,283,'Champ de l\'écran',1,NULL,0,NULL,'6a5d2fc9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (570,'ALI0000000569',3,223,'Utilisateur',1,NULL,0,NULL,'6a5d3051-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (571,'ALI0000000570',3,233,'User group',1,NULL,0,NULL,'6a5d30d2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (572,'ALI0000000571',3,226,'Connexion utilisateur',1,NULL,0,NULL,'6a5d3156-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (573,'ALI0000000572',3,243,'Membre utilisateur',1,NULL,0,NULL,'6a5d31e4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (574,'ALI0000000573',3,244,'Préférences utilisateur',1,NULL,0,NULL,'6a5d326c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (575,'ALI0000000574',3,228,'Rôle d\'utilisateur',1,NULL,0,NULL,'6a5d32f5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (576,'ALI0000000575',3,281,'Type de valeur',1,NULL,0,NULL,'6a5d337e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (577,'ALI0000000576',3,280,'Workflow',1,NULL,0,NULL,'6a5d3403-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (578,'ALI0000000577',3,288,'Application de workflow',1,NULL,0,NULL,'6a5d3487-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (579,'ALI0000000578',3,284,'Journal de  workflow',1,NULL,0,NULL,'6a5d3519-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (580,'ALI0000000579',3,285,'Étape',1,NULL,0,NULL,'6a5d35a2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (581,'ALI0000000580',3,287,'Transition de workflow',1,NULL,0,NULL,'6a5d3626-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (582,'ALI0000000581',3,32,'Module',1,NULL,0,NULL,'6a5d36af-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (583,'ALI0000000582',3,112,'Handler',1,NULL,0,NULL,'6a5d3734-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (584,'ALI0000000583',3,76,'Welcome to Apps4Clouds!',1,NULL,0,NULL,'6a5d37b4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (585,'ALI0000000584',3,34,'Nom',1,NULL,0,NULL,'6a5d383d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (586,'ALI0000000585',3,4,'Nouveau',1,NULL,0,NULL,'6a5d38c2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (587,'ALI0000000586',3,115,'Nouveau mot de passe',1,NULL,0,NULL,'6a5d3942-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (588,'ALI0000000587',3,121,'Suivant',1,NULL,0,NULL,'6a5d39cb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (589,'ALI0000000588',3,49,'Non',1,NULL,0,NULL,'6a5d3a4b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (590,'ALI0000000589',3,84,'Aucune colonne valide dans le fichier d\'importation',1,NULL,0,NULL,'6a5d3acb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (591,'ALI0000000590',3,93,'Note',1,NULL,0,NULL,'6a5d3b58-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (592,'ALI0000000591',3,180,'Objet',1,NULL,0,NULL,'6a5d3bdd-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (594,'ALI0000000592',3,147,'Ouvrir dans une nouvelle fenêtre',1,NULL,0,NULL,'6a5d3c5d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (595,'ALI0000000593',3,183,'Option',1,NULL,0,NULL,'6a5d3ce2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (596,'ALI0000000594',3,184,'Nom  ?',1,NULL,0,NULL,'6a5d3d67-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (597,'ALI0000000595',3,37,'Commande',1,NULL,0,NULL,'6a5d3deb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (598,'ALI0000000596',3,109,'Layout',1,NULL,0,NULL,'6a5d3e70-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (599,'ALI0000000597',3,108,'Template',1,NULL,0,NULL,'6a5d3ef0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (600,'ALI0000000598',3,105,'Fin',1,NULL,0,NULL,'6a5d3f70-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (601,'ALI0000000599',3,104,'Suivant',1,NULL,0,NULL,'6a5d3ff5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (602,'ALI0000000600',3,103,'Prev',1,NULL,0,NULL,'6a5d407a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (603,'ALI0000000601',3,102,'Start',1,NULL,0,NULL,'6a5d40fa-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (604,'ALI0000000602',3,101,'All',1,NULL,0,NULL,'6a5d417f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (605,'ALI0000000603',3,187,'Paramètre',1,NULL,0,NULL,'6a5d4203-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (606,'ALI0000000604',3,189,'Groupe de paramètres',1,NULL,0,NULL,'6a5d4283-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (607,'ALI0000000605',3,191,'Nom du paramètre groupe',1,NULL,0,NULL,'6a5d4311-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (608,'ALI0000000606',3,188,'Nom du paramètre',1,NULL,0,NULL,'6a5d439e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (609,'ALI0000000607',3,190,'Type de paramètre',1,NULL,0,NULL,'6a5d4422-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (610,'ALI0000000608',3,192,'Nom du paramètre type',1,NULL,0,NULL,'6a5d44ab-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (611,'ALI0000000609',3,149,'Parent',1,NULL,0,NULL,'6a5d4530-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (612,'ALI0000000610',3,23,'Password',1,NULL,0,NULL,'6a5d45b4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (613,'ALI0000000611',3,140,'Path',1,NULL,0,NULL,'6a5d4639-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (614,'ALI0000000612',3,200,'Téléphone',1,NULL,0,NULL,'6a5d46b9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (615,'ALI0000000613',3,198,'Photo',1,NULL,0,NULL,'6a5d473a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (616,'ALI0000000614',3,254,'Position',1,NULL,0,NULL,'6a5d47fe-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (617,'ALI0000000615',3,156,'Préfixe',1,NULL,0,NULL,'6a5d48bf-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (618,'ALI0000000616',3,120,'Prev',1,NULL,0,NULL,'6a5d4950-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (619,'ALI0000000617',3,100,'Print',1,NULL,0,NULL,'6a5d49d1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (620,'ALI0000000618',3,123,'Quick créer',1,NULL,0,NULL,'6a5d4a55-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (621,'ALI0000000619',3,118,'Records',1,NULL,0,NULL,'6a5d4ade-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (622,'ALI0000000620',3,154,'Corbeille',1,NULL,0,NULL,'6a5d4b63-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (623,'ALI0000000621',3,17,'Reset',1,NULL,0,NULL,'6a5d4be7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (624,'ALI0000000622',3,18,'Enregistrer',1,NULL,0,NULL,'6a5d4c68-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (625,'ALI0000000623',3,161,'Écran',1,NULL,0,NULL,'6a5d4ce8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (626,'ALI0000000624',3,258,'Champ de l\'écran',1,NULL,0,NULL,'6a5d4d6c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (627,'ALI0000000625',3,16,'Chercher',1,NULL,0,NULL,'6a5d4dfa-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (628,'ALI0000000626',3,40,'Setup',1,NULL,0,NULL,'6a5d4e7e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (629,'ALI0000000627',3,256,'Afficher le titre',1,NULL,0,NULL,'6a5d4f03-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (630,'ALI0000000628',3,21,'Sign in',1,NULL,0,NULL,'6a5d4f8c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (631,'ALI0000000629',3,29,'Déconnexion',1,NULL,0,NULL,'6a5d5010-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (632,'ALI0000000630',3,277,'Démarrer l\'étape',1,NULL,0,NULL,'6a5d5099-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (633,'ALI0000000631',3,36,'Status',1,NULL,0,NULL,'6a5d5126-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (634,'ALI0000000632',3,113,'Sync',1,NULL,0,NULL,'6a5d51a7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (635,'ALI0000000633',3,164,'Template',1,NULL,0,NULL,'6a5d522b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (636,'ALI0000000634',3,263,'Textcol',1,NULL,0,NULL,'6a5d52b0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (637,'ALI0000000635',3,160,'Title',1,NULL,0,NULL,'6a5d5334-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (638,'ALI0000000636',3,177,'Tooltip',1,NULL,0,NULL,'6a5d53b5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (639,'ALI0000000637',3,3,'Total',1,NULL,0,NULL,'6a5d543e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (640,'ALI0000000638',3,276,'Écran de  transition',1,NULL,0,NULL,'6a5d54be-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (641,'ALI0000000639',3,134,'Traduction',1,NULL,0,NULL,'6a5d554b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (642,'ALI0000000640',3,50,'True',1,NULL,0,NULL,'6a5d55d0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (643,'ALI0000000641',3,45,'Utilisateur',1,NULL,0,NULL,'6a5d5650-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (644,'ALI0000000642',3,31,'User group',1,NULL,0,NULL,'6a5d5ac2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (645,'ALI0000000643',3,91,'User group',1,NULL,0,NULL,'6a5d5b57-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (646,'ALI0000000644',3,92,'Nom d\'utilisateur groupe',1,NULL,0,NULL,'6a5d5bd8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (647,'ALI0000000645',3,89,'Utilisateur',1,NULL,0,NULL,'6a5d5c6d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (648,'ALI0000000646',3,195,'Connexion utilisateur',1,NULL,0,NULL,'6a5d5cf2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (649,'ALI0000000647',3,42,'Membre utilisateur',1,NULL,0,NULL,'6a5d5d7f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (650,'ALI0000000648',3,90,'Membre utilisateur',1,NULL,0,NULL,'6a5d5e04-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (651,'ALI0000000649',3,22,'User name',1,NULL,0,NULL,'6a5d5e8d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (652,'ALI0000000650',3,171,'Préférences utilisateur',1,NULL,0,NULL,'6a5d5f11-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (653,'ALI0000000651',3,216,'Rôle d\'utilisateur',1,NULL,0,NULL,'6a5d5f9a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (654,'ALI0000000652',3,221,'Nom d\'utilisateur rôle',1,NULL,0,NULL,'6a5d601f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (655,'ALI0000000653',3,46,'Utilisateur',1,NULL,0,NULL,'6a5d60a8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (656,'ALI0000000654',3,217,'Valide du',1,NULL,0,NULL,'6a5d6130-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (657,'ALI0000000655',3,218,'Valable jusqu\'au',1,NULL,0,NULL,'6a5d61b5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (658,'ALI0000000656',3,59,'%s existe déjà',1,NULL,0,NULL,'6a5d623a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (659,'ALI0000000657',3,61,'%s n\'accepte que les caractères de l\'alphabet, chiffres, trait de soulignement (_), le trait d\'Union (-), de caractère ou dot caractère (.)',1,NULL,0,NULL,'6a5d62c7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (660,'ALI0000000658',3,67,'%s devrait être une date valide',1,NULL,0,NULL,'6a5d6354-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (661,'ALI0000000659',3,72,'%s doit être une adresse email valide',1,NULL,0,NULL,'6a5d63dd-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (662,'ALI0000000660',3,70,'%s doit être un numéro de fax valide (seulement les chiffres et les espaces sont autorisés)',1,NULL,0,NULL,'6a5d6461-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (663,'ALI0000000661',3,74,'%s doit contenir une valeur valide',1,NULL,0,NULL,'6a5d64f7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (664,'ALI0000000662',3,68,'%s doit être une image valide',1,NULL,0,NULL,'6a5d657c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (665,'ALI0000000663',3,64,'%s ne doit pas dépasser %s caractères',1,NULL,0,NULL,'6a5d65fc-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (666,'ALI0000000664',3,62,'%s doit être un nombre avec une valeur maximale de %s',1,NULL,0,NULL,'6a5d6681-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (667,'ALI0000000665',3,65,'%s doit avoir au moins des caractères %s',1,NULL,0,NULL,'6a5d6705-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (668,'ALI0000000666',3,63,'%s doit être un nombre avec une valeur minimale de %s',1,NULL,0,NULL,'6a5d6786-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (669,'ALI0000000667',3,58,'%s ne doit pas être vide',1,NULL,0,NULL,'6a5d680e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (670,'ALI0000000668',3,60,'%s doit être un nombre',1,NULL,0,NULL,'6a5d6897-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (671,'ALI0000000669',3,71,'%s n\'accepte que les caractères de l\'alphabet, chiffres, trait de soulignement (_), le trait d\'Union (-) ou un caractère de tableau de bord (\\/)',1,NULL,0,NULL,'6a5d6920-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (672,'ALI0000000670',3,73,'%s devrait être un mot de passe valide',1,NULL,0,NULL,'6a5d69ad-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (673,'ALI0000000671',3,69,'%s doit être un numéro de téléphone valide (seulement les chiffres et les espaces sont autorisés)',1,NULL,0,NULL,'6a5d6a32-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (674,'ALI0000000672',3,66,'%s doit être une URL valide',1,NULL,0,NULL,'6a5d6abb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (675,'ALI0000000673',3,185,'Valeur',1,NULL,0,NULL,'6a5d6b44-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (676,'ALI0000000674',3,259,'Type  valeur',1,NULL,0,NULL,'6a5d6bc4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (677,'ALI0000000675',3,265,'Nom de type de valeur',1,NULL,0,NULL,'6a5d6c49-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (678,'ALI0000000676',3,262,'Proposed',1,NULL,0,NULL,'6a5d6cd6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (679,'ALI0000000677',3,2,'Tiếng Việt',1,NULL,0,NULL,'6a5d6d5a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (680,'ALI0000000678',3,19,'View',1,NULL,0,NULL,'6a5d6ddf-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (681,'ALI0000000679',3,81,'Découvre également les autres Articles de %s:',1,NULL,0,NULL,'6a5d6e64-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (682,'ALI0000000680',3,219,'Papier peint',1,NULL,0,NULL,'6a5d6ee8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (683,'ALI0000000681',3,75,'Bienvenue',1,NULL,0,NULL,'6a5d6f71-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (684,'ALI0000000682',3,257,'Workflow',1,NULL,0,NULL,'6a5d6ff6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (685,'ALI0000000683',3,267,'Application de workflow',1,NULL,0,NULL,'6a5d707a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (686,'ALI0000000684',3,268,'Journal des flux de travail',1,NULL,0,NULL,'6a5d7103-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (687,'ALI0000000685',3,266,'Nom du flux de travail',1,NULL,0,NULL,'6a5d7546-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (688,'ALI0000000686',3,271,'Étape',1,NULL,0,NULL,'6a5d75e8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (689,'ALI0000000687',3,272,'Nom de scène de workflow',1,NULL,0,NULL,'6a5d766d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (690,'ALI0000000688',3,269,'Transition de workflow',1,NULL,0,NULL,'6a5d7703-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (691,'ALI0000000689',3,275,'Nom du workflow transition',1,NULL,0,NULL,'6a5d7790-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (692,'ALI0000000690',3,208,'Yahoo',1,NULL,0,NULL,'6a5d7819-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (693,'ALI0000000691',3,209,'Yahoo oauth',1,NULL,0,NULL,'6a5d789d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (694,'ALI0000000692',3,48,'Oui',1,NULL,0,NULL,'6a5d7922-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (695,'ALI0000000693',3,47,'Vous n\'êtes pas actuellement connecté',1,NULL,0,NULL,'6a5d79a6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (696,'ALI0000000694',2,124,'Acl loại',1,NULL,0,NULL,'6a5d7a2b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (697,'ALI0000000695',2,127,'Acl loại tên',1,NULL,0,NULL,'6a5d7ab8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (698,'ALI0000000696',2,167,'Hành động',1,NULL,0,NULL,'6a5d7bac-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (699,'ALI0000000697',2,119,'Thêm mục',1,NULL,0,NULL,'6a5d7c7e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (700,'ALI0000000698',2,122,'Thông tin bổ sung',1,NULL,0,NULL,'6a5d7d0b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (701,'ALI0000000699',2,248,'Bộ lọc Admin',1,NULL,0,NULL,'6a5d7d98-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (702,'ALI0000000700',2,249,'Admin lọc tên',1,NULL,0,NULL,'6a5d7e25-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (703,'ALI0000000701',2,128,'Admin nhãn',1,NULL,0,NULL,'6a5d7eb2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (704,'ALI0000000702',2,131,'Ngôn ngữ Admin',1,NULL,0,NULL,'6a5d7f3b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (705,'ALI0000000703',2,129,'Admin ngôn ngữ mục',1,NULL,0,NULL,'6a5d7fc4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (706,'ALI0000000704',2,132,'Admin ngôn ngữ tên',1,NULL,0,NULL,'6a5d804d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (707,'ALI0000000705',2,252,'Admin bố trí trường',1,NULL,0,NULL,'6a5d80da-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (708,'ALI0000000706',2,253,'Admin bố trí phần',1,NULL,0,NULL,'6a5d816b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (709,'ALI0000000707',2,255,'Admin bố trí phần tên',1,NULL,0,NULL,'6a5d81f9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (710,'ALI0000000708',2,135,'Trình đơn Admin',1,NULL,0,NULL,'6a5d8286-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (711,'ALI0000000709',2,136,'Admin mục trình đơn',1,NULL,0,NULL,'6a5d830f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (712,'ALI0000000710',2,139,'Admin đơn mục tên',1,NULL,0,NULL,'6a5d839c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (713,'ALI0000000711',2,138,'Admin menu tên',1,NULL,0,NULL,'6a5d8429-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (714,'ALI0000000712',2,151,'Admin module',1,NULL,0,NULL,'6a5d84ad-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (715,'ALI0000000713',2,155,'Admin tên mô-đun',1,NULL,0,NULL,'6a5d853b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (716,'ALI0000000714',2,220,'Phong cách Admin',1,NULL,0,NULL,'6a5d85c3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (717,'ALI0000000715',2,159,'Admin xem',1,NULL,0,NULL,'6a5d8651-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (718,'ALI0000000716',2,182,'Arg người dùng',1,NULL,0,NULL,'6a5d86d5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (719,'ALI0000000717',2,181,'Arg người dùng nhóm',1,NULL,0,NULL,'6a5d875e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (720,'ALI0000000718',2,157,'Hành động khả dụng',1,NULL,0,NULL,'6a5d87eb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (721,'ALI0000000719',2,193,'Loại cơ sở mã',1,NULL,0,NULL,'6a5d8878-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (722,'ALI0000000720',2,152,'Change log',1,NULL,0,NULL,'6a5d8906-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (723,'ALI0000000721',2,133,'Mã',1,NULL,0,NULL,'6a5d898a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (724,'ALI0000000722',2,176,'Cột',1,NULL,0,NULL,'6a5d8a0f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (725,'ALI0000000723',2,250,'Cột',1,NULL,0,NULL,'6a5d8a93-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (726,'ALI0000000724',2,261,'Điều kiện',1,NULL,0,NULL,'6a5d8b14-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (727,'ALI0000000725',2,162,'Lĩnh vực tình trạng',1,NULL,0,NULL,'6a5d8b9c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (728,'ALI0000000726',2,163,'Điều kiện giá trị',1,NULL,0,NULL,'6a5d8c2a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (729,'ALI0000000727',2,186,'Ngữ cảnh',1,NULL,0,NULL,'6a5d8cb7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (730,'ALI0000000728',2,166,'Tạo bộ lọc mới',1,NULL,0,NULL,'6a5d8d44-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (731,'ALI0000000729',2,210,'Ngày tạo',1,NULL,0,NULL,'6a5d8dcd-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (732,'ALI0000000730',2,137,'Bảng điều khiển',1,NULL,0,NULL,'6a5d8e51-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (733,'ALI0000000731',2,174,'Bảng đường dẫn tệp',1,NULL,0,NULL,'6a5d8edf-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (734,'ALI0000000732',2,173,'Bố trí bảng điều khiển',1,NULL,0,NULL,'6a5d8f67-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (735,'ALI0000000733',2,172,'Bảng tên',1,NULL,0,NULL,'6a5d8fec-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (736,'ALI0000000734',2,260,'Datasource',1,NULL,0,NULL,'6a5d9071-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (737,'ALI0000000735',2,270,'Ngày',1,NULL,0,NULL,'6a5d90f5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (738,'ALI0000000736',2,202,'Ngày sinh',1,NULL,0,NULL,'6a5d917a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (739,'ALI0000000737',2,169,'Ngày thời gian',1,NULL,0,NULL,'6a5d91fe-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (740,'ALI0000000738',2,214,'Mặc định bảng điều khiển',1,NULL,0,NULL,'6a5d9287-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (741,'ALI0000000739',2,170,'Chi tiết',1,NULL,0,NULL,'6a5d9310-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (742,'ALI0000000740',2,199,'Email',1,NULL,0,NULL,'6a5d9395-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (743,'ALI0000000741',2,145,'Kích hoạt tất cả?',1,NULL,0,NULL,'6a5d9419-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (744,'ALI0000000742',2,142,'Bật trái?',1,NULL,0,NULL,'6a5d94ab-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (745,'ALI0000000743',2,144,'Cho phép nhanh chóng?',1,NULL,0,NULL,'6a5d9538-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (746,'ALI0000000744',2,146,'Kích hoạt tính năng cài đặt?',1,NULL,0,NULL,'6a5d95c1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (747,'ALI0000000745',2,143,'Kích hoạt đầu?',1,NULL,0,NULL,'6a5d964a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (748,'ALI0000000746',2,278,'Kết thúc giai đoạn quy trình làm việc',1,NULL,0,NULL,'6a5d96d3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (749,'ALI0000000747',2,194,'Bổ sung',1,NULL,0,NULL,'6a5d9760-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (750,'ALI0000000748',2,204,'Facebook',1,NULL,0,NULL,'6a5d97e9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (751,'ALI0000000749',2,205,'Facebook oauth',1,NULL,0,NULL,'6a5d9869-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (752,'ALI0000000750',2,213,'Nữ',1,NULL,0,NULL,'6a5d98f2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (753,'ALI0000000751',2,153,'Lĩnh vực',1,NULL,0,NULL,'6a5d9976-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (754,'ALI0000000752',2,125,'Lĩnh vực acl',1,NULL,0,NULL,'6a5d99f7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (755,'ALI0000000753',2,175,'Tên trường',1,NULL,0,NULL,'6a5d9a80-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (756,'ALI0000000754',2,179,'Lĩnh vực',1,NULL,0,NULL,'6a5d9d05-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (757,'ALI0000000755',2,196,'Tên đầu tiên',1,NULL,0,NULL,'6a5d9db9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (758,'ALI0000000756',2,141,'Font awesome biểu tượng',1,NULL,0,NULL,'6a5d9e46-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (759,'ALI0000000757',2,201,'Giới tính',1,NULL,0,NULL,'6a5d9ecf-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (760,'ALI0000000758',2,150,'Đi đến hình thức đầy đủ',1,NULL,0,NULL,'6a5d9f5c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (761,'ALI0000000759',2,206,'Google',1,NULL,0,NULL,'6a5d9fe5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (762,'ALI0000000760',2,207,'Google oauth',1,NULL,0,NULL,'6a5da072-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (763,'ALI0000000761',2,215,'IP',1,NULL,0,NULL,'6a5da0fb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (764,'ALI0000000762',2,274,'Ràng buộc đối tượng deletable?',1,NULL,0,NULL,'6a5da184-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (765,'ALI0000000763',2,273,'Ràng buộc đối tượng có thể chỉnh sửa?',1,NULL,0,NULL,'6a5da20d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (766,'ALI0000000764',2,158,'Bình luận được kích hoạt?',1,NULL,0,NULL,'6a5da296-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (767,'ALI0000000765',2,251,'Mặc định?',1,NULL,0,NULL,'6a5da330-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (768,'ALI0000000766',2,203,'Email xác minh?',1,NULL,0,NULL,'6a5da3c1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (769,'ALI0000000767',2,178,'Loại trừ?',1,NULL,0,NULL,'6a5da457-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (770,'ALI0000000768',2,264,'Bắt buộc?',1,NULL,0,NULL,'6a5da4e0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (771,'ALI0000000769',2,165,'In xem?',1,NULL,0,NULL,'6a5da9c9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (772,'ALI0000000770',2,148,'Gắn dấu sao?',1,NULL,0,NULL,'6a5daa6c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (773,'ALI0000000771',2,168,'Mục',1,NULL,0,NULL,'6a5daaf5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (774,'ALI0000000772',2,130,'Nhãn',1,NULL,0,NULL,'6a5dab82-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (775,'ALI0000000773',2,197,'Last name',1,NULL,0,NULL,'6a5dac06-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (776,'ALI0000000774',2,211,'Đặt đăng nhập',1,NULL,0,NULL,'6a5dac8b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (777,'ALI0000000775',2,212,'Nam',1,NULL,0,NULL,'6a5dad21-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (778,'ALI0000000776',2,222,'Menu nhanh chóng tìm kiếm',1,NULL,0,NULL,'6a5dadaa-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (779,'ALI0000000777',2,239,'Truy cập quyền',1,NULL,0,NULL,'6a5dae32-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (780,'ALI0000000778',2,227,'Acl loại',1,NULL,0,NULL,'6a5daec0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (781,'ALI0000000779',2,282,'Bộ lọc Admin',1,NULL,0,NULL,'6a5daf48-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (782,'ALI0000000780',2,237,'Admin nhãn',1,NULL,0,NULL,'6a5dafd6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (783,'ALI0000000781',2,241,'Ngôn ngữ Admin',1,NULL,0,NULL,'6a5db05a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (784,'ALI0000000782',2,247,'Admin ngôn ngữ mục',1,NULL,0,NULL,'6a5db0e3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (785,'ALI0000000783',2,286,'Admin bố trí trường',1,NULL,0,NULL,'6a5db175-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (786,'ALI0000000784',2,289,'Admin bố trí phần',1,NULL,0,NULL,'6a5db202-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (787,'ALI0000000785',2,235,'Trình đơn Admin',1,NULL,0,NULL,'6a5db293-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (788,'ALI0000000786',2,246,'Admin mục trình đơn',1,NULL,0,NULL,'6a5db31c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (789,'ALI0000000787',2,240,'Admin module',1,NULL,0,NULL,'6a5db3ad-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (790,'ALI0000000788',2,236,'Admin xem',1,NULL,0,NULL,'6a5db436-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (791,'ALI0000000789',2,232,'Change log',1,NULL,0,NULL,'6a5db4bf-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (792,'ALI0000000790',2,230,'Bảng điều khiển',1,NULL,0,NULL,'6a5db544-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (793,'ALI0000000791',2,224,'Lĩnh vực',1,NULL,0,NULL,'6a5db5d5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (794,'ALI0000000792',2,231,'Lĩnh vực acl',1,NULL,0,NULL,'6a5db662-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (795,'ALI0000000793',2,234,'Đối tượng acl',1,NULL,0,NULL,'6a5db6eb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (796,'ALI0000000794',2,225,'Tùy chọn',1,NULL,0,NULL,'6a5db774-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (797,'ALI0000000795',2,229,'Tham số',1,NULL,0,NULL,'6a5db7f9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (798,'ALI0000000796',2,245,'Tham số nhóm',1,NULL,0,NULL,'6a5db87d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (799,'ALI0000000797',2,242,'Tham số loại',1,NULL,0,NULL,'6a5db90a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (800,'ALI0000000798',2,238,'Thùng rác',1,NULL,0,NULL,'6a5db993-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (801,'ALI0000000799',2,279,'Màn hình',1,NULL,0,NULL,'6a5dba1c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (802,'ALI0000000800',2,283,'Lĩnh vực màn hình',1,NULL,0,NULL,'6a5dbaa1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (803,'ALI0000000801',2,223,'Người dùng',1,NULL,0,NULL,'6a5dbb32-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (804,'ALI0000000802',2,233,'Nhóm người sử dụng',1,NULL,0,NULL,'6a5dbbbf-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (805,'ALI0000000803',2,226,'Người dùng đăng nhập',1,NULL,0,NULL,'6a5dbc4c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (806,'ALI0000000804',2,243,'Viên người sử dụng',1,NULL,0,NULL,'6a5dbcd5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (807,'ALI0000000805',2,244,'Tuỳ chọn người dùng',1,NULL,0,NULL,'6a5dbd67-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (808,'ALI0000000806',2,228,'Vai trò người dùng',1,NULL,0,NULL,'6a5dbdf4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (809,'ALI0000000807',2,281,'Giá trị loại',1,NULL,0,NULL,'6a5dbe85-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (810,'ALI0000000808',2,280,'Công việc',1,NULL,0,NULL,'6a5dbf0e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (811,'ALI0000000809',2,288,'Ứng dụng quy trình làm việc',1,NULL,0,NULL,'6a5dbf97-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (812,'ALI0000000810',2,284,'Quy trình làm việc đăng nhập',1,NULL,0,NULL,'6a5dc024-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (813,'ALI0000000811',2,285,'Giai đoạn quy trình làm việc',1,NULL,0,NULL,'6a5dc0a9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (814,'ALI0000000812',2,287,'Công việc chuyển tiếp',1,NULL,0,NULL,'6a5dc132-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (815,'ALI0000000813',2,121,'Tiếp theo',1,NULL,0,NULL,'6a5dc1b2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (816,'ALI0000000814',2,180,'Đối tượng',1,NULL,0,NULL,'6a5dc237-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (817,'ALI0000000815',2,126,'Đối tượng acl',1,NULL,0,NULL,'6a5dc2bf-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (818,'ALI0000000816',2,147,'Mở trong cửa sổ mới',1,NULL,0,NULL,'6a5dc34d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (819,'ALI0000000817',2,183,'Tùy chọn',1,NULL,0,NULL,'6a5dc3da-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (820,'ALI0000000818',2,184,'Name?',1,NULL,0,NULL,'6a5dc463-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (821,'ALI0000000819',2,187,'Tham số',1,NULL,0,NULL,'6a5dc4e7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (822,'ALI0000000820',2,189,'Tham số nhóm',1,NULL,0,NULL,'6a5dc56c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (823,'ALI0000000821',2,191,'Tham số nhóm tên',1,NULL,0,NULL,'6a5dc5f5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (824,'ALI0000000822',2,188,'Tên tham số',1,NULL,0,NULL,'6a5dc68a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (825,'ALI0000000823',2,190,'Tham số loại',1,NULL,0,NULL,'6a5dc713-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (826,'ALI0000000824',2,192,'Tham số loại tên',1,NULL,0,NULL,'6a5dc7a0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (827,'ALI0000000825',2,149,'Cha mẹ',1,NULL,0,NULL,'6a5dc82e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (828,'ALI0000000826',2,140,'Đường dẫn',1,NULL,0,NULL,'6a5dc8b2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (829,'ALI0000000827',2,200,'Điện thoại',1,NULL,0,NULL,'6a5dc93f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (830,'ALI0000000828',2,198,'Ảnh',1,NULL,0,NULL,'6a5dcdb5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (831,'ALI0000000829',2,254,'Vị trí',1,NULL,0,NULL,'6a5dce5c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (832,'ALI0000000830',2,156,'Tiền tố',1,NULL,0,NULL,'6a5dcedd-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (833,'ALI0000000831',2,120,'Trước',1,NULL,0,NULL,'6a5dcf65-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (834,'ALI0000000832',2,123,'Nhanh chóng tạo',1,NULL,0,NULL,'6a5dcfee-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (835,'ALI0000000833',2,118,'Ghi',1,NULL,0,NULL,'6a5dd077-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (836,'ALI0000000834',2,154,'Thùng rác',1,NULL,0,NULL,'6a5dd100-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (837,'ALI0000000835',2,161,'Màn hình',1,NULL,0,NULL,'6a5dd185-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (838,'ALI0000000836',2,258,'Lĩnh vực màn hình',1,NULL,0,NULL,'6a5dd205-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (839,'ALI0000000837',2,256,'Hiển thị tiêu đề',1,NULL,0,NULL,'6a5dd296-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (840,'ALI0000000838',2,277,'Bắt đầu giai đoạn công việc',1,NULL,0,NULL,'6a5dd328-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (841,'ALI0000000839',2,164,'Mẫu',1,NULL,0,NULL,'6a5dd3b1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (842,'ALI0000000840',2,263,'Textcol',1,NULL,0,NULL,'6a5dd431-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (843,'ALI0000000841',2,160,'Tiêu đề',1,NULL,0,NULL,'6a5dd4b6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (844,'ALI0000000842',2,177,'Chú thích',1,NULL,0,NULL,'6a5dd53a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (845,'ALI0000000843',2,276,'Màn hình chuyển tiếp',1,NULL,0,NULL,'6a5dd5bf-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (846,'ALI0000000844',2,134,'Dịch',1,NULL,0,NULL,'6a5dd650-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (847,'ALI0000000845',2,195,'Người dùng đăng nhập',1,NULL,0,NULL,'6a5dd6ea-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (848,'ALI0000000846',2,171,'Tuỳ chọn người dùng',1,NULL,0,NULL,'6a5dd7d5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (849,'ALI0000000847',2,216,'Vai trò người dùng',1,NULL,0,NULL,'6a5ddd6a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (850,'ALI0000000848',2,221,'Tên người dùng vai trò',1,NULL,0,NULL,'6a5de5e7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (851,'ALI0000000849',2,217,'Hợp lệ từ',1,NULL,0,NULL,'6a5df1ae-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (852,'ALI0000000850',2,218,'Hợp lệ cho đến khi',1,NULL,0,NULL,'6a5df262-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (853,'ALI0000000851',2,185,'Giá trị',1,NULL,0,NULL,'6a5df2e7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (854,'ALI0000000852',2,259,'Giá trị loại',1,NULL,0,NULL,'6a5df363-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (855,'ALI0000000853',2,265,'Giá trị loại tên',1,NULL,0,NULL,'6a5df3e3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (856,'ALI0000000854',2,262,'Valuecol',1,NULL,0,NULL,'6a5df463-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (857,'ALI0000000855',2,219,'Hình nền',1,NULL,0,NULL,'6a5df4df-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (858,'ALI0000000856',2,257,'Công việc',1,NULL,0,NULL,'6a5df5e8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (859,'ALI0000000857',2,267,'Ứng dụng quy trình làm việc',1,NULL,0,NULL,'6a5df67a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (860,'ALI0000000858',2,268,'Quy trình làm việc đăng nhập',1,NULL,0,NULL,'6a5df6ff-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (861,'ALI0000000859',2,266,'Quy trình làm việc tên',1,NULL,0,NULL,'6a5df77f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (862,'ALI0000000860',2,271,'Giai đoạn quy trình làm việc',1,NULL,0,NULL,'6a5df80c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (863,'ALI0000000861',2,272,'Công việc nghệ danh',1,NULL,0,NULL,'6a5df88c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (864,'ALI0000000862',2,269,'Công việc chuyển tiếp',1,NULL,0,NULL,'6a5df919-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (865,'ALI0000000863',2,275,'Quy trình làm việc chuyển đổi tên',1,NULL,0,NULL,'6a5df99a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (866,'ALI0000000864',2,208,'Yahoo',1,NULL,0,NULL,'6a5dfa1e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (867,'ALI0000000865',2,209,'Yahoo oauth',1,NULL,0,NULL,'6a5dfaa3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (868,'ALI0000000866',4,43,'访问权限',1,NULL,0,NULL,'6a5dfb23-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (869,'ALI0000000867',4,44,'访问权限 (高级)',1,NULL,0,NULL,'6a5dfbac-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (870,'ALI0000000868',4,88,'访问权限',1,NULL,0,NULL,'6a5dfc39-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (871,'ALI0000000869',4,28,'帐户',1,NULL,0,NULL,'6a5dfcbe-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (872,'ALI0000000870',4,124,'Acl 类型',1,NULL,0,NULL,'6a5dfd47-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (873,'ALI0000000871',4,127,'Acl 类型名称',1,NULL,0,NULL,'6a5dfdc7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (874,'ALI0000000872',4,167,'行动',1,NULL,0,NULL,'6a5dfe50-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (875,'ALI0000000873',4,33,'行动',1,NULL,0,NULL,'6a5dfed5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (876,'ALI0000000874',4,5,'添加',1,NULL,0,NULL,'6a5dff55-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (877,'ALI0000000875',4,119,'添加项',1,NULL,0,NULL,'6a5dffd5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (878,'ALI0000000876',4,122,'附加信息',1,NULL,0,NULL,'6a5e005a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (879,'ALI0000000877',4,106,'Admin',1,NULL,0,NULL,'6a5e00e3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (880,'ALI0000000878',4,248,'管理筛选器',1,NULL,0,NULL,'6a5e0167-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (881,'ALI0000000879',4,249,'管理筛选器名称',1,NULL,0,NULL,'6a5e01ec-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (882,'ALI0000000880',4,128,'Admin 标签',1,NULL,0,NULL,'6a5e027d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (883,'ALI0000000881',4,131,'Admin 语言',1,NULL,0,NULL,'6a5e0302-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (884,'ALI0000000882',4,129,'Admin 语言项目',1,NULL,0,NULL,'6a5e0386-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (885,'ALI0000000883',4,132,'Admin 语言名称',1,NULL,0,NULL,'6a5e040f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (886,'ALI0000000884',4,252,'Admin 布局字段',1,NULL,0,NULL,'6a5e0494-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (887,'ALI0000000885',4,253,'Admin 布局部分',1,NULL,0,NULL,'6a5e051d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (888,'ALI0000000886',4,255,'Admin 布局节名称',1,NULL,0,NULL,'6a5e059d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (889,'ALI0000000887',4,135,'管理菜单',1,NULL,0,NULL,'6a5e0626-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (890,'ALI0000000888',4,136,'管理员菜单项',1,NULL,0,NULL,'6a5e06af-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (891,'ALI0000000889',4,139,'管理员菜单项名称',1,NULL,0,NULL,'6a5e0733-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (892,'ALI0000000890',4,138,'管理员菜单名称',1,NULL,0,NULL,'6a5e07c1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (893,'ALI0000000891',4,151,'管理模块',1,NULL,0,NULL,'6a5e0845-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (894,'ALI0000000892',4,155,'管理员模块名称',1,NULL,0,NULL,'6a5e08ca-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (895,'ALI0000000893',4,220,'管理样式',1,NULL,0,NULL,'6a5e0953-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (896,'ALI0000000894',4,159,'管理视图',1,NULL,0,NULL,'6a5e09dc-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (897,'ALI0000000895',4,96,'批准',1,NULL,0,NULL,'6a5e0a64-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (898,'ALI0000000896',4,98,'也审核',1,NULL,0,NULL,'6a5e0ae5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (899,'ALI0000000897',4,95,'批准',1,NULL,0,NULL,'6a5e0b65-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (900,'ALI0000000898',4,94,'批准',1,NULL,0,NULL,'6a5e0bea-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (901,'ALI0000000899',4,182,'Arg 用户',1,NULL,0,NULL,'6a5e0c6a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (902,'ALI0000000900',4,181,'Arg 用户组',1,NULL,0,NULL,'6a5e0cea-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (903,'ALI0000000901',4,157,'可用动作',1,NULL,0,NULL,'6a5e0d77-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (904,'ALI0000000902',4,193,'基类型代码',1,NULL,0,NULL,'6a5e0dfc-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (905,'ALI0000000903',4,15,'批量编辑',1,NULL,0,NULL,'6a5e0e89-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (906,'ALI0000000904',4,13,'导入',1,NULL,0,NULL,'6a5e0f16-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (907,'ALI0000000905',4,9,'取消',1,NULL,0,NULL,'6a5e0f97-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (908,'ALI0000000906',4,82,'无法打开导入文件',1,NULL,0,NULL,'6a5e1017-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (909,'ALI0000000907',4,117,'改变',1,NULL,0,NULL,'6a5e10a0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (910,'ALI0000000908',4,152,'更改日志',1,NULL,0,NULL,'6a5e1129-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (911,'ALI0000000909',4,6,'克隆',1,NULL,0,NULL,'6a5e11ad-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (912,'ALI0000000910',4,10,'关闭',1,NULL,0,NULL,'6a5e122e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (913,'ALI0000000911',4,107,'CMS',1,NULL,0,NULL,'6a5e12b7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (914,'ALI0000000912',4,133,'代码',1,NULL,0,NULL,'6a5e1337-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (915,'ALI0000000913',4,176,'列',1,NULL,0,NULL,'6a5e13b7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (916,'ALI0000000914',4,250,'列',1,NULL,0,NULL,'6a5e1437-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (917,'ALI0000000915',4,261,'的条件',1,NULL,0,NULL,'6a5e14b8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (918,'ALI0000000916',4,162,'条件字段',1,NULL,0,NULL,'6a5e153c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (919,'ALI0000000917',4,163,'条件值',1,NULL,0,NULL,'6a5e15c5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (920,'ALI0000000918',4,116,'确认新密码',1,NULL,0,NULL,'6a5e1646-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (921,'ALI0000000919',4,26,'联系我们',1,NULL,0,NULL,'6a5e16ce-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (922,'ALI0000000920',4,186,'上下文',1,NULL,0,NULL,'6a5e1753-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (923,'ALI0000000921',4,7,'拷贝',1,NULL,0,NULL,'6a5e17d3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (924,'ALI0000000922',4,78,'的复制也',1,NULL,0,NULL,'6a5e1854-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (925,'ALI0000000923',4,166,'创建新的筛选器',1,NULL,0,NULL,'6a5e18d8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (926,'ALI0000000924',4,210,'创建日期',1,NULL,0,NULL,'6a5e1961-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (927,'ALI0000000925',4,56,'Excel 对包含数据的文件 (格式.csv)',1,NULL,0,NULL,'6a5e19e6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (928,'ALI0000000926',4,111,'的自定义版式',1,NULL,0,NULL,'6a5e1a6a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (929,'ALI0000000927',4,137,'仪表板',1,NULL,0,NULL,'6a5e1af3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (930,'ALI0000000928',4,174,'仪表板文件路径',1,NULL,0,NULL,'6a5e1b74-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (931,'ALI0000000929',4,173,'仪表板布局',1,NULL,0,NULL,'6a5e1c01-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (932,'ALI0000000930',4,172,'仪表板名称',1,NULL,0,NULL,'6a5e1c85-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (933,'ALI0000000931',4,260,'数据源',1,NULL,0,NULL,'6a5e1d0e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (934,'ALI0000000932',4,270,'日期',1,NULL,0,NULL,'6a5e1d8e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (935,'ALI0000000933',4,202,'出生日期',1,NULL,0,NULL,'6a5e1e0a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (936,'ALI0000000934',4,169,'日期时间',1,NULL,0,NULL,'6a5e1e98-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (937,'ALI0000000935',4,214,'默认仪表板',1,NULL,0,NULL,'6a5e1f1c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (938,'ALI0000000936',4,8,'删除',1,NULL,0,NULL,'6a5e1fa1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (939,'ALI0000000937',4,80,'的删除也',1,NULL,0,NULL,'6a5e2021-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (940,'ALI0000000938',4,87,'说明',1,NULL,0,NULL,'6a5e20a6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (941,'ALI0000000939',4,170,'详细信息',1,NULL,0,NULL,'6a5e24fe-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (942,'ALI0000000940',4,53,'禁用',1,NULL,0,NULL,'6a5e259c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (943,'ALI0000000941',4,55,'已禁用',1,NULL,0,NULL,'6a5e2618-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (944,'ALI0000000942',4,11,'的编辑',1,NULL,0,NULL,'6a5e269d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (945,'ALI0000000943',4,35,'编辑条目',1,NULL,0,NULL,'6a5e271d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (946,'ALI0000000944',4,199,'电子邮件',1,NULL,0,NULL,'6a5e27a6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (947,'ALI0000000945',4,52,'启用',1,NULL,0,NULL,'6a5e282f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (948,'ALI0000000946',4,145,'启用所有?',1,NULL,0,NULL,'6a5e28af-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (949,'ALI0000000947',4,142,'启用左吗?',1,NULL,0,NULL,'6a5e2938-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (950,'ALI0000000948',4,144,'启用快速吗?',1,NULL,0,NULL,'6a5e29c1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (951,'ALI0000000949',4,146,'启用设置吗?',1,NULL,0,NULL,'6a5e2a4a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (952,'ALI0000000950',4,143,'启用顶部吗?',1,NULL,0,NULL,'6a5e2ad3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (953,'ALI0000000951',4,54,'已启用',1,NULL,0,NULL,'6a5e2b57-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (954,'ALI0000000952',4,278,'结束工作流阶段',1,NULL,0,NULL,'6a5e2bdc-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (955,'ALI0000000953',4,1,'的英语',1,NULL,0,NULL,'6a5e2c69-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (956,'ALI0000000954',4,99,'这一行动不是允许核准的 %s。',1,NULL,0,NULL,'6a5e2ce9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (957,'ALI0000000955',4,14,'出口',1,NULL,0,NULL,'6a5e2d6e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (958,'ALI0000000956',4,194,'额外',1,NULL,0,NULL,'6a5e2df2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (959,'ALI0000000957',4,204,'脸谱',1,NULL,0,NULL,'6a5e2e73-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (960,'ALI0000000958',4,205,'Facebookoauth',1,NULL,0,NULL,'6a5e2ef3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (961,'ALI0000000959',4,51,'假',1,NULL,0,NULL,'6a5e2f7c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (962,'ALI0000000960',4,213,'女性',1,NULL,0,NULL,'6a5e3001-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (963,'ALI0000000961',4,153,'场',1,NULL,0,NULL,'6a5e3081-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (964,'ALI0000000962',4,125,'字段 acl',1,NULL,0,NULL,'6a5e3105-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (965,'ALI0000000963',4,175,'字段名称',1,NULL,0,NULL,'6a5e3186-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (966,'ALI0000000964',4,179,'的领域',1,NULL,0,NULL,'6a5e320f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (967,'ALI0000000965',4,196,'名字',1,NULL,0,NULL,'6a5e3293-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (968,'ALI0000000966',4,141,'字体真棒图标',1,NULL,0,NULL,'6a5e3314-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (969,'ALI0000000967',4,114,'强制更改密码',1,NULL,0,NULL,'6a5e339c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (970,'ALI0000000968',4,24,'您忘记密码了吗?',1,NULL,0,NULL,'6a5e3425-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (971,'ALI0000000969',4,201,'性别',1,NULL,0,NULL,'6a5e34ae-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (972,'ALI0000000970',4,150,'去完整形式',1,NULL,0,NULL,'6a5e3533-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (973,'ALI0000000971',4,206,'谷歌',1,NULL,0,NULL,'6a5e35b7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (974,'ALI0000000972',4,207,'谷歌 oauth',1,NULL,0,NULL,'6a5e3638-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (975,'ALI0000000973',4,97,'准则批准制度',1,NULL,0,NULL,'6a5e36c5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (976,'ALI0000000974',4,77,'你可以复制也此 %s: 下列相关的数据',1,NULL,0,NULL,'6a5e3749-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (977,'ALI0000000975',4,79,'如果你删除这 %s，相关的数据 (如果有) 将成为垃圾。请检查仔细之前之前删除，或者您可以 cho',1,NULL,0,NULL,'6a5e37d7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (978,'ALI0000000976',4,57,'<p>您可以导入或更新 %s 的数据，通过 Excel 格式的文件 (.csv)。<\\/p><p>供您参考有关导入的模板，y',1,NULL,0,NULL,'6a5e3868-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (979,'ALI0000000977',4,20,'你好',1,NULL,0,NULL,'6a5e38f1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (980,'ALI0000000978',4,27,'帮助',1,NULL,0,NULL,'6a5e3971-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (981,'ALI0000000979',4,30,'ID',1,NULL,0,NULL,'6a5e39f6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (982,'ALI0000000980',4,86,'形象',1,NULL,0,NULL,'6a5e3a7a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (983,'ALI0000000981',4,12,'导入',1,NULL,0,NULL,'6a5e3afb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (984,'ALI0000000982',4,83,'无效的导入文件格式',1,NULL,0,NULL,'6a5e3b7f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (985,'ALI0000000983',4,215,'IP',1,NULL,0,NULL,'6a5e3c08-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (986,'ALI0000000984',4,274,'绑定对象删除?',1,NULL,0,NULL,'6a5e3c8d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (987,'ALI0000000985',4,273,'绑定对象可编辑吗?',1,NULL,0,NULL,'6a5e3d16-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (988,'ALI0000000986',4,158,'启用评论?',1,NULL,0,NULL,'6a5e3d9f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (989,'ALI0000000987',4,251,'默认吗?',1,NULL,0,NULL,'6a5e3e27-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (990,'ALI0000000988',4,203,'电子邮件验证了吗?',1,NULL,0,NULL,'6a5e3eac-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (991,'ALI0000000989',4,38,'是否启用?',1,NULL,0,NULL,'6a5e3f39-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (992,'ALI0000000990',4,178,'排除在外?',1,NULL,0,NULL,'6a5e439e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (993,'ALI0000000991',4,264,'的强制性?',1,NULL,0,NULL,'6a5e443c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (994,'ALI0000000992',4,165,'打印视图吗?',1,NULL,0,NULL,'6a5e44c9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (995,'ALI0000000993',4,148,'主演?',1,NULL,0,NULL,'6a5e4552-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (996,'ALI0000000994',4,85,'是可见吗?',1,NULL,0,NULL,'6a5e45d7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (997,'ALI0000000995',4,168,'项目',1,NULL,0,NULL,'6a5e465c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (998,'ALI0000000996',4,25,'保持我的登录状态',1,NULL,0,NULL,'6a5e46e0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (999,'ALI0000000997',4,130,'的标签',1,NULL,0,NULL,'6a5e4772-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1000,'ALI0000000998',4,197,'姓氏',1,NULL,0,NULL,'6a5e47f6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1001,'ALI0000000999',4,211,'最新登录',1,NULL,0,NULL,'6a5e487b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1002,'ALI0000001000',4,110,'布局',1,NULL,0,NULL,'6a5e4915-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1003,'ALI0000001001',4,41,'登录',1,NULL,0,NULL,'6a5e49ef-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1004,'ALI0000001002',4,212,'男',1,NULL,0,NULL,'6a5e4aaf-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1005,'ALI0000001003',4,39,'菜单',1,NULL,0,NULL,'6a5e4b67-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1006,'ALI0000001004',4,222,'菜单快速搜索',1,NULL,0,NULL,'6a5e4c1b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1007,'ALI0000001005',4,239,'访问权限',1,NULL,0,NULL,'6a5e4d71-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1008,'ALI0000001006',4,227,'Acl 类型',1,NULL,0,NULL,'6a5e4e50-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1009,'ALI0000001007',4,282,'管理筛选器',1,NULL,0,NULL,'6a5e4f1d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1010,'ALI0000001008',4,237,'Admin 标签',1,NULL,0,NULL,'6a5e4fe2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1011,'ALI0000001009',4,241,'Admin 语言',1,NULL,0,NULL,'6a5e506a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1012,'ALI0000001010',4,247,'Admin 语言项目',1,NULL,0,NULL,'6a5e50f3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1013,'ALI0000001011',4,286,'Admin 布局字段',1,NULL,0,NULL,'6a5e5178-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1014,'ALI0000001012',4,289,'Admin 布局部分',1,NULL,0,NULL,'6a5e5205-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1015,'ALI0000001013',4,235,'管理菜单',1,NULL,0,NULL,'6a5e528a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1016,'ALI0000001014',4,246,'管理员菜单项',1,NULL,0,NULL,'6a5e530e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1017,'ALI0000001015',4,240,'管理模块',1,NULL,0,NULL,'6a5e5393-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1018,'ALI0000001016',4,236,'管理视图',1,NULL,0,NULL,'6a5e5417-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1019,'ALI0000001017',4,232,'更改日志',1,NULL,0,NULL,'6a5e549c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1020,'ALI0000001018',4,230,'仪表板',1,NULL,0,NULL,'6a5e5525-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1021,'ALI0000001019',4,224,'场',1,NULL,0,NULL,'6a5e55ae-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1022,'ALI0000001020',4,231,'字段 acl',1,NULL,0,NULL,'6a5e5632-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1023,'ALI0000001021',4,234,'对象 acl',1,NULL,0,NULL,'6a5e56b7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1024,'ALI0000001022',4,225,'选项',1,NULL,0,NULL,'6a5e573c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1025,'ALI0000001023',4,229,'参数',1,NULL,0,NULL,'6a5e57c0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1026,'ALI0000001024',4,245,'参数组',1,NULL,0,NULL,'6a5e5845-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1027,'ALI0000001025',4,242,'参数类型',1,NULL,0,NULL,'6a5e58c5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1028,'ALI0000001026',4,238,'回收站',1,NULL,0,NULL,'6a5e594e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1029,'ALI0000001027',4,279,'屏幕',1,NULL,0,NULL,'6a5e59ca-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1030,'ALI0000001028',4,283,'屏幕字段',1,NULL,0,NULL,'6a5e5a4f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1031,'ALI0000001029',4,223,'用户',1,NULL,0,NULL,'6a5e5ad3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1032,'ALI0000001030',4,233,'用户组',1,NULL,0,NULL,'6a5e5b54-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1033,'ALI0000001031',4,226,'用户登录',1,NULL,0,NULL,'6a5e5bdc-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1034,'ALI0000001032',4,243,'用户成员资格',1,NULL,0,NULL,'6a5e5c65-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1035,'ALI0000001033',4,244,'用户首选项',1,NULL,0,NULL,'6a5e5cf2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1036,'ALI0000001034',4,228,'用户角色',1,NULL,0,NULL,'6a5e5d7b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1037,'ALI0000001035',4,281,'值类型',1,NULL,0,NULL,'6a5e5e04-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1038,'ALI0000001036',4,280,'的工作流',1,NULL,0,NULL,'6a5e5e89-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1039,'ALI0000001037',4,288,'工作流应用程序',1,NULL,0,NULL,'6a5e5f0d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1040,'ALI0000001038',4,284,'工作流日志',1,NULL,0,NULL,'6a5e5f9f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1041,'ALI0000001039',4,285,'工作流阶段',1,NULL,0,NULL,'6a5e6023-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1042,'ALI0000001040',4,287,'工作流过渡',1,NULL,0,NULL,'6a5e60a8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1043,'ALI0000001041',4,32,'模块',1,NULL,0,NULL,'6a5e6131-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1044,'ALI0000001042',4,112,'处理程序',1,NULL,0,NULL,'6a5e61b5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1045,'ALI0000001043',4,76,'欢迎来到 Apps4Clouds!',1,NULL,0,NULL,'6a5e62e9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1046,'ALI0000001044',4,34,'名称',1,NULL,0,NULL,'6a5e6383-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1047,'ALI0000001045',4,4,'新',1,NULL,0,NULL,'6a5e6404-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1048,'ALI0000001046',4,115,'新密码',1,NULL,0,NULL,'6a5e6484-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1049,'ALI0000001047',4,121,'下一步',1,NULL,0,NULL,'6a5e6509-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1050,'ALI0000001048',4,49,'不',1,NULL,0,NULL,'6a5e6589-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1051,'ALI0000001049',4,84,'没有有效的列在导入文件',1,NULL,0,NULL,'6a5e6609-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1052,'ALI0000001050',4,93,'注意',1,NULL,0,NULL,'6a5e668e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1053,'ALI0000001051',4,180,'对象',1,NULL,0,NULL,'6a5e6712-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1054,'ALI0000001052',4,126,'对象 acl',1,NULL,0,NULL,'6a5e6793-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1055,'ALI0000001053',4,147,'为在新窗口中打开',1,NULL,0,NULL,'6a5e6817-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1056,'ALI0000001054',4,183,'选项',1,NULL,0,NULL,'6a5e68a0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1057,'ALI0000001055',4,184,'名字吗?',1,NULL,0,NULL,'6a5e6921-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1058,'ALI0000001056',4,37,'订购',1,NULL,0,NULL,'6a5e69a5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1059,'ALI0000001057',4,109,'布局',1,NULL,0,NULL,'6a5e6a2a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1060,'ALI0000001058',4,108,'模板',1,NULL,0,NULL,'6a5e6aae-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1061,'ALI0000001059',4,105,'终结',1,NULL,0,NULL,'6a5e6b33-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1062,'ALI0000001060',4,104,'下一步',1,NULL,0,NULL,'6a5e6bb8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1063,'ALI0000001061',4,103,'上一页',1,NULL,0,NULL,'6a5e6c3c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1064,'ALI0000001062',4,102,'开始',1,NULL,0,NULL,'6a5e6cc1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1065,'ALI0000001063',4,101,'所有',1,NULL,0,NULL,'6a5e6d41-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1066,'ALI0000001064',4,187,'参数',1,NULL,0,NULL,'6a5e6dc1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1067,'ALI0000001065',4,189,'参数组',1,NULL,0,NULL,'6a5e6e42-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1068,'ALI0000001066',4,191,'参数组名称 \'',1,NULL,0,NULL,'6a5e6f0b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1069,'ALI0000001067',4,188,'参数名称',1,NULL,0,NULL,'6a5e6fa9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1070,'ALI0000001068',4,190,'参数类型',1,NULL,0,NULL,'6a5e7047-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1071,'ALI0000001069',4,192,'参数类型名称',1,NULL,0,NULL,'6a5e70d0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1072,'ALI0000001070',4,149,'父',1,NULL,0,NULL,'6a5e715d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1073,'ALI0000001071',4,23,'密码',1,NULL,0,NULL,'6a5e71e2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1074,'ALI0000001072',4,140,'路径',1,NULL,0,NULL,'6a5e7266-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1075,'ALI0000001073',4,200,'电话',1,NULL,0,NULL,'6a5e72eb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1076,'ALI0000001074',4,198,'照片',1,NULL,0,NULL,'6a5e736b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1077,'ALI0000001075',4,254,'位置',1,NULL,0,NULL,'6a5e73f4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1078,'ALI0000001076',4,156,'前缀',1,NULL,0,NULL,'6a5e747d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1079,'ALI0000001077',4,120,'上一页',1,NULL,0,NULL,'6a5e74fd-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1080,'ALI0000001078',4,100,'打印',1,NULL,0,NULL,'6a5e7582-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1081,'ALI0000001079',4,123,'快速创建',1,NULL,0,NULL,'6a5e760b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1082,'ALI0000001080',4,118,'记录',1,NULL,0,NULL,'6a5e7698-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1083,'ALI0000001081',4,154,'回收站',1,NULL,0,NULL,'6a5e771d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1084,'ALI0000001082',4,17,'重置',1,NULL,0,NULL,'6a5e779d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1085,'ALI0000001083',4,18,'保存',1,NULL,0,NULL,'6a5e7826-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1086,'ALI0000001084',4,161,'屏幕',1,NULL,0,NULL,'6a5e78aa-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1087,'ALI0000001085',4,258,'屏幕字段',1,NULL,0,NULL,'6a5e792f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1088,'ALI0000001086',4,16,'搜索',1,NULL,0,NULL,'6a5e79b8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1089,'ALI0000001087',4,40,'安装程序',1,NULL,0,NULL,'6a5e7a38-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1090,'ALI0000001088',4,256,'显示标题',1,NULL,0,NULL,'6a5e7ac5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1091,'ALI0000001089',4,21,'签到',1,NULL,0,NULL,'6a5e7b4e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1092,'ALI0000001090',4,29,'注销',1,NULL,0,NULL,'6a5e7bd7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1093,'ALI0000001091',4,277,'启动工作流阶段',1,NULL,0,NULL,'6a5e7c60-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1094,'ALI0000001092',4,36,'地位',1,NULL,0,NULL,'6a5e7cf1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1095,'ALI0000001093',4,113,'同步',1,NULL,0,NULL,'6a5e7d76-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1096,'ALI0000001094',4,164,'模板',1,NULL,0,NULL,'6a5e7dff-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1097,'ALI0000001095',4,263,'Textcol',1,NULL,0,NULL,'6a5e7e83-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1098,'ALI0000001096',4,160,'标题',1,NULL,0,NULL,'6a5e7f08-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1099,'ALI0000001097',4,177,'工具提示',1,NULL,0,NULL,'6a5e7f8d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1100,'ALI0000001098',4,3,'共有',1,NULL,0,NULL,'6a5e8016-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1101,'ALI0000001099',4,276,'过渡屏幕',1,NULL,0,NULL,'6a5e856a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1102,'ALI0000001100',4,134,'翻译',1,NULL,0,NULL,'6a5e8611-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1103,'ALI0000001101',4,50,'True',1,NULL,0,NULL,'6a5e8691-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1104,'ALI0000001102',4,45,'用户',1,NULL,0,NULL,'6a5e8716-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1105,'ALI0000001103',4,31,'用户组',1,NULL,0,NULL,'6a5e879f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1106,'ALI0000001104',4,91,'用户组',1,NULL,0,NULL,'6a5e8823-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1107,'ALI0000001105',4,92,'用户组名称 \'',1,NULL,0,NULL,'6a5e88a3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1108,'ALI0000001106',4,89,'用户',1,NULL,0,NULL,'6a5e8931-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1109,'ALI0000001107',4,195,'用户登录',1,NULL,0,NULL,'6a5e89b5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1110,'ALI0000001108',4,42,'用户成员资格',1,NULL,0,NULL,'6a5e8a3e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1111,'ALI0000001109',4,90,'用户成员资格',1,NULL,0,NULL,'6a5e8acb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1112,'ALI0000001110',4,22,'用户名称',1,NULL,0,NULL,'6a5e8b54-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1113,'ALI0000001111',4,171,'用户首选项',1,NULL,0,NULL,'6a5e8be6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1114,'ALI0000001112',4,216,'用户角色',1,NULL,0,NULL,'6a5e8c6e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1115,'ALI0000001113',4,221,'用户角色名称',1,NULL,0,NULL,'6a5e8cf7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1116,'ALI0000001114',4,46,'用户',1,NULL,0,NULL,'6a5e8d84-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1117,'ALI0000001115',4,217,'有效期自',1,NULL,0,NULL,'6a5e8e05-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1118,'ALI0000001116',4,218,'有效期至',1,NULL,0,NULL,'6a5e8e96-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1119,'ALI0000001117',4,59,'%s 已存在',1,NULL,0,NULL,'6a5e8f1f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1120,'ALI0000001118',4,61,'%s 只接受字母字符，数字，下划线字符 (_)，连字符 (-) 字符或点字符 (.)',1,NULL,0,NULL,'6a5e8fa8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1121,'ALI0000001119',4,67,'%s 应该是一个有效的日期',1,NULL,0,NULL,'6a5e903e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1122,'ALI0000001120',4,72,'%s 应该是一个有效的电子邮件地址',1,NULL,0,NULL,'6a5e90cb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1123,'ALI0000001121',4,70,'%s 应该为一个有效的传真号码 (允许只有数字和空格)',1,NULL,0,NULL,'6a5e9161-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1124,'ALI0000001122',4,74,'%s 应包含有效的值',1,NULL,0,NULL,'6a5e91ee-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1125,'ALI0000001123',4,68,'%s 应该是有效的图像',1,NULL,0,NULL,'6a5e927b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1126,'ALI0000001124',4,64,'%s 不应超过 %s 个字符',1,NULL,0,NULL,'6a5e9308-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1127,'ALI0000001125',4,62,'%s 应该数最大值为 %s',1,NULL,0,NULL,'6a5e938d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1128,'ALI0000001126',4,65,'至少应有 %s%s 个字符',1,NULL,0,NULL,'6a5e941a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1129,'ALI0000001127',4,63,'%s 应该数最小值为 %s',1,NULL,0,NULL,'6a5e94a7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1130,'ALI0000001128',4,58,'%s 不应为空',1,NULL,0,NULL,'6a5e9538-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1131,'ALI0000001129',4,60,'%s 应该是很多',1,NULL,0,NULL,'6a5e95c5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1132,'ALI0000001130',4,71,'%s 只接受字母字符、 数字、 下划线字符 (_)，连字符 (-) 或短划线字符 (\\/)',1,NULL,0,NULL,'6a5e964e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1133,'ALI0000001131',4,73,'%s 应该是有效的密码',1,NULL,0,NULL,'6a5e96e0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1134,'ALI0000001132',4,69,'%s 应该为一个有效的电话号码 (允许只有数字和空格)',1,NULL,0,NULL,'6a5e9769-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1135,'ALI0000001133',4,66,'%s 应该是一个有效的 URL',1,NULL,0,NULL,'6a5e97f6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1136,'ALI0000001134',4,185,'价值',1,NULL,0,NULL,'6a5e9876-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1137,'ALI0000001135',4,259,'值类型',1,NULL,0,NULL,'6a5e98ff-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1138,'ALI0000001136',4,265,'值类型名称',1,NULL,0,NULL,'6a5e997f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1139,'ALI0000001137',4,262,'Valuecol',1,NULL,0,NULL,'6a5e9a0c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1140,'ALI0000001138',4,2,'Tiếng 越',1,NULL,0,NULL,'6a5e9a91-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1141,'ALI0000001139',4,19,'视图',1,NULL,0,NULL,'6a5e9b1a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1142,'ALI0000001140',4,81,'也查看其他 %s 项目:',1,NULL,0,NULL,'6a5e9ba3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1143,'ALI0000001141',4,219,'墙纸',1,NULL,0,NULL,'6a5e9c30-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1144,'ALI0000001142',4,75,'的欢迎',1,NULL,0,NULL,'6a5e9cb4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1145,'ALI0000001143',4,257,'工作流',1,NULL,0,NULL,'6a5e9d39-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1146,'ALI0000001144',4,267,'工作流应用程序',1,NULL,0,NULL,'6a5e9db9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1147,'ALI0000001145',4,268,'工作流日志',1,NULL,0,NULL,'6a5e9e4f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1148,'ALI0000001146',4,266,'工作流名称',1,NULL,0,NULL,'6a5e9ed8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1149,'ALI0000001147',4,271,'工作流阶段',1,NULL,0,NULL,'6a5e9f5d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1150,'ALI0000001148',4,272,'的工作流阶段名称',1,NULL,0,NULL,'6a5ea497-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1151,'ALI0000001149',4,269,'工作流过渡',1,NULL,0,NULL,'6a5ea565-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1152,'ALI0000001150',4,275,'工作流过渡名称',1,NULL,0,NULL,'6a5ea5f2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1153,'ALI0000001151',4,208,'雅虎',1,NULL,0,NULL,'6a5ea683-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1154,'ALI0000001152',4,209,'雅虎 oauth',1,NULL,0,NULL,'6a5ea70c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1155,'ALI0000001153',4,48,'是',1,NULL,0,NULL,'6a5ea79e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1156,'ALI0000001154',4,47,'你不当前登录的是',1,NULL,0,NULL,'6a5ea826-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1157,'ALI0000001155',1,334,'Admin sequence',1,NULL,0,NULL,'7fdf5f22-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1158,'ALI0000001156',1,336,'Current value',1,NULL,0,NULL,'7fdf61ac-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1159,'ALI0000001157',1,338,'Admin sequence',1,NULL,0,NULL,'7fdf625f-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1160,'ALI0000001158',1,335,'Sequence format',1,NULL,0,NULL,'7fdf62ed-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1161,'ALI0000001159',1,337,'Sequence step',1,NULL,0,NULL,'7fdf637a-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1162,'ALI0000001160',3,334,'Séquence Admin',1,NULL,0,NULL,'7fdf6403-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1163,'ALI0000001161',3,336,'Valeur actuelle',1,NULL,0,NULL,'7fdf6490-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1165,'ALI0000001162',3,338,'Séquence Admin',1,NULL,0,NULL,'7fdf6519-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1167,'ALI0000001163',3,335,'Format de séquence',1,NULL,0,NULL,'7fdf65a1-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1168,'ALI0000001164',3,337,'Étape de la séquence',1,NULL,0,NULL,'7fdf662a-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1169,'ALI0000001165',2,334,'Quản trị chuỗi',1,NULL,0,NULL,'7fdf66b8-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1170,'ALI0000001166',2,336,'Giá trị hiện tại',1,NULL,0,NULL,'7fdf6740-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1171,'ALI0000001167',2,338,'Quản trị chuỗi',1,NULL,0,NULL,'7fdf67c9-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1172,'ALI0000001168',2,335,'Định dạng chuỗi',1,NULL,0,NULL,'7fdf6852-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1173,'ALI0000001169',2,337,'Chuỗi bước',1,NULL,0,NULL,'7fdf68df-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1174,'ALI0000001170',4,334,'管理序列',1,NULL,0,NULL,'7fdf6968-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1175,'ALI0000001171',4,336,'当前值',1,NULL,0,NULL,'7fdf6e67-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1176,'ALI0000001172',4,338,'管理序列',1,NULL,0,NULL,'7fdf6f1f-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1177,'ALI0000001173',4,335,'序列格式',1,NULL,0,NULL,'7fdf7017-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1178,'ALI0000001174',4,337,'序列的一步',1,NULL,0,NULL,'7fdf712d-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1183,'ALI0000001179',1,998,'Create an account now',1,NULL,0,NULL,'29b8fb41-1a22-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1184,'ALI0000001180',1,997,'Forgot password',1,NULL,0,NULL,'29b8fd75-1a22-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1185,'ALI0000001181',3,998,'Créer un compte maintenant',1,NULL,0,NULL,'29b8fe18-1a22-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1186,'ALI0000001182',3,997,'Mot de passe oublié',1,NULL,0,NULL,'29b8feb6-1a22-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1189,'ALI0000001183',2,998,'Tạo một tài khoản ngay bây giờ',1,NULL,0,NULL,'29b8ff3b-1a22-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1190,'ALI0000001184',2,997,'Quên mật khẩu',1,NULL,0,NULL,'29b8ffbb-1a22-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1191,'ALI0000001185',4,998,'现在创建一个帐户',1,NULL,0,NULL,'29b9003b-1a22-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1192,'ALI0000001186',4,997,'忘了密码',1,NULL,0,NULL,'29b900b8-1a22-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1209,'ALI0000001203',1,1223,'Authentication',1,NULL,0,NULL,'ebd288fe-560c-4e87-a5df-16b8d3623148');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1210,'ALI0000001204',1,1224,'Sign in',1,NULL,0,NULL,'0fdaad45-9b6a-4597-a435-e8f0fe9c6686');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1211,'ALI0000001205',1,1225,'Username',1,NULL,0,NULL,'9e86c0e0-c45d-4d9f-ace2-f63128fe45fe');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1212,'ALI0000001206',1,1226,'Username or Email',1,NULL,0,NULL,'1621fbb6-6254-48e8-8f73-312ec50fb334');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1213,'ALI0000001207',1,1227,'Sign in with Facebook',1,NULL,0,NULL,'3ccb249f-d3c2-4fc9-8a58-7bb4b61e92aa');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1214,'ALI0000001208',1,1228,'Sign in with Yahoo',1,NULL,0,NULL,'2621f8ed-b42b-478b-a329-7a973cd40671');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1215,'ALI0000001209',3,1223,'Authentification',1,NULL,0,NULL,'32cb1e9a-1a4a-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1218,'ALI0000001210',3,1224,'Sign in',1,NULL,0,NULL,'32cb214a-1a4a-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1219,'ALI0000001211',3,1227,'Connectez-vous avec Facebook',1,NULL,0,NULL,'32cb2218-1a4a-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1220,'ALI0000001212',3,1228,'Connectez-vous avec Yahoo',1,NULL,0,NULL,'32cb22a1-1a4a-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1221,'ALI0000001213',3,1225,'Username',1,NULL,0,NULL,'32cb2321-1a4a-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1222,'ALI0000001214',3,1226,'Nom d\'utilisateur ou E-mail',1,NULL,0,NULL,'32cb23a5-1a4a-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1223,'ALI0000001215',2,1223,'Xác thực',1,NULL,0,NULL,'32cb242a-1a4a-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1224,'ALI0000001216',2,1224,'Đăng nhập',1,NULL,0,NULL,'32cb24f7-1a4a-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1225,'ALI0000001217',2,1227,'Đăng nhập với Facebook',1,NULL,0,NULL,'32cb258d-1a4a-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1226,'ALI0000001218',2,1228,'Đăng nhập với Yahoo',1,NULL,0,NULL,'32cb2612-1a4a-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1227,'ALI0000001219',2,1225,'Tên người dùng',1,NULL,0,NULL,'32cb268e-1a4a-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1228,'ALI0000001220',2,1226,'Tên người dùng hoặc Email',1,NULL,0,NULL,'32cb270a-1a4a-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1229,'ALI0000001221',4,1223,'身份验证',1,NULL,0,NULL,'32cb2786-1a4a-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1230,'ALI0000001222',4,1224,'签到',1,NULL,0,NULL,'32cb2806-1a4a-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1231,'ALI0000001223',4,1227,'登录 Facebook',1,NULL,0,NULL,'32cb288f-1a4a-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1232,'ALI0000001224',4,1228,'登录雅虎',1,NULL,0,NULL,'32cb290b-1a4a-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1233,'ALI0000001225',4,1225,'用户名',1,NULL,0,NULL,'32cb2987-1a4a-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1234,'ALI0000001226',4,1226,'用户名或电子邮件',1,NULL,0,NULL,'32cb2a0c-1a4a-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1237,'ALI0000001227',1,1677,'Admin',1,NULL,0,NULL,'d7ccaaad-ec22-46f2-98bb-a38b193233d5');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1238,'ALI0000001228',1,1678,'Options',1,NULL,0,NULL,'dd56ee1f-8a46-4dae-be97-d39c2220de6f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1239,'ALI0000001229',1,1679,'Parameters',1,NULL,0,NULL,'f40da589-2e24-406d-a0d5-cc378e776fc4');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1240,'ALI0000001230',3,1677,'Admin',1,NULL,0,NULL,'e1a97859-1a4b-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1243,'ALI0000001231',3,1678,'Options',1,NULL,0,NULL,'e1a97b1f-1a4b-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1244,'ALI0000001232',3,1679,'Paramètres',1,NULL,0,NULL,'e1a97bce-1a4b-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1245,'ALI0000001233',2,1677,'Admin',1,NULL,0,NULL,'e1a97c75-1a4b-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1246,'ALI0000001234',2,1678,'Tùy chọn',1,NULL,0,NULL,'e1a97d0b-1a4b-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1247,'ALI0000001235',2,1679,'Tham số',1,NULL,0,NULL,'e1a97d9c-1a4b-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1248,'ALI0000001236',4,1677,'Admin',1,NULL,0,NULL,'e1a97e6a-1a4b-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1249,'ALI0000001237',4,1678,'选项',1,NULL,0,NULL,'e1a97eff-1a4b-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1250,'ALI0000001238',4,1679,'参数',1,NULL,0,NULL,'e1a97f99-1a4b-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1251,'ALI0000001239',1,1904,'Quick search',1,NULL,0,NULL,'929fa2fa-cb0b-4259-80c1-ec0ab2ab8af1');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1254,'ALI0000001240',3,1904,'Recherche rapide',1,NULL,0,NULL,'1d36439f-1a51-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1255,'ALI0000001241',2,1904,'Tìm nhanh',1,NULL,0,NULL,'1d364744-1a51-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1256,'ALI0000001242',4,1904,'快速搜索',1,NULL,0,NULL,'1d364884-1a51-11e5-90ba-cc52af77857f');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1257,'ALI0000001243',1,2129,'Users',1,NULL,0,NULL,'c9b614fc-b959-477e-8b5e-2c464a015a99');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1258,'ALI0000001244',1,2130,'Admin Languages',1,NULL,0,NULL,'154b55c9-c439-42cb-bd30-0e66c0498d15');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1259,'ALI0000001245',1,2131,'Admin Menu Items',1,NULL,0,NULL,'9d72efb7-0e0a-4909-b161-e54c4e8db6d3');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1260,'ALI0000001246',1,2132,'Add More',1,NULL,0,NULL,'02c5344d-acb8-4648-b865-a6dd59da6335');
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1261,NULL,3,2132,'Rajouter',NULL,NULL,NULL,NULL,NULL);
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1262,NULL,3,2130,'Admin',NULL,NULL,NULL,NULL,NULL);
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1263,NULL,3,2131,'Admin Menu Items',NULL,NULL,NULL,NULL,NULL);
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1266,NULL,3,2129,'Utilisateurs',NULL,NULL,NULL,NULL,NULL);
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1267,NULL,2,2132,'Thêm nhiều hơn nữa',NULL,NULL,NULL,NULL,NULL);
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1268,NULL,2,2130,'Admin ngôn ngữ',NULL,NULL,NULL,NULL,NULL);
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1269,NULL,2,2131,'Mục trình đơn Admin',NULL,NULL,NULL,NULL,NULL);
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1270,NULL,2,2129,'Người dùng',NULL,NULL,NULL,NULL,NULL);
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1271,NULL,4,2132,'添加更多',NULL,NULL,NULL,NULL,NULL);
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1272,NULL,4,2130,'Admin 语言',NULL,NULL,NULL,NULL,NULL);
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1273,NULL,4,2131,'管理员菜单项',NULL,NULL,NULL,NULL,NULL);
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1274,NULL,4,2129,'用户',NULL,NULL,NULL,NULL,NULL);
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1277,NULL,3,168,'',NULL,NULL,NULL,NULL,NULL);
insert  into `ADMIN_LANGUAGE_ITEM`(`ID`,`REFID`,`ID_ADMIN_LANGUAGE`,`ID_ADMIN_LABEL`,`TRANSLATION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1278,NULL,3,126,'',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `ADMIN_LAYOUT_FIELD` */

DROP TABLE IF EXISTS `ADMIN_LAYOUT_FIELD`;

CREATE TABLE `ADMIN_LAYOUT_FIELD` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_ADMIN_LAYOUT_SECTION` int(11) DEFAULT NULL,
  `COLUMN` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POSITION` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORDERING` tinyint(2) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UDID` int(11) DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE` (`MODULE`,`COLUMN`)
) ENGINE=InnoDB AUTO_INCREMENT=1823 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ADMIN_LAYOUT_FIELD` */

insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (1,'ALF0000000001','user',1,'FIRST_NAME','left',2,1,NULL,NULL,0,'22ecacf1-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (2,'ALF0000000002','user',1,'LAST_NAME','left',3,1,NULL,NULL,0,'22ecaf2e-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (3,'ALF0000000003','user',1,'PHOTO','left',4,1,NULL,NULL,0,'22ecb000-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (4,'ALF0000000004','user',1,'EMAIL','left',5,1,NULL,NULL,0,'22ecb0a6-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (5,'ALF0000000005','user',1,'LOGIN','left',6,1,NULL,NULL,0,'22ecb149-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (6,'ALF0000000006','user',1,'PASSWORD','left',7,1,NULL,NULL,0,'22ecb1e7-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (7,'ALF0000000007','user',1,'PHONE','left',8,1,NULL,NULL,0,'22ecb286-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (8,'ALF0000000008','user',1,'GENDER','left',9,1,NULL,NULL,0,'22ecb31f-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (9,'ALF0000000009','user',1,'DATE_OF_BIRTH','left',10,1,NULL,NULL,0,'22ecb3b9-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (10,'ALF0000000010','user',1,'FORCE_PASSWORD_CHANGE','left',11,1,NULL,NULL,0,'22ecb43e-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (11,'ALF0000000011','user',1,'IS_EMAIL_VERIFIED','left',12,1,NULL,NULL,0,'22ecb934-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (12,'ALF0000000012','user',1,'FACEBOOK_ID','left',13,1,NULL,NULL,0,'22ecb9c6-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (13,'ALF0000000013','user',1,'FACEBOOK_OAUTH_ID','left',14,1,NULL,NULL,0,'22ecba39-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (14,'ALF0000000014','user',1,'GOOGLE_ID','left',15,1,NULL,NULL,0,'22ecbaad-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (15,'ALF0000000015','user',1,'GOOGLE_OAUTH_ID','left',16,1,NULL,NULL,0,'22ecbb25-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (16,'ALF0000000016','user',1,'YAHOO_ID','left',17,1,NULL,NULL,0,'22ecbb94-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (17,'ALF0000000017','user',1,'YAHOO_OAUTH_ID','left',18,1,NULL,NULL,0,'22ecbc03-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (18,'ALF0000000018','user',1,'IS_ENABLED','left',19,1,NULL,NULL,0,'22ecbc76-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (19,'ALF0000000019','user',1,'CREATION_DATE','left',20,1,NULL,NULL,0,'22ecbcea-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (20,'ALF0000000020','user',1,'LATEST_LOGIN','left',21,1,NULL,NULL,0,'22ecbd62-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (21,'ALF0000000021','field',2,'NAME','left',2,1,NULL,NULL,0,'22ecbdd5-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (22,'ALF0000000022','field',2,'MODULE','left',3,1,NULL,NULL,0,'22ecbe40-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (23,'ALF0000000023','field',2,'COLUMN','left',4,1,NULL,NULL,0,'22ecbeab-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (24,'ALF0000000024','field',2,'TOOLTIP','left',5,1,NULL,NULL,0,'22ecbf1a-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (25,'ALF0000000025','field',2,'IS_EXCLUDED','left',6,1,NULL,NULL,0,'22ecbf85-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (26,'ALF0000000026','option',3,'NAME','left',2,1,NULL,NULL,0,'22ecbff9-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (27,'ALF0000000027','option',3,'CODE','left',3,1,NULL,NULL,0,'22ecc068-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (28,'ALF0000000028','option',3,'VALUE','left',4,1,NULL,NULL,0,'22ecc0d3-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (29,'ALF0000000029','option',3,'CONTEXT','left',5,1,NULL,NULL,0,'22ecc13e-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (30,'ALF0000000030','userlog',4,'ID_USER','left',2,1,NULL,NULL,0,'22ecc1b6-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (31,'ALF0000000031','userlog',4,'DATE_TIME','left',3,1,NULL,NULL,0,'22ecc229-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (32,'ALF0000000032','userlog',4,'IP','left',4,1,NULL,NULL,0,'22ecc2a1-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (33,'ALF0000000033','acltype',5,'NAME','left',2,1,NULL,NULL,0,'22ecc30c-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (34,'ALF0000000034','acltype',5,'ORDERING','left',3,1,NULL,NULL,0,'22ecc377-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (35,'ALF0000000035','userrole',6,'NAME','left',2,1,NULL,NULL,0,'22ecc3ee-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (36,'ALF0000000036','parameter',7,'NAME','left',2,1,NULL,NULL,0,'22ecc459-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (37,'ALF0000000037','parameter',7,'CODE','left',3,1,NULL,NULL,0,'22ecc4cd-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (38,'ALF0000000038','parameter',7,'ID_PARAMETER_GROUP','left',4,1,NULL,NULL,0,'22ecc540-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (39,'ALF0000000039','parameter',7,'ID_PARAMETER_TYPE','left',5,1,NULL,NULL,0,'22ecc5b4-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (40,'ALF0000000040','parameter',7,'VALUE','left',6,1,NULL,NULL,0,'22ecc623-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (41,'ALF0000000041','parameter',7,'DESCRIPTION','left',7,1,NULL,NULL,0,'22ecc69b-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (42,'ALF0000000042','dashboard',8,'NAME','left',2,1,NULL,NULL,0,'22ecc70e-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (43,'ALF0000000043','dashboard',8,'ID_ADMIN_MENU','left',3,1,NULL,NULL,0,'22ecc782-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (44,'ALF0000000044','dashboard',8,'ID_DASHBOARD_LAYOUT','left',4,1,NULL,NULL,0,'22ecc7f5-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (45,'ALF0000000045','dashboard',8,'DASHBOARD_FILE_PATH','left',5,1,NULL,NULL,0,'22ecc869-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (46,'ALF0000000046','fieldacl',9,'MODULE','left',2,1,NULL,NULL,0,'22ecc8d8-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (47,'ALF0000000047','fieldacl',9,'ACTION','left',3,1,NULL,NULL,0,'22ecc950-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (48,'ALF0000000048','fieldacl',9,'ID_USER_GROUP','left',4,1,NULL,NULL,0,'22ecc9c3-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (49,'ALF0000000049','fieldacl',9,'ID_USER','left',5,1,NULL,NULL,0,'22ecca3b-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (50,'ALF0000000050','fieldacl',9,'FIELDS','left',6,1,NULL,NULL,0,'22eccaae-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (51,'ALF0000000051','fieldacl',9,'ID_ACL_TYPE','left',7,1,NULL,NULL,0,'22eccb22-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (52,'ALF0000000052','changelog',10,'ACTION','left',2,1,NULL,NULL,0,'22eccb95-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (53,'ALF0000000053','changelog',10,'ITEM','left',3,1,NULL,NULL,0,'22eccc09-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (54,'ALF0000000054','changelog',10,'MODULE','left',4,1,NULL,NULL,0,'22eccc78-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (55,'ALF0000000055','changelog',10,'DATE_TIME','left',5,1,NULL,NULL,0,'22ecccec-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (56,'ALF0000000056','changelog',10,'ID_USER','left',6,1,NULL,NULL,0,'22eccd5f-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (57,'ALF0000000057','changelog',10,'DETAILS','left',7,1,NULL,NULL,0,'22eccdd3-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (58,'ALF0000000058','usergroup',11,'NAME','left',2,1,NULL,NULL,0,'22ecce42-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (59,'ALF0000000059','usergroup',11,'DEFAULT_ID_DASHBOARD','left',3,1,NULL,NULL,0,'22ecceba-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (60,'ALF0000000060','usergroup',11,'PARENT','left',4,1,NULL,NULL,0,'22eccf2d-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (61,'ALF0000000061','objectacl',12,'MODULE','left',2,1,NULL,NULL,0,'22eccfa1-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (62,'ALF0000000062','objectacl',12,'OBJECT_ID','left',3,1,NULL,NULL,0,'22ecd014-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (63,'ALF0000000063','objectacl',12,'ID_USER_GROUP','left',4,1,NULL,NULL,0,'22ecd087-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (64,'ALF0000000064','objectacl',12,'ID_USER','left',5,1,NULL,NULL,0,'22ecd0f7-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (65,'ALF0000000065','objectacl',12,'ARG_ID_USER_GROUP','left',6,1,NULL,NULL,0,'22ecd16a-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (66,'ALF0000000066','objectacl',12,'ARG_ID_USER','left',7,1,NULL,NULL,0,'22ecd1d9-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (67,'ALF0000000067','objectacl',12,'ID_ACL_TYPE','left',8,1,NULL,NULL,0,'22ecd24d-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (68,'ALF0000000068','adminmenu',13,'NAME','left',2,1,NULL,NULL,0,'22ecd2c5-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (69,'ALF0000000069','adminmenu',13,'ORDERING','left',3,1,NULL,NULL,0,'22ecd338-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (70,'ALF0000000070','adminmenu',13,'IS_ENABLED','left',4,1,NULL,NULL,0,'22ecd3ac-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (71,'ALF0000000071','adminview',14,'TITLE','left',2,1,NULL,NULL,0,'22ecd41b-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (72,'ALF0000000072','adminview',14,'CODE','left',3,1,NULL,NULL,0,'22ecd48a-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (73,'ALF0000000073','adminview',14,'MODULE','left',4,1,NULL,NULL,0,'22ecd4fe-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (74,'ALF0000000074','adminview',14,'SCREEN','left',5,1,NULL,NULL,0,'22ecd56d-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (75,'ALF0000000075','adminview',14,'CONDITION_FIELD','left',6,1,NULL,NULL,0,'22ecd5e4-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (76,'ALF0000000076','adminview',14,'CONDITION_VALUE','left',7,1,NULL,NULL,0,'22ecd654-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (77,'ALF0000000077','adminview',14,'TEMPLATE','left',8,1,NULL,NULL,0,'22ecd6c7-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (78,'ALF0000000078','adminview',14,'IS_PRINT_VIEW','left',9,1,NULL,NULL,0,'22ecd73b-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (79,'ALF0000000079','adminview',14,'ORDERING','left',10,1,NULL,NULL,0,'22ecd7aa-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (80,'ALF0000000080','adminlabel',15,'LABEL','left',2,1,NULL,NULL,0,'22ecd81d-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (81,'ALF0000000081','recyclebin',16,'ITEM','left',2,1,NULL,NULL,0,'22ecd88d-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (82,'ALF0000000082','recyclebin',16,'MODULE','left',3,1,NULL,NULL,0,'22ecd900-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (83,'ALF0000000083','recyclebin',16,'DATE_TIME','left',4,1,NULL,NULL,0,'22ecd974-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (84,'ALF0000000084','recyclebin',16,'ID_USER','left',5,1,NULL,NULL,0,'22ecd9e7-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (85,'ALF0000000085','accessright',17,'ID_USER_GROUP','left',2,1,NULL,NULL,0,'22ecda5b-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (86,'ALF0000000086','accessright',17,'MODULE','left',3,1,NULL,NULL,0,'22ecdaca-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (87,'ALF0000000087','accessright',17,'ACTIONS','left',4,1,NULL,NULL,0,'22ecdb3d-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (88,'ALF0000000088','adminmodule',18,'NAME','left',2,1,NULL,NULL,0,'22ecdbb1-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (89,'ALF0000000089','adminmodule',18,'MODULE','left',3,1,NULL,NULL,0,'22ecdc24-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (90,'ALF0000000090','adminmodule',18,'PREFIX','left',4,1,NULL,NULL,0,'22ecdc93-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (91,'ALF0000000091','adminmodule',18,'AVAILABLE_ACTIONS','left',5,1,NULL,NULL,0,'22ecdd03-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (92,'ALF0000000092','adminmodule',18,'IS_COMMENT_ENABLED','left',6,1,NULL,NULL,0,'22ece074-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (93,'ALF0000000093','adminlanguage',19,'NAME','left',2,1,NULL,NULL,0,'22ece0f4-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (94,'ALF0000000094','adminlanguage',19,'CODE','left',3,1,NULL,NULL,0,'22ece16c-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (95,'ALF0000000095','parametertype',20,'NAME','left',2,1,NULL,NULL,0,'22ece1db-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (96,'ALF0000000096','parametertype',20,'BASE_TYPE_CODE','left',3,1,NULL,NULL,0,'22ece253-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (97,'ALF0000000097','parametertype',20,'EXTRA','left',4,1,NULL,NULL,0,'22ece2c2-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (98,'ALF0000000098','parametertype',20,'ORDERING','left',5,1,NULL,NULL,0,'22ece335-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (99,'ALF0000000099','usermembership',21,'ID_USER','left',2,1,NULL,NULL,0,'22ece3a9-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (100,'ALF0000000100','usermembership',21,'ID_USER_GROUP','left',3,1,NULL,NULL,0,'22ece418-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (101,'ALF0000000101','usermembership',21,'ID_USER_ROLE','left',4,1,NULL,NULL,0,'22ece48c-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (102,'ALF0000000102','usermembership',21,'VALID_FROM','left',5,1,NULL,NULL,0,'22ece4fb-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (103,'ALF0000000103','usermembership',21,'VALID_UNTIL','left',6,1,NULL,NULL,0,'22ece56a-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (104,'ALF0000000104','userpreference',22,'ID_USER','left',2,1,NULL,NULL,0,'22ece5d9-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (105,'ALF0000000105','userpreference',22,'ID_DASHBOARD','left',3,1,NULL,NULL,0,'22ece648-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (106,'ALF0000000106','userpreference',22,'ID_WALLPAPER','left',4,1,NULL,NULL,0,'22ece6c0-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (107,'ALF0000000107','userpreference',22,'ID_ADMIN_STYLE','left',5,1,NULL,NULL,0,'22ece72f-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (108,'ALF0000000108','parametergroup',23,'NAME','left',2,1,NULL,NULL,0,'22ece7a3-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (109,'ALF0000000109','parametergroup',23,'ORDERING','left',3,1,NULL,NULL,0,'22ece812-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (110,'ALF0000000110','adminmenuitem',24,'NAME','left',2,1,NULL,NULL,0,'22ece886-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (111,'ALF0000000111','adminmenuitem',24,'ID_ADMIN_MENU','left',3,1,NULL,NULL,0,'22ece8f9-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (112,'ALF0000000112','adminmenuitem',24,'PARENT','left',4,1,NULL,NULL,0,'22ece964-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (113,'ALF0000000113','adminmenuitem',24,'MODULE','left',5,1,NULL,NULL,0,'22ece9d8-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (114,'ALF0000000114','adminmenuitem',24,'PATH','left',6,1,NULL,NULL,0,'22ecea4f-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (115,'ALF0000000115','adminmenuitem',24,'FONT_AWESOME_ICON','left',7,1,NULL,NULL,0,'22eceac3-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (116,'ALF0000000116','adminmenuitem',24,'ENABLE_LEFT','left',8,1,NULL,NULL,0,'22eceb32-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (117,'ALF0000000117','adminmenuitem',24,'ENABLE_TOP','left',9,1,NULL,NULL,0,'22eceba6-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (118,'ALF0000000118','adminmenuitem',24,'ENABLE_QUICK','left',10,1,NULL,NULL,0,'22ecec15-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (119,'ALF0000000119','adminmenuitem',24,'ENABLE_ALL','left',11,1,NULL,NULL,0,'22ecec84-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (120,'ALF0000000120','adminmenuitem',24,'ENABLE_SETTINGS','left',12,1,NULL,NULL,0,'22ececf7-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (121,'ALF0000000121','adminmenuitem',24,'OPEN_IN_NEW_WINDOW','left',13,1,NULL,NULL,0,'22eced67-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (122,'ALF0000000122','adminmenuitem',24,'IS_STARRED','left',14,1,NULL,NULL,0,'22ecedd6-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (123,'ALF0000000123','adminmenuitem',24,'ORDERING','left',15,1,NULL,NULL,0,'22ecee45-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (124,'ALF0000000124','adminlanguageitem',25,'ID_ADMIN_LANGUAGE','left',2,1,NULL,NULL,0,'22eceebd-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (125,'ALF0000000125','adminlanguageitem',25,'ID_ADMIN_LABEL','left',3,1,NULL,NULL,0,'22ecef28-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (126,'ALF0000000126','adminlanguageitem',25,'TRANSLATION','left',4,1,NULL,NULL,0,'22ecef97-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (147,'ALF0000000127','user',1,'JSON','left',22,1,NULL,NULL,0,'6a5a7e97-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (153,'ALF0000000128','field',2,'JSON','left',7,1,NULL,NULL,0,'6a5a81c4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (154,'ALF0000000129','screen',26,'TITLE','left',2,1,NULL,NULL,0,'6a5a8301-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (155,'ALF0000000130','screen',26,'ID_WORKFLOW','left',3,1,NULL,NULL,0,'6a5a842c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (156,'ALF0000000131','screen',26,'CODE','left',4,1,NULL,NULL,0,'6a5a8542-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (161,'ALF0000000132','option',3,'JSON','left',6,1,NULL,NULL,0,'6a5a8658-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (164,'ALF0000000133','acltype',5,'JSON','left',4,1,NULL,NULL,0,'6a5a8759-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (165,'ALF0000000134','workflow',27,'NAME','left',2,1,NULL,NULL,0,'6a5a885e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (166,'ALF0000000135','workflow',27,'CODE','left',3,1,NULL,NULL,0,'6a5a8967-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (167,'ALF0000000136','workflow',27,'DESCRIPTION','left',4,1,NULL,NULL,0,'6a5a8a63-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (168,'ALF0000000137','workflow',27,'JSON','left',5,1,NULL,NULL,0,'6a5a8b71-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (172,'ALF0000000138','userlog',4,'JSON','left',5,1,NULL,NULL,0,'6a5a8c71-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (179,'ALF0000000139','parameter',7,'JSON','left',8,1,NULL,NULL,0,'6a5a8d7a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (181,'ALF0000000140','userrole',6,'JSON','left',3,1,NULL,NULL,0,'6a5a902f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (186,'ALF0000000141','dashboard',8,'JSON','left',6,1,NULL,NULL,0,'6a5a91a4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (193,'ALF0000000142','fieldacl',9,'JSON','left',8,1,NULL,NULL,0,'6a5a92b1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (194,'ALF0000000143','valuetype',28,'NAME','left',2,1,NULL,NULL,0,'6a5a93b2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (195,'ALF0000000144','valuetype',28,'CODE','left',3,1,NULL,NULL,0,'6a5a94b7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (203,'ALF0000000145','objectacl',12,'JSON','left',9,1,NULL,NULL,0,'6a5a95b3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (213,'ALF0000000146','adminview',14,'JSON','left',11,1,NULL,NULL,0,'6a5a96b4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (217,'ALF0000000147','adminmenu',13,'JSON','left',5,1,NULL,NULL,0,'6a5a97b8-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (224,'ALF0000000148','changelog',10,'JSON','left',8,1,NULL,NULL,0,'6a5a98b5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (228,'ALF0000000149','usergroup',11,'JSON','left',5,1,NULL,NULL,0,'6a5a99b5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (233,'ALF0000000150','recyclebin',16,'JSON','left',6,1,NULL,NULL,0,'6a5a9ab6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (235,'ALF0000000151','adminlabel',15,'JSON','left',3,1,NULL,NULL,0,'6a5a9bbb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (236,'ALF0000000152','adminfilter',29,'NAME','left',2,1,NULL,NULL,0,'6a5a9cc4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (237,'ALF0000000153','adminfilter',29,'MODULE','left',3,1,NULL,NULL,0,'6a5a9dcd-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (238,'ALF0000000154','adminfilter',29,'COLUMNS','left',4,1,NULL,NULL,0,'6a5a9edf-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (239,'ALF0000000155','adminfilter',29,'IS_DEFAULT','left',5,1,NULL,NULL,0,'6a5a9ff1-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (240,'ALF0000000156','screenfield',30,'ID_SCREEN','left',2,1,NULL,NULL,0,'6a5aa0fe-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (241,'ALF0000000157','screenfield',30,'TITLE','left',3,1,NULL,NULL,0,'6a5aa20c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (242,'ALF0000000158','screenfield',30,'CODE','left',4,1,NULL,NULL,0,'6a5aa315-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (243,'ALF0000000159','screenfield',30,'ID_VALUE_TYPE','left',5,1,NULL,NULL,0,'6a5aa4f4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (244,'ALF0000000160','screenfield',30,'DATASOURCE','left',6,1,NULL,NULL,0,'6a5aad2c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (245,'ALF0000000161','screenfield',30,'CONDITION','left',7,1,NULL,NULL,0,'6a5aae98-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (246,'ALF0000000162','screenfield',30,'VALUECOL','left',8,1,NULL,NULL,0,'6a5aafb2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (247,'ALF0000000163','screenfield',30,'TEXTCOL','left',9,1,NULL,NULL,0,'6a5ab0c4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (248,'ALF0000000164','screenfield',30,'IS_MANDATORY','left',10,1,NULL,NULL,0,'6a5ab1da-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (249,'ALF0000000165','screenfield',30,'ORDERING','left',11,1,NULL,NULL,0,'6a5ab2f0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (253,'ALF0000000166','accessright',17,'JSON','left',5,1,NULL,NULL,0,'6a5ab3fe-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (254,'ALF0000000167','workflowlog',31,'ID_WORKFLOW','left',2,1,NULL,NULL,0,'6a5ab507-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (255,'ALF0000000168','workflowlog',31,'ID_WORKFLOW_TRANSITION','left',3,1,NULL,NULL,0,'6a5ab619-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (256,'ALF0000000169','workflowlog',31,'MODULE','left',4,1,NULL,NULL,0,'6a5ab726-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (257,'ALF0000000170','workflowlog',31,'OBJECT_ID','left',5,1,NULL,NULL,0,'6a5ab82f-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (258,'ALF0000000171','workflowlog',31,'DATE','left',6,1,NULL,NULL,0,'6a5ab945-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (259,'ALF0000000172','workflowlog',31,'ID_USER','left',7,1,NULL,NULL,0,'6a5aba4a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (260,'ALF0000000173','workflowlog',31,'DETAILS','left',8,1,NULL,NULL,0,'6a5abb5c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (266,'ALF0000000174','adminmodule',18,'JSON','left',7,1,NULL,NULL,0,'6a5abc61-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (267,'ALF0000000175','workflowstage',32,'ID_WORKFLOW','left',2,1,NULL,NULL,0,'6a5abd66-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (268,'ALF0000000176','workflowstage',32,'NAME','left',3,1,NULL,NULL,0,'6a5abe77-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (269,'ALF0000000177','workflowstage',32,'CODE','left',4,1,NULL,NULL,0,'6a5abf81-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (270,'ALF0000000178','workflowstage',32,'IS_DEFAULT','left',5,1,NULL,NULL,0,'6a5ac08a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (271,'ALF0000000179','workflowstage',32,'IS_BINDING_OBJECT_EDITABLE','left',6,1,NULL,NULL,0,'6a5ac343-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (272,'ALF0000000180','workflowstage',32,'IS_BINDING_OBJECT_DELETABLE','left',7,1,NULL,NULL,0,'6a5ac473-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (275,'ALF0000000181','adminlanguage',19,'JSON','left',4,1,NULL,NULL,0,'6a5ac57c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (280,'ALF0000000182','parametertype',20,'JSON','left',6,1,NULL,NULL,0,'6a5ac6a7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (285,'ALF0000000183','userpreference',22,'JSON','left',6,1,NULL,NULL,0,'6a5ac7ca-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (288,'ALF0000000184','parametergroup',23,'JSON','left',4,1,NULL,NULL,0,'6a5ac8e9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (294,'ALF0000000185','usermembership',21,'JSON','left',7,1,NULL,NULL,0,'6a5aca10-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (309,'ALF0000000186','adminmenuitem',24,'JSON','left',16,1,NULL,NULL,0,'6a5acb2e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (310,'ALF0000000187','adminlayoutfield',33,'MODULE','left',2,1,NULL,NULL,0,'6a5acc5a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (311,'ALF0000000188','adminlayoutfield',33,'ID_ADMIN_LAYOUT_SECTION','left',3,1,NULL,NULL,0,'6a5acd78-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (312,'ALF0000000189','adminlayoutfield',33,'COLUMN','left',4,1,NULL,NULL,0,'6a5ace8e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (313,'ALF0000000190','adminlayoutfield',33,'POSITION','left',5,1,NULL,NULL,0,'6a5acfbe-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (314,'ALF0000000191','adminlayoutfield',33,'ORDERING','left',6,1,NULL,NULL,0,'6a5ad0e5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (315,'ALF0000000192','workflowtransition',34,'ID_WORKFLOW','left',2,1,NULL,NULL,0,'6a5ad211-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (316,'ALF0000000193','workflowtransition',34,'NAME','left',3,1,NULL,NULL,0,'6a5ad33c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (317,'ALF0000000194','workflowtransition',34,'START_ID_WORKFLOW_STAGE','left',4,1,NULL,NULL,0,'6a5ad467-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (318,'ALF0000000195','workflowtransition',34,'END_ID_WORKFLOW_STAGE','left',5,1,NULL,NULL,0,'6a5ad5a0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (319,'ALF0000000196','workflowtransition',34,'ACTION','left',6,1,NULL,NULL,0,'6a5ad6be-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (320,'ALF0000000197','workflowtransition',34,'ID_USER_GROUP','left',7,1,NULL,NULL,0,'6a5ad7e5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (321,'ALF0000000198','workflowtransition',34,'ID_USER_ROLE','left',8,1,NULL,NULL,0,'6a5ad90d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (322,'ALF0000000199','workflowtransition',34,'TRANSITION_ID_SCREEN','left',9,1,NULL,NULL,0,'6a5ada34-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (326,'ALF0000000200','adminlanguageitem',25,'JSON','left',5,1,NULL,NULL,0,'6a5adb52-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (327,'ALF0000000201','workflowapplication',35,'MODULE','left',2,1,NULL,NULL,0,'6a5adc82-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (328,'ALF0000000202','workflowapplication',35,'ID_WORKFLOW','left',3,1,NULL,NULL,0,'6a5addad-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (329,'ALF0000000203','adminlayoutsection',36,'NAME','left',2,1,NULL,NULL,0,'6a5aded5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (330,'ALF0000000204','adminlayoutsection',36,'MODULE','left',3,1,NULL,NULL,0,'6a5adffc-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (331,'ALF0000000205','adminlayoutsection',36,'SHOW_TITLE','left',4,1,NULL,NULL,0,'6a5ae12b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (332,'ALF0000000206','adminlayoutsection',36,'ORDERING','left',5,1,NULL,NULL,0,'6a5ae252-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (363,'ALF0000000207','screen',26,'JSON','left',5,1,NULL,NULL,0,'7fde7d97-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (419,'ALF0000000208','valuetype',28,'JSON','left',4,1,NULL,NULL,0,'7fde7fd4-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (448,'ALF0000000209','adminfilter',29,'JSON','left',6,1,NULL,NULL,0,'7fde83bd-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (459,'ALF0000000210','screenfield',30,'JSON','left',12,1,NULL,NULL,0,'7fde844e-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (467,'ALF0000000211','workflowlog',31,'JSON','left',9,1,NULL,NULL,0,'7fde84c6-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (484,'ALF0000000212','workflowstage',32,'JSON','left',8,1,NULL,NULL,0,'7fde8535-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (493,'ALF0000000213','adminsequence',37,'MODULE','left',2,1,NULL,NULL,0,'7fde85ad-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (494,'ALF0000000214','adminsequence',37,'SEQUENCE_FORMAT','left',3,1,NULL,NULL,0,'7fde8625-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (495,'ALF0000000215','adminsequence',37,'CURRENT_VALUE','left',4,1,NULL,NULL,0,'7fde86e1-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (496,'ALF0000000216','adminsequence',37,'SEQUENCE_STEP','left',5,1,NULL,NULL,0,'7fde87bb-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (531,'ALF0000000217','adminlayoutfield',33,'JSON','left',7,1,NULL,NULL,0,'7fde8888-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (540,'ALF0000000218','workflowtransition',34,'JSON','left',10,1,NULL,NULL,0,'7fde8962-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (547,'ALF0000000219','workflowapplication',35,'JSON','left',4,1,NULL,NULL,0,'7fde8a45-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (552,'ALF0000000220','adminlayoutsection',36,'JSON','left',6,1,NULL,NULL,0,'7fde8b42-1a1e-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_FIELD`(`ID`,`REFID`,`MODULE`,`ID_ADMIN_LAYOUT_SECTION`,`COLUMN`,`POSITION`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (717,'ALF0000000221','adminsequence',37,'JSON','left',6,1,NULL,NULL,0,'a6b23668-1a1e-11e5-aee6-cc52af77857f');

/*Table structure for table `ADMIN_LAYOUT_SECTION` */

DROP TABLE IF EXISTS `ADMIN_LAYOUT_SECTION`;

CREATE TABLE `ADMIN_LAYOUT_SECTION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHOW_TITLE` tinyint(1) DEFAULT NULL,
  `ORDERING` tinyint(2) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UDID` int(11) DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ADMIN_LAYOUT_SECTION` */

insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (1,'ALS0000000001','Details','user',NULL,NULL,1,NULL,NULL,0,'22ed4903-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (2,'ALS0000000002','Details','field',NULL,NULL,1,NULL,NULL,0,'22ed4ac4-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (3,'ALS0000000003','Details','option',NULL,NULL,1,NULL,NULL,0,'22ed4b62-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (4,'ALS0000000004','Details','userlog',NULL,NULL,1,NULL,NULL,0,'22ed4beb-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (5,'ALS0000000005','Details','acltype',NULL,NULL,1,NULL,NULL,0,'22ed4c7d-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (6,'ALS0000000006','Details','userrole',NULL,NULL,1,NULL,NULL,0,'22ed4d0e-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (7,'ALS0000000007','Details','parameter',NULL,NULL,1,NULL,NULL,0,'22ed4da8-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (8,'ALS0000000008','Details','dashboard',NULL,NULL,1,NULL,NULL,0,'22ed4e2d-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (9,'ALS0000000009','Details','fieldacl',NULL,NULL,1,NULL,NULL,0,'22ed4eb5-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (10,'ALS0000000010','Details','changelog',NULL,NULL,1,NULL,NULL,0,'22ed4f43-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (11,'ALS0000000011','Details','usergroup',NULL,NULL,1,NULL,NULL,0,'22ed4fcb-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (12,'ALS0000000012','Details','objectacl',NULL,NULL,1,NULL,NULL,0,'22ed5054-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (13,'ALS0000000013','Details','adminmenu',NULL,NULL,1,NULL,NULL,0,'22ed50d9-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (14,'ALS0000000014','Details','adminview',NULL,NULL,1,NULL,NULL,0,'22ed5162-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (15,'ALS0000000015','Details','adminlabel',NULL,NULL,1,NULL,NULL,0,'22ed51eb-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (16,'ALS0000000016','Details','recyclebin',NULL,NULL,1,NULL,NULL,0,'22ed5274-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (17,'ALS0000000017','Details','accessright',NULL,NULL,1,NULL,NULL,0,'22ed52fc-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (18,'ALS0000000018','Details','adminmodule',NULL,NULL,1,NULL,NULL,0,'22ed5385-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (19,'ALS0000000019','Details','adminlanguage',NULL,NULL,1,NULL,NULL,0,'22ed540e-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (20,'ALS0000000020','Details','parametertype',NULL,NULL,1,NULL,NULL,0,'22ed549b-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (21,'ALS0000000021','Details','usermembership',NULL,NULL,1,NULL,NULL,0,'22ed5528-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (22,'ALS0000000022','Details','userpreference',NULL,NULL,1,NULL,NULL,0,'22ed55b1-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (23,'ALS0000000023','Details','parametergroup',NULL,NULL,1,NULL,NULL,0,'22ed563e-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (24,'ALS0000000024','Details','adminmenuitem',NULL,NULL,1,NULL,NULL,0,'22ed56cc-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (25,'ALS0000000025','Details','adminlanguageitem',NULL,NULL,1,NULL,NULL,0,'22ed5759-1a1b-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (26,'ALS0000000026','Details','screen',NULL,NULL,1,NULL,NULL,0,'6a5f494d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (27,'ALS0000000027','Details','workflow',NULL,NULL,1,NULL,NULL,0,'6a5f4c28-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (28,'ALS0000000028','Details','valuetype',NULL,NULL,1,NULL,NULL,0,'6a5f4d13-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (29,'ALS0000000029','Details','adminfilter',NULL,NULL,1,NULL,NULL,0,'6a5f4dd4-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (30,'ALS0000000030','Details','screenfield',NULL,NULL,1,NULL,NULL,0,'6a5f4e9d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (31,'ALS0000000031','Details','workflowlog',NULL,NULL,1,NULL,NULL,0,'6a5f4f62-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (32,'ALS0000000032','Details','workflowstage',NULL,NULL,1,NULL,NULL,0,'6a5f502b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (33,'ALS0000000033','Details','adminlayoutfield',NULL,NULL,1,NULL,NULL,0,'6a5f50c0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (34,'ALS0000000034','Details','workflowtransition',NULL,NULL,1,NULL,NULL,0,'6a5f5152-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (35,'ALS0000000035','Details','workflowapplication',NULL,NULL,1,NULL,NULL,0,'6a5f51e3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (36,'ALS0000000036','Details','adminlayoutsection',NULL,NULL,1,NULL,NULL,0,'6a5f5270-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_LAYOUT_SECTION`(`ID`,`REFID`,`NAME`,`MODULE`,`SHOW_TITLE`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (37,'ALS0000000037','Details','adminsequence',NULL,NULL,1,NULL,NULL,0,'7fdfcef1-1a1e-11e5-aee6-cc52af77857f');

/*Table structure for table `ADMIN_MENU` */

DROP TABLE IF EXISTS `ADMIN_MENU`;

CREATE TABLE `ADMIN_MENU` (
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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ADMIN_MENU` */

insert  into `ADMIN_MENU`(`ID`,`REFID`,`NAME`,`ORDERING`,`IS_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'ADM0000000001','Admin Menu',1,1,1,NULL,0,NULL,'078ad597-1a1a-11e5-b2f8-cc52af77857f');
insert  into `ADMIN_MENU`(`ID`,`REFID`,`NAME`,`ORDERING`,`IS_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2,'ADM0000000002','Base User Menu',2,0,1,NULL,0,NULL,'078ad93b-1a1a-11e5-b2f8-cc52af77857f');

/*Table structure for table `ADMIN_MENU_ITEM` */

DROP TABLE IF EXISTS `ADMIN_MENU_ITEM`;

CREATE TABLE `ADMIN_MENU_ITEM` (
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
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HIERACHY` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ADMIN_MENU_ITEM` */

insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (1,'AMI0000000001','Dashboard',1,0,'index',NULL,'fa-linkedin',1,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,0,NULL,'0880f761-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (2,'AMI0000000002','Admin',1,0,'adminmenu',NULL,'fa-bullhorn',1,NULL,NULL,NULL,NULL,NULL,NULL,11,1,NULL,0,NULL,'0880fb79-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (5,'AMI0000000003','Toolbox',1,2,'toolbox',NULL,'fa-moon-o',1,NULL,NULL,NULL,NULL,NULL,NULL,13,1,NULL,0,NULL,'0880fd1d-1a1a-11e5-b2f8-cc52af77857f','-0-2-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (6,'AMI0000000004','Template',1,2,'template',NULL,'fa-paypal',1,NULL,NULL,NULL,NULL,NULL,NULL,14,1,NULL,0,NULL,'0880fe9d-1a1a-11e5-b2f8-cc52af77857f','-0-2-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (8,'AMI0000000005','Access Right',1,0,'accessright',NULL,'fa-leaf',0,NULL,NULL,NULL,NULL,NULL,NULL,19,1,NULL,0,NULL,'0881001a-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (9,'AMI0000000006','Report Builder',1,0,'reportbuilder',NULL,'fa-italic',0,NULL,NULL,NULL,NULL,NULL,NULL,18,1,NULL,0,NULL,'088101a4-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (10,'AMI0000000007','Users',1,0,'user',NULL,'fa-building',0,0,0,0,1,NULL,NULL,99,1,NULL,0,NULL,'9f415386-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (11,'AMI0000000008','Fields',1,0,'field',NULL,'fa-chevron-down',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'9f417007-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (12,'AMI0000000009','Options',1,0,'option',NULL,'fa-code',1,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'9f4192e2-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (13,'AMI0000000010','User Logs',1,0,'userlog',NULL,'fa-ioxhost',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'9f41bad1-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (14,'AMI0000000011','Acl Types',1,0,'acltype',NULL,'fa-exclamation-circle',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'9f41e118-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (15,'AMI0000000012','User Roles',1,0,'userrole',NULL,'fa-expand',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'9f4201db-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (16,'AMI0000000013','Parameters',1,0,'parameter',NULL,'fa-trash-o',1,0,0,0,1,NULL,NULL,99,1,NULL,0,NULL,'9f421888-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (17,'AMI0000000014','Dashboards',1,0,'dashboard',NULL,'fa-star-half',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'9f423321-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (18,'AMI0000000015','Field Acls',1,0,'fieldacl',NULL,'fa-anchor',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'9f424adb-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (19,'AMI0000000016','Change Logs',1,0,'changelog',NULL,'fa-font',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'9f426501-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (20,'AMI0000000017','User Groups',1,0,'usergroup',NULL,'fa-smile-o',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'9f42883e-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (21,'AMI0000000018','Object Acls',1,0,'objectacl',NULL,'fa-university',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'9f42b068-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (22,'AMI0000000019','Admin Views',1,0,'adminview',NULL,'fa-caret-up',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'9f43111d-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (23,'AMI0000000020','Admin Labels',1,0,'adminlabel',NULL,'fa-list-alt',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'9f434406-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (24,'AMI0000000021','Recycle Bins',1,0,'recyclebin',NULL,'fa-vk',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'9f43735b-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (25,'AMI0000000022','Admin Modules',1,0,'adminmodule',NULL,'fa-volume-off',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'9f43aca2-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (26,'AMI0000000023','Admin Languages',1,0,'adminlanguage',NULL,'fa-linkedin-square',0,0,0,0,1,NULL,NULL,99,1,NULL,0,NULL,'9f43c5fa-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (27,'AMI0000000024','Parameter Types',1,0,'parametertype',NULL,'fa-jsfiddle',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'9f43dfa9-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (28,'AMI0000000025','User Memberships',1,0,'usermembership',NULL,'fa-caret-square-o-up',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'9f43f7eb-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (29,'AMI0000000026','User Preferences',1,0,'userpreference',NULL,'fa-css3',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'9f441047-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (30,'AMI0000000027','Parameter Groups',1,0,'parametergroup',NULL,'fa-folder',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'9f4429fe-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (31,'AMI0000000028','Admin Menu Items',1,0,'adminmenuitem',NULL,'fa-money',0,0,0,0,1,NULL,NULL,99,1,NULL,0,NULL,'9f444289-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (32,'AMI0000000029','Admin Language Items',1,0,'adminlanguageitem',NULL,'fa-linkedin',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'9f445b9e-1a1a-11e5-b2f8-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (33,'AMI0000000030','Screens',1,0,'screen',NULL,'fa-trello',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'d3cb8e3b-1a1b-11e5-aee6-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (34,'AMI0000000031','Workflows',1,0,'workflow',NULL,'fa-reply-all',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'d3cbdf9a-1a1b-11e5-aee6-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (35,'AMI0000000032','Value Types',1,0,'valuetype',NULL,'fa-spinner',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'d3cc6488-1a1b-11e5-aee6-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (36,'AMI0000000033','Admin Filters',1,0,'adminfilter',NULL,'fa-print',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'d3cd0d26-1a1b-11e5-aee6-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (37,'AMI0000000034','Screen Fields',1,0,'screenfield',NULL,'fa-crop',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'d3cd31ce-1a1b-11e5-aee6-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (38,'AMI0000000035','Workflow Logs',1,0,'workflowlog',NULL,'fa-quote-left',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'d3cd7821-1a1b-11e5-aee6-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (39,'AMI0000000036','Workflow Stages',1,0,'workflowstage',NULL,'fa-tags',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'d3cda755-1a1b-11e5-aee6-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (40,'AMI0000000037','Admin Layout Fields',1,0,'adminlayoutfield',NULL,'fa-header',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'d3ce1e69-1a1b-11e5-aee6-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (41,'AMI0000000038','Workflow Transitions',1,0,'workflowtransition',NULL,'fa-paint-brush',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'d3ce39cb-1a1b-11e5-aee6-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (42,'AMI0000000039','Workflow Applications',1,0,'workflowapplication',NULL,'fa-comment',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'d3ce6082-1a1b-11e5-aee6-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (43,'AMI0000000040','Admin Layout Sections',1,0,'adminlayoutsection',NULL,'fa-moon-o',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'d3ce77d0-1a1b-11e5-aee6-cc52af77857f','-0-');
insert  into `ADMIN_MENU_ITEM`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`PARENT`,`MODULE`,`PATH`,`FONT_AWESOME_ICON`,`ENABLE_LEFT`,`ENABLE_TOP`,`ENABLE_QUICK`,`ENABLE_ALL`,`ENABLE_SETTINGS`,`OPEN_IN_NEW_WINDOW`,`IS_STARRED`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`,`HIERACHY`) values (44,'AMI0000000041','Admin Sequences',1,0,'adminsequence',NULL,'fa-upload',0,0,0,0,0,NULL,NULL,99,1,NULL,0,NULL,'a736e018-1a1c-11e5-aee6-cc52af77857f','-0-');

/*Table structure for table `ADMIN_MODULE` */

DROP TABLE IF EXISTS `ADMIN_MODULE`;

CREATE TABLE `ADMIN_MODULE` (
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
  UNIQUE KEY `UNIQUE` (`MODULE`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ADMIN_MODULE` */

insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'ADD0000000001','User','user','USR','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'e61d6459-1a1b-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2,'ADD0000000002','Field','field','FLD','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b4415df5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (3,'ADD0000000003','Screen','screen','SCR','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b441826a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (4,'ADD0000000004','Option','option','OPT','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b441b219-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (5,'ADD0000000005','Acl Type','acltype','ACT','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b441df60-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (6,'ADD0000000006','Workflow','workflow','WRK','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b442048d-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (7,'ADD0000000007','User Log','userlog','USL','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b4421df3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (8,'ADD0000000008','Parameter','parameter','PRM','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b44237b6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (9,'ADD0000000009','User Role','userrole','USE','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b4425258-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (10,'ADD0000000010','Dashboard','dashboard','DSH','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b4426d25-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (11,'ADD0000000011','Field Acl','fieldacl','FLA','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b44286d7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (12,'ADD0000000012','Admin Menu','adminmenu','ADM','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b442a012-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (13,'ADD0000000013','User Group','usergroup','USG','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b442b9a7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (14,'ADD0000000014','Object Acl','objectacl','OBA','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b442d3af-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (15,'ADD0000000015','Value Type','valuetype','VLT','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b442ec98-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (16,'ADD0000000016','Change Log','changelog','CHL','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b443067a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (17,'ADD0000000017','Admin View','adminview','ADV','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b443236e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (18,'ADD0000000018','Recycle Bin','recyclebin','RCB','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b4433fb3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (19,'ADD0000000019','Admin Label','adminlabel','ADL','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b44358ea-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (20,'ADD0000000020','Admin Filter','adminfilter','ADF','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b44372e9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (21,'ADD0000000021','Screen Field','screenfield','SCF','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b4438e29-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (22,'ADD0000000022','Workflow Log','workflowlog','WRL','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b443a8f2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (23,'ADD0000000023','Access Right','accessright','ACR','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b443c2fe-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (24,'ADD0000000024','Admin Module','adminmodule','ADD','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b443df65-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (25,'ADD0000000025','Workflow Stage','workflowstage','WRS','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b443fafb-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (26,'ADD0000000026','Parameter Type','parametertype','PRT','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b4441600-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (27,'ADD0000000027','Admin Language','adminlanguage','ADN','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b444307b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (28,'ADD0000000028','Admin Sequence','adminsequence','ADS','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b4444a47-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (29,'ADD0000000029','User Preference','userpreference','USP','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b4446587-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (30,'ADD0000000030','Parameter Group','parametergroup','PRG','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b4448058-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (31,'ADD0000000031','User Membership','usermembership','USM','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b4449bcc-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (32,'ADD0000000032','Admin Menu Item','adminmenuitem','AMI','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b444bc43-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (33,'ADD0000000033','Admin Layout Field','adminlayoutfield','ALF','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b444d877-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (34,'ADD0000000034','Workflow Transition','workflowtransition','WRT','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b444f5d2-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (35,'ADD0000000035','Admin Language Item','adminlanguageitem','ALI','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b44511ec-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (36,'ADD0000000036','Workflow Application','workflowapplication','WRA','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b4452e87-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_MODULE`(`ID`,`REFID`,`NAME`,`MODULE`,`PREFIX`,`AVAILABLE_ACTIONS`,`IS_COMMENT_ENABLED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (37,'ADD0000000037','Admin Layout Section','adminlayoutsection','ALS','menu list view new edit copy delete search import export report validate viewpeer editpeer deletepeer',NULL,1,NULL,0,NULL,'b4454b08-1a1c-11e5-aee6-cc52af77857f');

/*Table structure for table `ADMIN_SEQUENCE` */

DROP TABLE IF EXISTS `ADMIN_SEQUENCE`;

CREATE TABLE `ADMIN_SEQUENCE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEQUENCE_FORMAT` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CURRENT_VALUE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEQUENCE_STEP` smallint(3) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ADMIN_SEQUENCE` */

insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'ADS0000000001','user','USRxxxxxxxxxx','USR0000000001',1,1,NULL,0,NULL,'83293e66-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2,'ADS0000000002','field','FLDxxxxxxxxxx','FLD0000000258',1,1,NULL,0,NULL,'b4416e61-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (3,'ADS0000000003','screen','SCRxxxxxxxxxx','SCR0000000001',1,1,NULL,0,NULL,'b44194d7-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (4,'ADS0000000004','option','OPTxxxxxxxxxx','OPT0000000039',1,1,NULL,0,NULL,'b441bfae-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (5,'ADS0000000005','acltype','ACTxxxxxxxxxx','ACT0000000003',1,1,NULL,0,NULL,'b441ee61-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (6,'ADS0000000006','workflow','WRKxxxxxxxxxx','WRK0000000000',1,1,NULL,0,NULL,'b4420e71-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (7,'ADS0000000007','userlog','USLxxxxxxxxxx','USL0000000003',1,1,NULL,0,NULL,'b4422734-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (8,'ADS0000000008','parameter','PRMxxxxxxxxxx','PRM0000000027',1,1,NULL,0,NULL,'b44240e3-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (9,'ADS0000000009','userrole','USExxxxxxxxxx','USE0000000000',1,1,NULL,0,NULL,'b4425cdf-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (10,'ADS0000000010','dashboard','DSHxxxxxxxxxx','DSH0000000002',1,1,NULL,0,NULL,'b4427673-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (11,'ADS0000000011','fieldacl','FLAxxxxxxxxxx','FLA0000000111',1,1,NULL,0,NULL,'b4429004-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (12,'ADS0000000012','adminmenu','ADMxxxxxxxxxx','ADM0000000002',1,1,NULL,0,NULL,'b442a93e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (13,'ADS0000000013','usergroup','USGxxxxxxxxxx','USG0000000002',1,1,NULL,0,NULL,'b442c2f5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (14,'ADS0000000014','objectacl','OBAxxxxxxxxxx','OBA0000000084',1,1,NULL,0,NULL,'b442dd06-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (15,'ADS0000000015','valuetype','VLTxxxxxxxxxx','VLT0000000007',1,1,NULL,0,NULL,'b442f5fc-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (16,'ADS0000000016','changelog','CHLxxxxxxxxxx','CHL0000000000',1,1,NULL,0,NULL,'b4430fdd-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (17,'ADS0000000017','adminview','ADVxxxxxxxxxx','ADV0000000000',1,1,NULL,0,NULL,'b4432f47-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (18,'ADS0000000018','recyclebin','RCBxxxxxxxxxx','RCB0000000000',1,1,NULL,0,NULL,'b4434913-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (19,'ADS0000000019','adminlabel','ADLxxxxxxxxxx','ADL0000000310',1,1,NULL,0,NULL,'b4436256-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (20,'ADS0000000020','adminfilter','ADFxxxxxxxxxx','ADF0000000740',1,1,NULL,0,NULL,'b4437c89-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (21,'ADS0000000021','screenfield','SCFxxxxxxxxxx','SCF0000000000',1,1,NULL,0,NULL,'b44397c9-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (22,'ADS0000000022','workflowlog','WRLxxxxxxxxxx','WRL0000000000',1,1,NULL,0,NULL,'b443b29a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (23,'ADS0000000023','accessright','ACRxxxxxxxxxx','ACR0000000037',1,1,NULL,0,NULL,'b443ccc0-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (24,'ADS0000000024','adminmodule','ADDxxxxxxxxxx','ADD0000000037',1,1,NULL,0,NULL,'b443e95b-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (25,'ADS0000000025','workflowstage','WRSxxxxxxxxxx','WRS0000000005',1,1,NULL,0,NULL,'b44404c6-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (26,'ADS0000000026','parametertype','PRTxxxxxxxxxx','PRT0000000013',1,1,NULL,0,NULL,'b4441fb5-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (27,'ADS0000000027','adminlanguage','ADNxxxxxxxxxx','ADN0000000004',1,1,NULL,0,NULL,'b4443a4e-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (28,'ADS0000000028','adminsequence','ADSxxxxxxxxxx','ADS0000000037',1,1,NULL,0,NULL,'b4445434-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (29,'ADS0000000029','userpreference','USPxxxxxxxxxx','USP0000000001',1,1,NULL,0,NULL,'b4446f45-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (30,'ADS0000000030','parametergroup','PRGxxxxxxxxxx','PRG0000000004',1,1,NULL,0,NULL,'b4448a3c-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (31,'ADS0000000031','usermembership','USMxxxxxxxxxx','USM0000000002',1,1,NULL,0,NULL,'b444a814-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (32,'ADS0000000032','adminmenuitem','AMIxxxxxxxxxx','AMI0000000041',1,1,NULL,0,NULL,'b444c656-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (33,'ADS0000000033','adminlayoutfield','ALFxxxxxxxxxx','ALF0000000221',1,1,NULL,0,NULL,'b444e28a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (34,'ADS0000000034','workflowtransition','WRTxxxxxxxxxx','WRT0000000000',1,1,NULL,0,NULL,'b4450010-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (35,'ADS0000000035','adminlanguageitem','ALIxxxxxxxxxx','ALI0000001246',1,1,NULL,0,NULL,'b4451c2a-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (36,'ADS0000000036','workflowapplication','WRAxxxxxxxxxx','WRA0000000000',1,1,NULL,0,NULL,'b4453896-1a1c-11e5-aee6-cc52af77857f');
insert  into `ADMIN_SEQUENCE`(`ID`,`REFID`,`MODULE`,`SEQUENCE_FORMAT`,`CURRENT_VALUE`,`SEQUENCE_STEP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (37,'ADS0000000037','adminlayoutsection','ALSxxxxxxxxxx','ALS0000000037',1,1,NULL,0,NULL,'b445552c-1a1c-11e5-aee6-cc52af77857f');

/*Table structure for table `ADMIN_VIEW` */

DROP TABLE IF EXISTS `ADMIN_VIEW`;

CREATE TABLE `ADMIN_VIEW` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SCREEN` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION_FIELD` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION_VALUE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_PRINT_VIEW` tinyint(1) DEFAULT NULL,
  `ORDERING` tinyint(2) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UDID` int(11) DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ADMIN_VIEW` */

/*Table structure for table `CHANGE_LOG` */

DROP TABLE IF EXISTS `CHANGE_LOG`;

CREATE TABLE `CHANGE_LOG` (
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
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_MODULE` (`MODULE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `CHANGE_LOG` */

/*Table structure for table `DASHBOARD` */

DROP TABLE IF EXISTS `DASHBOARD`;

CREATE TABLE `DASHBOARD` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_ADMIN_MENU` int(11) DEFAULT NULL,
  `ID_DASHBOARD_LAYOUT` int(11) DEFAULT NULL,
  `DASHBOARD_FILE_PATH` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `DASHBOARD` */

insert  into `DASHBOARD`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`ID_DASHBOARD_LAYOUT`,`DASHBOARD_FILE_PATH`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'DSH0000000001','Admin Dashboard',1,1,NULL,1,NULL,0,NULL,'06fe2356-1a1a-11e5-b2f8-cc52af77857f');
insert  into `DASHBOARD`(`ID`,`REFID`,`NAME`,`ID_ADMIN_MENU`,`ID_DASHBOARD_LAYOUT`,`DASHBOARD_FILE_PATH`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2,'DSH0000000002','Base User Dashboard',2,0,NULL,1,NULL,0,NULL,'06fe2719-1a1a-11e5-b2f8-cc52af77857f');

/*Table structure for table `FIELD` */

DROP TABLE IF EXISTS `FIELD`;

CREATE TABLE `FIELD` (
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
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE` (`MODULE`,`COLUMN`)
) ENGINE=InnoDB AUTO_INCREMENT=2131 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `FIELD` */

insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'FLD0000000001','Refid','user','REFID','',NULL,1,NULL,0,NULL,'880d3d9b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2,'FLD0000000002','First name','user','FIRST_NAME','',NULL,1,NULL,0,NULL,'880d4f44-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (3,'FLD0000000003','Last name','user','LAST_NAME','',NULL,1,NULL,0,NULL,'880d61e6-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (4,'FLD0000000004','Photo','user','PHOTO','',NULL,1,NULL,0,NULL,'880d72a3-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (5,'FLD0000000005','Email','user','EMAIL','',NULL,1,NULL,0,NULL,'880d7fd6-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (6,'FLD0000000006','Login','user','LOGIN','',NULL,1,NULL,0,NULL,'880d8d74-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (7,'FLD0000000007','Password','user','PASSWORD','',NULL,1,NULL,0,NULL,'880d9b3d-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (8,'FLD0000000008','Phone','user','PHONE','',NULL,1,NULL,0,NULL,'880da852-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (9,'FLD0000000009','Gender','user','GENDER','',NULL,1,NULL,0,NULL,'880db567-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (10,'FLD0000000010','Date of birth','user','DATE_OF_BIRTH','',NULL,1,NULL,0,NULL,'880dc2b4-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (11,'FLD0000000011','Force password change?','user','FORCE_PASSWORD_CHANGE','',NULL,1,NULL,0,NULL,'880dd66b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (12,'FLD0000000012','Email verified?','user','IS_EMAIL_VERIFIED','',NULL,1,NULL,0,NULL,'880de70b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (13,'FLD0000000013','Facebook','user','FACEBOOK_ID','',NULL,1,NULL,0,NULL,'880dfaba-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (14,'FLD0000000014','Facebook oauth','user','FACEBOOK_OAUTH_ID','',NULL,1,NULL,0,NULL,'880e0c09-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (15,'FLD0000000015','Google','user','GOOGLE_ID','',NULL,1,NULL,0,NULL,'880e1cc7-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (16,'FLD0000000016','Google oauth','user','GOOGLE_OAUTH_ID','',NULL,1,NULL,0,NULL,'880e2c88-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (17,'FLD0000000017','Yahoo','user','YAHOO_ID','',NULL,1,NULL,0,NULL,'880e3e76-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (18,'FLD0000000018','Yahoo oauth','user','YAHOO_OAUTH_ID','',NULL,1,NULL,0,NULL,'880e4e84-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (19,'FLD0000000019','Enabled?','user','IS_ENABLED','',NULL,1,NULL,0,NULL,'880e5ee4-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (20,'FLD0000000020','Creation date','user','CREATION_DATE','',NULL,1,NULL,0,NULL,'880e6e83-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (21,'FLD0000000021','Latest login','user','LATEST_LOGIN','',NULL,1,NULL,0,NULL,'880e7e6f-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (22,'FLD0000000022','Refid','field','REFID','',NULL,1,NULL,0,NULL,'880e9095-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (23,'FLD0000000023','Name','field','NAME','',NULL,1,NULL,0,NULL,'880e9fcd-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (24,'FLD0000000024','Module','field','MODULE','',NULL,1,NULL,0,NULL,'880eaef5-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (25,'FLD0000000025','Column','field','COLUMN','',NULL,1,NULL,0,NULL,'880ebe3e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (26,'FLD0000000026','Tooltip','field','TOOLTIP','',NULL,1,NULL,0,NULL,'880ecd80-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (27,'FLD0000000027','Excluded?','field','IS_EXCLUDED','',NULL,1,NULL,0,NULL,'880edd9b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (28,'FLD0000000028','Refid','option','REFID','',NULL,1,NULL,0,NULL,'880eef44-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (29,'FLD0000000029','Name','option','NAME','',NULL,1,NULL,0,NULL,'880efe9a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (30,'FLD0000000030','Code','option','CODE','This is an edit-once field. Its value cannot be modified afterward.',NULL,1,NULL,0,NULL,'880f0de8-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (31,'FLD0000000031','Value','option','VALUE','',NULL,1,NULL,0,NULL,'880f1ca9-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (32,'FLD0000000032','Context','option','CONTEXT','',NULL,1,NULL,0,NULL,'880f2be6-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (33,'FLD0000000033','Refid','userlog','REFID','',NULL,1,NULL,0,NULL,'880f3da5-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (34,'FLD0000000034','User','userlog','ID_USER','',NULL,1,NULL,0,NULL,'880f4cf7-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (35,'FLD0000000035','Date time','userlog','DATE_TIME','',NULL,1,NULL,0,NULL,'880f5c89-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (36,'FLD0000000036','IP','userlog','IP','',NULL,1,NULL,0,NULL,'880f6cc7-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (37,'FLD0000000037','Refid','acltype','REFID','',NULL,1,NULL,0,NULL,'881b4800-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (38,'FLD0000000038','Name','acltype','NAME','',NULL,1,NULL,0,NULL,'881b6bf5-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (39,'FLD0000000039','Ordering','acltype','ORDERING','',NULL,1,NULL,0,NULL,'881b8ed0-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (40,'FLD0000000040','Refid','userrole','REFID','',NULL,1,NULL,0,NULL,'881bb86a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (41,'FLD0000000041','Name','userrole','NAME','',NULL,1,NULL,0,NULL,'881bdb9a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (42,'FLD0000000042','Refid','parameter','REFID','',NULL,1,NULL,0,NULL,'881c02c4-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (43,'FLD0000000043','Name','parameter','NAME','',NULL,1,NULL,0,NULL,'881c252b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (44,'FLD0000000044','Code','parameter','CODE','This is an edit-once field. Its value cannot be modified afterward.',NULL,1,NULL,0,NULL,'881c47f8-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (45,'FLD0000000045','Parameter group','parameter','ID_PARAMETER_GROUP','',NULL,1,NULL,0,NULL,'881c6c58-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (46,'FLD0000000046','Parameter type','parameter','ID_PARAMETER_TYPE','',NULL,1,NULL,0,NULL,'881c8fee-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (47,'FLD0000000047','Value','parameter','VALUE','',NULL,1,NULL,0,NULL,'881cb2da-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (48,'FLD0000000048','Description','parameter','DESCRIPTION','',NULL,1,NULL,0,NULL,'881cd657-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (49,'FLD0000000049','Refid','dashboard','REFID','',NULL,1,NULL,0,NULL,'881cfd89-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (50,'FLD0000000050','Name','dashboard','NAME','',NULL,1,NULL,0,NULL,'881d21ba-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (51,'FLD0000000051','Admin menu','dashboard','ID_ADMIN_MENU','',NULL,1,NULL,0,NULL,'881d43dc-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (52,'FLD0000000052','Dashboard layout','dashboard','ID_DASHBOARD_LAYOUT','',NULL,1,NULL,0,NULL,'881d63c6-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (53,'FLD0000000053','Dashboard file path','dashboard','DASHBOARD_FILE_PATH','',NULL,1,NULL,0,NULL,'881d88bb-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (54,'FLD0000000054','Refid','fieldacl','REFID','',NULL,1,NULL,0,NULL,'881dad06-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (55,'FLD0000000055','Module','fieldacl','MODULE','',NULL,1,NULL,0,NULL,'881dcd63-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (56,'FLD0000000056','Action','fieldacl','ACTION','',NULL,1,NULL,0,NULL,'881ded3b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (57,'FLD0000000057','User group','fieldacl','ID_USER_GROUP','',NULL,1,NULL,0,NULL,'881e0e48-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (58,'FLD0000000058','User','fieldacl','ID_USER','',NULL,1,NULL,0,NULL,'881e2e58-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (59,'FLD0000000059','Fields','fieldacl','FIELDS','',NULL,1,NULL,0,NULL,'881e4e8e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (60,'FLD0000000060','Acl type','fieldacl','ID_ACL_TYPE','',NULL,1,NULL,0,NULL,'881e6eab-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (61,'FLD0000000061','Refid','changelog','REFID','',NULL,1,NULL,0,NULL,'881e93c7-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (62,'FLD0000000062','Action','changelog','ACTION','',NULL,1,NULL,0,NULL,'881eb0a2-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (63,'FLD0000000063','Item','changelog','ITEM','',NULL,1,NULL,0,NULL,'881ed1e2-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (64,'FLD0000000064','Module','changelog','MODULE','',NULL,1,NULL,0,NULL,'881ef1e5-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (65,'FLD0000000065','Date time','changelog','DATE_TIME','',NULL,1,NULL,0,NULL,'881f10ce-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (66,'FLD0000000066','User','changelog','ID_USER','',NULL,1,NULL,0,NULL,'881f30bc-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (67,'FLD0000000067','Details','changelog','DETAILS','',NULL,1,NULL,0,NULL,'881f50fb-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (68,'FLD0000000068','Refid','usergroup','REFID','',NULL,1,NULL,0,NULL,'881f7556-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (69,'FLD0000000069','Name','usergroup','NAME','',NULL,1,NULL,0,NULL,'881f961a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (70,'FLD0000000070','Default dashboard','usergroup','DEFAULT_ID_DASHBOARD','',NULL,1,NULL,0,NULL,'881fb73c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (71,'FLD0000000071','Parent','usergroup','PARENT','',NULL,1,NULL,0,NULL,'881fd750-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (72,'FLD0000000072','Refid','objectacl','REFID','',NULL,1,NULL,0,NULL,'881ffca8-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (73,'FLD0000000073','Module','objectacl','MODULE','',NULL,1,NULL,0,NULL,'88201cde-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (74,'FLD0000000074','Object','objectacl','OBJECT_ID','',NULL,1,NULL,0,NULL,'88203eeb-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (75,'FLD0000000075','User group','objectacl','ID_USER_GROUP','',NULL,1,NULL,0,NULL,'88206023-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (76,'FLD0000000076','User','objectacl','ID_USER','',NULL,1,NULL,0,NULL,'88208026-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (77,'FLD0000000077','Arg user group','objectacl','ARG_ID_USER_GROUP','',NULL,1,NULL,0,NULL,'8820a18c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (78,'FLD0000000078','Arg user','objectacl','ARG_ID_USER','',NULL,1,NULL,0,NULL,'8820c1f6-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (79,'FLD0000000079','Acl type','objectacl','ID_ACL_TYPE','',NULL,1,NULL,0,NULL,'8820e24f-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (80,'FLD0000000080','Refid','adminmenu','REFID','',NULL,1,NULL,0,NULL,'882106c0-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (81,'FLD0000000081','Name','adminmenu','NAME','',NULL,1,NULL,0,NULL,'882126b2-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (82,'FLD0000000082','Ordering','adminmenu','ORDERING','',NULL,1,NULL,0,NULL,'882146cf-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (83,'FLD0000000083','Enabled?','adminmenu','IS_ENABLED','',NULL,1,NULL,0,NULL,'88216bbb-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (84,'FLD0000000084','Title','adminview','TITLE','',NULL,1,NULL,0,NULL,'88218e96-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (85,'FLD0000000085','Code','adminview','CODE','This is an edit-once field. Its value cannot be modified afterward.',NULL,1,NULL,0,NULL,'8821b056-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (86,'FLD0000000086','Module','adminview','MODULE','',NULL,1,NULL,0,NULL,'8821c803-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (87,'FLD0000000087','Screen','adminview','SCREEN','',NULL,1,NULL,0,NULL,'8821e265-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (88,'FLD0000000088','Condition field','adminview','CONDITION_FIELD','',NULL,1,NULL,0,NULL,'8821fa8e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (89,'FLD0000000089','Condition value','adminview','CONDITION_VALUE','',NULL,1,NULL,0,NULL,'88221509-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (90,'FLD0000000090','Template','adminview','TEMPLATE','',NULL,1,NULL,0,NULL,'88222e91-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (91,'FLD0000000091','Print view?','adminview','IS_PRINT_VIEW','',NULL,1,NULL,0,NULL,'882249fc-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (92,'FLD0000000092','Ordering','adminview','ORDERING','',NULL,1,NULL,0,NULL,'882263b2-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (93,'FLD0000000093','Refid','adminlabel','REFID','',NULL,1,NULL,0,NULL,'88227fe2-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (94,'FLD0000000094','Label','adminlabel','LABEL','',NULL,1,NULL,0,NULL,'8822996a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (95,'FLD0000000095','Refid','recyclebin','REFID','',NULL,1,NULL,0,NULL,'8822b2dc-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (96,'FLD0000000096','Item','recyclebin','ITEM','',NULL,1,NULL,0,NULL,'8822cbc1-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (97,'FLD0000000097','Module','recyclebin','MODULE','',NULL,1,NULL,0,NULL,'8822e462-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (98,'FLD0000000098','Date time','recyclebin','DATE_TIME','',NULL,1,NULL,0,NULL,'8822fe2e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (99,'FLD0000000099','User','recyclebin','ID_USER','',NULL,1,NULL,0,NULL,'882317c7-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (100,'FLD0000000100','Refid','accessright','REFID','',NULL,1,NULL,0,NULL,'88233444-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (101,'FLD0000000101','User group','accessright','ID_USER_GROUP','',NULL,1,NULL,0,NULL,'88234ef2-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (102,'FLD0000000102','Module','accessright','MODULE','',NULL,1,NULL,0,NULL,'8823685c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (103,'FLD0000000103','Actions','accessright','ACTIONS','',NULL,1,NULL,0,NULL,'882381c6-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (104,'FLD0000000104','Refid','adminmodule','REFID','',NULL,1,NULL,0,NULL,'88239da0-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (105,'FLD0000000105','Name','adminmodule','NAME','',NULL,1,NULL,0,NULL,'8823b73d-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (106,'FLD0000000106','Module','adminmodule','MODULE','',NULL,1,NULL,0,NULL,'8823d10d-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (107,'FLD0000000107','Prefix','adminmodule','PREFIX','',NULL,1,NULL,0,NULL,'8823eaf3-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (108,'FLD0000000108','Available actions','adminmodule','AVAILABLE_ACTIONS','',NULL,1,NULL,0,NULL,'88240495-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (109,'FLD0000000109','Comment enabled?','adminmodule','IS_COMMENT_ENABLED','',NULL,1,NULL,0,NULL,'88241fa6-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (110,'FLD0000000110','Refid','adminlanguage','REFID','',NULL,1,NULL,0,NULL,'88243bf8-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (111,'FLD0000000111','Name','adminlanguage','NAME','',NULL,1,NULL,0,NULL,'8824556a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (112,'FLD0000000112','Code','adminlanguage','CODE','',NULL,1,NULL,0,NULL,'88246ee9-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (113,'FLD0000000113','Refid','parametertype','REFID','',NULL,1,NULL,0,NULL,'88248b80-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (114,'FLD0000000114','Name','parametertype','NAME','',NULL,1,NULL,0,NULL,'8824a4d4-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (115,'FLD0000000115','Base type code','parametertype','BASE_TYPE_CODE','',NULL,1,NULL,0,NULL,'8824bf76-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (116,'FLD0000000116','Extra','parametertype','EXTRA','',NULL,1,NULL,0,NULL,'8824d924-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (117,'FLD0000000117','Ordering','parametertype','ORDERING','',NULL,1,NULL,0,NULL,'8824f31b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (118,'FLD0000000118','Refid','usermembership','REFID','',NULL,1,NULL,0,NULL,'88250f8b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (119,'FLD0000000119','User','usermembership','ID_USER','',NULL,1,NULL,0,NULL,'88252745-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (120,'FLD0000000120','User group','usermembership','ID_USER_GROUP','',NULL,1,NULL,0,NULL,'882540f3-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (121,'FLD0000000121','User role','usermembership','ID_USER_ROLE','',NULL,1,NULL,0,NULL,'88255a69-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (122,'FLD0000000122','Valid from','usermembership','VALID_FROM','',NULL,1,NULL,0,NULL,'8825748b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (123,'FLD0000000123','Valid until','usermembership','VALID_UNTIL','',NULL,1,NULL,0,NULL,'88258ecf-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (124,'FLD0000000124','Refid','userpreference','REFID','',NULL,1,NULL,0,NULL,'8825ab3a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (125,'FLD0000000125','User','userpreference','ID_USER','',NULL,1,NULL,0,NULL,'8825c4f5-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (126,'FLD0000000126','Dashboard','userpreference','ID_DASHBOARD','',NULL,1,NULL,0,NULL,'8825ded3-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (127,'FLD0000000127','Wallpaper','userpreference','ID_WALLPAPER','',NULL,1,NULL,0,NULL,'8825f896-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (128,'FLD0000000128','Admin style','userpreference','ID_ADMIN_STYLE','',NULL,1,NULL,0,NULL,'8826129a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (129,'FLD0000000129','Refid','parametergroup','REFID','',NULL,1,NULL,0,NULL,'88262ec5-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (130,'FLD0000000130','Name','parametergroup','NAME','',NULL,1,NULL,0,NULL,'88264784-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (131,'FLD0000000131','Ordering','parametergroup','ORDERING','',NULL,1,NULL,0,NULL,'882663d6-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (132,'FLD0000000132','Refid','adminmenuitem','REFID','',NULL,1,NULL,0,NULL,'8826810f-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (133,'FLD0000000133','Name','adminmenuitem','NAME','',NULL,1,NULL,0,NULL,'88269c24-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (134,'FLD0000000134','Admin menu','adminmenuitem','ID_ADMIN_MENU','',NULL,1,NULL,0,NULL,'8826b6b5-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (135,'FLD0000000135','Parent','adminmenuitem','PARENT','',NULL,1,NULL,0,NULL,'8826d0ca-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (136,'FLD0000000136','Module','adminmenuitem','MODULE','',NULL,1,NULL,0,NULL,'8826eb9b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (137,'FLD0000000137','Path','adminmenuitem','PATH','',NULL,1,NULL,0,NULL,'88270612-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (138,'FLD0000000138','Font awesome icon','adminmenuitem','FONT_AWESOME_ICON','',NULL,1,NULL,0,NULL,'8827219b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (139,'FLD0000000139','Enable left?','adminmenuitem','ENABLE_LEFT','',NULL,1,NULL,0,NULL,'88273cdc-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (140,'FLD0000000140','Enable top?','adminmenuitem','ENABLE_TOP','',NULL,1,NULL,0,NULL,'882757e4-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (141,'FLD0000000141','Enable quick?','adminmenuitem','ENABLE_QUICK','',NULL,1,NULL,0,NULL,'882773a0-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (142,'FLD0000000142','Enable all?','adminmenuitem','ENABLE_ALL','',NULL,1,NULL,0,NULL,'88278f47-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (143,'FLD0000000143','Enable settings?','adminmenuitem','ENABLE_SETTINGS','',NULL,1,NULL,0,NULL,'8827ab15-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (144,'FLD0000000144','Open in new window','adminmenuitem','OPEN_IN_NEW_WINDOW','',NULL,1,NULL,0,NULL,'8827c68d-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (145,'FLD0000000145','Starred?','adminmenuitem','IS_STARRED','',NULL,1,NULL,0,NULL,'8827e3f9-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (146,'FLD0000000146','Ordering','adminmenuitem','ORDERING','',NULL,1,NULL,0,NULL,'8827f846-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (147,'FLD0000000147','Refid','adminlanguageitem','REFID','',NULL,1,NULL,0,NULL,'8828130e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (148,'FLD0000000148','Admin language','adminlanguageitem','ID_ADMIN_LANGUAGE','',NULL,1,NULL,0,NULL,'88282c09-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (149,'FLD0000000149','Admin label','adminlanguageitem','ID_ADMIN_LABEL','',NULL,1,NULL,0,NULL,'882847a7-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (150,'FLD0000000150','Translation','adminlanguageitem','TRANSLATION','',NULL,1,NULL,0,NULL,'882861eb-1a1a-11e5-b2f8-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (172,'FLD0000000151','Json','user','JSON','',NULL,1,NULL,0,NULL,'c8240399-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (179,'FLD0000000152','Json','field','JSON','',NULL,1,NULL,0,NULL,'c8345eae-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (180,'FLD0000000153','Refid','screen','REFID','',NULL,1,NULL,0,NULL,'c83481f7-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (181,'FLD0000000154','Title','screen','TITLE','',NULL,1,NULL,0,NULL,'c834b7de-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (182,'FLD0000000155','Workflow','screen','ID_WORKFLOW','',NULL,1,NULL,0,NULL,'c834d9fc-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (183,'FLD0000000156','Code','screen','CODE','This is an edit-once field. Its value cannot be modified afterward.',NULL,1,NULL,0,NULL,'c834fe71-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (189,'FLD0000000157','Json','option','JSON','',NULL,1,NULL,0,NULL,'c835fdb5-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (193,'FLD0000000158','Json','acltype','JSON','',NULL,1,NULL,0,NULL,'c8369670-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (194,'FLD0000000159','Refid','workflow','REFID','',NULL,1,NULL,0,NULL,'c836bb94-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (195,'FLD0000000160','Name','workflow','NAME','',NULL,1,NULL,0,NULL,'c836dd50-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (196,'FLD0000000161','Code','workflow','CODE','This is an edit-once field. Its value cannot be modified afterward.',NULL,1,NULL,0,NULL,'c8370238-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (197,'FLD0000000162','Description','workflow','DESCRIPTION','',NULL,1,NULL,0,NULL,'c837250e-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (198,'FLD0000000163','Json','workflow','JSON','',NULL,1,NULL,0,NULL,'c8374c74-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (203,'FLD0000000164','Json','userlog','JSON','',NULL,1,NULL,0,NULL,'c8380393-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (211,'FLD0000000165','Json','parameter','JSON','',NULL,1,NULL,0,NULL,'c8392b5c-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (214,'FLD0000000166','Json','userrole','JSON','',NULL,1,NULL,0,NULL,'c8399ac9-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (220,'FLD0000000167','Json','dashboard','JSON','',NULL,1,NULL,0,NULL,'c83a7587-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (228,'FLD0000000168','Json','fieldacl','JSON','',NULL,1,NULL,0,NULL,'c83b9ff7-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (229,'FLD0000000169','Refid','valuetype','REFID','',NULL,1,NULL,0,NULL,'c83bc122-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (230,'FLD0000000170','Name','valuetype','NAME','',NULL,1,NULL,0,NULL,'c83be2ae-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (231,'FLD0000000171','Code','valuetype','CODE','This is an edit-once field. Its value cannot be modified afterward.',NULL,1,NULL,0,NULL,'c83c047b-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (240,'FLD0000000172','Json','objectacl','JSON','',NULL,1,NULL,0,NULL,'c83d552f-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (241,'FLD0000000173','Refid','adminview','REFID','',NULL,1,NULL,0,NULL,'c83d7881-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (251,'FLD0000000174','Json','adminview','JSON','',NULL,1,NULL,0,NULL,'c83ef4ae-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (256,'FLD0000000175','Json','adminmenu','JSON','',NULL,1,NULL,0,NULL,'c83faee0-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (264,'FLD0000000176','Json','changelog','JSON','',NULL,1,NULL,0,NULL,'c840d501-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (269,'FLD0000000177','Json','usergroup','JSON','',NULL,1,NULL,0,NULL,'c8418e19-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (275,'FLD0000000178','Json','recyclebin','JSON','',NULL,1,NULL,0,NULL,'c8426dc5-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (278,'FLD0000000179','Json','adminlabel','JSON','',NULL,1,NULL,0,NULL,'c842db97-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (279,'FLD0000000180','Refid','adminfilter','REFID','',NULL,1,NULL,0,NULL,'c842ffff-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (280,'FLD0000000181','Name','adminfilter','NAME','',NULL,1,NULL,0,NULL,'c84322a2-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (281,'FLD0000000182','Module','adminfilter','MODULE','',NULL,1,NULL,0,NULL,'c8434478-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (282,'FLD0000000183','Columns','adminfilter','COLUMNS','',NULL,1,NULL,0,NULL,'c8436727-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (283,'FLD0000000184','Default?','adminfilter','IS_DEFAULT','',NULL,1,NULL,0,NULL,'c8438a60-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (284,'FLD0000000185','Refid','screenfield','REFID','',NULL,1,NULL,0,NULL,'c843ae83-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (285,'FLD0000000186','Screen','screenfield','ID_SCREEN','',NULL,1,NULL,0,NULL,'c843d066-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (286,'FLD0000000187','Title','screenfield','TITLE','',NULL,1,NULL,0,NULL,'c843f255-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (287,'FLD0000000188','Code','screenfield','CODE','This is an edit-once field. Its value cannot be modified afterward.',NULL,1,NULL,0,NULL,'c84415fd-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (288,'FLD0000000189','Value type','screenfield','ID_VALUE_TYPE','',NULL,1,NULL,0,NULL,'c84439ba-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (289,'FLD0000000190','Datasource','screenfield','DATASOURCE','',NULL,1,NULL,0,NULL,'c8445cf2-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (290,'FLD0000000191','Condition','screenfield','CONDITION','',NULL,1,NULL,0,NULL,'c8447db2-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (291,'FLD0000000192','Valuecol','screenfield','VALUECOL','',NULL,1,NULL,0,NULL,'c844a032-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (292,'FLD0000000193','Textcol','screenfield','TEXTCOL','',NULL,1,NULL,0,NULL,'c844c087-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (293,'FLD0000000194','Mandatory?','screenfield','IS_MANDATORY','',NULL,1,NULL,0,NULL,'c844e1be-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (294,'FLD0000000195','Ordering','screenfield','ORDERING','',NULL,1,NULL,0,NULL,'c84501bd-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (299,'FLD0000000196','Json','accessright','JSON','',NULL,1,NULL,0,NULL,'c845c233-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (300,'FLD0000000197','Workflow','workflowlog','ID_WORKFLOW','',NULL,1,NULL,0,NULL,'c845e3d9-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (301,'FLD0000000198','Workflow transition','workflowlog','ID_WORKFLOW_TRANSITION','',NULL,1,NULL,0,NULL,'c84606fc-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (302,'FLD0000000199','Module','workflowlog','MODULE','',NULL,1,NULL,0,NULL,'c8462885-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (303,'FLD0000000200','Object','workflowlog','OBJECT_ID','',NULL,1,NULL,0,NULL,'c846453d-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (304,'FLD0000000201','Date','workflowlog','DATE','',NULL,1,NULL,0,NULL,'c8466017-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (305,'FLD0000000202','User','workflowlog','ID_USER','',NULL,1,NULL,0,NULL,'c8467c18-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (306,'FLD0000000203','Details','workflowlog','DETAILS','',NULL,1,NULL,0,NULL,'c8469a44-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (313,'FLD0000000204','Json','adminmodule','JSON','',NULL,1,NULL,0,NULL,'c8479f48-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (314,'FLD0000000205','Refid','workflowstage','REFID','',NULL,1,NULL,0,NULL,'c847c3df-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (315,'FLD0000000206','Workflow','workflowstage','ID_WORKFLOW','',NULL,1,NULL,0,NULL,'c847e64f-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (316,'FLD0000000207','Name','workflowstage','NAME','',NULL,1,NULL,0,NULL,'c8480853-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (317,'FLD0000000208','Code','workflowstage','CODE','This is an edit-once field. Its value cannot be modified afterward.',NULL,1,NULL,0,NULL,'c8482a4f-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (318,'FLD0000000209','Default?','workflowstage','IS_DEFAULT','',NULL,1,NULL,0,NULL,'c8484eb7-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (319,'FLD0000000210','Binding object editable?','workflowstage','IS_BINDING_OBJECT_EDITABLE','',NULL,1,NULL,0,NULL,'c848744f-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (320,'FLD0000000211','Binding object deletable?','workflowstage','IS_BINDING_OBJECT_DELETABLE','',NULL,1,NULL,0,NULL,'c8489a49-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (324,'FLD0000000212','Json','adminlanguage','JSON','',NULL,1,NULL,0,NULL,'c8492526-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (330,'FLD0000000213','Json','parametertype','JSON','',NULL,1,NULL,0,NULL,'c84a040d-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (336,'FLD0000000214','Json','userpreference','JSON','',NULL,1,NULL,0,NULL,'c84ae2a7-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (340,'FLD0000000215','Json','parametergroup','JSON','',NULL,1,NULL,0,NULL,'c84b74aa-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (347,'FLD0000000216','Json','usermembership','JSON','',NULL,1,NULL,0,NULL,'c84c7c00-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (363,'FLD0000000217','Json','adminmenuitem','JSON','',NULL,1,NULL,0,NULL,'c84ee009-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (364,'FLD0000000218','Refid','adminlayoutfield','REFID','',NULL,1,NULL,0,NULL,'c84f04fe-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (365,'FLD0000000219','Module','adminlayoutfield','MODULE','',NULL,1,NULL,0,NULL,'c84f26cf-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (366,'FLD0000000220','Admin layout section','adminlayoutfield','ID_ADMIN_LAYOUT_SECTION','',NULL,1,NULL,0,NULL,'c84f4b26-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (367,'FLD0000000221','Column','adminlayoutfield','COLUMN','',NULL,1,NULL,0,NULL,'c84f6f46-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (368,'FLD0000000222','Position','adminlayoutfield','POSITION','',NULL,1,NULL,0,NULL,'c84f8f89-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (369,'FLD0000000223','Ordering','adminlayoutfield','ORDERING','',NULL,1,NULL,0,NULL,'c84fb275-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (370,'FLD0000000224','Refid','workflowtransition','REFID','',NULL,1,NULL,0,NULL,'c84fd6c8-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (371,'FLD0000000225','Workflow','workflowtransition','ID_WORKFLOW','',NULL,1,NULL,0,NULL,'c84ff908-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (372,'FLD0000000226','Name','workflowtransition','NAME','',NULL,1,NULL,0,NULL,'c8501b0d-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (373,'FLD0000000227','Start workflow stage','workflowtransition','START_ID_WORKFLOW_STAGE','',NULL,1,NULL,0,NULL,'c8503f1f-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (374,'FLD0000000228','End workflow stage','workflowtransition','END_ID_WORKFLOW_STAGE','',NULL,1,NULL,0,NULL,'c850634b-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (375,'FLD0000000229','Action','workflowtransition','ACTION','',NULL,1,NULL,0,NULL,'c8508559-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (376,'FLD0000000230','User group','workflowtransition','ID_USER_GROUP','',NULL,1,NULL,0,NULL,'c850a7fb-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (377,'FLD0000000231','User role','workflowtransition','ID_USER_ROLE','',NULL,1,NULL,0,NULL,'c850cb41-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (378,'FLD0000000232','Transition screen','workflowtransition','TRANSITION_ID_SCREEN','',NULL,1,NULL,0,NULL,'c850eb88-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (383,'FLD0000000233','Json','adminlanguageitem','JSON','',NULL,1,NULL,0,NULL,'c8519a73-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (384,'FLD0000000234','Refid','workflowapplication','REFID','',NULL,1,NULL,0,NULL,'c851bb91-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (385,'FLD0000000235','Module','workflowapplication','MODULE','',NULL,1,NULL,0,NULL,'c851db20-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (386,'FLD0000000236','Workflow','workflowapplication','ID_WORKFLOW','',NULL,1,NULL,0,NULL,'c851fb2c-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (387,'FLD0000000237','Refid','adminlayoutsection','REFID','',NULL,1,NULL,0,NULL,'c8521bfd-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (388,'FLD0000000238','Name','adminlayoutsection','NAME','',NULL,1,NULL,0,NULL,'c8523b99-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (389,'FLD0000000239','Module','adminlayoutsection','MODULE','',NULL,1,NULL,0,NULL,'c8525bd9-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (390,'FLD0000000240','Show title','adminlayoutsection','SHOW_TITLE','',NULL,1,NULL,0,NULL,'c8527698-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (391,'FLD0000000241','Ordering','adminlayoutsection','ORDERING','',NULL,1,NULL,0,NULL,'c85290b6-1a1b-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (425,'FLD0000000242','Json','screen','JSON','',NULL,1,NULL,0,NULL,'8b4459c0-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (493,'FLD0000000243','Json','valuetype','JSON','',NULL,1,NULL,0,NULL,'8b504f02-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (527,'FLD0000000244','Json','adminfilter','JSON','',NULL,1,NULL,0,NULL,'8b5442e7-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (539,'FLD0000000245','Json','screenfield','JSON','',NULL,1,NULL,0,NULL,'8b559798-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (540,'FLD0000000246','Refid','workflowlog','REFID','',NULL,1,NULL,0,NULL,'8b55b505-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (548,'FLD0000000247','Json','workflowlog','JSON','',NULL,1,NULL,0,NULL,'8b56963a-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (568,'FLD0000000248','Json','workflowstage','JSON','',NULL,1,NULL,0,NULL,'8b58d422-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (579,'FLD0000000249','Module','adminsequence','MODULE','',NULL,1,NULL,0,NULL,'8b5a1217-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (580,'FLD0000000250','Sequence format','adminsequence','SEQUENCE_FORMAT','',NULL,1,NULL,0,NULL,'8b5a264e-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (581,'FLD0000000251','Current value','adminsequence','CURRENT_VALUE','',NULL,1,NULL,0,NULL,'8b5a4123-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (582,'FLD0000000252','Sequence step','adminsequence','SEQUENCE_STEP','',NULL,1,NULL,0,NULL,'8b5a5c39-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (622,'FLD0000000253','Json','adminlayoutfield','JSON','',NULL,1,NULL,0,NULL,'8b5eec38-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (632,'FLD0000000254','Json','workflowtransition','JSON','',NULL,1,NULL,0,NULL,'8b6016d3-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (641,'FLD0000000255','Json','workflowapplication','JSON','',NULL,1,NULL,0,NULL,'8b6123f5-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (647,'FLD0000000256','Json','adminlayoutsection','JSON','',NULL,1,NULL,0,NULL,'8b61db21-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (835,'FLD0000000257','Refid','adminsequence','REFID','',NULL,1,NULL,0,NULL,'81e71001-1a1e-11e5-aee6-cc52af77857f');
insert  into `FIELD`(`ID`,`REFID`,`NAME`,`MODULE`,`COLUMN`,`TOOLTIP`,`IS_EXCLUDED`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (840,'FLD0000000258','Json','adminsequence','JSON','',NULL,1,NULL,0,NULL,'81e75862-1a1e-11e5-aee6-cc52af77857f');

/*Table structure for table `FIELD_ACL` */

DROP TABLE IF EXISTS `FIELD_ACL`;

CREATE TABLE `FIELD_ACL` (
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
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `FIELD_ACL` */

insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'FLA0000000001','user','view',2,NULL,'*',1,1,NULL,0,NULL,'b458a6e3-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2,'FLA0000000002','user','edit',2,NULL,'*',1,1,NULL,0,NULL,'b458b7e1-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (3,'FLA0000000003','user','new',2,NULL,'*',1,1,NULL,0,NULL,'b458c4be-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (4,'FLA0000000004','field','view',2,NULL,'*',1,1,NULL,0,NULL,'b458d0f0-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (5,'FLA0000000005','field','edit',2,NULL,'*',1,1,NULL,0,NULL,'b458dca3-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (6,'FLA0000000006','field','new',2,NULL,'*',1,1,NULL,0,NULL,'b458e8d9-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (7,'FLA0000000007','screen','view',2,NULL,'*',1,1,NULL,0,NULL,'b458f476-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (8,'FLA0000000008','screen','edit',2,NULL,'*',1,1,NULL,0,NULL,'b458ffe8-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (9,'FLA0000000009','screen','new',2,NULL,'*',1,1,NULL,0,NULL,'b4590b56-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (10,'FLA0000000010','option','view',2,NULL,'*',1,1,NULL,0,NULL,'b4591672-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (11,'FLA0000000011','option','edit',2,NULL,'*',1,1,NULL,0,NULL,'b4592206-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (12,'FLA0000000012','option','new',2,NULL,'*',1,1,NULL,0,NULL,'b4592d6b-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (13,'FLA0000000013','acltype','view',2,NULL,'*',1,1,NULL,0,NULL,'b45938ea-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (14,'FLA0000000014','acltype','edit',2,NULL,'*',1,1,NULL,0,NULL,'b4594460-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (15,'FLA0000000015','acltype','new',2,NULL,'*',1,1,NULL,0,NULL,'b4595034-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (16,'FLA0000000016','workflow','view',2,NULL,'*',1,1,NULL,0,NULL,'b4595b7c-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (17,'FLA0000000017','workflow','edit',2,NULL,'*',1,1,NULL,0,NULL,'b4596703-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (18,'FLA0000000018','workflow','new',2,NULL,'*',1,1,NULL,0,NULL,'b4597313-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (19,'FLA0000000019','userlog','view',2,NULL,'*',1,1,NULL,0,NULL,'b4597e74-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (20,'FLA0000000020','userlog','edit',2,NULL,'*',1,1,NULL,0,NULL,'b4598a48-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (21,'FLA0000000021','userlog','new',2,NULL,'*',1,1,NULL,0,NULL,'b45996dd-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (22,'FLA0000000022','parameter','view',2,NULL,'*',1,1,NULL,0,NULL,'b459a2d8-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (23,'FLA0000000023','parameter','edit',2,NULL,'*',1,1,NULL,0,NULL,'b459aec6-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (24,'FLA0000000024','parameter','new',2,NULL,'*',1,1,NULL,0,NULL,'b459ba6b-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (25,'FLA0000000025','userrole','view',2,NULL,'*',1,1,NULL,0,NULL,'b459c6a6-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (26,'FLA0000000026','userrole','edit',2,NULL,'*',1,1,NULL,0,NULL,'b459d3bf-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (27,'FLA0000000027','userrole','new',2,NULL,'*',1,1,NULL,0,NULL,'b459dfe9-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (28,'FLA0000000028','dashboard','view',2,NULL,'*',1,1,NULL,0,NULL,'b459ec53-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (29,'FLA0000000029','dashboard','edit',2,NULL,'*',1,1,NULL,0,NULL,'b459f886-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (30,'FLA0000000030','dashboard','new',2,NULL,'*',1,1,NULL,0,NULL,'b45a070b-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (31,'FLA0000000031','fieldacl','view',2,NULL,'*',1,1,NULL,0,NULL,'b45a141b-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (32,'FLA0000000032','fieldacl','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45a205b-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (33,'FLA0000000033','fieldacl','new',2,NULL,'*',1,1,NULL,0,NULL,'b45a2c26-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (34,'FLA0000000034','adminmenu','view',2,NULL,'*',1,1,NULL,0,NULL,'b45a3919-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (35,'FLA0000000035','adminmenu','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45a4543-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (36,'FLA0000000036','adminmenu','new',2,NULL,'*',1,1,NULL,0,NULL,'b45a5176-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (37,'FLA0000000037','usergroup','view',2,NULL,'*',1,1,NULL,0,NULL,'b45a5e64-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (38,'FLA0000000038','usergroup','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45a6a7d-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (39,'FLA0000000039','usergroup','new',2,NULL,'*',1,1,NULL,0,NULL,'b45a76af-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (40,'FLA0000000040','objectacl','view',2,NULL,'*',1,1,NULL,0,NULL,'b45a88ae-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (41,'FLA0000000041','objectacl','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45a9d99-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (42,'FLA0000000042','objectacl','new',2,NULL,'*',1,1,NULL,0,NULL,'b45aaf46-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (43,'FLA0000000043','valuetype','view',2,NULL,'*',1,1,NULL,0,NULL,'b45abd43-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (44,'FLA0000000044','valuetype','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45ac9fa-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (45,'FLA0000000045','valuetype','new',2,NULL,'*',1,1,NULL,0,NULL,'b45ad6c6-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (46,'FLA0000000046','changelog','view',2,NULL,'*',1,1,NULL,0,NULL,'b45ae41b-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (47,'FLA0000000047','changelog','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45af067-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (48,'FLA0000000048','changelog','new',2,NULL,'*',1,1,NULL,0,NULL,'b45afce2-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (49,'FLA0000000049','adminview','view',2,NULL,'*',1,1,NULL,0,NULL,'b45b092e-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (50,'FLA0000000050','adminview','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45b1945-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (51,'FLA0000000051','adminview','new',2,NULL,'*',1,1,NULL,0,NULL,'b45b29d4-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (52,'FLA0000000052','recyclebin','view',2,NULL,'*',1,1,NULL,0,NULL,'b45b3736-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (53,'FLA0000000053','recyclebin','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45b4487-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (54,'FLA0000000054','recyclebin','new',2,NULL,'*',1,1,NULL,0,NULL,'b45b51d8-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (55,'FLA0000000055','adminlabel','view',2,NULL,'*',1,1,NULL,0,NULL,'b45b5ec7-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (56,'FLA0000000056','adminlabel','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45b6b9c-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (57,'FLA0000000057','adminlabel','new',2,NULL,'*',1,1,NULL,0,NULL,'b45b786d-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (58,'FLA0000000058','adminfilter','view',2,NULL,'*',1,1,NULL,0,NULL,'b45b8962-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (59,'FLA0000000059','adminfilter','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45b9986-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (60,'FLA0000000060','adminfilter','new',2,NULL,'*',1,1,NULL,0,NULL,'b45ba739-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (61,'FLA0000000061','screenfield','view',2,NULL,'*',1,1,NULL,0,NULL,'b45bb45b-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (62,'FLA0000000062','screenfield','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45bc1f1-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (63,'FLA0000000063','screenfield','new',2,NULL,'*',1,1,NULL,0,NULL,'b45bceec-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (64,'FLA0000000064','workflowlog','view',2,NULL,'*',1,1,NULL,0,NULL,'b45bdc52-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (65,'FLA0000000065','workflowlog','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45bea24-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (66,'FLA0000000066','workflowlog','new',2,NULL,'*',1,1,NULL,0,NULL,'b45bf70a-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (67,'FLA0000000067','accessright','view',2,NULL,'*',1,1,NULL,0,NULL,'b45c0434-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (68,'FLA0000000068','accessright','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45c1167-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (69,'FLA0000000069','accessright','new',2,NULL,'*',1,1,NULL,0,NULL,'b45c1e78-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (70,'FLA0000000070','adminmodule','view',2,NULL,'*',1,1,NULL,0,NULL,'b45c2bb4-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (71,'FLA0000000071','adminmodule','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45c3967-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (72,'FLA0000000072','adminmodule','new',2,NULL,'*',1,1,NULL,0,NULL,'b45c46f0-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (73,'FLA0000000073','workflowstage','view',2,NULL,'*',1,1,NULL,0,NULL,'b45c54e7-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (74,'FLA0000000074','workflowstage','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45c62ca-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (75,'FLA0000000075','workflowstage','new',2,NULL,'*',1,1,NULL,0,NULL,'b45c7070-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (76,'FLA0000000076','parametertype','view',2,NULL,'*',1,1,NULL,0,NULL,'b45c7e7e-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (77,'FLA0000000077','parametertype','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45c8c13-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (78,'FLA0000000078','parametertype','new',2,NULL,'*',1,1,NULL,0,NULL,'b45c9975-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (79,'FLA0000000079','adminlanguage','view',2,NULL,'*',1,1,NULL,0,NULL,'b45ca731-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (80,'FLA0000000080','adminlanguage','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45cb5b6-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (81,'FLA0000000081','adminlanguage','new',2,NULL,'*',1,1,NULL,0,NULL,'b45cc3ee-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (82,'FLA0000000082','adminsequence','view',2,NULL,'*',1,1,NULL,0,NULL,'b45cd1c8-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (83,'FLA0000000083','adminsequence','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45cdfc4-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (84,'FLA0000000084','adminsequence','new',2,NULL,'*',1,1,NULL,0,NULL,'b45cee2b-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (85,'FLA0000000085','userpreference','view',2,NULL,'*',1,1,NULL,0,NULL,'b45cfc8e-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (86,'FLA0000000086','userpreference','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45d0f33-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (87,'FLA0000000087','userpreference','new',2,NULL,'*',1,1,NULL,0,NULL,'b45d2304-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (88,'FLA0000000088','parametergroup','view',2,NULL,'*',1,1,NULL,0,NULL,'b45d3618-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (89,'FLA0000000089','parametergroup','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45d48ba-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (90,'FLA0000000090','parametergroup','new',2,NULL,'*',1,1,NULL,0,NULL,'b45d5c0e-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (91,'FLA0000000091','usermembership','view',2,NULL,'*',1,1,NULL,0,NULL,'b45d6ef0-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (92,'FLA0000000092','usermembership','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45d820d-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (93,'FLA0000000093','usermembership','new',2,NULL,'*',1,1,NULL,0,NULL,'b45d9604-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (94,'FLA0000000094','adminmenuitem','view',2,NULL,'*',1,1,NULL,0,NULL,'b45da96a-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (95,'FLA0000000095','adminmenuitem','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45dbc90-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (96,'FLA0000000096','adminmenuitem','new',2,NULL,'*',1,1,NULL,0,NULL,'b45dcfd8-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (97,'FLA0000000097','adminlayoutfield','view',2,NULL,'*',1,1,NULL,0,NULL,'b45de357-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (98,'FLA0000000098','adminlayoutfield','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45df6e4-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (99,'FLA0000000099','adminlayoutfield','new',2,NULL,'*',1,1,NULL,0,NULL,'b45e06e6-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (100,'FLA0000000100','workflowtransition','view',2,NULL,'*',1,1,NULL,0,NULL,'b45e19e5-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (101,'FLA0000000101','workflowtransition','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45e2e58-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (102,'FLA0000000102','workflowtransition','new',2,NULL,'*',1,1,NULL,0,NULL,'b45e3eab-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (103,'FLA0000000103','adminlanguageitem','view',2,NULL,'*',1,1,NULL,0,NULL,'b45e4e57-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (104,'FLA0000000104','adminlanguageitem','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45e5de1-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (105,'FLA0000000105','adminlanguageitem','new',2,NULL,'*',1,1,NULL,0,NULL,'b45e6d08-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (106,'FLA0000000106','workflowapplication','view',2,NULL,'*',1,1,NULL,0,NULL,'b45e7c56-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (107,'FLA0000000107','workflowapplication','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45e8c69-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (108,'FLA0000000108','workflowapplication','new',2,NULL,'*',1,1,NULL,0,NULL,'b45ea16e-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (109,'FLA0000000109','adminlayoutsection','view',2,NULL,'*',1,1,NULL,0,NULL,'b45eb3a4-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (110,'FLA0000000110','adminlayoutsection','edit',2,NULL,'*',1,1,NULL,0,NULL,'b45ec76d-1a1c-11e5-aee6-cc52af77857f');
insert  into `FIELD_ACL`(`ID`,`REFID`,`MODULE`,`ACTION`,`ID_USER_GROUP`,`ID_USER`,`FIELDS`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (111,'FLA0000000111','adminlayoutsection','new',2,NULL,'*',1,1,NULL,0,NULL,'b45ed9d6-1a1c-11e5-aee6-cc52af77857f');

/*Table structure for table `OBJECT_ACL` */

DROP TABLE IF EXISTS `OBJECT_ACL`;

CREATE TABLE `OBJECT_ACL` (
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
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `OBJECT_ACL` */

insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'OBA0000000001','user','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44dfc6a-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2,'OBA0000000002','user','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44e0d68-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (3,'OBA0000000003','field','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44e1a5f-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (4,'OBA0000000004','field','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44e2831-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (5,'OBA0000000005','screen','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44e341a-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (6,'OBA0000000006','screen','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44e3ff7-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (7,'OBA0000000007','option','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44e4b6d-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (8,'OBA0000000008','option','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44e54f8-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (9,'OBA0000000009','acltype','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44e5eb5-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (10,'OBA0000000010','acltype','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44e6833-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (11,'OBA0000000011','workflow','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44e71f1-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (12,'OBA0000000012','workflow','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44e7b9d-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (13,'OBA0000000013','userlog','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44e8541-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (14,'OBA0000000014','userlog','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44e8f25-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (15,'OBA0000000015','userlog','inherited',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44e9905-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (16,'OBA0000000016','parameter','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44ea2f6-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (17,'OBA0000000017','parameter','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44eacbc-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (18,'OBA0000000018','userrole','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44eb794-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (19,'OBA0000000019','userrole','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44ec196-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (20,'OBA0000000020','dashboard','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44ecba5-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (21,'OBA0000000021','dashboard','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44ed581-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (22,'OBA0000000022','fieldacl','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44edf6e-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (23,'OBA0000000023','fieldacl','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44ee974-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (24,'OBA0000000024','adminmenu','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44ef36d-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (25,'OBA0000000025','adminmenu','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44efd74-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (26,'OBA0000000026','usergroup','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44f07b2-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (27,'OBA0000000027','usergroup','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44f11ab-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (28,'OBA0000000028','objectacl','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44f1c03-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (29,'OBA0000000029','objectacl','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44f262c-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (30,'OBA0000000030','valuetype','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44f3072-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (31,'OBA0000000031','valuetype','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44f3aa7-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (32,'OBA0000000032','changelog','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44f4526-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (33,'OBA0000000033','changelog','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44f54f8-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (34,'OBA0000000034','adminview','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44f6885-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (35,'OBA0000000035','adminview','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44f7b84-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (36,'OBA0000000036','recyclebin','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44f8b79-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (37,'OBA0000000037','recyclebin','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44f98f9-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (38,'OBA0000000038','adminlabel','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44fa4ab-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (39,'OBA0000000039','adminlabel','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44fb061-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (40,'OBA0000000040','adminfilter','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44fbc3e-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (41,'OBA0000000041','adminfilter','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44fc7b4-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (42,'OBA0000000042','screenfield','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44fd3a2-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (43,'OBA0000000043','screenfield','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44fdf59-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (44,'OBA0000000044','screenfield','inherited',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b44feae8-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (45,'OBA0000000045','workflowlog','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b44ff6ce-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (46,'OBA0000000046','workflowlog','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b45002b3-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (47,'OBA0000000047','workflowlog','inherited',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b4500e4c-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (48,'OBA0000000048','accessright','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b4501a4b-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (49,'OBA0000000049','accessright','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b450260e-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (50,'OBA0000000050','adminmodule','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b45032b0-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (51,'OBA0000000051','adminmodule','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b4503f9e-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (52,'OBA0000000052','workflowstage','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b4504d09-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (53,'OBA0000000053','workflowstage','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b4505aeb-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (54,'OBA0000000054','workflowstage','inherited',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b4506892-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (55,'OBA0000000055','parametertype','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b4507580-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (56,'OBA0000000056','parametertype','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b4508280-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (57,'OBA0000000057','adminlanguage','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b4508f6f-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (58,'OBA0000000058','adminlanguage','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b4509bc3-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (59,'OBA0000000059','adminsequence','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b450a8a1-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (60,'OBA0000000060','adminsequence','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b450b5d8-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (61,'OBA0000000061','userpreference','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b450c293-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (62,'OBA0000000062','userpreference','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b450cf46-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (63,'OBA0000000063','userpreference','inherited',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b450e055-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (64,'OBA0000000064','parametergroup','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b450edcd-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (65,'OBA0000000065','parametergroup','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b450fb44-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (66,'OBA0000000066','usermembership','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b451083b-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (67,'OBA0000000067','usermembership','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b4511510-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (68,'OBA0000000068','usermembership','inherited',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b4512210-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (69,'OBA0000000069','adminmenuitem','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b45131da-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (70,'OBA0000000070','adminmenuitem','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b4513ff8-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (71,'OBA0000000071','adminmenuitem','inherited',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b4514df0-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (72,'OBA0000000072','adminlayoutfield','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b4515bc6-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (73,'OBA0000000073','adminlayoutfield','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b45169b9-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (74,'OBA0000000074','workflowtransition','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b4517793-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (75,'OBA0000000075','workflowtransition','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b451853a-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (76,'OBA0000000076','workflowtransition','inherited',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b45192fe-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (77,'OBA0000000077','adminlanguageitem','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b4577755-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (78,'OBA0000000078','adminlanguageitem','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b4578a88-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (79,'OBA0000000079','adminlanguageitem','inherited',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b4579ac9-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (80,'OBA0000000080','workflowapplication','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b457acfb-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (81,'OBA0000000081','workflowapplication','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b457bbd6-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (82,'OBA0000000082','workflowapplication','inherited',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b457cb71-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (83,'OBA0000000083','adminlayoutsection','*',NULL,1,NULL,NULL,1,1,NULL,0,NULL,'b457da32-1a1c-11e5-aee6-cc52af77857f');
insert  into `OBJECT_ACL`(`ID`,`REFID`,`MODULE`,`OBJECT_ID`,`ID_USER_GROUP`,`ID_USER`,`ARG_ID_USER_GROUP`,`ARG_ID_USER`,`ID_ACL_TYPE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (84,'OBA0000000084','adminlayoutsection','self',2,NULL,NULL,NULL,1,1,NULL,0,NULL,'b457e8ee-1a1c-11e5-aee6-cc52af77857f');

/*Table structure for table `OPTION` */

DROP TABLE IF EXISTS `OPTION`;

CREATE TABLE `OPTION` (
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
  UNIQUE KEY `uniquekey` (`CODE`,`CONTEXT`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `OPTION` */

insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'OPT0000000001','Site URL','site-url','http://www.yahoo.com',NULL,1,NULL,0,NULL,'066081d2-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2,'OPT0000000002','Site Author','site-author','Viet Tran',NULL,1,NULL,0,NULL,'066085dd-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (3,'OPT0000000003','Top contact info','top-contact-info','<b>Số điện thoại</b> (204) 272-3725 / <b>Đường dây nóng</b> (905) 326-3444',NULL,1,NULL,0,NULL,'0660875e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (4,'OPT0000000004','Facebook url','facebook-url','https://www.facebook.com/NhomMua.HCMC',NULL,1,NULL,0,NULL,'066088d6-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (5,'OPT0000000005','Google Plus URL','google-plus-url','http://plus.google.com',NULL,1,NULL,0,NULL,'06608a46-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (6,'OPT0000000006','Twitter URL','twitter-url','http://www.twitter.com/tqviet1978',NULL,1,NULL,0,NULL,'06608bbf-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (7,'OPT0000000007','YouTube URL','youtube-url','http://www.youtube.com/tqviet1978',NULL,1,NULL,0,NULL,'06608d19-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (8,'OPT0000000008','Web designer name','web-designer-name','GoMedia',NULL,1,NULL,0,NULL,'06608e78-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (9,'OPT0000000009','Web designer URL','web-designer-url','http://www.gomedia.vn',NULL,1,NULL,0,NULL,'06608fbd-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (10,'OPT0000000010','Copyright Notice','copyright-notice','© 2014 Your Company Name.',NULL,1,NULL,0,NULL,'06609128-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (11,'OPT0000000011','Logo','logo','logo.png',NULL,1,NULL,0,NULL,'06609276-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (12,'OPT0000000012','Admin menu style [flat|adminex|easytree]','admin-menu-style','adminex',NULL,1,NULL,0,NULL,'066093d9-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (13,'OPT0000000013','Global meta keywords','global-meta-keywords','extremeframework, extreme framework',NULL,1,NULL,0,NULL,'0660952b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (14,'OPT0000000014','Default meta description','default-meta-description','',NULL,1,NULL,0,NULL,'0660969b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (15,'OPT0000000015','Global meta title','global-meta-title','',NULL,1,NULL,0,NULL,'066097f1-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (16,'OPT0000000016','Footer support phone','footer-support-phone','1900 6617',NULL,1,NULL,0,NULL,'0660993a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (17,'OPT0000000017','Footer support hours','footer-support-hours','Từ 8h-21h, kể cả Thứ 7-CN',NULL,1,NULL,0,NULL,'06609a8c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (18,'OPT0000000018','Footer company line 1','footer-company-line-1','Công ty TNHH Nhóm Mua',NULL,1,NULL,0,NULL,'06609be7-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (19,'OPT0000000019','Footer company line 2','footer-company-line-2','331 Nguyễn Trọng Tuyển, P. 10, Q. Phú Nhuận, TP.HCM',NULL,1,NULL,0,NULL,'06609d34-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (20,'OPT0000000020','Footer company line 3','footer-company-line-3','Tầng 4 – Lô 07-3A Khu CN Hoàng Mai, Q.Hoàng Mai, Hà Nội',NULL,1,NULL,0,NULL,'06609e97-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (21,'OPT0000000021','Footer company line 4','footer-company-line-4','ĐT: (08) 7305 6616 - Fax: (08) 3844 6316 - Email: support@nhommua.com',NULL,1,NULL,0,NULL,'06609ff2-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (22,'OPT0000000022','Footer company line 5','footer-company-line-5','Mã số doanh nghiệp: 0310426944',NULL,1,NULL,0,NULL,'0660a14c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (23,'OPT0000000023','Footer support email','footer-support-email','support@nhommua.com',NULL,1,NULL,0,NULL,'0660a29e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (24,'OPT0000000024','Code of home slideshow','home-slideshow-code','main',NULL,1,NULL,0,NULL,'0660a3f9-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (25,'OPT0000000025','Code of home post menu','home-post-menu-code','nm-home-posts',NULL,1,NULL,0,NULL,'0660a546-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (26,'OPT0000000026','Code of main menu','main-menu-code','nhom-mua-main',NULL,1,NULL,0,NULL,'0660a6a1-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (27,'OPT0000000027','Pinterest URL','pinterest-url','http://www.pinterest.com',NULL,1,NULL,0,NULL,'0660a7ea-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (28,'OPT0000000028','Code of the main organization','main-organization-code','nhom-mua',NULL,1,NULL,0,NULL,'0660a94d-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (29,'OPT0000000029','Google OAuth 2.0 Client ID','google-oauth2-client-id','356091694084-quei5u71n8ncsi2d9shpulf27j69mkdc.apps.googleusercontent.com',NULL,1,NULL,0,NULL,'0660aaa3-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (30,'OPT0000000030','Google OAuth 2.0 Client Secret','google-oauth2-client-secret','SrMGebYFzk1GbnF1uc3WQDlS',NULL,1,NULL,0,NULL,'0660abfe-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (31,'OPT0000000031','Google OAuth 2.0 Redirect URL','google-oauth2-redirect-uri','http://localhost/apps4clouds.com/apps/retailworld/front/google/oauth2callback',NULL,1,NULL,0,NULL,'0660ad58-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (32,'OPT0000000032','Yahoo OAuth 2.0 Consumer Key','yahoo-oauth2-consumer-key','dj0yJmk9MHhyQUwwR29NeE1mJmQ9WVdrOWJXWjVNR2RuTm0wbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD1hMw--',NULL,1,NULL,0,NULL,'0660aec4-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (33,'OPT0000000033','Yahoo OAuth 2.0 Consumer Secret','yahoo-oauth2-consumer-secret','7c558f4ad0edf200bfeeea1408589c9c89338bcb',NULL,1,NULL,0,NULL,'0660b040-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (34,'OPT0000000034','Yahoo OAuth 2.0 App ID','yahoo-oauth2-app-id','mfy0gg6m',NULL,1,NULL,0,NULL,'0660b1a4-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (35,'OPT0000000035','Facebook OAuth 2.0 App ID','facebook-oauth2-app-id','1546420508951644',NULL,1,NULL,0,NULL,'0660b307-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (36,'OPT0000000036','Facebook OAuth 2.0 App Secret','facebook-oauth2-app-secret','6887ec3d95f5162ec6471e40883486ba',NULL,1,NULL,0,NULL,'0660b454-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (37,'OPT0000000037','Organization name','organization-name','Your Organization Name',NULL,1,NULL,0,NULL,'0660b5a6-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (38,'OPT0000000038','Default currency text','default-currency-text','USD',NULL,1,NULL,0,NULL,'0660b6fc-1a1a-11e5-b2f8-cc52af77857f');
insert  into `OPTION`(`ID`,`REFID`,`NAME`,`CODE`,`VALUE`,`CONTEXT`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (39,'OPT0000000039','Admin menu style [flat|adminex|easytree]','admin-menu-style','adminex',NULL,1,NULL,0,NULL,'0660b852-1a1a-11e5-b2f8-cc52af77857f');

/*Table structure for table `PARAMETER` */

DROP TABLE IF EXISTS `PARAMETER`;

CREATE TABLE `PARAMETER` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_PARAMETER_GROUP` int(11) DEFAULT NULL,
  `ID_PARAMETER_TYPE` int(11) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uniquekey` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `PARAMETER` */

insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'PRM0000000001','Default currency','DEFAULT_CUR',1,8,'$','',1,NULL,0,NULL,'06e7f479-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2,'PRM0000000002','Application name','CONFIG_APPL',1,1,'Apps4Clouds','',1,NULL,0,NULL,'06e7f7cd-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (3,'PRM0000000003','CSV separator','CSV_SEPARAT',1,1,',','',1,NULL,0,NULL,'06e7f8e3-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (4,'PRM0000000004','Date format','DATE_FORMAT',1,1,'mm-dd-yy','',1,NULL,0,NULL,'06e7f9ce-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (5,'PRM0000000005','Date format (in Smarty)','SMARTY_DATE',1,1,'%m-%d-%Y','',1,NULL,0,NULL,'06e7fab5-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (7,'PRM0000000006','Default user group','DEFAULT_USE',1,3,'2','',1,NULL,0,NULL,'06e7fba9-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (8,'PRM0000000007','Positive currency format','POSITIVE_CU',1,1,'%s%n','',1,NULL,0,NULL,'06e7fc8b-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (9,'PRM0000000008','Negative currency format','NEGATIVE_CU',1,1,'(%s%n)','',1,NULL,0,NULL,'06e7fd72-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (10,'PRM0000000009','Organization name','ORGANIZATIO',1,1,'Apps4Clouds Corporation','',1,NULL,0,NULL,'06e7fe5e-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (12,'PRM0000000010','Support name','SUPPORT_NAM',1,1,'Apps4Clouds Support','',1,NULL,0,NULL,'06e7ff4d-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (13,'PRM0000000011','Support email','SUPPORT_EMA',1,1,'support@apps4clouds.com','',1,NULL,0,NULL,'06e80034-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (14,'PRM0000000012','Default public dashboard','DEFAULT_PUB',1,3,'3','',1,NULL,0,NULL,'06e80113-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (15,'PRM0000000013','GetResponse API key','GETRESPONSE',1,1,'','',1,NULL,0,NULL,'06e801f1-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (16,'PRM0000000014','Use SMTP for sending emails?','MAILER_USE_',1,1,'1','',1,NULL,0,NULL,'06e802cf-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (17,'PRM0000000015','SMTP host','MAILER_SMTP',1,1,'smtp.gmail.com','',1,NULL,0,NULL,'06e803bf-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (21,'PRM0000000016','Save draft interval (seconds)','SAVE_DRAFT_',1,3,'10','',1,NULL,0,NULL,'06e80499-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (22,'PRM0000000017','Social :: Facebook URL','SOCIAL_FACE',2,1,'https://www.facebook.com/pages/C%E1%BB%99ng-%C4%91%E1%BB%93ng-PHP-Vi%E1%BB%87t-Nam/261573760536525','',1,NULL,0,NULL,'06e80580-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (23,'PRM0000000018','Social :: Disqus short name','SOCIAL_DISQ',2,1,'vietmaisolutionscorporation','',1,NULL,0,NULL,'06e80674-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (25,'PRM0000000019','Cloud sync option','CLOUD_SYNC_',3,2,'1','',1,NULL,0,NULL,'06e8076c-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (26,'PRM0000000020','PayPal :: Mode','PAYPAL_MODE',4,1,'sandbox','',1,NULL,0,NULL,'06e8084a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (27,'PRM0000000021','PayPal :: API Username','PAYPAL_API_',4,1,'nguyenlehuutai-facilitator_api1.gmail.com','',1,NULL,0,NULL,'06e8093a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (30,'PRM0000000022','PayPal :: Currency Code','PAYPAL_CURR',4,1,'USD','',1,NULL,0,NULL,'06e80a32-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (31,'PRM0000000023','Social :: Twitter URL','SOCIAL_TWIT',2,1,'','',1,NULL,0,NULL,'06e80b21-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (32,'PRM0000000024','Social :: Google Plus URL','SOCIAL_GOOG',2,1,'','',1,NULL,0,NULL,'06e80c00-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (33,'PRM0000000025','Social :: YouTube URL','SOCIAL_YOUT',2,1,'','',1,NULL,0,NULL,'06e80ce3-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (34,'PRM0000000026','Social :: Pinterest URL','SOCIAL_PINT',2,1,'','',1,NULL,0,NULL,'06e80dbd-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER`(`ID`,`REFID`,`NAME`,`CODE`,`ID_PARAMETER_GROUP`,`ID_PARAMETER_TYPE`,`VALUE`,`DESCRIPTION`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (35,'PRM0000000027','Social :: LinkedIn URL','SOCIAL_LINK',2,1,'','',1,NULL,0,NULL,'06e80e9f-1a1a-11e5-b2f8-cc52af77857f');

/*Table structure for table `PARAMETER_GROUP` */

DROP TABLE IF EXISTS `PARAMETER_GROUP`;

CREATE TABLE `PARAMETER_GROUP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORDERING` tinyint(2) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `PARAMETER_GROUP` */

insert  into `PARAMETER_GROUP`(`ID`,`REFID`,`NAME`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'PRG0000000001','System',1,1,NULL,0,NULL,'08dbc0d6-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER_GROUP`(`ID`,`REFID`,`NAME`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2,'PRG0000000002','Social',1,1,NULL,0,NULL,'08dbc483-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER_GROUP`(`ID`,`REFID`,`NAME`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (3,'PRG0000000003','Sync',1,1,NULL,0,NULL,'08dbc5d5-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER_GROUP`(`ID`,`REFID`,`NAME`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (4,'PRG0000000004','Payment',1,1,NULL,0,NULL,'08dbc705-1a1a-11e5-b2f8-cc52af77857f');

/*Table structure for table `PARAMETER_TYPE` */

DROP TABLE IF EXISTS `PARAMETER_TYPE`;

CREATE TABLE `PARAMETER_TYPE` (
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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `PARAMETER_TYPE` */

insert  into `PARAMETER_TYPE`(`ID`,`REFID`,`NAME`,`BASE_TYPE_CODE`,`EXTRA`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'PRT0000000001','Text','text','',1,1,NULL,0,NULL,'085c7e32-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER_TYPE`(`ID`,`REFID`,`NAME`,`BASE_TYPE_CODE`,`EXTRA`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2,'PRT0000000002','Boolean','truefalse','',2,1,NULL,0,NULL,'085c8242-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER_TYPE`(`ID`,`REFID`,`NAME`,`BASE_TYPE_CODE`,`EXTRA`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (3,'PRT0000000003','Number','number','',4,1,NULL,0,NULL,'085c83ba-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER_TYPE`(`ID`,`REFID`,`NAME`,`BASE_TYPE_CODE`,`EXTRA`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (4,'PRT0000000004','Date','date','',5,1,NULL,0,NULL,'085c8515-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER_TYPE`(`ID`,`REFID`,`NAME`,`BASE_TYPE_CODE`,`EXTRA`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (5,'PRT0000000005','List (Simple)','listsimple','1|True,2|False,3|Fuzzy',6,1,NULL,0,NULL,'085c865a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER_TYPE`(`ID`,`REFID`,`NAME`,`BASE_TYPE_CODE`,`EXTRA`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (6,'PRT0000000006','List (SQL)','listsql','SELECT LOGIN AS TITLE, ID AS VALUE FROM USER',8,1,NULL,0,NULL,'085c87ac-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER_TYPE`(`ID`,`REFID`,`NAME`,`BASE_TYPE_CODE`,`EXTRA`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (7,'PRT0000000007','List (Web Service)','listws','http://www.example.com/api/samplelist',9,1,NULL,0,NULL,'085c88fe-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER_TYPE`(`ID`,`REFID`,`NAME`,`BASE_TYPE_CODE`,`EXTRA`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (8,'PRT0000000008','HTML','html','',12,1,NULL,0,NULL,'085c8a32-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER_TYPE`(`ID`,`REFID`,`NAME`,`BASE_TYPE_CODE`,`EXTRA`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (9,'PRT0000000009','Checkbox','checkbox','',3,1,NULL,0,NULL,'085c8b6a-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER_TYPE`(`ID`,`REFID`,`NAME`,`BASE_TYPE_CODE`,`EXTRA`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (10,'PRT0000000010','Image','image','',10,1,NULL,0,NULL,'085c8caf-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER_TYPE`(`ID`,`REFID`,`NAME`,`BASE_TYPE_CODE`,`EXTRA`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (11,'PRT0000000011','File','file','',11,1,NULL,0,NULL,'085c8de3-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER_TYPE`(`ID`,`REFID`,`NAME`,`BASE_TYPE_CODE`,`EXTRA`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (12,'PRT0000000012','Password','password',NULL,13,1,NULL,0,NULL,'085c8f1f-1a1a-11e5-b2f8-cc52af77857f');
insert  into `PARAMETER_TYPE`(`ID`,`REFID`,`NAME`,`BASE_TYPE_CODE`,`EXTRA`,`ORDERING`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (13,'PRT0000000013','List (Reference)','listref','{\"datasource\":\"PROJECT_CATEGORY\",\"valuecol\":\"ID\",\"textcol\":\"NAME\"}',7,1,NULL,0,NULL,'085c905c-1a1a-11e5-b2f8-cc52af77857f');

/*Table structure for table `RECYCLE_BIN` */

DROP TABLE IF EXISTS `RECYCLE_BIN`;

CREATE TABLE `RECYCLE_BIN` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_TIME` datetime DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_MODULE` (`MODULE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `RECYCLE_BIN` */

/*Table structure for table `SCREEN` */

DROP TABLE IF EXISTS `SCREEN`;

CREATE TABLE `SCREEN` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_WORKFLOW` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UDID` int(11) DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uniquekey` (`CODE`),
  KEY `IDX_GUID` (`GUID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `SCREEN` */

insert  into `SCREEN`(`ID`,`REFID`,`TITLE`,`ID_WORKFLOW`,`CODE`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (1,'SCR0000000001','Resolve Issue','1','resolve-iss',1,NULL,NULL,0,'a0bcfa37-66f0-4d98-9e26-95ba27caf345');
insert  into `SCREEN`(`ID`,`REFID`,`TITLE`,`ID_WORKFLOW`,`CODE`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (2,'SCR2014000001','1','0','approve-scr',1,NULL,NULL,0,'346a8161-215b-4556-96fb-9bcf58e34fe9');
insert  into `SCREEN`(`ID`,`REFID`,`TITLE`,`ID_WORKFLOW`,`CODE`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (3,'SCR2014000002','1','0','reject-scre',1,NULL,NULL,0,'b2fc73d2-6410-4a45-9d5d-10f3e2b97329');

/*Table structure for table `SCREEN_FIELD` */

DROP TABLE IF EXISTS `SCREEN_FIELD`;

CREATE TABLE `SCREEN_FIELD` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_SCREEN` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_VALUE_TYPE` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATASOURCE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUECOL` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEXTCOL` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_MANDATORY` tinyint(1) DEFAULT NULL,
  `ORDERING` smallint(2) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UDID` int(11) DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `SCREEN_FIELD` */

insert  into `SCREEN_FIELD`(`ID`,`REFID`,`ID_SCREEN`,`TITLE`,`CODE`,`ID_VALUE_TYPE`,`DATASOURCE`,`CONDITION`,`VALUECOL`,`TEXTCOL`,`IS_MANDATORY`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (1,'SCF2014000001','1','Resolve User',NULL,'6','USER','','ID','NAME',NULL,NULL,1,NULL,NULL,0,'bc9c1624-333e-41f9-8d98-45dd12de51f3');
insert  into `SCREEN_FIELD`(`ID`,`REFID`,`ID_SCREEN`,`TITLE`,`CODE`,`ID_VALUE_TYPE`,`DATASOURCE`,`CONDITION`,`VALUECOL`,`TEXTCOL`,`IS_MANDATORY`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (2,'SCF2014000002','1','Comment',NULL,'2','','','','',NULL,NULL,1,NULL,NULL,0,'5ab92df9-82f3-4246-84b6-2a04b2892546');
insert  into `SCREEN_FIELD`(`ID`,`REFID`,`ID_SCREEN`,`TITLE`,`CODE`,`ID_VALUE_TYPE`,`DATASOURCE`,`CONDITION`,`VALUECOL`,`TEXTCOL`,`IS_MANDATORY`,`ORDERING`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (3,'SCF2014000003','1','Time spent (h)',NULL,'3','','','','',NULL,NULL,1,NULL,NULL,0,'f0d6aea3-e248-400c-b9ef-d3c16e3d9289');

/*Table structure for table `USER` */

DROP TABLE IF EXISTS `USER`;

CREATE TABLE `USER` (
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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `USER` */

insert  into `USER`(`ID`,`REFID`,`FIRST_NAME`,`LAST_NAME`,`PHOTO`,`EMAIL`,`LOGIN`,`PASSWORD`,`PHONE`,`GENDER`,`DATE_OF_BIRTH`,`FORCE_PASSWORD_CHANGE`,`IS_EMAIL_VERIFIED`,`FACEBOOK_ID`,`FACEBOOK_OAUTH_ID`,`GOOGLE_ID`,`GOOGLE_OAUTH_ID`,`YAHOO_ID`,`YAHOO_OAUTH_ID`,`IS_ENABLED`,`CREATION_DATE`,`LATEST_LOGIN`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'USR0000000001','Administrator',NULL,NULL,NULL,'admin','3d9188577cc9bfe9291ac66b5cc872b7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2015-06-24 09:20:09',1,NULL,NULL,NULL,'062ed3f9-1a1a-11e5-b2f8-cc52af77857f');

/*Table structure for table `USER_GROUP` */

DROP TABLE IF EXISTS `USER_GROUP`;

CREATE TABLE `USER_GROUP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_ID_DASHBOARD` int(11) DEFAULT NULL,
  `PARENT` int(11) DEFAULT NULL,
  `HIERACHY` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `USER_GROUP` */

insert  into `USER_GROUP`(`ID`,`REFID`,`NAME`,`DEFAULT_ID_DASHBOARD`,`PARENT`,`HIERACHY`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'USG0000000001','Admin',1,NULL,'--',1,NULL,0,NULL,'072fbdc6-1a1a-11e5-b2f8-cc52af77857f');
insert  into `USER_GROUP`(`ID`,`REFID`,`NAME`,`DEFAULT_ID_DASHBOARD`,`PARENT`,`HIERACHY`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2,'USG0000000002','Base User',2,NULL,'--',1,NULL,0,NULL,'072fc18c-1a1a-11e5-b2f8-cc52af77857f');

/*Table structure for table `USER_LOG` */

DROP TABLE IF EXISTS `USER_LOG`;

CREATE TABLE `USER_LOG` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `DATE_TIME` datetime DEFAULT NULL,
  `IP` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `USER_LOG` */

insert  into `USER_LOG`(`ID`,`REFID`,`ID_USER`,`DATE_TIME`,`IP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'USL0000000001',1,'2015-06-24 08:20:11','127.0.0.1',1,NULL,0,NULL,'2e543c24-e7f2-4b48-9ebe-603d1cef9ba7');
insert  into `USER_LOG`(`ID`,`REFID`,`ID_USER`,`DATE_TIME`,`IP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2,'USL0000000002',1,'2015-06-24 08:38:53','127.0.0.1',1,NULL,0,NULL,'13325035-5652-4dde-b8ac-9fabd512b9fb');
insert  into `USER_LOG`(`ID`,`REFID`,`ID_USER`,`DATE_TIME`,`IP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (3,'USL0000000003',1,'2015-06-24 08:48:39','127.0.0.1',1,NULL,0,NULL,'5010ec2b-0cf4-48a1-aeba-a1196c60f0cd');
insert  into `USER_LOG`(`ID`,`REFID`,`ID_USER`,`DATE_TIME`,`IP`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (4,NULL,1,'2015-06-24 09:20:09','127.0.0.1',1,NULL,0,NULL,'0c64add6-575b-4dbc-b782-2b00e81455c1');

/*Table structure for table `USER_MEMBERSHIP` */

DROP TABLE IF EXISTS `USER_MEMBERSHIP`;

CREATE TABLE `USER_MEMBERSHIP` (
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
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `USER_MEMBERSHIP` */

insert  into `USER_MEMBERSHIP`(`ID`,`REFID`,`ID_USER`,`ID_USER_GROUP`,`ID_USER_ROLE`,`VALID_FROM`,`VALID_UNTIL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'USM0000000001',1,1,NULL,NULL,NULL,1,NULL,0,NULL,'08c36700-1a1a-11e5-b2f8-cc52af77857f');
insert  into `USER_MEMBERSHIP`(`ID`,`REFID`,`ID_USER`,`ID_USER_GROUP`,`ID_USER_ROLE`,`VALID_FROM`,`VALID_UNTIL`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (2,'USM0000000002',1,2,NULL,NULL,NULL,1,NULL,0,NULL,'08c36ab9-1a1a-11e5-b2f8-cc52af77857f');

/*Table structure for table `USER_PREFERENCE` */

DROP TABLE IF EXISTS `USER_PREFERENCE`;

CREATE TABLE `USER_PREFERENCE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `ID_DASHBOARD` int(11) DEFAULT NULL,
  `ID_WALLPAPER` int(11) DEFAULT NULL,
  `ID_ADMIN_STYLE` int(11) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE` (`ID_USER`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `USER_PREFERENCE` */

insert  into `USER_PREFERENCE`(`ID`,`REFID`,`ID_USER`,`ID_DASHBOARD`,`ID_WALLPAPER`,`ID_ADMIN_STYLE`,`GUID`,`JSON`,`UDID`,`WFID`,`UUID`) values (1,'USP0000000001',1,1,NULL,NULL,1,NULL,0,NULL,'08abded4-1a1a-11e5-b2f8-cc52af77857f');

/*Table structure for table `USER_ROLE` */

DROP TABLE IF EXISTS `USER_ROLE`;

CREATE TABLE `USER_ROLE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `USER_ROLE` */

/*Table structure for table `VALUE_TYPE` */

DROP TABLE IF EXISTS `VALUE_TYPE`;

CREATE TABLE `VALUE_TYPE` (
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
  KEY `IDX_GUID` (`GUID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `VALUE_TYPE` */

insert  into `VALUE_TYPE`(`ID`,`REFID`,`NAME`,`CODE`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (1,'VLT0000000001','Text','text',1,NULL,NULL,0,'1ab50bbe-125b-4fb3-ab76-ff49bf2fafaf');
insert  into `VALUE_TYPE`(`ID`,`REFID`,`NAME`,`CODE`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (2,'VLT0000000002','Text area','textarea',1,NULL,NULL,0,'4325b078-fca4-4938-8483-2e6ad4e16a2a');
insert  into `VALUE_TYPE`(`ID`,`REFID`,`NAME`,`CODE`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (3,'VLT0000000003','Number','number',1,NULL,NULL,0,'497b7ff7-12e2-4238-9830-675dd3722bf6');
insert  into `VALUE_TYPE`(`ID`,`REFID`,`NAME`,`CODE`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (4,'VLT0000000004','Radio','radio',1,NULL,NULL,0,'7fb27f90-11fe-4ba3-b435-8c4df3bb283e');
insert  into `VALUE_TYPE`(`ID`,`REFID`,`NAME`,`CODE`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (5,'VLT0000000005','Checkbox','checkbox',1,NULL,NULL,0,'9dd445a1-0574-4db2-9657-9ab47e930f20');
insert  into `VALUE_TYPE`(`ID`,`REFID`,`NAME`,`CODE`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (6,'VLT0000000006','Refselect','refselect',1,NULL,NULL,0,'20b3212d-58e4-483d-85aa-ec466914b76a');
insert  into `VALUE_TYPE`(`ID`,`REFID`,`NAME`,`CODE`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (7,'VLT0000000007','Date','date',1,NULL,NULL,0,'20b3212d-58e4-483d-85aa-ec466914b76b');

/*Table structure for table `WORKFLOW` */

DROP TABLE IF EXISTS `WORKFLOW`;

CREATE TABLE `WORKFLOW` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `GUID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uniquekey` (`CODE`),
  KEY `IDX_GUID` (`GUID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `WORKFLOW` */

insert  into `WORKFLOW`(`ID`,`REFID`,`NAME`,`CODE`,`DESCRIPTION`,`GUID`,`WFID`,`JSON`,`UDID`,`UUID`) values (8,'WRK2014000002','Approval workflow','approval-wo','',1,NULL,NULL,0,'4fa01591-1789-47d9-94ca-6e96023d1f0e');

/*Table structure for table `WORKFLOW_APPLICATION` */

DROP TABLE IF EXISTS `WORKFLOW_APPLICATION`;

CREATE TABLE `WORKFLOW_APPLICATION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_WORKFLOW` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UDID` int(11) DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `WORKFLOW_APPLICATION` */

insert  into `WORKFLOW_APPLICATION`(`ID`,`REFID`,`MODULE`,`ID_WORKFLOW`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (1,'MDW2014000001','product','6',1,NULL,NULL,0,'fc84b52c-b8c5-42d8-b90a-b8358f08d156');
insert  into `WORKFLOW_APPLICATION`(`ID`,`REFID`,`MODULE`,`ID_WORKFLOW`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (2,'MDW2014000002','product','7',1,NULL,NULL,0,'9fa763a7-f921-4077-a4df-fd286ab32fa7');
insert  into `WORKFLOW_APPLICATION`(`ID`,`REFID`,`MODULE`,`ID_WORKFLOW`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (3,'MDW2014000003','product','8',1,NULL,NULL,0,'fd3e6ec8-6398-4d4d-b483-96e504ab9fa4');

/*Table structure for table `WORKFLOW_LOG` */

DROP TABLE IF EXISTS `WORKFLOW_LOG`;

CREATE TABLE `WORKFLOW_LOG` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_WORKFLOW` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_WORKFLOW_TRANSITION` int(11) DEFAULT NULL,
  `MODULE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OBJECT_ID` int(11) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `DETAILS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `UDID` int(11) DEFAULT NULL,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `WORKFLOW_LOG` */

/*Table structure for table `WORKFLOW_STAGE` */

DROP TABLE IF EXISTS `WORKFLOW_STAGE`;

CREATE TABLE `WORKFLOW_STAGE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_WORKFLOW` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_DEFAULT` tinyint(1) DEFAULT NULL,
  `IS_BINDING_OBJECT_EDITABLE` tinyint(1) DEFAULT NULL,
  `IS_BINDING_OBJECT_DELETABLE` tinyint(1) DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UDID` int(11) DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `WORKFLOW_STAGE` */

insert  into `WORKFLOW_STAGE`(`ID`,`REFID`,`ID_WORKFLOW`,`NAME`,`CODE`,`IS_DEFAULT`,`IS_BINDING_OBJECT_EDITABLE`,`IS_BINDING_OBJECT_DELETABLE`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (1,'WRS0000000001','7','Open',NULL,NULL,NULL,NULL,1,NULL,NULL,0,'f08afeaf-92e2-46ac-8b3d-d4fd05429f3a');
insert  into `WORKFLOW_STAGE`(`ID`,`REFID`,`ID_WORKFLOW`,`NAME`,`CODE`,`IS_DEFAULT`,`IS_BINDING_OBJECT_EDITABLE`,`IS_BINDING_OBJECT_DELETABLE`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (2,'WRS0000000002','7','Assigned',NULL,NULL,NULL,NULL,1,NULL,NULL,0,'e8c62241-7e53-451a-8ea5-56bdf41d5759');
insert  into `WORKFLOW_STAGE`(`ID`,`REFID`,`ID_WORKFLOW`,`NAME`,`CODE`,`IS_DEFAULT`,`IS_BINDING_OBJECT_EDITABLE`,`IS_BINDING_OBJECT_DELETABLE`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (3,'WRS0000000003','7','In Progress',NULL,NULL,NULL,NULL,1,NULL,NULL,0,'6e177050-fdf7-479d-9527-8a0ac2e7db6e');
insert  into `WORKFLOW_STAGE`(`ID`,`REFID`,`ID_WORKFLOW`,`NAME`,`CODE`,`IS_DEFAULT`,`IS_BINDING_OBJECT_EDITABLE`,`IS_BINDING_OBJECT_DELETABLE`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (4,'WRS0000000004','7','Resolved',NULL,NULL,NULL,NULL,1,NULL,NULL,0,'807b617c-1fff-4ea4-9550-5f1104b35b3a');
insert  into `WORKFLOW_STAGE`(`ID`,`REFID`,`ID_WORKFLOW`,`NAME`,`CODE`,`IS_DEFAULT`,`IS_BINDING_OBJECT_EDITABLE`,`IS_BINDING_OBJECT_DELETABLE`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (5,'WRS0000000005','7','Reopened',NULL,NULL,NULL,NULL,1,NULL,NULL,0,'a33c815e-fe6f-4794-9505-72f8ee4fef60');
insert  into `WORKFLOW_STAGE`(`ID`,`REFID`,`ID_WORKFLOW`,`NAME`,`CODE`,`IS_DEFAULT`,`IS_BINDING_OBJECT_EDITABLE`,`IS_BINDING_OBJECT_DELETABLE`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (6,'WRS2014000001','8','New',NULL,NULL,NULL,NULL,1,NULL,NULL,0,'a0470983-cb73-411a-9c4c-77cae2c60d4b');
insert  into `WORKFLOW_STAGE`(`ID`,`REFID`,`ID_WORKFLOW`,`NAME`,`CODE`,`IS_DEFAULT`,`IS_BINDING_OBJECT_EDITABLE`,`IS_BINDING_OBJECT_DELETABLE`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (7,'WRS2014000002','8','Approval Pending',NULL,NULL,NULL,NULL,1,NULL,NULL,0,'68731f92-948e-4e80-a950-a49d626a9f1c');
insert  into `WORKFLOW_STAGE`(`ID`,`REFID`,`ID_WORKFLOW`,`NAME`,`CODE`,`IS_DEFAULT`,`IS_BINDING_OBJECT_EDITABLE`,`IS_BINDING_OBJECT_DELETABLE`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (8,'WRS2014000003','8','Approved',NULL,NULL,NULL,NULL,1,NULL,NULL,0,'d2997a53-d5e2-40ab-a153-b46c9f39bca2');
insert  into `WORKFLOW_STAGE`(`ID`,`REFID`,`ID_WORKFLOW`,`NAME`,`CODE`,`IS_DEFAULT`,`IS_BINDING_OBJECT_EDITABLE`,`IS_BINDING_OBJECT_DELETABLE`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (9,'WRS2014000004','8','Rejected',NULL,NULL,NULL,NULL,1,NULL,NULL,0,'f68409c2-2c72-4562-bac4-248736c559fa');

/*Table structure for table `WORKFLOW_TRANSITION` */

DROP TABLE IF EXISTS `WORKFLOW_TRANSITION`;

CREATE TABLE `WORKFLOW_TRANSITION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_WORKFLOW` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_ID_WORKFLOW_STAGE` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `END_ID_WORKFLOW_STAGE` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTION` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_USER_GROUP` int(11) DEFAULT NULL,
  `ID_USER_ROLE` int(11) DEFAULT NULL,
  `TRANSITION_ID_SCREEN` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUID` int(11) DEFAULT NULL,
  `JSON` text COLLATE utf8_unicode_ci,
  `WFID` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UDID` int(11) DEFAULT NULL,
  `UUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GUID` (`GUID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `WORKFLOW_TRANSITION` */

insert  into `WORKFLOW_TRANSITION`(`ID`,`REFID`,`ID_WORKFLOW`,`NAME`,`START_ID_WORKFLOW_STAGE`,`END_ID_WORKFLOW_STAGE`,`ACTION`,`ID_USER_GROUP`,`ID_USER_ROLE`,`TRANSITION_ID_SCREEN`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (1,'WRI2014000001','6','Validate','0','0','validate',NULL,NULL,NULL,1,NULL,NULL,0,'3ec98bae-c981-4d74-83dc-7c04e210a5f6');
insert  into `WORKFLOW_TRANSITION`(`ID`,`REFID`,`ID_WORKFLOW`,`NAME`,`START_ID_WORKFLOW_STAGE`,`END_ID_WORKFLOW_STAGE`,`ACTION`,`ID_USER_GROUP`,`ID_USER_ROLE`,`TRANSITION_ID_SCREEN`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (2,'WRT2014000001','7','Assign','1','2','assign',NULL,NULL,NULL,1,NULL,NULL,0,'228844b4-05b4-49cb-9488-21ccf24a8d50');
insert  into `WORKFLOW_TRANSITION`(`ID`,`REFID`,`ID_WORKFLOW`,`NAME`,`START_ID_WORKFLOW_STAGE`,`END_ID_WORKFLOW_STAGE`,`ACTION`,`ID_USER_GROUP`,`ID_USER_ROLE`,`TRANSITION_ID_SCREEN`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (3,'WRT2014000002','7','Start','2','3','start',NULL,NULL,NULL,1,NULL,NULL,0,'89dbb044-5e4a-4dae-a2fd-87fe4d46d536');
insert  into `WORKFLOW_TRANSITION`(`ID`,`REFID`,`ID_WORKFLOW`,`NAME`,`START_ID_WORKFLOW_STAGE`,`END_ID_WORKFLOW_STAGE`,`ACTION`,`ID_USER_GROUP`,`ID_USER_ROLE`,`TRANSITION_ID_SCREEN`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (4,'WRT2014000003','7','Resolve','3','4','resolve',NULL,NULL,NULL,1,NULL,NULL,0,'05f6c4ae-a731-42fb-a1ad-3ef6bc87aa05');
insert  into `WORKFLOW_TRANSITION`(`ID`,`REFID`,`ID_WORKFLOW`,`NAME`,`START_ID_WORKFLOW_STAGE`,`END_ID_WORKFLOW_STAGE`,`ACTION`,`ID_USER_GROUP`,`ID_USER_ROLE`,`TRANSITION_ID_SCREEN`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (5,'WRT2014000004','8','Submit for approval','6','7','submit',NULL,NULL,NULL,1,NULL,NULL,0,'e4e01633-23d5-44ba-bda9-2c89af56afb6');
insert  into `WORKFLOW_TRANSITION`(`ID`,`REFID`,`ID_WORKFLOW`,`NAME`,`START_ID_WORKFLOW_STAGE`,`END_ID_WORKFLOW_STAGE`,`ACTION`,`ID_USER_GROUP`,`ID_USER_ROLE`,`TRANSITION_ID_SCREEN`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (6,'WRT2014000005','8','Approve','7','8','approve',NULL,3,'2',1,NULL,NULL,0,'9c51c72c-5d50-4794-87ca-57af6349fa05');
insert  into `WORKFLOW_TRANSITION`(`ID`,`REFID`,`ID_WORKFLOW`,`NAME`,`START_ID_WORKFLOW_STAGE`,`END_ID_WORKFLOW_STAGE`,`ACTION`,`ID_USER_GROUP`,`ID_USER_ROLE`,`TRANSITION_ID_SCREEN`,`GUID`,`JSON`,`WFID`,`UDID`,`UUID`) values (7,'WRT2014000006','8','Reject','7','9','reject',NULL,3,'3',1,NULL,NULL,0,'ae137bf2-e99a-46b0-9b6d-1dffa07afa03');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;