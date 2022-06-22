--todo 需求一 根据时间维度统计访问量

--todo 根据 年维度 统计 总访问量
insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
count(distinct sid) as sid_total,
count(distinct session_id)sessionid_total,
count(distinct ip)ip_total,
'-1'as area,
'-1'as seo_source,
'-1'as origin_channel,
'-1'as hourinfo,
yearinfo as time_str,
'-1'from_url,
'5'grouptype,
'5'time_type,
yearinfo,
'-1'quarterinfo,
'-1'monthinfo,
'-1'dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo;

--todo 根据 季度维度 统计 总访问量
-- 按季度统计

insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
    count(distinct sid) as sid_total,
    count(distinct session_id) as sessionid_total,
    count(distinct ip) as ip_total,
    '-1' as area,
    '-1' as seo_source,
    '-1' as origin_channel,
    '-1' as hourinfo,
    concat(yearinfo, '-', quarterinfo) as time_str,
    '-1' as from_url,
    '5' as grouptype,
    '4' as time_type,
    yearinfo,
    quarterinfo,
    '-1' as monthinfo,
    '-1' as dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo, quarterinfo;
--todo 根据 月维度 统计 总访问量
insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
    count(distinct sid) as sid_total,
    count(distinct session_id) as sessionid_total,
    count(distinct ip) as ip_total,
    '-1' as area,
    '-1' as seo_source,
    '-1' as origin_channel,
    '-1' as hourinfo,
    concat(yearinfo, '-', monthinfo) as time_str,
    '-1' as from_url,
    '5' as grouptype,
    '3' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    '-1' as dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo, quarterinfo,monthinfo;
--todo 根据 日维度 统计 总访问量
insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
    count(distinct sid) as sid_total,
    count(distinct session_id) as sessionid_total,
    count(distinct ip) as ip_total,
    '-1' as area,
    '-1' as seo_source,
    '-1' as origin_channel,
    '-1' as hourinfo,
    concat(yearinfo, '-', monthinfo,'-',dayinfo) as time_str,
    '-1' as from_url,
    '5' as grouptype,
    '2' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo, quarterinfo,monthinfo,dayinfo;
--todo 根据 小时维度 统计 总访问量
insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
    count(distinct sid) as sid_total,
    count(distinct session_id) as sessionid_total,
    count(distinct ip) as ip_total,
    '-1' as area,
    '-1' as seo_source,
    '-1' as origin_channel,
    hourinfo,
    concat(yearinfo, '-', monthinfo,'-',dayinfo,'-',hourinfo) as time_str,
    '-1' as from_url,
    '5' as grouptype,
    '1' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo, quarterinfo,monthinfo,dayinfo,hourinfo;


--todo 需求二
--todo 统计 每年 各个地区的访问量
-- insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
count(distinct sid) sid_total,
count(distinct session_id)sessionid_total,
count(distinct ip)ip_total,
area,
'-1'as seo_source,
'-1'as origin_channel,
'-1'as hourinfo,
yearinfo as time_str,
'-1'from_url,
'1'grouptype,
'5'time_type,
yearinfo,
'-1'quarterinfo,
'-1'monthinfo,
'-1'dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo,area;
--todo 统计 每季度 各个地区的访问量
insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
    count(distinct sid) as sid_total,
    count(distinct session_id) as sessionid_total,
    count(distinct ip) as ip_total,
    area,
    '-1' as seo_source,
    '-1' as origin_channel,
    '-1' as hourinfo,
    concat(yearinfo, '-', quarterinfo) as time_str,
    '-1' as from_url,
    '1' as grouptype,
    '4' as time_type,
    yearinfo,
    quarterinfo,
    '-1' as monthinfo,
    '-1' as dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo, quarterinfo,area;
--todo 统计 每月 各个地区的访问量
insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
    count(distinct sid) as sid_total,
    count(distinct session_id) as sessionid_total,
    count(distinct ip) as ip_total,
    area,
    '-1' as seo_source,
    '-1' as origin_channel,
    '-1' as hourinfo,
    concat(yearinfo, '-', monthinfo) as time_str,
    '-1' as from_url,
    '1' as grouptype,
    '3' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    '-1' as dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo, quarterinfo,monthinfo,area;
--todo 统计 每天 各个地区的访问量
insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
    count(distinct sid) as sid_total,
    count(distinct session_id) as sessionid_total,
    count(distinct ip) as ip_total,
    area,
    '-1' as seo_source,
    '-1' as origin_channel,
    '-1' as hourinfo,
    concat(yearinfo, '-', monthinfo,'-',dayinfo) as time_str,
    '-1' as from_url,
    '1' as grouptype,
    '2' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo, quarterinfo,monthinfo,dayinfo,area;
