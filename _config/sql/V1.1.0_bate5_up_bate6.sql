SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `iam_user_third_info` ADD COLUMN `third_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '关联第三方平台的用户id' AFTER `avatar`;

ALTER TABLE `iam_user_third_info` DROP COLUMN `deleted`;

CREATE TABLE `starter_ding_media_md5`  (
                                                          `id` bigint(20) NOT NULL,
                                                          `media_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '媒体id',
                                                          `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'md5值',
                                                          `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
                                                          `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
                                                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '钉钉媒体文件MD5值关联关系' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信公众号粉丝' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信消息模板' ROW_FORMAT = Dynamic;

DROP TABLE `ding_config`;

DROP TABLE `ding_robot_config`;

UPDATE `flyway_schema_history` SET `version` = '1.1.0.220604', `description` = 'init', `type` = 'SQL', `script` = 'V1.1.0_220604__init.sql', `checksum` = -474276030, `installed_by` = 'bootx', `installed_on` = '2022-07-14 17:39:59', `execution_time` = 67308, `success` = 1 WHERE `installed_rank` = 1;

UPDATE `flyway_schema_history` SET `version` = '1.1.0.220624', `description` = 'bate3', `type` = 'SQL', `script` = 'V1.1.0_220624__bate3.sql', `checksum` = 85360861, `installed_by` = 'bootx', `installed_on` = '2022-07-14 17:40:01', `execution_time` = 724, `success` = 1 WHERE `installed_rank` = 2;

UPDATE `flyway_schema_history` SET `version` = '1.1.0.220702', `description` = 'bate4', `type` = 'SQL', `script` = 'V1.1.0_220702__bate4.sql', `checksum` = 764266899, `installed_by` = 'bootx', `installed_on` = '2022-07-14 17:40:07', `execution_time` = 5691, `success` = 1 WHERE `installed_rank` = 3;

UPDATE `flyway_schema_history` SET `version` = '1.1.0.220707', `description` = 'bate4-fix', `type` = 'SQL', `script` = 'V1.1.0_220707__bate4-fix.sql', `checksum` = 1727269960, `installed_by` = 'bootx', `installed_on` = '2022-07-14 17:40:13', `execution_time` = 5991, `success` = 1 WHERE `installed_rank` = 4;

UPDATE `flyway_schema_history` SET `version` = '1.1.0.220714', `description` = 'bate5', `type` = 'SQL', `script` = 'V1.1.0_220714__bate5.sql', `checksum` = 1029462157, `installed_by` = 'bootx', `installed_on` = '2022-07-14 17:40:17', `execution_time` = 3461, `success` = 1 WHERE `installed_rank` = 5;

UPDATE `iam_login_type` SET `code` = 'miniApp', `name` = '微信小程序', `type` = 'openId', `system` = b'0', `timeout` = 99999, `captcha` = b'0', `pwd_err_num` = 0, `enable` = b'1', `description` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-08-25 18:35:33', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-07-16 12:32:26', `version` = 3, `deleted` = 0 WHERE `id` = 1430478946919653376;

UPDATE `iam_login_type` SET `code` = 'phone', `name` = '手机短信登录', `type` = 'openId', `system` = b'0', `timeout` = 3600, `captcha` = b'0', `pwd_err_num` = 0, `enable` = b'1', `description` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-09-07 15:11:16', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-07-16 12:32:19', `version` = 5, `deleted` = 0 WHERE `id` = 1435138582839009280;

INSERT INTO `iam_perm_menu`(`id`, `client_code`, `parent_id`, `title`, `name`, `perm_code`, `effect`, `icon`, `hidden`, `hide_children_in_menu`, `component`, `component_name`, `path`, `redirect`, `sort_no`, `menu_type`, `leaf`, `keep_alive`, `target_outside`, `hidden_header_content`, `admin`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1551803592828932096, 'admin', 1450821877831254016, '企微机器人', 'WeComRobot', '', b'0', '', b'0', b'0', 'third/wecom/robot/WeComRobotConfigList', NULL, '/third/wecom', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-07-26 13:36:22', 1399985191002447872, '2022-07-26 15:14:26', 2, 0);

INSERT INTO `iam_perm_menu`(`id`, `client_code`, `parent_id`, `title`, `name`, `perm_code`, `effect`, `icon`, `hidden`, `hide_children_in_menu`, `component`, `component_name`, `path`, `redirect`, `sort_no`, `menu_type`, `leaf`, `keep_alive`, `target_outside`, `hidden_header_content`, `admin`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1552207982510706688, 'admin', NULL, '开发管理', 'develop', NULL, b'0', 'gold', b'0', b'0', 'RouteView', NULL, '/develop', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-07-27 16:23:16', 1399985191002447872, '2022-07-27 16:39:09', 1, 0);

INSERT INTO `iam_perm_menu`(`id`, `client_code`, `parent_id`, `title`, `name`, `perm_code`, `effect`, `icon`, `hidden`, `hide_children_in_menu`, `component`, `component_name`, `path`, `redirect`, `sort_no`, `menu_type`, `leaf`, `keep_alive`, `target_outside`, `hidden_header_content`, `admin`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1552208167664062464, 'admin', 1552207982510706688, '动态表单', 'DynamicForm', NULL, b'0', '', b'0', b'0', 'develop/dynamicform/DynamicFormList', NULL, '/develop/form', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-07-27 16:24:00', 1399985191002447872, '2022-07-27 16:38:05', 2, 0);

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1438061887002759168, `title` = '钉钉', `name` = 'DingTalk', `perm_code` = '', `effect` = NULL, `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'RouteView', `component_name` = NULL, `path` = '/notice/dingTalk', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-09-21 15:27:50', `last_modifier` = 1399985191002447872, `last_modified_time` = '2021-09-21 15:27:50', `version` = 0, `deleted` = 1 WHERE `id` = 1440216178722050048;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1450822511087271936, `title` = '钉钉机器人', `name` = 'DingTalkRobot', `perm_code` = '', `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'third/dingtalk/robot/DingRobotConfigList', `component_name` = NULL, `path` = '/third/dingTalk/robot', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-09-21 15:29:33', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-07-26 13:34:35', `version` = 5, `deleted` = 0 WHERE `id` = 1440216612211757056;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1452569691537256448, `title` = '第三方登录', `name` = 'Social', `perm_code` = '', `effect` = b'0', `icon` = '', `hidden` = b'1', `hide_children_in_menu` = b'0', `component` = 'system/social/SocialList', `component_name` = NULL, `path` = '/system/userAuth/social', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-10-19 22:45:01', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-07-26 13:35:47', `version` = 5, `deleted` = 0 WHERE `id` = 1450473063320526848;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = NULL, `title` = '第三方对接', `name` = 'third', `perm_code` = '', `effect` = b'0', `icon` = 'branches', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'RouteView', `component_name` = NULL, `path` = '/third', `redirect` = '', `sort_no` = 0, `menu_type` = 0, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-10-20 21:42:04', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-07-26 13:34:02', `version` = 4, `deleted` = 0 WHERE `id` = 1450819607680991232;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1450819607680991232, `title` = '微信', `name` = 'SocialWeChat', `perm_code` = '', `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'RouteView', `component_name` = NULL, `path` = '/third/wechat', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-10-20 21:50:28', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-07-26 13:35:55', `version` = 2, `deleted` = 0 WHERE `id` = 1450821723027881984;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1450819607680991232, `title` = '企业微信', `name` = 'SocialWeCom', `perm_code` = '', `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'RouteView', `component_name` = NULL, `path` = '/third/wecom', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-10-20 21:51:05', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-07-26 13:35:29', `version` = 3, `deleted` = 0 WHERE `id` = 1450821877831254016;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1450819607680991232, `title` = '钉钉', `name` = 'SocialDingTalk', `perm_code` = '', `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'RouteView', `component_name` = NULL, `path` = '/third/dingtalk', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-10-20 21:53:36', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-07-26 13:34:11', `version` = 2, `deleted` = 0 WHERE `id` = 1450822511087271936;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1438061887002759168, `title` = '微信', `name` = 'NoticeWeChat', `perm_code` = '', `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'Dev', `component_name` = NULL, `path` = '/notice/wechat', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-10-20 22:14:04', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-06-21 20:53:04', `version` = 1, `deleted` = 1 WHERE `id` = 1450827660459458560;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1552207982510706688, `title` = '文件管理', `name` = 'FIleUpLoad', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'develop/file/FileUploadList', `component_name` = NULL, `path` = '/develop/file', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2022-02-08 17:42:12', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-07-28 09:16:56', `version` = 2, `deleted` = 0 WHERE `id` = 1490984296616263680;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1552207982510706688, `title` = '代码生成', `name` = 'CodeGen', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'develop/codegen/CodeGenList', `component_name` = NULL, `path` = '/develop/codegen', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2022-02-19 20:33:04', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-07-27 16:25:05', `version` = 1, `deleted` = 0 WHERE `id` = 1495013564652429312;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1450822511087271936, `title` = '钉钉配置', `name` = 'DingTalkConfig', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'1', `hide_children_in_menu` = b'0', `component` = 'third/dingtalk/config/DingTalkConfigList', `component_name` = NULL, `path` = '/third/dingtalk/config', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2022-04-05 16:54:48', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-07-26 13:34:44', `version` = 3, `deleted` = 0 WHERE `id` = 1511266086400524288;

DELETE FROM `qrtz_fired_triggers` WHERE `SCHED_NAME` = 'quartzScheduler' AND `ENTRY_ID` = 'NON_CLUSTERED1658990526308';

UPDATE `qrtz_triggers` SET `JOB_NAME` = '1546857070483939328', `JOB_GROUP` = 'DEFAULT', `DESCRIPTION` = NULL, `NEXT_FIRE_TIME` = 1658990430000, `PREV_FIRE_TIME` = 1658990425000, `PRIORITY` = 5, `TRIGGER_STATE` = 'WAITING', `TRIGGER_TYPE` = 'CRON', `START_TIME` = 1657634445000, `END_TIME` = 0, `CALENDAR_NAME` = NULL, `MISFIRE_INSTR` = 0, `JOB_DATA` = '' WHERE `SCHED_NAME` = 'quartzScheduler' AND `TRIGGER_NAME` = '1546857070483939328' AND `TRIGGER_GROUP` = 'DEFAULT';
