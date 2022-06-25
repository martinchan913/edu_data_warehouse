--dwm 层建表
CREATE DATABASE IF NOT EXISTS `edu_attend_dwm`;

use edu_attend_dwm;
--出勤看板后不会进行更改
--dwd层取出勤，迟到，请假，旷课相关的表内容，多余内容不取

--学生出勤状态表（包含出勤及迟到）
drop table edu_attend_dwm.student_signin_stat_dwm;
create table if not exists edu_attend_dwm.student_signin_stat_dwm
(
    `id`                int COMMENT '主键id',
    `class_id`          int COMMENT '班级id',
    `student_id`        int COMMENT '学员id',
    `signin_time`       string COMMENT '签到时间',
    `signin_date`       string      COMMENT '签到日期',
    content string comment '课程内容',
     signin_time_type    int  COMMENT '有效签到类型 0：上午 1：下午 2：晚上 ',
     late_type  int  COMMENT '迟到有效类型 0：上午 1：下午 2：晚上 未迟到null'
--      leave_type int comment '请假有效类型 0：上午 1：下午 2：全天 其他null'
)comment '学生打卡记录表'
partitioned by(yearinfo String,monthinfo String,dayinfo string)
row format delimited fields terminated by "\t"
stored as orc
location"/user/hive/warehouse/edu_attend_dwm.db/student_signin_stat_dwm"
tblproperties ("orc.compress"="SNAPPY");

set hive.exec.dynamic.partition.mode=nonstrict;
insert into table edu_attend_dwm.student_signin_stat_dwm partition (yearinfo,monthinfo,dayinfo)
select
t1.id,
t1.class_id,
t1.student_id,
signin_time,
signin_date,
content,
case
    when substr(signin_time,12,8) between from_unixtime(unix_timestamp(concat(signin_date,' ',morning_begin_time))-2400,'HH:mm:ss') and morning_end_time then '0'
    when substr(signin_time,12,8) between from_unixtime(unix_timestamp(concat(signin_date,' ',afternoon_begin_time))-2400,'HH:mm:ss')  and afternoon_end_time then '1'
    when substr(signin_time,12,8) between from_unixtime(unix_timestamp(concat(signin_date,' ',evening_begin_time))-2400,'HH:mm:ss')   and evening_end_time then '2'
    else null
    end   as signin_time_type,
case
    when substr(signin_time,12,8) between from_unixtime(unix_timestamp(concat(signin_date,' ',morning_begin_time))+600,'HH:mm:ss') and morning_end_time then '0'
    when substr(signin_time,12,8) between from_unixtime(unix_timestamp(concat(signin_date,' ',afternoon_begin_time))+600,'HH:mm:ss')  and afternoon_end_time then '1'
    when substr(signin_time,12,8) between from_unixtime(unix_timestamp(concat(signin_date,' ',evening_begin_time))+600,'HH:mm:ss')   and evening_end_time then '2'
    else null
    end as late_type,
year(signin_date)as yearinfo,
month(signin_date)as monthinfo,
day(signin_date)as dayinfo
from edu_attend_ods.tbh_student_signin_record_ods t1
left join edu_attend_ods.tbh_class_time_table_ods t2 on t1.class_id=t2.class_id
left join edu_attend_dwd.course_table_upload_detail_dwd t3 on t2.class_id=t3.class_id
where signin_date between use_begin_date and use_end_date
and substr(signin_time,12,8) between from_unixtime(unix_timestamp(concat(signin_date,' ',morning_begin_time))-2400,'HH:mm:ss') and morning_end_time
or substr(signin_time,12,8) between from_unixtime(unix_timestamp(concat(signin_date,' ',afternoon_begin_time))-2400,'HH:mm:ss')  and afternoon_end_time
or substr(signin_time,12,8) between from_unixtime(unix_timestamp(concat(signin_date,' ',evening_begin_time))-2400,'HH:mm:ss')   and evening_end_time;

--学生请假状态
drop table edu_attend_dwm.student_leave_stat_dwm;
create table if not exists edu_attend_dwm.student_leave_stat_dwm
(
    `id`                int COMMENT '主键id',
    `class_id`          int COMMENT '班级id',
    `student_id`        int COMMENT '学员id',
     leave_type int comment '请假有效类型 0：上午 1：下午 2：全天 其他null',
     create_time string comment '创建时间'
)comment '学生请假状态表'
partitioned by(yearinfo String,monthinfo String,dayinfo string)
row format delimited fields terminated by "\t"
stored as orc
location"/user/hive/warehouse/edu_attend_dwm.db/student_leave_stat_dwm"
tblproperties ("orc.compress"="SNAPPY");

insert into table edu_attend_dwm.student_leave_stat_dwm partition (yearinfo,monthinfo,dayinfo)
select
id,
class_id,
student_id,
case
    when begin_time_type=1 and end_time_type=1 then '0'
    when begin_time_type=2 and end_time_type=2 then '1'
    when begin_time_type=1 and end_time_type=2 then '2'
    else null
    end as leave_type,
create_time,
yearinfo,
monthinfo,
dayinfo
from edu_attend_dwd.student_leave_apply_dwd;





