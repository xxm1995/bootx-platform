SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '流程实例扩展' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '流程模型' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '模型任务节点配置' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '流程任务扩展' ROW_FORMAT = Dynamic;

INSERT INTO `base_dict`(`id`, `code`, `name`, `group_tag`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1562696107020230656, 'BpmModelPublish', '工作流模型发布状态', '工作流', '工作流模型发布状态', 1399985191002447872, '2022-08-25 14:59:20', 1399985191002447872, '2022-08-25 15:27:55', 0, 1);

INSERT INTO `base_dict`(`id`, `code`, `name`, `group_tag`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1563083969989423104, 'BpmTaskAssignType', '工作流处理人分配类型', '工作流', '流程任务处理人分配类型', 1399985191002447872, '2022-08-26 16:40:34', 1399985191002447872, '2022-08-26 16:40:53', 0, 1);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1562696390043475968, 1562696107020230656, 'BpmModelPublish', 'published', '已发布', 0.00, '', 1399985191002447872, '2022-08-25 15:00:28', 1399985191002447872, '2022-08-25 15:00:28', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1562696420561231872, 1562696107020230656, 'BpmModelPublish', 'unpublished', '未发布', 0.00, '未上传xml文档', 1399985191002447872, '2022-08-25 15:00:35', 1399985191002447872, '2022-08-25 15:28:09', 0, 1);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1562703450588028928, 1562696107020230656, 'BpmModelPublish', 'unpublishedXml', '未发布(已上传BPMN)', 0.00, '有xml文档', 1399985191002447872, '2022-08-25 15:28:31', 1399985191002447872, '2022-08-25 15:34:45', 0, 1);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1563087300157747200, 1563083969989423104, 'BpmTaskAssignType', 'user', '指定用户', 0.00, '', 1399985191002447872, '2022-08-26 16:53:48', 1399985191002447872, '2022-08-26 16:53:48', 0, 0);

INSERT INTO `base_dynamic_form`(`id`, `name`, `code`, `value`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1552656018381422592, '测试表单', 'test', '{\"list\":[{\"type\":\"input\",\"label\":\"输入框\",\"options\":{\"type\":\"text\",\"width\":\"100%\",\"defaultValue\":\"\",\"placeholder\":\"请输入\",\"clearable\":true,\"maxLength\":null,\"addonBefore\":\"\",\"addonAfter\":\"\",\"hidden\":false,\"disabled\":false},\"model\":\"aa\",\"key\":\"input_1659059676533\",\"help\":\"测试\",\"rules\":[{\"required\":true,\"message\":\"必填项\"}]},{\"type\":\"textarea\",\"label\":\"文本框\",\"options\":{\"width\":\"100%\",\"minRows\":4,\"maxRows\":6,\"maxLength\":null,\"defaultValue\":\"\",\"clearable\":true,\"hidden\":false,\"disabled\":false,\"placeholder\":\"请输入\"},\"model\":\"bb\",\"key\":\"textarea_1659020414125\",\"help\":\"\",\"rules\":[{\"required\":true,\"message\":\"必填项\"}]},{\"type\":\"slider\",\"label\":\"滑动输入条\",\"options\":{\"width\":\"100%\",\"defaultValue\":34,\"disabled\":false,\"hidden\":false,\"min\":0,\"max\":100,\"step\":1,\"showInput\":false},\"model\":\"cc\",\"key\":\"slider_1659020433092\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}', '测试动态表单', 1399985191002447872, '2022-07-28 22:03:36', 1399985191002447872, '2022-07-29 09:55:22', 0, 7);

INSERT INTO `iam_perm_menu`(`id`, `client_code`, `parent_id`, `title`, `name`, `perm_code`, `effect`, `icon`, `hidden`, `hide_children_in_menu`, `component`, `component_name`, `path`, `redirect`, `sort_no`, `menu_type`, `leaf`, `keep_alive`, `target_outside`, `hidden_header_content`, `admin`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1562460770753544192, 'admin', NULL, '流程管理', 'Bpm', NULL, b'0', 'audit', b'0', b'0', 'RouteView', NULL, '/bpm', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-08-24 23:24:12', 1399985191002447872, '2022-08-24 23:25:11', 1, 0);

INSERT INTO `iam_perm_menu`(`id`, `client_code`, `parent_id`, `title`, `name`, `perm_code`, `effect`, `icon`, `hidden`, `hide_children_in_menu`, `component`, `component_name`, `path`, `redirect`, `sort_no`, `menu_type`, `leaf`, `keep_alive`, `target_outside`, `hidden_header_content`, `admin`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1562461289450536960, 'admin', 1562460770753544192, '流程模型', 'BpmModel', NULL, b'0', '', b'0', b'0', 'bpm/model/BpmModelList', NULL, '/bpm/model', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-08-24 23:26:15', 1399985191002447872, '2022-08-24 23:26:15', 0, 0);

INSERT INTO `iam_perm_menu`(`id`, `client_code`, `parent_id`, `title`, `name`, `perm_code`, `effect`, `icon`, `hidden`, `hide_children_in_menu`, `component`, `component_name`, `path`, `redirect`, `sort_no`, `menu_type`, `leaf`, `keep_alive`, `target_outside`, `hidden_header_content`, `admin`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1562461620766998528, 'admin', 1562460770753544192, '流程表单', 'BpmFrom', NULL, b'0', '', b'0', b'0', 'Dev', NULL, '/bpm/form', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-08-24 23:27:34', 1399985191002447872, '2022-08-24 23:27:56', 1, 1);

INSERT INTO `iam_perm_menu`(`id`, `client_code`, `parent_id`, `title`, `name`, `perm_code`, `effect`, `icon`, `hidden`, `hide_children_in_menu`, `component`, `component_name`, `path`, `redirect`, `sort_no`, `menu_type`, `leaf`, `keep_alive`, `target_outside`, `hidden_header_content`, `admin`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1563092672406859776, 'admin', 1537732440632524800, '我的发起', 'MyApplyList', NULL, b'0', '', b'0', b'0', 'office/myapply/MyApplyList', NULL, '/person/myApply', '', 1, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-08-26 17:15:09', 1399985191002447872, '2022-08-30 22:46:25', 1, 0);

INSERT INTO `iam_perm_menu`(`id`, `client_code`, `parent_id`, `title`, `name`, `perm_code`, `effect`, `icon`, `hidden`, `hide_children_in_menu`, `component`, `component_name`, `path`, `redirect`, `sort_no`, `menu_type`, `leaf`, `keep_alive`, `target_outside`, `hidden_header_content`, `admin`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1564626025579462656, 'admin', 1537732440632524800, '已办任务', 'MyDoneTaskList', NULL, b'0', '', b'0', b'0', 'office/mydone/MyDoneList', NULL, '/person/done', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-08-30 22:48:09', 1399985191002447872, '2022-08-30 22:48:29', 1, 0);

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1537732440632524800, `title` = '待办任务', `name` = 'MyTodoTaskList', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'office/mytodo/MyTodoList', `component_name` = NULL, `path` = '/person/todo', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2022-06-17 17:56:11', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-08-30 22:46:47', `version` = 6, `deleted` = 0 WHERE `id` = 1537735851818024960;


SET FOREIGN_KEY_CHECKS=1;