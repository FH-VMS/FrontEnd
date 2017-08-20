/*
Navicat MySQL Data Transfer

Source Server         : 正式
Source Server Version : 50717
Source Host           : 106.14.190.9:3306
Source Database       : db_fh

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-08-20 11:35:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `table_book`
-- ----------------------------
DROP TABLE IF EXISTS `table_book`;
CREATE TABLE `table_book` (
  `id` varchar(50) DEFAULT NULL,
  `book_chinese` varchar(200) DEFAULT NULL,
  `book_english` varchar(200) DEFAULT NULL,
  `book_russian` varchar(200) DEFAULT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_book
-- ----------------------------
INSERT INTO `table_book` VALUES ('rank', '超级管理员', null, null, '1');
INSERT INTO `table_book` VALUES ('rank', '一级客户', null, null, '2');
INSERT INTO `table_book` VALUES ('rank', '二级客户', null, null, '3');
INSERT INTO `table_book` VALUES ('rank', '三级客户', '', '', '4');
INSERT INTO `table_book` VALUES ('rank', '系统管理员', null, null, '0');
INSERT INTO `table_book` VALUES ('typetype', '饮品', null, null, '1');
INSERT INTO `table_book` VALUES ('typetype', '干果', null, null, '2');

-- ----------------------------
-- Table structure for `table_cabinet_config`
-- ----------------------------
DROP TABLE IF EXISTS `table_cabinet_config`;
CREATE TABLE `table_cabinet_config` (
  `cabinet_id` varchar(50) DEFAULT NULL,
  `cabinet_name` varchar(20) DEFAULT NULL,
  `cabinet_type` varchar(20) DEFAULT NULL,
  `layer_number` tinyint(3) DEFAULT NULL,
  `layer_goods_number` varchar(250) DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL,
  `cabinet_display` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_cabinet_config
-- ----------------------------
INSERT INTO `table_cabinet_config` VALUES ('A', '单货柜', '普通机器', '5', '7,6,5,8,8', null, 'A');
INSERT INTO `table_cabinet_config` VALUES ('2', '6*6单柜', '机器', '6', '6,6,6,6,6,6', null, 'A');
INSERT INTO `table_cabinet_config` VALUES ('3', '6*12弹框机', '普通机器', '6', '12,12,12,12,12,12', null, 'A');
INSERT INTO `table_cabinet_config` VALUES ('56658642-710b-40d6-9452-6f10f6952983', '6*8弹簧机', '弹簧机', '6', '8,8,4,8,8,8', '', 'A');

-- ----------------------------
-- Table structure for `table_client`
-- ----------------------------
DROP TABLE IF EXISTS `table_client`;
CREATE TABLE `table_client` (
  `client_id` varchar(50) DEFAULT NULL,
  `client_name` varchar(50) DEFAULT NULL,
  `client_status` varchar(20) DEFAULT NULL,
  `client_father_id` varchar(50) DEFAULT NULL,
  `client_type` varchar(20) DEFAULT NULL,
  `client_contect` varchar(50) DEFAULT NULL,
  `client_tel` varchar(50) DEFAULT NULL,
  `client_email` varchar(50) DEFAULT NULL,
  `client_country` varchar(50) DEFAULT NULL,
  `client_currency` varchar(20) DEFAULT NULL,
  `client_address` varchar(100) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `updater` varchar(50) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_client
-- ----------------------------
INSERT INTO `table_client` VALUES ('cb870f39-92ce-448e-982d-06a563efa64f', '测试', '可用', 'self', '运营商', '李', '1231232', '3@qq.com', '中国', '人民币', '顶替', null, '2016-12-21 15:57:39', null, null, null);
INSERT INTO `table_client` VALUES ('783755de-1a45-4175-84c4-6c7258289002', '小李', '可用', 'self', '运营商', '小李', '23423423', '3@wee.com', '中国', '人民币', '杭州', null, '2016-12-22 10:32:31', null, null, null);
INSERT INTO `table_client` VALUES ('b21a463f-cc82-4dbc-a332-f0be7137d9e8', 'admin1-1', '可用', 'cb870f39-92ce-448e-982d-06a563efa64f', '运营商', 'admin1-1', '2342', '', null, null, null, 'admin1', '2016-12-26 18:37:42', null, null, null);
INSERT INTO `table_client` VALUES ('fcd456a8-2d38-443a-9129-3f7bd6c29352', 'admin1-2', '可用', 'cb870f39-92ce-448e-982d-06a563efa64f', '运营商', 'admin1-2', '12321', null, null, null, null, 'admin1', '2016-12-26 18:37:59', null, null, null);
INSERT INTO `table_client` VALUES ('eb58d861-9d67-42a1-8463-cfda7f44c33e', 'admin2-1', '可用', '0faf2a0c-d26a-4e7e-8b5c-ffc4cb71ac88', '运营商', 'admin2-1', '12312', null, null, null, null, 'admin2', '2016-12-26 18:44:37', null, null, null);
INSERT INTO `table_client` VALUES ('1e11774e-81c3-4d9f-a837-7897b519422e', '杭州中新2', '可用', 'self', '运营商', '杭州中新', '123', null, null, null, null, null, '0001-01-01 00:00:00', 'root', '2017-05-23 11:32:44', null);
INSERT INTO `table_client` VALUES ('8c2855f9-44d2-4404-b241-b2a30b9740c2', '娃哈哈体验客户', '可用', 'self', '运营商', '杨', '15658110870', null, null, null, null, null, '0001-01-01 00:00:00', 'root', '2017-08-04 08:23:38', null);
INSERT INTO `table_client` VALUES ('30114348-cf8d-4130-acf9-a55343b80f53', '浙江佳合利', '可用', 'self', '运营商', '王', '15155668899', null, null, '人民币', '杭州', null, '0001-01-01 00:00:00', 'root', '2017-08-08 15:13:59', null);
INSERT INTO `table_client` VALUES ('1a44553d-f1de-4516-8095-d1ba8c4331f8', '清个个', '可用', '30114348-cf8d-4130-acf9-a55343b80f53', '运营商', '王一清', '13858108287', null, null, null, null, 'jhl0612@qq.com', '2017-08-19 16:31:46', null, null, null);

-- ----------------------------
-- Table structure for `table_corr_dms`
-- ----------------------------
DROP TABLE IF EXISTS `table_corr_dms`;
CREATE TABLE `table_corr_dms` (
  `id` varchar(50) DEFAULT NULL,
  `corr_dms_id` varchar(50) DEFAULT NULL,
  `corr_menu_id` varchar(50) DEFAULT NULL,
  `corr_add` tinyint(1) DEFAULT NULL,
  `corr_del` tinyint(1) DEFAULT NULL,
  `corr_modify` tinyint(1) DEFAULT NULL,
  `corr_search` tinyint(1) DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_corr_dms
-- ----------------------------
INSERT INTO `table_corr_dms` VALUES ('3831b2e6-7e65-4b7e-b527-a1d84a6b3a21', 'a933b45b-1fb4-4cce-91c2-d35fe8f56a93', '2', '1', '0', '0', '0', null);
INSERT INTO `table_corr_dms` VALUES ('5f5f8395-1c04-45b9-86f8-a1dfa1b8e988', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '9', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('f7c2c8df-ac41-402d-abad-d8eb2393d72a', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '10', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('8692e1ab-763d-44e7-a831-d589e5d26393', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '2', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('64aa365c-eb15-4c03-8774-452b0c7e8531', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '3', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('39c24c6d-e928-4633-bd67-dead6ea80273', '04976ff6-854a-4101-a669-115a0d64ebe2', '2', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('c9620da6-063d-4b7e-9505-3a969a9bd7a2', '04976ff6-854a-4101-a669-115a0d64ebe2', '3', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('2a750693-8fba-40a6-a7a6-29eabfd306cb', '04976ff6-854a-4101-a669-115a0d64ebe2', '5', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('1e41a3aa-f770-4298-b2c7-c6302216217a', '04976ff6-854a-4101-a669-115a0d64ebe2', '9', '0', '0', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('4b74e619-f7e4-4160-9fc9-b8c7bd14a17d', '04976ff6-854a-4101-a669-115a0d64ebe2', '10', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('027f1742-8488-4768-9107-05a6eaa328ac', '04976ff6-854a-4101-a669-115a0d64ebe2', '12', '0', '0', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('f930d645-6704-4323-9e84-0847e5469f7e', '04976ff6-854a-4101-a669-115a0d64ebe2', '13', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('bc594376-7ec3-4f23-84a6-3e987c453f96', '04976ff6-854a-4101-a669-115a0d64ebe2', '18', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('45aac2e1-1771-41e9-bb95-a2b06d1fb2de', '04976ff6-854a-4101-a669-115a0d64ebe2', '19', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('ef8b33e8-1695-487a-9f97-8876af40ec98', '04976ff6-854a-4101-a669-115a0d64ebe2', '20', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('3ac38773-341a-43a4-90eb-b7ab46ab2fc9', '04976ff6-854a-4101-a669-115a0d64ebe2', '21', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('5851a85f-2002-4e45-9ff2-fb16f01a8844', '04976ff6-854a-4101-a669-115a0d64ebe2', '23', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('7405a164-bd60-4e7b-8c48-96f70998c1bf', '04976ff6-854a-4101-a669-115a0d64ebe2', '29', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('f7500a30-41c7-46f8-a94c-b5c91bdbe89b', '04976ff6-854a-4101-a669-115a0d64ebe2', '38', '1', '1', '1', '1', null);

-- ----------------------------
-- Table structure for `table_dms`
-- ----------------------------
DROP TABLE IF EXISTS `table_dms`;
CREATE TABLE `table_dms` (
  `id` varchar(50) DEFAULT NULL,
  `dms_name` varchar(50) DEFAULT NULL,
  `rank` tinyint(4) NOT NULL,
  `remark` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_dms
-- ----------------------------
INSERT INTO `table_dms` VALUES ('f3672253-6f0a-422d-b26d-5be3d3865a7c', '一级客户', '2', null);
INSERT INTO `table_dms` VALUES ('04976ff6-854a-4101-a669-115a0d64ebe2', '超级管理员', '1', null);
INSERT INTO `table_dms` VALUES ('a933b45b-1fb4-4cce-91c2-d35fe8f56a93', '二级客户1', '3', null);

-- ----------------------------
-- Table structure for `table_goods_config`
-- ----------------------------
DROP TABLE IF EXISTS `table_goods_config`;
CREATE TABLE `table_goods_config` (
  `machine_id` varchar(50) DEFAULT NULL,
  `tunnel_id` varchar(50) DEFAULT NULL,
  `cabinet_id` varchar(50) DEFAULT NULL,
  `max_puts` int(2) DEFAULT NULL,
  `cash_prices` decimal(10,2) DEFAULT NULL,
  `wpay_prices` decimal(10,2) DEFAULT NULL,
  `alipay_prices` decimal(10,2) DEFAULT NULL,
  `ic_prices` decimal(10,2) DEFAULT NULL,
  `wares_id` varchar(50) DEFAULT NULL,
  `is_used` tinyint(1) DEFAULT NULL,
  `tunnel_position` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_goods_config
-- ----------------------------
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '1-1', '1', '9', '7.88', '7.88', '7.99', '7.88', '046aa7f6-00f8-4e5f-8c4e-88488fd78948', '0', '1-1');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '1-2', '1', '44', '0.01', '0.01', '0.01', '0.01', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '1-2');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '1-3', '1', '34', '0.01', '0.01', '0.01', '0.01', 'f0fe516e-3d10-4ea6-ac19-81adf241bcaf', '0', '1-3');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '1-4', '1', '45', '0.01', '0.01', '0.01', '0.01', 'e87eee2a-7756-499c-81ca-806a928c8e83', '0', '1-4');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '1-5', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '1-5');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '1-6', '1', '0', '0.00', '0.00', '1.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '1-6');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '1-7', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '1-7');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '2-1', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '2-1');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '2-2', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '2-2');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '2-3', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '2-3');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '2-4', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '2-4');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '2-5', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '2-5');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '2-6', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '2-6');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '3-1', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '3-1');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '3-2', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '3-2');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '3-3', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '3-3');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '3-4', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '3-4');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '3-5', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '3-5');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '4-1', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '4-1');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '4-2', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '4-2');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '4-3', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '4-3');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '4-4', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '4-4');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '4-5', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '4-5');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '4-6', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '4-6');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '4-7', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '4-7');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '4-8', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '4-8');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '5-1', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '5-1');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '5-2', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '5-2');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '5-3', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '5-3');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '5-4', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '5-4');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '5-5', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '5-5');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '5-6', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '5-6');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '5-7', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '5-7');
INSERT INTO `table_goods_config` VALUES ('ABC123456789', '5-8', '1', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '0', '5-8');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0101', '2', '3', '0.01', '0.01', '0.01', '0.01', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '1-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0102', '2', '3', '0.01', '0.01', '0.01', '0.01', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '1-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0103', '2', '3', '0.01', '0.01', '0.01', '0.01', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '1-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0104', '2', '3', '0.01', '0.01', '0.01', '0.01', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '1-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0105', '2', '3', '0.01', '0.01', '0.01', '0.01', '48c64286-a53c-40f6-8871-b9ad71179d88', '0', '1-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0106', '2', '3', '0.01', '0.01', '0.01', '0.01', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '1-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0201', '2', '3', '0.02', '0.02', '0.02', '0.02', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '2-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0202', '2', '3', '0.02', '0.02', '0.02', '0.02', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '2-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0203', '2', '3', '0.02', '0.02', '0.02', '0.02', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '2-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0204', '2', '3', '0.02', '0.02', '0.02', '0.02', '48c64286-a53c-40f6-8871-b9ad71179d88', '0', '2-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0205', '2', '3', '0.02', '0.02', '0.02', '0.02', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '2-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0206', '2', '3', '0.02', '0.02', '0.02', '0.02', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '2-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0301', '2', '3', '0.02', '0.02', '0.02', '0.02', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '3-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0302', '2', '3', '0.02', '0.02', '0.02', '0.02', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '3-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0303', '2', '3', '0.02', '0.02', '0.02', '0.02', '48c64286-a53c-40f6-8871-b9ad71179d88', '0', '3-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0304', '2', '3', '0.02', '0.02', '0.02', '0.02', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '3-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0305', '2', '3', '0.02', '0.02', '0.02', '0.02', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '3-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0306', '2', '3', '0.02', '0.02', '0.02', '0.02', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '3-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0401', '2', '3', '0.02', '0.02', '0.02', '0.02', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '4-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0402', '2', '3', '0.02', '0.02', '0.02', '0.02', '48c64286-a53c-40f6-8871-b9ad71179d88', '0', '4-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0403', '2', '3', '0.02', '0.02', '0.02', '0.02', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '4-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0404', '2', '3', '0.02', '0.02', '0.02', '0.02', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '4-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0405', '2', '3', '0.01', '0.01', '0.01', '0.01', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '4-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0406', '2', '3', '0.01', '0.01', '0.01', '0.01', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '4-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0501', '2', '3', '0.01', '0.01', '0.01', '0.01', '48c64286-a53c-40f6-8871-b9ad71179d88', '0', '5-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0502', '2', '3', '0.01', '0.01', '0.01', '0.01', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '5-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0503', '2', '3', '0.01', '0.01', '0.01', '0.01', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '5-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0504', '2', '3', '0.01', '0.01', '0.01', '0.01', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '5-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0505', '2', '3', '0.01', '0.01', '0.01', '0.01', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '5-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0506', '2', '3', '0.01', '0.01', '0.01', '0.01', '48c64286-a53c-40f6-8871-b9ad71179d88', '0', '5-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0601', '2', '3', '0.01', '0.01', '0.01', '0.01', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '6-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0602', '2', '3', '0.01', '0.01', '0.01', '0.01', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '6-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0603', '2', '3', '0.01', '0.01', '0.01', '0.01', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '6-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0604', '2', '3', '0.01', '0.01', '0.01', '0.01', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '6-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0605', '2', '3', '0.01', '0.01', '0.01', '0.01', '48c64286-a53c-40f6-8871-b9ad71179d88', '0', '6-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000002', 'A0606', '2', '3', '0.01', '0.01', '0.01', '0.01', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '6-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0101', '2', '3', '0.01', '0.01', '0.01', '0.01', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '1-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0102', '2', '3', '0.01', '0.01', '0.01', '0.01', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '1-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0103', '2', '3', '0.01', '0.01', '0.01', '0.01', '48c64286-a53c-40f6-8871-b9ad71179d88', '0', '1-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0104', '2', '3', '0.01', '0.01', '0.01', '0.01', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '1-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0105', '2', '3', '0.01', '0.01', '0.01', '0.01', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '1-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0106', '2', '3', '0.01', '0.01', '0.01', '0.01', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '1-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0201', '2', '3', '0.01', '0.01', '0.01', '0.01', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '2-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0202', '2', '3', '0.01', '0.01', '0.01', '0.01', '48c64286-a53c-40f6-8871-b9ad71179d88', '0', '2-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0203', '2', '3', '0.01', '0.01', '0.01', '0.01', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '2-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0204', '2', '3', '0.01', '0.01', '0.01', '0.01', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '2-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0205', '2', '3', '0.01', '0.01', '0.01', '0.01', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '2-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0206', '2', '3', '0.01', '0.01', '0.01', '0.01', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '2-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0301', '2', '3', '0.01', '0.01', '0.01', '0.01', '48c64286-a53c-40f6-8871-b9ad71179d88', '0', '3-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0302', '2', '3', '0.01', '0.01', '0.01', '0.01', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '3-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0303', '2', '3', '0.01', '0.01', '0.01', '0.01', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '3-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0304', '2', '3', '0.01', '0.01', '0.01', '0.01', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '3-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0305', '2', '3', '0.01', '0.01', '0.01', '0.01', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '3-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0306', '2', '3', '0.01', '0.01', '0.01', '0.01', '48c64286-a53c-40f6-8871-b9ad71179d88', '0', '3-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0401', '2', '3', '0.01', '0.01', '0.01', '0.01', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '4-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0402', '2', '3', '0.01', '0.01', '0.01', '0.01', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '4-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0403', '2', '3', '0.01', '0.01', '0.01', '0.01', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '4-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0404', '2', '3', '0.01', '0.01', '0.01', '0.01', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '4-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0405', '2', '3', '0.01', '0.01', '0.01', '0.01', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '4-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0406', '2', '3', '0.01', '0.01', '0.01', '0.01', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '4-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0501', '2', '3', '0.01', '0.01', '0.01', '0.01', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '5-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0502', '2', '3', '0.01', '0.01', '0.01', '0.01', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '5-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0503', '2', '3', '0.01', '0.01', '0.01', '0.01', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '5-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0504', '2', '3', '0.01', '0.01', '0.01', '0.01', '48c64286-a53c-40f6-8871-b9ad71179d88', '0', '5-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0505', '2', '3', '0.01', '0.01', '0.01', '0.01', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '5-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0506', '2', '3', '0.01', '0.01', '0.01', '0.01', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '5-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0601', '2', '3', '0.01', '0.01', '0.01', '0.01', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '6-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0602', '2', '3', '0.01', '0.01', '0.01', '0.01', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '6-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0603', '2', '3', '0.01', '0.01', '0.01', '0.01', '48c64286-a53c-40f6-8871-b9ad71179d88', '0', '6-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0604', '2', '3', '0.01', '0.01', '0.01', '0.01', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '6-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0605', '2', '3', '0.01', '0.01', '0.01', '0.01', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '6-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000003', 'A0606', '2', '3', '0.01', '0.01', '0.01', '0.01', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '6-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0101', '2', '6', '200.01', '200.01', '200.01', '200.01', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '1-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0102', '2', '6', '200.01', '200.01', '200.01', '200.01', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '1-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0103', '2', '6', '200.01', '200.01', '200.01', '200.01', '48c64286-a53c-40f6-8871-b9ad71179d88', '0', '1-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0104', '2', '6', '200.01', '200.01', '200.01', '200.01', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '1-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0105', '2', '6', '200.01', '200.01', '200.01', '200.01', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '1-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0106', '2', '6', '200.01', '200.01', '200.01', '200.01', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '1-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0201', '2', '6', '200.01', '200.01', '200.01', '200.01', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '2-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0202', '2', '6', '200.01', '200.01', '200.01', '200.01', '48c64286-a53c-40f6-8871-b9ad71179d88', '0', '2-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0203', '2', '6', '200.01', '200.01', '200.01', '200.01', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '2-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0204', '2', '6', '200.01', '200.01', '200.01', '200.01', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '2-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0205', '2', '6', '200.01', '200.01', '200.01', '200.01', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '2-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0206', '2', '6', '200.01', '200.01', '200.01', '200.01', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '2-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0301', '2', '6', '200.01', '200.01', '200.01', '200.01', '48c64286-a53c-40f6-8871-b9ad71179d88', '0', '3-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0302', '2', '6', '200.01', '200.01', '200.01', '200.01', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '3-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0303', '2', '6', '200.01', '200.01', '200.01', '200.01', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '3-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0304', '2', '6', '200.01', '200.01', '200.01', '200.01', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '3-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0305', '2', '6', '200.01', '200.01', '200.01', '200.01', '48c64286-a53c-40f6-8871-b9ad71179d88', '0', '3-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0306', '2', '6', '200.01', '200.01', '200.01', '200.01', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '3-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0401', '2', '6', '200.01', '200.01', '200.01', '200.01', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '4-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0402', '2', '6', '200.01', '200.01', '200.01', '200.01', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '4-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0403', '2', '6', '200.01', '200.01', '200.01', '200.01', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '4-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0404', '2', '6', '200.01', '200.01', '200.01', '200.01', '48c64286-a53c-40f6-8871-b9ad71179d88', '0', '4-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0405', '2', '6', '200.01', '200.01', '200.01', '200.01', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '4-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0406', '2', '6', '200.01', '200.01', '200.01', '200.01', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '4-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0501', '2', '6', '200.01', '200.01', '200.01', '200.01', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '5-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0502', '2', '6', '200.01', '200.01', '200.01', '200.01', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '5-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0503', '2', '6', '200.01', '200.01', '200.01', '200.01', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '5-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0504', '2', '6', '200.01', '200.01', '200.01', '200.01', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '5-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0505', '2', '6', '200.01', '200.01', '200.01', '200.01', '48c64286-a53c-40f6-8871-b9ad71179d88', '0', '5-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0506', '2', '6', '200.01', '200.01', '200.01', '200.01', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '5-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0601', '2', '6', '200.01', '200.01', '200.01', '200.01', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '6-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0602', '2', '6', '200.01', '200.01', '200.01', '200.01', '670c37a0-ba47-4e30-9784-281a25890d75', '0', '6-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0603', '2', '6', '200.01', '200.01', '200.01', '200.01', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '0', '6-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0604', '2', '6', '200.01', '200.01', '200.01', '200.01', '48c64286-a53c-40f6-8871-b9ad71179d88', '0', '6-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0605', '2', '6', '200.01', '200.01', '200.01', '200.01', 'bbca469f-1743-4179-8f79-1d7853e21ddf', '0', '6-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000004', 'A0606', '2', '6', '200.01', '200.01', '200.01', '200.01', '115af8bf-ac62-4a7e-9738-2db8629d94d8', '0', '6-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0101', '2', '14', '0.11', '0.13', '0.12', '0.14', '670c37a0-ba47-4e30-9784-281a25890d75', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0102', '2', '14', '0.11', '0.13', '0.12', '0.14', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0103', '2', '14', '0.11', '0.13', '0.12', '0.14', '48c64286-a53c-40f6-8871-b9ad71179d88', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0104', '2', '14', '0.11', '0.13', '0.12', '0.14', '670c37a0-ba47-4e30-9784-281a25890d75', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0105', '2', '14', '0.11', '0.13', '0.12', '0.14', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0106', '2', '14', '0.11', '0.13', '0.12', '0.14', '48c64286-a53c-40f6-8871-b9ad71179d88', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0201', '2', '14', '0.11', '0.13', '0.12', '0.14', '670c37a0-ba47-4e30-9784-281a25890d75', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0202', '2', '14', '0.11', '0.13', '0.12', '0.14', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0203', '2', '14', '0.11', '0.13', '0.12', '0.14', '48c64286-a53c-40f6-8871-b9ad71179d88', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0204', '2', '14', '0.11', '0.13', '0.12', '0.14', '670c37a0-ba47-4e30-9784-281a25890d75', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0205', '2', '14', '0.11', '0.13', '0.12', '0.14', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0206', '2', '14', '0.11', '0.13', '0.12', '0.14', '48c64286-a53c-40f6-8871-b9ad71179d88', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0301', '2', '5', '0.00', '0.01', '0.01', '0.00', '670c37a0-ba47-4e30-9784-281a25890d75', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0302', '2', '5', '0.00', '0.01', '0.01', '0.00', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0303', '2', '5', '0.00', '0.01', '0.01', '0.00', '48c64286-a53c-40f6-8871-b9ad71179d88', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0304', '2', '5', '0.00', '0.01', '0.01', '0.00', '670c37a0-ba47-4e30-9784-281a25890d75', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0305', '2', '5', '0.00', '0.01', '0.01', '0.00', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '1', '3-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0306', '2', '5', '0.00', '0.01', '0.01', '0.00', '48c64286-a53c-40f6-8871-b9ad71179d88', '1', '3-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0401', '2', '5', '0.00', '0.01', '0.01', '0.00', '670c37a0-ba47-4e30-9784-281a25890d75', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0402', '2', '5', '0.00', '0.01', '0.01', '0.00', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0403', '2', '5', '0.00', '0.01', '0.01', '0.00', '48c64286-a53c-40f6-8871-b9ad71179d88', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0404', '2', '5', '0.00', '0.01', '0.01', '0.00', '670c37a0-ba47-4e30-9784-281a25890d75', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0405', '2', '5', '0.00', '0.01', '0.01', '0.00', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0406', '2', '5', '0.00', '0.01', '0.01', '0.00', '48c64286-a53c-40f6-8871-b9ad71179d88', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0501', '2', '5', '0.00', '0.01', '0.01', '0.00', '670c37a0-ba47-4e30-9784-281a25890d75', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0502', '2', '5', '0.00', '0.01', '0.01', '0.00', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0503', '2', '5', '0.00', '0.01', '0.01', '0.00', '48c64286-a53c-40f6-8871-b9ad71179d88', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0504', '2', '5', '0.00', '0.01', '0.01', '0.00', '48c64286-a53c-40f6-8871-b9ad71179d88', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0505', '2', '5', '0.00', '0.01', '0.01', '0.00', '670c37a0-ba47-4e30-9784-281a25890d75', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0506', '2', '5', '100.00', '100.00', '100.00', '100.00', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0601', '2', '5', '100.00', '100.00', '100.00', '100.00', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0602', '2', '5', '100.00', '100.00', '100.00', '100.00', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0603', '2', '5', '100.00', '100.00', '100.00', '100.00', '48c64286-a53c-40f6-8871-b9ad71179d88', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0604', '2', '5', '100.00', '100.00', '100.00', '100.00', '670c37a0-ba47-4e30-9784-281a25890d75', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0605', '2', '5', '100.00', '100.00', '100.00', '100.00', 'a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('FKHZ00000001', 'A0606', '2', '5', '0.00', '0.01', '0.01', '0.00', '48c64286-a53c-40f6-8871-b9ad71179d88', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0101', 'A', '10', '0.01', '0.01', '0.01', '0.01', '046aa7f6-00f8-4e5f-8c4e-88488fd78948', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0102', 'A', '10', '0.01', '0.01', '0.01', '0.01', 'f0fe516e-3d10-4ea6-ac19-81adf241bcaf', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0103', 'A', '10', '5.00', '5.00', '5.00', '5.00', 'e87eee2a-7756-499c-81ca-806a928c8e83', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0104', 'A', '10', '5.00', '5.00', '5.00', '5.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0105', 'A', '10', '5.00', '5.00', '5.00', '5.00', '046aa7f6-00f8-4e5f-8c4e-88488fd78948', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0106', 'A', '10', '5.00', '5.00', '5.00', '5.00', 'f0fe516e-3d10-4ea6-ac19-81adf241bcaf', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0107', 'A', '10', '0.00', '0.01', '0.01', '0.00', 'e87eee2a-7756-499c-81ca-806a928c8e83', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0201', 'A', '10', '0.02', '0.02', '0.02', '0.02', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0202', 'A', '10', '0.02', '0.02', '0.02', '0.02', '046aa7f6-00f8-4e5f-8c4e-88488fd78948', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0203', 'A', '10', '0.00', '0.00', '0.00', '0.00', 'f0fe516e-3d10-4ea6-ac19-81adf241bcaf', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0204', 'A', '10', '0.00', '0.00', '0.00', '0.00', 'e87eee2a-7756-499c-81ca-806a928c8e83', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0205', 'A', '10', '0.01', '0.01', '0.01', '0.01', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0206', 'A', '10', '0.01', '0.01', '0.01', '0.01', '046aa7f6-00f8-4e5f-8c4e-88488fd78948', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0301', 'A', '10', '0.03', '0.03', '0.03', '0.03', 'f0fe516e-3d10-4ea6-ac19-81adf241bcaf', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0302', 'A', '10', '0.03', '0.03', '0.03', '0.03', 'e87eee2a-7756-499c-81ca-806a928c8e83', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0303', 'A', '10', '0.03', '0.03', '0.03', '0.03', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0304', 'A', '10', '0.00', '0.00', '0.00', '0.00', 'e87eee2a-7756-499c-81ca-806a928c8e83', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0305', 'A', '10', '0.00', '0.00', '0.00', '0.00', 'f0fe516e-3d10-4ea6-ac19-81adf241bcaf', '1', '3-5');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0401', 'A', '10', '0.04', '0.04', '0.04', '0.04', '046aa7f6-00f8-4e5f-8c4e-88488fd78948', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0402', 'A', '10', '0.04', '0.04', '0.04', '0.04', 'f0fe516e-3d10-4ea6-ac19-81adf241bcaf', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0403', 'A', '10', '0.04', '0.04', '0.04', '0.04', 'e87eee2a-7756-499c-81ca-806a928c8e83', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0404', 'A', '10', '0.04', '0.04', '0.04', '0.04', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0405', 'A', '10', '0.00', '0.00', '0.00', '0.00', '046aa7f6-00f8-4e5f-8c4e-88488fd78948', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0406', 'A', '10', '0.00', '0.00', '0.00', '0.00', 'f0fe516e-3d10-4ea6-ac19-81adf241bcaf', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0407', 'A', '10', '0.00', '0.00', '0.00', '0.00', 'e87eee2a-7756-499c-81ca-806a928c8e83', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0408', 'A', '10', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0501', 'A', '6', '0.05', '0.05', '0.05', '0.05', '046aa7f6-00f8-4e5f-8c4e-88488fd78948', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0502', 'A', '6', '0.05', '0.05', '0.05', '0.05', 'f0fe516e-3d10-4ea6-ac19-81adf241bcaf', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0503', 'A', '6', '0.05', '0.05', '0.05', '0.05', 'e87eee2a-7756-499c-81ca-806a928c8e83', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0504', 'A', '6', '0.05', '0.05', '0.05', '0.05', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0505', 'A', '6', '0.05', '0.05', '0.05', '0.05', '046aa7f6-00f8-4e5f-8c4e-88488fd78948', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0506', 'A', '0', '0.00', '0.00', '0.00', '0.00', 'f0fe516e-3d10-4ea6-ac19-81adf241bcaf', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0507', 'A', '0', '0.00', '0.00', '0.00', '0.00', 'e87eee2a-7756-499c-81ca-806a928c8e83', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('ABC000000001', 'A0508', 'A', '0', '0.00', '0.00', '0.00', '0.00', 'e891427d-61a3-4db7-8a7a-36b1ad30620d', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0101', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.02', '0.01', '0.01', '0.02', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0102', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0103', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0104', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0105', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0106', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0107', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0108', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-8');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0201', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0202', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0203', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0204', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0205', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0206', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0207', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-7');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0208', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-8');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0301', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0302', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0303', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '7d4e09d9-dd3d-423f-9b1b-1b3933fc9466', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0304', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '7d4e09d9-dd3d-423f-9b1b-1b3933fc9466', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0401', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0402', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0403', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0404', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0405', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'ee7a4613-1686-4f2c-87ba-8f5059ec420e', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0406', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'ee7a4613-1686-4f2c-87ba-8f5059ec420e', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0407', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'ee7a4613-1686-4f2c-87ba-8f5059ec420e', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0408', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'ee7a4613-1686-4f2c-87ba-8f5059ec420e', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0501', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0502', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0503', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0504', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0505', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0506', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0507', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0508', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0601', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0602', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0603', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0604', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0605', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0606', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0607', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('CJLB17070001', 'A0608', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0101', '3', '6', '5.00', '5.00', '5.00', '5.00', '128f6cd3-41fc-4448-8837-654d97811169', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0102', '3', '6', '5.00', '5.00', '5.00', '5.00', '128f6cd3-41fc-4448-8837-654d97811169', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0103', '3', '6', '5.00', '5.00', '5.00', '5.00', '128f6cd3-41fc-4448-8837-654d97811169', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0104', '3', '6', '5.00', '5.00', '5.00', '5.00', '128f6cd3-41fc-4448-8837-654d97811169', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0105', '3', '6', '5.00', '5.00', '5.00', '5.00', '128f6cd3-41fc-4448-8837-654d97811169', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0106', '3', '6', '5.00', '5.00', '5.00', '5.00', '128f6cd3-41fc-4448-8837-654d97811169', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0107', '3', '6', '5.00', '5.00', '5.00', '5.00', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0108', '3', '6', '5.00', '5.00', '5.00', '5.00', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '1-8');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0109', '3', '6', '5.00', '5.00', '5.00', '5.00', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '1-9');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0110', '3', '6', '3.00', '3.00', '3.00', '3.00', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-10');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0111', '3', '6', '5.00', '5.00', '5.00', '5.00', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '1-11');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0112', '3', '6', '5.00', '5.00', '5.00', '5.00', 'f2408a65-3355-49dc-b0ad-0f98861943fa', '1', '1-12');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0201', '3', '3', '5.00', '5.00', '5.00', '5.00', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0202', '3', '3', '5.00', '5.00', '5.00', '5.00', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0203', '3', '3', '8.00', '8.00', '8.00', '8.00', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0204', '3', '3', '5.00', '5.00', '5.00', '5.00', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0205', '3', '3', '8.00', '8.00', '8.00', '8.00', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0206', '3', '3', '5.00', '5.00', '5.00', '5.00', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0207', '3', '3', '5.00', '5.00', '5.00', '5.00', '7d4e09d9-dd3d-423f-9b1b-1b3933fc9466', '1', '2-7');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0208', '3', '3', '8.00', '8.00', '8.00', '8.00', '7d4e09d9-dd3d-423f-9b1b-1b3933fc9466', '1', '2-8');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0209', '3', '3', '8.00', '8.00', '8.00', '8.00', '7d4e09d9-dd3d-423f-9b1b-1b3933fc9466', '1', '2-9');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0210', '3', '3', '8.00', '8.00', '8.00', '8.00', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '2-10');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0211', '3', '3', '5.00', '5.00', '5.00', '5.00', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '2-11');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0212', '3', '3', '5.00', '5.00', '5.00', '5.00', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '2-12');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0301', '3', '6', '0.02', '0.02', '0.02', '0.02', '128f6cd3-41fc-4448-8837-654d97811169', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0302', '3', '6', '0.02', '0.02', '0.02', '0.02', '128f6cd3-41fc-4448-8837-654d97811169', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0303', '3', '6', '0.02', '0.02', '0.02', '0.02', '128f6cd3-41fc-4448-8837-654d97811169', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0304', '3', '6', '0.02', '0.02', '0.02', '0.02', '128f6cd3-41fc-4448-8837-654d97811169', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0305', '3', '6', '0.02', '0.02', '0.02', '0.02', '128f6cd3-41fc-4448-8837-654d97811169', '1', '3-5');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0306', '3', '6', '0.02', '0.02', '0.02', '0.02', '128f6cd3-41fc-4448-8837-654d97811169', '1', '3-6');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0307', '3', '6', '0.02', '0.02', '0.02', '0.02', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '3-7');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0308', '3', '6', '0.02', '0.02', '0.02', '0.02', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '3-8');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0309', '3', '6', '0.02', '0.02', '0.02', '0.02', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '3-9');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0310', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '3-10');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0311', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '3-11');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0312', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '3-12');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0401', '3', '5', '3.50', '3.50', '3.50', '3.50', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0402', '3', '5', '3.50', '3.50', '3.50', '3.50', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0403', '3', '5', '3.50', '3.50', '3.50', '3.50', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0404', '3', '5', '3.50', '3.50', '3.50', '3.50', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0405', '3', '5', '3.00', '3.00', '3.00', '3.00', 'ee7a4613-1686-4f2c-87ba-8f5059ec420e', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0406', '3', '5', '3.00', '3.00', '3.00', '3.00', 'ee7a4613-1686-4f2c-87ba-8f5059ec420e', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0407', '3', '5', '3.00', '3.00', '3.00', '3.00', 'ee7a4613-1686-4f2c-87ba-8f5059ec420e', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0408', '3', '5', '3.00', '3.00', '3.00', '3.00', 'ee7a4613-1686-4f2c-87ba-8f5059ec420e', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0409', '3', '5', '3.00', '3.00', '3.00', '3.00', '966457b3-0ce7-4cff-b371-d87cf0544579', '1', '4-9');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0410', '3', '5', '3.00', '3.00', '3.00', '3.00', '966457b3-0ce7-4cff-b371-d87cf0544579', '1', '4-10');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0411', '3', '5', '3.00', '3.00', '3.00', '3.00', '966457b3-0ce7-4cff-b371-d87cf0544579', '1', '4-11');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0412', '3', '5', '3.00', '3.00', '3.00', '3.00', '966457b3-0ce7-4cff-b371-d87cf0544579', '1', '4-12');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0501', '3', '5', '2.00', '1.70', '1.70', '2.00', '829467a1-90d9-4d16-bb2c-4fee2a401164', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0502', '3', '5', '2.00', '1.70', '1.70', '2.00', '829467a1-90d9-4d16-bb2c-4fee2a401164', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0503', '3', '5', '2.00', '1.70', '1.70', '2.00', '829467a1-90d9-4d16-bb2c-4fee2a401164', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0504', '3', '5', '2.00', '1.70', '1.70', '2.00', '829467a1-90d9-4d16-bb2c-4fee2a401164', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0505', '3', '5', '2.00', '1.70', '1.70', '2.00', '829467a1-90d9-4d16-bb2c-4fee2a401164', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0506', '3', '5', '2.00', '2.00', '2.00', '2.00', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0507', '3', '5', '2.50', '2.50', '2.50', '2.50', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0508', '3', '5', '2.50', '2.50', '2.50', '2.50', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0509', '3', '5', '2.50', '2.50', '2.50', '2.50', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-9');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0510', '3', '5', '2.50', '2.50', '2.50', '2.50', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-10');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0511', '3', '5', '2.50', '2.50', '2.50', '2.50', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-11');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0512', '3', '5', '2.50', '2.50', '2.50', '2.50', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-12');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0601', '3', '5', '3.50', '3.50', '3.50', '3.50', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0602', '3', '5', '3.50', '3.50', '3.50', '3.50', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0603', '3', '5', '3.50', '3.50', '3.50', '3.50', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0604', '3', '5', '3.50', '3.50', '3.50', '3.50', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0605', '3', '5', '3.50', '3.50', '3.50', '3.50', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0606', '3', '5', '3.50', '3.50', '3.50', '3.50', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0607', '3', '5', '3.50', '3.50', '3.50', '3.50', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0608', '3', '5', '3.50', '3.50', '3.50', '3.50', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0609', '3', '5', '3.50', '3.50', '3.50', '3.50', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-9');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0610', '3', '5', '3.50', '3.50', '3.50', '3.50', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-10');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0611', '3', '5', '3.50', '3.50', '3.50', '3.50', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-11');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0612', '3', '5', '3.50', '3.50', '3.50', '3.50', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-12');

-- ----------------------------
-- Table structure for `table_goods_status`
-- ----------------------------
DROP TABLE IF EXISTS `table_goods_status`;
CREATE TABLE `table_goods_status` (
  `goods_stu_id` varchar(50) DEFAULT NULL,
  `machine_id` varchar(50) DEFAULT NULL,
  `curr_stock` int(10) DEFAULT NULL,
  `curr_missing` int(10) DEFAULT NULL,
  `fault_code` char(5) DEFAULT NULL,
  `fault_describe` varchar(200) DEFAULT NULL,
  `curr_status` tinyint(2) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `cabinet_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_goods_status
-- ----------------------------
INSERT INTO `table_goods_status` VALUES ('A0101', 'FKHZ00000001', '1', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0102', 'FKHZ00000001', '3', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0103', 'FKHZ00000001', '3', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0104', 'FKHZ00000001', '3', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0105', 'FKHZ00000001', '3', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0106', 'FKHZ00000001', '3', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0201', 'FKHZ00000001', '3', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0202', 'FKHZ00000001', '3', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0203', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0204', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0205', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0206', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0301', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0302', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0303', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0304', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0305', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0306', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0401', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0402', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0403', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0404', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0405', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0406', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0501', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0502', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0503', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0504', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0505', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0506', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0601', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0602', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0603', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0604', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0605', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0606', 'FKHZ00000001', '5', '0', null, null, '1', '2017-05-16 00:46:31', '2');
INSERT INTO `table_goods_status` VALUES ('A0101', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0102', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0103', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0104', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0105', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0106', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0201', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0202', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0203', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0204', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0205', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0206', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0301', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0302', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0303', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0304', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0305', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0306', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0401', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0402', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0403', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0404', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0405', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0406', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0501', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0502', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0503', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0504', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0505', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0506', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0601', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0602', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0603', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0604', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0605', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0606', 'FKHZ00000004', '6', '6', null, null, '0', '2017-05-22 14:25:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0101', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0102', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0103', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0104', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0105', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0106', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0201', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0202', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0203', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0204', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0205', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0206', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0301', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0302', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0303', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0304', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0305', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0306', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0401', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0402', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0403', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0404', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0405', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0406', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0501', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0502', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0503', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0504', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0505', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0506', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0601', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0602', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0603', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0604', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0605', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0606', 'FKHZ00000002', '3', '3', null, null, '0', '2017-06-06 10:04:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0101', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:18:54', '2');
INSERT INTO `table_goods_status` VALUES ('A0102', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:18:55', '2');
INSERT INTO `table_goods_status` VALUES ('A0103', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:18:56', '2');
INSERT INTO `table_goods_status` VALUES ('A0104', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:18:57', '2');
INSERT INTO `table_goods_status` VALUES ('A0105', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:18:58', '2');
INSERT INTO `table_goods_status` VALUES ('A0106', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:18:59', '2');
INSERT INTO `table_goods_status` VALUES ('A0201', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:00', '2');
INSERT INTO `table_goods_status` VALUES ('A0202', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:01', '2');
INSERT INTO `table_goods_status` VALUES ('A0203', 'FKHZ00000003', '2', '3', null, null, '1', '2017-06-15 15:19:02', '2');
INSERT INTO `table_goods_status` VALUES ('A0204', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:03', '2');
INSERT INTO `table_goods_status` VALUES ('A0205', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:05', '2');
INSERT INTO `table_goods_status` VALUES ('A0206', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:06', '2');
INSERT INTO `table_goods_status` VALUES ('A0301', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:06', '2');
INSERT INTO `table_goods_status` VALUES ('A0302', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:07', '2');
INSERT INTO `table_goods_status` VALUES ('A0303', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:08', '2');
INSERT INTO `table_goods_status` VALUES ('A0304', 'FKHZ00000003', '2', '3', null, null, '1', '2017-06-15 15:19:10', '2');
INSERT INTO `table_goods_status` VALUES ('A0305', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:12', '2');
INSERT INTO `table_goods_status` VALUES ('A0306', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:13', '2');
INSERT INTO `table_goods_status` VALUES ('A0401', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0402', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:14', '2');
INSERT INTO `table_goods_status` VALUES ('A0403', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:17', '2');
INSERT INTO `table_goods_status` VALUES ('A0404', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:18', '2');
INSERT INTO `table_goods_status` VALUES ('A0405', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:19', '2');
INSERT INTO `table_goods_status` VALUES ('A0406', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:19', '2');
INSERT INTO `table_goods_status` VALUES ('A0501', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:20', '2');
INSERT INTO `table_goods_status` VALUES ('A0502', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:21', '2');
INSERT INTO `table_goods_status` VALUES ('A0503', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:21', '2');
INSERT INTO `table_goods_status` VALUES ('A0504', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:22', '2');
INSERT INTO `table_goods_status` VALUES ('A0505', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:23', '2');
INSERT INTO `table_goods_status` VALUES ('A0506', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:24', '2');
INSERT INTO `table_goods_status` VALUES ('A0601', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:26', '2');
INSERT INTO `table_goods_status` VALUES ('A0602', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:27', '2');
INSERT INTO `table_goods_status` VALUES ('A0603', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:27', '2');
INSERT INTO `table_goods_status` VALUES ('A0604', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:28', '2');
INSERT INTO `table_goods_status` VALUES ('A0605', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:29', '2');
INSERT INTO `table_goods_status` VALUES ('A0606', 'FKHZ00000003', '3', '3', null, null, '1', '2017-06-15 15:19:29', '2');
INSERT INTO `table_goods_status` VALUES ('A0509', 'JL5710000001', '4', '5', null, null, '1', '2017-06-16 09:18:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0510', 'JL5710000001', '4', '5', null, null, '1', '2017-06-16 09:18:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0101', 'ABC000000001', '10', '10', null, null, '1', '2017-06-26 16:59:45', 'A');
INSERT INTO `table_goods_status` VALUES ('A0102', 'ABC000000001', '10', '10', null, null, '1', '2017-06-26 16:59:45', 'A');
INSERT INTO `table_goods_status` VALUES ('A0103', 'ABC000000001', '10', '10', null, null, '1', '2017-06-26 15:53:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0104', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0105', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0106', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0107', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0201', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0202', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0203', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0204', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0205', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0206', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0301', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0302', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0303', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0304', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0305', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0401', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0402', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0403', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0404', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0405', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0406', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0407', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0408', 'ABC000000001', '10', '10', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0501', 'ABC000000001', '6', '6', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0502', 'ABC000000001', '6', '6', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0503', 'ABC000000001', '6', '6', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0504', 'ABC000000001', '6', '6', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0505', 'ABC000000001', '6', '6', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0506', 'ABC000000001', '0', '0', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0507', 'ABC000000001', '0', '0', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0508', 'ABC000000001', '0', '0', null, null, '1', '2017-06-16 09:37:20', 'A');
INSERT INTO `table_goods_status` VALUES ('A0101', 'JL5710000001', '1', '0', null, null, '1', '2017-07-19 11:10:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0102', 'JL5710000001', '5', '0', null, null, '1', '2017-07-01 14:46:56', '3');
INSERT INTO `table_goods_status` VALUES ('A0103', 'JL5710000001', '4', '0', null, null, '1', '2017-07-01 14:46:56', '3');
INSERT INTO `table_goods_status` VALUES ('A0104', 'JL5710000001', '6', '0', null, null, '1', '2017-07-01 14:46:56', '3');
INSERT INTO `table_goods_status` VALUES ('A0105', 'JL5710000001', '6', '0', null, null, '1', '2017-07-01 14:46:56', '3');
INSERT INTO `table_goods_status` VALUES ('A0107', 'JL5710000001', '6', '0', null, null, '1', '2017-07-01 14:46:56', '3');
INSERT INTO `table_goods_status` VALUES ('A0108', 'JL5710000001', '6', '0', null, null, '1', '2017-07-01 14:46:56', '3');
INSERT INTO `table_goods_status` VALUES ('A0101', 'CJLB17070001', '8', '0', null, null, '1', '2017-07-01 14:55:35', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0102', 'CJLB17070001', '8', '0', null, null, '1', '2017-07-01 14:55:35', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0103', 'CJLB17070001', '8', '0', null, null, '1', '2017-07-01 14:55:35', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0104', 'CJLB17070001', '8', '0', null, null, '1', '2017-07-01 14:55:35', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0105', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:35', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0106', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0107', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0108', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0201', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0202', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0203', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0204', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0205', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0206', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0207', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0208', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0301', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0302', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0303', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0304', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0401', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0402', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0403', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0404', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0405', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0406', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0407', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0408', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0501', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0502', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0503', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0504', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0505', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0506', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0507', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0508', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0601', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0602', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0603', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0604', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:36', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0605', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:40', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0606', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:40', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0607', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:40', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0608', 'CJLB17070001', '5', '0', null, null, '1', '2017-07-01 14:55:40', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0201', 'JL5710000001', '3', '0', null, null, '2', '2017-07-24 22:15:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0203', 'JL5710000001', '3', '0', null, null, '2', '2017-07-24 22:15:21', '3');
INSERT INTO `table_goods_status` VALUES ('A0205', 'JL5710000001', '3', '0', null, null, '2', '2017-07-24 22:15:26', '3');
INSERT INTO `table_goods_status` VALUES ('A0210', 'JL5710000001', '3', '0', null, null, '2', '2017-07-24 22:15:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0211', 'JL5710000001', '1', '0', null, null, '1', '2017-07-24 17:10:04', '3');
INSERT INTO `table_goods_status` VALUES ('A0302', 'JL5710000001', '6', '0', null, null, '2', '2017-07-25 10:18:55', '3');
INSERT INTO `table_goods_status` VALUES ('A0303', 'JL5710000001', '6', '0', null, null, '2', '2017-07-25 10:18:56', '3');
INSERT INTO `table_goods_status` VALUES ('A0304', 'JL5710000001', '6', '0', null, null, '2', '2017-07-25 10:18:58', '3');
INSERT INTO `table_goods_status` VALUES ('A0305', 'JL5710000001', '6', '0', null, null, '2', '2017-07-25 10:18:59', '3');
INSERT INTO `table_goods_status` VALUES ('A0306', 'JL5710000001', '6', '0', null, null, '2', '2017-07-25 10:19:11', '3');
INSERT INTO `table_goods_status` VALUES ('A0307', 'JL5710000001', '6', '0', null, null, '2', '2017-07-25 10:19:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0308', 'JL5710000001', '6', '0', null, null, '2', '2017-07-25 10:19:17', '3');
INSERT INTO `table_goods_status` VALUES ('A0309', 'JL5710000001', '6', '0', null, null, '2', '2017-07-25 10:19:19', '3');
INSERT INTO `table_goods_status` VALUES ('A0310', 'JL5710000001', '6', '0', null, null, '2', '2017-07-25 10:19:21', '3');
INSERT INTO `table_goods_status` VALUES ('A0311', 'JL5710000001', '6', '0', null, null, '2', '2017-07-25 10:19:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0312', 'JL5710000001', '6', '0', null, null, '2', '2017-07-25 10:19:24', '3');
INSERT INTO `table_goods_status` VALUES ('A0401', 'JL5710000001', '0', '0', null, null, '1', '2017-07-24 17:10:04', '3');
INSERT INTO `table_goods_status` VALUES ('A0402', 'JL5710000001', '0', '0', null, null, '1', '2017-07-24 17:10:04', '3');
INSERT INTO `table_goods_status` VALUES ('A0403', 'JL5710000001', '1', '0', null, null, '1', '2017-07-24 17:10:04', '3');
INSERT INTO `table_goods_status` VALUES ('A0404', 'JL5710000001', '4', '0', null, null, '1', '2017-07-24 17:10:04', '3');
INSERT INTO `table_goods_status` VALUES ('A0405', 'JL5710000001', '2', '0', null, null, '1', '2017-07-24 17:10:04', '3');
INSERT INTO `table_goods_status` VALUES ('A0406', 'JL5710000001', '2', '0', null, null, '1', '2017-07-24 17:10:04', '3');
INSERT INTO `table_goods_status` VALUES ('A0409', 'JL5710000001', '4', '0', null, null, '1', '2017-07-24 17:10:04', '3');
INSERT INTO `table_goods_status` VALUES ('A0207', 'JL5710000001', '3', '0', null, null, '2', '2017-07-25 08:57:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0301', 'JL5710000001', '6', '0', null, null, '2', '2017-07-25 10:18:53', '3');
INSERT INTO `table_goods_status` VALUES ('A0202', 'JL5710000001', '3', '0', null, null, '2', '2017-07-25 08:56:54', '3');
INSERT INTO `table_goods_status` VALUES ('A0110', 'JL5710000001', '6', '0', null, null, '1', '2017-07-27 20:44:38', '3');
INSERT INTO `table_goods_status` VALUES ('A0112', 'JL5710000001', '6', '0', null, null, '1', '2017-07-27 20:44:38', '3');
INSERT INTO `table_goods_status` VALUES ('A0607', 'JL5710000001', '0', '0', null, null, '1', '2017-07-27 22:59:09', '3');
INSERT INTO `table_goods_status` VALUES ('A0608', 'JL5710000001', '0', '0', null, null, '1', '2017-07-27 22:59:09', '3');
INSERT INTO `table_goods_status` VALUES ('A0609', 'JL5710000001', '2', '0', null, null, '1', '2017-07-27 22:59:09', '3');
INSERT INTO `table_goods_status` VALUES ('A0610', 'JL5710000001', '2', '0', null, null, '1', '2017-07-27 22:59:09', '3');
INSERT INTO `table_goods_status` VALUES ('A0611', 'JL5710000001', '2', '0', null, null, '1', '2017-07-27 22:59:09', '3');
INSERT INTO `table_goods_status` VALUES ('A0612', 'JL5710000001', '3', '0', null, null, '1', '2017-07-27 22:59:09', '3');
INSERT INTO `table_goods_status` VALUES ('A0204', 'JL5710000001', '2', '0', null, null, '1', '2017-07-29 19:49:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0206', 'JL5710000001', '3', '0', null, null, '1', '2017-07-29 19:49:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0106', 'JL5710000001', '2', '0', null, null, '1', '2017-08-07 16:16:24', '3');
INSERT INTO `table_goods_status` VALUES ('A0111', 'JL5710000001', '0', '0', null, null, '1', '2017-08-07 16:16:25', '3');
INSERT INTO `table_goods_status` VALUES ('A0208', 'JL5710000001', '1', '0', null, null, '1', '2017-08-07 16:16:25', '3');
INSERT INTO `table_goods_status` VALUES ('A0209', 'JL5710000001', '1', '0', null, null, '1', '2017-08-07 16:16:25', '3');
INSERT INTO `table_goods_status` VALUES ('A0212', 'JL5710000001', '2', '0', null, null, '1', '2017-08-07 16:16:25', '3');
INSERT INTO `table_goods_status` VALUES ('A0407', 'JL5710000001', '0', '0', null, null, '1', '2017-08-07 16:16:25', '3');
INSERT INTO `table_goods_status` VALUES ('A0511', 'JL5710000001', '0', '0', null, null, '1', '2017-08-07 16:16:25', '3');
INSERT INTO `table_goods_status` VALUES ('A0512', 'JL5710000001', '0', '0', null, null, '1', '2017-08-07 16:16:25', '3');
INSERT INTO `table_goods_status` VALUES ('A0109', 'JL5710000001', '0', '0', null, null, '1', '2017-08-07 16:22:32', '3');
INSERT INTO `table_goods_status` VALUES ('A0408', 'JL5710000001', '0', '0', null, null, '1', '2017-08-07 16:22:32', '3');
INSERT INTO `table_goods_status` VALUES ('A0507', 'JL5710000001', '0', '0', null, null, '1', '2017-08-07 16:22:32', '3');
INSERT INTO `table_goods_status` VALUES ('A0508', 'JL5710000001', '0', '0', null, null, '1', '2017-08-07 16:22:32', '3');
INSERT INTO `table_goods_status` VALUES ('A0606', 'JL5710000001', '0', '0', null, null, '1', '2017-08-07 16:22:32', '3');
INSERT INTO `table_goods_status` VALUES ('A0602', 'JL5710000001', '0', '0', null, null, '1', '2017-08-13 17:17:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0603', 'JL5710000001', '3', '0', null, null, '1', '2017-08-13 17:17:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0604', 'JL5710000001', '3', '0', null, null, '1', '2017-08-13 17:17:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0605', 'JL5710000001', '2', '0', null, null, '1', '2017-08-13 17:17:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0601', 'JL5710000001', '0', '0', null, null, '1', '2017-08-13 17:19:47', '3');
INSERT INTO `table_goods_status` VALUES ('A0410', 'JL5710000001', '4', '0', null, null, '1', '2017-08-13 17:51:36', '3');
INSERT INTO `table_goods_status` VALUES ('A0411', 'JL5710000001', '3', '0', null, null, '1', '2017-08-13 17:51:36', '3');
INSERT INTO `table_goods_status` VALUES ('A0412', 'JL5710000001', '0', '0', null, null, '1', '2017-08-13 17:51:36', '3');
INSERT INTO `table_goods_status` VALUES ('A0502', 'JL5710000001', '4', '0', null, null, '1', '2017-08-13 17:51:36', '3');
INSERT INTO `table_goods_status` VALUES ('A0503', 'JL5710000001', '4', '0', null, null, '1', '2017-08-13 17:51:36', '3');
INSERT INTO `table_goods_status` VALUES ('A0504', 'JL5710000001', '2', '0', null, null, '1', '2017-08-13 17:51:36', '3');
INSERT INTO `table_goods_status` VALUES ('A0505', 'JL5710000001', '4', '0', null, null, '1', '2017-08-13 17:51:36', '3');
INSERT INTO `table_goods_status` VALUES ('A0506', 'JL5710000001', '0', '0', null, null, '1', '2017-08-13 17:51:36', '3');
INSERT INTO `table_goods_status` VALUES ('A0501', 'JL5710000001', '2', '0', null, null, '1', '2017-08-13 17:51:50', '3');

-- ----------------------------
-- Table structure for `table_ic_account`
-- ----------------------------
DROP TABLE IF EXISTS `table_ic_account`;
CREATE TABLE `table_ic_account` (
  `ic_account` varchar(50) DEFAULT NULL,
  `ic_password` varchar(32) DEFAULT NULL,
  `ic_contacts` varchar(50) DEFAULT NULL,
  `ic_tel` varchar(50) DEFAULT NULL,
  `ic_email` varchar(50) DEFAULT NULL,
  `ic_address` varchar(100) DEFAULT NULL,
  `ic_status` tinyint(2) DEFAULT NULL,
  `client_id` char(10) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `updater` varchar(50) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_ic_account
-- ----------------------------

-- ----------------------------
-- Table structure for `table_ic_info1`
-- ----------------------------
DROP TABLE IF EXISTS `table_ic_info1`;
CREATE TABLE `table_ic_info1` (
  `ic_id` varchar(50) DEFAULT NULL,
  `ic_account` varchar(50) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `updater` varchar(50) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `corr_remark` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_ic_info1
-- ----------------------------

-- ----------------------------
-- Table structure for `table_ic_status`
-- ----------------------------
DROP TABLE IF EXISTS `table_ic_status`;
CREATE TABLE `table_ic_status` (
  `ic_id` varchar(50) DEFAULT NULL,
  `ic_period_balance` decimal(10,2) DEFAULT NULL,
  `ic_curr_balance` decimal(10,2) DEFAULT NULL,
  `ic_status` tinyint(2) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_ic_status
-- ----------------------------

-- ----------------------------
-- Table structure for `table_machine`
-- ----------------------------
DROP TABLE IF EXISTS `table_machine`;
CREATE TABLE `table_machine` (
  `machine_id` varchar(50) DEFAULT NULL,
  `device_id` varchar(50) DEFAULT NULL,
  `type_id` varchar(50) DEFAULT NULL,
  `client_id` varchar(50) DEFAULT NULL,
  `usr_account` varchar(50) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `stop_date` datetime DEFAULT NULL,
  `stop_reason` varchar(200) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `updater` varchar(50) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL,
  `latest_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_machine
-- ----------------------------
INSERT INTO `table_machine` VALUES ('ABC123456789', '12345', '32984fed-48ac-48ad-ac02-2dd028a2beb8', 'cb870f39-92ce-448e-982d-06a563efa64f', 'c4fdeab3-d61b-491e-b223-8b610ee02a5d', '2016-12-01 09:33:21', '2016-12-09 09:33:24', null, 'root', '2016-12-27 17:33:27', 'root', '2016-12-27 21:23:41', null, null);
INSERT INTO `table_machine` VALUES ('ba37426d-3025-4698-b034-39c1821900da', 'AW009LS123', '56cea9ce-1d87-4e37-9398-e37346276188', '783755de-1a45-4175-84c4-6c7258289002', '7c04a2e6-e03b-4133-b6fd-3690464bcd38', '2016-12-01 12:12:23', '2016-12-31 12:12:26', null, 'root', '2016-12-31 20:12:31', 'root', '2017-01-10 18:16:54', null, null);
INSERT INTO `table_machine` VALUES ('25795909-ed7a-4c9c-b58f-36d3dd14a552', 'AW001', '32984fed-48ac-48ad-ac02-2dd028a2beb8', 'd82cc1be-0254-470a-b925-615444a806af', '477e407a-f2b9-4598-b5cf-3e1e0067c0ec', '2016-12-01 12:33:10', '2016-12-31 12:33:12', null, 'root', '2016-12-31 20:33:15', null, null, null, null);
INSERT INTO `table_machine` VALUES ('FKHZ00000001', 'FKHZ00000001', '4a058f34-0647-4c38-9a9f-35ea32372c9b', '8c2855f9-44d2-4404-b241-b2a30b9740c2', '285d29b4-aca0-496c-8750-9f8a5b360549', '2017-05-13 15:34:05', null, null, 'root', '2017-05-13 23:34:01', null, null, null, '2017-05-19 20:54:22');
INSERT INTO `table_machine` VALUES ('FKHZ00000002', 'FKHZ00000002', '4a058f34-0647-4c38-9a9f-35ea32372c9b', '8c2855f9-44d2-4404-b241-b2a30b9740c2', '285d29b4-aca0-496c-8750-9f8a5b360549', '2017-05-13 15:34:24', null, null, 'root', '2017-05-13 23:34:18', null, null, null, '2017-08-10 17:56:18');
INSERT INTO `table_machine` VALUES ('FKHZ00000003', 'FKHZ00000003', '4a058f34-0647-4c38-9a9f-35ea32372c9b', '8c2855f9-44d2-4404-b241-b2a30b9740c2', '285d29b4-aca0-496c-8750-9f8a5b360549', '2017-05-13 15:34:38', null, null, 'root', '2017-05-13 23:34:31', null, null, null, '2017-06-21 16:18:28');
INSERT INTO `table_machine` VALUES ('FKHZ00000004', 'FKHZ00000004', '4a058f34-0647-4c38-9a9f-35ea32372c9b', '8c2855f9-44d2-4404-b241-b2a30b9740c2', '285d29b4-aca0-496c-8750-9f8a5b360549', '2017-05-13 15:34:52', null, null, 'root', '2017-05-13 23:34:44', null, null, null, '2017-05-23 13:10:43');
INSERT INTO `table_machine` VALUES ('JL5710000001', 'JL5710000001', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '1a44553d-f1de-4516-8095-d1ba8c4331f8', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-06-12 04:12:07', '2018-06-12 04:12:10', null, 'root', '2017-06-12 12:13:47', 'jhl0612@qq.com', '2017-08-20 08:39:57', null, '2017-08-20 11:36:38');
INSERT INTO `table_machine` VALUES ('CJLB17070001', 'CJLB17070001', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-07-01 05:17:39', '2018-07-01 05:17:41', null, 'root', '2017-07-01 13:19:25', null, null, null, '2017-08-19 17:54:21');
INSERT INTO `table_machine` VALUES ('ABC000000001', 'ABC000000001', '32984fed-48ac-48ad-ac02-2dd028a2beb8', 'cb870f39-92ce-448e-982d-06a563efa64f', 'c4fdeab3-d61b-491e-b223-8b610ee02a5d', '2017-08-02 03:49:43', null, null, 'root', '2017-08-09 11:49:48', null, null, null, '2017-08-20 11:07:54');
INSERT INTO `table_machine` VALUES ('JHLA17080001', 'JHLA17080001', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:42:10', '2018-08-20 00:42:20', null, 'root', '2017-08-20 08:44:33', null, null, null, null);
INSERT INTO `table_machine` VALUES ('JHLA17080002', 'JHLA17080002', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:43:07', '2017-08-20 00:43:09', null, 'root', '2017-08-20 08:45:19', 'jhl0612@qq.com', '2017-08-20 09:00:26', null, null);
INSERT INTO `table_machine` VALUES ('JHLA17080003', 'JHLA17080003', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:43:47', '2017-08-20 00:43:50', null, 'root', '2017-08-20 08:45:59', null, null, null, null);
INSERT INTO `table_machine` VALUES ('JHLA17080004', 'JHLA17080004', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:46:42', '2017-08-20 00:46:46', null, 'root', '2017-08-20 08:48:55', null, null, null, null);
INSERT INTO `table_machine` VALUES ('JHLA17080005', 'JHLA17080005', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:47:02', '2017-08-20 00:47:04', null, 'root', '2017-08-20 08:49:13', null, null, null, null);
INSERT INTO `table_machine` VALUES ('JHLA17080006', 'JHLA17080006', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:47:23', '2017-08-20 00:47:25', null, 'root', '2017-08-20 08:49:34', null, null, null, null);
INSERT INTO `table_machine` VALUES ('JHLA17080007', 'JHLA17080007', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:47:47', '2017-08-20 00:47:50', null, 'root', '2017-08-20 08:49:59', null, null, null, null);
INSERT INTO `table_machine` VALUES ('JHLA17080008', 'JHLA17080008', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:48:09', '2017-08-20 00:48:11', null, 'root', '2017-08-20 08:50:20', null, null, null, null);
INSERT INTO `table_machine` VALUES ('JHLB17080001', 'JHLB17080001', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:48:32', '2017-08-20 00:48:35', null, 'root', '2017-08-20 08:50:49', 'root', '2017-08-20 08:52:33', null, null);
INSERT INTO `table_machine` VALUES ('JHLB17080002', 'JHLB17080002', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:49:17', '2018-08-20 00:49:20', null, 'root', '2017-08-20 08:51:32', null, null, null, null);
INSERT INTO `table_machine` VALUES ('JHLB17080003', 'JHLB17080003', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:53:53', '2018-08-20 00:53:56', null, 'root', '2017-08-20 08:56:09', null, null, null, null);
INSERT INTO `table_machine` VALUES ('JHLB17080004', 'JHLB17080004', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:54:24', '2018-08-20 00:54:27', null, 'root', '2017-08-20 08:56:39', null, null, null, null);
INSERT INTO `table_machine` VALUES ('JHLB17080005', 'JHLB17080005', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:54:48', '2018-08-20 00:54:50', null, 'root', '2017-08-20 08:57:02', null, null, null, null);
INSERT INTO `table_machine` VALUES ('JHLB17080006', 'JHLB17080006', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:55:33', '2018-08-20 00:55:35', null, 'root', '2017-08-20 08:57:47', null, null, null, null);
INSERT INTO `table_machine` VALUES ('JHLB17080007', 'JHLB17080007', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:55:57', '2018-08-20 00:55:59', null, 'root', '2017-08-20 08:58:13', null, null, null, null);
INSERT INTO `table_machine` VALUES ('JHLB17080008', 'JHLB17080008', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:56:18', '2018-08-20 00:56:20', null, 'root', '2017-08-20 08:58:31', null, null, null, null);

-- ----------------------------
-- Table structure for `table_machine_config`
-- ----------------------------
DROP TABLE IF EXISTS `table_machine_config`;
CREATE TABLE `table_machine_config` (
  `machine_id` varchar(50) DEFAULT NULL,
  `mc_status` varchar(10) DEFAULT NULL,
  `mc_activity` varchar(50) DEFAULT NULL,
  `mc_alipay_enable` tinyint(1) DEFAULT NULL,
  `mc_wpay_enable` tinyint(1) DEFAULT NULL,
  `mc_billpay_enable` tinyint(1) DEFAULT NULL,
  `mc_billchange_enable` tinyint(1) DEFAULT NULL,
  `mc_coinpay_enable` tinyint(1) DEFAULT NULL,
  `mc_coinchange_enable` tinyint(1) DEFAULT NULL,
  `mc_upay_enable` tinyint(1) DEFAULT NULL,
  `mc_icpay_enable` tinyint(1) DEFAULT NULL,
  `mc_lift_enable` tinyint(1) DEFAULT NULL,
  `mc_infrared_enable` tinyint(1) DEFAULT NULL,
  `mc_area1_temp` varchar(10) DEFAULT NULL,
  `mc_area2_temp` varchar(10) DEFAULT NULL,
  `mc_area3_temp` varchar(10) DEFAULT NULL,
  `mc_area4_temp` varchar(10) DEFAULT NULL,
  `mc_goods_used` varchar(10) DEFAULT NULL,
  `mc_longitude` varchar(10) DEFAULT NULL,
  `mc_dimension` varchar(10) DEFAULT NULL,
  `updater` varchar(50) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_machine_config
-- ----------------------------
INSERT INTO `table_machine_config` VALUES ('ABC123456789', '1', '促销', '1', '1', '1', '0', '1', '0', '1', '1', '1', '0', '12', '4', '5', '5.5', '12', '132', '88', 'root', '2017-03-20 15:16:05', '备注1');
INSERT INTO `table_machine_config` VALUES ('ba37426d-3025-4698-b034-39c1821900da', '1', 'ddd123', '1', '1', '0', '0', '0', '0', '1', '1', '1', '0', '12', '13', '12', '12', '12', '12', '12', 'root', '2017-05-01 15:33:59', null);
INSERT INTO `table_machine_config` VALUES ('25795909-ed7a-4c9c-b58f-36d3dd14a552', '1', '12', '1', '1', '0', '0', '0', '0', '0', '0', '1', '0', '12', '12', '12', '12', '80', '12', '12', 'root', '2017-05-01 15:42:54', null);
INSERT INTO `table_machine_config` VALUES ('FKHZ00000001', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '8', null, null, null, null, null, null, 'ysq123456@qq.com', '2017-05-19 17:59:24', null);
INSERT INTO `table_machine_config` VALUES ('FKHZ00000002', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '8', null, null, null, null, null, null, 'ysq123456@qq.com', '2017-05-19 20:49:42', null);
INSERT INTO `table_machine_config` VALUES ('FKHZ00000004', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '8', null, null, null, null, null, null, 'ysq123456@qq.com', '2017-05-19 20:54:19', null);
INSERT INTO `table_machine_config` VALUES ('FKHZ00000003', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '8', null, null, null, null, null, null, 'ysq123456@qq.com', '2017-05-19 20:54:26', null);
INSERT INTO `table_machine_config` VALUES ('JL5710000001', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '8', null, null, null, null, null, null, 'root', '2017-06-12 12:17:05', null);
INSERT INTO `table_machine_config` VALUES ('CJLB17070001', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '8', null, null, null, null, null, null, 'jhl0612@qq.com', '2017-07-01 18:39:13', null);
INSERT INTO `table_machine_config` VALUES ('JHLA17080001', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, 'jhl0612@qq.com', '2017-08-20 09:57:23', null);
INSERT INTO `table_machine_config` VALUES ('JHLA17080002', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, 'jhl0612@qq.com', '2017-08-20 09:57:36', null);
INSERT INTO `table_machine_config` VALUES ('JHLA17080003', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, 'jhl0612@qq.com', '2017-08-20 09:57:44', null);
INSERT INTO `table_machine_config` VALUES ('JHLA17080004', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, 'jhl0612@qq.com', '2017-08-20 09:57:54', null);
INSERT INTO `table_machine_config` VALUES ('JHLA17080005', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, 'jhl0612@qq.com', '2017-08-20 09:58:05', null);
INSERT INTO `table_machine_config` VALUES ('JHLA17080006', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, 'jhl0612@qq.com', '2017-08-20 09:58:13', null);
INSERT INTO `table_machine_config` VALUES ('JHLA17080007', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, 'jhl0612@qq.com', '2017-08-20 09:58:21', null);
INSERT INTO `table_machine_config` VALUES ('JHLA17080008', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, 'jhl0612@qq.com', '2017-08-20 09:58:29', null);
INSERT INTO `table_machine_config` VALUES ('JHLB17080001', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, 'jhl0612@qq.com', '2017-08-20 09:58:44', null);
INSERT INTO `table_machine_config` VALUES ('JHLB17080002', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, 'jhl0612@qq.com', '2017-08-20 09:58:52', null);
INSERT INTO `table_machine_config` VALUES ('JHLB17080003', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, 'jhl0612@qq.com', '2017-08-20 09:58:59', null);
INSERT INTO `table_machine_config` VALUES ('JHLB17080004', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, 'jhl0612@qq.com', '2017-08-20 09:59:06', null);
INSERT INTO `table_machine_config` VALUES ('JHLB17080005', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, 'jhl0612@qq.com', '2017-08-20 09:59:16', null);
INSERT INTO `table_machine_config` VALUES ('JHLB17080006', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, 'jhl0612@qq.com', '2017-08-20 09:59:26', null);
INSERT INTO `table_machine_config` VALUES ('JHLB17080007', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, 'jhl0612@qq.com', '2017-08-20 09:59:36', null);
INSERT INTO `table_machine_config` VALUES ('JHLB17080008', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, 'jhl0612@qq.com', '2017-08-20 09:59:46', null);

-- ----------------------------
-- Table structure for `table_machine_log`
-- ----------------------------
DROP TABLE IF EXISTS `table_machine_log`;
CREATE TABLE `table_machine_log` (
  `id` varchar(50) DEFAULT NULL,
  `machine_id` varchar(50) DEFAULT NULL,
  `machine_curr_status` tinyint(2) DEFAULT NULL,
  `machine_run_status` varchar(10) DEFAULT NULL,
  `machine_status_dis` varchar(50) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_machine_log
-- ----------------------------

-- ----------------------------
-- Table structure for `table_machine_money`
-- ----------------------------
DROP TABLE IF EXISTS `table_machine_money`;
CREATE TABLE `table_machine_money` (
  `machine_id` varchar(50) DEFAULT NULL,
  `ali_money` float(10,2) DEFAULT NULL,
  `wx_money` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_machine_money
-- ----------------------------

-- ----------------------------
-- Table structure for `table_machine_status`
-- ----------------------------
DROP TABLE IF EXISTS `table_machine_status`;
CREATE TABLE `table_machine_status` (
  `id` varchar(50) DEFAULT NULL,
  `machine_id` varchar(50) DEFAULT NULL,
  `machine_curr_status` tinyint(2) DEFAULT NULL,
  `machine_issign` tinyint(1) DEFAULT NULL,
  `machine_in_temp` smallint(5) DEFAULT NULL,
  `machine_out_temp` smallint(5) DEFAULT NULL,
  `machine_door_stu` tinyint(1) DEFAULT NULL,
  `machine_area1_temp` smallint(5) DEFAULT NULL,
  `machine_area2_temp` smallint(5) DEFAULT NULL,
  `machine_area3_temp` smallint(5) DEFAULT NULL,
  `machine_area4_temp` smallint(5) DEFAULT NULL,
  `fault_code` char(5) DEFAULT NULL,
  `goods_num` int(4) DEFAULT NULL,
  `fault_describe` varchar(200) DEFAULT NULL,
  `drv1_hw_currvision` varchar(20) DEFAULT NULL,
  `drv1_sf_currvision` varchar(20) DEFAULT NULL,
  `main_sf_currvision` varchar(20) DEFAULT NULL,
  `main_hw_currvision` varchar(20) DEFAULT NULL,
  `drv2_hw_currvision` varchar(20) DEFAULT NULL,
  `drv2_sf_currvision` varchar(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_machine_status
-- ----------------------------

-- ----------------------------
-- Table structure for `table_machine_type`
-- ----------------------------
DROP TABLE IF EXISTS `table_machine_type`;
CREATE TABLE `table_machine_type` (
  `id` varchar(50) DEFAULT NULL,
  `type_name` varchar(50) DEFAULT NULL,
  `type_type` varchar(50) DEFAULT NULL,
  `max_goods` int(4) DEFAULT NULL,
  `type_remark` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_machine_type
-- ----------------------------
INSERT INTO `table_machine_type` VALUES ('a69dc85d-bb6b-4831-bca7-fc3a3fe39728', '奶茶机', '1', '19', '奶茶机');
INSERT INTO `table_machine_type` VALUES ('32984fed-48ac-48ad-ac02-2dd028a2beb8', '传统机器', '2', '12', '传统');
INSERT INTO `table_machine_type` VALUES ('56cea9ce-1d87-4e37-9398-e37346276188', '测试机型', '2', '80', '1234');
INSERT INTO `table_machine_type` VALUES ('4a058f34-0647-4c38-9a9f-35ea32372c9b', '娃哈哈6*6机型', '1', '36', '娃哈哈测试');
INSERT INTO `table_machine_type` VALUES ('6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '弹簧机12货道', '1', '72', '');
INSERT INTO `table_machine_type` VALUES ('f93572e5-15db-4547-a3ce-4adb148eb6ba', '弹簧机8货道', '1', '48', '');

-- ----------------------------
-- Table structure for `table_machine_vision`
-- ----------------------------
DROP TABLE IF EXISTS `table_machine_vision`;
CREATE TABLE `table_machine_vision` (
  `id` varchar(50) DEFAULT NULL,
  `mv_type_id` varchar(50) DEFAULT NULL,
  `mv_main_hw_newvision` varchar(20) DEFAULT NULL,
  `mv_main_sf_newvision` varchar(20) DEFAULT NULL,
  `mv_main_sf_path` varchar(100) DEFAULT NULL,
  `mv_drv1_hw_newvision` varchar(20) DEFAULT NULL,
  `mv_drv1_sf_newvision` varchar(20) DEFAULT NULL,
  `mv_drv1_sf_path` varchar(100) DEFAULT NULL,
  `mv_drv2_hw_newvision` varchar(20) DEFAULT NULL,
  `mv_drv2_sf_newvision` varchar(20) DEFAULT NULL,
  `mv_drv2_sf_path` varchar(100) DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_machine_vision
-- ----------------------------

-- ----------------------------
-- Table structure for `table_menu`
-- ----------------------------
DROP TABLE IF EXISTS `table_menu`;
CREATE TABLE `table_menu` (
  `menu_id` varchar(50) DEFAULT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `menu_father` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_menu
-- ----------------------------
INSERT INTO `table_menu` VALUES ('1', '业务管理', null, null, 'fa fa-star-half-o');
INSERT INTO `table_menu` VALUES ('2', '客户列表', '1', 'customer', null);
INSERT INTO `table_menu` VALUES ('3', '用户列表', '1', 'user', null);
INSERT INTO `table_menu` VALUES ('4', '权限配置', '1', 'auth', null);
INSERT INTO `table_menu` VALUES ('5', '商品列表', '1', 'productlist', null);
INSERT INTO `table_menu` VALUES ('6', '商品配置', '1', null, null);
INSERT INTO `table_menu` VALUES ('7', '商品入库', '1', null, null);
INSERT INTO `table_menu` VALUES ('8', '商品图片列表', '1', null, null);
INSERT INTO `table_menu` VALUES ('9', '机器管理', '1', 'machinelist', null);
INSERT INTO `table_menu` VALUES ('10', '机器配置', '1', 'machineconfig', null);
INSERT INTO `table_menu` VALUES ('12', '货道配置', '1', 'tunnelconfig', null);
INSERT INTO `table_menu` VALUES ('13', '货道信息', '1', 'tunnelinfo', null);
INSERT INTO `table_menu` VALUES ('14', 'IC卡用户表', '1', null, null);
INSERT INTO `table_menu` VALUES ('15', 'IC卡列表', '1', null, null);
INSERT INTO `table_menu` VALUES ('16', 'IC卡充值', '1', null, null);
INSERT INTO `table_menu` VALUES ('17', '运营查看', null, null, 'fa fa-cart-arrow-down');
INSERT INTO `table_menu` VALUES ('18', '客户运营信息', '17', 'customerinfo', null);
INSERT INTO `table_menu` VALUES ('19', '用户运营信息', '17', 'userinfo', null);
INSERT INTO `table_menu` VALUES ('20', '机器配置信息', '17', 'machineconfiginfo', null);
INSERT INTO `table_menu` VALUES ('21', '机器货道信息', '17', 'tunnelinfo', null);
INSERT INTO `table_menu` VALUES ('22', '机器实时状态', '17', null, null);
INSERT INTO `table_menu` VALUES ('23', '机器当前库存', '17', null, null);
INSERT INTO `table_menu` VALUES ('24', '机器位置地图', '17', 'machinemap', null);
INSERT INTO `table_menu` VALUES ('25', '商品低库存', '17', null, null);
INSERT INTO `table_menu` VALUES ('26', '补货单生成', '17', 'tunnelfullfil', null);
INSERT INTO `table_menu` VALUES ('27', '机器故障单', '17', null, null);
INSERT INTO `table_menu` VALUES ('28', '实时销售记录', '17', null, null);
INSERT INTO `table_menu` VALUES ('29', '非现金销售记录', '17', 'salecashless', null);
INSERT INTO `table_menu` VALUES ('30', 'IC卡销售记录', '17', null, null);
INSERT INTO `table_menu` VALUES ('31', 'IC卡黑名单账户', '17', null, null);
INSERT INTO `table_menu` VALUES ('32', '运营设置', null, null, 'fa fa-cogs');
INSERT INTO `table_menu` VALUES ('33', '补货修改', '32', null, null);
INSERT INTO `table_menu` VALUES ('34', '货道价格修改', '32', null, null);
INSERT INTO `table_menu` VALUES ('35', '报表管理\r\n', null, null, 'fa fa-bar-chart');
INSERT INTO `table_menu` VALUES ('37', '用户参数', '36', null, null);
INSERT INTO `table_menu` VALUES ('38', '密码修改', '36', 'changepwd', null);
INSERT INTO `table_menu` VALUES ('39', '系统设置', null, null, 'fa fa-asterisk');
INSERT INTO `table_menu` VALUES ('40', '商品类型表', '39', null, null);
INSERT INTO `table_menu` VALUES ('41', '商品供应商表', '39', null, null);
INSERT INTO `table_menu` VALUES ('42', '支付配置', '39', null, null);
INSERT INTO `table_menu` VALUES ('43', '货柜列表', '39', 'machinecabinet', null);
INSERT INTO `table_menu` VALUES ('44', '机型列表', '39', 'machinetype', null);
INSERT INTO `table_menu` VALUES ('45', '机型配置', '39', '', null);
INSERT INTO `table_menu` VALUES ('46', '远程更新(指定机器)', '39', null, null);
INSERT INTO `table_menu` VALUES ('47', '远程更新(指定机型)', '39', null, null);
INSERT INTO `table_menu` VALUES ('36', '用户设置', null, null, 'fa fa-user-circle-o');
INSERT INTO `table_menu` VALUES ('11', '机器迁移', '1', null, null);

-- ----------------------------
-- Table structure for `table_mt_goods`
-- ----------------------------
DROP TABLE IF EXISTS `table_mt_goods`;
CREATE TABLE `table_mt_goods` (
  `machine_type_id` varchar(50) DEFAULT NULL,
  `cabinet_type_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_mt_goods
-- ----------------------------
INSERT INTO `table_mt_goods` VALUES ('32984fed-48ac-48ad-ac02-2dd028a2beb8', 'A');
INSERT INTO `table_mt_goods` VALUES ('4a058f34-0647-4c38-9a9f-35ea32372c9b', '2');
INSERT INTO `table_mt_goods` VALUES ('6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '3');
INSERT INTO `table_mt_goods` VALUES ('56cea9ce-1d87-4e37-9398-e37346276188', 'A');
INSERT INTO `table_mt_goods` VALUES ('a69dc85d-bb6b-4831-bca7-fc3a3fe39728', 'A');
INSERT INTO `table_mt_goods` VALUES ('f93572e5-15db-4547-a3ce-4adb148eb6ba', '56658642-710b-40d6-9452-6f10f6952983');

-- ----------------------------
-- Table structure for `table_operation`
-- ----------------------------
DROP TABLE IF EXISTS `table_operation`;
CREATE TABLE `table_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opt_content` varchar(100) DEFAULT NULL,
  `opt_date` datetime DEFAULT NULL,
  `operator` varchar(50) DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL,
  `machine_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_operation
-- ----------------------------
INSERT INTO `table_operation` VALUES ('1', '一键补货', '2017-06-16 15:49:28', '机器端', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('2', '新增或修改用户信息', '2017-06-16 17:00:45', 'root', '45045234-ed93-4623-b03e-404ab2c56dd8', null);
INSERT INTO `table_operation` VALUES ('3', '删除用户', '2017-06-16 17:01:33', 'root', '45045234-ed93-4623-b03e-404ab2c56dd8', null);
INSERT INTO `table_operation` VALUES ('4', '货道配置添加', '2017-06-16 17:02:08', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('5', '货道停用或启用', '2017-06-16 17:02:29', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('6', '货道停用或启用', '2017-06-16 17:02:35', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('7', '手机补充库存', '2017-06-26 15:08:16', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('8', '手机补充库存', '2017-06-26 15:10:34', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('9', '手机补充库存', '2017-06-26 15:10:52', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('10', '手机补充库存', '2017-06-26 15:11:21', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('11', '手机补充库存', '2017-06-26 15:15:26', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('12', '手机补充库存', '2017-06-26 15:21:09', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('13', '手机补充库存', '2017-06-26 15:22:21', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('14', '手机补充库存', '2017-06-26 15:23:49', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('15', '手机补充库存', '2017-06-26 15:25:02', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('16', '手机补充库存', '2017-06-26 15:25:33', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('17', '手机补充库存', '2017-06-26 15:26:00', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('18', '手机补充库存', '2017-06-26 15:26:52', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('19', '手机补充库存', '2017-06-26 15:27:26', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('20', '手机补充库存', '2017-06-26 15:27:54', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('21', '手机补充库存', '2017-06-26 15:29:10', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('22', '手机补充库存', '2017-06-26 15:32:08', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('23', '手机补充库存', '2017-06-26 15:33:19', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('24', '手机补充库存', '2017-06-26 15:33:27', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('25', '手机补充库存', '2017-06-26 15:34:01', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('26', '手机补充库存', '2017-06-26 15:34:29', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('27', '手机补充库存', '2017-06-26 15:39:57', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('28', '手机补充库存', '2017-06-26 15:40:01', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('29', '手机补充库存', '2017-06-26 15:50:23', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('30', '手机补充库存', '2017-06-26 15:53:20', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('31', '手机补充库存', '2017-06-26 16:59:42', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('32', '手机补充库存', '2017-06-26 16:59:45', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('33', '一键补货', '2017-06-29 20:27:29', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('34', '一键补货', '2017-06-29 20:27:32', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('35', '货道停用', '2017-06-29 20:56:47', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('36', '货道启用', '2017-06-29 20:56:49', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('37', '机器端设置价格和库存', '2017-06-29 21:02:26', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('38', '机器端设置价格和库存', '2017-06-29 21:02:29', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('39', '添加机器', '2017-06-30 08:55:20', 'root', null, 'JL571B000002');
INSERT INTO `table_operation` VALUES ('40', '机器端设置价格和库存', '2017-07-01 08:34:50', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('41', '一键补货', '2017-07-01 10:32:21', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('42', '一键补货', '2017-07-01 10:32:25', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('43', '更新机器', '2017-07-01 12:42:32', 'root', null, 'JL571B000002');
INSERT INTO `table_operation` VALUES ('44', '更新客户', '2017-07-01 12:42:57', 'root', '30114348-cf8d-4130-acf9-a55343b80f53', null);
INSERT INTO `table_operation` VALUES ('45', '更新机器', '2017-07-01 12:48:45', 'root', null, 'JL571B000002');
INSERT INTO `table_operation` VALUES ('46', '机器配置删除', '2017-07-01 13:14:32', 'root', null, 'JL571B000002');
INSERT INTO `table_operation` VALUES ('47', '删除机器', '2017-07-01 13:14:32', 'root', null, 'JL571B000002');
INSERT INTO `table_operation` VALUES ('48', '添加机器', '2017-07-01 13:15:04', 'root', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('49', '机器配置删除', '2017-07-01 13:16:44', 'root', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('50', '机器配置添加', '2017-07-01 13:16:44', 'root', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('51', '机器配置删除', '2017-07-01 13:16:52', 'root', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('52', '机器配置添加', '2017-07-01 13:16:52', 'root', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('53', '机器配置删除', '2017-07-01 13:17:03', 'root', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('54', '机器配置添加', '2017-07-01 13:17:03', 'root', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('55', '机器配置删除', '2017-07-01 13:19:07', 'root', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('56', '删除机器', '2017-07-01 13:19:07', 'root', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('57', '添加机器', '2017-07-01 13:19:25', 'root', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('58', '货道配置添加', '2017-07-01 13:22:25', 'root', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('59', '机器端设置价格和库存', '2017-07-01 13:23:24', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('60', '机器端设置价格和库存', '2017-07-01 13:23:26', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('61', '一键补货', '2017-07-01 14:30:33', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('62', '一键补货', '2017-07-01 14:30:37', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('63', '按货道补货', '2017-07-01 14:31:40', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('64', '按货道补货', '2017-07-01 14:31:47', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('65', '机器端设置价格和库存', '2017-07-01 14:31:54', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('66', '机器端设置价格和库存', '2017-07-01 14:32:30', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('67', '按货道补货', '2017-07-01 14:32:34', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('68', '按货道补货', '2017-07-01 14:32:37', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('69', '按货道补货', '2017-07-01 14:32:43', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('70', '机器端设置价格和库存', '2017-07-01 14:32:57', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('71', '机器端设置价格和库存', '2017-07-01 14:33:01', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('72', '机器端设置价格和库存', '2017-07-01 14:33:08', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('73', '按货道补货', '2017-07-01 14:34:22', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('74', '按货道补货', '2017-07-01 14:34:26', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('75', '按货道补货', '2017-07-01 14:34:32', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('76', '机器端设置价格和库存', '2017-07-01 14:34:45', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('77', '机器端设置价格和库存', '2017-07-01 14:34:50', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('78', '机器端设置价格和库存', '2017-07-01 14:34:53', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('79', '按货道补货', '2017-07-01 14:35:13', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('80', '按货道补货', '2017-07-01 14:35:20', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('81', '机器端设置价格和库存', '2017-07-01 14:35:24', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('82', '机器端设置价格和库存', '2017-07-01 14:35:30', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('83', '机器端设置价格和库存', '2017-07-01 14:35:46', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('84', '按货道补货', '2017-07-01 14:37:37', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('85', '按货道补货', '2017-07-01 14:37:43', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('86', '机器端设置价格和库存', '2017-07-01 14:37:50', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('87', '机器端设置价格和库存', '2017-07-01 14:37:57', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('88', '机器端设置价格和库存', '2017-07-01 14:38:10', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('89', '机器端设置价格和库存', '2017-07-01 14:39:49', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('90', '一键补货', '2017-07-01 14:40:18', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('91', '机器端设置价格和库存', '2017-07-01 14:42:57', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('92', '机器端设置价格和库存', '2017-07-01 14:43:02', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('93', '机器端设置价格和库存', '2017-07-01 14:43:31', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('94', '按货道补货', '2017-07-01 14:46:49', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('95', '按货道补货', '2017-07-01 14:46:56', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('96', '按货道补货', '2017-07-01 14:52:58', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('97', '按货道补货', '2017-07-01 14:53:01', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('98', '机器端设置价格和库存', '2017-07-01 14:53:08', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('99', '机器端设置价格和库存', '2017-07-01 14:53:12', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('100', '机器端设置价格和库存', '2017-07-01 14:53:16', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('101', '机器端设置价格和库存', '2017-07-01 14:53:23', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('102', '机器端设置价格和库存', '2017-07-01 14:53:27', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('103', '按货道补货', '2017-07-01 14:55:36', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('104', '按货道补货', '2017-07-01 14:55:40', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('105', '机器端设置价格和库存', '2017-07-01 14:55:48', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('106', '机器端设置价格和库存', '2017-07-01 14:55:52', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('107', '机器端设置价格和库存', '2017-07-01 14:55:56', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('108', '机器端设置价格和库存', '2017-07-01 14:56:04', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('109', '机器端设置价格和库存', '2017-07-01 14:56:09', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('110', '机器端设置价格和库存', '2017-07-01 15:02:29', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('111', '机器配置删除', '2017-07-01 18:39:13', 'jhl0612@qq.com', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('112', '机器配置添加', '2017-07-01 18:39:13', 'jhl0612@qq.com', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('113', '一键补货', '2017-07-03 10:14:10', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('114', '一键补货', '2017-07-03 10:14:13', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('115', '一键补货', '2017-07-03 12:53:04', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('116', '货道配置添加', '2017-07-07 07:16:57', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('117', '货道配置添加', '2017-07-07 14:28:07', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('118', '货道配置添加', '2017-07-07 15:31:47', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('119', '货道配置添加', '2017-07-07 15:35:56', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('120', '货道配置添加', '2017-07-07 16:27:14', 'jhl0612@qq.com', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('121', '货道配置添加', '2017-07-07 16:27:42', 'jhl0612@qq.com', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('122', '货道配置添加', '2017-07-07 16:28:20', 'jhl0612@qq.com', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('123', '货道配置添加', '2017-07-07 16:28:46', 'jhl0612@qq.com', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('124', '货道配置添加', '2017-07-07 16:30:55', 'jhl0612@qq.com', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('125', '一键补货', '2017-07-07 17:45:02', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('126', '一键补货', '2017-07-07 17:45:04', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('127', '一键补货', '2017-07-08 13:27:11', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('128', '一键补货', '2017-07-08 13:27:13', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('129', '一键补货', '2017-07-10 10:26:30', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('130', '一键补货', '2017-07-10 10:26:33', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('131', '一键补货', '2017-07-10 16:12:54', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('132', '一键补货', '2017-07-15 08:17:51', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('133', '一键补货', '2017-07-17 10:14:15', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('134', '一键补货', '2017-07-17 10:14:18', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('135', '一键补货', '2017-07-18 16:22:07', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('136', '货道启用', '2017-07-19 11:03:48', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('137', '货道启用', '2017-07-19 11:03:50', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('138', '货道停用', '2017-07-19 11:10:21', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('139', '货道启用', '2017-07-19 11:10:22', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('140', '一键补货', '2017-07-19 11:21:06', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('141', '货道配置添加', '2017-07-19 16:26:24', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('142', '货道停用', '2017-07-19 16:31:25', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('143', '货道停用', '2017-07-19 16:31:27', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('144', '货道启用', '2017-07-19 16:31:30', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('145', '货道启用', '2017-07-19 16:31:32', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('146', '货道配置添加', '2017-07-20 10:03:09', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('147', '货道配置添加', '2017-07-20 10:10:53', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('148', '一键补货', '2017-07-20 10:18:02', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('149', '一键补货', '2017-07-20 12:25:34', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('150', '一键补货', '2017-07-20 12:25:39', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('151', '货道启用', '2017-07-24 14:40:40', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('152', '货道启用', '2017-07-24 14:40:41', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('153', '货道启用', '2017-07-24 14:40:42', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('154', '货道启用', '2017-07-24 14:40:43', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('155', '货道启用', '2017-07-24 14:40:43', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('156', '货道启用', '2017-07-24 14:40:44', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('157', '货道启用', '2017-07-24 14:40:49', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('158', '货道启用', '2017-07-24 14:40:50', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('159', '货道启用', '2017-07-24 14:40:51', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('160', '货道启用', '2017-07-24 14:40:52', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('161', '货道启用', '2017-07-24 14:40:53', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('162', '货道启用', '2017-07-24 14:40:54', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('163', '货道配置添加', '2017-07-24 15:38:29', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('164', '按货道补货', '2017-07-24 15:42:33', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('165', '按货道补货', '2017-07-24 15:42:37', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('166', '一键补货', '2017-07-24 15:49:37', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('167', '一键补货', '2017-07-24 16:53:59', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('168', '货道停用', '2017-07-24 17:02:34', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('169', '货道停用', '2017-07-24 17:04:12', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('170', '货道停用', '2017-07-24 17:04:14', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('171', '货道停用', '2017-07-24 17:04:17', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('172', '货道停用', '2017-07-24 17:04:19', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('173', '货道停用', '2017-07-24 17:04:27', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('174', '货道配置添加', '2017-07-24 17:09:31', 'root', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('175', '按货道补货', '2017-07-24 17:10:00', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('176', '按货道补货', '2017-07-24 17:10:04', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('177', '货道配置添加', '2017-07-24 17:54:39', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('178', '货道配置添加', '2017-07-24 22:05:41', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('179', '货道配置添加', '2017-07-24 22:13:30', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('180', '货道停用', '2017-07-24 22:15:15', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('181', '货道停用', '2017-07-24 22:15:20', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('182', '货道停用', '2017-07-24 22:15:21', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('183', '货道停用', '2017-07-24 22:15:25', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('184', '货道停用', '2017-07-24 22:15:27', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('185', '货道停用', '2017-07-24 22:15:33', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('186', '货道配置添加', '2017-07-25 06:25:15', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('187', '按货道补货', '2017-07-25 08:14:37', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('188', '机器端设置价格和库存', '2017-07-25 08:16:14', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('189', '机器端设置价格和库存', '2017-07-25 08:27:47', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('190', '按货道补货', '2017-07-25 08:31:08', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('191', '按货道补货', '2017-07-25 08:31:11', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('192', '一键补货', '2017-07-25 08:32:28', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('193', '一键补货', '2017-07-25 08:32:31', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('194', '货道配置添加', '2017-07-25 08:46:25', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('195', '货道停用', '2017-07-25 08:56:54', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('196', '货道停用', '2017-07-25 08:57:08', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('197', '机器端设置价格和库存', '2017-07-25 09:11:37', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('198', '机器端设置价格和库存', '2017-07-25 09:36:06', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('199', '机器端设置价格和库存', '2017-07-25 09:36:33', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('200', '机器端设置价格和库存', '2017-07-25 09:37:09', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('201', '机器端设置价格和库存', '2017-07-25 09:37:23', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('202', '机器端设置价格和库存', '2017-07-25 09:37:45', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('203', '机器端设置价格和库存', '2017-07-25 09:38:53', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('204', '机器端设置价格和库存', '2017-07-25 09:39:25', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('205', '机器端设置价格和库存', '2017-07-25 09:40:49', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('206', '机器端设置价格和库存', '2017-07-25 09:42:35', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('207', '机器端设置价格和库存', '2017-07-25 09:43:21', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('208', '机器端设置价格和库存', '2017-07-25 09:44:40', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('209', '机器端设置价格和库存', '2017-07-25 09:46:28', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('210', '机器端设置价格和库存', '2017-07-25 09:51:25', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('211', '机器端设置价格和库存', '2017-07-25 09:51:47', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('212', '一键补货', '2017-07-25 09:54:26', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('213', '一键补货', '2017-07-25 09:54:29', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('214', '机器端设置价格和库存', '2017-07-25 10:13:23', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('215', '机器端设置价格和库存', '2017-07-25 10:17:09', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('216', '货道停用', '2017-07-25 10:18:53', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('217', '货道停用', '2017-07-25 10:18:54', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('218', '货道停用', '2017-07-25 10:18:56', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('219', '货道停用', '2017-07-25 10:18:57', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('220', '货道停用', '2017-07-25 10:18:59', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('221', '货道停用', '2017-07-25 10:19:10', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('222', '货道停用', '2017-07-25 10:19:15', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('223', '货道停用', '2017-07-25 10:19:16', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('224', '货道停用', '2017-07-25 10:19:18', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('225', '货道停用', '2017-07-25 10:19:20', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('226', '货道停用', '2017-07-25 10:19:21', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('227', '货道停用', '2017-07-25 10:19:23', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('228', '货道配置添加', '2017-07-25 10:21:25', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('229', '机器端设置价格和库存', '2017-07-25 10:21:58', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('230', '货道配置添加', '2017-07-25 10:22:03', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('231', '机器端设置价格和库存', '2017-07-25 10:27:05', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('232', '机器端设置价格和库存', '2017-07-25 10:29:09', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('233', '机器端设置价格和库存', '2017-07-25 10:36:05', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('234', '机器端设置价格和库存', '2017-07-25 10:37:13', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('235', '机器端设置价格和库存', '2017-07-25 10:39:46', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('236', '机器端设置价格和库存', '2017-07-25 10:42:02', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('237', '机器端设置价格和库存', '2017-07-25 10:45:38', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('238', '机器端设置价格和库存', '2017-07-25 13:21:07', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('239', '一键补货', '2017-07-25 14:13:19', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('240', '按货道补货', '2017-07-27 20:44:35', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('241', '按货道补货', '2017-07-27 20:44:38', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('242', '按货道补货', '2017-07-27 22:59:09', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('243', '按货道补货', '2017-07-29 19:49:15', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('244', '按货道补货', '2017-07-29 20:18:08', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('245', '更新客户', '2017-08-04 08:23:38', 'root', '8c2855f9-44d2-4404-b241-b2a30b9740c2', null);
INSERT INTO `table_operation` VALUES ('246', '一键补货', '2017-08-07 16:04:11', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('247', '一键补货', '2017-08-07 16:08:30', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('248', '按货道补货', '2017-08-07 16:16:25', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('249', '按货道补货', '2017-08-07 16:22:32', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('250', '货道配置添加', '2017-08-07 17:18:36', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('251', '货道配置添加', '2017-08-08 14:31:06', 'jhl0612@qq.com', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('252', '更新客户', '2017-08-08 15:13:58', 'root', '30114348-cf8d-4130-acf9-a55343b80f53', null);
INSERT INTO `table_operation` VALUES ('253', '添加机器', '2017-08-08 15:59:51', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('254', '更新机器', '2017-08-08 16:06:43', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('255', '更新机器', '2017-08-08 16:07:05', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('256', '机器配置删除', '2017-08-08 22:31:28', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('257', '删除机器', '2017-08-08 22:31:28', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('258', '一键补货', '2017-08-09 09:11:51', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('259', '一键补货', '2017-08-09 09:12:47', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('260', '添加机器', '2017-08-09 11:49:48', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('261', '一键补货', '2017-08-10 11:51:49', '机器端', null, 'FKHZ00000002');
INSERT INTO `table_operation` VALUES ('262', '按货道补货', '2017-08-11 15:45:24', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('263', '按货道补货', '2017-08-11 15:47:24', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('264', '按货道补货', '2017-08-11 15:47:44', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('265', '按货道补货', '2017-08-13 17:17:18', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('266', '按货道补货', '2017-08-13 17:19:29', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('267', '按货道补货', '2017-08-13 17:19:31', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('268', '按货道补货', '2017-08-13 17:19:47', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('269', '按货道补货', '2017-08-13 17:51:33', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('270', '按货道补货', '2017-08-13 17:51:36', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('271', '按货道补货', '2017-08-13 17:51:50', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('272', '货道配置添加', '2017-08-13 18:46:27', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('273', '一键补货', '2017-08-19 10:16:55', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('274', '一键补货', '2017-08-19 10:16:58', '机器端', null, 'CJLB17070001');
INSERT INTO `table_operation` VALUES ('275', '新增或修改会员信息', '2017-08-19 16:31:46', 'jhl0612@qq.com', '1a44553d-f1de-4516-8095-d1ba8c4331f8', null);
INSERT INTO `table_operation` VALUES ('276', '新增或修改用户信息', '2017-08-19 16:33:20', 'jhl0612@qq.com', '4c4d9f52-e46b-4014-b469-20f7e4a44d60', null);
INSERT INTO `table_operation` VALUES ('277', '更新机器', '2017-08-20 08:39:57', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('278', '添加机器', '2017-08-20 08:44:33', 'root', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('279', '添加机器', '2017-08-20 08:45:19', 'root', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('280', '添加机器', '2017-08-20 08:45:59', 'root', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('281', '添加机器', '2017-08-20 08:46:25', 'root', null, 'JHLA17080004');
INSERT INTO `table_operation` VALUES ('282', '添加机器', '2017-08-20 08:46:44', 'root', null, 'JHLA17080004');
INSERT INTO `table_operation` VALUES ('283', '机器配置删除', '2017-08-20 08:47:32', 'root', null, 'JHLA17080004');
INSERT INTO `table_operation` VALUES ('284', '删除机器', '2017-08-20 08:47:32', 'root', null, 'JHLA17080004');
INSERT INTO `table_operation` VALUES ('285', '添加机器', '2017-08-20 08:48:55', 'root', null, 'JHLA17080004');
INSERT INTO `table_operation` VALUES ('286', '添加机器', '2017-08-20 08:49:13', 'root', null, 'JHLA17080005');
INSERT INTO `table_operation` VALUES ('287', '添加机器', '2017-08-20 08:49:34', 'root', null, 'JHLA17080006');
INSERT INTO `table_operation` VALUES ('288', '添加机器', '2017-08-20 08:49:59', 'root', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('289', '添加机器', '2017-08-20 08:50:20', 'root', null, 'JHLA17080008');
INSERT INTO `table_operation` VALUES ('290', '添加机器', '2017-08-20 08:50:49', 'root', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('291', '添加机器', '2017-08-20 08:51:32', 'root', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('292', '更新机器', '2017-08-20 08:52:03', 'root', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('293', '更新机器', '2017-08-20 08:52:32', 'root', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('294', '更新机器', '2017-08-20 08:52:44', 'root', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('295', '更新机器', '2017-08-20 08:52:56', 'root', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('296', '更新机器', '2017-08-20 08:53:10', 'root', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('297', '更新机器', '2017-08-20 08:53:31', 'root', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('298', '更新机器', '2017-08-20 08:53:48', 'root', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('299', '添加机器', '2017-08-20 08:56:09', 'root', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('300', '添加机器', '2017-08-20 08:56:39', 'root', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('301', '添加机器', '2017-08-20 08:57:02', 'root', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('302', '添加机器', '2017-08-20 08:57:47', 'root', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('303', '添加机器', '2017-08-20 08:58:13', 'root', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('304', '添加机器', '2017-08-20 08:58:31', 'root', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('305', '更新机器', '2017-08-20 09:00:26', 'jhl0612@qq.com', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('306', '机器配置删除', '2017-08-20 09:57:23', 'jhl0612@qq.com', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('307', '机器配置添加', '2017-08-20 09:57:23', 'jhl0612@qq.com', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('308', '机器配置删除', '2017-08-20 09:57:36', 'jhl0612@qq.com', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('309', '机器配置添加', '2017-08-20 09:57:36', 'jhl0612@qq.com', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('310', '机器配置删除', '2017-08-20 09:57:44', 'jhl0612@qq.com', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('311', '机器配置添加', '2017-08-20 09:57:44', 'jhl0612@qq.com', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('312', '机器配置删除', '2017-08-20 09:57:54', 'jhl0612@qq.com', null, 'JHLA17080004');
INSERT INTO `table_operation` VALUES ('313', '机器配置添加', '2017-08-20 09:57:54', 'jhl0612@qq.com', null, 'JHLA17080004');
INSERT INTO `table_operation` VALUES ('314', '机器配置删除', '2017-08-20 09:58:05', 'jhl0612@qq.com', null, 'JHLA17080005');
INSERT INTO `table_operation` VALUES ('315', '机器配置添加', '2017-08-20 09:58:05', 'jhl0612@qq.com', null, 'JHLA17080005');
INSERT INTO `table_operation` VALUES ('316', '机器配置删除', '2017-08-20 09:58:13', 'jhl0612@qq.com', null, 'JHLA17080006');
INSERT INTO `table_operation` VALUES ('317', '机器配置添加', '2017-08-20 09:58:13', 'jhl0612@qq.com', null, 'JHLA17080006');
INSERT INTO `table_operation` VALUES ('318', '机器配置删除', '2017-08-20 09:58:21', 'jhl0612@qq.com', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('319', '机器配置添加', '2017-08-20 09:58:21', 'jhl0612@qq.com', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('320', '机器配置删除', '2017-08-20 09:58:29', 'jhl0612@qq.com', null, 'JHLA17080008');
INSERT INTO `table_operation` VALUES ('321', '机器配置添加', '2017-08-20 09:58:29', 'jhl0612@qq.com', null, 'JHLA17080008');
INSERT INTO `table_operation` VALUES ('322', '机器配置删除', '2017-08-20 09:58:44', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('323', '机器配置添加', '2017-08-20 09:58:44', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('324', '机器配置删除', '2017-08-20 09:58:52', 'jhl0612@qq.com', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('325', '机器配置添加', '2017-08-20 09:58:52', 'jhl0612@qq.com', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('326', '机器配置删除', '2017-08-20 09:58:59', 'jhl0612@qq.com', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('327', '机器配置添加', '2017-08-20 09:58:59', 'jhl0612@qq.com', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('328', '机器配置删除', '2017-08-20 09:59:06', 'jhl0612@qq.com', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('329', '机器配置添加', '2017-08-20 09:59:06', 'jhl0612@qq.com', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('330', '机器配置删除', '2017-08-20 09:59:16', 'jhl0612@qq.com', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('331', '机器配置添加', '2017-08-20 09:59:16', 'jhl0612@qq.com', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('332', '机器配置删除', '2017-08-20 09:59:26', 'jhl0612@qq.com', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('333', '机器配置添加', '2017-08-20 09:59:26', 'jhl0612@qq.com', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('334', '机器配置删除', '2017-08-20 09:59:36', 'jhl0612@qq.com', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('335', '机器配置添加', '2017-08-20 09:59:36', 'jhl0612@qq.com', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('336', '机器配置删除', '2017-08-20 09:59:46', 'jhl0612@qq.com', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('337', '机器配置添加', '2017-08-20 09:59:46', 'jhl0612@qq.com', null, 'JHLB17080008');

-- ----------------------------
-- Table structure for `table_pay_config`
-- ----------------------------
DROP TABLE IF EXISTS `table_pay_config`;
CREATE TABLE `table_pay_config` (
  `id` varchar(50) NOT NULL,
  `client_id` char(10) DEFAULT NULL,
  `pay_type` varchar(20) DEFAULT NULL,
  `pay_account` varchar(100) DEFAULT NULL,
  `pay_merchant` varchar(100) DEFAULT NULL,
  `pay_publickey` varchar(200) DEFAULT NULL,
  `pay_privatekey` varchar(200) DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_pay_config
-- ----------------------------

-- ----------------------------
-- Table structure for `table_pic`
-- ----------------------------
DROP TABLE IF EXISTS `table_pic`;
CREATE TABLE `table_pic` (
  `pic_id` varchar(50) NOT NULL,
  `pic_name` varchar(50) DEFAULT NULL,
  `pic_path` varchar(200) DEFAULT NULL,
  `client_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_pic
-- ----------------------------
INSERT INTO `table_pic` VALUES ('7a38f2eb-4975-43dd-a90c-4f22326f1463', 'bussiness-1_2017010911080209079.png', 'Attachment/bussiness-3_2017010911143147506.png', 'self');
INSERT INTO `table_pic` VALUES ('377cc203-6384-4b0b-9a78-ec206ea80525', 'bussiness-2_2017010911134091817.png', 'Attachment/bussiness-3_2017010911143147506.png', 'self');
INSERT INTO `table_pic` VALUES ('3e59d73d-d5ae-4acb-9765-95c4c077c8d7', 'bussiness-3_2017010911143147506.png', 'Attachment/bussiness-3_2017010911143147506.png', 'self');
INSERT INTO `table_pic` VALUES ('b2d2cb3a-0f97-431b-82e5-75ea96837f69', '8-02_2017010911184910179.png', 'Attachment/bussiness-3_2017010911143147506.png', 'self');
INSERT INTO `table_pic` VALUES ('0482dcee-f815-428b-8277-23463b7bd3b4', '0000220160531144016_2017051323553881686.png', 'Attachment/0000220160531144016_2017051323553881686.png', '8c2855f9-44d2-4404-b241-b2a30b9740c2');
INSERT INTO `table_pic` VALUES ('6974e7f4-5fbb-4a0e-8231-971f5e019ab5', '0000220160531144138_2017051400293160951.png', 'Attachment/0000220160531144138_2017051400293160951.png', '8c2855f9-44d2-4404-b241-b2a30b9740c2');
INSERT INTO `table_pic` VALUES ('30faabe1-d85c-469f-b82c-ea5540a10661', '0000220160531143458_2017051400304432779.png', 'Attachment/0000220160531143458_2017051400304432779.png', '8c2855f9-44d2-4404-b241-b2a30b9740c2');
INSERT INTO `table_pic` VALUES ('0a1cd7cd-db4e-458f-85e5-452b8d15486f', '0000220160531143707_2017051400414930791.png', 'Attachment/0000220160531143707_2017051400414930791.png', '8c2855f9-44d2-4404-b241-b2a30b9740c2');
INSERT INTO `table_pic` VALUES ('19ada2b0-c3a0-4148-9d49-8734ca08307b', '0000220160531144214_2017051413492454118.png', 'Attachment/0000220160531144214_2017051413492454118.png', '8c2855f9-44d2-4404-b241-b2a30b9740c2');
INSERT INTO `table_pic` VALUES ('fdf9765e-ae95-481e-92e6-2b3c947c4d7f', '0000220160531143315_2017061321215785772.png', 'Attachment/0000220160531143315_2017061321215785772.png', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('1bf097a0-4465-404f-835b-b4c95c349adc', '0000220160531143458_2017061321235302886.png', 'Attachment/0000220160531143458_2017061321235302886.png', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('190cded7-c207-4d3d-a9e9-6206ef5dd73b', '0000220160531143606_2017061321255515307.png', 'Attachment/0000220160531143606_2017061321255515307.png', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('76962a94-b7de-4705-9e0e-7f6ada4fecec', '0000220160531144138_2017061321271276195.png', 'Attachment/0000220160531144138_2017061321271276195.png', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('15bf5ea5-6f97-4964-a3df-b5cae2c617ec', '0000220160531144157_2017061321294304224.png', 'Attachment/0000220160531144157_2017061321294304224.png', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('e460c31a-f1ea-4f2f-8bda-5bb1cb75929e', '0000220160531143520_2017061321411939716.png', 'Attachment/0000220160531143520_2017061321411939716.png', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('7a472675-1a39-44ba-8234-6b52adebfa8b', '0000220160531144214_2017061409373030930.png', 'Attachment/0000220160531144214_2017061409373030930.png', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('83cac065-e6eb-4c89-9892-6ad159224141', '0000220160531144016_2017061409393324680.png', 'Attachment/0000220160531144016_2017061409393324680.png', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('63d4ab7b-f035-41b6-8021-7b4ea4c406cd', '0000220160531143742_2017061410191719992.png', 'Attachment/0000220160531143742_2017061410191719992.png', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('c784646e-a5e1-490c-8d1d-443d2018913c', '0000220160531143934_2017061410201146555.png', 'Attachment/0000220160531143934_2017061410201146555.png', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('42248993-fe7b-4fdf-8d8c-096e13ffacab', '老坛酸菜牛肉面_2017070714233728965.jpg', 'Attachment/老坛酸菜牛肉面_2017070714233728965.jpg', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('9565622c-195a-4783-b2aa-98610bbfeadd', '汤达人面_2017070714252236777.jpg', 'Attachment/汤达人面_2017070714252236777.jpg', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('3501be5f-f06d-49ba-97ca-940441770ecc', '百事可乐330mL_2017070715270683652.jpg', 'Attachment/百事可乐330mL_2017070715270683652.jpg', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('ab78288c-2e50-4d05-a48a-0013ad278ba5', '椰树牌_2017070715304146152.jpg', 'Attachment/椰树牌_2017070715304146152.jpg', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('3481b09f-1093-46e7-9c26-329cbf24f975', '清风纸_2017070715343200840.jpg', 'Attachment/清风纸_2017070715343200840.jpg', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('791eca72-95d2-4549-85a0-75b9adae97d8', '可比克_2017072422015063340.jpg', 'Attachment/可比克_2017072422015063340.jpg', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('5993ab8d-bf75-4af9-9a39-4219b7118b35', '小小酥_2017072422024855527.png', 'Attachment/小小酥_2017072422024855527.png', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('74446b5f-04e5-461d-b08b-02ebad1993f8', '六个核桃_2017072422085785215.jpg', 'Attachment/六个核桃_2017072422085785215.jpg', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('e205c467-0d5f-4c4d-ac2a-119bdff22807', '雪花_2017072422110899277.jpg', 'Attachment/雪花_2017072422110899277.jpg', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('a5f05306-8c1e-4408-aed2-b7d7ea9b5a14', '挑豆_2017072506242750840.jpg', 'Attachment/挑豆_2017072506242750840.jpg', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('819b0762-d060-4cce-8a23-57ca7eddf117', '小酥饼_2017080717160797715.jpg', 'Attachment/小酥饼_2017080717160797715.jpg', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('37e08b31-4ba5-4bcd-a9ab-3e6b01a75813', '奥利奥_2017080717170561777.jpg', 'Attachment/奥利奥_2017080717170561777.jpg', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('d70520d9-d14c-4ef3-bd3b-3eead0da49a3', '冰露_2017081318412543027.jpg', 'Attachment/冰露_2017081318412543027.jpg', '30114348-cf8d-4130-acf9-a55343b80f53');
INSERT INTO `table_pic` VALUES ('f81988d0-7c57-467d-8499-0106e5e074a1', '冰露_2017081318531374277.jpg', 'Attachment/冰露_2017081318531374277.jpg', '30114348-cf8d-4130-acf9-a55343b80f53');

-- ----------------------------
-- Table structure for `table_product`
-- ----------------------------
DROP TABLE IF EXISTS `table_product`;
CREATE TABLE `table_product` (
  `wares_id` varchar(50) DEFAULT NULL,
  `wares_name` varchar(50) DEFAULT NULL,
  `wares_unitprice` decimal(8,2) DEFAULT NULL,
  `wares_weight` decimal(10,2) DEFAULT NULL,
  `wares_specifications` varchar(50) DEFAULT NULL,
  `wares_manufacture_date` datetime DEFAULT NULL,
  `wares_quality_period` datetime DEFAULT NULL,
  `pic_id` varchar(50) DEFAULT NULL,
  `wares_type_id` varchar(50) DEFAULT NULL,
  `supplier_id` varchar(50) DEFAULT NULL,
  `wares_description` varchar(500) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `client_id` varchar(50) DEFAULT NULL,
  `creator` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_product
-- ----------------------------
INSERT INTO `table_product` VALUES ('046aa7f6-00f8-4e5f-8c4e-88488fd78948', '乐事薯片', '12.59', '380.00', '380g/袋', '2016-12-30 16:00:00', '2017-12-31 16:00:00', '7a38f2eb-4975-43dd-a90c-4f22326f1463', '', '', null, '2017-01-09 14:45:53', 'self', 'root');
INSERT INTO `table_product` VALUES ('f0fe516e-3d10-4ea6-ac19-81adf241bcaf', '矿泉水', '2.50', '500.00', '', null, null, '7a38f2eb-4975-43dd-a90c-4f22326f1463', '', '', '', '2017-01-11 13:07:44', 'self', 'root');
INSERT INTO `table_product` VALUES ('e87eee2a-7756-499c-81ca-806a928c8e83', '小李的商品', '8.99', '350.00', '', null, null, '7a38f2eb-4975-43dd-a90c-4f22326f1463', '', '', '', '2017-01-11 13:29:26', '783755de-1a45-4175-84c4-6c7258289002', 'xiaoli');
INSERT INTO `table_product` VALUES ('e891427d-61a3-4db7-8a7a-36b1ad30620d', '测试商品', '9.99', '450.00', '', null, null, '3e59d73d-d5ae-4acb-9765-95c4c077c8d7', '', '', '', '2017-01-11 13:34:17', 'cb870f39-92ce-448e-982d-06a563efa64f', 'admin');
INSERT INTO `table_product` VALUES ('670c37a0-ba47-4e30-9784-281a25890d75', '娃哈哈纯净水', '0.01', '500.00', '瓶', '2017-05-13 15:57:47', '2018-05-13 15:57:49', '0482dcee-f815-428b-8277-23463b7bd3b4', '', '', '', '2017-05-13 23:57:54', '8c2855f9-44d2-4404-b241-b2a30b9740c2', 'ysq123456@qq.com');
INSERT INTO `table_product` VALUES ('a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '王老吉', '0.01', '350.00', '罐', '2017-05-12 16:00:00', '2018-05-12 16:00:00', '6974e7f4-5fbb-4a0e-8231-971f5e019ab5', '', '', '', '2017-05-14 01:11:06', '8c2855f9-44d2-4404-b241-b2a30b9740c2', 'ysq123456@qq.com');
INSERT INTO `table_product` VALUES ('48c64286-a53c-40f6-8871-b9ad71179d88', '芬达', '0.01', '350.00', '', '2017-05-13 16:33:52', '2018-05-13 16:33:54', '30faabe1-d85c-469f-b82c-ea5540a10661', '', '', '', '2017-05-14 00:33:50', '8c2855f9-44d2-4404-b241-b2a30b9740c2', 'ysq123456@qq.com');
INSERT INTO `table_product` VALUES ('bbca469f-1743-4179-8f79-1d7853e21ddf', '统一鲜橙多', '0.01', '500.00', '', '2017-05-13 16:42:18', null, '0a1cd7cd-db4e-458f-85e5-452b8d15486f', '', '', '', '2017-05-14 00:42:14', '8c2855f9-44d2-4404-b241-b2a30b9740c2', 'ysq123456@qq.com');
INSERT INTO `table_product` VALUES ('115af8bf-ac62-4a7e-9738-2db8629d94d8', '银鹭', '0.01', '350.00', '', null, null, '19ada2b0-c3a0-4148-9d49-8734ca08307b', '', '', '', '2017-05-14 13:49:54', '8c2855f9-44d2-4404-b241-b2a30b9740c2', 'ysq123456@qq.com');
INSERT INTO `table_product` VALUES ('53053f36-6ec7-40dc-b59a-f7a024cb4a60', '百事可乐500ML', '0.01', '500.00', '', null, null, 'fdf9765e-ae95-481e-92e6-2b3c947c4d7f', '', '', '', '2017-06-13 21:22:57', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '芬达330ML', '0.01', '330.00', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00', '1bf097a0-4465-404f-835b-b4c95c349adc', '', '', '', '2017-06-13 21:26:12', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('f602b953-3d4e-4d5a-95ac-f740375e014f', '农夫山泉550ML', '0.01', '550.00', '', null, null, '190cded7-c207-4d3d-a9e9-6206ef5dd73b', '', '', '', '2017-06-13 21:25:58', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('761fc0b8-4939-4a29-8c17-b3140cfb7f65', '王老吉310ML', '0.01', '310.00', '', null, null, '76962a94-b7de-4705-9e0e-7f6ada4fecec', '', '', '', '2017-06-13 21:27:14', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('e5539b94-550b-415e-8bbc-c037d96a01d1', '雪碧310ML', '0.01', '310.00', '', null, null, '15bf5ea5-6f97-4964-a3df-b5cae2c617ec', '', '', '', '2017-06-13 21:29:46', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('59c1b372-3cfb-4dea-adb6-8c6385218118', '冰红茶', '0.01', '550.00', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00', 'e460c31a-f1ea-4f2f-8bda-5bb1cb75929e', '', '', '', '2017-08-07 17:13:12', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('ab1c3466-2b80-4200-bef3-b22eddf94273', '银鹭八宝粥', '0.01', '360.00', '', null, null, '7a472675-1a39-44ba-8234-6b52adebfa8b', '', '', '', '2017-06-14 09:37:33', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '娃哈哈纯净水500ML', '0.01', '500.00', '', null, null, '83cac065-e6eb-4c89-9892-6ad159224141', '', '', '', '2017-06-14 09:39:34', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('35b0f112-bd95-472c-9bb7-d84806427a11', '统一绿茶500ML', '0.01', '500.00', '', null, null, '63d4ab7b-f035-41b6-8021-7b4ea4c406cd', '', '', '', '2017-06-14 10:19:18', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('d469baab-4460-4e2e-94c8-0eadbdcb34d9', '统一水晶葡萄500ML', '0.01', '500.00', '', null, null, 'c784646e-a5e1-490c-8d1d-443d2018913c', '', '', '', '2017-06-14 10:20:12', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('bf869b68-57de-4016-b150-a93b6fa7e0cd', '老坛酸菜方便面', '5.00', '120.00', '', null, null, '42248993-fe7b-4fdf-8d8c-096e13ffacab', '', '', '6个月', '2017-07-07 14:24:28', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('7d4e09d9-dd3d-423f-9b1b-1b3933fc9466', '汤达人碗面', '5.00', '135.00', '', null, null, '9565622c-195a-4783-b2aa-98610bbfeadd', '', '', '6个月', '2017-07-07 14:26:13', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('ee7a4613-1686-4f2c-87ba-8f5059ec420e', '百事可乐330mL', '5.00', '330.00', '', null, null, '3501be5f-f06d-49ba-97ca-940441770ecc', '', '', '12个月', '2017-07-07 15:27:27', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('128f6cd3-41fc-4448-8837-654d97811169', '椰树牌', '5.00', '245.00', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00', 'ab78288c-2e50-4d05-a48a-0013ad278ba5', '', '', '', '2017-07-07 15:36:49', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('e613ff5f-32f7-43aa-a793-4c7d688aac99', '清风纸', '1.50', '10.00', '', null, null, '3481b09f-1093-46e7-9c26-329cbf24f975', '', '', '', '2017-07-07 15:34:35', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('acd187d1-35c2-4e64-bf8a-8dad36508fd6', '可比克', '0.01', '60.00', '', null, null, '791eca72-95d2-4549-85a0-75b9adae97d8', '', '', '', '2017-07-24 22:01:59', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('be0a824c-18c1-45a1-acfa-d457f27a0493', '旺旺小小酥', '0.01', '30.00', '', null, null, '5993ab8d-bf75-4af9-9a39-4219b7118b35', '', '', '', '2017-07-24 22:02:50', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('00a37f7b-cbe7-4421-8113-caa72723c313', '六个核桃', '0.01', '240.00', '', null, null, '74446b5f-04e5-461d-b08b-02ebad1993f8', '', '', '', '2017-07-24 22:09:01', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('966457b3-0ce7-4cff-b371-d87cf0544579', '雪花啤酒330', '0.01', '330.00', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00', 'e205c467-0d5f-4c4d-ac2a-119bdff22807', '', '', '', '2017-07-24 22:13:54', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('6061d2d1-7120-47db-a02d-98f09c6057fc', '挑豆', '0.01', '45.00', '', null, null, 'a5f05306-8c1e-4408-aed2-b7d7ea9b5a14', '', '', '', '2017-07-25 06:24:30', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('7f8c01a5-85db-4f45-9b00-c139ef2da756', '小酥饼', '3.00', '60.00', '', null, null, '819b0762-d060-4cce-8a23-57ca7eddf117', '', '', '', '2017-08-07 17:16:29', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('f2408a65-3355-49dc-b0ad-0f98861943fa', '奥利奥', '5.00', '58.00', '', null, null, '37e08b31-4ba5-4bcd-a9ab-3e6b01a75813', '', '', '', '2017-08-07 17:17:07', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('829467a1-90d9-4d16-bb2c-4fee2a401164', '冰露', '1.70', '550.00', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00', 'f81988d0-7c57-467d-8499-0106e5e074a1', '', '', '', '2017-08-13 18:53:17', '30114348-cf8d-4130-acf9-a55343b80f53', 'jhl0612@qq.com');

-- ----------------------------
-- Table structure for `table_product_config`
-- ----------------------------
DROP TABLE IF EXISTS `table_product_config`;
CREATE TABLE `table_product_config` (
  `wares_config_id` varchar(50) DEFAULT NULL,
  `wares_id` varchar(50) DEFAULT NULL,
  `wares_config_name` varchar(50) DEFAULT NULL,
  `low_missing` int(10) DEFAULT NULL,
  `low_missing_alarm` tinyint(1) DEFAULT NULL,
  `purchase_price` decimal(10,2) DEFAULT NULL,
  `price_unit` varchar(20) DEFAULT NULL,
  `wares_status` tinyint(2) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `wares_config_remark` varchar(250) DEFAULT NULL,
  `client_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_product_config
-- ----------------------------

-- ----------------------------
-- Table structure for `table_product_stock`
-- ----------------------------
DROP TABLE IF EXISTS `table_product_stock`;
CREATE TABLE `table_product_stock` (
  `wares_stock_id` varchar(50) DEFAULT NULL,
  `wares_id` varchar(50) DEFAULT NULL,
  `wares_stock_name` varchar(50) DEFAULT NULL,
  `wares_stock_number` int(10) DEFAULT NULL,
  `wares_stock_unit` varchar(50) DEFAULT NULL,
  `wares_stock_status` tinyint(2) DEFAULT NULL,
  `client_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_product_stock
-- ----------------------------

-- ----------------------------
-- Table structure for `table_product_storage`
-- ----------------------------
DROP TABLE IF EXISTS `table_product_storage`;
CREATE TABLE `table_product_storage` (
  `wares_stg_id` varchar(50) DEFAULT NULL,
  `wares_id` varchar(50) DEFAULT NULL,
  `wares_stg_number` int(10) DEFAULT NULL,
  `wares_stg_date` datetime DEFAULT NULL,
  `wares_stg_opt` varchar(50) DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL,
  `client_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_product_storage
-- ----------------------------

-- ----------------------------
-- Table structure for `table_product_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `table_product_supplier`;
CREATE TABLE `table_product_supplier` (
  `supplier_id` varchar(50) DEFAULT NULL,
  `supplier_name` varchar(50) DEFAULT NULL,
  `supplier_address` varchar(100) DEFAULT NULL,
  `supplier_contect` varchar(50) DEFAULT NULL,
  `supplier_tel` varchar(50) DEFAULT NULL,
  `supplier_fax` varchar(50) DEFAULT NULL,
  `supplier_account` varchar(50) DEFAULT NULL,
  `supplier_settlement` tinyint(2) DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL,
  `client_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_product_supplier
-- ----------------------------

-- ----------------------------
-- Table structure for `table_product_type`
-- ----------------------------
DROP TABLE IF EXISTS `table_product_type`;
CREATE TABLE `table_product_type` (
  `wares_type_id` varchar(50) DEFAULT NULL,
  `wares_type_name` varchar(50) DEFAULT NULL,
  `wares_type_remark` varchar(250) DEFAULT NULL,
  `client_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_product_type
-- ----------------------------

-- ----------------------------
-- Table structure for `table_refund`
-- ----------------------------
DROP TABLE IF EXISTS `table_refund`;
CREATE TABLE `table_refund` (
  `out_trade_no` varchar(50) DEFAULT NULL,
  `trade_no` varchar(50) DEFAULT NULL,
  `refund_no` varchar(50) DEFAULT NULL,
  `refund_detail` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_refund
-- ----------------------------
-- ----------------------------
-- Table structure for `table_sales_cash`
-- ----------------------------
DROP TABLE IF EXISTS `table_sales_cash`;
CREATE TABLE `table_sales_cash` (
  `sales_no` varchar(50) DEFAULT NULL,
  `machine_id` varchar(50) DEFAULT NULL,
  `sales_date` datetime DEFAULT NULL,
  `sales_type` tinyint(2) DEFAULT NULL,
  `goods_id` varchar(50) DEFAULT NULL,
  `com_id` varchar(50) DEFAULT NULL,
  `sales_number` int(10) DEFAULT NULL,
  `sales_prices` decimal(10,2) DEFAULT NULL,
  `pay_way` tinyint(2) DEFAULT NULL,
  `trade_no` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_sales_cash
-- ----------------------------

-- ----------------------------
-- Table structure for `table_sales_cashless`
-- ----------------------------
DROP TABLE IF EXISTS `table_sales_cashless`;
CREATE TABLE `table_sales_cashless` (
  `sales_ic_id` varchar(50) NOT NULL,
  `machine_id` varchar(50) DEFAULT NULL,
  `sales_date` datetime DEFAULT NULL,
  `sales_number` int(2) DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `pay_type` varchar(10) DEFAULT NULL,
  `pay_interface` varchar(50) DEFAULT NULL,
  `acquiring_merchant` varchar(20) DEFAULT NULL,
  `trade_no` varchar(50) DEFAULT NULL,
  `payer` varchar(50) DEFAULT NULL,
  `goods_id` varchar(50) DEFAULT NULL,
  `com_id` varchar(50) DEFAULT NULL COMMENT '退款号',
  `trade_amount` decimal(10,2) DEFAULT NULL,
  `trade_status` varchar(2) DEFAULT NULL,
  `random_id` varchar(50) DEFAULT NULL,
  `reality_sale_number` int(2) DEFAULT NULL,
  `service_charge` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_sales_cashless
-- ----------------------------
-- ----------------------------
-- Table structure for `table_sales_ic`
-- ----------------------------
DROP TABLE IF EXISTS `table_sales_ic`;
CREATE TABLE `table_sales_ic` (
  `sales_ic_id` varchar(50) DEFAULT NULL,
  `machine_id` varchar(50) DEFAULT NULL,
  `sales_date` datetime DEFAULT NULL,
  `sales_number` int(10) DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `pay_type` tinyint(2) DEFAULT NULL,
  `pay_interface` varchar(50) DEFAULT NULL,
  `acquiring_merchant` varchar(20) DEFAULT NULL,
  `trade_no` varchar(50) DEFAULT NULL,
  `payer` varchar(50) DEFAULT NULL,
  `goods_id` varchar(50) DEFAULT NULL,
  `com_id` varchar(50) DEFAULT NULL,
  `trade_amount` decimal(10,2) DEFAULT NULL,
  `trade_status` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_sales_ic
-- ----------------------------

-- ----------------------------
-- Table structure for `table_total_money`
-- ----------------------------
DROP TABLE IF EXISTS `table_total_money`;
CREATE TABLE `table_total_money` (
  `client_id` varchar(50) DEFAULT NULL,
  `ali_account` float(10,2) DEFAULT NULL,
  `wx_account` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_total_money
-- ----------------------------
INSERT INTO `table_total_money` VALUES ('30114348-cf8d-4130-acf9-a55343b80f53', '183.61', '547.29');
INSERT INTO `table_total_money` VALUES ('cb870f39-92ce-448e-982d-06a563efa64f', null, '5.47');

-- ----------------------------
-- Table structure for `table_to_machine`
-- ----------------------------
DROP TABLE IF EXISTS `table_to_machine`;
CREATE TABLE `table_to_machine` (
  `machine_id` varchar(50) DEFAULT NULL,
  `machine_status` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_to_machine
-- ----------------------------
INSERT INTO `table_to_machine` VALUES ('ABC000000001', 'st');
INSERT INTO `table_to_machine` VALUES ('CJLB17070001', 'p');
INSERT INTO `table_to_machine` VALUES ('FKHZ00000002', 'st');
INSERT INTO `table_to_machine` VALUES ('JL5710000001', 'st');
INSERT INTO `table_to_machine` VALUES ('JL5710000001', 'p');
INSERT INTO `table_to_machine` VALUES ('CJLB17070001', 'st');
INSERT INTO `table_to_machine` VALUES ('JHLA17080001', 't');
INSERT INTO `table_to_machine` VALUES ('JHLA17080002', 't');
INSERT INTO `table_to_machine` VALUES ('JHLA17080003', 't');
INSERT INTO `table_to_machine` VALUES ('JHLA17080004', 't');
INSERT INTO `table_to_machine` VALUES ('JHLA17080005', 't');
INSERT INTO `table_to_machine` VALUES ('JHLA17080006', 't');
INSERT INTO `table_to_machine` VALUES ('JHLA17080007', 't');
INSERT INTO `table_to_machine` VALUES ('JHLA17080008', 't');
INSERT INTO `table_to_machine` VALUES ('JHLB17080001', 't');
INSERT INTO `table_to_machine` VALUES ('JHLB17080002', 't');
INSERT INTO `table_to_machine` VALUES ('JHLB17080003', 't');
INSERT INTO `table_to_machine` VALUES ('JHLB17080004', 't');
INSERT INTO `table_to_machine` VALUES ('JHLB17080005', 't');
INSERT INTO `table_to_machine` VALUES ('JHLB17080006', 't');
INSERT INTO `table_to_machine` VALUES ('JHLB17080007', 't');
INSERT INTO `table_to_machine` VALUES ('JHLB17080008', 't');

-- ----------------------------
-- Table structure for `table_user`
-- ----------------------------
DROP TABLE IF EXISTS `table_user`;
CREATE TABLE `table_user` (
  `id` varchar(50) DEFAULT NULL,
  `usr_account` varchar(50) DEFAULT NULL,
  `usr_access_id` varchar(50) DEFAULT NULL,
  `usr_name` varchar(50) DEFAULT NULL,
  `usr_pwd` char(32) DEFAULT NULL,
  `usr_client_id` varchar(50) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL,
  `sts` tinyint(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_user
-- ----------------------------
INSERT INTO `table_user` VALUES ('d71981a4-6a1d-414d-8238-16cbc05f5fd7', 'root', '', '系统管理员', 'ee210c0c7cb8a7aa', 'self', null, null, null, null, '100');
INSERT INTO `table_user` VALUES ('477e407a-f2b9-4598-b5cf-3e1e0067c0ec', 'ttt2', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', 'ttt', '123', 'd82cc1be-0254-470a-b925-615444a806af', '2016-12-26 12:54:01', null, null, 'ttt', '1');
INSERT INTO `table_user` VALUES ('c4fdeab3-d61b-491e-b223-8b610ee02a5d', 'admin', '04976ff6-854a-4101-a669-115a0d64ebe2', 'admin', 'ac59075b964b0715', 'cb870f39-92ce-448e-982d-06a563efa64f', '2016-12-26 14:40:44', null, null, 'admin', '1');
INSERT INTO `table_user` VALUES ('7c04a2e6-e03b-4133-b6fd-3690464bcd38', 'xiaoli', '04976ff6-854a-4101-a669-115a0d64ebe2', 'xiaoli', '123', '783755de-1a45-4175-84c4-6c7258289002', '2016-12-26 14:41:32', null, null, 'xiaoli', '1');
INSERT INTO `table_user` VALUES ('de47e39c-dea9-4b58-b722-7815c22168df', 'sss', 'a933b45b-1fb4-4cce-91c2-d35fe8f56a93', 'sss', '123', '8d3918d5-1115-4586-a346-f4e6e7ee8c6c', '2016-12-26 14:49:52', null, null, 'sss', '1');
INSERT INTO `table_user` VALUES ('f9854aa5-7951-4772-947d-879df3c66dea', 'admin1', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', 'admin1', '123', 'ba1b545f-c09d-41ab-9a1d-a9f1a1ce8593', '2016-12-26 14:52:18', null, null, 'admin1', '1');
INSERT INTO `table_user` VALUES ('5754f7ef-cb39-4826-806c-4fd33214c0a1', 'admin1', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '', '123', 'e0b01c5a-abed-43f3-87f8-93a16358dff6', '2016-12-26 18:36:50', null, null, '', '1');
INSERT INTO `table_user` VALUES ('772a3f41-c8b0-44a3-83bd-764e372dfd03', 'admin2', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '', '123', '0faf2a0c-d26a-4e7e-8b5c-ffc4cb71ac88', '2016-12-26 18:37:03', null, null, '', '1');
INSERT INTO `table_user` VALUES ('285d29b4-aca0-496c-8750-9f8a5b360549', 'ysq123456@qq.com', '04976ff6-854a-4101-a669-115a0d64ebe2', '娃哈哈', '83aa400af464c76d', '8c2855f9-44d2-4404-b241-b2a30b9740c2', '2017-05-01 22:39:09', null, null, '娃哈哈', '1');
INSERT INTO `table_user` VALUES ('f5170461-5c5b-4fc3-ba6d-35825eb87601', 'jhl0612@qq.com', '04976ff6-854a-4101-a669-115a0d64ebe2', '', '49ba59abbe56e057', '30114348-cf8d-4130-acf9-a55343b80f53', '2017-06-12 12:12:44', null, null, '', '1');
INSERT INTO `table_user` VALUES ('4c4d9f52-e46b-4014-b469-20f7e4a44d60', '13858108287@qq.com', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '', 'c4d86fd5364d7e45', '1a44553d-f1de-4516-8095-d1ba8c4331f8', '2017-08-19 16:33:19', null, null, '', '1');

-- ----------------------------
-- Table structure for `table_usr_status`
-- ----------------------------
DROP TABLE IF EXISTS `table_usr_status`;
CREATE TABLE `table_usr_status` (
  `usr_stu_id` varchar(50) DEFAULT NULL,
  `usr_stu_account` varchar(50) DEFAULT NULL,
  `usr_stu_stu` tinyint(2) DEFAULT NULL,
  `usr_stu_balance` decimal(16,2) DEFAULT NULL,
  `usr_stu_reachdate` datetime DEFAULT NULL,
  `usr_stu_reachip` char(20) DEFAULT NULL,
  `usr_stu_machine_total` int(6) DEFAULT NULL,
  `usr_stu_machine_expire` int(6) DEFAULT NULL,
  `usr_stu_machine_stop` int(6) DEFAULT NULL,
  `usr_stu_machine_fault` int(6) DEFAULT NULL,
  `usr_stu_need_restock` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_usr_status
-- ----------------------------

-- ----------------------------
-- Table structure for `table_withdraw_record`
-- ----------------------------
DROP TABLE IF EXISTS `table_withdraw_record`;
CREATE TABLE `table_withdraw_record` (
  `id` varchar(50) DEFAULT NULL,
  `client_id` varchar(50) DEFAULT NULL,
  `money` float(10,2) DEFAULT NULL,
  `opt_type` varchar(1) DEFAULT NULL,
  `opt_status` varchar(1) DEFAULT NULL,
  `opt_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_withdraw_record
-- ----------------------------

-- ----------------------------
-- Function structure for `getClientLst`
-- ----------------------------
DROP FUNCTION IF EXISTS `getClientLst`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getClientLst`(rootId VARCHAR(50)) RETURNS varchar(1000) CHARSET utf8
BEGIN
      DECLARE sTemp VARCHAR(1000);
      DECLARE sTempChd VARCHAR(1000);
    
       SET sTemp = '$';
       SET sTempChd =cast(rootId as CHAR);
    
      WHILE sTempChd is not null DO
         SET sTemp = concat(sTemp,',',sTempChd);
         SELECT group_concat(client_id) INTO sTempChd FROM table_client where FIND_IN_SET(client_father_id,sTempChd)>0;
      END WHILE;
       RETURN sTemp;
     END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `upd_tradestatus`;
DELIMITER ;;
CREATE TRIGGER `upd_tradestatus` AFTER UPDATE ON `table_sales_cashless` FOR EACH ROW begin  
  
 if (old.trade_status='1' and (new.trade_status='2' OR new.trade_status='4')) then
		set @clientId=(SELECT c.client_id
			FROM table_sales_cashless a 
				LEFT JOIN table_machine b ON a.machine_id = b.machine_id 
			LEFT JOIN table_client c ON b.client_id = c.client_id WHERE a.trade_no=new.trade_no);
				
		set @nowClientCount = (SELECT count(1) FROM table_total_money where client_id = @clientId);
		if @nowClientCount>0 THEN
			if new.pay_interface='微信' THEN
				update table_total_money set wx_account=(IFNULL(wx_account,0) + IFNULL(new.reality_sale_number,0)*new.trade_amount) -  IFNULL(new.service_charge,0) where client_id=@clientId;
			elseif new.pay_interface='支付宝' THEN
				update table_total_money set ali_account=(IFNULL(ali_account,0)+IFNULL(new.reality_sale_number,0)*new.trade_amount) -  IFNULL(new.service_charge,0) where client_id=@clientId;
			end if;
		elseif @nowClientCount=0 THEN 
			if new.pay_interface='微信' THEN
				INSERT INTO table_total_money(client_id,wx_account) VALUES(@clientId,IFNULL(new.reality_sale_number,0)*new.trade_amount -  IFNULL(new.service_charge,0));
			elseif new.pay_interface='支付宝' THEN
				INSERT INTO table_total_money(client_id,ali_account) VALUES(@clientId,IFNULL(new.reality_sale_number,0)*new.trade_amount -  IFNULL(new.service_charge,0));
			end if;
		 
		end if;

  end if;
  
end
;;
DELIMITER ;
