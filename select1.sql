# 데이터 조회(DML - SELECT) - 조회하는 여러가지 방법

select * from student_tb;
SELECT `student_id`, `student_name`, `phone`, `email`, `introduce`, `admission_date` from `study`.`student_tb`;
SELECT student_id, student_name, phone, email, introduce, admission_date from `study`.`student_tb`;
SELECT student_id, student_name, phone, email, introduce, admission_date from `student_tb`;
SELECT student_id, student_name, phone, email, introduce, admission_date from student_tb;
select student_id, student_name from student_tb;
select student_name, student_id from student_tb;
select student_id, student_name as s_name from student_tb;

select 1;
select 1 as number;
select 1 as number, "김준일" as name;
select 1 as number, "김준일" as name, 31 as age;  # 그러나 밑으로 값을 추가하는 건 안됨

#합치기 - 밑에 값을 추가
select 1 as number, "김준일" as name, 31 as age
union all
select 1 as number, "김준이" as name, 32 as age
union all
select 1 as number, "김준이" as name, 32 as age;

# union all -> 중복제거 없이 select 결과 병합
# union -> 중복 제거 후 select 결과 병합
# union(all) 병합 조건 -> 컬럼의 개수와 자료형이 동일한 select 결과만 병합 가능 
select 1 as number, "김준일" as name, 31 as age
union
select 1 as number, "김준이" as name, 32 as age
union
select 1 as number, "김준이" as name, 32 as age;


# 컬럼 수와 자료형이 같으므로 합쳐짐
select student_id, student_name from student_tb
union all
select student_id, phone from student_tb;

# 간단한 서브 쿼리 예시
select 
	number, 
    name
from
	(select 1 as number, "김준일" as name, 31 as age
	union all
	select 1 as number, "김준이" as name, 32 as age
	union all
	select 1 as number, "김준이" as name, 32 as age) as temp_tb;