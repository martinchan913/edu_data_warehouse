create database itcast_dwb;
truncate table itcast_dwb.dwb_itcast_intention;
create table itcast_dwb.dwb_itcast_intention(
customer_id int ,
create_date_time string,
area string,
itcast_school_id int,
itcast_school_name string,
deleted string,
origin_type string,
itcast_subject_id  int,
itcast_subject_name string,
hourinfo string,
origin_type_stat int,
clue_state_stat int,
tdepart_id int,
tdepart_name string
)comment"客户静态信息表"
partitioned by(yearinfo String,monthinfo String, dayinfo string)
row format delimited fields terminated by "\t"
stored as orc
location"/user/hive/warehouse/itcast_dwb.db/dwb_itcast_intention"
tblproperties ("orc.compress"="SNAPPY");
set hive.exec.dynamic.partition.mode=nonstrict;
insert into itcast_dwb.dwb_itcast_intention partition (yearinfo,monthinfo,dayinfo)
select
dcr.customer_id,
dcr.create_date_time,
c.area,
dcr.itcast_school_id,
sc.name as itcast_school_name,
dcr.deleted,
dcr.origin_type,
dcr.itcast_subject_id,
su.name as itcast_subject_name,
dcr.hourinfo,
dcr.origin_type_stat,
cc.clue_state_stat,
e.tdepart_id,
sd.name as tdepart_name,
dcr.yearinfo,
dcr.monthinfo,
dcr.dayinfo
from itcast_dwd.dwd_customer_relationship dcr
left join itcast_dwd.dwd_customer_clue cc on dcr.id = cc.customer_relationship_id
left join itcast_ods.customer  c on dcr.customer_id = c.id
left join itcast_ods.itcast_school sc on dcr.itcast_school_id=sc.id
left join itcast_ods.itcast_subject su on dcr.itcast_subject_id = su.id
left join itcast_ods.employee e on dcr.creator =e.id
left join itcast_ods.scrm_department sd on e.tdepart_id=sd.id;


