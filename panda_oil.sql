/*
Navicat MySQL Data Transfer

Source Server         : my
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : panda_oil

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-11-07 17:14:34
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `zsys_activity`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_activity`;
CREATE TABLE `zsys_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(50) DEFAULT NULL COMMENT '活动名称',
  `activity_content` varchar(100) DEFAULT NULL COMMENT '活动描述',
  `img_url` varchar(100) DEFAULT NULL COMMENT '活动图片地址',
  `status` smallint(1) DEFAULT '1' COMMENT '活动状态(1：显示中，2：下架中)',
  `link` varchar(100) DEFAULT NULL COMMENT '活动跳转链接',
  `list_order` int(11) DEFAULT '0',
  `remark` varchar(1024) DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status2` tinyint(1) NOT NULL DEFAULT '1',
  `activity_type` smallint(1) NOT NULL DEFAULT '1' COMMENT '类型（1：轮播图，2其他活动）',
  `start_time` date DEFAULT NULL COMMENT '活动开始时间',
  `end_time` date DEFAULT NULL COMMENT '活动结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='平台活动管理表';

-- ----------------------------
-- Records of zsys_activity
-- ----------------------------

-- ----------------------------
-- Table structure for `zsys_admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_admin_menu`;
CREATE TABLE `zsys_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parent_id` (`parent_id`),
  KEY `controller` (`controller`)
) ENGINE=MyISAM AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单表';

-- ----------------------------
-- Records of zsys_admin_menu
-- ----------------------------
INSERT INTO zsys_admin_menu VALUES ('1', '0', '0', '0', '1000', 'admin', 'Plugin', 'default', '', '插件中心', 'cloud', '插件中心');
INSERT INTO zsys_admin_menu VALUES ('2', '1', '1', '1', '10000', 'admin', 'Hook', 'index', '', '钩子管理', '', '钩子管理');
INSERT INTO zsys_admin_menu VALUES ('3', '2', '1', '0', '10000', 'admin', 'Hook', 'plugins', '', '钩子插件管理', '', '钩子插件管理');
INSERT INTO zsys_admin_menu VALUES ('4', '2', '2', '0', '10000', 'admin', 'Hook', 'pluginListOrder', '', '钩子插件排序', '', '钩子插件排序');
INSERT INTO zsys_admin_menu VALUES ('5', '2', '1', '0', '10000', 'admin', 'Hook', 'sync', '', '同步钩子', '', '同步钩子');
INSERT INTO zsys_admin_menu VALUES ('6', '0', '0', '1', '0', 'admin', 'Setting', 'default', '', '个人设置', 'cogs', '系统设置入口');
INSERT INTO zsys_admin_menu VALUES ('20', '139', '1', '1', '10000', 'admin', 'Menu', 'index', '', '后台菜单', '', '1');
INSERT INTO zsys_admin_menu VALUES ('42', '1', '1', '1', '10000', 'admin', 'Plugin', 'index', '', '插件列表', '', '插件列表');
INSERT INTO zsys_admin_menu VALUES ('43', '42', '2', '0', '10000', 'admin', 'Plugin', 'toggle', '', '插件启用禁用', '', '插件启用禁用');
INSERT INTO zsys_admin_menu VALUES ('44', '42', '1', '0', '10000', 'admin', 'Plugin', 'setting', '', '插件设置', '', '插件设置');
INSERT INTO zsys_admin_menu VALUES ('45', '42', '2', '0', '10000', 'admin', 'Plugin', 'settingPost', '', '插件设置提交', '', '插件设置提交');
INSERT INTO zsys_admin_menu VALUES ('46', '42', '2', '0', '10000', 'admin', 'Plugin', 'install', '', '插件安装', '', '插件安装');
INSERT INTO zsys_admin_menu VALUES ('47', '42', '2', '0', '10000', 'admin', 'Plugin', 'update', '', '插件更新', '', '插件更新');
INSERT INTO zsys_admin_menu VALUES ('48', '42', '2', '0', '10000', 'admin', 'Plugin', 'uninstall', '', '卸载插件', '', '卸载插件');
INSERT INTO zsys_admin_menu VALUES ('49', '110', '0', '1', '10000', 'admin', 'User', 'default', '', '管理组', '', '管理组');
INSERT INTO zsys_admin_menu VALUES ('50', '49', '1', '1', '10000', 'admin', 'Rbac', 'index', '', '角色管理', '', '角色管理');
INSERT INTO zsys_admin_menu VALUES ('51', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleAdd', '', '添加角色', '', '添加角色');
INSERT INTO zsys_admin_menu VALUES ('52', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleAddPost', '', '添加角色提交', '', '添加角色提交');
INSERT INTO zsys_admin_menu VALUES ('53', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleEdit', '', '编辑角色', '', '编辑角色');
INSERT INTO zsys_admin_menu VALUES ('54', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleEditPost', '', '编辑角色提交', '', '编辑角色提交');
INSERT INTO zsys_admin_menu VALUES ('55', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleDelete', '', '删除角色', '', '删除角色');
INSERT INTO zsys_admin_menu VALUES ('56', '50', '1', '0', '10000', 'admin', 'Rbac', 'authorize', '', '设置角色权限', '', '设置角色权限');
INSERT INTO zsys_admin_menu VALUES ('57', '50', '2', '0', '10000', 'admin', 'Rbac', 'authorizePost', '', '角色授权提交', '', '角色授权提交');
INSERT INTO zsys_admin_menu VALUES ('58', '0', '1', '0', '10000', 'admin', 'RecycleBin', 'index', '', '回收站', '', '回收站');
INSERT INTO zsys_admin_menu VALUES ('59', '58', '2', '0', '10000', 'admin', 'RecycleBin', 'restore', '', '回收站还原', '', '回收站还原');
INSERT INTO zsys_admin_menu VALUES ('60', '58', '2', '0', '10000', 'admin', 'RecycleBin', 'delete', '', '回收站彻底删除', '', '回收站彻底删除');
INSERT INTO zsys_admin_menu VALUES ('61', '139', '1', '1', '10000', 'admin', 'Route', 'index', '', 'URL美化', '', 'URL规则管理');
INSERT INTO zsys_admin_menu VALUES ('62', '61', '1', '0', '10000', 'admin', 'Route', 'add', '', '添加路由规则', '', '添加路由规则');
INSERT INTO zsys_admin_menu VALUES ('63', '61', '2', '0', '10000', 'admin', 'Route', 'addPost', '', '添加路由规则提交', '', '添加路由规则提交');
INSERT INTO zsys_admin_menu VALUES ('64', '61', '1', '0', '10000', 'admin', 'Route', 'edit', '', '路由规则编辑', '', '路由规则编辑');
INSERT INTO zsys_admin_menu VALUES ('65', '61', '2', '0', '10000', 'admin', 'Route', 'editPost', '', '路由规则编辑提交', '', '路由规则编辑提交');
INSERT INTO zsys_admin_menu VALUES ('66', '61', '2', '0', '10000', 'admin', 'Route', 'delete', '', '路由规则删除', '', '路由规则删除');
INSERT INTO zsys_admin_menu VALUES ('67', '61', '2', '0', '10000', 'admin', 'Route', 'ban', '', '路由规则禁用', '', '路由规则禁用');
INSERT INTO zsys_admin_menu VALUES ('68', '61', '2', '0', '10000', 'admin', 'Route', 'open', '', '路由规则启用', '', '路由规则启用');
INSERT INTO zsys_admin_menu VALUES ('69', '61', '2', '0', '10000', 'admin', 'Route', 'listOrder', '', '路由规则排序', '', '路由规则排序');
INSERT INTO zsys_admin_menu VALUES ('70', '61', '1', '0', '10000', 'admin', 'Route', 'select', '', '选择URL', '', '选择URL');
INSERT INTO zsys_admin_menu VALUES ('71', '139', '1', '1', '0', 'admin', 'setting', 'site', '', '平台参数配置', '', '');
INSERT INTO zsys_admin_menu VALUES ('72', '71', '2', '0', '10000', 'admin', 'Setting', 'sitePost', '', '网站信息设置提交', '', '网站信息设置提交');
INSERT INTO zsys_admin_menu VALUES ('73', '6', '1', '1', '10000', 'admin', 'Setting', 'password', '', '密码修改', '', '');
INSERT INTO zsys_admin_menu VALUES ('74', '73', '2', '0', '10000', 'admin', 'Setting', 'passwordPost', '', '密码修改提交', '', '密码修改提交');
INSERT INTO zsys_admin_menu VALUES ('75', '139', '1', '1', '10000', 'admin', 'Setting', 'upload', '', '上传设置', '', '上传设置');
INSERT INTO zsys_admin_menu VALUES ('76', '75', '2', '0', '10000', 'admin', 'Setting', 'uploadPost', '', '上传设置提交', '', '上传设置提交');
INSERT INTO zsys_admin_menu VALUES ('77', '139', '1', '0', '10000', 'admin', 'Setting', 'clearCache', '', '清除缓存', '', '清除缓存');
INSERT INTO zsys_admin_menu VALUES ('93', '139', '1', '1', '10000', 'admin', 'Storage', 'index', '', '文件存储', '', '文件存储');
INSERT INTO zsys_admin_menu VALUES ('94', '93', '2', '0', '10000', 'admin', 'Storage', 'settingPost', '', '文件存储设置提交', '', '文件存储设置提交');
INSERT INTO zsys_admin_menu VALUES ('95', '139', '1', '0', '20', 'admin', 'Theme', 'index', '', '模板管理', '', '模板管理');
INSERT INTO zsys_admin_menu VALUES ('96', '95', '1', '0', '10000', 'admin', 'Theme', 'install', '', '安装模板', '', '安装模板');
INSERT INTO zsys_admin_menu VALUES ('97', '95', '2', '0', '10000', 'admin', 'Theme', 'uninstall', '', '卸载模板', '', '卸载模板');
INSERT INTO zsys_admin_menu VALUES ('98', '95', '2', '0', '10000', 'admin', 'Theme', 'installTheme', '', '模板安装', '', '模板安装');
INSERT INTO zsys_admin_menu VALUES ('99', '95', '2', '0', '10000', 'admin', 'Theme', 'update', '', '模板更新', '', '模板更新');
INSERT INTO zsys_admin_menu VALUES ('100', '95', '2', '0', '10000', 'admin', 'Theme', 'active', '', '启用模板', '', '启用模板');
INSERT INTO zsys_admin_menu VALUES ('101', '95', '1', '0', '10000', 'admin', 'Theme', 'files', '', '模板文件列表', '', '启用模板');
INSERT INTO zsys_admin_menu VALUES ('102', '95', '1', '0', '10000', 'admin', 'Theme', 'fileSetting', '', '模板文件设置', '', '模板文件设置');
INSERT INTO zsys_admin_menu VALUES ('103', '95', '1', '0', '10000', 'admin', 'Theme', 'fileArrayData', '', '模板文件数组数据列表', '', '模板文件数组数据列表');
INSERT INTO zsys_admin_menu VALUES ('104', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEdit', '', '模板文件数组数据添加编辑', '', '模板文件数组数据添加编辑');
INSERT INTO zsys_admin_menu VALUES ('105', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '', '模板文件数组数据添加编辑提交保存');
INSERT INTO zsys_admin_menu VALUES ('106', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataDelete', '', '模板文件数组数据删除', '', '模板文件数组数据删除');
INSERT INTO zsys_admin_menu VALUES ('107', '95', '2', '0', '10000', 'admin', 'Theme', 'settingPost', '', '模板文件编辑提交保存', '', '模板文件编辑提交保存');
INSERT INTO zsys_admin_menu VALUES ('108', '95', '1', '0', '10000', 'admin', 'Theme', 'dataSource', '', '模板文件设置数据源', '', '模板文件设置数据源');
INSERT INTO zsys_admin_menu VALUES ('109', '95', '1', '0', '10000', 'admin', 'Theme', 'design', '', '模板设计', '', '模板设计');
INSERT INTO zsys_admin_menu VALUES ('110', '0', '0', '1', '10', 'user', 'AdminIndex', 'default', '', '平台用户管理', 'group', '用户管理');
INSERT INTO zsys_admin_menu VALUES ('111', '49', '1', '1', '10000', 'admin', 'User', 'index', '', '管理员', '', '管理员管理');
INSERT INTO zsys_admin_menu VALUES ('112', '111', '1', '0', '10000', 'admin', 'User', 'add', '', '管理员添加', '', '管理员添加');
INSERT INTO zsys_admin_menu VALUES ('113', '111', '2', '0', '10000', 'admin', 'User', 'addPost', '', '管理员添加提交', '', '管理员添加提交');
INSERT INTO zsys_admin_menu VALUES ('114', '111', '1', '0', '10000', 'admin', 'User', 'edit', '', '管理员编辑', '', '管理员编辑');
INSERT INTO zsys_admin_menu VALUES ('115', '111', '2', '0', '10000', 'admin', 'User', 'editPost', '', '管理员编辑提交', '', '管理员编辑提交');
INSERT INTO zsys_admin_menu VALUES ('116', '111', '1', '0', '10000', 'admin', 'User', 'userInfo', '', '个人信息', '', '管理员个人信息修改');
INSERT INTO zsys_admin_menu VALUES ('117', '111', '2', '0', '10000', 'admin', 'User', 'userInfoPost', '', '管理员个人信息修改提交', '', '管理员个人信息修改提交');
INSERT INTO zsys_admin_menu VALUES ('118', '111', '2', '0', '10000', 'admin', 'User', 'delete', '', '管理员删除', '', '管理员删除');
INSERT INTO zsys_admin_menu VALUES ('119', '111', '2', '0', '10000', 'admin', 'User', 'ban', '', '停用管理员', '', '停用管理员');
INSERT INTO zsys_admin_menu VALUES ('120', '111', '2', '0', '10000', 'admin', 'User', 'cancelBan', '', '启用管理员', '', '启用管理员');
INSERT INTO zsys_admin_menu VALUES ('121', '0', '1', '0', '100001', 'user', 'AdminAsset', 'index', '', '资源管理', 'file', '资源管理列表');
INSERT INTO zsys_admin_menu VALUES ('122', '121', '2', '0', '10000', 'user', 'AdminAsset', 'delete', '', '删除文件', '', '删除文件');
INSERT INTO zsys_admin_menu VALUES ('123', '110', '1', '1', '10000', 'admin', 'tenant', 'default', '', '租户组', '', '用户组');
INSERT INTO zsys_admin_menu VALUES ('136', '0', '0', '0', '1000', 'plugin/Demo', 'AdminIndex', 'default', '', '演示插件', 'dashboard', '演示插件入口');
INSERT INTO zsys_admin_menu VALUES ('137', '136', '1', '1', '10000', 'plugin/Demo', 'AdminIndex', 'index', '', '演示插件用户列表', '', '演示插件用户列表');
INSERT INTO zsys_admin_menu VALUES ('139', '0', '1', '1', '99', 'admin', 'system', 'default', '', '平台全局管理', '', '');
INSERT INTO zsys_admin_menu VALUES ('140', '123', '1', '1', '10000', 'admin', 'tenant', 'index', '', '租户管理', '', '');
INSERT INTO zsys_admin_menu VALUES ('141', '0', '0', '1', '89', 'oil', 'Oilstation', 'default', '', '加油站管理', '', '加油站管理');
INSERT INTO zsys_admin_menu VALUES ('142', '141', '0', '1', '10000', 'oil', 'OilStation', 'index', '', '油站列表', '', '油站列表');
INSERT INTO zsys_admin_menu VALUES ('143', '110', '1', '1', '999', 'oil', 'customer', 'default', '', '微信端用户', '', '');
INSERT INTO zsys_admin_menu VALUES ('144', '143', '1', '1', '10000', 'oil', 'customer', 'index', '', '用户列表', '', '');
INSERT INTO zsys_admin_menu VALUES ('145', '0', '1', '1', '91', 'oil', 'InsuranceCompany', 'default', '', '保险公司管理', '', '');
INSERT INTO zsys_admin_menu VALUES ('146', '145', '1', '1', '10000', 'oil', 'InsuranceCompany', 'index', '', '保险公司列表', '', '');
INSERT INTO zsys_admin_menu VALUES ('147', '49', '1', '1', '10000', 'oil', 'customer', 'customer_grade', '', '会员等级管理', '', '');
INSERT INTO zsys_admin_menu VALUES ('148', '0', '1', '1', '98', 'oil', 'Activity', 'default', '', '活动管理', '', '');
INSERT INTO zsys_admin_menu VALUES ('149', '148', '1', '1', '10000', 'oil', 'Activity', 'bannerindex', '', '轮播图管理', '', '');
INSERT INTO zsys_admin_menu VALUES ('150', '0', '1', '1', '11', 'oil', 'InsuranceCustomer', 'default', '', '保险会员管理', 'user', '');
INSERT INTO zsys_admin_menu VALUES ('151', '150', '1', '1', '10000', 'oil', 'InsuranceCustomer', 'index', '', '保险会员列表', 'user', '');
INSERT INTO zsys_admin_menu VALUES ('152', '151', '1', '0', '10000', 'oil', 'InsuranceCustomer', 'exceladd', '', '导入会员数据', '', '');
INSERT INTO zsys_admin_menu VALUES ('153', '0', '1', '1', '12', 'oil', 'PayOrder', 'default', '', '订单管理', '', '');
INSERT INTO zsys_admin_menu VALUES ('154', '153', '1', '1', '10000', 'oil', 'PayOrder', 'index', '', '支付订单列表', '', '');
INSERT INTO zsys_admin_menu VALUES ('155', '141', '1', '1', '10000', 'oil', 'OilStation', 'brand', '', '油站品牌', '', '');
INSERT INTO zsys_admin_menu VALUES ('156', '0', '1', '1', '92', 'oil', 'Signup', 'default', '', '报名管理', '', '');
INSERT INTO zsys_admin_menu VALUES ('157', '156', '1', '1', '10000', 'oil', 'Signup', 'index', '', '报名列表', '', '');

-- ----------------------------
-- Table structure for `zsys_asset`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_asset`;
CREATE TABLE `zsys_asset` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of zsys_asset
-- ----------------------------
INSERT INTO zsys_asset VALUES ('4', '1', '11340', '1572598051', '1', '0', 'f75ae6cec70857b8ea45217a4d84034b2217de45b28d090c779427a57ba00bd2', 'shiyou.png', 'default/20191101/7f5a26fa392d9f8e5447def90ec12869.png', 'f75ae6cec70857b8ea45217a4d84034b', '6c8fb335442740f3b42a4d97e63916730886b196', 'png', null);
INSERT INTO zsys_asset VALUES ('5', '1', '14840', '1572598664', '1', '0', '83592e60f9ed5b2e52ab227a58f06cbbe7880270c73f7f7654b4a859d94ba66a', 'shihua.png', 'default/20191101/4e224b4ffdd381206b5552d5200aa3d3.png', '83592e60f9ed5b2e52ab227a58f06cbb', '52185858c92a0aded0b7f8e44bc0f948608c3c38', 'png', null);
INSERT INTO zsys_asset VALUES ('6', '1', '15912', '1572598773', '1', '0', '5c023f858f6c0ff3d2e3fe2b446c17c12d9f00cd6d54e0438e4ae07fd71b831c', 'qiao.png', 'default/20191101/3b93f8d2377b2d384b128b98d3c02049.png', '5c023f858f6c0ff3d2e3fe2b446c17c1', 'f3e8f1b76e1b701949aa2ad4020179780c788a92', 'png', null);

-- ----------------------------
-- Table structure for `zsys_auth_access`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_auth_access`;
CREATE TABLE `zsys_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1166614195513462813 DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of zsys_auth_access
-- ----------------------------
INSERT INTO zsys_auth_access VALUES ('1166614194485858304', '3', 'admin/rbac/roleadd', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614194422943745', '3', 'admin/rbac/index', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614194376806400', '3', 'admin/user/default', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614194322280449', '3', 'user/adminindex/default', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614194267754496', '3', 'admin/setting/default', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462805', '2', 'admin/user/userinfopost', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462804', '2', 'admin/user/userinfo', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462803', '2', 'admin/user/editpost', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462802', '2', 'admin/user/edit', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462801', '2', 'admin/user/addpost', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462800', '2', 'admin/user/add', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462799', '2', 'admin/user/index', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462798', '2', 'admin/rbac/authorizepost', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462797', '2', 'admin/rbac/authorize', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462796', '2', 'admin/rbac/roledelete', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462795', '2', 'admin/rbac/roleeditpost', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462794', '2', 'admin/rbac/roleedit', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462793', '2', 'admin/rbac/roleaddpost', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462792', '2', 'admin/rbac/roleadd', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462791', '2', 'admin/rbac/index', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462790', '2', 'admin/user/default', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462789', '2', 'user/adminindex/default', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462788', '2', 'admin/setting/passwordpost', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462787', '2', 'admin/setting/password', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462786', '2', 'admin/setting/default', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614194536189952', '3', 'admin/rbac/roleaddpost', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614194603298816', '3', 'admin/rbac/roleedit', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614194641047553', '3', 'admin/rbac/roleeditpost', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614194699767809', '3', 'admin/rbac/roledelete', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614194750099457', '3', 'admin/rbac/authorize', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614194796236800', '3', 'admin/rbac/authorizepost', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614194829791232', '3', 'admin/user/index', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614194875928577', '3', 'admin/user/add', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614194930454528', '3', 'admin/user/addpost', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614194972397568', '3', 'admin/user/edit', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195014340608', '3', 'admin/user/editpost', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195060477953', '3', 'admin/user/userinfo', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195094032385', '3', 'admin/user/userinfopost', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195152752641', '3', 'admin/user/delete', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195186307073', '3', 'admin/user/ban', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195215667200', '3', 'admin/user/cancelban', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195257610240', '3', 'admin/tenant/default', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195299553280', '3', 'admin/tenant/index', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195358273536', '3', 'admin/setting/site', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195437965313', '3', 'admin/setting/sitepost', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195475714048', '3', 'plugin/demo/adminindex/default', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462785', '3', 'plugin/demo/adminindex/index', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462806', '2', 'admin/user/delete', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462807', '2', 'admin/user/ban', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462808', '2', 'admin/user/cancelban', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462809', '2', 'admin/tenant/default', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462810', '2', 'admin/tenant/index', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462811', '2', 'oil/oilstation/default', 'admin_url');
INSERT INTO zsys_auth_access VALUES ('1166614195513462812', '2', 'oil/oilstation/index', 'admin_url');

-- ----------------------------
-- Table structure for `zsys_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_auth_rule`;
CREATE TABLE `zsys_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(40) NOT NULL DEFAULT '' COMMENT '规则所属app',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COMMENT='权限规则表';

-- ----------------------------
-- Records of zsys_auth_rule
-- ----------------------------
INSERT INTO zsys_auth_rule VALUES ('1', '1', 'admin', 'admin_url', 'admin/Hook/index', '', '钩子管理', '');
INSERT INTO zsys_auth_rule VALUES ('2', '1', 'admin', 'admin_url', 'admin/Hook/plugins', '', '钩子插件管理', '');
INSERT INTO zsys_auth_rule VALUES ('3', '1', 'admin', 'admin_url', 'admin/Hook/pluginListOrder', '', '钩子插件排序', '');
INSERT INTO zsys_auth_rule VALUES ('4', '1', 'admin', 'admin_url', 'admin/Hook/sync', '', '同步钩子', '');
INSERT INTO zsys_auth_rule VALUES ('5', '1', 'admin', 'admin_url', 'admin/Link/index', '', '友情链接', '');
INSERT INTO zsys_auth_rule VALUES ('6', '1', 'admin', 'admin_url', 'admin/Link/add', '', '添加友情链接', '');
INSERT INTO zsys_auth_rule VALUES ('7', '1', 'admin', 'admin_url', 'admin/Link/addPost', '', '添加友情链接提交保存', '');
INSERT INTO zsys_auth_rule VALUES ('8', '1', 'admin', 'admin_url', 'admin/Link/edit', '', '编辑友情链接', '');
INSERT INTO zsys_auth_rule VALUES ('9', '1', 'admin', 'admin_url', 'admin/Link/editPost', '', '编辑友情链接提交保存', '');
INSERT INTO zsys_auth_rule VALUES ('10', '1', 'admin', 'admin_url', 'admin/Link/delete', '', '删除友情链接', '');
INSERT INTO zsys_auth_rule VALUES ('11', '1', 'admin', 'admin_url', 'admin/Link/listOrder', '', '友情链接排序', '');
INSERT INTO zsys_auth_rule VALUES ('12', '1', 'admin', 'admin_url', 'admin/Link/toggle', '', '友情链接显示隐藏', '');
INSERT INTO zsys_auth_rule VALUES ('13', '1', 'admin', 'admin_url', 'admin/Mailer/index', '', '邮箱配置', '');
INSERT INTO zsys_auth_rule VALUES ('14', '1', 'admin', 'admin_url', 'admin/Mailer/indexPost', '', '邮箱配置提交保存', '');
INSERT INTO zsys_auth_rule VALUES ('15', '1', 'admin', 'admin_url', 'admin/Mailer/template', '', '邮件模板', '');
INSERT INTO zsys_auth_rule VALUES ('16', '1', 'admin', 'admin_url', 'admin/Mailer/templatePost', '', '邮件模板提交', '');
INSERT INTO zsys_auth_rule VALUES ('17', '1', 'admin', 'admin_url', 'admin/Mailer/test', '', '邮件发送测试', '');
INSERT INTO zsys_auth_rule VALUES ('18', '1', 'admin', 'admin_url', 'admin/Menu/index', '', '后台菜单', '');
INSERT INTO zsys_auth_rule VALUES ('19', '1', 'admin', 'admin_url', 'admin/Menu/lists', '', '所有菜单', '');
INSERT INTO zsys_auth_rule VALUES ('20', '1', 'admin', 'admin_url', 'admin/Menu/add', '', '后台菜单添加', '');
INSERT INTO zsys_auth_rule VALUES ('21', '1', 'admin', 'admin_url', 'admin/Menu/addPost', '', '后台菜单添加提交保存', '');
INSERT INTO zsys_auth_rule VALUES ('22', '1', 'admin', 'admin_url', 'admin/Menu/edit', '', '后台菜单编辑', '');
INSERT INTO zsys_auth_rule VALUES ('23', '1', 'admin', 'admin_url', 'admin/Menu/editPost', '', '后台菜单编辑提交保存', '');
INSERT INTO zsys_auth_rule VALUES ('24', '1', 'admin', 'admin_url', 'admin/Menu/delete', '', '后台菜单删除', '');
INSERT INTO zsys_auth_rule VALUES ('25', '1', 'admin', 'admin_url', 'admin/Menu/listOrder', '', '后台菜单排序', '');
INSERT INTO zsys_auth_rule VALUES ('26', '1', 'admin', 'admin_url', 'admin/Menu/getActions', '', '导入新后台菜单', '');
INSERT INTO zsys_auth_rule VALUES ('27', '1', 'admin', 'admin_url', 'admin/Nav/index', '', '导航管理', '');
INSERT INTO zsys_auth_rule VALUES ('28', '1', 'admin', 'admin_url', 'admin/Nav/add', '', '添加导航', '');
INSERT INTO zsys_auth_rule VALUES ('29', '1', 'admin', 'admin_url', 'admin/Nav/addPost', '', '添加导航提交保存', '');
INSERT INTO zsys_auth_rule VALUES ('30', '1', 'admin', 'admin_url', 'admin/Nav/edit', '', '编辑导航', '');
INSERT INTO zsys_auth_rule VALUES ('31', '1', 'admin', 'admin_url', 'admin/Nav/editPost', '', '编辑导航提交保存', '');
INSERT INTO zsys_auth_rule VALUES ('32', '1', 'admin', 'admin_url', 'admin/Nav/delete', '', '删除导航', '');
INSERT INTO zsys_auth_rule VALUES ('33', '1', 'admin', 'admin_url', 'admin/NavMenu/index', '', '导航菜单', '');
INSERT INTO zsys_auth_rule VALUES ('34', '1', 'admin', 'admin_url', 'admin/NavMenu/add', '', '添加导航菜单', '');
INSERT INTO zsys_auth_rule VALUES ('35', '1', 'admin', 'admin_url', 'admin/NavMenu/addPost', '', '添加导航菜单提交保存', '');
INSERT INTO zsys_auth_rule VALUES ('36', '1', 'admin', 'admin_url', 'admin/NavMenu/edit', '', '编辑导航菜单', '');
INSERT INTO zsys_auth_rule VALUES ('37', '1', 'admin', 'admin_url', 'admin/NavMenu/editPost', '', '编辑导航菜单提交保存', '');
INSERT INTO zsys_auth_rule VALUES ('38', '1', 'admin', 'admin_url', 'admin/NavMenu/delete', '', '删除导航菜单', '');
INSERT INTO zsys_auth_rule VALUES ('39', '1', 'admin', 'admin_url', 'admin/NavMenu/listOrder', '', '导航菜单排序', '');
INSERT INTO zsys_auth_rule VALUES ('40', '1', 'admin', 'admin_url', 'admin/Plugin/default', '', '插件中心', '');
INSERT INTO zsys_auth_rule VALUES ('41', '1', 'admin', 'admin_url', 'admin/Plugin/index', '', '插件列表', '');
INSERT INTO zsys_auth_rule VALUES ('42', '1', 'admin', 'admin_url', 'admin/Plugin/toggle', '', '插件启用禁用', '');
INSERT INTO zsys_auth_rule VALUES ('43', '1', 'admin', 'admin_url', 'admin/Plugin/setting', '', '插件设置', '');
INSERT INTO zsys_auth_rule VALUES ('44', '1', 'admin', 'admin_url', 'admin/Plugin/settingPost', '', '插件设置提交', '');
INSERT INTO zsys_auth_rule VALUES ('45', '1', 'admin', 'admin_url', 'admin/Plugin/install', '', '插件安装', '');
INSERT INTO zsys_auth_rule VALUES ('46', '1', 'admin', 'admin_url', 'admin/Plugin/update', '', '插件更新', '');
INSERT INTO zsys_auth_rule VALUES ('47', '1', 'admin', 'admin_url', 'admin/Plugin/uninstall', '', '卸载插件', '');
INSERT INTO zsys_auth_rule VALUES ('48', '1', 'admin', 'admin_url', 'admin/Rbac/index', '', '角色管理', '');
INSERT INTO zsys_auth_rule VALUES ('49', '1', 'admin', 'admin_url', 'admin/Rbac/roleAdd', '', '添加角色', '');
INSERT INTO zsys_auth_rule VALUES ('50', '1', 'admin', 'admin_url', 'admin/Rbac/roleAddPost', '', '添加角色提交', '');
INSERT INTO zsys_auth_rule VALUES ('51', '1', 'admin', 'admin_url', 'admin/Rbac/roleEdit', '', '编辑角色', '');
INSERT INTO zsys_auth_rule VALUES ('52', '1', 'admin', 'admin_url', 'admin/Rbac/roleEditPost', '', '编辑角色提交', '');
INSERT INTO zsys_auth_rule VALUES ('53', '1', 'admin', 'admin_url', 'admin/Rbac/roleDelete', '', '删除角色', '');
INSERT INTO zsys_auth_rule VALUES ('54', '1', 'admin', 'admin_url', 'admin/Rbac/authorize', '', '设置角色权限', '');
INSERT INTO zsys_auth_rule VALUES ('55', '1', 'admin', 'admin_url', 'admin/Rbac/authorizePost', '', '角色授权提交', '');
INSERT INTO zsys_auth_rule VALUES ('56', '1', 'admin', 'admin_url', 'admin/RecycleBin/index', '', '回收站', '');
INSERT INTO zsys_auth_rule VALUES ('57', '1', 'admin', 'admin_url', 'admin/RecycleBin/restore', '', '回收站还原', '');
INSERT INTO zsys_auth_rule VALUES ('58', '1', 'admin', 'admin_url', 'admin/RecycleBin/delete', '', '回收站彻底删除', '');
INSERT INTO zsys_auth_rule VALUES ('59', '1', 'admin', 'admin_url', 'admin/Route/index', '', 'URL美化', '');
INSERT INTO zsys_auth_rule VALUES ('60', '1', 'admin', 'admin_url', 'admin/Route/add', '', '添加路由规则', '');
INSERT INTO zsys_auth_rule VALUES ('61', '1', 'admin', 'admin_url', 'admin/Route/addPost', '', '添加路由规则提交', '');
INSERT INTO zsys_auth_rule VALUES ('62', '1', 'admin', 'admin_url', 'admin/Route/edit', '', '路由规则编辑', '');
INSERT INTO zsys_auth_rule VALUES ('63', '1', 'admin', 'admin_url', 'admin/Route/editPost', '', '路由规则编辑提交', '');
INSERT INTO zsys_auth_rule VALUES ('64', '1', 'admin', 'admin_url', 'admin/Route/delete', '', '路由规则删除', '');
INSERT INTO zsys_auth_rule VALUES ('65', '1', 'admin', 'admin_url', 'admin/Route/ban', '', '路由规则禁用', '');
INSERT INTO zsys_auth_rule VALUES ('66', '1', 'admin', 'admin_url', 'admin/Route/open', '', '路由规则启用', '');
INSERT INTO zsys_auth_rule VALUES ('67', '1', 'admin', 'admin_url', 'admin/Route/listOrder', '', '路由规则排序', '');
INSERT INTO zsys_auth_rule VALUES ('68', '1', 'admin', 'admin_url', 'admin/Route/select', '', '选择URL', '');
INSERT INTO zsys_auth_rule VALUES ('69', '1', 'admin', 'admin_url', 'admin/Setting/default', '', '个人设置', '');
INSERT INTO zsys_auth_rule VALUES ('70', '1', 'admin', 'admin_url', 'admin/Setting/site', '', '平台参数配置', '');
INSERT INTO zsys_auth_rule VALUES ('71', '1', 'admin', 'admin_url', 'admin/Setting/sitePost', '', '网站信息设置提交', '');
INSERT INTO zsys_auth_rule VALUES ('72', '1', 'admin', 'admin_url', 'admin/Setting/password', '', '密码修改', '');
INSERT INTO zsys_auth_rule VALUES ('73', '1', 'admin', 'admin_url', 'admin/Setting/passwordPost', '', '密码修改提交', '');
INSERT INTO zsys_auth_rule VALUES ('74', '1', 'admin', 'admin_url', 'admin/Setting/upload', '', '上传设置', '');
INSERT INTO zsys_auth_rule VALUES ('75', '1', 'admin', 'admin_url', 'admin/Setting/uploadPost', '', '上传设置提交', '');
INSERT INTO zsys_auth_rule VALUES ('76', '1', 'admin', 'admin_url', 'admin/Setting/clearCache', '', '清除缓存', '');
INSERT INTO zsys_auth_rule VALUES ('77', '1', 'admin', 'admin_url', 'admin/Slide/index', '', '幻灯片管理', '');
INSERT INTO zsys_auth_rule VALUES ('78', '1', 'admin', 'admin_url', 'admin/Slide/add', '', '添加幻灯片', '');
INSERT INTO zsys_auth_rule VALUES ('79', '1', 'admin', 'admin_url', 'admin/Slide/addPost', '', '添加幻灯片提交', '');
INSERT INTO zsys_auth_rule VALUES ('80', '1', 'admin', 'admin_url', 'admin/Slide/edit', '', '编辑幻灯片', '');
INSERT INTO zsys_auth_rule VALUES ('81', '1', 'admin', 'admin_url', 'admin/Slide/editPost', '', '编辑幻灯片提交', '');
INSERT INTO zsys_auth_rule VALUES ('82', '1', 'admin', 'admin_url', 'admin/Slide/delete', '', '删除幻灯片', '');
INSERT INTO zsys_auth_rule VALUES ('83', '1', 'admin', 'admin_url', 'admin/SlideItem/index', '', '幻灯片页面列表', '');
INSERT INTO zsys_auth_rule VALUES ('84', '1', 'admin', 'admin_url', 'admin/SlideItem/add', '', '幻灯片页面添加', '');
INSERT INTO zsys_auth_rule VALUES ('85', '1', 'admin', 'admin_url', 'admin/SlideItem/addPost', '', '幻灯片页面添加提交', '');
INSERT INTO zsys_auth_rule VALUES ('86', '1', 'admin', 'admin_url', 'admin/SlideItem/edit', '', '幻灯片页面编辑', '');
INSERT INTO zsys_auth_rule VALUES ('87', '1', 'admin', 'admin_url', 'admin/SlideItem/editPost', '', '幻灯片页面编辑提交', '');
INSERT INTO zsys_auth_rule VALUES ('88', '1', 'admin', 'admin_url', 'admin/SlideItem/delete', '', '幻灯片页面删除', '');
INSERT INTO zsys_auth_rule VALUES ('89', '1', 'admin', 'admin_url', 'admin/SlideItem/ban', '', '幻灯片页面隐藏', '');
INSERT INTO zsys_auth_rule VALUES ('90', '1', 'admin', 'admin_url', 'admin/SlideItem/cancelBan', '', '幻灯片页面显示', '');
INSERT INTO zsys_auth_rule VALUES ('91', '1', 'admin', 'admin_url', 'admin/SlideItem/listOrder', '', '幻灯片页面排序', '');
INSERT INTO zsys_auth_rule VALUES ('92', '1', 'admin', 'admin_url', 'admin/Storage/index', '', '文件存储', '');
INSERT INTO zsys_auth_rule VALUES ('93', '1', 'admin', 'admin_url', 'admin/Storage/settingPost', '', '文件存储设置提交', '');
INSERT INTO zsys_auth_rule VALUES ('94', '1', 'admin', 'admin_url', 'admin/Theme/index', '', '模板管理', '');
INSERT INTO zsys_auth_rule VALUES ('95', '1', 'admin', 'admin_url', 'admin/Theme/install', '', '安装模板', '');
INSERT INTO zsys_auth_rule VALUES ('96', '1', 'admin', 'admin_url', 'admin/Theme/uninstall', '', '卸载模板', '');
INSERT INTO zsys_auth_rule VALUES ('97', '1', 'admin', 'admin_url', 'admin/Theme/installTheme', '', '模板安装', '');
INSERT INTO zsys_auth_rule VALUES ('98', '1', 'admin', 'admin_url', 'admin/Theme/update', '', '模板更新', '');
INSERT INTO zsys_auth_rule VALUES ('99', '1', 'admin', 'admin_url', 'admin/Theme/active', '', '启用模板', '');
INSERT INTO zsys_auth_rule VALUES ('100', '1', 'admin', 'admin_url', 'admin/Theme/files', '', '模板文件列表', '');
INSERT INTO zsys_auth_rule VALUES ('101', '1', 'admin', 'admin_url', 'admin/Theme/fileSetting', '', '模板文件设置', '');
INSERT INTO zsys_auth_rule VALUES ('102', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayData', '', '模板文件数组数据列表', '');
INSERT INTO zsys_auth_rule VALUES ('103', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEdit', '', '模板文件数组数据添加编辑', '');
INSERT INTO zsys_auth_rule VALUES ('104', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '');
INSERT INTO zsys_auth_rule VALUES ('105', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataDelete', '', '模板文件数组数据删除', '');
INSERT INTO zsys_auth_rule VALUES ('106', '1', 'admin', 'admin_url', 'admin/Theme/settingPost', '', '模板文件编辑提交保存', '');
INSERT INTO zsys_auth_rule VALUES ('107', '1', 'admin', 'admin_url', 'admin/Theme/dataSource', '', '模板文件设置数据源', '');
INSERT INTO zsys_auth_rule VALUES ('108', '1', 'admin', 'admin_url', 'admin/Theme/design', '', '模板设计', '');
INSERT INTO zsys_auth_rule VALUES ('109', '1', 'admin', 'admin_url', 'admin/User/default', '', '管理组', '');
INSERT INTO zsys_auth_rule VALUES ('110', '1', 'admin', 'admin_url', 'admin/User/index', '', '管理员', '');
INSERT INTO zsys_auth_rule VALUES ('111', '1', 'admin', 'admin_url', 'admin/User/add', '', '管理员添加', '');
INSERT INTO zsys_auth_rule VALUES ('112', '1', 'admin', 'admin_url', 'admin/User/addPost', '', '管理员添加提交', '');
INSERT INTO zsys_auth_rule VALUES ('113', '1', 'admin', 'admin_url', 'admin/User/edit', '', '管理员编辑', '');
INSERT INTO zsys_auth_rule VALUES ('114', '1', 'admin', 'admin_url', 'admin/User/editPost', '', '管理员编辑提交', '');
INSERT INTO zsys_auth_rule VALUES ('115', '1', 'admin', 'admin_url', 'admin/User/userInfo', '', '个人信息', '');
INSERT INTO zsys_auth_rule VALUES ('116', '1', 'admin', 'admin_url', 'admin/User/userInfoPost', '', '管理员个人信息修改提交', '');
INSERT INTO zsys_auth_rule VALUES ('117', '1', 'admin', 'admin_url', 'admin/User/delete', '', '管理员删除', '');
INSERT INTO zsys_auth_rule VALUES ('118', '1', 'admin', 'admin_url', 'admin/User/ban', '', '停用管理员', '');
INSERT INTO zsys_auth_rule VALUES ('119', '1', 'admin', 'admin_url', 'admin/User/cancelBan', '', '启用管理员', '');
INSERT INTO zsys_auth_rule VALUES ('120', '1', 'user', 'admin_url', 'user/AdminAsset/index', '', '资源管理', '');
INSERT INTO zsys_auth_rule VALUES ('121', '1', 'user', 'admin_url', 'user/AdminAsset/delete', '', '删除文件', '');
INSERT INTO zsys_auth_rule VALUES ('122', '1', 'user', 'admin_url', 'user/AdminIndex/default', '', '平台用户管理', '');
INSERT INTO zsys_auth_rule VALUES ('123', '1', 'admin', 'admin_url', 'admin/tenant/default', '', '租户组', '');
INSERT INTO zsys_auth_rule VALUES ('124', '1', 'user', 'admin_url', 'user/AdminIndex/index', '', '本站用户', '');
INSERT INTO zsys_auth_rule VALUES ('125', '1', 'user', 'admin_url', 'user/AdminIndex/ban', '', '本站用户拉黑', '');
INSERT INTO zsys_auth_rule VALUES ('126', '1', 'user', 'admin_url', 'user/AdminIndex/cancelBan', '', '本站用户启用', '');
INSERT INTO zsys_auth_rule VALUES ('127', '1', 'user', 'admin_url', 'user/AdminOauth/index', '', '第三方用户', '');
INSERT INTO zsys_auth_rule VALUES ('128', '1', 'user', 'admin_url', 'user/AdminOauth/delete', '', '删除第三方用户绑定', '');
INSERT INTO zsys_auth_rule VALUES ('129', '1', 'user', 'admin_url', 'user/AdminUserAction/index', '', '用户操作管理', '');
INSERT INTO zsys_auth_rule VALUES ('130', '1', 'user', 'admin_url', 'user/AdminUserAction/edit', '', '编辑用户操作', '');
INSERT INTO zsys_auth_rule VALUES ('131', '1', 'user', 'admin_url', 'user/AdminUserAction/editPost', '', '编辑用户操作提交', '');
INSERT INTO zsys_auth_rule VALUES ('132', '1', 'user', 'admin_url', 'user/AdminUserAction/sync', '', '同步用户操作', '');
INSERT INTO zsys_auth_rule VALUES ('136', '1', 'plugin/Demo', 'admin_url', 'plugin/Demo/AdminIndex/default', '', '演示插件', '');
INSERT INTO zsys_auth_rule VALUES ('137', '1', 'plugin/Demo', 'plugin_url', 'plugin/Demo/AdminIndex/index', '', '演示插件用户列表', '');
INSERT INTO zsys_auth_rule VALUES ('138', '1', 'plugin/Demo', 'plugin_url', 'plugin/Demo/AdminIndex/setting', '', '演示插件设置', '');
INSERT INTO zsys_auth_rule VALUES ('139', '1', 'admin', 'admin_url', 'admin/system/default', '', '平台全局管理', '');
INSERT INTO zsys_auth_rule VALUES ('140', '1', 'admin', 'admin_url', 'admin/tenant/index', '', '租户管理', '');
INSERT INTO zsys_auth_rule VALUES ('141', '1', 'oil', 'admin_url', 'oil/Oilstation/default', '', '加油站管理', '');
INSERT INTO zsys_auth_rule VALUES ('142', '1', 'oil', 'admin_url', 'oil/OilStation/index', '', '油站列表', '');
INSERT INTO zsys_auth_rule VALUES ('143', '1', 'oil', 'admin_url', 'oil/customer/default', '', '微信端用户', '');
INSERT INTO zsys_auth_rule VALUES ('144', '1', 'oil', 'admin_url', 'oil/customer/index', '', '用户列表', '');
INSERT INTO zsys_auth_rule VALUES ('145', '1', 'oil', 'admin_url', 'oil/InsuranceCompany/default', '', '保险公司管理', '');
INSERT INTO zsys_auth_rule VALUES ('146', '1', 'oil', 'admin_url', 'oil/InsuranceCompany/index', '', '保险公司列表', '');
INSERT INTO zsys_auth_rule VALUES ('147', '1', 'oil', 'admin_url', 'oil/customer/customer_grade', '', '会员等级管理', '');
INSERT INTO zsys_auth_rule VALUES ('148', '1', 'oil', 'admin_url', 'oil/Activity/default', '', '活动管理', '');
INSERT INTO zsys_auth_rule VALUES ('149', '1', 'oil', 'admin_url', 'oil/Activity/bannerindex', '', '轮播图管理', '');
INSERT INTO zsys_auth_rule VALUES ('150', '1', 'oil', 'admin_url', 'oil/InsuranceCustomer/default', '', '保险会员管理', '');
INSERT INTO zsys_auth_rule VALUES ('151', '1', 'oil', 'admin_url', 'oil/InsuranceCustomer/index', '', '保险会员列表', '');
INSERT INTO zsys_auth_rule VALUES ('152', '1', 'oil', 'admin_url', 'oil/InsuranceCustomer/exceladd', '', '导入会员数据', '');
INSERT INTO zsys_auth_rule VALUES ('153', '1', 'oil', 'admin_url', 'oil/PayOrder/default', '', '订单管理', '');
INSERT INTO zsys_auth_rule VALUES ('154', '1', 'oil', 'admin_url', 'oil/PayOrder/index', '', '支付订单列表', '');
INSERT INTO zsys_auth_rule VALUES ('155', '1', 'oil', 'admin_url', 'oil/Oilstation/brand', '', '油站品牌', '');
INSERT INTO zsys_auth_rule VALUES ('156', '1', 'oil', 'admin_url', 'oil/Signup/default', '', '报名管理', '');
INSERT INTO zsys_auth_rule VALUES ('157', '1', 'oil', 'admin_url', 'oil/Signup/index', '', '报名列表', '');

-- ----------------------------
-- Table structure for `zsys_customer`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_customer`;
CREATE TABLE `zsys_customer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_phone` varchar(64) DEFAULT NULL,
  `customer_name` varchar(64) DEFAULT NULL,
  `wchat_openid` varchar(64) DEFAULT NULL,
  `wchat_unionid` varchar(64) DEFAULT NULL,
  `wchat_nick_name` varchar(512) DEFAULT NULL,
  `wchat_language` varchar(64) DEFAULT NULL,
  `wchat_city` varchar(64) DEFAULT NULL,
  `wchat_province` varchar(64) DEFAULT NULL,
  `wchat_country` varchar(64) DEFAULT NULL,
  `wchat_avatar` varchar(255) DEFAULT NULL,
  `wchat_sex` smallint(1) DEFAULT '0',
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remark` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_4` (`wchat_openid`),
  UNIQUE KEY `Index_5` (`wchat_unionid`),
  UNIQUE KEY `Index_3` (`customer_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of zsys_customer
-- ----------------------------
INSERT INTO zsys_customer VALUES ('1', '18396643306', '测试', 'ozGr25VOwWdTpjJYmV2K7bf35ISQ', '123456', '一路有你', '中国', '烟台', '山东', '莱山', 'https://wx.qlogo.cn/mmopen/vi_32/zcFiaYibsHnfCgTn21FiawKwXuwb2e0YUuhaT8u5cEjWXZWSql0XZWhgnibtD5OdZvJgUGJ34BgyqJFu2jibvtnBrBQ/132', '0', '2019-11-01 15:39:35', '2019-10-08 09:57:06', '1', null);
INSERT INTO zsys_customer VALUES ('2', '18615359068', null, 'ozGr25RP-omrd3tOlwi8jig7WfJ4', null, '那山那水那人那狗', null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKgzYfDohAUFXcBUnTH5ibicddo74cRU9qt2qc4gSbDbjIZRGIlx34BwXINHum3US6qJXg4hnAG6ic8Q/132', '0', '2019-11-02 09:36:34', '2019-11-02 09:35:24', '1', null);
INSERT INTO zsys_customer VALUES ('3', '13153543868', null, 'ozGr25UeH8Ne6Xxxq1zts0-uRsrg', null, '左灵右色', null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqwAvkn81Xda4GeILaNqq6RcicEfNKZwFWic3FQia3LKhK48NyB20SGLSv2licXVwElJWsPaEF45sgIAA/132', '0', '2019-11-02 09:36:09', '2019-11-02 09:35:49', '1', null);
INSERT INTO zsys_customer VALUES ('4', '15154591013', null, 'ozGr25ebAkqzgRO9n9RusmHctdic', null, '梁仁辉', null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epwdia1CoicHbfCOP2RQWYCXbDdEEZFyA9VxUibza3Spjrde2bYrROHIT5ZNOmQeESK28OYOtiaic23gmw/132', '0', '2019-11-05 09:45:30', '2019-11-02 09:43:39', '1', null);
INSERT INTO zsys_customer VALUES ('5', null, null, 'ozGr25bjIIP5S8PvXIhezRSeSDRY', null, null, null, null, null, null, null, '0', null, '2019-11-03 08:54:03', '1', null);
INSERT INTO zsys_customer VALUES ('6', null, null, 'ozGr25Zs-TY3ZHr16kUZ5y3vAjl0', null, null, null, null, null, null, null, '0', null, '2019-11-04 17:19:59', '1', null);
INSERT INTO zsys_customer VALUES ('7', null, null, 'ozGr25awd7sY3BAbfzkL4-HTxjoE', null, null, null, null, null, null, null, '0', null, '2019-11-04 17:19:59', '1', null);
INSERT INTO zsys_customer VALUES ('8', null, null, 'ozGr25etr_yIR_h2IGW2cXhzik1w', null, null, null, null, null, null, null, '0', null, '2019-11-04 17:20:13', '1', null);
INSERT INTO zsys_customer VALUES ('9', null, null, 'ozGr25aXgnlvD-9RfIVAqdhXnQGc', null, null, null, null, null, null, null, '0', null, '2019-11-04 17:46:54', '1', null);
INSERT INTO zsys_customer VALUES ('10', null, null, 'ozGr25T8g-shMo-Km7nhnV3U7r2k', null, null, null, null, null, null, null, '0', null, '2019-11-05 08:39:53', '1', null);
INSERT INTO zsys_customer VALUES ('11', null, null, 'ozGr25T4w-KDzePuH18AAJ4Cjm8M', null, null, null, null, null, null, null, '0', null, '2019-11-05 09:45:34', '1', null);
INSERT INTO zsys_customer VALUES ('12', null, null, 'ozGr25dXu2s4Qd_TLW-c4-mt7omc', null, null, null, null, null, null, null, '0', null, '2019-11-05 09:45:48', '1', null);

-- ----------------------------
-- Table structure for `zsys_customer_balance`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_customer_balance`;
CREATE TABLE `zsys_customer_balance` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL COMMENT '用户id',
  `total_money` decimal(10,2) NOT NULL COMMENT '总余额',
  `simple_code` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '防止金额被篡改的密钥',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of zsys_customer_balance
-- ----------------------------
INSERT INTO zsys_customer_balance VALUES ('1', '1', '0.02', '6305d1506caa6f58d63d8cb2ccba14d8');
INSERT INTO zsys_customer_balance VALUES ('2', '3', '0.00', '8599364a9bde086135cec48b846cb22e');
INSERT INTO zsys_customer_balance VALUES ('3', '2', '0.00', 'b6c7f314c58b7e07d116fa99127ffa5b');
INSERT INTO zsys_customer_balance VALUES ('4', '4', '0.00', '71d076f8949bae2f41d9e92854878b18');

-- ----------------------------
-- Table structure for `zsys_customer_cash_log`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_customer_cash_log`;
CREATE TABLE `zsys_customer_cash_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) DEFAULT NULL COMMENT '关联用户id',
  `type` smallint(1) DEFAULT NULL COMMENT '类型（1：支出，2：充值，3：退款）',
  `money` decimal(10,2) DEFAULT NULL COMMENT '金额(元)',
  `surplus_money` decimal(10,2) DEFAULT NULL COMMENT '充值/支出后剩余金额',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  `order_id` bigint(20) DEFAULT NULL COMMENT '关联订单id',
  `give_money` decimal(10,2) DEFAULT '0.00' COMMENT '赠送金额',
  `insure_num` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '充值并赠送金额所关联保单号',
  `company_id` int(11) DEFAULT '0' COMMENT '保单所属保险公司id',
  `simple_code` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '用于对账时比对金额是否被篡改',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户余额明细表';

-- ----------------------------
-- Records of zsys_customer_cash_log
-- ----------------------------
INSERT INTO zsys_customer_cash_log VALUES ('1', '1', '2', '0.01', '0.01', '2019-11-04 09:53:27', '5', '0.00', null, '0', '3776a35cd57d67ddf5ebccc0211ce5dd');
INSERT INTO zsys_customer_cash_log VALUES ('2', '1', '1', '0.01', '0.00', '2019-11-04 09:53:27', '5', '0.00', null, '0', '3776a35cd57d67ddf5ebccc0211ce5dd');
INSERT INTO zsys_customer_cash_log VALUES ('3', '1', '2', '0.01', '0.01', '2019-11-04 16:05:37', '0', '0.00', null, '0', '42f8be4bacd3107898fdabf80c52ab13');
INSERT INTO zsys_customer_cash_log VALUES ('4', '1', '2', '0.01', '0.02', '2019-11-04 16:22:18', '0', '0.00', '123456789098', '2', '53538b41658a36826a197c91eb171180');

-- ----------------------------
-- Table structure for `zsys_customer_grade`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_customer_grade`;
CREATE TABLE `zsys_customer_grade` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(20) NOT NULL COMMENT '等级名称',
  `lowest_money` decimal(10,2) NOT NULL COMMENT '等级最低金额',
  `highest_money` decimal(10,2) NOT NULL COMMENT '等级最高金额',
  `lowest_recharge_money` decimal(10,2) NOT NULL COMMENT '最低充值金额',
  `list_order` int(11) DEFAULT '0',
  `remark` varchar(1024) DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='会员等级管理表';

-- ----------------------------
-- Records of zsys_customer_grade
-- ----------------------------
INSERT INTO zsys_customer_grade VALUES ('1', '测试', '1000.00', '2000.00', '100.00', '0', '测试123', null, '2019-10-11 17:57:20', '1');

-- ----------------------------
-- Table structure for `zsys_customer_oil_log`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_customer_oil_log`;
CREATE TABLE `zsys_customer_oil_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) DEFAULT NULL COMMENT '关联用户id',
  `station_id` bigint(20) DEFAULT NULL COMMENT '关联油站id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '关联订单id',
  `oil_num` decimal(10,2) DEFAULT NULL COMMENT '加油总量',
  `oil_unitprice` decimal(10,2) DEFAULT NULL COMMENT '加油单价（元/L）',
  `oil_totalmoney` decimal(10,2) DEFAULT NULL COMMENT '加油总金额',
  `create_time` datetime DEFAULT NULL COMMENT '加油时间',
  `remark` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注说明',
  `update_time` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '状态0正常1撤销',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zsys_customer_oil_log
-- ----------------------------
INSERT INTO zsys_customer_oil_log VALUES ('1', '1', '5010', '5', '0.00', '7.15', '0.01', '2019-11-04 09:53:27', null, null, '0');

-- ----------------------------
-- Table structure for `zsys_customer_signup`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_customer_signup`;
CREATE TABLE `zsys_customer_signup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sign_name` varchar(20) DEFAULT NULL,
  `sign_tel` varchar(11) DEFAULT NULL,
  `car_number` varchar(16) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `creat_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户报名表zsys_customer_signup';

-- ----------------------------
-- Records of zsys_customer_signup
-- ----------------------------
INSERT INTO zsys_customer_signup VALUES ('1', '123', '123', '123', '1', '2019-11-05 16:40:01');
INSERT INTO zsys_customer_signup VALUES ('2', '456', '456', '456', '1', '2019-11-05 16:41:02');

-- ----------------------------
-- Table structure for `zsys_hook`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_hook`;
CREATE TABLE `zsys_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子表';

-- ----------------------------
-- Records of zsys_hook
-- ----------------------------
INSERT INTO zsys_hook VALUES ('2', '1', '0', '应用开始', 'app_begin', 'cmf', '应用开始');
INSERT INTO zsys_hook VALUES ('3', '1', '0', '模块初始化', 'module_init', 'cmf', '模块初始化');
INSERT INTO zsys_hook VALUES ('4', '1', '0', '控制器开始', 'action_begin', 'cmf', '控制器开始');
INSERT INTO zsys_hook VALUES ('5', '1', '0', '视图输出过滤', 'view_filter', 'cmf', '视图输出过滤');
INSERT INTO zsys_hook VALUES ('6', '1', '0', '应用结束', 'app_end', 'cmf', '应用结束');
INSERT INTO zsys_hook VALUES ('7', '1', '0', '日志write方法', 'log_write', 'cmf', '日志write方法');
INSERT INTO zsys_hook VALUES ('8', '1', '0', '输出结束', 'response_end', 'cmf', '输出结束');
INSERT INTO zsys_hook VALUES ('9', '1', '0', '后台控制器初始化', 'admin_init', 'cmf', '后台控制器初始化');
INSERT INTO zsys_hook VALUES ('10', '1', '0', '前台控制器初始化', 'home_init', 'cmf', '前台控制器初始化');
INSERT INTO zsys_hook VALUES ('11', '1', '1', '发送手机验证码', 'send_mobile_verification_code', 'cmf', '发送手机验证码');
INSERT INTO zsys_hook VALUES ('12', '3', '0', '模板 body标签开始', 'body_start', '', '模板 body标签开始');
INSERT INTO zsys_hook VALUES ('13', '3', '0', '模板 head标签结束前', 'before_head_end', '', '模板 head标签结束前');
INSERT INTO zsys_hook VALUES ('14', '3', '0', '模板底部开始', 'footer_start', '', '模板底部开始');
INSERT INTO zsys_hook VALUES ('15', '3', '0', '模板底部开始之前', 'before_footer', '', '模板底部开始之前');
INSERT INTO zsys_hook VALUES ('16', '3', '0', '模板底部结束之前', 'before_footer_end', '', '模板底部结束之前');
INSERT INTO zsys_hook VALUES ('17', '3', '0', '模板 body 标签结束之前', 'before_body_end', '', '模板 body 标签结束之前');
INSERT INTO zsys_hook VALUES ('18', '3', '0', '模板左边栏开始', 'left_sidebar_start', '', '模板左边栏开始');
INSERT INTO zsys_hook VALUES ('19', '3', '0', '模板左边栏结束之前', 'before_left_sidebar_end', '', '模板左边栏结束之前');
INSERT INTO zsys_hook VALUES ('20', '3', '0', '模板右边栏开始', 'right_sidebar_start', '', '模板右边栏开始');
INSERT INTO zsys_hook VALUES ('21', '3', '0', '模板右边栏结束之前', 'before_right_sidebar_end', '', '模板右边栏结束之前');
INSERT INTO zsys_hook VALUES ('22', '3', '1', '评论区', 'comment', '', '评论区');
INSERT INTO zsys_hook VALUES ('23', '3', '1', '留言区', 'guestbook', '', '留言区');
INSERT INTO zsys_hook VALUES ('24', '2', '0', '后台首页仪表盘', 'admin_dashboard', 'admin', '后台首页仪表盘');
INSERT INTO zsys_hook VALUES ('25', '4', '0', '后台模板 head标签结束前', 'admin_before_head_end', '', '后台模板 head标签结束前');
INSERT INTO zsys_hook VALUES ('26', '4', '0', '后台模板 body 标签结束之前', 'admin_before_body_end', '', '后台模板 body 标签结束之前');
INSERT INTO zsys_hook VALUES ('27', '2', '0', '后台登录页面', 'admin_login', 'admin', '后台登录页面');
INSERT INTO zsys_hook VALUES ('28', '1', '1', '前台模板切换', 'switch_theme', 'cmf', '前台模板切换');
INSERT INTO zsys_hook VALUES ('29', '3', '0', '主要内容之后', 'after_content', '', '主要内容之后');
INSERT INTO zsys_hook VALUES ('32', '2', '1', '获取上传界面', 'fetch_upload_view', 'user', '获取上传界面');
INSERT INTO zsys_hook VALUES ('33', '3', '0', '主要内容之前', 'before_content', 'cmf', '主要内容之前');
INSERT INTO zsys_hook VALUES ('34', '1', '0', '日志写入完成', 'log_write_done', 'cmf', '日志写入完成');
INSERT INTO zsys_hook VALUES ('35', '1', '1', '后台模板切换', 'switch_admin_theme', 'cmf', '后台模板切换');
INSERT INTO zsys_hook VALUES ('36', '1', '1', '验证码图片', 'captcha_image', 'cmf', '验证码图片');
INSERT INTO zsys_hook VALUES ('37', '2', '1', '后台模板设计界面', 'admin_theme_design_view', 'admin', '后台模板设计界面');
INSERT INTO zsys_hook VALUES ('38', '2', '1', '后台设置网站信息界面', 'admin_setting_site_view', 'admin', '后台设置网站信息界面');
INSERT INTO zsys_hook VALUES ('39', '2', '1', '后台清除缓存界面', 'admin_setting_clear_cache_view', 'admin', '后台清除缓存界面');
INSERT INTO zsys_hook VALUES ('40', '2', '1', '后台导航管理界面', 'admin_nav_index_view', 'admin', '后台导航管理界面');
INSERT INTO zsys_hook VALUES ('41', '2', '1', '后台友情链接管理界面', 'admin_link_index_view', 'admin', '后台友情链接管理界面');
INSERT INTO zsys_hook VALUES ('42', '2', '1', '后台幻灯片管理界面', 'admin_slide_index_view', 'admin', '后台幻灯片管理界面');
INSERT INTO zsys_hook VALUES ('43', '2', '1', '后台管理员列表界面', 'admin_user_index_view', 'admin', '后台管理员列表界面');
INSERT INTO zsys_hook VALUES ('44', '2', '1', '后台角色管理界面', 'admin_rbac_index_view', 'admin', '后台角色管理界面');
INSERT INTO zsys_hook VALUES ('49', '2', '1', '用户管理本站用户列表界面', 'user_admin_index_view', 'user', '用户管理本站用户列表界面');
INSERT INTO zsys_hook VALUES ('50', '2', '1', '资源管理列表界面', 'user_admin_asset_index_view', 'user', '资源管理列表界面');
INSERT INTO zsys_hook VALUES ('51', '2', '1', '用户管理第三方用户列表界面', 'user_admin_oauth_index_view', 'user', '用户管理第三方用户列表界面');
INSERT INTO zsys_hook VALUES ('52', '2', '1', '后台首页界面', 'admin_index_index_view', 'admin', '后台首页界面');
INSERT INTO zsys_hook VALUES ('53', '2', '1', '后台回收站界面', 'admin_recycle_bin_index_view', 'admin', '后台回收站界面');
INSERT INTO zsys_hook VALUES ('54', '2', '1', '后台菜单管理界面', 'admin_menu_index_view', 'admin', '后台菜单管理界面');
INSERT INTO zsys_hook VALUES ('55', '2', '1', '后台自定义登录是否开启钩子', 'admin_custom_login_open', 'admin', '后台自定义登录是否开启钩子');
INSERT INTO zsys_hook VALUES ('64', '2', '1', '后台幻灯片页面列表界面', 'admin_slide_item_index_view', 'admin', '后台幻灯片页面列表界面');
INSERT INTO zsys_hook VALUES ('65', '2', '1', '后台幻灯片页面添加界面', 'admin_slide_item_add_view', 'admin', '后台幻灯片页面添加界面');
INSERT INTO zsys_hook VALUES ('66', '2', '1', '后台幻灯片页面编辑界面', 'admin_slide_item_edit_view', 'admin', '后台幻灯片页面编辑界面');
INSERT INTO zsys_hook VALUES ('67', '2', '1', '后台管理员添加界面', 'admin_user_add_view', 'admin', '后台管理员添加界面');
INSERT INTO zsys_hook VALUES ('68', '2', '1', '后台管理员编辑界面', 'admin_user_edit_view', 'admin', '后台管理员编辑界面');
INSERT INTO zsys_hook VALUES ('69', '2', '1', '后台角色添加界面', 'admin_rbac_role_add_view', 'admin', '后台角色添加界面');
INSERT INTO zsys_hook VALUES ('70', '2', '1', '后台角色编辑界面', 'admin_rbac_role_edit_view', 'admin', '后台角色编辑界面');
INSERT INTO zsys_hook VALUES ('71', '2', '1', '后台角色授权界面', 'admin_rbac_authorize_view', 'admin', '后台角色授权界面');
INSERT INTO zsys_hook VALUES ('72', '1', '0', '应用调度', 'app_dispatch', 'cmf', '应用调度');

-- ----------------------------
-- Table structure for `zsys_hook_plugin`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_hook_plugin`;
CREATE TABLE `zsys_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子插件表';

-- ----------------------------
-- Records of zsys_hook_plugin
-- ----------------------------
INSERT INTO zsys_hook_plugin VALUES ('2', '10000', '1', 'footer_start', 'Demo');

-- ----------------------------
-- Table structure for `zsys_insurance_cashback_log`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_insurance_cashback_log`;
CREATE TABLE `zsys_insurance_cashback_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `insurance_id` int(11) NOT NULL COMMENT '保险公司id',
  `customer_id` bigint(20) NOT NULL COMMENT '返现用户id',
  `order_id` bigint(20) NOT NULL COMMENT '关联充值订单id',
  `scale` int(5) DEFAULT NULL COMMENT '返现时对应的返现比例',
  `cashback_money` decimal(10,2) NOT NULL COMMENT '返现金额',
  `cashback_time` datetime NOT NULL COMMENT '返现时间',
  `insure_num` varchar(50) NOT NULL COMMENT '对应保单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='保险公司返现记录表，用于和保险公司对账';

-- ----------------------------
-- Records of zsys_insurance_cashback_log
-- ----------------------------

-- ----------------------------
-- Table structure for `zsys_insurance_company`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_insurance_company`;
CREATE TABLE `zsys_insurance_company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `insurance_name` varchar(50) NOT NULL COMMENT '保险公司名称',
  `scale` smallint(5) NOT NULL COMMENT '返现比例',
  `total_cashback` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '累计返现金额总数',
  `remark` varchar(1024) DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='保险公司数据表';

-- ----------------------------
-- Records of zsys_insurance_company
-- ----------------------------
INSERT INTO zsys_insurance_company VALUES ('1', '测试', '20', '0.00', '测试一下', '1', '2019-10-10 11:24:06', '1');
INSERT INTO zsys_insurance_company VALUES ('2', '测试789', '10', '0.00', '测试', null, '2019-10-10 15:17:32', '1');
INSERT INTO zsys_insurance_company VALUES ('3', '阳光保险', '20', '0.00', '测试', null, '2019-10-16 10:42:43', '1');

-- ----------------------------
-- Table structure for `zsys_insurance_customer`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_insurance_customer`;
CREATE TABLE `zsys_insurance_customer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `insure_customer_name` varchar(50) NOT NULL COMMENT '用户姓名',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `age` int(3) DEFAULT NULL COMMENT '年龄',
  `phone` varchar(20) NOT NULL COMMENT '手机号',
  `insure_money` decimal(10,2) NOT NULL COMMENT '保险金额',
  `start_time` datetime NOT NULL COMMENT '保险开始时间',
  `end_time` datetime NOT NULL COMMENT '保险结束时间',
  `carnum` varchar(50) NOT NULL COMMENT '车牌啊好',
  `cashback_money` decimal(10,2) NOT NULL COMMENT '返现金额',
  `insure_company` varchar(50) NOT NULL COMMENT '所属保险公司',
  `insure_num` varchar(50) NOT NULL COMMENT '保单号',
  `company_id` int(11) NOT NULL COMMENT '所属保险公司id',
  `cashback_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '返现状态，0：未返现，1：已返现',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of zsys_insurance_customer
-- ----------------------------
INSERT INTO zsys_insurance_customer VALUES ('2', '测试', '男', '30', '', '2000.00', '2019-01-01 00:00:00', '2019-12-31 00:00:00', '鲁Y80Z69', '400.00', '阳光保险', '2019001', '3', '0');
INSERT INTO zsys_insurance_customer VALUES ('3', '测试', '男', '29', '18396643306', '2000.00', '2019-11-01 00:00:00', '2020-11-01 00:00:00', '', '600.00', '中国人保', '123456789098', '2', '1');

-- ----------------------------
-- Table structure for `zsys_oil_brand`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_oil_brand`;
CREATE TABLE `zsys_oil_brand` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `brand_name` varchar(50) DEFAULT NULL COMMENT '品牌名称',
  `brand_logo` varchar(255) DEFAULT NULL COMMENT '品牌logo',
  `logo_url` varchar(255) DEFAULT NULL COMMENT 'logo地址',
  `remark` varchar(1024) DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of zsys_oil_brand
-- ----------------------------
INSERT INTO zsys_oil_brand VALUES ('1', '中石油', '/upload/default/20191101/7f5a26fa392d9f8e5447def90ec12869.png', 'https://oil.hoifans.com/upload/default/20191101/7f5a26fa392d9f8e5447def90ec12869.png', '测试', null, '2019-10-30 15:17:33', '1');
INSERT INTO zsys_oil_brand VALUES ('2', '中国石化', '/upload/default/20191101/4e224b4ffdd381206b5552d5200aa3d3.png', 'https://oil.hoifans.com/upload/default/20191101/4e224b4ffdd381206b5552d5200aa3d3.png', '', null, '2019-11-01 16:17:06', '1');
INSERT INTO zsys_oil_brand VALUES ('3', '壳牌', '/upload/default/20191101/3b93f8d2377b2d384b128b98d3c02049.png', 'https://oil.hoifans.com/upload/default/20191101/3b93f8d2377b2d384b128b98d3c02049.png', '', null, '2019-11-01 16:17:17', '1');

-- ----------------------------
-- Table structure for `zsys_oil_code`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_oil_code`;
CREATE TABLE `zsys_oil_code` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `oil_code` int(11) NOT NULL COMMENT '信联油号code',
  `gb_code` varchar(50) NOT NULL COMMENT '国标名称',
  `oil_type` varchar(50) NOT NULL COMMENT '油类型',
  `oil_num` varchar(20) NOT NULL COMMENT '油号名称',
  `oil_name` varchar(50) NOT NULL COMMENT '油名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='信联油号code表';

-- ----------------------------
-- Records of zsys_oil_code
-- ----------------------------

-- ----------------------------
-- Table structure for `zsys_oil_number`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_oil_number`;
CREATE TABLE `zsys_oil_number` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `station_id` int(11) NOT NULL COMMENT '关联油站id',
  `panda_money` decimal(10,2) NOT NULL COMMENT '实时价格（熊猫油价）',
  `oilnumber_name` varchar(20) NOT NULL COMMENT '汽油标号名称',
  `gasstation_money` decimal(10,2) NOT NULL COMMENT '加油站油价',
  `market_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场油价',
  `list_order` int(11) DEFAULT '0',
  `remark` varchar(1024) DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `oil_type` smallint(1) NOT NULL DEFAULT '1' COMMENT '油类型(0：柴油1：汽油)',
  `freeway_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '山东高速油价',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`station_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3655 DEFAULT CHARSET=utf8mb4 COMMENT='加油站油号表';

-- ----------------------------
-- Records of zsys_oil_number
-- ----------------------------
INSERT INTO zsys_oil_number VALUES ('318', '23', '6.18', '0#', '6.68', '6.46', '0', null, null, '2019-09-28 17:32:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('319', '23', '6.55', '92#', '7.05', '6.83', '0', null, null, '2019-09-28 17:32:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('320', '23', '6.95', '95#', '7.45', '7.21', '0', null, null, '2019-09-28 17:32:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('321', '25', '6.18', '0#', '6.68', '6.46', '0', null, null, '2019-09-28 17:32:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('322', '25', '6.55', '92#', '7.05', '6.83', '0', null, null, '2019-09-28 17:32:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('323', '25', '6.95', '95#', '7.45', '7.21', '0', null, null, '2019-09-28 17:32:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('324', '25', '7.89', '98#', '8.39', '8.12', '0', null, null, '2019-09-28 17:32:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('325', '26', '6.18', '0#', '6.68', '6.46', '0', null, null, '2019-09-28 17:32:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('326', '26', '6.55', '92#', '7.05', '6.83', '0', null, null, '2019-09-28 17:32:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('327', '26', '6.95', '95#', '7.45', '7.21', '0', null, null, '2019-09-28 17:32:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('328', '26', '7.89', '98#', '8.39', '8.12', '0', null, null, '2019-09-28 17:32:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('329', '27', '6.18', '0#', '6.68', '6.46', '0', null, null, '2019-09-28 17:32:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('330', '27', '6.55', '92#', '7.05', '6.83', '0', null, null, '2019-09-28 17:32:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('331', '27', '6.95', '95#', '7.45', '7.21', '0', null, null, '2019-09-28 17:32:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('332', '27', '7.89', '98#', '8.39', '8.12', '0', null, null, '2019-09-28 17:32:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('333', '28', '6.18', '0#', '6.68', '6.46', '0', null, null, '2019-09-28 17:32:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('334', '28', '6.55', '92#', '7.05', '6.83', '0', null, null, '2019-09-28 17:32:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('335', '28', '6.95', '95#', '7.45', '7.21', '0', null, null, '2019-09-28 17:32:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('336', '28', '7.89', '98#', '8.39', '8.12', '0', null, null, '2019-09-28 17:32:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('337', '29', '6.25', '0#', '6.75', '6.46', '0', null, null, '2019-09-28 17:32:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('338', '29', '6.62', '92#', '7.12', '6.83', '0', null, null, '2019-09-28 17:32:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('339', '29', '7.02', '95#', '7.52', '7.21', '0', null, null, '2019-09-28 17:32:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('340', '29', '7.97', '98#', '8.47', '8.12', '0', null, null, '2019-09-28 17:32:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('341', '30', '6.69', '0#', '7.19', '6.46', '0', null, null, '2019-09-28 17:32:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('342', '30', '7.05', '92#', '7.55', '6.83', '0', null, null, '2019-09-28 17:32:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('343', '30', '7.48', '95#', '7.98', '7.21', '0', null, null, '2019-09-28 17:32:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('344', '30', '8.48', '98#', '8.98', '8.12', '0', null, null, '2019-09-28 17:32:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('345', '31', '4.91', '0#', '5.41', '6.46', '0', null, null, '2019-09-28 17:32:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('346', '31', '7.05', '92#', '7.55', '6.83', '0', null, null, '2019-09-28 17:32:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('347', '31', '7.48', '95#', '7.98', '7.21', '0', null, null, '2019-09-28 17:32:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('348', '31', '8.48', '98#', '8.98', '8.12', '0', null, null, '2019-09-28 17:32:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('349', '32', '6.69', '0#', '7.19', '6.46', '0', null, null, '2019-09-28 17:32:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('350', '32', '7.05', '92#', '7.55', '6.83', '0', null, null, '2019-09-28 17:32:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('351', '32', '7.48', '95#', '7.98', '7.21', '0', null, null, '2019-09-28 17:32:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('352', '32', '8.48', '98#', '8.98', '8.12', '0', null, null, '2019-09-28 17:32:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('353', '33', '6.18', '0#', '6.68', '6.46', '0', null, null, '2019-09-28 17:32:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('354', '33', '6.55', '92#', '7.05', '6.83', '0', null, null, '2019-09-28 17:32:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('355', '33', '6.95', '95#', '7.45', '7.21', '0', null, null, '2019-09-28 17:32:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('356', '33', '7.89', '98#', '8.39', '8.12', '0', null, null, '2019-09-28 17:32:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('357', '34', '4.91', '0#', '5.41', '6.46', '0', null, null, '2019-09-28 17:32:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('358', '34', '6.55', '92#', '7.05', '6.83', '0', null, null, '2019-09-28 17:32:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('359', '34', '6.95', '95#', '7.45', '7.21', '0', null, null, '2019-09-28 17:32:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('360', '34', '7.89', '98#', '8.39', '8.12', '0', null, null, '2019-09-28 17:32:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('361', '35', '6.18', '0#', '6.68', '6.46', '0', null, null, '2019-09-28 17:32:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('362', '35', '6.55', '92#', '7.05', '6.83', '0', null, null, '2019-09-28 17:32:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('363', '35', '6.95', '95#', '7.45', '7.21', '0', null, null, '2019-09-28 17:32:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('364', '35', '7.89', '98#', '8.39', '8.12', '0', null, null, '2019-09-28 17:32:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('365', '36', '6.18', '0#', '6.68', '6.46', '0', null, null, '2019-09-28 17:32:08', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('366', '36', '6.55', '92#', '7.05', '6.83', '0', null, null, '2019-09-28 17:32:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('367', '36', '6.95', '95#', '7.45', '7.21', '0', null, null, '2019-09-28 17:32:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('368', '36', '7.89', '98#', '8.39', '8.12', '0', null, null, '2019-09-28 17:32:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('369', '37', '6.18', '0#', '6.68', '6.46', '0', null, null, '2019-09-28 17:32:08', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('370', '37', '6.55', '92#', '7.05', '6.83', '0', null, null, '2019-09-28 17:32:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('371', '37', '6.95', '95#', '7.45', '7.21', '0', null, null, '2019-09-28 17:32:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('372', '37', '7.89', '98#', '8.39', '8.12', '0', null, null, '2019-09-28 17:32:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('373', '38', '6.18', '0#', '6.68', '6.46', '0', null, null, '2019-09-28 17:32:08', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('374', '38', '6.55', '92#', '7.05', '6.83', '0', null, null, '2019-09-28 17:32:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('375', '38', '6.95', '95#', '7.45', '7.21', '0', null, null, '2019-09-28 17:32:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('376', '38', '7.89', '98#', '8.39', '8.12', '0', null, null, '2019-09-28 17:32:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('377', '39', '6.18', '0#', '6.68', '6.46', '0', null, null, '2019-09-28 17:32:08', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('378', '39', '6.55', '92#', '7.05', '6.83', '0', null, null, '2019-09-28 17:32:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('379', '39', '6.95', '95#', '7.45', '7.21', '0', null, null, '2019-09-28 17:32:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('380', '39', '7.89', '98#', '8.39', '8.12', '0', null, null, '2019-09-28 17:32:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('381', '40', '6.18', '0#', '6.68', '6.46', '0', null, null, '2019-09-28 17:32:09', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('382', '40', '6.55', '92#', '7.05', '6.83', '0', null, null, '2019-09-28 17:32:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('383', '40', '6.95', '95#', '7.45', '7.21', '0', null, null, '2019-09-28 17:32:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('384', '40', '7.89', '98#', '8.39', '8.12', '0', null, null, '2019-09-28 17:32:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('385', '41', '6.18', '0#', '6.68', '6.46', '0', null, null, '2019-09-28 17:32:09', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('386', '41', '6.55', '92#', '7.05', '6.83', '0', null, null, '2019-09-28 17:32:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('387', '41', '6.95', '95#', '7.45', '7.21', '0', null, null, '2019-09-28 17:32:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('388', '41', '7.89', '98#', '8.39', '8.12', '0', null, null, '2019-09-28 17:32:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('389', '42', '6.18', '0#', '6.68', '6.46', '0', null, null, '2019-09-28 17:32:09', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('390', '42', '6.55', '92#', '7.05', '6.83', '0', null, null, '2019-09-28 17:32:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('391', '42', '6.95', '95#', '7.45', '7.21', '0', null, null, '2019-09-28 17:32:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('392', '42', '7.89', '98#', '8.39', '8.12', '0', null, null, '2019-09-28 17:32:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('393', '43', '6.18', '0#', '6.68', '6.46', '0', null, null, '2019-09-28 17:32:10', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('394', '43', '6.55', '92#', '7.05', '6.83', '0', null, null, '2019-09-28 17:32:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('395', '43', '6.95', '95#', '7.45', '7.21', '0', null, null, '2019-09-28 17:32:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('396', '43', '7.89', '98#', '8.39', '8.12', '0', null, null, '2019-09-28 17:32:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('397', '44', '6.18', '0#', '6.68', '6.46', '0', null, null, '2019-09-28 17:32:10', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('398', '44', '6.55', '92#', '7.05', '6.83', '0', null, null, '2019-09-28 17:32:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('399', '44', '6.95', '95#', '7.45', '7.21', '0', null, null, '2019-09-28 17:32:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('400', '44', '7.89', '98#', '8.39', '8.12', '0', null, null, '2019-09-28 17:32:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('401', '45', '6.18', '0#', '6.68', '6.46', '0', null, null, '2019-09-28 17:32:10', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('402', '45', '6.55', '92#', '7.05', '6.83', '0', null, null, '2019-09-28 17:32:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('403', '45', '6.95', '95#', '7.45', '7.21', '0', null, null, '2019-09-28 17:32:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('404', '45', '7.89', '98#', '8.39', '8.12', '0', null, null, '2019-09-28 17:32:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('405', '46', '6.69', '0#', '7.19', '6.46', '0', null, null, '2019-09-28 17:32:10', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('406', '46', '7.05', '92#', '7.55', '6.83', '0', null, null, '2019-09-28 17:32:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('407', '46', '7.48', '95#', '7.98', '7.21', '0', null, null, '2019-09-28 17:32:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('408', '46', '8.48', '98#', '8.98', '8.12', '0', null, null, '2019-09-28 17:32:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('409', '49', '6.26', '0#', '6.76', '6.38', '0', null, null, '2019-09-28 17:32:11', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('410', '49', '6.61', '92#', '7.11', '6.73', '0', null, null, '2019-09-28 17:32:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('411', '49', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-28 17:32:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('412', '50', '6.26', '0#', '6.76', '6.38', '0', null, null, '2019-09-28 17:32:11', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('413', '50', '6.61', '92#', '7.11', '6.73', '0', null, null, '2019-09-28 17:32:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('414', '50', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-28 17:32:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('415', '51', '6.26', '0#', '6.76', '6.38', '0', null, null, '2019-09-28 17:32:11', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('416', '51', '6.61', '92#', '7.11', '6.73', '0', null, null, '2019-09-28 17:32:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('417', '51', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-28 17:32:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('418', '52', '6.26', '0#', '6.76', '6.38', '0', null, null, '2019-09-28 17:32:11', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('419', '52', '6.61', '92#', '7.11', '6.73', '0', null, null, '2019-09-28 17:32:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('420', '52', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-28 17:32:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('421', '53', '6.26', '0#', '6.76', '6.38', '0', null, null, '2019-09-28 17:32:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('422', '53', '6.61', '92#', '7.11', '6.73', '0', null, null, '2019-09-28 17:32:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('423', '53', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-28 17:32:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('424', '54', '6.26', '0#', '6.76', '6.38', '0', null, null, '2019-09-28 17:32:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('425', '54', '6.61', '92#', '7.11', '6.73', '0', null, null, '2019-09-28 17:32:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('426', '54', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-28 17:32:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('427', '55', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('428', '55', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('429', '55', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('430', '56', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('431', '56', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('432', '56', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('433', '57', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('434', '57', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('435', '57', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('436', '58', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:13', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('437', '58', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('438', '58', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('439', '59', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:13', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('440', '59', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('441', '59', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('442', '60', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:13', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('443', '60', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('444', '60', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('445', '61', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:13', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('446', '61', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('447', '61', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('448', '62', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:14', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('449', '62', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('450', '62', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('451', '63', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:14', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('452', '63', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('453', '63', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('454', '64', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:14', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('455', '64', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('456', '64', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('457', '65', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:14', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('458', '65', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('459', '65', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('460', '66', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:15', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('461', '66', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('462', '66', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('463', '67', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:15', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('464', '67', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('465', '67', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('466', '68', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('467', '69', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:32:15', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('468', '69', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:32:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('469', '69', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:32:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('470', '71', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:32:15', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('471', '71', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:32:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('472', '72', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:15', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('473', '72', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('474', '72', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('475', '73', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:16', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('476', '73', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('477', '73', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('478', '76', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:16', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('479', '76', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('480', '76', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('481', '77', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:16', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('482', '77', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('483', '77', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('484', '80', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:16', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('485', '80', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('486', '80', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('487', '81', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:16', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('488', '81', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('489', '81', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('490', '82', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:17', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('491', '82', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('492', '82', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('493', '83', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:17', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('494', '83', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('495', '83', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('496', '84', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-28 17:32:17', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('497', '84', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-28 17:32:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('498', '84', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-28 17:32:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('499', '85', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-28 17:32:17', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('500', '85', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-28 17:32:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('501', '85', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-28 17:32:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('502', '86', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:18', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('503', '86', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('504', '86', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('505', '87', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:18', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('506', '87', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('507', '87', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('508', '88', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:18', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('509', '88', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('510', '88', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('511', '89', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:32:18', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('512', '89', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:32:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('513', '89', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:32:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('514', '113', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:18', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('515', '113', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('516', '113', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('517', '114', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:19', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('518', '114', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('519', '114', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('520', '131', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:19', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('521', '131', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('522', '131', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('523', '131', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('524', '132', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:19', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('525', '132', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('526', '132', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('527', '132', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('528', '133', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:20', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('529', '133', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('530', '133', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('531', '134', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:20', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('532', '134', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('533', '134', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('534', '135', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:20', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('535', '135', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('536', '135', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('537', '136', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:20', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('538', '136', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('539', '136', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('540', '137', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:20', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('541', '137', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('542', '137', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('543', '138', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:21', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('544', '138', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('545', '138', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('546', '139', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:21', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('547', '139', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('548', '139', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('549', '139', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('550', '140', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:21', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('551', '140', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('552', '140', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('553', '140', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('554', '141', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:21', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('555', '141', '6.20', '92#', '6.70', '6.73', '0', null, null, '2019-09-28 17:32:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('556', '141', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('557', '142', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:21', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('558', '142', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('559', '142', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('560', '143', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:22', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('561', '143', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('562', '143', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('563', '144', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:22', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('564', '144', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('565', '144', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('566', '145', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:22', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('567', '145', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('568', '146', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:22', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('569', '146', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('570', '147', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:22', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('571', '147', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('572', '147', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('573', '148', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:23', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('574', '148', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('575', '148', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('576', '149', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:23', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('577', '149', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('578', '149', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('579', '149', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('580', '150', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:23', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('581', '150', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('582', '150', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('583', '150', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('584', '151', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:23', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('585', '151', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('586', '152', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:24', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('587', '152', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('588', '153', '5.47', '0#', '5.97', '6.35', '0', null, null, '2019-09-28 17:32:24', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('589', '153', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('590', '153', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('591', '153', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('592', '154', '5.47', '0#', '5.97', '6.35', '0', null, null, '2019-09-28 17:32:24', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('593', '154', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('594', '154', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('595', '154', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('596', '155', '5.73', '0#', '6.23', '6.35', '0', null, null, '2019-09-28 17:32:24', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('597', '155', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('598', '155', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('599', '156', '5.73', '0#', '6.23', '6.35', '0', null, null, '2019-09-28 17:32:24', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('600', '156', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('601', '156', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('602', '157', '5.93', '0#', '6.43', '6.35', '0', null, null, '2019-09-28 17:32:25', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('603', '157', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('604', '157', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('605', '158', '5.93', '0#', '6.43', '6.35', '0', null, null, '2019-09-28 17:32:25', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('606', '158', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('607', '158', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('608', '159', '6.19', '0#', '6.69', '6.35', '0', null, null, '2019-09-28 17:32:25', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('609', '159', '6.56', '92#', '7.06', '6.73', '0', null, null, '2019-09-28 17:32:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('610', '159', '7.01', '95#', '7.51', '7.16', '0', null, null, '2019-09-28 17:32:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('611', '160', '6.19', '0#', '6.69', '6.35', '0', null, null, '2019-09-28 17:32:25', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('612', '160', '6.56', '92#', '7.06', '6.73', '0', null, null, '2019-09-28 17:32:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('613', '160', '7.01', '95#', '7.51', '7.16', '0', null, null, '2019-09-28 17:32:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('614', '161', '5.93', '0#', '6.43', '6.35', '0', null, null, '2019-09-28 17:32:26', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('615', '161', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('616', '161', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('617', '162', '5.93', '0#', '6.43', '6.35', '0', null, null, '2019-09-28 17:32:26', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('618', '162', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('619', '162', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('620', '163', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:26', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('621', '163', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('622', '163', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('623', '164', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:26', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('624', '164', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('625', '164', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('626', '165', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:26', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('627', '165', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('628', '165', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('629', '166', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:27', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('630', '166', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('631', '166', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('632', '167', '5.93', '0#', '6.43', '6.35', '0', null, null, '2019-09-28 17:32:27', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('633', '167', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('634', '167', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('635', '167', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('636', '168', '5.93', '0#', '6.43', '6.35', '0', null, null, '2019-09-28 17:32:27', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('637', '168', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('638', '168', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('639', '168', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('640', '169', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:27', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('641', '169', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('642', '169', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('643', '169', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('644', '170', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:28', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('645', '170', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('646', '170', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('647', '170', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('648', '171', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:28', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('649', '171', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('650', '171', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('651', '171', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('652', '172', '5.69', '0#', '6.19', '6.35', '0', null, null, '2019-09-28 17:32:28', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('653', '172', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('654', '172', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('655', '173', '5.69', '0#', '6.19', '6.35', '0', null, null, '2019-09-28 17:32:29', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('656', '173', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('657', '173', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('658', '174', '5.73', '0#', '6.23', '6.35', '0', null, null, '2019-09-28 17:32:29', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('659', '174', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('660', '174', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('661', '175', '5.73', '0#', '6.23', '6.35', '0', null, null, '2019-09-28 17:32:29', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('662', '175', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('663', '175', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('664', '184', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:29', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('665', '184', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('666', '184', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('667', '184', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('668', '185', '5.73', '0#', '6.23', '6.35', '0', null, null, '2019-09-28 17:32:30', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('669', '185', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('670', '185', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('671', '185', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('672', '186', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:30', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('673', '186', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('674', '186', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('675', '186', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('676', '187', '6.23', '0#', '6.73', '6.35', '0', null, null, '2019-09-28 17:32:30', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('677', '187', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('678', '187', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('679', '187', '7.93', '98#', '8.43', '8.04', '0', null, null, '2019-09-28 17:32:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('680', '188', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:32:30', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('681', '188', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('682', '188', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('683', '189', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:32:30', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('684', '189', '6.60', '92#', '7.10', '6.73', '0', null, null, '2019-09-28 17:32:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('685', '189', '7.05', '95#', '7.55', '7.16', '0', null, null, '2019-09-28 17:32:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('686', '191', '5.48', '0#', '5.98', '6.38', '0', null, null, '2019-09-28 17:32:31', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('687', '191', '6.63', '92#', '7.13', '6.73', '0', null, null, '2019-09-28 17:32:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('688', '191', '7.15', '95#', '7.65', '7.22', '0', null, null, '2019-09-28 17:32:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('689', '192', '5.48', '0#', '5.98', '6.38', '0', null, null, '2019-09-28 17:32:31', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('690', '192', '6.63', '92#', '7.13', '6.73', '0', null, null, '2019-09-28 17:32:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('691', '192', '7.15', '95#', '7.65', '7.22', '0', null, null, '2019-09-28 17:32:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('692', '193', '6.28', '0#', '6.78', '6.38', '0', null, null, '2019-09-28 17:32:31', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('693', '193', '6.63', '92#', '7.13', '6.73', '0', null, null, '2019-09-28 17:32:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('694', '193', '7.15', '95#', '7.65', '7.22', '0', null, null, '2019-09-28 17:32:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('695', '195', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:32:31', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('696', '195', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:32:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('697', '199', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:32:31', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('698', '199', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:32:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('699', '199', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:32:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('700', '200', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:32:32', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('701', '200', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:32:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('702', '200', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:32:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('703', '201', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:32:32', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('704', '201', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:32:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('705', '201', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:32:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('706', '202', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-28 17:32:32', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('707', '202', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-28 17:32:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('708', '202', '7.70', '98#', '8.20', '7.94', '0', null, null, '2019-09-28 17:32:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('709', '204', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-28 17:32:32', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('710', '204', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-28 17:32:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('711', '204', '7.70', '98#', '8.20', '7.94', '0', null, null, '2019-09-28 17:32:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('712', '205', '6.28', '0#', '6.78', '6.38', '0', null, null, '2019-09-28 17:32:33', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('713', '205', '6.63', '92#', '7.13', '6.73', '0', null, null, '2019-09-28 17:32:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('714', '205', '7.15', '95#', '7.65', '7.22', '0', null, null, '2019-09-28 17:32:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('715', '206', '6.28', '0#', '6.78', '6.38', '0', null, null, '2019-09-28 17:32:33', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('716', '206', '7.15', '95#', '7.65', '7.22', '0', null, null, '2019-09-28 17:32:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('717', '206', '7.87', '98#', '8.37', '7.94', '0', null, null, '2019-09-28 17:32:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('718', '207', '6.28', '0#', '6.78', '6.38', '0', null, null, '2019-09-28 17:33:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('719', '207', '7.15', '95#', '7.65', '7.22', '0', null, null, '2019-09-28 17:33:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('720', '207', '7.87', '98#', '8.37', '7.94', '0', null, null, '2019-09-28 17:33:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('721', '208', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:33:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('722', '208', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:33:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('723', '208', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:33:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('724', '209', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:33:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('725', '209', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:33:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('726', '209', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:33:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('727', '210', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:33:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('728', '210', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:33:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('729', '210', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:33:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('730', '211', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:33:55', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('731', '211', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:33:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('732', '211', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:33:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('733', '212', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:33:55', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('734', '212', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:33:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('735', '212', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:33:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('736', '213', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:33:55', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('737', '213', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:33:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('738', '213', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:33:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('739', '213', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:33:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('740', '214', '5.37', '0#', '5.87', '6.35', '0', null, null, '2019-09-28 17:33:55', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('741', '214', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:33:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('742', '214', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:33:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('743', '214', '7.56', '98#', '8.06', '8.04', '0', null, null, '2019-09-28 17:33:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('744', '217', '5.37', '0#', '5.87', '6.35', '0', null, null, '2019-09-28 17:33:56', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('745', '217', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:33:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('746', '217', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:33:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('747', '217', '7.56', '98#', '8.06', '8.04', '0', null, null, '2019-09-28 17:33:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('748', '218', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:33:56', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('749', '218', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:33:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('750', '218', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:33:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('751', '219', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:33:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('752', '219', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:33:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('753', '220', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:33:56', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('754', '220', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:33:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('755', '220', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:33:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('756', '221', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:33:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('757', '221', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:33:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('758', '221', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:33:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('759', '222', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:33:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('760', '222', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:33:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('761', '222', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:33:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('762', '223', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:33:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('763', '223', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:33:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('764', '223', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:33:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('765', '224', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:33:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('766', '224', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:33:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('767', '224', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:33:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('768', '225', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:33:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('769', '225', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:33:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('770', '225', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:33:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('771', '227', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:33:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('772', '227', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:33:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('773', '228', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:33:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('774', '228', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:33:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('775', '229', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:33:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('776', '229', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:33:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('777', '229', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:33:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('778', '230', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:33:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('779', '230', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:33:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('780', '231', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:33:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('781', '231', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:33:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('782', '232', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:33:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('783', '232', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:33:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('784', '232', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:33:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('785', '233', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:33:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('786', '233', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:33:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('787', '233', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:33:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('788', '234', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:33:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('789', '234', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:33:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('790', '235', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:33:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('791', '235', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:33:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('792', '236', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:33:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('793', '236', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:33:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('794', '237', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('795', '237', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('796', '237', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('797', '238', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('798', '238', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('799', '239', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('800', '239', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('801', '240', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('802', '240', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('803', '241', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('804', '241', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('805', '242', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('806', '242', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:34:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('807', '242', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('808', '243', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('809', '243', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('810', '243', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('811', '244', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('812', '244', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('813', '244', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('814', '245', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('815', '245', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('816', '246', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('817', '246', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('818', '247', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('819', '247', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('820', '248', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('821', '248', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('822', '249', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('823', '249', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('824', '250', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:02', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('825', '250', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('826', '250', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('827', '251', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:02', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('828', '251', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('829', '252', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:02', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('830', '252', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('831', '253', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:02', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('832', '253', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('833', '254', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:02', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('834', '254', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('835', '255', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:03', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('836', '255', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('837', '256', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:03', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('838', '256', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('839', '256', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('840', '257', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:03', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('841', '257', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('842', '258', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:03', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('843', '258', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('844', '258', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('845', '259', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:03', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('846', '259', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('847', '260', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('848', '260', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('849', '261', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('850', '261', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('851', '262', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('852', '262', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('853', '263', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('854', '263', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('855', '264', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('856', '264', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('857', '265', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('858', '265', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('859', '266', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('860', '266', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('861', '267', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('862', '267', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('863', '268', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('864', '268', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('865', '269', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('866', '269', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('867', '270', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('868', '270', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('869', '271', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('870', '271', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('871', '272', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('872', '272', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('873', '273', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('874', '273', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('875', '274', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('876', '274', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('877', '276', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('878', '276', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('879', '278', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('880', '278', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('881', '278', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('882', '279', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('883', '279', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('884', '279', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('885', '280', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('886', '280', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('887', '280', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:34:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('888', '287', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('889', '287', '6.26', '92#', '6.76', '6.74', '0', null, null, '2019-09-28 17:34:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('890', '287', '6.75', '95#', '7.25', '7.12', '0', null, null, '2019-09-28 17:34:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('891', '292', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('892', '292', '6.26', '92#', '6.76', '6.74', '0', null, null, '2019-09-28 17:34:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('893', '292', '6.75', '95#', '7.25', '7.12', '0', null, null, '2019-09-28 17:34:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('894', '300', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('895', '300', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('896', '301', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('897', '301', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('898', '302', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('899', '302', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('900', '302', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('901', '303', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:08', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('902', '303', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('903', '303', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('904', '303', '7.56', '98#', '8.06', '8.04', '0', null, null, '2019-09-28 17:34:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('905', '304', '5.32', '0#', '5.82', '6.35', '0', null, null, '2019-09-28 17:34:08', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('906', '304', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('907', '305', '5.32', '0#', '5.82', '6.35', '0', null, null, '2019-09-28 17:34:08', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('908', '305', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('909', '306', '5.32', '0#', '5.82', '6.35', '0', null, null, '2019-09-28 17:34:08', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('910', '306', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('911', '307', '5.32', '0#', '5.82', '6.35', '0', null, null, '2019-09-28 17:34:08', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('912', '307', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('913', '308', '5.37', '0#', '5.87', '6.35', '0', null, null, '2019-09-28 17:34:09', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('914', '308', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('915', '308', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('916', '309', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:09', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('917', '309', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('918', '309', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('919', '310', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:09', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('920', '310', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('921', '310', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('922', '311', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:09', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('923', '311', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('924', '311', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('925', '312', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:09', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('926', '312', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('927', '312', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('928', '313', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:10', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('929', '313', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('930', '313', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('931', '314', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:10', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('932', '314', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('933', '314', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('934', '315', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:10', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('935', '315', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('936', '315', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('937', '316', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:10', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('938', '316', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('939', '316', '6.63', '95#', '7.13', '7.16', '0', null, null, '2019-09-28 17:34:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('940', '317', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:11', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('941', '317', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('942', '317', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('943', '318', '5.48', '0#', '5.98', '6.38', '0', null, null, '2019-09-28 17:34:11', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('944', '318', '6.63', '92#', '7.13', '6.73', '0', null, null, '2019-09-28 17:34:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('945', '318', '7.15', '95#', '7.65', '7.22', '0', null, null, '2019-09-28 17:34:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('946', '319', '5.48', '0#', '5.98', '6.38', '0', null, null, '2019-09-28 17:34:11', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('947', '319', '6.63', '92#', '7.13', '6.73', '0', null, null, '2019-09-28 17:34:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('948', '319', '7.15', '95#', '7.65', '7.22', '0', null, null, '2019-09-28 17:34:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('949', '320', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:11', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('950', '320', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('951', '320', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('952', '321', '5.30', '0#', '5.80', '6.38', '0', null, null, '2019-09-28 17:34:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('953', '321', '6.35', '92#', '6.85', '6.73', '0', null, null, '2019-09-28 17:34:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('954', '321', '6.84', '95#', '7.34', '7.22', '0', null, null, '2019-09-28 17:34:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('955', '322', '5.30', '0#', '5.80', '6.38', '0', null, null, '2019-09-28 17:34:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('956', '322', '6.35', '92#', '6.85', '6.73', '0', null, null, '2019-09-28 17:34:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('957', '322', '6.84', '95#', '7.34', '7.22', '0', null, null, '2019-09-28 17:34:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('958', '323', '5.47', '0#', '5.97', '6.35', '0', null, null, '2019-09-28 17:34:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('959', '323', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('960', '326', '5.47', '0#', '5.97', '6.35', '0', null, null, '2019-09-28 17:34:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('961', '326', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('962', '329', '5.47', '0#', '5.97', '6.35', '0', null, null, '2019-09-28 17:34:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('963', '329', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('964', '330', '5.47', '0#', '5.97', '6.35', '0', null, null, '2019-09-28 17:34:13', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('965', '330', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('966', '331', '6.28', '0#', '6.78', '6.38', '0', null, null, '2019-09-28 17:34:13', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('967', '331', '6.63', '92#', '7.13', '6.73', '0', null, null, '2019-09-28 17:34:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('968', '331', '7.15', '95#', '7.65', '7.22', '0', null, null, '2019-09-28 17:34:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('969', '331', '7.87', '98#', '8.37', '7.94', '0', null, null, '2019-09-28 17:34:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('970', '333', '5.47', '0#', '5.97', '6.35', '0', null, null, '2019-09-28 17:34:13', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('971', '333', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('972', '333', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('973', '336', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-28 17:34:13', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('974', '336', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-28 17:34:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('975', '336', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-28 17:34:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('976', '336', '7.70', '98#', '8.20', '7.94', '0', null, null, '2019-09-28 17:34:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('977', '337', '5.47', '0#', '5.97', '6.35', '0', null, null, '2019-09-28 17:34:13', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('978', '337', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('979', '337', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('980', '338', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-28 17:34:14', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('981', '338', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-28 17:34:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('982', '338', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-28 17:34:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('983', '338', '7.70', '98#', '8.20', '7.94', '0', null, null, '2019-09-28 17:34:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('984', '339', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-28 17:34:14', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('985', '339', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-28 17:34:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('986', '339', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-28 17:34:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('987', '339', '7.70', '98#', '8.20', '7.94', '0', null, null, '2019-09-28 17:34:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('988', '341', '6.28', '0#', '6.78', '6.38', '0', null, null, '2019-09-28 17:34:14', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('989', '341', '6.63', '92#', '7.13', '6.73', '0', null, null, '2019-09-28 17:34:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('990', '341', '7.15', '95#', '7.65', '7.22', '0', null, null, '2019-09-28 17:34:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('991', '341', '7.87', '98#', '8.37', '7.94', '0', null, null, '2019-09-28 17:34:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('992', '342', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:15', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('993', '342', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('994', '342', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('995', '343', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-28 17:34:15', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('996', '343', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-28 17:34:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('997', '343', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-28 17:34:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('998', '343', '7.70', '98#', '8.20', '7.94', '0', null, null, '2019-09-28 17:34:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('999', '344', '6.28', '0#', '6.78', '6.38', '0', null, null, '2019-09-28 17:34:15', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1000', '344', '6.63', '92#', '7.13', '6.73', '0', null, null, '2019-09-28 17:34:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1001', '344', '7.15', '95#', '7.65', '7.22', '0', null, null, '2019-09-28 17:34:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1002', '344', '7.87', '98#', '8.37', '7.94', '0', null, null, '2019-09-28 17:34:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1003', '346', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-28 17:34:15', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1004', '346', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-28 17:34:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1005', '346', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-28 17:34:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1006', '346', '7.70', '98#', '8.20', '7.94', '0', null, null, '2019-09-28 17:34:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1007', '348', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-28 17:34:16', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1008', '348', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-28 17:34:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1009', '348', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-28 17:34:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1010', '348', '7.70', '98#', '8.20', '7.94', '0', null, null, '2019-09-28 17:34:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1011', '349', '6.28', '0#', '6.78', '6.38', '0', null, null, '2019-09-28 17:34:16', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1012', '349', '6.63', '92#', '7.13', '6.73', '0', null, null, '2019-09-28 17:34:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1013', '349', '7.15', '95#', '7.65', '7.22', '0', null, null, '2019-09-28 17:34:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1014', '349', '7.87', '98#', '8.37', '7.94', '0', null, null, '2019-09-28 17:34:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1015', '350', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:16', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1016', '350', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1017', '350', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1018', '351', '6.28', '0#', '6.78', '6.38', '0', null, null, '2019-09-28 17:34:16', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1019', '351', '6.63', '92#', '7.13', '6.73', '0', null, null, '2019-09-28 17:34:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1020', '351', '7.15', '95#', '7.65', '7.22', '0', null, null, '2019-09-28 17:34:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1021', '351', '7.87', '98#', '8.37', '7.94', '0', null, null, '2019-09-28 17:34:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1022', '352', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:17', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1023', '352', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1024', '353', '6.28', '0#', '6.78', '6.38', '0', null, null, '2019-09-28 17:34:17', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1025', '353', '6.63', '92#', '7.13', '6.73', '0', null, null, '2019-09-28 17:34:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1026', '353', '7.15', '95#', '7.65', '7.22', '0', null, null, '2019-09-28 17:34:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1027', '353', '7.87', '98#', '8.37', '7.94', '0', null, null, '2019-09-28 17:34:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1028', '354', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:17', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1029', '354', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1030', '355', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-28 17:34:17', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1031', '355', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-28 17:34:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1032', '355', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-28 17:34:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1033', '355', '7.70', '98#', '8.20', '7.94', '0', null, null, '2019-09-28 17:34:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1034', '356', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-28 17:34:18', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1035', '356', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-28 17:34:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1036', '356', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-28 17:34:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1037', '356', '7.70', '98#', '8.20', '7.94', '0', null, null, '2019-09-28 17:34:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1038', '357', '5.57', '0#', '6.07', '6.35', '0', null, null, '2019-09-28 17:34:18', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1039', '357', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1040', '357', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1041', '358', '6.28', '0#', '6.78', '6.38', '0', null, null, '2019-09-28 17:34:18', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1042', '358', '6.63', '92#', '7.13', '6.73', '0', null, null, '2019-09-28 17:34:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1043', '358', '7.15', '95#', '7.65', '7.22', '0', null, null, '2019-09-28 17:34:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1044', '358', '7.87', '98#', '8.37', '7.94', '0', null, null, '2019-09-28 17:34:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1045', '359', '5.57', '0#', '6.07', '6.35', '0', null, null, '2019-09-28 17:34:18', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1046', '359', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1047', '359', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1048', '360', '6.28', '0#', '6.78', '6.38', '0', null, null, '2019-09-28 17:34:19', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1049', '360', '6.63', '92#', '7.13', '6.73', '0', null, null, '2019-09-28 17:34:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1050', '360', '7.15', '95#', '7.65', '7.22', '0', null, null, '2019-09-28 17:34:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1051', '360', '7.87', '98#', '8.37', '7.94', '0', null, null, '2019-09-28 17:34:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1052', '361', '5.47', '0#', '5.97', '6.35', '0', null, null, '2019-09-28 17:34:19', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1053', '361', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1054', '361', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1055', '361', '7.56', '98#', '8.06', '8.04', '0', null, null, '2019-09-28 17:34:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1056', '364', '5.47', '0#', '5.97', '6.35', '0', null, null, '2019-09-28 17:34:19', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1057', '364', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1058', '364', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1059', '365', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:19', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1060', '365', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1061', '365', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1062', '366', '5.47', '0#', '5.97', '6.35', '0', null, null, '2019-09-28 17:34:19', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1063', '366', '6.13', '92#', '6.63', '6.73', '0', null, null, '2019-09-28 17:34:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1064', '366', '6.55', '95#', '7.05', '7.16', '0', null, null, '2019-09-28 17:34:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1065', '367', '5.47', '0#', '5.97', '6.35', '0', null, null, '2019-09-28 17:34:20', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1066', '367', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1067', '367', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1068', '368', '5.47', '0#', '5.97', '6.35', '0', null, null, '2019-09-28 17:34:20', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1069', '368', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1070', '368', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1071', '369', '5.47', '0#', '5.97', '6.35', '0', null, null, '2019-09-28 17:34:20', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1072', '369', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1073', '369', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1074', '369', '7.56', '98#', '8.06', '8.04', '0', null, null, '2019-09-28 17:34:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1075', '370', '5.47', '0#', '5.97', '6.35', '0', null, null, '2019-09-28 17:34:20', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1076', '370', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1077', '370', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1078', '370', '7.56', '98#', '8.06', '8.04', '0', null, null, '2019-09-28 17:34:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1079', '371', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:21', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1080', '371', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1081', '371', '7.56', '98#', '8.06', '8.04', '0', null, null, '2019-09-28 17:34:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1082', '372', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:21', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1083', '372', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1084', '372', '7.56', '98#', '8.06', '8.04', '0', null, null, '2019-09-28 17:34:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1085', '373', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:21', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1086', '373', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1087', '373', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1088', '374', '5.87', '0#', '6.37', '6.35', '0', null, null, '2019-09-28 17:34:21', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1089', '374', '6.25', '92#', '6.75', '6.73', '0', null, null, '2019-09-28 17:34:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1090', '374', '6.68', '95#', '7.18', '7.16', '0', null, null, '2019-09-28 17:34:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1091', '375', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:22', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1092', '375', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1093', '375', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1094', '376', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:22', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1095', '376', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1096', '376', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1097', '377', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:22', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1098', '377', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1099', '377', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1100', '378', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:22', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1101', '378', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1102', '378', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1103', '379', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:23', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1104', '379', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1105', '379', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1106', '380', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:23', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1107', '380', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1108', '380', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1109', '381', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:23', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1110', '381', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1111', '381', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1112', '382', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:23', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1113', '382', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1114', '382', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1115', '385', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:24', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1116', '385', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1117', '385', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1118', '386', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:24', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1119', '386', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1120', '386', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1121', '387', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:24', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1122', '387', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1123', '387', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1124', '387', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1125', '388', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:24', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1126', '388', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1127', '388', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1128', '388', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:34:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1129', '389', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:24', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1130', '389', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1131', '389', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1132', '389', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1133', '391', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:25', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1134', '391', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1135', '391', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1136', '392', '5.47', '0#', '5.97', '6.42', '0', null, null, '2019-09-28 17:34:25', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1137', '392', '6.21', '92#', '6.71', '6.72', '0', null, null, '2019-09-28 17:34:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1138', '392', '6.69', '95#', '7.19', '7.21', '0', null, null, '2019-09-28 17:34:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1139', '393', '5.47', '0#', '5.97', '6.42', '0', null, null, '2019-09-28 17:34:25', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1140', '393', '6.21', '92#', '6.71', '6.72', '0', null, null, '2019-09-28 17:34:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1141', '393', '6.69', '95#', '7.19', '7.21', '0', null, null, '2019-09-28 17:34:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1142', '395', '5.89', '0#', '6.39', '6.42', '0', null, null, '2019-09-28 17:34:25', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1143', '395', '6.21', '92#', '6.71', '6.72', '0', null, null, '2019-09-28 17:34:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1144', '395', '6.69', '95#', '7.19', '7.21', '0', null, null, '2019-09-28 17:34:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1145', '396', '5.30', '0#', '5.80', '6.42', '0', null, null, '2019-09-28 17:34:25', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1146', '396', '6.21', '92#', '6.71', '6.72', '0', null, null, '2019-09-28 17:34:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1147', '396', '6.69', '95#', '7.19', '7.21', '0', null, null, '2019-09-28 17:34:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1148', '397', '5.89', '0#', '6.39', '6.42', '0', null, null, '2019-09-28 17:34:26', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1149', '397', '6.21', '92#', '6.71', '6.72', '0', null, null, '2019-09-28 17:34:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1150', '397', '6.69', '95#', '7.19', '7.21', '0', null, null, '2019-09-28 17:34:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1151', '398', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:26', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1152', '398', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1153', '398', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1154', '399', '5.64', '0#', '6.14', '6.42', '0', null, null, '2019-09-28 17:34:26', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1155', '399', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1156', '399', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1157', '400', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:26', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1158', '400', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1159', '400', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1160', '401', '5.64', '0#', '6.14', '6.42', '0', null, null, '2019-09-28 17:34:27', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1161', '401', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1162', '401', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1163', '403', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:27', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1164', '403', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1165', '403', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1166', '403', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1167', '404', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:27', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1168', '404', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1169', '404', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1170', '404', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1171', '405', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:27', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1172', '405', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1173', '405', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1174', '406', '5.89', '0#', '6.39', '6.42', '0', null, null, '2019-09-28 17:34:28', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1175', '406', '6.21', '92#', '6.71', '6.72', '0', null, null, '2019-09-28 17:34:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1176', '406', '6.69', '95#', '7.19', '7.21', '0', null, null, '2019-09-28 17:34:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1177', '407', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:28', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1178', '407', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1179', '407', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1180', '407', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1181', '409', '5.89', '0#', '6.39', '6.42', '0', null, null, '2019-09-28 17:34:28', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1182', '409', '6.21', '92#', '6.71', '6.72', '0', null, null, '2019-09-28 17:34:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1183', '409', '6.69', '95#', '7.19', '7.21', '0', null, null, '2019-09-28 17:34:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1184', '410', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:28', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1185', '410', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1186', '410', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1187', '410', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1188', '411', '5.89', '0#', '6.39', '6.42', '0', null, null, '2019-09-28 17:34:28', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1189', '411', '6.21', '92#', '6.71', '6.72', '0', null, null, '2019-09-28 17:34:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1190', '411', '6.69', '95#', '7.19', '7.21', '0', null, null, '2019-09-28 17:34:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1191', '412', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:29', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1192', '412', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1193', '412', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1194', '414', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:29', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1195', '414', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1196', '414', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1197', '414', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1198', '416', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:29', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1199', '416', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1200', '416', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1201', '416', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1202', '417', '5.64', '0#', '6.14', '6.42', '0', null, null, '2019-09-28 17:34:30', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1203', '417', '7.42', '92#', '7.92', '6.72', '0', null, null, '2019-09-28 17:34:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1204', '417', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1205', '417', '8.83', '98#', '9.33', '8.04', '0', null, null, '2019-09-28 17:34:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1206', '420', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:30', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1207', '420', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1208', '420', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1209', '421', '5.64', '0#', '6.14', '6.42', '0', null, null, '2019-09-28 17:34:30', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1210', '421', '7.42', '92#', '7.92', '6.72', '0', null, null, '2019-09-28 17:34:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1211', '421', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1212', '421', '8.83', '98#', '9.33', '8.04', '0', null, null, '2019-09-28 17:34:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1213', '422', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:30', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1214', '422', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1215', '422', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1216', '422', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1217', '423', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:31', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1218', '423', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1219', '423', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1220', '423', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1221', '424', '5.89', '0#', '6.39', '6.42', '0', null, null, '2019-09-28 17:34:31', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1222', '424', '6.21', '92#', '6.71', '6.72', '0', null, null, '2019-09-28 17:34:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1223', '424', '6.69', '95#', '7.19', '7.21', '0', null, null, '2019-09-28 17:34:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1224', '425', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:31', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1225', '425', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1226', '425', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1227', '425', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1228', '426', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:31', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1229', '426', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1230', '426', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1231', '427', '5.89', '0#', '6.39', '6.42', '0', null, null, '2019-09-28 17:34:31', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1232', '427', '6.21', '92#', '6.71', '6.72', '0', null, null, '2019-09-28 17:34:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1233', '427', '6.69', '95#', '7.19', '7.21', '0', null, null, '2019-09-28 17:34:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1234', '428', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:32', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1235', '428', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1236', '428', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1237', '429', '5.89', '0#', '6.39', '6.42', '0', null, null, '2019-09-28 17:34:32', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1238', '429', '6.21', '92#', '6.71', '6.72', '0', null, null, '2019-09-28 17:34:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1239', '429', '6.69', '95#', '7.19', '7.21', '0', null, null, '2019-09-28 17:34:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1240', '430', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:32', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1241', '430', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1242', '430', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1243', '431', '5.64', '0#', '6.14', '6.42', '0', null, null, '2019-09-28 17:34:32', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1244', '431', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1245', '431', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1246', '433', '5.89', '0#', '6.39', '6.42', '0', null, null, '2019-09-28 17:34:33', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1247', '433', '6.21', '92#', '6.71', '6.72', '0', null, null, '2019-09-28 17:34:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1248', '433', '6.69', '95#', '7.19', '7.21', '0', null, null, '2019-09-28 17:34:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1249', '435', '5.64', '0#', '6.14', '6.42', '0', null, null, '2019-09-28 17:34:33', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1250', '435', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1251', '435', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1252', '436', '5.89', '0#', '6.39', '6.42', '0', null, null, '2019-09-28 17:34:33', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1253', '436', '6.21', '92#', '6.71', '6.72', '0', null, null, '2019-09-28 17:34:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1254', '436', '6.69', '95#', '7.19', '7.21', '0', null, null, '2019-09-28 17:34:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1255', '437', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:33', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1256', '437', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1257', '437', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1258', '439', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:33', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1259', '439', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1260', '439', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1261', '440', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:34', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1262', '440', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1263', '440', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1264', '444', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:34', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1265', '444', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1266', '444', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1267', '445', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:34', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1268', '445', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1269', '445', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1270', '446', '6.87', '0#', '7.37', '6.42', '0', null, null, '2019-09-28 17:34:34', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1271', '446', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:34:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1272', '446', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1273', '449', '5.39', '0#', '5.89', '6.42', '0', null, null, '2019-09-28 17:34:35', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1274', '449', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1275', '449', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1276', '449', '8.83', '98#', '9.33', '8.04', '0', null, null, '2019-09-28 17:34:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1277', '450', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:35', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1278', '450', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1279', '450', '5.03', '95#', '5.53', '7.22', '0', null, null, '2019-09-28 17:34:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1280', '451', '6.87', '0#', '7.37', '6.42', '0', null, null, '2019-09-28 17:34:35', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1281', '451', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:34:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1282', '451', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1283', '452', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:35', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1284', '452', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1285', '452', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1286', '453', '5.39', '0#', '5.89', '6.42', '0', null, null, '2019-09-28 17:34:36', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1287', '453', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1288', '453', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1289', '453', '8.83', '98#', '9.33', '8.04', '0', null, null, '2019-09-28 17:34:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1290', '454', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:36', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1291', '454', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1292', '454', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1293', '455', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:36', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1294', '455', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1295', '455', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1296', '456', '6.87', '0#', '7.37', '6.42', '0', null, null, '2019-09-28 17:34:36', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1297', '456', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:34:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1298', '456', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1299', '458', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:36', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1300', '458', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1301', '458', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1302', '459', '6.87', '0#', '7.37', '6.42', '0', null, null, '2019-09-28 17:34:37', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1303', '459', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:34:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1304', '459', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1305', '460', '5.64', '0#', '6.14', '6.42', '0', null, null, '2019-09-28 17:34:37', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1306', '460', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:34:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1307', '462', '5.64', '0#', '6.14', '6.42', '0', null, null, '2019-09-28 17:34:37', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1308', '462', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:34:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1309', '463', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:37', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1310', '463', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1311', '463', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1312', '464', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:37', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1313', '464', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1314', '464', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1315', '465', '5.69', '0#', '6.19', '6.42', '0', null, null, '2019-09-28 17:34:38', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1316', '465', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1317', '465', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1318', '466', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:38', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1319', '466', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1320', '466', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1321', '468', '5.69', '0#', '6.19', '6.42', '0', null, null, '2019-09-28 17:34:38', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1322', '468', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1323', '468', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1324', '469', '6.87', '0#', '7.37', '6.42', '0', null, null, '2019-09-28 17:34:38', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1325', '469', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:34:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1326', '469', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1327', '471', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:39', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1328', '471', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1329', '472', '6.87', '0#', '7.37', '6.42', '0', null, null, '2019-09-28 17:34:39', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1330', '472', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:34:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1331', '472', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1332', '473', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:39', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1333', '473', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1334', '474', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:39', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1335', '474', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1336', '474', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1337', '475', '6.87', '0#', '7.37', '6.42', '0', null, null, '2019-09-28 17:34:39', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1338', '475', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:34:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1339', '475', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1340', '476', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1341', '477', '5.32', '0#', '5.82', '6.42', '0', null, null, '2019-09-28 17:34:40', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1342', '477', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:34:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1343', '477', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1344', '479', '5.32', '0#', '5.82', '6.42', '0', null, null, '2019-09-28 17:34:40', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1345', '479', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:34:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1346', '479', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1347', '481', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:40', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1348', '481', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1349', '481', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1350', '482', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:40', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1351', '482', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1352', '482', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1353', '483', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:41', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1354', '483', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1355', '483', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1356', '487', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:41', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1357', '487', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1358', '487', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1359', '488', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:41', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1360', '488', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1361', '488', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1362', '489', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:41', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1363', '489', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1364', '491', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:42', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1365', '491', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1366', '493', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:42', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1367', '493', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1368', '493', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1369', '495', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:42', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1370', '495', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1371', '495', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1372', '496', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:34:42', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1373', '496', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:34:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1374', '496', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:34:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1375', '497', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:34:43', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1376', '497', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1377', '497', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1378', '498', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:34:43', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1379', '498', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1380', '498', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1381', '500', '6.87', '0#', '7.37', '6.42', '0', null, null, '2019-09-28 17:34:43', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1382', '500', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:34:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1383', '500', '7.67', '95#', '8.17', '7.21', '0', null, null, '2019-09-28 17:34:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1384', '500', '8.52', '98#', '9.02', '8.04', '0', null, null, '2019-09-28 17:34:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1385', '502', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:34:43', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1386', '502', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:34:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1387', '502', '7.67', '95#', '8.17', '7.21', '0', null, null, '2019-09-28 17:34:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1388', '502', '8.52', '98#', '9.02', '8.04', '0', null, null, '2019-09-28 17:34:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1389', '503', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:34:44', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1390', '503', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1391', '503', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1392', '504', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1393', '504', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1394', '504', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1395', '506', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:44', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1396', '506', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1397', '506', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1398', '506', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1399', '508', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1400', '508', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1401', '508', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1402', '508', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1403', '509', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:34:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1404', '509', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1405', '509', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1406', '510', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1407', '510', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1408', '510', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1409', '510', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1410', '511', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:34:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1411', '511', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1412', '511', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1413', '512', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:34:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1414', '512', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1415', '512', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1416', '513', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1417', '513', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1418', '513', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1419', '513', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1420', '514', '5.64', '0#', '6.14', '6.42', '0', null, null, '2019-09-28 17:34:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1421', '514', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1422', '514', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1423', '515', '5.64', '0#', '6.14', '6.42', '0', null, null, '2019-09-28 17:34:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1424', '515', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1425', '515', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1426', '516', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:47', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1427', '516', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1428', '516', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1429', '516', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1430', '517', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:47', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1431', '517', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1432', '517', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1433', '517', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1434', '520', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:47', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1435', '520', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1436', '520', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1437', '520', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1438', '521', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1439', '521', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1440', '521', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1441', '521', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1442', '522', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1443', '522', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1444', '522', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1445', '522', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1446', '523', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1447', '523', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1448', '523', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1449', '523', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1450', '524', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1451', '524', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1452', '524', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1453', '525', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1454', '525', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1455', '525', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1456', '525', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1457', '526', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:34:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1458', '526', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:34:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1459', '526', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:34:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1460', '527', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:34:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1461', '527', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:34:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1462', '527', '7.17', '98#', '7.67', '7.94', '0', null, null, '2019-09-28 17:34:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1463', '528', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:34:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1464', '528', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:34:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1465', '528', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:34:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1466', '529', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:34:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1467', '529', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:34:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1468', '529', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:34:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1469', '530', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:34:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1470', '530', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1471', '530', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1472', '531', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:34:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1473', '531', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1474', '531', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1475', '532', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:34:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1476', '532', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1477', '532', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1478', '533', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:34:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1479', '533', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1480', '533', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1481', '534', '5.64', '0#', '6.14', '6.42', '0', null, null, '2019-09-28 17:34:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1482', '534', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1483', '534', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1484', '535', '5.64', '0#', '6.14', '6.42', '0', null, null, '2019-09-28 17:34:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1485', '535', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1486', '535', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1487', '536', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:34:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1488', '536', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1489', '536', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1490', '537', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:34:52', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1491', '537', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1492', '537', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1493', '538', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:34:52', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1494', '538', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1495', '538', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1496', '539', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:34:52', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1497', '539', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1498', '539', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1499', '540', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:34:52', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1500', '540', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1501', '540', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1502', '541', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:34:52', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1503', '541', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1504', '541', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1505', '542', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:34:53', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1506', '542', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1507', '542', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1508', '543', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:34:53', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1509', '543', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:34:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1510', '543', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1511', '546', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:53', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1512', '546', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1513', '546', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1514', '548', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:53', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1515', '548', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1516', '548', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1517', '548', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1518', '549', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1519', '549', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1520', '549', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1521', '550', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1522', '550', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1523', '550', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1524', '550', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1525', '551', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1526', '551', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1527', '551', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1528', '552', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:34:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1529', '552', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:34:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1530', '552', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:34:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1531', '552', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:34:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1532', '553', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1533', '553', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1534', '553', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:34:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1535', '555', '5.30', '0#', '5.80', '6.42', '0', null, null, '2019-09-28 17:34:55', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1536', '555', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1537', '555', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1538', '556', '5.30', '0#', '5.80', '6.42', '0', null, null, '2019-09-28 17:34:55', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1539', '556', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1540', '556', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1541', '557', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:55', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1542', '557', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1543', '557', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1544', '559', '5.32', '0#', '5.82', '6.42', '0', null, null, '2019-09-28 17:34:56', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1545', '559', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:34:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1546', '559', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1547', '560', '5.32', '0#', '5.82', '6.42', '0', null, null, '2019-09-28 17:34:56', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1548', '560', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:34:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1549', '560', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1550', '561', '5.32', '0#', '5.82', '6.42', '0', null, null, '2019-09-28 17:34:56', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1551', '561', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:34:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1552', '561', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1553', '563', '5.32', '0#', '5.82', '6.42', '0', null, null, '2019-09-28 17:34:56', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1554', '563', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:34:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1555', '563', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1556', '564', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1557', '564', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1558', '564', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1559', '565', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:34:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1560', '565', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:34:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1561', '565', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:34:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1562', '566', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:34:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1563', '566', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:34:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1564', '566', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:34:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1565', '567', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1566', '567', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1567', '567', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1568', '568', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1569', '568', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1570', '568', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:34:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1571', '569', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:34:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1572', '569', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:34:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1573', '569', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:34:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1574', '571', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1575', '571', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1576', '572', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:34:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1577', '572', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:34:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1578', '572', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:34:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1579', '572', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:34:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1580', '573', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:34:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1581', '573', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:34:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1582', '573', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:34:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1583', '574', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:34:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1584', '574', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:34:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1585', '575', '6.87', '0#', '7.37', '6.42', '0', null, null, '2019-09-28 17:34:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1586', '575', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:34:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1587', '575', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1588', '576', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:34:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1589', '576', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:34:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1590', '576', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:34:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1591', '577', '6.87', '0#', '7.37', '6.42', '0', null, null, '2019-09-28 17:34:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1592', '577', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:34:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1593', '577', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:34:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1594', '578', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:34:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1595', '578', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1596', '578', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1597', '580', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1598', '580', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1599', '581', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1600', '581', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1601', '581', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1602', '582', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1603', '582', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1604', '582', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1605', '582', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1606', '583', '5.64', '0#', '6.14', '6.42', '0', null, null, '2019-09-28 17:35:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1607', '583', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1608', '583', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1609', '584', '6.87', '0#', '7.37', '6.42', '0', null, null, '2019-09-28 17:35:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1610', '584', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:35:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1611', '584', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1612', '585', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1613', '585', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1614', '585', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1615', '585', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1616', '586', '5.64', '0#', '6.14', '6.42', '0', null, null, '2019-09-28 17:35:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1617', '586', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1618', '586', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1619', '587', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1620', '587', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1621', '587', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1622', '588', '6.87', '0#', '7.37', '6.42', '0', null, null, '2019-09-28 17:35:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1623', '588', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:35:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1624', '588', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1625', '590', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:02', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1626', '590', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1627', '590', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1628', '590', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1629', '591', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:02', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1630', '591', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1631', '591', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1632', '591', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1633', '592', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:02', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1634', '592', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1635', '592', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1636', '592', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1637', '593', '6.87', '0#', '7.37', '6.42', '0', null, null, '2019-09-28 17:35:02', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1638', '593', '6.32', '92#', '6.82', '6.72', '0', null, null, '2019-09-28 17:35:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1639', '593', '6.75', '95#', '7.25', '7.21', '0', null, null, '2019-09-28 17:35:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1640', '595', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:03', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1641', '595', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1642', '595', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1643', '595', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1644', '596', '6.87', '0#', '7.37', '6.42', '0', null, null, '2019-09-28 17:35:03', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1645', '596', '6.32', '92#', '6.82', '6.72', '0', null, null, '2019-09-28 17:35:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1646', '596', '6.75', '95#', '7.25', '7.21', '0', null, null, '2019-09-28 17:35:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1647', '597', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:35:03', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1648', '597', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1649', '597', '7.43', '95#', '7.93', '7.21', '0', null, null, '2019-09-28 17:35:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1650', '598', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:03', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1651', '598', '6.72', '92#', '7.22', '6.73', '0', null, null, '2019-09-28 17:35:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1652', '598', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1653', '598', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1654', '599', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1655', '599', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1656', '599', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1657', '600', '6.87', '0#', '7.37', '6.42', '0', null, null, '2019-09-28 17:35:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1658', '600', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:35:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1659', '600', '7.67', '95#', '8.17', '7.21', '0', null, null, '2019-09-28 17:35:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1660', '601', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:35:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1661', '601', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1662', '601', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1663', '602', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1664', '602', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1665', '602', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1666', '602', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1667', '603', '6.87', '0#', '7.37', '6.42', '0', null, null, '2019-09-28 17:35:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1668', '603', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:35:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1669', '603', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1670', '604', '5.48', '0#', '5.98', '6.42', '0', null, null, '2019-09-28 17:35:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1671', '604', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1672', '605', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1673', '605', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1674', '605', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1675', '605', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1676', '606', '5.48', '0#', '5.98', '6.42', '0', null, null, '2019-09-28 17:35:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1677', '606', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1678', '607', '5.47', '0#', '5.97', '6.42', '0', null, null, '2019-09-28 17:35:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1679', '607', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1680', '607', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1681', '608', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1682', '608', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1683', '608', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1684', '608', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1685', '609', '5.47', '0#', '5.97', '6.42', '0', null, null, '2019-09-28 17:35:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1686', '609', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1687', '609', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1688', '610', '5.64', '0#', '6.14', '6.42', '0', null, null, '2019-09-28 17:35:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1689', '610', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1690', '610', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1691', '611', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1692', '611', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1693', '611', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1694', '611', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1695', '612', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1696', '612', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1697', '612', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1698', '612', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1699', '613', '5.64', '0#', '6.14', '6.42', '0', null, null, '2019-09-28 17:35:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1700', '613', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1701', '613', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1702', '614', '5.47', '0#', '5.97', '6.42', '0', null, null, '2019-09-28 17:35:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1703', '614', '6.46', '92#', '6.96', '6.72', '0', null, null, '2019-09-28 17:35:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1704', '614', '6.97', '95#', '7.47', '7.21', '0', null, null, '2019-09-28 17:35:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1705', '615', '5.47', '0#', '5.97', '6.42', '0', null, null, '2019-09-28 17:35:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1706', '615', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1707', '615', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1708', '616', '5.64', '0#', '6.14', '6.42', '0', null, null, '2019-09-28 17:35:08', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1709', '616', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1710', '616', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1711', '617', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:08', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1712', '617', '6.72', '92#', '7.22', '6.73', '0', null, null, '2019-09-28 17:35:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1713', '617', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1714', '617', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1715', '618', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:08', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1716', '618', '5.88', '92#', '6.38', '6.73', '0', null, null, '2019-09-28 17:35:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1717', '618', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1718', '619', '5.64', '0#', '6.14', '6.42', '0', null, null, '2019-09-28 17:35:08', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1719', '619', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1720', '619', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1721', '620', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:09', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1722', '620', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1723', '620', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1724', '621', '5.69', '0#', '6.19', '6.42', '0', null, null, '2019-09-28 17:35:09', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1725', '621', '6.63', '92#', '7.13', '6.72', '0', null, null, '2019-09-28 17:35:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1726', '621', '7.15', '95#', '7.65', '7.21', '0', null, null, '2019-09-28 17:35:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1727', '622', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:09', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1728', '622', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1729', '622', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1730', '623', '5.69', '0#', '6.19', '6.42', '0', null, null, '2019-09-28 17:35:10', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1731', '623', '6.63', '92#', '7.13', '6.72', '0', null, null, '2019-09-28 17:35:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1732', '623', '7.15', '95#', '7.65', '7.21', '0', null, null, '2019-09-28 17:35:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1733', '624', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:10', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1734', '624', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1735', '624', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1736', '626', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:10', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1737', '626', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1738', '626', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1739', '627', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:10', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1740', '627', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1741', '627', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1742', '627', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1743', '628', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:35:11', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1744', '628', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1745', '628', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1746', '629', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:11', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1747', '629', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1748', '629', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1749', '629', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1750', '630', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:35:11', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1751', '630', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1752', '630', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1753', '631', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1754', '631', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1755', '631', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1756', '632', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:35:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1757', '632', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1758', '633', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1759', '633', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1760', '633', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:35:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1761', '634', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1762', '634', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1763', '634', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1764', '634', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1765', '635', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:35:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1766', '635', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1767', '636', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1768', '636', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1769', '636', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1770', '637', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:35:13', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1771', '637', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1772', '637', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1773', '638', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:13', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1774', '638', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1775', '638', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1776', '638', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1777', '639', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:35:13', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1778', '639', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1779', '639', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1780', '640', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:13', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1781', '640', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1782', '640', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1783', '640', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1784', '641', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:14', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1785', '641', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1786', '641', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1787', '641', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:35:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1788', '642', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:35:14', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1789', '642', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1790', '642', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1791', '643', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:35:14', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1792', '643', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1793', '643', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1794', '644', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:14', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1795', '644', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1796', '644', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1797', '645', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:35:14', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1798', '645', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1799', '645', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1800', '646', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:35:15', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1801', '646', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1802', '646', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1803', '647', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:15', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1804', '647', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1805', '647', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1806', '648', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:35:15', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1807', '648', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1808', '648', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1809', '649', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:35:15', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1810', '649', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:35:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1811', '649', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:35:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1812', '649', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:35:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1813', '650', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:35:16', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1814', '650', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1815', '650', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1816', '651', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:35:16', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1817', '651', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1818', '651', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1819', '652', '5.37', '0#', '5.87', '6.42', '0', null, null, '2019-09-28 17:35:16', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1820', '652', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1821', '652', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1822', '653', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:16', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1823', '653', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1824', '653', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1825', '653', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1826', '654', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:35:17', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1827', '654', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1828', '654', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1829', '655', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:17', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1830', '655', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1831', '655', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1832', '655', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1833', '656', '5.37', '0#', '5.87', '6.42', '0', null, null, '2019-09-28 17:35:17', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1834', '656', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1835', '656', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1836', '657', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:17', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1837', '657', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1838', '657', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1839', '657', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1840', '658', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:18', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1841', '658', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1842', '658', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1843', '659', '5.37', '0#', '5.87', '6.42', '0', null, null, '2019-09-28 17:35:18', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1844', '659', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1845', '659', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1846', '660', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:18', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1847', '660', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1848', '660', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1849', '660', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1850', '661', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1851', '661', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1852', '661', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:35:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1853', '662', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:18', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1854', '662', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1855', '662', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1856', '663', '5.37', '0#', '5.87', '6.42', '0', null, null, '2019-09-28 17:35:19', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1857', '663', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1858', '663', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1859', '664', '5.32', '0#', '5.82', '6.42', '0', null, null, '2019-09-28 17:35:19', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1860', '664', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1861', '664', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1862', '666', '5.32', '0#', '5.82', '6.42', '0', null, null, '2019-09-28 17:35:19', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1863', '666', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1864', '666', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1865', '667', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:19', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1866', '667', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1867', '667', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1868', '668', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:20', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1869', '668', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1870', '668', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1871', '668', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1872', '669', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:20', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1873', '669', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1874', '669', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1875', '669', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1876', '670', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:20', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1877', '670', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1878', '670', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1879', '670', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:35:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1880', '671', '5.32', '0#', '5.82', '6.42', '0', null, null, '2019-09-28 17:35:20', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1881', '671', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1882', '671', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1883', '672', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:21', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1884', '672', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1885', '672', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1886', '672', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1887', '673', '5.32', '0#', '5.82', '6.42', '0', null, null, '2019-09-28 17:35:21', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1888', '673', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1889', '673', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1890', '674', '5.37', '0#', '5.87', '6.42', '0', null, null, '2019-09-28 17:35:21', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1891', '674', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1892', '674', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1893', '675', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:21', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1894', '675', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1895', '675', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1896', '675', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1897', '676', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:22', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1898', '676', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1899', '676', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1900', '677', '5.64', '0#', '6.14', '6.42', '0', null, null, '2019-09-28 17:35:22', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1901', '677', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1902', '677', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1903', '678', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:22', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1904', '678', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1905', '678', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1906', '678', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1907', '679', '5.37', '0#', '5.87', '6.42', '0', null, null, '2019-09-28 17:35:22', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1908', '679', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1909', '679', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1910', '680', '5.64', '0#', '6.14', '6.42', '0', null, null, '2019-09-28 17:35:23', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1911', '680', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1912', '680', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1913', '681', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:23', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1914', '681', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1915', '681', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:35:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1916', '682', '6.87', '0#', '7.37', '6.42', '0', null, null, '2019-09-28 17:35:23', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1917', '682', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-28 17:35:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1918', '682', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1919', '683', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1920', '683', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1921', '683', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:35:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1922', '685', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:24', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1923', '685', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1924', '685', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1925', '685', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1926', '686', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:35:24', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1927', '686', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:35:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1928', '686', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:35:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1929', '688', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:24', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1930', '688', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1931', '688', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1932', '688', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1933', '689', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:35:25', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1934', '689', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:35:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1935', '689', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:35:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1936', '690', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:25', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1937', '690', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1938', '690', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1939', '691', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:25', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1940', '691', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1941', '691', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1942', '691', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1943', '692', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:35:25', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1944', '692', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:35:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1945', '692', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:35:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1946', '692', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:35:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1947', '693', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:26', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1948', '693', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1949', '693', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1950', '693', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1951', '695', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:26', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1952', '695', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1953', '695', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1954', '695', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1955', '696', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:26', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1956', '696', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1957', '696', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1958', '697', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:26', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1959', '697', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1960', '697', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1961', '697', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1962', '698', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:27', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1963', '698', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1964', '698', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1965', '699', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:35:27', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1966', '699', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:35:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1967', '699', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:35:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1968', '700', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:27', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1969', '700', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1970', '700', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1971', '700', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1972', '701', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:35:27', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1973', '701', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:35:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1974', '701', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:35:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1975', '702', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:28', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1976', '702', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1977', '702', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1978', '703', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:28', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1979', '703', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1980', '703', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1981', '703', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1982', '704', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:35:28', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1983', '704', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:35:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1984', '704', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:35:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1985', '705', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:28', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1986', '705', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1987', '705', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1988', '705', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1989', '706', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:35:29', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1990', '706', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:35:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1991', '706', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:35:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1992', '708', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:29', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1993', '708', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1994', '708', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1995', '708', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1996', '709', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:29', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('1997', '709', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1998', '709', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('1999', '710', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:29', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2000', '710', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2001', '710', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2002', '710', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2003', '711', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:30', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2004', '711', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2005', '711', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2006', '711', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2007', '712', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:30', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2008', '712', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2009', '712', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2010', '713', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:30', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2011', '713', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2012', '713', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-28 17:35:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2013', '713', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2014', '714', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:35:30', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2015', '714', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:35:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2016', '714', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:35:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2017', '715', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:31', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2018', '715', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2019', '715', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2020', '717', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:35:31', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2021', '717', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:35:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2022', '717', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:35:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2023', '718', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:35:31', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2024', '718', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:35:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2025', '718', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:35:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2026', '720', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:35:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2027', '720', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:35:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2028', '720', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-28 17:35:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2029', '721', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:32', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2030', '721', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2031', '721', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2032', '724', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2033', '724', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2034', '724', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:35:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2035', '725', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2036', '725', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2037', '725', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:35:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2038', '727', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:32', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2039', '727', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2040', '727', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2041', '737', '5.69', '0#', '6.19', '6.42', '0', null, null, '2019-09-28 17:35:33', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2042', '737', '6.56', '92#', '7.06', '6.72', '0', null, null, '2019-09-28 17:35:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2043', '737', '7.01', '95#', '7.51', '7.21', '0', null, null, '2019-09-28 17:35:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2044', '738', '5.69', '0#', '6.19', '6.42', '0', null, null, '2019-09-28 17:35:33', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2045', '738', '6.56', '92#', '7.06', '6.72', '0', null, null, '2019-09-28 17:35:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2046', '738', '7.01', '95#', '7.51', '7.21', '0', null, null, '2019-09-28 17:35:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2047', '739', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:35:34', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2048', '739', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2049', '739', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2050', '740', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:35:34', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2051', '740', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2052', '740', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2053', '741', '5.47', '0#', '5.97', '6.42', '0', null, null, '2019-09-28 17:35:34', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2054', '741', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2055', '741', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2056', '742', '5.47', '0#', '5.97', '6.42', '0', null, null, '2019-09-28 17:35:34', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2057', '742', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2058', '742', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2059', '743', '5.59', '0#', '6.09', '6.42', '0', null, null, '2019-09-28 17:35:34', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2060', '743', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2061', '743', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2062', '744', '5.59', '0#', '6.09', '6.42', '0', null, null, '2019-09-28 17:35:35', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2063', '744', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2064', '744', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2065', '745', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:35:35', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2066', '745', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2067', '745', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2068', '746', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:35:35', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2069', '746', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2070', '746', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2071', '747', '7.18', '0#', '7.68', '6.42', '0', null, null, '2019-09-28 17:35:35', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2072', '747', '7.43', '92#', '7.93', '6.72', '0', null, null, '2019-09-28 17:35:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2073', '747', '7.99', '95#', '8.49', '7.21', '0', null, null, '2019-09-28 17:35:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2074', '748', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:35:36', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2075', '748', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:35:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2076', '749', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:35:36', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2077', '749', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2078', '749', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2079', '751', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:35:36', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2080', '751', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2081', '751', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2082', '753', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:35:36', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2083', '753', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2084', '753', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2085', '755', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:35:37', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2086', '755', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2087', '755', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2088', '757', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:35:37', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2089', '757', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2090', '757', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2091', '758', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:35:37', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2092', '758', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2093', '758', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2094', '760', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:35:37', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2095', '760', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2096', '760', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2097', '761', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:35:37', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2098', '761', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2099', '761', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2100', '762', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:35:38', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2101', '762', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2102', '762', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2103', '763', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:35:38', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2104', '763', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2105', '763', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2106', '764', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:35:38', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2107', '764', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2108', '765', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:35:38', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2109', '765', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2110', '767', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:35:39', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2111', '767', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2112', '767', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2113', '768', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:35:39', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2114', '768', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2115', '768', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2116', '769', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:35:39', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2117', '769', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2118', '770', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:35:39', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2119', '770', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2120', '772', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:35:39', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2121', '772', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2122', '772', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2123', '773', '6.84', '0#', '7.34', '6.42', '0', null, null, '2019-09-28 17:35:40', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2124', '773', '7.13', '92#', '7.63', '6.72', '0', null, null, '2019-09-28 17:35:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2125', '773', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-28 17:35:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2126', '777', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:40', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2127', '777', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2128', '777', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2129', '778', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:40', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2130', '778', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2131', '778', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2132', '779', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:41', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2133', '779', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2134', '779', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2135', '780', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:41', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2136', '780', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2137', '780', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2138', '781', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:41', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2139', '781', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2140', '781', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2141', '782', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:41', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2142', '782', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2143', '782', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2144', '783', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:41', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2145', '783', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2146', '783', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2147', '784', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:42', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2148', '784', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2149', '784', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2150', '785', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:42', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2151', '785', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2152', '785', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2153', '802', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:43', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2154', '802', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2155', '802', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2156', '803', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:43', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2157', '803', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2158', '803', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2159', '804', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:43', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2160', '804', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2161', '804', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2162', '805', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:43', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2163', '805', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2164', '805', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2165', '805', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:35:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2166', '806', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:43', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2167', '806', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2168', '806', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2169', '807', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:44', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2170', '807', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2171', '807', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2172', '808', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:44', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2173', '808', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2174', '808', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2175', '809', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-28 17:35:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2176', '809', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-28 17:35:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2177', '809', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-28 17:35:44', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2178', '809', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-28 17:35:44', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2179', '810', '5.83', '92#', '6.33', '6.73', '0', null, null, '2019-09-28 17:35:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2180', '810', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-28 17:35:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2181', '810', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-28 17:35:44', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2182', '810', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-28 17:35:44', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2183', '811', '5.73', '92#', '6.23', '6.73', '0', null, null, '2019-09-28 17:35:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2184', '811', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-28 17:35:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2185', '811', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-28 17:35:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2186', '811', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-28 17:35:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2187', '812', '5.32', '92#', '5.82', '6.73', '0', null, null, '2019-09-28 17:35:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2188', '812', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-28 17:35:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2189', '812', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-28 17:35:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2190', '812', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-28 17:35:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2191', '813', '5.52', '92#', '6.02', '6.73', '0', null, null, '2019-09-28 17:35:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2192', '813', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-28 17:35:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2193', '813', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-28 17:35:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2194', '813', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-28 17:35:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2195', '814', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2196', '814', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2197', '814', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2198', '815', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2199', '815', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2200', '815', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2201', '815', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2202', '816', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2203', '816', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2204', '816', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2205', '816', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:35:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2206', '817', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2207', '817', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2208', '817', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2209', '817', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2210', '818', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2211', '818', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2212', '818', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2213', '818', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2214', '820', '5.26', '0#', '5.76', '6.38', '0', null, null, '2019-09-28 17:35:47', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2215', '820', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2216', '820', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2217', '820', '7.84', '98#', '8.34', '7.94', '0', null, null, '2019-09-28 17:35:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2218', '821', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:47', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2219', '821', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2220', '821', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2221', '822', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:47', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2222', '822', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2223', '822', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2224', '824', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2225', '824', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2226', '824', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2227', '824', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2228', '825', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2229', '825', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2230', '825', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2231', '825', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2232', '826', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2233', '826', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2234', '826', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2235', '826', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2236', '827', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2237', '827', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2238', '827', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2239', '828', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2240', '828', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2241', '828', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2242', '828', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2243', '829', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2244', '829', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2245', '830', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2246', '830', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2247', '830', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:35:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2248', '831', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2249', '831', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2250', '831', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2251', '832', '5.61', '0#', '6.11', '6.38', '0', null, null, '2019-09-28 17:35:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2252', '832', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2253', '832', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2254', '832', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2255', '833', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2256', '833', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2257', '834', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2258', '834', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2259', '834', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2260', '834', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2261', '835', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2262', '835', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2263', '835', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2264', '835', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2265', '836', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2266', '836', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2267', '836', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2268', '836', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2269', '837', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-28 17:35:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2270', '837', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-28 17:35:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2271', '837', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-28 17:35:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2272', '837', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-28 17:35:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2273', '839', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2274', '839', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2275', '839', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2276', '840', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2277', '840', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2278', '840', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2279', '840', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:35:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2280', '841', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:52', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2281', '841', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2282', '841', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2283', '847', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:52', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2284', '847', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2285', '847', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2286', '848', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:52', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2287', '848', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2288', '848', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2289', '850', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:52', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2290', '850', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2291', '850', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2292', '851', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:53', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2293', '851', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2294', '851', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2295', '857', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:35:53', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2296', '857', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:35:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2297', '857', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:35:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2298', '860', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:35:53', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2299', '860', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:35:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2300', '862', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:35:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2301', '862', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:35:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2302', '862', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:35:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2303', '865', '4.22', '0#', '4.72', '6.38', '0', null, null, '2019-09-28 17:35:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2304', '865', '5.92', '92#', '6.42', '6.73', '0', null, null, '2019-09-28 17:35:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2305', '865', '6.39', '95#', '6.89', '7.22', '0', null, null, '2019-09-28 17:35:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2306', '866', '4.22', '0#', '4.72', '6.38', '0', null, null, '2019-09-28 17:35:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2307', '866', '5.92', '92#', '6.42', '6.73', '0', null, null, '2019-09-28 17:35:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2308', '866', '6.39', '95#', '6.89', '7.22', '0', null, null, '2019-09-28 17:35:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2309', '874', '4.22', '0#', '4.72', '6.38', '0', null, null, '2019-09-28 17:35:55', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2310', '874', '5.92', '92#', '6.42', '6.73', '0', null, null, '2019-09-28 17:35:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2311', '874', '6.39', '95#', '6.89', '7.22', '0', null, null, '2019-09-28 17:35:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2312', '876', '4.22', '0#', '4.72', '6.38', '0', null, null, '2019-09-28 17:35:55', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2313', '876', '5.92', '92#', '6.42', '6.73', '0', null, null, '2019-09-28 17:35:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2314', '876', '6.39', '95#', '6.89', '7.22', '0', null, null, '2019-09-28 17:35:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2315', '879', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:35:56', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2316', '879', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:35:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2317', '879', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:35:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2318', '880', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:35:56', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2319', '880', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:35:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2320', '880', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-28 17:35:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2321', '887', '6.26', '0#', '6.76', '6.38', '0', null, null, '2019-09-28 17:35:56', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2322', '887', '6.61', '92#', '7.11', '6.73', '0', null, null, '2019-09-28 17:35:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2323', '887', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-28 17:35:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2324', '894', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-28 17:35:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2325', '894', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-28 17:35:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2326', '894', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-28 17:35:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2327', '894', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-28 17:35:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2328', '897', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-28 17:35:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2329', '897', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-28 17:35:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2330', '897', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-28 17:35:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2331', '897', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-28 17:35:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2332', '903', '5.30', '0#', '5.80', '6.42', '0', null, null, '2019-09-28 17:35:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2333', '903', '6.21', '92#', '6.71', '6.72', '0', null, null, '2019-09-28 17:35:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2334', '903', '6.69', '95#', '7.19', '7.21', '0', null, null, '2019-09-28 17:35:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2335', '904', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-28 17:35:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2336', '904', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-28 17:35:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2337', '926', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2338', '926', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2339', '926', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2340', '927', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2341', '927', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2342', '927', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2343', '929', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:35:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2344', '929', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:35:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2345', '929', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:35:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2346', '930', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2347', '930', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2348', '930', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2349', '931', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2350', '931', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2351', '931', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2352', '931', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:36:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2353', '932', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2354', '932', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2355', '932', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2356', '934', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2357', '934', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2358', '934', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2359', '936', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2360', '936', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2361', '936', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2362', '936', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:36:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2363', '938', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2364', '938', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2365', '938', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2366', '943', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2367', '943', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2368', '943', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2369', '944', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2370', '944', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2371', '944', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2372', '944', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:36:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2373', '945', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2374', '945', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2375', '945', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2376', '946', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:02', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2377', '946', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2378', '946', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2379', '946', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:36:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2380', '947', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2381', '947', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2382', '947', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:36:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2383', '948', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:02', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2384', '948', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2385', '948', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2386', '949', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:02', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2387', '949', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2388', '949', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2389', '950', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:03', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2390', '950', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2391', '950', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2392', '951', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:03', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2393', '951', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2394', '951', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2395', '952', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:03', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2396', '952', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2397', '952', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2398', '952', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:36:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2399', '953', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:03', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2400', '953', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2401', '953', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2402', '953', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:36:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2403', '954', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:03', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2404', '954', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2405', '954', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2406', '955', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2407', '955', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2408', '955', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2409', '956', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2410', '956', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2411', '956', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2412', '957', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2413', '957', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2414', '957', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2415', '958', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2416', '958', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2417', '958', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2418', '959', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2419', '959', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2420', '959', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2421', '959', '7.47', '98#', '7.97', '7.94', '0', null, null, '2019-09-28 17:36:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2422', '960', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2423', '960', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2424', '960', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2425', '961', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2426', '961', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2427', '961', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2428', '962', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2429', '962', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2430', '962', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2431', '963', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2432', '963', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2433', '963', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2434', '964', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2435', '964', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2436', '964', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2437', '965', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2438', '965', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2439', '965', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2440', '966', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2441', '966', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2442', '966', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2443', '967', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2444', '967', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2445', '967', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2446', '968', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-28 17:36:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2447', '968', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-28 17:36:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2448', '968', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-28 17:36:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2449', '980', '6.87', '0#', '7.37', '6.42', '0', null, null, '2019-09-29 08:11:44', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2450', '980', '7.15', '92#', '7.65', '6.72', '0', null, null, '2019-09-29 08:11:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2451', '980', '7.66', '95#', '8.16', '7.21', '0', null, null, '2019-09-29 08:11:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2452', '981', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:11:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2453', '981', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:11:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2454', '981', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-29 08:11:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2455', '982', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-29 08:11:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2456', '982', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:11:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2457', '982', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:11:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2458', '982', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-29 08:11:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2459', '983', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-29 08:11:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2460', '983', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:11:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2461', '983', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:11:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2462', '983', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-29 08:11:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2463', '984', '6.26', '0#', '6.76', '6.38', '0', null, null, '2019-09-29 08:11:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2464', '984', '6.61', '92#', '7.11', '6.73', '0', null, null, '2019-09-29 08:11:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2465', '984', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-29 08:11:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2466', '985', '6.26', '0#', '6.76', '6.38', '0', null, null, '2019-09-29 08:11:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2467', '985', '6.61', '92#', '7.11', '6.73', '0', null, null, '2019-09-29 08:11:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2468', '985', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-29 08:11:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2469', '986', '6.26', '0#', '6.76', '6.38', '0', null, null, '2019-09-29 08:11:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2470', '986', '6.61', '92#', '7.11', '6.73', '0', null, null, '2019-09-29 08:11:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2471', '986', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-29 08:11:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2472', '987', '6.26', '0#', '6.76', '6.38', '0', null, null, '2019-09-29 08:11:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2473', '987', '6.61', '92#', '7.11', '6.73', '0', null, null, '2019-09-29 08:11:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2474', '987', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-29 08:11:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2475', '988', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-29 08:11:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2476', '988', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-29 08:11:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2477', '988', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-29 08:11:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2478', '991', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-29 08:11:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2479', '991', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:11:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2480', '991', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:11:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2481', '991', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-29 08:11:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2482', '992', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-29 08:11:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2483', '992', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:11:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2484', '992', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:11:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2485', '992', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-29 08:11:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2486', '993', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-29 08:11:47', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2487', '993', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:11:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2488', '993', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:11:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2489', '993', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-29 08:11:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2490', '994', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-29 08:11:47', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2491', '994', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:11:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2492', '994', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:11:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2493', '994', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-29 08:11:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2494', '995', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-29 08:11:47', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2495', '995', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:11:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2496', '995', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:11:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2497', '995', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-29 08:11:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2498', '996', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-29 08:11:47', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2499', '996', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:11:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2500', '996', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:11:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2501', '996', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-29 08:11:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2502', '997', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-29 08:11:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2503', '997', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:11:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2504', '997', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:11:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2505', '997', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-29 08:11:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2506', '998', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-29 08:11:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2507', '998', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-29 08:11:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2508', '998', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-29 08:11:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2509', '998', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-29 08:11:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2510', '999', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-29 08:11:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2511', '999', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-29 08:11:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2512', '999', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-29 08:11:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2513', '999', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-29 08:11:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2514', '1000', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-29 08:11:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2515', '1000', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:11:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2516', '1000', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:11:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2517', '1001', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-29 08:11:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2518', '1001', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:11:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2519', '1001', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:11:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2520', '1001', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-29 08:11:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2521', '1002', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-29 08:11:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2522', '1002', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:11:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2523', '1002', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:11:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2524', '1002', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-29 08:11:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2525', '1003', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-29 08:11:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2526', '1003', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:11:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2527', '1003', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:11:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2528', '1003', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-29 08:11:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2529', '1004', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:11:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2530', '1004', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:11:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2531', '1004', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:11:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2532', '1004', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:11:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2533', '1005', '5.83', '92#', '6.33', '6.73', '0', null, null, '2019-09-29 08:11:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2534', '1005', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:11:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2535', '1005', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:11:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2536', '1005', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:11:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2537', '1008', '5.83', '92#', '6.33', '6.73', '0', null, null, '2019-09-29 08:11:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2538', '1008', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:11:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2539', '1008', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:11:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2540', '1008', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:11:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2541', '1009', '5.63', '92#', '6.13', '6.73', '0', null, null, '2019-09-29 08:11:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2542', '1009', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:11:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2543', '1009', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:11:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2544', '1009', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:11:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2545', '1010', '5.83', '92#', '6.33', '6.73', '0', null, null, '2019-09-29 08:11:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2546', '1010', '2.84', '95#', '3.34', '7.22', '0', null, null, '2019-09-29 08:11:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2547', '1010', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:11:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2548', '1010', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:11:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2549', '1011', '5.04', '0#', '5.54', '6.38', '0', null, null, '2019-09-29 08:17:40', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2550', '1011', '5.86', '92#', '6.36', '6.73', '0', null, null, '2019-09-29 08:17:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2551', '1011', '6.35', '95#', '6.85', '7.22', '0', null, null, '2019-09-29 08:17:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2552', '1012', '5.83', '92#', '6.33', '6.73', '0', null, null, '2019-09-29 08:17:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2553', '1012', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2554', '1012', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:40', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2555', '1012', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:40', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2556', '1013', '1.19', '92#', '1.69', '6.73', '0', null, null, '2019-09-29 08:17:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2557', '1013', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2558', '1013', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:40', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2559', '1013', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:40', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2560', '1015', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-29 08:17:41', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2561', '1015', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-29 08:17:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2562', '1015', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-29 08:17:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2563', '1016', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-29 08:17:41', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2564', '1016', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-29 08:17:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2565', '1016', '7.71', '98#', '8.21', '7.94', '0', null, null, '2019-09-29 08:17:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2566', '1017', '5.73', '92#', '6.23', '6.73', '0', null, null, '2019-09-29 08:17:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2567', '1017', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2568', '1017', '7.36', '98#', '7.86', '7.94', '0', null, null, '2019-09-29 08:17:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2569', '1017', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:41', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2570', '1017', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:41', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2571', '1018', '5.73', '92#', '6.23', '6.73', '0', null, null, '2019-09-29 08:17:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2572', '1018', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2573', '1018', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:41', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2574', '1018', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:41', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2575', '1019', '5.83', '92#', '6.33', '6.73', '0', null, null, '2019-09-29 08:17:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2576', '1019', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2577', '1019', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:42', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2578', '1019', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:42', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2579', '1020', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2580', '1020', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2581', '1020', '7.36', '98#', '7.86', '7.94', '0', null, null, '2019-09-29 08:17:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2582', '1020', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:42', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2583', '1020', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:42', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2584', '1021', '5.83', '92#', '6.33', '6.73', '0', null, null, '2019-09-29 08:17:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2585', '1021', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2586', '1021', '7.36', '98#', '7.86', '7.94', '0', null, null, '2019-09-29 08:17:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2587', '1021', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:42', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2588', '1021', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:42', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2589', '1022', '5.83', '92#', '6.33', '6.73', '0', null, null, '2019-09-29 08:17:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2590', '1022', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2591', '1022', '7.36', '98#', '7.86', '7.94', '0', null, null, '2019-09-29 08:17:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2592', '1022', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:43', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2593', '1022', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:43', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2594', '1023', '5.73', '92#', '6.23', '6.73', '0', null, null, '2019-09-29 08:17:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2595', '1023', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2596', '1023', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:43', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2597', '1023', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:43', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2598', '1024', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-29 08:17:43', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2599', '1024', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-29 08:17:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2600', '1025', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2601', '1025', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2602', '1025', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:44', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2603', '1025', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:44', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2604', '1026', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2605', '1026', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2606', '1026', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:44', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2607', '1026', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:44', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2608', '1027', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2609', '1027', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2610', '1027', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:44', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2611', '1027', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:44', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2612', '1028', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2613', '1028', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2614', '1028', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2615', '1028', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2616', '1029', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2617', '1029', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2618', '1029', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2619', '1029', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2620', '1030', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2621', '1030', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2622', '1030', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2623', '1030', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2624', '1031', '4.91', '0#', '5.41', '6.38', '0', null, null, '2019-09-29 08:17:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2625', '1031', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2626', '1031', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2627', '1032', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2628', '1032', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2629', '1032', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2630', '1032', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2631', '1033', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2632', '1033', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2633', '1033', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2634', '1033', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2635', '1034', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-29 08:17:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2636', '1034', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-29 08:17:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2637', '1034', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-29 08:17:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2638', '1035', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-29 08:17:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2639', '1035', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-29 08:17:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2640', '1035', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-29 08:17:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2641', '1036', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2642', '1036', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2643', '1036', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:47', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2644', '1036', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:47', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2645', '1037', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2646', '1037', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2647', '1037', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:47', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2648', '1037', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:47', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2649', '1038', '5.84', '0#', '6.34', '6.38', '0', null, null, '2019-09-29 08:17:47', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2650', '1038', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-29 08:17:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2651', '1038', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-29 08:17:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2652', '1039', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2653', '1039', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2654', '1039', '7.36', '98#', '7.86', '7.94', '0', null, null, '2019-09-29 08:17:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2655', '1039', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:47', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2656', '1039', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2657', '1040', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-29 08:17:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2658', '1040', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-29 08:17:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2659', '1040', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-29 08:17:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2660', '1043', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-29 08:17:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2661', '1044', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2662', '1044', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2663', '1044', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2664', '1044', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2665', '1045', '5.52', '92#', '6.02', '6.73', '0', null, null, '2019-09-29 08:17:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2666', '1045', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2667', '1045', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2668', '1045', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2669', '1046', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2670', '1046', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2671', '1046', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2672', '1046', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2673', '1047', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2674', '1047', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2675', '1047', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2676', '1047', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2677', '1048', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2678', '1048', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2679', '1048', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2680', '1048', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2681', '1049', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2682', '1049', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2683', '1049', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2684', '1049', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2685', '1050', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2686', '1050', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2687', '1050', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2688', '1050', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2689', '1051', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2690', '1051', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2691', '1051', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2692', '1051', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2693', '1052', '5.42', '92#', '5.92', '6.73', '0', null, null, '2019-09-29 08:17:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2694', '1052', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2695', '1052', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2696', '1052', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2697', '1053', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2698', '1053', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2699', '1053', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2700', '1053', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2701', '1054', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2702', '1054', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2703', '1054', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2704', '1054', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2705', '1055', '5.63', '92#', '6.13', '6.73', '0', null, null, '2019-09-29 08:17:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2706', '1055', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2707', '1055', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2708', '1055', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2709', '1056', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2710', '1056', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2711', '1056', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2712', '1056', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2713', '1057', '5.73', '92#', '6.23', '6.73', '0', null, null, '2019-09-29 08:17:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2714', '1057', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2715', '1057', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:52', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2716', '1057', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:52', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2717', '1058', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2718', '1058', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2719', '1058', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:52', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2720', '1058', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:52', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2721', '1059', '5.63', '92#', '6.13', '6.73', '0', null, null, '2019-09-29 08:17:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2722', '1059', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2723', '1059', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:52', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2724', '1059', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:52', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2725', '1060', '5.63', '92#', '6.13', '6.73', '0', null, null, '2019-09-29 08:17:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2726', '1060', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2727', '1060', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:52', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2728', '1060', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:53', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2729', '1061', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2730', '1061', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2731', '1061', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:53', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2732', '1061', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:53', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2733', '1062', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2734', '1062', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2735', '1062', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:53', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2736', '1062', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:53', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2737', '1063', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2738', '1063', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2739', '1063', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:53', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2740', '1063', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:53', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2741', '1064', '5.83', '92#', '6.33', '6.73', '0', null, null, '2019-09-29 08:17:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2742', '1064', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2743', '1064', '4.30', '98#', '4.80', '7.94', '0', null, null, '2019-09-29 08:17:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2744', '1064', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2745', '1064', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2746', '1065', '5.63', '92#', '6.13', '6.73', '0', null, null, '2019-09-29 08:17:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2747', '1065', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2748', '1065', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2749', '1065', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2750', '1066', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2751', '1066', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2752', '1066', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2753', '1066', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2754', '1067', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2755', '1067', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2756', '1067', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2757', '1067', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2758', '1068', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2759', '1068', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2760', '1068', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:55', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2761', '1068', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:55', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2762', '1069', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2763', '1069', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2764', '1069', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:55', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2765', '1069', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:55', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2766', '1070', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2767', '1070', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2768', '1070', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:55', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2769', '1070', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:55', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2770', '1071', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2771', '1071', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2772', '1071', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:55', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2773', '1071', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:55', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2774', '1072', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2775', '1072', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2776', '1072', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:56', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2777', '1072', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:56', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2778', '1073', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2779', '1073', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2780', '1073', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:56', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2781', '1073', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:56', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2782', '1074', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2783', '1074', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2784', '1074', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:56', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2785', '1074', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:56', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2786', '1075', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2787', '1075', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2788', '1075', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2789', '1075', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2790', '1076', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2791', '1076', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2792', '1076', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2793', '1076', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2794', '1077', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2795', '1077', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2796', '1077', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2797', '1077', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2798', '1078', '5.04', '0#', '5.54', '6.38', '0', null, null, '2019-09-29 08:17:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2799', '1078', '5.32', '92#', '5.82', '6.73', '0', null, null, '2019-09-29 08:17:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2800', '1078', '6.42', '95#', '6.92', '7.22', '0', null, null, '2019-09-29 08:17:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2801', '1079', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2802', '1079', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2803', '1079', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2804', '1079', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2805', '1080', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2806', '1080', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2807', '1080', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2808', '1080', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2809', '1081', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2810', '1081', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2811', '1081', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2812', '1081', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2813', '1082', '5.11', '0#', '5.61', '6.38', '0', null, null, '2019-09-29 08:17:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2814', '1082', '5.25', '92#', '5.75', '6.73', '0', null, null, '2019-09-29 08:17:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2815', '1082', '6.35', '95#', '6.85', '7.22', '0', null, null, '2019-09-29 08:17:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2816', '1082', '7.56', '98#', '8.06', '7.94', '0', null, null, '2019-09-29 08:17:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2817', '1083', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:17:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2818', '1083', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2819', '1083', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2820', '1083', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2821', '1084', '5.42', '92#', '5.92', '6.73', '0', null, null, '2019-09-29 08:17:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2822', '1084', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:17:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2823', '1084', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2824', '1084', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2825', '1085', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:17:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2826', '1085', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:17:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2827', '1086', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:18:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2828', '1086', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2829', '1086', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2830', '1086', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2831', '1087', '5.42', '92#', '5.92', '6.73', '0', null, null, '2019-09-29 08:18:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2832', '1087', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2833', '1087', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2834', '1087', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2835', '1088', '5.42', '92#', '5.92', '6.73', '0', null, null, '2019-09-29 08:18:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2836', '1088', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2837', '1088', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2838', '1088', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2839', '1089', '5.83', '92#', '6.33', '6.73', '0', null, null, '2019-09-29 08:18:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2840', '1089', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2841', '1089', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2842', '1089', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2843', '1090', '5.83', '92#', '6.33', '6.73', '0', null, null, '2019-09-29 08:18:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2844', '1090', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2845', '1090', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2846', '1090', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2847', '1091', '54.35', '92#', '54.85', '6.73', '0', null, null, '2019-09-29 08:18:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2848', '1091', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2849', '1091', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2850', '1091', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2851', '1092', '5.83', '92#', '6.33', '6.73', '0', null, null, '2019-09-29 08:18:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2852', '1092', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2853', '1092', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2854', '1092', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2855', '1093', '5.83', '92#', '6.33', '6.73', '0', null, null, '2019-09-29 08:18:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2856', '1093', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2857', '1093', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2858', '1093', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2859', '1094', '5.73', '92#', '6.23', '6.73', '0', null, null, '2019-09-29 08:18:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2860', '1094', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2861', '1094', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:02', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2862', '1094', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:02', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2863', '1095', '5.73', '92#', '6.23', '6.73', '0', null, null, '2019-09-29 08:18:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2864', '1095', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2865', '1095', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:02', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2866', '1095', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:02', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2867', '1096', '5.73', '92#', '6.23', '6.73', '0', null, null, '2019-09-29 08:18:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2868', '1096', '6.24', '95#', '6.74', '7.22', '0', null, null, '2019-09-29 08:18:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2869', '1096', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:02', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2870', '1096', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:02', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2871', '1097', '5.83', '92#', '6.33', '6.73', '0', null, null, '2019-09-29 08:18:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2872', '1097', '6.34', '95#', '6.84', '7.22', '0', null, null, '2019-09-29 08:18:02', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2873', '1097', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:03', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2874', '1097', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:03', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2875', '1098', '5.52', '92#', '6.02', '6.73', '0', null, null, '2019-09-29 08:18:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2876', '1098', '6.04', '95#', '6.54', '7.22', '0', null, null, '2019-09-29 08:18:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2877', '1098', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:03', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2878', '1098', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:03', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2879', '1099', '5.52', '92#', '6.02', '6.73', '0', null, null, '2019-09-29 08:18:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2880', '1099', '6.04', '95#', '6.54', '7.22', '0', null, null, '2019-09-29 08:18:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2881', '1099', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:03', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2882', '1099', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:03', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2883', '1100', '5.52', '92#', '6.02', '6.73', '0', null, null, '2019-09-29 08:18:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2884', '1100', '6.04', '95#', '6.54', '7.22', '0', null, null, '2019-09-29 08:18:03', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2885', '1100', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2886', '1100', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2887', '1101', '5.52', '92#', '6.02', '6.73', '0', null, null, '2019-09-29 08:18:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2888', '1101', '6.04', '95#', '6.54', '7.22', '0', null, null, '2019-09-29 08:18:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2889', '1101', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2890', '1101', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2891', '1102', '5.73', '92#', '6.23', '6.73', '0', null, null, '2019-09-29 08:18:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2892', '1102', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2893', '1102', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2894', '1102', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2895', '1103', '5.73', '92#', '6.23', '6.73', '0', null, null, '2019-09-29 08:18:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2896', '1103', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:04', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2897', '1103', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2898', '1103', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:04', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2899', '1104', '5.73', '92#', '6.23', '6.73', '0', null, null, '2019-09-29 08:18:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2900', '1104', '6.24', '95#', '6.74', '7.22', '0', null, null, '2019-09-29 08:18:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2901', '1104', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2902', '1104', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2903', '1105', '5.73', '92#', '6.23', '6.73', '0', null, null, '2019-09-29 08:18:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2904', '1105', '6.24', '95#', '6.74', '7.22', '0', null, null, '2019-09-29 08:18:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2905', '1105', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2906', '1105', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2907', '1106', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:18:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2908', '1106', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2909', '1106', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2910', '1106', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2911', '1108', '4.45', '0#', '4.95', '6.38', '0', null, null, '2019-09-29 08:18:05', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2912', '1108', '6.01', '92#', '6.51', '6.73', '0', null, null, '2019-09-29 08:18:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2913', '1108', '6.49', '95#', '6.99', '7.22', '0', null, null, '2019-09-29 08:18:05', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2914', '1109', '4.45', '0#', '4.95', '6.38', '0', null, null, '2019-09-29 08:18:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2915', '1109', '6.01', '92#', '6.51', '6.73', '0', null, null, '2019-09-29 08:18:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2916', '1109', '6.49', '95#', '6.99', '7.22', '0', null, null, '2019-09-29 08:18:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2917', '1110', '4.45', '0#', '4.95', '6.38', '0', null, null, '2019-09-29 08:18:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2918', '1110', '6.01', '92#', '6.51', '6.73', '0', null, null, '2019-09-29 08:18:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2919', '1110', '6.49', '95#', '6.99', '7.22', '0', null, null, '2019-09-29 08:18:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2920', '1113', '4.60', '-10#', '5.10', '0.00', '0', null, null, '2019-09-29 08:18:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2921', '1113', '4.45', '0#', '4.95', '6.38', '0', null, null, '2019-09-29 08:18:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2922', '1113', '6.01', '92#', '6.51', '6.73', '0', null, null, '2019-09-29 08:18:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2923', '1113', '6.49', '95#', '6.99', '7.22', '0', null, null, '2019-09-29 08:18:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2924', '1115', '4.60', '-10#', '5.10', '0.00', '0', null, null, '2019-09-29 08:18:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2925', '1115', '4.45', '0#', '4.95', '6.38', '0', null, null, '2019-09-29 08:18:06', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2926', '1115', '6.01', '92#', '6.51', '6.73', '0', null, null, '2019-09-29 08:18:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2927', '1115', '6.49', '95#', '6.99', '7.22', '0', null, null, '2019-09-29 08:18:06', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2928', '1116', '4.60', '-10#', '5.10', '0.00', '0', null, null, '2019-09-29 08:18:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2929', '1116', '4.45', '0#', '4.95', '6.38', '0', null, null, '2019-09-29 08:18:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2930', '1116', '6.01', '92#', '6.51', '6.73', '0', null, null, '2019-09-29 08:18:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2931', '1116', '6.49', '95#', '6.99', '7.22', '0', null, null, '2019-09-29 08:18:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2932', '1117', '4.60', '-10#', '5.10', '0.00', '0', null, null, '2019-09-29 08:18:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2933', '1117', '4.45', '0#', '4.95', '6.38', '0', null, null, '2019-09-29 08:18:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2934', '1117', '6.01', '92#', '6.51', '6.73', '0', null, null, '2019-09-29 08:18:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2935', '1117', '6.49', '95#', '6.99', '7.22', '0', null, null, '2019-09-29 08:18:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2936', '1118', '4.60', '-10#', '5.10', '0.00', '0', null, null, '2019-09-29 08:18:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2937', '1118', '4.45', '0#', '4.95', '6.38', '0', null, null, '2019-09-29 08:18:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2938', '1118', '6.01', '92#', '6.51', '6.73', '0', null, null, '2019-09-29 08:18:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2939', '1118', '6.49', '95#', '6.99', '7.22', '0', null, null, '2019-09-29 08:18:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2940', '1119', '4.60', '-10#', '5.10', '0.00', '0', null, null, '2019-09-29 08:18:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2941', '1119', '4.45', '0#', '4.95', '6.38', '0', null, null, '2019-09-29 08:18:07', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2942', '1119', '6.01', '92#', '6.51', '6.73', '0', null, null, '2019-09-29 08:18:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2943', '1119', '6.49', '95#', '6.99', '7.22', '0', null, null, '2019-09-29 08:18:07', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2944', '1120', '4.60', '-10#', '5.10', '0.00', '0', null, null, '2019-09-29 08:18:08', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2945', '1120', '4.45', '0#', '4.95', '6.38', '0', null, null, '2019-09-29 08:18:08', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2946', '1120', '6.01', '92#', '6.51', '6.73', '0', null, null, '2019-09-29 08:18:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2947', '1120', '6.49', '95#', '6.99', '7.22', '0', null, null, '2019-09-29 08:18:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2948', '1122', '4.60', '-10#', '5.10', '0.00', '0', null, null, '2019-09-29 08:18:08', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2949', '1122', '4.45', '0#', '4.95', '6.38', '0', null, null, '2019-09-29 08:18:08', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2950', '1122', '6.01', '92#', '6.51', '6.73', '0', null, null, '2019-09-29 08:18:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2951', '1122', '6.49', '95#', '6.99', '7.22', '0', null, null, '2019-09-29 08:18:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2952', '1125', '4.60', '-10#', '5.10', '0.00', '0', null, null, '2019-09-29 08:18:08', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2953', '1125', '4.45', '0#', '4.95', '6.38', '0', null, null, '2019-09-29 08:18:08', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2954', '1125', '6.01', '92#', '6.51', '6.73', '0', null, null, '2019-09-29 08:18:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2955', '1125', '6.49', '95#', '6.99', '7.22', '0', null, null, '2019-09-29 08:18:08', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2956', '1128', '4.60', '-10#', '5.10', '0.00', '0', null, null, '2019-09-29 08:18:08', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2957', '1128', '4.45', '0#', '4.95', '6.38', '0', null, null, '2019-09-29 08:18:09', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2958', '1128', '6.01', '92#', '6.51', '6.73', '0', null, null, '2019-09-29 08:18:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2959', '1128', '6.49', '95#', '6.99', '7.22', '0', null, null, '2019-09-29 08:18:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2960', '1132', '4.60', '-10#', '5.10', '0.00', '0', null, null, '2019-09-29 08:18:09', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2961', '1132', '4.45', '0#', '4.95', '6.38', '0', null, null, '2019-09-29 08:18:09', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2962', '1132', '6.01', '92#', '6.51', '6.73', '0', null, null, '2019-09-29 08:18:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2963', '1132', '6.49', '95#', '6.99', '7.22', '0', null, null, '2019-09-29 08:18:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2964', '1134', '4.60', '-10#', '5.10', '0.00', '0', null, null, '2019-09-29 08:18:09', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2965', '1134', '4.91', '0#', '5.41', '6.38', '0', null, null, '2019-09-29 08:18:09', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2966', '1134', '6.01', '92#', '6.51', '6.73', '0', null, null, '2019-09-29 08:18:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2967', '1134', '6.49', '95#', '6.99', '7.22', '0', null, null, '2019-09-29 08:18:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2968', '1135', '4.60', '-10#', '5.10', '0.00', '0', null, null, '2019-09-29 08:18:09', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2969', '1135', '5.63', '0#', '6.13', '6.38', '0', null, null, '2019-09-29 08:18:09', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2970', '1135', '5.95', '92#', '6.45', '6.73', '0', null, null, '2019-09-29 08:18:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2971', '1135', '6.49', '95#', '6.99', '7.22', '0', null, null, '2019-09-29 08:18:09', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2972', '1136', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:10', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2973', '1136', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2974', '1136', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2975', '1137', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:10', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2976', '1137', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2977', '1137', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2978', '1138', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:10', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2979', '1138', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2980', '1138', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2981', '1139', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:10', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2982', '1139', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2983', '1139', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:10', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2984', '1140', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:10', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2985', '1140', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2986', '1140', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2987', '1141', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:11', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2988', '1141', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2989', '1141', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2990', '1142', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:11', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2991', '1142', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2992', '1142', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2993', '1143', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:11', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2994', '1143', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2995', '1143', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2996', '1144', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:11', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('2997', '1144', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2998', '1144', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:11', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('2999', '1145', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3000', '1145', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3001', '1145', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3002', '1146', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:18:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3003', '1146', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3004', '1146', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3005', '1146', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3006', '1147', '5.83', '92#', '6.33', '6.73', '0', null, null, '2019-09-29 08:18:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3007', '1147', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3008', '1147', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3009', '1147', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3010', '1148', '5.83', '92#', '6.33', '6.73', '0', null, null, '2019-09-29 08:18:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3011', '1148', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:12', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3012', '1148', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3013', '1148', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:12', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3014', '1149', '5.83', '92#', '6.33', '6.73', '0', null, null, '2019-09-29 08:18:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3015', '1149', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3016', '1149', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:13', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3017', '1149', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:13', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3018', '1154', '5.52', '92#', '6.02', '6.73', '0', null, null, '2019-09-29 08:18:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3019', '1154', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3020', '1154', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:13', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3021', '1154', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:13', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3022', '1155', '5.52', '92#', '6.02', '6.73', '0', null, null, '2019-09-29 08:18:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3023', '1155', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:13', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3024', '1155', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:13', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3025', '1155', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:13', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3026', '1156', '5.52', '92#', '6.02', '6.73', '0', null, null, '2019-09-29 08:18:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3027', '1156', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3028', '1156', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:14', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3029', '1156', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:14', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3030', '1157', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:18:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3031', '1157', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3032', '1157', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:14', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3033', '1157', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:14', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3034', '1159', '5.73', '92#', '6.23', '6.73', '0', null, null, '2019-09-29 08:18:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3035', '1159', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:14', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3036', '1159', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:14', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3037', '1159', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:14', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3038', '1162', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:15', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3039', '1162', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3040', '1162', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3041', '1163', '5.91', '-10#', '6.41', '0.00', '0', null, null, '2019-09-29 08:18:15', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3042', '1163', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:15', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3043', '1163', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3044', '1163', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3045', '1164', '5.91', '-10#', '6.41', '0.00', '0', null, null, '2019-09-29 08:18:15', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3046', '1164', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3047', '1164', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3048', '1165', '5.91', '-10#', '6.41', '0.00', '0', null, null, '2019-09-29 08:18:15', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3049', '1165', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:15', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3050', '1165', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:15', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3051', '1165', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3052', '1166', '5.91', '-10#', '6.41', '0.00', '0', null, null, '2019-09-29 08:18:16', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3053', '1166', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:16', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3054', '1166', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3055', '1166', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3056', '1167', '5.91', '-10#', '6.41', '0.00', '0', null, null, '2019-09-29 08:18:16', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3057', '1167', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3058', '1167', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3059', '1168', '5.91', '-10#', '6.41', '0.00', '0', null, null, '2019-09-29 08:18:16', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3060', '1168', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:16', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3061', '1168', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3062', '1168', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:16', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3063', '1169', '5.91', '-10#', '6.41', '0.00', '0', null, null, '2019-09-29 08:18:16', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3064', '1169', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:17', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3065', '1169', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3066', '1169', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3067', '1171', '5.91', '-10#', '6.41', '0.00', '0', null, null, '2019-09-29 08:18:17', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3068', '1171', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3069', '1171', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3070', '1172', '5.91', '-10#', '6.41', '0.00', '0', null, null, '2019-09-29 08:18:17', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3071', '1172', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:17', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3072', '1172', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3073', '1172', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3074', '1173', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:17', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3075', '1173', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3076', '1173', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:17', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3077', '1174', '5.50', '-10#', '6.00', '0.00', '0', null, null, '2019-09-29 08:18:18', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3078', '1174', '5.35', '92#', '5.85', '6.73', '0', null, null, '2019-09-29 08:18:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3079', '1174', '6.00', '95#', '6.50', '7.22', '0', null, null, '2019-09-29 08:18:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3080', '1175', '5.64', '-10#', '6.14', '0.00', '0', null, null, '2019-09-29 08:18:18', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3081', '1175', '5.63', '0#', '6.13', '6.38', '0', null, null, '2019-09-29 08:18:18', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3082', '1175', '6.07', '92#', '6.57', '6.73', '0', null, null, '2019-09-29 08:18:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3083', '1175', '6.48', '95#', '6.98', '7.22', '0', null, null, '2019-09-29 08:18:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3084', '1176', '5.91', '-10#', '6.41', '0.00', '0', null, null, '2019-09-29 08:18:18', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3085', '1176', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:18', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3086', '1176', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3087', '1176', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3088', '1180', '5.91', '-10#', '6.41', '0.00', '0', null, null, '2019-09-29 08:18:18', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3089', '1180', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:18', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3090', '1180', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3091', '1180', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:18', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3092', '1181', '5.91', '-10#', '6.41', '0.00', '0', null, null, '2019-09-29 08:18:19', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3093', '1181', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:19', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3094', '1181', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3095', '1181', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3096', '1182', '5.91', '-10#', '6.41', '0.00', '0', null, null, '2019-09-29 08:18:19', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3097', '1182', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:19', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3098', '1182', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3099', '1182', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3100', '1183', '5.91', '-10#', '6.41', '0.00', '0', null, null, '2019-09-29 08:18:19', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3101', '1183', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3102', '1183', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3103', '1184', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3104', '1184', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3105', '1184', '7.56', '98#', '8.06', '7.94', '0', null, null, '2019-09-29 08:18:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3106', '1185', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:19', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3107', '1185', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3108', '1186', '5.91', '-10#', '6.41', '0.00', '0', null, null, '2019-09-29 08:18:20', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3109', '1186', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:20', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3110', '1186', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3111', '1186', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3112', '1187', '5.91', '-10#', '6.41', '0.00', '0', null, null, '2019-09-29 08:18:20', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3113', '1187', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:20', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3114', '1187', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3115', '1187', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3116', '1189', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:20', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3117', '1189', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3118', '1189', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:20', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3119', '1190', '6.01', '-10#', '6.51', '0.00', '0', null, null, '2019-09-29 08:18:21', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3120', '1190', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:21', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3121', '1190', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3122', '1190', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3123', '1191', '6.01', '-10#', '6.51', '0.00', '0', null, null, '2019-09-29 08:18:21', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3124', '1191', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:21', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3125', '1191', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3126', '1191', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3127', '1193', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3128', '1193', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3129', '1195', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:21', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3130', '1195', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3131', '1195', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3132', '1196', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3133', '1196', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:21', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3134', '1204', '6.03', '-10#', '6.53', '0.00', '0', null, null, '2019-09-29 08:18:22', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3135', '1204', '4.92', '0#', '5.42', '6.38', '0', null, null, '2019-09-29 08:18:22', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3136', '1204', '6.34', '92#', '6.84', '6.74', '0', null, null, '2019-09-29 08:18:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3137', '1204', '6.73', '95#', '7.23', '7.12', '0', null, null, '2019-09-29 08:18:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3138', '1205', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:22', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3139', '1205', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3140', '1205', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3141', '1206', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:22', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3142', '1206', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3143', '1206', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:22', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3144', '1207', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:22', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3145', '1207', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3146', '1207', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3147', '1208', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:23', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3148', '1208', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3149', '1208', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3150', '1209', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:23', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3151', '1209', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3152', '1209', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3153', '1210', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:23', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3154', '1210', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3155', '1210', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3156', '1211', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:23', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3157', '1211', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3158', '1211', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:23', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3159', '1212', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:24', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3160', '1212', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3161', '1212', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3162', '1213', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:24', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3163', '1213', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3164', '1213', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3165', '1214', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:24', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3166', '1214', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3167', '1214', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3168', '1215', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:24', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3169', '1215', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3170', '1215', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3171', '1216', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:24', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3172', '1216', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:24', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3173', '1216', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3174', '1217', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:25', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3175', '1217', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3176', '1217', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3177', '1218', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:25', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3178', '1218', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3179', '1218', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3180', '1219', '4.74', '0#', '5.24', '6.38', '0', null, null, '2019-09-29 08:18:25', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3181', '1219', '6.55', '92#', '7.05', '6.74', '0', null, null, '2019-09-29 08:18:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3182', '1219', '6.96', '95#', '7.46', '7.12', '0', null, null, '2019-09-29 08:18:25', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3183', '1220', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:26', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3184', '1220', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3185', '1220', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3186', '1221', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:26', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3187', '1221', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3188', '1221', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3189', '1222', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:26', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3190', '1222', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3191', '1222', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3192', '1223', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:26', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3193', '1223', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3194', '1223', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3195', '1224', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:26', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3196', '1224', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3197', '1224', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:26', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3198', '1225', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:27', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3199', '1225', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3200', '1225', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3201', '1226', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:27', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3202', '1226', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3203', '1226', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3204', '1227', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:27', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3205', '1227', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3206', '1227', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3207', '1229', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:27', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3208', '1229', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3209', '1229', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:27', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3210', '1230', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:28', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3211', '1230', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3212', '1230', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3213', '1231', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:28', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3214', '1231', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3215', '1231', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3216', '1232', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:28', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3217', '1232', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3218', '1232', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3219', '1233', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:28', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3220', '1233', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3221', '1233', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:28', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3222', '1234', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:29', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3223', '1234', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3224', '1234', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3225', '1236', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:29', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3226', '1236', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3227', '1236', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3228', '1237', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:29', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3229', '1237', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3230', '1237', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3231', '1238', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:29', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3232', '1238', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3233', '1238', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3234', '1239', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:29', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3235', '1239', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3236', '1239', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:29', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3237', '1240', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:30', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3238', '1240', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3239', '1240', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3240', '1241', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:30', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3241', '1241', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3242', '1241', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3243', '1242', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:30', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3244', '1242', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3245', '1242', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3246', '1243', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:30', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3247', '1243', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3248', '1243', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:30', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3249', '1244', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:31', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3250', '1244', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3251', '1244', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3252', '1245', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:31', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3253', '1245', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3254', '1245', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3255', '1246', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:31', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3256', '1246', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3257', '1246', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3258', '1247', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:31', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3259', '1247', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3260', '1247', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3261', '1248', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:31', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3262', '1248', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:31', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3263', '1248', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3264', '1249', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:32', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3265', '1249', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3266', '1249', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3267', '1250', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:32', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3268', '1250', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3269', '1250', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3270', '1251', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:32', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3271', '1251', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3272', '1251', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3273', '1252', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:32', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3274', '1252', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3275', '1252', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:32', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3276', '1253', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:33', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3277', '1253', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3278', '1253', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3279', '1254', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:33', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3280', '1254', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3281', '1254', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3282', '1255', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:33', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3283', '1255', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3284', '1255', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3285', '1256', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:33', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3286', '1256', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3287', '1256', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3288', '1258', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:33', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3289', '1258', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3290', '1258', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:33', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3291', '1259', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:34', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3292', '1259', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3293', '1259', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3294', '1261', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:34', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3295', '1261', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3296', '1261', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3297', '1262', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:34', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3298', '1262', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3299', '1262', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3300', '1263', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:34', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3301', '1263', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3302', '1263', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3303', '1264', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:34', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3304', '1264', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:34', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3305', '1264', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3306', '1265', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:35', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3307', '1265', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3308', '1265', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3309', '1266', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:35', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3310', '1266', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3311', '1266', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3312', '1267', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:35', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3313', '1267', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3314', '1267', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3315', '1268', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:35', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3316', '1268', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3317', '1268', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3318', '1269', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:35', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3319', '1269', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:35', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3320', '1269', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3321', '1270', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:36', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3322', '1270', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3323', '1270', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3324', '1272', '5.86', '92#', '6.36', '6.73', '0', null, null, '2019-09-29 08:18:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3325', '1272', '6.35', '95#', '6.85', '7.22', '0', null, null, '2019-09-29 08:18:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3326', '1272', '7.56', '98#', '8.06', '7.94', '0', null, null, '2019-09-29 08:18:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3327', '1273', '5.39', '0#', '5.89', '6.35', '0', null, null, '2019-09-29 08:18:36', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3328', '1273', '6.49', '92#', '6.99', '6.76', '0', null, null, '2019-09-29 08:18:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3329', '1273', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-29 08:18:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3330', '1274', '5.39', '0#', '5.89', '6.35', '0', null, null, '2019-09-29 08:18:36', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3331', '1274', '6.27', '92#', '6.77', '6.76', '0', null, null, '2019-09-29 08:18:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3332', '1274', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-29 08:18:36', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3333', '1275', '5.07', '0#', '5.57', '6.35', '0', null, null, '2019-09-29 08:18:37', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3334', '1275', '5.89', '92#', '6.39', '6.76', '0', null, null, '2019-09-29 08:18:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3335', '1275', '6.37', '95#', '6.87', '7.22', '0', null, null, '2019-09-29 08:18:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3336', '1276', '5.07', '0#', '5.57', '6.35', '0', null, null, '2019-09-29 08:18:37', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3337', '1276', '5.89', '92#', '6.39', '6.76', '0', null, null, '2019-09-29 08:18:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3338', '1276', '6.37', '95#', '6.87', '7.22', '0', null, null, '2019-09-29 08:18:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3339', '1277', '5.68', '0#', '6.18', '6.35', '0', null, null, '2019-09-29 08:18:37', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3340', '1277', '6.65', '92#', '7.15', '6.76', '0', null, null, '2019-09-29 08:18:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3341', '1277', '7.14', '95#', '7.64', '7.22', '0', null, null, '2019-09-29 08:18:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3342', '1278', '5.58', '0#', '6.08', '6.35', '0', null, null, '2019-09-29 08:18:37', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3343', '1278', '6.65', '92#', '7.15', '6.76', '0', null, null, '2019-09-29 08:18:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3344', '1278', '7.14', '95#', '7.64', '7.22', '0', null, null, '2019-09-29 08:18:37', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3345', '1279', '4.70', '0#', '5.20', '6.35', '0', null, null, '2019-09-29 08:18:37', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3346', '1279', '5.10', '92#', '5.60', '6.76', '0', null, null, '2019-09-29 08:18:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3347', '1279', '5.80', '95#', '6.30', '7.22', '0', null, null, '2019-09-29 08:18:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3348', '1280', '5.68', '0#', '6.18', '6.35', '0', null, null, '2019-09-29 08:18:38', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3349', '1280', '6.65', '92#', '7.15', '6.76', '0', null, null, '2019-09-29 08:18:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3350', '1280', '7.14', '95#', '7.64', '7.22', '0', null, null, '2019-09-29 08:18:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3351', '1282', '5.31', '0#', '5.81', '6.35', '0', null, null, '2019-09-29 08:18:38', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3352', '1282', '6.45', '92#', '6.95', '6.76', '0', null, null, '2019-09-29 08:18:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3353', '1282', '6.94', '95#', '7.44', '7.22', '0', null, null, '2019-09-29 08:18:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3354', '1283', '4.76', '0#', '5.26', '6.35', '0', null, null, '2019-09-29 08:18:38', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3355', '1283', '5.50', '92#', '6.00', '6.76', '0', null, null, '2019-09-29 08:18:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3356', '1283', '6.37', '95#', '6.87', '7.22', '0', null, null, '2019-09-29 08:18:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3357', '1284', '5.63', '0#', '6.13', '6.35', '0', null, null, '2019-09-29 08:18:38', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3358', '1284', '5.83', '92#', '6.33', '6.76', '0', null, null, '2019-09-29 08:18:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3359', '1284', '6.65', '95#', '7.15', '7.22', '0', null, null, '2019-09-29 08:18:38', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3360', '1285', '5.63', '0#', '6.13', '6.35', '0', null, null, '2019-09-29 08:18:39', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3361', '1285', '5.83', '92#', '6.33', '6.76', '0', null, null, '2019-09-29 08:18:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3362', '1285', '6.65', '95#', '7.15', '7.22', '0', null, null, '2019-09-29 08:18:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3363', '1286', '5.58', '0#', '6.08', '6.35', '0', null, null, '2019-09-29 08:18:39', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3364', '1286', '5.65', '92#', '6.15', '6.76', '0', null, null, '2019-09-29 08:18:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3365', '1286', '6.14', '95#', '6.64', '7.22', '0', null, null, '2019-09-29 08:18:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3366', '1287', '5.30', '0#', '5.80', '6.35', '0', null, null, '2019-09-29 08:18:39', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3367', '1287', '6.45', '92#', '6.95', '6.76', '0', null, null, '2019-09-29 08:18:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3368', '1287', '6.94', '95#', '7.44', '7.22', '0', null, null, '2019-09-29 08:18:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3369', '1288', '5.50', '0#', '6.00', '6.35', '0', null, null, '2019-09-29 08:18:39', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3370', '1288', '6.65', '92#', '7.15', '6.76', '0', null, null, '2019-09-29 08:18:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3371', '1288', '7.14', '95#', '7.64', '7.22', '0', null, null, '2019-09-29 08:18:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3372', '1289', '6.54', '0#', '7.04', '6.35', '0', null, null, '2019-09-29 08:18:39', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3373', '1289', '6.05', '92#', '6.55', '6.76', '0', null, null, '2019-09-29 08:18:39', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3374', '1289', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3375', '1290', '4.90', '0#', '5.40', '6.35', '0', null, null, '2019-09-29 08:18:40', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3376', '1290', '6.05', '92#', '6.55', '6.76', '0', null, null, '2019-09-29 08:18:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3377', '1290', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3378', '1291', '4.90', '0#', '5.40', '6.35', '0', null, null, '2019-09-29 08:18:40', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3379', '1291', '6.00', '92#', '6.50', '6.76', '0', null, null, '2019-09-29 08:18:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3380', '1291', '6.64', '95#', '7.14', '7.22', '0', null, null, '2019-09-29 08:18:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3381', '1293', '5.22', '92#', '5.72', '6.73', '0', null, null, '2019-09-29 08:18:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3382', '1293', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3383', '1293', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:40', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3384', '1293', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:40', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3385', '1294', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-29 08:18:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3386', '1294', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-29 08:18:40', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3387', '1295', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-29 08:18:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3388', '1295', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-29 08:18:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3389', '1296', '5.50', '0#', '6.00', '6.38', '0', null, null, '2019-09-29 08:18:41', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3390', '1296', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-29 08:18:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3391', '1296', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-29 08:18:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3392', '1298', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-29 08:18:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3393', '1298', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-29 08:18:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3394', '1299', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-29 08:18:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3395', '1299', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-29 08:18:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3396', '1300', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-29 08:18:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3397', '1300', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-29 08:18:41', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3398', '1301', '5.73', '92#', '6.23', '6.73', '0', null, null, '2019-09-29 08:18:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3399', '1301', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:42', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3400', '1301', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:42', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3401', '1302', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:42', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3402', '1302', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:42', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3403', '1303', '6.03', '92#', '6.53', '6.73', '0', null, null, '2019-09-29 08:18:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3404', '1303', '6.54', '95#', '7.04', '7.22', '0', null, null, '2019-09-29 08:18:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3405', '1303', '9.61', '0#', '10.11', '6.38', '0', null, null, '2019-09-29 08:18:42', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3406', '1303', '4.56', '-10#', '5.06', '0.00', '0', null, null, '2019-09-29 08:18:42', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3407', '1304', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-29 08:18:42', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3408', '1304', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-29 08:18:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3409', '1304', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-29 08:18:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3410', '1305', '5.11', '0#', '5.61', '6.38', '0', null, null, '2019-09-29 08:18:42', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3411', '1305', '5.55', '92#', '6.05', '6.73', '0', null, null, '2019-09-29 08:18:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3412', '1305', '6.35', '95#', '6.85', '7.22', '0', null, null, '2019-09-29 08:18:42', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3413', '1306', '5.11', '0#', '5.61', '6.38', '0', null, null, '2019-09-29 08:18:43', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3414', '1306', '5.15', '92#', '5.65', '6.73', '0', null, null, '2019-09-29 08:18:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3415', '1306', '6.35', '95#', '6.85', '7.22', '0', null, null, '2019-09-29 08:18:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3416', '1307', '5.11', '0#', '5.61', '6.38', '0', null, null, '2019-09-29 08:18:43', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3417', '1307', '4.85', '92#', '5.35', '6.73', '0', null, null, '2019-09-29 08:18:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3418', '1307', '6.35', '95#', '6.85', '7.22', '0', null, null, '2019-09-29 08:18:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3419', '1309', '6.10', '0#', '6.60', '6.38', '0', null, null, '2019-09-29 08:18:43', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3420', '1309', '6.46', '92#', '6.96', '6.73', '0', null, null, '2019-09-29 08:18:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3421', '1309', '6.97', '95#', '7.47', '7.22', '0', null, null, '2019-09-29 08:18:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3422', '1380', '5.90', '0#', '6.40', '6.38', '0', null, null, '2019-09-29 08:18:43', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3423', '1380', '6.26', '92#', '6.76', '6.73', '0', null, null, '2019-09-29 08:18:43', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3424', '1380', '6.75', '95#', '7.25', '7.22', '0', null, null, '2019-09-29 08:18:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3425', '1381', '6.00', '0#', '6.50', '6.38', '0', null, null, '2019-09-29 08:18:44', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3426', '1381', '6.35', '92#', '6.85', '6.73', '0', null, null, '2019-09-29 08:18:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3427', '1381', '6.84', '95#', '7.34', '7.22', '0', null, null, '2019-09-29 08:18:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3428', '1382', '6.00', '0#', '6.50', '6.38', '0', null, null, '2019-09-29 08:18:44', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3429', '1382', '6.35', '92#', '6.85', '6.73', '0', null, null, '2019-09-29 08:18:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3430', '1382', '6.84', '95#', '7.34', '7.22', '0', null, null, '2019-09-29 08:18:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3431', '1383', '6.00', '0#', '6.50', '6.38', '0', null, null, '2019-09-29 08:18:44', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3432', '1383', '6.35', '92#', '6.85', '6.73', '0', null, null, '2019-09-29 08:18:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3433', '1383', '6.84', '95#', '7.34', '7.22', '0', null, null, '2019-09-29 08:18:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3434', '1384', '6.00', '0#', '6.50', '6.38', '0', null, null, '2019-09-29 08:18:44', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3435', '1384', '6.35', '92#', '6.85', '6.73', '0', null, null, '2019-09-29 08:18:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3436', '1384', '6.84', '95#', '7.34', '7.22', '0', null, null, '2019-09-29 08:18:44', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3437', '1385', '5.11', '0#', '5.61', '6.38', '0', null, null, '2019-09-29 08:18:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3438', '1385', '5.25', '92#', '5.75', '6.73', '0', null, null, '2019-09-29 08:18:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3439', '1385', '6.35', '95#', '6.85', '7.22', '0', null, null, '2019-09-29 08:18:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3440', '1386', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3441', '1386', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3442', '1386', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3443', '1387', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3444', '1387', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3445', '1387', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3446', '1388', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3447', '1388', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3448', '1388', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3449', '1389', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:45', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3450', '1389', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:45', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3451', '1389', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3452', '1390', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3453', '1390', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3454', '1390', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3455', '1391', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3456', '1391', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3457', '1391', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3458', '1392', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3459', '1392', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3460', '1392', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3461', '1393', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:46', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3462', '1393', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3463', '1393', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3464', '1393', '7.78', '98#', '8.28', '7.94', '0', null, null, '2019-09-29 08:18:46', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3465', '1394', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3466', '1394', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3467', '1394', '7.78', '98#', '8.28', '7.94', '0', null, null, '2019-09-29 08:18:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3468', '1395', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3469', '1395', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3470', '1395', '7.78', '98#', '8.28', '7.94', '0', null, null, '2019-09-29 08:18:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3471', '1396', '6.65', '-10#', '7.15', '0.00', '0', null, null, '2019-09-29 08:18:47', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3472', '1396', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:47', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3473', '1396', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3474', '1396', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3475', '1397', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:47', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3476', '1397', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3477', '1397', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3478', '1398', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:47', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3479', '1398', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3480', '1398', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:47', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3481', '1398', '7.78', '98#', '8.28', '7.94', '0', null, null, '2019-09-29 08:18:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3482', '1399', '6.65', '-10#', '7.15', '0.00', '0', null, null, '2019-09-29 08:18:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3483', '1399', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3484', '1399', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3485', '1399', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3486', '1400', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3487', '1400', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3488', '1400', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3489', '1400', '7.78', '98#', '8.28', '7.94', '0', null, null, '2019-09-29 08:18:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3490', '1401', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3491', '1401', '6.47', '92#', '6.97', '6.73', '0', null, null, '2019-09-29 08:18:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3492', '1401', '6.98', '95#', '7.48', '7.22', '0', null, null, '2019-09-29 08:18:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3493', '1404', '5.78', '0#', '6.28', '6.38', '0', null, null, '2019-09-29 08:18:48', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3494', '1404', '6.33', '92#', '6.83', '6.73', '0', null, null, '2019-09-29 08:18:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3495', '1404', '6.85', '95#', '7.35', '7.22', '0', null, null, '2019-09-29 08:18:48', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3496', '1404', '6.85', '98#', '7.35', '7.94', '0', null, null, '2019-09-29 08:18:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3497', '1405', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:18:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3498', '1405', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:18:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3499', '1406', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:18:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3500', '1406', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:18:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3501', '1406', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-29 08:18:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3502', '1407', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-29 08:18:49', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3503', '1407', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:18:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3504', '1407', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:18:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3505', '1408', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:18:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3506', '1408', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:18:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3507', '1408', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-29 08:18:49', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3508', '1409', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-29 08:18:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3509', '1409', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:18:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3510', '1409', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:18:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3511', '1409', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-29 08:18:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3512', '1410', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-29 08:18:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3513', '1410', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:18:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3514', '1410', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:18:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3515', '1410', '7.44', '98#', '7.94', '7.94', '0', null, null, '2019-09-29 08:18:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3516', '1411', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-29 08:18:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3517', '1411', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:18:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3518', '1411', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:18:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3519', '1412', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-29 08:18:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3520', '1412', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:18:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3521', '1412', '6.72', '95#', '7.22', '7.22', '0', null, null, '2019-09-29 08:18:50', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3522', '1413', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-29 08:18:50', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3523', '1413', '6.23', '92#', '6.73', '6.73', '0', null, null, '2019-09-29 08:18:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3524', '1415', '6.26', '0#', '6.76', '6.38', '0', null, null, '2019-09-29 08:18:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3525', '1415', '6.61', '92#', '7.11', '6.73', '0', null, null, '2019-09-29 08:18:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3526', '1415', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-29 08:18:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3527', '1416', '6.26', '0#', '6.76', '6.38', '0', null, null, '2019-09-29 08:18:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3528', '1416', '6.61', '92#', '7.11', '6.73', '0', null, null, '2019-09-29 08:18:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3529', '1416', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-29 08:18:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3530', '1417', '6.26', '0#', '6.76', '6.38', '0', null, null, '2019-09-29 08:18:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3531', '1417', '6.61', '92#', '7.11', '6.73', '0', null, null, '2019-09-29 08:18:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3532', '1417', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-29 08:18:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3533', '1417', '7.70', '98#', '8.20', '7.94', '0', null, null, '2019-09-29 08:18:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3534', '1418', '6.26', '0#', '6.76', '6.38', '0', null, null, '2019-09-29 08:18:51', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3535', '1418', '6.61', '92#', '7.11', '6.73', '0', null, null, '2019-09-29 08:18:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3536', '1418', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-29 08:18:51', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3537', '1418', '7.70', '98#', '8.20', '7.94', '0', null, null, '2019-09-29 08:18:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3538', '1419', '6.26', '0#', '6.76', '6.38', '0', null, null, '2019-09-29 08:18:52', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3539', '1419', '6.61', '92#', '7.11', '6.73', '0', null, null, '2019-09-29 08:18:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3540', '1419', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-29 08:18:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3541', '1420', '6.26', '0#', '6.76', '6.38', '0', null, null, '2019-09-29 08:18:52', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3542', '1420', '6.61', '92#', '7.11', '6.73', '0', null, null, '2019-09-29 08:18:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3543', '1420', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-29 08:18:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3544', '1421', '5.55', '92#', '6.05', '6.73', '0', null, null, '2019-09-29 08:18:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3545', '1421', '6.35', '95#', '6.85', '7.22', '0', null, null, '2019-09-29 08:18:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3546', '1422', '5.91', '-10#', '6.41', '0.00', '0', null, null, '2019-09-29 08:18:52', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3547', '1422', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:52', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3548', '1422', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:52', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3549', '1422', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3550', '1423', '4.74', '0#', '5.24', '6.38', '0', null, null, '2019-09-29 08:18:53', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3551', '1423', '6.48', '92#', '6.98', '6.74', '0', null, null, '2019-09-29 08:18:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3552', '1423', '6.88', '95#', '7.38', '7.12', '0', null, null, '2019-09-29 08:18:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3553', '1424', '5.63', '0#', '6.13', '6.38', '0', null, null, '2019-09-29 08:18:53', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3554', '1424', '6.48', '92#', '6.98', '6.74', '0', null, null, '2019-09-29 08:18:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3555', '1424', '6.88', '95#', '7.38', '7.12', '0', null, null, '2019-09-29 08:18:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3556', '1425', '5.20', '0#', '5.70', '6.38', '0', null, null, '2019-09-29 08:18:53', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3557', '1425', '6.27', '92#', '6.77', '6.74', '0', null, null, '2019-09-29 08:18:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3558', '1425', '6.66', '95#', '7.16', '7.12', '0', null, null, '2019-09-29 08:18:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3559', '1426', '6.61', '92#', '7.11', '6.73', '0', null, null, '2019-09-29 08:18:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3560', '1426', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-29 08:18:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3561', '1427', '6.53', '-10#', '7.03', '0.00', '0', null, null, '2019-09-29 08:18:53', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3562', '1427', '4.74', '0#', '5.24', '6.38', '0', null, null, '2019-09-29 08:18:53', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3563', '1427', '6.48', '92#', '6.98', '6.74', '0', null, null, '2019-09-29 08:18:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3564', '1427', '6.88', '95#', '7.38', '7.12', '0', null, null, '2019-09-29 08:18:53', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3565', '1428', '6.61', '92#', '7.11', '6.73', '0', null, null, '2019-09-29 08:18:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3566', '1428', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-29 08:18:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3567', '1429', '4.74', '0#', '5.24', '6.38', '0', null, null, '2019-09-29 08:18:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3568', '1429', '6.48', '92#', '6.98', '6.74', '0', null, null, '2019-09-29 08:18:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3569', '1429', '6.88', '95#', '7.38', '7.12', '0', null, null, '2019-09-29 08:18:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3570', '1430', '4.74', '0#', '5.24', '6.38', '0', null, null, '2019-09-29 08:18:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3571', '1430', '6.48', '92#', '6.98', '6.74', '0', null, null, '2019-09-29 08:18:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3572', '1430', '6.88', '95#', '7.38', '7.12', '0', null, null, '2019-09-29 08:18:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3573', '1431', '4.74', '0#', '5.24', '6.38', '0', null, null, '2019-09-29 08:18:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3574', '1431', '6.34', '92#', '6.84', '6.74', '0', null, null, '2019-09-29 08:18:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3575', '1431', '6.73', '95#', '7.23', '7.12', '0', null, null, '2019-09-29 08:18:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3576', '1432', '4.74', '0#', '5.24', '6.38', '0', null, null, '2019-09-29 08:18:54', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3577', '1432', '6.48', '92#', '6.98', '6.74', '0', null, null, '2019-09-29 08:18:54', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3578', '1432', '6.88', '95#', '7.38', '7.12', '0', null, null, '2019-09-29 08:18:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3579', '1433', '4.74', '0#', '5.24', '6.38', '0', null, null, '2019-09-29 08:18:55', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3580', '1433', '6.48', '92#', '6.98', '6.74', '0', null, null, '2019-09-29 08:18:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3581', '1433', '6.88', '95#', '7.38', '7.12', '0', null, null, '2019-09-29 08:18:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3582', '1433', '7.68', '98#', '8.18', '7.94', '0', null, null, '2019-09-29 08:18:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3583', '1434', '6.13', '0#', '6.63', '6.38', '0', null, null, '2019-09-29 08:18:55', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3584', '1434', '6.48', '92#', '6.98', '6.74', '0', null, null, '2019-09-29 08:18:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3585', '1434', '6.88', '95#', '7.38', '7.12', '0', null, null, '2019-09-29 08:18:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3586', '1434', '7.78', '98#', '8.28', '7.94', '0', null, null, '2019-09-29 08:18:55', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3587', '1435', '5.81', '0#', '6.31', '6.37', '0', null, null, '2019-09-29 08:18:55', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3588', '1455', '6.28', '0#', '6.78', '6.38', '0', null, null, '2019-09-29 08:18:56', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3589', '1455', '6.63', '92#', '7.13', '6.73', '0', null, null, '2019-09-29 08:18:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3590', '1455', '7.15', '95#', '7.65', '7.22', '0', null, null, '2019-09-29 08:18:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3591', '1455', '7.87', '98#', '8.37', '7.94', '0', null, null, '2019-09-29 08:18:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3592', '1456', '5.60', '0#', '6.10', '6.29', '0', null, null, '2019-09-29 08:18:56', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3593', '1457', '5.60', '0#', '6.10', '6.29', '0', null, null, '2019-09-29 08:18:56', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3594', '1463', '7.08', '95#', '7.58', '7.22', '0', null, null, '2019-09-29 08:18:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3595', '1463', '7.80', '98#', '8.30', '7.94', '0', null, null, '2019-09-29 08:18:56', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3596', '1464', '5.64', '0#', '6.14', '6.38', '0', null, null, '2019-09-29 08:18:56', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3597', '1464', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-29 08:18:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3598', '1465', '5.66', '0#', '6.16', '6.38', '0', null, null, '2019-09-29 08:18:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3599', '1465', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-29 08:18:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3600', '1466', '5.71', '0#', '6.21', '6.38', '0', null, null, '2019-09-29 08:18:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3601', '1466', '7.07', '95#', '7.57', '7.22', '0', null, null, '2019-09-29 08:18:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3602', '1467', '6.22', '0#', '6.72', '6.38', '0', null, null, '2019-09-29 08:18:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3603', '1467', '7.08', '95#', '7.58', '7.22', '0', null, null, '2019-09-29 08:18:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3604', '1467', '7.80', '98#', '8.30', '7.94', '0', null, null, '2019-09-29 08:18:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3605', '1468', '5.86', '0#', '6.36', '6.38', '0', null, null, '2019-09-29 08:18:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3606', '1468', '7.12', '95#', '7.62', '7.22', '0', null, null, '2019-09-29 08:18:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3607', '1468', '7.84', '98#', '8.34', '7.94', '0', null, null, '2019-09-29 08:18:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3608', '1469', '4.74', '0#', '5.24', '6.38', '0', null, null, '2019-09-29 08:18:57', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3609', '1469', '6.00', '92#', '6.50', '6.74', '0', null, null, '2019-09-29 08:18:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3610', '1469', '6.49', '95#', '6.99', '7.12', '0', null, null, '2019-09-29 08:18:57', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3611', '1470', '5.84', '92#', '6.34', '6.74', '0', null, null, '2019-09-29 08:18:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3612', '1471', '5.79', '92#', '6.29', '6.74', '0', null, null, '2019-09-29 08:18:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3613', '1472', '5.78', '0#', '6.28', '6.38', '0', null, null, '2019-09-29 08:18:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3614', '1472', '6.14', '92#', '6.64', '6.74', '0', null, null, '2019-09-29 08:18:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3615', '1472', '6.52', '95#', '7.02', '7.12', '0', null, null, '2019-09-29 08:18:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3616', '1473', '5.88', '0#', '6.38', '6.38', '0', null, null, '2019-09-29 08:18:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3617', '1473', '6.19', '92#', '6.69', '6.74', '0', null, null, '2019-09-29 08:18:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3618', '1473', '6.62', '95#', '7.12', '7.12', '0', null, null, '2019-09-29 08:18:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3619', '1474', '5.21', '0#', '5.71', '6.38', '0', null, null, '2019-09-29 08:18:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3620', '1474', '5.56', '92#', '6.06', '6.73', '0', null, null, '2019-09-29 08:18:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3621', '1474', '6.05', '95#', '6.55', '7.22', '0', null, null, '2019-09-29 08:18:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3622', '1475', '5.21', '0#', '5.71', '6.38', '0', null, null, '2019-09-29 08:18:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3623', '1475', '5.56', '92#', '6.06', '6.73', '0', null, null, '2019-09-29 08:18:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3624', '1476', '5.11', '0#', '5.61', '6.38', '0', null, null, '2019-09-29 08:18:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3625', '1476', '5.25', '92#', '5.75', '6.73', '0', null, null, '2019-09-29 08:18:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3626', '1476', '6.35', '95#', '6.85', '7.22', '0', null, null, '2019-09-29 08:18:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3627', '1476', '7.67', '98#', '8.17', '7.94', '0', null, null, '2019-09-29 08:18:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3628', '1478', '5.18', '0#', '5.68', '6.38', '0', null, null, '2019-09-29 08:18:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3629', '1478', '6.17', '92#', '6.67', '6.73', '0', null, null, '2019-09-29 08:18:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3630', '1478', '6.57', '95#', '7.07', '7.22', '0', null, null, '2019-09-29 08:18:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3631', '1496', '5.75', '0#', '6.25', '6.48', '0', null, null, '2019-09-29 08:18:59', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3632', '1496', '5.95', '92#', '6.45', '6.79', '0', null, null, '2019-09-29 08:18:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3633', '1496', '6.47', '95#', '6.97', '7.31', '0', null, null, '2019-09-29 08:18:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3634', '1496', '7.70', '98#', '8.20', '7.96', '0', null, null, '2019-09-29 08:18:59', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3635', '1586', '5.75', '0#', '6.25', '6.48', '0', null, null, '2019-09-29 08:19:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3636', '1586', '5.95', '92#', '6.45', '6.79', '0', null, null, '2019-09-29 08:19:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3637', '1586', '6.47', '95#', '6.97', '7.31', '0', null, null, '2019-09-29 08:19:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3638', '1807', '5.75', '0#', '6.25', '6.48', '0', null, null, '2019-09-29 08:19:00', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3639', '1807', '5.95', '92#', '6.45', '6.79', '0', null, null, '2019-09-29 08:19:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3640', '1807', '6.47', '95#', '6.97', '7.31', '0', null, null, '2019-09-29 08:19:00', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3641', '5000', '4.80', '-10#', '5.30', '0.00', '0', null, null, '2019-09-29 08:19:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3642', '5000', '4.50', '0#', '5.00', '6.38', '0', null, null, '2019-09-29 08:19:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3643', '5000', '6.16', '92#', '6.66', '6.73', '0', null, null, '2019-09-29 08:19:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3644', '5000', '5.53', '95#', '6.03', '7.22', '0', null, null, '2019-09-29 08:19:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3645', '5001', '4.75', '0#', '5.25', '6.38', '0', null, null, '2019-09-29 08:19:01', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3646', '5001', '5.53', '95#', '6.03', '7.22', '0', null, null, '2019-09-29 08:19:01', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3647', '5002', '5.51', '92#', '6.01', '6.78', '0', null, null, '2019-09-29 08:25:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3648', '5002', '4.50', '95#', '5.00', '7.21', '0', null, null, '2019-09-29 08:25:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3649', '5003', '5.50', '92#', '6.00', '6.78', '0', null, null, '2019-09-29 08:25:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3650', '5003', '1.50', '95#', '2.00', '7.21', '0', null, null, '2019-09-29 08:25:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3651', '5004', '7.25', '95#', '7.75', '7.22', '0', null, null, '2019-09-29 08:25:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3652', '5005', '3.05', '0#', '3.55', '8.19', '0', null, null, '2019-09-29 08:25:58', '0', '0', '0.00');
INSERT INTO zsys_oil_number VALUES ('3653', '5005', '7.39', '92#', '7.89', '6.78', '0', null, null, '2019-09-29 08:25:58', '0', '1', '0.00');
INSERT INTO zsys_oil_number VALUES ('3654', '5005', '8.39', '95#', '8.89', '7.21', '0', null, null, '2019-09-29 08:25:58', '0', '1', '0.00');

-- ----------------------------
-- Table structure for `zsys_oil_price_log`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_oil_price_log`;
CREATE TABLE `zsys_oil_price_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `station_id` int(11) NOT NULL COMMENT '关联油站id',
  `oilnumber_id` int(11) NOT NULL COMMENT '关联油号id',
  `updatetime` datetime NOT NULL COMMENT '修改时间',
  `oldmoney` decimal(10,2) NOT NULL COMMENT '原价格(熊猫油价)',
  `newmoney` decimal(10,2) NOT NULL COMMENT '修改价格(熊猫油价)',
  `gasstation_oldmoney` decimal(10,2) NOT NULL COMMENT '原价格（油站油价）',
  `gasstation_newmoney` decimal(10,2) NOT NULL COMMENT '修改价格（油站油价）',
  `market_oldmoney` decimal(10,2) NOT NULL COMMENT '原价格（市场油价）',
  `market_newmoney` decimal(10,2) NOT NULL COMMENT '修改价格（市场油价）',
  `effective_time` datetime NOT NULL COMMENT '生效时间',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='油价变动log表';

-- ----------------------------
-- Records of zsys_oil_price_log
-- ----------------------------

-- ----------------------------
-- Table structure for `zsys_oil_station`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_oil_station`;
CREATE TABLE `zsys_oil_station` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `station_fullname` varchar(50) DEFAULT NULL COMMENT '加油站全称',
  `station_name` varchar(50) NOT NULL COMMENT '加油站名称',
  `station_address` varchar(255) NOT NULL COMMENT '加油站详细地址',
  `station_logo` varchar(255) NOT NULL COMMENT '加油站logo',
  `logo_id` int(11) DEFAULT NULL COMMENT 'logo_id',
  `station_tel` varchar(20) DEFAULT NULL COMMENT '加油站联系方式',
  `del_flg` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已经删除（0：未删除，1：已删除）',
  `list_order` int(11) DEFAULT '0',
  `remark` varchar(1024) DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `station_lng` varchar(20) NOT NULL COMMENT '加油站坐标经度',
  `station_lat` varchar(20) NOT NULL COMMENT '加油站坐标纬度',
  `province_code` varchar(20) DEFAULT NULL COMMENT '所属省份代码',
  `province_name` varchar(50) DEFAULT NULL COMMENT '所属省份名称',
  `city_code` varchar(20) DEFAULT NULL COMMENT '所属城市代码',
  `city_name` varchar(50) DEFAULT NULL COMMENT '所属城市名称',
  `country_code` varchar(20) DEFAULT NULL COMMENT '所属区代码',
  `country_name` varchar(50) DEFAULT NULL COMMENT '所属区名称',
  `on_way` smallint(1) NOT NULL DEFAULT '0' COMMENT '高速公路标识(0：否，1：是)',
  `brand` varchar(50) DEFAULT NULL COMMENT '所属品牌',
  `road_no` varchar(11) DEFAULT NULL COMMENT '道路编号',
  `road_name` varchar(50) DEFAULT NULL COMMENT '道路名称',
  `merchant_id` varchar(20) NOT NULL COMMENT '油站商户号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5009 DEFAULT CHARSET=utf8mb4 COMMENT='加油站表';

-- ----------------------------
-- Records of zsys_oil_station
-- ----------------------------
INSERT INTO zsys_oil_station VALUES ('23', '梁平服务区东区加油站', '梁平服务区东区加油站', '梁平区梁山街道办事处东明村4组（G42沪蓉高速K1551东侧 重庆方向）', '', '1', '15723579811', '0', '23', null, null, '2019-09-28 17:32:04', '1', '107.823269', '30.678122', '500000', '重庆市', '500200', '县', '500228', '梁平县', '1', '中石油', 'G42', '沪蓉高速', '50022800001');
INSERT INTO zsys_oil_station VALUES ('25', '梁平服务区西区加油站', '梁平服务区西区加油站', '梁平区梁山街道办事处东明村4组（G42沪蓉高速K1551西侧）', '', '1', '13996567106', '0', '25', null, null, '2019-09-28 17:32:04', '1', '107.825172', '30.678216', '500000', '重庆市', '500200', '县', '500228', '梁平县', '1', '中石油', 'G42', '沪蓉高速', '50022800001');
INSERT INTO zsys_oil_station VALUES ('26', '垫江服务区东区加油站', '垫江服务区东区加油站', '重庆市垫江县太平镇天星村（渝宜高速116.5MK处 重庆方向）', '', '1', '18223677611', '0', '26', null, null, '2019-09-28 17:32:05', '1', '107.316862', '30.250273', '500000', '重庆市', '500200', '县', '500231', '垫江县', '1', '中石油', 'G42', '沪蓉高速', '50023100001');
INSERT INTO zsys_oil_station VALUES ('27', '垫江服务区西区加油站', '垫江服务区西区加油站', '重庆市垫江县太平镇天星村（渝宜高速116.5MK处 上海方向）', '', '1', '13068367696', '0', '27', null, null, '2019-09-28 17:32:05', '1', '107.317921', '30.250184', '500000', '重庆市', '500200', '县', '500231', '垫江县', '1', '中石油', 'G42', '沪蓉高速', '50023100001');
INSERT INTO zsys_oil_station VALUES ('28', '綦江服务区东区加油站', '綦江服务区东区加油站', '重庆市綦江区新盛镇号房村（渝黔高速K34公里东侧 重庆方向）', '', '1', '17623208510', '0', '28', null, null, '2019-09-28 17:32:05', '1', '106.624299', '29.096933', '500000', '重庆市', '500100', '市辖区', '500110', '綦江区', '1', '中石油', 'G75', '兰海高速', '50010000002');
INSERT INTO zsys_oil_station VALUES ('29', '綦江服务区西区加油站', '綦江服务区西区加油站', '重庆市綦江区新盛镇号房村（渝黔高速K34公里西侧 贵州方向）', '', '1', '18678888888', '0', '29', null, null, '2019-09-28 17:32:06', '1', '106.617246', '29.103457', '500000', '重庆市', '500100', '市辖区', '500110', '綦江区', '1', '中石油', 'G75', '兰海高速', '50010000002');
INSERT INTO zsys_oil_station VALUES ('30', '万州服务区东区加油站', '万州服务区东区加油站', '天城镇陈家村2组渝宜高速K266+500处东侧 重庆方向', '', '1', '13628218561', '0', '30', null, null, '2019-09-28 17:32:06', '1', '108.394249', '30.890356', '500000', '重庆市', '500100', '市辖区', '500101', '万州区', '1', '中石油', 'G42', '沪蓉高速', '50010000003');
INSERT INTO zsys_oil_station VALUES ('31', '万州服务区西区加油站', '万州服务区西区加油站', '天城镇陈家村2组渝宜高速K266+500处西侧 上海方向', '', '1', '13320328322', '0', '31', null, null, '2019-09-28 17:32:06', '1', '108.395228', '30.890176', '500000', '重庆市', '500100', '市辖区', '500101', '万州区', '1', '中石油', 'G42', '沪蓉高速', '50010000003');
INSERT INTO zsys_oil_station VALUES ('32', '曾家服务区东区加油站', '曾家服务区东区加油站', '沙坪区曾家镇清明村莲花寺社外环绕城高速曾家服务区加油站内 成都方向', '', '1', '18502384310', '0', '32', null, null, '2019-09-28 17:32:07', '1', '106.294123', '29.541568', '500000', '重庆市', '500100', '市辖区', '500106', '沙坪坝区', '1', '中石油', 'G5001', '重庆市绕城高速公路', '50010000004');
INSERT INTO zsys_oil_station VALUES ('33', '曾家服务区西区加油站', '曾家服务区西区加油站', '沙坪区曾家镇清明村莲花寺社外环绕城高速曾家服务区内 贵州方向', '', '1', '18580111234', '0', '33', null, null, '2019-09-28 17:32:07', '1', '106.292939', '29.541747', '500000', '重庆市', '500100', '市辖区', '500106', '沙坪坝区', '1', '中石油', 'G5001', '重庆市绕城高速公路', '50010000004');
INSERT INTO zsys_oil_station VALUES ('34', '江津（珞璜）服务区东区加油站', '江津（珞璜）服务区东区加油站', '重庆市江津区珞璜镇马宗社区17组（重庆绕城高速K108处）成都方向', '', '1', '18723102635', '0', '34', null, null, '2019-09-28 17:32:07', '1', '106.463816', '29.265826', '500000', '重庆市', '500100', '市辖区', '500116', '江津区', '1', '中石油', 'G5001', '重庆市绕城高速公路', '50010000005');
INSERT INTO zsys_oil_station VALUES ('35', '江津（珞璜）服务区西区加油站', '江津（珞璜）服务区西区加油站', '重庆市江津区珞璜镇马宗社区17组（重庆绕城高速K108处）湖南方向', '', '1', '13983244239', '0', '35', null, null, '2019-09-28 17:32:07', '1', '106.463837', '29.264949', '500000', '重庆市', '500100', '市辖区', '500116', '江津区', '1', '中石油', 'G5001', '重庆市绕城高速公路', '50010000005');
INSERT INTO zsys_oil_station VALUES ('36', '龙兴服务区东区加油站', '龙兴服务区东区加油站', '重庆市渝北区龙兴镇大岭村13社（重庆市绕城高速K45处）贵州方向', '', '1', '18716824861', '0', '36', null, null, '2019-09-28 17:32:08', '1', '106.786807', '29.675466', '500000', '重庆市', '500100', '市辖区', '500112', '渝北区', '1', '中石油', 'G5001', '重庆市绕城高速公路', '50010000006');
INSERT INTO zsys_oil_station VALUES ('37', '龙兴服务区西区加油站', '龙兴服务区西区加油站', '重庆市渝北区龙兴镇大岭村13社（重庆市绕城高速K45处）成都方向', '', '1', '15123333251', '0', '37', null, null, '2019-09-28 17:32:08', '1', '106.786875', '29.677408', '500000', '重庆市', '500100', '市辖区', '500112', '渝北区', '1', '中石油', 'G5001', '重庆市绕城高速公路', '50010000006');
INSERT INTO zsys_oil_station VALUES ('38', '迎龙服务区东区加油站', '迎龙服务区东区加油站', '重庆市南岸区迎龙镇清油洞村严家咀社（绕城高速K64+500米） 贵州方向', '', '1', '15922552408', '0', '38', null, null, '2019-09-28 17:32:08', '1', '106.718422', '29.504407', '500000', '重庆市', '500100', '市辖区', '500108', '南岸区', '1', '中石油', 'G5001', '重庆市绕城高速公路', '50010000007');
INSERT INTO zsys_oil_station VALUES ('39', '迎龙服务区西区加油站', '迎龙服务区西区加油站', '重庆市南岸区迎龙镇清油洞村严家咀社（绕城高速K64+500米） 成都方向', '', '1', '16602316213', '0', '39', null, null, '2019-09-28 17:32:08', '1', '106.719524', '29.504552', '500000', '重庆市', '500100', '市辖区', '500108', '南岸区', '1', '中石油', 'G5001', '重庆市绕城高速公路', '50010000007');
INSERT INTO zsys_oil_station VALUES ('40', '复兴服务区东区加油站', '复兴服务区东区加油站', '重庆市北碚区复兴镇太山村21社（重庆市绕城高速K15+500米处）湖南方向', '', '1', '15923503722', '0', '40', null, null, '2019-09-28 17:32:09', '1', '106.557308', '29.780603', '500000', '重庆市', '500100', '市辖区', '500109', '北碚区', '1', '中石油', 'G5001', '重庆市绕城高速公路', '50010000008');
INSERT INTO zsys_oil_station VALUES ('41', '复兴服务区西区加油站', '复兴服务区西区加油站', '重庆市北碚区复兴镇太山村21社（重庆市绕城高速K15+500米处） 成都方向', '', '1', '18696699569', '0', '41', null, null, '2019-09-28 17:32:09', '1', '106.556479', '29.781838', '500000', '重庆市', '500100', '市辖区', '500109', '北碚区', '1', '中石油', 'G5001', '重庆市绕城高速公路', '50010000008');
INSERT INTO zsys_oil_station VALUES ('42', '云阳服务区东区加油站', '云阳服务区东区加油站', '重庆市云阳县人和街道民权村5组 渝宜高速K1437处 重庆方向', '', '1', '13101096322', '0', '42', null, null, '2019-09-28 17:32:09', '1', '108.709229', '30.980134', '500000', '重庆市', '500200', '县', '500235', '云阳县', '1', '中石油', 'G42', '沪蓉高速', '50023500001');
INSERT INTO zsys_oil_station VALUES ('43', '云阳服务区西区加油站', '云阳服务区西区加油站', '重庆市云阳县人和街道民权村5组渝宜高速K1437处 上海方向', '', '1', '15223891016', '0', '43', null, null, '2019-09-28 17:32:09', '1', '108.711474', '30.978547', '500000', '重庆市', '500200', '县', '500235', '云阳县', '1', '中石油', 'G42', '沪蓉高速', '50023500001');
INSERT INTO zsys_oil_station VALUES ('44', '奉节服务区东区加油站', '奉节服务区东区加油站', '重庆市奉节县朱衣镇黄果村9组 渝宜高速K1368处 重庆方向', '', '1', '15111803835', '0', '44', null, null, '2019-09-28 17:32:10', '1', '109.381262', '31.035576', '500000', '重庆市', '500200', '县', '500236', '奉节县', '1', '中石油', 'G42', '沪蓉高速', '50023600001');
INSERT INTO zsys_oil_station VALUES ('45', '奉节服务区西区加油站', '奉节服务区西区加油站', '重庆市奉节县朱衣镇黄果村9组 渝宜高速K1368处 上海方向', '', '1', '15870500191', '0', '45', null, null, '2019-09-28 17:32:10', '1', '109.380110', '31.235061', '500000', '重庆市', '500200', '县', '500236', '奉节县', '1', '中石油', 'G42', '沪蓉高速', '50023600001');
INSERT INTO zsys_oil_station VALUES ('46', '篆塘服务区加油站', '篆塘服务区加油站', '重庆市綦江区G75(兰海高速)渝黔段LK1073+600 重庆方向', '', '1', '17723547321', '0', '46', null, null, '2019-09-28 17:32:10', '1', '106.677414', '28.821197', '500000', '重庆市', '500100', '市辖区', '500110', '綦江区', '1', '中石油', 'G75', '兰海高速', '50010000009');
INSERT INTO zsys_oil_station VALUES ('49', '德州服务区西区加油站', '德州服务区西区加油站', '山东省德州市德城区德州服务区(京台高速公路西)上海方向', '', '2', '18653480108', '0', '49', null, null, '2019-09-28 17:32:11', '1', '116.401187', '37.348094', '370000', '山东省', '371400', '德州市', '371402', '德城区', '1', '中国石化', 'G3', '京台高速', '37140000319');
INSERT INTO zsys_oil_station VALUES ('50', '德州服务区东区加油站', '德州服务区东区加油站', '山东省德州市德城区德州服务区(京台高速公路东)北京方向', '', '2', '18653480108', '0', '50', null, null, '2019-09-28 17:32:11', '1', '116.403536', '37.347836', '370000', '山东省', '371400', '德州市', '371402', '德城区', '1', '中国石化', 'G3', '京台高速', '37140000319');
INSERT INTO zsys_oil_station VALUES ('51', '平原服务区西区', '平原服务区西区加油站', '山东省德州市平原县德州南服务区(京台高速公路西)上海方向', '', '2', '18653480117', '0', '51', null, null, '2019-09-28 17:32:11', '1', '116.525719', '37.185196', '370000', '山东省', '371400', '德州市', '371426', '平原县', '1', '中国石化', 'G3', '京台高速', '37140000323');
INSERT INTO zsys_oil_station VALUES ('52', '德州南(平原)服务区东区', '德州南(平原)服务区东区加油站', '山东省德州市平原县德州南服务区(京台高速公路东) 北京方向', '', '2', '18653480117', '0', '52', null, null, '2019-09-28 17:32:11', '1', '116.527350', '37.185148', '370000', '山东省', '371400', '德州市', '371426', '平原县', '1', '中国石化', 'G3', '京台高速', '37140000323');
INSERT INTO zsys_oil_station VALUES ('53', '禹城服务区西区加油站', '禹城服务区西区加油站', '山东省德州市禹城市禹城服务区(京台高速公路西) 上海方向', '', '2', '15066600576', '0', '53', null, null, '2019-09-28 17:32:12', '1', '116.704129', '36.952257', '370000', '山东省', '371400', '德州市', '371482', '禹城市', '1', '中国石化', 'G3', '京台高速', '37140000320');
INSERT INTO zsys_oil_station VALUES ('54', '禹城服务区东区加油站', '禹城服务区东区加油站', '山东省德州市禹城市禹城服务区(京台高速公路东) 北京方向', '', '2', '13969279959', '0', '54', null, null, '2019-09-28 17:32:12', '1', '116.706495', '36.953408', '370000', '山东省', '371400', '德州市', '371482', '禹城市', '1', '中国石化', 'G3', '京台高速', '37140000320');
INSERT INTO zsys_oil_station VALUES ('55', '济南(崮山)服务区西区加油站', '济南(崮山)服务区西区加油站', '山东省济南市长清区济南（崮山）服务区西区(京台高速公路西) 上海方向', '', '2', '13260929339', '0', '55', null, null, '2019-09-28 17:32:12', '1', '116.859558', '36.501137', '370000', '山东省', '370100', '济南市', '370113', '长清区', '1', '中国石化', 'G3', '京台高速', '37010000474');
INSERT INTO zsys_oil_station VALUES ('56', '济南(崮山)服务区东区加油站', '济南(崮山)服务区东区加油站', '山东省济南市长清区济南（崮山）服务区西区(京台高速公路东) 北京方向', '', '2', '13260929339', '0', '56', null, null, '2019-09-28 17:32:12', '1', '116.865676', '36.497283', '370000', '山东省', '370100', '济南市', '370113', '长清区', '1', '中国石化', 'G3', '京台高速', '37010000474');
INSERT INTO zsys_oil_station VALUES ('57', '泰安服务区西区加油站', '泰安服务区西区加油站', '山东省泰安市岱岳区泰安服务区(京台高速公路西) 上海方向', '', '2', '13260929339', '0', '57', null, null, '2019-09-28 17:32:12', '1', '117.004059', '36.208453', '370000', '山东省', '370900', '泰安市', '370911', '岱岳区', '1', '中国石化', 'G3', '京台高速', '37090000265');
INSERT INTO zsys_oil_station VALUES ('58', '泰安服务区东区加油站', '泰安服务区东区加油站', '山东省泰安市岱岳区泰安服务区(京台高速公路东) 北京方向', '', '2', '13260929339', '0', '58', null, null, '2019-09-28 17:32:13', '1', '117.006098', '36.208638', '370000', '山东省', '370900', '泰安市', '370911', '岱岳区', '1', '中国石化', 'G3', '京台高速', '37090000265');
INSERT INTO zsys_oil_station VALUES ('59', '宁阳服务区东区加油站', '宁阳服务区东区加油站', '山东省泰安市宁阳县宁阳服务区(京台高速公路东) 北京方向', '', '2', '13260929339', '0', '59', null, null, '2019-09-28 17:32:13', '1', '117.074875', '35.874499', '370000', '山东省', '370900', '泰安市', '370921', '宁阳县', '1', '中国石化', 'G3', '京台高速', '37090000299');
INSERT INTO zsys_oil_station VALUES ('60', '宁阳服务区西区加油站', '宁阳服务区西区加油站', '山东省泰安市宁阳县宁阳服务区(京台高速公路西) 上海方向', '', '2', '13260929339', '0', '60', null, null, '2019-09-28 17:32:13', '1', '117.073460', '35.873616', '370000', '山东省', '370900', '泰安市', '370921', '宁阳县', '1', '中国石化', 'G3', '京台高速', '37090000299');
INSERT INTO zsys_oil_station VALUES ('61', '曲阜服务区东区加油站', '曲阜服务区东区加油站', '山东省济宁市曲阜市曲阜服务区(京台高速公路东) 北京方向', '', '2', '13260929339', '0', '61', null, null, '2019-09-28 17:32:13', '1', '117.055017', '35.567233', '370000', '山东省', '370800', '济宁市', '370881', '曲阜市', '1', '中国石化', 'G3', '京台高速', '37080000122');
INSERT INTO zsys_oil_station VALUES ('62', '曲阜服务区西区加油站', '曲阜服务区西区加油站', '山东省济宁市曲阜市曲阜服务区(京台高速公路西) 上海方向', '', '2', '13260929339', '0', '62', null, null, '2019-09-28 17:32:14', '1', '117.052899', '35.568005', '370000', '山东省', '370800', '济宁市', '370881', '曲阜市', '1', '中国石化', 'G3', '京台高速', '37080000122');
INSERT INTO zsys_oil_station VALUES ('63', '邹城服务区东区加油站', '邹城服务区东区加油站', '山东省济宁市邹城市邹城服务区(京台高速公路东) 北京方向', '', '2', '13260929339', '0', '63', null, null, '2019-09-28 17:32:14', '1', '117.112223', '35.278497', '370000', '山东省', '370800', '济宁市', '370883', '邹城市', '1', '中国石化', 'G3', '京台高速', '37080000136');
INSERT INTO zsys_oil_station VALUES ('64', '邹城服务区西区加油站', '邹城服务区西区加油站', '山东省济宁市邹城市邹城服务区(京台高速公路西) 上海方向', '', '2', '13260929339', '0', '64', null, null, '2019-09-28 17:32:14', '1', '117.110180', '35.277128', '370000', '山东省', '370800', '济宁市', '370883', '邹城市', '1', '中国石化', 'G3', '京台高速', '37080000136');
INSERT INTO zsys_oil_station VALUES ('65', '高唐服务区南区加油站', '高唐服务区南区加油站', '山东省聊城市高唐县高唐服务区(青银高速公路南） 青岛方向', '', '2', '13260929339', '0', '65', null, null, '2019-09-28 17:32:14', '1', '116.301613', '36.919339', '370000', '山东省', '371500', '聊城市', '371526', '高唐县', '1', '中国石化', 'G20', '青银高速', '37150000369');
INSERT INTO zsys_oil_station VALUES ('66', '高唐服务区北区加油站', '高唐服务区北区加油站', '山东省聊城市高唐县高唐服务区(青银高速公路北） 银川方向', '', '2', '13260929339', '0', '66', null, null, '2019-09-28 17:32:14', '1', '116.302929', '36.919955', '370000', '山东省', '371500', '聊城市', '371526', '高唐县', '1', '中国石化', 'G20', '青银高速', '37150000369');
INSERT INTO zsys_oil_station VALUES ('67', '山东高速服务区管理有限公司青银高速天桥服务区南区', '天桥服务区南区加油站', '山东省济南市天桥区天桥服务区(绕城高速公路南) 青岛方向', 'https://oss.etcsd.com/object/5cb54c6da055fa236fb327bb', '2', '0531-62318825', '0', '67', null, null, '2019-09-28 17:32:15', '1', '117.065403', '36.849010', '370000', '山东省', '370100', '济南市', '370105', '天桥区', '1', '中国石化', 'G20', '青银高速', '37010000475');
INSERT INTO zsys_oil_station VALUES ('68', '山东高速服务区管理有限公司青银高速天桥服务区北区', '天桥服务区北区加油站', '山东省济南市天桥区天桥服务区(绕城高速公路北) 银川方向', 'https://oss.etcsd.com/object/5cb54c6da055fa236fb327bd', '2', '0531-62318825', '0', '68', null, null, '2019-09-28 17:32:15', '1', '117.065369', '36.850299', '370000', '山东省', '370100', '济南市', '370105', '天桥区', '1', '中国石化', 'G20', '青银高速', '37010000475');
INSERT INTO zsys_oil_station VALUES ('69', '邹平服务区南区加油站', '邹平服务区南区加油站', '山东省滨州市邹平县邹平服务区(青银高速公路南） 青岛方向', '', '2', '13260929339', '0', '69', null, null, '2019-09-28 17:32:15', '1', '117.754453', '36.871954', '370000', '山东省', '371600', '滨州市', '371626', '邹平县', '1', '中国石化', 'G20', '青银高速', '37160000274');
INSERT INTO zsys_oil_station VALUES ('71', '邹平服务区北区加油站', '邹平服务区北区加油站', '山东省滨州市邹平县邹平服务区(青银高速公路北） 银川方向', '', '2', '13260929339', '0', '71', null, null, '2019-09-28 17:32:15', '1', '117.754214', '36.873018', '370000', '山东省', '371600', '滨州市', '371626', '邹平县', '1', '中国石化', 'G20', '青银高速', '37160000274');
INSERT INTO zsys_oil_station VALUES ('72', '淄博服务区南区加油站', '淄博服务区南区加油站', '山东省淄博市张店区淄博服务区(青银高速公路南） 青岛方向', '', '2', '13260929339', '0', '72', null, null, '2019-09-28 17:32:15', '1', '118.076495', '36.867533', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '1', '中国石化', 'G20', '青银高速', '37030000156');
INSERT INTO zsys_oil_station VALUES ('73', '淄博服务区北区加油站', '淄博服务区北区加油站', '山东省淄博市张店区淄博服务区(青银高速公路北） 银川方向', '', '2', '13260929339', '0', '73', null, null, '2019-09-28 17:32:16', '1', '118.076112', '36.868807', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '1', '中国石化', 'G20', '青银高速', '37030000156');
INSERT INTO zsys_oil_station VALUES ('76', '潍坊服务区南区加油站', '潍坊服务区南区加油站', '山东省潍坊市奎文区潍坊服务区(青银高速公路南) 青岛方向', '', '2', '13260929339', '0', '76', null, null, '2019-09-28 17:32:16', '1', '119.157864', '36.755931', '370000', '山东省', '370700', '潍坊市', '370705', '奎文区', '1', '中国石化', 'G20', '青银高速', '37070000308');
INSERT INTO zsys_oil_station VALUES ('77', '潍坊服务区北区加油站', '潍坊服务区北区加油站', '山东省潍坊市奎文区潍坊服务区(青银高速公路北) 银川方向', '', '2', '13260929339', '0', '77', null, null, '2019-09-28 17:32:16', '1', '119.156905', '36.757950', '370000', '山东省', '370700', '潍坊市', '370705', '奎文区', '1', '中国石化', 'G20', '青银高速', '37070000308');
INSERT INTO zsys_oil_station VALUES ('80', '鄄城服务区东区加油站', '鄄城服务区东区加油站', '山东省菏泽市鄄城县凤凰镇鄄城服务区（德上高速公路东） 德州方向', '', '2', '13260929339', '0', '80', null, null, '2019-09-28 17:32:16', '1', '115.600435', '35.587647', '370000', '山东省', '371700', '菏泽市', '371726', '鄄城县', '1', '中国石化', 'G3W', '德上高速', '37170000460');
INSERT INTO zsys_oil_station VALUES ('81', '鄄城服务区西区加油站', '鄄城服务区西区加油站', '山东省菏泽市鄄城县凤凰镇鄄城服务区（德上高速公路西） 上饶方向', '', '2', '13260929339', '0', '81', null, null, '2019-09-28 17:32:16', '1', '115.597823', '35.587910', '370000', '山东省', '371700', '菏泽市', '371726', '鄄城县', '1', '中国石化', 'G3W', '德上高速', '37170000460');
INSERT INTO zsys_oil_station VALUES ('82', '峄城服务区南区加油站', '峄城服务区南区加油站', '山东省枣庄市峄城区峄城服务区(岚曹高速公路南) 日照岚山区方向', '', '2', '13260929339', '0', '82', null, null, '2019-09-28 17:32:17', '1', '117.671951', '34.756663', '370000', '山东省', '370400', '枣庄市', '370404', '峄城区', '1', '中国石化', '', '', '37040000440');
INSERT INTO zsys_oil_station VALUES ('83', '峄城服务区北区加油站', '峄城服务区北区加油站', '山东省枣庄市峄城区峄城服务区(岚曹高速公路北) 曹州方向', '', '2', '13260929339', '0', '83', null, null, '2019-09-28 17:32:17', '1', '117.671436', '34.757571', '370000', '山东省', '370400', '枣庄市', '370404', '峄城区', '1', '中国石化', '', '', '37040000440');
INSERT INTO zsys_oil_station VALUES ('84', '兰陵(苍山)服务区北区加油站', '兰陵(苍山)服务区北区加油站', '山东省临沂市兰陵县兰陵服务区(岚曹高速公路北) 曹州方向', '', '2', '13260929339', '0', '84', null, null, '2019-09-28 17:32:17', '1', '117.994331', '34.899542', '370000', '山东省', '371300', '临沂市', '371324', '兰陵县', '1', '中国石化', '', '', '37130000330');
INSERT INTO zsys_oil_station VALUES ('85', '兰陵(苍山)服务区南区加油站', '兰陵(苍山)服务区南区加油站', '山东省临沂市兰陵县兰陵服务区(岚曹高速公路南) 日照岚山区方向', '', '2', '13260929339', '0', '85', null, null, '2019-09-28 17:32:17', '1', '117.994465', '34.898525', '370000', '山东省', '371300', '临沂市', '371324', '兰陵县', '1', '中国石化', '', '', '37130000330');
INSERT INTO zsys_oil_station VALUES ('86', '文登服务区东区加油站', '文登服务区东区加油站', '山东省威海市文登区文登服务区(威青高速公路东) 威海方向', '', '2', '13260929339', '0', '86', null, null, '2019-09-28 17:32:18', '1', '121.894998', '37.032059', '370000', '山东省', '371000', '威海市', '371003', '文登区', '1', '中国石化', 'S24', '威青高速', '37100000357');
INSERT INTO zsys_oil_station VALUES ('87', '文登服务区西区加油站', '文登服务区西区加油站', '山东省威海市文登区文登服务区(威青高速公路西) 青岛方向', '', '2', '13260929339', '0', '87', null, null, '2019-09-28 17:32:18', '1', '121.893144', '37.032268', '370000', '山东省', '371000', '威海市', '371003', '文登区', '1', '中国石化', 'S24', '威青高速', '37100000357');
INSERT INTO zsys_oil_station VALUES ('88', '乳山服务区东区加油站', '乳山服务区东区加油站', '山东省威海市乳山市乳山服务区(烟海高速公路东) 烟台方向', '', '2', '13260929339', '0', '88', null, null, '2019-09-28 17:32:18', '1', '121.404961', '37.035757', '370000', '山东省', '371000', '威海市', '371083', '乳山市', '1', '中国石化', '', '', '37100000359');
INSERT INTO zsys_oil_station VALUES ('89', '乳山服务区西区加油站', '乳山服务区西区加油站', '山东省威海市乳山市乳山服务区(烟海高速公路西) 海阳方向', '', '2', '13260929339', '0', '89', null, null, '2019-09-28 17:32:18', '1', '121.403784', '37.036837', '370000', '山东省', '371000', '威海市', '371083', '乳山市', '1', '中国石化', '', '', '37100000359');
INSERT INTO zsys_oil_station VALUES ('113', '六洞服务区东区加油站', '六洞服务区东区加油站', '淮安市淮安区上河镇羊吉村1组（京沪高速851MK处） 北京方向', '', null, '13952399972', '0', '113', null, null, '2019-09-28 17:32:18', '1', '119.271436', '33.429363', '320000', '江苏省', '320800', '淮安市', '320803', '淮安区', '1', '江苏高速石油', 'G2', '京沪高速', '32080000002');
INSERT INTO zsys_oil_station VALUES ('114', '六洞服务区西区加油站', '六洞服务区西区加油站', '淮安市淮安区上河镇羊吉村1组（京沪高速851MK处） 上海方向', '', null, '13952399973', '0', '114', null, null, '2019-09-28 17:32:19', '1', '119.271223', '33.432273', '320000', '江苏省', '320800', '淮安市', '320803', '淮安区', '1', '江苏高速石油', 'G2', '京沪高速', '32080000002');
INSERT INTO zsys_oil_station VALUES ('131', '仪征服务区东区加油站', '仪征服务区东区加油站', '仪征市铜山办事处枣林湾枣林村（G40沪陕高速K1490东侧） 扬州方向', '', null, '13851055210', '0', '131', null, null, '2019-09-28 17:32:19', '1', '119.090081', '32.341640', '320000', '江苏省', '321000', '扬州市', '321081', '仪征市', '1', '江苏高速石油', 'G40', '沪陕高速', '32100000003');
INSERT INTO zsys_oil_station VALUES ('132', '仪征服务区西区加油站', '仪征服务区西区加油站', '仪征市铜山办事处枣林湾枣林村（G40沪陕高速K1490西侧） 南京方向', '', null, '13851055210', '0', '132', null, null, '2019-09-28 17:32:19', '1', '119.090246', '32.342794', '320000', '江苏省', '321000', '扬州市', '321081', '仪征市', '1', '江苏高速石油', 'G40', '沪陕高速', '32100000003');
INSERT INTO zsys_oil_station VALUES ('133', '古黄河服务区东区加油站', '古黄河服务区东区加油站', '徐州市铜山区张集镇贺楼村古黄河服务区加油站 徐州方向', '', null, '13776773606', '0', '133', null, null, '2019-09-28 17:32:19', '1', '117.426842', '34.132666', '320000', '江苏省', '320300', '徐州市', '320312', '铜山区', '1', '江苏高速石油', 'G2513', '淮徐高速', '32130000002');
INSERT INTO zsys_oil_station VALUES ('134', '古黄河服务区西区加油站', '古黄河服务区西区加油站', '徐州市铜山区张集镇贺楼村古黄河服务区加油站 南京方向', '', null, '13776773606', '0', '134', null, null, '2019-09-28 17:32:20', '1', '117.425260', '34.131890', '320000', '江苏省', '320300', '徐州市', '320312', '铜山区', '1', '江苏高速石油', 'G2513', '淮徐高速', '32130000002');
INSERT INTO zsys_oil_station VALUES ('135', '曹林服务区东区加油站', '曹林服务区东区加油站', '连云港市东海县牛山镇曹林村东海服务区加油站 连云港方向', '', null, '13851287437', '0', '135', null, null, '2019-09-28 17:32:20', '1', '118.756504', '34.482975', '320000', '江苏省', '320700', '连云港市', '320722', '东海县', '1', '江苏高速石油', 'G30', '连霍高速', '32070000006');
INSERT INTO zsys_oil_station VALUES ('136', '曹林服务区西区加油站', '曹林服务区西区加油站', '连云港市东海县牛山镇曹林村东海服务区加油站 徐州方向', '', null, '13851287437', '0', '136', null, null, '2019-09-28 17:32:20', '1', '118.756171', '34.484044', '320000', '江苏省', '320700', '连云港市', '320722', '东海县', '1', '江苏高速石油', 'G30', '连霍高速', '32070000006');
INSERT INTO zsys_oil_station VALUES ('137', '敬安服务区东区加油站', '敬安服务区东区加油站', '徐州市沛县敬安镇敬安停车区（济徐高速S69，,59KM） 济宁方向', '', null, '13775878108', '0', '137', null, null, '2019-09-28 17:32:20', '1', '116.573400', '34.615600', '320000', '江苏省', '320300', '徐州市', '320322', '沛县', '1', '江苏高速石油', 'S69', '徐济高速', '32030000004');
INSERT INTO zsys_oil_station VALUES ('138', '敬安服务区西区加油站', '敬安服务区西区加油站', '徐州市沛县敬安镇敬安停车区（济徐高速S69,59KM） 徐州方向', '', null, '13775878108', '0', '138', null, null, '2019-09-28 17:32:21', '1', '116.573300', '34.315300', '320000', '江苏省', '320300', '徐州市', '320322', '沛县', '1', '江苏高速石油', 'S69', '徐济高速', '32030000004');
INSERT INTO zsys_oil_station VALUES ('139', '郭村服务区南区加油站', '郭村服务区南区加油站', '扬州市江都区郭村镇江海高速郭村服务区 海安方向', '', null, '13852596179', '0', '139', null, null, '2019-09-28 17:32:21', '1', '119.793749', '32.540497', '320000', '江苏省', '321000', '扬州市', '321012', '江都区', '1', '江苏高速石油', '', '', '32100000004');
INSERT INTO zsys_oil_station VALUES ('140', '郭村服务区北区加油站', '郭村服务区北区加油站', '扬州市江都区郭村镇江海高速郭村服务区 扬州方向', '', null, '13852596179', '0', '140', null, null, '2019-09-28 17:32:21', '1', '119.785834', '32.543147', '320000', '江苏省', '321000', '扬州市', '321012', '江都区', '1', '江苏高速石油', '', '', '32100000004');
INSERT INTO zsys_oil_station VALUES ('141', '黄桥服务区东区加油站', '黄桥服务区东区加油站', '泰兴市黄桥镇刘陈严徐村五组（S29盐靖高速K150东侧） 盐城方向', '', null, '13961088299', '0', '141', null, null, '2019-09-28 17:32:21', '1', '120.177377', '32.286735', '320000', '江苏省', '321200', '泰州市', '321283', '泰兴市', '1', '江苏高速石油', '', '', '32120000002');
INSERT INTO zsys_oil_station VALUES ('142', '黄桥服务区西区加油站', '黄桥服务区西区加油站', '泰兴市黄桥镇刘陈严徐村五组（S29盐靖高速K150西侧） 靖江方向', '', null, '13961088299', '0', '142', null, null, '2019-09-28 17:32:21', '1', '120.177302', '32.285553', '320000', '江苏省', '321200', '泰州市', '321283', '泰兴市', '1', '江苏高速石油', '', '', '32120000002');
INSERT INTO zsys_oil_station VALUES ('143', '兴泰服务区东区加油站', '兴泰服务区东区加油站', '泰州市姜堰区兴泰镇溱湖服务区（原兴泰服务区）东区 盐城方向', '', null, '15896039919', '0', '143', null, null, '2019-09-28 17:32:22', '1', '120.089823', '32.678370', '320000', '江苏省', '321200', '泰州市', '321204', '姜堰区', '1', '江苏高速石油', '', '', '32120000003');
INSERT INTO zsys_oil_station VALUES ('144', '兴泰服务区西区加油站', '兴泰服务区西区加油站', '泰州市姜堰区兴泰镇溱湖服务区（原兴泰服务区）西区 江阴大桥方向', '', null, '15896039919', '0', '144', null, null, '2019-09-28 17:32:22', '1', '120.088253', '32.677404', '320000', '江苏省', '321200', '泰州市', '321204', '姜堰区', '1', '江苏高速石油', '', '', '32120000003');
INSERT INTO zsys_oil_station VALUES ('145', '古盐河服务区东(南)区加油站', '古盐河服务区东(南)区加油站', '王元镇谢碾村(S18宿淮盐高速88KM处) 盐城方向', '', null, '13851386353', '0', '145', null, null, '2019-09-28 17:32:22', '1', '119.021301', '33.293222', '320000', '江苏省', '320800', '淮安市', '320812', '清江浦区', '1', '江苏高速石油', '', '', '32080000003');
INSERT INTO zsys_oil_station VALUES ('146', '古盐河服务区西(北)区加油站', '古盐河服务区西(北)区加油站', '王元镇谢碾村(S18宿淮盐高速88KM处) 宿迁方向', '', null, '13851386353', '0', '146', null, null, '2019-09-28 17:32:22', '1', '119.021560', '33.292512', '320000', '江苏省', '320800', '淮安市', '320812', '清江浦区', '1', '江苏高速石油', '', '', '32080000003');
INSERT INTO zsys_oil_station VALUES ('147', '成子湖服务区加油站南区加油站', '成子湖服务区加油站南区加油站', '321300泗阳县李口镇成子湖服务区加油站 淮安方向', '', null, '18762559998', '0', '147', null, null, '2019-09-28 17:32:22', '1', '118.738387', '33.634144', '320000', '江苏省', '321300', '宿迁市', '321323', '泗阳县', '1', '江苏高速石油', 'G2513', '淮徐高速', '32130000003');
INSERT INTO zsys_oil_station VALUES ('148', '成子湖服务区加油站北区加油站', '成子湖服务区加油站北区加油站', '321300泗阳县李口镇成子湖服务区加油站 徐州方向', '', null, '18762559998', '0', '148', null, null, '2019-09-28 17:32:23', '1', '118.737417', '33.635853', '320000', '江苏省', '321300', '宿迁市', '321323', '泗阳县', '1', '江苏高速石油', 'G2513', '淮徐高速', '32130000003');
INSERT INTO zsys_oil_station VALUES ('149', '洋河服务区加油站南区加油站', '洋河服务区加油站南区加油站', '321300经济开发区南蔡乡路南村洋河服务区加油站 淮安方向', '', null, '15062106933', '0', '149', null, null, '2019-09-28 17:32:23', '1', '118.322451', '33.805428', '320000', '江苏省', '321300', '宿迁市', '321302', '宿城区', '1', '江苏高速石油', 'G2513', '淮徐高速', '32130000004');
INSERT INTO zsys_oil_station VALUES ('150', '洋河服务区加油站北区加油站', '洋河服务区加油站北区加油站', '321300经济开发区南蔡乡路南村洋河服务区加油站 徐州方向', '', null, '15062106933', '0', '150', null, null, '2019-09-28 17:32:23', '1', '118.322209', '33.807266', '320000', '江苏省', '321300', '宿迁市', '321302', '宿城区', '1', '江苏高速石油', 'G2514', '淮徐高速', '32130000004');
INSERT INTO zsys_oil_station VALUES ('151', '车桥服务区东区加油站', '车桥服务区东区加油站', '车桥镇光华村(S18宿淮盐高速134K+424M处) 盐城方向', '', null, '13952334466', '0', '151', null, null, '2019-09-28 17:32:23', '1', '119.345164', '33.447527', '320000', '江苏省', '320800', '淮安市', '320803', '淮安区', '1', '江苏高速石油', '', '', '32080000004');
INSERT INTO zsys_oil_station VALUES ('152', '车桥服务区西区加油站', '车桥服务区西区加油站', '车桥镇光华村(S18宿淮盐高速134K+424M处) 宿迁方向', '', null, '13952334466', '0', '152', null, null, '2019-09-28 17:32:24', '1', '119.343495', '33.448621', '320000', '江苏省', '320800', '淮安市', '320803', '淮安区', '1', '江苏高速石油', '', '', '32080000004');
INSERT INTO zsys_oil_station VALUES ('153', '老山服务区东区加油站', '老山服务区东区加油站', '南京市浦口区永宁街道老山服务区加油站 淮安方向', '', null, '13651555754', '0', '153', null, null, '2019-09-28 17:32:24', '1', '118.567046', '32.113971', '320000', '江苏省', '320100', '南京市', '320111', '浦口区', '1', '江苏高速石油', 'G40', '沪陕高速', '32010000005');
INSERT INTO zsys_oil_station VALUES ('154', '老山服务区西区加油站', '老山服务区西区加油站', '南京市浦口区永宁街道老山服务区加油站 南京方向', '', null, '13651555754', '0', '154', null, null, '2019-09-28 17:32:24', '1', '118.565979', '32.114571', '320000', '江苏省', '320100', '南京市', '320111', '浦口区', '1', '江苏高速石油', 'G40', '沪陕高速', '32010000005');
INSERT INTO zsys_oil_station VALUES ('155', '六合服务区东区加油站', '六合服务区东区加油站', '南京市六合区竹镇镇李营组(G25长深高速1964东侧） 淮安方向', '', null, '13626146688', '0', '155', null, null, '2019-09-28 17:32:24', '1', '118.731312', '32.480463', '320000', '江苏省', '320100', '南京市', '320116', '六合区', '1', '江苏高速石油', 'G25', '长深高速', '32010000006');
INSERT INTO zsys_oil_station VALUES ('156', '六合服务区西区加油站', '六合服务区西区加油站', '南京市六合区竹镇镇李营组(G25长深高速1964西侧） 南京方向', '', null, '13626146688', '0', '156', null, null, '2019-09-28 17:32:24', '1', '118.730227', '32.479796', '320000', '江苏省', '320100', '南京市', '320116', '六合区', '1', '江苏高速石油', 'G25', '长深高速', '32010000006');
INSERT INTO zsys_oil_station VALUES ('157', '洪泽服务区东区加油站', '洪泽服务区东区加油站', '淮安市洪泽区高良涧镇宁淮高速洪泽湖服务区加油站（长深高速G25） 淮安方向', '', null, '13952307305', '0', '157', null, null, '2019-09-28 17:32:25', '1', '118.213181', '33.258949', '320000', '江苏省', '320800', '淮安市', '320813', '洪泽区', '1', '江苏高速石油', 'G25', '长深高速', '32080000005');
INSERT INTO zsys_oil_station VALUES ('158', '洪泽服务区西区加油站', '洪泽服务区西区加油站', '淮安市洪泽区高良涧镇宁淮高速洪泽湖服务区加油站（长深高速G25） 南京方向', '', null, '13952307305', '0', '158', null, null, '2019-09-28 17:32:25', '1', '118.211607', '33.258925', '320000', '江苏省', '320800', '淮安市', '320813', '洪泽区', '1', '江苏高速石油', 'G25', '长深高速', '32080000005');
INSERT INTO zsys_oil_station VALUES ('159', '盱眙服务区东区加油站', '盱眙服务区东区加油站', '淮安市盱眙县旧铺镇郑盘村(G25长深高速1925东侧） 淮安方向', '', null, '13813307616', '0', '159', null, null, '2019-09-28 17:32:25', '1', '118.741752', '32.792604', '320000', '江苏省', '320800', '淮安市', '320830', '盱眙县', '1', '江苏高速石油', 'G25', '长深高速', '32080000006');
INSERT INTO zsys_oil_station VALUES ('160', '盱眙服务区西区加油站', '盱眙服务区西区加油站', '淮安市盱眙县旧铺镇郑盘村(G25长深高速1925西侧） 南京方向', '', null, '13813307616', '0', '160', null, null, '2019-09-28 17:32:25', '1', '118.740148', '32.792738', '320000', '江苏省', '320800', '淮安市', '320830', '盱眙县', '1', '江苏高速石油', 'G25', '长深高速', '32080000006');
INSERT INTO zsys_oil_station VALUES ('161', '洪泽湖服务区东区加油站', '洪泽湖服务区东区加油站', '321300泗洪县双沟镇汤兰村（S49新扬高速136KM东侧） 徐州方向', '', null, '15189617755', '0', '161', null, null, '2019-09-28 17:32:26', '1', '118.213181', '33.252611', '320000', '江苏省', '321300', '宿迁市', '321324', '泗洪县', '1', '江苏高速石油', 'S49', '新扬高速', '32080000007');
INSERT INTO zsys_oil_station VALUES ('162', '洪泽湖服务区西区加油站', '洪泽湖服务区西区加油站', '321300泗洪县双沟镇汤兰村（S49新扬高速136KM西侧） 南京方向', '', null, '15189617755', '0', '162', null, null, '2019-09-28 17:32:26', '1', '118.206762', '33.254191', '320000', '江苏省', '321300', '宿迁市', '321324', '泗洪县', '1', '江苏高速石油', 'S49', '新扬高速', '32080000007');
INSERT INTO zsys_oil_station VALUES ('163', '高作服务区东区加油站', '高作服务区东区加油站', '徐州市睢宁县高作镇官汪村高作服务区加油站（31G25） 北京方向', '', null, '15205237178', '0', '163', null, null, '2019-09-28 17:32:26', '1', '118.018220', '33.559590', '320000', '江苏省', '320300', '徐州市', '320324', '睢宁县', '1', '江苏高速石油', 'G2513', '淮徐高速', '32030000005');
INSERT INTO zsys_oil_station VALUES ('164', '高作服务区西区加油站', '高作服务区西区加油站', '徐州市睢宁县高作镇官汪村高作服务区加油站（31G25） 上海方向', '', null, '15205237178', '0', '164', null, null, '2019-09-28 17:32:26', '1', '118.017410', '33.560830', '320000', '江苏省', '320300', '徐州市', '320324', '睢宁县', '1', '江苏高速石油', 'G2513', '淮徐高速', '32030000005');
INSERT INTO zsys_oil_station VALUES ('165', '骆马湖服务区东区加油站', '骆马湖服务区东区加油站', '321300宿豫区曹集乡范庄村（S49新扬高速40KM东侧） 北京方向', '', null, '13852835111', '0', '165', null, null, '2019-09-28 17:32:26', '1', '118.412838', '34.018853', '320000', '江苏省', '321300', '宿迁市', '321311', '宿豫区', '1', '江苏高速石油', 'S49', '新扬高速', '32130000005');
INSERT INTO zsys_oil_station VALUES ('166', '骆马湖服务区西区加油站', '骆马湖服务区西区加油站', '321300宿豫区曹集乡范庄村（S49新扬高速40KM西侧） 南京方向', '', null, '13852835111', '0', '166', null, null, '2019-09-28 17:32:27', '1', '118.411242', '34.017736', '320000', '江苏省', '321300', '宿迁市', '321311', '宿豫区', '1', '江苏高速石油', 'S49', '新扬高速', '32130000005');
INSERT INTO zsys_oil_station VALUES ('167', '平望服务区南区加油站', '平望服务区南区加油站', '苏州市吴江区平望镇溪港村平望服务区加油站 上海方向', '', null, '13921319237', '0', '167', null, null, '2019-09-28 17:32:27', '1', '120.609955', '31.034213', '320000', '江苏省', '320500', '苏州市', '320509', '吴江区', '1', '江苏高速石油', 'G50', '沪渝高速', '32050000002');
INSERT INTO zsys_oil_station VALUES ('168', '平望服务区北区加油站', '平望服务区北区加油站', '苏州市吴江区平望镇溪港村平望服务区加油站 浙江方向', '', null, '13921319237', '0', '168', null, null, '2019-09-28 17:32:27', '1', '120.598579', '31.031865', '320000', '江苏省', '320500', '苏州市', '320509', '吴江区', '1', '江苏高速石油', 'G50', '沪渝高速', '32050000002');
INSERT INTO zsys_oil_station VALUES ('169', '小黄山服务区东区加油站', '小黄山服务区东区加油站', '江苏省常州市新北区孟河镇三茅殿村小黄山服务区加油站 泰州方向', '', null, '13812246047', '0', '169', null, null, '2019-09-28 17:32:27', '1', '119.870592', '32.030889', '320000', '江苏省', '320400', '常州市', '320411', '新北区', '1', '江苏高速石油', 'S39', '江宜高速', '32040000002');
INSERT INTO zsys_oil_station VALUES ('170', '小黄山服务区西区加油站', '小黄山服务区西区加油站', '江苏省常州市新北区孟河镇三茅殿村小黄山服务区加油站 常州方向', '', null, '13812246047', '0', '170', null, null, '2019-09-28 17:32:28', '1', '119.870444', '32.033774', '320000', '江苏省', '320400', '常州市', '320411', '新北区', '1', '江苏高速石油', 'S39', '江宜高速', '32040000002');
INSERT INTO zsys_oil_station VALUES ('171', '江阴大桥服务区加油站', '江阴大桥服务区加油站', '江苏省泰州市靖江城南街道江阴大桥服务区 北京/上海方向', '', null, '13951506803', '0', '171', null, null, '2019-09-28 17:32:28', '1', '120.154899', '31.573751', '320000', '江苏省', '321200', '泰州市', '321282', '靖江市', '1', '江苏高速石油', 'G2', '京沪高速', '32020000003');
INSERT INTO zsys_oil_station VALUES ('172', '新桥服务区南区加油站', '新桥服务区南区加油站', '江阴市新桥镇新桥服务区加油站(S38沿江高速45KM处） 上海方向', '', null, '15251555861', '0', '172', null, null, '2019-09-28 17:32:28', '1', '120.502813', '31.815176', '320000', '江苏省', '320200', '无锡市', '320281', '江阴市', '1', '江苏高速石油', '', '', '32020000004');
INSERT INTO zsys_oil_station VALUES ('173', '新桥服务区北区加油站', '新桥服务区北区加油站', '江阴市新桥镇新桥服务区加油站(S38沿江高速45KM处） 常州方向', '', null, '15251555861', '0', '173', null, null, '2019-09-28 17:32:28', '1', '120.500137', '31.816155', '320000', '江苏省', '320200', '无锡市', '320281', '江阴市', '1', '江苏高速石油', '', '', '32020000004');
INSERT INTO zsys_oil_station VALUES ('174', '广陵服务区东区加油站', '广陵服务区东区加油站', '江苏省泰兴市广陵镇广陵服务区 北京方向', '', null, '15295310066', '0', '174', null, null, '2019-09-28 17:32:29', '1', '120.236020', '32.113471', '320000', '江苏省', '321200', '泰州市', '321002', '请选择区县', '1', '江苏高速石油', 'G2', '京沪高速', '32120000004');
INSERT INTO zsys_oil_station VALUES ('175', '广陵服务区西区加油站', '广陵服务区西区加油站', '江苏省泰兴市广陵镇广陵服务区 上海方向', '', null, '15295310066', '0', '175', null, null, '2019-09-28 17:32:29', '1', '120.236020', '32.113471', '320000', '江苏省', '321200', '泰州市', '321002', '请选择区县', '1', '江苏高速石油', 'G2', '京沪高速', '32120000004');
INSERT INTO zsys_oil_station VALUES ('184', '滆湖服务区南区加油站', '滆湖服务区南区加油站', '常州市武进区嘉泽镇滆湖服务区加油站母站 上海方向', '', null, '13809030609', '0', '184', null, null, '2019-09-28 17:32:29', '1', '119.803829', '31.666634', '320000', '江苏省', '320400', '常州市', '320412', '武进区', '1', '江苏高速石油', 'S38', '常合高速', '32040000003');
INSERT INTO zsys_oil_station VALUES ('185', '滆湖服务区北区加油站', '滆湖服务区北区加油站', '常州市武进区嘉泽镇滆湖服务区加油站子站 南京方向', '', null, '13809030609', '0', '185', null, null, '2019-09-28 17:32:29', '1', '119.800064', '31.663095', '320000', '江苏省', '320400', '常州市', '320412', '武进区', '1', '江苏高速石油', 'S38', '常合高速', '32040000003');
INSERT INTO zsys_oil_station VALUES ('186', '荣炳服务区东区加油站', '荣炳服务区东区加油站', '镇江市丹徒区荣炳镇沈家棚村（G40扬溧高速） 扬州方向', '', null, '13952960966', '0', '186', null, null, '2019-09-28 17:32:30', '1', '119.398268', '31.844275', '320000', '江苏省', '321100', '镇江市', '321112', '丹徒区', '1', '江苏高速石油', 'G40', '沪陕高速', '32110000001');
INSERT INTO zsys_oil_station VALUES ('187', '荣炳服务区西区加油站', '荣炳服务区西区加油站', '镇江市丹徒区荣炳镇沈家棚村（G40扬溧高速） 溧阳方向', '', null, '13952960966', '0', '187', null, null, '2019-09-28 17:32:30', '1', '119.396254', '31.843905', '320000', '江苏省', '321100', '镇江市', '321112', '丹徒区', '1', '江苏高速石油', 'G40', '沪陕高速', '32110000001');
INSERT INTO zsys_oil_station VALUES ('188', '荷叶山服务区北区加油站', '荷叶山服务区北区加油站', '南京市江宁区横溪街道横云南路丝琴理发店 马鞍山方向', '', null, '13913366698', '0', '188', null, null, '2019-09-28 17:32:30', '1', '118.778491', '31.689303', '320000', '江苏省', '320100', '南京市', '320115', '江宁区', '1', '江苏高速石油', 'S38', '常合高速', '32010000007');
INSERT INTO zsys_oil_station VALUES ('189', '荷叶山服务区南区加油站', '荷叶山服务区南区加油站', '南京市江宁区横溪街道横云南路丝琴理发店 溧水方向', '', null, '13913366698', '0', '189', null, null, '2019-09-28 17:32:30', '1', '118.776453', '31.689512', '320000', '江苏省', '320100', '南京市', '320115', '江宁区', '1', '江苏高速石油', 'S38', '常合高速', '32010000007');
INSERT INTO zsys_oil_station VALUES ('191', '日兰高速菏泽服务区北区加油站', '菏泽服务区北区加油站', '山东省菏泽市牡丹区日东高速菏泽服务区郑州方向', '', null, '15269000599', '0', '191', null, null, '2019-09-28 17:32:31', '1', '115.612580', '35.354711', '370000', '山东省', '371700', '菏泽市', '371702', '牡丹区', '1', '其它', 'G1511', '日南高速', '37170000662');
INSERT INTO zsys_oil_station VALUES ('192', '日兰高速菏泽服务区南区加油站', '菏泽服务区南区加油站', '山东省菏泽市牡丹区日东高速菏泽服务区日照方向', '', null, '15269000599', '0', '192', null, null, '2019-09-28 17:32:31', '1', '115.638140', '35.307114', '370000', '山东省', '371700', '菏泽市', '371702', '牡丹区', '1', '其它', 'G1511', '日南高速', '37170000662');
INSERT INTO zsys_oil_station VALUES ('193', '山东高速服务区管理有限公司烟海路乳山服务区西区', '乳山服务区西区', '山东省威海市乳山市烟海高速乳山服务西区', '', '2', '13573709977', '0', '193', null, null, '2019-09-28 17:32:31', '1', '121.397408', '37.031297', '370000', '山东省', '371000', '威海市', '371083', '乳山市', '1', '中国石化', '', '', '37100000359');
INSERT INTO zsys_oil_station VALUES ('195', '中国石油天然气股份有限公司滨州第1加油站', '高新小营加油站', '滨州市205国道小营镇庞家镇交界处路西', '', '1', '18633506680', '0', '195', null, null, '2019-09-28 17:32:31', '1', '118.091235', '37.262764', '370000', '山东省', '371600', '滨州市', '371602', '滨城区', '0', '中石油', '', '', '37160000393');
INSERT INTO zsys_oil_station VALUES ('199', '中国石油天然气股份有限公司滨州第2加油站', '滨城东海一路南加油站', '滨州市黄河大桥北端向东2公里南外环与东海一路交叉口南侧', '', '1', '18663072769', '0', '199', null, null, '2019-09-28 17:32:31', '1', '118.069937', '37.374387', '370000', '山东省', '371600', '滨州市', '371602', '滨城区', '0', '中石油', '', '', '37160000394');
INSERT INTO zsys_oil_station VALUES ('200', '中国石油天然气股份有限公司滨州第3加油站', '邹平好生加油站', '邹平县好生镇八里河村', '', '1', '18606495851', '0', '200', null, null, '2019-09-28 17:32:32', '1', '117.825331', '36.818214', '370000', '山东省', '371600', '滨州市', '371626', '邹平县', '0', '中石油', '', '', '37160000395');
INSERT INTO zsys_oil_station VALUES ('201', '中国石油天然气股份有限公司滨州第4加油站', '博兴曹王加油站', '博兴县曹王镇205国道586公里路西', '', '1', '18663072773', '0', '201', null, null, '2019-09-28 17:32:32', '1', '118.169153', '37.035244', '370000', '山东省', '371600', '滨州市', '371625', '博兴县', '0', '中石油', '', '', '37160000396');
INSERT INTO zsys_oil_station VALUES ('202', '山东路油油气管理有限公司沈海高速福山服务区南区', '福山服务区南区', 'G15沈海高速福山服务区南区', '', null, '18653191775', '0', '202', null, null, '2019-09-28 17:32:32', '1', '121.107710', '37.504950', '370000', '山东省', '370600', '烟台市', '370611', '福山区', '1', '其它', 'G15', '沈海高速', '37010000662');
INSERT INTO zsys_oil_station VALUES ('204', '山东路油油气管理有限公司沈海高速福山服务区北区', '福山服务区北区', 'G15沈海高速福山服务区北区', '', null, '18653191775', '0', '204', null, null, '2019-09-28 17:32:32', '1', '121.106870', '37.505980', '370000', '山东省', '370600', '烟台市', '370611', '福山区', '1', '其它', 'G15', '沈海高速', '37010000662');
INSERT INTO zsys_oil_station VALUES ('205', '山东高速服务区管理有限公司烟海路乳山服务区东区', '乳山服务区东区', '山东省威海市乳山市烟海高速乳山服务区东区', '', '2', '13573709977', '0', '205', null, null, '2019-09-28 17:32:33', '1', '121.397934', '37.030453', '370000', '山东省', '371000', '威海市', '371083', '乳山市', '1', '中国石化', '', '', '37100000359');
INSERT INTO zsys_oil_station VALUES ('206', '山东路油油气管理有限公司沈海高速栖霞服务区东区', '栖霞服务区东区', 'G15沈海高速栖霞服务区东区', '', null, '18653197813', '0', '206', null, null, '2019-09-28 17:32:33', '1', '120.748600', '37.278610', '370000', '山东省', '370600', '烟台市', '370686', '栖霞市', '1', '其它', 'G15', '沈海高速', '37010000662');
INSERT INTO zsys_oil_station VALUES ('207', '山东路油油气管理有限公司沈海高速栖霞服务区西区', '栖霞服务区西区', 'G15沈海高速栖霞服务区西区', '', null, '18653197813', '0', '207', null, null, '2019-09-28 17:33:54', '1', '120.747190', '37.278860', '370000', '山东省', '370600', '烟台市', '370686', '栖霞市', '1', '其它', 'G15', '沈海高速', '37010000662');
INSERT INTO zsys_oil_station VALUES ('208', '中国石油天然气股份有限公司滨州第5加油站', '博兴小清河加油站', '博兴县湖滨镇205国道姜韩村路西', '', '1', '15063401223', '0', '208', null, null, '2019-09-28 17:33:54', '1', '118.187533', '37.114641', '370000', '山东省', '371600', '滨州市', '371625', '博兴县', '0', '中石油', '', '', '37160000397');
INSERT INTO zsys_oil_station VALUES ('209', '中国石油天然气股份有限公司滨州第6加油站', '博兴城东加油站', '博兴县博城205国道585公里路东', '', '1', '13884858800', '0', '209', null, null, '2019-09-28 17:33:54', '1', '118.172950', '37.136226', '370000', '山东省', '371600', '滨州市', '371625', '博兴县', '0', '中石油', '', '', '37160000398');
INSERT INTO zsys_oil_station VALUES ('210', '中国石油天然气股份有限公司滨州第7加油站', '邹平黄山五路加油站', '邹平县西环路北外环路交叉口路南前程村对面', '', '1', '18763099351', '0', '210', null, null, '2019-09-28 17:33:54', '1', '117.988210', '36.476438', '370000', '山东省', '371600', '滨州市', '371626', '邹平县', '0', '中石油', '', '', '37160000399');
INSERT INTO zsys_oil_station VALUES ('211', '射阳加油站东区', '射阳加油站东区', '盐城市射阳县盘湾镇振阳村', '', null, '15950219006', '0', '211', null, null, '2019-09-28 17:33:54', '1', '120.210450', '33.555141', '320000', '江苏省', '320900', '盐城市', '320924', '射阳县', '1', '江苏高速石油', 'G15', '沈海高速', '32090000001');
INSERT INTO zsys_oil_station VALUES ('212', '射阳加油站西区', '射阳加油站西区', '盐城市射阳县盘湾镇振阳村', '', null, '15950219006', '0', '212', null, null, '2019-09-28 17:33:55', '1', '120.210077', '33.553164', '320000', '江苏省', '320900', '盐城市', '320924', '射阳县', '1', '江苏高速石油', 'G15', '沈海高速', '32090000001');
INSERT INTO zsys_oil_station VALUES ('213', '中国石油天然气股份有限公司滨州第8加油站', '邹平一中加油站', '邹平县鹤伴三路与醴泉一路交叉路口西南角', '', '1', '18663072780', '0', '213', null, null, '2019-09-28 17:33:55', '1', '117.740562', '36.860684', '370000', '山东省', '371600', '滨州市', '371626', '邹平县', '0', '中石油', '', '', '37160000400');
INSERT INTO zsys_oil_station VALUES ('214', '苏通大桥加油站东区', '苏通大桥加油站东区', '江苏省南通市农场999#（G15沈海高速路K1193两侧）', '', null, '13770195908', '0', '214', null, null, '2019-09-28 17:33:55', '1', '120.999904', '31.874257', '320000', '江苏省', '320600', '南通市', '320602', '崇川区', '1', '江苏高速石油', 'G15', '沈海高速', '32060000001');
INSERT INTO zsys_oil_station VALUES ('217', '苏通大桥加油站西区', '苏通大桥加油站西区', '江苏省南通市农场999#（G15沈海高速路K1193两侧）', '', null, '13770195908', '0', '217', null, null, '2019-09-28 17:33:56', '1', '120.998004', '31.873042', '320000', '江苏省', '320600', '南通市', '320602', '崇川区', '1', '江苏高速石油', 'G15', '沈海高速', '32060000001');
INSERT INTO zsys_oil_station VALUES ('218', '中国石油天然气股份有限公司滨州第9加油站', '邹平高新加油站', '邹平县会仙一路高新街道办事处东', '', '1', '18663097709', '0', '218', null, null, '2019-09-28 17:33:56', '1', '117.831799', '36.881151', '370000', '山东省', '371600', '滨州市', '371626', '邹平县', '0', '中石油', '', '', '37160000401');
INSERT INTO zsys_oil_station VALUES ('219', '中国石油天然气股份有限公司济宁第1加油站', '济宁第1加油站', '济宁市长青路17号', '', '1', '05373296788', '0', '219', null, null, '2019-09-28 17:33:56', '1', '116.343064', '35.253554', '370000', '山东省', '370800', '济宁市', '370801', '市辖区', '0', '中石油', '', '', '37080000236');
INSERT INTO zsys_oil_station VALUES ('220', '中国石油天然气股份有限公司滨州第10加油站', '滨州220国道服务区北加油站', '滨州市220国道14K+600（西）', '', '1', '15650359960', '0', '220', null, null, '2019-09-28 17:33:56', '1', '117.868382', '37.395002', '370000', '山东省', '371600', '滨州市', '371602', '滨城区', '0', '中石油', '', '', '37160000402');
INSERT INTO zsys_oil_station VALUES ('221', '中国石油天然气股份有限公司滨州第11加油站', '滨州220国道服务区南加油站', '滨州市220国道14K+600（东）', '', '1', '18663072768', '0', '221', null, null, '2019-09-28 17:33:57', '1', '117.870636', '37.395157', '370000', '山东省', '371600', '滨州市', '371602', '滨城区', '0', '中石油', '', '', '37160000403');
INSERT INTO zsys_oil_station VALUES ('222', '中国石油天然气股份有限公司滨州第12加油站', '邹平邹周路加油站', '邹平县邹周路中段姜家村路口', '', '1', '18654302031', '0', '222', null, null, '2019-09-28 17:33:57', '1', '117.801362', '36.827000', '370000', '山东省', '371600', '滨州市', '371626', '邹平县', '0', '中石油', '', '', '37160000404');
INSERT INTO zsys_oil_station VALUES ('223', '中国石油天然气股份有限公司滨州第14加油站', '无棣东风港加油站', '滨州市马山子镇东风港、顺河八路南侧', '', '1', '13406167230', '0', '223', null, null, '2019-09-28 17:33:57', '1', '118.514513', '38.090678', '370000', '山东省', '371600', '滨州市', '371623', '无棣县', '0', '中石油', '', '', '37160000405');
INSERT INTO zsys_oil_station VALUES ('224', '中国石油天然气股份有限公司滨州第15加油站', '无棣北外环加油站', '无棣县信阳乡大济路西、酒厂以北吴店村南 ', '', '1', '18663072715', '0', '224', null, null, '2019-09-28 17:33:57', '1', '117.635476', '37.754406', '370000', '山东省', '371600', '滨州市', '371623', '无棣县', '0', '中石油', '', '', '37160000406');
INSERT INTO zsys_oil_station VALUES ('225', '中国石油天然气股份有限公司济宁第3加油站', '济宁第3加油站', '济宁市任城区接庄镇大屯村东南济宁南外环东道路北', 'https://oss.etcsd.com/object/5cb54c6ea055fa236fb327bf', '1', '15263787221', '0', '225', null, null, '2019-09-28 17:33:57', '1', '116.383060', '35.225932', '370000', '山东省', '370800', '济宁市', '370801', '市辖区', '0', '中石油', '', '', '37080000237');
INSERT INTO zsys_oil_station VALUES ('227', '中国石油天然气股份有限公司滨州第16加油站', '无棣信阳加油站', '无棣县信阳乡通判钢材大世界北、大济路西侧', '', '1', '15553378119', '0', '227', null, null, '2019-09-28 17:33:58', '1', '117.633637', '37.827541', '370000', '山东省', '371600', '滨州市', '371623', '无棣县', '0', '中石油', '', '', '37160000407');
INSERT INTO zsys_oil_station VALUES ('228', '中国石油天然气股份有限公司滨州第17加油站', '博兴兴福加油站', '博兴县湖滨镇寨卢村南、潍博路（323省道）北侧', '', '1', '18506490606', '0', '228', null, null, '2019-09-28 17:33:58', '1', '118.240184', '37.088683', '370000', '山东省', '371600', '滨州市', '371625', '博兴县', '0', '中石油', '', '', '37160000408');
INSERT INTO zsys_oil_station VALUES ('229', '中国石油天然气股份有限公司济宁第5加油站', '济宁第5加油站', '济宁市市中区东五里营', 'https://oss.etcsd.com/object/5cb54c70549ecdf1d78c0a8c', '1', '05373296769', '0', '229', null, null, '2019-09-28 17:33:58', '1', '116.616258', '35.398267', '370000', '山东省', '370800', '济宁市', '370801', '市辖区', '0', '中石油', '', '', '37080000238');
INSERT INTO zsys_oil_station VALUES ('230', '中国石油天然气股份有限公司济宁第6加油站', '济宁第6加油站', '济宁市市中区王母阁路', 'https://oss.etcsd.com/object/5cb54c70549ecdf1d78c0a93', '1', '15263787223', '0', '230', null, null, '2019-09-28 17:33:58', '1', '116.582431', '35.397828', '370000', '山东省', '370800', '济宁市', '370801', '市辖区', '0', '中石油', '', '', '37080000239');
INSERT INTO zsys_oil_station VALUES ('231', '中国石油天然气股份有限公司滨州第18加油站', '沾化大高加油站', '滨州市沾化区大高镇何家桥村205国道南侧', '', '1', '13455785635', '0', '231', null, null, '2019-09-28 17:33:58', '1', '117.818799', '37.647569', '370000', '山东省', '371600', '滨州市', '371603', '沾化区', '0', '中石油', '', '', '37160000409');
INSERT INTO zsys_oil_station VALUES ('232', '中国石油天然气股份有限公司滨州第20加油站', '邹平月河桥加油站', '邹平县城东6.3公里路北(邹长路)月河桥边', '', '1', '18663072782', '0', '232', null, null, '2019-09-28 17:33:59', '1', '117.836875', '36.888840', '370000', '山东省', '371600', '滨州市', '371626', '邹平县', '0', '中石油', '', '', '37160000410');
INSERT INTO zsys_oil_station VALUES ('233', '中国石油天然气股份有限公司滨州第21加油站', '北海疏港路加油站', '滨州北海经济开发区疏港路与滨港一路交叉口路西', '', '1', '18663073993', '0', '233', null, null, '2019-09-28 17:33:59', '1', '117.926935', '37.015034', '370000', '山东省', '371600', '滨州市', '371623', '无棣县', '0', '中石油', '', '', '37160000411');
INSERT INTO zsys_oil_station VALUES ('234', '中国石油天然气股份有限公司滨州第22加油站', '沾化南外环加油站', '滨州沾化区迎宾路与滨孤路交汇处、滨孤路路南 ', '', '1', '18654357843', '0', '234', null, null, '2019-09-28 17:33:59', '1', '118.126355', '37.686737', '370000', '山东省', '371600', '滨州市', '371603', '沾化区', '0', '中石油', '', '', '37160000412');
INSERT INTO zsys_oil_station VALUES ('235', '中国石油天然气股份有限公司济宁第7加油站', '济宁第7加油站', '济宁市济北新区二十里铺镇驻地北，吕庄村西，位于105国道589公里路西', 'https://oss.etcsd.com/object/5cb54c71a055fa236fb327c5', '1', '15269765336', '0', '235', null, null, '2019-09-28 17:33:59', '1', '116.537356', '35.515750', '370000', '山东省', '370800', '济宁市', '370801', '市辖区', '0', '中石油', '', '', '37080000240');
INSERT INTO zsys_oil_station VALUES ('236', '中国石油天然气股份有限公司济宁第8加油站', '济宁第8加油站', '济宁市市中区安居镇西正桥村北位于105国道659公里处路东', 'https://oss.etcsd.com/object/5cb54c72549ecdf1d78c0a98', '1', '15263787237', '0', '236', null, null, '2019-09-28 17:33:59', '1', '116.526083', '35.342689', '370000', '山东省', '370800', '济宁市', '370801', '市辖区', '0', '中石油', '', '', '37080000241');
INSERT INTO zsys_oil_station VALUES ('237', '中国石油天然气股份有限公司滨州第23加油站', '沾化城北工业园加油站', '沾化区城北工业园温州大道与清风一路交叉口东南角', '', '1', '18663097701', '0', '237', null, null, '2019-09-28 17:33:59', '1', '118.172109', '37.793128', '370000', '山东省', '371600', '滨州市', '371603', '沾化区', '0', '中石油', '', '', '37160000413');
INSERT INTO zsys_oil_station VALUES ('238', '中国石油天然气股份有限公司济宁第9加油站', '济宁第9加油站', '济宁市市中区车站西路144号', 'https://oss.etcsd.com/object/5cb54c73549ecdf1d78c0a9d', '1', '15263787225', '0', '238', null, null, '2019-09-28 17:34:00', '1', '116.560042', '35.379964', '370000', '山东省', '370800', '济宁市', '370801', '市辖区', '0', '中石油', '', '', '37080000242');
INSERT INTO zsys_oil_station VALUES ('239', '中国石油天然气股份有限公司济宁高新区第2加油站', '济宁高新区第2加油站', '济宁市327国道许厂煤矿入口', 'https://oss.etcsd.com/object/5cb54c74549ecdf1d78c0aa2', '1', '15263787226', '0', '239', null, null, '2019-09-28 17:34:00', '1', '116.677725', '35.444844', '370000', '山东省', '370800', '济宁市', '370801', '市辖区', '0', '中石油', '', '', '37080000243');
INSERT INTO zsys_oil_station VALUES ('240', '中国石油天然气股份有限公司滨州第25加油站', '滨大高速四号口加油站', '滨城区永莘路（316省道）与滨大高速路交叉口西北侧', '', '1', '13256281618', '0', '240', null, null, '2019-09-28 17:34:00', '1', '117.915048', '37.499591', '370000', '山东省', '371600', '滨州市', '371602', '滨城区', '0', '中石油', '', '', '37160000414');
INSERT INTO zsys_oil_station VALUES ('241', '中国石油天然气股份有限公司济宁高新区第4加油站', '济宁高新区第4加油站', '济宁高新区黄屯镇黄金屯村北，327国道', 'https://oss.etcsd.com/object/5cb54c75549ecdf1d78c0aa7', '1', '15263787227', '0', '241', null, null, '2019-09-28 17:34:00', '1', '116.677725', '35.444844', '370000', '山东省', '370800', '济宁市', '370801', '市辖区', '0', '中石油', '', '', '37080000244');
INSERT INTO zsys_oil_station VALUES ('242', '中国石油天然气股份有限公司滨州第26加油站', '滨大高速三号口加油站', '滨州市滨城区220国道与滨大高速交叉口以东路北', '', '1', '18663072781', '0', '242', null, null, '2019-09-28 17:34:00', '1', '117.918268', '37.425207', '370000', '山东省', '371600', '滨州市', '371602', '滨城区', '0', '中石油', '', '', '37160000415');
INSERT INTO zsys_oil_station VALUES ('243', '中国石油天然气股份有限公司滨州第27加油站', '滨北加油站', '滨州市渤海五路（205国道）西、梧桐五路北', '', '1', '18663072771', '0', '243', null, null, '2019-09-28 17:34:01', '1', '117.988102', '37.476295', '370000', '山东省', '371600', '滨州市', '371602', '滨城区', '0', '中石油', '', '', '37160000416');
INSERT INTO zsys_oil_station VALUES ('244', '中国石油天然气股份有限公司滨州第28加油站', '邹平东外环加油站', '邹平县鹤伴三路与醴泉一路交叉路口西南角', '', '1', '15615980405', '0', '244', null, null, '2019-09-28 17:34:01', '1', '117.820610', '36.889785', '370000', '山东省', '371600', '滨州市', '371626', '邹平县', '0', '中石油', '', '', '37160000417');
INSERT INTO zsys_oil_station VALUES ('245', '中国石油天然气股份有限公司滨州第29加油站', '惠民桑落墅加油站', '惠民县桑阳路与永莘路交叉口西北角（惠民县桑落墅镇桑北街村）', '', '1', '17605437377', '0', '245', null, null, '2019-09-28 17:34:01', '1', '117.737950', '37.519885', '370000', '山东省', '371600', '滨州市', '371621', '惠民县', '0', '中石油', '', '', '37160000418');
INSERT INTO zsys_oil_station VALUES ('246', '中国石油天然气股份有限公司嘉祥第1加油站', '嘉祥第1加油站', '济宁市嘉祥县兖兰东街40号路南', 'https://oss.etcsd.com/object/5cb54c76a055fa236fb327c8', '1', '05373376695', '0', '246', null, null, '2019-09-28 17:34:01', '1', '116.336864', '35.407675', '370000', '山东省', '370800', '济宁市', '370829', '嘉祥县', '0', '中石油', '', '', '37080000257');
INSERT INTO zsys_oil_station VALUES ('247', '中国石油天然气股份有限公司嘉祥第5加油站', '嘉祥第5加油站', '济宁市嘉祥县县城西关，327国道，355.7公里处北', 'https://oss.etcsd.com/object/5cb54c77549ecdf1d78c0aab', '1', '05373303107', '0', '247', null, null, '2019-09-28 17:34:01', '1', '116.323392', '35.403136', '370000', '山东省', '370800', '济宁市', '370829', '嘉祥县', '0', '中石油', '', '', '37080000258');
INSERT INTO zsys_oil_station VALUES ('248', '中国石油天然气股份有限公司金乡第4加油站', '金乡第4加油站', '金乡县金乡镇霍古村西位于G105公路654.4公里处路西', 'https://oss.etcsd.com/object/5cb54c77a055fa236fb327cd', '1', '15263787232', '0', '248', null, null, '2019-09-28 17:34:01', '1', '116.264703', '35.032553', '370000', '山东省', '370800', '济宁市', '370828', '金乡县', '0', '中石油', '', '', '37080000259');
INSERT INTO zsys_oil_station VALUES ('249', '中国石油天然气股份有限公司金乡第5加油站', '金乡第5加油站', '金乡县金乡镇十里铺村收费站北105国道642公里处东', 'https://oss.etcsd.com/object/5cb54c78a055fa236fb327d0', '1', '15092620932', '0', '249', null, null, '2019-09-28 17:34:01', '1', '116.315067', '35.101419', '370000', '山东省', '370800', '济宁市', '370828', '金乡县', '0', '中石油', '', '', '37080000260');
INSERT INTO zsys_oil_station VALUES ('250', '中国石油天然气股份有限公司滨州第31加油站', '博兴广青路加油站', '滨州市博兴县高庙李村北、广青路以南', '', '1', '15865220458', '0', '250', null, null, '2019-09-28 17:34:02', '1', '118.128209', '37.266757', '370000', '山东省', '371600', '滨州市', '371625', '博兴县', '0', '中石油', '', '', '37160000419');
INSERT INTO zsys_oil_station VALUES ('251', '中国石油天然气股份有限公司金乡第7加油站', '金乡第7加油站', '金乡县西关大街路西', 'https://oss.etcsd.com/object/5cb54c79549ecdf1d78c0ab0', '1', '15269766728', '0', '251', null, null, '2019-09-28 17:34:02', '1', '116.312031', '35.091678', '370000', '山东省', '370800', '济宁市', '370828', '金乡县', '0', '中石油', '', '', '37080000261');
INSERT INTO zsys_oil_station VALUES ('252', '中国石油天然气股份有限公司梁山第1加油站', '梁山第1加油站', '梁山镇独山山村南水泊南路南端', 'https://oss.etcsd.com/object/5cb54c7aa055fa236fb327d5', '1', '15263787233', '0', '252', null, null, '2019-09-28 17:34:02', '1', '121.453978', '31.217264', '370000', '山东省', '370800', '济宁市', '370832', '梁山县', '0', '中石油', '', '', '37080000251');
INSERT INTO zsys_oil_station VALUES ('253', '中国石油天然气股份有限公司滨州第32加油站', '无棣新海工业园加油站', '无棣新海工业园（无棣海洋化工产业园）、新海路南侧', '', '1', '15550610290', '0', '253', null, null, '2019-09-28 17:34:02', '1', '117.465500', '37.572900', '370000', '山东省', '371600', '滨州市', '371623', '无棣县', '0', '中石油', '', '', '37160000420');
INSERT INTO zsys_oil_station VALUES ('254', '中国石油天然气股份有限公司梁山第2加油站', '梁山第2加油站', '梁山县梁山镇前码头村220国道西侧', 'https://oss.etcsd.com/object/5cb54c7ba055fa236fb327da', '1', '15263787235', '0', '254', null, null, '2019-09-28 17:34:02', '1', '116.099997', '35.838475', '370000', '山东省', '370800', '济宁市', '370832', '梁山县', '0', '中石油', '', '', '37080000252');
INSERT INTO zsys_oil_station VALUES ('255', '中国石油天然气股份有限公司曲阜第3加油站', '曲阜第3加油站', '济宁市曲阜西环路东罗汉村西', 'https://oss.etcsd.com/object/5cb54c7c549ecdf1d78c0ab4', '1', '15263787261', '0', '255', null, null, '2019-09-28 17:34:02', '1', '116.943850', '35.602086', '370000', '山东省', '370800', '济宁市', '370881', '曲阜市', '0', '中石油', '', '', '37080000265');
INSERT INTO zsys_oil_station VALUES ('256', '中国石油天然气股份有限公司滨州第33加油站', '沾化富国路加油站', '沾化国税局往东1000米，七天酒店斜对面', '', '1', '15564363317', '0', '256', null, null, '2019-09-28 17:34:03', '1', '118.158311', '37.699058', '370000', '山东省', '371600', '滨州市', '371603', '沾化区', '0', '中石油', '', '', '37160000421');
INSERT INTO zsys_oil_station VALUES ('257', '中国石油天然气股份有限公司曲阜第6加油站', '曲阜第6加油站', '济宁市曲阜裕隆路9号', 'https://oss.etcsd.com/object/5cb54c7ca055fa236fb327e0', '1', '15263787288', '0', '257', null, null, '2019-09-28 17:34:03', '1', '116.949031', '35.590972', '370000', '山东省', '370800', '济宁市', '370881', '曲阜市', '0', '中石油', '', '', '37080000266');
INSERT INTO zsys_oil_station VALUES ('258', '中国石油天然气股份有限公司滨州第35加油站', '邹平台子加油站', '滨州市邹平县台子镇商贸区 ', '', '1', '18765084837', '0', '258', null, null, '2019-09-28 17:34:03', '1', '117.514315', '37.090671', '370000', '山东省', '371600', '滨州市', '371626', '邹平县', '0', '中石油', '', '', '37160000422');
INSERT INTO zsys_oil_station VALUES ('259', '中国石油天然气股份有限公司微山第3加油站', '微山第3加油站', '济宁市微山县夏镇104公路698公里处路西', 'https://oss.etcsd.com/object/5cb54c7da055fa236fb327e3', '1', '05373625399', '0', '259', null, null, '2019-09-28 17:34:03', '1', '117.126806', '34.816011', '370000', '山东省', '370800', '济宁市', '370826', '微山县', '0', '中石油', '', '', '37080000267');
INSERT INTO zsys_oil_station VALUES ('260', '中国石油天然气股份有限公司微山第5加油站', '微山第5加油站', '济宁市微山县韩庄镇，104国道734公里处+100米路西', 'https://oss.etcsd.com/object/5cb54c7e549ecdf1d78c0ab8', '1', '15215473515', '0', '260', null, null, '2019-09-28 17:34:03', '1', '117.370331', '34.599042', '370000', '山东省', '370800', '济宁市', '370826', '微山县', '0', '中石油', '', '', '37080000268');
INSERT INTO zsys_oil_station VALUES ('261', '中国石油天然气股份有限公司邹城第1加油站', '邹城第1加油站', '邹城市北宿镇马楼村北位于岚济公路259公里处路南', 'https://oss.etcsd.com/object/5cb54c80549ecdf1d78c0abd', '1', '15092630501', '0', '261', null, null, '2019-09-28 17:34:04', '1', '116.849519', '35.337200', '370000', '山东省', '370800', '济宁市', '370883', '邹城市', '0', '中石油', '', '', '37080000253');
INSERT INTO zsys_oil_station VALUES ('262', '中国石油天然气股份有限公司邹城第2加油站', '邹城第2加油站', '邹城市城前西路路北', 'https://oss.etcsd.com/object/5cb54c82a055fa236fb327e6', '1', '15269793309', '0', '262', null, null, '2019-09-28 17:34:04', '1', '116.963431', '35.375756', '370000', '山东省', '370800', '济宁市', '370883', '邹城市', '0', '中石油', '', '', '37080000254');
INSERT INTO zsys_oil_station VALUES ('263', '中国石油天然气股份有限公司邹城第3加油站', '邹城第3加油站', '邹城市看庄镇驻地204国道655公里处路东', 'https://oss.etcsd.com/object/5cb54c84549ecdf1d78c0ac4', '1', '05373623306', '0', '263', null, null, '2019-09-28 17:34:04', '1', '117.029022', '35.257161', '370000', '山东省', '370800', '济宁市', '370883', '邹城市', '0', '中石油', '', '', '37080000255');
INSERT INTO zsys_oil_station VALUES ('264', '中国石油天然气股份有限公司邹城第6加油站', '邹城第6加油站', '邹城市岚济路237公里处京福高速路口', 'https://oss.etcsd.com/object/5cb54c86549ecdf1d78c0acc', '1', '15263787259', '0', '264', null, null, '2019-09-28 17:34:04', '1', '117.059503', '35.410706', '370000', '山东省', '370800', '济宁市', '370883', '邹城市', '0', '中石油', '', '', '37080000256');
INSERT INTO zsys_oil_station VALUES ('265', '中国石油天然气股份有限公司兖州第2加油站', '兖州第2加油站', '兖州市南环城路，日东（兰）高速兖州上道口处', 'https://oss.etcsd.com/object/5cb54c87a055fa236fb327ee', '1', '15269701237', '0', '265', null, null, '2019-09-28 17:34:04', '1', '116.841431', '35.553228', '370000', '山东省', '370800', '济宁市', '370812', '兖州区', '0', '中石油', '', '', '37080000245');
INSERT INTO zsys_oil_station VALUES ('266', '中国石油天然气股份有限公司兖州第4加油站', '兖州第4加油站', '兖州市新兖镇济威公路与外环路交叉东南角', 'https://oss.etcsd.com/object/5cb54c88a055fa236fb327f4', '1', '15263787267', '0', '266', null, null, '2019-09-28 17:34:04', '1', '116.618817', '35.438586', '370000', '山东省', '370800', '济宁市', '370812', '兖州区', '0', '中石油', '', '', '37080000246');
INSERT INTO zsys_oil_station VALUES ('267', '中国石油天然气股份有限公司兖州第5加油站', '兖州第5加油站', '兖州市兴隆庄镇三官庙村北兖邹公路106公里处', 'https://oss.etcsd.com/object/5cb54c89a055fa236fb327f9', '1', '15263787258', '0', '267', null, null, '2019-09-28 17:34:05', '1', '116.841217', '35.520244', '370000', '山东省', '370800', '济宁市', '370812', '兖州区', '0', '中石油', '', '', '37080000247');
INSERT INTO zsys_oil_station VALUES ('268', '阳信滨德高速加油站', '阳信滨德高速加油站', '阳信县劳店乡张善村西', '', '1', '15662012235', '0', '268', null, null, '2019-09-28 17:34:05', '1', '117.687489', '37.694490', '370000', '山东省', '371600', '滨州市', '371622', '阳信县', '0', '中石油', '', '', '37160000437');
INSERT INTO zsys_oil_station VALUES ('269', '中国石油天然气股份有限公司兖州第6加油站', '兖州第6加油站', '济宁市农业高新技术示范园东，南护城河路南侧', 'https://oss.etcsd.com/object/5cb54c89549ecdf1d78c0ad2', '1', '05373620750', '0', '269', null, null, '2019-09-28 17:34:05', '1', '116.776669', '35.503086', '370000', '山东省', '370800', '济宁市', '370812', '兖州区', '0', '中石油', '', '', '37080000248');
INSERT INTO zsys_oil_station VALUES ('270', '滨州黄河公铁大桥北岸加油站', '滨州黄河公铁大桥北岸加油站', '滨州市黄河公铁路桥北岸服务区内', '', '1', '15605430136', '0', '270', null, null, '2019-09-28 17:34:05', '1', '118.423000', '37.199000', '370000', '山东省', '371600', '滨州市', '371602', '滨城区', '0', '中石油', '', '', '37160000438');
INSERT INTO zsys_oil_station VALUES ('271', '中国石油天然气股份有限公司汶上第1加油站', '汶上第1加油站', '济宁市汶上县城圣泽大街25号路北', 'https://oss.etcsd.com/object/5cb54c8b549ecdf1d78c0ad6', '1', '15263787256', '0', '271', null, null, '2019-09-28 17:34:05', '1', '116.473339', '35.721772', '370000', '山东省', '370800', '济宁市', '370830', '汶上县', '0', '中石油', '', '', '37080000262');
INSERT INTO zsys_oil_station VALUES ('272', '中国石油天然气股份有限公司汶上第4加油站', '汶上第4加油站', '汶上县郭仓乡李官村北位于105国道536公里处', 'https://oss.etcsd.com/object/5cb54c8b549ecdf1d78c0adc', '1', '​15206376337', '0', '272', null, null, '2019-09-28 17:34:05', '1', '135.425467', '16.978608', '370000', '山东省', '370800', '济宁市', '370830', '汶上县', '0', '中石油', '', '', '37080000263');
INSERT INTO zsys_oil_station VALUES ('273', '中国石油天然气股份有限公司汶上第5加油站', '汶上第5加油站', '汶上县南一环路与西一环路交叉口西北角', 'https://oss.etcsd.com/object/5cb54c8ca055fa236fb327fd', '1', '15253709106', '0', '273', null, null, '2019-09-28 17:34:06', '1', '116.277794', '35.069033', '370000', '山东省', '370800', '济宁市', '370830', '汶上县', '0', '中石油', '', '', '37080000264');
INSERT INTO zsys_oil_station VALUES ('274', '中国石油天然气股份有限公司泗水第3加油站', '泗水第3加油站', '济宁市泗水县泉丰路与圣安路交叉口西北角', 'https://oss.etcsd.com/object/5cb54c8d549ecdf1d78c0adf', '1', '15715370928', '0', '274', null, null, '2019-09-28 17:34:06', '1', '117.231942', '35.643522', '370000', '山东省', '370800', '济宁市', '370831', '泗水县', '0', '中石油', '', '', '37080000249');
INSERT INTO zsys_oil_station VALUES ('276', '中国石油天然气股份有限公司泗水第6加油站', '泗水第6加油站', '泗水县泉源大道东段路北', 'https://oss.etcsd.com/object/5cb54c8fa055fa236fb32802', '1', '15263787255', '0', '276', null, null, '2019-09-28 17:34:06', '1', '117.293572', '35.657122', '370000', '山东省', '370800', '济宁市', '370831', '泗水县', '0', '中石油', '', '', '37080000250');
INSERT INTO zsys_oil_station VALUES ('278', '滨州黄河公铁大桥南岸加油站', '滨州黄河公铁大桥南岸加油站', '滨州市黄河公铁路桥南服务区内', '', '1', '13305434499', '0', '278', null, null, '2019-09-28 17:34:06', '1', '118.085987', '37.326574', '370000', '山东省', '371600', '滨州市', '371602', '滨城区', '0', '中石油', '', '', '37160000439');
INSERT INTO zsys_oil_station VALUES ('279', '东外环加油站', '东外环加油站', '永莘路和东外环交叉口往南100米路东', '', '1', '18663072709', '0', '279', null, null, '2019-09-28 17:34:06', '1', '118.080732', '37.490107', '370000', '山东省', '371600', '滨州市', '371602', '滨城区', '0', '中石油', '', '', '37160000443');
INSERT INTO zsys_oil_station VALUES ('280', '府前加油站', '府前加油站', '滨州黄河二路路南渤海十七路以西500米', '', '1', '18663072781', '0', '280', null, null, '2019-09-28 17:34:06', '1', '117.970510', '37.377748', '370000', '山东省', '371600', '滨州市', '371601', '市辖区', '0', '中石油', '', '', '37160000446');
INSERT INTO zsys_oil_station VALUES ('287', '中海油销售天津有限公司海兴第一加油站', '海兴服务区中海油第一加油站', '河北省沧州市海兴县津汕高速公路海兴服务区东区', '', null, '18630703777', '0', '287', null, null, '2019-09-28 17:34:07', '1', '117.515786', '38.106338', '130000', '河北省', '130900', '沧州市', '130924', '海兴县', '1', '中海油', '', '', '13090000001');
INSERT INTO zsys_oil_station VALUES ('292', '中海油销售天津有限公司海兴第二加油站', '海兴服务区中海油第二加油站', '河北省沧州市海兴县津汕高速公路海兴服务区西区', '', null, '18630703777', '0', '292', null, null, '2019-09-28 17:34:07', '1', '117.516282', '38.104191', '130000', '河北省', '130900', '沧州市', '130924', '海兴县', '1', '中海油', '', '', '13090000002');
INSERT INTO zsys_oil_station VALUES ('300', '新沂加油站北区', '新沂加油站北区', '江苏省徐州市新沂市高流镇京沪高速新沂服务区', '', null, '13952282789', '0', '300', null, null, '2019-09-28 17:34:07', '1', '118.546145', '34.336259', '320000', '江苏省', '320300', '徐州市', '320381', '新沂市', '1', '江苏高速石油', 'G2', '京沪高速', '32030000001');
INSERT INTO zsys_oil_station VALUES ('301', '新沂加油站南区', '新沂加油站南区', '江苏省徐州市新沂市高流镇京沪高速新沂服务区', '', null, '13952282789', '0', '301', null, null, '2019-09-28 17:34:07', '1', '118.548489', '34.333822', '320000', '江苏省', '320300', '徐州市', '320381', '新沂市', '1', '江苏高速石油', 'G2', '京沪高速', '32030000001');
INSERT INTO zsys_oil_station VALUES ('302', '范水加油站东区', '范水加油站东区', '江苏省扬州市宝应县京沪高速公路范水服务区（G2京沪高速K892两侧）', '', null, '13655270193', '0', '302', null, null, '2019-09-28 17:34:07', '1', '119.436111', '33.095556', '320000', '江苏省', '321000', '扬州市', '321023', '宝应县', '1', '江苏高速石油', 'G2', '京沪高速', '32100000001');
INSERT INTO zsys_oil_station VALUES ('303', '范水加油站西区', '范水加油站西区', '江苏省扬州市宝应县京沪高速公路范水服务区（G2京沪高速K892两侧）', '', null, '13655270193', '0', '303', null, null, '2019-09-28 17:34:08', '1', '119.436111', '33.095556', '320000', '江苏省', '321000', '扬州市', '321023', '宝应县', '1', '江苏高速石油', 'G2', '京沪高速', '32100000001');
INSERT INTO zsys_oil_station VALUES ('304', '青山泉加油站东区', '青山泉加油站东区', '徐州市贾汪区青山泉镇后柿庄高速公路青山泉服务区加油站', '', null, '15262035533', '0', '304', null, null, '2019-09-28 17:34:08', '1', '117.194700', '34.235580', '320000', '江苏省', '320300', '徐州市', '320305', '贾汪区', '1', '江苏高速石油', 'G3', '京台高速', '32030000002');
INSERT INTO zsys_oil_station VALUES ('305', '青山泉加油站西区', '青山泉加油站西区', '徐州市贾汪区青山泉镇后柿庄高速公路青山泉服务区加油站', '', null, '15262035533', '0', '305', null, null, '2019-09-28 17:34:08', '1', '117.193740', '34.235260', '320000', '江苏省', '320300', '徐州市', '320305', '贾汪区', '1', '江苏高速石油', 'G3', '京台高速', '32030000002');
INSERT INTO zsys_oil_station VALUES ('306', '毕庄加油站南区', '毕庄加油站南区', '江苏省徐州市铜山区毕庄村（连霍高速225MK处）', '', null, '15252181158', '0', '306', null, null, '2019-09-28 17:34:08', '1', '117.234153', '34.165988', '320000', '江苏省', '320300', '徐州市', '320312', '铜山区', '1', '江苏高速石油', 'G30', '连霍高速', '32030000003');
INSERT INTO zsys_oil_station VALUES ('307', '毕庄加油站北区', '毕庄加油站北区', '江苏省徐州市铜山区毕庄村（连霍高速225MK处）', '', null, '15252181158', '0', '307', null, null, '2019-09-28 17:34:08', '1', '117.234428', '34.167198', '320000', '江苏省', '320300', '徐州市', '320312', '铜山区', '1', '江苏高速石油', 'G30', '连霍高速', '32030000003');
INSERT INTO zsys_oil_station VALUES ('308', '沙河加油站北区', '沙河加油站北区', '赣榆区沙河镇（殷庄）邵庄村（G25连临高速1666KM处）', '', null, '15161306863', '0', '308', null, null, '2019-09-28 17:34:08', '1', '119.022586', '34.803086', '320000', '江苏省', '320700', '连云港市', '320707', '赣榆区', '1', '江苏高速石油', '', '', '32070000001');
INSERT INTO zsys_oil_station VALUES ('309', '滨海服务区加油站东区', '滨海服务区加油站东区', '盐城市滨海县正红镇大港村（G15沈海高速K937.0两侧）', '', null, '15862081273', '0', '309', null, null, '2019-09-28 17:34:09', '1', '120.186943', '33.967785', '320000', '江苏省', '320900', '盐城市', '320922', '滨海县', '1', '江苏高速石油', 'G15', '沈海高速', '32090000003');
INSERT INTO zsys_oil_station VALUES ('310', '滨海服务区加油站西区', '滨海服务区加油站西区', '盐城市滨海县正红镇大港村（G15沈海高速K937.0两侧）', '', null, '15862081273', '0', '310', null, null, '2019-09-28 17:34:09', '1', '120.183891', '33.925284', '320000', '江苏省', '320900', '盐城市', '320922', '滨海县', '1', '江苏高速石油', 'G15', '沈海高速', '32090000003');
INSERT INTO zsys_oil_station VALUES ('311', '大丰服务区加油站东区', '大丰服务区加油站东区', '大丰区西团镇大龙村大丰服务区加油站(K1036+380)', '', null, '1595022043', '0', '311', null, null, '2019-09-28 17:34:09', '1', '120.610280', '33.306110', '320000', '江苏省', '320900', '盐城市', '320904', '大丰区', '1', '江苏高速石油', 'G15', '沈海高速', '32090000004');
INSERT INTO zsys_oil_station VALUES ('312', '大丰服务区加油站西区', '大丰服务区加油站西区', '大丰区西团镇大龙村大丰服务区加油站(K1036+380)', '', null, '1595022043', '0', '312', null, null, '2019-09-28 17:34:09', '1', '120.580280', '33.272780', '320000', '江苏省', '320900', '盐城市', '320904', '大丰区', '1', '江苏高速石油', 'G15', '沈海高速', '32090000004');
INSERT INTO zsys_oil_station VALUES ('313', '如皋服务区加油站东区', '如皋服务区加油站东区', '江苏省如皋市白蒲镇林梓社区沈海高速如皋服务区（G15沈海高速1138KM处）', '', null, '13813112929', '0', '313', null, null, '2019-09-28 17:34:10', '1', '120.777651', '32.299312', '320000', '江苏省', '320600', '南通市', '320682', '如皋市', '1', '江苏高速石油', 'G15', '沈海高速', '32060000002');
INSERT INTO zsys_oil_station VALUES ('314', '如皋服务区加油站西区', '如皋服务区加油站西区', '江苏省如皋市白蒲镇林梓社区沈海高速如皋服务区（G15沈海高速1138KM处）', '', null, '13813112929', '0', '314', null, null, '2019-09-28 17:34:10', '1', '120.777112', '32.297054', '320000', '江苏省', '320600', '南通市', '320682', '如皋市', '1', '江苏高速石油', 'G15', '沈海高速', '32060000002');
INSERT INTO zsys_oil_station VALUES ('315', '川星服务区加油站东区', '川星服务区加油站东区', '淮安市淮阴区老张集乡川星镇（京沪高速805公里处）', '', null, '15252295011', '0', '315', null, null, '2019-09-28 17:34:10', '1', '119.036111', '33.799167', '320000', '江苏省', '320800', '淮安市', '320803', '淮安区', '1', '江苏高速石油', 'G805', '京沪高速G805', '32080000001');
INSERT INTO zsys_oil_station VALUES ('316', '川星服务区加油站西区', '川星服务区加油站西区', '淮安市淮阴区老张集乡川星镇（京沪高速805公里处）', '', null, '15252295011', '0', '316', null, null, '2019-09-28 17:34:10', '1', '119.038611', '33.797222', '320000', '江苏省', '320800', '淮安市', '320803', '淮安区', '1', '江苏高速石油', 'G805', '京沪高速G805', '32080000001');
INSERT INTO zsys_oil_station VALUES ('317', '龙奔服务区加油站东区', '龙奔服务区加油站东区', '江苏省扬州市高邮市卸甲镇周邶墩村龙奔服务区（G2京沪高速K931两侧）', '', null, '15952506696', '0', '317', null, null, '2019-09-28 17:34:11', '1', '119.518936', '32.771206', '320000', '江苏省', '321000', '扬州市', '321084', '高邮市', '1', '江苏高速石油', 'G2', '京沪高速', '32100000002');
INSERT INTO zsys_oil_station VALUES ('318', '德上高速鄄城服务区西区加油站', '鄄城服务区西区加油站', '菏泽市鄄城县凤凰镇两半张庄德上路高速251公里处', '', null, '15550193939', '0', '318', null, null, '2019-09-28 17:34:11', '1', '115.587410', '35.821270', '370000', '山东省', '371700', '菏泽市', '371726', '鄄城县', '1', '其它', 'G3W', '德上高速', '37170000460');
INSERT INTO zsys_oil_station VALUES ('319', '德上高速鄄城服务区东区加油站', '鄄城服务区东区加油站', '菏泽市鄄城县凤凰镇两半张庄德上路高速251公里处', '', null, '15550193939', '0', '319', null, null, '2019-09-28 17:34:11', '1', '115.587710', '35.583710', '370000', '山东省', '371700', '菏泽市', '371726', '鄄城县', '1', '其它', 'G3W', '德上高速', '37170000460');
INSERT INTO zsys_oil_station VALUES ('320', '龙奔服务区加油站西区', '龙奔服务区加油站西区', '江苏省扬州市高邮市卸甲镇周邶墩村龙奔服务区（G2京沪高速K931两侧）', '', null, '15952506696', '0', '320', null, null, '2019-09-28 17:34:11', '1', '119.518669', '32.768543', '320000', '江苏省', '321000', '扬州市', '321084', '高邮市', '1', '江苏高速石油', 'G2', '京沪高速', '32100000002');
INSERT INTO zsys_oil_station VALUES ('321', '日兰高速曹州服务区北区加油站', '曹州服务区北区加油站', '山东省菏泽市牡丹区大黄集镇曹州服务区郑州方向', '', null, '15315309906', '0', '321', null, null, '2019-09-28 17:34:12', '1', '115.284005', '35.079430', '370000', '山东省', '371700', '菏泽市', '371702', '牡丹区', '1', '其它', 'G1511', '日南（日照至南阳）高速', '37170000366');
INSERT INTO zsys_oil_station VALUES ('322', '日兰高速曹州服务区南区加油站', '曹州服务区南区加油站', '山东省菏泽市牡丹区大黄集镇曹州服务区济南方向', '', null, '15315309906', '0', '322', null, null, '2019-09-28 17:34:12', '1', '115.299248', '35.085358', '370000', '山东省', '371700', '菏泽市', '371702', '牡丹区', '1', '其它', 'G1511', '日南（日照至南阳）高速', '37170000366');
INSERT INTO zsys_oil_station VALUES ('323', '灌云服务区加油站东区', '灌云服务区加油站东区', '灌云县杨集镇界圩中心社区沈海高速灌云服务区（G15沈海高速867KM处）', '', null, '13770293635', '0', '323', null, null, '2019-09-28 17:34:12', '1', '119.665830', '34.368330', '320000', '江苏省', '320700', '连云港市', '320723', '灌云县', '1', '江苏高速石油', 'G15', '沈海高速', '32070000004');
INSERT INTO zsys_oil_station VALUES ('326', '灌云服务区加油站西区', '灌云服务区加油站西区', '灌云县杨集镇界圩中心社区沈海高速灌云服务区（G15沈海高速867KM处）', '', null, '13770293635', '0', '326', null, null, '2019-09-28 17:34:12', '1', '119.665560', '34.360583', '320000', '江苏省', '320700', '连云港市', '320723', '灌云县', '1', '江苏高速石油', 'G15', '沈海高速', '32070000004');
INSERT INTO zsys_oil_station VALUES ('329', '东台服务区加油站东区', '东台服务区加油站东区', '东台市富安镇小东村东台服务区加油站（K1083+254)', '', null, '13962062833', '0', '329', null, null, '2019-09-28 17:34:12', '1', '120.493160', '32.706925', '320000', '江苏省', '320900', '盐城市', '320981', '东台市', '1', '江苏高速石油', 'G15', '沈海高速', '32090000005');
INSERT INTO zsys_oil_station VALUES ('330', '东台服务区加油站西区', '东台服务区加油站西区', '东台市富安镇小东村东台服务区加油站（K1083+254)', '', null, '13962062833', '0', '330', null, null, '2019-09-28 17:34:12', '1', '120.492412', '32.704612', '320000', '江苏省', '320900', '盐城市', '320981', '东台市', '1', '江苏高速石油', 'G15', '沈海高速', '32090000005');
INSERT INTO zsys_oil_station VALUES ('331', '中国石油天然气股份有限公司山东销售菏泽分公司第35加油站', '中石油菏泽35站', '菏泽市长江东路与郑州路交汇处东北角', '', '1', '0530-5331665', '0', '331', null, null, '2019-09-28 17:34:13', '1', '115.310000', '35.130000', '370000', '山东省', '371700', '菏泽市', '371701', '市辖区', '0', '中石油', '', '', '37170000416');
INSERT INTO zsys_oil_station VALUES ('333', '赣马服务区加油站东区', '赣马服务区加油站东区', '江苏省赣榆县赣马镇居庄村赣马服务区加油站', '', null, '13505136472', '0', '333', null, null, '2019-09-28 17:34:13', '1', '119.123890', '34.948610', '320000', '江苏省', '320700', '连云港市', '320707', '赣榆区', '1', '江苏高速石油', 'G15', '沈海高速', '32070000003');
INSERT INTO zsys_oil_station VALUES ('336', '中国石油天然气股份有限公司山东销售菏泽分公司第41加油站', '中石油菏泽第41站', '菏泽市双河立交桥东2公里路北', '', '1', '0530-5157900', '0', '336', null, null, '2019-09-28 17:34:13', '1', '115.511000', '35.257000', '370000', '山东省', '371700', '菏泽市', '371701', '市辖区', '0', '中石油', '', '', '37170000417');
INSERT INTO zsys_oil_station VALUES ('337', '赣马服务区加油站西区', '赣马服务区加油站西区', '江苏省赣榆县赣马镇居庄村赣马服务区加油站', '', null, '13505136472', '0', '337', null, null, '2019-09-28 17:34:13', '1', '119.302500', '34.927780', '320000', '江苏省', '320700', '连云港市', '320707', '赣榆区', '1', '江苏高速石油', 'G15', '沈海高速', '32070000003');
INSERT INTO zsys_oil_station VALUES ('338', '中国石油天然气股份有限公司山东销售菏泽分公司第11加油站', '中石油菏泽第11站', '菏泽市南外环路与220国道交汇口东南角', '', '1', '0530-5052100', '0', '338', null, null, '2019-09-28 17:34:14', '1', '115.232978', '35.130790', '370000', '山东省', '371700', '菏泽市', '371701', '市辖区', '0', '中石油', '', '', '37170000414');
INSERT INTO zsys_oil_station VALUES ('339', '中国石油天然气股份有限公司山东销售菏泽分公司第3加油站', '中石油菏泽第3加油站', '定陶县菏商路东侧', '', '1', '0530-2228148', '0', '339', null, null, '2019-09-28 17:34:14', '1', '115.551529', '35.079327', '370000', '山东省', '371700', '菏泽市', '371703', '定陶区', '0', '中石油', '', '', '37170000412');
INSERT INTO zsys_oil_station VALUES ('341', '中国石油天然气股份有限公司山东销售菏泽分公司第48加油站', '中石油菏泽第48加油站', '东明县黄河路南段', '', '1', '17866690948', '0', '341', null, null, '2019-09-28 17:34:14', '1', '115.656000', '35.173600', '370000', '山东省', '371700', '菏泽市', '371728', '东明县', '0', '中石油', '', '', '37170000421');
INSERT INTO zsys_oil_station VALUES ('342', '响水服务区加油站东区', '响水服务区加油站东区', '江苏省盐城市响水县老舍镇老舍社区响水服务区加油站东站', '', null, '15962036339', '0', '342', null, null, '2019-09-28 17:34:15', '1', '119.700579', '34.173152', '320000', '江苏省', '320900', '盐城市', '320921', '响水县', '1', '江苏高速石油', 'G15', '沈海高速', '32090000002');
INSERT INTO zsys_oil_station VALUES ('343', '中国石油天然气股份有限公司山东销售菏泽分公司第50加油站', '中石油菏泽第50加油站', '曹县田庄路口西50米路南', '', '1', '17866690950', '0', '343', null, null, '2019-09-28 17:34:15', '1', '115.324177', '34.501135', '370000', '山东省', '371700', '菏泽市', '371721', '曹县', '0', '中石油', '', '', '37170000423');
INSERT INTO zsys_oil_station VALUES ('344', '中国石油天然气股份有限公司山东销售菏泽分公司第62加油站', '中石油菏泽第62站', '曹县孙老家庄青公路（省道350）德商高速下道口南侧', '', '1', '17866690962', '0', '344', null, null, '2019-09-28 17:34:15', '1', '115.653683', '34.782677', '370000', '山东省', '371700', '菏泽市', '371721', '曹县', '0', '中石油', '', '', '37170000443');
INSERT INTO zsys_oil_station VALUES ('346', '中国石油天然气股份有限公司山东销售菏泽分公司第51加油站', '中石油菏泽第51加油站', '巨野县前进路老汽车站西门中国石油加油站', '', '1', '17866690951', '0', '346', null, null, '2019-09-28 17:34:15', '1', '116.053823', '35.233680', '370000', '山东省', '371700', '菏泽市', '371724', '巨野县', '0', '中石油', '', '', '37170000424');
INSERT INTO zsys_oil_station VALUES ('348', '中国石油天然气股份有限公司山东销售菏泽分公司第38加油站', '中石油菏泽第38站', '巨野县聊商路168公里处', '', '1', '17866690938', '0', '348', null, null, '2019-09-28 17:34:16', '1', '116.044000', '35.274000', '370000', '山东省', '371700', '菏泽市', '371724', '巨野县', '0', '中石油', '', '', '37170000435');
INSERT INTO zsys_oil_station VALUES ('349', '中国石油天然气股份有限公司山东销售菏泽分公司第17加油站', '中石油菏泽第17站', '郓城县育才路西段与西外环交叉路口', '', '1', '17866690917', '0', '349', null, null, '2019-09-28 17:34:16', '1', '115.544400', '35.362800', '370000', '山东省', '371700', '菏泽市', '371725', '郓城县', '0', '中石油', '', '', '37170000436');
INSERT INTO zsys_oil_station VALUES ('350', '响水服务区加油站西区', '响水服务区加油站西区', '江苏省盐城市响水县老舍镇老舍社区响水服务区加油站西站', '', null, '15962036339', '0', '350', null, null, '2019-09-28 17:34:16', '1', '119.700354', '34.171181', '320000', '江苏省', '320900', '盐城市', '320921', '响水县', '1', '江苏高速石油', 'G15', '沈海高速', '32090000002');
INSERT INTO zsys_oil_station VALUES ('351', '中国石油天然气股份有限公司山东销售菏泽分公司第49加油站', '中石油菏泽第49站', '郓城县坝头环城路', '', '1', '17866690949', '0', '351', null, null, '2019-09-28 17:34:16', '1', '115.580000', '35.360000', '370000', '山东省', '371700', '菏泽市', '371725', '郓城县', '0', '中石油', '', '', '3717000422');
INSERT INTO zsys_oil_station VALUES ('352', '长庄服务区东区', '长庄服务区东区', '沭阳县长庄居委会（G2京沪高速K762两侧）', '', null, '13861550379', '0', '352', null, null, '2019-09-28 17:34:17', '1', '118.798779', '34.139423', '320000', '江苏省', '321300', '宿迁市', '321322', '沭阳县', '1', '江苏高速石油', 'G2', '京沪高速', '32130000001');
INSERT INTO zsys_oil_station VALUES ('353', '中国石油天然气股份有限公司山东销售菏泽分公司第63加油站', '中石油菏泽第63加油站', '鄄城县新临商路与南外环交汇处', '', '1', '17866690963', '0', '353', null, null, '2019-09-28 17:34:17', '1', '115.563244', '35.543689', '370000', '山东省', '371700', '菏泽市', '371726', '鄄城县', '0', '中石油', '', '', '37170000426');
INSERT INTO zsys_oil_station VALUES ('354', '长庄服务区西区', '长庄服务区西区', '沭阳县长庄居委会（G2京沪高速K762两侧）', '', null, '13861550379', '0', '354', null, null, '2019-09-28 17:34:17', '1', '118.793415', '34.140773', '320000', '江苏省', '321300', '宿迁市', '321322', '沭阳县', '1', '江苏高速石油', 'G2', '京沪高速', '32130000001');
INSERT INTO zsys_oil_station VALUES ('355', '中国石油天然气股份有限公司山东销售菏泽分公司第34加油站', '中石油菏泽第34站', '山东省菏泽市单县北外环西段路北', '', '1', '05305071666', '0', '355', null, null, '2019-09-28 17:34:17', '1', '116.045346', '34.474249', '370000', '山东省', '371700', '菏泽市', '371722', '单县', '0', '中石油', '', '', '37170000440');
INSERT INTO zsys_oil_station VALUES ('356', '中国石油天然气股份有限公司山东销售菏泽分公司第83加油站', '中石油菏泽第83站', '单县单城镇定砀路五叉路口', '', '1', '17866690983', '0', '356', null, null, '2019-09-28 17:34:18', '1', '116.054706', '34.473913', '370000', '山东省', '371700', '菏泽市', '371722', '单县', '0', '中石油', '', '', '37170000442');
INSERT INTO zsys_oil_station VALUES ('357', '沙溪服务区南区', '沙溪服务区南区', '沙溪镇归庄村沙溪服务区加油站(G15沈海高速1230KM处）', '', null, '15852796707', '0', '357', null, null, '2019-09-28 17:34:18', '1', '121.025140', '31.362263', '320000', '江苏省', '320500', '苏州市', '320585', '太仓市', '1', '江苏高速石油', '', '', '32050000001');
INSERT INTO zsys_oil_station VALUES ('358', '中国石油天然气股份有限公司山东销售菏泽分公司第18加油站', '中石油菏泽第18站', '成武县东环路常桥村十字路口东南处', '', '1', '0530-8985158', '0', '358', null, null, '2019-09-28 17:34:18', '1', '115.550000', '35.570000', '370000', '山东省', '371700', '菏泽市', '371723', '成武县', '0', '中石油', '', '', '37170000444');
INSERT INTO zsys_oil_station VALUES ('359', '沙溪服务区北区', '沙溪服务区北区', '沙溪镇归庄村沙溪服务区加油站(G15沈海高速1230KM处）', '', null, '15852796707', '0', '359', null, null, '2019-09-28 17:34:18', '1', '121.023880', '31.362972', '320000', '江苏省', '320500', '苏州市', '320585', '太仓市', '1', '江苏高速石油', '', '', '32050000001');
INSERT INTO zsys_oil_station VALUES ('360', '中国石油天然气股份有限公司山东销售菏泽分公司第7号加油站', '中石油菏泽第7加油站', '菏泽市西安路与康路交汇口东南角', '', '1', '0530—5991966', '0', '360', null, null, '2019-09-28 17:34:18', '1', '115.260000', '35.150000', '370000', '山东省', '371700', '菏泽市', '371701', '市辖区', '0', '中石油', '', '', '37170000439');
INSERT INTO zsys_oil_station VALUES ('361', '堰桥服务区加油站东区', '堰桥服务区加油站东区', '惠山区堰桥镇新塘里堰桥服务区加油站', '', null, '18761007579', '0', '361', null, null, '2019-09-28 17:34:19', '1', '120.332491', '31.681209', '320000', '江苏省', '320200', '无锡市', '320206', '惠山区', '1', '江苏高速石油', 'G2', '京沪高速', '32020000002');
INSERT INTO zsys_oil_station VALUES ('364', '宜兴太湖加油站东区', '宜兴太湖加油站东区', '江苏省无锡市宜兴市兰山路18号（G25长深高速2188K两侧）', '', null, '13961537003', '0', '364', null, null, '2019-09-28 17:34:19', '1', '119.910707', '31.192778', '320000', '江苏省', '320200', '无锡市', '320282', '宜兴市', '1', '江苏高速石油', '', '', '32020000001');
INSERT INTO zsys_oil_station VALUES ('365', '青银高速高唐服务区北区加油站', '青银高速高唐服务区北区加油站', '高唐县人和社区岳王村后', '', '2', '18963501288', '0', '365', null, null, '2019-09-28 17:34:19', '1', '116.300585', '36.920772', '370000', '山东省', '371500', '聊城市', '371526', '高唐县', '1', '中国石化', 'G20', '青银高速', '37150000369');
INSERT INTO zsys_oil_station VALUES ('366', '宜兴太湖加油站西区', '宜兴太湖加油站西区', '江苏省无锡市宜兴市兰山路18号（G25长深高速2188K两侧）', '', null, '13961537003', '0', '366', null, null, '2019-09-28 17:34:19', '1', '119.909205', '31.191350', '320000', '江苏省', '320200', '无锡市', '320282', '宜兴市', '1', '江苏高速石油', '', '', '32020000001');
INSERT INTO zsys_oil_station VALUES ('367', '东庐山服务区南区', '东庐山服务区南区', '南京市溧水区白马镇石家边村（G25长深高速K2096处）', '', null, '13851809096', '0', '367', null, null, '2019-09-28 17:34:20', '1', '119.150703', '31.610927', '320000', '江苏省', '320100', '南京市', '320117', '溧水区', '1', '江苏高速石油', '', '', '32010000003');
INSERT INTO zsys_oil_station VALUES ('368', '东庐山服务区北区', '东庐山服务区北区', '南京市溧水区白马镇石家边村（G25长深高速K2096处）', '', null, '13851809096', '0', '368', null, null, '2019-09-28 17:34:20', '1', '119.149366', '31.613078', '320000', '江苏省', '320100', '南京市', '320117', '溧水区', '1', '江苏高速石油', '', '', '32010000003');
INSERT INTO zsys_oil_station VALUES ('369', '江宁服务区东区', '江宁服务区东区', '江苏省南京市江宁区南京协城停车场对过江宁服务区', '', null, '13851946900', '0', '369', null, null, '2019-09-28 17:34:20', '1', '118.914348', '31.921008', '320000', '江苏省', '320100', '南京市', '320115', '江宁区', '1', '江苏高速石油', '', '', '32010000004');
INSERT INTO zsys_oil_station VALUES ('370', '江宁服务区西区', '江宁服务区西区', '江苏省南京市江宁区南京协城停车场对过江宁服务区', '', null, '13851946900', '0', '370', null, null, '2019-09-28 17:34:20', '1', '118.915491', '31.918246', '320000', '江苏省', '320100', '南京市', '320115', '江宁区', '1', '江苏高速石油', '', '', '32010000004');
INSERT INTO zsys_oil_station VALUES ('371', '天目湖服务区南区', '天目湖服务区南区', '江苏省溧阳市溧城镇黄墟村天目湖服务区', '', null, '13961269918', '0', '371', null, null, '2019-09-28 17:34:21', '1', '119.303300', '31.233000', '320000', '江苏省', '320400', '常州市', '320481', '溧阳市', '1', '江苏高速石油', '', '', '32040000001');
INSERT INTO zsys_oil_station VALUES ('372', '天目湖服务区北区', '天目湖服务区北区', '江苏省溧阳市溧城镇黄墟村天目湖服务区', '', null, '13961269918', '0', '372', null, null, '2019-09-28 17:34:21', '1', '119.302700', '31.237000', '320000', '江苏省', '320400', '常州市', '320481', '溧阳市', '1', '江苏高速石油', '', '', '32040000001');
INSERT INTO zsys_oil_station VALUES ('373', '浦南服务区东区', '浦南服务区东区', '连云港市浦南镇小官庄村（G15高速两侧）', '', null, '13327861178', '0', '373', null, null, '2019-09-28 17:34:21', '1', '119.293890', '34.662500', '320000', '江苏省', '320700', '连云港市', '320706', '海州区', '1', '江苏高速石油', 'G15', '沈海高速', '32070000002');
INSERT INTO zsys_oil_station VALUES ('374', '浦南服务区西区', '浦南服务区西区', '连云港市浦南镇小官庄村（G15高速两侧）', '', null, '13327861178', '0', '374', null, null, '2019-09-28 17:34:21', '1', '119.264720', '34.691110', '320000', '江苏省', '320700', '连云港市', '320706', '海州区', '1', '江苏高速石油', 'G15', '沈海高速', '32070000002');
INSERT INTO zsys_oil_station VALUES ('375', '青银高速高唐服务区南区加油站', '青银高速高唐服务区南区加油站', '高唐县人和社区岳王村后', '', '2', '18963501288', '0', '375', null, null, '2019-09-28 17:34:22', '1', '116.303123', '36.918757', '370000', '山东省', '371500', '聊城市', '371526', '高唐县', '1', '中国石化', 'G20', '青银高速', '37150000369');
INSERT INTO zsys_oil_station VALUES ('376', '济聊高速冠县服务区北区加油站', '济聊高速冠县服务区北区加油站', '冠县烟庄乡后张平村', '', '2', '18653191181', '0', '376', null, null, '2019-09-28 17:34:22', '1', '115.508891', '36.525445', '370000', '山东省', '371500', '聊城市', '371525', '冠县', '1', '中国石化', 'S1', '济聊高速', '37010000662');
INSERT INTO zsys_oil_station VALUES ('377', '中国石油天然气股份有限公司烟台第1加油站', '中石油烟台1站', ' 烟台市芝罘区机场路312-322号', '', '1', '18563817857', '0', '377', null, null, '2019-09-28 17:34:22', '1', '121.365570', '37.434172', '370000', '山东省', '370600', '烟台市', '370602', '芝罘区', '0', '中石油', '', '', '37060000410');
INSERT INTO zsys_oil_station VALUES ('378', '济聊高速冠县服务区南区加油站', '济聊高速冠县服务区南区加油站', '冠县烟庄乡后张平村', '', '2', '18653191181', '0', '378', null, null, '2019-09-28 17:34:22', '1', '115.508446', '36.524169', '370000', '山东省', '371500', '聊城市', '371525', '冠县', '1', '中国石化', 'S1', '济聊高速', '37010000662');
INSERT INTO zsys_oil_station VALUES ('379', '中国石油天然气股份有限公司烟台第2加油站', '中石油烟台2站', '烟台市芝罘区港城西大街和化工南路交叉口', '', '1', '18766451521', '0', '379', null, null, '2019-09-28 17:34:22', '1', '121.321539', '37.482428', '370000', '山东省', '370600', '烟台市', '370602', '芝罘区', '0', '中石油', '', '', '37060000411');
INSERT INTO zsys_oil_station VALUES ('380', '济聊高速聊城服务区南区加油站', '济聊高速聊城服务区南区加油站', '聊城市蒋官屯镇安庄', '', '2', '18653193889', '0', '380', null, null, '2019-09-28 17:34:23', '1', '116.082699', '36.502714', '370000', '山东省', '371500', '聊城市', '371501', '市辖区', '1', '中国石化', 'S1', '济聊高速', '37010000662');
INSERT INTO zsys_oil_station VALUES ('381', '济聊高速聊城服务区北区加油站', '济聊高速聊城服务区北区加油站', '聊城市蒋官屯镇安庄', '', '2', '18653193889', '0', '381', null, null, '2019-09-28 17:34:23', '1', '116.082607', '36.502688', '370000', '山东省', '371500', '聊城市', '371501', '市辖区', '1', '中国石化', 'S1', '济聊高速', '37010000662');
INSERT INTO zsys_oil_station VALUES ('382', '中国石油天然气股份有限公司烟台第3加油站', '中石油烟台3站', '烟台市芝罘区化工路43号', '', '1', '13863840770', '0', '382', null, null, '2019-09-28 17:34:23', '1', '121.325651', '37.553492', '370000', '山东省', '370600', '烟台市', '370602', '芝罘区', '0', '中石油', '', '', '37060000412');
INSERT INTO zsys_oil_station VALUES ('385', '中国石油天然气股份有限公司烟台第4加油站', '中石油烟台4站', '烟台市芝罘区幸福南路西24号', '', '1', '15863835299', '0', '385', null, null, '2019-09-28 17:34:24', '1', '121.317027', '37.564518', '370000', '山东省', '370600', '烟台市', '370602', '芝罘区', '0', '中石油', '', '', '37060000383');
INSERT INTO zsys_oil_station VALUES ('386', '中国石油天然气股份有限公司烟台第5加油站', '中石油烟台5站', '烟台市莱山区莱山镇043乡道明泉村路段启航幼儿园附近', '', '1', '13589852353', '0', '386', null, null, '2019-09-28 17:34:24', '1', '121.377051', '37.392859', '370000', '山东省', '370600', '烟台市', '370613', '莱山区', '0', '中石油', '', '', '37060000413');
INSERT INTO zsys_oil_station VALUES ('387', '中国石油天然气股份有限公司中石油日照第二加油站', '中石油日照第二加油站', '日照东港区南湖镇黄山前335省道北侧', '', '1', '18863306502', '0', '387', null, null, '2019-09-28 17:34:24', '1', '119.388590', '35.452666', '370000', '山东省', '371100', '日照市', '371102', '东港区', '0', '中石油', '', '', '37110000287');
INSERT INTO zsys_oil_station VALUES ('388', '中国石油天然气股份有限公司烟台第7加油站', '中石油烟台7站', '烟台市莱山区轸大路36号盛泉工业园', '', '1', '13685351111', '0', '388', null, null, '2019-09-28 17:34:24', '1', '121.447730', '37.448464', '370000', '山东省', '370600', '烟台市', '370613', '莱山区', '0', '中石油', '', '', '37060000382');
INSERT INTO zsys_oil_station VALUES ('389', '中国石油天然气股份有限公司中石油日照第5加油站', '中石油日照第5加油站', '日照街道西环路西侧山东路北侧', '', '1', '18863306505', '0', '389', null, null, '2019-09-28 17:34:24', '1', '119.454805', '35.440187', '370000', '山东省', '371100', '日照市', '371102', '东港区', '0', '中石油', '', '', '37110000288');
INSERT INTO zsys_oil_station VALUES ('391', '路油公司聊城站', '路油公司聊城站', '聊城西收费站西侧100米', '', '2', '18653197300', '0', '391', null, null, '2019-09-28 17:34:25', '1', '115.906835', '36.471843', '370000', '山东省', '371500', '聊城市', '371502', '东昌府区', '0', '中国石化', '', '', '37010000662');
INSERT INTO zsys_oil_station VALUES ('392', '太湖服务区东区', '太湖东区', '安徽省安庆市太湖县G50沪渝高速靠近安庆市公安局交通警察支队高速公路一大队', '', '2', '13966412768', '0', '392', null, null, '2019-09-28 17:34:25', '1', '116.338066', '30.438631', '340000', '安徽省', '340800', '安庆市', '340825', '太湖县', '1', '中国石化', 'G50', '沪渝高速', '34080000003');
INSERT INTO zsys_oil_station VALUES ('393', '太湖服务区西区', '太湖西区', '安徽省安庆市太湖县G50沪渝高速靠近安庆市公安局交通警察支队高速公路一大队', '', '2', '13966412768', '0', '393', null, null, '2019-09-28 17:34:25', '1', '116.338218', '30.440826', '340000', '安徽省', '340800', '安庆市', '340825', '太湖县', '1', '中国石化', 'G50', '沪渝高速', '34080000003');
INSERT INTO zsys_oil_station VALUES ('395', '阜南服务区南区', '阜南服务区南区', '安徽省阜阳市阜南县S12滁新高速阜南服务区', '', '2', '13515578281', '0', '395', null, null, '2019-09-28 17:34:25', '1', '115.655465', '32.795265', '340000', '安徽省', '341200', '阜阳市', '341225', '阜南县', '1', '中国石化', '', '', '34120000006');
INSERT INTO zsys_oil_station VALUES ('396', '宿松服务区东区', '宿松东区', '安徽省安庆市宿松县G50沪渝高速靠近安徽十二钗酒业', '', '2', '13665562383', '0', '396', null, null, '2019-09-28 17:34:25', '1', '116.119386', '30.185465', '340000', '安徽省', '340800', '安庆市', '340826', '宿松县', '1', '中国石化', 'G50', '沪渝高速', '34080000002');
INSERT INTO zsys_oil_station VALUES ('397', '阜南服务区北区', '阜南服务区北区', '安徽省阜阳市阜南县S12滁新高速阜南服务区', '', '2', '13515578281', '0', '397', null, null, '2019-09-28 17:34:26', '1', '115.653658', '32.796311', '340000', '安徽省', '341200', '阜阳市', '341225', '阜南县', '1', '中国石化', '', '', '34120000006');
INSERT INTO zsys_oil_station VALUES ('398', '中国石油天然气股份有限公司烟台第6加油站', '中石油烟台6站', '烟台市莱山镇河北村西S208莱山区公路管理所旁边', '', '1', '18364402111', '0', '398', null, null, '2019-09-28 17:34:26', '1', '121.392689', '37.409228', '370000', '山东省', '370600', '烟台市', '370613', '莱山区', '0', '中石油', '', '', '37060000414');
INSERT INTO zsys_oil_station VALUES ('399', '陈埠服务区东区', '陈埠东区', '安徽省合肥市庐江县S4212合安高速陈埠服务区', '', '2', '15156808155', '0', '399', null, null, '2019-09-28 17:34:26', '1', '117.167927', '31.224852', '340000', '安徽省', '340100', '合肥市', '340124', '庐江县', '1', '中国石化', 'S4212', '合安高速', '34010000003');
INSERT INTO zsys_oil_station VALUES ('400', '中国石油天然气股份有限公司烟台第8加油站', '中石油烟台8站', '烟台市解甲庄镇西解村金胜大酒店旁', '', '1', '13686380030', '0', '400', null, null, '2019-09-28 17:34:26', '1', '121.499837', '37.394396', '370000', '山东省', '370600', '烟台市', '370613', '莱山区', '0', '中石油', '', '', '37060000415');
INSERT INTO zsys_oil_station VALUES ('401', '陈埠服务区西区', '陈埠西区', '安徽省合肥市庐江县S4212合安高速陈埠服务区', '', '2', '15156808155', '0', '401', null, null, '2019-09-28 17:34:27', '1', '117.165398', '31.225388', '340000', '安徽省', '340100', '合肥市', '340124', '庐江县', '1', '中国石化', 'S4212', '合安高速', '34010000003');
INSERT INTO zsys_oil_station VALUES ('402', '宿松服务区2', '宿舍西区', '安徽省安庆市宿松县G50沪渝高速靠近安徽十二钗酒业', '', '2', '13665562383', '0', '402', null, null, '2019-09-28 17:34:27', '1', '116.120522', '30.185375', '340000', '安徽省', '340800', '安庆市', '340826', '宿松县', '1', '中国石化', 'G50', '沪渝高速', '34080000002');
INSERT INTO zsys_oil_station VALUES ('403', '中国石油天然气股份有限公司中石油日照第6加油站', '中石油日照第6加油站', '东港区南湖镇花峡峪村335省道南侧', '', '1', '18863306506', '0', '403', null, null, '2019-09-28 17:34:27', '1', '119.336127', '35.479780', '370000', '山东省', '371100', '日照市', '371102', '东港区', '0', '中石油', '', '', '37110000289');
INSERT INTO zsys_oil_station VALUES ('404', '中国石油天然气股份有限公司中石油日照第7加油站', '中石油日照第7加油站', '东港区三庄镇驻地335省道南侧内燃机厂东侧', '', '1', '18863306507', '0', '404', null, null, '2019-09-28 17:34:27', '1', '119.200012', '35.503339', '370000', '山东省', '371100', '日照市', '371102', '东港区', '0', '中石油', '', '', '37110000290');
INSERT INTO zsys_oil_station VALUES ('405', '中国石油天然气股份有限公司烟台第9加油站', '中石油烟台9站', '烟台市莱山区办事处轸格庄立交桥烟石线西轸格庄路段', '', '1', '18505450320', '0', '405', null, null, '2019-09-28 17:34:27', '1', '121.485936', '37.438787', '370000', '山东省', '370600', '烟台市', '370613', '莱山区', '0', '中石油', '', '', '37060000416');
INSERT INTO zsys_oil_station VALUES ('406', '望江服务区东区', '望江东区', '安徽省安庆市望江县G35济广高速望江服务区', '', '2', '15155658465', '0', '406', null, null, '2019-09-28 17:34:28', '1', '116.720330', '30.159279', '340000', '安徽省', '340800', '安庆市', '340827', '望江县', '1', '中国石化', 'G35', '济广高速', '34080000005');
INSERT INTO zsys_oil_station VALUES ('407', '中国石油天然气股份有限公司中石油日照第8加油站', '中石油日照第8加油站', '日照市东港区涛雒镇二村204国道西侧', '', '1', '18863306508', '0', '407', null, null, '2019-09-28 17:34:28', '1', '119.380946', '35.276180', '370000', '山东省', '371100', '日照市', '371102', '东港区', '0', '中石油', '', '', '37110000291');
INSERT INTO zsys_oil_station VALUES ('409', '蒙城服务区东区', '蒙城服务区东区', '安徽省亳州市蒙城县S23济祁高速蒙城服务区', '', '2', '15156405623', '0', '409', null, null, '2019-09-28 17:34:28', '1', '116.424973', '33.027558', '340000', '安徽省', '341600', '亳州市', '341622', '蒙城县', '1', '中国石化', 'S23', '济祁高速', '34160000007');
INSERT INTO zsys_oil_station VALUES ('410', '中国石油天然气股份有限公司中石油日照第12加油站', '中石油日照第12加油站', '日照市东港区涛雒镇高旺庄驻地（204国道路东）', '', '1', '18863306512', '0', '410', null, null, '2019-09-28 17:34:28', '1', '119.370052', '35.240186', '370000', '山东省', '371100', '日照市', '371102', '东港区', '0', '中石油', '', '', '37110000292');
INSERT INTO zsys_oil_station VALUES ('411', '蒙城服务区西区', '蒙城服务区西区', '安徽省亳州市蒙城县S23济祁高速蒙城服务区', '', '2', '15156405623', '0', '411', null, null, '2019-09-28 17:34:28', '1', '116.424748', '33.025445', '340000', '安徽省', '341600', '亳州市', '341622', '蒙城县', '1', '中国石化', 'S23', '济祁高速', '34160000007');
INSERT INTO zsys_oil_station VALUES ('412', '中国石油天然气股份有限公司烟台第10加油站', '中石油烟台10站', '烟台市牟平城区东关路23号', '', '1', '13361387123', '0', '412', null, null, '2019-09-28 17:34:29', '1', '121.619917', '37.382549', '370000', '山东省', '370600', '烟台市', '370612', '牟平区', '0', '中石油', '', '', '37060000417');
INSERT INTO zsys_oil_station VALUES ('414', '中国石油天然气股份有限公司中石油日照第14加油站', '中石油日照第14加油站', '岚山虎山镇泥田沟', '', '1', '18863306514', '0', '414', null, null, '2019-09-28 17:34:29', '1', '119.358796', '35.202928', '370000', '山东省', '371100', '日照市', '371103', '岚山区', '0', '中石油', '', '', '37110000293');
INSERT INTO zsys_oil_station VALUES ('416', '中国石油天然气股份有限公司中石油日照第19加油站', '中石油日照第19加油站', '五莲县五莲山路（路北）133号，洪凝西村驻地、莫家庄子东侧200米', '', '1', '18863306519', '0', '416', null, null, '2019-09-28 17:34:29', '1', '119.214227', '35.741540', '370000', '山东省', '371100', '日照市', '371121', '五莲县', '0', '中石油', '', '', '37110000294');
INSERT INTO zsys_oil_station VALUES ('417', '龙门寺服务区东区', '龙门寺东区', '安徽省合肥市长丰县S17蚌合高速龙门寺服务区', '', '2', '13856530855', '0', '417', null, null, '2019-09-28 17:34:29', '1', '117.112020', '32.146429', '340000', '安徽省', '340100', '合肥市', '340121', '长丰县', '1', '中国石化', 'S17', '蚌合高速', '34010000007');
INSERT INTO zsys_oil_station VALUES ('420', '中国石油天然气股份有限公司烟台第12加油站', '中石油烟台12站', '烟台市武宁镇七里店302省道与新城大街交口西', '', '1', '13589867577', '0', '420', null, null, '2019-09-28 17:34:30', '1', '121.566979', '37.374798', '370000', '山东省', '370600', '烟台市', '370612', '牟平区', '0', '中石油', '', '', '37060000419');
INSERT INTO zsys_oil_station VALUES ('421', '龙门寺服务区西区', '龙门寺西区', '安徽省合肥市长丰县S17蚌合高速龙门寺服务区', '', '2', '13856530855', '0', '421', null, null, '2019-09-28 17:34:30', '1', '117.109891', '32.144480', '340000', '安徽省', '340100', '合肥市', '340121', '长丰县', '1', '中国石化', 'S17', '蚌合高速', '34010000007');
INSERT INTO zsys_oil_station VALUES ('422', '中国石油天然气股份有限公司中石油日照第20加油站', '中石油日照第20加油站', '日照经济开发区临沂路与沿海公路交汇处向北200米路东', '', '1', '18863306520', '0', '422', null, null, '2019-09-28 17:34:30', '1', '119.604778', '35.505884', '370000', '山东省', '371100', '日照市', '371102', '东港区', '0', '中石油', '', '', '37110000295');
INSERT INTO zsys_oil_station VALUES ('423', '中国石油天然气股份有限公司中石油日照第21加油站', '中石油日照第21加油站', '日照市安东卫街道潘庄一村', '', '1', '18863306521', '0', '423', null, null, '2019-09-28 17:34:31', '1', '119.273699', '35.141947', '370000', '山东省', '371100', '日照市', '371102', '东港区', '0', '中石油', '', '', '37110000296');
INSERT INTO zsys_oil_station VALUES ('424', '望江服务区西区', '望江西区', '安徽省安庆市望江县G35济广高速望江服务区', '', '2', '15155658465', '0', '424', null, null, '2019-09-28 17:34:31', '1', '116.721682', '30.156004', '340000', '安徽省', '340800', '安庆市', '340827', '望江县', '1', '中国石化', 'G35', '济广高速', '34080000005');
INSERT INTO zsys_oil_station VALUES ('425', '中国石油天然气股份有限公司中石油日照第22加油站', '中石油日照第22加油站', '日照市五莲县潮石路与五征大道交汇处', '', '1', '18863306522', '0', '425', null, null, '2019-09-28 17:34:31', '1', '119.507789', '35.635190', '370000', '山东省', '371100', '日照市', '371121', '五莲县', '0', '中石油', '', '', '37110000297');
INSERT INTO zsys_oil_station VALUES ('426', '王河服务区北区', '王河北区', '安徽省安庆市潜山县G50沪渝高速王河服务区', '', '2', '18156920335', '0', '426', null, null, '2019-09-28 17:34:31', '1', '116.551546', '30.576458', '340000', '安徽省', '340800', '安庆市', '340824', '潜山县', '1', '中国石化', 'G50', '沪渝高速', '34080000006');
INSERT INTO zsys_oil_station VALUES ('427', '马集服务区东区', '马集服务区东区', '安徽省亳州市蒙城县砀祁高速马集服务区', '', '2', '15156405623', '0', '427', null, null, '2019-09-28 17:34:31', '1', '116.363186', '33.331262', '340000', '安徽省', '341600', '亳州市', '341622', '蒙城县', '1', '中国石化', 'S23', '砀祁高速', '34160000006');
INSERT INTO zsys_oil_station VALUES ('428', '中国石油天然气股份有限公司烟台第13加油站', '中石油烟台13站', '烟台市回里镇G204路段回里派出所附近', '', '1', '13697899595', '0', '428', null, null, '2019-09-28 17:34:32', '1', '121.328590', '37.346580', '370000', '山东省', '370600', '烟台市', '370611', '福山区', '0', '中石油', '', '', '37060000420');
INSERT INTO zsys_oil_station VALUES ('429', '马集服务区西区', '马集服务区西区', '安徽省亳州市蒙城县砀祁高速马集服务区', '', '2', '15156405623', '0', '429', null, null, '2019-09-28 17:34:32', '1', '116.362249', '33.924900', '340000', '安徽省', '341600', '亳州市', '341622', '蒙城县', '1', '中国石化', 'S23', '砀祁高速', '34160000006');
INSERT INTO zsys_oil_station VALUES ('430', '王河服务区南区', '王河南区', '安徽省安庆市潜山县G50沪渝高速王河服务区', '', '2', '18156920335', '0', '430', null, null, '2019-09-28 17:34:32', '1', '116.550612', '30.572641', '340000', '安徽省', '340800', '安庆市', '340824', '潜山县', '1', '中国石化', 'G50', '沪渝高速', '34080000006');
INSERT INTO zsys_oil_station VALUES ('431', '八公山服务区南区', '八公山南区', '安徽省淮南市谢家集区S12滁新高速八公山服务区', '', '2', '13966772074', '0', '431', null, null, '2019-09-28 17:34:32', '1', '116.971552', '32.549469', '340000', '安徽省', '340400', '淮南市', '340404', '谢家集区', '1', '中国石化', '', '', '34040000001');
INSERT INTO zsys_oil_station VALUES ('433', '临泉服务区南区', '临泉服务区南区', '安徽省阜阳市临泉县S12滁新高速临泉服务区', '', '2', '15665583332', '0', '433', null, null, '2019-09-28 17:34:33', '1', '115.238992', '32.852483', '340000', '安徽省', '341200', '阜阳市', '341221', '临泉县', '1', '中国石化', '', '', '34120000005');
INSERT INTO zsys_oil_station VALUES ('435', '八公山服务区北区', '八公山北区', '安徽省淮南市谢家集区S12滁新高速八公山服务区', '', '2', '13966772074', '0', '435', null, null, '2019-09-28 17:34:33', '1', '116.971145', '32.550505', '340000', '安徽省', '340400', '淮南市', '340404', '谢家集区', '1', '中国石化', '', '', '34040000001');
INSERT INTO zsys_oil_station VALUES ('436', '临泉服务区北区', '临泉服务区北区', '安徽省阜阳市临泉县S12滁新高速临泉服务区', '', '2', '15665583332', '0', '436', null, null, '2019-09-28 17:34:33', '1', '115.236271', '32.852866', '340000', '安徽省', '341200', '阜阳市', '341221', '临泉县', '1', '中国石化', '', '', '34120000005');
INSERT INTO zsys_oil_station VALUES ('437', '岳西服务区东区', '岳西东区', '安徽省安庆市岳西县G35济广高速岳西服务区', '', '2', '13966447398', '0', '437', null, null, '2019-09-28 17:34:33', '1', '116.328813', '30.902030', '340000', '安徽省', '340800', '安庆市', '340828', '岳西县', '1', '中国石化', 'G35', '济广高速', '34080000007');
INSERT INTO zsys_oil_station VALUES ('439', '茶庵服务区东区', '茶庵东区', '安徽省淮南市寿县S23德上高速茶庵服务区', '', '2', '15215647636', '0', '439', null, null, '2019-09-28 17:34:33', '1', '116.788310', '32.078417', '340000', '安徽省', '340400', '淮南市', '340422', '寿县', '1', '中国石化', 'G3W', '德上高速', '34040000002');
INSERT INTO zsys_oil_station VALUES ('440', '茶庵服务区西区', '茶庵西区', '安徽省淮南市寿县S23德上高速茶庵服务区', '', '2', '15215647636', '0', '440', null, null, '2019-09-28 17:34:34', '1', '116.785759', '32.077652', '340000', '安徽省', '340400', '淮南市', '340422', '寿县', '1', '中国石化', 'G3W', '德上高速', '34040000002');
INSERT INTO zsys_oil_station VALUES ('444', '堰口服务区东区', '堰口东区', '安徽省淮南市寿县S23德上高速堰口服务区', '', '2', '13605545073', '0', '444', null, null, '2019-09-28 17:34:34', '1', '116.769074', '32.383833', '340000', '安徽省', '340400', '淮南市', '340422', '寿县', '1', '中国石化', 'G3W', '德上高速', '34040000003');
INSERT INTO zsys_oil_station VALUES ('445', '堰口服务区西区', '堰口西区', '安徽省淮南市寿县S23德上高速堰口服务区', '', '2', '13605545073', '0', '445', null, null, '2019-09-28 17:34:34', '1', '116.766097', '32.382454', '340000', '安徽省', '340400', '淮南市', '340422', '寿县', '1', '中国石化', 'G3W', '德上高速', '34040000003');
INSERT INTO zsys_oil_station VALUES ('446', '凤台服务区南区', '凤台服务区南区', '安徽省淮南市凤台县G3W德上高速凤台服务区', '', '2', '13855436331', '0', '446', null, null, '2019-09-28 17:34:34', '1', '116.671024', '32.737150', '340000', '安徽省', '340400', '淮南市', '340421', '凤台县', '1', '中国石化', 'G3W', '德上高速', '34040000006');
INSERT INTO zsys_oil_station VALUES ('449', '梅山服务区东区', '梅山东区', '安徽省六安市金寨县G42沪蓉高速梅山服务区', '', '2', '15956410701', '0', '449', null, null, '2019-09-28 17:34:35', '1', '116.020867', '31.761184', '340000', '安徽省', '341500', '六安市', '341524', '金寨县', '1', '中国石化', 'G42', '沪蓉高速', '34150000004');
INSERT INTO zsys_oil_station VALUES ('450', '中国石油天然气股份有限公司烟台第14加油站', '中石油烟台14站', '烟台市港城西大街兴华庄路段,清洋工业园附近', '', '1', '13589863051', '0', '450', null, null, '2019-09-28 17:34:35', '1', '121.249576', '37.488697', '370000', '山东省', '370600', '烟台市', '370602', '芝罘区', '0', '中石油', '', '', '37060000421');
INSERT INTO zsys_oil_station VALUES ('451', '凤台服务区北区', '凤台服务区北区', '安徽省淮南市凤台县G3W德上高速凤台服务区', '', '2', '13855436331', '0', '451', null, null, '2019-09-28 17:34:35', '1', '116.670448', '32.735439', '340000', '安徽省', '340400', '淮南市', '340421', '凤台县', '1', '中国石化', 'G3W', '德上高速', '34040000006');
INSERT INTO zsys_oil_station VALUES ('452', '岳西服务区西区', '岳西西区', '安徽省安庆市岳西县G35济广高速岳西服务区', '', '2', '13966447398', '0', '452', null, null, '2019-09-28 17:34:35', '1', '116.327277', '30.899626', '340000', '安徽省', '340800', '安庆市', '340828', '岳西县', '1', '中国石化', 'G35', '济广高速', '34080000007');
INSERT INTO zsys_oil_station VALUES ('453', '梅山服务区西区', '梅山西区', '安徽省六安市金寨县G42沪蓉高速梅山服务区', '', '2', '15956410701', '0', '453', null, null, '2019-09-28 17:34:36', '1', '116.019863', '31.761692', '340000', '安徽省', '341500', '六安市', '341524', '金寨县', '1', '中国石化', 'G42', '沪蓉高速', '34150000004');
INSERT INTO zsys_oil_station VALUES ('454', '中国石油天然气股份有限公司烟台第15加油站', '中石油烟台15站', '烟台市福山区210省道张格庄镇段', '', '1', '13884658750', '0', '454', null, null, '2019-09-28 17:34:36', '1', '121.211412', '37.376423', '370000', '山东省', '370600', '烟台市', '370611', '福山区', '0', '中石油', '', '', '37060000422');
INSERT INTO zsys_oil_station VALUES ('455', '霍山服务区东区', '霍山东区', '安徽省六安市霍山县G35济广高速霍山服务区', '', '2', '18712372678', '0', '455', null, null, '2019-09-28 17:34:36', '1', '116.409969', '31.463197', '340000', '安徽省', '341500', '六安市', '341525', '霍山县', '1', '中国石化', 'G35', '济广高速', '34150000001');
INSERT INTO zsys_oil_station VALUES ('456', '伍明服务区东区', '伍明服务区东区', '安徽省阜阳市颍泉区G35济广高速伍明服务区', '', '2', '13855804475', '0', '456', null, null, '2019-09-28 17:34:36', '1', '115.905212', '33.051243', '340000', '安徽省', '341200', '阜阳市', '341204', '颍泉区', '1', '中国石化', 'G35', '济广高速', '34120000004');
INSERT INTO zsys_oil_station VALUES ('458', '霍山服务区西区', '霍山西区', '安徽省六安市霍山县G35济广高速霍山服务区', '', '2', '18712372678', '0', '458', null, null, '2019-09-28 17:34:36', '1', '116.408958', '31.460837', '340000', '安徽省', '341500', '六安市', '341525', '霍山县', '1', '中国石化', 'G35', '济广高速', '34150000001');
INSERT INTO zsys_oil_station VALUES ('459', '伍明服务区西区', '伍明服务区西区', '安徽省阜阳市颍泉区G35济广高速伍明服务区', '', '2', '13855804475', '0', '459', null, null, '2019-09-28 17:34:37', '1', '115.903683', '33.049940', '340000', '安徽省', '341200', '阜阳市', '341204', '颍泉区', '1', '中国石化', 'G35', '济广高速', '34120000004');
INSERT INTO zsys_oil_station VALUES ('460', '颍上服务区南区', '颍上服务区南区', '安徽省阜阳市颍上县S12滁新高速颍上服务区', '', '2', '13966805206', '0', '460', null, null, '2019-09-28 17:34:37', '1', '116.412694', '32.648184', '340000', '安徽省', '341200', '阜阳市', '341226', '颍上县', '1', '中国石化', '', '', '34120000003');
INSERT INTO zsys_oil_station VALUES ('462', '颍上服务区北区', '颍上服务区北区', '安徽省阜阳市颍上县S12滁新高速颍上服务区', '', '2', '13966805206', '0', '462', null, null, '2019-09-28 17:34:37', '1', '116.410861', '32.650726', '340000', '安徽省', '341200', '阜阳市', '341226', '颍上县', '1', '中国石化', '', '', '34120000003');
INSERT INTO zsys_oil_station VALUES ('463', '河口服务区西区', '河口西区', '安徽省六安市霍邱县G35济广高速河口服务区', '', '2', '13966274399', '0', '463', null, null, '2019-09-28 17:34:37', '1', '116.081199', '32.149111', '340000', '安徽省', '341500', '六安市', '341522', '霍邱县', '1', '中国石化', 'G35', '济广高速', '34150000005');
INSERT INTO zsys_oil_station VALUES ('464', '白帽服务区南区', '白帽南区', '安徽省安庆市岳西县S18岳武高速白帽服务区', '', '2', '13966438789', '0', '464', null, null, '2019-09-28 17:34:37', '1', '115.955577', '30.840318', '340000', '安徽省', '340800', '安庆市', '340828', '岳西县', '1', '中国石化', '', '', '34080000008');
INSERT INTO zsys_oil_station VALUES ('465', '西桥服务区南区', '西桥南区', '安徽省六安市裕安区G42沪蓉高速西桥服务区', '', '2', '18792010081', '0', '465', null, null, '2019-09-28 17:34:38', '1', '116.453124', '31.854779', '340000', '安徽省', '341500', '六安市', '341503', '裕安区', '1', '中国石化', 'G42', '沪蓉高速', '34150000006');
INSERT INTO zsys_oil_station VALUES ('466', '白帽服务区北区', '白帽北区', '安徽省安庆市岳西县S18岳武高速白帽服务区', '', '2', '13966438789', '0', '466', null, null, '2019-09-28 17:34:38', '1', '115.956515', '30.841967', '340000', '安徽省', '340800', '安庆市', '340828', '岳西县', '1', '中国石化', '', '', '34080000008');
INSERT INTO zsys_oil_station VALUES ('467', '焦岗服务区湖南区', '焦岗服务区湖南区', '安徽省淮南市凤台县S12滁新高速焦岗湖服务区', '', '2', '18110221512', '0', '467', null, null, '2019-09-28 17:34:38', '1', '116.668057', '32.627191', '340000', '安徽省', '340400', '淮南市', '340421', '凤台县', '1', '中国石化', '', '', '34040000005');
INSERT INTO zsys_oil_station VALUES ('468', '西桥服务区北区', '西桥北区', '安徽省六安市裕安区G42沪蓉高速西桥服务区', '', '2', '18792010081', '0', '468', null, null, '2019-09-28 17:34:38', '1', '116.448403', '31.856301', '340000', '安徽省', '341500', '六安市', '341503', '裕安区', '1', '中国石化', 'G42', '沪蓉高速', '34150000006');
INSERT INTO zsys_oil_station VALUES ('469', '焦岗湖服务区北区', '焦岗湖服务区北区', '安徽省淮南市凤台县S12滁新高速焦岗湖服务区', '', '2', '18110221512', '0', '469', null, null, '2019-09-28 17:34:38', '1', '116.667208', '32.629312', '340000', '安徽省', '340400', '淮南市', '340421', '凤台县', '1', '中国石化', '', '', '34040000005');
INSERT INTO zsys_oil_station VALUES ('471', '天堂寨服务区东区', '天堂寨东区', '安徽省六安市金寨县G42沪蓉高速天堂寨停车区', '', '2', '18792010081', '0', '471', null, null, '2019-09-28 17:34:39', '1', '115.736939', '31.463815', '340000', '安徽省', '341500', '六安市', '341524', '金寨县', '1', '中国石化', 'G42', '沪蓉高速', '34150000007');
INSERT INTO zsys_oil_station VALUES ('472', '红星服务区东区', '红星服务区东区', '安徽省阜阳市颍上县G35济广高速红星服务区', '', '2', '15856790234', '0', '472', null, null, '2019-09-28 17:34:39', '1', '115.980754', '32.704958', '340000', '安徽省', '341200', '阜阳市', '341226', '颍上县', '1', '中国石化', 'G35', '济广高速', '34120000001');
INSERT INTO zsys_oil_station VALUES ('473', '天堂寨服务区西区', '天堂寨西区', '安徽省六安市金寨县G42沪蓉高速天堂寨停车区', '', '2', '18792010081', '0', '473', null, null, '2019-09-28 17:34:39', '1', '115.734343', '31.462941', '340000', '安徽省', '341500', '六安市', '341524', '金寨县', '1', '中国石化', 'G42', '沪蓉高速', '34150000007');
INSERT INTO zsys_oil_station VALUES ('474', '徐集服务区东区', '徐集东区', '安徽省六安市裕安区G35济广高速徐集服务区', '', '2', '13966274399', '0', '474', null, null, '2019-09-28 17:34:39', '1', '116.365129', '31.822692', '340000', '安徽省', '341500', '六安市', '341503', '裕安区', '1', '中国石化', 'G35', '济广高速', '34150000008');
INSERT INTO zsys_oil_station VALUES ('475', '红星服务区西区', '红星服务区西区', '安徽省阜阳市颍上县G35济广高速红星服务区', '', '2', '15856790234', '0', '475', null, null, '2019-09-28 17:34:39', '1', '115.979478', '32.704962', '340000', '安徽省', '341200', '阜阳市', '341226', '颍上县', '1', '中国石化', 'G35', '济广高速', '34120000001');
INSERT INTO zsys_oil_station VALUES ('476', '徐集服务区西区', '徐集西区', '安徽省六安市裕安区G35济广高速徐集服务区', '', '2', '13966274399', '0', '476', null, null, '2019-09-28 17:34:40', '1', '116.366391', '31.819903', '340000', '安徽省', '341500', '六安市', '341503', '裕安区', '1', '中国石化', 'G35', '济广高速', '34150000008');
INSERT INTO zsys_oil_station VALUES ('477', '君王服务区东区', '君王服务区东区', '安徽省蚌埠市怀远县G3京台高速君王服务区', '', '2', '13966083443', '0', '477', null, null, '2019-09-28 17:34:40', '1', '117.060306', '33.269180', '340000', '安徽省', '340300', '蚌埠市', '340321', '怀远县', '1', '中国石化', 'G3', '京台高速', '34030000001');
INSERT INTO zsys_oil_station VALUES ('479', '君王服务区西区', '君王服务区西区', '安徽省蚌埠市怀远县G3京台高速君王服务区', '', '2', '13966083443', '0', '479', null, null, '2019-09-28 17:34:40', '1', '117.058799', '33.267774', '340000', '安徽省', '340300', '蚌埠市', '340321', '怀远县', '1', '中国石化', 'G3', '京台高速', '34030000001');
INSERT INTO zsys_oil_station VALUES ('481', '石弓服务区东区', '石弓东区', '安徽省亳州市涡阳县砀祁高速石弓服务区', '', '2', '15855892001', '0', '481', null, null, '2019-09-28 17:34:40', '1', '116.408419', '33.694747', '340000', '安徽省', '341600', '亳州市', '341621', '涡阳县', '1', '中国石化', 'S23', '砀祁高速', '34160000003');
INSERT INTO zsys_oil_station VALUES ('482', '中国石油天然气股份有限公司烟台第17加油站', '中石油烟台17站', '烟台市芝罘区机场路411-421号', '', '1', '13589863721', '0', '482', null, null, '2019-09-28 17:34:40', '1', '121.364545', '37.455395', '370000', '山东省', '370600', '烟台市', '370602', '芝罘区', '0', '中石油', '', '', '37060000423');
INSERT INTO zsys_oil_station VALUES ('483', '石弓服务区西区', '石弓西区', '安徽省亳州市涡阳县砀祁高速石弓服务区', '', '2', '15855892001', '0', '483', null, null, '2019-09-28 17:34:41', '1', '116.406327', '33.693705', '340000', '安徽省', '341600', '亳州市', '341621', '涡阳县', '1', '中国石化', 'S23', '砀祁高速', '34160000003');
INSERT INTO zsys_oil_station VALUES ('487', '桥头服务区东区', '桥头东区', '安徽省滁州市明光市S07徐明高速桥头服务区', '', '2', '15955701552', '0', '487', null, null, '2019-09-28 17:34:41', '1', '117.953316', '32.942652', '340000', '安徽省', '341100', '滁州市', '341182', '明光市', '1', '中国石化', 'S07', '徐明高速', '34110000004');
INSERT INTO zsys_oil_station VALUES ('488', '桥头服务区西区', '桥头西区', '安徽省滁州市明光市S07徐明高速桥头服务区', '', '2', '15955701552', '0', '488', null, null, '2019-09-28 17:34:41', '1', '117.951717', '32.940425', '340000', '安徽省', '341100', '滁州市', '341182', '明光市', '1', '中国石化', 'S07', '徐明高速', '34110000004');
INSERT INTO zsys_oil_station VALUES ('489', '宿州服务区南区', '宿州南区', '安徽省宿州市埇桥区S04泗宿高速宿州服务区', '', '2', '13705573170', '0', '489', null, null, '2019-09-28 17:34:41', '1', '117.065220', '33.713240', '340000', '安徽省', '341300', '宿州市', '341302', '埇桥区', '1', '中国石化', 'S04', '泗宿高速', '34130000003');
INSERT INTO zsys_oil_station VALUES ('491', '宿州服务区北区', '宿州北区', '安徽省宿州市埇桥区S04泗宿高速宿州服务区', '', '2', '13705573170', '0', '491', null, null, '2019-09-28 17:34:42', '1', '117.063702', '33.715181', '340000', '安徽省', '341300', '宿州市', '341302', '埇桥区', '1', '中国石化', 'S04', '泗宿高速', '34130000003');
INSERT INTO zsys_oil_station VALUES ('493', '虞姬服务区南区', '虞姬南区', '安徽省宿州市灵璧县S04泗宿高速虞姬服务区', '', '2', '13855772312', '0', '493', null, null, '2019-09-28 17:34:42', '1', '117.599508', '33.601433', '340000', '安徽省', '341300', '宿州市', '341323', '灵璧县', '1', '中国石化', 'S04', '泗宿高速', '34130000004');
INSERT INTO zsys_oil_station VALUES ('495', '虞姬服务区北区', '虞姬北区', '安徽省宿州市灵璧县S04泗宿高速虞姬服务区', '', '2', '13855772312', '0', '495', null, null, '2019-09-28 17:34:42', '1', '117.597489', '33.603259', '340000', '安徽省', '341300', '宿州市', '341323', '灵璧县', '1', '中国石化', 'S04', '泗宿高速', '34130000004');
INSERT INTO zsys_oil_station VALUES ('496', '中国石油天然气股份有限公司枣庄7站', '中石油枣庄7站', '市中区青檀路与文化路交界口向南80米路东', 'https://oss.etcsd.com/object/5cb54c90549ecdf1d78c0ae4', null, '06323336856', '0', '496', null, null, '2019-09-28 17:34:42', '1', '117.565169', '34.872834', '370000', '山东省', '370400', '枣庄市', '370402', '市中区', '0', '山东石化', '', '', '37040000488');
INSERT INTO zsys_oil_station VALUES ('497', '石龙湖服务区东区', '石龙湖东区', '安徽省宿州市泗县S07徐明高速石龙湖服务区', '', '2', '13856700703', '0', '497', null, null, '2019-09-28 17:34:43', '1', '117.840828', '33.307337', '340000', '安徽省', '341300', '宿州市', '341324', '泗县', '1', '中国石化', 'S07', '徐明高速', '34130000005');
INSERT INTO zsys_oil_station VALUES ('498', '石龙湖服务区西区', '石龙湖西区', '安徽省宿州市泗县S07徐明高速石龙湖服务区', '', '2', '13856700703', '0', '498', null, null, '2019-09-28 17:34:43', '1', '117.839384', '33.306391', '340000', '安徽省', '341300', '宿州市', '341324', '泗县', '1', '中国石化', 'S07', '徐明高速', '34130000005');
INSERT INTO zsys_oil_station VALUES ('500', '符离服务区东区', '符离东区', '安徽省宿州市埇桥区G3京台高速符离服务区', '', '2', '13955709209', '0', '500', null, null, '2019-09-28 17:34:43', '1', '116.942716', '33.734642', '340000', '安徽省', '341300', '宿州市', '341302', '埇桥区', '1', '中国石化', 'G3', '京台高速', '34130000006');
INSERT INTO zsys_oil_station VALUES ('502', '符离服务区西区', '符离西区', '安徽省宿州市埇桥区G3京台高速符离服务区', '', '2', '13955709209', '0', '502', null, null, '2019-09-28 17:34:43', '1', '116.941409', '33.734342', '340000', '安徽省', '341300', '宿州市', '341302', '埇桥区', '1', '中国石化', 'G3', '京台高速', '34130000006');
INSERT INTO zsys_oil_station VALUES ('503', '濉溪服务区南区', '濉溪南区', '安徽省淮北市濉溪县S06宿登高速濉溪服务区', '', '2', '15357809797', '0', '503', null, null, '2019-09-28 17:34:44', '1', '116.720553', '33.754897', '340000', '安徽省', '340600', '淮北市', '340621', '濉溪县', '1', '中国石化', 'S06', '宿登高速', '34060000001');
INSERT INTO zsys_oil_station VALUES ('504', '中国石油天然气股份有限公司中石油日照第39加油站', '中石油日照第39加油站', '日照市东港区上海路与海滨四路交汇处东北角', '', '1', '18863306539', '0', '504', null, null, '2019-09-28 17:34:44', '1', '119.544499', '35.388319', '370000', '山东省', '371100', '日照市', '371102', '东港区', '0', '中石油', '', '', '37110000298');
INSERT INTO zsys_oil_station VALUES ('506', '中国石油天然气股份有限公司中石油日照第31加油站', '中石油日照第31加油站', '莒县淄博路与莒安路（青年路）交汇处西南', '', '1', '18863306531', '0', '506', null, null, '2019-09-28 17:34:44', '1', '118.836040', '35.638445', '370000', '山东省', '371100', '日照市', '371122', '莒县', '0', '中石油', '', '', '37110000266');
INSERT INTO zsys_oil_station VALUES ('508', '中国石油天然气股份有限公司中石油日照第35加油站', '中石油日照第35加油站', '莒县日东高速莒县东出入口以北，225省道以西', '', '1', '18863306535', '0', '508', null, null, '2019-09-28 17:34:44', '1', '118.837747', '35.465857', '370000', '山东省', '371100', '日照市', '371122', '莒县', '0', '中石油', '', '', '37110000267');
INSERT INTO zsys_oil_station VALUES ('509', '濉溪服务区北区', '濉溪北区', '安徽省淮北市濉溪县S06宿登高速濉溪服务区', '', '2', '15357809797', '0', '509', null, null, '2019-09-28 17:34:45', '1', '116.718824', '33.756710', '340000', '安徽省', '340600', '淮北市', '340621', '濉溪县', '1', '中国石化', 'S06', '宿登高速', '34060000001');
INSERT INTO zsys_oil_station VALUES ('510', '中国石油天然气股份有限公司中石油日照第36加油站', '中石油日照第36加油站', '莒县夏庄镇日东高速出口南2公里', '', '1', '18863306536', '0', '510', null, null, '2019-09-28 17:34:45', '1', '118.717329', '35.436713', '370000', '山东省', '371100', '日照市', '371122', '莒县', '0', '中石油', '', '', '37110000268');
INSERT INTO zsys_oil_station VALUES ('511', '王寨服务区南区', '王寨南区', '安徽省宿州市萧县G30连霍高速王寨服务区', '', '2', '15385727777', '0', '511', null, null, '2019-09-28 17:34:45', '1', '116.760399', '34.116615', '340000', '安徽省', '341300', '宿州市', '341322', '萧县', '1', '中国石化', 'G30', '连霍高速', '34130000002');
INSERT INTO zsys_oil_station VALUES ('512', '王寨服务区北区', '王寨北区', '安徽省宿州市萧县G30连霍高速王寨服务区', '', '2', '15385727777', '0', '512', null, null, '2019-09-28 17:34:45', '1', '116.759111', '34.117136', '340000', '安徽省', '341300', '宿州市', '341322', '萧县', '1', '中国石化', 'G30', '连霍高速', '34130000002');
INSERT INTO zsys_oil_station VALUES ('513', '中国石油天然气股份有限公司中石油日照第1加油站', '中石油日照第1加油站', '山东省日照市东港区两城镇北与胶南市交界处', '', '1', '15615131951', '0', '513', null, null, '2019-09-28 17:34:46', '1', '119.627470', '35.609513', '370000', '山东省', '371100', '日照市', '371102', '东港区', '0', '中石油', '', '', '37110000269');
INSERT INTO zsys_oil_station VALUES ('514', '庄里服务区东区', '庄里东区', '安徽省宿州市萧县G3京台高速庄里服务区', '', '2', '13855702900', '0', '514', null, null, '2019-09-28 17:34:46', '1', '116.983884', '33.978464', '340000', '安徽省', '341300', '宿州市', '341322', '萧县', '1', '中国石化', 'G3', '京台高速', '34130000001');
INSERT INTO zsys_oil_station VALUES ('515', '庄里服务区西区', '庄里西区', '安徽省宿州市萧县G3京台高速庄里服务区', '', '2', '13855702900', '0', '515', null, null, '2019-09-28 17:34:46', '1', '116.980997', '33.977346', '340000', '安徽省', '341300', '宿州市', '341322', '萧县', '1', '中国石化', 'G3', '京台高速', '34130000001');
INSERT INTO zsys_oil_station VALUES ('516', '中国石油天然气股份有限公司中石油日照第13加油站', '中石油日照第13加油站', '山东省日照市岚山汾水镇', '', '1', '18863306513', '0', '516', null, null, '2019-09-28 17:34:46', '1', '119.273816', '35.142024', '370000', '山东省', '371100', '日照市', '371103', '岚山区', '0', '中石油', '', '', '37110000270');
INSERT INTO zsys_oil_station VALUES ('517', '中国石油天然气股份有限公司中石油日照第10加油站', '中石油日照第10加油站', '山东省日照市五莲县,沿河路一号,222省道路南', '', '1', '18863306510', '0', '517', null, null, '2019-09-28 17:34:47', '1', '119.209531', '35.729111', '370000', '山东省', '371100', '日照市', '371121', '五莲县', '0', '中石油', '', '', '37110000271');
INSERT INTO zsys_oil_station VALUES ('520', '中国石油天然气股份有限公司中石油日照第11加油站', '中石油日照第11加油站', '山东省日照市五莲县,北环路与222省道交汇处北角', '', '1', '18863306511', '0', '520', null, null, '2019-09-28 17:34:47', '1', '119.224522', '35.814905', '370000', '山东省', '371100', '日照市', '371121', '五莲县', '0', '中石油', '', '', '37110000272');
INSERT INTO zsys_oil_station VALUES ('521', '中国石油天然气股份有限公司中石油日照第9加油站', '中石油日照第9加油站', '日照市经济开发区临沂路与上海路交汇处西南角', '', '1', '18863306509', '0', '521', null, null, '2019-09-28 17:34:48', '1', '119.511219', '35.384651', '370000', '山东省', '371100', '日照市', '371102', '东港区', '0', '中石油', '', '', '37110000273');
INSERT INTO zsys_oil_station VALUES ('522', '中国石油天然气股份有限公司中石油日照第41加油站', '中石油日照第41加油站', '莒县龙山镇335省道，龙山第二中学西', '', '1', '18863306541', '0', '522', null, null, '2019-09-28 17:34:48', '1', '119.014470', '35.512243', '370000', '山东省', '371100', '日照市', '371122', '莒县', '0', '中石油', '', '', '37110000274');
INSERT INTO zsys_oil_station VALUES ('523', '中国石油天然气股份有限公司中石油日照第37加油站', '中石油日照第37加油站', '青临高速公路莒县出入口东南335省道北侧莒县浮来山镇西刘家官庄', '', '1', '18863306537', '0', '523', null, null, '2019-09-28 17:34:48', '1', '118.716790', '35.697107', '370000', '山东省', '371100', '日照市', '371122', '莒县', '0', '中石油', '', '', '37110000275');
INSERT INTO zsys_oil_station VALUES ('524', '中国石油天然气股份有限公司中石油日照第3加油站', '中石油日照第3加油站', '潮石公路与G204交叉口', '', '1', '18863306503', '0', '524', null, null, '2019-09-28 17:34:48', '1', '119.524081', '35.535111', '370000', '山东省', '371100', '日照市', '371102', '东港区', '0', '中石油', '', '', '37110000276');
INSERT INTO zsys_oil_station VALUES ('525', '中国石油天然气股份有限公司中石油日照第16加油站', '中石油日照第16加油站', '五莲沿河路100号，沿河路与电厂路交叉向北', '', '1', '18863306516', '0', '525', null, null, '2019-09-28 17:34:49', '1', '119.198765', '35.779772', '370000', '山东省', '371100', '日照市', '371121', '五莲县', '0', '中石油', '', '', '37110000277');
INSERT INTO zsys_oil_station VALUES ('526', '中国石油天然气股份有限公司枣庄21站', '中石油枣庄21站', '市中区北外环', 'https://oss.etcsd.com/object/5cb54c90549ecdf1d78c0ae6', '1', '06323742671', '0', '526', null, null, '2019-09-28 17:34:49', '1', '117.531715', '34.889957', '370000', '山东省', '370400', '枣庄市', '370402', '市中区', '0', '中石油', '', '', '37040000492');
INSERT INTO zsys_oil_station VALUES ('527', '中国石油天然气股份有限公司枣庄33站', '中石油枣庄33站', '市中区建华西路路南', 'https://oss.etcsd.com/object/5cb54c90549ecdf1d78c0ae8', '1', '06323180786', '0', '527', null, null, '2019-09-28 17:34:49', '1', '117.526283', '34.856171', '370000', '山东省', '370400', '枣庄市', '370402', '市中区', '0', '中石油', '', '', '37040000494');
INSERT INTO zsys_oil_station VALUES ('528', '中国石油天然气股份有限公司枣庄48站', '中石油枣庄48站', '市中区龙头路与西昌路交叉口东北角', 'https://oss.etcsd.com/object/5cb54c90a055fa236fb32808', '1', '06323098608', '0', '528', null, null, '2019-09-28 17:34:49', '1', '117.536880', '34.846060', '370000', '山东省', '370400', '枣庄市', '370402', '市中区', '0', '中石油', '', '', '37040000501');
INSERT INTO zsys_oil_station VALUES ('529', '中国石油天然气股份有限公司枣庄50站', '中石油枣庄50站', '山东省枣庄市市中区206国道与光明东路交叉处', 'https://oss.etcsd.com/object/5cb54c90a055fa236fb3280a', '1', '06323713899', '0', '529', null, null, '2019-09-28 17:34:50', '1', '117.573522', '34.842676', '370000', '山东省', '370400', '枣庄市', '370402', '市中区', '0', '中石油', '', '', '37040000530');
INSERT INTO zsys_oil_station VALUES ('530', '蟠龙山服务区南区', '蟠龙山南区', '安徽省宿州市泗县S04泗宿高速蟠龙山服务区', '', '2', '18005575521', '0', '530', null, null, '2019-09-28 17:34:50', '1', '118.052939', '33.535443', '340000', '安徽省', '341300', '宿州市', '341324', '泗县', '1', '中国石化', 'S04', '泗宿高速', '34130000008');
INSERT INTO zsys_oil_station VALUES ('531', '蟠龙山服务区北区', '蟠龙山北区', '安徽省宿州市泗县S04泗宿高速蟠龙山服务区', '', '2', '18005575521', '0', '531', null, null, '2019-09-28 17:34:50', '1', '118.053133', '33.536824', '340000', '安徽省', '341300', '宿州市', '341324', '泗县', '1', '中国石化', 'S04', '泗宿高速', '34130000008');
INSERT INTO zsys_oil_station VALUES ('532', '冯庙服务区东区', '冯庙东区', '安徽省宿州市泗县S07徐明高速冯庙服务区', '', '2', '18755749057', '0', '532', null, null, '2019-09-28 17:34:50', '1', '117.697109', '33.694481', '340000', '安徽省', '341300', '宿州市', '341323', '灵璧县', '1', '中国石化', 'S07', '徐明高速', '34130000009');
INSERT INTO zsys_oil_station VALUES ('533', '冯庙服务区西区', '冯庙西区', '安徽省宿州市泗县S07徐明高速冯庙服务区', '', '2', '18755749057', '0', '533', null, null, '2019-09-28 17:34:50', '1', '117.695743', '33.692998', '340000', '安徽省', '341300', '宿州市', '341323', '灵璧县', '1', '中国石化', 'S07', '徐明高速', '34130000009');
INSERT INTO zsys_oil_station VALUES ('534', '千军服务区南区', '千军南区', '安徽省芜湖市繁昌县G50沪渝高速千军服务区', '', '2', '15155355908', '0', '534', null, null, '2019-09-28 17:34:51', '1', '118.279332', '31.095243', '340000', '安徽省', '340200', '芜湖市', '340222', '繁昌县', '1', '中国石化', 'G50', '沪渝高速', '34020000001');
INSERT INTO zsys_oil_station VALUES ('535', '千军服务区北区', '千军北区', '安徽省芜湖市繁昌县G50沪渝高速千军服务区', '', '2', '15155355908', '0', '535', null, null, '2019-09-28 17:34:51', '1', '118.275714', '31.095229', '340000', '安徽省', '340200', '芜湖市', '340222', '繁昌县', '1', '中国石化', 'G50', '沪渝高速', '34020000001');
INSERT INTO zsys_oil_station VALUES ('536', '新竹服务区东区', '新竹东区', '安徽省芜湖市芜湖县G50沪渝高速新竹服务区', '', '2', '13645538107', '0', '536', null, null, '2019-09-28 17:34:51', '1', '118.601768', '31.217194', '340000', '安徽省', '340200', '芜湖市', '340221', '芜湖县', '1', '中国石化', 'G50', '沪渝高速', '34020000002');
INSERT INTO zsys_oil_station VALUES ('537', '新竹服务区西区', '新竹西区', '安徽省芜湖市芜湖县G50沪渝高速新竹服务区', '', '2', '13645538107', '0', '537', null, null, '2019-09-28 17:34:52', '1', '118.601059', '31.215677', '340000', '安徽省', '340200', '芜湖市', '340221', '芜湖县', '1', '中国石化', 'G50', '沪渝高速', '34020000002');
INSERT INTO zsys_oil_station VALUES ('538', '宁国服务区东区', '宁国东区', '安徽省宣城市宁国市S01溧黄高速宁国服务区', '', '2', '15156312931', '0', '538', null, null, '2019-09-28 17:34:52', '1', '119.013824', '30.555564', '340000', '安徽省', '341800', '宣城市', '341881', '宁国市', '1', '中国石化', 'S01', '溧黄高速', '34180000001');
INSERT INTO zsys_oil_station VALUES ('539', '宁国服务区西区', '宁国西区', '安徽省宣城市宁国市S01溧黄高速宁国服务区', '', '2', '15156312931', '0', '539', null, null, '2019-09-28 17:34:52', '1', '119.011692', '30.555114', '340000', '安徽省', '341800', '宣城市', '341881', '宁国市', '1', '中国石化', 'S01', '溧黄高速', '34180000001');
INSERT INTO zsys_oil_station VALUES ('540', '顺安服务区东区', '顺安东区', '安徽省铜陵市义安区G50沪渝高速顺安服务区', '', '2', '18756224000', '0', '540', null, null, '2019-09-28 17:34:52', '1', '117.973139', '30.933748', '340000', '安徽省', '340700', '铜陵市', '340706', '义安区', '1', '中国石化', 'G50', '沪渝高速', '34070000001');
INSERT INTO zsys_oil_station VALUES ('541', '顺安服务区西区', '顺安西区', '安徽省铜陵市义安区G50沪渝高速顺安服务区', '', '2', '18756224000', '0', '541', null, null, '2019-09-28 17:34:52', '1', '117.970884', '30.933694', '340000', '安徽省', '340700', '铜陵市', '340706', '义安区', '1', '中国石化', 'G50', '沪渝高速', '34070000001');
INSERT INTO zsys_oil_station VALUES ('542', '天门服务区南区', '天门南区', '安徽省铜陵市义安区G50沪渝高速天门服务区', '', '2', '18956242500', '0', '542', null, null, '2019-09-28 17:34:53', '1', '117.826083', '30.833950', '340000', '安徽省', '340700', '铜陵市', '340706', '义安区', '1', '中国石化', 'G50', '沪渝高速', '34070000002');
INSERT INTO zsys_oil_station VALUES ('543', '天门服务区北区', '天门北区', '安徽省铜陵市义安区G50沪渝高速天门服务区', '', '2', '18956242500', '0', '543', null, null, '2019-09-28 17:34:53', '1', '117.823504', '30.834919', '340000', '安徽省', '340700', '铜陵市', '340706', '义安区', '1', '中国石化', 'G50', '沪渝高速', '34070000002');
INSERT INTO zsys_oil_station VALUES ('546', '中国石油天然气股份有限公司烟台第18加油站', '中石油烟台18站', '烟台市牟平区北关大街与东关路交叉口西南角', '', '1', '13853579711', '0', '546', null, null, '2019-09-28 17:34:53', '1', '121.611120', '37.390150', '370000', '山东省', '370600', '烟台市', '370612', '牟平区', '0', '中石油', '', '', '37060000424');
INSERT INTO zsys_oil_station VALUES ('548', '中国石油天然气股份有限公司中石油日照第48加油站', '中石油日照第48加油站', '日照市山海路与兖州路交叉口', '', '1', '18863306548', '0', '548', null, null, '2019-09-28 17:34:53', '1', '119.504006', '35.475651', '370000', '山东省', '371100', '日照市', '371101', '市辖区', '0', '中石油', '', '', '37110000278');
INSERT INTO zsys_oil_station VALUES ('549', '香铺服务区东区', '香铺东区', '安徽省安庆市桐城市G4212合安高速香铺服务区', '', '2', '13905566450', '0', '549', null, null, '2019-09-28 17:34:54', '1', '116.944038', '30.915966', '340000', '安徽省', '340800', '安庆市', '340881', '桐城市', '1', '中国石化', 'S4212', '合安高速', '34080000009');
INSERT INTO zsys_oil_station VALUES ('550', '中国石油天然气股份有限公司中石油日照第17加油站', '中石油日照第17加油站', 'G204国道小莲村驻地', '', '1', '18863306517', '0', '550', null, null, '2019-09-28 17:34:54', '1', '119.485203', '35.475624', '370000', '山东省', '371100', '日照市', '371102', '东港区', '0', '中石油', '', '', '37110000279');
INSERT INTO zsys_oil_station VALUES ('551', '香铺服务区西区', '香铺西区', '安徽省安庆市桐城市G4213合安高速香铺服务区', '', '2', '13905566450', '0', '551', null, null, '2019-09-28 17:34:54', '1', '116.942085', '30.913780', '340000', '安徽省', '340800', '安庆市', '340881', '桐城市', '1', '中国石化', 'S4212', '合安高速', '34080000009');
INSERT INTO zsys_oil_station VALUES ('552', '中国石油天然气股份有限公司中石油日照第44加油站', '中石油日照第44加油站', '莒县日照路与青年路交汇处西北角，惠万家生活广场西临', '', '1', '18863306544', '0', '552', null, null, '2019-09-28 17:34:54', '1', '118.833853', '35.611998', '370000', '山东省', '371100', '日照市', '371122', '莒县', '0', '中石油', '', '', '37110000280');
INSERT INTO zsys_oil_station VALUES ('553', '中国石油天然气股份有限公司烟台第19加油站', '中石油烟台19站', '烟台市福山区福海路仁济医院北', '', '1', '13156915658', '0', '553', null, null, '2019-09-28 17:34:55', '1', '121.259040', '37.506640', '370000', '山东省', '370600', '烟台市', '370611', '福山区', '0', '中石油', '', '', '37060000425');
INSERT INTO zsys_oil_station VALUES ('555', '公岭服务区南区', '公岭南区', '安徽省安庆市怀宁县G50沪渝高速公岭服务区', '', '2', '13855688345', '0', '555', null, null, '2019-09-28 17:34:55', '1', '116.746309', '30.695143', '340000', '安徽省', '340800', '安庆市', '340822', '怀宁县', '1', '中国石化', 'G50', '沪渝高速', '34080000010');
INSERT INTO zsys_oil_station VALUES ('556', '公岭服务区北区', '公岭北区', '安徽省安庆市怀宁县G50沪渝高速公岭服务区', '', '2', '13855688345', '0', '556', null, null, '2019-09-28 17:34:55', '1', '116.744459', '30.695900', '340000', '安徽省', '340800', '安庆市', '340822', '怀宁县', '1', '中国石化', 'G50', '沪渝高速', '34080000010');
INSERT INTO zsys_oil_station VALUES ('557', '大龙山服务区东区', '大龙山东区', '安徽省安庆市宜秀区G50沪渝高速大龙山服务区', '', '2', '13855698279', '0', '557', null, null, '2019-09-28 17:34:55', '1', '117.018385', '30.637132', '340000', '安徽省', '340800', '安庆市', '340811', '宜秀区', '1', '中国石化', 'G50', '沪渝高速', '34080000011');
INSERT INTO zsys_oil_station VALUES ('559', '三角元服务区东区', '三角元服务区东区', '安徽省阜阳市太和县G36宁洛高速三角元服务区', '', '2', '13909680117', '0', '559', null, null, '2019-09-28 17:34:56', '1', '116.480175', '33.188767', '340000', '安徽省', '341200', '阜阳市', '341222', '太和县', '1', '中国石化', 'G36', '宁洛高速', '34120000002');
INSERT INTO zsys_oil_station VALUES ('560', '三角元服务区西区', '三角元服务区西区', '安徽省阜阳市太和县G36宁洛高速三角元服务区', '', '2', '13909680117', '0', '560', null, null, '2019-09-28 17:34:56', '1', '116.478962', '33.190247', '340000', '安徽省', '341200', '阜阳市', '341222', '太和县', '1', '中国石化', 'G36', '宁洛高速', '34120000002');
INSERT INTO zsys_oil_station VALUES ('561', '吕望服务区南区', '吕望服务区南区', '安徽省亳州市蒙城县G36宁洛高速吕望服务区', '', '2', '13655675887', '0', '561', null, null, '2019-09-28 17:34:56', '1', '116.480139', '33.188767', '340000', '安徽省', '341600', '亳州市', '341622', '蒙城县', '1', '中国石化', 'G36', '宁洛高速', '34160000001');
INSERT INTO zsys_oil_station VALUES ('563', '吕望服务区北区', '吕望服务区北区', '安徽省亳州市蒙城县G36宁洛高速吕望服务区', '', '2', '13655675887', '0', '563', null, null, '2019-09-28 17:34:56', '1', '116.478971', '33.190239', '340000', '安徽省', '341600', '亳州市', '341622', '蒙城县', '1', '中国石化', 'G36', '宁洛高速', '34160000001');
INSERT INTO zsys_oil_station VALUES ('564', '大龙山服务区西区', '大龙山西区', '安徽省安庆市宜秀区G50沪渝高速靠近邵家祠堂', '', '2', '13855698279', '0', '564', null, null, '2019-09-28 17:34:57', '1', '117.014552', '30.622985', '340000', '安徽省', '340800', '安庆市', '340811', '宜秀区', '1', '中国石化', 'G50', '沪渝高速', '34080000012');
INSERT INTO zsys_oil_station VALUES ('565', '中国石油天然气股份有限公司枣庄16站', '中石油枣庄16站', '滕州市文昌路', 'https://oss.etcsd.com/object/5cb54c90549ecdf1d78c0aea', '1', '06325638928', '0', '565', null, null, '2019-09-28 17:34:57', '1', '117.203003', '35.046763', '370000', '山东省', '370400', '枣庄市', '370481', '滕州市', '0', '中石油', '', '', '37040000555');
INSERT INTO zsys_oil_station VALUES ('566', '阳城三路加油站', '阳城三路加油站', '阳信县阳城三路以南、大济路以西', '', '1', '13173285453', '0', '566', null, null, '2019-09-28 17:34:57', '1', '117.623584', '37.646265', '370000', '山东省', '371600', '滨州市', '371622', '阳信县', '0', '中石油', '', '', '37160000442');
INSERT INTO zsys_oil_station VALUES ('567', '雷埠服务区东区', '雷埠东区', '安徽省安庆市怀宁县G35济广高速雷埠服务区', '', '2', '15205665562', '0', '567', null, null, '2019-09-28 17:34:57', '1', '116.568078', '30.411717', '340000', '安徽省', '340800', '安庆市', '340822', '怀宁县', '1', '中国石化', 'G35', '济广高速', '34080000013');
INSERT INTO zsys_oil_station VALUES ('568', '雷埠服务区西区', '雷埠西区', '安徽省安庆市怀宁县G35济广高速雷埠服务区', '', '2', '15205665562', '0', '568', null, null, '2019-09-28 17:34:57', '1', '116.566770', '30.411115', '340000', '安徽省', '340800', '安庆市', '340822', '怀宁县', '1', '中国石化', 'G35', '济广高速', '34080000013');
INSERT INTO zsys_oil_station VALUES ('569', '中国石油天然气股份有限公司枣庄18站', '中石油枣庄18站', '滕州市平行路与龙山路交叉口北100米路西', 'https://oss.etcsd.com/object/5cb54c90a055fa236fb3280c', '1', '06325609160', '0', '569', null, null, '2019-09-28 17:34:58', '1', '117.165959', '35.113379', '370000', '山东省', '370400', '枣庄市', '370481', '滕州市', '0', '中石油', '', '', '37040000491');
INSERT INTO zsys_oil_station VALUES ('571', '潜山服务区东区', '潜山东区', '安徽省安庆市潜山县G35济广高速潜山服务区', '', '2', '13805617040', '0', '571', null, null, '2019-09-28 17:34:58', '1', '116.504941', '30.660164', '340000', '安徽省', '340800', '安庆市', '340824', '潜山县', '1', '中国石化', 'G35', '济广高速', '34080000001');
INSERT INTO zsys_oil_station VALUES ('572', '中国石油天然气股份有限公司山东淄博销售分公司第72加油站', '淄博72站', '水产市场南邻', '', '1', '13280651067', '0', '572', null, null, '2019-09-28 17:34:58', '1', '117.942970', '36.651330', '370000', '山东省', '370300', '淄博市', '370302', '淄川区', '0', '中石油', '', '', '37030000252');
INSERT INTO zsys_oil_station VALUES ('573', '中国石油天然气股份有限公司枣庄58站', '中石油枣庄58站', '枣庄光明路中段', 'https://oss.etcsd.com/object/5cb54c90a055fa236fb3280e', '1', '06324626806', '0', '573', null, null, '2019-09-28 17:34:58', '1', '117.383522', '34.819698', '370000', '山东省', '370400', '枣庄市', '370403', '薛城区', '0', '中石油', '', '', '37040000509');
INSERT INTO zsys_oil_station VALUES ('574', '潜山服务区西区', '潜山西区', '安徽省安庆市潜山县G35济广高速潜山服务区', '', '2', '13805617040', '0', '574', null, null, '2019-09-28 17:34:59', '1', '116.515751', '30.629966', '340000', '安徽省', '340800', '安庆市', '340824', '潜山县', '1', '中国石化', 'G35', '济广高速', '34080000001');
INSERT INTO zsys_oil_station VALUES ('575', '定远服务区东区', '定远服务区东区', '安徽省滁州市定远县滁淮高速定远服务区', '', '2', '13865254708', '0', '575', null, null, '2019-09-28 17:34:59', '1', '117.747607', '32.396611', '340000', '安徽省', '341100', '滁州市', '341125', '定远县', '1', '中国石化', '', '', '34110000008');
INSERT INTO zsys_oil_station VALUES ('576', '中国石油天然气股份有限公司山东淄博销售分公司第80加油站', '淄博80站', '联合化工东临', '', '1', '15169303170', '0', '576', null, null, '2019-09-28 17:34:59', '1', '118.200274', '36.174535', '370000', '山东省', '370300', '淄博市', '370323', '沂源县', '0', '中石油', '', '', '37030000294');
INSERT INTO zsys_oil_station VALUES ('577', '定远服务区西区', '定远服务区西区', '安徽省滁州市定远县滁淮高速定远服务区', '', '2', '13865254708', '0', '577', null, null, '2019-09-28 17:34:59', '1', '117.746125', '32.395590', '340000', '安徽省', '341100', '滁州市', '341125', '定远县', '1', '中国石化', '', '', '34110000008');
INSERT INTO zsys_oil_station VALUES ('578', '中国石油天然气股份有限公司枣庄61站', '中石油枣庄61站', '枣庄市薛城区天山路与辽河西路交界处东南角', 'https://oss.etcsd.com/object/5cb54c90549ecdf1d78c0aec', '1', '06327683277', '0', '578', null, null, '2019-09-28 17:34:59', '1', '117.303639', '34.818166', '370000', '山东省', '370400', '枣庄市', '370403', '薛城区', '0', '中石油', '', '', '37040000507');
INSERT INTO zsys_oil_station VALUES ('580', '中国石油天然气股份有限公司烟台第20加油站', '中石油烟台20站', '烟台市芝罘区幸福南路13号', '', '1', '13953557750', '0', '580', null, null, '2019-09-28 17:35:00', '1', '121.354967', '37.566566', '370000', '山东省', '370600', '烟台市', '370602', '芝罘区', '0', '中石油', '', '', '37060000426');
INSERT INTO zsys_oil_station VALUES ('581', '中国石油天然气股份有限公司枣庄3站', '中石油枣庄3站', '枣庄市峄城区', 'https://oss.etcsd.com/object/5cb54c90549ecdf1d78c0aee', '1', '06327756028', '0', '581', null, null, '2019-09-28 17:35:00', '1', '117.590611', '34.772280', '370000', '山东省', '370400', '枣庄市', '370404', '峄城区', '0', '中石油', '', '', '37040000553');
INSERT INTO zsys_oil_station VALUES ('582', '中国石油天然气股份有限公司山东淄博销售分公司第31加油站', '淄博31站', '高苑路与齐东路南100米', '', '1', '18853357968', '0', '582', null, null, '2019-09-28 17:35:00', '1', '117.821960', '37.163930', '370000', '山东省', '370300', '淄博市', '370322', '高青县', '0', '中石油', '', '', '37030000260');
INSERT INTO zsys_oil_station VALUES ('583', '升金湖服务区东区', '升金湖东区', '安徽省安庆市东至县S12安东高速升金湖服务区', '', '2', '13965942221', '0', '583', null, null, '2019-09-28 17:35:00', '1', '116.972389', '30.353327', '340000', '安徽省', '340800', '安庆市', '340801', '市辖区', '1', '中国石化', '', '', '34170000001');
INSERT INTO zsys_oil_station VALUES ('584', '石涧服务区东区', '石涧服务区东区', '安徽省芜湖市无为县S22天潜高速石涧服务区', '', '2', '13865254708', '0', '584', null, null, '2019-09-28 17:35:00', '1', '117.959473', '31.383710', '340000', '安徽省', '340200', '芜湖市', '340225', '无为县', '1', '中国石化', '', '', '34020000006');
INSERT INTO zsys_oil_station VALUES ('585', '中国石油天然气股份有限公司山东淄博销售分公司第83加油站', '淄博83站', '中医院北', '', '1', '18853328283', '0', '585', null, null, '2019-09-28 17:35:01', '1', '117.821760', '37.183720', '370000', '山东省', '370300', '淄博市', '370322', '高青县', '0', '中石油', '', '', '37030000300');
INSERT INTO zsys_oil_station VALUES ('586', '升金湖服务区西区', '升金湖西区', '安徽省安庆市东至县S13安东高速升金湖服务区', '', '2', '13965942221', '0', '586', null, null, '2019-09-28 17:35:01', '1', '116.970981', '30.350863', '340000', '安徽省', '340800', '安庆市', '340801', '市辖区', '1', '中国石化', '', '', '34170000001');
INSERT INTO zsys_oil_station VALUES ('587', '中国石油天然气股份有限公司枣庄49站', '中石油枣庄49站', '峄城区坛山街道办桃花北路路东', 'https://oss.etcsd.com/object/5cb54c90a055fa236fb32810', '1', '06327783699', '0', '587', null, null, '2019-09-28 17:35:01', '1', '117.593732', '34.762581', '370000', '山东省', '370400', '枣庄市', '370404', '峄城区', '0', '中石油', '', '', '37040000502');
INSERT INTO zsys_oil_station VALUES ('588', '石涧服务区西区', '石涧服务区西区', '安徽省芜湖市无为县S22天潜高速石涧服务区', '', '2', '13865254708', '0', '588', null, null, '2019-09-28 17:35:01', '1', '117.926670', '31.480925', '340000', '安徽省', '340200', '芜湖市', '340225', '无为县', '1', '中国石化', '', '', '34020000006');
INSERT INTO zsys_oil_station VALUES ('590', '中国石油天然气股份有限公司山东淄博销售分公司第82加油站', '淄博82站', '西首路南', '', '1', '13573342289', '0', '590', null, null, '2019-09-28 17:35:02', '1', '117.813260', '37.169610', '370000', '山东省', '370300', '淄博市', '370322', '高青县', '0', '中石油', '', '', '37030000299');
INSERT INTO zsys_oil_station VALUES ('591', '中国石油天然气股份有限公司山东淄博销售分公司第81加油站', '淄博81站', '木李镇大刘村西', '', '1', '13573390280', '0', '591', null, null, '2019-09-28 17:35:02', '1', '117.680310', '37.233380', '370000', '山东省', '370300', '淄博市', '370322', '高青县', '0', '中石油', '', '', '37030000298');
INSERT INTO zsys_oil_station VALUES ('592', '中国石油天然气股份有限公司山东淄博销售分公司第78加油站', '淄博78站', '北山路中段', '', '1', '13573393686', '0', '592', null, null, '2019-09-28 17:35:02', '1', '117.855450', '36.523570', '370000', '山东省', '370300', '淄博市', '370304', '博山区', '0', '中石油', '', '', '37030000297');
INSERT INTO zsys_oil_station VALUES ('593', '仓头服务区东区', '仓头服务区东区', '安徽省芜湖市无为县S11巢黄高速仓头服务区', '', '2', '13855342832', '0', '593', null, null, '2019-09-28 17:35:02', '1', '117.959473', '31.384721', '340000', '安徽省', '340200', '芜湖市', '340225', '无为县', '1', '中国石化', '', '', '34020000005');
INSERT INTO zsys_oil_station VALUES ('595', '中国石油天然气股份有限公司山东淄博销售分公司第77加油站', '淄博77站', '大王村西', '', '1', '13589573206', '0', '595', null, null, '2019-09-28 17:35:03', '1', '118.172710', '36.833180', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '中石油', '', '', '37030000296');
INSERT INTO zsys_oil_station VALUES ('596', '仓头服务区西区', '仓头服务区西区', '安徽省芜湖市无为县S11巢黄高速仓头服务区', '', '2', '13855342832', '0', '596', null, null, '2019-09-28 17:35:03', '1', '117.959473', '31.383710', '340000', '安徽省', '340200', '芜湖市', '340225', '无为县', '1', '中国石化', '', '', '34020000005');
INSERT INTO zsys_oil_station VALUES ('597', '九华山服务区东区', '九华山东区', '安徽省池州市青阳县G3京台高速九华山服务区', '', '2', '13856611397', '0', '597', null, null, '2019-09-28 17:35:03', '1', '117.946620', '30.596498', '340000', '安徽省', '341700', '池州市', '341723', '青阳县', '1', '中国石化', 'G3', '京台高速', '34170000003');
INSERT INTO zsys_oil_station VALUES ('598', '中国石油天然气股份有限公司山东淄博销售分公司第69加油站', '淄博69站', '商王村南300米', '', '1', '13455351465', '0', '598', null, null, '2019-09-28 17:35:03', '1', '118.345090', '36.802660', '370000', '山东省', '370300', '淄博市', '370305', '临淄区', '0', '中石油', '', '', '37030000293');
INSERT INTO zsys_oil_station VALUES ('599', '中国石油天然气股份有限公司烟台第22加油站', '中石油烟台22站', '烟台市福山区福新街道办事处炉上村北（206国道旁）', '', '1', '18663843211', '0', '599', null, null, '2019-09-28 17:35:04', '1', '121.217240', '37.545160', '370000', '山东省', '370600', '烟台市', '370611', '福山区', '0', '中石油', '', '', '37060000385');
INSERT INTO zsys_oil_station VALUES ('600', '香泉服务区东区', '香泉服务区东区', '安徽省马鞍山市和县S22天潜高速香泉服务区', '', '2', '15155913900', '0', '600', null, null, '2019-09-28 17:35:04', '1', '118.349156', '31.932058', '340000', '安徽省', '340500', '马鞍山市', '340523', '和县', '1', '中国石化', '', '', '34050000004');
INSERT INTO zsys_oil_station VALUES ('601', '九华山服务区西区', '九华山西区', '安徽省池州市青阳县G4京台高速九华山服务区', '', '2', '13856611397', '0', '601', null, null, '2019-09-28 17:35:04', '1', '117.945865', '30.594555', '340000', '安徽省', '341700', '池州市', '341723', '青阳县', '1', '中国石化', 'G3', '京台高速', '34170000003');
INSERT INTO zsys_oil_station VALUES ('602', '中国石油天然气股份有限公司山东淄博销售分公司第68加油站', '淄博68站', '梧台镇辛河路11公里处', '', '1', '15092321558', '0', '602', null, null, '2019-09-28 17:35:04', '1', '118.314710', '36.923840', '370000', '山东省', '370300', '淄博市', '370305', '临淄区', '0', '中石油', '', '', '37030000292');
INSERT INTO zsys_oil_station VALUES ('603', '香泉服务区西区', '香泉服务区西区', '安徽省马鞍山市和县S22天潜高速香泉服务区', '', '2', '15155913900', '0', '603', null, null, '2019-09-28 17:35:05', '1', '118.349288', '31.927865', '340000', '安徽省', '340500', '马鞍山市', '340523', '和县', '1', '中国石化', '', '', '34050000004');
INSERT INTO zsys_oil_station VALUES ('604', '花园服务区东区', '花园东区', '安徽省池州市东至县G35济广高速花园服务区', '', '2', '18956697345', '0', '604', null, null, '2019-09-28 17:35:05', '1', '117.039009', '29.974458', '340000', '安徽省', '341700', '池州市', '341721', '东至县', '1', '中国石化', 'G35', '济广高速', '34170000002');
INSERT INTO zsys_oil_station VALUES ('605', '中国石油天然气股份有限公司山东淄博销售分公司第66加油站', '淄博66站', '牛山路372号', '', '1', '15275999539', '0', '605', null, null, '2019-09-28 17:35:05', '1', '118.322490', '36.805510', '370000', '山东省', '370300', '淄博市', '370305', '临淄区', '0', '中石油', '', '', '37030000291');
INSERT INTO zsys_oil_station VALUES ('606', '花园服务区西区', '花园西区', '安徽省池州市东至县G35济广高速花园服务区', '', '2', '18956697345', '0', '606', null, null, '2019-09-28 17:35:05', '1', '117.036485', '29.973520', '340000', '安徽省', '341700', '池州市', '341721', '东至县', '1', '中国石化', 'G35', '济广高速', '34170000002');
INSERT INTO zsys_oil_station VALUES ('607', '太白服务区东区', '太白服务区东区', '安徽省马鞍山市当涂县G4211宁芜高速太白服务区', '', '2', '15805557208', '0', '607', null, null, '2019-09-28 17:35:05', '1', '118.532478', '31.495875', '340000', '安徽省', '340500', '马鞍山市', '340521', '当涂县', '1', '中国石化', 'G4211', '宁芜高速', '34050000001');
INSERT INTO zsys_oil_station VALUES ('608', '中国石油天然气股份有限公司山东淄博销售分公司第65加油站', '淄博65站', '东外环路南首路西', '', '1', '13011627353', '0', '608', null, null, '2019-09-28 17:35:06', '1', '118.314070', '36.790370', '370000', '山东省', '370300', '淄博市', '370305', '临淄区', '0', '中石油', '', '', '37030000290');
INSERT INTO zsys_oil_station VALUES ('609', '太白服务区西区', '太白服务区西区', '安徽省马鞍山市当涂县G4211宁芜高速太白服务区', '', '2', '15805557208', '0', '609', null, null, '2019-09-28 17:35:06', '1', '118.531122', '31.493289', '340000', '安徽省', '340500', '马鞍山市', '340521', '当涂县', '1', '中国石化', 'G4211', '宁芜高速', '34050000001');
INSERT INTO zsys_oil_station VALUES ('610', '马衙服务区南区', '马衙南区', '安徽省池州市贵池区G50沪渝高速马衙服务区', '', '2', '13955505835', '0', '610', null, null, '2019-09-28 17:35:06', '1', '117.597032', '30.654617', '340000', '安徽省', '341700', '池州市', '341702', '贵池区', '1', '中国石化', 'G50', '沪渝高速', '34170000004');
INSERT INTO zsys_oil_station VALUES ('611', '中国石油天然气股份有限公司山东淄博销售分公司第64加油站', '淄博64站', '孙娄东村西外环路北', '', '1', '13468422152', '0', '611', null, null, '2019-09-28 17:35:06', '1', '118.289530', '36.840420', '370000', '山东省', '370300', '淄博市', '370305', '临淄区', '0', '中石油', '', '', '37030000289');
INSERT INTO zsys_oil_station VALUES ('612', '中国石油天然气股份有限公司山东淄博销售分公司第63加油站', '淄博63站', '155号', '', '1', '15963307519', '0', '612', null, null, '2019-09-28 17:35:07', '1', '118.386890', '36.799940', '370000', '山东省', '370300', '淄博市', '370305', '临淄区', '0', '中石油', '', '', '37030000288');
INSERT INTO zsys_oil_station VALUES ('613', '马衙服务区北区', '马衙北区', '安徽省池州市贵池区G50沪渝高速马衙服务区', '', '2', '13955505835', '0', '613', null, null, '2019-09-28 17:35:07', '1', '117.594078', '30.654575', '340000', '安徽省', '341700', '池州市', '341702', '贵池区', '1', '中国石化', 'G50', '沪渝高速', '34170000004');
INSERT INTO zsys_oil_station VALUES ('614', '清溪服务区南区', '清溪服务区南区', '安徽省马鞍山市含山县S22天潜高速清溪服务区', '', '2', '13851117550', '0', '614', null, null, '2019-09-28 17:35:07', '1', '118.026356', '31.640693', '340000', '安徽省', '340500', '马鞍山市', '340522', '含山县', '1', '中国石化', '', '', '34050000003');
INSERT INTO zsys_oil_station VALUES ('615', '清溪服务区北区', '清溪服务区北区', '安徽省马鞍山市含山县S23天潜高速清溪服务区', '', '2', '13851117550', '0', '615', null, null, '2019-09-28 17:35:07', '1', '118.022121', '31.639547', '340000', '安徽省', '340500', '马鞍山市', '340522', '含山县', '1', '中国石化', '', '', '34050000003');
INSERT INTO zsys_oil_station VALUES ('616', '牛头山服务区南区', '牛头山南区', '安徽省池州市贵池区G50沪渝高速牛头山服务区', '', '2', '15905667852', '0', '616', null, null, '2019-09-28 17:35:08', '1', '117.283465', '30.500363', '340000', '安徽省', '341700', '池州市', '341702', '贵池区', '1', '中国石化', 'G50', '沪渝高速', '34170000005');
INSERT INTO zsys_oil_station VALUES ('617', '中国石油天然气股份有限公司山东淄博销售分公司第62加油站', '淄博62站', '沣水镇政府东300米（湖罗路东侧）', '', '1', '13884608946', '0', '617', null, null, '2019-09-28 17:35:08', '1', '118.289530', '36.840420', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '中石油', '', '', '37030000287');
INSERT INTO zsys_oil_station VALUES ('618', '中国石油天然气股份有限公司枣庄54站', '中石油枣庄54站', '山东省枣庄市山亭区世纪大道西侧', 'https://oss.etcsd.com/object/5cb54c90549ecdf1d78c0af0', '1', '06328866372', '0', '618', null, null, '2019-09-28 17:35:08', '1', '117.432257', '35.087752', '370000', '山东省', '370400', '枣庄市', '370406', '山亭区', '0', '中石油', '', '', '37040000528');
INSERT INTO zsys_oil_station VALUES ('619', '牛头山服务区北区', '牛头山北区', '安徽省池州市贵池区G50沪渝高速牛头山服务区', '', '2', '15905667852', '0', '619', null, null, '2019-09-28 17:35:08', '1', '117.281188', '30.501390', '340000', '安徽省', '341700', '池州市', '341702', '贵池区', '1', '中国石化', 'G50', '沪渝高速', '34170000005');
INSERT INTO zsys_oil_station VALUES ('620', '中国石油天然气股份有限公司烟台第24加油站', '中石油烟台24站', '烟台市牟平城区北关大街803号', '', '1', '13791295222', '0', '620', null, null, '2019-09-28 17:35:09', '1', '121.584393', '37.397793', '370000', '山东省', '370600', '烟台市', '370612', '牟平区', '0', '中石油', '', '', '37060000428');
INSERT INTO zsys_oil_station VALUES ('621', '福山服务区南区', '福山服务区南区', '安徽省马鞍山市含山县合巢芜高速福山服务区', '', '2', '13767163781', '0', '621', null, null, '2019-09-28 17:35:09', '1', '118.034417', '31.586033', '340000', '安徽省', '340500', '马鞍山市', '340522', '含山县', '1', '中国石化', '', '', '34050000002');
INSERT INTO zsys_oil_station VALUES ('622', '中国石油天然气股份有限公司枣庄4站', '中石油枣庄4站', '台儿庄区彭楼镇叶庄村，新旧枣台线交汇处', 'https://oss.etcsd.com/object/5cb54c91549ecdf1d78c0af2', '1', '06326883068', '0', '622', null, null, '2019-09-28 17:35:09', '1', '117.556350', '34.611290', '370000', '山东省', '370400', '枣庄市', '370405', '台儿庄区', '0', '中石油', '', '', '37040000487');
INSERT INTO zsys_oil_station VALUES ('623', '福山服务区北区', '福山服务区北区', '安徽省马鞍山市含山县合巢芜高速福山服务区', '', '2', '13767163781', '0', '623', null, null, '2019-09-28 17:35:09', '1', '118.032656', '31.588098', '340000', '安徽省', '340500', '马鞍山市', '340522', '含山县', '1', '中国石化', '', '', '34050000002');
INSERT INTO zsys_oil_station VALUES ('624', '中国石油天然气股份有限公司枣庄35站', '中石油枣庄35站', '台儿庄华阳路路西', 'https://oss.etcsd.com/object/5cb54c91a055fa236fb32812', '1', '06326668588', '0', '624', null, null, '2019-09-28 17:35:10', '1', '117.726836', '34.576062', '370000', '山东省', '370400', '枣庄市', '370405', '台儿庄区', '0', '中石油', '', '', '37040000496');
INSERT INTO zsys_oil_station VALUES ('626', '中国石油天然气股份有限公司枣庄104站', '中石油枣庄104站', '山东省枣庄市薛城区店韩路枣临高速入口处', 'https://oss.etcsd.com/object/5cb54c91a055fa236fb32814', '1', '15665287220', '0', '626', null, null, '2019-09-28 17:35:10', '1', '117.329353', '34.804052', '370000', '山东省', '370400', '枣庄市', '370403', '薛城区', '0', '中石油', '', '', '37040000511');
INSERT INTO zsys_oil_station VALUES ('627', '中国石油天然气股份有限公司山东淄博销售分公司第60加油站', '淄博60站', '五里桥南300米', '', '1', '13853310094', '0', '627', null, null, '2019-09-28 17:35:10', '1', '118.094670', '36.936120', '370000', '山东省', '370300', '淄博市', '370321', '桓台县', '0', '中石油', '', '', '37030000285');
INSERT INTO zsys_oil_station VALUES ('628', '牯牛降服务区南区', '牯牛降南区', '安徽省黄山市祁门县黄祁高速牯牛降服务区', '', '2', '18756630204', '0', '628', null, null, '2019-09-28 17:35:11', '1', '117.551082', '29.841994', '340000', '安徽省', '341000', '黄山市', '341024', '祁门县', '1', '中国石化', 'S42', '黄祁高速S42', '34100000002');
INSERT INTO zsys_oil_station VALUES ('629', '中国石油天然气股份有限公司山东淄博销售分公司第59加油站', '淄博59站', '与乙烯路交叉口北侧', '', '1', '田永金', '0', '629', null, null, '2019-09-28 17:35:11', '1', '118.160790', '36.810710', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '中石油', '', '', '37030000284');
INSERT INTO zsys_oil_station VALUES ('630', '牯牛降服务区北区', '牯牛降北区', '安徽省黄山市祁门县黄祁高速牯牛降服务区', '', '2', '18756630204', '0', '630', null, null, '2019-09-28 17:35:11', '1', '117.549713', '29.842548', '340000', '安徽省', '341000', '黄山市', '341024', '祁门县', '1', '中国石化', 'S42', '黄祁高速S42', '34100000002');
INSERT INTO zsys_oil_station VALUES ('631', '中国石油天然气股份有限公司东营第5加油站', '中石油东营第5加油站', '东营市济南路与海通路交叉口300米路东', '', '1', '13562293757', '0', '631', null, null, '2019-09-28 17:35:11', '1', '118.535892', '37.471054', '370000', '山东省', '370500', '东营市', '370502', '东营区', '0', '中石油', '', '', '37050000078');
INSERT INTO zsys_oil_station VALUES ('632', '休宁服务区东区', '休宁东区', '安徽省黄山市休宁县G3京台高速休宁服务区', '', '2', '18755916990', '0', '632', null, null, '2019-09-28 17:35:11', '1', '118.240902', '29.646471', '340000', '安徽省', '341000', '黄山市', '341022', '休宁县', '1', '中国石化', 'G3', '京台高速', '34100000001');
INSERT INTO zsys_oil_station VALUES ('633', '中国石油天然气股份有限公司烟台第27加油站', '中石油烟台27站', '烟台市福山区北京中路烟台海洋环境监测中心站西南', '', '1', '18663887711', '0', '633', null, null, '2019-09-28 17:35:12', '1', '121.185818', '37.577564', '370000', '山东省', '370600', '烟台市', '370611', '福山区', '0', '中石油', '', '', '37060000386');
INSERT INTO zsys_oil_station VALUES ('634', '中国石油天然气股份有限公司山东淄博销售分公司第58加油站', '淄博58站', '湖田镇商家村南', '', '1', '13561670247', '0', '634', null, null, '2019-09-28 17:35:12', '1', '118.105810', '36.792690', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '中石油', '', '', '37030000283');
INSERT INTO zsys_oil_station VALUES ('635', '休宁服务区西区', '休宁西区', '安徽省黄山市休宁县G3京台高速休宁服务区', '', '2', '18755916990', '0', '635', null, null, '2019-09-28 17:35:12', '1', '118.238198', '29.645356', '340000', '安徽省', '341000', '黄山市', '341022', '休宁县', '1', '中国石化', 'G3', '京台高速', '34100000001');
INSERT INTO zsys_oil_station VALUES ('636', '中国石油天然气股份有限公司山东淄博销售分公司第57加油站', '淄博57站', '34号（自来水厂对过）', '', '1', '13583361631', '0', '636', null, null, '2019-09-28 17:35:12', '1', '118.160790', '36.810710', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '中石油', '', '', '37030000282');
INSERT INTO zsys_oil_station VALUES ('637', '太平湖服务区南区', '太平湖南区', '安徽省黄山市黄山区G3京台高速太平湖服务区', '', '2', '15856672961', '0', '637', null, null, '2019-09-28 17:35:12', '1', '117.988737', '30.326515', '340000', '安徽省', '341000', '黄山市', '341003', '黄山区', '1', '中国石化', 'G3', '京台高速', '34100000003');
INSERT INTO zsys_oil_station VALUES ('638', '中国石油天然气股份有限公司山东淄博销售分公司第55加油站', '淄博55站', '博临路与齐盛路交叉口西2公里路南', '', '1', '13964498134', '0', '638', null, null, '2019-09-28 17:35:13', '1', '118.105810', '36.792690', '370000', '山东省', '370300', '淄博市', '370305', '临淄区', '0', '中石油', '', '', '37030000281');
INSERT INTO zsys_oil_station VALUES ('639', '太平湖服务区北区', '太平湖北区', '安徽省黄山市黄山区G3京台高速太平湖服务区', '', '2', '15856672961', '0', '639', null, null, '2019-09-28 17:35:13', '1', '117.988216', '30.327584', '340000', '安徽省', '341000', '黄山市', '341003', '黄山区', '1', '中国石化', 'G3', '京台高速', '34100000003');
INSERT INTO zsys_oil_station VALUES ('640', '中国石油天然气股份有限公司山东淄博销售分公司第54加油站', '淄博54站', '朱台镇枣园村东', '', '1', '15069395261', '0', '640', null, null, '2019-09-28 17:35:13', '1', '118.257430', '36.934620', '370000', '山东省', '370300', '淄博市', '370305', '临淄区', '0', '中石油', '', '', '37030000280');
INSERT INTO zsys_oil_station VALUES ('641', '中国石油天然气股份有限公司烟台第30加油站', '中石油烟台30站', '烟台市牟平区孔家疃村，金埠大街与通海路交叉口东', '', '1', '15552215855', '0', '641', null, null, '2019-09-28 17:35:13', '1', '121.605506', '37.418238', '370000', '山东省', '370600', '烟台市', '370612', '牟平区', '0', '中石油', '', '', '37060000430');
INSERT INTO zsys_oil_station VALUES ('642', '呈坎服务区东区', '呈坎东区', '安徽省黄山市徽州区G3京台高速呈坎服务区', '', '2', '13865595279', '0', '642', null, null, '2019-09-28 17:35:14', '1', '118.293036', '29.941901', '340000', '安徽省', '341000', '黄山市', '341004', '徽州区', '1', '中国石化', 'G3', '京台高速', '34100000004');
INSERT INTO zsys_oil_station VALUES ('643', '呈坎服务区西区', '呈坎西区', '安徽省黄山市徽州区G3京台高速呈坎服务区', '', '2', '13865595279', '0', '643', null, null, '2019-09-28 17:35:14', '1', '118.292515', '29.939768', '340000', '安徽省', '341000', '黄山市', '341004', '徽州区', '1', '中国石化', 'G3', '京台高速', '34100000004');
INSERT INTO zsys_oil_station VALUES ('644', '中国石油天然气股份有限公司东营第6加油站', '中石油东营第6加油站', '东营市东营区黄河路521号', '', '1', '0546-6098362', '0', '644', null, null, '2019-09-28 17:35:14', '1', '118.540216', '37.454644', '370000', '山东省', '370500', '东营市', '370502', '东营区', '0', '中石油', '', '', '37050000081');
INSERT INTO zsys_oil_station VALUES ('645', '文集服务区南区', '文集服务区南区', '安徽省合肥市肥东县G40沪陕高速文集服务区', '', '2', '13865927335', '0', '645', null, null, '2019-09-28 17:35:14', '1', '117.724186', '31.964350', '340000', '安徽省', '340100', '合肥市', '340122', '肥东县', '1', '中国石化', 'G40', '沪陕高速', '34010000004');
INSERT INTO zsys_oil_station VALUES ('646', '璜茅服务区东区', '璜茅东区', '安徽省黄山市休宁县G56杭瑞高速璜茅服务区', '', '2', '13705596207', '0', '646', null, null, '2019-09-28 17:35:15', '1', '118.292515', '29.939768', '340000', '安徽省', '341000', '黄山市', '341022', '休宁县', '1', '中国石化', 'G56', '杭瑞高速', '34100000005');
INSERT INTO zsys_oil_station VALUES ('647', '中国石油天然气股份有限公司烟台莱州第2加油站', '中石油烟台莱州2站', '莱州市S264与S304交叉口东南100米', '', '1', '13854526333', '0', '647', null, null, '2019-09-28 17:35:15', '1', '120.129455', '37.404491', '370000', '山东省', '370600', '烟台市', '370683', '莱州市', '0', '中石油', '', '', '37060000479');
INSERT INTO zsys_oil_station VALUES ('648', '璜茅服务区西区', '璜茅西区', '安徽省黄山市休宁县G56杭瑞高速璜茅服务区', '', '2', '13705596207', '0', '648', null, null, '2019-09-28 17:35:15', '1', '118.177282', '29.502930', '340000', '安徽省', '341000', '黄山市', '341022', '休宁县', '1', '中国石化', 'G56', '杭瑞高速', '34100000005');
INSERT INTO zsys_oil_station VALUES ('649', '中国石油天然气股份有限公司东营3站', '中石油东营3站', '利津县利一路利华益小区北门对面', '', '1', '18660651166', '0', '649', null, null, '2019-09-28 17:35:15', '1', '118.240462', '37.492089', '370000', '山东省', '370500', '东营市', '370522', '利津县', '0', '中石油', '', '', '37050000103');
INSERT INTO zsys_oil_station VALUES ('650', '文集服务区北区', '文集服务区北区', '安徽省合肥市肥东县G40沪陕高速文集服务区', '', '2', '13865927335', '0', '650', null, null, '2019-09-28 17:35:16', '1', '117.722308', '31.965541', '340000', '安徽省', '340100', '合肥市', '340122', '肥东县', '1', '中国石化', 'G40', '沪陕高速', '34010000004');
INSERT INTO zsys_oil_station VALUES ('651', '齐云山服务区南区', '齐云山南区', '安徽省黄山市休宁县黄祁高速齐云山服务区', '', '2', '18755986197', '0', '651', null, null, '2019-09-28 17:35:16', '1', '118.139264', '29.756909', '340000', '安徽省', '341000', '黄山市', '341022', '休宁县', '1', '中国石化', 'S42', '黄祁高速', '34100000007');
INSERT INTO zsys_oil_station VALUES ('652', '釜山服务区东区', '釜山服务区东区', '安徽省滁州市天长市G25长深高速釜山服务区', '', '2', '13637029343', '0', '652', null, null, '2019-09-28 17:35:16', '1', '118.730430', '32.641033', '340000', '安徽省', '341100', '滁州市', '341181', '天长市', '1', '中国石化', 'G25', '长深高速', '34110000007');
INSERT INTO zsys_oil_station VALUES ('653', '中国石油天然气股份有限公司山东淄博销售分公司第51加油站', '淄博51站', '康家坞村南', '', '1', '18560297849', '0', '653', null, null, '2019-09-28 17:35:16', '1', '117.901550', '36.608110', '370000', '山东省', '370300', '淄博市', '370302', '淄川区', '0', '中石油', '', '', '37030000279');
INSERT INTO zsys_oil_station VALUES ('654', '齐云山服务区北区', '齐云山北区', '安徽省黄山市休宁县黄祁高速齐云山服务区', '', '2', '18755986197', '0', '654', null, null, '2019-09-28 17:35:16', '1', '118.142600', '29.757151', '340000', '安徽省', '341000', '黄山市', '341022', '休宁县', '1', '中国石化', 'S42', '黄祁高速', '34100000007');
INSERT INTO zsys_oil_station VALUES ('655', '中国石油天然气股份有限公司山东淄博销售分公司第50加油站', '淄博50站', '东首路北', '', '1', '18853375368', '0', '655', null, null, '2019-09-28 17:35:17', '1', '118.359840', '36.835390', '370000', '山东省', '370300', '淄博市', '370305', '临淄区', '0', '中石油', '', '', '37030000278');
INSERT INTO zsys_oil_station VALUES ('656', '釜山服务区西区', '釜山服务区西区', '安徽省滁州市天长市G25长深高速釜山服务区', '', '2', '13637029343', '0', '656', null, null, '2019-09-28 17:35:17', '1', '118.727989', '32.640577', '340000', '安徽省', '341100', '滁州市', '341181', '天长市', '1', '中国石化', 'G25', '长深高速', '34110000007');
INSERT INTO zsys_oil_station VALUES ('657', '中国石油天然气股份有限公司山东淄博销售分公司第49加油站', '淄博49站', '朱台镇枣园村南', '', '1', '18853322496', '0', '657', null, null, '2019-09-28 17:35:17', '1', '118.260470', '36.922890', '370000', '山东省', '370300', '淄博市', '370305', '临淄区', '0', '中石油', '', '', '3703000277');
INSERT INTO zsys_oil_station VALUES ('658', '中国石油天然气股份有限公司枣庄57站', '中石油枣庄57站', '山东省枣庄市滕州市鲍沟镇104国道676公里处西侧', 'https://oss.etcsd.com/object/5cb54c91549ecdf1d78c0af4', '1', '2690003', '0', '658', null, null, '2019-09-28 17:35:17', '1', '117.164046', '34.980623', '370000', '山东省', '370400', '枣庄市', '370481', '滕州市', '0', '中石油', '', '', '37040000525');
INSERT INTO zsys_oil_station VALUES ('659', '大墅服务区南区', '大墅服务区南区', '安徽省滁州市全椒县G40沪陕高速大墅服务区', '', '2', '13955001125', '0', '659', null, null, '2019-09-28 17:35:18', '1', '117.952140', '32.014120', '340000', '安徽省', '341100', '滁州市', '341124', '全椒县', '1', '中国石化', 'G40', '沪陕高速', '34110000006');
INSERT INTO zsys_oil_station VALUES ('660', '中国石油天然气股份有限公司山东淄博销售分公司第47加油站', '淄博47站', '罗村镇牟家村66号', '', '1', '15564446489', '0', '660', null, null, '2019-09-28 17:35:18', '1', '118.065040', '36.674840', '370000', '山东省', '370300', '淄博市', '370302', '淄川区', '0', '中石油', '', '', '37030000275');
INSERT INTO zsys_oil_station VALUES ('661', '中国石油天然气股份有限公司烟台第31加油站', '中石油烟台31站', '烟台市开发区衡山路与嘉陵江路交汇处', '', '1', '15684034357', '0', '661', null, null, '2019-09-28 17:35:18', '1', '121.262745', '37.548140', '370000', '山东省', '370600', '烟台市', '370601', '市辖区', '0', '中石油', '', '', '37060000431');
INSERT INTO zsys_oil_station VALUES ('662', '中国石油天然气股份有限公司枣庄52站', '中石油枣庄52站', '山东省枣庄市滕州市荆河街道东倪村104国道北段路西', 'https://oss.etcsd.com/object/5cb54c91549ecdf1d78c0af6', '1', '5031150', '0', '662', null, null, '2019-09-28 17:35:18', '1', '117.122878', '35.127572', '370000', '山东省', '370400', '枣庄市', '370481', '滕州市', '0', '中石油', '', '', '37040000504');
INSERT INTO zsys_oil_station VALUES ('663', '大墅服务区北区', '大墅服务区北区', '安徽省滁州市全椒县G40沪陕高速大墅服务区', '', '2', '13955001125', '0', '663', null, null, '2019-09-28 17:35:19', '1', '117.952953', '32.015785', '340000', '安徽省', '341100', '滁州市', '341124', '全椒县', '1', '中国石化', 'G40', '沪陕高速', '34110000006');
INSERT INTO zsys_oil_station VALUES ('664', '官塘服务区东区', '官塘东区', '安徽省滁州市凤阳县蚌淮高速官塘服务区', '', '2', '13955063466', '0', '664', null, null, '2019-09-28 17:35:19', '1', '117.265428', '32.704228', '340000', '安徽省', '341100', '滁州市', '341126', '凤阳县', '1', '中国石化', '', '', '34110000001');
INSERT INTO zsys_oil_station VALUES ('666', '官塘服务区西区', '官塘西区', '安徽省滁州市凤阳县蚌淮高速官塘服务区', '', '2', '13955063466', '0', '666', null, null, '2019-09-28 17:35:19', '1', '117.262287', '32.704197', '340000', '安徽省', '341100', '滁州市', '341126', '凤阳县', '1', '中国石化', '', '', '34110000001');
INSERT INTO zsys_oil_station VALUES ('667', '中国石油天然气股份有限公司枣庄51站', '中石油枣庄51站', '山东省枣庄市滕州市平行路与南外交汇处东北角', 'https://oss.etcsd.com/object/5cb54c91a055fa236fb32816', '1', '5699037', '0', '667', null, null, '2019-09-28 17:35:19', '1', '117.148099', '35.077320', '370000', '山东省', '370400', '枣庄市', '370481', '滕州市', '0', '中石油', '', '', '37040000503');
INSERT INTO zsys_oil_station VALUES ('668', '中国石油天然气股份有限公司山东淄博销售分公司第41加油站', '淄博41站', '黄家村南', '', '1', '13561677972', '0', '668', null, null, '2019-09-28 17:35:20', '1', '118.018220', '36.736590', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '中石油', '', '', '37030000270');
INSERT INTO zsys_oil_station VALUES ('669', '中国石油天然气股份有限公司山东淄博销售分公司第44加油站', '淄博44站', '2号', '', '1', '15853355521', '0', '669', null, null, '2019-09-28 17:35:20', '1', '117.905840', '36.577530', '370000', '山东省', '370300', '淄博市', '370302', '淄川区', '0', '中石油', '', '', '37030000272');
INSERT INTO zsys_oil_station VALUES ('670', '中国石油天然气股份有限公司烟台第32加油站', '中石油烟台32站', '烟台市开发区五指山路北首大转盘以南', '', '1', '13863850483', '0', '670', null, null, '2019-09-28 17:35:20', '1', '121.283911', '37.555655', '370000', '山东省', '370600', '烟台市', '370601', '市辖区', '0', '中石油', '', '', '37060000432');
INSERT INTO zsys_oil_station VALUES ('671', '吴圩服务区东区', '吴圩东区', '安徽省滁州市定远县G3京台高速吴圩服务区', '', '2', '13955263708', '0', '671', null, null, '2019-09-28 17:35:20', '1', '117.455559', '32.378789', '340000', '安徽省', '341100', '滁州市', '341125', '定远县', '1', '中国石化', 'G3', '京台高速', '34110000002');
INSERT INTO zsys_oil_station VALUES ('672', '中国石油天然气股份有限公司山东淄博销售分公司第42加油站', '淄博42站', '边河乡北刘村', '', '1', '15275989089', '0', '672', null, null, '2019-09-28 17:35:20', '1', '118.018220', '36.736590', '370000', '山东省', '370300', '淄博市', '370305', '临淄区', '0', '中石油', '', '', '37030000271');
INSERT INTO zsys_oil_station VALUES ('673', '吴圩服务区西区', '吴圩西区', '安徽省滁州市定远县G3京台高速吴圩服务区', '', '2', '13955263708', '0', '673', null, null, '2019-09-28 17:35:21', '1', '117.543148', '32.377533', '340000', '安徽省', '341100', '滁州市', '341125', '定远县', '1', '中国石化', 'G3', '京台高速', '34110000002');
INSERT INTO zsys_oil_station VALUES ('674', '吴庄服务区南区', '吴庄服务区南区', '安徽省滁州市全椒县合宁高速吴庄服务区', '', '2', '13909605811', '0', '674', null, null, '2019-09-28 17:35:21', '1', '118.318721', '32.133247', '340000', '安徽省', '341100', '滁州市', '341124', '全椒县', '1', '中国石化', '', '', '34110000003');
INSERT INTO zsys_oil_station VALUES ('675', '中国石油天然气股份有限公司山东淄博销售分公司第40加油站', '淄博40站', '西首北50米', '', '1', '18605334648', '0', '675', null, null, '2019-09-28 17:35:21', '1', '118.065040', '36.674840', '370000', '山东省', '370300', '淄博市', '370304', '博山区', '0', '中石油', '', '', '37030000269');
INSERT INTO zsys_oil_station VALUES ('676', '中国石油天然气股份有限公司烟台第36加油站', '中石油烟台36站', '烟台市牟平区武五路578号附近', '', '1', '13012594169', '0', '676', null, null, '2019-09-28 17:35:22', '1', '121.562310', '37.376270', '370000', '山东省', '370600', '烟台市', '370612', '牟平区', '0', '中石油', '', '', '37060000433');
INSERT INTO zsys_oil_station VALUES ('677', '肥东服务区南区', '肥东南区', '安徽省合肥市肥东县合宁高速肥东服务区', '', '2', '13655515762', '0', '677', null, null, '2019-09-28 17:35:22', '1', '117.462443', '31.861493', '340000', '安徽省', '340100', '合肥市', '340122', '肥东县', '1', '中国石化', '', '', '34010000006');
INSERT INTO zsys_oil_station VALUES ('678', '中国石油天然气股份有限公司山东淄博销售分公司第39加油站', '淄博39站', '309国道王村镇北河东村', '', '1', '18553351293', '0', '678', null, null, '2019-09-28 17:35:22', '1', '117.809400', '36.730360', '370000', '山东省', '370300', '淄博市', '370306', '周村区', '0', '中石油', '', '', '37030000268');
INSERT INTO zsys_oil_station VALUES ('679', '吴庄服务区北区', '吴庄服务区北区', '安徽省滁州市全椒县合宁高速吴庄服务区', '', '2', '13909605811', '0', '679', null, null, '2019-09-28 17:35:22', '1', '118.316139', '32.133155', '340000', '安徽省', '341100', '滁州市', '341124', '全椒县', '1', '中国石化', '', '', '34110000003');
INSERT INTO zsys_oil_station VALUES ('680', '肥东服务区北区', '肥东北区', '安徽省合肥市肥东县合宁高速肥东服务区', '', '2', '13655515762', '0', '680', null, null, '2019-09-28 17:35:23', '1', '117.462196', '31.862823', '340000', '安徽省', '340100', '合肥市', '340122', '肥东县', '1', '中国石化', '', '', '34010000006');
INSERT INTO zsys_oil_station VALUES ('681', '中国石油天然气股份有限公司烟台第37加油站', '中石油烟台37站', '烟台市高新区成龙路加油站(清泉实业对面)', '', '1', '13793550969', '0', '681', null, null, '2019-09-28 17:35:23', '1', '121.487800', '37.417680', '370000', '山东省', '370600', '烟台市', '370601', '市辖区', '0', '中石油', '', '', '37060000434');
INSERT INTO zsys_oil_station VALUES ('682', '汝西营进出口', '汝西营进出口', '安徽省亳州市利辛县G36宁洛高速出口202省道', '', '2', '13856853083', '0', '682', null, null, '2019-09-28 17:35:23', '1', '116.339984', '33.189180', '340000', '安徽省', '341600', '亳州市', '341623', '利辛县', '0', '中国石化', '', '', '34160000005');
INSERT INTO zsys_oil_station VALUES ('683', '中国石油天然气股份有限公司烟台第99加油站', '中石油烟台99站', '烟台市莱山区观海路100号', '', '1', '15098597026', '0', '683', null, null, '2019-09-28 17:35:23', '1', '121.448232', '37.504016', '370000', '山东省', '370600', '烟台市', '370613', '莱山区', '0', '中石油', '', '', '37060000384');
INSERT INTO zsys_oil_station VALUES ('684', '宁洛高速葛桥进出口', '宁洛高速葛桥进出口', '安徽省亳州市蒙城县203省道与宁洛高速交叉出口', '', '2', '13805617040', '0', '684', null, null, '2019-09-28 17:35:24', '1', '116.560851', '33.186622', '340000', '安徽省', '341600', '亳州市', '341622', '蒙城县', '0', '中国石化', '', '', '34160000004');
INSERT INTO zsys_oil_station VALUES ('685', '中国石油天然气股份有限公司山东淄博销售分公司第38加油站', '淄博38站', '47号', '', '1', '18866635306', '0', '685', null, null, '2019-09-28 17:35:24', '1', '118.002899', '36.625567', '370000', '山东省', '370300', '淄博市', '370302', '淄川区', '0', '中石油', '', '', '37030000267');
INSERT INTO zsys_oil_station VALUES ('686', '中国石油天然气股份有限公司东营10站', '中石油东营10站', '山东省东营市南二路201号南侧', '', '1', '0546-6098366', '0', '686', null, null, '2019-09-28 17:35:24', '1', '118.586304', '37.415743', '370000', '山东省', '370500', '东营市', '370502', '东营区', '0', '中石油', '', '', '37050000104');
INSERT INTO zsys_oil_station VALUES ('687', '宁洛高速贡集出入口', '宁洛高速贡集出入口', '安徽省蚌埠市怀远县G36宁洛高速046县道出口和307省道交叉口附近', '', '2', '13865056161', '0', '687', null, null, '2019-09-28 17:35:24', '1', '116.923240', '33.072755', '340000', '安徽省', '340300', '蚌埠市', '340321', '怀远县', '0', '中国石化', '', '', '34030000002');
INSERT INTO zsys_oil_station VALUES ('688', '中国石油天然气股份有限公司山东淄博销售分公司第37加油站', '淄博37站', '216号', '', '1', '13969397317', '0', '688', null, null, '2019-09-28 17:35:24', '1', '118.125480', '36.820600', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '中石油', '', '', '37030000266');
INSERT INTO zsys_oil_station VALUES ('689', '中国石油天然气股份有限公司东营17站', '中石油东营17站', '东营市河口区河滨路国家电网西150米', '', '1', '13181966586', '0', '689', null, null, '2019-09-28 17:35:24', '1', '118.521046', '37.901234', '370000', '山东省', '370500', '东营市', '370503', '河口区', '0', '中石油', '', '', '37050000105');
INSERT INTO zsys_oil_station VALUES ('690', '中国石油天然气股份有限公司烟台莱州第1加油站', '中石油烟台莱州1站', '莱州南路方圆厨房设备公司以南200米', '', '1', '15153581010', '0', '690', null, null, '2019-09-28 17:35:25', '1', '119.946144', '37.164605', '370000', '山东省', '370600', '烟台市', '370683', '莱州市', '0', '中石油', '', '', '37060000478');
INSERT INTO zsys_oil_station VALUES ('691', '中国石油天然气股份有限公司山东淄博销售分公司第36加油站', '淄博36站', '唐坊镇高速路口东，淮高路北', '', '1', '13046095592', '0', '691', null, null, '2019-09-28 17:35:25', '1', '117.976710', '37.185080', '370000', '山东省', '370300', '淄博市', '370322', '高青县', '0', '中石油', '', '', '37030000265');
INSERT INTO zsys_oil_station VALUES ('692', '中国石油天然气股份有限公司东营21站', '中石油东营21站', '东营市东营港港城路以南东港路以西', '', '1', '0546-6098368', '0', '692', null, null, '2019-09-28 17:35:25', '1', '118.903461', '38.058591', '370000', '山东省', '370500', '东营市', '370502', '东营区', '0', '中石油', '', '', '37050000085');
INSERT INTO zsys_oil_station VALUES ('693', '中国石油天然气股份有限公司山东淄博销售分公司第35加油站', '淄博35站', '309国道栗家村', '', '1', '15615739352', '0', '693', null, null, '2019-09-28 17:35:26', '1', '117.751840', '36.686820', '370000', '山东省', '370300', '淄博市', '370306', '周村区', '0', '中石油', '', '', '37030000264');
INSERT INTO zsys_oil_station VALUES ('695', '中国石油天然气股份有限公司山东淄博销售分公司第34加油站', '淄博34站', '夏家庄镇铁路口南', '', '1', '15305331331', '0', '695', null, null, '2019-09-28 17:35:26', '1', '117.876630', '36.511010', '370000', '山东省', '370300', '淄博市', '370304', '博山区', '0', '中石油', '', '', '37030000263');
INSERT INTO zsys_oil_station VALUES ('696', '中国石油天然气股份有限公司烟台莱州第3加油站', '中石油烟台莱州3站', '莱州市朱桥镇镡家村206国道路段西', '', '1', '13791220726', '0', '696', null, null, '2019-09-28 17:35:26', '1', '120.080084', '37.347530', '370000', '山东省', '370600', '烟台市', '370683', '莱州市', '0', '中石油', '', '', '37060000388');
INSERT INTO zsys_oil_station VALUES ('697', '中国石油天然气股份有限公司山东淄博销售分公司第33加油站', '淄博33站', '北外环路东首', '', '1', '13964434773', '0', '697', null, null, '2019-09-28 17:35:26', '1', '117.843620', '37.189190', '370000', '山东省', '370300', '淄博市', '370322', '高青县', '0', '中石油', '', '', '37030000262');
INSERT INTO zsys_oil_station VALUES ('698', '中国石油天然气股份有限公司烟台莱州第4加油站', '中石油烟台莱州4站', '莱州市城港路街道二十里堡村驻地', '', '1', '15949895930', '0', '698', null, null, '2019-09-28 17:35:27', '1', '119.997464', '37.240209', '370000', '山东省', '370600', '烟台市', '370683', '莱州市', '0', '中石油', '', '', '37060000480');
INSERT INTO zsys_oil_station VALUES ('699', '中国石油天然气股份有限公司东营27站', '中石油东营27站', '山东省东营市东二路325号', '', '1', '0546-6098370', '0', '699', null, null, '2019-09-28 17:35:27', '1', '118.701700', '37.259289', '370000', '山东省', '370500', '东营市', '370502', '东营区', '0', '中石油', '', '', '37050000087');
INSERT INTO zsys_oil_station VALUES ('700', '中国石油天然气股份有限公司山东淄博销售分公司第32加油站', '淄博32站', '杨寨村东首', '', '1', '18265880699', '0', '700', null, null, '2019-09-28 17:35:27', '1', '118.004370', '36.716040', '370000', '山东省', '370300', '淄博市', '370302', '淄川区', '0', '中石油', '', '', '37030000261');
INSERT INTO zsys_oil_station VALUES ('701', '中国石油天然气股份有限公司东营28站', '中石油东营28站', '山东省东营市广饶县辛海路393号', '', '1', '0546-6098371', '0', '701', null, null, '2019-09-28 17:35:27', '1', '118.701700', '37.259289', '370000', '山东省', '370500', '东营市', '370523', '广饶县', '0', '中石油', '', '', '37050000088');
INSERT INTO zsys_oil_station VALUES ('702', '中国石油天然气股份有限公司烟台莱州第5加油站', '中石油烟台莱州5站', '莱州市西苑路1023号(明珠园建发小区西南)', '', '1', '13854513177', '0', '702', null, null, '2019-09-28 17:35:28', '1', '119.939861', '37.190399', '370000', '山东省', '370600', '烟台市', '370683', '莱州市', '0', '中石油', '', '', '37060000481');
INSERT INTO zsys_oil_station VALUES ('703', '中国石油天然气股份有限公司山东淄博销售分公司第30加油站', '淄博30站', '东马村北', '', '1', '15069354470', '0', '703', null, null, '2019-09-28 17:35:28', '1', '117.868530', '36.818640', '370000', '山东省', '370300', '淄博市', '370306', '周村区', '0', '中石油', '', '', '37030000259');
INSERT INTO zsys_oil_station VALUES ('704', '中国石油天然气股份有限公司东营31站', '中石油东营31站', '山东省东营市东营区史口镇郝纯路西侧', '', '1', '0546-6098375', '0', '704', null, null, '2019-09-28 17:35:28', '1', '118.701700', '37.259289', '370000', '山东省', '370500', '东营市', '370502', '东营区', '0', '中石油', '', '', '37050000091');
INSERT INTO zsys_oil_station VALUES ('705', '中国石油天然气股份有限公司山东淄博销售分公司第29加油站', '淄博29站', '白塔村北铁道口西200米', '', '1', '13001501512', '0', '705', null, null, '2019-09-28 17:35:28', '1', '117.876940', '36.558000', '370000', '山东省', '370300', '淄博市', '370304', '博山区', '0', '中石油', '', '', '37030000258');
INSERT INTO zsys_oil_station VALUES ('706', '中国石油天然气股份有限公司东营33站', '中石油东营33站', '山东省东营市东营港经济开发区海港路以南港西二路以东', '', '1', '0546-6098376', '0', '706', null, null, '2019-09-28 17:35:29', '1', '118.891217', '38.080405', '370000', '山东省', '370500', '东营市', '370502', '东营区', '0', '中石油', '', '', '37050000092');
INSERT INTO zsys_oil_station VALUES ('708', '中国石油天然气股份有限公司山东淄博销售分公司第28加油站', '淄博28站', '良乡物流园东500米', '', '1', '13864385276', '0', '708', null, null, '2019-09-28 17:35:29', '1', '118.078720', '36.773340', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '中石油', '', '', '37030000257');
INSERT INTO zsys_oil_station VALUES ('709', '中国石油天然气股份有限公司烟台莱州第6加油站', '中石油烟台莱州6站', '莱州市206国道(神堂卫生院贾家社区卫生服务站南)', '', '1', '13455522828', '0', '709', null, null, '2019-09-28 17:35:29', '1', '119.899494', '37.146318', '370000', '山东省', '370600', '烟台市', '370683', '莱州市', '0', '中石油', '', '', '37060000482');
INSERT INTO zsys_oil_station VALUES ('710', '中国石油天然气股份有限公司山东淄博销售分公司第26加油站', '淄博26站', '21号', '', '1', '15864477858', '0', '710', null, null, '2019-09-28 17:35:29', '1', '118.354360', '36.936650', '370000', '山东省', '370300', '淄博市', '370305', '临淄区', '0', '中石油', '', '', '37030000256');
INSERT INTO zsys_oil_station VALUES ('711', '中国石油天然气股份有限公司山东淄博销售分公司第1加油站', '淄博1站', '291号', '', '1', '13409076345', '0', '711', null, null, '2019-09-28 17:35:30', '1', '118.081080', '36.771670', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '中石油', '', '', '37030000234');
INSERT INTO zsys_oil_station VALUES ('712', '中国石油天然气股份有限公司烟台莱州第7加油站', '中石油烟台莱州7站', '莱州市三山岛街道凤凰岭村驻地', '', '1', '13954517100', '0', '712', null, null, '2019-09-28 17:35:30', '1', '119.953090', '37.386910', '370000', '山东省', '370600', '烟台市', '370683', '莱州市', '0', '中石油', '', '', '37060000483');
INSERT INTO zsys_oil_station VALUES ('713', '中国石油天然气股份有限公司山东淄博销售分公司第2加油站', '淄博2站', '203号', '', '1', '15689039952', '0', '713', null, null, '2019-09-28 17:35:30', '1', '118.063770', '36.816090', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '中石油', '', '', '37030000235');
INSERT INTO zsys_oil_station VALUES ('714', '中国石油天然气股份有限公司东营34站', '中石油东营34站', '山东省东营市广饶县花官镇花官村辛河路东侧', '', '1', '0546-6098377', '0', '714', null, null, '2019-09-28 17:35:30', '1', '118.442061', '37.206637', '370000', '山东省', '370500', '东营市', '370523', '广饶县', '0', '中石油', '', '', '37050000093');
INSERT INTO zsys_oil_station VALUES ('715', '中国石油天然气股份有限公司烟台莱州第8加油站', '中石油烟台莱州8站', '莱州市永安办事处果达埠村206国道187K路东中国石油加油站', '', '1', '15866372827', '0', '715', null, null, '2019-09-28 17:35:31', '1', '119.913590', '37.165848', '370000', '山东省', '370600', '烟台市', '370683', '莱州市', '0', '中石油', '', '', '37060000484');
INSERT INTO zsys_oil_station VALUES ('717', '中国石油天然气股份有限公司东营35站', '中石油东营35站', '山东省东营市东营区云门山路与北二路交叉路口往西100米', '', '1', '0546-6098378', '0', '717', null, null, '2019-09-28 17:35:31', '1', '118.485629', '37.481071', '370000', '山东省', '370500', '东营市', '370502', '东营区', '0', '中石油', '', '', '37050000094');
INSERT INTO zsys_oil_station VALUES ('718', '中国石油天然气股份有限公司东营36站', '中石油东营36站', ' 山东省东营市广饶县潍高路与乐安路交汇处西', '', '1', '0546-6098379', '0', '718', null, null, '2019-09-28 17:35:31', '1', '118.401810', '37.046835', '370000', '山东省', '370500', '东营市', '370523', '广饶县', '0', '中石油', '', '', '37050000106');
INSERT INTO zsys_oil_station VALUES ('720', '中国石油天然气股份有限公司东营39站', '中石油东营39站', '山东省东营市东营区北一路以北、兰州路以西', '', '1', '0546-6098380', '0', '720', null, null, '2019-09-28 17:35:31', '1', '118.645011', '37.465751', '370000', '山东省', '370500', '东营市', '370502', '东营区', '0', '中石油', '', '', '37050000107');
INSERT INTO zsys_oil_station VALUES ('721', '中国石油天然气股份有限公司烟台莱州第9加油站', '中石油烟台莱州9站', '莱州市沙河镇长胜村北中石油加油站（206国道路东）', '', '1', '13954543988', '0', '721', null, null, '2019-09-28 17:35:31', '1', '119.775520', '37.051196', '370000', '山东省', '370600', '烟台市', '370683', '莱州市', '0', '中石油', '', '', '37060000485');
INSERT INTO zsys_oil_station VALUES ('722', '东青高速六户服务区东区', '东青高速六户服务区东区', '东青高速六户服务区东区', '', '2', '18653198919', '0', '722', null, null, '2019-09-28 17:35:32', '1', '118.607960', '37.378898', '370000', '山东省', '370500', '东营市', '370502', '东营区', '1', '中国石化', '', '', '37010000662');
INSERT INTO zsys_oil_station VALUES ('723', '东青高速六户服务区西区', '东青高速六户服务区西区', '东青高速六户服务区西区', '', '2', '18653198919', '0', '723', null, null, '2019-09-28 17:35:32', '1', '118.607129', '37.379418', '370000', '山东省', '370500', '东营市', '370502', '东营区', '1', '中国石化', '', '', '37010000662');
INSERT INTO zsys_oil_station VALUES ('724', '中国石油天然气股份有限公司烟台莱州第10加油站', '中石油烟台莱州10站', '莱州市文化东街1378号', '', '1', '15906385995', '0', '724', null, null, '2019-09-28 17:35:32', '1', '119.974824', '37.186753', '370000', '山东省', '370600', '烟台市', '370683', '莱州市', '0', '中石油', '', '', '37060000486');
INSERT INTO zsys_oil_station VALUES ('725', '中国石油天然气股份有限公司烟台莱州第11加油站', '中石油烟台莱州11站', '莱州文昌南路万通水果市场南', '', '1', '13406581612', '0', '725', null, null, '2019-09-28 17:35:32', '1', '119.954194', '37.154542', '370000', '山东省', '370600', '烟台市', '370683', '莱州市', '0', '中石油', '', '', '37060000487');
INSERT INTO zsys_oil_station VALUES ('727', '中国石油天然气股份有限公司烟台莱州第15加油站', '中石油烟台莱州15站', '莱州市夏邱镇邢家庄村南300米', '', '1', '13686389195', '0', '727', null, null, '2019-09-28 17:35:32', '1', '119.901307', '37.018073', '370000', '山东省', '370600', '烟台市', '370683', '莱州市', '0', '中石油', '', '', '37060000488');
INSERT INTO zsys_oil_station VALUES ('729', '中石油德州第14加油站', '中石油德州第14加油站', '福星街南环路与104国道交叉口东北角', '', '1', '13675342100', '0', '729', null, null, '2019-09-28 17:35:32', '1', '116.561899', '37.332871', '370000', '山东省', '371400', '德州市', '371403', '陵城区', '0', '中石油', '', '', '37140000388');
INSERT INTO zsys_oil_station VALUES ('730', '中石油德州第24加油站', '中石油德州第24加油站', '枣城大街中段', '', '1', '18353470688', '0', '730', null, null, '2019-09-28 17:35:33', '1', '117.215205', '37.738268', '370000', '山东省', '371400', '德州市', '371481', '乐陵市', '0', '中石油', '', '', '37140000396');
INSERT INTO zsys_oil_station VALUES ('731', '中石油德州第38加油站', '中石油德州第38加油站', '外环南路东首', '', '1', '13792210869', '0', '731', null, null, '2019-09-28 17:35:33', '1', '116.815737', '37.647544', '370000', '山东省', '371400', '德州市', '371422', '宁津县', '0', '中石油', '', '', '37140000390');
INSERT INTO zsys_oil_station VALUES ('732', '泽头服务区东区', '泽头服务区东区', '威海市文登区黄家庄村（G24高速两侧）', '', '2', '13963175255', '0', '732', null, null, '2019-09-28 17:35:33', '1', '121.888660', '37.026500', '370000', '山东省', '371000', '威海市', '371003', '文登区', '1', '中国石化', 'S24', '威青高速', '37100000357');
INSERT INTO zsys_oil_station VALUES ('733', '中石油德州第28加油站', '中石油德州第28加油站', '渤海路与利民街相交丁字路口西北角', '', '1', '13792235973', '0', '733', null, null, '2019-09-28 17:35:33', '1', '117.375477', '37.790285', '370000', '山东省', '371400', '德州市', '371423', '庆云县', '0', '中石油', '', '', '37140000391');
INSERT INTO zsys_oil_station VALUES ('734', '泽头服务区西区', '泽头服务区西区', '威海市文登区黄家庄村（G24高速两侧）', '', '2', '13963175255', '0', '734', null, null, '2019-09-28 17:35:33', '1', '121.888660', '37.026500', '370000', '山东省', '371000', '威海市', '371003', '文登区', '1', '中国石化', 'S24', '威青高速', '37100000357');
INSERT INTO zsys_oil_station VALUES ('735', '中石油德州第9加油站', '中石油德州第9加油站', '历亭街中段汽车站东500米', '', '1', '18266181653', '0', '735', null, null, '2019-09-28 17:35:33', '1', '116.094777', '37.229214', '370000', '山东省', '371400', '德州市', '371428', '武城县', '0', '中石油', '', '', '37140000395');
INSERT INTO zsys_oil_station VALUES ('736', '中石油德州第35加油站', '中石油德州第35加油站', '山东省德州市德城区陈庄乡东风西路西八里村段、运河开发区运河街道办敬老院附近', '', '1', '18353470898', '0', '736', null, null, '2019-09-28 17:35:33', '1', '116.253389', '37.446532', '370000', '山东省', '371400', '德州市', '371402', '德城区', '0', '中石油', '', '', '37140000392');
INSERT INTO zsys_oil_station VALUES ('737', '新桥服务区南区', '新桥南区', '安徽省合肥市蜀山区合六叶高速新桥服务区', '', '2', '15212447789', '0', '737', null, null, '2019-09-28 17:35:33', '1', '116.901164', '31.925538', '340000', '安徽省', '340100', '合肥市', '340104', '蜀山区', '1', '中国石化', 'S4212', '合安高速', '34010000005');
INSERT INTO zsys_oil_station VALUES ('738', '新桥服务区北区', '新桥北区', '安徽省合肥市蜀山区合六叶高速新桥服务区', '', '2', '15212447789', '0', '738', null, null, '2019-09-28 17:35:33', '1', '116.899502', '31.926467', '340000', '安徽省', '340100', '合肥市', '340104', '蜀山区', '1', '中国石化', '', '', '34010000005');
INSERT INTO zsys_oil_station VALUES ('739', '丰乐服务区东区', '丰乐东区', '安徽省合肥市肥西县S4212合安高速丰乐服务区', '', '2', '13856050916', '0', '739', null, null, '2019-09-28 17:35:33', '1', '117.192619', '31.600245', '340000', '安徽省', '340100', '合肥市', '340123', '肥西县', '1', '中国石化', 'S4212', '合安高速', '34010000002');
INSERT INTO zsys_oil_station VALUES ('740', '丰乐服务区西区', '丰乐西区', '安徽省合肥市肥西县S4212合安高速丰乐服务区', '', '2', '13856050916', '0', '740', null, null, '2019-09-28 17:35:34', '1', '117.190935', '31.600113', '340000', '安徽省', '340100', '合肥市', '340123', '肥西县', '1', '中国石化', 'S4212', '合安高速', '34010000002');
INSERT INTO zsys_oil_station VALUES ('741', '长岭关服务区东区', '长岭关东区', '安徽省六安市金寨县G42沪蓉高速长岭关服务区', '', '2', '13856425885', '0', '741', null, null, '2019-09-28 17:35:34', '1', '115.493148', '31.310413', '340000', '安徽省', '341500', '六安市', '341524', '金寨县', '1', '中国石化', 'G42', '沪蓉高速', '34150000003');
INSERT INTO zsys_oil_station VALUES ('742', '长岭关服务区西区', '长岭关西区', '安徽省六安市金寨县G42沪蓉高速长岭关服务区', '', '2', '13856425885', '0', '742', null, null, '2019-09-28 17:35:34', '1', '115.493059', '31.312167', '340000', '安徽省', '341500', '六安市', '341524', '金寨县', '1', '中国石化', 'G42', '沪蓉高速', '34150000003');
INSERT INTO zsys_oil_station VALUES ('743', '罗集服务区南区', '罗集南区', '安徽省六安市裕安区G42沪蓉高速罗集服务区', '', '2', '15055977279', '0', '743', null, null, '2019-09-28 17:35:34', '1', '116.258244', '31.852385', '340000', '安徽省', '341500', '六安市', '341503', '裕安区', '1', '中国石化', 'G42', '沪蓉高速', '34150000002');
INSERT INTO zsys_oil_station VALUES ('744', '罗集服务区北区', '罗集北区', '安徽省六安市裕安区G42沪蓉高速罗集服务区', '', '2', '15055977279', '0', '744', null, null, '2019-09-28 17:35:35', '1', '116.256798', '31.853224', '340000', '安徽省', '341500', '六安市', '341503', '裕安区', '1', '中国石化', 'G42', '沪蓉高速', '34150000002');
INSERT INTO zsys_oil_station VALUES ('745', '河口服务区东区', '河口东区', '安徽省六安市霍邱县G35济广高速河口服务区', '', '2', '13966274399', '0', '745', null, null, '2019-09-28 17:35:35', '1', '116.081612', '32.150796', '340000', '安徽省', '341500', '六安市', '341522', '霍邱县', '1', '中国石化', 'G35', '济广高速', '34150000005');
INSERT INTO zsys_oil_station VALUES ('746', '谯城服务区南区', '谯城南区', '安徽省亳州市谯城区S06宿登高速谯城服务区', '', '2', '15056790366', '0', '746', null, null, '2019-09-28 17:35:35', '1', '115.708463', '33.928978', '340000', '安徽省', '341600', '亳州市', '341602', '谯城区', '1', '中国石化', 'S06', '宿登高速', '34160000002');
INSERT INTO zsys_oil_station VALUES ('747', '谯城服务区北区', '谯城北区', '安徽省亳州市谯城区S06宿登高速谯城服务区', '', '2', '15056790366', '0', '747', null, null, '2019-09-28 17:35:35', '1', '115.705624', '33.930215', '340000', '安徽省', '341600', '亳州市', '341602', '谯城区', '1', '中国石化', 'S06', '宿登高速', '34160000002');
INSERT INTO zsys_oil_station VALUES ('748', '中国石油天然气股份有限公司山东临沂销售分公司第二十九加油站', '临沂29站', '山东省临沂市苍山县神山镇青竹村东1公里206国道路南', '', '1', '18669560529', '0', '748', null, null, '2019-09-28 17:35:36', '1', '118.167983', '34.870085', '370000', '山东省', '371300', '临沂市', '371324', '兰陵县', '0', '中石油', '', '', '37130000394');
INSERT INTO zsys_oil_station VALUES ('749', '砀山服务区东区', '砀山东区', '安徽省宿州市砀山县S97济祁高速砀山服务区', '', '2', '13855702901', '0', '749', null, null, '2019-09-28 17:35:36', '1', '116.416747', '34.472898', '340000', '安徽省', '341300', '宿州市', '341321', '砀山县', '1', '中国石化', 'S97', '济祁高速', '34130000007');
INSERT INTO zsys_oil_station VALUES ('750', '中石油德州第48加油站', '中石油德州第48加油站', '西外环与中心街十字路口西南角', '', '1', '13953401171', '0', '750', null, null, '2019-09-28 17:35:36', '1', '37.658129', '16.782752', '370000', '山东省', '371400', '德州市', '371422', '宁津县', '0', '中石油', '', '', '37140000389');
INSERT INTO zsys_oil_station VALUES ('751', '砀山服务区西区', '砀山西区', '安徽省宿州市砀山县S97济祁高速砀山服务区', '', '2', '13855702901', '0', '751', null, null, '2019-09-28 17:35:36', '1', '116.416086', '34.471619', '340000', '安徽省', '341300', '宿州市', '341321', '砀山县', '1', '中国石化', 'S97', '济祁高速', '34130000007');
INSERT INTO zsys_oil_station VALUES ('752', '中石油德州第44加油站', '中石油德州第44加油站', '齐安大街533号', '', '1', '15864199966', '0', '752', null, null, '2019-09-28 17:35:36', '1', '116.776225', '36.815433', '370000', '山东省', '371400', '德州市', '371425', '齐河县', '0', '中石油', '', '', '37140000393');
INSERT INTO zsys_oil_station VALUES ('753', '南陵服务区东区', '南陵东区', '安徽省芜湖市南陵县S32宣铜高速南陵服务区', '', '2', '13956169296', '0', '753', null, null, '2019-09-28 17:35:36', '1', '118.230956', '30.955058', '340000', '安徽省', '341300', '宿州市', '341302', '埇桥区', '1', '中国石化', 'S32', '宣铜高速', '34020000003');
INSERT INTO zsys_oil_station VALUES ('754', '中国石油天然气股份有限公司山东临沂销售分公司三十二站', '临沂32站', '临沂市河东区太平街道办事处西水湖村南700米', '', '1', '18669560732', '0', '754', null, null, '2019-09-28 17:35:36', '1', '118.444955', '35.151339', '370000', '山东省', '371300', '临沂市', '371312', '河东区', '0', '中石油', '', '', '37130000434');
INSERT INTO zsys_oil_station VALUES ('755', '南陵服务区西区', '南陵西区', '安徽省芜湖市南陵县S32宣铜高速南陵服务区', '', '2', '13956169296', '0', '755', null, null, '2019-09-28 17:35:37', '1', '118.228275', '30.955887', '340000', '安徽省', '341300', '宿州市', '341302', '埇桥区', '1', '中国石化', 'S32', '宣铜高速', '34020000003');
INSERT INTO zsys_oil_station VALUES ('756', '中石油德州第34加油站', '中石油德州第34加油站', '西环南出口德商高速公路东侧', '', '1', '13583446663', '0', '756', null, null, '2019-09-28 17:35:37', '1', '115.937226', '36.956736', '370000', '山东省', '371400', '德州市', '371427', '夏津县', '0', '中石油', '', '', '37140000394');
INSERT INTO zsys_oil_station VALUES ('757', '郎溪服务区东区', '郎溪东区', '安徽省宣城市郎溪县G4012潥宁高速郎溪服务区', '', '2', '18956242501', '0', '757', null, null, '2019-09-28 17:35:37', '1', '119.222352', '30.983761', '340000', '安徽省', '341800', '宣城市', '341821', '郎溪县', '1', '中国石化', 'G4012', '潥宁高速', '34180000002');
INSERT INTO zsys_oil_station VALUES ('758', '郎溪服务区西区', '郎溪西区', '安徽省宣城市郎溪县G4012潥宁高速郎溪服务区', '', '2', '18956242502', '0', '758', null, null, '2019-09-28 17:35:37', '1', '119.220503', '30.983352', '340000', '安徽省', '341800', '宣城市', '341821', '郎溪县', '1', '中国石化', 'G4012', '潥宁高速', '34180000002');
INSERT INTO zsys_oil_station VALUES ('759', '中国石油天然气股份有限公司山东临沂销售分公司代庄站', '临沂代庄站', '临沂市兰山区双岭路（战友医院东南）', '', '1', '13176996888', '0', '759', null, null, '2019-09-28 17:35:37', '1', '118.223081', '35.166690', '370000', '山东省', '371300', '临沂市', '371302', '兰山区', '0', '中石油', '', '', '37130000435');
INSERT INTO zsys_oil_station VALUES ('760', '新芜服务区南区', '新芜南区', '安徽省芜湖市芜湖县S28潥芜高速新芜高速', '', '2', '18756224000', '0', '760', null, null, '2019-09-28 17:35:37', '1', '118.618313', '31.280655', '340000', '安徽省', '340200', '芜湖市', '340221', '芜湖县', '1', '中国石化', 'S28', '潥芜高速', '34020000004');
INSERT INTO zsys_oil_station VALUES ('761', '新芜服务区北区', '新芜北区', '安徽省芜湖市芜湖县S28潥芜高速新芜高速', '', '2', '18756224000', '0', '761', null, null, '2019-09-28 17:35:37', '1', '118.616468', '31.281278', '340000', '安徽省', '340200', '芜湖市', '340221', '芜湖县', '1', '中国石化', 'S28', '潥芜高速', '34020000004');
INSERT INTO zsys_oil_station VALUES ('762', '南漪湖服务区东区', '南漪湖东区', '安徽省宣城市宣州区S03宁宣高速南漪湖服务区', '', '2', '13855383589', '0', '762', null, null, '2019-09-28 17:35:38', '1', '118.953967', '31.169690', '340000', '安徽省', '341800', '宣城市', '341802', '宣州区', '1', '中国石化', 'S03', '宁宣高速', '34180000003');
INSERT INTO zsys_oil_station VALUES ('763', '南漪湖服务区西区', '南漪湖西区', '安徽省宣城市宣州区S03宁宣高速南漪湖服务区', '', '2', '13855383589', '0', '763', null, null, '2019-09-28 17:35:38', '1', '118.952589', '31.170278', '340000', '安徽省', '341800', '宣城市', '341802', '宣州区', '1', '中国石化', 'S03', '宁宣高速', '34180000003');
INSERT INTO zsys_oil_station VALUES ('764', '华阳服务区东区', '华阳东区', '安徽省宣城市绩溪县S01溧黄高速华阳服务区', '', '2', '13855383590', '0', '764', null, null, '2019-09-28 17:35:38', '1', '118.551973', '30.068189', '340000', '安徽省', '341800', '宣城市', '341824', '绩溪县', '1', '中国石化', 'S01', '溧黄高速', '34180000004');
INSERT INTO zsys_oil_station VALUES ('765', '华阳服务区西区', '华阳西区', '安徽省宣城市绩溪县S01溧黄高速华阳服务区', '', '2', '13855383591', '0', '765', null, null, '2019-09-28 17:35:38', '1', '118.550444', '30.068184', '340000', '安徽省', '341800', '宣城市', '341824', '绩溪县', '1', '中国石化', 'S01', '溧黄高速', '34180000004');
INSERT INTO zsys_oil_station VALUES ('766', '中国石油天然气股份有限公司山东临沂销售分公司第五加油站', '临沂5站', '山东省临沂市沂水县许家湖镇西斜午村', '', '1', '18669560595', '0', '766', null, null, '2019-09-28 17:35:38', '1', '118.627136', '35.676180', '370000', '山东省', '371300', '临沂市', '371323', '沂水县', '0', '中石油', '', '', '37130000410');
INSERT INTO zsys_oil_station VALUES ('767', '寒亭服务区南区', '寒亭南区', '安徽省宣城市宣州区S32宣铜高速寒亭服务区', '', '2', '13855383589', '0', '767', null, null, '2019-09-28 17:35:39', '1', '118.551973', '30.068189', '340000', '安徽省', '341800', '宣城市', '341802', '宣州区', '1', '中国石化', 'S32', '宣铜高速', '34180000005');
INSERT INTO zsys_oil_station VALUES ('768', '寒亭服务区北区', '寒亭北区', '安徽省宣城市宣州区S32宣铜高速寒亭服务区', '', '2', '13855383589', '0', '768', null, null, '2019-09-28 17:35:39', '1', '118.580830', '30.971921', '340000', '安徽省', '341800', '宣城市', '341802', '宣州区', '1', '中国石化', 'S32', '宣铜高速', '34180000005');
INSERT INTO zsys_oil_station VALUES ('769', '金沙服务区东区', '金沙东区', '安徽省宣城市宣州区S01溧黄高速金沙服务区', '', '2', '13855383589', '0', '769', null, null, '2019-09-28 17:35:39', '1', '118.763127', '30.293660', '340000', '安徽省', '341800', '宣城市', '341824', '绩溪县', '1', '中国石化', 'S01', '溧黄高速', '34180000006');
INSERT INTO zsys_oil_station VALUES ('770', '金沙服务区西区', '金沙西区', '安徽省宣城市宣州区S01溧黄高速金沙服务区', '', '2', '13855383589', '0', '770', null, null, '2019-09-28 17:35:39', '1', '118.761343', '30.292257', '340000', '安徽省', '341800', '宣城市', '341824', '绩溪县', '1', '中国石化', 'S01', '溧黄高速', '34180000006');
INSERT INTO zsys_oil_station VALUES ('771', '中国石油天然气股份有限公司山东临沂销售分公司第八站', '临沂8站', '临沂市费县上冶镇,文泗路与沂蒙路交汇处,234省道路东', '', '1', '18669560508', '0', '771', null, null, '2019-09-28 17:35:39', '1', '117.960606', '35.406742', '370000', '山东省', '371300', '临沂市', '371325', '费县', '0', '中石油', '', '', '37130000411');
INSERT INTO zsys_oil_station VALUES ('772', '滁州服务区东区', '滁州东区', '安徽省滁州市南谯区S22天潜高速滁州服务区', '', '2', '13855383589', '0', '772', null, null, '2019-09-28 17:35:39', '1', '118.386366', '32.207505', '340000', '安徽省', '341100', '滁州市', '341103', '南谯区', '1', '中国石化', '', '', '34110000005');
INSERT INTO zsys_oil_station VALUES ('773', '滁州服务区西区', '滁州西区', '安徽省滁州市南谯区S22天潜高速滁州服务区', '', '2', '13855383589', '0', '773', null, null, '2019-09-28 17:35:40', '1', '118.385441', '32.207756', '340000', '安徽省', '341100', '滁州市', '341103', '南谯区', '1', '中国石化', '', '', '34110000005');
INSERT INTO zsys_oil_station VALUES ('774', '中国石油天然气股份有限公司山东临沂销售分公司第十一站', '临沂11站', '山东省临沂市沂水县道托乡', '', '1', '18669560511', '0', '774', null, null, '2019-09-28 17:35:40', '1', '118.692668', '35.896469', '370000', '山东省', '371300', '临沂市', '371323', '沂水县', '0', '中石油', '', '', '37130000412');
INSERT INTO zsys_oil_station VALUES ('775', '中国石油天然气股份有限公司山东临沂销售分公司第十六站', '临沂16站', '山东省临沂市莒南县筵宾镇莒新路南', '', '1', '18669560516', '0', '775', null, null, '2019-09-28 17:35:40', '1', '118.788112', '35.267151', '370000', '山东省', '371300', '临沂市', '371327', '莒南县', '0', '中石油', '', '', '37130000413');
INSERT INTO zsys_oil_station VALUES ('776', '中国石油天然气股份有限公司枣庄45站', '中石油枣庄45站', '山东省枣庄市滕州市木石镇桥口南腾枣公路南侧', 'https://oss.etcsd.com/object/5cb54c91a055fa236fb32818', '1', '2358597', '0', '776', null, null, '2019-09-28 17:35:40', '1', '117.148091', '34.983663', '370000', '山东省', '370400', '枣庄市', '370481', '滕州市', '0', '中石油', '', '', '37040000533');
INSERT INTO zsys_oil_station VALUES ('777', '中国石油天然气股份有限公司枣庄43站', '中石油枣庄43站', '山东省枣庄市滕州市南沙河镇上徐村笃西路路南', 'https://oss.etcsd.com/object/5cb54c91a055fa236fb3281a', '1', '5955695', '0', '777', null, null, '2019-09-28 17:35:40', '1', '117.148090', '34.999785', '370000', '山东省', '370400', '枣庄市', '370481', '滕州市', '0', '中石油', '', '', '370400004980');
INSERT INTO zsys_oil_station VALUES ('778', '中国石油天然气股份有限公司枣庄31站', '中石油枣庄31站', '峄城区峨山镇驻地', 'https://oss.etcsd.com/object/5cb54c92a055fa236fb3281c', '1', '7811639', '0', '778', null, null, '2019-09-28 17:35:40', '1', '117.696910', '34.782187', '370000', '山东省', '370400', '枣庄市', '370404', '峄城区', '0', '中石油', '', '', '37040000543');
INSERT INTO zsys_oil_station VALUES ('779', '中国石油天然气股份有限公司枣庄27站', '中石油枣庄27站', '山东省枣庄市市中区解放南路路东（原公交加油站）', 'https://oss.etcsd.com/object/5cb54c92549ecdf1d78c0af8', '1', '3188286', '0', '779', null, null, '2019-09-28 17:35:40', '1', '117.153045', '35.060450', '370000', '山东省', '370400', '枣庄市', '370402', '市中区', '0', '中石油', '', '', '37040000544');
INSERT INTO zsys_oil_station VALUES ('780', '中国石油天然气股份有限公司枣庄23站', '中石油枣庄23站', '山东省枣庄市峄城区底阁镇驻地234省道', 'https://oss.etcsd.com/object/5cb54c92549ecdf1d78c0afa', '1', '7763333', '0', '780', null, null, '2019-09-28 17:35:41', '1', '117.801653', '34.701747', '370000', '山东省', '370400', '枣庄市', '370404', '峄城区', '0', '中石油', '', '', '37040000546');
INSERT INTO zsys_oil_station VALUES ('781', '中国石油天然气股份有限公司枣庄22站', '中石油枣庄22站', '市中区税郭镇安城东，新旧206国道交汇处路南', 'https://oss.etcsd.com/object/5cb54c92549ecdf1d78c0afc', '1', '3512336', '0', '781', null, null, '2019-09-28 17:35:41', '1', '117.674528', '34.846550', '370000', '山东省', '370400', '枣庄市', '370402', '市中区', '0', '中石油', '', '', '3704000051');
INSERT INTO zsys_oil_station VALUES ('782', '中国石油天然气股份有限公司枣庄17站', '中石油枣庄17站', '市中区君山东路与建设北路交叉口东50米君山路南侧', 'https://oss.etcsd.com/object/5cb54c92a055fa236fb3281e', '1', '3077696', '0', '782', null, null, '2019-09-28 17:35:41', '1', '117.580838', '34.862927', '370000', '山东省', '370400', '枣庄市', '370402', '市中区', '0', '中石油', '', '', '3704000049');
INSERT INTO zsys_oil_station VALUES ('783', '中国石油天然气股份有限公司枣庄15站', '中石油枣庄15站', '峄城区枣台公路复线与郯薛公路交叉口西北角', 'https://oss.etcsd.com/object/5cb54c92a055fa236fb32820', '1', '7561618', '0', '783', null, null, '2019-09-28 17:35:41', '1', '117.621227', '34.740415', '370000', '山东省', '370400', '枣庄市', '370404', '峄城区', '0', '中石油', '', '', '37040000512');
INSERT INTO zsys_oil_station VALUES ('784', '中国石油天然气股份有限公司枣庄12站', '中石油枣庄12站', '峄城区榴园镇王庄村206国道与郯薛公路', 'https://oss.etcsd.com/object/5cb54c92549ecdf1d78c0afe', '1', '7906226', '0', '784', null, null, '2019-09-28 17:35:42', '1', '117.621227', '34.740415', '370000', '山东省', '370400', '枣庄市', '370404', '峄城区', '0', '中石油', '', '', '37040000489');
INSERT INTO zsys_oil_station VALUES ('785', '中国石油天然气股份有限公司枣庄11站', '中石油枣庄11站', '枣庄市台儿庄区兴中路', 'https://oss.etcsd.com/object/5cb54c92a055fa236fb32822', '1', '6601786', '0', '785', null, null, '2019-09-28 17:35:42', '1', '117.736081', '34.563799', '370000', '山东省', '370400', '枣庄市', '370405', '台儿庄区', '0', '中石油', '', '', '37040000555');
INSERT INTO zsys_oil_station VALUES ('786', '山东高速服务区管理有限公司临枣路峄城服务区', '临枣高速峄城服务区南', '临枣高速公路K59公里处', '', '1', '​05395299758', '0', '786', null, null, '2019-09-28 17:35:42', '1', '117.665020', '34.750289', '370000', '山东省', '370400', '枣庄市', '370404', '峄城区', '1', '中石油', '', '', '3704000044');
INSERT INTO zsys_oil_station VALUES ('787', '山东高速服务区管理有限公司临枣路峄城服务区北', '临枣高速峄城服务区北', '临枣高速公路K59公里北处', '', null, '​05395299758', '0', '787', null, null, '2019-09-28 17:35:42', '1', '117.665020', '34.750289', '370000', '山东省', '370400', '枣庄市', '370404', '峄城区', '1', '山东石化', '', '', '37040000440');
INSERT INTO zsys_oil_station VALUES ('788', '枣庄市贵和石化有限公司', '贵和石化', '峄城区吴林办事处大埝居（峄城南收费站北1000米）', '', null, '​15006716399', '0', '788', null, null, '2019-09-28 17:35:42', '1', '117.612512', '34.761623', '370000', '山东省', '370400', '枣庄市', '370404', '峄城区', '0', '其它', '', '', '37040000568');
INSERT INTO zsys_oil_station VALUES ('789', '滕州市公共汽车公司加油站', '滕州公交加油站', '滕州市平行路南西侧147号', '', null, '​06325699720', '0', '789', null, null, '2019-09-28 17:35:42', '1', '117.154214', '35.048756', '370000', '山东省', '370400', '枣庄市', '370481', '滕州市', '0', '其它', '', '', '37040000519');
INSERT INTO zsys_oil_station VALUES ('790', '山东清恒石油化工有限公司枣庄峄城第一加油站', '清恒石油1站', '峄城区吴林街道田楼村352省道74.5公里路北', '', null, '​13906322535', '0', '790', null, null, '2019-09-28 17:35:42', '1', '117.620020', '34.762020', '370000', '山东省', '370400', '枣庄市', '370404', '峄城区', '0', '其它', '', '', '37040000569');
INSERT INTO zsys_oil_station VALUES ('802', '中国石油天然气股份有限公司烟台莱州南环加油站', '中石油烟台莱州南环站', '莱州市文峰路街道东朱家村南环路南', '', '1', '15866369875', '0', '802', null, null, '2019-09-28 17:35:42', '1', '119.967308', '37.147950', '370000', '山东省', '370600', '烟台市', '370683', '莱州市', '0', '中石油', '', '', '37060000489');
INSERT INTO zsys_oil_station VALUES ('803', '中国石油天然气股份有限公司烟台莱州石都加油站', '中石油烟台莱州石都站', '莱州市夏邱镇李家庄子村北200米', '', '1', '15949884838', '0', '803', null, null, '2019-09-28 17:35:43', '1', '119.880785', '37.020025', '370000', '山东省', '370600', '烟台市', '370683', '莱州市', '0', '中石油', '', '', '37060000492');
INSERT INTO zsys_oil_station VALUES ('804', '中国石油天然气股份有限公司烟台莱州周扬加油站', '中石油烟台莱州周杨站', '莱州市沙河镇周杨村北', '', '1', '13705459111', '0', '804', null, null, '2019-09-28 17:35:43', '1', '119.779090', '37.060090', '370000', '山东省', '370600', '烟台市', '370683', '莱州市', '0', '中石油', '', '', '37060000490');
INSERT INTO zsys_oil_station VALUES ('805', '中国石油天然气股份有限公司烟台莱州西苑加油站', '中石油烟台莱州西苑站', '莱州市永安路街道西关村西 中国石油加油站', '', '1', '13573553936', '0', '805', null, null, '2019-09-28 17:35:43', '1', '119.937628', '37.183833', '370000', '山东省', '370600', '烟台市', '370683', '莱州市', '0', '中石油', '', '', '37060000472');
INSERT INTO zsys_oil_station VALUES ('806', '中国石油天然气股份有限公司烟台招远第2加油站', '中石油烟台招远2站', '招远温泉路北50米（架旗山游乐园对面） ', '', '1', '13589840892', '0', '806', null, null, '2019-09-28 17:35:43', '1', '120.372390', '37.357120', '370000', '山东省', '370600', '烟台市', '370685', '招远市', '0', '中石油', '', '', '37060000452');
INSERT INTO zsys_oil_station VALUES ('807', '中国石油天然气股份有限公司烟台招远第3加油站', '中石油烟台招远3站', '招远市罗峰街道办事处郭家埠村南', '', '1', '15698183080', '0', '807', null, null, '2019-09-28 17:35:44', '1', '120.399672', '37.319128', '370000', '山东省', '370600', '烟台市', '370685', '招远市', '0', '中石油', '', '', '37060000453');
INSERT INTO zsys_oil_station VALUES ('808', '中国石油天然气股份有限公司烟台招远第5加油站', '中石油烟台招远5站', '招远市金岭镇邵家村北', '', '1', '13583513526', '0', '808', null, null, '2019-09-28 17:35:44', '1', '120.305350', '37.399056', '370000', '山东省', '370600', '烟台市', '370685', '招远市', '0', '中石油', '', '', '37060000454');
INSERT INTO zsys_oil_station VALUES ('809', '山东壳牌石油有限公司德州市天衢西路加油站', '壳牌德州市天衢西路加油站', '天衢西路化肥厂对面', '', '3', '15806819696', '0', '809', null, null, '2019-09-28 17:35:44', '1', '116.273657', '37.460446', '370000', '山东省', '371400', '德州市', '371402', '德城区', '0', '壳牌', '', '', '37140000404');
INSERT INTO zsys_oil_station VALUES ('810', '山东壳牌石油有限公司德州市解放南大道加油站', '壳牌德州市解放南大道加油站', '向阳南路182号院内', '', '3', '18905346663', '0', '810', null, null, '2019-09-28 17:35:44', '1', '116.309769', '37.426270', '370000', '山东省', '371400', '德州市', '371402', '德城区', '0', '壳牌', '', '', '37140000399');
INSERT INTO zsys_oil_station VALUES ('811', '山东壳牌石油有限公司陵县福星街加油站', '壳牌陵县福星街加油站', '德州市陵城区西城街27号', '', '3', '18005345011', '0', '811', null, null, '2019-09-28 17:35:45', '1', '116.563195', '37.346347', '370000', '山东省', '371400', '德州市', '371403', '陵城区', '0', '壳牌', '', '', '37140000406');
INSERT INTO zsys_oil_station VALUES ('812', '山东壳牌石油有限公司德州齐河世纪路加油站', '壳牌德州齐河世纪路加油站', '齐心大街与晏坡路交叉口向南500米', '', '3', '18905348155', '0', '812', null, null, '2019-09-28 17:35:45', '1', '116.745178', '36.788795', '370000', '山东省', '371400', '德州市', '371425', '齐河县', '0', '壳牌', '', '', '37140000401');
INSERT INTO zsys_oil_station VALUES ('813', '山东壳牌石油有限公司禹城市解放路加油站', '壳牌禹城市解放路加油站', '德州市禹城市解放路29号', '', '3', '18905348155', '0', '813', null, null, '2019-09-28 17:35:45', '1', '116.634694', '36.933707', '370000', '山东省', '371400', '德州市', '371482', '禹城市', '0', '壳牌', '', '请选择道路', '37140000403');
INSERT INTO zsys_oil_station VALUES ('814', '中国石油天然气股份有限公司烟台招远第8加油站', '中石油烟台招远8站', '招远市金城路146号', '', '1', '13863821228', '0', '814', null, null, '2019-09-28 17:35:45', '1', '120.401266', '37.351958', '370000', '山东省', '370600', '烟台市', '370685', '招远市', '0', '中石油', '', '', '37060000457');
INSERT INTO zsys_oil_station VALUES ('815', '中国石油天然气股份有限公司山东淄博销售分公司第21加油站', '淄博21站', '丁家庄村路口', '', '1', '15762891779', '0', '815', null, null, '2019-09-28 17:35:46', '1', '117.996950', '36.210750', '370000', '山东省', '370300', '淄博市', '370323', '沂源县', '0', '中石油', '', '', '37030000251');
INSERT INTO zsys_oil_station VALUES ('816', '中国石油天然气股份有限公司烟台招远第7加油站', '中石油烟台招远7站', '招远市大秦家镇沙埠村北', '', '1', '13791261683', '0', '816', null, null, '2019-09-28 17:35:46', '1', '120.450568', '37.392547', '370000', '山东省', '370600', '烟台市', '370685', '招远市', '0', '中石油', '', '', '37060000456');
INSERT INTO zsys_oil_station VALUES ('817', '中国石油天然气股份有限公司山东淄博销售分公司第25加油站', '淄博25站', '经济开发区管委会对过（原国道沂源收费站北）', '', '1', '15092345630', '0', '817', null, null, '2019-09-28 17:35:46', '1', '118.235650', '36.193610', '370000', '山东省', '370300', '淄博市', '370323', '沂源县', '0', '中石油', '', '', '37030000255');
INSERT INTO zsys_oil_station VALUES ('818', '中国石油天然气股份有限公司山东淄博销售分公司第24加油站', '淄博24站', '101号', '', '1', '15953342270', '0', '818', null, null, '2019-09-28 17:35:46', '1', '118.050290', '36.770740', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '中石油', '', '', '37030000254');
INSERT INTO zsys_oil_station VALUES ('820', '中国石油天然气股份有限公司山东淄博销售分公司第23加油站', '淄博23站', '崔军村南', '', '1', '15165336768', '0', '820', null, null, '2019-09-28 17:35:47', '1', '118.057250', '36.736480', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '中石油', '', '', '37030000253');
INSERT INTO zsys_oil_station VALUES ('821', '中国石油天然气股份有限公司烟台招远第6加油站', '中石油烟台招远6站', '招远市玲珑镇高家村村南', '', '1', '18615005970', '0', '821', null, null, '2019-09-28 17:35:47', '1', '120.501350', '37.428280', '370000', '山东省', '370600', '烟台市', '370685', '招远市', '0', '中石油', '', '', '3706000455');
INSERT INTO zsys_oil_station VALUES ('822', '中国石油天然气股份有限公司烟台招远第9加油站', '中石油烟台招远9站', '招远市毕郭镇红绿灯东200米路南', '', '1', '13220932529', '0', '822', null, null, '2019-09-28 17:35:47', '1', '120.571482', '37.227115', '370000', '山东省', '370600', '烟台市', '370685', '招远市', '0', '中石油', '', '', '37060000458');
INSERT INTO zsys_oil_station VALUES ('824', '中国石油天然气股份有限公司山东淄博销售分公司第20加油站', '淄博20站', '与镇府街交界处北100米', '', '1', '13589508436', '0', '824', null, null, '2019-09-28 17:35:48', '1', '118.050290', '36.770740', '370000', '山东省', '370300', '淄博市', '370321', '桓台县', '0', '中石油', '', '', '37030000250');
INSERT INTO zsys_oil_station VALUES ('825', '中国石油天然气股份有限公司山东淄博销售分公司第19加油站', '淄博19站', '淄博热电厂东200米', '', '1', '13754774546', '0', '825', null, null, '2019-09-28 17:35:48', '1', '118.111117', '36.794251', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '中石油', '', '', '37030000249');
INSERT INTO zsys_oil_station VALUES ('826', '中国石油天然气股份有限公司山东淄博销售分公司第17加油站', '淄博17站', '敬仲镇东苇村', '', '1', '15949907159', '0', '826', null, null, '2019-09-28 17:35:48', '1', '118.303570', '36.938100', '370000', '山东省', '370300', '淄博市', '370305', '临淄区', '0', '中石油', '', '', '37030000248');
INSERT INTO zsys_oil_station VALUES ('827', '长深高速G18无棣停车区加油站', '无棣停车区东区中国石化加油站', '长深高速无棣停车区东区', '', '2', '15564093333', '0', '827', null, null, '2019-09-28 17:35:48', '1', '117.618079', '37.982010', '370000', '山东省', '371600', '滨州市', '371623', '无棣县', '1', '中国石化', 'G25', '长深高速', '37010000662');
INSERT INTO zsys_oil_station VALUES ('828', '中国石油天然气股份有限公司山东淄博销售分公司第16加油站', '中石油淄博16站', '陈庄镇顺河村', '', '1', '13583373463', '0', '828', null, null, '2019-09-28 17:35:48', '1', '117.922770', '37.037000', '370000', '山东省', '370300', '淄博市', '370321', '桓台县', '0', '中石油', '', '', '37030000247');
INSERT INTO zsys_oil_station VALUES ('829', '长深高速G18无棣停车区西区加油站', '无棣停车区西区中国石化加油站', '长深高速无棣停车区西区', '', '2', '15564093333', '0', '829', null, null, '2019-09-28 17:35:49', '1', '117.789141', '37.779673', '370000', '山东省', '371600', '滨州市', '371623', '无棣县', '1', '中国石化', 'G25', '长深高速', '37010000662');
INSERT INTO zsys_oil_station VALUES ('830', '长深高速G18无棣服务区加油站', '无棣服务区东区中国石化加油站', '长深高速无棣服务区东区', '', '1', '13854399929', '0', '830', null, null, '2019-09-28 17:35:49', '1', '117.615079', '37.982010', '370000', '山东省', '371600', '滨州市', '371623', '无棣县', '1', '中石油', 'G25', '长深高速', '37010000662');
INSERT INTO zsys_oil_station VALUES ('831', '山东路油油气管理有限公司无棣加油站', '山东路油油气管理有限公司无棣加油站', '无棣县转盘西北角', '', '2', '18653197989', '0', '831', null, null, '2019-09-28 17:35:49', '1', '117.613455', '37.765269', '370000', '山东省', '371600', '滨州市', '371623', '无棣县', '0', '中国石化', '', '', '37010000662');
INSERT INTO zsys_oil_station VALUES ('832', '中国石油天然气股份有限公司山东淄博销售分公司第15加油站', '中石油淄博15站', '309国道高塘段路北', '', '1', '13561637221', '0', '832', null, null, '2019-09-28 17:35:49', '1', '118.303570', '36.938100', '370000', '山东省', '370300', '淄博市', '370306', '周村区', '0', '中石油', '', '', '37030000246');
INSERT INTO zsys_oil_station VALUES ('833', '山东路油油气管理有限公司滨州第四加油站', '山东路油油气管理有限公司滨州第四加油站', '沾化县古城镇驻地', '', '2', '18653193331', '0', '833', null, null, '2019-09-28 17:35:50', '1', '117.463700', '37.414000', '370000', '山东省', '371600', '滨州市', '371603', '沾化区', '0', '中国石化', '', '', '37010000662');
INSERT INTO zsys_oil_station VALUES ('834', '中国石油天然气股份有限公司山东淄博销售分公司第14加油站', '中石油淄博14站', '管庄段', '', '1', '13371590898', '0', '834', null, null, '2019-09-28 17:35:50', '1', '117.896280', '36.800200', '370000', '山东省', '370300', '淄博市', '370306', '周村区', '0', '中石油', '', '', '37030000245');
INSERT INTO zsys_oil_station VALUES ('835', '中国石油天然气股份有限公司山东淄博销售分公司第11加油站', '中石油淄博11站', '8.5公里处', '', '1', '15069355809', '0', '835', null, null, '2019-09-28 17:35:50', '1', '118.311240', '36.901440', '370000', '山东省', '370300', '淄博市', '370305', '临淄区', '0', '中石油', '', '', '37030000244');
INSERT INTO zsys_oil_station VALUES ('836', '中国石油天然气股份有限公司山东淄博销售分公司第10加油站', '中石油淄博10站', '齐都镇娄子村北', '', '1', '13964379270', '0', '836', null, null, '2019-09-28 17:35:50', '1', '118.310020', '36.864840', '370000', '山东省', '370300', '淄博市', '370305', '临淄区', '0', '中石油', '', '', '37030000243');
INSERT INTO zsys_oil_station VALUES ('837', '中国石油天然气股份有限公司山东淄博销售分公司第9加油站', '中石油淄博9站', '耿桥河涯头村', '', '1', '18853371290', '0', '837', null, null, '2019-09-28 17:35:51', '1', '118.141190', '36.999400', '370000', '山东省', '370300', '淄博市', '370321', '桓台县', '0', '中石油', '', '', '37030000242');
INSERT INTO zsys_oil_station VALUES ('838', '中国石油天然气股份有限公司山东临沂销售分公司第二十五站', '临沂25站', '山东省临沂市沂水县城长安路南段（交通局对过）', '', '1', '18669560525', '0', '838', null, null, '2019-09-28 17:35:51', '1', '118.640163', '35.766924', '370000', '山东省', '371300', '临沂市', '371323', '沂水县', '0', '中石油', '', '', '37130000414');
INSERT INTO zsys_oil_station VALUES ('839', '中国石油天然气股份有限公司烟台招远第16加油站', '中石油烟台招远16站', '招远市金岭镇皂户王家村头', '', '1', '18615005970', '0', '839', null, null, '2019-09-28 17:35:51', '1', '120.276414', '37.403836', '370000', '山东省', '370600', '烟台市', '370685', '招远市', '0', '中石油', '', '', '37060000459');
INSERT INTO zsys_oil_station VALUES ('840', '中国石油天然气股份有限公司烟台招远第18加油站', '中石油烟台招远18站', '招远市大秦家镇大秦家邮局西', '', '1', '13791206072', '0', '840', null, null, '2019-09-28 17:35:51', '1', '120.454626', '37.369849', '370000', '山东省', '370600', '烟台市', '370685', '招远市', '0', '中石油', '', '', '37060000389');
INSERT INTO zsys_oil_station VALUES ('841', '中国石油天然气股份有限公司烟台招远国大加油站', '中石油烟台招远国大站', '招远市国大路670号国大黄金西邻', '', '1', '13176906808', '0', '841', null, null, '2019-09-28 17:35:51', '1', '120.404737', '37.417215', '370000', '山东省', '370600', '烟台市', '370685', '招远市', '0', '中石油', '', '', '37060000491');
INSERT INTO zsys_oil_station VALUES ('842', '中国石油天然气股份有限公司山东临沂销售分公司第二十八加油站', '临沂28站', '临沂市罗庄区化武路东段路南，临西七路以西', '', '1', '18669560528', '0', '842', null, null, '2019-09-28 17:35:52', '1', '118.306639', '35.039560', '370000', '山东省', '371300', '临沂市', '371311', '罗庄区', '0', '中石油', '', '', '37130000415');
INSERT INTO zsys_oil_station VALUES ('843', '中国石油天然气股份有限公司山东临沂销售分公司第二十七加油站', '临沂27站', '郯城县李庄镇205国道李庄段镇南3公里西10米', '', '1', '18669560527', '0', '843', null, null, '2019-09-28 17:35:52', '1', '118.421036', '34.898490', '370000', '山东省', '371300', '临沂市', '371322', '郯城县', '0', '中石油', '', '', '37130000417');
INSERT INTO zsys_oil_station VALUES ('844', '中国石油天然气股份有限公司山东临沂销售分公司沂蒙姐妹加油站', '临沂沂蒙姐妹站', '山东省临沂市半程镇后社村汶泗路北', '', '1', '18669560599', '0', '844', null, null, '2019-09-28 17:35:52', '1', '118.305270', '35.269520', '370000', '山东省', '371300', '临沂市', '371302', '兰山区', '0', '中石油', '', '', '37130000418');
INSERT INTO zsys_oil_station VALUES ('845', '中国石油天然气股份有限公司山东临沂销售分公司第三十加油站', '临沂30站', '沂水县许家湖镇长安路与南一环交汇处北50米东方瑞海度假村对过', '', '1', '18669560530', '0', '845', null, null, '2019-09-28 17:35:52', '1', '118.637161', '35.753993', '370000', '山东省', '371300', '临沂市', '371323', '沂水县', '0', '中石油', '', '', '37130000407');
INSERT INTO zsys_oil_station VALUES ('847', '惠民工业路加油站', '惠民工业路加油站', '滨州市惠民县工业路西', '', '1', '18766679588     ', '0', '847', null, null, '2019-09-28 17:35:52', '1', '117.522106', '37.468462', '370000', '山东省', '371600', '滨州市', '371621', '惠民县', '0', '中石油', '', '', '37160000440');
INSERT INTO zsys_oil_station VALUES ('848', '中国石油天然气股份有限公司烟台龙口第3加油站', '中石油烟台龙口3站', '龙口海岱镇河口于家村西加油站', '', '1', '13616453086', '0', '848', null, null, '2019-09-28 17:35:52', '1', '120.319770', '37.602100', '370000', '山东省', '370600', '烟台市', '370681', '龙口市', '0', '中石油', '', '', '37060000437');
INSERT INTO zsys_oil_station VALUES ('850', '中国石油天然气股份有限公司烟台龙口第2加油站', '中石油烟台龙口2站', '龙口北马镇尚家村南加油站', '', '1', '15954516316', '0', '850', null, null, '2019-09-28 17:35:52', '1', '120.390150', '37.585050', '370000', '山东省', '370600', '烟台市', '370681', '龙口市', '0', '中石油', '', '', '37060000436');
INSERT INTO zsys_oil_station VALUES ('851', '中国石油天然气股份有限公司烟台龙口第1加油站', '中石油烟台龙口1站', '龙口市九南村牟黄公路南', '', '1', '13562567895', '0', '851', null, null, '2019-09-28 17:35:53', '1', '120.494661', '37.632945', '370000', '山东省', '370600', '烟台市', '370681', '龙口市', '0', '中石油', '', '', '37060000435');
INSERT INTO zsys_oil_station VALUES ('853', '中国石油天然气股份有限公司山东临沂销售分公司第六十五加油站', '临沂65站', '临沂市兰山区银雀山路与临西八路交汇处', '', '1', '18669560565', '0', '853', null, null, '2019-09-28 17:35:53', '1', '118.300314', '35.065410', '370000', '山东省', '371300', '临沂市', '371302', '兰山区', '0', '中石油', '', '', '37130000409');
INSERT INTO zsys_oil_station VALUES ('854', '中国石油天然气股份有限公司山东临沂销售分公司第二十加油站', '临沂20站', '山东省临沂市兰山区蒙山大道119号', '', '1', '18669560520', '0', '854', null, null, '2019-09-28 17:35:53', '1', '118.318709', '35.062594', '370000', '山东省', '371300', '临沂市', '371302', '兰山区', '0', '中石油', '', '', '37130000406');
INSERT INTO zsys_oil_station VALUES ('855', '中国石油天然气股份有限公司山东临沂销售分公司第十九加油站', '临沂19站', '临沂市临沭县常林大街路北', '', '1', '18669560519', '0', '855', null, null, '2019-09-28 17:35:53', '1', '118.630125', '34.928051', '370000', '山东省', '371300', '临沂市', '371329', '临沭县', '0', '中石油', '', '', '37130000405');
INSERT INTO zsys_oil_station VALUES ('856', '中国石油天然气股份有限公司山东临沂销售分公司第十五加油站', '临沂15站', '山东省临沂市莒南县大店镇政府驻地226省道西侧', '', '1', '18669560515', '0', '856', null, null, '2019-09-28 17:35:53', '1', '118.776239', '35.337897', '370000', '山东省', '371300', '临沂市', '371327', '莒南县', '0', '中石油', '', '', '37130000402');
INSERT INTO zsys_oil_station VALUES ('857', '中国石油天然气股份有限公司山东临沂销售分公司第六十八加油站', '临沂68站', '费县探沂镇富贵村西500米南侧', '', '1', '18669560568', '0', '857', null, null, '2019-09-28 17:35:53', '1', '118.046737', '35.243002', '370000', '山东省', '371300', '临沂市', '371325', '费县', '0', '中石油', '', '', '37130000397');
INSERT INTO zsys_oil_station VALUES ('858', '中国石油天然气股份有限公司山东临沂销售分公司第二十二加油站', '临沂22站', '临沂市罗庄区罗庄街道办事处江泉大酒店南临', '', '1', '18669560522', '0', '858', null, null, '2019-09-28 17:35:53', '1', '118.304189', '34.995608', '370000', '山东省', '371300', '临沂市', '371311', '罗庄区', '0', '中石油', '', '', '37130000393');
INSERT INTO zsys_oil_station VALUES ('859', '中国石油天然气股份有限公司山东临沂销售分公司第六加油站', '临沂6站', '山东省临沂市莒南县汀水镇206国道与莒县交界处', '', '1', '18669560506', '0', '859', null, null, '2019-09-28 17:35:53', '1', '118.631454', '35.376719', '370000', '山东省', '371300', '临沂市', '371327', '莒南县', '0', '中石油', '', '', '37130000390');
INSERT INTO zsys_oil_station VALUES ('860', '中国石油天然气股份有限公司山东临沂销售分公司第十三加油站', '临沂13站', '山东省临沂市苍山县中心路南', '', '1', '18669560513', '0', '860', null, null, '2019-09-28 17:35:53', '1', '118.038296', '34.864019', '370000', '山东省', '371300', '临沂市', '371324', '兰陵县', '0', '中石油', '', '', '37130000400');
INSERT INTO zsys_oil_station VALUES ('862', '山东高速服务区管理有限公司青银路青州分公司南区', '青银高速青州服务区南区加油站', '青州高柳镇竹林马东高速公路服务区加油站南区', '', '2', '15908002788', '0', '862', null, null, '2019-09-28 17:35:54', '1', '118.521398', '36.806708', '370000', '山东省', '370700', '潍坊市', '370781', '青州市', '1', '中国石化', 'G20', '青银高速', '37070000298');
INSERT INTO zsys_oil_station VALUES ('864', '中国石油天然气股份有限公司山东泰安销售分公司泰安第10加油站', '中国石油泰安第10加油站', '泰安市岱岳区政府南500米', 'https://oss.etcsd.com/object/5cb54c92549ecdf1d78c0b00', '1', '13583877296', '0', '864', null, null, '2019-09-28 17:35:54', '1', '117.041128', '36.180655', '370000', '山东省', '370900', '泰安市', '370911', '岱岳区', '0', '中石油', '', '', '37090000468');
INSERT INTO zsys_oil_station VALUES ('865', '荣乌高速潍坊北服务区北区', '潍坊北服务区北区加油站', '荣乌高速K41+500米处潍坊北服务区', '', null, '18653198268', '0', '865', null, null, '2019-09-28 17:35:54', '1', '119.222370', '36.973380', '370000', '山东省', '370700', '潍坊市', '370701', '市辖区', '1', '其它', 'G18', '荣乌高速', '37010000662');
INSERT INTO zsys_oil_station VALUES ('866', '荣乌高速潍坊北服务区南区', '潍坊北服务区南区加油站', 'G18荣乌高速K41+500米处', '', null, '18653198268', '0', '866', null, null, '2019-09-28 17:35:54', '1', '119.221000', '36.972590', '370000', '山东省', '370700', '潍坊市', '370701', '市辖区', '1', '其它', 'G18', '荣乌高速', '37010000662');
INSERT INTO zsys_oil_station VALUES ('867', '中国石油天然气股份有限公司山东泰安销售分公司泰安第14加油站', '中国石油泰安第14加油站', '泰安104国道处环粥店办事处', 'https://oss.etcsd.com/object/5cb54c92549ecdf1d78c0b02', '1', '13581143215', '0', '867', null, null, '2019-09-28 17:35:54', '1', '117.005444', '36.178981', '370000', '山东省', '370900', '泰安市', '370902', '泰山区', '0', '中石油', '', '', '37090000477');
INSERT INTO zsys_oil_station VALUES ('868', '中国石油天然气股份有限公司山东泰安销售分公司泰安第15加油站', '中国石油泰安第15加油站', '新泰新汶城区迎宾路西侧', 'https://oss.etcsd.com/object/5cb54c92549ecdf1d78c0b04', '1', '15163888077', '0', '868', null, null, '2019-09-28 17:35:54', '1', '117.703163', '35.870786', '370000', '山东省', '370900', '泰安市', '370982', '新泰市', '0', '中石油', '', '', '37090000462');
INSERT INTO zsys_oil_station VALUES ('869', '中国石油天然气股份有限公司山东泰安销售分公司泰安第17加油站', '中国石油泰安第17加油站', '泰安市东平县岱庙乡', 'https://oss.etcsd.com/object/5cb54c92a055fa236fb32824', '1', '15163802600', '0', '869', null, null, '2019-09-28 17:35:55', '1', '117.165782', '36.179308', '370000', '山东省', '370900', '泰安市', '370923', '东平县', '0', '中石油', '', '', '37090000475');
INSERT INTO zsys_oil_station VALUES ('870', '中国石油天然气股份有限公司山东泰安销售分公司泰安第1加油站', '中国石油泰安第1加油站', '泰安市粥店镇黄草岭', 'https://oss.etcsd.com/object/5cb54c92a055fa236fb32826', '1', '13561753760', '0', '870', null, null, '2019-09-28 17:35:55', '1', '117.012966', '36.237429', '370000', '山东省', '370900', '泰安市', '370902', '泰山区', '0', '中石油', '', '', '37090000470');
INSERT INTO zsys_oil_station VALUES ('871', '中国石油天然气股份有限公司山东泰安销售分公司泰安第20加油站', '中国石油泰安第20加油站', '宁阳县333省道与济兖路交汇口', 'https://oss.etcsd.com/object/5cb54c93a055fa236fb32828', '1', '15963155066', '0', '871', null, null, '2019-09-28 17:35:55', '1', '116.800833', '35.790678', '370000', '山东省', '370900', '泰安市', '370921', '宁阳县', '0', '中石油', '', '', '37090000481');
INSERT INTO zsys_oil_station VALUES ('872', '中国石油天然气股份有限公司山东泰安销售分公司泰安第21加油站', '中国石油泰安第21加油站', '宁阳县333省道磁窑开发区处', 'https://oss.etcsd.com/object/5cb54c93a055fa236fb3282a', '1', '15066738300', '0', '872', null, null, '2019-09-28 17:35:55', '1', '117.060085', '35.909642', '370000', '山东省', '370900', '泰安市', '370921', '宁阳县', '0', '中石油', '', '', '37090000480');
INSERT INTO zsys_oil_station VALUES ('873', '中国石油天然气股份有限公司山东泰安销售分公司泰安第26加油站', '中国石油泰安第26加油站', '新泰市市区东北部，新龙路南侧', 'https://oss.etcsd.com/object/5cb54c93549ecdf1d78c0b06', '1', '15169828331', '0', '873', null, null, '2019-09-28 17:35:55', '1', '117.821289', '35.926265', '370000', '山东省', '370900', '泰安市', '370982', '新泰市', '0', '中石油', '', '', '37090000484');
INSERT INTO zsys_oil_station VALUES ('874', '荣乌高速寿光服务区北区', '寿光服务区北区加油站', '荣乌高速寿光服务区北区', '', null, '18653198665', '0', '874', null, null, '2019-09-28 17:35:55', '1', '118.702196', '37.100653', '370000', '山东省', '370700', '潍坊市', '370703', '寒亭区', '1', '其它', 'G18', '荣乌高速', '37010000662');
INSERT INTO zsys_oil_station VALUES ('875', '中国石油天然气股份有限公司山东泰安销售分公司泰安第28加油站', '中国石油泰安第28加油站', '肥城市仪阳村北，济兖路西侧', 'https://oss.etcsd.com/object/5cb54c93549ecdf1d78c0b08', '1', '15805485488', '0', '875', null, null, '2019-09-28 17:35:55', '1', '116.783910', '36.166113', '370000', '山东省', '370900', '泰安市', '370983', '肥城市', '0', '中石油', '', '', '37090000466');
INSERT INTO zsys_oil_station VALUES ('876', '荣乌高速寿光服务区南区', '寿光服务区南区加油站', '荣乌高速寿光服务区南区', '', null, '18653198665', '0', '876', null, null, '2019-09-28 17:35:55', '1', '118.703112', '37.098703', '370000', '山东省', '370700', '潍坊市', '370703', '寒亭区', '1', '其它', 'G18', '荣乌高速', '37010000662');
INSERT INTO zsys_oil_station VALUES ('877', '中国石油天然气股份有限公司山东泰安销售分公司泰安第30加油站', '中国石油泰安第30加油站', '泰安市范镇泰莱高速下路口对侧', 'https://oss.etcsd.com/object/5cb54c93a055fa236fb3282c', '1', '18705481508', '0', '877', null, null, '2019-09-28 17:35:55', '1', '117.399893', '36.208533', '370000', '山东省', '370900', '泰安市', '370902', '泰山区', '0', '中石油', '', '', '37090000478');
INSERT INTO zsys_oil_station VALUES ('878', '中国石油天然气股份有限公司山东泰安销售分公司泰安第40加油站', '中国石油泰安第40加油站', '东平县城龙山大街3号', 'https://oss.etcsd.com/object/5cb54c93549ecdf1d78c0b0a', '1', '15169806470', '0', '878', null, null, '2019-09-28 17:35:55', '1', '116.486702', '35.938104', '370000', '山东省', '370900', '泰安市', '370923', '东平县', '0', '中石油', '', '', '37090000461');
INSERT INTO zsys_oil_station VALUES ('879', '荣乌高速寿光停车区北区', '寿光停车区北区加油站', '荣乌高速寿光停车区北区', '', '2', '18653196700', '0', '879', null, null, '2019-09-28 17:35:56', '1', '118.920552', '37.025484', '370000', '山东省', '370700', '潍坊市', '370783', '寿光市', '1', '中国石化', 'G18', '荣乌高速', '37010000662');
INSERT INTO zsys_oil_station VALUES ('880', '荣乌高速寿光停车区南区', '寿光停车区南区加油站', '荣乌高速寿光停车区南区', '', '2', '18653196700', '0', '880', null, null, '2019-09-28 17:35:56', '1', '118.921607', '37.024274', '370000', '山东省', '370700', '潍坊市', '370783', '寿光市', '1', '中国石化', 'G18', '荣乌高速', '37010000662');
INSERT INTO zsys_oil_station VALUES ('881', '中国石油天然气股份有限公司山东泰安销售分公司泰安第49加油站', '中国石油泰安第49加油站', '泰安市泮河大街中段南侧', 'https://oss.etcsd.com/object/5cb54c93a055fa236fb3282e', '1', '13668683442', '0', '881', null, null, '2019-09-28 17:35:56', '1', '117.138092', '36.161196', '370000', '山东省', '370900', '泰安市', '370902', '泰山区', '0', '中石油', '', '', '37090000464');
INSERT INTO zsys_oil_station VALUES ('882', '中国石油天然气股份有限公司山东泰安销售分公司泰安第52加油站', '中国石油泰安第52加油站', '泰安市岱岳区满庄镇北迎村104国道东侧', 'https://oss.etcsd.com/object/5cb54c93a055fa236fb32830', '1', '13793822771', '0', '882', null, null, '2019-09-28 17:35:56', '1', '117.084390', '36.064823', '370000', '山东省', '370900', '泰安市', '370911', '岱岳区', '0', '中石油', '', '', '37090000472');
INSERT INTO zsys_oil_station VALUES ('883', '中国石油天然气股份有限公司山东泰安销售分公司泰安第53加油站', '中国石油泰安第53加油站', '宁阳县华丰镇华丰收费站西300米', 'https://oss.etcsd.com/object/5cb54c93549ecdf1d78c0b0c', '1', '15094773388', '0', '883', null, null, '2019-09-28 17:35:56', '1', '117.169491', '35.863980', '370000', '山东省', '370900', '泰安市', '370921', '宁阳县', '0', '中石油', '', '', '37090000482');
INSERT INTO zsys_oil_station VALUES ('884', '中国石油天然气股份有限公司山东泰安销售分公司泰安第54加油站', '中国石油泰安第54加油站', '肥城市老城镇济兖路58.5公里处路东', 'https://oss.etcsd.com/object/5cb54c93549ecdf1d78c0b0e', '1', '13668686674', '0', '884', null, null, '2019-09-28 17:35:56', '1', '116.781673', '36.271625', '370000', '山东省', '370900', '泰安市', '370983', '肥城市', '0', '中石油', '', '', '37090000489');
INSERT INTO zsys_oil_station VALUES ('885', '中国石油天然气股份有限公司山东泰安销售分公司泰安第55加油站', '中国石油泰安第55加油站', '肥城市泰西大街93号', 'https://oss.etcsd.com/object/5cb54c93549ecdf1d78c0b10', '1', '18753836577', '0', '885', null, null, '2019-09-28 17:35:56', '1', '116.779157', '36.197213', '370000', '山东省', '370900', '泰安市', '370983', '肥城市', '0', '中石油', '', '', '37090000490');
INSERT INTO zsys_oil_station VALUES ('886', '中国石油天然气股份有限公司山东泰安销售分公司泰安第56加油站', '中国石油泰安第56加油站', '东平县105国道和肥梁路交汇处', 'https://oss.etcsd.com/object/5cb54c93a055fa236fb32832', '1', '15805380035', '0', '886', null, null, '2019-09-28 17:35:56', '1', '116.473673', '36.043856', '370000', '山东省', '370900', '泰安市', '370923', '东平县', '0', '中石油', '', '', '37090000487');
INSERT INTO zsys_oil_station VALUES ('887', '中海油山东销售有限公司第七加油站', '中海油山东销售有限公司第七加油站', '诸城市密州街道217省道南侧北石桥村', '', null, '18005311587', '0', '887', null, null, '2019-09-28 17:35:56', '1', '119.448150', '36.047880', '370000', '山东省', '370700', '潍坊市', '370782', '诸城市', '0', '中海油', '', '', '37070000400');
INSERT INTO zsys_oil_station VALUES ('888', '中国石油天然气股份有限公司山东泰安销售分公司泰安第57加油站', '中国石油泰安第57加油站', '东平县南3公里开发区境内', 'https://oss.etcsd.com/object/5cb54c93a055fa236fb32834', '1', '18660851678', '0', '888', null, null, '2019-09-28 17:35:57', '1', '116.467320', '35.883344', '370000', '山东省', '370900', '泰安市', '370923', '东平县', '0', '中石油', '', '', '37090000488');
INSERT INTO zsys_oil_station VALUES ('889', '中国石油天然气股份有限公司山东泰安销售分公司泰安第58加油站', '中国石油泰安第58加油站', '泰安市大汶口镇104国道大汶口立交桥北50米路东', 'https://oss.etcsd.com/object/5cb54c93549ecdf1d78c0b12', '1', '13505384780', '0', '889', null, null, '2019-09-28 17:35:57', '1', '117.087173', '35.969401', '370000', '山东省', '370900', '泰安市', '370902', '泰山区', '0', '中石油', '', '', '37090000476');
INSERT INTO zsys_oil_station VALUES ('890', '中国石油天然气股份有限公司山东泰安销售分公司泰安第5加油站', '中国石油泰安第5加油站', '新泰市翟梁路与济临路交叉口东南处', 'https://oss.etcsd.com/object/5cb54c93a055fa236fb32836', '1', '15264810886', '0', '890', null, null, '2019-09-28 17:35:57', '1', '117.673937', '35.933542', '370000', '山东省', '370900', '泰安市', '370982', '新泰市', '0', '中石油', '', '', '37090000483');
INSERT INTO zsys_oil_station VALUES ('891', '中国石油天然气股份有限公司山东泰安销售分公司泰安第62加油站', '中国石油泰安第62加油站', '东平县经济开发区105国道536公里处路东', 'https://oss.etcsd.com/object/5cb54c93549ecdf1d78c0b14', '1', '13853870143', '0', '891', null, null, '2019-09-28 17:35:57', '1', '116.460585', '35.953647', '370000', '山东省', '370900', '泰安市', '370923', '东平县', '0', '中石油', '', '', '37090000486');
INSERT INTO zsys_oil_station VALUES ('893', '中国石油天然气股份有限公司山东泰安销售分公司泰安第65加油站', '中国石油泰安第65加油站', '泰安市东岳大街西段博雅公馆西侧', 'https://oss.etcsd.com/object/5cb54c93a055fa236fb32838', '1', '13583833539', '0', '893', null, null, '2019-09-28 17:35:57', '1', '117.052954', '36.206479', '370000', '山东省', '370900', '泰安市', '370902', '泰山区', '0', '中石油', '', '', '37090000465');
INSERT INTO zsys_oil_station VALUES ('894', '山东壳牌石油有限公司潍坊清池街北加油站', '壳牌潍坊清池街北加油站', '潍坊市高新区清池街办梁寨村南侧309国道北侧', '', '3', '18953692121', '0', '894', null, null, '2019-09-28 17:35:57', '1', '119.262600', '36.720982', '370000', '山东省', '370700', '潍坊市', '370703', '寒亭区', '0', '壳牌', '', '', '37070000452');
INSERT INTO zsys_oil_station VALUES ('895', '中国石油天然气股份有限公司山东泰安销售分公司泰安第67加油站', '中国石油泰安第67加油站', '泰安市泰东路泰山青春创业开发区段北侧', 'https://oss.etcsd.com/object/5cb54c93a055fa236fb3283a', '1', '13465380596', '0', '895', null, null, '2019-09-28 17:35:57', '1', '117.036599', '36.158571', '370000', '山东省', '370900', '泰安市', '370902', '泰山区', '0', '中石油', '', '', '37090000473');
INSERT INTO zsys_oil_station VALUES ('896', '中国石油天然气股份有限公司山东泰安销售分公司泰安第68加油站', '中国石油泰安第68加油站', '泰安市环山路东段水牛埠村', 'https://oss.etcsd.com/object/5cb54c93549ecdf1d78c0b16', '1', '15094775219', '0', '896', null, null, '2019-09-28 17:35:57', '1', '117.171546', '36.228205', '370000', '山东省', '370900', '泰安市', '370902', '泰山区', '0', '中石油', '', '', '37090000460');
INSERT INTO zsys_oil_station VALUES ('897', '山东壳牌石油有限公司寿光圣城西街加油站', '壳牌寿光圣城西街加油站', '寿光市马店镇潍高路北', '', '3', '15689852129', '0', '897', null, null, '2019-09-28 17:35:57', '1', '118.675959', '36.912603', '370000', '山东省', '370700', '潍坊市', '370783', '寿光市', '0', '壳牌', '', '', '37070000472');
INSERT INTO zsys_oil_station VALUES ('898', '中国石油天然气股份有限公司山东泰安销售分公司泰安第6加油站', '中国石油泰安第6加油站', '泰安东外环，泰临路南侧', 'https://oss.etcsd.com/object/5cb54c93549ecdf1d78c0b18', '1', '18953809117', '0', '898', null, null, '2019-09-28 17:35:57', '1', '117.186959', '36.172120', '370000', '山东省', '370900', '泰安市', '370902', '泰山区', '0', '中石油', '', '', '37090000467');
INSERT INTO zsys_oil_station VALUES ('899', '中国石油天然气股份有限公司山东泰安销售分公司泰安第71加油站', '中国石油泰安第71加油站', '宁阳县七贤路与华阳大街交汇处西南角', 'https://oss.etcsd.com/object/5cb54c93a055fa236fb3283c', '1', '13562832393', '0', '899', null, null, '2019-09-28 17:35:58', '1', '116.789072', '35.752153', '370000', '山东省', '370900', '泰安市', '370921', '宁阳县', '0', '中石油', '', '', '37090000463');
INSERT INTO zsys_oil_station VALUES ('900', '中国石油天然气股份有限公司山东泰安销售分公司泰安第72加油站', '中国石油泰安第72加油站', '肥城市老城镇老泰临路北', 'https://oss.etcsd.com/object/5cb54c93a055fa236fb3283e', '1', '13583875511', '0', '900', null, null, '2019-09-28 17:35:58', '1', '116.771380', '36.241794', '370000', '山东省', '370900', '泰安市', '370983', '肥城市', '0', '中石油', '', '', '37090000491');
INSERT INTO zsys_oil_station VALUES ('901', '中国石油天然气股份有限公司山东泰安销售分公司泰安第73加油站', '中国石油泰安第73加油站', '泰山区泰佛路小井转盘南路东', 'https://oss.etcsd.com/object/5cb54c94a055fa236fb32840', '1', '18264879189', '0', '901', null, null, '2019-09-28 17:35:58', '1', '117.175911', '36.184468', '370000', '山东省', '370900', '泰安市', '370902', '泰山区', '0', '中石油', '', '', '37090000474');
INSERT INTO zsys_oil_station VALUES ('902', '中国石油天然气股份有限公司山东泰安销售分公司泰安第74加油站', '中国石油泰安第74加油站', '泰安市泰肥路以南，池子崖村以北', 'https://oss.etcsd.com/object/5cb54c94a055fa236fb32842', '1', '18562356555', '0', '902', null, null, '2019-09-28 17:35:58', '1', '116.987898', '36.178946', '370000', '山东省', '370900', '泰安市', '370902', '泰山区', '0', '中石油', '', '', '37090000479');
INSERT INTO zsys_oil_station VALUES ('903', '宿松服务区西区', '宿松西区', '安徽省安庆市宿松县G50沪渝高速靠近安徽十二钗酒业', '', '2', '13665562383', '0', '903', null, null, '2019-09-28 17:35:58', '1', '116.120522', '30.185375', '340000', '安徽省', '340800', '安庆市', '340826', '宿松县', '1', '中国石化', 'G50', '沪渝高速', '34080000002');
INSERT INTO zsys_oil_station VALUES ('904', '中国石油天然气股份有限公司山东临沂销售分公司第二加油站', '临沂2站', '沂南县大庄镇坊前村日兰高速沂南口南800米227省道路西', '', '1', '18669560502', '0', '904', null, null, '2019-09-28 17:35:58', '1', '118.498226', '35.357333', '370000', '山东省', '371300', '临沂市', '371321', '沂南县', '0', '中石油', '', '', '37130000388');
INSERT INTO zsys_oil_station VALUES ('906', '中国石油天然气股份有限公司山东临沂销售分公司第四加油站', '临沂4站', '山东省临沂市兰山区金雀山路与琅琊王路交叉口,天河家园东区附近', '', '1', '18669560504', '0', '906', null, null, '2019-09-28 17:35:58', '1', '118.308704', '35.056789', '370000', '山东省', '371300', '临沂市', '371302', '兰山区', '0', '中石油', '', '', '37130000389');
INSERT INTO zsys_oil_station VALUES ('907', '中国石油天然气股份有限公司山东临沂销售分公司第七加油站', '临沂7站', '临沂市沂水县兖石路22号', '', '1', '18669560507', '0', '907', null, null, '2019-09-28 17:35:58', '1', '118.447357', '35.844471', '370000', '山东省', '371300', '临沂市', '371323', '沂水县', '0', '中石油', '', '', '37130000391');
INSERT INTO zsys_oil_station VALUES ('910', '中国石油天然气股份有限公司山东临沂销售分公司第六十二加油站', '临沂62站', '山东省临沂市临沭县苍山路与327国道交汇处西北角', '', '1', '18669560562', '0', '910', null, null, '2019-09-28 17:35:58', '1', '118.669955', '34.948668', '370000', '山东省', '371300', '临沂市', '371329', '临沭县', '0', '中石油', '', '', '37130000396');
INSERT INTO zsys_oil_station VALUES ('911', '中国石油天然气股份有限公司山东临沂销售分公司第三加油站', '临沂3站', '山东省临沂市郯城县庙山镇', '', '1', '18669560503', '0', '911', null, null, '2019-09-28 17:35:58', '1', '118.370945', '34.752081', '370000', '山东省', '371300', '临沂市', '371322', '郯城县', '0', '中石油', '', '', '37130000398');
INSERT INTO zsys_oil_station VALUES ('912', '中国石油天然气股份有限公司山东临沂销售分公司第十二加油站', '临沂12站', '临沭县郑山镇政府南1公里225省道与临沭县南环路交汇处', '', '1', '18669560512', '0', '912', null, null, '2019-09-28 17:35:58', '1', '118.619598', '34.935832', '370000', '山东省', '371300', '临沂市', '371329', '临沭县', '0', '中石油', '', '', '37130000399');
INSERT INTO zsys_oil_station VALUES ('913', '中国石油天然气股份有限公司山东临沂销售分公司第十四加油站', '临沂14站', '蒙阴县桃虚镇驻地', '', '1', '18669560514', '0', '913', null, null, '2019-09-28 17:35:59', '1', '118.027114', '35.631702', '370000', '山东省', '371300', '临沂市', '371328', '蒙阴县', '0', '中石油', '', '', '37130000401');
INSERT INTO zsys_oil_station VALUES ('914', '中国石油天然气股份有限公司山东临沂销售分公司第十七加油站', '临沂17站', '临沂市罗庄区金九路中段', '', '1', '18669560517', '0', '914', null, null, '2019-09-28 17:35:59', '1', '118.323251', '35.023588', '370000', '山东省', '371300', '临沂市', '371311', '罗庄区', '0', '中石油', '', '', '37130000403');
INSERT INTO zsys_oil_station VALUES ('915', '中国石油天然气股份有限公司山东临沂销售分公司第十八加油站', '临沂18站', '临沂市临西五路南段立交桥南段路西', '', '1', '18669560518', '0', '915', null, null, '2019-09-28 17:35:59', '1', '118.318540', '35.040259', '370000', '山东省', '371300', '临沂市', '371311', '罗庄区', '0', '中石油', '', '', '37130000404');
INSERT INTO zsys_oil_station VALUES ('926', '中国石油天然气股份有限公司烟台龙口第5加油站', '中石油烟台龙口5站', '龙口市石良镇东埠村石良中学南50米', '', '1', '13853562945', '0', '926', null, null, '2019-09-28 17:35:59', '1', '120.665100', '37.579630', '370000', '山东省', '370600', '烟台市', '370681', '龙口市', '0', '中石油', '', '', '37060000438');
INSERT INTO zsys_oil_station VALUES ('927', '中国石油天然气股份有限公司烟台龙口第6加油站', '中石油烟台龙口6站', '龙口市东江镇黄格庄南路西', '', '1', '13854519569', '0', '927', null, null, '2019-09-28 17:35:59', '1', '120.530410', '37.622750', '370000', '山东省', '370600', '烟台市', '370681', '龙口市', '0', '中石油', '', '', '37060000439');
INSERT INTO zsys_oil_station VALUES ('929', '中国石油天然气股份有限公司烟台龙口第8加油站', '中石油烟台龙口8站', '龙口黄山馆镇四村G206路段', '', '1', '13884664496', '0', '929', null, null, '2019-09-28 17:35:59', '1', '120.275740', '37.546590', '370000', '山东省', '370600', '烟台市', '370681', '龙口市', '0', '中石油', '', '', '37060000440');
INSERT INTO zsys_oil_station VALUES ('930', '中国石油天然气股份有限公司烟台龙口第9加油站', '中石油烟台龙口9站', '龙口市东江镇祁家村驻地（火车站南）', '', '1', '13573524500', '0', '930', null, null, '2019-09-28 17:36:00', '1', '120.518050', '37.614900', '370000', '山东省', '370600', '烟台市', '370681', '龙口市', '0', '中石油', '', '', '37060000441');
INSERT INTO zsys_oil_station VALUES ('931', '中国石油天然气股份有限公司烟台龙口第10加油站', '中石油烟台龙口10站', '龙口市新嘉镇烟潍路南', '', '1', '13806456487', '0', '931', null, null, '2019-09-28 17:36:00', '1', '120.478070', '37.654430', '370000', '山东省', '370600', '烟台市', '370681', '龙口市', '0', '中石油', '', '', '37060000442');
INSERT INTO zsys_oil_station VALUES ('932', '中国石油天然气股份有限公司烟台龙口第11加油站', '中石油烟台龙口11站', '龙口市诸由观镇羊岚村南中石油加油站', '', '1', '13675350896', '0', '932', null, null, '2019-09-28 17:36:00', '1', '120.530120', '37.686860', '370000', '山东省', '370600', '烟台市', '370681', '龙口市', '0', '中石油', '', '', '37060000443');
INSERT INTO zsys_oil_station VALUES ('934', '中国石油天然气股份有限公司烟台龙口第12加油站', '中石油烟台龙口12站', '龙口新嘉街道解家村北中石油加油站', '', '1', '15954549198', '0', '934', null, null, '2019-09-28 17:36:00', '1', '120.424320', '37.656470', '370000', '山东省', '370600', '烟台市', '370681', '龙口市', '0', '中石油', '', '', '37060000444');
INSERT INTO zsys_oil_station VALUES ('936', '中国石油天然气股份有限公司烟台龙口第13加油站', '中石油烟台龙口13站', '龙口环海路29号', '', '1', '13963830116', '0', '936', null, null, '2019-09-28 17:36:00', '1', '120.329790', '37.645410', '370000', '山东省', '370600', '烟台市', '370681', '龙口市', '0', '中石油', '', '', '37060000387');
INSERT INTO zsys_oil_station VALUES ('938', '中国石油天然气股份有限公司烟台龙口第16加油站', '中石油烟台龙口16站', '龙口市兰高镇大堡村中石油加油站', '', '1', '13793512085', '0', '938', null, null, '2019-09-28 17:36:01', '1', '120.569340', '37.678370', '370000', '山东省', '370600', '烟台市', '370681', '龙口市', '0', '中石油', '', '', '37060000445');
INSERT INTO zsys_oil_station VALUES ('943', '中国石油天然气股份有限公司烟台龙口第18加油站', '中石油烟台龙口18站', '龙口市石良镇台上村中石油加油站', '', '1', '13853538421', '0', '943', null, null, '2019-09-28 17:36:01', '1', '120.664660', '37.504680', '370000', '山东省', '370600', '烟台市', '370681', '龙口市', '0', '中石油', '', '', '37060000446');
INSERT INTO zsys_oil_station VALUES ('944', '中国石油天然气股份有限公司烟台龙口第19加油站', '中石油烟台龙口19站', '龙口市外向型工业加工区土城子村东', '', '1', '13708906113', '0', '944', null, null, '2019-09-28 17:36:01', '1', '120.335260', '37.614050', '370000', '山东省', '370600', '烟台市', '370681', '龙口市', '0', '中石油', '', '', '37060000447');
INSERT INTO zsys_oil_station VALUES ('945', '中国石油天然气股份有限公司烟台龙口第20加油站', '中石油烟台龙口20站', '龙口市北马镇牛栏徐家村西', '', '1', '13791190840', '0', '945', null, null, '2019-09-28 17:36:01', '1', '120.349000', '37.543120', '370000', '山东省', '370600', '烟台市', '370681', '龙口市', '0', '中石油', '', '', '37060000448');
INSERT INTO zsys_oil_station VALUES ('946', '中国石油天然气股份有限公司烟台龙口第21加油站', '中石油烟台龙口21站', '龙口市新嘉街道张镇村南', '', '1', '15966526671', '0', '946', null, null, '2019-09-28 17:36:02', '1', '120.453870', '37.646800', '370000', '山东省', '370600', '烟台市', '370681', '龙口市', '0', '中石油', '', '', '37060000449');
INSERT INTO zsys_oil_station VALUES ('947', '中国石油天然气股份有限公司烟台龙口第26加油站', '中石油烟台龙口26站', '龙口市龙泉路与文莱街交汇处', '', '1', '13793598005', '0', '947', null, null, '2019-09-28 17:36:02', '1', '120.539984', '37.639482', '370000', '山东省', '370600', '烟台市', '370681', '龙口市', '0', '中石油', '', '', '37060000450');
INSERT INTO zsys_oil_station VALUES ('948', '中国石油天然气股份有限公司烟台龙口第28加油站', '中石油烟台龙口28站', '龙口市东莱街道龙泉路251号', '', '1', '13854560365', '0', '948', null, null, '2019-09-28 17:36:02', '1', '120.539942', '37.639506', '370000', '山东省', '370600', '烟台市', '370681', '龙口市', '0', '中石油', '', '', '37060000451');
INSERT INTO zsys_oil_station VALUES ('949', '中国石油天然气股份有限公司烟台海阳第1加油站', '中石油烟台海阳1站', '海阳市徐家店镇紫石夼村烟青一级路南', '', '1', '15165765762', '0', '949', null, null, '2019-09-28 17:36:02', '1', '120.986829', '37.078062', '370000', '山东省', '370600', '烟台市', '370687', '海阳市', '0', '中石油', '', '', '37060000460');
INSERT INTO zsys_oil_station VALUES ('950', '中国石油天然气股份有限公司烟台海阳第2加油站', '中石油烟台海阳2站', '海阳市海阳路258号中国石油加油站', '', '1', '15953529581', '0', '950', null, null, '2019-09-28 17:36:03', '1', '121.215573', '36.789720', '370000', '山东省', '370600', '烟台市', '370687', '海阳市', '0', '中石油', '', '', '37060000390');
INSERT INTO zsys_oil_station VALUES ('951', '中国石油天然气股份有限公司烟台海阳第3加油站', '中石油烟台海阳3站', '海阳市海阳路西首（自来水公司东，宏峰热力对面）', '', '1', '13675448977', '0', '951', null, null, '2019-09-28 17:36:03', '1', '121.153897', '36.780713', '370000', '山东省', '370600', '烟台市', '370687', '海阳市', '0', '中石油', '', '', '37060000461');
INSERT INTO zsys_oil_station VALUES ('952', '中国石油天然气股份有限公司烟台海阳第7加油站', '中石油烟台海阳7站', '海阳市海滨路辛安镇吕家村北中石油加油站', '', '1', '13589821684', '0', '952', null, null, '2019-09-28 17:36:03', '1', '121.029536', '36.611743', '370000', '山东省', '370600', '烟台市', '370687', '海阳市', '0', '中石油', '', '', '37060000462');
INSERT INTO zsys_oil_station VALUES ('953', '中国石油天然气股份有限公司烟台海阳第8加油站', '中石油烟台海阳8站', '海阳市经济开发区台子村南，北京路西，海翔路北', '', '1', '13697601111', '0', '953', null, null, '2019-09-28 17:36:03', '1', '121.171858', '36.716449', '370000', '山东省', '370600', '烟台市', '370687', '海阳市', '0', '中石油', '', '', '37060000463');
INSERT INTO zsys_oil_station VALUES ('954', '中国石油天然气股份有限公司烟台海阳第12加油站', '中石油烟台海阳12站', '海阳市朱吴镇政府门前', '', '1', '18205457485', '0', '954', null, null, '2019-09-28 17:36:03', '1', '121.111450', '36.904974', '370000', '山东省', '370600', '烟台市', '370687', '海阳市', '0', '中石油', '', '', '37060000464');
INSERT INTO zsys_oil_station VALUES ('955', '中国石油天然气股份有限公司烟台海阳龙庄加油站', '中石油烟台海阳龙庄站', '海阳市龙山街道海滨西路北、庄上村', '', '1', '13791227680', '0', '955', null, null, '2019-09-28 17:36:04', '1', '121.116510', '36.650210', '370000', '山东省', '370600', '烟台市', '370687', '海阳市', '0', '中石油', '', '', '37060000418');
INSERT INTO zsys_oil_station VALUES ('956', '中国石油天然气股份有限公司烟台蓬莱第1加油站', '中石油烟台蓬莱1站', '蓬莱于庄镇岳家圈村头对面', '', '1', '13002734060', '0', '956', null, null, '2019-09-28 17:36:04', '1', '120.731165', '37.631180', '370000', '山东省', '370600', '烟台市', '370684', '蓬莱市', '0', '中石油', '', '', '37060000465');
INSERT INTO zsys_oil_station VALUES ('957', '中国石油天然气股份有限公司烟台蓬莱第2加油站', '中石油烟台蓬莱2站', '蓬莱遇驾夼村西乐达果蔬冷库南', '', '1', '15953545443', '0', '957', null, null, '2019-09-28 17:36:04', '1', '120.911436', '37.564463', '370000', '山东省', '370600', '烟台市', '370684', '蓬莱市', '0', '中石油', '', '', '37060000466');
INSERT INTO zsys_oil_station VALUES ('958', '中国石油天然气股份有限公司烟台蓬莱第3加油站', '中石油烟台蓬莱3站', '蓬莱市南王工业园蓬寨路北端', '', '1', '13406599962', '0', '958', null, null, '2019-09-28 17:36:04', '1', '120.833205', '37.770235', '370000', '山东省', '370600', '烟台市', '370684', '蓬莱市', '0', '中石油', '', '', '37060000467');
INSERT INTO zsys_oil_station VALUES ('959', '中国石油天然气股份有限公司烟台蓬莱第4加油站', '中石油烟台蓬莱4站', '蓬莱市富民路126号', '', '1', '13465536590', '0', '959', null, null, '2019-09-28 17:36:05', '1', '120.774872', '37.804855', '370000', '山东省', '370600', '烟台市', '370684', '蓬莱市', '0', '中石油', '', '', '37060000468');
INSERT INTO zsys_oil_station VALUES ('960', '中国石油天然气股份有限公司烟台蓬莱第5加油站', '中石油烟台蓬莱5站', '蓬莱市南关路152号', '', '1', '13793503977', '0', '960', null, null, '2019-09-28 17:36:05', '1', '120.780660', '37.808336', '370000', '山东省', '370600', '烟台市', '370684', '蓬莱市', '0', '中石油', '', '', '37060000391');
INSERT INTO zsys_oil_station VALUES ('961', '中国石油天然气股份有限公司烟台蓬莱第6加油站', '中石油烟台蓬莱6站', '蓬莱211省道与302省道交叉口东南100米', '', '1', '13723971757', '0', '961', null, null, '2019-09-28 17:36:05', '1', '120.872961', '37.627954', '370000', '山东省', '370600', '烟台市', '370684', '蓬莱市', '0', '中石油', '', '', '37060000469');
INSERT INTO zsys_oil_station VALUES ('962', '中国石油天然气股份有限公司烟台蓬莱第7加油站', '中石油烟台蓬莱7站', '蓬莱市刘家沟镇安香于家路北', '', '1', '13697852509', '0', '962', null, null, '2019-09-28 17:36:05', '1', '120.886171', '37.783645', '370000', '山东省', '370600', '烟台市', '370684', '蓬莱市', '0', '中石油', '', '', '37060000470');
INSERT INTO zsys_oil_station VALUES ('963', '中国石油天然气股份有限公司烟台蓬莱第8加油站', '中石油烟台蓬莱8站', '蓬莱市经济开发区上海路西、矫格庄村北', '', '1', '13792570650', '0', '963', null, null, '2019-09-28 17:36:06', '1', '120.841863', '37.809044', '370000', '山东省', '370600', '烟台市', '370684', '蓬莱市', '0', '中石油', '', '', '37060000471');
INSERT INTO zsys_oil_station VALUES ('964', '中国石油天然气股份有限公司烟台栖霞第2加油站', '中石油烟台栖霞2站', '栖霞市恒山路附近', '', '1', '15065766785', '0', '964', null, null, '2019-09-28 17:36:06', '1', '120.872813', '37.403974', '370000', '山东省', '370600', '烟台市', '370686', '栖霞市', '0', '中石油', '', '', '37060000473');
INSERT INTO zsys_oil_station VALUES ('965', '中国石油天然气股份有限公司烟台栖霞第3加油站', '中石油烟台栖霞3站', '栖霞市西城镇十里堡加油站', '', '1', '13964584730', '0', '965', null, null, '2019-09-28 17:36:06', '1', '120.778850', '37.322567', '370000', '山东省', '370600', '烟台市', '370686', '栖霞市', '0', '中石油', '', '', '37060000474');
INSERT INTO zsys_oil_station VALUES ('966', '中国石油天然气股份有限公司烟台栖霞第4加油站', '中石油烟台栖霞4站', '栖霞市臧家庄高速路口加油站', '', '1', '15684144473', '0', '966', null, null, '2019-09-28 17:36:06', '1', '121.000522', '37.480908', '370000', '山东省', '370600', '烟台市', '370686', '栖霞市', '0', '中石油', '', '', '37060000475');
INSERT INTO zsys_oil_station VALUES ('967', '中国石油天然气股份有限公司烟台栖霞第18加油站', '中石油烟台栖霞18站', '栖霞市南七里庄加油站', '', '1', '13791259417', '0', '967', null, null, '2019-09-28 17:36:07', '1', '120.813423', '37.277943', '370000', '山东省', '370600', '烟台市', '370686', '栖霞市', '0', '中石油', '', '', '37060000476');
INSERT INTO zsys_oil_station VALUES ('968', '中国石油天然气股份有限公司烟台栖霞第20加油站', '中石油烟台栖霞20站', '栖霞市204国道与香港路交口东北300米', '', '1', '13645352235', '0', '968', null, null, '2019-09-28 17:36:07', '1', '121.201890', '37.239279', '370000', '山东省', '370600', '烟台市', '370686', '栖霞市', '0', '中石油', '', '', '37060000477');
INSERT INTO zsys_oil_station VALUES ('973', '赤沙加油站（延长壳牌（广东）石油有限公司）', '赤沙加油站', '广州市海珠区官洲街赤沙村赤沙路180号', 'https://oss.etcsd.com/object/5cb54cbe549ecdf1d78c0b8e', '3', '0755-83591583', '0', '973', null, null, '2019-09-29 08:11:44', '1', '113.351901', '23.091731', '440000', '广东省', '440100', '广州市', '440105', '海珠区', '0', '壳牌', '', '', '44010000002');
INSERT INTO zsys_oil_station VALUES ('974', '南盛加油站（延长壳牌（广东）石油有限公司）', '南盛加油站', '广州市萝岗区开创大道706号', 'https://oss.etcsd.com/object/5cb54cbea055fa236fb328a0', '3', '0755-83591583', '0', '974', null, null, '2019-09-29 08:11:44', '1', '113.533960', '23.133250', '440000', '广东省', '440100', '广州市', '440112', '黄埔区', '0', '壳牌', '', '', '44010000003');
INSERT INTO zsys_oil_station VALUES ('975', '佛冈加油站（延长壳牌（广东）石油有限公司）', '佛冈加油站', '广东省清远市佛冈县石角镇振兴南路京珠高速出入口', 'https://oss.etcsd.com/object/5cb54cbea055fa236fb328a2', '3', '0755-83591583', '0', '975', null, null, '2019-09-29 08:11:44', '1', '113.534870', '23.855910', '440000', '广东省', '441800', '清远市', '441821', '佛冈县', '0', '壳牌', '', '', '44180000001');
INSERT INTO zsys_oil_station VALUES ('976', '沙涌加油站（延长壳牌（广东）石油有限公司）', '沙涌加油站', '佛山市南海区广佛高速公路沙涌服务区', 'https://oss.etcsd.com/object/5cb54cbe549ecdf1d78c0b90', '3', '0755-83591583', '0', '976', null, null, '2019-09-29 08:11:44', '1', '113.163200', '23.137770', '440000', '广东省', '440600', '佛山市', '440605', '南海区', '1', '壳牌', '', '', '44060000002');
INSERT INTO zsys_oil_station VALUES ('977', '顺景加油站（延长壳牌（广东）石油有限公司）', '顺景加油站', '佛山市广佛高速公路沙贝入口侧', 'https://oss.etcsd.com/object/5cb54cbf549ecdf1d78c0b92', '3', '23.1378990000', '0', '977', null, null, '2019-09-29 08:11:44', '1', '113.102943', '23.137899', '440000', '广东省', '440600', '佛山市', '440605', '南海区', '0', '壳牌', '', '', '44060000001');
INSERT INTO zsys_oil_station VALUES ('978', '沙溪东加油站（延长壳牌（广东）石油有限公司）', '沙溪东加油站', '中山市珠三角环线沙溪服务区东侧', 'https://oss.etcsd.com/object/5cb54cbf549ecdf1d78c0b94', '3', '0755-83591583', '0', '978', null, null, '2019-09-29 08:11:44', '1', '113.288696', '22.532560', '440000', '广东省', '440100', '广州市', '440101', '市辖区', '1', '壳牌', '', '', '44200000001');
INSERT INTO zsys_oil_station VALUES ('979', '沙溪西加油站（延长壳牌（广东）石油有限公司）', '沙溪西加油站', '中山市珠三角环线高速沙溪服务区西侧', 'https://oss.etcsd.com/object/5cb54cbfa055fa236fb328a4', '3', '0755-83591583', '0', '979', null, null, '2019-09-29 08:11:44', '1', '113.286713', '22.533239', '440000', '广东省', '440100', '广州市', '440101', '市辖区', '1', '壳牌', '', '', '44200000002');
INSERT INTO zsys_oil_station VALUES ('980', '焦岗湖服务区南区', '焦岗湖南区', '安徽省淮南市凤台县S12滁新高速焦岗湖服务区', '', '2', '18110221512', '0', '980', null, null, '2019-09-29 08:11:44', '1', '116.668057', '32.627191', '340000', '安徽省', '340400', '淮南市', '340421', '凤台县', '1', '中国石化', '', '', '34040000005');
INSERT INTO zsys_oil_station VALUES ('981', '中国石油天然气股份有限公司山东淄博销售分公司第8加油站', '中石油淄博8站', '新玛特西100米', '', '1', '13573300148', '0', '981', null, null, '2019-09-29 08:11:44', '1', '118.025350', '36.837800', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '中石油', '', '', '37030000241');
INSERT INTO zsys_oil_station VALUES ('982', '中国石油天然气股份有限公司山东淄博销售分公司第7加油站', '中石油淄博7站', '路山镇大张村东', '', '1', '18865336229', '0', '982', null, null, '2019-09-29 08:11:45', '1', '118.225430', '36.821750', '370000', '山东省', '370300', '淄博市', '370305', '临淄区', '0', '中石油', '', '', '37030000240');
INSERT INTO zsys_oil_station VALUES ('983', '中国石油天然气股份有限公司山东淄博销售分公司第6加油站', '中石油淄博6站', '与裕民路往北600米', '', '1', '15966956065', '0', '983', null, null, '2019-09-29 08:11:45', '1', '118.069580', '36.879570', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '中石油', '', '', '37030000239');
INSERT INTO zsys_oil_station VALUES ('984', '中石油德州第4加油站', '中石油德州第4加油站', '德州市天衢东路路北', '', '1', '13625348917', '0', '984', null, null, '2019-09-29 08:11:45', '1', '116.349406', '37.460092', '370000', '山东省', '371400', '德州市', '371402', '德城区', '0', '中石油', '', '', '37150000418');
INSERT INTO zsys_oil_station VALUES ('985', '中石油德州第31站', '中石油德州第31站', '晶华路丁字路口东南侧', '', '1', '15910077222', '0', '985', null, null, '2019-09-29 08:11:45', '1', '116.386104', '37.470846', '370000', '山东省', '371400', '德州市', '371402', '德城区', '0', '中石油', '', '', '371400003630003');
INSERT INTO zsys_oil_station VALUES ('986', '中石油德州第26加油站', '中石油德州第26加油站', '天衢西路化肥厂对面', '', '1', '13326278333', '0', '986', null, null, '2019-09-29 08:11:45', '1', '116.246510', '37.472470', '370000', '山东省', '371400', '德州市', '371402', '德城区', '0', '中石油', '', '', '37140000347');
INSERT INTO zsys_oil_station VALUES ('987', '中石油德州第18加油站', '中石油德州第18加油站', '天衢东路中国银行东临路北', '', '1', '13853452721', '0', '987', null, null, '2019-09-29 08:11:46', '1', '116.319825', '37.464596', '370000', '山东省', '371400', '德州市', '371402', '德城区', '0', '中石油', '', '', '37140000348');
INSERT INTO zsys_oil_station VALUES ('988', '中石油德州第67加油站', '中石油德州第67加油站', '夏津县双庙镇范楼村，308国道北侧', '', '1', '13583422965', '0', '988', null, null, '2019-09-29 08:11:46', '1', '115.950683', '36.972296', '370000', '山东省', '371400', '德州市', '371427', '夏津县', '0', '中石油', '', '', '37140000346');
INSERT INTO zsys_oil_station VALUES ('989', '中国石油天然气股份有限公司山东淄博销售分公司第5加油站', '中石油淄博5站', '耿桥路口北', '', '1', '13589591535', '0', '989', null, null, '2019-09-29 08:11:46', '1', '118.125710', '36.983550', '370000', '山东省', '370300', '淄博市', '370321', '桓台县', '0', '中石油', '', '', '37030000238');
INSERT INTO zsys_oil_station VALUES ('990', '中国石油天然气股份有限公司山东淄博销售分公司第5加油站', '中石油淄博5站', '耿桥路口北', '', '1', '13589591535', '0', '990', null, null, '2019-09-29 08:11:46', '1', '118.125710', '36.983550', '370000', '山东省', '370300', '淄博市', '370321', '桓台县', '0', '中石油', '', '', '37030000238');
INSERT INTO zsys_oil_station VALUES ('991', '中国石油天然气股份有限公司山东淄博销售分公司第4加油站', '中石油淄博4站', '姜坊', '', '1', '13806488397', '0', '991', null, null, '2019-09-29 08:11:46', '1', '118.093850', '36.921590', '370000', '山东省', '370300', '淄博市', '370321', '桓台县', '0', '中石油', '', '', '37030000237');
INSERT INTO zsys_oil_station VALUES ('992', '中国石油天然气股份有限公司山东淄博销售分公司第3加油站', '中石油淄博3站', '原山大道与新村路东300米', '', '1', '18006432220', '0', '992', null, null, '2019-09-29 08:11:46', '1', '117.970170', '36.808820', '370000', '山东省', '370300', '淄博市', '370306', '周村区', '0', '中石油', '', '', '37030000236');
INSERT INTO zsys_oil_station VALUES ('993', '中国石油天然气股份有限公司山东淄博销售分公司临淄溡源路站', '中石油淄博溡源路站', '与大武路往北300米', '', '1', '15953347332', '0', '993', null, null, '2019-09-29 08:11:47', '1', '118.252390', '36.801910', '370000', '山东省', '370300', '淄博市', '370305', '临淄区', '0', '中石油', '', '', '37030000276');
INSERT INTO zsys_oil_station VALUES ('994', '中国石油天然气股份有限公司山东淄博销售分公司淄川寨里站', '中石油淄博寨里站', '北邹家村西', '', '1', '18265880699', '0', '994', null, null, '2019-09-29 08:11:47', '1', '118.047390', '36.649280', '370000', '山东省', '370300', '淄博市', '370302', '淄川区', '0', '中石油', '', '', '37030000274');
INSERT INTO zsys_oil_station VALUES ('995', '中国石油天然气股份有限公司山东淄博销售分公司周村周隆路站', '中石油淄博周村周隆路站', '周村区周隆路235号', '', '1', '13561664379', '0', '995', null, null, '2019-09-29 08:11:47', '1', '118.877680', '36.786820', '370000', '山东省', '370300', '淄博市', '370306', '周村区', '0', '中石油', '', '', '37030000303');
INSERT INTO zsys_oil_station VALUES ('996', '中国石油天然气股份有限公司山东淄博销售分公司第18加油站', '中石油淄博18站', '东外环与南外环交界处', '', '1', '18560728887', '0', '996', null, null, '2019-09-29 08:11:47', '1', '118.118920', '36.942130', '370000', '山东省', '370300', '淄博市', '370321', '桓台县', '0', '中石油', '', '', '37030000302');
INSERT INTO zsys_oil_station VALUES ('997', '山东路油淄博加油站', '山东路油淄博加油站', '与鲁泰大道往北200米路东', '', '2', '15866276611', '0', '997', null, null, '2019-09-29 08:11:48', '1', '118.073200', '36.845350', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '中国石化', '', '', '37010000662');
INSERT INTO zsys_oil_station VALUES ('998', '山东高速服务区管理有限公司青银路淄博分公司北区', '济青淄博服务区北加油站', '济青高速淄博服务区北区', '', '2', '13864306849', '0', '998', null, null, '2019-09-29 08:11:48', '1', '118.070240', '36.863150', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '1', '中国石化', 'G20', '青银高速', '37030000156');
INSERT INTO zsys_oil_station VALUES ('999', '山东高速服务区管理有限公司青银路淄博分公司南区', '济青淄博服务区南加油站', '济青高速淄博服务区南区', '', '2', '13864306849', '0', '999', null, null, '2019-09-29 08:11:48', '1', '118.069660', '36.861020', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '1', '中国石化', 'G20', '青银高速', '37030000156');
INSERT INTO zsys_oil_station VALUES ('1000', '高青服务区东区', '滨莱高青服务区东加油站', '滨莱高速高青服务区东区', '', '2', '13953369665', '0', '1000', null, null, '2019-09-29 08:11:48', '1', '117.973710', '37.120850', '370000', '山东省', '370300', '淄博市', '370322', '高青县', '1', '中国石化', '', '', '37010000662');
INSERT INTO zsys_oil_station VALUES ('1001', '高青服务区西区', '滨莱高青服务区西加油站', '高青服务区西区', '', '2', '13953369665', '0', '1001', null, null, '2019-09-29 08:11:49', '1', '117.972650', '37.119350', '370000', '山东省', '370300', '淄博市', '370322', '高青县', '1', '中国石化', '', '', '37010000662');
INSERT INTO zsys_oil_station VALUES ('1002', '周村服务区东区', '滨莱周村服务区东加油站', '周村服务区东区', '', '2', '13853391807', '0', '1002', null, null, '2019-09-29 08:11:49', '1', '117.921790', '36.718830', '370000', '山东省', '370300', '淄博市', '370306', '周村区', '1', '中国石化', '', '', '37010000662');
INSERT INTO zsys_oil_station VALUES ('1003', '周村服务区西区', '滨莱周村服务区西加油站', '滨莱周村服务区西区', '', '2', '13853391807', '0', '1003', null, null, '2019-09-29 08:11:49', '1', '117.919990', '36.718790', '370000', '山东省', '370300', '淄博市', '370306', '周村区', '1', '中国石化', '', '', '37010000662');
INSERT INTO zsys_oil_station VALUES ('1004', '山东壳牌石油有限公司济南二环东路加油站 ', '壳牌济南二环东路加油站 ', '济南市历城区东二环路中段2183号', 'https://oss.etcsd.com/object/5cb54cc1a055fa236fb328a6', '3', '88169279', '0', '1004', null, null, '2019-09-29 08:11:50', '1', '117.077345', '36.693831', '370000', '山东省', '370100', '济南市', '370112', '历城区', '0', '壳牌', '', '', '37010001131');
INSERT INTO zsys_oil_station VALUES ('1005', '山东壳牌石油有限公司长清明发路加油站', '壳牌长清明发路加油站', '长清区济微路（104国道）13公里西（与明发路交接口西北角）', 'https://oss.etcsd.com/object/5cb54cc2a055fa236fb328af', '3', '87415686', '0', '1005', null, null, '2019-09-29 08:11:50', '1', '116.873670', '36.572046', '370000', '山东省', '370100', '济南市', '370113', '长清区', '0', '壳牌', '', '', '37010001130');
INSERT INTO zsys_oil_station VALUES ('1008', '山东壳牌石油有限公司济南经十东路加油站', '壳牌济南经十东路加油站', '山东省济南市章丘区山东财经大学圣井校区东400路南', 'https://oss.etcsd.com/object/5cb54cc2549ecdf1d78c0b96', '3', '83389339 ', '0', '1008', null, null, '2019-09-29 08:11:50', '1', '117.384685', '36.679503', '370000', '山东省', '370100', '济南市', '370181', '章丘市', '0', '壳牌', '', '', '37010001125');
INSERT INTO zsys_oil_station VALUES ('1009', '山东壳牌石油有限公司济南三龙路加油站', '壳牌济南三龙路加油站', '济南市历城区彩石镇旅游路与三龙路交叉口东北角', 'https://oss.etcsd.com/object/5cb54cc2a055fa236fb328b7', '3', '13375318335 ', '0', '1009', null, null, '2019-09-29 08:11:50', '1', '117.265502', '36.645298', '370000', '山东省', '370100', '济南市', '370112', '历城区', '0', '壳牌', '', '', '37010001129');
INSERT INTO zsys_oil_station VALUES ('1010', '山东壳牌石油有限公司济阳县华阳路加油站', '壳牌济阳县华阳路加油站', '济南市济阳县城华阳路49号（工商局家属院北临）', '', '3', '84226559 ', '0', '1010', null, null, '2019-09-29 08:11:51', '1', '117.193523', '36.979815', '370000', '山东省', '370100', '济南市', '370125', '济阳县', '0', '壳牌', '', '', '37010001127');
INSERT INTO zsys_oil_station VALUES ('1011', '山东壳牌石油有限公司商河县商中路加油站', '壳牌商河县商中路加油站', '商河县商中路北首路西', 'https://oss.etcsd.com/object/5cb54cc2549ecdf1d78c0b98', '3', '55545550', '0', '1011', null, null, '2019-09-29 08:11:51', '1', '117.158670', '37.334033', '370000', '山东省', '370100', '济南市', '370126', '商河县', '0', '壳牌', '', '', '37010001123');
INSERT INTO zsys_oil_station VALUES ('1012', '山东壳牌石油有限公司章丘市秀江路加油站', '壳牌章丘市秀江路加油站', '章丘市明刁路李家亭西', 'https://oss.etcsd.com/object/5cb54cc2549ecdf1d78c0b9a', '3', '83836126', '0', '1012', null, null, '2019-09-29 08:17:40', '1', '117.538797', '36.778610', '370000', '山东省', '370100', '济南市', '370181', '章丘市', '0', '壳牌', '', '', '37010001126');
INSERT INTO zsys_oil_station VALUES ('1013', '山东壳牌石油有限公司章丘绣江路绣惠加油站', '壳牌章丘绣江路绣惠加油站', '济南章丘市明刁公路（244国道）与大桥路路口西南角', 'https://oss.etcsd.com/object/5cb54cc4a055fa236fb328b9', '3', '83363590', '0', '1013', null, null, '2019-09-29 08:17:40', '1', '117.527964', '36.813396', '370000', '山东省', '370100', '济南市', '370181', '章丘市', '0', '壳牌', '', '', '37010001124');
INSERT INTO zsys_oil_station VALUES ('1014', '长深高速G18无棣服务区西区加油站', '无棣服务区西区中国石化加油站', '长深高速无棣服务区西区', '', '2', '13854399929', '0', '1014', null, null, '2019-09-29 08:17:40', '1', '117.789141', '37.779673', '370000', '山东省', '371600', '滨州市', '371623', '无棣县', '1', '中国石化', 'G25', '长深高速', '37010000662');
INSERT INTO zsys_oil_station VALUES ('1015', '长深高速G25滨州服务区东区加油站', '滨州服务区东区中国石化加油站', '长深高速滨州服务东区', '', '2', '18653190518', '0', '1015', null, null, '2019-09-29 08:17:41', '1', '117.917078', '37.528915', '370000', '山东省', '371600', '滨州市', '371602', '滨城区', '1', '中国石化', 'G25', '长深高速', '37010000662');
INSERT INTO zsys_oil_station VALUES ('1016', '长深高速G25滨州服务区西区加油站', '滨州服务区西区中国石化加油站', '山东路油油气管理有限公司无棣停车区西区', '', '2', '18653190518', '0', '1016', null, null, '2019-09-29 08:17:41', '1', '117.914341', '37.532226', '370000', '山东省', '371600', '滨州市', '371602', '滨城区', '1', '中国石化', 'G25', '长深高速', '37010000662');
INSERT INTO zsys_oil_station VALUES ('1017', '山东壳牌石油有限公司李沧书院路加油站', '山东壳牌石油有限公司李沧书院路加油站', '青岛市李村街道书院路136号', '', '3', '15650186163', '0', '1017', null, null, '2019-09-29 08:17:41', '1', '120.423392', '36.276718', '370000', '山东省', '370200', '青岛市', '370213', '李沧区', '0', '壳牌', '', '', '37010001136');
INSERT INTO zsys_oil_station VALUES ('1018', '山东壳牌石油有限公司青岛城阳双元路加油站', '山东壳牌石油有限公司青岛城阳双元路加油站', '青岛市城阳区双元路57号', '', '3', '13969871531', '0', '1018', null, null, '2019-09-29 08:17:41', '1', '120.365853', '36.276718', '370000', '山东省', '370200', '青岛市', '370214', '城阳区', '0', '壳牌', '', '', '37010001135');
INSERT INTO zsys_oil_station VALUES ('1019', '山东壳牌石油有限公司青岛大西庄加油站', '山东壳牌石油有限公司青岛大西庄加油站', '青岛市胶州市九龙办事处大西庄村', '', '3', '18954254488', '0', '1019', null, null, '2019-09-29 08:17:42', '1', '120.091870', '36.310835', '370000', '山东省', '370200', '青岛市', '370281', '胶州市', '0', '壳牌', '', '', '37010001134');
INSERT INTO zsys_oil_station VALUES ('1020', '山东壳牌石油有限公司青岛东海西路加油站', '山东壳牌石油有限公司青岛东海西路加油站', '青岛市市南区东海西路50号（海信广场附近）', '', '3', '15033596626', '0', '1020', null, null, '2019-09-29 08:17:42', '1', '120.403546', '36.066701', '370000', '山东省', '370200', '青岛市', '370202', '市南区', '0', '壳牌', '', '', '37010001132');
INSERT INTO zsys_oil_station VALUES ('1021', '山东壳牌石油有限公司青岛黄岛淮河西路加油站', '山东壳牌石油有限公司青岛黄岛淮河西路加油站', '青岛市黄岛区淮河东路557号（福盈装饰城对面）', '', '3', '18766278230', '0', '1021', null, null, '2019-09-29 08:17:42', '1', '120.147922', '36.033491', '370000', '山东省', '370200', '青岛市', '370211', '黄岛区', '0', '壳牌', '', '', '37010001137');
INSERT INTO zsys_oil_station VALUES ('1022', '山东壳牌石油有限公司青岛市胶州市胶东加油站', '山东壳牌石油有限公司青岛市胶州市胶东加油站', '青岛市胶州市胶东街道小麻湾东村', '', '3', '17685851190', '0', '1022', null, null, '2019-09-29 08:17:42', '1', '120.121680', '36.322015', '370000', '山东省', '370200', '青岛市', '370281', '胶州市', '0', '壳牌', '', '', '37010001133');
INSERT INTO zsys_oil_station VALUES ('1023', '山东壳牌石油有限公司青岛市中车大道加油站', '山东壳牌石油有限公司青岛市中车大道加油站', '青岛市城阳区204国道小胡埠社区万福源工贸区', '', '3', '13295428156', '0', '1023', null, null, '2019-09-29 08:17:43', '1', '120.247760', '36.345099', '370000', '山东省', '370200', '青岛市', '370214', '城阳区', '0', '壳牌', '', '', '37010001138');
INSERT INTO zsys_oil_station VALUES ('1024', '中石油滨大高速古城加油站', '滨大高速古城加油站', '沾化区下洼镇永馆路与滨大高速古城口交汇处以南', '', '1', '18663072765', '0', '1024', null, null, '2019-09-29 08:17:43', '1', '117.844613', '37.703685', '370000', '山东省', '371600', '滨州市', '371603', '沾化区', '0', '中石油', '', '', '37160000436');
INSERT INTO zsys_oil_station VALUES ('1025', '山东壳牌石油有限公司滨州北环加油站', '滨州北环壳牌加油站', '滨州市渤海十八路与北外环（G220）交口西50米路北', '', '3', '13581151953', '0', '1025', null, null, '2019-09-29 08:17:43', '1', '117.966223', '37.432275', '370000', '山东省', '371600', '滨州市', '371602', '滨城区', '0', '壳牌', '', '', '37160000387');
INSERT INTO zsys_oil_station VALUES ('1026', '山东壳牌石油有限公司滨州市小营镇加油站', '滨州市小营镇壳牌加油站', '滨州市小营镇镇政府南六百米205国道与319省道交汇处路东小营汽车站北邻', '', '3', '15166308514', '0', '1026', null, null, '2019-09-29 08:17:44', '1', '118.090315', '37.281051', '370000', '山东省', '371600', '滨州市', '371602', '滨城区', '0', '壳牌', '', '', '37160000388');
INSERT INTO zsys_oil_station VALUES ('1027', '山东壳牌石油有限公司滨州市黄河大桥加油站', '滨州市黄河大桥壳牌加油站', '滨州市高新区205国道滨州黄河大桥收费站南300米路西', '', '3', '15305432593', '0', '1027', null, null, '2019-09-29 08:17:44', '1', '118.076217', '37.336114', '370000', '山东省', '371600', '滨州市', '371602', '滨城区', '0', '壳牌', '', '', '37160000450');
INSERT INTO zsys_oil_station VALUES ('1028', '山东壳牌石油有限公司邹平县北环路加油站', '邹平县北环路壳牌加油站', '邹平县汽车站向西200米路北', '', '3', '18654531566', '0', '1028', null, null, '2019-09-29 08:17:44', '1', '117.728647', '36.901912', '370000', '山东省', '371600', '滨州市', '371626', '邹平县', '0', '壳牌', '', '', '37160000390');
INSERT INTO zsys_oil_station VALUES ('1029', '山东壳牌石油有限公司滨州市邹平县邹韩路加油站', '邹平县邹韩路壳牌加油站', '邹平县邹韩路和金玉大道交口西南角', '', '3', '18654531566', '0', '1029', null, null, '2019-09-29 08:17:45', '1', '117.731388', '36.925785', '370000', '山东省', '371600', '滨州市', '371626', '邹平县', '0', '壳牌', '', '', '37160000391');
INSERT INTO zsys_oil_station VALUES ('1030', '山东壳牌石油有限公司滨州市邹平县白云一路加油站', '邹平县白云一路壳牌加油站', '滨州市邹平县好生镇邹周路南(顺通科技对面)', '', '3', '18706431191', '0', '1030', null, null, '2019-09-29 08:17:45', '1', '117.804278', '36.822642', '370000', '山东省', '371600', '滨州市', '371626', '邹平县', '0', '壳牌', '', '', '37160000449');
INSERT INTO zsys_oil_station VALUES ('1031', '山东壳牌石油有限公司滨州市邹平县邹魏路加油站', '邹平县邹魏路壳牌加油站', '滨州市邹平县明集镇邹魏路柴家村北300米路南', '', '3', '15762165320', '0', '1031', null, null, '2019-09-29 08:17:45', '1', '117.660448', '36.929851', '370000', '山东省', '371600', '滨州市', '371626', '邹平县', '0', '壳牌', '', '', '37160000448');
INSERT INTO zsys_oil_station VALUES ('1032', '山东壳牌石油有限公司滨州市邹平范公路加油站', '邹平范公路壳牌加油站', '邹平县范公路和会仙一路交口以南路西侧', '', '3', '18706431191', '0', '1032', null, null, '2019-09-29 08:17:45', '1', '117.876485', '36.880412', '370000', '山东省', '371600', '滨州市', '371626', '邹平县', '0', '壳牌', '', '', '37160000451');
INSERT INTO zsys_oil_station VALUES ('1033', '山东壳牌石油有限公司邹平县魏桥镇西码头加油站', '邹平县魏桥镇西码头壳牌加油站', '滨州市邹平县魏桥镇西码头村', '', '3', '15762165320', '0', '1033', null, null, '2019-09-29 08:17:46', '1', '117.513538', '37.021052', '370000', '山东省', '371600', '滨州市', '371626', '邹平县', '0', '壳牌', '', '', '37160000452');
INSERT INTO zsys_oil_station VALUES ('1034', '无棣古城加油站', '无棣古城加油站', '无棣县古城4号路以东，6号路以北', '', '1', '18763031115', '0', '1034', null, null, '2019-09-29 08:17:46', '1', '117.599213', '37.745366', '370000', '山东省', '371600', '滨州市', '371623', '无棣县', '0', '中石油', '', '', '37160000441');
INSERT INTO zsys_oil_station VALUES ('1035', '无棣棣新六路站', '无棣棣新六路站', '无棣县无棣镇205国道484公里+900米处', '', '1', '15564368039', '0', '1035', null, null, '2019-09-29 08:17:46', '1', '117.644912', '37.739506', '370000', '山东省', '371600', '滨州市', '371623', '无棣县', '0', '中石油', '', '', '37160000444');
INSERT INTO zsys_oil_station VALUES ('1036', '山东壳牌石油有限公司滨州市长江三路加油站', '长江三路加油站', '滨州市长江三路与渤海二十一路交叉口西50米路南', '', '3', '15005448016', '0', '1036', null, null, '2019-09-29 08:17:46', '1', '117.939124', '37.358484', '370000', '山东省', '371600', '滨州市', '371601', '市辖区', '0', '壳牌', '', '', '37160000389');
INSERT INTO zsys_oil_station VALUES ('1037', '山东壳牌石油有限公司滨州惠民县车站路加油站', '惠民车站路加油站', '滨州市惠民县孙武镇大于村十字路口（原外贸加油站）', '', '3', '13210417272', '0', '1037', null, null, '2019-09-29 08:17:47', '1', '117.505507', '37.476676', '370000', '山东省', '371600', '滨州市', '371621', '惠民县', '0', '壳牌', '', '', '37160000386');
INSERT INTO zsys_oil_station VALUES ('1038', '中石油金阳加油站', '金阳加油站', '阳信县金阳街道办事处阳城三路以南、银高乡范家村', '', '1', '15263003502', '0', '1038', null, null, '2019-09-29 08:17:47', '1', '117.546894', '37.656061', '370000', '山东省', '371600', '滨州市', '371622', '阳信县', '0', '中石油', '', '', '37160000445');
INSERT INTO zsys_oil_station VALUES ('1039', '山东壳牌石油有限公司烟台市莱山区观海路加油站', '壳牌莱山观海路加油站', '烟台市莱山区观海路与高速入口北150米路西', '', '3', '7357518', '0', '1039', null, null, '2019-09-29 08:17:47', '1', '121.470138', '37.454515', '370000', '山东省', '370600', '烟台市', '370613', '莱山区', '0', '壳牌', '', '', '37060000503');
INSERT INTO zsys_oil_station VALUES ('1040', '交运石油寨子店', '交运石油寨子店', '威海市世昌大道116-5号', '', null, '06315892577', '0', '1040', null, null, '2019-09-29 08:17:48', '1', '122.100000', '37.500000', '370000', '山东省', '371000', '威海市', '371002', '环翠区', '0', '其它', '', '', '37100000558');
INSERT INTO zsys_oil_station VALUES ('1043', '交运石油乳山店', '交运石油乳山店', '乳山市世纪大道南段', '', null, '06315892577', '0', '1043', null, null, '2019-09-29 08:17:48', '1', '122.550000', '36.870000', '370000', '山东省', '371000', '威海市', '371083', '乳山市', '0', '其它', '', '', '37100000559');
INSERT INTO zsys_oil_station VALUES ('1044', '山东壳牌石油有限公司安丘东郊加油站', '壳牌安丘东郊加油站', '安丘市206国道常家庄段，距安丘市东环路交口约2.5公里', '', '3', '15336363673', '0', '1044', null, null, '2019-09-29 08:17:48', '1', '119.249588', '36.416999', '370000', '山东省', '370700', '潍坊市', '370784', '安丘市', '0', '壳牌', '', '', '37070000468');
INSERT INTO zsys_oil_station VALUES ('1045', '山东壳牌石油有限公司安丘市景酒大道加油站', '壳牌安丘景酒大道加油站', '安丘市景芝镇驻地206国道333KM处', '', '3', '15336363673', '0', '1045', null, null, '2019-09-29 08:17:48', '1', '119.387221', '36.317129', '370000', '山东省', '370700', '潍坊市', '370784', '安丘市', '0', '壳牌', '', '', '37070000470');
INSERT INTO zsys_oil_station VALUES ('1046', '山东壳牌石油有限公司安丘市潍徐北路加油站', '壳牌安丘潍徐北路加油站', '安丘市潍徐北路111号', '', '3', '15336363673', '0', '1046', null, null, '2019-09-29 08:17:48', '1', '119.190556', '36.453055', '370000', '山东省', '370700', '潍坊市', '370784', '安丘市', '0', '壳牌', '', '', '37070000471');
INSERT INTO zsys_oil_station VALUES ('1047', '山东壳牌石油有限公司安丘汶河加油站', '壳牌安丘汶河加油站', '山东省安丘市新安街道西南村潍徐路东侧88号', '', '3', '15336363673', '0', '1047', null, null, '2019-09-29 08:17:49', '1', '119.225982', '36.452710', '370000', '山东省', '370700', '潍坊市', '370784', '安丘市', '0', '壳牌', '', '', '37070000467');
INSERT INTO zsys_oil_station VALUES ('1048', '山东壳牌石油有限公司安丘小沟站', '壳牌安丘小沟加油站', '安丘市凌河镇北小沟村下小路107KM-70CM处路南侧', '', '3', '13964793418', '0', '1048', null, null, '2019-09-29 08:17:49', '1', '119.123983', '36.362109', '370000', '山东省', '370700', '潍坊市', '370784', '安丘市', '0', '壳牌', '', '', '37070000469');
INSERT INTO zsys_oil_station VALUES ('1049', '山东壳牌石油有限公司昌乐206国道加油站', '壳牌昌乐206国道加油站', '昌乐县G206与S325交口', '', '3', '15206307676', '0', '1049', null, null, '2019-09-29 08:17:49', '1', '119.180443', '36.490814', '370000', '山东省', '370700', '潍坊市', '370725', '昌乐县', '0', '壳牌', '', '', '37070000456');
INSERT INTO zsys_oil_station VALUES ('1050', '山东壳牌石油有限公司昌乐309国道加油站', '壳牌昌乐309国道加油站', '昌乐县309国道与西环路交叉口西北角', '', '3', '17705365585', '0', '1050', null, null, '2019-09-29 08:17:49', '1', '118.811310', '36.730753', '370000', '山东省', '370700', '潍坊市', '370725', '昌乐县', '0', '壳牌', '', '', '37070000477');
INSERT INTO zsys_oil_station VALUES ('1051', '山东壳牌石油有限公司昌乐南环加油站', '壳牌昌乐南环加油站', '昌乐新昌路与224省道交汇处东侧', '', '3', '13290188071', '0', '1051', null, null, '2019-09-29 08:17:50', '1', '118.844180', '36.642418', '370000', '山东省', '370700', '潍坊市', '370725', '昌乐县', '0', '壳牌', '', '', '37070000479');
INSERT INTO zsys_oil_station VALUES ('1052', '山东壳牌石油有限公司昌乐鄌郚大沂路加油站', '壳牌昌乐鄌郚大沂路加油站', '山东省潍坊市昌乐县鄌郚镇政府驻地大沂路东侧', '', '3', '13780859117', '0', '1052', null, null, '2019-09-29 08:17:50', '1', '118.874880', '36.455377', '370000', '山东省', '370700', '潍坊市', '370725', '昌乐县', '0', '壳牌', '', '', '37070000478');
INSERT INTO zsys_oil_station VALUES ('1053', '山东壳牌石油有限公司昌乐县新昌路加油站', '壳牌昌乐县新昌路加油站', '潍坊市昌乐县城关街道刘家桥村东侧昌高路西侧', '', '3', '13290188071', '0', '1053', null, null, '2019-09-29 08:17:50', '1', '118.840011', '36.683002', '370000', '山东省', '370700', '潍坊市', '370725', '昌乐县', '0', '壳牌', '', '', '37070000476');
INSERT INTO zsys_oil_station VALUES ('1054', '山东壳牌石油有限公司昌邑饮马镇加油站', '壳牌昌邑饮马镇加油站', '潍坊昌邑市饮马镇东南村西200米处，下小路东侧', '', '3', '15689172982', '0', '1054', null, null, '2019-09-29 08:17:51', '1', '119.478382', '36.662701', '370000', '山东省', '370700', '潍坊市', '370786', '昌邑市', '0', '壳牌', '', '', '37070000484');
INSERT INTO zsys_oil_station VALUES ('1055', '山东壳牌石油有限公司坊子区北海路加油站', '壳牌坊子区北海路加油站', '潍坊市坊子区北海路与灵山街交叉口', '', '3', '13583690310', '0', '1055', null, null, '2019-09-29 08:17:51', '1', '119.171615', '36.540896', '370000', '山东省', '370700', '潍坊市', '370704', '坊子区', '0', '壳牌', '', '', '37070000443');
INSERT INTO zsys_oil_station VALUES ('1056', '山东壳牌石油有限公司潍坊市坊子区潍安路加油站', '壳牌坊子潍安路加油站', '潍坊市坊子区坊安街道罗家宅子村南坊安工业园', '', '3', '18953692121', '0', '1056', null, null, '2019-09-29 08:17:51', '1', '119.227993', '36.608004', '370000', '山东省', '370700', '潍坊市', '370704', '坊子区', '0', '壳牌', '', '', '37070000483');
INSERT INTO zsys_oil_station VALUES ('1057', '山东壳牌石油有限公司潍坊市坊子区潍州路加油站', '壳牌坊子区潍州路加油站', '山东省潍坊市坊子区潍州路15公里处路西', '', '3', '15206307676', '0', '1057', null, null, '2019-09-29 08:17:52', '1', '119.142107', '36.583404', '370000', '山东省', '370700', '潍坊市', '370704', '坊子区', '0', '壳牌', '', '', '37070000482');
INSERT INTO zsys_oil_station VALUES ('1058', '山东壳牌石油有限公司高密康成大街加油站', '壳牌高密康成大街加油站', '山东省高密市康成大街7777号', '', '3', '18753602008', '0', '1058', null, null, '2019-09-29 08:17:52', '1', '119.757725', '36.368924', '370000', '山东省', '370700', '潍坊市', '370785', '高密市', '0', '壳牌', '', '', '37070000457');
INSERT INTO zsys_oil_station VALUES ('1059', '山东壳牌石油有限公司高密平安大道加油站', '壳牌高密平安大道加油站', '高密市夷安大道与平安大道交叉口东南角', '', '3', '15063666752', '0', '1059', null, null, '2019-09-29 08:17:52', '1', '119.782081', '36.329999', '370000', '山东省', '370700', '潍坊市', '370785', '高密市', '0', '壳牌', '', '', '37070000449');
INSERT INTO zsys_oil_station VALUES ('1060', '山东壳牌石油有限公司高密夷安大道加油站', '壳牌高密夷安大道加油站', '高密市姜庄镇李仙村平日路西侧', '', '3', '15650285600', '0', '1060', null, null, '2019-09-29 08:17:52', '1', '119.793126', '36.481568', '370000', '山东省', '370700', '潍坊市', '370785', '高密市', '0', '壳牌', '', '', '37070000459');
INSERT INTO zsys_oil_station VALUES ('1061', '山东壳牌石油有限公司高密站前街加油站', '壳牌高密站前街加油站', '山东省潍坊市高密市站南街西首', '', '3', '15650285600', '0', '1061', null, null, '2019-09-29 08:17:53', '1', '119.766505', '36.397768', '370000', '山东省', '370700', '潍坊市', '370785', '高密市', '0', '壳牌', '', '', '37070000458');
INSERT INTO zsys_oil_station VALUES ('1062', '山东壳牌石油有限公司高诸路加油站', '壳牌高密高诸路加油站', '高密市姜家屯南侧高诸路东侧', '', '3', '18753602008', '0', '1062', null, null, '2019-09-29 08:17:53', '1', '119.726323', '36.342496', '370000', '山东省', '370700', '潍坊市', '370785', '高密市', '0', '壳牌', '', '', '37070000455');
INSERT INTO zsys_oil_station VALUES ('1063', '山东壳牌石油有限公司潍坊清池街南加油站', '壳牌潍坊清池街南加油站', '潍坊市高新区清池街办梁寨村南侧309国道南侧', '', '3', '18953692121', '0', '1063', null, null, '2019-09-29 08:17:53', '1', '119.262558', '36.720464', '370000', '山东省', '370700', '潍坊市', '370703', '寒亭区', '0', '壳牌', '', '', '37070000451');
INSERT INTO zsys_oil_station VALUES ('1064', '山东壳牌石油有限公司潍坊市高新区玉清东街加油站', '壳牌潍坊市高新区玉清东街加油站', '潍坊市玉清东街与蓉花路交叉口东30米路南', '', '3', '15866115562', '0', '1064', null, null, '2019-09-29 08:17:53', '1', '119.168854', '36.744621', '370000', '山东省', '370700', '潍坊市', '370701', '市辖区', '0', '壳牌', '', '', '37070000488');
INSERT INTO zsys_oil_station VALUES ('1065', '山东壳牌石油有限公司潍坊高里镇加油站', '壳牌潍坊高里镇加油站', '潍坊市寒亭区高里镇高里二村（S223省道高里镇国税局对过', '', '3', '15095196666', '0', '1065', null, null, '2019-09-29 08:17:54', '1', '119.048866', '36.847830', '370000', '山东省', '370700', '潍坊市', '370703', '寒亭区', '0', '壳牌', '', '', '37070000480');
INSERT INTO zsys_oil_station VALUES ('1066', '山东壳牌石油有限公司潍坊市奎文区潍州路加油站', '壳牌潍坊市奎文区潍州路加油站', '山东省潍坊市奎文区宝通街潍州路交汇东南角', '', '3', '13854406956', '0', '1066', null, null, '2019-09-29 08:17:54', '1', '119.130139', '36.676903', '370000', '山东省', '370700', '潍坊市', '370705', '奎文区', '0', '壳牌', '', '', '37070000486');
INSERT INTO zsys_oil_station VALUES ('1067', '山东壳牌石油有限公司临朐华特路加油站', '壳牌临朐华特路加油站', '山东省潍坊临朐县华特路与站前街西侧', '', '3', '13964704472', '0', '1067', null, null, '2019-09-29 08:17:54', '1', '118.535050', '36.539247', '370000', '山东省', '370700', '潍坊市', '370724', '临朐县', '0', '壳牌', '', '', '37070000446');
INSERT INTO zsys_oil_station VALUES ('1068', '山东壳牌石油有限公司临朐临九路加油站', '壳牌临朐临九路加油站', '临朐县城南1.5公里临九路东（与朱峰路交口）', '', '3', '18563653880', '0', '1068', null, null, '2019-09-29 08:17:54', '1', '118.526795', '36.482099', '370000', '山东省', '370700', '潍坊市', '370724', '临朐县', '0', '壳牌', '', '', '37070000461');
INSERT INTO zsys_oil_station VALUES ('1069', '山东壳牌石油有限公司临朐县辛寨镇加油站', '壳牌临朐县辛寨镇加油站', '临朐辛寨镇王家西圈村S227省道', '', '3', '15063655277', '0', '1069', null, null, '2019-09-29 08:17:55', '1', '118.616105', '36.400868', '370000', '山东省', '370700', '潍坊市', '370724', '临朐县', '0', '壳牌', '', '', '37070000462');
INSERT INTO zsys_oil_station VALUES ('1070', '山东壳牌石油有限公司临朐县冶源镇临九路加油站', '壳牌临朐县冶源镇临九路加油站', '临朐冶源镇海浮山斜对面', '', '3', '18563653880', '0', '1070', null, null, '2019-09-29 08:17:55', '1', '118.506737', '36.413221', '370000', '山东省', '370700', '潍坊市', '370724', '临朐县', '0', '壳牌', '', '', '37070000460');
INSERT INTO zsys_oil_station VALUES ('1071', '山东壳牌石油有限公司青州市黄楼309加油站', '山东壳牌石油有限公司青州市黄楼309加油站', '青州市309国道与仙客来路交叉路口向东，过铁路桥100米路北', '', '3', '13606367957', '0', '1071', null, null, '2019-09-29 08:17:55', '1', '118.526359', '36.726050', '370000', '山东省', '370700', '潍坊市', '370781', '青州市', '0', '壳牌', '', '', '37070000463');
INSERT INTO zsys_oil_station VALUES ('1072', '山东壳牌石油有限公司青州市玲珑山北路加油站', '壳牌青州玲珑山北路加油站', '青州市青垦路口向北200米路东', '', '3', '13780886382', '0', '1072', null, null, '2019-09-29 08:17:55', '1', '118.489903', '36.739216', '370000', '山东省', '370700', '潍坊市', '370781', '青州市', '0', '壳牌', '', '', '37070000464');
INSERT INTO zsys_oil_station VALUES ('1073', '山东壳牌石油有限公司青州市南环路加油站', '壳牌青州市南环路加油站', '潍坊青州市新南环路弥河镇政府驻地北、云内动力西临', '', '3', '13606367957', '0', '1073', null, null, '2019-09-29 08:17:56', '1', '118.526507', '36.640762', '370000', '山东省', '370700', '潍坊市', '370781', '青州市', '0', '壳牌', '', '', '37070000444');
INSERT INTO zsys_oil_station VALUES ('1074', '山东壳牌石油有限公司青州市青垦路加油站', '壳牌青州市青垦路加油站', '青州市青垦路铁路桥北300米壳牌加油站', '', '3', '13780886382', '0', '1074', null, null, '2019-09-29 08:17:56', '1', '118.489721', '36.739085', '370000', '山东省', '370700', '潍坊市', '370781', '青州市', '0', '壳牌', '', '', '37070000445');
INSERT INTO zsys_oil_station VALUES ('1075', '山东壳牌石油有限公司青州市昭德路加油站', '壳牌青州市昭德路加油站', '青州市王桑路口昭德路与309国道交叉口东南角', '', '3', '13606367957', '0', '1075', null, null, '2019-09-29 08:17:56', '1', '118.526359', '36.726050', '370000', '山东省', '370700', '潍坊市', '370781', '青州市', '0', '壳牌', '', '', '37070000466');
INSERT INTO zsys_oil_station VALUES ('1076', '山东壳牌石油有限公司寿光侯镇昌大路加油站', '壳牌寿光侯镇昌大路加油站', '寿光市侯镇政府北首昌大路东侧', '', '3', '15153603336', '0', '1076', null, null, '2019-09-29 08:17:57', '1', '118.977201', '37.011214', '370000', '山东省', '370700', '潍坊市', '370783', '寿光市', '0', '壳牌', '', '', '37070000447');
INSERT INTO zsys_oil_station VALUES ('1077', '山东壳牌石油有限公司寿光留吕昌大路加油站', '壳牌寿光留吕昌大路加油站', '寿光市留吕镇昌大路与留寒路交叉口西南角', '', '3', '18660451915', '0', '1077', null, null, '2019-09-29 08:17:57', '1', '118.959985', '36.921238', '370000', '山东省', '370700', '潍坊市', '370783', '寿光市', '0', '壳牌', '', '', '37070000473');
INSERT INTO zsys_oil_station VALUES ('1078', '山东壳牌石油有限公司仓南街加油站', '壳牌潍坊仓南街加油站', '潍坊市潍城区仓南街商校东临200米', '', '3', '17866192381', '0', '1078', null, null, '2019-09-29 08:17:57', '1', '118.675959', '36.912603', '370000', '山东省', '370700', '潍坊市', '370702', '潍城区', '0', '壳牌', '', '', '37070000450');
INSERT INTO zsys_oil_station VALUES ('1079', '山东壳牌石油有限公司潍坊安顺路加油站', '壳牌潍坊安顺路加油站', '潍坊市潍城区安顺路（安顺路卧龙西街长松路交叉路口）西北侧200米路西（交运加油站对面）', '', '3', '13583600860', '0', '1079', null, null, '2019-09-29 08:17:58', '1', '119.064530', '36.740377', '370000', '山东省', '370700', '潍坊市', '370702', '潍城区', '0', '壳牌', '', '', '37070000442');
INSERT INTO zsys_oil_station VALUES ('1080', '山东壳牌石油有限公司潍坊宝通西街加油站', '壳牌潍坊宝通西街加油站', '潍坊市潍城区宝通西街与西环路交叉口西200米路北', '', '3', '18366305659', '0', '1080', null, null, '2019-09-29 08:17:58', '1', '119.032929', '36.678499', '370000', '山东省', '370700', '潍坊市', '370702', '潍城区', '0', '壳牌', '', '', '37070000487');
INSERT INTO zsys_oil_station VALUES ('1081', '山东壳牌石油有限公司潍坊北宫西街加油站', '壳牌潍坊北宫西街加油站', '潍城区开发区南曹村西（原昌乐309国道收费站）', '', '3', '18863616531', '0', '1081', null, null, '2019-09-29 08:17:58', '1', '118.958490', '36.731047', '370000', '山东省', '370700', '潍坊市', '370702', '潍城区', '0', '壳牌', '', '', '37070000448');
INSERT INTO zsys_oil_station VALUES ('1082', '山东壳牌石油有限公司潍坊长松路加油站', '壳牌潍坊加油站', '潍坊市潍城区长松路46号', '', '3', '17686619238', '0', '1082', null, null, '2019-09-29 08:17:58', '1', '119.066263', '36.712825', '370000', '山东省', '370700', '潍坊市', '370702', '潍城区', '0', '壳牌', '', '', '37070000489');
INSERT INTO zsys_oil_station VALUES ('1083', '山东壳牌石油有限公司潍坊潍蒋路加油站', '壳牌潍坊潍蒋路加油站', '山东省潍坊市潍城区潍蒋路大柳树段17公里处路西', '', '3', '18366305659', '0', '1083', null, null, '2019-09-29 08:17:59', '1', '118.993211', '36.616907', '370000', '山东省', '370700', '潍坊市', '370702', '潍城区', '0', '壳牌', '', '', '37070000485');
INSERT INTO zsys_oil_station VALUES ('1084', '山东壳牌石油有限公司潍高路加油站', '壳牌潍高路加油站', '山东省潍坊市潍城区于河镇后王村北', '', '3', '18660451915', '0', '1084', null, null, '2019-09-29 08:17:59', '1', '118.963138', '36.811414', '370000', '山东省', '370700', '潍坊市', '370702', '潍城区', '0', '壳牌', '', '', '37070000453');
INSERT INTO zsys_oil_station VALUES ('1085', '山东壳牌石油有限公司潍坊经济技术开发区潍坊北外环加油站', '壳牌潍坊经济技术开发区潍坊北外环加油', '潍坊市经济开发区北外环路与友爱路交叉路口东100米', '', '3', '18053639988', '0', '1085', null, null, '2019-09-29 08:17:59', '1', '119.090226', '36.798044', '370000', '山东省', '370700', '潍坊市', '370701', '市辖区', '0', '壳牌', '', '', '37070000481');
INSERT INTO zsys_oil_station VALUES ('1086', '山东壳牌石油有限公司诸城市保税物流园区加油站', '壳牌诸城市保税物流园区加油站', '诸城市舜王街道206国道保税区对面', '', '3', '18678042620', '0', '1086', null, null, '2019-09-29 08:17:59', '1', '119.416922', '36.108318', '370000', '山东省', '370700', '潍坊市', '370782', '诸城市', '0', '壳牌', '', '', '37070000454');
INSERT INTO zsys_oil_station VALUES ('1087', '山东壳牌石油有限公司诸城市北环加油站', '壳牌诸城市北环加油站', '潍坊市诸城市西外环与北外环交叉口往西50米路南', '', '3', '18678042620', '0', '1087', null, null, '2019-09-29 08:18:00', '1', '119.373162', '36.031537', '370000', '山东省', '370700', '潍坊市', '370782', '诸城市', '0', '壳牌', '', '', '37070000475');
INSERT INTO zsys_oil_station VALUES ('1088', '山东壳牌石油有限公司诸城西十里加油站', '壳牌诸城西十里加油站', '潍坊市诸城市龙都街办西十里村206国道372.8公里处', '', '3', '18678042620', '0', '1088', null, null, '2019-09-29 08:18:00', '1', '119.364880', '35.979193', '370000', '山东省', '370700', '潍坊市', '370782', '诸城市', '0', '壳牌', '', '', '37070000474');
INSERT INTO zsys_oil_station VALUES ('1089', '山东壳牌石油有限公司淄博鲁泰大道加油站', '壳牌淄博鲁泰大道', '与尚风路路口东', '', '3', '0533-6122014', '0', '1089', null, null, '2019-09-29 08:18:00', '1', '118.123180', '36.123180', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '壳牌', '', '', '37030000315');
INSERT INTO zsys_oil_station VALUES ('1090', '山东壳牌石油有限公司淄博加油站', '壳牌淄博昌国西路', '63号', '', '3', '18653354954', '0', '1090', null, null, '2019-09-29 08:18:00', '1', '118.026410', '36.784870', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '壳牌', '', '', '37030000316');
INSERT INTO zsys_oil_station VALUES ('1091', '山东壳牌石油有限公司华光路加油站', '壳牌淄博华光路', '12号', '', '3', '0533-3120312', '0', '1091', null, null, '2019-09-29 08:18:01', '1', '118.074750', '36.817300', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '壳牌', '', '', '37030000317');
INSERT INTO zsys_oil_station VALUES ('1092', '山东壳牌石油有限公司张店人民东路加油站', '壳牌淄博人民东路', '人民东路44号', '', '3', '0533-3129259', '0', '1092', null, null, '2019-09-29 08:18:01', '1', '118.080930', '36.807470', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '壳牌', '', '', '37030000318');
INSERT INTO zsys_oil_station VALUES ('1093', '山东壳牌石油有限公司淄博联通路宝山加油站', '壳牌淄博联通路', '与宝山路路口西500米路北', '', '3', '0533-3503289', '0', '1093', null, null, '2019-09-29 08:18:01', '1', '118.092340', '36.822250', '370000', '山东省', '370300', '淄博市', '370303', '张店区', '0', '壳牌', '', '', '37030000321');
INSERT INTO zsys_oil_station VALUES ('1094', '山东壳牌石油有限公司淄博市博山区颜北路加油站', '壳牌淄博博山颜北', '白塔镇小海眼村西', '', '3', '13280659661', '0', '1094', null, null, '2019-09-29 08:18:01', '1', '117.882450', '36.558810', '370000', '山东省', '370300', '淄博市', '370304', '博山区', '0', '壳牌', '', '', '37030000319');
INSERT INTO zsys_oil_station VALUES ('1095', '山东壳牌石油有限公司淄博市博山区西外环加油站', '壳牌淄博博山西外', '万杰朝阳学校对过', '', '3', '13280659661', '0', '1095', null, null, '2019-09-29 08:18:02', '1', '117.849950', '36.354693', '370000', '山东省', '370300', '淄博市', '370304', '博山区', '0', '壳牌', '', '', '37030000330');
INSERT INTO zsys_oil_station VALUES ('1096', '山东壳牌石油有限公司淄博市淄川区淄城路加油站', '壳牌淄博淄川淄城', '479号（淄川区医院北邻）', '', '3', '13475338353', '0', '1096', null, null, '2019-09-29 08:18:02', '1', '117.969250', '36.655520', '370000', '山东省', '370300', '淄博市', '370302', '淄川区', '0', '壳牌', '', '', '37030000320');
INSERT INTO zsys_oil_station VALUES ('1097', '山东壳牌石油有限公司淄博市淄川区杨萌路加油站', '壳牌淄博淄川杨萌', '与杨萌路路口西北', '', '3', '18653352066', '0', '1097', null, null, '2019-09-29 08:18:02', '1', '117.952220', '36.723970', '370000', '山东省', '370300', '淄博市', '370302', '淄川区', '0', '壳牌', '', '', '37030000331');
INSERT INTO zsys_oil_station VALUES ('1098', '山东壳牌石油有限公司淄博商家加油站', '壳牌淄博淄川商家', '唐骏欧铃路（文昌湖车管所东200米）', '', '3', '18653352066', '0', '1098', null, null, '2019-09-29 08:18:03', '1', '117.874530', '36.659210', '370000', '山东省', '370300', '淄博市', '370302', '淄川区', '0', '壳牌', '', '', '37030000322');
INSERT INTO zsys_oil_station VALUES ('1099', '山东壳牌石油有限公司淄博市淄川区狮王大道加油站', '壳牌淄博淄川狮王大道', '双杨镇309国道袁家村东临', '', '3', '13475338353', '0', '1099', null, null, '2019-09-29 08:18:03', '1', '117.968380', '36.747620', '370000', '山东省', '370300', '淄博市', '370302', '淄川区', '0', '壳牌', '', '', '37030000323');
INSERT INTO zsys_oil_station VALUES ('1100', '山东壳牌石油有限公司淄川龙泉路加油站', '壳牌淄博淄川龙泉', '龙泉镇省道235尚庄村西', '', '3', '13022717903', '0', '1100', null, null, '2019-09-29 08:18:03', '1', '117.982510', '36.591630', '370000', '山东省', '370300', '淄博市', '370302', '淄川区', '0', '壳牌', '', '', '37030000324');
INSERT INTO zsys_oil_station VALUES ('1101', '山东壳牌石油有限公司淄博市淄川区胶王路加油站', '壳牌淄博淄川胶王', '寨里镇南头村北', '', '3', '13022717903', '0', '1101', null, null, '2019-09-29 08:18:04', '1', '118.013400', '36.660050', '370000', '山东省', '370300', '淄博市', '370302', '淄川区', '0', '壳牌', '', '', '37030000326');
INSERT INTO zsys_oil_station VALUES ('1102', '山东壳牌石油有限公司淄博市周村区南郊镇加油站', '壳牌淄博周村南郊', '309国道高塘段', '', '3', '15253368836', '0', '1102', null, null, '2019-09-29 08:18:04', '1', '117.907410', '36.786990', '370000', '山东省', '370300', '淄博市', '370306', '周村区', '0', '壳牌', '', '', '37030000325');
INSERT INTO zsys_oil_station VALUES ('1103', '山东壳牌石油有限公司周村周隆路加油站', '壳牌淄博周村周隆', '西外环与周隆路西北角（万通汽贸城旁边）', '', '3', '13325228996', '0', '1103', null, null, '2019-09-29 08:18:04', '1', '117.831100', '36.783320', '370000', '山东省', '370300', '淄博市', '370306', '周村区', '0', '壳牌', '', '', '37030000327');
INSERT INTO zsys_oil_station VALUES ('1104', '山东壳牌石油有限公司淄博市临淄区临淄大道加油站', '壳牌淄博临淄大道', '691号', '', '3', '13953373681', '0', '1104', null, null, '2019-09-29 08:18:04', '1', '118.328510', '36.820790', '370000', '山东省', '370300', '淄博市', '370305', '临淄区', '0', '壳牌', '', '', '37030000328');
INSERT INTO zsys_oil_station VALUES ('1105', '山东壳牌石油有限公司淄博市临淄区辛河路加油站', '壳牌淄博临淄辛河', '辛河路（中轩路）与北外环路口北500米路东', '', '3', '13953373681', '0', '1105', null, null, '2019-09-29 08:18:05', '1', '118.309350', '36.846560', '370000', '山东省', '370300', '淄博市', '370305', '临淄区', '0', '壳牌', '', '', '37030000329');
INSERT INTO zsys_oil_station VALUES ('1106', '山东壳牌石油有限公司桓台县唐山镇加油站', '壳牌淄博桓台唐山', '321省道郑家村西', '', '3', '15605330831', '0', '1106', null, null, '2019-09-29 08:18:05', '1', '118.030990', '36.955330', '370000', '山东省', '370300', '淄博市', '370321', '桓台县', '0', '壳牌', '', '', '37030000314');
INSERT INTO zsys_oil_station VALUES ('1107', '中国石油天然气股份有限公司山东淄博销售分公司第5加油站', '中石油淄博5站', '耿桥路口北侧', '', '1', '13589591535', '0', '1107', null, null, '2019-09-29 08:18:05', '1', '118.125710', '36.983550', '370000', '山东省', '370300', '淄博市', '370321', '桓台县', '0', '中石油', '', '', '37030000238');
INSERT INTO zsys_oil_station VALUES ('1108', '中海新能源青岛5站', '中海新能源青5站', '青岛市平度市李园街道青岛路西端北侧', 'https://oss.etcsd.com/object/5cb54cc4549ecdf1d78c0b9c', null, '0532-88379556', '0', '1108', null, null, '2019-09-29 08:18:05', '1', '119.931107', '36.780145', '370000', '山东省', '370200', '青岛市', '370283', '平度市', '0', '中海新能源', '', '', '37020000772');
INSERT INTO zsys_oil_station VALUES ('1109', '中海新能源青岛6站', '中海新能源青6站', '青岛平度市田庄镇幸福庄村东100米，309国道路南', '', null, '0532-86381066', '0', '1109', null, null, '2019-09-29 08:18:05', '1', '119.763874', '36.772727', '370000', '山东省', '370200', '青岛市', '370283', '平度市', '0', '中海新能源', '', '', '37020000773');
INSERT INTO zsys_oil_station VALUES ('1110', '中海新能源潍坊11站', '中海新能源潍11站', '寒亭区高里镇高里医院北300米（大九路西）', '', null, '0536-7300756', '0', '1110', null, null, '2019-09-29 08:18:06', '1', '119.048664', '36.862709', '370000', '山东省', '370700', '潍坊市', '370703', '寒亭区', '0', '中海新能源', '', '', '37070000423');
INSERT INTO zsys_oil_station VALUES ('1113', '中海新能源潍坊16站', '中海新能源潍坊16站', '潍坊潍州路与潍胶路口南50米，潍莱高速口北侧', '', null, '0536-7518928', '0', '1113', null, null, '2019-09-29 08:18:06', '1', '119.140676', '36.627666', '370000', '山东省', '370700', '潍坊市', '370702', '潍城区', '0', '中海新能源', '', '', '37070000416');
INSERT INTO zsys_oil_station VALUES ('1115', '中海新能源潍坊19站', '中海新能源潍坊19站', '寿光市北外环与兴尚路交叉路口西300米路北', '', null, '0536-5582689', '0', '1115', null, null, '2019-09-29 08:18:06', '1', '118.816260', '36.923874', '370000', '山东省', '370700', '潍坊市', '370783', '寿光市', '0', '中海新能源', '', '', '37070000436');
INSERT INTO zsys_oil_station VALUES ('1116', '中海新能源潍坊20站', '中海新能源潍坊20站', '寒亭区朱里街道，杨瓦路与通亭街交叉路口东北角 ', '', null, '0536-7580026', '0', '1116', null, null, '2019-09-29 08:18:07', '1', '119.301541', '36.795434', '370000', '山东省', '370700', '潍坊市', '370703', '寒亭区', '0', '中海新能源', '', '', '37070000418');
INSERT INTO zsys_oil_station VALUES ('1117', '中海新能源潍坊21站', '中海新能源潍坊21站', '青州市东夏镇李集村南羊临路东侧', '', null, '0536-3865211', '0', '1117', null, null, '2019-09-29 08:18:07', '1', '118.589274', '36.769604', '370000', '山东省', '370700', '潍坊市', '370781', '青州市', '0', '中海新能源', '', '', '37070000424');
INSERT INTO zsys_oil_station VALUES ('1118', '中海新能源潍坊22站', '中海新能源潍坊22站', '青州市黄楼街道办小崔村北仙客来路西侧 ', '', null, '0563-3528233', '0', '1118', null, null, '2019-09-29 08:18:07', '1', '118.538666', '36.719011', '370000', '山东省', '370700', '潍坊市', '370781', '青州市', '0', '中海新能源', '', '', '37070000419');
INSERT INTO zsys_oil_station VALUES ('1119', '中海新能源潍坊23站', '中海新能源潍坊23站', '青州市凤凰山路昭德路口南侧', '', null, '0536-3826676', '0', '1119', null, null, '2019-09-29 08:18:07', '1', '118.519609', '36.679349', '370000', '山东省', '370700', '潍坊市', '370781', '青州市', '0', '山东石化', '', '', '37070000425');
INSERT INTO zsys_oil_station VALUES ('1120', '中海新能源潍坊25站', '中海新能源潍坊25站', '青州市高柳镇驻地，青垦路东侧', '', null, '0536-3844566', '0', '1120', null, null, '2019-09-29 08:18:08', '1', '118.523590', '36.872112', '370000', '山东省', '370700', '潍坊市', '370781', '青州市', '0', '中海新能源', '', '', '37070000426');
INSERT INTO zsys_oil_station VALUES ('1122', '中海新能源潍坊28站', '中海新能源潍坊28站', '潍坊市经济开发区北环路与五岭路交叉口西南角', '', null, '0536-7398689', '0', '1122', null, null, '2019-09-29 08:18:08', '1', '119.150235', '36.795606', '370000', '山东省', '370700', '潍坊市', '370701', '市辖区', '0', '中海新能源', '', '', '37070000420');
INSERT INTO zsys_oil_station VALUES ('1125', '中海新能源潍坊35站', '中海新能源潍坊35站', '昌邑市夏店镇前柳村东，辛沙路北侧', '', null, '0536-7848123', '0', '1125', null, null, '2019-09-29 08:18:08', '1', '119.482642', '36.977558', '370000', '山东省', '370700', '潍坊市', '370786', '昌邑市', '0', '中海新能源', '', '', '37070000438');
INSERT INTO zsys_oil_station VALUES ('1128', '中海新能源潍坊38站', '中海新能源潍坊38站', '青州市峱山经济开发区齐王路与西环路交叉口西南角 ', '', null, '0536-3859355', '0', '1128', null, null, '2019-09-29 08:18:08', '1', '118.387746', '36.771782', '370000', '山东省', '370700', '潍坊市', '370781', '青州市', '0', '中海新能源', '', '', '37070000421');
INSERT INTO zsys_oil_station VALUES ('1132', '中海新能源潍坊5站', '中海新能源潍坊5站', '昌乐县城南街办黄埠路口昌高路西侧', '', null, '0536-6732211', '0', '1132', null, null, '2019-09-29 08:18:09', '1', '118.840664', '36.654978', '370000', '山东省', '370700', '潍坊市', '370725', '昌乐县', '0', '中海新能源', '', '', '37070000434');
INSERT INTO zsys_oil_station VALUES ('1134', '中海新能源潍坊7站', '中海新能源潍坊7站', '寒亭区通亭街杨家埠东500米路南', '', null, '0536-7278808', '0', '1134', null, null, '2019-09-29 08:18:09', '1', '119.235649', '36.773873', '370000', '山东省', '370700', '潍坊市', '370703', '寒亭区', '0', '中海新能源', '', '', '37070000422');
INSERT INTO zsys_oil_station VALUES ('1135', '中海新能源潍坊9站', '中海新能源潍坊9站', '滨海经济开发区新海大街以北 ，海丰路以西  ', '', null, '0536-7575675', '0', '1135', null, null, '2019-09-29 08:18:09', '1', '119.140561', '37.025528', '370000', '山东省', '370700', '潍坊市', '370703', '寒亭区', '0', '中海新能源', '', '', '37070000414');
INSERT INTO zsys_oil_station VALUES ('1136', '山东路通石化有限公司第一加油站', '青临高速沂南东区', '青临高速沂南服务区东区', '', '2', '15194047975', '0', '1136', null, null, '2019-09-29 08:18:10', '1', '118.671467', '35.551389', '370000', '山东省', '371300', '临沂市', '371321', '沂南县', '1', '中国石化', 'G25', '长深高速', '37130000446');
INSERT INTO zsys_oil_station VALUES ('1137', '山东路通石化有限公司第二加油站', '青临高速沂南西区', '青临高速沂南服务区西区', '', '2', '15194047975', '0', '1137', null, null, '2019-09-29 08:18:10', '1', '118.668997', '35.550222', '370000', '山东省', '371300', '临沂市', '371321', '沂南县', '1', '中国石化', 'G25', '长深高速', '37130000437');
INSERT INTO zsys_oil_station VALUES ('1138', '山东路通石化有限公司第三加油站', '青临高速莒县停车场东区', '青临高速莒县停车场东区', '', '2', '13563222066', '0', '1138', null, null, '2019-09-29 08:18:10', '1', '118.636164', '35.395994', '370000', '山东省', '371100', '日照市', '371122', '莒县', '1', '中国石化', 'G25', '长深高速', '37130000438');
INSERT INTO zsys_oil_station VALUES ('1139', '山东路通石化有限公司第四加油站', '青临高速莒县停车场西区', '青临高速莒县停车区西区区', '', '2', '13563222066', '0', '1139', null, null, '2019-09-29 08:18:10', '1', '118.634806', '35.395966', '370000', '山东省', '371100', '日照市', '371122', '莒县', '1', '中国石化', 'G25', '长深高速', '37130000439');
INSERT INTO zsys_oil_station VALUES ('1140', '山东路通石化有限公司第五加油站', '青银高速临沭东区加油站', '青银高速公路临沭服务区东区', '', '2', '13305361200', '0', '1140', null, null, '2019-09-29 08:18:10', '1', '118.640249', '35.094432', '370000', '山东省', '371300', '临沂市', '371329', '临沭县', '1', '中国石化', 'G20', '青银高速', '37130000440');
INSERT INTO zsys_oil_station VALUES ('1141', '山东路通石化有限公司第六加油站', '青临高速临沭西区', '青临高速临沭服务区东区', '', '2', '13350361200', '0', '1141', null, null, '2019-09-29 08:18:11', '1', '118.639926', '35.092261', '370000', '山东省', '371300', '临沂市', '371329', '临沭县', '1', '中国石化', 'G25', '长深高速', '37130000441');
INSERT INTO zsys_oil_station VALUES ('1142', '山东路通石化有限公司第七加油站', '青临高速临沭停车区东区', '青临高速临沭停车区东区', '', '2', '13721999092', '0', '1142', null, null, '2019-09-29 08:18:11', '1', '118.773758', '34.904254', '370000', '山东省', '371300', '临沂市', '371329', '临沭县', '1', '中国石化', 'G25', '长深高速', '37130000442');
INSERT INTO zsys_oil_station VALUES ('1143', '山东路通石化有限公司第八加油站', '青临高速临沭停车区西区', '青临高速公路临沭停车区西区', '', '2', '13721999092', '0', '1143', null, null, '2019-09-29 08:18:11', '1', '118.773758', '34.904254', '370000', '山东省', '371300', '临沂市', '371329', '临沭县', '1', '中国石化', 'G25', '长深高速', '37130000443');
INSERT INTO zsys_oil_station VALUES ('1144', '山东路通石化有限公司第九加油站', '济徐高速汶上东区', '济徐高速公路汶上停车区东区', '', '2', '18053767567', '0', '1144', null, null, '2019-09-29 08:18:11', '1', '116.440451', '35.645519', '370000', '山东省', '370800', '济宁市', '370830', '汶上县', '1', '中国石化', 'S33', '济徐高速', '37130000444');
INSERT INTO zsys_oil_station VALUES ('1145', '山东路通石化有限公司第十加油站', '济徐高速汶上西区', '济徐高速公路汶上停车区西区', '', '2', '18053767567', '0', '1145', null, null, '2019-09-29 08:18:12', '1', '116.439089', '35.644692', '370000', '山东省', '370800', '济宁市', '370830', '汶上县', '1', '中国石化', 'S33', '济徐高速', '37130000445');
INSERT INTO zsys_oil_station VALUES ('1146', '山东壳牌石油有限公司临朐县西环路加油站', '壳牌临朐县西环路加油站', '临朐县西环路与新华路交口', '', '3', '18563653880', '0', '1146', null, null, '2019-09-29 08:18:12', '1', '118.506778', '36.521740', '370000', '山东省', '370700', '潍坊市', '370724', '临朐县', '0', '壳牌', '', '', '37070000465');
INSERT INTO zsys_oil_station VALUES ('1147', '壳牌德州市长河大道加油站', '德州市长河大道加油站', '德州市长河大道', '', '3', '15315809268', '0', '1147', null, null, '2019-09-29 08:18:12', '1', '116.205200', '37.252500', '370000', '山东省', '371400', '德州市', '371402', '德城区', '0', '壳牌', '', '', '37140000360');
INSERT INTO zsys_oil_station VALUES ('1148', '壳牌德州市大学东路加油站', '德州市大学东路加油站', '德州市大学东路加油站', '', '3', '15092588989', '0', '1148', null, null, '2019-09-29 08:18:12', '1', '116.215400', '37.274400', '370000', '山东省', '371400', '德州市', '371402', '德城区', '0', '壳牌', '', '', '37140000397');
INSERT INTO zsys_oil_station VALUES ('1149', '壳牌德州市运河大道加油站', '德州市运河大道加油站', '德州市运河大道加油站', '', '3', '15806819696', '0', '1149', null, null, '2019-09-29 08:18:12', '1', '116.154200', '37.271200', '370000', '山东省', '371400', '德州市', '371402', '德城区', '0', '壳牌', '', '', '37140000398');
INSERT INTO zsys_oil_station VALUES ('1150', '中石油德州通力路加油站', '德州通力路加油站', '德州通力路加油站', '', '1', '15069223322', '0', '1150', null, null, '2019-09-29 08:18:13', '1', '116.154400', '37.275500', '370000', '山东省', '371400', '德州市', '371402', '德城区', '0', '中石油', '', '', '37140000347');
INSERT INTO zsys_oil_station VALUES ('1151', '中石油德州晶华大道加油站', '德州晶华大道加油站', '德州晶华大道加油站', '', '1', '15910077222', '0', '1151', null, null, '2019-09-29 08:18:13', '1', '116.222500', '37.274900', '370000', '山东省', '371400', '德州市', '371402', '德城区', '0', '中石油', '', '', '37140000363');
INSERT INTO zsys_oil_station VALUES ('1152', '中石油德州市天衢东路加油站', '德州市天衢东路加油站', '德州市天衢东路加油站', '', '1', '13953474927', '0', '1152', null, null, '2019-09-29 08:18:13', '1', '116.201200', '37.271100', '370000', '山东省', '371400', '德州市', '371402', '德城区', '0', '中石油', '', '', '37140000344');
INSERT INTO zsys_oil_station VALUES ('1153', '中石油德州市中原加油站', '德州市中原加油站', '德州市中原加油站', '', '1', '13853452721', '0', '1153', null, null, '2019-09-29 08:18:13', '1', '116.182600', '37.272700', '370000', '山东省', '371400', '德州市', '371402', '德城区', '0', '中石油', '', '', '37140000348');
INSERT INTO zsys_oil_station VALUES ('1154', '壳牌德州市宁津县阳光大街加油站', '德州市宁津县阳光大街加油站', '德州市宁津县阳光大街加油站', '', '3', '13805349060', '0', '1154', null, null, '2019-09-29 08:18:13', '1', '116.460900', '37.383100', '370000', '山东省', '371400', '德州市', '371422', '宁津县', '0', '壳牌', '', '', '37140000400');
INSERT INTO zsys_oil_station VALUES ('1155', '壳牌德州市宁津县西外环加油站', '德州市宁津县西外环加油站', '德州市宁津县西外环加油站', '', '3', '13805349060', '0', '1155', null, null, '2019-09-29 08:18:13', '1', '116.462300', '37.393900', '370000', '山东省', '371400', '德州市', '371422', '宁津县', '0', '壳牌', '', '', '37140000408');
INSERT INTO zsys_oil_station VALUES ('1156', '壳牌德州市乐陵县枣城大街加油站', '德州市乐陵县枣城大街加油站', '德州市乐陵县枣城大街加油站', '', '3', '15066563881', '0', '1156', null, null, '2019-09-29 08:18:14', '1', '117.121000', '37.450300', '370000', '山东省', '371400', '德州市', '371481', '乐陵市', '0', '壳牌', '', '', '37140000407');
INSERT INTO zsys_oil_station VALUES ('1157', '壳牌德州市陵城区陵州路加油站', '德州市陵城区陵州路加油站', '德州市陵城区陵州路加油站', '', '3', '18005345011', '0', '1157', null, null, '2019-09-29 08:18:14', '1', '116.353900', '37.193900', '370000', '山东省', '371400', '德州市', '371403', '陵城区', '0', '壳牌', '', '', '37140000405');
INSERT INTO zsys_oil_station VALUES ('1158', '中石油德州市205国道加油站', '德州市205国道加油站', '德州市205国道加油站', '', '1', '15275345888', '0', '1158', null, null, '2019-09-29 08:18:14', '1', '116.175800', '37.233100', '370000', '山东省', '371400', '德州市', '371402', '德城区', '0', '中石油', '', '', '37140000350');
INSERT INTO zsys_oil_station VALUES ('1159', '壳牌德州市武城县加油站', '德州市武城县加油站', '德州市武城县加油站', '', '3', '18905346663', '0', '1159', null, null, '2019-09-29 08:18:14', '1', '116.045700', '37.131800', '370000', '山东省', '371400', '德州市', '371428', '武城县', '0', '壳牌', '', '', '37140000402');
INSERT INTO zsys_oil_station VALUES ('1160', '中石油德州市夏津县双庙镇加油站', '德州市夏津县双庙镇加油站', '德州市夏津县双庙镇加油站', '', '1', '18253440279', '0', '1160', null, null, '2019-09-29 08:18:14', '1', '115.561900', '36.575800', '370000', '山东省', '371400', '德州市', '371427', '夏津县', '0', '中石油', '', '', '37140000346');
INSERT INTO zsys_oil_station VALUES ('1162', '廊坊市大城南赵扶壳牌加油站', '廊坊市大城南赵扶壳牌加油站', '河北省廊坊市大城县赵扶村', '', '3', '18630675649', '0', '1162', null, null, '2019-09-29 08:18:14', '1', '116.701303', '38.693208', '130000', '河北省', '131000', '廊坊市', '131025', '大城县', '0', '壳牌', '', '', '13100000036');
INSERT INTO zsys_oil_station VALUES ('1163', '廊坊霸州煎茶铺壳牌加油站', '廊坊霸州煎茶铺壳牌加油站', '河北省廊坊市霸州煎茶铺镇西间道口往西100米', '', '3', '15369633372', '0', '1163', null, null, '2019-09-29 08:18:15', '1', '116.521662', '39.118799', '130000', '河北省', '131000', '廊坊市', '131081', '霸州市', '0', '壳牌', '', '', '13100000027');
INSERT INTO zsys_oil_station VALUES ('1164', '廊坊霸州共同壳牌加油站', '廊坊霸州共同壳牌加油站', '河北省廊坊市霸州市堂二里镇十街112国道42公里路南', '', '3', '18532317775', '0', '1164', null, null, '2019-09-29 08:18:15', '1', '116.750244', '39.151294', '130000', '河北省', '131000', '廊坊市', '131081', '霸州市', '0', '壳牌', '', '', '13100000019');
INSERT INTO zsys_oil_station VALUES ('1165', '廊坊霸州圣信壳牌加油站', '廊坊霸州圣信壳牌加油站', '河北省廊坊市霸州杨各庄112国道岔道口北侧', '', '3', '13722466540', '0', '1165', null, null, '2019-09-29 08:18:15', '1', '116.622620', '39.130768', '130000', '河北省', '131000', '廊坊市', '131081', '霸州市', '0', '壳牌', '', '', '13100000015');
INSERT INTO zsys_oil_station VALUES ('1166', '廊坊文安县赵各庄壳牌加油站', '廊坊文安县赵各庄壳牌加油站', '河北省廊坊市文安县赵各庄镇文静公路北侧', '', '3', '13231692058', '0', '1166', null, null, '2019-09-29 08:18:16', '1', '116.376728', '38.892612', '130000', '河北省', '131000', '廊坊市', '131026', '文安县', '0', '壳牌', '', '', '13100000032');
INSERT INTO zsys_oil_station VALUES ('1167', '廊坊霸州辛章万里壳牌加油站', '廊坊霸州辛章万里壳牌加油站', '河北省廊坊市霸州市胜芳镇辛章村新绣园小区对面', '', '3', '18630799019', '0', '1167', null, null, '2019-09-29 08:18:16', '1', '116.788602', '39.092157', '130000', '河北省', '131000', '廊坊市', '131081', '霸州市', '0', '壳牌', '', '', '13100000034');
INSERT INTO zsys_oil_station VALUES ('1168', '廊坊霸州港联壳牌加油站', '廊坊霸州港联壳牌加油站', '河北省霸州市廊大路东段乡徐柳村东', '', '3', '18532317775', '0', '1168', null, null, '2019-09-29 08:18:16', '1', '116.733557', '39.135983', '130000', '河北省', '131000', '廊坊市', '131081', '霸州市', '0', '壳牌', '', '', '13100000020');
INSERT INTO zsys_oil_station VALUES ('1169', '廊坊文安县德归港联壳牌加油站', '廊坊文安县德归港联壳牌加油站', '河北省廊坊文安县德归村东文静公路北侧', '', '3', '13820040653', '0', '1169', null, null, '2019-09-29 08:18:16', '1', '116.622141', '39.023217', '130000', '河北省', '131000', '廊坊市', '131026', '文安县', '0', '壳牌', '', '', '13100000025');
INSERT INTO zsys_oil_station VALUES ('1171', '廊坊霸州胜芳东环壳牌加油站', '廊坊霸州胜芳东环壳牌加油站', '河北省廊坊市霸州市东段乡石家堡村胜芳东环路西侧', '', '3', '18630799019', '0', '1171', null, null, '2019-09-29 08:18:17', '1', '116.756599', '39.099459', '130000', '河北省', '131000', '廊坊市', '131081', '霸州市', '0', '壳牌', '', '', '13100000033');
INSERT INTO zsys_oil_station VALUES ('1172', '廊坊文安新镇丰润壳牌加油站', '廊坊文安新镇丰润壳牌加油站', '河北省廊坊市文安县新镇供销社院内', '', '3', '18000630701', '0', '1172', null, null, '2019-09-29 08:18:17', '1', '116.368248', '39.003677', '130000', '河北省', '131000', '廊坊市', '131026', '文安县', '0', '壳牌', '', '', '13100000026');
INSERT INTO zsys_oil_station VALUES ('1173', '廊坊文安县左各庄壳牌加油站', '廊坊文安县左各庄壳牌加油站', '河北省廊坊市文安县左各庄镇文胜公路与廊大路交叉口', '', '3', '13820040653', '0', '1173', null, null, '2019-09-29 08:18:17', '1', '116.655653', '39.016639', '130000', '河北省', '131000', '廊坊市', '131026', '文安县', '0', '壳牌', '', '', '13100000021');
INSERT INTO zsys_oil_station VALUES ('1174', '广饶县正达加油站', '广饶正达油站', '广饶大王镇东青高速入口东（潍高路南侧）', '', null, '15066056573', '0', '1174', null, null, '2019-09-29 08:18:17', '1', '118.547160', '36.967520', '370000', '山东省', '370500', '东营市', '370523', '广饶县', '0', '其它', '', '', '37050000101');
INSERT INTO zsys_oil_station VALUES ('1175', '淄博信继经贸有限公司', '淄博周村信继油站', '淄博市周村区兴鲁大道3700号（北郊镇仇家村南）', '', null, '​15953336007', '0', '1175', null, null, '2019-09-29 08:18:18', '1', '117.902740', '36.832360', '370000', '山东省', '370300', '淄博市', '370306', '周村区', '0', '其它', '', '', '37030000196');
INSERT INTO zsys_oil_station VALUES ('1176', '廊坊霸州东环路壳牌加油站', '廊坊霸州东环路壳牌加油站', '河北省廊坊市霸州市东环路起亚4S店对面', '', '3', '15076664466', '0', '1176', null, null, '2019-09-29 08:18:18', '1', '116.433704', '39.138395', '130000', '河北省', '131000', '廊坊市', '131081', '霸州市', '0', '壳牌', '', '', '13100000029');
INSERT INTO zsys_oil_station VALUES ('1180', '廊坊永清县里澜城壳牌加油站', '廊坊永清县里澜城壳牌加油站', '河北省廊坊市永清县里澜城南', '', '3', '13292600918', '0', '1180', null, null, '2019-09-29 08:18:18', '1', '116.733795', '39.198546', '130000', '河北省', '131000', '廊坊市', '131023', '永清县', '0', '壳牌', '', '', '13100000016');
INSERT INTO zsys_oil_station VALUES ('1181', '廊坊市永清县龙虎庄壳牌加油站', '廊坊市永清县龙虎庄壳牌加油站', '河北省廊坊市永清县龙虎庄乡东口路东', '', '3', '13292600918', '0', '1181', null, null, '2019-09-29 08:18:19', '1', '116.442070', '39.239338', '130000', '河北省', '131000', '廊坊市', '131023', '永清县', '0', '壳牌', '', '', '13100000018');
INSERT INTO zsys_oil_station VALUES ('1182', '廊坊永清县顺达壳牌加油站', '廊坊永清县顺达壳牌加油站', '河北省廊坊市永清县北外环', '', '3', '18632695585', '0', '1182', null, null, '2019-09-29 08:18:19', '1', '116.503800', '39.341266', '130000', '河北省', '131000', '廊坊市', '131023', '永清县', '0', '壳牌', '', '', '13100000013');
INSERT INTO zsys_oil_station VALUES ('1183', '廊坊永清县韩村华通壳牌加油站', '廊坊永清县韩村华通壳牌加油站', '河北省廊坊市永清县东苑家务村村西路北', '', '3', '13131610010', '0', '1183', null, null, '2019-09-29 08:18:19', '1', '116.641565', '39.433891', '130000', '河北省', '131000', '廊坊市', '131023', '永清县', '0', '壳牌', '', '', '13090000038');
INSERT INTO zsys_oil_station VALUES ('1184', '廊坊市安次区廊大路益通壳牌加油站', '廊坊市安次区廊大路益通壳牌加油站', '河北省廊坊市安次区廊大公路229号', '', '3', '13785626608', '0', '1184', null, null, '2019-09-29 08:18:19', '1', '116.711921', '39.475791', '130000', '河北省', '131000', '廊坊市', '131002', '安次区', '0', '壳牌', '', '', '13090000037');
INSERT INTO zsys_oil_station VALUES ('1185', '廊坊市广阳区光明西道壳牌加油站', '廊坊市广阳区光明西道壳牌加油站', '河北省廊坊市广阳区269号', '', '3', '18632695585', '0', '1185', null, null, '2019-09-29 08:18:19', '1', '116.643830', '39.516515', '130000', '河北省', '131000', '廊坊市', '131003', '广阳区', '0', '壳牌', '', '', '13100000039');
INSERT INTO zsys_oil_station VALUES ('1186', '廊坊固安凯达壳牌加油站', '廊坊固安凯达壳牌加油站', '河北省廊坊市固安县柳泉镇106国道西侧', '', '3', '13393060869', '0', '1186', null, null, '2019-09-29 08:18:20', '1', '116.323565', '39.368537', '130000', '河北省', '131000', '廊坊市', '131022', '固安县', '0', '壳牌', '', '', '13100000022');
INSERT INTO zsys_oil_station VALUES ('1187', '廊坊固安通力壳牌加油站', '廊坊固安通力壳牌加油站', '河北省廊坊市固安县柳泉镇106国道边', '', '3', '15930668968', '0', '1187', null, null, '2019-09-29 08:18:20', '1', '116.336892', '39.344110', '130000', '河北省', '131000', '廊坊市', '131022', '固安县', '0', '壳牌', '', '', '13100000037');
INSERT INTO zsys_oil_station VALUES ('1189', '廊坊固安大龙堂壳牌加油站', '廊坊固安大龙堂壳牌加油站', '河北省廊坊市固安县城关镇县医院南500米路西', '', '3', '15931644762', '0', '1189', null, null, '2019-09-29 08:18:20', '1', '116.293903', '39.423751', '130000', '河北省', '131000', '廊坊市', '131022', '固安县', '0', '壳牌', '', '', '13100000031');
INSERT INTO zsys_oil_station VALUES ('1190', '廊坊固安天义壳牌加油站', '廊坊固安天义壳牌加油站', '河北省廊坊市固安县马庄镇后狄村壳牌加油站', '', '3', '13393060869', '0', '1190', null, null, '2019-09-29 08:18:20', '1', '116.275352', '39.140274', '130000', '河北省', '131000', '廊坊市', '131022', '固安县', '0', '壳牌', '', '', '13100000024');
INSERT INTO zsys_oil_station VALUES ('1191', '廊坊霸州世纪石化壳牌加油站', '廊坊霸州世纪石化壳牌加油站', '河北省廊坊市霸州市霸州南头京广中路东侧', '', '3', '13603362700', '0', '1191', null, null, '2019-09-29 08:18:21', '1', '116.397475', '39.097288', '130000', '河北省', '131000', '廊坊市', '131081', '霸州市', '0', '壳牌', '', '', '13100000014');
INSERT INTO zsys_oil_station VALUES ('1193', '秦皇岛市北部工业区壳牌加油站', '秦皇岛市北部工业区壳牌加油站', '河北省秦皇岛市北港大街与江旗北路交叉口和北小区东北', '', '3', '15003343323', '0', '1193', null, null, '2019-09-29 08:18:21', '1', '119.592383', '39.981228', '130000', '河北省', '130300', '秦皇岛市', '130302', '海港区', '0', '壳牌', '', '', '13030000027');
INSERT INTO zsys_oil_station VALUES ('1195', '秦皇岛市北戴河区秦皇岛抚宁加油站', '秦皇岛市北戴河区秦皇岛抚宁加油站', '河北省秦皇岛市抚宁县牛头崖镇205国道南', '', '3', '15003343323', '0', '1195', null, null, '2019-09-29 08:18:21', '1', '119.384479', '39.828532', '130000', '河北省', '130300', '秦皇岛市', '130304', '北戴河区', '0', '壳牌', '', '', '13030000028');
INSERT INTO zsys_oil_station VALUES ('1196', '秦皇岛市山海关区壳牌加油站', '秦皇岛市山海关区壳牌加油站', '河北省秦皇岛市山海关区人事局以北老龙头路以东', '', '3', '18031661898', '0', '1196', null, null, '2019-09-29 08:18:21', '1', '119.780631', '39.990900', '130000', '河北省', '130300', '秦皇岛市', '130303', '山海关区', '0', '壳牌', '', '', '13030000026');
INSERT INTO zsys_oil_station VALUES ('1199', '潍莱高速平度服务北区中石化加油站', '平度服务北区中石化加油站', '山东省青岛市平度市店子镇荣潍高速公路北', '', '2', '13361270330', '0', '1199', null, null, '2019-09-29 08:18:22', '1', '120.007366', '36.813464', '370000', '山东省', '370200', '青岛市', '370283', '平度市', '1', '中国石化', 'S16', '潍莱高速', '37020000782');
INSERT INTO zsys_oil_station VALUES ('1200', '潍莱高速平度服务南区中石化加油站', '平度服务南区中石化加油站', '山东省青岛市平度市店子镇荣潍高速公路南', '', '2', '13361270330', '0', '1200', null, null, '2019-09-29 08:18:22', '1', '120.006817', '36.812686', '370000', '山东省', '370200', '青岛市', '370283', '平度市', '1', '中国石化', 'S16', '潍莱高速', '37020000781');
INSERT INTO zsys_oil_station VALUES ('1201', '青岛盛源发加油站有限公司', '盛源发加油站', '山东省青岛市市北区孟庄路25号 ', '', null, '15762265175', '0', '1201', null, null, '2019-09-29 08:18:22', '1', '120.352067', '36.099458', '370000', '山东省', '370200', '青岛市', '370203', '市北区', '0', '海源发', '', '', '37020000648');
INSERT INTO zsys_oil_station VALUES ('1204', '沧州壳牌肃宁乾盛加油站', '肃宁乾盛加油站', '肃宁县清园街南头泽成路南侧', 'https://oss.etcsd.com/object/5cb54cc6549ecdf1d78c0b9e', '3', '18634059333', '0', '1204', null, null, '2019-09-29 08:18:22', '1', '115.835901', '38.422764', '130000', '河北省', '130900', '沧州市', '130926', '肃宁县', '0', '壳牌', '', '', '13090000016');
INSERT INTO zsys_oil_station VALUES ('1205', '沧州壳牌辛中驿加油站', '辛中驿加油站', '河北省任丘市辛中驿村106国道西侧', 'https://oss.etcsd.com/object/5cb54cc7a055fa236fb328c4', '3', '18632718360', '0', '1205', null, null, '2019-09-29 08:18:22', '1', '116.080167', '38.591452', '130000', '河北省', '130900', '沧州市', '130982', '任丘市', '0', '壳牌', '', '', '13090000013');
INSERT INTO zsys_oil_station VALUES ('1206', '沧州壳牌京开北道加油站', '京开北道加油站', '任丘市北环路中华路办事处对面壳牌加油站 ', 'https://oss.etcsd.com/object/5cb54cc8a055fa236fb328ca', '3', '18632705393', '0', '1206', null, null, '2019-09-29 08:18:22', '1', '116.126055', '38.744073', '130000', '河北省', '130900', '沧州市', '130982', '任丘市', '0', '壳牌', '', '', '13090000015');
INSERT INTO zsys_oil_station VALUES ('1207', '沧州壳牌任丘北环路加油站', '任丘北环路加油站', '任丘市北环路西凉村', 'https://oss.etcsd.com/object/5cb54ccaa055fa236fb328d1', '3', '13672142245', '0', '1207', null, null, '2019-09-29 08:18:22', '1', '116.094023', '38.738749', '130000', '河北省', '130900', '沧州市', '130982', '任丘市', '0', '壳牌', '', '', '13090000017');
INSERT INTO zsys_oil_station VALUES ('1208', '沧州壳牌黄骅滕庄子加油站', '黄骅滕庄子加油站', '黄骅市滕庄子乡307国道北侧', 'https://oss.etcsd.com/object/5cb54ccb549ecdf1d78c0ba8', '3', '15632789993', '0', '1208', null, null, '2019-09-29 08:18:23', '1', '117.198718', '38.362411', '130000', '河北省', '130900', '沧州市', '130983', '黄骅市', '0', '壳牌', '', '', '13090000018');
INSERT INTO zsys_oil_station VALUES ('1209', '沧州壳牌泊头开发区加油站', '泊头开发区加油站', '泊头市开发区正港路南侧', 'https://oss.etcsd.com/object/5cb54ccc549ecdf1d78c0bae', '3', '13333078533', '0', '1209', null, null, '2019-09-29 08:18:23', '1', '116.635623', '38.075132', '130000', '河北省', '130900', '沧州市', '130981', '泊头市', '0', '壳牌', '', '', '13090000019');
INSERT INTO zsys_oil_station VALUES ('1210', '沧州壳牌任丘出岸加油站', '任丘出岸加油站', '任丘市出岸镇 津保公路北侧', 'https://oss.etcsd.com/object/5cb54ccc549ecdf1d78c0bb4', '3', '13103071101', '0', '1210', null, null, '2019-09-29 08:18:23', '1', '116.021329', '38.695134', '130000', '河北省', '130900', '沧州市', '130982', '任丘市', '0', '壳牌', '', '', '13090000020');
INSERT INTO zsys_oil_station VALUES ('1211', '沧州壳牌泊头交河加油站', '泊头交河加油站', '泊头市交河镇新华东路（磷肥厂西50米，302省道上）', '', '3', '18903176189', '0', '1211', null, null, '2019-09-29 08:18:23', '1', '116.323262', '38.038047', '130000', '河北省', '130900', '沧州市', '130981', '泊头市', '0', '壳牌', '', '', '13090000021');
INSERT INTO zsys_oil_station VALUES ('1212', '沧州壳牌冯家口加油站', '冯家口加油站', '南皮冯家口镇104国道东侧', 'https://oss.etcsd.com/object/5cb54cce549ecdf1d78c0bb9', '3', '13313378899', '0', '1212', null, null, '2019-09-29 08:18:24', '1', '116.756466', '38.173289', '130000', '河北省', '130900', '沧州市', '130927', '南皮县', '0', '壳牌', '', '', '13090000022');
INSERT INTO zsys_oil_station VALUES ('1213', '沧州壳牌黄骅奥达加油站', '黄骅奥达加油站', '黄骅市205国道齐家务收费站南200米                                         ', 'https://oss.etcsd.com/object/5cb54ccfa055fa236fb328d7', '3', '15632789993', '0', '1213', null, null, '2019-09-29 08:18:24', '1', '117.198538', '38.552237', '130000', '河北省', '130900', '沧州市', '130983', '黄骅市', '0', '壳牌', '', '', '13090000023');
INSERT INTO zsys_oil_station VALUES ('1214', '沧州壳牌风化店嘉成加油站', '风化店嘉成加油站', '沧县沧盐路石黄高速沧州东出口北侧', 'https://oss.etcsd.com/object/5cb54cd0a055fa236fb328de', '3', '13722471725', '0', '1214', null, null, '2019-09-29 08:18:24', '1', '116.980101', '38.247932', '130000', '河北省', '130900', '沧州市', '130921', '沧县', '0', '壳牌', '', '', '13090000024');
INSERT INTO zsys_oil_station VALUES ('1215', '沧州壳牌崔尔庄加油站', '崔尔庄加油站', '沧县崔尔庄景成村307国道，通献县方向南侧', 'https://oss.etcsd.com/object/5cb54cd1a055fa236fb328e4', '3', '13363160643', '0', '1215', null, null, '2019-09-29 08:18:24', '1', '116.527746', '38.286719', '130000', '河北省', '130900', '沧州市', '130921', '沧县', '0', '壳牌', '', '', '13090000025');
INSERT INTO zsys_oil_station VALUES ('1216', '沧州壳牌河间曙光路加油站', '河间曙光路加油站', '河间市曙光西路与106国道交叉口东北角         ', 'https://oss.etcsd.com/object/5cb54cd2549ecdf1d78c0bc1', '3', '15933176371', '0', '1216', null, null, '2019-09-29 08:18:24', '1', '116.074920', '38.456373', '130000', '河北省', '130900', '沧州市', '130984', '河间市', '0', '壳牌', '', '', '13090000026');
INSERT INTO zsys_oil_station VALUES ('1217', '沧州壳牌沧州青县东环南路加油站', '沧州青县东环南路加油站', '青县东环南路金百合商务会馆旁边', 'https://oss.etcsd.com/object/5cb54cd3a055fa236fb328ea', '3', '13722748632', '0', '1217', null, null, '2019-09-29 08:18:25', '1', '116.856828', '38.578179', '130000', '河北省', '130900', '沧州市', '130922', '青县', '0', '壳牌', '', '', '13090000027');
INSERT INTO zsys_oil_station VALUES ('1218', '沧州壳牌肃宁站前街加油站', '肃宁站前街加油站', '肃宁站前街九龙柱路口旁', 'https://oss.etcsd.com/object/5cb54cd4549ecdf1d78c0bc7', '3', '18634059333', '0', '1218', null, null, '2019-09-29 08:18:25', '1', '115.862815', '38.430158', '130000', '河北省', '130900', '沧州市', '130926', '肃宁县', '0', '壳牌', '', '', '13090000029');
INSERT INTO zsys_oil_station VALUES ('1219', '沧州壳牌河间京开路(长虹)加油站', '河间京开路(长虹)加油站', '河间市君子馆村106国道166公里处壳牌加油站', 'https://oss.etcsd.com/object/5cb54cd6549ecdf1d78c0bd0', '3', '18632718360', '0', '1219', null, null, '2019-09-29 08:18:25', '1', '116.092152', '38.552303', '130000', '河北省', '130900', '沧州市', '130984', '河间市', '0', '壳牌', '', '', '13090000030');
INSERT INTO zsys_oil_station VALUES ('1220', '沧州壳牌茶棚村加油站', '茶棚村加油站', '沧县杜林镇沧保路右侧茶棚村', 'https://oss.etcsd.com/object/5cb54cd8a055fa236fb328f0', '3', '13785486573', '0', '1220', null, null, '2019-09-29 08:18:25', '1', '116.710268', '38.362790', '130000', '河北省', '130900', '沧州市', '130921', '沧县', '0', '壳牌', '', '', '13090000031');
INSERT INTO zsys_oil_station VALUES ('1221', '沧州壳牌津保公路（任丘西环）加油站', '津保公路（任丘西环）加油站', '任丘106国道西侧西客运站北侧', 'https://oss.etcsd.com/object/5cb54cd9549ecdf1d78c0bd8', '3', '18632705393', '0', '1221', null, null, '2019-09-29 08:18:26', '1', '116.086384', '38.708349', '130000', '河北省', '130900', '沧州市', '130982', '任丘市', '0', '壳牌', '', '', '13090000032');
INSERT INTO zsys_oil_station VALUES ('1222', '沧州壳牌南皮金峰加油站', '南皮金峰加油站', '南皮县医院路北南冯路西侧壳牌加油站', 'https://oss.etcsd.com/object/5cb54cdba055fa236fb328f8', '3', '18631742568', '0', '1222', null, null, '2019-09-29 08:18:26', '1', '116.716594', '38.062159', '130000', '河北省', '130900', '沧州市', '130927', '南皮县', '0', '壳牌', '', '', '13090000033');
INSERT INTO zsys_oil_station VALUES ('1223', '沧州壳牌李天木加油站', '李天木加油站', '沧县李天木乡307国道壳牌加油站', 'https://oss.etcsd.com/object/5cb54cdc549ecdf1d78c0bde', '3', '18903176189', '0', '1223', null, null, '2019-09-29 08:18:26', '1', '117.050915', '38.335737', '130000', '河北省', '130900', '沧州市', '130921', '沧县', '0', '壳牌', '', '', '13090000034');
INSERT INTO zsys_oil_station VALUES ('1224', '沧州壳牌海河西路加油站', '海河西路加油站', '河北省沧州市朝阳路与海河西路交叉口（运河区）', 'https://oss.etcsd.com/object/5cb54cdea055fa236fb32900', '3', '13303065988', '0', '1224', null, null, '2019-09-29 08:18:26', '1', '116.843675', '38.279270', '130000', '河北省', '130900', '沧州市', '130903', '运河区', '0', '壳牌', '', '', '13090000035');
INSERT INTO zsys_oil_station VALUES ('1225', '沧州壳牌沧州铁西大街（华亚）加油站', '沧州铁西大街（华亚）加油站', '沧州市新华区铁西大街（新华区）', 'https://oss.etcsd.com/object/5cb54ce0a055fa236fb32909', '3', '13785486573', '0', '1225', null, null, '2019-09-29 08:18:27', '1', '116.880617', '38.305218', '130000', '河北省', '130900', '沧州市', '130902', '新华区', '0', '壳牌', '', '', '13090000036');
INSERT INTO zsys_oil_station VALUES ('1226', '唐山壳牌缸窑路加油站', '缸窑路加油站', '缸窑路84号（路北区）', 'https://oss.etcsd.com/object/5cb54ce3a055fa236fb32912', '3', '15931571983', '0', '1226', null, null, '2019-09-29 08:18:27', '1', '118.220044', '39.679798', '130000', '河北省', '130200', '唐山市', '130203', '路北区', '0', '壳牌', '', '', '13020000003');
INSERT INTO zsys_oil_station VALUES ('1227', '唐山壳牌滦南扒齿港油站（鑫港）加油站', '滦南扒齿港油站（鑫港）加油站', '唐山市滦南县扒齿港镇镇中心', 'https://oss.etcsd.com/object/5cb54ce6549ecdf1d78c0be5', '3', '18631591830', '0', '1227', null, null, '2019-09-29 08:18:27', '1', '118.576333', '39.551548', '130000', '河北省', '130200', '唐山市', '130224', '滦南县', '0', '壳牌', '', '', '13020000005');
INSERT INTO zsys_oil_station VALUES ('1229', '唐山壳牌滦县西坨子头油站（中玉）加油站', '滦县西坨子头油站（中玉）加油站', '唐山市滦县西坨头子村北', 'https://oss.etcsd.com/object/5cb54ce8a055fa236fb3291e', '3', '18633336177', '0', '1229', null, null, '2019-09-29 08:18:27', '1', '118.683759', '39.760416', '130000', '河北省', '130200', '唐山市', '130223', '滦县', '0', '壳牌', '', '', '13020000006');
INSERT INTO zsys_oil_station VALUES ('1230', '唐山壳牌丰南大新庄（新港）加油站', '丰南大新庄（新港）加油站', '唐山市丰南区大新庄镇薄港村北', 'https://oss.etcsd.com/object/5cb54ceaa055fa236fb32929', '3', '15832548718', '0', '1230', null, null, '2019-09-29 08:18:27', '1', '118.328793', '39.444807', '130000', '河北省', '130200', '唐山市', '130207', '丰南区', '0', '壳牌', '', '', '13020000007');
INSERT INTO zsys_oil_station VALUES ('1231', '唐山壳牌滦县响堂镇阎庄（永明）加油站', '滦县响堂镇阎庄（永明）加油站', '唐山市滦县响堂镇阎庄', 'https://oss.etcsd.com/object/5cb54ced549ecdf1d78c0bee', '3', '18633336177', '0', '1231', null, null, '2019-09-29 08:18:28', '1', '118.795413', '39.653555', '130000', '河北省', '130200', '唐山市', '130223', '滦县', '0', '壳牌', '', '', '13020000008');
INSERT INTO zsys_oil_station VALUES ('1232', '唐山壳牌唐山市卫国路（北安达）加油站', '卫国路（北安达）加油站', '唐山市路北区卫国路西侧、朝阳道南副路南侧', 'https://oss.etcsd.com/object/5cb54cf0a055fa236fb32933', '3', '17731587923', '0', '1232', null, null, '2019-09-29 08:18:28', '1', '118.170873', '39.661299', '130000', '河北省', '130200', '唐山市', '130203', '路北区', '0', '壳牌', '', '', '13020000009');
INSERT INTO zsys_oil_station VALUES ('1233', '唐山壳牌玉田亮甲店镇（华信）加油站', '玉田亮甲店镇（华信）加油站', '唐山市玉田县亮甲店镇东', '', '3', '13752762805', '0', '1233', null, null, '2019-09-29 08:18:28', '1', '117.921582', '39.878183', '130000', '河北省', '130200', '唐山市', '130229', '玉田县', '0', '壳牌', '', '', '13020000010');
INSERT INTO zsys_oil_station VALUES ('1234', '唐山壳牌南堡开发区世纪大道加油站(南堡外环)加油站', '世纪大道加油站(南堡外环)加油站', '唐山市南堡开发区8号路', 'https://oss.etcsd.com/object/5cb54cf2a055fa236fb3293f', '3', '15832548718', '0', '1234', null, null, '2019-09-29 08:18:29', '1', '118.218571', '39.265133', '130000', '河北省', '130200', '唐山市', '130209', '曹妃甸区', '0', '壳牌', '', '', '13020000011');
INSERT INTO zsys_oil_station VALUES ('1236', '唐山壳牌滦南宋道口加油站（照升）加油站', '滦南宋道口加油站（照升）加油站', '唐山市滦南县宋道口镇李土村', 'https://oss.etcsd.com/object/5cb54cf2549ecdf1d78c0bf9', '3', '18633405566', '0', '1236', null, null, '2019-09-29 08:18:29', '1', '118.750882', '39.519761', '130000', '河北省', '130200', '唐山市', '130224', '滦南县', '0', '壳牌', '', '', '13020000012');
INSERT INTO zsys_oil_station VALUES ('1237', '唐山壳牌丰润常庄加油站（福兴）加油站', '丰润常庄加油站（福兴）加油站', '唐山市丰润区银河路东侧、常一村西侧', 'https://oss.etcsd.com/object/5cb54cf6549ecdf1d78c0bfb', '3', '18131562285', '0', '1237', null, null, '2019-09-29 08:18:29', '1', '118.216455', '39.792293', '130000', '河北省', '130200', '唐山市', '130208', '丰润区', '0', '壳牌', '', '', '13020000013');
INSERT INTO zsys_oil_station VALUES ('1238', '唐山壳牌丰润丰韩路（胜达）加油站', '丰润丰韩路（胜达）加油站', '唐山市丰润区丰润镇那母庄村北', 'https://oss.etcsd.com/object/5cb54cf9a055fa236fb32949', '3', '18931588902', '0', '1238', null, null, '2019-09-29 08:18:29', '1', '118.124003', '39.789869', '130000', '河北省', '130200', '唐山市', '130208', '丰润区', '0', '壳牌', '', '', '13020000014');
INSERT INTO zsys_oil_station VALUES ('1239', '唐山壳牌开平唐古路加油站（津唐）加油站', '唐古路加油站（津唐）加油站', '唐山市开平区唐古路西帅甲村北', 'https://oss.etcsd.com/object/5cb54cfd549ecdf1d78c0c09', '3', '18531735980', '0', '1239', null, null, '2019-09-29 08:18:29', '1', '118.312218', '39.692155', '130000', '河北省', '130200', '唐山市', '130205', '开平区', '0', '壳牌', '', '', '13020000015');
INSERT INTO zsys_oil_station VALUES ('1240', '唐山壳牌古冶古榛路加油站（宏竟）加油站', '古冶古榛路加油站（宏竟）加油站', '唐山市古冶区古榛路南段西侧 ', '', '3', '15511551630', '0', '1240', null, null, '2019-09-29 08:18:30', '1', '118.438369', '39.749560', '130000', '河北省', '130200', '唐山市', '130204', '古冶区', '0', '壳牌', '', '', '13020000016');
INSERT INTO zsys_oil_station VALUES ('1241', '唐山壳牌遵化大桥加油站', '遵化大桥加油站', '河北省遵化市北二环东路北侧', 'https://oss.etcsd.com/object/5cb54d00a055fa236fb32955', '3', '13832900602', '0', '1241', null, null, '2019-09-29 08:18:30', '1', '117.997254', '40.209033', '130000', '河北省', '130200', '唐山市', '130281', '遵化市', '0', '壳牌', '', '', '13020000017');
INSERT INTO zsys_oil_station VALUES ('1242', '唐山壳牌丰南钱营镇加油站（金鑫）加油站', '丰南钱营镇加油站（金鑫）加油站', '唐山市丰南区钱营镇政府对面', 'https://oss.etcsd.com/object/5cb54d03549ecdf1d78c0c17', '3', '13303054447', '0', '1242', null, null, '2019-09-29 08:18:30', '1', '118.353255', '39.586951', '130000', '河北省', '130200', '唐山市', '130207', '丰南区', '0', '壳牌', '', '', '13020000018');
INSERT INTO zsys_oil_station VALUES ('1243', '唐山壳牌迁西东环路（新颖）加油站', '迁西东环路（新颖）加油站', '唐山市迁西县东环路', 'https://oss.etcsd.com/object/5cb54d06549ecdf1d78c0c23', '3', '15613531888', '0', '1243', null, null, '2019-09-29 08:18:30', '1', '118.334248', '40.156119', '130000', '河北省', '130200', '唐山市', '130227', '迁西县', '0', '壳牌', '', '', '13020000019');
INSERT INTO zsys_oil_station VALUES ('1244', '唐山壳牌滦县站西（站西）加油站', '滦县站西（站西）加油站', '唐山市滦县木材厂西', 'https://oss.etcsd.com/object/5cb54d09a055fa236fb3295f', '3', '18631509937', '0', '1244', null, null, '2019-09-29 08:18:30', '1', '118.732911', '39.763833', '130000', '河北省', '130200', '唐山市', '130223', '滦县', '0', '壳牌', '', '', '13020000020');
INSERT INTO zsys_oil_station VALUES ('1245', '唐山壳牌唐丰路（正兴）加油站', '唐丰路（正兴）加油站', '河北省唐山市唐丰路丰润钢材市场南1公里', 'https://oss.etcsd.com/object/5cb54d0ca055fa236fb3296a', '3', '18631597131', '0', '1245', null, null, '2019-09-29 08:18:31', '1', '118.155226', '39.788638', '130000', '河北省', '130200', '唐山市', '130208', '丰润区', '0', '壳牌', '', '', '13020000021');
INSERT INTO zsys_oil_station VALUES ('1246', '唐山壳牌京唐港友好加油站（滨海路）加油站', '唐港友好加油站', '京唐港海滨路与滨海公路交叉口', 'https://oss.etcsd.com/object/5cb54d10549ecdf1d78c0c2e', '3', '18631588930', '0', '1246', null, null, '2019-09-29 08:18:31', '1', '118.956178', '39.226835', '130000', '河北省', '130200', '唐山市', '130225', '乐亭县', '0', '壳牌', '', '', '13020000023');
INSERT INTO zsys_oil_station VALUES ('1247', '唐山壳牌唐海金鲲加油站（林青公路）加油站', '唐海金鲲加油站', '曹妃甸高速口', 'https://oss.etcsd.com/object/5cb54d13a055fa236fb32975', '3', '15324228444', '0', '1247', null, null, '2019-09-29 08:18:31', '1', '118.403865', '39.185687', '130000', '河北省', '130200', '唐山市', '130209', '曹妃甸区', '0', '壳牌', '', '', '13020000024');
INSERT INTO zsys_oil_station VALUES ('1248', '唐山壳牌迁西顺通加油站(白庙子）加油站', '迁西顺通加油站', '三抚线白庙子，遵化到迁西的收费站靠近迁西一面200米', 'https://oss.etcsd.com/object/5cb54d17a055fa236fb3297f', '3', '15613531888', '0', '1248', null, null, '2019-09-29 08:18:31', '1', '118.293836', '40.184235', '130000', '河北省', '130200', '唐山市', '130227', '迁西县', '0', '壳牌', '', '', '13020000025');
INSERT INTO zsys_oil_station VALUES ('1249', '唐山壳牌遵化东二环加油站（大众）加油站', '遵化东二环加油站', '遵化市东二环南侧', 'https://oss.etcsd.com/object/5cb54d19549ecdf1d78c0c3a', '3', '13832900602', '0', '1249', null, null, '2019-09-29 08:18:32', '1', '117.997036', '40.181485', '130000', '河北省', '130200', '唐山市', '130281', '遵化市', '0', '壳牌', '', '', '13020000026');
INSERT INTO zsys_oil_station VALUES ('1250', '唐山壳牌古冶京山道加油站（京山道）加油站', '古冶京山道加油站', '古冶京山道检察院新址旁', 'https://oss.etcsd.com/object/5cb54d1d549ecdf1d78c0c46', '3', '13363229992', '0', '1250', null, null, '2019-09-29 08:18:32', '1', '118.450737', '39.738654', '130000', '河北省', '130200', '唐山市', '130204', '古冶区', '0', '壳牌', '', '', '13020000027');
INSERT INTO zsys_oil_station VALUES ('1251', '唐山壳牌玉田东环路加油站', '玉田东环路加油站', '河北省唐山市玉田县东关村遵宝公路西', 'https://oss.etcsd.com/object/5cb54d20a055fa236fb3298b', '3', '13933387955', '0', '1251', null, null, '2019-09-29 08:18:32', '1', '117.790556', '39.886058', '130000', '河北省', '130200', '唐山市', '130229', '玉田县', '0', '壳牌', '', '', '13020000028');
INSERT INTO zsys_oil_station VALUES ('1252', '唐山壳牌滦南青坨营加油站（方正）加油站', '滦南青坨营加油站', '唐乐路与迁曹公路交叉口', 'https://oss.etcsd.com/object/5cb54d24a055fa236fb32997', '3', '18631591830', '0', '1252', null, null, '2019-09-29 08:18:32', '1', '118.460357', '39.544003', '130000', '河北省', '130200', '唐山市', '130224', '滦南县', '0', '壳牌', '', '', '13020000029');
INSERT INTO zsys_oil_station VALUES ('1253', '唐山壳牌玉田无终大街（安顺达）加油站', '玉田无终大街（安顺达）加油站', '玉田县彩虹亭桥镇五东里屯', 'https://oss.etcsd.com/object/5cb54d27549ecdf1d78c0c52', '3', '13752762805', '0', '1253', null, null, '2019-09-29 08:18:32', '1', '117.699117', '39.902707', '130000', '河北省', '130200', '唐山市', '130229', '玉田县', '0', '壳牌', '', '', '13020000030');
INSERT INTO zsys_oil_station VALUES ('1254', '唐山壳牌迁安冷大路加油站（众信）加油站', '迁安冷大路加油站', '迁安市迁安镇三李庄村、冷大路东侧', 'https://oss.etcsd.com/object/5cb54d2a549ecdf1d78c0c5d', '3', '15081998669', '0', '1254', null, null, '2019-09-29 08:18:33', '1', '118.733769', '39.982293', '130000', '河北省', '130200', '唐山市', '130283', '迁安市', '0', '壳牌', '', '', '13020000031');
INSERT INTO zsys_oil_station VALUES ('1255', '唐山壳牌曹妃甸迁曹公路东加油站（东城）加油站', '曹妃甸迁曹公路东加油站', '曹妃甸区迁曹公路西城子道口路东', 'https://oss.etcsd.com/object/5cb54d2ea055fa236fb329a2', '3', '18034157222', '0', '1255', null, null, '2019-09-29 08:18:33', '1', '118.474773', '39.310869', '130000', '河北省', '130200', '唐山市', '130209', '曹妃甸区', '0', '壳牌', '', '', '13020000033');
INSERT INTO zsys_oil_station VALUES ('1256', '唐山壳牌曹妃甸迁曹公路西加油站（西信）加油站', '曹妃甸迁曹公路西加油', '曹妃甸区迁曹公路西城子道口路西', 'https://oss.etcsd.com/object/5cb54d30549ecdf1d78c0c68', '3', '18034157222', '0', '1256', null, null, '2019-09-29 08:18:33', '1', '118.502246', '39.322324', '130000', '河北省', '130200', '唐山市', '130209', '曹妃甸区', '0', '壳牌', '', '', '13020000034');
INSERT INTO zsys_oil_station VALUES ('1258', '唐山壳牌滦县贾官营加油站（鑫汇）加油站', '滦县贾官营加油站', '滦县滦州镇贾官营村平青大线以西', 'https://oss.etcsd.com/object/5cb54d31a055fa236fb329ae', '3', '13930513021', '0', '1258', null, null, '2019-09-29 08:18:33', '1', '118.716980', '39.777034', '130000', '河北省', '130200', '唐山市', '130223', '滦县', '0', '壳牌', '', '', '13020000036');
INSERT INTO zsys_oil_station VALUES ('1259', '唐山壳牌古冶古范路加油站（滦中）加油站', '古冶古范路加油站', '古冶区古范路大庄坨派出所南侧', 'https://oss.etcsd.com/object/5cb54d31a055fa236fb329b1', '3', '13363229992', '0', '1259', null, null, '2019-09-29 08:18:34', '1', '118.730125', '39.763726', '130000', '河北省', '130200', '唐山市', '130204', '古冶区', '0', '壳牌', '', '', '13020000037');
INSERT INTO zsys_oil_station VALUES ('1261', '唐山壳牌丰润唐丰路任各庄加油站（丰润长城）加油站', '丰润唐丰路任各庄加油站', '丰润区112国道唐丰路任各庄村北', 'https://oss.etcsd.com/object/5cb54d32549ecdf1d78c0c72', '3', '15097596260', '0', '1261', null, null, '2019-09-29 08:18:34', '1', '118.173606', '39.749672', '130000', '河北省', '130200', '唐山市', '130208', '丰润区', '0', '壳牌', '', '', '13020000039');
INSERT INTO zsys_oil_station VALUES ('1262', '唐山壳牌东环路加油站', '东环路加油站', '唐山市开平区东环路收费站南行200米道西', '', '3', '15512596255', '0', '1262', null, null, '2019-09-29 08:18:34', '1', '118.266725', '39.614231', '130000', '河北省', '130200', '唐山市', '130205', '开平区', '0', '壳牌', '', '', '13020000040');
INSERT INTO zsys_oil_station VALUES ('1263', '唐山壳牌滦县榛子镇加油站（强泰）加油站', '滦县榛子镇加油站', '滦县榛子镇东北侧，余家营村南', 'https://oss.etcsd.com/object/5cb54d32a055fa236fb329b3', '3', '15097596260', '0', '1263', null, null, '2019-09-29 08:18:34', '1', '117.926153', '39.880376', '130000', '河北省', '130200', '唐山市', '130223', '滦县', '0', '壳牌', '', '', '13020000041');
INSERT INTO zsys_oil_station VALUES ('1264', '唐山壳牌南新东道加油站', '南新东道加油站', '唐山市路南区南新东道222号', '', '3', '17713181323', '0', '1264', null, null, '2019-09-29 08:18:34', '1', '118.192112', '39.622376', '130000', '河北省', '130200', '唐山市', '130202', '路南区', '0', '壳牌', '', '', '13020000042');
INSERT INTO zsys_oil_station VALUES ('1265', '唐山壳牌开平开越路加油站（永杰）加油站', '开平开越路加油站', '唐山市开平区开平镇西八里村，唐山市东环路西侧', 'https://oss.etcsd.com/object/5cb54d32549ecdf1d78c0c75', '3', '17731518297', '0', '1265', null, null, '2019-09-29 08:18:35', '1', '118.267755', '39.645032', '130000', '河北省', '130200', '唐山市', '130205', '开平区', '0', '壳牌', '', '', '13020000043');
INSERT INTO zsys_oil_station VALUES ('1266', '唐山壳牌欣平加油站', '欣平加油站', '唐山海港开发区海平路与港欣街交叉口东南50米 ', 'https://oss.etcsd.com/object/5cb54d32549ecdf1d78c0c77', '3', '18134056333', '0', '1266', null, null, '2019-09-29 08:18:35', '1', '118.994983', '39.241475', '130000', '河北省', '130200', '唐山市', '130225', '乐亭县', '0', '壳牌', '', '', '13020000044');
INSERT INTO zsys_oil_station VALUES ('1267', '唐山壳牌开平东越河加油站（华硕）加油站', '开平东越河加油站', '唐山市开平越河镇东越河村;西五路西侧,南新东道北侧', 'https://oss.etcsd.com/object/5cb54d33549ecdf1d78c0c79', '3', '15512596255', '0', '1267', null, null, '2019-09-29 08:18:35', '1', '118.245435', '39.618236', '130000', '河北省', '130200', '唐山市', '130205', '开平区', '0', '壳牌', '', '', '13020000045');
INSERT INTO zsys_oil_station VALUES ('1268', '唐山壳牌孙庄加油站', '孙庄加油站', '河北省唐山市海港经济开发区海港大路东侧', 'https://oss.etcsd.com/object/5cb54d34a055fa236fb329b5', '3', '18134056333', '0', '1268', null, null, '2019-09-29 08:18:35', '1', '119.000860', '39.259557', '130000', '河北省', '130200', '唐山市', '130225', '乐亭县', '0', '壳牌', '', '', '13020000046');
INSERT INTO zsys_oil_station VALUES ('1269', '唐山壳牌机场路加油站', '机场路加油站', '唐山市 高新区老庄子镇大树韩庄子村东', '', '3', '13463579993', '0', '1269', null, null, '2019-09-29 08:18:35', '1', '118.087189', '39.698009', '130000', '河北省', '130200', '唐山市', '130208', '丰润区', '0', '壳牌', '', '', '13020000047');
INSERT INTO zsys_oil_station VALUES ('1270', '唐山壳牌乐亭大钊路加油站', '乐亭大钊路加油站', '唐山市乐亭县大钊路与南外环交叉路口南壳牌加油站', 'https://oss.etcsd.com/object/5cb54d34a055fa236fb329b8', '3', '13832880204', '0', '1270', null, null, '2019-09-29 08:18:36', '1', '118.532000', '39.259000', '130000', '河北省', '130200', '唐山市', '130225', '乐亭县', '0', '壳牌', '', '', '13020000048');
INSERT INTO zsys_oil_station VALUES ('1272', '山东壳牌石油有限公司济南市章丘区明堂街加油站', '壳牌章丘明堂街加油站', '明堂街与铁道北街交叉口南行80米东', 'https://oss.etcsd.com/object/5cb54d3ca055fa236fb329bc', '3', '83217090', '0', '1272', null, null, '2019-09-29 08:18:36', '1', '117.526950', '36.719599', '370000', '山东省', '370100', '济南市', '370181', '章丘市', '0', '壳牌', '', '', '37010001160');
INSERT INTO zsys_oil_station VALUES ('1273', '大桥石化原阳服务区东区加油站', '原阳服务区东区加油站', '京港澳高速（G4）636公里处路东侧', 'https://oss.etcsd.com/object/5cb54d3e549ecdf1d78c0c7c', null, '03737538885', '0', '1273', null, null, '2019-09-29 08:18:36', '1', '113.866739', '35.011281', '410000', '河南省', '410700', '新乡市', '410725', '原阳县', '1', '河南大桥石化', 'G4', '京港澳高速', '41010000001');
INSERT INTO zsys_oil_station VALUES ('1274', '大桥石化原阳服务区西区加油站', '原阳服务区西区加油站', '京港澳高速（G4）636公里处路西侧', 'https://oss.etcsd.com/object/5cb54d41a055fa236fb329d5', null, '03737536333', '0', '1274', null, null, '2019-09-29 08:18:36', '1', '113.863361', '35.010269', '410000', '河南省', '410700', '新乡市', '410725', '原阳县', '1', '河南大桥石化', 'G4', '京港澳高速', '41010000001');
INSERT INTO zsys_oil_station VALUES ('1275', '大桥石化武陟服务区南区加油站', '武陟服务区南区加油站', '郑焦晋高速20公路处路南侧', 'https://oss.etcsd.com/object/5cb54d41549ecdf1d78c0c83', null, '03912527808', '0', '1275', null, null, '2019-09-29 08:18:36', '1', '113.644517', '35.036451', '410000', '河南省', '410800', '焦作市', '410823', '武陟县', '1', '河南大桥石化', 'S86', '郑焦晋高速', '41010000001');
INSERT INTO zsys_oil_station VALUES ('1276', '大桥石化武陟服务区北区加油站', '武陟服务区北区加油站', '郑焦晋高速20公路处路北侧', 'https://oss.etcsd.com/object/5cb54d42549ecdf1d78c0c85', null, '03912527808', '0', '1276', null, null, '2019-09-29 08:18:37', '1', '113.643650', '35.037899', '410000', '河南省', '410800', '焦作市', '410823', '武陟县', '1', '河南大桥石化', 'S86', '郑焦晋高速', '41010000001');
INSERT INTO zsys_oil_station VALUES ('1277', '大桥石化北四环加油站', '北四环加油站', '郑州北四环王庄小桥东临路北', 'https://oss.etcsd.com/object/5cb54d44549ecdf1d78c0c88', null, '0371-58535366', '0', '1277', null, null, '2019-09-29 08:18:37', '1', '113.696461', '34.886678', '410000', '河南省', '410100', '郑州市', '410101', '市辖区', '0', '河南大桥石化', '', '', '41010000001');
INSERT INTO zsys_oil_station VALUES ('1278', '大桥石化郑州刘湾加油站', '郑州刘湾加油站', '郑州市南四环与郑新路交叉口南10000米路西刘湾村口', 'https://oss.etcsd.com/object/5cb54d47a055fa236fb329dd', null, '0371-86256013', '0', '1278', null, null, '2019-09-29 08:18:37', '1', '113.713384', '34.669093', '410000', '河南省', '410100', '郑州市', '410101', '市辖区', '0', '河南大桥石化', '', '', '41010000001');
INSERT INTO zsys_oil_station VALUES ('1279', '大桥石化郑州永信加油站', '郑州永信加油站', '107国道与新郑市郑韩路交汇处北侧路东', 'https://oss.etcsd.com/object/5cb54d4a549ecdf1d78c0c91', null, '0371-62593955', '0', '1279', null, null, '2019-09-29 08:18:37', '1', '113.716826', '34.417535', '410000', '河南省', '410100', '郑州市', '410101', '市辖区', '0', '河南大桥石化', '', '', '41010000001');
INSERT INTO zsys_oil_station VALUES ('1280', '大桥石化郑州西四环路站', '郑州西四环路站', '郑州市西四环与金菊街交叉口西南角', 'https://oss.etcsd.com/object/5cb54d4da055fa236fb329e8', null, '15324853573', '0', '1280', null, null, '2019-09-29 08:18:38', '1', '113.535972', '34.827677', '410000', '河南省', '410100', '郑州市', '410101', '市辖区', '0', '河南大桥石化', '', '', '41010000001');
INSERT INTO zsys_oil_station VALUES ('1281', '大桥石化郑州港区通达站', '郑州港区通达站', '郑州市航空港区金港大道与S102交叉口', 'https://oss.etcsd.com/object/5cb54d51549ecdf1d78c0c9e', null, '0371-68519991', '0', '1281', null, null, '2019-09-29 08:18:38', '1', '113.820820', '34.509791', '410000', '河南省', '410100', '郑州市', '410184', '新郑市', '0', '河南大桥石化', '', '', '41010000001');
INSERT INTO zsys_oil_station VALUES ('1282', '大桥石化郑州恒宇站', '郑州恒宇站', '新郑市郭店镇卢家桥北1公里路东', 'https://oss.etcsd.com/object/5cb54d55a055fa236fb329f5', null, '0371-62510768', '0', '1282', null, null, '2019-09-29 08:18:38', '1', '113.693206', '34.549055', '410000', '河南省', '410100', '郑州市', '410101', '市辖区', '0', '河南大桥石化', '', '', '41010000001');
INSERT INTO zsys_oil_station VALUES ('1283', '大桥石化开封宏发站', '开封宏发站', '开尉路与310国道交叉口（芦花岗转盘）东北角', 'https://oss.etcsd.com/object/5cb54d55549ecdf1d78c0cab', null, '0371-23180879', '0', '1283', null, null, '2019-09-29 08:18:38', '1', '114.332935', '34.745349', '410000', '河南省', '410200', '开封市', '410201', '市辖区', '0', '河南大桥石化', '', '', '41010000001');
INSERT INTO zsys_oil_station VALUES ('1284', '大桥石化郑州黄河大桥北站', '郑州黄河大桥北站', '107国道郑州黄河公路大桥北段路东', 'https://oss.etcsd.com/object/5cb54d57549ecdf1d78c0cad', null, '0373-7595008', '0', '1284', null, null, '2019-09-29 08:18:38', '1', '113.690793', '34.968120', '410000', '河南省', '410100', '郑州市', '410101', '市辖区', '0', '河南大桥石化', '', '', '41010000001');
INSERT INTO zsys_oil_station VALUES ('1285', '大桥石化郑州黄河大桥西站', '郑州黄河大桥西站', '107国道郑州黄河公路大桥北段路西', 'https://oss.etcsd.com/object/5cb54d5a549ecdf1d78c0cb5', null, '0373-7594899', '0', '1285', null, null, '2019-09-29 08:18:38', '1', '113.687271', '34.961376', '410000', '河南省', '410100', '郑州市', '410101', '市辖区', '0', '河南大桥石化', '', '', '41010000001');
INSERT INTO zsys_oil_station VALUES ('1286', '大桥石化京广路柴郭加油站', '京广路柴郭加油站', '郑州市南四环与京广路东北角', 'https://oss.etcsd.com/object/5cb54d5aa055fa236fb32a02', null, '0371-55115859', '0', '1286', null, null, '2019-09-29 08:18:39', '1', '113.668178', '34.674965', '410000', '河南省', '410100', '郑州市', '410101', '市辖区', '0', '河南大桥石化', '', '', '41010000001');
INSERT INTO zsys_oil_station VALUES ('1287', '大桥石化江山路加油站', '江山路加油站', '郑州市北四环与江山路交叉口西南角', 'https://oss.etcsd.com/object/5cb54d5fa055fa236fb32a04', null, '0371-55575760', '0', '1287', null, null, '2019-09-29 08:18:39', '1', '113.579380', '34.886186', '410000', '河南省', '410100', '郑州市', '410101', '市辖区', '0', '河南大桥石化', '', '', '41010000001');
INSERT INTO zsys_oil_station VALUES ('1288', '大桥石化莆田站加油站', '莆田站加油站', '郑州市商都路与京珠高速交叉口向东200米路南', 'https://oss.etcsd.com/object/5cb54d62a055fa236fb32a12', null, '0371-62298188', '0', '1288', null, null, '2019-09-29 08:18:39', '1', '113.825956', '34.743329', '410000', '河南省', '410100', '郑州市', '410101', '市辖区', '0', '河南大桥石化', '', '', '41010000001');
INSERT INTO zsys_oil_station VALUES ('1289', '大桥石化荥阳市荥科加油站', '荥阳市荥科加油站', '荥阳市科学大道与庙王路交叉口东南角', 'https://oss.etcsd.com/object/5cb54d65a055fa236fb32a1e', null, '0371-56525568', '0', '1289', null, null, '2019-09-29 08:18:39', '1', '113.342654', '34.819669', '410000', '河南省', '410100', '郑州市', '410182', '荥阳市', '0', '河南大桥石化', '', '', '41010000001');
INSERT INTO zsys_oil_station VALUES ('1290', '大桥石化新乡南环路加油站', '新乡南环路加油站', '107国道与新乡南环交叉口西北角', 'https://oss.etcsd.com/object/5cb54d65549ecdf1d78c0cc1', null, '0373-5798088', '0', '1290', null, null, '2019-09-29 08:18:40', '1', '113.944001', '35.265965', '410000', '河南省', '410700', '新乡市', '410701', '市辖区', '0', '河南大桥石化', '', '', '41010000001');
INSERT INTO zsys_oil_station VALUES ('1291', '大桥石化新乡蓝天加油站', '新乡蓝天加油站', '107国道与新濮路交汇处', 'https://oss.etcsd.com/object/5cb54d65a055fa236fb32a27', null, '0373-3692358', '0', '1291', null, null, '2019-09-29 08:18:40', '1', '113.970011', '35.335697', '410000', '河南省', '410700', '新乡市', '410701', '市辖区', '0', '河南大桥石化', '', '', '41010000001');
INSERT INTO zsys_oil_station VALUES ('1293', '山东壳牌石油有限公司高密潍胶路加油站', '壳牌高密潍胶路加油站', '高密市夏庄镇驻地潍胶路南侧', '', '3', '18753602008', '0', '1293', null, null, '2019-09-29 08:18:40', '1', '119.844160', '36.439575', '370000', '山东省', '370700', '潍坊市', '370785', '高密市', '0', '壳牌', '', '', '37070000492');
INSERT INTO zsys_oil_station VALUES ('1294', '中石油青岛第12加油站', '中石油12站', '福州北路（福西小区）', '', '1', '85650252', '0', '1294', null, null, '2019-09-29 08:18:40', '1', '120.403480', '36.110793', '370000', '山东省', '370200', '青岛市', '370203', '市北区', '0', '中石油', '', '', '37020000611');
INSERT INTO zsys_oil_station VALUES ('1295', '中石油青岛102站', '青岛102站', '青岛市市南区香港东路210号', '', '1', '88011770', '0', '1295', null, null, '2019-09-29 08:18:41', '1', '120.462977', '36.095387', '370000', '山东省', '370200', '青岛市', '370202', '市南区', '0', '中石油', '', '', '37020000589');
INSERT INTO zsys_oil_station VALUES ('1296', '中石油青岛151站', '青岛151站', '青岛市黄岛区昆仑山路西侧、德立沟村东侧', '', '1', '370200005980002', '0', '1296', null, null, '2019-09-29 08:18:41', '1', '120.140573', '36.018847', '370000', '山东省', '370200', '青岛市', '370211', '黄岛区', '0', '中石油', '', '', '37020000598');
INSERT INTO zsys_oil_station VALUES ('1297', '青岛市莱西市第10加油站', '莱西第10加油站', '青岛市莱西市龙水路西侧', '', '1', '0532-66030717', '0', '1297', null, null, '2019-09-29 08:18:41', '1', '120.544696', '36.882007', '370000', '山东省', '370200', '青岛市', '370285', '莱西市', '0', '中石油', '', '', '37020000730');
INSERT INTO zsys_oil_station VALUES ('1298', '中石油青岛24站', '中石油青岛24站', '青岛市胶州扬州西路东辛置村', '', '1', '0532-82217676', '0', '1298', null, null, '2019-09-29 08:18:41', '1', '119.977762', '36.272929', '370000', '山东省', '370200', '青岛市', '370281', '胶州市', '0', '中石油', '', '', '37020000606');
INSERT INTO zsys_oil_station VALUES ('1299', '中石油青岛第116站', '中石油青岛第116站', '青岛市即墨区兰岙路64号', '', '1', '87555135', '0', '1299', null, null, '2019-09-29 08:18:41', '1', '120.489311', '36.398503', '370000', '山东省', '370200', '青岛市', '370282', '即墨市', '0', '中石油', '', '', '37020000691');
INSERT INTO zsys_oil_station VALUES ('1300', '中石油青岛第3加油站', '中石油青岛第3加油站', '城阳区蔬菜批发市场', '', '1', '0532-87925909', '0', '1300', null, null, '2019-09-29 08:18:41', '1', '120.388651', '36.302885', '370000', '山东省', '370200', '青岛市', '370214', '城阳区', '0', '中石油', '', '', '37020000710');
INSERT INTO zsys_oil_station VALUES ('1301', '山东壳牌石油有限公司济南工业南路加油站', '壳牌济南工业南路加油站', '济南市工业南路16号（殷陈村附近）', '', '3', '88817769', '0', '1301', null, null, '2019-09-29 08:18:41', '1', '117.170491', '36.713641', '370000', '山东省', '370100', '济南市', '370112', '历城区', '0', '壳牌', '', '', '37010001128');
INSERT INTO zsys_oil_station VALUES ('1302', '山东壳牌石油有限公司济南加油站', '壳牌济南加油站', '济南市市中区二环南路与郎茂山路交叉口向西100米路北（京鲁山庄斜对面山东红十字会眼科医院西邻）', 'https://oss.etcsd.com/object/5cb54d67549ecdf1d78c0cc4', '3', '66989212', '0', '1302', null, null, '2019-09-29 08:18:42', '1', '116.984070', '36.620029', '370000', '山东省', '370100', '济南市', '370103', '市中区', '0', '壳牌', '', '', '37010001122');
INSERT INTO zsys_oil_station VALUES ('1303', '壳牌荣成河阳东路加油站', '壳牌荣成河阳东路加油站', '河阳东路', '', '3', '张钰林', '0', '1303', null, null, '2019-09-29 08:18:42', '1', '122.430000', '37.140000', '370000', '山东省', '371000', '威海市', '371082', '荣成市', '0', '壳牌', '', '', '37100000610');
INSERT INTO zsys_oil_station VALUES ('1304', '中石油平度1站', '中石油平度1站', '平度市青岛路119号人民法院旁', '', '1', '13791832317', '0', '1304', null, null, '2019-09-29 08:18:42', '1', '119.979772', '36.785611', '370000', '山东省', '370200', '青岛市', '370283', '平度市', '0', '中石油', '', '', '37020000669');
INSERT INTO zsys_oil_station VALUES ('1305', '山东壳牌石油有限公司烟台市蓬莱206国道加油站', '壳牌蓬莱206站', '烟台市蓬莱市206国道昌升广场东500米壳牌加油站', '', '3', '18678028182', '0', '1305', null, null, '2019-09-29 08:18:42', '1', '120.829987', '37.783662', '370000', '山东省', '370600', '烟台市', '370684', '蓬莱市', '0', '壳牌', '', '', '37060000504');
INSERT INTO zsys_oil_station VALUES ('1306', '山东壳牌石油有限公司河口区辛河路加油站', '壳牌河口区新河路加油站', '山东省东营市河口区六合街道顺河路利友宾馆洗浴南100米 ', '', '3', '15066000920', '0', '1306', null, null, '2019-09-29 08:18:42', '1', '118.551335', '37.823836', '370000', '山东省', '370500', '东营市', '370503', '河口区', '0', '壳牌', '', '', '37050000108');
INSERT INTO zsys_oil_station VALUES ('1307', '山东壳牌石油有限公司广饶县潍高路加油站', '壳牌广饶县潍高加油站', '东营市广饶县广饶立交桥西1000米驰中集团东邻', '', '3', '15066000920', '0', '1307', null, null, '2019-09-29 08:18:43', '1', '118.398931', '37.047805', '370000', '山东省', '370500', '东营市', '370523', '广饶县', '0', '壳牌', '', '', '37050000109');
INSERT INTO zsys_oil_station VALUES ('1309', '中石油潍坊79站', '中石油潍坊79站', '青州市南环路45号路北，凤凰山路与海岱路交叉口东200米路北', '', '1', '18053681079', '0', '1309', null, null, '2019-09-29 08:18:43', '1', '118.505260', '36.678576', '370000', '山东省', '370700', '潍坊市', '370781', '青州市', '0', '中石油', '', '', '37070000390');
INSERT INTO zsys_oil_station VALUES ('1380', '中国石油天然气股份有限公司潍坊第71加油站', '中石油潍坊71站', '潍坊安丘市华安路中段西侧', '', '1', '18053681071', '0', '1380', null, null, '2019-09-29 08:18:43', '1', '119.196270', '36.437511', '370000', '山东省', '370700', '潍坊市', '370784', '安丘市', '0', '中石油', '', '', '37070000387');
INSERT INTO zsys_oil_station VALUES ('1381', '中国石油天然气股份有限公司潍坊第73加油站', '中石油潍坊73站', '潍坊安丘市景芝镇驻地206国道206国道332Km+400m路东，工贸城路口南500米路东', '', '1', '0536-4609697', '0', '1381', null, null, '2019-09-29 08:18:44', '1', '119.387959', '36.316151', '370000', '山东省', '370700', '潍坊市', '370784', '安丘市', '0', '中石油', '', '', '37070000388');
INSERT INTO zsys_oil_station VALUES ('1382', '中国石油天然气股份有限公司潍坊第31加油站', '中石油潍坊31站', '潍坊市昌乐县宝城街道西田村北309国道南侧，宝昌路西1.5公里处路南', '', '1', '18053681031', '0', '1382', null, null, '2019-09-29 08:18:44', '1', '118.819240', '36.729079', '370000', '山东省', '370700', '潍坊市', '370725', '昌乐县', '0', '中石油', '', '', '37070000439');
INSERT INTO zsys_oil_station VALUES ('1383', '中国石油天然气股份有限公司潍坊昌邑第1加油站', '中石油昌邑1站', '潍坊市昌邑市奎聚街办上台村左侧', '', '1', '0536-7120560', '0', '1383', null, null, '2019-09-29 08:18:44', '1', '119.431848', '36.852368', '370000', '山东省', '370700', '潍坊市', '370786', '昌邑市', '0', '中石油', '', '', '37070000363');
INSERT INTO zsys_oil_station VALUES ('1384', '中国石油天然气股份有限公司潍坊昌邑第3加油站', '中石油昌邑3站', '昌邑市烟汕路王耨村路段路北206国道250公里处', '', '1', '0536-7897779', '0', '1384', null, null, '2019-09-29 08:18:44', '1', '119.341427', '36.815139', '370000', '山东省', '370700', '潍坊市', '370786', '昌邑市', '0', '中石油', '', '', '37070000364');
INSERT INTO zsys_oil_station VALUES ('1385', '青岛壳牌平度市柳州路加油站', '青岛壳牌平度市柳州路加油站', '山东省青岛市平度市柳州路188号附近', '', '3', '0532-88350522', '0', '1385', null, null, '2019-09-29 08:18:44', '1', '119.921435', '36.776581', '370000', '山东省', '370200', '青岛市', '370283', '平度市', '0', '壳牌', '', '', '37020000783');
INSERT INTO zsys_oil_station VALUES ('1386', '中国石油天然气股份有限公司潍坊第40加油站', '中石油潍坊40站', '坊子新区龙泉街中段路南，北海路与龙泉街交叉口往东800米', '', '1', '0536-7517713', '0', '1386', null, null, '2019-09-29 08:18:45', '1', '119.177244', '36.663657', '370000', '山东省', '370700', '潍坊市', '370704', '坊子区', '0', '中石油', '', '', '37070000381');
INSERT INTO zsys_oil_station VALUES ('1387', '中国石油天然气股份有限公司潍坊第5加油站', '中石油潍坊5站', '潍坊市坊子区北海路南首与潍胶路交汇处路口北100米', '', '1', '0536-7517732', '0', '1387', null, null, '2019-09-29 08:18:45', '1', '119.166625', '36.633175', '370000', '山东省', '370700', '潍坊市', '370704', '坊子区', '0', '中石油', '', '', '37070000386');
INSERT INTO zsys_oil_station VALUES ('1388', '中国石油天然气股份有限公司潍坊高密第7加油站', '中石油高密7站', '高密市醴泉街道百脉湖大街中段路南', '', '1', '0536-2316662', '0', '1388', null, null, '2019-09-29 08:18:45', '1', '119.770359', '36.408275', '370000', '山东省', '370700', '潍坊市', '370785', '高密市', '0', '中石油', '', '', '37070000365');
INSERT INTO zsys_oil_station VALUES ('1389', '中国石油天然气股份有限公司潍坊第19加油站', '中石油潍坊19站', '高密市凤凰大街东首北侧，与孚日路交叉口向西100米路北', '', '1', '0536-2360790', '0', '1389', null, null, '2019-09-29 08:18:45', '1', '119.793439', '36.378008', '370000', '山东省', '370700', '潍坊市', '370785', '高密市', '0', '中石油', '', '', '37070000371');
INSERT INTO zsys_oil_station VALUES ('1390', '中国石油天然气股份有限公司潍坊第15加油站', '中石油潍坊15站', '潍坊高新区健康东街2号，健康街与潍县中路交叉口往西150米，', '', '1', '0536-8790623', '0', '1390', null, null, '2019-09-29 08:18:46', '1', '119.187096', '36.708953', '370000', '山东省', '370700', '潍坊市', '370705', '奎文区', '0', '中石油', '', '', '37070000368');
INSERT INTO zsys_oil_station VALUES ('1391', '中国石油天然气股份有限公司潍坊第22加油站', '中石油潍坊22站', '潍坊市高新区东方路810号，与卧龙街交叉口以北200米路东', '', '1', '0536-8790937', '0', '1391', null, null, '2019-09-29 08:18:46', '1', '119.172304', '36.741288', '370000', '山东省', '370700', '潍坊市', '370705', '奎文区', '0', '中石油', '', '', '37070000374');
INSERT INTO zsys_oil_station VALUES ('1392', '中国石油天然气股份有限公司潍坊第37加油站', '中石油潍坊37站', '潍坊市寒亭区丰华路南首与东外环路交汇处南200米路西', '', '1', '0536-7272237', '0', '1392', null, null, '2019-09-29 08:18:46', '1', '119.221722', '36.743340', '370000', '山东省', '370700', '潍坊市', '370703', '寒亭区', '0', '中石油', '', '', '37070000378');
INSERT INTO zsys_oil_station VALUES ('1393', '中国石油天然气股份有限公司潍坊第4加油站', '中石油潍坊4站', '潍坊市寒亭区通亭街278号百大绿洲对面', '', '1', '0536-7363092', '0', '1393', null, null, '2019-09-29 08:18:46', '1', '119.185917', '36.763284', '370000', '山东省', '370700', '潍坊市', '370703', '寒亭区', '0', '中石油', '', '', '37070000385');
INSERT INTO zsys_oil_station VALUES ('1394', '中国石油天然气股份有限公司潍坊第24加油站', '中石油潍坊24站', '潍坊市奎文区健康东街300号，与文化路东200米路南', '', '1', '0536-8512391', '0', '1394', null, null, '2019-09-29 08:18:46', '1', '119.150093', '36.701593', '370000', '山东省', '370700', '潍坊市', '370705', '奎文区', '0', '中石油', '', '', '37070000375');
INSERT INTO zsys_oil_station VALUES ('1395', '中国石油天然气股份有限公司临朐朐山加油站', '中石油潍坊临朐朐山站', '临朐县临朐南路与沂山路交叉口北400米路', '', '1', '18053681327', '0', '1395', null, null, '2019-09-29 08:18:47', '1', '118.559224', '36.505672', '370000', '山东省', '370700', '潍坊市', '370724', '临朐县', '0', '中石油', '', '', '37070000440');
INSERT INTO zsys_oil_station VALUES ('1396', '中国石油天然气股份有限公司潍坊第66站', '中石油潍坊66站', '潍坊临朐县卧龙镇政府驻地，羊临路111公里左侧。', '', '1', '18053681327', '0', '1396', null, null, '2019-09-29 08:18:47', '1', '118.559224', '36.505672', '370000', '山东省', '370700', '潍坊市', '370724', '临朐县', '0', '中石油', '', '', '37070000441');
INSERT INTO zsys_oil_station VALUES ('1397', '中国石油天然气股份有限公司潍坊第78加油站', '中石油潍坊78站', '青州市邵庄镇扬州路与雍州路交汇处东南方向', '', '1', '18053681078', '0', '1397', null, null, '2019-09-29 08:18:47', '1', '118.324355', '36.761471', '370000', '山东省', '370700', '潍坊市', '370781', '青州市', '0', '中石油', '', '', '37070000389');
INSERT INTO zsys_oil_station VALUES ('1398', '中国石油天然气股份有限公司潍坊第79加油站', '中石油潍坊79站', '青州市南环路45号路北，凤凰山路与海岱路交叉口东200米路北', '', '1', '18053681078', '0', '1398', null, null, '2019-09-29 08:18:47', '1', '118.505260', '36.678576', '370000', '山东省', '370700', '潍坊市', '370781', '青州市', '0', '中石油', '', '', '37070000390');
INSERT INTO zsys_oil_station VALUES ('1399', '中国石油天然气股份有限公司潍坊第1加油站', '中石油潍坊1站', '潍坊市潍城区福寿街与长松路口北100米路东', '', '1', '18053681001', '0', '1399', null, null, '2019-09-29 08:18:48', '1', '119.068791', '36.730041', '370000', '山东省', '370700', '潍坊市', '370702', '潍城区', '0', '中石油', '', '', '37070000372');
INSERT INTO zsys_oil_station VALUES ('1400', '中国石油天然气股份有限公司潍坊第39加油站', '中石油潍坊39站', '诸城市206国道北龙都街道大水泊801号，诸城市南环与西环交叉口往西500米路北', '', '1', '18053681039', '0', '1400', null, null, '2019-09-29 08:18:48', '1', '119.375744', '35.981234', '370000', '山东省', '370700', '潍坊市', '370782', '诸城市', '0', '中石油', '', '', '37070000380');
INSERT INTO zsys_oil_station VALUES ('1401', '中国石油天然气股份有限公司潍坊第45加油站', '中石油潍坊45站', '潍坊市坊子区206国道潍州南路张柳沟村路段', '', '1', '18053681045', '0', '1401', null, null, '2019-09-29 08:18:48', '1', '119.142152', '36.584698', '370000', '山东省', '370700', '潍坊市', '370704', '坊子区', '0', '中石油', '', '', '37070000494');
INSERT INTO zsys_oil_station VALUES ('1404', '济南瀚通石化有限公司北外环加油站', '瀚通石化北外环站', '济南市天桥区北外环路与无影山北路交叉口', 'https://oss.etcsd.com/object/5cb54d6f549ecdf1d78c0ccd', null, '​85704301', '0', '1404', null, null, '2019-09-29 08:18:48', '1', '116.977706', '36.725421', '370000', '山东省', '370100', '济南市', '370105', '天桥区', '0', '瀚通石化', '', '', '37010001140');
INSERT INTO zsys_oil_station VALUES ('1405', '济南市天桥区龙泉加油站', '中胜石油天桥站', '济南市天桥区济洛路2号', 'https://oss.etcsd.com/object/5cc7afc2a055fa236fb33991', null, '15169005221', '0', '1405', null, null, '2019-09-29 08:18:49', '1', '117.001132', '36.722722', '370000', '山东省', '370100', '济南市', '370105', '天桥区', '0', '中胜石油', '', '', '37010001149');
INSERT INTO zsys_oil_station VALUES ('1406', '济南永道加油站有限公司', '中胜石油经十路站', '济南市历下区经十路2号', '', null, '18706403972', '0', '1406', null, null, '2019-09-29 08:18:49', '1', '117.061774', '36.653886', '370000', '山东省', '370100', '济南市', '370102', '历下区', '0', '中胜石油', '', '', '37010001147');
INSERT INTO zsys_oil_station VALUES ('1407', '济南中达石油有限公司', '中胜石油张庄路站', '山东省济南市槐荫区张庄路239号', 'https://oss.etcsd.com/object/5cc7afc9549ecdf1d78c1cb2', null, '15588813897', '0', '1407', null, null, '2019-09-29 08:18:49', '1', '116.960107', '36.676078', '370000', '山东省', '370100', '济南市', '370104', '槐荫区', '0', '中胜石油', '', '', '37010001150');
INSERT INTO zsys_oil_station VALUES ('1408', '济南中凯石油有限公司', '中胜石油窑头路站', '济南市历下区窑头路1号', 'https://oss.etcsd.com/object/5cc7afd6a055fa236fb339a5', null, '15205947818', '0', '1408', null, null, '2019-09-29 08:18:49', '1', '117.086441', '36.660834', '370000', '山东省', '370100', '济南市', '370102', '历下区', '0', '中胜石油', '', '', '37010001144');
INSERT INTO zsys_oil_station VALUES ('1409', '山东大廓石油有限公司', '中胜石油济齐路站', '济南市槐荫区济齐路南侧匡山汽车大世界以东', 'https://oss.etcsd.com/object/5cc7afde549ecdf1d78c1cca', null, '13666902215', '0', '1409', null, null, '2019-09-29 08:18:49', '1', '116.945286', '36.695312', '370000', '山东省', '370100', '济南市', '370104', '槐荫区', '0', '中胜石油', '', '', '37010001148');
INSERT INTO zsys_oil_station VALUES ('1410', '山东中胜石油化工有限公司济南二环南路加油站', '中胜石油二环南路站', '山东济南市中区十六里河镇兴隆一村南外环路路北', 'https://oss.etcsd.com/object/5cc7afe3a055fa236fb339bc', null, '18754135330', '0', '1410', null, null, '2019-09-29 08:18:50', '1', '117.039419', '36.604190', '370000', '山东省', '370100', '济南市', '370103', '市中区', '0', '中胜石油', '', '', '37010001145');
INSERT INTO zsys_oil_station VALUES ('1411', '山东中胜石油化工有限公司济南机场加油站', '中胜石油济南机场站', '山东省济南市历城区遥墙国际机场内（东航路1号）', 'https://oss.etcsd.com/object/5cc7afe7549ecdf1d78c1ce1', null, '13766902760', '0', '1411', null, null, '2019-09-29 08:18:50', '1', '117.216278', '36.866771', '370000', '山东省', '370100', '济南市', '370112', '历城区', '0', '中胜石油', '', '', '37010001151');
INSERT INTO zsys_oil_station VALUES ('1412', '山东中胜石油化工有限公司章丘利民大道加油站', '中胜石油章丘站', '山东省济南市章丘区明水利民大道1号', 'https://oss.etcsd.com/object/5cc7afeba055fa236fb339d1', null, '82301312', '0', '1412', null, null, '2019-09-29 08:18:50', '1', '117.562803', '36.726046', '370000', '山东省', '370100', '济南市', '370181', '章丘市', '0', '中胜石油', '', '', '37010001146');
INSERT INTO zsys_oil_station VALUES ('1413', '商河县佩金加油站', '中胜石油商河站', '商河县玉皇庙街道办事处杨庄铺村S248线东侧', 'https://oss.etcsd.com/object/5cc7afee549ecdf1d78c1cf2', null, '​18039095733', '0', '1413', null, null, '2019-09-29 08:18:50', '1', '117.176025', '37.195729', '370000', '山东省', '370100', '济南市', '370126', '商河县', '0', '中胜石油', '', '', '37010001152');
INSERT INTO zsys_oil_station VALUES ('1415', '山东高速石化有限公司第五十一加油站', '章丘服务区右侧加油站', '济南至莱芜高速公路章丘服务区（K24+280）右侧', '', '2', '15753197181', '0', '1415', null, null, '2019-09-29 08:18:51', '1', '117.435041', '36.604654', '370000', '山东省', '370100', '济南市', '370181', '章丘市', '1', '中国石化', 'G2', '京沪高速', '37120000280');
INSERT INTO zsys_oil_station VALUES ('1416', '山东高速石化有限公司第五十二加油站', '章丘服务区左侧加油站', '济南至莱芜高速公路章丘服务区（K24+280）左侧', '', null, '15753197181', '0', '1416', null, null, '2019-09-29 08:18:51', '1', '117.435041', '36.604654', '370000', '山东省', '370100', '济南市', '370181', '章丘市', '1', '其它', 'G2', '京沪高速', '37120000281');
INSERT INTO zsys_oil_station VALUES ('1417', '山东高速石化有限公司第五十三加油站', '雪野停车场右侧加油站', '济南至莱芜高速公路雪野停车场（K52+183）右侧', '', null, '13964175166', '0', '1417', null, null, '2019-09-29 08:18:51', '1', '117.561130', '36.409210', '370000', '山东省', '371200', '莱芜市', '371202', '莱城区', '1', '其它', 'G2', '京沪高速', '37120000276');
INSERT INTO zsys_oil_station VALUES ('1418', '山东高速石化有限公司第五十四加油站', '雪野停车区左侧加油站', '济南至莱芜高速公路雪野停车场（K52+183）左侧', '', null, '13964175166', '0', '1418', null, null, '2019-09-29 08:18:51', '1', '117.561130', '36.409210', '370000', '山东省', '371200', '莱芜市', '371202', '莱城区', '1', '其它', 'G2', '京沪高速', '37120000277');
INSERT INTO zsys_oil_station VALUES ('1419', '山东高速石化有限公司第五十五加油站', '莱芜服务区左侧加油站', '济南至莱芜高速公路莱芜服务区（K69+590）左侧', '', null, '13563428730', '0', '1419', null, null, '2019-09-29 08:18:52', '1', '117.673531', '36.286194', '370000', '山东省', '371200', '莱芜市', '371202', '莱城区', '1', '其它', 'G2', '京沪高速', '37120000278');
INSERT INTO zsys_oil_station VALUES ('1420', '山东高速石化有限公司第五十六加油站', '莱芜服务区右侧加油站', '济南至莱芜高速公路莱芜服务区（K69+590）右侧', '', null, '13563428730', '0', '1420', null, null, '2019-09-29 08:18:52', '1', '117.673531', '36.286194', '370000', '山东省', '371200', '莱芜市', '371202', '莱城区', '1', '其它', 'G2', '京沪高速', '37120000279');
INSERT INTO zsys_oil_station VALUES ('1421', '山东壳牌石油有限公司东营市加油站', '壳牌东营市加油站', '山东省东营市西四路841号', '', '3', '15066000920', '0', '1421', null, null, '2019-09-29 08:18:52', '1', '118.492488', '37.444675', '370000', '山东省', '370500', '东营市', '370502', '东营区', '0', '壳牌', '', '', '37050000110');
INSERT INTO zsys_oil_station VALUES ('1422', '廊坊霸州石化壳牌加油站', '廊坊霸州石化壳牌加油站', '河北省廊坊市霸州桑园村东106新河桥南200米', '', '3', '13803048767', '0', '1422', null, null, '2019-09-29 08:18:52', '1', '116.390730', '39.077466', '130000', '河北省', '131000', '廊坊市', '131081', '霸州市', '0', '壳牌', '', '', '13100000017');
INSERT INTO zsys_oil_station VALUES ('1423', '沧州壳牌泰山道站加油站', '沧州壳牌泰山道站加油站', '任丘市泰山道西侧，工商局对面', '', '3', '13103071101', '0', '1423', null, null, '2019-09-29 08:18:53', '1', '116.134391', '38.717129', '130000', '河北省', '130900', '沧州市', '130982', '任丘市', '0', '壳牌', '', '', '13090000012');
INSERT INTO zsys_oil_station VALUES ('1424', '沧州壳牌沧盐路旧州站加油站', '沧州壳牌沧盐路旧州站加油站', '沧县沧盐路东关村壳牌加油站（铁狮子旁）', '', '3', '王妮', '0', '1424', null, null, '2019-09-29 08:18:53', '1', '117.030215', '38.217508', '130000', '河北省', '130900', '沧州市', '130921', '沧县', '0', '壳牌', '', '', '13090000014');
INSERT INTO zsys_oil_station VALUES ('1425', '唐山壳牌路北区站前路加油站', '唐山壳牌路北区站前路加油站', '站前路与裕华道交叉口', '', '3', '18833326265', '0', '1425', null, null, '2019-09-29 08:18:53', '1', '118.125028', '39.665623', '130000', '河北省', '130200', '唐山市', '130203', '路北区', '0', '壳牌', '', '', '13020000035');
INSERT INTO zsys_oil_station VALUES ('1426', '中石油德州第43加油站', '中石油德州第43加油站', '临邑县迎宾南路', '', '1', '13589906855', '0', '1426', null, null, '2019-09-29 08:18:53', '1', '116.882572', '37.180718', '370000', '山东省', '371400', '德州市', '371424', '临邑县', '0', '中石油', '', '', '37140000410');
INSERT INTO zsys_oil_station VALUES ('1427', '廊坊固安水利壳牌加油站', '廊坊固安水利壳牌加油站', '河北省廊坊市固安县固涿路党校旁壳牌加油站', '', '3', '13393060839', '0', '1427', null, null, '2019-09-29 08:18:53', '1', '116.286311', '39.450770', '130000', '河北省', '131000', '廊坊市', '131022', '固安县', '0', '壳牌', '', '', '13100000038');
INSERT INTO zsys_oil_station VALUES ('1428', '中石油德州第42加油站', '中石油德州第42加油站', '中山北路', '', '1', '13791309587', '0', '1428', null, null, '2019-09-29 08:18:54', '1', '116.017510', '36.993247', '370000', '山东省', '371400', '德州市', '371427', '夏津县', '0', '中石油', '', '', '37140000409');
INSERT INTO zsys_oil_station VALUES ('1429', '廊坊霸州南夹河壳牌加油站', '廊坊霸州南夹河壳牌加油站', '河北省廊坊市霸州市南夹河村112国道南侧', '', '3', '15076664466', '0', '1429', null, null, '2019-09-29 08:18:54', '1', '116.347695', '39.122431', '130000', '河北省', '131000', '廊坊市', '131081', '霸州市', '0', '壳牌', '', '', '13100000030');
INSERT INTO zsys_oil_station VALUES ('1430', '廊坊霸州霸杨路壳牌加油站', '廊坊霸州霸杨路壳牌加油站', '河北省廊坊市霸州市杨芬港镇东寨上村', '', '3', '18630799019', '0', '1430', null, null, '2019-09-29 08:18:54', '1', '116.347695', '39.122431', '130000', '河北省', '131000', '廊坊市', '131081', '霸州市', '0', '壳牌', '', '', '13100000028');
INSERT INTO zsys_oil_station VALUES ('1431', '廊坊文安世纪大道壳牌加油站', '廊坊文安世纪大道壳牌加油站', '河北省廊坊市文安县世纪大道北侧壳牌加油站', '', '3', '18632705393', '0', '1431', null, null, '2019-09-29 08:18:54', '1', '116.396832', '38.895520', '130000', '河北省', '131000', '廊坊市', '131026', '文安县', '0', '壳牌', '', '', '13100000035');
INSERT INTO zsys_oil_station VALUES ('1432', '廊坊大城友来壳牌加油站', '廊坊大城友来壳牌加油站', '河北省廊坊市大城县冯张街村南壳牌加油站', '', '3', '18630675649', '0', '1432', null, null, '2019-09-29 08:18:54', '1', '116.575291', '38.709740', '130000', '河北省', '131000', '廊坊市', '131025', '大城县', '0', '壳牌', '', '', '13100000023');
INSERT INTO zsys_oil_station VALUES ('1433', '石家庄石津东路壳牌加油站', '石家庄石津东路壳牌加油站', '河北省石家庄市石津东路与石兆金街交叉口东南角', '', '3', '15131656953', '0', '1433', null, null, '2019-09-29 08:18:55', '1', '114.606083', '38.065775', '130000', '河北省', '130100', '石家庄市', '130102', '长安区', '0', '壳牌', '', '', '13010000013');
INSERT INTO zsys_oil_station VALUES ('1434', '石家庄友谊北大街壳牌加油站', '石家庄友谊北大街壳牌加油站', '河北省石家庄市新华区友谊北大街与朝阳路交叉口路东', '', '3', '18531632366', '0', '1434', null, null, '2019-09-29 08:18:55', '1', '114.461102', '38.076469', '130000', '河北省', '130100', '石家庄市', '130105', '新华区', '0', '壳牌', '', '', '13010000012');
INSERT INTO zsys_oil_station VALUES ('1435', '九车能源乔装站', '九车能源乔装站', '浙江省综合保税区服务中心', '', null, '13109500303', '0', '1435', null, null, '2019-09-29 08:18:55', '1', '122.200000', '30.080000', '330000', '浙江省', '330900', '舟山市', '330901', '市辖区', '0', '九车能源', '', '', '33010000002');
INSERT INTO zsys_oil_station VALUES ('1444', '中国石油天然气股份有限公司山东临沂销售分公司第六十一加油站', '中石油临沂61站', '莒南县十字路镇淮海西路79号', '', '1', '18669560561', '0', '1444', null, null, '2019-09-29 08:18:55', '1', '118.821082', '35.202861', '370000', '山东省', '371300', '临沂市', '371327', '莒南县', '0', '中石油', '', '', '37130000408');
INSERT INTO zsys_oil_station VALUES ('1452', '中国石油天然气股份有限公司山东销售分公司临沂第五十八加油站', '中石油临沂58站', '临沂市兰山区双岭路与临西十一路交汇处西南角', '', '1', '18669560558', '0', '1452', null, null, '2019-09-29 08:18:55', '1', '118.275753', '35.126656', '370000', '山东省', '371300', '临沂市', '371302', '兰山区', '0', '中石油', '', '', '37130000395');
INSERT INTO zsys_oil_station VALUES ('1455', '中国石油天然气股份有限公司山东销售菏泽分公司第45加油站', '中石油天然气山东销售菏泽分公司第45加油站', '沙土镇东1公里路北', '', '1', '17866690945', '0', '1455', null, null, '2019-09-29 08:18:56', '1', '115.789675', '35.280008', '370000', '山东省', '371700', '菏泽市', '371702', '牡丹区', '0', '中石油', '', '', '37170000420');
INSERT INTO zsys_oil_station VALUES ('1456', '延长壳牌石油有限公司咸阳彬县土沟加油站', '延长壳牌咸阳彬县土沟加油站', '彬州市312省道50米', '', '3', '13109500303', '0', '1456', null, null, '2019-09-29 08:18:56', '1', '107.990000', '35.070000', '610000', '陕西省', '610400', '咸阳市', '610401', '市辖区', '0', '壳牌', '', '', '33010000002');
INSERT INTO zsys_oil_station VALUES ('1457', '延长壳牌咸阳彬县北加油站', '壳牌咸阳彬县北加油站', '陕西省咸阳市彬州市城北312国道水帘村水帘桥头', '', '3', '13109500303', '0', '1457', null, null, '2019-09-29 08:18:56', '1', '108.060000', '35.070000', '610000', '陕西省', '610400', '咸阳市', '610401', '市辖区', '0', '壳牌', '', '', '33010000002');
INSERT INTO zsys_oil_station VALUES ('1463', '中国石油天然气股份有限公司第63加油站', '中国石油天然气股份有限公司第63加油站', '茌平县枣乡北街路东', '', '1', '18506357350', '0', '1463', null, null, '2019-09-29 08:18:56', '1', '116.248966', '36.597573', '370000', '山东省', '371500', '聊城市', '371523', '茌平县', '0', '中石油', '', '', '37150000451');
INSERT INTO zsys_oil_station VALUES ('1464', '中国石油天然气股份有限公司第61加油站', '中国石油天然气股份有限公司第61加油站', '茌平县振兴路东首路南', '', '1', '18863550663', '0', '1464', null, null, '2019-09-29 08:18:56', '1', '116.282461', '36.595336', '370000', '山东省', '371500', '聊城市', '371523', '茌平县', '0', '中石油', '', '', '3715000045');
INSERT INTO zsys_oil_station VALUES ('1465', '中国石油天然气股份有限公司第45加油站', '中国石油天然气股份有限公司第45加油站', '东阿公路中段（鲁西化工对面）', '', '1', '18506357313', '0', '1465', null, null, '2019-09-29 08:18:57', '1', '116.160846', '36.367214', '370000', '山东省', '371500', '聊城市', '371524', '东阿县', '0', '中石油', '', '', '37150000441');
INSERT INTO zsys_oil_station VALUES ('1466', '中国石油天然气股份有限公司第73加油站', '中国石油天然气股份有限公司第73加油站', '东阿县晨光路路北', '', '1', '15506356545', '0', '1466', null, null, '2019-09-29 08:18:57', '1', '116.241645', '36.341786', '370000', '山东省', '371500', '聊城市', '371524', '东阿县', '0', '中石油', '', '', '371500004550002');
INSERT INTO zsys_oil_station VALUES ('1467', '中国石油天然气股份有限公司第43加油站', '中国石油天然气股份有限公司第43加油站', '莘县东环邹里园村路东', '', '1', '18506357331', '0', '1467', null, null, '2019-09-29 08:18:57', '1', '115.690428', '36.242088', '370000', '山东省', '371500', '聊城市', '371522', '莘县', '0', '中石油', '', '', '37150000439');
INSERT INTO zsys_oil_station VALUES ('1468', '中国石油天然气股份有限公司第21加油站', '中国石油天然气股份有限公司第21加油站', '莘县临莘路蒙馆路交叉口', '', '1', '18663506187', '0', '1468', null, null, '2019-09-29 08:18:57', '1', '115.682949', '36.268426', '370000', '山东省', '371500', '聊城市', '371522', '莘县', '0', '中石油', '', '', '37150000430');
INSERT INTO zsys_oil_station VALUES ('1469', '唐山壳牌乐亭宝丰街油站（玉祥）加油站', '宝丰街油站（玉祥）加油站', '唐山市乐亭县平大路与宝丰街交叉口', '', '3', '18633405566', '0', '1469', null, null, '2019-09-29 08:18:57', '1', '118.905537', '39.441672', '130000', '河北省', '130200', '唐山市', '130225', '乐亭县', '0', '壳牌', '', '', '13020000004');
INSERT INTO zsys_oil_station VALUES ('1470', '中海油销售天津有限公司虎丘路加油站', '中海油虎丘路加油站', '河东区虎丘路1号（紧挨益世医院，距津塘公路50米）', '', null, '17627859526', '0', '1470', null, null, '2019-09-29 08:18:58', '1', '117.276888', '39.105633', '120000', '天津市', '120100', '市辖区', '120102', '河东区', '0', '中海油', '', '', '12010000077');
INSERT INTO zsys_oil_station VALUES ('1471', '中海油销售天津有限公司耐火路加油站', '中海油销售天津有限公司耐火路加油站', '天津市河东区津塘路一号桥耐火路4号', '', null, '13400479858', '0', '1471', null, null, '2019-09-29 08:18:58', '1', '117.286531', '39.106905', '120000', '天津市', '120100', '市辖区', '120102', '河东区', '0', '中海油', '', '', '12010000076');
INSERT INTO zsys_oil_station VALUES ('1472', '中海油销售天津有限公司创新大道加油站', '中海油销售天津有限公司创新大道加油站', '中心庄路和创新大道交口', '', null, '13682153255', '0', '1472', null, null, '2019-09-29 08:18:58', '1', '117.544410', '39.124186', '120000', '天津市', '120100', '市辖区', '120103', '河西区', '0', '中海油', '', '', '12010000078');
INSERT INTO zsys_oil_station VALUES ('1473', '中海油滨海新区东沽石油南路加油站', '中海油滨海新区东沽石油南路加油站', '天津市滨海新区中心商务区石油南路124号', '', null, ' 13642075115', '0', '1473', null, null, '2019-09-29 08:18:58', '1', '117.698120', '38.975351', '120000', '天津市', '120100', '市辖区', '120116', '滨海新区', '0', '中海油', '', '', '12010000079');
INSERT INTO zsys_oil_station VALUES ('1474', '中海油山东销售有限公司邹平长山加油站', '中海油山东邹平长山站', '长山镇大由村', '', null, '18005310032', '0', '1474', null, null, '2019-09-29 08:18:58', '1', '117.913774', '36.933194', '370000', '山东省', '371600', '滨州市', '371626', '邹平县', '0', '中海油', '', '', '37160000526');
INSERT INTO zsys_oil_station VALUES ('1475', '中海油山东销售有限公司第二十五加油站', '中海油山东二十五站', '孙镇孙镇村', '', null, '15266768658', '0', '1475', null, null, '2019-09-29 08:18:59', '1', '117.707102', '37.050194', '370000', '山东省', '371600', '滨州市', '371626', '邹平县', '0', '中海油', '', '请选择道路', '37160000525');
INSERT INTO zsys_oil_station VALUES ('1476', '青岛壳牌石油有限公司平度市三城路加油站', '青岛平度市三城路加油站', '平度市三城路211号', '', '3', '15092253850', '0', '1476', null, null, '2019-09-29 08:18:59', '1', '120.012935', '36.759344', '370000', '山东省', '370200', '青岛市', '370283', '平度市', '0', '壳牌', '', '', '37020000784');
INSERT INTO zsys_oil_station VALUES ('1478', '中石油青岛1站', '中石油青岛1站', '山东省青岛市城阳区重庆中路1095号', '', '1', '18561957722', '0', '1478', null, null, '2019-09-29 08:18:59', '1', '120.401440', '36.238166', '370000', '山东省', '370200', '青岛市', '370214', '城阳区', '0', '中石油', '', '', '37020000716');
INSERT INTO zsys_oil_station VALUES ('1496', '延长壳牌（四川）石油有限公司高新大道加油站', '高新大道加油站', '成都市高新区创业路51号', '', '3', '18010679189', '0', '1496', null, null, '2019-09-29 08:18:59', '1', '104.048209', '30.623740', '510000', '四川省', '510100', '成都市', '510101', '市辖区', '0', '壳牌', '', '成都市高新区创业路51号', '51010000002');
INSERT INTO zsys_oil_station VALUES ('1586', '延长壳牌（四川）石油有限公司宜宾翠屏吊黄楼加油站', '宜宾翠屏吊黄楼加油站', '宜宾市翠屏区安埠吊黄楼物流中心A-01-04号', '', '3', '13568586884', '0', '1586', null, null, '2019-09-29 08:18:59', '1', '104.626125', '28.797243', '510000', '四川省', '511500', '宜宾市', '511502', '翠屏区', '0', '壳牌', '', '宜宾市翠屏区安埠吊黄楼物流中心A-01-04号', '51150000001');
INSERT INTO zsys_oil_station VALUES ('1677', '壳牌天津分公司安达加油站', '壳牌天津安达加油站', '天津市北辰区大张庄镇津围公路', '', '3', '​18322740916', '0', '1677', null, null, '2019-09-29 08:19:00', '1', '117.240249', '39.278787', '120000', '天津市', '120100', '市辖区', '120113', '北辰区', '0', '壳牌', '', '天津市北辰区大张庄镇津围公路', '12010000046');
INSERT INTO zsys_oil_station VALUES ('1692', '壳牌天津分公司安全加油站', '壳牌天津安全加油站', '天津市宁河县桥北镇赵庄中学北侧', '', '3', '​18322740916', '0', '1692', null, null, '2019-09-29 08:19:00', '1', '117.806475', '39.362481', '120000', '天津市', '120100', '市辖区', '120117', '宁河区', '0', '壳牌', '', '天津市宁河县桥北镇赵庄中学北侧', '12010000051');
INSERT INTO zsys_oil_station VALUES ('1696', '壳牌天津分公司白堤路加油站', '壳牌天津白堤路加油站', '天津市南开区白堤路273号', '', '3', '​18322740916', '0', '1696', null, null, '2019-09-29 08:19:00', '1', '117.163045', '39.112250', '120000', '天津市', '120100', '市辖区', '120104', '南开区', '0', '壳牌', '', '壳牌天津分公司白堤路加油站', '​12010000012');
INSERT INTO zsys_oil_station VALUES ('1697', '壳牌天津分公司渤海加油站', '壳牌天津渤海加油站', '天津市汉沽区汉北路蛏头沽村北', '', '3', '​18322740916', '0', '1697', null, null, '2019-09-29 08:19:00', '1', '117.797517', '39.150147', '120000', '天津市', '120100', '市辖区', '120116', '滨海新区', '0', '壳牌', '', '天津市汉沽区汉北路蛏头沽村北', '12010000035');
INSERT INTO zsys_oil_station VALUES ('1807', '延长壳牌（四川）石油有限公司成温邛高速公路南站加油站', '成温邛高速公路南站加油站', '成都市崇州市崇阳镇东泉村壳牌加油站', '', '3', '13666162990 	', '0', '1807', null, null, '2019-09-29 08:19:00', '1', '103.647823', '30.631749', '510000', '四川省', '510100', '成都市', '510184', '崇州市', '1', '壳牌', 'S8', '成都市崇州市崇阳镇东泉村壳牌加油站', '51010000007');
INSERT INTO zsys_oil_station VALUES ('1820', '壳牌天津分公司长江道加油站', '壳牌天津长江道加油站', '天津市南开区长江道青年路交口', '', '3', '​18322740916', '0', '1820', null, null, '2019-09-29 08:19:00', '1', '117.162142', '39.136260', '120000', '天津市', '120100', '市辖区', '120104', '南开区', '0', '壳牌', '', '天津市南开区长江道青年路交口', '12010000010');
INSERT INTO zsys_oil_station VALUES ('1823', '壳牌天津分公司程家庄加油站', '壳牌天津程家庄加油站', '天津市蓟县仓桑公路东北侧、蓟宝路东侧', '', '3', '​18322740916', '0', '1823', null, null, '2019-09-29 08:19:00', '1', '117.392514', '39.912537', '120000', '天津市', '120100', '市辖区', '120119', '蓟州区', '0', '壳牌', '', '天津市蓟县仓桑公路东北侧、蓟宝路东侧', '12010000042');
INSERT INTO zsys_oil_station VALUES ('1830', '壳牌天津分公司崔黄口加油站', '壳牌天津崔黄口加油站', '天津市武清区津围公路崔黄口镇大曹庄村壳牌加油站', '', '3', '​18322740916', '0', '1830', null, null, '2019-09-29 08:19:00', '1', '117.190855', '39.515458', '120000', '天津市', '120100', '市辖区', '120114', '武清区', '0', '壳牌', '', '天津市武清区津围公路崔黄口镇大曹庄村壳牌加油站', '12010000016');
INSERT INTO zsys_oil_station VALUES ('1831', '壳牌天津分公司大沽南路加油站', '壳牌天津大沽南路加油站', '天津市津南区双港镇大沽南路南侧', '', '3', '​18322740916', '0', '1831', null, null, '2019-09-29 08:19:00', '1', '117.307727', '39.064241', '120000', '天津市', '120100', '市辖区', '120112', '津南区', '0', '壳牌', '', '天津市津南区双港镇大沽南路南侧', '12010000011');
INSERT INTO zsys_oil_station VALUES ('1832', '壳牌天津分公司大口屯加油站', '壳牌天津大口屯加油站', '天津市宝坻津围公路大口屯中心镇内', '', '3', '​18322740916', '0', '1832', null, null, '2019-09-29 08:19:00', '1', '117.254515', '39.594586', '120000', '天津市', '120100', '市辖区', '120115', '宝坻区', '0', '壳牌', '', '天津市宝坻津围公路大口屯中心镇内', '12010000060');
INSERT INTO zsys_oil_station VALUES ('1833', '壳牌天津分公司大孟庄加油站', '壳牌天津大孟庄加油站', '天津市武清区京津公路大孟庄轧花厂南', '', '3', '​18322740916', '0', '1833', null, null, '2019-09-29 08:19:00', '1', '117.001801', '39.527506', '120000', '天津市', '120100', '市辖区', '120114', '武清区', '0', '壳牌', '', '天津市武清区京津公路大孟庄轧花厂南', '12010000025');
INSERT INTO zsys_oil_station VALUES ('1834', '壳牌天津分公司大沙河加油站', '壳牌天津大沙河加油站', '天津市武清区河西务镇京津公路大沙河村北', '', '3', '​18322740916', '0', '1834', null, null, '2019-09-29 08:19:00', '1', '116.931881', '39.670367', '120000', '天津市', '120100', '市辖区', '120114', '武清区', '0', '壳牌', '', '天津市武清区河西务镇京津公路大沙河村北', '12010000027');
INSERT INTO zsys_oil_station VALUES ('1836', '壳牌天津分公司大洋加油站', '壳牌天津大洋加油站', '天津市静海县大邱庄镇大屯村静王公路东侧', '', '3', '​18322740916', '0', '1836', null, null, '2019-09-29 08:19:01', '1', '117.075603', '38.821213', '120000', '天津市', '120100', '市辖区', '120118', '静海区', '0', '壳牌', '', '天津市静海县大邱庄镇大屯村静王公路东侧', '12010000034');
INSERT INTO zsys_oil_station VALUES ('1837', '壳牌天津分公司东堼加油站', '壳牌天津东堼加油站', '天津市东丽区军粮城镇东堼村津塘公路九号桥东', '', '3', '​18322740916', '0', '1837', null, null, '2019-09-29 08:19:01', '1', '117.472799', '39.053426', '120000', '天津市', '120100', '市辖区', '120110', '东丽区', '0', '壳牌', '', '天津市东丽区军粮城镇东堼村津塘公路九号桥东', '12010000058');
INSERT INTO zsys_oil_station VALUES ('1838', '壳牌天津分公司东安加油站', '壳牌天津东安加油站', '天津市东丽区大毕庄镇南孙庄村', '', '3', '​18322740916', '0', '1838', null, null, '2019-09-29 08:19:01', '1', '117.313963', '39.223277', '120000', '天津市', '120100', '市辖区', '120110', '东丽区', '0', '壳牌', '', '天津市东丽区大毕庄镇南孙庄村', '12010000030');
INSERT INTO zsys_oil_station VALUES ('1839', '壳牌天津分公司东仲加油站', '壳牌天津东仲加油站', '天津市津南区葛沽镇西关村', '', '3', '​18322740916', '0', '1839', null, null, '2019-09-29 08:19:01', '1', '117.472799', '39.053426', '120000', '天津市', '120100', '市辖区', '120112', '津南区', '0', '壳牌', '', '天津市津南区葛沽镇西关村', '12010000052');
INSERT INTO zsys_oil_station VALUES ('1840', '壳牌天津分公司独流加油站', '壳牌天津独流加油站', '天津市静海县津静公路独流镇北肖楼', '', '3', '​18322740916', '0', '1840', null, null, '2019-09-29 08:19:01', '1', '116.929085', '39.026864', '120000', '天津市', '120100', '市辖区', '120118', '静海区', '0', '壳牌', '', '天津市静海县津静公路独流镇北肖楼', '12010000022');
INSERT INTO zsys_oil_station VALUES ('1841', '壳牌天津分公司工农加油站', '壳牌天津工农加油站', '天津市西青区津静公路与海泰大道交口', '', '3', '​18322740916', '0', '1841', null, null, '2019-09-29 08:19:01', '1', '117.075865', '39.094937', '120000', '天津市', '120100', '市辖区', '120111', '西青区', '0', '壳牌', '', '天津市西青区津静公路与海泰大道交口', '12010000007');
INSERT INTO zsys_oil_station VALUES ('1843', '壳牌天津分公司冠芳加油站', '壳牌天津冠芳加油站', '天津市武清区豆张庄镇京福公路与京沪高速交口壳牌加油站', '', '3', '​18322740916', '0', '1843', null, null, '2019-09-29 08:19:01', '1', '116.967123', '39.399800', '120000', '天津市', '120100', '市辖区', '120114', '武清区', '0', '壳牌', '', '天津市武清区豆张庄镇京福公路与京沪高速交口壳牌加油站', '12010000064');
INSERT INTO zsys_oil_station VALUES ('5000', '高速信联测试加油站1', '高速信联测试加油站1', '山东省济南市高新区玉兰广场', '', '2', '18315418931', '0', '5000', null, null, '2019-09-29 08:19:01', '1', '114.373674', '38.133671', '370000', '山东省', '370100', '济南市', '370102', '历下区', '0', '中国石化', '', '济南市历下区经十路2号', '37020000003');
INSERT INTO zsys_oil_station VALUES ('5001', '高速信联测试加油站2', '高速信联测试加油站2', '山东省济南市高新区玉兰广场', '', '1', '18633506680', '0', '5001', null, null, '2019-09-29 08:19:01', '1', '114.373674', '38.133671', '370000', '山东省', '370100', '济南市', '370102', '历下区', '0', '中石油', '', '济南市历下区经十路2号', '37010080096');
INSERT INTO zsys_oil_station VALUES ('5002', 'ceshi', 'ss', '北京市北京市西城区', '', null, '', '0', '5002', null, null, '2019-09-29 08:25:58', '1', '116.000000', '40.000000', '110000', '北京市', '110000', '北京市', '110102', '西城区', '0', '哒哒哒哒哒哒', '', '', '');
INSERT INTO zsys_oil_station VALUES ('5003', 'ww', 'w', '北京市北京市西城区', '', null, '', '0', '5003', null, null, '2019-09-29 08:25:58', '1', '115.000000', '22.000000', '110000', '北京市', '110000', '北京市', '110102', '西城区', '0', '京博', 'G5001', '重庆市绕城高速公路', '');
INSERT INTO zsys_oil_station VALUES ('5004', '智慧油客-春霖专用', '春霖专用', 'llala', 'http://oss.test.etcsd.cn:10080/object/8e0d22aa20ae404ca9cf1a57e9700a28', '1', '', '0', '5004', null, null, '2019-09-29 08:25:58', '1', '115.704735', '34.408602', '370000', '山东省', '371500', '聊城市', '371521', '阳谷县', '0', '中石油', '', '', '');
INSERT INTO zsys_oil_station VALUES ('5005', '智慧油客测试', '智慧油客测试', '北京市北京市东城区哪里呀', '', null, '', '0', '5005', null, null, '2019-09-29 08:25:58', '1', '117.131276', '36.659542', '110000', '北京市', '110000', '北京市', '110101', '东城区', '0', '其它', '', '', '37020000003');
INSERT INTO zsys_oil_station VALUES ('5006', '测试zx', '测试', '北京市北京市朝阳区', '', null, '', '0', '5006', null, null, '2019-09-29 08:25:58', '1', '116.000000', '7.000000', '110000', '北京市', '110000', '北京市', '110105', '朝阳区', '0', '瀚通石化', 'G5001', '重庆市绕城高速公路', '');
INSERT INTO zsys_oil_station VALUES ('5007', '啛啛喳喳错', '啦啦啦啦', '天津市天津市和平区', '', null, '', '0', '5007', null, null, '2019-09-29 08:25:58', '1', '116.000000', '6.000000', '120000', '天津市', '120000', '天津市', '120101', '和平区', '0', '京博', '', '', '');
INSERT INTO zsys_oil_station VALUES ('5008', '全称测试', '简称啊', '北京市北京市丰台区', '', null, '18866666666', '0', '5008', null, null, '2019-09-29 08:25:58', '1', '123.000000', '9.000000', '110000', '北京市', '110000', '北京市', '110106', '丰台区', '0', '中胜石油', 'G75', '兰海高速', '001');

-- ----------------------------
-- Table structure for `zsys_option`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_option`;
CREATE TABLE `zsys_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='全站配置表';

-- ----------------------------
-- Records of zsys_option
-- ----------------------------
INSERT INTO zsys_option VALUES ('1', '1', 'site_info', '{\"site_name\":\"\\u54ea\\u5412\",\"site_host\":\"1\",\"site_status\":\"1\",\"login_msg\":\"1111\",\"site_logo\":\"https:\\/\\/img.alicdn.com\\/imgextra\\/i1\\/35701693\\/TB2pYIGjYtlpuFjSspoXXbcDpXa_!!35701693.png\",\"site_logo_login\":\"https:\\/\\/img.alicdn.com\\/imgextra\\/i3\\/35701693\\/TB2yhmEnHJmpuFjSZFwXXaE4VXa_!!35701693.png\",\"site_bg_pc\":\"https:\\/\\/img.alicdn.com\\/imgextra\\/i1\\/35701693\\/O1CN01vwIXSI1ONR5mklr3W_!!35701693.jpg\",\"site_bg_mobile\":\"https:\\/\\/img.alicdn.com\\/imgextra\\/i1\\/35701693\\/O1CN01KmuLXG1ONR5lLSfCw_!!35701693.jpg\",\"site_seo_title\":\"\\u516b\\u6212\",\"site_msg\":\"1\",\"site_dis_money\":\"0.5\"}');
INSERT INTO zsys_option VALUES ('2', '1', 'cmf_settings', '{\"open_registration\":\"0\",\"banned_usernames\":\"\"}');
INSERT INTO zsys_option VALUES ('3', '1', 'cdn_settings', '{\"cdn_static_root\":\"\"}');
INSERT INTO zsys_option VALUES ('5', '1', 'admin_settings', '{\"admin_password\":\"\",\"admin_theme\":\"admin_simpleboot3\",\"admin_style\":\"simpleadmin\"}');

-- ----------------------------
-- Table structure for `zsys_pay_log`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_pay_log`;
CREATE TABLE `zsys_pay_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '关联订单id',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '关联用户id',
  `pay_price` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `wechat_orderno` varchar(100) DEFAULT NULL COMMENT '微信支付单号',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `wechat_payno` varchar(100) DEFAULT NULL COMMENT '微信支付流水号',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户支付记录表';

-- ----------------------------
-- Records of zsys_pay_log
-- ----------------------------
INSERT INTO zsys_pay_log VALUES ('1', '5', '1', '0.01', '4200000429201911042980699343', '2019-11-04 09:53:27', '4200000429201911042980699343');
INSERT INTO zsys_pay_log VALUES ('2', '0', '1', '0.01', 'CZ201911045753534979', '2019-11-04 16:05:37', '4200000430201911043305947780');
INSERT INTO zsys_pay_log VALUES ('3', '0', '1', '0.01', 'CZ201911045150575443', '2019-11-04 16:22:18', '4200000423201911043143577231');

-- ----------------------------
-- Table structure for `zsys_pay_order`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_pay_order`;
CREATE TABLE `zsys_pay_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_num` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单编号',
  `xl_order_id` char(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '山高订单id',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `order_price` decimal(10,2) DEFAULT NULL COMMENT '订单总金额',
  `dis_price` decimal(10,2) DEFAULT NULL COMMENT '优惠金额',
  `pay_price` decimal(10,2) DEFAULT NULL COMMENT '实际支付金额',
  `status` smallint(1) DEFAULT '0' COMMENT '订单状态(0:未支付，1：已支付，2：已取消，3：支付失败，4：支付中)',
  `carnum` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户车牌号',
  `order_time` datetime DEFAULT NULL COMMENT '下单时间',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `order_type` smallint(1) DEFAULT NULL COMMENT '订单类型（1：支付，2：充值）',
  `pay_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付方式(wechat：微信，banlance：余额)',
  `oil_num` decimal(10,2) DEFAULT '0.00' COMMENT '加油量（L）',
  `gasstation_id` bigint(20) DEFAULT '0' COMMENT '关联加油站id',
  `oilnumber_id` bigint(20) DEFAULT '0' COMMENT '关联的油号id',
  `oilgun_id` bigint(20) DEFAULT '0' COMMENT '关联的油枪id',
  `oil_unitprice` decimal(10,2) DEFAULT NULL COMMENT '加油单价（元/L）',
  `pay_qrcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付二维码图片地址',
  `terminal_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Pos终端号',
  `update_time` datetime DEFAULT NULL,
  `wx_pay` decimal(10,2) DEFAULT NULL,
  `balance_pay` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单数据表';

-- ----------------------------
-- Records of zsys_pay_order
-- ----------------------------
INSERT INTO zsys_pay_order VALUES ('1', '201911025353971049', '19110221603', '1', '0.01', '0.00', '0.01', '1', '', '2019-11-02 11:03:52', '2019-11-02 11:04:00', '0', '', '0.00', '5010', '0', '0', '7.15', 'SHANDONGGS/V1;48201911025353971049', '370100804490030', '2019-11-02 11:04:00', '0.01', '0.00');
INSERT INTO zsys_pay_order VALUES ('3', '201911045453100572', '19110421624', '1', '0.01', '0.00', '0.01', '1', '', '2019-11-04 09:27:59', '2019-11-04 09:28:09', '0', '', '0.00', '5010', '0', '0', '7.15', 'SHANDONGGS/V1;48201911045453100572', '370100804490030', '2019-11-04 09:28:09', '0.01', '0.00');
INSERT INTO zsys_pay_order VALUES ('4', '201911045254484979', '19110421626', '1', '0.01', '0.00', '0.01', '1', '', '2019-11-04 09:45:29', '2019-11-04 09:45:37', '0', '', '0.00', '5010', '0', '0', '7.15', 'SHANDONGGS/V1;48201911045254484979', '370100804490030', '2019-11-04 09:45:37', '0.01', '0.00');
INSERT INTO zsys_pay_order VALUES ('5', '201911049856971065', '19110421628', '1', '0.01', '0.00', '0.01', '1', '', '2019-11-04 09:53:19', '2019-11-04 09:53:27', '0', '', '0.00', '5010', '0', '0', '7.15', 'SHANDONGGS/V1;48201911049856971065', '370100804490030', '2019-11-04 09:53:27', '0.01', '0.00');
INSERT INTO zsys_pay_order VALUES ('6', '201911049798485538', null, '1', '0.00', '0.00', '0.00', '0', '', '2019-11-04 16:27:22', null, '0', '', '0.00', '0', '0', '0', '0.00', null, '', null, null, null);
INSERT INTO zsys_pay_order VALUES ('7', '201911044948515682', null, '1', '0.00', '0.00', '0.00', '0', '', '2019-11-04 16:53:21', null, '0', '', '0.00', '0', '0', '0', '0.00', null, '', null, null, null);
INSERT INTO zsys_pay_order VALUES ('8', '201911045756574870', null, '1', '0.00', '0.00', '0.00', '0', '', '2019-11-04 16:58:01', null, '0', '', '0.00', '0', '0', '0', '0.00', null, '', null, null, null);
INSERT INTO zsys_pay_order VALUES ('9', '201911041015757541', null, '1', '0.00', '0.00', '0.00', '0', '', '2019-11-04 17:01:50', null, '0', '', '0.00', '0', '0', '0', '0.00', null, '', null, null, null);
INSERT INTO zsys_pay_order VALUES ('10', '201911049998101524', null, '1', '0.00', '0.00', '0.00', '0', '', '2019-11-04 17:03:24', null, '0', '', '0.00', '0', '0', '0', '0.00', null, '', null, null, null);
INSERT INTO zsys_pay_order VALUES ('11', '201911041011005439', null, '1', '0.00', '0.00', '0.00', '0', '', '2019-11-04 17:03:58', null, '0', '', '0.00', '0', '0', '0', '0.00', null, '', null, null, null);
INSERT INTO zsys_pay_order VALUES ('12', '201911045750485260', null, '1', '0.00', '0.00', '0.00', '0', '', '2019-11-04 17:06:49', null, '0', '', '0.00', '0', '0', '0', '0.00', null, '', null, null, null);
INSERT INTO zsys_pay_order VALUES ('13', '201911045410155143', null, '1', '0.00', '0.00', '0.00', '0', '', '2019-11-04 17:14:14', null, '0', '', '0.00', '0', '0', '0', '0.00', null, '', null, null, null);
INSERT INTO zsys_pay_order VALUES ('14', '201911045755485371', null, '1', '0.00', '0.00', '0.00', '0', '', '2019-11-04 17:16:25', null, '0', '', '0.00', '0', '0', '0', '0.00', null, '', null, null, null);
INSERT INTO zsys_pay_order VALUES ('15', '201911044910199528', null, '6', '0.00', '0.00', '0.00', '0', '', '2019-11-04 17:20:33', null, '0', '', '0.00', '0', '0', '0', '0.00', null, '', null, null, null);
INSERT INTO zsys_pay_order VALUES ('16', '201911049852984898', null, '8', '0.00', '0.00', '0.00', '0', '', '2019-11-04 17:21:15', null, '0', '', '0.00', '0', '0', '0', '0.00', null, '', null, null, null);
INSERT INTO zsys_pay_order VALUES ('17', '201911054950974810', null, '11', '0.00', '0.00', '0.00', '0', '', '2019-11-05 09:46:09', null, '0', '', '0.00', '0', '0', '0', '0.00', null, '', null, null, null);
INSERT INTO zsys_pay_order VALUES ('18', '201911051025055473', null, '12', '0.00', '0.00', '0.00', '0', '', '2019-11-05 09:48:15', null, '0', '', '0.00', '0', '0', '0', '0.00', null, '', null, null, null);

-- ----------------------------
-- Table structure for `zsys_province_oilprice`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_province_oilprice`;
CREATE TABLE `zsys_province_oilprice` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `province_code` varchar(20) NOT NULL COMMENT '省份编码',
  `oil_no` varchar(20) NOT NULL COMMENT '油号',
  `oil_type` smallint(1) NOT NULL COMMENT '油类型（0：柴油，1汽油）',
  `oil_price` decimal(10,2) NOT NULL COMMENT '省市场油价',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `note` varchar(255) DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`province_code`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8mb4 COMMENT='各省份市场油价数据表';

-- ----------------------------
-- Records of zsys_province_oilprice
-- ----------------------------
INSERT INTO zsys_province_oilprice VALUES ('1', '110000', '2#', '0', '8.19', '2019-09-29 10:25:22', '2019-09-29 13:48:40', null);
INSERT INTO zsys_province_oilprice VALUES ('2', '110000', '89#', '1', '6.23', '2019-09-29 10:25:22', '2019-09-29 13:48:41', null);
INSERT INTO zsys_province_oilprice VALUES ('3', '110000', '1#', '0', '8.19', '2019-09-29 10:25:22', '2019-09-29 13:48:41', null);
INSERT INTO zsys_province_oilprice VALUES ('4', '110000', '0#', '0', '8.19', '2019-09-29 10:25:22', '2019-09-29 13:48:41', null);
INSERT INTO zsys_province_oilprice VALUES ('5', '110000', '98#', '1', '8.17', '2019-09-29 10:25:22', '2019-09-29 13:48:41', null);
INSERT INTO zsys_province_oilprice VALUES ('6', '110000', 'E92#', '1', '6.44', '2019-09-29 10:25:22', '2019-09-29 13:48:41', null);
INSERT INTO zsys_province_oilprice VALUES ('7', '110000', '95#', '1', '7.21', '2019-09-29 10:25:22', '2019-09-29 13:48:42', null);
INSERT INTO zsys_province_oilprice VALUES ('8', '110000', '92#', '1', '6.78', '2019-09-29 10:25:23', '2019-09-29 13:48:42', null);
INSERT INTO zsys_province_oilprice VALUES ('9', '120000', '2#', '0', '6.60', '2019-09-29 10:25:23', '2019-09-29 13:48:42', null);
INSERT INTO zsys_province_oilprice VALUES ('10', '120000', '89#', '1', '7.40', '2019-09-29 10:25:23', '2019-09-29 13:48:43', null);
INSERT INTO zsys_province_oilprice VALUES ('11', '120000', '1#', '0', '6.60', '2019-09-29 10:25:23', '2019-09-29 13:48:44', null);
INSERT INTO zsys_province_oilprice VALUES ('12', '120000', '0#', '0', '6.38', '2019-09-29 10:25:23', '2019-09-29 13:48:45', null);
INSERT INTO zsys_province_oilprice VALUES ('13', '120000', '98#', '1', '8.04', '2019-09-29 10:25:23', '2019-09-29 13:48:46', null);
INSERT INTO zsys_province_oilprice VALUES ('14', '120000', 'E92#', '1', '6.43', '2019-09-29 10:25:23', '2019-09-29 13:48:46', null);
INSERT INTO zsys_province_oilprice VALUES ('15', '120000', '95#', '1', '7.12', '2019-09-29 10:25:23', '2019-09-29 13:48:47', null);
INSERT INTO zsys_province_oilprice VALUES ('16', '120000', '92#', '1', '6.74', '2019-09-29 10:25:23', '2019-09-29 13:48:48', null);
INSERT INTO zsys_province_oilprice VALUES ('17', '130000', '2#', '0', '6.60', '2019-09-29 10:25:23', '2019-09-29 13:48:49', null);
INSERT INTO zsys_province_oilprice VALUES ('18', '130000', '89#', '1', '7.40', '2019-09-29 10:25:23', '2019-09-29 13:48:52', null);
INSERT INTO zsys_province_oilprice VALUES ('19', '130000', '1#', '0', '6.60', '2019-09-29 10:25:23', '2019-09-29 13:48:55', null);
INSERT INTO zsys_province_oilprice VALUES ('20', '130000', '0#', '0', '6.38', '2019-09-29 10:25:23', '2019-09-29 13:48:58', null);
INSERT INTO zsys_province_oilprice VALUES ('21', '130000', '98#', '1', '7.94', '2019-09-29 10:25:23', '2019-09-29 13:49:04', null);
INSERT INTO zsys_province_oilprice VALUES ('22', '130000', 'E92#', '1', '6.43', '2019-09-29 10:25:23', '2019-09-29 13:49:07', null);
INSERT INTO zsys_province_oilprice VALUES ('23', '130000', '95#', '1', '7.12', '2019-09-29 10:25:23', '2019-09-29 13:49:11', null);
INSERT INTO zsys_province_oilprice VALUES ('24', '130000', '92#', '1', '6.74', '2019-09-29 10:25:23', '2019-09-29 13:49:16', null);
INSERT INTO zsys_province_oilprice VALUES ('25', '140000', '2#', '0', '6.67', '2019-09-29 10:25:24', '2019-09-29 13:49:22', null);
INSERT INTO zsys_province_oilprice VALUES ('26', '140000', '89#', '1', '5.64', '2019-09-29 10:25:24', '2019-09-29 13:49:22', null);
INSERT INTO zsys_province_oilprice VALUES ('27', '140000', '1#', '0', '6.67', '2019-09-29 10:25:24', '2019-09-29 13:49:22', null);
INSERT INTO zsys_province_oilprice VALUES ('28', '140000', '0#', '0', '6.45', '2019-09-29 10:25:24', '2019-09-29 13:49:22', null);
INSERT INTO zsys_province_oilprice VALUES ('29', '140000', '98#', '1', '7.91', '2019-09-29 10:25:24', '2019-09-29 13:49:22', null);
INSERT INTO zsys_province_oilprice VALUES ('30', '140000', 'E92#', '1', '6.41', '2019-09-29 10:25:24', '2019-09-29 13:49:22', null);
INSERT INTO zsys_province_oilprice VALUES ('31', '140000', '95#', '1', '7.24', '2019-09-29 10:25:24', '2019-09-29 13:49:22', null);
INSERT INTO zsys_province_oilprice VALUES ('32', '140000', '92#', '1', '6.71', '2019-09-29 10:25:24', '2019-09-29 13:49:23', null);
INSERT INTO zsys_province_oilprice VALUES ('33', '150000', '2#', '0', '6.66', '2019-09-29 10:25:24', '2019-09-29 13:49:23', null);
INSERT INTO zsys_province_oilprice VALUES ('34', '150000', '89#', '1', '7.40', '2019-09-29 10:25:24', '2019-09-29 13:49:23', null);
INSERT INTO zsys_province_oilprice VALUES ('35', '150000', '1#', '0', '6.66', '2019-09-29 10:25:24', '2019-09-29 13:49:23', null);
INSERT INTO zsys_province_oilprice VALUES ('36', '150000', '0#', '0', '6.22', '2019-09-29 10:25:24', '2019-09-29 13:49:23', null);
INSERT INTO zsys_province_oilprice VALUES ('37', '150000', '98#', '1', '7.93', '2019-09-29 10:25:24', '2019-09-29 13:49:23', null);
INSERT INTO zsys_province_oilprice VALUES ('38', '150000', 'E92#', '1', '6.40', '2019-09-29 10:25:24', '2019-09-29 13:49:23', null);
INSERT INTO zsys_province_oilprice VALUES ('39', '150000', '95#', '1', '7.20', '2019-09-29 10:25:24', '2019-09-29 13:49:23', null);
INSERT INTO zsys_province_oilprice VALUES ('40', '150000', '92#', '1', '6.71', '2019-09-29 10:25:24', '2019-09-29 13:49:23', null);
INSERT INTO zsys_province_oilprice VALUES ('41', '210000', '2#', '0', '6.52', '2019-09-29 10:25:24', '2019-09-29 13:49:23', null);
INSERT INTO zsys_province_oilprice VALUES ('42', '210000', '89#', '1', '5.86', '2019-09-29 10:25:24', '2019-09-29 13:49:23', null);
INSERT INTO zsys_province_oilprice VALUES ('43', '210000', '1#', '0', '6.52', '2019-09-29 10:25:25', '2019-09-29 13:49:23', null);
INSERT INTO zsys_province_oilprice VALUES ('44', '210000', '0#', '0', '6.30', '2019-09-29 10:25:25', '2019-09-29 13:49:23', null);
INSERT INTO zsys_province_oilprice VALUES ('45', '210000', '98#', '1', '7.81', '2019-09-29 10:25:25', '2019-09-29 13:49:23', null);
INSERT INTO zsys_province_oilprice VALUES ('46', '210000', 'E92#', '1', '6.84', '2019-09-29 10:25:25', '2019-09-29 13:49:23', null);
INSERT INTO zsys_province_oilprice VALUES ('47', '210000', '95#', '1', '7.17', '2019-09-29 10:25:25', '2019-09-29 13:49:23', null);
INSERT INTO zsys_province_oilprice VALUES ('48', '210000', '92#', '1', '6.73', '2019-09-29 10:25:25', '2019-09-29 13:49:23', null);
INSERT INTO zsys_province_oilprice VALUES ('49', '220000', '2#', '0', '6.53', '2019-09-29 10:25:25', '2019-09-29 13:49:24', null);
INSERT INTO zsys_province_oilprice VALUES ('50', '220000', '89#', '1', '6.10', '2019-09-29 10:25:25', '2019-09-29 13:49:24', null);
INSERT INTO zsys_province_oilprice VALUES ('51', '220000', '1#', '0', '6.53', '2019-09-29 10:25:25', '2019-09-29 13:49:24', null);
INSERT INTO zsys_province_oilprice VALUES ('52', '220000', '0#', '0', '6.31', '2019-09-29 10:25:25', '2019-09-29 13:49:24', null);
INSERT INTO zsys_province_oilprice VALUES ('53', '220000', '98#', '1', '7.90', '2019-09-29 10:25:25', '2019-09-29 13:49:24', null);
INSERT INTO zsys_province_oilprice VALUES ('54', '220000', 'E92#', '1', '6.41', '2019-09-29 10:25:25', '2019-09-29 13:49:24', null);
INSERT INTO zsys_province_oilprice VALUES ('55', '220000', '95#', '1', '7.25', '2019-09-29 10:25:25', '2019-09-29 13:49:24', null);
INSERT INTO zsys_province_oilprice VALUES ('56', '220000', '92#', '1', '6.72', '2019-09-29 10:25:25', '2019-09-29 13:49:24', null);
INSERT INTO zsys_province_oilprice VALUES ('57', '230000', '2#', '0', '6.22', '2019-09-29 10:25:25', '2019-09-29 13:49:24', null);
INSERT INTO zsys_province_oilprice VALUES ('58', '230000', '89#', '1', '6.10', '2019-09-29 10:25:25', '2019-09-29 13:49:24', null);
INSERT INTO zsys_province_oilprice VALUES ('59', '230000', '1#', '0', '6.22', '2019-09-29 10:25:26', '2019-09-29 13:49:24', null);
INSERT INTO zsys_province_oilprice VALUES ('60', '230000', '0#', '0', '6.18', '2019-09-29 10:25:26', '2019-09-29 13:49:24', null);
INSERT INTO zsys_province_oilprice VALUES ('61', '230000', '98#', '1', '8.12', '2019-09-29 10:25:26', '2019-09-29 13:49:24', null);
INSERT INTO zsys_province_oilprice VALUES ('62', '230000', 'E92#', '1', '6.44', '2019-09-29 10:25:26', '2019-09-29 13:49:24', null);
INSERT INTO zsys_province_oilprice VALUES ('63', '230000', '95#', '1', '7.12', '2019-09-29 10:25:26', '2019-09-29 13:49:24', null);
INSERT INTO zsys_province_oilprice VALUES ('64', '230000', '92#', '1', '6.68', '2019-09-29 10:25:26', '2019-09-29 13:49:25', null);
INSERT INTO zsys_province_oilprice VALUES ('65', '310000', '2#', '0', '6.58', '2019-09-29 10:25:26', '2019-09-29 13:49:25', null);
INSERT INTO zsys_province_oilprice VALUES ('66', '310000', '89#', '1', '6.62', '2019-09-29 10:25:26', '2019-09-29 13:49:25', null);
INSERT INTO zsys_province_oilprice VALUES ('67', '310000', '1#', '0', '6.58', '2019-09-29 10:25:26', '2019-09-29 13:49:25', null);
INSERT INTO zsys_province_oilprice VALUES ('68', '310000', '0#', '0', '6.36', '2019-09-29 10:25:26', '2019-09-29 13:49:25', null);
INSERT INTO zsys_province_oilprice VALUES ('69', '310000', '98#', '1', '7.90', '2019-09-29 10:25:26', '2019-09-29 13:49:25', null);
INSERT INTO zsys_province_oilprice VALUES ('70', '310000', 'E92#', '1', '6.41', '2019-09-29 10:25:26', '2019-09-29 13:49:25', null);
INSERT INTO zsys_province_oilprice VALUES ('71', '310000', '95#', '1', '7.15', '2019-09-29 10:25:26', '2019-09-29 13:49:25', null);
INSERT INTO zsys_province_oilprice VALUES ('72', '310000', '92#', '1', '6.72', '2019-09-29 10:25:26', '2019-09-29 13:49:25', null);
INSERT INTO zsys_province_oilprice VALUES ('73', '320000', '2#', '0', '6.57', '2019-09-29 10:25:26', '2019-09-29 13:49:25', null);
INSERT INTO zsys_province_oilprice VALUES ('74', '320000', '89#', '1', '6.66', '2019-09-29 10:25:26', '2019-09-29 13:49:28', null);
INSERT INTO zsys_province_oilprice VALUES ('75', '320000', '1#', '0', '6.57', '2019-09-29 10:25:26', '2019-09-29 13:49:31', null);
INSERT INTO zsys_province_oilprice VALUES ('76', '320000', '0#', '0', '6.35', '2019-09-29 10:25:26', '2019-09-29 13:49:34', null);
INSERT INTO zsys_province_oilprice VALUES ('77', '320000', '98#', '1', '8.04', '2019-09-29 10:25:27', '2019-09-29 13:49:40', null);
INSERT INTO zsys_province_oilprice VALUES ('78', '320000', 'E92#', '1', '6.42', '2019-09-29 10:25:27', '2019-09-29 13:49:44', null);
INSERT INTO zsys_province_oilprice VALUES ('79', '320000', '95#', '1', '7.16', '2019-09-29 10:25:27', '2019-09-29 13:49:47', null);
INSERT INTO zsys_province_oilprice VALUES ('80', '320000', '92#', '1', '6.73', '2019-09-29 10:25:27', '2019-09-29 13:49:52', null);
INSERT INTO zsys_province_oilprice VALUES ('81', '330000', '2#', '0', '6.59', '2019-09-29 10:25:27', '2019-09-29 13:49:58', null);
INSERT INTO zsys_province_oilprice VALUES ('82', '330000', '89#', '1', '5.99', '2019-09-29 10:25:27', '2019-09-29 13:49:58', null);
INSERT INTO zsys_province_oilprice VALUES ('83', '330000', '1#', '0', '6.59', '2019-09-29 10:25:27', '2019-09-29 13:49:58', null);
INSERT INTO zsys_province_oilprice VALUES ('84', '330000', '0#', '0', '6.37', '2019-09-29 10:25:27', '2019-09-29 13:49:58', null);
INSERT INTO zsys_province_oilprice VALUES ('85', '330000', '98#', '1', '7.84', '2019-09-29 10:25:27', '2019-09-29 13:49:58', null);
INSERT INTO zsys_province_oilprice VALUES ('86', '330000', 'E92#', '1', '6.42', '2019-09-29 10:25:27', '2019-09-29 13:49:58', null);
INSERT INTO zsys_province_oilprice VALUES ('87', '330000', '95#', '1', '7.16', '2019-09-29 10:25:27', '2019-09-29 13:49:58', null);
INSERT INTO zsys_province_oilprice VALUES ('88', '330000', '92#', '1', '6.73', '2019-09-29 10:25:27', '2019-09-29 13:49:58', null);
INSERT INTO zsys_province_oilprice VALUES ('89', '340000', '2#', '0', '6.64', '2019-09-29 10:25:27', '2019-09-29 13:49:59', null);
INSERT INTO zsys_province_oilprice VALUES ('90', '340000', '89#', '1', '7.44', '2019-09-29 10:25:27', '2019-09-29 13:50:04', null);
INSERT INTO zsys_province_oilprice VALUES ('91', '340000', '1#', '0', '6.64', '2019-09-29 10:25:27', '2019-09-29 13:50:10', null);
INSERT INTO zsys_province_oilprice VALUES ('92', '340000', '0#', '0', '6.42', '2019-09-29 10:25:27', '2019-09-29 13:50:15', null);
INSERT INTO zsys_province_oilprice VALUES ('93', '340000', '98#', '1', '8.04', '2019-09-29 10:25:28', '2019-09-29 13:50:26', null);
INSERT INTO zsys_province_oilprice VALUES ('94', '340000', 'E92#', '1', '6.41', '2019-09-29 10:25:28', '2019-09-29 13:50:32', null);
INSERT INTO zsys_province_oilprice VALUES ('95', '340000', '95#', '1', '7.21', '2019-09-29 10:25:28', '2019-09-29 13:50:38', null);
INSERT INTO zsys_province_oilprice VALUES ('96', '340000', '92#', '1', '6.72', '2019-09-29 10:25:28', '2019-09-29 13:50:48', null);
INSERT INTO zsys_province_oilprice VALUES ('97', '350000', '2#', '0', '6.60', '2019-09-29 10:25:28', '2019-09-29 13:50:58', null);
INSERT INTO zsys_province_oilprice VALUES ('98', '350000', '89#', '1', '5.62', '2019-09-29 10:25:28', '2019-09-29 13:50:58', null);
INSERT INTO zsys_province_oilprice VALUES ('99', '350000', '1#', '0', '6.60', '2019-09-29 10:25:28', '2019-09-29 13:50:59', null);
INSERT INTO zsys_province_oilprice VALUES ('100', '350000', '0#', '0', '6.38', '2019-09-29 10:25:28', '2019-09-29 13:50:59', null);
INSERT INTO zsys_province_oilprice VALUES ('101', '350000', '98#', '1', '7.86', '2019-09-29 10:25:28', '2019-09-29 13:50:59', null);
INSERT INTO zsys_province_oilprice VALUES ('102', '350000', 'E92#', '1', '6.42', '2019-09-29 10:25:28', '2019-09-29 13:50:59', null);
INSERT INTO zsys_province_oilprice VALUES ('103', '350000', '95#', '1', '7.18', '2019-09-29 10:25:28', '2019-09-29 13:50:59', null);
INSERT INTO zsys_province_oilprice VALUES ('104', '350000', '92#', '1', '6.72', '2019-09-29 10:25:28', '2019-09-29 13:50:59', null);
INSERT INTO zsys_province_oilprice VALUES ('105', '360000', '2#', '0', '6.65', '2019-09-29 10:25:28', '2019-09-29 13:50:59', null);
INSERT INTO zsys_province_oilprice VALUES ('106', '360000', '89#', '1', '7.38', '2019-09-29 10:25:28', '2019-09-29 13:50:59', null);
INSERT INTO zsys_province_oilprice VALUES ('107', '360000', '1#', '0', '6.65', '2019-09-29 10:25:28', '2019-09-29 13:50:59', null);
INSERT INTO zsys_province_oilprice VALUES ('108', '360000', '0#', '0', '6.43', '2019-09-29 10:25:28', '2019-09-29 13:50:59', null);
INSERT INTO zsys_province_oilprice VALUES ('109', '360000', '98#', '1', '8.10', '2019-09-29 10:25:28', '2019-09-29 13:50:59', null);
INSERT INTO zsys_province_oilprice VALUES ('110', '360000', 'E92#', '1', '6.41', '2019-09-29 10:25:29', '2019-09-29 13:50:59', null);
INSERT INTO zsys_province_oilprice VALUES ('111', '360000', '95#', '1', '7.21', '2019-09-29 10:25:29', '2019-09-29 13:50:59', null);
INSERT INTO zsys_province_oilprice VALUES ('112', '360000', '92#', '1', '6.72', '2019-09-29 10:25:29', '2019-09-29 13:50:59', null);
INSERT INTO zsys_province_oilprice VALUES ('113', '370000', '2#', '0', '6.60', '2019-09-29 10:25:29', '2019-09-29 13:50:59', null);
INSERT INTO zsys_province_oilprice VALUES ('114', '370000', '89#', '1', '5.54', '2019-09-29 10:25:29', '2019-09-29 13:51:20', null);
INSERT INTO zsys_province_oilprice VALUES ('115', '370000', '1#', '0', '6.60', '2019-09-29 10:25:29', '2019-09-29 13:51:41', null);
INSERT INTO zsys_province_oilprice VALUES ('116', '370000', '0#', '0', '6.38', '2019-09-29 10:25:29', '2019-09-29 13:52:01', null);
INSERT INTO zsys_province_oilprice VALUES ('117', '370000', '98#', '1', '7.94', '2019-09-29 10:25:29', '2019-09-29 13:52:37', null);
INSERT INTO zsys_province_oilprice VALUES ('118', '370000', 'E92#', '1', '6.42', '2019-09-29 10:25:29', '2019-09-29 13:53:05', null);
INSERT INTO zsys_province_oilprice VALUES ('119', '370000', '95#', '1', '7.22', '2019-09-29 10:25:29', '2019-09-29 13:53:25', null);
INSERT INTO zsys_province_oilprice VALUES ('120', '370000', '92#', '1', '6.73', '2019-09-29 10:25:29', '2019-09-29 13:54:03', null);
INSERT INTO zsys_province_oilprice VALUES ('121', '410000', '2#', '0', '6.59', '2019-09-29 10:25:29', '2019-09-29 13:54:39', null);
INSERT INTO zsys_province_oilprice VALUES ('122', '410000', '89#', '1', '5.68', '2019-09-29 10:25:29', '2019-09-29 13:54:40', null);
INSERT INTO zsys_province_oilprice VALUES ('123', '410000', '1#', '0', '6.59', '2019-09-29 10:25:29', '2019-09-29 13:54:40', null);
INSERT INTO zsys_province_oilprice VALUES ('124', '410000', '0#', '0', '6.35', '2019-09-29 10:25:29', '2019-09-29 13:54:41', null);
INSERT INTO zsys_province_oilprice VALUES ('125', '410000', '98#', '1', '7.87', '2019-09-29 10:25:29', '2019-09-29 13:54:42', null);
INSERT INTO zsys_province_oilprice VALUES ('126', '410000', 'E92#', '1', '8.50', '2019-09-29 10:25:29', '2019-09-29 13:54:43', null);
INSERT INTO zsys_province_oilprice VALUES ('127', '410000', '95#', '1', '7.22', '2019-09-29 10:25:30', '2019-09-29 13:54:43', null);
INSERT INTO zsys_province_oilprice VALUES ('128', '410000', '92#', '1', '6.76', '2019-09-29 10:25:30', '2019-09-29 13:54:44', null);
INSERT INTO zsys_province_oilprice VALUES ('129', '420000', '2#', '0', '6.60', '2019-09-29 10:25:30', '2019-09-29 13:54:45', null);
INSERT INTO zsys_province_oilprice VALUES ('130', '420000', '89#', '1', '5.40', '2019-09-29 10:25:30', '2019-09-29 13:54:45', null);
INSERT INTO zsys_province_oilprice VALUES ('131', '420000', '1#', '0', '6.60', '2019-09-29 10:25:30', '2019-09-29 13:54:46', null);
INSERT INTO zsys_province_oilprice VALUES ('132', '420000', '0#', '0', '6.38', '2019-09-29 10:25:30', '2019-09-29 13:54:46', null);
INSERT INTO zsys_province_oilprice VALUES ('133', '420000', '98#', '1', '7.82', '2019-09-29 10:25:30', '2019-09-29 13:54:46', null);
INSERT INTO zsys_province_oilprice VALUES ('134', '420000', 'E92#', '1', '6.45', '2019-09-29 10:25:30', '2019-09-29 13:54:46', null);
INSERT INTO zsys_province_oilprice VALUES ('135', '420000', '95#', '1', '7.24', '2019-09-29 10:25:30', '2019-09-29 13:54:46', null);
INSERT INTO zsys_province_oilprice VALUES ('136', '420000', '92#', '1', '6.76', '2019-09-29 10:25:30', '2019-09-29 13:54:46', null);
INSERT INTO zsys_province_oilprice VALUES ('137', '430000', '2#', '0', '6.67', '2019-09-29 10:25:30', '2019-09-29 13:54:46', null);
INSERT INTO zsys_province_oilprice VALUES ('138', '430000', '89#', '1', '6.64', '2019-09-29 10:25:30', '2019-09-29 13:54:46', null);
INSERT INTO zsys_province_oilprice VALUES ('139', '430000', '1#', '0', '6.67', '2019-09-29 10:25:30', '2019-09-29 13:54:46', null);
INSERT INTO zsys_province_oilprice VALUES ('140', '430000', '0#', '0', '6.45', '2019-09-29 10:25:30', '2019-09-29 13:54:46', null);
INSERT INTO zsys_province_oilprice VALUES ('141', '430000', '98#', '1', '7.93', '2019-09-29 10:25:30', '2019-09-29 13:54:46', null);
INSERT INTO zsys_province_oilprice VALUES ('142', '430000', 'E92#', '1', '6.41', '2019-09-29 10:25:31', '2019-09-29 13:54:46', null);
INSERT INTO zsys_province_oilprice VALUES ('143', '430000', '95#', '1', '7.13', '2019-09-29 10:25:31', '2019-09-29 13:54:46', null);
INSERT INTO zsys_province_oilprice VALUES ('144', '430000', '92#', '1', '6.71', '2019-09-29 10:25:31', '2019-09-29 13:54:47', null);
INSERT INTO zsys_province_oilprice VALUES ('145', '440000', '2#', '0', '6.61', '2019-09-29 10:25:31', '2019-09-29 13:54:47', null);
INSERT INTO zsys_province_oilprice VALUES ('146', '440000', '89#', '1', '7.43', '2019-09-29 10:25:31', '2019-09-29 13:54:47', null);
INSERT INTO zsys_province_oilprice VALUES ('147', '440000', '1#', '0', '6.61', '2019-09-29 10:25:31', '2019-09-29 13:54:47', null);
INSERT INTO zsys_province_oilprice VALUES ('148', '440000', '0#', '0', '6.40', '2019-09-29 10:25:31', '2019-09-29 13:54:48', null);
INSERT INTO zsys_province_oilprice VALUES ('149', '440000', '98#', '1', '8.23', '2019-09-29 10:25:31', '2019-09-29 13:54:48', null);
INSERT INTO zsys_province_oilprice VALUES ('150', '440000', 'E92#', '1', '6.47', '2019-09-29 10:25:31', '2019-09-29 13:54:48', null);
INSERT INTO zsys_province_oilprice VALUES ('151', '440000', '95#', '1', '7.34', '2019-09-29 10:25:31', '2019-09-29 13:54:48', null);
INSERT INTO zsys_province_oilprice VALUES ('152', '440000', '92#', '1', '6.77', '2019-09-29 10:25:31', '2019-09-29 13:54:49', null);
INSERT INTO zsys_province_oilprice VALUES ('153', '450000', '2#', '0', '6.67', '2019-09-29 10:25:31', '2019-09-29 13:54:49', null);
INSERT INTO zsys_province_oilprice VALUES ('154', '450000', '89#', '1', '7.49', '2019-09-29 10:25:31', '2019-09-29 13:54:49', null);
INSERT INTO zsys_province_oilprice VALUES ('155', '450000', '1#', '0', '6.67', '2019-09-29 10:25:31', '2019-09-29 13:54:49', null);
INSERT INTO zsys_province_oilprice VALUES ('156', '450000', '0#', '0', '6.45', '2019-09-29 10:25:31', '2019-09-29 13:54:49', null);
INSERT INTO zsys_province_oilprice VALUES ('157', '450000', '98#', '1', '8.15', '2019-09-29 10:25:31', '2019-09-29 13:54:49', null);
INSERT INTO zsys_province_oilprice VALUES ('158', '450000', 'E92#', '1', '6.51', '2019-09-29 10:25:32', '2019-09-29 13:54:49', null);
INSERT INTO zsys_province_oilprice VALUES ('159', '450000', '95#', '1', '7.36', '2019-09-29 10:25:32', '2019-09-29 13:54:49', null);
INSERT INTO zsys_province_oilprice VALUES ('160', '450000', '92#', '1', '6.82', '2019-09-29 10:25:32', '2019-09-29 13:54:49', null);
INSERT INTO zsys_province_oilprice VALUES ('161', '460000', '2#', '0', '6.69', '2019-09-29 10:25:32', '2019-09-29 13:54:50', null);
INSERT INTO zsys_province_oilprice VALUES ('162', '460000', '89#', '1', '7.61', '2019-09-29 10:25:32', '2019-09-29 13:54:50', null);
INSERT INTO zsys_province_oilprice VALUES ('163', '460000', '1#', '0', '6.69', '2019-09-29 10:25:32', '2019-09-29 13:54:50', null);
INSERT INTO zsys_province_oilprice VALUES ('164', '460000', '0#', '0', '6.47', '2019-09-29 10:25:32', '2019-09-29 13:54:50', null);
INSERT INTO zsys_province_oilprice VALUES ('165', '460000', '98#', '1', '9.44', '2019-09-29 10:25:32', '2019-09-29 13:54:50', null);
INSERT INTO zsys_province_oilprice VALUES ('166', '460000', 'E92#', '1', '7.56', '2019-09-29 10:25:32', '2019-09-29 13:54:50', null);
INSERT INTO zsys_province_oilprice VALUES ('167', '460000', '95#', '1', '8.35', '2019-09-29 10:25:32', '2019-09-29 13:54:50', null);
INSERT INTO zsys_province_oilprice VALUES ('168', '460000', '92#', '1', '7.87', '2019-09-29 10:25:32', '2019-09-29 13:54:50', null);
INSERT INTO zsys_province_oilprice VALUES ('169', '500000', '2#', '0', '6.68', '2019-09-29 10:25:32', '2019-09-29 13:54:50', null);
INSERT INTO zsys_province_oilprice VALUES ('170', '500000', '89#', '1', '7.61', '2019-09-29 10:25:32', '2019-09-29 13:54:51', null);
INSERT INTO zsys_province_oilprice VALUES ('171', '500000', '1#', '0', '6.68', '2019-09-29 10:25:32', '2019-09-29 13:54:52', null);
INSERT INTO zsys_province_oilprice VALUES ('172', '500000', '0#', '0', '6.46', '2019-09-29 10:25:32', '2019-09-29 13:54:52', null);
INSERT INTO zsys_province_oilprice VALUES ('173', '500000', '98#', '1', '8.12', '2019-09-29 10:25:32', '2019-09-29 13:54:54', null);
INSERT INTO zsys_province_oilprice VALUES ('174', '500000', 'E92#', '1', '6.52', '2019-09-29 10:25:32', '2019-09-29 13:54:55', null);
INSERT INTO zsys_province_oilprice VALUES ('175', '500000', '95#', '1', '7.21', '2019-09-29 10:25:32', '2019-09-29 13:54:56', null);
INSERT INTO zsys_province_oilprice VALUES ('176', '500000', '92#', '1', '6.83', '2019-09-29 10:25:33', '2019-09-29 13:54:57', null);
INSERT INTO zsys_province_oilprice VALUES ('177', '510000', '2#', '0', '6.70', '2019-09-29 10:25:33', '2019-09-29 13:54:58', null);
INSERT INTO zsys_province_oilprice VALUES ('178', '510000', '89#', '1', '6.12', '2019-09-29 10:25:33', '2019-09-29 13:54:58', null);
INSERT INTO zsys_province_oilprice VALUES ('179', '510000', '1#', '0', '6.70', '2019-09-29 10:25:33', '2019-09-29 13:54:59', null);
INSERT INTO zsys_province_oilprice VALUES ('180', '510000', '0#', '0', '6.48', '2019-09-29 10:25:33', '2019-09-29 13:54:59', null);
INSERT INTO zsys_province_oilprice VALUES ('181', '510000', '98#', '1', '7.96', '2019-09-29 10:25:33', '2019-09-29 13:54:59', null);
INSERT INTO zsys_province_oilprice VALUES ('182', '510000', 'E92#', '1', '6.84', '2019-09-29 10:25:33', '2019-09-29 13:54:59', null);
INSERT INTO zsys_province_oilprice VALUES ('183', '510000', '95#', '1', '7.31', '2019-09-29 10:25:33', '2019-09-29 13:55:00', null);
INSERT INTO zsys_province_oilprice VALUES ('184', '510000', '92#', '1', '6.79', '2019-09-29 10:25:33', '2019-09-29 13:55:00', null);
INSERT INTO zsys_province_oilprice VALUES ('185', '520000', '2#', '0', '6.71', '2019-09-29 10:25:33', '2019-09-29 13:55:00', null);
INSERT INTO zsys_province_oilprice VALUES ('186', '520000', '89#', '1', '6.94', '2019-09-29 10:25:33', '2019-09-29 13:55:00', null);
INSERT INTO zsys_province_oilprice VALUES ('187', '520000', '1#', '0', '6.71', '2019-09-29 10:25:33', '2019-09-29 13:55:00', null);
INSERT INTO zsys_province_oilprice VALUES ('188', '520000', '0#', '0', '6.49', '2019-09-29 10:25:33', '2019-09-29 13:55:00', null);
INSERT INTO zsys_province_oilprice VALUES ('189', '520000', '98#', '1', '8.17', '2019-09-29 10:25:34', '2019-09-29 13:55:00', null);
INSERT INTO zsys_province_oilprice VALUES ('190', '520000', 'E92#', '1', '6.57', '2019-09-29 10:25:34', '2019-09-29 13:55:00', null);
INSERT INTO zsys_province_oilprice VALUES ('191', '520000', '95#', '1', '7.27', '2019-09-29 10:25:34', '2019-09-29 13:55:00', null);
INSERT INTO zsys_province_oilprice VALUES ('192', '520000', '92#', '1', '6.88', '2019-09-29 10:25:34', '2019-09-29 13:55:00', null);
INSERT INTO zsys_province_oilprice VALUES ('193', '530000', '2#', '0', '6.68', '2019-09-29 10:25:34', '2019-09-29 13:55:01', null);
INSERT INTO zsys_province_oilprice VALUES ('194', '530000', '89#', '1', '7.49', '2019-09-29 10:25:34', '2019-09-29 13:55:01', null);
INSERT INTO zsys_province_oilprice VALUES ('195', '530000', '1#', '0', '6.68', '2019-09-29 10:25:34', '2019-09-29 13:55:01', null);
INSERT INTO zsys_province_oilprice VALUES ('196', '530000', '0#', '0', '6.47', '2019-09-29 10:25:34', '2019-09-29 13:55:01', null);
INSERT INTO zsys_province_oilprice VALUES ('197', '530000', '98#', '1', '8.08', '2019-09-29 10:25:34', '2019-09-29 13:55:01', null);
INSERT INTO zsys_province_oilprice VALUES ('198', '530000', 'E92#', '1', '6.59', '2019-09-29 10:25:34', '2019-09-29 13:55:01', null);
INSERT INTO zsys_province_oilprice VALUES ('199', '530000', '95#', '1', '7.40', '2019-09-29 10:25:34', '2019-09-29 13:55:01', null);
INSERT INTO zsys_province_oilprice VALUES ('200', '530000', '92#', '1', '6.90', '2019-09-29 10:25:34', '2019-09-29 13:55:01', null);
INSERT INTO zsys_province_oilprice VALUES ('201', '540000', '2#', '0', '7.16', '2019-09-29 10:25:34', '2019-09-29 13:55:01', null);
INSERT INTO zsys_province_oilprice VALUES ('202', '540000', '89#', '1', '7.23', '2019-09-29 10:25:34', '2019-09-29 13:55:01', null);
INSERT INTO zsys_province_oilprice VALUES ('203', '540000', '1#', '0', '7.16', '2019-09-29 10:25:34', '2019-09-29 13:55:01', null);
INSERT INTO zsys_province_oilprice VALUES ('204', '540000', '0#', '0', '6.94', '2019-09-29 10:25:34', '2019-09-29 13:55:01', null);
INSERT INTO zsys_province_oilprice VALUES ('205', '540000', '98#', '1', '0.00', '2019-09-29 10:25:34', '2019-09-29 13:55:01', null);
INSERT INTO zsys_province_oilprice VALUES ('206', '540000', 'E92#', '1', '7.34', '2019-09-29 10:25:35', '2019-09-29 13:55:02', null);
INSERT INTO zsys_province_oilprice VALUES ('207', '540000', '95#', '1', '8.08', '2019-09-29 10:25:35', '2019-09-29 13:55:02', null);
INSERT INTO zsys_province_oilprice VALUES ('208', '540000', '92#', '1', '7.64', '2019-09-29 10:25:35', '2019-09-29 13:55:02', null);
INSERT INTO zsys_province_oilprice VALUES ('209', '610000', '2#', '0', '6.51', '2019-09-29 10:25:35', '2019-09-29 13:55:02', null);
INSERT INTO zsys_province_oilprice VALUES ('210', '610000', '89#', '1', '5.67', '2019-09-29 10:25:35', '2019-09-29 13:55:02', null);
INSERT INTO zsys_province_oilprice VALUES ('211', '610000', '1#', '0', '6.51', '2019-09-29 10:25:35', '2019-09-29 13:55:02', null);
INSERT INTO zsys_province_oilprice VALUES ('212', '610000', '0#', '0', '6.29', '2019-09-29 10:25:35', '2019-09-29 13:55:02', null);
INSERT INTO zsys_province_oilprice VALUES ('213', '610000', '98#', '1', '7.84', '2019-09-29 10:25:35', '2019-09-29 13:55:02', null);
INSERT INTO zsys_province_oilprice VALUES ('214', '610000', 'E92#', '1', '6.34', '2019-09-29 10:25:35', '2019-09-29 13:55:03', null);
INSERT INTO zsys_province_oilprice VALUES ('215', '610000', '95#', '1', '7.02', '2019-09-29 10:25:35', '2019-09-29 13:55:03', null);
INSERT INTO zsys_province_oilprice VALUES ('216', '610000', '92#', '1', '6.65', '2019-09-29 10:25:35', '2019-09-29 13:55:03', null);
INSERT INTO zsys_province_oilprice VALUES ('217', '620000', '2#', '0', '6.51', '2019-09-29 10:25:35', '2019-09-29 13:55:03', null);
INSERT INTO zsys_province_oilprice VALUES ('218', '620000', '89#', '1', '5.51', '2019-09-29 10:25:35', '2019-09-29 13:55:03', null);
INSERT INTO zsys_province_oilprice VALUES ('219', '620000', '1#', '0', '6.51', '2019-09-29 10:25:35', '2019-09-29 13:55:03', null);
INSERT INTO zsys_province_oilprice VALUES ('220', '620000', '0#', '0', '6.29', '2019-09-29 10:25:35', '2019-09-29 13:55:03', null);
INSERT INTO zsys_province_oilprice VALUES ('221', '620000', '98#', '1', '7.55', '2019-09-29 10:25:35', '2019-09-29 13:55:03', null);
INSERT INTO zsys_province_oilprice VALUES ('222', '620000', 'E92#', '1', '6.34', '2019-09-29 10:25:35', '2019-09-29 13:55:03', null);
INSERT INTO zsys_province_oilprice VALUES ('223', '620000', '95#', '1', '7.10', '2019-09-29 10:25:35', '2019-09-29 13:55:03', null);
INSERT INTO zsys_province_oilprice VALUES ('224', '620000', '92#', '1', '6.65', '2019-09-29 10:25:36', '2019-09-29 13:55:03', null);
INSERT INTO zsys_province_oilprice VALUES ('225', '630000', '2#', '0', '6.54', '2019-09-29 10:25:36', '2019-09-29 13:55:03', null);
INSERT INTO zsys_province_oilprice VALUES ('226', '630000', '89#', '1', '5.85', '2019-09-29 10:25:36', '2019-09-29 13:55:04', null);
INSERT INTO zsys_province_oilprice VALUES ('227', '630000', '1#', '0', '6.54', '2019-09-29 10:25:36', '2019-09-29 13:55:04', null);
INSERT INTO zsys_province_oilprice VALUES ('228', '630000', '0#', '0', '6.32', '2019-09-29 10:25:36', '2019-09-29 13:55:04', null);
INSERT INTO zsys_province_oilprice VALUES ('229', '630000', '98#', '1', '0.00', '2019-09-29 10:25:36', '2019-09-29 13:55:04', null);
INSERT INTO zsys_province_oilprice VALUES ('230', '630000', 'E92#', '1', '6.40', '2019-09-29 10:25:36', '2019-09-29 13:55:04', null);
INSERT INTO zsys_province_oilprice VALUES ('231', '630000', '95#', '1', '7.19', '2019-09-29 10:25:36', '2019-09-29 13:55:04', null);
INSERT INTO zsys_province_oilprice VALUES ('232', '630000', '92#', '1', '6.71', '2019-09-29 10:25:36', '2019-09-29 13:55:04', null);
INSERT INTO zsys_province_oilprice VALUES ('233', '640000', '2#', '0', '6.50', '2019-09-29 10:25:36', '2019-09-29 13:55:04', null);
INSERT INTO zsys_province_oilprice VALUES ('234', '640000', '89#', '1', '5.56', '2019-09-29 10:25:36', '2019-09-29 13:55:04', null);
INSERT INTO zsys_province_oilprice VALUES ('235', '640000', '1#', '0', '6.50', '2019-09-29 10:25:36', '2019-09-29 13:55:04', null);
INSERT INTO zsys_province_oilprice VALUES ('236', '640000', '0#', '0', '6.28', '2019-09-29 10:25:36', '2019-09-29 13:55:04', null);
INSERT INTO zsys_province_oilprice VALUES ('237', '640000', '98#', '1', '8.09', '2019-09-29 10:25:36', '2019-09-29 13:55:04', null);
INSERT INTO zsys_province_oilprice VALUES ('238', '640000', 'E92#', '1', '6.36', '2019-09-29 10:25:36', '2019-09-29 13:55:04', null);
INSERT INTO zsys_province_oilprice VALUES ('239', '640000', '95#', '1', '7.04', '2019-09-29 10:25:36', '2019-09-29 13:55:04', null);
INSERT INTO zsys_province_oilprice VALUES ('240', '640000', '92#', '1', '6.66', '2019-09-29 10:25:36', '2019-09-29 13:55:04', null);
INSERT INTO zsys_province_oilprice VALUES ('241', '650000', '2#', '0', '6.49', '2019-09-29 10:25:37', '2019-09-29 13:55:05', null);
INSERT INTO zsys_province_oilprice VALUES ('242', '650000', '89#', '1', '6.06', '2019-09-29 10:25:37', '2019-09-29 13:55:05', null);
INSERT INTO zsys_province_oilprice VALUES ('243', '650000', '1#', '0', '6.49', '2019-09-29 10:25:37', '2019-09-29 13:55:05', null);
INSERT INTO zsys_province_oilprice VALUES ('244', '650000', '0#', '0', '6.27', '2019-09-29 10:25:37', '2019-09-29 13:55:05', null);
INSERT INTO zsys_province_oilprice VALUES ('245', '650000', '98#', '1', '7.98', '2019-09-29 10:25:37', '2019-09-29 13:55:05', null);
INSERT INTO zsys_province_oilprice VALUES ('246', '650000', 'E92#', '1', '0.00', '2019-09-29 10:25:37', '2019-09-29 13:55:05', null);
INSERT INTO zsys_province_oilprice VALUES ('247', '650000', '95#', '1', '7.15', '2019-09-29 10:25:37', '2019-09-29 13:55:05', null);
INSERT INTO zsys_province_oilprice VALUES ('248', '650000', '92#', '1', '6.65', '2019-09-29 10:25:37', '2019-09-29 13:55:05', null);

-- ----------------------------
-- Table structure for `zsys_role`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_role`;
CREATE TABLE `zsys_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of zsys_role
-- ----------------------------
INSERT INTO zsys_role VALUES ('1', '0', '1', '1329633709', '1329633709', '0', '超级管理员', '拥有网站最高管理员权限！');
INSERT INTO zsys_role VALUES ('2', '0', '1', '1329633709', '1329633709', '0', '普通管理员', '权限由最高管理员分配！');

-- ----------------------------
-- Table structure for `zsys_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_role_user`;
CREATE TABLE `zsys_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of zsys_role_user
-- ----------------------------
INSERT INTO zsys_role_user VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for `zsys_route`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_route`;
CREATE TABLE `zsys_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='url路由表';

-- ----------------------------
-- Records of zsys_route
-- ----------------------------

-- ----------------------------
-- Table structure for `zsys_sys_log_login`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_sys_log_login`;
CREATE TABLE `zsys_sys_log_login` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `user_login` varchar(64) DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `ip_address` varchar(32) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`tenant_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of zsys_sys_log_login
-- ----------------------------

-- ----------------------------
-- Table structure for `zsys_sys_log_login_customer`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_sys_log_login_customer`;
CREATE TABLE `zsys_sys_log_login_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wchat_openid` varchar(64) NOT NULL,
  `wchat_unionid` varchar(64) DEFAULT NULL,
  `user_id` int(20) DEFAULT NULL,
  `ip_address` varchar(32) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of zsys_sys_log_login_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `zsys_tenant`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_tenant`;
CREATE TABLE `zsys_tenant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_name` varchar(64) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `remark` varchar(1024) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `rule_rate` decimal(10,2) DEFAULT '100.00',
  `package_id` int(11) DEFAULT NULL,
  `tenant_phone` varchar(64) DEFAULT NULL,
  `tenant_company` varchar(512) DEFAULT NULL,
  `reg_type` tinyint(4) DEFAULT NULL,
  `rule_end_time` datetime DEFAULT NULL,
  `leader_id` varchar(64) DEFAULT NULL,
  `leader_status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of zsys_tenant
-- ----------------------------
INSERT INTO zsys_tenant VALUES ('1', '平台', '1', null, '1566793976', null, '100.00', null, null, null, null, '2039-09-08 00:00:00', null, '0');
INSERT INTO zsys_tenant VALUES ('2', '测试租户', '1', null, '1566794694', null, '100.00', null, null, null, null, '2019-09-28 00:00:00', null, '0');

-- ----------------------------
-- Table structure for `zsys_tenant_setting`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_tenant_setting`;
CREATE TABLE `zsys_tenant_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`tenant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of zsys_tenant_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `zsys_user`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_user`;
CREATE TABLE `zsys_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `more` text COMMENT '扩展属性',
  `tenant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_login` (`user_login`),
  KEY `tenant_id` (`tenant_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of zsys_user
-- ----------------------------
INSERT INTO zsys_user VALUES ('1', '1', '0', '0', '1566531156', '0', '0', '0.00', '1566293274', '1', 'admin', '###c0682f9e2d4c017f4768b5af7e4066fa', 'admin', 'admin@163.com', '', '', '', '127.0.0.1', '', '', null, '1');

-- ----------------------------
-- Table structure for `zsys_user_token`
-- ----------------------------
DROP TABLE IF EXISTS `zsys_user_token`;
CREATE TABLE `zsys_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表';

-- ----------------------------
-- Records of zsys_user_token
-- ----------------------------
INSERT INTO zsys_user_token VALUES ('1', '1', '1581845533', '1566293533', 'c5d8cb427c8fab5f1b5d9be9efc4a706baf167bb8184aea689bdd51a1d271dff', 'web');
