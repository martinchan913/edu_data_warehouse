drop database if exists edu_ods;
create database if not exists edu_ods;
--todo  ODS层表:
create table if not exists edu_ods.web_chat_ems(

    id       INT            comment '主键'                  ,
    create_date_time              STRING         comment '数据创建时间'          ,
    session_id                    STRING         comment '七陌SESsionId'         ,
    sid                           STRING         comment '访客id'                ,
    create_time                   STRING         comment '会话创建时间'          ,
    seo_source                    STRING         comment '搜索来源'              ,
    seo_keywords                  STRING         comment '关键字'                ,
    ip                            STRING         comment 'IP地址'                ,
    AREA                          STRING         comment '地域'                  ,
    country                       STRING         comment '所在国家'              ,
    province                      STRING         comment '省'                    ,
    city                          STRING         comment '城市'                  ,
    origin_channel                STRING         comment '投放渠道'              ,
    `user`                          STRING         comment '所属坐席'              ,
    manual_time                   STRING         comment '人工开始时间'          ,
    begin_time                    STRING         comment '坐席领取时间'          ,
    end_time                      STRING         comment '会话结束时间'          ,
    last_customer_msg_time_stamp  STRING         comment '客户最后一条消息的时间',
    last_agent_msg_time_stamp     STRING         comment '坐席最后一下回复的时间',
    reply_msg_count               INT            comment '客服回复消息数'        ,
    msg_count                     INT            comment '客户发送消息数'        ,
    browser_name                  STRING         comment '浏览器名称'            ,
    os_info                       STRING         comment '系统名称'
)
partitioned by(dt string)
row format delimited fields terminated by '\t'
stored as orc
location 'hdfs://hadoop01:8020/user/hive/warehouse/edu_ods.db/web_chat_ems'
TBLPROPERTIES('orc.compress'='SNAPPY' );


create table if not exists edu_ods.web_chat_text_ems(
    id INT comment'主键',
    referrer string comment'上级来源页面',
    from_url string comment'会话来源页面',
    landing_page_url string comment'访客着陆页面',
    url_title string comment'咨询页面title',
    platform_description string comment'客户平台信息',
    other_params string comment'扩展字段中数据',
    history string comment'历史访问记录'
)
partitioned by(dt string)
row format delimited fields terminated by '\t'
stored as orc
location 'hdfs://hadoop01:8020/user/hive/warehouse/edu_ods.db/web_chat_text_ems'
TBLPROPERTIES('orc.compress'='SNAPPY' );
--todo DWD层建表操作
drop database if exists edu_dwd;
create database if not exists edu_dwd;

-- 2) 创建表
-- 1) 创建DWD	层库:
CREATE DATABASE IF NOT EXISTS `edu_dwd`;
use edu_dwd;
-- 2) 构建DWD层表:
-- 写入时压缩生效
set hive.exec.orc.compression.strategy=COMPRESSION;
create table if not exists edu_dwd.visit_consult_dwd
(
    session_id           STRING comment "会话系统id",
    sid                  STRING comment "访客id",
    create_time          bigint comment "会话创建时间",
    seo_source           STRING comment "搜索来源",
    ip                   STRING comment "IP地址",
    area                 STRING comment "地域",
    country              STRING comment "国家",
    province             STRING comment "省",
    city                 STRING comment "市",
    msg_count            int comment "客户发送消息数",
    origin_channel       STRING COMMENT "来源渠道",
    referrer             STRING comment "上级来源页面",
    from_url             STRING comment "会话来源页面",
    landing_page_url     STRING comment "访客着陆页面",
    url_title            STRING comment "咨询页面title",
    platform_description STRING comment "客户平台信息",
    other_params         STRING comment "扩展字段中数据",
    history              STRING comment "历史访问记录",
    hourinfo             string comment "小时"
)
comment"访问咨询DWD表"
partitioned by(yearinfo String,quarterinfo string, monthinfo String, dayinfo string)
row format delimited fields terminated by "\t"
stored as orc
location"/user/hive/warehouse/edu_dwd.db/visit_consult_dwd"
tblproperties ("orc.compress"="SNAPPY");
--todo DWS层:
-- 创建库
-- 1) 创建DWS层的库

CREATE DATABASE IF NOT EXISTS `edu_dws`;

use edu_dws;

--2) 构建DWS层表:

--写入时压缩生效

set hive.exec.orc.compression.strategy=COMPRESSION;

-- 访问量DWS层表:
drop table edu_dws.visit_dws;
CREATE TABLE IF NOT EXISTS edu_dws.visit_dws (

  sid_total INT COMMENT '根据sid去重求count',

  sessionid_total INT COMMENT '根据sessionid去重求count',

  ip_total INT COMMENT '根据IP去重求count',

  area STRING COMMENT '区域信息',

  seo_source STRING COMMENT '搜索来源',

  origin_channel STRING COMMENT '来源渠道',

  hourinfo STRING COMMENT '创建时间，统计至小时',

  time_str STRING COMMENT '时间明细',

  from_url STRING comment '会话来源页面',

  groupType STRING COMMENT '产品属性类型：1.地区；2.搜索来源；3.来源渠道；4.会话来源页面；5.总访问量',

  time_type STRING COMMENT '时间聚合类型：1、按小时聚合；2、按天聚合；3、按月聚合；4、按季度聚合；5、按年聚合；')

comment 'EMS访客日志dws表'

PARTITIONED BY(yearinfo STRING,quarterinfo STRING,monthinfo STRING,dayinfo STRING)

ROW FORMAT DELIMITED

FIELDS TERMINATED BY '\t'

stored as orc

location '/user/hive/warehouse/edu_dws.db/visit_dws'

TBLPROPERTIES ('orc.compress'='SNAPPY');
-- 咨询量DWS层表

CREATE TABLE IF NOT EXISTS edu_dws.consult_dws (

  sid_total INT COMMENT '根据sid去重求count',

  sessionid_total INT COMMENT '根据sessionid去重求count',

  ip_total INT COMMENT '根据IP去重求count',

  area STRING COMMENT '区域信息',

  origin_channel STRING COMMENT '来源渠道',

  hourinfo STRING COMMENT '创建时间，统计至小时',

  time_str STRING COMMENT '时间明细',

  groupType STRING COMMENT '产品属性类型：1.地区；2.来源渠道',

  time_type STRING COMMENT '时间聚合类型：1、按小时聚合；2、按天聚合；3、按月聚合；4、按季度聚合；5、按年聚合；'

)

COMMENT '咨询量DWS宽表'

PARTITIONED BY (yearinfo string,quarterinfo STRING, monthinfo STRING, dayinfo string)

ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'

STORED AS ORC

LOCATION '/user/hive/warehouse/edu_dws.db/consult_dws'

TBLPROPERTIES ('orc.compress'='SNAPPY');


