/*
 Navicat Premium Data Transfer

 Source Server         : 阿里
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : mysql.dev.bootx.cn:3306
 Source Schema         : bootx-flyway

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 10/06/2022 13:50:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_dict
-- ----------------------------
DROP TABLE IF EXISTS `base_dict`;
CREATE TABLE `base_dict`  (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '编码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `group_tag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类标签',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  `version` int(8) NULL DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_dict
-- ----------------------------
INSERT INTO `base_dict` VALUES (1422929378374828033, 'Sex', '性别', '基础属性', '性别', 0, '2021-08-04 22:36:15', 1399985191002447872, '2022-05-11 19:48:40', 0, 6);
INSERT INTO `base_dict` VALUES (1425744045414772737, 'MenuType', '菜单类型', '系统属性', '菜单类型', 0, '2021-08-12 17:00:44', 1399985191002447872, '2022-05-11 19:48:44', 0, 4);
INSERT INTO `base_dict` VALUES (1430063572491411456, 'loginType', '字典类型', NULL, '字典类型', 1399985191002447872, '2021-08-24 15:05:00', 1399985191002447872, '2021-08-24 15:05:00', 1, 2);
INSERT INTO `base_dict` VALUES (1435829999592759296, 'UserStatusCode', '用户状态码', '系统属性', '用户状态码', 1399985191002447872, '2021-09-09 12:58:43', 1399985191002447872, '2022-05-11 19:48:56', 0, 2);
INSERT INTO `base_dict` VALUES (1435838066191458304, 'LogBusinessType', '业务操作类型', '系统属性', '操作日志记录的业务操作类型', 1399985191002447872, '2021-09-09 13:30:46', 1399985191002447872, '2022-05-11 19:49:00', 0, 2);
INSERT INTO `base_dict` VALUES (1438078864509317120, 'MailSecurityCode', '邮箱安全方式编码', '消息服务', '邮箱安全方式编码', 1399985191002447872, '2021-09-15 17:54:54', 1399985191002447872, '2022-05-11 19:49:06', 0, 2);
INSERT INTO `base_dict` VALUES (1439961232651034624, 'MessageTemplateCode', '消息模板类型', '消息服务', '消息模板类型', 1399985191002447872, '2021-09-20 22:34:46', 1399985191002447872, '2022-05-11 19:48:34', 0, 1);
INSERT INTO `base_dict` VALUES (1452836604783845376, 'SocialType', '三方系统类型', '系统属性', '三方系统类型', 1399985191002447872, '2021-10-26 11:16:54', 1399985191002447872, '2022-05-11 19:48:28', 0, 3);
INSERT INTO `base_dict` VALUES (1452843488735621120, 'ParamType', '参数类型', '系统属性', '参数类型', 1399985191002447872, '2021-10-26 11:44:15', 1399985191002447872, '2022-05-11 19:48:21', 0, 2);
INSERT INTO `base_dict` VALUES (1496024933900169216, 'Political', '政治面貌', '基础数据', '政治面貌', 1399985191002447872, '2022-02-22 15:31:54', 1399985191002447872, '2022-05-11 19:48:04', 0, 1);
INSERT INTO `base_dict` VALUES (1496722894707728384, 'PayChannel', '支付通道', '支付服务', '支付宝, 微信, 云闪付等', 1399985191002447872, '2022-02-24 13:45:21', 1399985191002447872, '2022-05-11 19:47:51', 0, 1);
INSERT INTO `base_dict` VALUES (1496723207565058048, 'PayWay', '支付方式', '支付服务', '扫码支付、Wap、App支付等', 1399985191002447872, '2022-02-24 13:46:35', 1399985191002447872, '2022-05-11 19:47:46', 0, 1);
INSERT INTO `base_dict` VALUES (1497140849954185216, 'PayStatus', '支付状态', '支付服务', '支付中,成功,失败等', 1399985191002447872, '2022-02-25 17:26:09', 1399985191002447872, '2022-05-11 19:47:40', 0, 2);
INSERT INTO `base_dict` VALUES (1501031423232937984, 'AsyncPayChannel', '异步支付通道', '支付服务', '如微信支付宝云闪付等第三方支付', 1399985191002447872, '2022-03-08 11:05:54', 1399985191002447872, '2022-05-11 19:47:37', 0, 1);
INSERT INTO `base_dict` VALUES (1502276739978473472, 'WalletStatus', '钱包状态', '支付服务', '钱包状态', 1399985191002447872, '2022-03-11 21:34:20', 1399985191002447872, '2022-05-11 19:47:33', 0, 2);
INSERT INTO `base_dict` VALUES (1502624342339448832, 'WalletOperation', '钱包日志操作类型', NULL, '', 1399985191002447872, '2022-03-12 20:35:35', 1399985191002447872, '2022-03-12 20:35:35', 1, 0);
INSERT INTO `base_dict` VALUES (1502624515799085056, 'WalletLogType', '钱包日志类型', '支付服务', '钱包日志类型', 1399985191002447872, '2022-03-12 20:36:17', 1399985191002447872, '2022-05-11 19:47:29', 0, 1);
INSERT INTO `base_dict` VALUES (1502624632392347648, 'WalletLogOperation', '钱包日志操作类型', '支付服务', '钱包日志操作类型', 1399985191002447872, '2022-03-12 20:36:44', 1399985191002447872, '2022-05-11 19:47:21', 0, 1);
INSERT INTO `base_dict` VALUES (1503340128037212160, 'VoucherStatus', '储值卡状态', '支付服务', '储值卡状态', 1399985191002447872, '2022-03-14 19:59:52', 1399985191002447872, '2022-05-11 19:47:12', 0, 1);
INSERT INTO `base_dict` VALUES (1524356168611188736, 'input', '手工输入', '商品服务', '', 1399985191002447872, '2022-05-11 19:50:06', 1399985191002447872, '2022-05-11 19:50:06', 1, 0);
INSERT INTO `base_dict` VALUES (1524356376518643712, 'GoodsParamType', '参数类型', '商品服务', '列表/手动输入', 1399985191002447872, '2022-05-11 19:50:56', 1399985191002447872, '2022-05-14 23:05:41', 0, 1);

-- ----------------------------
-- Table structure for base_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_item`;
CREATE TABLE `base_dict_item`  (
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
-- Records of base_dict_item
-- ----------------------------
INSERT INTO `base_dict_item` VALUES (1422931375807242241, 1422929378374828033, 'Sex', '1', '男', 0.00, '男性', 0, '2021-08-04 22:44:11', 0, '2021-08-04 22:44:11', 0, 2);
INSERT INTO `base_dict_item` VALUES (1425729455402401794, 1422929378374828033, 'Sex', '2', '女', 0.00, '女性', 0, '2021-08-12 16:02:46', 0, '2021-08-12 16:02:46', 0, 1);
INSERT INTO `base_dict_item` VALUES (1425744258544136194, 1425744045414772737, 'MenuType', '0', '顶级菜单', 0.00, '顶级菜单', 0, '2021-08-12 17:01:35', 0, '2021-08-12 17:01:35', 0, 0);
INSERT INTO `base_dict_item` VALUES (1425744436592340993, 1425744045414772737, 'MenuType', '1', '子菜单', 0.00, '子菜单', 0, '2021-08-12 17:02:17', 0, '2021-08-12 17:02:17', 0, 0);
INSERT INTO `base_dict_item` VALUES (1425744470582980610, 1425744045414772737, 'MenuType', '2', '按钮权限', 0.00, '按钮权限', 0, '2021-08-12 17:02:26', 0, '2021-08-12 17:02:26', 0, 0);
INSERT INTO `base_dict_item` VALUES (1430094707250413568, 1422929378374828033, 'Sex', '0', '未知', 0.00, '不确定性别', 1399985191002447872, '2021-08-24 17:08:43', 1399985191002447872, '2021-08-24 17:08:43', 0, 0);
INSERT INTO `base_dict_item` VALUES (1435830086406463488, 1435829999592759296, 'UserStatusCode', '1', '正常', 0.00, 'NORMAL', 1399985191002447872, '2021-09-09 12:59:04', 1399985191002447872, '2021-09-09 12:59:04', 0, 0);
INSERT INTO `base_dict_item` VALUES (1435830141855162368, 1435829999592759296, 'UserStatusCode', '2', '锁定', 0.00, 'LOCK, 多次登录失败被锁定', 1399985191002447872, '2021-09-09 12:59:17', 1399985191002447872, '2021-09-09 12:59:17', 0, 1);
INSERT INTO `base_dict_item` VALUES (1435830260503633920, 1435829999592759296, 'UserStatusCode', '3', '封禁', 0.00, 'BAN', 1399985191002447872, '2021-09-09 12:59:45', 1399985191002447872, '2021-09-09 12:59:45', 0, 0);
INSERT INTO `base_dict_item` VALUES (1435838374749626368, 1435838066191458304, 'LogBusinessType', 'other', '其它', 0.00, '', 1399985191002447872, '2021-09-09 13:32:00', 1399985191002447872, '2021-09-09 13:32:00', 0, 0);
INSERT INTO `base_dict_item` VALUES (1435838414436130816, 1435838066191458304, 'LogBusinessType', 'insert', '新增', 0.00, '', 1399985191002447872, '2021-09-09 13:32:09', 1399985191002447872, '2021-09-09 13:32:09', 0, 0);
INSERT INTO `base_dict_item` VALUES (1435838467624099840, 1435838066191458304, 'LogBusinessType', 'update', '修改', 0.00, '', 1399985191002447872, '2021-09-09 13:32:22', 1399985191002447872, '2021-09-09 13:32:22', 0, 0);
INSERT INTO `base_dict_item` VALUES (1435838502755590144, 1435838066191458304, 'LogBusinessType', 'delete', '删除', 0.00, '', 1399985191002447872, '2021-09-09 13:32:30', 1399985191002447872, '2021-09-09 13:32:30', 0, 0);
INSERT INTO `base_dict_item` VALUES (1435838546934194176, 1435838066191458304, 'LogBusinessType', 'grant', '授权', 0.00, '', 1399985191002447872, '2021-09-09 13:32:41', 1399985191002447872, '2021-09-09 13:32:41', 0, 0);
INSERT INTO `base_dict_item` VALUES (1435838605537009664, 1435838066191458304, 'LogBusinessType', 'export', '导出', 0.00, '', 1399985191002447872, '2021-09-09 13:32:55', 1399985191002447872, '2021-09-09 13:32:55', 0, 0);
INSERT INTO `base_dict_item` VALUES (1435838705457913856, 1435838066191458304, 'LogBusinessType', 'import', '导入', 0.00, '', 1399985191002447872, '2021-09-09 13:33:19', 1399985191002447872, '2021-09-09 13:33:19', 0, 0);
INSERT INTO `base_dict_item` VALUES (1435838745861644288, 1435838066191458304, 'LogBusinessType', 'force', '强退', 0.00, '', 1399985191002447872, '2021-09-09 13:33:28', 1399985191002447872, '2021-09-09 13:33:28', 0, 0);
INSERT INTO `base_dict_item` VALUES (1435838786273763328, 1435838066191458304, 'LogBusinessType', 'clean', '清空数据', 0.00, '', 1399985191002447872, '2021-09-09 13:33:38', 1399985191002447872, '2021-09-09 13:33:38', 0, 0);
INSERT INTO `base_dict_item` VALUES (1438079113630003200, 1438078864509317120, 'MailSecurityCode', '1', '普通方式', 0.00, 'SECURITY_TYPE_PLAIN', 1399985191002447872, '2021-09-15 17:55:54', 1399985191002447872, '2021-09-15 17:55:54', 0, 0);
INSERT INTO `base_dict_item` VALUES (1438080323061755904, 1438078864509317120, 'MailSecurityCode', '2', 'TLS方式', 0.00, 'SECURITY_TYPE_TLS', 1399985191002447872, '2021-09-15 18:00:42', 1399985191002447872, '2021-09-15 18:00:42', 0, 0);
INSERT INTO `base_dict_item` VALUES (1438080372231581696, 1438078864509317120, 'MailSecurityCode', '3', 'SSL方式', 0.00, 'SECURITY_TYPE_SSL', 1399985191002447872, '2021-09-15 18:00:54', 1399985191002447872, '2021-09-15 18:00:54', 0, 0);
INSERT INTO `base_dict_item` VALUES (1439961603914047488, 1439961232651034624, 'MessageTemplateCode', '5', '微信', -10.00, 'WECHAT', 1399985191002447872, '2021-09-20 22:36:14', 1399985191002447872, '2021-09-20 22:36:14', 0, 1);
INSERT INTO `base_dict_item` VALUES (1439961704321490944, 1439961232651034624, 'MessageTemplateCode', '4', 'Email', 0.00, 'EMAIL', 1399985191002447872, '2021-09-20 22:36:38', 1399985191002447872, '2021-09-20 22:36:38', 0, 0);
INSERT INTO `base_dict_item` VALUES (1439962132744478720, 1439961232651034624, 'MessageTemplateCode', '3', '短信', 0.00, 'SMS', 1399985191002447872, '2021-09-20 22:38:20', 1399985191002447872, '2021-09-20 22:38:20', 0, 0);
INSERT INTO `base_dict_item` VALUES (1439962205578567680, 1439961232651034624, 'MessageTemplateCode', '2', '钉钉机器人', 0.00, 'DING_TALK_ROBOT', 1399985191002447872, '2021-09-20 22:38:38', 1399985191002447872, '2021-09-20 22:38:38', 0, 0);
INSERT INTO `base_dict_item` VALUES (1439962267511660544, 1439961232651034624, 'MessageTemplateCode', '1', '钉钉', 0.00, 'DING_TALK', 1399985191002447872, '2021-09-20 22:38:52', 1399985191002447872, '2021-09-20 22:38:52', 0, 0);
INSERT INTO `base_dict_item` VALUES (1452836696873984000, 1452836604783845376, 'SocialType', 'WeChat', '微信', 0.00, '', 1399985191002447872, '2021-10-26 11:17:16', 1399985191002447872, '2021-10-26 11:17:16', 0, 0);
INSERT INTO `base_dict_item` VALUES (1452837435482529792, 1452836604783845376, 'SocialType', 'QQ', 'QQ', 0.00, '', 1399985191002447872, '2021-10-26 11:20:12', 1399985191002447872, '2021-10-26 11:20:12', 0, 0);
INSERT INTO `base_dict_item` VALUES (1452837523030237184, 1452836604783845376, 'SocialType', 'DingTalk', '钉钉', 0.00, '', 1399985191002447872, '2021-10-26 11:20:33', 1399985191002447872, '2021-10-26 11:20:33', 0, 0);
INSERT INTO `base_dict_item` VALUES (1452844537911406592, 1452843488735621120, 'ParamType', '1', '系统参数', 0.00, '', 1399985191002447872, '2021-10-26 11:48:25', 1399985191002447872, '2021-10-26 11:48:25', 0, 0);
INSERT INTO `base_dict_item` VALUES (1452844565031776256, 1452843488735621120, 'ParamType', '2', '用户参数', 0.00, '', 1399985191002447872, '2021-10-26 11:48:32', 1399985191002447872, '2021-10-26 11:48:32', 0, 2);
INSERT INTO `base_dict_item` VALUES (1496026946344005632, 1496024933900169216, 'Political', '1', '中共党员', 1.00, '', 1399985191002447872, '2022-02-22 15:39:54', 1399985191002447872, '2022-02-22 15:39:54', 0, 0);
INSERT INTO `base_dict_item` VALUES (1496027004560945152, 1496024933900169216, 'Political', '2', '中共预备党员', 2.00, '', 1399985191002447872, '2022-02-22 15:40:07', 1399985191002447872, '2022-02-22 15:40:07', 0, 0);
INSERT INTO `base_dict_item` VALUES (1496027039264616448, 1496024933900169216, 'Political', '3', '共青团员', 3.00, '', 1399985191002447872, '2022-02-22 15:40:16', 1399985191002447872, '2022-02-22 15:40:16', 0, 0);
INSERT INTO `base_dict_item` VALUES (1496027077550223360, 1496024933900169216, 'Political', '4', '民革党员', 4.00, '', 1399985191002447872, '2022-02-22 15:40:25', 1399985191002447872, '2022-02-22 15:40:25', 0, 0);
INSERT INTO `base_dict_item` VALUES (1496027123461074944, 1496024933900169216, 'Political', '5', '民盟盟员', 5.00, '', 1399985191002447872, '2022-02-22 15:40:36', 1399985191002447872, '2022-02-22 15:40:36', 0, 0);
INSERT INTO `base_dict_item` VALUES (1496027197566038016, 1496024933900169216, 'Political', '6', '民建会员', 6.00, '', 1399985191002447872, '2022-02-22 15:40:53', 1399985191002447872, '2022-02-22 15:40:53', 0, 0);
INSERT INTO `base_dict_item` VALUES (1496027234803068928, 1496024933900169216, 'Political', '7', '民进会员', 7.00, '', 1399985191002447872, '2022-02-22 15:41:02', 1399985191002447872, '2022-02-22 15:41:02', 0, 0);
INSERT INTO `base_dict_item` VALUES (1496027272941875200, 1496024933900169216, 'Political', '8', '农工党党员', 8.00, '', 1399985191002447872, '2022-02-22 15:41:11', 1399985191002447872, '2022-02-22 15:41:11', 0, 0);
INSERT INTO `base_dict_item` VALUES (1496027306634719232, 1496024933900169216, 'Political', '9', '致公党党员', 9.00, '', 1399985191002447872, '2022-02-22 15:41:19', 1399985191002447872, '2022-02-22 15:41:19', 0, 0);
INSERT INTO `base_dict_item` VALUES (1496027369796743168, 1496024933900169216, 'Political', '10', '九三学社社员', 10.00, '', 1399985191002447872, '2022-02-22 15:41:34', 1399985191002447872, '2022-02-22 15:41:35', 0, 0);
INSERT INTO `base_dict_item` VALUES (1496027408141070336, 1496024933900169216, 'Political', '11', '台盟盟员', 11.00, '', 1399985191002447872, '2022-02-22 15:41:44', 1399985191002447872, '2022-02-22 15:41:44', 0, 0);
INSERT INTO `base_dict_item` VALUES (1496027456849522688, 1496024933900169216, 'Political', '12', '无党派人士', 12.00, '', 1399985191002447872, '2022-02-22 15:41:55', 1399985191002447872, '2022-02-22 15:41:55', 0, 0);
INSERT INTO `base_dict_item` VALUES (1496027516639326208, 1496024933900169216, 'Political', '13', '群众', 13.00, '', 1399985191002447872, '2022-02-22 15:42:09', 1399985191002447872, '2022-02-22 15:42:10', 0, 0);
INSERT INTO `base_dict_item` VALUES (1496780500696539136, 1496722894707728384, 'PayChannel', '1', '支付宝', 1.00, '', 1399985191002447872, '2022-02-24 17:34:15', 1399985191002447872, '2022-03-08 11:02:59', 0, 3);
INSERT INTO `base_dict_item` VALUES (1496780576818962432, 1496722894707728384, 'PayChannel', '2', '微信', 2.00, '', 1399985191002447872, '2022-02-24 17:34:33', 1399985191002447872, '2022-03-08 11:04:00', 0, 2);
INSERT INTO `base_dict_item` VALUES (1496780712492113920, 1496723207565058048, 'PayWay', '1', 'wap支付', 0.00, '', 1399985191002447872, '2022-02-24 17:35:05', 1399985191002447872, '2022-02-24 17:35:05', 0, 0);
INSERT INTO `base_dict_item` VALUES (1496780757647990784, 1496723207565058048, 'PayWay', '2', '应用支付', 0.00, '', 1399985191002447872, '2022-02-24 17:35:16', 1399985191002447872, '2022-02-24 17:35:16', 0, 0);
INSERT INTO `base_dict_item` VALUES (1496780799691694080, 1496723207565058048, 'PayWay', '3', 'web支付', 0.00, '', 1399985191002447872, '2022-02-24 17:35:26', 1399985191002447872, '2022-02-24 17:35:26', 0, 0);
INSERT INTO `base_dict_item` VALUES (1496780838451257344, 1496723207565058048, 'PayWay', '4', '二维码扫码支付', 0.00, '', 1399985191002447872, '2022-02-24 17:35:35', 1399985191002447872, '2022-02-24 17:35:35', 0, 0);
INSERT INTO `base_dict_item` VALUES (1496780876388737024, 1496723207565058048, 'PayWay', '5', '付款码支付', 0.00, '', 1399985191002447872, '2022-02-24 17:35:44', 1399985191002447872, '2022-02-24 17:35:44', 0, 0);
INSERT INTO `base_dict_item` VALUES (1497141630803566592, 1497140849954185216, 'PayStatus', '3', '支付取消', 0.00, '', 1399985191002447872, '2022-02-25 17:29:15', 1399985191002447872, '2022-02-25 17:29:15', 0, 0);
INSERT INTO `base_dict_item` VALUES (1497141652379066368, 1497140849954185216, 'PayStatus', '2', '失败', 0.00, '', 1399985191002447872, '2022-02-25 17:29:20', 1399985191002447872, '2022-02-25 17:29:20', 0, 0);
INSERT INTO `base_dict_item` VALUES (1497141681915355136, 1497140849954185216, 'PayStatus', '1', '成功', 0.00, '', 1399985191002447872, '2022-02-25 17:29:27', 1399985191002447872, '2022-02-25 17:29:27', 0, 0);
INSERT INTO `base_dict_item` VALUES (1497141712743489536, 1497140849954185216, 'PayStatus', '0', '支付中', 0.00, '', 1399985191002447872, '2022-02-25 17:29:35', 1399985191002447872, '2022-02-25 17:29:35', 0, 0);
INSERT INTO `base_dict_item` VALUES (1497506810439892992, 1497140849954185216, 'PayStatus', '4', '部分退款', 1.00, '部分退款', 1399985191002447872, '2022-02-26 17:40:21', 1399985191002447872, '2022-03-04 21:22:46', 0, 7);
INSERT INTO `base_dict_item` VALUES (1499367587857694720, 1497140849954185216, 'PayStatus', '5', '已退款', 2.00, '完全退款', 1399985191002447872, '2022-03-03 20:54:25', 1399985191002447872, '2022-03-04 21:22:49', 0, 3);
INSERT INTO `base_dict_item` VALUES (1501030031432847360, 1496722894707728384, 'PayChannel', '3', '云闪付', 3.00, '', 1399985191002447872, '2022-03-08 11:00:22', 1399985191002447872, '2022-03-08 11:04:07', 0, 2);
INSERT INTO `base_dict_item` VALUES (1501030073489133568, 1496722894707728384, 'PayChannel', '4', '现金', 4.00, '', 1399985191002447872, '2022-03-08 11:00:32', 1399985191002447872, '2022-03-08 11:04:10', 0, 2);
INSERT INTO `base_dict_item` VALUES (1501030108314439680, 1496722894707728384, 'PayChannel', '5', '钱包', 5.00, '', 1399985191002447872, '2022-03-08 11:00:40', 1399985191002447872, '2022-03-08 11:04:14', 0, 2);
INSERT INTO `base_dict_item` VALUES (1501031490513768448, 1501031423232937984, 'AsyncPayChannel', '3', '云闪付', 0.00, '', 1399985191002447872, '2022-03-08 11:06:10', 1399985191002447872, '2022-03-08 11:06:10', 0, 0);
INSERT INTO `base_dict_item` VALUES (1501031518208757760, 1501031423232937984, 'AsyncPayChannel', '2', '微信', 0.00, '', 1399985191002447872, '2022-03-08 11:06:16', 1399985191002447872, '2022-03-08 11:06:16', 0, 0);
INSERT INTO `base_dict_item` VALUES (1501031544360243200, 1501031423232937984, 'AsyncPayChannel', '1', '支付宝', 0.00, '', 1399985191002447872, '2022-03-08 11:06:23', 1399985191002447872, '2022-03-08 11:06:23', 0, 0);
INSERT INTO `base_dict_item` VALUES (1502276841057005568, 1502276739978473472, 'WalletStatus', '2', '禁用', 0.00, '', 1399985191002447872, '2022-03-11 21:34:45', 1399985191002447872, '2022-03-11 21:34:45', 0, 0);
INSERT INTO `base_dict_item` VALUES (1502276862108217344, 1502276739978473472, 'WalletStatus', '1', '正常', 0.00, '', 1399985191002447872, '2022-03-11 21:34:50', 1399985191002447872, '2022-03-11 21:34:50', 0, 0);
INSERT INTO `base_dict_item` VALUES (1502624716257456128, 1502624515799085056, 'WalletLogType', '1', '开通', 0.00, '', 1399985191002447872, '2022-03-12 20:37:04', 1399985191002447872, '2022-03-12 20:37:04', 0, 0);
INSERT INTO `base_dict_item` VALUES (1502624931978899456, 1502624515799085056, 'WalletLogType', '2', '主动充值', 0.00, '', 1399985191002447872, '2022-03-12 20:37:56', 1399985191002447872, '2022-03-12 20:37:56', 0, 0);
INSERT INTO `base_dict_item` VALUES (1502624956209393664, 1502624515799085056, 'WalletLogType', '3', '自动充值', 0.00, '', 1399985191002447872, '2022-03-12 20:38:02', 1399985191002447872, '2022-03-12 20:38:02', 0, 0);
INSERT INTO `base_dict_item` VALUES (1502625014719934464, 1502624515799085056, 'WalletLogType', '4', '余额变动', 0.00, '', 1399985191002447872, '2022-03-12 20:38:16', 1399985191002447872, '2022-03-12 20:38:16', 0, 0);
INSERT INTO `base_dict_item` VALUES (1502625053097816064, 1502624515799085056, 'WalletLogType', '5', '支付', 0.00, '', 1399985191002447872, '2022-03-12 20:38:25', 1399985191002447872, '2022-03-12 20:38:25', 0, 0);
INSERT INTO `base_dict_item` VALUES (1502625091639275520, 1502624515799085056, 'WalletLogType', '6', '系统扣除余额', 0.00, '', 1399985191002447872, '2022-03-12 20:38:34', 1399985191002447872, '2022-03-12 20:38:34', 0, 0);
INSERT INTO `base_dict_item` VALUES (1502625123725701120, 1502624515799085056, 'WalletLogType', '7', '退款', 0.00, '', 1399985191002447872, '2022-03-12 20:38:42', 1399985191002447872, '2022-03-12 20:38:42', 0, 0);
INSERT INTO `base_dict_item` VALUES (1502625783145787392, 1502624632392347648, 'WalletLogOperation', '1', '系统操作', 0.00, '', 1399985191002447872, '2022-03-12 20:41:19', 1399985191002447872, '2022-03-12 20:41:19', 0, 0);
INSERT INTO `base_dict_item` VALUES (1502625814837948416, 1502624632392347648, 'WalletLogOperation', '2', '管理员操作', 0.00, '', 1399985191002447872, '2022-03-12 20:41:26', 1399985191002447872, '2022-03-12 20:41:26', 0, 0);
INSERT INTO `base_dict_item` VALUES (1502625850355314688, 1502624632392347648, 'WalletLogOperation', '3', '用户操作', 0.00, '', 1399985191002447872, '2022-03-12 20:41:35', 1399985191002447872, '2022-03-12 20:41:35', 0, 0);
INSERT INTO `base_dict_item` VALUES (1503340241493135360, 1503340128037212160, 'VoucherStatus', '1', '启用', 0.00, '', 1399985191002447872, '2022-03-14 20:00:19', 1399985191002447872, '2022-03-14 20:00:19', 0, 0);
INSERT INTO `base_dict_item` VALUES (1503340326645895168, 1503340128037212160, 'VoucherStatus', '2', '停用', 0.00, '', 1399985191002447872, '2022-03-14 20:00:39', 1399985191002447872, '2022-03-14 20:00:39', 0, 0);
INSERT INTO `base_dict_item` VALUES (1505112357976612864, 1496722894707728384, 'PayChannel', '6', '储值卡', 0.00, '', 1399985191002447872, '2022-03-19 17:22:04', 1399985191002447872, '2022-03-19 17:22:04', 0, 0);
INSERT INTO `base_dict_item` VALUES (1524356452720758784, 1524356376518643712, 'GoodsParamType', 'input', '手工录入', 0.00, '', 1399985191002447872, '2022-05-11 19:51:14', 1399985191002447872, '2022-05-11 19:51:14', 0, 0);
INSERT INTO `base_dict_item` VALUES (1524356510157557760, 1524356376518643712, 'GoodsParamType', 'select', '列表选择', 0.00, '', 1399985191002447872, '2022-05-11 19:51:28', 1399985191002447872, '2022-05-11 19:51:28', 0, 0);

-- ----------------------------
-- Table structure for base_key_value
-- ----------------------------
DROP TABLE IF EXISTS `base_key_value`;
CREATE TABLE `base_key_value`  (
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
-- Records of base_key_value
-- ----------------------------

-- ----------------------------
-- Table structure for base_param
-- ----------------------------
DROP TABLE IF EXISTS `base_param`;
CREATE TABLE `base_param`  (
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
-- Records of base_param
-- ----------------------------
INSERT INTO `base_param` VALUES (1452842684284891136, '测试', 'test.v1', '123', 1, b'0', NULL, 1399985191002447872, '2021-10-26 11:41:03', 1399985191002447872, '2021-10-26 11:41:03', 0, 0);
INSERT INTO `base_param` VALUES (1500338438182789120, '结算台聚合支付请求地址', 'CashierAggregateUrl', 'http://pay1.bootx.cn/cashier/aggregatePay?key=', 1, b'1', '', 1399985191002447872, '2022-03-06 13:12:13', 1399985191002447872, '2022-05-01 15:03:03', 0, 3);
INSERT INTO `base_param` VALUES (1520668030248361984, '文件服务器地址', 'FileServerUrl', 'http://127.0.0.1:9999', 1, b'1', '', 1399985191002447872, '2022-05-01 15:34:46', 1399985191002447872, '2022-05-19 12:53:21', 0, 5);
INSERT INTO `base_param` VALUES (1529281530059161600, 'websocket服务器地址', 'WebsocketServerUrl', 'ws://127.0.0.1:9999', 1, b'1', '', 1399985191002447872, '2022-05-25 10:01:44', 1399985191002447872, '2022-05-25 10:01:44', 0, 0);

-- ----------------------------
-- Table structure for common_sequence_range
-- ----------------------------
DROP TABLE IF EXISTS `common_sequence_range`;
CREATE TABLE `common_sequence_range`  (
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '序列生成器队列区间管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of common_sequence_range
-- ----------------------------
INSERT INTO `common_sequence_range` VALUES (1470679520373862400, 'Sequence:cs', 2006, 0, '2021-12-14 16:58:16', 0, '2021-12-14 16:58:16', 6, 0);
INSERT INTO `common_sequence_range` VALUES (1470679955230908416, 'cs', 2020, 0, '2021-12-14 17:00:00', 0, '2021-12-14 17:00:00', 13, 0);

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
INSERT INTO `demo_data_perm` VALUES (1531547191561072640, '测试', '测试', '123', 1435967884114194432, '2022-05-31 16:04:40', 1435967884114194432, '2022-05-31 16:04:40', 0, 0);

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
INSERT INTO `ding_config` VALUES (1511265279181553664, '测试钉钉小程序配置', 'dingg4kj0ymmvbrvrg5a', 'Ushk8RuIT694Y7qhPQs2PHa0MFHa4PjHVUv1Th4AYW8W5kuDRcwnV3irpnAupAJK', b'0', '备注', 0, '2022-04-05 16:51:35.166000', 1399985191002447872, '2022-04-05 18:02:13.542000', 3, b'0');
INSERT INTO `ding_config` VALUES (1511283139236810752, '测试钉钉h5配置', 'dingcksft7waezipjcjq', 'WCc3q4-iOFxSmPG_OyKIKL1l0DvM-HX0B2_jsbOrOxxsYuy0iBCXKTyFbv2RZ3jX', b'1', NULL, 1399985191002447872, '2022-04-05 18:02:33.334000', 1399985191002447872, '2022-04-05 18:04:25.936000', 3, b'0');

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
INSERT INTO `ding_robot_config` VALUES (1333022277138264064, 'bootx机器人', 'bootx', '4a6212971d64208f45d647190ebc69986d6e9b67faf6aa7f1c8fc332f6652060', b'1', 'SECb6f9f872847caec745fcf10a46f4250b36c0337bade670d2f1f4756682b8cad2', 'bootx群机器人', -1, '2020-11-29 20:17:31.875000', -1, '2020-11-29 20:17:31.875000', 1, b'0');
INSERT INTO `ding_robot_config` VALUES (1454001517812203520, '33', '12', '111111111111111111', b'1', '', '', 1399985191002447872, '2021-10-29 16:25:50.547000', 1399985191002447872, '2021-10-29 16:25:50.597000', 2, b'1');

-- ----------------------------
-- Table structure for flyway_schema_history
-- ----------------------------
DROP TABLE IF EXISTS `flyway_schema_history`;
CREATE TABLE `flyway_schema_history`  (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `script` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `checksum` int(11) NULL DEFAULT NULL,
  `installed_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `installed_on` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`) USING BTREE,
  INDEX `flyway_schema_history_s_idx`(`success`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flyway_schema_history
-- ----------------------------
INSERT INTO `flyway_schema_history` VALUES (1, '1.1.0.220604', 'init', 'SQL', 'V1.1.0_220604__init.sql', -474276030, 'bootx', '2022-06-10 13:49:23', 71976, 1);

-- ----------------------------
-- Table structure for goods_brand
-- ----------------------------
DROP TABLE IF EXISTS `goods_brand`;
CREATE TABLE `goods_brand`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌图标',
  `enable` bit(1) NULL DEFAULT NULL COMMENT '是否启用',
  `remark` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '品牌' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_brand
-- ----------------------------
INSERT INTO `goods_brand` VALUES (1524046765181800448, '鸭鸭', '', NULL, '', 1399985191002447872, '2022-05-10 23:20:39', 1399985191002447872, '2022-05-10 23:20:39', 0, 0);
INSERT INTO `goods_brand` VALUES (1525092807788691456, '微信', '', b'1', '', 1399985191002447872, '2022-05-13 20:37:15', 1399985191002447872, '2022-05-13 20:37:15', 0, 0);
INSERT INTO `goods_brand` VALUES (1525092835118776320, '舜泰', '', b'1', '', 1399985191002447872, '2022-05-13 20:37:21', 1399985191002447872, '2022-05-13 20:37:21', 0, 0);
INSERT INTO `goods_brand` VALUES (1525092854139944960, '绿城', '', b'1', '', 1399985191002447872, '2022-05-13 20:37:26', 1399985191002447872, '2022-05-13 20:37:26', 0, 0);

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category`  (
  `id` bigint(20) NOT NULL,
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '上级类目id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类目名称',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标/图片地址',
  `enable` bit(1) NOT NULL COMMENT '是否启用',
  `sort_no` double(8, 2) NULL DEFAULT NULL COMMENT '排序',
  `level` int(5) NULL DEFAULT NULL COMMENT '层级',
  `remark` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '类目' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_category
-- ----------------------------

-- ----------------------------
-- Table structure for goods_category_brand
-- ----------------------------
DROP TABLE IF EXISTS `goods_category_brand`;
CREATE TABLE `goods_category_brand`  (
  `id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL COMMENT '分类id',
  `brand_id` bigint(20) NOT NULL COMMENT '品牌id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '类目品牌关联' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_category_brand
-- ----------------------------

-- ----------------------------
-- Table structure for goods_category_parameter
-- ----------------------------
DROP TABLE IF EXISTS `goods_category_parameter`;
CREATE TABLE `goods_category_parameter`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '品牌名称',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型',
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '选择值(列表)',
  `required` bit(1) NULL DEFAULT NULL COMMENT '是否必填',
  `sort_no` double(8, 2) NULL DEFAULT NULL COMMENT '排序',
  `group_id` bigint(20) NULL DEFAULT NULL COMMENT '参数组id',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '类目id',
  `remark` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '类目参数' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_category_parameter
-- ----------------------------

-- ----------------------------
-- Table structure for goods_category_parameter_group
-- ----------------------------
DROP TABLE IF EXISTS `goods_category_parameter_group`;
CREATE TABLE `goods_category_parameter_group`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `sort_no` double(8, 2) NULL DEFAULT NULL COMMENT '排序',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '类目id',
  `remark` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '类目参数组' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_category_parameter_group
-- ----------------------------

-- ----------------------------
-- Table structure for goods_category_specification
-- ----------------------------
DROP TABLE IF EXISTS `goods_category_specification`;
CREATE TABLE `goods_category_specification`  (
  `id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL COMMENT '分类id',
  `specification_id` bigint(20) NOT NULL COMMENT '规格id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '类目规格关联' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_category_specification
-- ----------------------------
INSERT INTO `goods_category_specification` VALUES (1525131071690076160, 1523994966466924544, 1524258633343254528);
INSERT INTO `goods_category_specification` VALUES (1525131071694270464, 1523994966466924544, 1524360756764590080);

-- ----------------------------
-- Table structure for goods_goods
-- ----------------------------
DROP TABLE IF EXISTS `goods_goods`;
CREATE TABLE `goods_goods`  (
  `id` bigint(20) NOT NULL,
  `cid` bigint(20) NULL DEFAULT NULL COMMENT '类目id',
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类目名称',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `packing` bit(1) NOT NULL COMMENT '是否是打包品',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
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
-- Records of goods_goods
-- ----------------------------

-- ----------------------------
-- Table structure for goods_goods_packing
-- ----------------------------
DROP TABLE IF EXISTS `goods_goods_packing`;
CREATE TABLE `goods_goods_packing`  (
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
-- Records of goods_goods_packing
-- ----------------------------

-- ----------------------------
-- Table structure for goods_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `goods_goods_sku`;
CREATE TABLE `goods_goods_sku`  (
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
-- Records of goods_goods_sku
-- ----------------------------

-- ----------------------------
-- Table structure for goods_goods_sku_attr
-- ----------------------------
DROP TABLE IF EXISTS `goods_goods_sku_attr`;
CREATE TABLE `goods_goods_sku_attr`  (
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
-- Records of goods_goods_sku_attr
-- ----------------------------

-- ----------------------------
-- Table structure for goods_goods_sku_packing
-- ----------------------------
DROP TABLE IF EXISTS `goods_goods_sku_packing`;
CREATE TABLE `goods_goods_sku_packing`  (
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
-- Records of goods_goods_sku_packing
-- ----------------------------

-- ----------------------------
-- Table structure for goods_specification
-- ----------------------------
DROP TABLE IF EXISTS `goods_specification`;
CREATE TABLE `goods_specification`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格名称',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `options` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格列表值',
  `state` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `remark` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '规格' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_specification
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
  `alone_prem` bit(1) NOT NULL COMMENT '是否有独立菜单和权限',
  `timeout` bigint(11) NULL DEFAULT NULL COMMENT '在线时长 秒',
  `captcha` bit(1) NOT NULL COMMENT '启用验证码',
  `pwd_err_num` int(8) NOT NULL COMMENT '密码错误次数',
  `enable` bit(1) NOT NULL COMMENT '是否可用',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '认证终端' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_client
-- ----------------------------
INSERT INTO `iam_client` VALUES (1430430071299207168, 'admin', 'pc管理端', b'1', b'1', 3600, b'0', -1, b'1', 'pc浏览器', 1399985191002447872, '2021-08-25 15:21:20', 1399985191002447872, '2022-04-24 19:51:13', 16, 0);
INSERT INTO `iam_client` VALUES (1430478946919653376, 'miniApp', '微信小程序', b'0', b'0', 99999, b'1', 0, b'1', NULL, 1399985191002447872, '2021-08-25 18:35:33', 1399985191002447872, '2021-08-25 18:35:33', 2, 0);
INSERT INTO `iam_client` VALUES (1435138582839009280, 'phone', '手机短信登录', b'0', b'1', 3600, b'1', 0, b'1', '', 1399985191002447872, '2021-09-07 15:11:16', 1399985191002447872, '2022-05-27 11:28:42', 3, 0);

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
  PRIMARY KEY (`id`) USING BTREE
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
  `client_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '终端code',
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
INSERT INTO `iam_perm_menu` VALUES (1414596052497092608, 'admin', NULL, '系统管理', 'system', '', NULL, 'desktop', b'0', b'0', 'RouteView', '', '/system', '/system/user', 0, 0, b'0', b'1', b'0', b'0', b'1', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2021-08-27 10:02:16', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1414596647509446656, 'admin', 1452569691537256448, '用户管理', 'User', '', NULL, '', b'0', b'0', 'system/user/UserList', '', '/system/userAuth/user', '', 0, 1, b'0', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2021-08-27 10:17:40', 4, 0);
INSERT INTO `iam_perm_menu` VALUES (1414596773275652096, 'admin', 1414596052497092608, '菜单管理', 'Menu', '', NULL, '', b'0', b'0', 'system/menu/MenuList', '', '/system/permission/menu', '', 0, 1, b'0', b'1', b'0', b'0', b'1', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2021-08-26 23:56:16', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1414596805538238464, 'admin', 1452569339987472384, '角色管理', 'Role', '', NULL, '', b'0', b'0', 'system/role/RoleList', '', '/system/permission/role', '', 0, 1, b'1', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2021-08-26 23:56:04', 4, 0);
INSERT INTO `iam_perm_menu` VALUES (1414596842322284544, 'admin', 1452569691537256448, '部门管理', 'Dept', '', NULL, '', b'0', b'0', 'system/dept/DeptList', '', '/system/userAuth/dept', '', 0, 1, b'1', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2021-08-26 23:56:31', 7, 0);
INSERT INTO `iam_perm_menu` VALUES (1414596877617352704, 'admin', 1452571269199540224, '数据字典', 'Dict', '', b'0', '', b'0', b'0', 'system/dict/DictList', '', '/system/config/dict', '', 0, 1, b'1', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2022-05-19 09:04:55', 11, 0);
INSERT INTO `iam_perm_menu` VALUES (1431082258161434624, 'admin', 1452569691537256448, '在线用户管理', 'OnlineUser', '', NULL, '', b'0', b'0', 'system/online/OnlineUserList', NULL, '/system/userAuth/online', '', 0, 1, b'1', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2021-08-27 10:32:53', 6, 0);
INSERT INTO `iam_perm_menu` VALUES (1431083330909208576, 'admin', 1414596052497092608, '终端管理', 'Client', '', b'0', '', b'0', b'0', 'system/client/ClientList', NULL, '/system/config/client', '', 0, 1, b'1', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 10:37:09', 1399985191002447872, '2022-05-19 09:04:25', 6, 0);
INSERT INTO `iam_perm_menu` VALUES (1431089129232498688, 'admin', 1452569339987472384, '请求权限管理', 'Path', '', NULL, '', b'0', b'0', 'system/path/PathList', NULL, '/system/permission/path', '', 0, 1, b'1', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 11:00:11', 1399985191002447872, '2021-08-27 11:00:11', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1431152689832525824, 'admin', NULL, '系统监控', 'monitor', '', b'0', 'radar-chart', b'0', b'0', 'RouteView', NULL, '/monitor', '', 0, 0, b'1', b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2021-08-27 15:12:45', 1399985191002447872, '2022-06-07 10:30:49', 18, 0);
INSERT INTO `iam_perm_menu` VALUES (1431153358157348864, 'admin', 1431152689832525824, '接口文档', 'ApiSwagger', '', b'0', '', b'0', b'0', '', NULL, 'http://127.0.0.1:9999/doc.html', '', 0, 1, b'1', b'1', b'1', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 15:15:25', 1399985191002447872, '2022-06-07 11:06:52', 15, 0);
INSERT INTO `iam_perm_menu` VALUES (1435143678721236992, 'admin', 1452567897717321728, '登录日志', 'LoginLog', '', NULL, '', b'0', b'0', 'starter/log/LoginLogList', NULL, '/system/log/loginLog', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-07 15:31:31', 1399985191002447872, '2021-09-07 15:31:31', 5, 0);
INSERT INTO `iam_perm_menu` VALUES (1435476255797624832, 'admin', 1452567897717321728, '操作日志', 'OperateLog', '', NULL, '', b'0', b'0', 'starter/log/OperateLogList', NULL, '/system/log/OperateLog', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-08 13:33:04', 1399985191002447872, '2021-09-08 13:33:04', 7, 0);
INSERT INTO `iam_perm_menu` VALUES (1438061887002759168, 'admin', NULL, '通知管理', 'notice', '', NULL, 'message', b'0', b'0', 'RouteView', NULL, '/notice', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-15 16:47:26', 1399985191002447872, '2021-09-15 16:47:26', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1438072357281542144, 'admin', 1438061887002759168, '邮件配置', 'MailConfig', '', NULL, '', b'0', b'0', 'notice/mail/MailConfigList', NULL, '/notice/mailConfig', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-15 17:29:03', 1399985191002447872, '2021-09-15 17:29:03', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1439196893514031104, 'admin', 1438061887002759168, '消息模板', 'MessageTemplate', '', NULL, '', b'0', b'0', 'notice/template/TemplateList', NULL, '/notice/template', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-18 19:57:33', 1399985191002447872, '2021-09-18 19:57:33', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1440216178722050048, 'admin', 1438061887002759168, '钉钉', 'DingTalk', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/notice/dingTalk', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-21 15:27:50', 1399985191002447872, '2021-09-21 15:27:50', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1440216612211757056, 'admin', 1440216178722050048, '钉钉机器人', 'DingTalkRobot', '', NULL, '', b'0', b'0', 'notice/dingTalk/robot/DingRobotConfigList', NULL, '/notice/dingTalk/robot', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-21 15:29:33', 1399985191002447872, '2021-09-21 15:29:33', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1450473063320526848, 'admin', 1452569691537256448, '第三方登录', 'Social', '', NULL, '', b'0', b'0', 'system/social/SocialList', NULL, '/system/userAuth/social', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-19 22:45:01', 1399985191002447872, '2021-10-19 22:45:01', 4, 0);
INSERT INTO `iam_perm_menu` VALUES (1450803906215886848, 'admin', 1452571269199540224, '定时任务', 'QuartzJobList', '', NULL, '', b'0', b'0', 'starter/quartz/QuartzJobList', NULL, '/system/config/quartz', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 20:39:41', 1399985191002447872, '2021-10-20 20:39:41', 5, 0);
INSERT INTO `iam_perm_menu` VALUES (1450819607680991232, 'admin', NULL, '第三方对接', 'social', '', b'0', 'branches', b'0', b'0', 'RouteView', NULL, '/social', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:42:04', 1399985191002447872, '2022-04-05 16:53:25', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1450821723027881984, 'admin', 1450819607680991232, '微信', 'SocialWeChat', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/social/wechat', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:50:28', 1399985191002447872, '2021-10-20 21:50:28', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1450821877831254016, 'admin', 1450819607680991232, '企业微信', 'SocialWeCom', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/social/wecom', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:51:05', 1399985191002447872, '2021-10-20 21:51:05', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1450822511087271936, 'admin', 1450819607680991232, '钉钉', 'SocialDingTalk', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/social/dingtalk', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:53:36', 1399985191002447872, '2021-10-20 21:53:36', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1450822842995130368, 'admin', NULL, '支付管理', 'PayManager', '', NULL, 'pay-circle', b'0', b'0', 'RouteView', NULL, '/payment', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:54:55', 1399985191002447872, '2021-10-20 21:54:55', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1450823960236081152, 'admin', 1450822842995130368, '支付通道', 'PayChannel', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/payment/channel', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:59:22', 1399985191002447872, '2021-10-20 21:59:22', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1450824117849636864, 'admin', 1450823960236081152, '支付宝', 'AliPayConfig', '', NULL, '', b'0', b'0', 'payment/channel/alipay/AliPayConfigList', NULL, '/payment/channel/alipay', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:59:59', 1399985191002447872, '2021-10-20 21:59:59', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1450824319868289024, 'admin', 1450823960236081152, '微信支付', 'WeChatPayConfig', '', NULL, '', b'0', b'0', 'payment/channel/wechat/WeChatConfigList', NULL, '/payment/channel/wechat', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:00:48', 1399985191002447872, '2021-10-20 22:00:48', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1450824637876224000, 'admin', 1450823960236081152, '云闪付', 'UnionPayConfig', '', b'0', '', b'0', b'0', 'payment/channel/unionpay/UnionPayConfigList', NULL, '/payment/channel/unionpay', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:02:03', 1399985191002447872, '2022-03-04 16:12:13', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1450824875198332928, 'admin', 1450823960236081152, '现金支付', 'CashPayConfig', '', b'0', '', b'1', b'0', '', NULL, '/payment/channel/cash', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:03:00', 1399985191002447872, '2022-03-04 16:12:08', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1450825488577544192, 'admin', 1450822842995130368, '收银台', 'PayCashier', '', NULL, '', b'0', b'0', 'payment/cashier/Cashier', NULL, '/payment/cashier', '', -1, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:05:26', 1399985191002447872, '2021-10-20 22:05:26', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1450825615857893376, 'admin', 1450822842995130368, '订单管理', 'PayOrder', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/payment/order', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:05:57', 1399985191002447872, '2021-10-20 22:05:57', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1450825819436826624, 'admin', 1450822842995130368, '回调记录', 'PayNotify', '', NULL, '', b'0', b'0', 'payment/notify/PayNotifyRecordList', NULL, '/payment/notify', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:06:45', 1399985191002447872, '2021-10-20 22:06:45', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1450826890318135296, 'admin', 1450825615857893376, '支付订单', 'PaymentOrder', '', b'0', '', b'0', b'0', 'payment/order/payment/PaymentList', NULL, '/payment/order/payment', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:11:00', 1399985191002447872, '2022-02-25 15:17:07', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1450827159626006528, 'admin', 1450825615857893376, '退款订单', 'ReturnOrder', '', b'0', '', b'0', b'0', 'payment/order/refund/RefundRecordList', NULL, '/payment/order/return', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:12:05', 1399985191002447872, '2022-03-04 15:44:06', 4, 0);
INSERT INTO `iam_perm_menu` VALUES (1450827308515409920, 'admin', 1450825615857893376, '转账订单', 'TransferOrder', '', b'0', '', b'1', b'0', 'payment/order/transfer/TransferList', NULL, '/payment/order/transfer', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:12:40', 1399985191002447872, '2022-03-04 15:33:31', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1450827660459458560, 'admin', 1438061887002759168, '微信', 'NoticeWeChat', '', NULL, '', b'0', b'0', '', NULL, '/notice/wechat', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:14:04', 1399985191002447872, '2021-10-20 22:14:04', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1452567897717321728, 'admin', 1414596052497092608, '审计日志', 'auditLog', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/system/log', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-25 17:29:09', 1399985191002447872, '2021-10-25 17:29:09', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1452569339987472384, 'admin', 1414596052497092608, '权限管理', 'permission', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/system/permission', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-25 17:34:53', 1399985191002447872, '2021-10-25 17:34:53', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1452569691537256448, 'admin', 1414596052497092608, '用户信息', 'userAuth', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/system/userAuth', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-25 17:36:17', 1399985191002447872, '2021-10-25 17:36:17', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1452571269199540224, 'admin', 1414596052497092608, '系统配置', 'systemConfig', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/system/config', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-25 17:42:33', 1399985191002447872, '2021-10-25 17:42:33', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1452638905302966272, 'admin', 1452571269199540224, '系统参数', 'SystemParam', '', NULL, '', b'0', b'0', 'system/param/SystemParamList', NULL, '/system/config/param', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-25 22:11:18', 1399985191002447872, '2021-10-25 22:11:18', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1474694545336676352, 'admin', 1452569339987472384, '数据范围权限', 'DataScope', '', NULL, '', b'0', b'0', 'system/scope/DataScopeList', NULL, '/system/permission/data', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-12-25 18:52:33', 1399985191002447872, '2021-12-25 18:52:33', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1476489893513404416, 'admin', 1414596052497092608, '22', NULL, '22', b'1', NULL, b'0', b'0', NULL, NULL, NULL, NULL, 0, 2, NULL, b'0', b'0', b'0', b'0', '', 1399985191002447872, '2021-12-30 17:46:37', 1399985191002447872, '2021-12-30 17:46:37', 4, 1);
INSERT INTO `iam_perm_menu` VALUES (1478002945936015360, 'admin', 1414596052497092608, '1', NULL, '1', b'1', NULL, b'0', b'0', NULL, NULL, NULL, NULL, 0, 2, NULL, b'0', b'0', b'0', b'0', '', 1399985191002447872, '2022-01-03 21:58:57', 1399985191002447872, '2022-01-03 21:58:57', 0, 1);
INSERT INTO `iam_perm_menu` VALUES (1478004271512240128, 'admin', 1414596052497092608, '22', NULL, '22', b'1', NULL, b'0', b'0', NULL, NULL, NULL, NULL, 0, 2, NULL, b'0', b'0', b'0', b'0', '', 1399985191002447872, '2022-01-03 22:04:13', 1399985191002447872, '2022-01-03 22:04:13', 0, 1);
INSERT INTO `iam_perm_menu` VALUES (1480839877352476672, 'admin', 1452567897717321728, '数据版本日志', 'DataVersionLog', NULL, b'0', '', b'0', b'0', 'starter/log/DataVersionLogList', NULL, '/system/log/DataVersionLog', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-01-11 17:51:54', 1399985191002447872, '2022-01-11 17:51:54', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1490984296616263680, 'admin', 1452571269199540224, '文件管理', 'FIleUpLoad', NULL, b'0', '', b'0', b'0', 'starter/file/FileUploadList', NULL, '/system/config/file', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-02-08 17:42:12', 1399985191002447872, '2022-02-08 17:42:12', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1495013564652429312, 'admin', 1452571269199540224, '代码生成', 'CodeGen', NULL, b'0', '', b'0', b'0', 'starter/codegen/CodeGenList', NULL, '/system/config/codeGen', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-02-19 20:33:04', 1399985191002447872, '2022-02-19 20:33:05', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1495968302034210816, 'admin', NULL, '功能演示', 'Demo', NULL, b'0', 'block', b'0', b'0', 'RouteView', NULL, '/demo', '', 99, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-02-22 11:46:52', 1399985191002447872, '2022-05-10 11:02:05', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1495969099987963904, 'admin', 1495968302034210816, '数据相关', 'DemoData', NULL, b'0', '', b'0', b'0', 'RouteView', NULL, '/demo/data', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-02-22 11:50:02', 1399985191002447872, '2022-03-24 16:27:46', 4, 0);
INSERT INTO `iam_perm_menu` VALUES (1496020308992143360, 'admin', 1495968302034210816, '超级查询', 'SuperQueryDemo', NULL, b'0', '', b'0', b'0', 'demo/query/SuperQueryDemoList', NULL, '/demo/query/super', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-02-22 15:13:31', 1399985191002447872, '2022-05-27 17:34:41', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1501740492360962048, 'admin', 1450822842995130368, '钱包管理', 'Wallet', NULL, b'0', '', b'0', b'0', 'RouteView', NULL, '/payment/wallet', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-10 10:03:29', 1399985191002447872, '2022-03-10 10:04:53', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1501742229142556672, 'admin', 1501740492360962048, '钱包列表', 'WalletList', NULL, b'0', '', b'0', b'0', 'payment/wallet/list/WalletList', NULL, '/payment/wallet/list', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-10 10:10:23', 1399985191002447872, '2022-03-10 17:06:19', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1501742417378725888, 'admin', 1501740492360962048, '个人钱包', 'PersonalWallet', NULL, b'0', '', b'0', b'0', 'payment/wallet/list/WalletList', NULL, '/payment/wallet/personal', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-10 10:11:08', 1399985191002447872, '2022-03-10 17:06:10', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1501847310319972352, 'admin', 1450822842995130368, '组合支付', 'CombinationCashier', NULL, b'0', '', b'0', b'0', 'payment/combination/CombinationCashier', NULL, '/payment/combination', '', -0.5, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-10 17:07:56', 1399985191002447872, '2022-03-10 17:09:28', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1502926397176242176, 'admin', 1450822842995130368, '储值卡', 'Voucher', NULL, b'0', '', b'0', b'0', 'payment/voucher/VoucherList', NULL, '/payment/voucher', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-13 16:35:51', 1399985191002447872, '2022-03-14 19:39:45', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1506910599819165696, 'admin', 1495969099987963904, '数据权限', 'DataPermDemoList', NULL, b'0', '', b'0', b'0', 'demo/data/perm/DataPermDemoList', NULL, '/demo/data/perm', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-24 16:27:39', 1399985191002447872, '2022-03-24 16:28:56', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1506910885463851008, 'admin', 1495969099987963904, '加密解密', 'DataEncryptDemo', NULL, b'0', '', b'0', b'0', 'demo/data/encrypt/DataEncryptDemoList', NULL, '/demo/data/encrypt', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-24 16:28:47', 1399985191002447872, '2022-03-24 16:28:47', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1506911113394913280, 'admin', 1495969099987963904, '数据脱敏', 'DataSensitiveDemo', NULL, b'0', '', b'0', b'0', 'demo/data/sensitive/DataSensitiveDemoList', NULL, '/demo/data/sensitive', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-24 16:29:41', 1399985191002447872, '2022-03-24 17:16:03', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1507998458886197248, 'admin', 1495968302034210816, 'WS演示', 'WebsocketDemo', NULL, b'0', '', b'0', b'0', 'demo/ws/WebsocketDemo', NULL, '/demo/ws', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-27 16:30:25', 1399985191002447872, '2022-03-27 16:30:25', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1509488473583562752, 'admin', 1495968302034210816, '幂等请求演示', 'IdempotentDemo', NULL, b'0', '', b'0', b'0', 'demo/idempotent/Idempotent', NULL, '/demo/idempotent', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-31 19:11:12', 1399985191002447872, '2022-05-27 17:35:00', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1511266086400524288, 'admin', 1450822511087271936, '钉钉配置', 'DingTalkConfig', NULL, b'0', '', b'0', b'0', 'social/dingtalk/config/DingTalkConfigList', NULL, '/social/dingtalk/config', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-04-05 16:54:48', 1399985191002447872, '2022-04-05 16:54:48', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1523860792695283712, 'admin', NULL, '商品管理', 'GoodsManager', NULL, b'0', 'car', b'0', b'0', 'RouteView', NULL, '/goods', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-05-10 11:01:40', 1399985191002447872, '2022-05-10 11:02:45', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1523941932282114048, 'admin', 1523860792695283712, '类目管理', 'CategoryManager', NULL, b'0', '', b'0', b'0', 'RouteView', NULL, '/goods/category', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-05-10 16:24:05', 1399985191002447872, '2022-05-10 16:24:17', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1523942130555252736, 'admin', 1523941932282114048, '类目', 'Category', NULL, b'0', '', b'0', b'0', 'goods/category/CategoryList', NULL, '/goods/category/category', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-05-10 16:24:52', 1399985191002447872, '2022-05-10 16:25:23', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1524044195818278912, 'admin', 1523941932282114048, '品牌', 'Brand', NULL, b'0', '', b'0', b'0', 'goods/brand/BrandList', NULL, '/goods/category/brand', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-05-10 23:10:26', 1399985191002447872, '2022-05-10 23:14:20', 4, 0);
INSERT INTO `iam_perm_menu` VALUES (1524044395823665152, 'admin', 1523941932282114048, '规格', 'SpecificationList', NULL, b'0', '', b'0', b'0', 'goods/spec/SpecificationList', NULL, '/goods/category/spec', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-05-10 23:11:14', 1399985191002447872, '2022-05-10 23:13:51', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1524044678314233856, 'admin', 1523941932282114048, '参数组', 'ParameterGroup', NULL, b'0', '', b'1', b'0', 'goods/parameter/ParameterGroupList', NULL, '/goods/category/parameter', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-05-10 23:12:21', 1399985191002447872, '2022-05-12 20:30:23', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1525472571967860736, 'admin', 1523860792695283712, '商品', 'Goods', '', b'0', '', b'0', b'0', 'goods/goods/GoodsList', NULL, '/goods/goods', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-05-14 21:46:18', 1399985191002447872, '2022-05-14 21:46:18', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1530120084482084864, 'admin', 1495968302034210816, '消息中间件演示', 'MQDemo', NULL, b'0', '', b'0', b'0', 'demo/mq/MqDemo', NULL, '/demo/mq', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-05-27 17:33:51', 1399985191002447872, '2022-05-31 15:12:15', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1530120684645044224, 'admin', 1530120084482084864, 'MQTT消息', 'MqttDemo', NULL, b'0', '', b'0', b'0', '', NULL, '/demo/mq/mqtt', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-05-27 17:36:14', 1399985191002447872, '2022-05-27 17:36:14', 0, 1);
INSERT INTO `iam_perm_menu` VALUES (1530120821144473600, 'admin', 1530120084482084864, 'RabbitMQ', 'RabbitDemo', NULL, b'0', '', b'0', b'0', '', NULL, '/demo/mq/rabbit', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-05-27 17:36:47', 1399985191002447872, '2022-05-27 17:36:47', 0, 1);
INSERT INTO `iam_perm_menu` VALUES (1534000136370204672, 'admin', 1431152689832525824, 'ELK日志', 'ELK', '', b'0', '', b'0', b'0', '', NULL, 'http://elk.dev.bootx.cn:5601/app/discover', '', 0, 1, NULL, b'1', b'1', b'0', b'0', NULL, 1399985191002447872, '2022-06-07 10:31:48', 1399985191002447872, '2022-06-07 10:31:48', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1534008203006652416, 'admin', 1431152689832525824, 'PlumeLog日志', 'PlumeLog', '', b'0', '', b'0', b'0', '', NULL, 'http://127.0.0.1:9999/plumelog/#/', '', 0, 1, NULL, b'1', b'1', b'0', b'0', NULL, 1399985191002447872, '2022-06-07 11:03:51', 1399985191002447872, '2022-06-07 11:06:13', 1, 0);

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限_请求' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_perm_path
-- ----------------------------
INSERT INTO `iam_perm_path` VALUES (1533037132564578304, 'DingTalkConfigController#delete', '删除', 'DELETE', '/ding/config/delete', '钉钉配置', b'1', b'1', '钉钉配置 删除', 1399985191002447872, '2022-06-04 18:45:09.514000', 1399985191002447872, '2022-06-04 18:45:09.514000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132585549824, 'TokenEndpoint#login', '普通登录', 'POST', '/token/login', '认证相关', b'1', b'1', '认证相关 普通登录', 1399985191002447872, '2022-06-04 18:45:09.517000', 1399985191002447872, '2022-06-04 18:45:09.517000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132593938432, 'AlipayConfigController#add', '添加', 'POST', '/alipay/add', '支付宝配置', b'1', b'1', '支付宝配置 添加', 1399985191002447872, '2022-06-04 18:45:09.519000', 1399985191002447872, '2022-06-04 18:45:09.519000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132598132736, 'RoleController#add', '添加角色（返回角色对象）', 'POST', '/role/add', '角色管理', b'1', b'1', '角色管理 添加角色（返回角色对象）', 1399985191002447872, '2022-06-04 18:45:09.520000', 1399985191002447872, '2022-06-04 18:45:09.520000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132602327040, 'CategoryParameterController#findAll', '查询所有', 'GET', '/categoryParameter/findAll', '类目参数', b'1', b'1', '类目参数 查询所有', 1399985191002447872, '2022-06-04 18:45:09.521000', 1399985191002447872, '2022-06-04 18:45:09.521000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132606521344, 'DeptController#delete', '普通删除', 'DELETE', '/dept/delete', '部门管理', b'1', b'1', '部门管理 普通删除', 1399985191002447872, '2022-06-04 18:45:09.522000', 1399985191002447872, '2022-06-04 18:45:09.522000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132610715648, 'PayController#cancelByBusinessId', '取消支付(业务id)', 'POST', '/uni_pay/cancelByBusinessId', '统一支付', b'1', b'1', '统一支付 取消支付(业务id)', 1399985191002447872, '2022-06-04 18:45:09.523000', 1399985191002447872, '2022-06-04 18:45:09.523000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132614909952, 'DictionaryItemController#existsByCode', '编码是否被使用', 'GET', '/dict/item/existsByCode', '字典项', b'1', b'1', '字典项 编码是否被使用', 1399985191002447872, '2022-06-04 18:45:09.524000', 1399985191002447872, '2022-06-04 18:45:09.524000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132614909953, 'PayController#refundByBusinessId', '全额退款(业务id)', 'POST', '/uni_pay/refundByBusinessId', '统一支付', b'1', b'1', '统一支付 全额退款(业务id)', 1399985191002447872, '2022-06-04 18:45:09.524000', 1399985191002447872, '2022-06-04 18:45:09.524000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132619104256, 'SwaggerWelcomeWebMvc#redirectToUi', 'redirectToUi', 'GET', '/swagger-ui.html', 'SwaggerWelcomeWebMvc', b'1', b'1', 'SwaggerWelcomeWebMvc redirectToUi', 1399985191002447872, '2022-06-04 18:45:09.525000', 1399985191002447872, '2022-06-04 18:45:09.525000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132623298560, 'CategoryController#findBindBrandIds', '根据类目id查询关联的绑定品牌id集合', 'GET', '/category/findBindBrandIds', '类目管理', b'1', b'1', '类目管理 根据类目id查询关联的绑定品牌id集合', 1399985191002447872, '2022-06-04 18:45:09.526000', 1399985191002447872, '2022-06-04 18:45:09.526000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132623298561, 'RoleMenuController#findMenuIds', '获取权限菜单id列表,不包含资源权限', 'GET', '/role/menu/findMenuIds', '角色菜单权限关系', b'1', b'1', '角色菜单权限关系 获取权限菜单id列表,不包含资源权限', 1399985191002447872, '2022-06-04 18:45:09.526000', 1399985191002447872, '2022-06-04 18:45:09.526000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132627492864, 'PaymentController#findByUser', '根据userId获取列表', 'GET', '/payment/findByUser', '支付记录', b'1', b'1', '支付记录 根据userId获取列表', 1399985191002447872, '2022-06-04 18:45:09.527000', 1399985191002447872, '2022-06-04 18:45:09.527000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132627492865, 'DataScopeController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/data/scope/existsByCodeNotId', '数据范围权限配置', b'1', b'1', '数据范围权限配置 编码是否被使用(不包含自己)', 1399985191002447872, '2022-06-04 18:45:09.527000', 1399985191002447872, '2022-06-04 18:45:09.527000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132631687168, 'SystemParamController#add', '添加', 'POST', '/system/param/add', '系统参数', b'1', b'1', '系统参数 添加', 1399985191002447872, '2022-06-04 18:45:09.528000', 1399985191002447872, '2022-06-04 18:45:09.528000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132631687169, 'QuartzJobController#delete', '删除', 'DELETE', '/quartz/delete', '定时任务', b'1', b'1', '定时任务 删除', 1399985191002447872, '2022-06-04 18:45:09.528000', 1399985191002447872, '2022-06-04 18:45:09.528000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132640075776, 'UserInfoController#existsUsername', '账号是否被使用', 'GET', '/user/existsUsername', '用户管理', b'1', b'1', '用户管理 账号是否被使用', 1399985191002447872, '2022-06-04 18:45:09.530000', 1399985191002447872, '2022-06-04 18:45:09.530000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132640075777, 'ClientController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/client/existsByCodeNotId', '终端管理', b'1', b'1', '终端管理 编码是否被使用(不包含自己)', 1399985191002447872, '2022-06-04 18:45:09.530000', 1399985191002447872, '2022-06-04 18:45:09.531000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132644270080, 'PaymentController#findPayTypeInfoById', '根据id获取订单支付方式', 'GET', '/payment/findPayTypeInfoById', '支付记录', b'1', b'1', '支付记录 根据id获取订单支付方式', 1399985191002447872, '2022-06-04 18:45:09.531000', 1399985191002447872, '2022-06-04 18:45:09.531000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132648464384, 'AlipayConfigController#update', '更新', 'POST', '/alipay/update', '支付宝配置', b'1', b'1', '支付宝配置 更新', 1399985191002447872, '2022-06-04 18:45:09.532000', 1399985191002447872, '2022-06-04 18:45:09.532000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132656852992, 'UserAdminController#getByEmail', '根据邮箱查询用户', 'GET', '/user/admin/getByEmail', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 根据邮箱查询用户', 1399985191002447872, '2022-06-04 18:45:09.534000', 1399985191002447872, '2022-06-04 18:45:09.534000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132661047296, 'CategoryController#bindSpec', '绑定规格', 'POST', '/category/bindSpec', '类目管理', b'1', b'1', '类目管理 绑定规格', 1399985191002447872, '2022-06-04 18:45:09.535000', 1399985191002447872, '2022-06-04 18:45:09.535000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132661047297, 'CategoryController#existsByName', '判断类目是否已经存在', 'GET', '/category/existsByName', '类目管理', b'1', b'1', '类目管理 判断类目是否已经存在', 1399985191002447872, '2022-06-04 18:45:09.535000', 1399985191002447872, '2022-06-04 18:45:09.535000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132661047298, 'StrategyController#add', '添加策略', 'POST', '/strategy/add', '策略定义', b'1', b'1', '策略定义 添加策略', 1399985191002447872, '2022-06-04 18:45:09.535000', 1399985191002447872, '2022-06-04 18:45:09.536000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132665241600, 'UserInfoController#existsEmail', '邮箱是否被使用(不包含自己)', 'GET', '/user/existsEmailNotId', '用户管理', b'1', b'1', '用户管理 邮箱是否被使用(不包含自己)', 1399985191002447872, '2022-06-04 18:45:09.536000', 1399985191002447872, '2022-06-04 18:45:09.536000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132665241601, 'AlipayConfigController#findPayWayList', '支付宝支持支付方式', 'GET', '/alipay/findPayWayList', '支付宝配置', b'1', b'1', '支付宝配置 支付宝支持支付方式', 1399985191002447872, '2022-06-04 18:45:09.536000', 1399985191002447872, '2022-06-04 18:45:09.536000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132669435904, 'DataScopeController#add', '添加', 'POST', '/data/scope/add', '数据范围权限配置', b'1', b'1', '数据范围权限配置 添加', 1399985191002447872, '2022-06-04 18:45:09.537000', 1399985191002447872, '2022-06-04 18:45:09.537000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132669435905, 'UserInfoController#existsEmail', '邮箱是否被使用', 'GET', '/user/existsEmail', '用户管理', b'1', b'1', '用户管理 邮箱是否被使用', 1399985191002447872, '2022-06-04 18:45:09.537000', 1399985191002447872, '2022-06-04 18:45:09.537000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132669435906, 'PayController#cancelByPaymentId', '取消支付(支付id)', 'POST', '/uni_pay/cancelByPaymentId', '统一支付', b'1', b'1', '统一支付 取消支付(支付id)', 1399985191002447872, '2022-06-04 18:45:09.537000', 1399985191002447872, '2022-06-04 18:45:09.538000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132673630208, 'SystemParamController#findByParamKey', '根据键名获取键值', 'GET', '/system/param/findByParamKey', '系统参数', b'1', b'1', '系统参数 根据键名获取键值', 1399985191002447872, '2022-06-04 18:45:09.538000', 1399985191002447872, '2022-06-04 18:45:09.538000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132673630209, 'DictionaryController#delete', '根据id删除', 'DELETE', '/dict/delete', '字典', b'1', b'1', '字典 根据id删除', 1399985191002447872, '2022-06-04 18:45:09.538000', 1399985191002447872, '2022-06-04 18:45:09.538000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132677824512, 'WalletController#createWalletBatch', '批量开通用户钱包操作', 'POST', '/wallet/createWalletBatch', '钱包相关的接口', b'1', b'1', '钱包相关的接口 批量开通用户钱包操作', 1399985191002447872, '2022-06-04 18:45:09.539000', 1399985191002447872, '2022-06-04 18:45:09.539000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132677824513, 'DataEncryptDemoController#findById', '通过ID查询', 'GET', '/demo/data/encrypt/findById', '数据加密解密演示', b'1', b'1', '数据加密解密演示 通过ID查询', 1399985191002447872, '2022-06-04 18:45:09.539000', 1399985191002447872, '2022-06-04 18:45:09.539000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132682018816, 'DataEncryptDemoController#add', '添加', 'POST', '/demo/data/encrypt/add', '数据加密解密演示', b'1', b'1', '数据加密解密演示 添加', 1399985191002447872, '2022-06-04 18:45:09.540000', 1399985191002447872, '2022-06-04 18:45:09.540000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132682018817, 'DingTalkConfigController#setEnable', '设置启用的配置', 'POST', '/ding/config/setEnable', '钉钉配置', b'1', b'1', '钉钉配置 设置启用的配置', 1399985191002447872, '2022-06-04 18:45:09.540000', 1399985191002447872, '2022-06-04 18:45:09.540000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132682018818, 'PermMenuController#existsByPermCode', '编码是否被使用', 'GET', '/perm/menu/existsByPermCode', '菜单权限资源', b'1', b'1', '菜单权限资源 编码是否被使用', 1399985191002447872, '2022-06-04 18:45:09.540000', 1399985191002447872, '2022-06-04 18:45:09.540000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132686213120, 'QuartzJobController#syncJobStatus', '同步定时任务状态', 'POST', '/quartz/syncJobStatus', '定时任务', b'1', b'1', '定时任务 同步定时任务状态', 1399985191002447872, '2022-06-04 18:45:09.541000', 1399985191002447872, '2022-06-04 18:45:09.541000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132686213121, 'RoleController#findAll', '查询所有的角色', 'GET', '/role/findAll', '角色管理', b'1', b'1', '角色管理 查询所有的角色', 1399985191002447872, '2022-06-04 18:45:09.541000', 1399985191002447872, '2022-06-04 18:45:09.541000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132690407424, 'InventoryController#lockInventory', '锁定库存', 'POST', '/inventory/lockInventory', '库存操作', b'1', b'1', '库存操作 锁定库存', 1399985191002447872, '2022-06-04 18:45:09.542000', 1399985191002447872, '2022-06-04 18:45:09.542000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132690407425, 'DataPermDemoController#add', '添加', 'POST', '/demo/data/perm/add', '数据权限演示', b'1', b'1', '数据权限演示 添加', 1399985191002447872, '2022-06-04 18:45:09.542000', 1399985191002447872, '2022-06-04 18:45:09.542000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132690407426, 'UserDataScopeController#saveAssign', '给用户分配权限', 'POST', '/user/data/scope/saveAssign', '用户数据权限配置', b'1', b'1', '用户数据权限配置 给用户分配权限', 1399985191002447872, '2022-06-04 18:45:09.542000', 1399985191002447872, '2022-06-04 18:45:09.542000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132694601728, 'RolePathController#save', '保存角色权限关联关系', 'POST', '/role/path/save', '角色请求权限消息关系', b'1', b'1', '角色请求权限消息关系 保存角色权限关联关系', 1399985191002447872, '2022-06-04 18:45:09.543000', 1399985191002447872, '2022-06-04 18:45:09.543000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132694601729, 'WalletController#changerBalance', '充值操作(增减余额)', 'POST', '/wallet/changerBalance', '钱包相关的接口', b'1', b'1', '钱包相关的接口 充值操作(增减余额)', 1399985191002447872, '2022-06-04 18:45:09.543000', 1399985191002447872, '2022-06-04 18:45:09.543000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132698796032, 'UserInfoController#existsPhone', '手机号是否被使用(不包含自己)', 'GET', '/user/existsPhoneNotId', '用户管理', b'1', b'1', '用户管理 手机号是否被使用(不包含自己)', 1399985191002447872, '2022-06-04 18:45:09.544000', 1399985191002447872, '2022-06-04 18:45:09.544000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132698796033, 'InventoryController#reduceLockedAndCapacity', '扣减指定的 SKU 的库存', 'POST', '/inventory/reduceLockedAndCapacity', '库存操作', b'1', b'1', '库存操作 扣减指定的 SKU 的库存', 1399985191002447872, '2022-06-04 18:45:09.544000', 1399985191002447872, '2022-06-04 18:45:09.544000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132702990336, 'DatabaseTableController#findByTableName', '获取表信息', 'GET', '/gen/table/findByTableName', '数据库表信息', b'1', b'1', '数据库表信息 获取表信息', 1399985191002447872, '2022-06-04 18:45:09.545000', 1399985191002447872, '2022-06-04 18:45:09.545000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132702990337, 'PermPathController#syncSystem', '同步系统请求资源', 'POST', '/perm/path/syncSystem', '请求权限资源', b'1', b'1', '请求权限资源 同步系统请求资源', 1399985191002447872, '2022-06-04 18:45:09.545000', 1399985191002447872, '2022-06-04 18:45:09.545000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132707184640, 'AuthAssistController#sendSmsCaptcha', '发送短信验证码', 'POST', '/auth/sendSmsCaptcha', '认证支撑接口', b'1', b'1', '认证支撑接口 发送短信验证码', 1399985191002447872, '2022-06-04 18:45:09.546000', 1399985191002447872, '2022-06-04 18:45:09.546000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132707184641, 'StrategyController#findById', '获取策略及其配置项', 'GET', '/strategy/findById', '策略定义', b'1', b'1', '策略定义 获取策略及其配置项', 1399985191002447872, '2022-06-04 18:45:09.546000', 1399985191002447872, '2022-06-04 18:45:09.546000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132707184642, 'RoleController#update', '修改角色（返回角色对象）', 'POST', '/role/update', '角色管理', b'1', b'1', '角色管理 修改角色（返回角色对象）', 1399985191002447872, '2022-06-04 18:45:09.546000', 1399985191002447872, '2022-06-04 18:45:09.546000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132711378944, 'UserAdminController#getByPhone', '根据手机号查询用户', 'GET', '/user/admin/getByPhone', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 根据手机号查询用户', 1399985191002447872, '2022-06-04 18:45:09.547000', 1399985191002447872, '2022-06-04 18:45:09.547000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132711378945, 'DataScopeController#saveUserAssign', '保存关联用户权限', 'POST', '/data/scope/saveUserAssign', '数据范围权限配置', b'1', b'1', '数据范围权限配置 保存关联用户权限', 1399985191002447872, '2022-06-04 18:45:09.547000', 1399985191002447872, '2022-06-04 18:45:09.547000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132719767552, 'CategoryController#existsByName', '判断类目是否已经存在(不包含自身)', 'GET', '/category/existsByNameNotId', '类目管理', b'1', b'1', '类目管理 判断类目是否已经存在(不包含自身)', 1399985191002447872, '2022-06-04 18:45:09.549000', 1399985191002447872, '2022-06-04 18:45:09.549000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132723961856, 'DingRobotConfigController#add', '新增机器人配置', 'POST', '/ding/robot/config/add', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 新增机器人配置', 1399985191002447872, '2022-06-04 18:45:09.550000', 1399985191002447872, '2022-06-04 18:45:09.550000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132723961857, 'GoodsController#getDetails', '查询包含sku的详情', 'GET', '/goods/getDetails', '商品管理', b'1', b'1', '商品管理 查询包含sku的详情', 1399985191002447872, '2022-06-04 18:45:09.550000', 1399985191002447872, '2022-06-04 18:45:09.550000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132728156160, 'FIleUpLoadController#getFilePreviewUrl', '获取文件预览地址', 'GET', '/file/getFilePreviewUrl', '文件上传', b'0', b'0', '文件上传 获取文件预览地址', 1399985191002447872, '2022-06-04 18:45:09.551000', 1399985191002447872, '2022-06-04 18:45:56.898000', b'0', 1);
INSERT INTO `iam_perm_path` VALUES (1533037132728156161, 'DictionaryItemController#findAll', '获取全部字典项', 'GET', '/dict/item/findAll', '字典项', b'1', b'1', '字典项 获取全部字典项', 1399985191002447872, '2022-06-04 18:45:09.551000', 1399985191002447872, '2022-06-04 18:45:09.551000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132732350464, 'PermPathController#add', '添加权限', 'POST', '/perm/path/add', '请求权限资源', b'1', b'1', '请求权限资源 添加权限', 1399985191002447872, '2022-06-04 18:45:09.552000', 1399985191002447872, '2022-06-04 18:45:09.552000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132732350465, 'OrderRecommendController#findCoupon', '查询适用的优惠券', 'POST', '/order/recommend/findCoupon', '订单优惠选择与推荐', b'1', b'1', '订单优惠选择与推荐 查询适用的优惠券', 1399985191002447872, '2022-06-04 18:45:09.552000', 1399985191002447872, '2022-06-04 18:45:09.552000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132732350466, 'UserDeptController#findIdsByUser', '根据用户ID获取到部门id集合', 'GET', '/user/dept/findIdsByUser', '用户部门关联关系', b'1', b'1', '用户部门关联关系 根据用户ID获取到部门id集合', 1399985191002447872, '2022-06-04 18:45:09.552000', 1399985191002447872, '2022-06-04 18:45:09.552000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132736544768, 'IdempotencyDemoController#lock20', '分布式锁(暂停20秒)', 'GET', '/demo/lock/lock20', '幂等控制演示', b'1', b'1', '幂等控制演示 分布式锁(暂停20秒)', 1399985191002447872, '2022-06-04 18:45:09.553000', 1399985191002447872, '2022-06-04 18:45:09.553000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132736544769, 'StrategyRegisterController#delete', '删除', 'DELETE', '/strategy/register/del/{id}', '策略注册', b'1', b'1', '策略注册 删除', 1399985191002447872, '2022-06-04 18:45:09.553000', 1399985191002447872, '2022-06-04 18:45:09.553000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132740739072, 'WalletController#findById', '根据钱包ID查询钱包', 'GET', '/wallet/findById', '钱包相关的接口', b'1', b'1', '钱包相关的接口 根据钱包ID查询钱包', 1399985191002447872, '2022-06-04 18:45:09.554000', 1399985191002447872, '2022-06-04 18:45:09.554000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132740739073, 'UserRoleController#saveAndUpdate', '给用户分配角色', 'POST', '/user/role/saveAndUpdate', '用户角色管理', b'1', b'1', '用户角色管理 给用户分配角色', 1399985191002447872, '2022-06-04 18:45:09.554000', 1399985191002447872, '2022-06-04 18:45:09.554000', b'1', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132740739074, 'TestController#redisPub', 'redis消息队列发布', 'GET', '/test/redisPub', '测试控制器', b'1', b'1', '测试控制器 redis消息队列发布', 1399985191002447872, '2022-06-04 18:45:09.554000', 1399985191002447872, '2022-06-04 18:45:09.555000', b'1', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132744933376, 'GoodsController#page', '分页', 'GET', '/goods/page', '商品管理', b'1', b'1', '商品管理 分页', 1399985191002447872, '2022-06-04 18:45:09.555000', 1399985191002447872, '2022-06-04 18:45:09.555000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132744933377, 'SwaggerConfigResource#openapiJson', 'openapiJson', 'GET', '/v3/api-docs/swagger-config', 'SwaggerConfigResource', b'0', b'0', 'SwaggerConfigResource openapiJson', 1399985191002447872, '2022-06-04 18:45:09.555000', 1399985191002447872, '2022-06-04 18:47:08.619000', b'0', 1);
INSERT INTO `iam_perm_path` VALUES (1533037132749127680, 'PermPathController#findAll', '权限列表', 'GET', '/perm/path/findAll', '请求权限资源', b'1', b'1', '请求权限资源 权限列表', 1399985191002447872, '2022-06-04 18:45:09.556000', 1399985191002447872, '2022-06-04 18:45:09.556000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132749127681, 'CategoryParameterGroupController#findById', '通过ID查询', 'GET', '/categoryParameterGroup/findById', '类目参数组', b'1', b'1', '类目参数组 通过ID查询', 1399985191002447872, '2022-06-04 18:45:09.556000', 1399985191002447872, '2022-06-04 18:45:09.556000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132753321984, 'PayController#syncByBusinessId', '刷新指定业务id的支付单状态', 'POST', '/uni_pay/syncByBusinessId', '统一支付', b'1', b'1', '统一支付 刷新指定业务id的支付单状态', 1399985191002447872, '2022-06-04 18:45:09.557000', 1399985191002447872, '2022-06-04 18:45:09.557000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132753321985, 'DingRobotConfigController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/ding/robot/config/existsByCodeNotId', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 编码是否被使用(不包含自己)', 1399985191002447872, '2022-06-04 18:45:09.557000', 1399985191002447872, '2022-06-04 18:45:09.557000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132753321986, 'PermMenuController#add', '添加菜单权限', 'POST', '/perm/menu/add', '菜单权限资源', b'1', b'1', '菜单权限资源 添加菜单权限', 1399985191002447872, '2022-06-04 18:45:09.557000', 1399985191002447872, '2022-06-04 18:45:09.557000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132757516288, 'CouponController#obtainCoupon', '领取优惠券', 'POST', '/coupon/obtainCoupon', '优惠券', b'1', b'1', '优惠券 领取优惠券', 1399985191002447872, '2022-06-04 18:45:09.558000', 1399985191002447872, '2022-06-04 18:45:09.558000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132757516289, 'MessageQueueDemoController#sendRabbitMsg', '发送RabbitMQ消息', 'POST', '/demo/mq/sendRabbitMsg', '测试消息队列', b'1', b'1', '测试消息队列 发送RabbitMQ消息', 1399985191002447872, '2022-06-04 18:45:09.558000', 1399985191002447872, '2022-06-04 18:45:09.558000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132761710592, 'DingRobotSendController#sendLink', '测试发送link', 'POST', '/ding/robot/send/link', '钉钉机器人发送', b'1', b'1', '钉钉机器人发送 测试发送link', 1399985191002447872, '2022-06-04 18:45:09.559000', 1399985191002447872, '2022-06-04 18:45:09.559000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132761710593, 'GoodsSkuController#findByGoodsId', '根据goodsId查询', 'GET', '/sku/findByGoodsId', 'sku操作', b'1', b'1', 'sku操作 根据goodsId查询', 1399985191002447872, '2022-06-04 18:45:09.559000', 1399985191002447872, '2022-06-04 18:45:09.559000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132761710594, 'UserAdminController#getUserInfoWhole', '查询用户详情', 'GET', '/user/admin/getUserInfoWhole', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 查询用户详情', 1399985191002447872, '2022-06-04 18:45:09.559000', 1399985191002447872, '2022-06-04 18:45:09.559000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132765904896, 'OperateLogController#findById', '获取', 'GET', '/log/operate/findById', '操作日志', b'1', b'1', '操作日志 获取', 1399985191002447872, '2022-06-04 18:45:09.560000', 1399985191002447872, '2022-06-04 18:45:09.560000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132765904897, 'InventoryController#increaseInventory', '增补指定 SKU 的可售库存， 扣减对应售出', 'POST', '/inventory/increaseInventory', '库存操作', b'1', b'1', '库存操作 增补指定 SKU 的可售库存， 扣减对应售出', 1399985191002447872, '2022-06-04 18:45:09.560000', 1399985191002447872, '2022-06-04 18:45:09.560000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132770099200, 'OrderFindController#findByUser', '根据用户获取订单', 'GET', '/order/findByUser', '订单查询', b'1', b'1', '订单查询 根据用户获取订单', 1399985191002447872, '2022-06-04 18:45:09.561000', 1399985191002447872, '2022-06-04 18:45:09.561000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132770099201, 'DataSensitiveDemoController#delete', '删除', 'DELETE', '/demo/data/sensitive/delete', '数据脱敏演示', b'1', b'1', '数据脱敏演示 删除', 1399985191002447872, '2022-06-04 18:45:09.561000', 1399985191002447872, '2022-06-04 18:45:09.561000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132770099202, 'DataPermDemoController#update', '修改', 'POST', '/demo/data/perm/update', '数据权限演示', b'1', b'1', '数据权限演示 修改', 1399985191002447872, '2022-06-04 18:45:09.561000', 1399985191002447872, '2022-06-04 18:45:09.561000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132774293504, 'CategoryParameterController#update', '修改', 'POST', '/categoryParameter/update', '类目参数', b'1', b'1', '类目参数 修改', 1399985191002447872, '2022-06-04 18:45:09.562000', 1399985191002447872, '2022-06-04 18:45:09.562000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132774293505, 'DataScopeController#existsByCode', '编码是否被使用', 'GET', '/data/scope/existsByCode', '数据范围权限配置', b'1', b'1', '数据范围权限配置 编码是否被使用', 1399985191002447872, '2022-06-04 18:45:09.562000', 1399985191002447872, '2022-06-04 18:45:09.562000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132778487808, 'PermMenuController#allTree', '获取全部树', 'GET', '/perm/menu/allTree', '菜单权限资源', b'1', b'1', '菜单权限资源 获取全部树', 1399985191002447872, '2022-06-04 18:45:09.563000', 1399985191002447872, '2022-06-04 18:45:09.563000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132778487809, 'TestController#sendWsByUserId', '发送ws消息(全部用户)', 'POST', '/test/sendWsByAll', '测试控制器', b'1', b'1', '测试控制器 发送ws消息(全部用户)', 1399985191002447872, '2022-06-04 18:45:09.563000', 1399985191002447872, '2022-06-04 18:45:09.563000', b'1', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132778487810, 'BrandController#findAll', '查询所有', 'GET', '/brand/findAll', '品牌', b'1', b'1', '品牌 查询所有', 1399985191002447872, '2022-06-04 18:45:09.563000', 1399985191002447872, '2022-06-04 18:45:09.563000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132786876416, 'PermPathController#delete', '删除权限', 'DELETE', '/perm/path/delete', '请求权限资源', b'1', b'1', '请求权限资源 删除权限', 1399985191002447872, '2022-06-04 18:45:09.565000', 1399985191002447872, '2022-06-04 18:45:09.565000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132786876417, 'ClientController#findAll', '查询所有的终端', 'GET', '/client/findAll', '终端管理', b'1', b'1', '终端管理 查询所有的终端', 1399985191002447872, '2022-06-04 18:45:09.565000', 1399985191002447872, '2022-06-04 18:45:09.565000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132791070720, 'StrategyController#findByType', '根据类型查询', 'GET', '/strategy/findByType', '策略定义', b'1', b'1', '策略定义 根据类型查询', 1399985191002447872, '2022-06-04 18:45:09.566000', 1399985191002447872, '2022-06-04 18:45:09.566000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132791070721, 'PermMenuController#update', '修改菜单权限', 'POST', '/perm/menu/update', '菜单权限资源', b'1', b'1', '菜单权限资源 修改菜单权限', 1399985191002447872, '2022-06-04 18:45:09.566000', 1399985191002447872, '2022-06-04 18:45:09.566000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132795265024, 'DataPermDemoController#findById', '通过ID查询', 'GET', '/demo/data/perm/findById', '数据权限演示', b'1', b'1', '数据权限演示 通过ID查询', 1399985191002447872, '2022-06-04 18:45:09.567000', 1399985191002447872, '2022-06-04 18:45:09.567000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132795265025, 'SystemParamController#existsByKey', '判断编码是否存在', 'GET', '/system/param/existsByKey', '系统参数', b'1', b'1', '系统参数 判断编码是否存在', 1399985191002447872, '2022-06-04 18:45:09.567000', 1399985191002447872, '2022-06-04 18:45:09.567000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132799459328, 'ClientController#findById', '通过ID查询终端', 'GET', '/client/findById', '终端管理', b'1', b'1', '终端管理 通过ID查询终端', 1399985191002447872, '2022-06-04 18:45:09.568000', 1399985191002447872, '2022-06-04 18:45:09.568000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132799459329, 'OnlineUserController#page', '分页', 'GET', '/user/online/page', '在线用户', b'1', b'1', '在线用户 分页', 1399985191002447872, '2022-06-04 18:45:09.568000', 1399985191002447872, '2022-06-04 18:45:09.568000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132799459330, 'DeptController#add', '添加', 'POST', '/dept/add', '部门管理', b'1', b'1', '部门管理 添加', 1399985191002447872, '2022-06-04 18:45:09.568000', 1399985191002447872, '2022-06-04 18:45:09.568000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132803653632, 'DictionaryController#update', '更新', 'POST', '/dict/update', '字典', b'1', b'1', '字典 更新', 1399985191002447872, '2022-06-04 18:45:09.569000', 1399985191002447872, '2022-06-04 18:45:09.569000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132803653633, 'ClientController#page', '分页查询终端', 'GET', '/client/page', '终端管理', b'1', b'1', '终端管理 分页查询终端', 1399985191002447872, '2022-06-04 18:45:09.569000', 1399985191002447872, '2022-06-04 18:45:09.569000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132807847936, 'AppVersionController#check', '检查更新', 'POST', '/app/version/check', 'app版本管理', b'1', b'1', 'app版本管理 检查更新', 1399985191002447872, '2022-06-04 18:45:09.570000', 1399985191002447872, '2022-06-04 18:45:09.570000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132807847937, 'UserInfoController#existsUsername', '账号是否被使用(不包含自己)', 'GET', '/user/existsUsernameNotId', '用户管理', b'1', b'1', '用户管理 账号是否被使用(不包含自己)', 1399985191002447872, '2022-06-04 18:45:09.570000', 1399985191002447872, '2022-06-04 18:45:09.570000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132807847938, 'CategoryController#findTree', '获取类目树', 'GET', '/category/findTree', '类目管理', b'1', b'1', '类目管理 获取类目树', 1399985191002447872, '2022-06-04 18:45:09.570000', 1399985191002447872, '2022-06-04 18:45:09.570000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132812042240, 'PaymentController#findStatusByBusinessId', '根据业务ID获取支付状态', 'GET', '/payment/findStatusByBusinessId', '支付记录', b'1', b'1', '支付记录 根据业务ID获取支付状态', 1399985191002447872, '2022-06-04 18:45:09.571000', 1399985191002447872, '2022-06-04 18:45:09.571000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132812042241, 'BrandController#update', '修改', 'POST', '/brand/update', '品牌', b'1', b'1', '品牌 修改', 1399985191002447872, '2022-06-04 18:45:09.571000', 1399985191002447872, '2022-06-04 18:45:09.571000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132812042242, 'WalletLogController#page', '查询钱包日志(分页)', 'GET', '/wallet/log/page', '钱包日志相关的接口', b'1', b'1', '钱包日志相关的接口 查询钱包日志(分页)', 1399985191002447872, '2022-06-04 18:45:09.572000', 1399985191002447872, '2022-06-04 18:45:09.572000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132816236544, 'DataSensitiveDemoController#findById', '通过ID查询', 'GET', '/demo/data/sensitive/findById', '数据脱敏演示', b'1', b'1', '数据脱敏演示 通过ID查询', 1399985191002447872, '2022-06-04 18:45:09.572000', 1399985191002447872, '2022-06-04 18:45:09.572000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132816236545, 'OrderPreviewController#previewOrderPriceNoCheck', '预览价格(手动无检查)', 'POST', '/order/preview/previewOrderPriceNoCheck', '订单计算', b'1', b'1', '订单计算 预览价格(手动无检查)', 1399985191002447872, '2022-06-04 18:45:09.572000', 1399985191002447872, '2022-06-04 18:45:09.572000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132820430848, 'InventoryController#increaseAvailable', '增补指定 SKU 的可售库存', 'POST', '/inventory/increaseAvailable', '库存操作', b'1', b'1', '库存操作 增补指定 SKU 的可售库存', 1399985191002447872, '2022-06-04 18:45:09.573000', 1399985191002447872, '2022-06-04 18:45:09.573000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132820430849, 'CategoryController#add', '增加新类目', 'POST', '/category/add', '类目管理', b'1', b'1', '类目管理 增加新类目', 1399985191002447872, '2022-06-04 18:45:09.573000', 1399985191002447872, '2022-06-04 18:45:09.573000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132820430850, 'DictionaryController#page', '分页', 'GET', '/dict/page', '字典', b'1', b'1', '字典 分页', 1399985191002447872, '2022-06-04 18:45:09.573000', 1399985191002447872, '2022-06-04 18:45:09.573000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132824625152, 'PaymentController#findByBusinessId', '根据businessId获取列表', 'GET', '/payment/findByBusinessId', '支付记录', b'1', b'1', '支付记录 根据businessId获取列表', 1399985191002447872, '2022-06-04 18:45:09.574000', 1399985191002447872, '2022-06-04 18:45:09.574000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132824625153, 'BrandController#add', '添加', 'POST', '/brand/add', '品牌', b'1', b'1', '品牌 添加', 1399985191002447872, '2022-06-04 18:45:09.574000', 1399985191002447872, '2022-06-04 18:45:09.574000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132824625154, 'SuperQueryDemoController#page', '分页查询', 'GET', '/demo/super/query/page', '超级查询演示', b'1', b'1', '超级查询演示 分页查询', 1399985191002447872, '2022-06-04 18:45:09.574000', 1399985191002447872, '2022-06-04 18:45:09.574000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132828819456, 'ActivityController#add', '注册活动', 'POST', '/activity/add', '活动', b'1', b'1', '活动 注册活动', 1399985191002447872, '2022-06-04 18:45:09.575000', 1399985191002447872, '2022-06-04 18:45:09.575000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132828819457, 'SystemParamController#delete', '删除', 'DELETE', '/system/param/delete', '系统参数', b'1', b'1', '系统参数 删除', 1399985191002447872, '2022-06-04 18:45:09.575000', 1399985191002447872, '2022-06-04 18:45:09.575000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132828819458, 'UserSocialLoginController#page', '分页', 'GET', '/user/social/page', '用户三方登录管理', b'1', b'1', '用户三方登录管理 分页', 1399985191002447872, '2022-06-04 18:45:09.575000', 1399985191002447872, '2022-06-04 18:45:09.575000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132833013760, 'DataScopeController#delete', '删除', 'DELETE', '/data/scope/delete', '数据范围权限配置', b'1', b'1', '数据范围权限配置 删除', 1399985191002447872, '2022-06-04 18:45:09.576000', 1399985191002447872, '2022-06-04 18:45:09.576000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132833013761, 'MultipleOpenApiWebMvcResource#openapiJson', 'openapiJson', 'GET', '/v3/api-docs/{group}', 'MultipleOpenApiWebMvcResource', b'0', b'0', 'MultipleOpenApiWebMvcResource openapiJson', 1399985191002447872, '2022-06-04 18:45:09.576000', 1399985191002447872, '2022-06-04 18:47:14.753000', b'0', 1);
INSERT INTO `iam_perm_path` VALUES (1533037132833013762, 'UserRoleController#findRolesByUser', '根据用户ID获取到角色集合', 'GET', '/user/role/findRolesByUser', '用户角色管理', b'1', b'1', '用户角色管理 根据用户ID获取到角色集合', 1399985191002447872, '2022-06-04 18:45:09.576000', 1399985191002447872, '2022-06-04 18:45:09.576000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132837208064, 'RoleMenuController#findPermissionIdsByRole', '根据角色id获取关联权限id集合(包含资源和菜单)', 'GET', '/role/menu/findPermissionIdsByRole', '角色菜单权限关系', b'1', b'1', '角色菜单权限关系 根据角色id获取关联权限id集合(包含资源和菜单)', 1399985191002447872, '2022-06-04 18:45:09.577000', 1399985191002447872, '2022-06-04 18:45:09.577000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132837208065, 'DingRobotConfigController#existsByCode', '编码是否被使用', 'GET', '/ding/robot/config/existsByCode', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 编码是否被使用', 1399985191002447872, '2022-06-04 18:45:09.577000', 1399985191002447872, '2022-06-04 18:45:09.578000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132841402368, 'VoucherController#findById', '单条查询', 'GET', '/voucher/findById', '储值卡', b'1', b'1', '储值卡 单条查询', 1399985191002447872, '2022-06-04 18:45:09.578000', 1399985191002447872, '2022-06-04 18:45:09.578000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132841402369, 'RolePathController#findPathsByUser', '根据用户id获取角色授权(请求权限列表)', 'GET', '/role/path/findPathsByUser', '角色请求权限消息关系', b'1', b'1', '角色请求权限消息关系 根据用户id获取角色授权(请求权限列表)', 1399985191002447872, '2022-06-04 18:45:09.578000', 1399985191002447872, '2022-06-04 18:45:09.578000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132841402370, 'InventoryController#getAvailable', '获取指定 SKU 的可用库存', 'GET', '/inventory/getAvailable', '库存操作', b'1', b'1', '库存操作 获取指定 SKU 的可用库存', 1399985191002447872, '2022-06-04 18:45:09.578000', 1399985191002447872, '2022-06-04 18:45:09.578000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132845596672, 'CategoryParameterController#findById', '通过ID查询', 'GET', '/categoryParameter/findById', '类目参数', b'1', b'1', '类目参数 通过ID查询', 1399985191002447872, '2022-06-04 18:45:09.579000', 1399985191002447872, '2022-06-04 18:45:09.579000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132845596673, 'CategoryController#update', '更新类目', 'POST', '/category/update', '类目管理', b'1', b'1', '类目管理 更新类目', 1399985191002447872, '2022-06-04 18:45:09.579000', 1399985191002447872, '2022-06-04 18:45:09.579000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132849790976, 'ClientController#add', '添加终端', 'POST', '/client/add', '终端管理', b'1', b'1', '终端管理 添加终端', 1399985191002447872, '2022-06-04 18:45:09.580000', 1399985191002447872, '2022-06-04 18:45:09.580000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132853985280, 'VoucherController#lock', '冻结', 'POST', '/voucher/lock', '储值卡', b'1', b'1', '储值卡 冻结', 1399985191002447872, '2022-06-04 18:45:09.581000', 1399985191002447872, '2022-06-04 18:45:09.581000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132853985281, 'DataScopeController#deleteUserAssigns', '批量删除关联用户', 'DELETE', '/data/scope/deleteUserAssigns', '数据范围权限配置', b'1', b'1', '数据范围权限配置 批量删除关联用户', 1399985191002447872, '2022-06-04 18:45:09.581000', 1399985191002447872, '2022-06-04 18:45:09.581000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132858179584, 'DictionaryItemController#update', '修改字典项（返回字典项对象）', 'POST', '/dict/item/update', '字典项', b'1', b'1', '字典项 修改字典项（返回字典项对象）', 1399985191002447872, '2022-06-04 18:45:09.582000', 1399985191002447872, '2022-06-04 18:45:09.582000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132858179585, 'CategoryParameterGroupController#update', '修改', 'POST', '/categoryParameterGroup/update', '类目参数组', b'1', b'1', '类目参数组 修改', 1399985191002447872, '2022-06-04 18:45:09.582000', 1399985191002447872, '2022-06-04 18:45:09.582000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132862373888, 'SuperQueryDemoController#superQuery', '超级查询(分页)', 'POST', '/demo/super/query/superQuery', '超级查询演示', b'1', b'1', '超级查询演示 超级查询(分页)', 1399985191002447872, '2022-06-04 18:45:09.583000', 1399985191002447872, '2022-06-04 18:45:09.583000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132862373889, 'AggregateController#createAggregatePay', '创建聚合支付', 'POST', '/aggregate/createAggregatePay', '聚合支付', b'1', b'1', '聚合支付 创建聚合支付', 1399985191002447872, '2022-06-04 18:45:09.583000', 1399985191002447872, '2022-06-04 18:45:09.583000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132862373890, 'CategoryParameterController#page', '分页查询(限定类目和分组id)', 'GET', '/categoryParameter/page', '类目参数', b'1', b'1', '类目参数 分页查询(限定类目和分组id)', 1399985191002447872, '2022-06-04 18:45:09.583000', 1399985191002447872, '2022-06-04 18:45:09.583000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132866568192, 'WalletController#createWallet', '开通用户钱包操作', 'POST', '/wallet/createWallet', '钱包相关的接口', b'1', b'1', '钱包相关的接口 开通用户钱包操作', 1399985191002447872, '2022-06-04 18:45:09.584000', 1399985191002447872, '2022-06-04 18:45:09.584000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132866568193, 'CategoryParameterController#existsByName', '判断类目参数是否已经存在(不包含自身)', 'GET', '/categoryParameter/existsByNameNotId', '类目参数', b'1', b'1', '类目参数 判断类目参数是否已经存在(不包含自身)', 1399985191002447872, '2022-06-04 18:45:09.584000', 1399985191002447872, '2022-06-04 18:45:09.584000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132870762496, 'AlipayConfigController#findById', '根据Id查询', 'GET', '/alipay/findById', '支付宝配置', b'1', b'1', '支付宝配置 根据Id查询', 1399985191002447872, '2022-06-04 18:45:09.585000', 1399985191002447872, '2022-06-04 18:45:09.585000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132870762497, 'PermMenuController#menuTree', '获取菜单树', 'GET', '/perm/menu/menuTree', '菜单权限资源', b'1', b'1', '菜单权限资源 获取菜单树', 1399985191002447872, '2022-06-04 18:45:09.585000', 1399985191002447872, '2022-06-04 18:45:09.585000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132870762498, 'DataScopeController#getDeptIds', '获取关联部门id', 'GET', '/data/scope/getDeptIds', '数据范围权限配置', b'1', b'1', '数据范围权限配置 获取关联部门id', 1399985191002447872, '2022-06-04 18:45:09.585000', 1399985191002447872, '2022-06-04 18:45:09.585000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132874956800, 'QuartzJobLogController#findById', '单条', 'GET', '/quartz/log/findById', '定时任务执行日志', b'1', b'1', '定时任务执行日志 单条', 1399985191002447872, '2022-06-04 18:45:09.586000', 1399985191002447872, '2022-06-04 18:45:09.586000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132874956801, 'IdempotencyDemoController#lock5', '分布式锁(暂停5秒)', 'GET', '/demo/lock/lock5', '幂等控制演示', b'1', b'1', '幂等控制演示 分布式锁(暂停5秒)', 1399985191002447872, '2022-06-04 18:45:09.586000', 1399985191002447872, '2022-06-04 18:45:09.586000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132874956802, 'DingTalkConfigController#findAll', '查询全部', 'GET', '/ding/config/findAll', '钉钉配置', b'1', b'1', '钉钉配置 查询全部', 1399985191002447872, '2022-06-04 18:45:09.586000', 1399985191002447872, '2022-06-04 18:45:09.586000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132874956803, 'DingRobotConfigController#update', '修改机器人配置', 'POST', '/ding/robot/config/update', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 修改机器人配置', 1399985191002447872, '2022-06-04 18:45:09.586000', 1399985191002447872, '2022-06-04 18:45:09.586000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132879151104, 'PayNotifyRecordController#page', '分页', 'GET', '/pay/notify/record/page', '支付回调记录', b'1', b'1', '支付回调记录 分页', 1399985191002447872, '2022-06-04 18:45:09.587000', 1399985191002447872, '2022-06-04 18:45:09.587000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132879151105, 'CouponController#getByIds', '批量优惠券', 'GET', '/coupon/getById', '优惠券', b'1', b'1', '优惠券 批量优惠券', 1399985191002447872, '2022-06-04 18:45:09.587000', 1399985191002447872, '2022-06-04 18:45:09.587000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132879151106, 'GoodsSkuController#findBySkuIds', '获取sku集合', 'GET', '/sku/findBySkuIds', 'sku操作', b'1', b'1', 'sku操作 获取sku集合', 1399985191002447872, '2022-06-04 18:45:09.587000', 1399985191002447872, '2022-06-04 18:45:09.587000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132883345408, 'SuperQueryDemoController#findById', '通过ID查询', 'GET', '/demo/super/query/findById', '超级查询演示', b'1', b'1', '超级查询演示 通过ID查询', 1399985191002447872, '2022-06-04 18:45:09.588000', 1399985191002447872, '2022-06-04 18:45:09.588000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132883345409, 'CashierController#combinationPay', '发起支付(组合支付)', 'POST', '/cashier/combinationPay', '结算台', b'1', b'1', '结算台 发起支付(组合支付)', 1399985191002447872, '2022-06-04 18:45:09.588000', 1399985191002447872, '2022-06-04 18:45:09.588000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132883345410, 'DataScopeController#page', '分页', 'GET', '/data/scope/page', '数据范围权限配置', b'1', b'1', '数据范围权限配置 分页', 1399985191002447872, '2022-06-04 18:45:09.588000', 1399985191002447872, '2022-06-04 18:45:09.588000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132883345411, 'SpecificationController#page', '分页查询', 'GET', '/specification/page', '规格', b'1', b'1', '规格 分页查询', 1399985191002447872, '2022-06-04 18:45:09.588000', 1399985191002447872, '2022-06-04 18:45:09.588000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132887539712, 'PermMenuController#existsByPermCode', '编码是否被使用(不包含自己)', 'GET', '/perm/menu/existsByPermCodeNotId', '菜单权限资源', b'1', b'1', '菜单权限资源 编码是否被使用(不包含自己)', 1399985191002447872, '2022-06-04 18:45:09.589000', 1399985191002447872, '2022-06-04 18:45:09.589000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132887539713, 'OnlineUserController#logoutByUserId', '踢人下线', 'POST', '/user/online/logoutByUserId', '在线用户', b'1', b'1', '在线用户 踢人下线', 1399985191002447872, '2022-06-04 18:45:09.589000', 1399985191002447872, '2022-06-04 18:45:09.589000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132887539714, 'CategoryParameterGroupController#add', '添加', 'POST', '/categoryParameterGroup/add', '类目参数组', b'1', b'1', '类目参数组 添加', 1399985191002447872, '2022-06-04 18:45:09.589000', 1399985191002447872, '2022-06-04 18:45:09.589000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132891734016, 'FIleUpLoadController#page', '分页', 'GET', '/file/page', '文件上传', b'1', b'1', '文件上传 分页', 1399985191002447872, '2022-06-04 18:45:09.590000', 1399985191002447872, '2022-06-04 18:45:09.590000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132891734017, 'OpenApiWebMvcResource#openapiYaml', 'openapiYaml', 'GET', '/v3/api-docs.yaml', 'OpenApiWebMvcResource', b'0', b'0', 'OpenApiWebMvcResource openapiYaml', 1399985191002447872, '2022-06-04 18:45:09.590000', 1399985191002447872, '2022-06-04 18:47:19.608000', b'0', 1);
INSERT INTO `iam_perm_path` VALUES (1533037132891734018, 'WeChatPayConfigController#update', '更新', 'POST', '/wechat/pay/update', '微信支付', b'1', b'1', '微信支付 更新', 1399985191002447872, '2022-06-04 18:45:09.590000', 1399985191002447872, '2022-06-04 18:45:09.590000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132891734019, 'RolePathController#findIdsByRole', '根据角色id获取关联权限id', 'GET', '/role/path/findIdsByRole', '角色请求权限消息关系', b'1', b'1', '角色请求权限消息关系 根据角色id获取关联权限id', 1399985191002447872, '2022-06-04 18:45:09.590000', 1399985191002447872, '2022-06-04 18:45:09.590000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132895928320, 'DataVersionLogController#findById', '获取', 'GET', '/log/dataVersion/findById', '数据版本日志', b'1', b'1', '数据版本日志 获取', 1399985191002447872, '2022-06-04 18:45:09.591000', 1399985191002447872, '2022-06-04 18:45:09.591000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132895928321, 'DeptController#tree', '树状展示', 'GET', '/dept/tree', '部门管理', b'1', b'1', '部门管理 树状展示', 1399985191002447872, '2022-06-04 18:45:09.591000', 1399985191002447872, '2022-06-04 18:45:09.591000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132895928322, 'UserInfoController#existsPhone', '手机号是否被使用', 'GET', '/user/existsPhone', '用户管理', b'1', b'1', '用户管理 手机号是否被使用', 1399985191002447872, '2022-06-04 18:45:09.591000', 1399985191002447872, '2022-06-04 18:45:09.591000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132900122624, 'TestController#hello', '测试', 'GET', '/test/hello', '测试控制器', b'1', b'1', '测试控制器 测试', 1399985191002447872, '2022-06-04 18:45:09.592000', 1399985191002447872, '2022-06-04 18:45:09.592000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132900122625, 'PayController#pay', '支付', 'POST', '/uni_pay/pay', '统一支付', b'1', b'1', '统一支付 支付', 1399985191002447872, '2022-06-04 18:45:09.592000', 1399985191002447872, '2022-06-04 18:45:09.592000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132900122626, 'RoleController#dropdown', '角色下拉框', 'GET', '/role/dropdown', '角色管理', b'1', b'1', '角色管理 角色下拉框', 1399985191002447872, '2022-06-04 18:45:09.592000', 1399985191002447872, '2022-06-04 18:45:09.592000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132900122627, 'DataSensitiveDemoController#page', '分页查询', 'GET', '/demo/data/sensitive/page', '数据脱敏演示', b'1', b'1', '数据脱敏演示 分页查询', 1399985191002447872, '2022-06-04 18:45:09.592000', 1399985191002447872, '2022-06-04 18:45:09.592000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132904316928, 'CouponController#findByIds', '批量查询优惠券', 'GET', '/coupon/findByIds', '优惠券', b'1', b'1', '优惠券 批量查询优惠券', 1399985191002447872, '2022-06-04 18:45:09.593000', 1399985191002447872, '2022-06-04 18:45:09.593000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132904316929, 'DingRobotConfigController#page', '分页', 'GET', '/ding/robot/config/page', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 分页', 1399985191002447872, '2022-06-04 18:45:09.593000', 1399985191002447872, '2022-06-04 18:45:09.593000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132904316930, 'CouponController#lockByIds', '批量锁定优惠券', 'POST', '/coupon/lockByIds', '优惠券', b'1', b'1', '优惠券 批量锁定优惠券', 1399985191002447872, '2022-06-04 18:45:09.593000', 1399985191002447872, '2022-06-04 18:45:09.593000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132908511232, 'ClientController#superPage', '超级查询', 'POST', '/client/superPage', '终端管理', b'1', b'1', '终端管理 超级查询', 1399985191002447872, '2022-06-04 18:45:09.594000', 1399985191002447872, '2022-06-04 18:45:09.594000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132908511233, 'DataPermDemoController#page', '分页查询', 'GET', '/demo/data/perm/page', '数据权限演示', b'1', b'1', '数据权限演示 分页查询', 1399985191002447872, '2022-06-04 18:45:09.594000', 1399985191002447872, '2022-06-04 18:45:09.594000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132908511234, 'OrderOperateController#paidOrderState', '付款成功状态变更', 'POST', '/order/paidOrderState', '订单操作', b'1', b'1', '订单操作 付款成功状态变更', 1399985191002447872, '2022-06-04 18:45:09.594000', 1399985191002447872, '2022-06-04 18:45:09.594000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132908511235, 'UserInfoController#getLoginAfterUserInfo', '登录后获取用户信息', 'GET', '/user/getLoginAfterUserInfo', '用户管理', b'1', b'1', '用户管理 登录后获取用户信息', 1399985191002447872, '2022-06-04 18:45:09.594000', 1399985191002447872, '2022-06-04 18:45:09.594000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132912705536, 'FIleUpLoadController#download', '下载文件', 'GET', '/file/download/{id}', '文件上传', b'0', b'0', '文件上传 下载文件', 1399985191002447872, '2022-06-04 18:45:09.595000', 1399985191002447872, '2022-06-04 18:46:04.706000', b'0', 1);
INSERT INTO `iam_perm_path` VALUES (1533037132912705537, 'CategoryParameterGroupController#existsByName', '判断类目参数组是否已经存在(不包含自身)', 'GET', '/categoryParameterGroup/existsByNameNotId', '类目参数组', b'1', b'1', '类目参数组 判断类目参数组是否已经存在(不包含自身)', 1399985191002447872, '2022-06-04 18:45:09.595000', 1399985191002447872, '2022-06-04 18:45:09.595000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132916899840, 'UserAdminController#update', '修改用户', 'POST', '/user/admin/update', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 修改用户', 1399985191002447872, '2022-06-04 18:45:09.596000', 1399985191002447872, '2022-06-04 18:45:09.596000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132916899841, 'OrderOperateController#cancelOrderState', '取消订单', 'POST', '/order/cancelOrderState', '订单操作', b'1', b'1', '订单操作 取消订单', 1399985191002447872, '2022-06-04 18:45:09.596000', 1399985191002447872, '2022-06-04 18:45:09.596000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132916899842, 'ClientController#delete', '删除终端', 'DELETE', '/client/delete', '终端管理', b'1', b'1', '终端管理 删除终端', 1399985191002447872, '2022-06-04 18:45:09.596000', 1399985191002447872, '2022-06-04 18:45:09.596000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132916899843, 'PaymentController#findPayTypeInfoByBusinessId', '根据businessId获取订单支付方式', 'GET', '/payment/findPayTypeInfoByBusinessId', '支付记录', b'1', b'1', '支付记录 根据businessId获取订单支付方式', 1399985191002447872, '2022-06-04 18:45:09.596000', 1399985191002447872, '2022-06-04 18:45:09.596000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132921094144, 'DingTalkConfigController#add', '新增配置', 'POST', '/ding/config/add', '钉钉配置', b'1', b'1', '钉钉配置 新增配置', 1399985191002447872, '2022-06-04 18:45:09.597000', 1399985191002447872, '2022-06-04 18:45:09.597000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132921094145, 'SpecificationController#update', '修改', 'POST', '/specification/update', '规格', b'1', b'1', '规格 修改', 1399985191002447872, '2022-06-04 18:45:09.597000', 1399985191002447872, '2022-06-04 18:45:09.597000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132921094146, 'InventoryController#unlockInventory', '释放预占的SKU库存，需使用token', 'POST', '/inventory/unlockInventory', '库存操作', b'1', b'1', '库存操作 释放预占的SKU库存，需使用token', 1399985191002447872, '2022-06-04 18:45:09.597000', 1399985191002447872, '2022-06-04 18:45:09.597000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132925288448, 'CategoryParameterController#existsByName', '判断类目参数是否已经存在', 'GET', '/categoryParameter/existsByName', '类目参数', b'1', b'1', '类目参数 判断类目参数是否已经存在', 1399985191002447872, '2022-06-04 18:45:09.598000', 1399985191002447872, '2022-06-04 18:45:09.598000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132925288449, 'DataEncryptDemoController#delete', '删除', 'DELETE', '/demo/data/encrypt/delete', '数据加密解密演示', b'1', b'1', '数据加密解密演示 删除', 1399985191002447872, '2022-06-04 18:45:09.598000', 1399985191002447872, '2022-06-04 18:45:09.598000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132925288450, 'AlipayConfigController#setUpActivity', '启用指定的支付宝配置', 'POST', '/alipay/setUpActivity', '支付宝配置', b'1', b'1', '支付宝配置 启用指定的支付宝配置', 1399985191002447872, '2022-06-04 18:45:09.598000', 1399985191002447872, '2022-06-04 18:45:09.598000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132929482752, 'DataScopeController#findById', '获取', 'GET', '/data/scope/findById', '数据范围权限配置', b'1', b'1', '数据范围权限配置 获取', 1399985191002447872, '2022-06-04 18:45:09.599000', 1399985191002447872, '2022-06-04 18:45:09.599000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132929482753, 'ClientController#findByCode', '通过code查询终端', 'GET', '/client/findByCode', '终端管理', b'1', b'1', '终端管理 通过code查询终端', 1399985191002447872, '2022-06-04 18:45:09.599000', 1399985191002447872, '2022-06-04 18:45:09.599000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132929482754, 'DataPermDemoController#delete', '删除', 'DELETE', '/demo/data/perm/delete', '数据权限演示', b'1', b'1', '数据权限演示 删除', 1399985191002447872, '2022-06-04 18:45:09.599000', 1399985191002447872, '2022-06-04 18:45:09.599000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132933677056, 'DingRobotSendController#sendMarkdown', '测试发送Markdown', 'POST', '/ding/robot/send/markdown', '钉钉机器人发送', b'1', b'1', '钉钉机器人发送 测试发送Markdown', 1399985191002447872, '2022-06-04 18:45:09.600000', 1399985191002447872, '2022-06-04 18:45:09.600000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132933677057, 'OrderRecommendController#findActivity', '查询适用的活动', 'POST', '/order/recommend/findActivity', '订单优惠选择与推荐', b'1', b'1', '订单优惠选择与推荐 查询适用的活动', 1399985191002447872, '2022-06-04 18:45:09.600000', 1399985191002447872, '2022-06-04 18:45:09.600000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132933677058, 'ActivityController#get', '查询活动', 'GET', '/activity//get/{id}', '活动', b'1', b'1', '活动 查询活动', 1399985191002447872, '2022-06-04 18:45:09.600000', 1399985191002447872, '2022-06-04 18:45:09.600000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132937871360, 'QuartzJobController#judgeJobClass', '判断是否是定时任务类', 'GET', '/quartz/judgeJobClass', '定时任务', b'1', b'1', '定时任务 判断是否是定时任务类', 1399985191002447872, '2022-06-04 18:45:09.601000', 1399985191002447872, '2022-06-04 18:45:09.601000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132937871361, 'TokenEndpoint#loginOpenId', '三方登录登录', 'POST', '/token/loginOpenId', '认证相关', b'1', b'1', '认证相关 三方登录登录', 1399985191002447872, '2022-06-04 18:45:09.601000', 1399985191002447872, '2022-06-04 18:45:09.601000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132937871362, 'AlipayConfigController#clearActivity', '清除指定的支付宝配置', 'POST', '/alipay/clearActivity', '支付宝配置', b'1', b'1', '支付宝配置 清除指定的支付宝配置', 1399985191002447872, '2022-06-04 18:45:09.601000', 1399985191002447872, '2022-06-04 18:45:09.601000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132942065664, 'StrategyController#update', '更新策略', 'POST', '/strategy/update', '策略定义', b'1', b'1', '策略定义 更新策略', 1399985191002447872, '2022-06-04 18:45:09.602000', 1399985191002447872, '2022-06-04 18:45:09.602000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132942065665, 'UserDeptController#findAllByUser', '根据用户ID获取到部门集合', 'GET', '/user/dept/findAllByUser', '用户部门关联关系', b'1', b'1', '用户部门关联关系 根据用户ID获取到部门集合', 1399985191002447872, '2022-06-04 18:45:09.602000', 1399985191002447872, '2022-06-04 18:45:09.602000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132942065666, 'StrategyController#findConfigs', '获取参数配置', 'GET', '/strategy/findConfigs', '策略定义', b'1', b'1', '策略定义 获取参数配置', 1399985191002447872, '2022-06-04 18:45:09.602000', 1399985191002447872, '2022-06-04 18:45:09.602000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132946259968, 'RoleController#existsByCode', '编码是否被使用', 'GET', '/role/existsByCode', '角色管理', b'1', b'1', '角色管理 编码是否被使用', 1399985191002447872, '2022-06-04 18:45:09.603000', 1399985191002447872, '2022-06-04 18:45:09.603000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132946259969, 'DingRobotSendController#sendText', '测试发送text', 'POST', '/ding/robot/send/text', '钉钉机器人发送', b'1', b'1', '钉钉机器人发送 测试发送text', 1399985191002447872, '2022-06-04 18:45:09.603000', 1399985191002447872, '2022-06-04 18:45:09.603000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132946259970, 'QuartzJobController#stop', '停止', 'POST', '/quartz/stop', '定时任务', b'1', b'1', '定时任务 停止', 1399985191002447872, '2022-06-04 18:45:09.603000', 1399985191002447872, '2022-06-04 18:45:09.603000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132950454272, 'SystemParamController#update', '更新', 'POST', '/system/param/update', '系统参数', b'1', b'1', '系统参数 更新', 1399985191002447872, '2022-06-04 18:45:09.604000', 1399985191002447872, '2022-06-04 18:45:09.604000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132950454273, 'CodeGeneratorController#codeGenPreview', '预览生成代码', 'POST', '/gen/code/codeGenPreview', '代码生成', b'1', b'1', '代码生成 预览生成代码', 1399985191002447872, '2022-06-04 18:45:09.604000', 1399985191002447872, '2022-06-04 18:45:09.604000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132950454274, 'DataScopeController#saveDeptAssign', '保存关联部门', 'POST', '/data/scope/saveDeptAssign', '数据范围权限配置', b'1', b'1', '数据范围权限配置 保存关联部门', 1399985191002447872, '2022-06-04 18:45:09.604000', 1399985191002447872, '2022-06-04 18:45:09.604000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132950454275, 'PayCallbackController#wechat', '微信支付回调', 'POST', '/pay/callback/wechat', '支付回调', b'1', b'1', '支付回调 微信支付回调', 1399985191002447872, '2022-06-04 18:45:09.604000', 1399985191002447872, '2022-06-04 18:45:09.604000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132954648576, 'UserDeptController#saveAndUpdate', '给用户分配部门', 'POST', '/user/dept/saveAndUpdate', '用户部门关联关系', b'1', b'1', '用户部门关联关系 给用户分配部门', 1399985191002447872, '2022-06-04 18:45:09.605000', 1399985191002447872, '2022-06-04 18:45:09.605000', b'1', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132954648577, 'BrandController#page', '分页查询', 'GET', '/brand/page', '品牌', b'1', b'1', '品牌 分页查询', 1399985191002447872, '2022-06-04 18:45:09.605000', 1399985191002447872, '2022-06-04 18:45:09.605000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132954648578, 'QuartzJobController#page', '分页', 'GET', '/quartz/page', '定时任务', b'1', b'1', '定时任务 分页', 1399985191002447872, '2022-06-04 18:45:09.605000', 1399985191002447872, '2022-06-04 18:45:09.605000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132958842880, 'DictionaryController#findAll', '查询全部', 'GET', '/dict/findAll', '字典', b'1', b'1', '字典 查询全部', 1399985191002447872, '2022-06-04 18:45:09.606000', 1399985191002447872, '2022-06-04 18:45:09.606000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132958842881, 'DingRobotConfigController#delete', '删除', 'DELETE', '/ding/robot/config/delete', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 删除', 1399985191002447872, '2022-06-04 18:45:09.606000', 1399985191002447872, '2022-06-04 18:45:09.606000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132958842882, 'RoleMenuController#getPermissions', '获取菜单和资源权限', 'GET', '/role/menu/getPermissions', '角色菜单权限关系', b'1', b'1', '角色菜单权限关系 获取菜单和资源权限', 1399985191002447872, '2022-06-04 18:45:09.606000', 1399985191002447872, '2022-06-04 18:45:09.606000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132963037184, 'VoucherController#findByCardNo', '根据卡号查询', 'GET', '/voucher/findByCardNo', '储值卡', b'1', b'1', '储值卡 根据卡号查询', 1399985191002447872, '2022-06-04 18:45:09.607000', 1399985191002447872, '2022-06-04 18:45:09.607000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132963037185, 'DingTalkConfigController#findById', '获取详情', 'GET', '/ding/config/findById', '钉钉配置', b'1', b'1', '钉钉配置 获取详情', 1399985191002447872, '2022-06-04 18:45:09.607000', 1399985191002447872, '2022-06-04 18:45:09.607000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132963037186, 'UserAdminController#findById', '根据用户id查询用户', 'GET', '/user/admin/findById', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 根据用户id查询用户', 1399985191002447872, '2022-06-04 18:45:09.607000', 1399985191002447872, '2022-06-04 18:45:09.607000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132967231488, 'QuartzJobLogController#page', '分页', 'GET', '/quartz/log/page', '定时任务执行日志', b'1', b'1', '定时任务执行日志 分页', 1399985191002447872, '2022-06-04 18:45:09.608000', 1399985191002447872, '2022-06-04 18:45:09.608000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132967231489, 'DingTalkConfigController#clearEnable', '清除启用状态', 'POST', '/ding/config/clearEnable', '钉钉配置', b'1', b'1', '钉钉配置 清除启用状态', 1399985191002447872, '2022-06-04 18:45:09.608000', 1399985191002447872, '2022-06-04 18:45:09.608000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132967231490, 'CouponTemplateController#get', '优惠券模板详情', 'POST', '/coupon/template/get/{id}', '优惠券模板', b'1', b'1', '优惠券模板 优惠券模板详情', 1399985191002447872, '2022-06-04 18:45:09.608000', 1399985191002447872, '2022-06-04 18:45:09.608000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132967231491, 'SystemParamController#page', '分页', 'GET', '/system/param/page', '系统参数', b'1', b'1', '系统参数 分页', 1399985191002447872, '2022-06-04 18:45:09.608000', 1399985191002447872, '2022-06-04 18:45:09.609000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132971425792, 'InventoryController#reduceInventory', '扣减指定 SKU 的预占库存，增加对应售出', 'POST', '/inventory/reduceInventory', '库存操作', b'1', b'1', '库存操作 扣减指定 SKU 的预占库存，增加对应售出', 1399985191002447872, '2022-06-04 18:45:09.609000', 1399985191002447872, '2022-06-04 18:45:09.609000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132971425793, 'WalletController#getWalletInfo', '获取钱包综合信息', 'GET', '/wallet/getWalletInfo', '钱包相关的接口', b'1', b'1', '钱包相关的接口 获取钱包综合信息', 1399985191002447872, '2022-06-04 18:45:09.609000', 1399985191002447872, '2022-06-04 18:45:09.609000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132971425794, 'WalletController#pageByNotWallet', '分页', 'GET', '/wallet/pageByNotWallet', '钱包相关的接口', b'1', b'1', '钱包相关的接口 分页', 1399985191002447872, '2022-06-04 18:45:09.609000', 1399985191002447872, '2022-06-04 18:45:09.609000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132975620096, 'UserAdminController#lock', '锁定用户', 'POST', '/user/admin/lock', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 锁定用户', 1399985191002447872, '2022-06-04 18:45:09.610000', 1399985191002447872, '2022-06-04 18:45:09.610000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132975620097, 'TestController#say', '测试回声', 'GET', '/test/say', '测试控制器', b'1', b'1', '测试控制器 测试回声', 1399985191002447872, '2022-06-04 18:45:09.610000', 1399985191002447872, '2022-06-04 18:45:09.610000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132975620098, 'PayController#refund', '退款', 'POST', '/uni_pay/refund', '统一支付', b'1', b'1', '统一支付 退款', 1399985191002447872, '2022-06-04 18:45:09.610000', 1399985191002447872, '2022-06-04 18:45:09.610000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132979814400, 'WeChatPayConfigController#setUpActivity', '设置启用的微信支付配置', 'POST', '/wechat/pay/setUpActivity', '微信支付', b'1', b'1', '微信支付 设置启用的微信支付配置', 1399985191002447872, '2022-06-04 18:45:09.611000', 1399985191002447872, '2022-06-04 18:45:09.611000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132979814401, 'TestController#sendWsByUserId', '发送ws消息', 'POST', '/test/sendWsByUserId', '测试控制器', b'1', b'1', '测试控制器 发送ws消息', 1399985191002447872, '2022-06-04 18:45:09.611000', 1399985191002447872, '2022-06-04 18:45:09.611000', b'1', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132979814402, 'PermMenuController#findById', '根据id查询', 'GET', '/perm/menu/findById', '菜单权限资源', b'1', b'1', '菜单权限资源 根据id查询', 1399985191002447872, '2022-06-04 18:45:09.611000', 1399985191002447872, '2022-06-04 18:45:09.611000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132979814403, 'WeChatPayConfigController#clearActivity', '清除指定的微信支付配置', 'POST', '/wechat/pay/clearActivity', '微信支付', b'1', b'1', '微信支付 清除指定的微信支付配置', 1399985191002447872, '2022-06-04 18:45:09.611000', 1399985191002447872, '2022-06-04 18:45:09.611000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132984008704, 'PermPathController#findById', '获取详情', 'GET', '/perm/path/findById', '请求权限资源', b'1', b'1', '请求权限资源 获取详情', 1399985191002447872, '2022-06-04 18:45:09.612000', 1399985191002447872, '2022-06-04 18:45:09.612000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132984008705, 'RefundRecordController#findById', '根据id查询', 'GET', '/pay/refund/findById', '退款记录', b'1', b'1', '退款记录 根据id查询', 1399985191002447872, '2022-06-04 18:45:09.612000', 1399985191002447872, '2022-06-04 18:45:09.612000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132984008706, 'DatabaseTableController#findAll', '表列表', 'GET', '/gen/table/findAll', '数据库表信息', b'1', b'1', '数据库表信息 表列表', 1399985191002447872, '2022-06-04 18:45:09.612000', 1399985191002447872, '2022-06-04 18:45:09.612000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132988203008, 'CategoryParameterGroupController#delete', '删除', 'DELETE', '/categoryParameterGroup/delete', '类目参数组', b'1', b'1', '类目参数组 删除', 1399985191002447872, '2022-06-04 18:45:09.613000', 1399985191002447872, '2022-06-04 18:45:09.613000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132988203009, 'InventoryController#unlockInventoryWithoutToken', '解锁没有令牌的库存', 'POST', '/inventory/unlockInventoryWithoutToken', '库存操作', b'1', b'1', '库存操作 解锁没有令牌的库存', 1399985191002447872, '2022-06-04 18:45:09.613000', 1399985191002447872, '2022-06-04 18:45:09.613000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132988203010, 'SystemParamController#findById', '获取单条', 'GET', '/system/param/findById', '系统参数', b'1', b'1', '系统参数 获取单条', 1399985191002447872, '2022-06-04 18:45:09.613000', 1399985191002447872, '2022-06-04 18:45:09.613000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132992397312, 'WalletController#findByUser', '根据用户查询钱包', 'GET', '/wallet/findByUser', '钱包相关的接口', b'1', b'1', '钱包相关的接口 根据用户查询钱包', 1399985191002447872, '2022-06-04 18:45:09.614000', 1399985191002447872, '2022-06-04 18:45:09.614000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132992397313, 'SuperQueryDemoController#add', '添加', 'POST', '/demo/super/query/add', '超级查询演示', b'1', b'1', '超级查询演示 添加', 1399985191002447872, '2022-06-04 18:45:09.614000', 1399985191002447872, '2022-06-04 18:45:09.614000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132992397314, 'SpecificationController#findAll', '查询所有', 'GET', '/specification/findAll', '规格', b'1', b'1', '规格 查询所有', 1399985191002447872, '2022-06-04 18:45:09.614000', 1399985191002447872, '2022-06-04 18:45:09.614000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132992397315, 'DingRobotConfigController#findById', '获取详情', 'GET', '/ding/robot/config/findById', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 获取详情', 1399985191002447872, '2022-06-04 18:45:09.614000', 1399985191002447872, '2022-06-04 18:45:09.614000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132996591616, 'UserInfoController#updateBaseInfo', '修改用户基础信息', 'POST', '/user/updateBaseInfo', '用户管理', b'1', b'1', '用户管理 修改用户基础信息', 1399985191002447872, '2022-06-04 18:45:09.615000', 1399985191002447872, '2022-06-04 18:45:09.615000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132996591617, 'DataScopeController#findAll', '查询全部', 'GET', '/data/scope/findAll', '数据范围权限配置', b'1', b'1', '数据范围权限配置 查询全部', 1399985191002447872, '2022-06-04 18:45:09.615000', 1399985191002447872, '2022-06-04 18:45:09.615000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037132996591618, 'UserDataScopeController#findAllByUser', '根据用户ID获取到部门集合', 'GET', '/user/data/scope/findAllByUser', '用户数据权限配置', b'1', b'1', '用户数据权限配置 根据用户ID获取到部门集合', 1399985191002447872, '2022-06-04 18:45:09.615000', 1399985191002447872, '2022-06-04 18:45:09.615000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133000785920, 'StrategyController#findAll', '查询全部策略', 'GET', '/strategy/findAll', '策略定义', b'1', b'1', '策略定义 查询全部策略', 1399985191002447872, '2022-06-04 18:45:09.616000', 1399985191002447872, '2022-06-04 18:45:09.616000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133000785921, 'PaymentController#findById', '根据id获取', 'GET', '/payment/findById', '支付记录', b'1', b'1', '支付记录 根据id获取', 1399985191002447872, '2022-06-04 18:45:09.616000', 1399985191002447872, '2022-06-04 18:45:09.616000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133000785922, 'CouponTemplateController#addCouponTemplate', '新建优惠券模板', 'POST', '/coupon/template/add', '优惠券模板', b'1', b'1', '优惠券模板 新建优惠券模板', 1399985191002447872, '2022-06-04 18:45:09.616000', 1399985191002447872, '2022-06-04 18:45:09.616000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133000785923, 'WalletController#page', '分页', 'GET', '/wallet/page', '钱包相关的接口', b'1', b'1', '钱包相关的接口 分页', 1399985191002447872, '2022-06-04 18:45:09.616000', 1399985191002447872, '2022-06-04 18:45:09.616000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133004980224, 'InventoryController#reduceSoldAndCapacity', '扣减指定 SKU 的售出库存并减少总库存', 'POST', '/inventory/reduceSoldAndCapacity', '库存操作', b'1', b'1', '库存操作 扣减指定 SKU 的售出库存并减少总库存', 1399985191002447872, '2022-06-04 18:45:09.617000', 1399985191002447872, '2022-06-04 18:45:09.617000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133004980225, 'MultipleOpenApiWebMvcResource#openapiYaml', 'openapiYaml', 'GET', '/v3/api-docs.yaml/{group}', 'MultipleOpenApiWebMvcResource', b'0', b'0', 'MultipleOpenApiWebMvcResource openapiYaml', 1399985191002447872, '2022-06-04 18:45:09.617000', 1399985191002447872, '2022-06-04 18:47:22.698000', b'0', 1);
INSERT INTO `iam_perm_path` VALUES (1533037133004980226, 'DataEncryptDemoController#page', '分页查询', 'GET', '/demo/data/encrypt/page', '数据加密解密演示', b'1', b'1', '数据加密解密演示 分页查询', 1399985191002447872, '2022-06-04 18:45:09.617000', 1399985191002447872, '2022-06-04 18:45:09.617000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133009174528, 'QuartzJobController#start', '启动', 'POST', '/quartz/start', '定时任务', b'1', b'1', '定时任务 启动', 1399985191002447872, '2022-06-04 18:45:09.618000', 1399985191002447872, '2022-06-04 18:45:09.618000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133009174529, 'AppVersionController#page', '分页', 'GET', '/app/version/page', 'app版本管理', b'1', b'1', 'app版本管理 分页', 1399985191002447872, '2022-06-04 18:45:09.618000', 1399985191002447872, '2022-06-04 18:45:09.618000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133009174530, 'FIleUpLoadController#local', '上传', 'POST', '/file/upload', '文件上传', b'0', b'0', '文件上传 上传', 1399985191002447872, '2022-06-04 18:45:09.618000', 1399985191002447872, '2022-06-04 18:46:08.153000', b'0', 1);
INSERT INTO `iam_perm_path` VALUES (1533037133009174531, 'AppVersionController#delete', '删除', 'DELETE', '/app/version/delete', 'app版本管理', b'1', b'1', 'app版本管理 删除', 1399985191002447872, '2022-06-04 18:45:09.618000', 1399985191002447872, '2022-06-04 18:45:09.618000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133013368832, 'DeptController#deleteAndChildren', '强制级联删除', 'DELETE', '/dept/deleteAndChildren', '部门管理', b'1', b'1', '部门管理 强制级联删除', 1399985191002447872, '2022-06-04 18:45:09.619000', 1399985191002447872, '2022-06-04 18:45:09.619000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133013368833, 'SuperQueryDemoController#delete', '删除', 'DELETE', '/demo/super/query/delete', '超级查询演示', b'1', b'1', '超级查询演示 删除', 1399985191002447872, '2022-06-04 18:45:09.619000', 1399985191002447872, '2022-06-04 18:45:09.619000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133013368834, 'ClientController#existsByCode', '编码是否被使用', 'GET', '/client/existsByCode', '终端管理', b'1', b'1', '终端管理 编码是否被使用', 1399985191002447872, '2022-06-04 18:45:09.619000', 1399985191002447872, '2022-06-04 18:45:09.619000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133017563136, 'OrderOperateController#placeOrder', '传入订单和优惠, 下单', 'POST', '/order/placeOrder', '订单操作', b'1', b'1', '订单操作 传入订单和优惠, 下单', 1399985191002447872, '2022-06-04 18:45:09.620000', 1399985191002447872, '2022-06-04 18:45:09.620000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133017563137, 'GoodsController#findById', '查询包含商品信息', 'GET', '/goods/findById', '商品管理', b'1', b'1', '商品管理 查询包含商品信息', 1399985191002447872, '2022-06-04 18:45:09.620000', 1399985191002447872, '2022-06-04 18:45:09.620000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133021757440, 'GoodsSkuController#add', '添加商品sku', 'POST', '/sku/add', 'sku操作', b'1', b'1', 'sku操作 添加商品sku', 1399985191002447872, '2022-06-04 18:45:09.621000', 1399985191002447872, '2022-06-04 18:45:09.621000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133021757441, 'LoginLogController#findById', '获取', 'GET', '/log/login/findById', '登录日志', b'1', b'1', '登录日志 获取', 1399985191002447872, '2022-06-04 18:45:09.621000', 1399985191002447872, '2022-06-04 18:45:09.621000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133021757442, 'CategoryParameterGroupController#existsByName', '判断类目参数组是否已经存在', 'GET', '/categoryParameterGroup/existsByName', '类目参数组', b'1', b'1', '类目参数组 判断类目参数组是否已经存在', 1399985191002447872, '2022-06-04 18:45:09.621000', 1399985191002447872, '2022-06-04 18:45:09.621000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133025951744, 'UserInfoController#updatePassword', '修改密码', 'POST', '/user/updatePassword', '用户管理', b'1', b'1', '用户管理 修改密码', 1399985191002447872, '2022-06-04 18:45:09.622000', 1399985191002447872, '2022-06-04 18:45:09.622000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133025951745, 'DataScopeController#existsByName', '名称是否被使用', 'GET', '/data/scope/existsByName', '数据范围权限配置', b'1', b'1', '数据范围权限配置 名称是否被使用', 1399985191002447872, '2022-06-04 18:45:09.622000', 1399985191002447872, '2022-06-04 18:45:09.622000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133025951746, 'GoodsSkuController#getById', '获取sku', 'GET', '/sku/get', 'sku操作', b'1', b'1', 'sku操作 获取sku', 1399985191002447872, '2022-06-04 18:45:09.622000', 1399985191002447872, '2022-06-04 18:45:09.622000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133030146048, 'GoodsController#add', '添加商品', 'POST', '/goods/add', '商品管理', b'1', b'1', '商品管理 添加商品', 1399985191002447872, '2022-06-04 18:45:09.623000', 1399985191002447872, '2022-06-04 18:45:09.623000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133030146049, 'IdempotencyDemoController#lock0', '分布式锁(不暂停)', 'POST', '/demo/lock/lock0', '幂等控制演示', b'1', b'1', '幂等控制演示 分布式锁(不暂停)', 1399985191002447872, '2022-06-04 18:45:09.623000', 1399985191002447872, '2022-06-04 18:45:09.623000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133030146050, 'RoleController#existsByName', '名称是否被使用(不包含自己)', 'GET', '/role/existsByNameNotId', '角色管理', b'1', b'1', '角色管理 名称是否被使用(不包含自己)', 1399985191002447872, '2022-06-04 18:45:09.623000', 1399985191002447872, '2022-06-04 18:45:09.623000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133030146051, 'CaptchaController#imgCaptcha', '获取图片验证码', 'POST', '/captcha/imgCaptcha', '验证码服务', b'1', b'1', '验证码服务 获取图片验证码', 1399985191002447872, '2022-06-04 18:45:09.623000', 1399985191002447872, '2022-06-04 18:45:09.623000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133034340352, 'PaymentController#page', '分页查询', 'GET', '/payment/page', '支付记录', b'1', b'1', '支付记录 分页查询', 1399985191002447872, '2022-06-04 18:45:09.624000', 1399985191002447872, '2022-06-04 18:45:09.624000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133034340353, 'OpenApiWebMvcResource#openapiJson', 'openapiJson', 'GET', '/v3/api-docs', 'OpenApiWebMvcResource', b'0', b'0', 'OpenApiWebMvcResource openapiJson', 1399985191002447872, '2022-06-04 18:45:09.624000', 1399985191002447872, '2022-06-04 18:47:25.990000', b'0', 1);
INSERT INTO `iam_perm_path` VALUES (1533037133034340354, 'UserAdminController#page', '分页', 'GET', '/user/admin/page', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 分页', 1399985191002447872, '2022-06-04 18:45:09.624000', 1399985191002447872, '2022-06-04 18:45:09.624000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133034340355, 'SuperQueryDemoController#update', '修改', 'POST', '/demo/super/query/update', '超级查询演示', b'1', b'1', '超级查询演示 修改', 1399985191002447872, '2022-06-04 18:45:09.624000', 1399985191002447872, '2022-06-04 18:45:09.625000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133038534656, 'OperateLogController#page', '分页', 'GET', '/log/operate/page', '操作日志', b'1', b'1', '操作日志 分页', 1399985191002447872, '2022-06-04 18:45:09.625000', 1399985191002447872, '2022-06-04 18:45:09.625000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133038534657, 'DictionaryController#findById', '根据id获取', 'GET', '/dict/findById', '字典', b'1', b'1', '字典 根据id获取', 1399985191002447872, '2022-06-04 18:45:09.625000', 1399985191002447872, '2022-06-04 18:45:09.625000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133042728960, 'DingRobotConfigController#findAll', '查询全部', 'GET', '/ding/robot/config/findAll', '钉钉机器人配置', b'1', b'1', '钉钉机器人配置 查询全部', 1399985191002447872, '2022-06-04 18:45:09.626000', 1399985191002447872, '2022-06-04 18:45:09.626000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133042728961, 'StrategyRegisterController#findAll', '查询全部', 'GET', '/strategy/register/findAll', '策略注册', b'1', b'1', '策略注册 查询全部', 1399985191002447872, '2022-06-04 18:45:09.626000', 1399985191002447872, '2022-06-04 18:45:09.626000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133042728962, 'CategoryController#findById', '通过 id 获取指定类目', 'GET', '/category/findById', '类目管理', b'1', b'1', '类目管理 通过 id 获取指定类目', 1399985191002447872, '2022-06-04 18:45:09.626000', 1399985191002447872, '2022-06-04 18:45:09.626000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133046923264, 'CategoryController#findBindSpecIds', '根据类目id查询关联的绑定规格id集合', 'GET', '/category/findBindSpecIds', '类目管理', b'1', b'1', '类目管理 根据类目id查询关联的绑定规格id集合', 1399985191002447872, '2022-06-04 18:45:09.627000', 1399985191002447872, '2022-06-04 18:45:09.627000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133046923265, 'RefundRecordController#page', '分页', 'GET', '/pay/refund/page', '退款记录', b'1', b'1', '退款记录 分页', 1399985191002447872, '2022-06-04 18:45:09.627000', 1399985191002447872, '2022-06-04 18:45:09.627000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133046923266, 'RoleController#delete', '删除角色', 'DELETE', '/role/delete', '角色管理', b'1', b'1', '角色管理 删除角色', 1399985191002447872, '2022-06-04 18:45:09.627000', 1399985191002447872, '2022-06-04 18:45:09.627000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133051117568, 'GoodsController#findByCategory', '按类目查询', 'GET', '/goods/findByCategory', '商品管理', b'1', b'1', '商品管理 按类目查询', 1399985191002447872, '2022-06-04 18:45:09.628000', 1399985191002447872, '2022-06-04 18:45:09.628000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133051117569, 'IdempotencyDemoController#idempotency', '幂等演示', 'POST', '/demo/lock/idempotency', '幂等控制演示', b'1', b'1', '幂等控制演示 幂等演示', 1399985191002447872, '2022-06-04 18:45:09.628000', 1399985191002447872, '2022-06-04 18:45:09.628000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133051117570, 'AppVersionController#add', '添加', 'POST', '/app/version/add', 'app版本管理', b'1', b'1', 'app版本管理 添加', 1399985191002447872, '2022-06-04 18:45:09.628000', 1399985191002447872, '2022-06-04 18:45:09.628000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133055311872, 'TestController#sequenceZdy', '序列生成器自定义', 'GET', '/test/sequenceZdy', '测试控制器', b'1', b'1', '测试控制器 发号器自定义', 1399985191002447872, '2022-06-04 18:45:09.629000', 1399985191002447872, '2022-06-04 18:45:09.629000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133055311873, 'CategoryParameterController#delete', '删除', 'DELETE', '/categoryParameter/delete', '类目参数', b'1', b'1', '类目参数 删除', 1399985191002447872, '2022-06-04 18:45:09.629000', 1399985191002447872, '2022-06-04 18:45:09.629000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133055311874, 'DataSensitiveDemoController#update', '修改', 'POST', '/demo/data/sensitive/update', '数据脱敏演示', b'1', b'1', '数据脱敏演示 修改', 1399985191002447872, '2022-06-04 18:45:09.629000', 1399985191002447872, '2022-06-04 18:45:09.629000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133055311875, 'SpecificationController#add', '添加', 'POST', '/specification/add', '规格', b'1', b'1', '规格 添加', 1399985191002447872, '2022-06-04 18:45:09.629000', 1399985191002447872, '2022-06-04 18:45:09.629000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133059506176, 'PayNotifyRecordController#findById', '根据id查询', 'GET', '/pay/notify/record/findById', '支付回调记录', b'1', b'1', '支付回调记录 根据id查询', 1399985191002447872, '2022-06-04 18:45:09.630000', 1399985191002447872, '2022-06-04 18:45:09.630000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133059506177, 'DataSensitiveDemoController#add', '添加', 'POST', '/demo/data/sensitive/add', '数据脱敏演示', b'1', b'1', '数据脱敏演示 添加', 1399985191002447872, '2022-06-04 18:45:09.630000', 1399985191002447872, '2022-06-04 18:45:09.630000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133059506178, 'CouponController#findCoupon', '个人可用的优惠券', 'GET', '/coupon/findCoupon', '优惠券', b'1', b'1', '优惠券 个人可用的优惠券', 1399985191002447872, '2022-06-04 18:45:09.630000', 1399985191002447872, '2022-06-04 18:45:09.630000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133063700480, 'RoleMenuController#save', '保存请求权限关系', 'POST', '/role/menu/save', '角色菜单权限关系', b'1', b'1', '角色菜单权限关系 保存请求权限关系', 1399985191002447872, '2022-06-04 18:45:09.631000', 1399985191002447872, '2022-06-04 18:45:09.631000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133063700481, 'OrderFindController#findOrderSkuIds', '查询订单包含的skuIds', 'GET', '/order/findOrderSkuIds', '订单查询', b'1', b'1', '订单查询 查询订单包含的skuIds', 1399985191002447872, '2022-06-04 18:45:09.631000', 1399985191002447872, '2022-06-04 18:45:09.631000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133063700482, 'CategoryController#bindBrand', '绑定品牌', 'POST', '/category/bindBrand', '类目管理', b'1', b'1', '类目管理 绑定品牌', 1399985191002447872, '2022-06-04 18:45:09.631000', 1399985191002447872, '2022-06-04 18:45:09.631000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133067894784, 'FIleUpLoadController#preview', '预览文件', 'GET', '/file/preview/{id}', '文件上传', b'0', b'0', '文件上传 预览文件', 1399985191002447872, '2022-06-04 18:45:09.632000', 1399985191002447872, '2022-06-04 18:46:13.683000', b'0', 1);
INSERT INTO `iam_perm_path` VALUES (1533037133067894785, 'DatabaseTableController#findColumnByTableName', '获取数据表行信息', 'GET', '/gen/table/findColumnByTableName', '数据库表信息', b'1', b'1', '数据库表信息 获取数据表行信息', 1399985191002447872, '2022-06-04 18:45:09.632000', 1399985191002447872, '2022-06-04 18:45:09.632000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133067894786, 'LoginLogController#page', '分页', 'GET', '/log/login/page', '登录日志', b'1', b'1', '登录日志 分页', 1399985191002447872, '2022-06-04 18:45:09.632000', 1399985191002447872, '2022-06-04 18:45:09.632000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133067894787, 'CategoryController#findAll', '获取所有类目', 'GET', '/category/findAll', '类目管理', b'1', b'1', '类目管理 获取所有类目', 1399985191002447872, '2022-06-04 18:45:09.632000', 1399985191002447872, '2022-06-04 18:45:09.632000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133072089088, 'WalletLogController#pageByWalletId', '根据钱包id查询钱包日志(分页)', 'GET', '/wallet/log/pageByWalletId', '钱包日志相关的接口', b'1', b'1', '钱包日志相关的接口 根据钱包id查询钱包日志(分页)', 1399985191002447872, '2022-06-04 18:45:09.633000', 1399985191002447872, '2022-06-04 18:45:09.633000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133072089089, 'CategoryParameterGroupController#page', '分页查询', 'GET', '/categoryParameterGroup/page', '类目参数组', b'1', b'1', '类目参数组 分页查询', 1399985191002447872, '2022-06-04 18:45:09.633000', 1399985191002447872, '2022-06-04 18:45:09.633000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133072089090, 'RoleController#page', '分页查询角色', 'GET', '/role/page', '角色管理', b'1', b'1', '角色管理 分页查询角色', 1399985191002447872, '2022-06-04 18:45:09.633000', 1399985191002447872, '2022-06-04 18:45:09.633000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133072089091, 'WeChatPayConfigController#add', '添加微信支付配置', 'POST', '/wechat/pay/add', '微信支付', b'1', b'1', '微信支付 添加微信支付配置', 1399985191002447872, '2022-06-04 18:45:09.633000', 1399985191002447872, '2022-06-04 18:45:09.633000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133076283392, 'UserSocialLoginController#findById', '获取详情', 'POST', '/user/social/findById', '用户三方登录管理', b'1', b'1', '用户三方登录管理 获取详情', 1399985191002447872, '2022-06-04 18:45:09.634000', 1399985191002447872, '2022-06-04 18:45:09.634000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133076283393, 'DictionaryItemController#add', '添加字典项（返回字典项对象）', 'POST', '/dict/item/add', '字典项', b'1', b'1', '字典项 添加字典项（返回字典项对象）', 1399985191002447872, '2022-06-04 18:45:09.634000', 1399985191002447872, '2022-06-04 18:45:09.634000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133076283394, 'PaymentController#superPage', '分页查询(超级查询)', 'POST', '/payment/superPage', '支付记录', b'1', b'1', '支付记录 分页查询(超级查询)', 1399985191002447872, '2022-06-04 18:45:09.634000', 1399985191002447872, '2022-06-04 18:45:09.634000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133076283395, 'MessageQueueDemoController#sendMqttMsg', '发送MQTT消息', 'POST', '/demo/mq/sendMqttMsg', '测试消息队列', b'1', b'1', '测试消息队列 发送MQTT消息', 1399985191002447872, '2022-06-04 18:45:09.635000', 1399985191002447872, '2022-06-04 18:45:09.635000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133080477696, 'WalletController#lock', '锁定钱包', 'POST', '/wallet/lock', '钱包相关的接口', b'1', b'1', '钱包相关的接口 锁定钱包', 1399985191002447872, '2022-06-04 18:45:09.635000', 1399985191002447872, '2022-06-04 18:45:09.635000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133080477697, 'VoucherController#page', '分页', 'GET', '/voucher/page', '储值卡', b'1', b'1', '储值卡 分页', 1399985191002447872, '2022-06-04 18:45:09.635000', 1399985191002447872, '2022-06-04 18:45:09.635000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133080477698, 'UserAdminController#restartPassword', '重置密码', 'POST', '/user/admin/restartPassword', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 重置密码', 1399985191002447872, '2022-06-04 18:45:09.635000', 1399985191002447872, '2022-06-04 18:45:09.635000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133080477699, 'DingTalkConfigController#page', '分页', 'GET', '/ding/config/page', '钉钉配置', b'1', b'1', '钉钉配置 分页', 1399985191002447872, '2022-06-04 18:45:09.635000', 1399985191002447872, '2022-06-04 18:45:09.635000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133084672000, 'VoucherController#unlock', '启用', 'POST', '/voucher/unlock', '储值卡', b'1', b'1', '储值卡 启用', 1399985191002447872, '2022-06-04 18:45:09.636000', 1399985191002447872, '2022-06-04 18:45:09.636000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133084672001, 'OrderFindController#page', '订单列表 分页', 'GET', '/order/page', '订单查询', b'1', b'1', '订单查询 订单列表 分页', 1399985191002447872, '2022-06-04 18:45:09.636000', 1399985191002447872, '2022-06-04 18:45:09.636000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133084672002, 'UserAdminController#unlock', '解锁用户', 'POST', '/user/admin/unlock', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 解锁用户', 1399985191002447872, '2022-06-04 18:45:09.636000', 1399985191002447872, '2022-06-04 18:45:09.636000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133088866304, 'MessageQueueDemoController#sendRedisMsg', '发送RedisMq消息', 'POST', '/demo/mq/sendRedisMsg', '测试消息队列', b'1', b'1', '测试消息队列 发送RedisMq消息', 1399985191002447872, '2022-06-04 18:45:09.637000', 1399985191002447872, '2022-06-04 18:45:09.637000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133088866305, 'DictionaryItemController#findById', '根据字典项ID查询', 'GET', '/dict/item/findById', '字典项', b'1', b'1', '字典项 根据字典项ID查询', 1399985191002447872, '2022-06-04 18:45:09.637000', 1399985191002447872, '2022-06-04 18:45:09.637000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133088866306, 'GoodsController#findAll', '查询全部', 'GET', '/goods/findAll', '商品管理', b'1', b'1', '商品管理 查询全部', 1399985191002447872, '2022-06-04 18:45:09.637000', 1399985191002447872, '2022-06-04 18:45:09.637000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133088866307, 'WeChatPayConfigController#findPayWayList', '微信支持支付方式', 'GET', '/wechat/pay/findPayWayList', '微信支付', b'1', b'1', '微信支付 微信支持支付方式', 1399985191002447872, '2022-06-04 18:45:09.637000', 1399985191002447872, '2022-06-04 18:45:09.637000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133093060608, 'DataScopeController#existsByName', '名称是否被使用(不包含自己)', 'GET', '/data/scope/existsByNameNotId', '数据范围权限配置', b'1', b'1', '数据范围权限配置 名称是否被使用(不包含自己)', 1399985191002447872, '2022-06-04 18:45:09.638000', 1399985191002447872, '2022-06-04 18:45:09.638000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133093060609, 'CashierController#singlePay', '发起支付(单渠道)', 'POST', '/cashier/singlePay', '结算台', b'1', b'1', '结算台 发起支付(单渠道)', 1399985191002447872, '2022-06-04 18:45:09.638000', 1399985191002447872, '2022-06-04 18:45:09.638000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133093060610, 'QuartzJobController#findById', '单条', 'GET', '/quartz/findById', '定时任务', b'1', b'1', '定时任务 单条', 1399985191002447872, '2022-06-04 18:45:09.638000', 1399985191002447872, '2022-06-04 18:45:09.638000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133093060611, 'DataVersionLogController#page', '分页', 'GET', '/log/dataVersion/page', '数据版本日志', b'1', b'1', '数据版本日志 分页', 1399985191002447872, '2022-06-04 18:45:09.638000', 1399985191002447872, '2022-06-04 18:45:09.638000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133097254912, 'DictionaryItemController#pageByDictionaryId', '分页查询指定字典下的字典项', 'GET', '/dict/item/pageByDictionaryId', '字典项', b'1', b'1', '字典项 分页查询指定字典下的字典项', 1399985191002447872, '2022-06-04 18:45:09.639000', 1399985191002447872, '2022-06-04 18:45:09.639000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133097254913, 'FIleUpLoadController#getFilePreviewUrlPrefix', '获取文件预览地址前缀', 'GET', '/file/getFilePreviewUrlPrefix', '文件上传', b'0', b'0', '文件上传 获取文件预览地址前缀', 1399985191002447872, '2022-06-04 18:45:09.639000', 1399985191002447872, '2022-06-04 18:46:20.486000', b'0', 1);
INSERT INTO `iam_perm_path` VALUES (1533037133097254914, 'DictionaryItemController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/dict/item/existsByCodeNotId', '字典项', b'1', b'1', '字典项 编码是否被使用(不包含自己)', 1399985191002447872, '2022-06-04 18:45:09.639000', 1399985191002447872, '2022-06-04 18:45:09.639000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133097254915, 'UserInfoController#getUserSecurityInfo', '查询用户安全信息', 'GET', '/user/getUserSecurityInfo', '用户管理', b'1', b'1', '用户管理 查询用户安全信息', 1399985191002447872, '2022-06-04 18:45:09.639000', 1399985191002447872, '2022-06-04 18:45:09.639000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133101449216, 'DictionaryItemController#delete', '删除字典项', 'DELETE', '/dict/item/delete', '字典项', b'1', b'1', '字典项 删除字典项', 1399985191002447872, '2022-06-04 18:45:09.640000', 1399985191002447872, '2022-06-04 18:45:09.640000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133101449217, 'PermMenuController#resourceList', '资源列表', 'GET', '/perm/menu/resourceList', '菜单权限资源', b'1', b'1', '菜单权限资源 资源列表', 1399985191002447872, '2022-06-04 18:45:09.640000', 1399985191002447872, '2022-06-04 18:45:09.640000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133101449218, 'DatabaseTableController#page', '表列表分页', 'GET', '/gen/table/page', '数据库表信息', b'1', b'1', '数据库表信息 表列表分页', 1399985191002447872, '2022-06-04 18:45:09.640000', 1399985191002447872, '2022-06-04 18:45:09.640000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133101449219, 'DictionaryController#add', '添加', 'POST', '/dict/add', '字典', b'1', b'1', '字典 添加', 1399985191002447872, '2022-06-04 18:45:09.640000', 1399985191002447872, '2022-06-04 18:45:09.640000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133105643520, 'WalletController#unlock', '解锁钱包', 'POST', '/wallet/unlock', '钱包相关的接口', b'1', b'1', '钱包相关的接口 解锁钱包', 1399985191002447872, '2022-06-04 18:45:09.641000', 1399985191002447872, '2022-06-04 18:45:09.641000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133109837824, 'QuartzJobController#add', '添加', 'POST', '/quartz/add', '定时任务', b'1', b'1', '定时任务 添加', 1399985191002447872, '2022-06-04 18:45:09.642000', 1399985191002447872, '2022-06-04 18:45:09.642000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133109837825, 'DataScopeController#findUsersByDataScopeId', '获取关联的用户列表', 'GET', '/data/scope/findUsersByDataScopeId', '数据范围权限配置', b'1', b'1', '数据范围权限配置 获取关联的用户列表', 1399985191002447872, '2022-06-04 18:45:09.642000', 1399985191002447872, '2022-06-04 18:45:09.642000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133109837826, 'DataScopeController#update', '更新', 'POST', '/data/scope/update', '数据范围权限配置', b'1', b'1', '数据范围权限配置 更新', 1399985191002447872, '2022-06-04 18:45:09.642000', 1399985191002447872, '2022-06-04 18:45:09.642000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133109837827, 'SpecificationController#findById', '通过ID查询', 'GET', '/specification/findById', '规格', b'1', b'1', '规格 通过ID查询', 1399985191002447872, '2022-06-04 18:45:09.642000', 1399985191002447872, '2022-06-04 18:45:09.642000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133114032128, 'OnlineUserController#findBySessionId', '获取单条', 'GET', '/user/online/findBySessionId', '在线用户', b'1', b'1', '在线用户 获取单条', 1399985191002447872, '2022-06-04 18:45:09.643000', 1399985191002447872, '2022-06-04 18:45:09.643000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133114032129, 'CategoryController#delete', '通过 id 删除类目', 'DELETE', '/category/delete', '类目管理', b'1', b'1', '类目管理 通过 id 删除类目', 1399985191002447872, '2022-06-04 18:45:09.643000', 1399985191002447872, '2022-06-04 18:45:09.643000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133114032130, 'TestController#sequence', '序列生成器', 'GET', '/test/sequence', '测试控制器', b'1', b'1', '测试控制器 发号器', 1399985191002447872, '2022-06-04 18:45:09.643000', 1399985191002447872, '2022-06-04 18:45:09.643000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133118226432, 'VoucherController#lockBatch', '批量冻结', 'POST', '/voucher/lockBatch', '储值卡', b'1', b'1', '储值卡 批量冻结', 1399985191002447872, '2022-06-04 18:45:09.644000', 1399985191002447872, '2022-06-04 18:45:09.644000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133118226433, 'CategoryParameterGroupController#findAll', '查询所有', 'GET', '/categoryParameterGroup/findAll', '类目参数组', b'1', b'1', '类目参数组 查询所有', 1399985191002447872, '2022-06-04 18:45:09.644000', 1399985191002447872, '2022-06-04 18:45:09.644000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133118226434, 'CodeGeneratorController#genCodeZip', '下载生成代码', 'POST', '/gen/code/genCodeZip', '代码生成', b'1', b'1', '代码生成 下载生成代码', 1399985191002447872, '2022-06-04 18:45:09.644000', 1399985191002447872, '2022-06-04 18:45:09.644000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133118226435, 'DictionaryItemController#findByDictionaryId', '查询指定字典ID下的所有字典项', 'GET', '/dict/item/findByDictionaryId', '字典项', b'1', b'1', '字典项 查询指定字典ID下的所有字典项', 1399985191002447872, '2022-06-04 18:45:09.644000', 1399985191002447872, '2022-06-04 18:45:09.644000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133122420736, 'OrderFindController#findPayTimeoutOrderIdsByType', '获取指定类型超时订单的id集合', 'GET', '/order/findPayTimeoutOrderIdsByType', '订单查询', b'1', b'1', '订单查询 获取指定类型超时订单的id集合', 1399985191002447872, '2022-06-04 18:45:09.645000', 1399985191002447872, '2022-06-04 18:45:09.645000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133122420737, 'UserAdminController#add', '添加用户', 'POST', '/user/admin/add', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 添加用户', 1399985191002447872, '2022-06-04 18:45:09.645000', 1399985191002447872, '2022-06-04 18:45:09.645000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133122420738, 'DictionaryController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/dict/existsByCodeNotId', '字典', b'1', b'1', '字典 编码是否被使用(不包含自己)', 1399985191002447872, '2022-06-04 18:45:09.645000', 1399985191002447872, '2022-06-04 18:45:09.645000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133122420739, 'DeptController#findById', '获取', 'GET', '/dept/findById', '部门管理', b'1', b'1', '部门管理 获取', 1399985191002447872, '2022-06-04 18:45:09.645000', 1399985191002447872, '2022-06-04 18:45:09.645000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133126615040, 'VoucherController#generationBatch', '批量生成储值卡', 'POST', '/voucher/generationBatch', '储值卡', b'1', b'1', '储值卡 批量生成储值卡', 1399985191002447872, '2022-06-04 18:45:09.646000', 1399985191002447872, '2022-06-04 18:45:09.646000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133126615041, 'UserDataScopeController#findDataScopeIdsByUser', '根据用户ID获取到部门id集合', 'GET', '/user/data/scope/findIdsByUser', '用户数据权限配置', b'1', b'1', '用户数据权限配置 根据用户ID获取到部门id集合', 1399985191002447872, '2022-06-04 18:45:09.646000', 1399985191002447872, '2022-06-04 18:45:09.646000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133126615042, 'VoucherController#unlockBatch', '批量启用', 'POST', '/voucher/unlockBatch', '储值卡', b'1', b'1', '储值卡 批量启用', 1399985191002447872, '2022-06-04 18:45:09.646000', 1399985191002447872, '2022-06-04 18:45:09.646000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133130809344, 'AlipayConfigController#page', '分页', 'GET', '/alipay/page', '支付宝配置', b'1', b'1', '支付宝配置 分页', 1399985191002447872, '2022-06-04 18:45:09.647000', 1399985191002447872, '2022-06-04 18:45:09.647000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133130809345, 'PermPathController#page', '权限分页', 'GET', '/perm/path/page', '请求权限资源', b'1', b'1', '请求权限资源 权限分页', 1399985191002447872, '2022-06-04 18:45:09.647000', 1399985191002447872, '2022-06-04 18:45:09.647000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133130809346, 'DictionaryController#existsByCode', '编码是否被使用', 'GET', '/dict/existsByCode', '字典', b'1', b'1', '字典 编码是否被使用', 1399985191002447872, '2022-06-04 18:45:09.647000', 1399985191002447872, '2022-06-04 18:45:09.647000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133135003648, 'QuartzJobController#update', '更新', 'POST', '/quartz/update', '定时任务', b'1', b'1', '定时任务 更新', 1399985191002447872, '2022-06-04 18:45:09.648000', 1399985191002447872, '2022-06-04 18:45:09.648000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133135003649, 'DingAccessController#genThirdLoginUrl', '生成第三方登录网址', 'GET', '/ding/access/genThirdLoginUrl', '钉钉Access', b'1', b'1', '钉钉Access 生成第三方登录网址', 1399985191002447872, '2022-06-04 18:45:09.648000', 1399985191002447872, '2022-06-04 18:45:09.648000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133135003650, 'ActivityController#findAll', '查询活动', 'GET', '/activity/findAll', '活动', b'1', b'1', '活动 查询活动', 1399985191002447872, '2022-06-04 18:45:09.648000', 1399985191002447872, '2022-06-04 18:45:09.648000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133135003651, 'UserInfoController#getUserBaseInfo', '查询用户基础信息', 'GET', '/user/getUserBaseInfo', '用户管理', b'1', b'1', '用户管理 查询用户基础信息', 1399985191002447872, '2022-06-04 18:45:09.648000', 1399985191002447872, '2022-06-04 18:45:09.648000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133139197952, 'MessageQueueDemoController#sendKeyExpired', '创建15秒后过期的事件', 'POST', '/demo/mq/sendKeyExpired', '测试消息队列', b'1', b'1', '测试消息队列 创建15秒后过期的事件', 1399985191002447872, '2022-06-04 18:45:09.649000', 1399985191002447872, '2022-06-04 18:45:09.649000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133139197953, 'OrderPreviewController#previewOrderPrice', '预览价格(手动)', 'POST', '/order/preview/previewOrderPrice', '订单计算', b'1', b'1', '订单计算 预览价格(手动)', 1399985191002447872, '2022-06-04 18:45:09.649000', 1399985191002447872, '2022-06-04 18:45:09.649000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133139197954, 'WalletLogController#pageByPersonal', '个人钱包日志', 'POST', '/wallet/log/pageByPersonal', '钱包日志相关的接口', b'1', b'1', '钱包日志相关的接口 个人钱包日志', 1399985191002447872, '2022-06-04 18:45:09.649000', 1399985191002447872, '2022-06-04 18:45:09.649000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133143392256, 'PermMenuController#delete', '删除', 'DELETE', '/perm/menu/delete', '菜单权限资源', b'1', b'1', '菜单权限资源 删除', 1399985191002447872, '2022-06-04 18:45:09.650000', 1399985191002447872, '2022-06-04 18:45:09.650000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133143392257, 'CategoryParameterController#add', '添加', 'POST', '/categoryParameter/add', '类目参数', b'1', b'1', '类目参数 添加', 1399985191002447872, '2022-06-04 18:45:09.650000', 1399985191002447872, '2022-06-04 18:45:09.650000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133143392258, 'PermPathController#update', '更新权限', 'POST', '/perm/path/update', '请求权限资源', b'1', b'1', '请求权限资源 更新权限', 1399985191002447872, '2022-06-04 18:45:09.650000', 1399985191002447872, '2022-06-04 18:45:09.650000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133147586560, 'BrandController#delete', '删除', 'DELETE', '/brand/delete', '品牌', b'1', b'1', '品牌 删除', 1399985191002447872, '2022-06-04 18:45:09.651000', 1399985191002447872, '2022-06-04 18:45:09.651000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133147586561, 'DingTalkConfigController#update', '修改配置', 'POST', '/ding/config/update', '钉钉配置', b'1', b'1', '钉钉配置 修改配置', 1399985191002447872, '2022-06-04 18:45:09.651000', 1399985191002447872, '2022-06-04 18:45:09.651000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133147586562, 'OrderFindController#getWholeById', '获取完整订单详情', 'GET', '/order/getWholeById', '订单查询', b'1', b'1', '订单查询 获取完整订单详情', 1399985191002447872, '2022-06-04 18:45:09.651000', 1399985191002447872, '2022-06-04 18:45:09.651000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133147586563, 'SystemParamController#existsByKeyNotId', '判断编码是否存在(不包含自己)', 'GET', '/system/param/existsByKeyNotId', '系统参数', b'1', b'1', '系统参数 判断编码是否存在(不包含自己)', 1399985191002447872, '2022-06-04 18:45:09.651000', 1399985191002447872, '2022-06-04 18:45:09.651000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133151780864, 'CashierController#aggregatePay', '扫码聚合支付(单渠道)', 'GET', '/cashier/aggregatePay', '结算台', b'1', b'1', '结算台 扫码聚合支付(单渠道)', 1399985191002447872, '2022-06-04 18:45:09.652000', 1399985191002447872, '2022-06-04 18:45:09.652000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133151780865, 'RoleController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/role/existsByCodeNotId', '角色管理', b'1', b'1', '角色管理 编码是否被使用(不包含自己)', 1399985191002447872, '2022-06-04 18:45:09.652000', 1399985191002447872, '2022-06-04 18:45:09.652000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133151780866, 'ClientController#findAllByAlonePrem', '查询有独立菜单和权限的终端列表', 'GET', '/client/findAllByAlonePrem', '终端管理', b'1', b'1', '终端管理 查询有独立菜单和权限的终端列表', 1399985191002447872, '2022-06-04 18:45:09.652000', 1399985191002447872, '2022-06-04 18:45:09.652000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133151780867, 'RoleController#existsByName', '名称是否被使用', 'GET', '/role/existsByName', '角色管理', b'1', b'1', '角色管理 名称是否被使用', 1399985191002447872, '2022-06-04 18:45:09.652000', 1399985191002447872, '2022-06-04 18:45:09.652000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133155975168, 'RoleController#findById', '通过ID查询角色', 'GET', '/role/findById', '角色管理', b'1', b'1', '角色管理 通过ID查询角色', 1399985191002447872, '2022-06-04 18:45:09.653000', 1399985191002447872, '2022-06-04 18:45:09.653000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133155975169, 'AppVersionController#findById', '查询详情', 'POST', '/app/version/findById', 'app版本管理', b'1', b'1', 'app版本管理 查询详情', 1399985191002447872, '2022-06-04 18:45:09.653000', 1399985191002447872, '2022-06-04 18:45:09.653000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133155975170, 'PayCallbackController#aliPay', '支付宝回调', 'POST', '/pay/callback/aliPay', '支付回调', b'1', b'1', '支付回调 支付宝回调', 1399985191002447872, '2022-06-04 18:45:09.653000', 1399985191002447872, '2022-06-04 18:45:09.653000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133155975171, 'QuartzJobController#execute', '立即执行', 'POST', '/quartz/execute', '定时任务', b'1', b'1', '定时任务 立即执行', 1399985191002447872, '2022-06-04 18:45:09.653000', 1399985191002447872, '2022-06-04 18:45:09.653000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133155975172, 'CouponTemplateController#findAll', '查询优惠券模板', 'POST', '/coupon/template/findAll', '优惠券模板', b'1', b'1', '优惠券模板 查询优惠券模板', 1399985191002447872, '2022-06-04 18:45:09.653000', 1399985191002447872, '2022-06-04 18:45:09.653000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133160169472, 'WeChatPayConfigController#page', '分页', 'GET', '/wechat/pay/page', '微信支付', b'1', b'1', '微信支付 分页', 1399985191002447872, '2022-06-04 18:45:09.654000', 1399985191002447872, '2022-06-04 18:45:09.654000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133160169473, 'TokenEndpoint#logout', '退出', 'POST', '/token/logout', '认证相关', b'1', b'1', '认证相关 退出', 1399985191002447872, '2022-06-04 18:45:09.654000', 1399985191002447872, '2022-06-04 18:45:09.654000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133160169474, 'DeptController#update', '更新', 'POST', '/dept/update', '部门管理', b'1', b'1', '部门管理 更新', 1399985191002447872, '2022-06-04 18:45:09.654000', 1399985191002447872, '2022-06-04 18:45:09.654000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133160169475, 'FIleUpLoadController#getFileDownloadUrl', '获取文件下载地址', 'GET', '/file/getFileDownloadUrl', '文件上传', b'0', b'0', '文件上传 获取文件下载地址', 1399985191002447872, '2022-06-04 18:45:09.654000', 1399985191002447872, '2022-06-04 18:46:24.445000', b'0', 1);
INSERT INTO `iam_perm_path` VALUES (1533037133160169476, 'DataEncryptDemoController#update', '修改', 'POST', '/demo/data/encrypt/update', '数据加密解密演示', b'1', b'1', '数据加密解密演示 修改', 1399985191002447872, '2022-06-04 18:45:09.654000', 1399985191002447872, '2022-06-04 18:45:09.654000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133164363776, 'CouponController#lockById', '锁定优惠券', 'POST', '/coupon/lockById', '优惠券', b'1', b'1', '优惠券 锁定优惠券', 1399985191002447872, '2022-06-04 18:45:09.655000', 1399985191002447872, '2022-06-04 18:45:09.655000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133164363777, 'ClientController#update', '修改终端（返回终端对象）', 'POST', '/client/update', '终端管理', b'1', b'1', '终端管理 修改终端（返回终端对象）', 1399985191002447872, '2022-06-04 18:45:09.655000', 1399985191002447872, '2022-06-04 18:45:09.655000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133164363778, 'BrandController#findById', '通过ID查询', 'GET', '/brand/findById', '品牌', b'1', b'1', '品牌 通过ID查询', 1399985191002447872, '2022-06-04 18:45:09.655000', 1399985191002447872, '2022-06-04 18:45:09.655000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133164363779, 'WeChatPayConfigController#findById', '根据Id查询', 'GET', '/wechat/pay/findById', '微信支付', b'1', b'1', '微信支付 根据Id查询', 1399985191002447872, '2022-06-04 18:45:09.655000', 1399985191002447872, '2022-06-04 18:45:09.655000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133168558080, 'UserRoleController#findRoleIdsByUser', '根据用户ID获取到角色id集合', 'GET', '/user/role/findRoleIdsByUser', '用户角色管理', b'1', b'1', '用户角色管理 根据用户ID获取到角色id集合', 1399985191002447872, '2022-06-04 18:45:09.656000', 1399985191002447872, '2022-06-04 18:45:09.656000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1533037133168558081, 'SpecificationController#delete', '删除', 'DELETE', '/specification/delete', '规格', b'1', b'1', '规格 删除', 1399985191002447872, '2022-06-04 18:45:09.656000', 1399985191002447872, '2022-06-04 18:45:09.656000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534396720414330880, 'TestController#validation', '校验测试', 'GET', '/test/validation', '测试控制器', b'1', b'1', '测试控制器 校验测试', 1399985191002447872, '2022-06-08 12:47:40.516000', 1399985191002447872, '2022-06-08 12:47:40.516000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534396720414330881, 'UserRoleController#saveAssign', '给用户分配角色', 'POST', '/user/role/saveAssign', '用户角色管理', b'1', b'1', '用户角色管理 给用户分配角色', 1399985191002447872, '2022-06-08 12:47:40.516000', 1399985191002447872, '2022-06-08 12:47:40.516000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534396720414330882, 'UserAdminController#lockBatch', '批量锁定用户', 'POST', '/user/admin/lockBatch', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 批量锁定用户', 1399985191002447872, '2022-06-08 12:47:40.516000', 1399985191002447872, '2022-06-08 12:47:40.516000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534396720414330883, 'UserDataScopeController#saveAssignBatch', '给用户分配权限(批量)', 'POST', '/user/data/scope/saveAssignBatch', '用户数据权限配置', b'1', b'1', '用户数据权限配置 给用户分配权限(批量)', 1399985191002447872, '2022-06-08 12:47:40.516000', 1399985191002447872, '2022-06-08 12:47:40.516000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534396720414330884, 'UserDeptController#saveAssign', '给用户分配部门', 'POST', '/user/dept/saveAssign', '用户部门关联关系', b'1', b'1', '用户部门关联关系 给用户分配部门', 1399985191002447872, '2022-06-08 12:47:40.516000', 1399985191002447872, '2022-06-08 12:47:40.516000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534396720414330885, 'PermPathController#batchUpdateEnable', '批量更新状态', 'POST', '/perm/path/batchUpdateEnable', '请求权限资源', b'1', b'1', '请求权限资源 批量更新状态', 1399985191002447872, '2022-06-08 12:47:40.516000', 1399985191002447872, '2022-06-08 12:47:40.516000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534396720414330886, 'UserAdminController#unlockBatch', '批量解锁用户', 'POST', '/user/admin/unlockBatch', '管理用户(管理员级别)', b'1', b'1', '管理用户(管理员级别) 批量解锁用户', 1399985191002447872, '2022-06-08 12:47:40.516000', 1399985191002447872, '2022-06-08 12:47:40.516000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534396720414330887, 'UserDeptController#saveAssignBatch', '给用户分配部门(批量)', 'POST', '/user/dept/saveAssignBatch', '用户部门关联关系', b'1', b'1', '用户部门关联关系 给用户分配部门(批量)', 1399985191002447872, '2022-06-08 12:47:40.516000', 1399985191002447872, '2022-06-08 12:47:40.516000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534396720414330888, 'UserRoleController#saveAssignBatch', '给用户分配角色(批量)', 'POST', '/user/role/saveAssignBatch', '用户角色管理', b'1', b'1', '用户角色管理 给用户分配角色(批量)', 1399985191002447872, '2022-06-08 12:47:40.516000', 1399985191002447872, '2022-06-08 12:47:40.516000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534396720414330889, 'PlumeLogMainController#getRunModel', 'getRunModel', 'GET', '/plumelog/getRunModel', 'PlumeLogMainController', b'1', b'1', 'PlumeLogMainController getRunModel', 1399985191002447872, '2022-06-08 12:47:40.516000', 1399985191002447872, '2022-06-08 12:47:40.516000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307008, 'MessageTemplateController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/message/template/existsByCodeNotId', '消息模板', b'1', b'1', '消息模板 编码是否被使用(不包含自己)', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307009, 'PermPathController#deleteBatch', '批量删除', 'DELETE', '/perm/path/deleteBatch', '请求权限资源', b'1', b'1', '请求权限资源 批量删除', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307010, 'MessageTemplateController#rendering', '渲染模板', 'GET', '/message/template/rendering', '消息模板', b'1', b'1', '消息模板 渲染模板', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307011, 'SiteMessageController#send', '发送站内信', 'POST', '/site/message/send', '站内信', b'1', b'1', '站内信 发送站内信', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307012, 'SiteMessageController#read', '标为已读', 'POST', '/site/message/read', '站内信', b'1', b'1', '站内信 标为已读', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307013, 'MailSendController#sentSimpleMail', '发送简单邮件', 'POST', '/mail/send/sentSimpleMail', '邮件发送', b'1', b'1', '邮件发送 发送简单邮件', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307014, 'SiteMessageController#page', '消息分页', 'GET', '/site/message/page', '站内信', b'1', b'1', '站内信 消息分页', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307015, 'MailConfigController#existsByCode', '编码是否被使用', 'GET', '/mail/config/existsByCode', '邮箱配置', b'1', b'1', '邮箱配置 编码是否被使用', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307016, 'SiteMessageController#getSenderCount', '获取发送消息条数', 'GET', '/site/message/getSenderCount', '站内信', b'1', b'1', '站内信 获取发送消息条数', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307017, 'MailConfigController#setUpActivity', '设置启用的邮箱配置', 'POST', '/mail/config/setUpActivity', '邮箱配置', b'1', b'1', '邮箱配置 设置启用的邮箱配置', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307018, 'MessageTemplateController#add', '添加', 'POST', '/message/template/add', '消息模板', b'1', b'1', '消息模板 添加', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307019, 'MailConfigController#page', '分页', 'GET', '/mail/config/page', '邮箱配置', b'1', b'1', '邮箱配置 分页', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307020, 'MailConfigController#existsByCode', '编码是否被使用(不包含自己)', 'GET', '/mail/config/existsByCodeNotId', '邮箱配置', b'1', b'1', '邮箱配置 编码是否被使用(不包含自己)', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307021, 'MailConfigController#findAll', '获取所有邮箱配置', 'GET', '/mail/config/findAll', '邮箱配置', b'1', b'1', '邮箱配置 获取所有邮箱配置', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307022, 'MailConfigController#findById', '通过 id 获取指定邮箱配置', 'GET', '/mail/config/findById', '邮箱配置', b'1', b'1', '邮箱配置 通过 id 获取指定邮箱配置', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307023, 'MessageTemplateController#delete', '删除', 'DELETE', '/message/template/delete', '消息模板', b'1', b'1', '消息模板 删除', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307024, 'NcDemoController#sendMsg', '消息发送测试', 'GET', '/nc/test/sendMsg', 'nc测试', b'1', b'1', 'nc测试 消息发送测试', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307025, 'SiteMessageController#findById', '消息详情', 'GET', '/site/message/findById', '站内信', b'1', b'1', '站内信 消息详情', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307026, 'MailConfigController#updateMailConfig', '更新邮箱配置', 'POST', '/mail/config/update', '邮箱配置', b'1', b'1', '邮箱配置 更新邮箱配置', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307027, 'MailConfigController#add', '增加新邮箱配置', 'POST', '/mail/config/add', '邮箱配置', b'1', b'1', '邮箱配置 增加新邮箱配置', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307028, 'MailConfigController#delete', '删除', 'DELETE', '/mail/config/delete', '邮箱配置', b'1', b'1', '邮箱配置 删除', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307029, 'MessageTemplateController#existsByCode', '编码是否被使用', 'GET', '/message/template/existsByCode', '消息模板', b'1', b'1', '消息模板 编码是否被使用', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307030, 'MessageTemplateController#page', '分页', 'GET', '/message/template/page', '消息模板', b'1', b'1', '消息模板 分页', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307031, 'SiteMessageController#pageByReceive', '接收消息分页', 'GET', '/site/message/pageByReceive', '站内信', b'1', b'1', '站内信 接收消息分页', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307032, 'SiteMessageController#getReceiveCount', '获取接收消息条数', 'GET', '/site/message/getReceiveCount', '站内信', b'1', b'1', '站内信 获取接收消息条数', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307033, 'MailSendController#sendMail', '发送邮件', 'POST', '/mail/send/sendMail', '邮件发送', b'1', b'1', '邮件发送 发送邮件', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307034, 'SiteMessageController#pageBySender', '发送消息分页', 'GET', '/site/message/pageBySender', '站内信', b'1', b'1', '站内信 发送消息分页', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307035, 'MessageTemplateController#update', '更新', 'POST', '/message/template/update', '消息模板', b'1', b'1', '消息模板 更新', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534778144875307036, 'MessageTemplateController#findById', '获取详情', 'GET', '/message/template/findById', '消息模板', b'1', b'1', '消息模板 获取详情', 1399985191002447872, '2022-06-09 14:03:19.194000', 1399985191002447872, '2022-06-09 14:03:19.194000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1534816201016037376, 'TestController#userNotice', '用户全局ws消息通知测试', 'GET', '/test/userNotice', '测试控制器', b'1', b'1', '测试控制器 用户全局ws消息通知测试', 1399985191002447872, '2022-06-09 16:34:32.485000', 1399985191002447872, '2022-06-09 16:34:32.486000', b'0', 0);
INSERT INTO `iam_perm_path` VALUES (1535126126934061056, 'GlobalWebsocketDemoController#send', '发送消息', 'POST', '/demo/global/ws/send', '全局websocket通知demo', b'1', b'1', '全局websocket通知demo 发送消息', 1399985191002447872, '2022-06-10 13:06:04.582000', 1399985191002447872, '2022-06-10 13:06:04.582000', b'0', 0);

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
INSERT INTO `iam_role` VALUES (1422832797731778562, 'user', '用户', b'0', '用户角色', 0, '2021-08-04 16:12:29', 1399985191002447872, '2021-08-04 16:15:03', 7, 1);
INSERT INTO `iam_role` VALUES (1428891259564445696, 'manager', '管理者', b'0', 'manager管理者', 1399985191002447872, '2021-08-21 09:26:38', 1399985191002447872, '2021-08-21 09:26:39', 0, 1);

-- ----------------------------
-- Table structure for iam_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `iam_role_menu`;
CREATE TABLE `iam_role_menu`  (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `client_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '终端code',
  `permission_id` bigint(20) NOT NULL COMMENT '菜单权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_role_menu
-- ----------------------------
INSERT INTO `iam_role_menu` VALUES (1533038290578358272, 1405414804771971072, 'admin', 1414596052497092608);
INSERT INTO `iam_role_menu` VALUES (1533038290578358273, 1405414804771971072, 'admin', 1414596773275652096);
INSERT INTO `iam_role_menu` VALUES (1533038290578358274, 1405414804771971072, 'admin', 1431083330909208576);
INSERT INTO `iam_role_menu` VALUES (1533038290578358275, 1405414804771971072, 'admin', 1452567897717321728);
INSERT INTO `iam_role_menu` VALUES (1533038290578358276, 1405414804771971072, 'admin', 1435143678721236992);
INSERT INTO `iam_role_menu` VALUES (1533038290578358277, 1405414804771971072, 'admin', 1435476255797624832);
INSERT INTO `iam_role_menu` VALUES (1533038290578358278, 1405414804771971072, 'admin', 1480839877352476672);
INSERT INTO `iam_role_menu` VALUES (1533038290578358279, 1405414804771971072, 'admin', 1452569339987472384);
INSERT INTO `iam_role_menu` VALUES (1533038290578358280, 1405414804771971072, 'admin', 1414596805538238464);
INSERT INTO `iam_role_menu` VALUES (1533038290578358281, 1405414804771971072, 'admin', 1431089129232498688);
INSERT INTO `iam_role_menu` VALUES (1533038290578358282, 1405414804771971072, 'admin', 1474694545336676352);
INSERT INTO `iam_role_menu` VALUES (1533038290578358283, 1405414804771971072, 'admin', 1452569691537256448);
INSERT INTO `iam_role_menu` VALUES (1533038290578358284, 1405414804771971072, 'admin', 1414596647509446656);
INSERT INTO `iam_role_menu` VALUES (1533038290578358285, 1405414804771971072, 'admin', 1414596842322284544);
INSERT INTO `iam_role_menu` VALUES (1533038290578358286, 1405414804771971072, 'admin', 1431082258161434624);
INSERT INTO `iam_role_menu` VALUES (1533038290578358287, 1405414804771971072, 'admin', 1450473063320526848);
INSERT INTO `iam_role_menu` VALUES (1533038290578358288, 1405414804771971072, 'admin', 1452571269199540224);
INSERT INTO `iam_role_menu` VALUES (1533038290578358289, 1405414804771971072, 'admin', 1414596877617352704);
INSERT INTO `iam_role_menu` VALUES (1533038290578358290, 1405414804771971072, 'admin', 1450803906215886848);
INSERT INTO `iam_role_menu` VALUES (1533038290578358291, 1405414804771971072, 'admin', 1452638905302966272);
INSERT INTO `iam_role_menu` VALUES (1533038290578358292, 1405414804771971072, 'admin', 1490984296616263680);
INSERT INTO `iam_role_menu` VALUES (1533038290578358293, 1405414804771971072, 'admin', 1495013564652429312);
INSERT INTO `iam_role_menu` VALUES (1533038290578358294, 1405414804771971072, 'admin', 1431152689832525824);
INSERT INTO `iam_role_menu` VALUES (1533038290578358295, 1405414804771971072, 'admin', 1431153358157348864);
INSERT INTO `iam_role_menu` VALUES (1533038290578358296, 1405414804771971072, 'admin', 1438061887002759168);
INSERT INTO `iam_role_menu` VALUES (1533038290578358297, 1405414804771971072, 'admin', 1438072357281542144);
INSERT INTO `iam_role_menu` VALUES (1533038290578358298, 1405414804771971072, 'admin', 1439196893514031104);
INSERT INTO `iam_role_menu` VALUES (1533038290578358299, 1405414804771971072, 'admin', 1440216178722050048);
INSERT INTO `iam_role_menu` VALUES (1533038290578358300, 1405414804771971072, 'admin', 1440216612211757056);
INSERT INTO `iam_role_menu` VALUES (1533038290578358301, 1405414804771971072, 'admin', 1450827660459458560);
INSERT INTO `iam_role_menu` VALUES (1533038290578358302, 1405414804771971072, 'admin', 1450819607680991232);
INSERT INTO `iam_role_menu` VALUES (1533038290578358303, 1405414804771971072, 'admin', 1450821723027881984);
INSERT INTO `iam_role_menu` VALUES (1533038290578358304, 1405414804771971072, 'admin', 1450821877831254016);
INSERT INTO `iam_role_menu` VALUES (1533038290578358305, 1405414804771971072, 'admin', 1450822511087271936);
INSERT INTO `iam_role_menu` VALUES (1533038290578358306, 1405414804771971072, 'admin', 1511266086400524288);
INSERT INTO `iam_role_menu` VALUES (1533038290578358307, 1405414804771971072, 'admin', 1450822842995130368);
INSERT INTO `iam_role_menu` VALUES (1533038290578358308, 1405414804771971072, 'admin', 1450825488577544192);
INSERT INTO `iam_role_menu` VALUES (1533038290578358309, 1405414804771971072, 'admin', 1501847310319972352);
INSERT INTO `iam_role_menu` VALUES (1533038290578358310, 1405414804771971072, 'admin', 1450823960236081152);
INSERT INTO `iam_role_menu` VALUES (1533038290578358311, 1405414804771971072, 'admin', 1450824117849636864);
INSERT INTO `iam_role_menu` VALUES (1533038290578358312, 1405414804771971072, 'admin', 1450824319868289024);
INSERT INTO `iam_role_menu` VALUES (1533038290578358313, 1405414804771971072, 'admin', 1450824637876224000);
INSERT INTO `iam_role_menu` VALUES (1533038290578358314, 1405414804771971072, 'admin', 1450824875198332928);
INSERT INTO `iam_role_menu` VALUES (1533038290578358315, 1405414804771971072, 'admin', 1450825615857893376);
INSERT INTO `iam_role_menu` VALUES (1533038290578358316, 1405414804771971072, 'admin', 1450826890318135296);
INSERT INTO `iam_role_menu` VALUES (1533038290578358317, 1405414804771971072, 'admin', 1450827159626006528);
INSERT INTO `iam_role_menu` VALUES (1533038290578358318, 1405414804771971072, 'admin', 1450827308515409920);
INSERT INTO `iam_role_menu` VALUES (1533038290578358319, 1405414804771971072, 'admin', 1450825819436826624);
INSERT INTO `iam_role_menu` VALUES (1533038290578358320, 1405414804771971072, 'admin', 1501740492360962048);
INSERT INTO `iam_role_menu` VALUES (1533038290578358321, 1405414804771971072, 'admin', 1501742229142556672);
INSERT INTO `iam_role_menu` VALUES (1533038290578358322, 1405414804771971072, 'admin', 1501742417378725888);
INSERT INTO `iam_role_menu` VALUES (1533038290578358323, 1405414804771971072, 'admin', 1502926397176242176);
INSERT INTO `iam_role_menu` VALUES (1533038290578358324, 1405414804771971072, 'admin', 1523860792695283712);
INSERT INTO `iam_role_menu` VALUES (1533038290578358325, 1405414804771971072, 'admin', 1523941932282114048);
INSERT INTO `iam_role_menu` VALUES (1533038290578358326, 1405414804771971072, 'admin', 1523942130555252736);
INSERT INTO `iam_role_menu` VALUES (1533038290578358327, 1405414804771971072, 'admin', 1524044195818278912);
INSERT INTO `iam_role_menu` VALUES (1533038290578358328, 1405414804771971072, 'admin', 1524044395823665152);
INSERT INTO `iam_role_menu` VALUES (1533038290578358329, 1405414804771971072, 'admin', 1524044678314233856);
INSERT INTO `iam_role_menu` VALUES (1533038290578358330, 1405414804771971072, 'admin', 1525472571967860736);
INSERT INTO `iam_role_menu` VALUES (1533038290578358331, 1405414804771971072, 'admin', 1495968302034210816);
INSERT INTO `iam_role_menu` VALUES (1533038290578358332, 1405414804771971072, 'admin', 1495969099987963904);
INSERT INTO `iam_role_menu` VALUES (1533038290578358333, 1405414804771971072, 'admin', 1506910599819165696);
INSERT INTO `iam_role_menu` VALUES (1533038290578358334, 1405414804771971072, 'admin', 1506910885463851008);
INSERT INTO `iam_role_menu` VALUES (1533038290578358335, 1405414804771971072, 'admin', 1506911113394913280);
INSERT INTO `iam_role_menu` VALUES (1533038290578358336, 1405414804771971072, 'admin', 1496020308992143360);
INSERT INTO `iam_role_menu` VALUES (1533038290578358337, 1405414804771971072, 'admin', 1507998458886197248);
INSERT INTO `iam_role_menu` VALUES (1533038290578358338, 1405414804771971072, 'admin', 1509488473583562752);
INSERT INTO `iam_role_menu` VALUES (1533038290578358339, 1405414804771971072, 'admin', 1530120084482084864);
INSERT INTO `iam_role_menu` VALUES (1533038290578358340, 1405414804771971072, 'admin', 1414596052497092608);
INSERT INTO `iam_role_menu` VALUES (1533038290578358341, 1405414804771971072, 'admin', 1414596773275652096);
INSERT INTO `iam_role_menu` VALUES (1533038290578358342, 1405414804771971072, 'admin', 1431083330909208576);
INSERT INTO `iam_role_menu` VALUES (1533038290578358343, 1405414804771971072, 'admin', 1452567897717321728);
INSERT INTO `iam_role_menu` VALUES (1533038290578358344, 1405414804771971072, 'admin', 1435143678721236992);
INSERT INTO `iam_role_menu` VALUES (1533038290578358345, 1405414804771971072, 'admin', 1435476255797624832);
INSERT INTO `iam_role_menu` VALUES (1533038290578358346, 1405414804771971072, 'admin', 1480839877352476672);
INSERT INTO `iam_role_menu` VALUES (1533038290578358347, 1405414804771971072, 'admin', 1452569339987472384);
INSERT INTO `iam_role_menu` VALUES (1533038290578358348, 1405414804771971072, 'admin', 1414596805538238464);
INSERT INTO `iam_role_menu` VALUES (1533038290578358349, 1405414804771971072, 'admin', 1431089129232498688);
INSERT INTO `iam_role_menu` VALUES (1533038290578358350, 1405414804771971072, 'admin', 1474694545336676352);
INSERT INTO `iam_role_menu` VALUES (1533038290578358351, 1405414804771971072, 'admin', 1452569691537256448);
INSERT INTO `iam_role_menu` VALUES (1533038290578358352, 1405414804771971072, 'admin', 1414596647509446656);
INSERT INTO `iam_role_menu` VALUES (1533038290578358353, 1405414804771971072, 'admin', 1414596842322284544);
INSERT INTO `iam_role_menu` VALUES (1533038290578358354, 1405414804771971072, 'admin', 1431082258161434624);
INSERT INTO `iam_role_menu` VALUES (1533038290578358355, 1405414804771971072, 'admin', 1450473063320526848);
INSERT INTO `iam_role_menu` VALUES (1533038290578358356, 1405414804771971072, 'admin', 1452571269199540224);
INSERT INTO `iam_role_menu` VALUES (1533038290578358357, 1405414804771971072, 'admin', 1414596877617352704);
INSERT INTO `iam_role_menu` VALUES (1533038290578358358, 1405414804771971072, 'admin', 1450803906215886848);
INSERT INTO `iam_role_menu` VALUES (1533038290578358359, 1405414804771971072, 'admin', 1452638905302966272);
INSERT INTO `iam_role_menu` VALUES (1533038290578358360, 1405414804771971072, 'admin', 1490984296616263680);
INSERT INTO `iam_role_menu` VALUES (1533038290578358361, 1405414804771971072, 'admin', 1495013564652429312);
INSERT INTO `iam_role_menu` VALUES (1533038290578358362, 1405414804771971072, 'admin', 1431152689832525824);
INSERT INTO `iam_role_menu` VALUES (1533038290578358363, 1405414804771971072, 'admin', 1431153358157348864);
INSERT INTO `iam_role_menu` VALUES (1533038290578358364, 1405414804771971072, 'admin', 1438061887002759168);
INSERT INTO `iam_role_menu` VALUES (1533038290578358365, 1405414804771971072, 'admin', 1438072357281542144);
INSERT INTO `iam_role_menu` VALUES (1533038290578358366, 1405414804771971072, 'admin', 1439196893514031104);
INSERT INTO `iam_role_menu` VALUES (1533038290578358367, 1405414804771971072, 'admin', 1440216178722050048);
INSERT INTO `iam_role_menu` VALUES (1533038290578358368, 1405414804771971072, 'admin', 1440216612211757056);
INSERT INTO `iam_role_menu` VALUES (1533038290578358369, 1405414804771971072, 'admin', 1450827660459458560);
INSERT INTO `iam_role_menu` VALUES (1533038290578358370, 1405414804771971072, 'admin', 1450819607680991232);
INSERT INTO `iam_role_menu` VALUES (1533038290578358371, 1405414804771971072, 'admin', 1450821723027881984);
INSERT INTO `iam_role_menu` VALUES (1533038290578358372, 1405414804771971072, 'admin', 1450821877831254016);
INSERT INTO `iam_role_menu` VALUES (1533038290578358373, 1405414804771971072, 'admin', 1450822511087271936);
INSERT INTO `iam_role_menu` VALUES (1533038290578358374, 1405414804771971072, 'admin', 1511266086400524288);
INSERT INTO `iam_role_menu` VALUES (1533038290578358375, 1405414804771971072, 'admin', 1450822842995130368);
INSERT INTO `iam_role_menu` VALUES (1533038290578358376, 1405414804771971072, 'admin', 1450825488577544192);
INSERT INTO `iam_role_menu` VALUES (1533038290578358377, 1405414804771971072, 'admin', 1501847310319972352);
INSERT INTO `iam_role_menu` VALUES (1533038290578358378, 1405414804771971072, 'admin', 1450823960236081152);
INSERT INTO `iam_role_menu` VALUES (1533038290578358379, 1405414804771971072, 'admin', 1450824117849636864);
INSERT INTO `iam_role_menu` VALUES (1533038290578358380, 1405414804771971072, 'admin', 1450824319868289024);
INSERT INTO `iam_role_menu` VALUES (1533038290578358381, 1405414804771971072, 'admin', 1450824637876224000);
INSERT INTO `iam_role_menu` VALUES (1533038290578358382, 1405414804771971072, 'admin', 1450824875198332928);
INSERT INTO `iam_role_menu` VALUES (1533038290578358383, 1405414804771971072, 'admin', 1450825615857893376);
INSERT INTO `iam_role_menu` VALUES (1533038290578358384, 1405414804771971072, 'admin', 1450826890318135296);
INSERT INTO `iam_role_menu` VALUES (1533038290578358385, 1405414804771971072, 'admin', 1450827159626006528);
INSERT INTO `iam_role_menu` VALUES (1533038290578358386, 1405414804771971072, 'admin', 1450827308515409920);
INSERT INTO `iam_role_menu` VALUES (1533038290578358387, 1405414804771971072, 'admin', 1450825819436826624);
INSERT INTO `iam_role_menu` VALUES (1533038290578358388, 1405414804771971072, 'admin', 1501740492360962048);
INSERT INTO `iam_role_menu` VALUES (1533038290578358389, 1405414804771971072, 'admin', 1501742229142556672);
INSERT INTO `iam_role_menu` VALUES (1533038290578358390, 1405414804771971072, 'admin', 1501742417378725888);
INSERT INTO `iam_role_menu` VALUES (1533038290578358391, 1405414804771971072, 'admin', 1502926397176242176);
INSERT INTO `iam_role_menu` VALUES (1533038290578358392, 1405414804771971072, 'admin', 1523860792695283712);
INSERT INTO `iam_role_menu` VALUES (1533038290578358393, 1405414804771971072, 'admin', 1523941932282114048);
INSERT INTO `iam_role_menu` VALUES (1533038290578358394, 1405414804771971072, 'admin', 1523942130555252736);
INSERT INTO `iam_role_menu` VALUES (1533038290578358395, 1405414804771971072, 'admin', 1524044195818278912);
INSERT INTO `iam_role_menu` VALUES (1533038290578358396, 1405414804771971072, 'admin', 1524044395823665152);
INSERT INTO `iam_role_menu` VALUES (1533038290578358397, 1405414804771971072, 'admin', 1524044678314233856);
INSERT INTO `iam_role_menu` VALUES (1533038290578358398, 1405414804771971072, 'admin', 1525472571967860736);
INSERT INTO `iam_role_menu` VALUES (1533038290578358399, 1405414804771971072, 'admin', 1495968302034210816);
INSERT INTO `iam_role_menu` VALUES (1533038290578358400, 1405414804771971072, 'admin', 1495969099987963904);
INSERT INTO `iam_role_menu` VALUES (1533038290578358401, 1405414804771971072, 'admin', 1506910599819165696);
INSERT INTO `iam_role_menu` VALUES (1533038290578358402, 1405414804771971072, 'admin', 1506910885463851008);
INSERT INTO `iam_role_menu` VALUES (1533038290578358403, 1405414804771971072, 'admin', 1506911113394913280);
INSERT INTO `iam_role_menu` VALUES (1533038290578358404, 1405414804771971072, 'admin', 1496020308992143360);
INSERT INTO `iam_role_menu` VALUES (1533038290578358405, 1405414804771971072, 'admin', 1507998458886197248);
INSERT INTO `iam_role_menu` VALUES (1533038290578358406, 1405414804771971072, 'admin', 1509488473583562752);
INSERT INTO `iam_role_menu` VALUES (1533038290578358407, 1405414804771971072, 'admin', 1530120084482084864);
INSERT INTO `iam_role_menu` VALUES (1533038290578358408, 1405414804771971072, 'admin', 1414596052497092608);
INSERT INTO `iam_role_menu` VALUES (1533038290578358409, 1405414804771971072, 'admin', 1414596773275652096);
INSERT INTO `iam_role_menu` VALUES (1533038290578358410, 1405414804771971072, 'admin', 1431083330909208576);
INSERT INTO `iam_role_menu` VALUES (1533038290578358411, 1405414804771971072, 'admin', 1452567897717321728);
INSERT INTO `iam_role_menu` VALUES (1533038290578358412, 1405414804771971072, 'admin', 1435143678721236992);
INSERT INTO `iam_role_menu` VALUES (1533038290578358413, 1405414804771971072, 'admin', 1435476255797624832);
INSERT INTO `iam_role_menu` VALUES (1533038290578358414, 1405414804771971072, 'admin', 1480839877352476672);
INSERT INTO `iam_role_menu` VALUES (1533038290578358415, 1405414804771971072, 'admin', 1452569339987472384);
INSERT INTO `iam_role_menu` VALUES (1533038290578358416, 1405414804771971072, 'admin', 1414596805538238464);
INSERT INTO `iam_role_menu` VALUES (1533038290578358417, 1405414804771971072, 'admin', 1431089129232498688);
INSERT INTO `iam_role_menu` VALUES (1533038290578358418, 1405414804771971072, 'admin', 1474694545336676352);
INSERT INTO `iam_role_menu` VALUES (1533038290578358419, 1405414804771971072, 'admin', 1452569691537256448);
INSERT INTO `iam_role_menu` VALUES (1533038290578358420, 1405414804771971072, 'admin', 1414596647509446656);
INSERT INTO `iam_role_menu` VALUES (1533038290578358421, 1405414804771971072, 'admin', 1414596842322284544);
INSERT INTO `iam_role_menu` VALUES (1533038290578358422, 1405414804771971072, 'admin', 1431082258161434624);
INSERT INTO `iam_role_menu` VALUES (1533038290578358423, 1405414804771971072, 'admin', 1450473063320526848);
INSERT INTO `iam_role_menu` VALUES (1533038290578358424, 1405414804771971072, 'admin', 1452571269199540224);
INSERT INTO `iam_role_menu` VALUES (1533038290578358425, 1405414804771971072, 'admin', 1414596877617352704);
INSERT INTO `iam_role_menu` VALUES (1533038290578358426, 1405414804771971072, 'admin', 1450803906215886848);
INSERT INTO `iam_role_menu` VALUES (1533038290578358427, 1405414804771971072, 'admin', 1452638905302966272);
INSERT INTO `iam_role_menu` VALUES (1533038290578358428, 1405414804771971072, 'admin', 1490984296616263680);
INSERT INTO `iam_role_menu` VALUES (1533038290578358429, 1405414804771971072, 'admin', 1495013564652429312);
INSERT INTO `iam_role_menu` VALUES (1533038290578358430, 1405414804771971072, 'admin', 1431152689832525824);
INSERT INTO `iam_role_menu` VALUES (1533038290578358431, 1405414804771971072, 'admin', 1431153358157348864);
INSERT INTO `iam_role_menu` VALUES (1533038290578358432, 1405414804771971072, 'admin', 1438061887002759168);
INSERT INTO `iam_role_menu` VALUES (1533038290578358433, 1405414804771971072, 'admin', 1438072357281542144);
INSERT INTO `iam_role_menu` VALUES (1533038290578358434, 1405414804771971072, 'admin', 1439196893514031104);
INSERT INTO `iam_role_menu` VALUES (1533038290578358435, 1405414804771971072, 'admin', 1440216178722050048);
INSERT INTO `iam_role_menu` VALUES (1533038290578358436, 1405414804771971072, 'admin', 1440216612211757056);
INSERT INTO `iam_role_menu` VALUES (1533038290578358437, 1405414804771971072, 'admin', 1450827660459458560);
INSERT INTO `iam_role_menu` VALUES (1533038290578358438, 1405414804771971072, 'admin', 1450819607680991232);
INSERT INTO `iam_role_menu` VALUES (1533038290578358439, 1405414804771971072, 'admin', 1450821723027881984);
INSERT INTO `iam_role_menu` VALUES (1533038290578358440, 1405414804771971072, 'admin', 1450821877831254016);
INSERT INTO `iam_role_menu` VALUES (1533038290578358441, 1405414804771971072, 'admin', 1450822511087271936);
INSERT INTO `iam_role_menu` VALUES (1533038290578358442, 1405414804771971072, 'admin', 1511266086400524288);
INSERT INTO `iam_role_menu` VALUES (1533038290578358443, 1405414804771971072, 'admin', 1450822842995130368);
INSERT INTO `iam_role_menu` VALUES (1533038290578358444, 1405414804771971072, 'admin', 1450825488577544192);
INSERT INTO `iam_role_menu` VALUES (1533038290578358445, 1405414804771971072, 'admin', 1501847310319972352);
INSERT INTO `iam_role_menu` VALUES (1533038290578358446, 1405414804771971072, 'admin', 1450823960236081152);
INSERT INTO `iam_role_menu` VALUES (1533038290578358447, 1405414804771971072, 'admin', 1450824117849636864);
INSERT INTO `iam_role_menu` VALUES (1533038290578358448, 1405414804771971072, 'admin', 1450824319868289024);
INSERT INTO `iam_role_menu` VALUES (1533038290578358449, 1405414804771971072, 'admin', 1450824637876224000);
INSERT INTO `iam_role_menu` VALUES (1533038290578358450, 1405414804771971072, 'admin', 1450824875198332928);
INSERT INTO `iam_role_menu` VALUES (1533038290578358451, 1405414804771971072, 'admin', 1450825615857893376);
INSERT INTO `iam_role_menu` VALUES (1533038290578358452, 1405414804771971072, 'admin', 1450826890318135296);
INSERT INTO `iam_role_menu` VALUES (1533038290578358453, 1405414804771971072, 'admin', 1450827159626006528);
INSERT INTO `iam_role_menu` VALUES (1533038290578358454, 1405414804771971072, 'admin', 1450827308515409920);
INSERT INTO `iam_role_menu` VALUES (1533038290578358455, 1405414804771971072, 'admin', 1450825819436826624);
INSERT INTO `iam_role_menu` VALUES (1533038290578358456, 1405414804771971072, 'admin', 1501740492360962048);
INSERT INTO `iam_role_menu` VALUES (1533038290578358457, 1405414804771971072, 'admin', 1501742229142556672);
INSERT INTO `iam_role_menu` VALUES (1533038290578358458, 1405414804771971072, 'admin', 1501742417378725888);
INSERT INTO `iam_role_menu` VALUES (1533038290578358459, 1405414804771971072, 'admin', 1502926397176242176);
INSERT INTO `iam_role_menu` VALUES (1533038290578358460, 1405414804771971072, 'admin', 1523860792695283712);
INSERT INTO `iam_role_menu` VALUES (1533038290578358461, 1405414804771971072, 'admin', 1523941932282114048);
INSERT INTO `iam_role_menu` VALUES (1533038290578358462, 1405414804771971072, 'admin', 1523942130555252736);
INSERT INTO `iam_role_menu` VALUES (1533038290578358463, 1405414804771971072, 'admin', 1524044195818278912);
INSERT INTO `iam_role_menu` VALUES (1533038290578358464, 1405414804771971072, 'admin', 1524044395823665152);
INSERT INTO `iam_role_menu` VALUES (1533038290578358465, 1405414804771971072, 'admin', 1524044678314233856);
INSERT INTO `iam_role_menu` VALUES (1533038290578358466, 1405414804771971072, 'admin', 1525472571967860736);
INSERT INTO `iam_role_menu` VALUES (1533038290578358467, 1405414804771971072, 'admin', 1495968302034210816);
INSERT INTO `iam_role_menu` VALUES (1533038290578358468, 1405414804771971072, 'admin', 1495969099987963904);
INSERT INTO `iam_role_menu` VALUES (1533038290578358469, 1405414804771971072, 'admin', 1506910599819165696);
INSERT INTO `iam_role_menu` VALUES (1533038290578358470, 1405414804771971072, 'admin', 1506910885463851008);
INSERT INTO `iam_role_menu` VALUES (1533038290578358471, 1405414804771971072, 'admin', 1506911113394913280);
INSERT INTO `iam_role_menu` VALUES (1533038290578358472, 1405414804771971072, 'admin', 1496020308992143360);
INSERT INTO `iam_role_menu` VALUES (1533038290578358473, 1405414804771971072, 'admin', 1507998458886197248);
INSERT INTO `iam_role_menu` VALUES (1533038290578358474, 1405414804771971072, 'admin', 1509488473583562752);
INSERT INTO `iam_role_menu` VALUES (1533038290578358475, 1405414804771971072, 'admin', 1530120084482084864);

-- ----------------------------
-- Table structure for iam_role_path
-- ----------------------------
DROP TABLE IF EXISTS `iam_role_path`;
CREATE TABLE `iam_role_path`  (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `permission_id` bigint(20) NOT NULL COMMENT '请求权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色请求权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_role_path
-- ----------------------------
INSERT INTO `iam_role_path` VALUES (1533038257611128832, 1405414804771971072, 1533037132564578304);
INSERT INTO `iam_role_path` VALUES (1533038257611128833, 1405414804771971072, 1533037132682018817);
INSERT INTO `iam_role_path` VALUES (1533038257611128834, 1405414804771971072, 1533037132874956802);
INSERT INTO `iam_role_path` VALUES (1533038257611128835, 1405414804771971072, 1533037132921094144);
INSERT INTO `iam_role_path` VALUES (1533038257611128836, 1405414804771971072, 1533037132963037185);
INSERT INTO `iam_role_path` VALUES (1533038257611128837, 1405414804771971072, 1533037132967231489);
INSERT INTO `iam_role_path` VALUES (1533038257611128838, 1405414804771971072, 1533037133080477699);
INSERT INTO `iam_role_path` VALUES (1533038257611128839, 1405414804771971072, 1533037133147586561);
INSERT INTO `iam_role_path` VALUES (1533038257611128840, 1405414804771971072, 1533037132585549824);
INSERT INTO `iam_role_path` VALUES (1533038257611128841, 1405414804771971072, 1533037132937871361);
INSERT INTO `iam_role_path` VALUES (1533038257611128842, 1405414804771971072, 1533037133160169473);
INSERT INTO `iam_role_path` VALUES (1533038257611128843, 1405414804771971072, 1533037132593938432);
INSERT INTO `iam_role_path` VALUES (1533038257611128844, 1405414804771971072, 1533037132648464384);
INSERT INTO `iam_role_path` VALUES (1533038257611128845, 1405414804771971072, 1533037132665241601);
INSERT INTO `iam_role_path` VALUES (1533038257611128846, 1405414804771971072, 1533037132870762496);
INSERT INTO `iam_role_path` VALUES (1533038257611128847, 1405414804771971072, 1533037132925288450);
INSERT INTO `iam_role_path` VALUES (1533038257611128848, 1405414804771971072, 1533037132937871362);
INSERT INTO `iam_role_path` VALUES (1533038257611128849, 1405414804771971072, 1533037133130809344);
INSERT INTO `iam_role_path` VALUES (1533038257611128850, 1405414804771971072, 1533037132598132736);
INSERT INTO `iam_role_path` VALUES (1533038257611128851, 1405414804771971072, 1533037132686213121);
INSERT INTO `iam_role_path` VALUES (1533038257611128852, 1405414804771971072, 1533037132707184642);
INSERT INTO `iam_role_path` VALUES (1533038257611128853, 1405414804771971072, 1533037132900122626);
INSERT INTO `iam_role_path` VALUES (1533038257611128854, 1405414804771971072, 1533037132946259968);
INSERT INTO `iam_role_path` VALUES (1533038257611128855, 1405414804771971072, 1533037133030146050);
INSERT INTO `iam_role_path` VALUES (1533038257611128856, 1405414804771971072, 1533037133046923266);
INSERT INTO `iam_role_path` VALUES (1533038257611128857, 1405414804771971072, 1533037133072089090);
INSERT INTO `iam_role_path` VALUES (1533038257611128858, 1405414804771971072, 1533037133151780865);
INSERT INTO `iam_role_path` VALUES (1533038257611128859, 1405414804771971072, 1533037133151780867);
INSERT INTO `iam_role_path` VALUES (1533038257611128860, 1405414804771971072, 1533037133155975168);
INSERT INTO `iam_role_path` VALUES (1533038257611128861, 1405414804771971072, 1533037132602327040);
INSERT INTO `iam_role_path` VALUES (1533038257611128862, 1405414804771971072, 1533037132774293504);
INSERT INTO `iam_role_path` VALUES (1533038257611128863, 1405414804771971072, 1533037132845596672);
INSERT INTO `iam_role_path` VALUES (1533038257611128864, 1405414804771971072, 1533037132862373890);
INSERT INTO `iam_role_path` VALUES (1533038257611128865, 1405414804771971072, 1533037132866568193);
INSERT INTO `iam_role_path` VALUES (1533038257611128866, 1405414804771971072, 1533037132925288448);
INSERT INTO `iam_role_path` VALUES (1533038257611128867, 1405414804771971072, 1533037133055311873);
INSERT INTO `iam_role_path` VALUES (1533038257611128868, 1405414804771971072, 1533037133143392257);
INSERT INTO `iam_role_path` VALUES (1533038257611128869, 1405414804771971072, 1533037132606521344);
INSERT INTO `iam_role_path` VALUES (1533038257611128870, 1405414804771971072, 1533037132799459330);
INSERT INTO `iam_role_path` VALUES (1533038257611128871, 1405414804771971072, 1533037132895928321);
INSERT INTO `iam_role_path` VALUES (1533038257611128872, 1405414804771971072, 1533037133013368832);
INSERT INTO `iam_role_path` VALUES (1533038257611128873, 1405414804771971072, 1533037133122420739);
INSERT INTO `iam_role_path` VALUES (1533038257611128874, 1405414804771971072, 1533037133160169474);
INSERT INTO `iam_role_path` VALUES (1533038257611128875, 1405414804771971072, 1533037132610715648);
INSERT INTO `iam_role_path` VALUES (1533038257611128876, 1405414804771971072, 1533037132614909953);
INSERT INTO `iam_role_path` VALUES (1533038257611128877, 1405414804771971072, 1533037132669435906);
INSERT INTO `iam_role_path` VALUES (1533038257611128878, 1405414804771971072, 1533037132753321984);
INSERT INTO `iam_role_path` VALUES (1533038257611128879, 1405414804771971072, 1533037132900122625);
INSERT INTO `iam_role_path` VALUES (1533038257611128880, 1405414804771971072, 1533037132975620098);
INSERT INTO `iam_role_path` VALUES (1533038257611128881, 1405414804771971072, 1533037132614909952);
INSERT INTO `iam_role_path` VALUES (1533038257611128882, 1405414804771971072, 1533037132728156161);
INSERT INTO `iam_role_path` VALUES (1533038257611128883, 1405414804771971072, 1533037132858179584);
INSERT INTO `iam_role_path` VALUES (1533038257611128884, 1405414804771971072, 1533037133076283393);
INSERT INTO `iam_role_path` VALUES (1533038257611128885, 1405414804771971072, 1533037133088866305);
INSERT INTO `iam_role_path` VALUES (1533038257611128886, 1405414804771971072, 1533037133097254912);
INSERT INTO `iam_role_path` VALUES (1533038257611128887, 1405414804771971072, 1533037133097254914);
INSERT INTO `iam_role_path` VALUES (1533038257611128888, 1405414804771971072, 1533037133101449216);
INSERT INTO `iam_role_path` VALUES (1533038257611128889, 1405414804771971072, 1533037133118226435);
INSERT INTO `iam_role_path` VALUES (1533038257611128890, 1405414804771971072, 1533037132619104256);
INSERT INTO `iam_role_path` VALUES (1533038257611128891, 1405414804771971072, 1533037132623298560);
INSERT INTO `iam_role_path` VALUES (1533038257611128892, 1405414804771971072, 1533037132661047296);
INSERT INTO `iam_role_path` VALUES (1533038257611128893, 1405414804771971072, 1533037132661047297);
INSERT INTO `iam_role_path` VALUES (1533038257611128894, 1405414804771971072, 1533037132719767552);
INSERT INTO `iam_role_path` VALUES (1533038257611128895, 1405414804771971072, 1533037132807847938);
INSERT INTO `iam_role_path` VALUES (1533038257611128896, 1405414804771971072, 1533037132820430849);
INSERT INTO `iam_role_path` VALUES (1533038257611128897, 1405414804771971072, 1533037132845596673);
INSERT INTO `iam_role_path` VALUES (1533038257611128898, 1405414804771971072, 1533037133042728962);
INSERT INTO `iam_role_path` VALUES (1533038257611128899, 1405414804771971072, 1533037133046923264);
INSERT INTO `iam_role_path` VALUES (1533038257611128900, 1405414804771971072, 1533037133063700482);
INSERT INTO `iam_role_path` VALUES (1533038257611128901, 1405414804771971072, 1533037133067894787);
INSERT INTO `iam_role_path` VALUES (1533038257611128902, 1405414804771971072, 1533037133114032129);
INSERT INTO `iam_role_path` VALUES (1533038257611128903, 1405414804771971072, 1533037132623298561);
INSERT INTO `iam_role_path` VALUES (1533038257611128904, 1405414804771971072, 1533037132837208064);
INSERT INTO `iam_role_path` VALUES (1533038257611128905, 1405414804771971072, 1533037132958842882);
INSERT INTO `iam_role_path` VALUES (1533038257611128906, 1405414804771971072, 1533037133063700480);
INSERT INTO `iam_role_path` VALUES (1533038257611128907, 1405414804771971072, 1533037132627492864);
INSERT INTO `iam_role_path` VALUES (1533038257611128908, 1405414804771971072, 1533037132644270080);
INSERT INTO `iam_role_path` VALUES (1533038257611128909, 1405414804771971072, 1533037132812042240);
INSERT INTO `iam_role_path` VALUES (1533038257611128910, 1405414804771971072, 1533037132824625152);
INSERT INTO `iam_role_path` VALUES (1533038257611128911, 1405414804771971072, 1533037132916899843);
INSERT INTO `iam_role_path` VALUES (1533038257611128912, 1405414804771971072, 1533037133000785921);
INSERT INTO `iam_role_path` VALUES (1533038257611128913, 1405414804771971072, 1533037133034340352);
INSERT INTO `iam_role_path` VALUES (1533038257611128914, 1405414804771971072, 1533037133076283394);
INSERT INTO `iam_role_path` VALUES (1533038257611128915, 1405414804771971072, 1533037132627492865);
INSERT INTO `iam_role_path` VALUES (1533038257611128916, 1405414804771971072, 1533037132669435904);
INSERT INTO `iam_role_path` VALUES (1533038257611128917, 1405414804771971072, 1533037132711378945);
INSERT INTO `iam_role_path` VALUES (1533038257611128918, 1405414804771971072, 1533037132774293505);
INSERT INTO `iam_role_path` VALUES (1533038257611128919, 1405414804771971072, 1533037132833013760);
INSERT INTO `iam_role_path` VALUES (1533038257611128920, 1405414804771971072, 1533037132853985281);
INSERT INTO `iam_role_path` VALUES (1533038257611128921, 1405414804771971072, 1533037132870762498);
INSERT INTO `iam_role_path` VALUES (1533038257611128922, 1405414804771971072, 1533037132883345410);
INSERT INTO `iam_role_path` VALUES (1533038257611128923, 1405414804771971072, 1533037132929482752);
INSERT INTO `iam_role_path` VALUES (1533038257611128924, 1405414804771971072, 1533037132950454274);
INSERT INTO `iam_role_path` VALUES (1533038257611128925, 1405414804771971072, 1533037132996591617);
INSERT INTO `iam_role_path` VALUES (1533038257611128926, 1405414804771971072, 1533037133025951745);
INSERT INTO `iam_role_path` VALUES (1533038257611128927, 1405414804771971072, 1533037133093060608);
INSERT INTO `iam_role_path` VALUES (1533038257611128928, 1405414804771971072, 1533037133109837825);
INSERT INTO `iam_role_path` VALUES (1533038257611128929, 1405414804771971072, 1533037133109837826);
INSERT INTO `iam_role_path` VALUES (1533038257611128930, 1405414804771971072, 1533037132631687168);
INSERT INTO `iam_role_path` VALUES (1533038257611128931, 1405414804771971072, 1533037132673630208);
INSERT INTO `iam_role_path` VALUES (1533038257611128932, 1405414804771971072, 1533037132795265025);
INSERT INTO `iam_role_path` VALUES (1533038257611128933, 1405414804771971072, 1533037132828819457);
INSERT INTO `iam_role_path` VALUES (1533038257611128934, 1405414804771971072, 1533037132950454272);
INSERT INTO `iam_role_path` VALUES (1533038257611128935, 1405414804771971072, 1533037132967231491);
INSERT INTO `iam_role_path` VALUES (1533038257611128936, 1405414804771971072, 1533037132988203010);
INSERT INTO `iam_role_path` VALUES (1533038257611128937, 1405414804771971072, 1533037133147586563);
INSERT INTO `iam_role_path` VALUES (1533038257611128938, 1405414804771971072, 1533037132631687169);
INSERT INTO `iam_role_path` VALUES (1533038257611128939, 1405414804771971072, 1533037132686213120);
INSERT INTO `iam_role_path` VALUES (1533038257611128940, 1405414804771971072, 1533037132937871360);
INSERT INTO `iam_role_path` VALUES (1533038257611128941, 1405414804771971072, 1533037132946259970);
INSERT INTO `iam_role_path` VALUES (1533038257611128942, 1405414804771971072, 1533037132954648578);
INSERT INTO `iam_role_path` VALUES (1533038257611128943, 1405414804771971072, 1533037133009174528);
INSERT INTO `iam_role_path` VALUES (1533038257611128944, 1405414804771971072, 1533037133093060610);
INSERT INTO `iam_role_path` VALUES (1533038257611128945, 1405414804771971072, 1533037133109837824);
INSERT INTO `iam_role_path` VALUES (1533038257611128946, 1405414804771971072, 1533037133135003648);
INSERT INTO `iam_role_path` VALUES (1533038257611128947, 1405414804771971072, 1533037133155975171);
INSERT INTO `iam_role_path` VALUES (1533038257611128948, 1405414804771971072, 1533037132640075776);
INSERT INTO `iam_role_path` VALUES (1533038257611128949, 1405414804771971072, 1533037132665241600);
INSERT INTO `iam_role_path` VALUES (1533038257611128950, 1405414804771971072, 1533037132669435905);
INSERT INTO `iam_role_path` VALUES (1533038257611128951, 1405414804771971072, 1533037132698796032);
INSERT INTO `iam_role_path` VALUES (1533038257611128952, 1405414804771971072, 1533037132807847937);
INSERT INTO `iam_role_path` VALUES (1533038257611128953, 1405414804771971072, 1533037132895928322);
INSERT INTO `iam_role_path` VALUES (1533038257611128954, 1405414804771971072, 1533037132908511235);
INSERT INTO `iam_role_path` VALUES (1533038257611128955, 1405414804771971072, 1533037132996591616);
INSERT INTO `iam_role_path` VALUES (1533038257611128956, 1405414804771971072, 1533037133025951744);
INSERT INTO `iam_role_path` VALUES (1533038257611128957, 1405414804771971072, 1533037133097254915);
INSERT INTO `iam_role_path` VALUES (1533038257611128958, 1405414804771971072, 1533037133135003651);
INSERT INTO `iam_role_path` VALUES (1533038257611128959, 1405414804771971072, 1533037132640075777);
INSERT INTO `iam_role_path` VALUES (1533038257611128960, 1405414804771971072, 1533037132786876417);
INSERT INTO `iam_role_path` VALUES (1533038257611128961, 1405414804771971072, 1533037132799459328);
INSERT INTO `iam_role_path` VALUES (1533038257611128962, 1405414804771971072, 1533037132803653633);
INSERT INTO `iam_role_path` VALUES (1533038257611128963, 1405414804771971072, 1533037132849790976);
INSERT INTO `iam_role_path` VALUES (1533038257611128964, 1405414804771971072, 1533037132908511232);
INSERT INTO `iam_role_path` VALUES (1533038257611128965, 1405414804771971072, 1533037132916899842);
INSERT INTO `iam_role_path` VALUES (1533038257611128966, 1405414804771971072, 1533037132929482753);
INSERT INTO `iam_role_path` VALUES (1533038257611128967, 1405414804771971072, 1533037133013368834);
INSERT INTO `iam_role_path` VALUES (1533038257611128968, 1405414804771971072, 1533037133151780866);
INSERT INTO `iam_role_path` VALUES (1533038257611128969, 1405414804771971072, 1533037133164363777);
INSERT INTO `iam_role_path` VALUES (1533038257611128970, 1405414804771971072, 1533037132656852992);
INSERT INTO `iam_role_path` VALUES (1533038257611128971, 1405414804771971072, 1533037132711378944);
INSERT INTO `iam_role_path` VALUES (1533038257611128972, 1405414804771971072, 1533037132761710594);
INSERT INTO `iam_role_path` VALUES (1533038257611128973, 1405414804771971072, 1533037132916899840);
INSERT INTO `iam_role_path` VALUES (1533038257611128974, 1405414804771971072, 1533037132963037186);
INSERT INTO `iam_role_path` VALUES (1533038257611128975, 1405414804771971072, 1533037132975620096);
INSERT INTO `iam_role_path` VALUES (1533038257611128976, 1405414804771971072, 1533037133034340354);
INSERT INTO `iam_role_path` VALUES (1533038257611128977, 1405414804771971072, 1533037133080477698);
INSERT INTO `iam_role_path` VALUES (1533038257611128978, 1405414804771971072, 1533037133084672002);
INSERT INTO `iam_role_path` VALUES (1533038257611128979, 1405414804771971072, 1533037133122420737);
INSERT INTO `iam_role_path` VALUES (1533038257611128980, 1405414804771971072, 1533037132661047298);
INSERT INTO `iam_role_path` VALUES (1533038257611128981, 1405414804771971072, 1533037132707184641);
INSERT INTO `iam_role_path` VALUES (1533038257611128982, 1405414804771971072, 1533037132791070720);
INSERT INTO `iam_role_path` VALUES (1533038257611128983, 1405414804771971072, 1533037132942065664);
INSERT INTO `iam_role_path` VALUES (1533038257611128984, 1405414804771971072, 1533037132942065666);
INSERT INTO `iam_role_path` VALUES (1533038257611128985, 1405414804771971072, 1533037133000785920);
INSERT INTO `iam_role_path` VALUES (1533038257611128986, 1405414804771971072, 1533037132673630209);
INSERT INTO `iam_role_path` VALUES (1533038257611128987, 1405414804771971072, 1533037132803653632);
INSERT INTO `iam_role_path` VALUES (1533038257611128988, 1405414804771971072, 1533037132820430850);
INSERT INTO `iam_role_path` VALUES (1533038257611128989, 1405414804771971072, 1533037132958842880);
INSERT INTO `iam_role_path` VALUES (1533038257611128990, 1405414804771971072, 1533037133038534657);
INSERT INTO `iam_role_path` VALUES (1533038257611128991, 1405414804771971072, 1533037133101449219);
INSERT INTO `iam_role_path` VALUES (1533038257611128992, 1405414804771971072, 1533037133122420738);
INSERT INTO `iam_role_path` VALUES (1533038257611128993, 1405414804771971072, 1533037133130809346);
INSERT INTO `iam_role_path` VALUES (1533038257611128994, 1405414804771971072, 1533037132677824512);
INSERT INTO `iam_role_path` VALUES (1533038257611128995, 1405414804771971072, 1533037132694601729);
INSERT INTO `iam_role_path` VALUES (1533038257611128996, 1405414804771971072, 1533037132740739072);
INSERT INTO `iam_role_path` VALUES (1533038257611128997, 1405414804771971072, 1533037132866568192);
INSERT INTO `iam_role_path` VALUES (1533038257611128998, 1405414804771971072, 1533037132971425793);
INSERT INTO `iam_role_path` VALUES (1533038257611128999, 1405414804771971072, 1533037132971425794);
INSERT INTO `iam_role_path` VALUES (1533038257611129000, 1405414804771971072, 1533037132992397312);
INSERT INTO `iam_role_path` VALUES (1533038257611129001, 1405414804771971072, 1533037133000785923);
INSERT INTO `iam_role_path` VALUES (1533038257611129002, 1405414804771971072, 1533037133080477696);
INSERT INTO `iam_role_path` VALUES (1533038257611129003, 1405414804771971072, 1533037133105643520);
INSERT INTO `iam_role_path` VALUES (1533038257611129004, 1405414804771971072, 1533037132677824513);
INSERT INTO `iam_role_path` VALUES (1533038257611129005, 1405414804771971072, 1533037132682018816);
INSERT INTO `iam_role_path` VALUES (1533038257611129006, 1405414804771971072, 1533037132925288449);
INSERT INTO `iam_role_path` VALUES (1533038257611129007, 1405414804771971072, 1533037133004980226);
INSERT INTO `iam_role_path` VALUES (1533038257611129008, 1405414804771971072, 1533037133160169476);
INSERT INTO `iam_role_path` VALUES (1533038257611129009, 1405414804771971072, 1533037132682018818);
INSERT INTO `iam_role_path` VALUES (1533038257611129010, 1405414804771971072, 1533037132753321986);
INSERT INTO `iam_role_path` VALUES (1533038257611129011, 1405414804771971072, 1533037132778487808);
INSERT INTO `iam_role_path` VALUES (1533038257611129012, 1405414804771971072, 1533037132791070721);
INSERT INTO `iam_role_path` VALUES (1533038257611129013, 1405414804771971072, 1533037132870762497);
INSERT INTO `iam_role_path` VALUES (1533038257611129014, 1405414804771971072, 1533037132887539712);
INSERT INTO `iam_role_path` VALUES (1533038257611129015, 1405414804771971072, 1533037132979814402);
INSERT INTO `iam_role_path` VALUES (1533038257611129016, 1405414804771971072, 1533037133101449217);
INSERT INTO `iam_role_path` VALUES (1533038257611129017, 1405414804771971072, 1533037133143392256);
INSERT INTO `iam_role_path` VALUES (1533038257611129018, 1405414804771971072, 1533037132690407424);
INSERT INTO `iam_role_path` VALUES (1533038257611129019, 1405414804771971072, 1533037132698796033);
INSERT INTO `iam_role_path` VALUES (1533038257611129020, 1405414804771971072, 1533037132765904897);
INSERT INTO `iam_role_path` VALUES (1533038257611129021, 1405414804771971072, 1533037132820430848);
INSERT INTO `iam_role_path` VALUES (1533038257611129022, 1405414804771971072, 1533037132841402370);
INSERT INTO `iam_role_path` VALUES (1533038257611129023, 1405414804771971072, 1533037132921094146);
INSERT INTO `iam_role_path` VALUES (1533038257611129024, 1405414804771971072, 1533037132971425792);
INSERT INTO `iam_role_path` VALUES (1533038257611129025, 1405414804771971072, 1533037132988203009);
INSERT INTO `iam_role_path` VALUES (1533038257611129026, 1405414804771971072, 1533037133004980224);
INSERT INTO `iam_role_path` VALUES (1533038257611129027, 1405414804771971072, 1533037132690407425);
INSERT INTO `iam_role_path` VALUES (1533038257611129028, 1405414804771971072, 1533037132770099202);
INSERT INTO `iam_role_path` VALUES (1533038257611129029, 1405414804771971072, 1533037132795265024);
INSERT INTO `iam_role_path` VALUES (1533038257611129030, 1405414804771971072, 1533037132908511233);
INSERT INTO `iam_role_path` VALUES (1533038257611129031, 1405414804771971072, 1533037132929482754);
INSERT INTO `iam_role_path` VALUES (1533038257611129032, 1405414804771971072, 1533037132690407426);
INSERT INTO `iam_role_path` VALUES (1533038257611129033, 1405414804771971072, 1533037132996591618);
INSERT INTO `iam_role_path` VALUES (1533038257611129034, 1405414804771971072, 1533037133126615041);
INSERT INTO `iam_role_path` VALUES (1533038257611129035, 1405414804771971072, 1533037132694601728);
INSERT INTO `iam_role_path` VALUES (1533038257611129036, 1405414804771971072, 1533037132841402369);
INSERT INTO `iam_role_path` VALUES (1533038257611129037, 1405414804771971072, 1533037132891734019);
INSERT INTO `iam_role_path` VALUES (1533038257611129038, 1405414804771971072, 1533037132702990336);
INSERT INTO `iam_role_path` VALUES (1533038257611129039, 1405414804771971072, 1533037132984008706);
INSERT INTO `iam_role_path` VALUES (1533038257611129040, 1405414804771971072, 1533037133067894785);
INSERT INTO `iam_role_path` VALUES (1533038257611129041, 1405414804771971072, 1533037133101449218);
INSERT INTO `iam_role_path` VALUES (1533038257611129042, 1405414804771971072, 1533037132702990337);
INSERT INTO `iam_role_path` VALUES (1533038257611129043, 1405414804771971072, 1533037132732350464);
INSERT INTO `iam_role_path` VALUES (1533038257611129044, 1405414804771971072, 1533037132749127680);
INSERT INTO `iam_role_path` VALUES (1533038257611129045, 1405414804771971072, 1533037132786876416);
INSERT INTO `iam_role_path` VALUES (1533038257611129046, 1405414804771971072, 1533037132984008704);
INSERT INTO `iam_role_path` VALUES (1533038257611129047, 1405414804771971072, 1533037133130809345);
INSERT INTO `iam_role_path` VALUES (1533038257611129048, 1405414804771971072, 1533037133143392258);
INSERT INTO `iam_role_path` VALUES (1533038257611129049, 1405414804771971072, 1533037132707184640);
INSERT INTO `iam_role_path` VALUES (1533038257611129050, 1405414804771971072, 1533037132723961856);
INSERT INTO `iam_role_path` VALUES (1533038257611129051, 1405414804771971072, 1533037132753321985);
INSERT INTO `iam_role_path` VALUES (1533038257611129052, 1405414804771971072, 1533037132837208065);
INSERT INTO `iam_role_path` VALUES (1533038257611129053, 1405414804771971072, 1533037132874956803);
INSERT INTO `iam_role_path` VALUES (1533038257611129054, 1405414804771971072, 1533037132904316929);
INSERT INTO `iam_role_path` VALUES (1533038257611129055, 1405414804771971072, 1533037132958842881);
INSERT INTO `iam_role_path` VALUES (1533038257611129056, 1405414804771971072, 1533037132992397315);
INSERT INTO `iam_role_path` VALUES (1533038257611129057, 1405414804771971072, 1533037133042728960);
INSERT INTO `iam_role_path` VALUES (1533038257611129058, 1405414804771971072, 1533037132723961857);
INSERT INTO `iam_role_path` VALUES (1533038257611129059, 1405414804771971072, 1533037132744933376);
INSERT INTO `iam_role_path` VALUES (1533038257611129060, 1405414804771971072, 1533037133017563137);
INSERT INTO `iam_role_path` VALUES (1533038257611129061, 1405414804771971072, 1533037133030146048);
INSERT INTO `iam_role_path` VALUES (1533038257611129062, 1405414804771971072, 1533037133051117568);
INSERT INTO `iam_role_path` VALUES (1533038257611129063, 1405414804771971072, 1533037133088866306);
INSERT INTO `iam_role_path` VALUES (1533038257611129064, 1405414804771971072, 1533037132728156160);
INSERT INTO `iam_role_path` VALUES (1533038257611129065, 1405414804771971072, 1533037132891734016);
INSERT INTO `iam_role_path` VALUES (1533038257611129066, 1405414804771971072, 1533037132912705536);
INSERT INTO `iam_role_path` VALUES (1533038257611129067, 1405414804771971072, 1533037133009174530);
INSERT INTO `iam_role_path` VALUES (1533038257611129068, 1405414804771971072, 1533037133067894784);
INSERT INTO `iam_role_path` VALUES (1533038257611129069, 1405414804771971072, 1533037133097254913);
INSERT INTO `iam_role_path` VALUES (1533038257611129070, 1405414804771971072, 1533037133160169475);
INSERT INTO `iam_role_path` VALUES (1533038257611129071, 1405414804771971072, 1533037132732350465);
INSERT INTO `iam_role_path` VALUES (1533038257611129072, 1405414804771971072, 1533037132933677057);
INSERT INTO `iam_role_path` VALUES (1533038257611129073, 1405414804771971072, 1533037132732350466);
INSERT INTO `iam_role_path` VALUES (1533038257611129074, 1405414804771971072, 1533037132942065665);
INSERT INTO `iam_role_path` VALUES (1533038257611129075, 1405414804771971072, 1533037132954648576);
INSERT INTO `iam_role_path` VALUES (1533038257611129076, 1405414804771971072, 1533037132736544768);
INSERT INTO `iam_role_path` VALUES (1533038257611129077, 1405414804771971072, 1533037132874956801);
INSERT INTO `iam_role_path` VALUES (1533038257611129078, 1405414804771971072, 1533037133030146049);
INSERT INTO `iam_role_path` VALUES (1533038257611129079, 1405414804771971072, 1533037133051117569);
INSERT INTO `iam_role_path` VALUES (1533038257611129080, 1405414804771971072, 1533037132736544769);
INSERT INTO `iam_role_path` VALUES (1533038257611129081, 1405414804771971072, 1533037133042728961);
INSERT INTO `iam_role_path` VALUES (1533038257611129082, 1405414804771971072, 1533037132740739073);
INSERT INTO `iam_role_path` VALUES (1533038257611129083, 1405414804771971072, 1533037132833013762);
INSERT INTO `iam_role_path` VALUES (1533038257611129084, 1405414804771971072, 1533037133168558080);
INSERT INTO `iam_role_path` VALUES (1533038257611129085, 1405414804771971072, 1533037132740739074);
INSERT INTO `iam_role_path` VALUES (1533038257611129086, 1405414804771971072, 1533037132778487809);
INSERT INTO `iam_role_path` VALUES (1533038257611129087, 1405414804771971072, 1533037132900122624);
INSERT INTO `iam_role_path` VALUES (1533038257611129088, 1405414804771971072, 1533037132975620097);
INSERT INTO `iam_role_path` VALUES (1533038257611129089, 1405414804771971072, 1533037132979814401);
INSERT INTO `iam_role_path` VALUES (1533038257611129090, 1405414804771971072, 1533037133055311872);
INSERT INTO `iam_role_path` VALUES (1533038257611129091, 1405414804771971072, 1533037133114032130);
INSERT INTO `iam_role_path` VALUES (1533038257611129092, 1405414804771971072, 1533037132744933377);
INSERT INTO `iam_role_path` VALUES (1533038257611129093, 1405414804771971072, 1533037132749127681);
INSERT INTO `iam_role_path` VALUES (1533038257611129094, 1405414804771971072, 1533037132858179585);
INSERT INTO `iam_role_path` VALUES (1533038257611129095, 1405414804771971072, 1533037132887539714);
INSERT INTO `iam_role_path` VALUES (1533038257611129096, 1405414804771971072, 1533037132912705537);
INSERT INTO `iam_role_path` VALUES (1533038257611129097, 1405414804771971072, 1533037132988203008);
INSERT INTO `iam_role_path` VALUES (1533038257611129098, 1405414804771971072, 1533037133021757442);
INSERT INTO `iam_role_path` VALUES (1533038257611129099, 1405414804771971072, 1533037133072089089);
INSERT INTO `iam_role_path` VALUES (1533038257611129100, 1405414804771971072, 1533037133118226433);
INSERT INTO `iam_role_path` VALUES (1533038257611129101, 1405414804771971072, 1533037132757516288);
INSERT INTO `iam_role_path` VALUES (1533038257611129102, 1405414804771971072, 1533037132879151105);
INSERT INTO `iam_role_path` VALUES (1533038257611129103, 1405414804771971072, 1533037132904316928);
INSERT INTO `iam_role_path` VALUES (1533038257611129104, 1405414804771971072, 1533037132904316930);
INSERT INTO `iam_role_path` VALUES (1533038257611129105, 1405414804771971072, 1533037133059506178);
INSERT INTO `iam_role_path` VALUES (1533038257611129106, 1405414804771971072, 1533037133164363776);
INSERT INTO `iam_role_path` VALUES (1533038257611129107, 1405414804771971072, 1533037132757516289);
INSERT INTO `iam_role_path` VALUES (1533038257611129108, 1405414804771971072, 1533037133076283395);
INSERT INTO `iam_role_path` VALUES (1533038257611129109, 1405414804771971072, 1533037133088866304);
INSERT INTO `iam_role_path` VALUES (1533038257611129110, 1405414804771971072, 1533037133139197952);
INSERT INTO `iam_role_path` VALUES (1533038257611129111, 1405414804771971072, 1533037132761710592);
INSERT INTO `iam_role_path` VALUES (1533038257611129112, 1405414804771971072, 1533037132933677056);
INSERT INTO `iam_role_path` VALUES (1533038257611129113, 1405414804771971072, 1533037132946259969);
INSERT INTO `iam_role_path` VALUES (1533038257611129114, 1405414804771971072, 1533037132761710593);
INSERT INTO `iam_role_path` VALUES (1533038257611129115, 1405414804771971072, 1533037132879151106);
INSERT INTO `iam_role_path` VALUES (1533038257611129116, 1405414804771971072, 1533037133021757440);
INSERT INTO `iam_role_path` VALUES (1533038257611129117, 1405414804771971072, 1533037133025951746);
INSERT INTO `iam_role_path` VALUES (1533038257611129118, 1405414804771971072, 1533037132765904896);
INSERT INTO `iam_role_path` VALUES (1533038257611129119, 1405414804771971072, 1533037133038534656);
INSERT INTO `iam_role_path` VALUES (1533038257611129120, 1405414804771971072, 1533037132770099200);
INSERT INTO `iam_role_path` VALUES (1533038257611129121, 1405414804771971072, 1533037133063700481);
INSERT INTO `iam_role_path` VALUES (1533038257611129122, 1405414804771971072, 1533037133084672001);
INSERT INTO `iam_role_path` VALUES (1533038257611129123, 1405414804771971072, 1533037133122420736);
INSERT INTO `iam_role_path` VALUES (1533038257611129124, 1405414804771971072, 1533037133147586562);
INSERT INTO `iam_role_path` VALUES (1533038257611129125, 1405414804771971072, 1533037132770099201);
INSERT INTO `iam_role_path` VALUES (1533038257611129126, 1405414804771971072, 1533037132816236544);
INSERT INTO `iam_role_path` VALUES (1533038257611129127, 1405414804771971072, 1533037132900122627);
INSERT INTO `iam_role_path` VALUES (1533038257611129128, 1405414804771971072, 1533037133055311874);
INSERT INTO `iam_role_path` VALUES (1533038257611129129, 1405414804771971072, 1533037133059506177);
INSERT INTO `iam_role_path` VALUES (1533038257611129130, 1405414804771971072, 1533037132778487810);
INSERT INTO `iam_role_path` VALUES (1533038257611129131, 1405414804771971072, 1533037132812042241);
INSERT INTO `iam_role_path` VALUES (1533038257611129132, 1405414804771971072, 1533037132824625153);
INSERT INTO `iam_role_path` VALUES (1533038257611129133, 1405414804771971072, 1533037132954648577);
INSERT INTO `iam_role_path` VALUES (1533038257611129134, 1405414804771971072, 1533037133147586560);
INSERT INTO `iam_role_path` VALUES (1533038257611129135, 1405414804771971072, 1533037133164363778);
INSERT INTO `iam_role_path` VALUES (1533038257611129136, 1405414804771971072, 1533037132799459329);
INSERT INTO `iam_role_path` VALUES (1533038257611129137, 1405414804771971072, 1533037132887539713);
INSERT INTO `iam_role_path` VALUES (1533038257611129138, 1405414804771971072, 1533037133114032128);
INSERT INTO `iam_role_path` VALUES (1533038257611129139, 1405414804771971072, 1533037132807847936);
INSERT INTO `iam_role_path` VALUES (1533038257611129140, 1405414804771971072, 1533037133009174529);
INSERT INTO `iam_role_path` VALUES (1533038257611129141, 1405414804771971072, 1533037133009174531);
INSERT INTO `iam_role_path` VALUES (1533038257611129142, 1405414804771971072, 1533037133051117570);
INSERT INTO `iam_role_path` VALUES (1533038257611129143, 1405414804771971072, 1533037133155975169);
INSERT INTO `iam_role_path` VALUES (1533038257611129144, 1405414804771971072, 1533037132812042242);
INSERT INTO `iam_role_path` VALUES (1533038257611129145, 1405414804771971072, 1533037133072089088);
INSERT INTO `iam_role_path` VALUES (1533038257611129146, 1405414804771971072, 1533037133139197954);
INSERT INTO `iam_role_path` VALUES (1533038257611129147, 1405414804771971072, 1533037132816236545);
INSERT INTO `iam_role_path` VALUES (1533038257611129148, 1405414804771971072, 1533037133139197953);
INSERT INTO `iam_role_path` VALUES (1533038257611129149, 1405414804771971072, 1533037132824625154);
INSERT INTO `iam_role_path` VALUES (1533038257611129150, 1405414804771971072, 1533037132862373888);
INSERT INTO `iam_role_path` VALUES (1533038257611129151, 1405414804771971072, 1533037132883345408);
INSERT INTO `iam_role_path` VALUES (1533038257611129152, 1405414804771971072, 1533037132992397313);
INSERT INTO `iam_role_path` VALUES (1533038257611129153, 1405414804771971072, 1533037133013368833);
INSERT INTO `iam_role_path` VALUES (1533038257611129154, 1405414804771971072, 1533037133034340355);
INSERT INTO `iam_role_path` VALUES (1533038257611129155, 1405414804771971072, 1533037132828819456);
INSERT INTO `iam_role_path` VALUES (1533038257611129156, 1405414804771971072, 1533037132933677058);
INSERT INTO `iam_role_path` VALUES (1533038257611129157, 1405414804771971072, 1533037133135003650);
INSERT INTO `iam_role_path` VALUES (1533038257611129158, 1405414804771971072, 1533037132828819458);
INSERT INTO `iam_role_path` VALUES (1533038257611129159, 1405414804771971072, 1533037133076283392);
INSERT INTO `iam_role_path` VALUES (1533038257611129160, 1405414804771971072, 1533037132833013761);
INSERT INTO `iam_role_path` VALUES (1533038257611129161, 1405414804771971072, 1533037133004980225);
INSERT INTO `iam_role_path` VALUES (1533038257611129162, 1405414804771971072, 1533037132841402368);
INSERT INTO `iam_role_path` VALUES (1533038257611129163, 1405414804771971072, 1533037132853985280);
INSERT INTO `iam_role_path` VALUES (1533038257611129164, 1405414804771971072, 1533037132963037184);
INSERT INTO `iam_role_path` VALUES (1533038257611129165, 1405414804771971072, 1533037133080477697);
INSERT INTO `iam_role_path` VALUES (1533038257611129166, 1405414804771971072, 1533037133084672000);
INSERT INTO `iam_role_path` VALUES (1533038257611129167, 1405414804771971072, 1533037133118226432);
INSERT INTO `iam_role_path` VALUES (1533038257611129168, 1405414804771971072, 1533037133126615040);
INSERT INTO `iam_role_path` VALUES (1533038257611129169, 1405414804771971072, 1533037133126615042);
INSERT INTO `iam_role_path` VALUES (1533038257611129170, 1405414804771971072, 1533037132862373889);
INSERT INTO `iam_role_path` VALUES (1533038257611129171, 1405414804771971072, 1533037132874956800);
INSERT INTO `iam_role_path` VALUES (1533038257611129172, 1405414804771971072, 1533037132967231488);
INSERT INTO `iam_role_path` VALUES (1533038257611129173, 1405414804771971072, 1533037132879151104);
INSERT INTO `iam_role_path` VALUES (1533038257611129174, 1405414804771971072, 1533037133059506176);
INSERT INTO `iam_role_path` VALUES (1533038257611129175, 1405414804771971072, 1533037132883345409);
INSERT INTO `iam_role_path` VALUES (1533038257611129176, 1405414804771971072, 1533037133093060609);
INSERT INTO `iam_role_path` VALUES (1533038257611129177, 1405414804771971072, 1533037133151780864);
INSERT INTO `iam_role_path` VALUES (1533038257611129178, 1405414804771971072, 1533037132883345411);
INSERT INTO `iam_role_path` VALUES (1533038257611129179, 1405414804771971072, 1533037132921094145);
INSERT INTO `iam_role_path` VALUES (1533038257611129180, 1405414804771971072, 1533037132992397314);
INSERT INTO `iam_role_path` VALUES (1533038257611129181, 1405414804771971072, 1533037133055311875);
INSERT INTO `iam_role_path` VALUES (1533038257611129182, 1405414804771971072, 1533037133109837827);
INSERT INTO `iam_role_path` VALUES (1533038257611129183, 1405414804771971072, 1533037133168558081);
INSERT INTO `iam_role_path` VALUES (1533038257611129184, 1405414804771971072, 1533037132891734017);
INSERT INTO `iam_role_path` VALUES (1533038257611129185, 1405414804771971072, 1533037133034340353);
INSERT INTO `iam_role_path` VALUES (1533038257611129186, 1405414804771971072, 1533037132891734018);
INSERT INTO `iam_role_path` VALUES (1533038257611129187, 1405414804771971072, 1533037132979814400);
INSERT INTO `iam_role_path` VALUES (1533038257611129188, 1405414804771971072, 1533037132979814403);
INSERT INTO `iam_role_path` VALUES (1533038257611129189, 1405414804771971072, 1533037133072089091);
INSERT INTO `iam_role_path` VALUES (1533038257611129190, 1405414804771971072, 1533037133088866307);
INSERT INTO `iam_role_path` VALUES (1533038257611129191, 1405414804771971072, 1533037133160169472);
INSERT INTO `iam_role_path` VALUES (1533038257611129192, 1405414804771971072, 1533037133164363779);
INSERT INTO `iam_role_path` VALUES (1533038257611129193, 1405414804771971072, 1533037132895928320);
INSERT INTO `iam_role_path` VALUES (1533038257611129194, 1405414804771971072, 1533037133093060611);
INSERT INTO `iam_role_path` VALUES (1533038257611129195, 1405414804771971072, 1533037132908511234);
INSERT INTO `iam_role_path` VALUES (1533038257611129196, 1405414804771971072, 1533037132916899841);
INSERT INTO `iam_role_path` VALUES (1533038257611129197, 1405414804771971072, 1533037133017563136);
INSERT INTO `iam_role_path` VALUES (1533038257611129198, 1405414804771971072, 1533037132950454273);
INSERT INTO `iam_role_path` VALUES (1533038257611129199, 1405414804771971072, 1533037133118226434);
INSERT INTO `iam_role_path` VALUES (1533038257611129200, 1405414804771971072, 1533037132950454275);
INSERT INTO `iam_role_path` VALUES (1533038257611129201, 1405414804771971072, 1533037133155975170);
INSERT INTO `iam_role_path` VALUES (1533038257611129202, 1405414804771971072, 1533037132967231490);
INSERT INTO `iam_role_path` VALUES (1533038257611129203, 1405414804771971072, 1533037133000785922);
INSERT INTO `iam_role_path` VALUES (1533038257611129204, 1405414804771971072, 1533037133155975172);
INSERT INTO `iam_role_path` VALUES (1533038257611129205, 1405414804771971072, 1533037132984008705);
INSERT INTO `iam_role_path` VALUES (1533038257611129206, 1405414804771971072, 1533037133046923265);
INSERT INTO `iam_role_path` VALUES (1533038257611129207, 1405414804771971072, 1533037133021757441);
INSERT INTO `iam_role_path` VALUES (1533038257611129208, 1405414804771971072, 1533037133067894786);
INSERT INTO `iam_role_path` VALUES (1533038257611129209, 1405414804771971072, 1533037133030146051);
INSERT INTO `iam_role_path` VALUES (1533038257611129210, 1405414804771971072, 1533037133135003649);

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_user_dept
-- ----------------------------
INSERT INTO `iam_user_dept` VALUES (1450088892861501440, 1399985191002447872, 1259383345604300802);
INSERT INTO `iam_user_dept` VALUES (1477996765012533248, 1477990832987361280, 1477977592291053568);
INSERT INTO `iam_user_dept` VALUES (1477997463997489152, 1477997391729631232, 1477978610865197056);
INSERT INTO `iam_user_dept` VALUES (1477997655618461696, 1477997602862505984, 1477978610865197056);
INSERT INTO `iam_user_dept` VALUES (1478741775446118400, 1435967884114194432, 1477978810526650368);
INSERT INTO `iam_user_dept` VALUES (1478741775450312704, 1435967884114194432, 1477978464559484928);
INSERT INTO `iam_user_dept` VALUES (1478741775450312705, 1435967884114194432, 1477978610865197056);

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
INSERT INTO `iam_user_expand_info` VALUES (1399985191002447872, 1, '1996-12-01', '1495331905770315776', '2022-06-04 17:42:28', '2022-06-04 18:35:09', b'0', '2022-01-09 11:36:05', 1, '2021-06-02 15:04:15', 0, '2022-06-04 18:35:09', 140, 0);
INSERT INTO `iam_user_expand_info` VALUES (1414143554414059520, 1, NULL, '1530065639127871488', NULL, '2022-05-27 13:56:02', b'0', NULL, 1, '2021-07-11 16:44:32', 1414143554414059520, '2022-05-27 13:57:32', 2, 0);
INSERT INTO `iam_user_expand_info` VALUES (1435894470432456704, 1, NULL, NULL, NULL, NULL, b'0', NULL, 1399985191002447872, '2021-09-09 17:14:54', 1399985191002447872, '2021-09-09 17:14:54', 0, 0);
INSERT INTO `iam_user_expand_info` VALUES (1435967884114194432, 1, NULL, NULL, NULL, '2022-05-31 15:59:42', b'0', NULL, 1414143554414059520, '2021-09-09 22:06:37', 0, '2022-05-31 15:59:42', 1, 0);
INSERT INTO `iam_user_expand_info` VALUES (1477990832987361280, 1, NULL, NULL, NULL, NULL, b'0', NULL, 1399985191002447872, '2022-01-03 21:10:49', 1399985191002447872, '2022-01-03 21:10:49', 0, 0);
INSERT INTO `iam_user_expand_info` VALUES (1477997391729631232, 1, NULL, NULL, NULL, NULL, b'0', NULL, 1399985191002447872, '2022-01-03 21:36:53', 1399985191002447872, '2022-01-03 21:36:53', 0, 0);
INSERT INTO `iam_user_expand_info` VALUES (1477997602862505984, 1, NULL, NULL, NULL, '2022-06-01 16:51:46', b'0', NULL, 1399985191002447872, '2022-01-03 21:37:43', 0, '2022-06-01 16:51:46', 1, 0);

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
  `client_ids` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关联终端ids',
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
INSERT INTO `iam_user_info` VALUES (1399985191002447872, '小小明', 'xxm', 'f52020dca765fd3943ed40a615dc2c5c', '13300000000', 'xxm1995@outlook.com', '', NULL, NULL, b'1', '2021-06-02 15:04:12', 1, 1, '2021-06-02 15:04:15', 1399985191002447872, '2022-05-18 17:16:57', 47, 0);
INSERT INTO `iam_user_info` VALUES (1414143554414059520, '小小明1995', 'xxm1995', 'f52020dca765fd3943ed40a615dc2c5c', '13000000000', 'xxm1995@foxmail.com', NULL, NULL, NULL, b'1', '2021-07-11 16:44:31', 1, 1, '2021-07-11 16:44:32', 1414143554414059520, '2022-05-27 13:57:33', 3, 0);
INSERT INTO `iam_user_info` VALUES (1435894470432456704, '管理员', 'admin', 'f52020dca765fd3943ed40a615dc2c5c', '13000001111', 'admin@qq.com', '1430430071299207168', '', NULL, b'0', '2021-09-09 17:14:52', 1, 1399985191002447872, '2021-09-09 17:14:54', 1399985191002447872, '2022-06-05 20:26:45', 4, 0);
INSERT INTO `iam_user_info` VALUES (1435967884114194432, '测试', 'test', 'f52020dca765fd3943ed40a615dc2c5c', '13311111111', 'test@qq.com', '1430430071299207168', '', NULL, b'0', '2021-09-09 22:06:37', 1, 1414143554414059520, '2021-09-09 22:06:37', 1399985191002447872, '2022-05-31 15:59:37', 9, 0);
INSERT INTO `iam_user_info` VALUES (1477990832987361280, '测试用户001', 'test001', 'f52020dca765fd3943ed40a615dc2c5c', '', '', '1430430071299207168', '', NULL, b'0', '2022-01-03 21:10:49', 1, 1399985191002447872, '2022-01-03 21:10:49', 1399985191002447872, '2022-06-05 20:26:26', 1, 0);
INSERT INTO `iam_user_info` VALUES (1477997391729631232, '测试用户002', 'test002', 'f52020dca765fd3943ed40a615dc2c5c', '', '', '1430430071299207168', '', NULL, b'0', '2022-01-03 21:36:53', 1, 1399985191002447872, '2022-01-03 21:36:53', 1399985191002447872, '2022-06-05 20:26:19', 1, 0);
INSERT INTO `iam_user_info` VALUES (1477997602862505984, '测试用户003', 'test003', 'f52020dca765fd3943ed40a615dc2c5c', '', '', '1430430071299207168', '', NULL, b'0', '2022-01-03 21:37:43', 1, 1399985191002447872, '2022-01-03 21:37:43', 1399985191002447872, '2022-05-19 13:00:05', 4, 0);

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
INSERT INTO `iam_user_role` VALUES (1533038443724980224, 1435894470432456704, 1405414804771971072);

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

-- ----------------------------
-- Table structure for notice_mail_config
-- ----------------------------
DROP TABLE IF EXISTS `notice_mail_config`;
CREATE TABLE `notice_mail_config`  (
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
-- Records of notice_mail_config
-- ----------------------------

-- ----------------------------
-- Table structure for notice_message_template
-- ----------------------------
DROP TABLE IF EXISTS `notice_message_template`;
CREATE TABLE `notice_message_template`  (
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
-- Records of notice_message_template
-- ----------------------------
INSERT INTO `notice_message_template` VALUES (1424936204932169730, 'cs', '测试', 'hello ${msg}6666666666666666666666666666', 1, '测试模板', 0, '2021-08-10 11:30:40', 0, '2021-08-10 11:30:40', 0, 0);

-- ----------------------------
-- Table structure for notice_site_message
-- ----------------------------
DROP TABLE IF EXISTS `notice_site_message`;
CREATE TABLE `notice_site_message`  (
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
-- Records of notice_site_message
-- ----------------------------
INSERT INTO `notice_site_message` VALUES (1424212599079161857, '测试消息', '测试测试测试', 1399985191002447872, '小小明', 1414143554414059520, 'xxm', '2021-08-08 11:34:11', b'0', NULL, 1399985191002447872, '2021-08-08 11:35:19', 1399985191002447872, '2021-08-08 11:35:19', 0, 0);

-- ----------------------------
-- Table structure for notice_sms_config
-- ----------------------------
DROP TABLE IF EXISTS `notice_sms_config`;
CREATE TABLE `notice_sms_config`  (
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
-- Records of notice_sms_config
-- ----------------------------

-- ----------------------------
-- Table structure for notice_wechat_config
-- ----------------------------
DROP TABLE IF EXISTS `notice_wechat_config`;
CREATE TABLE `notice_wechat_config`  (
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
-- Records of notice_wechat_config
-- ----------------------------
INSERT INTO `notice_wechat_config` VALUES (181361815405135421, 0, 'test01', 'test01', 'ww9d6247559117d202', '8n6A3SzN-DJNkw8wyCcJnr8-SOjFFWSOlBqZN8vypKM', 1, 1415, '2018-11-20 11:07:07', 1415, '2018-11-20 11:07:07', 0, 0);

-- ----------------------------
-- Table structure for order_order
-- ----------------------------
DROP TABLE IF EXISTS `order_order`;
CREATE TABLE `order_order`  (
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
-- Records of order_order
-- ----------------------------

-- ----------------------------
-- Table structure for order_order_billing
-- ----------------------------
DROP TABLE IF EXISTS `order_order_billing`;
CREATE TABLE `order_order_billing`  (
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
-- Records of order_order_billing
-- ----------------------------

-- ----------------------------
-- Table structure for order_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_order_detail`;
CREATE TABLE `order_order_detail`  (
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
-- Records of order_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for order_order_item_billing
-- ----------------------------
DROP TABLE IF EXISTS `order_order_item_billing`;
CREATE TABLE `order_order_item_billing`  (
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
-- Records of order_order_item_billing
-- ----------------------------

-- ----------------------------
-- Table structure for order_order_strategy_mapping
-- ----------------------------
DROP TABLE IF EXISTS `order_order_strategy_mapping`;
CREATE TABLE `order_order_strategy_mapping`  (
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
-- Records of order_order_strategy_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for pay_ali_payment
-- ----------------------------
DROP TABLE IF EXISTS `pay_ali_payment`;
CREATE TABLE `pay_ali_payment`  (
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
-- Records of pay_ali_payment
-- ----------------------------

-- ----------------------------
-- Table structure for pay_alipay_config
-- ----------------------------
DROP TABLE IF EXISTS `pay_alipay_config`;
CREATE TABLE `pay_alipay_config`  (
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
-- Records of pay_alipay_config
-- ----------------------------

-- ----------------------------
-- Table structure for pay_cash_payment
-- ----------------------------
DROP TABLE IF EXISTS `pay_cash_payment`;
CREATE TABLE `pay_cash_payment`  (
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
-- Records of pay_cash_payment
-- ----------------------------

-- ----------------------------
-- Table structure for pay_pay_notify_record
-- ----------------------------
DROP TABLE IF EXISTS `pay_pay_notify_record`;
CREATE TABLE `pay_pay_notify_record`  (
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
-- Records of pay_pay_notify_record
-- ----------------------------

-- ----------------------------
-- Table structure for pay_pay_order_log
-- ----------------------------
DROP TABLE IF EXISTS `pay_pay_order_log`;
CREATE TABLE `pay_pay_order_log`  (
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
-- Records of pay_pay_order_log
-- ----------------------------

-- ----------------------------
-- Table structure for pay_payment
-- ----------------------------
DROP TABLE IF EXISTS `pay_payment`;
CREATE TABLE `pay_payment`  (
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
-- Records of pay_payment
-- ----------------------------

-- ----------------------------
-- Table structure for pay_refund_record
-- ----------------------------
DROP TABLE IF EXISTS `pay_refund_record`;
CREATE TABLE `pay_refund_record`  (
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
-- Records of pay_refund_record
-- ----------------------------

-- ----------------------------
-- Table structure for pay_voucher
-- ----------------------------
DROP TABLE IF EXISTS `pay_voucher`;
CREATE TABLE `pay_voucher`  (
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
-- Records of pay_voucher
-- ----------------------------

-- ----------------------------
-- Table structure for pay_voucher_log
-- ----------------------------
DROP TABLE IF EXISTS `pay_voucher_log`;
CREATE TABLE `pay_voucher_log`  (
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
-- Records of pay_voucher_log
-- ----------------------------

-- ----------------------------
-- Table structure for pay_voucher_payment
-- ----------------------------
DROP TABLE IF EXISTS `pay_voucher_payment`;
CREATE TABLE `pay_voucher_payment`  (
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
-- Records of pay_voucher_payment
-- ----------------------------

-- ----------------------------
-- Table structure for pay_wallet
-- ----------------------------
DROP TABLE IF EXISTS `pay_wallet`;
CREATE TABLE `pay_wallet`  (
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
-- Records of pay_wallet
-- ----------------------------
INSERT INTO `pay_wallet` VALUES (1336489524259352576, 1399985191002447872, 999982.96, 1, NULL, '2022-03-11 21:37:33', 1399985191002447872, '2022-05-03 21:24:04', 29, 0);
INSERT INTO `pay_wallet` VALUES (1502554238582968320, 1414143554414059520, 1019.00, 1, 1399985191002447872, '2022-03-12 15:57:01', 1399985191002447872, '2022-03-13 11:21:10', 2, 0);
INSERT INTO `pay_wallet` VALUES (1502848353136791552, 1435894470432456704, 100.00, 1, 1399985191002447872, '2022-03-13 11:25:44', 1399985191002447872, '2022-03-24 13:22:37', 1, 0);

-- ----------------------------
-- Table structure for pay_wallet_log
-- ----------------------------
DROP TABLE IF EXISTS `pay_wallet_log`;
CREATE TABLE `pay_wallet_log`  (
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
-- Records of pay_wallet_log
-- ----------------------------

-- ----------------------------
-- Table structure for pay_wallet_payment
-- ----------------------------
DROP TABLE IF EXISTS `pay_wallet_payment`;
CREATE TABLE `pay_wallet_payment`  (
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
-- Records of pay_wallet_payment
-- ----------------------------

-- ----------------------------
-- Table structure for pay_wechat_pay_config
-- ----------------------------
DROP TABLE IF EXISTS `pay_wechat_pay_config`;
CREATE TABLE `pay_wechat_pay_config`  (
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
-- Records of pay_wechat_pay_config
-- ----------------------------

-- ----------------------------
-- Table structure for pay_wechat_payment
-- ----------------------------
DROP TABLE IF EXISTS `pay_wechat_payment`;
CREATE TABLE `pay_wechat_payment`  (
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
-- Records of pay_wechat_payment
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
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
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
-- Table structure for sales_activity
-- ----------------------------
DROP TABLE IF EXISTS `sales_activity`;
CREATE TABLE `sales_activity`  (
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
-- Records of sales_activity
-- ----------------------------
INSERT INTO `sales_activity` VALUES (1394892920481533952, '100-16', '100-16活动策略2', NULL, 1394892919403597824, '', '2021-05-18 17:43:59.000000', '2021-07-01 17:44:02.000000', 1, '2021-05-19 13:49:22.757000', 1, '2021-05-19 13:49:22.757000', 0, b'0');
INSERT INTO `sales_activity` VALUES (1394918400265965568, '100-5', '100-5活动策略3', NULL, 1394918398827319296, '', '2021-05-18 17:43:59.000000', '2021-07-01 17:44:02.000000', 1, '2021-05-19 15:30:37.611000', 1, '2021-05-19 15:30:37.611000', 0, b'0');
INSERT INTO `sales_activity` VALUES (1395308738893729792, '50-20', '50-20活动策略3', 1382517531398524928, 1395308573587820544, '', '2021-05-18 17:43:59.000000', '2021-07-01 17:44:02.000000', 1, '2021-05-20 17:21:41.592000', 1, '2021-05-20 17:21:41.592000', 0, b'0');

-- ----------------------------
-- Table structure for sales_check_rule
-- ----------------------------
DROP TABLE IF EXISTS `sales_check_rule`;
CREATE TABLE `sales_check_rule`  (
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
-- Records of sales_check_rule
-- ----------------------------

-- ----------------------------
-- Table structure for sales_coupon
-- ----------------------------
DROP TABLE IF EXISTS `sales_coupon`;
CREATE TABLE `sales_coupon`  (
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠券' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sales_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for sales_coupon_template
-- ----------------------------
DROP TABLE IF EXISTS `sales_coupon_template`;
CREATE TABLE `sales_coupon_template`  (
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
-- Records of sales_coupon_template
-- ----------------------------
INSERT INTO `sales_coupon_template` VALUES (1395284918623424512, '100-33', 1395284918430486528, '100-33优惠券', 999, NULL, '', '', 0, 1, NULL, NULL, NULL, 1, '2021-05-20 15:47:02.397000', 1, '2021-05-20 15:58:10.795000', 1, b'0');
INSERT INTO `sales_coupon_template` VALUES (1395320423364841472, '100-33', 1395320422941216768, '100-33优惠券', 988, NULL, '', '', 0, 1, NULL, NULL, NULL, 1, '2021-05-20 18:08:07.387000', 1, '2021-05-20 18:28:33.743000', 12, b'0');

-- ----------------------------
-- Table structure for sales_match_rule
-- ----------------------------
DROP TABLE IF EXISTS `sales_match_rule`;
CREATE TABLE `sales_match_rule`  (
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
-- Records of sales_match_rule
-- ----------------------------

-- ----------------------------
-- Table structure for sales_strategy
-- ----------------------------
DROP TABLE IF EXISTS `sales_strategy`;
CREATE TABLE `sales_strategy`  (
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
-- Records of sales_strategy
-- ----------------------------
INSERT INTO `sales_strategy` VALUES (1382516141636866048, 'instantReduction', '立减策略', '立减指定的金额', 1, 1, NULL, 1, 1, 1, '2021-04-15 10:08:28.720000', 1, '2021-04-15 10:08:28.720000', 0, b'0', 10011);
INSERT INTO `sales_strategy` VALUES (1382517531398524928, 'fullReduction', '满减策略', '满减策略', 1, 1, NULL, 1, 1, 1, '2021-04-15 10:14:00.075000', 1, '2021-04-15 10:14:00.075000', 0, b'0', 10011);
INSERT INTO `sales_strategy` VALUES (1394909889247203328, 'channelCheck', '渠道检查', '渠道检查', 1, 2, NULL, 1, 1, 1, '2021-05-19 14:56:48.426000', 1, '2021-05-19 14:56:48.426000', 0, b'0', 10011);
INSERT INTO `sales_strategy` VALUES (1395320340615417856, 'obtainMultiple', '多张领取检查', '多张领取检查', 1, 3, '', NULL, 1, 1, '2021-05-20 18:07:47.642000', 1, '2021-05-20 18:07:47.642000', 0, b'0', 10011);

-- ----------------------------
-- Table structure for sales_strategy_check_rule
-- ----------------------------
DROP TABLE IF EXISTS `sales_strategy_check_rule`;
CREATE TABLE `sales_strategy_check_rule`  (
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
-- Records of sales_strategy_check_rule
-- ----------------------------

-- ----------------------------
-- Table structure for sales_strategy_config
-- ----------------------------
DROP TABLE IF EXISTS `sales_strategy_config`;
CREATE TABLE `sales_strategy_config`  (
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
-- Records of sales_strategy_config
-- ----------------------------
INSERT INTO `sales_strategy_config` VALUES (1382517531788595199, 1382516141636866048, 'BigDecimal', 'amount', '立减金额', '立减金额', 1, '2021-04-15 10:08:28.873000', 1, '2021-04-15 10:08:28.873000', 0, b'0');
INSERT INTO `sales_strategy_config` VALUES (1382517531788595200, 1382517531398524928, 'BigDecimal', 'satisfy', '满多少', '配置满多少的字段', 1, '2021-04-15 10:14:00.169000', 1, '2021-04-15 10:14:00.169000', 0, b'0');
INSERT INTO `sales_strategy_config` VALUES (1382517531788595201, 1382517531398524928, 'BigDecimal', 'minus', '减多少', '配置减多少的字段', 1, '2021-04-15 10:14:00.169000', 1, '2021-04-15 10:14:00.169000', 0, b'0');

-- ----------------------------
-- Table structure for sales_strategy_config_value
-- ----------------------------
DROP TABLE IF EXISTS `sales_strategy_config_value`;
CREATE TABLE `sales_strategy_config_value`  (
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '策略配置参数' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sales_strategy_config_value
-- ----------------------------

-- ----------------------------
-- Table structure for sales_strategy_register
-- ----------------------------
DROP TABLE IF EXISTS `sales_strategy_register`;
CREATE TABLE `sales_strategy_register`  (
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '策略注册' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sales_strategy_register
-- ----------------------------

-- ----------------------------
-- Table structure for starter_audit_data_version
-- ----------------------------
DROP TABLE IF EXISTS `starter_audit_data_version`;
CREATE TABLE `starter_audit_data_version`  (
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
-- Records of starter_audit_data_version
-- ----------------------------
INSERT INTO `starter_audit_data_version` VALUES (1480550993828446208, 'client', '1', '{\"dataName\":\"client\",\"dataId\":\"1\",\"dataContent\":{\"id\":\"1\",\"creator\":null,\"createTime\":\"2022-01-10 22:43:58\",\"lastModifier\":null,\"lastModifiedTime\":null,\"deleted\":false,\"version\":0,\"code\":null,\"name\":null,\"timeout\":null,\"captcha\":false,\"enable\":false,\"description\":null}}', 1, 0, '2022-01-10 22:43:59');
INSERT INTO `starter_audit_data_version` VALUES (1480551021779288064, 'client', '1', '{\"dataName\":\"client\",\"dataId\":\"1\",\"dataContent\":{\"id\":\"1\",\"creator\":null,\"createTime\":\"2022-01-10 22:44:05\",\"lastModifier\":null,\"lastModifiedTime\":null,\"deleted\":false,\"version\":0,\"code\":null,\"name\":null,\"timeout\":null,\"captcha\":false,\"enable\":false,\"description\":null}}', 2, 0, '2022-01-10 22:44:06');

-- ----------------------------
-- Table structure for starter_audit_login_log
-- ----------------------------
DROP TABLE IF EXISTS `starter_audit_login_log`;
CREATE TABLE `starter_audit_login_log`  (
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
-- Records of starter_audit_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for starter_audit_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `starter_audit_operate_log`;
CREATE TABLE `starter_audit_operate_log`  (
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
-- Records of starter_audit_operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for starter_file_upload_info
-- ----------------------------
DROP TABLE IF EXISTS `starter_file_upload_info`;
CREATE TABLE `starter_file_upload_info`  (
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
-- Records of starter_file_upload_info
-- ----------------------------
INSERT INTO `starter_file_upload_info` VALUES (1495330622946631680, NULL, 'blob', 'jpg', 'jpg', 68, '62120ac9efeec06e2275fc52', 1399985191002447872, '2022-02-20 17:32:57');
INSERT INTO `starter_file_upload_info` VALUES (1495331213525606400, NULL, 'blob', 'jpg', 'jpg', 68, '62120b55efeec06e2275fc54', 1399985191002447872, '2022-02-20 17:35:28');
INSERT INTO `starter_file_upload_info` VALUES (1495331812178616320, NULL, 'blob', 'jpg', 'jpg', 74, '62120be4efeec06e2275fc56', 1399985191002447872, '2022-02-20 17:37:43');
INSERT INTO `starter_file_upload_info` VALUES (1495331905770315776, NULL, 'blob', 'jpg', 'jpg', 76, '62120bfaefeec06e2275fc58', 1399985191002447872, '2022-02-20 17:38:03');
INSERT INTO `starter_file_upload_info` VALUES (1530065639127871488, NULL, 'blob', 'jpg', 'jpg', 83, '6290684abf0e90583f414dcf', 1414143554414059520, '2022-05-27 13:57:31');

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
INSERT INTO `starter_quartz_job` VALUES (1456579473573867520, '测试任务', 'cn.bootx.starter.quartz.task.TestTask', '* * * * * ?', '{\"aaa\":\"5255\"}', 0, '测试任务', 1399985191002447872, '2021-11-05 19:09:43', 1399985191002447872, '2022-05-26 15:37:35', 22, 0);

-- ----------------------------
-- Table structure for starter_quartz_job_log
-- ----------------------------
DROP TABLE IF EXISTS `starter_quartz_job_log`;
CREATE TABLE `starter_quartz_job_log`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `handler_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理器名称',
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理器全限定名',
  `success` bit(1) NOT NULL COMMENT '是否执行成功',
  `error_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `duration` bigint(255) NULL DEFAULT NULL COMMENT '执行时长',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务执行日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of starter_quartz_job_log
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;