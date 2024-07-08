# view(뷰) 가상 테이블 : 테이블의 상태를 저장?하는 용도

create view dvd_view as 
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
    left outer join publisher_tb pbt on(pbt.publisher_id = dt.publisher_id);
    
select
	*
from
	dvd_view
where
	producer_id = 10;