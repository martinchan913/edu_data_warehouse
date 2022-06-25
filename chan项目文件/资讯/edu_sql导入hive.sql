select * from nev.web_chat_ems_2019_07 limit 100;
select * from nev.web_chat_text_ems_2019_07 limit 10;
#todo 导入chat——ems表
/usr/bin/sqoop import "-Dorg.apache.sqoop.splitter.allow_text_splitter=true" \
--connect 'jdbc:mysql://hadoop01:3306/nev?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true' \
--username root \
--password 123456 \
--query "select
id,
create_date_time,
session_id,
sid,
create_time,
seo_source,
seo_keywords,
ip,
area,
country,
province,
city,
origin_channel,
user,
manual_time,
begin_time,
end_time,
last_customer_msg_time_stamp,
last_agent_msg_time_stamp,
reply_msg_count,
msg_count,
browser_name,
os_info,
'2022-06-15' as dt from web_chat_ems_2019_07 where 1=1 and (create_time between '1970-01-01 00:00:00' and '2022-06-15 23:59:59') and  \$CONDITIONS" \
--hcatalog-database edu_consult_ods \
--hcatalog-table web_chat_ems \
-m 1

#todo 导入chat_text_ems表
/usr/bin/sqoop import "-Dorg.apache.sqoop.splitter.allow_text_splitter=true" \
--connect 'jdbc:mysql://hadoop01:3306/nev?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true' \
--username root \
--password 123456 \
--query "select
id,
referrer,
from_url,
landing_page_url,
url_title,
platform_description,
other_params,
history,
'2022-06-15' as dt from web_chat_text_ems_2019_07 where 1=1  and  \$CONDITIONS" \
--hcatalog-database edu_consult_ods \
--hcatalog-table web_chat_text_ems \
-m 1