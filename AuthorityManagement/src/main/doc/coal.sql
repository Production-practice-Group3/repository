/*
Navicat MySQL Data Transfer

Source Server         : 徐吱eng
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : coal

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2020-07-16 14:59:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pt_menu_directory
-- ----------------------------
DROP TABLE IF EXISTS `pt_menu_directory`;
CREATE TABLE `pt_menu_directory` (
  `menu_id` int(50) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单目录id（树型结构层级编码）',
  `dir_name` varchar(100) DEFAULT NULL COMMENT '菜单目录名称',
  `dir_level_number` int(2) DEFAULT NULL COMMENT '菜单目录级数',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父目录id',
  `isitem` char(1) NOT NULL DEFAULT '1' COMMENT '明细否：0 非明细；1 明细',
  `locale` varchar(32) NOT NULL DEFAULT 'zh_CN' COMMENT '当前国际化标志',
  `res_uuid` int(50) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '删除否：0 未删除；1 删除',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='菜单目录表';

-- ----------------------------
-- Records of pt_menu_directory
-- ----------------------------
INSERT INTO `pt_menu_directory` VALUES ('1', '事务中心', '1', 'root', '0', 'zh_CN', '1', '0');
INSERT INTO `pt_menu_directory` VALUES ('2', '待办事项', '2', '1', '1', 'zh_CN', '2', '0');
INSERT INTO `pt_menu_directory` VALUES ('3', '采购信息', '1', 'root', '0', 'zh_CN', '3', '0');
INSERT INTO `pt_menu_directory` VALUES ('4', '采购申请查看', '2', '3', '1', 'zh_CN', '4', '0');
INSERT INTO `pt_menu_directory` VALUES ('5', '采购执行查看', '2', '3', '1', 'zh_CN', '5', '0');
INSERT INTO `pt_menu_directory` VALUES ('6', '报价管理', '2', 'root', '0', 'zh_CN', '6', '0');
INSERT INTO `pt_menu_directory` VALUES ('7', '参与报价', '2', '6', '1', 'zh_CN', '7', '0');
INSERT INTO `pt_menu_directory` VALUES ('8', '报价结果', '2', '6', '1', 'zh_CN', '8', '0');
INSERT INTO `pt_menu_directory` VALUES ('9', '保证金管理', '1', 'root', '0', 'zh_CN', '9', '0');
INSERT INTO `pt_menu_directory` VALUES ('10', '保证金账户台账', '2', '9', '1', 'zh_CN', '10', '0');
INSERT INTO `pt_menu_directory` VALUES ('11', '保证金使用明细', '2', '9', '1', 'zh_CN', '11', '0');
INSERT INTO `pt_menu_directory` VALUES ('12', '汇款凭证录入', '2', '9', '1', 'zh_CN', '12', '0');
INSERT INTO `pt_menu_directory` VALUES ('13', 'test', '2', '1', '1', 'zh_CN', '13', '0');
INSERT INTO `pt_menu_directory` VALUES ('14', '履约保证金台账', '2', '9', '1', 'zh_CN', '14', '0');
INSERT INTO `pt_menu_directory` VALUES ('15', '供应资格管理', '1', 'root', '0', 'zh_CN', '15', '0');
INSERT INTO `pt_menu_directory` VALUES ('16', '注册对象管理', '2', '15', '1', 'zh_CN', '16', '0');
INSERT INTO `pt_menu_directory` VALUES ('17', '采购申请管理', '1', 'root', '0', 'zh_CN', '17', '0');
INSERT INTO `pt_menu_directory` VALUES ('18', '采购需求创建', '2', '17', '1', 'zh_CN', '18', '0');
INSERT INTO `pt_menu_directory` VALUES ('19', '采购审核', '2', '17', '1', 'zh_CN', '19', '0');
INSERT INTO `pt_menu_directory` VALUES ('20', '采购申请查询', '2', '17', '1', 'zh_CN', '20', '0');
INSERT INTO `pt_menu_directory` VALUES ('21', '采购执行报批', '1', 'root', '0', 'zh_CN', '21', '0');
INSERT INTO `pt_menu_directory` VALUES ('22', '采购执行查询', '2', '21', '1', 'zh_CN', '22', '0');
INSERT INTO `pt_menu_directory` VALUES ('23', '长协交易', '1', 'root', '0', 'zh_CN', '23', '0');
INSERT INTO `pt_menu_directory` VALUES ('24', '长协交易查看', '2', '23', '1', 'zh_CN', '24', '0');
INSERT INTO `pt_menu_directory` VALUES ('25', '长协交易创建', '2', '23', '1', 'zh_CN', '25', '0');
INSERT INTO `pt_menu_directory` VALUES ('26', '报价保证金明细', '2', '9', '1', 'zh_CN', '26', '0');
INSERT INTO `pt_menu_directory` VALUES ('27', '履约保证金明细', '2', '9', '1', 'zh_CN', '27', '0');
INSERT INTO `pt_menu_directory` VALUES ('28', '保证金解冻审批', '2', '9', '1', 'zh_CN', '28', '0');
INSERT INTO `pt_menu_directory` VALUES ('29', '供应商管理', '1', 'root', '0', 'zh_CN', '29', '0');
INSERT INTO `pt_menu_directory` VALUES ('30', '查看合作供应商', '2', '29', '1', 'zh_CN', '30', '0');
INSERT INTO `pt_menu_directory` VALUES ('31', '供应商申请待审核', '2', '29', '1', 'zh_CN', '31', '0');
INSERT INTO `pt_menu_directory` VALUES ('32', '电厂申请审核', '2', '29', '1', 'zh_CN', '32', '0');
INSERT INTO `pt_menu_directory` VALUES ('33', '年度评价', '2', '29', '1', 'zh_CN', '33', '0');
INSERT INTO `pt_menu_directory` VALUES ('34', '采购审批', '2', '17', '1', 'zh_CN', '34', '0');
INSERT INTO `pt_menu_directory` VALUES ('35', '中标下达', '2', '21', '1', 'zh_CN', '35', '0');
INSERT INTO `pt_menu_directory` VALUES ('36', '中标审核', '2', '21', '1', 'zh_CN', '36', '0');
INSERT INTO `pt_menu_directory` VALUES ('37', '查看供应商', '2', '29', '1', 'zh_CN', '37', '0');
INSERT INTO `pt_menu_directory` VALUES ('38', '供应商审核', '2', '29', '1', 'zh_CN', '38', '0');
INSERT INTO `pt_menu_directory` VALUES ('39', '电厂申请审核', '2', '29', '1', 'zh_CN', '39', '0');
INSERT INTO `pt_menu_directory` VALUES ('40', '月度评分', '2', '29', '1', 'zh_CN', '40', '0');
INSERT INTO `pt_menu_directory` VALUES ('41', '供应关系查看', '2', '29', '1', 'zh_CN', '41', '0');
INSERT INTO `pt_menu_directory` VALUES ('42', '平台用户管理', '2', '29', '1', 'zh_CN', '42', '0');
INSERT INTO `pt_menu_directory` VALUES ('43', '黑名单管理', '2', '29', '1', 'zh_CN', '43', '0');
INSERT INTO `pt_menu_directory` VALUES ('44', '年度评价', '2', '29', '1', 'zh_CN', '44', '0');
INSERT INTO `pt_menu_directory` VALUES ('45', '供应商账户查询', '2', '9', '1', 'zh_CN', '45', '0');
INSERT INTO `pt_menu_directory` VALUES ('46', '保证金台账', '2', '9', '1', 'zh_CN', '46', '0');
INSERT INTO `pt_menu_directory` VALUES ('47', '保证金收退款', '2', '9', '1', 'zh_CN', '47', '0');

-- ----------------------------
-- Table structure for pt_organ
-- ----------------------------
DROP TABLE IF EXISTS `pt_organ`;
CREATE TABLE `pt_organ` (
  `organ_uuid` int(50) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `organ_code` varchar(32) DEFAULT NULL COMMENT '组织编码',
  `organ_name` varchar(32) DEFAULT NULL COMMENT '组织名称',
  `organ_type` varchar(16) DEFAULT NULL COMMENT '组织类型',
  `parent_uuid` int(50) DEFAULT NULL COMMENT '父组织信息',
  `status` char(1) DEFAULT NULL COMMENT '是否删除',
  `modtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `description` varchar(400) DEFAULT NULL COMMENT '描述',
  `account_code` varchar(128) DEFAULT NULL COMMENT '资金账户code',
  `shortname` varchar(255) DEFAULT NULL COMMENT '组织简称',
  PRIMARY KEY (`organ_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of pt_organ
-- ----------------------------
INSERT INTO `pt_organ` VALUES ('1', '55555', '酒泉公司', '2', '-1', 'N', '2018-03-01 10:22:08', null, null, null);
INSERT INTO `pt_organ` VALUES ('2', '233333', '湖北公司', '2', '-1', 'N', '2018-03-01 10:23:00', null, null, null);
INSERT INTO `pt_organ` VALUES ('3', '111', '襄阳电厂', '3', '5', 'N', '2018-03-21 13:53:14', null, null, null);
INSERT INTO `pt_organ` VALUES ('4', 'dddf', '宣威子电厂', '3', '2', 'N', '2018-03-21 20:32:52', null, null, null);
INSERT INTO `pt_organ` VALUES ('5', '12334444', '新疆公司', '2', '-1', 'N', '2018-02-28 16:18:46', null, null, null);
INSERT INTO `pt_organ` VALUES ('6', 'sddsdsd', '山东公司', '2', '-1', 'N', '2018-03-01 09:57:07', null, null, null);
INSERT INTO `pt_organ` VALUES ('7', 'xx', '宣威子电厂2', '3', '2', 'N', '2018-03-21 20:32:55', null, null, null);
INSERT INTO `pt_organ` VALUES ('8', '55555', '武汉电厂', '3', '5', 'N', '2018-03-01 20:40:34', null, null, null);

-- ----------------------------
-- Table structure for pt_role
-- ----------------------------
DROP TABLE IF EXISTS `pt_role`;
CREATE TABLE `pt_role` (
  `role_uuid` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` varchar(32) DEFAULT NULL,
  `role_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`role_uuid`),
  KEY `ak_key_2` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of pt_role
-- ----------------------------

-- ----------------------------
-- Table structure for pt_role_res
-- ----------------------------
DROP TABLE IF EXISTS `pt_role_res`;
CREATE TABLE `pt_role_res` (
  `role_resid` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `role_uuid` int(50) NOT NULL,
  `res_uuid` int(50) DEFAULT NULL COMMENT '菜单目录id（树型结构层级编码）',
  PRIMARY KEY (`role_resid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色资源配置';

-- ----------------------------
-- Records of pt_role_res
-- ----------------------------

-- ----------------------------
-- Table structure for pt_r_role_organ
-- ----------------------------
DROP TABLE IF EXISTS `pt_r_role_organ`;
CREATE TABLE `pt_r_role_organ` (
  `dutyid` int(50) unsigned NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `name` varchar(255) DEFAULT NULL COMMENT '岗位名称',
  `organ_uuid` int(50) DEFAULT NULL COMMENT '组织ID',
  `role_uuid` int(50) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`dutyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='岗位表（角色和单位的挂接）';

-- ----------------------------
-- Records of pt_r_role_organ
-- ----------------------------

-- ----------------------------
-- Table structure for pt_r_user_duty_org
-- ----------------------------
DROP TABLE IF EXISTS `pt_r_user_duty_org`;
CREATE TABLE `pt_r_user_duty_org` (
  `user_dutyid` int(50) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_uuid` int(50) DEFAULT NULL COMMENT '用户ID',
  `dutyid` int(50) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_dutyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户、岗位对应表';

-- ----------------------------
-- Records of pt_r_user_duty_org
-- ----------------------------

-- ----------------------------
-- Table structure for pt_user
-- ----------------------------
DROP TABLE IF EXISTS `pt_user`;
CREATE TABLE `pt_user` (
  `user_uuid` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL COMMENT '登录名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `email` varchar(32) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `organ_uuid` varchar(64) DEFAULT NULL COMMENT '机构ID',
  `nice_name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `status` char(1) NOT NULL DEFAULT 'N' COMMENT '是否删除(O删除，N不删除）',
  `modtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`user_uuid`),
  KEY `ak_key_2` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of pt_user
-- ----------------------------
INSERT INTO `pt_user` VALUES ('1', 'zhuren', '123', null, null, '42554f47c8614d7f8da370d8c7803f4a', '陈主任', null, 'N', '2020-07-14 11:51:15');
INSERT INTO `pt_user` VALUES ('2', 'xiadewang', '12345', null, null, '42554f47c8614d7f8da370d8c7803f4a', '夏德旺', null, 'N', '2020-07-14 11:51:15');
INSERT INTO `pt_user` VALUES ('3', 'changzhang', '123456', null, null, '42554f47c8614d7f8da370d8c7803f4a', '刘厂长', null, 'N', '2020-07-14 11:51:15');
