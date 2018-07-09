/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.5.56-MariaDB : Database - serverlists
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`serverlists` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `serverlists`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add base_types',7,'add_base_types'),(20,'Can change base_types',7,'change_base_types'),(21,'Can delete base_types',7,'delete_base_types'),(22,'Can add configurations',8,'add_configurations'),(23,'Can change configurations',8,'change_configurations'),(24,'Can delete configurations',8,'delete_configurations'),(25,'Can add hardware_accessories',9,'add_hardware_accessories'),(26,'Can change hardware_accessories',9,'change_hardware_accessories'),(27,'Can delete hardware_accessories',9,'delete_hardware_accessories'),(28,'Can add configuration_lists',10,'add_configuration_lists'),(29,'Can change configuration_lists',10,'change_configuration_lists'),(30,'Can delete configuration_lists',10,'delete_configuration_lists');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values (1,'pbkdf2_sha256$36000$7KNxqB8hKPde$Gih6BD3MUUvPaMWHJhFAo9Dd8OCmJdxiUjVQunOMX6c=','2018-07-04 07:26:03',1,'bswifiadmin','','','zhouyuhe@yunbs.com',1,1,'2018-07-04 07:25:02');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values (1,'2018-07-04 08:10:44','1','base_types object',1,'[{\"added\": {}}]',7,1),(2,'2018-07-04 08:28:51','2','base_types object',1,'[{\"added\": {}}]',7,1),(3,'2018-07-04 08:29:00','2','base_types object',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',7,1),(4,'2018-07-04 08:29:17','2','base_types object',2,'[{\"changed\": {\"fields\": [\"name\", \"comment\"]}}]',7,1),(5,'2018-07-04 08:29:23','1','base_types object',2,'[{\"changed\": {\"fields\": [\"comment\"]}}]',7,1),(6,'2018-07-04 08:29:34','3','base_types object',1,'[{\"added\": {}}]',7,1),(7,'2018-07-04 08:31:14','4','base_types object',1,'[{\"added\": {}}]',7,1),(8,'2018-07-04 08:31:37','5','base_types object',1,'[{\"added\": {}}]',7,1),(9,'2018-07-04 08:31:50','6','base_types object',1,'[{\"added\": {}}]',7,1),(10,'2018-07-04 08:32:01','4','base_types object',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',7,1),(11,'2018-07-04 08:32:08','5','base_types object',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',7,1),(12,'2018-07-04 08:32:40','7','base_types object',1,'[{\"added\": {}}]',7,1),(13,'2018-07-04 08:32:59','8','base_types object',1,'[{\"added\": {}}]',7,1),(14,'2018-07-04 08:33:07','9','base_types object',1,'[{\"added\": {}}]',7,1),(15,'2018-07-04 08:33:48','10','base_types object',1,'[{\"added\": {}}]',7,1),(16,'2018-07-04 08:33:59','11','base_types object',1,'[{\"added\": {}}]',7,1),(17,'2018-07-04 08:35:02','12','base_types object',1,'[{\"added\": {}}]',7,1),(18,'2018-07-04 08:35:07','13','base_types object',1,'[{\"added\": {}}]',7,1),(19,'2018-07-04 08:35:14','14','base_types object',1,'[{\"added\": {}}]',7,1),(20,'2018-07-04 08:35:28','15','base_types object',1,'[{\"added\": {}}]',7,1),(21,'2018-07-04 08:35:41','16','base_types object',1,'[{\"added\": {}}]',7,1),(22,'2018-07-04 08:35:47','17','base_types object',1,'[{\"added\": {}}]',7,1),(23,'2018-07-04 08:35:53','18','base_types object',1,'[{\"added\": {}}]',7,1),(24,'2018-07-04 08:35:59','19','base_types object',1,'[{\"added\": {}}]',7,1),(25,'2018-07-04 08:36:51','20','base_types object',1,'[{\"added\": {}}]',7,1),(26,'2018-07-04 08:37:06','21','base_types object',1,'[{\"added\": {}}]',7,1),(27,'2018-07-04 08:37:20','22','base_types object',1,'[{\"added\": {}}]',7,1),(28,'2018-07-04 08:37:25','23','base_types object',1,'[{\"added\": {}}]',7,1),(29,'2018-07-04 08:37:28','24','base_types object',1,'[{\"added\": {}}]',7,1),(30,'2018-07-04 08:37:37','25','base_types object',1,'[{\"added\": {}}]',7,1),(31,'2018-07-04 08:37:42','26','base_types object',1,'[{\"added\": {}}]',7,1),(32,'2018-07-04 08:37:47','27','base_types object',1,'[{\"added\": {}}]',7,1),(33,'2018-07-04 08:37:50','28','base_types object',1,'[{\"added\": {}}]',7,1),(34,'2018-07-04 08:38:27','29','base_types object',1,'[{\"added\": {}}]',7,1),(35,'2018-07-04 08:38:31','30','base_types object',1,'[{\"added\": {}}]',7,1),(36,'2018-07-04 08:38:35','31','base_types object',1,'[{\"added\": {}}]',7,1),(37,'2018-07-04 08:38:39','32','base_types object',1,'[{\"added\": {}}]',7,1),(38,'2018-07-04 08:38:44','33','base_types object',1,'[{\"added\": {}}]',7,1),(39,'2018-07-04 08:41:26','34','base_types object',1,'[{\"added\": {}}]',7,1),(40,'2018-07-04 08:41:42','35','base_types object',1,'[{\"added\": {}}]',7,1),(41,'2018-07-04 08:41:53','36','base_types object',1,'[{\"added\": {}}]',7,1),(42,'2018-07-04 08:42:11','37','base_types object',1,'[{\"added\": {}}]',7,1),(43,'2018-07-04 08:42:53','38','base_types object',1,'[{\"added\": {}}]',7,1),(44,'2018-07-04 08:43:34','39','base_types object',1,'[{\"added\": {}}]',7,1),(45,'2018-07-04 08:43:51','40','base_types object',1,'[{\"added\": {}}]',7,1),(46,'2018-07-04 08:44:07','41','base_types object',1,'[{\"added\": {}}]',7,1),(47,'2018-07-04 08:45:01','42','base_types object',1,'[{\"added\": {}}]',7,1),(48,'2018-07-04 08:45:13','43','base_types object',1,'[{\"added\": {}}]',7,1),(49,'2018-07-04 09:18:30','1','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(50,'2018-07-04 09:18:53','2','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(51,'2018-07-04 09:19:01','3','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(52,'2018-07-04 09:19:31','4','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(53,'2018-07-04 09:19:37','5','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(54,'2018-07-04 09:19:43','6','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(55,'2018-07-04 09:19:57','7','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(56,'2018-07-04 09:20:17','8','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(57,'2018-07-04 09:20:43','9','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(58,'2018-07-04 09:20:48','10','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(59,'2018-07-04 09:20:52','11','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(60,'2018-07-04 09:20:57','12','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(61,'2018-07-04 09:21:23','13','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(62,'2018-07-04 09:24:33','13','hardware_accessories object',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(63,'2018-07-04 09:25:29','14','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(64,'2018-07-04 09:25:42','15','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(65,'2018-07-04 09:25:58','16','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(66,'2018-07-04 09:26:10','17','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(67,'2018-07-04 09:26:22','18','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(68,'2018-07-04 09:26:34','19','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(69,'2018-07-04 09:27:18','20','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(70,'2018-07-04 09:27:44','21','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(71,'2018-07-04 09:28:48','22','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(72,'2018-07-04 09:29:03','23','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(73,'2018-07-04 09:29:16','24','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(74,'2018-07-04 09:29:36','25','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(75,'2018-07-04 09:30:25','22','hardware_accessories object',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(76,'2018-07-04 09:30:59','26','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(77,'2018-07-04 09:31:37','27','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(78,'2018-07-04 09:33:06','28','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(79,'2018-07-04 09:33:43','29','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(80,'2018-07-04 09:33:49','30','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(81,'2018-07-04 09:33:55','31','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(82,'2018-07-04 09:34:02','32','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(83,'2018-07-04 09:34:10','33','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(84,'2018-07-04 09:34:16','34','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(85,'2018-07-04 09:34:34','35','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(86,'2018-07-04 09:34:44','36','hardware_accessories object',1,'[{\"added\": {}}]',9,1),(87,'2018-07-04 10:00:44','15','2 * Intel/SSD/DC/S3520/Series/（480GB/2.5in/SATA/6Gb/s/16nm/3D NAND）',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(88,'2018-07-04 10:00:54','16','2 * Intel/SSD/DC/S3520/Series/（800GB/2.5in/SATA/6Gb/s/16nm/3D NAND）',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(89,'2018-07-04 10:01:04','17','2 * Intel/SSD/DC/S3520/Series/（960GB/2.5in/SATA/6Gb/s/16nm/3D NAND）',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(90,'2018-07-04 10:01:13','18','2 * Intel/SSD/DC/S3520/Series/（1.2T/2.5in/SATA/6Gb/s/16nm/3D NAND）',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(91,'2018-07-04 10:01:20','19','2 * Intel/SSD/DC/S3520/Series/（1.6T/2.5in/SATA/6Gb/s/16nm/3D NAND）',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(92,'2018-07-04 10:04:38','37','默认主板',1,'[{\"added\": {}}]',9,1),(93,'2018-07-04 10:04:56','1','Intel S2600CP',2,'[{\"changed\": {\"fields\": [\"comment\"]}}]',9,1),(94,'2018-07-04 10:05:09','1','默认主板 Intel S2600CP',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(95,'2018-07-04 10:06:01','37','Intel S2600CO',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(96,'2018-07-04 10:07:02','1','1000台及以下 纯审计 配置1',1,'[{\"added\": {}}]',8,1),(97,'2018-07-04 10:07:41','38','3 * 16GB/DDR3 800/1066/1333/1600MHz',1,'[{\"added\": {}}]',9,1),(98,'2018-07-04 10:08:07','38','3 * 16GB/DDR3 800/1066/1333/1600MHz',2,'[{\"changed\": {\"fields\": [\"comment\"]}}]',9,1),(99,'2018-07-04 10:08:58','2','1000台及以下 纯审计 配置2',1,'[{\"added\": {}}]',8,1),(100,'2018-07-04 10:10:18','1','1000台及以下 纯审计',1,'[{\"added\": {}}]',10,1),(101,'2018-07-04 10:10:58','44','1个月离线查询',1,'[{\"added\": {}}]',7,1),(102,'2018-07-04 10:11:03','45','2个月离线查询',1,'[{\"added\": {}}]',7,1),(103,'2018-07-04 10:11:06','46','3个月离线查询',1,'[{\"added\": {}}]',7,1),(104,'2018-07-04 10:11:32','1','1000台及以下 纯审计',2,'[{\"changed\": {\"fields\": [\"offline\"]}}]',10,1),(105,'2018-07-05 05:35:54','1','1000台及以下 纯审计',2,'[{\"changed\": {\"fields\": [\"configuration\"]}}]',10,1),(106,'2018-07-05 05:36:06','1','1000台及以下 纯审计',2,'[]',10,1),(107,'2018-07-05 05:36:38','1','1000台及以下 纯审计',2,'[{\"changed\": {\"fields\": [\"configuration\"]}}]',10,1),(108,'2018-07-05 10:14:01','46','3个月离线查询1',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',7,1),(109,'2018-07-05 10:14:08','46','3个月离线查询',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',7,1),(110,'2018-07-09 02:14:48','39','1台',1,'[{\"added\": {}}]',9,1),(111,'2018-07-09 02:15:01','40','2台',1,'[{\"added\": {}}]',9,1),(112,'2018-07-09 02:15:08','41','3台',1,'[{\"added\": {}}]',9,1),(113,'2018-07-09 02:15:19','42','4台',1,'[{\"added\": {}}]',9,1),(114,'2018-07-09 02:15:29','43','5台',1,'[{\"added\": {}}]',9,1),(115,'2018-07-09 02:30:00','1','1000台及以下 纯审计',2,'[{\"changed\": {\"fields\": [\"realtime\", \"configuration\", \"bandwith\"]}}]',10,1),(116,'2018-07-09 03:01:31','1','1000台及以下 纯审计 - 配置',2,'[{\"changed\": {\"fields\": [\"name\", \"memory\"]}}]',8,1),(117,'2018-07-09 03:02:04','1','1000台及以下 纯审计',2,'[{\"changed\": {\"fields\": [\"bandwith\"]}}]',10,1),(118,'2018-07-09 03:02:58','1','1000台及以下 纯审计1',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',10,1),(119,'2018-07-09 03:03:44','2','1000台及以下 纯审计2',1,'[{\"added\": {}}]',10,1),(120,'2018-07-09 03:04:58','3','1000台及以下 纯审计3',1,'[{\"added\": {}}]',10,1),(121,'2018-07-09 03:05:16','1','1000台及以下 纯审计 - 配置1',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',8,1),(122,'2018-07-09 03:05:33','2','1000台及以下 纯审计 - 配置2',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',8,1),(123,'2018-07-09 03:06:15','2','1000台及以下 纯审计2',2,'[{\"changed\": {\"fields\": [\"configuration\"]}}]',10,1),(124,'2018-07-09 03:07:09','2','1000台及以下 纯审计2',2,'[{\"changed\": {\"fields\": [\"realtime\", \"offline\", \"configuration\"]}}]',10,1),(125,'2018-07-09 03:07:30','3','1000台及以下 纯审计3',2,'[{\"changed\": {\"fields\": [\"realtime\", \"offline\", \"configuration\"]}}]',10,1),(126,'2018-07-09 03:10:22','4','1000台及以下 纯审计4',1,'[{\"added\": {}}]',10,1),(127,'2018-07-09 03:10:55','5','1000台及以下 纯审计5',1,'[{\"added\": {}}]',10,1),(128,'2018-07-09 03:11:37','6','1000台及以下 纯审计6',1,'[{\"added\": {}}]',10,1),(129,'2018-07-09 03:11:52','6','1000台及以下 纯审计6',2,'[{\"changed\": {\"fields\": [\"offline\"]}}]',10,1),(130,'2018-07-09 03:12:28','7','1000台及以下 纯审计7',1,'[{\"added\": {}}]',10,1);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'servers','base_types'),(8,'servers','configurations'),(10,'servers','configuration_lists'),(9,'servers','hardware_accessories'),(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2018-07-04 07:23:38'),(2,'auth','0001_initial','2018-07-04 07:23:39'),(3,'admin','0001_initial','2018-07-04 07:23:39'),(4,'admin','0002_logentry_remove_auto_add','2018-07-04 07:23:39'),(5,'contenttypes','0002_remove_content_type_name','2018-07-04 07:23:39'),(6,'auth','0002_alter_permission_name_max_length','2018-07-04 07:23:39'),(7,'auth','0003_alter_user_email_max_length','2018-07-04 07:23:39'),(8,'auth','0004_alter_user_username_opts','2018-07-04 07:23:39'),(9,'auth','0005_alter_user_last_login_null','2018-07-04 07:23:39'),(10,'auth','0006_require_contenttypes_0002','2018-07-04 07:23:39'),(11,'auth','0007_alter_validators_add_error_messages','2018-07-04 07:23:39'),(12,'auth','0008_alter_user_username_max_length','2018-07-04 07:23:39'),(13,'sessions','0001_initial','2018-07-04 07:23:39'),(14,'servers','0001_initial','2018-07-04 07:57:10'),(15,'servers','0002_auto_20180704_1554','2018-07-04 07:57:10'),(16,'servers','0003_auto_20180704_1556','2018-07-04 07:57:10'),(17,'servers','0004_auto_20180704_1609','2018-07-04 08:09:48'),(18,'servers','0005_auto_20180704_1716','2018-07-04 09:16:36'),(19,'servers','0006_auto_20180704_1723','2018-07-04 09:24:04'),(20,'servers','0007_auto_20180704_1759','2018-07-04 09:59:33'),(21,'servers','0008_auto_20180704_1803','2018-07-04 10:03:45'),(22,'servers','0009_auto_20180705_1334','2018-07-05 05:34:49'),(23,'servers','0010_base_types_tags','2018-07-05 07:26:41'),(24,'servers','0011_auto_20180705_1756','2018-07-05 09:56:56'),(25,'servers','0012_configurations_category','2018-07-06 03:07:24'),(26,'servers','0013_auto_20180707_1738','2018-07-07 09:38:44'),(27,'servers','0014_configurations_count','2018-07-07 09:49:35'),(28,'servers','0015_auto_20180709_1007','2018-07-09 02:07:52'),(29,'servers','0016_configurations_count','2018-07-09 02:16:42'),(30,'servers','0017_auto_20180709_1059','2018-07-09 03:00:02'),(31,'servers','0018_auto_20180709_1358','2018-07-09 05:58:36');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('imbrqn6sa9fi7zsqscgsvbhqj7xzcyzs','ZWQzOGM1OGU2MTRiMzhjMWIyN2QxMzZkMjlmNDYwYmJkMGY2M2UxZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImIzNWQ3M2M1MTM1YWEwYzczZWM4OWNjNzIyOGRlNmZjOTVjYjdjNjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-07-18 07:26:03');

/*Table structure for table `servers_base_types` */

DROP TABLE IF EXISTS `servers_base_types`;

CREATE TABLE `servers_base_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` smallint(6) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `tags` varchar(100) NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `servers_base_types_name_14646fcd_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

/*Data for the table `servers_base_types` */

insert  into `servers_base_types`(`id`,`type`,`name`,`status`,`comment`,`tags`,`order`) values (1,1,'审计平台',1,'审计平台','1',1),(2,1,'管综平台',1,'管综平台','2',2),(3,1,'车辆平台',1,'车辆平台','3',3),(4,2,'1000台及以下 纯审计',1,'','1',1),(5,2,'1000台及以下 审计+嗅探',1,'','1',2),(6,2,'2000台及以下 纯审计',1,'','1',3),(7,2,'2000台及以下 审计+嗅探',1,'','1,2',4),(8,2,'5000台及以下 纯审计',1,'','1,2',5),(9,2,'5000台及以下 审计+嗅探',1,'','2',6),(10,2,'10000台及以下 纯审计',1,'','1,2',7),(11,2,'10000台及以下 审计+嗅探',1,'','2',8),(12,2,'1万台物联网车辆设备',1,'','3',9),(13,2,'10万台物联网车辆设备',1,'','3',10),(14,2,'20万台物联网车辆设备',1,'','3',11),(15,2,'50万台物联网车辆设备',1,'','3',12),(16,2,'100万台物联网车辆设备',1,'','3',13),(17,2,'200万台物联网车辆设备',1,'','3',14),(18,2,'500万台物联网车辆设备',1,'','3',15),(19,2,'1000万台物联网车辆设备',0,'','3',16),(20,3,'七天实时查询',1,'','4,5,6,7,8,10',1),(21,3,'半个月实时查询',1,'','4,5,6,7,8,10',2),(22,3,'1个月实时查询',1,'','4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19',3),(23,3,'2个月实时查询',1,'','7,8,9,10,11,12,13,14,15,16,17,18,19',4),(24,3,'3个月实时查询',1,'','7,8,9,10,11,12,13,14,15,16,17,18,19',5),(25,3,'半年实时查询',1,'','7,8,9,10,11,12,13,14,15,16,17,18,19',6),(26,3,'1年实时查询',1,'','7,8,9,10,11,12,13,14,15,16,17,18,19',7),(27,3,'2年实时查询',1,'','7,8,9,10,11,12,13,14,15,16,17,18,19',8),(28,3,'3年实时查询',0,'','7,8,9,10,11,12,13,14,15,16,17,18,19',9),(29,4,'半年离线查询',1,'','20,21,22,23,24,25,26,27,28',4),(30,4,'1年离线查询',1,'','20,21,22,23,24,25,26,27,28',5),(31,4,'2年离线查询',1,'','20,21,22,23,24,25,26,27,28',6),(32,4,'3年离线查询',1,'','20,21,22,23,24,25,26,27,28',7),(33,4,'5年离线查询',0,'','20,21,22,23,24,25,26,27,28',8),(34,5,'PHP单机整合服务',1,'','4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19',1),(35,5,'PHP应用与接品服务',1,'','4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19',2),(36,5,'MYSQL数据库服务',1,'','4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19',3),(37,5,'负载均衡服务',1,'','4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19',4),(38,5,'FTP上报与转发服务',1,'','4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19',5),(39,5,'PHP转发数据服务',1,'','4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19',6),(40,5,'ES集群服务',1,'','4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19',7),(41,5,'Hadoop集群服务',1,'','4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19',8),(42,5,'PHP网站服务',1,'','4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19',9),(43,5,'PHP接口服务',1,'','4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19',10),(44,4,'1个月离线查询',1,'','20,21',1),(45,4,'2个月离线查询',1,'','20,21',2),(46,4,'3个月离线查询',1,'','20,21',3);

/*Table structure for table `servers_configuration_lists` */

DROP TABLE IF EXISTS `servers_configuration_lists`;

CREATE TABLE `servers_configuration_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `status` smallint(6) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `device_id` int(11) NOT NULL,
  `offline_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL,
  `realtime_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `order` smallint(6) NOT NULL,
  `bandwith_id` int(11) NOT NULL,
  `count` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `servers_configuration_li_platform_id_device_id_re_2bd5a51c_uniq` (`platform_id`,`device_id`,`realtime_id`,`offline_id`),
  UNIQUE KEY `servers_configuration_lists_name_953f9870_uniq` (`name`),
  KEY `servers_configuratio_device_id_4c12466b_fk_servers_b` (`device_id`),
  KEY `servers_configuratio_offline_id_b36c8997_fk_servers_b` (`offline_id`),
  KEY `servers_configuratio_realtime_id_f1d0de97_fk_servers_b` (`realtime_id`),
  KEY `servers_configuratio_service_id_c50e47b9_fk_servers_b` (`service_id`),
  KEY `servers_configuratio_bandwith_id_c94c6ea3_fk_servers_h` (`bandwith_id`),
  CONSTRAINT `servers_configuratio_bandwith_id_c94c6ea3_fk_servers_h` FOREIGN KEY (`bandwith_id`) REFERENCES `servers_hardware_accessories` (`id`),
  CONSTRAINT `servers_configuratio_device_id_4c12466b_fk_servers_b` FOREIGN KEY (`device_id`) REFERENCES `servers_base_types` (`id`),
  CONSTRAINT `servers_configuratio_offline_id_b36c8997_fk_servers_b` FOREIGN KEY (`offline_id`) REFERENCES `servers_base_types` (`id`),
  CONSTRAINT `servers_configuratio_platform_id_c5d2d23f_fk_servers_b` FOREIGN KEY (`platform_id`) REFERENCES `servers_base_types` (`id`),
  CONSTRAINT `servers_configuratio_realtime_id_f1d0de97_fk_servers_b` FOREIGN KEY (`realtime_id`) REFERENCES `servers_base_types` (`id`),
  CONSTRAINT `servers_configuratio_service_id_c50e47b9_fk_servers_b` FOREIGN KEY (`service_id`) REFERENCES `servers_base_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `servers_configuration_lists` */

insert  into `servers_configuration_lists`(`id`,`name`,`status`,`comment`,`device_id`,`offline_id`,`platform_id`,`realtime_id`,`service_id`,`order`,`bandwith_id`,`count`) values (1,'1000台及以下 纯审计1',1,'',4,44,1,20,34,0,29,1),(2,'1000台及以下 纯审计2',1,'',4,45,1,20,34,0,29,1),(3,'1000台及以下 纯审计3',1,'',4,46,1,20,34,0,29,1),(4,'1000台及以下 纯审计4',1,'',4,29,1,20,34,0,29,1),(5,'1000台及以下 纯审计5',1,'',4,30,1,20,34,0,29,1),(6,'1000台及以下 纯审计6',1,'',4,31,1,20,34,0,29,1),(7,'1000台及以下 纯审计7',1,'',4,32,1,20,34,0,29,1);

/*Table structure for table `servers_configuration_lists_configuration` */

DROP TABLE IF EXISTS `servers_configuration_lists_configuration`;

CREATE TABLE `servers_configuration_lists_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_lists_id` int(11) NOT NULL,
  `configurations_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `servers_configuration_li_configuration_lists_id_c_f3ae5918_uniq` (`configuration_lists_id`,`configurations_id`),
  KEY `servers_configuratio_configurations_id_8180d068_fk_servers_c` (`configurations_id`),
  CONSTRAINT `servers_configuratio_configurations_id_8180d068_fk_servers_c` FOREIGN KEY (`configurations_id`) REFERENCES `servers_configurations` (`id`),
  CONSTRAINT `servers_configuratio_configuration_lists__c7ef997a_fk_servers_c` FOREIGN KEY (`configuration_lists_id`) REFERENCES `servers_configuration_lists` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `servers_configuration_lists_configuration` */

insert  into `servers_configuration_lists_configuration`(`id`,`configuration_lists_id`,`configurations_id`) values (1,1,1),(6,2,1),(7,3,1),(8,4,2),(9,5,2),(10,6,2),(11,7,2);

/*Table structure for table `servers_configurations` */

DROP TABLE IF EXISTS `servers_configurations`;

CREATE TABLE `servers_configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `motherboard_id` int(11) NOT NULL,
  `cpu_id` int(11) NOT NULL,
  `memory_id` int(11) NOT NULL,
  `raidcard_id` int(11) NOT NULL,
  `disk1_id` int(11) NOT NULL,
  `disk2_id` int(11) NOT NULL,
  `default_id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `category` smallint(6) NOT NULL,
  `order` smallint(6) NOT NULL,
  `count_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `servers_configurations_name_2e8c13d0_uniq` (`name`),
  KEY `servers_configurations_cpu_id_d3d7f954` (`cpu_id`),
  KEY `servers_configurations_default_id_8b06d6a2` (`default_id`),
  KEY `servers_configurations_disk1_id_93697c72` (`disk1_id`),
  KEY `servers_configurations_disk2_id_613e1f77` (`disk2_id`),
  KEY `servers_configurations_memory_id_5545d940` (`memory_id`),
  KEY `servers_configurations_motherboard_id_a7d37f3e` (`motherboard_id`),
  KEY `servers_configurations_raidcard_id_dc8e77b5` (`raidcard_id`),
  KEY `servers_configuratio_count_id_b7785ad4_fk_servers_h` (`count_id`),
  CONSTRAINT `servers_configuratio_count_id_b7785ad4_fk_servers_h` FOREIGN KEY (`count_id`) REFERENCES `servers_hardware_accessories` (`id`),
  CONSTRAINT `servers_configuratio_cpu_id_d3d7f954_fk_servers_h` FOREIGN KEY (`cpu_id`) REFERENCES `servers_hardware_accessories` (`id`),
  CONSTRAINT `servers_configuratio_default_id_8b06d6a2_fk_servers_h` FOREIGN KEY (`default_id`) REFERENCES `servers_hardware_accessories` (`id`),
  CONSTRAINT `servers_configuratio_disk1_id_93697c72_fk_servers_h` FOREIGN KEY (`disk1_id`) REFERENCES `servers_hardware_accessories` (`id`),
  CONSTRAINT `servers_configuratio_disk2_id_613e1f77_fk_servers_h` FOREIGN KEY (`disk2_id`) REFERENCES `servers_hardware_accessories` (`id`),
  CONSTRAINT `servers_configuratio_memory_id_5545d940_fk_servers_h` FOREIGN KEY (`memory_id`) REFERENCES `servers_hardware_accessories` (`id`),
  CONSTRAINT `servers_configuratio_motherboard_id_a7d37f3e_fk_servers_h` FOREIGN KEY (`motherboard_id`) REFERENCES `servers_hardware_accessories` (`id`),
  CONSTRAINT `servers_configuratio_raidcard_id_dc8e77b5_fk_servers_h` FOREIGN KEY (`raidcard_id`) REFERENCES `servers_hardware_accessories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `servers_configurations` */

insert  into `servers_configurations`(`id`,`name`,`motherboard_id`,`cpu_id`,`memory_id`,`raidcard_id`,`disk1_id`,`disk2_id`,`default_id`,`status`,`comment`,`category`,`order`,`count_id`) values (1,'1000台及以下 纯审计 - 配置1',1,2,38,27,13,20,28,1,'',0,0,39),(2,'1000台及以下 纯审计 - 配置2',1,2,38,27,13,21,28,1,'',0,0,39);

/*Table structure for table `servers_hardware_accessories` */

DROP TABLE IF EXISTS `servers_hardware_accessories`;

CREATE TABLE `servers_hardware_accessories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` smallint(6) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `servers_hardware_accessories_name_29bd8341_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

/*Data for the table `servers_hardware_accessories` */

insert  into `servers_hardware_accessories`(`id`,`type`,`name`,`status`,`comment`,`order`) values (1,1,'默认主板 Intel S2600CP',1,'主板类型',0),(2,2,'1 * Intel Xeon Processor E5-2660V1 8C/16T 2.2GHz 2',1,'',0),(3,2,'2 * Intel Xeon Processor E5-2660V1 8C/16T 2.2GHz 2',1,'',0),(4,3,'1  * 16GB/DDR3 800/1066/1333/1600MHz',1,'',0),(5,3,'2  * 16GB/DDR3 800/1066/1333/1600MHz',1,'',0),(6,3,'4  * 16GB/DDR3 800/1066/1333/1600MHz',1,'',0),(7,3,'6  * 16GB/DDR3 800/1066/1333/1600MHz',1,'',0),(8,3,'8 * 16GB/DDR3 800/1066/1333/1600MHz',1,'',0),(9,3,'10 * 16GB/DDR3 800/1066/1333/1600MHz',1,'',0),(10,3,'12 * 16GB/DDR3 800/1066/1333/1600MHz',1,'',0),(11,3,'14 * 16GB/DDR3 800/1066/1333/1600MHz',1,'',0),(12,3,'16 * 16GB/DDR3 800/1066/1333/1600MHz',1,'',0),(13,4,'2 * Intel/SSD/DC/S3520/Series/（150GB/2.5in/SATA/6Gb/s/16nm/3D NAND）',1,'',0),(14,4,'2 * Intel/SSD/DC/S3520/Series/（240GB/2.5in/SATA/6Gb/s/16nm/3D NAND）',1,'',0),(15,4,'2 * Intel/SSD/DC/S3520/Series/（480GB/2.5in/SATA/6Gb/s/16nm/3D NAND）',1,'',0),(16,4,'2 * Intel/SSD/DC/S3520/Series/（800GB/2.5in/SATA/6Gb/s/16nm/3D NAND）',1,'',0),(17,4,'2 * Intel/SSD/DC/S3520/Series/（960GB/2.5in/SATA/6Gb/s/16nm/3D NAND）',1,'',0),(18,4,'2 * Intel/SSD/DC/S3520/Series/（1.2T/2.5in/SATA/6Gb/s/16nm/3D NAND）',1,'',0),(19,4,'2 * Intel/SSD/DC/S3520/Series/（1.6T/2.5in/SATA/6Gb/s/16nm/3D NAND）',1,'',0),(20,4,'2 * 600GB  10K RPM SAS 12Gbps 2.5 英寸热插拔硬盘,3.5英寸 HYB 托架',1,'',0),(21,4,'4 * 600GB  10K RPM SAS 12Gbps 2.5 英寸热插拔硬盘,3.5英寸 HYB 托架',1,'',0),(22,4,'4 * 4TB  7.2K RPM SAS 3.5英寸 HYB 托架',1,'',0),(23,4,'2 * 1.2TB  10K RPM SAS 12Gbps 2.5 英寸热插拔硬盘,3.5英寸 HYB 托架',1,'',0),(24,4,'4 * 1TB  7.2K RPM SAS 3.5英寸 HYB 托架',1,'',0),(25,4,'4 * 1.2TB  10K RPM SAS 12Gbps 2.5 英寸热插拔硬盘,3.5英寸 HYB 托架',1,'',0),(26,4,'4 * 2TB 7.2K RPM SAS 3.5英寸 HYB 托架',1,'',0),(27,5,'1 * LR382A/8口/SAS 12Gb/半高/PCIe 3.0 x8/DDR3 1GB/SFF8643/支持RAID 0,1,5,6,10,50,60',1,'',0),(28,6,'1 * 上架导轨套件M2 (适用于机柜立柱间距730--870mm) <br>1 * 2U 足额700W品牌服务器电源 <br>4 * 板载千兆网卡',1,'',0),(29,7,'10M 带宽',1,'',0),(30,7,'20M 带宽',1,'',0),(31,7,'50M 带宽',1,'',0),(32,7,'100M 带宽',1,'',0),(33,7,'200M 带宽',1,'',0),(34,7,'500M 带宽',1,'',0),(35,7,'1G 带宽',1,'',0),(36,7,'2G 带宽',1,'',0),(37,1,'Intel S2600CO',1,'主板类型',0),(38,3,'3 * 16GB/DDR3 800/1066/1333/1600MHz',1,'type 3 (内存类型)',0),(39,8,'1台',1,'',0),(40,8,'2台',1,'',0),(41,8,'3台',1,'',0),(42,8,'4台',1,'',0),(43,8,'5台',1,'',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
