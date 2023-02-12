SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `bpm_instance` ADD COLUMN `model_id` bigint(20) NULL DEFAULT NULL COMMENT '模型id' AFTER `instance_name`;

ALTER TABLE `bpm_model_node` ADD COLUMN `or_sign` bit(1) NULL DEFAULT NULL COMMENT '是否是或签' AFTER `sequential`;

ALTER TABLE `bpm_model_node` ADD COLUMN `ratio_pass` bit(1) NULL DEFAULT NULL COMMENT '是否比例通过' AFTER `or_sign`;

ALTER TABLE `bpm_model_node` ADD COLUMN `pass_ratio` int(3) NULL DEFAULT NULL COMMENT '通过比例' AFTER `ratio_pass`;

ALTER TABLE `bpm_model_node` MODIFY COLUMN `sequential` bit(1) NULL DEFAULT NULL COMMENT '是否串签' AFTER `multi`;

ALTER TABLE `bpm_task` ADD COLUMN `multi_id` bigint(20) NULL DEFAULT NULL COMMENT '多实例关联id' AFTER `execution_id`;

ALTER TABLE `bpm_task` ADD COLUMN `result` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '处理结果' AFTER `state`;

ALTER TABLE `bpm_task` MODIFY COLUMN `state` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '处理状态' AFTER `node_name`;

ALTER TABLE `bpm_task` MODIFY COLUMN `version` int(8) NOT NULL COMMENT '版本' AFTER `last_modified_time`;

INSERT INTO `base_dict`(`id`, `code`, `name`, `group_tag`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1570343684024705024, 'BpmTaskResult', '流程任务处理结果', '工作流', '', 1399985191002447872, '2022-09-15 17:28:05', 1399985191002447872, '2022-09-15 17:28:05', 0, 0);

INSERT INTO `base_dict`(`id`, `code`, `name`, `group_tag`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1570764395519111168, 'BpmInstanceState', '流程实例状态', '工作流', '', 1399985191002447872, '2022-09-16 21:19:50', 1399985191002447872, '2022-09-16 21:19:50', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1570343731634249728, 1570343684024705024, 'BpmTaskResult', 'pass', '通过', 0.00, '', 1399985191002447872, '2022-09-15 17:28:16', 1399985191002447872, '2022-09-15 17:28:16', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1570343761636106240, 1570343684024705024, 'BpmTaskResult', 'notPass', '不通过', 0.00, '', 1399985191002447872, '2022-09-15 17:28:23', 1399985191002447872, '2022-09-15 17:28:23', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1570343788056027136, 1570343684024705024, 'BpmTaskResult', 'abstain', '弃权', 0.00, '', 1399985191002447872, '2022-09-15 17:28:29', 1399985191002447872, '2022-09-15 17:28:29', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1570343826018672640, 1570343684024705024, 'BpmTaskResult', 'reject', '驳回', 0.00, '', 1399985191002447872, '2022-09-15 17:28:38', 1399985191002447872, '2022-09-15 17:28:38', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1570343873737269248, 1570343684024705024, 'BpmTaskResult', 'back', '退回', 0.00, '', 1399985191002447872, '2022-09-15 17:28:50', 1399985191002447872, '2022-09-15 17:28:50', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1570343913918701568, 1570343684024705024, 'BpmTaskResult', 'retrieve', '取回', 0.00, '', 1399985191002447872, '2022-09-15 17:28:59', 1399985191002447872, '2022-09-15 17:28:59', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1570685888076120064, 1570343684024705024, 'BpmTaskResult', 'autoFinish', '自动完成', 0.00, '', 1399985191002447872, '2022-09-16 16:07:52', 1399985191002447872, '2022-09-16 16:08:02', 0, 1);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1570764765255397376, 1570764395519111168, 'BpmInstanceState', 'running', '运行中', 0.00, '', 1399985191002447872, '2022-09-16 21:21:18', 1399985191002447872, '2022-09-16 21:21:18', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1570764802047832064, 1570764395519111168, 'BpmInstanceState', 'finish', '已完成', 0.00, '', 1399985191002447872, '2022-09-16 21:21:27', 1399985191002447872, '2022-09-16 21:21:27', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1570764836319490048, 1570764395519111168, 'BpmInstanceState', 'cancel', '取消', 0.00, '', 1399985191002447872, '2022-09-16 21:21:35', 1399985191002447872, '2022-09-16 21:21:35', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1570784215744585728, 1570343684024705024, 'BpmTaskResult', 'cancel', '取消', 0.00, '', 1399985191002447872, '2022-09-16 22:38:35', 1399985191002447872, '2022-09-16 22:38:35', 0, 0);

INSERT INTO `base_dict_item`(`id`, `dict_id`, `dict_code`, `code`, `name`, `sort_no`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1570784331511570432, 1567091641298386944, 'BpmTaskState', 'cancel', '取消', 0.00, '', 1399985191002447872, '2022-09-16 22:39:03', 1399985191002447872, '2022-09-16 22:39:03', 0, 0);

INSERT INTO `iam_perm_menu`(`id`, `client_code`, `parent_id`, `title`, `name`, `perm_code`, `effect`, `icon`, `hidden`, `hide_children_in_menu`, `component`, `component_name`, `path`, `redirect`, `sort_no`, `menu_type`, `leaf`, `keep_alive`, `target_outside`, `hidden_header_content`, `admin`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1571023702122766336, 'admin', 1562460770753544192, '未处理任务', 'BpmTodoTask', NULL, b'0', '', b'0', b'0', 'bpm/task/TodoTaskList', NULL, '/bpm/todo', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-09-17 14:30:13', 1399985191002447872, '2022-09-17 14:31:23', 2, 0);

INSERT INTO `iam_perm_menu`(`id`, `client_code`, `parent_id`, `title`, `name`, `perm_code`, `effect`, `icon`, `hidden`, `hide_children_in_menu`, `component`, `component_name`, `path`, `redirect`, `sort_no`, `menu_type`, `leaf`, `keep_alive`, `target_outside`, `hidden_header_content`, `admin`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1571023925834358784, 'admin', 1562460770753544192, '已处理任务', 'BpmDoneTask', NULL, b'0', '', b'0', b'0', 'bpm/task/DoneTaskList', NULL, '/bpm/done', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-09-17 14:31:07', 1399985191002447872, '2022-09-17 14:31:07', 0, 0);

INSERT INTO `iam_perm_menu`(`id`, `client_code`, `parent_id`, `title`, `name`, `perm_code`, `effect`, `icon`, `hidden`, `hide_children_in_menu`, `component`, `component_name`, `path`, `redirect`, `sort_no`, `menu_type`, `leaf`, `keep_alive`, `target_outside`, `hidden_header_content`, `admin`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1571024250171498496, 'admin', 1562460770753544192, '流程实例', 'BpmInstance', NULL, b'0', '', b'0', b'0', 'bpm/instance/InstanceList', NULL, '/bpm/instance', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-09-17 14:32:24', 1399985191002447872, '2022-09-17 14:32:24', 0, 0);

SET FOREIGN_KEY_CHECKS=1;