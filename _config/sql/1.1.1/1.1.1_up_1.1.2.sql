SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `bpm_model_node`  (
                                                    `id` bigint(20) NOT NULL,
                                                    `model_id` bigint(20) NOT NULL COMMENT '关联模型id',
                                                    `def_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '流程定义id',
                                                    `def_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '流程key',
                                                    `node_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务节点id',
                                                    `node_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务节点名称',
                                                    `multi` bit(1) NOT NULL COMMENT '是否多任务',
                                                    `sequential` bit(1) NOT NULL COMMENT '是否串签',
                                                    `reject` bit(1) NOT NULL COMMENT '是否允许驳回',
                                                    `back` bit(1) NOT NULL COMMENT '是否允许回退',
                                                    `retrieve` bit(1) NOT NULL COMMENT '是否允许取回',
                                                    `skip` bit(1) NOT NULL COMMENT '是否跳过当前节点',
                                                    `form_id` bigint(20) NULL DEFAULT NULL COMMENT '关联表单',
                                                    `assign_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '分配类型',
                                                    `assign_raw` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '分配的原始数据',
                                                    `assign_show` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '分配的数据的展示',
                                                    `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
                                                    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                                    `last_modifier` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
                                                    `last_modified_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                                    `version` int(8) NULL DEFAULT NULL COMMENT '版本',
                                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '模型任务节点配置' ROW_FORMAT = Dynamic;

ALTER TABLE `bpm_task` ADD COLUMN `node_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务节点id' AFTER `def_name`;

ALTER TABLE `bpm_task` ADD COLUMN `node_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务节点名称' AFTER `node_id`;

ALTER TABLE `bpm_task` ADD COLUMN `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '处理意见' AFTER `state`;

ALTER TABLE `bpm_task` MODIFY COLUMN `state` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '处理结果' AFTER `node_name`;

ALTER TABLE `bpm_task` DROP COLUMN `task_node_id`;

ALTER TABLE `bpm_task` DROP COLUMN `task_name`;

DROP TABLE `bpm_model_task`;

INSERT INTO `base_dict` VALUES (1567091641298386944, 'BpmTaskState', '流程任务状态', '工作流', '流程任务状态', 1399985191002447872, '2022-09-06 18:05:37', 1399985191002447872, '2022-09-06 18:05:47', 0, 1);

INSERT INTO `base_dict_item` VALUES (1567091825981980672, 1567091641298386944, 'BpmTaskState', 'running', '处理中', 0.00, '', 1399985191002447872, '2022-09-06 18:06:21', 1399985191002447872, '2022-09-06 18:06:21', 0, 0);

INSERT INTO `base_dict_item` VALUES (1567091863017684992, 1567091641298386944, 'BpmTaskState', 'pass', '通过', 0.00, '', 1399985191002447872, '2022-09-06 18:06:30', 1399985191002447872, '2022-09-06 18:06:30', 0, 0);

INSERT INTO `base_dict_item` VALUES (1567091902414782464, 1567091641298386944, 'BpmTaskState', 'reject', '驳回', 0.00, '', 1399985191002447872, '2022-09-06 18:06:39', 1399985191002447872, '2022-09-06 18:06:51', 0, 1);

INSERT INTO `base_dict_item` VALUES (1567091993569591296, 1567091641298386944, 'BpmTaskState', 'back', '退回', 0.00, '', 1399985191002447872, '2022-09-06 18:07:01', 1399985191002447872, '2022-09-06 18:07:01', 0, 0);

INSERT INTO `base_dict_item` VALUES (1567092037261656064, 1567091641298386944, 'BpmTaskState', 'retrieve', '取回', 0.00, '', 1399985191002447872, '2022-09-06 18:07:12', 1399985191002447872, '2022-09-06 18:07:22', 0, 1);

INSERT INTO `base_dict_item` VALUES (1567092124226355200, 1567091641298386944, 'BpmTaskState', 'skip', '跳过', 0.00, '', 1399985191002447872, '2022-09-06 18:07:32', 1399985191002447872, '2022-09-06 18:07:32', 0, 0);

INSERT INTO `base_dict_item` VALUES (1567163310103564288, 1563083969989423104, 'BpmTaskAssignType', 'userGroup', '用户组', 0.00, '', 1399985191002447872, '2022-09-06 22:50:24', 1399985191002447872, '2022-09-06 22:50:24', 0, 0);

INSERT INTO `base_dict_item` VALUES (1567163343288897536, 1563083969989423104, 'BpmTaskAssignType', 'role', '角色', 0.00, '', 1399985191002447872, '2022-09-06 22:50:32', 1399985191002447872, '2022-09-06 22:50:32', 0, 0);

INSERT INTO `base_dict_item` VALUES (1567163380693700608, 1563083969989423104, 'BpmTaskAssignType', 'deptMember', '部门成员', 0.00, '', 1399985191002447872, '2022-09-06 22:50:41', 1399985191002447872, '2022-09-06 22:50:41', 0, 0);

INSERT INTO `base_dict_item` VALUES (1567163412960481280, 1563083969989423104, 'BpmTaskAssignType', 'deptLeader', '部门的负责人', 0.00, '', 1399985191002447872, '2022-09-06 22:50:49', 1399985191002447872, '2022-09-06 22:50:49', 0, 0);

INSERT INTO `base_dict_item` VALUES (1567175558888923136, 1563083969989423104, 'BpmTaskAssignType', 'roleGroup', '角色组', 0.00, '', 1399985191002447872, '2022-09-06 23:39:05', 1399985191002447872, '2022-09-06 23:39:05', 0, 0);

INSERT INTO `base_dict_item` VALUES (1567178994242002944, 1563083969989423104, 'BpmTaskAssignType', 'sponsor', '发起人', 0.00, '', 1399985191002447872, '2022-09-06 23:52:44', 1399985191002447872, '2022-09-06 23:52:44', 0, 0);

INSERT INTO `base_dict_item` VALUES (1567179143576002560, 1563083969989423104, 'BpmTaskAssignType', 'select', '用户手动选择', 0.00, '', 1399985191002447872, '2022-09-06 23:53:19', 1399985191002447872, '2022-09-07 00:01:22', 0, 1);

UPDATE `base_dict_item` SET `dict_id` = 1563083969989423104, `dict_code` = 'BpmTaskAssignType', `code` = 'user', `name` = '用户', `sort_no` = 0.00, `remark` = '', `creator` = 1399985191002447872, `create_time` = '2022-08-26 16:53:48', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-09-06 22:50:15', `deleted` = 0, `version` = 1 WHERE `id` = 1563087300157747200;

INSERT INTO `base_dynamic_form` VALUES (1552656018381422593, '测试表单1', 'test1', '{\"list\":[{\"type\":\"input\",\"label\":\"申请人\",\"options\":{\"type\":\"text\",\"width\":\"100%\",\"defaultValue\":\"\",\"placeholder\":\"请输入\",\"clearable\":true,\"maxLength\":null,\"addonBefore\":\"\",\"addonAfter\":\"\",\"hidden\":false,\"disabled\":false},\"model\":\"apply_by\",\"key\":\"input_1659059676533\",\"help\":\"测试\",\"rules\":[{\"required\":true,\"message\":\"必填项\"}]},{\"type\":\"input\",\"label\":\"请假天数\",\"options\":{\"type\":\"text\",\"width\":\"100%\",\"defaultValue\":\"\",\"placeholder\":\"请输入\",\"clearable\":false,\"maxLength\":null,\"addonBefore\":\"\",\"addonAfter\":\"\",\"hidden\":false,\"disabled\":false},\"model\":\"leave_days\",\"key\":\"input_1662106166142\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]},{\"type\":\"textarea\",\"label\":\"备注\",\"options\":{\"width\":\"100%\",\"minRows\":4,\"maxRows\":6,\"maxLength\":null,\"defaultValue\":\"\",\"clearable\":true,\"hidden\":false,\"disabled\":false,\"placeholder\":\"请输入\"},\"model\":\"remark\",\"key\":\"textarea_1659020414125\",\"help\":\"\",\"rules\":[{\"required\":true,\"message\":\"必填项\"}]},{\"type\":\"switch\",\"label\":\"开关\",\"options\":{\"defaultValue\":false,\"hidden\":false,\"disabled\":false},\"model\":\"switch_1662108221389\",\"key\":\"switch_1662108221389\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]},{\"type\":\"slider\",\"label\":\"滑动输入条\",\"options\":{\"width\":\"100%\",\"defaultValue\":34,\"disabled\":false,\"hidden\":false,\"min\":0,\"max\":100,\"step\":1,\"showInput\":false},\"model\":\"cc\",\"key\":\"slider_1659020433092\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]},{\"type\":\"table\",\"label\":\"表格布局\",\"trs\":[{\"tds\":[{\"colspan\":1,\"rowspan\":1,\"list\":[]},{\"colspan\":1,\"rowspan\":1,\"list\":[]}]},{\"tds\":[{\"colspan\":1,\"rowspan\":1,\"list\":[{\"type\":\"editor\",\"label\":\"富文本\",\"icon\":\"icon-LC_icon_edit_line_1\",\"list\":[],\"options\":{\"height\":300,\"placeholder\":\"请输入\",\"defaultValue\":\"\",\"chinesization\":true,\"hidden\":false,\"disabled\":false,\"showLabel\":false,\"width\":\"100%\"},\"model\":\"editor_1662106288134\",\"key\":\"editor_1662106288134\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}]},{\"colspan\":1,\"rowspan\":1,\"list\":[]}]}],\"options\":{\"width\":\"100%\",\"bordered\":true,\"bright\":false,\"small\":true,\"customStyle\":\"\"},\"key\":\"table_1662106283652\"}],\"config\":{\"layout\":\"vertical\",\"labelCol\":{\"xs\":6,\"sm\":6,\"md\":6,\"lg\":6,\"xl\":6,\"xxl\":6},\"labelWidth\":100,\"labelLayout\":\"Grid\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}', '测试动态表单', 1399985191002447872, '2022-07-28 22:03:36', 1414143554414059520, '2022-09-02 16:44:01', 0, 12);


SET FOREIGN_KEY_CHECKS=1;