
create table scrm_bi.itcast_intention(
customer_total int comment '总意向量',
area varchar(100) ,
itcast_school_id int,
itcast_school_name varchar(100),
origin_type varchar(100),
itcast_subject_id int ,
itcast_subject_name varchar(100),
origin_type_stat int,
clue_state_stat int,
tdepart_id int,
tdepart_name varchar(100),
time_str varchar(100) comment 'yearinfo,monthinfo,dayinfo',
grouptype int comment '产品属性类别 1、总量 2、区域 3、校区，学科 4、来源渠道 5、咨询中心',
time_type int comment '时间维度 1、年 2、月 3、周 4、天 5、小时',
hourinfo varchar(100),
yearinfo varchar(100) comment '年',
monthinfo varchar(100) comment '月',
dayinfo varchar(100) comment '日'
)comment  '客户意向表';


/usr/bin/sqoop export "-Dorg.apache.sqoop.splitter.allow_text_splitter=true" \
--connect 'jdbc:mysql://hadoop01:3306/scrm_bi?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true' \
--username root \
--password 123456 \
--table itcast_intention \
--hcatalog-database itcast_dws \
--hcatalog-table dws_itcast_intention \
-m 1