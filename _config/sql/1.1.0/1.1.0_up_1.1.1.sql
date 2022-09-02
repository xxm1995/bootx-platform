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

SET FOREIGN_KEY_CHECKS=1;