/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : offer

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 06/05/2021 22:38:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-05-03 22:28:01', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-05-03 22:28:01', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-05-03 22:28:01', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2021-05-03 22:28:01', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2021-05-03 22:28:01', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2021-05-03 22:28:01', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2021-05-03 22:28:01', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.ignoreFooter', 'true', 'Y', 'admin', '2021-05-03 22:28:01', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 163 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '2017', '1', 'res_year', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:50:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '2018', '2', 'res_year', '', '', 'Y', '0', 'admin', '2021-05-04 05:50:12', 'admin', '2021-05-04 05:50:27', '');
INSERT INTO `sys_dict_data` VALUES (102, 3, '2019', '3', 'res_year', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:50:22', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 4, '2020', '4', 'res_year', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:50:43', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 5, '2021', '5', 'res_year', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:50:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 1, 'Fall', '1', 'res_term', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:51:43', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 2, 'Spring', '2', 'res_term', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:51:51', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 3, 'Summer', '3', 'res_term', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:51:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 1, 'MS', '1', 'res_study', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:55:33', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 2, 'PhD', '2', 'res_study', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:55:39', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 3, 'MA', '3', 'res_study', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:55:47', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 4, 'MPH', '4', 'res_study', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:55:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 5, 'BA', '5', 'res_study', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:56:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 6, 'MBA', '6', 'res_study', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:56:10', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 7, 'MEd', '7', 'res_study', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:56:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 8, 'Meng', '8', 'res_study', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:56:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 9, 'LLM', '9', 'res_study', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:56:34', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 10, 'JD', '10', 'res_study', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:56:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 11, 'MPhil', '11', 'res_study', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:56:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (119, 12, 'BS', '12', 'res_study', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:56:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (120, 1, '计算机科学/软件工程', '1', 'res_major', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:58:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (121, 2, '信息系统/信息科学', '2', 'res_major', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:58:43', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (122, 3, '电子工程', '3', 'res_major', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:58:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (123, 4, '生物医学工程', '4', 'res_major', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:59:10', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (124, 5, '机械工程', '5', 'res_major', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 05:59:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (125, 6, '电子工程', '6', 'res_major', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:00:34', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (126, 7, '生物医学工程', '7', 'res_major', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:00:47', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (127, 8, '机械工程', '8', 'res_major', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:00:55', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (128, 9, '工业工程/运筹', '9', 'res_major', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:01:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (129, 10, '统计/生统', '10', 'res_major', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:01:17', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (130, 11, '生物信息', '11', 'res_major', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:01:36', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (131, 11, '金融金工金数', '11', 'res_major', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:01:51', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (132, 13, '经济商科', '13', 'res_major', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:02:00', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (133, 14, '数学/应数', '14', 'res_major', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:02:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (134, 15, '物理', '15', 'res_major', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:02:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (135, 16, '会计', '16', 'res_major', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:02:33', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (136, 17, '化学化工', '17', 'res_major', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:02:45', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (137, 18, '材料', '18', 'res_major', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:02:54', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (138, 19, '人文文科', '19', 'res_major', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:03:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (139, 20, '土木建筑', '20', 'res_major', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:03:39', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (140, 1, 'Offer全奖', '1', 'res_result', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:05:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (141, 2, 'AD小奖', '2', 'res_result', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:05:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (142, 3, 'AD无奖', '3', 'res_result', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:05:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (143, 4, 'Reject', '4', 'res_result', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:06:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (144, 5, 'WaitingList', '5', 'res_result', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:06:22', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (145, 1, 'email通知', '1', 'res_notice', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:07:12', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (146, 2, '书面邮件通知', '2', 'res_notice', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:07:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (147, 3, '网申status页面', '3', 'res_notice', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:07:36', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (148, 4, '电话问出来的', '4', 'res_notice', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:07:55', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (149, 5, 'others', '5', 'res_notice', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 06:08:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (150, 1, '2021-Fall', '1', 'req_year', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 14:10:40', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (151, 2, '2021-Spring', '2', 'req_year', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 14:10:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (152, 3, '2021-Summer', '3', 'req_year', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 14:11:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (153, 4, '2020-Fall', '4', 'req_year', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 14:11:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (154, 5, '2020-Spring', '5', 'req_year', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 14:11:41', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (155, 6, '2020-Summer', '6', 'req_year', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 14:11:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (156, 1, 'AD-自费', '1', 'req_target', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 14:12:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (157, 2, 'Offer-全奖', '2', 'req_target', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 14:12:40', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (158, 1, '审核中', '0', 'report_status', '', '', 'Y', '0', 'admin', '2021-05-04 17:34:33', 'admin', '2021-05-04 17:35:09', '');
INSERT INTO `sys_dict_data` VALUES (159, 2, '审核通过', '1', 'report_status', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 17:34:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (160, 3, '审核拒绝', '2', 'report_status', NULL, NULL, 'Y', '0', 'admin', '2021-05-04 17:35:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (161, 1, '未读', '0', 'msg_status', NULL, NULL, 'Y', '0', 'admin', '2021-05-06 05:19:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (162, 2, '已读', '1', 'msg_status', NULL, NULL, 'Y', '0', 'admin', '2021-05-06 05:19:27', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-05-03 22:28:01', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '录取学年', 'res_year', '0', 'admin', '2021-05-04 05:47:16', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '录取学期', 'res_term', '0', 'admin', '2021-05-04 05:48:00', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '录取学位', 'res_study', '0', 'admin', '2021-05-04 05:48:16', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '录取专业', 'res_major', '0', 'admin', '2021-05-04 05:48:25', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '录取结果', 'res_result', '0', 'admin', '2021-05-04 05:48:37', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (105, '录取通知方式', 'res_notice', '0', 'admin', '2021-05-04 05:48:48', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (107, '申请目标', 'req_target', '0', 'admin', '2021-05-04 13:58:24', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (108, '上报状态', 'report_status', '0', 'admin', '2021-05-04 14:34:45', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (109, '消息状态', 'msg_status', '0', 'admin', '2021-05-06 05:18:38', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 339 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2035 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2021-05-03 22:28:00', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2021-05-03 22:28:00', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2021-05-03 22:28:00', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2021-05-03 22:28:00', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2021-05-03 22:28:00', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2021-05-03 22:28:00', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2021-05-03 22:28:00', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2021-05-03 22:28:00', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2021-05-03 22:28:00', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2021-05-03 22:28:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, 'offer', 0, 2, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-bars', 'admin', '2021-05-03 13:12:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '用户背景', 2000, 1, '/system/bag', '', 'C', '0', '1', 'system:bag:view', '#', 'admin', '2021-05-03 22:29:11', '', NULL, '用户背景菜单');
INSERT INTO `sys_menu` VALUES (2002, '用户背景查询', 2001, 1, '#', '', 'F', '0', '1', 'system:bag:list', '#', 'admin', '2021-05-03 22:29:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '用户背景新增', 2001, 2, '#', '', 'F', '0', '1', 'system:bag:add', '#', 'admin', '2021-05-03 22:29:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '用户背景修改', 2001, 3, '#', '', 'F', '0', '1', 'system:bag:edit', '#', 'admin', '2021-05-03 22:29:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '用户背景删除', 2001, 4, '#', '', 'F', '0', '1', 'system:bag:remove', '#', 'admin', '2021-05-03 22:29:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '用户背景导出', 2001, 5, '#', '', 'F', '0', '1', 'system:bag:export', '#', 'admin', '2021-05-03 22:29:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '用户上报', 2000, 1, '/system/report', '', 'C', '0', '1', 'system:report:view', '#', 'admin', '2021-05-04 14:20:21', '', NULL, '用户上报菜单');
INSERT INTO `sys_menu` VALUES (2008, '用户上报查询', 2007, 1, '#', '', 'F', '0', '1', 'system:report:list', '#', 'admin', '2021-05-04 14:20:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '用户上报新增', 2007, 2, '#', '', 'F', '0', '1', 'system:report:add', '#', 'admin', '2021-05-04 14:20:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '用户上报修改', 2007, 3, '#', '', 'F', '0', '1', 'system:report:edit', '#', 'admin', '2021-05-04 14:20:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '用户上报删除', 2007, 4, '#', '', 'F', '0', '1', 'system:report:remove', '#', 'admin', '2021-05-04 14:20:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '用户上报导出', 2007, 5, '#', '', 'F', '0', '1', 'system:report:export', '#', 'admin', '2021-05-04 14:20:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, 'QS榜单查询', 0, 5, 'https://ranking.promisingedu.com/qs', 'menuBlank', 'C', '0', '1', '', '#', 'admin', '2021-05-04 17:34:56', 'admin', '2021-05-04 19:31:57', '');
INSERT INTO `sys_menu` VALUES (2014, 'usnews大学排名', 0, 6, 'https://schools.idp.cn/rank/world-usnews', 'menuBlank', 'C', '0', '1', '', '#', 'admin', '2021-05-04 17:36:35', 'admin', '2021-05-04 19:32:02', '');
INSERT INTO `sys_menu` VALUES (2015, '申请背景', 0, 3, '/offer/bag', 'menuItem', 'C', '0', '1', '', '#', 'admin', '2021-05-04 19:30:57', 'admin', '2021-05-04 22:47:09', '');
INSERT INTO `sys_menu` VALUES (2016, '报录取', 0, 4, '/system/report/index', 'menuItem', 'C', '0', '1', 'system:report:view', '#', 'admin', '2021-05-04 19:31:49', 'admin', '2021-05-05 02:09:37', '');
INSERT INTO `sys_menu` VALUES (2017, '用户上报查询', 2016, 1, '#', '', 'F', '0', '1', 'system:report:list', '#', 'admin', '2021-05-04 14:20:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '用户上报新增', 2016, 2, '#', '', 'F', '0', '1', 'system:report:add', '#', 'admin', '2021-05-04 14:20:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '用户上报修改', 2016, 3, '#', '', 'F', '0', '1', 'system:report:edit', '#', 'admin', '2021-05-04 14:20:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '用户上报删除', 2016, 4, '#', '', 'F', '0', '1', 'system:report:remove', '#', 'admin', '2021-05-04 14:20:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '用户上报导出', 2016, 5, '#', '', 'F', '0', '1', 'system:report:export', '#', 'admin', '2021-05-04 14:20:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '更新申请背景', 2015, 1, '#', 'menuItem', 'F', '0', '1', 'system:bag:edit', '#', 'admin', '2021-05-06 00:07:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '用户上报留言', 2000, 1, '/system/msg', '', 'C', '0', '1', 'system:msg:view', '#', 'admin', '2021-05-06 13:43:26', '', NULL, '用户上报留言菜单');
INSERT INTO `sys_menu` VALUES (2024, '用户上报留言查询', 2023, 1, '#', '', 'F', '0', '1', 'system:msg:list', '#', 'admin', '2021-05-06 13:43:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '用户上报留言新增', 2023, 2, '#', '', 'F', '0', '1', 'system:msg:add', '#', 'admin', '2021-05-06 13:43:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '用户上报留言修改', 2023, 3, '#', '', 'F', '0', '1', 'system:msg:edit', '#', 'admin', '2021-05-06 13:43:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '用户上报留言删除', 2023, 4, '#', '', 'F', '0', '1', 'system:msg:remove', '#', 'admin', '2021-05-06 13:43:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '用户上报留言导出', 2023, 5, '#', '', 'F', '0', '1', 'system:msg:export', '#', 'admin', '2021-05-06 13:43:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '用户私聊', 2000, 1, '/system/privates', '', 'C', '0', '1', 'system:private:view', '#', 'admin', '2021-05-06 13:43:37', '', NULL, '用户私聊菜单');
INSERT INTO `sys_menu` VALUES (2030, '用户私聊查询', 2029, 1, '#', '', 'F', '0', '1', 'system:private:list', '#', 'admin', '2021-05-06 13:43:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '用户私聊新增', 2029, 2, '#', '', 'F', '0', '1', 'system:private:add', '#', 'admin', '2021-05-06 13:43:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '用户私聊修改', 2029, 3, '#', '', 'F', '0', '1', 'system:private:edit', '#', 'admin', '2021-05-06 13:43:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '用户私聊删除', 2029, 4, '#', '', 'F', '0', '1', 'system:private:remove', '#', 'admin', '2021-05-06 13:43:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '用户私聊导出', 2029, 5, '#', '', 'F', '0', '1', 'system:private:export', '#', 'admin', '2021-05-06 13:43:37', '', NULL, '');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 178 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2021-05-03 22:28:00', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '管理员', 'common', 2, '2', '0', '0', 'admin', '2021-05-03 22:28:00', 'admin', '2021-05-05 02:17:58', '普通角色');
INSERT INTO `sys_role` VALUES (100, '用户', 'user', 3, '1', '0', '0', 'admin', '2021-05-04 17:32:30', 'admin', '2021-05-06 00:08:14', '');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2018);
INSERT INTO `sys_role_menu` VALUES (100, 2019);
INSERT INTO `sys_role_menu` VALUES (100, 2020);
INSERT INTO `sys_role_menu` VALUES (100, 2021);
INSERT INTO `sys_role_menu` VALUES (100, 2022);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime(0) NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '小繁', '00', 'zhwq74@qq.com', '17737453222', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2021-05-06 22:36:59', '2021-05-03 22:28:00', 'admin', '2021-05-03 22:28:00', '', '2021-05-06 22:36:59', '管理员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('7ae98454-ab28-45c2-a5aa-941d9cc4b60d', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', 'on_line', '2021-05-06 22:03:06', '2021-05-06 22:36:59', 1800000);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (100, 100);
INSERT INTO `sys_user_role` VALUES (101, 2);

-- ----------------------------
-- Table structure for user_bag
-- ----------------------------
DROP TABLE IF EXISTS `user_bag`;
CREATE TABLE `user_bag`  (
  `bag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '背景ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `req_year` int(11) NULL DEFAULT NULL COMMENT '申请入学学年',
  `req_study` int(11) NULL DEFAULT NULL COMMENT '申请学位',
  `req_major` int(11) NULL DEFAULT NULL COMMENT '申请专业',
  `req_target` int(11) NULL DEFAULT NULL COMMENT '申请目标',
  `bk_school_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '本科学校',
  `bk_major` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '本科专业',
  `bk_result` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '本科GPA原始成绩',
  `read_fraction` int(11) NULL DEFAULT NULL COMMENT '阅读',
  `hearing_fraction` int(11) NULL DEFAULT NULL COMMENT '听力',
  `mouth_fraction` int(11) NULL DEFAULT NULL COMMENT '口语',
  `write_fraction` int(11) NULL DEFAULT NULL COMMENT '写作',
  `chinese_fraction` int(11) NULL DEFAULT NULL COMMENT '语文',
  `mathematics_fraction` int(11) NULL DEFAULT NULL COMMENT '数学',
  `work_year` int(11) NULL DEFAULT NULL COMMENT '工作经验年数',
  PRIMARY KEY (`bag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户背景' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_bag
-- ----------------------------
INSERT INTO `user_bag` VALUES (1, 1, '小繁', 1, 1, 1, 1, '本科', '本科', '123', 123, 123, 123, 123, 123, 123, 123);
INSERT INTO `user_bag` VALUES (4, 100, 'zeng', 1, 1, 1, 1, '郑大', '专业', '1', 1, 1, 1, 1, 1, 1, 1);

-- ----------------------------
-- Table structure for user_private
-- ----------------------------
DROP TABLE IF EXISTS `user_private`;
CREATE TABLE `user_private`  (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `reply_user_id` int(11) NULL DEFAULT NULL COMMENT '回复用户ID',
  `reply_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回复用户名称',
  `msg_status` int(11) NULL DEFAULT NULL COMMENT '消息状态',
  `msg_info` varchar(1999) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息',
  `msg_time` datetime(0) NULL DEFAULT NULL COMMENT '消息时间',
  PRIMARY KEY (`msg_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户私聊' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_report
-- ----------------------------
DROP TABLE IF EXISTS `user_report`;
CREATE TABLE `user_report`  (
  `report_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '背景ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `report_status` int(11) NULL DEFAULT NULL COMMENT '上报状态',
  `report_time` datetime(0) NULL DEFAULT NULL COMMENT '上报时间',
  `res_year` int(11) NULL DEFAULT NULL COMMENT '录取学年',
  `res_term` int(11) NULL DEFAULT NULL COMMENT '录取学期',
  `res_school` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '录取学校',
  `res_study` int(11) NULL DEFAULT NULL COMMENT '录取学位',
  `res_major` int(11) NULL DEFAULT NULL COMMENT '录取专业',
  `res_project` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '录取项目',
  `res_result` int(11) NULL DEFAULT NULL COMMENT '录取结果',
  `res_notice` int(11) NULL DEFAULT NULL COMMENT '录取通知方式',
  `res_notice_time` datetime(0) NULL DEFAULT NULL COMMENT '录取通知时间',
  `req_time` datetime(0) NULL DEFAULT NULL COMMENT '网申提交时间',
  `title` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `info` varchar(9999) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帖子内容',
  PRIMARY KEY (`report_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户上报' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_report_msg
-- ----------------------------
DROP TABLE IF EXISTS `user_report_msg`;
CREATE TABLE `user_report_msg`  (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `report_id` int(11) NULL DEFAULT NULL COMMENT '上报ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `msg_status` int(11) NULL DEFAULT NULL COMMENT '留言状态',
  `msg_info` varchar(1999) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '留言消息',
  `msg_time` datetime(0) NULL DEFAULT NULL COMMENT '留言时间',
  PRIMARY KEY (`msg_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户上报留言' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
