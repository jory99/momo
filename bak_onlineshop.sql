-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: onlineshop
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'alstn9961@naver.com',1,1,2);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add product',8,'add_product'),(30,'Can change product',8,'change_product'),(31,'Can delete product',8,'delete_product'),(32,'Can view product',8,'view_product'),(33,'Can add site',9,'add_site'),(34,'Can change site',9,'change_site'),(35,'Can delete site',9,'delete_site'),(36,'Can view site',9,'view_site'),(37,'Can add email address',10,'add_emailaddress'),(38,'Can change email address',10,'change_emailaddress'),(39,'Can delete email address',10,'delete_emailaddress'),(40,'Can view email address',10,'view_emailaddress'),(41,'Can add email confirmation',11,'add_emailconfirmation'),(42,'Can change email confirmation',11,'change_emailconfirmation'),(43,'Can delete email confirmation',11,'delete_emailconfirmation'),(44,'Can view email confirmation',11,'view_emailconfirmation'),(45,'Can add social account',12,'add_socialaccount'),(46,'Can change social account',12,'change_socialaccount'),(47,'Can delete social account',12,'delete_socialaccount'),(48,'Can view social account',12,'view_socialaccount'),(49,'Can add social application',13,'add_socialapp'),(50,'Can change social application',13,'change_socialapp'),(51,'Can delete social application',13,'delete_socialapp'),(52,'Can view social application',13,'view_socialapp'),(53,'Can add social application token',14,'add_socialtoken'),(54,'Can change social application token',14,'change_socialtoken'),(55,'Can delete social application token',14,'delete_socialtoken'),(56,'Can view social application token',14,'view_socialtoken'),(57,'Can add coupon',15,'add_coupon'),(58,'Can change coupon',15,'change_coupon'),(59,'Can delete coupon',15,'delete_coupon'),(60,'Can view coupon',15,'view_coupon'),(61,'Can add order item',16,'add_orderitem'),(62,'Can change order item',16,'change_orderitem'),(63,'Can delete order item',16,'delete_orderitem'),(64,'Can view order item',16,'view_orderitem'),(65,'Can add order transaction',17,'add_ordertransaction'),(66,'Can change order transaction',17,'change_ordertransaction'),(67,'Can delete order transaction',17,'delete_ordertransaction'),(68,'Can view order transaction',17,'view_ordertransaction'),(69,'Can add order',18,'add_order'),(70,'Can change order',18,'change_order'),(71,'Can delete order',18,'delete_order'),(72,'Can view order',18,'view_order');
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
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$GQXnHQTzdWuE$fUPKr5T7cyj+ZdSnZ9YLr35pJyjSB/L94lGN1Utl0hc=','2020-06-20 03:04:08.450205',1,'jory','','','',1,1,'2020-06-19 22:33:09.766205'),(2,'!4rJaV6GRLbJWMIJKOGEjgg3PrzqNq79r8jOAgpm5','2020-06-20 05:43:47.293205',0,'alstn9961','','','alstn9961@naver.com',0,1,'2020-06-20 00:17:59.952205');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_coupon`
--

DROP TABLE IF EXISTS `coupon_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_coupon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `use_from` datetime(6) NOT NULL,
  `use_to` datetime(6) NOT NULL,
  `amount` int NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_coupon`
--