--todo 统计 每小时 各个地区的访问量
insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
    count(distinct sid) as sid_total,
    count(distinct session_id) as sessionid_total,
    count(distinct ip) as ip_total,
    area,
    '-1' as seo_source,
    '-1' as origin_channel,
    hourinfo,
    concat(yearinfo, '-', monthinfo,'-',dayinfo,'-',hourinfo) as time_str,
    '-1' as from_url,
    '1' as grouptype,
    '1' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo, quarterinfo,monthinfo,dayinfo,hourinfo,area;

--todo 需求三
--todo 根据时间维度 统计 各搜索来源 的访问量数据
--todo 根据 年维度  各搜索来源统计 总访问量

insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
count(distinct sid) as sid_total,
count(distinct session_id)sessionid_total,
count(distinct ip)ip_total,
'-1'as area,
seo_source,
'-1'as origin_channel,
'-1'as hourinfo,
yearinfo as time_str,
'-1'from_url,
'2'grouptype,
'5'time_type,
yearinfo,
'-1'quarterinfo,
'-1'monthinfo,
'-1'dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo,seo_source;

select *
from edu_dws.visit_dws
where grouptype='1'and time_type='1';
--todo 根据 季度维度 各搜索来源统计 总访问量
-- 按季度统计
insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
    count(distinct sid) as sid_total,
    count(distinct session_id) as sessionid_total,
    count(distinct ip) as ip_total,
    '-1' as area,
    seo_source,
    '-1' as origin_channel,
    '-1' as hourinfo,
    concat(yearinfo, '-', quarterinfo) as time_str,
    '-1' as from_url,
    '2' as grouptype,
    '4' as time_type,
    yearinfo,
    quarterinfo,
    '-1' as monthinfo,
    '-1' as dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo, quarterinfo,seo_source;
--todo 根据 月维度 各搜索来源统计 总访问量
insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
    count(distinct sid) as sid_total,
    count(distinct session_id) as sessionid_total,
    count(distinct ip) as ip_total,
    '-1' as area,
    seo_source,
    '-1' as origin_channel,
    '-1' as hourinfo,
    concat(yearinfo, '-', monthinfo) as time_str,
    '-1' as from_url,
    '2' as grouptype,
    '3' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    '-1' as dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo, quarterinfo,monthinfo,seo_source;
--todo 根据 日维度 各搜索来源统计 总访问量
insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
    count(distinct sid) as sid_total,
    count(distinct session_id) as sessionid_total,
    count(distinct ip) as ip_total,
    '-1' as area,
    seo_source,
    '-1' as origin_channel,
    '-1' as hourinfo,
    concat(yearinfo, '-', monthinfo,'-',dayinfo) as time_str,
    '-1' as from_url,
    '2' as grouptype,
    '2' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo, quarterinfo,monthinfo,dayinfo,seo_source;
--todo 根据 小时维度 各搜索来源统计 总访问量
insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
    count(distinct sid) as sid_total,
    count(distinct session_id) as sessionid_total,
    count(distinct ip) as ip_total,
    '-1' as area,
    seo_source,
    '-1' as origin_channel,
    hourinfo,
    concat(yearinfo, '-', monthinfo,'-',dayinfo,'-',hourinfo) as time_str,
    '-1' as from_url,
    '2' as grouptype,
    '1' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo, quarterinfo,monthinfo,dayinfo,hourinfo,seo_source;




--todo 需求四 根据时间维度 统计 各来源渠道 的访问量数据
insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
count(distinct sid) as sid_total,
count(distinct session_id)sessionid_total,
count(distinct ip)ip_total,
'-1'as area,
'-1'as seo_source,
origin_channel,
'-1'as hourinfo,
yearinfo as time_str,
'-1'from_url,
'3'grouptype,
'5'time_type,
yearinfo,
'-1'quarterinfo,
'-1'monthinfo,
'-1'dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo,origin_channel;

--todo 根据 季度维度 各来源渠道统计 总访问量
-- 按季度统计

insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
    count(distinct sid) as sid_total,
    count(distinct session_id) as sessionid_total,
    count(distinct ip) as ip_total,
    '-1' as area,
    '-1' as seo_source,
    origin_channel,
    '-1' as hourinfo,
    concat(yearinfo, '-', quarterinfo) as time_str,
    '-1' as from_url,
    '3' as grouptype,
    '4' as time_type,
    yearinfo,
    quarterinfo,
    '-1' as monthinfo,
    '-1' as dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo, quarterinfo,origin_channel;
