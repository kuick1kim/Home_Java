create Table sample_table2
            (product_id number primary key,
            product_name varchar2(30),
            menu_date date);
            
            
drop table 판매테이블2;
commit;
            
            
            
insert into sample_table2 values (4, ' 멕시카나', to_date ('210803','yymmdd'));
insert into sample_table2 values (5, '떡볶이 주는 족발', to_date ('210803','yymmdd'));
insert into sample_table2 values (6, '떡볶이 주는 족발', to_date ('210803','yymmdd'));

commit;

insert into sample_table (department_id, department_name, manager_id, location_id)
values (1, '맛있는BHC치킨',2021-08-13);



create Table 판매테이블
            (거래처 varchar2(30),
            품목 varchar2(30) PRIMARY KEY (포도,배,사과),
            매입가 number,
            판매가 number,
            판매량 number,
            판매이익금 number);
            
insert into 판매테이블 values ('대구상회', '포도' , 2500, 4500, 150, 300000);
insert into 판매테이블 values ('대구상회', '배' , 7480, 8800, 320, 422400);
insert into 판매테이블 values ('대구상회', '포도' , 3824, 4500, 280, 189000);
insert into 판매테이블 values ('대구상회', '포도' , 3100, 3500, 340, 136000);
insert into 판매테이블 values ('충청상회', '사과' , 5780, 6800, 200, 204000);
insert into 판매테이블 values ('충청상회', '포도' , 3867, 4550, 250, 170750);



대구 상회의 총 판매 이익금

sum

사과의 총 판매수량

select *
from 판매테이블;
SELECT SUM(MONEY) FROM TABLE ;




판매이익금을 sum을하기 대구상회만

select sum(판매이익금)
from 판매테이블
where 거래처 = '대구상회';




판매량을 sum하기 포도부분만
--포도 판매량
select sum(판매량)
    from 판매테이블
    where 품목  ='포도';
    
    
    
판매가가 3000 이상 6000이하 목록    
전체를 보여줌 /판매테이블에서
판매가가 3000원 이상과 and 6000원 이하만

select *
    from 판매테이블 
    where 판매가 >= 3000
    and 판매가 <=6000;
    
    
    
    ======  판매월을 넣음=====
alter table 판매테이블 add 판매월 NVARCHAR2(20) null;
판매월에서 변수를 바꿈===6번== 
매입가가 숫자가 다르므로  1월을  2번 넣어주고
2월을 4번 넣어줌 6번을 작업을함
    
update 판매테이블
set 판매월 = '2월'
where 매입가 = '3867';


전체를 선택해서
판매월 1월만 보여달라고 명령을 내림

select *
    from 판매테이블 
    where 판매월 = '1월';

    
CREATE TABLE 판매테이블2
    (품목 VARCHAR(20),
    CONSTRAINT pk_fruit_name PRIMARY KEY(품목));

 

INSERT INTO 판매테이블2 VALUES('포도');

INSERT INTO 판매테이블2 VALUES('사과');

INSERT INTO 판매테이블2 VALUES('배');

 

ALTER TABLE 판매테이블 ADD CONSTRAINT 품목 FOREIGN KEY(판매테이블2) REFERENCES fruit_names(판매테이블2);
    
    
    
    
    
열을 추가 하는 방법

Alter table sample_table2 Add (factory varchar(10));

열이름을 변경하는것

Alter table sample_table2 rename column factory to factory1;

열을 삭제하는것

Alter table sample_table2 drop column factory1;


--테이블 내용을 삭제해버림 테이블은 놔둠

commit;

--커밋하기 ================
truncate table sample_table2;


--테이블 자체를 지워버림===================
rollback;
drop table sample_table2;

drop table 판매테이블2;


--
--가상 테이블 만들기 실제는 아니지만 가상으로 만드는것임    
--
--1. 심플뷰 하나의 테이블
--2. 컴플렉스뷰 여러테이블
--3. 인라인뷰 1회용뷰


select

employees 테이블과 emp_details_view 로 조인하여
employee_id 가 100인 직원의 
employee_id, hire_date, department_name, job_title
    
    ;
select*
from employees
where employee_id == 100 ;
 a.employee_id,  a.hire_date, B.department_name, b.job_title

select  a.employee_id,  a.hire_date, B.department_name, b.job_title
from employees a, emp_details_view b
where a.employee_id = b.employee_id
and a.employee_id = 100;

