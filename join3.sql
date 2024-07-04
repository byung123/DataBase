insert into dvd_register_tb
values
	(0,1, now()),
	(0,1, now()),
	(0,1, now()),
	(0,1, now());
    
-- 똑같은 데이터 3번 나오게 하기
select
	0,
    dvd_id,
    now()
from
	dvd_tb
union all
select
	0,
    dvd_id,
    now()
from
	dvd_tb
union all
select
	0,
    dvd_id,
    now()
from
	dvd_tb
order by
	dvd_id;
    
-- 다른 방법
insert into dvd_register_tb
select
	0,
    db.dvd_id,
    db.database_date
from
	dvd_tb db
    left outer join dvd_tb as tb on(tb.dvd_id < 4)
order by
	db.dvd_id;

select * from dvd_register_tb;

select
	title,
    producer_id,
    publisher_id,
    count(*) as dvd_count
from
	dvd_tb
group by
	title,
    producer_id,
    publisher_id
having
	dvd_count > 1;
    
-- insert into rental_tb
select
	*
from
	rental_tb rt
    left outer join(
				select
					distinct
					0 as rental_id,
					floor(rand() * 3000) + 1 as dvd_id,
					"김준이" as customer_name,
					now() as rental_date
				from
					dvd_tb
				where
					dvd_id < 1001
				order by
					dvd_id) rt2 on(rt2.dvd_id)