--todo 根据 月维度 各来源渠道统计 总访问量
insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
    count(distinct sid) as sid_total,
    count(distinct session_id) as sessionid_total,
    count(distinct ip) as ip_total,
    '-1' as area,
    '-1' as seo_source,
    origin_channel,
    '-1' as hourinfo,
    concat(yearinfo, '-', monthinfo) as time_str,
    '-1' as from_url,
    '3' as grouptype,
    '3' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    '-1' as dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo, quarterinfo,monthinfo,origin_channel;
--todo 根据 日维度 各来源渠道统计 总访问量
insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
    count(distinct sid) as sid_total,
    count(distinct session_id) as sessionid_total,
    count(distinct ip) as ip_total,
    '-1' as area,
    '-1' as seo_source,
    origin_channel,
    '-1' as hourinfo,
    concat(yearinfo, '-', monthinfo,'-',dayinfo) as time_str,
    '-1' as from_url,
    '3' as grouptype,
    '2' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo, quarterinfo,monthinfo,dayinfo,origin_channel;
--todo 根据 小时维度 各来源渠道统计 总访问量
insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
    count(distinct sid) as sid_total,
    count(distinct session_id) as sessionid_total,
    count(distinct ip) as ip_total,
    '-1' as area,
    '-1' as seo_source,
    origin_channel,
    hourinfo,
    concat(yearinfo, '-', monthinfo,'-',dayinfo,'-',hourinfo) as time_str,
    '-1' as from_url,
    '3' as grouptype,
    '1' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo, quarterinfo,monthinfo,dayinfo,hourinfo,origin_channel;

--todo 需求五 根据时间维度 统计 各访问页面 的访问量数据
--todo 根据 年维度 各访问页面统计 总访问量
insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
count(distinct sid) as sid_total,
count(distinct session_id)sessionid_total,
count(distinct ip)ip_total,
'-1'as area,
'-1'as seo_source,
'-1'as origin_channel,
'-1'as hourinfo,
yearinfo as time_str,
from_url,
'4'grouptype,
'5'time_type,
yearinfo,
'-1'as quarterinfo,
'-1'as monthinfo,
'-1'as dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo,from_url;

--todo 根据 季度维度 各访问页面统计 总访问量
-- 按季度统计

insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
    count(distinct sid) as sid_total,
    count(distinct session_id) as sessionid_total,
    count(distinct ip) as ip_total,
    '-1' as area,
    '-1' as seo_source,
    '-1' as origin_channel,
    '-1' as hourinfo,
    concat(yearinfo, '-', quarterinfo) as time_str,
    from_url,
    '4'grouptype,
    '4' as time_type,
    yearinfo,
    quarterinfo,
    '-1' as monthinfo,
    '-1' as dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo, quarterinfo,from_url;
--todo 根据 月维度 各访问页面统计 总访问量
insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
    count(distinct sid) as sid_total,
    count(distinct session_id) as sessionid_total,
    count(distinct ip) as ip_total,
    '-1' as area,
    '-1' as seo_source,
    '-1' as origin_channel,
    '-1' as hourinfo,
    concat(yearinfo, '-', monthinfo) as time_str,
    from_url,
    '4'grouptype,
    '3' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    '-1' as dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo, quarterinfo,monthinfo,from_url;
--todo 根据 日维度 各访问页面统计 总访问量
insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
    count(distinct sid) as sid_total,
    count(distinct session_id) as sessionid_total,
    count(distinct ip) as ip_total,
    '-1' as area,
    '-1' as seo_source,
    '-1' as origin_channel,
    '-1' as hourinfo,
    concat(yearinfo, '-', monthinfo,'-',dayinfo) as time_str,
    from_url,
    '4'grouptype,
    '2' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo, quarterinfo,monthinfo,dayinfo,from_url;
--todo 根据 小时维度 各访问页面统计 总访问量
insert into table edu_dws.visit_dws partition(yearinfo, quarterinfo, monthinfo, dayinfo)
select
    count(distinct sid) as sid_total,
    count(distinct session_id) as sessionid_total,
    count(distinct ip) as ip_total,
    '-1' as area,
    '-1' as seo_source,
    '-1' as origin_channel,
    hourinfo,
    concat(yearinfo, '-', monthinfo,'-',dayinfo,'-',hourinfo) as time_str,
    from_url,
    '4'grouptype,
    '1' as time_type,
    yearinfo,
    quarterinfo,
    monthinfo,
    dayinfo
from edu_dwd.visit_consult_dwd
group by yearinfo, quarterinfo,monthinfo,dayinfo,hourinfo,from_url;