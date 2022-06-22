use scrm_bi;

create table itcast_attendence(
time_str varchar(30) comment '时间',
class_id int ,
attendence_amount int comment '出勤总人数',

mor_attend_amount int comment '早上出勤总人数',
mor_attend_amount_rate varchar(30) comment'早上出勤率',
after_attend_amount int comment '下午出勤总人数',
after_attend_amount_rate varchar(30) comment '下午出勤率',
eve_attend_amount int comment '晚上出勤总人数',
eve_attend_amount_rate varchar(30) comment '晚上出勤率',

mor_late_amount int comment '早上迟到总人数',
mor_late_amount_rate varchar(30) comment'早上迟到率',
after_late_amount int comment '下午迟到总人数',
after_late_amount_rate varchar(30) comment '下午迟到率',
eve_late_amount int comment '晚上迟到总人数',
eve_late_amount_rate varchar(30) comment '晚上迟到率',

mor_leave_amount int comment '早上请假总人数',
mor_leave_amount_rate varchar(30) comment'早上请假率',
after_leave_amount int comment '下午请假总人数',
after_leave_amount_rate varchar(30) comment '下午请假率',

mor_truant_amount int comment '早上旷课总人数',
mor_truant_amount_rate varchar(30) comment'早上旷课率',
after_truant_amount int comment '下午旷课总人数',
after_truant_amount_rate varchar(30) comment '下午旷课率',
eve_truant_amount int comment '晚上旷课总人数',
eve_truant_amount_rate varchar(30) comment '晚上旷课率'
)comment '出勤总需求';

/usr/bin/sqoop export "-Dorg.apache.sqoop.splitter.allow_text_splitter=true" \
--connect 'jdbc:mysql://hadoop01:3306/scrm_bi?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true' \
--username root \
--password 123456 \
--table itcast_attendence \
--hcatalog-database edu_attend_dm \
--hcatalog-table edu_attendence_dm \
-m 1