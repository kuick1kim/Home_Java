
�տ��� �α��� ��������

select job_id, substr(job_id,1,2)
from employees;
--=====/ job_id ���� �۾� �տ��� ���� �ΰ��� ������ /===

--=====Ư������ ã�� �ٲٱ� ======

--======/15000�� �߿��� 100�� �븮���� �������� �ٲٱ�   /==========

SELECT job_id, replace(job_id, 'account', 'accnt')
FROM employees
--=======Ư������ ã�ƹٲٱ�======



--=====/ Ư�� ���ڷ� �ڸ� ä��� ==�ֹε�Ϲ�ȣ  �������̳� ���ϰ��̳�/========


SELECT first_name, LPAD(first_name, 12, '*')
FROM employees;

--========/�̹��� ������ ���� ����� �ʹ�/=========
SELECT first_name, RPAD(first_name, 12, '*')
FROM employees;

--=========/������ �����غ��� �ʹ�(LTRIM--RTRIM)/=========
SELECT job_id, 
    LTRIM(job_id, 'F'), 
    RTRIM(job_id,'K')
FROM employees;


--==========/ TRIM ������ �����غ��� �ʹ�/==============

SELECT 'start'||trim('         -space-       ')||'end' 
from dual;




--========����Ÿ�� �ǽ��ϱ�===============
--
--EMPLOyees ���̺��� salary��  30�Ϸ� ���� ���� �Ҽ���
--ù°�ڸ� �Ҽ���, ��°�ڸ� �Ҽ���, ���� ù�ڸ� ���� �ݿø��� ��*/
 
SELECT salary,
            ROUND(salary/30, 0) ������0,
            ROUND(salary/30, 1) ������1,
            ROUND(salary/30, 2) ������2,
            ROUND(salary/30, 3) ������3,
            ROUND(salary/30, -1) ������, 
            ROUND(salary/30, -2) ������ 
FROM employees;



===========/�� ¥ �Լ� /===============

select to_char(sysdate, 'yy/mm/dd/hh12:mi'),
    sysdate +1,
    sysdate -1,
    to_date('20171203')-to_date('20171201'),
    sysdate + 1/24
from dual;


============��¥ ���̿� ����ϴ� ��� =======
====1. ��¥ ������ YYMMDDHH�� ������ =====
====2. �Ϸ� ���Ѱ� 3. �Ϸ� ���� ���ÿ��� ======
====���Ϻ��� ���ϻ��� �� ��¥ ���=========
=== 4. 24�ð� �߿� ��ð��� ���ϸ� �����ΰ�


select sysdate, hire_date, months_between(sysdate, hire_date)
from employees
where department_id=100;

-------/ ���� ������  ��� ��¥���� 


�����ٰ� ��¥�� ���ϱ�
select hire_date,
    add_months(hire_date,3),
    add_months(hire_date, -3)
from employees
where employee_id between 100 and 106;



--���ƿ��� ���� ������ ��¥ ���
select sysdate,
    add_months(sysdate, 1)
from employees;


select hire_date,
    last_day(hire_date)
from employees
where employee_id between 100 and 106;






select *
from employees
order by commission_pct;


employees ���̺� ���� ù° ����, ��Ʈ����
department-id, salary �� ����ϵ�  department_id�� 60�� ��� �޿��� 10%�λ��� ���� ����Ͽ�
����ϰ� ������ ��쿡�� ������ ���� ���

�׸��� department_id �� 60�� ��쿡�� 10% �λ��� ��� �������� �� �λ� �̶�� ���


select employee_id as �����ȣ,
        first_name, last_name,department_id ,
        salary as �����޿�,
        decode(department_id, 60, salary*1.1, salary)  as �λ�,
        decode(department_id, 60, '10%�λ�', '���λ�') as �λ�
from employees;



employees ���̺��� job_id�� it_prog ���
employeee_id, first_name, last_name, salary��  9000 �̻��̸�
�����޿� 6000�� 8999 ���̸� �����޿�
 �׿ܿ��� �����޿���� �Ѵ�. 
 

select employee_id,
    first_name,
    last_name,
    salary,
    case when salary >=9000 then '�����޿�'
            when salary between 6000 and 8999 then '�����޿�'
        else  '�����޿�' end
from employees
where job_id= 'IT_PROG' ;





