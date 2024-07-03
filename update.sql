# 데이터 수정(DML - UPDATE)

select * from student_tb;

select
	student_id
from
	student_tb
where
	student_name = "김준오";

# 서브 쿼리 결과값이 여러개라면 in을 사용해야 함
# 업데이트 하려는 테이블과 바로 직속 서브 쿼리에서 사용하는 테이블이 같으면 실행이 안됨
update 
	student_tb
set
	email = "skji1121@gmail.com"
where
	student_id in (select
					  student_id
				   from
					  student_tb
				   where
					  student_name = "김준오");
      
# 이렇게 해야한다. from 테이블과 지속 서브 쿼리 테이블의 이름을 다르게 설정함 
update 
	student_tb
set
	email = "skji1121@gmail.com"
where
	student_id in (select
					  temp_student_tb.student_id
				   from
					  (select * from student_tb) as temp_student_tb
				   where
					  temp_student_tb.student_name = "김준오");

update
	student_tb
set
	phone = "010=1234-4321",
    email = "skji1121@naver.com"
where
	student_id = 3;