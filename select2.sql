# where - 조건

# 단순 비교 연산
select
	*
from
	student_tb
where
	student_name = "김준일";
    
# or 연산
select
	student_id,
    student_name
from
	student_tb
where
	student_name="김준일"
    or student_name= "김준이";

# and 연산
select
	*
from
	student_tb
where
	student_id > 2
    and student_id < 4;
    
# in 연산 => or와 비슷함
select
	*
from 
	student_tb
where
	student_name in ("김준일", "김준이", "김준삼");

# between 연산 => and와 비슷 그러나 이상 이하만을 취급한다
select
	*
from
	student_tb
where
	student_id between 2 and 4;
	
# not 연산
select
	*
from
	student_tb
where
	not student_name = "김준일";
    # student_name != "김준일"; 로 해도 되지만 database에선 이렇게 쓰지 않고 앞에 not을 붙이는 형태로 사용하는 것을 선호한다.

select 
	*
from
	student_tb
where
	introduce is null;

# null 체크
# is null 긍정
# is not null 부정
select 
	*
from
	student_tb
where
	introduce is not null;
    
insert into student_tb
values
		(0, "손경태", "010-1111-2222", "aaa@gmail.com", null, now()),
		(0, "김지현", "010-1111-3333", "bbb@naver.com", null, now()),
		(0, "김홍인", "010-2222-2222", "ccc@gmail.com", null, now()),
		(0, "김정현", "010-4444-3333", "aaabbb@naver.com", null, now()),
		(0, "권오중", "010-5555-2222", "bbbccc@kakao.com", null, now()),
		(0, "권혁진", "010-1111-5555", "aaabbbccc@kakao.com", null, now());

# 와일드카드(like)
select
	*
from 
	student_tb
where
	student_name like "김%";
    
select
	*
from
	student_tb
where
	email like "%gmail.com";
    
## 문제 - 중간에만 2222번호 있는 데이터 뽑아내기
select
	*
from
	student_tb
where
	phone like "%2222%"
    and not phone like "%2222";

# 중간에 bbb가 있는 이메일을 찾아라
# _는 글자 한 칸을 차지한다
select
	*
from
	student_tb
where
	email like "___bbb%";



