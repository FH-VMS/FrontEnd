/*
Navicat MySQL Data Transfer

Source Server         : 正式
Source Server Version : 50717
Source Host           : 106.14.190.9:3306
Source Database       : db_fh

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-09-08 16:42:40
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
  `client_id` int(50) NOT NULL AUTO_INCREMENT,
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
  `remark` varchar(250) DEFAULT NULL,
  `mobile_arr` varchar(50) DEFAULT NULL COMMENT '对应可以看到的移动支付权限',
  PRIMARY KEY (`client_id`),
  KEY `index_client_group` (`client_id`,`client_father_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_client
-- ----------------------------
INSERT INTO `table_client` VALUES ('1', '测试', '可用', 'self', '运营商', '李', '1231232', '3@qq.com', '中国', '人民币', '顶替', null, '2016-12-21 15:57:39', null, null, null, null);
INSERT INTO `table_client` VALUES ('2', '小李', '可用', 'self', '运营商', '小李', '23423423', '3@wee.com', '中国', '人民币', '杭州', null, '2016-12-22 10:32:31', null, null, null, null);
INSERT INTO `table_client` VALUES ('3', 'admin1-1', '可用', '1', '运营商', 'admin1-1', '2342', '', null, null, null, 'admin1', '2016-12-26 18:37:42', null, null, null, null);
INSERT INTO `table_client` VALUES ('4', 'admin1-2', '可用', '1', '运营商', 'admin1-2', '12321', null, null, null, null, 'admin1', '2016-12-26 18:37:59', null, null, null, null);
INSERT INTO `table_client` VALUES ('5', 'admin2-1', '可用', '1', '运营商', 'admin2-1', '12312', null, null, null, null, 'admin2', '2016-12-26 18:44:37', null, null, null, null);
INSERT INTO `table_client` VALUES ('6', '杭州中新2', '可用', 'self', '运营商', '杭州中新', '123', null, null, null, null, null, '0001-01-01 00:00:00', 'root', '2017-05-23 11:32:44', null, null);
INSERT INTO `table_client` VALUES ('7', '娃哈哈集团', '可用', 'self', '运营商', '杨', '15658110870', null, null, null, null, null, '0001-01-01 00:00:00', 'root', '2017-08-26 10:58:57', null, null);
INSERT INTO `table_client` VALUES ('8', '浙江佳合利', '可用', 'self', '运营商', '王', '15155668899', null, null, '人民币', '杭州', null, '0001-01-01 00:00:00', 'root', '2017-08-08 15:13:59', null, null);
INSERT INTO `table_client` VALUES ('9', '清个个', '可用', '8', '点位提供商', '王O清', '13858108287', null, null, null, null, null, '0001-01-01 00:00:00', 'jhl0612@qq.com', '2017-08-22 15:25:28', null, null);
INSERT INTO `table_client` VALUES ('10', '清一夏', '可用', '8', '运营商', '王一清', '13858108287', null, null, null, null, null, '0001-01-01 00:00:00', 'jhl0612@qq.com', '2017-09-06 09:19:32', null, null);
INSERT INTO `table_client` VALUES ('11', '清二夏', '可用', '8', '运营商', '王二清', '13858108287', null, null, null, null, null, '0001-01-01 00:00:00', 'jhl0612@qq.com', '2017-08-22 15:26:13', null, null);
INSERT INTO `table_client` VALUES ('12', '农夫集团', '可用', 'self', '运营商', '张总', '18367889900', null, null, null, null, 'root', '2017-08-26 10:58:32', null, null, null, null);
INSERT INTO `table_client` VALUES ('13', '康师博集团', '可用', 'self', '运营商', '肖', '15245678855', null, null, null, null, 'root', '2017-08-26 11:00:10', null, null, null, null);
INSERT INTO `table_client` VALUES ('14', '春晖钣金', '可用', 'self', '运营商', '刘', '13858175566', null, null, null, null, 'root', '2017-08-26 11:01:34', null, null, null, null);
INSERT INTO `table_client` VALUES ('15', '上海斐艺', '可用', 'self', '运营商', '张先生', '15158175618', '26984728@qq.com', 'china', '人民币', '上海市浦东新区', 'root', '2017-09-05 16:05:36', null, null, null, null);
INSERT INTO `table_client` VALUES ('16', '上海友爱运营商', '可用', '15', '运营商', '张生', '15158175618', null, null, null, null, null, '0001-01-01 00:00:00', '26984728@qq.com', '2017-09-05 23:22:17', null, null);
INSERT INTO `table_client` VALUES ('17', '清三夏', '可用', '8', '运营商', '王三清', '13858108287', null, null, null, null, 'jhl0612@qq.com', '2017-09-06 09:19:17', null, null, null, null);
INSERT INTO `table_client` VALUES ('18', '测试ID', '可用', 'self', '运营商', '测试ID', '2343', null, null, null, null, 'root', '2017-09-07 15:51:54', null, null, null, null);
INSERT INTO `table_client` VALUES ('19', '测试ID的子客户', '可用', '18', '运营商', '1', '1', null, null, null, null, 'admin', '2017-09-07 16:04:27', null, null, null, null);

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
INSERT INTO `table_corr_dms` VALUES ('42b026cc-ed91-4c63-ae64-ccd47878c13a', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '2', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('75191b3b-fa15-4364-bbba-c3ddf0dfaef4', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '3', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('baa31943-0e01-4d46-aa6e-1be2279e5c79', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '5', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('f26bf350-090d-4a26-b396-678884b2bdcd', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '8', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('67bbe45e-8cdb-47f0-ba90-e15f933a09c9', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '9', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('6934ea3c-9696-4667-85f2-6a040b20d2e7', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '10', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('1af752d2-0efa-4da0-8d0e-b96a9b650788', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '12', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('88333fcb-b8a7-44b4-830e-a2efcb57e521', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '13', '0', '0', '0', '1', null);
INSERT INTO `table_corr_dms` VALUES ('d4030189-f950-4d4c-97d3-9871f2f1931f', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '23', '0', '0', '0', '1', null);
INSERT INTO `table_corr_dms` VALUES ('deb9e702-ce02-4b16-864c-8479cdfc9d84', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '26', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('72be3c62-3226-4e6a-8cea-391ea9e54393', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '29', '0', '0', '0', '1', null);
INSERT INTO `table_corr_dms` VALUES ('7350b96b-86e2-4672-8a7a-ba4c894d4c24', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '37', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('9b55afab-ab3c-4d26-b406-4ff23614f1d9', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '38', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('985cb159-21d1-4ac2-b789-6ef97a2476b9', '04976ff6-854a-4101-a669-115a0d64ebe2', '2', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('1f94bce4-3183-4cc4-97ca-27b208d8c504', '04976ff6-854a-4101-a669-115a0d64ebe2', '3', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('b3524732-761e-41de-a6eb-68e651fddd26', '04976ff6-854a-4101-a669-115a0d64ebe2', '5', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('f1bab530-7485-413b-ae15-c2ffd2a2f37e', '04976ff6-854a-4101-a669-115a0d64ebe2', '9', '0', '0', '0', '1', null);
INSERT INTO `table_corr_dms` VALUES ('f73e2a79-680b-42be-aa0c-1ddcbdfe7692', '04976ff6-854a-4101-a669-115a0d64ebe2', '10', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('4e46f46d-4084-4c7c-922e-2d48fb671d93', '04976ff6-854a-4101-a669-115a0d64ebe2', '12', '0', '0', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('3f168200-ede5-4bf1-ad97-6a6bdc2edb61', '04976ff6-854a-4101-a669-115a0d64ebe2', '13', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('56b3a692-535e-4c4d-aacf-c067527f053e', '04976ff6-854a-4101-a669-115a0d64ebe2', '23', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('b088260b-d12f-418c-8b2c-f4cb1fb6559a', '04976ff6-854a-4101-a669-115a0d64ebe2', '26', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('f4d0e47c-7c8b-4654-9f55-82fef90efea0', '04976ff6-854a-4101-a669-115a0d64ebe2', '29', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('4b06af31-76f1-48ba-befa-e6db67d74c6b', '04976ff6-854a-4101-a669-115a0d64ebe2', '38', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('9115e74c-083a-42fb-8038-1d350b1466b7', 'a933b45b-1fb4-4cce-91c2-d35fe8f56a93', '9', '0', '0', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('650070b0-046d-4690-88b7-2b9de882c4b3', 'a933b45b-1fb4-4cce-91c2-d35fe8f56a93', '10', '0', '0', '0', '1', null);
INSERT INTO `table_corr_dms` VALUES ('6d65505e-f818-47a4-9c21-1f162402a24d', 'a933b45b-1fb4-4cce-91c2-d35fe8f56a93', '12', '0', '0', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('94642b30-34fa-4dee-ba73-132b57aa51cd', 'a933b45b-1fb4-4cce-91c2-d35fe8f56a93', '13', '0', '0', '0', '1', null);
INSERT INTO `table_corr_dms` VALUES ('fe5ac3d1-8eec-4ba3-ae09-e8b6f2d909f4', 'a933b45b-1fb4-4cce-91c2-d35fe8f56a93', '23', '0', '0', '0', '1', null);
INSERT INTO `table_corr_dms` VALUES ('52947bb3-01bf-45a8-a0a8-de707fc4fceb', 'a933b45b-1fb4-4cce-91c2-d35fe8f56a93', '26', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('812b1b05-8178-4c78-bcef-b47be0b75f48', 'a933b45b-1fb4-4cce-91c2-d35fe8f56a93', '29', '0', '0', '0', '1', null);
INSERT INTO `table_corr_dms` VALUES ('c26782b8-9a0c-419b-aa59-7c5e64c214d5', 'a933b45b-1fb4-4cce-91c2-d35fe8f56a93', '38', '0', '0', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('1ede2564-c30e-4ba0-b302-5018eb7a68e6', '8b63a28a-ad82-4915-bd0a-d2a5ff426fa8', '5', '0', '0', '0', '1', null);
INSERT INTO `table_corr_dms` VALUES ('74f0d49d-ba8e-4a54-89d4-69350d7523dd', '8b63a28a-ad82-4915-bd0a-d2a5ff426fa8', '8', '0', '0', '0', '1', null);
INSERT INTO `table_corr_dms` VALUES ('ffbd3b5e-cde7-4509-b804-bac6b4314f87', '8b63a28a-ad82-4915-bd0a-d2a5ff426fa8', '9', '0', '0', '0', '1', null);
INSERT INTO `table_corr_dms` VALUES ('de6ceba3-bede-494d-bd2d-f7bc7de6d480', '8b63a28a-ad82-4915-bd0a-d2a5ff426fa8', '10', '0', '0', '0', '1', null);
INSERT INTO `table_corr_dms` VALUES ('e7ef5a5b-e5b7-41b7-bbfc-7e7a54424047', '8b63a28a-ad82-4915-bd0a-d2a5ff426fa8', '12', '0', '0', '0', '1', null);
INSERT INTO `table_corr_dms` VALUES ('72b3ded0-42e9-42ef-9ed2-0eec24f57c56', '8b63a28a-ad82-4915-bd0a-d2a5ff426fa8', '13', '0', '0', '0', '1', null);
INSERT INTO `table_corr_dms` VALUES ('cb1945d8-88cd-4b56-b9a7-cea49e88d6fc', '8b63a28a-ad82-4915-bd0a-d2a5ff426fa8', '23', '0', '0', '0', '1', null);
INSERT INTO `table_corr_dms` VALUES ('7c217ac2-aa56-4cff-808c-07d7df54cbee', '8b63a28a-ad82-4915-bd0a-d2a5ff426fa8', '26', '1', '1', '1', '1', null);
INSERT INTO `table_corr_dms` VALUES ('66f518b9-7725-407f-94b8-9ab18496c54f', '8b63a28a-ad82-4915-bd0a-d2a5ff426fa8', '29', '1', '1', '1', '1', null);

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
INSERT INTO `table_dms` VALUES ('f3672253-6f0a-422d-b26d-5be3d3865a7c', '工厂管理员', '1', null);
INSERT INTO `table_dms` VALUES ('04976ff6-854a-4101-a669-115a0d64ebe2', '运营商', '2', null);
INSERT INTO `table_dms` VALUES ('a933b45b-1fb4-4cce-91c2-d35fe8f56a93', '点位商', '3', null);
INSERT INTO `table_dms` VALUES ('8b63a28a-ad82-4915-bd0a-d2a5ff426fa8', '补货员', '4', null);

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
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0101', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0102', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0103', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0104', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0105', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0106', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0107', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0108', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0201', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0202', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0203', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0204', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0205', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0206', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0207', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0208', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0301', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0302', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0303', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0304', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0401', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0402', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0403', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0404', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0405', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0406', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0407', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0408', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0501', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0502', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0503', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0504', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0505', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0506', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0507', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0508', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0601', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0602', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0603', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0604', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0605', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0606', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0607', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080003', 'A0608', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0101', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0102', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0103', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0104', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0105', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0106', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0107', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0108', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0201', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0202', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0203', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0204', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0205', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0206', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0207', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0208', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0301', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0302', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0303', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0304', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0401', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0402', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0403', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0404', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0405', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0406', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0407', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0408', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0501', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0502', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0503', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0504', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0505', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0506', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0507', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0508', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0601', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0602', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0603', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0604', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0605', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0606', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0607', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080001', 'A0608', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0101', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0102', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0103', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0104', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0105', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0106', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0107', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0108', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0201', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0202', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0203', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0204', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0205', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0206', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0207', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0208', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0301', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0302', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0303', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0304', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0401', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0402', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0403', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0404', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0405', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0406', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0407', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0408', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0501', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0502', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0503', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0504', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0505', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0506', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0507', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0508', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0601', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0602', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0603', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0604', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0605', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0606', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0607', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080002', 'A0608', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0101', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0102', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0103', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0104', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0105', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0106', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0107', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0108', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0201', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0202', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0203', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0204', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0205', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0206', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0207', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0208', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0301', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0302', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0303', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0304', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0401', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0402', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0403', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0404', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0405', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0406', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0407', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0408', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0501', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0502', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0503', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0504', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0505', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0506', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0507', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0508', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0601', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0602', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0603', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0604', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0605', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0606', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0607', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080004', 'A0608', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0101', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0102', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0103', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0104', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0105', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0106', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0107', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0108', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0201', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0202', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0203', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0204', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0205', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0206', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0207', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0208', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0301', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0302', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0303', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0304', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0401', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0402', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0403', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0404', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0405', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0406', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0407', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0408', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0501', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0502', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0503', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0504', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0505', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0506', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0507', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0508', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0601', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0602', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0603', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0604', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0605', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0606', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0607', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080005', 'A0608', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0101', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0102', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0103', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0104', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0105', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0106', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0107', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0108', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0109', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0110', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0111', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0112', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0201', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0202', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0203', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0204', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0205', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0206', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0207', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0208', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0209', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0210', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0211', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0212', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0301', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0302', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0303', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0304', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0305', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0306', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0307', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0308', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0309', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0310', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0311', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0312', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0401', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0402', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0403', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0404', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0405', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0406', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0407', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0408', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0409', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0410', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0411', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0412', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0501', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0502', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0503', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0504', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0505', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0506', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0507', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0508', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0509', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0510', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0511', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0512', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0601', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0602', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0603', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0604', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0605', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0606', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0607', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0608', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0609', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0610', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0611', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080003', 'A0612', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-12');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0101', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0102', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0103', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0104', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0105', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0106', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0107', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0108', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0201', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0202', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0203', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0204', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0205', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0206', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0207', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0208', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0301', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0302', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0303', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0304', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0401', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0402', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0403', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0404', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0405', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0406', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0407', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0408', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0501', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0502', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0503', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0504', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0505', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0506', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0507', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0508', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0601', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0602', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0603', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0604', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0605', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0606', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0607', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080006', 'A0608', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0101', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0102', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0103', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0104', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0105', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0106', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0107', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0108', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0201', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0202', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0203', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0204', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0205', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0206', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0207', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0208', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0301', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0302', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0303', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0304', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0401', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0402', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0403', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0404', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0405', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0406', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0407', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0408', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0501', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0502', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0503', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0504', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0505', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0506', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0507', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0508', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0601', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0602', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0603', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0604', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0605', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0606', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0607', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080007', 'A0608', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0101', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0102', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0103', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0104', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0105', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0106', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0107', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0108', '56658642-710b-40d6-9452-6f10f6952983', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0201', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0202', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0203', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0204', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0205', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0206', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0207', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0208', '56658642-710b-40d6-9452-6f10f6952983', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0301', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0302', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0303', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0304', '56658642-710b-40d6-9452-6f10f6952983', '3', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0401', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0402', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0403', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0404', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0405', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0406', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0407', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0408', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0501', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0502', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0503', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0504', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0505', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0506', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0507', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0508', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0601', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0602', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0603', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0604', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0605', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0606', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0607', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('JHLA17080008', 'A0608', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0101', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0102', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0103', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0104', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0105', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0106', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0107', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0108', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0109', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0110', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0111', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0112', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0201', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0202', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0203', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0204', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0205', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0206', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0207', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0208', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0209', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0210', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0211', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0212', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0301', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0302', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0303', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0304', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0305', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0306', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0307', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0308', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0309', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0310', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0311', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0312', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0401', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0402', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0403', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0404', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0405', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0406', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0407', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0408', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0409', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0410', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0411', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0412', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0501', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0502', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0503', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0504', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0505', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0506', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0507', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0508', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0509', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0510', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0511', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0512', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0601', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0602', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0603', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0604', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0605', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0606', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0607', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0608', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0609', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0610', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0611', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080002', 'A0612', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0101', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0102', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0103', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0104', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0105', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0106', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0107', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0108', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0109', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0110', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0111', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0112', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0201', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0202', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0203', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0204', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0205', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0206', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0207', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0208', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0209', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0210', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0211', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0212', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0301', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0302', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0303', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0304', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0305', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0306', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0307', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0308', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0309', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0310', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0311', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0312', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0401', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0402', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0403', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0404', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0405', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0406', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0407', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0408', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0409', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0410', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0411', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0412', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0501', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0502', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0503', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0504', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0505', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0506', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0507', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0508', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0509', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0510', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0511', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0512', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0601', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0602', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0603', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0604', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0605', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0606', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0607', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0608', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0609', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0610', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0611', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080004', 'A0612', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0101', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0102', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0103', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0104', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0105', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0106', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0107', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0108', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0109', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0110', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0111', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0112', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0201', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0202', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0203', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0204', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0205', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0206', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0207', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0208', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0209', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0210', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0211', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0212', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0301', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0302', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0303', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0304', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0305', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0306', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0307', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0308', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0309', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0310', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0311', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0312', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0401', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0402', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0403', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0404', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0405', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0406', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0407', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0408', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0409', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0410', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0411', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0412', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0501', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0502', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0503', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0504', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0505', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0506', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0507', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0508', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0509', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0510', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0511', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0512', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0601', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0602', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0603', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0604', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0605', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0606', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0607', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0608', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0609', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0610', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0611', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080005', 'A0612', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0101', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0102', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0103', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0104', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0105', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0106', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0107', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0108', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0109', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0110', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0111', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0112', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0201', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0202', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0203', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0204', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0205', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0206', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0207', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0208', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0209', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0210', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0211', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0212', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0301', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0302', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0303', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0304', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0305', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0306', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0307', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0308', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0309', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0310', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0311', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0312', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0401', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0402', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0403', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0404', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0405', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0406', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0407', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0408', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0409', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0410', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0411', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0412', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0501', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0502', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0503', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0504', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0505', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0506', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0507', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0508', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0509', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0510', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0511', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0512', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0601', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0602', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0603', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0604', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0605', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0606', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0607', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0608', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0609', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0610', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0611', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080006', 'A0612', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0101', '3', '8', '3.50', '3.50', '3.50', '3.50', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0102', '3', '8', '3.50', '3.50', '3.50', '3.50', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0103', '3', '8', '3.50', '3.50', '3.50', '3.50', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0104', '3', '8', '3.50', '3.50', '3.50', '3.50', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0105', '3', '8', '3.50', '3.50', '3.50', '3.50', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0106', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0107', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0108', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0109', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0110', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0111', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0112', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0201', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0202', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0203', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0204', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0205', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0206', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0207', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0208', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0209', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0210', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0211', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0212', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0301', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0302', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0303', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0304', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0305', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0306', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0307', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0308', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0309', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0310', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0311', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0312', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0401', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0402', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0403', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0404', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0405', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0406', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0407', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0408', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0409', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0410', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0411', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0412', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0501', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0502', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0503', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0504', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0505', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0506', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0507', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0508', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0509', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0510', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0511', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0512', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0601', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0602', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0603', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0604', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0605', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0606', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0607', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0608', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0609', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0610', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0611', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080007', 'A0612', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0101', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0102', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0103', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0104', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0105', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0106', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0107', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0108', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0109', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0110', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0111', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0112', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0201', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0202', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0203', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0204', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0205', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0206', '3', '3', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0207', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0208', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0209', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0210', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0211', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0212', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0301', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0302', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0303', '3', '5', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0304', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0305', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0306', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0307', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0308', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0309', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0310', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0311', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0312', '3', '5', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0401', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0402', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0403', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0404', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0405', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0406', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0407', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0408', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0409', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0410', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0411', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0412', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0501', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0502', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0503', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0504', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0505', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0506', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0507', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0508', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0509', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0510', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0511', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0512', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0601', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0602', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0603', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0604', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0605', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0606', '3', '6', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0607', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0608', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0609', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0610', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0611', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080008', 'A0612', '3', '6', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0101', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0102', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0103', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0104', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0105', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0106', '3', '8', '0.01', '0.01', '0.01', '0.01', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0107', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0108', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0109', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0110', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0111', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0112', '3', '8', '0.01', '0.01', '0.01', '0.01', '7f8c01a5-85db-4f45-9b00-c139ef2da756', '1', '1-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0201', '3', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0202', '3', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0203', '3', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0204', '3', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0205', '3', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0206', '3', '6', '0.01', '0.01', '0.01', '0.01', '128f6cd3-41fc-4448-8837-654d97811169', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0207', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0208', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0209', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0210', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0211', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0212', '3', '6', '0.01', '0.01', '0.01', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0301', '3', '3', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0302', '3', '3', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0303', '3', '3', '0.01', '0.01', '0.01', '0.01', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0304', '3', '3', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0305', '3', '3', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0306', '3', '3', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0307', '3', '3', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0308', '3', '3', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0309', '3', '3', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0310', '3', '3', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0311', '3', '3', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0312', '3', '3', '0.01', '0.01', '0.01', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '3-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0401', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0402', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0403', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0404', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0405', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0406', '3', '5', '0.01', '0.01', '0.01', '0.01', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0407', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0408', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0409', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0410', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0411', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0412', '3', '5', '0.01', '0.01', '0.01', '0.01', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '4-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0501', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0502', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0503', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0504', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0505', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0506', '3', '5', '0.01', '0.01', '0.01', '0.01', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0507', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0508', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0509', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0510', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0511', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0512', '3', '5', '0.01', '0.01', '0.01', '0.01', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '5-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0601', '3', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0602', '3', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0603', '3', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0604', '3', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0605', '3', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0606', '3', '5', '0.01', '0.01', '0.01', '0.01', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0607', '3', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0608', '3', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0609', '3', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0610', '3', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0611', '3', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17081818', 'A0612', '3', '5', '0.01', '0.01', '0.01', '0.01', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-12');
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
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0406', '3', '5', '3.00', '3.00', '3.00', '3.00', '221097df-b77a-43ca-8568-3f3bd83e40e2', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0407', '3', '5', '3.00', '3.00', '3.00', '3.00', '221097df-b77a-43ca-8568-3f3bd83e40e2', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0408', '3', '5', '3.00', '3.00', '3.00', '3.00', '221097df-b77a-43ca-8568-3f3bd83e40e2', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0409', '3', '5', '3.00', '3.00', '3.00', '3.00', '221097df-b77a-43ca-8568-3f3bd83e40e2', '1', '4-9');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0410', '3', '5', '3.00', '3.00', '3.00', '3.00', '221097df-b77a-43ca-8568-3f3bd83e40e2', '1', '4-10');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0411', '3', '5', '3.00', '3.00', '3.00', '3.00', '966457b3-0ce7-4cff-b371-d87cf0544579', '1', '4-11');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0412', '3', '5', '3.00', '3.00', '3.00', '3.00', '966457b3-0ce7-4cff-b371-d87cf0544579', '1', '4-12');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0501', '3', '5', '2.00', '1.70', '1.70', '2.00', '829467a1-90d9-4d16-bb2c-4fee2a401164', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0502', '3', '5', '2.00', '1.70', '1.70', '2.00', '829467a1-90d9-4d16-bb2c-4fee2a401164', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0503', '3', '5', '2.00', '2.00', '2.00', '2.00', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0504', '3', '5', '2.00', '2.00', '2.00', '2.00', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0505', '3', '5', '2.00', '2.00', '2.00', '2.00', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '5-5');
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
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0606', '3', '5', '3.50', '3.50', '3.50', '3.50', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0607', '3', '5', '3.50', '3.50', '3.50', '3.50', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0608', '3', '5', '3.50', '3.50', '3.50', '3.50', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0609', '3', '5', '3.50', '3.50', '3.50', '3.50', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-9');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0610', '3', '5', '3.50', '3.50', '3.50', '3.50', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-10');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0611', '3', '5', '3.50', '3.50', '3.50', '3.50', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-11');
INSERT INTO `table_goods_config` VALUES ('JL5710000001', 'A0612', '3', '5', '3.50', '3.50', '3.50', '3.50', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '6-12');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0101', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0102', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0103', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0104', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0105', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0106', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0107', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0108', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '1-8');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0201', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '688c5718-5b16-4ef5-9ed2-56d03a368ab2', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0202', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '688c5718-5b16-4ef5-9ed2-56d03a368ab2', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0203', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '688c5718-5b16-4ef5-9ed2-56d03a368ab2', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0204', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '688c5718-5b16-4ef5-9ed2-56d03a368ab2', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0205', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '688c5718-5b16-4ef5-9ed2-56d03a368ab2', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0206', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '688c5718-5b16-4ef5-9ed2-56d03a368ab2', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0207', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '688c5718-5b16-4ef5-9ed2-56d03a368ab2', '1', '2-7');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0208', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '688c5718-5b16-4ef5-9ed2-56d03a368ab2', '1', '2-8');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0301', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '688c5718-5b16-4ef5-9ed2-56d03a368ab2', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0302', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '688c5718-5b16-4ef5-9ed2-56d03a368ab2', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0303', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '688c5718-5b16-4ef5-9ed2-56d03a368ab2', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0304', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '688c5718-5b16-4ef5-9ed2-56d03a368ab2', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0401', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0402', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0403', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0404', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0405', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0406', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0407', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0408', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0501', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '688c5718-5b16-4ef5-9ed2-56d03a368ab2', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0502', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '688c5718-5b16-4ef5-9ed2-56d03a368ab2', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0503', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '688c5718-5b16-4ef5-9ed2-56d03a368ab2', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0504', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '688c5718-5b16-4ef5-9ed2-56d03a368ab2', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0505', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '688c5718-5b16-4ef5-9ed2-56d03a368ab2', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0506', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '688c5718-5b16-4ef5-9ed2-56d03a368ab2', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0507', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '688c5718-5b16-4ef5-9ed2-56d03a368ab2', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0508', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '688c5718-5b16-4ef5-9ed2-56d03a368ab2', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0601', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0602', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0603', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0604', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0605', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0606', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0607', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('HFYA1709TST1', 'A0608', '56658642-710b-40d6-9452-6f10f6952983', '5', '0.01', '0.01', '0.01', '0.01', '0c268504-8336-40ad-b1f6-a8354459ea75', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0101', '3', '8', '1.00', '1.00', '1.00', '1.00', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0102', '3', '8', '1.00', '1.00', '1.00', '1.00', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0103', '3', '8', '1.00', '1.00', '1.00', '1.00', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0104', '3', '8', '1.00', '1.00', '1.00', '1.00', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0105', '3', '8', '1.00', '1.00', '1.00', '1.00', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0106', '3', '8', '1.00', '1.00', '1.00', '1.00', 'e613ff5f-32f7-43aa-a793-4c7d688aac99', '1', '1-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0107', '3', '8', '1.00', '1.00', '1.00', '1.00', 'be0a824c-18c1-45a1-acfa-d457f27a0493', '1', '1-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0108', '3', '8', '1.00', '1.00', '1.00', '1.00', 'be0a824c-18c1-45a1-acfa-d457f27a0493', '1', '1-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0109', '3', '8', '1.00', '1.00', '1.00', '1.00', 'be0a824c-18c1-45a1-acfa-d457f27a0493', '1', '1-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0110', '3', '8', '1.00', '1.00', '1.00', '1.00', 'be0a824c-18c1-45a1-acfa-d457f27a0493', '1', '1-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0111', '3', '8', '1.00', '1.00', '1.00', '1.00', 'be0a824c-18c1-45a1-acfa-d457f27a0493', '1', '1-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0112', '3', '8', '1.00', '1.00', '1.00', '1.00', 'be0a824c-18c1-45a1-acfa-d457f27a0493', '1', '1-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0201', '3', '3', '5.00', '5.00', '5.00', '5.00', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '2-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0202', '3', '3', '5.00', '5.00', '5.00', '5.00', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '2-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0203', '3', '3', '5.00', '5.00', '5.00', '5.00', 'bf869b68-57de-4016-b150-a93b6fa7e0cd', '1', '2-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0204', '3', '3', '5.00', '5.00', '5.00', '5.00', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '2-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0205', '3', '3', '5.00', '5.00', '5.00', '5.00', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '2-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0206', '3', '3', '5.00', '5.00', '5.00', '5.00', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '2-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0207', '3', '6', '0.01', '5.00', '5.00', '0.01', 'acd187d1-35c2-4e64-bf8a-8dad36508fd6', '1', '2-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0208', '3', '6', '0.01', '5.00', '5.00', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0209', '3', '6', '0.01', '5.00', '5.00', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0210', '3', '6', '0.01', '5.00', '5.00', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0211', '3', '6', '0.01', '5.00', '5.00', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0212', '3', '6', '0.01', '5.00', '5.00', '0.01', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '2-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0301', '3', '5', '1.70', '1.70', '1.70', '1.70', '829467a1-90d9-4d16-bb2c-4fee2a401164', '1', '3-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0302', '3', '5', '1.70', '1.70', '1.70', '1.70', '829467a1-90d9-4d16-bb2c-4fee2a401164', '1', '3-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0303', '3', '5', '2.00', '2.00', '2.00', '2.00', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '3-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0304', '3', '5', '2.00', '2.00', '2.00', '2.00', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '3-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0305', '3', '5', '2.00', '2.00', '2.00', '2.00', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '3-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0306', '3', '5', '2.00', '2.00', '2.00', '2.00', 'cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '1', '3-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0307', '3', '5', '2.50', '2.50', '2.50', '2.50', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '3-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0308', '3', '5', '2.50', '2.50', '2.50', '2.50', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '3-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0309', '3', '5', '2.50', '2.50', '2.50', '2.50', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '3-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0310', '3', '5', '2.50', '2.50', '2.50', '2.50', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '3-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0311', '3', '5', '2.50', '2.50', '2.50', '2.50', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '3-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0312', '3', '5', '2.50', '2.50', '2.50', '2.50', 'f602b953-3d4e-4d5a-95ac-f740375e014f', '1', '3-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0401', '3', '5', '3.50', '3.50', '3.50', '3.50', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '4-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0402', '3', '5', '3.50', '3.50', '3.50', '3.50', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '4-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0403', '3', '5', '3.50', '3.50', '3.50', '3.50', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '4-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0404', '3', '5', '3.50', '3.50', '3.50', '3.50', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '4-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0405', '3', '5', '3.50', '3.50', '3.50', '3.50', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '4-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0406', '3', '5', '3.50', '3.50', '3.50', '3.50', '53053f36-6ec7-40dc-b59a-f7a024cb4a60', '1', '4-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0407', '3', '5', '3.50', '3.50', '3.50', '3.50', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '4-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0408', '3', '5', '3.50', '3.50', '3.50', '3.50', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '4-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0409', '3', '5', '3.50', '3.50', '3.50', '3.50', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '4-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0410', '3', '5', '3.50', '3.50', '3.50', '3.50', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '4-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0411', '3', '5', '3.50', '3.50', '3.50', '3.50', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '4-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0412', '3', '5', '3.50', '3.50', '3.50', '3.50', '59c1b372-3cfb-4dea-adb6-8c6385218118', '1', '4-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0501', '3', '5', '3.50', '3.50', '3.50', '3.50', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '5-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0502', '3', '5', '3.50', '3.50', '3.50', '3.50', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '5-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0503', '3', '5', '3.50', '3.50', '3.50', '3.50', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '5-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0504', '3', '5', '3.50', '3.50', '3.50', '3.50', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '5-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0505', '3', '5', '3.50', '3.50', '3.50', '3.50', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '5-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0506', '3', '5', '3.50', '3.50', '3.50', '3.50', '761fc0b8-4939-4a29-8c17-b3140cfb7f65', '1', '5-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0507', '3', '5', '3.50', '3.50', '3.50', '3.50', 'b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '1', '5-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0508', '3', '5', '3.50', '3.50', '3.50', '3.50', '221097df-b77a-43ca-8568-3f3bd83e40e2', '1', '5-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0509', '3', '5', '3.50', '3.50', '3.50', '3.50', '221097df-b77a-43ca-8568-3f3bd83e40e2', '1', '5-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0510', '3', '5', '3.50', '3.50', '3.50', '3.50', '221097df-b77a-43ca-8568-3f3bd83e40e2', '1', '5-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0511', '3', '5', '3.50', '3.50', '3.50', '3.50', '221097df-b77a-43ca-8568-3f3bd83e40e2', '1', '5-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0512', '3', '5', '3.50', '3.50', '3.50', '3.50', '221097df-b77a-43ca-8568-3f3bd83e40e2', '1', '5-12');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0601', '3', '6', '5.00', '5.00', '5.00', '5.00', '128f6cd3-41fc-4448-8837-654d97811169', '1', '6-1');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0602', '3', '6', '5.00', '5.00', '5.00', '5.00', '128f6cd3-41fc-4448-8837-654d97811169', '1', '6-2');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0603', '3', '6', '5.00', '5.00', '5.00', '5.00', '128f6cd3-41fc-4448-8837-654d97811169', '1', '6-3');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0604', '3', '6', '5.00', '5.00', '5.00', '5.00', '128f6cd3-41fc-4448-8837-654d97811169', '1', '6-4');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0605', '3', '6', '5.00', '5.00', '5.00', '5.00', '128f6cd3-41fc-4448-8837-654d97811169', '1', '6-5');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0606', '3', '6', '5.00', '5.00', '5.00', '5.00', '128f6cd3-41fc-4448-8837-654d97811169', '1', '6-6');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0607', '3', '6', '5.00', '5.00', '5.00', '5.00', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '6-7');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0608', '3', '6', '5.00', '5.00', '5.00', '5.00', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '6-8');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0609', '3', '6', '5.00', '5.00', '5.00', '5.00', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '6-9');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0610', '3', '6', '5.00', '5.00', '5.00', '5.00', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '6-10');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0611', '3', '6', '5.00', '5.00', '5.00', '5.00', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '6-11');
INSERT INTO `table_goods_config` VALUES ('JHLB17080001', 'A0612', '3', '6', '5.00', '5.00', '5.00', '5.00', '00a37f7b-cbe7-4421-8113-caa72723c313', '1', '6-12');

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
INSERT INTO `table_goods_status` VALUES ('A0101', 'JL5710000001', '0', '0', null, null, '1', '2017-07-19 11:10:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0102', 'JL5710000001', '1', '0', null, null, '1', '2017-07-01 14:46:56', '3');
INSERT INTO `table_goods_status` VALUES ('A0103', 'JL5710000001', '4', '0', null, null, '1', '2017-07-01 14:46:56', '3');
INSERT INTO `table_goods_status` VALUES ('A0104', 'JL5710000001', '6', '0', null, null, '1', '2017-07-01 14:46:56', '3');
INSERT INTO `table_goods_status` VALUES ('A0105', 'JL5710000001', '6', '0', null, null, '1', '2017-07-01 14:46:56', '3');
INSERT INTO `table_goods_status` VALUES ('A0107', 'JL5710000001', '2', '0', null, null, '1', '2017-07-01 14:46:56', '3');
INSERT INTO `table_goods_status` VALUES ('A0108', 'JL5710000001', '5', '0', null, null, '1', '2017-07-01 14:46:56', '3');
INSERT INTO `table_goods_status` VALUES ('A0101', 'CJLB17070001', '7', '0', null, null, '1', '2017-07-01 14:55:35', '56658642-710b-40d6-9452-6f10f6952983');
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
INSERT INTO `table_goods_status` VALUES ('A0207', 'JL5710000001', '3', '0', null, null, '2', '2017-07-25 08:57:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0301', 'JL5710000001', '6', '0', null, null, '2', '2017-07-25 10:18:53', '3');
INSERT INTO `table_goods_status` VALUES ('A0202', 'JL5710000001', '3', '0', null, null, '2', '2017-07-25 08:56:54', '3');
INSERT INTO `table_goods_status` VALUES ('A0110', 'JL5710000001', '4', '0', null, null, '1', '2017-07-27 20:44:38', '3');
INSERT INTO `table_goods_status` VALUES ('A0112', 'JL5710000001', '6', '0', null, null, '1', '2017-07-27 20:44:38', '3');
INSERT INTO `table_goods_status` VALUES ('A0204', 'JL5710000001', '1', '0', null, null, '1', '2017-07-29 19:49:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0206', 'JL5710000001', '1', '0', null, null, '1', '2017-07-29 19:49:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0106', 'JL5710000001', '2', '0', null, null, '1', '2017-08-07 16:16:24', '3');
INSERT INTO `table_goods_status` VALUES ('A0111', 'JL5710000001', '0', '0', null, null, '1', '2017-08-07 16:16:25', '3');
INSERT INTO `table_goods_status` VALUES ('A0208', 'JL5710000001', '1', '0', null, null, '1', '2017-08-07 16:16:25', '3');
INSERT INTO `table_goods_status` VALUES ('A0209', 'JL5710000001', '1', '0', null, null, '1', '2017-08-07 16:16:25', '3');
INSERT INTO `table_goods_status` VALUES ('A0212', 'JL5710000001', '2', '0', null, null, '1', '2017-08-07 16:16:25', '3');
INSERT INTO `table_goods_status` VALUES ('A0109', 'JL5710000001', '0', '0', null, null, '1', '2017-08-07 16:22:32', '3');
INSERT INTO `table_goods_status` VALUES ('A0207', 'JHLB17080001', '6', '0', null, null, '1', '2017-09-06 08:26:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0208', 'JHLB17080001', '6', '0', null, null, '1', '2017-09-06 08:26:47', '3');
INSERT INTO `table_goods_status` VALUES ('A0209', 'JHLB17080001', '6', '0', null, null, '1', '2017-09-06 08:26:50', '3');
INSERT INTO `table_goods_status` VALUES ('A0210', 'JHLB17080001', '6', '0', null, null, '1', '2017-09-06 08:26:50', '3');
INSERT INTO `table_goods_status` VALUES ('A0211', 'JHLB17080001', '6', '0', null, null, '1', '2017-09-06 08:26:51', '3');
INSERT INTO `table_goods_status` VALUES ('A0212', 'JHLB17080001', '6', '0', null, null, '1', '2017-09-06 08:26:53', '3');
INSERT INTO `table_goods_status` VALUES ('A0205', 'JHLA17080003', '4', '0', null, null, '1', '2017-08-23 13:14:57', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0206', 'JHLA17080003', '4', '0', null, null, '1', '2017-08-23 13:14:57', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0207', 'JHLA17080003', '4', '0', null, null, '1', '2017-08-23 13:14:57', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0208', 'JHLA17080003', '4', '0', null, null, '1', '2017-08-23 13:14:57', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0205', 'JHLA17080002', '6', '0', null, null, '1', '2017-08-23 13:59:41', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0206', 'JHLA17080002', '6', '0', null, null, '1', '2017-08-23 13:59:41', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0207', 'JHLA17080002', '6', '0', null, null, '1', '2017-08-23 13:59:41', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0208', 'JHLA17080002', '6', '0', null, null, '1', '2017-08-23 13:59:41', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0101', 'JHLA17080004', '6', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0102', 'JHLA17080004', '6', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0103', 'JHLA17080004', '5', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0104', 'JHLA17080004', '6', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0105', 'JHLA17080004', '6', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0106', 'JHLA17080004', '6', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0107', 'JHLA17080004', '6', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0108', 'JHLA17080004', '6', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0201', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0202', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0203', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0204', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0205', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0206', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0207', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0208', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0301', 'JHLA17080004', '1', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0302', 'JHLA17080004', '1', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0303', 'JHLA17080004', '1', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0304', 'JHLA17080004', '1', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0401', 'JHLA17080004', '3', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0402', 'JHLA17080004', '3', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0403', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0404', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0405', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0406', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0407', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0408', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0501', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0502', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0503', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0504', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0505', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0506', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0507', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0508', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0601', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0602', 'JHLA17080004', '5', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0603', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0604', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0605', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:18', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0606', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:18', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0607', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:18', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0608', 'JHLA17080004', '4', '0', null, null, '1', '2017-08-23 16:23:18', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0101', 'JHLA17080005', '6', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0102', 'JHLA17080005', '6', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0103', 'JHLA17080005', '6', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0104', 'JHLA17080005', '6', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0105', 'JHLA17080005', '7', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0106', 'JHLA17080005', '7', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0107', 'JHLA17080005', '7', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0108', 'JHLA17080005', '7', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0201', 'JHLA17080005', '5', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0202', 'JHLA17080005', '5', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0203', 'JHLA17080005', '5', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0204', 'JHLA17080005', '5', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0205', 'JHLA17080005', '5', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0206', 'JHLA17080005', '5', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0207', 'JHLA17080005', '5', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0208', 'JHLA17080005', '5', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0301', 'JHLA17080005', '2', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0302', 'JHLA17080005', '2', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0303', 'JHLA17080005', '2', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0304', 'JHLA17080005', '2', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0401', 'JHLA17080005', '4', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0402', 'JHLA17080005', '4', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0403', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0404', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0405', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0406', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0407', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0408', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0501', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0502', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0503', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0504', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0505', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0506', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0507', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0508', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0601', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0602', 'JHLA17080005', '0', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0603', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0604', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:26', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0605', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:38', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0606', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:38', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0607', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:38', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0608', 'JHLA17080005', '3', '0', null, null, '1', '2017-08-23 16:36:38', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0207', 'JHLB17080003', '6', '0', null, null, '1', '2017-08-24 11:20:38', '3');
INSERT INTO `table_goods_status` VALUES ('A0208', 'JHLB17080003', '6', '0', null, null, '1', '2017-08-24 11:20:38', '3');
INSERT INTO `table_goods_status` VALUES ('A0209', 'JHLB17080003', '6', '0', null, null, '1', '2017-08-24 11:20:38', '3');
INSERT INTO `table_goods_status` VALUES ('A0210', 'JHLB17080003', '6', '0', null, null, '1', '2017-08-24 11:20:38', '3');
INSERT INTO `table_goods_status` VALUES ('A0211', 'JHLB17080003', '6', '0', null, null, '1', '2017-08-24 11:20:38', '3');
INSERT INTO `table_goods_status` VALUES ('A0212', 'JHLB17080003', '6', '0', null, null, '1', '2017-08-24 11:20:38', '3');
INSERT INTO `table_goods_status` VALUES ('A0101', 'JHLA17080006', '5', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0102', 'JHLA17080006', '5', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0103', 'JHLA17080006', '5', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0104', 'JHLA17080006', '5', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0105', 'JHLA17080006', '5', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0106', 'JHLA17080006', '5', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0107', 'JHLA17080006', '5', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0108', 'JHLA17080006', '5', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0201', 'JHLA17080006', '3', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0202', 'JHLA17080006', '3', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0203', 'JHLA17080006', '3', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0204', 'JHLA17080006', '3', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0205', 'JHLA17080006', '3', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0206', 'JHLA17080006', '4', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0207', 'JHLA17080006', '4', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0208', 'JHLA17080006', '4', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0301', 'JHLA17080006', '1', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0302', 'JHLA17080006', '0', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0303', 'JHLA17080006', '0', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0304', 'JHLA17080006', '0', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0401', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0402', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0403', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0404', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0405', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0406', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0407', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0408', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0501', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0502', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0503', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0504', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0505', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0506', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0507', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:45', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0508', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:45', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0601', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:45', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0602', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:45', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0603', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:45', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0604', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:45', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0605', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:48', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0606', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:48', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0607', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:48', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0608', 'JHLA17080006', '2', '0', null, null, '1', '2017-08-24 16:22:48', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0101', 'JHLA17080008', '6', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0102', 'JHLA17080008', '6', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0103', 'JHLA17080008', '6', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0104', 'JHLA17080008', '6', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0105', 'JHLA17080008', '6', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0106', 'JHLA17080008', '6', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0107', 'JHLA17080008', '6', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0108', 'JHLA17080008', '6', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0201', 'JHLA17080008', '4', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0202', 'JHLA17080008', '4', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0203', 'JHLA17080008', '4', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0204', 'JHLA17080008', '4', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0205', 'JHLA17080008', '4', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0206', 'JHLA17080008', '4', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0207', 'JHLA17080008', '4', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0208', 'JHLA17080008', '4', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0301', 'JHLA17080008', '0', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0302', 'JHLA17080008', '0', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0303', 'JHLA17080008', '0', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0304', 'JHLA17080008', '0', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0401', 'JHLA17080008', '2', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0402', 'JHLA17080008', '2', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0403', 'JHLA17080008', '2', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0404', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0405', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0406', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0407', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0408', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0501', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0502', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0503', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0504', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0505', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0506', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0507', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0508', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0601', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0602', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0603', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0604', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:24', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0605', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:28', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0606', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:28', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0607', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:28', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0608', 'JHLA17080008', '3', '0', null, null, '1', '2017-08-24 16:38:28', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0207', 'JHLB17080004', '6', '0', null, null, '1', '2017-08-24 16:53:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0208', 'JHLB17080004', '6', '0', null, null, '1', '2017-08-24 16:53:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0209', 'JHLB17080004', '6', '0', null, null, '1', '2017-08-24 16:53:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0210', 'JHLB17080004', '6', '0', null, null, '1', '2017-08-24 16:53:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0211', 'JHLB17080004', '6', '0', null, null, '1', '2017-08-24 16:53:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0212', 'JHLB17080004', '6', '0', null, null, '1', '2017-08-24 16:53:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0207', 'JHLB17080005', '6', '0', null, null, '1', '2017-08-24 17:01:03', '3');
INSERT INTO `table_goods_status` VALUES ('A0208', 'JHLB17080005', '6', '0', null, null, '1', '2017-08-24 17:01:03', '3');
INSERT INTO `table_goods_status` VALUES ('A0209', 'JHLB17080005', '6', '0', null, null, '1', '2017-08-24 17:01:03', '3');
INSERT INTO `table_goods_status` VALUES ('A0210', 'JHLB17080005', '6', '0', null, null, '1', '2017-08-24 17:01:03', '3');
INSERT INTO `table_goods_status` VALUES ('A0211', 'JHLB17080005', '6', '0', null, null, '1', '2017-08-24 17:01:03', '3');
INSERT INTO `table_goods_status` VALUES ('A0212', 'JHLB17080005', '6', '0', null, null, '1', '2017-08-24 17:01:03', '3');
INSERT INTO `table_goods_status` VALUES ('A0207', 'JHLB17080006', '4', '0', null, null, '1', '2017-08-24 17:22:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0208', 'JHLB17080006', '4', '0', null, null, '1', '2017-08-24 17:22:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0209', 'JHLB17080006', '4', '0', null, null, '1', '2017-08-24 17:22:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0210', 'JHLB17080006', '6', '0', null, null, '1', '2017-08-24 17:22:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0211', 'JHLB17080006', '6', '0', null, null, '1', '2017-08-24 17:22:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0212', 'JHLB17080006', '6', '0', null, null, '1', '2017-08-24 17:22:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0207', 'JHLB17080007', '2', '0', null, null, '1', '2017-08-24 17:28:21', '3');
INSERT INTO `table_goods_status` VALUES ('A0208', 'JHLB17080007', '5', '0', null, null, '1', '2017-08-24 17:28:21', '3');
INSERT INTO `table_goods_status` VALUES ('A0209', 'JHLB17080007', '6', '0', null, null, '1', '2017-08-24 17:28:21', '3');
INSERT INTO `table_goods_status` VALUES ('A0210', 'JHLB17080007', '6', '0', null, null, '1', '2017-08-24 17:28:21', '3');
INSERT INTO `table_goods_status` VALUES ('A0211', 'JHLB17080007', '6', '0', null, null, '1', '2017-08-24 17:28:21', '3');
INSERT INTO `table_goods_status` VALUES ('A0212', 'JHLB17080007', '6', '0', null, null, '1', '2017-08-24 17:28:21', '3');
INSERT INTO `table_goods_status` VALUES ('A0602', 'JL5710000001', '0', '0', null, null, '1', '2017-08-25 08:56:38', '3');
INSERT INTO `table_goods_status` VALUES ('A0603', 'JL5710000001', '0', '0', null, null, '1', '2017-08-25 08:56:38', '3');
INSERT INTO `table_goods_status` VALUES ('A0604', 'JL5710000001', '4', '0', null, null, '1', '2017-08-25 08:56:38', '3');
INSERT INTO `table_goods_status` VALUES ('A0605', 'JL5710000001', '3', '0', null, null, '1', '2017-08-25 08:56:38', '3');
INSERT INTO `table_goods_status` VALUES ('A0606', 'JL5710000001', '5', '0', null, null, '1', '2017-08-25 08:56:38', '3');
INSERT INTO `table_goods_status` VALUES ('A0607', 'JL5710000001', '5', '0', null, null, '1', '2017-08-25 08:56:38', '3');
INSERT INTO `table_goods_status` VALUES ('A0608', 'JL5710000001', '5', '0', null, null, '1', '2017-08-25 08:56:38', '3');
INSERT INTO `table_goods_status` VALUES ('A0609', 'JL5710000001', '5', '0', null, null, '1', '2017-08-25 08:56:38', '3');
INSERT INTO `table_goods_status` VALUES ('A0610', 'JL5710000001', '4', '0', null, null, '1', '2017-08-25 08:56:38', '3');
INSERT INTO `table_goods_status` VALUES ('A0611', 'JL5710000001', '4', '0', null, null, '1', '2017-08-25 08:56:38', '3');
INSERT INTO `table_goods_status` VALUES ('A0601', 'JL5710000001', '0', '0', null, null, '1', '2017-08-25 09:01:34', '3');
INSERT INTO `table_goods_status` VALUES ('A0612', 'JL5710000001', '5', '0', null, null, '1', '2017-08-25 09:02:11', '3');
INSERT INTO `table_goods_status` VALUES ('A0403', 'JL5710000001', '3', '0', null, null, '1', '2017-08-25 09:08:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0404', 'JL5710000001', '5', '0', null, null, '1', '2017-08-25 09:08:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0406', 'JL5710000001', '1', '0', null, null, '1', '2017-08-25 09:08:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0407', 'JL5710000001', '3', '0', null, null, '1', '2017-08-25 09:08:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0408', 'JL5710000001', '4', '0', null, null, '1', '2017-08-25 09:08:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0410', 'JL5710000001', '0', '0', null, null, '1', '2017-08-25 09:08:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0411', 'JL5710000001', '2', '0', null, null, '1', '2017-08-25 09:08:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0412', 'JL5710000001', '5', '0', null, null, '1', '2017-08-25 09:08:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0502', 'JL5710000001', '5', '0', null, null, '1', '2017-08-25 09:08:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0503', 'JL5710000001', '0', '0', null, null, '1', '2017-08-25 09:08:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0504', 'JL5710000001', '0', '0', null, null, '1', '2017-08-25 09:08:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0505', 'JL5710000001', '0', '0', null, null, '1', '2017-08-25 09:08:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0506', 'JL5710000001', '0', '0', null, null, '1', '2017-08-25 09:08:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0507', 'JL5710000001', '0', '0', null, null, '1', '2017-08-25 09:08:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0508', 'JL5710000001', '2', '0', null, null, '1', '2017-08-25 09:08:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0510', 'JL5710000001', '4', '0', null, null, '1', '2017-08-25 09:08:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0511', 'JL5710000001', '5', '0', null, null, '1', '2017-08-25 09:08:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0512', 'JL5710000001', '5', '0', null, null, '1', '2017-08-25 09:08:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0501', 'JL5710000001', '4', '0', null, null, '1', '2017-08-25 09:11:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0509', 'JL5710000001', '4', '0', null, null, '1', '2017-08-25 09:11:23', '3');
INSERT INTO `table_goods_status` VALUES ('A0401', 'JL5710000001', '0', '0', null, null, '1', '2017-08-25 09:16:25', '3');
INSERT INTO `table_goods_status` VALUES ('A0402', 'JL5710000001', '0', '0', null, null, '1', '2017-08-25 09:16:25', '3');
INSERT INTO `table_goods_status` VALUES ('A0405', 'JL5710000001', '3', '0', null, null, '1', '2017-08-25 09:16:25', '3');
INSERT INTO `table_goods_status` VALUES ('A0409', 'JL5710000001', '4', '0', null, null, '1', '2017-08-25 09:16:25', '3');
INSERT INTO `table_goods_status` VALUES ('A0101', 'JHLA17080007', '8', '0', null, null, '1', '2017-08-26 13:41:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0102', 'JHLA17080007', '8', '0', null, null, '1', '2017-08-26 13:41:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0103', 'JHLA17080007', '8', '0', null, null, '1', '2017-08-26 13:41:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0104', 'JHLA17080007', '8', '0', null, null, '1', '2017-08-26 13:41:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0105', 'JHLA17080007', '8', '0', null, null, '1', '2017-08-26 13:41:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0106', 'JHLA17080007', '8', '0', null, null, '1', '2017-08-26 13:41:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0107', 'JHLA17080007', '8', '0', null, null, '1', '2017-08-26 13:41:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0108', 'JHLA17080007', '8', '0', null, null, '1', '2017-08-26 13:41:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0201', 'JHLA17080007', '6', '0', null, null, '1', '2017-08-26 13:41:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0203', 'JHLA17080007', '6', '0', null, null, '1', '2017-08-26 13:41:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0204', 'JHLA17080007', '6', '0', null, null, '1', '2017-08-26 13:41:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0205', 'JHLA17080007', '6', '0', null, null, '1', '2017-08-26 13:41:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0206', 'JHLA17080007', '6', '0', null, null, '1', '2017-08-26 13:41:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0207', 'JHLA17080007', '6', '0', null, null, '1', '2017-08-26 13:41:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0208', 'JHLA17080007', '6', '0', null, null, '1', '2017-08-26 13:41:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0207', 'JHLB17080008', '2', '0', null, null, '1', '2017-08-28 10:59:53', '3');
INSERT INTO `table_goods_status` VALUES ('A0208', 'JHLB17080008', '2', '0', null, null, '1', '2017-08-28 10:59:53', '3');
INSERT INTO `table_goods_status` VALUES ('A0209', 'JHLB17080008', '1', '0', null, null, '1', '2017-08-28 10:59:53', '3');
INSERT INTO `table_goods_status` VALUES ('A0210', 'JHLB17080008', '6', '0', null, null, '1', '2017-08-28 10:59:53', '3');
INSERT INTO `table_goods_status` VALUES ('A0211', 'JHLB17080008', '6', '0', null, null, '1', '2017-08-28 10:59:53', '3');
INSERT INTO `table_goods_status` VALUES ('A0212', 'JHLB17080008', '6', '0', null, null, '1', '2017-08-28 10:59:53', '3');
INSERT INTO `table_goods_status` VALUES ('A0101', 'JHLB17081818', '8', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0102', 'JHLB17081818', '8', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0103', 'JHLB17081818', '8', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0104', 'JHLB17081818', '8', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0105', 'JHLB17081818', '8', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0106', 'JHLB17081818', '8', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0107', 'JHLB17081818', '8', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0108', 'JHLB17081818', '8', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0109', 'JHLB17081818', '8', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0110', 'JHLB17081818', '8', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0111', 'JHLB17081818', '8', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0112', 'JHLB17081818', '8', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0201', 'JHLB17081818', '6', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0202', 'JHLB17081818', '6', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0203', 'JHLB17081818', '6', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0204', 'JHLB17081818', '6', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0205', 'JHLB17081818', '6', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0206', 'JHLB17081818', '6', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0207', 'JHLB17081818', '6', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0208', 'JHLB17081818', '6', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0209', 'JHLB17081818', '6', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0210', 'JHLB17081818', '6', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0211', 'JHLB17081818', '6', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0212', 'JHLB17081818', '6', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0301', 'JHLB17081818', '3', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0302', 'JHLB17081818', '3', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0303', 'JHLB17081818', '3', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0304', 'JHLB17081818', '3', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0305', 'JHLB17081818', '3', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0306', 'JHLB17081818', '3', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0307', 'JHLB17081818', '3', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0308', 'JHLB17081818', '3', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0309', 'JHLB17081818', '3', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0310', 'JHLB17081818', '3', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0311', 'JHLB17081818', '3', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0312', 'JHLB17081818', '3', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0401', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0402', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0403', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0404', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:02', '3');
INSERT INTO `table_goods_status` VALUES ('A0405', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0406', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0407', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0408', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0409', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0410', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0411', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0412', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0501', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0502', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0503', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0504', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0505', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0506', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0507', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0508', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0509', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0510', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0511', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0512', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0601', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0602', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0603', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0604', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0605', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0606', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0607', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0608', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0609', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0610', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0611', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0612', 'JHLB17081818', '5', '0', null, null, '1', '2017-08-31 10:47:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0202', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0301', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0302', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0303', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0304', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0401', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0402', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0403', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0404', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0405', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0406', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0407', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0408', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0501', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0502', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0503', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0504', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0505', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0506', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0507', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0508', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0601', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0602', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0603', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0604', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0605', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0606', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0607', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0608', 'JHLA17080007', '8', '0', null, null, '1', '2017-09-04 09:28:37', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0207', 'JHLB17080002', '6', '0', null, null, '1', '2017-09-05 13:36:11', '3');
INSERT INTO `table_goods_status` VALUES ('A0208', 'JHLB17080002', '6', '0', null, null, '1', '2017-09-05 13:36:11', '3');
INSERT INTO `table_goods_status` VALUES ('A0209', 'JHLB17080002', '6', '0', null, null, '1', '2017-09-05 13:36:11', '3');
INSERT INTO `table_goods_status` VALUES ('A0210', 'JHLB17080002', '6', '0', null, null, '1', '2017-09-05 13:36:11', '3');
INSERT INTO `table_goods_status` VALUES ('A0211', 'JHLB17080002', '6', '0', null, null, '1', '2017-09-05 13:36:11', '3');
INSERT INTO `table_goods_status` VALUES ('A0212', 'JHLB17080002', '6', '0', null, null, '1', '2017-09-05 13:36:11', '3');
INSERT INTO `table_goods_status` VALUES ('A0101', 'HFYA1709TST1', '0', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0102', 'HFYA1709TST1', '1', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0103', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0104', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0105', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0106', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0107', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0108', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0201', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0202', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0203', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0204', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0205', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0206', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0207', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0208', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0301', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0302', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0303', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0304', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0401', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0402', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0403', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0404', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0405', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0406', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0407', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0408', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0501', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0502', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0503', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0504', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0505', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0506', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0507', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0508', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0601', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0602', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0603', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0604', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0605', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0606', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0607', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0608', 'HFYA1709TST1', '5', '5', null, null, '1', '2017-09-05 23:10:56', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0205', 'JHLA17080001', '3', '0', null, null, '1', '2017-09-06 16:17:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0206', 'JHLA17080001', '3', '0', null, null, '1', '2017-09-06 16:17:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0207', 'JHLA17080001', '3', '0', null, null, '1', '2017-09-06 16:17:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0208', 'JHLA17080001', '3', '0', null, null, '1', '2017-09-06 16:17:44', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0101', 'JHLB17080001', '0', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0102', 'JHLB17080001', '0', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0103', 'JHLB17080001', '0', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0104', 'JHLB17080001', '0', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0105', 'JHLB17080001', '0', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0106', 'JHLB17080001', '0', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0107', 'JHLB17080001', '0', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0108', 'JHLB17080001', '0', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0109', 'JHLB17080001', '0', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0110', 'JHLB17080001', '0', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0111', 'JHLB17080001', '0', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0112', 'JHLB17080001', '0', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0201', 'JHLB17080001', '1', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0202', 'JHLB17080001', '1', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0203', 'JHLB17080001', '2', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0204', 'JHLB17080001', '1', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0205', 'JHLB17080001', '1', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0206', 'JHLB17080001', '1', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0301', 'JHLB17080001', '5', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0302', 'JHLB17080001', '4', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0303', 'JHLB17080001', '5', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0304', 'JHLB17080001', '1', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0307', 'JHLB17080001', '3', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0308', 'JHLB17080001', '4', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0309', 'JHLB17080001', '5', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0310', 'JHLB17080001', '5', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0311', 'JHLB17080001', '4', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0401', 'JHLB17080001', '2', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0402', 'JHLB17080001', '5', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0403', 'JHLB17080001', '0', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0404', 'JHLB17080001', '0', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0405', 'JHLB17080001', '0', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0406', 'JHLB17080001', '2', '0', null, null, '1', '2017-09-07 17:01:33', '3');
INSERT INTO `table_goods_status` VALUES ('A0407', 'JHLB17080001', '4', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0408', 'JHLB17080001', '5', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0409', 'JHLB17080001', '5', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0410', 'JHLB17080001', '5', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0411', 'JHLB17080001', '5', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0412', 'JHLB17080001', '4', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0501', 'JHLB17080001', '3', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0502', 'JHLB17080001', '1', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0503', 'JHLB17080001', '1', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0504', 'JHLB17080001', '1', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0505', 'JHLB17080001', '1', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0506', 'JHLB17080001', '1', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0507', 'JHLB17080001', '2', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0508', 'JHLB17080001', '2', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0509', 'JHLB17080001', '2', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0510', 'JHLB17080001', '2', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0511', 'JHLB17080001', '2', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0512', 'JHLB17080001', '1', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0601', 'JHLB17080001', '6', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0602', 'JHLB17080001', '6', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0603', 'JHLB17080001', '2', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0604', 'JHLB17080001', '2', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0605', 'JHLB17080001', '2', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0606', 'JHLB17080001', '1', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0607', 'JHLB17080001', '2', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0608', 'JHLB17080001', '1', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0609', 'JHLB17080001', '0', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0610', 'JHLB17080001', '1', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0611', 'JHLB17080001', '1', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0612', 'JHLB17080001', '1', '0', null, null, '1', '2017-09-07 17:01:37', '3');
INSERT INTO `table_goods_status` VALUES ('A0305', 'JHLB17080001', '0', '0', null, null, '1', '2017-09-07 17:05:43', '3');
INSERT INTO `table_goods_status` VALUES ('A0306', 'JHLB17080001', '0', '0', null, null, '1', '2017-09-07 17:05:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0312', 'JHLB17080001', '0', '0', null, null, '1', '2017-09-07 17:05:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0101', 'JHLA17080001', '8', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0102', 'JHLA17080001', '8', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0103', 'JHLA17080001', '8', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0104', 'JHLA17080001', '8', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0105', 'JHLA17080001', '8', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0106', 'JHLA17080001', '8', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0107', 'JHLA17080001', '8', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0108', 'JHLA17080001', '8', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0201', 'JHLA17080001', '1', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0202', 'JHLA17080001', '3', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0203', 'JHLA17080001', '3', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0204', 'JHLA17080001', '3', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0301', 'JHLA17080001', '4', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0302', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0303', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0304', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0305', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0306', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0307', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0308', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0401', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0402', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0403', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0404', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0405', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0406', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0407', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0408', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0501', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0502', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0503', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0504', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0505', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0506', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0507', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:04', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0508', 'JHLA17080001', '5', '0', null, null, '1', '2017-09-08 08:10:05', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0601', 'JHLA17080001', '6', '0', null, null, '1', '2017-09-08 08:10:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0602', 'JHLA17080001', '6', '0', null, null, '1', '2017-09-08 08:10:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0603', 'JHLA17080001', '6', '0', null, null, '1', '2017-09-08 08:10:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0604', 'JHLA17080001', '6', '0', null, null, '1', '2017-09-08 08:10:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0605', 'JHLA17080001', '6', '0', null, null, '1', '2017-09-08 08:10:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0606', 'JHLA17080001', '6', '0', null, null, '1', '2017-09-08 08:10:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0607', 'JHLA17080001', '6', '0', null, null, '1', '2017-09-08 08:10:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0608', 'JHLA17080001', '6', '0', null, null, '1', '2017-09-08 08:10:07', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0101', 'JHLA17080002', '8', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0102', 'JHLA17080002', '8', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0103', 'JHLA17080002', '8', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0104', 'JHLA17080002', '8', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0105', 'JHLA17080002', '8', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0106', 'JHLA17080002', '8', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0107', 'JHLA17080002', '8', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0108', 'JHLA17080002', '8', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0201', 'JHLA17080002', '3', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0202', 'JHLA17080002', '3', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0203', 'JHLA17080002', '3', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0204', 'JHLA17080002', '3', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0301', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0302', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0303', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0304', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0305', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0306', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0307', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0308', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0401', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0402', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0403', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0404', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0405', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0406', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0407', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0408', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0501', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0502', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0503', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0504', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0505', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0506', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0507', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0508', 'JHLA17080002', '5', '0', null, null, '1', '2017-09-08 08:30:13', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0601', 'JHLA17080002', '6', '0', null, null, '1', '2017-09-08 08:30:16', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0602', 'JHLA17080002', '6', '0', null, null, '1', '2017-09-08 08:30:16', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0603', 'JHLA17080002', '6', '0', null, null, '1', '2017-09-08 08:30:16', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0604', 'JHLA17080002', '6', '0', null, null, '1', '2017-09-08 08:30:16', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0605', 'JHLA17080002', '6', '0', null, null, '1', '2017-09-08 08:30:16', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0606', 'JHLA17080002', '6', '0', null, null, '1', '2017-09-08 08:30:16', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0607', 'JHLA17080002', '6', '0', null, null, '1', '2017-09-08 08:30:16', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0608', 'JHLA17080002', '6', '0', null, null, '1', '2017-09-08 08:30:16', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0101', 'JHLA17080003', '8', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0102', 'JHLA17080003', '8', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0103', 'JHLA17080003', '8', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0104', 'JHLA17080003', '8', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0105', 'JHLA17080003', '8', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0106', 'JHLA17080003', '8', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0107', 'JHLA17080003', '8', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0108', 'JHLA17080003', '8', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0201', 'JHLA17080003', '3', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0202', 'JHLA17080003', '3', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0203', 'JHLA17080003', '3', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0204', 'JHLA17080003', '3', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0301', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0302', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0303', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0304', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0305', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0306', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0307', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0308', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0401', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0402', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0403', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0404', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0405', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0406', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0407', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0408', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0501', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0502', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0503', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0504', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0505', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0506', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0507', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0508', 'JHLA17080003', '5', '0', null, null, '1', '2017-09-08 08:45:09', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0601', 'JHLA17080003', '6', '0', null, null, '1', '2017-09-08 08:45:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0602', 'JHLA17080003', '6', '0', null, null, '1', '2017-09-08 08:45:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0603', 'JHLA17080003', '6', '0', null, null, '1', '2017-09-08 08:45:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0604', 'JHLA17080003', '6', '0', null, null, '1', '2017-09-08 08:45:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0605', 'JHLA17080003', '6', '0', null, null, '1', '2017-09-08 08:45:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0606', 'JHLA17080003', '6', '0', null, null, '1', '2017-09-08 08:45:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0607', 'JHLA17080003', '6', '0', null, null, '1', '2017-09-08 08:45:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0608', 'JHLA17080003', '6', '0', null, null, '1', '2017-09-08 08:45:12', '56658642-710b-40d6-9452-6f10f6952983');
INSERT INTO `table_goods_status` VALUES ('A0101', 'JHLB17080002', '8', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0102', 'JHLB17080002', '8', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0103', 'JHLB17080002', '8', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0104', 'JHLB17080002', '8', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0105', 'JHLB17080002', '8', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0106', 'JHLB17080002', '8', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0107', 'JHLB17080002', '8', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0108', 'JHLB17080002', '8', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0109', 'JHLB17080002', '8', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0110', 'JHLB17080002', '8', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0111', 'JHLB17080002', '8', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0112', 'JHLB17080002', '8', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0201', 'JHLB17080002', '3', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0202', 'JHLB17080002', '3', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0203', 'JHLB17080002', '3', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0204', 'JHLB17080002', '3', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0205', 'JHLB17080002', '3', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0206', 'JHLB17080002', '3', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0301', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0302', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0303', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0304', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0305', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0306', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0307', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0308', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0309', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0310', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0311', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0312', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0401', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0402', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0403', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0404', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0405', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0406', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:15', '3');
INSERT INTO `table_goods_status` VALUES ('A0407', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0408', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0409', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0410', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0411', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0412', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0501', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0502', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0503', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0504', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0505', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0506', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0507', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0508', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0509', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0510', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0511', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0512', 'JHLB17080002', '5', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0601', 'JHLB17080002', '6', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0602', 'JHLB17080002', '6', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0603', 'JHLB17080002', '6', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0604', 'JHLB17080002', '6', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0605', 'JHLB17080002', '6', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0606', 'JHLB17080002', '6', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0607', 'JHLB17080002', '6', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0608', 'JHLB17080002', '6', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0609', 'JHLB17080002', '6', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0610', 'JHLB17080002', '6', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0611', 'JHLB17080002', '6', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0612', 'JHLB17080002', '6', '0', null, null, '1', '2017-09-08 12:16:18', '3');
INSERT INTO `table_goods_status` VALUES ('A0101', 'JHLB17080003', '8', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0102', 'JHLB17080003', '8', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0103', 'JHLB17080003', '8', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0104', 'JHLB17080003', '8', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0105', 'JHLB17080003', '8', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0106', 'JHLB17080003', '8', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0107', 'JHLB17080003', '8', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0108', 'JHLB17080003', '8', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0109', 'JHLB17080003', '8', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0110', 'JHLB17080003', '8', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0111', 'JHLB17080003', '8', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0112', 'JHLB17080003', '8', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0201', 'JHLB17080003', '3', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0202', 'JHLB17080003', '3', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0203', 'JHLB17080003', '3', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0204', 'JHLB17080003', '3', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0205', 'JHLB17080003', '3', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0206', 'JHLB17080003', '3', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0301', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0302', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0303', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0304', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0305', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0306', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0307', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0308', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0309', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0310', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0311', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0312', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0401', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0402', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0403', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0404', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0405', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0406', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:14', '3');
INSERT INTO `table_goods_status` VALUES ('A0407', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0408', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0409', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0410', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0411', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0412', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0501', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0502', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0503', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0504', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0505', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0506', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0507', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0508', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0509', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0510', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0511', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0512', 'JHLB17080003', '5', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0601', 'JHLB17080003', '6', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0602', 'JHLB17080003', '6', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0603', 'JHLB17080003', '6', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0604', 'JHLB17080003', '6', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0605', 'JHLB17080003', '6', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0606', 'JHLB17080003', '6', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0607', 'JHLB17080003', '6', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0608', 'JHLB17080003', '6', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0609', 'JHLB17080003', '6', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0610', 'JHLB17080003', '6', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0611', 'JHLB17080003', '6', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0612', 'JHLB17080003', '6', '0', null, null, '1', '2017-09-08 12:25:22', '3');
INSERT INTO `table_goods_status` VALUES ('A0101', 'JHLB17080004', '8', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0102', 'JHLB17080004', '8', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0103', 'JHLB17080004', '8', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0104', 'JHLB17080004', '8', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0105', 'JHLB17080004', '8', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0106', 'JHLB17080004', '8', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0107', 'JHLB17080004', '8', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0108', 'JHLB17080004', '8', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0109', 'JHLB17080004', '8', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0110', 'JHLB17080004', '8', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0111', 'JHLB17080004', '8', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0112', 'JHLB17080004', '8', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0201', 'JHLB17080004', '3', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0202', 'JHLB17080004', '3', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0203', 'JHLB17080004', '3', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0204', 'JHLB17080004', '3', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0205', 'JHLB17080004', '3', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0206', 'JHLB17080004', '3', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0301', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0302', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0303', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0304', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0305', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0306', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0307', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0308', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0309', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0310', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0311', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0312', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0401', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0402', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0403', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0404', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0405', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0406', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:39', '3');
INSERT INTO `table_goods_status` VALUES ('A0407', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0408', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0409', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0410', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0411', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0412', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0501', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0502', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0503', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0504', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0505', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0506', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0507', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0508', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0509', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0510', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0511', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0512', 'JHLB17080004', '5', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0601', 'JHLB17080004', '6', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0602', 'JHLB17080004', '6', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0603', 'JHLB17080004', '6', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0604', 'JHLB17080004', '6', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0605', 'JHLB17080004', '6', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0606', 'JHLB17080004', '6', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0607', 'JHLB17080004', '6', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0608', 'JHLB17080004', '6', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0609', 'JHLB17080004', '6', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0610', 'JHLB17080004', '6', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0611', 'JHLB17080004', '6', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0612', 'JHLB17080004', '6', '0', null, null, '1', '2017-09-08 12:31:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0101', 'JHLB17080005', '8', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0102', 'JHLB17080005', '8', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0103', 'JHLB17080005', '8', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0104', 'JHLB17080005', '8', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0105', 'JHLB17080005', '8', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0106', 'JHLB17080005', '8', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0107', 'JHLB17080005', '8', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0108', 'JHLB17080005', '8', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0109', 'JHLB17080005', '8', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0110', 'JHLB17080005', '8', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0111', 'JHLB17080005', '8', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0112', 'JHLB17080005', '8', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0201', 'JHLB17080005', '3', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0202', 'JHLB17080005', '3', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0203', 'JHLB17080005', '3', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0204', 'JHLB17080005', '3', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0205', 'JHLB17080005', '3', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0206', 'JHLB17080005', '3', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0301', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0302', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0303', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0304', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0305', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0306', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0307', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0308', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0309', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0310', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0311', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0312', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0401', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0402', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0403', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0404', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0405', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0406', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:42', '3');
INSERT INTO `table_goods_status` VALUES ('A0407', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0408', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0409', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0410', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0411', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0412', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0501', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0502', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0503', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0504', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0505', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0506', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0507', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0508', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0509', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0510', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0511', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0512', 'JHLB17080005', '5', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0601', 'JHLB17080005', '6', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0602', 'JHLB17080005', '6', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0603', 'JHLB17080005', '6', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0604', 'JHLB17080005', '6', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0605', 'JHLB17080005', '6', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0606', 'JHLB17080005', '6', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0607', 'JHLB17080005', '6', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0608', 'JHLB17080005', '6', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0609', 'JHLB17080005', '6', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0610', 'JHLB17080005', '6', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0611', 'JHLB17080005', '6', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0612', 'JHLB17080005', '6', '0', null, null, '1', '2017-09-08 12:45:46', '3');
INSERT INTO `table_goods_status` VALUES ('A0101', 'JHLB17080006', '8', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0102', 'JHLB17080006', '8', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0103', 'JHLB17080006', '8', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0104', 'JHLB17080006', '8', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0105', 'JHLB17080006', '8', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0106', 'JHLB17080006', '8', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0107', 'JHLB17080006', '8', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0108', 'JHLB17080006', '8', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0109', 'JHLB17080006', '8', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0110', 'JHLB17080006', '8', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0111', 'JHLB17080006', '8', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0112', 'JHLB17080006', '8', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0201', 'JHLB17080006', '3', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0202', 'JHLB17080006', '3', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0203', 'JHLB17080006', '3', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0204', 'JHLB17080006', '3', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0205', 'JHLB17080006', '3', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0206', 'JHLB17080006', '3', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0301', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0302', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0303', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0304', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0305', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0306', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0307', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0308', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0309', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0310', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0311', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0312', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0401', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0402', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0403', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0404', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0405', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0406', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:08', '3');
INSERT INTO `table_goods_status` VALUES ('A0407', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0408', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0409', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0410', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0411', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0412', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0501', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0502', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0503', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0504', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0505', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0506', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0507', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0508', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0509', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0510', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0511', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0512', 'JHLB17080006', '5', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0601', 'JHLB17080006', '6', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0602', 'JHLB17080006', '6', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0603', 'JHLB17080006', '6', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0604', 'JHLB17080006', '6', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0605', 'JHLB17080006', '6', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0606', 'JHLB17080006', '6', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0607', 'JHLB17080006', '6', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0608', 'JHLB17080006', '6', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0609', 'JHLB17080006', '6', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0610', 'JHLB17080006', '6', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0611', 'JHLB17080006', '6', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0612', 'JHLB17080006', '6', '0', null, null, '1', '2017-09-08 14:08:12', '3');
INSERT INTO `table_goods_status` VALUES ('A0101', 'JHLB17080007', '8', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0102', 'JHLB17080007', '8', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0103', 'JHLB17080007', '8', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0104', 'JHLB17080007', '8', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0105', 'JHLB17080007', '8', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0106', 'JHLB17080007', '8', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0107', 'JHLB17080007', '8', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0108', 'JHLB17080007', '8', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0109', 'JHLB17080007', '8', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0110', 'JHLB17080007', '8', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0111', 'JHLB17080007', '8', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0112', 'JHLB17080007', '8', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0201', 'JHLB17080007', '3', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0202', 'JHLB17080007', '3', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0203', 'JHLB17080007', '3', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0204', 'JHLB17080007', '3', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0205', 'JHLB17080007', '3', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0206', 'JHLB17080007', '3', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0301', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0302', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0303', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0304', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0305', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0306', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0307', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0308', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0309', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0310', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0311', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0312', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0401', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0402', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0403', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0404', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0405', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0406', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:40', '3');
INSERT INTO `table_goods_status` VALUES ('A0407', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0408', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0409', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0410', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0411', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0412', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0501', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0502', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0503', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0504', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0505', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0506', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0507', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0508', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0509', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0510', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0511', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0512', 'JHLB17080007', '5', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0601', 'JHLB17080007', '6', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0602', 'JHLB17080007', '6', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0603', 'JHLB17080007', '6', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0604', 'JHLB17080007', '6', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0605', 'JHLB17080007', '6', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0606', 'JHLB17080007', '6', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0607', 'JHLB17080007', '6', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0608', 'JHLB17080007', '6', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0609', 'JHLB17080007', '6', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0610', 'JHLB17080007', '6', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0611', 'JHLB17080007', '6', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0612', 'JHLB17080007', '6', '0', null, null, '1', '2017-09-08 14:11:44', '3');
INSERT INTO `table_goods_status` VALUES ('A0101', 'JHLB17080008', '8', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0102', 'JHLB17080008', '8', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0103', 'JHLB17080008', '8', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0104', 'JHLB17080008', '8', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0105', 'JHLB17080008', '8', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0106', 'JHLB17080008', '8', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0107', 'JHLB17080008', '8', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0108', 'JHLB17080008', '8', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0109', 'JHLB17080008', '8', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0110', 'JHLB17080008', '8', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0111', 'JHLB17080008', '8', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0112', 'JHLB17080008', '8', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0201', 'JHLB17080008', '3', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0202', 'JHLB17080008', '3', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0203', 'JHLB17080008', '3', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0204', 'JHLB17080008', '3', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0205', 'JHLB17080008', '3', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0206', 'JHLB17080008', '3', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0301', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0302', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0303', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0304', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0305', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0306', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0307', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0308', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0309', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0310', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0311', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0312', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0401', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0402', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0403', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0404', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0405', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0406', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:15:57', '3');
INSERT INTO `table_goods_status` VALUES ('A0407', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0408', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0409', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0410', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0411', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0412', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0501', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0502', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0503', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0504', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0505', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0506', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0507', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0508', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0509', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0510', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0511', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0512', 'JHLB17080008', '5', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0601', 'JHLB17080008', '6', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0602', 'JHLB17080008', '6', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0603', 'JHLB17080008', '6', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0604', 'JHLB17080008', '6', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0605', 'JHLB17080008', '6', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0606', 'JHLB17080008', '6', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0607', 'JHLB17080008', '6', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0608', 'JHLB17080008', '6', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0609', 'JHLB17080008', '6', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0610', 'JHLB17080008', '6', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0611', 'JHLB17080008', '6', '0', null, null, '1', '2017-09-08 14:16:01', '3');
INSERT INTO `table_goods_status` VALUES ('A0612', 'JHLB17080008', '6', '0', null, null, '1', '2017-09-08 14:16:01', '3');

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
  `mobile_pay_id` varchar(10) DEFAULT NULL,
  KEY `index_machine_id` (`machine_id`) USING BTREE,
  KEY `index_device_id` (`device_id`) USING BTREE,
  KEY `index_client_id` (`client_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_machine
-- ----------------------------
INSERT INTO `table_machine` VALUES ('FKHZ00000001', 'FKHZ00000001', '4a058f34-0647-4c38-9a9f-35ea32372c9b', '7', '285d29b4-aca0-496c-8750-9f8a5b360549', '2017-05-13 15:34:05', null, null, 'root', '2017-05-13 23:34:01', null, null, null, '2017-05-19 20:54:22', '1');
INSERT INTO `table_machine` VALUES ('FKHZ00000002', 'FKHZ00000002', '4a058f34-0647-4c38-9a9f-35ea32372c9b', '7', '285d29b4-aca0-496c-8750-9f8a5b360549', '2017-05-13 15:34:24', null, null, 'root', '2017-05-13 23:34:18', null, null, null, '2017-08-10 17:56:18', '1');
INSERT INTO `table_machine` VALUES ('FKHZ00000003', 'FKHZ00000003', '4a058f34-0647-4c38-9a9f-35ea32372c9b', '7', '285d29b4-aca0-496c-8750-9f8a5b360549', '2017-05-13 15:34:38', null, null, 'root', '2017-05-13 23:34:31', null, null, null, '2017-06-21 16:18:28', '1');
INSERT INTO `table_machine` VALUES ('FKHZ00000004', 'FKHZ00000004', '4a058f34-0647-4c38-9a9f-35ea32372c9b', '7', '285d29b4-aca0-496c-8750-9f8a5b360549', '2017-05-13 15:34:52', null, null, 'root', '2017-05-13 23:34:44', null, null, null, '2017-05-23 13:10:43', '1');
INSERT INTO `table_machine` VALUES ('JL5710000001', 'JL5710000001', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '9', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-06-12 04:12:07', '2018-06-12 04:12:10', null, 'root', '2017-06-12 12:13:47', 'jhl0612@qq.com', '2017-08-20 08:39:57', null, '2017-09-07 15:16:08', '1');
INSERT INTO `table_machine` VALUES ('CJLB17070001', 'CJLB17070001', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '8', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-07-01 05:17:39', '2018-07-01 05:17:41', null, 'root', '2017-07-01 13:19:25', null, null, null, '2017-09-05 16:17:18', '1');
INSERT INTO `table_machine` VALUES ('JHLA17080001', 'JHLA17080001', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '8', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-18 16:00:00', '2017-08-30 16:00:00', null, 'root', '2017-08-20 08:44:33', 'jhl0612@qq.com', '2017-08-21 10:05:34', null, '2017-09-08 16:41:54', '1');
INSERT INTO `table_machine` VALUES ('JHLA17080002', 'JHLA17080002', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '8', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-19 16:00:00', '2017-08-30 16:00:00', null, 'root', '2017-08-20 08:45:19', 'jhl0612@qq.com', '2017-08-21 10:05:44', null, '2017-09-08 16:24:30', '1');
INSERT INTO `table_machine` VALUES ('JHLA17080003', 'JHLA17080003', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '8', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:43:47', '2017-08-20 00:43:50', null, 'root', '2017-08-20 08:45:59', null, null, null, '2017-09-08 12:08:47', '1');
INSERT INTO `table_machine` VALUES ('JHLA17080004', 'JHLA17080004', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '8', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:46:42', '2017-08-20 00:46:46', null, 'root', '2017-08-20 08:48:55', null, null, null, '2017-09-08 08:53:48', '1');
INSERT INTO `table_machine` VALUES ('JHLA17080005', 'JHLA17080005', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '8', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:47:02', '2017-08-20 00:47:04', null, 'root', '2017-08-20 08:49:13', null, null, null, '2017-08-24 16:41:09', '1');
INSERT INTO `table_machine` VALUES ('JHLA17080006', 'JHLA17080006', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '8', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:47:23', '2017-08-20 00:47:25', null, 'root', '2017-08-20 08:49:34', null, null, null, '2017-08-25 11:11:57', '1');
INSERT INTO `table_machine` VALUES ('JHLA17080007', 'JHLA17080007', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '8', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:47:47', '2017-08-20 00:47:50', null, 'root', '2017-08-20 08:49:59', null, null, null, '2017-09-04 12:05:29', '1');
INSERT INTO `table_machine` VALUES ('JHLA17080008', 'JHLA17080008', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '8', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:48:09', '2017-08-20 00:48:11', null, 'root', '2017-08-20 08:50:20', null, null, null, '2017-08-26 13:42:17', '1');
INSERT INTO `table_machine` VALUES ('JHLB17080001', 'JHLB17080001', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '8', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:48:32', '2017-08-20 00:48:35', null, 'root', '2017-08-20 08:50:49', 'root', '2017-08-20 08:52:33', null, '2017-09-08 16:39:52', '1');
INSERT INTO `table_machine` VALUES ('JHLB17080002', 'JHLB17080002', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '8', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:49:17', '2018-08-20 00:49:20', null, 'root', '2017-08-20 08:51:32', null, null, null, '2017-09-08 12:29:47', '1');
INSERT INTO `table_machine` VALUES ('JHLB17080003', 'JHLB17080003', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '8', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:53:53', '2018-08-20 00:53:56', null, 'root', '2017-08-20 08:56:09', null, null, null, '2017-09-08 13:57:55', '1');
INSERT INTO `table_machine` VALUES ('JHLB17080004', 'JHLB17080004', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '8', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:54:24', '2018-08-20 00:54:27', null, 'root', '2017-08-20 08:56:39', null, null, null, '2017-09-08 12:45:34', '1');
INSERT INTO `table_machine` VALUES ('JHLB17080005', 'JHLB17080005', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '8', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:54:48', '2018-08-20 00:54:50', null, 'root', '2017-08-20 08:57:02', null, null, null, '2017-09-08 13:43:18', '1');
INSERT INTO `table_machine` VALUES ('JHLB17080006', 'JHLB17080006', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '8', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:55:33', '2018-08-20 00:55:35', null, 'root', '2017-08-20 08:57:47', null, null, null, '2017-09-08 14:22:29', '1');
INSERT INTO `table_machine` VALUES ('JHLB17080007', 'JHLB17080007', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '8', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:55:57', '2018-08-20 00:55:59', null, 'root', '2017-08-20 08:58:13', null, null, null, '2017-09-08 16:21:45', '1');
INSERT INTO `table_machine` VALUES ('JHLB17080008', 'JHLB17080008', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '8', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-20 00:56:18', '2018-08-20 00:56:20', null, 'root', '2017-08-20 08:58:31', null, null, null, '2017-09-08 14:54:04', '1');
INSERT INTO `table_machine` VALUES ('JHLB17081818', 'JHLB17081818', '6db2a816-66bf-4e06-b3db-c5aae4a87a0f', '8', 'f5170461-5c5b-4fc3-ba6d-35825eb87601', '2017-08-28 04:01:50', '2018-08-28 04:01:53', null, 'root', '2017-08-28 12:04:11', null, null, null, '2017-09-05 08:34:10', '1');
INSERT INTO `table_machine` VALUES ('HFYA1709TST1', 'HFYA1709TST1', 'f93572e5-15db-4547-a3ce-4adb148eb6ba', '16', '693d0b9f-5208-42a0-9319-9bb771b7a9c7', '2017-09-05 08:37:39', '2018-09-05 08:37:42', null, '26984728@qq.com', '2017-09-05 16:40:09', null, null, '演示机1', '2017-09-08 16:42:41', '1');
INSERT INTO `table_machine` VALUES ('ABC00000001', 'ABC00000001', '32984fed-48ac-48ad-ac02-2dd028a2beb8', '18', 'c4fdeab3-d61b-491e-b223-8b610ee02a5d', '2017-09-01 08:06:31', '2018-09-07 08:06:33', null, 'root', '2017-09-07 16:06:31', null, null, '华瑞中心点位', null, null);

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
INSERT INTO `table_machine_config` VALUES ('HFYA1709TST1', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '9', null, null, null, null, null, null, '26984728@qq.com', '2017-09-05 23:47:05', null);
INSERT INTO `table_machine_config` VALUES ('ABC00000001', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, 'root', '2017-09-07 16:07:09', null);
INSERT INTO `table_machine_config` VALUES ('JHLB17081818', '1', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, 'root', '2017-09-07 16:07:23', null);

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
INSERT INTO `table_menu` VALUES ('23', '机器销售额', '17', 'machinemoney', null);
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
INSERT INTO `table_menu` VALUES ('42', '支付配置', '39', 'payconfig', null);
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
INSERT INTO `table_mobile_pay_config` VALUES ('1', '测试移动支付配置', '2088621838347114', '7bvs5ke7to0m6064mt7tkcm1gafo9qjf', '2017042106870868', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxYzgAHv6GEr1C6a3iVZdztLYPWmiI2bVSWbel1oNLlGDvYCnbYY9zb80FqNh3toLpHNgdOrKQf4AtYxtF+aU4I0x+v29PzNQ5+QWSqa5AqYZwCXx0bbk9HXogz94uJBzs3QN1J3rm2xDi8w7KNJTDn42FBgxZV7iprhsEnnEqKI8fWb2WXB/TPguBEzaku6LFWqKfBTF50HybknXfbpiergUpZdpBGIW7CHrsBxTmkSl9A4R76kb770N2xcBmC6/gMUT4gG4OPRWKfWoXaNHSCX8T/Fv7uEANe39w59ze0XOoitxH1o60DvzSg5Mhwd7PVtPU3aLY/3Jf0cwe6cvIQIDAQAB', 'wx926450e6541e90b7', '1433899402', '52733bb6f7e024a55e30b214bb743add', '52733bb6f7e024a55e30b214bb743add', 'cert/apiclient_cert.p12', '1433899402', 'self');

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
) ENGINE=InnoDB AUTO_INCREMENT=1192 DEFAULT CHARSET=utf8;

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
INSERT INTO `table_operation` VALUES ('355', '更新客户', '2017-08-20 22:26:47', 'jhl0612@qq.com', '1a44553d-f1de-4516-8095-d1ba8c4331f8', null);
INSERT INTO `table_operation` VALUES ('356', '更新机器', '2017-08-21 10:03:36', 'jhl0612@qq.com', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('357', '更新机器', '2017-08-21 10:05:33', 'jhl0612@qq.com', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('358', '更新机器', '2017-08-21 10:05:44', 'jhl0612@qq.com', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('359', '按货道补货', '2017-08-21 10:20:22', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('360', '按货道补货', '2017-08-21 10:20:25', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('361', '机器端设置价格和库存', '2017-08-21 10:20:31', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('362', '机器端设置价格和库存', '2017-08-21 10:20:35', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('363', '机器端设置价格和库存', '2017-08-21 10:20:38', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('364', '机器端设置价格和库存', '2017-08-21 10:20:43', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('365', '机器端设置价格和库存', '2017-08-21 10:20:47', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('366', '按货道补货', '2017-08-21 11:07:26', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('367', '按货道补货', '2017-08-21 11:07:29', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('368', '机器端设置价格和库存', '2017-08-21 11:07:35', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('369', '机器端设置价格和库存', '2017-08-21 11:07:39', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('370', '机器端设置价格和库存', '2017-08-21 11:07:42', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('371', '机器端设置价格和库存', '2017-08-21 11:07:48', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('372', '机器端设置价格和库存', '2017-08-21 11:07:52', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('373', '按货道补货', '2017-08-21 13:28:27', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('374', '按货道补货', '2017-08-21 13:28:32', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('375', '机器端设置价格和库存', '2017-08-21 13:28:38', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('376', '机器端设置价格和库存', '2017-08-21 13:28:42', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('377', '机器端设置价格和库存', '2017-08-21 13:28:45', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('378', '机器端设置价格和库存', '2017-08-21 13:28:49', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('379', '机器端设置价格和库存', '2017-08-21 13:28:51', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('380', '机器端设置价格和库存', '2017-08-21 13:28:57', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('381', '机器端设置价格和库存', '2017-08-21 13:29:02', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('382', '按货道补货', '2017-08-21 15:05:51', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('383', '按货道补货', '2017-08-21 15:05:55', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('384', '机器端设置价格和库存', '2017-08-21 15:06:01', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('385', '机器端设置价格和库存', '2017-08-21 15:06:05', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('386', '机器端设置价格和库存', '2017-08-21 15:06:08', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('387', '机器端设置价格和库存', '2017-08-21 15:06:14', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('388', '机器端设置价格和库存', '2017-08-21 15:06:17', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('389', '按货道补货', '2017-08-21 17:27:46', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('390', '按货道补货', '2017-08-21 17:27:49', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('391', '按货道补货', '2017-08-21 17:28:24', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('392', '按货道补货', '2017-08-21 17:31:18', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('393', '按货道补货', '2017-08-21 17:31:21', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('394', '按货道补货', '2017-08-21 17:31:46', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('395', '按货道补货', '2017-08-22 15:09:56', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('396', '按货道补货', '2017-08-22 15:10:00', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('397', '按货道补货', '2017-08-22 15:10:04', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('398', '按货道补货', '2017-08-22 15:10:07', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('399', '机器端设置价格和库存', '2017-08-22 15:10:12', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('400', '机器端设置价格和库存', '2017-08-22 15:10:16', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('401', '机器端设置价格和库存', '2017-08-22 15:10:21', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('402', '机器端设置价格和库存', '2017-08-22 15:10:26', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('403', '机器端设置价格和库存', '2017-08-22 15:10:30', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('404', '机器端设置价格和库存', '2017-08-22 15:10:33', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('405', '机器端设置价格和库存', '2017-08-22 15:10:37', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('406', '按货道补货', '2017-08-22 15:12:27', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('407', '按货道补货', '2017-08-22 15:12:32', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('408', '按货道补货', '2017-08-22 15:12:37', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('409', '机器端设置价格和库存', '2017-08-22 15:12:41', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('410', '机器端设置价格和库存', '2017-08-22 15:12:45', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('411', '机器端设置价格和库存', '2017-08-22 15:12:51', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('412', '机器端设置价格和库存', '2017-08-22 15:12:55', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('413', '机器端设置价格和库存', '2017-08-22 15:12:58', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('414', '机器端设置价格和库存', '2017-08-22 15:13:02', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('415', '机器端设置价格和库存', '2017-08-22 15:13:05', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('416', '按货道补货', '2017-08-22 15:19:36', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('417', '按货道补货', '2017-08-22 15:19:40', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('418', '按货道补货', '2017-08-22 15:19:43', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('419', '按货道补货', '2017-08-22 15:19:47', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('420', '机器端设置价格和库存', '2017-08-22 15:19:51', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('421', '机器端设置价格和库存', '2017-08-22 15:19:56', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('422', '机器端设置价格和库存', '2017-08-22 15:20:00', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('423', '机器端设置价格和库存', '2017-08-22 15:20:04', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('424', '机器端设置价格和库存', '2017-08-22 15:20:08', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('425', '机器端设置价格和库存', '2017-08-22 15:20:13', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('426', '更新客户', '2017-08-22 15:22:47', 'jhl0612@qq.com', 'b0c03d54-6834-4472-baf3-f9728512a9e1', null);
INSERT INTO `table_operation` VALUES ('427', '新增或修改会员信息', '2017-08-22 15:23:48', 'jhl0612@qq.com', '37fe484c-57cb-4b54-bbe0-d932c4a1b916', null);
INSERT INTO `table_operation` VALUES ('428', '新增或修改用户信息', '2017-08-22 15:24:42', 'jhl0612@qq.com', '639c42f8-a07b-473c-8f56-1e68855ac441', null);
INSERT INTO `table_operation` VALUES ('429', '更新客户', '2017-08-22 15:25:27', 'jhl0612@qq.com', '1a44553d-f1de-4516-8095-d1ba8c4331f8', null);
INSERT INTO `table_operation` VALUES ('430', '更新客户', '2017-08-22 15:25:47', 'jhl0612@qq.com', 'b0c03d54-6834-4472-baf3-f9728512a9e1', null);
INSERT INTO `table_operation` VALUES ('431', '更新客户', '2017-08-22 15:26:13', 'jhl0612@qq.com', '37fe484c-57cb-4b54-bbe0-d932c4a1b916', null);
INSERT INTO `table_operation` VALUES ('432', '一键补货', '2017-08-22 15:57:37', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('433', '一键补货', '2017-08-22 15:57:39', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('434', '按货道补货', '2017-08-22 15:58:13', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('435', '按货道补货', '2017-08-22 15:58:18', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('436', '按货道补货', '2017-08-22 15:58:22', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('437', '按货道补货', '2017-08-22 15:58:25', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('438', '机器端设置价格和库存', '2017-08-22 15:58:30', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('439', '机器端设置价格和库存', '2017-08-22 15:58:34', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('440', '机器端设置价格和库存', '2017-08-22 15:58:40', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('441', '机器端设置价格和库存', '2017-08-22 15:58:50', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('442', '机器端设置价格和库存', '2017-08-22 15:59:13', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('443', '机器端设置价格和库存', '2017-08-22 16:00:27', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('444', '机器端设置价格和库存', '2017-08-22 16:00:48', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('445', '一键补货', '2017-08-22 16:05:59', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('446', '一键补货', '2017-08-22 16:06:02', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('447', '货道配置添加', '2017-08-22 16:08:33', 'jhl0612@qq.com', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('448', '按货道补货', '2017-08-22 16:11:07', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('449', '按货道补货', '2017-08-22 16:11:11', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('450', '按货道补货', '2017-08-22 16:11:14', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('451', '按货道补货', '2017-08-22 16:11:18', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('452', '机器端设置价格和库存', '2017-08-22 16:11:22', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('453', '机器端设置价格和库存', '2017-08-22 16:11:26', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('454', '机器端设置价格和库存', '2017-08-22 16:11:33', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('455', '机器端设置价格和库存', '2017-08-22 16:11:37', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('456', '机器端设置价格和库存', '2017-08-22 16:11:42', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('457', '机器端设置价格和库存', '2017-08-22 16:12:15', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('458', '机器端设置价格和库存', '2017-08-22 16:12:26', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('459', '机器端设置价格和库存', '2017-08-22 16:13:43', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('460', '按货道补货', '2017-08-22 16:28:29', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('461', '按货道补货', '2017-08-22 16:28:33', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('462', '按货道补货', '2017-08-22 16:28:37', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('463', '按货道补货', '2017-08-22 16:28:41', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('464', '机器端设置价格和库存', '2017-08-22 16:28:44', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('465', '机器端设置价格和库存', '2017-08-22 16:28:49', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('466', '机器端设置价格和库存', '2017-08-22 16:28:54', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('467', '机器端设置价格和库存', '2017-08-22 16:28:57', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('468', '机器端设置价格和库存', '2017-08-22 16:29:00', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('469', '机器端设置价格和库存', '2017-08-22 16:29:04', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('470', '机器端设置价格和库存', '2017-08-22 16:29:07', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('471', '机器端设置价格和库存', '2017-08-22 16:29:11', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('472', '按货道补货', '2017-08-22 16:42:50', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('473', '按货道补货', '2017-08-22 16:42:57', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('474', '按货道补货', '2017-08-22 16:43:00', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('475', '机器端设置价格和库存', '2017-08-22 16:43:06', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('476', '机器端设置价格和库存', '2017-08-22 16:43:10', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('477', '机器端设置价格和库存', '2017-08-22 16:43:15', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('478', '机器端设置价格和库存', '2017-08-22 16:43:19', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('479', '机器端设置价格和库存', '2017-08-22 16:43:23', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('480', '机器端设置价格和库存', '2017-08-22 16:43:26', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('481', '机器端设置价格和库存', '2017-08-22 16:43:29', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('482', '按货道补货', '2017-08-22 16:45:36', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('483', '按货道补货', '2017-08-22 16:45:39', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('484', '机器端设置价格和库存', '2017-08-22 16:45:45', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('485', '机器端设置价格和库存', '2017-08-22 16:45:50', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('486', '机器端设置价格和库存', '2017-08-22 16:45:54', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('487', '机器端设置价格和库存', '2017-08-22 16:45:59', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('488', '机器端设置价格和库存', '2017-08-22 16:46:03', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('489', '按货道补货', '2017-08-22 16:50:54', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('490', '按货道补货', '2017-08-22 16:51:01', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('491', '机器端设置价格和库存', '2017-08-22 16:51:08', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('492', '机器端设置价格和库存', '2017-08-22 16:51:12', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('493', '机器端设置价格和库存', '2017-08-22 16:51:16', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('494', '机器端设置价格和库存', '2017-08-22 16:51:21', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('495', '机器端设置价格和库存', '2017-08-22 16:51:26', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('496', '机器端设置价格和库存', '2017-08-22 16:51:32', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('497', '机器端设置价格和库存', '2017-08-22 16:51:40', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('498', '按货道补货', '2017-08-22 17:16:12', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('499', '按货道补货', '2017-08-22 17:16:17', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('500', '机器端设置价格和库存', '2017-08-22 17:16:23', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('501', '机器端设置价格和库存', '2017-08-22 17:16:27', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('502', '机器端设置价格和库存', '2017-08-22 17:16:30', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('503', '机器端设置价格和库存', '2017-08-22 17:16:34', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('504', '机器端设置价格和库存', '2017-08-22 17:16:36', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('505', '机器端设置价格和库存', '2017-08-22 17:16:43', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('506', '机器端设置价格和库存', '2017-08-22 17:16:48', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('507', '按货道补货', '2017-08-23 09:24:31', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('508', '按货道补货', '2017-08-23 09:24:35', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('509', '按货道补货', '2017-08-23 09:24:39', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('510', '按货道补货', '2017-08-23 09:24:42', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('511', '机器端设置价格和库存', '2017-08-23 09:24:46', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('512', '机器端设置价格和库存', '2017-08-23 09:24:51', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('513', '机器端设置价格和库存', '2017-08-23 09:24:55', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('514', '机器端设置价格和库存', '2017-08-23 09:24:59', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('515', '机器端设置价格和库存', '2017-08-23 09:25:02', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('516', '机器端设置价格和库存', '2017-08-23 09:25:06', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('517', '机器端设置价格和库存', '2017-08-23 09:25:09', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('518', '机器端设置价格和库存', '2017-08-23 09:25:12', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('519', '按货道补货', '2017-08-23 09:25:52', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('520', '按货道补货', '2017-08-23 09:25:56', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('521', '按货道补货', '2017-08-23 09:26:00', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('522', '按货道补货', '2017-08-23 09:26:03', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('523', '机器端设置价格和库存', '2017-08-23 09:26:08', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('524', '机器端设置价格和库存', '2017-08-23 09:26:13', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('525', '机器端设置价格和库存', '2017-08-23 09:26:17', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('526', '机器端设置价格和库存', '2017-08-23 09:26:20', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('527', '机器端设置价格和库存', '2017-08-23 09:26:24', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('528', '机器端设置价格和库存', '2017-08-23 09:26:27', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('529', '机器端设置价格和库存', '2017-08-23 09:26:31', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('530', '机器端设置价格和库存', '2017-08-23 09:26:34', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('531', '按货道补货', '2017-08-23 09:27:48', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('532', '按货道补货', '2017-08-23 09:27:53', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('533', '按货道补货', '2017-08-23 09:27:56', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('534', '按货道补货', '2017-08-23 09:28:00', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('535', '机器端设置价格和库存', '2017-08-23 09:28:04', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('536', '机器端设置价格和库存', '2017-08-23 09:28:09', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('537', '机器端设置价格和库存', '2017-08-23 09:28:13', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('538', '机器端设置价格和库存', '2017-08-23 09:28:17', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('539', '机器端设置价格和库存', '2017-08-23 09:28:20', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('540', '机器端设置价格和库存', '2017-08-23 09:28:24', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('541', '机器端设置价格和库存', '2017-08-23 09:28:27', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('542', '机器端设置价格和库存', '2017-08-23 09:28:31', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('543', '按货道补货', '2017-08-23 09:36:56', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('544', '按货道补货', '2017-08-23 09:36:59', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('545', '按货道补货', '2017-08-23 09:37:03', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('546', '按货道补货', '2017-08-23 09:37:06', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('547', '机器端设置价格和库存', '2017-08-23 09:37:11', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('548', '机器端设置价格和库存', '2017-08-23 09:37:15', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('549', '机器端设置价格和库存', '2017-08-23 09:37:21', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('550', '机器端设置价格和库存', '2017-08-23 09:37:25', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('551', '机器端设置价格和库存', '2017-08-23 09:37:28', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('552', '机器端设置价格和库存', '2017-08-23 09:37:32', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('553', '机器端设置价格和库存', '2017-08-23 09:37:35', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('554', '按货道补货', '2017-08-23 09:41:50', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('555', '按货道补货', '2017-08-23 09:41:54', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('556', '按货道补货', '2017-08-23 09:41:58', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('557', '机器端设置价格和库存', '2017-08-23 09:42:05', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('558', '机器端设置价格和库存', '2017-08-23 09:42:09', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('559', '机器端设置价格和库存', '2017-08-23 09:42:14', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('560', '机器端设置价格和库存', '2017-08-23 09:42:19', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('561', '机器端设置价格和库存', '2017-08-23 09:42:24', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('562', '机器端设置价格和库存', '2017-08-23 09:42:27', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('563', '按货道补货', '2017-08-23 09:55:19', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('564', '按货道补货', '2017-08-23 09:55:22', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('565', '机器端设置价格和库存', '2017-08-23 09:55:28', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('566', '机器端设置价格和库存', '2017-08-23 09:55:32', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('567', '机器端设置价格和库存', '2017-08-23 09:55:35', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('568', '机器端设置价格和库存', '2017-08-23 09:55:40', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('569', '机器端设置价格和库存', '2017-08-23 09:55:44', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('570', '货道配置添加', '2017-08-23 10:15:09', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('571', '一键补货', '2017-08-23 10:18:30', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('572', '一键补货', '2017-08-23 10:18:33', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('573', '按货道补货', '2017-08-23 12:55:22', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('574', '按货道补货', '2017-08-23 12:55:30', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('575', '机器端设置价格和库存', '2017-08-23 12:55:34', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('576', '机器端设置价格和库存', '2017-08-23 12:55:39', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('577', '机器端设置价格和库存', '2017-08-23 12:55:48', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('578', '机器端设置价格和库存', '2017-08-23 12:55:52', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('579', '机器端设置价格和库存', '2017-08-23 12:55:58', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('580', '按货道补货', '2017-08-23 12:56:26', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('581', '按货道补货', '2017-08-23 12:56:33', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('582', '按货道补货', '2017-08-23 12:57:31', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('583', '按货道补货', '2017-08-23 12:57:36', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('584', '机器端设置价格和库存', '2017-08-23 12:57:42', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('585', '机器端设置价格和库存', '2017-08-23 12:57:46', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('586', '机器端设置价格和库存', '2017-08-23 12:57:49', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('587', '机器端设置价格和库存', '2017-08-23 12:57:53', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('588', '机器端设置价格和库存', '2017-08-23 12:57:55', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('589', '机器端设置价格和库存', '2017-08-23 12:58:01', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('590', '机器端设置价格和库存', '2017-08-23 12:58:06', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('591', '货道配置添加', '2017-08-23 13:12:57', 'jhl0612@qq.com', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('592', '按货道补货', '2017-08-23 13:14:57', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('593', '按货道补货', '2017-08-23 13:15:01', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('594', '机器端设置价格和库存', '2017-08-23 13:15:07', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('595', '机器端设置价格和库存', '2017-08-23 13:15:11', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('596', '机器端设置价格和库存', '2017-08-23 13:15:20', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('597', '机器端设置价格和库存', '2017-08-23 13:15:25', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('598', '机器端设置价格和库存', '2017-08-23 13:15:29', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('599', '货道配置添加', '2017-08-23 13:40:22', 'jhl0612@qq.com', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('600', '货道配置添加', '2017-08-23 13:42:34', 'jhl0612@qq.com', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('601', '按货道补货', '2017-08-23 13:46:41', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('602', '按货道补货', '2017-08-23 13:46:44', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('603', '机器端设置价格和库存', '2017-08-23 13:46:50', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('604', '机器端设置价格和库存', '2017-08-23 13:46:54', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('605', '机器端设置价格和库存', '2017-08-23 13:46:57', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('606', '机器端设置价格和库存', '2017-08-23 13:47:02', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('607', '机器端设置价格和库存', '2017-08-23 13:47:06', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('608', '按货道补货', '2017-08-23 13:58:08', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('609', '按货道补货', '2017-08-23 13:58:12', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('610', '按货道补货', '2017-08-23 13:58:15', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('611', '按货道补货', '2017-08-23 13:58:19', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('612', '机器端设置价格和库存', '2017-08-23 13:58:24', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('613', '机器端设置价格和库存', '2017-08-23 13:58:28', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('614', '机器端设置价格和库存', '2017-08-23 13:58:33', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('615', '机器端设置价格和库存', '2017-08-23 13:58:37', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('616', '机器端设置价格和库存', '2017-08-23 13:58:41', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('617', '按货道补货', '2017-08-23 13:59:41', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('618', '按货道补货', '2017-08-23 13:59:45', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('619', '机器端设置价格和库存', '2017-08-23 13:59:53', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('620', '机器端设置价格和库存', '2017-08-23 13:59:58', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('621', '机器端设置价格和库存', '2017-08-23 14:00:02', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('622', '机器端设置价格和库存', '2017-08-23 14:00:09', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('623', '机器端设置价格和库存', '2017-08-23 14:00:15', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('624', '一键补货', '2017-08-23 14:39:30', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('625', '货道配置添加', '2017-08-23 16:17:41', 'jhl0612@qq.com', null, 'JHLA17080004');
INSERT INTO `table_operation` VALUES ('626', '按货道补货', '2017-08-23 16:23:12', '机器端', null, 'JHLA17080004');
INSERT INTO `table_operation` VALUES ('627', '按货道补货', '2017-08-23 16:23:18', '机器端', null, 'JHLA17080004');
INSERT INTO `table_operation` VALUES ('628', '机器端设置价格和库存', '2017-08-23 16:23:24', '机器端', null, 'JHLA17080004');
INSERT INTO `table_operation` VALUES ('629', '机器端设置价格和库存', '2017-08-23 16:23:28', '机器端', null, 'JHLA17080004');
INSERT INTO `table_operation` VALUES ('630', '机器端设置价格和库存', '2017-08-23 16:23:33', '机器端', null, 'JHLA17080004');
INSERT INTO `table_operation` VALUES ('631', '机器端设置价格和库存', '2017-08-23 16:23:40', '机器端', null, 'JHLA17080004');
INSERT INTO `table_operation` VALUES ('632', '机器端设置价格和库存', '2017-08-23 16:23:44', '机器端', null, 'JHLA17080004');
INSERT INTO `table_operation` VALUES ('633', '货道配置添加', '2017-08-23 16:33:20', 'jhl0612@qq.com', null, 'JHLA17080005');
INSERT INTO `table_operation` VALUES ('634', '按货道补货', '2017-08-23 16:36:26', '机器端', null, 'JHLA17080005');
INSERT INTO `table_operation` VALUES ('635', '按货道补货', '2017-08-23 16:36:38', '机器端', null, 'JHLA17080005');
INSERT INTO `table_operation` VALUES ('636', '机器端设置价格和库存', '2017-08-23 16:36:46', '机器端', null, 'JHLA17080005');
INSERT INTO `table_operation` VALUES ('637', '机器端设置价格和库存', '2017-08-23 16:36:52', '机器端', null, 'JHLA17080005');
INSERT INTO `table_operation` VALUES ('638', '机器端设置价格和库存', '2017-08-23 16:36:57', '机器端', null, 'JHLA17080005');
INSERT INTO `table_operation` VALUES ('639', '机器端设置价格和库存', '2017-08-23 16:37:06', '机器端', null, 'JHLA17080005');
INSERT INTO `table_operation` VALUES ('640', '机器端设置价格和库存', '2017-08-23 16:37:10', '机器端', null, 'JHLA17080005');
INSERT INTO `table_operation` VALUES ('641', '一键补货', '2017-08-24 09:55:20', '机器端', null, 'JHLA17080004');
INSERT INTO `table_operation` VALUES ('642', '一键补货', '2017-08-24 10:09:39', '机器端', null, 'JHLA17080004');
INSERT INTO `table_operation` VALUES ('643', '一键补货', '2017-08-24 10:10:06', '机器端', null, 'JHLA17080004');
INSERT INTO `table_operation` VALUES ('644', '货道配置添加', '2017-08-24 11:16:15', 'jhl0612@qq.com', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('645', '按货道补货', '2017-08-24 11:19:19', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('646', '按货道补货', '2017-08-24 11:19:23', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('647', '按货道补货', '2017-08-24 11:19:27', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('648', '按货道补货', '2017-08-24 11:19:30', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('649', '机器端设置价格和库存', '2017-08-24 11:19:35', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('650', '按货道补货', '2017-08-24 11:20:38', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('651', '按货道补货', '2017-08-24 11:20:43', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('652', '机器端设置价格和库存', '2017-08-24 11:20:49', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('653', '机器端设置价格和库存', '2017-08-24 11:20:53', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('654', '机器端设置价格和库存', '2017-08-24 11:20:56', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('655', '机器端设置价格和库存', '2017-08-24 11:21:00', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('656', '机器端设置价格和库存', '2017-08-24 11:21:02', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('657', '机器端设置价格和库存', '2017-08-24 11:21:08', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('658', '机器端设置价格和库存', '2017-08-24 11:21:13', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('659', '一键补货', '2017-08-24 12:51:10', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('660', '一键补货', '2017-08-24 12:51:13', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('661', '货道配置添加', '2017-08-24 13:23:09', 'jhl0612@qq.com', null, 'JHLA17080006');
INSERT INTO `table_operation` VALUES ('662', '货道配置添加', '2017-08-24 13:32:09', 'jhl0612@qq.com', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('663', '货道配置添加', '2017-08-24 13:35:26', 'jhl0612@qq.com', null, 'JHLA17080008');
INSERT INTO `table_operation` VALUES ('664', '货道配置添加', '2017-08-24 13:54:07', 'jhl0612@qq.com', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('665', '货道配置添加', '2017-08-24 14:35:59', 'jhl0612@qq.com', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('666', '货道配置添加', '2017-08-24 14:53:04', 'jhl0612@qq.com', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('667', '货道配置添加', '2017-08-24 14:59:08', 'jhl0612@qq.com', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('668', '一键补货', '2017-08-24 15:04:28', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('669', '一键补货', '2017-08-24 15:04:31', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('670', '货道配置添加', '2017-08-24 15:06:05', 'jhl0612@qq.com', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('671', '货道配置添加', '2017-08-24 15:10:39', 'jhl0612@qq.com', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('672', '按货道补货', '2017-08-24 16:22:45', '机器端', null, 'JHLA17080006');
INSERT INTO `table_operation` VALUES ('673', '按货道补货', '2017-08-24 16:22:48', '机器端', null, 'JHLA17080006');
INSERT INTO `table_operation` VALUES ('674', '机器端设置价格和库存', '2017-08-24 16:22:54', '机器端', null, 'JHLA17080006');
INSERT INTO `table_operation` VALUES ('675', '机器端设置价格和库存', '2017-08-24 16:22:58', '机器端', null, 'JHLA17080006');
INSERT INTO `table_operation` VALUES ('676', '机器端设置价格和库存', '2017-08-24 16:23:01', '机器端', null, 'JHLA17080006');
INSERT INTO `table_operation` VALUES ('677', '机器端设置价格和库存', '2017-08-24 16:23:06', '机器端', null, 'JHLA17080006');
INSERT INTO `table_operation` VALUES ('678', '机器端设置价格和库存', '2017-08-24 16:23:10', '机器端', null, 'JHLA17080006');
INSERT INTO `table_operation` VALUES ('679', '按货道补货', '2017-08-24 16:27:30', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('680', '按货道补货', '2017-08-24 16:27:33', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('681', '机器端设置价格和库存', '2017-08-24 16:27:39', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('682', '机器端设置价格和库存', '2017-08-24 16:27:43', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('683', '机器端设置价格和库存', '2017-08-24 16:27:46', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('684', '机器端设置价格和库存', '2017-08-24 16:27:52', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('685', '机器端设置价格和库存', '2017-08-24 16:27:55', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('686', '按货道补货', '2017-08-24 16:36:40', '机器端', null, 'JHLA17080008');
INSERT INTO `table_operation` VALUES ('687', '按货道补货', '2017-08-24 16:36:44', '机器端', null, 'JHLA17080008');
INSERT INTO `table_operation` VALUES ('688', '按货道补货', '2017-08-24 16:36:48', '机器端', null, 'JHLA17080008');
INSERT INTO `table_operation` VALUES ('689', '按货道补货', '2017-08-24 16:36:51', '机器端', null, 'JHLA17080008');
INSERT INTO `table_operation` VALUES ('690', '机器端设置价格和库存', '2017-08-24 16:36:56', '机器端', null, 'JHLA17080008');
INSERT INTO `table_operation` VALUES ('691', '按货道补货', '2017-08-24 16:38:24', '机器端', null, 'JHLA17080008');
INSERT INTO `table_operation` VALUES ('692', '按货道补货', '2017-08-24 16:38:28', '机器端', null, 'JHLA17080008');
INSERT INTO `table_operation` VALUES ('693', '机器端设置价格和库存', '2017-08-24 16:38:34', '机器端', null, 'JHLA17080008');
INSERT INTO `table_operation` VALUES ('694', '机器端设置价格和库存', '2017-08-24 16:38:38', '机器端', null, 'JHLA17080008');
INSERT INTO `table_operation` VALUES ('695', '机器端设置价格和库存', '2017-08-24 16:38:41', '机器端', null, 'JHLA17080008');
INSERT INTO `table_operation` VALUES ('696', '机器端设置价格和库存', '2017-08-24 16:38:47', '机器端', null, 'JHLA17080008');
INSERT INTO `table_operation` VALUES ('697', '机器端设置价格和库存', '2017-08-24 16:38:50', '机器端', null, 'JHLA17080008');
INSERT INTO `table_operation` VALUES ('698', '按货道补货', '2017-08-24 16:53:15', '机器端', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('699', '按货道补货', '2017-08-24 16:53:21', '机器端', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('700', '机器端设置价格和库存', '2017-08-24 16:53:26', '机器端', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('701', '机器端设置价格和库存', '2017-08-24 16:53:30', '机器端', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('702', '机器端设置价格和库存', '2017-08-24 16:53:33', '机器端', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('703', '机器端设置价格和库存', '2017-08-24 16:53:38', '机器端', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('704', '机器端设置价格和库存', '2017-08-24 16:53:40', '机器端', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('705', '机器端设置价格和库存', '2017-08-24 16:53:46', '机器端', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('706', '机器端设置价格和库存', '2017-08-24 16:53:52', '机器端', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('707', '按货道补货', '2017-08-24 16:59:37', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('708', '按货道补货', '2017-08-24 16:59:42', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('709', '按货道补货', '2017-08-24 16:59:45', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('710', '按货道补货', '2017-08-24 16:59:49', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('711', '按货道补货', '2017-08-24 17:01:03', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('712', '按货道补货', '2017-08-24 17:01:09', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('713', '机器端设置价格和库存', '2017-08-24 17:01:15', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('714', '机器端设置价格和库存', '2017-08-24 17:01:19', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('715', '机器端设置价格和库存', '2017-08-24 17:01:22', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('716', '机器端设置价格和库存', '2017-08-24 17:01:26', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('717', '机器端设置价格和库存', '2017-08-24 17:01:29', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('718', '机器端设置价格和库存', '2017-08-24 17:01:35', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('719', '机器端设置价格和库存', '2017-08-24 17:01:40', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('720', '按货道补货', '2017-08-24 17:22:39', '机器端', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('721', '按货道补货', '2017-08-24 17:22:45', '机器端', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('722', '机器端设置价格和库存', '2017-08-24 17:22:51', '机器端', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('723', '机器端设置价格和库存', '2017-08-24 17:22:55', '机器端', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('724', '机器端设置价格和库存', '2017-08-24 17:22:58', '机器端', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('725', '机器端设置价格和库存', '2017-08-24 17:23:02', '机器端', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('726', '机器端设置价格和库存', '2017-08-24 17:23:05', '机器端', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('727', '机器端设置价格和库存', '2017-08-24 17:23:10', '机器端', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('728', '机器端设置价格和库存', '2017-08-24 17:23:16', '机器端', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('729', '按货道补货', '2017-08-24 17:28:21', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('730', '按货道补货', '2017-08-24 17:28:27', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('731', '机器端设置价格和库存', '2017-08-24 17:28:34', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('732', '机器端设置价格和库存', '2017-08-24 17:28:37', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('733', '机器端设置价格和库存', '2017-08-24 17:28:41', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('734', '机器端设置价格和库存', '2017-08-24 17:28:44', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('735', '机器端设置价格和库存', '2017-08-24 17:28:47', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('736', '机器端设置价格和库存', '2017-08-24 17:28:52', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('737', '机器端设置价格和库存', '2017-08-24 17:28:58', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('738', '按货道补货', '2017-08-24 17:33:48', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('739', '按货道补货', '2017-08-24 17:33:53', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('740', '按货道补货', '2017-08-24 17:33:56', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('741', '按货道补货', '2017-08-24 17:34:00', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('742', '按货道补货', '2017-08-24 17:35:30', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('743', '按货道补货', '2017-08-24 17:35:35', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('744', '机器端设置价格和库存', '2017-08-24 17:35:42', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('745', '机器端设置价格和库存', '2017-08-24 17:35:46', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('746', '机器端设置价格和库存', '2017-08-24 17:35:50', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('747', '机器端设置价格和库存', '2017-08-24 17:35:53', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('748', '机器端设置价格和库存', '2017-08-24 17:35:56', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('749', '机器端设置价格和库存', '2017-08-24 17:36:01', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('750', '机器端设置价格和库存', '2017-08-24 17:36:07', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('751', '按货道补货', '2017-08-25 08:56:38', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('752', '一键补货', '2017-08-25 08:57:42', '机器端', null, 'JHLA17080006');
INSERT INTO `table_operation` VALUES ('753', '按货道补货', '2017-08-25 09:00:45', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('754', '按货道补货', '2017-08-25 09:00:47', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('755', '按货道补货', '2017-08-25 09:01:34', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('756', '按货道补货', '2017-08-25 09:02:11', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('757', '按货道补货', '2017-08-25 09:08:20', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('758', '按货道补货', '2017-08-25 09:08:23', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('759', '按货道补货', '2017-08-25 09:10:33', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('760', '按货道补货', '2017-08-25 09:10:36', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('761', '按货道补货', '2017-08-25 09:11:23', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('762', '按货道补货', '2017-08-25 09:15:08', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('763', '按货道补货', '2017-08-25 09:15:11', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('764', '按货道补货', '2017-08-25 09:16:25', '机器端', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('765', '一键补货', '2017-08-25 09:16:29', '机器端', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('766', '一键补货', '2017-08-25 09:17:03', '机器端', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('767', '货道配置添加', '2017-08-25 09:22:38', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('768', '货道配置添加', '2017-08-25 09:26:09', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('769', '货道配置添加', '2017-08-25 09:27:58', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('770', '货道配置添加', '2017-08-25 09:28:15', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('771', '一键补货', '2017-08-25 15:26:58', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('772', '一键补货', '2017-08-25 15:27:01', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('773', '一键补货', '2017-08-25 15:28:31', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('774', '一键补货', '2017-08-25 15:28:33', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('775', '一键补货', '2017-08-25 15:29:05', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('776', '一键补货', '2017-08-26 09:20:29', '机器端', null, 'JHLA17080008');
INSERT INTO `table_operation` VALUES ('777', '一键补货', '2017-08-26 10:16:23', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('778', '一键补货', '2017-08-26 10:16:28', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('779', '一键补货', '2017-08-26 10:36:57', '机器端', null, 'JHLA17080008');
INSERT INTO `table_operation` VALUES ('780', '新增或修改会员信息', '2017-08-26 10:58:32', 'root', 'f4a4f31b-3e86-4243-afae-b58e7217ad8c', null);
INSERT INTO `table_operation` VALUES ('781', '更新客户', '2017-08-26 10:58:56', 'root', '8c2855f9-44d2-4404-b241-b2a30b9740c2', null);
INSERT INTO `table_operation` VALUES ('782', '新增或修改会员信息', '2017-08-26 11:00:10', 'root', '315a692b-4456-4a75-8897-2f03ef730964', null);
INSERT INTO `table_operation` VALUES ('783', '新增或修改会员信息', '2017-08-26 11:01:34', 'root', 'c3bf8555-04fe-4f80-8d53-568d0f518000', null);
INSERT INTO `table_operation` VALUES ('784', '一键补货', '2017-08-26 13:14:55', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('785', '按货道补货', '2017-08-26 13:41:07', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('786', '按货道补货', '2017-08-26 13:41:11', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('787', '机器端设置价格和库存', '2017-08-26 13:41:16', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('788', '机器端设置价格和库存', '2017-08-26 13:41:20', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('789', '机器端设置价格和库存', '2017-08-26 13:41:23', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('790', '机器端设置价格和库存', '2017-08-26 13:41:29', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('791', '机器端设置价格和库存', '2017-08-26 13:41:33', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('792', '货道配置添加', '2017-08-26 23:21:32', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('793', '货道配置添加', '2017-08-26 23:22:22', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('794', '一键补货', '2017-08-28 08:40:47', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('795', '一键补货', '2017-08-28 08:40:50', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('796', '一键补货', '2017-08-28 08:43:17', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('797', '一键补货', '2017-08-28 10:04:00', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('798', '一键补货', '2017-08-28 10:23:27', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('799', '按货道补货', '2017-08-28 10:50:43', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('800', '按货道补货', '2017-08-28 10:50:47', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('801', '按货道补货', '2017-08-28 10:50:51', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('802', '按货道补货', '2017-08-28 10:50:54', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('803', '机器端设置价格和库存', '2017-08-28 10:51:00', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('804', '按货道补货', '2017-08-28 10:58:04', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('805', '按货道补货', '2017-08-28 10:58:08', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('806', '按货道补货', '2017-08-28 10:58:12', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('807', '按货道补货', '2017-08-28 10:58:15', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('808', '机器端设置价格和库存', '2017-08-28 10:58:20', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('809', '机器端设置价格和库存', '2017-08-28 10:58:24', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('810', '按货道补货', '2017-08-28 10:59:42', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('811', '按货道补货', '2017-08-28 10:59:46', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('812', '按货道补货', '2017-08-28 10:59:50', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('813', '按货道补货', '2017-08-28 10:59:53', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('814', '机器端设置价格和库存', '2017-08-28 10:59:58', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('815', '机器端设置价格和库存', '2017-08-28 11:00:02', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('816', '机器端设置价格和库存', '2017-08-28 11:00:08', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('817', '机器端设置价格和库存', '2017-08-28 11:00:12', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('818', '机器端设置价格和库存', '2017-08-28 11:00:17', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('819', '机器端设置价格和库存', '2017-08-28 11:00:21', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('820', '添加机器', '2017-08-28 12:04:11', 'root', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('821', '一键补货', '2017-08-28 12:50:28', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('822', '货道配置添加', '2017-08-28 13:14:46', 'jhl0612@qq.com', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('823', '一键补货', '2017-08-28 13:28:07', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('824', '一键补货', '2017-08-28 13:31:41', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('825', '一键补货', '2017-08-28 14:38:55', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('826', '一键补货', '2017-08-29 08:14:15', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('827', '一键补货', '2017-08-29 08:14:37', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('828', '一键补货', '2017-08-29 08:47:49', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('829', '一键补货', '2017-08-29 10:01:05', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('830', '一键补货', '2017-08-29 13:05:24', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('831', '一键补货', '2017-08-29 14:01:52', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('832', '一键补货', '2017-08-29 14:02:20', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('833', '一键补货', '2017-08-29 14:02:22', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('834', '按货道补货', '2017-08-29 14:16:22', '机器端', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('835', '按货道补货', '2017-08-29 14:16:28', '机器端', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('836', '机器端设置价格和库存', '2017-08-29 14:16:34', '机器端', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('837', '机器端设置价格和库存', '2017-08-29 14:16:37', '机器端', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('838', '机器端设置价格和库存', '2017-08-29 14:16:41', '机器端', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('839', '机器端设置价格和库存', '2017-08-29 14:16:44', '机器端', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('840', '机器端设置价格和库存', '2017-08-29 14:16:47', '机器端', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('841', '机器端设置价格和库存', '2017-08-29 14:16:52', '机器端', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('842', '机器端设置价格和库存', '2017-08-29 14:16:58', '机器端', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('843', '货道配置添加', '2017-08-30 07:55:24', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('844', '货道配置添加', '2017-08-30 07:57:38', 'jhl0612@qq.com', null, 'JL5710000001');
INSERT INTO `table_operation` VALUES ('845', '一键补货', '2017-08-30 08:06:58', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('846', '一键补货', '2017-08-30 09:05:07', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('847', '一键补货', '2017-08-30 09:05:38', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('848', '一键补货', '2017-08-30 09:42:13', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('849', '一键补货', '2017-08-30 14:04:20', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('850', '一键补货', '2017-08-30 14:15:41', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('851', '一键补货', '2017-08-30 14:19:27', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('852', '一键补货', '2017-08-30 14:19:30', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('853', '一键补货', '2017-08-30 14:19:47', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('854', '一键补货', '2017-08-31 08:07:12', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('855', '一键补货', '2017-08-31 08:08:05', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('856', '一键补货', '2017-08-31 09:37:51', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('857', '一键补货', '2017-08-31 10:06:06', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('858', '按货道补货', '2017-08-31 10:47:02', '机器端', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('859', '按货道补货', '2017-08-31 10:47:08', '机器端', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('860', '机器端设置价格和库存', '2017-08-31 10:47:14', '机器端', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('861', '机器端设置价格和库存', '2017-08-31 10:47:17', '机器端', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('862', '机器端设置价格和库存', '2017-08-31 10:47:21', '机器端', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('863', '机器端设置价格和库存', '2017-08-31 10:47:24', '机器端', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('864', '机器端设置价格和库存', '2017-08-31 10:47:27', '机器端', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('865', '机器端设置价格和库存', '2017-08-31 10:47:32', '机器端', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('866', '机器端设置价格和库存', '2017-08-31 10:47:38', '机器端', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('867', '一键补货', '2017-08-31 14:08:33', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('868', '一键补货', '2017-09-04 09:24:38', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('869', '按货道补货', '2017-09-04 09:28:37', '机器端', null, 'JHLA17080007');
INSERT INTO `table_operation` VALUES ('870', '一键补货', '2017-09-04 13:00:01', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('871', '一键补货', '2017-09-04 13:10:43', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('872', '一键补货', '2017-09-04 13:44:44', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('873', '一键补货', '2017-09-04 13:57:05', '机器端', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('874', '一键补货', '2017-09-04 14:12:05', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('875', '一键补货', '2017-09-04 14:12:08', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('876', '按货道补货', '2017-09-05 13:36:11', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('877', '按货道补货', '2017-09-05 13:36:17', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('878', '机器端设置价格和库存', '2017-09-05 13:36:23', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('879', '机器端设置价格和库存', '2017-09-05 13:36:26', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('880', '机器端设置价格和库存', '2017-09-05 13:36:30', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('881', '机器端设置价格和库存', '2017-09-05 13:36:33', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('882', '机器端设置价格和库存', '2017-09-05 13:36:36', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('883', '机器端设置价格和库存', '2017-09-05 13:36:41', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('884', '机器端设置价格和库存', '2017-09-05 13:36:47', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('885', '新增或修改会员信息', '2017-09-05 16:05:36', 'root', '8336f248-9676-4b49-bf51-03ac5b62f436', null);
INSERT INTO `table_operation` VALUES ('886', '新增或修改用户信息', '2017-09-05 16:06:29', 'root', 'ec0a53a8-723a-4042-bba7-c60e3592eb4c', null);
INSERT INTO `table_operation` VALUES ('887', '更新用户', '2017-09-05 16:06:49', 'root', '285d29b4-aca0-496c-8750-9f8a5b360549', null);
INSERT INTO `table_operation` VALUES ('888', '货道配置添加', '2017-09-05 16:15:57', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('889', '货道配置添加', '2017-09-05 16:23:09', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('890', '按货道补货', '2017-09-05 16:32:24', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('891', '按货道补货', '2017-09-05 16:32:29', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('892', '机器端设置价格和库存', '2017-09-05 16:32:35', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('893', '机器端设置价格和库存', '2017-09-05 16:32:39', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('894', '机器端设置价格和库存', '2017-09-05 16:32:43', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('895', '机器端设置价格和库存', '2017-09-05 16:32:47', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('896', '机器端设置价格和库存', '2017-09-05 16:32:49', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('897', '机器端设置价格和库存', '2017-09-05 16:32:55', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('898', '机器端设置价格和库存', '2017-09-05 16:33:00', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('899', '新增或修改会员信息', '2017-09-05 16:34:35', '26984728@qq.com', 'b50fcb5c-3154-41db-957d-5faf74a1cabb', null);
INSERT INTO `table_operation` VALUES ('900', '新增或修改用户信息', '2017-09-05 16:39:07', '26984728@qq.com', '693d0b9f-5208-42a0-9319-9bb771b7a9c7', null);
INSERT INTO `table_operation` VALUES ('901', '添加机器', '2017-09-05 16:40:09', '26984728@qq.com', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('902', '机器配置删除', '2017-09-05 16:40:27', '26984728@qq.com', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('903', '机器配置添加', '2017-09-05 16:40:27', '26984728@qq.com', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('904', '更新用户', '2017-09-05 16:42:47', 'root', 'c4fdeab3-d61b-491e-b223-8b610ee02a5d', null);
INSERT INTO `table_operation` VALUES ('905', '按货道补货', '2017-09-05 18:09:41', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('906', '按货道补货', '2017-09-05 18:09:46', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('907', '按货道补货', '2017-09-05 18:09:53', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('908', '机器端设置价格和库存', '2017-09-05 18:10:00', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('909', '机器端设置价格和库存', '2017-09-05 18:10:06', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('910', '机器端设置价格和库存', '2017-09-05 18:10:11', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('911', '机器端设置价格和库存', '2017-09-05 18:10:16', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('912', '货道配置添加', '2017-09-05 18:21:06', '26984728@qq.com', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('913', '按货道补货', '2017-09-05 18:21:26', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('914', '按货道补货', '2017-09-05 18:21:31', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('915', '按货道补货', '2017-09-05 18:21:35', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('916', '机器端设置价格和库存', '2017-09-05 18:21:41', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('917', '机器端设置价格和库存', '2017-09-05 18:21:47', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('918', '机器端设置价格和库存', '2017-09-05 18:21:51', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('919', '机器端设置价格和库存', '2017-09-05 18:21:56', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('920', '机器端设置价格和库存', '2017-09-05 18:22:02', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('921', '按货道补货', '2017-09-05 18:27:33', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('922', '按货道补货', '2017-09-05 18:27:39', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('923', '按货道补货', '2017-09-05 18:27:45', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('924', '机器端设置价格和库存', '2017-09-05 18:27:51', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('925', '机器端设置价格和库存', '2017-09-05 18:27:55', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('926', '机器端设置价格和库存', '2017-09-05 18:27:59', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('927', '机器端设置价格和库存', '2017-09-05 18:28:02', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('928', '机器端设置价格和库存', '2017-09-05 18:28:06', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('929', '机器端设置价格和库存', '2017-09-05 18:28:09', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('930', '机器端设置价格和库存', '2017-09-05 18:28:14', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('931', '机器端设置价格和库存', '2017-09-05 18:28:20', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('932', '机器端设置价格和库存', '2017-09-05 18:28:25', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('933', '机器配置删除', '2017-09-05 19:57:22', '26984728@qq.com', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('934', '机器配置添加', '2017-09-05 19:57:22', '26984728@qq.com', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('935', '一键补货', '2017-09-05 20:00:55', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('936', '按货道补货', '2017-09-05 22:07:52', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('937', '按货道补货', '2017-09-05 22:07:56', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('938', '按货道补货', '2017-09-05 22:07:59', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('939', '按货道补货', '2017-09-05 22:08:02', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('940', '机器端设置价格和库存', '2017-09-05 22:08:06', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('941', '机器端设置价格和库存', '2017-09-05 22:08:13', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('942', '机器端设置价格和库存', '2017-09-05 22:08:19', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('943', '机器端设置价格和库存', '2017-09-05 22:08:23', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('944', '机器端设置价格和库存', '2017-09-05 22:08:27', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('945', '机器端设置价格和库存', '2017-09-05 22:08:30', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('946', '按货道补货', '2017-09-05 22:09:25', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('947', '按货道补货', '2017-09-05 22:09:30', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('948', '按货道补货', '2017-09-05 22:09:33', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('949', '按货道补货', '2017-09-05 22:09:36', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('950', '机器端设置价格和库存', '2017-09-05 22:09:41', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('951', '机器端设置价格和库存', '2017-09-05 22:09:45', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('952', '机器端设置价格和库存', '2017-09-05 22:09:50', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('953', '机器端设置价格和库存', '2017-09-05 22:09:54', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('954', '机器端设置价格和库存', '2017-09-05 22:09:57', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('955', '机器端设置价格和库存', '2017-09-05 22:10:00', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('956', '机器端设置价格和库存', '2017-09-05 22:10:04', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('957', '按货道补货', '2017-09-05 22:14:32', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('958', '按货道补货', '2017-09-05 22:14:36', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('959', '按货道补货', '2017-09-05 22:14:39', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('960', '按货道补货', '2017-09-05 22:14:43', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('961', '机器端设置价格和库存', '2017-09-05 22:14:47', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('962', '机器端设置价格和库存', '2017-09-05 22:14:51', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('963', '机器端设置价格和库存', '2017-09-05 22:14:56', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('964', '按货道补货', '2017-09-05 22:17:23', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('965', '按货道补货', '2017-09-05 22:18:55', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('966', '按货道补货', '2017-09-05 22:19:19', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('967', '机器端设置价格和库存', '2017-09-05 22:19:39', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('968', '机器端设置价格和库存', '2017-09-05 22:19:42', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('969', '机器端设置价格和库存', '2017-09-05 22:19:45', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('970', '机器端设置价格和库存', '2017-09-05 22:19:48', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('971', '机器端设置价格和库存', '2017-09-05 22:19:51', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('972', '机器端设置价格和库存', '2017-09-05 22:19:54', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('973', '机器端设置价格和库存', '2017-09-05 22:19:57', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('974', '机器端设置价格和库存', '2017-09-05 22:20:00', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('975', '机器端设置价格和库存', '2017-09-05 22:20:05', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('976', '机器端设置价格和库存', '2017-09-05 22:20:09', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('977', '机器端设置价格和库存', '2017-09-05 22:20:14', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('978', '机器端设置价格和库存', '2017-09-05 22:20:17', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('979', '按货道补货', '2017-09-05 22:21:34', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('980', '按货道补货', '2017-09-05 22:22:44', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('981', '按货道补货', '2017-09-05 22:22:58', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('982', '按货道补货', '2017-09-05 22:23:18', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('983', '机器端设置价格和库存', '2017-09-05 22:23:30', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('984', '机器端设置价格和库存', '2017-09-05 22:23:35', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('985', '机器端设置价格和库存', '2017-09-05 22:23:38', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('986', '机器端设置价格和库存', '2017-09-05 22:23:41', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('987', '机器端设置价格和库存', '2017-09-05 22:23:45', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('988', '机器端设置价格和库存', '2017-09-05 22:23:48', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('989', '机器端设置价格和库存', '2017-09-05 22:23:51', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('990', '机器端设置价格和库存', '2017-09-05 22:23:54', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('991', '机器端设置价格和库存', '2017-09-05 22:23:59', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('992', '机器端设置价格和库存', '2017-09-05 22:24:04', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('993', '机器端设置价格和库存', '2017-09-05 22:24:08', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('994', '机器端设置价格和库存', '2017-09-05 22:24:11', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('995', '按货道补货', '2017-09-05 22:30:17', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('996', '按货道补货', '2017-09-05 22:30:33', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('997', '机器端设置价格和库存', '2017-09-05 22:30:40', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('998', '机器端设置价格和库存', '2017-09-05 22:30:44', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('999', '机器端设置价格和库存', '2017-09-05 22:30:48', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1000', '机器端设置价格和库存', '2017-09-05 22:30:52', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1001', '机器端设置价格和库存', '2017-09-05 22:30:57', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1002', '机器端设置价格和库存', '2017-09-05 22:31:03', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1003', '按货道补货', '2017-09-05 22:38:37', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1004', '按货道补货', '2017-09-05 22:38:42', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1005', '机器端设置价格和库存', '2017-09-05 22:38:48', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1006', '机器端设置价格和库存', '2017-09-05 22:38:53', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1007', '机器端设置价格和库存', '2017-09-05 22:38:56', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1008', '机器端设置价格和库存', '2017-09-05 22:39:02', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1009', '机器端设置价格和库存', '2017-09-05 22:39:09', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1010', '机器端设置价格和库存', '2017-09-05 22:39:14', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1011', '按货道补货', '2017-09-05 22:39:57', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1012', '按货道补货', '2017-09-05 22:40:02', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1013', '机器端设置价格和库存', '2017-09-05 22:40:09', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1014', '机器端设置价格和库存', '2017-09-05 22:40:13', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1015', '机器端设置价格和库存', '2017-09-05 22:40:17', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1016', '机器端设置价格和库存', '2017-09-05 22:40:20', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1017', '机器端设置价格和库存', '2017-09-05 22:40:26', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1018', '机器端设置价格和库存', '2017-09-05 22:40:30', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1019', '按货道补货', '2017-09-05 22:53:07', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1020', '按货道补货', '2017-09-05 22:53:11', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1021', '机器端设置价格和库存', '2017-09-05 22:53:17', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1022', '机器端设置价格和库存', '2017-09-05 22:53:21', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1023', '机器端设置价格和库存', '2017-09-05 22:53:24', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1024', '机器端设置价格和库存', '2017-09-05 22:53:28', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1025', '机器端设置价格和库存', '2017-09-05 22:53:34', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1026', '机器端设置价格和库存', '2017-09-05 22:53:37', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1027', '一键补货', '2017-09-05 23:10:56', '机器端', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1028', '更新客户', '2017-09-05 23:22:17', '26984728@qq.com', 'b50fcb5c-3154-41db-957d-5faf74a1cabb', null);
INSERT INTO `table_operation` VALUES ('1029', '机器配置删除', '2017-09-05 23:33:58', '26984728@qq.com', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1030', '机器配置添加', '2017-09-05 23:33:58', '26984728@qq.com', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1031', '机器配置删除', '2017-09-05 23:47:05', '26984728@qq.com', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1032', '机器配置添加', '2017-09-05 23:47:05', '26984728@qq.com', null, 'HFYA1709TST1');
INSERT INTO `table_operation` VALUES ('1033', '货道配置添加', '2017-09-06 08:12:02', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1034', '货道停用', '2017-09-06 08:25:31', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1035', '货道停用', '2017-09-06 08:25:33', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1036', '货道停用', '2017-09-06 08:25:37', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1037', '货道停用', '2017-09-06 08:25:38', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1038', '货道停用', '2017-09-06 08:25:40', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1039', '货道停用', '2017-09-06 08:25:41', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1040', '货道启用', '2017-09-06 08:26:45', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1041', '货道启用', '2017-09-06 08:26:46', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1042', '货道启用', '2017-09-06 08:26:49', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1043', '货道启用', '2017-09-06 08:26:50', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1044', '货道启用', '2017-09-06 08:26:51', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1045', '货道启用', '2017-09-06 08:26:53', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1046', '货道配置添加', '2017-09-06 09:18:15', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1047', '新增或修改会员信息', '2017-09-06 09:19:18', 'jhl0612@qq.com', 'ccbf938b-7924-4aac-ac4f-9a5ee92f5c69', null);
INSERT INTO `table_operation` VALUES ('1048', '更新客户', '2017-09-06 09:19:32', 'jhl0612@qq.com', 'b0c03d54-6834-4472-baf3-f9728512a9e1', null);
INSERT INTO `table_operation` VALUES ('1049', '新增或修改用户信息', '2017-09-06 09:20:47', 'jhl0612@qq.com', 'c854e041-d317-4bfa-9482-1db875119c72', null);
INSERT INTO `table_operation` VALUES ('1050', '货道配置添加', '2017-09-06 15:56:01', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1051', '货道配置添加', '2017-09-06 15:56:50', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1052', '按货道补货', '2017-09-06 16:17:44', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('1053', '按货道补货', '2017-09-06 16:17:47', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('1054', '机器端设置价格和库存', '2017-09-06 16:17:53', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('1055', '机器端设置价格和库存', '2017-09-06 16:17:57', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('1056', '机器端设置价格和库存', '2017-09-06 16:17:59', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('1057', '机器端设置价格和库存', '2017-09-06 16:18:05', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('1058', '机器端设置价格和库存', '2017-09-06 16:18:07', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('1059', '新增或修改会员信息', '2017-09-07 15:51:54', 'root', null, null);
INSERT INTO `table_operation` VALUES ('1060', '更新用户', '2017-09-07 16:03:55', 'root', 'c4fdeab3-d61b-491e-b223-8b610ee02a5d', null);
INSERT INTO `table_operation` VALUES ('1061', '新增或修改会员信息', '2017-09-07 16:04:27', 'admin', null, null);
INSERT INTO `table_operation` VALUES ('1062', '机器配置删除', '2017-09-07 16:05:53', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('1063', '删除机器', '2017-09-07 16:05:53', 'root', null, 'ABC000000001');
INSERT INTO `table_operation` VALUES ('1064', '添加机器', '2017-09-07 16:06:31', 'root', null, 'ABC00000001');
INSERT INTO `table_operation` VALUES ('1065', '机器配置删除', '2017-09-07 16:07:09', 'root', null, 'ABC00000001');
INSERT INTO `table_operation` VALUES ('1066', '机器配置添加', '2017-09-07 16:07:09', 'root', null, 'ABC00000001');
INSERT INTO `table_operation` VALUES ('1067', '机器配置删除', '2017-09-07 16:07:23', 'root', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('1068', '机器配置添加', '2017-09-07 16:07:23', 'root', null, 'JHLB17081818');
INSERT INTO `table_operation` VALUES ('1069', '按货道补货', '2017-09-07 16:11:38', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1070', '按货道补货', '2017-09-07 16:11:41', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1071', '货道配置添加', '2017-09-07 16:50:28', 'jhl0612@qq.com', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1072', '一键补货', '2017-09-07 17:00:51', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1073', '按货道补货', '2017-09-07 17:01:34', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1074', '按货道补货', '2017-09-07 17:01:37', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1075', '机器端设置价格和库存', '2017-09-07 17:01:43', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1076', '机器端设置价格和库存', '2017-09-07 17:01:46', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1077', '机器端设置价格和库存', '2017-09-07 17:01:50', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1078', '机器端设置价格和库存', '2017-09-07 17:01:53', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1079', '机器端设置价格和库存', '2017-09-07 17:01:58', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1080', '机器端设置价格和库存', '2017-09-07 17:02:02', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1081', '按货道补货', '2017-09-07 17:05:44', '机器端', null, 'JHLB17080001');
INSERT INTO `table_operation` VALUES ('1082', '按货道补货', '2017-09-08 08:10:05', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('1083', '按货道补货', '2017-09-08 08:10:07', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('1084', '机器端设置价格和库存', '2017-09-08 08:10:13', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('1085', '机器端设置价格和库存', '2017-09-08 08:10:17', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('1086', '机器端设置价格和库存', '2017-09-08 08:10:20', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('1087', '机器端设置价格和库存', '2017-09-08 08:10:25', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('1088', '机器端设置价格和库存', '2017-09-08 08:10:28', '机器端', null, 'JHLA17080001');
INSERT INTO `table_operation` VALUES ('1089', '按货道补货', '2017-09-08 08:30:13', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('1090', '按货道补货', '2017-09-08 08:30:16', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('1091', '机器端设置价格和库存', '2017-09-08 08:30:23', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('1092', '机器端设置价格和库存', '2017-09-08 08:30:27', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('1093', '机器端设置价格和库存', '2017-09-08 08:30:30', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('1094', '机器端设置价格和库存', '2017-09-08 08:30:35', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('1095', '机器端设置价格和库存', '2017-09-08 08:30:38', '机器端', null, 'JHLA17080002');
INSERT INTO `table_operation` VALUES ('1096', '按货道补货', '2017-09-08 08:45:09', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('1097', '按货道补货', '2017-09-08 08:45:12', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('1098', '机器端设置价格和库存', '2017-09-08 08:45:17', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('1099', '机器端设置价格和库存', '2017-09-08 08:45:21', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('1100', '机器端设置价格和库存', '2017-09-08 08:45:24', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('1101', '机器端设置价格和库存', '2017-09-08 08:45:29', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('1102', '机器端设置价格和库存', '2017-09-08 08:45:32', '机器端', null, 'JHLA17080003');
INSERT INTO `table_operation` VALUES ('1103', '按货道补货', '2017-09-08 12:15:33', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('1104', '按货道补货', '2017-09-08 12:15:37', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('1105', '机器端设置价格和库存', '2017-09-08 12:15:42', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('1106', '机器端设置价格和库存', '2017-09-08 12:15:46', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('1107', '机器端设置价格和库存', '2017-09-08 12:15:50', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('1108', '机器端设置价格和库存', '2017-09-08 12:15:53', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('1109', '机器端设置价格和库存', '2017-09-08 12:15:58', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('1110', '机器端设置价格和库存', '2017-09-08 12:16:02', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('1111', '按货道补货', '2017-09-08 12:16:15', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('1112', '按货道补货', '2017-09-08 12:16:19', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('1113', '机器端设置价格和库存', '2017-09-08 12:16:24', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('1114', '机器端设置价格和库存', '2017-09-08 12:16:28', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('1115', '机器端设置价格和库存', '2017-09-08 12:16:31', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('1116', '机器端设置价格和库存', '2017-09-08 12:16:34', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('1117', '机器端设置价格和库存', '2017-09-08 12:16:40', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('1118', '机器端设置价格和库存', '2017-09-08 12:16:43', '机器端', null, 'JHLB17080002');
INSERT INTO `table_operation` VALUES ('1119', '按货道补货', '2017-09-08 12:25:14', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('1120', '按货道补货', '2017-09-08 12:25:22', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('1121', '机器端设置价格和库存', '2017-09-08 12:25:29', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('1122', '机器端设置价格和库存', '2017-09-08 12:25:35', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('1123', '机器端设置价格和库存', '2017-09-08 12:25:40', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('1124', '机器端设置价格和库存', '2017-09-08 12:25:45', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('1125', '机器端设置价格和库存', '2017-09-08 12:25:52', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('1126', '机器端设置价格和库存', '2017-09-08 12:25:57', '机器端', null, 'JHLB17080003');
INSERT INTO `table_operation` VALUES ('1127', '按货道补货', '2017-09-08 12:31:39', '机器端', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('1128', '按货道补货', '2017-09-08 12:31:42', '机器端', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('1129', '机器端设置价格和库存', '2017-09-08 12:31:49', '机器端', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('1130', '机器端设置价格和库存', '2017-09-08 12:31:53', '机器端', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('1131', '机器端设置价格和库存', '2017-09-08 12:31:58', '机器端', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('1132', '机器端设置价格和库存', '2017-09-08 12:32:02', '机器端', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('1133', '机器端设置价格和库存', '2017-09-08 12:32:09', '机器端', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('1134', '机器端设置价格和库存', '2017-09-08 12:32:13', '机器端', null, 'JHLB17080004');
INSERT INTO `table_operation` VALUES ('1135', '按货道补货', '2017-09-08 12:37:00', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1136', '按货道补货', '2017-09-08 12:37:03', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1137', '机器端设置价格和库存', '2017-09-08 12:37:09', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1138', '机器端设置价格和库存', '2017-09-08 12:37:13', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1139', '机器端设置价格和库存', '2017-09-08 12:37:17', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1140', '机器端设置价格和库存', '2017-09-08 12:37:19', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1141', '机器端设置价格和库存', '2017-09-08 12:37:25', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1142', '机器端设置价格和库存', '2017-09-08 12:37:28', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1143', '按货道补货', '2017-09-08 12:37:51', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1144', '按货道补货', '2017-09-08 12:37:55', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1145', '机器端设置价格和库存', '2017-09-08 12:38:01', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1146', '机器端设置价格和库存', '2017-09-08 12:38:05', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1147', '机器端设置价格和库存', '2017-09-08 12:38:08', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1148', '机器端设置价格和库存', '2017-09-08 12:38:11', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1149', '机器端设置价格和库存', '2017-09-08 12:38:16', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1150', '机器端设置价格和库存', '2017-09-08 12:38:20', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1151', '按货道补货', '2017-09-08 12:45:42', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1152', '按货道补货', '2017-09-08 12:45:46', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1153', '机器端设置价格和库存', '2017-09-08 12:45:51', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1154', '机器端设置价格和库存', '2017-09-08 12:45:56', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1155', '机器端设置价格和库存', '2017-09-08 12:46:00', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1156', '机器端设置价格和库存', '2017-09-08 12:46:03', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1157', '机器端设置价格和库存', '2017-09-08 12:46:08', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1158', '机器端设置价格和库存', '2017-09-08 12:46:11', '机器端', null, 'JHLB17080005');
INSERT INTO `table_operation` VALUES ('1159', '按货道补货', '2017-09-08 14:08:08', '机器端', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('1160', '按货道补货', '2017-09-08 14:08:12', '机器端', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('1161', '机器端设置价格和库存', '2017-09-08 14:08:18', '机器端', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('1162', '机器端设置价格和库存', '2017-09-08 14:08:22', '机器端', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('1163', '机器端设置价格和库存', '2017-09-08 14:08:25', '机器端', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('1164', '机器端设置价格和库存', '2017-09-08 14:08:28', '机器端', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('1165', '机器端设置价格和库存', '2017-09-08 14:08:33', '机器端', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('1166', '机器端设置价格和库存', '2017-09-08 14:08:37', '机器端', null, 'JHLB17080006');
INSERT INTO `table_operation` VALUES ('1167', '按货道补货', '2017-09-08 14:10:40', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('1168', '按货道补货', '2017-09-08 14:10:43', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('1169', '机器端设置价格和库存', '2017-09-08 14:10:49', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('1170', '机器端设置价格和库存', '2017-09-08 14:10:53', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('1171', '机器端设置价格和库存', '2017-09-08 14:10:56', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('1172', '机器端设置价格和库存', '2017-09-08 14:10:59', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('1173', '机器端设置价格和库存', '2017-09-08 14:11:13', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('1174', '机器端设置价格和库存', '2017-09-08 14:11:16', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('1175', '按货道补货', '2017-09-08 14:11:40', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('1176', '按货道补货', '2017-09-08 14:11:44', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('1177', '机器端设置价格和库存', '2017-09-08 14:11:50', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('1178', '机器端设置价格和库存', '2017-09-08 14:11:54', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('1179', '机器端设置价格和库存', '2017-09-08 14:11:57', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('1180', '机器端设置价格和库存', '2017-09-08 14:12:01', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('1181', '机器端设置价格和库存', '2017-09-08 14:12:06', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('1182', '机器端设置价格和库存', '2017-09-08 14:12:09', '机器端', null, 'JHLB17080007');
INSERT INTO `table_operation` VALUES ('1183', '按货道补货', '2017-09-08 14:15:57', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('1184', '按货道补货', '2017-09-08 14:16:01', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('1185', '机器端设置价格和库存', '2017-09-08 14:16:07', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('1186', '机器端设置价格和库存', '2017-09-08 14:16:11', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('1187', '机器端设置价格和库存', '2017-09-08 14:16:15', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('1188', '机器端设置价格和库存', '2017-09-08 14:16:18', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('1189', '机器端设置价格和库存', '2017-09-08 14:16:23', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('1190', '机器端设置价格和库存', '2017-09-08 14:16:26', '机器端', null, 'JHLB17080008');
INSERT INTO `table_operation` VALUES ('1191', '机器端设置价格和库存', '2017-09-08 14:37:40', '机器端', null, 'JHLB17080007');

-- ----------------------------
-- Table structure for `table_pay_auth`
-- ----------------------------
DROP TABLE IF EXISTS `table_pay_auth`;
CREATE TABLE `table_pay_auth` (
  `pay_config_id` varchar(10) DEFAULT NULL,
  `client_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_pay_auth
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
INSERT INTO `table_pic` VALUES ('0482dcee-f815-428b-8277-23463b7bd3b4', '0000220160531144016_2017051323553881686.png', 'Attachment/0000220160531144016_2017051323553881686.png', '7');
INSERT INTO `table_pic` VALUES ('6974e7f4-5fbb-4a0e-8231-971f5e019ab5', '0000220160531144138_2017051400293160951.png', 'Attachment/0000220160531144138_2017051400293160951.png', '7');
INSERT INTO `table_pic` VALUES ('30faabe1-d85c-469f-b82c-ea5540a10661', '0000220160531143458_2017051400304432779.png', 'Attachment/0000220160531143458_2017051400304432779.png', '7');
INSERT INTO `table_pic` VALUES ('0a1cd7cd-db4e-458f-85e5-452b8d15486f', '0000220160531143707_2017051400414930791.png', 'Attachment/0000220160531143707_2017051400414930791.png', '7');
INSERT INTO `table_pic` VALUES ('19ada2b0-c3a0-4148-9d49-8734ca08307b', '0000220160531144214_2017051413492454118.png', 'Attachment/0000220160531144214_2017051413492454118.png', '7');
INSERT INTO `table_pic` VALUES ('fdf9765e-ae95-481e-92e6-2b3c947c4d7f', '0000220160531143315_2017061321215785772.png', 'Attachment/0000220160531143315_2017061321215785772.png', '8');
INSERT INTO `table_pic` VALUES ('1bf097a0-4465-404f-835b-b4c95c349adc', '0000220160531143458_2017061321235302886.png', 'Attachment/0000220160531143458_2017061321235302886.png', '8');
INSERT INTO `table_pic` VALUES ('190cded7-c207-4d3d-a9e9-6206ef5dd73b', '0000220160531143606_2017061321255515307.png', 'Attachment/0000220160531143606_2017061321255515307.png', '8');
INSERT INTO `table_pic` VALUES ('76962a94-b7de-4705-9e0e-7f6ada4fecec', '0000220160531144138_2017061321271276195.png', 'Attachment/0000220160531144138_2017061321271276195.png', '8');
INSERT INTO `table_pic` VALUES ('15bf5ea5-6f97-4964-a3df-b5cae2c617ec', '0000220160531144157_2017061321294304224.png', 'Attachment/0000220160531144157_2017061321294304224.png', '8');
INSERT INTO `table_pic` VALUES ('e460c31a-f1ea-4f2f-8bda-5bb1cb75929e', '0000220160531143520_2017061321411939716.png', 'Attachment/0000220160531143520_2017061321411939716.png', '8');
INSERT INTO `table_pic` VALUES ('7a472675-1a39-44ba-8234-6b52adebfa8b', '0000220160531144214_2017061409373030930.png', 'Attachment/0000220160531144214_2017061409373030930.png', '8');
INSERT INTO `table_pic` VALUES ('83cac065-e6eb-4c89-9892-6ad159224141', '0000220160531144016_2017061409393324680.png', 'Attachment/0000220160531144016_2017061409393324680.png', '8');
INSERT INTO `table_pic` VALUES ('63d4ab7b-f035-41b6-8021-7b4ea4c406cd', '0000220160531143742_2017061410191719992.png', 'Attachment/0000220160531143742_2017061410191719992.png', '8');
INSERT INTO `table_pic` VALUES ('c784646e-a5e1-490c-8d1d-443d2018913c', '0000220160531143934_2017061410201146555.png', 'Attachment/0000220160531143934_2017061410201146555.png', '8');
INSERT INTO `table_pic` VALUES ('42248993-fe7b-4fdf-8d8c-096e13ffacab', '老坛酸菜牛肉面_2017070714233728965.jpg', 'Attachment/老坛酸菜牛肉面_2017070714233728965.jpg', '8');
INSERT INTO `table_pic` VALUES ('9565622c-195a-4783-b2aa-98610bbfeadd', '汤达人面_2017070714252236777.jpg', 'Attachment/汤达人面_2017070714252236777.jpg', '8');
INSERT INTO `table_pic` VALUES ('3501be5f-f06d-49ba-97ca-940441770ecc', '百事可乐330mL_2017070715270683652.jpg', 'Attachment/百事可乐330mL_2017070715270683652.jpg', '8');
INSERT INTO `table_pic` VALUES ('ab78288c-2e50-4d05-a48a-0013ad278ba5', '椰树牌_2017070715304146152.jpg', 'Attachment/椰树牌_2017070715304146152.jpg', '8');
INSERT INTO `table_pic` VALUES ('3481b09f-1093-46e7-9c26-329cbf24f975', '清风纸_2017070715343200840.jpg', 'Attachment/清风纸_2017070715343200840.jpg', '8');
INSERT INTO `table_pic` VALUES ('791eca72-95d2-4549-85a0-75b9adae97d8', '可比克_2017072422015063340.jpg', 'Attachment/可比克_2017072422015063340.jpg', '8');
INSERT INTO `table_pic` VALUES ('5993ab8d-bf75-4af9-9a39-4219b7118b35', '小小酥_2017072422024855527.png', 'Attachment/小小酥_2017072422024855527.png', '8');
INSERT INTO `table_pic` VALUES ('74446b5f-04e5-461d-b08b-02ebad1993f8', '六个核桃_2017072422085785215.jpg', 'Attachment/六个核桃_2017072422085785215.jpg', '8');
INSERT INTO `table_pic` VALUES ('e205c467-0d5f-4c4d-ac2a-119bdff22807', '雪花_2017072422110899277.jpg', 'Attachment/雪花_2017072422110899277.jpg', '8');
INSERT INTO `table_pic` VALUES ('a5f05306-8c1e-4408-aed2-b7d7ea9b5a14', '挑豆_2017072506242750840.jpg', 'Attachment/挑豆_2017072506242750840.jpg', '8');
INSERT INTO `table_pic` VALUES ('819b0762-d060-4cce-8a23-57ca7eddf117', '小酥饼_2017080717160797715.jpg', 'Attachment/小酥饼_2017080717160797715.jpg', '8');
INSERT INTO `table_pic` VALUES ('37e08b31-4ba5-4bcd-a9ab-3e6b01a75813', '奥利奥_2017080717170561777.jpg', 'Attachment/奥利奥_2017080717170561777.jpg', '8');
INSERT INTO `table_pic` VALUES ('d70520d9-d14c-4ef3-bd3b-3eead0da49a3', '冰露_2017081318412543027.jpg', 'Attachment/冰露_2017081318412543027.jpg', '8');
INSERT INTO `table_pic` VALUES ('f81988d0-7c57-467d-8499-0106e5e074a1', '冰露_2017081318531374277.jpg', 'Attachment/冰露_2017081318531374277.jpg', '8');
INSERT INTO `table_pic` VALUES ('7b52dead-0b1e-431f-8867-0f16f614d91f', '美年达330_2017082509245994590.jpg', 'Attachment/美年达330_2017082509245994590.jpg', '8');
INSERT INTO `table_pic` VALUES ('68b75e77-6dab-4997-a7ac-8c1b82ac8d8e', '0000220160531144016_2017090518173083652.png', 'Attachment/0000220160531144016_2017090518173083652.png', '15');
INSERT INTO `table_pic` VALUES ('63ec0981-68ca-4636-9254-3bba042934c8', '0000220160531143606_2017090518183846152.png', 'Attachment/0000220160531143606_2017090518183846152.png', '15');

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
INSERT INTO `table_product` VALUES ('670c37a0-ba47-4e30-9784-281a25890d75', '娃哈哈纯净水', '0.01', '500.00', '瓶', '2017-05-13 15:57:47', '2018-05-13 15:57:49', '0482dcee-f815-428b-8277-23463b7bd3b4', '', '', '', '2017-05-13 23:57:54', '7', 'ysq123456@qq.com');
INSERT INTO `table_product` VALUES ('a52e1bf6-7606-44c2-8e6d-4f27496dbd7e', '王老吉', '0.01', '350.00', '罐', '2017-05-12 16:00:00', '2018-05-12 16:00:00', '6974e7f4-5fbb-4a0e-8231-971f5e019ab5', '', '', '', '2017-05-14 01:11:06', '7', 'ysq123456@qq.com');
INSERT INTO `table_product` VALUES ('48c64286-a53c-40f6-8871-b9ad71179d88', '芬达', '0.01', '350.00', '', '2017-05-13 16:33:52', '2018-05-13 16:33:54', '30faabe1-d85c-469f-b82c-ea5540a10661', '', '', '', '2017-05-14 00:33:50', '7', 'ysq123456@qq.com');
INSERT INTO `table_product` VALUES ('bbca469f-1743-4179-8f79-1d7853e21ddf', '统一鲜橙多', '0.01', '500.00', '', '2017-05-13 16:42:18', null, '0a1cd7cd-db4e-458f-85e5-452b8d15486f', '', '', '', '2017-05-14 00:42:14', '7', 'ysq123456@qq.com');
INSERT INTO `table_product` VALUES ('115af8bf-ac62-4a7e-9738-2db8629d94d8', '银鹭', '0.01', '350.00', '', null, null, '19ada2b0-c3a0-4148-9d49-8734ca08307b', '', '', '', '2017-05-14 13:49:54', '7', 'ysq123456@qq.com');
INSERT INTO `table_product` VALUES ('53053f36-6ec7-40dc-b59a-f7a024cb4a60', '百事可乐500ML', '0.01', '500.00', '', null, null, 'fdf9765e-ae95-481e-92e6-2b3c947c4d7f', '', '', '', '2017-06-13 21:22:57', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('b1f4a0aa-3f4e-4cc1-9617-02bf90261af0', '芬达330ML', '0.01', '330.00', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00', '1bf097a0-4465-404f-835b-b4c95c349adc', '', '', '', '2017-06-13 21:26:12', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('f602b953-3d4e-4d5a-95ac-f740375e014f', '农夫山泉550ML', '0.01', '550.00', '', null, null, '190cded7-c207-4d3d-a9e9-6206ef5dd73b', '', '', '', '2017-06-13 21:25:58', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('761fc0b8-4939-4a29-8c17-b3140cfb7f65', '王老吉310ML', '0.01', '310.00', '', null, null, '76962a94-b7de-4705-9e0e-7f6ada4fecec', '', '', '', '2017-06-13 21:27:14', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('e5539b94-550b-415e-8bbc-c037d96a01d1', '雪碧310ML', '0.01', '310.00', '', null, null, '15bf5ea5-6f97-4964-a3df-b5cae2c617ec', '', '', '', '2017-06-13 21:29:46', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('59c1b372-3cfb-4dea-adb6-8c6385218118', '冰红茶', '0.01', '550.00', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00', 'e460c31a-f1ea-4f2f-8bda-5bb1cb75929e', '', '', '', '2017-08-07 17:13:12', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('ab1c3466-2b80-4200-bef3-b22eddf94273', '银鹭八宝粥', '0.01', '360.00', '', null, null, '7a472675-1a39-44ba-8234-6b52adebfa8b', '', '', '', '2017-06-14 09:37:33', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('cd4c96a2-dbc1-401f-8684-31ef4e2c4319', '娃哈哈纯净水500ML', '0.01', '500.00', '', null, null, '83cac065-e6eb-4c89-9892-6ad159224141', '', '', '', '2017-06-14 09:39:34', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('35b0f112-bd95-472c-9bb7-d84806427a11', '统一绿茶500ML', '0.01', '500.00', '', null, null, '63d4ab7b-f035-41b6-8021-7b4ea4c406cd', '', '', '', '2017-06-14 10:19:18', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('d469baab-4460-4e2e-94c8-0eadbdcb34d9', '统一水晶葡萄500ML', '0.01', '500.00', '', null, null, 'c784646e-a5e1-490c-8d1d-443d2018913c', '', '', '', '2017-06-14 10:20:12', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('bf869b68-57de-4016-b150-a93b6fa7e0cd', '老坛酸菜方便面', '5.00', '120.00', '', null, null, '42248993-fe7b-4fdf-8d8c-096e13ffacab', '', '', '6个月', '2017-07-07 14:24:28', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('7d4e09d9-dd3d-423f-9b1b-1b3933fc9466', '汤达人碗面', '5.00', '135.00', '', null, null, '9565622c-195a-4783-b2aa-98610bbfeadd', '', '', '6个月', '2017-07-07 14:26:13', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('ee7a4613-1686-4f2c-87ba-8f5059ec420e', '百事可乐330mL', '5.00', '330.00', '', null, null, '3501be5f-f06d-49ba-97ca-940441770ecc', '', '', '12个月', '2017-07-07 15:27:27', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('128f6cd3-41fc-4448-8837-654d97811169', '椰树牌', '5.00', '245.00', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00', 'ab78288c-2e50-4d05-a48a-0013ad278ba5', '', '', '', '2017-07-07 15:36:49', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('e613ff5f-32f7-43aa-a793-4c7d688aac99', '清风纸', '1.50', '10.00', '', null, null, '3481b09f-1093-46e7-9c26-329cbf24f975', '', '', '', '2017-07-07 15:34:35', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('acd187d1-35c2-4e64-bf8a-8dad36508fd6', '可比克', '0.01', '60.00', '', null, null, '791eca72-95d2-4549-85a0-75b9adae97d8', '', '', '', '2017-07-24 22:01:59', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('be0a824c-18c1-45a1-acfa-d457f27a0493', '旺旺小小酥', '0.01', '30.00', '', null, null, '5993ab8d-bf75-4af9-9a39-4219b7118b35', '', '', '', '2017-07-24 22:02:50', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('00a37f7b-cbe7-4421-8113-caa72723c313', '六个核桃', '0.01', '240.00', '', null, null, '74446b5f-04e5-461d-b08b-02ebad1993f8', '', '', '', '2017-07-24 22:09:01', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('966457b3-0ce7-4cff-b371-d87cf0544579', '雪花啤酒330', '0.01', '330.00', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00', 'e205c467-0d5f-4c4d-ac2a-119bdff22807', '', '', '', '2017-07-24 22:13:54', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('6061d2d1-7120-47db-a02d-98f09c6057fc', '挑豆', '0.01', '45.00', '', null, null, 'a5f05306-8c1e-4408-aed2-b7d7ea9b5a14', '', '', '', '2017-07-25 06:24:30', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('7f8c01a5-85db-4f45-9b00-c139ef2da756', '小酥饼', '3.00', '60.00', '', null, null, '819b0762-d060-4cce-8a23-57ca7eddf117', '', '', '', '2017-08-07 17:16:29', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('f2408a65-3355-49dc-b0ad-0f98861943fa', '奥利奥', '5.00', '58.00', '', null, null, '37e08b31-4ba5-4bcd-a9ab-3e6b01a75813', '', '', '', '2017-08-07 17:17:07', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('829467a1-90d9-4d16-bb2c-4fee2a401164', '冰露', '1.70', '550.00', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00', 'f81988d0-7c57-467d-8499-0106e5e074a1', '', '', '', '2017-08-13 18:53:17', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('221097df-b77a-43ca-8568-3f3bd83e40e2', '美年达330ML', '3.00', '330.00', '', null, null, '7b52dead-0b1e-431f-8867-0f16f614d91f', '', '', '', '2017-08-25 09:25:08', '8', 'jhl0612@qq.com');
INSERT INTO `table_product` VALUES ('0c268504-8336-40ad-b1f6-a8354459ea75', '娃哈哈矿泉水', '1.00', '500.00', '', '2017-09-05 10:12:34', null, '68b75e77-6dab-4997-a7ac-8c1b82ac8d8e', '', '', '', '2017-09-05 18:17:37', '15', '26984728@qq.com');
INSERT INTO `table_product` VALUES ('688c5718-5b16-4ef5-9ed2-56d03a368ab2', '农夫山泉', '1.00', '500.00', '', '2017-09-05 10:18:07', null, '63ec0981-68ca-4636-9254-3bba042934c8', '', '', '', '2017-09-05 18:18:40', '15', '26984728@qq.com');

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
-- Table structure for `table_record_count`
-- ----------------------------
DROP TABLE IF EXISTS `table_record_count`;
CREATE TABLE `table_record_count` (
  `client_id` varchar(50) DEFAULT NULL,
  `sales_date` datetime DEFAULT NULL,
  `machine_id` varchar(50) DEFAULT NULL,
  `pay_interface` varchar(6) DEFAULT NULL,
  `trade_status` varchar(2) DEFAULT NULL,
  `trade_amount` decimal(10,2) DEFAULT NULL,
  `reality_sale_number` tinyint(4) DEFAULT NULL,
  `service_charge` decimal(6,2) DEFAULT NULL,
  `client_name` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `index_client_id` (`client_id`) USING BTREE,
  KEY `index_machine_id` (`machine_id`) USING BTREE,
  KEY `index_sales_date` (`sales_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10022 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_record_count
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
  `sales_ic_id` varchar(50) DEFAULT NULL,
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
  `service_charge` decimal(5,2) DEFAULT NULL COMMENT '手续费',
  `wares_id` varchar(50) DEFAULT NULL,
  KEY `index_machine_id` (`machine_id`) USING BTREE,
  KEY `index_sales_date` (`sales_date`)
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
INSERT INTO `table_total_money` VALUES ('30114348-cf8d-4130-acf9-a55343b80f53', '185.40', '608.42');
INSERT INTO `table_total_money` VALUES ('cb870f39-92ce-448e-982d-06a563efa64f', null, '5.47');
INSERT INTO `table_total_money` VALUES ('1a44553d-f1de-4516-8095-d1ba8c4331f8', '81.68', '276.18');

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
INSERT INTO `table_to_machine` VALUES ('CJLB17070001', 'st');
INSERT INTO `table_to_machine` VALUES ('JHLA17080004', 'p');
INSERT INTO `table_to_machine` VALUES ('JHLA17080005', 'st');
INSERT INTO `table_to_machine` VALUES ('JHLA17080005', 'p');
INSERT INTO `table_to_machine` VALUES ('JHLA17080004', 'st');
INSERT INTO `table_to_machine` VALUES ('JHLA17080006', 'p');
INSERT INTO `table_to_machine` VALUES ('JHLA17080008', 'p');
INSERT INTO `table_to_machine` VALUES ('JHLA17080006', 'st');
INSERT INTO `table_to_machine` VALUES ('JL5710000001', 'st');
INSERT INTO `table_to_machine` VALUES ('JHLA17080008', 'st');
INSERT INTO `table_to_machine` VALUES ('JHLA17080007', 'p');
INSERT INTO `table_to_machine` VALUES ('JL5710000001', 'p');
INSERT INTO `table_to_machine` VALUES ('JHLB17081818', 'st');
INSERT INTO `table_to_machine` VALUES ('JHLB17081818', 'p');
INSERT INTO `table_to_machine` VALUES ('JHLA17080007', 'st');
INSERT INTO `table_to_machine` VALUES ('HFYA1709TST1', 'p');
INSERT INTO `table_to_machine` VALUES ('HFYA1709TST1', 'st');
INSERT INTO `table_to_machine` VALUES ('ABC00000001', 't');
INSERT INTO `table_to_machine` VALUES ('JHLB17081818', 't');
INSERT INTO `table_to_machine` VALUES ('JHLB17080001', 'p');
INSERT INTO `table_to_machine` VALUES ('JHLB17080001', 'st');
INSERT INTO `table_to_machine` VALUES ('JHLA17080001', 'st');
INSERT INTO `table_to_machine` VALUES ('JHLA17080001', 'p');
INSERT INTO `table_to_machine` VALUES ('JHLA17080002', 'st');
INSERT INTO `table_to_machine` VALUES ('JHLA17080002', 'p');
INSERT INTO `table_to_machine` VALUES ('JHLA17080003', 'st');
INSERT INTO `table_to_machine` VALUES ('JHLA17080003', 'p');
INSERT INTO `table_to_machine` VALUES ('JHLB17080002', 'st');
INSERT INTO `table_to_machine` VALUES ('JHLB17080002', 'p');
INSERT INTO `table_to_machine` VALUES ('JHLB17080003', 'st');
INSERT INTO `table_to_machine` VALUES ('JHLB17080003', 'p');
INSERT INTO `table_to_machine` VALUES ('JHLB17080004', 'st');
INSERT INTO `table_to_machine` VALUES ('JHLB17080004', 'p');
INSERT INTO `table_to_machine` VALUES ('JHLB17080005', 'st');
INSERT INTO `table_to_machine` VALUES ('JHLB17080005', 'p');
INSERT INTO `table_to_machine` VALUES ('JHLB17080006', 'st');
INSERT INTO `table_to_machine` VALUES ('JHLB17080006', 'p');
INSERT INTO `table_to_machine` VALUES ('JHLB17080007', 'st');
INSERT INTO `table_to_machine` VALUES ('JHLB17080008', 'st');
INSERT INTO `table_to_machine` VALUES ('JHLB17080008', 'p');
INSERT INTO `table_to_machine` VALUES ('JHLB17080007', 'p');

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
INSERT INTO `table_user` VALUES ('c4fdeab3-d61b-491e-b223-8b610ee02a5d', 'admin', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', 'admin', 'ac59075b964b0715', '18', '2016-12-26 14:40:44', null, null, 'admin', '1');
INSERT INTO `table_user` VALUES ('285d29b4-aca0-496c-8750-9f8a5b360549', 'ysq123456@qq.com', 'a933b45b-1fb4-4cce-91c2-d35fe8f56a93', '娃哈哈', '49ba59abbe56e057', '7', '2017-05-01 22:39:09', null, null, '娃哈哈', '1');
INSERT INTO `table_user` VALUES ('f5170461-5c5b-4fc3-ba6d-35825eb87601', 'jhl0612@qq.com', '04976ff6-854a-4101-a669-115a0d64ebe2', '', '49ba59abbe56e057', '8', '2017-06-12 12:12:44', null, null, '', '1');
INSERT INTO `table_user` VALUES ('4c4d9f52-e46b-4014-b469-20f7e4a44d60', '13858108287@qq.com', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '', 'c4d86fd5364d7e45', '9', '2017-08-19 16:33:19', null, null, '', '1');
INSERT INTO `table_user` VALUES ('ac7204eb-3907-47bf-a824-01d7ba4d4102', 'wazheqing@qq.com', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '', 'ee14136407d64d46', '10', '2017-08-20 21:01:22', null, null, '', '1');
INSERT INTO `table_user` VALUES ('639c42f8-a07b-473c-8f56-1e68855ac441', '67658090@qq.com', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '', 'c4d86fd5364d7e45', '11', '2017-08-22 15:24:42', null, null, '', '1');
INSERT INTO `table_user` VALUES ('ec0a53a8-723a-4042-bba7-c60e3592eb4c', '26984728@qq.com', 'f3672253-6f0a-422d-b26d-5be3d3865a7c', '张先生', '49ba59abbe56e057', '15', '2017-09-05 16:06:29', null, null, '', '1');
INSERT INTO `table_user` VALUES ('693d0b9f-5208-42a0-9319-9bb771b7a9c7', '26984728-2@qq.com', 'a933b45b-1fb4-4cce-91c2-d35fe8f56a93', '张工', '49ba59abbe56e057', '16', '2017-09-05 16:39:07', null, null, '', '1');
INSERT INTO `table_user` VALUES ('c854e041-d317-4bfa-9482-1db875119c72', '13858108287@139.com', 'a933b45b-1fb4-4cce-91c2-d35fe8f56a93', '', 'c4d86fd5364d7e45', '17', '2017-09-06 09:20:47', null, null, '', '1');

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
      DECLARE sTemp VARCHAR(4000);
      DECLARE sTempChd VARCHAR(4000);
    
       SET sTemp = '-1';
       SET sTempChd =cast(rootId as CHAR);
    
      WHILE sTempChd is not null DO
         SET sTemp = concat(sTemp,',',sTempChd);
         SELECT group_concat(client_id) INTO sTempChd FROM table_client where FIND_IN_SET(client_father_id,sTempChd)>0;
      END WHILE;
       RETURN sTemp;
     END
;;
DELIMITER ;
