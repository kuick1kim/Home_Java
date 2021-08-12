SELECT A.employee_id, A.hire_date, B.department_name, B.job_title
FROM  employees A, emp_details_view B
WHERE A.employee_id = B.employee_id
AND   A.employee_id = 100; 


--하나의 행을 검색하는 서브쿼리
--다중행 서브쿼리
--다중열 서브쿼리
--
--서브쿼리의 종류에 따라 사용하는 연산자의 종류
--
--in, not in, exists, any, all



employees 테이블의 last_name 이 Da Haan 인 직원과  salary가 동일한 직원에는
누가 있는지 단일 행 서브쿼리를 이용해서 출력

select *
from employees A
where a.salary = (
                select salary
                from employees
                where last_name = 'De Haan'
);

employees 테이블에서 department _ 아이디별로 가장 낮은 salar가 얼마인지 찾아보고
찾아낸 salary 에 해당하는 직원이 누구인지 다중 행 서브쿼리를 이용해 찾을것

select *
from employees a
where a.salary in(
    select min(salary) 최저급여
    from employees
    group by department_id
)
order by a.salary Desc;






--
--다중열 in

select *
from employees a
where (A.job_id, A.salary) in(
                            select job_id, min(salary) 
                            from employees
                            group by job_id
)
order by a.salary desc;


인라인뷰  inline View 가상 테이블
직원중에ㅓ department_ name 이 IT인 직원의 정보를 인라인 뷰를 사용해 출력

인라인뷰 - 가상테이블

select *
from departments;

select *
from employees;

select *
from employees A,
                (select department_id
                from departments
                where department_name = 'IT' ) B         
                
where a.department_id = b.department_id;




