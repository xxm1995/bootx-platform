/*
 Navicat Premium Data Transfer

 Source Server Type    : MySQL

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 22/08/2022 13:53:51
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
INSERT INTO `base_dict` VALUES (1546757092010078208, 'PayNotifyProcess', '支付回调处理状态', '支付服务', '成功/忽略/失败', 1399985191002447872, '2022-07-12 15:23:23', 1399985191002447872, '2022-07-12 15:23:53', 0, 1);
INSERT INTO `base_dict` VALUES (1556996322223968256, 'WeChatMediaType', '微信媒体类型', '微信', '微信媒体类型', 1399985191002447872, '2022-08-09 21:30:25', 1399985191002447872, '2022-08-09 21:30:26', 0, 0);
INSERT INTO `base_dict` VALUES (1561003021674987520, 'SiteMessageReceive', '消息接收类型', '站内信', '站内信接收类型', 1399985191002447872, '2022-08-20 22:51:37', 1399985191002447872, '2022-08-20 22:51:37', 0, 0);
INSERT INTO `base_dict` VALUES (1561003189111603200, 'SiteMessageState', '消息发布状态', '站内信', '站内信消息发布状态', 1399985191002447872, '2022-08-20 22:52:17', 1399985191002447872, '2022-08-20 22:52:17', 0, 0);

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
INSERT INTO `base_dict_item` VALUES (1546757293592522752, 1546757092010078208, 'PayNotifyProcess', '0', '失败', 0.00, '', 1399985191002447872, '2022-07-12 15:24:11', 1399985191002447872, '2022-07-12 15:24:11', 0, 0);
INSERT INTO `base_dict_item` VALUES (1546757327901929472, 1546757092010078208, 'PayNotifyProcess', '1', '成功', -1.00, '', 1399985191002447872, '2022-07-12 15:24:19', 1399985191002447872, '2022-07-12 15:31:38', 0, 2);
INSERT INTO `base_dict_item` VALUES (1546757375637303296, 1546757092010078208, 'PayNotifyProcess', '2', '忽略', 0.00, '', 1399985191002447872, '2022-07-12 15:24:30', 1399985191002447872, '2022-07-12 15:24:30', 0, 0);
INSERT INTO `base_dict_item` VALUES (1556996422006460416, 1556996322223968256, 'WeChatMediaType', 'news', '新闻', 0.00, '', 1399985191002447872, '2022-08-09 21:30:49', 1399985191002447872, '2022-08-09 21:30:49', 1, 0);
INSERT INTO `base_dict_item` VALUES (1556996472661069824, 1556996322223968256, 'WeChatMediaType', 'voice', '语音', 0.00, '', 1399985191002447872, '2022-08-09 21:31:01', 1399985191002447872, '2022-08-09 21:31:01', 0, 0);
INSERT INTO `base_dict_item` VALUES (1556996501417218048, 1556996322223968256, 'WeChatMediaType', 'image', '图片', 0.00, '', 1399985191002447872, '2022-08-09 21:31:08', 1399985191002447872, '2022-08-09 21:31:08', 0, 0);
INSERT INTO `base_dict_item` VALUES (1556996529565192192, 1556996322223968256, 'WeChatMediaType', 'video', '视频', 0.00, '', 1399985191002447872, '2022-08-09 21:31:15', 1399985191002447872, '2022-08-09 21:31:15', 0, 0);
INSERT INTO `base_dict_item` VALUES (1561003235710320640, 1561003189111603200, 'SiteMessageState', 'user', '指定用户', 0.00, '', 1399985191002447872, '2022-08-20 22:52:28', 1399985191002447872, '2022-08-20 22:52:28', 1, 0);
INSERT INTO `base_dict_item` VALUES (1561003279322693632, 1561003189111603200, 'SiteMessageState', 'all', '全部用户', 0.00, '', 1399985191002447872, '2022-08-20 22:52:38', 1399985191002447872, '2022-08-20 22:52:39', 1, 0);
INSERT INTO `base_dict_item` VALUES (1561003368762032128, 1561003021674987520, 'SiteMessageReceive', 'user', '指定用户', 0.00, '', 1399985191002447872, '2022-08-20 22:53:00', 1399985191002447872, '2022-08-20 22:53:00', 0, 0);
INSERT INTO `base_dict_item` VALUES (1561003399778910208, 1561003021674987520, 'SiteMessageReceive', 'all', '全部用户', 0.00, '', 1399985191002447872, '2022-08-20 22:53:07', 1399985191002447872, '2022-08-20 22:53:24', 0, 1);
INSERT INTO `base_dict_item` VALUES (1561003539772194816, 1561003189111603200, 'SiteMessageState', 'sent', '已发送', 0.00, '', 1399985191002447872, '2022-08-20 22:53:41', 1399985191002447872, '2022-08-20 22:53:41', 0, 0);
INSERT INTO `base_dict_item` VALUES (1561003575608328192, 1561003189111603200, 'SiteMessageState', 'cancel', '撤销', 0.00, '', 1399985191002447872, '2022-08-20 22:53:49', 1399985191002447872, '2022-08-20 22:53:49', 0, 0);
INSERT INTO `base_dict_item` VALUES (1561245469535080448, 1561003189111603200, 'SiteMessageState', 'draft', '草稿', 0.00, '', 1399985191002447872, '2022-08-21 14:55:01', 1399985191002447872, '2022-08-21 14:55:01', 0, 0);

-- ----------------------------
-- Table structure for base_dynamic_form
-- ----------------------------
DROP TABLE IF EXISTS `base_dynamic_form`;
CREATE TABLE `base_dynamic_form`  (
                                      `id` bigint(20) NOT NULL,
                                      `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表单名称',
                                      `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表单键名',
                                      `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '表单内容',
                                      `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                                      `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
                                      `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                      `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
                                      `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                      `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
                                      `version` int(8) NOT NULL COMMENT '版本',
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '动态表单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_dynamic_form
-- ----------------------------

-- ----------------------------
-- Table structure for base_key_value
-- ----------------------------
DROP TABLE IF EXISTS `base_key_value`;
CREATE TABLE `base_key_value`  (
                                   `id` bigint(20) NOT NULL,
                                   `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数键名',
                                   `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数值',
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
INSERT INTO `base_param` VALUES (1500338438182789120, '结算台聚合支付请求地址', 'CashierAggregateUrl', 'http://127.0.0.1/api/', 1, b'1', '', 1399985191002447872, '2022-03-06 13:12:13', 1399985191002447872, '2022-05-01 15:03:03', 0, 3);
INSERT INTO `base_param` VALUES (1520668030248361984, '文件服务器地址', 'FileServerUrl', 'http://127.0.0.1:9999', 1, b'1', '', 1399985191002447872, '2022-05-01 15:34:46', 1399985191002447872, '2022-05-19 12:53:21', 0, 5);
INSERT INTO `base_param` VALUES (1529281530059161600, 'websocket服务器地址', 'WebsocketServerUrl', 'ws://127.0.0.1:9999', 1, b'1', '', 1399985191002447872, '2022-05-25 10:01:44', 1399985191002447872, '2022-05-25 10:01:44', 0, 0);
INSERT INTO `base_param` VALUES (1545765299880448000, '服务器地址', 'ServerUrl', 'http://127.0.0.1:9999', 1, b'1', '', 1399985191002447872, '2022-07-09 21:42:21', 1399985191002447872, '2022-07-09 21:42:21', 0, 0);
INSERT INTO `base_param` VALUES (1547511252795912192, '微信jsapi支付回调服务地址', 'JsapiRedirectUrl', 'http://127.0.0.1/api/', 1, b'1', '', 1414143554414059520, '2022-07-14 17:20:09', 1414143554414059520, '2022-07-14 17:20:09', 0, 0);


-- ----------------------------
-- Table structure for bpm_instance
-- ----------------------------
DROP TABLE IF EXISTS `bpm_instance`;
CREATE TABLE `bpm_instance`  (
                                 `id` bigint(20) NOT NULL,
                                 `instance_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '流程实例的id',
                                 `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '流程标题',
                                 `def_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '流程定义ID',
                                 `def_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '流程定义名称',
                                 `start_user_id` bigint(20) NULL DEFAULT NULL COMMENT '发起人',
                                 `start_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '发起人名称',
                                 `state` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '流程实例的状态',
                                 `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
                                 `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
                                 `form_variables` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '提交的表单值',
                                 `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
                                 `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                 `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
                                 `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                 `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
                                 `version` int(8) NULL DEFAULT NULL COMMENT '版本',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '流程实例扩展' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bpm_model
-- ----------------------------
DROP TABLE IF EXISTS `bpm_model`;
CREATE TABLE `bpm_model`  (
                              `id` bigint(20) NOT NULL,
                              `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
                              `model_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '流程类型',
                              `form_id` bigint(20) NULL DEFAULT NULL COMMENT '关联表单',
                              `publish` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '发布状态',
                              `enable` bit(1) NULL DEFAULT NULL COMMENT '启用状态',
                              `deploy_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '部署id',
                              `def_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '流程定义id',
                              `def_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '流程key',
                              `def_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '流程名称',
                              `def_remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '流程备注',
                              `main_process` bit(1) NULL DEFAULT NULL COMMENT '是否主流程',
                              `process_version` int(8) NULL DEFAULT NULL COMMENT '流程版本号',
                              `model_editor_xml` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '流程xml',
                              `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
                              `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
                              `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                              `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
                              `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                              `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
                              `version` int(8) NULL DEFAULT NULL COMMENT '版本',
                              PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '流程模型' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bpm_model_task
-- ----------------------------
DROP TABLE IF EXISTS `bpm_model_task`;
CREATE TABLE `bpm_model_task`  (
                                   `id` bigint(20) NOT NULL,
                                   `model_id` bigint(20) NOT NULL COMMENT '关联模型id',
                                   `def_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '流程定义id',
                                   `def_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '流程key',
                                   `task_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务节点id',
                                   `task_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务节点名称',
                                   `multi` bit(1) NOT NULL COMMENT '是否会签',
                                   `form_id` bigint(20) NULL DEFAULT NULL COMMENT '关联表单',
                                   `assign_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '分配类型',
                                   `user_id` bigint(20) NULL DEFAULT NULL COMMENT '分配的用户id',
                                   `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '分配的用户名称',
                                   `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
                                   `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                   `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
                                   `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                   `version` int(8) NULL DEFAULT NULL COMMENT '版本',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '模型任务节点配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bpm_task
-- ----------------------------
DROP TABLE IF EXISTS `bpm_task`;
CREATE TABLE `bpm_task`  (
                             `id` bigint(20) NOT NULL,
                             `task_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务ID',
                             `execution_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务执行 ID',
                             `instance_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '流程实例的id',
                             `instance_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '流程名称(业务标题)',
                             `def_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '流程定义名称',
                             `task_node_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务节点id',
                             `task_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务节点名称',
                             `state` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '流程任务的状态',
                             `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
                             `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
                             `user_id` bigint(20) NULL DEFAULT NULL COMMENT '当前处理人',
                             `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '当前处理人',
                             `start_user_id` bigint(20) NULL DEFAULT NULL COMMENT '发起人',
                             `start_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '发起人名称',
                             `form_variables` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '提交的表单值',
                             `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
                             `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                             `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
                             `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                             `version` int(8) NULL DEFAULT NULL COMMENT '版本',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '流程任务扩展' ROW_FORMAT = DYNAMIC;


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
                               `enable` bit(1) NOT NULL COMMENT '是否可用',
                               `login_type_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '关联登录方式\r\n',
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
INSERT INTO `iam_client` VALUES (1430430071299207168, 'admin', 'pc管理端', b'1', b'1', '1430430071299207168,1435138582839009280,1430478946919653376,1542091599907115008,1542804450312122368,1543126042909016064', 'pc浏览器', 1399985191002447872, '2021-08-25 15:21:20', 1399985191002447872, '2022-07-02 14:55:11', 4, 0);
INSERT INTO `iam_client` VALUES (1430430071299207169, 'h5', 'h5端', b'1', b'1', '1430430071299207168,1435138582839009280', '手机wap', 1399985191002447872, '2021-08-25 15:21:20', 1399985191002447872, '2022-06-29 18:31:45', 1, 0);

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
-- Table structure for iam_login_type
-- ----------------------------
DROP TABLE IF EXISTS `iam_login_type`;
CREATE TABLE `iam_login_type`  (
                                   `id` bigint(20) NOT NULL,
                                   `code` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码',
                                   `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
                                   `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
                                   `system` bit(1) NOT NULL COMMENT '是否系统内置',
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登录方式' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_login_type
-- ----------------------------
INSERT INTO `iam_login_type` VALUES (1430430071299207168, 'password', '账号密码登陆', 'password', b'1', 3600, b'0', -1, b'1', NULL, 1399985191002447872, '2021-08-25 15:21:20', 1399985191002447872, '2022-04-24 19:51:13', 16, 0);
INSERT INTO `iam_login_type` VALUES (1430478946919653376, 'miniApp', '微信小程序', 'openId', b'0', 99999, b'0', 0, b'1', NULL, 1399985191002447872, '2021-08-25 18:35:33', 1399985191002447872, '2022-07-16 12:32:26', 3, 0);
INSERT INTO `iam_login_type` VALUES (1435138582839009280, 'phone', '手机短信登录', 'openId', b'0', 3600, b'0', 0, b'1', NULL, 1399985191002447872, '2021-09-07 15:11:16', 1399985191002447872, '2022-07-16 12:32:19', 5, 0);
INSERT INTO `iam_login_type` VALUES (1542091599907115008, 'dingTalk', '钉钉', 'openId', b'0', 5, b'0', -1, b'1', '', 1399985191002447872, '2022-06-29 18:24:23', 1399985191002447872, '2022-07-02 14:55:01', 5, 0);
INSERT INTO `iam_login_type` VALUES (1542804450312122368, 'weCom', '企业微信', 'openId', b'0', 5, b'0', -1, b'1', '', 1399985191002447872, '2022-07-01 17:37:00', 1399985191002447872, '2022-07-01 17:37:00', 0, 0);
INSERT INTO `iam_login_type` VALUES (1543126042909016064, 'weChat', '微信登录', 'openId', b'0', 5, b'0', -1, b'1', '', 1399985191002447872, '2022-07-02 14:54:53', 1399985191002447872, '2022-08-05 18:11:13', 1, 0);

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
INSERT INTO `iam_perm_menu` VALUES (1414596052497092608, 'admin', NULL, '系统管理', 'system', '', NULL, 'desktop', b'0', b'0', 'RouteView', '', '/system', '/system/user', -99999, 0, b'0', b'1', b'0', b'0', b'1', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2021-08-27 10:02:16', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1414596647509446656, 'admin', 1452569691537256448, '用户管理', 'User', '', NULL, '', b'0', b'0', 'system/user/UserList', '', '/system/userAuth/user', '', 0, 1, b'0', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2021-08-27 10:17:40', 4, 0);
INSERT INTO `iam_perm_menu` VALUES (1414596773275652096, 'admin', 1414596052497092608, '菜单管理', 'Menu', '', NULL, '', b'0', b'0', 'system/menu/MenuList', '', '/system/permission/menu', '', 0, 1, b'0', b'1', b'0', b'0', b'1', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2021-08-26 23:56:16', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1414596805538238464, 'admin', 1452569339987472384, '角色管理', 'Role', '', NULL, '', b'0', b'0', 'system/role/RoleList', '', '/system/permission/role', '', 0, 1, b'1', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2021-08-26 23:56:04', 4, 0);
INSERT INTO `iam_perm_menu` VALUES (1414596842322284544, 'admin', 1452569691537256448, '部门管理', 'Dept', '', NULL, '', b'0', b'0', 'system/dept/DeptList', '', '/system/userAuth/dept', '', 0, 1, b'1', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2021-08-26 23:56:31', 7, 0);
INSERT INTO `iam_perm_menu` VALUES (1414596877617352704, 'admin', 1452571269199540224, '数据字典', 'Dict', '', b'0', '', b'0', b'0', 'system/dict/DictList', '', '/system/config/dict', '', 0, 1, b'1', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2022-05-19 09:04:55', 11, 0);
INSERT INTO `iam_perm_menu` VALUES (1431082258161434624, 'admin', 1452569691537256448, '在线用户管理', 'OnlineUser', '', NULL, '', b'0', b'0', 'system/online/OnlineUserList', NULL, '/system/userAuth/online', '', 0, 1, b'1', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 10:32:53', 1399985191002447872, '2021-08-27 10:32:53', 6, 0);
INSERT INTO `iam_perm_menu` VALUES (1431083330909208576, 'admin', 1541427353886859264, '登录方式', 'LoginType', '', b'0', '', b'0', b'0', 'system/client/LoginTypeList', NULL, '/system/config/loginType', '', 9, 1, b'1', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 10:37:09', 1399985191002447872, '2022-07-05 21:18:12', 11, 0);
INSERT INTO `iam_perm_menu` VALUES (1431089129232498688, 'admin', 1452569339987472384, '请求权限管理', 'Path', '', NULL, '', b'0', b'0', 'system/path/PathList', NULL, '/system/permission/path', '', 0, 1, b'1', b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 11:00:11', 1399985191002447872, '2021-08-27 11:00:11', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1431152689832525824, 'admin', NULL, '系统监控', 'monitor', '', b'0', 'radar-chart', b'0', b'0', 'RouteView', NULL, '/monitor', '', 0, 0, b'1', b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2021-08-27 15:12:45', 1399985191002447872, '2022-06-17 17:57:30', 21, 0);
INSERT INTO `iam_perm_menu` VALUES (1431153358157348864, 'admin', 1431152689832525824, '接口文档', 'ApiSwagger', '', b'0', '', b'0', b'0', '', NULL, 'http://127.0.0.1:9999/doc.html', '', 0, 1, b'1', b'1', b'1', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 15:15:25', 1399985191002447872, '2022-06-07 11:06:52', 15, 0);
INSERT INTO `iam_perm_menu` VALUES (1435143678721236992, 'admin', 1452567897717321728, '登录日志', 'LoginLog', '', NULL, '', b'0', b'0', 'starter/log/LoginLogList', NULL, '/system/log/loginLog', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-07 15:31:31', 1399985191002447872, '2021-09-07 15:31:31', 5, 0);
INSERT INTO `iam_perm_menu` VALUES (1435476255797624832, 'admin', 1452567897717321728, '操作日志', 'OperateLog', '', NULL, '', b'0', b'0', 'starter/log/OperateLogList', NULL, '/system/log/OperateLog', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-08 13:33:04', 1399985191002447872, '2021-09-08 13:33:04', 7, 0);
INSERT INTO `iam_perm_menu` VALUES (1438061887002759168, 'admin', NULL, '通知管理', 'notice', '', NULL, 'message', b'0', b'0', 'RouteView', NULL, '/notice', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-15 16:47:26', 1399985191002447872, '2021-09-15 16:47:26', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1438072357281542144, 'admin', 1438061887002759168, '邮件配置', 'MailConfig', '', NULL, '', b'0', b'0', 'notice/mail/MailConfigList', NULL, '/notice/mailConfig', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-15 17:29:03', 1399985191002447872, '2021-09-15 17:29:03', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1439196893514031104, 'admin', 1438061887002759168, '消息模板', 'MessageTemplate', '', NULL, '', b'0', b'0', 'notice/template/TemplateList', NULL, '/notice/template', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-18 19:57:33', 1399985191002447872, '2021-09-18 19:57:33', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1440216178722050048, 'admin', 1438061887002759168, '钉钉', 'DingTalk', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/notice/dingTalk', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-21 15:27:50', 1399985191002447872, '2021-09-21 15:27:50', 0, 1);
INSERT INTO `iam_perm_menu` VALUES (1440216612211757056, 'admin', 1450822511087271936, '钉钉机器人', 'DingTalkRobot', '', b'0', '', b'0', b'0', 'third/dingtalk/robot/DingRobotConfigList', NULL, '/third/dingTalk/robot', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-09-21 15:29:33', 1399985191002447872, '2022-07-26 13:34:35', 5, 0);
INSERT INTO `iam_perm_menu` VALUES (1450473063320526848, 'admin', 1452569691537256448, '第三方登录', 'Social', '', b'0', '', b'1', b'0', 'system/social/SocialList', NULL, '/system/userAuth/social', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-19 22:45:01', 1399985191002447872, '2022-07-26 13:35:47', 5, 0);
INSERT INTO `iam_perm_menu` VALUES (1450803906215886848, 'admin', 1452571269199540224, '定时任务', 'QuartzJobList', '', NULL, '', b'0', b'0', 'starter/quartz/QuartzJobList', NULL, '/system/config/quartz', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 20:39:41', 1399985191002447872, '2021-10-20 20:39:41', 5, 0);
INSERT INTO `iam_perm_menu` VALUES (1450819607680991232, 'admin', NULL, '第三方对接', 'third', '', b'0', 'branches', b'0', b'0', 'RouteView', NULL, '/third', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:42:04', 1399985191002447872, '2022-07-26 13:34:02', 4, 0);
INSERT INTO `iam_perm_menu` VALUES (1450821723027881984, 'admin', 1450819607680991232, '微信', 'WeChat', '', b'0', '', b'0', b'0', 'RouteView', NULL, '/third/wechat', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:50:28', 1399985191002447872, '2022-08-03 23:23:10', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1450821877831254016, 'admin', 1450819607680991232, '企业微信', 'WeCom', '', b'0', '', b'0', b'0', 'RouteView', NULL, '/third/wecom', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:51:05', 1399985191002447872, '2022-08-03 23:22:58', 4, 0);
INSERT INTO `iam_perm_menu` VALUES (1450822511087271936, 'admin', 1450819607680991232, '钉钉', 'DingTalk', '', b'0', '', b'0', b'0', 'RouteView', NULL, '/third/dingtalk', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:53:36', 1399985191002447872, '2022-08-03 23:23:29', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1450822842995130368, 'admin', NULL, '支付管理', 'PayManager', '', NULL, 'pay-circle', b'0', b'0', 'RouteView', NULL, '/payment', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:54:55', 1399985191002447872, '2021-10-20 21:54:55', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1450823960236081152, 'admin', 1450822842995130368, '支付通道', 'PayChannel', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/payment/channel', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:59:22', 1399985191002447872, '2021-10-20 21:59:22', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1450824117849636864, 'admin', 1450823960236081152, '支付宝', 'AliPayConfig', '', NULL, '', b'0', b'0', 'payment/channel/alipay/AliPayConfigList', NULL, '/payment/channel/alipay', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 21:59:59', 1399985191002447872, '2021-10-20 21:59:59', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1450824319868289024, 'admin', 1450823960236081152, '微信支付', 'WeChatPayConfig', '', NULL, '', b'0', b'0', 'payment/channel/wechat/WeChatConfigList', NULL, '/payment/channel/wechat', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:00:48', 1399985191002447872, '2021-10-20 22:00:48', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1450824637876224000, 'admin', 1450823960236081152, '云闪付', 'UnionPayConfig', '', b'0', '', b'0', b'0', 'payment/channel/unionpay/UnionPayConfigList', NULL, '/payment/channel/unionpay', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:02:03', 1399985191002447872, '2022-03-04 16:12:13', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1450824875198332928, 'admin', 1450823960236081152, '现金支付', 'CashPayConfig', '', b'0', '', b'1', b'0', '', NULL, '/payment/channel/cash', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:03:00', 1399985191002447872, '2022-03-04 16:12:08', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1450825488577544192, 'admin', 1546850918849249280, '收银台', 'PayCashier', '', b'0', '', b'0', b'0', 'payment/cashier/Cashier', NULL, '/demo/pay/cashier', '', -1, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:05:26', 1399985191002447872, '2022-07-12 21:37:22', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1450825615857893376, 'admin', 1450822842995130368, '订单管理', 'PayOrder', '', NULL, '', b'0', b'0', 'RouteView', NULL, '/payment/order', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:05:57', 1399985191002447872, '2021-10-20 22:05:57', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1450825819436826624, 'admin', 1450822842995130368, '回调记录', 'PayNotify', '', NULL, '', b'0', b'0', 'payment/notify/PayNotifyRecordList', NULL, '/payment/notify', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:06:45', 1399985191002447872, '2021-10-20 22:06:45', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1450826890318135296, 'admin', 1450825615857893376, '支付订单', 'PaymentOrder', '', b'0', '', b'0', b'0', 'payment/order/payment/PaymentList', NULL, '/payment/order/payment', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:11:00', 1399985191002447872, '2022-02-25 15:17:07', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1450827159626006528, 'admin', 1450825615857893376, '退款订单', 'ReturnOrder', '', b'0', '', b'0', b'0', 'payment/order/refund/RefundRecordList', NULL, '/payment/order/return', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:12:05', 1399985191002447872, '2022-03-04 15:44:06', 4, 0);
INSERT INTO `iam_perm_menu` VALUES (1450827308515409920, 'admin', 1450825615857893376, '转账订单', 'TransferOrder', '', b'0', '', b'1', b'0', 'payment/order/transfer/TransferList', NULL, '/payment/order/transfer', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:12:40', 1399985191002447872, '2022-03-04 15:33:31', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1450827660459458560, 'admin', 1438061887002759168, '微信', 'NoticeWeChat', '', b'0', '', b'0', b'0', 'Dev', NULL, '/notice/wechat', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-10-20 22:14:04', 1399985191002447872, '2022-06-21 20:53:04', 1, 1);
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
INSERT INTO `iam_perm_menu` VALUES (1490984296616263680, 'admin', 1552207982510706688, '文件管理', 'FIleUpLoad', NULL, b'0', '', b'0', b'0', 'develop/file/FileUploadList', NULL, '/develop/file', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-02-08 17:42:12', 1399985191002447872, '2022-07-28 09:16:56', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1495013564652429312, 'admin', 1552207982510706688, '代码生成', 'CodeGen', NULL, b'0', '', b'0', b'0', 'develop/codegen/CodeGenList', NULL, '/develop/codegen', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-02-19 20:33:04', 1399985191002447872, '2022-07-27 16:25:05', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1495968302034210816, 'admin', NULL, '功能演示', 'Demo', NULL, b'0', 'block', b'0', b'0', 'RouteView', NULL, '/demo', '', 99, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-02-22 11:46:52', 1399985191002447872, '2022-05-10 11:02:05', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1495969099987963904, 'admin', 1495968302034210816, '数据相关', 'DemoData', NULL, b'0', '', b'0', b'0', 'RouteView', NULL, '/demo/data', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-02-22 11:50:02', 1399985191002447872, '2022-03-24 16:27:46', 4, 0);
INSERT INTO `iam_perm_menu` VALUES (1496020308992143360, 'admin', 1495968302034210816, '超级查询', 'SuperQueryDemo', NULL, b'0', '', b'0', b'0', 'demo/query/SuperQueryDemoList', NULL, '/demo/query/super', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-02-22 15:13:31', 1399985191002447872, '2022-05-27 17:34:41', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1501740492360962048, 'admin', 1450822842995130368, '钱包管理', 'Wallet', NULL, b'0', '', b'0', b'0', 'RouteView', NULL, '/payment/wallet', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-10 10:03:29', 1399985191002447872, '2022-03-10 10:04:53', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1501742229142556672, 'admin', 1501740492360962048, '钱包列表', 'WalletList', NULL, b'0', '', b'0', b'0', 'payment/wallet/list/WalletList', NULL, '/payment/wallet/list', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-10 10:10:23', 1399985191002447872, '2022-03-10 17:06:19', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1501742417378725888, 'admin', 1501740492360962048, '个人钱包', 'PersonalWallet', NULL, b'0', '', b'0', b'0', 'payment/wallet/list/WalletList', NULL, '/payment/wallet/personal', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-10 10:11:08', 1399985191002447872, '2022-03-10 17:06:10', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1501847310319972352, 'admin', 1546850918849249280, '组合支付', 'CombinationCashier', NULL, b'0', '', b'0', b'0', 'payment/combination/CombinationCashier', NULL, '/demo/pay/combination', '', -0.5, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-10 17:07:56', 1399985191002447872, '2022-07-12 21:37:59', 4, 0);
INSERT INTO `iam_perm_menu` VALUES (1502926397176242176, 'admin', 1450822842995130368, '储值卡', 'Voucher', NULL, b'0', '', b'0', b'0', 'payment/voucher/VoucherList', NULL, '/payment/voucher', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-13 16:35:51', 1399985191002447872, '2022-03-14 19:39:45', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1506910599819165696, 'admin', 1495969099987963904, '数据权限', 'DataPermDemoList', NULL, b'0', '', b'0', b'0', 'demo/data/perm/DataPermDemoList', NULL, '/demo/data/perm', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-24 16:27:39', 1399985191002447872, '2022-03-24 16:28:56', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1506910885463851008, 'admin', 1495969099987963904, '加密解密', 'DataEncryptDemo', NULL, b'0', '', b'0', b'0', 'demo/data/encrypt/DataEncryptDemoList', NULL, '/demo/data/encrypt', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-24 16:28:47', 1399985191002447872, '2022-03-24 16:28:47', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1506911113394913280, 'admin', 1495969099987963904, '数据脱敏', 'DataSensitiveDemo', NULL, b'0', '', b'0', b'0', 'demo/data/sensitive/DataSensitiveDemoList', NULL, '/demo/data/sensitive', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-24 16:29:41', 1399985191002447872, '2022-03-24 17:16:03', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1507998458886197248, 'admin', 1495968302034210816, 'WS演示', 'WebsocketDemo', NULL, b'0', '', b'0', b'0', 'demo/ws/WebsocketDemo', NULL, '/demo/ws', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-27 16:30:25', 1399985191002447872, '2022-03-27 16:30:25', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1509488473583562752, 'admin', 1495968302034210816, '幂等请求演示', 'IdempotentDemo', NULL, b'0', '', b'0', b'0', 'demo/idempotent/Idempotent', NULL, '/demo/idempotent', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-03-31 19:11:12', 1399985191002447872, '2022-05-27 17:35:00', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1511266086400524288, 'admin', 1450822511087271936, '钉钉配置', 'DingTalkConfig', NULL, b'0', '', b'1', b'0', 'third/dingtalk/config/DingTalkConfigList', NULL, '/third/dingtalk/config', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-04-05 16:54:48', 1399985191002447872, '2022-07-26 13:34:44', 3, 0);
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
INSERT INTO `iam_perm_menu` VALUES (1535451167008436224, 'admin', 1431152689832525824, '系统信息', 'SysInfo', NULL, b'0', '', b'0', b'0', 'starter/monitor/SystemInfoMonitor', NULL, '/monitor/sysinfo', '', 0, 1, NULL, b'0', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-06-11 10:37:40', 1399985191002447872, '2022-06-13 13:07:46', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1535965936371085312, 'admin', 1431152689832525824, 'Redis监控', 'RedisInfoMonitor', NULL, b'0', '', b'0', b'0', 'starter/monitor/RedisInfoMonitor', NULL, '/monitor/redis', '', 0, 1, NULL, b'0', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-06-12 20:43:11', 1399985191002447872, '2022-06-13 13:07:38', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1537730140522348544, 'admin', 1438061887002759168, '站内信', 'SiteMessageSender', '', b'0', '', b'0', b'0', 'notice/site/sender/SiteMessageList', NULL, '/notice/siteMessage', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-06-17 17:33:30', 1399985191002447872, '2022-08-20 21:12:30', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1537732440632524800, 'admin', NULL, '个人办公', 'person', '', b'0', 'user', b'0', b'0', 'RouteView', NULL, '/person', '', -99, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-06-17 17:42:38', 1399985191002447872, '2022-08-20 22:15:21', 4, 0);
INSERT INTO `iam_perm_menu` VALUES (1537733801860333568, 'admin', 1537732440632524800, '我的消息', 'PersonSiteMessage', NULL, b'0', '', b'0', b'0', 'notice/site/receive/SiteMessageList', NULL, '/person/siteMessage', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-06-17 17:48:03', 1399985191002447872, '2022-08-17 21:35:17', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1537735851818024960, 'admin', 1537732440632524800, '待办任务', 'PersonTaskList', NULL, b'0', '', b'0', b'0', 'Dev', NULL, '/person/taskList', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-06-17 17:56:11', 1399985191002447872, '2022-06-21 20:52:42', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1538160478872625152, 'admin', 1495968302034210816, '富文本编辑', 'WangEditorDemo', NULL, b'0', '', b'0', b'0', 'demo/wangeditor/WangEditorDemo', NULL, '/demo/wangEditor', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-06-18 22:03:30', 1399985191002447872, '2022-06-18 22:03:31', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1541355214204030976, 'admin', 1541427353886859264, '认证终端', 'Client', '', b'0', '', b'0', b'0', 'system/client/ClientList', NULL, '/system/config/client', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2021-08-27 10:37:08', 1399985191002447872, '2022-07-05 21:17:45', 3, 0);
INSERT INTO `iam_perm_menu` VALUES (1541427353886859264, 'admin', 1414596052497092608, '认证管理', 'Auth', '', b'0', '', b'0', b'0', 'RouteView', NULL, '/system/auth', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-06-27 22:24:54', 1399985191002447872, '2022-06-27 22:24:54', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1544952211901218816, 'admin', 1546850918849249280, '支付结算台演示', 'CashierDemo', NULL, b'0', '', b'0', b'0', '', NULL, '/cashier', '', 0, 1, NULL, b'0', b'1', b'0', b'0', NULL, 1399985191002447872, '2022-07-07 15:51:26', 1399985191002447872, '2022-07-12 21:36:34', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1546850918849249280, 'admin', 1495968302034210816, '支付演示', 'DemoPay', NULL, b'0', '', b'0', b'0', 'RouteView', NULL, '/demo/pay', '', 9, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-07-12 21:36:13', 1399985191002447872, '2022-08-03 14:49:16', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1551803592828932096, 'admin', 1450821877831254016, '企微机器人', 'WeComRobot', '', b'0', '', b'0', b'0', 'third/wecom/robot/WeComRobotConfigList', NULL, '/third/wecom', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-07-26 13:36:22', 1399985191002447872, '2022-07-26 15:14:26', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1552207982510706688, 'admin', NULL, '开发管理', 'develop', NULL, b'0', 'gold', b'0', b'0', 'RouteView', NULL, '/develop', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-07-27 16:23:16', 1399985191002447872, '2022-07-27 16:39:09', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1552208167664062464, 'admin', 1552207982510706688, '动态表单', 'DynamicForm', NULL, b'0', '', b'0', b'0', 'develop/dynamicform/DynamicFormList', NULL, '/develop/form', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-07-27 16:24:00', 1399985191002447872, '2022-07-27 16:38:05', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1554720980865380352, 'admin', 1495968302034210816, '消息通知', 'NoticeDemo', NULL, b'0', '', b'0', b'0', 'RouteView', NULL, '/demo/notice', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-08-03 14:49:02', 1399985191002447872, '2022-08-03 14:49:02', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1554721654336385024, 'admin', 1554720980865380352, '邮件发送', 'EmailDemo', NULL, b'0', '', b'0', b'0', 'demo/notice/email/EmailSender', NULL, '/demo/notice/email', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-08-03 14:51:42', 1399985191002447872, '2022-08-03 14:51:42', 0, 0);
INSERT INTO `iam_perm_menu` VALUES (1554850179754975232, 'admin', 1450821723027881984, '消息模板', 'WeChatTemplate', NULL, b'0', '', b'0', b'0', 'third/wechat/template/WeChatTemplateList', NULL, '/third/wechat/template', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-08-03 23:22:25', 1399985191002447872, '2022-08-03 23:23:18', 1, 0);
INSERT INTO `iam_perm_menu` VALUES (1555835229426368512, 'admin', 1450821723027881984, '自定义菜单', 'WeChatMenu', NULL, b'0', '', b'0', b'0', 'third/wechat/menu/WeChatMenuList', NULL, '/third/wechat/menu', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-08-06 16:36:39', 1399985191002447872, '2022-08-08 12:14:14', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1556997405528805376, 'admin', 1450821723027881984, '素材管理', 'WeChatMedia', NULL, b'0', '', b'0', b'0', 'third/wechat/media/WeChatMediaList', NULL, '/third/wechat/media', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-08-09 21:34:44', 1399985191002447872, '2022-08-09 21:34:44', 0, 0);

-- ----------------------------
-- Table structure for iam_perm_path
-- ----------------------------
DROP TABLE IF EXISTS `iam_perm_path`;
CREATE TABLE `iam_perm_path`  (
                                  `id` bigint(20) NOT NULL,
                                  `code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限标识',
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
INSERT INTO `iam_user_expand_info` VALUES (1399985191002447872, 1, '1996-12-01', '1495331905770315776', '2022-08-21 11:07:05', '2022-08-22 10:26:41', b'0', '2022-06-19 21:25:00', 1, '2021-06-02 15:04:15', 0, '2022-08-22 10:26:41', 306, 0);
INSERT INTO `iam_user_expand_info` VALUES (1414143554414059520, 1, NULL, '1530065639127871488', '2022-05-27 13:56:02', '2022-07-04 22:39:33', b'0', NULL, 1, '2021-07-11 16:44:32', 0, '2022-07-04 22:39:33', 3, 0);
INSERT INTO `iam_user_expand_info` VALUES (1435894470432456704, 1, NULL, NULL, NULL, NULL, b'0', '2022-06-29 00:39:23', 1399985191002447872, '2021-09-09 17:14:54', 0, '2022-06-29 00:39:23', 2, 0);
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
                                  `client_ids` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关联终端ds',
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
INSERT INTO `iam_user_info` VALUES (1399985191002447872, '小小明', 'xxm', 'f52020dca765fd3943ed40a615dc2c5c', '13333333333', 'xxm1995@outlook.com', '1430430071299207168,1430430071299207169', NULL, NULL, b'1', '2021-06-02 15:04:12', 1, 1, '2021-06-02 15:04:15', 1399985191002447872, '2022-06-27 23:09:31', 50, 0);
INSERT INTO `iam_user_info` VALUES (1414143554414059520, '小小明1995', 'xxm1995', 'f52020dca765fd3943ed40a615dc2c5c', '13000000000', 'xxm1995@foxmail.com', NULL, NULL, NULL, b'1', '2021-07-11 16:44:31', 1, 1, '2021-07-11 16:44:32', 1414143554414059520, '2022-05-27 13:57:33', 3, 0);
INSERT INTO `iam_user_info` VALUES (1435894470432456704, '管理员', 'admin', 'c80a93d89e6590e8909a1a9f842b1615', '13000001111', 'admin@qq.com', '1430430071299207168', '', NULL, b'0', '2021-09-09 17:14:52', 1, 1399985191002447872, '2021-09-09 17:14:54', 0, '2022-06-29 00:39:23', 6, 0);
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
-- Table structure for iam_user_third
-- ----------------------------
DROP TABLE IF EXISTS `iam_user_third`;
CREATE TABLE `iam_user_third`  (
                                   `id` bigint(20) NOT NULL COMMENT '主键',
                                   `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
                                   `we_chat_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信openId',
                                   `we_chat_open_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信开放平台id',
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
                                   PRIMARY KEY (`id`) USING BTREE,
                                   INDEX `pk_user_index`(`user_id`) USING BTREE COMMENT '用户id索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户三方登录绑定' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_user_third
-- ----------------------------

-- ----------------------------
-- Table structure for iam_user_third_info
-- ----------------------------
DROP TABLE IF EXISTS `iam_user_third_info`;
CREATE TABLE `iam_user_third_info`  (
                                        `id` bigint(20) NOT NULL COMMENT '主键',
                                        `user_id` bigint(20) NOT NULL COMMENT '用户id',
                                        `client_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '第三方终端类型',
                                        `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户名',
                                        `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户昵称',
                                        `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户头像',
                                        `third_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '关联第三方平台的用户id',
                                        `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
                                        `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                        `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
                                        `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
                                        `version` int(11) NOT NULL COMMENT '版本',
                                        PRIMARY KEY (`id`) USING BTREE,
                                        INDEX `pk_user_client`(`user_id`, `client_code`) USING BTREE COMMENT '用户id和终端code'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户三方登录绑定详情' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of iam_user_third_info
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
                                        `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '消息内容',
                                        `sender_id` bigint(20) NULL DEFAULT NULL COMMENT '发送者id',
                                        `sender_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者姓名',
                                        `sender_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
                                        `receive_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息类型',
                                        `send_state` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发布状态',
                                        `efficient_time` datetime(0) NULL DEFAULT NULL COMMENT '截至有效期',
                                        `cancel_time` datetime(0) NULL DEFAULT NULL COMMENT '撤回时间',
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
INSERT INTO `notice_site_message` VALUES (1424212599079161857, '测试消息', '<div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >55</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled ></div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >6等非撒扥森<strong>速度扥三扥所</strong></div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >6</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >8</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >8</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5<span style=\"background-color: rgb(255, 169, 64);\">撒扥森森的</span></div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled ><span style=\"font-family: 华文楷体;\">5撒扥岁送</span></div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled ></div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled ></div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >8</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >8</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >8</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled ></div>', 1399985191002447872, '小小明', '2021-08-08 11:34:11', 'all', 'cancel', NULL, '2022-08-21 23:01:16', 1399985191002447872, '2021-08-08 11:35:19', 1399985191002447872, '2022-08-21 23:01:16', 1, 0);
INSERT INTO `notice_site_message` VALUES (1558781525200130048, '测试站内信', '<blockquote><span style=\"font-size: 24px;\"><strong>sdfsdfsdf</strong></span></blockquote><ol><li>333</li></ol><ul><li>4444</li><li>3443434</li></ul>', 0, '未知', '2022-08-14 19:44:11', NULL, 'sent', NULL, NULL, 0, '2022-08-14 19:44:11', 0, '2022-08-14 19:44:11', 0, 0);
INSERT INTO `notice_site_message` VALUES (1561363288741085184, '测试消息', '<p>三扥广丰和扥撒扥撒扥东方</p>', 1399985191002447872, '小小明', '2022-08-21 22:59:45', 'all', 'draft', '2022-09-20 00:00:00', NULL, 1399985191002447872, '2022-08-21 22:43:11', 1399985191002447872, '2022-08-21 23:23:03', 4, 1);
INSERT INTO `notice_site_message` VALUES (1561365894804766720, '测试数据', '<p>234554通扥广森</p>', 1399985191002447872, '小小明', '2022-08-21 23:48:55', 'all', 'sent', '2022-09-20 00:00:00', NULL, 1399985191002447872, '2022-08-21 22:53:33', 1399985191002447872, '2022-08-21 23:48:55', 1, 0);
INSERT INTO `notice_site_message` VALUES (1561368170558623744, '测试数据', '<p>234554通扥广森</p><h3>DFF</h3><p><span style=\"background-color: rgb(225, 60, 57);\">撒扥萨芬的</span></p><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled ><span style=\"background-color: rgb(225, 60, 57);\">11</span></div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled ><span style=\"background-color: rgb(225, 60, 57);\">33</span></div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled ><span style=\"background-color: rgb(225, 60, 57);\">44</span></div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled ><span style=\"background-color: rgb(225, 60, 57);\">风很高</span></div>', 1399985191002447872, '小小明', '2022-08-21 23:33:01', 'all', 'sent', '2022-09-20 00:00:00', NULL, 1399985191002447872, '2022-08-21 23:02:35', 1399985191002447872, '2022-08-21 23:33:01', 7, 0);

-- ----------------------------
-- Table structure for notice_site_message_user
-- ----------------------------
DROP TABLE IF EXISTS `notice_site_message_user`;
CREATE TABLE `notice_site_message_user`  (
                                             `id` bigint(20) NOT NULL COMMENT '主键',
                                             `message_id` bigint(20) NOT NULL COMMENT '消息id',
                                             `receive_id` bigint(20) NOT NULL COMMENT '接收者id',
                                             `have_read` bit(1) NOT NULL COMMENT '已读/未读',
                                             `read_time` datetime(0) NULL DEFAULT NULL COMMENT '已读时间',
                                             `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
                                             `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                             `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
                                             PRIMARY KEY (`id`) USING BTREE,
                                             UNIQUE INDEX `uni_receive_message`(`receive_id`, `message_id`) USING BTREE COMMENT '接收人和消息联合索引',
                                             INDEX `inx_message`(`message_id`) USING BTREE COMMENT '消息索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '消息用户关联' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice_site_message_user
-- ----------------------------
INSERT INTO `notice_site_message_user` VALUES (1558781525422428160, 1558781525200130048, 1399985191002447872, b'1', '2022-08-14 19:47:53', 0, '2022-08-14 19:44:11', 0);
INSERT INTO `notice_site_message_user` VALUES (1559917646856540160, 1424212599079161857, 1399985191002447872, b'1', '2022-08-17 22:58:43', 1399985191002447872, '2022-08-17 22:58:44', 0);
INSERT INTO `notice_site_message_user` VALUES (1561379790089302016, 1561368170558623744, 1399985191002447872, b'1', '2022-08-21 23:48:43', 1399985191002447872, '2022-08-21 23:48:46', 0);
INSERT INTO `notice_site_message_user` VALUES (1561379841968648192, 1561365894804766720, 1399985191002447872, b'1', '2022-08-21 23:48:58', 1399985191002447872, '2022-08-21 23:48:58', 0);

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
                                      `expire_time` int(10) NOT NULL COMMENT '超时配置',
                                      `pay_ways` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支持的支付类型',
                                      `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                                      `activity` bit(1) NOT NULL COMMENT '是否启用',
                                      `state` int(11) NOT NULL COMMENT '状态',
                                      `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
                                      `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                      `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
                                      `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
                                      `version` int(11) NOT NULL COMMENT '版本',
                                      `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
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
                                `business_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务id',
                                `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
                                `description` varchar(240) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
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
                                PRIMARY KEY (`id`) USING BTREE,
                                UNIQUE INDEX `uniq_business_id`(`business_id`) USING BTREE COMMENT '业务编号id, 唯一ID'
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
                                          `id` bigint(20) NOT NULL COMMENT '主键',
                                          `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
                                          `app_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信应用AppId',
                                          `mch_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户号',
                                          `api_version` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务商应用编号',
                                          `api_key_v2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户平台「API安全」中的 APIv2 密钥',
                                          `api_key_v3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户平台「API安全」中的 APIv3 密钥',
                                          `app_secret` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'APPID对应的接口密码，用于获取接口调用凭证access_token时使用',
                                          `p12` bigint(20) NULL DEFAULT NULL COMMENT 'p12的文件id',
                                          `cert_pem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'API 证书中的 cert.pem',
                                          `key_pem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'API 证书中的 key.pem',
                                          `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用域名，回调中会使用此参数',
                                          `notify_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务器异步通知页面路径',
                                          `return_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '页面跳转同步通知页面路径',
                                          `pay_ways` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '支持的支付类型',
                                          `sandbox` bit(1) NOT NULL COMMENT '是否沙箱环境',
                                          `expire_time` int(10) NOT NULL COMMENT '超时配置',
                                          `activity` bit(1) NOT NULL COMMENT '是否启用',
                                          `state` int(11) NULL DEFAULT NULL COMMENT '状态',
                                          `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                                          `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
                                          `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                          `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
                                          `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
                                          `version` int(11) NOT NULL COMMENT '版本',
                                          `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
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
                                       `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
                                       `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                       `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
                                       `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
                                       `version` int(11) NOT NULL COMMENT '版本',
                                       `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
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
INSERT INTO `qrtz_cron_triggers` VALUES ('quartzScheduler', '1546857070483939328', 'DEFAULT', '0/5 * * * * ? *', 'Asia/Shanghai');

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
INSERT INTO `qrtz_fired_triggers` VALUES ('quartzScheduler', 'NON_CLUSTERED1661137921028', '1546857070483939328', 'DEFAULT', 'NON_CLUSTERED', 1661147655686, 1661147660000, 5, 'ACQUIRED', NULL, NULL, '0', '0');

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
INSERT INTO `qrtz_job_details` VALUES ('quartzScheduler', '1546857070483939328', 'DEFAULT', NULL, 'cn.bootx.payment.task.PayExpiredTimeTask', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000001740009706172616D65746572707800);

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
INSERT INTO `qrtz_triggers` VALUES ('quartzScheduler', '1546857070483939328', 'DEFAULT', '1546857070483939328', 'DEFAULT', NULL, 1661147660000, 1661147655000, 5, 'ACQUIRED', 'CRON', 1657634445000, 0, NULL, 0, '');

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
                                            `login_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录方式',
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
-- Table structure for starter_ding_media_md5
-- ----------------------------
DROP TABLE IF EXISTS `starter_ding_media_md5`;
CREATE TABLE `starter_ding_media_md5`  (
                                           `id` bigint(20) NOT NULL,
                                           `media_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '媒体id',
                                           `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'md5值',
                                           `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
                                           `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
                                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '钉钉媒体文件MD5值关联关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of starter_ding_media_md5
-- ----------------------------

-- ----------------------------
-- Table structure for starter_ding_robot_config
-- ----------------------------
DROP TABLE IF EXISTS `starter_ding_robot_config`;
CREATE TABLE `starter_ding_robot_config`  (
                                              `id` bigint(20) NOT NULL,
                                              `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
                                              `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
                                              `access_token` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钉钉机器人访问token',
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
-- Records of starter_ding_robot_config
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
                                             `file_size` bigint(20) NULL DEFAULT NULL COMMENT '文件大小',
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
INSERT INTO `starter_quartz_job` VALUES (1456579473573867520, '测试任务', 'cn.bootx.starter.quartz.task.TestTask', '50 0 * * * ? *', '{\"aaa\":\"5255\"}', 0, '测试任务', 1399985191002447872, '2021-11-05 19:09:43', 1399985191002447872, '2022-06-22 00:37:48', 25, 0);
INSERT INTO `starter_quartz_job` VALUES (1546857070483939328, '支付单超时检测', 'cn.bootx.payment.task.PayExpiredTimeTask', '0/5 * * * * ? *', NULL, 1, '检测超时的支付单, 超时后发送超时事件', 1399985191002447872, '2022-07-12 22:00:39', 1399985191002447872, '2022-07-12 22:00:45', 1, 0);

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

-- ----------------------------
-- Table structure for starter_wecom_robot_config
-- ----------------------------
DROP TABLE IF EXISTS `starter_wecom_robot_config`;
CREATE TABLE `starter_wecom_robot_config`  (
                                               `id` bigint(20) NOT NULL,
                                               `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
                                               `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
                                               `webhook_key` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'webhook地址的key值',
                                               `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                                               `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
                                               `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
                                               `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
                                               `last_modified_time` datetime(6) NULL DEFAULT NULL COMMENT '最后修改时间',
                                               `version` int(11) NOT NULL COMMENT '版本',
                                               `deleted` bit(1) NOT NULL COMMENT '0:未删除。1:已删除',
                                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业微信机器人配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of starter_wecom_robot_config
-- ----------------------------

-- ----------------------------
-- Table structure for starter_wx_fans
-- ----------------------------
DROP TABLE IF EXISTS `starter_wx_fans`;
CREATE TABLE `starter_wx_fans`  (
                                    `id` bigint(20) NOT NULL,
                                    `openid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联OpenId',
                                    `subscribe_status` bit(1) NULL DEFAULT NULL COMMENT '订阅状态',
                                    `subscribe_time` datetime(0) NULL DEFAULT NULL COMMENT '订阅时间',
                                    `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
                                    `sex` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
                                    `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语言',
                                    `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家',
                                    `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份',
                                    `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
                                    `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址',
                                    `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信公众号粉丝' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of starter_wx_fans
-- ----------------------------

-- ----------------------------
-- Table structure for starter_wx_menu
-- ----------------------------
DROP TABLE IF EXISTS `starter_wx_menu`;
CREATE TABLE `starter_wx_menu`  (
                                    `id` bigint(20) NOT NULL COMMENT '主键',
                                    `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '名称',
                                    `menu_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '菜单信息',
                                    `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
                                    `publish` bit(1) NOT NULL COMMENT '是否发布',
                                    `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
                                    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                    `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
                                    `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
                                    `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
                                    `version` int(11) NOT NULL COMMENT '版本',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '微信自定义菜单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of starter_wx_menu
-- ----------------------------

-- ----------------------------
-- Table structure for starter_wx_template
-- ----------------------------
DROP TABLE IF EXISTS `starter_wx_template`;
CREATE TABLE `starter_wx_template`  (
                                        `id` bigint(20) NOT NULL,
                                        `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
                                        `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
                                        `enable` bit(1) NOT NULL COMMENT '是否启用',
                                        `template_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模板ID',
                                        `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板标题',
                                        `primary_industry` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板所属行业的一级行业',
                                        `deputy_industry` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板所属行业的二级行业',
                                        `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板内容',
                                        `example` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '示例',
                                        `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
                                        `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                        `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
                                        `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
                                        `version` int(11) NOT NULL COMMENT '版本',
                                        PRIMARY KEY (`id`) USING BTREE,
                                        UNIQUE INDEX `inx_`(`template_id`) USING BTREE COMMENT '模板id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信消息模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of starter_wx_template
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
