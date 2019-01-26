-- Project Name : houshowing
-- Date/Time    : 2019/1/20 15:06:21
-- Author       : qiming
-- RDBMS Type   : MySQL
-- Application  : A5:SQL Mk-2

/*
 BackupToTempTable, RestoreFromTempTable directive is attached.
 This preserve data after drop table and create table.
 This function temporarily creates temporary table like $$TableName.
*/

-- 城市MASET
--* BackupToTempTable
drop table if exists CITY_MASTER cascade;

--* RestoreFromTempTable
create table CITY_MASTER (
  CITY_UUID VARCHAR(32) not null comment '城市UUID'
  , CITY VARCHAR(16) comment '城市'
  , INSERT_DATETIME DATETIME comment '插入时间'
  , INSERT_USER VARCHAR(32) comment '插入用户'
  , UPDATE_DATETIME DATETIME comment '更新时间'
  , UPDATE_USER VARCHAR(32) comment '更新用户'
  , CANCEL_FLG INT comment '无效flag'
  , constraint CITY_MASTER_PKC primary key (CITY_UUID)
) comment '城市MASET' ;

-- 行政区MASTER
--* BackupToTempTable
drop table if exists DISTRICT_MASTER cascade;

--* RestoreFromTempTable
create table DISTRICT_MASTER (
  DISTRICT_UUID VARCHAR(32) not null comment '行政区UUID'
  , DISTRICT VARCHAR(16) comment '行政区'
  , INSERT_DATETIME DATETIME comment '插入时间'
  , INSERT_USER VARCHAR(32) comment '插入用户'
  , UPDATE_DATETIME DATETIME comment '更新时间'
  , UPDATE_USER VARCHAR(32) comment '更新用户'
  , CANCEL_FLG INT comment '无效flag'
  , constraint DISTRICT_MASTER_PKC primary key (DISTRICT_UUID)
) comment '行政区MASTER' ;

-- 装修情况MASTER
--* BackupToTempTable
drop table if exists DECORATION_MASTER cascade;

--* RestoreFromTempTable
create table DECORATION_MASTER (
  DECORATION_UUID VARCHAR(32) not null comment '装修情况UUID'
  , DECORATION VARCHAR(16) comment '装修情况'
  , INSERT_DATETIME DATETIME comment '插入时间'
  , INSERT_USER VARCHAR(32) comment '插入用户'
  , UPDATE_DATETIME DATETIME comment '更新时间'
  , UPDATE_USER VARCHAR(32) comment '更新用户'
  , CANCEL_FLG INT comment '无效flag'
  , constraint DECORATION_MASTER_PKC primary key (DECORATION_UUID)
) comment '装修情况MASTER' ;

-- 房屋朝向MASTER
--* BackupToTempTable
drop table if exists HOUSE_ORIENTATION_MASTER cascade;

--* RestoreFromTempTable
create table HOUSE_ORIENTATION_MASTER (
  HOUSE_ORIENTATION_UUID VARCHAR(32) not null comment 'UUID'
  , HOUSE_ORIENTATION VARCHAR(32) not null comment '房屋朝向'
  , INSERT_DATETIME DATETIME comment '插入时间'
  , INSERT_USER VARCHAR(32) comment '插入用户'
  , UPDATE_DATETIME DATETIME comment '更新时间'
  , UPDATE_USER VARCHAR(32) comment '更新用户'
  , CANCEL_FLG INT comment '无效flag'
  , constraint HOUSE_ORIENTATION_MASTER_PKC primary key (HOUSE_ORIENTATION_UUID)
) comment '房屋朝向MASTER' ;

-- 房产信息
--* BackupToTempTable
drop table if exists HOUSE_INFO cascade;

--* RestoreFromTempTable
create table HOUSE_INFO (
  UUID VARCHAR(32) not null comment 'UUID'
  , DATE DATE not null comment '数据日期'
  , HOUSE_ORIENTATION_UUID VARCHAR(32) not null comment '房屋朝向UUID'
  , RESIDENTIAL_AREAS_NAME VARCHAR(32) comment '小区名字'
  , HOUSE_TYPE DECIMAL(1,1) comment '户型'
  , UNIT_PRICE DECIMAL comment '单价'
  , AREA DECIMAL comment '房屋面积'
  , TOTAL_PRICE DECIMAL comment '总价'
  , DECORATION_UUID VARCHAR(32) not null comment '装修情况'
  , DISTRICT_UUID VARCHAR(32) not null comment '行政区'
  , CITY_UUID VARCHAR(32) not null comment '城市'
  , URL VARCHAR(64) comment 'url'
  , LATITUDE DECIMAL(10,7) comment '纬度'
  , LONGITUDE DECIMAL(10,7) comment '经度'
  , IMAGE_SRC VARCHAR(64) comment '图片路径'
  , DATASOURCE_DOMAIN VARCHAR(64) comment '数据来源网站'
  , INSERT_DATETIME DATETIME comment '插入时间'
  , INSERT_USER VARCHAR(32) comment '插入用户'
  , UPDATE_DATETIME DATETIME comment '更新时间'
  , UPDATE_USER VARCHAR(32) comment '更新用户'
  , CANCEL_FLG INT comment '无效flag'
  , constraint HOUSE_INFO_PKC primary key (UUID,DATE)
) comment '房产信息' ;

alter table HOUSE_INFO
  add constraint HOUSE_INFO_FK1 foreign key (CITY_UUID) references CITY_MASTER(CITY_UUID)
  on delete cascade
  on update cascade;

alter table HOUSE_INFO
  add constraint HOUSE_INFO_FK2 foreign key (DISTRICT_UUID) references DISTRICT_MASTER(DISTRICT_UUID)
  on delete cascade
  on update cascade;

alter table HOUSE_INFO
  add constraint HOUSE_INFO_FK3 foreign key (DECORATION_UUID) references DECORATION_MASTER(DECORATION_UUID)
  on delete cascade
  on update cascade;

alter table HOUSE_INFO
  add constraint HOUSE_INFO_FK4 foreign key (HOUSE_ORIENTATION_UUID) references HOUSE_ORIENTATION_MASTER(HOUSE_ORIENTATION_UUID)
  on delete cascade
  on update cascade;
