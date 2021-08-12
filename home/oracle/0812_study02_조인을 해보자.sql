

select A.first_name, A.last_name, B.*
from employees A, job_history B
Where a.employee_id = B.employee_id
And A.employee_id =101;

=====employee�� DEPARTMENTS �� �����ؼ� �˾ƺ�



--======employee ���̺�� Departments���̺�� locations���̺��� �����Ͽ� ��������
--��� �μ��� ���ϴ����� �м��� �������� ������� ��ȸ �Ұ�







select *
from employees A, departments B
Where a.employee_id = b.department_id;




--======employee ���̺�� Departments���̺�� locations���̺��� �����Ͽ� ��������
--��� �μ��� ���ϴ����� �м��� �������� ������� ��ȸ �Ұ�
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




employees���̺�� departments���̺���
department_id�� �ܺ� �����Ͽ�
id �� null�� ���� kimberely grant�� �Բ� ���

select a.employee_id, a.first_name, a.last_name, b.department_id, b.department_name
from employees A, departments B
where a.department_id = b.department_id
order by a.employee_id;

============(+) ���ϱ⸦ �ϸ� null ���� �� �� �ִ�. =====
==========(+)���ϱ⸦ ����� null���� �� �� ����. =======




=========��ü ȣ��� ��ü�� �˾ƺ��� ����===================
select a.employee_id, a.first_name, a.last_name, a.manager_id,
        b.first_name||' '||b.last_name manager_name
from employees A, employees B
where a.manager_id = b.employee_id
order by a.employee_id;




=====���̺��� ���սÿ� �ߺ��� �����ϴ� ��� =======

select department_id
from employees
union
select department_id
from departments;

--=====���̺��� department_id �� ��ģ��==========
--
--
--==== �ߺ��� ������ ���====================


select department_id
from employees
union all
select department_id
from departments
order by department_id desc;

--(asc / desc)
--====== order by�� ���ؼ� �������� ����========




select department_id
from employees
intersect
select department_id
from departments
order by department_id desc;

--�������� ���� intersect=====




--=====������ ======
select department_id
from employees
minus
select department_id
from departments
order by department_id desc;





==���� ���� ����Ʈ �ȿ� ����Ʈ===