-- Group by 집계, 중복제거

# distinct - 중복된 것을 제거해서 결과를 나오게 함, 
# distinct에 2개 이상의 인자가 오면 둘 조합으로 나오는 것들 중 중복된것을 제거한 채로 출력

select
	distinct 
    category_id,
    publisher_id
from
	book_tb;
    
select
	category_id,
    count(*)
from
	book_tb
where
	book_id > 7000
group by
	category_id;
    
-- 문제 도서명 중 '돈'이라는 글자가 들어간 데이터들을 찾아 카테고리별로 묶으시오. 
-- 그리고 카테고리 별로 도서 개수가 출력되어야한다.
select
	category_id,
    count(*) as 도서개수
from
	book_tb
where
	book_name like "%돈%"
group by
	category_id;
    
select
	*
from
	(select
	category_id,
	count(*) as category_count
    from
		book_tb
	where
		book_name like "%돈%"
	group by
		category_id) as category_group_book_tb
where
	category_count > 10;

# having : 그룹 이후에 그룹의 조건을 설정해줌 -> 순서는 제일 마지막(select 다음으로 마지막에 실행된다)
select
	category_id,
	count(*) as category_count
from
	book_tb
where
	book_name like "%돈%"
group by
	category_id
having
	category_count > 10;

## 이건 왜 안될까??
select
	category_id,
    count(*) as 도서개수
from
	book_tb
where
	book_name like "%돈%"
    and (select
			count(*)
		from
			book_tb as t
		where
			t.book_name like "%돈%"
		group by
			t.category_id) > 10
group by
	category_id;
    

    
    