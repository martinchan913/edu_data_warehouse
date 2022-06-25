--出勤dm层
create database edu_attend_dm;
drop table edu_attend_dm.edu_attendence_dm;

create database edu_attend_dm;
drop table edu_attend_dm.edu_attendence_dm;
create table edu_attend_dm.edu_attendence_dm(
time_str string comment '时间',
class_id int ,
attendence_amount int comment '出勤总人数',

mor_attend_amount int comment '早上出勤总人数',
mor_attend_amount_rate string comment'早上出勤率',
after_attend_amount int comment '下午出勤总人数',
after_attend_amount_rate string comment '下午出勤率',
eve_attend_amount int comment '晚上出勤总人数',
eve_attend_amount_rate string comment '晚上出勤率',

mor_late_amount int comment '早上迟到总人数',
mor_late_amount_rate string comment'早上迟到率',
after_late_amount int comment '下午迟到总人数',
after_late_amount_rate string comment '下午迟到率',
eve_late_amount int comment '晚上迟到总人数',
eve_late_amount_rate string comment '晚上迟到率',

mor_leave_amount int comment '早上请假总人数',
mor_leave_amount_rate string comment'早上请假率',
after_leave_amount int comment '下午请假总人数',
after_leave_amount_rate string comment '下午请假率',

mor_truant_amount int comment '早上旷课总人数',
mor_truant_amount_rate string comment'早上旷课率',
after_truant_amount int comment '下午旷课总人数',
after_truant_amount_rate string comment '下午旷课率',
eve_truant_amount int comment '晚上旷课总人数',
eve_truant_amount_rate string comment '晚上旷课率'
)comment '出勤总需求'
partitioned by(yearinfo String,monthinfo String)
row format delimited fields terminated by "\t"
stored as orc
location"/user/hive/warehouse/edu_attend_dm.db/edu_attendence_dm"
tblproperties ("orc.compress"="SNAPPY");


create database edu_attend_dm;
drop table edu_attend_dm.edu_attendence_dm;
create table edu_attend_dm.edu_attendence_dm(
time_str string comment '时间',
class_id int ,
attendence_amount int comment '出勤总人数',

mor_attend_amount int comment '早上出勤总人数',
mor_attend_amount_rate string comment'早上出勤率',
after_attend_amount int comment '下午出勤总人数',
after_attend_amount_rate string comment '下午出勤率',
eve_attend_amount int comment '晚上出勤总人数',
eve_attend_amount_rate string comment '晚上出勤率',

mor_late_amount int comment '早上迟到总人数',
mor_late_amount_rate string comment'早上迟到率',
after_late_amount int comment '下午迟到总人数',
after_late_amount_rate string comment '下午迟到率',
eve_late_amount int comment '晚上迟到总人数',
eve_late_amount_rate string comment '晚上迟到率',

mor_leave_amount int comment '早上请假总人数',
mor_leave_amount_rate string comment'早上请假率',
after_leave_amount int comment '下午请假总人数',
after_leave_amount_rate string comment '下午请假率',

mor_truant_amount int comment '早上旷课总人数',
mor_truant_amount_rate string comment'早上旷课率',
after_truant_amount int comment '下午旷课总人数',
after_truant_amount_rate string comment '下午旷课率',
eve_truant_amount int comment '晚上旷课总人数',
eve_truant_amount_rate string comment '晚上旷课率'
)comment '出勤总需求'
partitioned by(yearinfo String,monthinfo String)
row format delimited fields terminated by "\t"
stored as orc
location"/user/hive/warehouse/edu_attend_dm.db/edu_attendence_dm"
tblproperties ("orc.compress"="SNAPPY");
set hive.exec.dynamic.partition.mode=nonstrict;
insert into table edu_attend_dm.edu_attendence_dm partition (yearinfo,monthinfo)
select
t1.yearinfo as time_str,
t1.class_id,
studying_student_count as attendence_amount,
sum(mor_att_num)as mor_attend_amount,
concat(cast(sum(mor_att_num)/sum(studying_student_count)as decimal(10,4))*100,'%') as mor_attend_amount_rate,
sum(after_att_num)as after_attend_amount,
concat(cast(sum(after_att_num)/sum(studying_student_count)as decimal(10,4))*100,'%')as after_attend_amount_rate,
sum(eve_att_num)eve_attend_amount,
concat(cast(sum(eve_att_num)/sum(studying_student_count)as decimal(10,4))*100,'%')as eve_attend_amount_rate,
sum(mor_late_num)as mor_late_amount,
concat(cast(sum(mor_late_num)/sum(studying_student_count)as decimal(10,4))*100,'%')as mor_late_amount_rate,
sum(after_late_num)as after_late_amount,
concat(cast(sum(after_late_num)/sum(studying_student_count)as decimal(10,4))*100,'%')as after_late_amount_rate,
sum(eve_late_num)as eve_late_amount,
concat(cast(sum(eve_late_num)/sum(studying_student_count)as decimal(10,4))*100,'%')as eve_late_amount_rate,
sum(mor_leave_num)as mor_leave_amount,
concat(cast(sum(mor_leave_num)/sum(studying_student_count)as decimal(10,4))*100,'%')as mor_leave_amount_rate,
sum(after_leave_num)as after_leave_amount,
concat(cast(sum(after_leave_num)/sum(studying_student_count)as decimal(10,4))*100,'%')as after_leave_amount_rate,
sum(mor_truant_num)as mor_truant_amount,
concat(cast(sum(mor_truant_num)/sum(studying_student_count)as decimal(10,4))*100,'%')as mor_truant_amount_rate,
sum(after_truant_num)as after_truant_amount,
concat(cast(sum(after_truant_num)/sum(studying_student_count)as decimal(10,4))*100,'%')as after_truant_amount_rate,
sum(eve_truant_num)as eve_truant_amount,
concat(cast(sum(eve_truant_num)/sum(studying_student_count)as decimal(10,4))*100,'%')as eve_truant_amount_rate,
t1.yearinfo,
'-1'as monthinfo
from edu_attend_dws.edu_attendence_dws t1
join edu_attend_dws.edu_late_dws t2 on t1.class_id=t2.class_id
join edu_attend_dws.edu_leave_dws t3 on t2.class_id=t3.class_id
join edu_attend_dws.edu_truant_dws t4 on t3.class_id=t4.class_id
join edu_attend_dwd.class_studying_student_count_dwd t5 on t4.class_id=t5.class_id
group by t1.class_id,t1.yearinfo,studying_student_count;