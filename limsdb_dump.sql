-- MySQL dump 10.13  Distrib 5.7.24, for osx11.1 (x86_64)
--
-- Host: localhost    Database: limsdb
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add analysis file type',7,'add_analysisfiletype'),(26,'Can change analysis file type',7,'change_analysisfiletype'),(27,'Can delete analysis file type',7,'delete_analysisfiletype'),(28,'Can view analysis file type',7,'view_analysisfiletype'),(29,'Can add analysis output type',8,'add_analysisoutputtype'),(30,'Can change analysis output type',8,'change_analysisoutputtype'),(31,'Can delete analysis output type',8,'delete_analysisoutputtype'),(32,'Can view analysis output type',8,'view_analysisoutputtype'),(33,'Can add analysis type',9,'add_analysistype'),(34,'Can change analysis type',9,'change_analysistype'),(35,'Can delete analysis type',9,'delete_analysistype'),(36,'Can view analysis type',9,'view_analysistype'),(37,'Can add barcode',10,'add_barcode'),(38,'Can change barcode',10,'change_barcode'),(39,'Can delete barcode',10,'delete_barcode'),(40,'Can view barcode',10,'view_barcode'),(41,'Can add bardex',11,'add_bardex'),(42,'Can change bardex',11,'change_bardex'),(43,'Can delete bardex',11,'delete_bardex'),(44,'Can view bardex',11,'view_bardex'),(45,'Can add downstream analysis type',12,'add_downstreamanalysistype'),(46,'Can change downstream analysis type',12,'change_downstreamanalysistype'),(47,'Can delete downstream analysis type',12,'delete_downstreamanalysistype'),(48,'Can view downstream analysis type',12,'view_downstreamanalysistype'),(49,'Can add gemstone',13,'add_gemstone'),(50,'Can change gemstone',13,'change_gemstone'),(51,'Can delete gemstone',13,'delete_gemstone'),(52,'Can view gemstone',13,'view_gemstone'),(53,'Can add instrument type',14,'add_instrumenttype'),(54,'Can change instrument type',14,'change_instrumenttype'),(55,'Can delete instrument type',14,'delete_instrumenttype'),(56,'Can view instrument type',14,'view_instrumenttype'),(57,'Can add library type',15,'add_librarytype'),(58,'Can change library type',15,'change_librarytype'),(59,'Can delete library type',15,'delete_librarytype'),(60,'Can view library type',15,'view_librarytype'),(61,'Can add organism',16,'add_organism'),(62,'Can change organism',16,'change_organism'),(63,'Can delete organism',16,'delete_organism'),(64,'Can view organism',16,'view_organism'),(65,'Can add pool',17,'add_pool'),(66,'Can change pool',17,'change_pool'),(67,'Can delete pool',17,'delete_pool'),(68,'Can view pool',17,'view_pool'),(69,'Can add protocol',18,'add_protocol'),(70,'Can change protocol',18,'change_protocol'),(71,'Can delete protocol',18,'delete_protocol'),(72,'Can view protocol',18,'view_protocol'),(73,'Can add sample type',19,'add_sampletype'),(74,'Can change sample type',19,'change_sampletype'),(75,'Can delete sample type',19,'delete_sampletype'),(76,'Can view sample type',19,'view_sampletype'),(77,'Can add sequence type',20,'add_sequencetype'),(78,'Can change sequence type',20,'change_sequencetype'),(79,'Can delete sequence type',20,'delete_sequencetype'),(80,'Can view sequence type',20,'view_sequencetype'),(81,'Can add specimen source',21,'add_specimensource'),(82,'Can change specimen source',21,'change_specimensource'),(83,'Can delete specimen source',21,'delete_specimensource'),(84,'Can view specimen source',21,'view_specimensource'),(85,'Can add flowcell',22,'add_flowcell'),(86,'Can change flowcell',22,'change_flowcell'),(87,'Can delete flowcell',22,'delete_flowcell'),(88,'Can view flowcell',22,'view_flowcell'),(89,'Can add analyses',23,'add_analyses'),(90,'Can change analyses',23,'change_analyses'),(91,'Can delete analyses',23,'delete_analyses'),(92,'Can view analyses',23,'view_analyses'),(93,'Can add instrument',24,'add_instrument'),(94,'Can change instrument',24,'change_instrument'),(95,'Can delete instrument',24,'delete_instrument'),(96,'Can view instrument',24,'view_instrument'),(97,'Can add lane',25,'add_lane'),(98,'Can change lane',25,'change_lane'),(99,'Can delete lane',25,'delete_lane'),(100,'Can view lane',25,'view_lane'),(101,'Can add library',26,'add_library'),(102,'Can change library',26,'change_library'),(103,'Can delete library',26,'delete_library'),(104,'Can view library',26,'view_library'),(105,'Can add library lane',27,'add_librarylane'),(106,'Can change library lane',27,'change_librarylane'),(107,'Can delete library lane',27,'delete_librarylane'),(108,'Can view library lane',27,'view_librarylane'),(109,'Can add project',28,'add_project'),(110,'Can change project',28,'change_project'),(111,'Can delete project',28,'delete_project'),(112,'Can view project',28,'view_project'),(113,'Can add reference genome',29,'add_referencegenome'),(114,'Can change reference genome',29,'change_referencegenome'),(115,'Can delete reference genome',29,'delete_referencegenome'),(116,'Can view reference genome',29,'view_referencegenome'),(117,'Can add coordinate set',30,'add_coordinateset'),(118,'Can change coordinate set',30,'change_coordinateset'),(119,'Can delete coordinate set',30,'delete_coordinateset'),(120,'Can view coordinate set',30,'view_coordinateset'),(121,'Can add run',31,'add_run'),(122,'Can change run',31,'change_run'),(123,'Can delete run',31,'delete_run'),(124,'Can view run',31,'view_run'),(125,'Can add sample',32,'add_sample'),(126,'Can change sample',32,'change_sample'),(127,'Can delete sample',32,'delete_sample'),(128,'Can view sample',32,'view_sample'),(129,'Can add downstream analysis',33,'add_downstreamanalysis'),(130,'Can change downstream analysis',33,'change_downstreamanalysis'),(131,'Can delete downstream analysis',33,'delete_downstreamanalysis'),(132,'Can view downstream analysis',33,'view_downstreamanalysis'),(133,'Can add analysis output',34,'add_analysisoutput'),(134,'Can change analysis output',34,'change_analysisoutput'),(135,'Can delete analysis output',34,'delete_analysisoutput'),(136,'Can view analysis output',34,'view_analysisoutput'),(137,'Can add analysis output type downstream file type',35,'add_analysisoutputtypedownstreamfiletype'),(138,'Can change analysis output type downstream file type',35,'change_analysisoutputtypedownstreamfiletype'),(139,'Can delete analysis output type downstream file type',35,'delete_analysisoutputtypedownstreamfiletype'),(140,'Can view analysis output type downstream file type',35,'view_analysisoutputtypedownstreamfiletype'),(141,'Can add downstream analysis file',36,'add_downstreamanalysisfile'),(142,'Can change downstream analysis file',36,'change_downstreamanalysisfile'),(143,'Can delete downstream analysis file',36,'delete_downstreamanalysisfile'),(144,'Can view downstream analysis file',36,'view_downstreamanalysisfile'),(145,'Can add protocol has bardex',37,'add_protocolhasbardex'),(146,'Can change protocol has bardex',37,'change_protocolhasbardex'),(147,'Can delete protocol has bardex',37,'delete_protocolhasbardex'),(148,'Can view protocol has bardex',37,'view_protocolhasbardex');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$8vwAOnig6izPOm7aCtHlda$M//szYrzOPr0NCD1nCSwLl3qsyzuTp8vXSWwhbhkDn4=','2025-05-27 20:26:23.560858',1,'manishkumar','','','mandecent.gupta@gmail.com',1,1,'2025-05-25 17:00:22.899331'),(2,'pbkdf2_sha256$1000000$wIAMxQmT239JsnlgDEULHs$VjZEA9epKKuUl+yUrhjNo1Ymsf5Ggp9iv63J/MCEbvc=','2025-05-27 20:26:34.206306',0,'man4ishg','','','',0,1,'2025-05-26 00:50:40.103581');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_analyses`
--

DROP TABLE IF EXISTS `core_analyses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_analyses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_performed` date DEFAULT NULL,
  `notes` varchar(2048) DEFAULT NULL,
  `software_version` varchar(128) DEFAULT NULL,
  `contaminant_filtered` tinyint(1) DEFAULT NULL,
  `analysis_type_id` bigint DEFAULT NULL,
  `flowcell_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_analyses_analysis_type_id_146c801d_fk_core_analysistype_id` (`analysis_type_id`),
  KEY `core_analyses_flowcell_id_3bd8e54b_fk_core_flowcell_id` (`flowcell_id`),
  CONSTRAINT `core_analyses_analysis_type_id_146c801d_fk_core_analysistype_id` FOREIGN KEY (`analysis_type_id`) REFERENCES `core_analysistype` (`id`),
  CONSTRAINT `core_analyses_flowcell_id_3bd8e54b_fk_core_flowcell_id` FOREIGN KEY (`flowcell_id`) REFERENCES `core_flowcell` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_analyses`
