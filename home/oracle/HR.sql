select*from employees;

select employee_id, first_name from employees;

select employee_id, first_name 
from employees
ORDER by employee_id DESC;


SELECT DISTINCT job_id FROM employees;
--�ߺ� �ȳ�����
--�ּ�
--��Ī���


SELECT employee_id as �����ȣ, first_name as �̸�, last_name as �� from employees;

SELECT employee_id �����ȣ, first_name �̸�,
last_name  �� from employees;
--

--�ʵ� �����ϴ� ���
select employee_id, first_name ||last_name
from employees;
--�̸��� �پ� ����

--7) �ʵ� ���� 2
select employee_id, first_name ||'-'||last_name,
    email||'@'||'company.com'
from employees;



--���

select employee_id , 
        salary  , 
        salary+500  , 
        salary-100 ,
        (salary*1.1)/2 
from employees;

select employee_id as �����ȣ,
        salary as �޿�, 
        salary+500 as �߰��޿�, 
        salary-100 as ���ϱ޿�,
        (salary*1.1)/2 as �����޿�
from employees;







--where ����

--where 

select * from employees
where employee_id = 100;

--�ߺ� �̸� ã��

select * from employees
where first_name = 'David';

-- �ߺ� �� ã�ƶ�
select * from employees
where last_name = 'King';

--���� ������ 
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

--in�� ���Ͽ� �Ʒ��� ���Ѱ͸� �� �� ����

SELECT *
FROM employees
where salary in(10000, 17000, 24000);


SELECT *
FROM employees
where job_id like 'AD%';

--Ư���� � �����͸� �̾Ƴ��� ����
--��û����� ���̵� �达 ���̵� C�� �����ϴ� ���

SELECT *
FROM employees
where FIRST_name like 'J%';

������ ���� null�ΰ��� ã�Ƴ��°�

SELECT *
FROM employees
where manager_id IS NULL;

--IS NULL�� �ؾ��Ѵ� �տ����� ��������


--����� �� ������ 
SELECT *
FROM employees
where salary >4000 AND job_id = 'IT_PROG';


--�������

SELECT *
FROM employees
WHERE salary >4000
AND JOB_ID ='IT_PROG'
OR JOB_ID = 'FI_ACCOUNT';

���������� �����ϰ� �̾Ƴ���

SELECT *
FROM employees
WHERE employee_id <> 105;

--nuLL�����ϴ¹�

SELECT *
FROM employees
WHERE manager_id IS NOT NULL;

SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;