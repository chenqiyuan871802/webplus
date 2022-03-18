prompt PL/SQL Developer import file
prompt Created on 2019年5月12日 by 蓝枫
set feedback off
set define off
prompt Creating SYS_DEPT...
create table SYS_DEPT
(
  dept_id        VARCHAR2(50) not null,
  cascade_id     VARCHAR2(255) not null,
  dept_name      VARCHAR2(100) not null,
  parent_id      VARCHAR2(50) not null,
  dept_code      VARCHAR2(50),
  manager        VARCHAR2(50),
  phone          VARCHAR2(50),
  fax            VARCHAR2(50),
  address        VARCHAR2(200),
  is_auto_expand VARCHAR2(10),
  icon_name      VARCHAR2(50),
  sort_no        NUMBER(10),
  remark         VARCHAR2(400),
  is_del         VARCHAR2(10) default 0,
  create_time    DATE,
  create_by      VARCHAR2(50),
  update_time    DATE,
  update_by      VARCHAR2(50)
)
;
comment on table SYS_DEPT
  is '组织机构';
comment on column SYS_DEPT.dept_id
  is '流水号';
comment on column SYS_DEPT.cascade_id
  is '节点语义ID';
comment on column SYS_DEPT.dept_name
  is '组织名称';
comment on column SYS_DEPT.parent_id
  is '父节点流水号';
comment on column SYS_DEPT.dept_code
  is '机构代码';
comment on column SYS_DEPT.manager
  is '主要负责人';
comment on column SYS_DEPT.phone
  is '部门电话';
comment on column SYS_DEPT.fax
  is '传真';
comment on column SYS_DEPT.address
  is '地址';
comment on column SYS_DEPT.is_auto_expand
  is '是否自动展开';
comment on column SYS_DEPT.icon_name
  is '节点图标文件名称';
comment on column SYS_DEPT.sort_no
  is '排序号';
comment on column SYS_DEPT.remark
  is '备注';
comment on column SYS_DEPT.is_del
  is '是否已删除 0有效 1删除';
comment on column SYS_DEPT.create_time
  is '创建时间';
comment on column SYS_DEPT.create_by
  is '创建人ID';
comment on column SYS_DEPT.update_time
  is '修改时间';
comment on column SYS_DEPT.update_by
  is '修改用户ID';
alter table SYS_DEPT
  add constraint PK_DEPT_ID primary key (DEPT_ID);

prompt Creating SYS_DICT...
create table SYS_DICT
(
  dict_id       VARCHAR2(50) not null,
  dict_index_id VARCHAR2(255),
  dict_code     VARCHAR2(100),
  dict_value    VARCHAR2(100),
  show_color    VARCHAR2(50),
  status        VARCHAR2(10) default 1,
  edit_mode     VARCHAR2(10) default 1,
  sort_no       NUMBER(10),
  create_time   DATE,
  create_by     VARCHAR2(50),
  update_time   DATE,
  update_by     VARCHAR2(50)
)
;
comment on table SYS_DICT
  is '数据字典';
comment on column SYS_DICT.dict_id
  is '字典编号';
comment on column SYS_DICT.dict_index_id
  is '所属字典流水号';
comment on column SYS_DICT.dict_code
  is '字典对照码';
comment on column SYS_DICT.dict_value
  is '字典对照值';
comment on column SYS_DICT.show_color
  is '显示颜色';
comment on column SYS_DICT.status
  is '当前状态(0:停用;1:启用)';
comment on column SYS_DICT.edit_mode
  is '编辑模式(0:只读;1:可编辑)';
comment on column SYS_DICT.sort_no
  is '排序号';
comment on column SYS_DICT.create_time
  is '创建时间';
comment on column SYS_DICT.create_by
  is '创建用户编号';
comment on column SYS_DICT.update_time
  is '更新时间';
comment on column SYS_DICT.update_by
  is '更新人编号';
alter table SYS_DICT
  add constraint PK_DICT_ID primary key (DICT_ID);

prompt Creating SYS_DICT_INDEX...
create table SYS_DICT_INDEX
(
  dict_index_id VARCHAR2(50) not null,
  dict_key      VARCHAR2(50),
  dict_name     VARCHAR2(100),
  dict_remark   VARCHAR2(500),
  create_time   DATE,
  create_by     VARCHAR2(50),
  update_time   DATE,
  update_by     VARCHAR2(50),
  dict_type     VARCHAR2(10) default 1
)
;
comment on table SYS_DICT_INDEX
  is '数据字单类型';
comment on column SYS_DICT_INDEX.dict_index_id
  is '流水号';
comment on column SYS_DICT_INDEX.dict_key
  is '字典标识';
comment on column SYS_DICT_INDEX.dict_name
  is '字典名称';
comment on column SYS_DICT_INDEX.dict_remark
  is '备注';
comment on column SYS_DICT_INDEX.create_time
  is '创建时间';
comment on column SYS_DICT_INDEX.create_by
  is '创建用户编号';
comment on column SYS_DICT_INDEX.update_time
  is '更新时间';
comment on column SYS_DICT_INDEX.update_by
  is '更新人编号';
comment on column SYS_DICT_INDEX.dict_type
  is '字典分类 1系统2业务';
alter table SYS_DICT_INDEX
  add constraint PK_DICT_INDEX_ID primary key (DICT_INDEX_ID);

