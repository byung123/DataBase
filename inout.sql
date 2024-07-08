set @number = 10;

call usp_square(@number);

select @number;

# function 사용하기
select 
	add_number(10, 20);