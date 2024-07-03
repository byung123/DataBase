SELECT * FROM study.student_tb;

select
	rank() over(partition by class order by score desc) as `rank`,
    student_tb.*
from
	student_tb;