prompt Creating SYS_MENU...
create table SYS_MENU
(
  menu_id        VARCHAR2(50) not null,
  cascade_id     VARCHAR2(500),
  menu_name      VARCHAR2(100),
  menu_code      VARCHAR2(100),
  menu_type      VARCHAR2(10),
  module_type    VARCHAR2(10) default 1,
  parent_id      VARCHAR2(50),
  icon_name      VARCHAR2(50),
  is_auto_expand VARCHAR2(10) default 0,
  url            VARCHAR2(100),
  remark         VARCHAR2(500),
  status         VARCHAR2(10) default 1,
  edit_mode      VARCHAR2(10) default 1,
  sort_no        NUMBER(11),
  create_time    DATE,
  create_by      VARCHAR2(50),
  update_time    DATE,
  update_by      VARCHAR2(50)
)
;
comment on table SYS_MENU
  is '菜单信息表';
comment on column SYS_MENU.menu_id
  is '菜单编号';
comment on column SYS_MENU.cascade_id
  is '语义索引';
comment on column SYS_MENU.menu_name
  is '菜单名称';
comment on column SYS_MENU.menu_code
  is '菜单编码';
comment on column SYS_MENU.menu_type
  is '菜单类型';
comment on column SYS_MENU.module_type
  is '模块类型 1父级菜单2子菜单3按钮';
comment on column SYS_MENU.parent_id
  is '父菜单编号';
comment on column SYS_MENU.icon_name
  is '图标名称';
comment on column SYS_MENU.is_auto_expand
  is '是否自动展开';
comment on column SYS_MENU.url
  is 'url地址';
comment on column SYS_MENU.remark
  is '备注';
comment on column SYS_MENU.status
  is '当前状态(0:停用;1:启用)';
comment on column SYS_MENU.edit_mode
  is '编辑模式(0:只读;1:可编辑)';
comment on column SYS_MENU.sort_no
  is '排序号';
comment on column SYS_MENU.create_time
  is '创建时间';
comment on column SYS_MENU.create_by
  is '创建人编号';
comment on column SYS_MENU.update_time
  is '更新时间';
comment on column SYS_MENU.update_by
  is '更新人编号';
alter table SYS_MENU
  add constraint PK_MENU_ID primary key (MENU_ID);

prompt Creating SYS_PARAM...
create table SYS_PARAM
(
  param_id     VARCHAR2(50) not null,
  param_name   VARCHAR2(100),
  param_key    VARCHAR2(50),
  param_value  VARCHAR2(500),
  param_remark VARCHAR2(200),
  status       VARCHAR2(10) default 1,
  edit_mode    VARCHAR2(10) default 1,
  create_time  DATE,
  create_by    VARCHAR2(50),
  update_time  DATE,
  update_by    VARCHAR2(50),
  param_type   VARCHAR2(10) default 1
)
;
comment on table SYS_PARAM
  is '键值参数';
comment on column SYS_PARAM.param_id
  is '参数编号';
comment on column SYS_PARAM.param_name
  is '参数名称';
comment on column SYS_PARAM.param_key
  is '参数键名';
comment on column SYS_PARAM.param_value
  is '参数键值';
comment on column SYS_PARAM.param_remark
  is '参数备注';
comment on column SYS_PARAM.status
  is '当前状态(0:停用;1:启用)';
comment on column SYS_PARAM.edit_mode
  is '编辑模式(0:只读;1:可编辑)';
comment on column SYS_PARAM.create_time
  is '创建时间';
comment on column SYS_PARAM.create_by
  is '创建用户编号';
comment on column SYS_PARAM.update_time
  is '更新时间';
comment on column SYS_PARAM.update_by
  is '更新用户编号';
comment on column SYS_PARAM.param_type
  is '参数类型1:系统2:业务';
alter table SYS_PARAM
  add constraint PK_PARAM_ID primary key (PARAM_ID);

prompt Creating SYS_ROLE...
create table SYS_ROLE
(
  role_id     VARCHAR2(50) not null,
  role_name   VARCHAR2(100) not null,
  status      VARCHAR2(10) default 1,
  role_type   VARCHAR2(10),
  role_remark VARCHAR2(400),
  edit_mode   VARCHAR2(10) default 1,
  create_by   VARCHAR2(50),
  create_time DATE,
  update_by   VARCHAR2(50),
  update_time DATE
)
;
comment on table SYS_ROLE
  is '角色管理';
comment on column SYS_ROLE.role_id
  is '角色编号';
comment on column SYS_ROLE.role_name
  is '角色名称';
comment on column SYS_ROLE.status
  is '当前状态(0:停用;1:启用)';
comment on column SYS_ROLE.role_type
  is '角色类型';
comment on column SYS_ROLE.role_remark
  is '备注';
comment on column SYS_ROLE.edit_mode
  is '编辑模式(0:只读;1:可编辑)';
comment on column SYS_ROLE.create_by
  is '创建用户编号';
comment on column SYS_ROLE.create_time
  is '创建时间';
comment on column SYS_ROLE.update_by
  is '修改用户编号';
comment on column SYS_ROLE.update_time
  is '修改时间';
alter table SYS_ROLE
  add constraint PK_ROLE_ID primary key (ROLE_ID);

prompt Creating SYS_ROLE_MENU...
create table SYS_ROLE_MENU
(
  role_id      VARCHAR2(50) not null,
  menu_id      VARCHAR2(50) not null,
  grant_type   VARCHAR2(10),
  create_by    VARCHAR2(50),
  create_time  DATE,
  role_menu_id VARCHAR2(50) not null
)
;
comment on table SYS_ROLE_MENU
  is '角色与菜单关联表';
