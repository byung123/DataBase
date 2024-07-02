# group by - 그룹
# 집계 -> count, max, min, sum, avg

select
	admission_date,
	count(*)
from
	student_tb
group by
	admission_date;
    