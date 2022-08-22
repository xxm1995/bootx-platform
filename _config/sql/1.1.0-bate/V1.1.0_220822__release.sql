SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '动态表单' ROW_FORMAT = Dynamic;

ALTER TABLE `iam_user_third` ADD COLUMN `we_chat_open_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信开放平台id' AFTER `we_chat_id`;

ALTER TABLE `notice_site_message` ADD COLUMN `receive_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息类型' AFTER `sender_time`;

ALTER TABLE `notice_site_message` ADD COLUMN `send_state` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发布状态' AFTER `receive_type`;

ALTER TABLE `notice_site_message` ADD COLUMN `efficient_time` datetime(0) NULL DEFAULT NULL COMMENT '截至有效期' AFTER `send_state`;

ALTER TABLE `notice_site_message` ADD COLUMN `cancel_time` datetime(0) NULL DEFAULT NULL COMMENT '撤回时间' AFTER `efficient_time`;

ALTER TABLE `notice_site_message` MODIFY COLUMN `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '消息内容' AFTER `title`;

ALTER TABLE `notice_site_message` DROP COLUMN `receive_id`;

ALTER TABLE `notice_site_message` DROP COLUMN `receive_name`;

ALTER TABLE `notice_site_message` DROP COLUMN `have_read`;

ALTER TABLE `notice_site_message` DROP COLUMN `read_time`;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '消息用户关联' ROW_FORMAT = Dynamic;

ALTER TABLE `starter_audit_login_log` ADD COLUMN `login_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录方式' AFTER `client`;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '微信自定义菜单' ROW_FORMAT = Dynamic;


INSERT INTO `base_dict`(`id`, `code`, `name`, `group_tag`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1556996322223968256, 'WeChatMediaType', '微信媒体类型', '微信', '微信媒体类型', 1399985191002447872, '2022-08-09 21:30:25', 1399985191002447872, '2022-08-09 21:30:26', 0, 0);

INSERT INTO `base_dict`(`id`, `code`, `name`, `group_tag`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1561003021674987520, 'SiteMessageReceive', '消息接收类型', '站内信', '站内信接收类型', 1399985191002447872, '2022-08-20 22:51:37', 1399985191002447872, '2022-08-20 22:51:37', 0, 0);

INSERT INTO `base_dict`(`id`, `code`, `name`, `group_tag`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1561003189111603200, 'SiteMessageState', '消息发布状态', '站内信', '站内信消息发布状态', 1399985191002447872, '2022-08-20 22:52:17', 1399985191002447872, '2022-08-20 22:52:17', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1556996422006460416, 1556996322223968256, 'WeChatMediaType', 'news', '新闻', 0.00, '', 1399985191002447872, '2022-08-09 21:30:49', 1399985191002447872, '2022-08-09 21:30:49', 1, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1556996472661069824, 1556996322223968256, 'WeChatMediaType', 'voice', '语音', 0.00, '', 1399985191002447872, '2022-08-09 21:31:01', 1399985191002447872, '2022-08-09 21:31:01', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1556996501417218048, 1556996322223968256, 'WeChatMediaType', 'image', '图片', 0.00, '', 1399985191002447872, '2022-08-09 21:31:08', 1399985191002447872, '2022-08-09 21:31:08', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1556996529565192192, 1556996322223968256, 'WeChatMediaType', 'video', '视频', 0.00, '', 1399985191002447872, '2022-08-09 21:31:15', 1399985191002447872, '2022-08-09 21:31:15', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1561003235710320640, 1561003189111603200, 'SiteMessageState', 'user', '指定用户', 0.00, '', 1399985191002447872, '2022-08-20 22:52:28', 1399985191002447872, '2022-08-20 22:52:28', 1, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1561003279322693632, 1561003189111603200, 'SiteMessageState', 'all', '全部用户', 0.00, '', 1399985191002447872, '2022-08-20 22:52:38', 1399985191002447872, '2022-08-20 22:52:39', 1, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1561003368762032128, 1561003021674987520, 'SiteMessageReceive', 'user', '指定用户', 0.00, '', 1399985191002447872, '2022-08-20 22:53:00', 1399985191002447872, '2022-08-20 22:53:00', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1561003399778910208, 1561003021674987520, 'SiteMessageReceive', 'all', '全部用户', 0.00, '', 1399985191002447872, '2022-08-20 22:53:07', 1399985191002447872, '2022-08-20 22:53:24', 0, 1);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1561003539772194816, 1561003189111603200, 'SiteMessageState', 'sent', '已发送', 0.00, '', 1399985191002447872, '2022-08-20 22:53:41', 1399985191002447872, '2022-08-20 22:53:41', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1561003575608328192, 1561003189111603200, 'SiteMessageState', 'cancel', '撤销', 0.00, '', 1399985191002447872, '2022-08-20 22:53:49', 1399985191002447872, '2022-08-20 22:53:49', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1561245469535080448, 1561003189111603200, 'SiteMessageState', 'draft', '草稿', 0.00, '', 1399985191002447872, '2022-08-21 14:55:01', 1399985191002447872, '2022-08-21 14:55:01', 0, 0);

