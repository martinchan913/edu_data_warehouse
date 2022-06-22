select unix_timestamp('2022-06-16 00:00:00');--转换时间戳
select unix_timestamp('2022/06/16 03/04/05','yyyy/MM/dd hh/mm/ss');--格式转换

select
       substr('2022-06-16 00:00:00',1,4)as year,
       quarter('2022-06-16 00:00:00')as season,
       substr('2022-06-16 00:00:00',6,2)as month,
       substr('2022-06-16 00:00:00',9,2)as day,
       substr('2022-06-16 00:00:00',12,2)as hour;

--动态分区配置
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;
--hive压缩
set hive.exec.compress.intermediate=true;
set hive.exec.compress.output=true;
--写入时压缩生效
set hive.exec.dynamic.partition.mode=nonstrict;
--插入dwd
insert into table edu_consult_dwd.visit_consult_dwd partition (yearinfo,quarterinfo,monthinfo,dayinfo)
select
session_id,
sid,
unix_timestamp(create_time)create_time,
seo_source,
ip,
area,
country,
province,
city,
if(msg_count is null,0,msg_count) msg_count,
origin_channel,
referrer,
from_url,
landing_page_url,
url_title,
platform_description,
other_params,
history,
hour(create_time)hourinfo,
year(create_time)yearinfo,
quarter(create_time)quarterinfo,
month(create_time)monthinfo,
day(create_time)dayinfo
from edu_consult_ods.web_chat_ems t1
left join edu_consult_ods.web_chat_text_ems t2 on t1.id=t2.id;
