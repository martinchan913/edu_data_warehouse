--需求四 年意向总量 线上，线下，新老用户 学校
insert into table itcast_dws.dws_itcast_intention partition (yearinfo,monthinfo,dayinfo)
select
count(distinct customer_id) as customer_total,
'-1'as area,
itcast_school_id,
itcast_school_name,
'-1'as origin_type,
'-1'as itcast_subject_id,
'-1'as itcast_subject_name,
origin_type_stat,
clue_state_stat,
'-1'as tdepart_id,
'-1'as tdepart_name,
yearinfo as time_str,
'3'as grouptype,
'1'as time_type,
'-1'as hourinfo,
yearinfo,
'-1'as monthinfo,
'-1'as dayinfo
from itcast_dwb.dwb_itcast_intention
group by yearinfo,origin_type_stat,clue_state_stat,itcast_school_id,itcast_school_name;

select *
from itcast_dws.dws_itcast_intention
where grouptype='4'and origin_type='PHONE';


--年 月总量 线上，线下，新老用户 学科
insert into table itcast_dws.dws_itcast_intention partition (yearinfo,monthinfo,dayinfo)
select
count(distinct customer_id) as customer_total,
'-1'as area,
itcast_school_id,
itcast_school_name,
'-1'as origin_type,
'-1'as itcast_subject_id,
'-1'as itcast_subject_name,
origin_type_stat,
clue_state_stat,
'-1'as tdepart_id,
'-1'as tdepart_name,
concat(yearinfo,'-',monthinfo) as time_str,
'3'as grouptype,
'2'as time_type,
       '-1'as hourinfo,
yearinfo,
monthinfo,
'-1'as dayinfo
from itcast_dwb.dwb_itcast_intention
group by yearinfo,monthinfo,origin_type_stat,clue_state_stat,itcast_school_id,itcast_school_name;
--年 日总量 线上，线下，新老用户 学科
insert into table itcast_dws.dws_itcast_intention partition (yearinfo,monthinfo,dayinfo)
select
count(distinct customer_id) as customer_total,
'-1'as area,
itcast_school_id,
itcast_school_name,
'-1'as origin_type,
'-1'as itcast_subject_id,
'-1'as itcast_subject_name,
origin_type_stat,
clue_state_stat,
'-1'as tdepart_id,
'-1'as tdepart_name,
concat(yearinfo,'-',monthinfo,'-',dayinfo) as time_str,
'3'as grouptype,
'4'as time_type,
'-1'as hourinfo,
yearinfo,
monthinfo,
dayinfo
from itcast_dwb.dwb_itcast_intention
group by yearinfo,monthinfo,dayinfo,origin_type_stat,clue_state_stat,itcast_school_id,itcast_school_name;

--年 月日小时总量 线上，线下，新老用户 学科
insert into table itcast_dws.dws_itcast_intention partition (yearinfo,monthinfo,dayinfo)
select
count(distinct customer_id) as customer_total,
'-1'as area,
itcast_school_id,
itcast_school_name,
'-1'as origin_type,
'-1'as itcast_subject_id,
'-1'as itcast_subject_name,
origin_type_stat,
clue_state_stat,
'-1'as tdepart_id,
'-1'as tdepart_name,
concat(yearinfo,'-',monthinfo,'-',dayinfo,'-',hourinfo) as time_str,
'3'as grouptype,
'5'as time_type,
hourinfo,
yearinfo,
monthinfo,
dayinfo
from itcast_dwb.dwb_itcast_intention
group by yearinfo,monthinfo,dayinfo,hourinfo,origin_type_stat,clue_state_stat,itcast_school_id,itcast_school_name;