employees 테이블에서 employ id가 10 이상인 직원에 대해
job_id별 그룹화 하여 job_id별 총 급여와 job_id별 
평균 급여를 구하되
job_id볅 급여가 30000보다 큰 값만 출력하되 출력 결과는 
job_id 별 총 급여를 기준으로 내림차순 정렬 

select job_id 직무, sum(salary) 직무별_총급여, avg(salary) 직무별_평균급여
from employees
where employee_id >= 10
Group by job_id
Having Sum(salary)> 30000
order by 직무별_총급여 desc, 직무별_평균급여;

=====이것은 전체에서 직무별로 그룹을 나눈다, 그걸 직무별로 합치고 직무별로 평균을 낸다
from employees 모든테이블
전체 테이블에서 10번 아이디 이상만 뽑는다
그리고 그룹을 job_id로 그룹을 만든다
Having Sum 월급을 30000원 이상인 것만 한다
오더를 내림차순으로, 한다
--============================================

select A.first_name, A.last_name, B.*
from employees A, job_history B
Where B.employee_id = B.employee_id;
And A.employee_id =101;





--================================================