LOCK TABLES `coupon_coupon` WRITE;
/*!40000 ALTER TABLE `coupon_coupon` DISABLE KEYS */;
INSERT INTO `coupon_coupon` VALUES (1,'happy','2020-06-20 03:04:19.000000','2020-06-24 04:04:24.000000',5000,1),(2,'good','2020-06-20 09:18:44.000000','2020-06-24 09:18:45.000000',10000,1),(3,'luck','2020-06-20 09:19:07.000000','2020-06-28 09:19:08.000000',10000,1);
/*!40000 ALTER TABLE `coupon_coupon` ENABLE KEYS */;
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
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-06-19 22:37:46.367205','1','무드등/네온',1,'[{\"added\": {}}]',7,1),(2,'2020-06-19 22:37:56.590205','2','미니어처',1,'[{\"added\": {}}]',7,1),(3,'2020-06-19 22:38:06.038205','3','BEST',1,'[{\"added\": {}}]',7,1),(4,'2020-06-19 22:38:19.937205','4','NEW',1,'[{\"added\": {}}]',7,1),(5,'2020-06-19 22:38:26.670205','5','어른이 장난감',1,'[{\"added\": {}}]',7,1),(6,'2020-06-19 22:38:47.215205','6','집 콕~옥 세일',1,'[{\"added\": {}}]',7,1),(7,'2020-06-19 22:40:19.137205','7','식물',1,'[{\"added\": {}}]',7,1),(8,'2020-06-19 22:42:10.143205','1','diy 복숭아 케이크 버블바, 베쓰밤',1,'[{\"added\": {}}]',8,1),(9,'2020-06-19 22:43:00.565205','2','알록달록 비즈 악세서리 만들기',1,'[{\"added\": {}}]',8,1),(10,'2020-06-19 22:43:35.449205','3','장미 무드등',1,'[{\"added\": {}}]',8,1),(11,'2020-06-19 22:44:36.671205','4','미니어처하우스',1,'[{\"added\": {}}]',8,1),(12,'2020-06-19 22:45:05.052205','5','무지개 목화 나무 만들기',1,'[{\"added\": {}}]',8,1),(13,'2020-06-19 22:45:49.079205','6','대왕 햄스터 블록',1,'[{\"added\": {}}]',8,1),(14,'2020-06-19 22:46:54.744205','7','휴대용 젤리곰 비누 만들기',1,'[{\"added\": {}}]',8,1),(15,'2020-06-20 00:16:36.235205','1','네이버 로그인',1,'[{\"added\": {}}]',13,1),(16,'2020-06-20 03:05:04.301205','1','happy',1,'[{\"added\": {}}]',15,1),(17,'2020-06-20 03:09:47.320205','1','happy',2,'[{\"changed\": {\"fields\": [\"Amount\"]}}]',15,1),(18,'2020-06-20 03:31:18.330205','1','happy',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',15,1),(19,'2020-06-20 04:49:16.796205','1','happy',2,'[{\"changed\": {\"fields\": [\"Use from\"]}}]',15,1),(20,'2020-06-20 04:50:02.114205','1','happy',2,'[{\"changed\": {\"fields\": [\"Use from\", \"Use to\"]}}]',15,1),(21,'2020-06-20 09:18:57.076205','2','good',1,'[{\"added\": {}}]',15,1),(22,'2020-06-20 09:19:19.087205','3','luck',1,'[{\"added\": {}}]',15,1),(23,'2020-06-20 09:20:54.961205','8','코바늘 수세미 만들기',1,'[{\"added\": {}}]',8,1),(24,'2020-06-20 09:22:06.399205','9','알록달록 마카롱 비누 만들기',1,'[{\"added\": {}}]',8,1),(25,'2020-06-20 09:22:48.457205','10','레트로크리스마스 미니어처',1,'[{\"added\": {}}]',8,1),(26,'2020-06-20 09:24:00.907205','11','캘리그라피 아크릴 무드등 만들기',1,'[{\"added\": {}}]',8,1),(27,'2020-06-20 09:24:55.056205','12','인형 양초',1,'[{\"added\": {}}]',8,1),(28,'2020-06-20 09:29:24.247205','11','캘리그라피 아크릴 무드등 만들기',2,'[{\"changed\": {\"fields\": [\"Display\"]}}]',8,1),(29,'2020-06-20 09:29:24.262205','12','인형 양초',2,'[{\"changed\": {\"fields\": [\"Display\"]}}]',8,1),(30,'2020-06-20 09:30:21.530205','9','알록달록 마카롱 비누 만들기',2,'[{\"changed\": {\"fields\": [\"Display\"]}}]',8,1),(31,'2020-06-20 09:30:21.547205','10','레트로크리스마스 미니어처',2,'[{\"changed\": {\"fields\": [\"Display\"]}}]',8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (10,'account','emailaddress'),(11,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(15,'coupon','coupon'),(18,'order','order'),(16,'order','orderitem'),(17,'order','ordertransaction'),(6,'sessions','session'),(7,'shop','category'),(8,'shop','product'),(9,'sites','site'),(12,'socialaccount','socialaccount'),(13,'socialaccount','socialapp'),(14,'socialaccount','socialtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-06-19 22:32:31.705205'),(2,'auth','0001_initial','2020-06-19 22:32:32.684205'),(3,'account','0001_initial','2020-06-19 22:32:37.685205'),(4,'account','0002_email_max_length','2020-06-19 22:32:38.723205'),(5,'admin','0001_initial','2020-06-19 22:32:38.783205'),(6,'admin','0002_logentry_remove_auto_add','2020-06-19 22:32:40.085205'),(7,'admin','0003_logentry_add_action_flag_choices','2020-06-19 22:32:40.405205'),(8,'contenttypes','0002_remove_content_type_name','2020-06-19 22:32:40.835205'),(9,'auth','0002_alter_permission_name_max_length','2020-06-19 22:32:41.093205'),(10,'auth','0003_alter_user_email_max_length','2020-06-19 22:32:41.724205'),(11,'auth','0004_alter_user_username_opts','2020-06-19 22:32:41.734205'),(12,'auth','0005_alter_user_last_login_null','2020-06-19 22:32:42.199205'),(13,'auth','0006_require_contenttypes_0002','2020-06-19 22:32:42.209205'),(14,'auth','0007_alter_validators_add_error_messages','2020-06-19 22:32:42.219205'),(15,'auth','0008_alter_user_username_max_length','2020-06-19 22:32:42.329205'),(16,'auth','0009_alter_user_last_name_max_length','2020-06-19 22:32:42.469205'),(17,'auth','0010_alter_group_name_max_length','2020-06-19 22:32:42.579205'),(18,'auth','0011_update_proxy_permissions','2020-06-19 22:32:42.599205'),(19,'sessions','0001_initial','2020-06-19 22:32:42.659205'),(20,'shop','0001_initial','2020-06-19 22:32:43.159205'),(21,'sites','0001_initial','2020-06-19 22:32:43.519205'),(22,'sites','0002_alter_domain_unique','2020-06-19 22:32:43.569205'),(23,'socialaccount','0001_initial','2020-06-19 22:32:43.899205'),(24,'socialaccount','0002_token_max_lengths','2020-06-19 22:32:46.164205'),(25,'socialaccount','0003_extra_data_default_dict','2020-06-19 22:32:46.180205'),(26,'coupon','0001_initial','2020-06-20 02:23:46.409205'),(27,'order','0001_initial','2020-06-20 04:08:32.074205');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('26u0m44d8oumtkxummfgma7czsgce75c','Y2RhYzViMjcwNmNlYjAzOWYxNWEzZDEwMDdmNjk2OWUwZjEyMzgzNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwYzA1ZDRiOTIzNDgyNDMwMWY2YjJhOGZmZTFlMGEyZDMyMmI3M2MyIiwiY2FydF9pbl9zZXNzaW9uIjp7fSwiY291cG9uX2lkIjpudWxsfQ==','2020-07-04 09:33:51.383205'),('hsednm2ks5hty8evzy9a8c6lmnm2lptf','NmUwMzk4MjE0NzRjYmQ0ODk1YzliZjRiYTM0MWMwOTUwMzI1NTdiMTp7ImNhcnRfaW5fc2Vzc2lvbiI6e30sImNvdXBvbl9pZCI6bnVsbCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNzA0MzkzNGNhNzVmOTgxYjcxNjI3Yjc5NzIwNTc1ZmEyNWE5MWZmIn0=','2020-07-04 06:19:55.176205');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_order`
--

DROP TABLE IF EXISTS `order_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `address` varchar(250) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `city` varchar(100) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `discount` int NOT NULL,
  `coupon_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_order_coupon_id_dc594905_fk_coupon_coupon_id` (`coupon_id`),
  CONSTRAINT `order_order_coupon_id_dc594905_fk_coupon_coupon_id` FOREIGN KEY (`coupon_id`) REFERENCES `coupon_coupon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_order`
--

LOCK TABLES `order_order` WRITE;
/*!40000 ALTER TABLE `order_order` DISABLE KEYS */;
INSERT INTO `order_order` VALUES (1,'d','d','d@naver.com','d','d','d','2020-06-20 04:31:42.019205','2020-06-20 04:31:42.019205',0,5000,1),(2,'d','d','d@naver.com','d','d','d','2020-06-20 04:31:47.208205','2020-06-20 04:31:47.208205',0,0,NULL),(3,'d','d','d@naver.com','d','d','d','2020-06-20 04:33:04.837205','2020-06-20 04:33:04.837205',0,0,NULL),(4,'d','d','d@naver.com','d','d','d','2020-06-20 04:33:05.520205','2020-06-20 04:33:05.520205',0,0,NULL),(5,'d','d','d@naver.com','d','d','d','2020-06-20 04:33:08.838205','2020-06-20 04:33:08.838205',0,0,NULL),(6,'f','f','f@naver.com','f','f','f','2020-06-20 04:50:42.792205','2020-06-20 04:50:42.792205',0,5000,1),(7,'f','f','f@naver.com','f','f','f','2020-06-20 04:50:48.623205','2020-06-20 04:50:48.623205',0,0,NULL),(8,'f','f','f@naver.com','f','f','f','2020-06-20 04:50:52.722205','2020-06-20 04:50:52.722205',0,0,NULL),(9,'f','f','f@naver.com','f','f','f','2020-06-20 04:50:54.436205','2020-06-20 04:50:54.436205',0,0,NULL),(10,'f','f','f@naver.com','f','f','f','2020-06-20 04:50:58.700205','2020-06-20 04:50:58.700205',0,0,NULL),(11,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 04:54:10.151205','2020-06-20 04:54:10.151205',0,0,NULL),(12,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 04:54:12.081205','2020-06-20 04:54:12.081205',0,0,NULL),(13,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 04:54:12.871205','2020-06-20 04:54:12.871205',0,0,NULL),(14,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 04:54:15.334205','2020-06-20 04:54:15.334205',0,0,NULL),(15,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 04:54:17.330205','2020-06-20 04:54:17.330205',0,0,NULL),(16,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 04:54:20.067205','2020-06-20 04:54:20.067205',0,0,NULL),(17,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 05:10:40.149205','2020-06-20 05:10:40.149205',0,0,NULL),(18,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 05:10:41.268205','2020-06-20 05:10:41.268205',0,0,NULL),(19,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 05:10:43.258205','2020-06-20 05:10:43.258205',0,0,NULL),(20,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 05:10:43.577205','2020-06-20 05:10:43.577205',0,0,NULL),(21,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 05:10:46.032205','2020-06-20 05:10:46.032205',0,0,NULL),(22,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 05:10:46.395205','2020-06-20 05:10:46.395205',0,0,NULL),(23,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 05:10:46.821205','2020-06-20 05:10:46.821205',0,0,NULL),(24,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 05:10:47.226205','2020-06-20 05:10:47.226205',0,0,NULL),(25,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 05:10:47.386205','2020-06-20 05:10:47.386205',0,0,NULL),(26,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 05:10:48.191205','2020-06-20 05:10:48.191205',0,0,NULL),(27,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 05:10:48.599205','2020-06-20 05:10:48.599205',0,0,NULL),(28,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 05:10:48.990205','2020-06-20 05:10:48.990205',0,0,NULL),(29,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 05:10:49.444205','2020-06-20 05:10:49.444205',0,0,NULL),(30,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 05:10:50.420205','2020-06-20 05:10:50.420205',0,0,NULL),(31,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 05:11:55.132205','2020-06-20 05:11:55.132205',0,0,NULL),(32,'rla','alwjd','djfdkdf@naver.com','아아아','1234','오아아','2020-06-20 05:11:55.881205','2020-06-20 05:11:55.881205',0,0,NULL),(33,'ㅇㄹㅇ','ㄹㅇㄹㄴ','alstn9961@naver.com','ㅇㄴㄹㄴㅇ','ㅇㄴㄹㄴ','ㅇㄴㄹㄴㅇㄹ','2020-06-20 05:12:31.207205','2020-06-20 05:12:31.207205',0,0,NULL),(34,'ㅇㄹㅇ','ㄹㅇㄹㄴ','alstn9961@naver.com','ㅇㄴㄹㄴㅇ','ㅇㄴㄹㄴ','ㅇㄴㄹㄴㅇㄹ','2020-06-20 05:12:35.138205','2020-06-20 05:12:35.138205',0,0,NULL),(35,'ㅇㄹㅇ','ㄹㅇㄹㄴ','alstn9961@naver.com','ㅇㄴㄹㄴㅇ','ㅇㄴㄹㄴ','ㅇㄴㄹㄴㅇㄹ','2020-06-20 05:12:38.075205','2020-06-20 05:12:38.076205',0,0,NULL),(36,'ㅇㄹㅇ','ㄹㅇㄹㄴ','alstn9961@naver.com','ㅇㄴㄹㄴㅇ','ㅇㄴㄹㄴ','ㅇㄴㄹㄴㅇㄹ','2020-06-20 05:14:15.733205','2020-06-20 05:14:15.733205',0,0,NULL),(37,'ㅇㄹㅇ','ㄹㅇㄹㄴ','alstn9961@naver.com','ㅇㄴㄹㄴㅇ','ㅇㄴㄹㄴ','ㅇㄴㄹㄴㅇㄹ','2020-06-20 05:18:10.878205','2020-06-20 05:18:10.878205',0,0,NULL),(38,'ㅇㄹㅇ','ㄹㅇㄹㄴ','alstn9961@naver.com','ㅇㄴㄹㄴㅇ','ㅇㄴㄹㄴ','ㅇㄴㄹㄴㅇㄹ','2020-06-20 05:18:11.955205','2020-06-20 05:18:11.955205',0,0,NULL),(39,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:18:39.347205','2020-06-20 05:18:39.347205',0,5000,1),(40,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:18:41.052205','2020-06-20 05:18:41.052205',0,0,NULL),(41,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:18:41.982205','2020-06-20 05:18:41.982205',0,0,NULL),(42,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:18:43.195205','2020-06-20 05:18:43.195205',0,0,NULL),(43,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:18:43.625205','2020-06-20 05:18:43.625205',0,0,NULL),(44,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:18:44.031205','2020-06-20 05:18:44.031205',0,0,NULL),(45,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:18:44.403205','2020-06-20 05:18:44.403205',0,0,NULL),(46,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:18:44.746205','2020-06-20 05:18:44.746205',0,0,NULL),(47,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:18:47.424205','2020-06-20 05:18:47.424205',0,0,NULL),(48,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:18:49.091205','2020-06-20 05:18:49.091205',0,0,NULL),(49,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:18:49.449205','2020-06-20 05:18:49.449205',0,0,NULL),(50,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:18:49.964205','2020-06-20 05:18:49.964205',0,0,NULL),(51,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:18:50.371205','2020-06-20 05:18:50.371205',0,0,NULL),(52,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:18:50.858205','2020-06-20 05:18:50.858205',0,0,NULL),(53,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:18:51.206205','2020-06-20 05:18:51.206205',0,0,NULL),(54,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:18:51.585205','2020-06-20 05:18:51.585205',0,0,NULL),(55,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:18:51.985205','2020-06-20 05:18:51.985205',0,0,NULL),(56,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:18:52.821205','2020-06-20 05:18:52.821205',0,0,NULL),(57,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:18:53.190205','2020-06-20 05:18:53.190205',0,0,NULL),(58,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:18:54.494205','2020-06-20 05:18:54.494205',0,0,NULL),(59,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:19:02.454205','2020-06-20 05:19:02.454205',0,0,NULL),(60,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:19:03.065205','2020-06-20 05:19:03.065205',0,0,NULL),(61,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:19:03.470205','2020-06-20 05:19:03.470205',0,0,NULL),(62,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:19:03.871205','2020-06-20 05:19:03.871205',0,0,NULL),(63,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:19:04.366205','2020-06-20 05:19:04.366205',0,0,NULL),(64,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:19:04.979205','2020-06-20 05:19:04.979205',0,0,NULL),(65,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:19:06.346205','2020-06-20 05:19:06.346205',0,0,NULL),(66,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:19:10.200205','2020-06-20 05:19:10.200205',0,0,NULL),(67,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:19:10.559205','2020-06-20 05:19:10.559205',0,0,NULL),(68,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:19:11.090205','2020-06-20 05:19:11.090205',0,0,NULL),(69,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:42:20.935205','2020-06-20 05:42:20.935205',0,0,NULL),(70,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:42:21.646205','2020-06-20 05:42:21.646205',0,0,NULL),(71,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:42:22.373205','2020-06-20 05:42:22.373205',0,0,NULL),(72,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:42:23.666205','2020-06-20 05:42:23.666205',0,0,NULL),(73,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:42:24.904205','2020-06-20 05:42:24.904205',0,0,NULL),(74,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:42:25.475205','2020-06-20 05:42:25.475205',0,0,NULL),(75,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:42:26.179205','2020-06-20 05:42:26.179205',0,0,NULL),(76,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:42:26.695205','2020-06-20 05:42:26.695205',0,0,NULL),(77,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:42:27.166205','2020-06-20 05:42:27.166205',0,0,NULL),(78,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:42:27.519205','2020-06-20 05:42:27.519205',0,0,NULL),(79,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:42:27.812205','2020-06-20 05:42:27.812205',0,0,NULL),(80,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:42:28.113205','2020-06-20 05:42:28.113205',0,0,NULL),(81,'hhh','hhhh','ggg@naver.com','hhhh','hhh','hhh','2020-06-20 05:42:28.423205','2020-06-20 05:42:28.423205',0,0,NULL),(82,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:04.023205','2020-06-20 05:44:04.023205',0,5000,1),(83,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:06.296205','2020-06-20 05:44:06.296205',0,0,NULL),(84,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:07.255205','2020-06-20 05:44:07.255205',0,0,NULL),(85,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:07.463205','2020-06-20 05:44:07.463205',0,0,NULL),(86,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:07.639205','2020-06-20 05:44:07.639205',0,0,NULL),(87,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:12.579205','2020-06-20 05:44:12.579205',0,0,NULL),(88,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:12.754205','2020-06-20 05:44:12.754205',0,0,NULL),(89,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:12.919205','2020-06-20 05:44:12.919205',0,0,NULL),(90,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:13.107205','2020-06-20 05:44:13.107205',0,0,NULL),(91,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:13.291205','2020-06-20 05:44:13.291205',0,0,NULL),(92,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:13.469205','2020-06-20 05:44:13.469205',0,0,NULL),(93,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:13.637205','2020-06-20 05:44:13.637205',0,0,NULL),(94,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:13.815205','2020-06-20 05:44:13.815205',0,0,NULL),(95,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:13.980205','2020-06-20 05:44:13.980205',0,0,NULL),(96,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:14.160205','2020-06-20 05:44:14.160205',0,0,NULL),(97,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:14.660205','2020-06-20 05:44:14.660205',0,0,NULL),(98,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:14.819205','2020-06-20 05:44:14.819205',0,0,NULL),(99,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:14.980205','2020-06-20 05:44:14.980205',0,0,NULL),(100,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:15.135205','2020-06-20 05:44:15.135205',0,0,NULL),(101,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:15.299205','2020-06-20 05:44:15.299205',0,0,NULL),(102,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:16.969205','2020-06-20 05:44:16.969205',0,0,NULL),(103,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:17.160205','2020-06-20 05:44:17.160205',0,0,NULL),(104,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:17.384205','2020-06-20 05:44:17.384205',0,0,NULL),(105,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:17.544205','2020-06-20 05:44:17.544205',0,0,NULL),(106,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:17.731205','2020-06-20 05:44:17.731205',0,0,NULL),(107,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:17.906205','2020-06-20 05:44:17.906205',0,0,NULL),(108,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:18.139205','2020-06-20 05:44:18.139205',0,0,NULL),(109,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:18.897205','2020-06-20 05:44:18.897205',0,0,NULL),(110,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:21.875205','2020-06-20 05:44:21.875205',0,0,NULL),(111,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:22.025205','2020-06-20 05:44:22.025205',0,0,NULL),(112,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:22.575205','2020-06-20 05:44:22.575205',0,0,NULL),(113,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:22.736205','2020-06-20 05:44:22.736205',0,0,NULL),(114,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:22.905205','2020-06-20 05:44:22.905205',0,0,NULL),(115,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:23.129205','2020-06-20 05:44:23.129205',0,0,NULL),(116,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:23.616205','2020-06-20 05:44:23.616205',0,0,NULL),(117,'dd','dd','alstn9961@naver.com','dd','dd','dd','2020-06-20 05:44:23.822205','2020-06-20 05:44:23.822205',0,0,NULL),(118,'kim','mijung','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 05:45:18.358205','2020-06-20 05:45:18.358205',0,5000,1),(119,'kim','mijung','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 05:45:19.001205','2020-06-20 05:45:19.001205',0,0,NULL),(120,'kim','mijung','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 05:45:19.181205','2020-06-20 05:45:19.181205',0,0,NULL),(121,'kim','mijung','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 05:45:19.347205','2020-06-20 05:45:19.347205',0,0,NULL),(122,'kim','mijung','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 05:45:19.532205','2020-06-20 05:45:19.532205',0,0,NULL),(123,'kim','mijung','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 05:45:20.014205','2020-06-20 05:45:20.014205',0,0,NULL),(124,'kim','mijung','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 05:45:20.193205','2020-06-20 05:45:20.193205',0,0,NULL),(125,'kim','mijung','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 05:45:20.353205','2020-06-20 05:45:20.353205',0,0,NULL),(126,'kim','mijung','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 05:45:20.519205','2020-06-20 05:45:20.519205',0,0,NULL),(127,'kim','mijung','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 05:45:20.677205','2020-06-20 05:45:20.677205',0,0,NULL),(128,'kim','mijung','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 05:45:20.848205','2020-06-20 05:45:20.848205',0,0,NULL),(129,'kim','mijung','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 05:58:52.298205','2020-06-20 05:58:52.298205',0,0,NULL),(130,'kim','mijung','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 05:58:53.510205','2020-06-20 05:58:53.510205',0,0,NULL),(131,'kim','mijung','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 05:58:54.155205','2020-06-20 05:58:54.155205',0,0,NULL),(132,'kim','mijung','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 05:58:54.603205','2020-06-20 05:58:54.603205',0,0,NULL),(133,'kim','mijung','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 05:58:54.975205','2020-06-20 05:58:54.975205',0,0,NULL),(134,'kim','mijung','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 05:58:55.264205','2020-06-20 05:58:55.264205',0,0,NULL),(135,'kim','mijung','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 05:58:55.532205','2020-06-20 05:58:55.532205',0,0,NULL),(136,'kim','mijung','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 05:58:55.761205','2020-06-20 05:58:55.761205',0,0,NULL),(137,'f','f','gg@naver.com','f','f','f','2020-06-20 05:59:48.373205','2020-06-20 05:59:48.373205',0,5000,1),(138,'f','f','gg@naver.com','f','f','f','2020-06-20 05:59:49.442205','2020-06-20 05:59:49.442205',0,0,NULL),(139,'f','f','gg@naver.com','f','f','f','2020-06-20 05:59:51.326205','2020-06-20 05:59:51.326205',0,0,NULL),(140,'f','f','gg@naver.com','f','f','f','2020-06-20 06:05:29.075205','2020-06-20 06:05:29.075205',0,0,NULL),(141,'f','f','gg@naver.com','f','f','f','2020-06-20 06:05:29.711205','2020-06-20 06:05:29.711205',0,0,NULL),(142,'f','f','gg@naver.com','f','f','f','2020-06-20 06:05:29.952205','2020-06-20 06:05:29.952205',0,0,NULL),(143,'f','f','gg@naver.com','f','f','f','2020-06-20 06:05:30.342205','2020-06-20 06:05:30.342205',0,0,NULL),(144,'f','f','gg@naver.com','f','f','f','2020-06-20 06:05:32.105205','2020-06-20 06:05:32.105205',0,0,NULL),(145,'f','f','gg@naver.com','f','f','f','2020-06-20 06:05:32.298205','2020-06-20 06:05:32.298205',0,0,NULL),(146,'f','f','gg@naver.com','f','f','f','2020-06-20 06:05:32.542205','2020-06-20 06:05:32.542205',0,0,NULL),(147,'f','f','gg@naver.com','f','f','f','2020-06-20 06:05:32.743205','2020-06-20 06:05:32.743205',0,0,NULL),(148,'f','f','gg@naver.com','f','f','f','2020-06-20 06:05:32.929205','2020-06-20 06:05:32.929205',0,0,NULL),(149,'f','f','gg@naver.com','f','f','f','2020-06-20 06:05:33.179205','2020-06-20 06:05:33.179205',0,0,NULL),(150,'f','f','gg@naver.com','f','f','f','2020-06-20 06:06:32.050205','2020-06-20 06:06:32.050205',0,0,NULL),(151,'f','f','gg@naver.com','f','f','f','2020-06-20 06:06:32.957205','2020-06-20 06:06:32.957205',0,0,NULL),(152,'f','f','gg@naver.com','f','f','f','2020-06-20 06:06:33.665205','2020-06-20 06:06:33.665205',0,0,NULL),(153,'k','k','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 06:06:57.338205','2020-06-20 06:06:57.338205',0,0,NULL),(154,'k','k','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 06:06:58.112205','2020-06-20 06:06:58.112205',0,0,NULL),(155,'k','k','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 06:07:04.785205','2020-06-20 06:07:04.785205',0,0,NULL),(156,'k','k','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 06:07:04.948205','2020-06-20 06:07:04.948205',0,0,NULL),(157,'k','k','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 06:07:05.725205','2020-06-20 06:07:05.725205',0,0,NULL),(158,'k','k','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 06:07:05.904205','2020-06-20 06:07:05.904205',0,0,NULL),(159,'k','k','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 06:07:06.877205','2020-06-20 06:07:06.877205',0,0,NULL),(160,'k','k','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 06:07:07.721205','2020-06-20 06:07:07.721205',0,0,NULL),(161,'k','k','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 06:07:08.192205','2020-06-20 06:07:08.192205',0,0,NULL),(162,'k','k','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 06:07:08.910205','2020-06-20 06:07:08.910205',0,0,NULL),(163,'k','k','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 06:07:09.090205','2020-06-20 06:07:09.090205',0,0,NULL),(164,'k','k','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 06:07:10.541205','2020-06-20 06:07:10.541205',0,0,NULL),(165,'k','k','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 06:07:10.723205','2020-06-20 06:07:10.723205',0,0,NULL),(166,'k','k','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 06:15:34.567205','2020-06-20 06:15:34.567205',0,0,NULL),(167,'ㅇ','gg','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 06:15:50.095205','2020-06-20 06:15:50.095205',0,0,NULL),(168,'gg','dd','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 06:16:07.275205','2020-06-20 06:16:07.275205',0,0,NULL),(169,'gg','dd','alstn9961@naver.com','서울시','21351','은평구','2020-06-20 06:19:55.166205','2020-06-20 06:19:55.166205',0,0,NULL),(170,'ff','ff','ff@naver.com','ff','gg','gg','2020-06-20 09:31:33.736205','2020-06-20 09:31:33.736205',0,0,NULL),(171,'zz','zz','zz@naver.com','zz','zz','zz','2020-06-20 09:33:11.242205','2020-06-20 09:33:11.242205',0,5000,1);
/*!40000 ALTER TABLE `order_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderitem`
--

DROP TABLE IF EXISTS `order_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_orderitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_orderitem_order_id_aba34f44_fk_order_order_id` (`order_id`),
  KEY `order_orderitem_product_id_c5c6b07a_fk_shop_product_id` (`product_id`),
  CONSTRAINT `order_orderitem_order_id_aba34f44_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `order_orderitem_product_id_c5c6b07a_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`),
  CONSTRAINT `order_orderitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderitem`
--

LOCK TABLES `order_orderitem` WRITE;
/*!40000 ALTER TABLE `order_orderitem` DISABLE KEYS */;
INSERT INTO `order_orderitem` VALUES (1,12000.00,1,1,7),(2,16000.00,1,1,6),(3,12000.00,1,6,7),(4,16000.00,1,6,6),(5,12000.00,1,39,7),(6,12000.00,1,82,7),(7,12000.00,1,118,7),(8,16000.00,1,118,6),(9,12000.00,1,137,7),(10,16000.00,1,137,6),(11,12000.00,1,153,7),(12,12000.00,1,168,7),(13,12000.00,1,170,7),(14,15000.00,1,171,4),(15,12000.00,1,171,7);
/*!40000 ALTER TABLE `order_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_ordertransaction`
--

DROP TABLE IF EXISTS `order_ordertransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_ordertransaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `merchant_order_id` varchar(120) DEFAULT NULL,
  `transaction_id` varchar(120) DEFAULT NULL,
  `amount` int unsigned NOT NULL,
  `transaction_status` varchar(220) DEFAULT NULL,
  `type` varchar(120) NOT NULL,
  `created` datetime(6) NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_ordertransaction_order_id_1f8d5152_fk_order_order_id` (`order_id`),
  CONSTRAINT `order_ordertransaction_order_id_1f8d5152_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `order_ordertransaction_chk_1` CHECK ((`amount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_ordertransaction`
--

LOCK TABLES `order_ordertransaction` WRITE;
/*!40000 ALTER TABLE `order_ordertransaction` DISABLE KEYS */;
INSERT INTO `order_ordertransaction` VALUES (1,'2f93184cb4',NULL,23000,NULL,'','2020-06-20 04:31:42.477205',1),(2,'2a3431ecec',NULL,23000,NULL,'','2020-06-20 04:31:47.350205',2),(3,'f8da8ccd9e',NULL,23000,NULL,'','2020-06-20 04:33:04.964205',3),(4,'3818980237',NULL,23000,NULL,'','2020-06-20 04:33:05.648205',4),(5,'c17093b275',NULL,23000,NULL,'','2020-06-20 04:33:08.983205',5),(6,'959ff5b0a5',NULL,23000,NULL,'','2020-06-20 04:50:42.944205',6),(7,'f379399d49',NULL,23000,NULL,'','2020-06-20 04:50:48.765205',7),(8,'7513adcc44',NULL,23000,NULL,'','2020-06-20 04:50:52.864205',8),(9,'f06d674ea7',NULL,23000,NULL,'','2020-06-20 04:50:54.572205',9),(10,'2a0835feb8',NULL,23000,NULL,'','2020-06-20 04:50:58.841205',10),(11,'aea06d7151',NULL,23000,NULL,'','2020-06-20 04:54:10.291205',11),(12,'00901207b9',NULL,23000,NULL,'','2020-06-20 04:54:12.226205',12),(13,'8089bf23b7',NULL,23000,NULL,'','2020-06-20 04:54:13.013205',13),(14,'e0bcc9d2e7',NULL,23000,NULL,'','2020-06-20 04:54:15.477205',14),(15,'fbec30ddd1',NULL,23000,NULL,'','2020-06-20 04:54:17.470205',15),(16,'ac215eb03b',NULL,23000,NULL,'','2020-06-20 04:54:20.200205',16),(17,'e22bde04cd',NULL,23000,NULL,'','2020-06-20 05:10:40.304205',17),(18,'28fee5e1ff',NULL,23000,NULL,'','2020-06-20 05:10:41.400205',18),(19,'72c4ed85c8',NULL,23000,NULL,'','2020-06-20 05:10:43.390205',19),(20,'ffd39df6a9',NULL,23000,NULL,'','2020-06-20 05:10:43.712205',20),(21,'05175d4ed3',NULL,23000,NULL,'','2020-06-20 05:10:46.171205',21),(22,'e5045bab8d',NULL,23000,NULL,'','2020-06-20 05:10:46.526205',22),(23,'58845ce30a',NULL,23000,NULL,'','2020-06-20 05:10:46.975205',23),(24,'d94095667d',NULL,23000,NULL,'','2020-06-20 05:10:47.365205',24),(25,'ac446953ee',NULL,23000,NULL,'','2020-06-20 05:10:47.818205',25),(26,'8e31764ee4',NULL,23000,NULL,'','2020-06-20 05:10:48.338205',26),(27,'53b2f80881',NULL,23000,NULL,'','2020-06-20 05:10:48.736205',27),(28,'3d65daaee9',NULL,23000,NULL,'','2020-06-20 05:10:49.128205',28),(29,'5e01c3563b',NULL,23000,NULL,'','2020-06-20 05:10:49.575205',29),(30,'06b9d8dfce',NULL,23000,NULL,'','2020-06-20 05:10:50.565205',30),(31,'77a757b271',NULL,23000,NULL,'','2020-06-20 05:11:55.287205',31),(32,'794307d8cc',NULL,23000,NULL,'','2020-06-20 05:11:56.018205',32),(33,'59e03fe837',NULL,0,NULL,'','2020-06-20 05:12:31.353205',33),(34,'abbcae5c8c',NULL,0,NULL,'','2020-06-20 05:12:35.280205',34),(35,'ac40fae08d',NULL,0,NULL,'','2020-06-20 05:12:38.217205',35),(36,'c6169d79ac',NULL,0,NULL,'','2020-06-20 05:14:15.872205',36),(37,'9a6fe15750',NULL,0,NULL,'','2020-06-20 05:18:11.022205',37),(38,'0fcf435083',NULL,0,NULL,'','2020-06-20 05:18:12.097205',38),(39,'1663f75544',NULL,7000,NULL,'','2020-06-20 05:18:39.493205',39),(40,'16492ef00d',NULL,7000,NULL,'','2020-06-20 05:18:41.208205',40),(41,'0d3bcaa1d5',NULL,7000,NULL,'','2020-06-20 05:18:42.125205',41),(42,'c40dfb9479',NULL,7000,NULL,'','2020-06-20 05:18:43.345205',42),(43,'6dd76fb79c',NULL,7000,NULL,'','2020-06-20 05:18:43.763205',43),(44,'3e860d3b29',NULL,7000,NULL,'','2020-06-20 05:18:44.173205',44),(45,'00ed9af5f1',NULL,7000,NULL,'','2020-06-20 05:18:44.535205',45),(46,'601a7a24ae',NULL,7000,NULL,'','2020-06-20 05:18:44.882205',46),(47,'8b8de2ade3',NULL,7000,NULL,'','2020-06-20 05:18:47.551205',47),(48,'a91aaeed66',NULL,7000,NULL,'','2020-06-20 05:18:49.243205',48),(49,'1691e0114c',NULL,7000,NULL,'','2020-06-20 05:18:49.584205',49),(50,'00bea6d74a',NULL,7000,NULL,'','2020-06-20 05:18:50.109205',50),(51,'8b648087d6',NULL,7000,NULL,'','2020-06-20 05:18:50.518205',51),(52,'85696de653',NULL,7000,NULL,'','2020-06-20 05:18:50.991205',52),(53,'be7d9f1d66',NULL,7000,NULL,'','2020-06-20 05:18:51.331205',53),(54,'3f3ebeeb4e',NULL,7000,NULL,'','2020-06-20 05:18:51.717205',54),(55,'d916326158',NULL,7000,NULL,'','2020-06-20 05:18:52.124205',55),(56,'b01edbd051',NULL,7000,NULL,'','2020-06-20 05:18:52.953205',56),(57,'ddbcb1cff6',NULL,7000,NULL,'','2020-06-20 05:18:53.325205',57),(58,'a86f3d8c7a',NULL,7000,NULL,'','2020-06-20 05:18:54.645205',58),(59,'6233b37cbd',NULL,7000,NULL,'','2020-06-20 05:19:02.585205',59),(60,'5626c5d312',NULL,7000,NULL,'','2020-06-20 05:19:03.204205',60),(61,'0cb0dc5cc5',NULL,7000,NULL,'','2020-06-20 05:19:03.609205',61),(62,'8d958b70c6',NULL,7000,NULL,'','2020-06-20 05:19:04.009205',62),(63,'eca78ba47a',NULL,7000,NULL,'','2020-06-20 05:19:04.520205',63),(64,'48f0fce2fe',NULL,7000,NULL,'','2020-06-20 05:19:05.105205',64),(65,'ad0422a0ee',NULL,7000,NULL,'','2020-06-20 05:19:06.487205',65),(66,'996640143c',NULL,7000,NULL,'','2020-06-20 05:19:10.340205',66),(67,'40b40f2aca',NULL,7000,NULL,'','2020-06-20 05:19:10.703205',67),(68,'d3cfcd2137',NULL,7000,NULL,'','2020-06-20 05:19:11.242205',68),(69,'7ab751f854',NULL,7000,NULL,'','2020-06-20 05:42:21.089205',69),(70,'0875c0717e',NULL,7000,NULL,'','2020-06-20 05:42:21.799205',70),(71,'30a51037d6',NULL,7000,NULL,'','2020-06-20 05:42:22.499205',71),(72,'2cd2d52c0a',NULL,7000,NULL,'','2020-06-20 05:42:23.807205',72),(73,'b273a367d4',NULL,7000,NULL,'','2020-06-20 05:42:25.341205',73),(74,'6b5ddfd840',NULL,7000,NULL,'','2020-06-20 05:42:25.610205',74),(75,'2aa6ea3cf0',NULL,7000,NULL,'','2020-06-20 05:42:26.313205',75),(76,'34c525562e',NULL,7000,NULL,'','2020-06-20 05:42:26.850205',76),(77,'955e09b82a',NULL,7000,NULL,'','2020-06-20 05:42:27.311205',77),(78,'f2acb55513',NULL,7000,NULL,'','2020-06-20 05:42:27.655205',78),(79,'40a865fc6c',NULL,7000,NULL,'','2020-06-20 05:42:27.965205',79),(80,'22b088196d',NULL,7000,NULL,'','2020-06-20 05:42:28.248205',80),(81,'afef1b0e39',NULL,7000,NULL,'','2020-06-20 05:42:28.543205',81),(82,'85ba5a738a',NULL,7000,NULL,'','2020-06-20 05:44:04.183205',82),(83,'c2af0ff4d7',NULL,7000,NULL,'','2020-06-20 05:44:06.440205',83),(84,'1f349d7856',NULL,7000,NULL,'','2020-06-20 05:44:07.392205',84),(85,'1e048329a5',NULL,7000,NULL,'','2020-06-20 05:44:07.600205',85),(86,'2426866837',NULL,7000,NULL,'','2020-06-20 05:44:07.780205',86),(87,'e09662209b',NULL,7000,NULL,'','2020-06-20 05:44:12.718205',87),(88,'ebd2b044a0',NULL,7000,NULL,'','2020-06-20 05:44:12.885205',88),(89,'e56809d0e3',NULL,7000,NULL,'','2020-06-20 05:44:13.054205',89),(90,'fd7c585793',NULL,7000,NULL,'','2020-06-20 05:44:13.240205',90),(91,'222a50b567',NULL,7000,NULL,'','2020-06-20 05:44:13.411205',91),(92,'0f77ef8c77',NULL,7000,NULL,'','2020-06-20 05:44:13.612205',92),(93,'97c9a51093',NULL,7000,NULL,'','2020-06-20 05:44:13.778205',93),(94,'60bce7da58',NULL,7000,NULL,'','2020-06-20 05:44:13.955205',94),(95,'de2b0f7ce9',NULL,7000,NULL,'','2020-06-20 05:44:14.134205',95),(96,'f9b3df2ca8',NULL,7000,NULL,'','2020-06-20 05:44:14.634205',96),(97,'1e5bdc37a3',NULL,7000,NULL,'','2020-06-20 05:44:14.795205',97),(98,'6a7ac4c803',NULL,7000,NULL,'','2020-06-20 05:44:14.954205',98),(99,'a50d136b63',NULL,7000,NULL,'','2020-06-20 05:44:15.120205',99),(100,'a734a2c3dd',NULL,7000,NULL,'','2020-06-20 05:44:15.272205',100),(101,'4979964550',NULL,7000,NULL,'','2020-06-20 05:44:15.437205',101),(102,'03b2d9caa1',NULL,7000,NULL,'','2020-06-20 05:44:17.117205',102),(103,'b22bd959d2',NULL,7000,NULL,'','2020-06-20 05:44:17.307205',103),(104,'ed6c582188',NULL,7000,NULL,'','2020-06-20 05:44:17.517205',104),(105,'0bac564406',NULL,7000,NULL,'','2020-06-20 05:44:17.698205',105),(106,'fcf98203fb',NULL,7000,NULL,'','2020-06-20 05:44:17.864205',106),(107,'77d928a147',NULL,7000,NULL,'','2020-06-20 05:44:18.044205',107),(108,'46fc81fb19',NULL,7000,NULL,'','2020-06-20 05:44:18.274205',108),(109,'f5e538396a',NULL,7000,NULL,'','2020-06-20 05:44:19.032205',109),(110,'aa3cbb0f30',NULL,7000,NULL,'','2020-06-20 05:44:22.009205',110),(111,'48e5340df2',NULL,7000,NULL,'','2020-06-20 05:44:22.163205',111),(112,'3b2bc01368',NULL,7000,NULL,'','2020-06-20 05:44:22.711205',112),(113,'4cb4b13120',NULL,7000,NULL,'','2020-06-20 05:44:22.879205',113),(114,'7082be28ee',NULL,7000,NULL,'','2020-06-20 05:44:23.038205',114),(115,'6aa8065cb9',NULL,7000,NULL,'','2020-06-20 05:44:23.266205',115),(116,'c6a768a33a',NULL,7000,NULL,'','2020-06-20 05:44:23.752205',116),(117,'118729af6f',NULL,7000,NULL,'','2020-06-20 05:44:23.977205',117),(118,'b30df2067b',NULL,23000,NULL,'','2020-06-20 05:45:18.834205',118),(119,'a2a8e1e05d',NULL,23000,NULL,'','2020-06-20 05:45:19.139205',119),(120,'7ca2271a92',NULL,23000,NULL,'','2020-06-20 05:45:19.304205',120),(121,'77b350463c',NULL,23000,NULL,'','2020-06-20 05:45:19.488205',121),(122,'64001a7d51',NULL,23000,NULL,'','2020-06-20 05:45:19.665205',122),(123,'929008ecb7',NULL,23000,NULL,'','2020-06-20 05:45:20.138205',123),(124,'2ed7992226',NULL,23000,NULL,'','2020-06-20 05:45:20.333205',124),(125,'0143eb4481',NULL,23000,NULL,'','2020-06-20 05:45:20.488205',125),(126,'911bea3559',NULL,23000,NULL,'','2020-06-20 05:45:20.653205',126),(127,'51ef8ef534',NULL,23000,NULL,'','2020-06-20 05:45:20.815205',127),(128,'38e856fac3',NULL,23000,NULL,'','2020-06-20 05:45:20.988205',128),(129,'8a77e7d7ed',NULL,23000,NULL,'','2020-06-20 05:58:52.432205',129),(130,'6d6b685f56',NULL,23000,NULL,'','2020-06-20 05:58:53.994205',130),(131,'a70dcc425d',NULL,23000,NULL,'','2020-06-20 05:58:54.282205',131),(132,'644267ba1c',NULL,23000,NULL,'','2020-06-20 05:58:54.738205',132),(133,'8ef282d0c4',NULL,23000,NULL,'','2020-06-20 05:58:55.116205',133),(134,'7a52d812f3',NULL,23000,NULL,'','2020-06-20 05:58:55.390205',134),(135,'70d8d88002',NULL,23000,NULL,'','2020-06-20 05:58:55.669205',135),(136,'80a34b6944',NULL,23000,NULL,'','2020-06-20 05:58:55.904205',136),(137,'5c18e8e993',NULL,23000,NULL,'','2020-06-20 05:59:48.528205',137),(138,'17866a6b2d',NULL,23000,NULL,'','2020-06-20 05:59:49.567205',138),(139,'468717ec91',NULL,23000,NULL,'','2020-06-20 05:59:51.461205',139),(140,'6d2ef7f7bf',NULL,23000,NULL,'','2020-06-20 06:05:29.212205',140),(141,'e9d6edef6f',NULL,23000,NULL,'','2020-06-20 06:05:29.856205',141),(142,'dfc196de02',NULL,23000,NULL,'','2020-06-20 06:05:30.078205',142),(143,'9f4c569d24',NULL,23000,NULL,'','2020-06-20 06:05:30.474205',143),(144,'06bfef20a8',NULL,23000,NULL,'','2020-06-20 06:05:32.231205',144),(145,'8e537b3aa5',NULL,23000,NULL,'','2020-06-20 06:05:32.422205',145),(146,'57f9b878af',NULL,23000,NULL,'','2020-06-20 06:05:32.663205',146),(147,'ffc8864139',NULL,23000,NULL,'','2020-06-20 06:05:32.876205',147),(148,'6af13afd8f',NULL,23000,NULL,'','2020-06-20 06:05:33.060205',148),(149,'3f2ea50a60',NULL,23000,NULL,'','2020-06-20 06:05:33.311205',149),(150,'3478de0eda',NULL,23000,NULL,'','2020-06-20 06:06:32.172205',150),(151,'31cc7daf40',NULL,23000,NULL,'','2020-06-20 06:06:33.083205',151),(152,'f10304a0d6',NULL,23000,NULL,'','2020-06-20 06:06:33.796205',152),(153,'78fc5b7f0e',NULL,12000,NULL,'','2020-06-20 06:06:57.482205',153),(154,'ad3bb8f8df',NULL,12000,NULL,'','2020-06-20 06:06:58.237205',154),(155,'b719f96111',NULL,12000,NULL,'','2020-06-20 06:07:04.912205',155),(156,'04b9c98d7b',NULL,12000,NULL,'','2020-06-20 06:07:05.066205',156),(157,'04649e726f',NULL,12000,NULL,'','2020-06-20 06:07:05.847205',157),(158,'cf223090da',NULL,12000,NULL,'','2020-06-20 06:07:06.029205',158),(159,'42dac9534a',NULL,12000,NULL,'','2020-06-20 06:07:07.000205',159),(160,'28a6b72718',NULL,12000,NULL,'','2020-06-20 06:07:08.167205',160),(161,'1c45a5f340',NULL,12000,NULL,'','2020-06-20 06:07:08.324205',161),(162,'3f920fd5b7',NULL,12000,NULL,'','2020-06-20 06:07:09.027205',162),(163,'636239da31',NULL,12000,NULL,'','2020-06-20 06:07:09.218205',163),(164,'c9c90e9abf',NULL,12000,NULL,'','2020-06-20 06:07:10.659205',164),(165,'a03e09a3b7',NULL,12000,NULL,'','2020-06-20 06:07:10.855205',165),(166,'18e87cd62b',NULL,12000,NULL,'','2020-06-20 06:15:34.714205',166),(167,'4482e50f7f',NULL,0,NULL,'','2020-06-20 06:15:50.240205',167),(168,'8934a4b544',NULL,12000,NULL,'','2020-06-20 06:16:07.422205',168),(169,'69780d9328',NULL,12000,NULL,'','2020-06-20 06:19:55.324205',169),(170,'2b7cac08a6',NULL,12000,NULL,'','2020-06-20 09:31:33.887205',170),(171,'a03d8927ac',NULL,22000,NULL,'','2020-06-20 09:33:11.398205',171);
/*!40000 ALTER TABLE `order_ordertransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_category`
--

DROP TABLE IF EXISTS `shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `meta_description` longtext NOT NULL,
  `slug` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `shop_category_name_11b68823` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_category`
--

LOCK TABLES `shop_category` WRITE;
/*!40000 ALTER TABLE `shop_category` DISABLE KEYS */;
INSERT INTO `shop_category` VALUES (1,'무드등/네온','','무드등네온'),(2,'미니어처','','미니어처'),(3,'BEST','','best'),(4,'NEW','','new'),(5,'어른이 장난감','','어른이-장난감'),(6,'집 콕~옥 세일','','집-콕옥-세일'),(7,'식물','','식물');
/*!40000 ALTER TABLE `shop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product`
--

DROP TABLE IF EXISTS `shop_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `meta_description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int unsigned NOT NULL,
  `available_display` tinyint(1) NOT NULL,
  `available_order` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `shop_product_category_id_14d7eea8_fk_shop_category_id` (`category_id`),
  KEY `shop_product_name_b8d5e94c` (`name`),
  KEY `shop_product_id_slug_68aad32e_idx` (`id`,`slug`),
  CONSTRAINT `shop_product_category_id_14d7eea8_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`),
  CONSTRAINT `shop_product_chk_1` CHECK ((`stock` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product`
--

LOCK TABLES `shop_product` WRITE;
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` VALUES (1,'diy 복숭아 케이크 버블바, 베쓰밤','diy-복숭아-케이크-버블바-베쓰밤','products/2020/06/19/베스트1_복숭아케이크버블바베쓰밤입욕제만들기키트50000_H3z5zAp.jpg','귀엽고 이쁘기 까지한 베쓰밤을 직접 만들어 보아요','',20000.00,5,1,1,'2020-06-19 22:42:10.138205','2020-06-19 22:42:10.138205',3),(2,'알록달록 비즈 악세서리 만들기','알록달록-비즈-악세서리-만들기','products/2020/06/19/신상1_알록달록비즈악세서리만들기키트15000_CIU0r4q.jpg','알록달록한 비즈로 나만의 악세서리를 만들어 보아요','',13000.00,5,1,1,'2020-06-19 22:43:00.564205','2020-06-19 22:43:00.564205',4),(3,'장미 무드등','장미-무드등','products/2020/06/19/무드1_시간이먼춘장미무드등20000_2gPv3TH.png','시간이 멈춘듯한 장미무드등으로 분위기를 즐겨보세요','',16000.00,5,1,1,'2020-06-19 22:43:35.447205','2020-06-19 22:43:35.447205',1),(4,'미니어처하우스','미니어처하우스','products/2020/06/19/미니1_미니어처하우스10000_oqHXOTr.jpg','보기만 해도 행복해지는 미니어처의 세계','',15000.00,6,1,1,'2020-06-19 22:44:36.668205','2020-06-19 22:44:36.668205',2),(5,'무지개 목화 나무 만들기','무지개-목화-나무-만들기','products/2020/06/19/식물1_무지개목화나무만들기20000_p1dz6uq.jpg','','',17000.00,6,1,1,'2020-06-19 22:45:05.045205','2020-06-19 22:45:05.045205',7),(6,'대왕 햄스터 블록','대왕-햄스터-블록','products/2020/06/19/어른1_햄스터블럭조립25000_30eVtfk.jpg','왕크니까 왕귀여운 햄스터를 블록으로 직접 조립해 보아요','',16000.00,5,1,1,'2020-06-19 22:45:49.077205','2020-06-19 22:45:49.077205',5),(7,'휴대용 젤리곰 비누 만들기','휴대용-젤리곰-비누-만들기','products/2020/06/19/베스트3_젤리곰휴대용비누만들기20000_XDO6Qv9.gif','집 코~옥 세일 !  집에서 귀여운 젤리곰 모양의 휴대용 비누를 만들어 보아요','',12000.00,3,1,1,'2020-06-19 22:46:54.742205','2020-06-19 22:46:54.743205',6),(8,'코바늘 수세미 만들기','코바늘-수세미-만들기','products/2020/06/20/베스트6_코바늘_달걀후라이수세미만들기10000.jpg','코바늘로 귀여운 계란후라이 모양 수세미를 직접 만들어 보아요','',12000.00,5,1,1,'2020-06-20 09:20:54.954205','2020-06-20 09:20:54.954205',3),(9,'알록달록 마카롱 비누 만들기','알록달록-마카롱-비누-만들기','products/2020/06/20/신상2_알록달록마카롱비누만들기9900.jpg','알록달록한 귀여운 나만의 마카롱 비누를 만들어 보아요','',13000.00,5,0,1,'2020-06-20 09:22:06.397205','2020-06-20 09:30:21.514205',4),(10,'레트로크리스마스 미니어처','레트로크리스마스-미니어처','products/2020/06/20/미니3_레트로크리스마스미니어처하우스20000.jpg','레트로감성의 크리스마스 미니어처','',18000.00,5,0,1,'2020-06-20 09:22:48.455205','2020-06-20 09:30:21.541205',2),(11,'캘리그라피 아크릴 무드등 만들기','캘리그라피-아크릴-무드등-만들기','products/2020/06/20/무드3_썻다지웠따캘리그라피아크릴무드등만들기.png','썻다 지웠다 할 수 있는 캘리그라피 아크릴 무드등을 만들어 보아요','',18000.00,5,0,1,'2020-06-20 09:24:00.906205','2020-06-20 09:29:24.237205',1),(12,'인형 양초','인형-양초','products/2020/06/20/집콕1_39000-16900.jpg','인형같은 양초','',8000.00,5,0,1,'2020-06-20 09:24:55.049205','2020-06-20 09:29:24.254205',5);
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
INSERT INTO `socialaccount_socialaccount` VALUES (1,'naver','128440030','2020-06-20 05:43:47.251205','2020-06-20 00:17:59.986205','{\"id\": \"128440030\", \"email\": \"alstn9961@naver.com\", \"name\": \"\\uc774\\ud604\\uc21c\"}',2);
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp` VALUES (1,'naver','네이버 로그인','1iXX8sO8rha1Fy7y2TI9','ie6kLQGMFb','');
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `socialapp_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp_sites` VALUES (1,1,1);
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
INSERT INTO `socialaccount_socialtoken` VALUES (1,'AAAAOdVfTK2rOqZ5ZkJcddbAeXj0vna86mFNZdo4dgXoR9Ia3uB04yyw9g3a9elCY5wbgPp0EQYlbkG7eG0EEdaQVzA','tQGhooZApJsAPeYuyZo2XA8Rqw9BPb4sisipcNVg45yb1IhMePlpHt5WxVdMr8tQfFQbOE2y45AhDOpj2GUxI3jJ5Eh3m5THB0D96ON6ToJFEkWp6zZq5n3ejZjgWq9cy0','2020-06-20 06:43:47.185205',1,1);
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-20  9:49:49
