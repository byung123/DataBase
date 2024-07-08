# 트랜잭션(Transaction)

set @name = "김준일"; -- @ : 변수 지정하는 문자alter 

select @@autocommit; -- @@ : 전역 setting 

select @name;

set autocommit = 0;

-- 프로그램 껐다 키면 데이터가 사라진다 -> 저장하고 싶으면 commit; 명령어를 줘야 데이터가 계속 남아있음 
insert into master_tb
value
	(0, 6, 1);
commit;




# rollbacj을 하게되면 start transaction 다시 실행
start transaction; # {

set @name = "권혁진";   # 예약어라 파란색으로 표시가 되는데 웬만하면 예약어를 변수로 사용하지 말아야한다
set @phone = "010-6666-8888";

savepoint sp_insert_name;
insert into join1_tb
values(0, @name);

savepoint sp_insert_phone;	
insert into  join2_tb
values(0, @phone);

rollback;
rollback to sp_insert_phone;

set @new_join1_id = 0;
set @new_join2_id = 0;

select
	join1_id into @new_join1_id
from
	join1_tb
order by
	join1_id desc
limit 0, 1; # id 값 제일 큰 녀석을 불러옴

select @new_join1_id; # 저장된거 확인

select
	join2_id into @new_join2_id
from
	join2_tb
order by
	join2_id desc
limit 0, 1;

select @new_join2_id;

insert into master_tb
values 
	(0, @new_join1_id, @new_join2_id);
    
commit; # commit이 되는 지점까지가 한 트랜잭션의 단위이다.
