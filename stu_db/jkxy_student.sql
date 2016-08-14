/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : jkxy_student

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2016-08-07 20:38:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课题号码',
  `c_name` varchar(20) DEFAULT NULL COMMENT '课题名称',
  `c_credit` float(5,0) DEFAULT NULL COMMENT '课题学分',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '语文', '2');
INSERT INTO `course` VALUES ('2', '数学', '2');
INSERT INTO `course` VALUES ('3', '英语', '1');
INSERT INTO `course` VALUES ('4', '计算机程序设计', '2');
INSERT INTO `course` VALUES ('5', '历史', '2');

-- ----------------------------
-- Table structure for `score`
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '成绩编号',
  `c_id` int(11) DEFAULT NULL COMMENT '课题编号',
  `s_id` int(11) DEFAULT NULL COMMENT '学生学号',
  `t_id` int(11) DEFAULT NULL COMMENT '教师工号',
  `score` float(5,0) DEFAULT NULL COMMENT '成绩',
  PRIMARY KEY (`id`),
  KEY `fk_s_id` (`s_id`),
  KEY `fk_t_id` (`t_id`),
  CONSTRAINT `fk_s_id` FOREIGN KEY (`s_id`) REFERENCES `student` (`s_id`),
  CONSTRAINT `fk_t_id` FOREIGN KEY (`t_id`) REFERENCES `teacher` (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('1', '1', '1', '1', '90');
INSERT INTO `score` VALUES ('2', '2', '2', '3', '80');
INSERT INTO `score` VALUES ('3', '4', '4', '2', '80');
INSERT INTO `score` VALUES ('4', '2', '3', '3', '99');
INSERT INTO `score` VALUES ('5', '3', '1', '2', '86');
INSERT INTO `score` VALUES ('6', '2', '4', '2', '93');
INSERT INTO `score` VALUES ('7', '4', '1', '2', '88');
INSERT INTO `score` VALUES ('8', '3', '4', '1', '70');
INSERT INTO `score` VALUES ('9', '2', '3', '2', '80');
INSERT INTO `score` VALUES ('10', '1', '3', '4', '94');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生学号',
  `s_name` varchar(20) DEFAULT NULL COMMENT '学生名字',
  `s_gender` varchar(20) DEFAULT NULL COMMENT '学生性别',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '小明', '男');
INSERT INTO `student` VALUES ('2', '小马', '女');
INSERT INTO `student` VALUES ('3', '小米', '女');
INSERT INTO `student` VALUES ('4', '极客', '男');
INSERT INTO `student` VALUES ('5', '小李', '女');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师id',
  `t_name` varchar(20) DEFAULT NULL COMMENT '教师姓名',
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '张三');
INSERT INTO `teacher` VALUES ('2', '李思');
INSERT INTO `teacher` VALUES ('3', '王五');
INSERT INTO `teacher` VALUES ('4', '李四');
