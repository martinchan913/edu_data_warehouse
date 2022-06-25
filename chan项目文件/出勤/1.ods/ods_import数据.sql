show create table teach.class_studying_student_count;
show create table teach.calendar;
show create table teach.course_table_upload_detail;
show create table teach.student_leave_apply;
show create table teach.tbh_class_time_table;
show create table teach.tbh_student_signin_record;

1、日历表
/usr/bin/sqoop import "-Dorg.apache.sqoop.splitter.allow_text_splitter=true" \
--connect 'jdbc:mysql://hadoop01:3306/teach?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true' \
--username root \
--password 123456 \
--query "select
id,
datelist
from calendar where 1=1 and  \$CONDITIONS" \
--hcatalog-database edu_attend_ods \
--hcatalog-table calendar_ods \
-m 1

2、班级学生人数表
/usr/bin/sqoop import "-Dorg.apache.sqoop.splitter.allow_text_splitter=true" \
--connect 'jdbc:mysql://hadoop01:3306/teach?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true' \
--username root \
--password 123456 \
--query "select
id,
school_id,
subject_id,
class_id,
studying_student_count,
studying_date,
'2022-06-16'as dt
from class_studying_student_count where 1=1 and  \$CONDITIONS" \
--hcatalog-database edu_attend_ods \
--hcatalog-table class_studying_student_count_ods \
-m 1

3、课程详情表
/usr/bin/sqoop import "-Dorg.apache.sqoop.splitter.allow_text_splitter=true" \
--connect 'jdbc:mysql://hadoop01:3306/teach?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true' \
--username root \
--password 123456 \
--query "select
id,
base_id,
class_id,
class_date,
content,
teacher_id,
teacher_name,
job_number,
classroom_id,
classroom_name,
is_outline,
class_mode,
is_stage_exam,
is_pay,
tutor_teacher_id,
tutor_teacher_name,
tutor_job_number,
is_subsidy,
answer_teacher_id,
answer_teacher_name,
answer_job_number,
remark,
create_time,
'2022-06-16'as dt
from course_table_upload_detail where 1=1 and  \$CONDITIONS" \
--hcatalog-database edu_attend_ods \
--hcatalog-table course_table_upload_detail_ods \
-m 1
4、学生请假表
/usr/bin/sqoop import "-Dorg.apache.sqoop.splitter.allow_text_splitter=true" \
--connect 'jdbc:mysql://hadoop01:3306/teach?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true' \
--username root \
--password 123456 \
--query "select
id,
class_id,
student_id,
audit_state,
audit_person,
audit_time,
audit_remark,
leave_type,
leave_reason,
begin_time,
begin_time_type,
end_time,
end_time_type,
days,
cancel_state,
cancel_time,
old_leave_id,
leave_remark,
valid_state,
create_time,
'2022-06-16'as dt
from student_leave_apply where 1=1 and  \$CONDITIONS" \
--hcatalog-database edu_attend_ods \
--hcatalog-table student_leave_apply_ods \
-m 1
5、课程时间表
/usr/bin/sqoop import "-Dorg.apache.sqoop.splitter.allow_text_splitter=true" \
--connect 'jdbc:mysql://hadoop01:3306/teach?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true' \
--username root \
--password 123456 \
--query "select
id,
class_id,
morning_template_id,
morning_begin_time,
morning_end_time,
afternoon_template_id,
afternoon_begin_time,
afternoon_end_time,
evening_template_id,
evening_begin_time,
evening_end_time,
use_begin_date,
use_end_date,
create_time,
create_person,
remark,
'2022-06-16'as dt
from tbh_class_time_table where 1=1 and  \$CONDITIONS" \
--hcatalog-database edu_attend_ods \
--hcatalog-table tbh_class_time_table_ods \
-m 1
6、学生签到表
/usr/bin/sqoop import "-Dorg.apache.sqoop.splitter.allow_text_splitter=true" \
--connect 'jdbc:mysql://hadoop01:3306/teach?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true' \
--username root \
--password 123456 \
--query "select
id,
normal_class_flag,
time_table_id,
class_id,
student_id,
signin_time,
signin_date,
inner_flag,
signin_type,
share_state,
inner_ip,
'2022-06-16'as dt
from tbh_student_signin_record where 1=1 and  \$CONDITIONS" \
--hcatalog-database edu_attend_ods \
--hcatalog-table tbh_student_signin_record_ods \
-m 1