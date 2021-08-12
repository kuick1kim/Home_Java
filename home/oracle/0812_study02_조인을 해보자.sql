

select A.first_name, A.last_name, B.*
from employees A, job_history B
Where a.employee_id = B.employee_id
And A.employee_id =101;

=====employee와 DEPARTMENTS 를 조인해서 알아봄



--======employee 테이블과 Departments테이블과 locations테이블을 조인하여 각직원이
--어느 부서에 속하는지와 분서의 소재지가 어디인지 조회 할것







select *
from employees A, departments B
Where a.employee_id = b.department_id;




--======employee 테이블과 Departments테이블과 locations테이블을 조인하여 각직원이
--어느 부서에 속하는지와 분서의 소재지가 어디인지 조회 할것
select a.employee_id, a.department_id, b.department_name, c.location_id, c.city
from employees a, departments b, locations c
where a.department_id = b.department_id
and b.location_id =c.location_id;



select *
from employees;

select *
from departments;

select *
from LOCATIONS;




select count(*)
from employees A, departments B
where a.department_id = b.department_id;

select *
from employees A, departments B
where a.department_id = b.department_id;




employees테이블과 departments테이블을
department_id로 외부 조인하여
id 가 null인 값을 kimberely grant도 함께 출력

select a.employee_id, a.first_name, a.last_name, b.department_id, b.department_name
from employees A, departments B
where a.department_id = b.department_id
order by a.employee_id;

============(+) 더하기를 하면 null 값을 볼 수 있다. =====
==========(+)더하기를 지우면 null값을 볼 수 없다. =======




=========자체 호출로 자체를 알아보는 가격===================
select a.employee_id, a.first_name, a.last_name, a.manager_id,
        b.first_name||' '||b.last_name manager_name
from employees A, employees B
where a.manager_id = b.employee_id
order by a.employee_id;




=====테이블을 결합시에 중복을 제외하는 방법 =======

select department_id
from employees
union
select department_id
from departments;

--=====테이블의 department_id 만 합친것==========
--
--
--==== 중복을 포함할 경우====================


select department_id
from employees
union all
select department_id
from departments
order by department_id desc;

--(asc / desc)
--====== order by를 통해서 순서별로 정열========




select department_id
from employees
intersect
select department_id
from departments
order by department_id desc;

--교집합을 볼때 intersect=====




--=====차집합 ======
select department_id
from employees
minus
select department_id
from departments
order by department_id desc;





==서브 쿼리 셀렉트 안에 셀렉트===