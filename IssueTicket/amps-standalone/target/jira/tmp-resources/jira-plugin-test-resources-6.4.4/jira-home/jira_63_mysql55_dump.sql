-- MySQL dump 10.13  Distrib 5.5.25a, for osx10.6 (i386)
--
-- Host: localhost    Database: jiradb
-- ------------------------------------------------------
-- Server version	5.5.25a

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
-- Table structure for table `AO_21D670_WHITELIST_RULES`
--

DROP TABLE IF EXISTS `AO_21D670_WHITELIST_RULES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AO_21D670_WHITELIST_RULES` (
  `ALLOWINBOUND` tinyint(1) DEFAULT NULL,
  `EXPRESSION` longtext COLLATE utf8_bin NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AO_21D670_WHITELIST_RULES`
--

LOCK TABLES `AO_21D670_WHITELIST_RULES` WRITE;
/*!40000 ALTER TABLE `AO_21D670_WHITELIST_RULES` DISABLE KEYS */;
INSERT INTO `AO_21D670_WHITELIST_RULES` VALUES (0,'http://www.atlassian.com/*',1,'WILDCARD_EXPRESSION');
/*!40000 ALTER TABLE `AO_21D670_WHITELIST_RULES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AO_4AEACD_WEBHOOK_DAO`
--

DROP TABLE IF EXISTS `AO_4AEACD_WEBHOOK_DAO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AO_4AEACD_WEBHOOK_DAO` (
  `ENABLED` tinyint(1) DEFAULT NULL,
  `ENCODED_EVENTS` longtext COLLATE utf8_bin,
  `FILTER` longtext COLLATE utf8_bin,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `JQL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_UPDATED` datetime NOT NULL,
  `LAST_UPDATED_USER` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME` longtext COLLATE utf8_bin NOT NULL,
  `REGISTRATION_METHOD` varchar(255) COLLATE utf8_bin NOT NULL,
  `URL` longtext COLLATE utf8_bin NOT NULL,
  `EXCLUDE_ISSUE_DETAILS` tinyint(1) DEFAULT NULL,
  `PARAMETERS` longtext COLLATE utf8_bin,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AO_4AEACD_WEBHOOK_DAO`
--

LOCK TABLES `AO_4AEACD_WEBHOOK_DAO` WRITE;
/*!40000 ALTER TABLE `AO_4AEACD_WEBHOOK_DAO` DISABLE KEYS */;
/*!40000 ALTER TABLE `AO_4AEACD_WEBHOOK_DAO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AO_563AEE_ACTOR_ENTITY`
--

DROP TABLE IF EXISTS `AO_563AEE_ACTOR_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AO_563AEE_ACTOR_ENTITY` (
  `FULL_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROFILE_PAGE_URI` varchar(767) COLLATE utf8_bin DEFAULT NULL,
  `PROFILE_PICTURE_URI` varchar(767) COLLATE utf8_bin DEFAULT NULL,
  `USERNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AO_563AEE_ACTOR_ENTITY`
--

LOCK TABLES `AO_563AEE_ACTOR_ENTITY` WRITE;
/*!40000 ALTER TABLE `AO_563AEE_ACTOR_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `AO_563AEE_ACTOR_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AO_563AEE_MEDIA_LINK_ENTITY`
--

DROP TABLE IF EXISTS `AO_563AEE_MEDIA_LINK_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AO_563AEE_MEDIA_LINK_ENTITY` (
  `DURATION` int(11) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(767) COLLATE utf8_bin DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AO_563AEE_MEDIA_LINK_ENTITY`
--

LOCK TABLES `AO_563AEE_MEDIA_LINK_ENTITY` WRITE;
/*!40000 ALTER TABLE `AO_563AEE_MEDIA_LINK_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `AO_563AEE_MEDIA_LINK_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AO_B9A0F0_APPLIED_TEMPLATE`
--

DROP TABLE IF EXISTS `AO_B9A0F0_APPLIED_TEMPLATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AO_B9A0F0_APPLIED_TEMPLATE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROJECT_ID` bigint(20) DEFAULT '0',
  `PROJECT_TEMPLATE_MODULE_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_TEMPLATE_WEB_ITEM_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AO_B9A0F0_APPLIED_TEMPLATE`
--

LOCK TABLES `AO_B9A0F0_APPLIED_TEMPLATE` WRITE;
/*!40000 ALTER TABLE `AO_B9A0F0_APPLIED_TEMPLATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `AO_B9A0F0_APPLIED_TEMPLATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AO_E8B6CC_CHANGESET_MAPPING`
--

DROP TABLE IF EXISTS `AO_E8B6CC_CHANGESET_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AO_E8B6CC_CHANGESET_MAPPING` (
  `AUTHOR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BRANCH` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATE` datetime DEFAULT NULL,
  `FILES_DATA` longtext COLLATE utf8_bin,
  `FILE_COUNT` int(11) DEFAULT '0',
  `FILE_DETAILS_JSON` longtext COLLATE utf8_bin,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ISSUE_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE` longtext COLLATE utf8_bin,
  `NODE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENTS_DATA` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RAW_AUTHOR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RAW_NODE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REPOSITORY_ID` int(11) DEFAULT '0',
  `SMARTCOMMIT_AVAILABLE` tinyint(1) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AO_E8B6CC_CHANGESET_MAPPING`
--

LOCK TABLES `AO_E8B6CC_CHANGESET_MAPPING` WRITE;
/*!40000 ALTER TABLE `AO_E8B6CC_CHANGESET_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AO_E8B6CC_CHANGESET_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AO_E8B6CC_COMMIT`
--

DROP TABLE IF EXISTS `AO_E8B6CC_COMMIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AO_E8B6CC_COMMIT` (
  `AUTHOR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `AUTHOR_AVATAR_URL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATE` datetime NOT NULL,
  `DOMAIN_ID` int(11) NOT NULL DEFAULT '0',
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MESSAGE` longtext COLLATE utf8_bin,
  `NODE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RAW_AUTHOR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AO_E8B6CC_COMMIT`
--

LOCK TABLES `AO_E8B6CC_COMMIT` WRITE;
/*!40000 ALTER TABLE `AO_E8B6CC_COMMIT` DISABLE KEYS */;
/*!40000 ALTER TABLE `AO_E8B6CC_COMMIT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AO_E8B6CC_ISSUE_MAPPING`
--

DROP TABLE IF EXISTS `AO_E8B6CC_ISSUE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AO_E8B6CC_ISSUE_MAPPING` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ISSUE_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NODE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REPOSITORY_URI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AO_E8B6CC_ISSUE_MAPPING`
--

LOCK TABLES `AO_E8B6CC_ISSUE_MAPPING` WRITE;
/*!40000 ALTER TABLE `AO_E8B6CC_ISSUE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AO_E8B6CC_ISSUE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AO_E8B6CC_ISSUE_MAPPING_V2`
--

DROP TABLE IF EXISTS `AO_E8B6CC_ISSUE_MAPPING_V2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AO_E8B6CC_ISSUE_MAPPING_V2` (
  `AUTHOR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BRANCH` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATE` datetime DEFAULT NULL,
  `FILES_DATA` longtext COLLATE utf8_bin,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ISSUE_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE` longtext COLLATE utf8_bin,
  `NODE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENTS_DATA` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RAW_AUTHOR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RAW_NODE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REPOSITORY_ID` int(11) DEFAULT '0',
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AO_E8B6CC_ISSUE_MAPPING_V2`
--

LOCK TABLES `AO_E8B6CC_ISSUE_MAPPING_V2` WRITE;
/*!40000 ALTER TABLE `AO_E8B6CC_ISSUE_MAPPING_V2` DISABLE KEYS */;
/*!40000 ALTER TABLE `AO_E8B6CC_ISSUE_MAPPING_V2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AO_E8B6CC_MESSAGE`
--

DROP TABLE IF EXISTS `AO_E8B6CC_MESSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AO_E8B6CC_MESSAGE` (
  `ADDRESS` varchar(255) COLLATE utf8_bin NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PAYLOAD` longtext COLLATE utf8_bin NOT NULL,
  `PAYLOAD_TYPE` varchar(255) COLLATE utf8_bin NOT NULL,
  `PRIORITY` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AO_E8B6CC_MESSAGE`
--

LOCK TABLES `AO_E8B6CC_MESSAGE` WRITE;
/*!40000 ALTER TABLE `AO_E8B6CC_MESSAGE` DISABLE KEYS */;
/*!40000 ALTER TABLE `AO_E8B6CC_MESSAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AO_E8B6CC_ORGANIZATION_MAPPING`
--

DROP TABLE IF EXISTS `AO_E8B6CC_ORGANIZATION_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AO_E8B6CC_ORGANIZATION_MAPPING` (
  `ACCESS_TOKEN` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ADMIN_PASSWORD` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ADMIN_USERNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `AUTOLINK_NEW_REPOS` tinyint(1) DEFAULT NULL,
  `DEFAULT_GROUPS_SLUGS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DVCS_TYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HOST_URL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OAUTH_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OAUTH_SECRET` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SMARTCOMMITS_FOR_NEW_REPOS` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AO_E8B6CC_ORGANIZATION_MAPPING`
--

LOCK TABLES `AO_E8B6CC_ORGANIZATION_MAPPING` WRITE;
/*!40000 ALTER TABLE `AO_E8B6CC_ORGANIZATION_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AO_E8B6CC_ORGANIZATION_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AO_E8B6CC_PROJECT_MAPPING`
--

DROP TABLE IF EXISTS `AO_E8B6CC_PROJECT_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AO_E8B6CC_PROJECT_MAPPING` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PASSWORD` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REPOSITORY_URI` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USERNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AO_E8B6CC_PROJECT_MAPPING`
--

LOCK TABLES `AO_E8B6CC_PROJECT_MAPPING` WRITE;
/*!40000 ALTER TABLE `AO_E8B6CC_PROJECT_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AO_E8B6CC_PROJECT_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AO_E8B6CC_PROJECT_MAPPING_V2`
--

DROP TABLE IF EXISTS `AO_E8B6CC_PROJECT_MAPPING_V2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AO_E8B6CC_PROJECT_MAPPING_V2` (
  `ACCESS_TOKEN` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ADMIN_PASSWORD` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ADMIN_USERNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LAST_COMMIT_DATE` datetime DEFAULT NULL,
  `PROJECT_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REPOSITORY_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REPOSITORY_TYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REPOSITORY_URL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AO_E8B6CC_PROJECT_MAPPING_V2`
--

LOCK TABLES `AO_E8B6CC_PROJECT_MAPPING_V2` WRITE;
/*!40000 ALTER TABLE `AO_E8B6CC_PROJECT_MAPPING_V2` DISABLE KEYS */;
/*!40000 ALTER TABLE `AO_E8B6CC_PROJECT_MAPPING_V2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AO_E8B6CC_PR_ISSUE_KEY`
--

DROP TABLE IF EXISTS `AO_E8B6CC_PR_ISSUE_KEY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AO_E8B6CC_PR_ISSUE_KEY` (
  `DOMAIN_ID` int(11) NOT NULL DEFAULT '0',
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ISSUE_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PULL_REQUEST_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AO_E8B6CC_PR_ISSUE_KEY`
--

LOCK TABLES `AO_E8B6CC_PR_ISSUE_KEY` WRITE;
/*!40000 ALTER TABLE `AO_E8B6CC_PR_ISSUE_KEY` DISABLE KEYS */;
/*!40000 ALTER TABLE `AO_E8B6CC_PR_ISSUE_KEY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AO_E8B6CC_PULL_REQUEST`
--

DROP TABLE IF EXISTS `AO_E8B6CC_PULL_REQUEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AO_E8B6CC_PULL_REQUEST` (
  `AUTHOR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `COMMENT_COUNT` int(11) DEFAULT '0',
  `CREATED_ON` datetime DEFAULT NULL,
  `DESTINATION_BRANCH` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DOMAIN_ID` int(11) NOT NULL DEFAULT '0',
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LAST_STATUS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REMOTE_ID` bigint(20) DEFAULT NULL,
  `SOURCE_BRANCH` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SOURCE_REPO` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TO_REPOSITORY_ID` int(11) DEFAULT '0',
  `UPDATED_ON` datetime DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AO_E8B6CC_PULL_REQUEST`
--

LOCK TABLES `AO_E8B6CC_PULL_REQUEST` WRITE;
/*!40000 ALTER TABLE `AO_E8B6CC_PULL_REQUEST` DISABLE KEYS */;
/*!40000 ALTER TABLE `AO_E8B6CC_PULL_REQUEST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AO_E8B6CC_REPOSITORY_MAPPING`
--

DROP TABLE IF EXISTS `AO_E8B6CC_REPOSITORY_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AO_E8B6CC_REPOSITORY_MAPPING` (
  `ACTIVITY_LAST_SYNC` datetime DEFAULT NULL,
  `DELETED` tinyint(1) DEFAULT NULL,
  `FORK` tinyint(1) DEFAULT NULL,
  `FORK_OF_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FORK_OF_OWNER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FORK_OF_SLUG` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LAST_CHANGESET_NODE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_COMMIT_DATE` datetime DEFAULT NULL,
  `LINKED` tinyint(1) DEFAULT NULL,
  `LOGO` longtext COLLATE utf8_bin,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ORGANIZATION_ID` int(11) DEFAULT '0',
  `SLUG` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SMARTCOMMITS_ENABLED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AO_E8B6CC_REPOSITORY_MAPPING`
--

LOCK TABLES `AO_E8B6CC_REPOSITORY_MAPPING` WRITE;
/*!40000 ALTER TABLE `AO_E8B6CC_REPOSITORY_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AO_E8B6CC_REPOSITORY_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AO_E8B6CC_SYNC_AUDIT_LOG`
--

DROP TABLE IF EXISTS `AO_E8B6CC_SYNC_AUDIT_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AO_E8B6CC_SYNC_AUDIT_LOG` (
  `END_DATE` datetime DEFAULT NULL,
  `EXC_TRACE` longtext COLLATE utf8_bin,
  `FIRST_REQUEST_DATE` datetime DEFAULT NULL,
  `FLIGHT_TIME_MS` int(11) DEFAULT '0',
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NUM_REQUESTS` int(11) DEFAULT '0',
  `REPO_ID` int(11) DEFAULT '0',
  `START_DATE` datetime DEFAULT NULL,
  `SYNC_STATUS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SYNC_TYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOTAL_ERRORS` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AO_E8B6CC_SYNC_AUDIT_LOG`
--

LOCK TABLES `AO_E8B6CC_SYNC_AUDIT_LOG` WRITE;
/*!40000 ALTER TABLE `AO_E8B6CC_SYNC_AUDIT_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `AO_E8B6CC_SYNC_AUDIT_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JQUARTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `JQUARTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JQUARTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JQUARTZ_BLOB_TRIGGERS`
--

LOCK TABLES `JQUARTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `JQUARTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `JQUARTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JQUARTZ_CALENDARS`
--

DROP TABLE IF EXISTS `JQUARTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JQUARTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `CALENDAR` blob,
  PRIMARY KEY (`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JQUARTZ_CALENDARS`
--

LOCK TABLES `JQUARTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `JQUARTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `JQUARTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JQUARTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `JQUARTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JQUARTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `CRON_EXPRESSION` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `TIME_ZONE_ID` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JQUARTZ_CRON_TRIGGERS`
--

LOCK TABLES `JQUARTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `JQUARTZ_CRON_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `JQUARTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JQUARTZ_JOB_LISTENERS`
--

DROP TABLE IF EXISTS `JQUARTZ_JOB_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JQUARTZ_JOB_LISTENERS` (
  `JOB_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `JOB_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `JOB_LISTENER` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`JOB_NAME`,`JOB_GROUP`,`JOB_LISTENER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JQUARTZ_JOB_LISTENERS`
--

LOCK TABLES `JQUARTZ_JOB_LISTENERS` WRITE;
/*!40000 ALTER TABLE `JQUARTZ_JOB_LISTENERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `JQUARTZ_JOB_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JQUARTZ_LOCKS`
--

DROP TABLE IF EXISTS `JQUARTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JQUARTZ_LOCKS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_NAME` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JQUARTZ_LOCKS`
--

LOCK TABLES `JQUARTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `JQUARTZ_LOCKS` DISABLE KEYS */;
INSERT INTO `JQUARTZ_LOCKS` VALUES (NULL,'CALENDAR_ACCESS'),(NULL,'JOB_ACCESS'),(NULL,'MISFIRE_ACCESS'),(NULL,'STATE_ACCESS'),(NULL,'TRIGGER_ACCESS');
/*!40000 ALTER TABLE `JQUARTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JQUARTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `JQUARTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JQUARTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JQUARTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `JQUARTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `JQUARTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `JQUARTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JQUARTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `JQUARTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JQUARTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `INSTANCE_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `LAST_CHECKIN_TIME` bigint(20) DEFAULT NULL,
  `CHECKIN_INTERVAL` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JQUARTZ_SCHEDULER_STATE`
--

LOCK TABLES `JQUARTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `JQUARTZ_SCHEDULER_STATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `JQUARTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JQUARTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `JQUARTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JQUARTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `REPEAT_COUNT` bigint(20) DEFAULT NULL,
  `REPEAT_INTERVAL` bigint(20) DEFAULT NULL,
  `TIMES_TRIGGERED` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JQUARTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `JQUARTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `JQUARTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
INSERT INTO `JQUARTZ_SIMPLE_TRIGGERS` VALUES (NULL,'CompatibilityPluginScheduler.JobId.LocalPluginLicenseNotificationJob-job','SchedulerServiceTriggers',-1,86400000,1),(NULL,'CompatibilityPluginScheduler.JobId.PluginRequestCheckJob-job','SchedulerServiceTriggers',-1,3600000,1),(NULL,'CompatibilityPluginScheduler.JobId.PluginUpdateCheckJob-job','SchedulerServiceTriggers',-1,86400000,0),(NULL,'CompatibilityPluginScheduler.JobId.RemotePluginLicenseNotificationJob-job','SchedulerServiceTriggers',-1,3600000,1),(NULL,'CompatibilityPluginScheduler.JobId.com.atlassian.jira.plugins.dvcs.scheduler.DvcsScheduler:job','SchedulerServiceTriggers',-1,3600000,0),(NULL,'com.atlassian.jira.service.JiraService:10001','SchedulerServiceTriggers',-1,43200000,0),(NULL,'com.atlassian.jira.service.JiraService:10002','SchedulerServiceTriggers',-1,86400000,1);
/*!40000 ALTER TABLE `JQUARTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JQUARTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `JQUARTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JQUARTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `STR_PROP_1` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `STR_PROP_2` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `STR_PROP_3` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JQUARTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `JQUARTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `JQUARTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `JQUARTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JQUARTZ_TRIGGER_LISTENERS`
--

DROP TABLE IF EXISTS `JQUARTZ_TRIGGER_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JQUARTZ_TRIGGER_LISTENERS` (
  `TRIGGER_NAME` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `TRIGGER_LISTENER` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`TRIGGER_GROUP`,`TRIGGER_LISTENER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JQUARTZ_TRIGGER_LISTENERS`
--

LOCK TABLES `JQUARTZ_TRIGGER_LISTENERS` WRITE;
/*!40000 ALTER TABLE `JQUARTZ_TRIGGER_LISTENERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `JQUARTZ_TRIGGER_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OS_CURRENTSTEP_PREV`
--

DROP TABLE IF EXISTS `OS_CURRENTSTEP_PREV`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OS_CURRENTSTEP_PREV` (
  `ID` decimal(18,0) NOT NULL,
  `PREVIOUS_ID` decimal(18,0) NOT NULL,
  PRIMARY KEY (`ID`,`PREVIOUS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OS_CURRENTSTEP_PREV`
--

LOCK TABLES `OS_CURRENTSTEP_PREV` WRITE;
/*!40000 ALTER TABLE `OS_CURRENTSTEP_PREV` DISABLE KEYS */;
/*!40000 ALTER TABLE `OS_CURRENTSTEP_PREV` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OS_HISTORYSTEP_PREV`
--

DROP TABLE IF EXISTS `OS_HISTORYSTEP_PREV`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OS_HISTORYSTEP_PREV` (
  `ID` decimal(18,0) NOT NULL,
  `PREVIOUS_ID` decimal(18,0) NOT NULL,
  PRIMARY KEY (`ID`,`PREVIOUS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OS_HISTORYSTEP_PREV`
--

LOCK TABLES `OS_HISTORYSTEP_PREV` WRITE;
/*!40000 ALTER TABLE `OS_HISTORYSTEP_PREV` DISABLE KEYS */;
/*!40000 ALTER TABLE `OS_HISTORYSTEP_PREV` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OS_WFENTRY`
--

DROP TABLE IF EXISTS `OS_WFENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OS_WFENTRY` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `INITIALIZED` decimal(9,0) DEFAULT NULL,
  `STATE` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OS_WFENTRY`
--

LOCK TABLES `OS_WFENTRY` WRITE;
/*!40000 ALTER TABLE `OS_WFENTRY` DISABLE KEYS */;
/*!40000 ALTER TABLE `OS_WFENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQUENCE_VALUE_ITEM`
--

DROP TABLE IF EXISTS `SEQUENCE_VALUE_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQUENCE_VALUE_ITEM` (
  `SEQ_NAME` varchar(60) COLLATE utf8_bin NOT NULL,
  `SEQ_ID` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQUENCE_VALUE_ITEM`
--

LOCK TABLES `SEQUENCE_VALUE_ITEM` WRITE;
/*!40000 ALTER TABLE `SEQUENCE_VALUE_ITEM` DISABLE KEYS */;
INSERT INTO `SEQUENCE_VALUE_ITEM` VALUES ('ApplicationUser',10100),('AuditChangedValue',10100),('AuditItem',10100),('AuditLog',10100),('Avatar',10400),('ConfigurationContext',10100),('EventType',10000),('FieldConfigScheme',10100),('FieldConfigSchemeIssueType',10200),('FieldConfiguration',10100),('FieldLayout',10100),('FieldLayoutItem',10200),('FieldScreen',10000),('FieldScreenLayoutItem',10200),('FieldScreenScheme',10000),('FieldScreenSchemeItem',10100),('FieldScreenTab',10100),('GadgetUserPreference',10100),('GenericConfiguration',10100),('GlobalPermissionEntry',10100),('Group',10010),('IssueLinkType',10200),('IssueType',10000),('IssueTypeScreenSchemeEntity',10100),('ListenerConfig',10300),('Membership',10100),('Notification',10200),('NotificationScheme',10100),('OAuthConsumer',10100),('OSPropertyEntry',10400),('OptionConfiguration',10200),('PluginVersion',10200),('PortalPage',10100),('PortletConfiguration',10100),('Priority',10000),('ProjectRole',10100),('ProjectRoleActor',10100),('Resolution',10000),('RunDetails',10100),('SchemePermissions',10400),('ServiceConfig',10200),('SharePermissions',10100),('Status',10000),('UpgradeHistory',10100),('UpgradeVersionHistory',10100),('User',10100),('UserAttribute',10100),('UserHistoryItem',10100),('Workflow',10100),('WorkflowScheme',10100),('WorkflowSchemeEntity',10100);
/*!40000 ALTER TABLE `SEQUENCE_VALUE_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ao_563aee_activity_entity`
--

DROP TABLE IF EXISTS `ao_563aee_activity_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ao_563aee_activity_entity` (
  `ACTIVITY_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACTOR_ID` int(11) DEFAULT NULL,
  `CONTENT` longtext COLLATE utf8_bin,
  `GENERATOR_DISPLAY_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `GENERATOR_ID` varchar(767) COLLATE utf8_bin DEFAULT NULL,
  `ICON_ID` int(11) DEFAULT NULL,
  `ID` varchar(767) COLLATE utf8_bin DEFAULT NULL,
  `ISSUE_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_ID` int(11) DEFAULT NULL,
  `POSTER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PUBLISHED` datetime DEFAULT NULL,
  `TARGET_ID` int(11) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `URL` varchar(767) COLLATE utf8_bin DEFAULT NULL,
  `USERNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VERB` varchar(767) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ACTIVITY_ID`),
  KEY `index_ao_563aee_act1642652291` (`OBJECT_ID`),
  KEY `index_ao_563aee_act1978295567` (`TARGET_ID`),
  KEY `index_ao_563aee_act972488439` (`ICON_ID`),
  KEY `index_ao_563aee_act995325379` (`ACTOR_ID`),
  CONSTRAINT `fk_ao_563aee_activity_entity_object_id` FOREIGN KEY (`OBJECT_ID`) REFERENCES `AO_563AEE_OBJECT_ENTITY` (`ID`),
  CONSTRAINT `fk_ao_563aee_activity_entity_target_id` FOREIGN KEY (`TARGET_ID`) REFERENCES `AO_563AEE_TARGET_ENTITY` (`ID`),
  CONSTRAINT `fk_ao_563aee_activity_entity_icon_id` FOREIGN KEY (`ICON_ID`) REFERENCES `AO_563AEE_MEDIA_LINK_ENTITY` (`ID`),
  CONSTRAINT `fk_ao_563aee_activity_entity_actor_id` FOREIGN KEY (`ACTOR_ID`) REFERENCES `AO_563AEE_ACTOR_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ao_563aee_activity_entity`
--

LOCK TABLES `ao_563aee_activity_entity` WRITE;
/*!40000 ALTER TABLE `ao_563aee_activity_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `ao_563aee_activity_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ao_563aee_object_entity`
--

DROP TABLE IF EXISTS `ao_563aee_object_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ao_563aee_object_entity` (
  `CONTENT` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IMAGE_ID` int(11) DEFAULT NULL,
  `OBJECT_ID` varchar(767) COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_TYPE` varchar(767) COLLATE utf8_bin DEFAULT NULL,
  `SUMMARY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `URL` varchar(767) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `index_ao_563aee_obj696886343` (`IMAGE_ID`),
  CONSTRAINT `fk_ao_563aee_object_entity_image_id` FOREIGN KEY (`IMAGE_ID`) REFERENCES `AO_563AEE_MEDIA_LINK_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ao_563aee_object_entity`
--

LOCK TABLES `ao_563aee_object_entity` WRITE;
/*!40000 ALTER TABLE `ao_563aee_object_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `ao_563aee_object_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ao_563aee_target_entity`
--

DROP TABLE IF EXISTS `ao_563aee_target_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ao_563aee_target_entity` (
  `CONTENT` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IMAGE_ID` int(11) DEFAULT NULL,
  `OBJECT_ID` varchar(767) COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_TYPE` varchar(767) COLLATE utf8_bin DEFAULT NULL,
  `SUMMARY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `URL` varchar(767) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `index_ao_563aee_tar521440921` (`IMAGE_ID`),
  CONSTRAINT `fk_ao_563aee_target_entity_image_id` FOREIGN KEY (`IMAGE_ID`) REFERENCES `AO_563AEE_MEDIA_LINK_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ao_563aee_target_entity`
--

LOCK TABLES `ao_563aee_target_entity` WRITE;
/*!40000 ALTER TABLE `ao_563aee_target_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `ao_563aee_target_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ao_e8b6cc_branch`
--

DROP TABLE IF EXISTS `ao_e8b6cc_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ao_e8b6cc_branch` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REPOSITORY_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `index_ao_e8b6cc_bra405461593` (`REPOSITORY_ID`),
  CONSTRAINT `fk_ao_e8b6cc_branch_repository_id` FOREIGN KEY (`REPOSITORY_ID`) REFERENCES `AO_E8B6CC_REPOSITORY_MAPPING` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ao_e8b6cc_branch`
--

LOCK TABLES `ao_e8b6cc_branch` WRITE;
/*!40000 ALTER TABLE `ao_e8b6cc_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `ao_e8b6cc_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ao_e8b6cc_branch_head_mapping`
--

DROP TABLE IF EXISTS `ao_e8b6cc_branch_head_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
  CREATE TABLE `ao_e8b6cc_branch_head_mapping` (
  `BRANCH_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HEAD` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REPOSITORY_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `index_ao_e8b6cc_bra1368852151` (`REPOSITORY_ID`),
  CONSTRAINT `fk_ao_e8b6cc_branch_head_mapping_repository_id` FOREIGN KEY (`REPOSITORY_ID`) REFERENCES `AO_E8B6CC_REPOSITORY_MAPPING` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ao_e8b6cc_branch_head_mapping`
--

LOCK TABLES `ao_e8b6cc_branch_head_mapping` WRITE;
/*!40000 ALTER TABLE `ao_e8b6cc_branch_head_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `ao_e8b6cc_branch_head_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ao_e8b6cc_git_hub_event`
--

DROP TABLE IF EXISTS `ao_e8b6cc_git_hub_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ao_e8b6cc_git_hub_event` (
  `CREATED_AT` datetime NOT NULL,
  `GIT_HUB_ID` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REPOSITORY_ID` int(11) NOT NULL,
  `SAVE_POINT` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `index_ao_e8b6cc_git1804640320` (`REPOSITORY_ID`),
  CONSTRAINT `fk_ao_e8b6cc_git_hub_event_repository_id` FOREIGN KEY (`REPOSITORY_ID`) REFERENCES `AO_E8B6CC_REPOSITORY_MAPPING` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ao_e8b6cc_git_hub_event`
--

LOCK TABLES `ao_e8b6cc_git_hub_event` WRITE;
/*!40000 ALTER TABLE `ao_e8b6cc_git_hub_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `ao_e8b6cc_git_hub_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ao_e8b6cc_issue_to_branch`
--

DROP TABLE IF EXISTS `ao_e8b6cc_issue_to_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ao_e8b6cc_issue_to_branch` (
  `BRANCH_ID` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ISSUE_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `index_ao_e8b6cc_iss1325927291` (`BRANCH_ID`),
  CONSTRAINT `fk_ao_e8b6cc_issue_to_branch_branch_id` FOREIGN KEY (`BRANCH_ID`) REFERENCES `AO_E8B6CC_BRANCH` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ao_e8b6cc_issue_to_branch`
--

LOCK TABLES `ao_e8b6cc_issue_to_branch` WRITE;
/*!40000 ALTER TABLE `ao_e8b6cc_issue_to_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `ao_e8b6cc_issue_to_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ao_e8b6cc_issue_to_changeset`
--

DROP TABLE IF EXISTS `ao_e8b6cc_issue_to_changeset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ao_e8b6cc_issue_to_changeset` (
  `CHANGESET_ID` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ISSUE_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROJECT_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `index_ao_e8b6cc_iss1229805759` (`CHANGESET_ID`),
  CONSTRAINT `fk_ao_e8b6cc_issue_to_changeset_changeset_id` FOREIGN KEY (`CHANGESET_ID`) REFERENCES `AO_E8B6CC_CHANGESET_MAPPING` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ao_e8b6cc_issue_to_changeset`
--

LOCK TABLES `ao_e8b6cc_issue_to_changeset` WRITE;
/*!40000 ALTER TABLE `ao_e8b6cc_issue_to_changeset` DISABLE KEYS */;
/*!40000 ALTER TABLE `ao_e8b6cc_issue_to_changeset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ao_e8b6cc_message_queue_item`
--

DROP TABLE IF EXISTS `ao_e8b6cc_message_queue_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ao_e8b6cc_message_queue_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LAST_FAILED` datetime DEFAULT NULL,
  `MESSAGE_ID` int(11) NOT NULL,
  `QUEUE` varchar(255) COLLATE utf8_bin NOT NULL,
  `RETRIES_COUNT` int(11) NOT NULL DEFAULT '0',
  `STATE` varchar(255) COLLATE utf8_bin NOT NULL,
  `STATE_INFO` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `index_ao_e8b6cc_mes344532677` (`MESSAGE_ID`),
  CONSTRAINT `fk_ao_e8b6cc_message_queue_item_message_id` FOREIGN KEY (`MESSAGE_ID`) REFERENCES `AO_E8B6CC_MESSAGE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ao_e8b6cc_message_queue_item`
--

LOCK TABLES `ao_e8b6cc_message_queue_item` WRITE;
/*!40000 ALTER TABLE `ao_e8b6cc_message_queue_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `ao_e8b6cc_message_queue_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ao_e8b6cc_message_tag`
--

DROP TABLE IF EXISTS `ao_e8b6cc_message_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ao_e8b6cc_message_tag` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MESSAGE_ID` int(11) DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `index_ao_e8b6cc_mes1391090780` (`MESSAGE_ID`),
  CONSTRAINT `fk_ao_e8b6cc_message_tag_message_id` FOREIGN KEY (`MESSAGE_ID`) REFERENCES `AO_E8B6CC_MESSAGE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ao_e8b6cc_message_tag`
--

LOCK TABLES `ao_e8b6cc_message_tag` WRITE;
/*!40000 ALTER TABLE `ao_e8b6cc_message_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `ao_e8b6cc_message_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ao_e8b6cc_pr_participant`
--

DROP TABLE IF EXISTS `ao_e8b6cc_pr_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ao_e8b6cc_pr_participant` (
  `APPROVED` tinyint(1) DEFAULT NULL,
  `DOMAIN_ID` int(11) NOT NULL DEFAULT '0',
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PULL_REQUEST_ID` int(11) DEFAULT NULL,
  `ROLE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USERNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `index_ao_e8b6cc_pr_1105917040` (`PULL_REQUEST_ID`),
  CONSTRAINT `fk_ao_e8b6cc_pr_participant_pull_request_id` FOREIGN KEY (`PULL_REQUEST_ID`) REFERENCES `AO_E8B6CC_PULL_REQUEST` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ao_e8b6cc_pr_participant`
--

LOCK TABLES `ao_e8b6cc_pr_participant` WRITE;
/*!40000 ALTER TABLE `ao_e8b6cc_pr_participant` DISABLE KEYS */;
/*!40000 ALTER TABLE `ao_e8b6cc_pr_participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ao_e8b6cc_pr_to_commit`
--

DROP TABLE IF EXISTS `ao_e8b6cc_pr_to_commit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ao_e8b6cc_pr_to_commit` (
  `COMMIT_ID` int(11) NOT NULL,
  `DOMAIN_ID` int(11) NOT NULL DEFAULT '0',
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REQUEST_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `index_ao_e8b6cc_pr_1045528152` (`REQUEST_ID`),
  KEY `index_ao_e8b6cc_pr_1458633226` (`COMMIT_ID`),
  CONSTRAINT `fk_ao_e8b6cc_pr_to_commit_request_id` FOREIGN KEY (`REQUEST_ID`) REFERENCES `AO_E8B6CC_PULL_REQUEST` (`ID`),
  CONSTRAINT `fk_ao_e8b6cc_pr_to_commit_commit_id` FOREIGN KEY (`COMMIT_ID`) REFERENCES `AO_E8B6CC_COMMIT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ao_e8b6cc_pr_to_commit`
--

LOCK TABLES `ao_e8b6cc_pr_to_commit` WRITE;
/*!40000 ALTER TABLE `ao_e8b6cc_pr_to_commit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ao_e8b6cc_pr_to_commit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ao_e8b6cc_repo_to_changeset`
--

DROP TABLE IF EXISTS `ao_e8b6cc_repo_to_changeset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ao_e8b6cc_repo_to_changeset` (
  `CHANGESET_ID` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REPOSITORY_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `index_ao_e8b6cc_rep1082901832` (`REPOSITORY_ID`),
  KEY `index_ao_e8b6cc_rep922992576` (`CHANGESET_ID`),
  CONSTRAINT `fk_ao_e8b6cc_repo_to_changeset_repository_id` FOREIGN KEY (`REPOSITORY_ID`) REFERENCES `AO_E8B6CC_REPOSITORY_MAPPING` (`ID`),
  CONSTRAINT `fk_ao_e8b6cc_repo_to_changeset_changeset_id` FOREIGN KEY (`CHANGESET_ID`) REFERENCES `AO_E8B6CC_CHANGESET_MAPPING` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ao_e8b6cc_repo_to_changeset`
--

LOCK TABLES `ao_e8b6cc_repo_to_changeset` WRITE;
/*!40000 ALTER TABLE `ao_e8b6cc_repo_to_changeset` DISABLE KEYS */;
/*!40000 ALTER TABLE `ao_e8b6cc_repo_to_changeset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ao_e8b6cc_sync_event`
--

DROP TABLE IF EXISTS `ao_e8b6cc_sync_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ao_e8b6cc_sync_event` (
  `EVENT_CLASS` longtext COLLATE utf8_bin NOT NULL,
  `EVENT_DATE` datetime NOT NULL,
  `EVENT_JSON` longtext COLLATE utf8_bin NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REPO_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `index_ao_e8b6cc_syn493078035` (`REPO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ao_e8b6cc_sync_event`
--

LOCK TABLES `ao_e8b6cc_sync_event` WRITE;
/*!40000 ALTER TABLE `ao_e8b6cc_sync_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `ao_e8b6cc_sync_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_user` (
  `ID` decimal(18,0) NOT NULL,
  `user_key` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lower_user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uk_user_key` (`user_key`),
  UNIQUE KEY `uk_lower_user_name` (`lower_user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (10000,'admin','admin');
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_changed_value`
--

DROP TABLE IF EXISTS `audit_changed_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_changed_value` (
  `ID` decimal(18,0) NOT NULL,
  `LOG_ID` decimal(18,0) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELTA_FROM` longtext COLLATE utf8_bin,
  `DELTA_TO` longtext COLLATE utf8_bin,
  PRIMARY KEY (`ID`),
  KEY `idx_changed_value_log_id` (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_changed_value`
--

LOCK TABLES `audit_changed_value` WRITE;
/*!40000 ALTER TABLE `audit_changed_value` DISABLE KEYS */;
INSERT INTO `audit_changed_value` VALUES (10000,10000,'Username',NULL,'admin'),(10001,10000,'Full Name',NULL,'Administrator'),(10002,10000,'Email',NULL,'admin@example.com'),(10003,10000,'Active / Inactive',NULL,'Active');
/*!40000 ALTER TABLE `audit_changed_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_item`
--

DROP TABLE IF EXISTS `audit_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_item` (
  `ID` decimal(18,0) NOT NULL,
  `LOG_ID` decimal(18,0) DEFAULT NULL,
  `OBJECT_TYPE` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_PARENT_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_PARENT_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_audit_item_log_id2` (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_item`
--

LOCK TABLES `audit_item` WRITE;
/*!40000 ALTER TABLE `audit_item` DISABLE KEYS */;
INSERT INTO `audit_item` VALUES (10000,10001,'USER','admin','admin','1','JIRA Internal Directory'),(10001,10002,'USER','admin','admin','1','JIRA Internal Directory'),(10002,10003,'USER','admin','admin','1','JIRA Internal Directory');
/*!40000 ALTER TABLE `audit_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_log` (
  `ID` decimal(18,0) NOT NULL,
  `REMOTE_ADDRESS` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `AUTHOR_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUMMARY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_TYPE` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_PARENT_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OBJECT_PARENT_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `AUTHOR_TYPE` decimal(9,0) DEFAULT NULL,
  `EVENT_SOURCE_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_FIELD` longtext COLLATE utf8_bin,
  PRIMARY KEY (`ID`),
  KEY `idx_audit_log_created` (`CREATED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_log`
--

LOCK TABLES `audit_log` WRITE;
/*!40000 ALTER TABLE `audit_log` DISABLE KEYS */;
INSERT INTO `audit_log` VALUES (10000,'0:0:0:0:0:0:0:1','2014-11-13 20:22:40',NULL,'User created','user management','USER','admin','admin','1','JIRA Internal Directory',0,'','0:0:0:0:0:0:0:1 user created management admin jira internal directory administrator admin@example.com active'),(10001,'0:0:0:0:0:0:0:1','2014-11-13 20:22:40',NULL,'User added to group','group management','GROUP',NULL,'jira-users','1','JIRA Internal Directory',0,'','0:0:0:0:0:0:0:1 user added to group management jira-users jira internal directory admin'),(10002,'0:0:0:0:0:0:0:1','2014-11-13 20:22:40',NULL,'User added to group','group management','GROUP',NULL,'jira-administrators','1','JIRA Internal Directory',0,'','0:0:0:0:0:0:0:1 user added to group management jira-administrators jira internal directory admin'),(10003,'0:0:0:0:0:0:0:1','2014-11-13 20:22:40',NULL,'User added to group','group management','GROUP',NULL,'jira-developers','1','JIRA Internal Directory',0,'','0:0:0:0:0:0:0:1 user added to group management jira-developers jira internal directory admin');
/*!40000 ALTER TABLE `audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avatar`
--

DROP TABLE IF EXISTS `avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avatar` (
  `ID` decimal(18,0) NOT NULL,
  `filename` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contenttype` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `avatartype` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `owner` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `systemavatar` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `avatar_index` (`avatartype`,`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatar`
--

LOCK TABLES `avatar` WRITE;
/*!40000 ALTER TABLE `avatar` DISABLE KEYS */;
INSERT INTO `avatar` VALUES (10000,'codegeist.png','image/png','project',NULL,1),(10001,'eamesbird.png','image/png','project',NULL,1),(10002,'jm_black.png','image/png','project',NULL,1),(10003,'jm_brown.png','image/png','project',NULL,1),(10004,'jm_orange.png','image/png','project',NULL,1),(10005,'jm_red.png','image/png','project',NULL,1),(10006,'jm_white.png','image/png','project',NULL,1),(10007,'jm_yellow.png','image/png','project',NULL,1),(10008,'monster.png','image/png','project',NULL,1),(10009,'rainbow.png','image/png','project',NULL,1),(10010,'kangaroo.png','image/png','project',NULL,1),(10011,'rocket.png','image/png','project',NULL,1),(10100,'Avatar-1.png','image/png','user',NULL,1),(10101,'Avatar-2.png','image/png','user',NULL,1),(10102,'Avatar-3.png','image/png','user',NULL,1),(10103,'Avatar-4.png','image/png','user',NULL,1),(10104,'Avatar-5.png','image/png','user',NULL,1),(10105,'Avatar-6.png','image/png','user',NULL,1),(10106,'Avatar-7.png','image/png','user',NULL,1),(10107,'Avatar-8.png','image/png','user',NULL,1),(10108,'Avatar-9.png','image/png','user',NULL,1),(10109,'Avatar-10.png','image/png','user',NULL,1),(10110,'Avatar-11.png','image/png','user',NULL,1),(10111,'Avatar-12.png','image/png','user',NULL,1),(10112,'Avatar-13.png','image/png','user',NULL,1),(10113,'Avatar-14.png','image/png','user',NULL,1),(10114,'Avatar-15.png','image/png','user',NULL,1),(10115,'Avatar-16.png','image/png','user',NULL,1),(10116,'Avatar-17.png','image/png','user',NULL,1),(10117,'Avatar-18.png','image/png','user',NULL,1),(10118,'Avatar-19.png','image/png','user',NULL,1),(10119,'Avatar-20.png','image/png','user',NULL,1),(10120,'Avatar-21.png','image/png','user',NULL,1),(10121,'Avatar-22.png','image/png','user',NULL,1),(10122,'Avatar-default.png','image/png','user',NULL,1),(10123,'Avatar-unknown.png','image/png','user',NULL,1),(10200,'cloud.png','image/png','project',NULL,1),(10201,'config.png','image/png','project',NULL,1),(10202,'disc.png','image/png','project',NULL,1),(10203,'finance.png','image/png','project',NULL,1),(10204,'hand.png','image/png','project',NULL,1),(10205,'new_monster.png','image/png','project',NULL,1),(10206,'power.png','image/png','project',NULL,1),(10207,'refresh.png','image/png','project',NULL,1),(10208,'servicedesk.png','image/png','project',NULL,1),(10209,'settings.png','image/png','project',NULL,1),(10210,'storm.png','image/png','project',NULL,1),(10211,'travel.png','image/png','project',NULL,1),(10300,'genericissue.png','image/png','issuetype',NULL,1),(10301,'all_unassigned.png','image/png','issuetype',NULL,1),(10302,'blank.png','image/png','issuetype',NULL,1),(10303,'bug.png','image/png','issuetype',NULL,1),(10304,'defect.png','image/png','issuetype',NULL,1),(10305,'delete.png','image/png','issuetype',NULL,1),(10306,'documentation.png','image/png','issuetype',NULL,1),(10307,'epic.png','image/png','issuetype',NULL,1),(10308,'exclamation.png','image/png','issuetype',NULL,1),(10309,'health.png','image/png','issuetype',NULL,1),(10310,'improvement.png','image/png','issuetype',NULL,1),(10311,'newfeature.png','image/png','issuetype',NULL,1),(10312,'remove_feature.png','image/png','issuetype',NULL,1),(10313,'requirement.png','image/png','issuetype',NULL,1),(10314,'sales.png','image/png','issuetype',NULL,1),(10315,'story.png','image/png','issuetype',NULL,1),(10316,'subtask.png','image/png','issuetype',NULL,1),(10317,'subtask_alternate.png','image/png','issuetype',NULL,1),(10318,'task.png','image/png','issuetype',NULL,1),(10319,'task_agile.png','image/png','issuetype',NULL,1),(10320,'undefined.png','image/png','issuetype',NULL,1);
/*!40000 ALTER TABLE `avatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changegroup`
--

DROP TABLE IF EXISTS `changegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changegroup` (
  `ID` decimal(18,0) NOT NULL,
  `issueid` decimal(18,0) DEFAULT NULL,
  `AUTHOR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `chggroup_issue` (`issueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changegroup`
--

LOCK TABLES `changegroup` WRITE;
/*!40000 ALTER TABLE `changegroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `changegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changeitem`
--

DROP TABLE IF EXISTS `changeitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changeitem` (
  `ID` decimal(18,0) NOT NULL,
  `groupid` decimal(18,0) DEFAULT NULL,
  `FIELDTYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FIELD` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OLDVALUE` longtext COLLATE utf8_bin,
  `OLDSTRING` longtext COLLATE utf8_bin,
  `NEWVALUE` longtext COLLATE utf8_bin,
  `NEWSTRING` longtext COLLATE utf8_bin,
  PRIMARY KEY (`ID`),
  KEY `chgitem_chggrp` (`groupid`),
  KEY `chgitem_field` (`FIELD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changeitem`
--

LOCK TABLES `changeitem` WRITE;
/*!40000 ALTER TABLE `changeitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `changeitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clusterlockstatus`
--

DROP TABLE IF EXISTS `clusterlockstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clusterlockstatus` (
  `ID` decimal(18,0) NOT NULL,
  `LOCK_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCKED_BY_NODE` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `UPDATE_TIME` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `cluster_lock_name_idx` (`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clusterlockstatus`
--

LOCK TABLES `clusterlockstatus` WRITE;
/*!40000 ALTER TABLE `clusterlockstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `clusterlockstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clustermessage`
--

DROP TABLE IF EXISTS `clustermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clustermessage` (
  `ID` decimal(18,0) NOT NULL,
  `SOURCE_NODE` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `DESTINATION_NODE` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `CLAIMED_BY_NODE` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `source_destination_node_idx` (`SOURCE_NODE`,`DESTINATION_NODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clustermessage`
--

LOCK TABLES `clustermessage` WRITE;
/*!40000 ALTER TABLE `clustermessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `clustermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clusternode`
--

DROP TABLE IF EXISTS `clusternode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clusternode` (
  `NODE_ID` varchar(60) COLLATE utf8_bin NOT NULL,
  `NODE_STATE` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`NODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clusternode`
--

LOCK TABLES `clusternode` WRITE;
/*!40000 ALTER TABLE `clusternode` DISABLE KEYS */;
/*!40000 ALTER TABLE `clusternode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clusternodeheartbeat`
--

DROP TABLE IF EXISTS `clusternodeheartbeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clusternodeheartbeat` (
  `NODE_ID` varchar(60) COLLATE utf8_bin NOT NULL,
  `HEARTBEAT_TIME` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`NODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clusternodeheartbeat`
--

LOCK TABLES `clusternodeheartbeat` WRITE;
/*!40000 ALTER TABLE `clusternodeheartbeat` DISABLE KEYS */;
/*!40000 ALTER TABLE `clusternodeheartbeat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `columnlayout`
--

DROP TABLE IF EXISTS `columnlayout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `columnlayout` (
  `ID` decimal(18,0) NOT NULL,
  `USERNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEARCHREQUEST` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `cl_searchrequest` (`SEARCHREQUEST`),
  KEY `cl_username` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columnlayout`
--

LOCK TABLES `columnlayout` WRITE;
/*!40000 ALTER TABLE `columnlayout` DISABLE KEYS */;
/*!40000 ALTER TABLE `columnlayout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `columnlayoutitem`
--

DROP TABLE IF EXISTS `columnlayoutitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `columnlayoutitem` (
  `ID` decimal(18,0) NOT NULL,
  `COLUMNLAYOUT` decimal(18,0) DEFAULT NULL,
  `FIELDIDENTIFIER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HORIZONTALPOSITION` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columnlayoutitem`
--

LOCK TABLES `columnlayoutitem` WRITE;
/*!40000 ALTER TABLE `columnlayoutitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `columnlayoutitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `component` (
  `ID` decimal(18,0) NOT NULL,
  `PROJECT` decimal(18,0) DEFAULT NULL,
  `cname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `URL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LEAD` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEETYPE` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
/*!40000 ALTER TABLE `component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurationcontext`
--

DROP TABLE IF EXISTS `configurationcontext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurationcontext` (
  `ID` decimal(18,0) NOT NULL,
  `PROJECTCATEGORY` decimal(18,0) DEFAULT NULL,
  `PROJECT` decimal(18,0) DEFAULT NULL,
  `customfield` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FIELDCONFIGSCHEME` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `confcontext` (`PROJECTCATEGORY`,`PROJECT`,`customfield`),
  KEY `confcontextprojectkey` (`PROJECT`,`customfield`),
  KEY `confcontextfieldconfigscheme` (`FIELDCONFIGSCHEME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurationcontext`
--

LOCK TABLES `configurationcontext` WRITE;
/*!40000 ALTER TABLE `configurationcontext` DISABLE KEYS */;
INSERT INTO `configurationcontext` VALUES (10000,NULL,NULL,'issuetype',10000);
/*!40000 ALTER TABLE `configurationcontext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customfield`
--

DROP TABLE IF EXISTS `customfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customfield` (
  `ID` decimal(18,0) NOT NULL,
  `CUSTOMFIELDTYPEKEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOMFIELDSEARCHERKEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cfname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  `defaultvalue` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FIELDTYPE` decimal(18,0) DEFAULT NULL,
  `PROJECT` decimal(18,0) DEFAULT NULL,
  `ISSUETYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customfield`
--

LOCK TABLES `customfield` WRITE;
/*!40000 ALTER TABLE `customfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `customfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customfieldoption`
--

DROP TABLE IF EXISTS `customfieldoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customfieldoption` (
  `ID` decimal(18,0) NOT NULL,
  `CUSTOMFIELD` decimal(18,0) DEFAULT NULL,
  `CUSTOMFIELDCONFIG` decimal(18,0) DEFAULT NULL,
  `PARENTOPTIONID` decimal(18,0) DEFAULT NULL,
  `SEQUENCE` decimal(18,0) DEFAULT NULL,
  `customvalue` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `optiontype` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `disabled` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `cf_cfoption` (`CUSTOMFIELD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customfieldoption`
--

LOCK TABLES `customfieldoption` WRITE;
/*!40000 ALTER TABLE `customfieldoption` DISABLE KEYS */;
/*!40000 ALTER TABLE `customfieldoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customfieldvalue`
--

DROP TABLE IF EXISTS `customfieldvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customfieldvalue` (
  `ID` decimal(18,0) NOT NULL,
  `ISSUE` decimal(18,0) DEFAULT NULL,
  `CUSTOMFIELD` decimal(18,0) DEFAULT NULL,
  `PARENTKEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `STRINGVALUE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NUMBERVALUE` decimal(18,6) DEFAULT NULL,
  `TEXTVALUE` longtext COLLATE utf8_bin,
  `DATEVALUE` datetime DEFAULT NULL,
  `VALUETYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `cfvalue_issue` (`ISSUE`,`CUSTOMFIELD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customfieldvalue`
--

LOCK TABLES `customfieldvalue` WRITE;
/*!40000 ALTER TABLE `customfieldvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `customfieldvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cwd_application`
--

DROP TABLE IF EXISTS `cwd_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cwd_application` (
  `ID` decimal(18,0) NOT NULL,
  `application_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lower_application_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `active` decimal(9,0) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `application_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `credential` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uk_application_name` (`lower_application_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cwd_application`
--

LOCK TABLES `cwd_application` WRITE;
/*!40000 ALTER TABLE `cwd_application` DISABLE KEYS */;
INSERT INTO `cwd_application` VALUES (1,'crowd-embedded','crowd-embedded','2013-02-28 11:57:51','2013-02-28 11:57:51',1,'','CROWD','X');
/*!40000 ALTER TABLE `cwd_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cwd_application_address`
--

DROP TABLE IF EXISTS `cwd_application_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cwd_application_address` (
  `application_id` decimal(18,0) NOT NULL,
  `remote_address` varchar(255) COLLATE utf8_bin NOT NULL,
  `encoded_address_binary` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `remote_address_mask` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`application_id`,`remote_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cwd_application_address`
--

LOCK TABLES `cwd_application_address` WRITE;
/*!40000 ALTER TABLE `cwd_application_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `cwd_application_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cwd_directory`
--

DROP TABLE IF EXISTS `cwd_directory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cwd_directory` (
  `ID` decimal(18,0) NOT NULL,
  `directory_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lower_directory_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `active` decimal(9,0) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `impl_class` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lower_impl_class` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `directory_type` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `directory_position` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `uk_directory_name` (`lower_directory_name`),
  KEY `idx_directory_active` (`active`),
  KEY `idx_directory_impl` (`lower_impl_class`),
  KEY `idx_directory_type` (`directory_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cwd_directory`
--

LOCK TABLES `cwd_directory` WRITE;
/*!40000 ALTER TABLE `cwd_directory` DISABLE KEYS */;
INSERT INTO `cwd_directory` VALUES (1,'JIRA Internal Directory','jira internal directory','2013-02-28 11:57:51','2013-02-28 11:57:51',1,'JIRA default internal directory','com.atlassian.crowd.directory.InternalDirectory','com.atlassian.crowd.directory.internaldirectory','INTERNAL',0);
/*!40000 ALTER TABLE `cwd_directory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cwd_directory_attribute`
--

DROP TABLE IF EXISTS `cwd_directory_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cwd_directory_attribute` (
  `directory_id` decimal(18,0) NOT NULL,
  `attribute_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `attribute_value` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`directory_id`,`attribute_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cwd_directory_attribute`
--

LOCK TABLES `cwd_directory_attribute` WRITE;
/*!40000 ALTER TABLE `cwd_directory_attribute` DISABLE KEYS */;
INSERT INTO `cwd_directory_attribute` VALUES (1,'user_encryption_method','atlassian-security');
/*!40000 ALTER TABLE `cwd_directory_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cwd_directory_operation`
--

DROP TABLE IF EXISTS `cwd_directory_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cwd_directory_operation` (
  `directory_id` decimal(18,0) NOT NULL,
  `operation_type` varchar(60) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`directory_id`,`operation_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cwd_directory_operation`
--

LOCK TABLES `cwd_directory_operation` WRITE;
/*!40000 ALTER TABLE `cwd_directory_operation` DISABLE KEYS */;
INSERT INTO `cwd_directory_operation` VALUES (1,'CREATE_GROUP'),(1,'CREATE_ROLE'),(1,'CREATE_USER'),(1,'DELETE_GROUP'),(1,'DELETE_ROLE'),(1,'DELETE_USER'),(1,'UPDATE_GROUP'),(1,'UPDATE_GROUP_ATTRIBUTE'),(1,'UPDATE_ROLE'),(1,'UPDATE_ROLE_ATTRIBUTE'),(1,'UPDATE_USER'),(1,'UPDATE_USER_ATTRIBUTE');
/*!40000 ALTER TABLE `cwd_directory_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cwd_group`
--

DROP TABLE IF EXISTS `cwd_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cwd_group` (
  `ID` decimal(18,0) NOT NULL,
  `group_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lower_group_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `active` decimal(9,0) DEFAULT NULL,
  `local` decimal(9,0) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lower_description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `group_type` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `directory_id` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uk_group_name_dir_id` (`lower_group_name`,`directory_id`),
  KEY `idx_group_active` (`lower_group_name`,`active`),
  KEY `idx_group_dir_id` (`directory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cwd_group`
--

LOCK TABLES `cwd_group` WRITE;
/*!40000 ALTER TABLE `cwd_group` DISABLE KEYS */;
INSERT INTO `cwd_group` VALUES (10000,'jira-administrators','jira-administrators',1,0,'2013-02-28 11:57:51','2013-02-28 11:57:51','',NULL,'GROUP',1),(10001,'jira-developers','jira-developers',1,0,'2013-02-28 11:57:51','2013-02-28 11:57:51','',NULL,'GROUP',1),(10002,'jira-users','jira-users',1,0,'2013-02-28 11:57:51','2013-02-28 11:57:51','',NULL,'GROUP',1);
/*!40000 ALTER TABLE `cwd_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cwd_group_attributes`
--

DROP TABLE IF EXISTS `cwd_group_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cwd_group_attributes` (
  `ID` decimal(18,0) NOT NULL,
  `group_id` decimal(18,0) DEFAULT NULL,
  `directory_id` decimal(18,0) DEFAULT NULL,
  `attribute_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `attribute_value` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lower_attribute_value` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uk_group_attr_name_lval` (`group_id`,`attribute_name`,`lower_attribute_value`),
  KEY `idx_group_attr_dir_name_lval` (`directory_id`,`attribute_name`,`lower_attribute_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cwd_group_attributes`
--

LOCK TABLES `cwd_group_attributes` WRITE;
/*!40000 ALTER TABLE `cwd_group_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cwd_group_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cwd_membership`
--

DROP TABLE IF EXISTS `cwd_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cwd_membership` (
  `ID` decimal(18,0) NOT NULL,
  `parent_id` decimal(18,0) DEFAULT NULL,
  `child_id` decimal(18,0) DEFAULT NULL,
  `membership_type` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `group_type` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `parent_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lower_parent_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `child_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lower_child_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `directory_id` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uk_mem_parent_child_type` (`parent_id`,`child_id`,`membership_type`),
  KEY `idx_mem_dir_parent_child` (`lower_parent_name`,`lower_child_name`,`membership_type`,`directory_id`),
  KEY `idx_mem_dir_parent` (`lower_parent_name`,`membership_type`,`directory_id`),
  KEY `idx_mem_dir_child` (`lower_child_name`,`membership_type`,`directory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cwd_membership`
--

LOCK TABLES `cwd_membership` WRITE;
/*!40000 ALTER TABLE `cwd_membership` DISABLE KEYS */;
INSERT INTO `cwd_membership` VALUES (10000,10002,10000,'GROUP_USER',NULL,'jira-users','jira-users','admin','admin',1),(10001,10000,10000,'GROUP_USER',NULL,'jira-administrators','jira-administrators','admin','admin',1),(10002,10001,10000,'GROUP_USER',NULL,'jira-developers','jira-developers','admin','admin',1);
/*!40000 ALTER TABLE `cwd_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cwd_user`
--

DROP TABLE IF EXISTS `cwd_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cwd_user` (
  `ID` decimal(18,0) NOT NULL,
  `directory_id` decimal(18,0) DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lower_user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `active` decimal(9,0) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lower_first_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lower_last_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `display_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lower_display_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email_address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lower_email_address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREDENTIAL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `deleted_externally` decimal(9,0) DEFAULT NULL,
  `EXTERNAL_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uk_user_name_dir_id` (`lower_user_name`,`directory_id`),
  KEY `uk_user_externalid_dir_id` (`EXTERNAL_ID`,`directory_id`),
  KEY `idx_first_name` (`lower_first_name`),
  KEY `idx_last_name` (`lower_last_name`),
  KEY `idx_display_name` (`lower_display_name`),
  KEY `idx_email_address` (`lower_email_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cwd_user`
--

LOCK TABLES `cwd_user` WRITE;
/*!40000 ALTER TABLE `cwd_user` DISABLE KEYS */;
INSERT INTO `cwd_user` VALUES (10000,1,'admin','admin',1,'2014-11-13 20:22:40','2014-11-13 20:22:40','','','Administrator','administrator','Administrator','administrator','admin@example.com','admin@example.com','{PKCS5S2}Zt3ZnC3yj9Y7/oOWpN7y9KMlzpUTDdnnf3Y0GAge1MKtCUBJlh1pQ9S8TE2cvHJy',NULL,'4f9b3bbb-bc3b-47d4-8ba0-76ca72e14e14');
/*!40000 ALTER TABLE `cwd_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cwd_user_attributes`
--

DROP TABLE IF EXISTS `cwd_user_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cwd_user_attributes` (
  `ID` decimal(18,0) NOT NULL,
  `user_id` decimal(18,0) DEFAULT NULL,
  `directory_id` decimal(18,0) DEFAULT NULL,
  `attribute_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `attribute_value` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lower_attribute_value` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_user_attr_dir_name_lval` (`directory_id`,`attribute_name`,`lower_attribute_value`),
  KEY `uk_user_attr_name_lval` (`user_id`,`attribute_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cwd_user_attributes`
--

LOCK TABLES `cwd_user_attributes` WRITE;
/*!40000 ALTER TABLE `cwd_user_attributes` DISABLE KEYS */;
INSERT INTO `cwd_user_attributes` VALUES (10000,10000,1,'requiresPasswordChange','false','false'),(10001,10000,1,'passwordLastChanged','1415870560190','1415870560190'),(10002,10000,1,'password.reset.request.expiry','1415956960343','1415956960343'),(10003,10000,1,'password.reset.request.token','343b3dd3462f952332e49e9346cabcdf25bcf98b','343b3dd3462f952332e49e9346cabcdf25bcf98b');
/*!40000 ALTER TABLE `cwd_user_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `draftworkflowscheme`
--

DROP TABLE IF EXISTS `draftworkflowscheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `draftworkflowscheme` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  `WORKFLOW_SCHEME_ID` decimal(18,0) DEFAULT NULL,
  `LAST_MODIFIED_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED_USER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `draft_workflow_scheme_parent` (`WORKFLOW_SCHEME_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draftworkflowscheme`
--

LOCK TABLES `draftworkflowscheme` WRITE;
/*!40000 ALTER TABLE `draftworkflowscheme` DISABLE KEYS */;
/*!40000 ALTER TABLE `draftworkflowscheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `draftworkflowschemeentity`
--

DROP TABLE IF EXISTS `draftworkflowschemeentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `draftworkflowschemeentity` (
  `ID` decimal(18,0) NOT NULL,
  `SCHEME` decimal(18,0) DEFAULT NULL,
  `WORKFLOW` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `issuetype` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `draft_workflow_scheme` (`SCHEME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draftworkflowschemeentity`
--

LOCK TABLES `draftworkflowschemeentity` WRITE;
/*!40000 ALTER TABLE `draftworkflowschemeentity` DISABLE KEYS */;
/*!40000 ALTER TABLE `draftworkflowschemeentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_property`
--

DROP TABLE IF EXISTS `entity_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_property` (
  `ID` decimal(18,0) NOT NULL,
  `ENTITY_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_ID` decimal(18,0) DEFAULT NULL,
  `PROPERTY_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `UPDATED` datetime DEFAULT NULL,
  `json_value` longtext COLLATE utf8_bin,
  PRIMARY KEY (`ID`),
  KEY `entityproperty_identiti` (`ENTITY_NAME`,`ENTITY_ID`,`PROPERTY_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_property`
--

LOCK TABLES `entity_property` WRITE;
/*!40000 ALTER TABLE `entity_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_property_index_document`
--

DROP TABLE IF EXISTS `entity_property_index_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_property_index_document` (
  `ID` decimal(18,0) NOT NULL,
  `PLUGIN_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MODULE_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `UPDATED` datetime DEFAULT NULL,
  `DOCUMENT` longtext COLLATE utf8_bin,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `entpropindexdoc_module` (`PLUGIN_KEY`,`MODULE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_property_index_document`
--

LOCK TABLES `entity_property_index_document` WRITE;
/*!40000 ALTER TABLE `entity_property_index_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_property_index_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_entities`
--

DROP TABLE IF EXISTS `external_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_entities` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `entitytype` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ext_entity_name` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_entities`
--

LOCK TABLES `external_entities` WRITE;
/*!40000 ALTER TABLE `external_entities` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externalgadget`
--

DROP TABLE IF EXISTS `externalgadget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externalgadget` (
  `ID` decimal(18,0) NOT NULL,
  `GADGET_XML` text COLLATE utf8_bin,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `externalgadget`
--

LOCK TABLES `externalgadget` WRITE;
/*!40000 ALTER TABLE `externalgadget` DISABLE KEYS */;
/*!40000 ALTER TABLE `externalgadget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favouriteassociations`
--

DROP TABLE IF EXISTS `favouriteassociations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favouriteassociations` (
  `ID` decimal(18,0) NOT NULL,
  `USERNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `entitytype` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `entityid` decimal(18,0) DEFAULT NULL,
  `SEQUENCE` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `favourite_index` (`USERNAME`,`entitytype`,`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favouriteassociations`
--

LOCK TABLES `favouriteassociations` WRITE;
/*!40000 ALTER TABLE `favouriteassociations` DISABLE KEYS */;
/*!40000 ALTER TABLE `favouriteassociations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature` (
  `ID` decimal(18,0) NOT NULL,
  `FEATURE_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FEATURE_TYPE` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `USER_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `feature_id_userkey` (`ID`,`USER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature`
--

LOCK TABLES `feature` WRITE;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldconfigscheme`
--

DROP TABLE IF EXISTS `fieldconfigscheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldconfigscheme` (
  `ID` decimal(18,0) NOT NULL,
  `configname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  `FIELDID` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOMFIELD` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fcs_fieldid` (`FIELDID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldconfigscheme`
--

LOCK TABLES `fieldconfigscheme` WRITE;
/*!40000 ALTER TABLE `fieldconfigscheme` DISABLE KEYS */;
INSERT INTO `fieldconfigscheme` VALUES (10000,'Default Issue Type Scheme','Default issue type scheme is the list of global issue types. All newly created issue types will automatically be added to this scheme.','issuetype',NULL);
/*!40000 ALTER TABLE `fieldconfigscheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldconfigschemeissuetype`
--

DROP TABLE IF EXISTS `fieldconfigschemeissuetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldconfigschemeissuetype` (
  `ID` decimal(18,0) NOT NULL,
  `ISSUETYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FIELDCONFIGSCHEME` decimal(18,0) DEFAULT NULL,
  `FIELDCONFIGURATION` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fcs_issuetype` (`ISSUETYPE`),
  KEY `fcs_scheme` (`FIELDCONFIGSCHEME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldconfigschemeissuetype`
--

LOCK TABLES `fieldconfigschemeissuetype` WRITE;
/*!40000 ALTER TABLE `fieldconfigschemeissuetype` DISABLE KEYS */;
INSERT INTO `fieldconfigschemeissuetype` VALUES (10100,NULL,10000,10000);
/*!40000 ALTER TABLE `fieldconfigschemeissuetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldconfiguration`
--

DROP TABLE IF EXISTS `fieldconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldconfiguration` (
  `ID` decimal(18,0) NOT NULL,
  `configname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  `FIELDID` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOMFIELD` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fc_fieldid` (`FIELDID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldconfiguration`
--

LOCK TABLES `fieldconfiguration` WRITE;
/*!40000 ALTER TABLE `fieldconfiguration` DISABLE KEYS */;
INSERT INTO `fieldconfiguration` VALUES (10000,'Default Configuration for Issue Type','Default configuration generated by JIRA','issuetype',NULL);
/*!40000 ALTER TABLE `fieldconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayout`
--

DROP TABLE IF EXISTS `fieldlayout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayout` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `layout_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAYOUTSCHEME` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayout`
--

LOCK TABLES `fieldlayout` WRITE;
/*!40000 ALTER TABLE `fieldlayout` DISABLE KEYS */;
INSERT INTO `fieldlayout` VALUES (10000,'Default Field Configuration','The default field configuration','default',NULL);
/*!40000 ALTER TABLE `fieldlayout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutitem`
--

DROP TABLE IF EXISTS `fieldlayoutitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutitem` (
  `ID` decimal(18,0) NOT NULL,
  `FIELDLAYOUT` decimal(18,0) DEFAULT NULL,
  `FIELDIDENTIFIER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  `VERTICALPOSITION` decimal(18,0) DEFAULT NULL,
  `ISHIDDEN` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `ISREQUIRED` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `RENDERERTYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutitem`
--

LOCK TABLES `fieldlayoutitem` WRITE;
/*!40000 ALTER TABLE `fieldlayoutitem` DISABLE KEYS */;
INSERT INTO `fieldlayoutitem` VALUES (10100,10000,'summary',NULL,NULL,'false','true','jira-text-renderer'),(10101,10000,'issuetype',NULL,NULL,'false','true','jira-text-renderer'),(10102,10000,'security',NULL,NULL,'false','false','jira-text-renderer'),(10103,10000,'priority',NULL,NULL,'false','false','jira-text-renderer'),(10104,10000,'duedate',NULL,NULL,'false','false','jira-text-renderer'),(10105,10000,'components',NULL,NULL,'false','false','frother-control-renderer'),(10106,10000,'versions',NULL,NULL,'false','false','frother-control-renderer'),(10107,10000,'fixVersions',NULL,NULL,'false','false','frother-control-renderer'),(10108,10000,'assignee',NULL,NULL,'false','false','jira-text-renderer'),(10109,10000,'reporter',NULL,NULL,'false','true','jira-text-renderer'),(10110,10000,'environment','For example operating system, software platform and/or hardware specifications (include as appropriate for the issue).',NULL,'false','false','atlassian-wiki-renderer'),(10111,10000,'description',NULL,NULL,'false','false','atlassian-wiki-renderer'),(10112,10000,'timetracking','An estimate of how much work remains until this issue will be resolved.<br>The format of this is \' *w *d *h *m \' (representing weeks, days, hours and minutes - where * can be any number)<br>Examples: 4d, 5h 30m, 60m and 3w.<br>',NULL,'false','false','jira-text-renderer'),(10113,10000,'resolution',NULL,NULL,'false','false','jira-text-renderer'),(10114,10000,'attachment',NULL,NULL,'false','false','jira-text-renderer'),(10115,10000,'comment',NULL,NULL,'false','false','atlassian-wiki-renderer'),(10116,10000,'labels',NULL,NULL,'false','false','jira-text-renderer'),(10117,10000,'worklog','Allows work to be logged whilst creating, editing or transitioning issues.',NULL,'false','false','atlassian-wiki-renderer'),(10118,10000,'issuelinks',NULL,NULL,'false','false','jira-text-renderer');
/*!40000 ALTER TABLE `fieldlayoutitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutscheme`
--

DROP TABLE IF EXISTS `fieldlayoutscheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutscheme` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutscheme`
--

LOCK TABLES `fieldlayoutscheme` WRITE;
/*!40000 ALTER TABLE `fieldlayoutscheme` DISABLE KEYS */;
/*!40000 ALTER TABLE `fieldlayoutscheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutschemeassociation`
--

DROP TABLE IF EXISTS `fieldlayoutschemeassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutschemeassociation` (
  `ID` decimal(18,0) NOT NULL,
  `ISSUETYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROJECT` decimal(18,0) DEFAULT NULL,
  `FIELDLAYOUTSCHEME` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fl_scheme_assoc` (`PROJECT`,`ISSUETYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutschemeassociation`
--

LOCK TABLES `fieldlayoutschemeassociation` WRITE;
/*!40000 ALTER TABLE `fieldlayoutschemeassociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `fieldlayoutschemeassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutschemeentity`
--

DROP TABLE IF EXISTS `fieldlayoutschemeentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutschemeentity` (
  `ID` decimal(18,0) NOT NULL,
  `SCHEME` decimal(18,0) DEFAULT NULL,
  `issuetype` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FIELDLAYOUT` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fieldlayout_scheme` (`SCHEME`),
  KEY `fieldlayout_layout` (`FIELDLAYOUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutschemeentity`
--

LOCK TABLES `fieldlayoutschemeentity` WRITE;
/*!40000 ALTER TABLE `fieldlayoutschemeentity` DISABLE KEYS */;
/*!40000 ALTER TABLE `fieldlayoutschemeentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldscreen`
--

DROP TABLE IF EXISTS `fieldscreen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldscreen` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldscreen`
--

LOCK TABLES `fieldscreen` WRITE;
/*!40000 ALTER TABLE `fieldscreen` DISABLE KEYS */;
INSERT INTO `fieldscreen` VALUES (1,'Default Screen','Allows to update all system fields.'),(2,'Workflow Screen','This screen is used in the workflow and enables you to assign issues'),(3,'Resolve Issue Screen','Allows to set resolution, change fix versions and assign an issue.');
/*!40000 ALTER TABLE `fieldscreen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldscreenlayoutitem`
--

DROP TABLE IF EXISTS `fieldscreenlayoutitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldscreenlayoutitem` (
  `ID` decimal(18,0) NOT NULL,
  `FIELDIDENTIFIER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEQUENCE` decimal(18,0) DEFAULT NULL,
  `FIELDSCREENTAB` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fieldscitem_tab` (`FIELDSCREENTAB`),
  KEY `fieldscreen_field` (`FIELDIDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldscreenlayoutitem`
--

LOCK TABLES `fieldscreenlayoutitem` WRITE;
/*!40000 ALTER TABLE `fieldscreenlayoutitem` DISABLE KEYS */;
INSERT INTO `fieldscreenlayoutitem` VALUES (10000,'summary',0,10000),(10001,'issuetype',1,10000),(10002,'security',2,10000),(10003,'priority',3,10000),(10004,'duedate',4,10000),(10005,'components',5,10000),(10006,'versions',6,10000),(10007,'fixVersions',7,10000),(10008,'assignee',8,10000),(10009,'reporter',9,10000),(10010,'environment',10,10000),(10011,'description',11,10000),(10012,'timetracking',12,10000),(10013,'attachment',13,10000),(10014,'assignee',0,10001),(10015,'resolution',0,10002),(10016,'fixVersions',1,10002),(10017,'assignee',2,10002),(10018,'worklog',3,10002),(10100,'labels',14,10000);
/*!40000 ALTER TABLE `fieldscreenlayoutitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldscreenscheme`
--

DROP TABLE IF EXISTS `fieldscreenscheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldscreenscheme` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldscreenscheme`
--

LOCK TABLES `fieldscreenscheme` WRITE;
/*!40000 ALTER TABLE `fieldscreenscheme` DISABLE KEYS */;
INSERT INTO `fieldscreenscheme` VALUES (1,'Default Screen Scheme','Default Screen Scheme');
/*!40000 ALTER TABLE `fieldscreenscheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldscreenschemeitem`
--

DROP TABLE IF EXISTS `fieldscreenschemeitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldscreenschemeitem` (
  `ID` decimal(18,0) NOT NULL,
  `OPERATION` decimal(18,0) DEFAULT NULL,
  `FIELDSCREEN` decimal(18,0) DEFAULT NULL,
  `FIELDSCREENSCHEME` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `screenitem_scheme` (`FIELDSCREENSCHEME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldscreenschemeitem`
--

LOCK TABLES `fieldscreenschemeitem` WRITE;
/*!40000 ALTER TABLE `fieldscreenschemeitem` DISABLE KEYS */;
INSERT INTO `fieldscreenschemeitem` VALUES (10000,NULL,1,1);
/*!40000 ALTER TABLE `fieldscreenschemeitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldscreentab`
--

DROP TABLE IF EXISTS `fieldscreentab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldscreentab` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEQUENCE` decimal(18,0) DEFAULT NULL,
  `FIELDSCREEN` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fieldscreen_tab` (`FIELDSCREEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldscreentab`
--

LOCK TABLES `fieldscreentab` WRITE;
/*!40000 ALTER TABLE `fieldscreentab` DISABLE KEYS */;
INSERT INTO `fieldscreentab` VALUES (10000,'Field Tab',NULL,0,1),(10001,'Field Tab',NULL,0,2),(10002,'Field Tab',NULL,0,3);
/*!40000 ALTER TABLE `fieldscreentab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fileattachment`
--

DROP TABLE IF EXISTS `fileattachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fileattachment` (
  `ID` decimal(18,0) NOT NULL,
  `issueid` decimal(18,0) DEFAULT NULL,
  `MIMETYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FILENAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `FILESIZE` decimal(18,0) DEFAULT NULL,
  `AUTHOR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `zip` decimal(9,0) DEFAULT NULL,
  `thumbnailable` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `attach_issue` (`issueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fileattachment`
--

LOCK TABLES `fileattachment` WRITE;
/*!40000 ALTER TABLE `fileattachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `fileattachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filtersubscription`
--

DROP TABLE IF EXISTS `filtersubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filtersubscription` (
  `ID` decimal(18,0) NOT NULL,
  `FILTER_I_D` decimal(18,0) DEFAULT NULL,
  `USERNAME` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `groupname` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `LAST_RUN` datetime DEFAULT NULL,
  `EMAIL_ON_EMPTY` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `subscrpt_user` (`FILTER_I_D`,`USERNAME`),
  KEY `subscrptn_group` (`FILTER_I_D`,`groupname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filtersubscription`
--

LOCK TABLES `filtersubscription` WRITE;
/*!40000 ALTER TABLE `filtersubscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `filtersubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gadgetuserpreference`
--

DROP TABLE IF EXISTS `gadgetuserpreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gadgetuserpreference` (
  `ID` decimal(18,0) NOT NULL,
  `PORTLETCONFIGURATION` decimal(18,0) DEFAULT NULL,
  `USERPREFKEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USERPREFVALUE` longtext COLLATE utf8_bin,
  PRIMARY KEY (`ID`),
  KEY `userpref_portletconfiguration` (`PORTLETCONFIGURATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gadgetuserpreference`
--

LOCK TABLES `gadgetuserpreference` WRITE;
/*!40000 ALTER TABLE `gadgetuserpreference` DISABLE KEYS */;
INSERT INTO `gadgetuserpreference` VALUES (10000,10002,'isConfigured','true'),(10001,10003,'keys','__all_projects__'),(10002,10003,'isConfigured','true'),(10003,10003,'title','Your Company JIRA'),(10004,10003,'numofentries','5');
/*!40000 ALTER TABLE `gadgetuserpreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genericconfiguration`
--

DROP TABLE IF EXISTS `genericconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genericconfiguration` (
  `ID` decimal(18,0) NOT NULL,
  `DATATYPE` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `DATAKEY` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `XMLVALUE` text COLLATE utf8_bin,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `type_key` (`DATATYPE`,`DATAKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genericconfiguration`
--

LOCK TABLES `genericconfiguration` WRITE;
/*!40000 ALTER TABLE `genericconfiguration` DISABLE KEYS */;
INSERT INTO `genericconfiguration` VALUES (10000,'DefaultValue','10000','<string>1</string>');
/*!40000 ALTER TABLE `genericconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalpermissionentry`
--

DROP TABLE IF EXISTS `globalpermissionentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalpermissionentry` (
  `ID` decimal(18,0) NOT NULL,
  `PERMISSION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `GROUP_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalpermissionentry`
--

LOCK TABLES `globalpermissionentry` WRITE;
/*!40000 ALTER TABLE `globalpermissionentry` DISABLE KEYS */;
INSERT INTO `globalpermissionentry` VALUES (10000,'ADMINISTER','jira-administrators'),(10001,'USE','jira-users'),(10002,'USER_PICKER','jira-developers'),(10003,'MANAGE_GROUP_FILTER_SUBSCRIPTIONS','jira-developers'),(10004,'CREATE_SHARED_OBJECTS','jira-users'),(10005,'BULK_CHANGE','jira-users'),(10006,'SYSTEM_ADMIN','jira-administrators');
/*!40000 ALTER TABLE `globalpermissionentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupbase`
--

DROP TABLE IF EXISTS `groupbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupbase` (
  `ID` decimal(18,0) NOT NULL,
  `groupname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `osgroup_name` (`groupname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupbase`
--

LOCK TABLES `groupbase` WRITE;
/*!40000 ALTER TABLE `groupbase` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupbase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuelink`
--

DROP TABLE IF EXISTS `issuelink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuelink` (
  `ID` decimal(18,0) NOT NULL,
  `LINKTYPE` decimal(18,0) DEFAULT NULL,
  `SOURCE` decimal(18,0) DEFAULT NULL,
  `DESTINATION` decimal(18,0) DEFAULT NULL,
  `SEQUENCE` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `issuelink_src` (`SOURCE`),
  KEY `issuelink_dest` (`DESTINATION`),
  KEY `issuelink_type` (`LINKTYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuelink`
--

LOCK TABLES `issuelink` WRITE;
/*!40000 ALTER TABLE `issuelink` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuelink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuelinktype`
--

DROP TABLE IF EXISTS `issuelinktype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuelinktype` (
  `ID` decimal(18,0) NOT NULL,
  `LINKNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `INWARD` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OUTWARD` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pstyle` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `linktypename` (`LINKNAME`),
  KEY `linktypestyle` (`pstyle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuelinktype`
--

LOCK TABLES `issuelinktype` WRITE;
/*!40000 ALTER TABLE `issuelinktype` DISABLE KEYS */;
INSERT INTO `issuelinktype` VALUES (10000,'Blocks','is blocked by','blocks',NULL),(10001,'Cloners','is cloned by','clones',NULL),(10002,'Duplicate','is duplicated by','duplicates',NULL),(10003,'Relates','relates to','relates to',NULL),(10100,'jira_subtask_link','jira_subtask_inward','jira_subtask_outward','jira_subtask');
/*!40000 ALTER TABLE `issuelinktype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuesecurityscheme`
--

DROP TABLE IF EXISTS `issuesecurityscheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuesecurityscheme` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  `DEFAULTLEVEL` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuesecurityscheme`
--

LOCK TABLES `issuesecurityscheme` WRITE;
/*!40000 ALTER TABLE `issuesecurityscheme` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuesecurityscheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuestatus`
--

DROP TABLE IF EXISTS `issuestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuestatus` (
  `ID` varchar(60) COLLATE utf8_bin NOT NULL,
  `SEQUENCE` decimal(18,0) DEFAULT NULL,
  `pname` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  `ICONURL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `STATUSCATEGORY` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuestatus`
--

LOCK TABLES `issuestatus` WRITE;
/*!40000 ALTER TABLE `issuestatus` DISABLE KEYS */;
INSERT INTO `issuestatus` VALUES ('1',1,'Open','The issue is open and ready for the assignee to start work on it.','/images/icons/statuses/open.png',2),('3',3,'In Progress','This issue is being actively worked on at the moment by the assignee.','/images/icons/statuses/inprogress.png',4),('4',4,'Reopened','This issue was once resolved, but the resolution was deemed incorrect. From here issues are either marked assigned or resolved.','/images/icons/statuses/reopened.png',2),('5',5,'Resolved','A resolution has been taken, and it is awaiting verification by reporter. From here issues are either reopened, or are closed.','/images/icons/statuses/resolved.png',3),('6',6,'Closed','The issue is considered finished, the resolution is correct. Issues which are closed can be reopened.','/images/icons/statuses/closed.png',3);
/*!40000 ALTER TABLE `issuestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuetype`
--

DROP TABLE IF EXISTS `issuetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuetype` (
  `ID` varchar(60) COLLATE utf8_bin NOT NULL,
  `SEQUENCE` decimal(18,0) DEFAULT NULL,
  `pname` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `pstyle` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  `ICONURL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `AVATAR` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuetype`
--

LOCK TABLES `issuetype` WRITE;
/*!40000 ALTER TABLE `issuetype` DISABLE KEYS */;
INSERT INTO `issuetype` VALUES ('1',1,'Bug',NULL,'A problem which impairs or prevents the functions of the product.','/images/icons/issuetypes/bug.png',NULL),('2',2,'New Feature',NULL,'A new feature of the product, which has yet to be developed.','/images/icons/issuetypes/newfeature.png',NULL),('3',3,'Task',NULL,'A task that needs to be done.','/images/icons/issuetypes/task.png',NULL),('4',4,'Improvement',NULL,'An improvement or enhancement to an existing feature or task.','/images/icons/issuetypes/improvement.png',NULL),('5',0,'Sub-task','jira_subtask','The sub-task of the issue','/images/icons/issuetypes/subtask_alternate.png',NULL);
/*!40000 ALTER TABLE `issuetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuetypescreenscheme`
--

DROP TABLE IF EXISTS `issuetypescreenscheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuetypescreenscheme` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuetypescreenscheme`
--

LOCK TABLES `issuetypescreenscheme` WRITE;
/*!40000 ALTER TABLE `issuetypescreenscheme` DISABLE KEYS */;
INSERT INTO `issuetypescreenscheme` VALUES (1,'Default Issue Type Screen Scheme','The default issue type screen scheme');
/*!40000 ALTER TABLE `issuetypescreenscheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuetypescreenschemeentity`
--

DROP TABLE IF EXISTS `issuetypescreenschemeentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuetypescreenschemeentity` (
  `ID` decimal(18,0) NOT NULL,
  `ISSUETYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCHEME` decimal(18,0) DEFAULT NULL,
  `FIELDSCREENSCHEME` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fieldscreen_scheme` (`FIELDSCREENSCHEME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuetypescreenschemeentity`
--

LOCK TABLES `issuetypescreenschemeentity` WRITE;
/*!40000 ALTER TABLE `issuetypescreenschemeentity` DISABLE KEYS */;
INSERT INTO `issuetypescreenschemeentity` VALUES (10000,NULL,1,1);
/*!40000 ALTER TABLE `issuetypescreenschemeentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiraaction`
--

DROP TABLE IF EXISTS `jiraaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiraaction` (
  `ID` decimal(18,0) NOT NULL,
  `issueid` decimal(18,0) DEFAULT NULL,
  `AUTHOR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `actiontype` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `actionlevel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `rolelevel` decimal(18,0) DEFAULT NULL,
  `actionbody` longtext COLLATE utf8_bin,
  `CREATED` datetime DEFAULT NULL,
  `UPDATEAUTHOR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `UPDATED` datetime DEFAULT NULL,
  `actionnum` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `action_issue` (`issueid`,`actiontype`),
  KEY `action_authorcreated` (`issueid`,`AUTHOR`,`CREATED`),
  KEY `action_authorupdated` (`issueid`,`AUTHOR`,`UPDATED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiraaction`
--

LOCK TABLES `jiraaction` WRITE;
/*!40000 ALTER TABLE `jiraaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `jiraaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiradraftworkflows`
--

DROP TABLE IF EXISTS `jiradraftworkflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiradraftworkflows` (
  `ID` decimal(18,0) NOT NULL,
  `PARENTNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTOR` longtext COLLATE utf8_bin,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiradraftworkflows`
--

LOCK TABLES `jiradraftworkflows` WRITE;
/*!40000 ALTER TABLE `jiradraftworkflows` DISABLE KEYS */;
/*!40000 ALTER TABLE `jiradraftworkflows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiraeventtype`
--

DROP TABLE IF EXISTS `jiraeventtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiraeventtype` (
  `ID` decimal(18,0) NOT NULL,
  `TEMPLATE_ID` decimal(18,0) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  `event_type` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiraeventtype`
--

LOCK TABLES `jiraeventtype` WRITE;
/*!40000 ALTER TABLE `jiraeventtype` DISABLE KEYS */;
INSERT INTO `jiraeventtype` VALUES (1,NULL,'Issue Created','This is the \'issue created\' event.','jira.system.event.type'),(2,NULL,'Issue Updated','This is the \'issue updated\' event.','jira.system.event.type'),(3,NULL,'Issue Assigned','This is the \'issue assigned\' event.','jira.system.event.type'),(4,NULL,'Issue Resolved','This is the \'issue resolved\' event.','jira.system.event.type'),(5,NULL,'Issue Closed','This is the \'issue closed\' event.','jira.system.event.type'),(6,NULL,'Issue Commented','This is the \'issue commented\' event.','jira.system.event.type'),(7,NULL,'Issue Reopened','This is the \'issue reopened\' event.','jira.system.event.type'),(8,NULL,'Issue Deleted','This is the \'issue deleted\' event.','jira.system.event.type'),(9,NULL,'Issue Moved','This is the \'issue moved\' event.','jira.system.event.type'),(10,NULL,'Work Logged On Issue','This is the \'work logged on issue\' event.','jira.system.event.type'),(11,NULL,'Work Started On Issue','This is the \'work started on issue\' event.','jira.system.event.type'),(12,NULL,'Work Stopped On Issue','This is the \'work stopped on issue\' event.','jira.system.event.type'),(13,NULL,'Generic Event','This is the \'generic event\' event.','jira.system.event.type'),(14,NULL,'Issue Comment Edited','This is the \'issue comment edited\' event.','jira.system.event.type'),(15,NULL,'Issue Worklog Updated','This is the \'issue worklog updated\' event.','jira.system.event.type'),(16,NULL,'Issue Worklog Deleted','This is the \'issue worklog deleted\' event.','jira.system.event.type');
/*!40000 ALTER TABLE `jiraeventtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiraissue`
--

DROP TABLE IF EXISTS `jiraissue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiraissue` (
  `ID` decimal(18,0) NOT NULL,
  `pkey` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `issuenum` decimal(18,0) DEFAULT NULL,
  `PROJECT` decimal(18,0) DEFAULT NULL,
  `REPORTER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATOR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `issuetype` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUMMARY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` longtext COLLATE utf8_bin,
  `ENVIRONMENT` longtext COLLATE utf8_bin,
  `PRIORITY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESOLUTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `issuestatus` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `UPDATED` datetime DEFAULT NULL,
  `DUEDATE` datetime DEFAULT NULL,
  `RESOLUTIONDATE` datetime DEFAULT NULL,
  `VOTES` decimal(18,0) DEFAULT NULL,
  `WATCHES` decimal(18,0) DEFAULT NULL,
  `TIMEORIGINALESTIMATE` decimal(18,0) DEFAULT NULL,
  `TIMEESTIMATE` decimal(18,0) DEFAULT NULL,
  `TIMESPENT` decimal(18,0) DEFAULT NULL,
  `WORKFLOW_ID` decimal(18,0) DEFAULT NULL,
  `SECURITY` decimal(18,0) DEFAULT NULL,
  `FIXFOR` decimal(18,0) DEFAULT NULL,
  `COMPONENT` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `issue_proj_num` (`issuenum`,`PROJECT`),
  KEY `issue_proj_status` (`PROJECT`,`issuestatus`),
  KEY `issue_updated` (`UPDATED`),
  KEY `issue_assignee` (`ASSIGNEE`),
  KEY `issue_workflow` (`WORKFLOW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiraissue`
--

LOCK TABLES `jiraissue` WRITE;
/*!40000 ALTER TABLE `jiraissue` DISABLE KEYS */;
/*!40000 ALTER TABLE `jiraissue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiraperms`
--

DROP TABLE IF EXISTS `jiraperms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiraperms` (
  `ID` decimal(18,0) NOT NULL,
  `permtype` decimal(18,0) DEFAULT NULL,
  `projectid` decimal(18,0) DEFAULT NULL,
  `groupname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiraperms`
--

LOCK TABLES `jiraperms` WRITE;
/*!40000 ALTER TABLE `jiraperms` DISABLE KEYS */;
/*!40000 ALTER TABLE `jiraperms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiraworkflows`
--

DROP TABLE IF EXISTS `jiraworkflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiraworkflows` (
  `ID` decimal(18,0) NOT NULL,
  `workflowname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creatorname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTOR` longtext COLLATE utf8_bin,
  `ISLOCKED` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiraworkflows`
--

LOCK TABLES `jiraworkflows` WRITE;
/*!40000 ALTER TABLE `jiraworkflows` DISABLE KEYS */;
INSERT INTO `jiraworkflows` VALUES (10000,'classic default workflow',NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE workflow PUBLIC \"-//OpenSymphony Group//DTD OSWorkflow 2.8//EN\" \"http://www.opensymphony.com/osworkflow/workflow_2_8.dtd\">\n<workflow>\n  <meta name=\"jira.description\">The classic JIRA default workflow</meta>\n  <initial-actions>\n    <action id=\"1\" name=\"Create Issue\">\n      <meta name=\"opsbar-sequence\">0</meta>\n      <meta name=\"jira.i18n.title\">common.forms.create</meta>\n      <validators>\n        <validator name=\"\" type=\"class\">\n          <arg name=\"class.name\">com.atlassian.jira.workflow.validator.PermissionValidator</arg>\n          <arg name=\"permission\">Create Issue</arg>\n        </validator>\n      </validators>\n      <results>\n        <unconditional-result old-status=\"Finished\" status=\"Open\" step=\"1\">\n          <post-functions>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.IssueCreateFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n              <arg name=\"eventTypeId\">1</arg>\n            </function>\n          </post-functions>\n        </unconditional-result>\n      </results>\n    </action>\n  </initial-actions>\n  <common-actions>\n    <action id=\"2\" name=\"Close Issue\" view=\"resolveissue\">\n      <meta name=\"opsbar-sequence\">60</meta>\n      <meta name=\"jira.i18n.submit\">closeissue.close</meta>\n      <meta name=\"jira.i18n.description\">closeissue.desc</meta>\n      <meta name=\"jira.i18n.title\">closeissue.title</meta>\n      <restrict-to>\n        <conditions type=\"AND\">\n          <condition type=\"class\">\n            <arg name=\"class.name\">com.atlassian.jira.workflow.condition.PermissionCondition</arg>\n            <arg name=\"permission\">Resolve Issue</arg>\n          </condition>\n          <condition type=\"class\">\n            <arg name=\"class.name\">com.atlassian.jira.workflow.condition.PermissionCondition</arg>\n            <arg name=\"permission\">Close Issue</arg>\n          </condition>\n        </conditions>\n      </restrict-to>\n      <results>\n        <unconditional-result old-status=\"Finished\" status=\"Closed\" step=\"6\">\n          <post-functions>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n              <arg name=\"eventTypeId\">5</arg>\n            </function>\n          </post-functions>\n        </unconditional-result>\n      </results>\n    </action>\n    <action id=\"3\" name=\"Reopen Issue\" view=\"commentassign\">\n      <meta name=\"opsbar-sequence\">80</meta>\n      <meta name=\"jira.i18n.submit\">issue.operations.reopen.issue</meta>\n      <meta name=\"jira.i18n.description\">issue.operations.reopen.description</meta>\n      <meta name=\"jira.i18n.title\">issue.operations.reopen.issue</meta>\n      <restrict-to>\n        <conditions>\n          <condition type=\"class\">\n            <arg name=\"class.name\">com.atlassian.jira.workflow.condition.PermissionCondition</arg>\n            <arg name=\"permission\">Resolve Issue</arg>\n          </condition>\n        </conditions>\n      </restrict-to>\n      <results>\n        <unconditional-result old-status=\"Finished\" status=\"Reopened\" step=\"5\">\n          <post-functions>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.UpdateIssueFieldFunction</arg>\n              <arg name=\"field.value\"></arg>\n              <arg name=\"field.name\">resolution</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n              <arg name=\"eventTypeId\">7</arg>\n            </function>\n          </post-functions>\n        </unconditional-result>\n      </results>\n    </action>\n    <action id=\"4\" name=\"Start Progress\">\n      <meta name=\"opsbar-sequence\">20</meta>\n      <meta name=\"jira.i18n.title\">startprogress.title</meta>\n      <restrict-to>\n        <conditions>\n          <condition type=\"class\">\n            <arg name=\"class.name\">com.atlassian.jira.workflow.condition.AllowOnlyAssignee</arg>\n          </condition>\n        </conditions>\n      </restrict-to>\n      <results>\n        <unconditional-result old-status=\"Finished\" status=\"Underway\" step=\"3\">\n          <post-functions>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.UpdateIssueFieldFunction</arg>\n              <arg name=\"field.value\"></arg>\n              <arg name=\"field.name\">resolution</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n              <arg name=\"eventTypeId\">11</arg>\n            </function>\n          </post-functions>\n        </unconditional-result>\n      </results>\n    </action>\n    <action id=\"5\" name=\"Resolve Issue\" view=\"resolveissue\">\n      <meta name=\"opsbar-sequence\">40</meta>\n      <meta name=\"jira.i18n.submit\">resolveissue.resolve</meta>\n      <meta name=\"jira.i18n.description\">resolveissue.desc.line1</meta>\n      <meta name=\"jira.i18n.title\">resolveissue.title</meta>\n      <restrict-to>\n        <conditions>\n          <condition type=\"class\">\n            <arg name=\"class.name\">com.atlassian.jira.workflow.condition.PermissionCondition</arg>\n            <arg name=\"permission\">Resolve Issue</arg>\n          </condition>\n        </conditions>\n      </restrict-to>\n      <results>\n        <unconditional-result old-status=\"Finished\" status=\"Resolved\" step=\"4\">\n          <post-functions>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n            </function>\n            <function type=\"class\">\n              <arg name=\"class.name\">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n              <arg name=\"eventTypeId\">4</arg>\n            </function>\n          </post-functions>\n        </unconditional-result>\n      </results>\n    </action>\n  </common-actions>\n  <steps>\n    <step id=\"1\" name=\"Open\">\n      <meta name=\"jira.status.id\">1</meta>\n      <actions>\n<common-action id=\"4\" />\n<common-action id=\"5\" />\n<common-action id=\"2\" />\n      </actions>\n    </step>\n    <step id=\"3\" name=\"In Progress\">\n      <meta name=\"jira.status.id\">3</meta>\n      <actions>\n<common-action id=\"5\" />\n<common-action id=\"2\" />\n        <action id=\"301\" name=\"Stop Progress\">\n          <meta name=\"opsbar-sequence\">20</meta>\n          <meta name=\"jira.i18n.title\">stopprogress.title</meta>\n          <restrict-to>\n            <conditions>\n              <condition type=\"class\">\n                <arg name=\"class.name\">com.atlassian.jira.workflow.condition.AllowOnlyAssignee</arg>\n              </condition>\n            </conditions>\n          </restrict-to>\n          <results>\n            <unconditional-result old-status=\"Finished\" status=\"Assigned\" step=\"1\">\n              <post-functions>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.UpdateIssueFieldFunction</arg>\n                  <arg name=\"field.value\"></arg>\n                  <arg name=\"field.name\">resolution</arg>\n                </function>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>\n                </function>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n                </function>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>\n                </function>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n                </function>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n                  <arg name=\"eventTypeId\">12</arg>\n                </function>\n              </post-functions>\n            </unconditional-result>\n          </results>\n        </action>\n      </actions>\n    </step>\n    <step id=\"4\" name=\"Resolved\">\n      <meta name=\"jira.status.id\">5</meta>\n      <actions>\n<common-action id=\"3\" />\n        <action id=\"701\" name=\"Close Issue\" view=\"commentassign\">\n          <meta name=\"opsbar-sequence\">60</meta>\n          <meta name=\"jira.i18n.submit\">closeissue.close</meta>\n          <meta name=\"jira.i18n.description\">closeissue.desc</meta>\n          <meta name=\"jira.i18n.title\">closeissue.title</meta>\n          <meta name=\"jira.description\">Closing an issue indicates there is no more work to be done on it, and it has been verified as complete.</meta>\n          <restrict-to>\n            <conditions>\n              <condition type=\"class\">\n                <arg name=\"class.name\">com.atlassian.jira.workflow.condition.PermissionCondition</arg>\n                <arg name=\"permission\">Close Issue</arg>\n              </condition>\n            </conditions>\n          </restrict-to>\n          <results>\n            <unconditional-result old-status=\"Finished\" status=\"Closed\" step=\"6\">\n              <post-functions>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.UpdateIssueStatusFunction</arg>\n                </function>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.misc.CreateCommentFunction</arg>\n                </function>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.GenerateChangeHistoryFunction</arg>\n                </function>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.issue.IssueReindexFunction</arg>\n                </function>\n                <function type=\"class\">\n                  <arg name=\"class.name\">com.atlassian.jira.workflow.function.event.FireIssueEventFunction</arg>\n                  <arg name=\"eventTypeId\">5</arg>\n                </function>\n              </post-functions>\n            </unconditional-result>\n          </results>\n        </action>\n      </actions>\n    </step>\n    <step id=\"5\" name=\"Reopened\">\n      <meta name=\"jira.status.id\">4</meta>\n      <actions>\n<common-action id=\"5\" />\n<common-action id=\"2\" />\n<common-action id=\"4\" />\n      </actions>\n    </step>\n    <step id=\"6\" name=\"Closed\">\n      <meta name=\"jira.status.id\">6</meta>\n      <meta name=\"jira.issue.editable\">false</meta>\n      <actions>\n<common-action id=\"3\" />\n      </actions>\n    </step>\n  </steps>\n</workflow>\n',NULL);
/*!40000 ALTER TABLE `jiraworkflows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jquartz_fired_triggers`
--

DROP TABLE IF EXISTS `jquartz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jquartz_fired_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `ENTRY_ID` varchar(95) COLLATE utf8_bin NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `IS_VOLATILE` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `INSTANCE_NAME` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `FIRED_TIME` bigint(20) DEFAULT NULL,
  `SCHED_TIME` bigint(20) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `STATE` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `JOB_NAME` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `JOB_GROUP` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `IS_STATEFUL` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `IS_UPDATE_DATA` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ENTRY_ID`),
  KEY `idx_qrtz_ft_trig_inst_name` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `idx_qrtz_ft_inst_job_req_rcvry` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `idx_qrtz_ft_j_g` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `idx_qrtz_ft_jg` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `idx_qrtz_ft_t_g` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `idx_qrtz_ft_tg` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jquartz_fired_triggers`
--

LOCK TABLES `jquartz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `jquartz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `jquartz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jquartz_job_details`
--

DROP TABLE IF EXISTS `jquartz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jquartz_job_details` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `JOB_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `JOB_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `IS_DURABLE` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `IS_VOLATILE` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `IS_STATEFUL` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `IS_UPDATE_DATA` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`JOB_NAME`,`JOB_GROUP`),
  KEY `idx_qrtz_j_req_recovery` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `idx_qrtz_j_grp` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jquartz_job_details`
--

LOCK TABLES `jquartz_job_details` WRITE;
/*!40000 ALTER TABLE `jquartz_job_details` DISABLE KEYS */;
INSERT INTO `jquartz_job_details` VALUES (NULL,'CompatibilityPluginScheduler.JobRunnerKey.LocalPluginLicenseNotificationJob-job-handler','SchedulerServiceJobs',NULL,'com.atlassian.scheduler.quartz1.Quartz1Job','0','0','0',NULL,NULL,'0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),(NULL,'CompatibilityPluginScheduler.JobRunnerKey.PluginRequestCheckJob-job-handler','SchedulerServiceJobs',NULL,'com.atlassian.scheduler.quartz1.Quartz1Job','0','0','0',NULL,NULL,'0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),(NULL,'CompatibilityPluginScheduler.JobRunnerKey.PluginUpdateCheckJob-job-handler','SchedulerServiceJobs',NULL,'com.atlassian.scheduler.quartz1.Quartz1Job','0','0','0',NULL,NULL,'0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),(NULL,'CompatibilityPluginScheduler.JobRunnerKey.RemotePluginLicenseNotificationJob-job-handler','SchedulerServiceJobs',NULL,'com.atlassian.scheduler.quartz1.Quartz1Job','0','0','0',NULL,NULL,'0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),(NULL,'CompatibilityPluginScheduler.JobRunnerKey.com.atlassian.jira.plugins.dvcs.scheduler.DvcsScheduler','SchedulerServiceJobs',NULL,'com.atlassian.scheduler.quartz1.Quartz1Job','0','0','0',NULL,NULL,'0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),(NULL,'com.atlassian.jira.service.DefaultServiceManager','SchedulerServiceJobs',NULL,'com.atlassian.scheduler.quartz1.Quartz1Job','0','0','0',NULL,NULL,'0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0');
/*!40000 ALTER TABLE `jquartz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jquartz_triggers`
--

DROP TABLE IF EXISTS `jquartz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jquartz_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `JOB_NAME` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `JOB_GROUP` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `IS_VOLATILE` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `TRIGGER_TYPE` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME` bigint(20) DEFAULT NULL,
  `END_TIME` bigint(20) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `MISFIRE_INSTR` smallint(5) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `idx_qrtz_t_j` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `idx_qrtz_t_jg` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `idx_qrtz_t_c` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `idx_qrtz_j_g` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `idx_qrtz_j_state` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `idx_qrtz_t_n_state` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `idx_qrtz_t_n_g_state` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `idx_qrtz_t_next_fire_time` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `idx_qrtz_t_nft_st` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `idx_qrtz_t_nft_misfire` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `idx_qrtz_t_nft_st_misfire` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `idx_qrtz_t_nft_st_misfire_grp` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jquartz_triggers`
--

LOCK TABLES `jquartz_triggers` WRITE;
/*!40000 ALTER TABLE `jquartz_triggers` DISABLE KEYS */;
INSERT INTO `jquartz_triggers` VALUES (NULL,'CompatibilityPluginScheduler.JobId.LocalPluginLicenseNotificationJob-job','SchedulerServiceTriggers','CompatibilityPluginScheduler.JobRunnerKey.LocalPluginLicenseNotificationJob-job-handler','SchedulerServiceJobs','0',NULL,1415956973633,1415870573633,5,'WAITING','SIMPLE',1415870573633,0,NULL,0,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nparameterspx\0'),(NULL,'CompatibilityPluginScheduler.JobId.PluginRequestCheckJob-job','SchedulerServiceTriggers','CompatibilityPluginScheduler.JobRunnerKey.PluginRequestCheckJob-job-handler','SchedulerServiceJobs','0',NULL,1415874173649,1415870573649,5,'WAITING','SIMPLE',1415870573649,0,NULL,0,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nparameterspx\0'),(NULL,'CompatibilityPluginScheduler.JobId.PluginUpdateCheckJob-job','SchedulerServiceTriggers','CompatibilityPluginScheduler.JobRunnerKey.PluginUpdateCheckJob-job-handler','SchedulerServiceJobs','0',NULL,1415889292371,-1,5,'WAITING','SIMPLE',1415889292371,0,NULL,0,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nparameterspx\0'),(NULL,'CompatibilityPluginScheduler.JobId.RemotePluginLicenseNotificationJob-job','SchedulerServiceTriggers','CompatibilityPluginScheduler.JobRunnerKey.RemotePluginLicenseNotificationJob-job-handler','SchedulerServiceJobs','0',NULL,1415874173640,1415870573640,5,'WAITING','SIMPLE',1415870573640,0,NULL,0,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nparameterspx\0'),(NULL,'CompatibilityPluginScheduler.JobId.com.atlassian.jira.plugins.dvcs.scheduler.DvcsScheduler:job','SchedulerServiceTriggers','CompatibilityPluginScheduler.JobRunnerKey.com.atlassian.jira.plugins.dvcs.scheduler.DvcsScheduler','SchedulerServiceJobs','0',NULL,1415873246090,-1,5,'WAITING','SIMPLE',1415873246090,0,NULL,0,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nparameterspx\0'),(NULL,'com.atlassian.jira.service.JiraService:10001','SchedulerServiceTriggers','com.atlassian.jira.service.DefaultServiceManager','SchedulerServiceJobs','0',NULL,1415913463000,-1,5,'WAITING','SIMPLE',1415913463000,0,NULL,0,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nparametersur\0[B���T�\0\0xp\0\0+��\0sr\05com.google.common.collect.ImmutableMap$SerializedForm\0\0\0\0\0\0\0\0\0[\0keyst\0[Ljava/lang/Object;[\0valuesq\0~\0xpur\0[Ljava.lang.Object;��X�s)l\0\0xp\0\0\0t\03com.atlassian.jira.service.ServiceManager:serviceIduq\0~\0\0\0\0sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\'x\0'),(NULL,'com.atlassian.jira.service.JiraService:10002','SchedulerServiceTriggers','com.atlassian.jira.service.DefaultServiceManager','SchedulerServiceJobs','0',NULL,1415956663456,1415870263456,5,'WAITING','SIMPLE',1415870263456,0,NULL,0,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nparametersur\0[B���T�\0\0xp\0\0+��\0sr\05com.google.common.collect.ImmutableMap$SerializedForm\0\0\0\0\0\0\0\0\0[\0keyst\0[Ljava/lang/Object;[\0valuesq\0~\0xpur\0[Ljava.lang.Object;��X�s)l\0\0xp\0\0\0t\03com.atlassian.jira.service.ServiceManager:serviceIduq\0~\0\0\0\0sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\'x\0');
/*!40000 ALTER TABLE `jquartz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label`
--

DROP TABLE IF EXISTS `label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label` (
  `ID` decimal(18,0) NOT NULL,
  `FIELDID` decimal(18,0) DEFAULT NULL,
  `ISSUE` decimal(18,0) DEFAULT NULL,
  `LABEL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `label_fieldissue` (`ISSUE`,`FIELDID`),
  KEY `label_fieldissuelabel` (`ISSUE`,`FIELDID`,`LABEL`),
  KEY `label_label` (`LABEL`),
  KEY `label_issue` (`ISSUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label`
--

LOCK TABLES `label` WRITE;
/*!40000 ALTER TABLE `label` DISABLE KEYS */;
/*!40000 ALTER TABLE `label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenserolesgroup`
--

DROP TABLE IF EXISTS `licenserolesgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licenserolesgroup` (
  `ID` decimal(18,0) NOT NULL,
  `LICENSE_ROLE_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `GROUP_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `licenserolegroup_index` (`LICENSE_ROLE_NAME`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenserolesgroup`
--

LOCK TABLES `licenserolesgroup` WRITE;
/*!40000 ALTER TABLE `licenserolesgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `licenserolesgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listenerconfig`
--

DROP TABLE IF EXISTS `listenerconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listenerconfig` (
  `ID` decimal(18,0) NOT NULL,
  `CLAZZ` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `listenername` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listenerconfig`
--

LOCK TABLES `listenerconfig` WRITE;
/*!40000 ALTER TABLE `listenerconfig` DISABLE KEYS */;
INSERT INTO `listenerconfig` VALUES (10000,'com.atlassian.jira.event.listeners.mail.MailListener','Mail Listener'),(10001,'com.atlassian.jira.event.listeners.history.IssueAssignHistoryListener','Issue Assignment Listener'),(10002,'com.atlassian.jira.event.listeners.search.IssueIndexListener','Issue Index Listener'),(10200,'com.atlassian.jira.event.listeners.search.IssueIndexListener','Issue Index Listener');
/*!40000 ALTER TABLE `listenerconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailserver`
--

DROP TABLE IF EXISTS `mailserver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailserver` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  `mailfrom` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PREFIX` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `smtp_port` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `protocol` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `server_type` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `SERVERNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `JNDILOCATION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `mailusername` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `mailpassword` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ISTLSREQUIRED` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `TIMEOUT` decimal(18,0) DEFAULT NULL,
  `socks_port` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `socks_host` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailserver`
--

LOCK TABLES `mailserver` WRITE;
/*!40000 ALTER TABLE `mailserver` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailserver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managedconfigurationitem`
--

DROP TABLE IF EXISTS `managedconfigurationitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `managedconfigurationitem` (
  `ID` decimal(18,0) NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ITEM_TYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MANAGED` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ACCESS_LEVEL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SOURCE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `managedconfigitem_id_type_idx` (`ITEM_ID`,`ITEM_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managedconfigurationitem`
--

LOCK TABLES `managedconfigurationitem` WRITE;
/*!40000 ALTER TABLE `managedconfigurationitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `managedconfigurationitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membershipbase`
--

DROP TABLE IF EXISTS `membershipbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membershipbase` (
  `ID` decimal(18,0) NOT NULL,
  `USER_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `GROUP_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `mshipbase_user` (`USER_NAME`),
  KEY `mshipbase_group` (`GROUP_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membershipbase`
--

LOCK TABLES `membershipbase` WRITE;
/*!40000 ALTER TABLE `membershipbase` DISABLE KEYS */;
/*!40000 ALTER TABLE `membershipbase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moved_issue_key`
--

DROP TABLE IF EXISTS `moved_issue_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moved_issue_key` (
  `ID` decimal(18,0) NOT NULL,
  `OLD_ISSUE_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ISSUE_ID` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `idx_old_issue_key` (`OLD_ISSUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moved_issue_key`
--

LOCK TABLES `moved_issue_key` WRITE;
/*!40000 ALTER TABLE `moved_issue_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `moved_issue_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodeassociation`
--

DROP TABLE IF EXISTS `nodeassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodeassociation` (
  `SOURCE_NODE_ID` decimal(18,0) NOT NULL,
  `SOURCE_NODE_ENTITY` varchar(60) COLLATE utf8_bin NOT NULL,
  `SINK_NODE_ID` decimal(18,0) NOT NULL,
  `SINK_NODE_ENTITY` varchar(60) COLLATE utf8_bin NOT NULL,
  `ASSOCIATION_TYPE` varchar(60) COLLATE utf8_bin NOT NULL,
  `SEQUENCE` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`SOURCE_NODE_ID`,`SOURCE_NODE_ENTITY`,`SINK_NODE_ID`,`SINK_NODE_ENTITY`,`ASSOCIATION_TYPE`),
  KEY `node_source` (`SOURCE_NODE_ID`,`SOURCE_NODE_ENTITY`),
  KEY `node_sink` (`SINK_NODE_ID`,`SINK_NODE_ENTITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodeassociation`
--

LOCK TABLES `nodeassociation` WRITE;
/*!40000 ALTER TABLE `nodeassociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `nodeassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodeindexcounter`
--

DROP TABLE IF EXISTS `nodeindexcounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodeindexcounter` (
  `ID` decimal(18,0) NOT NULL,
  `NODE_ID` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `SENDING_NODE_ID` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `INDEX_OPERATION_ID` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `node_id_idx` (`NODE_ID`,`SENDING_NODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodeindexcounter`
--

LOCK TABLES `nodeindexcounter` WRITE;
/*!40000 ALTER TABLE `nodeindexcounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `nodeindexcounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `ID` decimal(18,0) NOT NULL,
  `SCHEME` decimal(18,0) DEFAULT NULL,
  `EVENT` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `EVENT_TYPE_ID` decimal(18,0) DEFAULT NULL,
  `TEMPLATE_ID` decimal(18,0) DEFAULT NULL,
  `notif_type` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `notif_parameter` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ntfctn_scheme` (`SCHEME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (10000,10000,NULL,1,NULL,'Current_Assignee',NULL),(10001,10000,NULL,1,NULL,'Current_Reporter',NULL),(10002,10000,NULL,1,NULL,'All_Watchers',NULL),(10003,10000,NULL,2,NULL,'Current_Assignee',NULL),(10004,10000,NULL,2,NULL,'Current_Reporter',NULL),(10005,10000,NULL,2,NULL,'All_Watchers',NULL),(10006,10000,NULL,3,NULL,'Current_Assignee',NULL),(10007,10000,NULL,3,NULL,'Current_Reporter',NULL),(10008,10000,NULL,3,NULL,'All_Watchers',NULL),(10009,10000,NULL,4,NULL,'Current_Assignee',NULL),(10010,10000,NULL,4,NULL,'Current_Reporter',NULL),(10011,10000,NULL,4,NULL,'All_Watchers',NULL),(10012,10000,NULL,5,NULL,'Current_Assignee',NULL),(10013,10000,NULL,5,NULL,'Current_Reporter',NULL),(10014,10000,NULL,5,NULL,'All_Watchers',NULL),(10015,10000,NULL,6,NULL,'Current_Assignee',NULL),(10016,10000,NULL,6,NULL,'Current_Reporter',NULL),(10017,10000,NULL,6,NULL,'All_Watchers',NULL),(10018,10000,NULL,7,NULL,'Current_Assignee',NULL),(10019,10000,NULL,7,NULL,'Current_Reporter',NULL),(10020,10000,NULL,7,NULL,'All_Watchers',NULL),(10021,10000,NULL,8,NULL,'Current_Assignee',NULL),(10022,10000,NULL,8,NULL,'Current_Reporter',NULL),(10023,10000,NULL,8,NULL,'All_Watchers',NULL),(10024,10000,NULL,9,NULL,'Current_Assignee',NULL),(10025,10000,NULL,9,NULL,'Current_Reporter',NULL),(10026,10000,NULL,9,NULL,'All_Watchers',NULL),(10027,10000,NULL,10,NULL,'Current_Assignee',NULL),(10028,10000,NULL,10,NULL,'Current_Reporter',NULL),(10029,10000,NULL,10,NULL,'All_Watchers',NULL),(10030,10000,NULL,11,NULL,'Current_Assignee',NULL),(10031,10000,NULL,11,NULL,'Current_Reporter',NULL),(10032,10000,NULL,11,NULL,'All_Watchers',NULL),(10033,10000,NULL,12,NULL,'Current_Assignee',NULL),(10034,10000,NULL,12,NULL,'Current_Reporter',NULL),(10035,10000,NULL,12,NULL,'All_Watchers',NULL),(10036,10000,NULL,13,NULL,'Current_Assignee',NULL),(10037,10000,NULL,13,NULL,'Current_Reporter',NULL),(10038,10000,NULL,13,NULL,'All_Watchers',NULL),(10100,10000,NULL,14,NULL,'Current_Assignee',NULL),(10101,10000,NULL,14,NULL,'Current_Reporter',NULL),(10102,10000,NULL,14,NULL,'All_Watchers',NULL),(10103,10000,NULL,15,NULL,'Current_Assignee',NULL),(10104,10000,NULL,15,NULL,'Current_Reporter',NULL),(10105,10000,NULL,15,NULL,'All_Watchers',NULL),(10106,10000,NULL,16,NULL,'Current_Assignee',NULL),(10107,10000,NULL,16,NULL,'Current_Reporter',NULL),(10108,10000,NULL,16,NULL,'All_Watchers',NULL);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificationinstance`
--

DROP TABLE IF EXISTS `notificationinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificationinstance` (
  `ID` decimal(18,0) NOT NULL,
  `notificationtype` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `SOURCE` decimal(18,0) DEFAULT NULL,
  `emailaddress` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGEID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `notif_source` (`SOURCE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificationinstance`
--

LOCK TABLES `notificationinstance` WRITE;
/*!40000 ALTER TABLE `notificationinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificationinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificationscheme`
--

DROP TABLE IF EXISTS `notificationscheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificationscheme` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificationscheme`
--

LOCK TABLES `notificationscheme` WRITE;
/*!40000 ALTER TABLE `notificationscheme` DISABLE KEYS */;
INSERT INTO `notificationscheme` VALUES (10000,'Default Notification Scheme',NULL);
/*!40000 ALTER TABLE `notificationscheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauthconsumer`
--

DROP TABLE IF EXISTS `oauthconsumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauthconsumer` (
  `ID` decimal(18,0) NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `consumername` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CONSUMER_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `consumerservice` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PUBLIC_KEY` text COLLATE utf8_bin,
  `PRIVATE_KEY` text COLLATE utf8_bin,
  `DESCRIPTION` text COLLATE utf8_bin,
  `CALLBACK` text COLLATE utf8_bin,
  `SIGNATURE_METHOD` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `SHARED_SECRET` text COLLATE utf8_bin,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `oauth_consumer_index` (`CONSUMER_KEY`),
  UNIQUE KEY `oauth_consumer_service_index` (`consumerservice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauthconsumer`
--

LOCK TABLES `oauthconsumer` WRITE;
/*!40000 ALTER TABLE `oauthconsumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauthconsumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauthconsumertoken`
--

DROP TABLE IF EXISTS `oauthconsumertoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauthconsumertoken` (
  `ID` decimal(18,0) NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `TOKEN_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_SECRET` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_TYPE` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `CONSUMER_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `oauth_consumer_token_key_index` (`TOKEN_KEY`),
  KEY `oauth_consumer_token_index` (`TOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauthconsumertoken`
--

LOCK TABLES `oauthconsumertoken` WRITE;
/*!40000 ALTER TABLE `oauthconsumertoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauthconsumertoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauthspconsumer`
--

DROP TABLE IF EXISTS `oauthspconsumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauthspconsumer` (
  `ID` decimal(18,0) NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CONSUMER_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `consumername` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PUBLIC_KEY` text COLLATE utf8_bin,
  `DESCRIPTION` text COLLATE utf8_bin,
  `CALLBACK` text COLLATE utf8_bin,
  `TWO_L_O_ALLOWED` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTING_TWO_L_O_USER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TWO_L_O_IMPERSONATION_ALLOWED` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `THREE_L_O_ALLOWED` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `oauth_sp_consumer_index` (`CONSUMER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauthspconsumer`
--

LOCK TABLES `oauthspconsumer` WRITE;
/*!40000 ALTER TABLE `oauthspconsumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauthspconsumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauthsptoken`
--

DROP TABLE IF EXISTS `oauthsptoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauthsptoken` (
  `ID` decimal(18,0) NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `TOKEN` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_SECRET` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_TYPE` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `CONSUMER_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USERNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TTL` decimal(18,0) DEFAULT NULL,
  `spauth` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK` text COLLATE utf8_bin,
  `spverifier` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `spversion` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `SESSION_HANDLE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SESSION_CREATION_TIME` datetime DEFAULT NULL,
  `SESSION_LAST_RENEWAL_TIME` datetime DEFAULT NULL,
  `SESSION_TIME_TO_LIVE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `oauth_sp_token_index` (`TOKEN`),
  KEY `oauth_sp_consumer_key_index` (`CONSUMER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauthsptoken`
--

LOCK TABLES `oauthsptoken` WRITE;
/*!40000 ALTER TABLE `oauthsptoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauthsptoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `optionconfiguration`
--

DROP TABLE IF EXISTS `optionconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `optionconfiguration` (
  `ID` decimal(18,0) NOT NULL,
  `FIELDID` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `OPTIONID` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `FIELDCONFIG` decimal(18,0) DEFAULT NULL,
  `SEQUENCE` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fieldid_optionid` (`FIELDID`,`OPTIONID`),
  KEY `fieldid_fieldconf` (`FIELDID`,`FIELDCONFIG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optionconfiguration`
--

LOCK TABLES `optionconfiguration` WRITE;
/*!40000 ALTER TABLE `optionconfiguration` DISABLE KEYS */;
INSERT INTO `optionconfiguration` VALUES (10100,'issuetype','1',10000,0),(10101,'issuetype','2',10000,1),(10102,'issuetype','3',10000,2),(10103,'issuetype','4',10000,3),(10104,'issuetype','5',10000,4);
/*!40000 ALTER TABLE `optionconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os_currentstep`
--

DROP TABLE IF EXISTS `os_currentstep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `os_currentstep` (
  `ID` decimal(18,0) NOT NULL,
  `ENTRY_ID` decimal(18,0) DEFAULT NULL,
  `STEP_ID` decimal(9,0) DEFAULT NULL,
  `ACTION_ID` decimal(9,0) DEFAULT NULL,
  `OWNER` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `DUE_DATE` datetime DEFAULT NULL,
  `FINISH_DATE` datetime DEFAULT NULL,
  `STATUS` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `CALLER` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `wf_entryid` (`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_currentstep`
--

LOCK TABLES `os_currentstep` WRITE;
/*!40000 ALTER TABLE `os_currentstep` DISABLE KEYS */;
/*!40000 ALTER TABLE `os_currentstep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os_historystep`
--

DROP TABLE IF EXISTS `os_historystep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `os_historystep` (
  `ID` decimal(18,0) NOT NULL,
  `ENTRY_ID` decimal(18,0) DEFAULT NULL,
  `STEP_ID` decimal(9,0) DEFAULT NULL,
  `ACTION_ID` decimal(9,0) DEFAULT NULL,
  `OWNER` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `DUE_DATE` datetime DEFAULT NULL,
  `FINISH_DATE` datetime DEFAULT NULL,
  `STATUS` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `CALLER` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `historystep_entryid` (`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_historystep`
--

LOCK TABLES `os_historystep` WRITE;
/*!40000 ALTER TABLE `os_historystep` DISABLE KEYS */;
/*!40000 ALTER TABLE `os_historystep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissionscheme`
--

DROP TABLE IF EXISTS `permissionscheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissionscheme` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissionscheme`
--

LOCK TABLES `permissionscheme` WRITE;
/*!40000 ALTER TABLE `permissionscheme` DISABLE KEYS */;
INSERT INTO `permissionscheme` VALUES (0,'Default Permission Scheme','This is the default Permission Scheme. Any new projects that are created will be assigned this scheme.');
/*!40000 ALTER TABLE `permissionscheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pluginstate`
--

DROP TABLE IF EXISTS `pluginstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginstate` (
  `pluginkey` varchar(255) COLLATE utf8_bin NOT NULL,
  `pluginenabled` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`pluginkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pluginstate`
--

LOCK TABLES `pluginstate` WRITE;
/*!40000 ALTER TABLE `pluginstate` DISABLE KEYS */;
INSERT INTO `pluginstate` VALUES ('com.atlassian.jira.welcome.jira-welcome-plugin:show-whats-new-flag','true');
/*!40000 ALTER TABLE `pluginstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pluginversion`
--

DROP TABLE IF EXISTS `pluginversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginversion` (
  `ID` decimal(18,0) NOT NULL,
  `pluginname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pluginkey` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pluginversion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pluginversion`
--

LOCK TABLES `pluginversion` WRITE;
/*!40000 ALTER TABLE `pluginversion` DISABLE KEYS */;
INSERT INTO `pluginversion` VALUES (10000,'ActiveObjects Plugin - OSGi Bundle','com.atlassian.activeobjects.activeobjects-plugin','0.23.7','2014-11-13 20:21:15'),(10001,'JIRA Active Objects SPI implementation','com.atlassian.activeobjects.jira.spi','0.23.7','2014-11-13 20:21:15'),(10002,'Atlassian Template Renderer API','com.atlassian.templaterenderer.api','1.5.4','2014-11-13 20:21:15'),(10003,'Atlassian Template Renderer Velocity 1.6 Plugin','com.atlassian.templaterenderer.atlassian-template-renderer-velocity1.6-plugin','1.5.4','2014-11-13 20:21:15'),(10004,'Atlassian REST - Module Types','com.atlassian.plugins.rest.atlassian-rest-module','2.9.6','2014-11-13 20:21:15'),(10005,'Atlassian - Administration - Quick Search - JIRA','com.atlassian.administration.atlassian-admin-quicksearch-jira','1.5','2014-11-13 20:21:15'),(10006,'Atlassian OAuth Service Provider SPI','com.atlassian.oauth.atlassian-oauth-service-provider-spi','1.9.4','2014-11-13 20:21:15'),(10007,'Atlassian OAuth Consumer SPI','com.atlassian.oauth.atlassian-oauth-consumer-spi','1.9.4','2014-11-13 20:21:15'),(10008,'Atlassian JIRA - Plugins - OAuth Consumer SPI','com.atlassian.jira.oauth.consumer','6.3','2014-11-13 20:21:15'),(10009,'JSON Library','com.atlassian.bundles.json-20070829.0.0.1','20070829.0.0.1','2014-11-13 20:21:15'),(10010,'Applinks Product Plugin','com.atlassian.applinks.applinks-plugin','4.2.1','2014-11-13 20:21:16'),(10011,'atlassian-failure-cache-plugin','com.atlassian.atlassian-failure-cache-plugin','0.14','2014-11-13 20:21:16'),(10012,'Atlassian UI Plugin','com.atlassian.auiplugin','5.6.7-jira-1','2014-11-13 20:21:16'),(10013,'ICU4J','com.atlassian.bundles.icu4j-3.8.0.1','3.8.0.1','2014-11-13 20:21:16'),(10014,'Neko HTML','com.atlassian.bundles.nekohtml-1.9.12.1','1.9.12.1','2014-11-13 20:21:16'),(10015,'Atlassian Embedded Crowd - Administration Plugin','com.atlassian.crowd.embedded.admin','1.7.3','2014-11-13 20:21:16'),(10016,'Gadget Dashboard Plugin','com.atlassian.gadgets.dashboard','3.5.1','2014-11-13 20:21:16'),(10017,'Apache HttpCore OSGi bundle','org.apache.httpcomponents.httpcore-4.2.4','4.2.4','2014-11-13 20:21:16'),(10018,'ROME, RSS and atOM utilitiEs for Java','rome.rome-1.0','1.0','2014-11-13 20:21:16'),(10019,'Apache HttpClient OSGi bundle','org.apache.httpcomponents.httpclient-4.2.5','4.2.5','2014-11-13 20:21:16'),(10020,'Gadget Directory Plugin','com.atlassian.gadgets.directory','3.5.1','2014-11-13 20:21:16'),(10021,'Embedded Gadgets Plugin','com.atlassian.gadgets.embedded','3.5.1','2014-11-13 20:21:16'),(10022,'Atlassian Gadgets OAuth Service Provider Plugin','com.atlassian.gadgets.oauth.serviceprovider','3.5.1','2014-11-13 20:21:16'),(10023,'Opensocial Plugin','com.atlassian.gadgets.opensocial','3.5.1','2014-11-13 20:21:16'),(10024,'Gadget Spec Publisher Plugin','com.atlassian.gadgets.publisher','3.5.1','2014-11-13 20:21:16'),(10025,'Atlassian HealthCheck Common Module','com.atlassian.healthcheck.atlassian-healthcheck','2.0.7','2014-11-13 20:21:16'),(10026,'HipChat Core Plugin','com.atlassian.hipchat.plugins.core','0.8.3','2014-11-13 20:21:16'),(10027,'Atlassian HTTP Client, Apache HTTP components impl','com.atlassian.httpclient.atlassian-httpclient-plugin','0.17.3','2014-11-13 20:21:16'),(10028,'Apache ServiceMix :: Bundles :: javax.inject','org.apache.servicemix.bundles.javax-inject-1.0.0.1','1.0.0.1','2014-11-13 20:21:16'),(10029,'Atlassian JIRA - Plugins - REST Plugin','com.atlassian.jira.rest','6.3','2014-11-13 20:21:16'),(10030,'Universal Plugin Manager - Role-Based Licensing Implementation Plugin','com.atlassian.upm.role-based-licensing-plugin','2.17','2014-11-13 20:21:16'),(10031,'Atlassian Universal Plugin Manager Plugin','com.atlassian.upm.atlassian-universal-plugin-manager-plugin','2.17','2014-11-13 20:21:16'),(10032,'JIRA Workflow Designer Plugin','com.atlassian.jira.plugins.jira-workflow-designer','6.3.23','2014-11-13 20:21:16'),(10033,'JIRA Workflow Sharing Plugin','com.atlassian.jira.plugins.workflow.sharing.jira-workflow-sharing-plugin','1.1.30','2014-11-13 20:21:16'),(10034,'Project Templates Plugin','com.atlassian.jira.project-templates-plugin','2.41','2014-11-13 20:21:16'),(10035,'JIRA Core Project Templates Plugin','com.atlassian.jira-core-project-templates','2.41','2014-11-13 20:21:16'),(10036,'JIRA Issue Collector Plugin','com.atlassian.jira.collector.plugin.jira-issue-collector-plugin','1.4.13','2014-11-13 20:21:16'),(10037,'RPC JIRA Plugin','com.atlassian.jira.ext.rpc','6.3','2014-11-13 20:21:16'),(10038,'JIRA iCalendar Plugin','com.atlassian.jira.extra.jira-ical-feed','1.0.16','2014-11-13 20:21:16'),(10039,'Streams SPI','com.atlassian.streams.streams-spi-5.4.1','5.4.1','2014-11-13 20:21:16'),(10040,'Atlassian Whitelist API Plugin','com.atlassian.plugins.atlassian-whitelist-api-plugin','1.7','2014-11-13 20:21:16'),(10041,'Atlassian JIRA - Plugins - Gadgets Plugin','com.atlassian.jira.gadgets','6.3','2014-11-13 20:21:16'),(10042,'Atlassian JIRA - Plugins - Admin Navigation Component','com.atlassian.jira.jira-admin-navigation-plugin','6.3','2014-11-13 20:21:16'),(10043,'Atlassian JIRA - Plugins - Application Properties','com.atlassian.jira.jira-application-properties-plugin','6.3','2014-11-13 20:21:16'),(10044,'JIRA Base URL Plugin','com.atlassian.jira.jira-baseurl-plugin','1.10','2014-11-13 20:21:16'),(10045,'JIRA Feedback Plugin','com.atlassian.jira.jira-feedback-plugin','1.12','2014-11-13 20:21:16'),(10046,'Atlassian Navigation Links Plugin','com.atlassian.plugins.atlassian-nav-links-plugin','3.3.4','2014-11-13 20:21:16'),(10047,'Atlassian JIRA - Plugins - Header Plugin','com.atlassian.jira.jira-header-plugin','6.3','2014-11-13 20:21:16'),(10048,'Atlassian JIRA - Plugins - Invite User','com.atlassian.jira.jira-invite-user-plugin','1.16','2014-11-13 20:21:16'),(10049,'Atlassian JIRA - Plugins - Common AppLinks Based Issue Link Plugin','com.atlassian.jira.jira-issue-link-applinks-common-plugin','6.3','2014-11-13 20:21:16'),(10050,'Atlassian JIRA - Plugins - View Issue Panels','com.atlassian.jira.jira-view-issue-plugin','6.3','2014-11-13 20:21:16'),(10051,'Atlassian JIRA - Plugins - Confluence Link','com.atlassian.jira.jira-issue-link-confluence-plugin','6.3','2014-11-13 20:21:16'),(10052,'Atlassian JIRA - Plugins - Remote JIRA Link','com.atlassian.jira.jira-issue-link-remote-jira-plugin','6.3','2014-11-13 20:21:16'),(10053,'Atlassian JIRA - Plugins - Issue Web Link','com.atlassian.jira.jira-issue-link-web-plugin','6.3','2014-11-13 20:21:16'),(10054,'jira-issue-nav-components','com.atlassian.jira.jira-issue-nav-components','6.3.20','2014-11-13 20:21:16'),(10055,'Atlassian JIRA - Plugins - Issue Search','com.atlassian.jira.jira-issue-nav-plugin','6.3.20','2014-11-13 20:21:16'),(10056,'English (United Kingdom) Language Pack','com.atlassian.jira.jira-languages.en_UK','6.3','2014-11-13 20:21:16'),(10057,'English (United States) Language Pack','com.atlassian.jira.jira-languages.en_US','6.3','2014-11-13 20:21:16'),(10058,'Atlassian LESS Transformer Plugin','com.atlassian.plugins.less-transformer-plugin','2.1.1','2014-11-13 20:21:16'),(10059,'Atlassian JIRA - Plugins - LESS integration','com.atlassian.jira.jira-less-integration','6.3','2014-11-13 20:21:16'),(10060,'Atlassian JIRA - Plugins - Mail Plugin','com.atlassian.jira.jira-mail-plugin','6.3.10','2014-11-13 20:21:16'),(10061,'JIRA Monitoring Plugin','com.atlassian.jira.jira-monitoring-plugin','05.6.1','2014-11-13 20:21:16'),(10062,'Atlassian JIRA - Plugins - My JIRA Home','com.atlassian.jira.jira-my-home-plugin','6.3','2014-11-13 20:21:16'),(10063,'JIRA Project Config Plugin','com.atlassian.jira.jira-project-config-plugin','6.3.43','2014-11-13 20:21:16'),(10064,'JIRA Projects Plugin','com.atlassian.jira.jira-projects-plugin','1.1.8','2014-11-13 20:21:16'),(10065,'Atlassian JIRA - Plugins - Quick Edit Plugin','com.atlassian.jira.jira-quick-edit-plugin','2.0.1','2014-11-13 20:21:16'),(10066,'Atlassian JIRA - Plugins - Share Content Component','com.atlassian.jira.jira-share-plugin','6.3','2014-11-13 20:21:16'),(10067,'Atlassian JIRA - Plugins - Closure Template Renderer','com.atlassian.jira.jira-soy-plugin','6.3','2014-11-13 20:21:16'),(10068,'JIRA Time Zone Detection plugin','com.atlassian.jira.jira-tzdetect-plugin','2.0.2','2014-11-13 20:21:16'),(10069,'Atlassian JIRA - Plugins - User Profile Plugin','com.atlassian.jira.jira-user-profile-plugin','2.0.1','2014-11-13 20:21:16'),(10070,'Atlassian JIRA - Plugins - Look And Feel Logo Upload Plugin','com.atlassian.jira.lookandfeel','6.3','2014-11-13 20:21:16'),(10071,'JIRA Mobile','com.atlassian.jira.mobile','1.6','2014-11-13 20:21:16'),(10072,'Atlassian JIRA - Plugins - OAuth Service Provider SPI','com.atlassian.jira.oauth.serviceprovider','6.3','2014-11-13 20:21:16'),(10073,'JIRA Bamboo Plugin','com.atlassian.jira.plugin.ext.bamboo','7.1.11','2014-11-13 20:21:16'),(10074,'Comment Panel Plugin','com.atlassian.jira.plugin.system.comment-panel','1.0','2014-11-13 20:21:16'),(10075,'Custom Field Types & Searchers','com.atlassian.jira.plugin.system.customfieldtypes','1.0','2014-11-13 20:21:16'),(10076,'Issue Operations Plugin','com.atlassian.jira.plugin.system.issueoperations','1.0','2014-11-13 20:21:16'),(10077,'Issue Tab Panels Plugin','com.atlassian.jira.plugin.system.issuetabpanels','1.0','2014-11-13 20:21:16'),(10078,'Renderer Plugin','com.atlassian.jira.plugin.system.jirarenderers','1.0','2014-11-13 20:21:16'),(10079,'System License Roles','com.atlassian.jira.plugin.system.license.roles','1.0','2014-11-13 20:21:16'),(10080,'Project Role Actors Plugin','com.atlassian.jira.plugin.system.projectroleactors','1.0','2014-11-13 20:21:16'),(10081,'Wiki Renderer Macros Plugin','com.atlassian.jira.plugin.system.renderers.wiki.macros','1.0','2014-11-13 20:21:16'),(10082,'Reports Plugin','com.atlassian.jira.plugin.system.reports','1.0','2014-11-13 20:21:16'),(10083,'Workflow Plugin','com.atlassian.jira.plugin.system.workflow','1.0','2014-11-13 20:21:16'),(10084,'JIRA Workflow Transition Tabs','com.atlassian.jira.plugin.system.workfloweditor.transition.tabs','1.0','2014-11-13 20:21:16'),(10085,'Content Link Resolvers Plugin','com.atlassian.jira.plugin.wiki.contentlinkresolvers','1.0','2014-11-13 20:21:16'),(10086,'Renderer Component Factories Plugin','com.atlassian.jira.plugin.wiki.renderercomponentfactories','1.0','2014-11-13 20:21:16'),(10087,'JIRA Agile Marketing Plugin','com.atlassian.jira.plugins.greenhopper-marketing-plugin','1.0.14','2014-11-13 20:21:16'),(10088,'scala-provider-plugin','com.atlassian.scala.plugins.scala-2.10-provider-plugin','0.5','2014-11-13 20:21:16'),(10089,'jackson-module-scala-2.10-provider','com.atlassian.scala.plugins.jackson-module-scala-2.10-provider-plugin','0.5','2014-11-13 20:21:16'),(10090,'jira-inline-issue-create-plugin','com.atlassian.jira.plugins.inline-create.jira-inline-issue-create-plugin','0.2.2','2014-11-13 20:21:16'),(10091,'Atlassian JIRA - Admin Helper Plugin','com.atlassian.jira.plugins.jira-admin-helper-plugin','1.18.5','2014-11-13 20:21:16'),(10092,'JIRA Auditing Plugin','com.atlassian.jira.plugins.jira-auditing-plugin','1.4.3','2014-11-13 20:21:17'),(10093,'Streams API','com.atlassian.streams.streams-api-5.4.1','5.4.1','2014-11-13 20:21:17'),(10094,'JIRA DVCS Connector Plugin','com.atlassian.jira.plugins.jira-bitbucket-connector-plugin','2.1.15','2014-11-13 20:21:17'),(10095,'Atlassian Remote Event Common Plugin','com.atlassian.plugins.atlassian-remote-event-common-plugin','0.6.1','2014-11-13 20:21:17'),(10096,'Atlassian JIRA - Plugins - Development Integration Plugin','com.atlassian.jira.plugins.jira-development-integration-plugin','2.2.6','2014-11-13 20:21:17'),(10097,'Atlassian JIRA - Plugins - Healthcheck Plugin','com.atlassian.jira.plugins.jira-healthcheck-plugin','1.0.10','2014-11-13 20:21:17'),(10098,'JIRA Importers Plugin (JIM)','com.atlassian.jira.plugins.jira-importers-plugin','6.1.12','2014-11-13 20:21:17'),(10099,'Bitbucket Importer Plugin for JIM','com.atlassian.jira.plugins.jira-importers-bitbucket-plugin','1.0.8','2014-11-13 20:21:17'),(10100,'JIRA GitHub Issue Importer','com.atlassian.jira.plugins.jira-importers-github-plugin','2.0.2','2014-11-13 20:21:17'),(10101,'Redmine Importers Plugin for JIM','com.atlassian.jira.plugins.jira-importers-redmine-plugin','2.0.7','2014-11-13 20:21:17'),(10102,'JIRA Password Policy Plugin','com.atlassian.jira.plugins.jira-password-policy-plugin','1.1.2','2014-11-13 20:21:17'),(10103,'JIRA for Software Plugin','com.atlassian.jira.plugins.jira-software-plugin','0.9','2014-11-13 20:21:17'),(10104,'Atlassian JIRA - Plugins - Transition Trigger Plugin','com.atlassian.jira.plugins.jira-transition-triggers-plugin','2.2.5','2014-11-13 20:21:17'),(10105,'Atlassian WebHooks Plugin','com.atlassian.webhooks.atlassian-webhooks-plugin','0.17.6','2014-11-13 20:21:17'),(10106,'JIRA WebHooks Plugin','com.atlassian.jira.plugins.webhooks.jira-webhooks-plugin','1.2.6','2014-11-13 20:21:17'),(10107,'JIRA JSON-RPC Plugin','com.atlassian.jira.rpc.jira-json-rpc-plugin','1.0.4','2014-11-13 20:21:17'),(10108,'JIRA Welcome Plugin','com.atlassian.jira.welcome.jira-welcome-plugin','1.1.53','2014-11-13 20:21:17'),(10109,'FishEye Plugin','com.atlassian.jirafisheyeplugin','6.3.4','2014-11-13 20:21:17'),(10110,'Wallboard Plugin','com.atlassian.jirawallboard.atlassian-wallboard-plugin','1.8.9','2014-11-13 20:21:17'),(10111,'Atlassian Bot Session Killer','com.atlassian.labs.atlassian-bot-killer','1.7.5','2014-11-13 20:21:17'),(10112,'HipChat for JIRA','com.atlassian.labs.hipchat.hipchat-for-jira-plugin','1.2.11','2014-11-13 20:21:17'),(10113,'Workbox - Common Plugin','com.atlassian.mywork.mywork-common-plugin','1.8.1','2014-11-13 20:21:17'),(10114,'Workbox - JIRA Provider Plugin','com.atlassian.mywork.mywork-jira-provider-plugin','1.8.1','2014-11-13 20:21:17'),(10115,'Atlassian OAuth Admin Plugin','com.atlassian.oauth.admin','1.9.4','2014-11-13 20:21:17'),(10116,'Atlassian OAuth Consumer Plugin','com.atlassian.oauth.consumer','1.9.4','2014-11-13 20:21:17'),(10117,'Atlassian OAuth Service Provider Plugin','com.atlassian.oauth.serviceprovider','1.9.4','2014-11-13 20:21:17'),(10118,'Atlassian Awareness Capability','com.atlassian.plugins.atlassian-awareness-capability','0.0.5','2014-11-13 20:21:17'),(10119,'Atlassian Plugins - Web Resources - Implementation Plugin','com.atlassian.plugins.atlassian-plugins-webresource-plugin','3.1.0','2014-11-13 20:21:17'),(10120,'Project Creation Capability Product REST Plugin','com.atlassian.plugins.atlassian-project-creation-plugin','1.2.11','2014-11-13 20:21:17'),(10121,'Atlassian Remote Event Consumer Plugin','com.atlassian.plugins.atlassian-remote-event-consumer-plugin','0.6.1','2014-11-13 20:21:17'),(10122,'Atlassian Whitelist UI Plugin','com.atlassian.plugins.atlassian-whitelist-ui-plugin','1.7','2014-11-13 20:21:17'),(10123,'jira-help-tips','com.atlassian.plugins.helptips.jira-help-tips','0.45','2014-11-13 20:21:17'),(10124,'Issue Status Plugin','com.atlassian.plugins.issue-status-plugin','1.1.6','2014-11-13 20:21:17'),(10125,'Attach Image for JIRA','com.atlassian.plugins.jira-html5-attach-images','1.5.4','2014-11-13 20:21:17'),(10126,'Project Creation Plugin SPI for JIRA','com.atlassian.plugins.jira-project-creation','1.2.11','2014-11-13 20:21:17'),(10127,'Remote Link Aggregator Plugin','com.atlassian.plugins.remote-link-aggregator-plugin','2.0.9','2014-11-13 20:21:17'),(10128,'JIRA Remote Link Aggregator Plugin','com.atlassian.plugins.jira-remote-link-aggregator-plugin','2.0.9','2014-11-13 20:21:17'),(10129,'jquery','com.atlassian.plugins.jquery','1.7.2','2014-11-13 20:21:17'),(10130,'Atlassian Pretty URLs Plugin','com.atlassian.prettyurls.atlassian-pretty-urls-plugin','1.11.0','2014-11-13 20:21:17'),(10131,'Atlassian JIRA - Plugins - SAL Plugin','com.atlassian.sal.jira','6.3','2014-11-13 20:21:17'),(10132,'Atlassian Soy - Plugin','com.atlassian.soy.soy-template-plugin','2.7.0','2014-11-13 20:21:17'),(10133,'Streams Plugin','com.atlassian.streams','5.4.1','2014-11-13 20:21:17'),(10134,'Streams Inline Actions Plugin','com.atlassian.streams.actions','5.4.1','2014-11-13 20:21:17'),(10135,'Streams Core Plugin','com.atlassian.streams.core','5.4.1','2014-11-13 20:21:17'),(10136,'JIRA Streams Inline Actions Plugin','com.atlassian.streams.jira.inlineactions','5.4.1','2014-11-13 20:21:17'),(10137,'JIRA Activity Stream Plugin','com.atlassian.streams.streams-jira-plugin','5.4.1','2014-11-13 20:21:17'),(10138,'Streams Third Party Provider Plugin','com.atlassian.streams.streams-thirdparty-plugin','5.4.1','2014-11-13 20:21:17'),(10139,'Support Tools Plugin','com.atlassian.support.stp','3.5.14','2014-11-13 20:21:17'),(10140,'ROME: RSS/Atom syndication and publishing tools','com.springsource.com.sun.syndication-0.9.0','0.9.0','2014-11-13 20:21:17'),(10141,'JDOM DOM Processor','com.springsource.org.jdom-1.0.0','1.0.0','2014-11-13 20:21:17'),(10142,'Crowd REST API','crowd-rest-application-management','1.0','2014-11-13 20:21:17'),(10143,'Crowd REST API','crowd-rest-plugin','1.0','2014-11-13 20:21:17'),(10144,'Crowd System Password Encoders','crowd.system.passwordencoders','1.0','2014-11-13 20:21:17'),(10145,'JIRA Footer','jira.footer','1.0','2014-11-13 20:21:17'),(10146,'Help Paths Plugin','jira.help.paths','1.0','2014-11-13 20:21:17'),(10147,'Issue Views Plugin','jira.issueviews','1.0','2014-11-13 20:21:17'),(10148,'JQL Functions','jira.jql.function','1.0','2014-11-13 20:21:17'),(10149,'Keyboard Shortcuts Plugin','jira.keyboard.shortcuts','1.0','2014-11-13 20:21:17'),(10150,'JIRA Global Permissions','jira.system.global.permissions','1.0','2014-11-13 20:21:17'),(10151,'JIRA Project Permissions','jira.system.project.permissions','1.0','2014-11-13 20:21:17'),(10152,'Top Navigation Bar','jira.top.navigation.bar','1.0','2014-11-13 20:21:17'),(10153,'JIRA Usage Hints','jira.usage.hints','1.0','2014-11-13 20:21:17'),(10154,'User Format','jira.user.format','1.0','2014-11-13 20:21:17'),(10155,'User Profile Panels','jira.user.profile.panels','1.0','2014-11-13 20:21:17'),(10156,'Admin Menu Sections','jira.webfragments.admin','1.0','2014-11-13 20:21:17'),(10157,'Browse Project Operations Sections','jira.webfragments.browse.project.links','1.0','2014-11-13 20:21:17'),(10158,'Preset Filters Sections','jira.webfragments.preset.filters','1.0','2014-11-13 20:21:17'),(10159,'User Navigation Bar Sections','jira.webfragments.user.navigation.bar','1.0','2014-11-13 20:21:17'),(10160,'User Profile Links','jira.webfragments.user.profile.links','1.0','2014-11-13 20:21:17'),(10161,'View Project Operations Sections','jira.webfragments.view.project.operations','1.0','2014-11-13 20:21:17'),(10162,'Web Resources Plugin','jira.webresources','1.0','2014-11-13 20:21:17'),(10163,'Sisu-Inject','org.eclipse.sisu.inject-0.0.0.atlassian6','0.0.0.atlassian6','2014-11-13 20:21:17'),(10164,'ASM','org.objectweb.asm-3.3.1.v201105211655','3.3.1.v201105211655','2014-11-13 20:21:17'),(10165,'sisu-guice','org.sonatype.sisu.guice-3.1.3','3.1.3','2014-11-13 20:21:17'),(10166,'JIRA German (Germany) Language Pack','tac.jira.languages.de_DE','6.3.0-m06-v2r8533-2014-06-13','2014-11-13 20:21:17'),(10167,'JIRA Spanish (Spain) Language Pack','tac.jira.languages.es_ES','6.3.0-m06-v2r17546-2014-06-16','2014-11-13 20:21:17'),(10168,'JIRA French (France) Language Pack','tac.jira.languages.fr_FR','6.3.0-m06-v2r5012-2014-06-13','2014-11-13 20:21:17'),(10169,'JIRA Japanese (Japan) Language Pack','tac.jira.languages.ja_JP','6.3.0-m06-v2r19541-2014-06-18','2014-11-13 20:21:17');
/*!40000 ALTER TABLE `pluginversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portalpage`
--

DROP TABLE IF EXISTS `portalpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portalpage` (
  `ID` decimal(18,0) NOT NULL,
  `USERNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PAGENAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEQUENCE` decimal(18,0) DEFAULT NULL,
  `FAV_COUNT` decimal(18,0) DEFAULT NULL,
  `LAYOUT` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ppversion` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ppage_username` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portalpage`
--

LOCK TABLES `portalpage` WRITE;
/*!40000 ALTER TABLE `portalpage` DISABLE KEYS */;
INSERT INTO `portalpage` VALUES (10000,NULL,'System Dashboard',NULL,0,0,'AA',0);
/*!40000 ALTER TABLE `portalpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portletconfiguration`
--

DROP TABLE IF EXISTS `portletconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portletconfiguration` (
  `ID` decimal(18,0) NOT NULL,
  `PORTALPAGE` decimal(18,0) DEFAULT NULL,
  `PORTLET_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `COLUMN_NUMBER` decimal(9,0) DEFAULT NULL,
  `positionseq` decimal(9,0) DEFAULT NULL,
  `GADGET_XML` text COLLATE utf8_bin,
  `COLOR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portletconfiguration`
--

LOCK TABLES `portletconfiguration` WRITE;
/*!40000 ALTER TABLE `portletconfiguration` DISABLE KEYS */;
INSERT INTO `portletconfiguration` VALUES (10000,10000,NULL,0,0,'rest/gadgets/1.0/g/com.atlassian.jira.gadgets:introduction-gadget/gadgets/introduction-gadget.xml',NULL),(10001,10000,NULL,0,1,'rest/gadgets/1.0/g/com.atlassian.jira.gadgets:admin-gadget/gadgets/admin-gadget.xml',NULL),(10002,10000,NULL,1,0,'rest/gadgets/1.0/g/com.atlassian.jira.gadgets:assigned-to-me-gadget/gadgets/assigned-to-me-gadget.xml',NULL),(10003,10000,NULL,1,1,'rest/gadgets/1.0/g/com.atlassian.streams.streams-jira-plugin:activitystream-gadget/gadgets/activitystream-gadget.xml',NULL);
/*!40000 ALTER TABLE `portletconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priority`
--

DROP TABLE IF EXISTS `priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priority` (
  `ID` varchar(60) COLLATE utf8_bin NOT NULL,
  `SEQUENCE` decimal(18,0) DEFAULT NULL,
  `pname` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  `ICONURL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `STATUS_COLOR` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priority`
--

LOCK TABLES `priority` WRITE;
/*!40000 ALTER TABLE `priority` DISABLE KEYS */;
INSERT INTO `priority` VALUES ('1',1,'Blocker','Blocks development and/or testing work, production could not run.','/images/icons/priorities/blocker.png','#cc0000'),('2',2,'Critical','Crashes, loss of data, severe memory leak.','/images/icons/priorities/critical.png','#ff0000'),('3',3,'Major','Major loss of function.','/images/icons/priorities/major.png','#009900'),('4',4,'Minor','Minor loss of function, or other problem where easy workaround is present.','/images/icons/priorities/minor.png','#006600'),('5',5,'Trivial','Cosmetic problem like misspelt words or misaligned text.','/images/icons/priorities/trivial.png','#003300');
/*!40000 ALTER TABLE `priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productlicense`
--

DROP TABLE IF EXISTS `productlicense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productlicense` (
  `ID` decimal(18,0) NOT NULL,
  `LICENSE` longtext COLLATE utf8_bin,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productlicense`
--

LOCK TABLES `productlicense` WRITE;
/*!40000 ALTER TABLE `productlicense` DISABLE KEYS */;
/*!40000 ALTER TABLE `productlicense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `ID` decimal(18,0) NOT NULL,
  `pname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LEAD` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  `pkey` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pcounter` decimal(18,0) DEFAULT NULL,
  `ASSIGNEETYPE` decimal(18,0) DEFAULT NULL,
  `AVATAR` decimal(18,0) DEFAULT NULL,
  `ORIGINALKEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `idx_project_key` (`pkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_key`
--

DROP TABLE IF EXISTS `project_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_key` (
  `ID` decimal(18,0) NOT NULL,
  `PROJECT_ID` decimal(18,0) DEFAULT NULL,
  `PROJECT_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `idx_all_project_keys` (`PROJECT_KEY`),
  KEY `idx_all_project_ids` (`PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_key`
--

LOCK TABLES `project_key` WRITE;
/*!40000 ALTER TABLE `project_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectcategory`
--

DROP TABLE IF EXISTS `projectcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectcategory` (
  `ID` decimal(18,0) NOT NULL,
  `cname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectcategory`
--

LOCK TABLES `projectcategory` WRITE;
/*!40000 ALTER TABLE `projectcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectrole`
--

DROP TABLE IF EXISTS `projectrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectrole` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectrole`
--

LOCK TABLES `projectrole` WRITE;
/*!40000 ALTER TABLE `projectrole` DISABLE KEYS */;
INSERT INTO `projectrole` VALUES (10000,'Users','A project role that represents users in a project'),(10001,'Developers','A project role that represents developers in a project'),(10002,'Administrators','A project role that represents administrators in a project');
/*!40000 ALTER TABLE `projectrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectroleactor`
--

DROP TABLE IF EXISTS `projectroleactor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectroleactor` (
  `ID` decimal(18,0) NOT NULL,
  `PID` decimal(18,0) DEFAULT NULL,
  `PROJECTROLEID` decimal(18,0) DEFAULT NULL,
  `ROLETYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROLETYPEPARAMETER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `role_player_idx` (`PROJECTROLEID`,`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectroleactor`
--

LOCK TABLES `projectroleactor` WRITE;
/*!40000 ALTER TABLE `projectroleactor` DISABLE KEYS */;
INSERT INTO `projectroleactor` VALUES (10000,NULL,10000,'atlassian-group-role-actor','jira-users'),(10001,NULL,10001,'atlassian-group-role-actor','jira-developers'),(10002,NULL,10002,'atlassian-group-role-actor','jira-administrators');
/*!40000 ALTER TABLE `projectroleactor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectversion`
--

DROP TABLE IF EXISTS `projectversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectversion` (
  `ID` decimal(18,0) NOT NULL,
  `PROJECT` decimal(18,0) DEFAULT NULL,
  `vname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  `SEQUENCE` decimal(18,0) DEFAULT NULL,
  `RELEASED` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ARCHIVED` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `STARTDATE` datetime DEFAULT NULL,
  `RELEASEDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectversion`
--

LOCK TABLES `projectversion` WRITE;
/*!40000 ALTER TABLE `projectversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertydata`
--

DROP TABLE IF EXISTS `propertydata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propertydata` (
  `ID` decimal(18,0) NOT NULL,
  `propertyvalue` blob,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertydata`
--

LOCK TABLES `propertydata` WRITE;
/*!40000 ALTER TABLE `propertydata` DISABLE KEYS */;
/*!40000 ALTER TABLE `propertydata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertydate`
--

DROP TABLE IF EXISTS `propertydate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propertydate` (
  `ID` decimal(18,0) NOT NULL,
  `propertyvalue` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertydate`
--

LOCK TABLES `propertydate` WRITE;
/*!40000 ALTER TABLE `propertydate` DISABLE KEYS */;
/*!40000 ALTER TABLE `propertydate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertydecimal`
--

DROP TABLE IF EXISTS `propertydecimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propertydecimal` (
  `ID` decimal(18,0) NOT NULL,
  `propertyvalue` decimal(18,6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertydecimal`
--

LOCK TABLES `propertydecimal` WRITE;
/*!40000 ALTER TABLE `propertydecimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `propertydecimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertyentry`
--

DROP TABLE IF EXISTS `propertyentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propertyentry` (
  `ID` decimal(18,0) NOT NULL,
  `ENTITY_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_ID` decimal(18,0) DEFAULT NULL,
  `PROPERTY_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `propertytype` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `osproperty_all` (`ENTITY_ID`),
  KEY `osproperty_entityName` (`ENTITY_NAME`),
  KEY `osproperty_propertyKey` (`PROPERTY_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertyentry`
--

LOCK TABLES `propertyentry` WRITE;
/*!40000 ALTER TABLE `propertyentry` DISABLE KEYS */;
INSERT INTO `propertyentry` VALUES (1,'jira.properties',1,'jira.version.patched',5),(3,'jira.properties',1,'jira.avatar.default.id',5),(5,'jira.properties',1,'jira.avatar.user.default.id',5),(6,'jira.properties',1,'jira.avatar.user.anonymous.id',5),(7,'jira.properties',1,'jira.scheme.default.issue.type',5),(8,'jira.properties',1,'jira.constant.default.resolution',5),(9,'jira.properties',1,'jira.whitelist.disabled',1),(10,'jira.properties',1,'jira.whitelist.rules',6),(11,'jira.properties',1,'jira.option.timetracking',1),(12,'jira.properties',1,'jira.timetracking.estimates.legacy.behaviour',1),(13,'jira.properties',1,'jira.version',5),(14,'jira.properties',1,'jira.downgrade.minimum.version',5),(15,'jira.properties',1,'jira.option.allowunassigned',1),(21,'com.atlassian.jira.plugins.jira-workflow-designer',1,'jira.workflow.layout:8a6044147cf2c19c02d099279cfbfd47',6),(10100,'jira.properties',1,'jira.i18n.language.index',5),(10101,'jira.properties',1,'jira.sid.key',5),(10102,'jira.properties',1,'jira.avatar.issuetype.default.id',5),(10103,'jira.properties',1,'jira.avatar.issuetype.subtask.default.id',5),(10200,'jira.properties',1,'jira.webresource.flushcounter',5),(10201,'jira.properties',1,'jira.mail.send.disabled',1),(10202,'jira.properties',1,'mailsetting.jira.mail.send.disabled.modifiedBy',5),(10203,'jira.properties',1,'mailsetting.jira.mail.send.disabled.modifiedDate',5),(10204,'jira.properties',1,'webwork.i18n.encoding',5),(10205,'jira.properties',1,'jira.title',5),(10206,'jira.properties',1,'jira.baseurl',5),(10207,'jira.properties',1,'jira.mode',5),(10208,'jira.properties',1,'jira.path.index.use.default.directory',1),(10209,'jira.properties',1,'jira.option.indexing',1),(10210,'jira.properties',1,'jira.path.attachments',5),(10211,'jira.properties',1,'jira.path.attachments.use.default.directory',1),(10212,'jira.properties',1,'jira.option.allowattachments',1),(10213,'ServiceConfig',10001,'USE_DEFAULT_DIRECTORY',5),(10214,'jira.properties',1,'jira.path.backup',5),(10215,'jira.properties',1,'License20',6),(10216,'jira.properties',1,'jira.edition',5),(10217,'jira.properties',1,'org.apache.shindig.common.crypto.BlobCrypter:key',5),(10218,'BambooServerProperties',1,'bamboo.config.version',2),(10220,'jira.properties',1,'AO_4AEACD_#',5),(10221,'jira.properties',1,'jira.webresource.superbatch.flushcounter',5),(10223,'jira.properties',1,'com.atlassian.jira.util.index.IndexingCounterManagerImpl.counterValue',3),(10224,'jira.properties',1,'jira.setup',5),(10225,'jira.properties',1,'jira.option.user.externalmanagement',1),(10226,'jira.properties',1,'jira.option.voting',1),(10227,'jira.properties',1,'jira.option.watching',1),(10228,'jira.properties',1,'jira.option.issuelinking',1),(10229,'jira.properties',1,'jira.option.emailvisible',5),(10230,'jira.properties',1,'jira.option.allowsubtasks',1),(10231,'fisheye-jira-plugin.properties',1,'FISH-375-fixed',5),(10232,'fisheye-jira-plugin.properties',1,'fisheye.ual.migration.complete',5),(10233,'fisheye-jira-plugin.properties',1,'fisheye.ual.crucible.enabled.property.fix.complete',5),(10235,'jira.properties',1,'com.atlassian.sal.jira:build',5),(10237,'jira.properties',1,'com.atlassian.jira.jira-mail-plugin:build',5),(10238,'jira.properties',1,'com.atlassian.plugins.custom_apps.hasCustomOrder',5),(10239,'jira.properties',1,'com.atlassian.plugins.atlassian-nav-links-plugin:build',5),(10241,'jira.properties',1,'com.atlassian.jira.project-templates-plugin:build',5),(10242,'jira.properties',1,'com.atlassian.jira.plugins.jira-importers-plugin:build',5),(10243,'jira.properties',1,'com.atlassian.jira.plugin.ext.bamboo:build',5),(10247,'jira.properties',1,'com.atlassian.upm:notifications:dismissal-plugin.request',5),(10249,'jira.properties',1,'com.atlassian.upm:notifications:dismissal-evaluation.expired',5),(10251,'jira.properties',1,'com.atlassian.upm:notifications:dismissal-edition.mismatch',5),(10252,'jira.properties',1,'com.atlassian.upm:notifications:dismissal-maintenance.expired',5),(10254,'jira.properties',1,'com.atlassian.upm:notifications:dismissal-new.licenses',5),(10255,'jira.properties',1,'com.atlassian.upm:notifications:dismissal-updated.licenses',5),(10256,'jira.properties',1,'com.atlassian.upm:notifications:dismissal-auto.updated.plugin',5),(10257,'jira.properties',1,'com.atlassian.upm:notifications:dismissal-auto.updated.upm',5),(10258,'jira.properties',1,'com.atlassian.upm.request.PluginSettingsPluginRequestStore:requests:requests_v2',5),(10261,'jira.properties',1,'com.atlassian.upm.atlassian-universal-plugin-manager-plugin:build',5),(10262,'jira.properties',1,'com.atlassian.jira.plugins.jira-workflow-designer:build',5),(10264,'jira.properties',1,'com.atlassian.plugins.atlassian-whitelist-api-plugin:whitelist.enabled',5),(10266,'jira.properties',1,'com.atlassian.plugins.atlassian-whitelist-api-plugin:build',5),(10269,'jira.properties',1,'com.atlassian.jira.plugins.webhooks.jira-webhooks-plugin:build',5),(10280,'jira.properties',1,'dvcs.connector.bitbucket.url',5),(10281,'jira.properties',1,'dvcs.connector.github.url',5),(10284,'jira.properties',1,'AO_E8B6CC_#',5),(10285,'jira.properties',1,'com.atlassian.jira.plugins.jira-bitbucket-connector-plugin:build',5),(10286,'jira.properties',1,'com.atlassian.jira.lookandfeel:isDefaultFavicon',5),(10287,'jira.properties',1,'com.atlassian.jira.lookandfeel:usingCustomFavicon',5),(10288,'jira.properties',1,'com.atlassian.jira.lookandfeel:customDefaultFaviconURL',5),(10289,'jira.properties',1,'com.atlassian.jira.lookandfeel:customDefaultFaviconHiresURL',5),(10290,'jira.properties',1,'com.atlassian.jira.lookandfeel:faviconWidth',5),(10291,'jira.properties',1,'com.atlassian.jira.lookandfeel:faviconHeight',5),(10292,'jira.properties',1,'jira.lf.favicon.url',5),(10293,'jira.properties',1,'jira.lf.favicon.hires.url',5),(10294,'jira.properties',1,'com.atlassian.jira.lookandfeel:build',5),(10296,'jira.properties',1,'com.atlassian.crowd.embedded.admin:build',5),(10297,'jira.properties',1,'com.atlassian.jira.gadgets:build',5),(10298,'jira.properties',1,'com.atlassian.jirawallboard.atlassian-wallboard-plugin:build',5),(10299,'jira.properties',1,'jira-header-plugin.studio-tab-migration-complete',5),(10300,'jira.properties',1,'com.atlassian.upm:notifications:notification-plugin.request',5),(10301,'jira.properties',1,'com.atlassian.upm:notifications:notification-edition.mismatch',5),(10302,'jira.properties',1,'com.atlassian.upm:notifications:notification-evaluation.expired',5),(10303,'jira.properties',1,'com.atlassian.upm:notifications:notification-evaluation.nearlyexpired',5),(10304,'jira.properties',1,'com.atlassian.upm:notifications:notification-maintenance.expired',5),(10305,'jira.properties',1,'com.atlassian.upm:notifications:notification-maintenance.nearlyexpired',5),(10306,'jira.properties',1,'com.atlassian.upm.log.PluginSettingsAuditLogService:log:upm_audit_log_v3',5),(10307,'jira.properties',1,'com.atlassian.activeobjects.admin.ActiveObjectsPluginToTablesMapping',6),(10308,'jira.properties',1,'com.atlassian.upm:notifications:notification-update',6);
/*!40000 ALTER TABLE `propertyentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertynumber`
--

DROP TABLE IF EXISTS `propertynumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propertynumber` (
  `ID` decimal(18,0) NOT NULL,
  `propertyvalue` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertynumber`
--

LOCK TABLES `propertynumber` WRITE;
/*!40000 ALTER TABLE `propertynumber` DISABLE KEYS */;
INSERT INTO `propertynumber` VALUES (9,0),(11,1),(12,0),(15,1),(10201,0),(10208,1),(10209,1),(10211,1),(10212,1),(10218,22),(10223,0),(10225,0),(10226,1),(10227,1),(10228,1),(10230,1);
/*!40000 ALTER TABLE `propertynumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertystring`
--

DROP TABLE IF EXISTS `propertystring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propertystring` (
  `ID` decimal(18,0) NOT NULL,
  `propertyvalue` text COLLATE utf8_bin,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertystring`
--

LOCK TABLES `propertystring` WRITE;
/*!40000 ALTER TABLE `propertystring` DISABLE KEYS */;
INSERT INTO `propertystring` VALUES (1,'6328'),(3,'10011'),(5,'10122'),(6,'10123'),(7,'10000'),(8,'1'),(13,'6.3'),(14,'6.2.6'),(10100,'english-moderate-stemming'),(10101,'BBDI-TFHA-HKCQ-6EZ1'),(10102,'10300'),(10103,'10316'),(10200,'4'),(10202,''),(10203,'1415870263940'),(10204,'UTF-8'),(10205,'Your Company JIRA'),(10206,'http://localhost:8080'),(10207,'public'),(10210,'./data/attachments'),(10213,'true'),(10214,'./export'),(10216,'enterprise'),(10217,'K6D+CU7rSAaFIKfN+Bil+Rzd1J4UXUs2DWKDQRA6K08='),(10220,'1'),(10221,'2'),(10224,'true'),(10229,'show'),(10231,'1'),(10232,'1'),(10233,'1'),(10235,'2'),(10237,'2'),(10238,'false'),(10239,'1'),(10241,'2001'),(10242,'1'),(10243,'1'),(10247,'#java.util.List\n'),(10249,'#java.util.List\n'),(10251,'#java.util.List\n'),(10252,'#java.util.List\n'),(10254,'#java.util.List\n'),(10255,'#java.util.List\n'),(10256,'#java.util.List\n'),(10257,'#java.util.List\n'),(10258,'#java.util.List\n'),(10261,'4'),(10262,'1'),(10264,'true'),(10266,'4'),(10269,'2'),(10280,'https://bitbucket.org'),(10281,'https://github.com'),(10284,'13'),(10285,'2'),(10286,'false'),(10287,'false'),(10288,'/favicon.ico'),(10289,'/images/64jira.png'),(10290,'64'),(10291,'64'),(10292,'/favicon.ico'),(10293,'/images/64jira.png'),(10294,'1'),(10296,'3'),(10297,'1'),(10298,'6086'),(10299,'migrated'),(10300,'#java.util.List\n'),(10301,'#java.util.List\n'),(10302,'#java.util.List\n'),(10303,'#java.util.List\n'),(10304,'#java.util.List\n'),(10305,'#java.util.List\n'),(10306,'#java.util.List\n{\"userKey\":\"JIRA\",\"date\":1415870573672,\"i18nKey\":\"upm.auditLog.upm.startup\",\"entryType\":\"UPM_STARTUP\",\"params\":[]}');
/*!40000 ALTER TABLE `propertystring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertytext`
--

DROP TABLE IF EXISTS `propertytext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propertytext` (
  `ID` decimal(18,0) NOT NULL,
  `propertyvalue` longtext COLLATE utf8_bin,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertytext`
--

LOCK TABLES `propertytext` WRITE;
/*!40000 ALTER TABLE `propertytext` DISABLE KEYS */;
INSERT INTO `propertytext` VALUES (10,'http://www.atlassian.com/*\n'),(21,'{\n    \"edgeMap\": {\n        \"1DEDB66F-FE5C-EDFD-54D0-4D19CDC8CECA\": {\n            \"actionId\": 5,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1806.5,\n                    \"y\": 434.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1801.0,\n                    \"y\": 115.0\n                }\n            ],\n            \"controlPoints\": [],\n            \"endNodeId\": \"6DA64EEB-08FE-2870-C90C-4D19CDA2F72D\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1801.0,\n                \"y\": 115.0\n            },\n            \"endStepId\": 4,\n            \"id\": \"1DEDB66F-FE5C-EDFD-54D0-4D19CDC8CECA\",\n            \"label\": \"Resolve Issue\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1776.85,\n                \"y\": 355.25\n            },\n            \"lineType\": \"straight\",\n            \"startNodeId\": \"A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1806.5,\n                \"y\": 434.0\n            },\n            \"startStepId\": 5\n        },\n        \"3DF7CEC8-9FBC-C0D0-AFB1-4D19CE6EA230\": {\n            \"actionId\": 2,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1469.5,\n                    \"y\": 113.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1614.0,\n                    \"y\": 226.0\n                }\n            ],\n            \"controlPoints\": [],\n            \"endNodeId\": \"1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1614.0,\n                \"y\": 226.0\n            },\n            \"endStepId\": 6,\n            \"id\": \"3DF7CEC8-9FBC-C0D0-AFB1-4D19CE6EA230\",\n            \"label\": \"Close Issue\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1492.25,\n                \"y\": 154.25\n            },\n            \"lineType\": \"straight\",\n            \"startNodeId\": \"778534F4-7595-88B6-45E1-4D19CD518712\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1469.5,\n                \"y\": 113.0\n            },\n            \"startStepId\": 1\n        },\n        \"483797F1-1BF4-5E0F-86C6-4D19CE6023A2\": {\n            \"actionId\": 5,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1469.5,\n                    \"y\": 113.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1763.0,\n                    \"y\": 113.0\n                }\n            ],\n            \"controlPoints\": [],\n            \"endNodeId\": \"6DA64EEB-08FE-2870-C90C-4D19CDA2F72D\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1763.0,\n                \"y\": 113.0\n            },\n            \"endStepId\": 4,\n            \"id\": \"483797F1-1BF4-5E0F-86C6-4D19CE6023A2\",\n            \"label\": \"Resolve Issue\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1551.0,\n                \"y\": 104.0\n            },\n            \"lineType\": \"straight\",\n            \"startNodeId\": \"778534F4-7595-88B6-45E1-4D19CD518712\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1469.5,\n                \"y\": 113.0\n            },\n            \"startStepId\": 1\n        },\n        \"517D7F32-20FB-309E-8639-4D19CE2ACB54\": {\n            \"actionId\": 5,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1434.0,\n                    \"y\": 435.0\n                },\n                {\n                    \"positiveController\": {\n                        \"positiveController\": null,\n                        \"x\": 0.0,\n                        \"y\": 0.0\n                    },\n                    \"x\": 1435.0,\n                    \"y\": 490.0\n                },\n                {\n                    \"positiveController\": {\n                        \"positiveController\": null,\n                        \"x\": 0.0,\n                        \"y\": 0.0\n                    },\n                    \"x\": 1947.0,\n                    \"y\": 494.0\n                },\n                {\n                    \"positiveController\": {\n                        \"positiveController\": null,\n                        \"x\": 0.0,\n                        \"y\": 0.0\n                    },\n                    \"x\": 1950.0,\n                    \"y\": 118.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1763.0,\n                    \"y\": 113.0\n                }\n            ],\n            \"controlPoints\": [\n                {\n                    \"positiveController\": {\n                        \"positiveController\": null,\n                        \"x\": 0.0,\n                        \"y\": 0.0\n                    },\n                    \"x\": 1435.0,\n                    \"y\": 490.0\n                },\n                {\n                    \"positiveController\": {\n                        \"positiveController\": null,\n                        \"x\": 0.0,\n                        \"y\": 0.0\n                    },\n                    \"x\": 1947.0,\n                    \"y\": 494.0\n                },\n                {\n                    \"positiveController\": {\n                        \"positiveController\": null,\n                        \"x\": 0.0,\n                        \"y\": 0.0\n                    },\n                    \"x\": 1950.0,\n                    \"y\": 118.0\n                }\n            ],\n            \"endNodeId\": \"6DA64EEB-08FE-2870-C90C-4D19CDA2F72D\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1763.0,\n                \"y\": 113.0\n            },\n            \"endStepId\": 4,\n            \"id\": \"517D7F32-20FB-309E-8639-4D19CE2ACB54\",\n            \"label\": \"Resolve Issue\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1631.25,\n                \"y\": 479.5\n            },\n            \"lineType\": \"poly\",\n            \"startNodeId\": \"0740FFFA-2AA1-C90A-38ED-4D19CD61899B\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1434.0,\n                \"y\": 435.0\n            },\n            \"startStepId\": 3\n        },\n        \"58BD4605-5FB9-84EA-6952-4D19CE7B454B\": {\n            \"actionId\": 1,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1470.0,\n                    \"y\": 16.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1469.5,\n                    \"y\": 113.0\n                }\n            ],\n            \"controlPoints\": [],\n            \"endNodeId\": \"778534F4-7595-88B6-45E1-4D19CD518712\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1469.5,\n                \"y\": 113.0\n            },\n            \"endStepId\": 1,\n            \"id\": \"58BD4605-5FB9-84EA-6952-4D19CE7B454B\",\n            \"label\": \"Create Issue\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1475.5,\n                \"y\": 48.5\n            },\n            \"lineType\": \"straight\",\n            \"startNodeId\": \"15174530-AE75-04E0-1D9D-4D19CD200835\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1470.0,\n                \"y\": 16.0\n            },\n            \"startStepId\": 1\n        },\n        \"92D3DEFD-13AC-06A7-E5D8-4D19CE537791\": {\n            \"actionId\": 4,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1439.5,\n                    \"y\": 116.0\n                },\n                {\n                    \"positiveController\": {\n                        \"positiveController\": null,\n                        \"x\": 0.0,\n                        \"y\": 0.0\n                    },\n                    \"x\": 1393.0,\n                    \"y\": 116.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1390.0,\n                    \"y\": 434.0\n                }\n            ],\n            \"controlPoints\": [\n                {\n                    \"positiveController\": {\n                        \"positiveController\": null,\n                        \"x\": 0.0,\n                        \"y\": 0.0\n                    },\n                    \"x\": 1393.0,\n                    \"y\": 116.0\n                }\n            ],\n            \"endNodeId\": \"0740FFFA-2AA1-C90A-38ED-4D19CD61899B\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1390.0,\n                \"y\": 434.0\n            },\n            \"endStepId\": 3,\n            \"id\": \"92D3DEFD-13AC-06A7-E5D8-4D19CE537791\",\n            \"label\": \"Start Progress\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1323.65,\n                \"y\": 193.75\n            },\n            \"lineType\": \"poly\",\n            \"startNodeId\": \"778534F4-7595-88B6-45E1-4D19CD518712\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1439.5,\n                \"y\": 116.0\n            },\n            \"startStepId\": 1\n        },\n        \"C049EE11-C5BB-F93B-36C3-4D19CDF12B8F\": {\n            \"actionId\": 3,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1677.0,\n                    \"y\": 227.0\n                },\n                {\n                    \"positiveController\": {\n                        \"positiveController\": null,\n                        \"x\": 0.0,\n                        \"y\": 0.0\n                    },\n                    \"x\": 1767.05,\n                    \"y\": 230.05\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1773.5,\n                    \"y\": 425.0\n                }\n            ],\n            \"controlPoints\": [\n                {\n                    \"positiveController\": {\n                        \"positiveController\": null,\n                        \"x\": 0.0,\n                        \"y\": 0.0\n                    },\n                    \"x\": 1767.05,\n                    \"y\": 230.05\n                }\n            ],\n            \"endNodeId\": \"A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1773.5,\n                \"y\": 425.0\n            },\n            \"endStepId\": 5,\n            \"id\": \"C049EE11-C5BB-F93B-36C3-4D19CDF12B8F\",\n            \"label\": \"Reopen Issue\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1703.85,\n                \"y\": 218.5\n            },\n            \"lineType\": \"poly\",\n            \"startNodeId\": \"1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1677.0,\n                \"y\": 227.0\n            },\n            \"startStepId\": 6\n        },\n        \"C9EA1792-2332-8B56-A04D-4D19CD725367\": {\n            \"actionId\": 301,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1465.0,\n                    \"y\": 436.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1469.5,\n                    \"y\": 113.0\n                }\n            ],\n            \"controlPoints\": [],\n            \"endNodeId\": \"778534F4-7595-88B6-45E1-4D19CD518712\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1469.5,\n                \"y\": 113.0\n            },\n            \"endStepId\": 1,\n            \"id\": \"C9EA1792-2332-8B56-A04D-4D19CD725367\",\n            \"label\": \"Stop Progress\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1407.8,\n                \"y\": 308.5\n            },\n            \"lineType\": \"straight\",\n            \"startNodeId\": \"0740FFFA-2AA1-C90A-38ED-4D19CD61899B\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1465.0,\n                \"y\": 436.0\n            },\n            \"startStepId\": 3\n        },\n        \"CAF37138-6321-E03A-8E41-4D19CDD7DC78\": {\n            \"actionId\": 2,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1764.5,\n                    \"y\": 430.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1614.0,\n                    \"y\": 226.0\n                }\n            ],\n            \"controlPoints\": [],\n            \"endNodeId\": \"1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1614.0,\n                \"y\": 226.0\n            },\n            \"endStepId\": 6,\n            \"id\": \"CAF37138-6321-E03A-8E41-4D19CDD7DC78\",\n            \"label\": \"Close Issue\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1677.65,\n                \"y\": 365.0\n            },\n            \"lineType\": \"straight\",\n            \"startNodeId\": \"A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1764.5,\n                \"y\": 430.0\n            },\n            \"startStepId\": 5\n        },\n        \"E1F8462A-8B0A-87EA-4F70-4D19CE423C83\": {\n            \"actionId\": 2,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1488.0,\n                    \"y\": 430.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1614.0,\n                    \"y\": 226.0\n                }\n            ],\n            \"controlPoints\": [],\n            \"endNodeId\": \"1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1614.0,\n                \"y\": 226.0\n            },\n            \"endStepId\": 6,\n            \"id\": \"E1F8462A-8B0A-87EA-4F70-4D19CE423C83\",\n            \"label\": \"Close Issue\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1492.0,\n                \"y\": 345.0\n            },\n            \"lineType\": \"straight\",\n            \"startNodeId\": \"0740FFFA-2AA1-C90A-38ED-4D19CD61899B\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1488.0,\n                \"y\": 430.0\n            },\n            \"startStepId\": 3\n        },\n        \"E27D8EB8-8E49-430B-8FCB-4D19CE127171\": {\n            \"actionId\": 3,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1840.0,\n                    \"y\": 130.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1846.5,\n                    \"y\": 428.0\n                }\n            ],\n            \"controlPoints\": [],\n            \"endNodeId\": \"A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1846.5,\n                \"y\": 428.0\n            },\n            \"endStepId\": 5,\n            \"id\": \"E27D8EB8-8E49-430B-8FCB-4D19CE127171\",\n            \"label\": \"Reopen Issue\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1814.05,\n                \"y\": 169.5\n            },\n            \"lineType\": \"straight\",\n            \"startNodeId\": \"6DA64EEB-08FE-2870-C90C-4D19CDA2F72D\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1840.0,\n                \"y\": 130.0\n            },\n            \"startStepId\": 4\n        },\n        \"F79E742D-A9E4-0124-D7D4-4D19CDE48C9C\": {\n            \"actionId\": 4,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1806.5,\n                    \"y\": 434.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1434.0,\n                    \"y\": 435.0\n                }\n            ],\n            \"controlPoints\": [],\n            \"endNodeId\": \"0740FFFA-2AA1-C90A-38ED-4D19CD61899B\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1434.0,\n                \"y\": 435.0\n            },\n            \"endStepId\": 3,\n            \"id\": \"F79E742D-A9E4-0124-D7D4-4D19CDE48C9C\",\n            \"label\": \"Start Progress\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1607.25,\n                \"y\": 423.5\n            },\n            \"lineType\": \"straight\",\n            \"startNodeId\": \"A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1806.5,\n                \"y\": 434.0\n            },\n            \"startStepId\": 5\n        },\n        \"FD6BA267-475B-70B3-8AA4-4D19CE00BCD1\": {\n            \"actionId\": 701,\n            \"allPoints\": [\n                {\n                    \"positiveController\": null,\n                    \"x\": 1763.0,\n                    \"y\": 113.0\n                },\n                {\n                    \"positiveController\": null,\n                    \"x\": 1614.0,\n                    \"y\": 226.0\n                }\n            ],\n            \"controlPoints\": [],\n            \"endNodeId\": \"1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34\",\n            \"endPoint\": {\n                \"positiveController\": null,\n                \"x\": 1614.0,\n                \"y\": 226.0\n            },\n            \"endStepId\": 6,\n            \"id\": \"FD6BA267-475B-70B3-8AA4-4D19CE00BCD1\",\n            \"label\": \"Close Issue\",\n            \"labelPoint\": {\n                \"positiveController\": null,\n                \"x\": 1635.75,\n                \"y\": 152.25\n            },\n            \"lineType\": \"straight\",\n            \"startNodeId\": \"6DA64EEB-08FE-2870-C90C-4D19CDA2F72D\",\n            \"startPoint\": {\n                \"positiveController\": null,\n                \"x\": 1763.0,\n                \"y\": 113.0\n            },\n            \"startStepId\": 4\n        }\n    },\n    \"nodeMap\": {\n        \"0740FFFA-2AA1-C90A-38ED-4D19CD61899B\": {\n            \"id\": \"0740FFFA-2AA1-C90A-38ED-4D19CD61899B\",\n            \"inLinkIds\": [\n                \"F79E742D-A9E4-0124-D7D4-4D19CDE48C9C\",\n                \"92D3DEFD-13AC-06A7-E5D8-4D19CE537791\"\n            ],\n            \"isInitialAction\": false,\n            \"label\": \"In Progress\",\n            \"outLinkIds\": [\n                \"C9EA1792-2332-8B56-A04D-4D19CD725367\",\n                \"517D7F32-20FB-309E-8639-4D19CE2ACB54\",\n                \"E1F8462A-8B0A-87EA-4F70-4D19CE423C83\"\n            ],\n            \"rect\": {\n                \"height\": 45.0,\n                \"positiveController\": null,\n                \"width\": 146.0,\n                \"x\": 1373.0,\n                \"y\": 419.0\n            },\n            \"stepId\": 3\n        },\n        \"15174530-AE75-04E0-1D9D-4D19CD200835\": {\n            \"id\": \"15174530-AE75-04E0-1D9D-4D19CD200835\",\n            \"inLinkIds\": [],\n            \"isInitialAction\": true,\n            \"label\": \"Create Issue\",\n            \"outLinkIds\": [\n                \"58BD4605-5FB9-84EA-6952-4D19CE7B454B\"\n            ],\n            \"rect\": {\n                \"height\": 45.0,\n                \"positiveController\": null,\n                \"width\": 157.0,\n                \"x\": 1405.0,\n                \"y\": 0.0\n            },\n            \"stepId\": 1\n        },\n        \"1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34\": {\n            \"id\": \"1C846CFB-4F0D-2F40-D0AE-4D19CDAF5D34\",\n            \"inLinkIds\": [\n                \"CAF37138-6321-E03A-8E41-4D19CDD7DC78\",\n                \"E1F8462A-8B0A-87EA-4F70-4D19CE423C83\",\n                \"FD6BA267-475B-70B3-8AA4-4D19CE00BCD1\",\n                \"3DF7CEC8-9FBC-C0D0-AFB1-4D19CE6EA230\"\n            ],\n            \"isInitialAction\": false,\n            \"label\": \"Closed\",\n            \"outLinkIds\": [\n                \"C049EE11-C5BB-F93B-36C3-4D19CDF12B8F\"\n            ],\n            \"rect\": {\n                \"height\": 45.0,\n                \"positiveController\": null,\n                \"width\": 120.0,\n                \"x\": 1569.0,\n                \"y\": 210.0\n            },\n            \"stepId\": 6\n        },\n        \"6DA64EEB-08FE-2870-C90C-4D19CDA2F72D\": {\n            \"id\": \"6DA64EEB-08FE-2870-C90C-4D19CDA2F72D\",\n            \"inLinkIds\": [\n                \"517D7F32-20FB-309E-8639-4D19CE2ACB54\",\n                \"1DEDB66F-FE5C-EDFD-54D0-4D19CDC8CECA\",\n                \"483797F1-1BF4-5E0F-86C6-4D19CE6023A2\"\n            ],\n            \"isInitialAction\": false,\n            \"label\": \"Resolved\",\n            \"outLinkIds\": [\n                \"FD6BA267-475B-70B3-8AA4-4D19CE00BCD1\",\n                \"E27D8EB8-8E49-430B-8FCB-4D19CE127171\"\n            ],\n            \"rect\": {\n                \"height\": 44.0,\n                \"positiveController\": null,\n                \"width\": 137.0,\n                \"x\": 1709.0,\n                \"y\": 97.0\n            },\n            \"stepId\": 4\n        },\n        \"778534F4-7595-88B6-45E1-4D19CD518712\": {\n            \"id\": \"778534F4-7595-88B6-45E1-4D19CD518712\",\n            \"inLinkIds\": [\n                \"C9EA1792-2332-8B56-A04D-4D19CD725367\",\n                \"58BD4605-5FB9-84EA-6952-4D19CE7B454B\"\n            ],\n            \"isInitialAction\": false,\n            \"label\": \"Open\",\n            \"outLinkIds\": [\n                \"92D3DEFD-13AC-06A7-E5D8-4D19CE537791\",\n                \"483797F1-1BF4-5E0F-86C6-4D19CE6023A2\",\n                \"3DF7CEC8-9FBC-C0D0-AFB1-4D19CE6EA230\"\n            ],\n            \"rect\": {\n                \"height\": 45.0,\n                \"positiveController\": null,\n                \"width\": 106.0,\n                \"x\": 1429.5,\n                \"y\": 97.0\n            },\n            \"stepId\": 1\n        },\n        \"A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB\": {\n            \"id\": \"A8B1A431-AC3A-6DCD-BFF0-4D19CDBCAADB\",\n            \"inLinkIds\": [\n                \"E27D8EB8-8E49-430B-8FCB-4D19CE127171\",\n                \"C049EE11-C5BB-F93B-36C3-4D19CDF12B8F\"\n            ],\n            \"isInitialAction\": false,\n            \"label\": \"Reopened\",\n            \"outLinkIds\": [\n                \"1DEDB66F-FE5C-EDFD-54D0-4D19CDC8CECA\",\n                \"CAF37138-6321-E03A-8E41-4D19CDD7DC78\",\n                \"F79E742D-A9E4-0124-D7D4-4D19CDE48C9C\"\n            ],\n            \"rect\": {\n                \"height\": 45.0,\n                \"positiveController\": null,\n                \"width\": 142.0,\n                \"x\": 1749.5,\n                \"y\": 418.0\n            },\n            \"stepId\": 5\n        }\n    },\n    \"rootIds\": [\n        \"15174530-AE75-04E0-1D9D-4D19CD200835\"\n    ],\n    \"width\": 1136\n}\n'),(10215,'AAABgw0ODAoPeNp1kkFPwkAQhe/9FZt4LmmrYiTpAegiIAKBgoZ42W4HWF12m9kW5d9bC41tg9e3b958M7M3AxRknEniuMT1Oo7X8dqELkPiOa5rRewQad2aCA7KAI1FKrTy6TSki/litKTWVpg9nKB0hKcE/EGu0RO8d0gAR5A6AbS41EfAmq1fSDXXNDtEgLPtygAa/97iWm1bjKfiCH6KGVjzDPmeGQhYCr7nuq7ttG3nwarkTtkB/ICu6WQ2p4vyhX4nAk9F2fx2WM5VjV4C5jijwO89PYb222p9Zz9vNkO757iv1odAVoMfjxZdQlUKmKAwjVl/qWuT5oLMQPErvnLkvsxMnjbVMRjfaSy+SOkV0n9Nq4RX7sQx4yKS9UP1L2It6IWJvINiOW1jaRz1V9wIyJVa9eU1X+NKfSr9pawZ7pgShhVE3VQyYwRTf0DVG/QRCl/zvOfOVWf576paAIajSIpGIZiUyDMM2Wokicx2QpG4JDXnjVXrL3+0Kv0AGd4bNDAsAhRW+KkhTg9ACxaro+gIxxowDSCtIgIUIWzKR3uE3+3rtlKrTA0zc/5vUtw=X02iq'),(10307,'{\"AO_E8B6CC_ISSUE_TO_CHANGESET\":{\"key\":\"com.atlassian.jira.plugins.jira-bitbucket-connector-plugin\",\"name\":\"JIRA DVCS Connector Plugin\",\"version\":\"2.1.15\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_E8B6CC_MESSAGE_TAG\":{\"key\":\"com.atlassian.jira.plugins.jira-bitbucket-connector-plugin\",\"name\":\"JIRA DVCS Connector Plugin\",\"version\":\"2.1.15\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_563AEE_ACTIVITY_ENTITY\":{\"key\":\"com.atlassian.streams.streams-thirdparty-plugin\",\"name\":\"Streams Third Party Provider Plugin\",\"version\":\"5.4.1\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_21D670_WHITELIST_RULES\":{\"key\":\"com.atlassian.plugins.atlassian-whitelist-api-plugin\",\"name\":\"Atlassian Whitelist API Plugin\",\"version\":\"1.7\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_4AEACD_WEBHOOK_DAO\":{\"key\":\"com.atlassian.jira.plugins.webhooks.jira-webhooks-plugin\",\"name\":\"JIRA WebHooks Plugin\",\"version\":\"1.2.6\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_E8B6CC_SYNC_EVENT\":{\"key\":\"com.atlassian.jira.plugins.jira-bitbucket-connector-plugin\",\"name\":\"JIRA DVCS Connector Plugin\",\"version\":\"2.1.15\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_E8B6CC_BRANCH_HEAD_MAPPING\":{\"key\":\"com.atlassian.jira.plugins.jira-bitbucket-connector-plugin\",\"name\":\"JIRA DVCS Connector Plugin\",\"version\":\"2.1.15\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_563AEE_OBJECT_ENTITY\":{\"key\":\"com.atlassian.streams.streams-thirdparty-plugin\",\"name\":\"Streams Third Party Provider Plugin\",\"version\":\"5.4.1\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_563AEE_ACTOR_ENTITY\":{\"key\":\"com.atlassian.streams.streams-thirdparty-plugin\",\"name\":\"Streams Third Party Provider Plugin\",\"version\":\"5.4.1\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_E8B6CC_BRANCH\":{\"key\":\"com.atlassian.jira.plugins.jira-bitbucket-connector-plugin\",\"name\":\"JIRA DVCS Connector Plugin\",\"version\":\"2.1.15\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_E8B6CC_PR_PARTICIPANT\":{\"key\":\"com.atlassian.jira.plugins.jira-bitbucket-connector-plugin\",\"name\":\"JIRA DVCS Connector Plugin\",\"version\":\"2.1.15\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_E8B6CC_SYNC_AUDIT_LOG\":{\"key\":\"com.atlassian.jira.plugins.jira-bitbucket-connector-plugin\",\"name\":\"JIRA DVCS Connector Plugin\",\"version\":\"2.1.15\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_E8B6CC_MESSAGE\":{\"key\":\"com.atlassian.jira.plugins.jira-bitbucket-connector-plugin\",\"name\":\"JIRA DVCS Connector Plugin\",\"version\":\"2.1.15\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_E8B6CC_REPOSITORY_MAPPING\":{\"key\":\"com.atlassian.jira.plugins.jira-bitbucket-connector-plugin\",\"name\":\"JIRA DVCS Connector Plugin\",\"version\":\"2.1.15\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_E8B6CC_PULL_REQUEST\":{\"key\":\"com.atlassian.jira.plugins.jira-bitbucket-connector-plugin\",\"name\":\"JIRA DVCS Connector Plugin\",\"version\":\"2.1.15\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_E8B6CC_MESSAGE_QUEUE_ITEM\":{\"key\":\"com.atlassian.jira.plugins.jira-bitbucket-connector-plugin\",\"name\":\"JIRA DVCS Connector Plugin\",\"version\":\"2.1.15\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_E8B6CC_PR_ISSUE_KEY\":{\"key\":\"com.atlassian.jira.plugins.jira-bitbucket-connector-plugin\",\"name\":\"JIRA DVCS Connector Plugin\",\"version\":\"2.1.15\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_B9A0F0_APPLIED_TEMPLATE\":{\"key\":\"com.atlassian.jira.project-templates-plugin\",\"name\":\"Project Templates Plugin\",\"version\":\"2.41\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_E8B6CC_GIT_HUB_EVENT\":{\"key\":\"com.atlassian.jira.plugins.jira-bitbucket-connector-plugin\",\"name\":\"JIRA DVCS Connector Plugin\",\"version\":\"2.1.15\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_E8B6CC_REPO_TO_CHANGESET\":{\"key\":\"com.atlassian.jira.plugins.jira-bitbucket-connector-plugin\",\"name\":\"JIRA DVCS Connector Plugin\",\"version\":\"2.1.15\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_563AEE_TARGET_ENTITY\":{\"key\":\"com.atlassian.streams.streams-thirdparty-plugin\",\"name\":\"Streams Third Party Provider Plugin\",\"version\":\"5.4.1\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_563AEE_MEDIA_LINK_ENTITY\":{\"key\":\"com.atlassian.streams.streams-thirdparty-plugin\",\"name\":\"Streams Third Party Provider Plugin\",\"version\":\"5.4.1\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_E8B6CC_ISSUE_TO_BRANCH\":{\"key\":\"com.atlassian.jira.plugins.jira-bitbucket-connector-plugin\",\"name\":\"JIRA DVCS Connector Plugin\",\"version\":\"2.1.15\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_E8B6CC_ORGANIZATION_MAPPING\":{\"key\":\"com.atlassian.jira.plugins.jira-bitbucket-connector-plugin\",\"name\":\"JIRA DVCS Connector Plugin\",\"version\":\"2.1.15\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_E8B6CC_PR_TO_COMMIT\":{\"key\":\"com.atlassian.jira.plugins.jira-bitbucket-connector-plugin\",\"name\":\"JIRA DVCS Connector Plugin\",\"version\":\"2.1.15\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_E8B6CC_COMMIT\":{\"key\":\"com.atlassian.jira.plugins.jira-bitbucket-connector-plugin\",\"name\":\"JIRA DVCS Connector Plugin\",\"version\":\"2.1.15\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_563AEE_ACTIVITY_OBJ_ENTITY\":{\"key\":\"com.atlassian.streams.streams-thirdparty-plugin\",\"name\":\"Streams Third Party Provider Plugin\",\"version\":\"5.4.1\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"},\"AO_E8B6CC_CHANGESET_MAPPING\":{\"key\":\"com.atlassian.jira.plugins.jira-bitbucket-connector-plugin\",\"name\":\"JIRA DVCS Connector Plugin\",\"version\":\"2.1.15\",\"vendorName\":\"Atlassian\",\"vendorUrl\":\"http://www.atlassian.com/\"}}'),(10308,'#java.util.List\ncom.atlassian.jira.plugins.jira-importers-bitbucket-plugin\ncom.atlassian.labs.hipchat.hipchat-for-jira-plugin\ncom.atlassian.jira.plugins.jira-importers-github-plugin\ncom.atlassian.jira.plugins.jira-importers-plugin\ncom.atlassian.jira.extra.jira-ical-feed\ncom.atlassian.jira.plugins.jira-importers-redmine-plugin');
/*!40000 ALTER TABLE `propertytext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_calendars` (
  `ID` decimal(18,0) DEFAULT NULL,
  `CALENDAR_NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `CALENDAR` text COLLATE utf8_bin,
  PRIMARY KEY (`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_cron_triggers` (
  `ID` decimal(18,0) NOT NULL,
  `trigger_id` decimal(18,0) DEFAULT NULL,
  `cronExperssion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_fired_triggers` (
  `ID` decimal(18,0) DEFAULT NULL,
  `ENTRY_ID` varchar(255) COLLATE utf8_bin NOT NULL,
  `trigger_id` decimal(18,0) DEFAULT NULL,
  `TRIGGER_LISTENER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FIRED_TIME` datetime DEFAULT NULL,
  `TRIGGER_STATE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_job_details` (
  `ID` decimal(18,0) NOT NULL,
  `JOB_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `JOB_GROUP` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLASS_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_DURABLE` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `IS_STATEFUL` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `JOB_DATA` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_listeners`
--

DROP TABLE IF EXISTS `qrtz_job_listeners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_job_listeners` (
  `ID` decimal(18,0) NOT NULL,
  `JOB` decimal(18,0) DEFAULT NULL,
  `JOB_LISTENER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_listeners`
--

LOCK TABLES `qrtz_job_listeners` WRITE;
/*!40000 ALTER TABLE `qrtz_job_listeners` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_listeners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simple_triggers` (
  `ID` decimal(18,0) NOT NULL,
  `trigger_id` decimal(18,0) DEFAULT NULL,
  `REPEAT_COUNT` decimal(9,0) DEFAULT NULL,
  `REPEAT_INTERVAL` decimal(18,0) DEFAULT NULL,
  `TIMES_TRIGGERED` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_trigger_listeners`
--

DROP TABLE IF EXISTS `qrtz_trigger_listeners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_trigger_listeners` (
  `ID` decimal(18,0) NOT NULL,
  `trigger_id` decimal(18,0) DEFAULT NULL,
  `TRIGGER_LISTENER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_trigger_listeners`
--

LOCK TABLES `qrtz_trigger_listeners` WRITE;
/*!40000 ALTER TABLE `qrtz_trigger_listeners` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_trigger_listeners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_triggers` (
  `ID` decimal(18,0) NOT NULL,
  `TRIGGER_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TRIGGER_GROUP` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `JOB` decimal(18,0) DEFAULT NULL,
  `NEXT_FIRE` datetime DEFAULT NULL,
  `TRIGGER_STATE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TRIGGER_TYPE` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `CALENDAR_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MISFIRE_INSTR` decimal(9,0) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remembermetoken`
--

DROP TABLE IF EXISTS `remembermetoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remembermetoken` (
  `ID` decimal(18,0) NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `TOKEN` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USERNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `remembermetoken_username_index` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remembermetoken`
--

LOCK TABLES `remembermetoken` WRITE;
/*!40000 ALTER TABLE `remembermetoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `remembermetoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remotelink`
--

DROP TABLE IF EXISTS `remotelink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remotelink` (
  `ID` decimal(18,0) NOT NULL,
  `ISSUEID` decimal(18,0) DEFAULT NULL,
  `GLOBALID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUMMARY` text COLLATE utf8_bin,
  `URL` text COLLATE utf8_bin,
  `ICONURL` text COLLATE utf8_bin,
  `ICONTITLE` text COLLATE utf8_bin,
  `RELATIONSHIP` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESOLVED` char(1) COLLATE utf8_bin DEFAULT NULL,
  `STATUSNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `STATUSDESCRIPTION` text COLLATE utf8_bin,
  `STATUSICONURL` text COLLATE utf8_bin,
  `STATUSICONTITLE` text COLLATE utf8_bin,
  `STATUSICONLINK` text COLLATE utf8_bin,
  `STATUSCATEGORYKEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `STATUSCATEGORYCOLORNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `APPLICATIONTYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `APPLICATIONNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `remotelink_issueid` (`ISSUEID`,`GLOBALID`),
  KEY `remotelink_globalid` (`GLOBALID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remotelink`
--

LOCK TABLES `remotelink` WRITE;
/*!40000 ALTER TABLE `remotelink` DISABLE KEYS */;
/*!40000 ALTER TABLE `remotelink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replicatedindexoperation`
--

DROP TABLE IF EXISTS `replicatedindexoperation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replicatedindexoperation` (
  `ID` decimal(18,0) NOT NULL,
  `INDEX_TIME` datetime DEFAULT NULL,
  `NODE_ID` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `AFFECTED_INDEX` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `ENTITY_TYPE` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `AFFECTED_IDS` longtext COLLATE utf8_bin,
  `OPERATION` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `node_operation_idx` (`NODE_ID`,`AFFECTED_INDEX`,`OPERATION`,`INDEX_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replicatedindexoperation`
--

LOCK TABLES `replicatedindexoperation` WRITE;
/*!40000 ALTER TABLE `replicatedindexoperation` DISABLE KEYS */;
/*!40000 ALTER TABLE `replicatedindexoperation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resolution`
--

DROP TABLE IF EXISTS `resolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resolution` (
  `ID` varchar(60) COLLATE utf8_bin NOT NULL,
  `SEQUENCE` decimal(18,0) DEFAULT NULL,
  `pname` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  `ICONURL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resolution`
--

LOCK TABLES `resolution` WRITE;
/*!40000 ALTER TABLE `resolution` DISABLE KEYS */;
INSERT INTO `resolution` VALUES ('1',1,'Fixed','A fix for this issue is checked into the tree and tested.',NULL),('2',2,'Won\'t Fix','The problem described is an issue which will never be fixed.',NULL),('3',3,'Duplicate','The problem is a duplicate of an existing issue.',NULL),('4',4,'Incomplete','The problem is not completely described.',NULL),('5',5,'Cannot Reproduce','All attempts at reproducing this issue failed, or not enough information was available to reproduce the issue. Reading the code produces no clues as to why this behavior would occur. If more information appears later, please reopen the issue.',NULL);
/*!40000 ALTER TABLE `resolution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rundetails`
--

DROP TABLE IF EXISTS `rundetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rundetails` (
  `ID` decimal(18,0) NOT NULL,
  `JOB_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `RUN_DURATION` decimal(18,0) DEFAULT NULL,
  `RUN_OUTCOME` char(1) COLLATE utf8_bin DEFAULT NULL,
  `INFO_MESSAGE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `rundetails_jobid_idx` (`JOB_ID`),
  KEY `rundetails_starttime_idx` (`START_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rundetails`
--

LOCK TABLES `rundetails` WRITE;
/*!40000 ALTER TABLE `rundetails` DISABLE KEYS */;
INSERT INTO `rundetails` VALUES (10001,'com.atlassian.jira.service.JiraService:10002','2014-11-13 20:17:43',9,'S',''),(10002,'com.atlassian.jira.service.JiraService:10001','2014-11-13 20:17:43',800,'S',''),(10008,'CompatibilityPluginScheduler.JobId.RemotePluginLicenseNotificationJob-job','2014-11-13 20:22:53',22,'S',''),(10009,'CompatibilityPluginScheduler.JobId.PluginRequestCheckJob-job','2014-11-13 20:22:53',17,'S',''),(10010,'CompatibilityPluginScheduler.JobId.LocalPluginLicenseNotificationJob-job','2014-11-13 20:22:53',63,'S',''),(10048,'com.atlassian.jira.service.JiraService:10000','2014-11-13 20:41:18',2,'S',''),(10049,'JiraPluginScheduler:com.atlassian.jira.plugin.ext.bamboo.service.PlanStatusUpdateServiceImpl:job','2014-11-13 20:41:53',3,'S','');
/*!40000 ALTER TABLE `rundetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schemeissuesecurities`
--

DROP TABLE IF EXISTS `schemeissuesecurities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schemeissuesecurities` (
  `ID` decimal(18,0) NOT NULL,
  `SCHEME` decimal(18,0) DEFAULT NULL,
  `SECURITY` decimal(18,0) DEFAULT NULL,
  `sec_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sec_parameter` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `sec_scheme` (`SCHEME`),
  KEY `sec_security` (`SECURITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schemeissuesecurities`
--

LOCK TABLES `schemeissuesecurities` WRITE;
/*!40000 ALTER TABLE `schemeissuesecurities` DISABLE KEYS */;
/*!40000 ALTER TABLE `schemeissuesecurities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schemeissuesecuritylevels`
--

DROP TABLE IF EXISTS `schemeissuesecuritylevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schemeissuesecuritylevels` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  `SCHEME` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schemeissuesecuritylevels`
--

LOCK TABLES `schemeissuesecuritylevels` WRITE;
/*!40000 ALTER TABLE `schemeissuesecuritylevels` DISABLE KEYS */;
/*!40000 ALTER TABLE `schemeissuesecuritylevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schemepermissions`
--

DROP TABLE IF EXISTS `schemepermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schemepermissions` (
  `ID` decimal(18,0) NOT NULL,
  `SCHEME` decimal(18,0) DEFAULT NULL,
  `PERMISSION` decimal(18,0) DEFAULT NULL,
  `perm_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `perm_parameter` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PERMISSION_KEY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `prmssn_scheme` (`SCHEME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schemepermissions`
--

LOCK TABLES `schemepermissions` WRITE;
/*!40000 ALTER TABLE `schemepermissions` DISABLE KEYS */;
INSERT INTO `schemepermissions` VALUES (10000,NULL,0,'group','jira-administrators',NULL),(10001,NULL,1,'group','jira-users',NULL),(10002,NULL,27,'group','jira-developers',NULL),(10003,NULL,24,'group','jira-developers',NULL),(10004,0,23,'projectrole','10002','ADMINISTER_PROJECTS'),(10005,0,10,'projectrole','10000','BROWSE_PROJECTS'),(10006,0,11,'projectrole','10000','CREATE_ISSUES'),(10007,0,15,'projectrole','10000','ADD_COMMENTS'),(10008,0,19,'projectrole','10000','CREATE_ATTACHMENTS'),(10009,0,13,'projectrole','10001','ASSIGN_ISSUES'),(10010,0,17,'projectrole','10001','ASSIGNABLE_USER'),(10011,0,14,'projectrole','10001','RESOLVE_ISSUES'),(10012,0,21,'projectrole','10000','LINK_ISSUES'),(10013,0,12,'projectrole','10001','EDIT_ISSUES'),(10014,0,16,'projectrole','10002','DELETE_ISSUES'),(10015,0,18,'projectrole','10001','CLOSE_ISSUES'),(10016,0,25,'projectrole','10001','MOVE_ISSUES'),(10017,0,28,'projectrole','10001','SCHEDULE_ISSUES'),(10018,0,30,'projectrole','10002','MODIFY_REPORTER'),(10019,0,20,'projectrole','10001','WORK_ON_ISSUES'),(10020,0,43,'projectrole','10002','DELETE_ALL_WORKLOGS'),(10021,0,42,'projectrole','10000','DELETE_OWN_WORKLOGS'),(10022,0,41,'projectrole','10001','EDIT_ALL_WORKLOGS'),(10023,0,40,'projectrole','10000','EDIT_OWN_WORKLOGS'),(10024,0,31,'projectrole','10001','VIEW_VOTERS_AND_WATCHERS'),(10025,0,32,'projectrole','10002','MANAGE_WATCHERS'),(10026,0,34,'projectrole','10001','EDIT_ALL_COMMENTS'),(10027,0,35,'projectrole','10000','EDIT_OWN_COMMENTS'),(10028,0,36,'projectrole','10002','DELETE_ALL_COMMENTS'),(10029,0,37,'projectrole','10000','DELETE_OWN_COMMENTS'),(10030,0,38,'projectrole','10002','DELETE_ALL_ATTACHMENTS'),(10031,0,39,'projectrole','10000','DELETE_OWN_ATTACHMENTS'),(10032,NULL,22,'group','jira-users',NULL),(10033,0,29,'projectrole','10001','VIEW_DEV_TOOLS'),(10100,NULL,33,'group','jira-users',NULL),(10101,NULL,44,'group','jira-administrators',NULL),(10200,0,45,'projectrole','10000','VIEW_READONLY_WORKFLOW'),(10300,0,46,'projectrole','10001','TRANSITION_ISSUES');
/*!40000 ALTER TABLE `schemepermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchrequest`
--

DROP TABLE IF EXISTS `searchrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchrequest` (
  `ID` decimal(18,0) NOT NULL,
  `filtername` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `authorname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `groupname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `projectid` decimal(18,0) DEFAULT NULL,
  `reqcontent` longtext COLLATE utf8_bin,
  `FAV_COUNT` decimal(18,0) DEFAULT NULL,
  `filtername_lower` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `sr_author` (`authorname`),
  KEY `searchrequest_filternameLower` (`filtername_lower`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchrequest`
--

LOCK TABLES `searchrequest` WRITE;
/*!40000 ALTER TABLE `searchrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `searchrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serviceconfig`
--

DROP TABLE IF EXISTS `serviceconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serviceconfig` (
  `ID` decimal(18,0) NOT NULL,
  `delaytime` decimal(18,0) DEFAULT NULL,
  `CLAZZ` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `servicename` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviceconfig`
--

LOCK TABLES `serviceconfig` WRITE;
/*!40000 ALTER TABLE `serviceconfig` DISABLE KEYS */;
INSERT INTO `serviceconfig` VALUES (10000,60000,'com.atlassian.jira.service.services.mail.MailQueueService','Mail Queue Service'),(10001,43200000,'com.atlassian.jira.service.services.export.ExportService','Backup Service'),(10002,86400000,'com.atlassian.jira.service.services.auditing.AuditLogCleaningService','Audit log cleaning service');
/*!40000 ALTER TABLE `serviceconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sharepermissions`
--

DROP TABLE IF EXISTS `sharepermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sharepermissions` (
  `ID` decimal(18,0) NOT NULL,
  `entityid` decimal(18,0) DEFAULT NULL,
  `entitytype` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `sharetype` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `PARAM1` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARAM2` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `share_index` (`entityid`,`entitytype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sharepermissions`
--

LOCK TABLES `sharepermissions` WRITE;
/*!40000 ALTER TABLE `sharepermissions` DISABLE KEYS */;
INSERT INTO `sharepermissions` VALUES (10000,10000,'PortalPage','global',NULL,NULL);
/*!40000 ALTER TABLE `sharepermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackback_ping`
--

DROP TABLE IF EXISTS `trackback_ping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackback_ping` (
  `ID` decimal(18,0) NOT NULL,
  `ISSUE` decimal(18,0) DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BLOGNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCERPT` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackback_ping`
--

LOCK TABLES `trackback_ping` WRITE;
/*!40000 ALTER TABLE `trackback_ping` DISABLE KEYS */;
/*!40000 ALTER TABLE `trackback_ping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trustedapp`
--

DROP TABLE IF EXISTS `trustedapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trustedapp` (
  `ID` decimal(18,0) NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PUBLIC_KEY` text COLLATE utf8_bin,
  `IP_MATCH` text COLLATE utf8_bin,
  `URL_MATCH` text COLLATE utf8_bin,
  `TIMEOUT` decimal(18,0) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CREATED_BY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `trustedapp_id` (`APPLICATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trustedapp`
--

LOCK TABLES `trustedapp` WRITE;
/*!40000 ALTER TABLE `trustedapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `trustedapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upgradehistory`
--

DROP TABLE IF EXISTS `upgradehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upgradehistory` (
  `ID` decimal(18,0) DEFAULT NULL,
  `UPGRADECLASS` varchar(255) COLLATE utf8_bin NOT NULL,
  `TARGETBUILD` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`UPGRADECLASS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upgradehistory`
--

LOCK TABLES `upgradehistory` WRITE;
/*!40000 ALTER TABLE `upgradehistory` DISABLE KEYS */;
INSERT INTO `upgradehistory` VALUES (10000,'com.atlassian.jira.upgrade.tasks.UpgradeTask_Build6322','6328'),(10001,'com.atlassian.jira.upgrade.tasks.UpgradeTask_Build6323','6328'),(10002,'com.atlassian.jira.upgrade.tasks.UpgradeTask_Build6325','6328'),(10003,'com.atlassian.jira.upgrade.tasks.UpgradeTask_Build6326','6328'),(10004,'com.atlassian.jira.upgrade.tasks.UpgradeTask_Build6327','6328'),(10005,'com.atlassian.jira.upgrade.tasks.UpgradeTask_Build6328','6328');
/*!40000 ALTER TABLE `upgradehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upgradeversionhistory`
--

DROP TABLE IF EXISTS `upgradeversionhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upgradeversionhistory` (
  `ID` decimal(18,0) DEFAULT NULL,
  `TIMEPERFORMED` datetime DEFAULT NULL,
  `TARGETBUILD` varchar(255) COLLATE utf8_bin NOT NULL,
  `TARGETVERSION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`TARGETBUILD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upgradeversionhistory`
--

LOCK TABLES `upgradeversionhistory` WRITE;
/*!40000 ALTER TABLE `upgradeversionhistory` DISABLE KEYS */;
INSERT INTO `upgradeversionhistory` VALUES (10000,'2014-11-13 20:17:43','6328','6.3');
/*!40000 ALTER TABLE `upgradeversionhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userassociation`
--

DROP TABLE IF EXISTS `userassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userassociation` (
  `SOURCE_NAME` varchar(60) COLLATE utf8_bin NOT NULL,
  `SINK_NODE_ID` decimal(18,0) NOT NULL,
  `SINK_NODE_ENTITY` varchar(60) COLLATE utf8_bin NOT NULL,
  `ASSOCIATION_TYPE` varchar(60) COLLATE utf8_bin NOT NULL,
  `SEQUENCE` decimal(9,0) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  PRIMARY KEY (`SOURCE_NAME`,`SINK_NODE_ID`,`SINK_NODE_ENTITY`,`ASSOCIATION_TYPE`),
  KEY `user_source` (`SOURCE_NAME`),
  KEY `user_sink` (`SINK_NODE_ID`,`SINK_NODE_ENTITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userassociation`
--

LOCK TABLES `userassociation` WRITE;
/*!40000 ALTER TABLE `userassociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `userassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userbase`
--

DROP TABLE IF EXISTS `userbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userbase` (
  `ID` decimal(18,0) NOT NULL,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_HASH` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `osuser_name` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userbase`
--

LOCK TABLES `userbase` WRITE;
/*!40000 ALTER TABLE `userbase` DISABLE KEYS */;
/*!40000 ALTER TABLE `userbase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userhistoryitem`
--

DROP TABLE IF EXISTS `userhistoryitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userhistoryitem` (
  `ID` decimal(18,0) NOT NULL,
  `entitytype` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `entityid` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `USERNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lastviewed` decimal(18,0) DEFAULT NULL,
  `data` longtext COLLATE utf8_bin,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uh_type_user_entity` (`entitytype`,`USERNAME`,`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userhistoryitem`
--

LOCK TABLES `userhistoryitem` WRITE;
/*!40000 ALTER TABLE `userhistoryitem` DISABLE KEYS */;
INSERT INTO `userhistoryitem` VALUES (10000,'Dashboard','10000','admin',1415870573910,NULL);
/*!40000 ALTER TABLE `userhistoryitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpickerfilter`
--

DROP TABLE IF EXISTS `userpickerfilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpickerfilter` (
  `ID` decimal(18,0) NOT NULL,
  `CUSTOMFIELD` decimal(18,0) DEFAULT NULL,
  `CUSTOMFIELDCONFIG` decimal(18,0) DEFAULT NULL,
  `enabled` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `upf_customfield` (`CUSTOMFIELD`),
  KEY `upf_fieldconfigid` (`CUSTOMFIELDCONFIG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpickerfilter`
--

LOCK TABLES `userpickerfilter` WRITE;
/*!40000 ALTER TABLE `userpickerfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpickerfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpickerfiltergroup`
--

DROP TABLE IF EXISTS `userpickerfiltergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpickerfiltergroup` (
  `ID` decimal(18,0) NOT NULL,
  `USERPICKERFILTER` decimal(18,0) DEFAULT NULL,
  `groupname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `cf_userpickerfiltergroup` (`USERPICKERFILTER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpickerfiltergroup`
--

LOCK TABLES `userpickerfiltergroup` WRITE;
/*!40000 ALTER TABLE `userpickerfiltergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpickerfiltergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpickerfilterrole`
--

DROP TABLE IF EXISTS `userpickerfilterrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpickerfilterrole` (
  `ID` decimal(18,0) NOT NULL,
  `USERPICKERFILTER` decimal(18,0) DEFAULT NULL,
  `PROJECTROLEID` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `cf_userpickerfilterrole` (`USERPICKERFILTER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpickerfilterrole`
--

LOCK TABLES `userpickerfilterrole` WRITE;
/*!40000 ALTER TABLE `userpickerfilterrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpickerfilterrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versioncontrol`
--

DROP TABLE IF EXISTS `versioncontrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versioncontrol` (
  `ID` decimal(18,0) NOT NULL,
  `vcsname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `vcsdescription` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `vcstype` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versioncontrol`
--

LOCK TABLES `versioncontrol` WRITE;
/*!40000 ALTER TABLE `versioncontrol` DISABLE KEYS */;
/*!40000 ALTER TABLE `versioncontrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votehistory`
--

DROP TABLE IF EXISTS `votehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votehistory` (
  `ID` decimal(18,0) NOT NULL,
  `issueid` decimal(18,0) DEFAULT NULL,
  `VOTES` decimal(18,0) DEFAULT NULL,
  `TIMESTAMP` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `votehistory_issue_index` (`issueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votehistory`
--

LOCK TABLES `votehistory` WRITE;
/*!40000 ALTER TABLE `votehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `votehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowscheme`
--

DROP TABLE IF EXISTS `workflowscheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowscheme` (
  `ID` decimal(18,0) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowscheme`
--

LOCK TABLES `workflowscheme` WRITE;
/*!40000 ALTER TABLE `workflowscheme` DISABLE KEYS */;
INSERT INTO `workflowscheme` VALUES (10000,'classic','classic');
/*!40000 ALTER TABLE `workflowscheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowschemeentity`
--

DROP TABLE IF EXISTS `workflowschemeentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowschemeentity` (
  `ID` decimal(18,0) NOT NULL,
  `SCHEME` decimal(18,0) DEFAULT NULL,
  `WORKFLOW` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `issuetype` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `workflow_scheme` (`SCHEME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowschemeentity`
--

LOCK TABLES `workflowschemeentity` WRITE;
/*!40000 ALTER TABLE `workflowschemeentity` DISABLE KEYS */;
INSERT INTO `workflowschemeentity` VALUES (10000,10000,'classic default workflow','0');
/*!40000 ALTER TABLE `workflowschemeentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worklog`
--

DROP TABLE IF EXISTS `worklog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worklog` (
  `ID` decimal(18,0) NOT NULL,
  `issueid` decimal(18,0) DEFAULT NULL,
  `AUTHOR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `grouplevel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `rolelevel` decimal(18,0) DEFAULT NULL,
  `worklogbody` longtext COLLATE utf8_bin,
  `CREATED` datetime DEFAULT NULL,
  `UPDATEAUTHOR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `UPDATED` datetime DEFAULT NULL,
  `STARTDATE` datetime DEFAULT NULL,
  `timeworked` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `worklog_issue` (`issueid`),
  KEY `worklog_author` (`AUTHOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worklog`
--

LOCK TABLES `worklog` WRITE;
/*!40000 ALTER TABLE `worklog` DISABLE KEYS */;
/*!40000 ALTER TABLE `worklog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-13 21:08:49
