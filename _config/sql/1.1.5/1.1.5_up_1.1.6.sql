SET FOREIGN_KEY_CHECKS = 0;

UPDATE `base_dict` SET `code` = 'BpmTaskResult', `name` = '流程任务处理结果', `group_tag` = '工作流', `remark` = '流程任务处理结果', `creator` = 1399985191002447872, `create_time` = '2022-09-15 17:28:05', `last_modifier` = 1414143554414059520, `last_modified_time` = '2022-10-19 23:13:40', `deleted` = 0, `version` = 1 WHERE `id` = 1570343684024705024;

UPDATE `base_dict` SET `code` = 'BpmInstanceState', `name` = '流程实例状态', `group_tag` = '工作流', `remark` = '流程实例状态', `creator` = 1399985191002447872, `create_time` = '2022-09-16 21:19:50', `last_modifier` = 1414143554414059520, `last_modified_time` = '2022-10-19 23:13:33', `deleted` = 0, `version` = 1 WHERE `id` = 1570764395519111168;

INSERT INTO `iam_client`(`id`, `code`, `name`, `system`, `enable`, `login_type_ids`, `description`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `version`, `deleted`) VALUES (1580487061605175296, 'adminv3', 'pc管理端(vue3版)', b'0', b'1', '1430430071299207168,1430478946919653376,1435138582839009280,1542091599907115008,1542804450312122368,1543126042909016064', 'vue3版本', 1399985191002447872, '2022-10-13 17:14:14', 1399985191002447872, '2022-10-13 17:14:25', 1, 0);

UPDATE `iam_login_type` SET `code` = 'password', `name` = '账号密码登陆', `type` = 'password', `system` = b'1', `timeout` = 3600, `captcha` = b'1', `pwd_err_num` = -1, `enable` = b'1', `description` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-08-25 15:21:20', `last_modifier` = 1414143554414059520, `last_modified_time` = '2022-11-02 21:32:48', `version` = 19, `deleted` = 0 WHERE `id` = 1430430071299207168;

UPDATE `iam_login_type` SET `code` = 'weChat', `name` = '微信登录', `type` = 'openId', `system` = b'0', `timeout` = 5, `captcha` = b'0', `pwd_err_num` = -1, `enable` = b'1', `description` = '', `creator` = 1399985191002447872, `create_time` = '2022-07-02 14:54:53', `last_modifier` = 0, `last_modified_time` = '2022-10-12 22:15:05', `version` = 2, `deleted` = 0 WHERE `id` = 1543126042909016064;

UPDATE `iam_user_expand_info` SET `sex` = 1, `birthday` = '1996-12-01', `avatar` = '1495331905770315776', `last_login_time` = '2022-10-29 08:44:52', `current_login_time` = '2022-11-02 09:59:06', `initial_password` = b'0', `last_change_password_time` = '2022-06-19 21:25:00', `creator` = 1, `create_time` = '2021-06-02 15:04:15', `last_modifier` = 0, `last_modified_time` = '2022-11-02 09:59:06', `version` = 367, `deleted` = 0 WHERE `id` = 1399985191002447872;

UPDATE `iam_user_expand_info` SET `sex` = 1, `birthday` = '2022-10-31', `avatar` = '1586953599627546624', `last_login_time` = '2022-11-02 21:32:23', `current_login_time` = '2022-11-02 21:33:21', `initial_password` = b'0', `last_change_password_time` = NULL, `creator` = 1, `create_time` = '2021-07-11 16:44:32', `last_modifier` = 0, `last_modified_time` = '2022-11-02 21:33:21', `version` = 62, `deleted` = 0 WHERE `id` = 1414143554414059520;

UPDATE `iam_user_expand_info` SET `sex` = 1, `birthday` = NULL, `avatar` = NULL, `last_login_time` = '2022-09-16 16:48:16', `current_login_time` = '2022-09-17 17:20:58', `initial_password` = b'0', `last_change_password_time` = '2022-06-29 00:39:23', `creator` = 1399985191002447872, `create_time` = '2021-09-09 17:14:54', `last_modifier` = 0, `last_modified_time` = '2022-09-17 17:20:58', `version` = 5, `deleted` = 0 WHERE `id` = 1435894470432456704;

