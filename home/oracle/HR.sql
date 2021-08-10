select*from employees;

select employee_id, first_name from employees;

select employee_id, first_name 
from employees
ORDER by employee_id DESC;


SELECT DISTINCT job_id FROM employees;
--중복 안나오게
--주석
--별칭사용


SELECT employee_id as 사원번호, first_name as 이름, last_name as 성 from employees;

SELECT employee_id 사원번호, first_name 이름,
last_name  성 from employees;
--

--필드 연결하는 방법
select employee_id, first_name ||last_name
from employees;
--이름이 붙어 버림

--7) 필드 연결 2
select employee_id, first_name ||'-'||last_name,
    email||'@'||'company.com'
from employees;



--산술

select employee_id , 
        salary  , 
        salary+500  , 
        salary-100 ,
        (salary*1.1)/2 
from employees;

select employee_id as 사원번호,
        salary as 급여, 
        salary+500 as 추가급여, 
        salary-100 as 인하급여,
        (salary*1.1)/2 as 조정급여
from employees;







--where 조건

--where 

select * from employees
where employee_id = 100;

--중복 이름 찾기

select * from employees
where first_name = 'David';

-- 중복 성 찾아라
select * from employees
where last_name = 'King';

--관계 연산자 
SELECT *
FROM employees
WHERE employee_id >=105;

SELECT *
FROM employees
WHERE salary <= 3000 
ORDER by salary DESC;

SELECT *
FROM employees
where salary BETWEEN 10000 and 20000;

--in에 대하여 아래의 정한것만 볼 수 있음

SELECT *
FROM employees
where salary in(10000, 17000, 24000);


SELECT *
FROM employees
where job_id like 'AD%';

--특별히 어떤 데이터를 뽑아낼때 좋다
--충청도사람 아이디가 김씨 아이디가 C로 시작하는 사람

SELECT *
FROM employees
where FIRST_name like 'J%';

데이터 값이 null인것을 찾아내는것

SELECT *
FROM employees
where manager_id IS NULL;

--IS NULL로 해야한다 앞에것을 지워야함


--관계및 논리 연산자 
SELECT *
FROM employees
where salary >4000 AND job_id = 'IT_PROG';


--연산관리

SELECT *
FROM employees
WHERE salary >4000
AND JOB_ID ='IT_PROG'
OR JOB_ID = 'FI_ACCOUNT';

ㅇㅇㅇㅇ을 제외하고 뽑아낼때

SELECT *
FROM employees
WHERE employee_id <> 105;

--nuLL제외하는법

SELECT *
FROM employees
WHERE manager_id IS NOT NULL;

SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;