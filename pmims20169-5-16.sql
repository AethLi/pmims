/*
Navicat MySQL Data Transfer

Source Server         : local MySql server
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : pmims

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-05-16 17:22:34
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
INSERT INTO `importedpartymember` VALUES ('10fa5ba00e0c904b1409e230acd094abc1e4', '201510', 'KzFXf20190427084756router.txt', '2019-04-27 00:47:56', '1');

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
  `userId` varchar(36) DEFAULT NULL,
  `amount` varchar(36) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `createBy` varchar(36) DEFAULT NULL
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
INSERT INTO `proposer` VALUES ('f0fb242c005b9042600b82f070b409010c5f', '201510803070', 'ItaoQ2019051604552347288733_cover.jpg', '2019-05-16', '2', '0');

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
INSERT INTO `student` VALUES ('201510602008', '软件工程1班', null, null, null, null, null, '刁刚健', null, null);
INSERT INTO `student` VALUES ('201510801001', '计算机科学与技术', null, null, null, null, null, '谭诗琴', null, null);
INSERT INTO `student` VALUES ('201510801002', '计算机科学与技术', null, null, null, null, null, '杨航', null, null);
INSERT INTO `student` VALUES ('201510801003', '计算机科学与技术', null, null, null, null, null, '周思佚', null, null);
INSERT INTO `student` VALUES ('201510801004', '计算机科学与技术', null, null, null, null, null, '李冲', null, null);
INSERT INTO `student` VALUES ('201510801005', '计算机科学与技术', null, null, null, null, null, '邵志鹏', null, null);
INSERT INTO `student` VALUES ('201510801006', '计算机科学与技术', null, null, null, null, null, '钟学超', null, null);
INSERT INTO `student` VALUES ('201510801007', '计算机科学与技术', null, null, null, null, null, '杨皓', null, null);
INSERT INTO `student` VALUES ('201510801008', '计算机科学与技术', null, null, null, null, null, '付林鑫', null, null);
INSERT INTO `student` VALUES ('201510801009', '计算机科学与技术', null, null, null, null, null, '傅瑞', null, null);
INSERT INTO `student` VALUES ('201510801010', '计算机科学与技术', null, null, null, null, null, '李骁', null, null);
INSERT INTO `student` VALUES ('201510801011', '计算机科学与技术', null, null, null, null, null, '范文科', null, null);
INSERT INTO `student` VALUES ('201510801012', '计算机科学与技术', null, null, null, null, null, '朱子菡', null, null);
INSERT INTO `student` VALUES ('201510801014', '计算机科学与技术', null, null, null, null, null, '邓杰', null, null);
INSERT INTO `student` VALUES ('201510801015', '计算机科学与技术', null, null, null, null, null, '曾惠', null, null);
INSERT INTO `student` VALUES ('201510801016', '计算机科学与技术', null, null, null, null, null, '余凌轩', null, null);
INSERT INTO `student` VALUES ('201510801017', '计算机科学与技术', null, null, null, null, null, '郑尧镡', null, null);
INSERT INTO `student` VALUES ('201510801018', '计算机科学与技术', null, null, null, null, null, '张浩', null, null);
INSERT INTO `student` VALUES ('201510801019', '计算机科学与技术', null, null, null, null, null, '刘慧莹', null, null);
INSERT INTO `student` VALUES ('201510801020', '计算机科学与技术', null, null, null, null, null, '何建德', null, null);
INSERT INTO `student` VALUES ('201510801021', '计算机科学与技术', null, null, null, null, null, '赵龙', null, null);
INSERT INTO `student` VALUES ('201510801022', '计算机科学与技术', null, null, null, null, null, '杜松林', null, null);
INSERT INTO `student` VALUES ('201510801023', '计算机科学与技术', null, null, null, null, null, '范川帅', null, null);
INSERT INTO `student` VALUES ('201510801024', '计算机科学与技术', null, null, null, null, null, '吴超', null, null);
INSERT INTO `student` VALUES ('201510801025', '计算机科学与技术', null, null, null, null, null, '蒋培旭', null, null);
INSERT INTO `student` VALUES ('201510801026', '计算机科学与技术', null, null, null, null, null, '庹中杨', null, null);
INSERT INTO `student` VALUES ('201510801027', '计算机科学与技术', null, null, null, null, null, '陈令', null, null);
INSERT INTO `student` VALUES ('201510801028', '计算机科学与技术', null, null, null, null, null, '王志涛', null, null);
INSERT INTO `student` VALUES ('201510801029', '计算机科学与技术', null, null, null, null, null, '杨兵', null, null);
INSERT INTO `student` VALUES ('201510801030', '计算机科学与技术', null, null, null, null, null, '李志坚', null, null);
INSERT INTO `student` VALUES ('201510801031', '计算机科学与技术', null, null, null, null, null, '尹芳', null, null);
INSERT INTO `student` VALUES ('201510801032', '计算机科学与技术', null, null, null, null, null, '唐锐', null, null);
INSERT INTO `student` VALUES ('201510801033', '计算机科学与技术', null, null, null, null, null, '张龙', null, null);
INSERT INTO `student` VALUES ('201510801034', '计算机科学与技术', null, null, null, null, null, '张洋', null, null);
INSERT INTO `student` VALUES ('201510801035', '计算机科学与技术', null, null, null, null, null, '李杭', null, null);
INSERT INTO `student` VALUES ('201510801036', '计算机科学与技术', null, null, null, null, null, '唐小凡', null, null);
INSERT INTO `student` VALUES ('201510801037', '计算机科学与技术', null, null, null, null, null, '魏俊存', null, null);
INSERT INTO `student` VALUES ('201510801038', '计算机科学与技术', null, null, null, null, null, '杨松林', null, null);
INSERT INTO `student` VALUES ('201510801039', '计算机科学与技术', null, null, null, null, null, '刘旺', null, null);
INSERT INTO `student` VALUES ('201510801040', '计算机科学与技术', null, null, null, null, null, '蒋春旭', null, null);
INSERT INTO `student` VALUES ('201510801041', '计算机科学与技术', null, null, null, null, null, '任成功', null, null);
INSERT INTO `student` VALUES ('201510801042', '计算机科学与技术', null, null, null, null, null, '庞治浩', null, null);
INSERT INTO `student` VALUES ('201510801043', '计算机科学与技术', null, null, null, null, null, '肖黎川', null, null);
INSERT INTO `student` VALUES ('201510801045', '计算机科学与技术', null, null, null, null, null, '陈思源', null, null);
INSERT INTO `student` VALUES ('201510801046', '计算机科学与技术', null, null, null, null, null, '叶丽', null, null);
INSERT INTO `student` VALUES ('201510801047', '计算机科学与技术', null, null, null, null, null, '何代伟', null, null);
INSERT INTO `student` VALUES ('201510801048', '计算机科学与技术', null, null, null, null, null, '高阳', null, null);
INSERT INTO `student` VALUES ('201510801049', '计算机科学与技术', null, null, null, null, null, '陈芳妍', null, null);
INSERT INTO `student` VALUES ('201510801050', '计算机科学与技术', null, null, null, null, null, '史妙灵', null, null);
INSERT INTO `student` VALUES ('201510802001', '信息与计算科学', null, null, null, null, null, '陈静', null, null);
INSERT INTO `student` VALUES ('201510802002', '信息与计算科学', null, null, null, null, null, '黄杰', null, null);
INSERT INTO `student` VALUES ('201510802003', '信息与计算科学', null, null, null, null, null, '朱家鑫', null, null);
INSERT INTO `student` VALUES ('201510802004', '信息与计算科学', null, null, null, null, null, '李向思', null, null);
INSERT INTO `student` VALUES ('201510802005', '信息与计算科学', null, null, null, null, null, '张丽', null, null);
INSERT INTO `student` VALUES ('201510802006', '信息与计算科学', null, null, null, null, null, '蒋仕成', null, null);
INSERT INTO `student` VALUES ('201510802007', '信息与计算科学', null, null, null, null, null, '李杰', null, null);
INSERT INTO `student` VALUES ('201510802008', '信息与计算科学', null, null, null, null, null, '孟蕾', null, null);
INSERT INTO `student` VALUES ('201510802009', '信息与计算科学', null, null, null, null, null, '陈志良', null, null);
INSERT INTO `student` VALUES ('201510802011', '信息与计算科学', null, null, null, null, null, '袁敏', null, null);
INSERT INTO `student` VALUES ('201510802012', '信息与计算科学', null, null, null, null, null, '蒋启彬', null, null);
INSERT INTO `student` VALUES ('201510802013', '信息与计算科学', null, null, null, null, null, '蒋楷', null, null);
INSERT INTO `student` VALUES ('201510802014', '信息与计算科学', null, null, null, null, null, '李鑫', null, null);
INSERT INTO `student` VALUES ('201510802016', '软件工程1班', null, null, null, null, null, '曾小倩', null, null);
INSERT INTO `student` VALUES ('201510802017', '信息与计算科学', null, null, null, null, null, '吴海滔', null, null);
INSERT INTO `student` VALUES ('201510802018', '信息与计算科学', null, null, null, null, null, '刘胜兰', null, null);
INSERT INTO `student` VALUES ('201510802019', '信息与计算科学', null, null, null, null, null, '李福仁', null, null);
INSERT INTO `student` VALUES ('201510802020', '信息与计算科学', null, null, null, null, null, '谢楠', null, null);
INSERT INTO `student` VALUES ('201510802021', '信息与计算科学', null, null, null, null, null, '张朝乾', null, null);
INSERT INTO `student` VALUES ('201510802022', '信息与计算科学', null, null, null, null, null, '赵小钏', null, null);
INSERT INTO `student` VALUES ('201510802023', '信息与计算科学', null, null, null, null, null, '阳治兵', null, null);
INSERT INTO `student` VALUES ('201510802024', '信息与计算科学', null, null, null, null, null, '罗静', null, null);
INSERT INTO `student` VALUES ('201510802025', '信息与计算科学', null, null, null, null, null, '杨鹏', null, null);
INSERT INTO `student` VALUES ('201510802026', '信息与计算科学', null, null, null, null, null, '王瑞', null, null);
INSERT INTO `student` VALUES ('201510802027', '信息与计算科学', null, null, null, null, null, '钟胜', null, null);
INSERT INTO `student` VALUES ('201510802028', '信息与计算科学', null, null, null, null, null, '李浪', null, null);
INSERT INTO `student` VALUES ('201510802029', '信息与计算科学', null, null, null, null, null, '刘婵', null, null);
INSERT INTO `student` VALUES ('201510802030', '信息与计算科学', null, null, null, null, null, '胡古月', null, null);
INSERT INTO `student` VALUES ('201510802031', '信息与计算科学', null, null, null, null, null, '李天宝', null, null);
INSERT INTO `student` VALUES ('201510802032', '信息与计算科学', null, null, null, null, null, '朱昌明', null, null);
INSERT INTO `student` VALUES ('201510802033', '信息与计算科学', null, null, null, null, null, '陈清权', null, null);
INSERT INTO `student` VALUES ('201510802034', '信息与计算科学', null, null, null, null, null, '彭小蓉', null, null);
INSERT INTO `student` VALUES ('201510802035', '信息与计算科学', null, null, null, null, null, '陈永兰', null, null);
INSERT INTO `student` VALUES ('201510802036', '信息与计算科学', null, null, null, null, null, '李宛蔚', null, null);
INSERT INTO `student` VALUES ('201510802037', '信息与计算科学', null, null, null, null, null, '唐洪菊', null, null);
INSERT INTO `student` VALUES ('201510802038', '信息与计算科学', null, null, null, null, null, '游奇', null, null);
INSERT INTO `student` VALUES ('201510802039', '信息与计算科学', null, null, null, null, null, '覃本成', null, null);
INSERT INTO `student` VALUES ('201510802040', '信息与计算科学', null, null, null, null, null, '黄银宋', null, null);
INSERT INTO `student` VALUES ('201510802041', '信息与计算科学', null, null, null, null, null, '黄春燕', null, null);
INSERT INTO `student` VALUES ('201510802042', '信息与计算科学', null, null, null, null, null, '唐仕敏', null, null);
INSERT INTO `student` VALUES ('201510802043', '信息与计算科学', null, null, null, null, null, '代潇', null, null);
INSERT INTO `student` VALUES ('201510802044', '信息与计算科学', null, null, null, null, null, '代翔宇', null, null);
INSERT INTO `student` VALUES ('201510802045', '信息与计算科学', null, null, null, null, null, '李林', null, null);
INSERT INTO `student` VALUES ('201510802046', '信息与计算科学', null, null, null, null, null, '金国民', null, null);
INSERT INTO `student` VALUES ('201510802047', '信息与计算科学', null, null, null, null, null, '符桢宇', null, null);
INSERT INTO `student` VALUES ('201510802048', '信息与计算科学', null, null, null, null, null, '李阳', null, null);
INSERT INTO `student` VALUES ('201510802049', '信息与计算科学', null, null, null, null, null, '王海灵', null, null);
INSERT INTO `student` VALUES ('201510802050', '信息与计算科学', null, null, null, null, null, '代润', null, null);
INSERT INTO `student` VALUES ('201510803001', '网络工程1班', null, null, null, null, null, '袁玲', null, null);
INSERT INTO `student` VALUES ('201510803002', '网络工程1班', null, null, null, null, null, '彭杰', null, null);
INSERT INTO `student` VALUES ('201510803003', '网络工程1班', null, null, null, null, null, '任昌杰', null, null);
INSERT INTO `student` VALUES ('201510803004', '网络工程1班', null, null, null, null, null, '周禄宣', null, null);
INSERT INTO `student` VALUES ('201510803005', '网络工程1班', null, null, null, null, null, '吴金旭', null, null);
INSERT INTO `student` VALUES ('201510803006', '网络工程1班', null, null, null, null, null, '雷代文', null, null);
INSERT INTO `student` VALUES ('201510803008', '网络工程1班', null, null, null, null, null, '周先宗', null, null);
INSERT INTO `student` VALUES ('201510803009', '网络工程1班', null, null, null, null, null, '李致寒', null, null);
INSERT INTO `student` VALUES ('201510803011', '网络工程1班', null, null, null, null, null, '洪星', null, null);
INSERT INTO `student` VALUES ('201510803013', '网络工程1班', null, null, null, null, null, '张仁凤', null, null);
INSERT INTO `student` VALUES ('201510803014', '网络工程1班', null, null, null, null, null, '吴荻', null, null);
INSERT INTO `student` VALUES ('201510803015', '网络工程1班', null, null, null, null, null, '张艳南', null, null);
INSERT INTO `student` VALUES ('201510803016', '网络工程1班', null, null, null, null, null, '叶承卓', null, null);
INSERT INTO `student` VALUES ('201510803017', '网络工程1班', null, null, null, null, null, '谭超', null, null);
INSERT INTO `student` VALUES ('201510803018', '网络工程1班', null, null, null, null, null, '秦红梅', null, null);
INSERT INTO `student` VALUES ('201510803019', '网络工程1班', null, null, null, null, null, '周振宇', null, null);
INSERT INTO `student` VALUES ('201510803020', '网络工程1班', null, null, null, null, null, '曾民龙', null, null);
INSERT INTO `student` VALUES ('201510803021', '网络工程1班', null, null, null, null, null, '廖辉', null, null);
INSERT INTO `student` VALUES ('201510803022', '网络工程1班', null, null, null, null, null, '周赵茂', null, null);
INSERT INTO `student` VALUES ('201510803023', '网络工程1班', null, null, null, null, null, '黄莎莎', null, null);
INSERT INTO `student` VALUES ('201510803024', '网络工程1班', null, null, null, null, null, '胡锋', null, null);
INSERT INTO `student` VALUES ('201510803026', '网络工程1班', null, null, null, null, null, '董华丽', null, null);
INSERT INTO `student` VALUES ('201510803027', '网络工程1班', null, null, null, null, null, '高浩', null, null);
INSERT INTO `student` VALUES ('201510803028', '网络工程1班', null, null, null, null, null, '孙逸翔', null, null);
INSERT INTO `student` VALUES ('201510803030', '网络工程1班', null, null, null, null, null, '罗俊', null, null);
INSERT INTO `student` VALUES ('201510803031', '网络工程1班', null, null, null, null, null, '庞坤', null, null);
INSERT INTO `student` VALUES ('201510803032', '信息与计算科学', null, null, null, null, null, '蔡敏', null, null);
INSERT INTO `student` VALUES ('201510803033', '网络工程1班', null, null, null, null, null, '石浩蔚', null, null);
INSERT INTO `student` VALUES ('201510803034', '网络工程1班', null, null, null, null, null, '杨俊', null, null);
INSERT INTO `student` VALUES ('201510803035', '网络工程1班', null, null, null, null, null, '陈洋', null, null);
INSERT INTO `student` VALUES ('201510803036', '网络工程1班', null, null, null, null, null, '曾秋霞', null, null);
INSERT INTO `student` VALUES ('201510803037', '网络工程1班', null, null, null, null, null, '代伟', null, null);
INSERT INTO `student` VALUES ('201510803038', '网络工程1班', null, null, null, null, null, '叶盛阳', null, null);
INSERT INTO `student` VALUES ('201510803039', '网络工程1班', null, null, null, null, null, '万俊一', null, null);
INSERT INTO `student` VALUES ('201510803040', '网络工程1班', null, null, null, null, null, '雍添荃', null, null);
INSERT INTO `student` VALUES ('201510803041', '网络工程2班', null, null, null, null, null, '何禹词', null, null);
INSERT INTO `student` VALUES ('201510803042', '网络工程2班', null, null, null, null, null, '蒲甜', null, null);
INSERT INTO `student` VALUES ('201510803043', '网络工程2班', null, null, null, null, null, '龚舜', null, null);
INSERT INTO `student` VALUES ('201510803044', '网络工程2班', null, null, null, null, null, '刘攀', null, null);
INSERT INTO `student` VALUES ('201510803045', '网络工程2班', null, null, null, null, null, '文艺', null, null);
INSERT INTO `student` VALUES ('201510803046', '网络工程2班', null, null, null, null, null, '刘鑫', null, null);
INSERT INTO `student` VALUES ('201510803047', '网络工程2班', null, null, null, null, null, '胡杭', null, null);
INSERT INTO `student` VALUES ('201510803049', '网络工程2班', null, null, null, null, null, '张培龙', null, null);
INSERT INTO `student` VALUES ('201510803051', '网络工程2班', null, null, null, null, null, '胡家兴', null, null);
INSERT INTO `student` VALUES ('201510803052', '网络工程2班', null, null, null, null, null, '胡秋楠', null, null);
INSERT INTO `student` VALUES ('201510803053', '网络工程2班', null, null, null, null, null, '杨珊', null, null);
INSERT INTO `student` VALUES ('201510803054', '网络工程2班', null, null, null, null, null, '王福林', null, null);
INSERT INTO `student` VALUES ('201510803056', '网络工程2班', null, null, null, null, null, '罗香帆', null, null);
INSERT INTO `student` VALUES ('201510803057', '网络工程2班', null, null, null, null, null, '毛显华', null, null);
INSERT INTO `student` VALUES ('201510803058', '网络工程2班', null, null, null, null, null, '鄢玲', null, null);
INSERT INTO `student` VALUES ('201510803059', '网络工程2班', null, null, null, null, null, '罗钟梅', null, null);
INSERT INTO `student` VALUES ('201510803060', '网络工程2班', null, null, null, null, null, '余永庆', null, null);
INSERT INTO `student` VALUES ('201510803062', '网络工程2班', null, null, null, null, null, '汪仲磊', null, null);
INSERT INTO `student` VALUES ('201510803063', '网络工程2班', null, null, null, null, null, '文严', null, null);
INSERT INTO `student` VALUES ('201510803064', '网络工程2班', null, null, null, null, null, '何明平', null, null);
INSERT INTO `student` VALUES ('201510803065', '网络工程2班', null, null, null, null, null, '杜圳', null, null);
INSERT INTO `student` VALUES ('201510803066', '网络工程2班', null, null, null, null, null, '苟娴', null, null);
INSERT INTO `student` VALUES ('201510803067', '网络工程2班', null, null, null, null, null, '周克琼', null, null);
INSERT INTO `student` VALUES ('201510803069', '网络工程2班', null, null, null, null, null, '邹鑫', null, null);
INSERT INTO `student` VALUES ('201510803070', '网络工程2班', '0', null, '白宫', null, '513822199901113654', '杨仁杰', '美国加利福尼亚', null);
INSERT INTO `student` VALUES ('201510803071', '网络工程2班', null, null, null, null, null, '余洲', null, null);
INSERT INTO `student` VALUES ('201510803072', '软件工程2班', null, null, null, null, null, '刘锐', null, null);
INSERT INTO `student` VALUES ('201510803073', '网络工程2班', null, null, null, null, null, '王雨婷', null, null);
INSERT INTO `student` VALUES ('201510803074', '网络工程2班', null, null, null, null, null, '潘龙飞', null, null);
INSERT INTO `student` VALUES ('201510803075', '网络工程2班', null, null, null, null, null, '陈波', null, null);
INSERT INTO `student` VALUES ('201510803076', '网络工程2班', null, null, null, null, null, '李解', null, null);
INSERT INTO `student` VALUES ('201510803077', '网络工程2班', null, null, null, null, null, '李彪', null, null);
INSERT INTO `student` VALUES ('201510803078', '网络工程2班', null, null, null, null, null, '伍怀洪', null, null);
INSERT INTO `student` VALUES ('201510803079', '网络工程2班', null, null, null, null, null, '黄陈宇', null, null);
INSERT INTO `student` VALUES ('201510803080', '网络工程2班', null, null, null, null, null, '郭佳慧', null, null);
INSERT INTO `student` VALUES ('201510804001', '软件工程1班', null, null, null, null, null, '王季港', null, null);
INSERT INTO `student` VALUES ('201510804002', '软件工程1班', null, null, null, null, null, '刘星', null, null);
INSERT INTO `student` VALUES ('201510804003', '软件工程1班', '0', null, null, null, null, '席瑞', null, null);
INSERT INTO `student` VALUES ('201510804004', '软件工程1班', null, null, null, null, null, '彭思海', null, null);
INSERT INTO `student` VALUES ('201510804005', '软件工程1班', null, null, null, null, null, '周海文', null, null);
INSERT INTO `student` VALUES ('201510804006', '软件工程1班', null, null, null, null, null, '吴阳', null, null);
INSERT INTO `student` VALUES ('201510804007', '软件工程1班', null, null, null, null, null, '刘鹏', null, null);
INSERT INTO `student` VALUES ('201510804008', '软件工程1班', null, null, null, null, null, '谢鑫', null, null);
INSERT INTO `student` VALUES ('201510804009', '软件工程1班', null, null, null, null, null, '郑其鑫', null, null);
INSERT INTO `student` VALUES ('201510804010', '软件工程1班', null, null, null, null, null, '羊鑫', null, null);
INSERT INTO `student` VALUES ('201510804011', '软件工程1班', null, null, null, null, null, '刘廷伟', null, null);
INSERT INTO `student` VALUES ('201510804012', '软件工程1班', null, null, null, null, null, '干勇', null, null);
INSERT INTO `student` VALUES ('201510804013', '软件工程1班', null, null, null, null, null, '许伟', null, null);
INSERT INTO `student` VALUES ('201510804014', '软件工程1班', null, null, null, null, null, '刘雨婷', null, null);
INSERT INTO `student` VALUES ('201510804015', '软件工程1班', null, null, null, null, null, '罗凯', null, null);
INSERT INTO `student` VALUES ('201510804016', '软件工程1班', null, null, null, null, null, '陈华坤', null, null);
INSERT INTO `student` VALUES ('201510804017', '软件工程1班', null, null, null, null, null, '李周', null, null);
INSERT INTO `student` VALUES ('201510804018', '软件工程1班', null, null, null, null, null, '欧琪', null, null);
INSERT INTO `student` VALUES ('201510804019', '软件工程1班', null, null, null, null, null, '莫俊', null, null);
INSERT INTO `student` VALUES ('201510804020', '软件工程1班', null, null, null, null, null, '钟培松', null, null);
INSERT INTO `student` VALUES ('201510804021', '软件工程1班', null, null, null, null, null, '于宸镔', null, null);
INSERT INTO `student` VALUES ('201510804022', '软件工程1班', null, null, null, null, null, '蒋攀', null, null);
INSERT INTO `student` VALUES ('201510804023', '软件工程1班', null, null, null, null, null, '林尚春', null, null);
INSERT INTO `student` VALUES ('201510804024', '软件工程1班', null, null, null, null, null, '杨立文', null, null);
INSERT INTO `student` VALUES ('201510804025', '软件工程1班', null, null, null, null, null, '舒黎', null, null);
INSERT INTO `student` VALUES ('201510804026', '软件工程1班', null, null, null, null, null, '邱添', null, null);
INSERT INTO `student` VALUES ('201510804027', '软件工程1班', null, null, null, null, null, '王首龙', null, null);
INSERT INTO `student` VALUES ('201510804028', '软件工程1班', null, null, null, null, null, '杨磊', null, null);
INSERT INTO `student` VALUES ('201510804029', '软件工程1班', null, null, null, null, null, '赖祥林', null, null);
INSERT INTO `student` VALUES ('201510804030', '软件工程1班', null, null, null, null, null, '冯强', null, null);
INSERT INTO `student` VALUES ('201510804031', '软件工程1班', null, null, null, null, null, '邹超', null, null);
INSERT INTO `student` VALUES ('201510804032', '软件工程1班', null, null, null, null, null, '李杨', null, null);
INSERT INTO `student` VALUES ('201510804033', '软件工程1班', null, null, null, null, null, '张元杰', null, null);
INSERT INTO `student` VALUES ('201510804034', '软件工程1班', null, null, null, null, null, '王李娜', null, null);
INSERT INTO `student` VALUES ('201510804037', '软件工程1班', null, null, null, null, null, '周仁华', null, null);
INSERT INTO `student` VALUES ('201510804038', '软件工程1班', null, null, null, null, null, '唐诗琪', null, null);
INSERT INTO `student` VALUES ('201510804039', '软件工程1班', null, null, null, null, null, '刘静', null, null);
INSERT INTO `student` VALUES ('201510804044', '软件工程2班', null, null, null, null, null, '蒋国庆', null, null);
INSERT INTO `student` VALUES ('201510804050', '软件工程2班', null, null, null, null, null, '卢潇逸', null, null);
INSERT INTO `student` VALUES ('201510804056', '软件工程2班', null, null, null, null, null, '刘磊', null, null);
INSERT INTO `student` VALUES ('201510804058', '软件工程2班', null, null, null, null, null, '韩冬梅', null, null);
INSERT INTO `student` VALUES ('201510804066', '软件工程2班', null, null, null, null, null, '缪绍豪', null, null);
INSERT INTO `student` VALUES ('201510804067', '软件工程2班', null, null, null, null, null, '王选', null, null);
INSERT INTO `student` VALUES ('201510804074', '软件工程2班', null, null, null, null, null, '明慧', null, null);
INSERT INTO `student` VALUES ('201510804079', '软件工程2班', null, null, null, null, null, '陈刚', null, null);
INSERT INTO `student` VALUES ('201511105017', '软件工程1班', null, null, null, null, null, '王飞', null, null);
INSERT INTO `student` VALUES ('201511803009', '软件工程1班', null, null, null, null, null, '曹华胜', null, null);

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
INSERT INTO `uploadinstruction` VALUES ('文件名字：申请人图片1 申请人图片2·····\n内容需拍照清楚，图片四周无留白。\n标题：（1）标题。居中写“入党申请书\"。\n称谓：（2）称谓。申请人对党组织的称呼，如“敬爱的党组织”，顶格写在第一行，后面加冒号。\n正文：（3）正文。这是入党申请书的关键部分，主要包括四方面内容：\n一是表明入党的意愿，如：我自愿加入中国共产党。\n二是对党的认识和要求入党的动机，也就是为什么要入党。对党的认识，主要是对党的性质、纲领、奋斗目标、宗旨、党的路线、方针、政策的认识；入党动机，就是参加中国共产党的目的，即为什么要加入党组织。写这部分要联系自己的思想实际，可以写通过学习党的基础知识、听了党课、参加了有意义的活动以后的思想演变过程，以及思想认识上有什么提高等。\n三是个人履历（学历和工作经历）、家庭成员和主要社会关系的情况，此部分也可单独写成《本人自传》。如果本人家庭成员和主要社会关系中，有人有政治历史问题、或者犯过什么错误、或受到过刑事处分的，都要写清楚并表明自己的态度，以便让组织上了解。\n四是自己的优缺点和今后的努力方向。即个人在政治、思想、学习、工作、作风、纪律等方面的主要表现，特别是对自己存在的缺点和不足要敢于指出，并向党组织表明改正的决心和努力方向，如何以实际行动争取入党。\n结尾\n（4）结尾。入党申请书的结尾，一般可写“请党组织在实践中考验我”，或“请党组织看我的实际行动”等作为正文的结束。正文写完之后，加上“此致、敬礼”等用语，亦可不写。\n署名日期\n（5）署名和日期。入党申请书写完后，要署上申请人的姓名，申请时间年、月、日，以示郑重。', '0', '0', '0');
INSERT INTO `uploadinstruction` VALUES ('文件名字：姓名+入党申请书\n内容同图片一样。\n字体大小：宋体小四，行间距20', '0', '0', '1');
INSERT INTO `uploadinstruction` VALUES ('文件名字：姓名—积极分子考察\n内容需拍照清楚，图片四周无留白。', '0', '1', '0');
INSERT INTO `uploadinstruction` VALUES ('文件名字：\n姓名+思想汇报1 \n姓名+思想汇报2\n姓名+思想汇报3 \n姓名+思想汇报4······\n\n思想汇报的基本书写格式及内容通常如下：\n标题。居中写“思想汇报”。\n称谓。即汇报人对党组织的称呼，一般写“敬爱的党组织”。顶格书写在标题的下一行，后面加冒号。\n正文：内容同简介\n结尾。思想汇报的结尾可写上自己对党组织的请求和希望。一般用“恳请党组织给予批评、帮助”或“希望党组织加强对自己的培养和教育”等作为结束语。', '0', '1', '1');
INSERT INTO `uploadinstruction` VALUES ('文件名字：姓名+思想汇报\n内容同图片一样。\n字体大小：宋体小四，行间距20\n\n思想汇报的基本书写格式及内容通常如下：\n标题。居中写“思想汇报”。\n称谓。即汇报人对党组织的称呼，一般写“敬爱的党组织”。顶格书写在标题的下一行，后面加冒号。\n正文：内容同简介\n结尾。思想汇报的结尾可写上自己对党组织的请求和希望。一般用“恳请党组织给予批评、帮助”或“希望党组织加强对自己的培养和教育”等作为结束语。', '0', '1', '2');
INSERT INTO `uploadinstruction` VALUES ('文件名字：\n姓名+思想汇报1 \n姓名+思想汇报2\n姓名+思想汇报3 \n姓名+思想汇报4······\n\n思想汇报的基本书写格式及内容通常如下：\n标题。居中写“思想汇报”。\n称谓。即汇报人对党组织的称呼，一般写“敬爱的党组织”。顶格书写在标题的下一行，后面加冒号。\n正文：内容同简介\n结尾。思想汇报的结尾可写上自己对党组织的请求和希望。一般用“恳请党组织给予批评、帮助”或“希望党组织加强对自己的培养和教育”等作为结束语。', '0', '1', '3');
INSERT INTO `uploadinstruction` VALUES ('文件名字：姓名+思想汇报\n内容同图片一样。\n字体大小：宋体小四，行间距20\n\n思想汇报的基本书写格式及内容通常如下：\n标题。居中写“思想汇报”。\n称谓。即汇报人对党组织的称呼，一般写“敬爱的党组织”。顶格书写在标题的下一行，后面加冒号。\n正文：内容同简介\n结尾。思想汇报的结尾可写上自己对党组织的请求和希望。一般用“恳请党组织给予批评、帮助”或“希望党组织加强对自己的培养和教育”等作为结束语。', '0', '1', '4');
INSERT INTO `uploadinstruction` VALUES ('内容拍照清楚\n图片四周无留白', '0', '1', '5');
INSERT INTO `uploadinstruction` VALUES ('内容拍照清楚\n图片四周无留白', '0', '1', '6');
INSERT INTO `uploadinstruction` VALUES ('其他资料可上传到此处，名字+文档内容名称', '0', '1', '7');
INSERT INTO `uploadinstruction` VALUES ('文件名字：\n姓名+自传1 \n姓名+自传2\n姓名+自传3 \n姓名+自传4······\n\n\n一般情况下，入党自传内容要求应包括以下几个方面：\n\n(1)入党申请人的基本情况。主要包括：姓名、性别、出生年月(按公历算)、籍贯、民族、文化程度、参加工作时间、现从事何工作、任何职务、有何重大成果、有何专长等。\n\n(2)入党申请人家庭主要成员和主要社会关系的情况。家庭主要成员情况，主要是指父母、配偶和子女，以及和本人长期在一起生活的亲属的基本情况和政治情况。主要社会关系情况，要写清与本人在政治、经济、生活上有直接联系的亲友以及同学、同事等人的基本情况和政治情况，以及对本人的影响情况。这一部分也可放最后一部分来写。\n\n(3)入党申请人的历史。一般从上小学或7周岁写起。要写明从何时到何时，在什么学校读书或在什么单位从事什么工作，担任什么职务。每段时间要衔接起来，而且每段时间都要提供证明人。还应写明，参加过什么民主党派、进步团体、反动组织或封建迷信组织，参加过什么大的活动，任何职务，以及有何其他政治历史问题，有无结论，结论如何，受过何种奖励和处分，需要向党组织说明的其他问题等。\n\n(4)对有的入党申请人，自传中要写清楚自己财产的主要来源，创办企业的经历，交纳税费的情况，和企业员工的关系情况，财产的分配和使用情况等。\n\n(5)入党申请人的思想演变过程。一些岁数较大、经历丰富的同志可根据自己的思想演变情况，分成几个重要阶段来写，也可根据自己对一些重大历史政治事件的认识来写。不管用什么办法，一定要准确地把自己的思想认识反映出来。', '0', '2', '0');
INSERT INTO `uploadinstruction` VALUES ('文件名字：姓名+自传\n内容同图片一样。\n字体大小：宋体小四，行间距20\n\n一般情况下，入党自传内容要求应包括以下几个方面：\n\n(1)入党申请人的基本情况。主要包括：姓名、性别、出生年月(按公历算)、籍贯、民族、文化程度、参加工作时间、现从事何工作、任何职务、有何重大成果、有何专长等。\n\n(2)入党申请人家庭主要成员和主要社会关系的情况。家庭主要成员情况，主要是指父母、配偶和子女，以及和本人长期在一起生活的亲属的基本情况和政治情况。主要社会关系情况，要写清与本人在政治、经济、生活上有直接联系的亲友以及同学、同事等人的基本情况和政治情况，以及对本人的影响情况。这一部分也可放最后一部分来写。\n\n(3)入党申请人的历史。一般从上小学或7周岁写起。要写明从何时到何时，在什么学校读书或在什么单位从事什么工作，担任什么职务。每段时间要衔接起来，而且每段时间都要提供证明人。还应写明，参加过什么民主党派、进步团体、反动组织或封建迷信组织，参加过什么大的活动，任何职务，以及有何其他政治历史问题，有无结论，结论如何，受过何种奖励和处分，需要向党组织说明的其他问题等。\n\n(4)对有的入党申请人，自传中要写清楚自己财产的主要来源，创办企业的经历，交纳税费的情况，和企业员工的关系情况，财产的分配和使用情况等。\n\n(5)入党申请人的思想演变过程。一些岁数较大、经历丰富的同志可根据自己的思想演变情况，分成几个重要阶段来写，也可根据自己对一些重大历史政治事件的认识来写。不管用什么办法，一定要准确地把自己的思想认识反映出来。', '0', '2', '1');
INSERT INTO `uploadinstruction` VALUES ('', '0', '2', '2');
INSERT INTO `uploadinstruction` VALUES ('内容拍照清楚\n图片四周无留白', '0', '2', '3');
INSERT INTO `uploadinstruction` VALUES ('发展对象5', '0', '2', '4');
INSERT INTO `uploadinstruction` VALUES ('文件名字：\n姓名+培训学习心得1  2  3····\n\n根据培训内容完成培训心得。', '0', '2', '5');
INSERT INTO `uploadinstruction` VALUES ('姓名+培训学习心得\n内容拍照清楚\n图片四周无留白\n根据培训内容完成培训心得。', '0', '2', '6');
INSERT INTO `uploadinstruction` VALUES ('文件名字：\n姓名+思想汇报1 \n姓名+思想汇报2\n姓名+思想汇报3 \n姓名+思想汇报4······\n\n思想汇报的基本书写格式及内容通常如下：\n标题。居中写“思想汇报”。\n称谓。即汇报人对党组织的称呼，一般写“敬爱的党组织”。顶格书写在标题的下一行，后面加冒号。\n正文：内容同简介\n结尾。思想汇报的结尾可写上自己对党组织的请求和希望。一般用“恳请党组织给予批评、帮助”或“希望党组织加强对自己的培养和教育”等作为结束语。', '0', '2', '7');
INSERT INTO `uploadinstruction` VALUES ('文件名字：姓名+思想汇报\n内容同图片一样。\n字体大小：宋体小四，行间距20\n\n思想汇报的基本书写格式及内容通常如下：\n标题。居中写“思想汇报”。\n称谓。即汇报人对党组织的称呼，一般写“敬爱的党组织”。顶格书写在标题的下一行，后面加冒号。\n正文：内容同简介\n结尾。思想汇报的结尾可写上自己对党组织的请求和希望。一般用“恳请党组织给予批评、帮助”或“希望党组织加强对自己的培养和教育”等作为结束语。', '0', '2', '8');
INSERT INTO `uploadinstruction` VALUES ('文件名字：\n姓名+思想汇报1 \n姓名+思想汇报2\n姓名+思想汇报3 \n姓名+思想汇报4······\n\n思想汇报的基本书写格式及内容通常如下：\n标题。居中写“思想汇报”。\n称谓。即汇报人对党组织的称呼，一般写“敬爱的党组织”。顶格书写在标题的下一行，后面加冒号。\n正文：内容同简介\n结尾。思想汇报的结尾可写上自己对党组织的请求和希望。一般用“恳请党组织给予批评、帮助”或“希望党组织加强对自己的培养和教育”等作为结束语。', '0', '2', '9');
INSERT INTO `uploadinstruction` VALUES ('文件名字：姓名+思想汇报\n内容同图片一样。\n字体大小：宋体小四，行间距20\n\n思想汇报的基本书写格式及内容通常如下：\n标题。居中写“思想汇报”。\n称谓。即汇报人对党组织的称呼，一般写“敬爱的党组织”。顶格书写在标题的下一行，后面加冒号。\n正文：内容同简介\n结尾。思想汇报的结尾可写上自己对党组织的请求和希望。一般用“恳请党组织给予批评、帮助”或“希望党组织加强对自己的培养和教育”等作为结束语。', '0', '2', '10');
INSERT INTO `uploadinstruction` VALUES ('文件名字：\n姓名+思想汇报1 \n姓名+思想汇报2\n姓名+思想汇报3 \n姓名+思想汇报4······\n\n思想汇报的基本书写格式及内容通常如下：\n标题。居中写“思想汇报”。\n称谓。即汇报人对党组织的称呼，一般写“敬爱的党组织”。顶格书写在标题的下一行，后面加冒号。\n正文：内容同简介\n结尾。思想汇报的结尾可写上自己对党组织的请求和希望。一般用“恳请党组织给予批评、帮助”或“希望党组织加强对自己的培养和教育”等作为结束语。', '0', '2', '11');
INSERT INTO `uploadinstruction` VALUES ('文件名字：姓名+思想汇报\n内容同图片一样。\n字体大小：宋体小四，行间距20\n\n思想汇报的基本书写格式及内容通常如下：\n标题。居中写“思想汇报”。\n称谓。即汇报人对党组织的称呼，一般写“敬爱的党组织”。顶格书写在标题的下一行，后面加冒号。\n正文：内容同简介\n结尾。思想汇报的结尾可写上自己对党组织的请求和希望。一般用“恳请党组织给予批评、帮助”或“希望党组织加强对自己的培养和教育”等作为结束语。', '0', '2', '12');
INSERT INTO `uploadinstruction` VALUES ('文件名字：\n姓名+思想汇报1 \n姓名+思想汇报2\n姓名+思想汇报3 \n姓名+思想汇报4······\n\n思想汇报的基本书写格式及内容通常如下：\n标题。居中写“思想汇报”。\n称谓。即汇报人对党组织的称呼，一般写“敬爱的党组织”。顶格书写在标题的下一行，后面加冒号。\n正文：内容同简介\n结尾。思想汇报的结尾可写上自己对党组织的请求和希望。一般用“恳请党组织给予批评、帮助”或“希望党组织加强对自己的培养和教育”等作为结束语。', '0', '2', '13');
INSERT INTO `uploadinstruction` VALUES ('文件名字：姓名+思想汇报\n内容同图片一样。\n字体大小：宋体小四，行间距20\n\n思想汇报的基本书写格式及内容通常如下：\n标题。居中写“思想汇报”。\n称谓。即汇报人对党组织的称呼，一般写“敬爱的党组织”。顶格书写在标题的下一行，后面加冒号。\n正文：内容同简介\n结尾。思想汇报的结尾可写上自己对党组织的请求和希望。一般用“恳请党组织给予批评、帮助”或“希望党组织加强对自己的培养和教育”等作为结束语。', '0', '2', '14');
INSERT INTO `uploadinstruction` VALUES ('其他资料可上传到此处，名字+文档内容名称', '0', '2', '15');
INSERT INTO `uploadinstruction` VALUES ('文件名字：\n姓名+思想汇报1 \n姓名+思想汇报2\n姓名+思想汇报3 \n姓名+思想汇报4······\n\n思想汇报的基本书写格式及内容通常如下：\n标题。居中写“思想汇报”。\n称谓。即汇报人对党组织的称呼，一般写“敬爱的党组织”。顶格书写在标题的下一行，后面加冒号。\n正文：内容同简介\n结尾。思想汇报的结尾可写上自己对党组织的请求和希望。一般用“恳请党组织给予批评、帮助”或“希望党组织加强对自己的培养和教育”等作为结束语。', '0', '3', '0');
INSERT INTO `uploadinstruction` VALUES ('文件名字：姓名+思想汇报\n内容同图片一样。\n字体大小：宋体小四，行间距20\n\n思想汇报的基本书写格式及内容通常如下：\n标题。居中写“思想汇报”。\n称谓。即汇报人对党组织的称呼，一般写“敬爱的党组织”。顶格书写在标题的下一行，后面加冒号。\n正文：内容同简介\n结尾。思想汇报的结尾可写上自己对党组织的请求和希望。一般用“恳请党组织给予批评、帮助”或“希望党组织加强对自己的培养和教育”等作为结束语。', '0', '3', '1');
INSERT INTO `uploadinstruction` VALUES ('内容拍照清楚\n图片四周无留白', '0', '3', '2');
INSERT INTO `uploadinstruction` VALUES ('其他资料可上传到此处，名字+文档内容名称', '0', '3', '3');

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
INSERT INTO `user` VALUES ('201510602008', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2016-07-06 00:00:00', null);
INSERT INTO `user` VALUES ('201510801001', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801002', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801003', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801004', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801005', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801006', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801007', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801008', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801009', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801010', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801011', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801012', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801014', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801015', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801016', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801017', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801018', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801019', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801020', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801021', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801022', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801023', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801024', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801025', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801026', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801027', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801028', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801029', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801030', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801031', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801032', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801033', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801034', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801035', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801036', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801037', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801038', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801039', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801040', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801041', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801042', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801043', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801045', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801046', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801047', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801048', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801049', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510801050', '96e79218965eb72c92a549dd5a330112', '1', '0', null, '2019-05-16 11:24:37', '2019-05-16 11:24:37', null, null, null, null);
INSERT INTO `user` VALUES ('201510802001', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802002', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802003', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802004', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802005', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802006', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802007', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802008', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802009', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802011', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802012', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802013', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802014', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802016', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-09-03 00:00:00', null);
INSERT INTO `user` VALUES ('201510802017', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802018', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802019', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802020', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802021', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802022', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802023', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802024', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802025', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802026', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802027', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802028', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802029', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802030', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802031', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802032', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802033', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802034', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802035', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802036', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802037', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802038', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802039', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802040', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802041', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802042', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802043', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802044', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802045', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802046', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802047', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802048', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802049', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510802050', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510803001', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803002', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803003', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803004', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803005', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803006', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803008', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803009', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803011', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803013', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803014', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803015', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803016', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803017', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803018', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803019', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803020', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803021', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803022', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803023', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803024', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803026', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803027', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803028', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803030', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803031', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803032', '96e79218965eb72c92a549dd5a330112', '2', '0', null, '2019-05-16 11:25:55', '2019-05-16 11:25:55', '2019-05-16 11:25:55', null, null, null);
INSERT INTO `user` VALUES ('201510803033', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803034', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803035', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803036', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803037', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803038', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803039', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803040', '96e79218965eb72c92a549dd5a330112', '3', '0', null, '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', '2019-05-16 11:27:24', null, null);
INSERT INTO `user` VALUES ('201510803041', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803042', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803043', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803044', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803045', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803046', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803047', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803049', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803051', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803052', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803053', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803054', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803056', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803057', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803058', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803059', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803060', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803062', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803063', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803064', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803065', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803066', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803067', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803069', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803070', '96e79218965eb72c92a549dd5a330112', '0', '0', '6256ac4dcdb3d6760eb99779645917ad201510803070_201910', '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803071', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803072', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-10-04 00:00:00', null);
INSERT INTO `user` VALUES ('201510803073', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803074', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803075', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803076', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803077', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803078', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803079', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510803080', '96e79218965eb72c92a549dd5a330112', '0', '0', null, '2019-05-16 11:24:08', null, null, null, null, null);
INSERT INTO `user` VALUES ('201510804001', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2018-02-10 00:00:00', null);
INSERT INTO `user` VALUES ('201510804002', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-04-03 00:00:00', null);
INSERT INTO `user` VALUES ('201510804003', '96e79218965eb72c92a549dd5a330112', '10', '0', 'cd9c5f61e5d7afe22a09bed1fc0b7a86201510804003_201990', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-02-10 00:00:00', null);
INSERT INTO `user` VALUES ('201510804004', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-04-10 00:00:00', null);
INSERT INTO `user` VALUES ('201510804005', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-01-03 00:00:00', null);
INSERT INTO `user` VALUES ('201510804006', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2016-06-08 00:00:00', null);
INSERT INTO `user` VALUES ('201510804007', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-05-03 00:00:00', null);
INSERT INTO `user` VALUES ('201510804008', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-05-08 00:00:00', null);
INSERT INTO `user` VALUES ('201510804009', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-09-08 00:00:00', null);
INSERT INTO `user` VALUES ('201510804010', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2016-11-09 00:00:00', null);
INSERT INTO `user` VALUES ('201510804011', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2016-08-06 00:00:00', null);
INSERT INTO `user` VALUES ('201510804012', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2018-11-06 00:00:00', null);
INSERT INTO `user` VALUES ('201510804013', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2018-10-04 00:00:00', null);
INSERT INTO `user` VALUES ('201510804014', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-04-04 00:00:00', null);
INSERT INTO `user` VALUES ('201510804015', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-02-08 00:00:00', null);
INSERT INTO `user` VALUES ('201510804016', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2016-01-03 00:00:00', null);
INSERT INTO `user` VALUES ('201510804017', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-11-03 00:00:00', null);
INSERT INTO `user` VALUES ('201510804018', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-03-07 00:00:00', null);
INSERT INTO `user` VALUES ('201510804019', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2016-07-10 00:00:00', null);
INSERT INTO `user` VALUES ('201510804020', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-01-06 00:00:00', null);
INSERT INTO `user` VALUES ('201510804021', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2016-06-09 00:00:00', null);
INSERT INTO `user` VALUES ('201510804022', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2018-02-07 00:00:00', null);
INSERT INTO `user` VALUES ('201510804023', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2018-02-09 00:00:00', null);
INSERT INTO `user` VALUES ('201510804024', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-12-06 00:00:00', null);
INSERT INTO `user` VALUES ('201510804025', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-11-04 00:00:00', null);
INSERT INTO `user` VALUES ('201510804026', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2016-04-09 00:00:00', null);
INSERT INTO `user` VALUES ('201510804027', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-07-07 00:00:00', null);
INSERT INTO `user` VALUES ('201510804028', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-11-04 00:00:00', null);
INSERT INTO `user` VALUES ('201510804029', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-05-07 00:00:00', null);
INSERT INTO `user` VALUES ('201510804030', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-11-06 00:00:00', null);
INSERT INTO `user` VALUES ('201510804031', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2018-06-09 00:00:00', null);
INSERT INTO `user` VALUES ('201510804032', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2018-12-07 00:00:00', null);
INSERT INTO `user` VALUES ('201510804033', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-08-04 00:00:00', null);
INSERT INTO `user` VALUES ('201510804034', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2016-01-08 00:00:00', null);
INSERT INTO `user` VALUES ('201510804037', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-01-09 00:00:00', null);
INSERT INTO `user` VALUES ('201510804038', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2016-08-04 00:00:00', null);
INSERT INTO `user` VALUES ('201510804039', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-07-03 00:00:00', null);
INSERT INTO `user` VALUES ('201510804044', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-03-07 00:00:00', null);
INSERT INTO `user` VALUES ('201510804050', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-07-03 00:00:00', null);
INSERT INTO `user` VALUES ('201510804056', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2016-10-08 00:00:00', null);
INSERT INTO `user` VALUES ('201510804058', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-02-03 00:00:00', null);
INSERT INTO `user` VALUES ('201510804066', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-07-10 00:00:00', null);
INSERT INTO `user` VALUES ('201510804067', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2016-02-04 00:00:00', null);
INSERT INTO `user` VALUES ('201510804074', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-01-05 00:00:00', null);
INSERT INTO `user` VALUES ('201510804079', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2018-01-05 00:00:00', null);
INSERT INTO `user` VALUES ('201511105017', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2018-07-04 00:00:00', null);
INSERT INTO `user` VALUES ('201511803009', '96e79218965eb72c92a549dd5a330112', '4', '0', null, '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2019-05-16 11:27:52', '2017-10-06 00:00:00', null);
INSERT INTO `user` VALUES ('admin', '96e79218965eb72c92a549dd5a330112', '6', '0', null, null, null, null, null, null, null);

-- ----------------------------
-- View structure for basalinfo
-- ----------------------------
DROP VIEW IF EXISTS `basalinfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `basalinfo` AS select `user`.`userId` AS `userId`,`user`.`userPermission` AS `userPermission`,`user`.`status` AS `userStatus`,`student`.`classInfo` AS `classInfo`,`student`.`sex` AS `sex`,`student`.`homeAddress` AS `homeAddress`,`student`.`status` AS `status`,`student`.`IDcardNum` AS `IDcardNum`,`student`.`name` AS `name`,`student`.`position` AS `position` from (`user` join `student` on((`user`.`userId` = `student`.`userId`))) ;
