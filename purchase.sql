SELECT * FROM purchase_information.구매정보;

select
	구매정보.구매번호,
    상품.상품명,
    사이즈.사이즈,
    색상.색상,
    상태.상태,
    구매자.구매자이름,
    성별.성별
from 
	구매정보 
    left outer join 상품 on(상품.상품번호 = 구매정보.상품번호)
    left outer join 사이즈 on(사이즈.사이즈번호 = 상품.사이즈번호)
    left outer join 색상 on(색상.색상번호 = 상품.색상번호)
    left outer join 상태 on(상태.상태번호 = 구매정보.상태번호)
    left outer join 구매자 on(구매자.구매자번호 = 구매정보.구매자번호)
    left outer join 성별 on(성별.성별번호 = 구매자.성별번호);
    
    