comment on column SYS_ROLE_MENU.role_id
  is '角色编号';
comment on column SYS_ROLE_MENU.menu_id
  is '菜单编号';
comment on column SYS_ROLE_MENU.grant_type
  is '权限类型 1 经办权限 2管理权限';
comment on column SYS_ROLE_MENU.create_by
  is '创建用户ID';
comment on column SYS_ROLE_MENU.create_time
  is '创建时间';
comment on column SYS_ROLE_MENU.role_menu_id
  is '角色菜单编号';
alter table SYS_ROLE_MENU
  add constraint PK_ROLE_MENU_ID primary key (ROLE_MENU_ID);

prompt Creating SYS_ROLE_USER...
create table SYS_ROLE_USER
(
  role_id      VARCHAR2(50) not null,
  user_id      VARCHAR2(50) not null,
  create_by    VARCHAR2(50),
  create_time  DATE,
  role_user_id VARCHAR2(50)
)
;
comment on table SYS_ROLE_USER
  is '角色与用户关联表';
comment on column SYS_ROLE_USER.role_id
  is '角色编号';
comment on column SYS_ROLE_USER.user_id
  is '用户编号';
comment on column SYS_ROLE_USER.create_by
  is '创建用户ID';
comment on column SYS_ROLE_USER.create_time
  is '创建时间';
comment on column SYS_ROLE_USER.role_user_id
  is '角色用户编号';

prompt Creating SYS_USER...
create table SYS_USER
(
  user_id     VARCHAR2(50) not null,
  account     VARCHAR2(50),
  password    VARCHAR2(50),
  username    VARCHAR2(50),
  lock_num    NUMBER(10) default 5,
  error_num   NUMBER(10) default 0,
  sex         VARCHAR2(10) default 3,
  status      VARCHAR2(10) default 1,
  user_type   VARCHAR2(10),
  dept_id     VARCHAR2(50),
  mobile      VARCHAR2(50),
  qq          VARCHAR2(50),
  wechat      VARCHAR2(50),
  email       VARCHAR2(50),
  idno        VARCHAR2(50),
  style       VARCHAR2(10) default 1,
  address     VARCHAR2(200),
  remark      VARCHAR2(400),
  is_del      VARCHAR2(10) default 0,
  create_time DATE,
  create_by   VARCHAR2(50),
  update_time DATE,
  update_by   VARCHAR2(50)
)
;
comment on table SYS_USER
  is '用户管理';
comment on column SYS_USER.user_id
  is '用户编号';
comment on column SYS_USER.account
  is '用户登录帐号';
comment on column SYS_USER.password
  is '密码';
comment on column SYS_USER.username
  is '用户姓名';
comment on column SYS_USER.lock_num
  is '锁定次数 默认5次';
comment on column SYS_USER.error_num
  is '密码错误次数  如果等于锁定次数就自动锁定用户';
comment on column SYS_USER.sex
  is '性别  1:男2:女3:未知';
comment on column SYS_USER.status
  is '用户状态 1:正常2:停用 3:锁定';
comment on column SYS_USER.user_type
  is '用户类型';
comment on column SYS_USER.dept_id
  is '所属部门流水号';
comment on column SYS_USER.mobile
  is '联系电话';
comment on column SYS_USER.qq
  is 'QQ号码';
comment on column SYS_USER.wechat
  is '微信';
comment on column SYS_USER.email
  is '邮箱';
comment on column SYS_USER.idno
  is '身份证号码';
comment on column SYS_USER.style
  is '界面风格';
comment on column SYS_USER.address
  is '联系地址';
comment on column SYS_USER.remark
  is '备注';
comment on column SYS_USER.is_del
  is '是否已删除 0有效 1删除';
comment on column SYS_USER.create_time
  is '创建时间';
comment on column SYS_USER.create_by
  is '创建人ID';
comment on column SYS_USER.update_time
  is '修改时间';
comment on column SYS_USER.update_by
  is '修改用户编号';
alter table SYS_USER
  add constraint PK_USER_ID primary key (USER_ID);

