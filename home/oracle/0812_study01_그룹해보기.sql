employees ���̺��� employ id�� 10 �̻��� ������ ����
job_id�� �׷�ȭ �Ͽ� job_id�� �� �޿��� job_id�� 
��� �޿��� ���ϵ�
job_id�� �޿��� 30000���� ū ���� ����ϵ� ��� ����� 
job_id �� �� �޿��� �������� �������� ���� 

select job_id ����, sum(salary) ������_�ѱ޿�, avg(salary) ������_��ձ޿�
from employees
where employee_id >= 10
Group by job_id
Having Sum(salary)> 30000
order by ������_�ѱ޿� desc, ������_��ձ޿�;

=====�̰��� ��ü���� �������� �׷��� ������, �װ� �������� ��ġ�� �������� ����� ����
from employees ������̺�
��ü ���̺��� 10�� ���̵� �̻� �̴´�
�׸��� �׷��� job_id�� �׷��� �����
Having Sum ������ 30000�� �̻��� �͸� �Ѵ�
������ ������������, �Ѵ�
--============================================

select A.first_name, A.last_name, B.*
from employees A, job_history B
Where B.employee_id = B.employee_id;
And A.employee_id =101;





--================================================

