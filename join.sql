insert into join1_tb
values
	(0, "정령우"),
	(0, "백승주"),
	(0, "김정현"),
	(0, "김유진"),
	(0, "정찬역");
    
insert into join2_tb
values
	(0, "010-1111-1111"),
	(0, "010-2222-2222"),
	(0, "010-3333-3333"),
	(0, "010-4444-4444"),
	(0, "010-5555-5555");
    
insert into master_tb
values
	(0,1,1),
	(0,1,2),
	(0,1,3),
	(0,2,1),
	(0,2,2),
	(0,3,3),
	(0,4,4),
	(0,5,5),
	(0,5,1);
    
select * from join1_tb;
select * from join2_tb;
select * from master_tb;

-- 각 테이블을 합치기 (join)
select
	*
from
	master_tb
    inner join join1_tb on(join1_tb.join1_ID = 2);
    
-- inner join은 왼쪽도 참이고, 오른쪽도 참인 경우에만 나온다
-- inner join에선 ID= 0 인것이 없기 때문에 출력 되지 않지만, left outer join하면 결과가 나오긴한다.
-- outer left join는 왼쪽의 테이블에 오른쪽 테이블을 붙이라는 뜻
select
	*
from
	master_tb
    left outer join join1_tb on(join1_tb.join1_ID = master_tb.name_id and join1_tb.join1_ID < 4);
    
select
	*
from
	master_tb
    inner join join1_tb on(join1_tb.join1_ID = master_tb.name_id and join1_tb.join1_ID = 4);
    
select
	*
from
	master_tb mst
    left outer join join1_tb jt1 on(jt1.join1_ID = mst.name_id and jt1.join1_ID < 4)
    left outer join join2_tb jt2 on(jt2.join2_ID = mst.phone_id);
    
    
    
    
    
    
    
    