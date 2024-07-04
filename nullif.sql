insert into publisher_tb(publisher_name)
select
	발행자
from
	sample_dvd_tb
group by
	발행자;
    
-- 비어있는 값이 있음
select * from publisher_tb;

-- nullif : 빈 값(공백)이 있던 칸을 null로 바꿔줌 ( 두 값이 같으면 null로 바꿔라 )
-- ifnull : 만약에 null이면 뒤에 내가 지정한 값으로 추가해라라는 뜻
-- insert into publisher_tb(publisher_name) 
select
	-- 발행자,
	nullif(발행자, "")
    -- ifnull(nullif(발행자,""), "발행자없음"),
    -- ifnull(nullif(replace(발행자, " ", ""),""), "발행자없음") -- 띄어쓰기 있는 공백인 경우
from
	sample_dvd_tb
group by
	발행자
having
	nullif(발행자, "") is not null;

insert into publisher_tb(publisher_name)
select
	nullif(발행자, "") as publisher_name
from
	sample_dvd_tb
group by
	발행자
having
	publisher_name is not null;
