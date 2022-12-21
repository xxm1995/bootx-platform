SET FOREIGN_KEY_CHECKS = 0;

ALTER TABLE `base_dict` ADD COLUMN `enable` bit(1) NOT NULL DEFAULT b'1' COMMENT '启用状态' AFTER `name`;

ALTER TABLE `base_dict_item` ADD COLUMN `enable` bit(1) NOT NULL DEFAULT b'1' COMMENT '启用状态' AFTER `name`;

ALTER TABLE `base_param` ADD COLUMN `enable` bit(1) NOT NULL DEFAULT b'1' COMMENT '启用状态' AFTER `type`;

SET FOREIGN_KEY_CHECKS = 1;
