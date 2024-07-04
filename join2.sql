# from -> where -> group by -> select -> having -> order by -> limit 순서로 동작

insert into dvd_tb 
select
	0,
    등록번호,
    제목,
    제작자,
	pdt.producer_id,
    발행년,
    데이터기준일자
from
	sample_dvd_tb sdt
    left outer join producer_tb pdt on(pdt.producer_name = sdt.제작자)
    left outer join publisher_tb pbt on(pbt.publisher_name = sdt.발행자);
    
-- where 조건을 할 때 master table 기준으로 작성
select 
	dt.dvd_id,
    dt.registration_number,
    dt.title,
    dt.producer_id,
    pdt.producer_name,
    dt.publisher_id,
    pbt.publisher_name,
    dt.publication_year,
    dt.database_date
from
	dvd_tb dt
    left outer join producer_tb pdt on(pdt.producer_id = dt.producer_id)
    left outer join publisher_tb pbt on(pbt.publisher_id = dt.publisher_id)
limit 10, 10; -- limit(index시작번호, 시작 인덱스부터 나타낼 개수) - 지정한 개수만큼 자료를 보여줌.