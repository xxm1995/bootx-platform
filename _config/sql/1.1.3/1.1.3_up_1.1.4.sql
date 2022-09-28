SET  FOREIGN_KEY_CHECKS=0;

CREATE TABLE `base_dynamic_data_source`  (
                                             `id` bigint(20) NOT NULL,
                                             `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '数据源编码',
                                             `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '数据源名称',
                                             `database_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '数据库类型',
                                             `db_driver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '驱动类',
                                             `db_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '数据库地址',
                                             `db_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '数据库名称',
                                             `db_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户名',
                                             `db_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '密码',
                                             `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
                                             `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
                                             `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                             `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
                                             `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
                                             `version` int(11) NOT NULL COMMENT '版本',
                                             `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除。1:已删除',
                                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '动态数据源管理' ROW_FORMAT = Dynamic;



INSERT INTO `base_dict_item` VALUES (1573665422392098816, 1439961232651034624, 'MessageTemplateCode', '0', '站内信', -11.00, 'SITE', 1399985191002447872, '2022-09-24 21:27:29', 1399985191002447872, '2022-09-24 21:27:39', 0, 1);

INSERT INTO `iam_perm_menu` VALUES (1573669546890297344, 'admin', 1552207982510706688, '动态数据源', 'DynamicSource', NULL, b'0', '', b'0', b'0', 'develop/dynamicsource/DynamicDataSourceList', NULL, '/develop/source', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-09-24 21:43:52', 1399985191002447872, '2022-09-24 21:43:52', 0, 0);

INSERT INTO `notice_message_template` VALUES (1573951326893510656, 'BpmTaskCreated', '流程任务创建事件', '流程任务创建事件', 0, '', 1399985191002447872, '2022-09-25 16:23:34', 1399985191002447872, '2022-09-25 16:23:34', 0, 0);

INSERT INTO `notice_message_template` VALUES (1573951515616219136, 'BpmTaskAssignCreated', '流程任务更改处理人事件(新处理人)', '流程任务更改处理人事件(新处理人)', 0, '', 1399985191002447872, '2022-09-25 16:24:19', 1399985191002447872, '2022-09-25 16:27:09', 1, 0);

INSERT INTO `notice_message_template` VALUES (1573952505056727040, 'BpmTaskAssignCancel', '流程任务更改处理人事件(原处理人)', '流程任务更改处理人事件(原处理人)', 0, '', 1399985191002447872, '2022-09-25 16:28:14', 1399985191002447872, '2022-09-25 16:28:14', 0, 0);

INSERT INTO `notice_message_template` VALUES (1573952568654958592, 'BpmTaskCancel', '流程任务取消事件', '流程任务取消事件', 0, '', 1399985191002447872, '2022-09-25 16:28:30', 1399985191002447872, '2022-09-25 16:28:30', 0, 0);

INSERT INTO `notice_message_template` VALUES (1573952621826150400, 'BpmTaskReject', '流程任务驳回事件', '流程任务驳回事件', 0, '', 1399985191002447872, '2022-09-25 16:28:42', 1399985191002447872, '2022-09-25 16:28:42', 0, 0);

INSERT INTO `notice_message_template` VALUES (1573952709432578048, 'BpmInstanceCompleted', '流程完成时通知发起人', '流程完成时通知发起人', 0, '', 1399985191002447872, '2022-09-25 16:29:03', 1399985191002447872, '2022-09-25 16:29:03', 0, 0);

INSERT INTO `notice_message_template` VALUES (1573952762507300864, 'BpmInstanceCancel', '流程取消时通知发起人', '流程取消时通知发起人', 0, '', 1399985191002447872, '2022-09-25 16:29:16', 1399985191002447872, '2022-09-25 16:29:16', 0, 0);

SET FOREIGN_KEY_CHECKS=1;