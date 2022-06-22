-- dws出勤板块建表
drop database edu_attend_dws cascade ;
create database edu_attend_dws;


drop table edu_attend_dws.edu_attendence_dws;
create table edu_attend_dws.edu_attendence_dws(
class_id int comment '班级id',
mor_att_num int comment '上午出勤人数',
after_att_num int comment '下午出勤人数',
eve_att_num int comment '晚上出勤人数'
)comment '出勤表人数'
partitioned by (yearinfo string,monthinfo string,dayinfo string)
row format delimited fields terminated by "\t"
stored as orc
location"/user/hive/warehouse/edu_attend_dws.db/edu_attendence_dws"
tblproperties ("orc.compress"="SNAPPY");


insert into table edu_attend_dws.edu_attendence_dws partition (yearinfo,monthinfo,dayinfo)
select
class_id,
count(distinct case
            when signin_time_type =0 then student_id
    else null end
    ) as mor_att_num,
count(distinct case
            when signin_time_type =1 then student_id
    else null end
    )  as after_att_num,
count(distinct case
            when signin_time_type =2 then student_id
    else null end
    )  as eve_att_num,
yearinfo,
monthinfo,
dayinfo
from edu_attend_dwm.student_signin_stat_dwm
group by class_id,yearinfo,monthinfo,dayinfo;

-- dws迟到板块建表
create database edu_attend_dws;

drop table edu_attend_dws.edu_late_dws;
create table edu_attend_dws.edu_late_dws(
class_id int comment '班级id',
mor_late_num int comment '上午迟到人数',
after_late_num int comment '下午迟到人数',
eve_late_num int comment '晚上迟到人数'
)comment '迟到表人数'
partitioned by (yearinfo string,monthinfo string,dayinfo string)
row format delimited fields terminated by "\t"
stored as orc
location"/user/hive/warehouse/edu_attend_dws.db/edu_late_dws"
tblproperties ("orc.compress"="SNAPPY");

insert into table edu_attend_dws.edu_late_dws partition (yearinfo,monthinfo,dayinfo)
select
class_id,
count(distinct case
            when late_type =0 then student_id
    else null end
    ) as mor_late_num,
count(distinct case
            when late_type =1 then student_id
    else null end
    )  as after_late_num,
count(distinct case
            when late_type =2 then student_id
    else null end
    )  as eve_late_num,
yearinfo,
monthinfo,
dayinfo
from edu_attend_dwm.student_signin_stat_dwm
group by class_id,yearinfo,monthinfo,dayinfo;

-- dws请假板块建表
create database edu_attend_dws;

drop table edu_attend_dws.edu_leave_dws;
create table edu_attend_dws.edu_leave_dws(
class_id int comment '班级id',
mor_leave_num int comment '上午请假人数',
after_leave_num int comment '下午请假人数'
-- eve_leave_num int comment '晚上请假人数'
)comment '请假人数表'
partitioned by (yearinfo string,monthinfo string,dayinfo string)
row format delimited fields terminated by "\t"
stored as orc
location"/user/hive/warehouse/edu_attend_dws.db/edu_leave_dws"
tblproperties ("orc.compress"="SNAPPY");

insert into table edu_attend_dws.edu_leave_dws partition (yearinfo,monthinfo,dayinfo)
select
class_id,
count(distinct case
            when leave_type ='0'or leave_type ='2'then student_id
    else null end
    ) as mor_late_num,
count(distinct case
            when leave_type ='1'or leave_type ='2' then student_id
    else null end
    )  as after_late_num,
yearinfo,
monthinfo,
dayinfo
from edu_attend_dwm.student_leave_stat_dwm
group by class_id,yearinfo,monthinfo,dayinfo;

-- dws 旷课板块建表
create database edu_attend_dws;

drop table edu_attend_dws.edu_truant_dws;
create table edu_attend_dws.edu_truant_dws(
class_id int comment '班级id',
mor_truant_num int comment '早上旷课人数',
after_truant_num int comment '下午旷课人数',
eve_truant_num int comment '晚上旷课人数'
)comment '旷课人数表'
partitioned by (yearinfo string,monthinfo string,dayinfo string)
row format delimited fields terminated by "\t"
stored as orc
location"/user/hive/warehouse/edu_attend_dws.db/edu_truant_dws"
tblproperties ("orc.compress"="SNAPPY");

insert into  table  edu_attend_dws.edu_truant_dws partition (yearinfo,monthinfo,dayinfo)
select
t1.class_id,
-- mor_att_num,
-- studying_student_count,1
-- mor_leave_num,
-- mor_att_num,
t3.studying_student_count-t2.mor_leave_num-t1.mor_att_num as  mor_truant_num,
t3.studying_student_count-t2.after_leave_num-t1.after_att_num as  after_truant_num,
t3.studying_student_count-t1.eve_att_num as  eve_truant_num,
t1.yearinfo,
t1.monthinfo,
t1.dayinfo
from edu_attend_dws.edu_attendence_dws t1
join edu_attend_dws.edu_leave_dws t2 on t1.class_id=t2.class_id
join edu_attend_dwd.class_studying_student_count_dwd t3 on t2.class_id=t3.class_id;
