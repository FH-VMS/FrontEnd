/*
Navicat MySQL Data Transfer

Source Server         : 正式
Source Server Version : 50717
Source Host           : 106.14.190.9:3306
Source Database       : db_fh

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-08-20 21:50:58
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
INSERT INTO `table_client` VALUES ('1a44553d-f1de-4516-8095-d1ba8c4331f8', '清个个', '可用', '30114348-cf8d-4130-acf9-a55343b80f53', '运营商', '王一清', '13858108287', null, null, null, null, null, '0001-01-01 00:00:00', 'jhl0612@qq.com', '2017-08-20 20:59:32', null);
INSERT INTO `table_client` VALUES ('b0c03d54-6834-4472-baf3-f9728512a9e1', '清一夏', '可用', '30114348-cf8d-4130-acf9-a55343b80f53', '运营商', '王二清', '17779334467', null, null, null, null, 'jhl0612@qq.com', '2017-08-20 21:00:44', null, null, null);

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
INSERT INTO `table_corr_dms` VALUES ('0300381f-c15a-46a7-a394-d73f9d45d07b', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '2', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('d3e91ad4-51fc-4aa7-b1a2-b651f225e9c3', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '3', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('176eb069-0a13-4e9e-8b14-0cd172d9978a', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '9', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('5dd8e447-00eb-416f-8104-219e82722f8a', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '10', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('b1f21882-c594-441d-9bb8-e1b08e0bb335', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '29', '0', '0', '0', '1', null);
INSERT INTO `table_corr_dms` VALUES ('3b7b2407-3455-41f9-9536-080bf8fcbeac', 'a933b45b-1fb4-4cce-91c2-d35fe8f56a93', '2', '1', '0', '0', '0', null);
INSERT INTO `table_corr_dms` VALUES ('2d44452a-c936-4b1f-859e-ad12317f39c6', 'a933b45b-1fb4-4cce-91c2-d35fe8f56a93', '29', '0', '0', '0', '1', null);

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
INSERT INTO `table_goods_status` VALUES ('A0101', 'ABC000000001', '6', '10', null, null, '1', '2017-06-26 16:59:45', 'A');
INSERT INTO `table_goods_status` VALUES ('A0102', 'ABC000000001', '9', '10', null, null, '1', '2017-06-26 16:59:45', 'A');
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
INSERT INTO `table_goods_status` VALUES ('A0403', 'JL5710000001', '0', '0', null, null, '1', '2017-07-24 17:10:04', '3');
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
INSERT INTO `table_goods_status` VALUES ('A0604', 'JL5710000001', '2', '0', null, null, '1', '2017-08-13 17:17:18', '3');
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
  `latest_date` datetime DEFAULT NULL,
  `mobile_pay_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_machine
-- ----------------------------
INSERT INTO `table_machine` VALUES ('ABC123456789', '12345', '32984fed-48ac-48ad-ac02-2dd028a2beb8', 'cb870f39-92ce-448e-982d-06a563efa64f', 'c4fdeab3-d61b-491e-b223-8b610ee02a5d', '2016-12-01 09:33:21', '2016-12-09 09:33:24', null, 'root', '2016-12-27 17:33:27', 'root', '2017-08-20 14:03:47', null, null, '1');
INSERT INTO `table_machine` VALUES ('ba37426d-3025-4698-b034-39c1821900da', 'AW009LS123', '56cea9ce-1d87-4e37-9398-e37346276188', '783755de-1a45-4175-84c4-6c7258289002', '7c04a2e6-e03b-4133-b6fd-3690464bcd38', '2016-12-01 12:12:23', '2016-12-31 12:12:26', null, 'root', '2016-12-31 20:12:31', 'root', '2017-01-10 18:16:54', null, null, '1');
INSERT INTO `table_machine` VALUES ('25795909-ed7a-4c9c-b58f-36d3dd14a552', 'AW001', '32984fed-48ac-48ad-ac02-2dd028a2beb8', 'd82cc1be-0254-470a-b925-615444a806af', '477e407a-f2b9-4598-b5cf-3e1e0067c0ec', '2016-12-01 12:33:10', '2016-12-31 12:33:12', null, 'root', '2016-12-31 20:33:15', null, null, null, null, '1');
INSERT INTO `table_machine` VALUES ('FKHZ00000001', 'FKHZ00000001', '4a058f34-0647-4c38-9a9f-35ea32372c9b', '8c2855f9-44d2-4404-b241-b2a30b9740c2', '285d29b4-aca0-496c-8750-9f8a5b360549', '2017-05-13 15:34:05', null, null, 'root', '2017-05-13 23:34:01', null, null, null, '2017-05-19 20:54:22', '1');
INSERT INTO `table_machine` VALUES ('FKHZ00000002', 'FKHZ00000002', '4a058f34-0647-4c38-9a9f-35ea32372c9b', '8c2855f9-44d2-4404-b241-b2a30b9740c2', '285d29b4-aca0-496c-8750-9f8a5b360549', '2017-05-13 15:34:24', null, null, 'root', '2017-05-13 23:34:18', null, null, null, '2017-08-10 17:56:18', '1');
INSERT INTO `table_machine` VALUES ('FKHZ00000003', 'FKHZ00000003', '4a058f34-0647-4c38-9a9f-35ea32372c9b', '8c2855f9-44d2-4404-b241-b2a30b9740c2', '285d29b4-aca0-496c-8750-9f8a5b360549', '2017-05-13 15:34:38', null, null, 'root', '2017-05-13 23:34:31', null, null, null, '2017-06-21 16:18:28', '1');
INSERT INTO `table_machine` VALUES ('FKHZ00000004', 'FKHZ00000004', '4a058f34-0647-4c38-9a9f-35ea32372c9b', '8c2855f9-44d2-4404-b241-b2a30b9740c2', '285d29b4-aca0-496c-8750-9f8a5b360549', '2017-05-13 15:34:52', null, null, 'root', '2017-05-13 23:34:44', null, null, null, '2017-05-23 13:10:43', '1');
INSERT INTO `table_machine` VALUES ('JL5710000001', 'JL5710000001', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '1a44553d-f1de-4516-8095-d1ba8c4331f8', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-06-12 04:12:07', '2018-06-12 04:12:10', null, 'root', '2017-06-12 12:13:47', 'jhl0612@qq.com', '2017-08-20 08:39:57', null, '2017-08-20 21:48:05', '1');
INSERT INTO `table_machine` VALUES ('CJLB17070001', 'CJLB17070001', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-07-01 05:17:39', '2018-07-01 05:17:41', null, 'root', '2017-07-01 13:19:25', null, null, null, '2017-08-19 17:54:21', '1');
INSERT INTO `table_machine` VALUES ('ABC000000001', 'ABC000000001', '32984fed-48ac-48ad-ac02-2dd028a2beb8', 'cb870f39-92ce-448e-982d-06a563efa64f', 'c4fdeab3-d61b-491e-b223-8b610ee02a5d', '2017-07-28 16:00:00', '2017-08-17 16:00:00', null, 'root', '2017-08-09 11:49:48', 'root', '2017-08-20 15:47:22', '华瑞中心点位', '2017-08-20 21:46:32', '1');
INSERT INTO `table_machine` VALUES ('JHLA17080001', 'JHLA17080001', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:42:10', '2018-08-20 00:42:20', null, 'root', '2017-08-20 08:44:33', null, null, null, null, '1');
INSERT INTO `table_machine` VALUES ('JHLA17080002', 'JHLA17080002', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:43:07', '2017-08-20 00:43:09', null, 'root', '2017-08-20 08:45:19', 'jhl0612@qq.com', '2017-08-20 09:00:26', null, null, '1');
INSERT INTO `table_machine` VALUES ('JHLA17080003', 'JHLA17080003', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:43:47', '2017-08-20 00:43:50', null, 'root', '2017-08-20 08:45:59', null, null, null, null, '1');
INSERT INTO `table_machine` VALUES ('JHLA17080004', 'JHLA17080004', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:46:42', '2017-08-20 00:46:46', null, 'root', '2017-08-20 08:48:55', null, null, null, null, '1');
INSERT INTO `table_machine` VALUES ('JHLA17080005', 'JHLA17080005', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:47:02', '2017-08-20 00:47:04', null, 'root', '2017-08-20 08:49:13', null, null, null, null, '1');
INSERT INTO `table_machine` VALUES ('JHLA17080006', 'JHLA17080006', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:47:23', '2017-08-20 00:47:25', null, 'root', '2017-08-20 08:49:34', null, null, null, null, '1');
INSERT INTO `table_machine` VALUES ('JHLA17080007', 'JHLA17080007', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:47:47', '2017-08-20 00:47:50', null, 'root', '2017-08-20 08:49:59', null, null, null, null, '1');
INSERT INTO `table_machine` VALUES ('JHLA17080008', 'JHLA17080008', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:48:09', '2017-08-20 00:48:11', null, 'root', '2017-08-20 08:50:20', null, null, null, null, '1');
INSERT INTO `table_machine` VALUES ('JHLB17080001', 'JHLB17080001', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:48:32', '2017-08-20 00:48:35', null, 'root', '2017-08-20 08:50:49', 'root', '2017-08-20 08:52:33', null, null, '1');
INSERT INTO `table_machine` VALUES ('JHLB17080002', 'JHLB17080002', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:49:17', '2018-08-20 00:49:20', null, 'root', '2017-08-20 08:51:32', null, null, null, null, '1');
INSERT INTO `table_machine` VALUES ('JHLB17080003', 'JHLB17080003', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:53:53', '2018-08-20 00:53:56', null, 'root', '2017-08-20 08:56:09', null, null, null, null, '1');
INSERT INTO `table_machine` VALUES ('JHLB17080004', 'JHLB17080004', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:54:24', '2018-08-20 00:54:27', null, 'root', '2017-08-20 08:56:39', null, null, null, null, '1');
INSERT INTO `table_machine` VALUES ('JHLB17080005', 'JHLB17080005', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:54:48', '2018-08-20 00:54:50', null, 'root', '2017-08-20 08:57:02', null, null, null, null, '1');
INSERT INTO `table_machine` VALUES ('JHLB17080006', 'JHLB17080006', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:55:33', '2018-08-20 00:55:35', null, 'root', '2017-08-20 08:57:47', null, null, null, null, '1');
INSERT INTO `table_machine` VALUES ('JHLB17080007', 'JHLB17080007', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:55:57', '2018-08-20 00:55:59', null, 'root', '2017-08-20 08:58:13', null, null, null, null, '1');
INSERT INTO `table_machine` VALUES ('JHLB17080008', 'JHLB17080008', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '30114348-cf8d-4130-acf9-a55343b80f53', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:56:18', '2018-08-20 00:56:20', null, 'root', '2017-08-20 08:58:31', null, null, null, null, '1');

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
-- Table structure for `table_mobile_pay_config`
-- ----------------------------
DROP TABLE IF EXISTS `table_mobile_pay_config`;
CREATE TABLE `table_mobile_pay_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `ali_parter` varchar(20) DEFAULT NULL,
  `ali_key` varchar(50) DEFAULT NULL,
  `ali_refund_appid` varchar(20) DEFAULT NULL,
  `ali_refund_rsa_sign` varchar(400) DEFAULT NULL,
  `wx_appid` varchar(50) DEFAULT NULL,
  `wx_mchid` varchar(20) DEFAULT NULL,
  `wx_key` varchar(50) DEFAULT NULL,
  `wx_appsecret` varchar(50) DEFAULT NULL,
  `wx_sslcert_path` varchar(50) DEFAULT NULL,
  `wx_sslcert_password` varchar(20) DEFAULT NULL,
  `client_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_mobile_pay_config
-- ----------------------------
INSERT INTO `table_mobile_pay_config` VALUES ('1', '测试移动支付配置', '2088621838347114', '7bvs5ke7to0m6064mt7tkcm1gafo9qjf', '2017042106870868', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxYzgAHv6GEr1C6a3iVZdztLYPWmiI2bVSWbel1oNLlGDvYCnbYY9zb80FqNh3toLpHNgdOrKQf4AtYxtF+aU4I0x+v29PzNQ5+QWSqa5AqYZwCXx0bbk9HXogz94uJBzs3QN1J3rm2xDi8w7KNJTDn42FBgxZV7iprhsEnnEqKI8fWb2WXB/TPguBEzaku6LFWqKfBTF50HybknXfbpiergUpZdpBGIW7CHrsBxTmkSl9A4R76kb770N2xcBmC6/gMUT4gG4OPRWKfWoXaNHSCX8T/Fv7uEANe39w59ze0XOoitxH1o60DvzSg5Mhwd7PVtPU3aLY/3Jf0cwe6cvIQIDAQAB', 'wx926450e6541e90b7', '1433899402', '52733bb6f7e024a55e30b214bb743add', '52733bb6f7e024a55e30b214bb743add', 'cert/apiclient_cert.p12', '1433899402', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=355 DEFAULT CHARSET=utf8;

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
INSERT INTO `table_operation` VALUES ('338', '添加机器', '2017-08-20 11:49:28', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('339', '更新机器', '2017-08-20 14:03:46', 'root', null, 'ABC123456789');
INSERT INTO `table_operation` VALUES ('340', '更新机器', '2017-08-20 15:23:54', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('341', '更新机器', '2017-08-20 15:27:12', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('342', '更新机器', '2017-08-20 15:30:15', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('343', '更新机器', '2017-08-20 15:34:33', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('344', '更新机器', '2017-08-20 15:36:15', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('345', '更新机器', '2017-08-20 15:39:16', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('346', '更新机器', '2017-08-20 15:42:02', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('347', '更新机器', '2017-08-20 15:42:39', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('348', '更新机器', '2017-08-20 15:44:10', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('349', '更新机器', '2017-08-20 15:44:53', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('350', '更新机器', '2017-08-20 15:47:22', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('351', '更新客户', '2017-08-20 20:58:42', 'jhl0612@qq.com', '1a44553d-f1de-4516-8095-d1ba8c4331f8', null);
INSERT INTO `table_operation` VALUES ('352', '更新客户', '2017-08-20 20:59:31', 'jhl0612@qq.com', '1a44553d-f1de-4516-8095-d1ba8c4331f8', null);
INSERT INTO `table_operation` VALUES ('353', '新增或修改会员信息', '2017-08-20 21:00:44', 'jhl0612@qq.com', 'b0c03d54-6834-4472-baf3-f9728512a9e1', null);
INSERT INTO `table_operation` VALUES ('354', '新增或修改用户信息', '2017-08-20 21:01:22', 'jhl0612@qq.com', 'ac7204eb-3907-47bf-a824-01d7ba4d4102', null);

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
INSERT INTO `table_refund` VALUES (null, '2017060721001004430239567083', null, '{\"batch_no\":\"2017060711454006599433\",\"notify_id\":\"b7d19944fd8ef94b8b0a77dc587b291lha\",\"notify_time\":\"2017-06-07 11:45:41\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004430239567083^0.01^SUCCESS\",\"sign\":\"568ce2fecd6b3497b1dfd0915d4fb02f\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004430239490710', null, '{\"batch_no\":\"2017060711173034232091\",\"notify_id\":\"072f6ab775b840a144a27bc9e215464hme\",\"notify_time\":\"2017-06-07 11:45:47\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004430239490710^0.01^SUCCESS\",\"sign\":\"f616b1889c6dd1176fdafe8b5916d451\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004430239567083', null, '{\"batch_no\":\"2017060711454006599433\",\"notify_id\":\"b7d19944fd8ef94b8b0a77dc587b291lha\",\"notify_time\":\"2017-06-07 11:53:22\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004430239567083^0.01^SUCCESS\",\"sign\":\"82a126639a5bc5b247db245012c56057\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES ('2017060711543370315538', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"2DhP2oYF1gskdseL\",\"out_refund_no\":\"143389940220170607115609654\",\"out_trade_no\":\"2017060711543370315538\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403162017060701207267953\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"A489919B9EB998970F753D252A649B7B\",\"total_fee\":\"1\",\"transaction_id\":\"4009642001201706074665089532\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004430239567083', null, '{\"batch_no\":\"2017060711454006599433\",\"notify_id\":\"b7d19944fd8ef94b8b0a77dc587b291lha\",\"notify_time\":\"2017-06-07 12:00:41\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004430239567083^0.01^SUCCESS\",\"sign\":\"3af588092bdea7c58fc51ad6d147d0a8\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES ('2017060712022537194371', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"vEywFX6r6NBkJbcj\",\"out_refund_no\":\"143389940220170607120250867\",\"out_trade_no\":\"2017060712022537194371\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503172017060701207094820\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"F64D13374CE0D1B975D972D13ACB13B8\",\"total_fee\":\"1\",\"transaction_id\":\"4009642001201706074668498141\"}');
INSERT INTO `table_refund` VALUES ('2017060712042023062315', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"bNtbXMiJPsHo8yNq\",\"out_refund_no\":\"143389940220170607120442805\",\"out_trade_no\":\"2017060712042023062315\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503092017060701207538460\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"5D3664E82B59CA27C426393A367835D1\",\"total_fee\":\"1\",\"transaction_id\":\"4009642001201706074665624053\"}');
INSERT INTO `table_refund` VALUES ('2017060712091280683698', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"R9tzd88rbunw7OyM\",\"out_refund_no\":\"143389940220170607120932749\",\"out_trade_no\":\"2017060712091280683698\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003122017060701207284317\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"8AE51BE6A7E48705D4168F1024ED11D8\",\"total_fee\":\"1\",\"transaction_id\":\"4001952001201706074667078648\"}');
INSERT INTO `table_refund` VALUES ('2017060712111099362623', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"fdjOUCypsMNMGf4t\",\"out_refund_no\":\"143389940220170607121130491\",\"out_trade_no\":\"2017060712111099362623\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603182017060701207545062\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"084DA4D1CB6E4E8BB8CD68CE0719C662\",\"total_fee\":\"1\",\"transaction_id\":\"4001952001201706074663979422\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004430239567083', null, '{\"batch_no\":\"2017060711454006599433\",\"notify_id\":\"b7d19944fd8ef94b8b0a77dc587b291lha\",\"notify_time\":\"2017-06-07 12:13:50\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004430239567083^0.01^SUCCESS\",\"sign\":\"4c28ddff2e52547c343f30e297951e05\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060521001004430236074574', null, '{\"batch_no\":\"2017060708504377983618\",\"notify_id\":\"8d2f7cc2da01796ed8d1ec9c44b04fbmva\",\"notify_time\":\"2017-06-07 12:18:49\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060521001004430236074574^0.01^SUCCESS\",\"sign\":\"faaa2111de46fcfa4b7417d901acda1c\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004760256622269', null, '{\"batch_no\":\"2017060711034014455821\",\"notify_id\":\"89699efc6e45b06f18a4b73e6603080h8i\",\"notify_time\":\"2017-06-07 12:31:27\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004760256622269^0.01^SUCCESS\",\"sign\":\"2576ac680c9478891076431293ac9d7f\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004430239298716', null, '{\"batch_no\":\"2017060709175148095072\",\"notify_id\":\"c22649d7faa3953c11dc97aadaba897ipa\",\"notify_time\":\"2017-06-07 12:44:25\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004430239298716^0.01^SUCCESS\",\"sign\":\"6bffc6286f2f986dfbb17431b181c958\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004430239490710', null, '{\"batch_no\":\"2017060711173034232091\",\"notify_id\":\"072f6ab775b840a144a27bc9e215464hme\",\"notify_time\":\"2017-06-07 12:45:32\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004430239490710^0.01^SUCCESS\",\"sign\":\"9c54e7fb821b05b8f2c27dbaec5e6b55\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004760256846968', null, '{\"batch_no\":\"2017060712454413162438\",\"notify_id\":\"9e68872c4a78f0072035f5658ecc4afixm\",\"notify_time\":\"2017-06-07 12:45:45\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004760256846968^0.01^SUCCESS\",\"sign\":\"71bc364fd52a84701b8057963a6a2858\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004430239311915', null, '{\"batch_no\":\"2017060709210351784982\",\"notify_id\":\"583b9dde00225b8b67a5eab6d429645i0a\",\"notify_time\":\"2017-06-07 12:50:48\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004430239311915^0.01^SUCCESS\",\"sign\":\"25be6765468631e016d7b7163d013ec5\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004760256846968', null, '{\"batch_no\":\"2017060712454413162438\",\"notify_id\":\"9e68872c4a78f0072035f5658ecc4afixm\",\"notify_time\":\"2017-06-07 12:53:33\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004760256846968^0.01^SUCCESS\",\"sign\":\"5c94d04532e96bf1ceb59d51005db9f2\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004760256846968', null, '{\"batch_no\":\"2017060712454413162438\",\"notify_id\":\"9e68872c4a78f0072035f5658ecc4afixm\",\"notify_time\":\"2017-06-07 13:00:39\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004760256846968^0.01^SUCCESS\",\"sign\":\"362ee303e22b9645d258156f2d1f9844\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004760256846968', null, '{\"batch_no\":\"2017060712454413162438\",\"notify_id\":\"9e68872c4a78f0072035f5658ecc4afixm\",\"notify_time\":\"2017-06-07 13:13:30\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004760256846968^0.01^SUCCESS\",\"sign\":\"73eda5175dac00ffea7dfc93c63bf6c2\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004430239567083', null, '{\"batch_no\":\"2017060711454006599433\",\"notify_id\":\"b7d19944fd8ef94b8b0a77dc587b291lha\",\"notify_time\":\"2017-06-07 13:13:34\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004430239567083^0.01^SUCCESS\",\"sign\":\"3b616ecfc9ad6b8f75afc6ca52d2836f\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004760256846968', null, '{\"batch_no\":\"2017060712454413162438\",\"notify_id\":\"9e68872c4a78f0072035f5658ecc4afixm\",\"notify_time\":\"2017-06-07 14:14:51\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004760256846968^0.01^SUCCESS\",\"sign\":\"a5f0b9c29cea95eaf5f5f6c35e8dd25c\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004430239965760', null, '{\"batch_no\":\"2017060702155014802134\",\"notify_id\":\"3dbf9a27d17f8890c9f21ffa111ff2fneq\",\"notify_time\":\"2017-06-07 14:15:51\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004430239965760^0.01^SUCCESS\",\"sign\":\"247bcab6f08633a21908ed994061af25\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004430239490710', null, '{\"batch_no\":\"2017060711173034232091\",\"notify_id\":\"072f6ab775b840a144a27bc9e215464hme\",\"notify_time\":\"2017-06-07 14:44:05\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004430239490710^0.01^SUCCESS\",\"sign\":\"3872c1a2bba6fb7e5eab12f6d952c309\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004430239567083', null, '{\"batch_no\":\"2017060711454006599433\",\"notify_id\":\"b7d19944fd8ef94b8b0a77dc587b291lha\",\"notify_time\":\"2017-06-07 15:13:36\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004430239567083^0.01^SUCCESS\",\"sign\":\"b56741c8cc581e5d5bddabfbdb01650d\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004760256846968', null, '{\"batch_no\":\"2017060712454413162438\",\"notify_id\":\"9e68872c4a78f0072035f5658ecc4afixm\",\"notify_time\":\"2017-06-07 16:09:26\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004760256846968^0.01^SUCCESS\",\"sign\":\"6a8f744cdf45e8f38987b1ec85cda2ed\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES ('2017060705433108298722', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"QGRQ3R3DgVM0v6db\",\"out_refund_no\":\"14338994022017060717435026\",\"out_trade_no\":\"2017060705433108298722\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000202902017060701209323015\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"2DBBB11B256BE6578367EE038D349259\",\"total_fee\":\"1\",\"transaction_id\":\"4001952001201706074707625922\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004430239490710', null, '{\"batch_no\":\"2017060711173034232091\",\"notify_id\":\"072f6ab775b840a144a27bc9e215464hme\",\"notify_time\":\"2017-06-07 20:41:19\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004430239490710^0.01^SUCCESS\",\"sign\":\"5aac2420e9517535bc9111f5682d35f3\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004430239567083', null, '{\"batch_no\":\"2017060711454006599433\",\"notify_id\":\"b7d19944fd8ef94b8b0a77dc587b291lha\",\"notify_time\":\"2017-06-07 21:12:52\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004430239567083^0.01^SUCCESS\",\"sign\":\"1145107f7d5d68f197dc68e1e6770330\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004760256846968', null, '{\"batch_no\":\"2017060712454413162438\",\"notify_id\":\"9e68872c4a78f0072035f5658ecc4afixm\",\"notify_time\":\"2017-06-07 22:13:16\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004760256846968^0.01^SUCCESS\",\"sign\":\"8a3d6a07309eb19d278fc44dde0499bf\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES ('2017060711071867736344', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"nyNnHO4vUbAXOVi4\",\"out_refund_no\":\"143389940220170607230739685\",\"out_trade_no\":\"2017060711071867736344\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000202902017060701210582347\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"629EA184DD672893A968F056A656A701\",\"total_fee\":\"1\",\"transaction_id\":\"4001952001201706074751767170\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004430239490710', null, '{\"batch_no\":\"2017060711173034232091\",\"notify_id\":\"072f6ab775b840a144a27bc9e215464hme\",\"notify_time\":\"2017-06-08 11:44:13\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004430239490710^0.01^SUCCESS\",\"sign\":\"817036e0097905191d53e7110adaf130\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004430239567083', null, '{\"batch_no\":\"2017060711454006599433\",\"notify_id\":\"b7d19944fd8ef94b8b0a77dc587b291lha\",\"notify_time\":\"2017-06-08 12:09:05\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004430239567083^0.01^SUCCESS\",\"sign\":\"f57c7a92dfc3dc5f2069752eb32f8417\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017060721001004760256846968', null, '{\"batch_no\":\"2017060712454413162438\",\"notify_id\":\"9e68872c4a78f0072035f5658ecc4afixm\",\"notify_time\":\"2017-06-08 13:10:38\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017060721001004760256846968^0.01^SUCCESS\",\"sign\":\"2a6e92351e18be282ca346c8c8144fd2\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES ('2017061409074494992462', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"zZdKXO7ihAfRBNtV\",\"out_refund_no\":\"143389940220170614090806588\",\"out_trade_no\":\"2017061409074494992462\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403242017061401238277822\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"055D371ED44507CA414E451CE3AD0D74\",\"total_fee\":\"1\",\"transaction_id\":\"4001952001201706145641618660\"}');
INSERT INTO `table_refund` VALUES ('2017061408562447625538', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"XGJT841rjygamsYl\",\"out_refund_no\":\"143389940220170614205658302\",\"out_trade_no\":\"2017061408562447625538\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603502017061401241703174\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"93B3109B0356B99C1B2BE2C36162EC50\",\"total_fee\":\"1\",\"transaction_id\":\"4001952001201706145740369662\"}');
INSERT INTO `table_refund` VALUES (null, '2017061421001004790215195688', null, '{\"batch_no\":\"2017061410154679421097\",\"notify_id\":\"d5a46d6424466bd07180ce8d0e4ed34nby\",\"notify_time\":\"2017-06-14 22:15:48\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017061421001004790215195688^0.01^SUCCESS\",\"sign\":\"eecbfdaade019034425f546a0f1b1c81\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES ('2017061410161826297214', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"mOQ76kEigYEjGciC\",\"out_refund_no\":\"143389940220170614221636648\",\"out_trade_no\":\"2017061410161826297214\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403322017061401241472820\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"F8A42716B17A3DA682648488D7C035EA\",\"total_fee\":\"1\",\"transaction_id\":\"4009932001201706145749023852\"}');
INSERT INTO `table_refund` VALUES (null, '2017061421001004790215208902', null, '{\"batch_no\":\"2017061410175049736304\",\"notify_id\":\"8041a5f3d165eac9bf08382e8236730lbq\",\"notify_time\":\"2017-06-14 22:17:51\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017061421001004790215208902^0.01^SUCCESS\",\"sign\":\"186795bc5e3d44c819885afbf40c6d72\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES ('2017061410191741928582', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"nUIUlUc6UUiRx0ka\",\"out_refund_no\":\"143389940220170614221944465\",\"out_trade_no\":\"2017061410191741928582\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603422017061401241767641\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"A831F1F8C29FC9F145FE13F475C36AD6\",\"total_fee\":\"1\",\"transaction_id\":\"4001132001201706145747093718\"}');
INSERT INTO `table_refund` VALUES ('2017061410192137239907', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"4YzGs2A7V8TZ6rB0\",\"out_refund_no\":\"143389940220170614222012325\",\"out_trade_no\":\"2017061410192137239907\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303472017061401241036853\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"593094159222EC156F58B8C6FBB58AE1\",\"total_fee\":\"1\",\"transaction_id\":\"4009932001201706145749113307\"}');
INSERT INTO `table_refund` VALUES ('2017061410202955986442', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"kp5IjsUoWKSjGU7Z\",\"out_refund_no\":\"143389940220170614222055930\",\"out_trade_no\":\"2017061410202955986442\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203382017061401241474690\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"AB4B99C2A7C136B00E4481A0BAC87968\",\"total_fee\":\"1\",\"transaction_id\":\"4003002001201706145745877266\"}');
INSERT INTO `table_refund` VALUES ('2017061410225251298835', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"xKonlOi5rFZXLoeA\",\"out_refund_no\":\"143389940220170614222337514\",\"out_trade_no\":\"2017061410225251298835\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703352017061401241481924\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"6B10397365B1EFA8D89790CC96085206\",\"total_fee\":\"1\",\"transaction_id\":\"4009932001201706145749221711\"}');
INSERT INTO `table_refund` VALUES ('2017061508481543407657', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"i0NamVP98yiepNLJ\",\"out_refund_no\":\"143389940220170615084840232\",\"out_trade_no\":\"2017061508481543407657\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503492017061501242622281\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"E94CC8D3DDB36C407F983A9B19C3AAC1\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155779827741\"}');
INSERT INTO `table_refund` VALUES ('2017061508491173167459', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"DhBScJk8YnfLJlXD\",\"out_refund_no\":\"14338994022017061508493764\",\"out_trade_no\":\"2017061508491173167459\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303312017061501242464894\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"3BDF007F84B274B8AF53EF678B252517\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155781677835\"}');
INSERT INTO `table_refund` VALUES ('2017061508560965887748', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"YjuCOzl1wl4RtGye\",\"out_refund_no\":\"14338994022017061508563040\",\"out_trade_no\":\"2017061508560965887748\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503492017061501242469048\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"44E9195C7B12FA50770903C20748FD9D\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155783055453\"}');
INSERT INTO `table_refund` VALUES ('2017061508575191027643', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"e4yT9RcrC8miaZbH\",\"out_refund_no\":\"143389940220170615085825254\",\"out_trade_no\":\"2017061508575191027643\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703432017061501242213900\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"F0A5FC834F49DD2C6689DC6856A72889\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155781865399\"}');
INSERT INTO `table_refund` VALUES ('2017061508594666161387', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"2EgA8Jva4cAXKvBu\",\"out_refund_no\":\"143389940220170615090013418\",\"out_trade_no\":\"2017061508594666161387\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503252017061501242220351\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"0EEF457EBF1AD4CA17823B002F35B5A8\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155780169221\"}');
INSERT INTO `table_refund` VALUES ('2017061509023060128935', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"EReOeMAi0hP0i9vb\",\"out_refund_no\":\"14338994022017061509025440\",\"out_trade_no\":\"2017061509023060128935\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103372017061501242907941\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"CDCF9E0E91FC184912B8BD8712291C9C\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155780244817\"}');
INSERT INTO `table_refund` VALUES ('2017061509120885863877', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"zFLcivftD8RTxA5g\",\"out_refund_no\":\"143389940220170615091231515\",\"out_trade_no\":\"2017061509120885863877\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203382017061501242647609\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"84C6EFFB053C2FADA532A12F5C3DFD13\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155786499442\"}');
INSERT INTO `table_refund` VALUES ('2017061509232857059058', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"gXLCW0SuAYXHLo11\",\"out_refund_no\":\"143389940220170615092352548\",\"out_trade_no\":\"2017061509232857059058\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303472017061501242659401\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"B5E6E098787D54E8226FBC0BA83A57FB\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155785511899\"}');
INSERT INTO `table_refund` VALUES ('2017061509281305855846', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"J3mC77ko7yfOa9mg\",\"out_refund_no\":\"143389940220170615092836480\",\"out_trade_no\":\"2017061509281305855846\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503252017061501242488347\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"3065C74714B9206C401AE750A46DA29A\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155786915877\"}');
INSERT INTO `table_refund` VALUES ('2017061509351862649100', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"rNVET3G9tfFEvPyU\",\"out_refund_no\":\"143389940220170615093541288\",\"out_trade_no\":\"2017061509351862649100\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403482017061501242668512\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"2CE719343A052207D4743638ECB57801\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155784139708\"}');
INSERT INTO `table_refund` VALUES ('2017061509391597034724', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"8iv3o14Myr31ZGO9\",\"out_refund_no\":\"143389940220170615093938126\",\"out_trade_no\":\"2017061509391597034724\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003282017061501242939187\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"2390DEF178D5AC50457A0B70A80C4C28\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155788994056\"}');
INSERT INTO `table_refund` VALUES ('2017061509432742348437', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"2khWr2nYz7a0NZfQ\",\"out_refund_no\":\"143389940220170615094353883\",\"out_trade_no\":\"2017061509432742348437\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503492017061501242496329\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"558A989EDE4F9C08356447C208889282\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155789103101\"}');
INSERT INTO `table_refund` VALUES ('2017061509453411098601', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"DnGWDahEKoZCngoI\",\"out_refund_no\":\"143389940220170615094559240\",\"out_trade_no\":\"2017061509453411098601\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403242017061501242948588\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"E1D04776307C2A8EB5006E0B4750B99E\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155790408868\"}');
INSERT INTO `table_refund` VALUES ('2017061509530776723006', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"Y29JaL2xEhccZ6Rj\",\"out_refund_no\":\"143389940220170615095326411\",\"out_trade_no\":\"2017061509530776723006\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603502017061501242952177\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"3838C228F44A1D594F91DE1BDDE94C4C\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155792338750\"}');
INSERT INTO `table_refund` VALUES ('2017061509551814224809', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"CgjTX3uVzk7hqU3h\",\"out_refund_no\":\"143389940220170615095543909\",\"out_trade_no\":\"2017061509551814224809\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703432017061501242268953\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"6F11544F84468887123ED0D0C73AB4A0\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155790640311\"}');
INSERT INTO `table_refund` VALUES ('2017061509585106413394', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"mG854HuGxgHfSZ6r\",\"out_refund_no\":\"143389940220170615095915417\",\"out_trade_no\":\"2017061509585106413394\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703432017061501242268836\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"01FE7BDCE72386D3AA20DB3462AA8955\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155789554999\"}');
INSERT INTO `table_refund` VALUES ('2017061510052373591531', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"XJUPRZlxwsKZrZcP\",\"out_refund_no\":\"143389940220170615100546534\",\"out_trade_no\":\"2017061510052373591531\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103372017061501242523253\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"7A7CDCDF6A513CA941A8270654B86E25\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155792690961\"}');
INSERT INTO `table_refund` VALUES ('2017061510181793913740', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"hjoD1bSPa2wYUiBr\",\"out_refund_no\":\"143389940220170615101851837\",\"out_trade_no\":\"2017061510181793913740\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003282017061501242541162\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"82905146924BF2F1A306BCC63B1E31AE\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155790165256\"}');
INSERT INTO `table_refund` VALUES ('2017061510393529699832', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"vumdvmotGFKapRq4\",\"out_refund_no\":\"143389940220170615103959846\",\"out_trade_no\":\"2017061510393529699832\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103212017061501243217886\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"6B3F602624063E0B26EF316E16F1F7C8\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155792050401\"}');
INSERT INTO `table_refund` VALUES ('2017061510425204562458', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"i9DBGlN9aWARHeJZ\",\"out_refund_no\":\"143389940220170615104318272\",\"out_trade_no\":\"2017061510425204562458\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303392017061501242744033\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"15DC86C11DEE8FB8FBAED2ED3552F9F6\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155795067539\"}');
INSERT INTO `table_refund` VALUES ('2017061510454448202245', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"pMzctsAxBIDCrZH1\",\"out_refund_no\":\"143389940220170615104609359\",\"out_trade_no\":\"2017061510454448202245\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003202017061501242573902\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"C392B35E3542AE3AA68D780F97864506\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155795184256\"}');
INSERT INTO `table_refund` VALUES ('2017061510472466894269', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"6RUDRmFBu7rBA6cA\",\"out_refund_no\":\"143389940220170615104753251\",\"out_trade_no\":\"2017061510472466894269\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703432017061501243226706\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"CA9A40718AFACA6C5FA66C1360B4F003\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155792234743\"}');
INSERT INTO `table_refund` VALUES ('2017061510595260731971', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"VEHLmJwzIxI9MyeG\",\"out_refund_no\":\"143389940220170615110032423\",\"out_trade_no\":\"2017061510595260731971\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703512017061501243242703\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"1E341E6BEAF9E9A6C0FDACAD15D76890\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155797360799\"}');
INSERT INTO `table_refund` VALUES ('2017061511044171859712', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"JbAUYw6R2MWp5yhT\",\"out_refund_no\":\"143389940220170615110505819\",\"out_trade_no\":\"2017061511044171859712\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703432017061501243032372\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"646F03E8DE818CD6B5BF58899D2AD868\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155798811351\"}');
INSERT INTO `table_refund` VALUES ('2017061511062875057046', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"qZF47Wpv9BdnvfTw\",\"out_refund_no\":\"143389940220170615110657507\",\"out_trade_no\":\"2017061511062875057046\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303232017061501243249362\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"734572B11CF951F495DAA0841FCE3A4D\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155795858755\"}');
INSERT INTO `table_refund` VALUES ('2017061511080965731388', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"g0V96gzQhML47IMu\",\"out_refund_no\":\"143389940220170615110842419\",\"out_trade_no\":\"2017061511080965731388\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003202017061501243251217\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"580E46E18591A509BEA6C63151193DBD\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155795935072\"}');
INSERT INTO `table_refund` VALUES ('2017061511095100172725', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"3qqb5GAVjQynCSIn\",\"out_refund_no\":\"143389940220170615111017106\",\"out_trade_no\":\"2017061511095100172725\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703352017061501242768392\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"D89E99B825F0FE233FECF0FB88A3D4F3\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155800716879\"}');
INSERT INTO `table_refund` VALUES ('2017061511112715861383', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"hMjHcHGbuTBTHQhv\",\"out_refund_no\":\"143389940220170615111154807\",\"out_trade_no\":\"2017061511112715861383\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003282017061501242597886\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"3744593F39A34AD105CCE5D734DEF0E0\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155797757544\"}');
INSERT INTO `table_refund` VALUES ('2017061511131778434087', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"J3Y6xaMOCONinF03\",\"out_refund_no\":\"143389940220170615111341247\",\"out_trade_no\":\"2017061511131778434087\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303472017061501243502657\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"608888C7E93E04A36B64FEB7DBC20248\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155797891227\"}');
INSERT INTO `table_refund` VALUES ('2017061511145773813884', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"g6rRJXqIGCbmQg4r\",\"out_refund_no\":\"143389940220170615111522987\",\"out_trade_no\":\"2017061511145773813884\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203382017061501243504620\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"94A749AD26AD0294F66D0FA6734E2577\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155799188050\"}');
INSERT INTO `table_refund` VALUES ('2017061511155936358023', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"iL8DmLBX4qDXLsGV\",\"out_refund_no\":\"143389940220170615111618324\",\"out_trade_no\":\"2017061511155936358023\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703352017061501243046052\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"39E821284572CA7049DC9C4FB0EDA17C\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155799249615\"}');
INSERT INTO `table_refund` VALUES ('2017061511165119191356', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"hreBjIRDSVUD8CHY\",\"out_refund_no\":\"143389940220170615111714626\",\"out_trade_no\":\"2017061511165119191356\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203222017061501243259676\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"E3460736B5D44BE888655FED6545C7F2\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155800937954\"}');
INSERT INTO `table_refund` VALUES ('2017061511180709873299', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"Hbd8dRepUiNwdGFv\",\"out_refund_no\":\"143389940220170615111830340\",\"out_trade_no\":\"2017061511180709873299\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703272017061501243259323\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"B510AF9FD97E14D6716BDAAD28A9F64B\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155800990311\"}');
INSERT INTO `table_refund` VALUES ('2017061511192358359600', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"Te1sZfV2Cac2COvt\",\"out_refund_no\":\"143389940220170615111945597\",\"out_trade_no\":\"2017061511192358359600\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703352017061501243265514\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"8CB9F2A140C5ED3FEF52D4B3990CEDD8\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155799332623\"}');
INSERT INTO `table_refund` VALUES ('2017061512331043998206', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"teqAnSF2b1PC7uhs\",\"out_refund_no\":\"143389940220170615123348175\",\"out_trade_no\":\"2017061512331043998206\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103212017061501243344498\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"BD1876A8B5B18CA227F3C7F1632FEA33\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155814362337\"}');
INSERT INTO `table_refund` VALUES ('2017061512343640872643', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"iPsbtbIDIotkTZLw\",\"out_refund_no\":\"143389940220170615123501223\",\"out_trade_no\":\"2017061512343640872643\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203302017061501243343383\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"B3CF0A8B7ED74D67A64147DC56D30BC1\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155814432490\"}');
INSERT INTO `table_refund` VALUES ('2017061512360347121880', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"XG8lOZlQHOIrbN5Q\",\"out_refund_no\":\"143389940220170615123644730\",\"out_trade_no\":\"2017061512360347121880\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603422017061501243602530\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"72CE4B2D6FFBF6FD46991D76C76712B7\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155814521846\"}');
INSERT INTO `table_refund` VALUES ('2017061512381695555665', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"VJAlJXfAgV6TWCG6\",\"out_refund_no\":\"143389940220170615123840920\",\"out_trade_no\":\"2017061512381695555665\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103452017061501243130670\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"6755A414BDB5847732FBCB42166699E6\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155814573945\"}');
INSERT INTO `table_refund` VALUES ('2017061512420345558668', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"iggruxWGLXngbAZw\",\"out_refund_no\":\"143389940220170615124228930\",\"out_trade_no\":\"2017061512420345558668\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703352017061501243351479\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"0C21BCA687F45DA801B755DB2675B912\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155816305871\"}');
INSERT INTO `table_refund` VALUES ('2017061512425248688988', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"EmKtVnP3sroKuKrn\",\"out_refund_no\":\"143389940220170615124311950\",\"out_trade_no\":\"2017061512425248688988\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303312017061501243352884\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"C23ED9694A118EFAECDBAC675A1A57A1\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155811711659\"}');
INSERT INTO `table_refund` VALUES ('2017061512434973687631', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"EgXqG1no7vY5IVSS\",\"out_refund_no\":\"143389940220170615124419105\",\"out_trade_no\":\"2017061512434973687631\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203382017061501242870188\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"D5C8725641D3F991E2C1E28B7D1A9F0F\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155813529074\"}');
INSERT INTO `table_refund` VALUES ('2017061512480076807173', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"DFWLLsSbzxDn5GQG\",\"out_refund_no\":\"143389940220170615124820908\",\"out_trade_no\":\"2017061512480076807173\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303392017061501243143623\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"BFFB68EB41A3F6B59A83358501A2E359\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155811867571\"}');
INSERT INTO `table_refund` VALUES ('2017061503251134287474', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"HDtYd7IJMR2XudXH\",\"out_refund_no\":\"143389940220170615152535229\",\"out_trade_no\":\"2017061503251134287474\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603502017061501244408465\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"C5861F7CAF79BBEDD839BD62675CA1A9\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155831980222\"}');
INSERT INTO `table_refund` VALUES ('2017061503263146821429', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"plrGFbF6ECdzlkVl\",\"out_refund_no\":\"143389940220170615152656484\",\"out_trade_no\":\"2017061503263146821429\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003282017061501243929586\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"4443B3C5FAA061816EF0186C2080CD05\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155833236552\"}');
INSERT INTO `table_refund` VALUES ('2017061503330481459193', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"W7nKJ037b9bAmr8G\",\"out_refund_no\":\"143389940220170615153329528\",\"out_trade_no\":\"2017061503330481459193\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003202017061501243773145\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"4E2204C6142D111CDF03299AD6F277F2\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155833476000\"}');
INSERT INTO `table_refund` VALUES (null, '2017061521001004790216169524', null, '{\"batch_no\":\"2017061503390692628366\",\"notify_id\":\"f9f701ed30ff5c0dabfc324ac82fb1bk62\",\"notify_time\":\"2017-06-15 15:39:08\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017061521001004790216169524^0.01^SUCCESS\",\"sign\":\"04be22bc41a04352d51754397f9595ac\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES ('2017061503424695881947', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"65EZ3ajK2ReIEsqE\",\"out_refund_no\":\"143389940220170615154309207\",\"out_trade_no\":\"2017061503424695881947\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503332017061501243788591\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"99E7B48E89D3A922BD039FDF921E109F\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155835142349\"}');
INSERT INTO `table_refund` VALUES ('2017061503520716554002', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"ggpOoCqFnmYmsf4X\",\"out_refund_no\":\"143389940220170615155257758\",\"out_trade_no\":\"2017061503520716554002\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103452017061501244439557\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"224B29A828B3C1548822D3CD63256520\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155838817465\"}');
INSERT INTO `table_refund` VALUES ('2017061503550621351169', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"qXvM2Ycm9jjAxpOu\",\"out_refund_no\":\"143389940220170615155528479\",\"out_trade_no\":\"2017061503550621351169\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603422017061501244701150\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"734FD7CC3407A1F0D5EB758A5850CDB7\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155837221206\"}');
INSERT INTO `table_refund` VALUES ('2017061504011110658124', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"Z9fEUwI0sGuWzIve\",\"out_refund_no\":\"143389940220170615160144185\",\"out_trade_no\":\"2017061504011110658124\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603422017061501243966930\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"E58E93F29624D3F8BD6FDB380CED2603\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155837357046\"}');
INSERT INTO `table_refund` VALUES ('2017061504025276345134', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"XjDrpW4Z9u2S07dc\",\"out_refund_no\":\"143389940220170615160332419\",\"out_trade_no\":\"2017061504025276345134\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203382017061501244714662\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"FBFF851EA58DB2812D63358FF813EEE5\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155837356850\"}');
INSERT INTO `table_refund` VALUES ('2017061504052623315949', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"D2B3fp4J56gL4foH\",\"out_refund_no\":\"143389940220170615160550220\",\"out_trade_no\":\"2017061504052623315949\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203462017061501244716490\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"55A3A358822B65131188FFE58E878683\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155837488282\"}');
INSERT INTO `table_refund` VALUES ('2017061504071329639741', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"u8OScmRPtvXVGbn9\",\"out_refund_no\":\"143389940220170615160730803\",\"out_trade_no\":\"2017061504071329639741\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603502017061501244228898\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"D51A46ADB941D758EE18760D09CB467F\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155840359582\"}');
INSERT INTO `table_refund` VALUES ('2017061504080724984459', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"0yIbgVazcckhaedL\",\"out_refund_no\":\"143389940220170615160827301\",\"out_trade_no\":\"2017061504080724984459\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303232017061501244230853\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"2C778786FED3C43221AAAB8CA42E777E\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155835932867\"}');
INSERT INTO `table_refund` VALUES ('2017061504090040644819', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"9q390kXgKXlCizu1\",\"out_refund_no\":\"143389940220170615160923509\",\"out_trade_no\":\"2017061504090040644819\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403482017061501244456778\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"CBB8C5BD7A1FD1A36D2569092AE08239\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155839324252\"}');
INSERT INTO `table_refund` VALUES ('2017061504110945418594', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"rjqPL2cKMSIpblHd\",\"out_refund_no\":\"143389940220170615161142788\",\"out_trade_no\":\"2017061504110945418594\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003362017061501244232864\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"551B5A2C37D7CB6F305FAE8F12C793D7\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155840521680\"}');
INSERT INTO `table_refund` VALUES ('2017061504160312785776', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"qNyAAXgaEXJQfAI7\",\"out_refund_no\":\"14338994022017061516162890\",\"out_trade_no\":\"2017061504160312785776\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203222017061501244474640\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"FC80E883E29A2C169B56156C25320974\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155837746530\"}');
INSERT INTO `table_refund` VALUES ('2017061504171123764568', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"VPYi1egqzcnN09oI\",\"out_refund_no\":\"14338994022017061516173163\",\"out_trade_no\":\"2017061504171123764568\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703272017061501244726857\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"E0268AEF827BAF7B8D636E8E0DEA2332\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155837792551\"}');
INSERT INTO `table_refund` VALUES ('2017061504192595731111', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"CvjAL0c3XQpxZgLR\",\"out_refund_no\":\"143389940220170615161946943\",\"out_trade_no\":\"2017061504192595731111\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303392017061501244246395\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"6B363AC620DA2A2C40FA5C78196E5BCF\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155836260499\"}');
INSERT INTO `table_refund` VALUES ('2017061504284219267611', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"ZcRaZmNwEK7WiT4c\",\"out_refund_no\":\"143389940220170615162938158\",\"out_trade_no\":\"2017061504284219267611\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003282017061501244488089\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"63BDB182F84882129BE56C6A710A56EA\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155839947912\"}');
INSERT INTO `table_refund` VALUES ('2017061504295777036354', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"Wj4S6ZAtZbzd4q8n\",\"out_refund_no\":\"143389940220170615163022498\",\"out_trade_no\":\"2017061504295777036354\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603262017061501244742816\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"5E5233E9970F9B3D855E58C8B07FCC49\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155842562982\"}');
INSERT INTO `table_refund` VALUES ('2017061504420692197028', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"dX0F8geB4BP76SPD\",\"out_refund_no\":\"143389940220170615164237227\",\"out_trade_no\":\"2017061504420692197028\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103212017061501244504673\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"488C28FE74A0B2F779DDB7C1A379AD29\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155842977345\"}');
INSERT INTO `table_refund` VALUES ('2017061504434190567442', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"lTwvhGaENs9uAYXs\",\"out_refund_no\":\"143389940220170615164408787\",\"out_trade_no\":\"2017061504434190567442\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003362017061501244274772\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"EAD322D88279F8E854B9A3FBB7D79A54\",\"total_fee\":\"1\",\"transaction_id\":\"4008362001201706155846423824\"}');
INSERT INTO `table_refund` VALUES ('2017061504434489006696', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"YIMbOZU4I3h8c8YO\",\"out_refund_no\":\"1433899402201706151644179\",\"out_trade_no\":\"2017061504434489006696\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703352017061501244757518\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"5C70A0292FE362159AEF85B357E8887E\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155846455055\"}');
INSERT INTO `table_refund` VALUES ('2017061504525818339927', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"vKVb9olvRnFLwcOL\",\"out_refund_no\":\"143389940220170615165336599\",\"out_trade_no\":\"2017061504525818339927\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303232017061501244514737\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"573C1B497931295A447403CCEF8A89DF\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155843343459\"}');
INSERT INTO `table_refund` VALUES ('2017061504581996251490', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"ocd3WGH3Covvb7O6\",\"out_refund_no\":\"143389940220170615165852375\",\"out_trade_no\":\"2017061504581996251490\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203302017061501244288979\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"B479E11615D973B0A30599AC384DFA01\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155845118410\"}');
INSERT INTO `table_refund` VALUES ('2017061505415353972788', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"ZiEUptlatREP7ck7\",\"out_refund_no\":\"143389940220170615174337629\",\"out_trade_no\":\"2017061505415353972788\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103372017061501244571257\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"081E0D57F6C555DC88793A7B01B9D5DA\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155854487441\"}');
INSERT INTO `table_refund` VALUES ('2017061505451682238752', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"f9zXmoe2BlWpnIEF\",\"out_refund_no\":\"14338994022017061517454746\",\"out_trade_no\":\"2017061505451682238752\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703272017061501244338127\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"2246341A930DCDB0BF8717829AAB28B0\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155849541703\"}');
INSERT INTO `table_refund` VALUES ('2017061505473747942047', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"gP6ccVJjFtXAvRA5\",\"out_refund_no\":\"143389940220170615174809530\",\"out_trade_no\":\"2017061505473747942047\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503252017061501244089340\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"77DE276A4988A7E34B96FDB393BC91D9\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155852889061\"}');
INSERT INTO `table_refund` VALUES ('2017061505491223009233', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"ywTBB9yvT3QU35B7\",\"out_refund_no\":\"143389940220170615174950787\",\"out_trade_no\":\"2017061505491223009233\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103212017061501244837766\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"A833DF2593EFB479D97727E29757DC15\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155849688129\"}');
INSERT INTO `table_refund` VALUES ('2017061505504384007979', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"eXOcT3GeZZ39egZS\",\"out_refund_no\":\"143389940220170615175128311\",\"out_trade_no\":\"2017061505504384007979\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703352017061501244839352\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"A4C05EC3668D39EFC2C7FEBDC29F8BAE\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155853024111\"}');
INSERT INTO `table_refund` VALUES ('2017061505521268432171', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"6alUT3GosbCIwqUA\",\"out_refund_no\":\"143389940220170615175246788\",\"out_trade_no\":\"2017061505521268432171\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203382017061501244350847\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"E79092A7F33CA32661C7D10A11F18B33\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155853097074\"}');
INSERT INTO `table_refund` VALUES ('2017061505533226297225', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"njBUY4Hf41cemvx0\",\"out_refund_no\":\"14338994022017061517535694\",\"out_trade_no\":\"2017061505533226297225\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003202017061501244351254\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"F87299FEC093BF03CC9E6B62069A899B\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155853142912\"}');
INSERT INTO `table_refund` VALUES ('2017061505545110728139', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"m0jNyhUvRKE4XgFe\",\"out_refund_no\":\"143389940220170615175600958\",\"out_trade_no\":\"2017061505545110728139\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503492017061501244097904\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"EF1E9A55A28E04783CFC450BCEC47111\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155854912669\"}');
INSERT INTO `table_refund` VALUES ('2017061505563167039348', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"nxjleEytxpPtgifE\",\"out_refund_no\":\"143389940220170615175650757\",\"out_trade_no\":\"2017061505563167039348\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003282017061501244585958\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"B093010096FA7AE521584E908E2AF294\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155851528360\"}');
INSERT INTO `table_refund` VALUES ('2017061505594842161974', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"7W5IdYPbdf70H8X2\",\"out_refund_no\":\"143389940220170615180009112\",\"out_trade_no\":\"2017061505594842161974\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103212017061501244588216\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"B1D06E4DE6878BFE1290346B335D4D07\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155850048673\"}');
INSERT INTO `table_refund` VALUES ('2017061506014350057916', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"cEzAhWxD8ZRetYup\",\"out_refund_no\":\"143389940220170615180208742\",\"out_trade_no\":\"2017061506014350057916\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203382017061501244590643\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"6B15174A892C31DD0BD7B59435F7850B\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155853470098\"}');
INSERT INTO `table_refund` VALUES ('2017061506025140721939', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"yHAGXjGQsNxVuO6x\",\"out_refund_no\":\"143389940220170615180314172\",\"out_trade_no\":\"2017061506025140721939\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003202017061501244854563\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"AB3484A340122716A9712E9BCFA29692\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155850170912\"}');
INSERT INTO `table_refund` VALUES ('2017061506044193913671', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"8s4BCVtbwlVbvGvM\",\"out_refund_no\":\"143389940220170615180515899\",\"out_trade_no\":\"2017061506044193913671\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703432017061501244594953\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"D372DD12EC985331F8900299FCBD9970\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155855243703\"}');
INSERT INTO `table_refund` VALUES ('2017061506051178316020', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"NtR38gHnKOoa9JyF\",\"out_refund_no\":\"143389940220170615180536260\",\"out_trade_no\":\"2017061506051178316020\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403402017061501245006609\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"894191D1A019A7D55637E8047222D5EE\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155851902612\"}');
INSERT INTO `table_refund` VALUES ('2017061506063687733656', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"OYGtUZEWmbe7Yf3A\",\"out_refund_no\":\"143389940220170615180701965\",\"out_trade_no\":\"2017061506063687733656\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503332017061501245008054\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"3B1C2815DE402A58E14A66467B397E32\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155851968813\"}');
INSERT INTO `table_refund` VALUES ('2017061506080086232666', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"szFAbPZbLqmvn4HP\",\"out_refund_no\":\"143389940220170615180854294\",\"out_trade_no\":\"2017061506080086232666\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503412017061501244596842\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"6FCB12C4EFDBA65BD9D89F491E49440E\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155853674869\"}');
INSERT INTO `table_refund` VALUES ('2017061506093987852148', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"4sSJ7EaswtkzsHXP\",\"out_refund_no\":\"143389940220170615181003425\",\"out_trade_no\":\"2017061506093987852148\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303232017061501244601717\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"D7016B831EDEF22858C3294E193A9AB8\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155856473027\"}');
INSERT INTO `table_refund` VALUES ('2017061506094417549902', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"2rtUxI6TcgLrYLFF\",\"out_refund_no\":\"143389940220170615181042423\",\"out_trade_no\":\"2017061506094417549902\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003442017061501244604126\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"5AE89BB29B2558188816D2EC7B22806A\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155852066520\"}');
INSERT INTO `table_refund` VALUES ('2017061506112156675616', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"wrhoRfHNntuJE1iN\",\"out_refund_no\":\"143389940220170615181148497\",\"out_trade_no\":\"2017061506112156675616\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403482017061501245012478\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"06D49F83163258B84AB777AC3EDB6DB8\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155852095964\"}');
INSERT INTO `table_refund` VALUES ('2017061506115352006121', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"hZinTRq1gSfvk7Ju\",\"out_refund_no\":\"143389940220170615181303358\",\"out_trade_no\":\"2017061506115352006121\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303312017061501244864719\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"4127A4EC1CD4CC2089C4D29BCA654B7E\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155853882827\"}');
INSERT INTO `table_refund` VALUES ('2017061506142892726376', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"bVbPq7xxWU9bllEe\",\"out_refund_no\":\"143389940220170615181451915\",\"out_trade_no\":\"2017061506142892726376\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503492017061501244868412\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"BCC500312F633A2518523806A915BD6D\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155855706653\"}');
INSERT INTO `table_refund` VALUES ('2017061506160508415035', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"yJcB3cmUs6UoMOZ6\",\"out_refund_no\":\"14338994022017061518173529\",\"out_trade_no\":\"2017061506160508415035\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003282017061501244612746\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"2FC73F7469E5C70032D7B13779446A1D\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155852288296\"}');
INSERT INTO `table_refund` VALUES ('2017061506243686868182', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"PTlxSca3eJTIKwSj\",\"out_refund_no\":\"143389940220170615182500308\",\"out_trade_no\":\"2017061506243686868182\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003202017061501244385349\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"30EB17FBBF8501D1D07959B79D4A91FB\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155857071616\"}');
INSERT INTO `table_refund` VALUES ('2017061506245455629410', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"EYTa6zGVrRzXJuPq\",\"out_refund_no\":\"143389940220170615182524553\",\"out_trade_no\":\"2017061506245455629410\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103292017061501244383298\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"22DB373AF7F2F3FE2091153095C2FD2F\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155857040745\"}');
INSERT INTO `table_refund` VALUES ('2017061506254585348073', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"ZC6uTvXmHK3D8DvE\",\"out_refund_no\":\"143389940220170615182608605\",\"out_trade_no\":\"2017061506254585348073\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303232017061501244878763\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"299034148D1453117C2407F1791118AC\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155857066755\"}');
INSERT INTO `table_refund` VALUES ('2017061506264704139514', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"TG81VIiKbarv4dfb\",\"out_refund_no\":\"143389940220170615182713961\",\"out_trade_no\":\"2017061506264704139514\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503412017061501244882744\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"F1572C0416AF1D18D8318C84BC48CECA\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155860426517\"}');
INSERT INTO `table_refund` VALUES ('2017061506264149441476', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"atZfzCwRHAScVUah\",\"out_refund_no\":\"14338994022017061518273115\",\"out_trade_no\":\"2017061506264149441476\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403242017061501245030123\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"35303A92DFC07114A320F5362251E6C9\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155856183620\"}');
INSERT INTO `table_refund` VALUES ('2017061506280624506383', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"flx4Mu0hfWM0UH2n\",\"out_refund_no\":\"143389940220170615182828901\",\"out_trade_no\":\"2017061506280624506383\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003362017061501244386889\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"10EF70ED66475E67EC170AABCB1A7A54\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155858793840\"}');
INSERT INTO `table_refund` VALUES ('2017061506285641727489', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"9ts8xJyBFNbzEBp7\",\"out_refund_no\":\"143389940220170615182942584\",\"out_trade_no\":\"2017061506285641727489\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203462017061501244390400\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"F738E66B66CFE6441377ED3ED675D868\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155860519546\"}');
INSERT INTO `table_refund` VALUES ('2017061506302301151867', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"IqvixnzdxaK9nLsU\",\"out_refund_no\":\"143389940220170615183045828\",\"out_trade_no\":\"2017061506302301151867\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203222017061501244889414\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"F67C5EF7DC727F9DAF8C4C961FDBC517\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155860556898\"}');
INSERT INTO `table_refund` VALUES ('2017061506312032438724', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"yJfSBYTBrGQIEMUP\",\"out_refund_no\":\"1433899402201706151831412\",\"out_trade_no\":\"2017061506312032438724\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403322017061501245039255\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"65B53143C0C34861A9D1EEED0345326C\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155856295596\"}');
INSERT INTO `table_refund` VALUES ('2017061506331237191428', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"MSsfBcJLWwTqjv6V\",\"out_refund_no\":\"143389940220170615183334404\",\"out_trade_no\":\"2017061506331237191428\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503412017061501244398323\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"6E5575ABEC8AA9AA1DE80D6FFBECF9B4\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155862395349\"}');
INSERT INTO `table_refund` VALUES ('2017061506331690322410', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"LG09uxo16NwgTf9F\",\"out_refund_no\":\"143389940220170615183351348\",\"out_trade_no\":\"2017061506331690322410\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603502017061501244626256\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"477F6179776A2733CEA333B27C8D91ED\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155862455454\"}');
INSERT INTO `table_refund` VALUES ('2017061506342865372556', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"QeI08SGoPHIwugey\",\"out_refund_no\":\"143389940220170615183531646\",\"out_trade_no\":\"2017061506342865372556\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503492017061501244399317\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"645982A43B467C6AD35A60697583C1E9\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155860735965\"}');
INSERT INTO `table_refund` VALUES ('2017061506373481118017', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"MHRPzfDqnum9DKKp\",\"out_refund_no\":\"143389940220170615183809807\",\"out_trade_no\":\"2017061506373481118017\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403242017061501245044008\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"04BFE103E8682246DA455F726F0732A7\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155860830980\"}');
INSERT INTO `table_refund` VALUES ('2017061506403160911072', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"rPzkitOiCpUGKuxY\",\"out_refund_no\":\"14338994022017061518405977\",\"out_trade_no\":\"2017061506403160911072\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303312017061501244634822\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"6966D40FA38BCADD489122F43460DEE6\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155859242635\"}');
INSERT INTO `table_refund` VALUES ('2017061506412465631933', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"BrP2NQk4EDbBUu9E\",\"out_refund_no\":\"143389940220170615184155535\",\"out_trade_no\":\"2017061506412465631933\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703352017061501244640185\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"A0627BB9652198DE66A36E91D3ED82B2\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155859253295\"}');
INSERT INTO `table_refund` VALUES ('2017061506423943776319', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"0EtZBceuVcbLh8OQ\",\"out_refund_no\":\"1433899402201706151843054\",\"out_trade_no\":\"2017061506423943776319\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003202017061501245307831\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"DA1293593DEF07777697753ADFC3FF96\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155862832256\"}');
INSERT INTO `table_refund` VALUES ('2017061506450228149213', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"fPQBkeGyd5dDdLeN\",\"out_refund_no\":\"143389940220170615184534236\",\"out_trade_no\":\"2017061506450228149213\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503332017061501245310460\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"D68E5754D61E890513CA2911377E74A7\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155859430253\"}');
INSERT INTO `table_refund` VALUES ('2017061506471856276011', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"TgIEUP15dwzISEDk\",\"out_refund_no\":\"143389940220170615184743976\",\"out_trade_no\":\"2017061506471856276011\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103212017061501245055319\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"9B62790E47A63A057B6B2D08094CFE8E\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155861232641\"}');
INSERT INTO `table_refund` VALUES ('2017061506483954702538', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"oznox1MhmXiIh79n\",\"out_refund_no\":\"1433899402201706151849032\",\"out_trade_no\":\"2017061506483954702538\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603422017061501244650359\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"C11667FA0EE3E8A82F8D4ED10DC0D044\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155859530774\"}');
INSERT INTO `table_refund` VALUES ('2017061506492778148501', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"AkXOufz9HGGU9qXI\",\"out_refund_no\":\"143389940220170615185001600\",\"out_trade_no\":\"2017061506492778148501\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603502017061501245312781\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"210CA87906113A54181F04F571555B3E\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155861363678\"}');
INSERT INTO `table_refund` VALUES ('2017061506504692201858', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"CfN6guasCj0VaBPk\",\"out_refund_no\":\"143389940220170615185130150\",\"out_trade_no\":\"2017061506504692201858\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503252017061501244653587\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"80AD11CC9F7C44DC8474FC11372FA85B\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155861402309\"}');
INSERT INTO `table_refund` VALUES ('2017061506523226589506', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"x3wLBw2NNSVyD28z\",\"out_refund_no\":\"143389940220170615185307405\",\"out_trade_no\":\"2017061506523226589506\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503252017061501244909774\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"AFDACA7B4A3AB6516653AFCB113C39AA\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155863177157\"}');
INSERT INTO `table_refund` VALUES ('2017061506541068771805', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"xRWMjF4JXHMlKyx5\",\"out_refund_no\":\"143389940220170615185436558\",\"out_trade_no\":\"2017061506541068771805\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403242017061501244914602\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"793E94298BF6D31555EFB368E202FEC7\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155859796804\"}');
INSERT INTO `table_refund` VALUES ('2017061506584259392704', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"1rsLGg3PXtQ6HpPg\",\"out_refund_no\":\"143389940220170615185912283\",\"out_trade_no\":\"2017061506584259392704\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703512017061501244667504\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"6C25A4246F4FB4A034F4154049EF64AE\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155863424511\"}');
INSERT INTO `table_refund` VALUES ('2017061507003010957723', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"3tempe3lyVircuc1\",\"out_refund_no\":\"143389940220170615190054758\",\"out_trade_no\":\"2017061507003010957723\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303472017061501244667244\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"319F7BE617E4ED3028835ABB9C9023BC\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155864515291\"}');
INSERT INTO `table_refund` VALUES ('2017061507013657838516', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"CRss0s7fByF1WMlU\",\"out_refund_no\":\"143389940220170615190202339\",\"out_trade_no\":\"2017061507013657838516\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503252017061501244921262\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"1ECA7B7513F368FB59C0786F54C665EA\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155863524773\"}');
INSERT INTO `table_refund` VALUES ('2017061507024117204384', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"TQvCaxp6lTnCZveH\",\"out_refund_no\":\"143389940220170615190311932\",\"out_trade_no\":\"2017061507024117204384\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703512017061501244669649\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"A65E6D4C5195B1DD6A74A4C8CC27A6F3\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155864620415\"}');
INSERT INTO `table_refund` VALUES ('2017061507034706279819', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"k6JBT7Xnqd0iverx\",\"out_refund_no\":\"143389940220170615190416849\",\"out_trade_no\":\"2017061507034706279819\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403322017061501244920996\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"17B409A5665CEA1DA2933F3C7622D4AF\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155861944204\"}');
INSERT INTO `table_refund` VALUES ('2017061507050584397219', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"ofJLbFKIzDzNPvx2\",\"out_refund_no\":\"143389940220170615190529292\",\"out_trade_no\":\"2017061507050584397219\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103372017061501244926701\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"3EE24E83C9E83A23A7B49F1F780826E4\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155863654161\"}');
INSERT INTO `table_refund` VALUES ('2017061507060364088060', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"2GZ8tOOamOc75tQE\",\"out_refund_no\":\"143389940220170615190630236\",\"out_trade_no\":\"2017061507060364088060\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403402017061501244927128\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"BB6268DB8ECC7C5C0D1396CA264A9E19\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155860218708\"}');
INSERT INTO `table_refund` VALUES ('2017061507070918772769', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"51yv3PEiRynjCisB\",\"out_refund_no\":\"143389940220170615190744138\",\"out_trade_no\":\"2017061507070918772769\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003442017061501244676529\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"3F9FCE0F21D1A703F2BAD0678717C423\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155864692184\"}');
INSERT INTO `table_refund` VALUES ('2017061507075479701136', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"Q8ez8ZZOFGXMXNyw\",\"out_refund_no\":\"143389940220170615190818845\",\"out_trade_no\":\"2017061507075479701136\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203462017061501244932197\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"DA30110379581FF12C0B4300158ECD06\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155860243194\"}');
INSERT INTO `table_refund` VALUES ('2017061507232110958674', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"JAyU2qfXl2h5iD3N\",\"out_refund_no\":\"143389940220170615192344296\",\"out_trade_no\":\"2017061507232110958674\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403482017061501245108485\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"331DF25A568AC29207A42099AB6BB0C8\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155868776444\"}');
INSERT INTO `table_refund` VALUES ('2017061507231945337448', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"gpzwOK6xbCycawwA\",\"out_refund_no\":\"143389940220170615192405245\",\"out_trade_no\":\"2017061507231945337448\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603422017061501245368543\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"45FC63B6532751CBFDCC79F684D0CFD8\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155866968438\"}');
INSERT INTO `table_refund` VALUES ('2017061507275185955559', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"fwDzQbGJGIOXrts8\",\"out_refund_no\":\"143389940220170615192817299\",\"out_trade_no\":\"2017061507275185955559\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203302017061501245116072\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"31AF8E1785C86CAE6BC1B50D2DF6E754\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706155867021098\"}');
INSERT INTO `table_refund` VALUES ('2017061507392568778357', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"yWIVY7bb6zt3sfev\",\"out_refund_no\":\"143389940220170615193948619\",\"out_trade_no\":\"2017061507392568778357\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103292017061501244968998\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"A2969E6F4C9969889F89A657A39EFB16\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155865840777\"}');
INSERT INTO `table_refund` VALUES ('2017061507405943772716', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"7CuL9iPVzGYf9WrP\",\"out_refund_no\":\"143389940220170615194118737\",\"out_trade_no\":\"2017061507405943772716\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203382017061501245131812\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"44DDD530AA3534C430CA8973E09EDE65\",\"total_fee\":\"1\",\"transaction_id\":\"4003932001201706155869400722\"}');
INSERT INTO `table_refund` VALUES ('2017061608554095915741', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"kxCopzvuMD7EUDbl\",\"out_refund_no\":\"143389940220170616085630628\",\"out_trade_no\":\"2017061608554095915741\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403482017061601246436330\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"E29FDB19D2D5E2133E240CCE2F4C034A\",\"total_fee\":\"1\",\"transaction_id\":\"4008722001201706165929415068\"}');
INSERT INTO `table_refund` VALUES ('2017061608561803701114', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"zbN6dnGMUhteez71\",\"out_refund_no\":\"143389940220170616085648465\",\"out_trade_no\":\"2017061608561803701114\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403322017061601246656881\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"2856E598BE62E659303FD45A9135418F\",\"total_fee\":\"1\",\"transaction_id\":\"4007522001201706165929402540\"}');
INSERT INTO `table_refund` VALUES ('2017061608574966143088', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"w8AnkQJVF7ILz2aT\",\"out_refund_no\":\"143389940220170616085812870\",\"out_trade_no\":\"2017061608574966143088\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103452017061601246655159\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"63FE4AB701AB4E34FCA09AC824A16044\",\"total_fee\":\"1\",\"transaction_id\":\"4008722001201706165929443353\"}');
INSERT INTO `table_refund` VALUES ('2017061608580367691205', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"UpP7ibp1ZtdjxqWV\",\"out_refund_no\":\"143389940220170616085844964\",\"out_trade_no\":\"2017061608580367691205\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203462017061601247202077\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"E0B6B034AC4333762C7E0A7BAE51711A\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706165932635386\"}');
INSERT INTO `table_refund` VALUES ('2017061608591364526396', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"9QmPRI1raawUDx1V\",\"out_refund_no\":\"143389940220170616085933624\",\"out_trade_no\":\"2017061608591364526396\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503252017061601247207153\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"535DCE8B680D29DA93D3109BB294B43A\",\"total_fee\":\"1\",\"transaction_id\":\"4007522001201706165930873413\"}');
INSERT INTO `table_refund` VALUES ('2017061601474790945091', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"EgLqOqCcRiarNQRt\",\"out_refund_no\":\"14338994022017061613481235\",\"out_trade_no\":\"2017061601474790945091\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303392017061601248416785\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"0DB748B3BC73D158295467648FBAAED6\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201706165974346323\"}');
INSERT INTO `table_refund` VALUES ('2017070107490999278977', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"2\",\"cash_refund_fee\":\"2\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"8UzD4prNv1LnimqQ\",\"out_refund_no\":\"143389940220170701194944395\",\"out_trade_no\":\"2017070107490999278977\",\"refund_channel\":\"\",\"refund_fee\":\"2\",\"refund_id\":\"50000503492017070101322706519\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"CE516F8216DEAF95538E3642DFBDBFEF\",\"total_fee\":\"2\",\"transaction_id\":\"4001952001201707018370600253\"}');
INSERT INTO `table_refund` VALUES ('2017070310062374271325', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"E5OhQ9GSK3xDnN3M\",\"out_refund_no\":\"143389940220170703100631974\",\"out_trade_no\":\"2017070310062374271325\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503332017070301330866275\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"2589B039FDAD09E75CD055BFACE074D9\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201707038634929229\"}');
INSERT INTO `table_refund` VALUES ('2017070310071983654953', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"Sj3vG4rgo8zEVSMx\",\"out_refund_no\":\"143389940220170703100730778\",\"out_trade_no\":\"2017070310071983654953\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103372017070301330197966\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"4B3F9BF46905F4E1F10A873A96FD73F1\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201707038631624433\"}');
INSERT INTO `table_refund` VALUES ('2017070310075664905340', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"uzlGryehto8AQ1Pc\",\"out_refund_no\":\"143389940220170703100813266\",\"out_trade_no\":\"2017070310075664905340\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703432017070301330399314\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"440FBF74D297623E2AA58B84B6CFCFFE\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201707038633134839\"}');
INSERT INTO `table_refund` VALUES ('2017070310084461777319', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"YjOFVHWJpCcOVKeT\",\"out_refund_no\":\"143389940220170703100857105\",\"out_trade_no\":\"2017070310084461777319\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003442017070301330649216\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"DC4CC5660E97EBF6D0C04FA68A6CB1B9\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201707038636799256\"}');
INSERT INTO `table_refund` VALUES ('2017070310091789905851', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"YL1mSWpU03Y5WT1W\",\"out_refund_no\":\"143389940220170703100934145\",\"out_trade_no\":\"2017070310091789905851\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403322017070301330401249\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"96F7119E0DD512EE53DF4965C333B408\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201707038636816076\"}');
INSERT INTO `table_refund` VALUES ('2017070310104133652260', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"6ci52RVmacPrmBiI\",\"out_refund_no\":\"143389940220170703101050521\",\"out_trade_no\":\"2017070310104133652260\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503332017070301330399571\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"B5B6799728402BB5E8509B3CBB115A52\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201707038633244461\"}');
INSERT INTO `table_refund` VALUES ('2017070310114421156684', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"WiVV8JKKq7OixK9u\",\"out_refund_no\":\"143389940220170703101209838\",\"out_trade_no\":\"2017070310114421156684\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503332017070301330873342\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"E44B2D9211BFA839622CA1591A4C405F\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707038631831821\"}');
INSERT INTO `table_refund` VALUES ('2017070310132669594509', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"OqIGyq7R5XHsfYBe\",\"out_refund_no\":\"143389940220170703101342515\",\"out_trade_no\":\"2017070310132669594509\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403402017070301331107002\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"7F7FDB40100AE51955AFAB7C704D9167\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707038635217044\"}');
INSERT INTO `table_refund` VALUES ('2017070810262041465602', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"3FndyiVZ425d4igk\",\"out_refund_no\":\"143389940220170708102643202\",\"out_trade_no\":\"2017070810262041465602\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003202017070801356979094\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"81C9CA404FF14FD4FE6F1996E4FEB91E\",\"total_fee\":\"1\",\"transaction_id\":\"4001412001201707089502445856\"}');
INSERT INTO `table_refund` VALUES ('2017070811051877405019', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"pVPviyImUqV6R3Ga\",\"out_refund_no\":\"143389940220170708110539823\",\"out_trade_no\":\"2017070811051877405019\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303472017070801357303288\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"240E27EADD5617FB7FD70A59361B3962\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201707089507938107\"}');
INSERT INTO `table_refund` VALUES ('2017070811074143025970', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"6tAhmmElb26giaR2\",\"out_refund_no\":\"143389940220170708110805814\",\"out_trade_no\":\"2017070811074143025970\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103372017070801357020888\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"48EAAE48DA9C0C582769B2E24708C999\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201707089506304497\"}');
INSERT INTO `table_refund` VALUES ('2017070811104907099645', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"6tOCJCvv6VFASQIx\",\"out_refund_no\":\"143389940220170708111111992\",\"out_trade_no\":\"2017070811104907099645\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003282017070801356510351\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"B9D4B55953DDE3161303AD8C28E2D0E5\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201707089508277352\"}');
INSERT INTO `table_refund` VALUES ('2017070812491657095537', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"eU60K5VuUnbNCmU1\",\"out_refund_no\":\"143389940220170708124939160\",\"out_trade_no\":\"2017070812491657095537\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503492017070801356884059\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"5C49B307B3F447A9A9B4D87269F74E63\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201707089530198685\"}');
INSERT INTO `table_refund` VALUES ('2017070812521533658789', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"CGxuU4bq80ixtbTv\",\"out_refund_no\":\"143389940220170708125246408\",\"out_trade_no\":\"2017070812521533658789\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403322017070801357535623\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"2C01382C8F217CE6E13145ED0E7920D7\",\"total_fee\":\"1\",\"transaction_id\":\"4001412001201707089534963244\"}');
INSERT INTO `table_refund` VALUES ('2017070801112232098779', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"CceBv9sdIMDd9X72\",\"out_refund_no\":\"143389940220170708131210276\",\"out_trade_no\":\"2017070801112232098779\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703432017070801357179874\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"32A6E9774F61B9BC257ADBD876630A25\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201707089537432407\"}');
INSERT INTO `table_refund` VALUES ('2017070801132410214075', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"km5vruBjviFq2UyL\",\"out_refund_no\":\"143389940220170708131738172\",\"out_trade_no\":\"2017070801132410214075\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203222017070801357483775\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"799FD437782D922EB5BFB48E885D99F0\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201707089536058850\"}');
INSERT INTO `table_refund` VALUES ('2017071009043310213406', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"rzZO3svf5gpBI79g\",\"out_refund_no\":\"14338994022017071009044391\",\"out_trade_no\":\"2017071009043310213406\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603262017071001367420289\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"56E5EDDF7F9CE8A74D16E944592F346B\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707109879023782\"}');
INSERT INTO `table_refund` VALUES ('2017071009060568024223', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"j4GOR5tOsfMTCJ4C\",\"out_refund_no\":\"143389940220170710090623299\",\"out_trade_no\":\"2017071009060568024223\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703512017071001367193393\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"64B57779523E8B0DF388A181624E3B79\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707109875392735\"}');
INSERT INTO `table_refund` VALUES ('2017071009092032097693', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"146gpSgdgNQWuhCR\",\"out_refund_no\":\"143389940220170710090959738\",\"out_trade_no\":\"2017071009092032097693\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503492017071001367046668\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"B6325E26A53768BC2F91EDB197B52BA8\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707109877426205\"}');
INSERT INTO `table_refund` VALUES ('2017071009102033651890', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"qSPUgrPAedCTJdz2\",\"out_refund_no\":\"143389940220170710091041782\",\"out_trade_no\":\"2017071009102033651890\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603422017071001366797669\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"941B71C7FFDD6D835008B441BB597BEE\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707109874152662\"}');
INSERT INTO `table_refund` VALUES ('2017071009122725844282', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"n0C99Es6mIoQ2rPD\",\"out_refund_no\":\"143389940220170710091244900\",\"out_trade_no\":\"2017071009122725844282\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303472017071001366799242\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"9829C753022579672277FAD1F424013D\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707109874226459\"}');
INSERT INTO `table_refund` VALUES ('2017071010042644592220', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"CDtYxTSMkCEQVlyN\",\"out_refund_no\":\"143389940220170710100437545\",\"out_trade_no\":\"2017071010042644592220\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703432017071001368007784\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"95260C54C3E00DEEF1776F7047885E8B\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201707109883439927\"}');
INSERT INTO `table_refund` VALUES ('2017071010060878963087', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"sQa1gOk0l9lYvdsb\",\"out_refund_no\":\"14338994022017071010062630\",\"out_trade_no\":\"2017071010060878963087\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703512017071001367477510\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"26E9D2ACEEE006065F4E92616470E031\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201707109887255967\"}');
INSERT INTO `table_refund` VALUES ('2017071010063872711707', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"AhHv1TY0L6WgBfio\",\"out_refund_no\":\"143389940220170710100658176\",\"out_trade_no\":\"2017071010063872711707\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703512017071001367754834\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"9494AE0C019CD7DD958F623B0B9173C0\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707109883598751\"}');
INSERT INTO `table_refund` VALUES ('2017071010160716465313', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"0ZUWNLdUKnrhH3HP\",\"out_refund_no\":\"143389940220170710101621284\",\"out_trade_no\":\"2017071010160716465313\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503492017071001367489801\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"A47762E4B744E1967144AC25A777CFEF\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201707109884045117\"}');
INSERT INTO `table_refund` VALUES ('2017071010170814901582', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"T3lvl09H7auH7YKT\",\"out_refund_no\":\"143389940220170710101727163\",\"out_trade_no\":\"2017071010170814901582\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103372017071001367768175\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"83161A175CDDAA0ACB775539748F2B47\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707109884081105\"}');
INSERT INTO `table_refund` VALUES ('2017071010172719597296', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"fpo3B8fnP7RLdyEd\",\"out_refund_no\":\"143389940220170710101743323\",\"out_trade_no\":\"2017071010172719597296\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603422017071001368027306\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"F28469A4FDF7AE3BD2D649AD1B72BA1A\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201707109885980214\"}');
INSERT INTO `table_refund` VALUES ('2017071010180586779382', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"sHFGKyLDmY4oMv9u\",\"out_refund_no\":\"143389940220170710101823868\",\"out_trade_no\":\"2017071010180586779382\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303312017071001367256981\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"ABBFD14AAEAB58D019C59935F31C11FC\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201707109887735659\"}');
INSERT INTO `table_refund` VALUES ('2017071010202074271411', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"7j642f9vmEsb4NuR\",\"out_refund_no\":\"143389940220170710102035407\",\"out_trade_no\":\"2017071010202074271411\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203382017071001368029565\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"EEC9F2A1CF3226AC66E7BAD7BA9D6BE6\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201707109884197330\"}');
INSERT INTO `table_refund` VALUES ('2017071010204149274338', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"UCFxtHfhDpjeedlh\",\"out_refund_no\":\"143389940220170710102057618\",\"out_trade_no\":\"2017071010204149274338\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603342017071001367490575\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"9A1C5763E180181DA50CB968B9108708\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707109887788590\"}');
INSERT INTO `table_refund` VALUES ('2017071010211641465569', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"KzZP0lWcX8Uc6jco\",\"out_refund_no\":\"143389940220170710102126363\",\"out_trade_no\":\"2017071010211641465569\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603342017071001368030778\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"7EA9B206309B60724E2F70B7F29DAD9F\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201707109887835374\"}');
INSERT INTO `table_refund` VALUES ('2017071010244924273182', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"Cg1MSpUzerpCGZL1\",\"out_refund_no\":\"143389940220170710102505204\",\"out_trade_no\":\"2017071010244924273182\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403402017071001367777219\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"7AA1D3C00896ABE4972CB73B2F7D09CD\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707109887966772\"}');
INSERT INTO `table_refund` VALUES ('2017071012411638344863', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"aBYAERKjXC6cbovg\",\"out_refund_no\":\"143389940220170710124136865\",\"out_trade_no\":\"2017071012411638344863\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703272017071001367953070\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"438A3504893B0CF77B988D6F7DB64156\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201707109918846407\"}');
INSERT INTO `table_refund` VALUES ('2017071012415750842533', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"CgRYz73o0u0rjrnD\",\"out_refund_no\":\"143389940220170710124218603\",\"out_trade_no\":\"2017071012415750842533\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103372017071001367955222\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"51BCEF0741C738116308E130B4CA4552\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707109916968465\"}');
INSERT INTO `table_refund` VALUES ('2017071001085080524262', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"jh9zBm8y3XOpnoWF\",\"out_refund_no\":\"143389940220170710130908696\",\"out_trade_no\":\"2017071001085080524262\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503412017071001367995099\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"C02E38FF5A872AF735A8C50619B4CE2E\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707109918256501\"}');
INSERT INTO `table_refund` VALUES ('2017071001094489904936', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"bvwzY67Sy4YyIgKx\",\"out_refund_no\":\"143389940220170710131015266\",\"out_trade_no\":\"2017071001094489904936\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303472017071001367995565\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"CB5339908661455B450E86E490225299\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707109922380155\"}');
INSERT INTO `table_refund` VALUES ('2017071001111003963259', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"YMU4XRp8yRdDi4Rq\",\"out_refund_no\":\"143389940220170710131120375\",\"out_trade_no\":\"2017071001111003963259\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103292017071001367996992\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"18A07910D9642C302B7DBB77DAD4AB17\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707109922500009\"}');
INSERT INTO `table_refund` VALUES ('2017071001114811772460', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"X2gJQ4RibnG4Fqye\",\"out_refund_no\":\"143389940220170710131203983\",\"out_trade_no\":\"2017071001114811772460\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103452017071001367998949\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"5B329135EA5E11C3148F4C327C718450\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707109924408249\"}');
INSERT INTO `table_refund` VALUES ('2017071001320971153421', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"mX2Orp7x7FDRFBCx\",\"out_refund_no\":\"143389940220170710133227620\",\"out_trade_no\":\"2017071001320971153421\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503412017071001368930868\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"C63AFC90B2A5C5267C18DBAD458CDA54\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707109927081845\"}');
INSERT INTO `table_refund` VALUES ('2017071001342263341780', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"cniUQmAUGChOfAMN\",\"out_refund_no\":\"143389940220170710133439462\",\"out_trade_no\":\"2017071001342263341780\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003362017071001368424477\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"78C4B8CBB3AAAA2E04D32083B6CF5F97\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707109923503248\"}');
INSERT INTO `table_refund` VALUES ('2017071002302453964666', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"rsbastadCcUNaqXr\",\"out_refund_no\":\"143389940220170710143054842\",\"out_trade_no\":\"2017071002302453964666\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503492017071001368701383\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"164F4CAD07ACBEA27CEC1B27F46FC198\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707109933697821\"}');
INSERT INTO `table_refund` VALUES ('2017071002313483658355', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"FhwR2PhdK7iaRllV\",\"out_refund_no\":\"143389940220170710143155107\",\"out_trade_no\":\"2017071002313483658355\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603422017071001368504452\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"F97D7F79316DBB3CCBAA5A234CED12D2\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707109931646102\"}');
INSERT INTO `table_refund` VALUES ('2017071401145564907187', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"mC8g4KSflkfsUrg4\",\"out_refund_no\":\"143389940220170714131508306\",\"out_trade_no\":\"2017071401145564907187\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403802017071401390275783\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"91707CDF908E009E5F5EFE8E4532554B\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707140714838908\"}');
INSERT INTO `table_refund` VALUES ('2017071401192225849802', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"pPzww4ZHdiqYyrOG\",\"out_refund_no\":\"14338994022017071413194120\",\"out_trade_no\":\"2017071401192225849802\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003682017071401390518860\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"CB846C2DD925B800C11A004269CBA552\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707140715016336\"}');
INSERT INTO `table_refund` VALUES ('2017071402402021156404', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"6UjCIw1UJHhB6etS\",\"out_refund_no\":\"143389940220170714144035746\",\"out_trade_no\":\"2017071402402021156404\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403642017071401390421796\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"A51D688AFAEE3EF0DD5FF7E5FBC69814\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707140726821996\"}');
INSERT INTO `table_refund` VALUES ('2017071509470907099144', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"oAJxLvOrS58FPgaJ\",\"out_refund_no\":\"143389940220170715094725368\",\"out_trade_no\":\"2017071509470907099144\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203782017071501395233093\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"37A5DD89E398E6D208223E8C16A60D03\",\"total_fee\":\"1\",\"transaction_id\":\"4002482001201707150852039002\"}');
INSERT INTO `table_refund` VALUES ('2017071509503464901506', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"b237S56wicVlVCob\",\"out_refund_no\":\"143389940220170715095055436\",\"out_trade_no\":\"2017071509503464901506\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003602017071501395242532\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"6B7F0CDAAED4E4449E59205DC9D7F568\",\"total_fee\":\"1\",\"transaction_id\":\"4002482001201707150852145512\"}');
INSERT INTO `table_refund` VALUES ('2017071510504144592009', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"NolSVOU1dec1W6FN\",\"out_refund_no\":\"143389940220170715105059965\",\"out_trade_no\":\"2017071510504144592009\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203782017071501395835756\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"3104CE094EC40E499B22C36C62A3A9F1\",\"total_fee\":\"1\",\"transaction_id\":\"4007522001201707150858300730\"}');
INSERT INTO `table_refund` VALUES ('2017071510571475843316', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"HAEITQaXBvpOh7Vc\",\"out_refund_no\":\"143389940220170715105734853\",\"out_trade_no\":\"2017071510571475843316\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603662017071501396227477\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"0884FA6EDE9417B50714858B33251DEF\",\"total_fee\":\"1\",\"transaction_id\":\"4007522001201707150864594286\"}');
INSERT INTO `table_refund` VALUES ('2017071510595394591884', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"9w6wFf9tEAaL0JI0\",\"out_refund_no\":\"143389940220170715110021991\",\"out_trade_no\":\"2017071510595394591884\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403642017071501395848375\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"3D02C31CE4662709F9B786B770F50AC2\",\"total_fee\":\"1\",\"transaction_id\":\"4007522001201707150866693484\"}');
INSERT INTO `table_refund` VALUES ('2017071511005613342451', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"iQ9A49iOmquaSe59\",\"out_refund_no\":\"143389940220170715110113353\",\"out_trade_no\":\"2017071511005613342451\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103612017071501395953890\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"5F057B77B15AB1D7511A507D1209A261\",\"total_fee\":\"1\",\"transaction_id\":\"4007522001201707150861690377\"}');
INSERT INTO `table_refund` VALUES ('2017071511045932097556', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"6chC56ThXoXxTagH\",\"out_refund_no\":\"143389940220170715110521799\",\"out_trade_no\":\"2017071511045932097556\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703752017071501395856379\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"5B6402D5C4A2BB4ED6D349D6655FE1D0\",\"total_fee\":\"1\",\"transaction_id\":\"4008722001201707150864939639\"}');
INSERT INTO `table_refund` VALUES ('2017071511052824273821', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"VEMpAGkmpl0OVvy6\",\"out_refund_no\":\"143389940220170715110545449\",\"out_trade_no\":\"2017071511052824273821\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003682017071501395958171\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"AF6705FD639985B7D190D2FD34E59D06\",\"total_fee\":\"1\",\"transaction_id\":\"4008722001201707150864882992\"}');
INSERT INTO `table_refund` VALUES ('2017071511053305523017', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"ph8lkpoZmfwWtpyO\",\"out_refund_no\":\"143389940220170715110601491\",\"out_trade_no\":\"2017071511053305523017\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403562017071501395957589\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"A23CC63C6D0BFFA8A15F809855653EA5\",\"total_fee\":\"1\",\"transaction_id\":\"4007522001201707150861893572\"}');
INSERT INTO `table_refund` VALUES ('2017071511072608655318', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"eUjMwZxHhmFbpT1r\",\"out_refund_no\":\"143389940220170715110738297\",\"out_trade_no\":\"2017071511072608655318\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303792017071501396240934\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"AD15E9C7A3F1785EB1C253930568369E\",\"total_fee\":\"1\",\"transaction_id\":\"4008722001201707150862001051\"}');
INSERT INTO `table_refund` VALUES ('2017071511144486773736', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"Wp2iCb7ct0MM6qEN\",\"out_refund_no\":\"143389940220170715111501513\",\"out_trade_no\":\"2017071511144486773736\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403802017071501396507293\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"B6133D6823B32D7A9CDF5C8F11B57158\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707150862293468\"}');
INSERT INTO `table_refund` VALUES ('2017071708362846153807', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"aPloKI1z4ST7SkFb\",\"out_refund_no\":\"143389940220170717083650540\",\"out_trade_no\":\"2017071708362846153807\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603822017071701407204087\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"D1423E125AB6D3FB48A5AAA73BBDFF3C\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171179208030\"}');
INSERT INTO `table_refund` VALUES ('2017071708371705526186', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"LsMAl6a0GuXcseUK\",\"out_refund_no\":\"143389940220170717083739789\",\"out_trade_no\":\"2017071708371705526186\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203782017071701407698391\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"FFC2377217562E4AD6AA6808B6FC15A3\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171177619450\"}');
INSERT INTO `table_refund` VALUES ('2017071708382080529661', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"qdud8goewpmJEsqr\",\"out_refund_no\":\"143389940220170717083840525\",\"out_trade_no\":\"2017071708382080529661\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203702017071701407701634\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"84A38A1158A0C12CBCD4600EDD761943\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171175572114\"}');
INSERT INTO `table_refund` VALUES ('2017071708392060215463', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"fSO5nqHb5u1a7mvS\",\"out_refund_no\":\"14338994022017071708394024\",\"out_trade_no\":\"2017071708392060215463\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603742017071701407701480\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"FB7C52EBF179C60A8954CED591CACC68\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171179282934\"}');
INSERT INTO `table_refund` VALUES ('2017071708441230525180', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"sA1JrSthtYB7QGVR\",\"out_refund_no\":\"143389940220170717084440147\",\"out_trade_no\":\"2017071708441230525180\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203702017071701407708668\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"A1FC97821C046B1D42A21AEEF69257A5\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707171179447602\"}');
INSERT INTO `table_refund` VALUES ('2017071708454366467190', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"N767dY9wTOTA9Fyd\",\"out_refund_no\":\"143389940220170717084603895\",\"out_trade_no\":\"2017071708454366467190\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403562017071701406933178\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"264F597181D0C3C49827608A47E2E34C\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171177866820\"}');
INSERT INTO `table_refund` VALUES ('2017071708463869591903', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"R2fW8DRXAAEX6zrB\",\"out_refund_no\":\"143389940220170717084653667\",\"out_trade_no\":\"2017071708463869591903\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503812017071701407437646\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"D103037C6FC6465AE5B1472ED5013688\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171177884477\"}');
INSERT INTO `table_refund` VALUES ('2017071708475835218105', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"nAJClcFxAP8D3Yev\",\"out_refund_no\":\"14338994022017071708494255\",\"out_trade_no\":\"2017071708475835218105\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003602017071701407440660\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"4B6F9AC051AE68B6F8067CD13D5CCADD\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707171180811912\"}');
INSERT INTO `table_refund` VALUES ('2017071708583063342705', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"66SIzGPY6I5eee1r\",\"out_refund_no\":\"143389940220170717085843854\",\"out_trade_no\":\"2017071708583063342705\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103692017071701406947622\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"FBFB5984D30C39BB83826B02B218E2EA\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707171179837297\"}');
INSERT INTO `table_refund` VALUES ('2017071708585264905263', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"y4k4OJdr9zCYwhTH\",\"out_refund_no\":\"143389940220170717085907149\",\"out_trade_no\":\"2017071708585264905263\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703832017071701407225243\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"53195641F147F380FE0D94EF8F1AEEE5\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171178236127\"}');
INSERT INTO `table_refund` VALUES ('2017071709010382099103', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"WPLdYsIqnkLKibXQ\",\"out_refund_no\":\"143389940220170717090154473\",\"out_trade_no\":\"2017071709010382099103\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503732017071701407230350\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"09084E25A411D04B443DF57D4E395E08\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171181201877\"}');
INSERT INTO `table_refund` VALUES ('2017071709031041469911', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"1Ylhw1wkp2r5n8yz\",\"out_refund_no\":\"143389940220170717090323516\",\"out_trade_no\":\"2017071709031041469911\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403802017071701407231946\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"949930535F3B695D18B3C14EDAE31011\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171179958524\"}');
INSERT INTO `table_refund` VALUES ('2017071709040203968049', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"IB2kiiLIInrC4GdB\",\"out_refund_no\":\"143389940220170717090416633\",\"out_trade_no\":\"2017071709040203968049\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203542017071701407231759\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"5F6E4310F980D48D2E20D515F10E319D\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171181275522\"}');
INSERT INTO `table_refund` VALUES ('2017071709060874279358', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"oKCNIAYrhg5Zqur9\",\"out_refund_no\":\"143389940220170717090618981\",\"out_trade_no\":\"2017071709060874279358\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203622017071701406953362\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"00F96167466AD37DFFC900BBB81E6A7A\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171180049546\"}');
INSERT INTO `table_refund` VALUES ('2017071709073633652154', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"wedjYjlxolZxUiOs\",\"out_refund_no\":\"143389940220170717090850383\",\"out_trade_no\":\"2017071709073633652154\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003522017071701407459604\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"BC5B86166287A867990E5752F010710A\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707171184458592\"}');
INSERT INTO `table_refund` VALUES ('2017071709102066465488', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"Xxac6bSuUHRXkCjv\",\"out_refund_no\":\"143389940220170717091048895\",\"out_trade_no\":\"2017071709102066465488\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603582017071701407237485\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"196A6A522405CB207A1834BA600E4DEC\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171181459238\"}');
INSERT INTO `table_refund` VALUES ('2017071709111649275844', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"RJwEIk4G13fjYaPt\",\"out_refund_no\":\"143389940220170717091143803\",\"out_trade_no\":\"2017071709111649275844\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703832017071701407239343\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"ECF3CFC8C96233BD58C4A27265C98D1E\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171180218495\"}');
INSERT INTO `table_refund` VALUES ('2017071709122128969506', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"uIxhEhSFfnZvgJVF\",\"out_refund_no\":\"143389940220170717091236763\",\"out_trade_no\":\"2017071709122128969506\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303712017071701407741881\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"A1FEE86ECCD168D52DC40227CC3E2750\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171182678227\"}');
INSERT INTO `table_refund` VALUES ('2017071709131752408920', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"7nxPVCuUCr9GSnUj\",\"out_refund_no\":\"143389940220170717091331496\",\"out_trade_no\":\"2017071709131752408920\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003682017071701407743464\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"DB7648439B597643C0050574B9E7E310\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171186323856\"}');
INSERT INTO `table_refund` VALUES ('2017071709140555523428', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"fdQasvXdqHjeEj3i\",\"out_refund_no\":\"143389940220170717091417214\",\"out_trade_no\":\"2017071709140555523428\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603742017071701407466196\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"25A327DA1C1F349BA957FD0F5472A6BA\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171186355830\"}');
INSERT INTO `table_refund` VALUES ('2017071709145230528977', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"kbXX6vDlwARXW16z\",\"out_refund_no\":\"143389940220170717091512822\",\"out_trade_no\":\"2017071709145230528977\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203782017071701407468533\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"583133A3324ECBD4BFD24DD6C206A37E\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171181572762\"}');
INSERT INTO `table_refund` VALUES ('2017071709165532092926', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"QbFAfBeKbw8k8zUF\",\"out_refund_no\":\"143389940220170717091707308\",\"out_trade_no\":\"2017071709165532092926\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303632017071701407241967\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"82D801006455A0F42A0ADBABDB832C14\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171182807051\"}');
INSERT INTO `table_refund` VALUES ('2017071709174421158562', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"yYcxKJzxQ59u5gUm\",\"out_refund_no\":\"143389940220170717091800961\",\"out_trade_no\":\"2017071709174421158562\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403722017071701407468646\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"98D45DCADA54FDAADEF47A2E2F0ACF2B\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171182832052\"}');
INSERT INTO `table_refund` VALUES ('2017071709191888348118', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"WIhdkbrCxAZcXvB7\",\"out_refund_no\":\"143389940220170717091934285\",\"out_trade_no\":\"2017071709191888348118\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303712017071701406964579\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"67A39214FF510FA975F66789F4C5F8B8\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171184847635\"}');
INSERT INTO `table_refund` VALUES ('2017071709201422717159', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"PEtlLHZCX3pXplYl\",\"out_refund_no\":\"143389940220170717092028175\",\"out_trade_no\":\"2017071709201422717159\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403642017071701407750877\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"5AF033F13F86958CDE036418CF3A1B5E\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171181772108\"}');
INSERT INTO `table_refund` VALUES ('2017071709434849273925', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"BnRZHSKpyqoT04tY\",\"out_refund_no\":\"143389940220170717094400739\",\"out_trade_no\":\"2017071709434849273925\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503812017071701407273336\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"521AF3CFF4938A03AD896FA91D7618BB\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707171187169981\"}');
INSERT INTO `table_refund` VALUES ('2017071710030388344071', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"Gg86nI9zyB5XFgRT\",\"out_refund_no\":\"143389940220170717100318351\",\"out_trade_no\":\"2017071710030388344071\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503732017071701407524620\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"FF922F2E9CAAA765FDAAB8E23ED10EFC\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707171187813173\"}');
INSERT INTO `table_refund` VALUES ('2017071710040135211728', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"jeAH2RBdKXs8aFkB\",\"out_refund_no\":\"143389940220170717100417759\",\"out_trade_no\":\"2017071710040135211728\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403722017071701407801102\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"01788ABD4505D3C200882919C6E831CA\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707171184187188\"}');
INSERT INTO `table_refund` VALUES ('2017071710040247714171', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"zsrAHP08cwYAOkEF\",\"out_refund_no\":\"143389940220170717100439309\",\"out_trade_no\":\"2017071710040247714171\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603822017071701407801303\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"51375FD680D91C01CCC41D19920C9294\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171186282558\"}');
INSERT INTO `table_refund` VALUES ('2017071710052808651393', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"MP9tHPnBhz3gWOdO\",\"out_refund_no\":\"143389940220170717100543287\",\"out_trade_no\":\"2017071710052808651393\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703752017071701407913316\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"2F71D3D3A44BD87DC357A666BBB6B732\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707171187964407\"}');
INSERT INTO `table_refund` VALUES ('2017071710055558654128', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"EK72QGhhtQ0FodH5\",\"out_refund_no\":\"14338994022017071710060783\",\"out_trade_no\":\"2017071710055558654128\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403722017071701407294745\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"7E51E3D2A7200A73B1DD7C6F01DDF53F\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171187933716\"}');
INSERT INTO `table_refund` VALUES ('2017071710062636771464', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"p1wvFnuvkhzo5tXk\",\"out_refund_no\":\"143389940220170717100636940\",\"out_trade_no\":\"2017071710062636771464\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703592017071701407292479\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"975C51E1052B8F7D76FBFB244726E26B\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707171189242727\"}');
INSERT INTO `table_refund` VALUES ('2017071710064482097634', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"lW8Ta8E3pY0EVgTq\",\"out_refund_no\":\"143389940220170717100700447\",\"out_trade_no\":\"2017071710064482097634\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203782017071701407917550\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"878C386DF04522AA5FFA8CD69321E2CE\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171184287578\"}');
INSERT INTO `table_refund` VALUES ('2017071710073091461583', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"B3g1EVHnFroCXObb\",\"out_refund_no\":\"143389940220170717100748231\",\"out_trade_no\":\"2017071710073091461583\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603582017071701407918363\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"260500B77542487ADB99A225D9119777\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171189271366\"}');
INSERT INTO `table_refund` VALUES ('2017071710113999274711', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"wvWiZyGZkZEW8S75\",\"out_refund_no\":\"143389940220170717101155961\",\"out_trade_no\":\"2017071710113999274711\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000003602017071701408200677\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"4731EAD3868315AD4EB6ACE548B9181C\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171188139112\"}');
INSERT INTO `table_refund` VALUES ('2017071710122972712006', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"6ikO5qAqaNkLr6Ev\",\"out_refund_no\":\"143389940220170717101243515\",\"out_trade_no\":\"2017071710122972712006\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503732017071701407532090\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"9672EBFC118127F82028CA9F609662A1\",\"total_fee\":\"1\",\"transaction_id\":\"4003162001201707171192540629\"}');
INSERT INTO `table_refund` VALUES ('2017071804205772712078', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"Aw1LA66GF3vN2SKi\",\"out_refund_no\":\"143389940220170718162126569\",\"out_trade_no\":\"2017071804205772712078\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303552017071801415659617\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"CD1FA5471BEA41B49FE85FF63677621F\",\"total_fee\":\"1\",\"transaction_id\":\"4003002001201707181409578307\"}');
INSERT INTO `table_refund` VALUES ('2017071804224389902613', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"dh6wBzsOmZkt4zwc\",\"out_refund_no\":\"143389940220170718162305233\",\"out_trade_no\":\"2017071804224389902613\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203702017071801415663977\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"AD92350A3CD49E0714A0D12792C2C133\",\"total_fee\":\"1\",\"transaction_id\":\"4003002001201707181408108306\"}');
INSERT INTO `table_refund` VALUES ('2017071804284977408356', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"X6cfAYy81d4S97KN\",\"out_refund_no\":\"143389940220170718162912247\",\"out_trade_no\":\"2017071804284977408356\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603582017071801416139883\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"B8CF6BAF134C4FCB3A7DFCEE34874ABA\",\"total_fee\":\"1\",\"transaction_id\":\"4003002001201707181412426918\"}');
INSERT INTO `table_refund` VALUES ('2017072404002750848125', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"uOSzkifWgbPrwXEo\",\"out_refund_no\":\"143389940220170724160629684\",\"out_trade_no\":\"2017072404002750848125\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603822017072401451674744\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"D501C4376CE808BBA2BA121BDB65FA7E\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707242421414814\"}');
INSERT INTO `table_refund` VALUES ('2017072404034418024242', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"2\",\"cash_refund_fee\":\"2\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"hucJZy9Ik7bILrzE\",\"out_refund_no\":\"143389940220170724160646774\",\"out_trade_no\":\"2017072404034418024242\",\"refund_channel\":\"\",\"refund_fee\":\"2\",\"refund_id\":\"50000303552017072401452187060\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"FFCE5B37382D98D56E2B0F4C549579D8\",\"total_fee\":\"2\",\"transaction_id\":\"4002902001201707242424991651\"}');
INSERT INTO `table_refund` VALUES ('2017072404171375843873', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"flN6KmYIu4Or5V9b\",\"out_refund_no\":\"143389940220170724161737769\",\"out_trade_no\":\"2017072404171375843873\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303792017072401451690563\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"56E28339385C555EECDA4E04311C39F2\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707242421961019\"}');
INSERT INTO `table_refund` VALUES ('2017072404181282093816', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"mh0sShpjE71sq70n\",\"out_refund_no\":\"143389940220170724161836463\",\"out_trade_no\":\"2017072404181282093816\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000203782017072401452205630\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"9499AA2B30F5586A8E569DA70AD41F5F\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707242425463770\"}');
INSERT INTO `table_refund` VALUES ('2017072404211253966021', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"oAmYHH8k0S5bHfC9\",\"out_refund_no\":\"143389940220170724162133235\",\"out_trade_no\":\"2017072404211253966021\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103692017072401452413286\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"87993877E1ACE989F872AE7425BC92EB\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707242420197329\"}');
INSERT INTO `table_refund` VALUES ('2017072404263983658580', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"sdsyjqjkTi83NasK\",\"out_refund_no\":\"143389940220170724162701982\",\"out_trade_no\":\"2017072404263983658580\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103612017072401452214799\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"14D700A5EC46E94D6B739D1343B420E1\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707242422134153\"}');
INSERT INTO `table_refund` VALUES ('2017072404300989906521', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"2\",\"cash_refund_fee\":\"2\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"RptFxyMwzBqVhnYx\",\"out_refund_no\":\"143389940220170724163032847\",\"out_trade_no\":\"2017072404300989906521\",\"refund_channel\":\"\",\"refund_fee\":\"2\",\"refund_id\":\"50000503652017072401452220757\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"CA851B5327FD6A9B22790A4A91C7B3D3\",\"total_fee\":\"2\",\"transaction_id\":\"4002902001201707242424123053\"}');
INSERT INTO `table_refund` VALUES ('2017072404312278965589', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"2\",\"cash_refund_fee\":\"2\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"FD6s1Utg6xDZlaaC\",\"out_refund_no\":\"143389940220170724163143598\",\"out_trade_no\":\"2017072404312278965589\",\"refund_channel\":\"\",\"refund_fee\":\"2\",\"refund_id\":\"50000603742017072401452219878\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"DFEB46ECDAB24B366CCC1A3ACDB57648\",\"total_fee\":\"2\",\"transaction_id\":\"4002902001201707242426582390\"}');
INSERT INTO `table_refund` VALUES ('2017072404325786774203', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"2\",\"cash_refund_fee\":\"2\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"CYxQeg8BguMzJV7w\",\"out_refund_no\":\"143389940220170724163322934\",\"out_trade_no\":\"2017072404325786774203\",\"refund_channel\":\"\",\"refund_fee\":\"2\",\"refund_id\":\"50000203542017072401451941432\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"0CE703C913704A59E55DB84B8FF7D4D0\",\"total_fee\":\"2\",\"transaction_id\":\"4002902001201707242425992002\"}');
INSERT INTO `table_refund` VALUES ('2017072404335489909260', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"2\",\"cash_refund_fee\":\"2\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"XRHw3DqpUpDmy6dl\",\"out_refund_no\":\"143389940220170724163418208\",\"out_trade_no\":\"2017072404335489909260\",\"refund_channel\":\"\",\"refund_fee\":\"2\",\"refund_id\":\"50000003762017072401452225556\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"BC40E107723A6D27A017475D69C29596\",\"total_fee\":\"2\",\"transaction_id\":\"4002902001201707242424266232\"}');
INSERT INTO `table_refund` VALUES ('2017072404345036775572', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"2\",\"cash_refund_fee\":\"2\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"ne59JY5k5E4cyUwI\",\"out_refund_no\":\"143389940220170724163509266\",\"out_trade_no\":\"2017072404345036775572\",\"refund_channel\":\"\",\"refund_fee\":\"2\",\"refund_id\":\"50000303632017072401452612421\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"2A38E0CC5039F54D173AFA6DA36C270A\",\"total_fee\":\"2\",\"transaction_id\":\"4002902001201707242424261131\"}');
INSERT INTO `table_refund` VALUES ('2017072404442074272525', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"n6b8KDrOR0jfMOK0\",\"out_refund_no\":\"143389940220170724164440182\",\"out_trade_no\":\"2017072404442074272525\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403802017072401452450038\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"598EB6322E4E9EB472126BDE18965699\",\"total_fee\":\"1\",\"transaction_id\":\"4002482001201707242428919260\"}');
INSERT INTO `table_refund` VALUES ('2017072404481058654312', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"DS8SL2O0ogQm1WDk\",\"out_refund_no\":\"143389940220170724164826847\",\"out_trade_no\":\"2017072404481058654312\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603582017072401452244649\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"271B270F445CA27947DCB63AB0CF8C6A\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707242430708262\"}');
INSERT INTO `table_refund` VALUES ('2017072508383827405924', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"STAnEebRM25eX0tK\",\"out_refund_no\":\"143389940220170725083859708\",\"out_trade_no\":\"2017072508383827405924\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703832017072501455978498\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"4BBA64798E7800D0568779DC3F3F6D83\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707252525197023\"}');
INSERT INTO `table_refund` VALUES ('2017072508424208659877', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"yXVUqT4N4Snkqg05\",\"out_refund_no\":\"143389940220170725084313832\",\"out_trade_no\":\"2017072508424208659877\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103612017072501455235522\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"81C4B6A5B4A043D2C905842976C22053\",\"total_fee\":\"1\",\"transaction_id\":\"4001412001201707252523457161\"}');
INSERT INTO `table_refund` VALUES ('2017072508443655525348', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"ryidpOwNnaNAjEfu\",\"out_refund_no\":\"143389940220170725084501313\",\"out_trade_no\":\"2017072508443655525348\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503732017072501455984543\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"388D77CC40E4F3F5DD178A87F4A55E76\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707252528730997\"}');
INSERT INTO `table_refund` VALUES ('2017072508575172715510', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"2\",\"cash_refund_fee\":\"2\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"pR0KvMdU9h3NOnNG\",\"out_refund_no\":\"143389940220170725085809949\",\"out_trade_no\":\"2017072508575172715510\",\"refund_channel\":\"\",\"refund_fee\":\"2\",\"refund_id\":\"50000503812017072501455998377\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"40FF2714C50CE9C9C4053AC965802090\",\"total_fee\":\"2\",\"transaction_id\":\"4002902001201707252524010589\"}');
INSERT INTO `table_refund` VALUES ('2017072508584066461461', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"2\",\"cash_refund_fee\":\"2\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"hYPFEIXgx9dRrtlw\",\"out_refund_no\":\"143389940220170725085859774\",\"out_trade_no\":\"2017072508584066461461\",\"refund_channel\":\"\",\"refund_fee\":\"2\",\"refund_id\":\"50000203702017072501455560197\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"FC0A81CF1E1F70BBDB4F55287A9108E5\",\"total_fee\":\"2\",\"transaction_id\":\"4002902001201707252529119890\"}');
INSERT INTO `table_refund` VALUES ('2017072508593952406576', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"25bo8ycAxv0kQ4FR\",\"out_refund_no\":\"143389940220170725090002979\",\"out_trade_no\":\"2017072508593952406576\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303712017072501455994658\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"0305608E225F98A4A5CC445430D7D0D3\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201707252529199507\"}');
INSERT INTO `table_refund` VALUES ('2017072509054066464773', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"2\",\"cash_refund_fee\":\"2\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"eVDAUjb63I0kfkvc\",\"out_refund_no\":\"143389940220170725090605465\",\"out_trade_no\":\"2017072509054066464773\",\"refund_channel\":\"\",\"refund_fee\":\"2\",\"refund_id\":\"50000103612017072501455779650\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"E7A8E62B10B702D25C1FB5F5839D9BC5\",\"total_fee\":\"2\",\"transaction_id\":\"4003002001201707252524287785\"}');
INSERT INTO `table_refund` VALUES ('2017072509081402408158', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"2\",\"cash_refund_fee\":\"2\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"3c9aNyvuDtc0BXAg\",\"out_refund_no\":\"143389940220170725091205529\",\"out_trade_no\":\"2017072509081402408158\",\"refund_channel\":\"\",\"refund_fee\":\"2\",\"refund_id\":\"50000303792017072501455784295\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"27313362EB5B496B14E0C7FF8B0B2421\",\"total_fee\":\"2\",\"transaction_id\":\"4002902001201707252526062939\"}');
INSERT INTO `table_refund` VALUES ('2017072509090591466611', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"2\",\"cash_refund_fee\":\"2\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"Hvd89TBduSG8w05p\",\"out_refund_no\":\"143389940220170725091214399\",\"out_trade_no\":\"2017072509090591466611\",\"refund_channel\":\"\",\"refund_fee\":\"2\",\"refund_id\":\"50000103612017072501455783723\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"6783DDF408D1BACC2EC6969FCA229C8D\",\"total_fee\":\"2\",\"transaction_id\":\"4002902001201707252527862217\"}');
INSERT INTO `table_refund` VALUES ('2017072509201960215327', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"2\",\"cash_refund_fee\":\"2\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"sBMIcL5nk7j4gHMV\",\"out_refund_no\":\"143389940220170725092043238\",\"out_trade_no\":\"2017072509201960215327\",\"refund_channel\":\"\",\"refund_fee\":\"2\",\"refund_id\":\"50000503732017072501455277194\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"D820BB910BA5F132442DF7F175A3FFFB\",\"total_fee\":\"2\",\"transaction_id\":\"4002902001201707252529866325\"}');
INSERT INTO `table_refund` VALUES ('2017072509210953966449', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"2\",\"cash_refund_fee\":\"2\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"w56dTnhbNpvUJ9D3\",\"out_refund_no\":\"143389940220170725092126736\",\"out_trade_no\":\"2017072509210953966449\",\"refund_channel\":\"\",\"refund_fee\":\"2\",\"refund_id\":\"50000703752017072501455587603\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"C6B3132048F5250729D5977E154D7118\",\"total_fee\":\"2\",\"transaction_id\":\"4002902001201707252529886327\"}');
INSERT INTO `table_refund` VALUES ('2017072509563027405313', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"2\",\"cash_refund_fee\":\"2\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"k0PrZAVvPGJSSVq1\",\"out_refund_no\":\"143389940220170725095654504\",\"out_trade_no\":\"2017072509563027405313\",\"refund_channel\":\"\",\"refund_fee\":\"2\",\"refund_id\":\"50000503652017072501456059566\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"802E26E11579B13BDB554758DC733E94\",\"total_fee\":\"2\",\"transaction_id\":\"4003002001201707252536995085\"}');
INSERT INTO `table_refund` VALUES ('2017072509570844595141', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"2\",\"cash_refund_fee\":\"2\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"jhi0JTgVP8PmUZIs\",\"out_refund_no\":\"14338994022017072509573222\",\"out_trade_no\":\"2017072509570844595141\",\"refund_channel\":\"\",\"refund_fee\":\"2\",\"refund_id\":\"50000203702017072501456059792\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"1F14C54641634C18B027904F96158957\",\"total_fee\":\"2\",\"transaction_id\":\"4003002001201707252533688946\"}');
INSERT INTO `table_refund` VALUES ('2017072509581230529117', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"2\",\"cash_refund_fee\":\"2\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"WJfrZKTUqMP7Gct7\",\"out_refund_no\":\"143389940220170725095833757\",\"out_trade_no\":\"2017072509581230529117\",\"refund_channel\":\"\",\"refund_fee\":\"2\",\"refund_id\":\"50000103692017072501455828088\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"56E4CDC4A5334049D72589DE3D292DB6\",\"total_fee\":\"2\",\"transaction_id\":\"4003002001201707252533774417\"}');
INSERT INTO `table_refund` VALUES ('2017072705050330525152', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"500\",\"cash_refund_fee\":\"500\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"WncVoAkyRqz7Jt2z\",\"out_refund_no\":\"143389940220170727050535495\",\"out_trade_no\":\"2017072705050330525152\",\"refund_channel\":\"\",\"refund_fee\":\"500\",\"refund_id\":\"50000403642017072701467974280\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"CAED0610C77A6D70129FF33E4D3C0C27\",\"total_fee\":\"500\",\"transaction_id\":\"4000362001201707272851793484\"}');
INSERT INTO `table_refund` VALUES ('2017072712195068024425', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"7vKNwyLwMsVKru3d\",\"out_refund_no\":\"143389940220170727122012344\",\"out_trade_no\":\"2017072712195068024425\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000303552017072701469006200\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"92E9932709B4FC09BCB0D624DF58E3A4\",\"total_fee\":\"350\",\"transaction_id\":\"4001122001201707272899907843\"}');
INSERT INTO `table_refund` VALUES (null, '2017072821001004320277605835', null, '{\"batch_no\":\"2017072812045767584686\",\"notify_id\":\"950e406f51547d2596e0a9794048161l3e\",\"notify_time\":\"2017-07-28 12:05:04\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017072821001004320277605835^3.50^SUCCESS\",\"sign\":\"697bfed9b7879852bc1e841a9b170946\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017072821001004230234684611', null, '{\"batch_no\":\"2017072812171877407970\",\"notify_id\":\"f016e21fd08df4cd888763e4b7cc950hgu\",\"notify_time\":\"2017-07-28 12:17:20\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017072821001004230234684611^2.00^SUCCESS\",\"sign\":\"7eb269710d5e466419c02793c22910e1\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES ('2017072805384885217431', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"BpTFwsiVR6WrXkQj\",\"out_refund_no\":\"1433899402201707281739063\",\"out_trade_no\":\"2017072805384885217431\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000703752017072801476907557\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"0ADD54C21E3F911D04FB4EE52D097739\",\"total_fee\":\"350\",\"transaction_id\":\"4005922001201707283152807703\"}');
INSERT INTO `table_refund` VALUES (null, '2017072821001004790291635680', null, '{\"batch_no\":\"2017072808492180526863\",\"notify_id\":\"a5d8ef28c6e60b7bec990f0e2033101lse\",\"notify_time\":\"2017-07-28 20:49:23\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017072821001004790291635680^2.00^SUCCESS\",\"sign\":\"b340aa6ba17adf390f1d39864b1119f6\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES ('2017072910442260211339', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"6ReqjUOEPaRyIOy8\",\"out_refund_no\":\"143389940220170729104445899\",\"out_trade_no\":\"2017072910442260211339\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000603582017072901479920989\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"254BC5D957685BB883DD6F80850198B2\",\"total_fee\":\"350\",\"transaction_id\":\"4004672001201707293258275814\"}');
INSERT INTO `table_refund` VALUES ('2017073010573600849458', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"yQqTa4Aj03yfG38k\",\"out_refund_no\":\"14338994022017073022575419\",\"out_trade_no\":\"2017073010573600849458\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000503652017073001487585998\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"E6899203BFF970B53B15B69FC8528DBE\",\"total_fee\":\"350\",\"transaction_id\":\"4006032001201707303553805997\"}');
INSERT INTO `table_refund` VALUES ('2017073011432058659242', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"xXfhirE7wMQjjOT6\",\"out_refund_no\":\"143389940220170730234335476\",\"out_trade_no\":\"2017073011432058659242\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000103692017073001488312392\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"1A4D8A284098DB88B047823E08A7AC57\",\"total_fee\":\"350\",\"transaction_id\":\"4008962001201707303559510801\"}');
INSERT INTO `table_refund` VALUES ('2017073103043691464337', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"200\",\"cash_refund_fee\":\"200\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"vZXPnyNOzNhUzeKV\",\"out_refund_no\":\"143389940220170731150452655\",\"out_trade_no\":\"2017073103043691464337\",\"refund_channel\":\"\",\"refund_fee\":\"200\",\"refund_id\":\"50000403562017073101490466060\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"306F170D6C7B67A716A4D4DD5586E398\",\"total_fee\":\"200\",\"transaction_id\":\"4001412001201707313656348004\"}');
INSERT INTO `table_refund` VALUES ('2017073103072969592824', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"200\",\"cash_refund_fee\":\"200\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"GxT70ZSNPcDz1RYR\",\"out_refund_no\":\"143389940220170731150747226\",\"out_trade_no\":\"2017073103072969592824\",\"refund_channel\":\"\",\"refund_fee\":\"200\",\"refund_id\":\"50000203702017073101490068378\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"766882095FFC59ADADD42F39C21C4702\",\"total_fee\":\"200\",\"transaction_id\":\"4001412001201707313656404530\"}');
INSERT INTO `table_refund` VALUES ('2017073103082360214093', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"dY8Zt2cZG1ecHbuB\",\"out_refund_no\":\"14338994022017073115084022\",\"out_trade_no\":\"2017073103082360214093\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000603582017073101490756940\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"C6EC687DD4BA285961F1D26C2350CE17\",\"total_fee\":\"350\",\"transaction_id\":\"4001412001201707313656432166\"}');
INSERT INTO `table_refund` VALUES ('2017073103114691465371', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"200\",\"cash_refund_fee\":\"200\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"zYS2pMk1isjL7Tf6\",\"out_refund_no\":\"143389940220170731151208950\",\"out_trade_no\":\"2017073103114691465371\",\"refund_channel\":\"\",\"refund_fee\":\"200\",\"refund_id\":\"50000303792017073101490762133\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"42F5755B234EB396818AAEADECBD765D\",\"total_fee\":\"200\",\"transaction_id\":\"4001412001201707313651846907\"}');
INSERT INTO `table_refund` VALUES ('2017073103174008651136', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"YZEG6CxhSAtZKHWS\",\"out_refund_no\":\"14338994022017073115175714\",\"out_trade_no\":\"2017073103174008651136\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000003522017073101490357144\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"099C5C320E581EB4A9ABC0B38A19A6B0\",\"total_fee\":\"350\",\"transaction_id\":\"4001412001201707313655326528\"}');
INSERT INTO `table_refund` VALUES (null, '2017080121001004870273080810', null, '{\"batch_no\":\"2017080106511971158413\",\"notify_id\":\"a46eaf7c5a70c02a025221c6caca700mpq\",\"notify_time\":\"2017-08-01 06:51:20\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017080121001004870273080810^2.00^SUCCESS\",\"sign\":\"6c0fe40a5213f59cae2af94e62a4f2e4\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017080121001004730294690401', null, '{\"batch_no\":\"2017080108585824273380\",\"notify_id\":\"571499699da6a5e5c2fcf8bb51ad48bmva\",\"notify_time\":\"2017-08-01 20:58:59\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017080121001004730294690401^3.50^SUCCESS\",\"sign\":\"39cd204ae94535c627bcac74bb4d2929\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES ('2017080211084753967830', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"lkKMvXaLxDl7heuX\",\"out_refund_no\":\"143389940220170802110900288\",\"out_trade_no\":\"2017080211084753967830\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000703832017080201498771746\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"2F00DDFB902DF080C19600C3ABA26B67\",\"total_fee\":\"350\",\"transaction_id\":\"4006652001201708024002840799\"}');
INSERT INTO `table_refund` VALUES ('2017080210222050843288', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"200\",\"cash_refund_fee\":\"200\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"xF9rKPMQGsQvVtet\",\"out_refund_no\":\"14338994022017080222223569\",\"out_trade_no\":\"2017080210222050843288\",\"refund_channel\":\"\",\"refund_fee\":\"200\",\"refund_id\":\"50000303632017080201501737445\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"23A1DBC82DD8B23A234ED3FC163B1D6F\",\"total_fee\":\"200\",\"transaction_id\":\"4003772001201708024127314027\"}');
INSERT INTO `table_refund` VALUES ('2017080312065003965107', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"HPq34SZaeXy7rgdV\",\"out_refund_no\":\"143389940220170803120702250\",\"out_trade_no\":\"2017080312065003965107\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000403802017080301503744526\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"01339268D8AAB4696465AA5AFAD25474\",\"total_fee\":\"350\",\"transaction_id\":\"4006652001201708034212682428\"}');
INSERT INTO `table_refund` VALUES ('2017080304095900843387', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"10txZ1QDatxf58Ml\",\"out_refund_no\":\"143389940220170803161015226\",\"out_trade_no\":\"2017080304095900843387\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000503732017080301505412700\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"5C4352CCA4A2AC63E68846C885C486CF\",\"total_fee\":\"350\",\"transaction_id\":\"4006652001201708034249951477\"}');
INSERT INTO `table_refund` VALUES ('2017080304114230523678', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"rAn7U7Pm22gNBkEr\",\"out_refund_no\":\"143389940220170803161206591\",\"out_trade_no\":\"2017080304114230523678\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000503812017080301504769294\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"E596742EF99419332A55B0CF2D7E5B6C\",\"total_fee\":\"350\",\"transaction_id\":\"4006652001201708034254447229\"}');
INSERT INTO `table_refund` VALUES (null, '2017080321001004090256608841', null, '{\"batch_no\":\"2017080408435772717784\",\"notify_id\":\"b607d8c50e21cefb1b6998dbada86dfhxi\",\"notify_time\":\"2017-08-04 08:43:58\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017080321001004090256608841^2.00^SUCCESS\",\"sign\":\"fece06f5f957bd193de3fd8fa5308e07\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017080521001004140274057531', null, '{\"batch_no\":\"2017080504324960219750\",\"notify_id\":\"1fb86e0b848269c3c7271cd809a8be4iuu\",\"notify_time\":\"2017-08-05 16:32:50\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017080521001004140274057531^2.00^SUCCESS\",\"sign\":\"446b7dd3c3d4cb8ef33829b622c6e11f\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES ('2017080601383563344947', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"22cZIujx7q4LI3ef\",\"out_refund_no\":\"143389940220170806013850215\",\"out_trade_no\":\"2017080601383563344947\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000203702017080601517180198\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"9BEB74D1421EBDA02A60EE47D0104272\",\"total_fee\":\"350\",\"transaction_id\":\"4008962001201708064711893138\"}');
INSERT INTO `table_refund` VALUES ('2017080608453357096014', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"200\",\"cash_refund_fee\":\"200\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"qppkOBcEZLiITDmi\",\"out_refund_no\":\"143389940220170806204553816\",\"out_trade_no\":\"2017080608453357096014\",\"refund_channel\":\"\",\"refund_fee\":\"200\",\"refund_id\":\"50000303712017080601521325164\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"D958152839DC1392FE8F7EA4C245B83F\",\"total_fee\":\"200\",\"transaction_id\":\"4005082001201708064855526515\"}');
INSERT INTO `table_refund` VALUES ('2017080608464016462492', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"200\",\"cash_refund_fee\":\"200\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"6bB78Wr8iwleol1o\",\"out_refund_no\":\"143389940220170806204654660\",\"out_trade_no\":\"2017080608464016462492\",\"refund_channel\":\"\",\"refund_fee\":\"200\",\"refund_id\":\"50000203702017080601520602313\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"EA0B1024F952966507CF25C12A0C0E04\",\"total_fee\":\"200\",\"transaction_id\":\"4005082001201708064854093074\"}');
INSERT INTO `table_refund` VALUES ('2017080609074196159945', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"i3WPrFHJLmyHN5eS\",\"out_refund_no\":\"143389940220170806210758777\",\"out_trade_no\":\"2017080609074196159945\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000303792017080601520821334\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"0A46023537DEC718DE00822853F59778\",\"total_fee\":\"350\",\"transaction_id\":\"4002062001201708064861021531\"}');
INSERT INTO `table_refund` VALUES ('2017080710502838345232', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"1yvmpCkvpa0idfgA\",\"out_refund_no\":\"143389940220170807105047528\",\"out_trade_no\":\"2017080710502838345232\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000303712017080701522684248\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"0C7DF74A77500D6A04CEF1508B718F49\",\"total_fee\":\"350\",\"transaction_id\":\"4005072001201708074931159475\"}');
INSERT INTO `table_refund` VALUES ('2017080710514113341258', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"lZqJcYorwxzYSOR8\",\"out_refund_no\":\"143389940220170807105152367\",\"out_trade_no\":\"2017080710514113341258\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000703752017080701522451212\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"95E5EDDBA2B86595A666A1C768A71BB1\",\"total_fee\":\"350\",\"transaction_id\":\"4005072001201708074932552727\"}');
INSERT INTO `table_refund` VALUES ('2017080712055797719114', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"pGDWzX3ezfpZz2zc\",\"out_refund_no\":\"143389940220170807120614152\",\"out_trade_no\":\"2017080712055797719114\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000003682017080701523152807\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"2A4FE0564354D14F725A066DBC4E6A66\",\"total_fee\":\"350\",\"transaction_id\":\"4008962001201708074946624464\"}');
INSERT INTO `table_refund` VALUES ('2017080712065972712247', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"a3ByFXQ0rtNwIaNS\",\"out_refund_no\":\"143389940220170807120714705\",\"out_trade_no\":\"2017080712065972712247\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000503652017080701522949714\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"AA7DF72029DFFA2208646F5574903C3F\",\"total_fee\":\"350\",\"transaction_id\":\"4008962001201708074942067565\"}');
INSERT INTO `table_refund` VALUES ('2017080802320093023533', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"rzHTygGTbiWoTx27\",\"out_refund_no\":\"143389940220170808143223944\",\"out_trade_no\":\"2017080802320093023533\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403562017080801528708963\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"81EA525EF0E3F1381B51743725BA9827\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201708085141372548\"}');
INSERT INTO `table_refund` VALUES ('2017080803200825841395', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"4Gz8RjMiConxchms\",\"out_refund_no\":\"143389940220170808152020368\",\"out_trade_no\":\"2017080803200825841395\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603822017080801528932251\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"E145BC3A9EF2B8EC84617E049A0A3ED0\",\"total_fee\":\"1\",\"transaction_id\":\"4002902001201708085150843742\"}');
INSERT INTO `table_refund` VALUES (null, '2017080821001004140279882124', null, '{\"batch_no\":\"2017080804332497717650\",\"notify_id\":\"8c1da48bd497338d852e1022951ad1bipa\",\"notify_time\":\"2017-08-08 16:33:26\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017080821001004140279882124^3.50^SUCCESS\",\"sign\":\"bcda923822f7306174c2ea64ed5ee7e7\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES (null, '2017080821001004140279949374', null, '{\"batch_no\":\"2017080804343969596777\",\"notify_id\":\"c4db630c056f20fbd92bc3bd5703512g5m\",\"notify_time\":\"2017-08-08 16:34:41\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017080821001004140279949374^3.50^SUCCESS\",\"sign\":\"828f48fcf3d5ab1fd9ae6da840248089\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES ('2017080909252016466148', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"pTiow4FAgvK8hcjw\",\"out_refund_no\":\"143389940220170809092539135\",\"out_trade_no\":\"2017080909252016466148\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000103692017080901531947102\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"06FD79160B170E1726E00DC43501D4EA\",\"total_fee\":\"1\",\"transaction_id\":\"4007522001201708095267483889\"}');
INSERT INTO `table_refund` VALUES ('2017080909280597712672', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"u678dxltLOD6ys2F\",\"out_refund_no\":\"14338994022017080909283133\",\"out_trade_no\":\"2017080909280597712672\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503732017080901531704747\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"C79F0CFE878394E10797538E37C30300\",\"total_fee\":\"1\",\"transaction_id\":\"4007522001201708095270804757\"}');
INSERT INTO `table_refund` VALUES ('2017080909291838345126', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"dcet4xr86gYTbfix\",\"out_refund_no\":\"143389940220170809092945901\",\"out_trade_no\":\"2017080909291838345126\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000303552017080901531702863\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"7788FC2392B83A72A6039A5483D82308\",\"total_fee\":\"1\",\"transaction_id\":\"4007522001201708095268909059\"}');
INSERT INTO `table_refund` VALUES ('2017080909334803968339', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"QVaJy0cEuxpuTLTN\",\"out_refund_no\":\"143389940220170809093412593\",\"out_trade_no\":\"2017080909334803968339\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603662017080901531708812\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"9ED515C12DB8564587F68A83AC0BBDCA\",\"total_fee\":\"1\",\"transaction_id\":\"4007522001201708095267719470\"}');
INSERT INTO `table_refund` VALUES ('2017080909355103965517', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"qdq4T314NkjT16hH\",\"out_refund_no\":\"143389940220170809093613753\",\"out_trade_no\":\"2017080909355103965517\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703832017080901532185754\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"B009D2E929C3FE7049EE7063F36F2EB6\",\"total_fee\":\"1\",\"transaction_id\":\"4007522001201708095271086335\"}');
INSERT INTO `table_refund` VALUES ('2017080909364630527002', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"fssjY2T6EtiKc4Cn\",\"out_refund_no\":\"143389940220170809093710351\",\"out_trade_no\":\"2017080909364630527002\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603822017080901531435393\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"6B1C027CB3E3548C753E597A0032EE6A\",\"total_fee\":\"1\",\"transaction_id\":\"4007522001201708095267811998\"}');
INSERT INTO `table_refund` VALUES ('2017080909523663343366', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"M9DXjxsUVihwmJnw\",\"out_refund_no\":\"143389940220170809095251113\",\"out_trade_no\":\"2017080909523663343366\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703752017080901532200048\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"05565AC1112C808343F23A3AFD87B506\",\"total_fee\":\"1\",\"transaction_id\":\"4007522001201708095274398487\"}');
INSERT INTO `table_refund` VALUES ('2017080910101693023426', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"WRck5PSxE9uZrrSh\",\"out_refund_no\":\"143389940220170809101037351\",\"out_trade_no\":\"2017080910101693023426\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503732017080901531995158\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"66A91E85B86C0915FF65542B7F8D430D\",\"total_fee\":\"1\",\"transaction_id\":\"4007522001201708095275031253\"}');
INSERT INTO `table_refund` VALUES ('2017080910222119594392', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"S37lCUbni6tA9yar\",\"out_refund_no\":\"143389940220170809102247106\",\"out_trade_no\":\"2017080910222119594392\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703592017080901531757074\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"52B2459720736280ED219A177F6F66D8\",\"total_fee\":\"1\",\"transaction_id\":\"4007522001201708095278583719\"}');
INSERT INTO `table_refund` VALUES ('2017080910233660214363', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"J5AHKUOG6ByDPy5H\",\"out_refund_no\":\"143389940220170809102405593\",\"out_trade_no\":\"2017080910233660214363\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000403642017080901532235974\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"86330E9BD3D703B9384AA1A431E3265E\",\"total_fee\":\"1\",\"transaction_id\":\"4007522001201708095278681612\"}');
INSERT INTO `table_refund` VALUES ('2017080910250936771603', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"WSA6gq10ouBQXWfD\",\"out_refund_no\":\"143389940220170809102531566\",\"out_trade_no\":\"2017080910250936771603\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000503652017080901531487545\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"C64BC61E5B40348140995B54841B94B5\",\"total_fee\":\"1\",\"transaction_id\":\"4007522001201708095275481133\"}');
INSERT INTO `table_refund` VALUES ('2017080910454533651867', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"300\",\"cash_refund_fee\":\"300\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"W9bsBlYhu7j0G1LW\",\"out_refund_no\":\"14338994022017080910460725\",\"out_trade_no\":\"2017080910454533651867\",\"refund_channel\":\"\",\"refund_fee\":\"300\",\"refund_id\":\"50000203542017080901532407788\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"438BE95E99BC66DAE665AAA76040BE5D\",\"total_fee\":\"300\",\"transaction_id\":\"4000572001201708095277492706\"}');
INSERT INTO `table_refund` VALUES ('2017080901163833657542', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"hwnyCi3qBgy5SJ1k\",\"out_refund_no\":\"143389940220170809131700905\",\"out_trade_no\":\"2017080901163833657542\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703752017080901533343428\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"5B0309B56DEB0F70DEDD11940F3718D6\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201708095303991991\"}');
INSERT INTO `table_refund` VALUES ('2017080901183263341727', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"suQWgxCTmlMbZQHw\",\"out_refund_no\":\"143389940220170809131905348\",\"out_trade_no\":\"2017080901183263341727\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000603662017080901533111993\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"9FE5FCEF7CAB0BA82F4E4CFDFA0FBC46\",\"total_fee\":\"1\",\"transaction_id\":\"4009372001201708095302220366\"}');
INSERT INTO `table_refund` VALUES ('2017080901313389909507', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"1\",\"cash_refund_fee\":\"1\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"LtpcaBk74Jmjzpxp\",\"out_refund_no\":\"143389940220170809133147756\",\"out_trade_no\":\"2017080901313389909507\",\"refund_channel\":\"\",\"refund_fee\":\"1\",\"refund_id\":\"50000703832017080901533129355\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"79C85208E79B556362872CDF4BC3D7CC\",\"total_fee\":\"1\",\"transaction_id\":\"4007522001201708095307488543\"}');
INSERT INTO `table_refund` VALUES (null, '2017080921001004220291818534', null, '{\"batch_no\":\"2017080909243913342391\",\"notify_id\":\"0786303f5e20c7716496cc161ae3e35gdy\",\"notify_time\":\"2017-08-09 21:24:40\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017080921001004220291818534^3.00^SUCCESS\",\"sign\":\"c577d74745948300968b2880d3c7839d\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES ('2017080911024710211898', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"oALFjHfUmEWv5ZYz\",\"out_refund_no\":\"143389940220170809230310317\",\"out_trade_no\":\"2017080911024710211898\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000703752017080901536037448\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"81230326D531538038EC8239E77828A8\",\"total_fee\":\"350\",\"transaction_id\":\"4005082001201708095396977399\"}');
INSERT INTO `table_refund` VALUES ('2017081112132021158180', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"SoYLGlACtFLB1zGW\",\"out_refund_no\":\"143389940220170811094814943\",\"out_trade_no\":\"2017081112132021158180\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000103612017081101541058132\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"0D44BAF448906134842856C08969DDEB\",\"total_fee\":\"350\",\"transaction_id\":\"4008962001201708115575581097\"}');
INSERT INTO `table_refund` VALUES ('2017081009542250847196', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"rbNBpta339XvJIiF\",\"out_refund_no\":\"143389940220170811095605423\",\"out_trade_no\":\"2017081009542250847196\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000403562017081101541831486\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"41C7E90775D136133A761E4AF6DB20CD\",\"total_fee\":\"350\",\"transaction_id\":\"4001312001201708105557314372\"}');
INSERT INTO `table_refund` VALUES ('2017081009004657098117', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"IOMfHGA1k9TtDTdO\",\"out_refund_no\":\"143389940220170811095614805\",\"out_trade_no\":\"2017081009004657098117\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000603662017081101541338863\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"FFE10E227EC1CEC6491DAF616432326A\",\"total_fee\":\"350\",\"transaction_id\":\"4009442001201708105549182286\"}');
INSERT INTO `table_refund` VALUES ('2017081111565435217056', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"eV5HUQM0nefrfhq1\",\"out_refund_no\":\"14338994022017081111570755\",\"out_trade_no\":\"2017081111565435217056\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000703592017081101541970339\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"A1AE84A0FBFE6DA36CAA4BF5C09A5256\",\"total_fee\":\"350\",\"transaction_id\":\"4003202001201708115630123719\"}');
INSERT INTO `table_refund` VALUES ('2017081111582621152259', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"mZMpbGHw3Tyg9Lim\",\"out_refund_no\":\"143389940220170811115838727\",\"out_trade_no\":\"2017081111582621152259\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000603582017081101541972333\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"C8FA4BCEDCF22807D89002AED2B00313\",\"total_fee\":\"350\",\"transaction_id\":\"4003202001201708115635071046\"}');
INSERT INTO `table_refund` VALUES ('2017081112041208659958', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"jYD7RstmZINb65v5\",\"out_refund_no\":\"143389940220170811120427340\",\"out_trade_no\":\"2017081112041208659958\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000703752017081101542386503\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"CEF8A6D107AFC815169BFDFDD0B8372C\",\"total_fee\":\"350\",\"transaction_id\":\"4006652001201708115633968023\"}');
INSERT INTO `table_refund` VALUES ('2017081105415963346443', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"gAxOfUh0uAjJKF7U\",\"out_refund_no\":\"143389940220170811174211958\",\"out_trade_no\":\"2017081105415963346443\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000603822017081101543451868\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"674ACD1F585638A8651C5C7A048DC9B3\",\"total_fee\":\"350\",\"transaction_id\":\"4003362001201708115688845918\"}');
INSERT INTO `table_refund` VALUES (null, '2017081221001004540204627625', null, '{\"batch_no\":\"2017081212051168026000\",\"notify_id\":\"b9732bb62170d5da6593534079f613bipa\",\"notify_time\":\"2017-08-12 12:05:13\",\"notify_type\":\"batch_refund_notify\",\"result_details\":\"2017081221001004540204627625^3.50^SUCCESS\",\"sign\":\"efa29b48ca38d5de09e81696df8f014a\",\"sign_type\":\"MD5\",\"success_num\":\"1\"}');
INSERT INTO `table_refund` VALUES ('2017081312172003964630', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"beV3y4AZnNvelix2\",\"out_refund_no\":\"143389940220170813121733569\",\"out_trade_no\":\"2017081312172003964630\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000704152017081301552576258\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"46BE737A1AE62C78CA30654B3CBADC1D\",\"total_fee\":\"350\",\"transaction_id\":\"4003132001201708135983865215\"}');
INSERT INTO `table_refund` VALUES ('2017081312403505525977', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"W2a1EDWrzIjRzRNw\",\"out_refund_no\":\"143389940220170813124050343\",\"out_trade_no\":\"2017081312403505525977\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000303872017081301552119563\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"21AE32628489068D3DDFA7C8E7251EC7\",\"total_fee\":\"350\",\"transaction_id\":\"4005072001201708135989293315\"}');
INSERT INTO `table_refund` VALUES ('2017082012010063344737', null, null, '{\"appid\":\"wx926450e6541e90b7\",\"cash_fee\":\"350\",\"cash_refund_fee\":\"350\",\"coupon_refund_count\":\"0\",\"coupon_refund_fee\":\"0\",\"mch_id\":\"1433899402\",\"nonce_str\":\"mEoskS6Jw4Wkf7yN\",\"out_refund_no\":\"143389940220170820120115240\",\"out_trade_no\":\"2017082012010063344737\",\"refund_channel\":\"\",\"refund_fee\":\"350\",\"refund_id\":\"50000503892017082001591165138\",\"result_code\":\"SUCCESS\",\"return_code\":\"SUCCESS\",\"return_msg\":\"OK\",\"sign\":\"C1F40F69B3551C3C04660FCBB79897D5\",\"total_fee\":\"350\",\"transaction_id\":\"4001402001201708207231677637\"}');

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
  `pay_interface` varchar(50) DEFAULT NULL COMMENT '支付类型',
  `acquiring_merchant` varchar(20) DEFAULT NULL,
  `trade_no` varchar(50) DEFAULT NULL,
  `payer` varchar(50) DEFAULT NULL,
  `goods_id` varchar(50) DEFAULT NULL COMMENT '货道号',
  `com_id` varchar(50) DEFAULT NULL COMMENT '退款号',
  `trade_amount` decimal(10,2) DEFAULT NULL,
  `trade_status` varchar(2) DEFAULT NULL,
  `random_id` varchar(50) DEFAULT NULL,
  `reality_sale_number` int(2) DEFAULT NULL COMMENT '实际售出数量',
  `service_charge` decimal(5,2) DEFAULT NULL COMMENT '手续费'
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
INSERT INTO `table_total_money` VALUES ('1a44553d-f1de-4516-8095-d1ba8c4331f8', null, '6.78');

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
INSERT INTO `table_user` VALUES ('ac7204eb-3907-47bf-a824-01d7ba4d4102', 'wazheqing@qq.com', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '', 'ee14136407d64d46', 'b0c03d54-6834-4472-baf3-f9728512a9e1', '2017-08-20 21:01:22', null, null, '', '1');

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
