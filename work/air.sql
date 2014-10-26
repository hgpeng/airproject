/*
SQLyog v10.2 
MySQL - 5.0.88-community-nt : Database - air
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`air` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `air`;

/*Table structure for table `album_reference` */

DROP TABLE IF EXISTS `album_reference`;

CREATE TABLE `album_reference` (
  `id` int(11) NOT NULL auto_increment,
  `albumId` int(11) NOT NULL COMMENT '相册引用',
  `settingId` int(11) NOT NULL COMMENT '效果簇id',
  `desc` varchar(50) default NULL COMMENT '备注',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `album_reference` */

/*Table structure for table `bg_admin` */

DROP TABLE IF EXISTS `bg_admin`;

CREATE TABLE `bg_admin` (
  `id` int(11) NOT NULL COMMENT '主键',
  `username` varchar(50) NOT NULL COMMENT '登陆名',
  `password` varchar(200) NOT NULL COMMENT '密码',
  `salt` varchar(6) default NULL,
  `nickname` varchar(20) default NULL COMMENT '昵称',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `bg_admin` */

/*Table structure for table `leaves` */

DROP TABLE IF EXISTS `leaves`;

CREATE TABLE `leaves` (
  `id` int(11) NOT NULL auto_increment,
  `content` varchar(300) default NULL COMMENT '留言',
  `contact` varchar(150) default NULL COMMENT '联系方式',
  `status` tinyint(4) default '0' COMMENT '留言状态',
  `createTime` datetime NOT NULL COMMENT '留言时间',
  `replyMan` varchar(20) default NULL COMMENT '回复人',
  `replyContent` text COMMENT '回复意见',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `leaves` */

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '新闻内容',
  `type` tinyint(4) NOT NULL default '0' COMMENT '类型(0：企业，1：媒体)',
  `status` tinyint(4) NOT NULL default '0' COMMENT '状态',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `createMan` varchar(50) NOT NULL COMMENT '创建人',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `news` */

/*Table structure for table `presentation` */

DROP TABLE IF EXISTS `presentation`;

CREATE TABLE `presentation` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `productId` int(11) default NULL COMMENT '产品id',
  `html` text COMMENT '生成的产品介绍页',
  `createTime` datetime default NULL COMMENT '创建时间',
  `createMan` varchar(20) default NULL COMMENT '创建人',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `presentation` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '产品名称',
  `desc` text COMMENT '描述',
  `mainPhoto` char(200) default NULL COMMENT '展示图片',
  `status` tinyint(4) default NULL COMMENT '状态（0：下架，1：上架，2：删除）',
  `templateId` int(11) default NULL COMMENT '对应的产品模板',
  `createTime` datetime default NULL COMMENT '创建时间',
  `createMan` varchar(20) default NULL COMMENT '创建人',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `product` */

/*Table structure for table `product_album` */

DROP TABLE IF EXISTS `product_album`;

CREATE TABLE `product_album` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `path` char(200) NOT NULL COMMENT '图片位置',
  `desc` varchar(200) default NULL COMMENT '备注',
  `productId` int(11) NOT NULL COMMENT '产品关联id',
  `type` tinyint(4) default NULL COMMENT '图片类型（0：普通照，1：展示照）',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `product_album` */

/*Table structure for table `product_template` */

DROP TABLE IF EXISTS `product_template`;

CREATE TABLE `product_template` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `script` text COMMENT '模板内容',
  `status` tinyint(4) default NULL COMMENT '状态',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `product_template` */

/*Table structure for table `template_settings` */

DROP TABLE IF EXISTS `template_settings`;

CREATE TABLE `template_settings` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `templateId` int(11) default NULL COMMENT '模板id',
  `productId` int(11) default NULL COMMENT '产品id',
  `order` tinyint(4) default NULL COMMENT '顺序',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `template_settings` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