UPDATE `iam_login_type` SET `code` = 'weChat', `name` = '微信登录', `type` = 'openId', `system` = b'0', `timeout` = 5, `captcha` = b'0', `pwd_err_num` = -1, `enable` = b'1', `description` = '', `creator` = 1399985191002447872, `create_time` = '2022-07-02 14:54:53', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-08-05 18:11:13', `version` = 1, `deleted` = 0 WHERE `id` = 1543126042909016064;

INSERT INTO `iam_perm_menu`(`id`, `client_code`, `parent_id`, `title`, `name`, `perm_code`, `effect`, `icon`, `hidden`, `hide_children_in_menu`, `component`, `component_name`, `path`, `redirect`, `sort_no`, `menu_type`, `leaf`, `keep_alive`, `target_outside`, `hidden_header_content`, `admin`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1554720980865380352, 'admin', 1495968302034210816, '消息通知', 'NoticeDemo', NULL, b'0', '', b'0', b'0', 'RouteView', NULL, '/demo/notice', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-08-03 14:49:02', 1399985191002447872, '2022-08-03 14:49:02', 0, 0);

INSERT INTO `iam_perm_menu`(`id`, `client_code`, `parent_id`, `title`, `name`, `perm_code`, `effect`, `icon`, `hidden`, `hide_children_in_menu`, `component`, `component_name`, `path`, `redirect`, `sort_no`, `menu_type`, `leaf`, `keep_alive`, `target_outside`, `hidden_header_content`, `admin`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1554721654336385024, 'admin', 1554720980865380352, '邮件发送', 'EmailDemo', NULL, b'0', '', b'0', b'0', 'demo/notice/email/EmailSender', NULL, '/demo/notice/email', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-08-03 14:51:42', 1399985191002447872, '2022-08-03 14:51:42', 0, 0);

INSERT INTO `iam_perm_menu`(`id`, `client_code`, `parent_id`, `title`, `name`, `perm_code`, `effect`, `icon`, `hidden`, `hide_children_in_menu`, `component`, `component_name`, `path`, `redirect`, `sort_no`, `menu_type`, `leaf`, `keep_alive`, `target_outside`, `hidden_header_content`, `admin`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1554850179754975232, 'admin', 1450821723027881984, '消息模板', 'WeChatTemplate', NULL, b'0', '', b'0', b'0', 'third/wechat/template/WeChatTemplateList', NULL, '/third/wechat/template', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-08-03 23:22:25', 1399985191002447872, '2022-08-03 23:23:18', 1, 0);

INSERT INTO `iam_perm_menu`(`id`, `client_code`, `parent_id`, `title`, `name`, `perm_code`, `effect`, `icon`, `hidden`, `hide_children_in_menu`, `component`, `component_name`, `path`, `redirect`, `sort_no`, `menu_type`, `leaf`, `keep_alive`, `target_outside`, `hidden_header_content`, `admin`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1555835229426368512, 'admin', 1450821723027881984, '自定义菜单', 'WeChatMenu', NULL, b'0', '', b'0', b'0', 'third/wechat/menu/WeChatMenuList', NULL, '/third/wechat/menu', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-08-06 16:36:39', 1399985191002447872, '2022-08-08 12:14:14', 2, 0);

INSERT INTO `iam_perm_menu`(`id`, `client_code`, `parent_id`, `title`, `name`, `perm_code`, `effect`, `icon`, `hidden`, `hide_children_in_menu`, `component`, `component_name`, `path`, `redirect`, `sort_no`, `menu_type`, `leaf`, `keep_alive`, `target_outside`, `hidden_header_content`, `admin`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1556997405528805376, 'admin', 1450821723027881984, '素材管理', 'WeChatMedia', NULL, b'0', '', b'0', b'0', 'third/wechat/media/WeChatMediaList', NULL, '/third/wechat/media', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-08-09 21:34:44', 1399985191002447872, '2022-08-09 21:34:44', 0, 0);

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = NULL, `title` = '系统管理', `name` = 'system', `perm_code` = '', `effect` = NULL, `icon` = 'desktop', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'RouteView', `component_name` = '', `path` = '/system', `redirect` = '/system/user', `sort_no` = -99999, `menu_type` = 0, `leaf` = b'0', `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'1', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-08-27 10:32:53', `last_modifier` = 1399985191002447872, `last_modified_time` = '2021-08-27 10:02:16', `version` = 2, `deleted` = 0 WHERE `id` = 1414596052497092608;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1450819607680991232, `title` = '微信', `name` = 'WeChat', `perm_code` = '', `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'RouteView', `component_name` = NULL, `path` = '/third/wechat', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-10-20 21:50:28', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-08-03 23:23:10', `version` = 3, `deleted` = 0 WHERE `id` = 1450821723027881984;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1450819607680991232, `title` = '企业微信', `name` = 'WeCom', `perm_code` = '', `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'RouteView', `component_name` = NULL, `path` = '/third/wecom', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-10-20 21:51:05', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-08-03 23:22:58', `version` = 4, `deleted` = 0 WHERE `id` = 1450821877831254016;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1450819607680991232, `title` = '钉钉', `name` = 'DingTalk', `perm_code` = '', `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'RouteView', `component_name` = NULL, `path` = '/third/dingtalk', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-10-20 21:53:36', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-08-03 23:23:29', `version` = 3, `deleted` = 0 WHERE `id` = 1450822511087271936;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1438061887002759168, `title` = '站内信', `name` = 'SiteMessageSender', `perm_code` = '', `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'notice/site/sender/SiteMessageList', `component_name` = NULL, `path` = '/notice/siteMessage', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2022-06-17 17:33:30', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-08-20 21:12:30', `version` = 2, `deleted` = 0 WHERE `id` = 1537730140522348544;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = NULL, `title` = '个人办公', `name` = 'person', `perm_code` = '', `effect` = b'0', `icon` = 'user', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'RouteView', `component_name` = NULL, `path` = '/person', `redirect` = '', `sort_no` = -99, `menu_type` = 0, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2022-06-17 17:42:38', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-08-20 22:15:21', `version` = 4, `deleted` = 0 WHERE `id` = 1537732440632524800;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1537732440632524800, `title` = '我的消息', `name` = 'PersonSiteMessage', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'notice/site/receive/SiteMessageList', `component_name` = NULL, `path` = '/person/siteMessage', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2022-06-17 17:48:03', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-08-17 21:35:17', `version` = 2, `deleted` = 0 WHERE `id` = 1537733801860333568;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1495968302034210816, `title` = '支付演示', `name` = 'DemoPay', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'RouteView', `component_name` = NULL, `path` = '/demo/pay', `redirect` = '', `sort_no` = 9, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2022-07-12 21:36:13', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-08-03 14:49:16', `version` = 1, `deleted` = 0 WHERE `id` = 1546850918849249280;

UPDATE `iam_user_expand_info` SET `sex` = 1, `birthday` = '1996-12-01', `avatar` = '1495331905770315776', `last_login_time` = '2022-08-21 11:07:05', `current_login_time` = '2022-08-22 10:26:41', `initial_password` = b'0', `last_change_password_time` = '2022-06-19 21:25:00', `creator` = 1, `create_time` = '2021-06-02 15:04:15', `last_modifier` = 0, `last_modified_time` = '2022-08-22 10:26:41', `version` = 306, `deleted` = 0 WHERE `id` = 1399985191002447872;

INSERT INTO `notice_site_message`(`id`, `title`, `content`, `sender_id`, `sender_name`, `sender_time`, `receive_type`, `send_state`, `efficient_time`, `cancel_time`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1558781525200130048, '测试站内信', '<blockquote><span style=\"font-size: 24px;\"><strong>sdfsdfsdf</strong></span></blockquote><ol><li>333</li></ol><ul><li>4444</li><li>3443434</li></ul>', 0, '未知', '2022-08-14 19:44:11', NULL, 'sent', NULL, NULL, 0, '2022-08-14 19:44:11', 0, '2022-08-14 19:44:11', 0, 0);

INSERT INTO `notice_site_message`(`id`, `title`, `content`, `sender_id`, `sender_name`, `sender_time`, `receive_type`, `send_state`, `efficient_time`, `cancel_time`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1561363288741085184, '测试消息', '<p>三扥广丰和扥撒扥撒扥东方</p>', 1399985191002447872, '小小明', '2022-08-21 22:59:45', 'all', 'draft', '2022-09-20 00:00:00', NULL, 1399985191002447872, '2022-08-21 22:43:11', 1399985191002447872, '2022-08-21 23:23:03', 4, 1);

INSERT INTO `notice_site_message`(`id`, `title`, `content`, `sender_id`, `sender_name`, `sender_time`, `receive_type`, `send_state`, `efficient_time`, `cancel_time`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1561365894804766720, '测试数据', '<p>234554通扥广森</p>', 1399985191002447872, '小小明', '2022-08-21 23:48:55', 'all', 'sent', '2022-09-20 00:00:00', NULL, 1399985191002447872, '2022-08-21 22:53:33', 1399985191002447872, '2022-08-21 23:48:55', 1, 0);

INSERT INTO `notice_site_message`(`id`, `title`, `content`, `sender_id`, `sender_name`, `sender_time`, `receive_type`, `send_state`, `efficient_time`, `cancel_time`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1561368170558623744, '测试数据', '<p>234554通扥广森</p><h3>DFF</h3><p><span style=\"background-color: rgb(225, 60, 57);\">撒扥萨芬的</span></p><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled ><span style=\"background-color: rgb(225, 60, 57);\">11</span></div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled ><span style=\"background-color: rgb(225, 60, 57);\">33</span></div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled ><span style=\"background-color: rgb(225, 60, 57);\">44</span></div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled ><span style=\"background-color: rgb(225, 60, 57);\">风很高</span></div>', 1399985191002447872, '小小明', '2022-08-21 23:33:01', 'all', 'sent', '2022-09-20 00:00:00', NULL, 1399985191002447872, '2022-08-21 23:02:35', 1399985191002447872, '2022-08-21 23:33:01', 7, 0);

UPDATE `notice_site_message` SET `title` = '测试消息', `content` = '<div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >55</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled ></div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >6等非撒扥森<strong>速度扥三扥所</strong></div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >6</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >8</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >8</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5<span style=\"background-color: rgb(255, 169, 64);\">撒扥森森的</span></div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >5</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled ><span style=\"font-family: 华文楷体;\">5撒扥岁送</span></div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled ></div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled ></div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >8</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >8</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >8</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled ></div>', `sender_id` = 1399985191002447872, `sender_name` = '小小明', `sender_time` = '2021-08-08 11:34:11', `receive_type` = 'all', `send_state` = 'cancel', `efficient_time` = NULL, `cancel_time` = '2022-08-21 23:01:16', `creator` = 1399985191002447872, `create_time` = '2021-08-08 11:35:19', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-08-21 23:01:16', `version` = 1, `deleted` = 0 WHERE `id` = 1424212599079161857;

INSERT INTO `notice_site_message_user`(`id`, `message_id`, `receive_id`, `have_read`, `read_time`, `creator`, `create_time`, `deleted`) VALUES (1558781525422428160, 1558781525200130048, 1399985191002447872, b'1', '2022-08-14 19:47:53', 0, '2022-08-14 19:44:11', 0);

INSERT INTO `notice_site_message_user`(`id`, `message_id`, `receive_id`, `have_read`, `read_time`, `creator`, `create_time`, `deleted`) VALUES (1559917646856540160, 1424212599079161857, 1399985191002447872, b'1', '2022-08-17 22:58:43', 1399985191002447872, '2022-08-17 22:58:44', 0);

INSERT INTO `notice_site_message_user`(`id`, `message_id`, `receive_id`, `have_read`, `read_time`, `creator`, `create_time`, `deleted`) VALUES (1561379790089302016, 1561368170558623744, 1399985191002447872, b'1', '2022-08-21 23:48:43', 1399985191002447872, '2022-08-21 23:48:46', 0);

INSERT INTO `notice_site_message_user`(`id`, `message_id`, `receive_id`, `have_read`, `read_time`, `creator`, `create_time`, `deleted`) VALUES (1561379841968648192, 1561365894804766720, 1399985191002447872, b'1', '2022-08-21 23:48:58', 1399985191002447872, '2022-08-21 23:48:58', 0);

DELETE FROM `qrtz_fired_triggers` WHERE `SCHED_NAME` = 'quartzScheduler' AND `ENTRY_ID` = 'NON_CLUSTERED1661135985834';

UPDATE `qrtz_triggers` SET `JOB_NAME` = '1546857070483939328', `JOB_GROUP` = 'DEFAULT', `DESCRIPTION` = NULL, `NEXT_FIRE_TIME` = 1661135790000, `PREV_FIRE_TIME` = 1661135785000, `PRIORITY` = 5, `TRIGGER_STATE` = 'WAITING', `TRIGGER_TYPE` = 'CRON', `START_TIME` = 1657634445000, `END_TIME` = 0, `CALENDAR_NAME` = NULL, `MISFIRE_INSTR` = 0, `JOB_DATA` = '' WHERE `SCHED_NAME` = 'quartzScheduler' AND `TRIGGER_NAME` = '1546857070483939328' AND `TRIGGER_GROUP` = 'DEFAULT';

SET FOREIGN_KEY_CHECKS = 1;