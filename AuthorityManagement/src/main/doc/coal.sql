/*
Navicat MySQL Data Transfer

Source Server         : aaa
Source Server Version : 50725
Source Host           : 127.0.0.1:3306
Source Database       : coal

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2020-07-22 10:17:41
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
  `parent_id` int(50) DEFAULT NULL COMMENT '父目录id',
  `isitem` char(1) NOT NULL DEFAULT '1' COMMENT '明细否：0 非明细；1 明细',
  `locale` varchar(32) NOT NULL DEFAULT 'zh_CN' COMMENT '当前国际化标志',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '删除否：0 未删除；1 删除',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='菜单目录表';

-- ----------------------------
-- Records of pt_menu_directory
-- ----------------------------
INSERT INTO `pt_menu_directory` VALUES ('1', '事务中心', '1', '-1', '0', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('2', '待办事项', '2', '1', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('3', '采购信息', '1', '-1', '0', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('4', '采购申请查看', '2', '3', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('5', '采购执行查看', '2', '3', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('6', '报价管理', '1', '-1', '0', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('7', '参与报价', '2', '6', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('8', '报价结果', '2', '6', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('9', '保证金管理', '1', '-1', '0', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('10', '保证金账户台账', '2', '9', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('11', '保证金使用明细', '2', '9', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('12', '汇款凭证录入', '2', '9', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('13', 'test', '2', '1', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('14', '履约保证金台账', '2', '9', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('15', '供应资格管理', '1', '-1', '0', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('16', '注册对象管理', '2', '15', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('17', '采购申请管理', '1', '-1', '0', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('18', '采购需求创建', '2', '17', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('19', '采购审核', '2', '17', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('20', '采购申请查询', '2', '17', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('21', '采购执行报批', '1', '-1', '0', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('22', '采购执行查询', '2', '21', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('23', '长协交易', '1', '-1', '0', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('24', '长协交易查看', '2', '23', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('25', '长协交易创建', '2', '23', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('26', '报价保证金明细', '2', '9', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('27', '履约保证金明细', '2', '9', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('28', '保证金解冻审批', '2', '9', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('29', '供应商管理', '1', '-1', '0', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('30', '查看合作供应商', '2', '29', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('31', '供应商申请待审核', '2', '29', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('32', '电厂申请审核', '2', '29', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('33', '年度评价', '2', '29', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('34', '采购审批', '2', '17', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('35', '中标下达', '2', '21', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('36', '中标审核', '2', '21', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('37', '查看供应商', '2', '29', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('38', '供应商审核', '2', '29', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('39', '电厂申请审核', '2', '29', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('40', '月度评分', '2', '29', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('41', '供应关系查看', '2', '29', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('42', '平台用户管理', '2', '29', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('43', '黑名单管理', '2', '29', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('44', '年度评价', '2', '29', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('45', '供应商账户查询', '2', '9', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('46', '保证金台账', '2', '9', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('47', '保证金收退款', '2', '9', '1', 'zh_CN', '0');
INSERT INTO `pt_menu_directory` VALUES ('51', '嘻嘻哈哈', '1', '-1', '0', 'zh_CN', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of pt_organ
-- ----------------------------
INSERT INTO `pt_organ` VALUES ('1', '2020001', '湖北公司', '2', '-1', 'N', '2020-07-20 10:13:21', '湖北总公司', '001', '');
INSERT INTO `pt_organ` VALUES ('2', '2020002', '湖南公司', '2', '-1', 'N', '2020-07-20 10:32:08', '湖南总公司', '002', '');
INSERT INTO `pt_organ` VALUES ('3', '2020003', '武汉子电厂1', '3', '1', 'N', '2020-07-20 19:07:13', '湖北武汉子公司1', '003', '武汉厂1');
INSERT INTO `pt_organ` VALUES ('4', '2020004', '武汉子电厂2', '3', '1', 'N', '2020-07-20 19:07:24', '湖北武汉子公司2', '004', '武汉厂2');
INSERT INTO `pt_organ` VALUES ('5', '2020005', '洪山电厂', '4', '3', 'N', '2020-07-20 19:07:32', '湖北武汉洪山分公司', '005', '洪山厂');
INSERT INTO `pt_organ` VALUES ('6', '2020006', '长沙子电厂', '3', '2', 'N', '2020-07-20 19:07:36', '湖南长沙子公司', '006', '长沙厂');
INSERT INTO `pt_organ` VALUES ('7', '2020007', '襄阳子电厂', '3', '1', 'N', '2020-07-20 19:07:40', '湖北襄阳子电厂', '007', '襄阳厂');
INSERT INTO `pt_organ` VALUES ('8', '2020008', '宜昌子电厂', '3', '1', 'N', '2020-07-20 19:26:27', '湖北宜昌子电厂', '008', '宜昌厂');
INSERT INTO `pt_organ` VALUES ('9', '2020009', '武昌电厂', '4', '3', 'N', '2020-07-20 19:26:44', '湖北武汉武昌电厂', '009', '武昌厂');
INSERT INTO `pt_organ` VALUES ('10', '2020010', '汉阳电厂', '4', '4', 'N', '2020-07-20 19:26:49', '湖北武汉汉阳电厂', '010', '汉阳厂');
INSERT INTO `pt_organ` VALUES ('11', '2020011', '岳阳电厂', '3', '2', 'N', '2020-07-20 19:27:14', '湖南岳阳子电厂', '011', '岳阳厂');
INSERT INTO `pt_organ` VALUES ('12', '2020012', '衡阳电厂', '3', '2', 'N', '2020-07-20 19:27:16', '湖南衡阳子电厂', '012', '衡阳厂');
INSERT INTO `pt_organ` VALUES ('13', '2020013', '江苏电厂', '2', '-1', 'N', '2020-07-20 19:27:00', '江苏电厂', '013', '');
INSERT INTO `pt_organ` VALUES ('14', '2020014', '南京子电厂1', '3', '13', 'N', '2020-07-20 19:27:22', '江苏南京子电厂1', '014', '南京厂1');
INSERT INTO `pt_organ` VALUES ('15', '2020015', '南京子电厂2', '3', '13', 'N', '2020-07-20 19:27:24', '江苏南京子电厂2', '015', '南京厂2');
INSERT INTO `pt_organ` VALUES ('16', '2020016', '苏州子电厂', '3', '13', 'N', '2020-07-20 19:27:33', '江苏苏州子电厂', '016', '苏州厂');
INSERT INTO `pt_organ` VALUES ('17', '2020017', '无锡子电厂', '3', '13', 'N', '2020-07-20 19:27:35', '江苏无锡子电厂', '017', '无锡厂');
INSERT INTO `pt_organ` VALUES ('18', '2020018', '新疆公司', '2', '-1', 'N', '2020-07-20 19:27:04', '新疆公司', '018', '');
INSERT INTO `pt_organ` VALUES ('19', '2020019', '乌鲁木齐子电厂1', '3', '18', 'N', '2020-07-20 19:27:40', '新疆乌鲁木齐子电厂1', '019', '乌鲁木齐厂1');
INSERT INTO `pt_organ` VALUES ('20', '2020020', '乌鲁木齐子电厂2', '3', '18', 'N', '2020-07-20 19:27:42', '新疆乌鲁木齐子电厂2', '020', '乌鲁木齐厂2');

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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of pt_role
-- ----------------------------
INSERT INTO `pt_role` VALUES ('1', 'aaa', '电厂审核供应商管理员');
INSERT INTO `pt_role` VALUES ('2', 'sss', '普通煤炭供应商');
INSERT INTO `pt_role` VALUES ('3', 'zzz', '阳光用户会员中心');
INSERT INTO `pt_role` VALUES ('66', 'sss', '超级管理员');
INSERT INTO `pt_role` VALUES ('76', 'ddd', '非阳光用户会员');
INSERT INTO `pt_role` VALUES ('77', 'qqq', '普通用户');
INSERT INTO `pt_role` VALUES ('78', 'eee', '普通职员');
INSERT INTO `pt_role` VALUES ('79', 'www', '总公司电厂管理员');
INSERT INTO `pt_role` VALUES ('80', 'rrr', '分工司电厂管理员');
INSERT INTO `pt_role` VALUES ('81', 'ttt', '电厂财政管理员');
INSERT INTO `pt_role` VALUES ('82', 'yyy', '电厂实习生');
INSERT INTO `pt_role` VALUES ('83', 'ggg', '电厂人事管理员');

-- ----------------------------
-- Table structure for pt_role_res
-- ----------------------------
DROP TABLE IF EXISTS `pt_role_res`;
CREATE TABLE `pt_role_res` (
  `role_resid` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `role_uuid` int(50) NOT NULL,
  `res_uuid` int(50) DEFAULT NULL COMMENT '菜单目录id（树型结构层级编码）',
  PRIMARY KEY (`role_resid`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='角色资源配置';

-- ----------------------------
-- Records of pt_role_res
-- ----------------------------
INSERT INTO `pt_role_res` VALUES ('17', '10', '41');
INSERT INTO `pt_role_res` VALUES ('18', '10', '42');
INSERT INTO `pt_role_res` VALUES ('19', '10', '43');
INSERT INTO `pt_role_res` VALUES ('20', '10', '44');
INSERT INTO `pt_role_res` VALUES ('25', '11', '44');
INSERT INTO `pt_role_res` VALUES ('26', '1', '38');
INSERT INTO `pt_role_res` VALUES ('27', '1', '40');
INSERT INTO `pt_role_res` VALUES ('28', '1', '44');
INSERT INTO `pt_role_res` VALUES ('29', '2', '2');
INSERT INTO `pt_role_res` VALUES ('30', '2', '4');
INSERT INTO `pt_role_res` VALUES ('31', '2', '5');
INSERT INTO `pt_role_res` VALUES ('32', '2', '7');
INSERT INTO `pt_role_res` VALUES ('33', '2', '8');
INSERT INTO `pt_role_res` VALUES ('34', '3', '24');
INSERT INTO `pt_role_res` VALUES ('35', '3', '25');
INSERT INTO `pt_role_res` VALUES ('36', '66', '2');
INSERT INTO `pt_role_res` VALUES ('37', '66', '13');
INSERT INTO `pt_role_res` VALUES ('38', '66', '7');
INSERT INTO `pt_role_res` VALUES ('39', '66', '8');
INSERT INTO `pt_role_res` VALUES ('40', '66', '10');
INSERT INTO `pt_role_res` VALUES ('41', '66', '11');
INSERT INTO `pt_role_res` VALUES ('42', '66', '12');
INSERT INTO `pt_role_res` VALUES ('43', '66', '14');
INSERT INTO `pt_role_res` VALUES ('44', '66', '26');
INSERT INTO `pt_role_res` VALUES ('45', '66', '27');
INSERT INTO `pt_role_res` VALUES ('46', '66', '28');
INSERT INTO `pt_role_res` VALUES ('47', '66', '45');
INSERT INTO `pt_role_res` VALUES ('48', '66', '46');
INSERT INTO `pt_role_res` VALUES ('49', '66', '47');
INSERT INTO `pt_role_res` VALUES ('50', '66', '16');
INSERT INTO `pt_role_res` VALUES ('51', '66', '18');
INSERT INTO `pt_role_res` VALUES ('52', '66', '19');
INSERT INTO `pt_role_res` VALUES ('53', '66', '20');
INSERT INTO `pt_role_res` VALUES ('54', '66', '34');
INSERT INTO `pt_role_res` VALUES ('55', '66', '22');
INSERT INTO `pt_role_res` VALUES ('56', '66', '35');
INSERT INTO `pt_role_res` VALUES ('57', '66', '36');
INSERT INTO `pt_role_res` VALUES ('58', '66', '24');
INSERT INTO `pt_role_res` VALUES ('59', '66', '25');
INSERT INTO `pt_role_res` VALUES ('60', '66', '30');
INSERT INTO `pt_role_res` VALUES ('61', '66', '31');
INSERT INTO `pt_role_res` VALUES ('62', '66', '32');
INSERT INTO `pt_role_res` VALUES ('63', '66', '33');
INSERT INTO `pt_role_res` VALUES ('64', '66', '37');
INSERT INTO `pt_role_res` VALUES ('65', '66', '38');
INSERT INTO `pt_role_res` VALUES ('66', '66', '39');
INSERT INTO `pt_role_res` VALUES ('67', '66', '40');
INSERT INTO `pt_role_res` VALUES ('68', '66', '41');
INSERT INTO `pt_role_res` VALUES ('69', '66', '42');
INSERT INTO `pt_role_res` VALUES ('70', '66', '43');
INSERT INTO `pt_role_res` VALUES ('71', '66', '44');
INSERT INTO `pt_role_res` VALUES ('72', '66', '51');
INSERT INTO `pt_role_res` VALUES ('73', '76', '30');
INSERT INTO `pt_role_res` VALUES ('74', '76', '31');
INSERT INTO `pt_role_res` VALUES ('75', '77', '16');
INSERT INTO `pt_role_res` VALUES ('76', '77', '31');
INSERT INTO `pt_role_res` VALUES ('77', '78', '33');
INSERT INTO `pt_role_res` VALUES ('78', '78', '37');
INSERT INTO `pt_role_res` VALUES ('79', '78', '38');
INSERT INTO `pt_role_res` VALUES ('80', '79', '22');
INSERT INTO `pt_role_res` VALUES ('81', '79', '35');
INSERT INTO `pt_role_res` VALUES ('82', '79', '36');
INSERT INTO `pt_role_res` VALUES ('83', '79', '24');
INSERT INTO `pt_role_res` VALUES ('84', '79', '25');
INSERT INTO `pt_role_res` VALUES ('85', '79', '30');
INSERT INTO `pt_role_res` VALUES ('86', '80', '25');
INSERT INTO `pt_role_res` VALUES ('87', '80', '43');
INSERT INTO `pt_role_res` VALUES ('88', '80', '44');
INSERT INTO `pt_role_res` VALUES ('89', '81', '16');
INSERT INTO `pt_role_res` VALUES ('90', '81', '18');
INSERT INTO `pt_role_res` VALUES ('91', '81', '19');
INSERT INTO `pt_role_res` VALUES ('92', '81', '20');
INSERT INTO `pt_role_res` VALUES ('93', '81', '34');
INSERT INTO `pt_role_res` VALUES ('94', '81', '36');
INSERT INTO `pt_role_res` VALUES ('95', '82', '4');
INSERT INTO `pt_role_res` VALUES ('96', '82', '5');
INSERT INTO `pt_role_res` VALUES ('97', '82', '7');
INSERT INTO `pt_role_res` VALUES ('98', '82', '8');
INSERT INTO `pt_role_res` VALUES ('99', '83', '47');
INSERT INTO `pt_role_res` VALUES ('100', '83', '16');
INSERT INTO `pt_role_res` VALUES ('101', '83', '18');
INSERT INTO `pt_role_res` VALUES ('102', '83', '19');
INSERT INTO `pt_role_res` VALUES ('103', '83', '30');
INSERT INTO `pt_role_res` VALUES ('104', '83', '31');
INSERT INTO `pt_role_res` VALUES ('105', '83', '32');
INSERT INTO `pt_role_res` VALUES ('106', '83', '33');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='岗位表（角色和单位的挂接）';

-- ----------------------------
-- Records of pt_r_role_organ
-- ----------------------------
INSERT INTO `pt_r_role_organ` VALUES ('1', '电厂审核供应商管理员', '5', '1');
INSERT INTO `pt_r_role_organ` VALUES ('2', '普通煤炭供应商', '5', '2');
INSERT INTO `pt_r_role_organ` VALUES ('3', '阳光用户会员中心', '5', '3');
INSERT INTO `pt_r_role_organ` VALUES ('4', '超级管理员', '5', '66');
INSERT INTO `pt_r_role_organ` VALUES ('5', '非阳光用户会员', '5', '76');
INSERT INTO `pt_r_role_organ` VALUES ('6', '普通用户', '5', '77');
INSERT INTO `pt_r_role_organ` VALUES ('7', '普通职员', '5', '79');
INSERT INTO `pt_r_role_organ` VALUES ('8', '分工司电厂管理员', '5', '80');
INSERT INTO `pt_r_role_organ` VALUES ('9', '电厂财政管理员', '5', '81');
INSERT INTO `pt_r_role_organ` VALUES ('10', '电厂实习生', '5', '82');
INSERT INTO `pt_r_role_organ` VALUES ('11', '电厂人事管理员', '5', '83');
INSERT INTO `pt_r_role_organ` VALUES ('12', '总公司电厂管理员', '5', '79');
INSERT INTO `pt_r_role_organ` VALUES ('13', '电厂审核供应商管理员', '6', '1');
INSERT INTO `pt_r_role_organ` VALUES ('14', '普通煤炭供应商', '6', '2');
INSERT INTO `pt_r_role_organ` VALUES ('15', '阳光用户会员中心', '7', '3');
INSERT INTO `pt_r_role_organ` VALUES ('16', '超级管理员', '7', '66');
INSERT INTO `pt_r_role_organ` VALUES ('17', '非阳光用户会员', '8', '76');
INSERT INTO `pt_r_role_organ` VALUES ('18', '普通用户', '8', '77');
INSERT INTO `pt_r_role_organ` VALUES ('19', '普通职员', '9', '79');
INSERT INTO `pt_r_role_organ` VALUES ('20', '分工司电厂管理员', '9', '80');
INSERT INTO `pt_r_role_organ` VALUES ('21', '电厂财政管理员', '10', '81');
INSERT INTO `pt_r_role_organ` VALUES ('22', '电厂实习生', '10', '82');
INSERT INTO `pt_r_role_organ` VALUES ('23', '电厂人事管理员', '11', '83');
INSERT INTO `pt_r_role_organ` VALUES ('24', '总公司电厂管理员', '11', '79');

-- ----------------------------
-- Table structure for pt_r_user_duty_org
-- ----------------------------
DROP TABLE IF EXISTS `pt_r_user_duty_org`;
CREATE TABLE `pt_r_user_duty_org` (
  `user_dutyid` int(50) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_uuid` int(50) DEFAULT NULL COMMENT '用户ID',
  `dutyid` int(50) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_dutyid`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='用户、岗位对应表';

-- ----------------------------
-- Records of pt_r_user_duty_org
-- ----------------------------
INSERT INTO `pt_r_user_duty_org` VALUES ('11', '2', '19');
INSERT INTO `pt_r_user_duty_org` VALUES ('12', '2', '20');
INSERT INTO `pt_r_user_duty_org` VALUES ('16', '3', '21');
INSERT INTO `pt_r_user_duty_org` VALUES ('17', '3', '22');
INSERT INTO `pt_r_user_duty_org` VALUES ('24', '4', '19');
INSERT INTO `pt_r_user_duty_org` VALUES ('25', '4', '20');
INSERT INTO `pt_r_user_duty_org` VALUES ('33', '16', '1');
INSERT INTO `pt_r_user_duty_org` VALUES ('34', '16', '2');
INSERT INTO `pt_r_user_duty_org` VALUES ('35', '16', '3');
INSERT INTO `pt_r_user_duty_org` VALUES ('52', '5', '2');
INSERT INTO `pt_r_user_duty_org` VALUES ('53', '5', '3');
INSERT INTO `pt_r_user_duty_org` VALUES ('56', '18', '15');
INSERT INTO `pt_r_user_duty_org` VALUES ('59', '17', '22');
INSERT INTO `pt_r_user_duty_org` VALUES ('60', '6', '7');
INSERT INTO `pt_r_user_duty_org` VALUES ('61', '6', '10');
INSERT INTO `pt_r_user_duty_org` VALUES ('62', '19', '1');
INSERT INTO `pt_r_user_duty_org` VALUES ('63', '1', '19');
INSERT INTO `pt_r_user_duty_org` VALUES ('64', '1', '20');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of pt_user
-- ----------------------------
INSERT INTO `pt_user` VALUES ('1', 'zhuren', '123', '1224099293@qq.com', '15586429906', '9', '陈主任', '', 'N', '2020-07-22 10:02:07');
INSERT INTO `pt_user` VALUES ('2', 'xiadewang', '12345', '2213098293@qq.com', '15709469906', '9', '夏德旺', '', 'N', '2020-07-21 11:03:44');
INSERT INTO `pt_user` VALUES ('3', 'changzhang', '123456', '1135660243@qq.com', '13709549905', '10', '刘厂长', '', 'N', '2020-07-21 11:03:26');
INSERT INTO `pt_user` VALUES ('4', 'xiaoming', '12345', '1800740063@qq.com', '17708519906', '9', '小明', '', 'N', '2020-07-21 11:03:29');
INSERT INTO `pt_user` VALUES ('5', 'xiaohong', '111', '1207130061@qq.com', '15786519206', '5', '小红', '', 'N', '2020-07-21 11:03:33');
INSERT INTO `pt_user` VALUES ('6', '6', '123', '', '', '5', '6', '', 'N', '2020-07-22 08:21:38');
INSERT INTO `pt_user` VALUES ('7', '7', '123', null, null, null, '7', null, 'N', '2020-07-21 10:29:58');
INSERT INTO `pt_user` VALUES ('8', '8', '123', null, null, null, '8', null, 'N', '2020-07-21 10:29:58');
INSERT INTO `pt_user` VALUES ('9', '9', '123', null, null, null, '9', null, 'N', '2020-07-21 10:29:58');
INSERT INTO `pt_user` VALUES ('10', '10', '123', null, null, null, '10', null, 'N', '2020-07-21 10:29:58');
INSERT INTO `pt_user` VALUES ('11', '11', '123', null, null, null, '11', null, 'N', '2020-07-21 10:29:58');
INSERT INTO `pt_user` VALUES ('12', '12', '123', null, null, null, '12', null, 'N', '2020-07-21 10:29:58');
INSERT INTO `pt_user` VALUES ('13', '13', '123', null, null, null, '13', null, 'N', '2020-07-21 10:29:58');
INSERT INTO `pt_user` VALUES ('14', '14', '123', null, null, null, '14', null, 'N', '2020-07-21 10:29:58');
INSERT INTO `pt_user` VALUES ('15', '15', '123', null, null, null, '15', null, 'N', '2020-07-21 10:29:58');
INSERT INTO `pt_user` VALUES ('16', 'test', '123', '', '', '5', 'test', '', 'N', '2020-07-21 10:32:35');
INSERT INTO `pt_user` VALUES ('17', 'test2', '123', '', '', '10', 'test2', '', 'N', '2020-07-22 08:21:05');
INSERT INTO `pt_user` VALUES ('18', 'test3', '123', '', '', '7', 'test3', '', 'O', '2020-07-22 08:19:41');
INSERT INTO `pt_user` VALUES ('19', 'qqq', '123', '', '', '5', 'aaa', '', 'O', '2020-07-22 10:01:44');
