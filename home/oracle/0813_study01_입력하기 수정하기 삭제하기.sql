--==========�μ�Ʈ�� �����͸� �Է��ϴ� ���=====================
insert into departments (department_id, department_name, manager_id, location_id)
values
(272, '��λ�',(null) , 1700);

--==========�μ�Ʈ�� �����͸� �Է��ϴ� ���=====================
;

select *
from departments;


--=============�Ŵ��� ���̵� �ٲٴ¹�=====================================
--=============������Ʈ// UPDATE====================
--==============�����ϱ� ==============

update departments
set manager_id =201,
    location_id = 1800
where department_name = 'sample_Dept';

update departments
set manager_id =201,
    location_id = 1900
where department_id = '272';


--============�����ϴ°� =/ commit/==========================
commit;

====================/����� ���/=================================
DELETE FROM departments
WHERE  department_id = '274';

rollback;