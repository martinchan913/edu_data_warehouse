-- class_studying_student_count
-- course_table_upload_detail
-- student_leave_apply
-- tbh_class_time_table
-- tbh_student_signin_record
drop database edu_attend_ods cascade ;

create database edu_attend_ods;
--建表
--todo ods层
create database edu_attend_ods;

CREATE TABLE edu_attend_ods.class_studying_student_count_ods(
  id int  COMMENT '主键' ,
  school_id int  COMMENT '校区id',
  subject_id int  COMMENT '学科id',
  class_id  int  COMMENT '班级id',
  studying_student_count int  COMMENT '在读班级人数',
  studying_date string  COMMENT '在读日期'
)
comment '班级学生人数表'
partitioned by(dt string)
row format delimited fields terminated by '\t'
stored as orc
location 'hdfs://hadoop01:8020/user/hive/warehouse/edu_attend_ods.db/class_studying_student_count_ods'
TBLPROPERTIES('orc.compress'='SNAPPY' );


CREATE TABLE edu_attend_ods.`calendar_ods` (
  `id` int  COMMENT '主键',
  `datelist` string
)COMMENT '时间表'
row format delimited fields terminated by '\t'
stored as orc
tblproperties ('orc.compress' = 'ZLIB');

create table edu_attend_ods.course_table_upload_detail_ods(
  `id` int  COMMENT 'id',
  `base_id` int  COMMENT '课程主表id',
  `class_id` int COMMENT '班级id',
  `class_date` string  COMMENT '上课日期',
  `content` string COMMENT '课程内容',
  `teacher_id` int COMMENT '老师id',
  `teacher_name` string COMMENT '老师名字',
  `job_number` string COMMENT '工号',
  `classroom_id` int COMMENT '教室id',
  `classroom_name` string COMMENT '教室名称',
  `is_outline` int COMMENT '是否大纲 0 否 1 是',
  `class_mode` int COMMENT '上课模式 0 传统全天 1 AB上午 2 AB下午 3 线上直播',
  `is_stage_exam` int COMMENT '是否阶段考试（0：否 1：是）',
  `is_pay` int COMMENT '代课费（0：无 1：有）',
  `tutor_teacher_id` int COMMENT '晚自习辅导老师id',
  `tutor_teacher_name` string COMMENT '辅导老师姓名',
  `tutor_job_number` string COMMENT '晚自习辅导老师工号',
  `is_subsidy` int COMMENT '晚自习补贴（0：无 1：有）',
  `answer_teacher_id` int COMMENT '答疑老师id',
  `answer_teacher_name` string COMMENT '答疑老师姓名',
  `answer_job_number` string COMMENT '答疑老师工号',
  `remark` string COMMENT '备注',
  `create_time` string COMMENT '创建时间'
)comment '课程详细表'
partitioned by(dt string)
row format delimited fields terminated by '\t'
stored as orc
location 'hdfs://hadoop01:8020/user/hive/warehouse/edu_attend_ods.db/course_table_upload_detail_ods'
TBLPROPERTIES('orc.compress'='SNAPPY' );

drop table edu_attend_ods.student_leave_apply_ods;

CREATE TABLE edu_attend_ods.`student_leave_apply_ods` (
  `id` int COMMENT 'id',
  `class_id` int COMMENT '班级id',
  `student_id` int COMMENT '学员id',
  `audit_state` int COMMENT '审核状态 0 待审核 1 通过 2 不通过',
  `audit_person` int COMMENT '审核人',
  `audit_time` string COMMENT '审核时间',
  `audit_remark` string COMMENT '审核备注',
  `leave_type` int COMMENT '请假类型  1 请假 2 销假',
  `leave_reason` int COMMENT '请假原因  1 事假 2 病假',
  `begin_time` string COMMENT '请假开始时间',
  `begin_time_type` int COMMENT '1：上午 2：下午',
  `end_time` string COMMENT '请假结束时间',
  `end_time_type` int COMMENT '1：上午 2：下午',
  `days` float  COMMENT '请假/已休天数',
  `cancel_state` int COMMENT '撤销状态  0 未撤销 1 已撤销',
  `cancel_time` string COMMENT '撤销时间',
  `old_leave_id` int COMMENT '原请假id，只有leave_type =2 销假的时候才有',
  `leave_remark` string  COMMENT '请假/销假说明',
  `valid_state` int COMMENT '是否有效（0：无效 1：有效）',
  `create_time` string COMMENT '创建时间'
)comment '学生请假表'
partitioned by(dt string)
row format delimited fields terminated by '\t'
stored as orc
location 'hdfs://hadoop01:8020/user/hive/warehouse/edu_attend_ods.db/student_leave_apply_ods'
TBLPROPERTIES('orc.compress'='SNAPPY' );
CREATE TABLE edu_attend_ods.`tbh_class_time_table_ods`
(
    `id`                    int COMMENT '主键id',
    `class_id`              int COMMENT '班级id',
    `morning_template_id`   int COMMENT '上午出勤模板id',
    `morning_begin_time` string  COMMENT '上午开始时间',
    `morning_end_time` string  COMMENT '上午结束时间',
    `afternoon_template_id` int COMMENT '下午出勤模板id',
    `afternoon_begin_time` string  COMMENT '下午开始时间',
    `afternoon_end_time` string  COMMENT '下午结束时间',
    `evening_template_id`   int   COMMENT '晚上出勤模板id',
    `evening_begin_time` string  COMMENT '晚上开始时间',
    `evening_end_time` string  COMMENT '晚上结束时间',
    `use_begin_date`        string      COMMENT '使用开始日期',
    `use_end_date`          string      COMMENT '使用结束日期',
    `create_time`           string COMMENT '创建时间',
    `create_person`         int COMMENT '创建人',
    `remark`                string COMMENT '备注'
)
comment '课程时间表'
partitioned by(dt string)
row format delimited fields terminated by '\t'
stored as orc
location 'hdfs://hadoop01:8020/user/hive/warehouse/edu_attend_ods.db/tbh_class_time_table_ods'
TBLPROPERTIES('orc.compress'='SNAPPY' );

CREATE TABLE edu_attend_ods.`tbh_student_signin_record_ods`
(
    `id`                int COMMENT '主键id',
    `normal_class_flag` int COMMENT '是否正课 1 正课 2 自习',
    `time_table_id`     int COMMENT '作息时间id 关联tbh_school_time_table 或者 tbh_class_time_table',
    `class_id`          int COMMENT '班级id',
    `student_id`        int COMMENT '学员id',
    `signin_time`       string COMMENT '签到时间',
    `signin_date`       string      COMMENT '签到日期',
    `inner_flag`        int COMMENT '内外网标志  0 外网 1 内网',
    `signin_type`       int COMMENT '签到类型 1 心跳打卡 2 老师补卡',
    `share_state`       int COMMENT '共享屏幕状态 0 否 1是  在上午或下午段有共屏记录，则该段所有记录该字段为1，内网默认为1 外网默认为0 ',
    `inner_ip`          string COMMENT '内网ip地址'
)comment '学生签到表'
partitioned by(dt string)
row format delimited fields terminated by '\t'
stored as orc
location 'hdfs://hadoop01:8020/user/hive/warehouse/edu_attend_ods.db/tbh_student_signin_record_ods'
TBLPROPERTIES('orc.compress'='SNAPPY' );

