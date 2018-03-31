/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.17 : Database - magic
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`magic` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `magic`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cateName` varchar(500) DEFAULT NULL,
  `createTime` varchar(500) DEFAULT NULL,
  `updateTime` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`cateName`,`createTime`,`updateTime`) values (1,'3D打印','1461065581131','1463840279570'),(5,'珠宝首饰','1461087797195','1463840254550'),(6,'电商平台','1461141027193','1463840240026'),(10,'房地产','1461316392919','1463840230593'),(11,'文博工艺品','1461322678871','1463840195473'),(13,'家居家装','1461569604710','1463840215845'),(14,'数字医疗','1463840289453','1463840289453'),(15,'精品展示','1463840359361','1463840359361');

/*Table structure for table `items` */

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemdiscript` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `items` */

insert  into `items`(`id`,`itemname`,`itemdiscript`) values (1,'医药','医药医药'),(2,'房产','房产房产'),(3,'旅游','旅游旅游旅游');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(500) DEFAULT NULL,
  `backgroundColor` varchar(500) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `keywords` varchar(500) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `fileName` varchar(500) DEFAULT NULL,
  `createTime` varchar(500) DEFAULT NULL,
  `updateTime` varchar(500) DEFAULT NULL,
  `cateId` int(11) DEFAULT NULL,
  `startX` varchar(10) DEFAULT NULL,
  `startY` varchar(10) DEFAULT NULL,
  `thumbImage` varchar(500) DEFAULT NULL,
  `showType` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`productName`,`backgroundColor`,`title`,`keywords`,`description`,`fileName`,`createTime`,`updateTime`,`cateId`,`startX`,`startY`,`thumbImage`,`showType`) values (7,'fangkouping','#000000','方口瓶','方口瓶','通高3.96米，含底座、树身、龙三部分。底座圈上三个拱形足如同树根，主干上三层树枝，均弯曲下垂，树枝尖端有花朵果实，其上均有立鸟，全树共九只鸟。主干侧有一身似绳索的残龙。这株铸造于3000年前的青铜神树，极为壮观，真可算是独树一帜，举世无双。','fangkouping','1461322727703','1464503556181',15,'3','46','1464503556174.jpg','1');

/*Table structure for table `register` */

DROP TABLE IF EXISTS `register`;

CREATE TABLE `register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `register` */

insert  into `register`(`id`,`name`,`phone`,`address`) values (1,'张三','122222',' 长沙'),(2,'李四','23423','衡阳'),(3,'王五','2342343','上海');

/*Table structure for table `uitems` */

DROP TABLE IF EXISTS `uitems`;

CREATE TABLE `uitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registerid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemsid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `uitems` */

insert  into `uitems`(`id`,`registerid`,`itemsid`,`redid`) values (1,'1','1','1'),(2,'2','2','1');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`) values (1,'admin','111');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
