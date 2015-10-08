SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `demo_chart`
-- ----------------------------
DROP TABLE IF EXISTS `demo_chart`;
CREATE TABLE `demo_chart` (
  `report_date` datetime NOT NULL,
  `employ_name` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `daily` varchar(255) NOT NULL,
  `total2` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `demo_chart2`
-- ----------------------------
DROP TABLE IF EXISTS `demo_chart2`;
CREATE TABLE `demo_chart2` (
  `report_date` datetime NOT NULL,
  `daily_number` varchar(255) NOT NULL,
  `daily_money` varchar(255) NOT NULL,
  `total_number` varchar(255) NOT NULL,
  `total_money` varchar(255) NOT NULL,
  PRIMARY KEY (`report_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `demo_duowei`
-- ----------------------------
DROP TABLE IF EXISTS `demo_duowei`;
CREATE TABLE `demo_duowei` (
  `report_date` date NOT NULL,
  `project_type` varchar(255) NOT NULL,
  `witness_income` double DEFAULT NULL,
  `listing_income` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `demo_master`
-- ----------------------------
DROP TABLE IF EXISTS `demo_master`;
CREATE TABLE `demo_master` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `demo_pet`
-- ----------------------------
DROP TABLE IF EXISTS `demo_pet`;
CREATE TABLE `demo_pet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `age` float DEFAULT NULL,
  `master_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_action_log`;
CREATE TABLE `sys_action_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_login_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `uri` varchar(2048) DEFAULT NULL,
  `headers` text,
  `data` text,
  `time` datetime DEFAULT NULL,
  `remark` text,
  `level` varchar(255) DEFAULT NULL,
  `developer` varchar(255) DEFAULT NULL,
  `menu_name` text,
  `user_dept` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `menu_id` bigint(20) DEFAULT NULL,
  `tenant_code` varchar(255) DEFAULT NULL COMMENT '所属机构',
  `user_ip` varchar(255) DEFAULT NULL,
  `user_tenant` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11930 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_axis_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_axis_config`;
CREATE TABLE `sys_axis_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_config_id` bigint(20) NOT NULL,
  `column_config_id` bigint(20) DEFAULT NULL,
  `name` varchar(1024) NOT NULL,
  `direction` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `min` varchar(1024) DEFAULT NULL,
  `max` varchar(1024) DEFAULT NULL,
  `label_rotate` int(11) DEFAULT NULL,
  `label_formatter` varchar(2048) DEFAULT NULL,
  `is_show` tinyint(2) DEFAULT '1',
  `show_split_line` tinyint(2) DEFAULT '1',
  `sort` int(11) DEFAULT '0',
  `split_number` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_binary_expression`
-- ----------------------------
DROP TABLE IF EXISTS `sys_binary_expression`;
CREATE TABLE `sys_binary_expression` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `left_var_id` bigint(20) NOT NULL,
  `op` varchar(255) NOT NULL,
  `right_var_id` bigint(20) NOT NULL,
  `tenant_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_biz_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_biz_log`;
CREATE TABLE `sys_biz_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL,
  `class_name` varchar(500) DEFAULT NULL,
  `message` text,
  `param_values` text,
  `param_types` text,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_button_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_button_config`;
CREATE TABLE `sys_button_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_config_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `is_enabled` tinyint(2) NOT NULL DEFAULT '1',
  `is_row_need_selected` tinyint(2) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `icon_class` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `window_width` int(11) NOT NULL DEFAULT '0',
  `window_height` int(11) NOT NULL DEFAULT '0',
  `before_script` text,
  `after_script` text,
  `resource_code` varchar(50) DEFAULT NULL,
  `tenant_code` varchar(50) DEFAULT NULL,
  `save_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=422 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_column_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_column_config`;
CREATE TABLE `sys_column_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_config_id` bigint(20) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `is_show` tinyint(2) NOT NULL DEFAULT '1',
  `is_show_in_list` tinyint(2) NOT NULL DEFAULT '1',
  `is_show_in_edit` tinyint(2) NOT NULL DEFAULT '1',
  `is_searchable` tinyint(2) NOT NULL DEFAULT '0',
  `is_editable` tinyint(2) NOT NULL,
  `is_required` tinyint(2) NOT NULL DEFAULT '0',
  `data_type` varchar(255) NOT NULL DEFAULT 'text',
  `dict_json` text,
  `dict_type` varchar(255) DEFAULT NULL,
  `refer_path` varchar(255) DEFAULT NULL,
  `refer_value_name` varchar(255) DEFAULT NULL,
  `refer_text_name` varchar(255) DEFAULT NULL,
  `date_format` varchar(255) NOT NULL,
  `width` varchar(255) NOT NULL DEFAULT '100',
  `align` varchar(255) NOT NULL DEFAULT 'left',
  `sort` float DEFAULT NULL,
  `is_search_required` tinyint(2) NOT NULL DEFAULT '0',
  `status` varchar(255) DEFAULT NULL,
  `is_mutiselected` tinyint(2) DEFAULT NULL,
  `html_code` varchar(255) DEFAULT NULL,
  `html_code_remark` varchar(255) DEFAULT NULL,
  `column_where_tmpl` varchar(255) DEFAULT NULL,
  `column_group_id` bigint(20) DEFAULT NULL,
  `search_type` varchar(255) DEFAULT NULL,
  `is_column_group` tinyint(2) DEFAULT '0',
  `is_row_group` tinyint(2) DEFAULT '0',
  `column_group_config_id` bigint(20) DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `default_value_start` varchar(255) DEFAULT NULL,
  `default_value_end` varchar(255) DEFAULT NULL,
  `is_new_row` tinyint(2) DEFAULT NULL,
  `is_multi_row` tinyint(2) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `tenant_code` varchar(50) DEFAULT NULL,
  `is_show_app_list` tinyint(2) NOT NULL DEFAULT '0',
  `column_remark` text,
  `renderer` text,
  `is_default_value_for_search` tinyint(2) DEFAULT NULL,
  `is_default_value_for_edit` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=970 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_column_group_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_column_group_config`;
CREATE TABLE `sys_column_group_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `report_config_id` bigint(20) DEFAULT NULL,
  `width` varchar(255) DEFAULT NULL,
  `align` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `is_type` tinyint(2) DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `pid_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_db`
-- ----------------------------
DROP TABLE IF EXISTS `sys_db`;
CREATE TABLE `sys_db` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(2048) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `user` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `driver` varchar(1024) DEFAULT NULL,
  `remark` varchar(2048) DEFAULT NULL,
  `url` varchar(2048) DEFAULT NULL,
  `test_sql` varchar(2048) DEFAULT NULL,
  `use_pool` tinyint(2) DEFAULT '0',
  `is_enabled` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_decision_policy`
-- ----------------------------
DROP TABLE IF EXISTS `sys_decision_policy`;
CREATE TABLE `sys_decision_policy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `who_rule_id` bigint(20) DEFAULT NULL,
  `biz_data_rule_id` bigint(20) DEFAULT NULL,
  `decision` varchar(255) DEFAULT NULL,
  `next` tinyint(1) DEFAULT NULL,
  `why` varchar(2048) DEFAULT NULL,
  `privilege_id` bigint(20) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `tenant_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID,非业务,主键',
  `code` varchar(255) DEFAULT NULL COMMENT '部门代码',
  `name` varchar(255) NOT NULL COMMENT '部门名',
  `pid` bigint(20) DEFAULT NULL COMMENT '上级部门ID',
  `pid_path` varchar(255) DEFAULT NULL COMMENT 'pid的路径,用逗号隔开，比如 1,2,3',
  `status` varchar(255) DEFAULT '1' COMMENT '部门状态 1-正常 2-注销',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `tenant_code` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `is_del` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_device_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_device_log`;
CREATE TABLE `sys_device_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_login_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `client_id` varchar(500) DEFAULT NULL,
  `app_id` varchar(500) DEFAULT NULL,
  `app_key` varchar(500) DEFAULT NULL,
  `data` text,
  `last_update_time` datetime DEFAULT NULL,
  `remark` text,
  `user_dept` varchar(255) DEFAULT NULL,
  `user_tenant` varchar(255) DEFAULT NULL,
  `buss_type` varchar(255) DEFAULT NULL COMMENT '业务类型:1手机端登陆 ',
  `user_ip` varchar(255) DEFAULT NULL,
  `ext_info` text,
  `ext_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT NULL,
  `dict_code` varchar(255) NOT NULL COMMENT '字典代码',
  `dict_value` varchar(255) NOT NULL COMMENT '字典取值',
  `ext_value` varchar(255) DEFAULT NULL,
  `pid_path` varchar(2000) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `last_modified` bigint(20) DEFAULT NULL,
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `is_type` tinyint(1) NOT NULL DEFAULT '0',
  `cascade_by` bigint(20) DEFAULT NULL,
  `tenant_code` varchar(255) DEFAULT NULL,
  `code_value` varchar(255) DEFAULT NULL,
  `is_show_edit` tinyint(1) DEFAULT NULL COMMENT '是否显示在编辑页面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=535 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_expression`
-- ----------------------------
DROP TABLE IF EXISTS `sys_expression`;
CREATE TABLE `sys_expression` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rule_id` bigint(20) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `left_bracket` enum('','(') DEFAULT NULL,
  `logical_op` enum('','*','+') DEFAULT NULL,
  `left_var_id` bigint(20) NOT NULL,
  `compare_op` enum('not matches','matches','not memberof','memberof','not contains','contains','!=','==','>=','<=','>','<') NOT NULL,
  `right_var_id` bigint(20) NOT NULL,
  `right_bracket` enum('',')') DEFAULT NULL,
  `tenant_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_files`
-- ----------------------------
DROP TABLE IF EXISTS `sys_files`;
CREATE TABLE `sys_files` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_type` varchar(255) DEFAULT NULL,
  `original_file_id` bigint(20) DEFAULT NULL,
  `code` varchar(1024) DEFAULT NULL,
  `title` varchar(1024) DEFAULT NULL,
  `local_path` text,
  `thumb_path` text,
  `create_at` datetime NOT NULL,
  `creator_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1059 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_form`
-- ----------------------------
DROP TABLE IF EXISTS `sys_form`;
CREATE TABLE `sys_form` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `class` varchar(255) NOT NULL,
  `menu_id` bigint(20) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `tenant_code` varchar(255) DEFAULT NULL,
  `db_table` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_form_field`
-- ----------------------------
DROP TABLE IF EXISTS `sys_form_field`;
CREATE TABLE `sys_form_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_id` bigint(20) NOT NULL COMMENT '所属表单',
  `name` varchar(255) NOT NULL COMMENT '字段名',
  `description` varchar(255) NOT NULL COMMENT '字段描述',
  `visible_policy_id` bigint(20) DEFAULT NULL,
  `editable_policy_id` bigint(20) DEFAULT NULL,
  `tenant_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_http_request_param_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_http_request_param_config`;
CREATE TABLE `sys_http_request_param_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_config_id` bigint(20) NOT NULL,
  `value_type` varchar(255) DEFAULT NULL,
  `column_name` varchar(255) DEFAULT NULL,
  `param_name` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `data_type` varchar(255) DEFAULT NULL,
  `date_format` varchar(255) DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_journal`
-- ----------------------------
DROP TABLE IF EXISTS `sys_journal`;
CREATE TABLE `sys_journal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `service_time` datetime NOT NULL,
  `tenant_code` varchar(225) DEFAULT NULL COMMENT '所属机构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_lock_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_lock_log`;
CREATE TABLE `sys_lock_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_config_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `operate` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '菜单名称',
  `link` varchar(1024) DEFAULT NULL COMMENT '菜单链接',
  `icon_cls` varchar(255) DEFAULT NULL COMMENT '菜单图标css class代码',
  `pid_path` text,
  `pid` bigint(20) DEFAULT NULL COMMENT '父级菜单ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序，越小越靠前',
  `tenant_code` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=404 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_page_column_relation`
-- ----------------------------
DROP TABLE IF EXISTS `sys_page_column_relation`;
CREATE TABLE `sys_page_column_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_config_id` bigint(20) NOT NULL,
  `page_id` varchar(255) NOT NULL,
  `column_id` bigint(20) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_param_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_param_config`;
CREATE TABLE `sys_param_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` varchar(100) NOT NULL,
  `button_config_id` bigint(20) NOT NULL,
  `tenant_code` varchar(255) DEFAULT NULL COMMENT '机构代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_policy`
-- ----------------------------
DROP TABLE IF EXISTS `sys_policy`;
CREATE TABLE `sys_policy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `who_rule_id` bigint(20) DEFAULT NULL,
  `query_id` bigint(20) DEFAULT NULL,
  `biz_data_rule_id` bigint(20) DEFAULT NULL,
  `decision` varchar(255) DEFAULT NULL,
  `next` tinyint(1) DEFAULT NULL,
  `why` varchar(2048) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `editable` tinyint(1) DEFAULT NULL,
  `tenant_code` varchar(255) DEFAULT NULL COMMENT '所属机构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_price_policy`
-- ----------------------------
DROP TABLE IF EXISTS `sys_price_policy`;
CREATE TABLE `sys_price_policy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `tenant_code` varchar(255) DEFAULT NULL COMMENT '所属机构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `sys_privilege`;
CREATE TABLE `sys_privilege` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT NULL,
  `menu_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `remark` varchar(2048) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `is_display_on_pannel` tinyint(1) DEFAULT NULL,
  `is_shared_data_query` tinyint(1) DEFAULT NULL,
  `tenant_code` varchar(255) DEFAULT NULL,
  `is_open_tenant` tinyint(1) DEFAULT NULL,
  `is_shared_data_op` tinyint(1) DEFAULT NULL,
  `need_log` tinyint(1) DEFAULT NULL,
  `developer` varchar(2048) DEFAULT NULL,
  `http_method` varchar(10) DEFAULT NULL,
  `app_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=385 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_privilege_group`
-- ----------------------------
DROP TABLE IF EXISTS `sys_privilege_group`;
CREATE TABLE `sys_privilege_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `pid_path` varchar(2046) DEFAULT NULL COMMENT '上级ID路径,用逗号隔开',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序，数字越小越靠前',
  `tenant_code` varchar(225) DEFAULT NULL COMMENT '所属机构',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_privilege_policy_relation`
-- ----------------------------
DROP TABLE IF EXISTS `sys_privilege_policy_relation`;
CREATE TABLE `sys_privilege_policy_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `privilege_id` bigint(20) NOT NULL,
  `policy_id` bigint(20) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `tenant_code` varchar(225) DEFAULT NULL COMMENT '所属机构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_procedure_param_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_procedure_param_config`;
CREATE TABLE `sys_procedure_param_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_config_id` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'IN',
  `value_type` varchar(255) NOT NULL,
  `param_name` varchar(255) DEFAULT NULL,
  `sort` tinyint(2) NOT NULL DEFAULT '0',
  `param_value` varchar(2048) DEFAULT NULL,
  `data_type` varchar(255) DEFAULT 'text',
  `date_format` varchar(255) DEFAULT 'yyyy-MM-dd HH:mm:ss',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_query`
-- ----------------------------
DROP TABLE IF EXISTS `sys_query`;
CREATE TABLE `sys_query` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '查询名称',
  `columns` text COMMENT '只显示哪些字段，若不填表示所有字段都显示',
  `value` text NOT NULL COMMENT '查询的SQL Where条件',
  `args` text COMMENT 'SQL的?对应的参数值',
  `type` varchar(255) NOT NULL DEFAULT '1' COMMENT '1- 全SQL语句 2-Where语句 3-脚本',
  `tenant_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_query_policy`
-- ----------------------------
DROP TABLE IF EXISTS `sys_query_policy`;
CREATE TABLE `sys_query_policy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `who_rule_id` bigint(20) DEFAULT NULL,
  `query_id` bigint(20) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `privilege_id` bigint(20) NOT NULL,
  `tenant_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_report_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_report_config`;
CREATE TABLE `sys_report_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_name` varchar(255) DEFAULT NULL,
  `name_field` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'dev',
  `invite_code` varchar(255) DEFAULT NULL,
  `is_use_template` tinyint(2) NOT NULL DEFAULT '0',
  `template_path` varchar(255) DEFAULT NULL,
  `freeze_num` tinyint(4) DEFAULT NULL,
  `method_script` text,
  `sort_column` varchar(50) DEFAULT NULL,
  `sort_order` varchar(50) DEFAULT NULL,
  `version` float DEFAULT NULL,
  `data_source` varchar(255) DEFAULT NULL,
  `key_search_width` int(11) NOT NULL DEFAULT '150',
  `table_type` varchar(255) DEFAULT NULL,
  `search_width` varchar(255) DEFAULT NULL,
  `show_grid_data` tinyint(2) NOT NULL DEFAULT '1',
  `head_html` text,
  `procedure_param_count` tinyint(2) DEFAULT '6',
  `is_key_required` tinyint(2) DEFAULT '0',
  `is_use_key_search` tinyint(2) DEFAULT '1',
  `is_high_search_expand` tinyint(2) DEFAULT '0',
  `is_row_dbclicked` tinyint(2) DEFAULT '1',
  `page_size` int(10) DEFAULT '100',
  `create_time` datetime DEFAULT NULL,
  `release_time` datetime DEFAULT NULL,
  `create_user_name` varchar(20) DEFAULT '',
  `release_user_name` varchar(20) DEFAULT '',
  `is_group` tinyint(4) DEFAULT NULL,
  `report_type` varchar(255) DEFAULT 'data_grid',
  `width` float DEFAULT NULL,
  `height` float DEFAULT '500',
  `is_use_column_group` tinyint(2) DEFAULT '0',
  `is_use_row_group` tinyint(2) DEFAULT '0',
  `x` varchar(255) DEFAULT '80',
  `y` varchar(255) DEFAULT '60',
  `is_show_chart` tinyint(2) DEFAULT '1',
  `show_pager` tinyint(2) DEFAULT '1',
  `chart_title` varchar(255) DEFAULT NULL,
  `is_lasy_load_total` tinyint(2) DEFAULT '0',
  `is_lock` tinyint(2) DEFAULT NULL,
  `tenant_code` varchar(20) DEFAULT NULL,
  `is_show_app` tinyint(2) DEFAULT NULL,
  `col_num_one_row` tinyint(3) DEFAULT NULL,
  `split_type` varchar(255) DEFAULT NULL,
  `split_size` varchar(255) DEFAULT NULL,
  `is_high_search_enabled` tinyint(2) DEFAULT NULL,
  `pid_field` varchar(255) DEFAULT NULL,
  `data_field` varchar(255) DEFAULT NULL,
  `total_field` varchar(255) DEFAULT NULL,
  `page_index_field` varchar(255) DEFAULT NULL,
  `page_size_field` varchar(255) DEFAULT NULL,
  `is_query_by_column_default_value` tinyint(2) DEFAULT NULL,
  `http_request_url` text,
  `before_save_script` text,
  `after_save_script` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_resource`
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `menu_id` bigint(20) DEFAULT NULL,
  `is_display_on_pannel` tinyint(1) DEFAULT NULL,
  `tenant_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_resource_operation`
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_operation`;
CREATE TABLE `sys_resource_operation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `resource_id` bigint(20) NOT NULL,
  `tenant_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_resource_policy`
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_policy`;
CREATE TABLE `sys_resource_policy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `who_rule_id` bigint(20) DEFAULT NULL,
  `biz_data_rule_id` bigint(20) DEFAULT NULL,
  `allow_operation_codes` mediumtext NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `tenant_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `remark` varchar(2048) DEFAULT NULL,
  `privileges` varchar(2048) DEFAULT NULL,
  `menus` mediumtext,
  `tenant_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_rule`
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule`;
CREATE TABLE `sys_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `expression` varchar(2048) DEFAULT NULL,
  `type` enum('dept','role','who','logical_exp') NOT NULL DEFAULT 'logical_exp',
  `tenant_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_rule_dept_relation`
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_dept_relation`;
CREATE TABLE `sys_rule_dept_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rule_id` bigint(20) NOT NULL,
  `dept_id` bigint(20) NOT NULL,
  `tenant_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_rule_role_relation`
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_role_relation`;
CREATE TABLE `sys_rule_role_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rule_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `tenant_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_rule_who_relation`
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_who_relation`;
CREATE TABLE `sys_rule_who_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rule_id` bigint(20) NOT NULL,
  `who_id` bigint(20) NOT NULL,
  `tenant_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_series_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_series_config`;
CREATE TABLE `sys_series_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_config_id` bigint(20) NOT NULL,
  `value_column_config_id` bigint(20) DEFAULT NULL,
  `category_column_config_id` bigint(20) DEFAULT NULL,
  `xaxis_config_id` bigint(20) DEFAULT NULL,
  `yaxis_config_id` bigint(20) DEFAULT NULL,
  `name` varchar(1024) NOT NULL,
  `type` varchar(255) NOT NULL,
  `label_show` tinyint(2) NOT NULL DEFAULT '0',
  `label_position` varchar(255) DEFAULT NULL,
  `available` tinyint(2) NOT NULL DEFAULT '1',
  `sort` int(11) NOT NULL DEFAULT '0',
  `center_x` varchar(255) DEFAULT NULL,
  `center_y` varchar(255) DEFAULT NULL,
  `radius_inner` varchar(255) DEFAULT NULL,
  `radius_outer` varchar(255) DEFAULT NULL,
  `rose_type` varchar(255) DEFAULT NULL,
  `area_style` varchar(255) DEFAULT NULL,
  `label_color` varchar(255) DEFAULT NULL,
  `filter` text,
  `dynamic_multi` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_sql_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_sql_log`;
CREATE TABLE `sys_sql_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `user_email` varchar(255) DEFAULT NULL COMMENT '电子邮箱',
  `operate_sql` text COMMENT '执行语句',
  `operate_args` text COMMENT '执行参数',
  `time_cost` bigint(20) DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL COMMENT '操作表名',
  `operate_result` varchar(255) DEFAULT NULL COMMENT '执行结果',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `action_log_id` bigint(20) DEFAULT NULL,
  `ds_key` varchar(255) DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_sub_report_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_sub_report_config`;
CREATE TABLE `sys_sub_report_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_config_id` bigint(20) NOT NULL,
  `rel_report_config_id` bigint(20) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `sort` tinyint(2) DEFAULT NULL,
  `refer_column` varchar(255) DEFAULT NULL,
  `rel_column` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_subscriber`
-- ----------------------------
DROP TABLE IF EXISTS `sys_subscriber`;
CREATE TABLE `sys_subscriber` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) NOT NULL,
  `price_policy_id` bigint(20) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `remainder` int(11) DEFAULT NULL,
  `subscribe_date` datetime NOT NULL,
  `tenant_code` varchar(225) DEFAULT NULL COMMENT '所属机构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_task_field`
-- ----------------------------
DROP TABLE IF EXISTS `sys_task_field`;
CREATE TABLE `sys_task_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) DEFAULT NULL,
  `field_id` bigint(20) DEFAULT NULL,
  `visible_id` bigint(20) DEFAULT NULL,
  `editable_id` bigint(20) DEFAULT NULL,
  `tenant_code` varchar(255) DEFAULT NULL COMMENT '所属机构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_task_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_task_log`;
CREATE TABLE `sys_task_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repeat_count` varchar(255) DEFAULT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime DEFAULT NULL,
  `result` varchar(255) NOT NULL,
  `description` text,
  `task_id` bigint(20) NOT NULL,
  `count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_task_param`
-- ----------------------------
DROP TABLE IF EXISTS `sys_task_param`;
CREATE TABLE `sys_task_param` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(255) NOT NULL,
  `param_value` text NOT NULL,
  `task_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_tenant`
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `address` varchar(2048) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `contactor` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `isolate_data` tinyint(1) DEFAULT NULL,
  `menus` text,
  `sort` int(11) DEFAULT NULL,
  `last_init_time` datetime DEFAULT NULL,
  `tenant_code` varchar(225) DEFAULT NULL COMMENT '所属机构',
  `alias_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_tenant_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant_privilege`;
CREATE TABLE `sys_tenant_privilege` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_code` varchar(255) NOT NULL,
  `tenant_codes` text,
  `uri` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_timed_task`
-- ----------------------------
DROP TABLE IF EXISTS `sys_timed_task`;
CREATE TABLE `sys_timed_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `clazz` varchar(255) NOT NULL,
  `schedule_type` varchar(255) DEFAULT NULL,
  `period` varchar(255) DEFAULT NULL,
  `delay` varchar(255) DEFAULT NULL,
  `first_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `repeat_count` int(11) DEFAULT '0',
  `cron` varchar(255) DEFAULT NULL,
  `status` varchar(1) DEFAULT '0',
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_transaction_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_transaction_log`;
CREATE TABLE `sys_transaction_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tid` varchar(1024) NOT NULL,
  `after_begin_at` datetime DEFAULT NULL,
  `after_run_at` datetime DEFAULT NULL,
  `after_run_exception_at` datetime DEFAULT NULL,
  `run_exception` text,
  `after_rollback_at` datetime DEFAULT NULL,
  `after_rollback_exception_at` datetime DEFAULT NULL,
  `rollback_exception` text,
  `after_commit_at` datetime DEFAULT NULL,
  `after_close_at` datetime DEFAULT NULL,
  `status` varchar(1024) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `time_cost` bigint(20) DEFAULT NULL,
  `memo` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) DEFAULT NULL COMMENT '登录名',
  `init_pwd` varchar(255) DEFAULT '' COMMENT '初始密码',
  `negative_menus` text,
  `negative_privileges` text COMMENT '负授权权限列表，用逗号隔开',
  `salt` varchar(255) DEFAULT NULL COMMENT '加点盐，密码加密用',
  `pwd` varchar(255) DEFAULT NULL COMMENT '登录密码（用户输入），当为null时使用初始密码登录',
  `must_change_pwd_first` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户登录时若密码未修改，是否强制用户修改，1-是，0-否',
  `user_pwd_valid_days` int(4) DEFAULT NULL COMMENT '用户设置的密码有效天数',
  `user_set_pwd_time` datetime DEFAULT NULL COMMENT '用户设置密码的时间',
  `name` varchar(255) NOT NULL COMMENT '用户名',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) DEFAULT NULL COMMENT '邮件地址',
  `status` varchar(255) DEFAULT 'normal' COMMENT '用户状态 正常 注销',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '主部门',
  `u_group` varchar(255) DEFAULT 'sys_admin' COMMENT '用户所属群组 sys_admin-系统管理组 dept_admin-部门管理组 normal-普通用户组',
  `age` int(2) DEFAULT NULL,
  `gender` int(2) DEFAULT NULL,
  `tenant_code` varchar(255) DEFAULT NULL,
  `roles` text COMMENT '所拥有的角色ID列表，用逗号隔开',
  `account` varchar(50) DEFAULT NULL COMMENT '工号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1732661443 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_user_avatar_relation`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_avatar_relation`;
CREATE TABLE `sys_user_avatar_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag` varchar(1024) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `avatar_id` bigint(20) NOT NULL,
  `create_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_user_dept_relation`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_dept_relation`;
CREATE TABLE `sys_user_dept_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `dept_id` bigint(20) NOT NULL,
  `is_main` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否主部门',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '删除标志',
  `tenant_code` varchar(255) DEFAULT NULL,
  `is_skip_data_perm` tinyint(1) DEFAULT NULL,
  `is_charge` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_user_log_set`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_log_set`;
CREATE TABLE `sys_user_log_set` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enable` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_user_role_relation`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role_relation`;
CREATE TABLE `sys_user_role_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `tenant_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_variable`
-- ----------------------------
DROP TABLE IF EXISTS `sys_variable`;
CREATE TABLE `sys_variable` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` enum('script','bin_calc','query','ctx','who','fixed') NOT NULL,
  `value` varchar(255) NOT NULL,
  `left_id` bigint(20) DEFAULT NULL,
  `op` enum('/','*','-','+') DEFAULT NULL,
  `right_id` bigint(20) DEFAULT NULL,
  `tenant_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `vivi_test`
-- ----------------------------
DROP TABLE IF EXISTS `vivi_test`;
CREATE TABLE `vivi_test` (
  `project_date` date DEFAULT NULL,
  `project` varchar(200) DEFAULT NULL,
  `view` varchar(200) DEFAULT NULL,
  `list` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  View structure for `v_demo_pet`
-- ----------------------------
DROP VIEW IF EXISTS `v_demo_pet`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_demo_pet` AS select `demo_pet`.`type` AS `type`,count(0) AS `count` from `demo_pet` group by `demo_pet`.`type`;

SET FOREIGN_KEY_CHECKS = 1;
