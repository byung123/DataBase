-- order by - 정렬

# desc : 내림차순
# asc : 오름차순(default)(생략 가능)
select
	*
from
	category_tb
order by
	category_id desc;

# 문제 - 출판사 id 값을 내립차순 한채로 그 안에 category_id를 오름차순으로 정렬해보아라
select
	*
from
	book_tb
order by
	publisher_id desc,
    category_id,
    book_id desc; # 이건 그냥 넣은것
    
    