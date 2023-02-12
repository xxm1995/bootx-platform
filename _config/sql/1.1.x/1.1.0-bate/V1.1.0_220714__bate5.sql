SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `pay_alipay_config` MODIFY COLUMN `expire_time` int(10) NOT NULL COMMENT '超时配置' AFTER `sandbox`;
ALTER TABLE `pay_alipay_config` MODIFY COLUMN `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人' AFTER `state`;
ALTER TABLE `pay_alipay_config` MODIFY COLUMN `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间' AFTER `creator`;
ALTER TABLE `pay_alipay_config` MODIFY COLUMN `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人' AFTER `create_time`;
ALTER TABLE `pay_alipay_config` MODIFY COLUMN `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间' AFTER `last_modifier`;
ALTER TABLE `pay_alipay_config` MODIFY COLUMN `version` int(11) NOT NULL COMMENT '版本' AFTER `last_modified_time`;
ALTER TABLE `pay_alipay_config` MODIFY COLUMN `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除' AFTER `version`;

ALTER TABLE `pay_payment` MODIFY COLUMN `business_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务id' AFTER `user_id`;
ALTER TABLE `pay_payment` MODIFY COLUMN `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题' AFTER `business_id`;
ALTER TABLE `pay_payment` MODIFY COLUMN `description` varchar(240) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述' AFTER `title`;
ALTER TABLE `pay_payment` ADD UNIQUE INDEX `uniq_business_id`(`business_id`) USING BTREE COMMENT '业务编号id, 唯一ID';

ALTER TABLE `pay_wechat_pay_config` ADD COLUMN `api_version` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务商应用编号' AFTER `mch_id`;
ALTER TABLE `pay_wechat_pay_config` ADD COLUMN `api_key_v2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户平台「API安全」中的 APIv2 密钥' AFTER `api_version`;
ALTER TABLE `pay_wechat_pay_config` ADD COLUMN `api_key_v3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户平台「API安全」中的 APIv3 密钥' AFTER `api_key_v2`;
ALTER TABLE `pay_wechat_pay_config` ADD COLUMN `app_secret` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'APPID对应的接口密码，用于获取接口调用凭证access_token时使用' AFTER `api_key_v3`;
ALTER TABLE `pay_wechat_pay_config` ADD COLUMN `p12` bigint(20) NULL DEFAULT NULL COMMENT 'p12的文件id' AFTER `app_secret`;
ALTER TABLE `pay_wechat_pay_config` ADD COLUMN `cert_pem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'API 证书中的 cert.pem' AFTER `p12`;
ALTER TABLE `pay_wechat_pay_config` ADD COLUMN `key_pem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'API 证书中的 key.pem' AFTER `cert_pem`;
ALTER TABLE `pay_wechat_pay_config` ADD COLUMN `expire_time` int(10) NOT NULL COMMENT '超时配置' AFTER `sandbox`;
ALTER TABLE `pay_wechat_pay_config` MODIFY COLUMN `id` bigint(20) NOT NULL COMMENT '主键' FIRST;
ALTER TABLE `pay_wechat_pay_config` MODIFY COLUMN `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称' AFTER `id`;
ALTER TABLE `pay_wechat_pay_config` MODIFY COLUMN `app_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信应用AppId' AFTER `name`;
ALTER TABLE `pay_wechat_pay_config` MODIFY COLUMN `mch_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户号' AFTER `app_id`;
ALTER TABLE `pay_wechat_pay_config` MODIFY COLUMN `pay_ways` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '支持的支付类型' AFTER `return_url`;
ALTER TABLE `pay_wechat_pay_config` MODIFY COLUMN `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注' AFTER `state`;
ALTER TABLE `pay_wechat_pay_config` MODIFY COLUMN `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人' AFTER `remark`;
ALTER TABLE `pay_wechat_pay_config` MODIFY COLUMN `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间' AFTER `creator`;
ALTER TABLE `pay_wechat_pay_config` MODIFY COLUMN `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人' AFTER `create_time`;
ALTER TABLE `pay_wechat_pay_config` MODIFY COLUMN `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间' AFTER `last_modifier`;
ALTER TABLE `pay_wechat_pay_config` MODIFY COLUMN `version` int(11) NOT NULL COMMENT '版本' AFTER `last_modified_time`;
ALTER TABLE `pay_wechat_pay_config` MODIFY COLUMN `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除' AFTER `version`;
ALTER TABLE `pay_wechat_pay_config` DROP COLUMN `sl_app_id`;
ALTER TABLE `pay_wechat_pay_config` DROP COLUMN `api_key`;
ALTER TABLE `pay_wechat_pay_config` DROP COLUMN `api_key3`;

