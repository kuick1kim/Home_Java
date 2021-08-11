
앞에서 두글자 가져오기

select job_id, substr(job_id,1,2)
from employees;
--=====/ job_id 에서 글씨 앞에서 부터 두개만 가져와 /===

--=====특정글자 찾아 바꾸기 ======

--======/15000명 중에서 100명 대리에서 부장으로 바꾸기   /==========

SELECT job_id, replace(job_id, 'account', 'accnt')
FROM employees
--=======특정문자 찾아바꾸기======



--=====/ 특정 문자로 자리 채우기 ==주민등록번호  가릴것이냐 보일것이냐/========


SELECT first_name, LPAD(first_name, 12, '*')
FROM employees;

--========/이번엔 오른쪽 부터 지우고 싶다/=========
SELECT first_name, RPAD(first_name, 12, '*')
FROM employees;

--=========/공백을 제거해보고 싶다(LTRIM--RTRIM)/=========
SELECT job_id, 
    LTRIM(job_id, 'F'), 
    RTRIM(job_id,'K')
FROM employees;


--==========/ TRIM 공백을 제거해보고 싶다/==============

SELECT 'start'||trim('         -space-       ')||'end' 
from dual;




--========숫자타입 실습하기===============
--
--EMPLOyees 테이블에서 salary를  30일로 나눈 값의 소수점
--첫째자리 소수점, 둘째자리 소수점, 정수 첫자리 값의 반올림을 함*/
 
SELECT salary,
            ROUND(salary/30, 0) 적용결과0,
            ROUND(salary/30, 1) 적용결과1,
            ROUND(salary/30, 2) 적용결과2,
            ROUND(salary/30, 3) 적용결과3,
            ROUND(salary/30, -1) 적용결과, 
            ROUND(salary/30, -2) 적용결과 
FROM employees;



===========/날 짜 함수 /===============

select to_char(sysdate, 'yy/mm/dd/hh12:mi'),
    sysdate +1,
    sysdate -1,
    to_date('20171203')-to_date('20171201'),
    sysdate + 1/24
from dual;


============날짜 사이에 계산하는 방법 =======
====1. 날짜 단위를 YYMMDDHH로 나눈것 =====
====2. 하루 더한것 3. 하루 뺀날 오늘에서 ======
====몇일부터 몇일사이 뺀 날짜 계산=========
=== 4. 24시간 중에 몇시간을 더하면 몇일인가


select sysdate, hire_date, months_between(sysdate, hire_date)
from employees
where department_id=100;

-------/ 오늘 날부터  고용 날짜까지 


월에다가 날짜를 더하기
select hire_date,
    add_months(hire_date,3),
    add_months(hire_date, -3)
from employees
where employee_id between 100 and 106;



--돌아오는 월의 마지막 날짜 계산
select sysdate,
    add_months(sysdate, 1)
from employees;


select hire_date,
    last_day(hire_date)
from employees
where employee_id between 100 and 106;





