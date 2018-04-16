-----------------------------------------------------
-- Export file for user SIHIS                      --
-- Created by Administrator on 2018/4/16, 18:13:01 --
-----------------------------------------------------

spool sihis.log

prompt
prompt Creating table F_USER
prompt =====================
prompt
create table SIHIS.F_USER
(
  NAME     VARCHAR2(60) not null,
  PASSWORD VARCHAR2(60),
  IP       VARCHAR2(60),
  TIMES    NUMBER,
  ENDDATE  DATE,
  AKB021   VARCHAR2(100),
  TYPE     NUMBER,
  UFLAG    VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 192K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table SIHIS.F_USER
  is '用户信息';
comment on column SIHIS.F_USER.TYPE
  is '用户类型0为普通定点用户，1为管理员';
comment on column SIHIS.F_USER.UFLAG
  is '用户类别 1，医院 2，药店';
alter table SIHIS.F_USER
  add constraint PK_USER primary key (NAME)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table F_USER_LOG
prompt =========================
prompt
create table SIHIS.F_USER_LOG
(
  NAME VARCHAR2(60),
  IP   VARCHAR2(60),
  TIME DATE,
  ID   NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SIHIS.F_USER_LOG
  is '用户登录日志';
alter table SIHIS.F_USER_LOG
  add constraint PK_USER_LOG primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JINFO
prompt ====================
prompt
create table SIHIS.JINFO
(
  NAME        VARCHAR2(100),
  CORPORATION VARCHAR2(50),
  ADDRESS     VARCHAR2(200),
  POSTALCODE  VARCHAR2(20),
  TYPE        VARCHAR2(1),
  TEL         VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SIHIS.JINFO
  is '甲方信息维护表';
comment on column SIHIS.JINFO.NAME
  is '甲方名称';
comment on column SIHIS.JINFO.CORPORATION
  is '法人';
comment on column SIHIS.JINFO.ADDRESS
  is '地址';
comment on column SIHIS.JINFO.POSTALCODE
  is '邮编';
comment on column SIHIS.JINFO.TYPE
  is '1医院2药店';
comment on column SIHIS.JINFO.TEL
  is '多个联系电话请用逗号分割';

prompt
prompt Creating table KB01
prompt ===================
prompt
create table SIHIS.KB01
(
  AKB020   VARCHAR2(14) not null,
  AKB021   VARCHAR2(50),
  AKB025   VARCHAR2(50),
  AAE004   VARCHAR2(50),
  AAE005   VARCHAR2(50),
  AAE006   VARCHAR2(90),
  CKB162   VARCHAR2(20),
  FLAG     NUMBER,
  PROTOCOL VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SIHIS.KB01
  is '定点医疗机构信息';
comment on column SIHIS.KB01.AKB020
  is '定点医疗机构编码';
comment on column SIHIS.KB01.AKB021
  is '医疗服务机构名称';
comment on column SIHIS.KB01.AAE004
  is '法人';
comment on column SIHIS.KB01.AAE005
  is '联系电话';
comment on column SIHIS.KB01.AAE006
  is '地址';
comment on column SIHIS.KB01.CKB162
  is '邮编';
comment on column SIHIS.KB01.FLAG
  is '1医院2药店';
comment on column SIHIS.KB01.PROTOCOL
  is '协议项';
alter table SIHIS.KB01
  add constraint KB01_K primary key (AKB020)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PROTOCOL
prompt =======================
prompt
create table SIHIS.PROTOCOL
(
  AKB020          VARCHAR2(14),
  AKB021          VARCHAR2(50),
  WQ_AKB021       VARCHAR2(200),
  WQ_NAME         VARCHAR2(50),
  WQ_ADDRESS      VARCHAR2(200),
  WQ_POSTALCODE   VARCHAR2(20),
  WQ_TEL          VARCHAR2(50),
  WQ_IP           VARCHAR2(20),
  WQ_YEAR         VARCHAR2(4),
  WQ_TIME         VARCHAR2(30),
  TYPE            VARCHAR2(1),
  WQ_VALID        VARCHAR2(1),
  WQ_OPTIONS      VARCHAR2(200),
  WQ_JDATE        VARCHAR2(20),
  WQ_YDATE        VARCHAR2(20),
  WQ_JINSTITUTION VARCHAR2(50),
  WQ_JNAME        VARCHAR2(50),
  WQ_JADDRESS     VARCHAR2(200),
  WQ_JPOSTALCODE  VARCHAR2(20),
  WQ_JTEL         VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SIHIS.PROTOCOL
  is '医院或者药店签署协议';
comment on column SIHIS.PROTOCOL.AKB020
  is '药店或医院编码';
comment on column SIHIS.PROTOCOL.AKB021
  is '药店或医院名称';
comment on column SIHIS.PROTOCOL.WQ_AKB021
  is '签署单位名称';
comment on column SIHIS.PROTOCOL.WQ_NAME
  is '法人名称';
comment on column SIHIS.PROTOCOL.WQ_ADDRESS
  is '地址';
comment on column SIHIS.PROTOCOL.WQ_POSTALCODE
  is '邮编';
comment on column SIHIS.PROTOCOL.WQ_TEL
  is '联系电话';
comment on column SIHIS.PROTOCOL.WQ_IP
  is '客户IP地址';
comment on column SIHIS.PROTOCOL.WQ_YEAR
  is '网签年份';
comment on column SIHIS.PROTOCOL.WQ_TIME
  is '网签具体时间';
comment on column SIHIS.PROTOCOL.TYPE
  is '医院、药店';
comment on column SIHIS.PROTOCOL.WQ_VALID
  is '是否有效0无效1有效';
comment on column SIHIS.PROTOCOL.WQ_OPTIONS
  is '签署的选项，医院为20项内容，药店为xx项内容，存储为json格式';
comment on column SIHIS.PROTOCOL.WQ_JDATE
  is '网签甲方签约日期';
comment on column SIHIS.PROTOCOL.WQ_YDATE
  is '网签乙方签约日期';
comment on column SIHIS.PROTOCOL.WQ_JINSTITUTION
  is '甲方事业单位名称';
comment on column SIHIS.PROTOCOL.WQ_JNAME
  is '甲方法人名称';
comment on column SIHIS.PROTOCOL.WQ_JADDRESS
  is '甲方事业单位所在地址';
comment on column SIHIS.PROTOCOL.WQ_JPOSTALCODE
  is '甲方所在地邮政编码';
comment on column SIHIS.PROTOCOL.WQ_JTEL
  is '甲方联系方式';

prompt
prompt Creating table PROTOCOLUSER
prompt ===========================
prompt
create table SIHIS.PROTOCOLUSER
(
  AKB020 VARCHAR2(20),
  AKB021 VARCHAR2(200),
  AAC003 VARCHAR2(20),
  AAC002 VARCHAR2(20),
  AAC005 VARCHAR2(20),
  AAE036 VARCHAR2(20),
  YEAR   VARCHAR2(10),
  AAE314 VARCHAR2(3)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table SIHIS.PROTOCOLUSER
  is '协议签署人';
comment on column SIHIS.PROTOCOLUSER.AKB020
  is '医院或者药店编码';
comment on column SIHIS.PROTOCOLUSER.AKB021
  is '医院或者药店名称';
comment on column SIHIS.PROTOCOLUSER.AAC003
  is '签署人姓名';
comment on column SIHIS.PROTOCOLUSER.AAC002
  is '身份证号';
comment on column SIHIS.PROTOCOLUSER.AAC005
  is '联系电话';
comment on column SIHIS.PROTOCOLUSER.AAE036
  is '签订时间';
comment on column SIHIS.PROTOCOLUSER.YEAR
  is '签订年份';
comment on column SIHIS.PROTOCOLUSER.AAE314
  is '有效标志';

prompt
prompt Creating sequence SEQ_F_USERLOG
prompt ===============================
prompt
create sequence SIHIS.SEQ_F_USERLOG
minvalue 1
maxvalue 99999999999999999
start with 3381
increment by 1
cache 20;


spool off
