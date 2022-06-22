dws建表
CREATE TABLE `itcast_dws.dws_itcast_intention`(
customer_total int COMMENT '总意向量', 
area` string, 
itcast_school_id int, 
itcast_school_name` string, 
origin_type string, 
itcast_subject_id int, 
itcast_subject_name string, 
origin_type_stat int, 
clue_state_stat int, 
tdepart_id int, 
tdepart_name string, 
time_str string COMMENT 'yearinfo,monthinfo,dayinfo', 
grouptype int COMMENT '产品属性类别 1、总量 2、区域 3、校区，学科 4、来源渠道 5、咨询中心', 
time_type int COMMENT '时间维度 1、年 2、月 3、周 4、天 5、小时', 
hourinfo string)
COMMENT '客户意向dws'
PARTITIONED BY ( 
yearinfo` string, 
monthinfo` string
dayinfo` string)
row format delimited fields terminated by '\t'
stored as orc
location 'hdfs://hadoop01:8020/user/hive/warehouse/itcast_dws.db/dws_itcast_intention'
TBLPROPERTIES('orc.compress'='SNAPPY' );