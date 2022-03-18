/*
 Navicat Premium Data Transfer

 Source Server         : pgsql
 Source Server Type    : PostgreSQL
 Source Server Version : 140001
 Source Host           : localhost:5432
 Source Catalog        : webplus
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140001
 File Encoding         : 65001

 Date: 18/03/2022 23:24:26
*/


-- ----------------------------
-- Table structure for sys_apk_version
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_apk_version";
CREATE TABLE "public"."sys_apk_version" (
  "version_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "apk_name" varchar(100) COLLATE "pg_catalog"."default",
  "fid" varchar(50) COLLATE "pg_catalog"."default",
  "version_name" varchar(50) COLLATE "pg_catalog"."default",
  "version_num" varchar(50) COLLATE "pg_catalog"."default",
  "version_desc" varchar(200) COLLATE "pg_catalog"."default",
  "release_status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "create_time" timestamp(6),
  "create_by" varchar(50) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6),
  "update_by" varchar(50) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_apk_version"."version_id" IS '版本编号';
COMMENT ON COLUMN "public"."sys_apk_version"."apk_name" IS 'apk名称';
COMMENT ON COLUMN "public"."sys_apk_version"."fid" IS '文件fid';
COMMENT ON COLUMN "public"."sys_apk_version"."version_name" IS '版本名称';
COMMENT ON COLUMN "public"."sys_apk_version"."version_num" IS '版本号';
COMMENT ON COLUMN "public"."sys_apk_version"."version_desc" IS '升级说明';
COMMENT ON COLUMN "public"."sys_apk_version"."release_status" IS '发布状态0强制1不强制';
COMMENT ON COLUMN "public"."sys_apk_version"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_apk_version"."create_by" IS '创建人ID';
COMMENT ON COLUMN "public"."sys_apk_version"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_apk_version"."update_by" IS '更新人';

