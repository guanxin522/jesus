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
  `aid` varchar(20) NOT NULL COMMENT '管理员ID',
  `aname` varchar(20) DEFAULT NULL COMMENT '管理员用户名',
  `apwd` varchar(20) DEFAULT NULL COMMENT '管理员密码',
  `status` tinyint(3) DEFAULT NULL COMMENT '管理员权限状态',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

LOCK TABLES `admin` WRITE;

insert  into `admin`(`aid`,`aname`,`apwd`,`status`) values ('1','admin','admin',NULL);

UNLOCK TABLES;

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cid` varchar(30) NOT NULL COMMENT '购物车ID',
  `uid` varchar(30) DEFAULT NULL COMMENT '用户ID',
  `fid` varchar(30) DEFAULT NULL COMMENT '食品ID',
  `quantity` varchar(10) DEFAULT NULL COMMENT '数量',
  `ctime` datetime DEFAULT NULL COMMENT '加入时间',
  PRIMARY KEY (`cid`),
  KEY `uid` (`uid`),
  KEY `fid` (`fid`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`fid`) REFERENCES `food` (`fid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cart` */

LOCK TABLES `cart` WRITE;

UNLOCK TABLES;

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `id` varchar(30) NOT NULL COMMENT '意见反馈ID',
  `uid` varchar(30) DEFAULT NULL COMMENT '用户ID',
  `title` varchar(100) DEFAULT NULL COMMENT '意见反馈标题',
  `content` varchar(255) DEFAULT NULL COMMENT '意见反馈内容',
  `status` tinyint(3) DEFAULT NULL COMMENT '意见反馈状态',
  `time` datetime DEFAULT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `feedback` */

LOCK TABLES `feedback` WRITE;

UNLOCK TABLES;

/*Table structure for table `food` */

DROP TABLE IF EXISTS `food`;

CREATE TABLE `food` (
  `fid` varchar(30) NOT NULL COMMENT '食品ID',
  `fname` varchar(20) DEFAULT NULL COMMENT '食品名称',
  `fdescri` varchar(50) DEFAULT NULL COMMENT '食品描述',
  `fprice` decimal(10,1) DEFAULT NULL COMMENT '食品价格',
  `fimage` varchar(250) DEFAULT NULL COMMENT '食品图片路径',
  `fvolume` int(10) DEFAULT '0' COMMENT '食品销量',
  `time` datetime DEFAULT NULL COMMENT '最后一次修改时间',
  `status` tinyint(3) DEFAULT '0' COMMENT '0下架，1上架，2banner图',
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `food` */

LOCK TABLES `food` WRITE;

insert  into `food`(`fid`,`fname`,`fdescri`,`fprice`,`fimage`,`fvolume`,`time`,`status`) values ('F-20171012195129319-F375CB','黄焖Jimmy饭','黄焖Jimmy，好香啊！！！','12.0','/upload/2.jpg',0,'2017-10-13 23:56:58',2),('F-20171012200815436-E9B7C1','爆炒小龙虾','回忆里的味道，我知道','9.9','/upload/3.jpg',0,'2017-10-13 23:58:09',2),('F-20171013235909109-B4ED66','杨枝甘露','当芒果爱上你','8.5','/upload/8.jpg',0,'2017-10-13 23:59:09',1);

UNLOCK TABLES;

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `oid` varchar(30) NOT NULL COMMENT '订单ID',
  `uid` varchar(30) DEFAULT NULL COMMENT '用户ID',
  `otime` datetime DEFAULT NULL COMMENT '订单时间',
  `ostatus` varchar(2) DEFAULT NULL COMMENT '订单状态，0未付款，1已付款（送货中）,2送货完成,3交易完成，4申请退款 5退款完成，6订单关闭',
  `oprice` decimal(10,2) DEFAULT NULL COMMENT '订单总价',
  PRIMARY KEY (`oid`),
  KEY `uid` (`uid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

LOCK TABLES `orders` WRITE;

UNLOCK TABLES;

/*Table structure for table `orderson` */

DROP TABLE IF EXISTS `orderson`;

CREATE TABLE `orderson` (
  `osid` varchar(30) NOT NULL COMMENT '订单子表ID',
  `oid` varchar(30) DEFAULT NULL COMMENT '订单ID',
  `fid` varchar(30) DEFAULT NULL COMMENT '食品ID',
  `fprice` decimal(10,2) DEFAULT NULL COMMENT '食品价格',
  `quantity` varchar(10) DEFAULT NULL COMMENT '食品数量',
  PRIMARY KEY (`osid`),
  KEY `oid` (`oid`),
  KEY `fid` (`fid`),
  CONSTRAINT `orderson_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderson_ibfk_2` FOREIGN KEY (`fid`) REFERENCES `food` (`fid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderson` */

LOCK TABLES `orderson` WRITE;

UNLOCK TABLES;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `uid` varchar(30) NOT NULL COMMENT '用户ID',
  `uname` varchar(20) DEFAULT NULL COMMENT '用户名',
  `upwd` varchar(30) DEFAULT NULL COMMENT '用户密码',
  `realname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `tel` varchar(20) DEFAULT NULL COMMENT '手机',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(60) DEFAULT NULL COMMENT '地址',
  `balance` decimal(10,1) DEFAULT '0.0' COMMENT '余额',
  `time` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

LOCK TABLES `users` WRITE;

insert  into `users`(`uid`,`uname`,`upwd`,`realname`,`tel`,`email`,`address`,`balance`,`time`) values ('1','xin','123456','陈观鑫','13570325854',NULL,'广东省广州市花都区新华街道学府路1号华南理工大学广州学院C16栋','0.0','2017-10-09 11:04:42'),('2','123123','123456',NULL,NULL,NULL,NULL,'0.0','2017-10-09 11:04:40'),('U-20170925215603940-DC19C9','qqqqqq','123456','山鸡哥','13570325959','43232323232@qq.com','北京路步行街','0.0','2017-10-07 14:31:37'),('U-20170926180229198-9F252B','q490861319','q5585309','陈观鑫','13570325854','490861319@qq.com','到大家爱搜附近搜集','0.0','2017-10-09 11:04:43');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