--

LOCK TABLES `core_analyses` WRITE;
/*!40000 ALTER TABLE `core_analyses` DISABLE KEYS */;
INSERT INTO `core_analyses` VALUES (1,'2024-05-25','Initial QC analysis','v2.1.0',1,NULL,1),(2,'2025-04-28','Initial QC pass for flowcell FC_WGS_001','FastQC v0.11.9',NULL,1,2),(3,'2025-05-04','Alignment to mouse genome for flowcell FC_RNA_002','STAR v2.7.9a',NULL,2,3);
/*!40000 ALTER TABLE `core_analyses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_analysisfiletype`
--

DROP TABLE IF EXISTS `core_analysisfiletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_analysisfiletype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(45) NOT NULL,
  `abbrev` varchar(10) NOT NULL,
  `variant` int NOT NULL,
  `description` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_analysisfiletype`
--

LOCK TABLES `core_analysisfiletype` WRITE;
/*!40000 ALTER TABLE `core_analysisfiletype` DISABLE KEYS */;
INSERT INTO `core_analysisfiletype` VALUES (1,'FastQC','FQCR',0,'FastQC report HTML'),(2,'BAM','BAM',0,'Binary Alignment Map'),(3,'VCF','VCF',1,'Variant Call Format');
/*!40000 ALTER TABLE `core_analysisfiletype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_analysisoutput`
--

DROP TABLE IF EXISTS `core_analysisoutput`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_analysisoutput` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_primary` tinyint(1) NOT NULL,
  `analysis_output_type_id` bigint NOT NULL,
  `analysis_id` bigint NOT NULL,
  `sample_id` bigint NOT NULL,
  `sequence_type_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_analysisoutput_analysis_output_type_d9961663_fk_core_anal` (`analysis_output_type_id`),
  KEY `core_analysisoutput_analysis_id_126ec1d4_fk_core_down` (`analysis_id`),
  KEY `core_analysisoutput_sample_id_3b555e1d_fk_core_sample_id` (`sample_id`),
  KEY `core_analysisoutput_sequence_type_id_d6825398_fk_core_sequ` (`sequence_type_id`),
  CONSTRAINT `core_analysisoutput_analysis_id_126ec1d4_fk_core_down` FOREIGN KEY (`analysis_id`) REFERENCES `core_downstreamanalysis` (`id`),
  CONSTRAINT `core_analysisoutput_analysis_output_type_d9961663_fk_core_anal` FOREIGN KEY (`analysis_output_type_id`) REFERENCES `core_analysisoutputtype` (`id`),
  CONSTRAINT `core_analysisoutput_sample_id_3b555e1d_fk_core_sample_id` FOREIGN KEY (`sample_id`) REFERENCES `core_sample` (`id`),
  CONSTRAINT `core_analysisoutput_sequence_type_id_d6825398_fk_core_sequ` FOREIGN KEY (`sequence_type_id`) REFERENCES `core_sequencetype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_analysisoutput`
--

LOCK TABLES `core_analysisoutput` WRITE;
/*!40000 ALTER TABLE `core_analysisoutput` DISABLE KEYS */;
INSERT INTO `core_analysisoutput` VALUES (1,1,1,4,15,2),(2,1,2,5,16,3);
/*!40000 ALTER TABLE `core_analysisoutput` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_analysisoutputtype`
--

DROP TABLE IF EXISTS `core_analysisoutputtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_analysisoutputtype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(45) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_analysisoutputtype`
--

LOCK TABLES `core_analysisoutputtype` WRITE;
/*!40000 ALTER TABLE `core_analysisoutputtype` DISABLE KEYS */;
INSERT INTO `core_analysisoutputtype` VALUES (1,'Report','Summary report of analysis results'),(2,'VCF File','Variant Call Format file');
/*!40000 ALTER TABLE `core_analysisoutputtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_analysisoutputtypedownstreamfiletype`
--

DROP TABLE IF EXISTS `core_analysisoutputtypedownstreamfiletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_analysisoutputtypedownstreamfiletype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `analysis_file_type_id` bigint NOT NULL,
  `analysis_output_type_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_analysisoutputtyped_analysis_output_type_id__863fea7c_uniq` (`analysis_output_type_id`,`analysis_file_type_id`),
  KEY `core_analysisoutputt_analysis_file_type_i_e1ba2c2b_fk_core_anal` (`analysis_file_type_id`),
  CONSTRAINT `core_analysisoutputt_analysis_file_type_i_e1ba2c2b_fk_core_anal` FOREIGN KEY (`analysis_file_type_id`) REFERENCES `core_analysisfiletype` (`id`),
  CONSTRAINT `core_analysisoutputt_analysis_output_type_bac99093_fk_core_anal` FOREIGN KEY (`analysis_output_type_id`) REFERENCES `core_analysisoutputtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_analysisoutputtypedownstreamfiletype`
--

LOCK TABLES `core_analysisoutputtypedownstreamfiletype` WRITE;
/*!40000 ALTER TABLE `core_analysisoutputtypedownstreamfiletype` DISABLE KEYS */;
INSERT INTO `core_analysisoutputtypedownstreamfiletype` VALUES (1,1,1),(2,3,2);
/*!40000 ALTER TABLE `core_analysisoutputtypedownstreamfiletype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_analysistype`
--

DROP TABLE IF EXISTS `core_analysistype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_analysistype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `description` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_analysistype`
--

LOCK TABLES `core_analysistype` WRITE;
/*!40000 ALTER TABLE `core_analysistype` DISABLE KEYS */;
INSERT INTO `core_analysistype` VALUES (1,'Quality Control','Checks raw data quality'),(2,'Alignment','Aligns reads to a reference genome');
/*!40000 ALTER TABLE `core_analysistype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_barcode`
--

DROP TABLE IF EXISTS `core_barcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_barcode` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_barcode`
--

LOCK TABLES `core_barcode` WRITE;
/*!40000 ALTER TABLE `core_barcode` DISABLE KEYS */;
INSERT INTO `core_barcode` VALUES (1),(2);
/*!40000 ALTER TABLE `core_barcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_bardex`
--

DROP TABLE IF EXISTS `core_bardex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_bardex` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `seqtext` varchar(100) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `rc_seqtext` varchar(100) NOT NULL,
  `abbrev_label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_bardex`
--

LOCK TABLES `core_bardex` WRITE;
/*!40000 ALTER TABLE `core_bardex` DISABLE KEYS */;
INSERT INTO `core_bardex` VALUES (1,'Bardex1','ATGC','Some note','GCAT','B1'),(2,'Bardex2','CGTA','Another note','TACG','B2'),(3,'Index_01','ATCGATCG',NULL,'CGATCGAT','IDX01'),(4,'Index_02','GCTAGCTA',NULL,'TAGCTAGC','IDX02');
/*!40000 ALTER TABLE `core_bardex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_coordinateset`
--

DROP TABLE IF EXISTS `core_coordinateset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_coordinateset` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `source_file` varchar(255) DEFAULT NULL,
  `reference_genome_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_coordinateset_reference_genome_id_d1b4b593_fk_core_refe` (`reference_genome_id`),
  CONSTRAINT `core_coordinateset_reference_genome_id_d1b4b593_fk_core_refe` FOREIGN KEY (`reference_genome_id`) REFERENCES `core_referencegenome` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_coordinateset`
--

LOCK TABLES `core_coordinateset` WRITE;
/*!40000 ALTER TABLE `core_coordinateset` DISABLE KEYS */;
INSERT INTO `core_coordinateset` VALUES (1,'GRCh38',NULL,1),(2,'Human_Coordinates_GRCh38','/data/coords/human_grch38.bed',2),(3,'Mouse_Coordinates_GRCm38','/data/coords/mouse_grcm38.bed',3);
/*!40000 ALTER TABLE `core_coordinateset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_downstreamanalysis`
--

DROP TABLE IF EXISTS `core_downstreamanalysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_downstreamanalysis` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `analysis_date` datetime(6) DEFAULT NULL,
  `base_dir` varchar(1024) DEFAULT NULL,
  `description` varchar(4096) DEFAULT NULL,
  `coordinate_set_id` bigint DEFAULT NULL,
  `downstream_analysis_type_id` bigint NOT NULL,
  `reference_genome_id` bigint DEFAULT NULL,
  `sample_id` bigint DEFAULT NULL,
  `sequence_type_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_downstreamanaly_coordinate_set_id_369b4603_fk_core_coor` (`coordinate_set_id`),
  KEY `core_downstreamanaly_downstream_analysis__7eee6d96_fk_core_down` (`downstream_analysis_type_id`),
  KEY `core_downstreamanaly_reference_genome_id_54253f24_fk_core_refe` (`reference_genome_id`),
  KEY `core_downstreamanalysis_sample_id_a78f8cc6_fk_core_sample_id` (`sample_id`),
  KEY `core_downstreamanaly_sequence_type_id_81a903e1_fk_core_sequ` (`sequence_type_id`),
  CONSTRAINT `core_downstreamanaly_coordinate_set_id_369b4603_fk_core_coor` FOREIGN KEY (`coordinate_set_id`) REFERENCES `core_coordinateset` (`id`),
  CONSTRAINT `core_downstreamanaly_downstream_analysis__7eee6d96_fk_core_down` FOREIGN KEY (`downstream_analysis_type_id`) REFERENCES `core_downstreamanalysistype` (`id`),
  CONSTRAINT `core_downstreamanaly_reference_genome_id_54253f24_fk_core_refe` FOREIGN KEY (`reference_genome_id`) REFERENCES `core_referencegenome` (`id`),
  CONSTRAINT `core_downstreamanaly_sequence_type_id_81a903e1_fk_core_sequ` FOREIGN KEY (`sequence_type_id`) REFERENCES `core_sequencetype` (`id`),
  CONSTRAINT `core_downstreamanalysis_sample_id_a78f8cc6_fk_core_sample_id` FOREIGN KEY (`sample_id`) REFERENCES `core_sample` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_downstreamanalysis`
--

LOCK TABLES `core_downstreamanalysis` WRITE;
/*!40000 ALTER TABLE `core_downstreamanalysis` DISABLE KEYS */;
INSERT INTO `core_downstreamanalysis` VALUES (1,'WGS_VarCall_SampleA_v1','2025-05-20 09:00:00.000000','/data/analyses/wgs/sampleA/v1_varcall','First pass variant calling for Sample A (WGS).',1,1,1,NULL,2),(2,'WGS_QC_SampleA_Final','2025-05-22 14:30:00.000000','/data/analyses/wgs/sampleA/qc_report','Final quality control report for Sample A WGS data.',1,2,1,NULL,2),(3,'WGS_VarCall_SampleB_v1','2025-05-23 11:15:00.000000','/data/analyses/wgs/sampleB/v1_varcall','Variant calling for Sample B (WGS), replicate analysis.',1,1,1,NULL,2),(4,'VarCall_PatientA_WGS','2025-05-16 12:10:01.702800','/results/patient_a/varcall','Variant calling pipeline run for Patient A WGS data.',2,1,2,15,2),(5,'ExpQuant_PatientB_RNA','2025-05-18 15:10:01.704290','/results/patient_b/rna_expression','Gene expression quantification for Patient B RNA-Seq data.',2,3,2,16,3);
/*!40000 ALTER TABLE `core_downstreamanalysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_downstreamanalysisfile`
--

DROP TABLE IF EXISTS `core_downstreamanalysisfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_downstreamanalysisfile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file_path` varchar(750) NOT NULL,
  `include_freq` int NOT NULL,
  `description` varchar(2048) DEFAULT NULL,
  `downstream_analysis_id` bigint NOT NULL,
  `downstream_analysis_file_type_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_downstreamanalysisf_file_path_downstream_ana_d68ee4b9_uniq` (`file_path`,`downstream_analysis_id`),
  KEY `core_downstreamanaly_downstream_analysis__fc27580b_fk_core_down` (`downstream_analysis_id`),
  KEY `core_downstreamanaly_downstream_analysis__361e0f08_fk_core_anal` (`downstream_analysis_file_type_id`),
  CONSTRAINT `core_downstreamanaly_downstream_analysis__361e0f08_fk_core_anal` FOREIGN KEY (`downstream_analysis_file_type_id`) REFERENCES `core_analysisfiletype` (`id`),
  CONSTRAINT `core_downstreamanaly_downstream_analysis__fc27580b_fk_core_down` FOREIGN KEY (`downstream_analysis_id`) REFERENCES `core_downstreamanalysis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_downstreamanalysisfile`
--

LOCK TABLES `core_downstreamanalysisfile` WRITE;
/*!40000 ALTER TABLE `core_downstreamanalysisfile` DISABLE KEYS */;
INSERT INTO `core_downstreamanalysisfile` VALUES (1,'/results/patient_a/varcall/variants.vcf',1,'Final filtered VCF for Patient A.',4,3),(2,'/results/patient_b/rna_expression/expression.log',0,'Log file from expression quantification.',5,1);
/*!40000 ALTER TABLE `core_downstreamanalysisfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_downstreamanalysistype`
--

DROP TABLE IF EXISTS `core_downstreamanalysistype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_downstreamanalysistype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(45) NOT NULL,
  `abbrev` varchar(10) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_downstreamanalysistype`
--

LOCK TABLES `core_downstreamanalysistype` WRITE;
/*!40000 ALTER TABLE `core_downstreamanalysistype` DISABLE KEYS */;
INSERT INTO `core_downstreamanalysistype` VALUES (1,'Variant Calling','VAR_CALL','Detects genetic variations',1),(2,'QC Report','QC_RPT','Quality Control metrics report',1),(3,'Gene Expression','GE','Quantification of gene expression',1);
/*!40000 ALTER TABLE `core_downstreamanalysistype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_flowcell`
--

DROP TABLE IF EXISTS `core_flowcell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_flowcell` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `employee_id` int DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `clustering_station_id` int DEFAULT NULL,
  `old_comments` varchar(2048) DEFAULT NULL,
  `is_paired_end` tinyint(1) DEFAULT NULL,
  `failed` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `barcode_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_flowcell_barcode_id_c6da82e9_fk_core_barcode_id` (`barcode_id`),
  CONSTRAINT `core_flowcell_barcode_id_c6da82e9_fk_core_barcode_id` FOREIGN KEY (`barcode_id`) REFERENCES `core_barcode` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_flowcell`
--

LOCK TABLES `core_flowcell` WRITE;
/*!40000 ALTER TABLE `core_flowcell` DISABLE KEYS */;
INSERT INTO `core_flowcell` VALUES (1,'TestFlowcell1',NULL,'2025-05-26',NULL,NULL,NULL,NULL,NULL,NULL),(2,'FC_WGS_001',1,'2025-05-25',NULL,NULL,NULL,NULL,1,NULL),(3,'FC_RNA_002',102,'2025-05-01',NULL,NULL,1,NULL,1,2);
/*!40000 ALTER TABLE `core_flowcell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_gemstone`
--

DROP TABLE IF EXISTS `core_gemstone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_gemstone` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_gemstone`
--

LOCK TABLES `core_gemstone` WRITE;
/*!40000 ALTER TABLE `core_gemstone` DISABLE KEYS */;
INSERT INTO `core_gemstone` VALUES (1,'Emerald'),(2,'Lab Research'),(3,'Clinical Study');
/*!40000 ALTER TABLE `core_gemstone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_instrument`
--

DROP TABLE IF EXISTS `core_instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_instrument` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `instrument_type_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_instrument_instrument_type_id_40098ba8_fk_core_inst` (`instrument_type_id`),
  CONSTRAINT `core_instrument_instrument_type_id_40098ba8_fk_core_inst` FOREIGN KEY (`instrument_type_id`) REFERENCES `core_instrumenttype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_instrument`
--

LOCK TABLES `core_instrument` WRITE;
/*!40000 ALTER TABLE `core_instrument` DISABLE KEYS */;
INSERT INTO `core_instrument` VALUES (1,'NovaSeq 6000',1),(2,'Biomek FXP',2);
/*!40000 ALTER TABLE `core_instrument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_instrumenttype`
--

DROP TABLE IF EXISTS `core_instrumenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_instrumenttype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_instrumenttype`
--

LOCK TABLES `core_instrumenttype` WRITE;
/*!40000 ALTER TABLE `core_instrumenttype` DISABLE KEYS */;
INSERT INTO `core_instrumenttype` VALUES (1,'Sequencer'),(2,'Liquid Handling Robot');
/*!40000 ALTER TABLE `core_instrumenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_lane`
--

DROP TABLE IF EXISTS `core_lane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_lane` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `number` int NOT NULL,
  `is_control` tinyint(1) DEFAULT NULL,
  `is_titer` tinyint(1) DEFAULT NULL,
  `failed` tinyint(1) DEFAULT NULL,
  `flowcell_id` int NOT NULL,
  `pool_id` bigint NOT NULL,
  `sequence_type_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_lane_flowcell_id_2a36a201_fk_core_flowcell_id` (`flowcell_id`),
  KEY `core_lane_pool_id_063bc450_fk_core_pool_id` (`pool_id`),
  KEY `core_lane_sequence_type_id_6d021f4a_fk_core_sequencetype_id` (`sequence_type_id`),
  CONSTRAINT `core_lane_flowcell_id_2a36a201_fk_core_flowcell_id` FOREIGN KEY (`flowcell_id`) REFERENCES `core_flowcell` (`id`),
  CONSTRAINT `core_lane_pool_id_063bc450_fk_core_pool_id` FOREIGN KEY (`pool_id`) REFERENCES `core_pool` (`id`),
  CONSTRAINT `core_lane_sequence_type_id_6d021f4a_fk_core_sequencetype_id` FOREIGN KEY (`sequence_type_id`) REFERENCES `core_sequencetype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_lane`
--

LOCK TABLES `core_lane` WRITE;
/*!40000 ALTER TABLE `core_lane` DISABLE KEYS */;
INSERT INTO `core_lane` VALUES (2,1,0,0,0,2,2,2),(3,1,0,0,0,3,3,3);
/*!40000 ALTER TABLE `core_lane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_library`
--

DROP TABLE IF EXISTS `core_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_library` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `employee_id` int DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `description` longtext,
  `insert_size` int DEFAULT NULL,
  `client_provided` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `bardex_id` bigint NOT NULL,
  `second_bardex_id` bigint DEFAULT NULL,
  `library_type_id` bigint NOT NULL,
  `protocol_id` bigint NOT NULL,
  `sample_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_library_sample_id_5e34f6ec_fk_core_sample_id` (`sample_id`),
  KEY `core_library_bardex_id_3d6dd31c_fk_core_bardex_id` (`bardex_id`),
  KEY `core_library_second_bardex_id_579ddbf7_fk_core_bardex_id` (`second_bardex_id`),
  KEY `core_library_library_type_id_97a831b5_fk_core_librarytype_id` (`library_type_id`),
  KEY `core_library_protocol_id_9c0bf8ee_fk_core_protocol_id` (`protocol_id`),
  CONSTRAINT `core_library_bardex_id_3d6dd31c_fk_core_bardex_id` FOREIGN KEY (`bardex_id`) REFERENCES `core_bardex` (`id`),
  CONSTRAINT `core_library_library_type_id_97a831b5_fk_core_librarytype_id` FOREIGN KEY (`library_type_id`) REFERENCES `core_librarytype` (`id`),
  CONSTRAINT `core_library_protocol_id_9c0bf8ee_fk_core_protocol_id` FOREIGN KEY (`protocol_id`) REFERENCES `core_protocol` (`id`),
  CONSTRAINT `core_library_sample_id_5e34f6ec_fk_core_sample_id` FOREIGN KEY (`sample_id`) REFERENCES `core_sample` (`id`),
  CONSTRAINT `core_library_second_bardex_id_579ddbf7_fk_core_bardex_id` FOREIGN KEY (`second_bardex_id`) REFERENCES `core_bardex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_library`
--

LOCK TABLES `core_library` WRITE;
/*!40000 ALTER TABLE `core_library` DISABLE KEYS */;
INSERT INTO `core_library` VALUES (4,'Lib_WGS_A',101,'2025-05-08','WGS Library for Patient A',350,NULL,1,3,NULL,3,2,15),(5,'Lib_RNA_B',102,'2025-05-14','RNA-Seq Library for Patient B',200,NULL,1,4,3,2,3,16);
/*!40000 ALTER TABLE `core_library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_librarylane`
--

DROP TABLE IF EXISTS `core_librarylane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_librarylane` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `units` varchar(10) NOT NULL,
  `concentration` decimal(10,2) NOT NULL,
  `lane_id` bigint NOT NULL,
  `library_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_librarylane_lane_id_0d87e59e_fk_core_lane_id` (`lane_id`),
  KEY `core_librarylane_library_id_e6f9ed9e_fk_core_library_id` (`library_id`),
  CONSTRAINT `core_librarylane_lane_id_0d87e59e_fk_core_lane_id` FOREIGN KEY (`lane_id`) REFERENCES `core_lane` (`id`),
  CONSTRAINT `core_librarylane_library_id_e6f9ed9e_fk_core_library_id` FOREIGN KEY (`library_id`) REFERENCES `core_library` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_librarylane`
--

LOCK TABLES `core_librarylane` WRITE;
/*!40000 ALTER TABLE `core_librarylane` DISABLE KEYS */;
INSERT INTO `core_librarylane` VALUES (2,'nM',15.00,2,4),(3,'pg/uL',120.00,3,5);
/*!40000 ALTER TABLE `core_librarylane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_librarytype`
--

DROP TABLE IF EXISTS `core_librarytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_librarytype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_librarytype`
--

LOCK TABLES `core_librarytype` WRITE;
/*!40000 ALTER TABLE `core_librarytype` DISABLE KEYS */;
INSERT INTO `core_librarytype` VALUES (1,'Default Library Type'),(2,'RNA-Seq'),(3,'DNA-Seq'),(4,'ChIP-Seq');
/*!40000 ALTER TABLE `core_librarytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_organism`
--

DROP TABLE IF EXISTS `core_organism`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_organism` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_organism`
--

LOCK TABLES `core_organism` WRITE;
/*!40000 ALTER TABLE `core_organism` DISABLE KEYS */;
INSERT INTO `core_organism` VALUES (1,'Human'),(2,'Human'),(3,'Homo sapiens'),(4,'Mus musculus');
/*!40000 ALTER TABLE `core_organism` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_pool`
--

DROP TABLE IF EXISTS `core_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_pool` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `description` varchar(4096) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_pool`
--

LOCK TABLES `core_pool` WRITE;
/*!40000 ALTER TABLE `core_pool` DISABLE KEYS */;
INSERT INTO `core_pool` VALUES (1,'Test Pool',NULL,NULL,1),(2,'WGS_Pool_A','Example pool for WGS lanes','2025-05-25',1),(3,'RNA_Pool_B','Pool for RNA samples from Project B','2025-05-11',1);
/*!40000 ALTER TABLE `core_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_project`
--

DROP TABLE IF EXISTS `core_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_project` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `ftp_url` varchar(50) DEFAULT NULL,
  `ftp_user` varchar(10) DEFAULT NULL,
  `website_url` varchar(50) DEFAULT NULL,
  `website_user` varchar(12) DEFAULT NULL,
  `website_password` varchar(10) DEFAULT NULL,
  `old_comments` longtext,
  `is_current` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `gemstone_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_project_gemstone_id_ce2a070a_fk_core_gemstone_id` (`gemstone_id`),
  CONSTRAINT `core_project_gemstone_id_ce2a070a_fk_core_gemstone_id` FOREIGN KEY (`gemstone_id`) REFERENCES `core_gemstone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_project`
--

LOCK TABLES `core_project` WRITE;
/*!40000 ALTER TABLE `core_project` DISABLE KEYS */;
INSERT INTO `core_project` VALUES (1,'Genome Project',NULL,NULL,NULL,NULL,NULL,NULL,0,1,1),(2,'WGS Study 2025',NULL,NULL,NULL,NULL,NULL,'Whole Genome Sequencing Research Project (Final Setup)',1,1,2),(3,'Cancer Genome Study',NULL,NULL,NULL,NULL,NULL,'Long-term project on somatic mutations in cancer.',1,1,2),(4,'Rare Disease Cohort',NULL,NULL,NULL,NULL,NULL,'Clinical project on undiagnosed genetic disorders.',1,1,3);
/*!40000 ALTER TABLE `core_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_protocol`
--

DROP TABLE IF EXISTS `core_protocol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_protocol` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `description` longtext,
  `is_current` int NOT NULL,
  `adapter_length` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_protocol`
--

LOCK TABLES `core_protocol` WRITE;
/*!40000 ALTER TABLE `core_protocol` DISABLE KEYS */;
INSERT INTO `core_protocol` VALUES (1,'Protocol example','Example description',1,NULL),(2,'WGS Prep v1','Protocol for Whole Genome Sequencing library preparation.',1,60),(3,'RNA-Seq Prep v2','Protocol for RNA Sequencing library preparation.',1,50);
/*!40000 ALTER TABLE `core_protocol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_protocolhasbardex`
--

DROP TABLE IF EXISTS `core_protocolhasbardex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_protocolhasbardex` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bardex_id` bigint NOT NULL,
  `protocol_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_protocolhasbardex_protocol_id_bardex_id_0ea651a8_uniq` (`protocol_id`,`bardex_id`),
  KEY `core_protocolhasbardex_bardex_id_8acc21f5_fk_core_bardex_id` (`bardex_id`),
  CONSTRAINT `core_protocolhasbardex_bardex_id_8acc21f5_fk_core_bardex_id` FOREIGN KEY (`bardex_id`) REFERENCES `core_bardex` (`id`),
  CONSTRAINT `core_protocolhasbardex_protocol_id_7cf2be1f_fk_core_protocol_id` FOREIGN KEY (`protocol_id`) REFERENCES `core_protocol` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_protocolhasbardex`
--

LOCK TABLES `core_protocolhasbardex` WRITE;
/*!40000 ALTER TABLE `core_protocolhasbardex` DISABLE KEYS */;
INSERT INTO `core_protocolhasbardex` VALUES (1,3,2),(2,4,2);
/*!40000 ALTER TABLE `core_protocolhasbardex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_referencegenome`
--

DROP TABLE IF EXISTS `core_referencegenome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_referencegenome` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `notes` longtext,
  `organism_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_referencegenome_organism_id_9e09a9e7_fk_core_organism_id` (`organism_id`),
  CONSTRAINT `core_referencegenome_organism_id_9e09a9e7_fk_core_organism_id` FOREIGN KEY (`organism_id`) REFERENCES `core_organism` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_referencegenome`
--

LOCK TABLES `core_referencegenome` WRITE;
/*!40000 ALTER TABLE `core_referencegenome` DISABLE KEYS */;
INSERT INTO `core_referencegenome` VALUES (1,'Human_Ref','Reference genome for Homo sapiens, version 38.',3),(2,'GRCh38','Human Genome Assembly GRCh38.p13',3),(3,'GRCm38','Mouse Genome Assembly GRCm38',4);
/*!40000 ALTER TABLE `core_referencegenome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_run`
--

DROP TABLE IF EXISTS `core_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_run` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `date_started` date DEFAULT NULL,
  `date_completed` date DEFAULT NULL,
  `cycles` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `notes` varchar(2048) DEFAULT NULL,
  `cycle1_attachment_id` int DEFAULT NULL,
  `read2_cycle1_attachment_id` int DEFAULT NULL,
  `flowcell_id` int NOT NULL,
  `instrument_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_run_flowcell_id_661e1bbf_fk_core_flowcell_id` (`flowcell_id`),
  KEY `core_run_instrument_id_a1208dfa_fk_core_instrument_id` (`instrument_id`),
  CONSTRAINT `core_run_flowcell_id_661e1bbf_fk_core_flowcell_id` FOREIGN KEY (`flowcell_id`) REFERENCES `core_flowcell` (`id`),
  CONSTRAINT `core_run_instrument_id_a1208dfa_fk_core_instrument_id` FOREIGN KEY (`instrument_id`) REFERENCES `core_instrument` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_run`
--

LOCK TABLES `core_run` WRITE;
/*!40000 ALTER TABLE `core_run` DISABLE KEYS */;
INSERT INTO `core_run` VALUES (1,'My First Run on this Flowcell','2025-05-20','2025-05-22',300,101,'This was a test run for documentation purposes.',NULL,NULL,1,NULL),(2,'WGS_Run_1','2025-04-27','2025-04-29',150,101,NULL,NULL,NULL,2,1),(3,'RNA_Run_1','2025-05-02','2025-05-03',75,102,NULL,NULL,NULL,3,1);
/*!40000 ALTER TABLE `core_run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_sample`
--

DROP TABLE IF EXISTS `core_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_sample` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `description` longtext,
  `organism_id` bigint NOT NULL,
  `project_id` bigint NOT NULL,
  `sample_type_id` bigint NOT NULL,
  `specimen_source_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_sample_organism_id_30a8a823_fk_core_organism_id` (`organism_id`),
  KEY `core_sample_project_id_fb41a2db_fk_core_project_id` (`project_id`),
  KEY `core_sample_sample_type_id_1df6fe43_fk_core_sampletype_id` (`sample_type_id`),
  KEY `core_sample_specimen_source_id_c78bb5c8_fk_core_spec` (`specimen_source_id`),
  CONSTRAINT `core_sample_organism_id_30a8a823_fk_core_organism_id` FOREIGN KEY (`organism_id`) REFERENCES `core_organism` (`id`),
  CONSTRAINT `core_sample_project_id_fb41a2db_fk_core_project_id` FOREIGN KEY (`project_id`) REFERENCES `core_project` (`id`),
  CONSTRAINT `core_sample_sample_type_id_1df6fe43_fk_core_sampletype_id` FOREIGN KEY (`sample_type_id`) REFERENCES `core_sampletype` (`id`),
  CONSTRAINT `core_sample_specimen_source_id_c78bb5c8_fk_core_spec` FOREIGN KEY (`specimen_source_id`) REFERENCES `core_specimensource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_sample`
--

LOCK TABLES `core_sample` WRITE;
/*!40000 ALTER TABLE `core_sample` DISABLE KEYS */;
INSERT INTO `core_sample` VALUES (15,'Patient_A_DNA','DNA sample from Patient A, biopsy.',3,3,2,3),(16,'Patient_B_RNA','RNA sample from Patient B, blood draw.',3,4,3,2);
/*!40000 ALTER TABLE `core_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_sampletype`
--

DROP TABLE IF EXISTS `core_sampletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_sampletype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_sampletype`
--

LOCK TABLES `core_sampletype` WRITE;
/*!40000 ALTER TABLE `core_sampletype` DISABLE KEYS */;
INSERT INTO `core_sampletype` VALUES (1,'Blood'),(2,'DNA'),(3,'RNA');
/*!40000 ALTER TABLE `core_sampletype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_sequencetype`
--

DROP TABLE IF EXISTS `core_sequencetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_sequencetype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(45) NOT NULL,
  `abbrev` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_sequencetype`
--

LOCK TABLES `core_sequencetype` WRITE;
/*!40000 ALTER TABLE `core_sequencetype` DISABLE KEYS */;
INSERT INTO `core_sequencetype` VALUES (2,'WGS','WGS',1,'Whole Genome Sequencing'),(3,'RNA-Seq','RNA',1,'RNA Sequencing'),(4,'ChIP-Seq','CHIP',1,'Chromatin Immunoprecipitation Sequencing');
/*!40000 ALTER TABLE `core_sequencetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_specimensource`
--

DROP TABLE IF EXISTS `core_specimensource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_specimensource` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_specimensource`
--

LOCK TABLES `core_specimensource` WRITE;
/*!40000 ALTER TABLE `core_specimensource` DISABLE KEYS */;
INSERT INTO `core_specimensource` VALUES (1,'Arm Vein'),(2,'Blood'),(3,'Tissue'),(4,'Saliva');
/*!40000 ALTER TABLE `core_specimensource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(23,'core','analyses'),(7,'core','analysisfiletype'),(34,'core','analysisoutput'),(8,'core','analysisoutputtype'),(35,'core','analysisoutputtypedownstreamfiletype'),(9,'core','analysistype'),(10,'core','barcode'),(11,'core','bardex'),(30,'core','coordinateset'),(33,'core','downstreamanalysis'),(36,'core','downstreamanalysisfile'),(12,'core','downstreamanalysistype'),(22,'core','flowcell'),(13,'core','gemstone'),(24,'core','instrument'),(14,'core','instrumenttype'),(25,'core','lane'),(26,'core','library'),(27,'core','librarylane'),(15,'core','librarytype'),(16,'core','organism'),(17,'core','pool'),(28,'core','project'),(18,'core','protocol'),(37,'core','protocolhasbardex'),(29,'core','referencegenome'),(31,'core','run'),(32,'core','sample'),(19,'core','sampletype'),(20,'core','sequencetype'),(21,'core','specimensource'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'core','0001_initial','2025-05-25 16:43:17.580545'),(2,'contenttypes','0001_initial','2025-05-25 16:58:00.181046'),(3,'auth','0001_initial','2025-05-25 16:58:00.296633'),(4,'admin','0001_initial','2025-05-25 16:58:00.323648'),(5,'admin','0002_logentry_remove_auto_add','2025-05-25 16:58:00.327337'),(6,'admin','0003_logentry_add_action_flag_choices','2025-05-25 16:58:00.330673'),(7,'contenttypes','0002_remove_content_type_name','2025-05-25 16:58:00.362034'),(8,'auth','0002_alter_permission_name_max_length','2025-05-25 16:58:00.374508'),(9,'auth','0003_alter_user_email_max_length','2025-05-25 16:58:00.383394'),(10,'auth','0004_alter_user_username_opts','2025-05-25 16:58:00.386359'),(11,'auth','0005_alter_user_last_login_null','2025-05-25 16:58:00.397847'),(12,'auth','0006_require_contenttypes_0002','2025-05-25 16:58:00.398251'),(13,'auth','0007_alter_validators_add_error_messages','2025-05-25 16:58:00.401953'),(14,'auth','0008_alter_user_username_max_length','2025-05-25 16:58:00.416828'),(15,'auth','0009_alter_user_last_name_max_length','2025-05-25 16:58:00.431328'),(16,'auth','0010_alter_group_name_max_length','2025-05-25 16:58:00.437373'),(17,'auth','0011_update_proxy_permissions','2025-05-25 16:58:00.446531'),(18,'auth','0012_alter_user_first_name_max_length','2025-05-25 16:58:00.458099'),(19,'sessions','0001_initial','2025-05-25 16:58:00.463920');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('jsh6yci0xhi8fk989eugqluwdc4b86o3','.eJxVjDsOwyAQBe9CHaHlYwMp0_sMaFkgOImwZOwqyt2DJRdJOzPvvZnHfSt-b2n1c2RXJtnllwWkZ6qHiA-s94XTUrd1DvxI-Gkbn5aYXrez_Tso2Epfj4gmgorSREzaOicCwSidGFy24HIGUKSkI7S2R8kQoFYdm8FoQZp9vt1DN3k:1uK0sc:2RfIg6v1QxaP99W1bqrmMnsbyBCjTVbjebqLJX4HYrA','2025-06-10 20:26:34.209380'),('qkxzi85tsy027z5rc08qbl4ar99e83vp','.eJxVjEEOwiAQRe_C2pABaqku3fcMZJgZpGogKe3KeHfbpAvd_vfef6uA65LD2mQOE6urMur0u0Wkp5Qd8APLvWqqZZmnqHdFH7TpsbK8bof7d5Cx5a0eIrBj7LmPTEAXckTeWA8sEc4pWY9mAyDGxMTOd9aCt0nIUMcwkPp8AQ2NOMY:1uJmUX:wZbaeivZMN_2Ctp5D6z-aBPvpKDV-0T1VMbBspfRl2A','2025-06-10 05:04:45.330431'),('u8a2qh6dsoa6acbpy3aq6s3jvka0vhnr','.eJxVjDsOwjAQRO_iGlm28Q9K-pzB2l2vcQA5UpxUiLuTSCmgGmnem3mLBOtS09p5TmMWV6HF6bdDoCe3HeQHtPskaWrLPKLcFXnQLocp8-t2uH8HFXrd1ufiwZMnFRGjLwFIobEmQ1DsHIM25EohiNZdCJEUb6GsCoW9tjqKzxcHgDix:1uJNQk:Ix5-6Byf65-uNqb-3ZC7JxPAMCwzQM6d92DrMyHvPMw','2025-06-09 02:19:10.337710'),('w3jocplhbb1ms9pln1x9mda23if60xt4','.eJxVjEEOwiAQRe_C2pABaqku3fcMZJgZpGogKe3KeHfbpAvd_vfef6uA65LD2mQOE6urMur0u0Wkp5Qd8APLvWqqZZmnqHdFH7TpsbK8bof7d5Cx5a0eIrBj7LmPTEAXckTeWA8sEc4pWY9mAyDGxMTOd9aCt0nIUMcwkPp8AQ2NOMY:1uJdzl:1YCM0m5FEqo6sYOa5uCjgCQIhVsdH7U86JjVyuWO_OA','2025-06-09 20:00:25.939352');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-02 18:42:15
