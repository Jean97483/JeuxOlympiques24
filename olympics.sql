-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: localhost    Database: olympics
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add sport',1,'add_sport'),(2,'Can change sport',1,'change_sport'),(3,'Can delete sport',1,'delete_sport'),(4,'Can view sport',1,'view_sport'),(5,'Can add evenement',2,'add_evenement'),(6,'Can change evenement',2,'change_evenement'),(7,'Can delete evenement',2,'delete_evenement'),(8,'Can view evenement',2,'view_evenement'),(9,'Can add offre',3,'add_offre'),(10,'Can change offre',3,'change_offre'),(11,'Can delete offre',3,'delete_offre'),(12,'Can view offre',3,'view_offre'),(13,'Can add panier',4,'add_panier'),(14,'Can change panier',4,'change_panier'),(15,'Can delete panier',4,'delete_panier'),(16,'Can view panier',4,'view_panier'),(17,'Can add user',5,'add_customuser'),(18,'Can change user',5,'change_customuser'),(19,'Can delete user',5,'delete_customuser'),(20,'Can view user',5,'view_customuser'),(21,'Can add log entry',6,'add_logentry'),(22,'Can change log entry',6,'change_logentry'),(23,'Can delete log entry',6,'delete_logentry'),(24,'Can view log entry',6,'view_logentry'),(25,'Can add permission',7,'add_permission'),(26,'Can change permission',7,'change_permission'),(27,'Can delete permission',7,'delete_permission'),(28,'Can view permission',7,'view_permission'),(29,'Can add group',8,'add_group'),(30,'Can change group',8,'change_group'),(31,'Can delete group',8,'delete_group'),(32,'Can view group',8,'view_group'),(33,'Can add content type',9,'add_contenttype'),(34,'Can change content type',9,'change_contenttype'),(35,'Can delete content type',9,'delete_contenttype'),(36,'Can view content type',9,'view_contenttype'),(37,'Can add session',10,'add_session'),(38,'Can change session',10,'change_session'),(39,'Can delete session',10,'delete_session'),(40,'Can view session',10,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(254) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-05-28 16:45:58.250579','1','Athlétisme',1,'[{\"added\": {}}]',1,1),(2,'2024-05-28 16:46:31.550853','1','2024-08-01',1,'[{\"added\": {}}]',2,1),(3,'2024-05-28 16:46:44.302673','2','2024-08-02',1,'[{\"added\": {}}]',2,1),(4,'2024-05-28 17:20:44.731568','1','Athlétisme',1,'[{\"added\": {}}]',3,1),(5,'2024-05-28 17:23:40.064026','2','Natation',1,'[{\"added\": {}}]',1,1),(6,'2024-05-28 17:23:47.549789','3','Basket-ball',1,'[{\"added\": {}}]',1,1),(7,'2024-05-28 17:23:54.877422','4','Gymnastique',1,'[{\"added\": {}}]',1,1),(8,'2024-05-28 17:26:17.070848','3','2024-08-03',1,'[{\"added\": {}}]',2,1),(9,'2024-05-28 17:26:28.768507','4','2024-08-04',1,'[{\"added\": {}}]',2,1),(10,'2024-05-28 17:26:46.781037','2','Gymnastique',1,'[{\"added\": {}}]',3,1),(11,'2024-05-28 17:27:22.141680','5','2024-08-05',1,'[{\"added\": {}}]',2,1),(12,'2024-05-28 17:27:32.422219','6','2024-08-06',1,'[{\"added\": {}}]',2,1),(13,'2024-05-28 17:27:35.140012','3','Natation',1,'[{\"added\": {}}]',3,1),(14,'2024-05-28 17:28:20.052268','7','2024-08-07',1,'[{\"added\": {}}]',2,1),(15,'2024-05-28 17:28:28.033019','4','Basket-ball',1,'[{\"added\": {}}]',3,1),(16,'2024-05-28 17:43:41.354162','1','Athlétisme',2,'[{\"changed\": {\"fields\": [\"Evenements\"]}}]',3,1),(17,'2024-05-28 19:47:37.694231','5','basket-ball',1,'[{\"added\": {}}]',1,1),(18,'2024-05-28 19:47:39.758045','1','2024-08-01',2,'[{\"changed\": {\"fields\": [\"Sport\"]}}]',2,1),(19,'2024-05-28 19:51:30.250702','4','Basket-ball',2,'[]',3,1),(20,'2024-05-28 20:38:47.838533','1','Athlétisme',2,'[{\"changed\": {\"fields\": [\"Date\"]}}]',3,1),(21,'2024-05-28 21:52:57.289763','1','Athlétisme',2,'[{\"changed\": {\"fields\": [\"Evenements\"]}}]',3,1),(22,'2024-05-28 21:56:24.002220','1','Athlétisme',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,1),(23,'2024-05-28 21:57:01.510710','6','volley',1,'[{\"added\": {}}]',1,1),(24,'2024-05-28 22:40:25.779266','2','Athlétisme - 2024-08-02',2,'[]',2,1),(25,'2024-05-28 22:45:59.264418','1','Athlétisme',2,'[]',3,1),(26,'2024-05-28 22:53:22.809563','1','Athlétisme',2,'[]',3,1),(27,'2024-05-28 22:58:13.249053','6','volley',3,'',1,1),(28,'2024-05-28 22:58:22.114099','5','basket-ball',3,'',1,1),(29,'2024-05-28 22:58:28.714255','3','Basket-ball',2,'[]',1,1),(30,'2024-05-28 22:58:42.939023','7','Badminton',1,'[{\"added\": {}}]',1,1),(31,'2024-05-28 22:59:24.393487','8','Boxe',1,'[{\"added\": {}}]',1,1),(32,'2024-05-28 23:00:12.231473','9','Escalade',1,'[{\"added\": {}}]',1,1),(33,'2024-05-28 23:00:16.344284','10','Judo',1,'[{\"added\": {}}]',1,1),(34,'2024-05-28 23:01:01.527842','11','Escrime',1,'[{\"added\": {}}]',1,1),(35,'2024-05-28 23:02:52.347658','1','Athlétisme',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,1),(36,'2024-05-28 23:03:03.496842','7','Basket-ball - 2024-08-07',3,'',2,1),(37,'2024-05-28 23:03:03.498437','6','Natation - 2024-08-06',3,'',2,1),(38,'2024-05-28 23:03:03.499366','5','Natation - 2024-08-05',3,'',2,1),(39,'2024-05-28 23:03:03.500166','4','Gymnastique - 2024-08-04',3,'',2,1),(40,'2024-05-28 23:03:03.500915','3','Gymnastique - 2024-08-03',3,'',2,1),(41,'2024-05-28 23:03:03.502005','2','Athlétisme - 2024-08-02',3,'',2,1),(42,'2024-05-28 23:06:20.547717','8','Athlétisme - 2024-05-02',1,'[{\"added\": {}}]',2,1),(43,'2024-05-28 23:06:31.558381','5','Athlétisme',1,'[{\"added\": {}}]',3,1),(44,'2024-05-28 23:07:52.467868','5','Athlétisme',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',3,1),(45,'2024-05-28 23:11:38.875605','1','Athlétisme',2,'[{\"changed\": {\"fields\": [\"Date\", \"Evenements\"]}}]',3,1),(46,'2024-05-28 23:12:20.090979','6','Athlétisme',1,'[{\"added\": {}}]',3,1),(47,'2024-05-28 23:14:22.239998','7','Athlétisme-Tour préliminaire, 1er Tour, repêchages',1,'[{\"added\": {}}]',3,1),(48,'2024-05-28 23:46:13.431191','7','Tour préliminaire, 1er Tour, repêchages',2,'[{\"changed\": {\"fields\": [\"Titre\"]}}]',3,1),(49,'2024-05-28 23:46:34.224319','6','1er Tour, qualifications, finale',2,'[{\"changed\": {\"fields\": [\"Titre\", \"Description\"]}}]',3,1),(50,'2024-05-28 23:46:49.162340','5','Tour préliminaire, 1er Tour, qualifications',2,'[{\"changed\": {\"fields\": [\"Titre\", \"Description\"]}}]',3,1),(51,'2024-05-28 23:57:20.199829','8','1er Tour, qualifications',1,'[{\"added\": {}}]',3,1),(52,'2024-05-28 23:58:30.199692','9','1er tour, qualifications, repêchages',1,'[{\"added\": {}}]',3,1),(53,'2024-05-29 00:50:54.044481','10','Demi-finales, finales',1,'[{\"added\": {}}]',3,1),(54,'2024-05-29 00:52:25.265633','11','Demi-finales, finales',1,'[{\"added\": {}}]',3,1),(55,'2024-05-29 07:00:32.540835','1','Admin_django',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',5,1),(56,'2024-05-29 07:22:57.593002','4','Admin_jo',1,'[{\"added\": {}}]',5,1),(57,'2024-05-29 07:23:23.431935','4','Admin_jo',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\", \"User permissions\"]}}]',5,1),(58,'2024-05-29 08:59:27.489084','9','Athlétisme - 2024-05-02 - 1 - Solo',1,'[{\"added\": {}}]',4,1),(59,'2024-05-29 09:00:11.385370','10','Athlétisme - 2024-05-02 - 1 - Duo',1,'[{\"added\": {}}]',4,1),(60,'2024-05-29 09:00:24.509712','11','Athlétisme - 2024-05-02 - 1 - Duo',1,'[{\"added\": {}}]',4,1),(61,'2024-05-29 09:11:51.116056','11','Athlétisme - 2024-05-02 - 1 - Duo',3,'',4,1),(62,'2024-05-29 09:11:51.119013','10','Athlétisme - 2024-05-02 - 1 - Duo',3,'',4,1),(63,'2024-05-29 09:11:51.120912','9','Athlétisme - 2024-05-02 - 1 - Solo',3,'',4,1),(64,'2024-05-29 09:13:31.487622','11','Demi-finales, finales',2,'[{\"changed\": {\"fields\": [\"Prix\"]}}]',3,1),(65,'2024-05-29 10:25:18.696913','12','Athlétisme - 2024-05-02 - 1 - Duo',1,'[{\"added\": {}}]',4,1),(66,'2024-05-29 10:59:47.498820','12','Athlétisme - 2024-05-02 - 1 - Duo',3,'',4,1),(67,'2024-05-29 13:34:25.581604','1','Athlétisme - 2024-05-01',1,'[{\"added\": {}}]',2,1),(68,'2024-05-29 13:34:28.039900','13','Athlétisme - 2024-05-01 - 1 - Solo',1,'[{\"added\": {}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'admin','logentry'),(8,'auth','group'),(7,'auth','permission'),(9,'contenttypes','contenttype'),(2,'offres','evenement'),(3,'offres','offre'),(4,'offres','panier'),(1,'offres','sport'),(10,'sessions','session'),(5,'users','customuser');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-05-28 16:22:45.312354'),(2,'contenttypes','0002_remove_content_type_name','2024-05-28 16:22:45.340591'),(3,'auth','0001_initial','2024-05-28 16:22:45.390080'),(4,'auth','0002_alter_permission_name_max_length','2024-05-28 16:22:45.401508'),(5,'auth','0003_alter_user_email_max_length','2024-05-28 16:22:45.403821'),(6,'auth','0004_alter_user_username_opts','2024-05-28 16:22:45.406479'),(7,'auth','0005_alter_user_last_login_null','2024-05-28 16:22:45.408294'),(8,'auth','0006_require_contenttypes_0002','2024-05-28 16:22:45.408655'),(9,'auth','0007_alter_validators_add_error_messages','2024-05-28 16:22:45.410363'),(10,'auth','0008_alter_user_username_max_length','2024-05-28 16:22:45.412472'),(11,'auth','0009_alter_user_last_name_max_length','2024-05-28 16:22:45.414463'),(12,'auth','0010_alter_group_name_max_length','2024-05-28 16:22:45.418895'),(13,'auth','0011_update_proxy_permissions','2024-05-28 16:22:45.421801'),(14,'auth','0012_alter_user_first_name_max_length','2024-05-28 16:22:45.423798'),(15,'users','0001_initial','2024-05-28 16:22:45.479159'),(16,'admin','0001_initial','2024-05-28 16:22:45.508071'),(17,'admin','0002_logentry_remove_auto_add','2024-05-28 16:22:45.511666'),(18,'admin','0003_logentry_add_action_flag_choices','2024-05-28 16:22:45.514973'),(19,'sessions','0001_initial','2024-05-28 16:22:45.523423'),(20,'offres','0001_initial','2024-05-29 09:08:49.708621');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `django_session` VALUES ('y0re9en68tvdrs92dv4iur6gahan2qix','.eJxVjMsOgjAQRf-la9NAW_pg6Z4vMIYMzIxFTWsKrIz_LiQsdHvPuecteliX2K8zlX5C0YpanH63AcYHpR3gHdItyzGnpUyD3BV50Fl2Gel5Pty_QIQ5bm8C1TDXjYUApA3jSEZ7xUbZJgzOW19phc5zpbFGQHRs0ChlwHoXkLfoC9JERbSX6-cLqMc7-Q:1sCKjs:7p1zrfgILfB2BLWWvdYsEPFwFwf_WFt1MF9oUwYXuZs','2024-06-12 14:57:16.173077');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offres_evenement`
--

DROP TABLE IF EXISTS `offres_evenement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offres_evenement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `sport_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sport_id` (`sport_id`),
  CONSTRAINT `offres_evenement_ibfk_1` FOREIGN KEY (`sport_id`) REFERENCES `offres_sport` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offres_evenement`
--

LOCK TABLES `offres_evenement` WRITE;
/*!40000 ALTER TABLE `offres_evenement` DISABLE KEYS */;
INSERT INTO `offres_evenement` VALUES (1,'2024-05-01',1);
/*!40000 ALTER TABLE `offres_evenement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offres_offre`
--

DROP TABLE IF EXISTS `offres_offre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offres_offre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `sport_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `sport_id` (`sport_id`),
  CONSTRAINT `offres_offre_ibfk_1` FOREIGN KEY (`sport_id`) REFERENCES `offres_sport` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offres_offre`
--

LOCK TABLES `offres_offre` WRITE;
/*!40000 ALTER TABLE `offres_offre` DISABLE KEYS */;
INSERT INTO `offres_offre` VALUES (1,'Athlétisme','billets pour l\'athlétisme : 20 km marche - hommes et femmes','images/Athlétisme_by_freepik_ldO8gkX.jpg',1,'2024-08-01',0.00),(2,'Gymnastique','billets pour la gymnastique','images/Gymnastique_by_freepik.jpg',4,NULL,0.00),(3,'Natation','billets pour la natation','images/Natation_by_freepik.jpg',2,NULL,0.00),(4,'Basket-ball','billets pour le basket-ball','images/Basket_by_freepik.jpg',3,NULL,0.00),(5,'Tour préliminaire, 1er Tour, qualifications','Au programme (soumis à modification) :\r\nFemmes, 100 m, Tour préliminaire\r\nFemmes, 100 m, 1er Tour\r\nHommes, 1 500 ms, 1er Tour\r\nFemmes, Saut en hauteur, Qualifications\r\nHommes, Lancer de marteau, Qualifications\r\nHommes, Décathlon - 100 m\r\nHommes, Décathlon - saut en longueur\r\nHommes, Décathlon - lancer de poids','images/Athlétisme_by_freepik_OKUo2pH.jpg',1,'2024-08-02',0.00),(6,'1er Tour, qualifications, finale','Au programme (soumis à modification) :\r\nFemmes, 5 000 m, 1er Tour\r\nFemmes, 800 m, 1er Tour\r\nMixte, Relais 4 x 400 m, 1er Tour\r\nFemmes, Triple saut, Qualifications\r\nFemmes, Lancer de disque, Qualifications\r\nHommes, Lancer de poids, Qualifications\r\nHommes, Décathlon - saut en hauteur\r\nHommes, Décathlon - 400 m\r\nHommes, 10 000 m, Finale','images/Athlétisme_by_freepik_lHRlxdl.jpg',1,'2024-08-02',0.00),(7,'Tour préliminaire, 1er Tour, repêchages','Au programme (soumis à modification) :\r\nHommes, 100 m, Tour préliminaire\r\nHommes, 100 m, 1er Tour\r\nHommes, Saut à la perche, Qualifications\r\nFemmes, 800 m, Repêchage\r\nHommes, Décathlon - 110 m haies\r\nHommes, Décathlon - lancer de disque\r\nHommes, Décathlon - saut à la perche','images/Athlétisme_by_freepik_JLA3AAJ.jpg',1,'2024-08-03',0.00),(8,'1er Tour, qualifications','Au programme (soumis à modification) :\r\nFemmes, 3 000 m steeple, 1er Tour\r\nFemmes, 200 m, 1er Tour\r\nFemmes, 400 m haies, 1er Tour\r\nHommes, 110 m haies, 1er Tour\r\nFemmes, Lancer de marteau, Qualifications\r\nHommes, Saut en longueur, Qualifications','images/Athlétisme_by_freepik_eKLOGyc.jpg',1,'2024-08-04',0.00),(9,'1er tour, qualifications, repêchages','Au programme (soumis à modification) :\r\nFemmes, 400 m, 1er Tour\r\nHommes, 400 m haies, 1er Tour\r\nFemmes, 200 m, Repêchage\r\nFemmes, 400 m haies, Repêchage\r\nHommes, 400 m, Repêchage\r\nFemmes, Saut à la perche, Qualifications\r\nHommes, Lancer de disque, Qualifications','images/Athlétisme_by_freepik_NYwFbRH.jpg',1,'2024-08-05',0.00),(10,'Demi-finales, finales','Au programme (soumis à modification) :\r\nFemmes, 100 m papillon, Demi-finales\r\nHommes, 400 m nage libre, Finale\r\nFemmes, 400 m nage libre, Finale\r\nHommes, 100 m brasse, Demi-finales\r\nFemmes, Relais 4x100 m nage libre, Finale\r\nHommes, Relais 4x100 m nage libre, Finale','images/Natation_by_freepik_wcxs5aX.jpg',2,'2024-07-27',0.00),(11,'Demi-finales, finales','Au programme (soumis à modification) :\r\nFemmes, 400 m quatre nages individuel, Finale\r\nHommes, 200 m nage libre, Finale\r\nFemmes, 100 m dos, Demi-finales\r\nHommes, 100 m dos, Finale\r\nFemmes, 100 m brasse, Finale\r\nFemmes, 200 m nage libre, Finale','images/Natation_by_freepik_PGbz9WE.jpg',2,'2024-07-29',300.00);
/*!40000 ALTER TABLE `offres_offre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offres_offre_evenements`
--

DROP TABLE IF EXISTS `offres_offre_evenements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offres_offre_evenements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `offre_id` int DEFAULT NULL,
  `evenement_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offre_id` (`offre_id`),
  KEY `evenement_id` (`evenement_id`),
  CONSTRAINT `offres_offre_evenements_ibfk_1` FOREIGN KEY (`offre_id`) REFERENCES `offres_offre` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offres_offre_evenements`
--

LOCK TABLES `offres_offre_evenements` WRITE;
/*!40000 ALTER TABLE `offres_offre_evenements` DISABLE KEYS */;
INSERT INTO `offres_offre_evenements` VALUES (9,5,8),(10,1,8),(11,6,8),(12,7,8);
/*!40000 ALTER TABLE `offres_offre_evenements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offres_panier`
--

DROP TABLE IF EXISTS `offres_panier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offres_panier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `offre_id` int DEFAULT NULL,
  `evenement_id` int DEFAULT NULL,
  `quantite` int DEFAULT '1',
  `type_offre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `offre_id` (`offre_id`),
  KEY `evenement_id` (`evenement_id`),
  CONSTRAINT `offres_panier_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `offres_panier_ibfk_2` FOREIGN KEY (`offre_id`) REFERENCES `offres_offre` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offres_panier`
--

LOCK TABLES `offres_panier` WRITE;
/*!40000 ALTER TABLE `offres_panier` DISABLE KEYS */;
INSERT INTO `offres_panier` VALUES (13,NULL,1,1,1,'Solo');
/*!40000 ALTER TABLE `offres_panier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offres_sport`
--

DROP TABLE IF EXISTS `offres_sport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offres_sport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offres_sport`
--

LOCK TABLES `offres_sport` WRITE;
/*!40000 ALTER TABLE `offres_sport` DISABLE KEYS */;
INSERT INTO `offres_sport` VALUES (1,'Athlétisme'),(2,'Natation'),(3,'Basket-ball'),(4,'Gymnastique'),(7,'Badminton'),(8,'Boxe'),(9,'Escalade'),(10,'Judo'),(11,'Escrime');
/*!40000 ALTER TABLE `offres_sport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser`
--

DROP TABLE IF EXISTS `users_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `unique_key` varchar(64) NOT NULL,
  `purchase_key` varchar(64) DEFAULT NULL,
  `qr_code` varchar(100) DEFAULT NULL,
  `final_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `unique_key` (`unique_key`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser`
--

LOCK TABLES `users_customuser` WRITE;
/*!40000 ALTER TABLE `users_customuser` DISABLE KEYS */;
INSERT INTO `users_customuser` VALUES (1,'pbkdf2_sha256$720000$A3AaTV5RMEHIfh4BbZXQfS$HBnuAJa1lKPYVQrD9XR+iOPs/aMu1eTZ0pvxEdZGzps=','2024-05-29 13:33:32.517665',1,'Admin_django','','','jean.beonel@outlook.fr',1,1,'2024-05-28 16:45:01.000000','qlgcRm0Mr0OHrlDG9Wbcs0y6CqCn5oFgp0nHhOHCRtw','1561aa59-c156-4cd4-a540-b35f3b5f5cf0','qr_codes/qr_code_ocXWDhU.png','91bef3a0c52b99f5a2eeafc3cbd57e53634ed63ed11d0c5fdf628b921ceb2530'),(2,'pbkdf2_sha256$720000$t2i7LQhzXCkBvk7JDNCJHl$O1irss//8DYa+FMKyBY3gSFtlxUfJ+A2Kyxe/wg57U4=','2024-05-29 01:34:18.254113',0,'beo','jeanTest','beoTest','jean.beonel@outlook.fr',0,1,'2024-05-29 01:34:17.917423','y5ybHf7zrPeNttG6Ot53TlCqxVPWMl0i2H1SrqVQT2E',NULL,'',NULL),(4,'pbkdf2_sha256$720000$c7IRxCpVeLYU5XUoURpOen$kLLzxltKdBYMvmPhXzHwHGtIofB5NBdWeeMj83PuEyI=',NULL,1,'Admin_jo','','','',1,1,'2024-05-29 07:22:57.000000','11XDGUH4W8bsg4aysuLxGhXJgKOCUUDev6g34nMKK9U',NULL,'',NULL),(5,'pbkdf2_sha256$720000$BWT6Bay6Jg6aHHVUI8Fd8v$moJQv4pIW0EgLYseDn1vutvL7dUV/9kxOR865ORkFS4=','2024-05-29 13:33:04.312838',0,'Employé','jeux','Olympics','jean.beonel@outlook.fr',0,1,'2024-05-29 13:33:03.972433','IQ9_Zv4luXUFEbmaOezPmhOXbig09EzuuTidMvx-GS8',NULL,'',NULL);
/*!40000 ALTER TABLE `users_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser_groups`
--

DROP TABLE IF EXISTS `users_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_groups_customuser_id_group_id_76b619e3_uniq` (`customuser_id`,`group_id`),
  KEY `users_customuser_groups_group_id_01390b14_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_customuser_gro_customuser_id_958147bf_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `users_customuser_groups_group_id_01390b14_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser_groups`
--

LOCK TABLES `users_customuser_groups` WRITE;
/*!40000 ALTER TABLE `users_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser_user_permissions`
--

DROP TABLE IF EXISTS `users_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_user_pe_customuser_id_permission_7a7debf6_uniq` (`customuser_id`,`permission_id`),
  KEY `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_customuser_use_customuser_id_5771478b_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser_user_permissions`
--

LOCK TABLES `users_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_customuser_user_permissions` DISABLE KEYS */;
INSERT INTO `users_customuser_user_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,4,1),(42,4,2),(43,4,3),(44,4,4),(45,4,5),(46,4,6),(47,4,7),(48,4,8),(49,4,9),(50,4,10),(51,4,11),(52,4,12),(53,4,13),(54,4,14),(55,4,15),(56,4,16),(57,4,17),(58,4,18),(59,4,19),(60,4,20),(61,4,21),(62,4,22),(63,4,23),(64,4,24),(65,4,25),(66,4,26),(67,4,27),(68,4,28),(69,4,29),(70,4,30),(71,4,31),(72,4,32),(73,4,33),(74,4,34),(75,4,35),(76,4,36),(77,4,37),(78,4,38),(79,4,39),(80,4,40);
/*!40000 ALTER TABLE `users_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-29 23:33:37