ALTER TABLE `pay_wechat_pay_config` DROP COLUMN `sl_mch_id`;
ALTER TABLE `pay_wechat_pay_config` DROP COLUMN `auth_type`;
ALTER TABLE `pay_wechat_pay_config` DROP COLUMN `cert_path`;
ALTER TABLE `pay_wechat_pay_config` DROP COLUMN `cert_pem_path`;
ALTER TABLE `pay_wechat_pay_config` DROP COLUMN `key_pem_path`;
ALTER TABLE `pay_wechat_pay_config` DROP COLUMN `partner_key`;
ALTER TABLE `pay_wechat_pay_config` DROP COLUMN `is_default`;

ALTER TABLE `pay_wechat_payment` MODIFY COLUMN `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人' AFTER `pay_time`;
ALTER TABLE `pay_wechat_payment` MODIFY COLUMN `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间' AFTER `creator`;
ALTER TABLE `pay_wechat_payment` MODIFY COLUMN `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人' AFTER `create_time`;
ALTER TABLE `pay_wechat_payment` MODIFY COLUMN `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间' AFTER `last_modifier`;
ALTER TABLE `pay_wechat_payment` MODIFY COLUMN `version` int(11) NOT NULL COMMENT '版本' AFTER `last_modified_time`;
ALTER TABLE `pay_wechat_payment` MODIFY COLUMN `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除' AFTER `version`;
ALTER TABLE `pay_wechat_payment` DROP COLUMN `tid`;

INSERT INTO `base_dict` VALUES (1546757092010078208, 'PayNotifyProcess', '支付回调处理状态', '支付服务', '成功/忽略/失败', 1399985191002447872, '2022-07-12 15:23:23', 1399985191002447872, '2022-07-12 15:23:53', 0, 1);

INSERT INTO `base_dict_item` VALUES (1546757293592522752, 1546757092010078208, 'PayNotifyProcess', '0', '失败', 0.00, '', 1399985191002447872, '2022-07-12 15:24:11', 1399985191002447872, '2022-07-12 15:24:11', 0, 0);
INSERT INTO `base_dict_item` VALUES (1546757327901929472, 1546757092010078208, 'PayNotifyProcess', '1', '成功', -1.00, '', 1399985191002447872, '2022-07-12 15:24:19', 1399985191002447872, '2022-07-12 15:31:38', 0, 2);
INSERT INTO `base_dict_item` VALUES (1546757375637303296, 1546757092010078208, 'PayNotifyProcess', '2', '忽略', 0.00, '', 1399985191002447872, '2022-07-12 15:24:30', 1399985191002447872, '2022-07-12 15:24:30', 0, 0);

INSERT INTO `base_param` VALUES (1545765299880448000, '服务器地址', 'ServerUrl', 'http://127.0.0.1:9999', 1, b'1', '', 1399985191002447872, '2022-07-09 21:42:21', 1399985191002447872, '2022-07-09 21:42:21', 0, 0);
INSERT INTO `base_param` VALUES (1547511252795912192, '微信jsapi支付回调服务地址', 'JsapiRedirectUrl', 'http://127.0.0.1/api/', 1, b'1', '', 1414143554414059520, '2022-07-14 17:20:09', 1414143554414059520, '2022-07-14 17:20:09', 0, 0);
UPDATE `base_param` SET `value` = 'http://127.0.0.1/api/' WHERE `id` = 1500338438182789120;

INSERT INTO `iam_perm_menu` VALUES (1544952211901218816, 'admin', 1546850918849249280, '支付结算台演示', 'CashierDemo', NULL, b'0', '', b'0', b'0', '', NULL, '/cashier', '', 0, 1, NULL, b'0', b'1', b'0', b'0', NULL, 1399985191002447872, '2022-07-07 15:51:26', 1399985191002447872, '2022-07-12 21:36:34', 2, 0);
INSERT INTO `iam_perm_menu` VALUES (1546850918849249280, 'admin', 1495968302034210816, '支付演示', 'DemoPay', NULL, b'0', '', b'0', b'0', 'RouteView', NULL, '/demo/pay', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-07-12 21:36:13', 1399985191002447872, '2022-07-12 21:36:13', 0, 0);

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1546850918849249280, `title` = '收银台', `name` = 'PayCashier', `perm_code` = '', `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'payment/cashier/Cashier', `component_name` = NULL, `path` = '/demo/pay/cashier', `redirect` = '', `sort_no` = -1, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-10-20 22:05:26', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-07-12 21:37:22', `version` = 3, `deleted` = 0 WHERE `id` = 1450825488577544192;
UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1546850918849249280, `title` = '组合支付', `name` = 'CombinationCashier', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'payment/combination/CombinationCashier', `component_name` = NULL, `path` = '/demo/pay/combination', `redirect` = '', `sort_no` = -0.5, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2022-03-10 17:07:56', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-07-12 21:37:59', `version` = 4, `deleted` = 0 WHERE `id` = 1501847310319972352;

