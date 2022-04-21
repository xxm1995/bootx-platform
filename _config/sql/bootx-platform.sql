/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云
 Source Server Type    : MySQL
 Source Schema         : bootx-platform-demo

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 21/04/2022 10:55:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for demo_data_encrypt
-- ----------------------------
DROP TABLE IF EXISTS `demo_data_encrypt`;
CREATE TABLE `demo_data_encrypt`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据加密解密演示' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of demo_data_encrypt
-- ----------------------------
INSERT INTO `demo_data_encrypt` VALUES (1506922411881103360, '测试加密效果', 'eI2RIrRLG+QUna3jMK+kejyJTTKdPFhaYWP4EhktJ2lkGTEsIxZesetNTzcqUA934ZN/OUdw4aj4t5Q+u1sH7A==', 1399985191002447872, '2022-03-24 17:14:35', 1399985191002447872, '2022-03-24 17:23:41', 1, 0);
INSERT INTO `demo_data_encrypt` VALUES (1506943412354408448, '测试下', 'Dgv5OSNiXuknceoZzeOUOQ==', 1399985191002447872, '2022-03-24 17:14:35', 1399985191002447872, '2022-03-24 17:23:41', 1, 0);

-- ----------------------------
-- Table structure for demo_data_perm
-- ----------------------------
DROP TABLE IF EXISTS `demo_data_perm`;
CREATE TABLE `demo_data_perm`  (
  `id` bigint(20) NOT NULL COMMENT '角色ID',
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `creator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '说明',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据权限演示' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of demo_data_perm
-- ----------------------------
INSERT INTO `demo_data_perm` VALUES (1495969849707220992, '33', 'xxm', '444', 1399985191002447872, '2022-02-22 11:53:01', 1399985191002447872, '2022-02-22 11:53:01', 0, 0);
INSERT INTO `demo_data_perm` VALUES (1506921683460521984, '测试', '小小明', NULL, 1399985191002447872, '2022-03-24 17:11:41', 1399985191002447872, '2022-03-24 17:11:41', 0, 0);

-- ----------------------------
-- Table structure for demo_data_sensitive
-- ----------------------------
DROP TABLE IF EXISTS `demo_data_sensitive`;
CREATE TABLE `demo_data_sensitive`  (
  `id` bigint(20) NOT NULL COMMENT '角色ID',
  `chinese_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中文名字',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `id_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `mobile_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `car_license` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其他',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据脱敏演示' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of demo_data_sensitive
-- ----------------------------
INSERT INTO `demo_data_sensitive` VALUES (1506942377435037696, '刘向东', '123456', '372921199302021125', '13324591123', '鲁A8S8866', 'bootx123@outlook.com', '测试测试测试测试测试测试测试问题', 1399985191002447872, '2022-03-24 18:33:55', 1399985191002447872, '2022-03-24 18:36:09', 2, 0);
INSERT INTO `demo_data_sensitive` VALUES (1506943326094352384, '成是非', '99885511', '101278112512107721', '18855446622', '汉S123456', 'chengshifei@foxmail.com', '这个就是就是就是就是就是就是这样的', 1399985191002447872, '2022-03-24 18:33:55', 1399985191002447872, '2022-03-24 18:35:00', 1, 0);

-- ----------------------------
-- Table structure for demo_super_query
-- ----------------------------
DROP TABLE IF EXISTS `demo_super_query`;
CREATE TABLE `demo_super_query`  (
  `id` bigint(20) NOT NULL COMMENT '角色ID',
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `age` int(5) NULL DEFAULT NULL COMMENT '年龄',
  `vip` bit(1) NULL DEFAULT NULL COMMENT '是否vip',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `work_time` time(0) NULL DEFAULT NULL COMMENT '上班时间',
  `registration_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `political` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '政治面貌',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '超级查询演示' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of demo_super_query
-- ----------------------------
INSERT INTO `demo_super_query` VALUES (1496046463434567680, '小小明', 18, b'1', '1998-01-23', '08:30:00', '2022-02-22 16:57:27', '13', '这是备注', 1399985191002447872, '2022-02-22 16:57:27', 1399985191002447872, '2022-02-22 17:03:34', 1, 0);
INSERT INTO `demo_super_query` VALUES (1496372341213433856, '关羽', 52, b'1', '2000-02-23', '14:31:36', '2022-02-23 14:32:22', '1', '', 1399985191002447872, '2022-02-23 14:32:22', 1399985191002447872, '2022-02-23 14:32:22', 0, 0);
INSERT INTO `demo_super_query` VALUES (1496372489909899264, '张飞', 54, b'0', '1996-02-11', '08:00:00', '2022-02-23 14:32:58', '7', '备注', 1399985191002447872, '2022-02-23 14:32:58', 1399985191002447872, '2022-02-23 14:32:58', 0, 0);
INSERT INTO `demo_super_query` VALUES (1496372766427779072, '梁冀', 38, b'1', '1958-02-08', '08:30:00', '2022-02-23 14:34:03', '1', '', 1399985191002447872, '2022-02-23 14:34:03', 1399985191002447872, '2022-02-23 14:34:03', 0, 0);
INSERT INTO `demo_super_query` VALUES (1496373512871284736, '刘备', 108, b'0', '1993-11-12', '09:30:10', '2022-02-23 14:37:01', '2', '刘羽禅的粑粑', 1399985191002447872, '2022-02-23 14:37:01', 1399985191002447872, '2022-02-23 14:37:01', 0, 0);

-- ----------------------------
-- Table structure for ding_config
-- ----------------------------
DROP TABLE IF EXISTS `ding_config`;
CREATE TABLE `ding_config`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `app_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `app_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `enable` bit(1) NOT NULL COMMENT '是否启用',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(6) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` bit(1) NOT NULL COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '钉钉配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ding_config
-- ----------------------------

-- ----------------------------
-- Table structure for ding_robot_config
-- ----------------------------
DROP TABLE IF EXISTS `ding_robot_config`;
CREATE TABLE `ding_robot_config`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钉钉机器人访问token',
  `enable_signature_check` bit(1) NOT NULL COMMENT '是否开启验签',
  `sign_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钉钉机器人私钥',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(6) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` bit(1) NOT NULL COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '钉钉机器人配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ding_robot_config
-- ----------------------------
INSERT INTO `ding_robot_config` VALUES (1454001517812203520, '33', '12', '111111111111111111', b'1', '', '', 1399985191002447872, '2021-10-29 16:25:50.547000', 1399985191002447872, '2021-10-29 16:25:50.597000', 2, b'1');

-- ----------------------------
-- Table structure for gc_category
-- ----------------------------
DROP TABLE IF EXISTS `gc_category`;
CREATE TABLE `gc_category`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类目名称',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '上级类目id',
  `ordinal` int(11) NULL DEFAULT NULL COMMENT '序号',
  `is_leaf` bit(1) NULL DEFAULT NULL COMMENT '是否叶节点',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '类目' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gc_category
-- ----------------------------
INSERT INTO `gc_category` VALUES (1394227859480010752, '数码产品', 0, 0, b'1', '数码产品', 1, '2021-05-17 17:46:39.844000', 1, '2021-05-17 17:46:39.844000', 0, b'0');
INSERT INTO `gc_category` VALUES (1394227965352632320, '笔记本', 1394227859480010752, 0, b'1', '笔记本', 1, '2021-05-17 17:47:05.099000', 1, '2021-05-17 17:47:05.099000', 0, b'0');
INSERT INTO `gc_category` VALUES (1394228080222035968, '手机', 1394227859480010752, 0, b'1', '手机', 1, '2021-05-17 17:47:32.487000', 1, '2021-05-17 17:47:32.487000', 0, b'0');

-- ----------------------------
-- Table structure for gc_category_attr
-- ----------------------------
DROP TABLE IF EXISTS `gc_category_attr`;
CREATE TABLE `gc_category_attr`  (
  `id` bigint(20) NOT NULL,
  `cid` bigint(20) NULL DEFAULT NULL COMMENT '所属类目id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type` int(11) NOT NULL COMMENT '所属类型',
  `dict_id` bigint(20) NULL DEFAULT NULL COMMENT '数据字典id',
  `is_sku` bit(1) NOT NULL COMMENT '是否 SKU 属性',
  `is_display` bit(1) NOT NULL COMMENT '是否显示属性',
  `is_search` bit(1) NOT NULL COMMENT '是否搜索属性',
  `is_required` bit(1) NOT NULL COMMENT '是否必须',
  `is_multiple` bit(1) NOT NULL COMMENT '是否多选',
  `ordinal` int(11) NOT NULL COMMENT '序号',
  `state` int(11) NOT NULL COMMENT '状态',
  `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性名称',
  `field_length` int(11) NULL DEFAULT NULL COMMENT '属性长度',
  `field_point_length` int(11) NULL DEFAULT NULL COMMENT '小数点长度',
  `field_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性类型',
  `field_default` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段默认值',
  `query_compare_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段查询时的比较方式',
  `is_key` bit(1) NULL DEFAULT NULL COMMENT '是否主键',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `target_type` int(11) NOT NULL COMMENT '目标类型 sku/spu',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `enum_values` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `display` bit(1) NULL DEFAULT NULL,
  `is_multi` bit(1) NULL DEFAULT NULL,
  `property` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `search` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '类目属性定义' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gc_category_attr
-- ----------------------------

-- ----------------------------
-- Table structure for gc_goods
-- ----------------------------
DROP TABLE IF EXISTS `gc_goods`;
CREATE TABLE `gc_goods`  (
  `id` bigint(20) NOT NULL,
  `cid` bigint(20) NULL DEFAULT NULL COMMENT '类目id',
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类目名称',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `packing` bit(1) NOT NULL COMMENT '是否是打包品',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `addition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附加参数',
  `state` int(11) NOT NULL COMMENT '状态',
  `banner_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `display_price` decimal(19, 2) NULL DEFAULT NULL,
  `goods_type` int(11) NULL DEFAULT NULL,
  `main_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sale_off_time` datetime(6) NULL DEFAULT NULL,
  `sale_on_time` datetime(6) NULL DEFAULT NULL,
  `sale_state` int(11) NULL DEFAULT NULL,
  `shop_id` bigint(20) NULL DEFAULT NULL,
  `attr_def_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr_value_displays` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr_values` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `display_lower_price` decimal(19, 2) NULL DEFAULT NULL,
  `display_upper_price` decimal(19, 2) NULL DEFAULT NULL,
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `out_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品spu' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gc_goods
-- ----------------------------
INSERT INTO `gc_goods` VALUES (1, 1, '测试类目', '测试商品', 'cs', b'0', '测试商品', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, 'cs', 199.00, 199.00, 1, '2021-04-16 13:52:41.777000', 1, '2021-04-16 13:52:41.777000', 0, b'0', NULL);

-- ----------------------------
-- Table structure for gc_goods_packing
-- ----------------------------
DROP TABLE IF EXISTS `gc_goods_packing`;
CREATE TABLE `gc_goods_packing`  (
  `id` bigint(20) NOT NULL,
  `goods_id` bigint(20) NULL DEFAULT NULL COMMENT '打包品',
  `packed_goods_id` bigint(20) NULL DEFAULT NULL COMMENT '被打包品',
  `create_time` datetime(6) NULL DEFAULT NULL,
  `creator` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品打包关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gc_goods_packing
-- ----------------------------

-- ----------------------------
-- Table structure for gc_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `gc_goods_sku`;
CREATE TABLE `gc_goods_sku`  (
  `id` bigint(20) NOT NULL,
  `cid` bigint(20) NULL DEFAULT NULL COMMENT '所属类目id',
  `goods_id` bigint(20) NULL DEFAULT NULL COMMENT '所属商品 id',
  `shop_id` bigint(20) NULL DEFAULT NULL COMMENT '所属商户',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外部编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SKU 名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `packing` bit(1) NOT NULL COMMENT '是否打包品',
  `addition` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附加信息',
  `business_id` bigint(20) NULL DEFAULT NULL COMMENT '业务id',
  `attr_def_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成此商品 SKU 的属性定义的 id 拼接串',
  `attr_values` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性值id拼接串',
  `attr_value_displays` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '示值拼接串',
  `is_unlimited` bit(1) NOT NULL COMMENT '是否无限库存',
  `capacity` int(11) NOT NULL COMMENT '初始库存',
  `locked` int(11) NOT NULL COMMENT '预占库存',
  `sold` int(11) NOT NULL COMMENT '已用库存',
  `available` int(11) NOT NULL COMMENT '可用库存',
  `sale_state` int(11) NULL DEFAULT NULL COMMENT '销售状态',
  `sale_off_time` datetime(6) NULL DEFAULT NULL COMMENT '上架时间',
  `sale_on_time` datetime(6) NULL DEFAULT NULL COMMENT '下架时间',
  `price` decimal(19, 2) NULL DEFAULT NULL COMMENT '价格',
  `state` int(11) NOT NULL COMMENT '状态',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `tid` bigint(20) NULL DEFAULT NULL,
  `out_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品sku' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gc_goods_sku
-- ----------------------------
INSERT INTO `gc_goods_sku` VALUES (1418449614855626752, 1, 1, NULL, 'cs001', '0.01元测试商品', '0.01元测试商品', b'0', NULL, NULL, '', '', NULL, b'1', 99999999, 5, 5, 99999989, NULL, NULL, NULL, 0.01, 0, 1, '2021-07-23 13:55:16.350000', 1, '2021-07-23 13:55:16.350000', 3, b'0', 10011, NULL);
INSERT INTO `gc_goods_sku` VALUES (1418449728756146176, 1, 1, NULL, 'cs01', '0.1元测试商品', '0.1元测试商品', b'0', NULL, NULL, '', '', NULL, b'1', 99999999, 0, 1, 99999998, NULL, NULL, NULL, 0.10, 0, 1, '2021-07-23 13:55:43.514000', 1, '2021-07-23 13:55:43.514000', 36, b'0', 10011, NULL);
INSERT INTO `gc_goods_sku` VALUES (1418449821873889280, 1, 1, NULL, 'cs1', '1元测试商品', '1元测试商品', b'0', NULL, NULL, '', '', NULL, b'1', 99999999, 0, 1, 99999998, NULL, NULL, NULL, 1.00, 0, 1, '2021-07-23 13:56:05.715000', 1, '2021-07-23 13:56:05.715000', 36, b'0', 10011, NULL);
INSERT INTO `gc_goods_sku` VALUES (1418449867554054144, 1, 1, NULL, 'cs2', '2元测试商品', '2元测试商品', b'0', NULL, NULL, '', '', NULL, b'1', 99999999, 0, 0, 99999999, NULL, NULL, NULL, 2.00, 0, 1, '2021-07-23 13:56:16.605000', 1, '2021-07-23 13:56:16.605000', 0, b'0', 10011, NULL);
INSERT INTO `gc_goods_sku` VALUES (1418449906091319296, 1, 1, NULL, 'cs5', '5元测试商品', '5元测试商品', b'0', NULL, NULL, '', '', NULL, b'1', 99999999, 0, 0, 99999999, NULL, NULL, NULL, 5.00, 0, 1, '2021-07-23 13:56:25.794000', 1, '2021-07-23 13:56:25.794000', 0, b'0', 10011, NULL);
INSERT INTO `gc_goods_sku` VALUES (1418450070289932288, 1, 1, NULL, 'cs50', '50元测试商品', '50元测试商品', b'0', NULL, NULL, '', '', NULL, b'1', 99999999, 0, 0, 99999999, NULL, NULL, NULL, 50.00, 0, 1, '2021-07-23 13:57:04.942000', 1, '2021-07-23 13:57:04.942000', 0, b'0', 10011, NULL);
INSERT INTO `gc_goods_sku` VALUES (1418450137004531712, 1, 1, NULL, 'cs100', '100元测试商品', '10元测试商品', b'0', NULL, NULL, '', '', NULL, b'1', 99999999, 0, 0, 99999999, NULL, NULL, NULL, 100.00, 0, 1, '2021-07-23 13:57:20.848000', 1, '2021-07-23 13:57:20.848000', 0, b'0', 10011, NULL);

-- ----------------------------
-- Table structure for gc_goods_sku_attr
-- ----------------------------
DROP TABLE IF EXISTS `gc_goods_sku_attr`;
CREATE TABLE `gc_goods_sku_attr`  (
  `id` bigint(20) NOT NULL,
  `cid` bigint(20) NULL DEFAULT NULL COMMENT '类目 id',
  `goods_id` bigint(20) NULL DEFAULT NULL COMMENT '商品 id',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT 'SKU id',
  `attr_def_id` bigint(20) NULL DEFAULT NULL COMMENT '属性定义 id',
  `attr_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性值',
  `attr_value_display` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示值',
  `tid` bigint(20) NOT NULL,
  `attr_values_display` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attr_value_displays` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'sku属性' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gc_goods_sku_attr
-- ----------------------------
INSERT INTO `gc_goods_sku_attr` VALUES (1382934955662925827, 1, 1382934955662925824, 1382934955662925826, 0, '199', NULL, 10011, NULL, '199元');

-- ----------------------------
-- Table structure for gc_goods_sku_packing
-- ----------------------------
DROP TABLE IF EXISTS `gc_goods_sku_packing`;
CREATE TABLE `gc_goods_sku_packing`  (
  `id` bigint(20) NOT NULL,
  `goods_id` bigint(20) NULL DEFAULT NULL COMMENT '打包品',
  `packed_goods_id` bigint(20) NULL DEFAULT NULL COMMENT '被打包品',
  `goods_sku_id` bigint(20) NULL DEFAULT NULL COMMENT '打包SKU',
  `packed_sku_id` bigint(20) NULL DEFAULT NULL COMMENT '被打包SKU',
  `create_time` datetime(6) NULL DEFAULT NULL,
  `creator` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `tid` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'sku打包关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gc_goods_sku_packing
-- ----------------------------

-- ----------------------------
-- Table structure for iam_client
-- ----------------------------
DROP TABLE IF EXISTS `iam_client`;
CREATE TABLE `iam_client`  (
  `id` bigint(20) NOT NULL,
  `code` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `system` bit(1) NOT NULL COMMENT '是否系统内置',
  `timeout` bigint(11) NULL DEFAULT NULL COMMENT '在线时长 秒',
  `captcha` bit(1) NOT NULL COMMENT '启用验证码',
  `enable` bit(1) NOT NULL COMMENT '是否可用',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `inx_creator`(`creator`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '认证终端' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_client
-- ----------------------------
INSERT INTO `iam_client` VALUES (1430430071299207168, 'pc', 'pc浏览器', b'1', 3600, b'0', b'1', 'pc浏览器', 1399985191002447872, '2021-08-25 15:21:20', 1399985191002447872, '2021-08-25 15:21:20', 15, 0);
INSERT INTO `iam_client` VALUES (1430478946919653376, 'miniApp', '微信小程序', b'0', 99999, b'1', b'1', NULL, 1399985191002447872, '2021-08-25 18:35:33', 1399985191002447872, '2021-08-25 18:35:33', 2, 0);
INSERT INTO `iam_client` VALUES (1435138582839009280, 'phone', '手机短信登录', b'0', 3600, b'1', b'1', '', 1399985191002447872, '2021-09-07 15:11:16', 1399985191002447872, '2021-09-07 15:11:16', 2, 0);

-- ----------------------------
-- Table structure for iam_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `iam_data_scope`;
CREATE TABLE `iam_data_scope`  (
  `id` bigint(20) NOT NULL COMMENT '角色ID',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `type` int(4) NOT NULL COMMENT '类型',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '说明',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据范围权限' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_data_scope
-- ----------------------------
INSERT INTO `iam_data_scope` VALUES (1474706893178871808, 'self', '自身数据', 1, '只能查看自身范围的数据', 1399985191002447872, '2021-12-25 19:41:37', 1399985191002447872, '2021-12-25 19:41:37', 1, 0);
INSERT INTO `iam_data_scope` VALUES (1474717084985270272, 'user', '用户数据权限', 2, '用户数据权限', 1399985191002447872, '2021-12-25 20:22:07', 1399985191002447872, '2021-12-25 20:22:07', 0, 0);
INSERT INTO `iam_data_scope` VALUES (1474717160671485952, 'dept', '部门权限', 3, '', 1399985191002447872, '2021-12-25 20:22:25', 1399985191002447872, '2021-12-25 20:22:25', 0, 0);
INSERT INTO `iam_data_scope` VALUES (1474717276908232704, 'userAndDept', '用户和部门权限', 4, '', 1399985191002447872, '2021-12-25 20:22:52', 1399985191002447872, '2021-12-25 20:22:52', 0, 0);
INSERT INTO `iam_data_scope` VALUES (1474717344562356224, 'all', '全部数据', 5, '', 1399985191002447872, '2021-12-25 20:23:09', 1399985191002447872, '2021-12-25 20:23:09', 0, 0);
INSERT INTO `iam_data_scope` VALUES (1477990268903804928, 'belong_dept', '所在部门', 6, '', 1399985191002447872, '2022-01-03 21:08:34', 1399985191002447872, '2022-01-03 21:08:35', 0, 0);
INSERT INTO `iam_data_scope` VALUES (1477990290521247744, 'belong_dept', '所在部门', 6, '', 1399985191002447872, '2022-01-03 21:08:40', 1399985191002447872, '2022-01-03 21:08:40', 0, 1);
INSERT INTO `iam_data_scope` VALUES (1477990439800721408, 'belong_dept_and_sub', '所在及下级部门', 7, '', 1399985191002447872, '2022-01-03 21:09:15', 1399985191002447872, '2022-01-03 21:09:15', 0, 0);

-- ----------------------------
-- Table structure for iam_data_scope_dept
-- ----------------------------
DROP TABLE IF EXISTS `iam_data_scope_dept`;
CREATE TABLE `iam_data_scope_dept`  (
  `id` bigint(20) NOT NULL,
  `data_scope_id` bigint(20) NOT NULL COMMENT '数据范围id',
  `dept_id` bigint(20) NOT NULL COMMENT '部门id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据范围部门关联配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_data_scope_dept
-- ----------------------------
INSERT INTO `iam_data_scope_dept` VALUES (1478742690014101504, 1474717160671485952, 1477978464559484928);
INSERT INTO `iam_data_scope_dept` VALUES (1478742920071675904, 1474717160671485952, 1477977592291053568);

-- ----------------------------
-- Table structure for iam_data_scope_user
-- ----------------------------
DROP TABLE IF EXISTS `iam_data_scope_user`;
CREATE TABLE `iam_data_scope_user`  (
  `id` bigint(20) NOT NULL,
  `data_scope_id` bigint(20) NOT NULL COMMENT '数据范围id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据范围用户关联配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_data_scope_user
-- ----------------------------
INSERT INTO `iam_data_scope_user` VALUES (1478738754876149760, 1474717084985270272, 1399985191002447872);
INSERT INTO `iam_data_scope_user` VALUES (1478738766460817408, 1474717084985270272, 1414143554414059520);
INSERT INTO `iam_data_scope_user` VALUES (1478738811792855040, 1474717084985270272, 1477997602862505984);
INSERT INTO `iam_data_scope_user` VALUES (1478747304583114752, 1474717084985270272, 1435894470432456704);
INSERT INTO `iam_data_scope_user` VALUES (1478747304587309056, 1474717084985270272, 1477997391729631232);

-- ----------------------------
-- Table structure for iam_dept
-- ----------------------------
DROP TABLE IF EXISTS `iam_dept`;
CREATE TABLE `iam_dept`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父机构ID',
  `dept_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构/部门名称',
  `sort_no` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `org_category` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '机构类别 1公司 2部门 3岗位',
  `org_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构编码',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `fax` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_depart_org_code`(`org_code`) USING BTREE,
  INDEX `uniq_depart_org_code`(`org_code`) USING BTREE,
  INDEX `index_depart_depart_order`(`sort_no`) USING BTREE,
  INDEX `index_depart_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门组织机构表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_dept
-- ----------------------------
INSERT INTO `iam_dept` VALUES (1259382878857957377, NULL, 'Bootx Platform总公司', 0, '1', '1', '', NULL, '济南市高新区齐鲁软件园', NULL, -1, '2020-05-10 15:20:51', -1, '2020-05-10 17:52:15', 4, 0);
INSERT INTO `iam_dept` VALUES (1477976804995026944, NULL, 'Bootx Cloud公司', 0, '1', '1', '', NULL, '济南市高新区汉峪金谷', '', 1399985191002447872, '2022-01-03 20:15:04', 1399985191002447872, '2022-01-03 20:15:05', 0, 1);
INSERT INTO `iam_dept` VALUES (1477977184768282624, NULL, 'Bootx Cloud公司', 0, '1', '1', '', NULL, '', '', 1399985191002447872, '2022-01-03 20:16:35', 1399985191002447872, '2022-01-03 20:16:35', 0, 1);
INSERT INTO `iam_dept` VALUES (1477977301365739520, NULL, 'Bootx Cloud总公司', 0, '1', '2', '', NULL, '济南市高新区汉峪金谷', '', 1399985191002447872, '2022-01-03 20:17:03', 1399985191002447872, '2022-01-03 20:17:03', 1, 0);
INSERT INTO `iam_dept` VALUES (1477977592291053568, 1259382878857957377, 'bp济南分公司', 0, '1', '1_1', '', NULL, '', '', 1399985191002447872, '2022-01-03 20:18:12', 1399985191002447872, '2022-01-03 20:18:12', 1, 0);
INSERT INTO `iam_dept` VALUES (1477977690928500736, 1259382878857957377, '历城分公司', 0, '1', '1_2', '', NULL, '', '', 1399985191002447872, '2022-01-03 20:18:36', 1399985191002447872, '2022-01-03 20:18:36', 0, 1);
INSERT INTO `iam_dept` VALUES (1477977827897692160, 1259382878857957377, 'bp潍坊分公司', 0, '1', '1_2', '', NULL, '', '', 1399985191002447872, '2022-01-03 20:19:08', 1399985191002447872, '2022-01-03 20:19:08', 0, 0);
INSERT INTO `iam_dept` VALUES (1477977880947249152, 1477977301365739520, 'bc菏泽分公司', 0, '1', '2_1', '', NULL, '', '', 1399985191002447872, '2022-01-03 20:19:21', 1399985191002447872, '2022-01-03 20:19:21', 0, 0);
INSERT INTO `iam_dept` VALUES (1477977930175795200, 1477977301365739520, 'bc日照分公司', 0, '1', '2_2', '', NULL, '', '', 1399985191002447872, '2022-01-03 20:19:33', 1399985191002447872, '2022-01-03 20:19:33', 0, 0);
INSERT INTO `iam_dept` VALUES (1477978464559484928, 1477977592291053568, '历城办事部', 0, '2', '1_1_1', '', NULL, '', '', 1399985191002447872, '2022-01-03 20:21:40', 1399985191002447872, '2022-01-03 20:21:40', 1, 0);
INSERT INTO `iam_dept` VALUES (1477978512177418240, 1477977592291053568, '历下办事部', 0, '2', '1_1_2', '', NULL, '', '', 1399985191002447872, '2022-01-03 20:21:51', 1399985191002447872, '2022-01-03 20:21:52', 0, 0);
INSERT INTO `iam_dept` VALUES (1477978610865197056, 1477977592291053568, '高新办事部', 0, '2', '1_1_2', '', NULL, '', '', 1399985191002447872, '2022-01-03 20:22:15', 1399985191002447872, '2022-01-03 20:22:15', 0, 0);
INSERT INTO `iam_dept` VALUES (1477978810526650368, 1477977827897692160, '奎文办事部', 0, '2', '1_2_1', '', NULL, '', '', 1399985191002447872, '2022-01-03 20:23:03', 1399985191002447872, '2022-01-03 20:23:03', 0, 0);
INSERT INTO `iam_dept` VALUES (1477978883247493120, 1477977827897692160, '潍城办事部', 0, '2', '1_2_2', '', NULL, '', '', 1399985191002447872, '2022-01-03 20:23:20', 1399985191002447872, '2022-01-03 20:23:20', 0, 0);

-- ----------------------------
-- Table structure for iam_perm_menu
-- ----------------------------
DROP TABLE IF EXISTS `iam_perm_menu`;
CREATE TABLE `iam_perm_menu`  (
  `id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由名称',
  `perm_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单权限编码',
  `effect` bit(1) NULL DEFAULT NULL COMMENT '是否有效',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `hidden` bit(1) NOT NULL COMMENT '是否隐藏',
  `hide_children_in_menu` bit(1) NOT NULL COMMENT '是否隐藏子菜单',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件',
  `component_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件名字',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单跳转地址(重定向)',
  `sort_no` double NOT NULL COMMENT '菜单排序',
  `menu_type` int(5) NOT NULL COMMENT '类型（0：一级菜单；1：子菜单 ；2：按钮权限）',
  `leaf` bit(1) NULL DEFAULT NULL COMMENT '是否叶子节点',
  `keep_alive` bit(1) NULL DEFAULT NULL COMMENT '是否缓存页面',
  `target_outside` bit(1) NULL DEFAULT NULL COMMENT '是否外部打开方式',
  `hidden_header_content` bit(1) NULL DEFAULT NULL COMMENT '隐藏的标题内容',
  `admin` bit(1) NOT NULL COMMENT '系统菜单',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限_菜单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_perm_menu
-- ----------------------------
INSERT INTO `iam_perm_menu` VALUES (1414596052497092608, NULL, '系统管理', 'system', '', NULL, 'desktop', b'0', b'0', 'RouteView', '', '/system', '/system/user', 0, 0, b'0', b'1', b'0', b'0', b'1', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2021-08-27 10:02:16', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1414596647509446656, 1452569691537256448, '用户管理', 'User', '', NULL, '', b'0', b'0', 'system/user/UserList', '', '/system/userAuth/user', '', 0, 1, b'0', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2021-08-27 10:17:40', 4, 0);
INSERT INTO `iam_perm_menu` VALUES (1414596773275652096, 1414596052497092608, '菜单管理', 'Menu', '', NULL, '', b'0', b'0', 'system/menu/MenuList', '', '/system/permission/menu', '', 0, 1, b'0', b'1', b'0', b'0', b'1', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2021-08-26 23:56:16', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1414596805538238464, 1452569339987472384, '角色管理', 'Role', '', NULL, '', b'0', b'0', 'system/role/RoleList', '', '/system/permission/role', '', 0, 1, b'1', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2021-08-26 23:56:04', 4, 0);
INSERT INTO `iam_perm_menu` VALUES (1414596842322284544, 1452569691537256448, '部门管理', 'Dept', '', NULL, '', b'0', b'0', 'system/dept/DeptList', '', '/system/userAuth/dept', '', 0, 1, b'1', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2021-08-26 23:56:31', 7, 0);
INSERT INTO `iam_perm_menu` VALUES (1414596877617352704, 1452571269199540224, '数据字典', 'Dict', '', NULL, '', b'0', b'0', 'system/dict/DictList', '', '/system/config/dict', '', 0, 1, b'1', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2021-08-26 23:42:54', 9, 0);
INSERT INTO `iam_perm_menu` VALUES (1431082258161434624, 1452569691537256448, '在线用户管理', 'OnlineUser', '', NULL, '', b'0', b'0', 'system/online/OnlineUserList', NULL, '/system/userAuth/online', '', 0, 1, b'1', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2021-08-27 10:32:53', 6, 0);
INSERT INTO `iam_perm_menu` VALUES (1431083330909208576, 1452571269199540224, '终端管理', 'Client', '', NULL, '', b'0', b'0', 'system/client/ClientList', NULL, '/system/config/client', '', 0, 1, b'1', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 10:37:09', 1399985191002447872, '2021-08-27 10:37:09', 5, 0);
INSERT INTO `iam_perm_menu` VALUES (1431089129232498688, 1452569339987472384, '请求权限管理', 'Path', '', NULL, '', b'0', b'0', 'system/path/PathList', NULL, '/system/permission/path', '', 0, 1, b'1', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 11:00:11', 1399985191002447872, '2021-08-27 11:00:11', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1431152689832525824, NULL, '系统监控', 'monitor', '', NULL, 'radar-chart', b'1', b'0', 'RouteView', NULL, '/monitor', '', 0, 0, b'1', b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2021-08-27 15:12:45', 1414143554414059520, '2021-08-27 15:12:45', 8, 0);
INSERT INTO `iam_perm_menu` VALUES (1431153358157348864, 1431152689832525824, '接口文档', 'ApiSwagger', '', NULL, '', b'0', b'0', '', NULL, 'http://gateway.dev.bootx.cn:9000/doc.html', '', 0, 1, b'1', b'1', b'1', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 15:15:25', 1399985191002447872, '2021-08-27 15:15:25', 4, 0);
INSERT INTO `iam_perm_menu` VALUES (1435143678721236992, 1452567897717321728, '登录日志', 'LoginLog', '', NULL, '', b'0', b'0', 'starter/log/LoginLogList', NULL, '/system/log/loginLog', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-07 15:31:31', 1399985191002447872, '2021-09-07 15:31:31', 5, 0);
INSERT INTO `iam_perm_menu` VALUES (1435476255797624832, 1452567897717321728, '操作日志', 'OperateLog', '', NULL, '', b'0', b'0', 'starter/log/OperateLogList', NULL, '/system/log/OperateLog', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-08 13:33:04', 1399985191002447872, '2021-09-08 13:33:04', 7, 0);
INSERT INTO `iam_perm_menu` VALUES (1438061887002759168, NULL, '通知管理', 'notice', '', NULL, 'message', b'0', b'0', 'RouteView', NULL, '/notice', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-15 16:47:26', 1399985191002447872, '2021-09-15 16:47:26', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1438072357281542144, 1438061887002759168, '邮件配置', 'MailConfig', '', NULL, '', b'0', b'0', 'notice/mail/MailConfigList', NULL, '/notice/mailConfig', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-15 17:29:03', 1399985191002447872, '2021-09-15 17:29:03', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1439196893514031104, 1438061887002759168, '消息模板', 'MessageTemplate', '', NULL, '', b'0', b'0', 'notice/template/TemplateList', NULL, '/notice/template', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-18 19:57:33', 1399985191002447872, '2021-09-18 19:57:33', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1440216178722050048, 1438061887002759168, '钉钉', 'DingTalk', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/notice/dingTalk', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-21 15:27:50', 1399985191002447872, '2021-09-21 15:27:50', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1440216612211757056, 1440216178722050048, '钉钉机器人', 'DingTalkRobot', '', NULL, '', b'0', b'0', 'notice/dingTalk/robot/DingRobotConfigList', NULL, '/notice/dingTalk/robot', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-21 15:29:33', 1399985191002447872, '2021-09-21 15:29:33', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1450473063320526848, 1452569691537256448, '第三方登录', 'Social', '', NULL, '', b'0', b'0', 'system/social/SocialList', NULL, '/system/userAuth/social', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-19 22:45:01', 1399985191002447872, '2021-10-19 22:45:01', 4, 0);
INSERT INTO `iam_perm_menu` VALUES (1450803906215886848, 1452571269199540224, '定时任务', 'QuartzJobList', '', NULL, '', b'0', b'0', 'starter/quartz/QuartzJobList', NULL, '/system/config/quartz', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 20:39:41', 1399985191002447872, '2021-10-20 20:39:41', 5, 0);
INSERT INTO `iam_perm_menu` VALUES (1450819607680991232, NULL, '第三方对接', 'social', '', b'0', 'branches', b'0', b'0', 'RouteView', NULL, '/social', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:42:04', 1399985191002447872, '2022-04-05 16:53:25', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1450821723027881984, 1450819607680991232, '微信', 'SocialWeChat', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/social/wechat', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:50:28', 1399985191002447872, '2021-10-20 21:50:28', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1450821877831254016, 1450819607680991232, '企业微信', 'SocialWeCom', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/social/wecom', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:51:05', 1399985191002447872, '2021-10-20 21:51:05', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1450822511087271936, 1450819607680991232, '钉钉', 'SocialDingTalk', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/social/dingtalk', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:53:36', 1399985191002447872, '2021-10-20 21:53:36', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1450822842995130368, NULL, '支付管理', 'PayManager', '', NULL, 'pay-circle', b'0', b'0', 'RouteView', NULL, '/payment', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:54:55', 1399985191002447872, '2021-10-20 21:54:55', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1450823960236081152, 1450822842995130368, '支付通道', 'PayChannel', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/payment/channel', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:59:22', 1399985191002447872, '2021-10-20 21:59:22', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1450824117849636864, 1450823960236081152, '支付宝', 'AliPayConfig', '', NULL, '', b'0', b'0', 'payment/channel/alipay/AliPayConfigList', NULL, '/payment/channel/alipay', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:59:59', 1399985191002447872, '2021-10-20 21:59:59', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1450824319868289024, 1450823960236081152, '微信支付', 'WeChatPayConfig', '', NULL, '', b'0', b'0', 'payment/channel/wechat/WeChatConfigList', NULL, '/payment/channel/wechat', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:00:48', 1399985191002447872, '2021-10-20 22:00:48', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1450824637876224000, 1450823960236081152, '云闪付', 'UnionPayConfig', '', b'0', '', b'0', b'0', 'payment/channel/unionpay/UnionPayConfigList', NULL, '/payment/channel/unionpay', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:02:03', 1399985191002447872, '2022-03-04 16:12:13', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1450824875198332928, 1450823960236081152, '现金支付', 'CashPayConfig', '', b'0', '', b'1', b'0', '', NULL, '/payment/channel/cash', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:03:00', 1399985191002447872, '2022-03-04 16:12:08', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1450825488577544192, 1450822842995130368, '收银台', 'PayCashier', '', NULL, '', b'0', b'0', 'payment/cashier/Cashier', NULL, '/payment/cashier', '', -1, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:05:26', 1399985191002447872, '2021-10-20 22:05:26', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1450825615857893376, 1450822842995130368, '订单管理', 'PayOrder', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/payment/order', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:05:57', 1399985191002447872, '2021-10-20 22:05:57', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1450825819436826624, 1450822842995130368, '回调记录', 'PayNotify', '', NULL, '', b'0', b'0', 'payment/notify/PayNotifyRecordList', NULL, '/payment/notify', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:06:45', 1399985191002447872, '2021-10-20 22:06:45', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1450826890318135296, 1450825615857893376, '支付订单', 'PaymentOrder', '', b'0', '', b'0', b'0', 'payment/order/payment/PaymentList', NULL, '/payment/order/payment', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:11:00', 1399985191002447872, '2022-02-25 15:17:07', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1450827159626006528, 1450825615857893376, '退款订单', 'ReturnOrder', '', b'0', '', b'0', b'0', 'payment/order/refund/RefundRecordList', NULL, '/payment/order/return', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:12:05', 1399985191002447872, '2022-03-04 15:44:06', 4, 0);
INSERT INTO `iam_perm_menu` VALUES (1450827308515409920, 1450825615857893376, '转账订单', 'TransferOrder', '', b'0', '', b'1', b'0', 'payment/order/transfer/TransferList', NULL, '/payment/order/transfer', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:12:40', 1399985191002447872, '2022-03-04 15:33:31', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1450827660459458560, 1438061887002759168, '微信', 'NoticeWeChat', '', NULL, '', b'0', b'0', '', NULL, '/notice/wechat', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:14:04', 1399985191002447872, '2021-10-20 22:14:04', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1452567897717321728, 1414596052497092608, '审计日志', 'auditLog', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/system/log', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-25 17:29:09', 1399985191002447872, '2021-10-25 17:29:09', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1452569339987472384, 1414596052497092608, '权限管理', 'permission', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/system/permission', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-25 17:34:53', 1399985191002447872, '2021-10-25 17:34:53', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1452569691537256448, 1414596052497092608, '用户信息', 'userAuth', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/system/userAuth', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-25 17:36:17', 1399985191002447872, '2021-10-25 17:36:17', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1452571269199540224, 1414596052497092608, '系统配置', 'systemConfig', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/system/config', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-25 17:42:33', 1399985191002447872, '2021-10-25 17:42:33', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1452638905302966272, 1452571269199540224, '系统参数', 'SystemParam', '', NULL, '', b'0', b'0', 'system/param/SystemParamList', NULL, '/system/config/param', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-25 22:11:18', 1399985191002447872, '2021-10-25 22:11:18', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1474694545336676352, 1452569339987472384, '数据范围权限', 'DataScope', '', NULL, '', b'0', b'0', 'system/scope/DataScopeList', NULL, '/system/permission/data', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-12-25 18:52:33', 1399985191002447872, '2021-12-25 18:52:33', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1476489893513404416, 1414596052497092608, '22', NULL, '22', b'1', NULL, b'0', b'0', NULL, NULL, NULL, NULL, 0, 2, NULL, b'0', b'0', b'0', b'0', '', 1399985191002447872, '2021-12-30 17:46:37', 1399985191002447872, '2021-12-30 17:46:37', 4, 1);
INSERT INTO `iam_perm_menu` VALUES (1478002945936015360, 1414596052497092608, '1', NULL, '1', b'1', NULL, b'0', b'0', NULL, NULL, NULL, NULL, 0, 2, NULL, b'0', b'0', b'0', b'0', '', 1399985191002447872, '2022-01-03 21:58:57', 1399985191002447872, '2022-01-03 21:58:57', 0, 1);
INSERT INTO `iam_perm_menu` VALUES (1478004271512240128, 1414596052497092608, '22', NULL, '22', b'1', NULL, b'0', b'0', NULL, NULL, NULL, NULL, 0, 2, NULL, b'0', b'0', b'0', b'0', '', 1399985191002447872, '2022-01-03 22:04:13', 1399985191002447872, '2022-01-03 22:04:13', 0, 1);
INSERT INTO `iam_perm_menu` VALUES (1480839877352476672, 1452567897717321728, '数据版本日志', 'DataVersionLog', NULL, b'0', '', b'0', b'0', 'starter/log/DataVersionLogList', NULL, '/system/log/DataVersionLog', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-01-11 17:51:54', 1399985191002447872, '2022-01-11 17:51:54', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1490984296616263680, 1452571269199540224, '文件管理', 'FIleUpLoad', NULL, b'0', '', b'0', b'0', 'starter/file/FileUploadList', NULL, '/system/config/file', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-02-08 17:42:12', 1399985191002447872, '2022-02-08 17:42:12', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1495013564652429312, 1452571269199540224, '代码生成', 'CodeGen', NULL, b'0', '', b'0', b'0', 'starter/codegen/CodeGenList', NULL, '/system/config/codeGen', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-02-19 20:33:04', 1399985191002447872, '2022-02-19 20:33:05', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1495968302034210816, NULL, '功能演示', 'Demo', NULL, b'0', 'block', b'0', b'0', 'RouteView', NULL, '/demo', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-02-22 11:46:52', 1399985191002447872, '2022-02-22 11:47:07', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1495969099987963904, 1495968302034210816, '数据相关', 'DemoData', NULL, b'0', '', b'0', b'0', 'RouteView', NULL, '/demo/data', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-02-22 11:50:02', 1399985191002447872, '2022-03-24 16:27:46', 4, 0);
INSERT INTO `iam_perm_menu` VALUES (1496020308992143360, 1495968302034210816, '超级查询', 'SuperQuery', NULL, b'0', '', b'0', b'0', 'demo/query/SuperQueryDemoList', NULL, '/demo/query/super', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-02-22 15:13:31', 1399985191002447872, '2022-02-22 15:20:48', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1501740492360962048, 1450822842995130368, '钱包管理', 'Wallet', NULL, b'0', '', b'0', b'0', 'RouteView', NULL, '/payment/wallet', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-10 10:03:29', 1399985191002447872, '2022-03-10 10:04:53', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1501742229142556672, 1501740492360962048, '钱包列表', 'WalletList', NULL, b'0', '', b'0', b'0', 'payment/wallet/list/WalletList', NULL, '/payment/wallet/list', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-10 10:10:23', 1399985191002447872, '2022-03-10 17:06:19', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1501742417378725888, 1501740492360962048, '个人钱包', 'PersonalWallet', NULL, b'0', '', b'0', b'0', 'payment/wallet/list/WalletList', NULL, '/payment/wallet/personal', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-10 10:11:08', 1399985191002447872, '2022-03-10 17:06:10', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1501847310319972352, 1450822842995130368, '组合支付', 'CombinationCashier', NULL, b'0', '', b'0', b'0', 'payment/combination/CombinationCashier', NULL, '/payment/combination', '', -0.5, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-10 17:07:56', 1399985191002447872, '2022-03-10 17:09:28', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1502926397176242176, 1450822842995130368, '储值卡', 'Voucher', NULL, b'0', '', b'0', b'0', 'payment/voucher/VoucherList', NULL, '/payment/voucher', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-13 16:35:51', 1399985191002447872, '2022-03-14 19:39:45', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1506910599819165696, 1495969099987963904, '数据权限', 'DataPermDemoList', NULL, b'0', '', b'0', b'0', 'demo/data/perm/DataPermDemoList', NULL, '/demo/data/perm', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-24 16:27:39', 1399985191002447872, '2022-03-24 16:28:56', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1506910885463851008, 1495969099987963904, '加密解密', 'DataEncryptDemo', NULL, b'0', '', b'0', b'0', 'demo/data/encrypt/DataEncryptDemoList', NULL, '/demo/data/encrypt', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-24 16:28:47', 1399985191002447872, '2022-03-24 16:28:47', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1506911113394913280, 1495969099987963904, '数据脱敏', 'DataSensitiveDemo', NULL, b'0', '', b'0', b'0', 'demo/data/sensitive/DataSensitiveDemoList', NULL, '/demo/data/sensitive', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-24 16:29:41', 1399985191002447872, '2022-03-24 17:16:03', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1507998458886197248, 1495968302034210816, 'WS演示', 'WebsocketDemo', NULL, b'0', '', b'0', b'0', 'demo/ws/WebsocketDemo', NULL, '/demo/ws', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-27 16:30:25', 1399985191002447872, '2022-03-27 16:30:25', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1509488473583562752, 1495968302034210816, '幂等请求演示', 'Idempotent', NULL, b'0', '', b'0', b'0', 'demo/idempotent/Idempotent', NULL, '/demo/idempotent', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-31 19:11:12', 1399985191002447872, '2022-03-31 19:11:12', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1511266086400524288, 1450822511087271936, '钉钉配置', 'DingTalkConfig', NULL, b'0', '', b'0', b'0', 'social/dingtalk/config/DingTalkConfigList', NULL, '/social/dingtalk/config', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-04-05 16:54:48', 1399985191002447872, '2022-04-05 16:54:48', 0, 0);

-- ----------------------------
-- Table structure for iam_perm_path
-- ----------------------------
DROP TABLE IF EXISTS `iam_perm_path`;
CREATE TABLE `iam_perm_path`  (
  `id` bigint(20) NOT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限标识',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `request_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求类型',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求路径',
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `enable` bit(1) NOT NULL COMMENT '启用状态',
  `generate` bit(1) NOT NULL COMMENT '是否通过系统生成的权限',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `inx_creator`(`creator`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限_请求' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_perm_path
-- ----------------------------
INSERT INTO `iam_perm_path` VALUES (1501754047214862336, 'UserRoleController#findRolesByUser', '根据用户ID获取到角色集合', 'GET', '/user/role/findRolesByUser', '用户角色管理', b'1', b'1', '用户角色管理 根据用户ID获取到角色集合', 0, '2022-03-10 10:57:20.755000', 0, '2022-03-10 10:57:20.761000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047273582592, 'RoleController#dropdown', '角色下拉框', 'GET', '/role/dropdown', '角色管理', b'1', b'1', '角色管理 角色下拉框', 0, '2022-03-10 10:57:20.767000', 0, '2022-03-10 10:57:20.767000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047277776896, 'DictionaryController#add', '添加', 'POST', '/dict/add', '字典', b'1', b'1', '字典 添加', 0, '2022-03-10 10:57:20.768000', 0, '2022-03-10 10:57:20.768000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047281971200, 'GoodsSkuController#findByGoodsId', '根据goodsId查询', 'GET', '/sku/findByGoodsId', 'sku操作', b'1', b'1', 'sku操作 根据goodsId查询', 0, '2022-03-10 10:57:20.769000', 0, '2022-03-10 10:57:20.769000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047286165504, 'RoleMenuController#save', '保存请求权限关系', 'POST', '/role/menu/save', '角色菜单权限关系', b'1', b'1', '角色菜单权限关系 保存请求权限关系', 0, '2022-03-10 10:57:20.770000', 0, '2022-03-10 10:57:20.770000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047290359808, 'PaymentController#superPage', '分页查询(超级查询)', 'POST', '/payment/superPage', '支付记录', b'1', b'1', '支付记录 分页查询(超级查询)', 0, '2022-03-10 10:57:20.771000', 0, '2022-03-10 10:57:20.771000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047294554112, 'UserSocialLoginController#findById', '获取详情', 'POST', '/user/social/findById', '用户三方登录管理', b'1', b'1', '用户三方登录管理 获取详情', 0, '2022-03-10 10:57:20.772000', 0, '2022-03-10 10:57:20.772000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047298748416, 'RoleController#findById', '通过ID查询角色', 'GET', '/role/findById', '角色管理', b'1', b'1', '角色管理 通过ID查询角色', 0, '2022-03-10 10:57:20.773000', 0, '2022-03-10 10:57:20.773000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047307137024, 'PermPathController#findAll', '权限列表', 'GET', '/perm/path/findAll', '请求权限资源', b'1', b'1', '请求权限资源 权限列表', 0, '2022-03-10 10:57:20.775000', 0, '2022-03-10 10:57:20.775000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047307137025, 'CategoryController#addCategory', '增加新类目', 'POST', '/category/add', '类目管理', b'1', b'1', '类目管理 增加新类目', 0, '2022-03-10 10:57:20.775000', 0, '2022-03-10 10:57:20.775000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047311331328, 'PaymentController#findStatusByBusinessId', '根据业务ID获取支付状态', 'GET', '/payment/findStatusByBusinessId', '支付记录', b'1', b'1', '支付记录 根据业务ID获取支付状态', 0, '2022-03-10 10:57:20.776000', 0, '2022-03-10 10:57:20.776000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047315525632, 'InventoryController#increaseAvailable', '增补指定 SKU 的可售库存', 'POST', '/inventory/increaseAvailable', '库存操作', b'1', b'1', '库存操作 增补指定 SKU 的可售库存', 0, '2022-03-10 10:57:20.777000', 0, '2022-03-10 10:57:20.777000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047319719936, 'OrderFindController#findByUser', '根据用户获取订单', 'GET', '/order/findByUser', '订单查询', b'1', b'1', '订单查询 根据用户获取订单', 0, '2022-03-10 10:57:20.778000', 0, '2022-03-10 10:57:20.778000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047319719937, 'MailConfigController#findById', '通过 id 获取指定邮箱配置', 'GET', '/mail/config/findById', '邮箱配置', b'1', b'1', '邮箱配置 通过 id 获取指定邮箱配置', 0, '2022-03-10 10:57:20.778000', 0, '2022-03-10 10:57:20.778000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047328108544, 'ClientController#add', '添加终端', 'POST', '/client/add', '终端管理', b'1', b'1', '终端管理 添加终端', 0, '2022-03-10 10:57:20.780000', 0, '2022-03-10 10:57:20.780000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047332302848, 'RolePathController#findPathsByUser', '根据用户id获取角色授权(请求权限列表)', 'GET', '/role/path/findPathsByUser', '角色请求权限消息关系', b'1', b'1', '角色请求权限消息关系 根据用户id获取角色授权(请求权限列表)', 0, '2022-03-10 10:57:20.782000', 0, '2022-03-10 10:57:20.782000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047344885760, 'DataVersionLogController#findById', '获取', 'GET', '/log/dataVersion/findById', '数据版本日志', b'1', b'1', '数据版本日志 获取', 0, '2022-03-10 10:57:20.784000', 0, '2022-03-10 10:57:20.784000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047349080064, 'TestController#xx', '获取所有接口请求', 'GET', '/test/xx', '测试控制器', b'1', b'1', '测试控制器 获取所有接口请求', 0, '2022-03-10 10:57:20.785000', 0, '2022-03-10 10:57:20.785000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047353274368, 'SuperQueryDemoController#update', '修改', 'POST', '/demo/super/query/update', '超级查询演示', b'1', b'1', '超级查询演示 修改', 0, '2022-03-10 10:57:20.786000', 0, '2022-03-10 10:57:20.786000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047353274369, 'UserSocialLoginController#page', '分页', 'GET', '/user/social/page', '用户三方登录管理', b'1', b'1', '用户三方登录管理 分页', 0, '2022-03-10 10:57:20.786000', 0, '2022-03-10 10:57:20.786000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047357468672, 'CategoryController#getCategory', '通过 id 获取指定类目', 'GET', '/category/id', '类目管理', b'1', b'1', '类目管理 通过 id 获取指定类目', 0, '2022-03-10 10:57:20.787000', 0, '2022-03-10 10:57:20.787000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047357468673, 'AppVersionController#add', '添加', 'POST', '/app/version/add', 'app版本管理', b'1', b'1', 'app版本管理 添加', 0, '2022-03-10 10:57:20.787000', 0, '2022-03-10 10:57:20.787000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047361662976, 'SiteMessageController#read', '标为已读', 'POST', '/site/message/read', '站内信', b'1', b'1', '站内信 标为已读', 0, '2022-03-10 10:57:20.788000', 0, '2022-03-10 10:57:20.788000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047361662977, 'MailConfigController#existsByCode', '编码是否被使用', 'GET', '/mail/config/existsByCode', '邮箱配置', b'1', b'1', '邮箱配置 编码是否被使用', 0, '2022-03-10 10:57:20.788000', 0, '2022-03-10 10:57:20.788000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047365857280, 'FIleUpLoadController#download', '下载文件', 'GET', '/file/download/{id}', '文件上传', b'1', b'1', '文件上传 下载文件', 0, '2022-03-10 10:57:20.789000', 0, '2022-03-10 10:57:20.789000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047365857281, 'GoodsController#findAll', '查询全部', 'GET', '/goods/findAll', '商品管理', b'1', b'1', '商品管理 查询全部', 0, '2022-03-10 10:57:20.789000', 0, '2022-03-10 10:57:20.789000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047370051584, 'FIleUpLoadController#preview', '预览文件', 'GET', '/file/preview/{id}', '文件上传', b'1', b'1', '文件上传 预览文件', 0, '2022-03-10 10:57:20.790000', 0, '2022-03-10 10:57:20.790000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047370051585, 'PayNotifyRecordController#findById', '根据id查询', 'GET', '/pay/notify/record/findById', '支付回调记录', b'1', b'1', '支付回调记录 根据id查询', 0, '2022-03-10 10:57:20.790000', 0, '2022-03-10 10:57:20.790000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047374245888, 'SiteMessageController#send', '发送站内信', 'POST', '/site/message/send', '站内信', b'1', b'1', '站内信 发送站内信', 0, '2022-03-10 10:57:20.791000', 0, '2022-03-10 10:57:20.791000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047374245889, 'DataPermDemoController#findById', '通过ID查询', 'GET', '/demo/data/perm/findById', '数据权限演示', b'1', b'1', '数据权限演示 通过ID查询', 0, '2022-03-10 10:57:20.791000', 0, '2022-03-10 10:57:20.791000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047374245890, 'DictionaryController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/dict/existsByCodeNotId', '字典', b'1', b'1', '字典 编码是否被使用(不包含自己)', 0, '2022-03-10 10:57:20.791000', 0, '2022-03-10 10:57:20.791000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047378440192, 'DatabaseTableController#page', '表列表分页', 'GET', '/gen/table/page', '数据库表信息', b'1', b'1', '数据库表信息 表列表分页', 0, '2022-03-10 10:57:20.792000', 0, '2022-03-10 10:57:20.792000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047378440193, 'DataScopeController#update', '更新', 'POST', '/data/scope/update', '数据范围权限配置', b'1', b'1', '数据范围权限配置 更新', 0, '2022-03-10 10:57:20.792000', 0, '2022-03-10 10:57:20.792000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047382634496, 'GoodsController#add', '添加商品', 'POST', '/goods/add', '商品管理', b'1', b'1', '商品管理 添加商品', 0, '2022-03-10 10:57:20.793000', 0, '2022-03-10 10:57:20.793000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047382634497, 'RoleMenuController#findPermissionIdsByRole', '根据角色id获取关联权限id集合(包含资源和菜单)', 'GET', '/role/menu/findPermissionIdsByRole', '角色菜单权限关系', b'1', b'1', '角色菜单权限关系 根据角色id获取关联权限id集合(包含资源和菜单)', 0, '2022-03-10 10:57:20.793000', 0, '2022-03-10 10:57:20.793000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047382634498, 'RoleController#delete', '删除角色', 'DELETE', '/role/delete', '角色管理', b'1', b'1', '角色管理 删除角色', 0, '2022-03-10 10:57:20.793000', 0, '2022-03-10 10:57:20.794000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047386828800, 'DataVersionLogController#page', '分页', 'GET', '/log/dataVersion/page', '数据版本日志', b'1', b'1', '数据版本日志 分页', 0, '2022-03-10 10:57:20.794000', 0, '2022-03-10 10:57:20.794000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047386828801, 'OrderPreviewController#previewOrderPriceNoCheck', '预览价格(手动无检查)', 'POST', '/order/preview/previewOrderPriceNoCheck', '订单计算', b'1', b'1', '订单计算 预览价格(手动无检查)', 0, '2022-03-10 10:57:20.794000', 0, '2022-03-10 10:57:20.794000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047391023104, 'DataScopeController#page', '分页', 'GET', '/data/scope/page', '数据范围权限配置', b'1', b'1', '数据范围权限配置 分页', 0, '2022-03-10 10:57:20.795000', 0, '2022-03-10 10:57:20.795000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047391023105, 'AppVersionController#check', '检查更新', 'POST', '/app/version/check', 'app版本管理', b'1', b'1', 'app版本管理 检查更新', 0, '2022-03-10 10:57:20.795000', 0, '2022-03-10 10:57:20.795000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047395217408, 'CashierController#aggregatePay', '扫码聚合支付', 'GET', '/cashier/aggregatePay', '结算台', b'1', b'1', '结算台 扫码聚合支付', 0, '2022-03-10 10:57:20.796000', 0, '2022-03-10 10:57:20.796000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047395217409, 'DataPermDemoController#delete', '删除', 'DELETE', '/demo/data/perm/delete', '数据权限演示', b'1', b'1', '数据权限演示 删除', 0, '2022-03-10 10:57:20.796000', 0, '2022-03-10 10:57:20.796000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047395217410, 'PermPathController#update', '更新权限', 'POST', '/perm/path/update', '请求权限资源', b'1', b'1', '请求权限资源 更新权限', 0, '2022-03-10 10:57:20.796000', 0, '2022-03-10 10:57:20.796000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047399411712, 'DingRobotConfigController#page', '分页', 'GET', '/ding/robot/config/page', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 分页', 0, '2022-03-10 10:57:20.797000', 0, '2022-03-10 10:57:20.797000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047399411713, 'NcDemoController#sendMsg', '消息发送测试', 'GET', '/nc/test/sendMsg', 'nc测试', b'1', b'1', 'nc测试 消息发送测试', 0, '2022-03-10 10:57:20.797000', 0, '2022-03-10 10:57:20.797000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047403606016, 'CategoryController#findTree', '获取类目树', 'GET', '/category/tree', '类目管理', b'1', b'1', '类目管理 获取类目树', 0, '2022-03-10 10:57:20.798000', 0, '2022-03-10 10:57:20.798000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047403606017, 'DictionaryItemController#update', '修改字典项（返回字典项对象）', 'POST', '/dict/item/update', '字典项', b'1', b'1', '字典项 修改字典项（返回字典项对象）', 0, '2022-03-10 10:57:20.798000', 0, '2022-03-10 10:57:20.798000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047407800320, 'FIleUpLoadController#getFilePreviewUrlPrefix', '获取文件预览地址前缀', 'GET', '/file/getFilePreviewUrlPrefix', '文件上传', b'1', b'1', '文件上传 获取文件预览地址前缀', 0, '2022-03-10 10:57:20.799000', 0, '2022-03-10 10:57:20.799000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047407800321, 'InventoryController#reduceInventory', '扣减指定 SKU 的预占库存，增加对应售出', 'POST', '/inventory/reduceInventory', '库存操作', b'1', b'1', '库存操作 扣减指定 SKU 的预占库存，增加对应售出', 0, '2022-03-10 10:57:20.799000', 0, '2022-03-10 10:57:20.799000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047407800322, 'WeChatPayConfigController#findById', '根据Id查询', 'GET', '/wechat/pay/findById', '微信支付', b'1', b'1', '微信支付 根据Id查询', 0, '2022-03-10 10:57:20.799000', 0, '2022-03-10 10:57:20.799000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047411994624, 'OrderOperateController#cancelOrderState', '取消订单', 'POST', '/order/cancelOrderState', '订单操作', b'1', b'1', '订单操作 取消订单', 0, '2022-03-10 10:57:20.800000', 0, '2022-03-10 10:57:20.800000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047411994625, 'CouponTemplateController#findAll', '查询优惠券模板', 'POST', '/coupon/template/findAll', '优惠券模板', b'1', b'1', '优惠券模板 查询优惠券模板', 0, '2022-03-10 10:57:20.800000', 0, '2022-03-10 10:57:20.800000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047416188928, 'MessageTemplateController#add', '添加', 'POST', '/message/template/add', '消息模板', b'1', b'1', '消息模板 添加', 0, '2022-03-10 10:57:20.801000', 0, '2022-03-10 10:57:20.801000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047416188929, 'AppVersionController#findById', '查询详情', 'POST', '/app/version/findById', 'app版本管理', b'1', b'1', 'app版本管理 查询详情', 0, '2022-03-10 10:57:20.801000', 0, '2022-03-10 10:57:20.801000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047420383232, 'InventoryController#unlockInventory', '释放预占的SKU库存，需使用token', 'POST', '/inventory/unlockInventory', '库存操作', b'1', b'1', '库存操作 释放预占的SKU库存，需使用token', 0, '2022-03-10 10:57:20.802000', 0, '2022-03-10 10:57:20.802000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047420383233, 'CouponTemplateController#get', '优惠券模板详情', 'POST', '/coupon/template/get/{id}', '优惠券模板', b'1', b'1', '优惠券模板 优惠券模板详情', 0, '2022-03-10 10:57:20.802000', 0, '2022-03-10 10:57:20.802000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047420383234, 'PayController#pay', '支付', 'POST', '/uni_pay/pay', '统一支付', b'1', b'1', '统一支付 支付', 0, '2022-03-10 10:57:20.802000', 0, '2022-03-10 10:57:20.802000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047424577536, 'PermMenuController#menuTree', '获取菜单树', 'GET', '/perm/menu/menuTree', '菜单权限资源', b'1', b'1', '菜单权限资源 获取菜单树', 0, '2022-03-10 10:57:20.803000', 0, '2022-03-10 10:57:20.803000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047424577537, 'DataPermDemoController#page', '分页查询', 'GET', '/demo/data/perm/page', '数据权限演示', b'1', b'1', '数据权限演示 分页查询', 0, '2022-03-10 10:57:20.803000', 0, '2022-03-10 10:57:20.803000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047424577538, 'DeptController#findById', '获取', 'GET', '/dept/findById', '部门管理', b'1', b'1', '部门管理 获取', 0, '2022-03-10 10:57:20.803000', 0, '2022-03-10 10:57:20.803000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047428771840, 'WalletLogController#searchLog', '查询钱包日志(分页)', 'POST', '/walletLog/search/page', '钱包日志相关的接口', b'1', b'1', '钱包日志相关的接口 查询钱包日志(分页)', 0, '2022-03-10 10:57:20.804000', 0, '2022-03-10 10:57:20.804000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047428771841, 'RoleController#page', '分页查询角色', 'GET', '/role/page', '角色管理', b'1', b'1', '角色管理 分页查询角色', 0, '2022-03-10 10:57:20.804000', 0, '2022-03-10 10:57:20.804000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047432966144, 'WalletController#recharge', '充值操作', 'POST', '/wallet/recharge', '钱包相关的接口', b'1', b'1', '钱包相关的接口 充值操作', 0, '2022-03-10 10:57:20.805000', 0, '2022-03-10 10:57:20.805000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047432966145, 'DictionaryItemController#findById', '根据字典项ID查询', 'GET', '/dict/item/findById', '字典项', b'1', b'1', '字典项 根据字典项ID查询', 0, '2022-03-10 10:57:20.805000', 0, '2022-03-10 10:57:20.805000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047437160448, 'WalletLogController#searchByCondition', '查询钱包日志', 'POST', '/walletLog/search/condition', '钱包日志相关的接口', b'1', b'1', '钱包日志相关的接口 查询钱包日志', 0, '2022-03-10 10:57:20.806000', 0, '2022-03-10 10:57:20.806000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047437160449, 'OrderFindController#getWholeById', '获取完整订单详情', 'GET', '/order/getWholeById', '订单查询', b'1', b'1', '订单查询 获取完整订单详情', 0, '2022-03-10 10:57:20.806000', 0, '2022-03-10 10:57:20.806000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047437160450, 'DingRobotSendController#sendText', '测试发送text', 'POST', '/ding/robot/send/text', '钉钉机器人发送', b'1', b'1', '钉钉机器人发送 测试发送text', 0, '2022-03-10 10:57:20.806000', 0, '2022-03-10 10:57:20.806000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047441354752, 'PayCallbackController#aliPay', '支付宝回调', 'POST', '/pay/callback/aliPay', '支付回调', b'1', b'1', '支付回调 支付宝回调', 0, '2022-03-10 10:57:20.807000', 0, '2022-03-10 10:57:20.807000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047441354753, 'SiteMessageController#getSenderCount', '获取发送消息条数', 'GET', '/site/message/getSenderCount', '站内信', b'1', b'1', '站内信 获取发送消息条数', 0, '2022-03-10 10:57:20.807000', 0, '2022-03-10 10:57:20.807000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047445549056, 'OpenApiWebMvcResource#openapiYaml', 'openapiYaml', 'GET', '/v3/api-docs.yaml', 'OpenApiWebMvcResource', b'1', b'1', 'OpenApiWebMvcResource openapiYaml', 0, '2022-03-10 10:57:20.808000', 0, '2022-03-10 10:57:20.808000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047445549057, 'TestController#hello', '测试', 'GET', '/test/hello', '测试控制器', b'1', b'1', '测试控制器 测试', 0, '2022-03-10 10:57:20.808000', 0, '2022-03-10 10:57:20.808000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047449743360, 'OperateLogController#page', '分页', 'GET', '/log/operate/page', '操作日志', b'1', b'1', '操作日志 分页', 0, '2022-03-10 10:57:20.809000', 0, '2022-03-10 10:57:20.809000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047449743361, 'TokenEndpoint#logout', '退出', 'POST', '/token/logout', '认证相关', b'1', b'1', '认证相关 退出', 0, '2022-03-10 10:57:20.809000', 0, '2022-03-10 10:57:20.809000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047449743362, 'CouponController#findByIds', '批量查询优惠券', 'GET', '/coupon/findByIds', '优惠券', b'1', b'1', '优惠券 批量查询优惠券', 0, '2022-03-10 10:57:20.809000', 0, '2022-03-10 10:57:20.809000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047453937664, 'DeptController#tree', '树状展示', 'GET', '/dept/tree', '部门管理', b'1', b'1', '部门管理 树状展示', 0, '2022-03-10 10:57:20.810000', 0, '2022-03-10 10:57:20.810000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047453937665, 'MailSendController#sendMail', '发送邮件', 'POST', '/mail/send/sendMail', '邮件发送', b'1', b'1', '邮件发送 发送邮件', 0, '2022-03-10 10:57:20.810000', 0, '2022-03-10 10:57:20.810000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047453937666, 'AppVersionController#delete', '删除', 'DELETE', '/app/version/delete', 'app版本管理', b'1', b'1', 'app版本管理 删除', 0, '2022-03-10 10:57:20.810000', 0, '2022-03-10 10:57:20.810000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047458131968, 'DeptController#deleteAndChildren', '强制级联删除', 'DELETE', '/dept/deleteAndChildren', '部门管理', b'1', b'1', '部门管理 强制级联删除', 0, '2022-03-10 10:57:20.811000', 0, '2022-03-10 10:57:20.811000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047458131969, 'StrategyRegisterController#findAll', '查询全部', 'GET', '/strategy/register/findAll', '策略注册', b'1', b'1', '策略注册 查询全部', 0, '2022-03-10 10:57:20.811000', 0, '2022-03-10 10:57:20.811000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047458131970, 'StrategyController#add', '添加策略', 'POST', '/strategy/add', '策略定义', b'1', b'1', '策略定义 添加策略', 0, '2022-03-10 10:57:20.811000', 0, '2022-03-10 10:57:20.811000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047458131971, 'RoleController#findAll', '查询所有的角色', 'GET', '/role/findAll', '角色管理', b'1', b'1', '角色管理 查询所有的角色', 0, '2022-03-10 10:57:20.811000', 0, '2022-03-10 10:57:20.812000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047462326272, 'AlipayConfigController#update', '更新', 'POST', '/alipay/update', '支付宝配置', b'1', b'1', '支付宝配置 更新', 0, '2022-03-10 10:57:20.812000', 0, '2022-03-10 10:57:20.812000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047462326273, 'RoleController#add', '添加角色（返回角色对象）', 'POST', '/role/add', '角色管理', b'1', b'1', '角色管理 添加角色（返回角色对象）', 0, '2022-03-10 10:57:20.812000', 0, '2022-03-10 10:57:20.812000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047462326274, 'PermMenuController#add', '添加菜单权限', 'POST', '/perm/menu/add', '菜单权限资源', b'1', b'1', '菜单权限资源 添加菜单权限', 0, '2022-03-10 10:57:20.812000', 0, '2022-03-10 10:57:20.812000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047466520576, 'PaymentController#findPayTypeInfoById', '根据id获取订单支付方式', 'GET', '/payment/findPayTypeInfoById', '支付记录', b'1', b'1', '支付记录 根据id获取订单支付方式', 0, '2022-03-10 10:57:20.813000', 0, '2022-03-10 10:57:20.813000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047466520577, 'AlipayConfigController#clearActivity', '清除指定的支付宝配置', 'POST', '/alipay/clearActivity', '支付宝配置', b'1', b'1', '支付宝配置 清除指定的支付宝配置', 0, '2022-03-10 10:57:20.813000', 0, '2022-03-10 10:57:20.813000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047466520578, 'ClientController#findByCode', '通过code查询终端', 'GET', '/client/findByCode', '终端管理', b'1', b'1', '终端管理 通过code查询终端', 0, '2022-03-10 10:57:20.813000', 0, '2022-03-10 10:57:20.814000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047470714880, 'QuartzJobController#stop', '停止', 'POST', '/quartz/stop', '定时任务', b'1', b'1', '定时任务 停止', 0, '2022-03-10 10:57:20.814000', 0, '2022-03-10 10:57:20.814000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047470714881, 'UserAdminController#findById', '根据用户id查询用户', 'GET', '/user/admin/findById', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 根据用户id查询用户', 0, '2022-03-10 10:57:20.814000', 0, '2022-03-10 10:57:20.814000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047474909184, 'DataScopeController#add', '添加', 'POST', '/data/scope/add', '数据范围权限配置', b'1', b'1', '数据范围权限配置 添加', 0, '2022-03-10 10:57:20.815000', 0, '2022-03-10 10:57:20.815000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047474909185, 'PayController#cancelByBusinessId', '取消支付(业务id)', 'POST', '/uni_pay/cancelByBusinessId', '统一支付', b'1', b'1', '统一支付 取消支付(业务id)', 0, '2022-03-10 10:57:20.815000', 0, '2022-03-10 10:57:20.815000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047474909186, 'UserAdminController#getUserInfoWhole', '查询用户详情', 'GET', '/user/admin/getUserInfoWhole', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 查询用户详情', 0, '2022-03-10 10:57:20.815000', 0, '2022-03-10 10:57:20.815000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047474909187, 'FIleUpLoadController#page', '分页', 'GET', '/file/page', '文件上传', b'1', b'1', '文件上传 分页', 0, '2022-03-10 10:57:20.815000', 0, '2022-03-10 10:57:20.816000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047479103488, 'RefundRecordController#findById', '根据id查询', 'GET', '/pay/refund/findById', '退款记录', b'1', b'1', '退款记录 根据id查询', 0, '2022-03-10 10:57:20.816000', 0, '2022-03-10 10:57:20.816000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047479103489, 'AlipayConfigController#findById', '根据Id查询', 'GET', '/alipay/findById', '支付宝配置', b'1', b'1', '支付宝配置 根据Id查询', 0, '2022-03-10 10:57:20.816000', 0, '2022-03-10 10:57:20.816000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047479103490, 'DictionaryItemController#existsByCode', '编码是否被使用', 'GET', '/dict/item/existsByCode', '字典项', b'1', b'1', '字典项 编码是否被使用', 0, '2022-03-10 10:57:20.816000', 0, '2022-03-10 10:57:20.816000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047483297792, 'DataScopeController#saveDeptAssign', '保存关联部门', 'POST', '/data/scope/saveDeptAssign', '数据范围权限配置', b'1', b'1', '数据范围权限配置 保存关联部门', 0, '2022-03-10 10:57:20.817000', 0, '2022-03-10 10:57:20.817000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047483297793, 'SystemParamController#findByParamKey', '根据键名获取键值', 'GET', '/system/param/findByParamKey', '系统参数', b'1', b'1', '系统参数 根据键名获取键值', 0, '2022-03-10 10:57:20.817000', 0, '2022-03-10 10:57:20.817000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047483297794, 'DataScopeController#findById', '获取', 'GET', '/data/scope/findById', '数据范围权限配置', b'1', b'1', '数据范围权限配置 获取', 0, '2022-03-10 10:57:20.818000', 0, '2022-03-10 10:57:20.818000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047487492096, 'DataScopeController#getDeptIds', '获取关联部门id', 'GET', '/data/scope/getDeptIds', '数据范围权限配置', b'1', b'1', '数据范围权限配置 获取关联部门id', 0, '2022-03-10 10:57:20.818000', 0, '2022-03-10 10:57:20.818000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047487492097, 'SystemParamController#add', '添加', 'POST', '/system/param/add', '系统参数', b'1', b'1', '系统参数 添加', 0, '2022-03-10 10:57:20.818000', 0, '2022-03-10 10:57:20.818000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047487492098, 'TokenEndpoint#loginOpenId', '三方登录登录', 'POST', '/token/loginOpenId', '认证相关', b'1', b'1', '认证相关 三方登录登录', 0, '2022-03-10 10:57:20.818000', 0, '2022-03-10 10:57:20.818000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047491686400, 'PayNotifyRecordController#page', '分页', 'GET', '/pay/notify/record/page', '支付回调记录', b'1', b'1', '支付回调记录 分页', 0, '2022-03-10 10:57:20.819000', 0, '2022-03-10 10:57:20.819000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047491686401, 'OrderPreviewController#previewOrderPrice', '预览价格(手动)', 'POST', '/order/preview/previewOrderPrice', '订单计算', b'1', b'1', '订单计算 预览价格(手动)', 0, '2022-03-10 10:57:20.819000', 0, '2022-03-10 10:57:20.819000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047491686402, 'ActivityController#get', '查询活动', 'GET', '/activity//get/{id}', '活动', b'1', b'1', '活动 查询活动', 0, '2022-03-10 10:57:20.819000', 0, '2022-03-10 10:57:20.819000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047495880704, 'ClientController#delete', '删除终端', 'DELETE', '/client/delete', '终端管理', b'1', b'1', '终端管理 删除终端', 0, '2022-03-10 10:57:20.820000', 0, '2022-03-10 10:57:20.820000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047495880705, 'TestController#say', '测试回声', 'GET', '/test/say', '测试控制器', b'1', b'1', '测试控制器 测试回声', 0, '2022-03-10 10:57:20.820000', 0, '2022-03-10 10:57:20.820000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047495880706, 'PaymentController#findByUser', '根据userId获取列表', 'GET', '/payment/findByUser', '支付记录', b'1', b'1', '支付记录 根据userId获取列表', 0, '2022-03-10 10:57:20.820000', 0, '2022-03-10 10:57:20.820000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047500075008, 'UserDeptController#saveAndUpdate', '给用户分配部门', 'POST', '/user/dept/saveAndUpdate', '用户部门关联关系', b'1', b'1', '用户部门关联关系 给用户分配部门', 0, '2022-03-10 10:57:20.821000', 0, '2022-03-10 10:57:20.821000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047500075009, 'SystemParamController#update', '更新', 'POST', '/system/param/update', '系统参数', b'1', b'1', '系统参数 更新', 0, '2022-03-10 10:57:20.821000', 0, '2022-03-10 10:57:20.821000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047500075010, 'AlipayConfigController#setUpActivity', '启用指定的支付宝配置', 'POST', '/alipay/setUpActivity', '支付宝配置', b'1', b'1', '支付宝配置 启用指定的支付宝配置', 0, '2022-03-10 10:57:20.821000', 0, '2022-03-10 10:57:20.821000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047500075011, 'AuthAssistController#sendSmsCaptcha', '发送短信验证码', 'POST', '/auth/sendSmsCaptcha', '认证支撑接口', b'1', b'1', '认证支撑接口 发送短信验证码', 0, '2022-03-10 10:57:20.821000', 0, '2022-03-10 10:57:20.821000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047504269312, 'PermMenuController#existsByPermCode', '编码是否被使用(不包含自己)', 'GET', '/perm/menu/existsByPermCodeNotId', '菜单权限资源', b'1', b'1', '菜单权限资源 编码是否被使用(不包含自己)', 0, '2022-03-10 10:57:20.822000', 0, '2022-03-10 10:57:20.822000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047504269313, 'UserAdminController#getByEmail', '根据邮箱查询用户', 'GET', '/user/admin/getByEmail', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 根据邮箱查询用户', 0, '2022-03-10 10:57:20.822000', 0, '2022-03-10 10:57:20.822000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047504269314, 'SystemParamController#page', '分页', 'GET', '/system/param/page', '系统参数', b'1', b'1', '系统参数 分页', 0, '2022-03-10 10:57:20.822000', 0, '2022-03-10 10:57:20.822000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047504269315, 'QuartzJobController#start', '启动', 'POST', '/quartz/start', '定时任务', b'1', b'1', '定时任务 启动', 0, '2022-03-10 10:57:20.822000', 0, '2022-03-10 10:57:20.822000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047508463616, 'WalletController#activeWallet', '开通操作', 'POST', '/wallet/active', '钱包相关的接口', b'1', b'1', '钱包相关的接口 开通操作', 0, '2022-03-10 10:57:20.823000', 0, '2022-03-10 10:57:20.823000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047508463617, 'SuperQueryDemoController#page', '分页查询', 'GET', '/demo/super/query/page', '超级查询演示', b'1', b'1', '超级查询演示 分页查询', 0, '2022-03-10 10:57:20.823000', 0, '2022-03-10 10:57:20.823000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047508463618, 'DingRobotConfigController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/ding/robot/config/existsByCodeNotId', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 编码是否被使用(不包含自己)', 0, '2022-03-10 10:57:20.823000', 0, '2022-03-10 10:57:20.823000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047512657920, 'UserRoleController#saveAndUpdate', '给用户分配角色', 'POST', '/user/role/saveAndUpdate', '用户角色管理', b'1', b'1', '用户角色管理 给用户分配角色', 0, '2022-03-10 10:57:20.824000', 0, '2022-03-10 10:57:20.824000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047512657921, 'UserAdminController#getByPhone', '根据手机号查询用户', 'GET', '/user/admin/getByPhone', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 根据手机号查询用户', 0, '2022-03-10 10:57:20.824000', 0, '2022-03-10 10:57:20.824000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047512657922, 'PermMenuController#allTree', '获取全部树', 'GET', '/perm/menu/allTree', '菜单权限资源', b'1', b'1', '菜单权限资源 获取全部树', 0, '2022-03-10 10:57:20.824000', 0, '2022-03-10 10:57:20.824000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047512657923, 'CashierController#singlePay', '发起支付(单渠道)', 'POST', '/cashier/singlePay', '结算台', b'1', b'1', '结算台 发起支付(单渠道)', 0, '2022-03-10 10:57:20.824000', 0, '2022-03-10 10:57:20.824000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047516852224, 'QuartzJobController#add', '添加', 'POST', '/quartz/add', '定时任务', b'1', b'1', '定时任务 添加', 0, '2022-03-10 10:57:20.825000', 0, '2022-03-10 10:57:20.825000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047516852225, 'PayController#syncByBusinessId', '刷新指定业务id的支付单状态', 'POST', '/uni_pay/syncByBusinessId', '统一支付', b'1', b'1', '统一支付 刷新指定业务id的支付单状态', 0, '2022-03-10 10:57:20.825000', 0, '2022-03-10 10:57:20.825000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047516852226, 'MessageTemplateController#existsByCode', '编码是否被使用', 'GET', '/message/template/existsByCode', '消息模板', b'1', b'1', '消息模板 编码是否被使用', 0, '2022-03-10 10:57:20.825000', 0, '2022-03-10 10:57:20.825000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047521046528, 'OperateLogController#findById', '获取', 'GET', '/log/operate/findById', '操作日志', b'1', b'1', '操作日志 获取', 0, '2022-03-10 10:57:20.826000', 0, '2022-03-10 10:57:20.826000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047521046529, 'InventoryController#getAvailable', '获取指定 SKU 的可用库存', 'GET', '/inventory/getAvailable', '库存操作', b'1', b'1', '库存操作 获取指定 SKU 的可用库存', 0, '2022-03-10 10:57:20.826000', 0, '2022-03-10 10:57:20.826000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047525240832, 'CategoryController#findAll', '获取所有类目', 'GET', '/category/all', '类目管理', b'1', b'1', '类目管理 获取所有类目', 0, '2022-03-10 10:57:20.827000', 0, '2022-03-10 10:57:20.827000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047525240833, 'CouponTemplateController#addCouponTemplate', '新建优惠券模板', 'POST', '/coupon/template/add', '优惠券模板', b'1', b'1', '优惠券模板 新建优惠券模板', 0, '2022-03-10 10:57:20.827000', 0, '2022-03-10 10:57:20.827000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047525240834, 'DataScopeController#saveUserAssign', '保存关联用户权限', 'POST', '/data/scope/saveUserAssign', '数据范围权限配置', b'1', b'1', '数据范围权限配置 保存关联用户权限', 0, '2022-03-10 10:57:20.827000', 0, '2022-03-10 10:57:20.827000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047529435136, 'InventoryController#reduceSoldAndCapacity', '扣减指定 SKU 的售出库存并减少总库存', 'POST', '/inventory/reduceSoldAndCapacity', '库存操作', b'1', b'1', '库存操作 扣减指定 SKU 的售出库存并减少总库存', 0, '2022-03-10 10:57:20.828000', 0, '2022-03-10 10:57:20.828000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047529435137, 'PayController#cancelByPaymentId', '取消支付(支付id)', 'POST', '/uni_pay/cancelByPaymentId', '统一支付', b'1', b'1', '统一支付 取消支付(支付id)', 0, '2022-03-10 10:57:20.828000', 0, '2022-03-10 10:57:20.828000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047529435138, 'DataScopeController#existsByCode', '编码是否被使用', 'GET', '/data/scope/existsByCode', '数据范围权限配置', b'1', b'1', '数据范围权限配置 编码是否被使用', 0, '2022-03-10 10:57:20.828000', 0, '2022-03-10 10:57:20.828000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047529435139, 'UserInfoController#updatePassword', '修改密码', 'POST', '/user/updatePassword', '用户管理', b'1', b'1', '用户管理 修改密码', 0, '2022-03-10 10:57:20.828000', 0, '2022-03-10 10:57:20.828000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047533629440, 'DictionaryController#page', '分页', 'GET', '/dict/page', '字典', b'1', b'1', '字典 分页', 0, '2022-03-10 10:57:20.829000', 0, '2022-03-10 10:57:20.829000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047533629441, 'SystemParamController#delete', '删除', 'DELETE', '/system/param/delete', '系统参数', b'1', b'1', '系统参数 删除', 0, '2022-03-10 10:57:20.829000', 0, '2022-03-10 10:57:20.829000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047533629442, 'WeChatPayConfigController#add', '添加微信支付配置', 'POST', '/wechat/pay/add', '微信支付', b'1', b'1', '微信支付 添加微信支付配置', 0, '2022-03-10 10:57:20.829000', 0, '2022-03-10 10:57:20.829000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047533629443, 'UserDeptController#findAllByUser', '根据用户ID获取到部门集合', 'GET', '/user/dept/findAllByUser', '用户部门关联关系', b'1', b'1', '用户部门关联关系 根据用户ID获取到部门集合', 0, '2022-03-10 10:57:20.829000', 0, '2022-03-10 10:57:20.829000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047537823744, 'UserDeptController#findIdsByUser', '根据用户ID获取到部门id集合', 'GET', '/user/dept/findIdsByUser', '用户部门关联关系', b'1', b'1', '用户部门关联关系 根据用户ID获取到部门id集合', 0, '2022-03-10 10:57:20.830000', 0, '2022-03-10 10:57:20.830000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047537823745, 'StrategyController#findByType', '根据类型查询', 'GET', '/strategy/findByType', '策略定义', b'1', b'1', '策略定义 根据类型查询', 0, '2022-03-10 10:57:20.830000', 0, '2022-03-10 10:57:20.830000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047537823746, 'DataScopeController#delete', '删除', 'DELETE', '/data/scope/delete', '数据范围权限配置', b'1', b'1', '数据范围权限配置 删除', 0, '2022-03-10 10:57:20.830000', 0, '2022-03-10 10:57:20.830000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047542018048, 'SiteMessageController#page', '消息分页', 'GET', '/site/message/page', '站内信', b'1', b'1', '站内信 消息分页', 0, '2022-03-10 10:57:20.831000', 0, '2022-03-10 10:57:20.831000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047542018049, 'ClientController#existsByCode', '编码是否被使用', 'GET', '/client/existsByCode', '终端管理', b'1', b'1', '终端管理 编码是否被使用', 0, '2022-03-10 10:57:20.831000', 0, '2022-03-10 10:57:20.831000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047542018050, 'ClientController#findById', '通过ID查询终端', 'GET', '/client/findById', '终端管理', b'1', b'1', '终端管理 通过ID查询终端', 0, '2022-03-10 10:57:20.831000', 0, '2022-03-10 10:57:20.831000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047542018051, 'StrategyController#findById', '获取策略及其配置项', 'GET', '/strategy/findById', '策略定义', b'1', b'1', '策略定义 获取策略及其配置项', 0, '2022-03-10 10:57:20.831000', 0, '2022-03-10 10:57:20.831000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047542018052, 'DatabaseTableController#findByTableName', '获取表信息', 'GET', '/gen/table/findByTableName', '数据库表信息', b'1', b'1', '数据库表信息 获取表信息', 0, '2022-03-10 10:57:20.831000', 0, '2022-03-10 10:57:20.831000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047546212352, 'LoginLogController#findById', '获取', 'GET', '/log/login/findById', '登录日志', b'1', b'1', '登录日志 获取', 0, '2022-03-10 10:57:20.832000', 0, '2022-03-10 10:57:20.832000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047546212353, 'FIleUpLoadController#local', '上传', 'POST', '/file/upload', '文件上传', b'1', b'1', '文件上传 上传', 0, '2022-03-10 10:57:20.832000', 0, '2022-03-10 10:57:20.832000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047546212354, 'GoodsSkuController#getById', '获取sku', 'GET', '/sku/get', 'sku操作', b'1', b'1', 'sku操作 获取sku', 0, '2022-03-10 10:57:20.832000', 0, '2022-03-10 10:57:20.832000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047546212355, 'InventoryController#reduceLockedAndCapacity', '扣减指定的 SKU 的库存', 'POST', '/inventory/reduceLockedAndCapacity', '库存操作', b'1', b'1', '库存操作 扣减指定的 SKU 的库存', 0, '2022-03-10 10:57:20.832000', 0, '2022-03-10 10:57:20.832000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047550406656, 'InventoryController#increaseInventory', '增补指定 SKU 的可售库存， 扣减对应售出', 'POST', '/inventory/increaseInventory', '库存操作', b'1', b'1', '库存操作 增补指定 SKU 的可售库存， 扣减对应售出', 0, '2022-03-10 10:57:20.833000', 0, '2022-03-10 10:57:20.833000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047550406657, 'PaymentController#findByBusinessId', '根据businessId获取列表', 'GET', '/payment/findByBusinessId', '支付记录', b'1', b'1', '支付记录 根据businessId获取列表', 0, '2022-03-10 10:57:20.833000', 0, '2022-03-10 10:57:20.833000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047550406658, 'DataScopeController#deleteUserAssigns', '批量删除关联用户', 'DELETE', '/data/scope/deleteUserAssigns', '数据范围权限配置', b'1', b'1', '数据范围权限配置 批量删除关联用户', 0, '2022-03-10 10:57:20.833000', 0, '2022-03-10 10:57:20.833000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047550406659, 'DingRobotConfigController#add', '新增机器人配置', 'POST', '/ding/robot/config/add', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 新增机器人配置', 0, '2022-03-10 10:57:20.833000', 0, '2022-03-10 10:57:20.833000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047554600960, 'CouponController#lockById', '锁定优惠券', 'POST', '/coupon/lockById', '优惠券', b'1', b'1', '优惠券 锁定优惠券', 0, '2022-03-10 10:57:20.834000', 0, '2022-03-10 10:57:20.834000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047554600961, 'MailConfigController#updateMailConfig', '更新邮箱配置', 'POST', '/mail/config/update', '邮箱配置', b'1', b'1', '邮箱配置 更新邮箱配置', 0, '2022-03-10 10:57:20.834000', 0, '2022-03-10 10:57:20.834000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047554600962, 'UserInfoController#existsPhone', '手机号是否被使用', 'GET', '/user/existsPhone', '用户管理', b'1', b'1', '用户管理 手机号是否被使用', 0, '2022-03-10 10:57:20.834000', 0, '2022-03-10 10:57:20.834000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047554600963, 'RolePathController#findIdsByRole', '根据角色id获取关联权限id', 'GET', '/role/path/findIdsByRole', '角色请求权限消息关系', b'1', b'1', '角色请求权限消息关系 根据角色id获取关联权限id', 0, '2022-03-10 10:57:20.834000', 0, '2022-03-10 10:57:20.834000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047554600964, 'DictionaryController#findById', '根据id获取', 'GET', '/dict/findById', '字典', b'1', b'1', '字典 根据id获取', 0, '2022-03-10 10:57:20.834000', 0, '2022-03-10 10:57:20.834000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047558795264, 'PaymentController#page', '分页查询', 'GET', '/payment/page', '支付记录', b'1', b'1', '支付记录 分页查询', 0, '2022-03-10 10:57:20.835000', 0, '2022-03-10 10:57:20.835000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047558795265, 'MultipleOpenApiWebMvcResource#openapiJson', 'openapiJson', 'GET', '/v3/api-docs/{group}', 'MultipleOpenApiWebMvcResource', b'1', b'1', 'MultipleOpenApiWebMvcResource openapiJson', 0, '2022-03-10 10:57:20.835000', 0, '2022-03-10 10:57:20.835000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047558795266, 'DataScopeController#findUsersByDataScopeId', '获取关联的用户列表', 'GET', '/data/scope/findUsersByDataScopeId', '数据范围权限配置', b'1', b'1', '数据范围权限配置 获取关联的用户列表', 0, '2022-03-10 10:57:20.835000', 0, '2022-03-10 10:57:20.835000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047558795267, 'MailConfigController#add', '增加新邮箱配置', 'POST', '/mail/config/add', '邮箱配置', b'1', b'1', '邮箱配置 增加新邮箱配置', 0, '2022-03-10 10:57:20.835000', 0, '2022-03-10 10:57:20.835000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047562989568, 'UserInfoController#getLoginAfterUserInfo', '登录后获取用户信息', 'GET', '/user/getLoginAfterUserInfo', '用户管理', b'1', b'1', '用户管理 登录后获取用户信息', 0, '2022-03-10 10:57:20.836000', 0, '2022-03-10 10:57:20.836000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047562989569, 'OpenApiWebMvcResource#openapiJson', 'openapiJson', 'GET', '/v3/api-docs', 'OpenApiWebMvcResource', b'1', b'1', 'OpenApiWebMvcResource openapiJson', 0, '2022-03-10 10:57:20.836000', 0, '2022-03-10 10:57:20.836000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047562989570, 'OnlineUserController#page', '分页', 'GET', '/user/online/page', '在线用户', b'1', b'1', '在线用户 分页', 0, '2022-03-10 10:57:20.836000', 0, '2022-03-10 10:57:20.836000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047562989571, 'TestController#sequence', '发号器', 'GET', '/test/sequence', '测试控制器', b'1', b'1', '测试控制器 发号器', 0, '2022-03-10 10:57:20.836000', 0, '2022-03-10 10:57:20.836000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047562989572, 'CategoryController#update', '更新类目', 'POST', '/category/update', '类目管理', b'1', b'1', '类目管理 更新类目', 0, '2022-03-10 10:57:20.836000', 0, '2022-03-10 10:57:20.837000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047567183872, 'RefundRecordController#page', '分页', 'GET', '/pay/refund/page', '退款记录', b'1', b'1', '退款记录 分页', 0, '2022-03-10 10:57:20.837000', 0, '2022-03-10 10:57:20.837000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047567183873, 'StrategyRegisterController#delete', '删除', 'DELETE', '/strategy/register/del/{id}', '策略注册', b'1', b'1', '策略注册 删除', 0, '2022-03-10 10:57:20.837000', 0, '2022-03-10 10:57:20.837000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047567183874, 'CouponController#obtainCoupon', '领取优惠券', 'POST', '/coupon/obtainCoupon', '优惠券', b'1', b'1', '优惠券 领取优惠券', 0, '2022-03-10 10:57:20.837000', 0, '2022-03-10 10:57:20.837000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047567183875, 'UserAdminController#page', '分页', 'GET', '/user/admin/page', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 分页', 0, '2022-03-10 10:57:20.837000', 0, '2022-03-10 10:57:20.837000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047571378176, 'DictionaryController#update', '更新', 'POST', '/dict/update', '字典', b'1', b'1', '字典 更新', 0, '2022-03-10 10:57:20.838000', 0, '2022-03-10 10:57:20.838000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047571378177, 'DeptController#add', '添加', 'POST', '/dept/add', '部门管理', b'1', b'1', '部门管理 添加', 0, '2022-03-10 10:57:20.838000', 0, '2022-03-10 10:57:20.838000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047571378178, 'TestController#sequenceZdy', '发号器自定义', 'GET', '/test/sequenceZdy', '测试控制器', b'1', b'1', '测试控制器 发号器自定义', 0, '2022-03-10 10:57:20.838000', 0, '2022-03-10 10:57:20.838000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047571378179, 'OnlineUserController#findBySessionId', '获取单条', 'GET', '/user/online/findBySessionId', '在线用户', b'1', b'1', '在线用户 获取单条', 0, '2022-03-10 10:57:20.838000', 0, '2022-03-10 10:57:20.838000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047575572480, 'UserAdminController#restartPassword', '重置密码', 'POST', '/user/admin/restartPassword', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 重置密码', 0, '2022-03-10 10:57:20.839000', 0, '2022-03-10 10:57:20.839000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047575572481, 'CouponController#getByIds', '批量优惠券', 'GET', '/coupon/getById', '优惠券', b'1', b'1', '优惠券 批量优惠券', 0, '2022-03-10 10:57:20.839000', 0, '2022-03-10 10:57:20.839000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047575572482, 'DictionaryItemController#add', '添加字典项（返回字典项对象）', 'POST', '/dict/item/add', '字典项', b'1', b'1', '字典项 添加字典项（返回字典项对象）', 0, '2022-03-10 10:57:20.839000', 0, '2022-03-10 10:57:20.839000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047575572483, 'ClientController#page', '分页查询终端', 'GET', '/client/page', '终端管理', b'1', b'1', '终端管理 分页查询终端', 0, '2022-03-10 10:57:20.839000', 0, '2022-03-10 10:57:20.839000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047575572484, 'GoodsController#findByCategory', '按类目查询', 'GET', '/goods/findByCategory', '商品管理', b'1', b'1', '商品管理 按类目查询', 0, '2022-03-10 10:57:20.839000', 0, '2022-03-10 10:57:20.839000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047579766784, 'PermPathController#delete', '删除权限', 'POST', '/perm/path/delete', '请求权限资源', b'1', b'1', '请求权限资源 删除权限', 0, '2022-03-10 10:57:20.840000', 0, '2022-03-10 10:57:20.840000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047579766785, 'SiteMessageController#findById', '消息详情', 'GET', '/site/message/findById', '站内信', b'1', b'1', '站内信 消息详情', 0, '2022-03-10 10:57:20.840000', 0, '2022-03-10 10:57:20.840000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047579766786, 'DingRobotConfigController#existsByCode', '编码是否被使用', 'GET', '/ding/robot/config/existsByCode', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 编码是否被使用', 0, '2022-03-10 10:57:20.840000', 0, '2022-03-10 10:57:20.840000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047579766787, 'SystemParamController#existsByKey', '判断编码是否存在', 'GET', '/system/param/existsByKey', '系统参数', b'1', b'1', '系统参数 判断编码是否存在', 0, '2022-03-10 10:57:20.840000', 0, '2022-03-10 10:57:20.840000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047583961088, 'UserAdminController#unlock', '解锁用户', 'POST', '/user/admin/unlock', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 解锁用户', 0, '2022-03-10 10:57:20.841000', 0, '2022-03-10 10:57:20.841000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047583961089, 'CaptchaController#imgCaptcha', '获取图片验证码', 'POST', '/captcha/imgCaptcha', '验证码服务', b'1', b'1', '验证码服务 获取图片验证码', 0, '2022-03-10 10:57:20.841000', 0, '2022-03-10 10:57:20.841000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047583961090, 'OrderFindController#findOrderSkuIds', '查询订单包含的skuIds', 'GET', '/order/findOrderSkuIds', '订单查询', b'1', b'1', '订单查询 查询订单包含的skuIds', 0, '2022-03-10 10:57:20.841000', 0, '2022-03-10 10:57:20.841000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047583961091, 'MessageTemplateController#rendering', '渲染模板', 'GET', '/message/template/rendering', '消息模板', b'1', b'1', '消息模板 渲染模板', 0, '2022-03-10 10:57:20.841000', 0, '2022-03-10 10:57:20.841000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047588155392, 'MailSendController#sentSimpleMail', '发送简单邮件', 'POST', '/mail/send/sentSimpleMail', '邮件发送', b'1', b'1', '邮件发送 发送简单邮件', 0, '2022-03-10 10:57:20.842000', 0, '2022-03-10 10:57:20.842000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047588155393, 'ActivityController#findAll', '查询活动', 'GET', '/activity/findAll', '活动', b'1', b'1', '活动 查询活动', 0, '2022-03-10 10:57:20.842000', 0, '2022-03-10 10:57:20.842000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047592349696, 'SiteMessageController#getReceiveCount', '获取接收消息条数', 'GET', '/site/message/getReceiveCount', '站内信', b'1', b'1', '站内信 获取接收消息条数', 0, '2022-03-10 10:57:20.843000', 0, '2022-03-10 10:57:20.843000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047592349697, 'RoleController#existsByName', '名称是否被使用(不包含自己)', 'GET', '/role/existsByNameNotId', '角色管理', b'1', b'1', '角色管理 名称是否被使用(不包含自己)', 0, '2022-03-10 10:57:20.843000', 0, '2022-03-10 10:57:20.843000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047592349698, 'RoleController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/role/existsByCodeNotId', '角色管理', b'1', b'1', '角色管理 编码是否被使用(不包含自己)', 0, '2022-03-10 10:57:20.843000', 0, '2022-03-10 10:57:20.843000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047596544000, 'AggregateController#createAggregatePay', '创建聚合支付', 'POST', '/aggregate/createAggregatePay', '聚合支付', b'1', b'1', '聚合支付 创建聚合支付', 0, '2022-03-10 10:57:20.844000', 0, '2022-03-10 10:57:20.844000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047596544001, 'UserAdminController#add', '添加用户', 'POST', '/user/admin/add', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 添加用户', 0, '2022-03-10 10:57:20.844000', 0, '2022-03-10 10:57:20.844000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047596544002, 'DeptController#delete', '普通删除', 'DELETE', '/dept/delete', '部门管理', b'1', b'1', '部门管理 普通删除', 0, '2022-03-10 10:57:20.844000', 0, '2022-03-10 10:57:20.844000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047596544003, 'DataPermDemoController#add', '添加', 'POST', '/demo/data/perm/add', '数据权限演示', b'1', b'1', '数据权限演示 添加', 0, '2022-03-10 10:57:20.844000', 0, '2022-03-10 10:57:20.844000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047600738304, 'PermPathController#findById', '获取详情', 'GET', '/perm/path/findById', '请求权限资源', b'1', b'1', '请求权限资源 获取详情', 0, '2022-03-10 10:57:20.845000', 0, '2022-03-10 10:57:20.845000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047600738305, 'WalletController#getWalletByUserId', '根据用户ID查询钱包', 'GET', '/wallet/getByUserId', '钱包相关的接口', b'1', b'1', '钱包相关的接口 根据用户ID查询钱包', 0, '2022-03-10 10:57:20.845000', 0, '2022-03-10 10:57:20.845000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047600738306, 'RolePathController#save', '保存角色权限关联关系', 'POST', '/role/path/save', '角色请求权限消息关系', b'1', b'1', '角色请求权限消息关系 保存角色权限关联关系', 0, '2022-03-10 10:57:20.845000', 0, '2022-03-10 10:57:20.845000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047600738307, 'RoleController#existsByName', '名称是否被使用', 'GET', '/role/existsByName', '角色管理', b'1', b'1', '角色管理 名称是否被使用', 0, '2022-03-10 10:57:20.845000', 0, '2022-03-10 10:57:20.845000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047604932608, 'DataScopeController#existsByName', '名称是否被使用(不包含自己)', 'GET', '/data/scope/existsByNameNotId', '数据范围权限配置', b'1', b'1', '数据范围权限配置 名称是否被使用(不包含自己)', 0, '2022-03-10 10:57:20.846000', 0, '2022-03-10 10:57:20.846000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047604932609, 'PermMenuController#resourceList', '资源列表', 'GET', '/perm/menu/resourceList', '菜单权限资源', b'1', b'1', '菜单权限资源 资源列表', 0, '2022-03-10 10:57:20.846000', 0, '2022-03-10 10:57:20.846000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047604932610, 'DatabaseTableController#findAll', '表列表', 'GET', '/gen/table/findAll', '数据库表信息', b'1', b'1', '数据库表信息 表列表', 0, '2022-03-10 10:57:20.846000', 0, '2022-03-10 10:57:20.846000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047604932611, 'UserInfoController#getUserSecurityInfo', '查询用户安全信息', 'GET', '/user/getUserSecurityInfo', '用户管理', b'1', b'1', '用户管理 查询用户安全信息', 0, '2022-03-10 10:57:20.846000', 0, '2022-03-10 10:57:20.846000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047604932612, 'OrderFindController#findPayTimeoutOrderIdsByType', '获取指定类型超时订单的id集合', 'GET', '/order/findPayTimeoutOrderIdsByType', '订单查询', b'1', b'1', '订单查询 获取指定类型超时订单的id集合', 0, '2022-03-10 10:57:20.846000', 0, '2022-03-10 10:57:20.846000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047609126912, 'SiteMessageController#pageBySender', '发送消息分页', 'GET', '/site/message/pageBySender', '站内信', b'1', b'1', '站内信 发送消息分页', 0, '2022-03-10 10:57:20.847000', 0, '2022-03-10 10:57:20.847000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047609126913, 'QuartzJobController#delete', '删除', 'DELETE', '/quartz/delete', '定时任务', b'1', b'1', '定时任务 删除', 0, '2022-03-10 10:57:20.847000', 0, '2022-03-10 10:57:20.847000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047609126914, 'QuartzJobController#execute', '立即执行', 'POST', '/quartz/execute', '定时任务', b'1', b'1', '定时任务 立即执行', 0, '2022-03-10 10:57:20.847000', 0, '2022-03-10 10:57:20.847000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047609126915, 'StrategyController#findAll', '查询全部策略', 'GET', '/strategy/findAll', '策略定义', b'1', b'1', '策略定义 查询全部策略', 0, '2022-03-10 10:57:20.847000', 0, '2022-03-10 10:57:20.847000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047613321216, 'PaymentController#findById', '根据id获取', 'GET', '/payment/findById', '支付记录', b'1', b'1', '支付记录 根据id获取', 0, '2022-03-10 10:57:20.848000', 0, '2022-03-10 10:57:20.848000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047613321217, 'OrderOperateController#paidOrderState', '付款成功状态变更', 'POST', '/order/paidOrderState', '订单操作', b'1', b'1', '订单操作 付款成功状态变更', 0, '2022-03-10 10:57:20.848000', 0, '2022-03-10 10:57:20.848000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047613321218, 'WeChatPayConfigController#clearActivity', '清除指定的微信支付配置', 'POST', '/wechat/pay/clearActivity', '微信支付', b'1', b'1', '微信支付 清除指定的微信支付配置', 0, '2022-03-10 10:57:20.848000', 0, '2022-03-10 10:57:20.848000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047613321219, 'SystemParamController#existsByKeyNotId', '判断编码是否存在(不包含自己)', 'GET', '/system/param/existsByKeyNotId', '系统参数', b'1', b'1', '系统参数 判断编码是否存在(不包含自己)', 0, '2022-03-10 10:57:20.848000', 0, '2022-03-10 10:57:20.848000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047617515520, 'DictionaryItemController#findByDictionaryId', '查询指定字典ID下的所有字典项', 'GET', '/dict/item/findByDictionaryId', '字典项', b'1', b'1', '字典项 查询指定字典ID下的所有字典项', 0, '2022-03-10 10:57:20.849000', 0, '2022-03-10 10:57:20.849000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047617515521, 'CouponController#lockByIds', '批量锁定优惠券', 'POST', '/coupon/lockByIds', '优惠券', b'1', b'1', '优惠券 批量锁定优惠券', 0, '2022-03-10 10:57:20.849000', 0, '2022-03-10 10:57:20.849000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047617515522, 'ClientController#findAll', '查询所有的终端', 'GET', '/client/findAll', '终端管理', b'1', b'1', '终端管理 查询所有的终端', 0, '2022-03-10 10:57:20.849000', 0, '2022-03-10 10:57:20.849000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047621709824, 'QuartzJobController#judgeJobClass', '判断是否是定时任务类', 'GET', '/quartz/judgeJobClass', '定时任务', b'1', b'1', '定时任务 判断是否是定时任务类', 0, '2022-03-10 10:57:20.850000', 0, '2022-03-10 10:57:20.850000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047621709825, 'UserRoleController#findRoleIdsByUser', '根据用户ID获取到角色id集合', 'GET', '/user/role/findRoleIdsByUser', '用户角色管理', b'1', b'1', '用户角色管理 根据用户ID获取到角色id集合', 0, '2022-03-10 10:57:20.850000', 0, '2022-03-10 10:57:20.850000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047621709826, 'GoodsSkuController#findBySkuIds', '获取sku集合', 'GET', '/sku/findBySkuIds', 'sku操作', b'1', b'1', 'sku操作 获取sku集合', 0, '2022-03-10 10:57:20.850000', 0, '2022-03-10 10:57:20.850000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047625904128, 'StrategyController#findConfigs', '获取参数配置', 'GET', '/strategy/findConfigs', '策略定义', b'1', b'1', '策略定义 获取参数配置', 0, '2022-03-10 10:57:20.851000', 0, '2022-03-10 10:57:20.851000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047625904129, 'PaymentController#findPayTypeInfoByBusinessId', '根据businessId获取订单支付方式', 'GET', '/payment/findPayTypeInfoByBusinessId', '支付记录', b'1', b'1', '支付记录 根据businessId获取订单支付方式', 0, '2022-03-10 10:57:20.851000', 0, '2022-03-10 10:57:20.851000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047625904130, 'MailConfigController#setUpActivity', '设置启用的邮箱配置', 'POST', '/mail/config/setUpActivity', '邮箱配置', b'1', b'1', '邮箱配置 设置启用的邮箱配置', 0, '2022-03-10 10:57:20.851000', 0, '2022-03-10 10:57:20.851000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047625904131, 'AlipayConfigController#page', '分页', 'GET', '/alipay/page', '支付宝配置', b'1', b'1', '支付宝配置 分页', 0, '2022-03-10 10:57:20.851000', 0, '2022-03-10 10:57:20.851000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047625904132, 'RoleController#existsByCode', '编码是否被使用', 'GET', '/role/existsByCode', '角色管理', b'1', b'1', '角色管理 编码是否被使用', 0, '2022-03-10 10:57:20.851000', 0, '2022-03-10 10:57:20.851000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047630098432, 'LoginLogController#page', '分页', 'GET', '/log/login/page', '登录日志', b'1', b'1', '登录日志 分页', 0, '2022-03-10 10:57:20.852000', 0, '2022-03-10 10:57:20.852000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047630098433, 'ClientController#update', '修改终端（返回终端对象）', 'POST', '/client/update', '终端管理', b'1', b'1', '终端管理 修改终端（返回终端对象）', 0, '2022-03-10 10:57:20.852000', 0, '2022-03-10 10:57:20.852000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047630098434, 'UserInfoController#getUserBaseInfo', '查询用户基础信息', 'GET', '/user/getUserBaseInfo', '用户管理', b'1', b'1', '用户管理 查询用户基础信息', 0, '2022-03-10 10:57:20.852000', 0, '2022-03-10 10:57:20.852000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047630098435, 'PermMenuController#update', '修改菜单权限', 'POST', '/perm/menu/update', '菜单权限资源', b'1', b'1', '菜单权限资源 修改菜单权限', 0, '2022-03-10 10:57:20.852000', 0, '2022-03-10 10:57:20.852000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047630098436, 'ClientController#superPage', '超级查询', 'POST', '/client/superPage', '终端管理', b'1', b'1', '终端管理 超级查询', 0, '2022-03-10 10:57:20.852000', 0, '2022-03-10 10:57:20.852000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047634292736, 'DictionaryItemController#delete', '删除字典项', 'DELETE', '/dict/item/delete', '字典项', b'1', b'1', '字典项 删除字典项', 0, '2022-03-10 10:57:20.853000', 0, '2022-03-10 10:57:20.853000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047634292737, 'DictionaryController#delete', '根据id删除', 'DELETE', '/dict/delete', '字典', b'1', b'1', '字典 根据id删除', 0, '2022-03-10 10:57:20.853000', 0, '2022-03-10 10:57:20.853000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047634292738, 'UserInfoController#existsUsername', '账号是否被使用(不包含自己)', 'GET', '/user/existsUsernameNotId', '用户管理', b'1', b'1', '用户管理 账号是否被使用(不包含自己)', 0, '2022-03-10 10:57:20.853000', 0, '2022-03-10 10:57:20.853000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047634292739, 'PermPathController#page', '权限分页', 'GET', '/perm/path/page', '请求权限资源', b'1', b'1', '请求权限资源 权限分页', 0, '2022-03-10 10:57:20.853000', 0, '2022-03-10 10:57:20.853000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047634292740, 'DeptController#update', '更新', 'POST', '/dept/update', '部门管理', b'1', b'1', '部门管理 更新', 0, '2022-03-10 10:57:20.853000', 0, '2022-03-10 10:57:20.853000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047638487040, 'QuartzJobController#update', '更新', 'POST', '/quartz/update', '定时任务', b'1', b'1', '定时任务 更新', 0, '2022-03-10 10:57:20.854000', 0, '2022-03-10 10:57:20.854000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047638487041, 'CodeGeneratorController#genCodeZip', '下载生成代码', 'POST', '/gen/code/genCodeZip', '代码生成', b'1', b'1', '代码生成 下载生成代码', 0, '2022-03-10 10:57:20.854000', 0, '2022-03-10 10:57:20.854000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047638487042, 'WeChatPayConfigController#update', '更新', 'POST', '/wechat/pay/update', '微信支付', b'1', b'1', '微信支付 更新', 0, '2022-03-10 10:57:20.854000', 0, '2022-03-10 10:57:20.854000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047638487043, 'SuperQueryDemoController#findById', '通过ID查询', 'GET', '/demo/super/query/findById', '超级查询演示', b'1', b'1', '超级查询演示 通过ID查询', 0, '2022-03-10 10:57:20.854000', 0, '2022-03-10 10:57:20.854000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047642681344, 'OrderFindController#page', '订单列表 分页', 'GET', '/order/page', '订单查询', b'1', b'1', '订单查询 订单列表 分页', 0, '2022-03-10 10:57:20.855000', 0, '2022-03-10 10:57:20.855000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047642681345, 'SuperQueryDemoController#superQuery', '超级查询(分页)', 'POST', '/demo/super/query/superQuery', '超级查询演示', b'1', b'1', '超级查询演示 超级查询(分页)', 0, '2022-03-10 10:57:20.855000', 0, '2022-03-10 10:57:20.855000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047642681346, 'PayCallbackController#wechat', '微信支付回调', 'POST', '/pay/callback/wechat', '支付回调', b'1', b'1', '支付回调 微信支付回调', 0, '2022-03-10 10:57:20.855000', 0, '2022-03-10 10:57:20.855000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047642681347, 'RoleMenuController#findMenuIds', '获取权限菜单id列表,不包含资源权限', 'GET', '/role/menu/findMenuIds', '角色菜单权限关系', b'1', b'1', '角色菜单权限关系 获取权限菜单id列表,不包含资源权限', 0, '2022-03-10 10:57:20.855000', 0, '2022-03-10 10:57:20.855000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047642681348, 'UserInfoController#existsUsername', '账号是否被使用', 'GET', '/user/existsUsername', '用户管理', b'1', b'1', '用户管理 账号是否被使用', 0, '2022-03-10 10:57:20.855000', 0, '2022-03-10 10:57:20.855000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047646875648, 'ClientController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/client/existsByCodeNotId', '终端管理', b'1', b'1', '终端管理 编码是否被使用(不包含自己)', 0, '2022-03-10 10:57:20.856000', 0, '2022-03-10 10:57:20.856000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047646875649, 'TestController#Idempotent', '幂等演示', 'GET', '/test/idempotent', '测试控制器', b'1', b'1', '测试控制器 幂等演示', 0, '2022-03-10 10:57:20.856000', 0, '2022-03-10 10:57:20.856000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047646875650, 'PermMenuController#existsByPermCode', '编码是否被使用', 'GET', '/perm/menu/existsByPermCode', '菜单权限资源', b'1', b'1', '菜单权限资源 编码是否被使用', 0, '2022-03-10 10:57:20.856000', 0, '2022-03-10 10:57:20.856000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047646875651, 'OrderRecommendController#findActivity', '查询适用的活动', 'POST', '/order/recommend/findActivity', '订单优惠选择与推荐', b'1', b'1', '订单优惠选择与推荐 查询适用的活动', 0, '2022-03-10 10:57:20.856000', 0, '2022-03-10 10:57:20.856000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047651069952, 'AlipayConfigController#add', '添加', 'POST', '/alipay/add', '支付宝配置', b'1', b'1', '支付宝配置 添加', 0, '2022-03-10 10:57:20.857000', 0, '2022-03-10 10:57:20.857000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047651069953, 'UserInfoController#existsEmail', '邮箱是否被使用', 'GET', '/user/existsEmail', '用户管理', b'1', b'1', '用户管理 邮箱是否被使用', 0, '2022-03-10 10:57:20.857000', 0, '2022-03-10 10:57:20.857000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047651069954, 'MailConfigController#delete', '删除', 'DELETE', '/mail/config/delete', '邮箱配置', b'1', b'1', '邮箱配置 删除', 0, '2022-03-10 10:57:20.857000', 0, '2022-03-10 10:57:20.857000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047655264256, 'InventoryController#lockInventory', '锁定库存', 'POST', '/inventory/lockInventory', '库存操作', b'1', b'1', '库存操作 锁定库存', 0, '2022-03-10 10:57:20.858000', 0, '2022-03-10 10:57:20.858000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047655264257, 'UserDataScopeController#findAllByUser', '根据用户ID获取到部门集合', 'GET', '/user/data/scope/findAllByUser', '用户数据权限配置', b'1', b'1', '用户数据权限配置 根据用户ID获取到部门集合', 0, '2022-03-10 10:57:20.858000', 0, '2022-03-10 10:57:20.858000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047655264258, 'SuperQueryDemoController#delete', '删除', 'DELETE', '/demo/super/query/delete', '超级查询演示', b'1', b'1', '超级查询演示 删除', 0, '2022-03-10 10:57:20.858000', 0, '2022-03-10 10:57:20.858000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047663652864, 'PermMenuController#delete', '删除', 'DELETE', '/perm/menu/delete', '菜单权限资源', b'1', b'1', '菜单权限资源 删除', 0, '2022-03-10 10:57:20.860000', 0, '2022-03-10 10:57:20.860000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047667847168, 'DingRobotSendController#sendMarkdown', '测试发送Markdown', 'POST', '/ding/robot/send/markdown', '钉钉机器人发送', b'1', b'1', '钉钉机器人发送 测试发送Markdown', 0, '2022-03-10 10:57:20.861000', 0, '2022-03-10 10:57:20.861000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047667847169, 'WeChatPayConfigController#page', '分页', 'GET', '/wechat/pay/page', '微信支付', b'1', b'1', '微信支付 分页', 0, '2022-03-10 10:57:20.861000', 0, '2022-03-10 10:57:20.861000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047667847170, 'TestLogController#testDataVersion', '测试数据版本日志', 'POST', '/testDataVersion', '测试日志', b'1', b'1', '测试日志 测试数据版本日志', 0, '2022-03-10 10:57:20.861000', 0, '2022-03-10 10:57:20.861000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047667847171, 'MessageTemplateController#findById', '获取详情', 'GET', '/message/template/findById', '消息模板', b'1', b'1', '消息模板 获取详情', 0, '2022-03-10 10:57:20.861000', 0, '2022-03-10 10:57:20.861000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047672041472, 'TokenEndpoint#login', '普通登录', 'POST', '/token/login', '认证相关', b'1', b'1', '认证相关 普通登录', 0, '2022-03-10 10:57:20.862000', 0, '2022-03-10 10:57:20.862000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047672041473, 'PayController#refundByBusinessId', '全额退款(业务id)', 'POST', '/uni_pay/refundByBusinessId', '统一支付', b'1', b'1', '统一支付 全额退款(业务id)', 0, '2022-03-10 10:57:20.862000', 0, '2022-03-10 10:57:20.862000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047672041474, 'MessageTemplateController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/message/template/existsByCodeNotId', '消息模板', b'1', b'1', '消息模板 编码是否被使用(不包含自己)', 0, '2022-03-10 10:57:20.862000', 0, '2022-03-10 10:57:20.862000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047672041475, 'MailConfigController#page', '分页', 'GET', '/mail/config/page', '邮箱配置', b'1', b'1', '邮箱配置 分页', 0, '2022-03-10 10:57:20.862000', 0, '2022-03-10 10:57:20.862000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047676235776, 'UserAdminController#update', '修改用户', 'POST', '/user/admin/update', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 修改用户', 0, '2022-03-10 10:57:20.863000', 0, '2022-03-10 10:57:20.863000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047676235777, 'FIleUpLoadController#getFileDownloadUrl', '获取文件下载地址', 'GET', '/file/getFileDownloadUrl', '文件上传', b'1', b'1', '文件上传 获取文件下载地址', 0, '2022-03-10 10:57:20.863000', 0, '2022-03-10 10:57:20.863000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047676235778, 'MailConfigController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/mail/config/existsByCodeNotId', '邮箱配置', b'1', b'1', '邮箱配置 编码是否被使用(不包含自己)', 0, '2022-03-10 10:57:20.863000', 0, '2022-03-10 10:57:20.863000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047676235779, 'WeChatPayConfigController#setUpActivity', '设置启用的微信支付配置', 'POST', '/wechat/pay/setUpActivity', '微信支付', b'1', b'1', '微信支付 设置启用的微信支付配置', 0, '2022-03-10 10:57:20.863000', 0, '2022-03-10 10:57:20.863000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047680430080, 'InventoryController#unlockInventoryWithoutToken', '解锁没有令牌的库存', 'POST', '/inventory/unlockInventoryWithoutToken', '库存操作', b'1', b'1', '库存操作 解锁没有令牌的库存', 0, '2022-03-10 10:57:20.864000', 0, '2022-03-10 10:57:20.864000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047680430081, 'SuperQueryDemoController#add', '添加', 'POST', '/demo/super/query/add', '超级查询演示', b'1', b'1', '超级查询演示 添加', 0, '2022-03-10 10:57:20.864000', 0, '2022-03-10 10:57:20.864000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047680430082, 'SystemParamController#findById', '获取单条', 'GET', '/system/param/findById', '系统参数', b'1', b'1', '系统参数 获取单条', 0, '2022-03-10 10:57:20.864000', 0, '2022-03-10 10:57:20.864000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047680430083, 'CodeGeneratorController#codeGenPreview', '预览生成代码', 'POST', '/gen/code/codeGenPreview', '代码生成', b'1', b'1', '代码生成 预览生成代码', 0, '2022-03-10 10:57:20.865000', 0, '2022-03-10 10:57:20.865000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047684624384, 'UserInfoController#existsPhone', '手机号是否被使用(不包含自己)', 'GET', '/user/existsPhoneNotId', '用户管理', b'1', b'1', '用户管理 手机号是否被使用(不包含自己)', 0, '2022-03-10 10:57:20.865000', 0, '2022-03-10 10:57:20.865000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047684624385, 'DingRobotConfigController#update', '修改机器人配置', 'POST', '/ding/robot/config/update', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 修改机器人配置', 0, '2022-03-10 10:57:20.865000', 0, '2022-03-10 10:57:20.865000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047684624386, 'SwaggerWelcomeWebMvc#redirectToUi', 'redirectToUi', 'GET', '/swagger-ui.html', 'SwaggerWelcomeWebMvc', b'1', b'1', 'SwaggerWelcomeWebMvc redirectToUi', 0, '2022-03-10 10:57:20.865000', 0, '2022-03-10 10:57:20.865000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047684624387, 'WalletController#getWallet', '根据钱包ID查询钱包', 'GET', '/wallet/getById', '钱包相关的接口', b'1', b'1', '钱包相关的接口 根据钱包ID查询钱包', 0, '2022-03-10 10:57:20.865000', 0, '2022-03-10 10:57:20.865000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047688818688, 'OnlineUserController#logoutByUserId', '踢人下线', 'POST', '/user/online/logoutByUserId', '在线用户', b'1', b'1', '在线用户 踢人下线', 0, '2022-03-10 10:57:20.866000', 0, '2022-03-10 10:57:20.866000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047688818689, 'MessageTemplateController#page', '分页', 'GET', '/message/template/page', '消息模板', b'1', b'1', '消息模板 分页', 0, '2022-03-10 10:57:20.866000', 0, '2022-03-10 10:57:20.866000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047688818690, 'FIleUpLoadController#getFilePreviewUrl', '获取文件预览地址', 'GET', '/file/getFilePreviewUrl', '文件上传', b'1', b'1', '文件上传 获取文件预览地址', 0, '2022-03-10 10:57:20.866000', 0, '2022-03-10 10:57:20.866000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047688818691, 'MailConfigController#findAll', '获取所有邮箱配置', 'GET', '/mail/config/findAll', '邮箱配置', b'1', b'1', '邮箱配置 获取所有邮箱配置', 0, '2022-03-10 10:57:20.866000', 0, '2022-03-10 10:57:20.866000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047693012992, 'MessageTemplateController#update', '更新', 'POST', '/message/template/update', '消息模板', b'1', b'1', '消息模板 更新', 0, '2022-03-10 10:57:20.867000', 0, '2022-03-10 10:57:20.867000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047693012993, 'DictionaryController#existsByCode', '编码是否被使用', 'GET', '/dict/existsByCode', '字典', b'1', b'1', '字典 编码是否被使用', 0, '2022-03-10 10:57:20.867000', 0, '2022-03-10 10:57:20.867000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047693012994, 'RoleMenuController#getPermissions', '获取菜单和资源权限', 'GET', '/role/menu/getPermissions', '角色菜单权限关系', b'1', b'1', '角色菜单权限关系 获取菜单和资源权限', 0, '2022-03-10 10:57:20.867000', 0, '2022-03-10 10:57:20.867000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047693012995, 'DataScopeController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/data/scope/existsByCodeNotId', '数据范围权限配置', b'1', b'1', '数据范围权限配置 编码是否被使用(不包含自己)', 0, '2022-03-10 10:57:20.867000', 0, '2022-03-10 10:57:20.867000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047693012996, 'DataScopeController#existsByName', '名称是否被使用', 'GET', '/data/scope/existsByName', '数据范围权限配置', b'1', b'1', '数据范围权限配置 名称是否被使用', 0, '2022-03-10 10:57:20.867000', 0, '2022-03-10 10:57:20.867000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047693012997, 'UserAdminController#lock', '锁定用户', 'POST', '/user/admin/lock', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 锁定用户', 0, '2022-03-10 10:57:20.867000', 0, '2022-03-10 10:57:20.867000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047697207296, 'DingRobotConfigController#findAll', '查询全部', 'GET', '/ding/robot/config/findAll', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 查询全部', 0, '2022-03-10 10:57:20.868000', 0, '2022-03-10 10:57:20.868000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047697207297, 'DataScopeController#findAll', '查询全部', 'GET', '/data/scope/findAll', '数据范围权限配置', b'1', b'1', '数据范围权限配置 查询全部', 0, '2022-03-10 10:57:20.868000', 0, '2022-03-10 10:57:20.868000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047697207298, 'DataPermDemoController#update', '修改', 'POST', '/demo/data/perm/update', '数据权限演示', b'1', b'1', '数据权限演示 修改', 0, '2022-03-10 10:57:20.868000', 0, '2022-03-10 10:57:20.868000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047697207299, 'DictionaryItemController#findAll', '获取全部字典项', 'GET', '/dict/item/findAll', '字典项', b'1', b'1', '字典项 获取全部字典项', 0, '2022-03-10 10:57:20.868000', 0, '2022-03-10 10:57:20.868000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047697207300, 'UserDataScopeController#saveAssign', '给用户分配权限', 'POST', '/user/data/scope/saveAssign', '用户数据权限配置', b'1', b'1', '用户数据权限配置 给用户分配权限', 0, '2022-03-10 10:57:20.868000', 0, '2022-03-10 10:57:20.868000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047701401600, 'UserInfoController#existsEmail', '邮箱是否被使用(不包含自己)', 'GET', '/user/existsEmailNotId', '用户管理', b'1', b'1', '用户管理 邮箱是否被使用(不包含自己)', 0, '2022-03-10 10:57:20.869000', 0, '2022-03-10 10:57:20.869000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047701401601, 'AlipayConfigController#findPayWayList', '支付宝支持支付方式', 'GET', '/alipay/findPayWayList', '支付宝配置', b'1', b'1', '支付宝配置 支付宝支持支付方式', 0, '2022-03-10 10:57:20.869000', 0, '2022-03-10 10:57:20.869000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047701401602, 'DictionaryItemController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/dict/item/existsByCodeNotId', '字典项', b'1', b'1', '字典项 编码是否被使用(不包含自己)', 0, '2022-03-10 10:57:20.869000', 0, '2022-03-10 10:57:20.869000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047701401603, 'PermMenuController#findById', '根据id查询', 'GET', '/perm/menu/findById', '菜单权限资源', b'1', b'1', '菜单权限资源 根据id查询', 0, '2022-03-10 10:57:20.869000', 0, '2022-03-10 10:57:20.869000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047701401604, 'UserDataScopeController#findDataScopeIdsByUser', '根据用户ID获取到部门id集合', 'GET', '/user/data/scope/findIdsByUser', '用户数据权限配置', b'1', b'1', '用户数据权限配置 根据用户ID获取到部门id集合', 0, '2022-03-10 10:57:20.869000', 0, '2022-03-10 10:57:20.869000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047701401605, 'SwaggerConfigResource#openapiJson', 'openapiJson', 'GET', '/v3/api-docs/swagger-config', 'SwaggerConfigResource', b'1', b'1', 'SwaggerConfigResource openapiJson', 0, '2022-03-10 10:57:20.870000', 0, '2022-03-10 10:57:20.870000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047705595904, 'QuartzJobController#findById', '单条', 'GET', '/quartz/findById', '定时任务', b'1', b'1', '定时任务 单条', 0, '2022-03-10 10:57:20.870000', 0, '2022-03-10 10:57:20.870000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047705595905, 'WeChatPayConfigController#findPayWayList', '微信支持支付方式', 'GET', '/wechat/pay/findPayWayList', '微信支付', b'1', b'1', '微信支付 微信支持支付方式', 0, '2022-03-10 10:57:20.870000', 0, '2022-03-10 10:57:20.870000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047705595906, 'UserInfoController#updateBaseInfo', '修改用户基础信息', 'POST', '/user/updateBaseInfo', '用户管理', b'1', b'1', '用户管理 修改用户基础信息', 0, '2022-03-10 10:57:20.870000', 0, '2022-03-10 10:57:20.870000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047705595907, 'PermPathController#add', '添加权限', 'POST', '/perm/path/add', '请求权限资源', b'1', b'1', '请求权限资源 添加权限', 0, '2022-03-10 10:57:20.870000', 0, '2022-03-10 10:57:20.870000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047705595908, 'GoodsController#findById', '查询包含商品信息', 'GET', '/goods/findById', '商品管理', b'1', b'1', '商品管理 查询包含商品信息', 0, '2022-03-10 10:57:20.870000', 0, '2022-03-10 10:57:20.870000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047709790208, 'DictionaryItemController#pageByDictionaryId', '分页查询指定字典下的字典项', 'GET', '/dict/item/pageByDictionaryId', '字典项', b'1', b'1', '字典项 分页查询指定字典下的字典项', 0, '2022-03-10 10:57:20.871000', 0, '2022-03-10 10:57:20.871000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047709790209, 'PermPathController#syncSystem', '同步系统请求资源', 'POST', '/perm/path/syncSystem', '请求权限资源', b'1', b'1', '请求权限资源 同步系统请求资源', 0, '2022-03-10 10:57:20.871000', 0, '2022-03-10 10:57:20.871000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047709790210, 'OrderRecommendController#findCoupon', '查询适用的优惠券', 'POST', '/order/recommend/findCoupon', '订单优惠选择与推荐', b'1', b'1', '订单优惠选择与推荐 查询适用的优惠券', 0, '2022-03-10 10:57:20.871000', 0, '2022-03-10 10:57:20.871000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047709790211, 'ActivityController#add', '注册活动', 'POST', '/activity/add', '活动', b'1', b'1', '活动 注册活动', 0, '2022-03-10 10:57:20.871000', 0, '2022-03-10 10:57:20.871000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047709790212, 'MessageTemplateController#delete', '删除', 'DELETE', '/message/template/delete', '消息模板', b'1', b'1', '消息模板 删除', 0, '2022-03-10 10:57:20.871000', 0, '2022-03-10 10:57:20.871000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047709790213, 'RoleController#update', '修改角色（返回角色对象）', 'POST', '/role/update', '角色管理', b'1', b'1', '角色管理 修改角色（返回角色对象）', 0, '2022-03-10 10:57:20.871000', 0, '2022-03-10 10:57:20.871000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047713984512, 'WalletLogController#searchLog', '查询钱包日志', 'POST', '/walletLog/search', '钱包日志相关的接口', b'1', b'1', '钱包日志相关的接口 查询钱包日志', 0, '2022-03-10 10:57:20.872000', 0, '2022-03-10 10:57:20.872000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047713984513, 'DingRobotSendController#sendLink', '测试发送link', 'POST', '/ding/robot/send/link', '钉钉机器人发送', b'1', b'1', '钉钉机器人发送 测试发送link', 0, '2022-03-10 10:57:20.872000', 0, '2022-03-10 10:57:20.872000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047713984514, 'DingRobotConfigController#delete', '删除', 'DELETE', '/ding/robot/config/delete', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 删除', 0, '2022-03-10 10:57:20.872000', 0, '2022-03-10 10:57:20.872000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047713984515, 'DingRobotConfigController#findById', '获取详情', 'GET', '/ding/robot/config/findById', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 获取详情', 0, '2022-03-10 10:57:20.872000', 0, '2022-03-10 10:57:20.872000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047713984516, 'GoodsSkuController#add', '添加商品sku', 'POST', '/sku/add', 'sku操作', b'1', b'1', 'sku操作 添加商品sku', 0, '2022-03-10 10:57:20.872000', 0, '2022-03-10 10:57:20.872000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047713984517, 'AppVersionController#page', '分页', 'GET', '/app/version/page', 'app版本管理', b'1', b'1', 'app版本管理 分页', 0, '2022-03-10 10:57:20.872000', 0, '2022-03-10 10:57:20.872000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047713984518, 'PayController#refund', '退款', 'POST', '/uni_pay/refund', '统一支付', b'1', b'1', '统一支付 退款', 0, '2022-03-10 10:57:20.873000', 0, '2022-03-10 10:57:20.873000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047718178816, 'OrderOperateController#placeOrder', '传入订单和优惠, 下单', 'POST', '/order/placeOrder', '订单操作', b'1', b'1', '订单操作 传入订单和优惠, 下单', 0, '2022-03-10 10:57:20.873000', 0, '2022-03-10 10:57:20.873000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047718178817, 'SiteMessageController#pageByReceive', '接收消息分页', 'GET', '/site/message/pageByReceive', '站内信', b'1', b'1', '站内信 接收消息分页', 0, '2022-03-10 10:57:20.873000', 0, '2022-03-10 10:57:20.873000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047718178818, 'MultipleOpenApiWebMvcResource#openapiYaml', 'swagger文档', 'GET', '/v3/api-docs.yaml/{group}', 'MultipleOpenApiWebMvcResource', b'1', b'0', 'MultipleOpenApiWebMvcResource openapiYaml', 0, '2022-03-10 10:57:20.873000', 1399985191002447872, '2022-03-10 11:09:30.635000', b'1', 1);
INSERT INTO `iam_perm_path` VALUES (1501754047718178819, 'CouponController#findCoupon', '个人可用的优惠券', 'GET', '/coupon/findCoupon', '优惠券', b'1', b'1', '优惠券 个人可用的优惠券', 0, '2022-03-10 10:57:20.873000', 0, '2022-03-10 10:57:20.873000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047718178820, 'DatabaseTableController#findColumnByTableName', '获取数据表行信息', 'GET', '/gen/table/findColumnByTableName', '数据库表信息', b'1', b'1', '数据库表信息 获取数据表行信息', 0, '2022-03-10 10:57:20.873000', 0, '2022-03-10 10:57:20.873000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047722373120, 'GoodsController#getDetails', '查询包含sku的详情', 'GET', '/goods/getDetails', '商品管理', b'1', b'1', '商品管理 查询包含sku的详情', 0, '2022-03-10 10:57:20.874000', 0, '2022-03-10 10:57:20.874000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047722373121, 'DictionaryController#findAll', '查询全部', 'GET', '/dict/findAll', '字典', b'1', b'1', '字典 查询全部', 0, '2022-03-10 10:57:20.874000', 0, '2022-03-10 10:57:20.874000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047722373122, 'StrategyController#update', '更新策略', 'POST', '/strategy/update', '策略定义', b'1', b'1', '策略定义 更新策略', 0, '2022-03-10 10:57:20.874000', 0, '2022-03-10 10:57:20.874000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047722373123, 'QuartzJobController#page', '分页', 'GET', '/quartz/page', '定时任务', b'1', b'1', '定时任务 分页', 0, '2022-03-10 10:57:20.874000', 0, '2022-03-10 10:57:20.874000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501754047726567424, 'CategoryController#deleteCategoryById', '通过 id 删除类目', 'DELETE', '/category/delete', '类目管理', b'1', b'1', '类目管理 通过 id 删除类目', 0, '2022-03-10 10:57:20.875000', 0, '2022-03-10 10:57:20.875000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1501759344775995392, 'MultipleOpenApiWebMvcResource#openapiYaml', 'openapiYaml111', 'GET', '/v3/api-docs.yaml/{group}', 'MultipleOpenApiWebMvcResource', b'1', b'0', 'MultipleOpenApiWebMvcResource openapiYaml', 0, '2022-03-10 11:18:23.791000', 1399985191002447872, '2022-03-10 11:18:31.803000', b'0', 1);

-- ----------------------------
-- Table structure for iam_role
-- ----------------------------
DROP TABLE IF EXISTS `iam_role`;
CREATE TABLE `iam_role`  (
  `id` bigint(20) NOT NULL COMMENT '角色ID',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `internal` bit(1) NOT NULL COMMENT '是否系统内置',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '说明',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_role
-- ----------------------------
INSERT INTO `iam_role` VALUES (1405414804771971072, 'admin', '管理员', b'1', '管理员', 1, '2021-06-17 14:39:35', 1399985191002447872, '2021-07-18 22:31:02', 6, 0);
INSERT INTO `iam_role` VALUES (1416730722714144768, 'test', '测试', b'0', '测试角色', 1399985191002447872, '2021-07-18 20:05:01', 1399985191002447872, '2021-07-18 20:16:15', 1, 0);
INSERT INTO `iam_role` VALUES (1422832797731778562, 'user', '用户', b'0', '用户角色', 0, '2021-08-04 16:12:29', 1399985191002447872, '2021-08-04 16:15:03', 7, 0);
INSERT INTO `iam_role` VALUES (1428891259564445696, 'manager', '管理者', b'0', 'manager管理者', 1399985191002447872, '2021-08-21 09:26:38', 1399985191002447872, '2021-08-21 09:26:39', 0, 1);

-- ----------------------------
-- Table structure for iam_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `iam_role_menu`;
CREATE TABLE `iam_role_menu`  (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `permission_id` bigint(20) NOT NULL COMMENT '菜单权限id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_group_per_id`(`permission_id`) USING BTREE,
  INDEX `index_group_role_per_id`(`role_id`, `permission_id`) USING BTREE,
  INDEX `index_group_role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_role_menu
-- ----------------------------
INSERT INTO `iam_role_menu` VALUES (1473094793843101696, 1405414804771971072, 1414596052497092608);
INSERT INTO `iam_role_menu` VALUES (1473094793859878915, 1405414804771971072, 1414596647509446656);
INSERT INTO `iam_role_menu` VALUES (1473094793847296000, 1405414804771971072, 1414596773275652096);
INSERT INTO `iam_role_menu` VALUES (1473094793859878912, 1405414804771971072, 1414596805538238464);
INSERT INTO `iam_role_menu` VALUES (1473094793864073216, 1405414804771971072, 1414596842322284544);
INSERT INTO `iam_role_menu` VALUES (1473094793868267520, 1405414804771971072, 1414596877617352704);
INSERT INTO `iam_role_menu` VALUES (1473094793864073217, 1405414804771971072, 1431082258161434624);
INSERT INTO `iam_role_menu` VALUES (1473094793868267521, 1405414804771971072, 1431083330909208576);
INSERT INTO `iam_role_menu` VALUES (1473094793859878913, 1405414804771971072, 1431089129232498688);
INSERT INTO `iam_role_menu` VALUES (1473094793851490305, 1405414804771971072, 1435143678721236992);
INSERT INTO `iam_role_menu` VALUES (1473094793851490306, 1405414804771971072, 1435476255797624832);
INSERT INTO `iam_role_menu` VALUES (1473094793872461826, 1405414804771971072, 1438061887002759168);
INSERT INTO `iam_role_menu` VALUES (1473094793872461827, 1405414804771971072, 1438072357281542144);
INSERT INTO `iam_role_menu` VALUES (1473094793872461828, 1405414804771971072, 1439196893514031104);
INSERT INTO `iam_role_menu` VALUES (1473094793876656128, 1405414804771971072, 1440216178722050048);
INSERT INTO `iam_role_menu` VALUES (1473094793876656129, 1405414804771971072, 1440216612211757056);
INSERT INTO `iam_role_menu` VALUES (1473094793864073218, 1405414804771971072, 1450473063320526848);
INSERT INTO `iam_role_menu` VALUES (1473094793872461824, 1405414804771971072, 1450803906215886848);
INSERT INTO `iam_role_menu` VALUES (1473094793876656130, 1405414804771971072, 1450827660459458560);
INSERT INTO `iam_role_menu` VALUES (1473094793851490304, 1405414804771971072, 1452567897717321728);
INSERT INTO `iam_role_menu` VALUES (1473094793855684608, 1405414804771971072, 1452569339987472384);
INSERT INTO `iam_role_menu` VALUES (1473094793859878914, 1405414804771971072, 1452569691537256448);
INSERT INTO `iam_role_menu` VALUES (1473094793864073219, 1405414804771971072, 1452571269199540224);
INSERT INTO `iam_role_menu` VALUES (1473094793872461825, 1405414804771971072, 1452638905302966272);
INSERT INTO `iam_role_menu` VALUES (1477990982933729280, 1416730722714144768, 1414596052497092608);
INSERT INTO `iam_role_menu` VALUES (1477990982946312194, 1416730722714144768, 1414596647509446656);
INSERT INTO `iam_role_menu` VALUES (1477990982942117888, 1416730722714144768, 1414596773275652096);
INSERT INTO `iam_role_menu` VALUES (1477990982942117893, 1416730722714144768, 1414596805538238464);
INSERT INTO `iam_role_menu` VALUES (1477990982946312195, 1416730722714144768, 1414596842322284544);
INSERT INTO `iam_role_menu` VALUES (1477990982950506496, 1416730722714144768, 1414596877617352704);
INSERT INTO `iam_role_menu` VALUES (1477990982946312196, 1416730722714144768, 1431082258161434624);
INSERT INTO `iam_role_menu` VALUES (1477990982950506497, 1416730722714144768, 1431083330909208576);
INSERT INTO `iam_role_menu` VALUES (1477990982942117894, 1416730722714144768, 1431089129232498688);
INSERT INTO `iam_role_menu` VALUES (1477990982942117890, 1416730722714144768, 1435143678721236992);
INSERT INTO `iam_role_menu` VALUES (1477990982942117891, 1416730722714144768, 1435476255797624832);
INSERT INTO `iam_role_menu` VALUES (1477990982946312197, 1416730722714144768, 1450473063320526848);
INSERT INTO `iam_role_menu` VALUES (1477990982954700800, 1416730722714144768, 1450803906215886848);
INSERT INTO `iam_role_menu` VALUES (1477990982942117889, 1416730722714144768, 1452567897717321728);
INSERT INTO `iam_role_menu` VALUES (1477990982942117892, 1416730722714144768, 1452569339987472384);
INSERT INTO `iam_role_menu` VALUES (1477990982946312193, 1416730722714144768, 1452569691537256448);
INSERT INTO `iam_role_menu` VALUES (1477990982946312198, 1416730722714144768, 1452571269199540224);
INSERT INTO `iam_role_menu` VALUES (1477990982954700801, 1416730722714144768, 1452638905302966272);
INSERT INTO `iam_role_menu` VALUES (1477990982946312192, 1416730722714144768, 1474694545336676352);
INSERT INTO `iam_role_menu` VALUES (1461167183761506304, 1429280485141336064, 1414596052497092608);
INSERT INTO `iam_role_menu` VALUES (1461167183795060736, 1429280485141336064, 1414596647509446656);
INSERT INTO `iam_role_menu` VALUES (1461167183769894912, 1429280485141336064, 1414596773275652096);
INSERT INTO `iam_role_menu` VALUES (1461167183778283521, 1429280485141336064, 1414596805538238464);
INSERT INTO `iam_role_menu` VALUES (1461167183799255040, 1429280485141336064, 1414596842322284544);
INSERT INTO `iam_role_menu` VALUES (1461167183803449346, 1429280485141336064, 1414596877617352704);
INSERT INTO `iam_role_menu` VALUES (1461167183799255041, 1429280485141336064, 1431082258161434624);
INSERT INTO `iam_role_menu` VALUES (1461167183803449347, 1429280485141336064, 1431083330909208576);
INSERT INTO `iam_role_menu` VALUES (1461167183778283522, 1429280485141336064, 1431089129232498688);
INSERT INTO `iam_role_menu` VALUES (1461167183807643650, 1429280485141336064, 1431152689832525824);
INSERT INTO `iam_role_menu` VALUES (1461167183807643651, 1429280485141336064, 1431153358157348864);
INSERT INTO `iam_role_menu` VALUES (1461167183769894914, 1429280485141336064, 1435143678721236992);
INSERT INTO `iam_role_menu` VALUES (1461167183774089216, 1429280485141336064, 1435476255797624832);
INSERT INTO `iam_role_menu` VALUES (1461167183811837952, 1429280485141336064, 1438061887002759168);
INSERT INTO `iam_role_menu` VALUES (1461167183811837953, 1429280485141336064, 1438072357281542144);
INSERT INTO `iam_role_menu` VALUES (1461167183811837954, 1429280485141336064, 1439196893514031104);
INSERT INTO `iam_role_menu` VALUES (1461167183811837955, 1429280485141336064, 1440216178722050048);
INSERT INTO `iam_role_menu` VALUES (1461167183811837956, 1429280485141336064, 1440216612211757056);
INSERT INTO `iam_role_menu` VALUES (1461167183803449344, 1429280485141336064, 1450473063320526848);
INSERT INTO `iam_role_menu` VALUES (1461167183807643648, 1429280485141336064, 1450803906215886848);
INSERT INTO `iam_role_menu` VALUES (1461167183816032257, 1429280485141336064, 1450819607680991232);
INSERT INTO `iam_role_menu` VALUES (1461167183816032258, 1429280485141336064, 1450821723027881984);
INSERT INTO `iam_role_menu` VALUES (1461167183816032259, 1429280485141336064, 1450821877831254016);
INSERT INTO `iam_role_menu` VALUES (1461167183816032260, 1429280485141336064, 1450822511087271936);
INSERT INTO `iam_role_menu` VALUES (1461167183820226560, 1429280485141336064, 1450822842995130368);
INSERT INTO `iam_role_menu` VALUES (1461167183820226562, 1429280485141336064, 1450823960236081152);
INSERT INTO `iam_role_menu` VALUES (1461167183820226563, 1429280485141336064, 1450824117849636864);
INSERT INTO `iam_role_menu` VALUES (1461167183824420864, 1429280485141336064, 1450824319868289024);
INSERT INTO `iam_role_menu` VALUES (1461167183824420865, 1429280485141336064, 1450824637876224000);
INSERT INTO `iam_role_menu` VALUES (1461167183824420866, 1429280485141336064, 1450824875198332928);
INSERT INTO `iam_role_menu` VALUES (1461167183820226561, 1429280485141336064, 1450825488577544192);
INSERT INTO `iam_role_menu` VALUES (1461167183824420867, 1429280485141336064, 1450825615857893376);
INSERT INTO `iam_role_menu` VALUES (1461167183828615171, 1429280485141336064, 1450825819436826624);
INSERT INTO `iam_role_menu` VALUES (1461167183828615168, 1429280485141336064, 1450826890318135296);
INSERT INTO `iam_role_menu` VALUES (1461167183828615169, 1429280485141336064, 1450827159626006528);
INSERT INTO `iam_role_menu` VALUES (1461167183828615170, 1429280485141336064, 1450827308515409920);
INSERT INTO `iam_role_menu` VALUES (1461167183816032256, 1429280485141336064, 1450827660459458560);
INSERT INTO `iam_role_menu` VALUES (1461167183769894913, 1429280485141336064, 1452567897717321728);
INSERT INTO `iam_role_menu` VALUES (1461167183778283520, 1429280485141336064, 1452569339987472384);
INSERT INTO `iam_role_menu` VALUES (1461167183782477824, 1429280485141336064, 1452569691537256448);
INSERT INTO `iam_role_menu` VALUES (1461167183803449345, 1429280485141336064, 1452571269199540224);
INSERT INTO `iam_role_menu` VALUES (1461167183807643649, 1429280485141336064, 1452638905302966272);

-- ----------------------------
-- Table structure for iam_role_path
-- ----------------------------
DROP TABLE IF EXISTS `iam_role_path`;
CREATE TABLE `iam_role_path`  (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `permission_id` bigint(20) NOT NULL COMMENT '请求权限id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_group_per_id`(`permission_id`) USING BTREE,
  INDEX `index_group_role_per_id`(`role_id`, `permission_id`) USING BTREE,
  INDEX `index_group_role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色请求权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_role_path
-- ----------------------------

-- ----------------------------
-- Table structure for iam_user_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `iam_user_data_scope`;
CREATE TABLE `iam_user_data_scope`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `data_scope_id` bigint(20) NOT NULL COMMENT '数据权限ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户数据范围关系\r\n' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_user_data_scope
-- ----------------------------
INSERT INTO `iam_user_data_scope` VALUES (1477617820165345280, 1414143554414059520, 1474717084985270272);
INSERT INTO `iam_user_data_scope` VALUES (1477991040840290304, 1477990832987361280, 1477990439800721408);
INSERT INTO `iam_user_data_scope` VALUES (1477997504506077184, 1477997391729631232, 1477990268903804928);
INSERT INTO `iam_user_data_scope` VALUES (1477997685993611264, 1477997602862505984, 1474706893178871808);

-- ----------------------------
-- Table structure for iam_user_dept
-- ----------------------------
DROP TABLE IF EXISTS `iam_user_dept`;
CREATE TABLE `iam_user_dept`  (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `dept_id` bigint(20) NOT NULL COMMENT '部门id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_group_per_id`(`dept_id`) USING BTREE,
  INDEX `index_group_role_per_id`(`user_id`, `dept_id`) USING BTREE,
  INDEX `index_group_role_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_user_dept
-- ----------------------------
INSERT INTO `iam_user_dept` VALUES (1450088892861501440, 1399985191002447872, 1259383345604300802);
INSERT INTO `iam_user_dept` VALUES (1478741775450312704, 1435967884114194432, 1477978464559484928);
INSERT INTO `iam_user_dept` VALUES (1478741775450312705, 1435967884114194432, 1477978610865197056);
INSERT INTO `iam_user_dept` VALUES (1478741775446118400, 1435967884114194432, 1477978810526650368);
INSERT INTO `iam_user_dept` VALUES (1477996765012533248, 1477990832987361280, 1477977592291053568);
INSERT INTO `iam_user_dept` VALUES (1477997463997489152, 1477997391729631232, 1477978610865197056);
INSERT INTO `iam_user_dept` VALUES (1477997655618461696, 1477997602862505984, 1477978610865197056);

-- ----------------------------
-- Table structure for iam_user_expand_info
-- ----------------------------
DROP TABLE IF EXISTS `iam_user_expand_info`;
CREATE TABLE `iam_user_expand_info`  (
  `id` bigint(20) NOT NULL,
  `sex` int(4) NULL DEFAULT NULL COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '上次登录时间',
  `current_login_time` datetime(0) NULL DEFAULT NULL COMMENT '本次登录时间',
  `initial_password` bit(1) NOT NULL COMMENT '是否初始密码',
  `last_change_password_time` datetime(0) NULL DEFAULT NULL COMMENT '上次修改密码时间',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户扩展信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_user_expand_info
-- ----------------------------
INSERT INTO `iam_user_expand_info` VALUES (1399985191002447872, 1, '1996-12-01', '1495331905770315776', '2022-04-05 16:53:09', '2022-04-07 17:29:50', b'0', '2022-01-09 11:36:05', 1, '2021-06-02 15:04:15', 0, '2022-04-07 17:29:50', 69, 0);
INSERT INTO `iam_user_expand_info` VALUES (1414143554414059520, 1, NULL, NULL, NULL, NULL, b'0', NULL, 1, '2021-07-11 16:44:32', 1, '2021-07-11 16:44:32', 0, 0);
INSERT INTO `iam_user_expand_info` VALUES (1435894470432456704, 1, NULL, NULL, NULL, NULL, b'0', NULL, 1399985191002447872, '2021-09-09 17:14:54', 1399985191002447872, '2021-09-09 17:14:54', 0, 0);
INSERT INTO `iam_user_expand_info` VALUES (1435967884114194432, 1, NULL, NULL, NULL, NULL, b'0', NULL, 1414143554414059520, '2021-09-09 22:06:37', 1414143554414059520, '2021-09-09 22:06:37', 0, 0);
INSERT INTO `iam_user_expand_info` VALUES (1477990832987361280, 1, NULL, NULL, NULL, NULL, b'0', NULL, 1399985191002447872, '2022-01-03 21:10:49', 1399985191002447872, '2022-01-03 21:10:49', 0, 0);
INSERT INTO `iam_user_expand_info` VALUES (1477997391729631232, 1, NULL, NULL, NULL, NULL, b'0', NULL, 1399985191002447872, '2022-01-03 21:36:53', 1399985191002447872, '2022-01-03 21:36:53', 0, 0);
INSERT INTO `iam_user_expand_info` VALUES (1477997602862505984, 1, NULL, NULL, NULL, NULL, b'0', NULL, 1399985191002447872, '2022-01-03 21:37:43', 1399985191002447872, '2022-01-03 21:37:43', 0, 0);

-- ----------------------------
-- Table structure for iam_user_info
-- ----------------------------
DROP TABLE IF EXISTS `iam_user_info`;
CREATE TABLE `iam_user_info`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `source` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '注册来源',
  `admin` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否超级管理员',
  `register_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `status` tinyint(4) NOT NULL COMMENT '账号状态',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_user_info
-- ----------------------------
INSERT INTO `iam_user_info` VALUES (1399985191002447872, '小小明', 'xxm', 'f52020dca765fd3943ed40a615dc2c5c', '13300000000', 'xxm1995@outlook.com', NULL, NULL, b'1', '2021-06-02 15:04:12', 1, 1, '2021-06-02 15:04:15', 1399985191002447872, '2022-02-20 17:38:05', 43, 0);
INSERT INTO `iam_user_info` VALUES (1414143554414059520, '小小明1995', 'xxm1995', 'f52020dca765fd3943ed40a615dc2c5c', '13000000000', 'xxm1995@foxmail.com', NULL, NULL, b'1', '2021-07-11 16:44:31', 1, 1, '2021-07-11 16:44:32', 1, '2021-07-11 16:44:32', 2, 0);
INSERT INTO `iam_user_info` VALUES (1435894470432456704, '管理员', 'admin1', 'f52020dca765fd3943ed40a615dc2c5c', '13000001111', 'admin@qq.com', '', NULL, b'0', '2021-09-09 17:14:52', 1, 1399985191002447872, '2021-09-09 17:14:54', 1399985191002447872, '2021-09-09 17:14:54', 2, 0);
INSERT INTO `iam_user_info` VALUES (1435967884114194432, '测试', 'test', 'f52020dca765fd3943ed40a615dc2c5c', '13311111111', 'test@qq.com', '', NULL, b'0', '2021-09-09 22:06:37', 1, 1414143554414059520, '2021-09-09 22:06:37', 1414143554414059520, '2021-09-09 22:06:37', 8, 0);
INSERT INTO `iam_user_info` VALUES (1477990832987361280, '测试用户001', 'test001', 'f52020dca765fd3943ed40a615dc2c5c', '', '', '', NULL, b'0', '2022-01-03 21:10:49', 1, 1399985191002447872, '2022-01-03 21:10:49', 1399985191002447872, '2022-01-03 21:10:49', 0, 0);
INSERT INTO `iam_user_info` VALUES (1477997391729631232, '测试用户002', 'test002', 'f52020dca765fd3943ed40a615dc2c5c', '', '', '', NULL, b'0', '2022-01-03 21:36:53', 1, 1399985191002447872, '2022-01-03 21:36:53', 1399985191002447872, '2022-01-03 21:36:53', 0, 0);
INSERT INTO `iam_user_info` VALUES (1477997602862505984, '测试用户003', 'test003', 'f52020dca765fd3943ed40a615dc2c5c', '', '', '', NULL, b'0', '2022-01-03 21:37:43', 1, 1399985191002447872, '2022-01-03 21:37:43', 1399985191002447872, '2022-01-03 21:37:43', 3, 0);

-- ----------------------------
-- Table structure for iam_user_role
-- ----------------------------
DROP TABLE IF EXISTS `iam_user_role`;
CREATE TABLE `iam_user_role`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户角色关系\r\n' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_user_role
-- ----------------------------
INSERT INTO `iam_user_role` VALUES (1429292064666767360, 1399985191002447872, 1405414804771971072);
INSERT INTO `iam_user_role` VALUES (1429292064670961664, 1399985191002447872, 1416730722714144768);
INSERT INTO `iam_user_role` VALUES (1429292082710663168, 1414143554414059520, 1416730722714144768);
INSERT INTO `iam_user_role` VALUES (1429292082714857472, 1414143554414059520, 1405414804771971072);
INSERT INTO `iam_user_role` VALUES (1429292082714857473, 1414143554414059520, 1422832797731778562);
INSERT INTO `iam_user_role` VALUES (1436939898410102784, 1435894470432456704, 1405414804771971072);
INSERT INTO `iam_user_role` VALUES (1477991072133992448, 1477990832987361280, 1416730722714144768);
INSERT INTO `iam_user_role` VALUES (1477997420167012352, 1477997391729631232, 1416730722714144768);
INSERT INTO `iam_user_role` VALUES (1477997628238045184, 1477997602862505984, 1416730722714144768);

-- ----------------------------
-- Table structure for iam_user_social
-- ----------------------------
DROP TABLE IF EXISTS `iam_user_social`;
CREATE TABLE `iam_user_social`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `we_chat_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信openId',
  `qq_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'qqId',
  `weibo_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微博Id',
  `gitee_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '码云唯一标识',
  `ding_talk_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钉钉唯一标识',
  `we_com_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业微信唯一标识',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户三方登录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_user_social
-- ----------------------------
INSERT INTO `iam_user_social` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);

-- ----------------------------
-- Table structure for nc_mail_config
-- ----------------------------
DROP TABLE IF EXISTS `nc_mail_config`;
CREATE TABLE `nc_mail_config`  (
  `id` bigint(20) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编号',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `host` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱服务器host',
  `port` int(5) NOT NULL COMMENT '邮箱服务器 port',
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱服务器 username',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱服务器 password',
  `sender` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱服务器 sender',
  `from_` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱服务器 from',
  `activity` tinyint(1) NULL DEFAULT 0 COMMENT '是否默认配置，0:否。1:是',
  `security_type` int(2) NULL DEFAULT NULL COMMENT '安全传输方式 1:plain 2:tls 3:ssl',
  `creator` bigint(18) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(18) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  `version` int(8) NULL DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '邮件配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nc_mail_config
-- ----------------------------
INSERT INTO `nc_mail_config` VALUES (180741934821398528, 'fox', 'fox', 'smtp.qq.com', 465, 'xxm1995@foxmail.com', 'urdwlbqjqusubeeh', 'bootx.cn', 'xxm1995@foxmail.com', 1, 3, NULL, '2021-09-15 17:53:10', 1399985191002447872, '2021-09-15 17:53:15', 0, 4);

-- ----------------------------
-- Table structure for nc_message_template
-- ----------------------------
DROP TABLE IF EXISTS `nc_message_template`;
CREATE TABLE `nc_message_template`  (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '模板数据',
  `type` int(11) NULL DEFAULT NULL COMMENT '模板类型',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nc_message_template
-- ----------------------------
INSERT INTO `nc_message_template` VALUES (1424936204932169730, 'cs', '测试', 'hello ${msg}6666666666666666666666666666', 1, '测试模板', 0, '2021-08-10 11:30:40', 0, '2021-08-10 11:30:40', 0, 0);

-- ----------------------------
-- Table structure for nc_site_message
-- ----------------------------
DROP TABLE IF EXISTS `nc_site_message`;
CREATE TABLE `nc_site_message`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息内容',
  `sender_id` bigint(20) NULL DEFAULT NULL COMMENT '发送者id',
  `sender_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者姓名',
  `receive_id` bigint(20) NULL DEFAULT NULL COMMENT '接收者id',
  `receive_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收者姓名',
  `sender_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `have_read` bit(1) NULL DEFAULT NULL COMMENT '是否已读',
  `read_time` datetime(0) NULL DEFAULT NULL COMMENT '已读时间',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '站内信' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nc_site_message
-- ----------------------------
INSERT INTO `nc_site_message` VALUES (1424212599079161857, '测试消息', '测试测试测试', 1399985191002447872, '小小明', 1414143554414059520, 'xxm', '2021-08-08 11:34:11', b'0', NULL, 1399985191002447872, '2021-08-08 11:35:19', 1399985191002447872, '2021-08-08 11:35:19', 0, 0);

-- ----------------------------
-- Table structure for nc_sms_config
-- ----------------------------
DROP TABLE IF EXISTS `nc_sms_config`;
CREATE TABLE `nc_sms_config`  (
  `id` bigint(18) NOT NULL,
  `tid` bigint(18) NOT NULL COMMENT '租户id',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `account_sid` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_sid` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送号码的唯一标识(基于twillio的命名风格)',
  `auth_token` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_num` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NULL DEFAULT 0 COMMENT '是否默认配置，0:否。1:是',
  `creator` bigint(18) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_modifier` bigint(18) NULL DEFAULT NULL,
  `last_modified_time` datetime(0) NULL DEFAULT NULL,
  `version` int(10) NULL DEFAULT NULL,
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  `secret` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `isp` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `reply_msg` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '短信配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nc_sms_config
-- ----------------------------

-- ----------------------------
-- Table structure for nc_wechat_config
-- ----------------------------
DROP TABLE IF EXISTS `nc_wechat_config`;
CREATE TABLE `nc_wechat_config`  (
  `id` bigint(18) NOT NULL,
  `tid` bigint(18) NOT NULL COMMENT '租户id',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `corp_id` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `corp_secret` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NULL DEFAULT 0 COMMENT '是否默认配置，0:否。1:是',
  `creator` bigint(18) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_modifier` bigint(18) NULL DEFAULT NULL,
  `last_modified_time` datetime(0) NULL DEFAULT NULL,
  `version` int(10) NULL DEFAULT NULL,
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '微信消息配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nc_wechat_config
-- ----------------------------
INSERT INTO `nc_wechat_config` VALUES (181361815405135421, 0, 'test01', 'test01', 'ww9d6247559117d202', '8n6A3SzN-DJNkw8wyCcJnr8-SOjFFWSOlBqZN8vypKM', 1, 1415, '2018-11-20 11:07:07', 1415, '2018-11-20 11:07:07', 0, 0);

-- ----------------------------
-- Table structure for oc_order
-- ----------------------------
DROP TABLE IF EXISTS `oc_order`;
CREATE TABLE `oc_order`  (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `contact_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `contact_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系邮箱',
  `channel_id` bigint(20) NULL DEFAULT NULL COMMENT '渠道',
  `pay_time` datetime(6) NULL DEFAULT NULL COMMENT '支付时间',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '购买用户id',
  `status` int(11) NOT NULL COMMENT '状态',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型',
  `total_amount` decimal(19, 2) NULL DEFAULT NULL COMMENT '总金额',
  `pay_amount` decimal(19, 2) NULL DEFAULT NULL COMMENT '实付金额',
  `coupon_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所用优惠券ids',
  `address_info` json NULL COMMENT '地址参数',
  `invoice_info` json NULL COMMENT '发票参数',
  `addition` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附加参数',
  `device_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备id',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源',
  `business_id` bigint(20) NULL DEFAULT NULL COMMENT '业务id',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oc_order
-- ----------------------------
INSERT INTO `oc_order` VALUES (1385055265673601024, NULL, NULL, NULL, NULL, NULL, NULL, 1001, 4, NULL, 1, 199.00, 199.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-04-22 10:18:03.094000', '2021-04-22 10:18:03.094000', 1, 0, b'0');
INSERT INTO `oc_order` VALUES (1385055750493200384, NULL, NULL, NULL, NULL, NULL, NULL, 1001, 4, NULL, 1, 199.00, 199.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-04-22 10:19:58.670000', '2021-04-22 10:19:58.670000', 1, 0, b'0');
INSERT INTO `oc_order` VALUES (1385056249619570688, NULL, NULL, NULL, NULL, NULL, '2021-04-22 10:22:30.903000', 1001, 1, NULL, 1, 199.00, 199.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-04-22 10:21:57.682000', '2021-04-27 09:41:43.229000', 1, 20, b'0');
INSERT INTO `oc_order` VALUES (1385057405993377792, NULL, NULL, NULL, NULL, NULL, NULL, 1001, 4, NULL, 1, 199.00, 199.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-04-22 10:26:33.381000', '2021-04-22 10:26:33.381000', 1, 0, b'0');
INSERT INTO `oc_order` VALUES (1407873266047148032, NULL, NULL, NULL, NULL, NULL, '2021-06-24 10:21:15.997000', 1, 2, NULL, 1, 199.00, 199.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-24 09:28:38.839000', '2021-06-24 10:21:16.183000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1407879663895863296, NULL, NULL, NULL, NULL, NULL, NULL, 1001, 4, NULL, 1, 199.00, 199.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-24 09:54:03.674000', '2021-06-25 09:46:32.136000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1407895114537394176, NULL, NULL, NULL, NULL, NULL, NULL, 1001, 4, NULL, 1, 597.00, 597.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-24 10:55:27.438000', '2021-06-25 09:46:33.375000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1407947806576107520, NULL, NULL, NULL, NULL, NULL, NULL, 1001, 4, NULL, 1, 597.00, 597.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-24 14:24:50.177000', '2021-06-25 09:46:34.107000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1407950224474923008, NULL, NULL, NULL, NULL, NULL, NULL, 1001, 4, NULL, 1, 597.00, 597.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-24 14:34:26.631000', '2021-06-25 09:46:42.477000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1407958167568146432, NULL, NULL, NULL, NULL, NULL, NULL, 1001, 4, NULL, 1, 597.00, 597.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-24 15:06:00.411000', '2021-06-25 09:46:50.084000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1408352748033957888, NULL, NULL, NULL, NULL, NULL, NULL, 1001, 4, NULL, 1, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-25 17:13:55.787000', '2021-06-25 17:44:00.641000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1408352911678922752, NULL, NULL, NULL, NULL, NULL, NULL, 1001, 4, NULL, 1, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-25 17:14:34.735000', '2021-06-25 17:49:00.637000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1408355747326222336, NULL, NULL, NULL, NULL, NULL, NULL, 1001, 4, NULL, 1, 398.00, 398.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-25 17:25:50.810000', '2021-06-25 17:59:00.876000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1408443758286102528, NULL, NULL, NULL, NULL, NULL, '2021-06-25 23:19:41.664000', 1001, 2, NULL, 1, 398.00, 398.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-25 23:15:34.769000', '2021-06-25 23:19:41.809000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1408447787535851520, NULL, NULL, NULL, NULL, NULL, '2021-06-25 23:31:41.198000', 1001, 2, NULL, 1, 398.00, 398.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-25 23:31:34.915000', '2021-06-25 23:31:41.209000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1408448478123810816, NULL, NULL, NULL, NULL, NULL, '2021-06-25 23:34:27.721000', 1001, 2, NULL, 1, 398.00, 398.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-25 23:34:19.554000', '2021-06-25 23:34:27.735000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1408449065427034112, NULL, NULL, NULL, NULL, NULL, '2021-06-25 23:37:39.906000', 1001, 2, NULL, 1, 398.00, 398.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-25 23:36:39.577000', '2021-06-25 23:37:39.916000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1408449539890896896, NULL, NULL, NULL, NULL, NULL, '2021-06-25 23:40:24.458000', 1001, 2, NULL, 1, 398.00, 398.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-25 23:38:32.699000', '2021-06-25 23:40:24.468000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1408450653524746240, NULL, NULL, NULL, NULL, NULL, '2021-06-25 23:48:23.556000', 1001, 2, NULL, 1, 398.00, 398.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-25 23:42:58.213000', '2021-06-25 23:48:23.569000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1408461390821351424, NULL, NULL, NULL, NULL, NULL, '2021-06-26 00:25:59.280000', 1001, 2, NULL, 1, 398.00, 398.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-26 00:25:38.315000', '2021-06-26 00:25:59.341000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1408462122807091200, NULL, NULL, NULL, NULL, NULL, '2021-06-26 00:28:40.429000', 1001, 2, NULL, 1, 398.00, 398.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-26 00:28:32.699000', '2021-06-26 00:28:40.439000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1408462177748279296, NULL, NULL, NULL, NULL, NULL, '2021-06-26 00:28:51.313000', 1001, 2, NULL, 1, 398.00, 398.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-26 00:28:45.797000', '2021-06-26 00:28:51.324000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1408463957144002560, NULL, NULL, NULL, NULL, NULL, '2021-06-26 00:36:00.354000', 1001, 2, NULL, 1, 398.00, 398.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-26 00:35:50.039000', '2021-06-26 00:36:00.365000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1408464072109875200, NULL, NULL, NULL, NULL, NULL, '2021-06-26 00:36:23.389000', 1001, 2, NULL, 1, 398.00, 398.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-26 00:36:17.448000', '2021-06-26 00:36:23.399000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1408464326083371008, NULL, NULL, NULL, NULL, NULL, NULL, 1001, 4, NULL, 1, 398.00, 398.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-26 00:37:18.003000', '2021-06-26 01:07:35.352000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1408464458044563456, NULL, NULL, NULL, NULL, NULL, NULL, 1001, 4, NULL, 1, 398.00, 398.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-26 00:37:49.462000', '2021-06-26 01:08:34.641000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1408464464075972608, NULL, NULL, NULL, NULL, NULL, NULL, 1001, 4, NULL, 1, 398.00, 398.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-26 00:37:50.910000', '2021-06-26 01:08:34.769000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1409385932448227328, NULL, NULL, NULL, NULL, NULL, '2021-06-28 13:41:33.009000', 1001, 2, NULL, 1, 398.00, 398.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-28 13:39:26.287000', '2021-06-28 13:41:33.102000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1409820682774274048, NULL, NULL, NULL, NULL, NULL, NULL, 1001, 4, NULL, 1, 398.00, 398.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-29 18:26:58.748000', '2021-06-29 18:57:05.542000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1409821156785152000, NULL, NULL, NULL, NULL, NULL, '2021-06-29 18:29:36.387000', 1001, 2, NULL, 1, 996.00, 996.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-29 18:28:51.655000', '2021-06-29 18:29:36.440000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1411995592082743296, NULL, NULL, NULL, NULL, NULL, NULL, 1001, 4, '测试下载', 1, 996.00, 996.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-05 18:29:17.445000', '2021-07-05 18:59:57.689000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418469208492236800, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:13:08.017000', '2021-07-23 15:43:18.951000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418470002033582080, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:16:17.048000', '2021-07-23 15:46:18.610000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418470612707467264, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:18:42.648000', '2021-07-23 15:49:08.198000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418470687991029760, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:19:00.594000', '2021-07-23 15:49:08.336000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418470818391941120, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:19:31.681000', '2021-07-23 15:50:08.273000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418470886629072896, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:19:47.952000', '2021-07-23 15:50:08.409000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418471011841630208, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:20:17.802000', '2021-07-23 15:50:18.654000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418471172370227200, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:20:56.084000', '2021-07-23 15:51:08.336000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418471648868327424, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:22:49.681000', '2021-07-23 15:53:08.796000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418472136397447168, NULL, NULL, NULL, NULL, NULL, '2021-07-23 15:24:50.906000', 1, 2, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:24:45.917000', '2021-07-23 15:24:50.976000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418473184906338304, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:28:55.902000', '2021-07-23 15:59:08.529000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418473231056265216, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:29:06.903000', '2021-07-23 15:59:08.705000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418473420210987008, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:29:52.001000', '2021-07-23 16:00:08.582000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418473513261621248, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:30:14.186000', '2021-07-23 16:00:18.704000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418473571243679744, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:30:28.014000', '2021-07-23 16:01:08.626000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418473608686231552, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:30:36.945000', '2021-07-23 16:01:08.755000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418473761170153472, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:31:13.292000', '2021-07-23 16:01:18.730000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418474023075078144, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:32:15.737000', '2021-07-23 16:02:18.741000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418474042670866432, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:32:20.406000', '2021-07-23 16:03:08.702000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418474054209396736, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:32:23.157000', '2021-07-23 16:03:08.825000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418474064795820032, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 15:32:25.680000', '2021-07-23 16:03:08.943000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418500438810058752, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 17:17:13.740000', '2021-07-23 17:47:16.921000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418500471097810944, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 17:17:21.433000', '2021-07-23 17:48:17.021000', 1, 1, b'0');
INSERT INTO `oc_order` VALUES (1418500494162288640, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, 1, 1.10, 1.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-07-23 17:17:26.933000', '2021-07-23 17:48:17.140000', 1, 1, b'0');

-- ----------------------------
-- Table structure for oc_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_detail`;
CREATE TABLE `oc_order_detail`  (
  `id` bigint(20) NOT NULL,
  `active_id` bigint(20) NULL DEFAULT NULL COMMENT '活动id',
  `shop_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺id',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '类目id',
  `goods_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT '库存id',
  `goods_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_price` decimal(19, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `num` int(11) NOT NULL COMMENT '数量',
  `total_amount` decimal(19, 2) NULL DEFAULT NULL COMMENT '总价',
  `pay_amount` decimal(19, 2) NULL DEFAULT NULL COMMENT '支付价',
  `state` int(11) NULL DEFAULT NULL COMMENT '状态',
  `addition` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附加参数',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单明细' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oc_order_detail
-- ----------------------------
INSERT INTO `oc_order_detail` VALUES (1385055265673601025, NULL, NULL, 1385055265673601024, 1, 1, 1, '测试商品', 199.00, 1, 199.00, 199.00, NULL, NULL, 1, '2021-04-22 10:18:03.097000', 1, '2021-04-22 10:18:03.097000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1385055750493200385, NULL, NULL, 1385055750493200384, 1, 1, 1, '测试商品', 199.00, 1, 199.00, 199.00, NULL, NULL, 1, '2021-04-22 10:19:58.671000', 1, '2021-04-22 10:19:58.671000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1385056249619570689, NULL, NULL, 1385056249619570688, 1, 1, 1, '测试商品', 199.00, 1, 199.00, 199.00, NULL, NULL, 1, '2021-04-22 10:21:57.689000', 1, '2021-04-22 10:21:57.689000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1385057405993377793, NULL, NULL, 1385057405993377792, 1, 1, 1, '测试商品', 199.00, 1, 199.00, 199.00, NULL, NULL, 1, '2021-04-22 10:26:33.383000', 1, '2021-04-22 10:26:33.383000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1407873266105868288, NULL, NULL, 1407873266047148032, 1, 1, 1, '测试商品', 199.00, 1, 199.00, 199.00, NULL, NULL, 1, '2021-06-24 09:28:39.111000', 1, '2021-06-24 09:28:39.111000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1407879663900057600, NULL, NULL, 1407879663895863296, 1, 1, 1, '测试商品', 199.00, 1, 199.00, 199.00, NULL, NULL, 1, '2021-06-24 09:54:03.675000', 1, '2021-06-24 09:54:03.675000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1407895114537394177, NULL, NULL, 1407895114537394176, 1, 1, 1, '测试商品', 199.00, 3, 597.00, 597.00, NULL, NULL, 1, '2021-06-24 10:55:27.446000', 1, '2021-06-24 10:55:27.446000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1407947806576107521, NULL, NULL, 1407947806576107520, 1, 1, 1, '测试商品', 199.00, 3, 597.00, 597.00, NULL, NULL, 1, '2021-06-24 14:24:50.192000', 1, '2021-06-24 14:24:50.192000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1407950224474923009, NULL, NULL, 1407950224474923008, 1, 1, 1, '测试商品', 199.00, 3, 597.00, 597.00, NULL, NULL, 1, '2021-06-24 14:34:26.632000', 1, '2021-06-24 14:34:26.632000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1407958167568146433, NULL, NULL, 1407958167568146432, 1, 1, 1, '测试商品', 199.00, 3, 597.00, 597.00, NULL, NULL, 1, '2021-06-24 15:06:00.413000', 1, '2021-06-24 15:06:00.413000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1408352748042346496, NULL, NULL, 1408352748033957888, 1, 1, 1, '测试商品', 199.00, 0, 0.00, 0.00, NULL, NULL, 1, '2021-06-25 17:13:55.826000', 1, '2021-06-25 17:13:55.826000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1408352911683117056, NULL, NULL, 1408352911678922752, 1, 1, 1, '测试商品', 199.00, 0, 0.00, 0.00, NULL, NULL, 1, '2021-06-25 17:14:34.736000', 1, '2021-06-25 17:14:34.736000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1408355747326222337, NULL, NULL, 1408355747326222336, 1, 1, 1, '测试商品', 199.00, 2, 398.00, 398.00, NULL, NULL, 1, '2021-06-25 17:25:50.818000', 1, '2021-06-25 17:25:50.818000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1408443758332239872, NULL, NULL, 1408443758286102528, 1, 1, 1, '测试商品', 199.00, 2, 398.00, 398.00, NULL, NULL, 1, '2021-06-25 23:15:34.990000', 1, '2021-06-25 23:15:34.990000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1408447787535851521, NULL, NULL, 1408447787535851520, 1, 1, 1, '测试商品', 199.00, 2, 398.00, 398.00, NULL, NULL, 1, '2021-06-25 23:31:34.919000', 1, '2021-06-25 23:31:34.919000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1408448478123810817, NULL, NULL, 1408448478123810816, 1, 1, 1, '测试商品', 199.00, 2, 398.00, 398.00, NULL, NULL, 1, '2021-06-25 23:34:19.560000', 1, '2021-06-25 23:34:19.560000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1408449065427034113, NULL, NULL, 1408449065427034112, 1, 1, 1, '测试商品', 199.00, 2, 398.00, 398.00, NULL, NULL, 1, '2021-06-25 23:36:39.596000', 1, '2021-06-25 23:36:39.596000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1408449539890896897, NULL, NULL, 1408449539890896896, 1, 1, 1, '测试商品', 199.00, 2, 398.00, 398.00, NULL, NULL, 1, '2021-06-25 23:38:32.701000', 1, '2021-06-25 23:38:32.701000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1408450653528940544, NULL, NULL, 1408450653524746240, 1, 1, 1, '测试商品', 199.00, 2, 398.00, 398.00, NULL, NULL, 1, '2021-06-25 23:42:58.214000', 1, '2021-06-25 23:42:58.214000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1408461390833934336, NULL, NULL, 1408461390821351424, 1, 1, 1, '测试商品', 199.00, 2, 398.00, 398.00, NULL, NULL, 1, '2021-06-26 00:25:38.389000', 1, '2021-06-26 00:25:38.389000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1408462122807091201, NULL, NULL, 1408462122807091200, 1, 1, 1, '测试商品', 199.00, 2, 398.00, 398.00, NULL, NULL, 1, '2021-06-26 00:28:32.701000', 1, '2021-06-26 00:28:32.701000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1408462177748279297, NULL, NULL, 1408462177748279296, 1, 1, 1, '测试商品', 199.00, 2, 398.00, 398.00, NULL, NULL, 1, '2021-06-26 00:28:45.798000', 1, '2021-06-26 00:28:45.798000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1408463957144002561, NULL, NULL, 1408463957144002560, 1, 1, 1, '测试商品', 199.00, 2, 398.00, 398.00, NULL, NULL, 1, '2021-06-26 00:35:50.043000', 1, '2021-06-26 00:35:50.043000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1408464072109875201, NULL, NULL, 1408464072109875200, 1, 1, 1, '测试商品', 199.00, 2, 398.00, 398.00, NULL, NULL, 1, '2021-06-26 00:36:17.449000', 1, '2021-06-26 00:36:17.449000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1408464326083371009, NULL, NULL, 1408464326083371008, 1, 1, 1, '测试商品', 199.00, 2, 398.00, 398.00, NULL, NULL, 1, '2021-06-26 00:37:18.004000', 1, '2021-06-26 00:37:18.004000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1408464458044563457, NULL, NULL, 1408464458044563456, 1, 1, 1, '测试商品', 199.00, 2, 398.00, 398.00, NULL, NULL, 1, '2021-06-26 00:37:49.463000', 1, '2021-06-26 00:37:49.463000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1408464464075972609, NULL, NULL, 1408464464075972608, 1, 1, 1, '测试商品', 199.00, 2, 398.00, 398.00, NULL, NULL, 1, '2021-06-26 00:37:50.912000', 1, '2021-06-26 00:37:50.912000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1409385932498558976, NULL, NULL, 1409385932448227328, 1, 1, 1, '测试商品', 199.00, 2, 398.00, 398.00, NULL, NULL, 1, '2021-06-28 13:39:26.463000', 1, '2021-06-28 13:39:26.463000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1409820682782662656, NULL, NULL, 1409820682774274048, 1, 1, 1, '测试商品', 199.00, 2, 398.00, 398.00, NULL, NULL, 1, '2021-06-29 18:26:58.806000', 1, '2021-06-29 18:26:58.806000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1409821156785152001, NULL, NULL, 1409821156785152000, 1, 1, 1, '测试商品', 199.00, 2, 398.00, 398.00, NULL, NULL, 1, '2021-06-29 18:28:51.658000', 1, '2021-06-29 18:28:51.658000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1409821156793540608, NULL, NULL, 1409821156785152000, 2, 1, 2, '分账测试商品', 299.00, 2, 598.00, 598.00, NULL, NULL, 1, '2021-06-29 18:28:51.658000', 1, '2021-06-29 18:28:51.658000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1411995592082743297, NULL, NULL, 1411995592082743296, 1, 1, 1, '测试商品', 199.00, 2, 398.00, 398.00, NULL, NULL, 1, '2021-07-05 18:29:17.450000', 1, '2021-07-05 18:29:17.450000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1411995592086937600, NULL, NULL, 1411995592082743296, 2, 1, 2, '分账测试商品', 299.00, 2, 598.00, 598.00, NULL, NULL, 1, '2021-07-05 18:29:17.461000', 1, '2021-07-05 18:29:17.461000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418469208513208320, NULL, NULL, 1418469208492236800, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:13:08.091000', 1, '2021-07-23 15:13:08.091000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418469208584511488, NULL, NULL, 1418469208492236800, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:13:08.092000', 1, '2021-07-23 15:13:08.092000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418470002033582081, NULL, NULL, 1418470002033582080, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:16:17.050000', 1, '2021-07-23 15:16:17.050000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418470002041970688, NULL, NULL, 1418470002033582080, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:16:17.050000', 1, '2021-07-23 15:16:17.050000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418470612707467265, NULL, NULL, 1418470612707467264, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:18:42.653000', 1, '2021-07-23 15:18:42.653000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418470612732633088, NULL, NULL, 1418470612707467264, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:18:42.653000', 1, '2021-07-23 15:18:42.653000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418470687991029761, NULL, NULL, 1418470687991029760, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:19:00.596000', 1, '2021-07-23 15:19:00.596000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418470687995224064, NULL, NULL, 1418470687991029760, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:19:00.596000', 1, '2021-07-23 15:19:00.596000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418470818391941121, NULL, NULL, 1418470818391941120, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:19:31.683000', 1, '2021-07-23 15:19:31.683000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418470818400329728, NULL, NULL, 1418470818391941120, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:19:31.684000', 1, '2021-07-23 15:19:31.684000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418470886629072897, NULL, NULL, 1418470886629072896, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:19:47.953000', 1, '2021-07-23 15:19:47.953000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418470886633267200, NULL, NULL, 1418470886629072896, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:19:47.955000', 1, '2021-07-23 15:19:47.955000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418471011841630209, NULL, NULL, 1418471011841630208, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:20:17.804000', 1, '2021-07-23 15:20:17.804000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418471011845824512, NULL, NULL, 1418471011841630208, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:20:17.804000', 1, '2021-07-23 15:20:17.804000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418471172370227201, NULL, NULL, 1418471172370227200, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:20:56.092000', 1, '2021-07-23 15:20:56.092000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418471172374421504, NULL, NULL, 1418471172370227200, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:20:56.092000', 1, '2021-07-23 15:20:56.092000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418471648868327425, NULL, NULL, 1418471648868327424, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:22:49.683000', 1, '2021-07-23 15:22:49.683000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418471648872521728, NULL, NULL, 1418471648868327424, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:22:49.683000', 1, '2021-07-23 15:22:49.683000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418472136397447169, NULL, NULL, 1418472136397447168, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:24:45.919000', 1, '2021-07-23 15:24:45.919000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418472136401641472, NULL, NULL, 1418472136397447168, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:24:45.919000', 1, '2021-07-23 15:24:45.919000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418473184910532608, NULL, NULL, 1418473184906338304, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:28:55.904000', 1, '2021-07-23 15:28:55.904000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418473184914726912, NULL, NULL, 1418473184906338304, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:28:55.904000', 1, '2021-07-23 15:28:55.904000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418473231056265217, NULL, NULL, 1418473231056265216, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:29:06.904000', 1, '2021-07-23 15:29:06.904000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418473231060459520, NULL, NULL, 1418473231056265216, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:29:06.904000', 1, '2021-07-23 15:29:06.904000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418473420210987009, NULL, NULL, 1418473420210987008, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:29:52.003000', 1, '2021-07-23 15:29:52.003000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418473420215181312, NULL, NULL, 1418473420210987008, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:29:52.003000', 1, '2021-07-23 15:29:52.003000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418473513261621249, NULL, NULL, 1418473513261621248, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:30:14.187000', 1, '2021-07-23 15:30:14.187000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418473513265815552, NULL, NULL, 1418473513261621248, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:30:14.187000', 1, '2021-07-23 15:30:14.187000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418473571243679745, NULL, NULL, 1418473571243679744, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:30:28.018000', 1, '2021-07-23 15:30:28.018000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418473571247874048, NULL, NULL, 1418473571243679744, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:30:28.018000', 1, '2021-07-23 15:30:28.018000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418473608686231553, NULL, NULL, 1418473608686231552, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:30:36.946000', 1, '2021-07-23 15:30:36.946000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418473608690425856, NULL, NULL, 1418473608686231552, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:30:36.946000', 1, '2021-07-23 15:30:36.946000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418473761170153473, NULL, NULL, 1418473761170153472, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:31:13.293000', 1, '2021-07-23 15:31:13.293000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418473761174347776, NULL, NULL, 1418473761170153472, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:31:13.294000', 1, '2021-07-23 15:31:13.294000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418474023075078145, NULL, NULL, 1418474023075078144, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:32:15.740000', 1, '2021-07-23 15:32:15.740000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418474023083466752, NULL, NULL, 1418474023075078144, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:32:15.740000', 1, '2021-07-23 15:32:15.740000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418474042670866433, NULL, NULL, 1418474042670866432, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:32:20.407000', 1, '2021-07-23 15:32:20.407000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418474042675060736, NULL, NULL, 1418474042670866432, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:32:20.407000', 1, '2021-07-23 15:32:20.407000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418474054209396737, NULL, NULL, 1418474054209396736, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:32:23.157000', 1, '2021-07-23 15:32:23.157000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418474054213591040, NULL, NULL, 1418474054209396736, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:32:23.158000', 1, '2021-07-23 15:32:23.158000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418474064795820033, NULL, NULL, 1418474064795820032, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 15:32:25.681000', 1, '2021-07-23 15:32:25.681000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418474064800014336, NULL, NULL, 1418474064795820032, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 15:32:25.681000', 1, '2021-07-23 15:32:25.681000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418500438810058753, NULL, NULL, 1418500438810058752, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 17:17:13.743000', 1, '2021-07-23 17:17:13.743000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418500438818447360, NULL, NULL, 1418500438810058752, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 17:17:13.743000', 1, '2021-07-23 17:17:13.743000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418500471097810945, NULL, NULL, 1418500471097810944, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 17:17:21.434000', 1, '2021-07-23 17:17:21.434000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418500471097810946, NULL, NULL, 1418500471097810944, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 17:17:21.434000', 1, '2021-07-23 17:17:21.434000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418500494162288641, NULL, NULL, 1418500494162288640, 1, 1, 1418449728756146176, '0.1元测试商品', 0.10, 1, 0.10, 0.10, NULL, NULL, 1, '2021-07-23 17:17:26.933000', 1, '2021-07-23 17:17:26.933000', 0, b'0');
INSERT INTO `oc_order_detail` VALUES (1418500494166482944, NULL, NULL, 1418500494162288640, 1, 1, 1418449821873889280, '1元测试商品', 1.00, 1, 1.00, 1.00, NULL, NULL, 1, '2021-07-23 17:17:26.934000', 1, '2021-07-23 17:17:26.934000', 0, b'0');

-- ----------------------------
-- Table structure for oc_order_strategy_mapping
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_strategy_mapping`;
CREATE TABLE `oc_order_strategy_mapping`  (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `order_detail_id` bigint(20) NULL DEFAULT NULL COMMENT '明细id',
  `strategy_id` bigint(20) NULL DEFAULT NULL COMMENT '策略ID',
  `strategy_type` int(11) NULL DEFAULT NULL COMMENT '策略类型(普通/优惠券ID)',
  `strategy_register_id` bigint(20) NULL DEFAULT NULL COMMENT '策略注册ID',
  `price_change` decimal(19, 2) NULL DEFAULT NULL COMMENT '价格变动',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `coupon_id` bigint(20) NULL DEFAULT NULL,
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单策略映射' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oc_order_strategy_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for oc_swap_order
-- ----------------------------
DROP TABLE IF EXISTS `oc_swap_order`;
CREATE TABLE `oc_swap_order`  (
  `id` bigint(20) NOT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `creator` bigint(20) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `tid` bigint(20) NULL DEFAULT NULL,
  `business_id` bigint(20) NULL DEFAULT NULL,
  `channel_id` bigint(20) NULL DEFAULT NULL,
  `device_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_order_id` bigint(20) NULL DEFAULT NULL,
  `origin_order_id` bigint(20) NULL DEFAULT NULL,
  `pay_amount` decimal(19, 2) NULL DEFAULT NULL,
  `pay_time` datetime(6) NULL DEFAULT NULL,
  `state` int(11) NOT NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKrkeu9v5trh3iqe71y9eyq1q0k`(`origin_order_id`) USING BTREE,
  CONSTRAINT `oc_swap_order_ibfk_1` FOREIGN KEY (`origin_order_id`) REFERENCES `oc_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换货单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oc_swap_order
-- ----------------------------

-- ----------------------------
-- Table structure for oc_swap_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `oc_swap_order_detail`;
CREATE TABLE `oc_swap_order_detail`  (
  `id` bigint(20) NOT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `creator` bigint(20) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `tid` bigint(20) NULL DEFAULT NULL,
  `last_detail_id` bigint(20) NULL DEFAULT NULL,
  `last_sku_id` bigint(20) NULL DEFAULT NULL,
  `order_id` bigint(20) NULL DEFAULT NULL,
  `origin_detail_id` bigint(20) NULL DEFAULT NULL,
  `pay_amount` decimal(19, 2) NULL DEFAULT NULL,
  `sku_id` bigint(20) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKiuo9rwpivhxa4c0fx2ai7uw5n`(`order_id`) USING BTREE,
  CONSTRAINT `oc_swap_order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `oc_swap_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换货单明细' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oc_swap_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for pc_ali_payment
-- ----------------------------
DROP TABLE IF EXISTS `pc_ali_payment`;
CREATE TABLE `pc_ali_payment`  (
  `id` bigint(20) NOT NULL,
  `payment_id` bigint(20) NULL DEFAULT NULL COMMENT '交易记录ID',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `amount` decimal(19, 2) NULL DEFAULT NULL COMMENT '交易金额',
  `refundable_balance` decimal(19, 2) NULL DEFAULT NULL COMMENT '可退款余额',
  `business_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务id',
  `pay_status` int(11) NULL DEFAULT NULL COMMENT '支付状态',
  `pay_time` datetime(6) NULL DEFAULT NULL COMMENT '支付时间',
  `trade_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝关联流水号',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(6) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `deleted` bit(1) NOT NULL COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付宝支付记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_ali_payment
-- ----------------------------
INSERT INTO `pc_ali_payment` VALUES (1497095305944850432, 1497095210994196480, 1399985191002447872, 1.20, NULL, 'P1645770279218', 1, '2022-02-25 14:25:09.464000', '2022022522001495290501801223', 0, '2022-02-25 14:25:10.279000', 0, '2022-02-25 14:25:10.284000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1497145968364019712, 1497145835937259520, 1399985191002447872, 0.01, NULL, 'P1645782355586', 1, '2022-02-25 17:46:29.138000', '2022022522001495290501801424', 0, '2022-02-25 17:46:29.142000', 0, '2022-02-25 17:46:29.144000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1497174717637820416, 1497174666307928064, 1399985191002447872, 0.01, NULL, 'P1645789220059', 1, '2022-02-25 19:40:43.501000', '2022022522001495290501800923', 0, '2022-02-25 19:40:43.502000', 0, '2022-02-25 19:40:43.504000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1497505108198391808, 1497145835937259520, 1399985191002447872, 0.01, NULL, 'P1645782355586', 1, '2022-02-26 17:33:33.339000', '2022022522001495290501801424', 1399985191002447872, '2022-02-26 17:33:34.751000', 1399985191002447872, '2022-02-26 17:33:34.824000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1497505220555407360, 1497145835937259520, 1399985191002447872, 0.01, NULL, 'P1645782355586', 1, '2022-02-26 17:34:01.538000', '2022022522001495290501801424', 1399985191002447872, '2022-02-26 17:34:01.538000', 1399985191002447872, '2022-02-26 17:34:01.611000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1498562386552860672, 1498562311156051968, 0, 0.01, NULL, 'P1646120068521', 1, '2022-03-01 15:34:49.548000', '2022030122001495290501803034', 0, '2022-03-01 15:34:49.553000', 0, '2022-03-01 15:34:49.553000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1498942325856907264, 1498912881645584384, 1399985191002447872, 0.10, NULL, 'P1646203638087', 1, '2022-03-02 16:44:32.629000', '2022030222001495290501803570', 0, '2022-03-02 16:44:34.144000', 0, '2022-03-02 16:44:34.153000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1499014001864982528, 1499013941857075200, 1399985191002447872, 1.50, NULL, 'P1646227338076', 1, '2022-03-02 21:29:23.033000', '2022030222001495290501803938', 0, '2022-03-02 21:29:23.034000', 0, '2022-03-02 21:29:23.036000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1499361417835188224, 1499360934177411072, 1399985191002447872, 5.20, NULL, 'P1646310472410', 1, '2022-03-03 20:29:53.453000', '2022030322001495290501804573', 0, '2022-03-03 20:29:53.456000', 0, '2022-03-03 20:29:53.458000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1499365538151661568, 1499365453351223296, 1399985191002447872, 6.00, NULL, 'P1646311551978', 1, '2022-03-03 20:46:15.813000', '2022030322001495290501804126', 0, '2022-03-03 20:46:15.816000', 0, '2022-03-03 20:46:15.818000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1500023259549048832, 1499367979316281344, 1399985191002447872, 0.01, NULL, 'P1646312155730', 1, '2022-03-05 16:19:47.301000', '2022030322001495290501804127', 1399985191002447872, '2022-03-05 16:19:48.819000', 1399985191002447872, '2022-03-05 16:19:48.928000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1500029700976594944, 1500029374655549440, 1399985191002447872, 0.01, NULL, 'P1646469790549', 1, '2022-03-05 16:45:24.570000', '2022030522001495290501805705', 1399985191002447872, '2022-03-05 16:45:24.573000', 1399985191002447872, '2022-03-05 16:45:24.603000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1500032888697966592, 1500032671823089664, 1399985191002447872, 10.00, NULL, 'P1646470625536', 1, '2022-03-05 16:58:04.585000', '2022030522001495290501805408', 1399985191002447872, '2022-03-05 16:58:04.586000', 1399985191002447872, '2022-03-05 16:58:04.617000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1500040379859128320, 1500040364159848448, 1399985191002447872, 0.01, NULL, 'P1646472379188', 1, '2022-03-05 17:27:50.617000', '2022030522001495290501805409', 0, '2022-03-05 17:27:50.617000', 0, '2022-03-05 17:27:50.619000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1500047347520770048, 1500047246614204416, 1399985191002447872, 2500.00, NULL, 'P1646474086154', 1, '2022-03-05 17:55:31.833000', '2022030522001495290501805831', 1399985191002447872, '2022-03-05 17:55:31.837000', 1399985191002447872, '2022-03-05 17:55:31.898000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1500106709765414912, 1500106636289597440, 0, 1.01, NULL, 'P1646488223511', 1, '2022-03-05 21:51:24.896000', '2022030522001495290501805410', 0, '2022-03-05 21:51:24.899000', 0, '2022-03-05 21:51:24.899000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1500107144316280832, 1500107008492134400, 0, 9.99, NULL, 'P1646488323196', 1, '2022-03-05 21:53:08.503000', '2022030522001495290501805710', 0, '2022-03-05 21:53:08.504000', 0, '2022-03-05 21:53:08.504000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1500107436004958208, 1500107385350348800, 0, 1.01, NULL, 'P1646488388626', 1, '2022-03-05 21:54:18.047000', '2022030522001495290501805711', 0, '2022-03-05 21:54:18.048000', 0, '2022-03-05 21:54:18.048000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1500110444931538944, 1500110257089634304, 0, 2500.00, NULL, 'P1646489119544', 1, '2022-03-05 22:06:15.432000', '2022030522001495290501805413', 0, '2022-03-05 22:06:15.432000', 0, '2022-03-05 22:06:15.432000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1500347270627762176, 1500347213367123968, 0, 0.01, NULL, 'P1646545594560', 1, '2022-03-06 13:47:19.073000', '2022030622001495290501805417', 0, '2022-03-06 13:47:19.078000', 0, '2022-03-06 13:47:19.078000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1500365038018273280, 1500364986348642304, 0, 0.01, NULL, 'P1646549830169', 3, '2022-03-06 14:57:55.153000', '2022030622001495290501805520', 0, '2022-03-06 14:57:55.154000', 1399985191002447872, '2022-03-09 12:58:00.130000', 1, b'0');
INSERT INTO `pc_ali_payment` VALUES (1501441726294663168, 1501441454411489280, 1399985191002447872, 3.00, NULL, 'P1646806509833', 1, '2022-03-09 14:16:17.642000', '2022030922001495290501807225', 0, '2022-03-09 14:16:17.643000', 0, '2022-03-09 14:16:17.643000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1501492244648013824, 1501492179099430912, 1399985191002447872, 6.00, NULL, 'P1646818600150', 1, '2022-03-09 17:37:02.151000', '2022030922001495290501807630', 0, '2022-03-09 17:37:02.157000', 0, '2022-03-09 17:37:02.157000', 0, b'0');

-- ----------------------------
-- Table structure for pc_alipay_config
-- ----------------------------
DROP TABLE IF EXISTS `pc_alipay_config`;
CREATE TABLE `pc_alipay_config`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `app_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付宝商户appId',
  `notify_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务器异步通知页面路径',
  `return_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '页面跳转同步通知页面路径',
  `server_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求网关地址',
  `auth_type` int(4) NOT NULL COMMENT '认证方式',
  `sign_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签名类型',
  `alipay_public_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '支付宝公钥',
  `private_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '私钥',
  `app_cert` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '应用公钥',
  `alipay_cert` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '支付宝公钥证书',
  `alipay_root_cert` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '支付宝CA根证书',
  `sandbox` bit(1) NOT NULL COMMENT '是否沙箱环境',
  `expire_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '超时配置',
  `pay_ways` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支持的支付类型',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `activity` bit(1) NOT NULL COMMENT '是否启用',
  `state` int(11) NOT NULL COMMENT '状态',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付宝配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_alipay_config
-- ----------------------------
INSERT INTO `pc_alipay_config` VALUES (1451482829502525440, '支付宝沙箱证书配置', '2021000116671599', 'http://pay1.bootx.cn/pay/callback/aliPay', 'http://localhost:8000/cashier', 'https://openapi.alipaydev.com/gateway.do', 2, 'RSA2', NULL, 'wkcwWNqsP1U6PjwR71+sc/4v4ZVqWIsm0FUybaxev6SJkNc8rujLMumYaulnO3l1zqWLUQfJmjjAqeCpT2ytOxQhSeaePgxGedpOy4BBt+E2IFSKr7+icD1AljcdaxP5YyZKMbkiAQyjchJREkQChfymc8Imz5ZRZ7ld7i6zYevo5YcpCZ+uUOPAaDm1AtO+A/EZa37LSNIj+NiI8zqfW1ILq8aiEPpVI2qXr7e91sfHsSDB2OMftMgGrIy2gacST2AWnoUtJgUEJWAbq3r6MWI8hj542vcAMmwGBR3Pv+ymXNapy4KaobJQCsBUb0ARUyJEILoa9VdzHKpf7sP52LHVHsaZRBXXQGmH3MnInLmWHEy50g8CUpxmUhbgwliu3s2ss/fQYE71KEs7sm8HfzZESd2DBwv8IervCxdMse8OVL6iEmmffeYzxDfths6NRC9ALokTRB8Pvpket5XtOzBEt+chLOC2liCJiQv9Q+z0evsrHRObeejWLxBDH3E93RlELeWgQLNS1QrQL5+5numdzJgyLwPVoE/dgSLB2MBlbAXquenfpwiik48vMgKoNZ8NxOZOWh/o42szp+EmM1xCi0AxWDvjYDWRCyG+dbxbtFvAwSKbkCk1drpMNq9X6EPrWjtxebYhVA43Jqc17XkX9PrzuY6qsFy8cDKhDVgWEbxDEaid+ytQXxo6Z6ppXMcXVWbsUp06C2hF8Lje3aFzKiDeR9hVSASuBwEWK3UzTElAz5/nz9G1eNC6D0LWmnBwxo4WvfXN0R4OptRR8t2SkQCysIj7aMUUj7OYel7MAwP6YZ+remW6+ecoH/YhvL/jdVKfxiRVdw4K0YbOmKRdJ+LyZbs7uWytgNJHDlCV+t4iuFUYLPG9sEqqRV2R71BtZA4qn7841mQV7E6pDahhkSUAQhZ4HhBiSipwX51xNf/DWzSyppFgcTlNOeGoYpaMs9BoK27xh5ShX7zs+BH6Aljp8R8+jawCOnu+eD2LoIGVAAv/bEIVepMrRS77ByKC20qg2LdPpZ5+lzIOpvMseD9bvEXbRt9LEyMuDPMx+V1fr5Rt+GFpv5/8SMDAWPu5WfYyLHlMxiPwbB0GPwfZBDElLEYfzxiE/VsBexjfH2xeC7/QuFpjPhnvcGnfCATd1lCbk/szIBrhAxl0a/8cwXJHYmSL9aE2tNEFLPSVxiww90ToeG/Jt6crn5AhOj32UpG7OXfXkJ6+/6K91rJsbN+ZbV0JfBa22EmuKG3iBgZZgblg3ndz/BAmyxOD0xMnYVri8YPAhVGtmoASGdTKW0s5zNJaA711r/YcQ68ctKyWTnddRfKAfyATYeV1cfaWaHdcE/GpnuMi/Q75PPLiTFM3PAPS8IYduzf4/3zuarMlocc47naJHMfPUi2G1NSE+NLXfCtQClMrY59/xSZpBXK68Ub3wGNf68Xt17Uo1MvKjXGWJvOj3SehKYZXq3FiY/mXkvmfGmy2VOeDw4y1fcjEf+5xCtA2kzoKISfnTWy2rZgxFk2P3bmT3NGwS0/dNuc74PiVOQk2jpEZfgJIlfjXQC+4+Ek/dLNdtwYRCfDEsb/U4npDE56kJnIZxEGmsBwBHgNL7eKZb6nIv9D0qdFKwREsKXTFb1EvldW5q5kTwh68lZpNFFlWXUaAqiQZkjdvPAedPmW6lMUM+Lwoc39Bw7O98TQwtyfoavBmUSD4Zm/n0AKUPgVbbVw9xgDM2zZaNVsfeAFl1zO4HbRbiGzjZvNrhsAKfkdvg3ddc1i+Ri0BNaM9MNKf9fhxOQywMCsuW2gwhMutghgeW4eLudlqBf/sp16+rcxc3bULZFDFQzhhzPl37ERVN2BR7/0plzEWfKD4iBh1g5RVlfx8vAHyRHXDgg2kXmgj8jyI00TOvfEgkIzB25zsJrwuADX/Y8+2w5RxjTNBE+Y2eB2LuAPFaPbBJ+9TKCkpsycm9Opo0iOZMZVGlWMGr0syAHLiOKMwWiaa9ShgX9CYZNrr3Z6jHJCXytw1VPHAQVZUBxye2y5zvoajFuezdav/PonQLPVbg+qAuu7AtqzlAn9ZL+5J9sOgReSx9qnExnIG6MeGXK423dhhuvW4hQbNgQ0xyJsIFmQZsc5/xmen9k4tYKKF96KS2qoDzDdvIcfl5MmVwK24VTI7kubgYnws', 'BtSgnloODmz6szHH+rr0p33PRK864B29sX0vH6pVY5/PL3OfFo3pSuup0FNq6Fvv1lsIbXFOL05K67T1+FPJizq+ENHB7VoIZR8Q6Z3gIqvVUpjLr5R4ThSIcwTDDnR1kY+eEFXDA9Pu8E7DRaVAY09PBkbD1kGTQ/fmAtn3btim146/PbcV0cMMHp5RLLPapM6KZe9XdWRb6U+p3V9zvzFAc2O+4V422jlGjkfglCk8I8IVSscnSX7FJq5DEkmAb6oX8XmVIcxgUsVRrwb84YJH+WE0Xe8UIASa2Fp4ej6Pp0lySB8CNLpX7feVhdZCwRxLCV2HAh0b4oh0KkyyQ28Zd9RaLKw9PSGE68rxW2cAi3oYMK3GOySAgh9y7YBCZAOqWAvu6MJ3pb2MOVtKMAkFCpdzM73zneRE7nl3BmqzRW25yc+K7u4Ll+y/8HVIBRdzv0jRCQ+3UB72b2xqEovh/z2r1FOS/N32HM9zd1IIcoAiZObR7b71SJtU5gp9rHCg/Sde6kF+iTy2TPUr7uOlXL8Qkm5iODzQV0LXug8esIUPCJeU8t8Yau7zMjJ7fAo6R/1U/5wD5Xs3lZtJBEcUT5YyIQf/oR2bCiedSYw2ABii9rQtHnZPegkryVJc78l8lQ9j4vAwXZqsieuwYZ1V/eHTMSM7hyilcxRPwXwTweIEIXjtC+W/rvJJmIv8mqs9zE8yRdxqRrvr4BqbYLxHu6K6QdWd/S2PwInNDw0FtnyRfwKOoekrg354EwrA43ymTHzGiv2hi6lWhyUhbbLC4EaniCVUpDf0B9iiq3S7irGS8R12LCz2RGzJhRNZwQDNBlNppSN1hbtVGWO0y5xJFJLCvLGqw8JtZmynASWd6cteNwKKq3bVuWxlTBQyNnuRzQt7qT2/MsdE9T7jqSOUWHa/hQqlKun8kXEnC5IbC1YP9byuQRbWoxwFyf3bA0kYq/5hxH3zTQ3a8UPePU36gKuL6Tsxu3BssUQrNUECWOG+khwbI4XZ0Vtq48BCXfzUGx9wGQWDorIfrbwp4wj5IU56Yqbnk1zsZnc07ZDY5hk9iSFEUltzqgDMGBYWm059m9lRSXBxPPEJWWCLMJVkm4l9IeqVQH0w2wVMr6treusyrmgOgavq906bzK6r7E0e5BzJ3GF1tLAl4tEBmT8TcT+bpBlSwbxF/E/jtESr1Wyy2kHzdiGwGgCVSJoV0xY30rilcR3jgBVB5phqSUnqgyTX293H0KqCEcwKUd/4AkUkpCZm1+MVrw060u436nVnBXBsG3bhrVKIC5zXo9PVR2btstgPwQNTgzxtuSqp2o2Gz6/lQ53KyGHYX/eGQVni0Sbko5FDVNtW30Cp9GCIXK7gKcgzKyjONpHFkYi34SG2edAzcVKA6SqKjdQIuEUIcEkNxyUZphqnN3n3OOpkjZ1AoAmlAVuaz30RyHBsfxDOrfviJmUyHT9wMD6xuYsJlZCy1c1j3rDFHZiidYSuqudBT5IPQLDQCbkVKrqiUzMdlsKW/3kDqV1+7fuBDhCiiYBgb+IQcgFdGbdY/Gi3LEKa/TXMCYcsvcNhOqscurX3QLy0NTO2rzHVFNZPCTe8GSY0QaK0ySVYHMOPxFVrv4LCheZzn4XeHM88P0FF06TigSkxY/hPLs+hBf51PTK7CpFxiRUfE3eT++IQ1Bgi83kxs1Q6hG2wFOMXANxgV7soPq5EIv+w2beofGx7rEXskD5svkGQE+YIg7ANJg==', 'BtSgnloODmz6szHH+rr0p33PRK864B29sX0vH6pVY5/a/1uAWiuziqiXyCixgHvl7H+0HV0ZgC+gs+RrJSnt4Mbyju4RlhuItjP7LcfosGHVUpjLr5R4ThSIcwTDDnR1kY+eEFXDA9Pu8E7DRaVAY09PBkbD1kGTQ/fmAtn3btim146/PbcV0cMMHp5RLLPapM6KZe9XdWRb6U+p3V9zvzFAc2O+4V422jlGjkfglCk8I8IVSscnSX7FJq5DEkmAb6oX8XmVIcxgUsVRrwb84YJH+WE0Xe8UIASa2Fp4ej6Pp0lySB8CNLpX7feVhdZCwRxLCV2HAh0b4oh0KkyyQ28Zd9RaLKw9PSGE68rxW2cAi3oYMK3GOySAgh9y7YBCZAOqWAvu6MJ3pb2MOVtKMO6EwQ3O8OD99XTnpoYGD0/RTRA+ck6Q8dafUmWvWKjTqv8gO4A9ZW/7J0TqoewKGM/F6LZdQvKraCJcRL6uOCo7dPTYtUZVimIl7ZllCE7QdBd8x337dnxV+3HjvYX8vc263kuGN32t/E3ih6YBnCPEb46rDtz/Gb3eZTiFWPYJcQH2EQzK0D2dbErTYFOlhJLlm3p7lSHSB/1Gd/froOZX2p4RSBCoKGTVPFs7+EvkvXk/5DNW4IBMcdOeEvaorIg/CQrpsl3ncJvf/wpBcgkjzo/bzJhIRLo122lTBkFb3FyubPhscQr4H9/Da73/yq/EjCVsommywlRDOtT/7K1+N0ORUqO6Whq8AfwU9eGe8qb++GS5do1fqbHA34M+EPf07F0vQsNT1pbXreh8XCrDowJ9CGQaytoAGgTqatcTl024W7h2oZMvVh/RfuiaLL4fs36uzl69HM69OJtjODiN5XG1iuA4rLm4GyTmrtgknswkwzVMQV7Tri5syUukw7QEZWoM6w5NOvHMWVZAEBH54Zk4ERFwORGky73PIQpW1L70SZypq6qoNbS8uSc3rXE6DEivEZOfTR1nPyjS8kJFzzItI2Qus4T+/mKx4Zq7ULQ+Y0doPKLj9Yru0Zy6TF0xOhnz4pwUCKbJax+tzBMyXl2Jud7EfwJc+gxwnrR0Hk8j9kv7Y+v846THLKRdXVQHe8VNUtaVpfgyavAVxJXb6Zn7Rhe+w0Qcxxl1qFOGUM3GQQ12bHXLfPbxlXkqv5J2MiiWjd2AjEgy2ghrRNucBjnwDd83GPcP3zwOWKSZHKN0pb+nU0oDHgQeG5/d3V5xcelSc9ZS58TD9tBXpIRYMTBqMiTe/OSU9rxsuriba5FpKz6Rp8/8U7H8NiRe6b7nY9mmaEIQuihpMafEuhte4c0TbQNpqpazrR15x7ph80grxjKnS7FQ9hzQTfIPXEOJZGHSKIruFEYINPs3lE6VuuVdDAh8q9bEMM3xDtjMFqBEF0DtX9j0C7I7rZ8MnJ/9eKFUxTJE6HzAXNwuTdEGY2oeJYPEXoqlVeT2IcbJo/LEsYAOtv7pf7rPfdDu7agBfnjkQAOGEMSgfKjdkuywWpCUOdZc4knwFoJYzZPaLzRw4vm9dg/srCg3S0y3H/6IvrIazd3KYwXFOB/sL/2xp+g6iEVwUahhd7q+YZnOLPodnu5mP0n4eng3vxgng0eoOSDJPAOz+lnrc8hh3462OUj03xxex0TJ9wZrDlBcjuX7hDGcsvIjuNdXeXgyYUZMZRD7mLa4VICBW8Lg6uN7tydxCOaHAo6vagmwJGqzJiGrTALozD6EfUZ/nH+ZX2BXuyg+rkQi/7DZt6h8bHud67j7So+XWEMSJ99CzwwD', 'BtSgnloODmz6szHH+rr0p4zeSOUnwdu1qL5OYlBdTlHI4h+7JkPEf4c4W23Z8/zk5bUxgGUnb3UptyQEWTAPu032qNhxqKLD1Ukt++2yH8z4k0uNLeR3BeRfTte3eUH0yzRqykqbNHm7w8tKgIAJ3TgsCvpia2U2z52Z54HKrxhPpLYK55VRCfigUp7YRMYN+mxF3Ji2d/dpqYlQTsvT7WtIO/Ye1n1F4801iXmENZ2N9Sj3CyD9ikGJ1rgpEUnjF+tnUXLf+HnsSa9kYL432PIb8e5vRNMIruOcj0qTeMCDdDiVZfin48piwo0mxICESaF8D+b5LoWG+cNeatbsrm94CJBWD4x+G+esnT/mxl4p+u6vK0/8vuDZs5FX84cHd8HjRhV2fJzmH+Xoi8MbFUduGDOhcwpZQ3Dl6AM0vAAPj2GvUuNzOX7xxl4JODJwcE4uWnd/QLdZpLosneaB8PPWut4yj4/AMCimBC1ECPlYUoHIOLsTCn8HM2nuntLhCoyjEmyYXcnPOI5fwh8nJ8A10O6w5io9uV75j6BcwpNvwG0iYAk4ZQHTv2CxnKuXHiJ0303yR/AKqG7lRTu3S1WUBi4w0KuXHudL6YKL5VWW1YWQItnTo7tTAsCKlj1VCn3kU+kCR5WuxvcU4f9ChZen7qLfr4Ef0in+rjgx3QTb3Z0N6TGf6rwT97iUsY/vbeYbgIjkkc7z/gjapEukxh2NV8wX7JtgxNPYrGfwbD/DzmvvPk1nC9ouLQTr2a0IkR7FRJ1f1iOU239V+opTbk+FpCapenllG2Sa6cg2yr431/bXcAfvCP4fsNvXK9F1JyMAikZsqf4p+YdjUlPwsqhoKdav28Y699Q2z+qTGcwXcltIIGZmH3O56qsZaBCg2k7EQzLAp5pOjUt75NNxS0JxCl67/imGGh8y/zA74oKCm7ITPrvRPieRTbBFfBMpbiLCcE2kd+ezYqHO9o56/J1GC2PsLI/PD/fHXJ9NdhbDbTDRaXqCgCxQfc5uf7sM2NFTdOMTIw+dJj2H8gcdn1Pbg4Q4c6VhBHAr++KgdajhWxn6VMQ6UzmnjQe2DB9dN4WOf1rG6L6zWfxBMiWUzeFo6/ih95y9bwEuIvUnbEkZIgbfvxc2VNockb6Irw64U9601LR9fBAyUCRqQ0Shbra+zkHTquYgZGHIK3Hqcf+vEzwB0Wa3SgI5Lqn5JlQHAj1ch8RimN38b2p+qjGSqI4uonSoZs5dNGESfzG1EwH+pf7EYW6Nye2SanIsAeA+30VHzvXQdob5aGEpl1ZJ/AiofPBm+b/WHDQYM7LxzmEKHmgXTjFd03JFkGzVu3IvEy/E/f6ysVp4qk0QCXljigY52aWuAc7NVL7NguyamPkkN40CMUOM9l5gpGdK8DYqrnCYOpWlXf75QvlF6yt1sEUBH2F3qklCKl7Zo7j5JlruCym6C7izlFwtlKoMm4HOwvDA4ZMuivaSmO9a8SjjHutQ9k2aG/gx23qO3pZdnA5UDhXHG5xZecutEX2MzGAhvd//ASkyd8NqU6cnJc/4N7lhjkwT+nXUAH5/d612TlEeW/2FOZ+uIcq5gEpDlokA6/wCGHo4tnxGu9/2QrlAkh2RJGo6litLyx41SmkT/MLM5mXdjOdtZnoBqlWqM6jkWGiXboz6KTJm0uKy3Sg88tc4mD4aaiC+8U7tE+xviOBElsJKXY9WbbnaNOBtYUjl6b1WzxthMWDqGSTDXigdAVVmmVtJ+vOI511A/2sdwZirmAfAPOKwVMelpSoGKxB6pUco0g45vN4ekV39KsGFQg8YTjahW88acqEPMileh26pWS6wQJGMzaQ+MDQ36wov1HU89QI5hKrU4kOIugT5/wK6Ujqv5f9be/fL26O1kIYEukOhgCsp+65lbE7TaFpeGt5CKUsba4qL6qk1nS5PSncaPS0dFdh2Spf14pIazMB47sEQcJTdapoudpsD/HRp6zuQHvctbm2cTRc0e1bkMtBac6zq1VuPLnw0d65sLhvEY7B1dUliQQpiNm5eNqdH6ZhLLAqpw9hwMjA2Opq38He/SFmH5EH/Oceh3TO22mIA40Bx05+9cIU34bZChkb7p5/DbDI0qAMog0fhQra5znu3Ao2NlYiSO6AnLUbHDPvTEy/bXK8vGCSxzLXEc1ty7HGPwFu33XrwNIxiZyHJtpSLelawd/R2y3SWmDjMBNlV4JcvkW/HWeAhgSJhBCaNBc1ssGPLP9/tol76fvMkBtZKbpLPhDez9gdt945AqitX8sqVqrbcOQ/wn8tHSM7MqbkpZ4Okkz8f8RP1hQr8dApFTuXoYJCMM0fDMjsspCnt7CWDbz7Awlwp5qOMt4blQbHzJlY6mvyb2lEr20dGgfTo92BXp2x3A7n7FksjoEyXO09d+MpnuV0ckRbCkbvybKMcYgpusU0M4tws1xxanweCFVkvqR8MqiTCioCKynMdvxojuE6OlGLdDqsmAig/1hrcL+CGFjCAKGAx7pJd7cusngTzTL8I4cbUjgrHDtP9zewF8djJieiYx8nfCKe5i6l1l0OazQzsHkTpIlqbo8tnp0qWZDgAkPESn53nUSr82Z6v3IcruT4p/5T5b0xrzYkAfFEuHZIVA4qTIkKDufaaTpFWLTT3oud05Cb1VZkraPeA27jtQBGnDTSBfdTWvpGdQVuppYq7A2PKrKRwXpz1F7mPP7NBk3M3hh2m7rmXNA25aBuTvdovgZhA0b4XFyErCK6VnMbVmTu89KJ3GxVSpPro59KlS/8zXYdEK8H6zGm00YEEtB8AAhuQCTRkR8Hp8QGeb0VLTjYjTndH2gAW3JuDcpP8/IJdnSZP8N9F27revvRzavL2fOxUWAVNOL8PW28eEIxjoK9+N3g3XB8PfPj8V+2tuS4utkGjqNWAPYuOVk6m3CyhJdfrooU3pB93LoLKO28Fs0CNQUEil4p+UvmJoNbZVAO5jqrTbduqucRK2H5/at4moixNdorlBt1Vj2Zd4VcuFIwDqSbdR6u+luHZVTpVjbl+fNkO3jACidAZNHib7aJ06vcaqjDGysGJY6dRiRl4hwLmBd+OYHUakPl28NiFn4/SIVPnJCczgtnrzgKFJITTnlAysid+7UQZrhkZrrHqiy2Rx1L1XFarn5XyxBLi6ZOZ0Nc8jZe1lYECXXiCchPbCg6c2fp2mpdu6L29NyeZFnyLVhHFn4zL//G9z/qMytmkBfVRb6UwvbDlBRfpRRuGeto4uLdEYR+EXJYE5Uq1wVistDb9KRNFCc/IiXS1QMXflekWzOvksNS/0I13HNp7KZ2zrMeVG+FquK0+G0ttbtK8+2or5Iqp/3ITPVX2ACFgOkgz1FMzZhs8Y+MAdvUFmJKeBHd5kxzxEPcfQ6/lU0w8ItT/cD9cfsU/vpxixN459C6t2ywSY8ICgM83sv7fUFcDTVdpZbNKnM0HFkSiX6O9qTZCgkFMC8rhgdpYpJ5H8djk+PNg9/fakkDb5rDCedah2JvtIbbOZawBEc78Fqdw05/bwsjuD+A9NJ2pj/QDQpQG1wqkWHZxy6PXFnw6sHlia3SpfMjN7P+4oNGJy3GCgPsgKuD+jigewJJzgDKhL88dVkBSfvi1+UNhPizQEW018uScBtSgnloODmz6szHH+rr0pxLQLHExsoTGceNtY631Hl/j5F7l/hZ5juaWQCUw4TLPVvAa85HFFrrnFfXq02FTh/Wd9eCW28bEiT5narrdCvb4k0uNLeR3BeRfTte3eUH0dnH+xLd8hcLOOuAFe7p+J82ztlMsME4pjiBMA5ICtPGxx5bW27CiY2JIx8kygP1rvW//I93SgWcgRWXharoDyfVFgpsSAe9WyrgoprtjUrzv6MMNMOeqwGhpQK5usUQ82NFTdOMTIw+dJj2H8gcdn6Wy85J1iO8EUZMaQ5JT4GWDjTz+IilYmJKRSc2lkoptT1OltApJCRj3y33QT2HFkHg4gg2zf4zpx7M5mBvsqyGvbaA9QSy7JciJ2CQi1PaugBT3dfPndaJLbN4QOxI8DZLaxaunXpDavFCik+AsFHO4LVW397nF4S2h/fMqnWFSFcCoqhjXCN0Fx974nYrpO4CTGZfyI/4KwnDDtTjL7icEHCmP7K1BR5RTDnbkiMrbIIhqt9a4w3Hwgrt6ehSdFYD2OSIJ5dwE2NjuIVH6yvI8+vja0KJ8VE/B3O/VTnZXeCEw1OC9fd0lcbV8WgK5ArpHuteOwvhlJI5MBU0BdXZ2NdvW7ETivHXVXL6q3S8Wmy0BoIFLdIoqsPbIyIVyeNmpH+aX5FuEO//V1CqSwXe358Q/nReq1ZdmFfSALdFXiKJViB7wecZyi79qEToU9d0SQ4l+JtyQV37WqHvurzfJJcsUCZomztdF4LTo+g4PnrWrsd3Shi2nJ/nGIa5LZzA+6jhkEix+979K1d6jeiQFPggKcO4zIffuzcSPGPjwtN+fEykG+Fr932HSY9vzfiyjjvY5sS6Q7tNppzSigd/anCHEMZuWwKsCsMGbf+DFXRj9rSWYTVPLXL5C2z1rHZc1OAlpzxrble6cgkY7oE40Mza95uoprPF/DaWRxgSev79AuRDKaVCInuvXLiLdznTaqwKsXCyLmhQakWbEv94AgcIvjBBGwRnRn0pwAYbDorefzIc4tUrT+f3dmp36Bqq4CKGGhHa6WAESdJvqwuoureOkELtNikOLanD6OUsjD69PK3H9x9NVF0tBMlzvYKPE+v1p3EmzAJ8fK8W2h0ofKeIKKOaFg9TOOjBSVmRjcBiRF38lksSGmxRF4TCMzTj+eWWVuF7vwBbyfBQ+VaHLv9FEhI8Axhno36iH/tiJJyMAikZsqf4p+YdjUlPwsqhoKdav28Y699Q2z+qTGcwXcltIIGZmH3O56qsZaBCg3AzegpHdcEPUAQ80Wp7Bz/t27VtQvmnQuFmmdmAW8c+Y2pY72Ta/IOACFkNjF96384WuETtSuFOycfhbKp8IGcn8s6hxR3R8k5sp1zmb3PPa5j5izBMoerOQLjGEoAsu41VjVZb3CyE5RDUgOJqA3QwXTMYwM/aFep7w0kVdk64AoHIuxcwIoRuWZtWQSgtfxTjznwmAbrqHT75ZCtlt5BUudkDNdNULiOU5zObExplpo4kBrhxUhVf2uqM+in0RDf3dDMoaC2V7/9ccN4hUHjekaYS1vv2cXcnTMLi9aMPofjpgoX07e3ZOnFmZjjzZ/ZhdOw2iEjnZ81JjBvHoFRWnqWcHOpJz8Z43oxG41SrZrQN6Ev1z4CmRh+ctcjEE+cIZlXtsuDPhzZXD+9BpBSqL2/cRfx5fXj/3jE9UDhpYJcrHFT3to7+cfwBkyMF095vGUjPMxI2OBC0A3BRhbwzz0N2R/VA3JpxXEht6hEerdfyn1it2BODIUNR0aNvTYYt8vf2FR087+Vog5ZReucEDGxjv3C7pZLz8PzHwyaPjo9HPyGfRUf9YLjK3zzVysq+NQUrMi3ElzOCiTb++aZuaee6lGkC4zU+D5nkCjqhxsmT/qhLMjJFmm+9AAmUOkUesTwnYLcETHn4MqhqG0TYqrLFylTgC3eC2uMKy4ERzaa0eHM5GV2mlPEuq+f6P9y9oVUGwEGiL5tk3pISbS3Icy7TC+d9HbDTH2F/FXdEVllDZ27bmXfYRyROYPW34WcLajdl/ocIjLznNSs3WUMQR++YGAIjDlXM1eDbqpmB22urWPmiK3qoztqib38aYLtRQShOMimS1m7dUww/Pz9BwtyVEjv72CC1QvZ+ZgFPcb9AUGEJZKWn1BKjH5maAbPiNKm/WlDZ1CMSu2NhaFs+9BL9hnY5kX48cgezt9YjUr1xHoGl/cpE1VPnpzcW4frln0abyiebi5fbL0/bz8qigA8fIpA2kr8dfLYfKx+sNWKq9hqSx0PE67fXapXMuMVeypktt5HJByBk/JRuWgLJ6rbUAC2tK2RTyW2Xz8tObK5/YDHQhYff3ZifN02+eIDeysWHvniuUHz4dwTd6NoUMd4h1VK5brzuiwsh7cEpD9+31a6gr2V+JcxH1cuFykjI9hVnBL7Zm5GA5WaQY+3WZRmYeX5qWcxzcfyWK+4NDhErFiKsXSk/+tqjz8kxMy8gAwRXiW6l85Ywg8nHls65eH1un/XzkjTSQ74o4xXZ01S+g+jLIPJAvmqSHRpH/SPCl0gzTiw2u2y7TsnHwdIGArcwVgLZzMH68JAmsVRRph83Y+0NDjouY21ZHGJWWlM0AjMSll/F0J6B6xLmlMm4oQj0stoCOxbpe8OJCiOYE+a7xOQ3k3jXa4tk9u4k109e8vOkZI43+eDuRsdfMW0SYE1OUmbTWGnJ+GJtgc9BVmh/i5dolnxbS0CtX8ZodmkA3bSyhXPxTKppCtto8fwx1+mwod58gr/4HNwGa4B+FVUUiJfx5NcKrIXw6SnbghBBmoXc04td2dK+cvO5SEywI6yrIvE2tXrV2qkUT09EegJ8hrVankxMDSKniv1i96mNxGKYiI9BXsyL5aOGBWqiF+g8N3+9Wfda+LgyPbc6Yiw/Jchp9QA7sdcaGCGm0tV4tLk8uKF1OGZ7VZOBtJxlt1xseYNeBRLVmbAaTyEaKoZV4qkUKWSCjp/mP5LfaVpbKqbGChc9mOmcei5iMAFshtoZ0LlFB/CoeQoXjk1gZ3mfmgPKha/tbsZDQjLsGsEscJo2zG4s3U8v8niappA==', b'1', '30m', 'WAP,APP,WEB,QRCODE,BARCODE', '证书方式', b'1', 1, 1399985191002447872, '2021-10-22 17:37:28.457000', 1399985191002447872, '2022-03-02 19:11:58.210000', 18, b'0');

-- ----------------------------
-- Table structure for pc_app_channel
-- ----------------------------
DROP TABLE IF EXISTS `pc_app_channel`;
CREATE TABLE `pc_app_channel`  (
  `id` bigint(20) NOT NULL,
  `app_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '应用AppId',
  `no` int(11) NOT NULL COMMENT '支付通道数字编码',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付通道字符编码',
  `state` int(11) NULL DEFAULT NULL COMMENT '状态',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `version` int(11) NOT NULL,
  `tid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商户应用支付渠道' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_app_channel
-- ----------------------------
INSERT INTO `pc_app_channel` VALUES (1, '1368825551321722880', 1, 'ALI_PAY', 1, 1, '2021-02-26 16:27:02.389000', 1, '2021-02-26 16:27:02.389000', b'0', 0, 10011);
INSERT INTO `pc_app_channel` VALUES (2, '1368825551321722880', 2, 'WECHAT_APY', 1, 1, '2021-02-26 16:27:02.389000', 1, '2021-02-26 16:27:02.389000', b'0', 0, 10011);
INSERT INTO `pc_app_channel` VALUES (3, '1368825551321722880', 3, 'CASH', 1, 1, '2021-02-26 16:27:02.389000', 1, '2021-02-26 16:27:02.389000', b'0', 0, 10011);
INSERT INTO `pc_app_channel` VALUES (4, '1368825551321722880', 4, 'WALLET', 1, 1, '2021-02-26 16:27:02.389000', 1, '2021-02-26 16:27:02.389000', b'0', 0, 10011);
INSERT INTO `pc_app_channel` VALUES (5, '1368825551321722880', 5, 'POINT', 1, 1, '2021-02-26 16:27:02.389000', 1, '2021-02-26 16:27:02.389000', b'0', 0, 10011);

-- ----------------------------
-- Table structure for pc_cash_payment
-- ----------------------------
DROP TABLE IF EXISTS `pc_cash_payment`;
CREATE TABLE `pc_cash_payment`  (
  `id` bigint(20) NOT NULL,
  `payment_id` bigint(20) NOT NULL COMMENT '支付id',
  `business_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `amount` decimal(19, 2) NULL DEFAULT NULL COMMENT '金额',
  `refundable_balance` decimal(19, 2) NULL DEFAULT NULL COMMENT '可退款金额',
  `pay_status` int(11) NULL DEFAULT NULL COMMENT '支付状态',
  `pay_time` datetime(6) NULL DEFAULT NULL COMMENT '支付时间',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '现金交易记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_cash_payment
-- ----------------------------
INSERT INTO `pc_cash_payment` VALUES (1408444792672776192, 1408444792223985664, '1408443758286102528', NULL, 398.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1408447812747816960, 1408447812714262528, '1408447787535851520', NULL, 398.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1408448511451754496, 1408448511388839936, '1408448478123810816', NULL, 398.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1408449186684366848, 1408449186634035200, '1408449065427034112', NULL, 398.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1408449775107469312, 1408449775094886400, '1408449539890896896', NULL, 398.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1408451981978267648, 1408451981957296128, '1408450653524746240', NULL, 398.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1408461477421150208, 1408461476922028032, '1408461390821351424', NULL, 398.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1408462154411175936, 1408462154394398720, '1408462122807091200', NULL, 398.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1408462200036814848, 1408462200024231936, '1408462177748279296', NULL, 398.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1408463999598751744, 1408463999556808704, '1408463957144002560', NULL, 398.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1408464096248098816, 1408464096239710208, '1408464072109875200', NULL, 398.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1409386462381764608, 1409386462092357632, '1409385932448227328', NULL, 199.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1409821341271617536, 1409821340734746624, '1409821156785152000', NULL, 598.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1410989879562760192, 1410989876228288512, '11', NULL, 15.00, NULL, 3, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1420398971355852802, 1420398971141943298, '3333', 0, 1.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1501492147730231296, 1501492147424047104, 'P1646818586839', 1399985191002447872, 0.01, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1502937813723594752, 1502937813316747264, 'P1647163261715', 1399985191002447872, 5.00, 5.00, 0, NULL, 1399985191002447872, '2022-03-13 17:21:13', 1399985191002447872, '2022-03-13 17:21:13', 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1502938181006213120, 1502938173473243136, 'P1647163305690', 1399985191002447872, 5.00, 5.00, 0, NULL, 1399985191002447872, '2022-03-13 17:22:40', 1399985191002447872, '2022-03-13 17:22:40', 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1502938239453839360, 1502938239227346944, 'P1647163368384', 1399985191002447872, 5.00, 5.00, 0, NULL, 1399985191002447872, '2022-03-13 17:22:54', 1399985191002447872, '2022-03-13 17:22:54', 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1502938260039483392, 1502938259808796672, 'P1647163374477', 1399985191002447872, 5.00, 5.00, 0, NULL, 1399985191002447872, '2022-03-13 17:22:59', 1399985191002447872, '2022-03-13 17:22:59', 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1502938321469259776, 1502938321196630016, 'P1647163379376', 1399985191002447872, 5.00, 5.00, 0, NULL, 1399985191002447872, '2022-03-13 17:23:14', 1399985191002447872, '2022-03-13 17:23:14', 0, 0);
INSERT INTO `pc_cash_payment` VALUES (1502938578080972800, 1502938577812537344, 'P1647163394013', 1399985191002447872, 5.00, 5.00, 5, NULL, 1399985191002447872, '2022-03-13 17:24:15', 1399985191002447872, '2022-03-13 17:42:47', 1, 0);
INSERT INTO `pc_cash_payment` VALUES (1502938926849933312, 1502938926644412416, 'P1647163533191', 1399985191002447872, 600.00, 600.00, 4, NULL, 1399985191002447872, '2022-03-13 17:25:38', 1399985191002447872, '2022-03-13 17:35:44', 2, 0);
INSERT INTO `pc_cash_payment` VALUES (1505092082211975168, 1505092081981288448, 'P1647676887751', 1399985191002447872, 0.01, 0.01, 5, NULL, 1399985191002447872, '2022-03-19 16:01:30', 1399985191002447872, '2022-03-19 16:03:14', 1, 0);

-- ----------------------------
-- Table structure for pc_order_billing
-- ----------------------------
DROP TABLE IF EXISTS `pc_order_billing`;
CREATE TABLE `pc_order_billing`  (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `channel_id` bigint(20) NULL DEFAULT NULL COMMENT '渠道id',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `pay_type` int(11) NOT NULL COMMENT '交易目的',
  `transaction_purpose` int(11) NOT NULL COMMENT '交易类型',
  `transaction_type` int(11) NOT NULL COMMENT '支付类型',
  `amount` decimal(19, 2) NULL DEFAULT NULL COMMENT '金额',
  `count` int(11) NULL DEFAULT NULL COMMENT '交易数量',
  `business_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务id',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `tid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单账单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_order_billing
-- ----------------------------
INSERT INTO `pc_order_billing` VALUES (1409854972862033920, 1001, NULL, 1409821156785152000, 4, 1, 1, 398.00, 0, '1409821156785152000', 1, '2021-06-29 20:43:36.854000', 1, '2021-06-29 20:43:36.854000', 0, b'0', 10011);
INSERT INTO `pc_order_billing` VALUES (1409854972862033921, 1001, NULL, 1409821156785152000, 3, 1, 1, 598.00, 0, '1409821156785152000', 1, '2021-06-29 20:43:36.854000', 1, '2021-06-29 20:43:36.854000', 0, b'0', 10011);

-- ----------------------------
-- Table structure for pc_order_item_billing
-- ----------------------------
DROP TABLE IF EXISTS `pc_order_item_billing`;
CREATE TABLE `pc_order_item_billing`  (
  `id` bigint(20) NOT NULL,
  `order_billing_id` bigint(20) NULL DEFAULT NULL COMMENT '账单id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `order_item_id` bigint(20) NULL DEFAULT NULL COMMENT '订单项id',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT '订单项目skuId',
  `transaction_purpose` int(11) NOT NULL COMMENT '交易目的',
  `transaction_type` int(11) NOT NULL COMMENT '交易类型(名目)',
  `pay_type` int(11) NOT NULL COMMENT '支付类型',
  `amount` decimal(19, 2) NULL DEFAULT NULL COMMENT '支付金额',
  `count` int(11) NULL DEFAULT NULL COMMENT '使用数量',
  `bookkeeping_time` bigint(20) NULL DEFAULT NULL COMMENT '入账时间',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `tid` bigint(20) NOT NULL,
  `business_type` int(11) NULL DEFAULT NULL,
  `source_item_billing_id` bigint(20) NULL DEFAULT NULL,
  `source_order_item_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单明细账单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_order_item_billing
-- ----------------------------
INSERT INTO `pc_order_item_billing` VALUES (1409855068613799936, 1409854972862033920, 1001, 1409821156785152000, 1409821156785152001, 1, 1, 1, 4, 159.05, 0, NULL, 1, '2021-06-29 20:43:36.855000', 1, '2021-06-29 20:43:36.855000', 0, b'0', 10011, NULL, NULL, NULL);
INSERT INTO `pc_order_item_billing` VALUES (1409855068613799937, 1409854972862033920, 1001, 1409821156785152000, 1409821156793540608, 2, 1, 1, 4, 238.95, 0, NULL, 1, '2021-06-29 20:43:36.855000', 1, '2021-06-29 20:43:36.855000', 0, b'0', 10011, NULL, NULL, NULL);
INSERT INTO `pc_order_item_billing` VALUES (1409855068617994240, 1409854972862033921, 1001, 1409821156785152000, 1409821156785152001, 1, 1, 1, 3, 238.95, 0, NULL, 1, '2021-06-29 20:43:36.856000', 1, '2021-06-29 20:43:36.856000', 0, b'0', 10011, NULL, NULL, NULL);
INSERT INTO `pc_order_item_billing` VALUES (1409855068617994241, 1409854972862033921, 1001, 1409821156785152000, 1409821156793540608, 2, 1, 1, 3, 359.05, 0, NULL, 1, '2021-06-29 20:43:36.856000', 1, '2021-06-29 20:43:36.856000', 0, b'0', 10011, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for pc_pay_channel
-- ----------------------------
DROP TABLE IF EXISTS `pc_pay_channel`;
CREATE TABLE `pc_pay_channel`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通道代码',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `bg_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '背景色',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `version` int(11) NOT NULL,
  `tid` bigint(20) NOT NULL,
  `state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付渠道' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_pay_channel
-- ----------------------------
INSERT INTO `pc_pay_channel` VALUES (1410927150927867904, '支付宝', 'ALI_PAY', '阿里', '蓝色', '支付宝支付', 1, '2021-07-02 19:43:41.186000', 1, '2021-07-20 17:13:27.669000', b'0', 2, 10011, 1);
INSERT INTO `pc_pay_channel` VALUES (1410927226240790528, '微信', 'WECHAT_PAY', '微信', '绿色', '微信支付', 1, '2021-07-02 19:43:59.153000', 1, '2021-07-20 17:18:34.937000', b'0', 1, 10011, 1);
INSERT INTO `pc_pay_channel` VALUES (1410927322395209728, '现金', 'CASH', '', '', '现金支付', 1, '2021-07-02 19:44:22.078000', 1, '2021-07-20 17:21:29.440000', b'0', 1, 10011, 1);
INSERT INTO `pc_pay_channel` VALUES (1410927406885269504, '个人钱包', 'WALLET', '', '', '个人钱包支付', 1, '2021-07-02 19:44:42.222000', 1, '2021-07-02 19:44:42.222000', b'0', 0, 10011, NULL);
INSERT INTO `pc_pay_channel` VALUES (1410927501601042432, '积分', 'POINT', '', '', '积分支付', 1, '2021-07-02 19:45:04.804000', 1, '2021-07-20 17:21:35.307000', b'0', 1, 10011, 1);

-- ----------------------------
-- Table structure for pc_pay_channel_way
-- ----------------------------
DROP TABLE IF EXISTS `pc_pay_channel_way`;
CREATE TABLE `pc_pay_channel_way`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式代码',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式名称',
  `channel_id` bigint(20) NULL DEFAULT NULL COMMENT '通道id',
  `channel_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道code',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `version` int(11) NOT NULL,
  `tid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付方式' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_pay_channel_way
-- ----------------------------
INSERT INTO `pc_pay_channel_way` VALUES (1410936653601730560, 'wap支付', 'WAP', 1410927150927867904, 'ALI_PAY', NULL, 1, '2021-07-02 20:21:26.798000', 1, '2021-07-02 20:21:26.798000', b'0', 0, 10011);
INSERT INTO `pc_pay_channel_way` VALUES (1410936829070438400, '应用支付', 'APP', 1410927150927867904, 'ALI_PAY', NULL, 1, '2021-07-02 20:22:08.646000', 1, '2021-07-02 20:22:08.646000', b'0', 0, 10011);
INSERT INTO `pc_pay_channel_way` VALUES (1410936873760747520, 'web支付', 'WEB', 1410927150927867904, 'ALI_PAY', NULL, 1, '2021-07-02 20:22:19.301000', 1, '2021-07-02 20:22:19.301000', b'0', 0, 10011);
INSERT INTO `pc_pay_channel_way` VALUES (1410936936549478400, '扫码支付', 'QRCODE', 1410927150927867904, 'ALI_PAY', NULL, 1, '2021-07-02 20:22:34.271000', 1, '2021-07-02 20:22:34.271000', b'0', 0, 10011);
INSERT INTO `pc_pay_channel_way` VALUES (1410936970368151552, '付款码支付', 'BARCODE', 1410927150927867904, 'ALI_PAY', NULL, 1, '2021-07-02 20:22:42.334000', 1, '2021-07-02 20:22:42.334000', b'0', 0, 10011);
INSERT INTO `pc_pay_channel_way` VALUES (1410939513609547776, 'JSAPI', 'JSAPI', 1410927226240790528, 'WECHAT_PAY', '微信公众号支付或者小程序支付', 1, '2021-07-02 20:32:48.690000', 1, '2021-07-02 20:32:48.690000', b'0', 0, 10011);
INSERT INTO `pc_pay_channel_way` VALUES (1410939565245624320, '扫码支付', 'QRCODE', 1410927226240790528, 'WECHAT_PAY', '微信扫码支付', 1, '2021-07-02 20:33:01.001000', 1, '2021-07-02 20:33:01.001000', b'0', 0, 10011);
INSERT INTO `pc_pay_channel_way` VALUES (1410939616495824896, 'APP支付', 'APP', 1410927226240790528, 'WECHAT_PAY', NULL, 1, '2021-07-02 20:33:13.220000', 1, '2021-07-02 20:33:13.220000', b'0', 0, 10011);
INSERT INTO `pc_pay_channel_way` VALUES (1410939671516704768, '付款码支付', 'BARCODE', 1410927226240790528, 'WECHAT_PAY', NULL, 1, '2021-07-02 20:33:26.337000', 1, '2021-07-02 20:33:26.337000', b'0', 0, 10011);
INSERT INTO `pc_pay_channel_way` VALUES (1410939710196576256, 'wap支付', 'WAP', 1410927226240790528, 'WECHAT_PAY', NULL, 1, '2021-07-02 20:33:35.560000', 1, '2021-07-02 20:33:35.560000', b'0', 0, 10011);

-- ----------------------------
-- Table structure for pc_pay_notify_record
-- ----------------------------
DROP TABLE IF EXISTS `pc_pay_notify_record`;
CREATE TABLE `pc_pay_notify_record`  (
  `id` bigint(20) NOT NULL,
  `payment_id` bigint(20) NOT NULL COMMENT '支付号',
  `notify_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通知消息',
  `pay_channel` int(11) NOT NULL COMMENT '支付通道',
  `status` int(2) NOT NULL COMMENT '处理状态',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提示信息',
  `notify_time` datetime(6) NULL DEFAULT NULL COMMENT '回调时间',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付回调记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_pay_notify_record
-- ----------------------------
INSERT INTO `pc_pay_notify_record` VALUES (1407177414668349440, 1407174717839929344, '{\"transaction_id\":\"4200001198202106225241157905\",\"nonce_str\":\"0873889cb4734b378d8f889fa495694b\",\"bank_type\":\"OTHERS\",\"openid\":\"oiy6u5VrkncGxcgHFLFPKX5ry-Wg\",\"fee_type\":\"CNY\",\"mch_id\":\"1601950357\",\"cash_fee\":\"1\",\"out_trade_no\":\"1407174717839929344\",\"total_fee\":\"1\",\"appid\":\"wx400c6af616ac805c\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"10011\",\"time_end\":\"20210622112224\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 1, 0, '支付单不是待支付状态,记录回调记录', '2021-06-22 11:23:34.386000', 1, '2021-06-22 11:23:34.406000', 1, '2021-06-22 11:23:34.406000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1407179786148802560, 1407179640077971456, '{\"transaction_id\":\"4200001200202106222490228138\",\"nonce_str\":\"a56ab3a07e784c03b9268eb7754c2987\",\"bank_type\":\"OTHERS\",\"openid\":\"oiy6u5VrkncGxcgHFLFPKX5ry-Wg\",\"fee_type\":\"CNY\",\"mch_id\":\"1601950357\",\"cash_fee\":\"1\",\"out_trade_no\":\"1407179640077971456\",\"total_fee\":\"1\",\"appid\":\"wx400c6af616ac805c\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"10011\",\"time_end\":\"20210622113257\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 1, 1, NULL, '2021-06-22 11:32:59.789000', 1, '2021-06-22 11:32:59.811000', 1, '2021-06-22 11:32:59.811000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1497145989754970112, 1497145835937259520, '{\"gmt_create\":\"2022-02-25 17:46:05\",\"charset\":\"UTF-8\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"gmt_payment\":\"2022-02-25 17:46:13\",\"notify_time\":\"2022-02-25 17:46:13\",\"subject\":\"测试支付订单\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"0.01\",\"version\":\"1.0\",\"notify_id\":\"2022022500222174613095290518976160\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"0.01\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1497145835937259520\",\"total_amount\":\"0.01\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022022522001495290501801424\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"0.01\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"point_amount\":\"0.00\",\"buyer_pay_amount\":\"0.01\",\"app_id\":\"2021000116671599\",\"seller_id\":\"2088621954842212\"}', 1, 1, NULL, '2022-02-25 17:46:34.239000', 0, '2022-02-25 17:46:34.241000', 0, '2022-02-25 17:46:34.241000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1497174717973364736, 1497174666307928064, '{\"gmt_create\":\"2022-02-25 19:40:33\",\"charset\":\"UTF-8\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"gmt_payment\":\"2022-02-25 19:40:42\",\"notify_time\":\"2022-02-25 19:40:42\",\"subject\":\"测试支付订单关闭\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"0.01\",\"version\":\"1.0\",\"notify_id\":\"2022022500222194042095290518974966\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"0.01\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1497174666307928064\",\"total_amount\":\"0.01\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022022522001495290501800923\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"0.01\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"point_amount\":\"0.00\",\"buyer_pay_amount\":\"0.01\",\"app_id\":\"2021000116671599\",\"seller_id\":\"2088621954842212\"}', 1, 1, NULL, '2022-02-25 19:40:43.578000', 0, '2022-02-25 19:40:43.582000', 0, '2022-02-25 19:40:43.582000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1498562386880016384, 1498562311156051968, '{\"gmt_create\":\"2022-03-01 15:34:36\",\"charset\":\"UTF-8\",\"gmt_payment\":\"2022-03-01 15:34:45\",\"notify_time\":\"2022-03-01 15:34:46\",\"subject\":\"测试支付\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"0.01\",\"version\":\"1.0\",\"notify_id\":\"2022030100222153445095290519019632\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"0.01\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1498562311156051968\",\"total_amount\":\"0.01\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030122001495290501803034\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"0.01\",\"point_amount\":\"0.00\",\"app_id\":\"2021000116671599\",\"buyer_pay_amount\":\"0.01\",\"seller_id\":\"2088621954842212\"}', 1, 1, NULL, '2022-03-01 15:34:49.627000', 0, '2022-03-01 15:34:49.631000', 0, '2022-03-01 15:34:49.631000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1498942326444109824, 1498912881645584384, '{\"gmt_create\":\"2022-03-02 16:44:10\",\"charset\":\"UTF-8\",\"gmt_payment\":\"2022-03-02 16:44:28\",\"notify_time\":\"2022-03-02 16:44:29\",\"subject\":\"测试支付\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"0.10\",\"version\":\"1.0\",\"notify_id\":\"2022030200222164428095290519033707\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"0.10\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1498912881645584384\",\"total_amount\":\"0.10\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030222001495290501803570\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"0.10\",\"point_amount\":\"0.00\",\"app_id\":\"2021000116671599\",\"buyer_pay_amount\":\"0.10\",\"seller_id\":\"2088621954842212\"}', 1, 1, NULL, '2022-03-02 16:44:34.278000', 0, '2022-03-02 16:44:34.282000', 0, '2022-03-02 16:44:34.282000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1499014002208915456, 1499013941857075200, '{\"gmt_create\":\"2022-03-02 21:29:10\",\"charset\":\"UTF-8\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"gmt_payment\":\"2022-03-02 21:29:18\",\"notify_time\":\"2022-03-02 21:29:19\",\"subject\":\"测试支付订单\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"1.50\",\"version\":\"1.0\",\"notify_id\":\"2022030200222212919095290519038498\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"1.50\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1499013941857075200\",\"total_amount\":\"1.50\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030222001495290501803938\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"1.50\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"point_amount\":\"0.00\",\"buyer_pay_amount\":\"1.50\",\"app_id\":\"2021000116671599\",\"seller_id\":\"2088621954842212\"}', 1, 1, NULL, '2022-03-02 21:29:23.113000', 0, '2022-03-02 21:29:23.116000', 0, '2022-03-02 21:29:23.116000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1499361418200092672, 1499360934177411072, '{\"gmt_create\":\"2022-03-03 20:28:18\",\"charset\":\"UTF-8\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"gmt_payment\":\"2022-03-03 20:29:51\",\"notify_time\":\"2022-03-03 20:29:52\",\"subject\":\"测试支付订单\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"5.20\",\"version\":\"1.0\",\"notify_id\":\"2022030300222202952095290519046222\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"5.20\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1499360934177411072\",\"total_amount\":\"5.20\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030322001495290501804573\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"5.20\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"point_amount\":\"0.00\",\"buyer_pay_amount\":\"5.20\",\"app_id\":\"2021000116671599\",\"seller_id\":\"2088621954842212\"}', 1, 1, NULL, '2022-03-03 20:29:53.540000', 0, '2022-03-03 20:29:53.543000', 0, '2022-03-03 20:29:53.543000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1499365538621423616, 1499365453351223296, '{\"gmt_create\":\"2022-03-03 20:46:06\",\"charset\":\"UTF-8\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"gmt_payment\":\"2022-03-03 20:46:14\",\"notify_time\":\"2022-03-03 20:46:14\",\"subject\":\"测试支付订单\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"6.00\",\"version\":\"1.0\",\"notify_id\":\"2022030300222204614095290519046223\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"6.00\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1499365453351223296\",\"total_amount\":\"6.00\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030322001495290501804126\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"6.00\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"point_amount\":\"0.00\",\"buyer_pay_amount\":\"6.00\",\"app_id\":\"2021000116671599\",\"seller_id\":\"2088621954842212\"}', 1, 1, NULL, '2022-03-03 20:46:15.925000', 0, '2022-03-03 20:46:15.928000', 0, '2022-03-03 20:46:15.928000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1500040380190478336, 1500040364159848448, '{\"gmt_create\":\"2022-03-05 17:27:47\",\"charset\":\"UTF-8\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"gmt_payment\":\"2022-03-05 17:27:48\",\"notify_time\":\"2022-03-05 17:27:49\",\"subject\":\"测试支付\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"0.01\",\"version\":\"1.0\",\"notify_id\":\"2022030500222172749095290519061868\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"0.01\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1500040364159848448\",\"total_amount\":\"0.01\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030522001495290501805409\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"0.01\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"point_amount\":\"0.00\",\"app_id\":\"2021000116671599\",\"buyer_pay_amount\":\"0.01\",\"seller_id\":\"2088621954842212\"}', 1, 1, NULL, '2022-03-05 17:27:50.692000', 0, '2022-03-05 17:27:50.696000', 0, '2022-03-05 17:27:50.696000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1500044078262136832, 1500042650936291328, '{\"gmt_create\":\"2022-03-05 17:36:52\",\"charset\":\"UTF-8\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"gmt_payment\":\"2022-03-05 17:36:54\",\"notify_time\":\"2022-03-05 17:36:54\",\"subject\":\"测试支付\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"5.00\",\"version\":\"1.0\",\"notify_id\":\"2022030500222173654095290519056601\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"5.00\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1500042650936291328\",\"total_amount\":\"5.00\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030522001495290501805707\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"5.00\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"point_amount\":\"0.00\",\"app_id\":\"2021000116671599\",\"buyer_pay_amount\":\"5.00\",\"seller_id\":\"2088621954842212\"}', 1, 0, '支付单不存在,记录回调记录', '2022-03-05 17:42:32.376000', 0, '2022-03-05 17:42:32.385000', 0, '2022-03-05 17:42:32.387000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1500106710256148480, 1500106636289597440, '{\"gmt_create\":\"2022-03-05 21:51:10\",\"charset\":\"UTF-8\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"gmt_payment\":\"2022-03-05 21:51:22\",\"notify_time\":\"2022-03-05 21:51:23\",\"subject\":\"测试支付\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"1.01\",\"version\":\"1.0\",\"notify_id\":\"2022030500222215123095290519063203\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"1.01\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1500106636289597440\",\"total_amount\":\"1.01\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030522001495290501805410\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"1.01\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"point_amount\":\"0.00\",\"buyer_pay_amount\":\"1.01\",\"app_id\":\"2021000116671599\",\"seller_id\":\"2088621954842212\"}', 1, 1, NULL, '2022-03-05 21:51:25.012000', 0, '2022-03-05 21:51:25.016000', 0, '2022-03-05 21:51:25.016000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1500107144685379584, 1500107008492134400, '{\"gmt_create\":\"2022-03-05 21:52:38\",\"charset\":\"UTF-8\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"gmt_payment\":\"2022-03-05 21:53:06\",\"notify_time\":\"2022-03-05 21:53:07\",\"subject\":\"测试支付\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"9.99\",\"version\":\"1.0\",\"notify_id\":\"2022030500222215306095290519064535\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"9.99\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1500107008492134400\",\"total_amount\":\"9.99\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030522001495290501805710\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"9.99\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"point_amount\":\"0.00\",\"buyer_pay_amount\":\"9.99\",\"app_id\":\"2021000116671599\",\"seller_id\":\"2088621954842212\"}', 1, 1, NULL, '2022-03-05 21:53:08.591000', 0, '2022-03-05 21:53:08.592000', 0, '2022-03-05 21:53:08.592000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1500107436667658240, 1500107385350348800, '{\"gmt_create\":\"2022-03-05 21:54:07\",\"charset\":\"UTF-8\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"gmt_payment\":\"2022-03-05 21:54:15\",\"notify_time\":\"2022-03-05 21:54:16\",\"subject\":\"测试支付\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"1.01\",\"version\":\"1.0\",\"notify_id\":\"2022030500222215416095290519058503\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"1.01\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1500107385350348800\",\"total_amount\":\"1.01\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030522001495290501805711\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"1.01\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"point_amount\":\"0.00\",\"buyer_pay_amount\":\"1.01\",\"app_id\":\"2021000116671599\",\"seller_id\":\"2088621954842212\"}', 1, 1, NULL, '2022-03-05 21:54:18.205000', 0, '2022-03-05 21:54:18.206000', 0, '2022-03-05 21:54:18.206000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1500109024635346944, 1500109009351303168, '{\"gmt_create\":\"2022-03-05 22:00:33\",\"charset\":\"UTF-8\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"gmt_payment\":\"2022-03-05 22:00:34\",\"notify_time\":\"2022-03-05 22:00:35\",\"subject\":\"测试支付\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"9.99\",\"version\":\"1.0\",\"notify_id\":\"2022030500222220035095290519058504\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"9.99\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1500109009351303168\",\"total_amount\":\"9.99\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030522001495290501805412\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"9.99\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"point_amount\":\"0.00\",\"app_id\":\"2021000116671599\",\"buyer_pay_amount\":\"9.99\",\"seller_id\":\"2088621954842212\"}', 1, 0, '支付单不是待支付状态,记录回调记录', '2022-03-05 22:00:36.807000', 0, '2022-03-05 22:00:36.807000', 0, '2022-03-05 22:00:36.808000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1500109709858791424, 1500109695812067328, '{\"gmt_create\":\"2022-03-05 22:03:16\",\"charset\":\"UTF-8\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"gmt_payment\":\"2022-03-05 22:03:18\",\"notify_time\":\"2022-03-05 22:03:18\",\"subject\":\"测试支付\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"99.99\",\"version\":\"1.0\",\"notify_id\":\"2022030500222220318095290519061869\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"99.99\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1500109695812067328\",\"total_amount\":\"99.99\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030522001495290501805712\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"99.99\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"point_amount\":\"0.00\",\"app_id\":\"2021000116671599\",\"buyer_pay_amount\":\"99.99\",\"seller_id\":\"2088621954842212\"}', 1, 0, '支付单不是待支付状态,记录回调记录', '2022-03-05 22:03:20.177000', 0, '2022-03-05 22:03:20.177000', 0, '2022-03-05 22:03:20.177000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1500110203503206400, 1500110187275444224, '{\"gmt_create\":\"2022-03-05 22:05:14\",\"charset\":\"UTF-8\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"gmt_payment\":\"2022-03-05 22:05:15\",\"notify_time\":\"2022-03-05 22:05:16\",\"subject\":\"测试支付\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"99.99\",\"version\":\"1.0\",\"notify_id\":\"2022030500222220516095290519063204\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"99.99\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1500110187275444224\",\"total_amount\":\"99.99\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030522001495290501805514\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"99.99\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"point_amount\":\"0.00\",\"app_id\":\"2021000116671599\",\"buyer_pay_amount\":\"99.99\",\"seller_id\":\"2088621954842212\"}', 1, 0, '支付单不是待支付状态,记录回调记录', '2022-03-05 22:05:17.870000', 0, '2022-03-05 22:05:17.871000', 0, '2022-03-05 22:05:17.871000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1500110445388718080, 1500110257089634304, '{\"gmt_create\":\"2022-03-05 22:05:32\",\"charset\":\"UTF-8\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"gmt_payment\":\"2022-03-05 22:06:13\",\"notify_time\":\"2022-03-05 22:06:14\",\"subject\":\"测试支付\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"2500.00\",\"version\":\"1.0\",\"notify_id\":\"2022030500222220613095290519058505\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"2500.00\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1500110257089634304\",\"total_amount\":\"2500.00\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030522001495290501805413\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"2500.00\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"point_amount\":\"0.00\",\"buyer_pay_amount\":\"2500.00\",\"app_id\":\"2021000116671599\",\"seller_id\":\"2088621954842212\"}', 1, 1, NULL, '2022-03-05 22:06:15.540000', 0, '2022-03-05 22:06:15.541000', 0, '2022-03-05 22:06:15.541000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1500347270946529280, 1500347213367123968, '{\"gmt_create\":\"2022-03-06 13:47:08\",\"charset\":\"UTF-8\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"gmt_payment\":\"2022-03-06 13:47:16\",\"notify_time\":\"2022-03-06 13:47:17\",\"subject\":\"测试支付\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"0.01\",\"version\":\"1.0\",\"notify_id\":\"2022030600222134716095290519063212\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"0.01\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1500347213367123968\",\"total_amount\":\"0.01\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030622001495290501805417\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"0.01\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"point_amount\":\"0.00\",\"buyer_pay_amount\":\"0.01\",\"app_id\":\"2021000116671599\",\"seller_id\":\"2088621954842212\"}', 1, 1, NULL, '2022-03-06 13:47:19.150000', 0, '2022-03-06 13:47:19.154000', 0, '2022-03-06 13:47:19.154000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1500365038332846080, 1500364986348642304, '{\"gmt_create\":\"2022-03-06 14:57:44\",\"charset\":\"UTF-8\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"gmt_payment\":\"2022-03-06 14:57:52\",\"notify_time\":\"2022-03-06 14:57:53\",\"subject\":\"测试支付\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"0.01\",\"version\":\"1.0\",\"notify_id\":\"2022030600222145753095290519064537\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"0.01\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1500364986348642304\",\"total_amount\":\"0.01\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030622001495290501805520\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"0.01\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"point_amount\":\"0.00\",\"buyer_pay_amount\":\"0.01\",\"app_id\":\"2021000116671599\",\"seller_id\":\"2088621954842212\"}', 1, 1, NULL, '2022-03-06 14:57:55.229000', 0, '2022-03-06 14:57:55.229000', 0, '2022-03-06 14:57:55.229000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1501441726760230912, 1501441454411489280, '{\"gmt_create\":\"2022-03-09 14:15:17\",\"charset\":\"UTF-8\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"gmt_payment\":\"2022-03-09 14:16:14\",\"notify_time\":\"2022-03-09 14:16:15\",\"subject\":\"测试支付订单\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"3.00\",\"version\":\"1.0\",\"notify_id\":\"2022030900222141615095290519096481\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"3.00\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1501441454411489280\",\"total_amount\":\"3.00\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030922001495290501807225\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"3.00\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"point_amount\":\"0.00\",\"buyer_pay_amount\":\"3.00\",\"app_id\":\"2021000116671599\",\"seller_id\":\"2088621954842212\"}', 1, 1, NULL, '2022-03-09 14:16:17.745000', 0, '2022-03-09 14:16:17.754000', 0, '2022-03-09 14:16:17.754000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1501447303238447104, 1501441454411489280, '{\"gmt_create\":\"2022-03-09 14:15:17\",\"charset\":\"UTF-8\",\"gmt_payment\":\"2022-03-09 14:16:14\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"notify_time\":\"2022-03-09 14:38:25\",\"subject\":\"测试支付订单\",\"gmt_refund\":\"2022-03-09 14:38:24.096\",\"buyer_id\":\"2088622955195291\",\"out_biz_no\":\"1501447292647829504\",\"version\":\"1.0\",\"notify_id\":\"2022030900222143825095290519101671\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1501441454411489280\",\"total_amount\":\"3.00\",\"refund_fee\":\"2.00\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030922001495290501807225\",\"auth_app_id\":\"2021000116671599\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"app_id\":\"2021000116671599\",\"seller_id\":\"2088621954842212\"}', 1, 0, '支付单不是待支付状态,记录回调记录', '2022-03-09 14:38:27.287000', 0, '2022-03-09 14:38:27.290000', 0, '2022-03-09 14:38:27.291000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1501492245000335360, 1501492179099430912, '{\"gmt_create\":\"2022-03-09 17:36:51\",\"charset\":\"UTF-8\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"gmt_payment\":\"2022-03-09 17:36:58\",\"notify_time\":\"2022-03-09 17:36:59\",\"subject\":\"测试支付订单6\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"6.00\",\"version\":\"1.0\",\"notify_id\":\"2022030900222173659095290519101674\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"6.00\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1501492179099430912\",\"total_amount\":\"6.00\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030922001495290501807630\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"6.00\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"point_amount\":\"0.00\",\"buyer_pay_amount\":\"6.00\",\"app_id\":\"2021000116671599\",\"seller_id\":\"2088621954842212\"}', 1, 1, NULL, '2022-03-09 17:37:02.239000', 0, '2022-03-09 17:37:02.242000', 0, '2022-03-09 17:37:02.242000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1501492322448158720, 1501492179099430912, '{\"gmt_create\":\"2022-03-09 17:36:51\",\"charset\":\"UTF-8\",\"gmt_payment\":\"2022-03-09 17:36:58\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"notify_time\":\"2022-03-09 17:37:18\",\"subject\":\"测试支付订单6\",\"gmt_refund\":\"2022-03-09 17:37:17.929\",\"buyer_id\":\"2088622955195291\",\"out_biz_no\":\"1501492315724689408\",\"version\":\"1.0\",\"notify_id\":\"2022030900222173718095290519096483\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1501492179099430912\",\"total_amount\":\"6.00\",\"refund_fee\":\"1.00\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030922001495290501807630\",\"auth_app_id\":\"2021000116671599\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"app_id\":\"2021000116671599\",\"seller_id\":\"2088621954842212\"}', 1, 0, '支付单不是待支付状态,记录回调记录', '2022-03-09 17:37:20.706000', 0, '2022-03-09 17:37:20.706000', 0, '2022-03-09 17:37:20.706000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1501494327849758720, 1501492179099430912, '{\"gmt_create\":\"2022-03-09 17:36:51\",\"charset\":\"UTF-8\",\"gmt_payment\":\"2022-03-09 17:36:58\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"notify_time\":\"2022-03-09 17:44:56\",\"subject\":\"测试支付订单6\",\"gmt_refund\":\"2022-03-09 17:44:55.965\",\"buyer_id\":\"2088622955195291\",\"out_biz_no\":\"1501494237533810688\",\"version\":\"1.0\",\"notify_id\":\"2022030900222174456095290519101675\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1501492179099430912\",\"total_amount\":\"6.00\",\"refund_fee\":\"1.60\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030922001495290501807630\",\"auth_app_id\":\"2021000116671599\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"app_id\":\"2021000116671599\",\"seller_id\":\"2088621954842212\"}', 1, 0, '支付单不是待支付状态,记录回调记录', '2022-03-09 17:45:18.831000', 0, '2022-03-09 17:45:18.831000', 0, '2022-03-09 17:45:18.831000', 0, b'0');
INSERT INTO `pc_pay_notify_record` VALUES (1501495366439120896, 1501492179099430912, '{\"gmt_create\":\"2022-03-09 17:36:51\",\"charset\":\"UTF-8\",\"gmt_payment\":\"2022-03-09 17:36:58\",\"seller_email\":\"mdqpxg3832@sandbox.com\",\"notify_time\":\"2022-03-09 17:49:24\",\"subject\":\"测试支付订单6\",\"gmt_refund\":\"2022-03-09 17:49:23.044\",\"buyer_id\":\"2088622955195291\",\"out_biz_no\":\"1501495357513641984\",\"version\":\"1.0\",\"notify_id\":\"2022030900222174924095290519104464\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1501492179099430912\",\"total_amount\":\"6.00\",\"refund_fee\":\"1.61\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030922001495290501807630\",\"auth_app_id\":\"2021000116671599\",\"buyer_logon_id\":\"wbs***@sandbox.com\",\"app_id\":\"2021000116671599\",\"seller_id\":\"2088621954842212\"}', 1, 0, '支付单不是待支付状态,记录回调记录', '2022-03-09 17:49:26.450000', 0, '2022-03-09 17:49:26.450000', 0, '2022-03-09 17:49:26.451000', 0, b'0');

-- ----------------------------
-- Table structure for pc_pay_order_log
-- ----------------------------
DROP TABLE IF EXISTS `pc_pay_order_log`;
CREATE TABLE `pc_pay_order_log`  (
  `id` bigint(20) NOT NULL,
  `payment_id` bigint(20) NOT NULL COMMENT '支付id',
  `business_pay_param` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '订单扩展业务参数',
  `pay_order_param` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '订单参数',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `tid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付关联订单信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_pay_order_log
-- ----------------------------
INSERT INTO `pc_pay_order_log` VALUES (0, 0, NULL, NULL, 1, '2021-05-25 17:01:51.823000', 1, '2021-05-25 17:01:51.823000', 0, b'1', 0);
INSERT INTO `pc_pay_order_log` VALUES (1406881401143455744, 1406881381321175040, NULL, '{\"id\":null,\"code\":\"\",\"description\":\"微信支付测试商品\",\"transactionPurpose\":0,\"transactionType\":0,\"payAmount\":0,\"orderDetailParams\":[{\"id\":0,\"skuId\":0,\"goodsTitle\":\"\",\"goodsPrice\":0,\"num\":0,\"payAmount\":0,\"state\":0,\"addition\":\"\",\"unsupportedPaymentType\":[],\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-21 15:47:19.282000', 1, '2021-06-21 15:47:19.282000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1406882019593580544, 1406882018075242496, NULL, '{\"id\":null,\"code\":\"\",\"description\":\"微信支付测试商品\",\"transactionPurpose\":0,\"transactionType\":0,\"payAmount\":0,\"orderDetailParams\":[{\"id\":0,\"skuId\":0,\"goodsTitle\":\"\",\"goodsPrice\":0,\"num\":0,\"payAmount\":0,\"state\":0,\"addition\":\"\",\"unsupportedPaymentType\":[],\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-21 15:49:46.732000', 1, '2021-06-21 15:49:46.732000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1406925985273769984, 1406925983461830656, NULL, '{\"id\":null,\"code\":\"\",\"description\":\"微信支付测试商品\",\"transactionPurpose\":0,\"transactionType\":0,\"payAmount\":0,\"orderDetailParams\":[{\"id\":0,\"skuId\":0,\"goodsTitle\":\"\",\"goodsPrice\":0,\"num\":0,\"payAmount\":0,\"state\":0,\"addition\":\"\",\"unsupportedPaymentType\":[],\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-21 18:44:28.967000', 1, '2021-06-21 18:44:28.967000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1406928930635673600, 1406928928664350720, NULL, '{\"id\":null,\"code\":\"\",\"description\":\"微信支付测试商品\",\"transactionPurpose\":0,\"transactionType\":0,\"payAmount\":0,\"orderDetailParams\":[{\"id\":0,\"skuId\":0,\"goodsTitle\":\"\",\"goodsPrice\":0,\"num\":0,\"payAmount\":0,\"state\":0,\"addition\":\"\",\"unsupportedPaymentType\":[],\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-21 18:56:11.196000', 1, '2021-06-21 18:56:11.196000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1407174721321201664, 1407174717839929344, NULL, '{\"id\":null,\"code\":\"\",\"description\":\"微信支付测试商品\",\"transactionPurpose\":0,\"transactionType\":0,\"payAmount\":0,\"orderDetailParams\":[{\"id\":0,\"skuId\":0,\"goodsTitle\":\"\",\"goodsPrice\":0,\"num\":0,\"payAmount\":0,\"state\":0,\"addition\":\"\",\"unsupportedPaymentType\":[],\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-22 11:12:52.262000', 1, '2021-06-22 11:12:52.262000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1407179642028322816, 1407179640077971456, NULL, '{\"id\":null,\"code\":\"\",\"description\":\"微信支付测试商品\",\"transactionPurpose\":1,\"transactionType\":1,\"payAmount\":0.01,\"orderDetailParams\":[{\"id\":0,\"skuId\":0,\"goodsTitle\":\"\",\"goodsPrice\":0,\"num\":0,\"payAmount\":0,\"state\":0,\"addition\":\"\",\"unsupportedPaymentType\":[],\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-22 11:32:25.450000', 1, '2021-06-22 11:32:25.450000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1407194785864904704, 1407194783889387520, NULL, '{\"id\":null,\"code\":\"\",\"description\":\"微信支付测试商品\",\"transactionPurpose\":1,\"transactionType\":1,\"payAmount\":0.01,\"orderDetailParams\":[{\"id\":0,\"skuId\":0,\"goodsTitle\":\"\",\"goodsPrice\":0,\"num\":0,\"payAmount\":0,\"state\":0,\"addition\":\"\",\"unsupportedPaymentType\":[],\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-22 12:32:36.022000', 1, '2021-06-22 12:32:36.022000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1407224397391097856, 1407224396661288960, NULL, '{\"id\":null,\"code\":\"\",\"description\":\"微信支付测试商品\",\"transactionPurpose\":1,\"transactionType\":1,\"payAmount\":0.01,\"orderDetailParams\":[{\"id\":0,\"skuId\":0,\"goodsTitle\":\"\",\"goodsPrice\":0,\"num\":0,\"payAmount\":0,\"state\":0,\"addition\":\"\",\"unsupportedPaymentType\":[],\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-22 14:30:15.960000', 1, '2021-06-22 14:30:15.960000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1407874152131620864, 1407874141146738688, NULL, '{\"id\":1407873266047148032,\"code\":null,\"description\":null,\"transactionPurpose\":1,\"transactionType\":1,\"payAmount\":199.00,\"orderDetailParams\":[{\"id\":1407873266105868288,\"skuId\":1,\"goodsTitle\":\"测试商品\",\"goodsPrice\":199.00,\"num\":1,\"payAmount\":199.00,\"state\":0,\"addition\":null,\"unsupportedPaymentType\":null,\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-24 09:32:09.562000', 1, '2021-06-24 09:32:09.562000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1407879742924943360, 1407879740274143232, NULL, '{\"id\":1407879663895863296,\"code\":null,\"description\":null,\"transactionPurpose\":1,\"transactionType\":1,\"payAmount\":199.00,\"orderDetailParams\":[{\"id\":1407879663900057600,\"skuId\":1,\"goodsTitle\":\"测试商品\",\"goodsPrice\":199.00,\"num\":1,\"payAmount\":199.00,\"state\":0,\"addition\":null,\"unsupportedPaymentType\":null,\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-24 09:54:22.511000', 1, '2021-06-24 09:54:22.511000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1407884533386342400, 1407884530089619456, NULL, '{\"id\":1407879663895863296,\"code\":null,\"description\":null,\"transactionPurpose\":1,\"transactionType\":1,\"payAmount\":199.00,\"orderDetailParams\":[{\"id\":1407879663900057600,\"skuId\":1,\"goodsTitle\":\"测试商品\",\"goodsPrice\":199.00,\"num\":1,\"payAmount\":199.00,\"state\":0,\"addition\":null,\"unsupportedPaymentType\":null,\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-24 10:13:24.646000', 1, '2021-06-24 10:13:24.646000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1407947831964233728, 1407947831364448256, NULL, '{\"id\":1407947806576107520,\"code\":null,\"description\":null,\"transactionPurpose\":1,\"transactionType\":1,\"payAmount\":597.00,\"orderDetailParams\":[{\"id\":1407947806576107521,\"skuId\":1,\"goodsTitle\":\"测试商品\",\"goodsPrice\":199.00,\"num\":3,\"payAmount\":597.00,\"state\":0,\"addition\":null,\"unsupportedPaymentType\":null,\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-24 14:24:56.203000', 1, '2021-06-24 14:24:56.203000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1407951914297094144, 1407951913764417536, NULL, '{\"id\":1407950224474923008,\"code\":null,\"description\":null,\"transactionPurpose\":1,\"transactionType\":1,\"payAmount\":597.00,\"orderDetailParams\":[{\"id\":1407950224474923009,\"skuId\":1,\"goodsTitle\":\"测试商品\",\"goodsPrice\":199.00,\"num\":3,\"payAmount\":597.00,\"state\":0,\"addition\":null,\"unsupportedPaymentType\":null,\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-24 14:41:09.507000', 1, '2021-06-24 14:41:09.507000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1408444793419362304, 1408444792223985664, NULL, '{\"id\":1408443758286102528,\"code\":null,\"description\":null,\"transactionPurpose\":1,\"transactionType\":1,\"payAmount\":398.00,\"orderDetailParams\":[{\"id\":1408443758332239872,\"skuId\":1,\"goodsTitle\":\"测试商品\",\"goodsPrice\":199.00,\"num\":2,\"payAmount\":398.00,\"state\":0,\"addition\":null,\"unsupportedPaymentType\":null,\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-25 23:19:41.047000', 1, '2021-06-25 23:19:41.047000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1408447813104332800, 1408447812714262528, NULL, '{\"id\":1408447787535851520,\"code\":null,\"description\":null,\"transactionPurpose\":1,\"transactionType\":1,\"payAmount\":398.00,\"orderDetailParams\":[{\"id\":1408447787535851521,\"skuId\":1,\"goodsTitle\":\"测试商品\",\"goodsPrice\":199.00,\"num\":2,\"payAmount\":398.00,\"state\":0,\"addition\":null,\"unsupportedPaymentType\":null,\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-25 23:31:40.996000', 1, '2021-06-25 23:31:40.996000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1408448511695024128, 1408448511388839936, NULL, '{\"id\":1408448478123810816,\"code\":null,\"description\":null,\"transactionPurpose\":1,\"transactionType\":1,\"payAmount\":398.00,\"orderDetailParams\":[{\"id\":1408448478123810817,\"skuId\":1,\"goodsTitle\":\"测试商品\",\"goodsPrice\":199.00,\"num\":2,\"payAmount\":398.00,\"state\":0,\"addition\":null,\"unsupportedPaymentType\":null,\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-25 23:34:27.553000', 1, '2021-06-25 23:34:27.553000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1408449186881499136, 1408449186634035200, NULL, '{\"id\":1408449065427034112,\"code\":null,\"description\":null,\"transactionPurpose\":1,\"transactionType\":1,\"payAmount\":398.00,\"orderDetailParams\":[{\"id\":1408449065427034113,\"skuId\":1,\"goodsTitle\":\"测试商品\",\"goodsPrice\":199.00,\"num\":2,\"payAmount\":398.00,\"state\":0,\"addition\":null,\"unsupportedPaymentType\":null,\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-25 23:37:08.530000', 1, '2021-06-25 23:37:08.530000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1408449775338156032, 1408449775094886400, NULL, '{\"id\":1408449539890896896,\"code\":null,\"description\":null,\"transactionPurpose\":1,\"transactionType\":1,\"payAmount\":398.00,\"orderDetailParams\":[{\"id\":1408449539890896897,\"skuId\":1,\"goodsTitle\":\"测试商品\",\"goodsPrice\":199.00,\"num\":2,\"payAmount\":398.00,\"state\":0,\"addition\":null,\"unsupportedPaymentType\":null,\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-25 23:39:28.829000', 1, '2021-06-25 23:39:28.829000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1408451982376726528, 1408451981957296128, NULL, '{\"id\":1408450653524746240,\"code\":null,\"description\":null,\"transactionPurpose\":1,\"transactionType\":1,\"payAmount\":398.00,\"orderDetailParams\":[{\"id\":1408450653528940544,\"skuId\":1,\"goodsTitle\":\"测试商品\",\"goodsPrice\":199.00,\"num\":2,\"payAmount\":398.00,\"state\":0,\"addition\":null,\"unsupportedPaymentType\":null,\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-25 23:48:15.028000', 1, '2021-06-25 23:48:15.028000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1408461478025129984, 1408461476922028032, NULL, '{\"id\":1408461390821351424,\"code\":null,\"description\":null,\"transactionPurpose\":1,\"transactionType\":1,\"payAmount\":398.00,\"orderDetailParams\":[{\"id\":1408461390833934336,\"skuId\":1,\"goodsTitle\":\"测试商品\",\"goodsPrice\":199.00,\"num\":2,\"payAmount\":398.00,\"state\":0,\"addition\":null,\"unsupportedPaymentType\":null,\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-26 00:25:58.967000', 1, '2021-06-26 00:25:58.967000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1408462154612502528, 1408462154394398720, NULL, '{\"id\":1408462122807091200,\"code\":null,\"description\":null,\"transactionPurpose\":1,\"transactionType\":1,\"payAmount\":398.00,\"orderDetailParams\":[{\"id\":1408462122807091201,\"skuId\":1,\"goodsTitle\":\"测试商品\",\"goodsPrice\":199.00,\"num\":2,\"payAmount\":398.00,\"state\":0,\"addition\":null,\"unsupportedPaymentType\":null,\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-26 00:28:40.277000', 1, '2021-06-26 00:28:40.277000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1408462200217169920, 1408462200024231936, NULL, '{\"id\":1408462177748279296,\"code\":null,\"description\":null,\"transactionPurpose\":1,\"transactionType\":1,\"payAmount\":398.00,\"orderDetailParams\":[{\"id\":1408462177748279297,\"skuId\":1,\"goodsTitle\":\"测试商品\",\"goodsPrice\":199.00,\"num\":2,\"payAmount\":398.00,\"state\":0,\"addition\":null,\"unsupportedPaymentType\":null,\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-26 00:28:51.151000', 1, '2021-06-26 00:28:51.151000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1408463999791689728, 1408463999556808704, NULL, '{\"id\":1408463957144002560,\"code\":null,\"description\":null,\"transactionPurpose\":1,\"transactionType\":1,\"payAmount\":398.00,\"orderDetailParams\":[{\"id\":1408463957144002561,\"skuId\":1,\"goodsTitle\":\"测试商品\",\"goodsPrice\":199.00,\"num\":2,\"payAmount\":398.00,\"state\":0,\"addition\":null,\"unsupportedPaymentType\":null,\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-26 00:36:00.203000', 1, '2021-06-26 00:36:00.203000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1409386463656833024, 1409386462092357632, NULL, '{\"id\":1409385932448227328,\"code\":null,\"description\":null,\"transactionPurpose\":1,\"transactionType\":1,\"payAmount\":398.00,\"orderDetailParams\":[{\"id\":1409385932498558976,\"skuId\":1,\"goodsTitle\":\"测试商品\",\"goodsPrice\":199.00,\"num\":2,\"payAmount\":398.00,\"state\":0,\"addition\":null,\"unsupportedPaymentType\":null,\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-28 13:41:32.727000', 1, '2021-06-28 13:41:32.727000', 0, b'0', 10011);
INSERT INTO `pc_pay_order_log` VALUES (1409821342425051136, 1409821340734746624, NULL, '{\"id\":1409821156785152000,\"code\":null,\"description\":null,\"transactionPurpose\":1,\"transactionType\":1,\"payAmount\":996.00,\"orderDetailParams\":[{\"id\":1409821156785152001,\"skuId\":1,\"goodsTitle\":\"测试商品\",\"goodsPrice\":199.00,\"num\":2,\"payAmount\":398.00,\"state\":0,\"addition\":null,\"unsupportedPaymentType\":null,\"leftBillingNum\":0,\"leftBillingAmount\":null},{\"id\":1409821156793540608,\"skuId\":2,\"goodsTitle\":\"分账测试商品\",\"goodsPrice\":299.00,\"num\":2,\"payAmount\":598.00,\"state\":0,\"addition\":null,\"unsupportedPaymentType\":null,\"leftBillingNum\":0,\"leftBillingAmount\":null}]}', 1, '2021-06-29 18:29:35.905000', 1, '2021-06-29 18:29:35.905000', 0, b'0', 10011);

-- ----------------------------
-- Table structure for pc_payment
-- ----------------------------
DROP TABLE IF EXISTS `pc_payment`;
CREATE TABLE `pc_payment`  (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `business_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `amount` decimal(19, 2) NOT NULL COMMENT '金额',
  `refundable_balance` decimal(19, 2) NULL DEFAULT NULL COMMENT '可退款余额',
  `pay_status` int(11) NOT NULL COMMENT '支付状态',
  `error_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `error_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `pay_type_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付信息',
  `async_pay_mode` bit(1) NOT NULL COMMENT '是否是异步支付',
  `async_pay_channel` int(11) NULL DEFAULT NULL COMMENT '异步支付方式',
  `pay_channel_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '支付通道信息列表',
  `refundable_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '可退款信息',
  `pay_time` datetime(6) NULL DEFAULT NULL COMMENT '支付时间',
  `expired_time` datetime(6) NULL DEFAULT NULL COMMENT '过期时间',
  `client_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户ip',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_payment
-- ----------------------------
INSERT INTO `pc_payment` VALUES (1420353776702672897, 0, '6688', '测试支付', '', 1.00, NULL, 0, NULL, NULL, NULL, b'1', 2, '[{\"amount\":1,\"count\":0,\"payWay\":4,\"payChannel\":2,\"extraParamsJson\":\"\"}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1420398971141943298, 0, '3333', '测试支付', '', 1.00, NULL, 4, '', NULL, NULL, b'0', NULL, '[{\"amount\":1,\"count\":0,\"payWay\":0,\"payChannel\":3,\"extraParamsJson\":\"\"}]', NULL, '2021-07-28 23:01:19.225000', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1452162675436908544, 0, '1158', '测试支付', '测试', 1.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":1,\"count\":0,\"payWay\":0,\"payChannel\":1,\"extraParamsJson\":\"\"}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496476421327908864, 1399985191002447872, 'P1645622743786', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496476816926273536, 1399985191002447872, 'P1645622847587', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496477160582377472, 1399985191002447872, 'P1645622931200', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496477427847622656, 1399985191002447872, 'P1645622995651', '测试啊', NULL, 1.02, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":1.02,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496477750821613568, 1399985191002447872, 'P1645623068372', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496478332118593536, 1399985191002447872, 'P1645623207878', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496478371566022656, 1399985191002447872, 'P1645623212821', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496478460917280768, 1399985191002447872, 'P1645623240551', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496478497223176192, 1399985191002447872, 'P1645623243552', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496478612373598208, 1399985191002447872, 'P1645623276519', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496478797719891968, 1399985191002447872, 'P1645623322253', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496478825519738880, 1399985191002447872, 'P1645623329546', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496478919279210496, 1399985191002447872, 'P1645623351230', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496478945338421248, 1399985191002447872, 'P1645623357317', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496478956444938240, 1399985191002447872, 'P1645623359419', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496478967966691328, 1399985191002447872, 'P1645623362252', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496478994499858432, 1399985191002447872, 'P1645623365901', '测试支付订单', NULL, 1.50, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":1.5,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496479868785750016, 1399985191002447872, 'P1645623558661', '测试支付订单', NULL, 1.50, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":1.5,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496480041498800128, 1399985191002447872, 'P1645623618375', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496480171757105152, 1399985191002447872, 'P1645623648712', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496480312513753088, 1399985191002447872, 'P1645623670700', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496480675635621888, 1399985191002447872, 'P1645623692580', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496790709913513984, 1399985191002447872, 'P1645697685276', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496791055377362944, 1399985191002447872, 'P1645697731307', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496791947216416768, 1399985191002447872, 'P1645697982538', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496791979659358208, 1399985191002447872, 'P1645697985941', '测试支付订单22', NULL, 12.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":12,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496804531961327616, 1399985191002447872, 'P1645698869722', '测试支付订单22', NULL, 12.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":12,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496805372151721984, 1399985191002447872, 'P1645701007676', '测试支付订单22', NULL, 12.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":12,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496805732039782400, 1399985191002447872, 'P1645701269265', '测试支付订单22', NULL, 12.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":12,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496810664419651584, 1399985191002447872, 'P1645702436557', '测试支付订单22', NULL, 12.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":12,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496810742643421184, 1399985191002447872, 'P1645702463822', '测试支付订单22', NULL, 12.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":12,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496811066494021632, 1399985191002447872, 'P1645702541201', '测试支付订单22', NULL, 12.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":12,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496811433541758976, 1399985191002447872, 'P1645702628661', '测试支付订单22', NULL, 12.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":12,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496811652081774592, 1399985191002447872, 'P1645702683149', '测试支付订单22', NULL, 12.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":12,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496812169981849600, 1399985191002447872, 'P1645702746934', '测试支付订单22', NULL, 12.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":12,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496812593807880192, 1399985191002447872, 'P1645702905463', '测试支付订单22', NULL, 12.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":12,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496815469502394368, 1399985191002447872, 'P1645703042220', '测试支付订单22', NULL, 12.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":12,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496816961948987392, 1399985191002447872, 'P1645703945344', '测试支付订单22', NULL, 12.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":12,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496817130354487296, 1399985191002447872, 'P1645703985149', '测试支付订单22', NULL, 12.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":12,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496817252823969792, 1399985191002447872, 'P1645704012537', '测试支付订单22', NULL, 12.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":12,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496819029006798848, 1399985191002447872, 'P1645704437933', '测试支付订单22', NULL, 12.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":12,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496819173785784320, 1399985191002447872, 'P1645704474063', '测试支付订单22', NULL, 12.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":12,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496819237371432960, 1399985191002447872, 'P1645704489123', '测试支付订单22', NULL, 12.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":12,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496819431756451840, 1399985191002447872, 'P1645704535420', '测试支付订单22', NULL, 12.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":12,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496819639445803008, 1399985191002447872, 'P1645704571997', '0.01测试', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496824110322208768, 1399985191002447872, 'P1645705651039', '0.01测试', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1496824394905735168, 1399985191002447872, 'P1645705714331', '1测试', NULL, 1.00, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":1,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497034244566761472, 1399985191002447872, 'P1645755748827', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497034609622204416, 1399985191002447872, 'P1645755837066', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497034903131209728, 1399985191002447872, 'P1645755906930', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497035234250539008, 1399985191002447872, 'P1645755986269', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497035401775235072, 1399985191002447872, 'P1645756021059', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497036170817650688, 1399985191002447872, 'P1645756209338', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497036580039114752, 1399985191002447872, 'P1645756307998', '测试支付订单', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497036811384340480, 1399985191002447872, 'P1645756359581', '测试支付订单', NULL, 0.20, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.2,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497088115032932352, 1399985191002447872, 'P1645768594791', '测试支付订单', NULL, 0.20, NULL, 2, '10008', NULL, NULL, b'1', 1, '[{\"amount\":0.2,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497089149700620288, 1399985191002447872, 'P1645768841250', '测试支付订单', NULL, 0.20, NULL, 2, '10008', NULL, NULL, b'1', 1, '[{\"amount\":0.2,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497090130790268928, 1399985191002447872, 'P1645769075267', '测试支付订单', NULL, 0.20, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.2,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497090201174884352, 1399985191002447872, 'P1645769091620', '测试支付订单', NULL, 0.20, NULL, 2, '10008', NULL, NULL, b'1', 1, '[{\"amount\":0.2,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497091075834085376, 1399985191002447872, 'P1645769298634', '测试支付订单', NULL, 0.20, NULL, 2, '2', NULL, NULL, b'1', 1, '[{\"amount\":0.2,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497094513938620416, 1399985191002447872, 'P1645769497545', '测试支付订单', NULL, 0.20, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.2,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497095210994196480, 1399985191002447872, 'P1645770279218', '测试', NULL, 1.20, NULL, 4, '', NULL, NULL, b'1', 1, '[{\"amount\":1.2,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, '2022-02-25 14:25:15.107000', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497142392178794496, 1399985191002447872, 'P1645781530382', '测试状态', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497143076991197184, 1399985191002447872, 'P1645781539601', '测试状态', NULL, 0.01, NULL, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497145835937259520, 1399985191002447872, 'P1645782355586', '测试支付订单', NULL, 0.01, NULL, 4, '', NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, '2022-02-26 17:34:01.662000', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497164177326661632, 1399985191002447872, 'P1645782407499', '测试支付订单', NULL, 0.01, NULL, 3, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497174666307928064, 1399985191002447872, 'P1645789220059', '测试支付订单关闭', NULL, 0.01, NULL, 4, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, '2022-02-25 19:40:43.540000', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497174754673524736, 1399985191002447872, 'P1645789242930', '测试支付订单关闭', NULL, 0.01, NULL, 3, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1497490856607731712, 1399985191002447872, 'P1645864584862', '测试支付订单', NULL, 0.01, NULL, 4, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498296334480769024, 0, 'P1646056529531', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498296629873016832, 0, 'P1646056724399', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498296710126829568, 0, 'P1646056742569', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498296789684387840, 0, 'P1646056761282', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498299340681052160, 0, 'P1646057142929', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498299524093771776, 0, 'P1646057413043', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498299581878697984, 0, 'P1646057430701', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498299930400194560, 0, 'P1646057459091', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498300121220055040, 0, 'P1646057558853', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498300341718810624, 0, 'P1646057605460', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498300353836154880, 0, 'P1646057615096', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498300798029725696, 0, 'P1646057720816', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498300810927210496, 0, 'P1646057724063', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498300883715162112, 0, 'P1646057726836', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498300898122596352, 0, 'P1646057744503', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498301091270295552, 0, 'P1646057787219', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498301139349602304, 0, 'P1646057801308', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498301479444742144, 0, 'P1646057880664', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498301667093708800, 0, 'P1646057892977', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498301688086200320, 0, 'P1646057932161', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498301750812016640, 0, 'P1646057939415', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498301814833872896, 0, 'P1646057953774', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498301865480093696, 0, 'P1646057966182', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498302001618812928, 0, 'P1646058007089', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498302023747960832, 0, 'P1646058010330', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498554617774866432, 0, 'P1646118232975', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498554719767756800, 0, 'P1646118260325', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498562311156051968, 0, 'P1646120068521', '测试支付', NULL, 0.01, 0.01, 1, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, '2022-03-01 15:34:49.589000', NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498563057700220928, 0, 'P1646120241477', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498563472118427648, 0, 'P1646120343812', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498908506969780224, 1399985191002447872, 'P1646202606884', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498912881645584384, 1399985191002447872, 'P1646203638087', '测试支付', NULL, 0.10, 0.10, 1, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.1,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, '2022-03-02 16:44:34.226000', NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498942661787103232, 1399985191002447872, 'P1646210753110', '测试支付', NULL, 1.00, 1.00, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":1,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498943185869582336, 1399985191002447872, 'P1646210878137', '测试支付', NULL, 1.00, 1.00, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":1,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498944999855747072, 1399985191002447872, 'P1646211307799', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498945136313233408, 1399985191002447872, 'P1646211339918', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498945631559872512, 1399985191002447872, 'P1646211452424', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498946538947211264, 1399985191002447872, 'P1646211671648', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498946781214404608, 1399985191002447872, 'P1646211735315', '测试支付', NULL, 5.00, 5.00, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":5,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498979255390826496, 1399985191002447872, 'P1646219477141', '测试支付订单', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498979437394259968, 1399985191002447872, 'P1646219428449', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498979453978537984, 1399985191002447872, 'P1646219523466', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498979470516678656, 1399985191002447872, 'P1646219527141', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498979498656264192, 1399985191002447872, 'P1646219530476', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498979518319161344, 1399985191002447872, 'P1646219537641', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498979585285419008, 1399985191002447872, 'P1646219542913', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498979754307481600, 0, 'P1646219595494', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498979796363767808, 0, 'P1646219597931', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498980287915225088, 1399985191002447872, 'P1646219559104', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498980336783060992, 1399985191002447872, 'P1646219734424', '测试支付', NULL, 0.01, 0.01, 3, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1498980375936888832, 1399985191002447872, 'P1646219738609', '测试支付', NULL, 0.01, 0.01, 3, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"count\":0,\"payWay\":0,\"payChannel\":1}]', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1499013941857075200, 1399985191002447872, 'P1646227338076', '测试支付订单', NULL, 1.50, 1.50, 4, NULL, NULL, NULL, b'1', 1, '[{\"amount\":1.5,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":1.5,\"payWay\":4,\"payChannel\":1}]', '2022-03-02 21:29:23.073000', NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1499360934177411072, 1399985191002447872, 'P1646310472410', '测试支付订单', NULL, 5.20, 5.20, 1, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":5.2,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":5.2,\"payChannel\":1}]', '2022-03-03 20:29:53.494000', NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_payment` VALUES (1499363158043529216, 1399985191002447872, 'P1646310600057', '测试支付订单', NULL, 5.20, 5.20, 0, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":5.2,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":5.2,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-03 20:36:48', 1399985191002447872, '2022-03-03 20:36:48', 0, 0);
INSERT INTO `pc_payment` VALUES (1499363674031001600, 1399985191002447872, 'P1646311009525', '测试支付订单', NULL, 2.00, 2.00, 0, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":2,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":2,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-03 20:38:51', 1399985191002447872, '2022-03-03 20:38:51', 0, 0);
INSERT INTO `pc_payment` VALUES (1499363762673422336, 1399985191002447872, 'P1646311151603', '测试支付订单', NULL, 2.00, 2.00, 0, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":2,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":2,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-03 20:39:13', 1399985191002447872, '2022-03-03 20:39:13', 0, 0);
INSERT INTO `pc_payment` VALUES (1499364251410579456, 1399985191002447872, 'P1646311266109', '测试支付订单', NULL, 2.00, 2.00, 1, NULL, NULL, NULL, b'1', 1, '[{\"amount\":2,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":2,\"payChannel\":1}]', '2022-03-03 20:41:10.199000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-03 20:41:09', 1399985191002447872, '2022-03-03 20:41:10', 1, 0);
INSERT INTO `pc_payment` VALUES (1499364293911461888, 1399985191002447872, 'P1646311278115', '测试支付订单', NULL, 2.00, 2.00, 1, NULL, NULL, NULL, b'1', 1, '[{\"amount\":2,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":2,\"payChannel\":1}]', '2022-03-03 20:41:46.563000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-03 20:41:19', 1399985191002447872, '2022-03-03 20:41:47', 1, 0);
INSERT INTO `pc_payment` VALUES (1499365009489002496, 1399985191002447872, 'P1646311316188', '测试支付订单', NULL, 3.00, 3.00, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":3,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":3,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-03 20:44:10', 1399985191002447872, '2022-03-03 20:44:11', 1, 0);
INSERT INTO `pc_payment` VALUES (1499365453351223296, 1399985191002447872, 'P1646311551978', '测试支付订单', NULL, 6.00, 0.00, 4, NULL, NULL, NULL, b'1', 1, '[{\"amount\":6,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":6,\"payChannel\":1}]', '2022-03-03 20:46:15.870000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-03 20:45:56', 1399985191002447872, '2022-03-03 20:46:32', 3, 0);
INSERT INTO `pc_payment` VALUES (1499367979316281344, 1399985191002447872, 'P1646312155730', '测试支付订单', NULL, 0.01, 0.01, 1, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":0.01,\"payChannel\":1}]', '2022-03-05 16:19:49.016000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-03 20:55:58', 1399985191002447872, '2022-03-05 16:19:49', 2, 0);
INSERT INTO `pc_payment` VALUES (1500028776002580480, 1399985191002447872, 'P1646469700834', '测试支付订单', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":0.01,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 16:41:44', 1399985191002447872, '2022-03-05 16:41:45', 1, 0);
INSERT INTO `pc_payment` VALUES (1500028916625010688, 1399985191002447872, 'P1646469734371', '测试支付订单', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":0.01,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 16:42:18', 1399985191002447872, '2022-03-05 16:42:18', 1, 0);
INSERT INTO `pc_payment` VALUES (1500029374655549440, 1399985191002447872, 'P1646469790549', '测试支付订单', NULL, 0.01, 0.01, 1, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":0.01,\"payChannel\":1}]', '2022-03-05 16:45:24.637000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 16:44:07', 1399985191002447872, '2022-03-05 16:45:25', 2, 0);
INSERT INTO `pc_payment` VALUES (1500029753824825344, 1399985191002447872, 'P1646469924706', '测试支付订单', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":0.01,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 16:45:37', 1399985191002447872, '2022-03-05 16:45:38', 1, 0);
INSERT INTO `pc_payment` VALUES (1500031111294537728, 1399985191002447872, 'P1646470250918', '测试支付', NULL, 0.10, 0.10, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.1,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":0.1,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 16:51:01', 1399985191002447872, '2022-03-05 16:51:01', 1, 0);
INSERT INTO `pc_payment` VALUES (1500031258078400512, 1399985191002447872, 'P1646470293768', '测试支付', NULL, 0.10, 0.10, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.1,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":0.1,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 16:51:36', 1399985191002447872, '2022-03-05 16:51:36', 1, 0);
INSERT INTO `pc_payment` VALUES (1500031655492898816, 1399985191002447872, 'P1646470366260', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":0.01,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 16:53:11', 1399985191002447872, '2022-03-05 16:53:11', 1, 0);
INSERT INTO `pc_payment` VALUES (1500031865023549440, 1399985191002447872, 'P1646470428336', '测试支付', NULL, 5.00, 5.00, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":5,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":5,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 16:54:01', 1399985191002447872, '2022-03-05 16:54:01', 1, 0);
INSERT INTO `pc_payment` VALUES (1500032070326341632, 1399985191002447872, 'P1646470485372', '测试支付', NULL, 10.00, 10.00, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":10,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":10,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 16:54:49', 1399985191002447872, '2022-03-05 16:54:50', 1, 0);
INSERT INTO `pc_payment` VALUES (1500032298714583040, 1399985191002447872, 'P1646470537024', '测试支付', NULL, 10.00, 10.00, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":10,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":10,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 16:55:44', 1399985191002447872, '2022-03-05 16:55:44', 1, 0);
INSERT INTO `pc_payment` VALUES (1500032460522442752, 1399985191002447872, 'P1646470578423', '测试支付', NULL, 10.00, 10.00, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":10,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":10,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 16:56:23', 1399985191002447872, '2022-03-05 16:56:23', 1, 0);
INSERT INTO `pc_payment` VALUES (1500032589556011008, 1399985191002447872, 'P1646470610242', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":0.01,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 16:56:53', 1399985191002447872, '2022-03-05 16:56:54', 1, 0);
INSERT INTO `pc_payment` VALUES (1500032671823089664, 1399985191002447872, 'P1646470625536', '测试支付', NULL, 10.00, 10.00, 1, NULL, NULL, NULL, b'1', 1, '[{\"amount\":10,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":10,\"payChannel\":1}]', '2022-03-05 16:58:04.658000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 16:57:13', 1399985191002447872, '2022-03-05 16:58:05', 2, 0);
INSERT INTO `pc_payment` VALUES (1500037992901693440, 1399985191002447872, 'P1646470828634', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"payWay\":3,\"payChannel\":1}]', '[{\"amount\":0.01,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 17:18:22', 1399985191002447872, '2022-03-05 17:18:22', 1, 0);
INSERT INTO `pc_payment` VALUES (1500039494647074816, 1399985191002447872, 'P1646472254372', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":0.01,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 17:24:20', 1399985191002447872, '2022-03-05 17:24:20', 1, 0);
INSERT INTO `pc_payment` VALUES (1500039551156932608, 1399985191002447872, 'P1646472270576', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":0.01,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 17:24:33', 1399985191002447872, '2022-03-05 17:24:34', 1, 0);
INSERT INTO `pc_payment` VALUES (1500040364159848448, 1399985191002447872, 'P1646472379188', '测试支付', NULL, 0.01, 0.01, 1, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"payWay\":5,\"payChannel\":1,\"extraParamsJson\":\"{\\\"authCode\\\":\\\"283029085436602219\\\"}\"}]', '[{\"amount\":0.01,\"payChannel\":1}]', '2022-03-05 17:27:50.656000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 17:27:47', 0, '2022-03-05 17:27:51', 2, 0);
INSERT INTO `pc_payment` VALUES (1500044792266895360, 1399985191002447872, 'P1646473447708', '测试支付', NULL, 2500.00, 2500.00, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":2500,\"payWay\":5,\"payChannel\":1,\"extraParamsJson\":\"{\\\"authCode\\\":\\\"285284787691828789\\\"}\"}]', '[{\"amount\":2500,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 17:45:23', 1399985191002447872, '2022-03-05 17:49:05', 1, 0);
INSERT INTO `pc_payment` VALUES (1500047246614204416, 1399985191002447872, 'P1646474086154', '测试支付', NULL, 2500.00, 2500.00, 1, NULL, NULL, NULL, b'1', 1, '[{\"amount\":2500,\"payWay\":5,\"payChannel\":1,\"extraParamsJson\":\"{\\\"authCode\\\":\\\"289888401295288151\\\"}\"}]', '[{\"amount\":2500,\"payChannel\":1}]', '2022-03-05 17:55:31.931000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 17:55:08', 1399985191002447872, '2022-03-05 17:55:32', 2, 0);
INSERT INTO `pc_payment` VALUES (1500105956954955776, 0, 'P1646488017365', '测试支付', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":0.01,\"payChannel\":1}]', NULL, NULL, '113.128.101.202', 0, '2022-03-05 21:48:25', 0, '2022-03-05 21:48:27', 1, 0);
INSERT INTO `pc_payment` VALUES (1500106636289597440, 0, 'P1646488223511', '测试支付', NULL, 1.01, 0.00, 4, NULL, NULL, NULL, b'1', 1, '[{\"amount\":1.01,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":1.01,\"payChannel\":1}]', '2022-03-05 21:51:24.954000', NULL, '113.128.101.202', 0, '2022-03-05 21:51:07', 1399985191002447872, '2022-03-05 22:08:44', 3, 0);
INSERT INTO `pc_payment` VALUES (1500107008492134400, 0, 'P1646488323196', '测试支付', NULL, 9.99, 9.99, 1, NULL, NULL, NULL, b'1', 1, '[{\"amount\":9.99,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":9.99,\"payChannel\":1}]', '2022-03-05 21:53:08.541000', NULL, '113.128.101.202', 0, '2022-03-05 21:52:36', 0, '2022-03-05 21:53:09', 2, 0);
INSERT INTO `pc_payment` VALUES (1500107385350348800, 0, 'P1646488388626', '测试支付', NULL, 1.01, 0.00, 5, NULL, NULL, NULL, b'1', 1, '[{\"amount\":1.01,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":1.01,\"payChannel\":1}]', '2022-03-05 21:54:18.149000', NULL, '113.128.101.202', 0, '2022-03-05 21:54:06', 1399985191002447872, '2022-03-05 22:12:48', 3, 0);
INSERT INTO `pc_payment` VALUES (1500108663187005440, 1399985191002447872, 'P1646488743637', '测试支付', NULL, 1.01, 1.01, 3, NULL, NULL, NULL, b'1', 1, '[{\"amount\":1.01,\"payWay\":5,\"payChannel\":1,\"extraParamsJson\":\"{\\\"authCode\\\":\\\"280735052142373816\\\"}\"}]', '[{\"amount\":1.01,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 21:59:11', 1399985191002447872, '2022-03-05 22:07:11', 2, 0);
INSERT INTO `pc_payment` VALUES (1500109009351303168, 1399985191002447872, 'P1646488811784', '测试支付', NULL, 9.99, 0.00, 4, NULL, NULL, NULL, b'1', 1, '[{\"amount\":9.99,\"payWay\":5,\"payChannel\":1,\"extraParamsJson\":\"{\\\"authCode\\\":\\\"289317241724231035\\\"}\"}]', '[{\"amount\":9.99,\"payChannel\":1}]', '2022-03-05 22:00:36.455000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 22:00:33', 1399985191002447872, '2022-03-05 22:07:18', 2, 0);
INSERT INTO `pc_payment` VALUES (1500109695812067328, 1399985191002447872, 'P1646488917625', '测试支付', NULL, 99.99, 99.99, 1, NULL, NULL, NULL, b'1', 1, '[{\"amount\":99.99,\"payWay\":5,\"payChannel\":1,\"extraParamsJson\":\"{\\\"authCode\\\":\\\"287682439099068554\\\"}\"}]', '[{\"amount\":99.99,\"payChannel\":1}]', '2022-03-05 22:03:19.823000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 22:03:17', 1399985191002447872, '2022-03-05 22:03:20', 1, 0);
INSERT INTO `pc_payment` VALUES (1500110187275444224, 1399985191002447872, 'P1646489099188', '测试支付', NULL, 99.99, 99.99, 1, NULL, NULL, NULL, b'1', 1, '[{\"amount\":99.99,\"payWay\":5,\"payChannel\":1,\"extraParamsJson\":\"{\\\"authCode\\\":\\\"287829619236082272\\\"}\"}]', '[{\"amount\":99.99,\"payChannel\":1}]', '2022-03-05 22:05:17.323000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 22:05:14', 1399985191002447872, '2022-03-05 22:05:17', 1, 0);
INSERT INTO `pc_payment` VALUES (1500110257089634304, 0, 'P1646489119544', '测试支付', NULL, 2500.00, 2500.00, 1, NULL, NULL, NULL, b'1', 1, '[{\"amount\":2500,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":2500,\"payChannel\":1}]', '2022-03-05 22:06:15.486000', NULL, '113.128.101.202', 0, '2022-03-05 22:05:31', 0, '2022-03-05 22:06:15', 2, 0);
INSERT INTO `pc_payment` VALUES (1500112358612099072, 1399985191002447872, 'P1646489177123', '测试支付', NULL, 2500.00, 2500.00, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":2500,\"payWay\":1,\"payChannel\":1}]', '[{\"amount\":2500,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-05 22:13:52', 1399985191002447872, '2022-03-05 22:13:52', 1, 0);
INSERT INTO `pc_payment` VALUES (1500347213367123968, 0, 'P1646545594560', '测试支付', NULL, 0.01, 0.01, 1, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":0.01,\"payChannel\":1}]', '2022-03-06 13:47:19.114000', NULL, '113.128.101.202', 0, '2022-03-06 13:47:05', 0, '2022-03-06 13:47:19', 2, 0);
INSERT INTO `pc_payment` VALUES (1500364986348642304, 0, 'P1646549830169', '测试支付', NULL, 0.01, 0.01, 1, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":0.01,\"payChannel\":1}]', '2022-03-06 14:57:55.191000', NULL, '113.128.101.202', 0, '2022-03-06 14:57:43', 0, '2022-03-06 14:57:55', 2, 0);
INSERT INTO `pc_payment` VALUES (1501441454411489280, 1399985191002447872, 'P1646806509833', '测试支付订单', NULL, 3.00, 2.00, 4, NULL, NULL, NULL, b'1', 1, '[{\"amount\":3,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":2,\"payChannel\":1}]', '2022-03-09 14:16:17.694000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-09 14:15:13', 0, '2022-03-09 16:06:17', 3, 0);
INSERT INTO `pc_payment` VALUES (1501492147424047104, 1399985191002447872, 'P1646818586839', '测试支付订单', NULL, 0.01, 0.01, 1, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":0.01,\"payWay\":4,\"payChannel\":3}]', '[{\"amount\":0.01,\"payChannel\":3}]', '2022-03-09 17:36:39.094000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-09 17:36:39', 1399985191002447872, '2022-03-09 17:36:39', 1, 0);
INSERT INTO `pc_payment` VALUES (1501492179099430912, 1399985191002447872, 'P1646818600150', '测试支付订单6', NULL, 6.00, 4.39, 4, NULL, NULL, NULL, b'1', 1, '[{\"amount\":6,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":4.39,\"payChannel\":1}]', '2022-03-09 17:37:02.192000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-09 17:36:47', 1399985191002447872, '2022-03-09 17:49:26', 6, 0);
INSERT INTO `pc_payment` VALUES (1502937813316747264, 1399985191002447872, 'P1647163261715', '测试支付订单', NULL, 11.00, 11.00, 1, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":5,\"payWay\":0,\"payChannel\":4},{\"amount\":6,\"payWay\":0,\"payChannel\":5}]', '[{\"amount\":5,\"payChannel\":4},{\"amount\":6,\"payChannel\":5}]', '2022-03-13 17:21:12.947000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-13 17:21:13', 1399985191002447872, '2022-03-13 17:21:13', 1, 0);
INSERT INTO `pc_payment` VALUES (1502938173473243136, 1399985191002447872, 'P1647163305690', '测试支付订单', NULL, 12.00, 12.00, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":5,\"payWay\":0,\"payChannel\":4},{\"amount\":6,\"payWay\":0,\"payChannel\":5},{\"amount\":1,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":5,\"payChannel\":4},{\"amount\":6,\"payChannel\":5},{\"amount\":1,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-13 17:22:38', 1399985191002447872, '2022-03-13 17:22:40', 1, 0);
INSERT INTO `pc_payment` VALUES (1502938239227346944, 1399985191002447872, 'P1647163368384', '测试支付订单', NULL, 11.00, 11.00, 1, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":5,\"payWay\":0,\"payChannel\":4},{\"amount\":6,\"payWay\":0,\"payChannel\":5}]', '[{\"amount\":5,\"payChannel\":4},{\"amount\":6,\"payChannel\":5}]', '2022-03-13 17:22:54.388000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-13 17:22:54', 1399985191002447872, '2022-03-13 17:22:54', 1, 0);
INSERT INTO `pc_payment` VALUES (1502938259808796672, 1399985191002447872, 'P1647163374477', '测试支付订单', NULL, 11.00, 11.00, 1, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":5,\"payWay\":0,\"payChannel\":4},{\"amount\":6,\"payWay\":0,\"payChannel\":5}]', '[{\"amount\":5,\"payChannel\":4},{\"amount\":6,\"payChannel\":5}]', '2022-03-13 17:22:59.288000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-13 17:22:59', 1399985191002447872, '2022-03-13 17:22:59', 1, 0);
INSERT INTO `pc_payment` VALUES (1502938321196630016, 1399985191002447872, 'P1647163379376', '测试支付订单', NULL, 1000004.00, 1000004.00, 1, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":5,\"payWay\":0,\"payChannel\":4},{\"amount\":999999,\"payWay\":0,\"payChannel\":5}]', '[{\"amount\":5,\"payChannel\":4},{\"amount\":999999,\"payChannel\":5}]', '2022-03-13 17:23:13.926000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-13 17:23:14', 1399985191002447872, '2022-03-13 17:23:14', 1, 0);
INSERT INTO `pc_payment` VALUES (1502938577812537344, 1399985191002447872, 'P1647163394013', '测试支付订单', NULL, 1000004.00, 100000.00, 4, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":5,\"payWay\":0,\"payChannel\":4},{\"amount\":999999,\"payWay\":0,\"payChannel\":5}]', '[{\"amount\":0,\"payChannel\":4},{\"amount\":100000,\"payChannel\":5}]', '2022-03-13 17:24:15.114000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-13 17:24:15', 1399985191002447872, '2022-03-13 17:42:48', 2, 0);
INSERT INTO `pc_payment` VALUES (1502938631252164608, 1399985191002447872, 'P1647163463579', '测试支付订单', NULL, 15.00, 15.00, 1, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":15,\"payWay\":0,\"payChannel\":5}]', '[{\"amount\":15,\"payChannel\":5}]', '2022-03-13 17:24:27.796000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-13 17:24:28', 1399985191002447872, '2022-03-13 17:24:28', 1, 0);
INSERT INTO `pc_payment` VALUES (1502938646888529920, 1399985191002447872, 'P1647163467884', '测试支付订单', NULL, 15.00, 15.00, 1, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":15,\"payWay\":0,\"payChannel\":5}]', '[{\"amount\":15,\"payChannel\":5}]', '2022-03-13 17:24:31.522000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-13 17:24:31', 1399985191002447872, '2022-03-13 17:24:32', 1, 0);
INSERT INTO `pc_payment` VALUES (1502938660868145152, 1399985191002447872, 'P1647163471620', '测试支付订单', NULL, 15.00, 15.00, 1, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":15,\"payWay\":0,\"payChannel\":5}]', '[{\"amount\":15,\"payChannel\":5}]', '2022-03-13 17:24:34.853000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-13 17:24:35', 1399985191002447872, '2022-03-13 17:24:35', 1, 0);
INSERT INTO `pc_payment` VALUES (1502938764777832448, 1399985191002447872, 'P1647163474940', '测试支付订单', NULL, 1.00, 1.00, 1, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":1,\"payWay\":0,\"payChannel\":5}]', '[{\"amount\":1,\"payChannel\":5}]', '2022-03-13 17:24:59.647000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-13 17:24:59', 1399985191002447872, '2022-03-13 17:25:00', 1, 0);
INSERT INTO `pc_payment` VALUES (1502938888165867520, 1399985191002447872, 'P1647163526242', '测试支付订单', NULL, 1.00, 1.00, 1, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":1,\"payWay\":0,\"payChannel\":5}]', '[{\"amount\":1,\"payChannel\":5}]', '2022-03-13 17:25:29.041000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-13 17:25:29', 1399985191002447872, '2022-03-13 17:25:29', 1, 0);
INSERT INTO `pc_payment` VALUES (1502938905215713280, 1399985191002447872, 'P1647163529124', '测试支付订单', NULL, 15.00, 15.00, 1, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":15,\"payWay\":0,\"payChannel\":5}]', '[{\"amount\":15,\"payChannel\":5}]', '2022-03-13 17:25:33.105000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-13 17:25:33', 1399985191002447872, '2022-03-13 17:25:33', 1, 0);
INSERT INTO `pc_payment` VALUES (1502938926644412416, 1399985191002447872, 'P1647163533191', '测试支付订单', NULL, 615.00, 0.00, 5, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":600,\"payWay\":0,\"payChannel\":4},{\"amount\":15,\"payWay\":0,\"payChannel\":5}]', '[{\"amount\":0,\"payChannel\":4},{\"amount\":0,\"payChannel\":5}]', '2022-03-13 17:25:38.258000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-13 17:25:38', 1399985191002447872, '2022-03-13 17:35:45', 3, 0);
INSERT INTO `pc_payment` VALUES (1505091791349575680, 1399985191002447872, 'P1647676817204', '测试支付订单', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":0.01,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-19 16:00:21', 1399985191002447872, '2022-03-19 16:00:23', 1, 0);
INSERT INTO `pc_payment` VALUES (1505091942852030464, 1399985191002447872, 'P1647676855007', '测试支付订单', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":0.01,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-19 16:00:57', 1399985191002447872, '2022-03-19 16:00:58', 1, 0);
INSERT INTO `pc_payment` VALUES (1505091997419925504, 1399985191002447872, 'P1647676865822', '测试支付订单', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":0.01,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-19 16:01:10', 1399985191002447872, '2022-03-19 16:01:11', 1, 0);
INSERT INTO `pc_payment` VALUES (1505092063517962240, 1399985191002447872, 'P1647676884157', '测试支付订单', NULL, 0.01, 0.01, 0, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":0.01,\"payChannel\":1}]', NULL, NULL, '127.0.0.1', 1399985191002447872, '2022-03-19 16:01:26', 1399985191002447872, '2022-03-19 16:01:26', 1, 0);
INSERT INTO `pc_payment` VALUES (1505092081981288448, 1399985191002447872, 'P1647676887751', '测试支付订单', NULL, 0.01, 0.00, 5, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":0.01,\"payWay\":4,\"payChannel\":4}]', '[{\"amount\":0,\"payChannel\":4}]', '2022-03-19 16:01:30.360000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-19 16:01:30', 1399985191002447872, '2022-03-19 16:03:14', 2, 0);
INSERT INTO `pc_payment` VALUES (1505110359399145472, 1399985191002447872, 'P1647681195244', '测试支付订单', NULL, 0.01, 0.01, 1, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":0.01,\"payWay\":4,\"payChannel\":6,\"extraParamsJson\":\"{\\\"cardNoList\\\":[\\\"V1504341025911398403\\\"]}\"}]', '[{\"amount\":0.01,\"payChannel\":6}]', '2022-03-19 17:14:48.982000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-19 17:14:08', 1399985191002447872, '2022-03-19 17:14:49', 1, 0);
INSERT INTO `pc_payment` VALUES (1505114668811640832, 1399985191002447872, 'P1647682261307', '测试支付订单', NULL, 0.20, 0.20, 1, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":0.2,\"payWay\":4,\"payChannel\":6,\"extraParamsJson\":\"{\\\"cardNoList\\\":[\\\"V1504341025911398403\\\"]}\"}]', '[{\"amount\":0.2,\"payChannel\":6}]', '2022-03-19 17:31:19.319000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-19 17:31:15', 1399985191002447872, '2022-03-19 17:31:19', 1, 0);
INSERT INTO `pc_payment` VALUES (1506194826553442304, 0, '1122', '测试储值卡', '备注', 8.00, 3.00, 4, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":8,\"payWay\":0,\"payChannel\":6,\"extraParamsJson\":\"{\\\"cardNoList\\\":[\\\"V1504341025911398403\\\",\\\"V1504341025911398402\\\",\\\"V1504341025911398401\\\"]}\"}]', '[{\"amount\":3,\"payChannel\":6}]', '2022-03-22 17:03:33.218000', NULL, '0:0:0:0:0:0:0:1', 0, '2022-03-22 17:03:25', 1399985191002447872, '2022-03-22 17:18:54', 4, 0);
INSERT INTO `pc_payment` VALUES (1506199202508550144, 0, '11222', '测试储值卡', '备注', 8.00, 8.00, 1, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":8,\"payWay\":0,\"payChannel\":6,\"extraParamsJson\":\"{\\\"cardNoList\\\":[\\\"V1504341025911398403\\\",\\\"V1504341025911398402\\\",\\\"V1504341025911398401\\\"]}\"}]', '[{\"amount\":8,\"payChannel\":6}]', '2022-03-22 17:20:48.714000', NULL, '0:0:0:0:0:0:0:1', 0, '2022-03-22 17:20:48', 0, '2022-03-22 17:20:49', 1, 0);
INSERT INTO `pc_payment` VALUES (1506199579152855040, 0, '12222', '测试储值卡', '备注', 8.00, 0.00, 5, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":8,\"payWay\":0,\"payChannel\":6,\"extraParamsJson\":\"{\\\"cardNoList\\\":[\\\"V1504341025911398403\\\",\\\"V1504341025911398402\\\",\\\"V1504341025911398401\\\"]}\"}]', '[{\"amount\":0,\"payChannel\":6}]', '2022-03-22 17:22:18.530000', NULL, '0:0:0:0:0:0:0:1', 0, '2022-03-22 17:22:18', 1399985191002447872, '2022-03-22 17:24:13', 4, 0);
INSERT INTO `pc_payment` VALUES (1506202248835739648, 1399985191002447872, 'P1647941551207', '测试支付订单', NULL, 3.00, 0.00, 5, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":3,\"payWay\":4,\"payChannel\":6,\"extraParamsJson\":\"{\\\"cardNoList\\\":[\\\"V1504341025911398403\\\"]}\"}]', '[{\"amount\":0,\"payChannel\":6}]', '2022-03-22 17:32:54.881000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-22 17:32:55', 1399985191002447872, '2022-03-22 17:34:49', 2, 0);
INSERT INTO `pc_payment` VALUES (1506203310892232704, 1399985191002447872, 'P1647941823198', '测试支付订单', NULL, 3.00, 0.00, 5, NULL, NULL, NULL, b'0', NULL, '[{\"amount\":3,\"payWay\":4,\"payChannel\":6,\"extraParamsJson\":\"{\\\"cardNoList\\\":[\\\"V1504341025911398403\\\"]}\"}]', '[{\"amount\":0,\"payChannel\":6}]', '2022-03-22 17:37:08.108000', NULL, '127.0.0.1', 1399985191002447872, '2022-03-22 17:37:08', 1399985191002447872, '2022-03-22 17:38:23', 3, 0);

-- ----------------------------
-- Table structure for pc_point_config
-- ----------------------------
DROP TABLE IF EXISTS `pc_point_config`;
CREATE TABLE `pc_point_config`  (
  `id` bigint(20) NOT NULL,
  `consume_rate` decimal(19, 2) NULL DEFAULT NULL COMMENT '积分抵扣比例',
  `min_order_amount` decimal(19, 2) NULL DEFAULT NULL COMMENT '积分允许使用最低订单金额',
  `max_point_count` int(11) NULL DEFAULT NULL COMMENT '积分最低允许使用数量',
  `min_point_count` int(11) NULL DEFAULT NULL COMMENT '积分最高允许使用数量',
  `allow_partial_pay` bit(1) NULL DEFAULT NULL COMMENT '允许部分积分使用',
  `status` int(11) NULL DEFAULT NULL COMMENT '0:未激活，1:激活，默认0',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `tid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '积分配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_point_config
-- ----------------------------

-- ----------------------------
-- Table structure for pc_point_log
-- ----------------------------
DROP TABLE IF EXISTS `pc_point_log`;
CREATE TABLE `pc_point_log`  (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `points` int(11) NOT NULL COMMENT '积分',
  `type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `tid` bigint(20) NOT NULL,
  `business_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '积分日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_point_log
-- ----------------------------
INSERT INTO `pc_point_log` VALUES (1368825135523590144, 10011, 3, '系统发放', 'two', 1, '2021-03-08 15:25:18.507000', 1, '2021-03-08 15:25:18.507000', 0, b'0', 10011, '999');
INSERT INTO `pc_point_log` VALUES (1368825551321722880, 10011, 999, '系统发放', 'two', 1, '2021-03-08 15:26:57.641000', 1, '2021-03-08 15:26:57.641000', 0, b'0', 10011, '999');
INSERT INTO `pc_point_log` VALUES (1368825587640201216, 10011, -10, '购物消费', '购物消费', 1, '2021-03-08 15:27:06.300000', 1, '2021-03-08 15:27:06.300000', 0, b'0', 10011, '1');
INSERT INTO `pc_point_log` VALUES (1368830279527067648, 10011, 10, '退货返还', '退货返还', 1, '2021-03-08 15:45:44.933000', 1, '2021-03-08 15:45:44.933000', 0, b'0', 10011, '1');
INSERT INTO `pc_point_log` VALUES (1410989881097875456, 1001, -30, '购物消费', '购物消费', 1, '2021-07-02 23:52:57.235000', 1, '2021-07-02 23:52:57.235000', 0, b'0', 10011, '11');

-- ----------------------------
-- Table structure for pc_point_record
-- ----------------------------
DROP TABLE IF EXISTS `pc_point_record`;
CREATE TABLE `pc_point_record`  (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `type` int(11) NOT NULL COMMENT '类型',
  `origin_points` int(11) NOT NULL COMMENT '原始积分',
  `current_points` int(11) NOT NULL COMMENT '当前积分',
  `expire_date` datetime(6) NULL DEFAULT NULL COMMENT '到期时间',
  `business_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务id',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `tid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '积分记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_point_record
-- ----------------------------
INSERT INTO `pc_point_record` VALUES (1368825135439704064, 1001, 2, 3, 0, '2022-03-08 15:25:18.439000', '999', NULL, 1, '2021-03-08 15:25:18.477000', 1, '2021-07-02 23:52:57.054000', 3, b'0', 10011);
INSERT INTO `pc_point_record` VALUES (1368825551317528576, 1001, 2, 999, 972, '2022-03-08 15:26:57.639000', '999', NULL, 1, '2021-03-08 15:26:57.640000', 1, '2021-07-02 23:52:57.054000', 3, b'0', 10011);

-- ----------------------------
-- Table structure for pc_refund_record
-- ----------------------------
DROP TABLE IF EXISTS `pc_refund_record`;
CREATE TABLE `pc_refund_record`  (
  `id` bigint(20) NOT NULL,
  `payment_id` bigint(20) NOT NULL COMMENT '支付记录id',
  `business_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联业务id',
  `refund_request_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异步方式关联退款请求号',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `amount` decimal(19, 2) NOT NULL COMMENT '金额',
  `refundable_balance` decimal(19, 2) NULL DEFAULT NULL COMMENT '剩余可退款金额',
  `refundable_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '可退款信息',
  `refund_status` int(2) NULL DEFAULT NULL COMMENT '退款状态',
  `refund_time` datetime(6) NULL DEFAULT NULL COMMENT '支付时间',
  `client_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户ip',
  `error_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '错误码',
  `error_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '退款记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_refund_record
-- ----------------------------
INSERT INTO `pc_refund_record` VALUES (1499365607269597184, 1499365453351223296, NULL, NULL, 1399985191002447872, '测试支付订单', 6.00, NULL, '[{\"amount\":6,\"payChannel\":1}]', 1, '2022-03-03 20:46:32.292000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-03 20:46:32', 1399985191002447872, '2022-03-03 20:46:32', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1500110710145769472, 1500109009351303168, 'P1646488811784', NULL, 1399985191002447872, '测试支付', 9.99, NULL, '[{\"amount\":9.99,\"payChannel\":1}]', 1, '2022-03-05 22:07:18.662000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-05 22:07:19', 1399985191002447872, '2022-03-05 22:07:19', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1500111069450821632, 1500106636289597440, 'P1646488223511', NULL, 1399985191002447872, '测试支付', 1.01, NULL, '[{\"amount\":1.01,\"payChannel\":1}]', 1, '2022-03-05 22:08:44.329000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-05 22:08:44', 1399985191002447872, '2022-03-05 22:08:44', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1500112090201808896, 1500107385350348800, 'P1646488388626', NULL, 1399985191002447872, '测试支付', 1.01, NULL, '[{\"amount\":1.01,\"payChannel\":1}]', 1, '2022-03-05 22:12:47.695000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-05 22:12:48', 1399985191002447872, '2022-03-05 22:12:48', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1501453529821175808, 1501441454411489280, 'P1646806509833', '1501453526448955392', 1399985191002447872, '测试支付订单', 3.00, NULL, '[{\"amount\":3,\"payChannel\":1}]', 1, '2022-03-09 15:03:11.817000', '127.0.0.1', NULL, '退款金额无效', 1399985191002447872, '2022-03-09 15:03:12', 1399985191002447872, '2022-03-09 15:03:12', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1501453611090010112, 1501441454411489280, 'P1646806509833', '1501453608279826432', 1399985191002447872, '测试支付订单', 3.00, NULL, '[{\"amount\":3,\"payChannel\":1}]', 1, '2022-03-09 15:03:31.198000', '127.0.0.1', NULL, '退款金额无效', 1399985191002447872, '2022-03-09 15:03:31', 1399985191002447872, '2022-03-09 15:03:31', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1501453951218704384, 1501441454411489280, 'P1646806509833', '1501453708448194560', 1399985191002447872, '测试支付订单', 3.00, NULL, '[{\"amount\":3,\"payChannel\":1}]', 1, '2022-03-09 15:04:52.291000', '127.0.0.1', NULL, '退款金额无效', 1399985191002447872, '2022-03-09 15:04:52', 1399985191002447872, '2022-03-09 15:04:52', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1501469372961501184, 1501441454411489280, 'P1646806509833', '1501469367991250944', 0, '测试支付订单', 3.00, NULL, '[{\"amount\":3,\"payChannel\":1}]', 1, '2022-03-09 16:06:09.116000', '127.0.0.1', '40004', '退款金额无效', 0, '2022-03-09 16:06:09', 0, '2022-03-09 16:06:09', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1501469407849721856, 1501441454411489280, 'P1646806509833', '1501469399779880960', 0, '测试支付订单', 1.00, NULL, '[{\"amount\":1,\"payChannel\":1}]', 1, '2022-03-09 16:06:17.439000', '127.0.0.1', NULL, NULL, 0, '2022-03-09 16:06:17', 0, '2022-03-09 16:06:17', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1501492322305552384, 1501492179099430912, 'P1646818600150', '1501492315724689408', 1399985191002447872, '测试支付订单6', 1.00, NULL, '[{\"amount\":1,\"payChannel\":1}]', 1, '2022-03-09 17:37:20.671000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-09 17:37:21', 1399985191002447872, '2022-03-09 17:37:21', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1501493167290036224, 1501492179099430912, 'P1646818600150', '1501493159861923840', 1399985191002447872, '测试支付订单6', 0.50, NULL, '[{\"amount\":0.5,\"payChannel\":1}]', 1, '2022-03-09 17:40:42.132000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-09 17:40:42', 1399985191002447872, '2022-03-09 17:40:42', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1501494326910234624, 1501492179099430912, 'P1646818600150', '1501494237533810688', 1399985191002447872, '测试支付订单6', 0.10, NULL, '[{\"amount\":0.1,\"payChannel\":1}]', 1, '2022-03-09 17:45:18.607000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-09 17:45:19', 1399985191002447872, '2022-03-09 17:45:19', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1501495365369573376, 1501492179099430912, 'P1646818600150', '1501495357513641984', 1399985191002447872, '测试支付订单6', 0.01, NULL, '[{\"amount\":0.01,\"payChannel\":1}]', 1, '2022-03-09 17:49:26.191000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-09 17:49:26', 1399985191002447872, '2022-03-09 17:49:26', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1502939675042463744, 1502938926644412416, 'P1647163533191', NULL, 1399985191002447872, '测试支付订单', 510.00, NULL, '[{\"amount\":500,\"payChannel\":4},{\"amount\":10,\"payChannel\":5}]', 1, '2022-03-13 17:28:36.453000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-13 17:28:36', 1399985191002447872, '2022-03-13 17:28:36', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1502941471433506816, 1502938926644412416, 'P1647163533191', NULL, 1399985191002447872, '测试支付订单', 105.00, NULL, '[{\"amount\":100,\"payChannel\":4},{\"amount\":5,\"payChannel\":5}]', 1, '2022-03-13 17:35:44.748000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-13 17:35:45', 1399985191002447872, '2022-03-13 17:35:45', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1502943248782397440, 1502938577812537344, 'P1647163394013', NULL, 1399985191002447872, '测试支付订单', 900004.00, 100000.00, '[{\"amount\":5,\"payChannel\":4},{\"amount\":899999,\"payChannel\":5}]', 1, '2022-03-13 17:42:48.499000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-13 17:42:49', 1399985191002447872, '2022-03-13 17:42:49', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1505092517769474048, 1505092081981288448, 'P1647676887751', NULL, 1399985191002447872, '测试支付订单', 0.01, 0.00, '[{\"amount\":0.01,\"payChannel\":4}]', 1, '2022-03-19 16:03:14.158000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-19 16:03:14', 1399985191002447872, '2022-03-19 16:03:14', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1506195655448576000, 1506194826553442304, '1122', NULL, 1399985191002447872, '测试储值卡', 3.00, 5.00, '[{\"amount\":3,\"payChannel\":6}]', 1, '2022-03-22 17:06:42.674000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-22 17:06:43', 1399985191002447872, '2022-03-22 17:06:43', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1506197934276849664, 1506194826553442304, '1122', NULL, 1399985191002447872, '测试储值卡', 1.00, 4.00, '[{\"amount\":1,\"payChannel\":6}]', 1, '2022-03-22 17:15:45.985000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-22 17:15:46', 1399985191002447872, '2022-03-22 17:15:46', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1506198724299173888, 1506194826553442304, '1122', NULL, 1399985191002447872, '测试储值卡', 1.00, 3.00, '[{\"amount\":1,\"payChannel\":6}]', 1, '2022-03-22 17:18:54.347000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-22 17:18:54', 1399985191002447872, '2022-03-22 17:18:54', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1506199662715973632, 1506199579152855040, '12222', NULL, 1399985191002447872, '测试储值卡', 2.20, 5.80, '[{\"amount\":2.2,\"payChannel\":6}]', 1, '2022-03-22 17:22:38.084000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-22 17:22:38', 1399985191002447872, '2022-03-22 17:22:38', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1506199912281255936, 1506199579152855040, '12222', NULL, 1399985191002447872, '测试储值卡', 3.00, 2.80, '[{\"amount\":3,\"payChannel\":6}]', 1, '2022-03-22 17:23:37.585000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-22 17:23:38', 1399985191002447872, '2022-03-22 17:23:38', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1506200062877741056, 1506199579152855040, '12222', NULL, 1399985191002447872, '测试储值卡', 2.80, 0.00, '[{\"amount\":2.8,\"payChannel\":6}]', 1, '2022-03-22 17:24:13.489000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-22 17:24:13', 1399985191002447872, '2022-03-22 17:24:13', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1506202730576719872, 1506202248835739648, 'P1647941551207', NULL, 1399985191002447872, '测试支付订单', 3.00, 0.00, '[{\"amount\":3,\"payChannel\":6}]', 1, '2022-03-22 17:34:49.517000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-22 17:34:50', 1399985191002447872, '2022-03-22 17:34:50', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1506203509744185344, 1506203310892232704, 'P1647941823198', NULL, 1399985191002447872, '测试支付订单', 2.00, 1.00, '[{\"amount\":2,\"payChannel\":6}]', 1, '2022-03-22 17:37:55.286000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-22 17:37:55', 1399985191002447872, '2022-03-22 17:37:55', 0, 0);
INSERT INTO `pc_refund_record` VALUES (1506203624378707968, 1506203310892232704, 'P1647941823198', NULL, 1399985191002447872, '测试支付订单', 1.00, 0.00, '[{\"amount\":1,\"payChannel\":6}]', 1, '2022-03-22 17:38:22.617000', '127.0.0.1', NULL, NULL, 1399985191002447872, '2022-03-22 17:38:23', 1399985191002447872, '2022-03-22 17:38:23', 0, 0);

-- ----------------------------
-- Table structure for pc_voucher
-- ----------------------------
DROP TABLE IF EXISTS `pc_voucher`;
CREATE TABLE `pc_voucher`  (
  `id` bigint(20) NOT NULL,
  `card_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '卡号',
  `batch_no` bigint(20) NULL DEFAULT NULL COMMENT '批次号',
  `face_value` decimal(15, 2) NULL DEFAULT NULL COMMENT '面值',
  `balance` decimal(15, 2) NULL DEFAULT NULL COMMENT '余额',
  `enduring` bit(1) NOT NULL COMMENT '是否长期有效',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `status` int(2) NOT NULL COMMENT '状态',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '储值卡' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_voucher
-- ----------------------------
INSERT INTO `pc_voucher` VALUES (1503347269838016512, 'V1503347269779296257', 1503347269779296256, 1.00, 1.00, b'1', NULL, NULL, 2, 1399985191002447872, '2022-03-14 20:28:15', 1399985191002447872, '2022-03-14 20:28:15', 0, 0);
INSERT INTO `pc_voucher` VALUES (1503597209029943296, 'V1503597209008971776', 1503597209004777472, 1.00, 1.00, b'0', '2022-03-15 00:00:00', '2022-03-18 00:00:00', 2, 1399985191002447872, '2022-03-15 13:01:25', 1399985191002447872, '2022-03-15 13:01:25', 0, 0);
INSERT INTO `pc_voucher` VALUES (1504341025932369920, 'V1504341025911398401', 1504341025911398400, 3.00, 3.03, b'0', '2022-03-01 00:00:00', '2022-04-30 23:59:59', 1, 1399985191002447872, '2022-03-17 14:17:05', 1399985191002447872, '2022-03-22 17:24:13', 9, 0);
INSERT INTO `pc_voucher` VALUES (1504341026100142080, 'V1504341025911398402', 1504341025911398400, 3.00, 1.64, b'0', '2022-03-01 00:00:00', '2022-04-30 23:59:59', 1, 1399985191002447872, '2022-03-17 14:17:05', 1399985191002447872, '2022-03-22 17:24:13', 9, 0);
INSERT INTO `pc_voucher` VALUES (1504341026104336384, 'V1504341025911398403', 1504341025911398400, 3.00, 4.14, b'0', '2022-03-01 00:00:00', '2022-04-30 23:59:59', 1, 1399985191002447872, '2022-03-17 14:17:05', 1399985191002447872, '2022-03-22 17:38:22', 16, 0);

-- ----------------------------
-- Table structure for pc_voucher_log
-- ----------------------------
DROP TABLE IF EXISTS `pc_voucher_log`;
CREATE TABLE `pc_voucher_log`  (
  `id` bigint(20) NOT NULL,
  `voucher_id` bigint(20) NOT NULL,
  `voucher_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `amount` decimal(19, 2) NULL DEFAULT NULL,
  `type` int(5) NOT NULL COMMENT '类型',
  `payment_id` bigint(20) NULL DEFAULT NULL COMMENT '交易记录ID',
  `business_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '储值卡日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_voucher_log
-- ----------------------------
INSERT INTO `pc_voucher_log` VALUES (1506199579849109504, 1504341026104336384, 'V1504341025911398403', 2.81, 2, 1506199579152855040, '12222', NULL, 0, '2022-03-22 17:22:18', 0, '2022-03-22 17:22:18', 0, 0);
INSERT INTO `pc_voucher_log` VALUES (1506199579857498112, 1504341025932369920, 'V1504341025911398401', 3.00, 2, 1506199579152855040, '12222', NULL, 0, '2022-03-22 17:22:18', 0, '2022-03-22 17:22:18', 0, 0);
INSERT INTO `pc_voucher_log` VALUES (1506199579861692416, 1504341026100142080, 'V1504341025911398402', 0.81, 2, 1506199579152855040, '12222', NULL, 0, '2022-03-22 17:22:18', 0, '2022-03-22 17:22:18', 0, 0);
INSERT INTO `pc_voucher_log` VALUES (1506199661654814720, 1504341025932369920, 'V1504341025911398401', 0.84, 4, 1506199579152855040, '12222', NULL, 1399985191002447872, '2022-03-22 17:22:38', 1399985191002447872, '2022-03-22 17:22:38', 0, 0);
INSERT INTO `pc_voucher_log` VALUES (1506199661663203328, 1504341026100142080, 'V1504341025911398402', 0.23, 4, 1506199579152855040, '12222', NULL, 1399985191002447872, '2022-03-22 17:22:38', 1399985191002447872, '2022-03-22 17:22:38', 0, 0);
INSERT INTO `pc_voucher_log` VALUES (1506199661663203329, 1504341026104336384, 'V1504341025911398403', 1.13, 4, 1506199579152855040, '12222', NULL, 1399985191002447872, '2022-03-22 17:22:38', 1399985191002447872, '2022-03-22 17:22:38', 0, 0);
INSERT INTO `pc_voucher_log` VALUES (1506199910532231168, 1504341025932369920, 'V1504341025911398401', 1.14, 4, 1506199579152855040, '12222', NULL, 1399985191002447872, '2022-03-22 17:23:37', 1399985191002447872, '2022-03-22 17:23:37', 0, 0);
INSERT INTO `pc_voucher_log` VALUES (1506199910540619776, 1504341026100142080, 'V1504341025911398402', 0.31, 4, 1506199579152855040, '12222', NULL, 1399985191002447872, '2022-03-22 17:23:37', 1399985191002447872, '2022-03-22 17:23:37', 0, 0);
INSERT INTO `pc_voucher_log` VALUES (1506199910540619777, 1504341026104336384, 'V1504341025911398403', 1.55, 4, 1506199579152855040, '12222', NULL, 1399985191002447872, '2022-03-22 17:23:37', 1399985191002447872, '2022-03-22 17:23:37', 0, 0);
INSERT INTO `pc_voucher_log` VALUES (1506200061883691008, 1504341025932369920, 'V1504341025911398401', 1.05, 4, 1506199579152855040, '12222', NULL, 1399985191002447872, '2022-03-22 17:24:13', 1399985191002447872, '2022-03-22 17:24:13', 0, 0);
INSERT INTO `pc_voucher_log` VALUES (1506200061887885312, 1504341026100142080, 'V1504341025911398402', 0.29, 4, 1506199579152855040, '12222', NULL, 1399985191002447872, '2022-03-22 17:24:13', 1399985191002447872, '2022-03-22 17:24:13', 0, 0);
INSERT INTO `pc_voucher_log` VALUES (1506200061892079616, 1504341026104336384, 'V1504341025911398403', 1.46, 4, 1506199579152855040, '12222', NULL, 1399985191002447872, '2022-03-22 17:24:13', 1399985191002447872, '2022-03-22 17:24:13', 0, 0);
INSERT INTO `pc_voucher_log` VALUES (1506202249221615616, 1504341026104336384, 'V1504341025911398403', 1.14, 2, 1506202248835739648, 'P1647941551207', NULL, 1399985191002447872, '2022-03-22 17:32:55', 1399985191002447872, '2022-03-22 17:32:55', 0, 0);
INSERT INTO `pc_voucher_log` VALUES (1506202729918214144, 1504341026104336384, 'V1504341025911398403', 3.00, 4, 1506202248835739648, 'P1647941551207', NULL, 1399985191002447872, '2022-03-22 17:34:49', 1399985191002447872, '2022-03-22 17:34:49', 0, 0);
INSERT INTO `pc_voucher_log` VALUES (1506203311307468800, 1504341026104336384, 'V1504341025911398403', 3.00, 2, 1506203310892232704, 'P1647941823198', NULL, 1399985191002447872, '2022-03-22 17:37:08', 1399985191002447872, '2022-03-22 17:37:08', 0, 0);
INSERT INTO `pc_voucher_log` VALUES (1506203509077291008, 1504341026104336384, 'V1504341025911398403', 2.00, 4, 1506203310892232704, 'P1647941823198', NULL, 1399985191002447872, '2022-03-22 17:37:55', 1399985191002447872, '2022-03-22 17:37:55', 0, 0);
INSERT INTO `pc_voucher_log` VALUES (1506203623716007936, 1504341026104336384, 'V1504341025911398403', 1.00, 4, 1506203310892232704, 'P1647941823198', NULL, 1399985191002447872, '2022-03-22 17:38:22', 1399985191002447872, '2022-03-22 17:38:22', 0, 0);

-- ----------------------------
-- Table structure for pc_voucher_payment
-- ----------------------------
DROP TABLE IF EXISTS `pc_voucher_payment`;
CREATE TABLE `pc_voucher_payment`  (
  `id` bigint(20) NOT NULL,
  `voucher_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '储值卡id列表',
  `payment_id` bigint(20) NOT NULL COMMENT '支付id',
  `business_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `amount` decimal(19, 2) NULL DEFAULT NULL COMMENT '金额',
  `refundable_balance` decimal(19, 2) NULL DEFAULT NULL COMMENT '可退款金额',
  `pay_status` int(11) NULL DEFAULT NULL COMMENT '支付状态',
  `pay_time` datetime(6) NULL DEFAULT NULL COMMENT '支付时间',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '储值卡支付记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_voucher_payment
-- ----------------------------
INSERT INTO `pc_voucher_payment` VALUES (1506194860221120512, '1504341026104336384,1504341025932369920,1504341026100142080', 1506194826553442304, '1122', 0, 8.00, 3.00, 4, '2022-03-22 17:03:33.158000', 0, '2022-03-22 17:03:33', 1399985191002447872, '2022-03-22 17:18:54', 4, 0);
INSERT INTO `pc_voucher_payment` VALUES (1506199203498405888, '1504341026104336384,1504341025932369920,1504341026100142080', 1506199202508550144, '11222', 0, 8.00, 8.00, 1, '2022-03-22 17:20:48.662000', 0, '2022-03-22 17:20:49', 0, '2022-03-22 17:20:49', 1, 0);
INSERT INTO `pc_voucher_payment` VALUES (1506199580226596864, '1504341026104336384,1504341025932369920,1504341026100142080', 1506199579152855040, '12222', 0, 8.00, 0.00, 5, '2022-03-22 17:22:18.487000', 0, '2022-03-22 17:22:18', 1399985191002447872, '2022-03-22 17:24:13', 4, 0);
INSERT INTO `pc_voucher_payment` VALUES (1506202249372610560, '1504341026104336384', 1506202248835739648, 'P1647941551207', 1399985191002447872, 3.00, 0.00, 5, '2022-03-22 17:32:54.845000', 1399985191002447872, '2022-03-22 17:32:55', 1399985191002447872, '2022-03-22 17:34:49', 2, 0);
INSERT INTO `pc_voucher_payment` VALUES (1506203311462658048, '1504341026104336384', 1506203310892232704, 'P1647941823198', 1399985191002447872, 3.00, 0.00, 5, '2022-03-22 17:37:08.073000', 1399985191002447872, '2022-03-22 17:37:08', 1399985191002447872, '2022-03-22 17:38:23', 3, 0);

-- ----------------------------
-- Table structure for pc_wallet
-- ----------------------------
DROP TABLE IF EXISTS `pc_wallet`;
CREATE TABLE `pc_wallet`  (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '关联用户id',
  `balance` decimal(19, 2) NOT NULL COMMENT '余额',
  `status` int(11) NOT NULL COMMENT '状态',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pk_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '钱包' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_wallet
-- ----------------------------
INSERT INTO `pc_wallet` VALUES (1336489524259352576, 1399985191002447872, 999983.00, 1, NULL, '2022-03-11 21:37:33', 1399985191002447872, '2022-03-13 17:42:47', 25, 0);
INSERT INTO `pc_wallet` VALUES (1502554238582968320, 1414143554414059520, 1019.00, 1, 1399985191002447872, '2022-03-12 15:57:01', 1399985191002447872, '2022-03-13 11:21:10', 2, 0);
INSERT INTO `pc_wallet` VALUES (1502848353136791552, 1435894470432456704, 100.00, 1, 1399985191002447872, '2022-03-13 11:25:44', 1399985191002447872, '2022-03-24 13:22:37', 1, 0);

-- ----------------------------
-- Table structure for pc_wallet_log
-- ----------------------------
DROP TABLE IF EXISTS `pc_wallet_log`;
CREATE TABLE `pc_wallet_log`  (
  `id` bigint(20) NOT NULL,
  `wallet_id` bigint(20) NOT NULL COMMENT '钱包id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `type` int(11) NOT NULL COMMENT '类型',
  `payment_id` bigint(20) NULL DEFAULT NULL COMMENT '交易记录ID',
  `client_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作终端ip',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `business_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务ID',
  `operation_source` int(11) NOT NULL COMMENT '操作源',
  `amount` decimal(19, 2) NULL DEFAULT NULL COMMENT '金额',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '钱包日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_wallet_log
-- ----------------------------
INSERT INTO `pc_wallet_log` VALUES (1407884532522315776, 1336489524259352576, 1001, 5, 1407884530089619456, NULL, '钱包支付金额 100.00 ', '1407879663895863296', 3, 199.00, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1407886108477517824, 1336489524259352576, 1001, 8, 1407884530089619456, NULL, '取消支付返回金额 100.00 ', '1407879663895863296', 1, 100.00, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1409386462994132992, 1336489524259352576, 1001, 5, 1409386462092357632, NULL, '钱包支付金额 199.00 ', '1409385932448227328', 3, 398.00, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1409821341913346048, 1336489524259352576, 1001, 5, 1409821340734746624, NULL, '钱包支付金额 398.00 ', '1409821156785152000', 3, 996.00, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1410989880057688064, 1336489524259352576, 1001, 5, 1410989876228288512, NULL, '钱包支付金额 20.00 ', '11', 3, 45.00, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1418472154105802752, 1336489524259352576, 1, 5, 1418472153543766016, NULL, '钱包支付金额 1.10 ', '1418472136397447168', 3, 1.10, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502554239262445568, 1502554238582968320, 1414143554414059520, 1, NULL, NULL, '激活钱包', NULL, 3, NULL, 1399985191002447872, '2022-03-12 15:57:01', 1399985191002447872, '2022-03-12 15:57:01', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502608455972573184, 1502554238582968320, 1414143554414059520, 4, NULL, NULL, '系统变动余额 %.2f ', NULL, 2, 999.00, 1399985191002447872, '2022-03-12 19:32:28', 1399985191002447872, '2022-03-12 19:32:28', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502634770893340672, 1336489524259352576, 1399985191002447872, 4, NULL, NULL, '系统变动余额 22.00 ', NULL, 2, 22.00, 1399985191002447872, '2022-03-12 21:17:02', 1399985191002447872, '2022-03-12 21:17:02', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502847229172371456, 1502554238582968320, 1414143554414059520, 4, NULL, NULL, '系统变动余额 20.00 ', NULL, 2, 20.00, 1399985191002447872, '2022-03-13 11:21:16', 1399985191002447872, '2022-03-13 11:21:16', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502847262668083200, 1336489524259352576, 1399985191002447872, 4, NULL, NULL, '系统变动余额 -9999999.00 ', NULL, 2, -9999999.00, 1399985191002447872, '2022-03-13 11:21:24', 1399985191002447872, '2022-03-13 11:21:24', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502847356570161152, 1336489524259352576, 1399985191002447872, 4, NULL, NULL, '系统变动余额 99999999999.00 ', NULL, 2, 99999999999.00, 1399985191002447872, '2022-03-13 11:21:46', 1399985191002447872, '2022-03-13 11:21:46', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502847392137859072, 1336489524259352576, 1399985191002447872, 4, NULL, NULL, '系统变动余额 -9007199254740991.00 ', NULL, 2, -9007199254740991.00, 1399985191002447872, '2022-03-13 11:21:54', 1399985191002447872, '2022-03-13 11:21:54', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502847427130937344, 1336489524259352576, 1399985191002447872, 4, NULL, NULL, '系统变动余额 -9007199254740991.00 ', NULL, 2, -9007199254740991.00, 1399985191002447872, '2022-03-13 11:22:03', 1399985191002447872, '2022-03-13 11:22:03', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502847563458400256, 1336489524259352576, 1399985191002447872, 4, NULL, NULL, '系统变动余额 -133648952425930.00 ', NULL, 2, -133648952425930.00, 1399985191002447872, '2022-03-13 11:22:35', 1399985191002447872, '2022-03-13 11:22:35', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502847638452555776, 1336489524259352576, 1399985191002447872, 4, NULL, NULL, '系统变动余额 -9007199254740991.00 ', NULL, 2, -9007199254740991.00, 1399985191002447872, '2022-03-13 11:22:53', 1399985191002447872, '2022-03-13 11:22:53', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502847763799330816, 1336489524259352576, 1399985191002447872, 4, NULL, NULL, '系统变动余额 -9007199254740991.00 ', NULL, 2, -9007199254740991.00, 1399985191002447872, '2022-03-13 11:23:23', 1399985191002447872, '2022-03-13 11:23:23', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502847801418043392, 1336489524259352576, 1399985191002447872, 4, NULL, NULL, '系统变动余额 -9007199254740991.00 ', NULL, 2, -9007199254740991.00, 1399985191002447872, '2022-03-13 11:23:32', 1399985191002447872, '2022-03-13 11:23:32', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502848353736577024, 1502848353136791552, 1435894470432456704, 1, NULL, NULL, '激活钱包', NULL, 3, 0.00, 1399985191002447872, '2022-03-13 11:25:44', 1399985191002447872, '2022-03-13 11:25:44', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502937814205939712, 1336489524259352576, 1399985191002447872, 5, 1502937813316747264, NULL, '钱包支付金额 6.00 ', 'P1647163261715', 3, 11.00, 1399985191002447872, '2022-03-13 17:21:13', 1399985191002447872, '2022-03-13 17:21:13', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502938181299814400, 1336489524259352576, 1399985191002447872, 5, 1502938173473243136, NULL, '钱包支付金额 6.00 ', 'P1647163305690', 3, 12.00, 1399985191002447872, '2022-03-13 17:22:40', 1399985191002447872, '2022-03-13 17:22:40', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502938239768412160, 1336489524259352576, 1399985191002447872, 5, 1502938239227346944, NULL, '钱包支付金额 6.00 ', 'P1647163368384', 3, 11.00, 1399985191002447872, '2022-03-13 17:22:54', 1399985191002447872, '2022-03-13 17:22:54', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502938260345667584, 1336489524259352576, 1399985191002447872, 5, 1502938259808796672, NULL, '钱包支付金额 6.00 ', 'P1647163374477', 3, 11.00, 1399985191002447872, '2022-03-13 17:22:59', 1399985191002447872, '2022-03-13 17:22:59', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502938321754472448, 1336489524259352576, 1399985191002447872, 5, 1502938321196630016, NULL, '钱包支付金额 999999.00 ', 'P1647163379376', 3, 1000004.00, 1399985191002447872, '2022-03-13 17:23:14', 1399985191002447872, '2022-03-13 17:23:14', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502938578391351296, 1336489524259352576, 1399985191002447872, 5, 1502938577812537344, NULL, '钱包支付金额 999999.00 ', 'P1647163394013', 3, 1000004.00, 1399985191002447872, '2022-03-13 17:24:15', 1399985191002447872, '2022-03-13 17:24:15', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502938631604486144, 1336489524259352576, 1399985191002447872, 5, 1502938631252164608, NULL, '钱包支付金额 15.00 ', 'P1647163463579', 3, 15.00, 1399985191002447872, '2022-03-13 17:24:28', 1399985191002447872, '2022-03-13 17:24:28', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502938647236657152, 1336489524259352576, 1399985191002447872, 5, 1502938646888529920, NULL, '钱包支付金额 15.00 ', 'P1647163467884', 3, 15.00, 1399985191002447872, '2022-03-13 17:24:31', 1399985191002447872, '2022-03-13 17:24:31', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502938661216272384, 1336489524259352576, 1399985191002447872, 5, 1502938660868145152, NULL, '钱包支付金额 15.00 ', 'P1647163471620', 3, 15.00, 1399985191002447872, '2022-03-13 17:24:35', 1399985191002447872, '2022-03-13 17:24:35', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502938765180485632, 1336489524259352576, 1399985191002447872, 5, 1502938764777832448, NULL, '钱包支付金额 1.00 ', 'P1647163474940', 3, 1.00, 1399985191002447872, '2022-03-13 17:25:00', 1399985191002447872, '2022-03-13 17:25:00', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502938888501411840, 1336489524259352576, 1399985191002447872, 5, 1502938888165867520, NULL, '钱包支付金额 1.00 ', 'P1647163526242', 3, 1.00, 1399985191002447872, '2022-03-13 17:25:29', 1399985191002447872, '2022-03-13 17:25:29', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502938905551257600, 1336489524259352576, 1399985191002447872, 5, 1502938905215713280, NULL, '钱包支付金额 15.00 ', 'P1647163529124', 3, 15.00, 1399985191002447872, '2022-03-13 17:25:33', 1399985191002447872, '2022-03-13 17:25:33', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502938927126757376, 1336489524259352576, 1399985191002447872, 5, 1502938926644412416, NULL, '钱包支付金额 15.00 ', 'P1647163533191', 3, 615.00, 1399985191002447872, '2022-03-13 17:25:38', 1399985191002447872, '2022-03-13 17:25:38', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502939674329432064, 1336489524259352576, 1399985191002447872, 7, 1502938926644412416, NULL, '钱包退款金额 10.00 ', 'P1647163533191', 2, 10.00, 1399985191002447872, '2022-03-13 17:28:36', 1399985191002447872, '2022-03-13 17:28:36', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502941470586257408, 1336489524259352576, 1399985191002447872, 7, 1502938926644412416, NULL, '钱包退款金额 5.00 ', 'P1647163533191', 2, 5.00, 1399985191002447872, '2022-03-13 17:35:45', 1399985191002447872, '2022-03-13 17:35:45', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1502943247738015744, 1336489524259352576, 1399985191002447872, 7, 1502938577812537344, NULL, '钱包退款金额 899999.00 ', 'P1647163394013', 2, 899999.00, 1399985191002447872, '2022-03-13 17:42:48', 1399985191002447872, '2022-03-13 17:42:48', 0, 0);
INSERT INTO `pc_wallet_log` VALUES (1506864040498876416, 1502848353136791552, 1435894470432456704, 4, NULL, NULL, '系统变动余额 100.00 ', NULL, 2, 100.00, 1399985191002447872, '2022-03-24 13:22:38', 1399985191002447872, '2022-03-24 13:22:38', 0, 0);

-- ----------------------------
-- Table structure for pc_wallet_payment
-- ----------------------------
DROP TABLE IF EXISTS `pc_wallet_payment`;
CREATE TABLE `pc_wallet_payment`  (
  `id` bigint(20) NOT NULL,
  `payment_id` bigint(20) NOT NULL COMMENT '交易记录ID',
  `business_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `wallet_id` bigint(20) NULL DEFAULT NULL COMMENT '钱包ID',
  `amount` decimal(19, 2) NULL DEFAULT NULL COMMENT '交易金额',
  `refundable_balance` decimal(19, 2) NULL DEFAULT NULL COMMENT '可退款金额',
  `pay_time` datetime(6) NULL DEFAULT NULL COMMENT '支付时间',
  `pay_status` int(11) NOT NULL COMMENT '支付状态',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '钱包交易记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_wallet_payment
-- ----------------------------
INSERT INTO `pc_wallet_payment` VALUES (1407884532572647424, 1407884530089619456, '1407879663895863296', 1001, 1336489524259352576, 100.00, NULL, '2021-06-24 10:13:24.592000', 3, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_wallet_payment` VALUES (1409386463023493120, 1409386462092357632, '1409385932448227328', 1001, 1336489524259352576, 199.00, NULL, '2021-06-28 13:41:32.647000', 1, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_wallet_payment` VALUES (1409821341993037824, 1409821340734746624, '1409821156785152000', 1001, 1336489524259352576, 398.00, NULL, '2021-06-29 18:29:35.841000', 1, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_wallet_payment` VALUES (1410989880078659584, 1410989876228288512, '11', 1001, 1336489524259352576, 20.00, NULL, '2021-07-02 23:52:57.226000', 3, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_wallet_payment` VALUES (1418472154135162880, 1418472153543766016, '1418472136397447168', 1, 1336489524259352576, 1.10, NULL, '2021-07-23 15:24:50.254000', 1, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `pc_wallet_payment` VALUES (1502937814390489088, 1502937813316747264, 'P1647163261715', 1399985191002447872, 1336489524259352576, 6.00, 6.00, '2022-03-13 17:21:12.903000', 1, 1399985191002447872, '2022-03-13 17:21:13', 1399985191002447872, '2022-03-13 17:21:13', 1, 0);
INSERT INTO `pc_wallet_payment` VALUES (1502938181446615040, 1502938173473243136, 'P1647163305690', 1399985191002447872, 1336489524259352576, 6.00, 6.00, '2022-03-13 17:22:40.426000', 1, 1399985191002447872, '2022-03-13 17:22:40', 1399985191002447872, '2022-03-13 17:22:40', 1, 0);
INSERT INTO `pc_wallet_payment` VALUES (1502938239915212800, 1502938239227346944, 'P1647163368384', 1399985191002447872, 1336489524259352576, 6.00, 6.00, '2022-03-13 17:22:54.351000', 1, 1399985191002447872, '2022-03-13 17:22:54', 1399985191002447872, '2022-03-13 17:22:54', 1, 0);
INSERT INTO `pc_wallet_payment` VALUES (1502938260492468224, 1502938259808796672, 'P1647163374477', 1399985191002447872, 1336489524259352576, 6.00, 6.00, '2022-03-13 17:22:59.254000', 1, 1399985191002447872, '2022-03-13 17:22:59', 1399985191002447872, '2022-03-13 17:22:59', 1, 0);
INSERT INTO `pc_wallet_payment` VALUES (1502938321897078784, 1502938321196630016, 'P1647163379376', 1399985191002447872, 1336489524259352576, 999999.00, 999999.00, '2022-03-13 17:23:13.891000', 1, 1399985191002447872, '2022-03-13 17:23:14', 1399985191002447872, '2022-03-13 17:23:14', 1, 0);
INSERT INTO `pc_wallet_payment` VALUES (1502938578538151936, 1502938577812537344, 'P1647163394013', 1399985191002447872, 1336489524259352576, 999999.00, 100000.00, '2022-03-13 17:24:15.080000', 4, 1399985191002447872, '2022-03-13 17:24:15', 1399985191002447872, '2022-03-13 17:42:48', 2, 0);
INSERT INTO `pc_wallet_payment` VALUES (1502938631738703872, 1502938631252164608, 'P1647163463579', 1399985191002447872, 1336489524259352576, 15.00, 15.00, '2022-03-13 17:24:27.762000', 1, 1399985191002447872, '2022-03-13 17:24:28', 1399985191002447872, '2022-03-13 17:24:28', 1, 0);
INSERT INTO `pc_wallet_payment` VALUES (1502938647370874880, 1502938646888529920, 'P1647163467884', 1399985191002447872, 1336489524259352576, 15.00, 15.00, '2022-03-13 17:24:31.490000', 1, 1399985191002447872, '2022-03-13 17:24:31', 1399985191002447872, '2022-03-13 17:24:31', 1, 0);
INSERT INTO `pc_wallet_payment` VALUES (1502938661350490112, 1502938660868145152, 'P1647163471620', 1399985191002447872, 1336489524259352576, 15.00, 15.00, '2022-03-13 17:24:34.821000', 1, 1399985191002447872, '2022-03-13 17:24:35', 1399985191002447872, '2022-03-13 17:24:35', 1, 0);
INSERT INTO `pc_wallet_payment` VALUES (1502938765318897664, 1502938764777832448, 'P1647163474940', 1399985191002447872, 1336489524259352576, 1.00, 1.00, '2022-03-13 17:24:59.613000', 1, 1399985191002447872, '2022-03-13 17:25:00', 1399985191002447872, '2022-03-13 17:25:00', 1, 0);
INSERT INTO `pc_wallet_payment` VALUES (1502938888631435264, 1502938888165867520, 'P1647163526242', 1399985191002447872, 1336489524259352576, 1.00, 1.00, '2022-03-13 17:25:29.008000', 1, 1399985191002447872, '2022-03-13 17:25:29', 1399985191002447872, '2022-03-13 17:25:29', 1, 0);
INSERT INTO `pc_wallet_payment` VALUES (1502938905681281024, 1502938905215713280, 'P1647163529124', 1399985191002447872, 1336489524259352576, 15.00, 15.00, '2022-03-13 17:25:33.074000', 1, 1399985191002447872, '2022-03-13 17:25:33', 1399985191002447872, '2022-03-13 17:25:33', 1, 0);
INSERT INTO `pc_wallet_payment` VALUES (1502938927265169408, 1502938926644412416, 'P1647163533191', 1399985191002447872, 1336489524259352576, 15.00, 0.00, '2022-03-13 17:25:38.221000', 5, 1399985191002447872, '2022-03-13 17:25:38', 1399985191002447872, '2022-03-13 17:35:45', 3, 0);

-- ----------------------------
-- Table structure for pc_wechat_pay_config
-- ----------------------------
DROP TABLE IF EXISTS `pc_wechat_pay_config`;
CREATE TABLE `pc_wechat_pay_config`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `app_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信应用AppId',
  `sl_app_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务商应用编号',
  `api_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户平台「API安全」中的 API 密钥',
  `api_key3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户平台「API安全」中的 APIv3 密钥',
  `mch_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户号',
  `sl_mch_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务商商户号',
  `auth_type` int(3) NULL DEFAULT NULL COMMENT '认证方式',
  `cert_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'API 证书中的 p12',
  `cert_pem_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'API 证书中的 key.pem',
  `key_pem_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'API 证书中的 cert.pem',
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用域名，回调中会使用此参数',
  `notify_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务器异步通知页面路径',
  `return_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '页面跳转同步通知页面路径',
  `partner_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '同 apiKey 后续版本会舍弃',
  `is_default` bit(1) NULL DEFAULT NULL COMMENT '是否默认',
  `pay_ways` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支持的支付类型',
  `sandbox` bit(1) NOT NULL COMMENT '是否沙箱环境',
  `activity` bit(1) NOT NULL COMMENT '是否启用',
  `state` int(11) NULL DEFAULT NULL COMMENT '状态',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信支付配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_wechat_pay_config
-- ----------------------------

-- ----------------------------
-- Table structure for pc_wechat_payment
-- ----------------------------
DROP TABLE IF EXISTS `pc_wechat_payment`;
CREATE TABLE `pc_wechat_payment`  (
  `id` bigint(20) NOT NULL,
  `payment_id` bigint(20) NOT NULL COMMENT '交易记录ID',
  `pay_status` int(11) NOT NULL COMMENT '支付状态',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `trade_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信交易号',
  `amount` decimal(19, 2) NOT NULL COMMENT '交易金额',
  `refundable_balance` decimal(19, 2) NULL DEFAULT NULL COMMENT '可退款金额',
  `business_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务id',
  `pay_time` datetime(6) NULL DEFAULT NULL COMMENT '支付时间',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `tid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信支付记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pc_wechat_payment
-- ----------------------------
INSERT INTO `pc_wechat_payment` VALUES (1406929057056190464, 1406928928664350720, 1, 1001, '1406928928664350720', 0.01, NULL, '4', '2021-06-21 18:56:41.312000', 1, '2021-06-21 18:56:41.337000', 1, '2021-06-21 18:56:41.337000', 0, b'0', 10011);
INSERT INTO `pc_wechat_payment` VALUES (1406930141317328896, 1406928928664350720, 1, 1001, '1406928928664350720', 0.01, NULL, '4', '2021-06-21 19:00:59.827000', 1, '2021-06-21 19:00:59.845000', 1, '2021-06-21 19:00:59.845000', 0, b'0', 10011);
INSERT INTO `pc_wechat_payment` VALUES (1407177127203336192, 1407174717839929344, 1, 1001, '1407174717839929344', 0.01, NULL, '5', '2021-06-22 11:22:25.841000', 1, '2021-06-22 11:22:25.868000', 1, '2021-06-22 11:22:25.868000', 0, b'0', 10011);
INSERT INTO `pc_wechat_payment` VALUES (1407179785276387328, 1407179640077971456, 1, 1001, '1407179640077971456', 0.01, NULL, '6', '2021-06-22 11:32:59.583000', 1, '2021-06-22 11:32:59.603000', 1, '2021-06-22 11:32:59.603000', 0, b'0', 10011);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('quartzScheduler', 'xxm1638448483700', 1638451157328, 10000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sc_activity
-- ----------------------------
DROP TABLE IF EXISTS `sc_activity`;
CREATE TABLE `sc_activity`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'name',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `strategy_id` bigint(255) NULL DEFAULT NULL COMMENT '策略id',
  `strategy_register_id` bigint(20) NOT NULL COMMENT '策略注册id',
  `activity_mutual` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '活动互斥',
  `start_time` datetime(6) NOT NULL COMMENT '有效开始时间',
  `end_time` datetime(6) NOT NULL COMMENT '有效结束时间',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠活动' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sc_activity
-- ----------------------------
INSERT INTO `sc_activity` VALUES (1394892920481533952, '100-16', '100-16活动策略2', NULL, 1394892919403597824, '', '2021-05-18 17:43:59.000000', '2021-07-01 17:44:02.000000', 1, '2021-05-19 13:49:22.757000', 1, '2021-05-19 13:49:22.757000', 0, b'0');
INSERT INTO `sc_activity` VALUES (1394918400265965568, '100-5', '100-5活动策略3', NULL, 1394918398827319296, '', '2021-05-18 17:43:59.000000', '2021-07-01 17:44:02.000000', 1, '2021-05-19 15:30:37.611000', 1, '2021-05-19 15:30:37.611000', 0, b'0');
INSERT INTO `sc_activity` VALUES (1395308738893729792, '50-20', '50-20活动策略3', 1382517531398524928, 1395308573587820544, '', '2021-05-18 17:43:59.000000', '2021-07-01 17:44:02.000000', 1, '2021-05-20 17:21:41.592000', 1, '2021-05-20 17:21:41.592000', 0, b'0');

-- ----------------------------
-- Table structure for sc_check_rule
-- ----------------------------
DROP TABLE IF EXISTS `sc_check_rule`;
CREATE TABLE `sc_check_rule`  (
  `id` bigint(20) NOT NULL,
  `strategy_register_id` bigint(20) NOT NULL COMMENT '关联策略注册id',
  `register_type` int(6) NOT NULL COMMENT '策略类型 策略/优惠券',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则code',
  `rule_type` int(11) NOT NULL COMMENT '规则类型',
  `strategy_id` bigint(20) NULL DEFAULT NULL COMMENT '对应策略id',
  `addition` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '附加对象 json',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '检查规则' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sc_check_rule
-- ----------------------------
INSERT INTO `sc_check_rule` VALUES (1394918398978314240, 1394918398827319296, 1, '渠道检查', 'activityCheckChannel', 1, 1394909889247203328, '1,2,3', 0, 1, '2021-05-19 15:30:37.304000', 1, '2021-05-19 15:30:37.304000', 0, b'0');
INSERT INTO `sc_check_rule` VALUES (1394918398978314241, 1394892919403597824, 1, '渠道检查', 'activityCheckChannel', 1, 1394909889247203328, '2,3,4', 0, 1, '2021-05-19 15:30:37.304000', 1, '2021-05-19 15:30:37.304000', 0, b'0');
INSERT INTO `sc_check_rule` VALUES (1395284918434680833, 1395284918430486528, 2, '渠道检查', 'couponCheckChannel', 2, 1394909889247203328, '1,2,3', 0, 1, '2021-05-20 15:47:02.352000', 1, '2021-05-20 15:47:02.352000', 0, b'0');
INSERT INTO `sc_check_rule` VALUES (1395308737580912640, 1395308573587820544, 1, '渠道检查', 'activityCheckChannel', 1, 1394909889247203328, '1,2,3', 0, 1, '2021-05-20 17:21:41.279000', 1, '2021-05-20 17:21:41.279000', 0, b'0');
INSERT INTO `sc_check_rule` VALUES (1395320422999937024, 1395320422941216768, 2, '渠道检查', 'couponCheckChannel', 2, 1394909889247203328, '1,2,3', 0, 1, '2021-05-20 18:08:07.300000', 1, '2021-05-20 18:08:07.300000', 0, b'0');
INSERT INTO `sc_check_rule` VALUES (1395320423004131328, 1395320422941216768, 2, '多张领取检查', 'obtainMultiple', 3, 1395320340615417856, '', 0, 1, '2021-05-20 18:08:07.301000', 1, '2021-05-20 18:08:07.301000', 0, b'0');

-- ----------------------------
-- Table structure for sc_coupon
-- ----------------------------
DROP TABLE IF EXISTS `sc_coupon`;
CREATE TABLE `sc_coupon`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `template_id` bigint(20) NULL DEFAULT NULL COMMENT '模板id',
  `strategy_register_id` bigint(20) NULL DEFAULT NULL COMMENT '策略注册id',
  `start_time` datetime(6) NULL DEFAULT NULL COMMENT '有效开始时间',
  `end_time` datetime(6) NULL DEFAULT NULL COMMENT '有效结束时间',
  `status` int(6) NOT NULL COMMENT '状态',
  `obtain_time` datetime(6) NULL DEFAULT NULL COMMENT '领取时间',
  `used_time` datetime(6) NULL DEFAULT NULL COMMENT '使用时间',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '所用订单Id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `creator` bigint(20) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKi3jmbif27olgivb918r8jbv9j`(`template_id`) USING BTREE,
  CONSTRAINT `sc_coupon_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `sc_coupon_template` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠券' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sc_coupon
-- ----------------------------
INSERT INTO `sc_coupon` VALUES (1395287722087829504, '100-33', NULL, 1395284918623424512, 1395284918430486528, '2021-05-19 16:00:08.000000', '2021-12-20 16:00:11.000000', 1, '2021-05-20 15:58:10.784000', NULL, NULL, 1001, 1, 1, '2021-05-20 15:58:10.795000', '2021-05-20 15:58:10.795000', 0, b'0');
INSERT INTO `sc_coupon` VALUES (1395320636309655552, '100-33', NULL, 1395320423364841472, 1395320422941216768, '2021-05-19 16:00:08.000000', '2021-12-20 16:00:11.000000', 1, '2021-05-20 18:08:58.150000', NULL, NULL, 1001, 1, 1, '2021-05-20 18:08:58.157000', '2021-05-20 18:08:58.157000', 0, b'0');
INSERT INTO `sc_coupon` VALUES (1395320641196019712, '100-33', NULL, 1395320423364841472, 1395320422941216768, '2021-05-19 16:00:08.000000', '2021-12-20 16:00:11.000000', 1, '2021-05-20 18:08:59.321000', NULL, NULL, 1001, 1, 1, '2021-05-20 18:08:59.322000', '2021-05-20 18:08:59.322000', 0, b'0');
INSERT INTO `sc_coupon` VALUES (1395320646048829440, '100-33', NULL, 1395320423364841472, 1395320422941216768, '2021-05-19 16:00:08.000000', '2021-12-20 16:00:11.000000', 1, '2021-05-20 18:09:00.478000', NULL, NULL, 1001, 1, 1, '2021-05-20 18:09:00.479000', '2021-05-20 18:09:00.479000', 0, b'0');
INSERT INTO `sc_coupon` VALUES (1395321121078923264, '100-33', NULL, 1395320423364841472, 1395320422941216768, '2021-05-19 16:00:08.000000', '2021-12-20 16:00:11.000000', 1, '2021-05-20 18:10:53.734000', NULL, NULL, 1001, 1, 1, '2021-05-20 18:10:53.735000', '2021-05-20 18:10:53.735000', 0, b'0');
INSERT INTO `sc_coupon` VALUES (1395321173243482112, '100-33', NULL, 1395320423364841472, 1395320422941216768, '2021-05-19 16:00:08.000000', '2021-12-20 16:00:11.000000', 1, '2021-05-20 18:11:06.171000', NULL, NULL, 1001, 1, 1, '2021-05-20 18:11:06.172000', '2021-05-20 18:11:06.172000', 0, b'0');
INSERT INTO `sc_coupon` VALUES (1395321340222918656, '100-33', NULL, 1395320423364841472, 1395320422941216768, '2021-05-19 16:00:08.000000', '2021-12-20 16:00:11.000000', 1, '2021-05-20 18:11:45.983000', NULL, NULL, 1001, 1, 1, '2021-05-20 18:11:45.983000', '2021-05-20 18:11:45.983000', 0, b'0');
INSERT INTO `sc_coupon` VALUES (1395321629176909824, '100-33', NULL, 1395320423364841472, 1395320422941216768, '2021-05-19 16:00:08.000000', '2021-12-20 16:00:11.000000', 1, '2021-05-20 18:12:54.874000', NULL, NULL, 1001, 1, 1, '2021-05-20 18:12:54.875000', '2021-05-20 18:12:54.875000', 0, b'0');
INSERT INTO `sc_coupon` VALUES (1395324987962970112, '100-33', NULL, 1395320423364841472, 1395320422941216768, '2021-05-19 16:00:08.000000', '2021-12-20 16:00:11.000000', 1, '2021-05-20 18:26:15.648000', NULL, NULL, 1001, 1, 1, '2021-05-20 18:26:15.659000', '2021-05-20 18:26:15.659000', 0, b'0');
INSERT INTO `sc_coupon` VALUES (1395325096905822208, '100-33', NULL, 1395320423364841472, 1395320422941216768, '2021-05-19 16:00:08.000000', '2021-12-20 16:00:11.000000', 1, '2021-05-20 18:26:41.646000', NULL, NULL, 1001, 1, 1, '2021-05-20 18:26:41.646000', '2021-05-20 18:26:41.646000', 0, b'0');
INSERT INTO `sc_coupon` VALUES (1395325325373755392, '100-33', NULL, 1395320423364841472, 1395320422941216768, '2021-05-19 16:00:08.000000', '2021-12-20 16:00:11.000000', 1, '2021-05-20 18:27:36.117000', NULL, NULL, 1001, 1, 1, '2021-05-20 18:27:36.117000', '2021-05-20 18:27:36.117000', 0, b'0');
INSERT INTO `sc_coupon` VALUES (1395325385100644352, '100-33', NULL, 1395320423364841472, 1395320422941216768, '2021-05-19 16:00:08.000000', '2021-12-20 16:00:11.000000', 1, '2021-05-20 18:27:50.356000', NULL, NULL, 1001, 1, 1, '2021-05-20 18:27:50.357000', '2021-05-20 18:27:50.357000', 0, b'0');
INSERT INTO `sc_coupon` VALUES (1395325567074717696, '100-33', NULL, 1395320423364841472, 1395320422941216768, '2021-05-19 16:00:08.000000', '2021-12-20 16:00:11.000000', 1, '2021-05-20 18:28:33.742000', NULL, NULL, 1001, 1, 1, '2021-05-20 18:28:33.743000', '2021-05-20 18:28:33.743000', 0, b'0');

-- ----------------------------
-- Table structure for sc_coupon_template
-- ----------------------------
DROP TABLE IF EXISTS `sc_coupon_template`;
CREATE TABLE `sc_coupon_template`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `strategy_register_id` bigint(20) NOT NULL COMMENT '策略注册id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `num` int(11) NOT NULL COMMENT '数量',
  `channel_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道',
  `activity_mutual` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动互斥',
  `coupon_mutual` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠券互斥',
  `effective_type` int(8) NOT NULL COMMENT '有效类型',
  `time_type` int(8) NULL DEFAULT NULL COMMENT '时间类型',
  `effective_time` bigint(20) NULL DEFAULT NULL COMMENT '有效时间',
  `start_time` datetime(6) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(6) NULL DEFAULT NULL COMMENT '结束时间',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠券模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sc_coupon_template
-- ----------------------------
INSERT INTO `sc_coupon_template` VALUES (1395284918623424512, '100-33', 1395284918430486528, '100-33优惠券', 999, NULL, '', '', 0, 1, NULL, NULL, NULL, 1, '2021-05-20 15:47:02.397000', 1, '2021-05-20 15:58:10.795000', 1, b'0');
INSERT INTO `sc_coupon_template` VALUES (1395320423364841472, '100-33', 1395320422941216768, '100-33优惠券', 988, NULL, '', '', 0, 1, NULL, NULL, NULL, 1, '2021-05-20 18:08:07.387000', 1, '2021-05-20 18:28:33.743000', 12, b'0');

-- ----------------------------
-- Table structure for sc_match_rule
-- ----------------------------
DROP TABLE IF EXISTS `sc_match_rule`;
CREATE TABLE `sc_match_rule`  (
  `id` bigint(20) NOT NULL,
  `strategy_register_id` bigint(20) NOT NULL COMMENT '关联策略注册id',
  `register_type` int(6) NOT NULL COMMENT '策略类型 策略/优惠券',
  `feature_type` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '特征类型(sku/spu/shop)',
  `feature_point` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '特征点',
  `match_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '匹配类型',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '匹配检查' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sc_match_rule
-- ----------------------------
INSERT INTO `sc_match_rule` VALUES (1394892919483289600, 1394892919403597824, 1, 'skuId', '1001', 'ne', 1, '2021-05-19 13:49:22.519000', 1, '2021-05-19 13:49:22.519000', 0, b'0');
INSERT INTO `sc_match_rule` VALUES (1394892919483289601, 1394892919403597824, 1, 'goods', '2001', 'eq', 1, '2021-05-19 13:49:22.519000', 1, '2021-05-19 13:49:22.519000', 0, b'0');
INSERT INTO `sc_match_rule` VALUES (1394918398940565504, 1394918398827319296, 1, 'skuId', '1001', 'ne', 1, '2021-05-19 15:30:37.295000', 1, '2021-05-19 15:30:37.295000', 0, b'0');
INSERT INTO `sc_match_rule` VALUES (1394918398944759808, 1394918398827319296, 1, 'goods', '2001', 'eq', 1, '2021-05-19 15:30:37.296000', 1, '2021-05-19 15:30:37.296000', 0, b'0');
INSERT INTO `sc_match_rule` VALUES (1395284918434680832, 1395284918430486528, 2, 'goodsId', '2001', 'eq', 1, '2021-05-20 15:47:02.352000', 1, '2021-05-20 15:47:02.352000', 0, b'0');
INSERT INTO `sc_match_rule` VALUES (1395308573713649664, 1395308573587820544, 1, 'skuId', '1002', 'eq', 1, '2021-05-20 17:21:02.209000', 1, '2021-05-20 17:21:02.209000', 0, b'0');
INSERT INTO `sc_match_rule` VALUES (1395320422966382592, 1395320422941216768, 2, 'goodsId', '2001', 'eq', 1, '2021-05-20 18:08:07.292000', 1, '2021-05-20 18:08:07.292000', 0, b'0');

-- ----------------------------
-- Table structure for sc_strategy
-- ----------------------------
DROP TABLE IF EXISTS `sc_strategy`;
CREATE TABLE `sc_strategy`  (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `engine_type` int(1) NOT NULL COMMENT '引擎类型, java/js/groovy',
  `target_type` int(11) NOT NULL COMMENT '目标类型',
  `rule_script` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '规则脚本',
  `show` int(1) NULL DEFAULT NULL COMMENT '是否展示 0不展示，1展示(default)',
  `state` int(1) NOT NULL COMMENT '0 可用 1 不可用',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `tid` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '策略' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sc_strategy
-- ----------------------------
INSERT INTO `sc_strategy` VALUES (1382516141636866048, 'instantReduction', '立减策略', '立减指定的金额', 1, 1, NULL, 1, 1, 1, '2021-04-15 10:08:28.720000', 1, '2021-04-15 10:08:28.720000', 0, b'0', 10011);
INSERT INTO `sc_strategy` VALUES (1382517531398524928, 'fullReduction', '满减策略', '满减策略', 1, 1, NULL, 1, 1, 1, '2021-04-15 10:14:00.075000', 1, '2021-04-15 10:14:00.075000', 0, b'0', 10011);
INSERT INTO `sc_strategy` VALUES (1394909889247203328, 'channelCheck', '渠道检查', '渠道检查', 1, 2, NULL, 1, 1, 1, '2021-05-19 14:56:48.426000', 1, '2021-05-19 14:56:48.426000', 0, b'0', 10011);
INSERT INTO `sc_strategy` VALUES (1395320340615417856, 'obtainMultiple', '多张领取检查', '多张领取检查', 1, 3, '', NULL, 1, 1, '2021-05-20 18:07:47.642000', 1, '2021-05-20 18:07:47.642000', 0, b'0', 10011);

-- ----------------------------
-- Table structure for sc_strategy_check_rule
-- ----------------------------
DROP TABLE IF EXISTS `sc_strategy_check_rule`;
CREATE TABLE `sc_strategy_check_rule`  (
  `id` bigint(20) NOT NULL,
  `register_id` bigint(20) NULL DEFAULT NULL COMMENT '模板id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则code',
  `type` int(11) NOT NULL COMMENT '类型',
  `addition` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附加参数 json',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '策略规则检查' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sc_strategy_check_rule
-- ----------------------------

-- ----------------------------
-- Table structure for sc_strategy_config
-- ----------------------------
DROP TABLE IF EXISTS `sc_strategy_config`;
CREATE TABLE `sc_strategy_config`  (
  `id` bigint(20) NOT NULL,
  `strategy_id` bigint(20) NULL DEFAULT NULL COMMENT '策略id',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数类型',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法参数名',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '策略参数定义' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sc_strategy_config
-- ----------------------------
INSERT INTO `sc_strategy_config` VALUES (1382517531788595199, 1382516141636866048, 'BigDecimal', 'amount', '立减金额', '立减金额', 1, '2021-04-15 10:08:28.873000', 1, '2021-04-15 10:08:28.873000', 0, b'0');
INSERT INTO `sc_strategy_config` VALUES (1382517531788595200, 1382517531398524928, 'BigDecimal', 'satisfy', '满多少', '配置满多少的字段', 1, '2021-04-15 10:14:00.169000', 1, '2021-04-15 10:14:00.169000', 0, b'0');
INSERT INTO `sc_strategy_config` VALUES (1382517531788595201, 1382517531398524928, 'BigDecimal', 'minus', '减多少', '配置减多少的字段', 1, '2021-04-15 10:14:00.169000', 1, '2021-04-15 10:14:00.169000', 0, b'0');

-- ----------------------------
-- Table structure for sc_strategy_config_value
-- ----------------------------
DROP TABLE IF EXISTS `sc_strategy_config_value`;
CREATE TABLE `sc_strategy_config_value`  (
  `id` bigint(20) NOT NULL,
  `strategy_id` bigint(20) NULL DEFAULT NULL COMMENT '策略id',
  `strategy_register_id` bigint(20) NULL DEFAULT NULL COMMENT '策略注册id',
  `strategy_config_id` bigint(20) NULL DEFAULT NULL COMMENT '策略定义id',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '策略参数key',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数值',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8h3jh6yj9o9bgb0gd2noht1mw`(`strategy_config_id`) USING BTREE,
  CONSTRAINT `sc_strategy_config_value_ibfk_1` FOREIGN KEY (`strategy_config_id`) REFERENCES `sc_strategy_config` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '策略配置参数' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sc_strategy_config_value
-- ----------------------------
INSERT INTO `sc_strategy_config_value` VALUES (1394892919680421888, 1382517531398524928, 1394892919403597824, 1382517531788595200, 'satisfy', '100', 1, '2021-05-19 13:49:22.566000', 1, '2021-05-19 13:49:22.566000', 0, b'0');
INSERT INTO `sc_strategy_config_value` VALUES (1394892919684616192, 1382517531398524928, 1394892919403597824, 1382517531788595201, 'minus', '16', 1, '2021-05-19 13:49:22.567000', 1, '2021-05-19 13:49:22.567000', 0, b'0');
INSERT INTO `sc_strategy_config_value` VALUES (1394918399292887040, 1382517531398524928, 1394918398827319296, 1382517531788595200, 'satisfy', '100', 1, '2021-05-19 15:30:37.379000', 1, '2021-05-19 15:30:37.379000', 0, b'0');
INSERT INTO `sc_strategy_config_value` VALUES (1394918399297081344, 1382517531398524928, 1394918398827319296, 1382517531788595201, 'minus', '5', 1, '2021-05-19 15:30:37.380000', 1, '2021-05-19 15:30:37.380000', 0, b'0');
INSERT INTO `sc_strategy_config_value` VALUES (1395284918615035904, 1382517531398524928, 1395284918430486528, 1382517531788595200, 'satisfy', '100', 1, '2021-05-20 15:47:02.395000', 1, '2021-05-20 15:47:02.395000', 0, b'0');
INSERT INTO `sc_strategy_config_value` VALUES (1395284918619230208, 1382517531398524928, 1395284918430486528, 1382517531788595201, 'minus', '33', 1, '2021-05-20 15:47:02.395000', 1, '2021-05-20 15:47:02.395000', 0, b'0');
INSERT INTO `sc_strategy_config_value` VALUES (1395308737903874048, 1382517531398524928, 1395308573587820544, 1382517531788595200, 'satisfy', '50', 1, '2021-05-20 17:21:41.356000', 1, '2021-05-20 17:21:41.356000', 0, b'0');
INSERT INTO `sc_strategy_config_value` VALUES (1395308737903874049, 1382517531398524928, 1395308573587820544, 1382517531788595201, 'minus', '20', 1, '2021-05-20 17:21:41.356000', 1, '2021-05-20 17:21:41.356000', 0, b'0');
INSERT INTO `sc_strategy_config_value` VALUES (1395320423310315520, 1382517531398524928, 1395320422941216768, 1382517531788595200, 'satisfy', '100', 1, '2021-05-20 18:08:07.374000', 1, '2021-05-20 18:08:07.374000', 0, b'0');
INSERT INTO `sc_strategy_config_value` VALUES (1395320423310315521, 1382517531398524928, 1395320422941216768, 1382517531788595201, 'minus', '33', 1, '2021-05-20 18:08:07.374000', 1, '2021-05-20 18:08:07.374000', 0, b'0');

-- ----------------------------
-- Table structure for sc_strategy_register
-- ----------------------------
DROP TABLE IF EXISTS `sc_strategy_register`;
CREATE TABLE `sc_strategy_register`  (
  `id` bigint(20) NOT NULL,
  `strategy_id` bigint(20) NULL DEFAULT NULL COMMENT '策略id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '策略注册名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `strategy_type` int(11) NULL DEFAULT NULL COMMENT '策略类型(1活动/2优惠券)',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK44aox50070g4wqwabx7l75twv`(`strategy_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '策略注册' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sc_strategy_register
-- ----------------------------
INSERT INTO `sc_strategy_register` VALUES (1394892919403597824, 1382517531398524928, '100-16', '100-16活动策略2', 1, 1, '2021-05-19 13:49:22.499000', 1, '2021-05-19 13:49:22.499000', 0, b'0');
INSERT INTO `sc_strategy_register` VALUES (1394918398827319296, 1382517531398524928, '100-5', '100-5活动策略3', 1, 1, '2021-05-19 15:30:37.254000', 1, '2021-05-19 15:30:37.254000', 0, b'0');
INSERT INTO `sc_strategy_register` VALUES (1395284918430486528, 1382517531398524928, '100-33', '100-33优惠券', 2, 1, '2021-05-20 15:47:02.351000', 1, '2021-05-20 15:47:02.351000', 0, b'0');
INSERT INTO `sc_strategy_register` VALUES (1395308573587820544, 1382517531398524928, '50-20', '50-20活动策略3', 1, 1, '2021-05-20 17:21:02.166000', 1, '2021-05-20 17:21:02.166000', 0, b'0');
INSERT INTO `sc_strategy_register` VALUES (1395320422941216768, 1382517531398524928, '100-33', '100-33优惠券', 2, 1, '2021-05-20 18:08:07.285000', 1, '2021-05-20 18:08:07.285000', 0, b'0');

-- ----------------------------
-- Table structure for starter_data_version
-- ----------------------------
DROP TABLE IF EXISTS `starter_data_version`;
CREATE TABLE `starter_data_version`  (
  `id` bigint(20) NOT NULL,
  `data_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据名称',
  `data_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据主键',
  `data_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数据内容',
  `version` int(10) NOT NULL COMMENT '版本',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据版本日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of starter_data_version
-- ----------------------------
INSERT INTO `starter_data_version` VALUES (1480550993828446208, 'client', '1', '{\"dataName\":\"client\",\"dataId\":\"1\",\"dataContent\":{\"id\":\"1\",\"creator\":null,\"createTime\":\"2022-01-10 22:43:58\",\"lastModifier\":null,\"lastModifiedTime\":null,\"deleted\":false,\"version\":0,\"code\":null,\"name\":null,\"timeout\":null,\"captcha\":false,\"enable\":false,\"description\":null}}', 1, 0, '2022-01-10 22:43:59');
INSERT INTO `starter_data_version` VALUES (1480551021779288064, 'client', '1', '{\"dataName\":\"client\",\"dataId\":\"1\",\"dataContent\":{\"id\":\"1\",\"creator\":null,\"createTime\":\"2022-01-10 22:44:05\",\"lastModifier\":null,\"lastModifiedTime\":null,\"deleted\":false,\"version\":0,\"code\":null,\"name\":null,\"timeout\":null,\"captcha\":false,\"enable\":false,\"description\":null}}', 2, 0, '2022-01-10 22:44:06');

-- ----------------------------
-- Table structure for starter_login_log
-- ----------------------------
DROP TABLE IF EXISTS `starter_login_log`;
CREATE TABLE `starter_login_log`  (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(11) NULL DEFAULT NULL COMMENT '用户id',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `login` bit(1) NULL DEFAULT NULL COMMENT '登录成功状态',
  `client` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端',
  `ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录IP地址',
  `login_location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录地点',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器类型',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登陆日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of starter_login_log
-- ----------------------------
INSERT INTO `starter_login_log` VALUES (1426020859223609345, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Unknown', 'Unknown', NULL, '2021-08-13 11:20:42');
INSERT INTO `starter_login_log` VALUES (1426067895490908162, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Unknown', 'Unknown', NULL, '2021-08-13 14:27:36');
INSERT INTO `starter_login_log` VALUES (1428695413916880896, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-20 20:28:24');
INSERT INTO `starter_login_log` VALUES (1428695469420105728, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-20 20:28:38');
INSERT INTO `starter_login_log` VALUES (1428695476588171264, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-20 20:28:40');
INSERT INTO `starter_login_log` VALUES (1428695507739267072, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-20 20:28:48');
INSERT INTO `starter_login_log` VALUES (1428695542044479488, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-20 20:28:56');
INSERT INTO `starter_login_log` VALUES (1428695871993597952, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-20 20:30:14');
INSERT INTO `starter_login_log` VALUES (1428695889454485504, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-20 20:30:19');
INSERT INTO `starter_login_log` VALUES (1428695914511257600, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-20 20:30:25');
INSERT INTO `starter_login_log` VALUES (1428695931032621056, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-20 20:30:28');
INSERT INTO `starter_login_log` VALUES (1428696374039203840, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-20 20:32:14');
INSERT INTO `starter_login_log` VALUES (1428697866775220224, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-20 20:38:10');
INSERT INTO `starter_login_log` VALUES (1428698156517740544, 1414143554414059520, 'xxm1995', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-20 20:39:19');
INSERT INTO `starter_login_log` VALUES (1428698501088202752, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-20 20:40:41');
INSERT INTO `starter_login_log` VALUES (1428699094733213696, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-20 20:43:03');
INSERT INTO `starter_login_log` VALUES (1428699225113153536, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-20 20:43:34');
INSERT INTO `starter_login_log` VALUES (1429677334957617152, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-23 13:30:12');
INSERT INTO `starter_login_log` VALUES (1430005489618624512, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-24 11:14:09');
INSERT INTO `starter_login_log` VALUES (1430005489618624513, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-24 11:14:09');
INSERT INTO `starter_login_log` VALUES (1430005489618624514, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-24 11:14:09');
INSERT INTO `starter_login_log` VALUES (1430005504470654976, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-24 11:14:15');
INSERT INTO `starter_login_log` VALUES (1430382807067131904, 1414143554414059520, 'xxm1995', b'1', NULL, '112.229.15.52', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-25 12:13:31');
INSERT INTO `starter_login_log` VALUES (1430383084373540864, 1414143554414059520, 'xxm1995', b'1', NULL, '112.229.15.52', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-25 12:14:37');
INSERT INTO `starter_login_log` VALUES (1430430125594472448, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-25 15:21:33');
INSERT INTO `starter_login_log` VALUES (1430430346676236288, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-25 15:22:25');
INSERT INTO `starter_login_log` VALUES (1430447060830863360, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-25 16:28:49');
INSERT INTO `starter_login_log` VALUES (1430475863388987392, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-25 18:23:16');
INSERT INTO `starter_login_log` VALUES (1430514792519434240, 1414143554414059520, 'xxm1995', b'1', NULL, '39.71.186.239', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-08-25 20:57:59');
INSERT INTO `starter_login_log` VALUES (1430514912933707776, 1414143554414059520, 'xxm1995', b'1', NULL, '39.71.186.239', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-08-25 20:58:28');
INSERT INTO `starter_login_log` VALUES (1430519009233600512, 1414143554414059520, 'xxm1995', b'1', NULL, '39.71.186.239', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-25 21:14:44');
INSERT INTO `starter_login_log` VALUES (1430519230578520064, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-25 21:15:36');
INSERT INTO `starter_login_log` VALUES (1430521606543769600, 1414143554414059520, 'xxm1995', b'1', NULL, '39.71.186.239', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-25 21:25:03');
INSERT INTO `starter_login_log` VALUES (1430524587166101504, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-25 21:36:54');
INSERT INTO `starter_login_log` VALUES (1430525243260100608, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-25 21:39:30');
INSERT INTO `starter_login_log` VALUES (1430562174618542080, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-26 00:06:15');
INSERT INTO `starter_login_log` VALUES (1430748912608841728, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-26 12:28:16');
INSERT INTO `starter_login_log` VALUES (1430808105277685760, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-26 16:23:28');
INSERT INTO `starter_login_log` VALUES (1430903497103986688, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-26 22:42:32');
INSERT INTO `starter_login_log` VALUES (1430903569719971840, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-26 22:42:51');
INSERT INTO `starter_login_log` VALUES (1431071535330983936, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-27 09:50:15');
INSERT INTO `starter_login_log` VALUES (1431071689643622400, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-27 09:50:53');
INSERT INTO `starter_login_log` VALUES (1431071752331689984, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-27 09:51:08');
INSERT INTO `starter_login_log` VALUES (1431071840470794240, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-27 09:51:29');
INSERT INTO `starter_login_log` VALUES (1431072076727549952, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-27 09:52:26');
INSERT INTO `starter_login_log` VALUES (1431072726337159168, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-27 09:55:01');
INSERT INTO `starter_login_log` VALUES (1431072795111161856, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-27 09:55:17');
INSERT INTO `starter_login_log` VALUES (1431074136789319680, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-27 10:00:37');
INSERT INTO `starter_login_log` VALUES (1431074180431052800, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-27 10:00:47');
INSERT INTO `starter_login_log` VALUES (1431074292905508864, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-27 10:01:14');
INSERT INTO `starter_login_log` VALUES (1431106775315120128, 1414143554414059520, 'xxm1995', b'1', NULL, '112.229.15.52', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-27 12:10:19');
INSERT INTO `starter_login_log` VALUES (1431138624444006400, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-27 14:16:52');
INSERT INTO `starter_login_log` VALUES (1431138701258489856, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-27 14:17:10');
INSERT INTO `starter_login_log` VALUES (1431151307780227072, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-27 15:07:16');
INSERT INTO `starter_login_log` VALUES (1431161219725656064, 1414143554414059520, 'xxm1995', b'1', NULL, '124.128.8.219', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-08-27 15:46:39');
INSERT INTO `starter_login_log` VALUES (1431161432091656192, 1414143554414059520, 'xxm1995', b'1', NULL, '112.229.15.52', NULL, 'Mac OS X (iPhone)', 'Apple WebKit', NULL, '2021-08-27 15:47:30');
INSERT INTO `starter_login_log` VALUES (1431162570388250624, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-27 15:51:59');
INSERT INTO `starter_login_log` VALUES (1431260348845916160, 1414143554414059520, 'xxm1995', b'1', NULL, '39.71.186.239', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-27 22:20:33');
INSERT INTO `starter_login_log` VALUES (1431504261691211776, 1414143554414059520, 'xxm1995', b'1', NULL, '39.71.127.20', NULL, 'Mac OS X', 'Safari 10', NULL, '2021-08-28 14:29:47');
INSERT INTO `starter_login_log` VALUES (1432599703833280512, 1414143554414059520, 'xxm1995', b'1', NULL, '123.168.251.219', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-08-31 15:02:40');
INSERT INTO `starter_login_log` VALUES (1432599725966622720, 1414143554414059520, 'xxm1995', b'1', NULL, '221.216.140.122', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-08-31 15:02:46');
INSERT INTO `starter_login_log` VALUES (1432599777015496704, 1414143554414059520, 'xxm1995', b'1', NULL, '114.247.188.88', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-08-31 15:02:58');
INSERT INTO `starter_login_log` VALUES (1432600014987722752, 1414143554414059520, 'xxm1995', b'1', NULL, '122.4.205.228', NULL, 'Mac OS X', 'Chrome 9', NULL, '2021-08-31 15:03:55');
INSERT INTO `starter_login_log` VALUES (1432600507189297152, 1414143554414059520, 'xxm1995', b'1', NULL, '223.71.175.94', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-08-31 15:05:52');
INSERT INTO `starter_login_log` VALUES (1432674364671655936, 1414143554414059520, 'xxm1995', b'1', NULL, '60.208.80.101', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-08-31 19:59:21');
INSERT INTO `starter_login_log` VALUES (1432872704407502848, 1414143554414059520, 'xxm1995', b'1', NULL, '123.168.251.219', NULL, 'Windows 7', 'Chrome 8', NULL, '2021-09-01 09:07:29');
INSERT INTO `starter_login_log` VALUES (1434824102060679168, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-06 18:21:37');
INSERT INTO `starter_login_log` VALUES (1434824154086825984, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-06 18:21:51');
INSERT INTO `starter_login_log` VALUES (1434825276520325120, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-06 18:26:17');
INSERT INTO `starter_login_log` VALUES (1434857763128664064, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-06 20:35:22');
INSERT INTO `starter_login_log` VALUES (1435061672524095488, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 10:05:38');
INSERT INTO `starter_login_log` VALUES (1435062113446109184, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 10:07:25');
INSERT INTO `starter_login_log` VALUES (1435062287438422016, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 10:08:06');
INSERT INTO `starter_login_log` VALUES (1435063408928202752, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 10:12:34');
INSERT INTO `starter_login_log` VALUES (1435063440083492864, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 10:12:41');
INSERT INTO `starter_login_log` VALUES (1435065340384223232, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-09-07 10:20:14');
INSERT INTO `starter_login_log` VALUES (1435070254355054592, 1414143554414059520, 'xxm1995', b'1', NULL, '112.232.231.211', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 10:39:46');
INSERT INTO `starter_login_log` VALUES (1435098415755403264, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 12:31:40');
INSERT INTO `starter_login_log` VALUES (1435098415872843776, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 12:31:40');
INSERT INTO `starter_login_log` VALUES (1435098415877038080, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 12:31:40');
INSERT INTO `starter_login_log` VALUES (1435098416015450112, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 12:31:40');
INSERT INTO `starter_login_log` VALUES (1435098416602652672, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 12:31:40');
INSERT INTO `starter_login_log` VALUES (1435124319802073088, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 14:14:36');
INSERT INTO `starter_login_log` VALUES (1435136953146384384, NULL, '123', b'0', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '短信验证码不正确', '2021-09-07 15:04:48');
INSERT INTO `starter_login_log` VALUES (1435136972461154304, NULL, '123', b'0', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '短信验证码不正确', '2021-09-07 15:04:52');
INSERT INTO `starter_login_log` VALUES (1435137003935211520, NULL, '123', b'0', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '短信验证码不正确', '2021-09-07 15:05:00');
INSERT INTO `starter_login_log` VALUES (1435137349839462400, NULL, '3', b'0', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '短信验证码不正确', '2021-09-07 15:06:22');
INSERT INTO `starter_login_log` VALUES (1435137370207002624, NULL, '3', b'0', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '短信验证码不正确', '2021-09-07 15:06:27');
INSERT INTO `starter_login_log` VALUES (1435137372887162880, NULL, '3', b'0', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '短信验证码不正确', '2021-09-07 15:06:28');
INSERT INTO `starter_login_log` VALUES (1435137374845902848, NULL, '3', b'0', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '短信验证码不正确', '2021-09-07 15:06:28');
INSERT INTO `starter_login_log` VALUES (1435137970378350592, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 15:08:50');
INSERT INTO `starter_login_log` VALUES (1435138774476759040, NULL, '17051008321', b'0', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '短信验证码不正确', '2021-09-07 15:12:02');
INSERT INTO `starter_login_log` VALUES (1435139475315597312, 1399985191002447872, 'xxm', b'1', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 15:14:49');
INSERT INTO `starter_login_log` VALUES (1435160158070337536, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 16:36:58');
INSERT INTO `starter_login_log` VALUES (1435160261359267840, 1399985191002447872, 'xxm', b'1', 'phone', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 16:37:25');
INSERT INTO `starter_login_log` VALUES (1435177539521871872, NULL, 'admin', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '用户未找到异常', '2021-09-07 17:46:02');
INSERT INTO `starter_login_log` VALUES (1435177568189939712, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 17:46:11');
INSERT INTO `starter_login_log` VALUES (1435180196500209664, NULL, '2', b'0', 'phone', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '手机号不存在', '2021-09-07 17:56:38');
INSERT INTO `starter_login_log` VALUES (1435180215030644736, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 17:56:42');
INSERT INTO `starter_login_log` VALUES (1435185921028915200, 1399985191002447872, 'xxm', b'1', 'phone', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 18:19:23');
INSERT INTO `starter_login_log` VALUES (1435187707529789440, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 18:26:29');
INSERT INTO `starter_login_log` VALUES (1435245330219089920, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 22:15:26');
INSERT INTO `starter_login_log` VALUES (1435259080523354112, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 23:10:04');
INSERT INTO `starter_login_log` VALUES (1435259233745473536, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 23:10:42');
INSERT INTO `starter_login_log` VALUES (1435260069678649344, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 23:14:01');
INSERT INTO `starter_login_log` VALUES (1435268736809390080, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 23:48:26');
INSERT INTO `starter_login_log` VALUES (1435268757860601856, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '验证码不正确', '2021-09-07 23:48:33');
INSERT INTO `starter_login_log` VALUES (1435268765955608576, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '验证码不正确', '2021-09-07 23:48:34');
INSERT INTO `starter_login_log` VALUES (1435268770695172096, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '验证码不正确', '2021-09-07 23:48:36');
INSERT INTO `starter_login_log` VALUES (1435268851573936128, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '验证码不正确', '2021-09-07 23:48:55');
INSERT INTO `starter_login_log` VALUES (1435268863846469632, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '验证码不正确', '2021-09-07 23:48:58');
INSERT INTO `starter_login_log` VALUES (1435269049775771648, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '验证码不正确', '2021-09-07 23:49:42');
INSERT INTO `starter_login_log` VALUES (1435269055207395328, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '验证码不正确', '2021-09-07 23:49:43');
INSERT INTO `starter_login_log` VALUES (1435269058143408128, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '验证码不正确', '2021-09-07 23:49:44');
INSERT INTO `starter_login_log` VALUES (1435269083275677696, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 23:49:50');
INSERT INTO `starter_login_log` VALUES (1435269433604919296, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 23:51:14');
INSERT INTO `starter_login_log` VALUES (1435269728724537344, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 23:52:24');
INSERT INTO `starter_login_log` VALUES (1435270675253121024, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-07 23:56:10');
INSERT INTO `starter_login_log` VALUES (1435272615848529920, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-08 00:03:52');
INSERT INTO `starter_login_log` VALUES (1435275742376226816, 1414143554414059520, 'xxm1995', b'1', 'pc', '39.78.249.69', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-08 00:16:18');
INSERT INTO `starter_login_log` VALUES (1435276320703639552, NULL, 'xxm1995', b'0', 'pc', '39.78.249.69', NULL, 'Windows 10', 'Chrome 8', '验证码不正确', '2021-09-08 00:18:36');
INSERT INTO `starter_login_log` VALUES (1435276333919891456, NULL, 'xxm1995', b'0', 'pc', '39.78.249.69', NULL, 'Windows 10', 'Chrome 8', '验证码不正确', '2021-09-08 00:18:39');
INSERT INTO `starter_login_log` VALUES (1435276419999592448, NULL, 'xxm1995', b'0', 'pc', '39.78.249.69', NULL, 'Windows 10', 'Chrome 8', '验证码不正确', '2021-09-08 00:18:59');
INSERT INTO `starter_login_log` VALUES (1435276486651277312, 1414143554414059520, 'xxm1995', b'1', 'pc', '39.78.249.69', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-08 00:19:15');
INSERT INTO `starter_login_log` VALUES (1435277351649751040, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-09-08 00:22:40');
INSERT INTO `starter_login_log` VALUES (1435431386874114048, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-08 10:34:44');
INSERT INTO `starter_login_log` VALUES (1435444601498583040, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-08 11:27:15');
INSERT INTO `starter_login_log` VALUES (1435553891571982336, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-08 18:41:32');
INSERT INTO `starter_login_log` VALUES (1435554074632380416, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-08 18:42:17');
INSERT INTO `starter_login_log` VALUES (1435554346083540992, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-08 18:43:22');
INSERT INTO `starter_login_log` VALUES (1435596532945489920, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-08 21:30:59');
INSERT INTO `starter_login_log` VALUES (1435596808024723456, 1414143554414059520, 'xxm1995', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-08 21:32:06');
INSERT INTO `starter_login_log` VALUES (1435609365724712960, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-08 22:21:59');
INSERT INTO `starter_login_log` VALUES (1435610121269858304, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-08 22:25:00');
INSERT INTO `starter_login_log` VALUES (1435611860941369344, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-08 22:31:55');
INSERT INTO `starter_login_log` VALUES (1435612191431553024, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-08 22:33:13');
INSERT INTO `starter_login_log` VALUES (1435612209223790592, 1414143554414059520, 'xxm1995', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-08 22:33:18');
INSERT INTO `starter_login_log` VALUES (1435622903001509888, 1414143554414059520, 'xxm1995', b'1', 'pc', '39.78.249.69', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-08 23:15:47');
INSERT INTO `starter_login_log` VALUES (1435623956936617984, 1399985191002447872, 'xxm', b'1', 'phone', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-08 23:19:59');
INSERT INTO `starter_login_log` VALUES (1435624067183898624, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-09-08 23:20:25');
INSERT INTO `starter_login_log` VALUES (1435774326448259072, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-09 09:17:28');
INSERT INTO `starter_login_log` VALUES (1435826468001374208, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-09 12:44:39');
INSERT INTO `starter_login_log` VALUES (1435829738908377088, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-09 12:57:41');
INSERT INTO `starter_login_log` VALUES (1435846203795533824, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '密码不正确', '2021-09-09 14:03:04');
INSERT INTO `starter_login_log` VALUES (1435846207889174528, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '密码不正确', '2021-09-09 14:03:07');
INSERT INTO `starter_login_log` VALUES (1435846573418573824, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '密码不正确', '2021-09-09 14:04:34');
INSERT INTO `starter_login_log` VALUES (1435846857456840704, NULL, 'xxm1', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '用户未找到异常', '2021-09-09 14:05:42');
INSERT INTO `starter_login_log` VALUES (1435846950402617344, NULL, 'xxm1', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '用户未找到异常', '2021-09-09 14:06:04');
INSERT INTO `starter_login_log` VALUES (1435847063111954432, NULL, 'xxm1', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '用户未找到异常', '2021-09-09 14:06:31');
INSERT INTO `starter_login_log` VALUES (1435847118212526080, NULL, 'xxm2', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '用户未找到异常', '2021-09-09 14:06:44');
INSERT INTO `starter_login_log` VALUES (1435847623835877376, NULL, 'xxm1', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '用户未找到异常', '2021-09-09 14:08:43');
INSERT INTO `starter_login_log` VALUES (1435847673634848768, NULL, 'xxm1', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '用户未找到异常', '2021-09-09 14:08:57');
INSERT INTO `starter_login_log` VALUES (1435848184383635456, NULL, 'xxm1', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '用户未找到异常', '2021-09-09 14:10:59');
INSERT INTO `starter_login_log` VALUES (1435848200858861568, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '密码不正确', '2021-09-09 14:11:03');
INSERT INTO `starter_login_log` VALUES (1435848212531609600, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '密码不正确', '2021-09-09 14:11:05');
INSERT INTO `starter_login_log` VALUES (1435848213156560896, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '密码不正确', '2021-09-09 14:11:05');
INSERT INTO `starter_login_log` VALUES (1435848213961867264, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '密码不正确', '2021-09-09 14:11:06');
INSERT INTO `starter_login_log` VALUES (1435848214716841984, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '密码不正确', '2021-09-09 14:11:06');
INSERT INTO `starter_login_log` VALUES (1435848215387930624, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '密码不正确', '2021-09-09 14:11:06');
INSERT INTO `starter_login_log` VALUES (1435848216109350912, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '密码不正确', '2021-09-09 14:11:06');
INSERT INTO `starter_login_log` VALUES (1435848224133054464, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-09 14:11:08');
INSERT INTO `starter_login_log` VALUES (1435861239062560768, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-09 15:02:51');
INSERT INTO `starter_login_log` VALUES (1435881670737887232, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-09 16:24:02');
INSERT INTO `starter_login_log` VALUES (1435881670737887233, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-09 16:24:02');
INSERT INTO `starter_login_log` VALUES (1435881670737887234, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-09 16:24:02');
INSERT INTO `starter_login_log` VALUES (1435881670742081536, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-09 16:24:02');
INSERT INTO `starter_login_log` VALUES (1435967237176356864, NULL, 'admin', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '用户未找到', '2021-09-09 22:04:02');
INSERT INTO `starter_login_log` VALUES (1435967244898070528, NULL, 'admin1', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '密码不正确', '2021-09-09 22:04:05');
INSERT INTO `starter_login_log` VALUES (1435967271385100288, NULL, 'admin1', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '密码不正确', '2021-09-09 22:04:11');
INSERT INTO `starter_login_log` VALUES (1435967974518222848, 1435967884114194432, 'test', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-09 22:06:59');
INSERT INTO `starter_login_log` VALUES (1435969766324891648, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-09 22:14:06');
INSERT INTO `starter_login_log` VALUES (1435979147859984384, 1414143554414059520, 'xxm1995', b'1', 'pc', '39.78.249.69', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-09 22:51:23');
INSERT INTO `starter_login_log` VALUES (1435979384175460352, 1414143554414059520, 'xxm1995', b'1', 'pc', '39.78.249.69', NULL, 'Mac OS X (iPhone)', 'Mobile Safari', NULL, '2021-09-09 22:52:19');
INSERT INTO `starter_login_log` VALUES (1436221172576419840, 1414143554414059520, 'xxm1995', b'1', 'pc', '112.232.231.211', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-10 14:53:06');
INSERT INTO `starter_login_log` VALUES (1436269706311057408, 1435967884114194432, 'test', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-10 18:05:55');
INSERT INTO `starter_login_log` VALUES (1436270192779014144, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-10 18:07:51');
INSERT INTO `starter_login_log` VALUES (1436270256477908992, NULL, 'admin1', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '密码不正确', '2021-09-10 18:08:08');
INSERT INTO `starter_login_log` VALUES (1436270284198064128, NULL, 'admin1', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '密码不正确', '2021-09-10 18:08:15');
INSERT INTO `starter_login_log` VALUES (1436270509457354752, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-10 18:09:09');
INSERT INTO `starter_login_log` VALUES (1436270650457272320, NULL, 'xxmadmin1', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '用户未找到', '2021-09-10 18:09:42');
INSERT INTO `starter_login_log` VALUES (1436270670334078976, 1435894470432456704, 'admin1', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-10 18:09:47');
INSERT INTO `starter_login_log` VALUES (1436270855206416384, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-10 18:10:31');
INSERT INTO `starter_login_log` VALUES (1436270913188474880, 1435894470432456704, 'admin1', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-10 18:10:45');
INSERT INTO `starter_login_log` VALUES (1436271043669078016, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-10 18:11:16');
INSERT INTO `starter_login_log` VALUES (1436288679164174336, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-10 19:21:19');
INSERT INTO `starter_login_log` VALUES (1436288744788254720, NULL, 'test', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '密码不正确', '2021-09-10 19:21:36');
INSERT INTO `starter_login_log` VALUES (1436288776820154368, 1435894470432456704, 'admin1', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-10 19:21:44');
INSERT INTO `starter_login_log` VALUES (1436289292140732416, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-10 19:23:47');
INSERT INTO `starter_login_log` VALUES (1436289524924604416, 1435894470432456704, 'admin1', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-10 19:24:42');
INSERT INTO `starter_login_log` VALUES (1436289836146155520, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-10 19:25:57');
INSERT INTO `starter_login_log` VALUES (1436291304077058048, 1435894470432456704, 'admin1', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-10 19:31:47');
INSERT INTO `starter_login_log` VALUES (1436291816126078976, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-10 19:33:49');
INSERT INTO `starter_login_log` VALUES (1436312322767323136, 1435894470432456704, 'admin1', b'1', 'pc', '39.78.249.69', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-10 20:55:18');
INSERT INTO `starter_login_log` VALUES (1436314113852698624, 1414143554414059520, 'xxm1995', b'1', 'pc', '39.78.249.69', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-10 21:02:25');
INSERT INTO `starter_login_log` VALUES (1436937678331441152, 1414143554414059520, 'xxm1995', b'1', 'pc', '218.57.175.61', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-12 14:20:14');
INSERT INTO `starter_login_log` VALUES (1436940002009411584, 1435894470432456704, 'admin1', b'1', 'pc', '218.57.175.61', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-12 14:29:28');
INSERT INTO `starter_login_log` VALUES (1436940127452655616, 1414143554414059520, 'xxm1995', b'1', 'pc', '218.57.175.61', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-12 14:29:58');
INSERT INTO `starter_login_log` VALUES (1436940256909848576, 1435894470432456704, 'admin1', b'1', 'pc', '218.57.175.61', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-12 14:30:29');
INSERT INTO `starter_login_log` VALUES (1436940772951846912, 1414143554414059520, 'xxm1995', b'1', 'pc', '218.57.175.61', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-12 14:32:32');
INSERT INTO `starter_login_log` VALUES (1437648700528881664, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-14 13:25:33');
INSERT INTO `starter_login_log` VALUES (1437715218960609280, 1414143554414059520, 'xxm1995', b'1', 'pc', '144.52.92.53', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-09-14 17:49:54');
INSERT INTO `starter_login_log` VALUES (1438061652876709888, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-15 16:46:29');
INSERT INTO `starter_login_log` VALUES (1438382844678369280, 1414143554414059520, 'xxm1995', b'1', 'pc', '114.244.115.54', NULL, 'Linux', 'Chrome 9', NULL, '2021-09-16 14:02:49');
INSERT INTO `starter_login_log` VALUES (1439868223850786816, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-20 16:25:09');
INSERT INTO `starter_login_log` VALUES (1439876421149388800, 1414143554414059520, 'xxm1995', b'1', 'pc', '49.67.57.109', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-09-20 16:57:45');
INSERT INTO `starter_login_log` VALUES (1439889355200131072, 1414143554414059520, 'xxm1995', b'1', 'pc', '144.52.108.61', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-09-20 17:49:09');
INSERT INTO `starter_login_log` VALUES (1439928832270397440, 1414143554414059520, 'xxm1995', b'1', 'pc', '112.231.43.73', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-20 20:26:01');
INSERT INTO `starter_login_log` VALUES (1439952898482106368, 1414143554414059520, 'xxm1995', b'1', 'pc', '110.53.253.141', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-09-20 22:01:39');
INSERT INTO `starter_login_log` VALUES (1439956815194484736, 1414143554414059520, 'xxm1995', b'1', 'pc', '140.240.53.232', NULL, 'Windows 7', 'Firefox 9', NULL, '2021-09-20 22:17:12');
INSERT INTO `starter_login_log` VALUES (1439958376665534464, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-20 22:23:23');
INSERT INTO `starter_login_log` VALUES (1439966301070159872, 1414143554414059520, 'xxm1995', b'1', 'pc', '39.78.249.69', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-20 22:54:54');
INSERT INTO `starter_login_log` VALUES (1441985271797354496, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-26 12:37:32');
INSERT INTO `starter_login_log` VALUES (1443043542591213568, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-29 10:42:44');
INSERT INTO `starter_login_log` VALUES (1443106009103196160, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-29 14:50:57');
INSERT INTO `starter_login_log` VALUES (1443118842549329920, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-29 15:41:59');
INSERT INTO `starter_login_log` VALUES (1443119408851673088, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '账号不是正常状态,无法登陆', '2021-09-29 15:44:14');
INSERT INTO `starter_login_log` VALUES (1443119441403666432, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '账号不是正常状态,无法登陆', '2021-09-29 15:44:21');
INSERT INTO `starter_login_log` VALUES (1443119508189569024, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '账号不是正常状态,无法登陆', '2021-09-29 15:44:37');
INSERT INTO `starter_login_log` VALUES (1443119541576228864, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '账号不是正常状态,无法登陆', '2021-09-29 15:44:45');
INSERT INTO `starter_login_log` VALUES (1443120195459833856, 1414143554414059520, 'xxm1995', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-29 15:47:21');
INSERT INTO `starter_login_log` VALUES (1443120225084203008, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-09-29 15:47:28');
INSERT INTO `starter_login_log` VALUES (1444113825862250496, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-10-02 09:35:40');
INSERT INTO `starter_login_log` VALUES (1447493131952144384, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-10-11 17:23:49');
INSERT INTO `starter_login_log` VALUES (1450020997717684224, 1414143554414059520, 'xxm1995', b'1', 'pc', '124.205.88.37', NULL, 'Mac OS X', 'Chrome 9', NULL, '2021-10-18 16:48:40');
INSERT INTO `starter_login_log` VALUES (1450021013735731200, 1414143554414059520, 'xxm1995', b'1', 'pc', '124.205.88.37', NULL, 'Mac OS X', 'Chrome 9', NULL, '2021-10-18 16:48:44');
INSERT INTO `starter_login_log` VALUES (1450293714375147520, 1414143554414059520, 'xxm1995', b'1', 'pc', '112.232.38.203', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-10-19 10:52:21');
INSERT INTO `starter_login_log` VALUES (1450397583226933248, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-10-19 17:45:04');
INSERT INTO `starter_login_log` VALUES (1450473324504031232, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-10-19 22:46:04');
INSERT INTO `starter_login_log` VALUES (1450481159909670912, 1414143554414059520, 'xxm1995', b'1', 'pc', '125.211.72.44', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-10-19 23:17:12');
INSERT INTO `starter_login_log` VALUES (1451367117580611584, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-10-22 09:57:39');
INSERT INTO `starter_login_log` VALUES (1451374241576595456, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-10-22 10:25:59');
INSERT INTO `starter_login_log` VALUES (1451481289790062592, 1414143554414059520, 'xxm1995', b'1', 'pc', '121.28.128.5', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-10-22 17:31:21');
INSERT INTO `starter_login_log` VALUES (1451481289806839808, 1414143554414059520, 'xxm1995', b'1', 'pc', '121.28.128.5', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-10-22 17:31:21');
INSERT INTO `starter_login_log` VALUES (1452253562063028224, 1414143554414059520, 'xxm1995', b'1', 'pc', '117.59.81.181', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-10-24 20:40:05');
INSERT INTO `starter_login_log` VALUES (1452567514622177280, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-10-25 17:27:36');
INSERT INTO `starter_login_log` VALUES (1452664350850416640, 1414143554414059520, 'xxm1995', b'1', 'pc', '113.119.175.199', NULL, 'Mac OS X', 'Chrome 9', NULL, '2021-10-25 23:52:25');
INSERT INTO `starter_login_log` VALUES (1452833607035105280, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-10-26 11:04:57');
INSERT INTO `starter_login_log` VALUES (1453208668413624320, 1414143554414059520, 'xxm1995', b'1', 'pc', '210.12.100.3', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-10-27 11:55:21');
INSERT INTO `starter_login_log` VALUES (1453553203081641984, 1414143554414059520, 'xxm1995', b'1', 'pc', '111.196.246.37', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-10-28 10:44:24');
INSERT INTO `starter_login_log` VALUES (1453588450536296448, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-10-28 13:04:26');
INSERT INTO `starter_login_log` VALUES (1456512334124982272, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-05 14:42:55');
INSERT INTO `starter_login_log` VALUES (1456630066259689472, 1414143554414059520, 'xxm1995', b'1', 'pc', '117.13.66.169', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-11-05 22:30:45');
INSERT INTO `starter_login_log` VALUES (1457692014102421504, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-08 20:50:32');
INSERT INTO `starter_login_log` VALUES (1457701370857521152, 1414143554414059520, 'xxm1995', b'1', 'pc', '27.17.100.149', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-08 21:27:44');
INSERT INTO `starter_login_log` VALUES (1457944053526036480, 1414143554414059520, 'xxm1995', b'1', 'pc', '110.184.45.75', NULL, 'Windows 7', 'Chrome', NULL, '2021-11-09 13:32:04');
INSERT INTO `starter_login_log` VALUES (1458722306960609280, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '密码不正确', '2021-11-11 17:04:33');
INSERT INTO `starter_login_log` VALUES (1458722374228856832, NULL, 'xxm', b'0', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', '密码不正确', '2021-11-11 17:04:50');
INSERT INTO `starter_login_log` VALUES (1458724861400739840, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 17:14:43');
INSERT INTO `starter_login_log` VALUES (1458727490839277568, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 17:25:10');
INSERT INTO `starter_login_log` VALUES (1458727594765742080, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 17:25:35');
INSERT INTO `starter_login_log` VALUES (1458732052304261120, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 17:43:18');
INSERT INTO `starter_login_log` VALUES (1458732554022711296, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 17:45:17');
INSERT INTO `starter_login_log` VALUES (1458732570439217152, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 17:45:21');
INSERT INTO `starter_login_log` VALUES (1458732934819377152, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 17:46:48');
INSERT INTO `starter_login_log` VALUES (1458740946846003200, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 18:18:38');
INSERT INTO `starter_login_log` VALUES (1458741207614271488, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 18:19:41');
INSERT INTO `starter_login_log` VALUES (1458741228325744640, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 18:19:46');
INSERT INTO `starter_login_log` VALUES (1458741229550481408, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 18:19:46');
INSERT INTO `starter_login_log` VALUES (1458741230213181440, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 18:19:46');
INSERT INTO `starter_login_log` VALUES (1458741230812966912, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 18:19:46');
INSERT INTO `starter_login_log` VALUES (1458741433280409600, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 18:20:34');
INSERT INTO `starter_login_log` VALUES (1458741467375906816, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 18:20:43');
INSERT INTO `starter_login_log` VALUES (1458742065013895168, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 18:23:05');
INSERT INTO `starter_login_log` VALUES (1458742117526581248, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 18:23:18');
INSERT INTO `starter_login_log` VALUES (1458742120617783296, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 18:23:18');
INSERT INTO `starter_login_log` VALUES (1458742121276289024, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 18:23:18');
INSERT INTO `starter_login_log` VALUES (1458742122039652352, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 18:23:19');
INSERT INTO `starter_login_log` VALUES (1458742122907873280, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 18:23:19');
INSERT INTO `starter_login_log` VALUES (1458742123918700544, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 18:23:19');
INSERT INTO `starter_login_log` VALUES (1458743415948881920, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 18:28:27');
INSERT INTO `starter_login_log` VALUES (1458748374891307008, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 18:47:55');
INSERT INTO `starter_login_log` VALUES (1458748375038107648, 1399985191002447872, 'xxm', b'1', '', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-11 18:48:09');
INSERT INTO `starter_login_log` VALUES (1459032013281427456, 1414143554414059520, 'xxm1995', b'1', 'pc', '122.97.232.229', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-11-12 13:35:14');
INSERT INTO `starter_login_log` VALUES (1459050382315741184, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-12 14:48:10');
INSERT INTO `starter_login_log` VALUES (1459050382315741185, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-12 14:48:12');
INSERT INTO `starter_login_log` VALUES (1459062330746986496, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-12 15:35:42');
INSERT INTO `starter_login_log` VALUES (1459420579215966208, 1414143554414059520, 'xxm1995', b'1', 'pc', '115.191.191.135', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-13 15:19:15');
INSERT INTO `starter_login_log` VALUES (1460189124648501248, 1414143554414059520, 'xxm1995', b'1', 'pc', '112.224.1.23', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-11-15 18:13:11');
INSERT INTO `starter_login_log` VALUES (1460214209236058112, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-15 19:52:51');
INSERT INTO `starter_login_log` VALUES (1460462859716657152, 1414143554414059520, 'xxm1995', b'1', 'pc', '39.91.105.200', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-16 12:20:54');
INSERT INTO `starter_login_log` VALUES (1460474152452358144, 1414143554414059520, 'xxm1995', b'1', 'pc', '182.149.190.203', NULL, 'Windows 7', 'Chrome', NULL, '2021-11-16 13:05:47');
INSERT INTO `starter_login_log` VALUES (1460474224346923008, 1414143554414059520, 'xxm1995', b'1', 'pc', '182.149.190.203', NULL, 'Windows 7', 'Chrome', NULL, '2021-11-16 13:06:04');
INSERT INTO `starter_login_log` VALUES (1461537754118848512, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-19 11:32:08');
INSERT INTO `starter_login_log` VALUES (1462327808242888704, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-21 15:51:32');
INSERT INTO `starter_login_log` VALUES (1462428240991748096, 1414143554414059520, 'xxm1995', b'1', 'pc', '59.152.38.212', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-21 22:30:38');
INSERT INTO `starter_login_log` VALUES (1462778251860508672, 1414143554414059520, 'xxm1995', b'1', 'pc', '120.244.234.8', NULL, 'Linux', 'Chrome 9', NULL, '2021-11-22 21:41:27');
INSERT INTO `starter_login_log` VALUES (1463147318462074880, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-23 22:07:56');
INSERT INTO `starter_login_log` VALUES (1463147417971937280, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-23 22:08:23');
INSERT INTO `starter_login_log` VALUES (1463147447927656448, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-23 22:08:30');
INSERT INTO `starter_login_log` VALUES (1463147448783294464, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-23 22:08:30');
INSERT INTO `starter_login_log` VALUES (1464489320562741248, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-27 15:00:36');
INSERT INTO `starter_login_log` VALUES (1464512351163043840, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-27 16:32:08');
INSERT INTO `starter_login_log` VALUES (1464528831762059264, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-11-27 17:37:38');
INSERT INTO `starter_login_log` VALUES (1465219290340786176, 1414143554414059520, 'xxm1995', b'1', 'pc', '111.199.55.79', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-11-29 15:21:16');
INSERT INTO `starter_login_log` VALUES (1465537762820096000, 1414143554414059520, 'xxm1995', b'1', 'pc', '123.112.16.174', NULL, 'Windows 10', 'Chrome 9', NULL, '2021-11-30 12:26:46');
INSERT INTO `starter_login_log` VALUES (1465974054905323520, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10', 'Chrome 8', NULL, '2021-12-01 17:20:24');
INSERT INTO `starter_login_log` VALUES (1467838036409577472, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10 or Windows Server 2016', 'Chrome 86.0.4240.198', NULL, '2021-12-06 20:47:12');
INSERT INTO `starter_login_log` VALUES (1467838179263377408, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10 or Windows Server 2016', 'Chrome 86.0.4240.198', NULL, '2021-12-06 20:47:48');
INSERT INTO `starter_login_log` VALUES (1467838196325806080, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10 or Windows Server 2016', 'Chrome 86.0.4240.198', NULL, '2021-12-06 20:47:52');
INSERT INTO `starter_login_log` VALUES (1467838199609946112, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10 or Windows Server 2016', 'Chrome 86.0.4240.198', NULL, '2021-12-06 20:47:53');
INSERT INTO `starter_login_log` VALUES (1467838239363559424, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10 or Windows Server 2016', 'Chrome 86.0.4240.198', NULL, '2021-12-06 20:48:02');
INSERT INTO `starter_login_log` VALUES (1467840105669345280, 1399985191002447872, 'xxm', b'1', 'pc', '127.0.0.1', NULL, 'Windows 10 or Windows Server 2016', 'Chrome 86.0.4240.198', NULL, '2021-12-06 20:55:26');

-- ----------------------------
-- Table structure for starter_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `starter_operate_log`;
CREATE TABLE `starter_operate_log`  (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作模块',
  `operate_id` bigint(20) NULL DEFAULT NULL COMMENT '操作人员id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人员账号',
  `business_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `operate_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求url',
  `operate_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作ip',
  `operate_location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作地点',
  `operate_param` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `operate_return` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '返回参数',
  `success` bit(1) NULL DEFAULT NULL COMMENT '是否成功',
  `error_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误提示',
  `operate_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of starter_operate_log
-- ----------------------------
INSERT INTO `starter_operate_log` VALUES (1426070667477061634, '测试日志', 1399985191002447872, 'xxm', 'other', 'cn.bootx.iam.controller.TestController#hello', 'GET', '/test/hello', '192.168.196.167', NULL, NULL, NULL, b'1', NULL, '2021-08-13 14:38:34');
INSERT INTO `starter_operate_log` VALUES (1426077982628499458, '测试日志', 1399985191002447872, 'xxm', 'other', 'cn.bootx.iam.controller.TestController#say', 'GET', '/test/say', '192.168.196.167', NULL, NULL, NULL, b'1', NULL, '2021-08-13 15:07:19');
INSERT INTO `starter_operate_log` VALUES (1426079804810215425, '测试回声日志', 1399985191002447872, 'xxm', 'other', 'cn.bootx.iam.controller.TestController#say', 'GET', '/test/say', '192.168.196.167', NULL, '[\"234324\"]', '{\"msg\":\"success\",\"code\":0,\"data\":\"234324\"}', b'1', NULL, '2021-08-13 15:13:43');
INSERT INTO `starter_operate_log` VALUES (1426079845067145218, '测试回声日志', 0, NULL, 'other', 'cn.bootx.iam.controller.TestController#say', 'GET', '/test/say', '192.168.196.167', NULL, '[\"234324\"]', '{\"msg\":\"success\",\"code\":0,\"data\":\"234324\"}', b'1', NULL, '2021-08-13 15:15:05');
INSERT INTO `starter_operate_log` VALUES (1426079867452145665, '测试回声日志', 0, NULL, 'other', 'cn.bootx.iam.controller.TestController#say', 'GET', '/test/say', '192.168.196.167', NULL, '[\"234324\"]', '{\"msg\":\"success\",\"code\":0,\"data\":\"234324\"}', b'1', NULL, '2021-08-13 15:15:10');
INSERT INTO `starter_operate_log` VALUES (1426080137145892866, '测试回声日志', 0, NULL, 'other', 'cn.bootx.iam.controller.TestController#say', 'GET', '/test/say', '192.168.196.167', NULL, '[\"234324\"]', '{\"msg\":\"success\",\"code\":0,\"data\":\"234324\"}', b'1', NULL, '2021-08-13 15:16:15');
INSERT INTO `starter_operate_log` VALUES (1426080164421451777, '测试回声日志', 0, NULL, 'other', 'cn.bootx.iam.controller.TestController#say', 'GET', '/test/say', '192.168.196.167', NULL, '[\"234324\"]', '{\"msg\":\"success\",\"code\":0,\"data\":\"234324\"}', b'1', NULL, '2021-08-13 15:16:21');
INSERT INTO `starter_operate_log` VALUES (1426082640583344130, '测试回声日志', 0, NULL, 'other', 'cn.bootx.iam.controller.TestController#say', 'GET', '/test/say', '192.168.196.167', NULL, '[\"234324\"]', '{\"msg\":\"success\",\"code\":0,\"data\":\"234324\"}', b'1', NULL, '2021-08-13 15:26:12');
INSERT INTO `starter_operate_log` VALUES (1435611068511514624, '强退用户', 0, NULL, 'force', 'cn.bootx.iam.core.online.OnlineUserService#logoutByUserId', 'POST', '/user/online/logoutByUserId', '127.0.0.1', NULL, '[\"1399985191002447872\"]', NULL, b'1', NULL, '2021-09-08 22:28:44');
INSERT INTO `starter_operate_log` VALUES (1435612098557079552, '强退用户', 0, NULL, 'force', 'cn.bootx.iam.core.online.OnlineUserService#logoutByUserId', 'POST', '/user/online/logoutByUserId', '127.0.0.1', NULL, '[\"1399985191002447872\"]', NULL, b'1', NULL, '2021-09-08 22:32:51');
INSERT INTO `starter_operate_log` VALUES (1435612247425511424, '强退用户', 1414143554414059520, 'xxm1995', 'force', 'cn.bootx.iam.core.online.OnlineUserService#logoutByUserId', 'POST', '/user/online/logoutByUserId', '127.0.0.1', NULL, '[\"1399985191002447872\"]', NULL, b'1', NULL, '2021-09-08 22:33:27');
INSERT INTO `starter_operate_log` VALUES (1435969687912378368, '强退用户', 1414143554414059520, 'xxm1995', 'force', 'cn.bootx.iam.core.online.OnlineUserService#logoutByUserId', 'POST', '/user/online/logoutByUserId', '127.0.0.1', NULL, '[\"1435967884114194432\"]', NULL, b'1', NULL, '2021-09-09 22:13:47');
INSERT INTO `starter_operate_log` VALUES (1436270611123089408, '重置密码', 1399985191002447872, 'xxm', 'update', 'cn.bootx.iam.controller.UserAdminController#restartPassword', 'POST', '/user/admin/restartPassword', '127.0.0.1', NULL, '[\"1435894470432456704\",\"123456\"]', NULL, b'1', NULL, '2021-09-10 18:09:33');
INSERT INTO `starter_operate_log` VALUES (1439876625311330304, '强退用户', 0, NULL, 'force', 'cn.bootx.iam.core.online.OnlineUserService#logoutByUserId', 'POST', '/user/online/logoutByUserId', '49.67.57.109', NULL, '[\"1414143554414059520\"]', NULL, b'1', NULL, '2021-09-20 16:58:34');
INSERT INTO `starter_operate_log` VALUES (1439876636975689728, '强退用户', 0, NULL, 'force', 'cn.bootx.iam.core.online.OnlineUserService#logoutByUserId', 'POST', '/user/online/logoutByUserId', '49.67.57.109', NULL, '[\"1399985191002447872\"]', NULL, b'1', NULL, '2021-09-20 16:58:37');
INSERT INTO `starter_operate_log` VALUES (1443117248994840576, '锁定用户', 1399985191002447872, 'xxm', 'update', 'cn.bootx.iam.controller.UserAdminController#lock', 'POST', '/user/admin/lock', '127.0.0.1', NULL, '[\"1399985191002447872\"]', NULL, b'1', NULL, '2021-09-29 15:35:37');
INSERT INTO `starter_operate_log` VALUES (1443117546912059392, '锁定用户', 1399985191002447872, 'xxm', 'update', 'cn.bootx.iam.controller.UserAdminController#lock', 'POST', '/user/admin/lock', '127.0.0.1', NULL, '[\"1399985191002447872\"]', NULL, b'1', NULL, '2021-09-29 15:36:50');
INSERT INTO `starter_operate_log` VALUES (1443117588502777856, '锁定用户', 1399985191002447872, 'xxm', 'update', 'cn.bootx.iam.controller.UserAdminController#lock', 'POST', '/user/admin/lock', '127.0.0.1', NULL, '[\"1435967884114194432\"]', NULL, b'1', NULL, '2021-09-29 15:37:00');
INSERT INTO `starter_operate_log` VALUES (1443118813549912064, '锁定用户', 1399985191002447872, 'xxm', 'update', 'cn.bootx.iam.controller.UserAdminController#lock', 'POST', '/user/admin/lock', '127.0.0.1', NULL, '[\"1399985191002447872\"]', NULL, b'1', NULL, '2021-09-29 15:41:50');
INSERT INTO `starter_operate_log` VALUES (1443120664622096384, '解锁用户', 1399985191002447872, 'xxm', 'update', 'cn.bootx.iam.controller.UserAdminController#unlock', 'POST', '/user/admin/unlock', '127.0.0.1', NULL, '[\"1399985191002447872\"]', NULL, b'1', NULL, '2021-09-29 15:49:13');
INSERT INTO `starter_operate_log` VALUES (1460474185549611008, '强退用户', 0, NULL, 'force', 'cn.bootx.iam.core.online.OnlineUserService#logoutByUserId', 'POST', '/user/online/logoutByUserId', '182.149.190.203', NULL, '[\"1414143554414059520\"]', NULL, b'1', NULL, '2021-11-16 13:05:55');
INSERT INTO `starter_operate_log` VALUES (1461164079791996928, '锁定用户', 1414143554414059520, 'xxm1995', 'update', 'cn.bootx.iam.controller.UserAdminController#lock', 'POST', '/user/admin/lock', '182.149.190.203', NULL, '[\"1435894470432456704\"]', NULL, b'1', NULL, '2021-11-18 10:47:18');

-- ----------------------------
-- Table structure for starter_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `starter_quartz_job`;
CREATE TABLE `starter_quartz_job`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务类名',
  `cron` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `parameter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '参数',
  `state` int(4) NULL DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of starter_quartz_job
-- ----------------------------
INSERT INTO `starter_quartz_job` VALUES (1456579473573867520, '测试任务', 'cn.bootx.starter.quartz.task.TestTask', '* * * * * ?', NULL, 0, '测试任务', 1399985191002447872, '2021-11-05 19:09:43', 1399985191002447872, '2021-11-05 19:09:43', 9, 0);

-- ----------------------------
-- Table structure for starter_sequence_range
-- ----------------------------
DROP TABLE IF EXISTS `starter_sequence_range`;
CREATE TABLE `starter_sequence_range`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `range_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区间key',
  `range_value` bigint(20) NOT NULL COMMENT '区间开始值',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发号器队列区间管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of starter_sequence_range
-- ----------------------------
INSERT INTO `starter_sequence_range` VALUES (1470679520373862400, 'Sequence:cs', 2006, 0, '2021-12-14 16:58:16', 0, '2021-12-14 16:58:16', 6, 0);
INSERT INTO `starter_sequence_range` VALUES (1470679955230908416, 'cs', 2020, 0, '2021-12-14 17:00:00', 0, '2021-12-14 17:00:00', 13, 0);

-- ----------------------------
-- Table structure for starter_upload_file
-- ----------------------------
DROP TABLE IF EXISTS `starter_upload_file`;
CREATE TABLE `starter_upload_file`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存储位置',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `file_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `file_suffix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件后缀',
  `file_size` double(8, 0) NULL DEFAULT NULL COMMENT '文件大小',
  `external_storage_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外部关联id',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '上传文件信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of starter_upload_file
-- ----------------------------
INSERT INTO `starter_upload_file` VALUES (1495330622946631680, NULL, 'blob', 'jpg', 'jpg', 68, '62120ac9efeec06e2275fc52', 1399985191002447872, '2022-02-20 17:32:57');
INSERT INTO `starter_upload_file` VALUES (1495331213525606400, NULL, 'blob', 'jpg', 'jpg', 68, '62120b55efeec06e2275fc54', 1399985191002447872, '2022-02-20 17:35:28');
INSERT INTO `starter_upload_file` VALUES (1495331812178616320, NULL, 'blob', 'jpg', 'jpg', 74, '62120be4efeec06e2275fc56', 1399985191002447872, '2022-02-20 17:37:43');
INSERT INTO `starter_upload_file` VALUES (1495331905770315776, NULL, 'blob', 'jpg', 'jpg', 76, '62120bfaefeec06e2275fc58', 1399985191002447872, '2022-02-20 17:38:03');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编码',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  `version` int(8) NULL DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name_index`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1422929378374828033, '性别', 'Sex', '性别', 0, '2021-08-04 22:36:15', 0, '2021-08-12 15:22:25', 0, 5);
INSERT INTO `sys_dict` VALUES (1425744045414772737, '菜单类型', 'MenuType', '菜单类型', 0, '2021-08-12 17:00:44', 0, '2021-08-12 17:00:44', 0, 3);
INSERT INTO `sys_dict` VALUES (1430063572491411456, '字典类型', 'loginType', '字典类型', 1399985191002447872, '2021-08-24 15:05:00', 1399985191002447872, '2021-08-24 15:05:00', 1, 2);
INSERT INTO `sys_dict` VALUES (1435829999592759296, '用户状态码', 'UserStatusCode', '用户状态码', 1399985191002447872, '2021-09-09 12:58:43', 1399985191002447872, '2021-09-09 12:58:43', 0, 1);
INSERT INTO `sys_dict` VALUES (1435838066191458304, '业务操作类型', 'LogBusinessType', '操作日志记录的业务操作类型', 1399985191002447872, '2021-09-09 13:30:46', 1399985191002447872, '2021-09-09 13:30:46', 0, 1);
INSERT INTO `sys_dict` VALUES (1438078864509317120, '邮箱安全方式编码', 'MailSecurityCode', '邮箱安全方式编码', 1399985191002447872, '2021-09-15 17:54:54', 1399985191002447872, '2021-09-15 17:54:54', 0, 1);
INSERT INTO `sys_dict` VALUES (1439961232651034624, '消息模板类型', 'MessageTemplateCode', '消息模板类型', 1399985191002447872, '2021-09-20 22:34:46', 1399985191002447872, '2021-09-20 22:34:46', 0, 0);
INSERT INTO `sys_dict` VALUES (1452836604783845376, '三方系统类型', 'SocialType', '三方系统类型', 1399985191002447872, '2021-10-26 11:16:54', 1399985191002447872, '2021-10-26 11:16:54', 0, 2);
INSERT INTO `sys_dict` VALUES (1452843488735621120, '参数类型', 'ParamType', '参数类型', 1399985191002447872, '2021-10-26 11:44:15', 1399985191002447872, '2021-10-26 11:44:15', 0, 1);
INSERT INTO `sys_dict` VALUES (1496024933900169216, '政治面貌', 'Political', '政治面貌', 1399985191002447872, '2022-02-22 15:31:54', 1399985191002447872, '2022-02-22 15:31:54', 0, 0);
INSERT INTO `sys_dict` VALUES (1496722894707728384, '支付通道', 'PayChannel', '支付宝, 微信, 云闪付等', 1399985191002447872, '2022-02-24 13:45:21', 1399985191002447872, '2022-02-24 13:45:21', 0, 0);
INSERT INTO `sys_dict` VALUES (1496723207565058048, '支付方式', 'PayWay', '扫码支付、Wap、App支付等', 1399985191002447872, '2022-02-24 13:46:35', 1399985191002447872, '2022-02-24 13:46:35', 0, 0);
INSERT INTO `sys_dict` VALUES (1497140849954185216, '支付状态', 'PayStatus', '支付中,成功,失败等', 1399985191002447872, '2022-02-25 17:26:09', 1399985191002447872, '2022-02-25 17:26:30', 0, 1);
INSERT INTO `sys_dict` VALUES (1501031423232937984, '异步支付通道', 'AsyncPayChannel', '如微信支付宝云闪付等第三方支付', 1399985191002447872, '2022-03-08 11:05:54', 1399985191002447872, '2022-03-08 11:05:54', 0, 0);
INSERT INTO `sys_dict` VALUES (1502276739978473472, '钱包状态', 'WalletStatus', '钱包状态', 1399985191002447872, '2022-03-11 21:34:20', 1399985191002447872, '2022-03-11 21:34:27', 0, 1);
INSERT INTO `sys_dict` VALUES (1502624342339448832, '钱包日志操作类型', 'WalletOperation', '', 1399985191002447872, '2022-03-12 20:35:35', 1399985191002447872, '2022-03-12 20:35:35', 1, 0);
INSERT INTO `sys_dict` VALUES (1502624515799085056, '钱包日志类型', 'WalletLogType', '钱包日志类型', 1399985191002447872, '2022-03-12 20:36:17', 1399985191002447872, '2022-03-12 20:36:17', 0, 0);
INSERT INTO `sys_dict` VALUES (1502624632392347648, '钱包日志操作类型', 'WalletLogOperation', '钱包日志操作类型', 1399985191002447872, '2022-03-12 20:36:44', 1399985191002447872, '2022-03-12 20:36:44', 0, 0);
INSERT INTO `sys_dict` VALUES (1503340128037212160, '储值卡状态', 'VoucherStatus', '储值卡状态', 1399985191002447872, '2022-03-14 19:59:52', 1399985191002447872, '2022-03-14 19:59:52', 0, 0);

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item`  (
  `id` bigint(20) NOT NULL,
  `dict_id` bigint(20) NOT NULL COMMENT '字典id',
  `dict_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典code',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典项code',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典项名称',
  `sort_no` double(8, 2) NOT NULL COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  `version` int(8) NOT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dictionary_id`(`dict_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典项' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO `sys_dict_item` VALUES (1422931375807242241, 1422929378374828033, 'Sex', '1', '男', 0.00, '男性', 0, '2021-08-04 22:44:11', 0, '2021-08-04 22:44:11', 0, 2);
INSERT INTO `sys_dict_item` VALUES (1425729455402401794, 1422929378374828033, 'Sex', '2', '女', 0.00, '女性', 0, '2021-08-12 16:02:46', 0, '2021-08-12 16:02:46', 0, 1);
INSERT INTO `sys_dict_item` VALUES (1425744258544136194, 1425744045414772737, 'MenuType', '0', '顶级菜单', 0.00, '顶级菜单', 0, '2021-08-12 17:01:35', 0, '2021-08-12 17:01:35', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1425744436592340993, 1425744045414772737, 'MenuType', '1', '子菜单', 0.00, '子菜单', 0, '2021-08-12 17:02:17', 0, '2021-08-12 17:02:17', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1425744470582980610, 1425744045414772737, 'MenuType', '2', '按钮权限', 0.00, '按钮权限', 0, '2021-08-12 17:02:26', 0, '2021-08-12 17:02:26', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1430094707250413568, 1422929378374828033, 'Sex', '0', '未知', 0.00, '不确定性别', 1399985191002447872, '2021-08-24 17:08:43', 1399985191002447872, '2021-08-24 17:08:43', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1435830086406463488, 1435829999592759296, 'UserStatusCode', '1', '正常', 0.00, 'NORMAL', 1399985191002447872, '2021-09-09 12:59:04', 1399985191002447872, '2021-09-09 12:59:04', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1435830141855162368, 1435829999592759296, 'UserStatusCode', '2', '锁定', 0.00, 'LOCK, 多次登录失败被锁定', 1399985191002447872, '2021-09-09 12:59:17', 1399985191002447872, '2021-09-09 12:59:17', 0, 1);
INSERT INTO `sys_dict_item` VALUES (1435830260503633920, 1435829999592759296, 'UserStatusCode', '3', '封禁', 0.00, 'BAN', 1399985191002447872, '2021-09-09 12:59:45', 1399985191002447872, '2021-09-09 12:59:45', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1435838374749626368, 1435838066191458304, 'LogBusinessType', 'other', '其它', 0.00, '', 1399985191002447872, '2021-09-09 13:32:00', 1399985191002447872, '2021-09-09 13:32:00', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1435838414436130816, 1435838066191458304, 'LogBusinessType', 'insert', '新增', 0.00, '', 1399985191002447872, '2021-09-09 13:32:09', 1399985191002447872, '2021-09-09 13:32:09', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1435838467624099840, 1435838066191458304, 'LogBusinessType', 'update', '修改', 0.00, '', 1399985191002447872, '2021-09-09 13:32:22', 1399985191002447872, '2021-09-09 13:32:22', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1435838502755590144, 1435838066191458304, 'LogBusinessType', 'delete', '删除', 0.00, '', 1399985191002447872, '2021-09-09 13:32:30', 1399985191002447872, '2021-09-09 13:32:30', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1435838546934194176, 1435838066191458304, 'LogBusinessType', 'grant', '授权', 0.00, '', 1399985191002447872, '2021-09-09 13:32:41', 1399985191002447872, '2021-09-09 13:32:41', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1435838605537009664, 1435838066191458304, 'LogBusinessType', 'export', '导出', 0.00, '', 1399985191002447872, '2021-09-09 13:32:55', 1399985191002447872, '2021-09-09 13:32:55', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1435838705457913856, 1435838066191458304, 'LogBusinessType', 'import', '导入', 0.00, '', 1399985191002447872, '2021-09-09 13:33:19', 1399985191002447872, '2021-09-09 13:33:19', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1435838745861644288, 1435838066191458304, 'LogBusinessType', 'force', '强退', 0.00, '', 1399985191002447872, '2021-09-09 13:33:28', 1399985191002447872, '2021-09-09 13:33:28', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1435838786273763328, 1435838066191458304, 'LogBusinessType', 'clean', '清空数据', 0.00, '', 1399985191002447872, '2021-09-09 13:33:38', 1399985191002447872, '2021-09-09 13:33:38', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1438079113630003200, 1438078864509317120, 'MailSecurityCode', '1', '普通方式', 0.00, 'SECURITY_TYPE_PLAIN', 1399985191002447872, '2021-09-15 17:55:54', 1399985191002447872, '2021-09-15 17:55:54', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1438080323061755904, 1438078864509317120, 'MailSecurityCode', '2', 'TLS方式', 0.00, 'SECURITY_TYPE_TLS', 1399985191002447872, '2021-09-15 18:00:42', 1399985191002447872, '2021-09-15 18:00:42', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1438080372231581696, 1438078864509317120, 'MailSecurityCode', '3', 'SSL方式', 0.00, 'SECURITY_TYPE_SSL', 1399985191002447872, '2021-09-15 18:00:54', 1399985191002447872, '2021-09-15 18:00:54', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1439961603914047488, 1439961232651034624, 'MessageTemplateCode', '5', '微信', -10.00, 'WECHAT', 1399985191002447872, '2021-09-20 22:36:14', 1399985191002447872, '2021-09-20 22:36:14', 0, 1);
INSERT INTO `sys_dict_item` VALUES (1439961704321490944, 1439961232651034624, 'MessageTemplateCode', '4', 'Email', 0.00, 'EMAIL', 1399985191002447872, '2021-09-20 22:36:38', 1399985191002447872, '2021-09-20 22:36:38', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1439962132744478720, 1439961232651034624, 'MessageTemplateCode', '3', '短信', 0.00, 'SMS', 1399985191002447872, '2021-09-20 22:38:20', 1399985191002447872, '2021-09-20 22:38:20', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1439962205578567680, 1439961232651034624, 'MessageTemplateCode', '2', '钉钉机器人', 0.00, 'DING_TALK_ROBOT', 1399985191002447872, '2021-09-20 22:38:38', 1399985191002447872, '2021-09-20 22:38:38', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1439962267511660544, 1439961232651034624, 'MessageTemplateCode', '1', '钉钉', 0.00, 'DING_TALK', 1399985191002447872, '2021-09-20 22:38:52', 1399985191002447872, '2021-09-20 22:38:52', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1452836696873984000, 1452836604783845376, 'SocialType', 'WeChat', '微信', 0.00, '', 1399985191002447872, '2021-10-26 11:17:16', 1399985191002447872, '2021-10-26 11:17:16', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1452837435482529792, 1452836604783845376, 'SocialType', 'QQ', 'QQ', 0.00, '', 1399985191002447872, '2021-10-26 11:20:12', 1399985191002447872, '2021-10-26 11:20:12', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1452837523030237184, 1452836604783845376, 'SocialType', 'DingTalk', '钉钉', 0.00, '', 1399985191002447872, '2021-10-26 11:20:33', 1399985191002447872, '2021-10-26 11:20:33', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1452844537911406592, 1452843488735621120, 'ParamType', '1', '系统参数', 0.00, '', 1399985191002447872, '2021-10-26 11:48:25', 1399985191002447872, '2021-10-26 11:48:25', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1452844565031776256, 1452843488735621120, 'ParamType', '2', '用户参数', 0.00, '', 1399985191002447872, '2021-10-26 11:48:32', 1399985191002447872, '2021-10-26 11:48:32', 0, 2);
INSERT INTO `sys_dict_item` VALUES (1496026946344005632, 1496024933900169216, 'Political', '1', '中共党员', 1.00, '', 1399985191002447872, '2022-02-22 15:39:54', 1399985191002447872, '2022-02-22 15:39:54', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1496027004560945152, 1496024933900169216, 'Political', '2', '中共预备党员', 2.00, '', 1399985191002447872, '2022-02-22 15:40:07', 1399985191002447872, '2022-02-22 15:40:07', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1496027039264616448, 1496024933900169216, 'Political', '3', '共青团员', 3.00, '', 1399985191002447872, '2022-02-22 15:40:16', 1399985191002447872, '2022-02-22 15:40:16', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1496027077550223360, 1496024933900169216, 'Political', '4', '民革党员', 4.00, '', 1399985191002447872, '2022-02-22 15:40:25', 1399985191002447872, '2022-02-22 15:40:25', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1496027123461074944, 1496024933900169216, 'Political', '5', '民盟盟员', 5.00, '', 1399985191002447872, '2022-02-22 15:40:36', 1399985191002447872, '2022-02-22 15:40:36', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1496027197566038016, 1496024933900169216, 'Political', '6', '民建会员', 6.00, '', 1399985191002447872, '2022-02-22 15:40:53', 1399985191002447872, '2022-02-22 15:40:53', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1496027234803068928, 1496024933900169216, 'Political', '7', '民进会员', 7.00, '', 1399985191002447872, '2022-02-22 15:41:02', 1399985191002447872, '2022-02-22 15:41:02', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1496027272941875200, 1496024933900169216, 'Political', '8', '农工党党员', 8.00, '', 1399985191002447872, '2022-02-22 15:41:11', 1399985191002447872, '2022-02-22 15:41:11', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1496027306634719232, 1496024933900169216, 'Political', '9', '致公党党员', 9.00, '', 1399985191002447872, '2022-02-22 15:41:19', 1399985191002447872, '2022-02-22 15:41:19', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1496027369796743168, 1496024933900169216, 'Political', '10', '九三学社社员', 10.00, '', 1399985191002447872, '2022-02-22 15:41:34', 1399985191002447872, '2022-02-22 15:41:35', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1496027408141070336, 1496024933900169216, 'Political', '11', '台盟盟员', 11.00, '', 1399985191002447872, '2022-02-22 15:41:44', 1399985191002447872, '2022-02-22 15:41:44', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1496027456849522688, 1496024933900169216, 'Political', '12', '无党派人士', 12.00, '', 1399985191002447872, '2022-02-22 15:41:55', 1399985191002447872, '2022-02-22 15:41:55', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1496027516639326208, 1496024933900169216, 'Political', '13', '群众', 13.00, '', 1399985191002447872, '2022-02-22 15:42:09', 1399985191002447872, '2022-02-22 15:42:10', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1496780500696539136, 1496722894707728384, 'PayChannel', '1', '支付宝', 1.00, '', 1399985191002447872, '2022-02-24 17:34:15', 1399985191002447872, '2022-03-08 11:02:59', 0, 3);
INSERT INTO `sys_dict_item` VALUES (1496780576818962432, 1496722894707728384, 'PayChannel', '2', '微信', 2.00, '', 1399985191002447872, '2022-02-24 17:34:33', 1399985191002447872, '2022-03-08 11:04:00', 0, 2);
INSERT INTO `sys_dict_item` VALUES (1496780712492113920, 1496723207565058048, 'PayWay', '1', 'wap支付', 0.00, '', 1399985191002447872, '2022-02-24 17:35:05', 1399985191002447872, '2022-02-24 17:35:05', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1496780757647990784, 1496723207565058048, 'PayWay', '2', '应用支付', 0.00, '', 1399985191002447872, '2022-02-24 17:35:16', 1399985191002447872, '2022-02-24 17:35:16', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1496780799691694080, 1496723207565058048, 'PayWay', '3', 'web支付', 0.00, '', 1399985191002447872, '2022-02-24 17:35:26', 1399985191002447872, '2022-02-24 17:35:26', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1496780838451257344, 1496723207565058048, 'PayWay', '4', '二维码扫码支付', 0.00, '', 1399985191002447872, '2022-02-24 17:35:35', 1399985191002447872, '2022-02-24 17:35:35', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1496780876388737024, 1496723207565058048, 'PayWay', '5', '付款码支付', 0.00, '', 1399985191002447872, '2022-02-24 17:35:44', 1399985191002447872, '2022-02-24 17:35:44', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1497141630803566592, 1497140849954185216, 'PayStatus', '3', '支付取消', 0.00, '', 1399985191002447872, '2022-02-25 17:29:15', 1399985191002447872, '2022-02-25 17:29:15', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1497141652379066368, 1497140849954185216, 'PayStatus', '2', '失败', 0.00, '', 1399985191002447872, '2022-02-25 17:29:20', 1399985191002447872, '2022-02-25 17:29:20', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1497141681915355136, 1497140849954185216, 'PayStatus', '1', '成功', 0.00, '', 1399985191002447872, '2022-02-25 17:29:27', 1399985191002447872, '2022-02-25 17:29:27', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1497141712743489536, 1497140849954185216, 'PayStatus', '0', '支付中', 0.00, '', 1399985191002447872, '2022-02-25 17:29:35', 1399985191002447872, '2022-02-25 17:29:35', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1497506810439892992, 1497140849954185216, 'PayStatus', '4', '部分退款', 1.00, '部分退款', 1399985191002447872, '2022-02-26 17:40:21', 1399985191002447872, '2022-03-04 21:22:46', 0, 7);
INSERT INTO `sys_dict_item` VALUES (1499367587857694720, 1497140849954185216, 'PayStatus', '5', '已退款', 2.00, '完全退款', 1399985191002447872, '2022-03-03 20:54:25', 1399985191002447872, '2022-03-04 21:22:49', 0, 3);
INSERT INTO `sys_dict_item` VALUES (1501030031432847360, 1496722894707728384, 'PayChannel', '3', '云闪付', 3.00, '', 1399985191002447872, '2022-03-08 11:00:22', 1399985191002447872, '2022-03-08 11:04:07', 0, 2);
INSERT INTO `sys_dict_item` VALUES (1501030073489133568, 1496722894707728384, 'PayChannel', '4', '现金', 4.00, '', 1399985191002447872, '2022-03-08 11:00:32', 1399985191002447872, '2022-03-08 11:04:10', 0, 2);
INSERT INTO `sys_dict_item` VALUES (1501030108314439680, 1496722894707728384, 'PayChannel', '5', '钱包', 5.00, '', 1399985191002447872, '2022-03-08 11:00:40', 1399985191002447872, '2022-03-08 11:04:14', 0, 2);
INSERT INTO `sys_dict_item` VALUES (1501031490513768448, 1501031423232937984, 'AsyncPayChannel', '3', '云闪付', 0.00, '', 1399985191002447872, '2022-03-08 11:06:10', 1399985191002447872, '2022-03-08 11:06:10', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1501031518208757760, 1501031423232937984, 'AsyncPayChannel', '2', '微信', 0.00, '', 1399985191002447872, '2022-03-08 11:06:16', 1399985191002447872, '2022-03-08 11:06:16', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1501031544360243200, 1501031423232937984, 'AsyncPayChannel', '1', '支付宝', 0.00, '', 1399985191002447872, '2022-03-08 11:06:23', 1399985191002447872, '2022-03-08 11:06:23', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1502276841057005568, 1502276739978473472, 'WalletStatus', '2', '禁用', 0.00, '', 1399985191002447872, '2022-03-11 21:34:45', 1399985191002447872, '2022-03-11 21:34:45', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1502276862108217344, 1502276739978473472, 'WalletStatus', '1', '正常', 0.00, '', 1399985191002447872, '2022-03-11 21:34:50', 1399985191002447872, '2022-03-11 21:34:50', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1502624716257456128, 1502624515799085056, 'WalletLogType', '1', '开通', 0.00, '', 1399985191002447872, '2022-03-12 20:37:04', 1399985191002447872, '2022-03-12 20:37:04', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1502624931978899456, 1502624515799085056, 'WalletLogType', '2', '主动充值', 0.00, '', 1399985191002447872, '2022-03-12 20:37:56', 1399985191002447872, '2022-03-12 20:37:56', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1502624956209393664, 1502624515799085056, 'WalletLogType', '3', '自动充值', 0.00, '', 1399985191002447872, '2022-03-12 20:38:02', 1399985191002447872, '2022-03-12 20:38:02', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1502625014719934464, 1502624515799085056, 'WalletLogType', '4', '余额变动', 0.00, '', 1399985191002447872, '2022-03-12 20:38:16', 1399985191002447872, '2022-03-12 20:38:16', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1502625053097816064, 1502624515799085056, 'WalletLogType', '5', '支付', 0.00, '', 1399985191002447872, '2022-03-12 20:38:25', 1399985191002447872, '2022-03-12 20:38:25', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1502625091639275520, 1502624515799085056, 'WalletLogType', '6', '系统扣除余额', 0.00, '', 1399985191002447872, '2022-03-12 20:38:34', 1399985191002447872, '2022-03-12 20:38:34', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1502625123725701120, 1502624515799085056, 'WalletLogType', '7', '退款', 0.00, '', 1399985191002447872, '2022-03-12 20:38:42', 1399985191002447872, '2022-03-12 20:38:42', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1502625783145787392, 1502624632392347648, 'WalletLogOperation', '1', '系统操作', 0.00, '', 1399985191002447872, '2022-03-12 20:41:19', 1399985191002447872, '2022-03-12 20:41:19', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1502625814837948416, 1502624632392347648, 'WalletLogOperation', '2', '管理员操作', 0.00, '', 1399985191002447872, '2022-03-12 20:41:26', 1399985191002447872, '2022-03-12 20:41:26', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1502625850355314688, 1502624632392347648, 'WalletLogOperation', '3', '用户操作', 0.00, '', 1399985191002447872, '2022-03-12 20:41:35', 1399985191002447872, '2022-03-12 20:41:35', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1503340241493135360, 1503340128037212160, 'VoucherStatus', '1', '启用', 0.00, '', 1399985191002447872, '2022-03-14 20:00:19', 1399985191002447872, '2022-03-14 20:00:19', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1503340326645895168, 1503340128037212160, 'VoucherStatus', '2', '停用', 0.00, '', 1399985191002447872, '2022-03-14 20:00:39', 1399985191002447872, '2022-03-14 20:00:39', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1505112357976612864, 1496722894707728384, 'PayChannel', '6', '储值卡', 0.00, '', 1399985191002447872, '2022-03-19 17:22:04', 1399985191002447872, '2022-03-19 17:22:04', 0, 0);

-- ----------------------------
-- Table structure for sys_key_value
-- ----------------------------
DROP TABLE IF EXISTS `sys_key_value`;
CREATE TABLE `sys_key_value`  (
  `id` bigint(20) NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数键名',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数值',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  `version` int(8) NOT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'kv存储' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_key_value
-- ----------------------------

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数名称',
  `param_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数键名',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数值',
  `type` int(4) NULL DEFAULT NULL COMMENT '参数类型',
  `internal` bit(1) NOT NULL COMMENT '内置参数',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  `version` int(8) NOT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统参数配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_param
-- ----------------------------
INSERT INTO `sys_param` VALUES (1452842684284891136, '测试', 'test.v1', '123', 1, b'0', NULL, 1399985191002447872, '2021-10-26 11:41:03', 1399985191002447872, '2021-10-26 11:41:03', 0, 0);
INSERT INTO `sys_param` VALUES (1500338438182789120, '结算台聚合支付请求地址', 'CashierAggregateUrl', 'http://pay1.bootx.cn/cashier/aggregatePay?key=', 1, b'1', '', 1399985191002447872, '2022-03-06 13:12:13', 1399985191002447872, '2022-03-06 13:47:55', 0, 2);

SET FOREIGN_KEY_CHECKS = 1;
