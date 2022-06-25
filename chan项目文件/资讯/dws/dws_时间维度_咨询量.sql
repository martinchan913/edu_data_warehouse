    --todo 需求一 根据时间维度统计 咨询量

--todo 根据 年维度 统计 总咨询量
-- insert into table edu_dws.consult_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
count(distinct sid) as sid_total,
count(distinct session_id)sessionid_total,
count(distinct ip)ip_total,
'-1'as area,
'-1'as origin_channel,
'-1'as hourinfo,
yearinfo as time_str,
'5'grouptype,
'5'time_type,
yearinfo,
'-1'as quarterinfo,
'-1'as monthinfo,
'-1'as dayinfo
from edu_dwd.visit_consult_dwd
where msg_count>0
group by yearinfo;

--todo 根据 季度维度 统计 总咨询量
-- 按季度统计

insert into table edu_dws.consult_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
count(distinct sid) as sid_total,
count(distinct session_id)sessionid_total,
count(distinct ip)ip_total,
'-1'as area,
'-1'as origin_channel,
'-1'as hourinfo,
concat(yearinfo, '-', quarterinfo) as time_str ,
    '5' as grouptype,
    '4' as time_type,
    yearinfo,
    quarterinfo,
    '-1' as monthinfo,
    '-1' as dayinfo
from edu_dwd.visit_consult_dwd
where msg_count>0
group by yearinfo, quarterinfo;

--todo 根据 月维度 统计 总咨询量
insert into table edu_dws.consult_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
count(distinct sid) as sid_total,
count(distinct session_id)sessionid_total,
count(distinct ip)ip_total,
'-1'as area,
'-1'as origin_channel,
'-1'as hourinfo,
concat(yearinfo, '-', monthinfo) as time_str,
    '5' as grouptype,
    '3' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    '-1' as dayinfo
from edu_dwd.visit_consult_dwd
where msg_count>0
group by yearinfo, quarterinfo,monthinfo;
--todo 根据 日维度 统计 总咨询量
insert into table edu_dws.consult_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
count(distinct sid) as sid_total,
count(distinct session_id)sessionid_total,
count(distinct ip)ip_total,
'-1'as area,
'-1'as origin_channel,
'-1'as hourinfo,
concat(yearinfo, '-', monthinfo,'-',dayinfo) as time_str,
    '5' as grouptype,
    '2' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    dayinfo
from edu_dwd.visit_consult_dwd
where msg_count>0
group by yearinfo, quarterinfo,monthinfo,dayinfo;
--todo 根据 小时维度 统计 总咨询量
-- insert into table edu_dws.consult_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
count(distinct sid) as sid_total,
count(distinct session_id)sessionid_total,
count(distinct ip)ip_total,
'-1'as area,
'-1'as origin_channel,
'-1'as hourinfo,
concat(yearinfo, '-', monthinfo,'-',dayinfo,'-',hourinfo) as time_str,
    '5' as grouptype,
    '1' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    dayinfo
from edu_dwd.visit_consult_dwd
where msg_count>0
group by yearinfo, quarterinfo,monthinfo,dayinfo,hourinfo;


--todo 需求二 根据时间维度统计 区域维度 咨询量

--todo 根据 年维度 区域维度统计 总咨询量
insert into table edu_dws.consult_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
count(distinct sid) as sid_total,
count(distinct session_id)sessionid_total,
count(distinct ip)ip_total,
area,
'-1'as origin_channel,
'-1'as hourinfo,
yearinfo as time_str,
'5'grouptype,
'5'time_type,
yearinfo,
'-1'as quarterinfo,
'-1'as monthinfo,
'-1'as dayinfo
from edu_dwd.visit_consult_dwd
where msg_count>0
group by yearinfo,area;

--todo 根据 季度维度 区域维度统计 总咨询量
-- 按季度统计

insert into table edu_dws.consult_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
count(distinct sid) as sid_total,
count(distinct session_id)sessionid_total,
count(distinct ip)ip_total,
'-1'as area,
'-1'as origin_channel,
'-1'as hourinfo,
yearinfo as time_str,
    '5' as grouptype,
    '4' as time_type,
    yearinfo,
    quarterinfo,
    '-1' as monthinfo,
    '-1' as dayinfo
from edu_dwd.visit_consult_dwd
where msg_count>0
group by yearinfo, quarterinfo;

--todo 根据 月维度 区域维度统计 总咨询量
insert into table edu_dws.consult_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
count(distinct sid) as sid_total,
count(distinct session_id)sessionid_total,
count(distinct ip)ip_total,
'-1'as area,
'-1'as origin_channel,
'-1'as hourinfo,
yearinfo as time_str,
    '5' as grouptype,
    '3' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    '-1' as dayinfo
from edu_dwd.visit_consult_dwd
where msg_count>0
group by yearinfo, quarterinfo,monthinfo;
--todo 根据 日维度 区域维度统计 总咨询量
insert into table edu_dws.consult_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
count(distinct sid) as sid_total,
count(distinct session_id)sessionid_total,
count(distinct ip)ip_total,
'-1'as area,
'-1'as origin_channel,
'-1'as hourinfo,
yearinfo as time_str,
    '5' as grouptype,
    '2' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    dayinfo
from edu_dwd.visit_consult_dwd
where msg_count>0
group by yearinfo, quarterinfo,monthinfo,dayinfo;
--todo 根据 小时维度 区域维度统计 总咨询量
insert into table edu_dws.consult_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
count(distinct sid) as sid_total,
count(distinct session_id)sessionid_total,
count(distinct ip)ip_total,
'-1'as area,
'-1'as origin_channel,
'-1'as hourinfo,
yearinfo as time_str,
    '5' as grouptype,
    '1' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    dayinfo
from edu_dwd.visit_consult_dwd
where msg_count>0
group by yearinfo, quarterinfo,monthinfo,dayinfo,hourinfo;
