/*
 Navicat Premium Data Transfer

 Source Server         : bootx
 Source Server Type    : MySQL
 Source Schema         : bootx-platform-demo

 Target Server Type    : MySQL

 Date: 06/03/2022 14:56:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限显示demo' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo_data_perm
-- ----------------------------
INSERT INTO `demo_data_perm` VALUES (1495969849707220992, '33', 'xxm', '444', 1399985191002447872, '2022-02-22 11:53:01', 1399985191002447872, '2022-02-22 11:53:01', 0, 0);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '超级查询演示' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo_super_query
-- ----------------------------
INSERT INTO `demo_super_query` VALUES (1496046463434567680, '小小明', 18, b'1', '1998-01-23', '08:30:00', '2022-02-22 16:57:27', '13', '这是备注', 1399985191002447872, '2022-02-22 16:57:27', 1399985191002447872, '2022-02-22 17:03:34', 1, 1);
INSERT INTO `demo_super_query` VALUES (1496372341213433856, '关羽', 52, b'1', '2000-02-23', '14:31:36', '2022-02-23 14:32:22', '1', '', 1399985191002447872, '2022-02-23 14:32:22', 1399985191002447872, '2022-02-23 14:32:22', 0, 1);
INSERT INTO `demo_super_query` VALUES (1496372489909899264, '张飞', 54, b'0', '1996-02-11', '08:00:00', '2022-02-23 14:32:58', '7', '备注', 1399985191002447872, '2022-02-23 14:32:58', 1399985191002447872, '2022-02-23 14:32:58', 0, 1);
INSERT INTO `demo_super_query` VALUES (1496372766427779072, '梁冀', 38, b'1', '1958-02-08', '08:30:00', '2022-02-23 14:34:03', '1', '', 1399985191002447872, '2022-02-23 14:34:03', 1399985191002447872, '2022-02-23 14:34:03', 0, 1);
INSERT INTO `demo_super_query` VALUES (1496373512871284736, '刘备', 108, b'0', '1993-11-12', '09:30:10', '2022-02-23 14:37:01', '2', '刘羽', 1399985191002447872, '2022-02-23 14:37:01', 1414143554414059520, '2022-03-02 17:52:59', 1, 1);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '类目' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '类目属性定义' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品spu' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品打包关系' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品sku' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'sku属性' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'sku打包关系' ROW_FORMAT = Dynamic;

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
  INDEX `inx_creator`(`creator`) USING BTREE COMMENT '创建人索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '认证终端' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iam_client
-- ----------------------------
INSERT INTO `iam_client` VALUES (1430430071299207168, 'pc', 'pc浏览器', 3600, b'0', b'1', 'pc浏览器', 1399985191002447872, '2021-08-25 15:21:20', 1414143554414059520, '2022-02-23 20:26:47', 17, 0);
INSERT INTO `iam_client` VALUES (1430478946919653376, 'miniApp', '微信小程序', 99999, b'1', b'1', NULL, 1399985191002447872, '2021-08-25 18:35:33', 1399985191002447872, '2021-08-25 18:35:33', 2, 0);
INSERT INTO `iam_client` VALUES (1435138582839009280, 'phone', '手机短信登录', 3600, b'1', b'1', '', 1399985191002447872, '2021-09-07 15:11:16', 1399985191002447872, '2021-09-07 15:11:16', 2, 0);
INSERT INTO `iam_client` VALUES (1463147642346229760, '1', '加密:  hello', 5, b'1', b'1', '111', 1399985191002447872, '2021-11-23 22:09:17', 1399985191002447872, '2021-11-23 22:09:17', 9, 1);
INSERT INTO `iam_client` VALUES (1463417587776819200, '111', '222', 5, b'1', b'1', '', 0, '2021-11-24 16:01:57', 1399985191002447872, '2021-11-24 16:01:57', 0, 1);
INSERT INTO `iam_client` VALUES (1463421040452374528, '2', '5rWL6K+V', 5, b'1', b'1', '2', 0, '2021-11-24 16:15:40', 1399985191002447872, '2021-11-24 16:15:40', 3, 1);
INSERT INTO `iam_client` VALUES (1477655279548977152, '123', '测试终端', 5, b'1', b'1', '', 1435894470432456704, '2022-01-02 22:57:27', 1435894470432456704, '2022-01-02 22:57:27', 0, 1);
INSERT INTO `iam_client` VALUES (1477997877312593920, 'cs003', '测试部门数据权限', 5, b'1', b'1', '', 1477997602862505984, '2022-01-03 21:38:48', 1477997602862505984, '2022-01-03 21:38:49', 0, 1);
INSERT INTO `iam_client` VALUES (1477998021529542656, 'test001', '测试部门数据权限1', 5, b'1', b'1', '', 1477990832987361280, '2022-01-03 21:39:23', 1477990832987361280, '2022-01-03 21:39:23', 0, 1);
INSERT INTO `iam_client` VALUES (1477998472383668224, 'cs02', '测试个人权限', 5, b'1', b'1', '', 1477997391729631232, '2022-01-03 21:41:10', 1477997391729631232, '2022-01-03 21:41:10', 1, 1);
INSERT INTO `iam_client` VALUES (1479837292456513536, '12', '1', 5, b'1', b'1', '', 1399985191002447872, '2022-01-08 23:27:59', 1399985191002447872, '2022-01-08 23:28:07', 2, 1);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据范围权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iam_data_scope
-- ----------------------------
INSERT INTO `iam_data_scope` VALUES (1474706893178871808, 'self', '自身数据', 1, '只能查看自身范围的数据', 1399985191002447872, '2021-12-25 19:41:37', 1399985191002447872, '2021-12-25 19:41:37', 1, 0);
INSERT INTO `iam_data_scope` VALUES (1474717084985270272, 'user', '用户数据权限', 2, '用户数据权限', 1399985191002447872, '2021-12-25 20:22:07', 1399985191002447872, '2021-12-25 20:22:07', 0, 0);
INSERT INTO `iam_data_scope` VALUES (1474717160671485952, 'dept', '部门权限', 3, '', 1399985191002447872, '2021-12-25 20:22:25', 1399985191002447872, '2021-12-25 20:22:25', 0, 0);
INSERT INTO `iam_data_scope` VALUES (1474717276908232704, 'userAndDept', '用户和部门权限', 4, '', 1399985191002447872, '2021-12-25 20:22:52', 1399985191002447872, '2021-12-25 20:22:52', 0, 1);
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据范围部门关联配置' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据范围用户关联配置' ROW_FORMAT = Dynamic;

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
  INDEX `index_depart_parent_id`(`parent_id`) USING BTREE,
  INDEX `index_depart_depart_order`(`sort_no`) USING BTREE,
  INDEX `index_depart_org_code`(`org_code`) USING BTREE,
  INDEX `uniq_depart_org_code`(`org_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门组织机构表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限_菜单' ROW_FORMAT = Dynamic;

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
INSERT INTO `iam_perm_menu` VALUES (1450819607680991232, NULL, '第三方对接', 'social', '', b'0', 'branches', b'1', b'1', 'RouteView', NULL, '/social', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:42:04', 1399985191002447872, '2022-03-04 16:12:52', 2, 0);
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
INSERT INTO `iam_perm_menu` VALUES (1495969099987963904, 1495968302034210816, '数据权限', 'DemoDataPerm', NULL, b'0', '', b'0', b'0', 'demo/perm/DataPermDemoList', NULL, '/demo/data/perm', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-02-22 11:50:02', 1399985191002447872, '2022-02-22 11:50:52', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1496020308992143360, 1495968302034210816, '超级查询', 'SuperQuery', NULL, b'0', '', b'0', b'0', 'demo/query/SuperQueryDemoList', NULL, '/demo/query/super', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-02-22 15:13:31', 1399985191002447872, '2022-02-22 15:20:48', 1, 0);

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
  INDEX `inx_creator`(`creator`) USING BTREE COMMENT '创建人索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限_请求' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iam_perm_path
-- ----------------------------
INSERT INTO `iam_perm_path` VALUES (1472904371694968832, 'RoleMenuController#findButtonPermission', '获取按钮权限, 不包含菜单权限', 'GET', '/role/menu/findButtonPermission', '角色菜单权限关系', b'1', b'1', '角色菜单权限关系 获取按钮权限, 不包含菜单权限', 1435894470432456704, '2021-12-20 20:19:02.109000', 1399985191002447872, '2021-12-20 20:19:02.156000', b'1', 3);
INSERT INTO `iam_perm_path` VALUES (1472904372126982144, 'DingRobotSendController#sendLink', '测试发送link', 'POST', '/ding/robot/send/link', '钉钉机器人发送', b'1', b'1', '钉钉机器人发送 测试发送link', 1399985191002447872, '2021-12-20 20:19:02.211000', 1399985191002447872, '2021-12-20 20:19:02.249000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904372441554944, 'CouponTemplateController#findAll', '查询优惠券模板', 'POST', '/coupon/template/findAll', '优惠券模板', b'1', b'1', '优惠券模板 查询优惠券模板', 1399985191002447872, '2021-12-20 20:19:02.287000', 1399985191002447872, '2021-12-20 20:19:02.328000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904372798070784, 'DictionaryController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/dict/existsByCodeNotId', '字典', b'1', b'1', '字典 编码是否被使用(不包含自己)', 1399985191002447872, '2021-12-20 20:19:02.371000', 1399985191002447872, '2021-12-20 20:19:02.411000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904373150392320, 'MessageTemplateController#add', '添加', 'POST', '/message/template/add', '消息模板', b'1', b'1', '消息模板 添加', 1399985191002447872, '2021-12-20 20:19:02.455000', 1399985191002447872, '2021-12-20 20:19:02.493000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904373515296768, 'CategoryController#findAll', '获取所有类目', 'GET', '/category/all', '类目管理', b'1', b'1', '类目管理 获取所有类目', 1399985191002447872, '2021-12-20 20:19:02.542000', 1399985191002447872, '2021-12-20 20:19:02.578000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904373825675264, 'AuthAssistController#sendSmsCaptcha', '发送短信验证码', 'POST', '/auth/sendSmsCaptcha', '认证支撑接口', b'1', b'1', '认证支撑接口 发送短信验证码', 1399985191002447872, '2021-12-20 20:19:02.616000', 1399985191002447872, '2021-12-20 20:19:02.652000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904374215745536, 'MailConfigController#findById', '通过 id 获取指定邮箱配置', 'GET', '/mail/config/findById', '邮箱配置', b'1', b'1', '邮箱配置 通过 id 获取指定邮箱配置', 1399985191002447872, '2021-12-20 20:19:02.709000', 1399985191002447872, '2021-12-20 20:19:02.745000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904374521929728, 'PermPathController#add', '添加权限', 'POST', '/perm/path/add', '请求权限资源', b'1', b'1', '请求权限资源 添加权限', 1399985191002447872, '2021-12-20 20:19:02.782000', 1399985191002447872, '2021-12-20 20:19:02.822000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904374870056960, 'WalletController#activeWallet', '开通操作', 'POST', '/wallet/active', '钱包相关的接口', b'1', b'1', '钱包相关的接口 开通操作', 1399985191002447872, '2021-12-20 20:19:02.865000', 1399985191002447872, '2021-12-20 20:19:02.907000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904375226572800, 'WalletController#recharge', '充值操作', 'POST', '/wallet/recharge', '钱包相关的接口', b'1', b'1', '钱包相关的接口 充值操作', 1399985191002447872, '2021-12-20 20:19:02.950000', 1399985191002447872, '2021-12-20 20:19:03.006000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904375755055104, 'MailConfigController#existsByCode', '编码是否被使用', 'GET', '/mail/config/existsByCode', '邮箱配置', b'1', b'1', '邮箱配置 编码是否被使用', 1399985191002447872, '2021-12-20 20:19:03.076000', 1399985191002447872, '2021-12-20 20:19:03.121000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904376191262720, 'QueryConfigConfig#initQuery', '测试生成查询器', 'POST', '/query/config/initQuery', '查询器配置', b'1', b'1', '查询器配置 测试生成查询器', 1399985191002447872, '2021-12-20 20:19:03.180000', 1399985191002447872, '2021-12-20 20:19:03.242000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904376728133632, 'OrderRecommendController#findCoupon', '查询适用的优惠券', 'POST', '/order/recommend/findCoupon', '订单优惠选择与推荐', b'1', b'1', '订单优惠选择与推荐 查询适用的优惠券', 1399985191002447872, '2021-12-20 20:19:03.308000', 1399985191002447872, '2021-12-20 20:19:03.369000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904377281781760, 'GoodsSkuController#findByGoodsId', '根据goodsId查询', 'GET', '/sku/findByGoodsId', 'sku操作', b'1', b'1', 'sku操作 根据goodsId查询', 1399985191002447872, '2021-12-20 20:19:03.440000', 1399985191002447872, '2021-12-20 20:19:03.486000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904377638297600, 'DingRobotConfigController#page', '分页', 'GET', '/ding/robot/config/page', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 分页', 1399985191002447872, '2021-12-20 20:19:03.525000', 1399985191002447872, '2021-12-20 20:19:03.563000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904377957064704, 'DeptController#deleteAndChildren', '强制级联删除', 'DELETE', '/dept/deleteAndChildren', '部门管理', b'1', b'1', '部门管理 强制级联删除', 1399985191002447872, '2021-12-20 20:19:03.601000', 1399985191002447872, '2021-12-20 20:19:03.642000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904378300997632, 'UserInfoController#existsEmail', '邮箱是否被使用(不包含自己)', 'GET', '/user/existsEmailNotId', '用户管理', b'1', b'1', '用户管理 邮箱是否被使用(不包含自己)', 1399985191002447872, '2021-12-20 20:19:03.683000', 1399985191002447872, '2021-12-20 20:19:03.731000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904378691067904, 'AppVersionController#check', '检查更新', 'POST', '/app/version/check', 'app版本管理', b'1', b'1', 'app版本管理 检查更新', 1399985191002447872, '2021-12-20 20:19:03.776000', 1399985191002447872, '2021-12-20 20:19:03.818000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904379093721088, 'OrderFindController#findByUser', '根据用户获取订单', 'GET', '/order/findByUser', '订单查询', b'1', b'1', '订单查询 根据用户获取订单', 1399985191002447872, '2021-12-20 20:19:03.872000', 1399985191002447872, '2021-12-20 20:19:03.909000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904379609620480, 'RoleController#findById', '通过ID查询角色', 'GET', '/role/findById', '角色管理', b'1', b'1', '角色管理 通过ID查询角色', 1399985191002447872, '2021-12-20 20:19:03.995000', 1399985191002447872, '2021-12-20 20:19:04.031000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904379924193280, 'AppVersionController#delete', '删除', 'DELETE', '/app/version/delete', 'app版本管理', b'1', b'1', 'app版本管理 删除', 1399985191002447872, '2021-12-20 20:19:04.070000', 1399985191002447872, '2021-12-20 20:19:04.112000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904380314263552, 'DictionaryController#add', '添加', 'POST', '/dict/add', '字典', b'1', b'1', '字典 添加', 1399985191002447872, '2021-12-20 20:19:04.163000', 1399985191002447872, '2021-12-20 20:19:04.266000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904380951797760, 'UserDeptController#findDeptIdsByUser', '根据用户ID获取到部门id集合', 'GET', '/user/dept/findDeptIdsByUser', '用户部门关联关系', b'1', b'1', '用户部门关联关系 根据用户ID获取到部门id集合', 1399985191002447872, '2021-12-20 20:19:04.315000', 1399985191002447872, '2021-12-20 20:19:04.363000', b'1', 0);
INSERT INTO `iam_perm_path` VALUES (1472904381316702208, 'ClientController#add', '添加终端', 'POST', '/client/add', '终端管理', b'1', b'1', '终端管理 添加终端', 1399985191002447872, '2021-12-20 20:19:04.402000', 1399985191002447872, '2021-12-20 20:19:04.440000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904381656440832, 'AppVersionController#add', '添加', 'POST', '/app/version/add', 'app版本管理', b'1', b'1', 'app版本管理 添加', 1399985191002447872, '2021-12-20 20:19:04.483000', 1399985191002447872, '2021-12-20 20:19:04.524000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904382033928192, 'AlipayConfigController#update', '更新', 'POST', '/alipay/update', '支付宝配置', b'1', b'1', '支付宝配置 更新', 1399985191002447872, '2021-12-20 20:19:04.573000', 1399985191002447872, '2021-12-20 20:19:04.617000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904382365278208, 'WalletController#getWallet', '根据钱包ID查询钱包', 'GET', '/wallet/getById', '钱包相关的接口', b'1', b'1', '钱包相关的接口 根据钱包ID查询钱包', 1399985191002447872, '2021-12-20 20:19:04.652000', 1399985191002447872, '2021-12-20 20:19:04.690000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904382675656704, 'CategoryController#getCategory', '通过 id 获取指定类目', 'GET', '/category/id', '类目管理', b'1', b'1', '类目管理 通过 id 获取指定类目', 1399985191002447872, '2021-12-20 20:19:04.726000', 1399985191002447872, '2021-12-20 20:19:04.768000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904383036366848, 'PermMenuController#add', '添加菜单权限', 'POST', '/perm/menu/add', '菜单权限资源', b'1', b'1', '菜单权限资源 添加菜单权限', 1399985191002447872, '2021-12-20 20:19:04.812000', 1399985191002447872, '2021-12-20 20:19:04.849000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904383350939648, 'SwaggerWelcomeWebMvc#redirectToUi', '', 'GET', '/swagger-ui.html', NULL, b'1', b'1', NULL, 1399985191002447872, '2021-12-20 20:19:04.887000', 1399985191002447872, '2021-12-20 20:19:04.926000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904383673901056, 'DictionaryItemController#existsByCode', '编码是否被使用', 'GET', '/dict/item/existsByCode', '字典项', b'1', b'1', '字典项 编码是否被使用', 1399985191002447872, '2021-12-20 20:19:04.964000', 1399985191002447872, '2021-12-20 20:19:05.001000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904383984279552, 'StrategyController#add', '添加策略', 'POST', '/strategy/add', '策略定义', b'1', b'1', '策略定义 添加策略', 1399985191002447872, '2021-12-20 20:19:05.038000', 1399985191002447872, '2021-12-20 20:19:05.072000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904384319823872, 'UserAdminController#getUserInfoWhole', '查询用户详情', 'GET', '/user/admin/getUserInfoWhole', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 查询用户详情', 1399985191002447872, '2021-12-20 20:19:05.118000', 1399985191002447872, '2021-12-20 20:19:05.157000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904384651173888, 'RoleMenuController#save', '保存请求权限关系', 'POST', '/role/menu/save', '角色菜单权限关系', b'1', b'1', '角色菜单权限关系 保存请求权限关系', 1399985191002447872, '2021-12-20 20:19:05.197000', 1399985191002447872, '2021-12-20 20:19:05.247000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904385032855552, 'GoodsController#add', '添加商品', 'POST', '/goods/add', '商品管理', b'1', b'1', '商品管理 添加商品', 1399985191002447872, '2021-12-20 20:19:05.288000', 1399985191002447872, '2021-12-20 20:19:05.326000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904385360011264, 'GoodsSkuController#add', '添加商品sku', 'POST', '/sku/add', 'sku操作', b'1', b'1', 'sku操作 添加商品sku', 1399985191002447872, '2021-12-20 20:19:05.366000', 1399985191002447872, '2021-12-20 20:19:05.417000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904385737498624, 'UserInfoController#updatePassword', '修改密码', 'POST', '/user/updatePassword', '用户管理', b'1', b'1', '用户管理 修改密码', 1399985191002447872, '2021-12-20 20:19:05.456000', 1399985191002447872, '2021-12-20 20:19:05.494000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904386098208768, 'MailConfigController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/mail/config/existsByCodeNotId', '邮箱配置', b'1', b'1', '邮箱配置 编码是否被使用(不包含自己)', 1399985191002447872, '2021-12-20 20:19:05.542000', 1399985191002447872, '2021-12-20 20:19:05.576000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904386396004352, 'ClientController#findById', '通过ID查询终端', 'GET', '/client/findById', '终端管理', b'1', b'1', '终端管理 通过ID查询终端', 1399985191002447872, '2021-12-20 20:19:05.613000', 1399985191002447872, '2021-12-20 20:19:05.648000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904386710577152, 'OrderPreviewController#previewOrderPriceNoCheck', '预览价格(手动无检查)', 'POST', '/order/preview/previewOrderPriceNoCheck', '订单计算', b'1', b'1', '订单计算 预览价格(手动无检查)', 1399985191002447872, '2021-12-20 20:19:05.688000', 1399985191002447872, '2021-12-20 20:19:05.750000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904387226476544, 'UserInfoController#existsUsername', '账号是否被使用', 'GET', '/user/existsUsername', '用户管理', b'1', b'1', '用户管理 账号是否被使用', 1399985191002447872, '2021-12-20 20:19:05.811000', 1399985191002447872, '2021-12-20 20:19:05.850000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904387532660736, 'SwaggerConfigResource#openapiJson', '', 'GET', '/v3/api-docs/swagger-config', NULL, b'1', b'1', NULL, 1399985191002447872, '2021-12-20 20:19:05.884000', 1399985191002447872, '2021-12-20 20:19:05.918000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904387838844928, 'PermPathController#findAll', '权限列表', 'GET', '/perm/path/findAll', '请求权限资源', b'1', b'1', '请求权限资源 权限列表', 1399985191002447872, '2021-12-20 20:19:05.957000', 1399985191002447872, '2021-12-20 20:19:05.994000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904388157612032, 'PaymentController#findPayTypeInfoById', '根据id获取订单支付方式', 'GET', '/payment/findPayTypeInfoById', '支付记录', b'1', b'1', '支付记录 根据id获取订单支付方式', 1399985191002447872, '2021-12-20 20:19:06.033000', 1399985191002447872, '2021-12-20 20:19:06.077000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904388509933568, 'DictionaryItemController#findAll', '获取全部字典项', 'GET', '/dict/item/findAll', '字典项', b'1', b'1', '字典项 获取全部字典项', 1399985191002447872, '2021-12-20 20:19:06.117000', 1399985191002447872, '2021-12-20 20:19:06.172000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904388891615232, 'SiteMessageController#read', '标为已读', 'POST', '/site/message/read', '站内信', b'1', b'1', '站内信 标为已读', 1399985191002447872, '2021-12-20 20:19:06.208000', 1399985191002447872, '2021-12-20 20:19:06.243000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904389206188032, 'UserAdminController#getByEmail', '根据邮箱查询用户', 'GET', '/user/admin/getByEmail', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 根据邮箱查询用户', 1399985191002447872, '2021-12-20 20:19:06.283000', 1399985191002447872, '2021-12-20 20:19:06.322000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904389571092480, 'RoleController#update', '修改角色（返回角色对象）', 'POST', '/role/update', '角色管理', b'1', b'1', '角色管理 修改角色（返回角色对象）', 1399985191002447872, '2021-12-20 20:19:06.371000', 1399985191002447872, '2021-12-20 20:19:06.410000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904389898248192, 'InventoryController#increaseInventory', '增补指定 SKU 的可售库存， 扣减对应售出', 'POST', '/inventory/increaseInventory', '库存操作', b'1', b'1', '库存操作 增补指定 SKU 的可售库存， 扣减对应售出', 1399985191002447872, '2021-12-20 20:19:06.448000', 1399985191002447872, '2021-12-20 20:19:06.517000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904390372204544, 'LoginLogController#findById', '获取', 'GET', '/log/login/findById', '登录日志', b'1', b'1', '登录日志 获取', 1399985191002447872, '2021-12-20 20:19:06.561000', 1399985191002447872, '2021-12-20 20:19:06.597000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904390682583040, 'GoodsController#getDetails', '查询包含sku的详情', 'GET', '/goods/getDetails', '商品管理', b'1', b'1', '商品管理 查询包含sku的详情', 1399985191002447872, '2021-12-20 20:19:06.635000', 1399985191002447872, '2021-12-20 20:19:06.670000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904391018127360, 'GoodsController#findById', '查询包含商品信息', 'GET', '/goods/findById', '商品管理', b'1', b'1', '商品管理 查询包含商品信息', 1399985191002447872, '2021-12-20 20:19:06.715000', 1399985191002447872, '2021-12-20 20:19:06.760000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904391445946368, 'DingRobotConfigController#delete', '删除', 'DELETE', '/ding/robot/config/delete', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 删除', 1399985191002447872, '2021-12-20 20:19:06.817000', 1399985191002447872, '2021-12-20 20:19:06.851000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904391756324864, 'GoodsSkuController#getById', '获取sku', 'GET', '/sku/get', 'sku操作', b'1', b'1', 'sku操作 获取sku', 1399985191002447872, '2021-12-20 20:19:06.891000', 1399985191002447872, '2021-12-20 20:19:06.926000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904392054120448, 'PaymentController#findByBusinessId', '根据businessId获取列表', 'GET', '/payment/findByBusinessId', '支付记录', b'1', b'1', '支付记录 根据businessId获取列表', 1399985191002447872, '2021-12-20 20:19:06.962000', 1399985191002447872, '2021-12-20 20:19:07.002000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904392393859072, 'InventoryController#reduceInventory', '扣减指定 SKU 的预占库存，增加对应售出', 'POST', '/inventory/reduceInventory', '库存操作', b'1', b'1', '库存操作 扣减指定 SKU 的预占库存，增加对应售出', 1399985191002447872, '2021-12-20 20:19:07.043000', 1399985191002447872, '2021-12-20 20:19:07.079000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904392737792000, 'OrderPreviewController#previewOrderPrice', '预览价格(手动)', 'POST', '/order/preview/previewOrderPrice', '订单计算', b'1', b'1', '订单计算 预览价格(手动)', 1399985191002447872, '2021-12-20 20:19:07.125000', 1399985191002447872, '2021-12-20 20:19:07.169000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904393123667968, 'PayController#cancelByPaymentId', '取消支付(支付id)', 'POST', '/uni_pay/cancelByPaymentId', '统一支付', b'1', b'1', '统一支付 取消支付(支付id)', 1399985191002447872, '2021-12-20 20:19:07.217000', 1399985191002447872, '2021-12-20 20:19:07.254000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904393429852160, 'DingRobotConfigController#add', '新增机器人配置', 'POST', '/ding/robot/config/add', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 新增机器人配置', 1399985191002447872, '2021-12-20 20:19:07.290000', 1399985191002447872, '2021-12-20 20:19:07.326000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904393769590784, 'AlipayConfigController#findById', '根据Id查询', 'GET', '/alipay/findById', '支付宝配置', b'1', b'1', '支付宝配置 根据Id查询', 1399985191002447872, '2021-12-20 20:19:07.371000', 1399985191002447872, '2021-12-20 20:19:07.410000', b'0', 3);
INSERT INTO `iam_perm_path` VALUES (1472904394155466752, 'UserInfoController#existsPhone', '手机号是否被使用(不包含自己)', 'GET', '/user/existsPhoneNotId', '用户管理', b'1', b'1', '用户管理 手机号是否被使用(不包含自己)', 1399985191002447872, '2021-12-20 20:19:07.463000', 1399985191002447872, '2021-12-20 20:19:07.515000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904394524565504, 'CouponTemplateController#get', '优惠券模板详情', 'POST', '/coupon/template/get/{id}', '优惠券模板', b'1', b'1', '优惠券模板 优惠券模板详情', 1399985191002447872, '2021-12-20 20:19:07.551000', 1399985191002447872, '2021-12-20 20:19:07.592000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904394868498432, 'PermPathController#update', '更新权限', 'POST', '/perm/path/update', '请求权限资源', b'1', b'1', '请求权限资源 更新权限', 1399985191002447872, '2021-12-20 20:19:07.633000', 1399985191002447872, '2021-12-20 20:19:07.669000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904395204042752, 'PayNotifyRecordController#findById', '根据id查询', 'GET', '/notify/record/findById', '支付回调记录', b'1', b'1', '支付回调记录 根据id查询', 1399985191002447872, '2021-12-20 20:19:07.713000', 1399985191002447872, '2021-12-20 20:19:07.756000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904395552169984, 'AlipayConfigController#setUpActivity', '启用指定的支付宝配置', 'POST', '/alipay/setUpActivity', '支付宝配置', b'1', b'1', '支付宝配置 启用指定的支付宝配置', 1399985191002447872, '2021-12-20 20:19:07.796000', 1399985191002447872, '2021-12-20 20:19:07.849000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904395963211776, 'SiteMessageController#send', '发送站内信', 'POST', '/site/message/send', '站内信', b'1', b'1', '站内信 发送站内信', 1399985191002447872, '2021-12-20 20:19:07.894000', 1399985191002447872, '2021-12-20 20:19:07.929000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904396269395968, 'InventoryController#reduceSoldAndCapacity', '扣减指定 SKU 的售出库存并减少总库存', 'POST', '/inventory/reduceSoldAndCapacity', '库存操作', b'1', b'1', '库存操作 扣减指定 SKU 的售出库存并减少总库存', 1399985191002447872, '2021-12-20 20:19:07.967000', 1399985191002447872, '2021-12-20 20:19:08.002000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904396634300416, 'SystemParamController#update', '更新', 'POST', '/system/param/update', '系统参数', b'1', b'1', '系统参数 更新', 1399985191002447872, '2021-12-20 20:19:08.054000', 1399985191002447872, '2021-12-20 20:19:08.094000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904396957261824, 'TestController#hello', '测试', 'GET', '/test/hello', '测试控制器', b'1', b'1', '测试控制器 测试', 1399985191002447872, '2021-12-20 20:19:08.131000', 1399985191002447872, '2021-12-20 20:19:08.167000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904397288611840, 'MailConfigController#findAll', '获取所有邮箱配置', 'GET', '/mail/config/findAll', '邮箱配置', b'1', b'1', '邮箱配置 获取所有邮箱配置', 1399985191002447872, '2021-12-20 20:19:08.210000', 1399985191002447872, '2021-12-20 20:19:08.248000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904397628350464, 'RoleMenuController#findMenuTree', '获取菜单树, 不包含按钮权限', 'GET', '/role/menu/findMenuTree', '角色菜单权限关系', b'1', b'1', '角色菜单权限关系 获取菜单树, 不包含按钮权限', 1399985191002447872, '2021-12-20 20:19:08.291000', 1399985191002447872, '2021-12-20 20:19:08.327000', b'1', 0);
INSERT INTO `iam_perm_path` VALUES (1472904397997449216, 'MessageTemplateController#rendering', '渲染模板', 'GET', '/message/template/rendering', '消息模板', b'1', b'1', '消息模板 渲染模板', 1399985191002447872, '2021-12-20 20:19:08.379000', 1399985191002447872, '2021-12-20 20:19:08.414000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904398316216320, 'MessageTemplateController#page', '分页', 'GET', '/message/template/page', '消息模板', b'1', b'1', '消息模板 分页', 1399985191002447872, '2021-12-20 20:19:08.455000', 1399985191002447872, '2021-12-20 20:19:08.497000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904398634983424, 'RolePathController#save', '保存角色权限关联关系', 'POST', '/role/path/save', '角色请求权限消息关系', b'1', b'1', '角色请求权限消息关系 保存角色权限关联关系', 1399985191002447872, '2021-12-20 20:19:08.532000', 1399985191002447872, '2021-12-20 20:19:08.575000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904398995693568, 'PaymentController#findByUser', '根据userId获取列表', 'GET', '/payment/findByUser', '支付记录', b'1', b'1', '支付记录 根据userId获取列表', 1399985191002447872, '2021-12-20 20:19:08.617000', 1399985191002447872, '2021-12-20 20:19:08.658000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904399348015104, 'ClientController#findAll', '查询所有的终端', 'GET', '/client/findAll', '终端管理', b'1', b'1', '终端管理 查询所有的终端', 1399985191002447872, '2021-12-20 20:19:08.701000', 1399985191002447872, '2021-12-20 20:19:08.735000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904399645810688, 'ClientController#update', '修改终端（返回终端对象）', 'POST', '/client/update', '终端管理', b'1', b'1', '终端管理 修改终端（返回终端对象）', 1399985191002447872, '2021-12-20 20:19:08.772000', 1399985191002447872, '2021-12-20 20:19:08.844000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904400182681600, 'SystemParamController#add', '添加', 'POST', '/system/param/add', '系统参数', b'1', b'1', '系统参数 添加', 1399985191002447872, '2021-12-20 20:19:08.900000', 1399985191002447872, '2021-12-20 20:19:08.961000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904400614694912, 'ClientController#findByCode', '通过code查询终端', 'GET', '/client/findByCode', '终端管理', b'1', b'1', '终端管理 通过code查询终端', 1399985191002447872, '2021-12-20 20:19:09.003000', 1399985191002447872, '2021-12-20 20:19:09.040000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904400925073408, 'UserSocialLoginController#findById', '获取详情', 'POST', '/user/social/findById', '用户三方登录管理', b'1', b'1', '用户三方登录管理 获取详情', 1399985191002447872, '2021-12-20 20:19:09.077000', 1399985191002447872, '2021-12-20 20:19:09.113000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904401260617728, 'RoleController#existsByCode', '编码是否被使用', 'GET', '/role/existsByCode', '角色管理', b'1', b'1', '角色管理 编码是否被使用', 1399985191002447872, '2021-12-20 20:19:09.157000', 1399985191002447872, '2021-12-20 20:19:09.192000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904401575190528, 'RoleMenuController#findMenuAndButtonPermission', '获取菜单和按钮权限', 'GET', '/role/menu/findMenuAndButtonPermission', '角色菜单权限关系', b'1', b'1', '角色菜单权限关系 获取菜单和按钮权限', 1399985191002447872, '2021-12-20 20:19:09.232000', 1399985191002447872, '2021-12-20 20:19:09.271000', b'1', 0);
INSERT INTO `iam_perm_path` VALUES (1472904401923317760, 'UserInfoController#existsUsername', '账号是否被使用(不包含自己)', 'GET', '/user/existsUsernameNotId', '用户管理', b'1', b'1', '用户管理 账号是否被使用(不包含自己)', 1399985191002447872, '2021-12-20 20:19:09.315000', 1399985191002447872, '2021-12-20 20:19:09.352000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904402242084864, 'MailConfigController#delete', '删除', 'DELETE', '/mail/config/delete', '邮箱配置', b'1', b'1', '邮箱配置 删除', 1399985191002447872, '2021-12-20 20:19:09.391000', 1399985191002447872, '2021-12-20 20:19:09.437000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904402598600704, 'OrderRecommendController#findActivity', '查询适用的活动', 'POST', '/order/recommend/findActivity', '订单优惠选择与推荐', b'1', b'1', '订单优惠选择与推荐 查询适用的活动', 1399985191002447872, '2021-12-20 20:19:09.476000', 1399985191002447872, '2021-12-20 20:19:09.523000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904402963505152, 'MessageTemplateController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/message/template/existsByCodeNotId', '消息模板', b'1', b'1', '消息模板 编码是否被使用(不包含自己)', 1399985191002447872, '2021-12-20 20:19:09.563000', 1399985191002447872, '2021-12-20 20:19:09.601000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904403290660864, 'UserDeptController#saveAndUpdate', '给用户分配部门', 'POST', '/user/dept/saveAndUpdate', '用户部门关联关系', b'1', b'1', '用户部门关联关系 给用户分配部门', 1399985191002447872, '2021-12-20 20:19:09.641000', 1399985191002447872, '2021-12-20 20:19:09.681000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904403638788096, 'QuartzJobController#judgeJobClass', '判断是否是定时任务类', 'GET', '/quartz/judgeJobClass', '定时任务', b'1', b'1', '定时任务 判断是否是定时任务类', 1399985191002447872, '2021-12-20 20:19:09.724000', 1399985191002447872, '2021-12-20 20:19:09.759000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904403936583680, 'CouponController#findByIds', '批量查询优惠券', 'GET', '/coupon/findByIds', '优惠券', b'1', b'1', '优惠券 批量查询优惠券', 1399985191002447872, '2021-12-20 20:19:09.795000', 1399985191002447872, '2021-12-20 20:19:09.959000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904405199069184, 'MailConfigController#page', '分页', 'GET', '/mail/config/page', '邮箱配置', b'1', b'1', '邮箱配置 分页', 1399985191002447872, '2021-12-20 20:19:10.096000', 1399985191002447872, '2021-12-20 20:19:10.227000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904406344114176, 'RolePathController#findIdsByRole', '根据角色id获取关联权限id', 'GET', '/role/path/findIdsByRole', '角色请求权限消息关系', b'1', b'1', '角色请求权限消息关系 根据角色id获取关联权限id', 1399985191002447872, '2021-12-20 20:19:10.369000', 1399985191002447872, '2021-12-20 20:19:10.438000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904407761788928, 'RoleController#dropdown', '角色下拉框', 'GET', '/role/dropdown', '角色管理', b'1', b'1', '角色管理 角色下拉框', 1399985191002447872, '2021-12-20 20:19:10.707000', 1399985191002447872, '2021-12-20 20:19:10.755000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904408109916160, 'UserInfoController#existsPhone', '手机号是否被使用', 'GET', '/user/existsPhone', '用户管理', b'1', b'1', '用户管理 手机号是否被使用', 1399985191002447872, '2021-12-20 20:19:10.791000', 1399985191002447872, '2021-12-20 20:19:10.828000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904408508375040, 'OpenApiWebMvcResource#openapiYaml', '', 'GET', '/v3/api-docs.yaml', NULL, b'1', b'1', NULL, 1399985191002447872, '2021-12-20 20:19:10.885000', 1399985191002447872, '2021-12-20 20:19:10.920000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904408818753536, 'DeptController#tree', '树状展示', 'GET', '/dept/tree', '部门管理', b'1', b'1', '部门管理 树状展示', 1399985191002447872, '2021-12-20 20:19:10.959000', 1399985191002447872, '2021-12-20 20:19:10.996000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904409137520640, 'DictionaryItemController#delete', '删除字典项', 'DELETE', '/dict/item/delete', '字典项', b'1', b'1', '字典项 删除字典项', 1399985191002447872, '2021-12-20 20:19:11.035000', 1399985191002447872, '2021-12-20 20:19:11.074000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904409481453568, 'MultipleOpenApiWebMvcResource#openapiJson', '', 'GET', '/v3/api-docs/{group}', NULL, b'1', b'1', NULL, 1399985191002447872, '2021-12-20 20:19:11.117000', 1399985191002447872, '2021-12-20 20:19:11.160000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904409875718144, 'UserInfoController#existsEmail', '邮箱是否被使用', 'GET', '/user/existsEmail', '用户管理', b'1', b'1', '用户管理 邮箱是否被使用', 1399985191002447872, '2021-12-20 20:19:11.211000', 1399985191002447872, '2021-12-20 20:19:11.258000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904410228039680, 'UserRoleController#findRolesByUser', '根据用户ID获取到角色集合', 'GET', '/user/role/findRolesByUser', '用户角色管理', b'1', b'1', '用户角色管理 根据用户ID获取到角色集合', 1399985191002447872, '2021-12-20 20:19:11.295000', 1399985191002447872, '2021-12-20 20:19:11.350000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904410609721344, 'UserSocialLoginController#page', '分页', 'GET', '/user/social/page', '用户三方登录管理', b'1', b'1', '用户三方登录管理 分页', 1399985191002447872, '2021-12-20 20:19:11.386000', 1399985191002447872, '2021-12-20 20:19:11.426000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904410966237184, 'WalletLogController#searchByCondition', '查询钱包日志', 'POST', '/walletLog/search/condition', '钱包日志相关的接口', b'1', b'1', '钱包日志相关的接口 查询钱包日志', 1399985191002447872, '2021-12-20 20:19:11.471000', 1399985191002447872, '2021-12-20 20:19:11.518000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904411389861888, 'PayController#cancelByBusinessId', '取消支付(业务id)', 'POST', '/uni_pay/cancelByBusinessId', '统一支付', b'1', b'1', '统一支付 取消支付(业务id)', 1399985191002447872, '2021-12-20 20:19:11.572000', 1399985191002447872, '2021-12-20 20:19:11.616000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904411721211904, 'RolePathController#findPathsByUser', '根据用户id获取角色授权(权限列表)', 'GET', '/role/path/findPathsByUser', '角色请求权限消息关系', b'1', b'1', '角色请求权限消息关系 根据用户id获取角色授权(权限列表)', 1399985191002447872, '2021-12-20 20:19:11.651000', 1399985191002447872, '2021-12-20 20:19:11.689000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904412052561920, 'UserAdminController#add', '添加用户', 'POST', '/user/admin/add', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 添加用户', 1399985191002447872, '2021-12-20 20:19:11.730000', 1399985191002447872, '2021-12-20 20:19:11.785000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904412434243584, 'CouponController#lockById', '锁定优惠券', 'POST', '/coupon/lockById', '优惠券', b'1', b'1', '优惠券 锁定优惠券', 1399985191002447872, '2021-12-20 20:19:11.821000', 1399985191002447872, '2021-12-20 20:19:11.857000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904412799148032, 'AppVersionController#findById', '查询详情', 'POST', '/app/version/findById', 'app版本管理', b'1', b'1', 'app版本管理 查询详情', 1399985191002447872, '2021-12-20 20:19:11.908000', 1399985191002447872, '2021-12-20 20:19:11.955000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904413239549952, 'TokenEndpoint#logout', '退出', 'POST', '/token/logout', '认证相关', b'1', b'1', '认证相关 退出', 1399985191002447872, '2021-12-20 20:19:12.013000', 1399985191002447872, '2021-12-20 20:19:12.059000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904413591871488, 'CategoryController#findTree', '获取类目树', 'GET', '/category/tree', '类目管理', b'1', b'1', '类目管理 获取类目树', 1399985191002447872, '2021-12-20 20:19:12.097000', 1399985191002447872, '2021-12-20 20:19:12.141000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904413977747456, 'NcDemoController#sendMsg', '消息发送测试', 'GET', '/nc/test/sendMsg', 'nc测试', b'1', b'1', 'nc测试 消息发送测试', 1399985191002447872, '2021-12-20 20:19:12.189000', 1399985191002447872, '2021-12-20 20:19:12.228000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904414321680384, 'GoodsSkuController#findBySkuIds', '获取sku集合', 'GET', '/sku/findBySkuIds', 'sku操作', b'1', b'1', 'sku操作 获取sku集合', 1399985191002447872, '2021-12-20 20:19:12.271000', 1399985191002447872, '2021-12-20 20:19:12.307000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904414632058880, 'TestController#Idempotent', '幂等演示', 'GET', '/test/idempotent', '测试控制器', b'1', b'1', '测试控制器 幂等演示', 1399985191002447872, '2021-12-20 20:19:12.345000', 1399985191002447872, '2021-12-20 20:19:12.389000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904415101820928, 'RoleController#existsByName', '名称是否被使用(不包含自己)', 'GET', '/role/existsByNameNotId', '角色管理', b'1', b'1', '角色管理 名称是否被使用(不包含自己)', 1399985191002447872, '2021-12-20 20:19:12.457000', 1399985191002447872, '2021-12-20 20:19:12.506000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904415454142464, 'QuartzJobController#add', '添加', 'POST', '/quartz/add', '定时任务', b'1', b'1', '定时任务 添加', 1399985191002447872, '2021-12-20 20:19:12.541000', 1399985191002447872, '2021-12-20 20:19:12.576000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904415760326656, 'PayCallbackController#wechat', '微信支付回调', 'POST', '/callback/wechat', '支付回调', b'1', b'1', '支付回调 微信支付回调', 1399985191002447872, '2021-12-20 20:19:12.614000', 1399985191002447872, '2021-12-20 20:19:12.653000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904416070705152, 'UserRoleController#findRoleIdsByUser', '根据用户ID获取到角色id集合', 'GET', '/user/role/findRoleIdsByUser', '用户角色管理', b'1', b'1', '用户角色管理 根据用户ID获取到角色id集合', 1399985191002447872, '2021-12-20 20:19:12.688000', 1399985191002447872, '2021-12-20 20:19:12.726000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904416381083648, 'DeptController#update', '更新', 'POST', '/dept/update', '部门管理', b'1', b'1', '部门管理 更新', 1399985191002447872, '2021-12-20 20:19:12.762000', 1399985191002447872, '2021-12-20 20:19:12.798000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904416695656448, 'ActivityController#add', '注册活动', 'POST', '/activity/add', '活动', b'1', b'1', '活动 注册活动', 1399985191002447872, '2021-12-20 20:19:12.837000', 1399985191002447872, '2021-12-20 20:19:12.877000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904417081532416, 'OrderFindController#findPayTimeoutOrderIdsByType', '获取指定类型超时订单的id集合', 'GET', '/order/findPayTimeoutOrderIdsByType', '订单查询', b'1', b'1', '订单查询 获取指定类型超时订单的id集合', 1399985191002447872, '2021-12-20 20:19:12.929000', 1399985191002447872, '2021-12-20 20:19:12.969000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904417442242560, 'ActivityController#findAll', '查询活动', 'GET', '/activity/findAll', '活动', b'1', b'1', '活动 查询活动', 1399985191002447872, '2021-12-20 20:19:13.015000', 1399985191002447872, '2021-12-20 20:19:13.051000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904417756815360, 'SiteMessageController#findById', '消息详情', 'GET', '/site/message/findById', '站内信', b'1', b'1', '站内信 消息详情', 1399985191002447872, '2021-12-20 20:19:13.090000', 1399985191002447872, '2021-12-20 20:19:13.125000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904418067193856, 'QuartzJobController#execute', '立即执行', 'POST', '/quartz/execute', '定时任务', b'1', b'1', '定时任务 立即执行', 1399985191002447872, '2021-12-20 20:19:13.164000', 1399985191002447872, '2021-12-20 20:19:13.207000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904418415321088, 'DictionaryItemController#findByDictionaryId', '查询指定字典ID下的所有字典项', 'GET', '/dict/item/findByDictionaryId', '字典项', b'1', b'1', '字典项 查询指定字典ID下的所有字典项', 1399985191002447872, '2021-12-20 20:19:13.247000', 1399985191002447872, '2021-12-20 20:19:13.285000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904418721505280, 'DeptController#delete', '普通删除', 'DELETE', '/dept/delete', '部门管理', b'1', b'1', '部门管理 普通删除', 1399985191002447872, '2021-12-20 20:19:13.320000', 1399985191002447872, '2021-12-20 20:19:13.355000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904419078021120, 'GoodsController#findByCategory', '按类目查询', 'GET', '/goods/findByCategory', '商品管理', b'1', b'1', '商品管理 按类目查询', 1399985191002447872, '2021-12-20 20:19:13.405000', 1399985191002447872, '2021-12-20 20:19:13.441000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904419375816704, 'DingRobotConfigController#existsByCode', '编码是否被使用', 'GET', '/ding/robot/config/existsByCode', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 编码是否被使用', 1399985191002447872, '2021-12-20 20:19:13.476000', 1399985191002447872, '2021-12-20 20:19:13.513000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904419778469888, 'PermPathController#findById', '获取详情', 'GET', '/perm/path/findById', '请求权限资源', b'1', b'1', '请求权限资源 获取详情', 1399985191002447872, '2021-12-20 20:19:13.572000', 1399985191002447872, '2021-12-20 20:19:13.618000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904420118208512, 'ClientController#existsByCode', '编码是否被使用', 'GET', '/client/existsByCode', '终端管理', b'1', b'1', '终端管理 编码是否被使用', 1399985191002447872, '2021-12-20 20:19:13.653000', 1399985191002447872, '2021-12-20 20:19:13.695000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904420478918656, 'PaymentController#findPayTypeInfoByBusinessId', '根据businessId获取订单支付方式', 'GET', '/payment/findPayTypeInfoByBusinessId', '支付记录', b'1', b'1', '支付记录 根据businessId获取订单支付方式', 1399985191002447872, '2021-12-20 20:19:13.739000', 1399985191002447872, '2021-12-20 20:19:13.779000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904420831240192, 'TestController#sequence', '发号器', 'GET', '/test/sequence', '测试控制器', b'1', b'1', '测试控制器 发号器', 1399985191002447872, '2021-12-20 20:19:13.823000', 1399985191002447872, '2021-12-20 20:19:13.857000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904421183561728, 'WeChatPayConfigController#add', '添加微信支付配置', 'POST', '/wechat/pay/add', '微信支付', b'1', b'1', '微信支付 添加微信支付配置', 1399985191002447872, '2021-12-20 20:19:13.907000', 1399985191002447872, '2021-12-20 20:19:13.950000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904421514911744, 'PaymentController#findById', '根据id获取', 'GET', '/payment/findById', '支付记录', b'1', b'1', '支付记录 根据id获取', 1399985191002447872, '2021-12-20 20:19:13.986000', 1399985191002447872, '2021-12-20 20:19:14.027000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904421854650368, 'CaptchaController#imgCaptcha', '获取图片验证码', 'POST', '/captcha/imgCaptcha', '验证码服务', b'1', b'1', '验证码服务 获取图片验证码', 1399985191002447872, '2021-12-20 20:19:14.067000', 1399985191002447872, '2021-12-20 20:19:14.104000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904422181806080, 'DictionaryItemController#add', '添加字典项（返回字典项对象）', 'POST', '/dict/item/add', '字典项', b'1', b'1', '字典项 添加字典项（返回字典项对象）', 1399985191002447872, '2021-12-20 20:19:14.145000', 1399985191002447872, '2021-12-20 20:19:14.182000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904422542516224, 'StrategyController#findAll', '查询全部策略', 'GET', '/strategy/findAll', '策略定义', b'1', b'1', '策略定义 查询全部策略', 1399985191002447872, '2021-12-20 20:19:14.231000', 1399985191002447872, '2021-12-20 20:19:14.266000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904422873866240, 'OnlineUserController#findBySessionId', '获取单条', 'GET', '/user/online/findBySessionId', '在线用户', b'1', b'1', '在线用户 获取单条', 1399985191002447872, '2021-12-20 20:19:14.310000', 1399985191002447872, '2021-12-20 20:19:14.350000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904423251353600, 'UserAdminController#unlock', '解锁用户', 'POST', '/user/admin/unlock', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 解锁用户', 1399985191002447872, '2021-12-20 20:19:14.400000', 1399985191002447872, '2021-12-20 20:19:14.450000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904423662395392, 'MultipleOpenApiWebMvcResource#openapiYaml', '', 'GET', '/v3/api-docs.yaml/{group}', NULL, b'1', b'1', NULL, 1399985191002447872, '2021-12-20 20:19:14.498000', 1399985191002447872, '2021-12-20 20:19:14.537000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904423985356800, 'QuartzJobController#update', '更新', 'POST', '/quartz/update', '定时任务', b'1', b'1', '定时任务 更新', 1399985191002447872, '2021-12-20 20:19:14.575000', 1399985191002447872, '2021-12-20 20:19:14.615000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904424392204288, 'UserAdminController#restartPassword', '重置密码', 'POST', '/user/admin/restartPassword', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 重置密码', 1399985191002447872, '2021-12-20 20:19:14.672000', 1399985191002447872, '2021-12-20 20:19:14.706000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904424685805568, 'PermMenuController#tree', '获取权限菜单树', 'GET', '/perm/menu/tree', '菜单权限资源', b'1', b'1', '菜单权限资源 获取权限菜单树', 1399985191002447872, '2021-12-20 20:19:14.743000', 1399985191002447872, '2021-12-20 20:19:14.778000', b'1', 0);
INSERT INTO `iam_perm_path` VALUES (1472904425017155584, 'SiteMessageController#getReceiveCount', '获取接收消息条数', 'GET', '/site/message/getReceiveCount', '站内信', b'1', b'1', '站内信 获取接收消息条数', 1399985191002447872, '2021-12-20 20:19:14.821000', 1399985191002447872, '2021-12-20 20:19:14.862000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904425331728384, 'OpenApiWebMvcResource#openapiJson', '', 'GET', '/v3/api-docs', NULL, b'1', b'1', NULL, 1399985191002447872, '2021-12-20 20:19:14.896000', 1399985191002447872, '2021-12-20 20:19:14.931000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904425717604352, 'PermPathController#delete', '删除权限', 'POST', '/perm/path/delete', '请求权限资源', b'1', b'1', '请求权限资源 删除权限', 1399985191002447872, '2021-12-20 20:19:14.988000', 1399985191002447872, '2021-12-20 20:19:15.025000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904426057342976, 'DictionaryController#delete', '根据id删除', 'DELETE', '/dict/delete', '字典', b'1', b'1', '字典 根据id删除', 1399985191002447872, '2021-12-20 20:19:15.069000', 1399985191002447872, '2021-12-20 20:19:15.109000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904426376110080, 'MessageTemplateController#update', '更新', 'POST', '/message/template/update', '消息模板', b'1', b'1', '消息模板 更新', 1399985191002447872, '2021-12-20 20:19:15.145000', 1399985191002447872, '2021-12-20 20:19:15.183000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904426699071488, 'CouponTemplateController#addCouponTemplate', '新建优惠券模板', 'POST', '/coupon/template/add', '优惠券模板', b'1', b'1', '优惠券模板 新建优惠券模板', 1399985191002447872, '2021-12-20 20:19:15.222000', 1399985191002447872, '2021-12-20 20:19:15.263000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904427055587328, 'UserAdminController#page', '分页', 'GET', '/user/admin/page', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 分页', 1399985191002447872, '2021-12-20 20:19:15.307000', 1399985191002447872, '2021-12-20 20:19:15.358000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904427437268992, 'MessageTemplateController#existsByCode', '编码是否被使用', 'GET', '/message/template/existsByCode', '消息模板', b'1', b'1', '消息模板 编码是否被使用', 1399985191002447872, '2021-12-20 20:19:15.398000', 1399985191002447872, '2021-12-20 20:19:15.443000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904427772813312, 'MailSendController#sentSimpleMail', '发送简单邮件', 'POST', '/mail/send/sentSimpleMail', '邮件发送', b'1', b'1', '邮件发送 发送简单邮件', 1399985191002447872, '2021-12-20 20:19:15.478000', 1399985191002447872, '2021-12-20 20:19:15.519000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904428120940544, 'DictionaryController#update', '更新', 'POST', '/dict/update', '字典', b'1', b'1', '字典 更新', 1399985191002447872, '2021-12-20 20:19:15.561000', 1399985191002447872, '2021-12-20 20:19:15.598000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904428460679168, 'WalletController#getWalletByUserId', '根据用户ID查询钱包', 'GET', '/wallet/getByUserId', '钱包相关的接口', b'1', b'1', '钱包相关的接口 根据用户ID查询钱包', 1399985191002447872, '2021-12-20 20:19:15.642000', 1399985191002447872, '2021-12-20 20:19:15.685000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904428804612096, 'DictionaryController#findById', '根据id获取', 'GET', '/dict/findById', '字典', b'1', b'1', '字典 根据id获取', 1399985191002447872, '2021-12-20 20:19:15.724000', 1399985191002447872, '2021-12-20 20:19:15.769000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904429140156416, 'DingRobotConfigController#findAll', '查询全部', 'GET', '/ding/robot/config/findAll', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 查询全部', 1399985191002447872, '2021-12-20 20:19:15.804000', 1399985191002447872, '2021-12-20 20:19:15.849000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904429500866560, 'SiteMessageController#pageBySender', '发送消息分页', 'GET', '/site/message/pageBySender', '站内信', b'1', b'1', '站内信 发送消息分页', 1399985191002447872, '2021-12-20 20:19:15.890000', 1399985191002447872, '2021-12-20 20:19:15.928000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904429840605184, 'WeChatPayConfigController#setUpActivity', '设置启用的微信支付配置', 'POST', '/wechat/pay/setUpActivity', '微信支付', b'1', b'1', '微信支付 设置启用的微信支付配置', 1399985191002447872, '2021-12-20 20:19:15.971000', 1399985191002447872, '2021-12-20 20:19:16.032000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904430276812800, 'TestController#say', '测试回声', 'GET', '/test/say', '测试控制器', b'1', b'1', '测试控制器 测试回声', 1399985191002447872, '2021-12-20 20:19:16.075000', 1399985191002447872, '2021-12-20 20:19:16.110000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904430603968512, 'MailConfigController#add', '增加新邮箱配置', 'POST', '/mail/config/add', '邮箱配置', b'1', b'1', '邮箱配置 增加新邮箱配置', 1399985191002447872, '2021-12-20 20:19:16.153000', 1399985191002447872, '2021-12-20 20:19:16.193000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904430956290048, 'InventoryController#unlockInventoryWithoutToken', '解锁没有令牌的库存', 'POST', '/inventory/unlockInventoryWithoutToken', '库存操作', b'1', b'1', '库存操作 解锁没有令牌的库存', 1399985191002447872, '2021-12-20 20:19:16.237000', 1399985191002447872, '2021-12-20 20:19:16.278000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904431279251456, 'CouponController#getByIds', '批量优惠券', 'GET', '/coupon/getById', '优惠券', b'1', b'1', '优惠券 批量优惠券', 1399985191002447872, '2021-12-20 20:19:16.314000', 1399985191002447872, '2021-12-20 20:19:16.361000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904431635767296, 'QuartzJobController#delete', '删除', 'DELETE', '/quartz/delete', '定时任务', b'1', b'1', '定时任务 删除', 1399985191002447872, '2021-12-20 20:19:16.399000', 1399985191002447872, '2021-12-20 20:19:16.440000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904432021643264, 'PaymentController#page', '分页查询', 'GET', '/payment/page', '支付记录', b'1', b'1', '支付记录 分页查询', 1399985191002447872, '2021-12-20 20:19:16.491000', 1399985191002447872, '2021-12-20 20:19:16.529000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904432415907840, 'PermMenuController#delete', '删除', 'DELETE', '/perm/menu/delete', '菜单权限资源', b'1', b'1', '菜单权限资源 删除', 1399985191002447872, '2021-12-20 20:19:16.585000', 1399985191002447872, '2021-12-20 20:19:16.621000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904432755646464, 'CategoryController#deleteCategoryById', '通过 id 删除类目', 'DELETE', '/category/delete', '类目管理', b'1', b'1', '类目管理 通过 id 删除类目', 1399985191002447872, '2021-12-20 20:19:16.666000', 1399985191002447872, '2021-12-20 20:19:16.708000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904433107968000, 'SiteMessageController#pageByReceive', '接收消息分页', 'GET', '/site/message/pageByReceive', '站内信', b'1', b'1', '站内信 接收消息分页', 1399985191002447872, '2021-12-20 20:19:16.750000', 1399985191002447872, '2021-12-20 20:19:16.792000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904433451900928, 'CouponController#findCoupon', '个人可用的优惠券', 'GET', '/coupon/findCoupon', '优惠券', b'1', b'1', '优惠券 个人可用的优惠券', 1399985191002447872, '2021-12-20 20:19:16.832000', 1399985191002447872, '2021-12-20 20:19:16.870000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904433779056640, 'ClientController#delete', '删除终端', 'DELETE', '/client/delete', '终端管理', b'1', b'1', '终端管理 删除终端', 1399985191002447872, '2021-12-20 20:19:16.910000', 1399985191002447872, '2021-12-20 20:19:16.952000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904434492088320, 'ActivityController#get', '查询活动', 'GET', '/activity//get/{id}', '活动', b'1', b'1', '活动 查询活动', 1399985191002447872, '2021-12-20 20:19:17.080000', 1399985191002447872, '2021-12-20 20:19:17.547000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904436618600448, 'SystemParamController#existsByKey', '判断编码是否存在', 'GET', '/system/param/existsByKey', '系统参数', b'1', b'1', '系统参数 判断编码是否存在', 1399985191002447872, '2021-12-20 20:19:17.587000', 1399985191002447872, '2021-12-20 20:19:17.634000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904436979310592, 'ClientController#page', '分页查询终端', 'GET', '/client/page', '终端管理', b'1', b'1', '终端管理 分页查询终端', 1399985191002447872, '2021-12-20 20:19:17.673000', 1399985191002447872, '2021-12-20 20:19:17.723000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904437356797952, 'QuartzJobController#stop', '停止', 'POST', '/quartz/stop', '定时任务', b'1', b'1', '定时任务 停止', 1399985191002447872, '2021-12-20 20:19:17.763000', 1399985191002447872, '2021-12-20 20:19:17.815000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904437742673920, 'OnlineUserController#page', '分页', 'GET', '/user/online/page', '在线用户', b'1', b'1', '在线用户 分页', 1399985191002447872, '2021-12-20 20:19:17.855000', 1399985191002447872, '2021-12-20 20:19:17.910000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904438153715712, 'DingRobotConfigController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/ding/robot/config/existsByCodeNotId', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 编码是否被使用(不包含自己)', 1399985191002447872, '2021-12-20 20:19:17.953000', 1399985191002447872, '2021-12-20 20:19:17.996000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904438606700544, 'InventoryController#getAvailable', '获取指定 SKU 的可用库存', 'GET', '/inventory/getAvailable', '库存操作', b'1', b'1', '库存操作 获取指定 SKU 的可用库存', 1399985191002447872, '2021-12-20 20:19:18.061000', 1399985191002447872, '2021-12-20 20:19:18.104000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904438942244864, 'SystemParamController#page', '分页', 'GET', '/system/param/page', '系统参数', b'1', b'1', '系统参数 分页', 1399985191002447872, '2021-12-20 20:19:18.141000', 1399985191002447872, '2021-12-20 20:19:18.180000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904439298760704, 'OperateLogController#page', '分页', 'GET', '/log/operate/page', '操作日志', b'1', b'1', '操作日志 分页', 1399985191002447872, '2021-12-20 20:19:18.226000', 1399985191002447872, '2021-12-20 20:19:18.261000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904439609139200, 'StrategyController#update', '更新策略', 'POST', '/strategy/update', '策略定义', b'1', b'1', '策略定义 更新策略', 1399985191002447872, '2021-12-20 20:19:18.300000', 1399985191002447872, '2021-12-20 20:19:18.338000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904439927906304, 'DeptController#add', '添加', 'POST', '/dept/add', '部门管理', b'1', b'1', '部门管理 添加', 1399985191002447872, '2021-12-20 20:19:18.376000', 1399985191002447872, '2021-12-20 20:19:18.429000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904440393474048, 'DingRobotSendController#sendMarkdown', '测试发送Markdown', 'POST', '/ding/robot/send/markdown', '钉钉机器人发送', b'1', b'1', '钉钉机器人发送 测试发送Markdown', 1399985191002447872, '2021-12-20 20:19:18.487000', 1399985191002447872, '2021-12-20 20:19:18.559000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904440880013312, 'DingRobotConfigController#findById', '获取详情', 'GET', '/ding/robot/config/findById', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 获取详情', 1399985191002447872, '2021-12-20 20:19:18.603000', 1399985191002447872, '2021-12-20 20:19:18.643000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904441207169024, 'PermMenuController#findById', '根据id查询', 'GET', '/perm/menu/findById', '菜单权限资源', b'1', b'1', '菜单权限资源 根据id查询', 1399985191002447872, '2021-12-20 20:19:18.681000', 1399985191002447872, '2021-12-20 20:19:18.716000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904441517547520, 'InventoryController#reduceLockedAndCapacity', '扣减指定的 SKU 的库存', 'POST', '/inventory/reduceLockedAndCapacity', '库存操作', b'1', b'1', '库存操作 扣减指定的 SKU 的库存', 1399985191002447872, '2021-12-20 20:19:18.755000', 1399985191002447872, '2021-12-20 20:19:18.805000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904441886646272, 'DictionaryItemController#pageByDictionaryId', '分页查询指定字典下的字典项', 'GET', '/dict/item/pageByDictionaryId', '字典项', b'1', b'1', '字典项 分页查询指定字典下的字典项', 1399985191002447872, '2021-12-20 20:19:18.843000', 1399985191002447872, '2021-12-20 20:19:18.878000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904442209607680, 'DictionaryItemController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/dict/item/existsByCodeNotId', '字典项', b'1', b'1', '字典项 编码是否被使用(不包含自己)', 1399985191002447872, '2021-12-20 20:19:18.920000', 1399985191002447872, '2021-12-20 20:19:18.957000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904442519986176, 'UserAdminController#findById', '根据用户id查询用户', 'GET', '/user/admin/findById', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 根据用户id查询用户', 1399985191002447872, '2021-12-20 20:19:18.994000', 1399985191002447872, '2021-12-20 20:19:19.043000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904442981359616, 'UserInfoController#getUserInfo', '获取用户信息', 'GET', '/user/getUserInfo', '用户管理', b'1', b'1', '用户管理 获取用户信息', 1399985191002447872, '2021-12-20 20:19:19.104000', 1399985191002447872, '2021-12-20 20:19:19.138000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904443291738112, 'QuartzJobController#start', '启动', 'POST', '/quartz/start', '定时任务', b'1', b'1', '定时任务 启动', 1399985191002447872, '2021-12-20 20:19:19.178000', 1399985191002447872, '2021-12-20 20:19:19.213000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904443652448256, 'CouponController#obtainCoupon', '领取优惠券', 'POST', '/coupon/obtainCoupon', '优惠券', b'1', b'1', '优惠券 领取优惠券', 1399985191002447872, '2021-12-20 20:19:19.264000', 1399985191002447872, '2021-12-20 20:19:19.299000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904443983798272, 'DictionaryController#findAll', '查询全部', 'GET', '/dict/findAll', '字典', b'1', b'1', '字典 查询全部', 1399985191002447872, '2021-12-20 20:19:19.343000', 1399985191002447872, '2021-12-20 20:19:19.382000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904444315148288, 'SiteMessageController#page', '消息分页', 'GET', '/site/message/page', '站内信', b'1', b'1', '站内信 消息分页', 1399985191002447872, '2021-12-20 20:19:19.422000', 1399985191002447872, '2021-12-20 20:19:19.461000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904444638109696, 'SystemParamController#delete', '删除', 'DELETE', '/system/param/delete', '系统参数', b'1', b'1', '系统参数 删除', 1399985191002447872, '2021-12-20 20:19:19.499000', 1399985191002447872, '2021-12-20 20:19:19.538000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904444956876800, 'MessageTemplateController#delete', '删除', 'DELETE', '/message/template/delete', '消息模板', b'1', b'1', '消息模板 删除', 1399985191002447872, '2021-12-20 20:19:19.575000', 1399985191002447872, '2021-12-20 20:19:19.609000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904445275643904, 'DictionaryController#page', '分页', 'GET', '/dict/page', '字典', b'1', b'1', '字典 分页', 1399985191002447872, '2021-12-20 20:19:19.651000', 1399985191002447872, '2021-12-20 20:19:19.699000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904445636354048, 'QuartzJobController#page', '分页', 'GET', '/quartz/page', '定时任务', b'1', b'1', '定时任务 分页', 1399985191002447872, '2021-12-20 20:19:19.737000', 1399985191002447872, '2021-12-20 20:19:19.776000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904445963509760, 'StrategyController#findByType', '根据类型查询', 'GET', '/strategy/findByType', '策略定义', b'1', b'1', '策略定义 根据类型查询', 1399985191002447872, '2021-12-20 20:19:19.815000', 1399985191002447872, '2021-12-20 20:19:19.886000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904446420688896, 'ClientController#superPage', '超级查询', 'POST', '/client/superPage', '终端管理', b'1', b'1', '终端管理 超级查询', 1399985191002447872, '2021-12-20 20:19:19.924000', 1399985191002447872, '2021-12-20 20:19:19.967000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904446768816128, 'OnlineUserController#logoutByUserId', '踢人下线', 'POST', '/user/online/logoutByUserId', '在线用户', b'1', b'1', '在线用户 踢人下线', 1399985191002447872, '2021-12-20 20:19:20.007000', 1399985191002447872, '2021-12-20 20:19:20.048000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904447163080704, 'AppVersionController#page', '分页', 'GET', '/app/version/page', 'app版本管理', b'1', b'1', 'app版本管理 分页', 1399985191002447872, '2021-12-20 20:19:20.101000', 1399985191002447872, '2021-12-20 20:19:20.136000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904447460876288, 'OrderOperateController#cancelOrderState', '取消订单', 'POST', '/order/cancelOrderState', '订单操作', b'1', b'1', '订单操作 取消订单', 1399985191002447872, '2021-12-20 20:19:20.172000', 1399985191002447872, '2021-12-20 20:19:20.206000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904447788032000, 'PayNotifyRecordController#page', '分页', 'GET', '/notify/record/page', '支付回调记录', b'1', b'1', '支付回调记录 分页', 1399985191002447872, '2021-12-20 20:19:20.250000', 1399985191002447872, '2021-12-20 20:19:20.292000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904448131964928, 'PayController#syncByBusinessId', '刷新指定业务id的支付单状态', 'POST', '/uni_pay/syncByBusinessId', '统一支付', b'1', b'1', '统一支付 刷新指定业务id的支付单状态', 1399985191002447872, '2021-12-20 20:19:20.332000', 1399985191002447872, '2021-12-20 20:19:20.376000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904448488480768, 'MessageTemplateController#findById', '获取详情', 'GET', '/message/template/findById', '消息模板', b'1', b'1', '消息模板 获取详情', 1399985191002447872, '2021-12-20 20:19:20.417000', 1399985191002447872, '2021-12-20 20:19:20.455000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904448811442176, 'UserAdminController#lock', '锁定用户', 'POST', '/user/admin/lock', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 锁定用户', 1399985191002447872, '2021-12-20 20:19:20.494000', 1399985191002447872, '2021-12-20 20:19:20.536000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904449142792192, 'UserAdminController#getByPhone', '根据手机号查询用户', 'GET', '/user/admin/getByPhone', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 根据手机号查询用户', 1399985191002447872, '2021-12-20 20:19:20.573000', 1399985191002447872, '2021-12-20 20:19:20.613000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904449507696640, 'OperateLogController#findById', '获取', 'GET', '/log/operate/findById', '操作日志', b'1', b'1', '操作日志 获取', 1399985191002447872, '2021-12-20 20:19:20.660000', 1399985191002447872, '2021-12-20 20:19:20.699000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904449813880832, 'StrategyController#findById', '获取策略及其配置项', 'GET', '/strategy/findById', '策略定义', b'1', b'1', '策略定义 获取策略及其配置项', 1399985191002447872, '2021-12-20 20:19:20.733000', 1399985191002447872, '2021-12-20 20:19:20.775000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904450153619456, 'RoleController#findAll', '查询所有的角色', 'GET', '/role/findAll', '角色管理', b'1', b'1', '角色管理 查询所有的角色', 1399985191002447872, '2021-12-20 20:19:20.814000', 1399985191002447872, '2021-12-20 20:19:20.878000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904450602409984, 'QuartzJobController#findById', '单条', 'GET', '/quartz/findById', '定时任务', b'1', b'1', '定时任务 单条', 1399985191002447872, '2021-12-20 20:19:20.921000', 1399985191002447872, '2021-12-20 20:19:20.965000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904450963120128, 'SystemParamController#findById', '获取单条', 'GET', '/system/param/findById', '系统参数', b'1', b'1', '系统参数 获取单条', 1399985191002447872, '2021-12-20 20:19:21.007000', 1399985191002447872, '2021-12-20 20:19:21.049000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904451374161920, 'MailConfigController#setUpActivity', '设置启用的邮箱配置', 'POST', '/mail/config/setUpActivity', '邮箱配置', b'1', b'1', '邮箱配置 设置启用的邮箱配置', 1399985191002447872, '2021-12-20 20:19:21.105000', 1399985191002447872, '2021-12-20 20:19:21.141000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904451684540416, 'UserRoleController#saveAndUpdate', '给用户分配角色', 'POST', '/user/role/saveAndUpdate', '用户角色管理', b'1', b'1', '用户角色管理 给用户分配角色', 1399985191002447872, '2021-12-20 20:19:21.179000', 1399985191002447872, '2021-12-20 20:19:21.223000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904452011696128, 'PayCallbackController#aliPay', '支付宝回调', 'POST', '/callback/aliPay', '支付回调', b'1', b'1', '支付回调 支付宝回调', 1399985191002447872, '2021-12-20 20:19:21.257000', 1399985191002447872, '2021-12-20 20:19:21.297000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904452326268928, 'ClientController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/client/existsByCodeNotId', '终端管理', b'1', b'1', '终端管理 编码是否被使用(不包含自己)', 1399985191002447872, '2021-12-20 20:19:21.332000', 1399985191002447872, '2021-12-20 20:19:21.383000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904452695367680, 'RoleController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/role/existsByCodeNotId', '角色管理', b'1', b'1', '角色管理 编码是否被使用(不包含自己)', 1399985191002447872, '2021-12-20 20:19:21.420000', 1399985191002447872, '2021-12-20 20:19:21.458000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904453014134784, 'TokenEndpoint#loginOpenId', '三方登录登录', 'POST', '/token/loginOpenId', '认证相关', b'1', b'1', '认证相关 三方登录登录', 1399985191002447872, '2021-12-20 20:19:21.496000', 1399985191002447872, '2021-12-20 20:19:21.537000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904453395816448, 'WalletLogController#searchLog', '查询钱包日志', 'POST', '/walletLog/search', '钱包日志相关的接口', b'1', b'1', '钱包日志相关的接口 查询钱包日志', 1399985191002447872, '2021-12-20 20:19:21.587000', 1399985191002447872, '2021-12-20 20:19:21.621000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904453722972160, 'SystemParamController#existsByKeyNotId', '判断编码是否存在(不包含自己)', 'GET', '/system/param/existsByKeyNotId', '系统参数', b'1', b'1', '系统参数 判断编码是否存在(不包含自己)', 1399985191002447872, '2021-12-20 20:19:21.665000', 1399985191002447872, '2021-12-20 20:19:21.710000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904454066905088, 'OrderOperateController#placeOrder', '传入订单和优惠, 下单', 'POST', '/order/placeOrder', '订单操作', b'1', b'1', '订单操作 传入订单和优惠, 下单', 1399985191002447872, '2021-12-20 20:19:21.747000', 1399985191002447872, '2021-12-20 20:19:21.786000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904454402449408, 'StrategyRegisterController#findAll', '查询全部', 'GET', '/strategy/register/findAll', '策略注册', b'1', b'1', '策略注册 查询全部', 1399985191002447872, '2021-12-20 20:19:21.827000', 1399985191002447872, '2021-12-20 20:19:21.868000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904454754770944, 'PermPathController#syncSystem', '同步系统请求资源', 'POST', '/perm/path/syncSystem', '请求权限资源', b'1', b'1', '请求权限资源 同步系统请求资源', 1399985191002447872, '2021-12-20 20:19:21.911000', 1399985191002447872, '2021-12-20 20:19:21.947000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904455090315264, 'RequestPermController#getSystemRequest', '获取系统请求列表', 'POST', '/perm/request/getSystemRequest', '请求权限', b'1', b'1', '请求权限 获取系统请求列表', 1399985191002447872, '2021-12-20 20:19:21.991000', 1399985191002447872, '2021-12-20 20:19:22.030000', b'1', 0);
INSERT INTO `iam_perm_path` VALUES (1472904455446831104, 'TokenEndpoint#login', '普通登录', 'POST', '/token/login', '认证相关', b'1', b'1', '认证相关 普通登录', 1399985191002447872, '2021-12-20 20:19:22.076000', 1399985191002447872, '2021-12-20 20:19:22.129000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904455824318464, 'DictionaryController#existsByCode', '编码是否被使用', 'GET', '/dict/existsByCode', '字典', b'1', b'1', '字典 编码是否被使用', 1399985191002447872, '2021-12-20 20:19:22.166000', 1399985191002447872, '2021-12-20 20:19:22.202000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904456130502656, 'RoleController#add', '添加角色（返回角色对象）', 'POST', '/role/add', '角色管理', b'1', b'1', '角色管理 添加角色（返回角色对象）', 1399985191002447872, '2021-12-20 20:19:22.239000', 1399985191002447872, '2021-12-20 20:19:22.280000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904456474435584, 'DictionaryItemController#update', '修改字典项（返回字典项对象）', 'POST', '/dict/item/update', '字典项', b'1', b'1', '字典项 修改字典项（返回字典项对象）', 1399985191002447872, '2021-12-20 20:19:22.321000', 1399985191002447872, '2021-12-20 20:19:22.356000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904456809979904, 'AlipayConfigController#clearActivity', '清除指定的支付宝配置', 'POST', '/alipay/clearActivity', '支付宝配置', b'1', b'1', '支付宝配置 清除指定的支付宝配置', 1399985191002447872, '2021-12-20 20:19:22.401000', 1399985191002447872, '2021-12-20 20:19:22.440000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904457158107136, 'MailSendController#sendMail', '发送邮件', 'POST', '/mail/send/sendMail', '邮件发送', b'1', b'1', '邮件发送 发送邮件', 1399985191002447872, '2021-12-20 20:19:22.484000', 1399985191002447872, '2021-12-20 20:19:22.518000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904457464291328, 'RoleMenuController#findMenuIds', '获取权限菜单id列表,不包含按钮权限', 'GET', '/role/menu/findMenuIds', '角色菜单权限关系', b'1', b'1', '角色菜单权限关系 获取权限菜单id列表,不包含按钮权限', 1399985191002447872, '2021-12-20 20:19:22.557000', 1399985191002447872, '2021-12-20 20:19:22.594000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904457812418560, 'CategoryController#update', '更新类目', 'POST', '/category/update', '类目管理', b'1', b'1', '类目管理 更新类目', 1399985191002447872, '2021-12-20 20:19:22.640000', 1399985191002447872, '2021-12-20 20:19:22.676000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904459070709760, 'InventoryController#lockInventory', '锁定库存', 'POST', '/inventory/lockInventory', '库存操作', b'1', b'1', '库存操作 锁定库存', 1399985191002447872, '2021-12-20 20:19:22.940000', 1399985191002447872, '2021-12-20 20:19:22.979000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904459397865472, 'CategoryController#addCategory', '增加新类目', 'POST', '/category/add', '类目管理', b'1', b'1', '类目管理 增加新类目', 1399985191002447872, '2021-12-20 20:19:23.018000', 1399985191002447872, '2021-12-20 20:19:23.060000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904459762769920, 'StrategyController#findConfigs', '获取参数配置', 'GET', '/strategy/findConfigs', '策略定义', b'1', b'1', '策略定义 获取参数配置', 1399985191002447872, '2021-12-20 20:19:23.105000', 1399985191002447872, '2021-12-20 20:19:23.164000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904460182200320, 'OrderFindController#findOrderSkuIds', '查询订单包含的skuIds', 'GET', '/order/findOrderSkuIds', '订单查询', b'1', b'1', '订单查询 查询订单包含的skuIds', 1399985191002447872, '2021-12-20 20:19:23.205000', 1399985191002447872, '2021-12-20 20:19:23.249000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904460521938944, 'LoginLogController#page', '分页', 'GET', '/log/login/page', '登录日志', b'1', b'1', '登录日志 分页', 1399985191002447872, '2021-12-20 20:19:23.286000', 1399985191002447872, '2021-12-20 20:19:23.331000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904460882649088, 'RoleMenuController#findIdsByRole', '根据角色id获取关联权限id', 'GET', '/role/menu/findIdsByRole', '角色菜单权限关系', b'1', b'1', '角色菜单权限关系 根据角色id获取关联权限id', 1399985191002447872, '2021-12-20 20:19:23.372000', 1399985191002447872, '2021-12-20 20:19:23.414000', b'1', 0);
INSERT INTO `iam_perm_path` VALUES (1472904461213999104, 'TestController#xx', '获取所有接口请求', 'GET', '/test/xx', '测试控制器', b'1', b'1', '测试控制器 获取所有接口请求', 1399985191002447872, '2021-12-20 20:19:23.451000', 1399985191002447872, '2021-12-20 20:19:23.488000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904461541154816, 'MailConfigController#updateMailConfig', '更新邮箱配置', 'POST', '/mail/config/update', '邮箱配置', b'1', b'1', '邮箱配置 更新邮箱配置', 1399985191002447872, '2021-12-20 20:19:23.529000', 1399985191002447872, '2021-12-20 20:19:23.568000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904461893476352, 'WeChatPayConfigController#page', '分页', 'GET', '/wechat/pay/page', '微信支付', b'1', b'1', '微信支付 分页', 1399985191002447872, '2021-12-20 20:19:23.613000', 1399985191002447872, '2021-12-20 20:19:23.652000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904462208049152, 'AlipayConfigController#findPayTypeList', '支付宝支持支付方式', 'GET', '/alipay/findPayTypeList', '支付宝配置', b'1', b'1', '支付宝配置 支付宝支持支付方式', 1399985191002447872, '2021-12-20 20:19:23.688000', 1399985191002447872, '2021-12-20 20:19:23.733000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904462577147904, 'AlipayConfigController#add', '添加', 'POST', '/alipay/add', '支付宝配置', b'1', b'1', '支付宝配置 添加', 1399985191002447872, '2021-12-20 20:19:23.776000', 1399985191002447872, '2021-12-20 20:19:23.815000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904462912692224, 'RoleController#existsByName', '名称是否被使用', 'GET', '/role/existsByName', '角色管理', b'1', b'1', '角色管理 名称是否被使用', 1399985191002447872, '2021-12-20 20:19:23.856000', 1399985191002447872, '2021-12-20 20:19:23.891000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904463248236544, 'InventoryController#increaseAvailable', '增补指定 SKU 的可售库存', 'POST', '/inventory/increaseAvailable', '库存操作', b'1', b'1', '库存操作 增补指定 SKU 的可售库存', 1399985191002447872, '2021-12-20 20:19:23.936000', 1399985191002447872, '2021-12-20 20:19:23.976000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904463596363776, 'WeChatPayConfigController#update', '更新', 'POST', '/wechat/pay/update', '微信支付', b'1', b'1', '微信支付 更新', 1399985191002447872, '2021-12-20 20:19:24.019000', 1399985191002447872, '2021-12-20 20:19:24.061000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904463923519488, 'DingRobotConfigController#update', '修改机器人配置', 'POST', '/ding/robot/config/update', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 修改机器人配置', 1399985191002447872, '2021-12-20 20:19:24.097000', 1399985191002447872, '2021-12-20 20:19:24.140000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904464305201152, 'RoleController#delete', '删除角色', 'DELETE', '/role/delete', '角色管理', b'1', b'1', '角色管理 删除角色', 1399985191002447872, '2021-12-20 20:19:24.188000', 1399985191002447872, '2021-12-20 20:19:24.223000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904464640745472, 'PermMenuController#update', '修改菜单权限', 'POST', '/perm/menu/update', '菜单权限资源', b'1', b'1', '菜单权限资源 修改菜单权限', 1399985191002447872, '2021-12-20 20:19:24.268000', 1399985191002447872, '2021-12-20 20:19:24.303000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904464967901184, 'SiteMessageController#getSenderCount', '获取发送消息条数', 'GET', '/site/message/getSenderCount', '站内信', b'1', b'1', '站内信 获取发送消息条数', 1399985191002447872, '2021-12-20 20:19:24.346000', 1399985191002447872, '2021-12-20 20:19:24.390000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904465320222720, 'DingRobotSendController#sendText', '测试发送text', 'POST', '/ding/robot/send/text', '钉钉机器人发送', b'1', b'1', '钉钉机器人发送 测试发送text', 1399985191002447872, '2021-12-20 20:19:24.430000', 1399985191002447872, '2021-12-20 20:19:24.483000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904465693515776, 'OrderFindController#page', '订单列表 分页', 'GET', '/order/page', '订单查询', b'1', b'1', '订单查询 订单列表 分页', 1399985191002447872, '2021-12-20 20:19:24.519000', 1399985191002447872, '2021-12-20 20:19:24.554000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904466008088576, 'GoodsController#findAll', '查询全部', 'GET', '/goods/findAll', '商品管理', b'1', b'1', '商品管理 查询全部', 1399985191002447872, '2021-12-20 20:19:24.594000', 1399985191002447872, '2021-12-20 20:19:24.632000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904466352021504, 'WalletLogController#searchLog', '查询钱包日志(分页)', 'POST', '/walletLog/search/page', '钱包日志相关的接口', b'1', b'1', '钱包日志相关的接口 查询钱包日志(分页)', 1399985191002447872, '2021-12-20 20:19:24.677000', 1399985191002447872, '2021-12-20 20:19:24.724000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904466712731648, 'CouponController#lockByIds', '批量锁定优惠券', 'POST', '/coupon/lockByIds', '优惠券', b'1', b'1', '优惠券 批量锁定优惠券', 1399985191002447872, '2021-12-20 20:19:24.762000', 1399985191002447872, '2021-12-20 20:19:24.797000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904467018915840, 'PermPathController#page', '权限分页', 'GET', '/perm/path/page', '请求权限资源', b'1', b'1', '请求权限资源 权限分页', 1399985191002447872, '2021-12-20 20:19:24.835000', 1399985191002447872, '2021-12-20 20:19:24.875000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904467350265856, 'PayController#pay', '支付', 'POST', '/uni_pay/pay', '统一支付', b'1', b'1', '统一支付 支付', 1399985191002447872, '2021-12-20 20:19:24.914000', 1399985191002447872, '2021-12-20 20:19:24.951000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904467740336128, 'AlipayConfigController#page', '分页', 'GET', '/alipay/page', '支付宝配置', b'1', b'1', '支付宝配置 分页', 1399985191002447872, '2021-12-20 20:19:25.007000', 1399985191002447872, '2021-12-20 20:19:25.051000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904468138795008, 'OrderOperateController#paidOrderState', '付款成功状态变更', 'POST', '/order/paidOrderState', '订单操作', b'1', b'1', '订单操作 付款成功状态变更', 1399985191002447872, '2021-12-20 20:19:25.102000', 1399985191002447872, '2021-12-20 20:19:25.139000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904468524670976, 'RoleController#page', '分页查询角色', 'GET', '/role/page', '角色管理', b'1', b'1', '角色管理 分页查询角色', 1399985191002447872, '2021-12-20 20:19:25.194000', 1399985191002447872, '2021-12-20 20:19:25.229000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904468839243776, 'DictionaryItemController#findById', '根据字典项ID查询', 'GET', '/dict/item/findById', '字典项', b'1', b'1', '字典项 根据字典项ID查询', 1399985191002447872, '2021-12-20 20:19:25.269000', 1399985191002447872, '2021-12-20 20:19:25.311000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904469208342528, 'DeptController#findById', '获取', 'GET', '/dept/findById', '部门管理', b'1', b'1', '部门管理 获取', 1399985191002447872, '2021-12-20 20:19:25.357000', 1399985191002447872, '2021-12-20 20:19:25.392000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904469506138112, 'StrategyRegisterController#delete', '删除', 'DELETE', '/strategy/register/del/{id}', '策略注册', b'1', b'1', '策略注册 删除', 1399985191002447872, '2021-12-20 20:19:25.428000', 1399985191002447872, '2021-12-20 20:19:25.472000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904469871042560, 'UserAdminController#update', '修改用户', 'POST', '/user/admin/update', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 修改用户', 1399985191002447872, '2021-12-20 20:19:25.515000', 1399985191002447872, '2021-12-20 20:19:25.559000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904470273695744, 'OrderFindController#getWholeById', '获取完整订单详情', 'GET', '/order/getWholeById', '订单查询', b'1', b'1', '订单查询 获取完整订单详情', 1399985191002447872, '2021-12-20 20:19:25.611000', 1399985191002447872, '2021-12-20 20:19:25.658000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1472904470655377408, 'UserDeptController#findDeptListByUser', '根据用户ID获取到部门集合', 'GET', '/user/dept/findDeptListByUser', '用户部门关联关系', b'1', b'1', '用户部门关联关系 根据用户ID获取到部门集合', 1399985191002447872, '2021-12-20 20:19:25.702000', 1399985191002447872, '2021-12-20 20:19:25.780000', b'1', 0);
INSERT INTO `iam_perm_path` VALUES (1472904471162888192, 'InventoryController#unlockInventory', '释放预占的SKU库存，需使用token', 'POST', '/inventory/unlockInventory', '库存操作', b'1', b'1', '库存操作 释放预占的SKU库存，需使用token', 1399985191002447872, '2021-12-20 20:19:25.823000', 1399985191002447872, '2021-12-20 20:19:25.874000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1474682764627210240, 'DataScopeController#existsByName', '名称是否被使用', 'GET', '/data/scope/existsByName', '数据范围权限配置', b'1', b'1', '数据范围权限配置 名称是否被使用', 1399985191002447872, '2021-12-25 18:05:44.025000', 1399985191002447872, '2021-12-25 18:05:44.027000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1474682764669153280, 'DataScopeController#existsByCode', '编码是否被使用', 'GET', '/data/scope/existsByCode', '数据范围权限配置', b'1', b'1', '数据范围权限配置 编码是否被使用', 1399985191002447872, '2021-12-25 18:05:44.034000', 1399985191002447872, '2021-12-25 18:05:44.035000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1474682764681736192, 'DataScopeController#page', '分页', 'GET', '/data/scope/page', '数据范围权限配置', b'1', b'1', '数据范围权限配置 分页', 1399985191002447872, '2021-12-25 18:05:44.037000', 1399985191002447872, '2021-12-25 18:05:44.038000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1474682764694319104, 'DataScopeController#delete', '删除', 'DELETE', '/data/scope/delete', '数据范围权限配置', b'1', b'1', '数据范围权限配置 删除', 1399985191002447872, '2021-12-25 18:05:44.040000', 1399985191002447872, '2021-12-25 18:05:44.041000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1474682764706902016, 'DataScopeController#findById', '获取', 'GET', '/data/scope/findById', '数据范围权限配置', b'1', b'1', '数据范围权限配置 获取', 1399985191002447872, '2021-12-25 18:05:44.043000', 1399985191002447872, '2021-12-25 18:05:44.044000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1474682764723679232, 'DataScopeController#add', '添加', 'POST', '/data/scope/add', '数据范围权限配置', b'1', b'1', '数据范围权限配置 添加', 1399985191002447872, '2021-12-25 18:05:44.047000', 1399985191002447872, '2021-12-25 18:05:44.048000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1474682764736262144, 'DataScopeController#existsByName', '名称是否被使用(不包含自己)', 'GET', '/data/scope/existsByNameNotId', '数据范围权限配置', b'1', b'1', '数据范围权限配置 名称是否被使用(不包含自己)', 1399985191002447872, '2021-12-25 18:05:44.050000', 1399985191002447872, '2021-12-25 18:05:44.050000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1474682764744650752, 'DataScopeController#findAll', '查询全部', 'GET', '/data/scope/findAll', '数据范围权限配置', b'1', b'1', '数据范围权限配置 查询全部', 1399985191002447872, '2021-12-25 18:05:44.052000', 1399985191002447872, '2021-12-25 18:05:44.052000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1474682764753039360, 'DataScopeController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/data/scope/existsByCodeNotId', '数据范围权限配置', b'1', b'1', '数据范围权限配置 编码是否被使用(不包含自己)', 1399985191002447872, '2021-12-25 18:05:44.054000', 1399985191002447872, '2021-12-25 18:05:44.054000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1474682764757233664, 'DataScopeController#update', '更新', 'POST', '/data/scope/update', '数据范围权限配置', b'1', b'1', '数据范围权限配置 更新', 1399985191002447872, '2021-12-25 18:05:44.055000', 1399985191002447872, '2021-12-25 18:05:44.056000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1477639549566799872, 'PermMenuController#menuTree', '获取菜单树', 'GET', '/perm/menu/menuTree', '菜单权限资源', b'1', b'1', '菜单权限资源 获取菜单树', 1435894470432456704, '2022-01-02 21:54:56.490000', 1435894470432456704, '2022-01-02 21:54:56.520000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1477639549885566976, 'PermMenuController#allTree', '获取全部树', 'GET', '/perm/menu/allTree', '菜单权限资源', b'1', b'1', '菜单权限资源 获取全部树', 1435894470432456704, '2022-01-02 21:54:56.564000', 1435894470432456704, '2022-01-02 21:54:56.593000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1477639550149808128, 'RoleMenuController#findPermissionIdsByRole', '根据角色id获取关联权限id集合(包含资源和菜单)', 'GET', '/role/menu/findPermissionIdsByRole', '角色菜单权限关系', b'1', b'1', '角色菜单权限关系 根据角色id获取关联权限id集合(包含资源和菜单)', 1435894470432456704, '2022-01-02 21:54:56.627000', 1435894470432456704, '2022-01-02 21:54:56.658000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1477639550426632192, 'UserDeptController#findAllByUser', '根据用户ID获取到部门集合', 'GET', '/user/dept/findAllByUser', '用户部门关联关系', b'1', b'1', '用户部门关联关系 根据用户ID获取到部门集合', 1435894470432456704, '2022-01-02 21:54:56.693000', 1435894470432456704, '2022-01-02 21:54:56.727000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1477639550703456256, 'UserDeptController#findIdsByUser', '根据用户ID获取到部门id集合', 'GET', '/user/dept/findIdsByUser', '用户部门关联关系', b'1', b'1', '用户部门关联关系 根据用户ID获取到部门id集合', 1435894470432456704, '2022-01-02 21:54:56.759000', 1435894470432456704, '2022-01-02 21:54:56.790000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1477639550971891712, 'DataScopeController#saveDeptAssign', '保存关联部门', 'POST', '/data/scope/saveDeptAssign', '数据范围权限配置', b'1', b'1', '数据范围权限配置 保存关联部门', 1435894470432456704, '2022-01-02 21:54:56.823000', 1435894470432456704, '2022-01-02 21:54:56.854000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1477639551227744256, 'PermMenuController#existsByPermCode', '编码是否被使用(不包含自己)', 'GET', '/perm/menu/existsByPermCodeNotId', '菜单权限资源', b'1', b'1', '菜单权限资源 编码是否被使用(不包含自己)', 1435894470432456704, '2022-01-02 21:54:56.884000', 1435894470432456704, '2022-01-02 21:54:56.912000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1477639551512956928, 'DataScopeController#getDeptIds', '获取关联部门id', 'GET', '/data/scope/getDeptIds', '数据范围权限配置', b'1', b'1', '数据范围权限配置 获取关联部门id', 1435894470432456704, '2022-01-02 21:54:56.952000', 1435894470432456704, '2022-01-02 21:54:56.980000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1477639551756226560, 'PermMenuController#resourceList', '资源列表', 'GET', '/perm/menu/resourceList', '菜单权限资源', b'1', b'1', '菜单权限资源 资源列表', 1435894470432456704, '2022-01-02 21:54:57.010000', 1435894470432456704, '2022-01-02 21:54:57.039000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1477639551999496192, 'PermMenuController#existsByPermCode', '编码是否被使用', 'GET', '/perm/menu/existsByPermCode', '菜单权限资源', b'1', b'1', '菜单权限资源 编码是否被使用', 1435894470432456704, '2022-01-02 21:54:57.068000', 1435894470432456704, '2022-01-02 21:54:57.096000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1477639552242765824, 'UserDataScopeController#findAllByUser', '根据用户ID获取到部门集合', 'GET', '/user/data/scope/findAllByUser', '用户数据权限配置', b'1', b'1', '用户数据权限配置 根据用户ID获取到部门集合', 1435894470432456704, '2022-01-02 21:54:57.126000', 1435894470432456704, '2022-01-02 21:54:57.154000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1477639552490229760, 'UserDataScopeController#saveAssign', '给用户分配权限', 'POST', '/user/data/scope/saveAssign', '用户数据权限配置', b'1', b'1', '用户数据权限配置 给用户分配权限', 1435894470432456704, '2022-01-02 21:54:57.185000', 1435894470432456704, '2022-01-02 21:54:57.215000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1477639552754470912, 'UserDataScopeController#findDataScopeIdsByUser', '根据用户ID获取到部门id集合', 'GET', '/user/data/scope/findIdsByUser', '用户数据权限配置', b'1', b'1', '用户数据权限配置 根据用户ID获取到部门id集合', 1435894470432456704, '2022-01-02 21:54:57.248000', 1435894470432456704, '2022-01-02 21:54:57.277000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1477639553001934848, 'RoleMenuController#getPermissions', '获取菜单和资源权限', 'GET', '/role/menu/getPermissions', '角色菜单权限关系', b'1', b'1', '角色菜单权限关系 获取菜单和资源权限', 1435894470432456704, '2022-01-02 21:54:57.307000', 1435894470432456704, '2022-01-02 21:54:57.336000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1478745469436702720, 'DataScopeController#deleteUserAssigns', '批量删除关联用户', 'DELETE', '/data/scope/deleteUserAssigns', '数据范围权限配置', b'1', b'1', '数据范围权限配置 批量删除关联用户', 1399985191002447872, '2022-01-05 23:09:28.333000', 1399985191002447872, '2022-01-05 23:09:28.387000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1478745469906464768, 'DataScopeController#saveUserAssign', '保存关联用户权限', 'POST', '/data/scope/saveUserAssign', '数据范围权限配置', b'1', b'1', '数据范围权限配置 保存关联用户权限', 1399985191002447872, '2022-01-05 23:09:28.444000', 1399985191002447872, '2022-01-05 23:09:28.495000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1478745470342672384, 'DataScopeController#findUsersByDataScopeId', '获取关联的用户列表', 'GET', '/data/scope/findUsersByDataScopeId', '数据范围权限配置', b'1', b'1', '数据范围权限配置 获取关联的用户列表', 1399985191002447872, '2022-01-05 23:09:28.548000', 1399985191002447872, '2022-01-05 23:09:28.599000', b'0', 0);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iam_role
-- ----------------------------
INSERT INTO `iam_role` VALUES (1405414804771971072, 'admin', '管理员', b'1', '管理员', 1, '2021-06-17 14:39:35', 1399985191002447872, '2021-07-18 22:31:02', 6, 0);
INSERT INTO `iam_role` VALUES (1416730722714144768, 'test', '测试', b'0', '测试角色', 1399985191002447872, '2021-07-18 20:05:01', 1399985191002447872, '2021-07-18 20:16:15', 1, 0);
INSERT INTO `iam_role` VALUES (1422832797731778562, 'user', '用户', b'0', '用户角色', 0, '2021-08-04 16:12:29', 1399985191002447872, '2021-08-04 16:15:03', 7, 0);
INSERT INTO `iam_role` VALUES (1428891259564445696, 'manager', '管理者', b'0', 'manager管理者', 1399985191002447872, '2021-08-21 09:26:38', 1399985191002447872, '2021-08-21 09:26:39', 0, 1);
INSERT INTO `iam_role` VALUES (1495696624097165312, '001', '项目经理', b'0', '', 1414143554414059520, '2022-02-21 17:47:19', 1414143554414059520, '2022-02-21 17:47:19', 0, 1);

-- ----------------------------
-- Table structure for iam_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `iam_role_menu`;
CREATE TABLE `iam_role_menu`  (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `permission_id` bigint(20) NOT NULL COMMENT '菜单权限id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_group_role_per_id`(`role_id`, `permission_id`) USING BTREE,
  INDEX `index_group_role_id`(`role_id`) USING BTREE,
  INDEX `index_group_per_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单权限表' ROW_FORMAT = Dynamic;

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
  INDEX `index_group_role_per_id`(`role_id`, `permission_id`) USING BTREE,
  INDEX `index_group_role_id`(`role_id`) USING BTREE,
  INDEX `index_group_per_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色请求权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iam_role_path
-- ----------------------------
INSERT INTO `iam_role_path` VALUES (1478744660678422528, 1405414804771971072, 1472904372126982144);
INSERT INTO `iam_role_path` VALUES (1478745005462794240, 1405414804771971072, 1472904372441554944);
INSERT INTO `iam_role_path` VALUES (1478745005471182848, 1405414804771971072, 1472904372798070784);
INSERT INTO `iam_role_path` VALUES (1478745005475377154, 1405414804771971072, 1472904373150392320);
INSERT INTO `iam_role_path` VALUES (1478745005483765761, 1405414804771971072, 1472904373515296768);
INSERT INTO `iam_role_path` VALUES (1478744660691005441, 1405414804771971072, 1472904373825675264);
INSERT INTO `iam_role_path` VALUES (1478745005487960065, 1405414804771971072, 1472904374215745536);
INSERT INTO `iam_role_path` VALUES (1478744660691005442, 1405414804771971072, 1472904374521929728);
INSERT INTO `iam_role_path` VALUES (1478744660703588352, 1405414804771971072, 1472904374870056960);
INSERT INTO `iam_role_path` VALUES (1478744660703588353, 1405414804771971072, 1472904375226572800);
INSERT INTO `iam_role_path` VALUES (1478745005487960066, 1405414804771971072, 1472904375755055104);
INSERT INTO `iam_role_path` VALUES (1478745005496348672, 1405414804771971072, 1472904376191262720);
INSERT INTO `iam_role_path` VALUES (1478744660707782656, 1405414804771971072, 1472904376728133632);
INSERT INTO `iam_role_path` VALUES (1478745005496348673, 1405414804771971072, 1472904377281781760);
INSERT INTO `iam_role_path` VALUES (1478745005496348677, 1405414804771971072, 1472904377638297600);
INSERT INTO `iam_role_path` VALUES (1478745005504737281, 1405414804771971072, 1472904377957064704);
INSERT INTO `iam_role_path` VALUES (1478745005508931587, 1405414804771971072, 1472904378300997632);
INSERT INTO `iam_role_path` VALUES (1478745005513125893, 1405414804771971072, 1472904378691067904);
INSERT INTO `iam_role_path` VALUES (1478745005517320196, 1405414804771971072, 1472904379093721088);
INSERT INTO `iam_role_path` VALUES (1478745005521514498, 1405414804771971072, 1472904379609620480);
INSERT INTO `iam_role_path` VALUES (1478745005517320192, 1405414804771971072, 1472904379924193280);
INSERT INTO `iam_role_path` VALUES (1478745005471182849, 1405414804771971072, 1472904380314263552);
INSERT INTO `iam_role_path` VALUES (1478745005529903104, 1405414804771971072, 1472904381316702208);
INSERT INTO `iam_role_path` VALUES (1478745005517320193, 1405414804771971072, 1472904381656440832);
INSERT INTO `iam_role_path` VALUES (1478744688063033344, 1405414804771971072, 1472904382033928192);
INSERT INTO `iam_role_path` VALUES (1478744660703588354, 1405414804771971072, 1472904382365278208);
INSERT INTO `iam_role_path` VALUES (1478745005483765762, 1405414804771971072, 1472904382675656704);
INSERT INTO `iam_role_path` VALUES (1478744660711976960, 1405414804771971072, 1472904383036366848);
INSERT INTO `iam_role_path` VALUES (1478744660720365568, 1405414804771971072, 1472904383350939648);
INSERT INTO `iam_role_path` VALUES (1478745005534097411, 1405414804771971072, 1472904383673901056);
INSERT INTO `iam_role_path` VALUES (1478745005538291719, 1405414804771971072, 1472904383984279552);
INSERT INTO `iam_role_path` VALUES (1478745005542486021, 1405414804771971072, 1472904384319823872);
INSERT INTO `iam_role_path` VALUES (1478745005546680327, 1405414804771971072, 1472904384651173888);
INSERT INTO `iam_role_path` VALUES (1478745005550874626, 1405414804771971072, 1472904385032855552);
INSERT INTO `iam_role_path` VALUES (1478745005496348674, 1405414804771971072, 1472904385360011264);
INSERT INTO `iam_role_path` VALUES (1478745005508931588, 1405414804771971072, 1472904385737498624);
INSERT INTO `iam_role_path` VALUES (1478745005487960067, 1405414804771971072, 1472904386098208768);
INSERT INTO `iam_role_path` VALUES (1478745005529903105, 1405414804771971072, 1472904386396004352);
INSERT INTO `iam_role_path` VALUES (1478745005550874631, 1405414804771971072, 1472904386710577152);
INSERT INTO `iam_role_path` VALUES (1478745005508931589, 1405414804771971072, 1472904387226476544);
INSERT INTO `iam_role_path` VALUES (1478744660720365569, 1405414804771971072, 1472904387532660736);
INSERT INTO `iam_role_path` VALUES (1478744660695199744, 1405414804771971072, 1472904387838844928);
INSERT INTO `iam_role_path` VALUES (1478745005555068929, 1405414804771971072, 1472904388157612032);
INSERT INTO `iam_role_path` VALUES (1478745005534097412, 1405414804771971072, 1472904388509933568);
INSERT INTO `iam_role_path` VALUES (1478745005559263232, 1405414804771971072, 1472904388891615232);
INSERT INTO `iam_role_path` VALUES (1478745005542486022, 1405414804771971072, 1472904389206188032);
INSERT INTO `iam_role_path` VALUES (1478745005521514499, 1405414804771971072, 1472904389571092480);
INSERT INTO `iam_role_path` VALUES (1478745005559263240, 1405414804771971072, 1472904389898248192);
INSERT INTO `iam_role_path` VALUES (1478745005567651840, 1405414804771971072, 1472904390372204544);
INSERT INTO `iam_role_path` VALUES (1478745005550874627, 1405414804771971072, 1472904390682583040);
INSERT INTO `iam_role_path` VALUES (1478745005550874628, 1405414804771971072, 1472904391018127360);
INSERT INTO `iam_role_path` VALUES (1478745005500542976, 1405414804771971072, 1472904391445946368);
INSERT INTO `iam_role_path` VALUES (1478745005496348675, 1405414804771971072, 1472904391756324864);
INSERT INTO `iam_role_path` VALUES (1478745005555068930, 1405414804771971072, 1472904392054120448);
INSERT INTO `iam_role_path` VALUES (1478745005563457536, 1405414804771971072, 1472904392393859072);
INSERT INTO `iam_role_path` VALUES (1478745005555068928, 1405414804771971072, 1472904392737792000);
INSERT INTO `iam_role_path` VALUES (1478745005567651842, 1405414804771971072, 1472904393123667968);
INSERT INTO `iam_role_path` VALUES (1478745005500542977, 1405414804771971072, 1472904393429852160);
INSERT INTO `iam_role_path` VALUES (1478744688067227648, 1405414804771971072, 1472904393769590784);
INSERT INTO `iam_role_path` VALUES (1478745005513125888, 1405414804771971072, 1472904394155466752);
INSERT INTO `iam_role_path` VALUES (1478745005466988544, 1405414804771971072, 1472904394524565504);
INSERT INTO `iam_role_path` VALUES (1478744660695199745, 1405414804771971072, 1472904394868498432);
INSERT INTO `iam_role_path` VALUES (1478745005567651846, 1405414804771971072, 1472904395204042752);
INSERT INTO `iam_role_path` VALUES (1478744688067227649, 1405414804771971072, 1472904395552169984);
INSERT INTO `iam_role_path` VALUES (1478745005559263233, 1405414804771971072, 1472904395963211776);
INSERT INTO `iam_role_path` VALUES (1478745005563457537, 1405414804771971072, 1472904396269395968);
INSERT INTO `iam_role_path` VALUES (1478745005567651848, 1405414804771971072, 1472904396634300416);
INSERT INTO `iam_role_path` VALUES (1478745005571846150, 1405414804771971072, 1472904396957261824);
INSERT INTO `iam_role_path` VALUES (1478745005487960068, 1405414804771971072, 1472904397288611840);
INSERT INTO `iam_role_path` VALUES (1478745005475377155, 1405414804771971072, 1472904397997449216);
INSERT INTO `iam_role_path` VALUES (1478745005475377156, 1405414804771971072, 1472904398316216320);
INSERT INTO `iam_role_path` VALUES (1478745005576040451, 1405414804771971072, 1472904398634983424);
INSERT INTO `iam_role_path` VALUES (1478745005555068931, 1405414804771971072, 1472904398995693568);
INSERT INTO `iam_role_path` VALUES (1478745005529903106, 1405414804771971072, 1472904399348015104);
INSERT INTO `iam_role_path` VALUES (1478745005529903107, 1405414804771971072, 1472904399645810688);
INSERT INTO `iam_role_path` VALUES (1478745005571846144, 1405414804771971072, 1472904400182681600);
INSERT INTO `iam_role_path` VALUES (1478745005529903108, 1405414804771971072, 1472904400614694912);
INSERT INTO `iam_role_path` VALUES (1478745005576040454, 1405414804771971072, 1472904400925073408);
INSERT INTO `iam_role_path` VALUES (1478745005521514500, 1405414804771971072, 1472904401260617728);
INSERT INTO `iam_role_path` VALUES (1478745005513125889, 1405414804771971072, 1472904401923317760);
INSERT INTO `iam_role_path` VALUES (1478745005492154368, 1405414804771971072, 1472904402242084864);
INSERT INTO `iam_role_path` VALUES (1478744660707782657, 1405414804771971072, 1472904402598600704);
INSERT INTO `iam_role_path` VALUES (1478745005479571456, 1405414804771971072, 1472904402963505152);
INSERT INTO `iam_role_path` VALUES (1478745005576040456, 1405414804771971072, 1472904403290660864);
INSERT INTO `iam_role_path` VALUES (1478745005580234754, 1405414804771971072, 1472904403638788096);
INSERT INTO `iam_role_path` VALUES (1478745005584429058, 1405414804771971072, 1472904403936583680);
INSERT INTO `iam_role_path` VALUES (1478745005492154369, 1405414804771971072, 1472904405199069184);
INSERT INTO `iam_role_path` VALUES (1478745005576040452, 1405414804771971072, 1472904406344114176);
INSERT INTO `iam_role_path` VALUES (1478745005521514501, 1405414804771971072, 1472904407761788928);
INSERT INTO `iam_role_path` VALUES (1478745005513125890, 1405414804771971072, 1472904408109916160);
INSERT INTO `iam_role_path` VALUES (1478744660720365570, 1405414804771971072, 1472904408508375040);
INSERT INTO `iam_role_path` VALUES (1478745005504737282, 1405414804771971072, 1472904408818753536);
INSERT INTO `iam_role_path` VALUES (1478745005538291712, 1405414804771971072, 1472904409137520640);
INSERT INTO `iam_role_path` VALUES (1478744660724559872, 1405414804771971072, 1472904409481453568);
INSERT INTO `iam_role_path` VALUES (1478745005513125891, 1405414804771971072, 1472904409875718144);
INSERT INTO `iam_role_path` VALUES (1478745005588623361, 1405414804771971072, 1472904410228039680);
INSERT INTO `iam_role_path` VALUES (1478745005576040455, 1405414804771971072, 1472904410609721344);
INSERT INTO `iam_role_path` VALUES (1478745005588623364, 1405414804771971072, 1472904410966237184);
INSERT INTO `iam_role_path` VALUES (1478745005567651843, 1405414804771971072, 1472904411389861888);
INSERT INTO `iam_role_path` VALUES (1478745005576040453, 1405414804771971072, 1472904411721211904);
INSERT INTO `iam_role_path` VALUES (1478745005542486023, 1405414804771971072, 1472904412052561920);
INSERT INTO `iam_role_path` VALUES (1478745005584429059, 1405414804771971072, 1472904412434243584);
INSERT INTO `iam_role_path` VALUES (1478745005517320194, 1405414804771971072, 1472904412799148032);
INSERT INTO `iam_role_path` VALUES (1478745005592817664, 1405414804771971072, 1472904413239549952);
INSERT INTO `iam_role_path` VALUES (1478745005483765763, 1405414804771971072, 1472904413591871488);
INSERT INTO `iam_role_path` VALUES (1478745005592817667, 1405414804771971072, 1472904413977747456);
INSERT INTO `iam_role_path` VALUES (1478745005496348676, 1405414804771971072, 1472904414321680384);
INSERT INTO `iam_role_path` VALUES (1478745005571846151, 1405414804771971072, 1472904414632058880);
INSERT INTO `iam_role_path` VALUES (1478745005521514502, 1405414804771971072, 1472904415101820928);
INSERT INTO `iam_role_path` VALUES (1478745005580234755, 1405414804771971072, 1472904415454142464);
INSERT INTO `iam_role_path` VALUES (1478745005592817668, 1405414804771971072, 1472904415760326656);
INSERT INTO `iam_role_path` VALUES (1478745005588623362, 1405414804771971072, 1472904416070705152);
INSERT INTO `iam_role_path` VALUES (1478745005504737283, 1405414804771971072, 1472904416381083648);
INSERT INTO `iam_role_path` VALUES (1478745005592817670, 1405414804771971072, 1472904416695656448);
INSERT INTO `iam_role_path` VALUES (1478745005517320197, 1405414804771971072, 1472904417081532416);
INSERT INTO `iam_role_path` VALUES (1478745005597011968, 1405414804771971072, 1472904417442242560);
INSERT INTO `iam_role_path` VALUES (1478745005559263234, 1405414804771971072, 1472904417756815360);
INSERT INTO `iam_role_path` VALUES (1478745005580234756, 1405414804771971072, 1472904418067193856);
INSERT INTO `iam_role_path` VALUES (1478745005538291713, 1405414804771971072, 1472904418415321088);
INSERT INTO `iam_role_path` VALUES (1478745005508931584, 1405414804771971072, 1472904418721505280);
INSERT INTO `iam_role_path` VALUES (1478745005550874629, 1405414804771971072, 1472904419078021120);
INSERT INTO `iam_role_path` VALUES (1478745005500542978, 1405414804771971072, 1472904419375816704);
INSERT INTO `iam_role_path` VALUES (1478744660695199746, 1405414804771971072, 1472904419778469888);
INSERT INTO `iam_role_path` VALUES (1478745005529903109, 1405414804771971072, 1472904420118208512);
INSERT INTO `iam_role_path` VALUES (1478745005555068932, 1405414804771971072, 1472904420478918656);
INSERT INTO `iam_role_path` VALUES (1478745005576040448, 1405414804771971072, 1472904420831240192);
INSERT INTO `iam_role_path` VALUES (1478745005597011970, 1405414804771971072, 1472904421183561728);
INSERT INTO `iam_role_path` VALUES (1478745005555068933, 1405414804771971072, 1472904421514911744);
INSERT INTO `iam_role_path` VALUES (1478745005597011974, 1405414804771971072, 1472904421854650368);
INSERT INTO `iam_role_path` VALUES (1478745005538291714, 1405414804771971072, 1472904422181806080);
INSERT INTO `iam_role_path` VALUES (1478745005542486016, 1405414804771971072, 1472904422542516224);
INSERT INTO `iam_role_path` VALUES (1478745005601206272, 1405414804771971072, 1472904422873866240);
INSERT INTO `iam_role_path` VALUES (1478745005546680320, 1405414804771971072, 1472904423251353600);
INSERT INTO `iam_role_path` VALUES (1478744660724559873, 1405414804771971072, 1472904423662395392);
INSERT INTO `iam_role_path` VALUES (1478745005580234757, 1405414804771971072, 1472904423985356800);
INSERT INTO `iam_role_path` VALUES (1478745005546680321, 1405414804771971072, 1472904424392204288);
INSERT INTO `iam_role_path` VALUES (1478745005559263235, 1405414804771971072, 1472904425017155584);
INSERT INTO `iam_role_path` VALUES (1478744660724559874, 1405414804771971072, 1472904425331728384);
INSERT INTO `iam_role_path` VALUES (1478744660699394048, 1405414804771971072, 1472904425717604352);
INSERT INTO `iam_role_path` VALUES (1478745005471182850, 1405414804771971072, 1472904426057342976);
INSERT INTO `iam_role_path` VALUES (1478745005479571457, 1405414804771971072, 1472904426376110080);
INSERT INTO `iam_role_path` VALUES (1478745005466988545, 1405414804771971072, 1472904426699071488);
INSERT INTO `iam_role_path` VALUES (1478745005546680322, 1405414804771971072, 1472904427055587328);
INSERT INTO `iam_role_path` VALUES (1478745005479571458, 1405414804771971072, 1472904427437268992);
INSERT INTO `iam_role_path` VALUES (1478745005601206275, 1405414804771971072, 1472904427772813312);
INSERT INTO `iam_role_path` VALUES (1478745005471182851, 1405414804771971072, 1472904428120940544);
INSERT INTO `iam_role_path` VALUES (1478744660703588355, 1405414804771971072, 1472904428460679168);
INSERT INTO `iam_role_path` VALUES (1478745005471182852, 1405414804771971072, 1472904428804612096);
INSERT INTO `iam_role_path` VALUES (1478745005500542979, 1405414804771971072, 1472904429140156416);
INSERT INTO `iam_role_path` VALUES (1478745005559263236, 1405414804771971072, 1472904429500866560);
INSERT INTO `iam_role_path` VALUES (1478745005597011971, 1405414804771971072, 1472904429840605184);
INSERT INTO `iam_role_path` VALUES (1478745005576040449, 1405414804771971072, 1472904430276812800);
INSERT INTO `iam_role_path` VALUES (1478745005492154370, 1405414804771971072, 1472904430603968512);
INSERT INTO `iam_role_path` VALUES (1478745005563457538, 1405414804771971072, 1472904430956290048);
INSERT INTO `iam_role_path` VALUES (1478745005584429060, 1405414804771971072, 1472904431279251456);
INSERT INTO `iam_role_path` VALUES (1478745005580234758, 1405414804771971072, 1472904431635767296);
INSERT INTO `iam_role_path` VALUES (1478745005555068934, 1405414804771971072, 1472904432021643264);
INSERT INTO `iam_role_path` VALUES (1478744660711976961, 1405414804771971072, 1472904432415907840);
INSERT INTO `iam_role_path` VALUES (1478745005483765764, 1405414804771971072, 1472904432755646464);
INSERT INTO `iam_role_path` VALUES (1478745005559263237, 1405414804771971072, 1472904433107968000);
INSERT INTO `iam_role_path` VALUES (1478745005584429061, 1405414804771971072, 1472904433451900928);
INSERT INTO `iam_role_path` VALUES (1478745005529903110, 1405414804771971072, 1472904433779056640);
INSERT INTO `iam_role_path` VALUES (1478745005597011969, 1405414804771971072, 1472904434492088320);
INSERT INTO `iam_role_path` VALUES (1478745005571846145, 1405414804771971072, 1472904436618600448);
INSERT INTO `iam_role_path` VALUES (1478745005534097408, 1405414804771971072, 1472904436979310592);
INSERT INTO `iam_role_path` VALUES (1478745005580234759, 1405414804771971072, 1472904437356797952);
INSERT INTO `iam_role_path` VALUES (1478745005601206273, 1405414804771971072, 1472904437742673920);
INSERT INTO `iam_role_path` VALUES (1478745005500542980, 1405414804771971072, 1472904438153715712);
INSERT INTO `iam_role_path` VALUES (1478745005563457539, 1405414804771971072, 1472904438606700544);
INSERT INTO `iam_role_path` VALUES (1478745005571846146, 1405414804771971072, 1472904438942244864);
INSERT INTO `iam_role_path` VALUES (1478745005601206277, 1405414804771971072, 1472904439298760704);
INSERT INTO `iam_role_path` VALUES (1478745005542486017, 1405414804771971072, 1472904439609139200);
INSERT INTO `iam_role_path` VALUES (1478745005508931585, 1405414804771971072, 1472904439927906304);
INSERT INTO `iam_role_path` VALUES (1478744660686811136, 1405414804771971072, 1472904440393474048);
INSERT INTO `iam_role_path` VALUES (1478745005500542981, 1405414804771971072, 1472904440880013312);
INSERT INTO `iam_role_path` VALUES (1478744660711976962, 1405414804771971072, 1472904441207169024);
INSERT INTO `iam_role_path` VALUES (1478745005563457540, 1405414804771971072, 1472904441517547520);
INSERT INTO `iam_role_path` VALUES (1478745005538291715, 1405414804771971072, 1472904441886646272);
INSERT INTO `iam_role_path` VALUES (1478745005538291716, 1405414804771971072, 1472904442209607680);
INSERT INTO `iam_role_path` VALUES (1478745005546680323, 1405414804771971072, 1472904442519986176);
INSERT INTO `iam_role_path` VALUES (1478745005513125892, 1405414804771971072, 1472904442981359616);
INSERT INTO `iam_role_path` VALUES (1478745005580234760, 1405414804771971072, 1472904443291738112);
INSERT INTO `iam_role_path` VALUES (1478745005584429062, 1405414804771971072, 1472904443652448256);
INSERT INTO `iam_role_path` VALUES (1478745005471182853, 1405414804771971072, 1472904443983798272);
INSERT INTO `iam_role_path` VALUES (1478745005559263238, 1405414804771971072, 1472904444315148288);
INSERT INTO `iam_role_path` VALUES (1478745005571846147, 1405414804771971072, 1472904444638109696);
INSERT INTO `iam_role_path` VALUES (1478745005479571459, 1405414804771971072, 1472904444956876800);
INSERT INTO `iam_role_path` VALUES (1478745005475377152, 1405414804771971072, 1472904445275643904);
INSERT INTO `iam_role_path` VALUES (1478745005584429056, 1405414804771971072, 1472904445636354048);
INSERT INTO `iam_role_path` VALUES (1478745005542486018, 1405414804771971072, 1472904445963509760);
INSERT INTO `iam_role_path` VALUES (1478745005534097409, 1405414804771971072, 1472904446420688896);
INSERT INTO `iam_role_path` VALUES (1478745005601206274, 1405414804771971072, 1472904446768816128);
INSERT INTO `iam_role_path` VALUES (1478745005517320195, 1405414804771971072, 1472904447163080704);
INSERT INTO `iam_role_path` VALUES (1478745005605400576, 1405414804771971072, 1472904447460876288);
INSERT INTO `iam_role_path` VALUES (1478745005567651847, 1405414804771971072, 1472904447788032000);
INSERT INTO `iam_role_path` VALUES (1478745005567651844, 1405414804771971072, 1472904448131964928);
INSERT INTO `iam_role_path` VALUES (1478745005483765760, 1405414804771971072, 1472904448488480768);
INSERT INTO `iam_role_path` VALUES (1478745005546680324, 1405414804771971072, 1472904448811442176);
INSERT INTO `iam_role_path` VALUES (1478745005546680325, 1405414804771971072, 1472904449142792192);
INSERT INTO `iam_role_path` VALUES (1478745005601206278, 1405414804771971072, 1472904449507696640);
INSERT INTO `iam_role_path` VALUES (1478745005542486019, 1405414804771971072, 1472904449813880832);
INSERT INTO `iam_role_path` VALUES (1478745005525708800, 1405414804771971072, 1472904450153619456);
INSERT INTO `iam_role_path` VALUES (1478745005584429057, 1405414804771971072, 1472904450602409984);
INSERT INTO `iam_role_path` VALUES (1478745005571846148, 1405414804771971072, 1472904450963120128);
INSERT INTO `iam_role_path` VALUES (1478745005492154371, 1405414804771971072, 1472904451374161920);
INSERT INTO `iam_role_path` VALUES (1478745005588623363, 1405414804771971072, 1472904451684540416);
INSERT INTO `iam_role_path` VALUES (1478745005592817669, 1405414804771971072, 1472904452011696128);
INSERT INTO `iam_role_path` VALUES (1478745005534097410, 1405414804771971072, 1472904452326268928);
INSERT INTO `iam_role_path` VALUES (1478745005525708801, 1405414804771971072, 1472904452695367680);
INSERT INTO `iam_role_path` VALUES (1478745005592817665, 1405414804771971072, 1472904453014134784);
INSERT INTO `iam_role_path` VALUES (1478745005588623365, 1405414804771971072, 1472904453395816448);
INSERT INTO `iam_role_path` VALUES (1478745005571846149, 1405414804771971072, 1472904453722972160);
INSERT INTO `iam_role_path` VALUES (1478745005605400577, 1405414804771971072, 1472904454066905088);
INSERT INTO `iam_role_path` VALUES (1478745005605400579, 1405414804771971072, 1472904454402449408);
INSERT INTO `iam_role_path` VALUES (1478744660699394049, 1405414804771971072, 1472904454754770944);
INSERT INTO `iam_role_path` VALUES (1478745005592817666, 1405414804771971072, 1472904455446831104);
INSERT INTO `iam_role_path` VALUES (1478745005475377153, 1405414804771971072, 1472904455824318464);
INSERT INTO `iam_role_path` VALUES (1478745005525708802, 1405414804771971072, 1472904456130502656);
INSERT INTO `iam_role_path` VALUES (1478745005538291717, 1405414804771971072, 1472904456474435584);
INSERT INTO `iam_role_path` VALUES (1478744688067227650, 1405414804771971072, 1472904456809979904);
INSERT INTO `iam_role_path` VALUES (1478745005601206276, 1405414804771971072, 1472904457158107136);
INSERT INTO `iam_role_path` VALUES (1478745005546680328, 1405414804771971072, 1472904457464291328);
INSERT INTO `iam_role_path` VALUES (1478745005483765765, 1405414804771971072, 1472904457812418560);
INSERT INTO `iam_role_path` VALUES (1478745005563457541, 1405414804771971072, 1472904459070709760);
INSERT INTO `iam_role_path` VALUES (1478745005487960064, 1405414804771971072, 1472904459397865472);
INSERT INTO `iam_role_path` VALUES (1478745005542486020, 1405414804771971072, 1472904459762769920);
INSERT INTO `iam_role_path` VALUES (1478745005517320198, 1405414804771971072, 1472904460182200320);
INSERT INTO `iam_role_path` VALUES (1478745005567651841, 1405414804771971072, 1472904460521938944);
INSERT INTO `iam_role_path` VALUES (1478745005576040450, 1405414804771971072, 1472904461213999104);
INSERT INTO `iam_role_path` VALUES (1478745005492154372, 1405414804771971072, 1472904461541154816);
INSERT INTO `iam_role_path` VALUES (1478745005597011972, 1405414804771971072, 1472904461893476352);
INSERT INTO `iam_role_path` VALUES (1478744688067227651, 1405414804771971072, 1472904462208049152);
INSERT INTO `iam_role_path` VALUES (1478744688067227652, 1405414804771971072, 1472904462577147904);
INSERT INTO `iam_role_path` VALUES (1478745005525708803, 1405414804771971072, 1472904462912692224);
INSERT INTO `iam_role_path` VALUES (1478745005563457542, 1405414804771971072, 1472904463248236544);
INSERT INTO `iam_role_path` VALUES (1478745005597011973, 1405414804771971072, 1472904463596363776);
INSERT INTO `iam_role_path` VALUES (1478745005504737280, 1405414804771971072, 1472904463923519488);
INSERT INTO `iam_role_path` VALUES (1478745005525708804, 1405414804771971072, 1472904464305201152);
INSERT INTO `iam_role_path` VALUES (1478744660711976963, 1405414804771971072, 1472904464640745472);
INSERT INTO `iam_role_path` VALUES (1478745005559263239, 1405414804771971072, 1472904464967901184);
INSERT INTO `iam_role_path` VALUES (1478744660691005440, 1405414804771971072, 1472904465320222720);
INSERT INTO `iam_role_path` VALUES (1478745005521514496, 1405414804771971072, 1472904465693515776);
INSERT INTO `iam_role_path` VALUES (1478745005550874630, 1405414804771971072, 1472904466008088576);
INSERT INTO `iam_role_path` VALUES (1478745005588623366, 1405414804771971072, 1472904466352021504);
INSERT INTO `iam_role_path` VALUES (1478745005588623360, 1405414804771971072, 1472904466712731648);
INSERT INTO `iam_role_path` VALUES (1478744660699394050, 1405414804771971072, 1472904467018915840);
INSERT INTO `iam_role_path` VALUES (1478745005567651845, 1405414804771971072, 1472904467350265856);
INSERT INTO `iam_role_path` VALUES (1478744688071421952, 1405414804771971072, 1472904467740336128);
INSERT INTO `iam_role_path` VALUES (1478745005605400578, 1405414804771971072, 1472904468138795008);
INSERT INTO `iam_role_path` VALUES (1478745005525708805, 1405414804771971072, 1472904468524670976);
INSERT INTO `iam_role_path` VALUES (1478745005538291718, 1405414804771971072, 1472904468839243776);
INSERT INTO `iam_role_path` VALUES (1478745005508931586, 1405414804771971072, 1472904469208342528);
INSERT INTO `iam_role_path` VALUES (1478745005605400580, 1405414804771971072, 1472904469506138112);
INSERT INTO `iam_role_path` VALUES (1478745005546680326, 1405414804771971072, 1472904469871042560);
INSERT INTO `iam_role_path` VALUES (1478745005521514497, 1405414804771971072, 1472904470273695744);
INSERT INTO `iam_role_path` VALUES (1478745005563457543, 1405414804771971072, 1472904471162888192);
INSERT INTO `iam_role_path` VALUES (1478745005605400581, 1405414804771971072, 1474682764627210240);
INSERT INTO `iam_role_path` VALUES (1478745005605400582, 1405414804771971072, 1474682764669153280);
INSERT INTO `iam_role_path` VALUES (1478745005605400583, 1405414804771971072, 1474682764681736192);
INSERT INTO `iam_role_path` VALUES (1478745005605400584, 1405414804771971072, 1474682764694319104);
INSERT INTO `iam_role_path` VALUES (1478745005605400585, 1405414804771971072, 1474682764706902016);
INSERT INTO `iam_role_path` VALUES (1478745005609594880, 1405414804771971072, 1474682764723679232);
INSERT INTO `iam_role_path` VALUES (1478745005609594881, 1405414804771971072, 1474682764736262144);
INSERT INTO `iam_role_path` VALUES (1478745005609594882, 1405414804771971072, 1474682764744650752);
INSERT INTO `iam_role_path` VALUES (1478745005609594883, 1405414804771971072, 1474682764753039360);
INSERT INTO `iam_role_path` VALUES (1478745005609594884, 1405414804771971072, 1474682764757233664);
INSERT INTO `iam_role_path` VALUES (1478744660716171264, 1405414804771971072, 1477639549566799872);
INSERT INTO `iam_role_path` VALUES (1478744660716171265, 1405414804771971072, 1477639549885566976);
INSERT INTO `iam_role_path` VALUES (1478745005550874624, 1405414804771971072, 1477639550149808128);
INSERT INTO `iam_role_path` VALUES (1478745005580234752, 1405414804771971072, 1477639550426632192);
INSERT INTO `iam_role_path` VALUES (1478745005580234753, 1405414804771971072, 1477639550703456256);
INSERT INTO `iam_role_path` VALUES (1478745005609594885, 1405414804771971072, 1477639550971891712);
INSERT INTO `iam_role_path` VALUES (1478744660716171266, 1405414804771971072, 1477639551227744256);
INSERT INTO `iam_role_path` VALUES (1478745005609594886, 1405414804771971072, 1477639551512956928);
INSERT INTO `iam_role_path` VALUES (1478744660716171267, 1405414804771971072, 1477639551756226560);
INSERT INTO `iam_role_path` VALUES (1478744660716171268, 1405414804771971072, 1477639551999496192);
INSERT INTO `iam_role_path` VALUES (1478745005609594887, 1405414804771971072, 1477639552242765824);
INSERT INTO `iam_role_path` VALUES (1478745005609594888, 1405414804771971072, 1477639552490229760);
INSERT INTO `iam_role_path` VALUES (1478745005613789184, 1405414804771971072, 1477639552754470912);
INSERT INTO `iam_role_path` VALUES (1478745005550874625, 1405414804771971072, 1477639553001934848);
INSERT INTO `iam_role_path` VALUES (1477991171316699136, 1416730722714144768, 1472904372126982144);
INSERT INTO `iam_role_path` VALUES (1477991171320893442, 1416730722714144768, 1472904372441554944);
INSERT INTO `iam_role_path` VALUES (1477991171329282048, 1416730722714144768, 1472904372798070784);
INSERT INTO `iam_role_path` VALUES (1477991171333476356, 1416730722714144768, 1472904373150392320);
INSERT INTO `iam_role_path` VALUES (1477991171341864962, 1416730722714144768, 1472904373515296768);
INSERT INTO `iam_role_path` VALUES (1477991171346059267, 1416730722714144768, 1472904373825675264);
INSERT INTO `iam_role_path` VALUES (1477991171346059268, 1416730722714144768, 1472904374215745536);
INSERT INTO `iam_role_path` VALUES (1477991171354447873, 1416730722714144768, 1472904374521929728);
INSERT INTO `iam_role_path` VALUES (1477991171358642176, 1416730722714144768, 1472904374870056960);
INSERT INTO `iam_role_path` VALUES (1477991171358642177, 1416730722714144768, 1472904375226572800);
INSERT INTO `iam_role_path` VALUES (1477991171346059269, 1416730722714144768, 1472904375755055104);
INSERT INTO `iam_role_path` VALUES (1477991171358642180, 1416730722714144768, 1472904376191262720);
INSERT INTO `iam_role_path` VALUES (1477991171358642181, 1416730722714144768, 1472904376728133632);
INSERT INTO `iam_role_path` VALUES (1477991171358642183, 1416730722714144768, 1472904377281781760);
INSERT INTO `iam_role_path` VALUES (1477991171362836483, 1416730722714144768, 1472904377638297600);
INSERT INTO `iam_role_path` VALUES (1477991171367030787, 1416730722714144768, 1472904377957064704);
INSERT INTO `iam_role_path` VALUES (1477991171371225089, 1416730722714144768, 1472904378300997632);
INSERT INTO `iam_role_path` VALUES (1477991171375419392, 1416730722714144768, 1472904378691067904);
INSERT INTO `iam_role_path` VALUES (1477991171375419397, 1416730722714144768, 1472904379093721088);
INSERT INTO `iam_role_path` VALUES (1477991171379613700, 1416730722714144768, 1472904379609620480);
INSERT INTO `iam_role_path` VALUES (1477991171375419393, 1416730722714144768, 1472904379924193280);
INSERT INTO `iam_role_path` VALUES (1477991171329282049, 1416730722714144768, 1472904380314263552);
INSERT INTO `iam_role_path` VALUES (1477991171388002305, 1416730722714144768, 1472904381316702208);
INSERT INTO `iam_role_path` VALUES (1477991171375419394, 1416730722714144768, 1472904381656440832);
INSERT INTO `iam_role_path` VALUES (1477991171392196613, 1416730722714144768, 1472904382033928192);
INSERT INTO `iam_role_path` VALUES (1477991171358642178, 1416730722714144768, 1472904382365278208);
INSERT INTO `iam_role_path` VALUES (1477991171341864963, 1416730722714144768, 1472904382675656704);
INSERT INTO `iam_role_path` VALUES (1477991171396390918, 1416730722714144768, 1472904383036366848);
INSERT INTO `iam_role_path` VALUES (1477991171404779520, 1416730722714144768, 1472904383350939648);
INSERT INTO `iam_role_path` VALUES (1477991171408973825, 1416730722714144768, 1472904383673901056);
INSERT INTO `iam_role_path` VALUES (1477991171413168131, 1416730722714144768, 1472904383984279552);
INSERT INTO `iam_role_path` VALUES (1477991171417362432, 1416730722714144768, 1472904384319823872);
INSERT INTO `iam_role_path` VALUES (1477991171421556736, 1416730722714144768, 1472904384651173888);
INSERT INTO `iam_role_path` VALUES (1477991171421556740, 1416730722714144768, 1472904385032855552);
INSERT INTO `iam_role_path` VALUES (1477991171362836480, 1416730722714144768, 1472904385360011264);
INSERT INTO `iam_role_path` VALUES (1477991171371225090, 1416730722714144768, 1472904385737498624);
INSERT INTO `iam_role_path` VALUES (1477991171350253568, 1416730722714144768, 1472904386098208768);
INSERT INTO `iam_role_path` VALUES (1477991171388002306, 1416730722714144768, 1472904386396004352);
INSERT INTO `iam_role_path` VALUES (1477991171421556745, 1416730722714144768, 1472904386710577152);
INSERT INTO `iam_role_path` VALUES (1477991171371225091, 1416730722714144768, 1472904387226476544);
INSERT INTO `iam_role_path` VALUES (1477991171404779521, 1416730722714144768, 1472904387532660736);
INSERT INTO `iam_role_path` VALUES (1477991171354447874, 1416730722714144768, 1472904387838844928);
INSERT INTO `iam_role_path` VALUES (1477991171425751041, 1416730722714144768, 1472904388157612032);
INSERT INTO `iam_role_path` VALUES (1477991171408973826, 1416730722714144768, 1472904388509933568);
INSERT INTO `iam_role_path` VALUES (1477991171425751047, 1416730722714144768, 1472904388891615232);
INSERT INTO `iam_role_path` VALUES (1477991171417362433, 1416730722714144768, 1472904389206188032);
INSERT INTO `iam_role_path` VALUES (1477991171379613701, 1416730722714144768, 1472904389571092480);
INSERT INTO `iam_role_path` VALUES (1477991171429945350, 1416730722714144768, 1472904389898248192);
INSERT INTO `iam_role_path` VALUES (1477991171434139652, 1416730722714144768, 1472904390372204544);
INSERT INTO `iam_role_path` VALUES (1477991171421556741, 1416730722714144768, 1472904390682583040);
INSERT INTO `iam_role_path` VALUES (1477991171421556742, 1416730722714144768, 1472904391018127360);
INSERT INTO `iam_role_path` VALUES (1477991171362836484, 1416730722714144768, 1472904391445946368);
INSERT INTO `iam_role_path` VALUES (1477991171362836481, 1416730722714144768, 1472904391756324864);
INSERT INTO `iam_role_path` VALUES (1477991171425751042, 1416730722714144768, 1472904392054120448);
INSERT INTO `iam_role_path` VALUES (1477991171429945351, 1416730722714144768, 1472904392393859072);
INSERT INTO `iam_role_path` VALUES (1477991171425751040, 1416730722714144768, 1472904392737792000);
INSERT INTO `iam_role_path` VALUES (1477991171434139654, 1416730722714144768, 1472904393123667968);
INSERT INTO `iam_role_path` VALUES (1477991171362836485, 1416730722714144768, 1472904393429852160);
INSERT INTO `iam_role_path` VALUES (1477991171396390912, 1416730722714144768, 1472904393769590784);
INSERT INTO `iam_role_path` VALUES (1477991171371225092, 1416730722714144768, 1472904394155466752);
INSERT INTO `iam_role_path` VALUES (1477991171320893443, 1416730722714144768, 1472904394524565504);
INSERT INTO `iam_role_path` VALUES (1477991171354447875, 1416730722714144768, 1472904394868498432);
INSERT INTO `iam_role_path` VALUES (1477991171438333953, 1416730722714144768, 1472904395204042752);
INSERT INTO `iam_role_path` VALUES (1477991171396390913, 1416730722714144768, 1472904395552169984);
INSERT INTO `iam_role_path` VALUES (1477991171425751048, 1416730722714144768, 1472904395963211776);
INSERT INTO `iam_role_path` VALUES (1477991171429945352, 1416730722714144768, 1472904396269395968);
INSERT INTO `iam_role_path` VALUES (1477991171438333955, 1416730722714144768, 1472904396634300416);
INSERT INTO `iam_role_path` VALUES (1477991171442528258, 1416730722714144768, 1472904396957261824);
INSERT INTO `iam_role_path` VALUES (1477991171350253569, 1416730722714144768, 1472904397288611840);
INSERT INTO `iam_role_path` VALUES (1477991171337670656, 1416730722714144768, 1472904397997449216);
INSERT INTO `iam_role_path` VALUES (1477991171337670657, 1416730722714144768, 1472904398316216320);
INSERT INTO `iam_role_path` VALUES (1477991171446722560, 1416730722714144768, 1472904398634983424);
INSERT INTO `iam_role_path` VALUES (1477991171425751043, 1416730722714144768, 1472904398995693568);
INSERT INTO `iam_role_path` VALUES (1477991171388002307, 1416730722714144768, 1472904399348015104);
INSERT INTO `iam_role_path` VALUES (1477991171388002308, 1416730722714144768, 1472904399645810688);
INSERT INTO `iam_role_path` VALUES (1477991171438333956, 1416730722714144768, 1472904400182681600);
INSERT INTO `iam_role_path` VALUES (1477991171388002309, 1416730722714144768, 1472904400614694912);
INSERT INTO `iam_role_path` VALUES (1477991171446722563, 1416730722714144768, 1472904400925073408);
INSERT INTO `iam_role_path` VALUES (1477991171379613702, 1416730722714144768, 1472904401260617728);
INSERT INTO `iam_role_path` VALUES (1477991171371225093, 1416730722714144768, 1472904401923317760);
INSERT INTO `iam_role_path` VALUES (1477991171350253570, 1416730722714144768, 1472904402242084864);
INSERT INTO `iam_role_path` VALUES (1477991171358642182, 1416730722714144768, 1472904402598600704);
INSERT INTO `iam_role_path` VALUES (1477991171337670658, 1416730722714144768, 1472904402963505152);
INSERT INTO `iam_role_path` VALUES (1477991171446722565, 1416730722714144768, 1472904403290660864);
INSERT INTO `iam_role_path` VALUES (1477991171450916865, 1416730722714144768, 1472904403638788096);
INSERT INTO `iam_role_path` VALUES (1477991171455111171, 1416730722714144768, 1472904403936583680);
INSERT INTO `iam_role_path` VALUES (1477991171350253571, 1416730722714144768, 1472904405199069184);
INSERT INTO `iam_role_path` VALUES (1477991171446722561, 1416730722714144768, 1472904406344114176);
INSERT INTO `iam_role_path` VALUES (1477991171383808000, 1416730722714144768, 1472904407761788928);
INSERT INTO `iam_role_path` VALUES (1477991171371225094, 1416730722714144768, 1472904408109916160);
INSERT INTO `iam_role_path` VALUES (1477991171404779522, 1416730722714144768, 1472904408508375040);
INSERT INTO `iam_role_path` VALUES (1477991171367030788, 1416730722714144768, 1472904408818753536);
INSERT INTO `iam_role_path` VALUES (1477991171408973827, 1416730722714144768, 1472904409137520640);
INSERT INTO `iam_role_path` VALUES (1477991171404779523, 1416730722714144768, 1472904409481453568);
INSERT INTO `iam_role_path` VALUES (1477991171371225095, 1416730722714144768, 1472904409875718144);
INSERT INTO `iam_role_path` VALUES (1477991171459305474, 1416730722714144768, 1472904410228039680);
INSERT INTO `iam_role_path` VALUES (1477991171446722564, 1416730722714144768, 1472904410609721344);
INSERT INTO `iam_role_path` VALUES (1477991171463499777, 1416730722714144768, 1472904410966237184);
INSERT INTO `iam_role_path` VALUES (1477991171434139655, 1416730722714144768, 1472904411389861888);
INSERT INTO `iam_role_path` VALUES (1477991171446722562, 1416730722714144768, 1472904411721211904);
INSERT INTO `iam_role_path` VALUES (1477991171417362434, 1416730722714144768, 1472904412052561920);
INSERT INTO `iam_role_path` VALUES (1477991171455111172, 1416730722714144768, 1472904412434243584);
INSERT INTO `iam_role_path` VALUES (1477991171375419395, 1416730722714144768, 1472904412799148032);
INSERT INTO `iam_role_path` VALUES (1477991171463499780, 1416730722714144768, 1472904413239549952);
INSERT INTO `iam_role_path` VALUES (1477991171341864964, 1416730722714144768, 1472904413591871488);
INSERT INTO `iam_role_path` VALUES (1477991171467694080, 1416730722714144768, 1472904413977747456);
INSERT INTO `iam_role_path` VALUES (1477991171362836482, 1416730722714144768, 1472904414321680384);
INSERT INTO `iam_role_path` VALUES (1477991171442528259, 1416730722714144768, 1472904414632058880);
INSERT INTO `iam_role_path` VALUES (1477991171383808001, 1416730722714144768, 1472904415101820928);
INSERT INTO `iam_role_path` VALUES (1477991171450916866, 1416730722714144768, 1472904415454142464);
INSERT INTO `iam_role_path` VALUES (1477991171467694081, 1416730722714144768, 1472904415760326656);
INSERT INTO `iam_role_path` VALUES (1477991171459305475, 1416730722714144768, 1472904416070705152);
INSERT INTO `iam_role_path` VALUES (1477991171367030789, 1416730722714144768, 1472904416381083648);
INSERT INTO `iam_role_path` VALUES (1477991171467694083, 1416730722714144768, 1472904416695656448);
INSERT INTO `iam_role_path` VALUES (1477991171379613696, 1416730722714144768, 1472904417081532416);
INSERT INTO `iam_role_path` VALUES (1477991171467694084, 1416730722714144768, 1472904417442242560);
INSERT INTO `iam_role_path` VALUES (1477991171429945344, 1416730722714144768, 1472904417756815360);
INSERT INTO `iam_role_path` VALUES (1477991171450916867, 1416730722714144768, 1472904418067193856);
INSERT INTO `iam_role_path` VALUES (1477991171408973828, 1416730722714144768, 1472904418415321088);
INSERT INTO `iam_role_path` VALUES (1477991171367030790, 1416730722714144768, 1472904418721505280);
INSERT INTO `iam_role_path` VALUES (1477991171421556743, 1416730722714144768, 1472904419078021120);
INSERT INTO `iam_role_path` VALUES (1477991171362836486, 1416730722714144768, 1472904419375816704);
INSERT INTO `iam_role_path` VALUES (1477991171354447876, 1416730722714144768, 1472904419778469888);
INSERT INTO `iam_role_path` VALUES (1477991171392196608, 1416730722714144768, 1472904420118208512);
INSERT INTO `iam_role_path` VALUES (1477991171425751044, 1416730722714144768, 1472904420478918656);
INSERT INTO `iam_role_path` VALUES (1477991171442528260, 1416730722714144768, 1472904420831240192);
INSERT INTO `iam_role_path` VALUES (1477991171471888385, 1416730722714144768, 1472904421183561728);
INSERT INTO `iam_role_path` VALUES (1477991171425751045, 1416730722714144768, 1472904421514911744);
INSERT INTO `iam_role_path` VALUES (1477991171471888389, 1416730722714144768, 1472904421854650368);
INSERT INTO `iam_role_path` VALUES (1477991171408973829, 1416730722714144768, 1472904422181806080);
INSERT INTO `iam_role_path` VALUES (1477991171413168132, 1416730722714144768, 1472904422542516224);
INSERT INTO `iam_role_path` VALUES (1477991171471888390, 1416730722714144768, 1472904422873866240);
INSERT INTO `iam_role_path` VALUES (1477991171417362435, 1416730722714144768, 1472904423251353600);
INSERT INTO `iam_role_path` VALUES (1477991171404779524, 1416730722714144768, 1472904423662395392);
INSERT INTO `iam_role_path` VALUES (1477991171450916868, 1416730722714144768, 1472904423985356800);
INSERT INTO `iam_role_path` VALUES (1477991171417362436, 1416730722714144768, 1472904424392204288);
INSERT INTO `iam_role_path` VALUES (1477991171429945345, 1416730722714144768, 1472904425017155584);
INSERT INTO `iam_role_path` VALUES (1477991171408973824, 1416730722714144768, 1472904425331728384);
INSERT INTO `iam_role_path` VALUES (1477991171354447877, 1416730722714144768, 1472904425717604352);
INSERT INTO `iam_role_path` VALUES (1477991171329282050, 1416730722714144768, 1472904426057342976);
INSERT INTO `iam_role_path` VALUES (1477991171337670659, 1416730722714144768, 1472904426376110080);
INSERT INTO `iam_role_path` VALUES (1477991171325087744, 1416730722714144768, 1472904426699071488);
INSERT INTO `iam_role_path` VALUES (1477991171417362437, 1416730722714144768, 1472904427055587328);
INSERT INTO `iam_role_path` VALUES (1477991171337670660, 1416730722714144768, 1472904427437268992);
INSERT INTO `iam_role_path` VALUES (1477991171476082688, 1416730722714144768, 1472904427772813312);
INSERT INTO `iam_role_path` VALUES (1477991171329282051, 1416730722714144768, 1472904428120940544);
INSERT INTO `iam_role_path` VALUES (1477991171358642179, 1416730722714144768, 1472904428460679168);
INSERT INTO `iam_role_path` VALUES (1477991171333476352, 1416730722714144768, 1472904428804612096);
INSERT INTO `iam_role_path` VALUES (1477991171362836487, 1416730722714144768, 1472904429140156416);
INSERT INTO `iam_role_path` VALUES (1477991171429945346, 1416730722714144768, 1472904429500866560);
INSERT INTO `iam_role_path` VALUES (1477991171471888386, 1416730722714144768, 1472904429840605184);
INSERT INTO `iam_role_path` VALUES (1477991171442528261, 1416730722714144768, 1472904430276812800);
INSERT INTO `iam_role_path` VALUES (1477991171350253572, 1416730722714144768, 1472904430603968512);
INSERT INTO `iam_role_path` VALUES (1477991171429945353, 1416730722714144768, 1472904430956290048);
INSERT INTO `iam_role_path` VALUES (1477991171455111173, 1416730722714144768, 1472904431279251456);
INSERT INTO `iam_role_path` VALUES (1477991171450916869, 1416730722714144768, 1472904431635767296);
INSERT INTO `iam_role_path` VALUES (1477991171425751046, 1416730722714144768, 1472904432021643264);
INSERT INTO `iam_role_path` VALUES (1477991171396390919, 1416730722714144768, 1472904432415907840);
INSERT INTO `iam_role_path` VALUES (1477991171346059264, 1416730722714144768, 1472904432755646464);
INSERT INTO `iam_role_path` VALUES (1477991171429945347, 1416730722714144768, 1472904433107968000);
INSERT INTO `iam_role_path` VALUES (1477991171455111174, 1416730722714144768, 1472904433451900928);
INSERT INTO `iam_role_path` VALUES (1477991171392196609, 1416730722714144768, 1472904433779056640);
INSERT INTO `iam_role_path` VALUES (1477991171471888384, 1416730722714144768, 1472904434492088320);
INSERT INTO `iam_role_path` VALUES (1477991171438333957, 1416730722714144768, 1472904436618600448);
INSERT INTO `iam_role_path` VALUES (1477991171392196610, 1416730722714144768, 1472904436979310592);
INSERT INTO `iam_role_path` VALUES (1477991171450916870, 1416730722714144768, 1472904437356797952);
INSERT INTO `iam_role_path` VALUES (1477991171471888391, 1416730722714144768, 1472904437742673920);
INSERT INTO `iam_role_path` VALUES (1477991171367030784, 1416730722714144768, 1472904438153715712);
INSERT INTO `iam_role_path` VALUES (1477991171429945354, 1416730722714144768, 1472904438606700544);
INSERT INTO `iam_role_path` VALUES (1477991171438333958, 1416730722714144768, 1472904438942244864);
INSERT INTO `iam_role_path` VALUES (1477991171476082690, 1416730722714144768, 1472904439298760704);
INSERT INTO `iam_role_path` VALUES (1477991171413168133, 1416730722714144768, 1472904439609139200);
INSERT INTO `iam_role_path` VALUES (1477991171367030791, 1416730722714144768, 1472904439927906304);
INSERT INTO `iam_role_path` VALUES (1477991171320893440, 1416730722714144768, 1472904440393474048);
INSERT INTO `iam_role_path` VALUES (1477991171367030785, 1416730722714144768, 1472904440880013312);
INSERT INTO `iam_role_path` VALUES (1477991171400585216, 1416730722714144768, 1472904441207169024);
INSERT INTO `iam_role_path` VALUES (1477991171434139648, 1416730722714144768, 1472904441517547520);
INSERT INTO `iam_role_path` VALUES (1477991171408973830, 1416730722714144768, 1472904441886646272);
INSERT INTO `iam_role_path` VALUES (1477991171413168128, 1416730722714144768, 1472904442209607680);
INSERT INTO `iam_role_path` VALUES (1477991171417362438, 1416730722714144768, 1472904442519986176);
INSERT INTO `iam_role_path` VALUES (1477991171371225096, 1416730722714144768, 1472904442981359616);
INSERT INTO `iam_role_path` VALUES (1477991171455111168, 1416730722714144768, 1472904443291738112);
INSERT INTO `iam_role_path` VALUES (1477991171459305472, 1416730722714144768, 1472904443652448256);
INSERT INTO `iam_role_path` VALUES (1477991171333476353, 1416730722714144768, 1472904443983798272);
INSERT INTO `iam_role_path` VALUES (1477991171429945348, 1416730722714144768, 1472904444315148288);
INSERT INTO `iam_role_path` VALUES (1477991171438333959, 1416730722714144768, 1472904444638109696);
INSERT INTO `iam_role_path` VALUES (1477991171341864960, 1416730722714144768, 1472904444956876800);
INSERT INTO `iam_role_path` VALUES (1477991171333476354, 1416730722714144768, 1472904445275643904);
INSERT INTO `iam_role_path` VALUES (1477991171455111169, 1416730722714144768, 1472904445636354048);
INSERT INTO `iam_role_path` VALUES (1477991171413168134, 1416730722714144768, 1472904445963509760);
INSERT INTO `iam_role_path` VALUES (1477991171392196611, 1416730722714144768, 1472904446420688896);
INSERT INTO `iam_role_path` VALUES (1477991171471888392, 1416730722714144768, 1472904446768816128);
INSERT INTO `iam_role_path` VALUES (1477991171375419396, 1416730722714144768, 1472904447163080704);
INSERT INTO `iam_role_path` VALUES (1477991171476082692, 1416730722714144768, 1472904447460876288);
INSERT INTO `iam_role_path` VALUES (1477991171438333954, 1416730722714144768, 1472904447788032000);
INSERT INTO `iam_role_path` VALUES (1477991171434139656, 1416730722714144768, 1472904448131964928);
INSERT INTO `iam_role_path` VALUES (1477991171341864961, 1416730722714144768, 1472904448488480768);
INSERT INTO `iam_role_path` VALUES (1477991171417362439, 1416730722714144768, 1472904448811442176);
INSERT INTO `iam_role_path` VALUES (1477991171417362440, 1416730722714144768, 1472904449142792192);
INSERT INTO `iam_role_path` VALUES (1477991171476082691, 1416730722714144768, 1472904449507696640);
INSERT INTO `iam_role_path` VALUES (1477991171413168135, 1416730722714144768, 1472904449813880832);
INSERT INTO `iam_role_path` VALUES (1477991171383808002, 1416730722714144768, 1472904450153619456);
INSERT INTO `iam_role_path` VALUES (1477991171455111170, 1416730722714144768, 1472904450602409984);
INSERT INTO `iam_role_path` VALUES (1477991171442528256, 1416730722714144768, 1472904450963120128);
INSERT INTO `iam_role_path` VALUES (1477991171350253573, 1416730722714144768, 1472904451374161920);
INSERT INTO `iam_role_path` VALUES (1477991171463499776, 1416730722714144768, 1472904451684540416);
INSERT INTO `iam_role_path` VALUES (1477991171467694082, 1416730722714144768, 1472904452011696128);
INSERT INTO `iam_role_path` VALUES (1477991171392196612, 1416730722714144768, 1472904452326268928);
INSERT INTO `iam_role_path` VALUES (1477991171383808003, 1416730722714144768, 1472904452695367680);
INSERT INTO `iam_role_path` VALUES (1477991171463499781, 1416730722714144768, 1472904453014134784);
INSERT INTO `iam_role_path` VALUES (1477991171463499778, 1416730722714144768, 1472904453395816448);
INSERT INTO `iam_role_path` VALUES (1477991171442528257, 1416730722714144768, 1472904453722972160);
INSERT INTO `iam_role_path` VALUES (1477991171476082693, 1416730722714144768, 1472904454066905088);
INSERT INTO `iam_role_path` VALUES (1477991171476082695, 1416730722714144768, 1472904454402449408);
INSERT INTO `iam_role_path` VALUES (1477991171354447878, 1416730722714144768, 1472904454754770944);
INSERT INTO `iam_role_path` VALUES (1477991171463499782, 1416730722714144768, 1472904455446831104);
INSERT INTO `iam_role_path` VALUES (1477991171333476355, 1416730722714144768, 1472904455824318464);
INSERT INTO `iam_role_path` VALUES (1477991171383808004, 1416730722714144768, 1472904456130502656);
INSERT INTO `iam_role_path` VALUES (1477991171413168129, 1416730722714144768, 1472904456474435584);
INSERT INTO `iam_role_path` VALUES (1477991171396390914, 1416730722714144768, 1472904456809979904);
INSERT INTO `iam_role_path` VALUES (1477991171476082689, 1416730722714144768, 1472904457158107136);
INSERT INTO `iam_role_path` VALUES (1477991171421556737, 1416730722714144768, 1472904457464291328);
INSERT INTO `iam_role_path` VALUES (1477991171346059265, 1416730722714144768, 1472904457812418560);
INSERT INTO `iam_role_path` VALUES (1477991171434139649, 1416730722714144768, 1472904459070709760);
INSERT INTO `iam_role_path` VALUES (1477991171346059266, 1416730722714144768, 1472904459397865472);
INSERT INTO `iam_role_path` VALUES (1477991171413168136, 1416730722714144768, 1472904459762769920);
INSERT INTO `iam_role_path` VALUES (1477991171379613697, 1416730722714144768, 1472904460182200320);
INSERT INTO `iam_role_path` VALUES (1477991171434139653, 1416730722714144768, 1472904460521938944);
INSERT INTO `iam_role_path` VALUES (1477991171442528262, 1416730722714144768, 1472904461213999104);
INSERT INTO `iam_role_path` VALUES (1477991171354447872, 1416730722714144768, 1472904461541154816);
INSERT INTO `iam_role_path` VALUES (1477991171471888387, 1416730722714144768, 1472904461893476352);
INSERT INTO `iam_role_path` VALUES (1477991171396390915, 1416730722714144768, 1472904462208049152);
INSERT INTO `iam_role_path` VALUES (1477991171396390916, 1416730722714144768, 1472904462577147904);
INSERT INTO `iam_role_path` VALUES (1477991171383808005, 1416730722714144768, 1472904462912692224);
INSERT INTO `iam_role_path` VALUES (1477991171434139650, 1416730722714144768, 1472904463248236544);
INSERT INTO `iam_role_path` VALUES (1477991171471888388, 1416730722714144768, 1472904463596363776);
INSERT INTO `iam_role_path` VALUES (1477991171367030786, 1416730722714144768, 1472904463923519488);
INSERT INTO `iam_role_path` VALUES (1477991171383808006, 1416730722714144768, 1472904464305201152);
INSERT INTO `iam_role_path` VALUES (1477991171400585217, 1416730722714144768, 1472904464640745472);
INSERT INTO `iam_role_path` VALUES (1477991171429945349, 1416730722714144768, 1472904464967901184);
INSERT INTO `iam_role_path` VALUES (1477991171320893441, 1416730722714144768, 1472904465320222720);
INSERT INTO `iam_role_path` VALUES (1477991171379613698, 1416730722714144768, 1472904465693515776);
INSERT INTO `iam_role_path` VALUES (1477991171421556744, 1416730722714144768, 1472904466008088576);
INSERT INTO `iam_role_path` VALUES (1477991171463499779, 1416730722714144768, 1472904466352021504);
INSERT INTO `iam_role_path` VALUES (1477991171459305473, 1416730722714144768, 1472904466712731648);
INSERT INTO `iam_role_path` VALUES (1477991171354447879, 1416730722714144768, 1472904467018915840);
INSERT INTO `iam_role_path` VALUES (1477991171438333952, 1416730722714144768, 1472904467350265856);
INSERT INTO `iam_role_path` VALUES (1477991171396390917, 1416730722714144768, 1472904467740336128);
INSERT INTO `iam_role_path` VALUES (1477991171476082694, 1416730722714144768, 1472904468138795008);
INSERT INTO `iam_role_path` VALUES (1477991171388002304, 1416730722714144768, 1472904468524670976);
INSERT INTO `iam_role_path` VALUES (1477991171413168130, 1416730722714144768, 1472904468839243776);
INSERT INTO `iam_role_path` VALUES (1477991171371225088, 1416730722714144768, 1472904469208342528);
INSERT INTO `iam_role_path` VALUES (1477991171476082696, 1416730722714144768, 1472904469506138112);
INSERT INTO `iam_role_path` VALUES (1477991171417362441, 1416730722714144768, 1472904469871042560);
INSERT INTO `iam_role_path` VALUES (1477991171379613699, 1416730722714144768, 1472904470273695744);
INSERT INTO `iam_role_path` VALUES (1477991171434139651, 1416730722714144768, 1472904471162888192);
INSERT INTO `iam_role_path` VALUES (1477991171476082697, 1416730722714144768, 1474682764627210240);
INSERT INTO `iam_role_path` VALUES (1477991171476082698, 1416730722714144768, 1474682764669153280);
INSERT INTO `iam_role_path` VALUES (1477991171476082699, 1416730722714144768, 1474682764681736192);
INSERT INTO `iam_role_path` VALUES (1477991171480276992, 1416730722714144768, 1474682764694319104);
INSERT INTO `iam_role_path` VALUES (1477991171480276993, 1416730722714144768, 1474682764706902016);
INSERT INTO `iam_role_path` VALUES (1477991171480276994, 1416730722714144768, 1474682764723679232);
INSERT INTO `iam_role_path` VALUES (1477991171480276995, 1416730722714144768, 1474682764736262144);
INSERT INTO `iam_role_path` VALUES (1477991171480276996, 1416730722714144768, 1474682764744650752);
INSERT INTO `iam_role_path` VALUES (1477991171480276997, 1416730722714144768, 1474682764753039360);
INSERT INTO `iam_role_path` VALUES (1477991171480276998, 1416730722714144768, 1474682764757233664);
INSERT INTO `iam_role_path` VALUES (1477991171400585218, 1416730722714144768, 1477639549566799872);
INSERT INTO `iam_role_path` VALUES (1477991171400585219, 1416730722714144768, 1477639549885566976);
INSERT INTO `iam_role_path` VALUES (1477991171421556738, 1416730722714144768, 1477639550149808128);
INSERT INTO `iam_role_path` VALUES (1477991171446722566, 1416730722714144768, 1477639550426632192);
INSERT INTO `iam_role_path` VALUES (1477991171450916864, 1416730722714144768, 1477639550703456256);
INSERT INTO `iam_role_path` VALUES (1477991171480276999, 1416730722714144768, 1477639550971891712);
INSERT INTO `iam_role_path` VALUES (1477991171400585220, 1416730722714144768, 1477639551227744256);
INSERT INTO `iam_role_path` VALUES (1477991171480277000, 1416730722714144768, 1477639551512956928);
INSERT INTO `iam_role_path` VALUES (1477991171400585221, 1416730722714144768, 1477639551756226560);
INSERT INTO `iam_role_path` VALUES (1477991171400585222, 1416730722714144768, 1477639551999496192);
INSERT INTO `iam_role_path` VALUES (1477991171480277001, 1416730722714144768, 1477639552242765824);
INSERT INTO `iam_role_path` VALUES (1477991171480277002, 1416730722714144768, 1477639552490229760);
INSERT INTO `iam_role_path` VALUES (1477991171480277003, 1416730722714144768, 1477639552754470912);
INSERT INTO `iam_role_path` VALUES (1477991171421556739, 1416730722714144768, 1477639553001934848);
INSERT INTO `iam_role_path` VALUES (1478743048090222592, 1422832797731778562, 1472904372126982144);
INSERT INTO `iam_role_path` VALUES (1478743048102805504, 1422832797731778562, 1472904384651173888);
INSERT INTO `iam_role_path` VALUES (1478743048098611200, 1422832797731778562, 1472904440393474048);
INSERT INTO `iam_role_path` VALUES (1478743048102805505, 1422832797731778562, 1472904457464291328);
INSERT INTO `iam_role_path` VALUES (1478743048098611201, 1422832797731778562, 1472904465320222720);

-- ----------------------------
-- Table structure for iam_user_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `iam_user_data_scope`;
CREATE TABLE `iam_user_data_scope`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `data_scope_id` bigint(20) NOT NULL COMMENT '数据权限ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户数据范围关系\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iam_user_data_scope
-- ----------------------------
INSERT INTO `iam_user_data_scope` VALUES (1477617820165345280, 1414143554414059520, 1474717084985270272);
INSERT INTO `iam_user_data_scope` VALUES (1477991040840290304, 1477990832987361280, 1477990439800721408);
INSERT INTO `iam_user_data_scope` VALUES (1477997504506077184, 1477997391729631232, 1477990268903804928);
INSERT INTO `iam_user_data_scope` VALUES (1477997685993611264, 1477997602862505984, 1474706893178871808);
INSERT INTO `iam_user_data_scope` VALUES (1498568146461782016, 1399985191002447872, 1474706893178871808);

-- ----------------------------
-- Table structure for iam_user_dept
-- ----------------------------
DROP TABLE IF EXISTS `iam_user_dept`;
CREATE TABLE `iam_user_dept`  (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `dept_id` bigint(20) NOT NULL COMMENT '部门id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_group_role_per_id`(`user_id`, `dept_id`) USING BTREE,
  INDEX `index_group_role_id`(`user_id`) USING BTREE,
  INDEX `index_group_per_id`(`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户部门关联表' ROW_FORMAT = Dynamic;

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
INSERT INTO `iam_user_expand_info` VALUES (1399985191002447872, 1, '1996-12-01', '1483787302281863168', '2022-01-11 17:21:25', '2022-02-16 10:06:44', b'0', '2022-01-09 11:36:05', 1, '2021-06-02 15:04:15', 0, '2022-02-16 10:06:44', 50, 0);
INSERT INTO `iam_user_expand_info` VALUES (1414143554414059520, 1, '2022-02-20', '1495332035044048896', '2022-03-06 14:26:52', '2022-03-06 14:41:41', b'0', NULL, 1, '2021-07-11 16:44:32', 0, '2022-03-06 14:41:41', 113, 0);
INSERT INTO `iam_user_expand_info` VALUES (1435894470432456704, 1, NULL, NULL, NULL, NULL, b'0', NULL, 1399985191002447872, '2021-09-09 17:14:54', 1399985191002447872, '2021-09-09 17:14:54', 0, 0);
INSERT INTO `iam_user_expand_info` VALUES (1435967884114194432, 1, NULL, NULL, NULL, NULL, b'0', NULL, 1414143554414059520, '2021-09-09 22:06:37', 1414143554414059520, '2021-09-09 22:06:37', 0, 0);
INSERT INTO `iam_user_expand_info` VALUES (1477990832987361280, 1, NULL, NULL, NULL, NULL, b'0', NULL, 1399985191002447872, '2022-01-03 21:10:49', 1399985191002447872, '2022-01-03 21:10:49', 0, 0);
INSERT INTO `iam_user_expand_info` VALUES (1477997391729631232, 1, NULL, NULL, NULL, NULL, b'0', NULL, 1399985191002447872, '2022-01-03 21:36:53', 1399985191002447872, '2022-01-03 21:36:53', 0, 0);
INSERT INTO `iam_user_expand_info` VALUES (1477997602862505984, 1, NULL, NULL, NULL, NULL, b'0', NULL, 1399985191002447872, '2022-01-03 21:37:43', 1399985191002447872, '2022-01-03 21:37:43', 0, 0);
INSERT INTO `iam_user_expand_info` VALUES (1497749425681985536, NULL, NULL, NULL, NULL, NULL, b'0', NULL, 1414143554414059520, '2022-02-27 09:44:25', 1414143554414059520, '2022-02-27 09:44:25', 0, 0);
INSERT INTO `iam_user_expand_info` VALUES (1497865307473178624, NULL, NULL, NULL, NULL, NULL, b'0', NULL, 1414143554414059520, '2022-02-27 17:24:53', 1414143554414059520, '2022-02-27 17:24:53', 0, 0);
INSERT INTO `iam_user_expand_info` VALUES (1497909605640040448, NULL, NULL, NULL, NULL, NULL, b'0', NULL, 1414143554414059520, '2022-02-27 20:20:54', 1414143554414059520, '2022-02-27 20:20:54', 0, 0);
INSERT INTO `iam_user_expand_info` VALUES (1497913462331928576, NULL, NULL, NULL, NULL, NULL, b'0', NULL, 1414143554414059520, '2022-02-27 20:36:14', 1414143554414059520, '2022-02-27 20:36:14', 0, 0);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iam_user_info
-- ----------------------------
INSERT INTO `iam_user_info` VALUES (1399985191002447872, '小小明', 'xxm', 'f52020dca765fd3943ed40a615dc2c5c', '13300000000', 'x***2**@outlook.com', NULL, NULL, b'1', '2021-06-02 15:04:12', 1, 1, '2021-06-02 15:04:15', 1414143554414059520, '2022-02-27 11:39:46', 44, 0);
INSERT INTO `iam_user_info` VALUES (1414143554414059520, '小小明1995', 'xxm1995', 'f52020dca765fd3943ed40a615dc2c5c', '13000000000', 'xxm1995@foxmail.com', NULL, NULL, b'1', '2021-07-11 16:44:31', 1, 1, '2021-07-11 16:44:32', 1414143554414059520, '2022-02-20 17:39:06', 4, 0);
INSERT INTO `iam_user_info` VALUES (1435894470432456704, '管理员', 'admin1', 'f52020dca765fd3943ed40a615dc2c5c', '13000001111', 'admin@qq.com', '', NULL, b'0', '2021-09-09 17:14:52', 1, 1399985191002447872, '2021-09-09 17:14:54', 1399985191002447872, '2021-09-09 17:14:54', 2, 0);
INSERT INTO `iam_user_info` VALUES (1435967884114194432, '测试', 'test', 'f52020dca765fd3943ed40a615dc2c5c', '13311111111', 'test@qq.com', '', NULL, b'0', '2021-09-09 22:06:37', 1, 1414143554414059520, '2021-09-09 22:06:37', 1414143554414059520, '2021-09-09 22:06:37', 8, 0);
INSERT INTO `iam_user_info` VALUES (1477990832987361280, '测试用户001', 'test001', 'f52020dca765fd3943ed40a615dc2c5c', '', '', '', NULL, b'0', '2022-01-03 21:10:49', 1, 1399985191002447872, '2022-01-03 21:10:49', 1399985191002447872, '2022-01-03 21:10:49', 0, 0);
INSERT INTO `iam_user_info` VALUES (1477997391729631232, '测试用户002', 'test002', 'f52020dca765fd3943ed40a615dc2c5c', '', '', '', NULL, b'0', '2022-01-03 21:36:53', 1, 1399985191002447872, '2022-01-03 21:36:53', 1399985191002447872, '2022-01-03 21:36:53', 0, 0);
INSERT INTO `iam_user_info` VALUES (1477997602862505984, '测试用户003', 'test003', 'f52020dca765fd3943ed40a615dc2c5c', '', '', '', NULL, b'0', '2022-01-03 21:37:43', 1, 1399985191002447872, '2022-01-03 21:37:43', 1399985191002447872, '2022-01-03 21:37:43', 3, 0);
INSERT INTO `iam_user_info` VALUES (1497749425681985536, '333333', '333333', '8680b9319a784c14d15a47e464fbc0e5', '33333333333', '333333@gmail.com', NULL, NULL, b'0', '2022-02-27 09:44:25', 1, 1414143554414059520, '2022-02-27 09:44:25', 1414143554414059520, '2022-02-27 09:44:25', 0, 0);
INSERT INTO `iam_user_info` VALUES (1497865307473178624, '333333', '1', '8680b9319a784c14d15a47e464fbc0e5', '19807082222', '111@gmail.com', NULL, NULL, b'0', '2022-02-27 17:24:53', 1, 1414143554414059520, '2022-02-27 17:24:53', 1414143554414059520, '2022-02-27 17:24:53', 0, 0);
INSERT INTO `iam_user_info` VALUES (1497909605640040448, '11', '11', '55bbe111fdae395b97ddf67987ae6a92', '', '11@qq.com', NULL, NULL, b'0', '2022-02-27 20:20:54', 1, 1414143554414059520, '2022-02-27 20:20:54', 1414143554414059520, '2022-02-27 20:20:54', 0, 0);
INSERT INTO `iam_user_info` VALUES (1497913462331928576, 'a', 'a', 'f8c0f7bc0c94aa5b291602bdc816ced8', '', '222@qq.com', NULL, NULL, b'0', '2022-02-27 20:36:14', 1, 1414143554414059520, '2022-02-27 20:36:14', 1414143554414059520, '2022-02-27 20:36:14', 0, 0);

-- ----------------------------
-- Table structure for iam_user_role
-- ----------------------------
DROP TABLE IF EXISTS `iam_user_role`;
CREATE TABLE `iam_user_role`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户角色关系\r\n' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户三方登录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iam_user_social
-- ----------------------------
INSERT INTO `iam_user_social` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);

-- ----------------------------
-- Table structure for nc_ding_robot_config
-- ----------------------------
DROP TABLE IF EXISTS `nc_ding_robot_config`;
CREATE TABLE `nc_ding_robot_config`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钉钉机器人访问token',
  `enable_signature_check` bit(1) NOT NULL COMMENT '是否开启验签',
  `sign_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钉钉机器人私钥',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '钉钉机器人配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nc_ding_robot_config
-- ----------------------------
INSERT INTO `nc_ding_robot_config` VALUES (1333022277138264064, 'bootx机器人', 'bootx', '4a6212971d64208f45d647190ebc69986d6e9b67faf6aa7f1c8fc332f6652060', b'1', 'SECb6f9f872847caec745fcf10a46f4250b36c0337bade670d2f1f4756682b8cad2', 'bootx群机器人', -1, '2020-11-29 20:17:31.875000', -1, '2020-11-29 20:17:31.875000', 1, b'0');
INSERT INTO `nc_ding_robot_config` VALUES (1454001517812203520, '33', '12', '111111111111111111', b'1', '', '', 1399985191002447872, '2021-10-29 16:25:50.547000', 1399985191002447872, '2021-10-29 16:25:50.597000', 2, b'1');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '邮件配置' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息模板' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '站内信' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '短信配置' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '微信消息配置' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单明细' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单策略映射' ROW_FORMAT = Dynamic;

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
  CONSTRAINT `oc_swap_order_ibfk_1` FOREIGN KEY (`origin_order_id`) REFERENCES `oc_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换货单' ROW_FORMAT = Dynamic;

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
  CONSTRAINT `oc_swap_order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `oc_swap_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换货单明细' ROW_FORMAT = Dynamic;

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
  `business_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务id',
  `pay_status` int(11) NULL DEFAULT NULL COMMENT '支付状态',
  `pay_time` datetime(6) NULL DEFAULT NULL COMMENT '支付时间',
  `trade_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝关联流水号',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付宝支付记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pc_ali_payment
-- ----------------------------
INSERT INTO `pc_ali_payment` VALUES (1500363607442980864, 1500363511825432576, 1414143554414059520, 0.01, 'P1646549142332', 1, '2022-03-06 14:52:14.073000', '2022030622001495290501805720', 0, '2022-03-06 14:52:14.079000', 0, '2022-03-06 14:52:14.079000', 0, b'0');
INSERT INTO `pc_ali_payment` VALUES (1500364488066465792, 1500362279438254080, 1414143554414059520, 10.00, 'P1646549211448', 1, '2022-03-06 14:55:44.033000', '2022030622001495290501805719', 1414143554414059520, '2022-03-06 14:55:44.036000', 1414143554414059520, '2022-03-06 14:55:44.044000', 0, b'0');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付宝配置' ROW_FORMAT = Dynamic;


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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商户应用支付渠道' ROW_FORMAT = Dynamic;

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
  `tid` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `creator` bigint(20) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  `amount` decimal(19, 2) NULL DEFAULT NULL,
  `business_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pay_status` int(11) NULL DEFAULT NULL,
  `pay_time` datetime(6) NULL DEFAULT NULL,
  `payment_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '现金交易记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pc_cash_payment
-- ----------------------------
INSERT INTO `pc_cash_payment` VALUES (1408444792672776192, 10011, '2021-06-25 23:19:40.868000', 1, b'0', '2021-06-25 23:19:40.868000', 1, 0, 398.00, '1408443758286102528', 0, NULL, 1408444792223985664, NULL);
INSERT INTO `pc_cash_payment` VALUES (1408447812747816960, 10011, '2021-06-25 23:31:40.911000', 1, b'0', '2021-06-25 23:31:40.911000', 1, 0, 398.00, '1408447787535851520', 0, NULL, 1408447812714262528, NULL);
INSERT INTO `pc_cash_payment` VALUES (1408448511451754496, 10011, '2021-06-25 23:34:27.495000', 1, b'0', '2021-06-25 23:34:27.495000', 1, 0, 398.00, '1408448478123810816', 0, NULL, 1408448511388839936, NULL);
INSERT INTO `pc_cash_payment` VALUES (1408449186684366848, 10011, '2021-06-25 23:37:08.474000', 1, b'0', '2021-06-25 23:37:08.474000', 1, 0, 398.00, '1408449065427034112', 0, NULL, 1408449186634035200, NULL);
INSERT INTO `pc_cash_payment` VALUES (1408449775107469312, 10011, '2021-06-25 23:39:28.774000', 1, b'0', '2021-06-25 23:39:28.774000', 1, 0, 398.00, '1408449539890896896', 0, NULL, 1408449775094886400, NULL);
INSERT INTO `pc_cash_payment` VALUES (1408451981978267648, 10011, '2021-06-25 23:48:14.933000', 1, b'0', '2021-06-25 23:48:14.933000', 1, 0, 398.00, '1408450653524746240', 0, NULL, 1408451981957296128, NULL);
INSERT INTO `pc_cash_payment` VALUES (1408461477421150208, 10011, '2021-06-26 00:25:58.823000', 1, b'0', '2021-06-26 00:25:58.823000', 1, 0, 398.00, '1408461390821351424', 0, NULL, 1408461476922028032, NULL);
INSERT INTO `pc_cash_payment` VALUES (1408462154411175936, 10011, '2021-06-26 00:28:40.230000', 1, b'0', '2021-06-26 00:28:40.230000', 1, 0, 398.00, '1408462122807091200', 0, NULL, 1408462154394398720, NULL);
INSERT INTO `pc_cash_payment` VALUES (1408462200036814848, 10011, '2021-06-26 00:28:51.107000', 1, b'0', '2021-06-26 00:28:51.107000', 1, 0, 398.00, '1408462177748279296', 0, NULL, 1408462200024231936, NULL);
INSERT INTO `pc_cash_payment` VALUES (1408463999598751744, 10011, '2021-06-26 00:36:00.156000', 1, b'0', '2021-06-26 00:36:00.156000', 1, 0, 398.00, '1408463957144002560', 0, NULL, 1408463999556808704, NULL);
INSERT INTO `pc_cash_payment` VALUES (1408464096248098816, 10011, '2021-06-26 00:36:23.200000', 1, b'0', '2021-06-26 00:36:23.200000', 1, 0, 398.00, '1408464072109875200', 0, NULL, 1408464096239710208, NULL);
INSERT INTO `pc_cash_payment` VALUES (1409386462381764608, 10011, '2021-06-28 13:41:32.423000', 1, b'0', '2021-06-28 13:41:32.423000', 1, 0, 199.00, '1409385932448227328', 0, NULL, 1409386462092357632, NULL);
INSERT INTO `pc_cash_payment` VALUES (1409821341271617536, 10011, '2021-06-29 18:29:35.629000', 1, b'0', '2021-06-29 18:29:35.629000', 1, 0, 598.00, '1409821156785152000', 0, NULL, 1409821340734746624, NULL);
INSERT INTO `pc_cash_payment` VALUES (1410989879562760192, 10011, '2021-07-02 23:52:56.869000', 1, b'0', '2021-07-05 20:40:59.564000', 1, 1, 15.00, '11', 3, NULL, 1410989876228288512, NULL);
INSERT INTO `pc_cash_payment` VALUES (1420398971355852802, NULL, '2021-07-28 23:01:19.172000', 0, b'0', NULL, NULL, 0, 1.00, '3333', 0, NULL, 1420398971141943298, 0);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单账单' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单明细账单' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付渠道' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付方式' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付回调记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pc_pay_notify_record
-- ----------------------------
INSERT INTO `pc_pay_notify_record` VALUES (1500363607568809984, 1500363511825432576, '{\"gmt_create\":\"2022-03-06 14:52:04\",\"charset\":\"UTF-8\",\"gmt_payment\":\"2022-03-06 14:52:12\",\"notify_time\":\"2022-03-06 14:52:13\",\"subject\":\"测试支付\",\"buyer_id\":\"2088622955195291\",\"invoice_amount\":\"0.01\",\"version\":\"1.0\",\"notify_id\":\"2022030600222145213095290519072918\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"0.01\\\",\\\"fundChannel\\\":\\\"ALIPAYACCOUNT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"out_trade_no\":\"1500363511825432576\",\"total_amount\":\"0.01\",\"trade_status\":\"TRADE_SUCCESS\",\"trade_no\":\"2022030622001495290501805720\",\"auth_app_id\":\"2021000116671599\",\"receipt_amount\":\"0.01\",\"point_amount\":\"0.00\",\"app_id\":\"2021000116671599\",\"buyer_pay_amount\":\"0.01\",\"seller_id\":\"2088621954842212\"}', 1, 1, NULL, '2022-03-06 14:52:14.108000', 0, '2022-03-06 14:52:14.109000', 0, '2022-03-06 14:52:14.109000', 0, b'0');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付关联订单信息' ROW_FORMAT = Dynamic;

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
  `sync_pay_mode` bit(1) NOT NULL COMMENT '是否是异步支付',
  `sync_pay_channel` int(11) NULL DEFAULT NULL COMMENT '异步支付方式',
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pc_payment
-- ----------------------------
INSERT INTO `pc_payment` VALUES (1500362279438254080, 1414143554414059520, 'P1646549211448', '测试支付订单', NULL, 10.00, 10.00, 1, NULL, NULL, NULL, b'1', 1, '[{\"amount\":10,\"payWay\":4,\"payChannel\":1}]', '[{\"amount\":10,\"payChannel\":1}]', '2022-03-06 14:55:44.062000', NULL, '113.128.101.202', 1414143554414059520, '2022-03-06 14:46:57', 1414143554414059520, '2022-03-06 14:55:44', 2, 0);
INSERT INTO `pc_payment` VALUES (1500363511825432576, 1414143554414059520, 'P1646549142332', '测试支付', NULL, 0.01, 0.01, 1, NULL, NULL, NULL, b'1', 1, '[{\"amount\":0.01,\"payWay\":3,\"payChannel\":1}]', '[{\"amount\":0.01,\"payChannel\":1}]', '2022-03-06 14:52:14.093000', NULL, '113.128.101.202', 1414143554414059520, '2022-03-06 14:51:51', 0, '2022-03-06 14:52:14', 2, 0);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '积分配置' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '积分日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pc_point_log
-- ----------------------------
INSERT INTO `pc_point_log` VALUES (1368825135523590144, 10011, 3, '系统发放', 'two', 1, '2021-03-08 15:25:18.507000', 1, '2021-03-08 15:25:18.507000', 0, b'0', 10011, '999');
INSERT INTO `pc_point_log` VALUES (1368825551321722880, 10011, 999, '系统发放', 'two', 1, '2021-03-08 15:26:57.641000', 1, '2021-03-08 15:26:57.641000', 0, b'0', 10011, '999');
INSERT INTO `pc_point_log` VALUES (1368825587640201216, 10011, -10, '购物消费', '购物消费', 1, '2021-03-08 15:27:06.300000', 1, '2021-03-08 15:27:06.300000', 0, b'0', 10011, '1');
INSERT INTO `pc_point_log` VALUES (1368830279527067648, 10011, 10, '退货返还', '退货返还', 1, '2021-03-08 15:45:44.933000', 1, '2021-03-08 15:45:44.933000', 0, b'0', 10011, '1');
INSERT INTO `pc_point_log` VALUES (1410989881097875456, 1001, -30, '购物消费', '购物消费', 1, '2021-07-02 23:52:57.235000', 1, '2021-07-02 23:52:57.235000', 0, b'0', 10011, '11');

-- ----------------------------
-- Table structure for pc_point_payment
-- ----------------------------
DROP TABLE IF EXISTS `pc_point_payment`;
CREATE TABLE `pc_point_payment`  (
  `id` bigint(20) NOT NULL,
  `payment_id` bigint(20) NULL DEFAULT NULL COMMENT '交易记录ID',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `point_generate_id` bigint(20) NULL DEFAULT NULL COMMENT '积分生成日志id',
  `points` int(11) NULL DEFAULT NULL COMMENT '积分',
  `transaction_purpose` int(11) NOT NULL COMMENT '交易目的',
  `transaction_type` int(11) NOT NULL COMMENT '交易类型',
  `amount` decimal(19, 2) NULL DEFAULT NULL COMMENT '交易金额',
  `business_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务id',
  `pay_status` int(11) NOT NULL COMMENT '支付状态',
  `pay_time` datetime(6) NULL DEFAULT NULL COMMENT '支付时间',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `tid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '积分支付日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pc_point_payment
-- ----------------------------
INSERT INTO `pc_point_payment` VALUES (1410989880309346304, 1410989876228288512, 1001, 1368825135439704064, 3, 0, 0, NULL, '11', 1, '2021-07-02 23:52:57.043000', 1, '2021-07-02 23:52:57.046000', 1, '2021-07-02 23:52:57.046000', 0, b'0', 10011);
INSERT INTO `pc_point_payment` VALUES (1410989880309346305, 1410989876228288512, 1001, 1368825551317528576, 27, 0, 0, NULL, '11', 1, '2021-07-02 23:52:57.043000', 1, '2021-07-02 23:52:57.047000', 1, '2021-07-02 23:52:57.047000', 0, b'0', 10011);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '积分记录' ROW_FORMAT = Dynamic;

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
  `refund_order_id` int(11) NULL DEFAULT NULL COMMENT '退款订单号',
  `payment_id` bigint(20) NOT NULL COMMENT '支付记录id',
  `business_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联业务id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `amount` decimal(19, 2) NOT NULL COMMENT '金额',
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '退款记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pc_refund_record
-- ----------------------------

-- ----------------------------
-- Table structure for pc_wallet
-- ----------------------------
DROP TABLE IF EXISTS `pc_wallet`;
CREATE TABLE `pc_wallet`  (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '关联用户id',
  `balance` decimal(19, 2) NOT NULL COMMENT '余额',
  `status` int(11) NOT NULL COMMENT '状态',
  `protection_mode` int(11) NOT NULL COMMENT '保护方式',
  `pin_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'pin',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `tid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '钱包' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pc_wallet
-- ----------------------------
INSERT INTO `pc_wallet` VALUES (1336489524259352576, 1, 99999999997.90, 0, 0, NULL, 1, '2020-12-09 15:30:37.000000', NULL, '2021-07-23 15:24:50.050000', 52, b'0', 10011);

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
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `business_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务ID',
  `operation_source` int(11) NOT NULL COMMENT '操作源',
  `amount` decimal(19, 2) NULL DEFAULT NULL COMMENT '金额',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `tid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '钱包日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pc_wallet_log
-- ----------------------------
INSERT INTO `pc_wallet_log` VALUES (1407884532522315776, 1336489524259352576, 1001, 5, 1407884530089619456, '钱包支付金额 100.00 ', '1407879663895863296', 3, 199.00, 1, '2021-06-24 10:13:24.440000', 1, '2021-06-24 10:13:24.440000', 0, b'0', 10011);
INSERT INTO `pc_wallet_log` VALUES (1407886108477517824, 1336489524259352576, 1001, 8, 1407884530089619456, '取消支付返回金额 100.00 ', '1407879663895863296', 1, 100.00, 1, '2021-06-24 10:19:40.173000', 1, '2021-06-24 10:19:40.173000', 0, b'0', 10011);
INSERT INTO `pc_wallet_log` VALUES (1409386462994132992, 1336489524259352576, 1001, 5, 1409386462092357632, '钱包支付金额 199.00 ', '1409385932448227328', 3, 398.00, 1, '2021-06-28 13:41:32.569000', 1, '2021-06-28 13:41:32.569000', 0, b'0', 10011);
INSERT INTO `pc_wallet_log` VALUES (1409821341913346048, 1336489524259352576, 1001, 5, 1409821340734746624, '钱包支付金额 398.00 ', '1409821156785152000', 3, 996.00, 1, '2021-06-29 18:29:35.783000', 1, '2021-06-29 18:29:35.783000', 0, b'0', 10011);
INSERT INTO `pc_wallet_log` VALUES (1410989880057688064, 1336489524259352576, 1001, 5, 1410989876228288512, '钱包支付金额 20.00 ', '11', 3, 45.00, 1, '2021-07-02 23:52:56.987000', 1, '2021-07-02 23:52:56.987000', 0, b'0', 10011);
INSERT INTO `pc_wallet_log` VALUES (1418472154105802752, 1336489524259352576, 1, 5, 1418472153543766016, '钱包支付金额 1.10 ', '1418472136397447168', 3, 1.10, 1, '2021-07-23 15:24:50.134000', 1, '2021-07-23 15:24:50.134000', 0, b'0', 10011);

-- ----------------------------
-- Table structure for pc_wallet_payment
-- ----------------------------
DROP TABLE IF EXISTS `pc_wallet_payment`;
CREATE TABLE `pc_wallet_payment`  (
  `id` bigint(20) NOT NULL,
  `payment_id` bigint(20) NOT NULL COMMENT '交易记录ID',
  `pay_status` int(11) NOT NULL COMMENT '支付状态',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `wallet_id` bigint(20) NULL DEFAULT NULL COMMENT '钱包ID',
  `transaction_purpose` int(11) NOT NULL COMMENT '交易目的',
  `transaction_type` int(11) NOT NULL COMMENT '交易类型',
  `amount` decimal(19, 2) NULL DEFAULT NULL COMMENT '交易金额',
  `business_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务id',
  `pay_time` datetime(6) NULL DEFAULT NULL COMMENT '支付时间',
  `creator` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `last_modifier` bigint(20) NULL DEFAULT NULL,
  `last_modified_time` datetime(6) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `tid` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '钱包交易记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pc_wallet_payment
-- ----------------------------
INSERT INTO `pc_wallet_payment` VALUES (1407884532572647424, 1407884530089619456, 3, 1001, 1336489524259352576, 1, 1, 100.00, '1407879663895863296', '2021-06-24 10:13:24.592000', 1, '2021-06-24 10:13:24.451000', 1, '2021-06-24 10:15:10.001000', 2, b'0', 10011);
INSERT INTO `pc_wallet_payment` VALUES (1409386463023493120, 1409386462092357632, 1, 1001, 1336489524259352576, 1, 1, 199.00, '1409385932448227328', '2021-06-28 13:41:32.647000', 1, '2021-06-28 13:41:32.576000', 1, '2021-06-28 13:41:32.653000', 1, b'0', 10011);
INSERT INTO `pc_wallet_payment` VALUES (1409821341993037824, 1409821340734746624, 1, 1001, 1336489524259352576, 1, 1, 398.00, '1409821156785152000', '2021-06-29 18:29:35.841000', 1, '2021-06-29 18:29:35.802000', 1, '2021-06-29 18:29:35.861000', 1, b'0', 10011);
INSERT INTO `pc_wallet_payment` VALUES (1410989880078659584, 1410989876228288512, 3, 1001, 1336489524259352576, 0, 0, 20.00, '11', '2021-07-02 23:52:57.226000', 1, '2021-07-02 23:52:56.992000', 1, '2021-07-05 20:40:59.737000', 2, b'0', 10011);
INSERT INTO `pc_wallet_payment` VALUES (1418472154135162880, 1418472153543766016, 1, 1, 1336489524259352576, 0, 0, 1.10, '1418472136397447168', '2021-07-23 15:24:50.254000', 1, '2021-07-23 15:24:50.141000', 1, '2021-07-23 15:24:50.262000', 1, b'0', 10011);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信支付配置' ROW_FORMAT = Dynamic;

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
  `transaction_purpose` int(11) NOT NULL COMMENT '交易目的',
  `transaction_type` int(11) NOT NULL COMMENT '交易类型',
  `amount` decimal(19, 2) NOT NULL COMMENT '交易金额',
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信支付记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pc_wechat_payment
-- ----------------------------

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
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('quartzScheduler', '1456579473573867520', 'DEFAULT', '* * * * * ?', 'Asia/Shanghai');

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
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------
INSERT INTO `qrtz_fired_triggers` VALUES ('quartzScheduler', 'NON_CLUSTERED1646546076489', '1456579473573867520', 'DEFAULT', 'NON_CLUSTERED', 1646549838107, 1646549839000, 5, 'ACQUIRED', NULL, NULL, '0', '0');

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
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('quartzScheduler', '1456579473573867520', 'DEFAULT', NULL, 'cn.bootx.starter.quartz.task.TestTask', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000001740009706172616D65746572707800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('quartzScheduler', '1456579473573867520', 'DEFAULT', '1456579473573867520', 'DEFAULT', NULL, 1646549841000, 1646549840000, 5, 'ACQUIRED', 'CRON', 1646298531000, 0, NULL, 0, '');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠活动' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '检查规则' ROW_FORMAT = Dynamic;

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
  CONSTRAINT `sc_coupon_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `sc_coupon_template` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠券' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠券模板' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '匹配检查' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '策略' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '策略规则检查' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '策略参数定义' ROW_FORMAT = Dynamic;

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
  CONSTRAINT `sc_strategy_config_value_ibfk_1` FOREIGN KEY (`strategy_config_id`) REFERENCES `sc_strategy_config` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '策略配置参数' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '策略注册' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登陆日志' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of starter_quartz_job
-- ----------------------------
INSERT INTO `starter_quartz_job` VALUES (1456579473573867520, '测试任务', 'cn.bootx.starter.quartz.task.TestTask', '* * * * * ?', NULL, 1, '测试任务2', 1399985191002447872, '2021-11-05 19:09:43', 1414143554414059520, '2022-03-03 17:08:52', 15, 0);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发号器队列区间管理' ROW_FORMAT = Dynamic;

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
INSERT INTO `starter_upload_file` VALUES (1495329415940403200, NULL, 'blob', 'jpg', 'jpg', 76, '621209a9bdf93d5d556fe9d3', 1414143554414059520, '2022-02-20 17:28:10');
INSERT INTO `starter_upload_file` VALUES (1495330428336209920, NULL, 'blob', 'jpg', 'jpg', 76, '62120a9a430bc21db6853336', 1414143554414059520, '2022-02-20 17:32:11');
INSERT INTO `starter_upload_file` VALUES (1495332035044048896, NULL, 'blob', 'jpg', 'jpg', 76, '62120c19430bc21db6853338', 1414143554414059520, '2022-02-20 17:38:34');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编码',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  `version` int(8) NULL DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name_index`(`name`) USING BTREE COMMENT '名称索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典项' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_dict_item` VALUES (1496780500696539136, 1496722894707728384, 'PayChannel', '1', '支付宝', 0.00, '', 1399985191002447872, '2022-02-24 17:34:15', 1399985191002447872, '2022-02-24 17:34:15', 0, 0);
INSERT INTO `sys_dict_item` VALUES (1496780576818962432, 1496722894707728384, 'PayChannel', '2', '微信', 0.00, '', 1399985191002447872, '2022-02-24 17:34:33', 1399985191002447872, '2022-02-24 17:34:33', 0, 0);
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统参数配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_param
-- ----------------------------
INSERT INTO `sys_param` VALUES (1452842684284891136, '测试', 'test.v1', '123', 1, b'0', NULL, 1399985191002447872, '2021-10-26 11:41:03', 1399985191002447872, '2021-10-26 11:41:03', 0, 0);
INSERT INTO `sys_param` VALUES (1500338438182789120, '结算台聚合支付请求地址', 'CashierAggregateUrl', 'http://127.0.0.1/cashier/aggregatePay?key=', 1, b'0', '', 1399985191002447872, '2022-03-06 13:12:13', 1414143554414059520, '2022-03-06 14:50:38', 0, 3);

SET FOREIGN_KEY_CHECKS = 1;
