/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : pmims

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-03-01 17:24:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activist
-- ----------------------------
DROP TABLE IF EXISTS `activist`;
CREATE TABLE `activist` (
  `activistId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  PRIMARY KEY (`activistId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activist
-- ----------------------------
INSERT INTO `activist` VALUES ('fb9a7e3b0f454041e809af90232652dd4fcd', '201510', '7a6a15d5gy1fd67pmg15tj21hc0xcas1.jpg', '2019-02-28', '0', '0');

-- ----------------------------
-- Table structure for activisthelp
-- ----------------------------
DROP TABLE IF EXISTS `activisthelp`;
CREATE TABLE `activisthelp` (
  `phoneNum0` varchar(255) DEFAULT NULL,
  `phoneNum1` varchar(255) DEFAULT NULL,
  `name0` varchar(255) DEFAULT NULL,
  `name1` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `index` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activisthelp
-- ----------------------------

-- ----------------------------
-- Table structure for development
-- ----------------------------
DROP TABLE IF EXISTS `development`;
CREATE TABLE `development` (
  `developmentId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  PRIMARY KEY (`developmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of development
-- ----------------------------
INSERT INTO `development` VALUES ('3b0309e5033ea04ed90bee904b5432d62d3d', '201510', 'export (1).xlsx', '2019-02-28', '0', '2');
INSERT INTO `development` VALUES ('d242b10b09d4904ea70808f09894443e6fbb', '201510', '7a6a15d5gy1fd67pmg15tj21hc0xcas1.jpg', '2019-02-28', '0', '1');

-- ----------------------------
-- Table structure for partymember
-- ----------------------------
DROP TABLE IF EXISTS `partymember`;
CREATE TABLE `partymember` (
  `partyMemberId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  PRIMARY KEY (`partyMemberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of partymember
-- ----------------------------

-- ----------------------------
-- Table structure for probationary
-- ----------------------------
DROP TABLE IF EXISTS `probationary`;
CREATE TABLE `probationary` (
  `probationaryId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  PRIMARY KEY (`probationaryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of probationary
-- ----------------------------
INSERT INTO `probationary` VALUES ('e9d71583094a4046fb0a1870165f1695a337', '201510', 'system-20190226142543.zip', '2019-02-28', '0', '0');

-- ----------------------------
-- Table structure for proposer
-- ----------------------------
DROP TABLE IF EXISTS `proposer`;
CREATE TABLE `proposer` (
  `proposerId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  PRIMARY KEY (`proposerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proposer
-- ----------------------------
INSERT INTO `proposer` VALUES ('39c5744c0ea03049320ae540cc9ba8d9cfcf', '201510', '7a6a15d5gy1fd67pmg15tj21hc0xcas1.jpg', '2019-02-28', '0', '0');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `userId` varchar(255) NOT NULL,
  `classInfo` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `homeAddress` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `IDcardNum` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `headImg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('201510', '2015级网络工程', '0', null, '美国白宫', '0', 'dfsfsdafdsa', '特朗普', '美国', null);
INSERT INTO `student` VALUES ('201511', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201512', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201513', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201514', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201515', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201516', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201517', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201518', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201519', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201520', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201521', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201522', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201523', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201524', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201525', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201526', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201527', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201528', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201530', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201531', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201532', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201533', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201534', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201535', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201536', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201537', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201538', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201539', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201540', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201541', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201542', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201543', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201544', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201545', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201546', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201547', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201548', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201549', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201550', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201551', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201552', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201553', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201554', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201555', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201556', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201557', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201558', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201559', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201560', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201561', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201562', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201563', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201564', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201565', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201566', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201567', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201568', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201569', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201570', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201571', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201572', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201573', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201574', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201575', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201576', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201577', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201578', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201579', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201580', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201581', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201582', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201583', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201584', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201585', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201586', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201587', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201588', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201589', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201590', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201591', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201592', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201593', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201594', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201595', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201596', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201597', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201598', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201599', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201600', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201601', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201602', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201603', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201604', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201605', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201606', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201607', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201608', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201609', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201610', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201611', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201612', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201613', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201614', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201615', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201616', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201617', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201618', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201619', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201620', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201621', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201622', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201623', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201624', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201625', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201626', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201627', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201628', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201629', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201630', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201631', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201632', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201633', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201634', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201635', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201636', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201637', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201638', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201639', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201640', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201641', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201642', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201643', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201644', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201645', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201646', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201647', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201648', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201649', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201650', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201651', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201652', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201653', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201654', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201655', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201656', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201657', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201658', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201659', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201660', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201661', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201662', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201663', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201664', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201665', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201666', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201667', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201668', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201669', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201670', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201671', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201672', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201673', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201674', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201675', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201676', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201677', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201678', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201679', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201680', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201681', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201682', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201683', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201684', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201685', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201686', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201687', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201688', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201689', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201690', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201691', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201692', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201693', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201694', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201695', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201696', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201697', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201698', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201699', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201700', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201701', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201702', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201703', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201704', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201705', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201706', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201707', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201708', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201709', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201710', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201711', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201712', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201713', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201714', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201715', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201716', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201717', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201718', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201719', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201720', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201721', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201722', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201723', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201724', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201725', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201726', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201727', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201728', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201729', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201730', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201731', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201732', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201733', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201734', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201735', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201736', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201737', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201738', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201739', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201740', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201741', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201742', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201743', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201744', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201745', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201746', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201747', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201748', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201749', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201750', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201751', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201752', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201753', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201754', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201755', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201756', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201757', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201758', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201759', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201760', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201761', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201762', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201763', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201764', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201765', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201766', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201767', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201768', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201769', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201770', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201771', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201772', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201773', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201774', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201775', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201776', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201777', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201778', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201779', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201780', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201781', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201782', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201783', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201784', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201785', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201786', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201787', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201788', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201789', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201790', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201791', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201792', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201793', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201794', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201795', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201796', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201797', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201798', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201799', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201800', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201801', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201802', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201803', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201804', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201805', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201806', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201807', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201808', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201809', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201810', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201811', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201812', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201813', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201814', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201815', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201816', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201817', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201818', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201819', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201820', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201821', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201822', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201823', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201824', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201825', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201826', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201827', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201828', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201829', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201830', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201831', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201832', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201833', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201834', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201835', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201836', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201837', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201838', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201839', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201840', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201841', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201842', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201843', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201844', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201845', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201846', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201847', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201848', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201849', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201850', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201851', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201852', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201853', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201854', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201855', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201856', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201857', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201858', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201859', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201860', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201861', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201862', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201863', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201864', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201865', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201866', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201867', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201868', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201869', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201870', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201871', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201872', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201873', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201874', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201875', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201876', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201877', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201878', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201879', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201880', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201881', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201882', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201883', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201884', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201885', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201886', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201887', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201888', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201889', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201890', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201891', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201892', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201893', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201894', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201895', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201896', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201897', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201898', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201899', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201900', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201901', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201902', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201903', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201904', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201905', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201906', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201907', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201908', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201909', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201910', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201911', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201912', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201913', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201914', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201915', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201916', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201917', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201918', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201919', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201920', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201921', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201922', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201923', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201924', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201925', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201926', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201927', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201928', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201929', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201930', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201931', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201932', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201933', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201934', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201935', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201936', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201937', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201938', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201939', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201940', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201941', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201942', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201943', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);
INSERT INTO `student` VALUES ('201944', '2015级网络工程', '1', null, '美国白宫', '0', '123', '安德森', '美国', null);

-- ----------------------------
-- Table structure for uploadinfo
-- ----------------------------
DROP TABLE IF EXISTS `uploadinfo`;
CREATE TABLE `uploadinfo` (
  `userId` varchar(255) NOT NULL,
  `index` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uploadinfo
-- ----------------------------
INSERT INTO `uploadinfo` VALUES ('201510', '1', '1', '1');
INSERT INTO `uploadinfo` VALUES ('201510', '0', '1', '1');
INSERT INTO `uploadinfo` VALUES ('201510', '2', '1', '1');
INSERT INTO `uploadinfo` VALUES ('201510', '3', '1', '1');
INSERT INTO `uploadinfo` VALUES ('201510', null, null, null);
INSERT INTO `uploadinfo` VALUES ('201510', '5', '1', '1');
INSERT INTO `uploadinfo` VALUES ('201510', '6', '1', '1');
INSERT INTO `uploadinfo` VALUES ('201510', '7', '1', '1');

-- ----------------------------
-- Table structure for uploadinstruction
-- ----------------------------
DROP TABLE IF EXISTS `uploadinstruction`;
CREATE TABLE `uploadinstruction` (
  `instruction` text,
  `status` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `index` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uploadinstruction
-- ----------------------------
INSERT INTO `uploadinstruction` VALUES ('申请人1', '0', '0', '0');
INSERT INTO `uploadinstruction` VALUES ('申请人2', '0', '0', '1');
INSERT INTO `uploadinstruction` VALUES ('积极分子1', '0', '1', '0');
INSERT INTO `uploadinstruction` VALUES ('积极分子2', '0', '1', '1');
INSERT INTO `uploadinstruction` VALUES ('积极分子3', '0', '1', '2');
INSERT INTO `uploadinstruction` VALUES ('积极分子4', '0', '1', '3');
INSERT INTO `uploadinstruction` VALUES ('积极分子5', '0', '1', '4');
INSERT INTO `uploadinstruction` VALUES ('积极分子6', '0', '1', '5');
INSERT INTO `uploadinstruction` VALUES ('积极分子7', '0', '1', '6');
INSERT INTO `uploadinstruction` VALUES ('积极分子8', '0', '1', '7');
INSERT INTO `uploadinstruction` VALUES ('发展对象1', '0', '2', '0');
INSERT INTO `uploadinstruction` VALUES ('发展对象2', '0', '2', '1');
INSERT INTO `uploadinstruction` VALUES ('发展对象3', '0', '2', '2');
INSERT INTO `uploadinstruction` VALUES ('发展对象4', '0', '2', '3');
INSERT INTO `uploadinstruction` VALUES ('发展对象5', '0', '2', '4');
INSERT INTO `uploadinstruction` VALUES ('发展对象6', '0', '2', '5');
INSERT INTO `uploadinstruction` VALUES ('发展对象7', '0', '2', '6');
INSERT INTO `uploadinstruction` VALUES ('发展对象8', '0', '2', '7');
INSERT INTO `uploadinstruction` VALUES ('发展对象9', '0', '2', '8');
INSERT INTO `uploadinstruction` VALUES ('发展对象10', '0', '2', '9');
INSERT INTO `uploadinstruction` VALUES ('发展对象11', '0', '2', '10');
INSERT INTO `uploadinstruction` VALUES ('发展对象12', '0', '2', '11');
INSERT INTO `uploadinstruction` VALUES ('发展对象13', '0', '2', '12');
INSERT INTO `uploadinstruction` VALUES ('发展对象14', '0', '2', '13');
INSERT INTO `uploadinstruction` VALUES ('发展对象15', '0', '2', '14');
INSERT INTO `uploadinstruction` VALUES ('发展对象16', '0', '2', '15');
INSERT INTO `uploadinstruction` VALUES ('预备党员1', '0', '3', '0');
INSERT INTO `uploadinstruction` VALUES ('预备党员2', '0', '3', '1');
INSERT INTO `uploadinstruction` VALUES ('预备党员3', '0', '3', '2');
INSERT INTO `uploadinstruction` VALUES ('预备党员4', '0', '3', '3');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` varchar(255) NOT NULL,
  `userPwd` varchar(255) NOT NULL,
  `userPermission` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `userPath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('201510', '96e79218965eb72c92a549dd5a330112', '0', '0', '3ec73daeabe5354471f6e2c53a70bc39201510_201957');
INSERT INTO `user` VALUES ('201511', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201512', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201513', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201514', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201515', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201516', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201517', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201518', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201519', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201520', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201521', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201522', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201523', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201524', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201525', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201526', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201527', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201528', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201529', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201530', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201531', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201532', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201533', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201534', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201535', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201536', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201537', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201538', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201539', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201540', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201541', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201542', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201543', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201544', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201545', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201546', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201547', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201548', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201549', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201550', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201551', '96e79218965eb72c92a549dd5a330112', '0', '0', null);
INSERT INTO `user` VALUES ('201552', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201553', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201554', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201555', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201556', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201557', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201558', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201559', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201560', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201561', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201562', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201563', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201564', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201565', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201566', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201567', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201568', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201569', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201570', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201571', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201572', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201573', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201574', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201575', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201576', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201577', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201578', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201579', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201580', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201581', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201582', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201583', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201584', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201585', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201586', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201587', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201588', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201589', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201590', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201591', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201592', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201593', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201594', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201595', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201596', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201597', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201598', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201599', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201600', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201601', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201602', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201603', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201604', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201605', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201606', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201607', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201608', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201609', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201610', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201611', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201612', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201613', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201614', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201615', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201616', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201617', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201618', '96e79218965eb72c92a549dd5a330112', '1', '0', null);
INSERT INTO `user` VALUES ('201619', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201620', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201621', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201622', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201623', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201624', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201625', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201626', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201627', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201628', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201629', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201630', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201631', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201632', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201633', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201634', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201635', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201636', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201637', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201638', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201639', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201640', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201641', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201642', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201643', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201644', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201645', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201646', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201647', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201648', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201649', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201650', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201651', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201652', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201653', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201654', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201655', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201656', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201657', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201658', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201659', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201660', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201661', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201662', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201663', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201664', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201665', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201666', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201667', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201668', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201669', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201670', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201671', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201672', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201673', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201674', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201675', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201676', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201677', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201678', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201679', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201680', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201681', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201682', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201683', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201684', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201685', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201686', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201687', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201688', '96e79218965eb72c92a549dd5a330112', '2', '0', null);
INSERT INTO `user` VALUES ('201689', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201690', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201691', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201692', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201693', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201694', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201695', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201696', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201697', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201698', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201699', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201700', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201701', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201702', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201703', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201704', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201705', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201706', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201707', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201708', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201709', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201710', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201711', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201712', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201713', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201714', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201715', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201716', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201717', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201718', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201719', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201720', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201721', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201722', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201723', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201724', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201725', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201726', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201727', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201728', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201729', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201730', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201731', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201732', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201733', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201734', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201735', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201736', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201737', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201738', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201739', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201740', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201741', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201742', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201743', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201744', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201745', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201746', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201747', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201748', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201749', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201750', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201751', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201752', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201753', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201754', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201755', '96e79218965eb72c92a549dd5a330112', '3', '0', null);
INSERT INTO `user` VALUES ('201756', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201757', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201758', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201759', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201760', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201761', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201762', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201763', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201764', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201765', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201766', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201767', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201768', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201769', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201770', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201771', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201772', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201773', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201774', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201775', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201776', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201777', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201778', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201779', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201780', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201781', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201782', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201783', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201784', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201785', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201786', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201787', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201788', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201789', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201790', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201791', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201792', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201793', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201794', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201795', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201796', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201797', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201798', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201799', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201800', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201801', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201802', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201803', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201804', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201805', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201806', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201807', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201808', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201809', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201810', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201811', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201812', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201813', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201814', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201815', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201816', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201817', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201818', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201819', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201820', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201821', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201822', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201823', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201824', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201825', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201826', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201827', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201828', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201829', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201830', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201831', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201832', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201833', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201834', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201835', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201836', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201837', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201838', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201839', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201840', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201841', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201842', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201843', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201844', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201845', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201846', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201847', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201848', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201849', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201850', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201851', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201852', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201853', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201854', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201855', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201856', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201857', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201858', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201859', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201860', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201861', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201862', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201863', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201864', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201865', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201866', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201867', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201868', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201869', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201870', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201871', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201872', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201873', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201874', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201875', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201876', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201877', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201878', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201879', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201880', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201881', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201882', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201883', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201884', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201885', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201886', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201887', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201888', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201889', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201890', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201891', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201892', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201893', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201894', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201895', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201896', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201897', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201898', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201899', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201900', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201901', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201902', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201903', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201904', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201905', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201906', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201907', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201908', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201909', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201910', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201911', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201912', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201913', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201914', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201915', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201916', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201917', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201918', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201919', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201920', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201921', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201922', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201923', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201924', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201925', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201926', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201927', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201928', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201929', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201930', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201931', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201932', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201933', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201934', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201935', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201936', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201937', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201938', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201939', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201940', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201941', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201942', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201943', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('201944', '96e79218965eb72c92a549dd5a330112', '4', '0', null);
INSERT INTO `user` VALUES ('a001', '96e79218965eb72c92a549dd5a330112', '5', '0', null);
INSERT INTO `user` VALUES ('admin', '96e79218965eb72c92a549dd5a330112', '6', '0', null);

-- ----------------------------
-- View structure for basalinfo
-- ----------------------------
DROP VIEW IF EXISTS `basalinfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `basalinfo` AS select `user`.`userId` AS `userId`,`user`.`userPermission` AS `userPermission`,`user`.`status` AS `userStatus`,`student`.`classInfo` AS `classInfo`,`student`.`sex` AS `sex`,`student`.`homeAddress` AS `homeAddress`,`student`.`status` AS `status`,`student`.`IDcardNum` AS `IDcardNum`,`student`.`name` AS `name`,`student`.`position` AS `position` from (`user` join `student` on((`user`.`userId` = `student`.`userId`))) ;
