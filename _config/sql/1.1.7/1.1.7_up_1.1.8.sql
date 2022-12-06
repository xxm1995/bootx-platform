SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO `base_dict`(`id`, `code`, `name`, `group_tag`, `remark`, `creator`, `create_time`, `last_modifier`, `last_modified_time`, `deleted`, `version`) VALUES (1589527951317389312, 'DataScopePerm', '数据范围权限', '系统属性', '数据范围权限', 1414143554414059520, '2022-11-07 15:59:30', 1414143554414059520, '2022-11-07 16:00:27', 0, 1);

INSERT INTO `base_dict_item` VALUES (1589528254477488128, 1589527951317389312, 'DataScopePerm', '7', '所在及下级部门', 0.00, '', 1414143554414059520, '2022-11-07 16:00:43', 1414143554414059520, '2022-11-07 16:00:43', 0, 0);

INSERT INTO `base_dict_item` VALUES (1589528283539820544, 1589527951317389312, 'DataScopePerm', '6', '所在部门', 0.00, '', 1414143554414059520, '2022-11-07 16:00:49', 1414143554414059520, '2022-11-07 16:00:49', 0, 0);

INSERT INTO `base_dict_item` VALUES (1589528315672383488, 1589527951317389312, 'DataScopePerm', '5', '全部数据', 0.00, '', 1414143554414059520, '2022-11-07 16:00:57', 1414143554414059520, '2022-11-07 16:00:57', 0, 0);

INSERT INTO `base_dict_item` VALUES (1589528340267782144, 1589527951317389312, 'DataScopePerm', '4', '部门和用户范围', 0.00, '', 1414143554414059520, '2022-11-07 16:01:03', 1414143554414059520, '2022-11-07 16:01:03', 0, 0);

INSERT INTO `base_dict_item` VALUES (1589528367228768256, 1589527951317389312, 'DataScopePerm', '3', '部门范围', 0.00, '', 1414143554414059520, '2022-11-07 16:01:09', 1414143554414059520, '2022-11-07 16:01:09', 0, 0);

INSERT INTO `base_dict_item` VALUES (1589528393292173312, 1589527951317389312, 'DataScopePerm', '2', '用户范围', 0.00, '', 1414143554414059520, '2022-11-07 16:01:16', 1414143554414059520, '2022-11-07 16:01:16', 0, 0);

INSERT INTO `base_dict_item` VALUES (1589528423956729856, 1589527951317389312, 'DataScopePerm', '1', '自身数据', 0.00, '', 1414143554414059520, '2022-11-07 16:01:23', 1414143554414059520, '2022-11-07 16:01:23', 0, 0);

DELETE FROM `iam_perm_menu` WHERE `id` = 1476489893513404416;

DELETE FROM `iam_perm_menu` WHERE `id` = 1478002945936015360;

DELETE FROM `iam_perm_menu` WHERE `id` = 1478004271512240128;

INSERT INTO `iam_perm_menu` VALUES (1591689087570378752, 'adminv3', 1582276447602692096, '流程模型', 'BpmModelList', NULL, b'0', '', b'0', b'0', '/modules/bpm/model/BpmModelList.vue', NULL, '/bpm/model', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-11-13 15:07:05', 1414143554414059520, '2022-11-13 15:07:05', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1591689307427405824, 'adminv3', 1582276447602692096, '未处理任务', 'TodoTaskList', NULL, b'0', '', b'0', b'0', '/modules/bpm/task/TodoTaskList.vue', NULL, '/bpm/todo', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-11-13 15:07:58', 1414143554414059520, '2022-11-14 22:45:57', 2, 0);

