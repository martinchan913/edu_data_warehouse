#!/bin/bash

SQOOP_HOME=/usr/bin/sqoop

${SQOOP_HOME} import \
--connect jdbc:mysql://hadoop01:3306/scrm \
--username root \
--password 123456 \
--query "select *,
       '2022-06-17' as dt
from scrm.customer
where 1=1 and \$CONDITIONS" \
--hcatalog-database itcast_ods  \
--hcatalog-table customer  \
-m 1

wait

${SQOOP_HOME} import \
--connect jdbc:mysql://hadoop01:3306/scrm \
--username root \
--password 123456 \
--query "select *,
       '2022-06-17' as dt
from scrm.customer_clue
where 1=1  and \$CONDITIONS" \
--hcatalog-database itcast_ods  \
--hcatalog-table customer_clue  \
-m 1

wait

${SQOOP_HOME} import \
--connect jdbc:mysql://hadoop01:3306/scrm \
--username root \
--password 123456 \
--query "select *,
       '2022-06-17' as dt
from scrm.customer_relationship
where 1=1  and \$CONDITIONS" \
--hcatalog-database itcast_ods  \
--hcatalog-table customer_relationship  \
-m 1

wait

${SQOOP_HOME}  import \
--connect jdbc:mysql://hadoop01:3306/scrm \
--username root \
--password 123456 \
--query "select *,
       '2022-06-17' as dt
from scrm.employee
where 1=1  and \$CONDITIONS" \
--hcatalog-database itcast_ods  \
--hcatalog-table employee  \
-m 1

wait

${SQOOP_HOME} import \
--connect jdbc:mysql://hadoop01:3306/scrm \
--username root \
--password 123456 \
--query "select *,
       '2022-06-17' as dt
from scrm.scrm_department
where 1=1  and \$CONDITIONS" \
--hcatalog-database itcast_ods  \
--hcatalog-table scrm_department  \
-m 1

wait

${SQOOP_HOME} import \
--connect jdbc:mysql://hadoop01:3306/scrm \
--username root \
--password 123456 \
--query "select *,
       '2022-06-17' as dt
from scrm.itcast_school
where 1=1  and \$CONDITIONS" \
--hcatalog-database itcast_ods  \
--hcatalog-table itcast_school  \
-m 1

wait

${SQOOP_HOME} import \
--connect jdbc:mysql://hadoop01:3306/scrm \
--username root \
--password 123456 \
--query "select *,
       '2022-06-17' as dt
from scrm.itcast_subject
where 1=1  and \$CONDITIONS" \
--hcatalog-database itcast_ods  \
--hcatalog-table itcast_subject  \
-m 1

sqoop import \
--connect jdbc:mysql://hadoop01:3306/scrm \
--username root \
--password 123456 \
--query "select *,
       '2022-06-17' as dt
from scrm.itcast_clazz
where 1=1  and \$CONDITIONS" \
--hcatalog-database itcast_ods  \
--hcatalog-table itcast_clazz  \
-m 1

sqoop import \
--connect jdbc:mysql://hadoop01:3306/scrm \
--username root \
--password 123456 \
--query "select *,
       '2022-06-17' as dt
from scrm.customer_appeal
where 1=1  and \$CONDITIONS" \
--hcatalog-database itcast_ods  \
--hcatalog-table customer_appeal  \
-m 1