UPDATE `iam_user_expand_info` SET `sex` = 1, `birthday` = '1996-12-01', `avatar` = '1495331905770315776', `last_login_time` = '2022-07-12 15:20:44', `current_login_time` = '2022-07-12 21:35:26', `initial_password` = b'0', `last_change_password_time` = '2022-06-19 21:25:00', `creator` = 1, `create_time` = '2021-06-02 15:04:15', `last_modifier` = 0, `last_modified_time` = '2022-07-12 21:35:26', `version` = 273, `deleted` = 0 WHERE `id` = 1399985191002447872;

INSERT INTO `qrtz_cron_triggers` VALUES ('quartzScheduler', '1546857070483939328', 'DEFAULT', '0/5 * * * * ? *', 'Asia/Shanghai');

INSERT INTO `qrtz_fired_triggers` VALUES ('quartzScheduler', 'NON_CLUSTERED1657763850994', '1546857070483939328', 'DEFAULT', 'NON_CLUSTERED', 1657767410672, 1657767415000, 5, 'ACQUIRED', NULL, NULL, '0', '0');

INSERT INTO `qrtz_job_details` VALUES ('quartzScheduler', '1546857070483939328', 'DEFAULT', NULL, 'cn.bootx.payment.task.PayExpiredTimeTask', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000001740009706172616D65746572707800);

INSERT INTO `qrtz_triggers` VALUES ('quartzScheduler', '1546857070483939328', 'DEFAULT', '1546857070483939328', 'DEFAULT', NULL, 1657767415000, 1657767410000, 5, 'ACQUIRED', 'CRON', 1657634445000, 0, NULL, 0, '');

INSERT INTO `starter_quartz_job` VALUES (1546857070483939328, '支付单超时检测', 'cn.bootx.payment.task.PayExpiredTimeTask', '0/5 * * * * ? *', NULL, 1, '检测超时的支付单, 超时后发送超时事件', 1399985191002447872, '2022-07-12 22:00:39', 1399985191002447872, '2022-07-12 22:00:45', 1, 0);

SET FOREIGN_KEY_CHECKS = 1;