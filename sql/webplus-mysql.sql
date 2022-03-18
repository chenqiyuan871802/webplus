/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80019
Source Host           : 127.0.0.1:3306
Source Database       : webplus

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2022-03-18 22:58:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_apk_version
-- ----------------------------
DROP TABLE IF EXISTS `sys_apk_version`;
CREATE TABLE `sys_apk_version` (
  `version_id` varchar(50) NOT NULL COMMENT '版本编号',
  `apk_name` varchar(100) DEFAULT NULL COMMENT 'apk名称',
  `fid` varchar(50) DEFAULT NULL COMMENT '文件fid',
  `version_name` varchar(50) DEFAULT NULL COMMENT '版本名称',
  `version_num` varchar(50) DEFAULT NULL COMMENT '版本号',
  `version_desc` varchar(200) DEFAULT NULL COMMENT '升级说明',
  `release_status` varchar(10) DEFAULT '0' COMMENT '发布状态0强制1不强制',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改用户编号',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='APK版本管理';

-- ----------------------------
-- Records of sys_apk_version
-- ----------------------------
INSERT INTO `sys_apk_version` VALUES ('0dafce2cccc84e03a58a969656cd41db', 'greatqingyuan_v1.0.13_release.apk', 'efb74c6204d74b13a4e980eb40e6533d.apk', '12', '12', '123', '0', '2021-08-09 23:14:24', 'cb33c25f5c664058a111a9b876152317', '2021-08-09 23:14:24', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_apk_version` VALUES ('7ace592cfed04bdab6dc72df19a9910f', 'greatqingyuan_v1.0.13_release.apk', 'apk_f56fb20789ef4eb0a7d6f8df7cb6219f.apk', '33', '23', '', '0', '2021-08-10 23:34:32', 'cb33c25f5c664058a111a9b876152317', '2021-08-10 23:34:32', 'cb33c25f5c664058a111a9b876152317');

-- ----------------------------
-- Table structure for sys_app_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_config`;
CREATE TABLE `sys_app_config` (
  `config_id` varchar(50) NOT NULL COMMENT '配置编号',
  `app_name` varchar(100) NOT NULL COMMENT '应用名称',
  `access_key` varchar(50) NOT NULL COMMENT '访问账号',
  `secret_key` varchar(50) NOT NULL COMMENT '访问秘钥',
  `link_man` varchar(50) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `grant_user_id` varchar(50) DEFAULT NULL COMMENT '授权用户编号',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '当前状态(0:停用;1:启用)',
  `edit_mode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '编辑模式(0:只读;1:可编辑)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用配置';

-- ----------------------------
-- Records of sys_app_config
-- ----------------------------
INSERT INTO `sys_app_config` VALUES ('d174ae03ee714272993f259acb8805f3', '多度门禁', '03d8eea0f55a42a18eb9174a6717f820', 'mzu0xzd1', '陈骑元1', '13802907704', '', '', '1', '1', '2022-02-04 20:47:39', 'cb33c25f5c664058a111a9b876152317', '2022-03-03 23:05:19', 'cb33c25f5c664058a111a9b876152317');

-- ----------------------------
-- Table structure for sys_custom_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_custom_dict`;
CREATE TABLE `sys_custom_dict` (
  `dict_id` varchar(50) NOT NULL COMMENT '字典编号',
  `dict_key` varchar(50) NOT NULL COMMENT '字典健',
  `dict_name` varchar(50) NOT NULL COMMENT '字典名称',
  `dict_table` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典表',
  `dict_where` varchar(100) DEFAULT NULL COMMENT '字典条件',
  `dict_sort_field` varchar(50) DEFAULT NULL COMMENT '字典排序字典',
  `sort_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '排序类型 1升序2降序',
  `dict_code_field` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典代码字典',
  `dict_value_field` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典值字字段',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '当前状态(0:停用;1:启用)',
  `edit_mode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '编辑模式(0:只读;1:可编辑)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义字典';

-- ----------------------------
-- Records of sys_custom_dict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` varchar(50) NOT NULL COMMENT '流水号',
  `cascade_id` varchar(255) NOT NULL COMMENT '节点语义ID',
  `dept_name` varchar(100) NOT NULL COMMENT '组织名称',
  `parent_id` varchar(50) NOT NULL COMMENT '父节点流水号',
  `dept_code` varchar(50) DEFAULT NULL COMMENT '机构代码',
  `manager` varchar(50) DEFAULT NULL COMMENT '主要负责人',
  `phone` varchar(50) DEFAULT NULL COMMENT '部门电话',
  `fax` varchar(50) DEFAULT NULL COMMENT '传真',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `is_auto_expand` varchar(10) DEFAULT NULL COMMENT '是否自动展开',
  `icon_name` varchar(50) DEFAULT NULL COMMENT '节点图标文件名称',
  `sort_no` int DEFAULT NULL COMMENT '排序号',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注',
  `is_del` varchar(10) DEFAULT '0' COMMENT '是否已删除 0有效 1删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('0', '0', '广州市图南软件有限公司', '-1', '', '', '', '', '', '1', 'dept_config', '1', '', '0', '2018-09-23 09:40:39', 'cb33c25f5c664058a111a9b876152317', '2020-01-09 20:19:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dept` VALUES ('0310d7c44ea346638ebfeaa919b8616d', '0.0001', '广州研发中心', '0', '0120', '陈骑元', '13802907704', '', '', '1', null, '1', '', '1', '2018-09-23 10:01:08', 'cb33c25f5c664058a111a9b876152317', '2019-05-11 17:13:04', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dept` VALUES ('1d549a802a7b4b73bd60965d4403fc2b', '0.0001.0002.0001.0001', '234', '96086bf7ae1c4de4835673873b682242', '24', '', '', '', '', '1', null, '1', '', '1', '2019-05-11 17:06:34', 'cb33c25f5c664058a111a9b876152317', '2019-05-11 17:12:48', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dept` VALUES ('35a2047abd7d41a98974bd8d788bb08d', '0.0006', '财务部', '0', '', '', '', '', '', '1', null, '5', '', '1', '2020-01-09 20:20:56', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 00:31:11', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dept` VALUES ('472be965030f47d09b96516455f475cf', '0.0009', '行政人事部', '0', '', '', '', '', '', '1', null, '8', '', '1', '2020-01-09 20:22:10', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 00:31:02', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dept` VALUES ('65dba6d5063c447ba83cb267e1f4a9d7', '0.0001.0005', '2321', '0310d7c44ea346638ebfeaa919b8616d', '23', '', '', '', '', '1', null, '1', '', '1', '2019-01-28 16:16:38', 'cb33c25f5c664058a111a9b876152317', '2019-01-28 16:46:42', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dept` VALUES ('661f24d8599548daad1300639226e502', '0.0001.0003', '322', '0310d7c44ea346638ebfeaa919b8616d', '234', '', '', '', '', '1', null, '1', '', '1', '2019-01-28 15:29:06', 'cb33c25f5c664058a111a9b876152317', '2019-01-28 16:46:47', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dept` VALUES ('6ebe2d3d10fe4b6ba449272364af810b', '0.0007', '商务部', '0', '', '', '', '', '', '1', null, '6', '', '1', '2020-01-09 20:21:11', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 00:31:09', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dept` VALUES ('7aa78414386e4ab3b665d9455713c73e', '0.0003', '研发中心', '0', '', '', '', '', '', '1', null, '2', '', '1', '2020-01-09 20:20:00', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 00:31:21', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dept` VALUES ('8abec06781cb43e0b1f24879595b1ee6', '0.0001.0007.0001', '天河区', 'ed06c91df4d24aadbc7f5dff9eb399e8', '1werew', '', '', '', '12', '1', null, '1', '', '1', '2019-05-09 21:59:14', 'cb33c25f5c664058a111a9b876152317', '2019-05-11 17:12:53', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dept` VALUES ('96086bf7ae1c4de4835673873b682242', '0.0001.0002.0001', '北京研发中心', 'bc546ac8c05b4ed8b6073b2a169a64a4', '', '', '', '', '', '1', null, '2', '', '1', '2018-09-23 10:01:25', 'cb33c25f5c664058a111a9b876152317', '2019-05-11 17:12:50', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dept` VALUES ('a2032e817bd142ac93293b66d9d62462', '0.0001.0006', '234345433', '0310d7c44ea346638ebfeaa919b8616d', '4324', '', '', '', '', '1', null, '1', '', '1', '2019-01-28 16:18:22', 'cb33c25f5c664058a111a9b876152317', '2019-01-28 16:46:55', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dept` VALUES ('b3e7e87fb2074d7390587f45bf87acb5', '0.0001.0007.0001.0001', '天河区', '8abec06781cb43e0b1f24879595b1ee6', '', '', '', '', '', '1', null, '1', '', '1', '2018-09-23 10:01:43', 'cb33c25f5c664058a111a9b876152317', '2019-05-11 17:06:42', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dept` VALUES ('bc546ac8c05b4ed8b6073b2a169a64a4', '0.0001.0002', '天河办事处', '0310d7c44ea346638ebfeaa919b8616d', '2343242', '陈骑元', '13802907704', '', '天河区小新塘', '1', null, '1', 'wrwerwr', '1', '2019-01-28 15:00:36', 'cb33c25f5c664058a111a9b876152317', '2019-05-11 17:13:01', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dept` VALUES ('c422157564e44d8e89b9e975a1ff1308', '0.0001.0004', '2342', '0310d7c44ea346638ebfeaa919b8616d', '2342', '2', '', '', '', '1', null, '1', '', '1', '2019-01-28 15:30:51', 'cb33c25f5c664058a111a9b876152317', '2019-01-28 16:04:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dept` VALUES ('e277c9178d0541de8f6ad3abc4985787', '0.0008', '营销中心', '0', '', '', '', '', '', '1', null, '7', '', '1', '2020-01-09 20:21:49', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 00:31:05', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dept` VALUES ('e51c1cc1de184211bad6fa0ab17d9b12', '0.0004', '交付中心', '0', '', '', '', '', '', '1', null, '3', '', '1', '2020-01-09 20:20:24', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 00:31:18', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dept` VALUES ('ed06c91df4d24aadbc7f5dff9eb399e8', '0.0001.0007', '海淀区', '0310d7c44ea346638ebfeaa919b8616d', '', '', '', '', '12312', '1', null, '1', '', '1', '2018-09-23 10:01:53', 'cb33c25f5c664058a111a9b876152317', '2019-05-11 17:12:58', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dept` VALUES ('ef515f74ecde40959d8a55186a1a7ff0', '0.0005', '产品中心', '0', '', '', '', '', '', '1', null, '4', '', '1', '2020-01-09 20:20:42', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 00:31:15', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dept` VALUES ('f5738cb934db42118d525459ec794f76', '0.0002', '总经办', '0', '', '', '', '', '', '1', null, '1', '', '1', '2020-01-09 20:19:43', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 00:31:24', 'cb33c25f5c664058a111a9b876152317');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `dict_id` varchar(50) NOT NULL COMMENT '字典编号',
  `dict_index_id` varchar(255) DEFAULT NULL COMMENT '所属字典流水号',
  `dict_code` varchar(100) DEFAULT NULL COMMENT '字典对照码',
  `dict_value` varchar(100) DEFAULT NULL COMMENT '字典对照值',
  `show_color` varchar(50) DEFAULT NULL COMMENT '显示颜色',
  `status` varchar(10) DEFAULT '1' COMMENT '当前状态(0:停用;1:启用)',
  `edit_mode` varchar(10) DEFAULT '1' COMMENT '编辑模式(0:只读;1:可编辑)',
  `sort_no` int DEFAULT NULL COMMENT '排序号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建用户编号',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('11b823f3b2e14e76bf94347a4a5e578e', 'c48507ef391d4e3d8d9b7720efe4841b', '0', '停用', null, '1', '0', '1', '2017-05-03 12:44:22', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:44:22', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('207863e69948408799c3ffd54f5ed9ec', 'ab3b313083d446e7b2707064b05e7ab9', '2', '普通用户', null, '1', '1', '1', '2019-02-11 19:54:35', 'cb33c25f5c664058a111a9b876152317', '2019-05-10 12:43:05', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('28c2fab82ca1433fa22d665caaf881f6', '1d7ff4e822f54d5884ba043aab0b4e17', '3', '按钮', null, '1', '1', '3', '2019-01-31 14:30:25', 'cb33c25f5c664058a111a9b876152317', '2019-01-31 14:30:25', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('293adbde400f457a8d947ff5c6341b04', '992a7d6dbe7f4009b30cbae97c3b64a9', '2', '锁定', '#FFA500', '1', '1', '2', '2017-05-03 12:44:22', 'cb33c25f5c664058a111a9b876152317', '2019-01-29 10:24:15', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('2bfc90a6917545cd87d73fb491292e2b', 'aaec0092a25b485f90c20898e9d6765d', '1', '缺省', null, '1', '1', '1', '2017-05-03 12:44:22', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:44:22', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('3cf6af08f48e4cec913d09f67a0b3b43', '992a7d6dbe7f4009b30cbae97c3b64a9', '1', '正常', null, '1', '1', '1', '2017-05-03 12:44:22', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:44:22', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('58e5b925760e4893a05728f69211cee5', '1d7ff4e822f54d5884ba043aab0b4e17', '1', '父菜单', null, '1', '0', '1', '2019-01-31 14:29:56', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 00:39:01', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('5bab085587df4cfd9ed9896bc83adae0', '305966b8892244f99b56af75f91f3622', '2', '业务 ', '', '1', '1', '2', '2018-05-13 09:46:36', 'cb33c25f5c664058a111a9b876152317', '2018-05-13 13:11:14', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('7dbcfc7297ba40b7b89854a831ad7815', '40d05c7c99f24d768981a3c192e5c143', '0', '否', null, '1', '1', '1', '2019-01-31 14:39:44', 'cb33c25f5c664058a111a9b876152317', '2019-01-31 14:39:44', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('82cc31f2f1d7402a8c60b2be81c67229', '1d7ff4e822f54d5884ba043aab0b4e17', '2', '子菜单', null, '1', '1', '2', '2019-01-31 14:30:07', 'cb33c25f5c664058a111a9b876152317', '2019-01-31 14:30:07', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('8dfd45e6ccf94460b1b979c21d1b1806', '99fd0f3f2d1a49c1acd97ea22415e4a8', '1', '系统菜单', '', '1', '1', '1', '2017-05-03 12:44:21', 'cb33c25f5c664058a111a9b876152317', '2019-01-31 14:31:19', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('913ca1b4b49a434fb9591f6df0a52af8', 'c6f8b99b95c844b89dc86c143e04a294', '0', '否', null, '1', '0', '1', '2017-05-03 12:44:23', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:44:23', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('948aef72716c48bbac2e3234a7470618', '40569802279947f8a807fbaa2852be19', '1', '系统', '', '1', '1', '1', '2018-05-13 23:00:42', 'cb33c25f5c664058a111a9b876152317', '2018-05-13 23:00:42', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('96a195703e3443fbb0683ed61a2dc3d9', 'd4301cc1a0fa451b845cb98e3b5b1e4e', '0', '强制', null, '1', '1', '1', '2020-03-21 01:34:44', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 01:34:44', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('9c63657b98c444e3bfd8a0a75128de2b', '7a7faf68a5ec4f3cb9f45d89c119b26b', '0', '只读', null, '1', '0', '1', '2017-05-03 12:44:23', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:44:23', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('9daf8f79e6684c2281f53a05c3b21c6e', '305966b8892244f99b56af75f91f3622', '1', '系统', '', '1', '0', '1', '2018-05-12 23:46:29', 'cb33c25f5c664058a111a9b876152317', '2019-01-29 10:25:06', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('a96dfb72b7b54e1989569a2b3c5f90ac', 'c48507ef391d4e3d8d9b7720efe4841b', '1', '启用', null, '1', '0', '1', '2017-05-03 12:44:23', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:44:23', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('afc719397e394d858c6207c480a0759f', '40569802279947f8a807fbaa2852be19', '2', '业务', '', '1', '1', '2', '2018-05-13 23:00:57', 'cb33c25f5c664058a111a9b876152317', '2019-05-09 14:22:28', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('ca40ef37acef49f8930fcf22356ba50e', 'c6f8b99b95c844b89dc86c143e04a294', '1', '是', null, '1', '0', '2', '2017-05-03 12:44:23', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:44:23', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('cb3b75c7e87a499999cbf849704fac71', 'd4301cc1a0fa451b845cb98e3b5b1e4e', '1', '不强制', null, '1', '1', '2', '2020-03-21 01:34:51', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 01:35:03', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('d404e540aab945df84a26e3d30b2dd47', '820d2a68425b4d8d9b423b81d6a0eec1', '2', '女', null, '1', '1', '2', '2017-05-03 12:44:23', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:44:23', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('d6a1be71349a46d7a15d2b2d8c164a45', '99fd0f3f2d1a49c1acd97ea22415e4a8', '2', 'APP菜单', null, '1', '1', '2', '2019-01-31 17:39:02', 'cb33c25f5c664058a111a9b876152317', '2019-01-31 17:39:02', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('d7f0c4a5480d4dc4b3e6e4c5b405d9cb', '820d2a68425b4d8d9b423b81d6a0eec1', '1', '男', null, '1', '1', '1', '2017-05-03 12:44:23', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:44:23', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('d87e5581b2674f73a5ff5d90e44bd0a5', '820d2a68425b4d8d9b423b81d6a0eec1', '3', '未知', null, '1', '1', '3', '2019-01-29 10:27:47', 'cb33c25f5c664058a111a9b876152317', '2019-01-29 10:27:47', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('e09ca90fa3544725921d92a8478169d7', 'ab3b313083d446e7b2707064b05e7ab9', '1', '管理用户', null, '1', '1', '1', '2019-02-11 19:54:08', 'cb33c25f5c664058a111a9b876152317', '2019-02-11 19:54:08', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('e52092d6659c4eca8d9641efe265a7fe', '40d05c7c99f24d768981a3c192e5c143', '1', '是', null, '1', '1', '2', '2019-01-31 14:39:53', 'cb33c25f5c664058a111a9b876152317', '2019-01-31 14:39:58', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('f1c0ae8844504f96836b904ce81ac1bc', '7a7faf68a5ec4f3cb9f45d89c119b26b', '1', '可编辑', null, '1', '0', '2', '2017-05-03 12:44:23', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:44:23', 'cb33c25f5c664058a111a9b876152317');

-- ----------------------------
-- Table structure for sys_dict_index
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_index`;
CREATE TABLE `sys_dict_index` (
  `dict_index_id` varchar(50) NOT NULL COMMENT '流水号',
  `dict_key` varchar(50) DEFAULT NULL COMMENT '字典标识',
  `dict_name` varchar(100) DEFAULT NULL COMMENT '字典名称',
  `dict_type` varchar(10) DEFAULT '1' COMMENT '字典分类 1系统2业务',
  `dict_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建用户编号',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`dict_index_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典索引表';

-- ----------------------------
-- Records of sys_dict_index
-- ----------------------------
INSERT INTO `sys_dict_index` VALUES ('1d7ff4e822f54d5884ba043aab0b4e17', 'module_type', '菜单模块类型', '1', '', '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 00:38:58', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict_index` VALUES ('305966b8892244f99b56af75f91f3622', 'dict_type', '字典分类', '1', '', '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict_index` VALUES ('40569802279947f8a807fbaa2852be19', 'param_type', '参数分类', '1', '', '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict_index` VALUES ('40d05c7c99f24d768981a3c192e5c143', 'whether_type', '是否类型', '1', '', '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict_index` VALUES ('7a7faf68a5ec4f3cb9f45d89c119b26b', 'edit_mode', '编辑模式', '1', null, '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict_index` VALUES ('820d2a68425b4d8d9b423b81d6a0eec1', 'sex', '性别', '1', null, '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict_index` VALUES ('992a7d6dbe7f4009b30cbae97c3b64a9', 'user_status', '用户状态', '1', null, '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict_index` VALUES ('99fd0f3f2d1a49c1acd97ea22415e4a8', 'menu_type', '菜单类型', '1', null, '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict_index` VALUES ('aaec0092a25b485f90c20898e9d6765d', 'role_type', '角色类型', '1', null, '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict_index` VALUES ('ab3b313083d446e7b2707064b05e7ab9', 'user_type', '用户类型', '1', '', '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict_index` VALUES ('c48507ef391d4e3d8d9b7720efe4841b', 'status', '当前状态', '1', null, '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict_index` VALUES ('c6f8b99b95c844b89dc86c143e04a294', 'is_auto_expand', '是否自动展开', '1', null, '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-11 17:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict_index` VALUES ('d0808b36022d4770be42989dd392e9a1', 'ZGXL', '最高学历', '1', '', '2021-03-21 23:02:25', 'cb33c25f5c664058a111a9b876152317', '2021-03-21 23:02:25', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict_index` VALUES ('d4301cc1a0fa451b845cb98e3b5b1e4e', 'release_status', '发布状态', '1', '', '2020-03-21 01:34:33', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 01:34:33', 'cb33c25f5c664058a111a9b876152317');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `log_id` varchar(50) NOT NULL COMMENT '日志编号',
  `content` varchar(1000) DEFAULT NULL COMMENT '日志内容',
  `log_type` varchar(10) DEFAULT NULL COMMENT '日志类型',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户编号',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名称',
  `ip` varchar(50) DEFAULT NULL COMMENT 'ip地址',
  `params` varchar(3000) DEFAULT NULL COMMENT '请求参数',
  `response_time` int DEFAULT NULL COMMENT '响应时间',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单编号',
  `cascade_id` varchar(500) DEFAULT NULL COMMENT '分类科目语义ID',
  `menu_name` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `menu_code` varchar(100) DEFAULT NULL COMMENT '菜单编码',
  `menu_type` varchar(10) DEFAULT '1' COMMENT '菜单类型 1父级菜单2子菜单3按钮',
  `module_type` varchar(10) DEFAULT '' COMMENT '模块类型 1父菜单2子菜单3按钮',
  `parent_id` varchar(50) DEFAULT NULL COMMENT '菜单父级编号',
  `icon_name` varchar(50) DEFAULT NULL COMMENT '图标名称',
  `is_auto_expand` varchar(10) DEFAULT '0' COMMENT '是否自动展开',
  `url` varchar(100) DEFAULT NULL COMMENT 'url地址',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` varchar(10) DEFAULT '1' COMMENT '当前状态(0:停用;1:启用)',
  `edit_mode` varchar(10) DEFAULT '1' COMMENT '编辑模式(0:只读;1:可编辑)',
  `sort_no` int DEFAULT NULL COMMENT '排序号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新用户',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单配置';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('04d39848666c4fbf880275a7f58170b9', '0.0002.0006', '角色管理', 'role', '1', '2', 'bcd47e4db40a4be687cad541e210c439', 'fa fa-group', '1', 'mongo/role/roleList.html', '', '1', '1', '4', '2022-03-07 22:24:36', 'cb33c25f5c664058a111a9b876152317', '2022-03-07 22:24:36', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('0d5d6e4bf854431da1adf24e356a7b2f', '0.0002.0004.0001', '新增', 'add', '1', '3', 'eb58818a686443d7afa09e771bcf6af5', null, '0', null, null, '1', '1', '1', '2022-02-26 20:58:14', 'cb33c25f5c664058a111a9b876152317', '2022-02-26 20:58:14', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('1080ed836b4e42ef9d3e31dfc37ae48d', '0.0001.0007.0002', '编辑', 'edit', '1', '3', 'c6225ad4953c44c7aea81341d45f19e4', null, '0', null, null, '1', '1', '2', '2020-03-21 01:33:15', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 01:33:15', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('1c9fff48f14c40f3815bc765c004f7e4', '0.0001.0009', '应用管理', 'appConfig', '1', '', '803e9557efe4475c8739d3c321258def', 'fa fa-modx', '1', 'system/appConfig/appConfigList.html', '', '1', '1', '7', '2022-02-04 19:36:26', 'cb33c25f5c664058a111a9b876152317', '2022-02-04 19:38:11', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('2d30a733e2e547a183cc641aefb4c37c', '0.0001.0004.0003', '删除', 'remove', '1', '3', 'cacda1579dcb49eb972eed5256715b78', '', '1', '', '', '1', '1', '3', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('31695a31cfc347f188d5a9dfa62ed7fd', '0.0001.0009.0001', '新增', 'add', '1', '3', '1c9fff48f14c40f3815bc765c004f7e4', '', '1', '', '', '1', '1', '1', '2022-02-04 20:16:39', 'cb33c25f5c664058a111a9b876152317', '2022-02-04 20:16:39', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('359cccc6baf547318aa3d4efdf16aee6', '0.0001.0006.0001', '新增', 'add', '1', '3', 'cae18585cbec48018042a506beda1ef9', '', '1', '', '', '1', '1', '1', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('384e3012cf2348f3b755910716eefcee', '0.0001.0005.0003', '删除', 'remove', '1', '3', 'b27f57e1361e49259f596fa773d34198', '', '1', '', '', '1', '1', '3', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('39fdd90773ef46878a38f027dee74bd2', '0.0001.0007.0004', '下载', 'download', '1', '3', 'c6225ad4953c44c7aea81341d45f19e4', '', '1', '', '', '1', '1', '4', '2020-03-21 02:01:08', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 02:01:43', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('3c3513facd7f471aad7359bbbec20c73', '0.0002.0005.0001', '新增', 'add', '1', '3', 'fddd9f03620f4fc3bf53d9ee8939f0b7', null, '0', null, null, '1', '1', '1', '2022-03-07 22:22:36', 'cb33c25f5c664058a111a9b876152317', '2022-03-07 22:22:36', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('3d11e0bdca774837bd0f6c96e18beaeb', '0.0002.0003', '组织机构', 'dept', '1', '2', 'bcd47e4db40a4be687cad541e210c439', 'fa fa-cubes', '1', 'mongo/dept/deptList.html', '', '1', '1', '1', '2022-02-22 21:07:20', 'cb33c25f5c664058a111a9b876152317', '2022-02-22 21:07:20', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('4658a2e1f5ea470095da273b6385cef1', '0.0001.0004.0004', '刷新缓存', 'refreshCache', '1', '3', 'cacda1579dcb49eb972eed5256715b78', '', '1', '', '', '1', '1', '4', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('4f97997a141347289c0a0c1237ed8780', '0.0002.0005.0003', '删除', 'remove', '1', '3', 'fddd9f03620f4fc3bf53d9ee8939f0b7', null, '0', null, null, '1', '1', '3', '2022-03-07 22:22:36', 'cb33c25f5c664058a111a9b876152317', '2022-03-07 22:22:36', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('517efa755e0b44eb9174cdfb09c30463', '0.0001.0005.0001', '新增', 'add', '1', '3', 'b27f57e1361e49259f596fa773d34198', '', '1', '', '', '1', '1', '1', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('5398d0bc967a407a8e38e89c690040f1', '0.0001.0003.0004', '授权用户', 'roleUser', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', '', '1', '', '', '1', '1', '4', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('53f9c3b246774e309bdae78ce53b0e44', '0.0001.0006.0004', '删除', 'remove', '1', '3', 'cae18585cbec48018042a506beda1ef9', '', '1', '', '', '1', '1', '4', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('5505d09ebaa34841b3bd3ad3510f59ad', '0.0001.0001.0003', '移动', 'move', '1', '3', '69c73a3c4c10415dab6282eb138271ec', '', '1', '', '', '1', '1', '3', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('5a288b3b6128445ba3f70f52a01b7954', '0.0001.0001.0004', '删除', 'remove', '1', '3', '69c73a3c4c10415dab6282eb138271ec', '', '1', '', '', '1', '1', '4', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('5cf5d87b04b840dd86e9b2ed08cfe6cf', '0.0002.0002', '通用字典', 'dict', '1', '2', 'bcd47e4db40a4be687cad541e210c439', 'fa fa-file-text-o', '1', 'mongo/dict/dictList.html', '', '1', '1', '5', '2022-02-19 13:49:16', 'cb33c25f5c664058a111a9b876152317', '2022-03-07 22:23:25', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('60dc6ce8b85e44a481278b54b7cba4eb', '0.0001.0001.0002', '编辑', 'edit', '1', '3', '69c73a3c4c10415dab6282eb138271ec', '', '1', '', '', '1', '1', '2', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:29:07', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('65af532127b14aaea8ef056fe6326f7e', '0.0001.0003.0001', '新增', 'add', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', '', '1', '', '', '1', '1', '1', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('69c73a3c4c10415dab6282eb138271ec', '0.0001.0001', '组织机构', 'dept', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-sitemap', '1', 'system/dept/deptList.html', '', '1', '1', '1', '2018-10-07 18:14:43', 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('768f21ae831b4f76a006453fa8c32d98', '0.0001.0008', '日志管理', 'log', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-file-text-o', '1', 'system/log/logList.html', '', '1', '1', '9', '2021-03-11 22:58:07', 'cb33c25f5c664058a111a9b876152317', '2022-02-04 19:38:43', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('79287cfd120a4b578f2ccd11156693ba', '0.0001.0003.0005', '刷新缓存', 'refreshCache', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', '', '1', '', '', '1', '1', '5', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('7a09b4ea8f384332bb1c1dad71bb84e8', '0.0001.0003', '角色管理', 'role', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-paw', '1', 'system/role/roleList.html', '', '1', '1', '3', '2018-10-07 18:16:24', 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('7e1c85d513c24d87a8863abbf8a2ed61', '0.0001.0001.0001', '新增', 'add', '1', '3', '69c73a3c4c10415dab6282eb138271ec', '', '1', '', '', '1', '1', '1', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('803e9557efe4475c8739d3c321258def', '0.0001', '系统管理', 'system', '1', '1', '0', 'fa fa-desktop', '1', '', '234', '1', '1', '1', '2018-09-28 18:30:41', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 00:38:48', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('8a0e884bbcf64a8dbd3b6df7305e420e', '0.0001.0004.0002', '编辑', 'edit', '1', '3', 'cacda1579dcb49eb972eed5256715b78', '', '1', '', '', '1', '1', '2', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('8cc8d9ab5386432086e86cc1108c5e95', '0.0002.0001', '键值参数', 'param', '1', '2', 'bcd47e4db40a4be687cad541e210c439', 'fa fa-send', '1', 'mongo/param/paramList.html', '', '1', '1', '6', '2022-02-15 22:50:48', 'cb33c25f5c664058a111a9b876152317', '2022-03-07 22:23:31', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('8d547ab3616f4b3ab70d709f20c8a7f1', '0.0001.0003.0006', '删除', 'remove', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', '', '1', '', '', '1', '1', '6', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('8dfd18a564ac42839d2c8ebab8b1ed12', '0.0001.0006.0002', '编辑', 'edit', '1', '3', 'cae18585cbec48018042a506beda1ef9', '', '1', '', '', '1', '1', '2', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('96884042cc614ebaa2b12be6577e5d85', '0.0001.0002.0005', '移动用户', 'move', '1', '3', 'acb483393285432494e5a5f1524822ee', '', '1', '', '', '1', '1', '4', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('9a58d86c76134808b14df9ff08f261af', '0.0001.0009.0002', '编辑', 'edit', '1', '3', '1c9fff48f14c40f3815bc765c004f7e4', '', '1', '', '', '1', '1', '2', '2022-02-04 20:16:53', 'cb33c25f5c664058a111a9b876152317', '2022-02-04 20:16:53', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('9ff4cf64d2bc418badbcaae0519bbfc5', '0.0001.0003.0003', '授权菜单', 'roleMenu', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', '', '1', '', '', '1', '1', '3', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('a1086818a33c4242baf75e94a9ec1b20', '0.0001.0002.0006', '删除', 'remove', '1', '3', 'acb483393285432494e5a5f1524822ee', '', '1', '', '', '1', '1', '5', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('a654d4e9a5354bbe82f59834d17a862f', '0.0001.0002.0003', '重置密码', 'resetPassword', '1', '3', 'acb483393285432494e5a5f1524822ee', '', '1', '', '', '1', '1', '3', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('a6855aee23904ce4b76742256104ab21', '0.0001.0007.0001', '新增', 'add', '1', '3', 'c6225ad4953c44c7aea81341d45f19e4', null, '0', null, null, '1', '1', '1', '2020-03-21 01:33:15', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 01:33:15', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('a6e31e4d1fc746188ea09ede90b10c68', '0.0002.0004.0002', '编辑', 'edit', '1', '3', 'eb58818a686443d7afa09e771bcf6af5', null, '0', null, null, '1', '1', '2', '2022-02-26 20:58:14', 'cb33c25f5c664058a111a9b876152317', '2022-02-26 20:58:14', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('a9dc3dbb947b4d628c25bf2a06f48dd3', '0.0001.0004.0001', '新增', 'add', '1', '3', 'cacda1579dcb49eb972eed5256715b78', '', '1', '', '', '1', '1', '1', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('acb483393285432494e5a5f1524822ee', '0.0001.0002', '用户管理', 'user', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-user', '1', 'system/user/userList.html', '', '1', '1', '2', '2018-10-07 18:15:19', 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('b27f57e1361e49259f596fa773d34198', '0.0001.0005', '通用字典', 'dict', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-book', '1', 'system/dict/dictList.html', '', '1', '1', '5', '2018-10-07 18:17:41', 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('ba499e989d2f4787b760a88e8d3fdb81', '0.0001.0009.0003', '删除', 'remove', '1', '3', '1c9fff48f14c40f3815bc765c004f7e4', '', '1', '', '', '1', '1', '3', '2022-02-04 20:17:11', 'cb33c25f5c664058a111a9b876152317', '2022-02-04 20:17:11', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('bcd47e4db40a4be687cad541e210c439', '0.0002', 'MongoDB', 'system', '1', '1', '0', '', '1', '', '', '1', '1', '1', '2022-02-15 22:49:22', 'cb33c25f5c664058a111a9b876152317', '2022-02-15 22:49:22', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('bd65f38321f942948300ade911335c7e', '0.0001.0003.0002', '编辑', 'edit', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', '', '1', '', '', '1', '1', '2', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('c6225ad4953c44c7aea81341d45f19e4', '0.0001.0007', 'APK管理', 'apkVersion', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-suitcase', '1', 'system/apkVersion/apkVersionList.html', '', '1', '1', '8', '2020-03-21 01:33:15', 'cb33c25f5c664058a111a9b876152317', '2022-02-04 19:38:36', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('c7d8c56e03f04cc5b6b99f27d130e940', '0.0001.0005.0002', '编辑', 'edit', '1', '3', 'b27f57e1361e49259f596fa773d34198', '', '1', '', '', '1', '1', '2', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('cacda1579dcb49eb972eed5256715b78', '0.0001.0004', '菜单管理', 'menu', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-navicon', '1', 'system/menu/menuList.html', '', '1', '1', '4', '2018-10-07 18:16:56', 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('cae18585cbec48018042a506beda1ef9', '0.0001.0006', '键值参数', 'param', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-leaf', '1', 'system/param/paramList.html', '', '1', '1', '6', '2018-10-07 18:18:25', 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('cb31644e6cf547c091bb94834e687b35', '0.0001.0007.0003', '删除', 'remove', '1', '3', 'c6225ad4953c44c7aea81341d45f19e4', null, '0', null, null, '1', '1', '3', '2020-03-21 01:33:15', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 01:33:15', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('ce151f7ce9284c008f1ffc7da432a7e6', '0.0002.0005.0002', '编辑', 'edit', '1', '3', 'fddd9f03620f4fc3bf53d9ee8939f0b7', null, '0', null, null, '1', '1', '2', '2022-03-07 22:22:36', 'cb33c25f5c664058a111a9b876152317', '2022-03-07 22:22:36', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('d1e72bdb5712476fb47b5fc6a8560de3', '0.0001.0009.0004', '重置账号', 'resetAccount', '1', '3', '1c9fff48f14c40f3815bc765c004f7e4', '', '1', '', '', '1', '1', '4', '2022-02-04 22:18:53', 'cb33c25f5c664058a111a9b876152317', '2022-02-04 22:18:53', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('dbdc07137ac24d169df7cad28b1f1ab4', '0.0001.0002.0001', '新增', 'add', '1', '3', 'acb483393285432494e5a5f1524822ee', '', '1', '', '', '1', '1', '1', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('e77512baeec344db9db365a606e0c646', '0.0001.0008.0001', '删除', 'remove', '1', '3', '768f21ae831b4f76a006453fa8c32d98', '', '1', '', '', '1', '1', '1', '2021-03-11 22:58:30', 'cb33c25f5c664058a111a9b876152317', '2021-03-11 22:58:30', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('e90318b9d0ad49e6bcab7461bec940d5', '0.0001.0006.0003', '刷新缓存', 'refreshCache', '1', '3', 'cae18585cbec48018042a506beda1ef9', '', '1', '', '', '1', '1', '3', null, 'cb33c25f5c664058a111a9b876152317', '2021-03-11 22:11:17', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('eb58818a686443d7afa09e771bcf6af5', '0.0002.0004', '菜单管理', 'menu', '1', '2', 'bcd47e4db40a4be687cad541e210c439', 'fa fa-bars', '1', 'mongo/menu/menuList.html', '', '1', '1', '3', '2022-02-26 20:58:14', 'cb33c25f5c664058a111a9b876152317', '2022-02-26 20:58:14', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('eb8172ac167d490a8e40e125a664d949', '0.0001.0005.0004', '刷新缓存', 'refreshCache', '1', '3', 'b27f57e1361e49259f596fa773d34198', '', '1', '', '', '1', '1', '4', null, 'cb33c25f5c664058a111a9b876152317', '2021-03-11 22:05:34', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('ee6395600f22499a9c059eed4c2ea6fa', '0.0001.0002.0002', '编辑', 'edit', '1', '3', 'acb483393285432494e5a5f1524822ee', '', '1', '', '', '1', '1', '2', null, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 10:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('f1f5cb7e89a749908fee726ad66d5006', '0.0002.0004.0003', '删除', 'remove', '1', '3', 'eb58818a686443d7afa09e771bcf6af5', null, '0', null, null, '1', '1', '3', '2022-02-26 20:58:14', 'cb33c25f5c664058a111a9b876152317', '2022-02-26 20:58:14', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_menu` VALUES ('fddd9f03620f4fc3bf53d9ee8939f0b7', '0.0002.0005', '用户管理', 'user', '1', '2', 'bcd47e4db40a4be687cad541e210c439', 'fa fa-user', '1', 'mongo/user/userList.html', '', '1', '1', '2', '2022-03-07 22:22:36', 'cb33c25f5c664058a111a9b876152317', '2022-03-07 22:22:36', 'cb33c25f5c664058a111a9b876152317');

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `param_id` varchar(50) NOT NULL DEFAULT '' COMMENT '参数编号',
  `param_name` varchar(100) DEFAULT NULL COMMENT '参数名称',
  `param_key` varchar(50) DEFAULT NULL COMMENT '参数键名',
  `param_value` varchar(500) DEFAULT NULL COMMENT '参数键值',
  `param_remark` varchar(200) DEFAULT NULL COMMENT '参数备注',
  `param_type` varchar(10) DEFAULT '0' COMMENT '参数类型0:缺省;1:系统2:业务',
  `status` varchar(10) DEFAULT '1' COMMENT '当前状态(0:停用;1:启用)',
  `edit_mode` varchar(10) DEFAULT '1' COMMENT '编辑模式(0:只读;1:可编辑)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`param_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='键值参数';

-- ----------------------------
-- Records of sys_param
-- ----------------------------
INSERT INTO `sys_param` VALUES ('71a8cd8dcd7b4a8c9fc3a223efffd527', '请求路径', 'request_url', 'http://localhost:8888/webplus', '', '1', '1', '1', '2021-08-09 23:32:09', 'cb33c25f5c664058a111a9b876152317', '2021-11-09 10:06:33', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('859bc36577494d0f8417a042faa5a623', '角色权限菜单开关', 'role_menu_switch', 'off', '角色权限开关，on打开，一般上线的使用，这样有利于减少缓存', '1', '1', '1', '2019-05-11 15:52:25', 'cb33c25f5c664058a111a9b876152317', '2022-01-26 21:42:06', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('a5b181a61341415eb93d2a10574de815', '文件保存根目录', 'save_root_path', 'D:\\\\webplus', '', '1', '1', '1', '2020-03-21 01:48:43', 'cb33c25f5c664058a111a9b876152317', '2021-11-09 10:28:48', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('abe5ff959723414899e531f0cb4134cf', '通用密码', 'common_password', '6493e50abf693c9ff35ef35711c0ad46', '通用密码开启除super账号以外的用户', '1', '1', '0', '2019-05-11 15:27:00', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 00:39:07', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('c7a9bee301de430eb73b965c3ed1e0ca', '文件存储方式', 'save_file_way', '1', '', '1', '1', '1', '2021-08-09 23:31:35', 'cb33c25f5c664058a111a9b876152317', '2021-08-09 23:31:35', 'cb33c25f5c664058a111a9b876152317');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` varchar(50) NOT NULL COMMENT ' 流水号',
  `role_name` varchar(100) NOT NULL COMMENT '角色名称',
  `status` varchar(10) DEFAULT '1' COMMENT '当前状态 1启用 0禁用',
  `role_type` varchar(10) DEFAULT '1' COMMENT '角色类型',
  `role_remark` varchar(400) DEFAULT NULL COMMENT '备注',
  `edit_mode` varchar(10) DEFAULT '1' COMMENT '编辑模式(0:只读;1:可编辑)',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改用户ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('83abaf5c82f443d895345c9b23e03938', '管理员角色', '1', '1', '234', '1', 'cb33c25f5c664058a111a9b876152317', '2018-07-14 07:31:13', 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:08:18');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_menu_id` varchar(50) NOT NULL DEFAULT '' COMMENT '角色与菜单关联编号',
  `role_id` varchar(50) NOT NULL COMMENT ' 角色流水号',
  `menu_id` varchar(50) NOT NULL COMMENT '功能模块流水号',
  `grant_type` varchar(10) DEFAULT NULL COMMENT '权限类型 1 经办权限 2管理权限',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单模块-角色关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('05b2be363b854d9c90305aac918749bb', '', 'a1086818a33c4242baf75e94a9ec1b20', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('07bb29b366eb449e8281e88b6b9ac2f2', '', 'e90318b9d0ad49e6bcab7461bec940d5', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('0a82eefa12734337a87ccaf77a052a31', '', '5398d0bc967a407a8e38e89c690040f1', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('134716036fdb4a3e8333999ce8a0c02d', '', 'b9dbaf45ba534ccfbae26a93e16fa630', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('167fc6ae4de0452da6d17ea15f7dc02b', '', '69c73a3c4c10415dab6282eb138271ec', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('172baa2dd87b45fd89f9e9c45fca196a', '83abaf5c82f443d895345c9b23e03938', 'a1086818a33c4242baf75e94a9ec1b20', null, 'cb33c25f5c664058a111a9b876152317', '2020-03-21 00:37:08');
INSERT INTO `sys_role_menu` VALUES ('1c2264a3e5824636bea9e3ae7cd87a6b', '', 'e92b4059eaec403985ee339b85647244', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('2a3489228ebb45e1bd2f32140433db90', '', '8dfd18a564ac42839d2c8ebab8b1ed12', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('2f234195210c49e3b3f344ae547f7edd', '', '53f9c3b246774e309bdae78ce53b0e44', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('35e54c9d44fa40cd99e0ec07390fabbc', '', '4658a2e1f5ea470095da273b6385cef1', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('35fd0ad6f8404e4c9306587b97177bdc', '', 'b27f57e1361e49259f596fa773d34198', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('360b40f5a33b45e08b2433e71d6a1d79', '', '7e1c85d513c24d87a8863abbf8a2ed61', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('3a4a92f8b70f462ea49b9b7c9b5db335', '', '8a0e884bbcf64a8dbd3b6df7305e420e', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('3aef93f45276405f9ffc5602a720b6d8', '', '359cccc6baf547318aa3d4efdf16aee6', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('3b04689028bd4f6cbe4d8609f8d1096b', '', 'bd65f38321f942948300ade911335c7e', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('3c759254d4974859b695cbc7bd84194f', '', '60dc6ce8b85e44a481278b54b7cba4eb', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('3cd0ad95a32c422ea4ad04d97fe3a056', '', '517efa755e0b44eb9174cdfb09c30463', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('4784e7e818e34693a51392b9ad45210f', '', '9ff4cf64d2bc418badbcaae0519bbfc5', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('4a9084966f5f4185b6479fe77ddd22a4', '', 'cae18585cbec48018042a506beda1ef9', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('531ad8424fdd4b01a93ebd084704d28a', '', 'f6f1a4d4df2d4eaf80c77ce0945af17c', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('54820a63d6f44d1fafe3657dda654fa6', '', 'cacda1579dcb49eb972eed5256715b78', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('62dfab3a543f4f24a73e21b3dff86bc2', '', '65af532127b14aaea8ef056fe6326f7e', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('62e19b4bf4954bdd9e44ba5c4566e462', '', '803e9557efe4475c8739d3c321258def', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('6bbd8052be794d2d89293b5fc6d387a3', '', '8d547ab3616f4b3ab70d709f20c8a7f1', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('6e7836f1de474521b00e584f577af5d0', '', 'a9dc3dbb947b4d628c25bf2a06f48dd3', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('72ee817f9e4d4ddda19e533d483a4213', '83abaf5c82f443d895345c9b23e03938', 'acb483393285432494e5a5f1524822ee', null, 'cb33c25f5c664058a111a9b876152317', '2020-03-21 00:37:08');
INSERT INTO `sys_role_menu` VALUES ('7abc64a62c8d4c5a88f33c23e1c727fa', '', '90169e3dee13473785ae4bb8c2a39ef6', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('9038e791b93e4223a6f19858ea82086c', '', '5505d09ebaa34841b3bd3ad3510f59ad', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('984e2c1e25684f3c8db33f819a994761', '', 'c7d8c56e03f04cc5b6b99f27d130e940', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('9d6518b87e1b43b99bee7a66a180df95', '', 'acb483393285432494e5a5f1524822ee', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('a1bb18cee44e4c858d027014c9d68f70', '', '2d30a733e2e547a183cc641aefb4c37c', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('a9b19ccaa22a4fa3b554a90435800d31', '', 'b37a83ac4a924d9389f5812074feb937', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('ae6b3daebbe84f91ab901c4416cc2442', '', '5a288b3b6128445ba3f70f52a01b7954', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('bbfa6114b57c4ba8ab70606be59d9431', '', 'a654d4e9a5354bbe82f59834d17a862f', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('bd6d70e982584f7990a220b44b0a5d46', '', '7a09b4ea8f384332bb1c1dad71bb84e8', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('bef4c8364f3c42b391d1896ceaa6e4cf', '83abaf5c82f443d895345c9b23e03938', '803e9557efe4475c8739d3c321258def', null, 'cb33c25f5c664058a111a9b876152317', '2020-03-21 00:37:08');
INSERT INTO `sys_role_menu` VALUES ('c1fdb5738374479d8ac3b82adbb8f115', '', '96884042cc614ebaa2b12be6577e5d85', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('d256952fb9f642f3ae7cc1287c8f177f', '', '79287cfd120a4b578f2ccd11156693ba', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('e7dfe1d2d9fa43709a9a4e711fe2c3ec', '', 'dbdc07137ac24d169df7cad28b1f1ab4', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('eaa0c007a96c49d89fab0dce3bf3633a', '', '87a39899da184b8abb976434859d4463', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('f624df2cee0a4c31b23d8bd2e2c5f280', '', 'eb8172ac167d490a8e40e125a664d949', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('f77c1390d1ef4587b972531954bd1603', '', 'ee6395600f22499a9c059eed4c2ea6fa', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');
INSERT INTO `sys_role_menu` VALUES ('f99cd27022504291a5f52a3c802cf1dd', '', '384e3012cf2348f3b755910716eefcee', null, 'cb33c25f5c664058a111a9b876152317', '2019-05-10 02:14:45');

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `role_user_id` varchar(50) NOT NULL DEFAULT '' COMMENT '角色与用户编号',
  `role_id` varchar(50) NOT NULL COMMENT '角色编号',
  `user_id` varchar(50) NOT NULL COMMENT '用户编号',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与用户关联';

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES ('19acf86c06ff489ab90822bbdca46fd1', '83abaf5c82f443d895345c9b23e03938', 'cb33c25f5c664058a111a9b876152317', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 00:42:50');
INSERT INTO `sys_role_user` VALUES ('429395bc2e8540f4aad374fd8925bb87', '83abaf5c82f443d895345c9b23e03938', 'd464e70572f44bacb1e97939f1bf9356', 'cb33c25f5c664058a111a9b876152317', '2020-01-13 10:19:31');
INSERT INTO `sys_role_user` VALUES ('5ffc49892f74495985ccd8cd0f2fc49e', '83abaf5c82f443d895345c9b23e03938', '21948e6d7cdf404fb0a5a320a86c3144', 'cb33c25f5c664058a111a9b876152317', '2019-02-11 19:57:28');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` varchar(50) NOT NULL COMMENT '用户编号',
  `account` varchar(50) NOT NULL COMMENT '用户登录帐号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `username` varchar(50) NOT NULL COMMENT '用户姓名',
  `lock_num` int DEFAULT '5' COMMENT '锁定次数 默认5次',
  `error_num` int DEFAULT '0' COMMENT '密码错误次数  如果等于锁定次数就自动锁定用户',
  `sex` varchar(10) DEFAULT '3' COMMENT '性别  1:男2:女3:未知',
  `status` varchar(10) DEFAULT '1' COMMENT '用户状态 1:正常2:停用 3:锁定',
  `user_type` varchar(10) DEFAULT '1' COMMENT '用户类型',
  `dept_id` varchar(50) DEFAULT NULL COMMENT '所属部门流水号',
  `mobile` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `qq` varchar(50) DEFAULT NULL COMMENT 'QQ号码',
  `wechat` varchar(50) DEFAULT NULL COMMENT '微信',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `idno` varchar(50) DEFAULT NULL COMMENT '身份证号',
  `style` varchar(10) DEFAULT '1' COMMENT '界面风格',
  `address` varchar(200) DEFAULT NULL COMMENT '联系地址',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注',
  `is_del` varchar(10) DEFAULT '0' COMMENT '是否已删除 0有效 1删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改用户编号',
  `position_type` varchar(10) DEFAULT '0' COMMENT '职位0缺省',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('21948e6d7cdf404fb0a5a320a86c3144', 'system', '54b53072540eeeb8f8e9343e71f28176', '超级管理员', '7', '0', '1', '1', '1', '0', '13802907704', '240823329', '', '240823329@qq.com', '450981198407303917', '1', '广州市', '', '1', '2018-09-28 13:24:10', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 00:30:49', 'cb33c25f5c664058a111a9b876152317', '0');
INSERT INTO `sys_user` VALUES ('80a2f1b5a4ea40238a226b64ecefe71e', 'chenqiyuan', 'e10adc3949ba59abbe56e057f20f883e', '陈骑元', '5', '0', '3', '1', '1', 'e51c1cc1de184211bad6fa0ab17d9b12', '13802907704', '', '', '', '', '1', '', '', '1', '2020-01-11 10:05:06', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 00:30:51', 'cb33c25f5c664058a111a9b876152317', '13');
INSERT INTO `sys_user` VALUES ('cb33c25f5c664058a111a9b876152317', 'super', '17c4520f6cfd1ab53d8745e84681eb49', '超级用户', '10', '0', '1', '1', '2', '0', '13802907704', '240823329', '', '240823329@qq.com', '', '1', '', '', '0', '2017-01-15 09:47:46', 'cb33c25f5c664058a111a9b876152317', '2022-03-14 23:03:56', 'cb33c25f5c664058a111a9b876152317', '0');
INSERT INTO `sys_user` VALUES ('d464e70572f44bacb1e97939f1bf9356', 'wuzhegnhui', 'e10adc3949ba59abbe56e057f20f883e', '吴忠辉', '5', '0', '3', '1', '1', '35a2047abd7d41a98974bd8d788bb08d', '13501524139', '', '', '', '', '1', '', '', '1', '2020-01-11 10:29:37', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 00:30:53', 'cb33c25f5c664058a111a9b876152317', '17');
