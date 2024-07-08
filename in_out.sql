set @total = 0;
call usp_mod_score("이병안", 90, 70, 80, @total); # 정상 작동

call usp_mod_score("이병안", 90, "a", 80, @total); # 오류나 경고메세지가 발생 -> 롤백 설정한 대로 데이터가 그대로 보존

select @total;