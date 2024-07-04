SELECT * FROM study.sample_book_tb; 
SELECT * FROM library_tb; 
SELECT * FROM category_tb; 
SELECT * FROM publisher_tb; 
SELECT * FROM book_type_tb; 

# 도서관명, 도서관구분코드, 도서관홈페이지 -> 도서관 정보 : 정규화
# 도서명, 저자명, 국제도서번호, 카테고리, 출판사 -> 도서정보 : 정규화, 중복 제거

# 도서관 정보 테이블 데이터 추출
select
	도서관명,
    도서관구분코드,
    도서관홈페이지
from
	sample_book_tb;
    
# 중복 제거
# insert select -> select로 조회한 데이터들을 library_tb 데이터에 복사 (id는 auto increase기 때매 따로 넣을 필요없음)
insert into library_tb(library_name, library_code, library_url)
select
	도서관명,
    도서관구분코드,
    도서관홈페이지
from
	sample_book_tb
group by    # 중복 데이터가 있을 경우 하나만 보여줌
	도서관명,
    도서관구분코드,
    도서관홈페이지;
    
-- 카테고리 정보 테이블 데이터 추출
insert into category_tb
select
	0,
	카테고리
from 
	sample_book_tb
group by
	카테고리;
    
insert into publisher_tb
select
	0,
	출판사
from
	sample_book_tb
group by
	출판사;
    
insert into book_type_tb
select
	0,
	형식
from
	sample_book_tb
group by
	형식;

select
	도서명,
    저자명,
    출판사,
    `표지주소(URL)`,
    count(*) as cnt
from
	sample_book_tb
group by 
	도서명,
    저자명,
    출판사,
    `표지주소(URL)`;

-- 정규화된 데이터 매칭
update 
	sample_book_tb as sbt
    left outer join library_tb as lt on(lt.library_name = sbt.도서관명)
    left outer join category_tb ct on(ct.category_name = sbt.카테고리)
    left outer join publisher_tb pt on(pt.publisher_name = sbt.출판사)
    left outer join book_type_tb btt on(btt.book_type_name = sbt.형식)
set
	도서관ID = library_id,
    카테고리ID = ct.category_id,
    출판사ID = if(sbt.출판사 = "", null, pt.publisher_id),
    형식ID = btt.book_type_id;
    
insert into book_tb
select
	0,
	도서관ID,
    도서명,
    저자명,
    `국제표준도서번호(ISBN)`,
    카테고리ID,
    출판사ID,
    `표지주소(URL)`,
    형식ID
from
	sample_book_tb;

    
    


    

