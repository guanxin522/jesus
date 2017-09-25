/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.17-log : Database - jesus
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jesus` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jesus`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `aid` varchar(20) NOT NULL,
  `aname` varchar(20) DEFAULT NULL,
  `apwd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

LOCK TABLES `admin` WRITE;

UNLOCK TABLES;

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cid` varchar(20) NOT NULL,
  `uid` varchar(20) DEFAULT NULL,
  `fid` varchar(20) DEFAULT NULL,
  `quantity` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cart` */

LOCK TABLES `cart` WRITE;

UNLOCK TABLES;

/*Table structure for table `food` */

DROP TABLE IF EXISTS `food`;

CREATE TABLE `food` (
  `fid` varchar(20) NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `fdescr` varchar(50) DEFAULT NULL,
  `fprice` decimal(10,2) DEFAULT NULL,
  `fimage` varchar(50) DEFAULT NULL,
  `fvolume` varchar(10) DEFAULT NULL,
  `comments` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `food` */

LOCK TABLES `food` WRITE;

UNLOCK TABLES;

/*Table structure for table `oderson` */

DROP TABLE IF EXISTS `oderson`;

CREATE TABLE `oderson` (
  `osid` varchar(20) NOT NULL,
  `oid` varchar(20) DEFAULT NULL,
  `fid` varchar(20) DEFAULT NULL,
  `fprice` decimal(10,2) DEFAULT NULL,
  `quantity` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`osid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `oderson` */

LOCK TABLES `oderson` WRITE;

UNLOCK TABLES;

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `oid` varchar(20) NOT NULL,
  `uid` varchar(20) DEFAULT NULL,
  `otime` datetime DEFAULT NULL,
  `ostatus` varchar(2) DEFAULT NULL,
  `oprice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

LOCK TABLES `orders` WRITE;

UNLOCK TABLES;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `uid` varchar(30) NOT NULL,
  `uname` varchar(20) DEFAULT NULL,
  `upwd` varchar(30) DEFAULT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

LOCK TABLES `users` WRITE;

insert  into `users`(`uid`,`uname`,`upwd`,`realname`,`tel`,`email`,`address`) values ('1','xin','123456','陈观鑫','13570325854',NULL,'广东省广州市花都区新华街道学府路1号华南理工大学广州学院C16栋'),('U-20170925215603940-DC19C9','qqqq','123456','山鸡哥','13570325959','43232323232@qq.com','北京路步行街');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
