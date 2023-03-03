SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `report_project_info`  (
                                                         `id` bigint(20) NOT NULL COMMENT '主键',
                                                         `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目名称',
                                                         `state` int(11) NULL DEFAULT NULL COMMENT '发布状态',
                                                         `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '报表内容',
                                                         `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                                                         `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
                                                         `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                                         `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修者ID',
                                                         `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
                                                         `version` int(11) NOT NULL COMMENT '乐观锁',
                                                         `deleted` bit(1) NOT NULL COMMENT '删除标志',
                                                         `index_image` bigint(20) NULL DEFAULT NULL COMMENT '预览图片id',
                                                         `edit` bit(1) NULL DEFAULT NULL COMMENT '是否在编辑中',
                                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '自定义大屏信息' ROW_FORMAT = Dynamic;

CREATE TABLE `report_project_info_publish`  (
                                                                 `id` bigint(20) NOT NULL COMMENT '主键',
                                                                 `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '报表内容',
                                                                 `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
                                                                 `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                                                 `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修者ID',
                                                                 `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
                                                                 `version` int(11) NOT NULL COMMENT '乐观锁',
                                                                 `deleted` bit(1) NOT NULL COMMENT '删除标志',
                                                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '自定义大屏发布信息' ROW_FORMAT = Dynamic;

DROP TABLE `goods_brand`;

DROP TABLE `goods_category`;

DROP TABLE `goods_category_brand`;

DROP TABLE `goods_category_parameter`;

DROP TABLE `goods_category_parameter_group`;

DROP TABLE `goods_category_specification`;

DROP TABLE `goods_goods`;

DROP TABLE `goods_goods_packing`;

DROP TABLE `goods_goods_sku`;

DROP TABLE `goods_goods_sku_attr`;

DROP TABLE `goods_goods_sku_packing`;

DROP TABLE `goods_specification`;

DROP TABLE `order_order`;

DROP TABLE `order_order_billing`;

DROP TABLE `order_order_detail`;

DROP TABLE `order_order_item_billing`;

DROP TABLE `order_order_strategy_mapping`;

DROP TABLE `sales_activity`;

DROP TABLE `sales_check_rule`;

DROP TABLE `sales_coupon`;

DROP TABLE `sales_coupon_template`;

DROP TABLE `sales_match_rule`;

DROP TABLE `sales_strategy`;

DROP TABLE `sales_strategy_check_rule`;

DROP TABLE `sales_strategy_config`;

DROP TABLE `sales_strategy_config_value`;

DROP TABLE `sales_strategy_register`;

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO `iam_client`(`id`, `code`, `name`, `system`, `enable`, `login_type_ids`, `description`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1626840094767714304, 'GoView', '可视化平台', b'0', b'1', '1430430071299207168', '', 1414143554414059520, '2023-02-18 15:04:38', 1414143554414059520, '2023-02-18 15:04:38', 0, 0);

INSERT INTO `iam_login_type`(`id`, `code`, `name`, `type`, `system`, `timeout`, `captcha`, `pwd_err_num`, `enable`, `description`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1626845524617203712, 'passwordGoView', '可视化平台登录', 'password', b'0', 3600, b'0', -1, b'1', '', 1414143554414059520, '2023-02-18 15:26:13', 1414143554414059520, '2023-02-18 15:26:13', 0, 0);

UPDATE `iam_login_type` SET `code` = 'password', `name` = '账号密码登陆', `type` = 'password', `system` = b'1', `timeout` = 3600, `captcha` = b'0', `pwd_err_num` = -1, `enable` = b'1', `description` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-08-25 15:21:20', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-11-03 22:24:53', `version` = 20, `deleted` = 0 WHERE `id` = 1430430071299207168;

INSERT INTO `iam_perm_menu`(`id`, `client_code`, `parent_id`, `title`, `name`, `perm_code`, `effect`, `icon`, `hidden`, `hide_children_in_menu`, `component`, `component_name`, `path`, `redirect`, `sort_no`, `menu_type`, `leaf`, `keep_alive`, `target_outside`, `hidden_header_content`, `admin`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1629039360928075776, 'adminv3', 1582276341792985088, '可视化大屏', 'ProjectInfoList', NULL, b'0', '', b'0', b'0', '/modules/develop/report/ProjectInfoList', NULL, '/develop/report', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2023-02-24 16:43:44', 1414143554414059520, '2023-02-24 16:44:17', 1, 0);

UPDATE `iam_perm_menu` SET `client_code` = 'adminv3', `parent_id` = 1599378992811429888, `title` = '邮件通知', `name` = 'EmailSenderDemo', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = '/modules/demo/notice/email/EmailSenderDemo.vue', `component_name` = NULL, `path` = '/demo/notice/email', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1414143554414059520, `create_time` = '2023-02-08 22:20:04', `last_modifier` = 1414143554414059520, `last_modified_time` = '2023-02-20 10:38:55', `version` = 1, `deleted` = 0 WHERE `id` = 1623325795944439808;

UPDATE `iam_user_info` SET `name` = '小小明', `username` = 'xxm', `password` = 'f52020dca765fd3943ed40a615dc2c5c', `phone` = '133****3333', `email` = 'x******@outlook.com', `client_ids` = '1430430071299207168,1430430071299207169,1626840094767714304,1580487061605175296', `avatar` = NULL, `source` = NULL, `admin` = b'1', `register_time` = '2021-06-02 15:04:12', `status` = 1, `creator` = 1, `create_time` = '2021-06-02 15:04:15', `last_modifier` = 1414143554414059520, `last_modified_time` = '2023-02-18 15:08:42', `version` = 55, `deleted` = 0 WHERE `id` = 1399985191002447872;

UPDATE `iam_user_info` SET `name` = '小小明1995', `username` = 'xxm1995', `password` = 'f52020dca765fd3943ed40a615dc2c5c', `phone` = '130****0000', `email` = 'x******@foxmail.com', `client_ids` = '1430430071299207168,1580487061605175296,1430430071299207169,1626840094767714304', `avatar` = NULL, `source` = NULL, `admin` = b'1', `register_time` = '2021-07-11 16:44:31', `status` = 1, `creator` = 1, `create_time` = '2021-07-11 16:44:32', `last_modifier` = 1414143554414059520, `last_modified_time` = '2023-02-18 15:08:48', `version` = 9, `deleted` = 0 WHERE `id` = 1414143554414059520;

SET FOREIGN_KEY_CHECKS = 1;

SET FOREIGN_KEY_CHECKS=1;