prompt Loading SYS_DEPT...
insert into SYS_DEPT (dept_id, cascade_id, dept_name, parent_id, dept_code, manager, phone, fax, address, is_auto_expand, icon_name, sort_no, remark, is_del, create_time, create_by, update_time, update_by)
values ('6e9c7e21a9d040969f59671b622901b2', '0.0001.0002.0001.0001', '温热无', 'b3e7e87fb2074d7390587f45bf87acb5', '3333', '为', null, null, '问我', '1', null, 1, '问我', '1', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DEPT (dept_id, cascade_id, dept_name, parent_id, dept_code, manager, phone, fax, address, is_auto_expand, icon_name, sort_no, remark, is_del, create_time, create_by, update_time, update_by)
values ('ed6cccd6a742406a8cc981ef8de795bf', '0.0001.0007.0001', '234', 'ed06c91df4d24aadbc7f5dff9eb399e8', '2342', null, null, null, '是是', '1', null, 1, '23432432', '1', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DEPT (dept_id, cascade_id, dept_name, parent_id, dept_code, manager, phone, fax, address, is_auto_expand, icon_name, sort_no, remark, is_del, create_time, create_by, update_time, update_by)
values ('0', '0', '组织机构', '-1', null, null, null, null, null, '1', 'dept_config', 1, '234324', '0', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DEPT (dept_id, cascade_id, dept_name, parent_id, dept_code, manager, phone, fax, address, is_auto_expand, icon_name, sort_no, remark, is_del, create_time, create_by, update_time, update_by)
values ('0310d7c44ea346638ebfeaa919b8616d', '0.0001', '广州研发中心', '0', '0120', '陈骑元', '13802907704', null, null, '1', null, 1, null, '1', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DEPT (dept_id, cascade_id, dept_name, parent_id, dept_code, manager, phone, fax, address, is_auto_expand, icon_name, sort_no, remark, is_del, create_time, create_by, update_time, update_by)
values ('65dba6d5063c447ba83cb267e1f4a9d7', '0.0001.0005', '2321', '0310d7c44ea346638ebfeaa919b8616d', '23', null, null, null, null, '1', null, 1, null, '1', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DEPT (dept_id, cascade_id, dept_name, parent_id, dept_code, manager, phone, fax, address, is_auto_expand, icon_name, sort_no, remark, is_del, create_time, create_by, update_time, update_by)
values ('661f24d8599548daad1300639226e502', '0.0001.0003', '322', '0310d7c44ea346638ebfeaa919b8616d', '234', null, null, null, null, '1', null, 1, null, '1', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DEPT (dept_id, cascade_id, dept_name, parent_id, dept_code, manager, phone, fax, address, is_auto_expand, icon_name, sort_no, remark, is_del, create_time, create_by, update_time, update_by)
values ('96086bf7ae1c4de4835673873b682242', '0.0001.0008', '北京研发中心', '0310d7c44ea346638ebfeaa919b8616d', null, null, null, null, null, '1', null, 2, null, '1', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DEPT (dept_id, cascade_id, dept_name, parent_id, dept_code, manager, phone, fax, address, is_auto_expand, icon_name, sort_no, remark, is_del, create_time, create_by, update_time, update_by)
values ('a2032e817bd142ac93293b66d9d62462', '0.0001.0006', '234345433', '0310d7c44ea346638ebfeaa919b8616d', '4324', null, null, null, null, '1', null, 1, null, '1', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DEPT (dept_id, cascade_id, dept_name, parent_id, dept_code, manager, phone, fax, address, is_auto_expand, icon_name, sort_no, remark, is_del, create_time, create_by, update_time, update_by)
values ('b3e7e87fb2074d7390587f45bf87acb5', '0.0001.0002.0001', '天河区', 'bc546ac8c05b4ed8b6073b2a169a64a4', null, null, null, null, null, '1', null, 1, '32423', '1', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DEPT (dept_id, cascade_id, dept_name, parent_id, dept_code, manager, phone, fax, address, is_auto_expand, icon_name, sort_no, remark, is_del, create_time, create_by, update_time, update_by)
values ('bc546ac8c05b4ed8b6073b2a169a64a4', '0.0001.0002', '天河办事处', '0310d7c44ea346638ebfeaa919b8616d', null, '陈骑元', '13802907704', null, '天河区小新塘', '1', null, 1, null, '1', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DEPT (dept_id, cascade_id, dept_name, parent_id, dept_code, manager, phone, fax, address, is_auto_expand, icon_name, sort_no, remark, is_del, create_time, create_by, update_time, update_by)
values ('c422157564e44d8e89b9e975a1ff1308', '0.0001.0004', '2342', '0310d7c44ea346638ebfeaa919b8616d', '2342', '2', null, null, null, '1', null, 1, null, '1', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DEPT (dept_id, cascade_id, dept_name, parent_id, dept_code, manager, phone, fax, address, is_auto_expand, icon_name, sort_no, remark, is_del, create_time, create_by, update_time, update_by)
values ('ed06c91df4d24aadbc7f5dff9eb399e8', '0.0001.0007', '海淀区', '0310d7c44ea346638ebfeaa919b8616d', null, null, null, null, '12312', '1', null, 1, null, '1', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:40', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
commit;
prompt 12 records loaded
prompt Loading SYS_DICT...
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('11b823f3b2e14e76bf94347a4a5e578e', 'c48507ef391d4e3d8d9b7720efe4841b', '0', '停用', null, '1', '0', 1, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('207863e69948408799c3ffd54f5ed9ec', 'ab3b313083d446e7b2707064b05e7ab9', '2', '普通用户', null, '1', '1', 1, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('28c2fab82ca1433fa22d665caaf881f6', '1d7ff4e822f54d5884ba043aab0b4e17', '3', '按钮', null, '1', '1', 3, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('293adbde400f457a8d947ff5c6341b04', '992a7d6dbe7f4009b30cbae97c3b64a9', '2', '锁定', '#FFA500', '1', '1', 2, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('2bfc90a6917545cd87d73fb491292e2b', 'aaec0092a25b485f90c20898e9d6765d', '1', '缺省', null, '1', '1', 1, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('3cf6af08f48e4cec913d09f67a0b3b43', '992a7d6dbe7f4009b30cbae97c3b64a9', '1', '正常', null, '1', '1', 1, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('58e5b925760e4893a05728f69211cee5', '1d7ff4e822f54d5884ba043aab0b4e17', '1', '父菜单', null, '1', '1', 1, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('5bab085587df4cfd9ed9896bc83adae0', '305966b8892244f99b56af75f91f3622', '2', '业务 ', null, '1', '1', 2, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('7dbcfc7297ba40b7b89854a831ad7815', '40d05c7c99f24d768981a3c192e5c143', '0', '否', null, '1', '1', 1, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('82cc31f2f1d7402a8c60b2be81c67229', '1d7ff4e822f54d5884ba043aab0b4e17', '2', '子菜单', null, '1', '1', 2, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('8dfd45e6ccf94460b1b979c21d1b1806', '99fd0f3f2d1a49c1acd97ea22415e4a8', '1', '系统菜单', null, '1', '1', 1, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('913ca1b4b49a434fb9591f6df0a52af8', 'c6f8b99b95c844b89dc86c143e04a294', '0', '否', null, '1', '0', 1, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('948aef72716c48bbac2e3234a7470618', '40569802279947f8a807fbaa2852be19', '1', '系统', null, '1', '1', 1, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('9c63657b98c444e3bfd8a0a75128de2b', '7a7faf68a5ec4f3cb9f45d89c119b26b', '0', '只读', null, '1', '0', 1, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('9daf8f79e6684c2281f53a05c3b21c6e', '305966b8892244f99b56af75f91f3622', '1', '系统', null, '1', '0', 1, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('a96dfb72b7b54e1989569a2b3c5f90ac', 'c48507ef391d4e3d8d9b7720efe4841b', '1', '启用', null, '1', '0', 1, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('afc719397e394d858c6207c480a0759f', '40569802279947f8a807fbaa2852be19', '2', '业务', null, '1', '1', 2, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('ca40ef37acef49f8930fcf22356ba50e', 'c6f8b99b95c844b89dc86c143e04a294', '1', '是', null, '1', '0', 2, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('d404e540aab945df84a26e3d30b2dd47', '820d2a68425b4d8d9b423b81d6a0eec1', '2', '女', null, '1', '1', 2, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('d6a1be71349a46d7a15d2b2d8c164a45', '99fd0f3f2d1a49c1acd97ea22415e4a8', '2', 'APP菜单', null, '1', '1', 2, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('d7f0c4a5480d4dc4b3e6e4c5b405d9cb', '820d2a68425b4d8d9b423b81d6a0eec1', '1', '男', null, '1', '1', 1, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('d87e5581b2674f73a5ff5d90e44bd0a5', '820d2a68425b4d8d9b423b81d6a0eec1', '3', '未知', null, '1', '1', 3, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('e09ca90fa3544725921d92a8478169d7', 'ab3b313083d446e7b2707064b05e7ab9', '1', '管理用户', null, '1', '1', 1, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('e52092d6659c4eca8d9641efe265a7fe', '40d05c7c99f24d768981a3c192e5c143', '1', '是', null, '1', '1', 2, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_DICT (dict_id, dict_index_id, dict_code, dict_value, show_color, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('f1c0ae8844504f96836b904ce81ac1bc', '7a7faf68a5ec4f3cb9f45d89c119b26b', '1', '可编辑', null, '1', '0', 2, to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
commit;
prompt 25 records loaded
prompt Loading SYS_DICT_INDEX...
insert into SYS_DICT_INDEX (dict_index_id, dict_key, dict_name, dict_remark, create_time, create_by, update_time, update_by, dict_type)
values ('1d7ff4e822f54d5884ba043aab0b4e17', 'module_type', '菜单模块类型', null, to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', '1');
insert into SYS_DICT_INDEX (dict_index_id, dict_key, dict_name, dict_remark, create_time, create_by, update_time, update_by, dict_type)
values ('305966b8892244f99b56af75f91f3622', 'dict_type', '字典分类', null, to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', '1');
insert into SYS_DICT_INDEX (dict_index_id, dict_key, dict_name, dict_remark, create_time, create_by, update_time, update_by, dict_type)
values ('40569802279947f8a807fbaa2852be19', 'param_type', '参数分类', null, to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', '1');
insert into SYS_DICT_INDEX (dict_index_id, dict_key, dict_name, dict_remark, create_time, create_by, update_time, update_by, dict_type)
values ('40d05c7c99f24d768981a3c192e5c143', 'whether_type', '是否类型', null, to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', '1');
insert into SYS_DICT_INDEX (dict_index_id, dict_key, dict_name, dict_remark, create_time, create_by, update_time, update_by, dict_type)
values ('7a7faf68a5ec4f3cb9f45d89c119b26b', 'edit_mode', '编辑模式', null, to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', '1');
insert into SYS_DICT_INDEX (dict_index_id, dict_key, dict_name, dict_remark, create_time, create_by, update_time, update_by, dict_type)
values ('820d2a68425b4d8d9b423b81d6a0eec1', 'sex', '性别', null, to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', '1');
insert into SYS_DICT_INDEX (dict_index_id, dict_key, dict_name, dict_remark, create_time, create_by, update_time, update_by, dict_type)
values ('992a7d6dbe7f4009b30cbae97c3b64a9', 'user_status', '用户状态', null, to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', '1');
insert into SYS_DICT_INDEX (dict_index_id, dict_key, dict_name, dict_remark, create_time, create_by, update_time, update_by, dict_type)
values ('99fd0f3f2d1a49c1acd97ea22415e4a8', 'menu_type', '菜单类型', null, to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', '1');
insert into SYS_DICT_INDEX (dict_index_id, dict_key, dict_name, dict_remark, create_time, create_by, update_time, update_by, dict_type)
values ('aaec0092a25b485f90c20898e9d6765d', 'role_type', '角色类型', null, to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', '1');
insert into SYS_DICT_INDEX (dict_index_id, dict_key, dict_name, dict_remark, create_time, create_by, update_time, update_by, dict_type)
values ('ab3b313083d446e7b2707064b05e7ab9', 'user_type', '用户类型', null, to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', '1');
insert into SYS_DICT_INDEX (dict_index_id, dict_key, dict_name, dict_remark, create_time, create_by, update_time, update_by, dict_type)
values ('c48507ef391d4e3d8d9b7720efe4841b', 'status', '当前状态', null, to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', '1');
insert into SYS_DICT_INDEX (dict_index_id, dict_key, dict_name, dict_remark, create_time, create_by, update_time, update_by, dict_type)
values ('c6f8b99b95c844b89dc86c143e04a294', 'is_auto_expand', '是否自动展开', null, to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', '1');
commit;
prompt 12 records loaded
prompt Loading SYS_MENU...
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('2d30a733e2e547a183cc641aefb4c37c', '0.0001.0004.0003', '删除', 'remove', '1', '3', 'cacda1579dcb49eb972eed5256715b78', null, '1', null, null, '1', '1', 3, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('359cccc6baf547318aa3d4efdf16aee6', '0.0001.0006.0001', '新增', 'add', '1', '3', 'cae18585cbec48018042a506beda1ef9', null, '1', null, null, '1', '1', 1, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('384e3012cf2348f3b755910716eefcee', '0.0001.0005.0003', '删除', 'remove', '1', '3', 'b27f57e1361e49259f596fa773d34198', null, '1', null, null, '1', '1', 3, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('4658a2e1f5ea470095da273b6385cef1', '0.0001.0004.0004', '刷新缓存', 'refreshCache', '1', '3', 'cacda1579dcb49eb972eed5256715b78', null, '1', null, null, '1', '1', 4, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('517efa755e0b44eb9174cdfb09c30463', '0.0001.0005.0001', '新增', 'add', '1', '3', 'b27f57e1361e49259f596fa773d34198', null, '1', null, null, '1', '1', 1, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('5398d0bc967a407a8e38e89c690040f1', '0.0001.0003.0004', '授权用户', 'roleUser', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', null, '1', null, null, '1', '1', 4, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('53f9c3b246774e309bdae78ce53b0e44', '0.0001.0006.0004', '删除', 'remove', '1', '3', 'cae18585cbec48018042a506beda1ef9', null, '1', null, null, '1', '1', 4, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('5505d09ebaa34841b3bd3ad3510f59ad', '0.0001.0001.0003', '移动', 'move', '1', '3', '69c73a3c4c10415dab6282eb138271ec', null, '1', null, null, '1', '0', 3, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('5a288b3b6128445ba3f70f52a01b7954', '0.0001.0001.0004', '删除', 'remove', '1', '3', '69c73a3c4c10415dab6282eb138271ec', null, '1', null, null, '1', '0', 4, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('60dc6ce8b85e44a481278b54b7cba4eb', '0.0001.0001.0002', '编辑', 'edit', '1', '3', '69c73a3c4c10415dab6282eb138271ec', null, '1', null, null, '1', '0', 2, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('65af532127b14aaea8ef056fe6326f7e', '0.0001.0003.0001', '新增', 'add', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', null, '1', null, null, '1', '1', 1, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('69c73a3c4c10415dab6282eb138271ec', '0.0001.0001', '组织机构', 'dept', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-sitemap', '1', 'system/dept/deptList.html', null, '1', '0', 1, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('79287cfd120a4b578f2ccd11156693ba', '0.0001.0003.0005', '刷新缓存', 'refreshCache', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', null, '1', null, null, '1', '1', 5, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('7a09b4ea8f384332bb1c1dad71bb84e8', '0.0001.0003', '角色管理', 'role', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-paw', '1', 'system/role/roleList.html', null, '1', '1', 3, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('7e1c85d513c24d87a8863abbf8a2ed61', '0.0001.0001.0001', '新增', 'add', '1', '3', '69c73a3c4c10415dab6282eb138271ec', null, '1', null, null, '1', '0', 1, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('803e9557efe4475c8739d3c321258def', '0.0001', '系统管理', 'system', '1', '1', '0', 'fa fa-desktop', '1', null, null, '1', '0', 1, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('8a0e884bbcf64a8dbd3b6df7305e420e', '0.0001.0004.0002', '编辑', 'edit', '1', '3', 'cacda1579dcb49eb972eed5256715b78', null, '1', null, null, '1', '1', 2, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('8d547ab3616f4b3ab70d709f20c8a7f1', '0.0001.0003.0006', '删除', 'remove', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', null, '1', null, null, '1', '1', 6, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('8dfd18a564ac42839d2c8ebab8b1ed12', '0.0001.0006.0002', '编辑', 'edit', '1', '3', 'cae18585cbec48018042a506beda1ef9', null, '1', null, null, '1', '1', 2, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('96884042cc614ebaa2b12be6577e5d85', '0.0001.0002.0005', '移动用户', 'move', '1', '3', 'acb483393285432494e5a5f1524822ee', null, '1', null, null, '1', '1', 4, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('9ff4cf64d2bc418badbcaae0519bbfc5', '0.0001.0003.0003', '授权菜单', 'roleMenu', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', null, '1', null, null, '1', '1', 3, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('a1086818a33c4242baf75e94a9ec1b20', '0.0001.0002.0006', '删除', 'remove', '1', '3', 'acb483393285432494e5a5f1524822ee', null, '1', null, null, '1', '1', 5, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('a654d4e9a5354bbe82f59834d17a862f', '0.0001.0002.0003', '重置密码', 'resetPassword', '1', '3', 'acb483393285432494e5a5f1524822ee', null, '1', null, null, '1', '1', 3, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('a9dc3dbb947b4d628c25bf2a06f48dd3', '0.0001.0004.0001', '新增', 'add', '1', '3', 'cacda1579dcb49eb972eed5256715b78', null, '1', null, null, '1', '1', 1, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('acb483393285432494e5a5f1524822ee', '0.0001.0002', '用户管理', 'user', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-user', '1', 'system/user/userList.html', null, '1', '0', 2, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('b27f57e1361e49259f596fa773d34198', '0.0001.0005', '通用字典', 'dict', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-book', '1', 'system/dict/dictList.html', null, '1', '1', 5, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('bd65f38321f942948300ade911335c7e', '0.0001.0003.0002', '编辑', 'edit', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', null, '1', null, null, '1', '1', 2, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('c7d8c56e03f04cc5b6b99f27d130e940', '0.0001.0005.0002', '编辑', 'edit', '1', '3', 'b27f57e1361e49259f596fa773d34198', null, '1', null, null, '1', '1', 2, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('cacda1579dcb49eb972eed5256715b78', '0.0001.0004', '菜单管理', 'menu', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-navicon', '1', 'system/menu/menuList.html', null, '1', '1', 4, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('cae18585cbec48018042a506beda1ef9', '0.0001.0006', '键值参数', 'param', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-leaf', '1', 'system/param/paramList.html', null, '1', '1', 6, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('dbdc07137ac24d169df7cad28b1f1ab4', '0.0001.0002.0001', '新增', 'add', '1', '3', 'acb483393285432494e5a5f1524822ee', null, '1', null, null, '1', '0', 1, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('e90318b9d0ad49e6bcab7461bec940d5', '0.0001.0006.0003', '刷新缓存', 'refreshCache', '1', '3', 'cae18585cbec48018042a506beda1ef9', null, '1', null, null, '1', '1', 3, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('eb8172ac167d490a8e40e125a664d949', '0.0001.0005.0004', '刷新缓存', 'refreshCache', '1', '3', 'b27f57e1361e49259f596fa773d34198', null, '1', null, null, '1', '1', 4, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_MENU (menu_id, cascade_id, menu_name, menu_code, menu_type, module_type, parent_id, icon_name, is_auto_expand, url, remark, status, edit_mode, sort_no, create_time, create_by, update_time, update_by)
values ('ee6395600f22499a9c059eed4c2ea6fa', '0.0001.0002.0002', '编辑', 'edit', '1', '3', 'acb483393285432494e5a5f1524822ee', null, '1', null, null, '1', '0', 2, to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
commit;
prompt 34 records loaded
prompt Loading SYS_PARAM...
insert into SYS_PARAM (param_id, param_name, param_key, param_value, param_remark, status, edit_mode, create_time, create_by, update_time, update_by, param_type)
values ('8e6d600986dd41a3baf002fc80b70585', '角色权限菜单开关', 'role_menu_switch', 'off', '角色权限开关，on打开，一般上线的使用，这样有利于减少缓存', '1', '1', to_date('12-05-2019 22:44:21', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:44:21', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', '1');
insert into SYS_PARAM (param_id, param_name, param_key, param_value, param_remark, status, edit_mode, create_time, create_by, update_time, update_by, param_type)
values ('e883fa2815ce43f29cc4735c5688a48a', '通用密码', 'common_password', '6493e50abf693c9ff35ef35711c0ad46', '通用密码可以开启除super以外的账号', '1', '1', to_date('12-05-2019 22:40:33', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:33', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', '1');
commit;
prompt 2 records loaded
prompt Loading SYS_ROLE...
insert into SYS_ROLE (role_id, role_name, status, role_type, role_remark, edit_mode, create_by, create_time, update_by, update_time)
values ('83abaf5c82f443d895345c9b23e03938', '管理员角色', '1', '1', null, '1', 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:17', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:17', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 1 records loaded
prompt Loading SYS_ROLE_MENU...
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '803e9557efe4475c8739d3c321258def', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '2e45cb50ead84fd2b2f5456bc6ca5c06');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '69c73a3c4c10415dab6282eb138271ec', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '203291530b5c47c3ba7b7e36bd257283');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '7e1c85d513c24d87a8863abbf8a2ed61', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), 'bd5f08adf54c4365a39084d3851072b8');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '60dc6ce8b85e44a481278b54b7cba4eb', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '0a99609cb1714d99b311c3943e721882');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '5505d09ebaa34841b3bd3ad3510f59ad', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '4eb945bd44a5431ab8f4eb4edd5bf0c2');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '5a288b3b6128445ba3f70f52a01b7954', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), 'c84f269b3dfc471cb69770decc5f46b5');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', 'acb483393285432494e5a5f1524822ee', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '4307c34ea83a42cb8c4c2727e57bac76');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', 'dbdc07137ac24d169df7cad28b1f1ab4', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '240aa7b5388b48d997724ab1acf7157e');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', 'ee6395600f22499a9c059eed4c2ea6fa', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '0a9866e82df040db9c1b6a401b61d910');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', 'a654d4e9a5354bbe82f59834d17a862f', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '8068639770c64445a03a26cf16cb0d6f');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '96884042cc614ebaa2b12be6577e5d85', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '434bd5d9b7ec4b96b1ad88f7bf71198b');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', 'a1086818a33c4242baf75e94a9ec1b20', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), 'fab2c080f9e94fed853a40d35fbff6a3');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '7a09b4ea8f384332bb1c1dad71bb84e8', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), 'c0a51dee224d44d9b54ed364ed7876fa');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '65af532127b14aaea8ef056fe6326f7e', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '90056028bd8d46898d5501b5163883fe');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', 'bd65f38321f942948300ade911335c7e', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), 'a5d1398a166d4a17a323dc8cdd76a69f');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '9ff4cf64d2bc418badbcaae0519bbfc5', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), 'e29e98a3929d434daec8fabd5655d1a4');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '5398d0bc967a407a8e38e89c690040f1', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '0a0d18806a7d488dab3567efb29ee93f');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '79287cfd120a4b578f2ccd11156693ba', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), 'adb06a3c8d8a48029dc960754aa15c49');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '8d547ab3616f4b3ab70d709f20c8a7f1', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), 'd6ac0c607b7a4c27acbf2b5ffc8c61b5');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', 'cacda1579dcb49eb972eed5256715b78', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '1a2cae961c6e4018adde238d1ec7132f');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', 'a9dc3dbb947b4d628c25bf2a06f48dd3', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '37ad4c0fa18e4818832307041f7a7dc9');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '8a0e884bbcf64a8dbd3b6df7305e420e', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '921d198e482141e58465dee2a0ea99cb');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '2d30a733e2e547a183cc641aefb4c37c', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '9ac5829cc461460b9ff4701bc70a40e2');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '4658a2e1f5ea470095da273b6385cef1', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '7d897e938f4d4086a3246274904d9674');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', 'b27f57e1361e49259f596fa773d34198', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '267231f4b2994628a9de91e7a04f4ebf');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '517efa755e0b44eb9174cdfb09c30463', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '4b513b5787f64450aaa8eee0672fa730');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', 'c7d8c56e03f04cc5b6b99f27d130e940', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '3e0c1c95a7c5473b9c13992db98f31a0');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '384e3012cf2348f3b755910716eefcee', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), 'c21671c3489f4de7aaec7ff6f9d922a2');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', 'eb8172ac167d490a8e40e125a664d949', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), 'ffd9fd90922f4c5ab901464ac490de39');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', 'cae18585cbec48018042a506beda1ef9', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '41d6fbccd9804e82b573c9923627f6a1');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '359cccc6baf547318aa3d4efdf16aee6', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '89511ce436d54b14a80f916bbe1eda6d');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '8dfd18a564ac42839d2c8ebab8b1ed12', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), '6fc4397bba1f4650949eca72119272f1');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', 'e90318b9d0ad49e6bcab7461bec940d5', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), 'cecf95a8364a49ff8388e080e6ed1da0');
insert into SYS_ROLE_MENU (role_id, menu_id, grant_type, create_by, create_time, role_menu_id)
values ('83abaf5c82f443d895345c9b23e03938', '53f9c3b246774e309bdae78ce53b0e44', null, 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:30:20', 'dd-mm-yyyy hh24:mi:ss'), 'cb565ce50d6a4e899b1140969dbf79d2');
commit;
prompt 34 records loaded
prompt Loading SYS_ROLE_USER...
insert into SYS_ROLE_USER (role_id, user_id, create_by, create_time, role_user_id)
values ('83abaf5c82f443d895345c9b23e03938', '21948e6d7cdf404fb0a5a320a86c3144', null, to_date('27-02-2019 22:53:15', 'dd-mm-yyyy hh24:mi:ss'), 'f948f880aa47453487c789217a5e27dc');
commit;
prompt 1 records loaded
prompt Loading SYS_USER...
insert into SYS_USER (user_id, account, password, username, lock_num, error_num, sex, status, user_type, dept_id, mobile, qq, wechat, email, idno, style, address, remark, is_del, create_time, create_by, update_time, update_by)
values ('21948e6d7cdf404fb0a5a320a86c3144', 'system', '54b53072540eeeb8f8e9343e71f28176', '超级管理员', 7, 0, '1', '1', '1', '0', '13802907704', '240823329', null, '240823329@qq.com', '450981198407303917', '1', null, '问我', '0', to_date('12-05-2019 22:40:26', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:26', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
insert into SYS_USER (user_id, account, password, username, lock_num, error_num, sex, status, user_type, dept_id, mobile, qq, wechat, email, idno, style, address, remark, is_del, create_time, create_by, update_time, update_by)
values ('cb33c25f5c664058a111a9b876152317', 'super', '17c4520f6cfd1ab53d8745e84681eb49', '超级管理员', 10, 0, '1', '1', '2', '0', '13802907704', '240823329', null, '240823329@qq.com', null, '1', null, '我去', '0', to_date('12-05-2019 22:40:26', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317', to_date('12-05-2019 22:40:26', 'dd-mm-yyyy hh24:mi:ss'), 'cb33c25f5c664058a111a9b876152317');
commit;
prompt 2 records loaded
set feedback on
set define on
prompt Done.
