# 데이터 삽입(DML - INSERT)

select * from student_tb;

# insert into `study`,`student_tb` Database가 use되지 않은 경우
# insert into `stydent_tb`         Database가 use 상태인 경우
insert into student_tb
	(student_id, student_name, phone, email, admission_date)
values
	(0, "김준일", "010-9988-1916", "skjil1218@kakao.com", now());
    
insert into student_tb
	(student_id, student_name, phone, email, admission_date)
values
	(0, "김준이", "010-9988-1916", "skjil1218@kakao.com", now()),
	(0, "김준삼", "010-9988-1916", "skjil1218@kakao.com", now()),
	(0, "김준사", "010-9988-1916", "skjil1218@kakao.com", now());
    
insert into student_tb
	(student_id, student_name, phone, email, introduce, admission_date)
values
	(0, "김준일", "010-9988-1916", "skjil1218@kakao.com", null, now());
    
insert into student_tb
	(student_id, phone, email, introduce, student_name, admission_date)
values
	(0, "010-9988-1916", "skjil1218@kakao.com", null, "김준오", now());
    
insert into student_tb
	(student_id, phone, email, introduce, student_name, admission_date)
values
	(0, "010-9988-1916", "skjil1218@kakao.com", null, "김준육", now());
    
insert into student_tb
values
	(0, "김준칠", "010-9988-1916", "skjil1218@kakao.com", null, now());
    
insert into car_tb
	(번호, 모델명, 색상, 제조년원일, 회사)
values
	(0, "sonata", "black", now(), "현대");
    
select * from car_tb;    