-- ----------------------------
-- Records of sys_apk_version
-- ----------------------------
INSERT INTO "public"."sys_apk_version" VALUES ('0dafce2cccc84e03a58a969656cd41db', 'greatqingyuan_v1.0.13_release.apk', 'efb74c6204d74b13a4e980eb40e6533d.apk', '12', '12', '123', '0', '2021-08-10 07:14:24', 'cb33c25f5c664058a111a9b876152317', '2021-08-10 07:14:24', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_apk_version" VALUES ('7ace592cfed04bdab6dc72df19a9910f', 'greatqingyuan_v1.0.13_release.apk', 'apk_f56fb20789ef4eb0a7d6f8df7cb6219f.apk', '33', '23', NULL, '0', '2021-08-11 07:34:32', 'cb33c25f5c664058a111a9b876152317', '2021-08-11 07:34:32', 'cb33c25f5c664058a111a9b876152317');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dept";
CREATE TABLE "public"."sys_dept" (
  "dept_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "cascade_id" varchar(255) COLLATE "pg_catalog"."default",
  "dept_name" varchar(100) COLLATE "pg_catalog"."default",
  "parent_id" varchar(50) COLLATE "pg_catalog"."default",
  "dept_code" varchar(50) COLLATE "pg_catalog"."default",
  "manager" varchar(50) COLLATE "pg_catalog"."default",
  "phone" varchar(50) COLLATE "pg_catalog"."default",
  "fax" varchar(50) COLLATE "pg_catalog"."default",
  "address" varchar(200) COLLATE "pg_catalog"."default",
  "is_auto_expand" varchar(10) COLLATE "pg_catalog"."default",
  "icon_name" varchar(50) COLLATE "pg_catalog"."default",
  "sort_no" int4,
  "remark" varchar(400) COLLATE "pg_catalog"."default",
  "is_del" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 0,
  "create_time" timestamp(6),
  "create_by" varchar(50) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6) NOT NULL,
  "update_by" varchar(50) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_dept"."dept_id" IS '流水号';
COMMENT ON COLUMN "public"."sys_dept"."cascade_id" IS '节点语义ID';
COMMENT ON COLUMN "public"."sys_dept"."dept_name" IS '组织名称';
COMMENT ON COLUMN "public"."sys_dept"."parent_id" IS '父节点流水号';
COMMENT ON COLUMN "public"."sys_dept"."dept_code" IS '机构代码';
COMMENT ON COLUMN "public"."sys_dept"."manager" IS '主要负责人';
COMMENT ON COLUMN "public"."sys_dept"."phone" IS '部门电话';
COMMENT ON COLUMN "public"."sys_dept"."fax" IS '传真';
COMMENT ON COLUMN "public"."sys_dept"."address" IS '地址';
COMMENT ON COLUMN "public"."sys_dept"."is_auto_expand" IS '是否自动展开';
COMMENT ON COLUMN "public"."sys_dept"."icon_name" IS '节点图标文件名称';
COMMENT ON COLUMN "public"."sys_dept"."sort_no" IS '排序号';
COMMENT ON COLUMN "public"."sys_dept"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_dept"."is_del" IS '是否已删除 0有效 1删除';
COMMENT ON COLUMN "public"."sys_dept"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dept"."create_by" IS '创建人ID';
COMMENT ON COLUMN "public"."sys_dept"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_dept"."update_by" IS '更新人';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO "public"."sys_dept" VALUES ('0310d7c44ea346638ebfeaa919b8616d', '0.0001', '广州研发中心', '0', '0120', '陈骑元', '13802907704', NULL, NULL, '1', NULL, 1, NULL, '1', '2018-09-23 18:01:08', 'cb33c25f5c664058a111a9b876152317', '2019-05-12 01:13:04', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dept" VALUES ('1d549a802a7b4b73bd60965d4403fc2b', '0.0001.0002.0001.0001', '234', '96086bf7ae1c4de4835673873b682242', '24', NULL, NULL, NULL, NULL, '1', NULL, 1, NULL, '1', '2019-05-12 01:06:34', 'cb33c25f5c664058a111a9b876152317', '2019-05-12 01:12:48', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dept" VALUES ('35a2047abd7d41a98974bd8d788bb08d', '0.0006', '财务部', '0', NULL, NULL, NULL, NULL, NULL, '1', NULL, 5, NULL, '1', '2020-01-10 04:20:56', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 08:31:11', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dept" VALUES ('472be965030f47d09b96516455f475cf', '0.0009', '行政人事部', '0', NULL, NULL, NULL, NULL, NULL, '1', NULL, 8, NULL, '1', '2020-01-10 04:22:10', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 08:31:02', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dept" VALUES ('65dba6d5063c447ba83cb267e1f4a9d7', '0.0001.0005', '2321', '0310d7c44ea346638ebfeaa919b8616d', '23', NULL, NULL, NULL, NULL, '1', NULL, 1, NULL, '1', '2019-01-29 00:16:38', 'cb33c25f5c664058a111a9b876152317', '2019-01-29 00:46:42', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dept" VALUES ('661f24d8599548daad1300639226e502', '0.0001.0003', '322', '0310d7c44ea346638ebfeaa919b8616d', '234', NULL, NULL, NULL, NULL, '1', NULL, 1, NULL, '1', '2019-01-28 23:29:06', 'cb33c25f5c664058a111a9b876152317', '2019-01-29 00:46:47', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dept" VALUES ('6ebe2d3d10fe4b6ba449272364af810b', '0.0007', '商务部', '0', NULL, NULL, NULL, NULL, NULL, '1', NULL, 6, NULL, '1', '2020-01-10 04:21:11', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 08:31:09', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dept" VALUES ('7aa78414386e4ab3b665d9455713c73e', '0.0003', '研发中心', '0', NULL, NULL, NULL, NULL, NULL, '1', NULL, 2, NULL, '1', '2020-01-10 04:20:00', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 08:31:21', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dept" VALUES ('8abec06781cb43e0b1f24879595b1ee6', '0.0001.0007.0001', '天河区', 'ed06c91df4d24aadbc7f5dff9eb399e8', '1werew', NULL, NULL, NULL, '12', '1', NULL, 1, NULL, '1', '2019-05-10 05:59:14', 'cb33c25f5c664058a111a9b876152317', '2019-05-12 01:12:53', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dept" VALUES ('96086bf7ae1c4de4835673873b682242', '0.0001.0002.0001', '北京研发中心', 'bc546ac8c05b4ed8b6073b2a169a64a4', NULL, NULL, NULL, NULL, NULL, '1', NULL, 2, NULL, '1', '2018-09-23 18:01:25', 'cb33c25f5c664058a111a9b876152317', '2019-05-12 01:12:50', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dept" VALUES ('a2032e817bd142ac93293b66d9d62462', '0.0001.0006', '234345433', '0310d7c44ea346638ebfeaa919b8616d', '4324', NULL, NULL, NULL, NULL, '1', NULL, 1, NULL, '1', '2019-01-29 00:18:22', 'cb33c25f5c664058a111a9b876152317', '2019-01-29 00:46:55', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dept" VALUES ('b3e7e87fb2074d7390587f45bf87acb5', '0.0001.0007.0001.0001', '天河区', '8abec06781cb43e0b1f24879595b1ee6', NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, NULL, '1', '2018-09-23 18:01:43', 'cb33c25f5c664058a111a9b876152317', '2019-05-12 01:06:42', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dept" VALUES ('bc546ac8c05b4ed8b6073b2a169a64a4', '0.0001.0002', '天河办事处', '0310d7c44ea346638ebfeaa919b8616d', '2343242', '陈骑元', '13802907704', NULL, '天河区小新塘', '1', NULL, 1, 'wrwerwr', '1', '2019-01-28 23:00:36', 'cb33c25f5c664058a111a9b876152317', '2019-05-12 01:13:01', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dept" VALUES ('c422157564e44d8e89b9e975a1ff1308', '0.0001.0004', '2342', '0310d7c44ea346638ebfeaa919b8616d', '2342', '2', NULL, NULL, NULL, '1', NULL, 1, NULL, '1', '2019-01-28 23:30:51', 'cb33c25f5c664058a111a9b876152317', '2019-01-29 00:04:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dept" VALUES ('e277c9178d0541de8f6ad3abc4985787', '0.0008', '营销中心', '0', NULL, NULL, NULL, NULL, NULL, '1', NULL, 7, NULL, '1', '2020-01-10 04:21:49', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 08:31:05', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dept" VALUES ('e51c1cc1de184211bad6fa0ab17d9b12', '0.0004', '交付中心', '0', NULL, NULL, NULL, NULL, NULL, '1', NULL, 3, NULL, '1', '2020-01-10 04:20:24', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 08:31:18', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dept" VALUES ('ed06c91df4d24aadbc7f5dff9eb399e8', '0.0001.0007', '海淀区', '0310d7c44ea346638ebfeaa919b8616d', NULL, NULL, NULL, NULL, '12312', '1', NULL, 1, NULL, '1', '2018-09-23 18:01:53', 'cb33c25f5c664058a111a9b876152317', '2019-05-12 01:12:58', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dept" VALUES ('ef515f74ecde40959d8a55186a1a7ff0', '0.0005', '产品中心', '0', NULL, NULL, NULL, NULL, NULL, '1', NULL, 4, NULL, '1', '2020-01-10 04:20:42', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 08:31:15', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dept" VALUES ('f5738cb934db42118d525459ec794f76', '0.0002', '总经办', '0', NULL, NULL, NULL, NULL, NULL, '1', NULL, 1, NULL, '1', '2020-01-10 04:19:43', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 08:31:24', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dept" VALUES ('0', '0', '广州市图南软件有限公司', '-1', '', '', '', '', '', '1', 'dept_config', 1, '', '0', '2018-09-23 17:40:39', 'cb33c25f5c664058a111a9b876152317', '2022-01-06 23:20:20', 'cb33c25f5c664058a111a9b876152317');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict";
CREATE TABLE "public"."sys_dict" (
  "dict_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "dict_index_id" varchar(255) COLLATE "pg_catalog"."default",
  "dict_code" varchar(100) COLLATE "pg_catalog"."default",
  "dict_value" varchar(100) COLLATE "pg_catalog"."default",
  "show_color" varchar(50) COLLATE "pg_catalog"."default",
  "status" varchar(10) COLLATE "pg_catalog"."default",
  "edit_mode" varchar(10) COLLATE "pg_catalog"."default",
  "sort_no" int4,
  "create_time" timestamp(6),
  "create_by" varchar(50) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6),
  "update_by" varchar(50) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_dict"."dict_id" IS '字典编号';
COMMENT ON COLUMN "public"."sys_dict"."dict_index_id" IS '所属字典流水号';
COMMENT ON COLUMN "public"."sys_dict"."dict_code" IS '字典对照码';
COMMENT ON COLUMN "public"."sys_dict"."dict_value" IS '字典对照值';
COMMENT ON COLUMN "public"."sys_dict"."show_color" IS '显示颜色';
COMMENT ON COLUMN "public"."sys_dict"."status" IS '当前状态(0:停用;1:启用)';
COMMENT ON COLUMN "public"."sys_dict"."edit_mode" IS '编辑模式(0:只读;1:可编辑)';
COMMENT ON COLUMN "public"."sys_dict"."sort_no" IS '排序号';
COMMENT ON COLUMN "public"."sys_dict"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dict"."create_by" IS '创建用户编号';
COMMENT ON COLUMN "public"."sys_dict"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_dict"."update_by" IS '更新人';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO "public"."sys_dict" VALUES ('11b823f3b2e14e76bf94347a4a5e578e', 'c48507ef391d4e3d8d9b7720efe4841b', '0', '停用', NULL, '1', '0', 1, '2017-05-03 20:44:22', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 20:44:22', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('207863e69948408799c3ffd54f5ed9ec', 'ab3b313083d446e7b2707064b05e7ab9', '2', '普通用户', NULL, '1', '1', 1, '2019-02-12 03:54:35', 'cb33c25f5c664058a111a9b876152317', '2019-05-10 20:43:05', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('28c2fab82ca1433fa22d665caaf881f6', '1d7ff4e822f54d5884ba043aab0b4e17', '3', '按钮', NULL, '1', '1', 3, '2019-01-31 22:30:25', 'cb33c25f5c664058a111a9b876152317', '2019-01-31 22:30:25', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('293adbde400f457a8d947ff5c6341b04', '992a7d6dbe7f4009b30cbae97c3b64a9', '2', '锁定', '#FFA500', '1', '1', 2, '2017-05-03 20:44:22', 'cb33c25f5c664058a111a9b876152317', '2019-01-29 18:24:15', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('2bfc90a6917545cd87d73fb491292e2b', 'aaec0092a25b485f90c20898e9d6765d', '1', '缺省', NULL, '1', '1', 1, '2017-05-03 20:44:22', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 20:44:22', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('3cf6af08f48e4cec913d09f67a0b3b43', '992a7d6dbe7f4009b30cbae97c3b64a9', '1', '正常', NULL, '1', '1', 1, '2017-05-03 20:44:22', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 20:44:22', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('58e5b925760e4893a05728f69211cee5', '1d7ff4e822f54d5884ba043aab0b4e17', '1', '父菜单', NULL, '1', '0', 1, '2019-01-31 22:29:56', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 08:39:01', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('5bab085587df4cfd9ed9896bc83adae0', '305966b8892244f99b56af75f91f3622', '2', '业务 ', NULL, '1', '1', 2, '2018-05-13 17:46:36', 'cb33c25f5c664058a111a9b876152317', '2018-05-13 21:11:14', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('7dbcfc7297ba40b7b89854a831ad7815', '40d05c7c99f24d768981a3c192e5c143', '0', '否', NULL, '1', '1', 1, '2019-01-31 22:39:44', 'cb33c25f5c664058a111a9b876152317', '2019-01-31 22:39:44', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('82cc31f2f1d7402a8c60b2be81c67229', '1d7ff4e822f54d5884ba043aab0b4e17', '2', '子菜单', NULL, '1', '1', 2, '2019-01-31 22:30:07', 'cb33c25f5c664058a111a9b876152317', '2019-01-31 22:30:07', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('8dfd45e6ccf94460b1b979c21d1b1806', '99fd0f3f2d1a49c1acd97ea22415e4a8', '1', '系统菜单', NULL, '1', '1', 1, '2017-05-03 20:44:21', 'cb33c25f5c664058a111a9b876152317', '2019-01-31 22:31:19', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('913ca1b4b49a434fb9591f6df0a52af8', 'c6f8b99b95c844b89dc86c143e04a294', '0', '否', NULL, '1', '0', 1, '2017-05-03 20:44:23', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 20:44:23', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('948aef72716c48bbac2e3234a7470618', '40569802279947f8a807fbaa2852be19', '1', '系统', NULL, '1', '1', 1, '2018-05-14 07:00:42', 'cb33c25f5c664058a111a9b876152317', '2018-05-14 07:00:42', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('96a195703e3443fbb0683ed61a2dc3d9', 'd4301cc1a0fa451b845cb98e3b5b1e4e', '0', '强制', NULL, '1', '1', 1, '2020-03-21 09:34:44', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 09:34:44', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('9c63657b98c444e3bfd8a0a75128de2b', '7a7faf68a5ec4f3cb9f45d89c119b26b', '0', '只读', NULL, '1', '0', 1, '2017-05-03 20:44:23', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 20:44:23', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('9daf8f79e6684c2281f53a05c3b21c6e', '305966b8892244f99b56af75f91f3622', '1', '系统', NULL, '1', '0', 1, '2018-05-13 07:46:29', 'cb33c25f5c664058a111a9b876152317', '2019-01-29 18:25:06', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('a96dfb72b7b54e1989569a2b3c5f90ac', 'c48507ef391d4e3d8d9b7720efe4841b', '1', '启用', NULL, '1', '0', 1, '2017-05-03 20:44:23', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 20:44:23', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('afc719397e394d858c6207c480a0759f', '40569802279947f8a807fbaa2852be19', '2', '业务', NULL, '1', '1', 2, '2018-05-14 07:00:57', 'cb33c25f5c664058a111a9b876152317', '2019-05-09 22:22:28', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('ca40ef37acef49f8930fcf22356ba50e', 'c6f8b99b95c844b89dc86c143e04a294', '1', '是', NULL, '1', '0', 2, '2017-05-03 20:44:23', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 20:44:23', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('cb3b75c7e87a499999cbf849704fac71', 'd4301cc1a0fa451b845cb98e3b5b1e4e', '1', '不强制', NULL, '1', '1', 2, '2020-03-21 09:34:51', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 09:35:03', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('d404e540aab945df84a26e3d30b2dd47', '820d2a68425b4d8d9b423b81d6a0eec1', '2', '女', NULL, '1', '1', 2, '2017-05-03 20:44:23', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 20:44:23', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('d6a1be71349a46d7a15d2b2d8c164a45', '99fd0f3f2d1a49c1acd97ea22415e4a8', '2', 'APP菜单', NULL, '1', '1', 2, '2019-02-01 01:39:02', 'cb33c25f5c664058a111a9b876152317', '2019-02-01 01:39:02', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('d7f0c4a5480d4dc4b3e6e4c5b405d9cb', '820d2a68425b4d8d9b423b81d6a0eec1', '1', '男', NULL, '1', '1', 1, '2017-05-03 20:44:23', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 20:44:23', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('d87e5581b2674f73a5ff5d90e44bd0a5', '820d2a68425b4d8d9b423b81d6a0eec1', '3', '未知', NULL, '1', '1', 3, '2019-01-29 18:27:47', 'cb33c25f5c664058a111a9b876152317', '2019-01-29 18:27:47', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('e09ca90fa3544725921d92a8478169d7', 'ab3b313083d446e7b2707064b05e7ab9', '1', '管理用户', NULL, '1', '1', 1, '2019-02-12 03:54:08', 'cb33c25f5c664058a111a9b876152317', '2019-02-12 03:54:08', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('e52092d6659c4eca8d9641efe265a7fe', '40d05c7c99f24d768981a3c192e5c143', '1', '是', NULL, '1', '1', 2, '2019-01-31 22:39:53', 'cb33c25f5c664058a111a9b876152317', '2019-01-31 22:39:58', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict" VALUES ('f1c0ae8844504f96836b904ce81ac1bc', '7a7faf68a5ec4f3cb9f45d89c119b26b', '1', '可编辑', NULL, '1', '0', 2, '2017-05-03 20:44:23', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 20:44:23', 'cb33c25f5c664058a111a9b876152317');

-- ----------------------------
-- Table structure for sys_dict_index
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict_index";
CREATE TABLE "public"."sys_dict_index" (
  "dict_index_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "dict_key" varchar(50) COLLATE "pg_catalog"."default",
  "dict_name" varchar(100) COLLATE "pg_catalog"."default",
  "dict_type" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 1,
  "dict_remark" varchar(500) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "create_by" varchar(50) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6),
  "update_by" varchar(50) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_dict_index"."dict_index_id" IS '流水号';
COMMENT ON COLUMN "public"."sys_dict_index"."dict_key" IS '字典标识';
COMMENT ON COLUMN "public"."sys_dict_index"."dict_name" IS '字典名称';
COMMENT ON COLUMN "public"."sys_dict_index"."dict_type" IS '字典分类 1系统2业务';
COMMENT ON COLUMN "public"."sys_dict_index"."dict_remark" IS '备注';
COMMENT ON COLUMN "public"."sys_dict_index"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dict_index"."create_by" IS '创建用户编号';
COMMENT ON COLUMN "public"."sys_dict_index"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_dict_index"."update_by" IS '修改用户ID';

-- ----------------------------
-- Records of sys_dict_index
-- ----------------------------
INSERT INTO "public"."sys_dict_index" VALUES ('1d7ff4e822f54d5884ba043aab0b4e17', 'module_type', '菜单模块类型', '1', NULL, '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 08:38:58', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict_index" VALUES ('305966b8892244f99b56af75f91f3622', 'dict_type', '字典分类', '1', NULL, '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict_index" VALUES ('40569802279947f8a807fbaa2852be19', 'param_type', '参数分类', '1', NULL, '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict_index" VALUES ('40d05c7c99f24d768981a3c192e5c143', 'whether_type', '是否类型', '1', NULL, '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict_index" VALUES ('7a7faf68a5ec4f3cb9f45d89c119b26b', 'edit_mode', '编辑模式', '1', NULL, '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict_index" VALUES ('820d2a68425b4d8d9b423b81d6a0eec1', 'sex', '性别', '1', NULL, '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict_index" VALUES ('992a7d6dbe7f4009b30cbae97c3b64a9', 'user_status', '用户状态', '1', NULL, '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict_index" VALUES ('99fd0f3f2d1a49c1acd97ea22415e4a8', 'menu_type', '菜单类型', '1', NULL, '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict_index" VALUES ('aaec0092a25b485f90c20898e9d6765d', 'role_type', '角色类型', '1', NULL, '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict_index" VALUES ('ab3b313083d446e7b2707064b05e7ab9', 'user_type', '用户类型', '1', NULL, '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict_index" VALUES ('c48507ef391d4e3d8d9b7720efe4841b', 'status', '当前状态', '1', NULL, '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict_index" VALUES ('c6f8b99b95c844b89dc86c143e04a294', 'is_auto_expand', '是否自动展开', '1', NULL, '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317', '2019-05-12 01:17:26', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_dict_index" VALUES ('d4301cc1a0fa451b845cb98e3b5b1e4e', 'release_status', '发布状态', '1', NULL, '2020-03-21 09:34:33', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 09:34:33', 'cb33c25f5c664058a111a9b876152317');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_log";
CREATE TABLE "public"."sys_log" (
  "log_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "content" varchar(1000) COLLATE "pg_catalog"."default",
  "log_type" varchar(10) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "method" varchar(200) COLLATE "pg_catalog"."default",
  "user_id" varchar(50) COLLATE "pg_catalog"."default",
  "user_name" varchar(50) COLLATE "pg_catalog"."default",
  "ip" varchar(50) COLLATE "pg_catalog"."default",
  "params" varchar(3000) COLLATE "pg_catalog"."default",
  "response_time" int4,
  "description" varchar(500) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_log"."log_id" IS '日志编号';
COMMENT ON COLUMN "public"."sys_log"."content" IS '日志内容';
COMMENT ON COLUMN "public"."sys_log"."log_type" IS '日志类型';
COMMENT ON COLUMN "public"."sys_log"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_log"."method" IS '请求方法';
COMMENT ON COLUMN "public"."sys_log"."user_id" IS '用户编号';
COMMENT ON COLUMN "public"."sys_log"."user_name" IS '用户名';
COMMENT ON COLUMN "public"."sys_log"."ip" IS 'ip地址';
COMMENT ON COLUMN "public"."sys_log"."params" IS '请求参数';
COMMENT ON COLUMN "public"."sys_log"."response_time" IS '请求时间';
COMMENT ON COLUMN "public"."sys_log"."description" IS '请求描述';

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_menu";
CREATE TABLE "public"."sys_menu" (
  "menu_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "cascade_id" varchar(500) COLLATE "pg_catalog"."default",
  "menu_name" varchar(100) COLLATE "pg_catalog"."default",
  "menu_code" varchar(100) COLLATE "pg_catalog"."default",
  "menu_type" varchar(10) COLLATE "pg_catalog"."default",
  "module_type" varchar(10) COLLATE "pg_catalog"."default",
  "parent_id" varchar(50) COLLATE "pg_catalog"."default",
  "icon_name" varchar(50) COLLATE "pg_catalog"."default",
  "is_auto_expand" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 0,
  "url" varchar(100) COLLATE "pg_catalog"."default",
  "remark" varchar(500) COLLATE "pg_catalog"."default",
  "status" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 1,
  "edit_mode" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 1,
  "sort_no" int4,
  "create_time" timestamp(6),
  "create_by" varchar(50) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6),
  "update_by" varchar(50) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_menu"."menu_id" IS '菜单编号';
COMMENT ON COLUMN "public"."sys_menu"."cascade_id" IS '分类科目语义ID';
COMMENT ON COLUMN "public"."sys_menu"."menu_name" IS '菜单名称';
COMMENT ON COLUMN "public"."sys_menu"."menu_code" IS '菜单编码';
COMMENT ON COLUMN "public"."sys_menu"."menu_type" IS '模块类型 1父菜单2子菜单3按钮';
COMMENT ON COLUMN "public"."sys_menu"."module_type" IS '菜单类型 1父级菜单2子菜单3按钮';
COMMENT ON COLUMN "public"."sys_menu"."parent_id" IS '菜单父级编号';
COMMENT ON COLUMN "public"."sys_menu"."icon_name" IS '图标名称';
COMMENT ON COLUMN "public"."sys_menu"."is_auto_expand" IS '是否自动展开';
COMMENT ON COLUMN "public"."sys_menu"."url" IS 'url地址';
COMMENT ON COLUMN "public"."sys_menu"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_menu"."status" IS '当前状态(0:停用;1:启用)';
COMMENT ON COLUMN "public"."sys_menu"."edit_mode" IS '编辑模式(0:只读;1:可编辑)';
COMMENT ON COLUMN "public"."sys_menu"."sort_no" IS '排序号';
COMMENT ON COLUMN "public"."sys_menu"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_menu"."create_by" IS '创建人';
COMMENT ON COLUMN "public"."sys_menu"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_menu"."update_by" IS '更新人';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO "public"."sys_menu" VALUES ('1080ed836b4e42ef9d3e31dfc37ae48d', '0.0001.0007.0002', '编辑', 'edit', '1', '3', 'c6225ad4953c44c7aea81341d45f19e4', NULL, '0', NULL, NULL, '1', '1', 2, '2020-03-21 09:33:15', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 09:33:15', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('2d30a733e2e547a183cc641aefb4c37c', '0.0001.0004.0003', '删除', 'remove', '1', '3', 'cacda1579dcb49eb972eed5256715b78', NULL, '1', NULL, NULL, '1', '1', 3, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('359cccc6baf547318aa3d4efdf16aee6', '0.0001.0006.0001', '新增', 'add', '1', '3', 'cae18585cbec48018042a506beda1ef9', NULL, '1', NULL, NULL, '1', '1', 1, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('384e3012cf2348f3b755910716eefcee', '0.0001.0005.0003', '删除', 'remove', '1', '3', 'b27f57e1361e49259f596fa773d34198', NULL, '1', NULL, NULL, '1', '1', 3, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('39fdd90773ef46878a38f027dee74bd2', '0.0001.0007.0004', '下载', 'download', '1', '3', 'c6225ad4953c44c7aea81341d45f19e4', NULL, '1', NULL, NULL, '1', '1', 4, '2020-03-21 10:01:08', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 10:01:43', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('4658a2e1f5ea470095da273b6385cef1', '0.0001.0004.0004', '刷新缓存', 'refreshCache', '1', '3', 'cacda1579dcb49eb972eed5256715b78', NULL, '1', NULL, NULL, '1', '1', 4, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('517efa755e0b44eb9174cdfb09c30463', '0.0001.0005.0001', '新增', 'add', '1', '3', 'b27f57e1361e49259f596fa773d34198', NULL, '1', NULL, NULL, '1', '1', 1, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('5398d0bc967a407a8e38e89c690040f1', '0.0001.0003.0004', '授权用户', 'roleUser', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', NULL, '1', NULL, NULL, '1', '1', 4, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('53f9c3b246774e309bdae78ce53b0e44', '0.0001.0006.0004', '删除', 'remove', '1', '3', 'cae18585cbec48018042a506beda1ef9', NULL, '1', NULL, NULL, '1', '1', 4, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('5505d09ebaa34841b3bd3ad3510f59ad', '0.0001.0001.0003', '移动', 'move', '1', '3', '69c73a3c4c10415dab6282eb138271ec', NULL, '1', NULL, NULL, '1', '1', 3, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('5a288b3b6128445ba3f70f52a01b7954', '0.0001.0001.0004', '删除', 'remove', '1', '3', '69c73a3c4c10415dab6282eb138271ec', NULL, '1', NULL, NULL, '1', '1', 4, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('60dc6ce8b85e44a481278b54b7cba4eb', '0.0001.0001.0002', '编辑', 'edit', '1', '3', '69c73a3c4c10415dab6282eb138271ec', NULL, '1', NULL, NULL, '1', '1', 2, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:29:07', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('65af532127b14aaea8ef056fe6326f7e', '0.0001.0003.0001', '新增', 'add', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', NULL, '1', NULL, NULL, '1', '1', 1, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('69c73a3c4c10415dab6282eb138271ec', '0.0001.0001', '组织机构', 'dept', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-sitemap', '1', 'system/dept/deptList.html', NULL, '1', '1', 1, '2018-10-08 02:14:43', 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('768f21ae831b4f76a006453fa8c32d98', '0.0001.0008', '日志管理', 'log', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-file-text-o', '1', 'system/log/logList.html', NULL, '1', '1', 8, '2021-03-12 06:58:07', 'cb33c25f5c664058a111a9b876152317', '2021-03-12 06:58:07', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('79287cfd120a4b578f2ccd11156693ba', '0.0001.0003.0005', '刷新缓存', 'refreshCache', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', NULL, '1', NULL, NULL, '1', '1', 5, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('7a09b4ea8f384332bb1c1dad71bb84e8', '0.0001.0003', '角色管理', 'role', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-paw', '1', 'system/role/roleList.html', NULL, '1', '1', 3, '2018-10-08 02:16:24', 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('7e1c85d513c24d87a8863abbf8a2ed61', '0.0001.0001.0001', '新增', 'add', '1', '3', '69c73a3c4c10415dab6282eb138271ec', NULL, '1', NULL, NULL, '1', '1', 1, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('8a0e884bbcf64a8dbd3b6df7305e420e', '0.0001.0004.0002', '编辑', 'edit', '1', '3', 'cacda1579dcb49eb972eed5256715b78', NULL, '1', NULL, NULL, '1', '1', 2, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('8d547ab3616f4b3ab70d709f20c8a7f1', '0.0001.0003.0006', '删除', 'remove', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', NULL, '1', NULL, NULL, '1', '1', 6, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('8dfd18a564ac42839d2c8ebab8b1ed12', '0.0001.0006.0002', '编辑', 'edit', '1', '3', 'cae18585cbec48018042a506beda1ef9', NULL, '1', NULL, NULL, '1', '1', 2, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('96884042cc614ebaa2b12be6577e5d85', '0.0001.0002.0005', '移动用户', 'move', '1', '3', 'acb483393285432494e5a5f1524822ee', NULL, '1', NULL, NULL, '1', '1', 4, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('9ff4cf64d2bc418badbcaae0519bbfc5', '0.0001.0003.0003', '授权菜单', 'roleMenu', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', NULL, '1', NULL, NULL, '1', '1', 3, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('a1086818a33c4242baf75e94a9ec1b20', '0.0001.0002.0006', '删除', 'remove', '1', '3', 'acb483393285432494e5a5f1524822ee', NULL, '1', NULL, NULL, '1', '1', 5, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('a654d4e9a5354bbe82f59834d17a862f', '0.0001.0002.0003', '重置密码', 'resetPassword', '1', '3', 'acb483393285432494e5a5f1524822ee', NULL, '1', NULL, NULL, '1', '1', 3, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('a6855aee23904ce4b76742256104ab21', '0.0001.0007.0001', '新增', 'add', '1', '3', 'c6225ad4953c44c7aea81341d45f19e4', NULL, '0', NULL, NULL, '1', '1', 1, '2020-03-21 09:33:15', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 09:33:15', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('a9dc3dbb947b4d628c25bf2a06f48dd3', '0.0001.0004.0001', '新增', 'add', '1', '3', 'cacda1579dcb49eb972eed5256715b78', NULL, '1', NULL, NULL, '1', '1', 1, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('acb483393285432494e5a5f1524822ee', '0.0001.0002', '用户管理', 'user', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-user', '1', 'system/user/userList.html', NULL, '1', '1', 2, '2018-10-08 02:15:19', 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('b27f57e1361e49259f596fa773d34198', '0.0001.0005', '通用字典', 'dict', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-book', '1', 'system/dict/dictList.html', NULL, '1', '1', 5, '2018-10-08 02:17:41', 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('bd65f38321f942948300ade911335c7e', '0.0001.0003.0002', '编辑', 'edit', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', NULL, '1', NULL, NULL, '1', '1', 2, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('c6225ad4953c44c7aea81341d45f19e4', '0.0001.0007', 'APK管理', 'apkVersion', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-suitcase', '1', 'system/apkVersion/apkVersionList.html', NULL, '1', '1', 7, '2020-03-21 09:33:15', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 09:33:15', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('c7d8c56e03f04cc5b6b99f27d130e940', '0.0001.0005.0002', '编辑', 'edit', '1', '3', 'b27f57e1361e49259f596fa773d34198', NULL, '1', NULL, NULL, '1', '1', 2, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('cacda1579dcb49eb972eed5256715b78', '0.0001.0004', '菜单管理', 'menu', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-navicon', '1', 'system/menu/menuList.html', NULL, '1', '1', 4, '2018-10-08 02:16:56', 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('cae18585cbec48018042a506beda1ef9', '0.0001.0006', '键值参数', 'param', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-leaf', '1', 'system/param/paramList.html', NULL, '1', '1', 6, '2018-10-08 02:18:25', 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('cb31644e6cf547c091bb94834e687b35', '0.0001.0007.0003', '删除', 'remove', '1', '3', 'c6225ad4953c44c7aea81341d45f19e4', NULL, '0', NULL, NULL, '1', '1', 3, '2020-03-21 09:33:15', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 09:33:15', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('dbdc07137ac24d169df7cad28b1f1ab4', '0.0001.0002.0001', '新增', 'add', '1', '3', 'acb483393285432494e5a5f1524822ee', NULL, '1', NULL, NULL, '1', '1', 1, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('e77512baeec344db9db365a606e0c646', '0.0001.0008.0001', '删除', 'remove', '1', '3', '768f21ae831b4f76a006453fa8c32d98', NULL, '1', NULL, NULL, '1', '1', 1, '2021-03-12 06:58:30', 'cb33c25f5c664058a111a9b876152317', '2021-03-12 06:58:30', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('e90318b9d0ad49e6bcab7461bec940d5', '0.0001.0006.0003', '刷新缓存', 'refreshCache', '1', '3', 'cae18585cbec48018042a506beda1ef9', NULL, '1', NULL, NULL, '1', '1', 3, NULL, 'cb33c25f5c664058a111a9b876152317', '2021-03-12 06:11:17', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('eb8172ac167d490a8e40e125a664d949', '0.0001.0005.0004', '刷新缓存', 'refreshCache', '1', '3', 'b27f57e1361e49259f596fa773d34198', NULL, '1', NULL, NULL, '1', '1', 4, NULL, 'cb33c25f5c664058a111a9b876152317', '2021-03-12 06:05:34', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('ee6395600f22499a9c059eed4c2ea6fa', '0.0001.0002.0002', '编辑', 'edit', '1', '3', 'acb483393285432494e5a5f1524822ee', NULL, '1', NULL, NULL, '1', '1', 2, NULL, 'cb33c25f5c664058a111a9b876152317', '2020-01-08 18:06:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_menu" VALUES ('803e9557efe4475c8739d3c321258def', '0.0001', '系统管理', 'system', '1', '1', '0', 'fa fa-desktop', '1', '', '234', '1', '1', 1, '2018-09-29 02:30:41', 'cb33c25f5c664058a111a9b876152317', '2022-01-06 23:20:43', 'cb33c25f5c664058a111a9b876152317');

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_param";
CREATE TABLE "public"."sys_param" (
  "param_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "param_name" varchar(100) COLLATE "pg_catalog"."default",
  "param_key" varchar(50) COLLATE "pg_catalog"."default",
  "param_value" varchar(500) COLLATE "pg_catalog"."default",
  "param_remark" varchar(200) COLLATE "pg_catalog"."default",
  "param_type" varchar(10) COLLATE "pg_catalog"."default",
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 1,
  "edit_mode" varchar(10) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "create_by" varchar(50) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6),
  "update_by" varchar(50) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_param"."param_id" IS '参数编号';
COMMENT ON COLUMN "public"."sys_param"."param_name" IS '参数名称';
COMMENT ON COLUMN "public"."sys_param"."param_key" IS '参数键名';
COMMENT ON COLUMN "public"."sys_param"."param_value" IS '参数键值';
COMMENT ON COLUMN "public"."sys_param"."param_remark" IS '参数备注';
COMMENT ON COLUMN "public"."sys_param"."param_type" IS '参数类型0:缺省;1:系统2:业务';
COMMENT ON COLUMN "public"."sys_param"."status" IS '当前状态(0:停用;1:启用)';
COMMENT ON COLUMN "public"."sys_param"."edit_mode" IS '编辑模式(0:只读;1:可编辑)';
COMMENT ON COLUMN "public"."sys_param"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_param"."create_by" IS '创建用户';
COMMENT ON COLUMN "public"."sys_param"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_param"."update_by" IS '修改用户';

-- ----------------------------
-- Records of sys_param
-- ----------------------------
INSERT INTO "public"."sys_param" VALUES ('a5b181a61341415eb93d2a10574de815', '文件保存根目录', 'save_root_path', 'D:\\webplus', NULL, '1', '1', '1', '2020-03-21 09:48:43', 'cb33c25f5c664058a111a9b876152317', '2021-11-09 18:28:48', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_param" VALUES ('c7a9bee301de430eb73b965c3ed1e0ca', '文件存储方式', 'save_file_way', '1', NULL, '1', '1', '1', '2021-08-10 07:31:35', 'cb33c25f5c664058a111a9b876152317', '2021-08-10 07:31:35', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_param" VALUES ('71a8cd8dcd7b4a8c9fc3a223efffd527', '请求路径', 'request_url', 'http://localhost:8888/webplus', NULL, '1', '1', '1', '2021-08-10 07:32:09', 'cb33c25f5c664058a111a9b876152317', '2022-01-06 23:20:10', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_param" VALUES ('859bc36577494d0f8417a042faa5a623', '角色权限菜单开关', 'role_menu_switch', 'off', '角色权限开关，on打开，一般上线的使用，这样有利于减少缓存', '1', '1', '1', '2019-05-11 23:52:25', 'cb33c25f5c664058a111a9b876152317', '2022-01-06 23:20:11', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO "public"."sys_param" VALUES ('abe5ff959723414899e531f0cb4134cf', '通用密码', 'common_password', '6493e50abf693c9ff35ef35711c0ad46', '通用密码开启除super账号以外的用户', '1', '1', '1', '2019-05-11 23:27:00', 'cb33c25f5c664058a111a9b876152317', '2022-01-06 23:20:11', 'cb33c25f5c664058a111a9b876152317');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role";
CREATE TABLE "public"."sys_role" (
  "role_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "role_name" varchar(100) COLLATE "pg_catalog"."default",
  "status" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 1,
  "role_type" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 1,
  "role_remark" varchar(400) COLLATE "pg_catalog"."default",
  "edit_mode" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 1,
  "create_by" varchar(50) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "update_by" varchar(50) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_role"."role_id" IS '流水号';
COMMENT ON COLUMN "public"."sys_role"."role_name" IS '角色名称';
COMMENT ON COLUMN "public"."sys_role"."status" IS '当前状态 1启用 0禁用';
COMMENT ON COLUMN "public"."sys_role"."role_type" IS '角色类型';
COMMENT ON COLUMN "public"."sys_role"."role_remark" IS '备注';
COMMENT ON COLUMN "public"."sys_role"."edit_mode" IS '编辑模式(0:只读;1:可编辑)';
COMMENT ON COLUMN "public"."sys_role"."create_by" IS '创建用户编号';
COMMENT ON COLUMN "public"."sys_role"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_role"."update_by" IS '修改用户ID';
COMMENT ON COLUMN "public"."sys_role"."update_time" IS '修改时间';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO "public"."sys_role" VALUES ('83abaf5c82f443d895345c9b23e03938', '管理员角色', '1', '1', '234', '1', 'cb33c25f5c664058a111a9b876152317', '2018-07-14 15:31:13', 'cb33c25f5c664058a111a9b876152317', '2022-01-06 23:20:30');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_menu";
CREATE TABLE "public"."sys_role_menu" (
  "role_menu_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "role_id" varchar(50) COLLATE "pg_catalog"."default",
  "menu_id" varchar(50) COLLATE "pg_catalog"."default",
  "grant_type" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 1,
  "create_by" varchar(50) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_role_menu"."role_menu_id" IS '角色与菜单关联编号';
COMMENT ON COLUMN "public"."sys_role_menu"."role_id" IS '角色流水号';
COMMENT ON COLUMN "public"."sys_role_menu"."menu_id" IS '功能模块流水号';
COMMENT ON COLUMN "public"."sys_role_menu"."grant_type" IS '权限类型 1 经办权限 2管理权限';
COMMENT ON COLUMN "public"."sys_role_menu"."create_by" IS '创建人ID';
COMMENT ON COLUMN "public"."sys_role_menu"."create_time" IS '创建时间';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_user";
CREATE TABLE "public"."sys_role_user" (
  "role_user_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "role_id" varchar(50) COLLATE "pg_catalog"."default",
  "user_id" varchar(50) COLLATE "pg_catalog"."default",
  "create_by" varchar(50) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_role_user"."role_user_id" IS '角色与用户编号';
COMMENT ON COLUMN "public"."sys_role_user"."role_id" IS '角色编号';
COMMENT ON COLUMN "public"."sys_role_user"."user_id" IS '用户编号';
COMMENT ON COLUMN "public"."sys_role_user"."create_by" IS '创建用户编号';
COMMENT ON COLUMN "public"."sys_role_user"."create_time" IS '创建时间';

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO "public"."sys_role_user" VALUES ('19acf86c06ff489ab90822bbdca46fd1', '83abaf5c82f443d895345c9b23e03938', 'cb33c25f5c664058a111a9b876152317', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 08:42:50');
INSERT INTO "public"."sys_role_user" VALUES ('429395bc2e8540f4aad374fd8925bb87', '83abaf5c82f443d895345c9b23e03938', 'd464e70572f44bacb1e97939f1bf9356', 'cb33c25f5c664058a111a9b876152317', '2020-01-13 18:19:31');
INSERT INTO "public"."sys_role_user" VALUES ('5ffc49892f74495985ccd8cd0f2fc49e', '83abaf5c82f443d895345c9b23e03938', '21948e6d7cdf404fb0a5a320a86c3144', 'cb33c25f5c664058a111a9b876152317', '2019-02-12 03:57:28');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user";
CREATE TABLE "public"."sys_user" (
  "user_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "account" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "username" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "lock_num" int4 DEFAULT 5,
  "error_num" int4 DEFAULT 0,
  "sex" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 3,
  "status" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 1,
  "user_type" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 1,
  "dept_id" varchar(50) COLLATE "pg_catalog"."default",
  "mobile" varchar(50) COLLATE "pg_catalog"."default",
  "qq" varchar(50) COLLATE "pg_catalog"."default",
  "wechat" varchar(50) COLLATE "pg_catalog"."default",
  "email" varchar(50) COLLATE "pg_catalog"."default",
  "idno" varchar(50) COLLATE "pg_catalog"."default",
  "style" varchar(10) COLLATE "pg_catalog"."default",
  "address" varchar(200) COLLATE "pg_catalog"."default",
  "remark" varchar(400) COLLATE "pg_catalog"."default",
  "is_del" varchar(10) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "create_by" varchar(50) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6),
  "update_by" varchar(50) COLLATE "pg_catalog"."default",
  "position_type" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 0
)
;
COMMENT ON COLUMN "public"."sys_user"."user_id" IS '用户编号';
COMMENT ON COLUMN "public"."sys_user"."account" IS '用户登录帐号';
COMMENT ON COLUMN "public"."sys_user"."password" IS '密码';
COMMENT ON COLUMN "public"."sys_user"."username" IS '用户姓名';
COMMENT ON COLUMN "public"."sys_user"."lock_num" IS '锁定次数 默认5次';
COMMENT ON COLUMN "public"."sys_user"."error_num" IS '密码错误次数  如果等于锁定次数就自动锁定用户';
COMMENT ON COLUMN "public"."sys_user"."sex" IS '性别  1:男2:女3:未知';
COMMENT ON COLUMN "public"."sys_user"."status" IS '用户状态 1:正常2:停用 3:锁定';
COMMENT ON COLUMN "public"."sys_user"."user_type" IS '用户类型';
COMMENT ON COLUMN "public"."sys_user"."dept_id" IS '所属部门流水号';
COMMENT ON COLUMN "public"."sys_user"."mobile" IS '联系电话';
COMMENT ON COLUMN "public"."sys_user"."qq" IS 'QQ号码';
COMMENT ON COLUMN "public"."sys_user"."wechat" IS '微信';
COMMENT ON COLUMN "public"."sys_user"."email" IS '电子邮件';
COMMENT ON COLUMN "public"."sys_user"."idno" IS '身份证号';
COMMENT ON COLUMN "public"."sys_user"."style" IS '界面风格';
COMMENT ON COLUMN "public"."sys_user"."address" IS '联系地址';
COMMENT ON COLUMN "public"."sys_user"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_user"."is_del" IS '是否已删除 0有效 1删除';
COMMENT ON COLUMN "public"."sys_user"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_user"."create_by" IS '创建人ID';
COMMENT ON COLUMN "public"."sys_user"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_user"."update_by" IS '修改用户编号';
COMMENT ON COLUMN "public"."sys_user"."position_type" IS '职位0缺省';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO "public"."sys_user" VALUES ('21948e6d7cdf404fb0a5a320a86c3144', 'system', '54b53072540eeeb8f8e9343e71f28176', '超级管理员', 7, 0, '1', '1', '1', '0', '13802907704', '240823329', NULL, '240823329@qq.com', '450981198407303917', '1', '广州市', NULL, '1', '2018-09-28 21:24:10', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 08:30:49', 'cb33c25f5c664058a111a9b876152317', '0');
INSERT INTO "public"."sys_user" VALUES ('80a2f1b5a4ea40238a226b64ecefe71e', 'chenqiyuan', 'e10adc3949ba59abbe56e057f20f883e', '陈骑元', 5, 0, '3', '1', '1', 'e51c1cc1de184211bad6fa0ab17d9b12', '13802907704', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '2020-01-11 18:05:06', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 08:30:51', 'cb33c25f5c664058a111a9b876152317', '13');
INSERT INTO "public"."sys_user" VALUES ('d464e70572f44bacb1e97939f1bf9356', 'wuzhegnhui', 'e10adc3949ba59abbe56e057f20f883e', '吴忠辉', 5, 0, '3', '1', '1', '35a2047abd7d41a98974bd8d788bb08d', '13501524139', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '2020-01-11 18:29:37', 'cb33c25f5c664058a111a9b876152317', '2020-03-21 08:30:53', 'cb33c25f5c664058a111a9b876152317', '17');
INSERT INTO "public"."sys_user" VALUES ('cb33c25f5c664058a111a9b876152317', 'super', '17c4520f6cfd1ab53d8745e84681eb49', '超级用户', 10, 0, '1', '1', '2', '0', '13802907704', '240823329', '', '240823329@qq.com', '', '1', '', '', '0', '2017-01-15 17:47:46', 'cb33c25f5c664058a111a9b876152317', '2022-01-06 23:20:24', 'cb33c25f5c664058a111a9b876152317', '0');

-- ----------------------------
-- Primary Key structure for table sys_apk_version
-- ----------------------------
ALTER TABLE "public"."sys_apk_version" ADD CONSTRAINT "sys_apk_version_pkey" PRIMARY KEY ("version_id");

-- ----------------------------
-- Primary Key structure for table sys_dept
-- ----------------------------
ALTER TABLE "public"."sys_dept" ADD CONSTRAINT "sys_dept_pkey" PRIMARY KEY ("dept_id");

-- ----------------------------
-- Indexes structure for table sys_dict
-- ----------------------------
CREATE INDEX "idx_dict_index_id" ON "public"."sys_dict" USING btree (
  "dict_index_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_dict
-- ----------------------------
ALTER TABLE "public"."sys_dict" ADD CONSTRAINT "sys_dict_pkey" PRIMARY KEY ("dict_id");

-- ----------------------------
-- Indexes structure for table sys_dict_index
-- ----------------------------
CREATE INDEX "idx_dict_key" ON "public"."sys_dict_index" USING btree (
  "dict_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_dict_index
-- ----------------------------
ALTER TABLE "public"."sys_dict_index" ADD CONSTRAINT "sys_dict_index_pkey" PRIMARY KEY ("dict_index_id");

-- ----------------------------
-- Primary Key structure for table sys_log
-- ----------------------------
ALTER TABLE "public"."sys_log" ADD CONSTRAINT "sys_log_pkey" PRIMARY KEY ("log_id");

-- ----------------------------
-- Indexes structure for table sys_menu
-- ----------------------------
CREATE INDEX "idx_cascade_id" ON "public"."sys_menu" USING btree (
  "cascade_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_parent_id" ON "public"."sys_menu" USING btree (
  "parent_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_menu
-- ----------------------------
ALTER TABLE "public"."sys_menu" ADD CONSTRAINT "sys_menu_pkey" PRIMARY KEY ("menu_id");

-- ----------------------------
-- Indexes structure for table sys_param
-- ----------------------------
CREATE INDEX "idx_param_key" ON "public"."sys_param" USING btree (
  "param_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_param
-- ----------------------------
ALTER TABLE "public"."sys_param" ADD CONSTRAINT "sys_param_pkey" PRIMARY KEY ("param_id");

-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE "public"."sys_role" ADD CONSTRAINT "sys_role_pkey" PRIMARY KEY ("role_id");

-- ----------------------------
-- Indexes structure for table sys_role_menu
-- ----------------------------
CREATE INDEX "idx_role_id" ON "public"."sys_role_menu" USING btree (
  "role_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_role_menu
-- ----------------------------
ALTER TABLE "public"."sys_role_menu" ADD CONSTRAINT "sys_role_menu_pkey" PRIMARY KEY ("role_menu_id");

-- ----------------------------
-- Indexes structure for table sys_role_user
-- ----------------------------
CREATE INDEX "idx_user_role_id" ON "public"."sys_role_user" USING btree (
  "role_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_role_user
-- ----------------------------
ALTER TABLE "public"."sys_role_user" ADD CONSTRAINT "sys_role_user_pkey" PRIMARY KEY ("role_user_id");

-- ----------------------------
-- Indexes structure for table sys_user
-- ----------------------------
CREATE INDEX "idx_dept_id" ON "public"."sys_user" USING btree (
  "dept_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_user_account" ON "public"."sys_user" USING btree (
  "account" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_pkey" PRIMARY KEY ("user_id");
