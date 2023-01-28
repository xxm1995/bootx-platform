SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `starter_audit_data_version` ADD COLUMN `table_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据表名称' AFTER `id`;
ALTER TABLE `starter_audit_data_version` ADD COLUMN `change_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数据更新内容' AFTER `data_content`;
ALTER TABLE `starter_audit_data_version` MODIFY COLUMN `data_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据名称' AFTER `table_name`;

SET FOREIGN_KEY_CHECKS=1;
