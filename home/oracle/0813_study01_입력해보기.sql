--==========인서트로 데이터를 입력하는 방법=====================
insert into departments (department_id, department_name, manager_id, location_id)
values
(273, 'kimminsang', 200, 1700);

--==========인서트로 데이터를 입력하는 방법=====================
;

select *
from departments;


--=============매니저 아이디 바꾸는법=====================================
--=============업데이트// UPDATE====================
--==============수정하기 ==============

update departments
set manager_id =201,
    location_id = 1800
where department_name = 'sample_Dept';

update departments
set manager_id =201,
    location_id = 1900
where department_id = '272';


--============저장하는것 =/ commit/==========================
commit;

====================/지우는 방법/=================================
DELETE FROM departments
WHERE  department_name = 'kimminsang';