/*
Navicat MySQL Data Transfer

Source Server         : my
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : dy_new

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-11-09 17:02:07
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `dy_admin_list`
-- ----------------------------
DROP TABLE IF EXISTS `dy_admin_list`;
CREATE TABLE `dy_admin_list` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `admin_account` varchar(60) NOT NULL COMMENT '管理员账户',
  `admin_password` varchar(32) NOT NULL COMMENT '管理员密码',
  `created_at` varchar(20) NOT NULL COMMENT '创建时间',
  `updated_at` varchar(20) NOT NULL COMMENT '更新时间',
  `deleted_at` varchar(20) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dy_admin_list
-- ----------------------------
INSERT INTO dy_admin_list VALUES ('1', 'admin', 'b3a3533bdbca494ecf7c1fe5d3ff207e', '', '', '');

-- ----------------------------
-- Table structure for `dy_admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `dy_admin_menu`;
CREATE TABLE `dy_admin_menu` (
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单表';

-- ----------------------------
-- Records of dy_admin_menu
-- ----------------------------
INSERT INTO dy_admin_menu VALUES ('1', '0', '1', '1', '1', 'index', 'menu', 'default', '', '后台菜单管理', '', '');
INSERT INTO dy_admin_menu VALUES ('2', '1', '1', '1', '1', 'index', 'menu', 'index', '', '菜单列表', '', '');
INSERT INTO dy_admin_menu VALUES ('3', '0', '1', '1', '2', 'index', 'user', 'default', '', '用户管理', '', '');
INSERT INTO dy_admin_menu VALUES ('4', '3', '1', '1', '1', 'index', 'user', 'index', '', '用户列表', '', '');

-- ----------------------------
-- Table structure for `dy_comment_list`
-- ----------------------------
DROP TABLE IF EXISTS `dy_comment_list`;
CREATE TABLE `dy_comment_list` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `industry_id` int(10) unsigned NOT NULL COMMENT '行业ID',
  `comment_content` text NOT NULL COMMENT '评论内容',
  `is_can` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不可用1可用',
  `created_at` varchar(20) NOT NULL COMMENT '创建时间',
  `updated_at` varchar(20) NOT NULL COMMENT '更新时间',
  `deleted_at` varchar(20) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dy_comment_list
-- ----------------------------
INSERT INTO dy_comment_list VALUES ('17', '1', '反倒是官方的', '0', '1571449679', '', '');
INSERT INTO dy_comment_list VALUES ('16', '1', '男孩女孩个', '0', '1571449669', '1571449688', '');
INSERT INTO dy_comment_list VALUES ('14', '1', '显得十分', '0', '1571449398', '', '');
INSERT INTO dy_comment_list VALUES ('18', '1', '高火凤凰', '0', '1571902994', '', '');

-- ----------------------------
-- Table structure for `dy_device_list`
-- ----------------------------
DROP TABLE IF EXISTS `dy_device_list`;
CREATE TABLE `dy_device_list` (
  `device_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设备ID',
  `device_no` varchar(20) NOT NULL COMMENT '设备号',
  `industry_id` int(10) unsigned NOT NULL COMMENT '行业ID',
  `logo_tag` varchar(20) NOT NULL DEFAULT '抖音短视频' COMMENT 'LOGO标签前缀',
  `logo_no` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'LOGO序号',
  `is_on` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不允许关闭脚本 1允许远程启动脚本',
  `created_at` varchar(20) NOT NULL COMMENT '创建时间',
  `updated_at` varchar(20) NOT NULL COMMENT '更新时间',
  `deleted_at` varchar(20) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`device_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dy_device_list
-- ----------------------------
INSERT INTO dy_device_list VALUES ('3', '878ecc47', '3', '抖音短视频', '73', '1', '1570762765', '1571904444', '');

-- ----------------------------
-- Table structure for `dy_history_list_tuziya55555`
-- ----------------------------
DROP TABLE IF EXISTS `dy_history_list_tuziya55555`;
CREATE TABLE `dy_history_list_tuziya55555` (
  `history_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '历史记录ID',
  `to_nick_name` varchar(20) NOT NULL COMMENT '昵称',
  `to_no` varchar(20) NOT NULL DEFAULT '' COMMENT '抖音号',
  `created_at` varchar(20) NOT NULL COMMENT '创建时间',
  `updated_at` varchar(20) NOT NULL COMMENT '更新时间',
  `deleted_at` varchar(20) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`history_id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dy_history_list_tuziya55555
-- ----------------------------
INSERT INTO dy_history_list_tuziya55555 VALUES ('2', '手机用户61446528557', '176703870', '1571884631', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('3', '韦小宝', 'qq773697358', '1571884881', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('4', 'Andrew Quah (荐佺）', 'andrew3318', '1571885504', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('5', '用户188848418166', 'dyhckrw990wf', '1571885517', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('6', '韵晴', 'dy9bjrpkm5s5', '1571885530', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('7', '羌管悠悠霜满地', 'dy72zadti8qr', '1571885869', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('8', '蒋晗杰', '54761447', '1571885881', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('9', '小军', '186308560', '1571885894', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('10', '☞不贱不散☜', '1211140384', '1571888212', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('11', '处女座小仙女', '1212744093', '1571888245', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('12', '明曦麟', '375674370', '1571897532', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('13', '流年似水', '2103064439', '1571898590', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('14', '暖暖', '110412116', '1571899923', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('15', 'vivien', '5670794', '1571899936', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('16', '@小丸子。。。', 'wjy1146812193', '1571901924', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('17', '备注', 'YYmunicipal', '1571901937', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('18', '、', '1773809395', '1571901950', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('19', '秋笙挽歌', '121371520', '1571901963', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('20', '♚   Need丶', '98077504', '1571901976', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('21', '嗉嘿', '378921744', '1571901989', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('22', '宠物小宝贝', 'cwbb678963', '1571902008', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('23', '狱.', '3441979547.', '1571902022', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('24', 'user9721455687312', '779081004', '1571902035', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('25', '總', '186335321', '1571902047', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('26', 'YUANYU', 'dyjnhddq2y9j', '1571902059', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('27', '言身寸', '189159297', '1571902072', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('28', '傲娇', '1854578182', '1571902085', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('29', '盈盈', 'dyie8009ychn', '1571902098', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('30', '黑色的怪兽', 'dy0b6jjlg87o', '1571902119', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('31', '用户8317347508109', 'dyfjsejhaosd', '1571902132', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('32', '用户723122', '1344355879', '1571902143', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('33', '杨小森Music', 'YeungMusic', '1571902156', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('34', 'Yyyiii', 'yyi1234', '1571902169', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('35', '嘟嘟', '204738216', '1571902181', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('36', '小王子', '542426546li', '1571902194', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('37', '你哥？？？？', '1752742959', '1571902212', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('38', '波心荡漾', '944532196', '1571902224', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('39', '用户1252179321837', 'dyvo1mw9kqz6', '1571902237', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('40', '用户450318051', 'dywewo7gh7el', '1571902250', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('41', '广州北泽自控阀门，厦门店', '116213360', '1571902263', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('42', 'castial', '827908490', '1571902275', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('43', '小白', '1206409347', '1571902287', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('44', '月儿弯弯腰', '2116916199', '1571902300', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('45', '欢喜美美-2', '81036472', '1571902320', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('46', '。。。', '212966689', '1571902333', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('47', '13579', 'dymoi02mnhmh', '1571902345', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('48', '爱新觉罗师屯', '2046929659', '1571902358', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('49', '嘘小猪睡着了', 'woailinbao', '1571902371', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('50', '我要加油', '1166516163', '1571902384', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('51', '大冰', '1842377981', '1571902397', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('52', '', '860546116', '1571902418', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('53', '不给我点赞的都是单身狗', '1480782395', '1571902430', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('54', 'sun', '666666iod', '1571902443', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('55', '吆幺姚', '205184494', '1571902455', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('56', '岚宝', 'lanbao5201311', '1571902467', '', '');
INSERT INTO dy_history_list_tuziya55555 VALUES ('57', '陈宇', '1087150043', '1571902480', '', '');

-- ----------------------------
-- Table structure for `dy_industry_list`
-- ----------------------------
DROP TABLE IF EXISTS `dy_industry_list`;
CREATE TABLE `dy_industry_list` (
  `industry_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '行业ID',
  `industry_name` varchar(20) NOT NULL COMMENT '行业名称',
  `created_at` varchar(20) NOT NULL COMMENT '创建时间',
  `updated_at` varchar(20) NOT NULL COMMENT '更新时间',
  `deleted_at` varchar(20) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`industry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dy_industry_list
-- ----------------------------
INSERT INTO dy_industry_list VALUES ('1', '韩妆', '1571119678', '1571463179', '');
INSERT INTO dy_industry_list VALUES ('3', '减肥', '1571463579', '', '');
INSERT INTO dy_industry_list VALUES ('4', '健康', '1571902934', '', '');

-- ----------------------------
-- Table structure for `dy_no_list`
-- ----------------------------
DROP TABLE IF EXISTS `dy_no_list`;
CREATE TABLE `dy_no_list` (
  `no_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '抖音号ID',
  `no` varchar(20) NOT NULL COMMENT '抖音号',
  `device_id` int(10) unsigned NOT NULL COMMENT '设备ID',
  `v_no` varchar(20) NOT NULL COMMENT '大V号',
  `num` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '给大V粉丝私信发送数量',
  `a` varchar(20) NOT NULL DEFAULT '0' COMMENT '获赞数',
  `b` varchar(20) NOT NULL DEFAULT '0' COMMENT '关注数',
  `c` varchar(20) NOT NULL DEFAULT '0' COMMENT '粉丝数',
  `created_at` varchar(20) NOT NULL COMMENT '创建时间',
  `updated_at` varchar(20) NOT NULL COMMENT '更新时间',
  `deleted_at` varchar(20) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`no_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dy_no_list
-- ----------------------------
INSERT INTO dy_no_list VALUES ('2', 'sd0535004', '3', 'tuziya55555', '0', '24', '158', '22', '1571726127', '1571901747', '');

-- ----------------------------
-- Table structure for `dy_pos_list`
-- ----------------------------
DROP TABLE IF EXISTS `dy_pos_list`;
CREATE TABLE `dy_pos_list` (
  `pos_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '位置ID',
  `device_id` int(10) unsigned NOT NULL COMMENT '设备ID',
  `lng` decimal(10,6) unsigned NOT NULL COMMENT '经度',
  `lat` decimal(10,6) unsigned NOT NULL COMMENT '纬度',
  `created_at` varchar(20) NOT NULL COMMENT '创建时间',
  `updated_at` varchar(20) NOT NULL COMMENT '更新时间',
  `deleted_at` varchar(20) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`pos_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dy_pos_list
-- ----------------------------
INSERT INTO dy_pos_list VALUES ('1', '3', '120.304937', '31.555036', '', '', '');
INSERT INTO dy_pos_list VALUES ('2', '3', '120.267000', '31.561838', '', '', '');
INSERT INTO dy_pos_list VALUES ('3', '0', '121.430359', '37.500601', '1571901439', '', '');
INSERT INTO dy_pos_list VALUES ('4', '0', '121.437007', '37.506438', '1571902248', '', '');
INSERT INTO dy_pos_list VALUES ('5', '0', '121.434815', '37.499313', '1571902286', '', '');
INSERT INTO dy_pos_list VALUES ('6', '0', '121.431294', '37.496908', '1571902353', '', '');
INSERT INTO dy_pos_list VALUES ('7', '0', '121.428078', '37.499384', '1571902398', '', '');
INSERT INTO dy_pos_list VALUES ('8', '0', '121.433270', '37.500816', '1571902418', '', '');
INSERT INTO dy_pos_list VALUES ('9', '0', '121.435534', '37.495391', '1571902442', '', '');
INSERT INTO dy_pos_list VALUES ('10', '0', '121.436414', '37.500401', '1571902454', '', '');
INSERT INTO dy_pos_list VALUES ('11', '0', '121.432803', '37.502720', '1571902515', '', '');
INSERT INTO dy_pos_list VALUES ('12', '0', '121.433593', '37.502949', '1571902562', '', '');
INSERT INTO dy_pos_list VALUES ('13', '0', '121.433342', '37.503922', '1571902676', '', '');
INSERT INTO dy_pos_list VALUES ('14', '0', '121.435336', '37.502849', '1571902779', '', '');
INSERT INTO dy_pos_list VALUES ('15', '0', '121.448793', '37.488175', '1571903320', '', '');
INSERT INTO dy_pos_list VALUES ('16', '0', '121.448972', '37.488376', '1571903366', '', '');

-- ----------------------------
-- Table structure for `dy_priv_list`
-- ----------------------------
DROP TABLE IF EXISTS `dy_priv_list`;
CREATE TABLE `dy_priv_list` (
  `priv_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '私信ID',
  `industry_id` int(10) unsigned NOT NULL COMMENT '行业ID',
  `priv_content` text NOT NULL COMMENT '私信内容',
  `is_can` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不可用1可用',
  `created_at` varchar(20) NOT NULL COMMENT '创建时间',
  `updated_at` varchar(20) NOT NULL COMMENT '更新时间',
  `deleted_at` varchar(20) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`priv_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dy_priv_list
-- ----------------------------
INSERT INTO dy_priv_list VALUES ('2', '1', '犹太人犹太人', '0', '1571391383', '', '');
INSERT INTO dy_priv_list VALUES ('3', '1', '发热管放入', '0', '1571448632', '', '');
INSERT INTO dy_priv_list VALUES ('4', '1', '吃饭的说法', '0', '1571448762', '', '');
INSERT INTO dy_priv_list VALUES ('5', '1', '吧发大V法人', '0', '1571448950', '', '');
INSERT INTO dy_priv_list VALUES ('6', '1', '吧发大V', '0', '1571448968', '', '');
INSERT INTO dy_priv_list VALUES ('7', '1', '不打算吧vfd', '0', '1571448989', '', '');
INSERT INTO dy_priv_list VALUES ('8', '1', '不对不固定', '0', '1571449194', '', '');
