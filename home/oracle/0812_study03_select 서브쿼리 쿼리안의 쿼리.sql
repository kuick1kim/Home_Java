SELECT A.employee_id, A.hire_date, B.department_name, B.job_title
FROM  employees A, emp_details_view B
WHERE A.employee_id = B.employee_id
AND   A.employee_id = 100; 


--�ϳ��� ���� �˻��ϴ� ��������
--������ ��������
--���߿� ��������
--
--���������� ������ ���� ����ϴ� �������� ����
--
--in, not in, exists, any, all



employees ���̺��� last_name �� Da Haan �� ������  salary�� ������ ��������
���� �ִ��� ���� �� ���������� �̿��ؼ� ���

select *
from employees A
where a.salary = (
                select salary
                from employees
                where last_name = 'De Haan'
);

employees ���̺��� department _ ���̵𺰷� ���� ���� salar�� ������ ã�ƺ���
ã�Ƴ� salary �� �ش��ϴ� ������ �������� ���� �� ���������� �̿��� ã����

select *
from employees a
where a.salary in(
    select min(salary) �����޿�
    from employees
    group by department_id
)
order by a.salary Desc;






--
--���߿� in

select *
from employees a
where (A.job_id, A.salary) in(
                            select job_id, min(salary) 
                            from employees
                            group by job_id
)
order by a.salary desc;


�ζ��κ�  inline View ���� ���̺�
�����߿��� department_ name �� IT�� ������ ������ �ζ��� �並 ����� ���

�ζ��κ� - �������̺�

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




