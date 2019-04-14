/*
SQLyog Ultimate v8.55 
MySQL - 5.1.36-community : Database - querytrain
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`querytrain` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `querytrain`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `adminid` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`adminid`,`password`) values ('admin','admin');

/*Table structure for table `assigntrains` */

DROP TABLE IF EXISTS `assigntrains`;

CREATE TABLE `assigntrains` (
  `assignid` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `trainid` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  PRIMARY KEY (`assignid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `assigntrains` */

insert  into `assigntrains`(`assignid`,`source`,`destination`,`trainid`,`points`) values (2,'mysore','bangalore',2,4),(4,'bangalore','mysore',4,4),(5,'bangalore','mangalore',3,4);

/*Table structure for table `routes` */

DROP TABLE IF EXISTS `routes`;

CREATE TABLE `routes` (
  `routesid` int(11) NOT NULL AUTO_INCREMENT,
  `stationid` int(11) DEFAULT NULL,
  `assignid` int(11) DEFAULT NULL,
  `arrival` varchar(255) DEFAULT NULL,
  `dept` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`routesid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `routes` */

insert  into `routes`(`routesid`,`stationid`,`assignid`,`arrival`,`dept`) values (5,2,2,'10.30','10.45'),(6,5,2,'11.30','11.35'),(7,7,2,'12.15','12.20'),(8,3,2,'13.30','13.45'),(10,3,4,'10.30','10.45'),(11,7,4,'12.00','12.05'),(12,5,4,'12.30','12.35'),(13,2,4,'13.30','13.45'),(14,3,5,'10.30','10.45'),(15,6,5,'11.40','11.45'),(16,14,5,'12.30','12.35'),(17,4,5,'13.30','13.45');

/*Table structure for table `stations` */

DROP TABLE IF EXISTS `stations`;

CREATE TABLE `stations` (
  `stationid` int(11) NOT NULL AUTO_INCREMENT,
  `stationname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stationid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `stations` */

insert  into `stations`(`stationid`,`stationname`) values (2,'Mysore'),(3,'Bangalore'),(4,'Mangalore'),(5,'Mandya'),(6,'Madikeri'),(7,'Maddur'),(8,'Chanpatna'),(9,'Ramnagara'),(10,'Kengeri'),(11,'KR Nagar'),(12,'Hole Narsipura'),(13,'Hassan'),(14,'puttur');

/*Table structure for table `trains` */

DROP TABLE IF EXISTS `trains`;

CREATE TABLE `trains` (
  `trainid` int(11) NOT NULL AUTO_INCREMENT,
  `trainname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`trainid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `trains` */

insert  into `trains`(`trainid`,`trainname`) values (2,'Tippu Express'),(3,'Mangalore Express'),(4,'Kaveri Express'),(5,'Yashwanthpur Express');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
