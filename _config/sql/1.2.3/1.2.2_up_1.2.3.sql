SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `notice_sms_channel_config`  (
                                                               `id` bigint(20) NOT NULL COMMENT '主键',
                                                               `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道编码',
                                                               `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短信签名',
                                                               `api_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短信ApiKey',
                                                               `api_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短信Api秘钥',
                                                               `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回调地址',
                                                               `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
                                                               `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                                               `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修者ID',
                                                               `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
                                                               `version` int(11) NOT NULL COMMENT '乐观锁',
                                                               `deleted` bit(1) NOT NULL COMMENT '删除标志',
                                                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短信渠道配置' ROW_FORMAT = Dynamic;

INSERT INTO `base_dict`(`id`, `code`, `name`, `enable`, `group_tag`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1633393287952257024, 'DatabaseType', '数据库类型', b'1', '开发', '数据库类型', 1414143554414059520, '2023-03-08 17:04:41', 1414143554414059520, '2023-03-08 17:04:41', 0, 0);

UPDATE `base_dict` SET `code` = 'DataScopePerm', `name` = '数据范围权限', `enable` = b'1', `group_tag` = '系统属性', `remark` = '数据范围权限', `creator` = 1414143554414059520, `create_time` = '2022-11-07 15:59:30', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-12-09 22:09:25', `deleted` = 0, `version` = 3 WHERE `id` = 1589527951317389312;

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `enable`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1633403429028536320, 1633393287952257024, 'DatabaseType', 'mysql', 'MySQL', b'1', 1.00, '', 1414143554414059520, '2023-03-08 17:44:59', 1414143554414059520, '2023-03-08 17:44:59', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `enable`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1633403459470794752, 1633393287952257024, 'DatabaseType', 'oracle', 'Oracle', b'1', 2.00, '', 1414143554414059520, '2023-03-08 17:45:07', 1414143554414059520, '2023-03-08 17:45:07', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `enable`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1633403498695925760, 1633393287952257024, 'DatabaseType', 'mssql', 'SQLServer', b'1', 3.00, '', 1414143554414059520, '2023-03-08 17:45:16', 1414143554414059520, '2023-03-08 17:45:16', 0, 0);

UPDATE `base_dict_item` SET `dict_id` = 1570764395519111168, `dict_code` = 'BpmInstanceState', `code` = 'running', `name` = '运行中', `enable` = b'1', `sort_no` = 0.00, `remark` = '', `creator` = 1399985191002447872, `create_time` = '2022-09-16 21:21:18', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-12-09 22:15:46', `deleted` = 0, `version` = 2 WHERE `id` = 1570764765255397376;

INSERT INTO `iam_perm_menu`(`id`, `client_code`, `parent_id`, `title`, `name`, `perm_code`, `effect`, `icon`, `hidden`, `hide_children_in_menu`, `component`, `component_name`, `path`, `redirect`, `sort_no`, `menu_type`, `leaf`, `keep_alive`, `target_outside`, `hidden_header_content`, `admin`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1635274568758435840, 'adminv3', 1582276341792985088, 'SQL查询语句', 'QuerySqlList', NULL, b'0', '', b'0', b'0', '/modules/develop/query/QuerySqlList', NULL, '/develop/querySql', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2023-03-13 21:40:14', 1414143554414059520, '2023-03-13 21:43:05', 2, 0);

INSERT INTO `iam_perm_menu`(`id`, `client_code`, `parent_id`, `title`, `name`, `perm_code`, `effect`, `icon`, `hidden`, `hide_children_in_menu`, `component`, `component_name`, `path`, `redirect`, `sort_no`, `menu_type`, `leaf`, `keep_alive`, `target_outside`, `hidden_header_content`, `admin`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1635895711235022848, 'adminv3', 1582276447602692096, '流程设计器', 'ProcessDesign', NULL, b'0', '', b'0', b'0', '/modules/bpm/design/ProcessDesign.vue', NULL, '/bpm/design', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2023-03-15 14:48:26', 1414143554414059520, '2023-03-15 14:48:26', 0, 0);


SET FOREIGN_KEY_CHECKS=1;