UPDATE `iam_user_info` SET `name` = '小小明1995', `username` = 'xxm1995', `password` = 'f52020dca765fd3943ed40a615dc2c5c', `phone` = '13000000000', `email` = 'xxm1995@foxmail.com', `client_ids` = NULL, `avatar` = NULL, `source` = NULL, `admin` = b'1', `register_time` = '2021-07-11 16:44:31', `status` = 1, `creator` = 1, `create_time` = '2021-07-11 16:44:32', `last_modifier` = 1414143554414059520, `last_modified_time` = '2022-10-31 13:30:07', `version` = 5, `deleted` = 0 WHERE `id` = 1414143554414059520;

UPDATE `iam_user_info` SET `name` = '管理员', `username` = 'admin', `password` = 'f52020dca765fd3943ed40a615dc2c5c', `phone` = '13000001111', `email` = 'admin@qq.com', `client_ids` = '1430430071299207168', `avatar` = '', `source` = NULL, `admin` = b'0', `register_time` = '2021-09-09 17:14:52', `status` = 1, `creator` = 1399985191002447872, `create_time` = '2021-09-09 17:14:54', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-09-16 16:41:51', `version` = 7, `deleted` = 0 WHERE `id` = 1435894470432456704;


INSERT INTO `iam_perm_menu` VALUES (1580740450633101312, 'adminv3', NULL, '系统管理', 'System', NULL, b'0', 'ant-design:setting-outlined', b'0', b'0', 'Layout', NULL, '/system', '/system1/client', -99999, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-10-14 10:01:07', 1414143554414059520, '2022-10-18 15:32:09', 4, 0);

INSERT INTO `iam_perm_menu` VALUES (1580740637841666048, 'adminv3', 1582253306356649984, '终端管理', 'ClientList', NULL, b'0', '', b'0', b'0', '/modules/system/client/ClientList.vue', NULL, '/system/client', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-10-14 10:01:51', 1414143554414059520, '2022-10-18 14:13:27', 5, 0);

INSERT INTO `iam_perm_menu` VALUES (1580740758629232640, 'adminv3', 1582253306356649984, '登录方式', 'LoginTypeList', NULL, b'0', '', b'0', b'0', '/modules/system/loginType/LoginTypeList.vue', NULL, '/system/loginType', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-10-14 10:02:20', 1414143554414059520, '2022-10-18 14:13:40', 5, 0);

INSERT INTO `iam_perm_menu` VALUES (1580858583654051840, 'adminv3', 1580740450633101312, '测试Iframe', 'Iframe', NULL, b'0', '', b'0', b'0', 'Iframe', NULL, '/system/Iframe', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-10-14 17:50:32', 1414143554414059520, '2022-10-17 17:46:19', 5, 1);

INSERT INTO `iam_perm_menu` VALUES (1580917438227075072, 'adminv3', 1580740450633101312, '三极目录', 'hello', NULL, b'0', '', b'0', b'0', 'Layout', NULL, '/system1/a', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-10-14 21:44:24', 1399985191002447872, '2022-10-14 23:38:16', 2, 1);

INSERT INTO `iam_perm_menu` VALUES (1580917571069071360, 'adminv3', 1580917438227075072, '百度', 'baidu', NULL, b'0', '', b'0', b'0', '', NULL, 'https://www.baidu.com/', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-10-14 21:44:56', 1399985191002447872, '2022-10-14 23:37:44', 3, 1);

INSERT INTO `iam_perm_menu` VALUES (1580928436300337152, 'adminv3', 1580740450633101312, '菜单管理', 'MenuList', NULL, b'0', '', b'0', b'0', '/modules/system/menu/MenuList.vue', NULL, '/system/menu', '', -99, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1399985191002447872, '2022-10-14 22:28:06', 1399985191002447872, '2022-10-14 22:28:32', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1582249924602580992, 'adminv3', 1580740450633101312, '权限管理', 'Permission', NULL, b'0', '', b'0', b'0', 'Layout', NULL, '/system/permission', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-18 13:59:13', 1414143554414059520, '2022-10-18 13:59:13', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1582253011803262976, 'adminv3', 1580740450633101312, '用户信息', 'UserAuth', NULL, b'0', '', b'0', b'0', 'Layout', NULL, '/system/user', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-18 14:11:30', 1414143554414059520, '2022-10-18 14:11:30', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1582253152903843840, 'adminv3', 1580740450633101312, '系统配置', 'SystemConfig', NULL, b'0', '', b'0', b'0', 'Layout', NULL, '/system/config', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-18 14:12:03', 1414143554414059520, '2022-10-18 14:12:03', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1582253306356649984, 'adminv3', 1580740450633101312, '认证管理', 'Auth', NULL, b'0', '', b'0', b'0', 'Layout', NULL, '/system/auth', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-18 14:12:40', 1414143554414059520, '2022-10-18 14:13:13', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1582274981055909888, 'adminv3', NULL, '个人办公', 'Person', NULL, b'0', 'ant-design:align-right-outlined', b'0', b'0', 'Layout', NULL, '/person', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-18 15:38:47', 1414143554414059520, '2022-10-18 15:38:47', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1582275875424129024, 'adminv3', NULL, '系统监控', 'Monitor', NULL, b'0', 'ant-design:monitor-outlined', b'0', b'0', 'Layout', NULL, '/monitor', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-18 15:42:21', 1414143554414059520, '2022-10-19 17:29:29', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1582275984849326080, 'adminv3', NULL, '通知管理', 'Notice', NULL, b'0', 'ant-design:message-outlined', b'0', b'0', 'Layout', NULL, '/notice', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-18 15:42:47', 1414143554414059520, '2022-10-19 17:30:06', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1582276092038959104, 'adminv3', NULL, '第三方对接', 'Third', NULL, b'0', 'ant-design:api-twotone', b'0', b'0', 'Layout', NULL, '/third', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-18 15:43:12', 1414143554414059520, '2022-10-19 17:32:04', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1582276184120709120, 'adminv3', NULL, '支付管理', 'PayManager', NULL, b'0', 'ant-design:pay-circle-outlined', b'0', b'0', 'Layout', NULL, '/payment', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-18 15:43:34', 1414143554414059520, '2022-10-19 17:31:46', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1582276341792985088, 'adminv3', NULL, '开发管理', 'Develop', NULL, b'0', 'ant-design:apartment-outlined', b'0', b'0', 'Layout', NULL, '/develop', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-18 15:44:12', 1414143554414059520, '2022-10-19 15:24:22', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1582276447602692096, 'adminv3', NULL, '流程管理', 'Bpm', NULL, b'0', 'ant-design:file-protect-outlined', b'0', b'0', 'Layout', NULL, '/bpm', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-18 15:44:37', 1414143554414059520, '2022-10-19 17:34:11', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1582276516905177088, 'adminv3', NULL, '功能演示', 'Demo', NULL, b'0', 'ant-design:appstore-twotone', b'0', b'0', 'Layout', NULL, '/demo', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-18 15:44:54', 1414143554414059520, '2022-10-19 17:34:26', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1582277076421136384, 'adminv3', 1582249924602580992, '角色管理', 'RoleList', NULL, b'0', '', b'0', b'0', '/modules/system/role/RoleList.vue', NULL, '/system/permission/role', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-18 15:47:07', 1414143554414059520, '2022-10-18 15:59:37', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1582301940364308480, 'adminv3', 1582249924602580992, '请求权限管理', 'PermPathList', NULL, b'0', '', b'0', b'0', '/modules/system/path/PermPathList.vue', NULL, '/system/permission/path', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-18 17:25:55', 1414143554414059520, '2022-10-18 20:41:22', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1582302180999917568, 'adminv3', 1582249924602580992, '数据范围权限', 'DataScopeList', NULL, b'0', '', b'0', b'0', '/modules/system/scope/DataScopeList.vue', NULL, '/system/permission/scope', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-18 17:26:52', 1414143554414059520, '2022-10-18 17:26:52', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1582302542955769856, 'adminv3', 1582253011803262976, '用户管理', 'UserList', NULL, b'0', '', b'0', b'0', '/modules/system/user/UserList.vue', NULL, '/system/user/info', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-18 17:28:19', 1414143554414059520, '2022-10-18 17:28:19', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1582302764129808384, 'adminv3', 1582253011803262976, '部门管理', 'DeptList', NULL, b'0', '', b'0', b'0', '/modules/system/dept/DeptList.vue', NULL, '/system/user/dept', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-18 17:29:11', 1414143554414059520, '2022-10-18 17:32:26', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1582303143110340608, 'adminv3', 1582253152903843840, '数据字典', 'DictList', NULL, b'0', '', b'0', b'0', '/modules/system/dict/DictList.vue', NULL, '/system/config/dict', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-18 17:30:42', 1414143554414059520, '2022-10-18 17:30:42', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1582303290070364160, 'adminv3', 1582253152903843840, '定时任务', 'QuartzJobList', NULL, b'0', '', b'0', b'0', '/modules/system/quartz/QuartzJobList.vue', NULL, '/system/config/quartz', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-18 17:31:17', 1414143554414059520, '2022-10-18 17:32:12', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1582303447428067328, 'adminv3', 1582253152903843840, '系统参数', 'SystemParamList', NULL, b'0', '', b'0', b'0', '/modules/system/param/SystemParamList.vue', NULL, '/system/config/param', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-18 17:31:54', 1414143554414059520, '2022-10-19 23:14:16', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1582632873244172288, 'adminv3', 1582276341792985088, '文件管理', 'FileUploadList', NULL, b'0', '', b'0', b'0', '/modules/develop/file/FileUploadList.vue', NULL, '/develop/file', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-19 15:20:56', 1414143554414059520, '2022-10-19 15:20:56', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1582633196587261952, 'adminv3', 1582276341792985088, '代码生成', 'CodeGenList', NULL, b'0', '', b'0', b'0', '/modules/develop/codegen/CodeGenList.vue', NULL, '/develop/codegen', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-19 15:22:13', 1414143554414059520, '2022-10-19 15:23:17', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1582633307786649600, 'adminv3', 1582276341792985088, '动态表单', 'DynamicFormList', NULL, b'0', '', b'0', b'0', '/modules/develop/dynamicform/DynamicFormList.vue', NULL, '/develop/form', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-19 15:22:39', 1414143554414059520, '2022-10-19 15:22:39', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1582633620321017856, 'adminv3', 1582276341792985088, '动态数据源', 'DynamicDataSourceList', NULL, b'0', '', b'0', b'0', '/modules/develop/dynamicsource/DynamicDataSourceList.vue', NULL, '/develop/source', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-19 15:23:54', 1414143554414059520, '2022-10-19 15:23:54', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1583074308040925184, 'adminv3', 1582275875424129024, '接口文档', 'ApiSwagger', NULL, b'0', '', b'0', b'0', '', NULL, 'http://127.0.0.1:9999/doc.html', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-20 20:35:02', 1414143554414059520, '2022-10-20 20:35:02', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1583075229563068416, 'adminv3', 1582275875424129024, '审计日志', 'AuditLog', NULL, b'0', '', b'0', b'0', 'Layout', NULL, '/monitor/log', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-20 20:38:42', 1414143554414059520, '2022-10-20 20:41:38', 2, 0);

INSERT INTO `iam_perm_menu` VALUES (1583076217481043968, 'adminv3', 1583075229563068416, '登录日志', 'LoginLogList', NULL, b'0', '', b'0', b'0', '/modules/monitor/login/LoginLogList.vue', NULL, '/monitor/log/login', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-20 20:42:37', 1414143554414059520, '2022-10-20 20:43:36', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1583076424935514112, 'adminv3', 1583075229563068416, '操作日志', 'OperateLogList', NULL, b'0', '', b'0', b'0', '/modules/monitor/operate/OperateLogList.vue', NULL, '/monitor/log/operate', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-20 20:43:26', 1414143554414059520, '2022-10-20 20:43:26', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1583076670881112064, 'adminv3', 1583075229563068416, '数据版本日志', 'DataVersionLogList', NULL, b'0', '', b'0', b'0', '/modules/monitor/data/DataVersionLogList.vue', NULL, '/monitor/log/data', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-20 20:44:25', 1414143554414059520, '2022-10-20 20:44:25', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1583076878956339200, 'adminv3', 1582275875424129024, 'ELK日志', 'ELK', NULL, b'0', '', b'0', b'0', '', NULL, 'http://elk.dev.bootx.cn:5601/app/discover', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-20 20:45:15', 1414143554414059520, '2022-10-20 20:45:15', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1583077015434797056, 'adminv3', 1582275875424129024, 'PlumeLog日志', 'PlumeLog', NULL, b'0', '', b'0', b'0', '', NULL, 'http://127.0.0.1:9999/plumelog/#/', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-20 20:45:47', 1414143554414059520, '2022-10-20 20:45:47', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1583077198772019200, 'adminv3', 1582275875424129024, '系统信息', 'SystemInfoMonitor', NULL, b'0', '', b'0', b'0', '/modules/monitor/system/SystemInfoMonitor.vue', NULL, '/monitor/sysinfo', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-20 20:46:31', 1414143554414059520, '2022-10-20 20:46:31', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1583077360827342848, 'adminv3', 1582275875424129024, 'Redis监控', 'RedisInfoMonitor', NULL, b'0', '', b'0', b'0', '/modules/monitor/redis/RedisInfoMonitor.vue', NULL, '/monitor/redis', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-20 20:47:10', 1414143554414059520, '2022-10-20 20:47:10', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1584378294652051456, 'adminv3', 1582275984849326080, '邮件配置', 'MailConfigList', NULL, b'0', '', b'0', b'0', '/modules/notice/mail/MailConfigList.vue', NULL, '/notice/notice', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 10:56:36', 1414143554414059520, '2022-10-24 16:14:34', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1584378497824137216, 'adminv3', 1582275984849326080, '消息模板', 'MessageTemplateList', NULL, b'0', '', b'0', b'0', '/modules/notice/template/MessageTemplateList.vue', NULL, '/notice/template', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 10:57:25', 1414143554414059520, '2022-10-25 22:14:14', 2, 0);

INSERT INTO `iam_perm_menu` VALUES (1584378671266996224, 'adminv3', 1582275984849326080, '站内信', 'SiteMessageList', NULL, b'0', '', b'0', b'0', '/modules/notice/site/sender/SiteMessageList.vue', NULL, '/notice/siteMessage', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 10:58:06', 1414143554414059520, '2022-10-24 10:58:06', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1584379602188574720, 'adminv3', 1582276092038959104, '微信', 'WeChat', NULL, b'0', '', b'0', b'0', 'Layout', NULL, '/third/wechat', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:01:48', 1414143554414059520, '2022-10-24 11:01:48', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1584379704122744832, 'adminv3', 1582276092038959104, '企业微信', 'WeCom', NULL, b'0', '', b'0', b'0', 'Layout', NULL, '/third/wecom', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:02:12', 1414143554414059520, '2022-10-24 11:02:12', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1584380087805091840, 'adminv3', 1582276092038959104, '钉钉', 'DingTalk', NULL, b'0', '', b'0', b'0', 'Layout', NULL, '/third/dingtalk', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:03:44', 1414143554414059520, '2022-10-24 11:03:44', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1584380527829524480, 'adminv3', 1584379602188574720, '消息模板', 'WechatTemplateList', NULL, b'0', '', b'0', b'0', '/modules/third/wechat/template/WechatTemplateList.vue', NULL, '/third/wechat/template', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:05:29', 1414143554414059520, '2022-10-26 15:58:56', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1584380679478779904, 'adminv3', 1584379602188574720, '自定义菜单', 'WechatMenuList', NULL, b'0', '', b'0', b'0', '/modules/third/wechat/menu/WechatMenuList.vue', NULL, '/third/wechat/menu', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:06:05', 1414143554414059520, '2022-10-27 10:15:24', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1584380824308097024, 'adminv3', 1584379602188574720, '素材管理', 'WechatMediaList', NULL, b'0', '', b'0', b'0', '/modules/third/wechat/media/WechatMediaList.vue', NULL, '/third/wechat/media', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:06:40', 1414143554414059520, '2022-10-27 16:38:47', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1584381134950834176, 'adminv3', 1584379704122744832, '企微机器人', 'WeComRobotConfigList', NULL, b'0', '', b'0', b'0', '/modules/third/wecom/robot/WeComRobotConfigList.vue', NULL, '/third/wecom/robot', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:07:54', 1414143554414059520, '2022-10-24 11:07:54', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1584381322184564736, 'adminv3', 1584380087805091840, '钉钉机器人', 'DingRobotConfigList', NULL, b'0', '', b'0', b'0', '/modules/third/dingtalk/robot/DingRobotConfigList.vue', NULL, '/third/dingTalk/robot', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:08:38', 1414143554414059520, '2022-10-24 11:08:38', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1584381477986181120, 'adminv3', 1584380087805091840, '钉钉配置', 'DingRobotConfigList', NULL, b'0', '', b'0', b'0', '/modules/third/dingtalk/config/DingTalkConfigList.vue', NULL, '/third/dingtalk/config', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:09:15', 1414143554414059520, '2022-10-24 11:09:15', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1584381848238366720, 'adminv3', 1582274981055909888, '我的消息', 'SiteMessageList', NULL, b'0', '', b'0', b'0', '/modules/notice/site/receive/SiteMessageList.vue', NULL, '/person/siteMessage', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:10:44', 1414143554414059520, '2022-10-24 11:10:44', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1584381976508571648, 'adminv3', 1582274981055909888, '待办任务', 'MyTodoList', NULL, b'0', '', b'0', b'0', '/modules/office/mytodo/MyTodoList.vue', NULL, '/person/todo', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:11:14', 1414143554414059520, '2022-10-24 11:11:14', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1584382091327643648, 'adminv3', 1582274981055909888, '已办任务', 'MyDoneList', NULL, b'0', '', b'0', b'0', '/modules/office/mydone/MyDoneList.vue', NULL, '/person/done', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:11:42', 1414143554414059520, '2022-10-24 11:12:29', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1584382258307080192, 'adminv3', 1582274981055909888, '我的发起', 'MyApplyList', NULL, b'0', '', b'0', b'0', '/modules/office/myapply/MyApplyList.vue', NULL, '/person/myApply', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:12:21', 1414143554414059520, '2022-10-24 11:12:21', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1584382569381830656, 'adminv3', 1582276184120709120, '支付通道', 'PayChannel', NULL, b'0', '', b'0', b'0', 'Layout', NULL, '/payment/channel', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:13:36', 1414143554414059520, '2022-10-24 11:13:36', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1584382723186958336, 'adminv3', 1582276184120709120, '支付订单', 'PayOrder', NULL, b'0', '', b'0', b'0', 'Layout', NULL, '/payment/order', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:14:12', 1414143554414059520, '2022-10-24 11:14:12', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1584382815407120384, 'adminv3', 1582276184120709120, '回调记录', 'PayNotify', NULL, b'0', '', b'0', b'0', '/modules/payment/notify/PayNotifyRecordList', NULL, '/payment/notify', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:14:34', 1414143554414059520, '2022-10-24 11:23:17', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1584383492338425856, 'adminv3', 1582276184120709120, '钱包管理', 'Wallet', NULL, b'0', '', b'0', b'0', 'Layout', NULL, '/payment/wallet', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:17:16', 1414143554414059520, '2022-10-24 11:17:16', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1584383640942616576, 'adminv3', 1582276184120709120, '储值卡', 'Voucher', NULL, b'0', '', b'0', b'0', 'Layout', NULL, '/payment/voucher', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:17:51', 1414143554414059520, '2022-10-24 11:17:51', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1584383859121922048, 'adminv3', 1584382569381830656, '支付宝', 'AliPayConfigList', NULL, b'0', '', b'0', b'0', '/modules/payment/channel/alipay/AliPayConfigList.vue', NULL, '/payment/channel/alipay', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:18:43', 1414143554414059520, '2022-10-24 11:18:43', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1584384015338774528, 'adminv3', 1584382569381830656, '微信支付', 'WeChatConfigList', NULL, b'0', '', b'0', b'0', '/modules/payment/channel/wechat/WeChatConfigList.vue', NULL, '/payment/channel/wechat', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:19:20', 1414143554414059520, '2022-10-24 11:19:20', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1584384160574939136, 'adminv3', 1584382569381830656, '云闪付', 'WeChatConfigList', NULL, b'0', '', b'0', b'0', '/modules/payment/channel/unionpay/UnionPayConfigList.vue', NULL, '/payment/channel/unionpay', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:19:55', 1414143554414059520, '2022-10-24 11:19:55', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1584384526511185920, 'adminv3', 1584382723186958336, '支付订单', 'PaymentList', NULL, b'0', '', b'0', b'0', '/modules/payment/order/payment/PaymentList.vue', NULL, '/payment/order/payment', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:21:22', 1414143554414059520, '2022-10-24 11:21:22', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1584384752940687360, 'adminv3', 1584382723186958336, '退款订单', 'ReturnOrder', NULL, b'0', '', b'0', b'0', '/modules/payment/order/refund/RefundRecordList.vue', NULL, '/payment/order/return', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-10-24 11:22:16', 1414143554414059520, '2022-10-24 11:22:16', 0, 0);

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1431152689832525824, `title` = '接口文档', `name` = 'ApiSwagger', `perm_code` = '', `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = '', `component_name` = NULL, `path` = 'http://127.0.0.1:9999/doc.html', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = b'1', `keep_alive` = b'1', `target_outside` = b'1', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-08-27 15:15:25', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-10-14 17:47:12', `version` = 18, `deleted` = 0 WHERE `id` = 1431153358157348864;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1452567897717321728, `title` = '登录日志', `name` = 'LoginLog', `perm_code` = '', `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'starter/log/LoginLogList', `component_name` = NULL, `path` = '/monitor/log/loginLog', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-09-07 15:31:31', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-10-20 20:38:06', `version` = 6, `deleted` = 0 WHERE `id` = 1435143678721236992;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1452567897717321728, `title` = '操作日志', `name` = 'OperateLog', `perm_code` = '', `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'starter/log/OperateLogList', `component_name` = NULL, `path` = '/monitor/log/OperateLog', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-09-08 13:33:04', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-10-20 20:38:12', `version` = 8, `deleted` = 0 WHERE `id` = 1435476255797624832;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1431152689832525824, `title` = '审计日志', `name` = 'auditLog', `perm_code` = '', `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'RouteView', `component_name` = NULL, `path` = '/monitor/log', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2021-10-25 17:29:09', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-10-20 20:37:46', `version` = 2, `deleted` = 0 WHERE `id` = 1452567897717321728;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1452567897717321728, `title` = '数据版本日志', `name` = 'DataVersionLog', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'starter/log/DataVersionLogList', `component_name` = NULL, `path` = '/monitor/log/DataVersionLog', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2022-01-11 17:51:54', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-10-20 20:38:18', `version` = 1, `deleted` = 0 WHERE `id` = 1480839877352476672;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1537732440632524800, `title` = '我的消息', `name` = 'PersonSiteMessage', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'notice/site/receive/SiteMessageList', `component_name` = NULL, `path` = '/person/siteMessage', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2022-06-17 17:48:03', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-10-24 11:10:35', `version` = 4, `deleted` = 0 WHERE `id` = 1537733801860333568;

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1450821877831254016, `title` = '企微机器人', `name` = 'WeComRobot', `perm_code` = '', `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = 'third/wecom/robot/WeComRobotConfigList', `component_name` = NULL, `path` = '/third/wecom/robot', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2022-07-26 13:36:22', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-10-24 11:07:27', `version` = 3, `deleted` = 0 WHERE `id` = 1551803592828932096;

INSERT INTO `notice_mail_config`(`id`, `code`, `name`, `host`, `port`, `username`, `password`, `sender`, `from_`, `activity`, `security_type`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1554739296333955072, 'fox', 'foxmail邮箱', 'smtp.qq.com', 465, 'sJfAJDDviYlqZ3BtdjMZF8V5jVSYCaMa9DNdVGDbe/s=', '7AtgVwObaO7wrsRpLvKkoo5O+udeEcFP1ONq4gYwOj0=', 'bootx-platform平台', 'xxm1995@foxmail.com', 1, 3, 1399985191002447872, '2022-08-03 16:01:49', 1399985191002447872, '2022-08-03 16:14:55', 0, 8);

INSERT INTO `notice_mail_config`(`id`, `code`, `name`, `host`, `port`, `username`, `password`, `sender`, `from_`, `activity`, `security_type`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1584814372311744512, '11', '22', '33', 465, 'pwfAgEMJjGLjbVYEcgdXzA==', 'f3zJMwbPGmNRlNXpN5AMyA==', '666', '33333333@foxmail.com', 0, 1, 1414143554414059520, '2022-10-25 15:49:25', 1414143554414059520, '2022-10-25 16:27:12', 0, 10);

SET FOREIGN_KEY_CHECKS = 1;