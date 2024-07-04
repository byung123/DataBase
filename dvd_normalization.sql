select
	registration_number,
    count(*) as p
from
	dvd_tb
group by
	registration_number;
    
select
	database_date
from
	dvd_tb;

insert into dvd_producer_tb
select 
	0,
	dvd_producer
from
	dvd_tb
group by
	dvd_producer;
    
delete
from
	dvd_producer_tb;

select * from dvd_producer_tb;

insert into dvd_publisher_tb
select
	0,
    publisher
from
	dvd_tb
group by
	publisher;
    
select * from dvd_publisher_tb;

insert into dvd_publiscation_tb
select
	0,
    dvd_publiscation_year
from
	dvd_tb
group by
	dvd_publiscation_year
order by
	dvd_publiscation_year;

select * from dvd_publiscation_tb;

insert into dvd_information_tb
select
	registration_number,
    title,
    database_date
from
	dvd_tb;
    
select * from dvd_information_tb;

update 
	dvd_tb as d
    left outer join dvd_information_tb as t on(t.registration_number = d.registration_number)
    left outer join dvd_producer_tb as p on(p.producer_name = d.dvd_producer)
    left outer join dvd_publiscation_tb as r on(r.publishscation_year = d.dvd_publiscation_year)
    left outer join dvd_publisher_tb as g on(g.publisher_name = d.publisher)
set
	d.dvd_producer = p.producerID,
	d.publisher = g.publisherID,
	d.dvd_publiscation_year = r.publiscationID;
    
    


    
