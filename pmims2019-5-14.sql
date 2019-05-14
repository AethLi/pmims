/*
Navicat MySQL Data Transfer

Source Server         : local MySql server
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : pmims

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-05-14 18:14:29
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

-- ----------------------------
-- Table structure for activisthelper
-- ----------------------------
DROP TABLE IF EXISTS `activisthelper`;
CREATE TABLE `activisthelper` (
  `phoneNum0` varchar(255) DEFAULT NULL,
  `phoneNum1` varchar(255) DEFAULT NULL,
  `name0` varchar(255) DEFAULT NULL,
  `name1` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activisthelper
-- ----------------------------
INSERT INTO `activisthelper` VALUES ('1', '1', '1', '1', '1', '1');

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

-- ----------------------------
-- Table structure for importedpartymember
-- ----------------------------
DROP TABLE IF EXISTS `importedpartymember`;
CREATE TABLE `importedpartymember` (
  `id` varchar(36) DEFAULT NULL,
  `userId` varchar(36) DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of importedpartymember
-- ----------------------------

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
-- Table structure for partymembershipdues
-- ----------------------------
DROP TABLE IF EXISTS `partymembershipdues`;
CREATE TABLE `partymembershipdues` (
  `userId` varchar(36) NOT NULL,
  `amount` varchar(36) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `createBy` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of partymembershipdues
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

-- ----------------------------
-- Table structure for uploadinfo
-- ----------------------------
DROP TABLE IF EXISTS `uploadinfo`;
CREATE TABLE `uploadinfo` (
  `userId` varchar(36) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uploadinfo
-- ----------------------------

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
  `proposerDate` datetime DEFAULT NULL,
  `activistDate` datetime DEFAULT NULL,
  `developmentDate` datetime DEFAULT NULL,
  `probationaryDate` datetime DEFAULT NULL,
  `partyMemberDate` datetime DEFAULT NULL,
  `registerDate` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', '96e79218965eb72c92a549dd5a330112', '6', '0', null, null, null, null, null, null, null);

-- ----------------------------
-- View structure for basalinfo
-- ----------------------------
DROP VIEW IF EXISTS `basalinfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `basalinfo` AS select `user`.`userId` AS `userId`,`user`.`userPermission` AS `userPermission`,`user`.`status` AS `userStatus`,`student`.`classInfo` AS `classInfo`,`student`.`sex` AS `sex`,`student`.`homeAddress` AS `homeAddress`,`student`.`status` AS `status`,`student`.`IDcardNum` AS `IDcardNum`,`student`.`name` AS `name`,`student`.`position` AS `position` from (`user` join `student` on((`user`.`userId` = `student`.`userId`))) ;