INSERT INTO `iam_perm_menu` VALUES (1591689479075102720, 'adminv3', 1582276447602692096, '已处理任务', 'BpmDoneTask', NULL, b'0', '', b'0', b'0', '/modules/bpm/task/DoneTaskList.vue', NULL, '/bpm/done', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-11-13 15:08:39', 1414143554414059520, '2022-11-13 15:14:17', 3, 0);

INSERT INTO `iam_perm_menu` VALUES (1591690820224778240, 'adminv3', 1582276447602692096, '流程实例', 'BpmInstance', NULL, b'0', '', b'0', b'0', '/modules/bpm/instance/InstanceList.vue', NULL, '/bpm/instance', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-11-13 15:13:58', 1414143554414059520, '2022-11-13 15:13:58', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1594586131247075328, 'adminv3', 1582275875424129024, 'ELK日志x', 'ELKx', NULL, b'0', '', b'0', b'0', 'Iframe', NULL, '/monitor/elk', 'https://www.antdv.com/components/overview-cn', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-11-21 14:58:54', 1414143554414059520, '2022-11-21 15:21:35', 6, 0);

INSERT INTO `iam_perm_menu` VALUES (1595255743081025536, 'adminv3', 1580740450633101312, '菜单管理1', '', NULL, b'0', '', b'0', b'0', '', NULL, 'outside:////system/menu?onlytab=1&__full__', '', -99, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-11-23 11:19:42', 1414143554414059520, '2022-11-23 21:02:52', 20, 1);

INSERT INTO `iam_perm_menu` VALUES (1597044371008516096, 'adminv3', NULL, '功能演示', 'Demo', NULL, b'0', '', b'0', b'0', 'Layout', NULL, '/demo', '', 0, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-11-28 09:47:04', 1414143554414059520, '2022-11-28 09:47:04', 0, 1);

INSERT INTO `iam_perm_menu` VALUES (1597102799370317824, 'adminv3', 1582276516905177088, '数据相关', 'DemoData', NULL, b'0', '', b'0', b'0', 'Layout', NULL, '/demo/data', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-11-28 13:39:15', 1414143554414059520, '2022-11-28 13:39:15', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1597210969883275264, 'adminv3', 1582276516905177088, '超级查询', 'SuperQueryDemoList', NULL, b'0', '', b'0', b'0', '/modules/demo/query/SuperQueryDemoList.vue', NULL, '/demo/query/super', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-11-28 20:49:05', 1414143554414059520, '2022-11-28 21:00:14', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1598306560788877312, 'adminv3', 1584383492338425856, '钱包列表', 'WalletList', NULL, b'0', '', b'0', b'0', '/modules/payment/wallet/list/WalletList.vue', NULL, '/payment/wallet/list', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-12-01 21:22:34', 1414143554414059520, '2022-12-01 21:22:34', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1598306760764903424, 'adminv3', 1584383492338425856, '个人钱包', 'MyWallet', NULL, b'0', '', b'0', b'0', '/modules/payment/wallet/personal/MyWallet.vue', NULL, '/payment/wallet/personal', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-12-01 21:23:22', 1414143554414059520, '2022-12-01 21:23:22', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1599337250200440832, 'adminv3', NULL, '关于', '', NULL, b'0', 'simple-icons:about-dot-me', b'0', b'0', '', NULL, '/about/index', '', 99, 0, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-12-04 17:38:09', 1414143554414059520, '2022-12-04 17:43:32', 3, 0);

INSERT INTO `iam_perm_menu` VALUES (1599378494880436224, 'adminv3', 1582276516905177088, 'WS演示', '', NULL, b'0', '', b'0', b'0', '', NULL, '/demo/ws', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-12-04 20:22:03', 1414143554414059520, '2022-12-04 20:22:03', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1599378579513102336, 'adminv3', 1582276516905177088, '幂等请求演示', '', NULL, b'0', '', b'0', b'0', '', NULL, '/demo/idempotent', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-12-04 20:22:23', 1414143554414059520, '2022-12-04 20:22:23', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1599378728490586112, 'adminv3', 1582276516905177088, '消息中间件演示', '', NULL, b'0', '', b'0', b'0', '', NULL, '/demo/mq', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-12-04 20:22:59', 1414143554414059520, '2022-12-04 20:23:12', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1599378838519762944, 'adminv3', 1582276516905177088, '富文本编辑', '', NULL, b'0', '', b'0', b'0', '', NULL, '/demo/wangEditor', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-12-04 20:23:25', 1414143554414059520, '2022-12-04 20:23:25', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1599378992811429888, 'adminv3', 1582276516905177088, '消息通知', '', NULL, b'0', '', b'0', b'0', 'Layout', NULL, '/demo/notice', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-12-04 20:24:02', 1414143554414059520, '2022-12-04 20:24:37', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1599379197124366336, 'adminv3', 1582276516905177088, '支付演示', '', NULL, b'0', '', b'0', b'0', 'Layout', NULL, '/demo/pay', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-12-04 20:24:50', 1414143554414059520, '2022-12-04 20:24:50', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1599379348144476160, 'adminv3', 1599379197124366336, '收银台', 'SimpleCashier', NULL, b'0', '', b'0', b'0', '/demo/payment/cashier/SimpleCashier.vue', NULL, '/demo/pay/cashier', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-12-04 20:25:26', 1414143554414059520, '2022-12-05 21:28:10', 1, 0);

INSERT INTO `iam_perm_menu` VALUES (1599379428784164864, 'adminv3', 1599379197124366336, '组合支付', '', NULL, b'0', '', b'0', b'0', '', NULL, '/demo/pay/combination', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-12-04 20:25:46', 1414143554414059520, '2022-12-04 20:25:46', 0, 0);

INSERT INTO `iam_perm_menu` VALUES (1599379539232772096, 'adminv3', 1599379197124366336, '支付结算台演示', '', NULL, b'0', '', b'0', b'0', '', NULL, 'outside:///cashier', '', 0, 1, NULL, b'1', b'0', b'0', b'0', NULL, 1414143554414059520, '2022-12-04 20:26:12', 1414143554414059520, '2022-12-04 20:26:34', 1, 0);

UPDATE `iam_perm_menu` SET `client_code` = 'admin', `parent_id` = 1546850918849249280, `title` = '支付结算台演示', `name` = 'CashierDemo', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = '', `component_name` = NULL, `path` = '/cashier', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'0', `target_outside` = b'1', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1399985191002447872, `create_time` = '2022-07-07 15:51:26', `last_modifier` = 1399985191002447872, `last_modified_time` = '2022-11-23 15:31:08', `version` = 4, `deleted` = 0 WHERE `id` = 1544952211901218816;

UPDATE `iam_perm_menu` SET `client_code` = 'adminv3', `parent_id` = 1582275875424129024, `title` = '接口文档', `name` = 'ApiSwagger', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = '', `component_name` = NULL, `path` = 'http://127.0.0.1:9999/doc.html', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1414143554414059520, `create_time` = '2022-10-20 20:35:02', `last_modifier` = 1414143554414059520, `last_modified_time` = '2022-11-23 13:59:09', `version` = 2, `deleted` = 0 WHERE `id` = 1583074308040925184;

UPDATE `iam_perm_menu` SET `client_code` = 'adminv3', `parent_id` = 1582275875424129024, `title` = 'ELK日志', `name` = 'ELK', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = '', `component_name` = NULL, `path` = 'http://elk.dev.bootx.cn:5601/app/discover', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1414143554414059520, `create_time` = '2022-10-20 20:45:15', `last_modifier` = 1414143554414059520, `last_modified_time` = '2022-11-21 15:04:13', `version` = 2, `deleted` = 0 WHERE `id` = 1583076878956339200;

UPDATE `iam_perm_menu` SET `client_code` = 'adminv3', `parent_id` = 1584379704122744832, `title` = '企微机器人', `name` = 'WeComRobotConfigList', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = '/modules/third/wecom/robot/WecomRobotConfigList.vue', `component_name` = NULL, `path` = '/third/wecom/robot', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1414143554414059520, `create_time` = '2022-10-24 11:07:54', `last_modifier` = 1414143554414059520, `last_modified_time` = '2022-11-12 20:58:25', `version` = 3, `deleted` = 0 WHERE `id` = 1584381134950834176;

UPDATE `iam_perm_menu` SET `client_code` = 'adminv3', `parent_id` = 1584380087805091840, `title` = '钉钉机器人', `name` = 'DingRobotConfigList', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = '/modules/third/dingtalk/robot/DingRobotConfigList.vue', `component_name` = NULL, `path` = '/third/dingTalk/robot', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1414143554414059520, `create_time` = '2022-10-24 11:08:38', `last_modifier` = 1414143554414059520, `last_modified_time` = '2022-11-12 20:58:37', `version` = 6, `deleted` = 0 WHERE `id` = 1584381322184564736;

UPDATE `iam_perm_menu` SET `client_code` = 'adminv3', `parent_id` = 1584380087805091840, `title` = '钉钉配置', `name` = 'DingRobotConfigList', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'1', `hide_children_in_menu` = b'0', `component` = '/modules/third/dingtalk/config/DingTalkConfigList.vue', `component_name` = NULL, `path` = '/third/dingtalk/config', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1414143554414059520, `create_time` = '2022-10-24 11:09:15', `last_modifier` = 1414143554414059520, `last_modified_time` = '2022-11-11 16:04:47', `version` = 1, `deleted` = 1 WHERE `id` = 1584381477986181120;

UPDATE `iam_perm_menu` SET `client_code` = 'adminv3', `parent_id` = 1582274981055909888, `title` = '我的消息', `name` = 'SiteMessageListReceive', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = '/modules/notice/site/receive/SiteMessageList.vue', `component_name` = NULL, `path` = '/person/siteMessage', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1414143554414059520, `create_time` = '2022-10-24 11:10:44', `last_modifier` = 1414143554414059520, `last_modified_time` = '2022-11-17 09:08:02', `version` = 1, `deleted` = 0 WHERE `id` = 1584381848238366720;

UPDATE `iam_perm_menu` SET `client_code` = 'adminv3', `parent_id` = 1582276184120709120, `title` = '储值卡', `name` = 'Voucher', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = '/modules/payment/voucher/VoucherList.vue', `component_name` = NULL, `path` = '/payment/voucher', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1414143554414059520, `create_time` = '2022-10-24 11:17:51', `last_modifier` = 1414143554414059520, `last_modified_time` = '2022-12-01 22:17:39', `version` = 1, `deleted` = 0 WHERE `id` = 1584383640942616576;

UPDATE `iam_perm_menu` SET `client_code` = 'adminv3', `parent_id` = 1584382569381830656, `title` = '支付宝', `name` = 'AliPayConfigList', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = '/modules/payment/channel/alipay/AlipayConfigList.vue', `component_name` = NULL, `path` = '/payment/channel/alipay', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1414143554414059520, `create_time` = '2022-10-24 11:18:43', `last_modifier` = 1414143554414059520, `last_modified_time` = '2022-11-22 15:20:37', `version` = 1, `deleted` = 0 WHERE `id` = 1584383859121922048;

UPDATE `iam_perm_menu` SET `client_code` = 'adminv3', `parent_id` = 1584382569381830656, `title` = '微信支付', `name` = 'WeChatConfigList', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = '/modules/payment/channel/wechat/WechatPayConfigList.vue', `component_name` = NULL, `path` = '/payment/channel/wechat', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1414143554414059520, `create_time` = '2022-10-24 11:19:20', `last_modifier` = 1414143554414059520, `last_modified_time` = '2022-11-22 22:22:07', `version` = 1, `deleted` = 0 WHERE `id` = 1584384015338774528;

UPDATE `iam_perm_menu` SET `client_code` = 'adminv3', `parent_id` = 1584382569381830656, `title` = '云闪付', `name` = 'UnionPayConfigList', `perm_code` = NULL, `effect` = b'0', `icon` = '', `hidden` = b'0', `hide_children_in_menu` = b'0', `component` = '/modules/payment/channel/unionpay/UnionPayConfigList.vue', `component_name` = NULL, `path` = '/payment/channel/unionpay', `redirect` = '', `sort_no` = 0, `menu_type` = 1, `leaf` = NULL, `keep_alive` = b'1', `target_outside` = b'0', `hidden_header_content` = b'0', `admin` = b'0', `remark` = NULL, `creator` = 1414143554414059520, `create_time` = '2022-10-24 11:19:55', `last_modifier` = 1414143554414059520, `last_modified_time` = '2022-11-22 22:27:32', `version` = 1, `deleted` = 0 WHERE `id` = 1584384160574939136;

SET FOREIGN_KEY_CHECKS = 1;