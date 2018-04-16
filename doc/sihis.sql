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
  is '�û���Ϣ';
comment on column SIHIS.F_USER.TYPE
  is '�û�����0Ϊ��ͨ�����û���1Ϊ����Ա';
comment on column SIHIS.F_USER.UFLAG
  is '�û���� 1��ҽԺ 2��ҩ��';
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
  is '�û���¼��־';
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
  is '�׷���Ϣά����';
comment on column SIHIS.JINFO.NAME
  is '�׷�����';
comment on column SIHIS.JINFO.CORPORATION
  is '����';
comment on column SIHIS.JINFO.ADDRESS
  is '��ַ';
comment on column SIHIS.JINFO.POSTALCODE
  is '�ʱ�';
comment on column SIHIS.JINFO.TYPE
  is '1ҽԺ2ҩ��';
comment on column SIHIS.JINFO.TEL
  is '�����ϵ�绰���ö��ŷָ�';

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
  is '����ҽ�ƻ�����Ϣ';
comment on column SIHIS.KB01.AKB020
  is '����ҽ�ƻ�������';
comment on column SIHIS.KB01.AKB021
  is 'ҽ�Ʒ����������';
comment on column SIHIS.KB01.AAE004
  is '����';
comment on column SIHIS.KB01.AAE005
  is '��ϵ�绰';
comment on column SIHIS.KB01.AAE006
  is '��ַ';
comment on column SIHIS.KB01.CKB162
  is '�ʱ�';
comment on column SIHIS.KB01.FLAG
  is '1ҽԺ2ҩ��';
comment on column SIHIS.KB01.PROTOCOL
  is 'Э����';
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
  is 'ҽԺ����ҩ��ǩ��Э��';
comment on column SIHIS.PROTOCOL.AKB020
  is 'ҩ���ҽԺ����';
comment on column SIHIS.PROTOCOL.AKB021
  is 'ҩ���ҽԺ����';
comment on column SIHIS.PROTOCOL.WQ_AKB021
  is 'ǩ��λ����';
comment on column SIHIS.PROTOCOL.WQ_NAME
  is '��������';
comment on column SIHIS.PROTOCOL.WQ_ADDRESS
  is '��ַ';
comment on column SIHIS.PROTOCOL.WQ_POSTALCODE
  is '�ʱ�';
comment on column SIHIS.PROTOCOL.WQ_TEL
  is '��ϵ�绰';
comment on column SIHIS.PROTOCOL.WQ_IP
  is '�ͻ�IP��ַ';
comment on column SIHIS.PROTOCOL.WQ_YEAR
  is '��ǩ���';
comment on column SIHIS.PROTOCOL.WQ_TIME
  is '��ǩ����ʱ��';
comment on column SIHIS.PROTOCOL.TYPE
  is 'ҽԺ��ҩ��';
comment on column SIHIS.PROTOCOL.WQ_VALID
  is '�Ƿ���Ч0��Ч1��Ч';
comment on column SIHIS.PROTOCOL.WQ_OPTIONS
  is 'ǩ���ѡ�ҽԺΪ20�����ݣ�ҩ��Ϊxx�����ݣ��洢Ϊjson��ʽ';
comment on column SIHIS.PROTOCOL.WQ_JDATE
  is '��ǩ�׷�ǩԼ����';
comment on column SIHIS.PROTOCOL.WQ_YDATE
  is '��ǩ�ҷ�ǩԼ����';
comment on column SIHIS.PROTOCOL.WQ_JINSTITUTION
  is '�׷���ҵ��λ����';
comment on column SIHIS.PROTOCOL.WQ_JNAME
  is '�׷���������';
comment on column SIHIS.PROTOCOL.WQ_JADDRESS
  is '�׷���ҵ��λ���ڵ�ַ';
comment on column SIHIS.PROTOCOL.WQ_JPOSTALCODE
  is '�׷����ڵ���������';
comment on column SIHIS.PROTOCOL.WQ_JTEL
  is '�׷���ϵ��ʽ';

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
  is 'Э��ǩ����';
comment on column SIHIS.PROTOCOLUSER.AKB020
  is 'ҽԺ����ҩ�����';
comment on column SIHIS.PROTOCOLUSER.AKB021
  is 'ҽԺ����ҩ������';
comment on column SIHIS.PROTOCOLUSER.AAC003
  is 'ǩ��������';
comment on column SIHIS.PROTOCOLUSER.AAC002
  is '���֤��';
comment on column SIHIS.PROTOCOLUSER.AAC005
  is '��ϵ�绰';
comment on column SIHIS.PROTOCOLUSER.AAE036
  is 'ǩ��ʱ��';
comment on column SIHIS.PROTOCOLUSER.YEAR
  is 'ǩ�����';
comment on column SIHIS.PROTOCOLUSER.AAE314
  is '��Ч��־';

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
