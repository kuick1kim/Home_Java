create Table sample_table2
            (product_id number primary key,
            product_name varchar2(30),
            menu_date date);
            
            
drop table �Ǹ����̺�2;
commit;
            
            
            
insert into sample_table2 values (4, ' �߽�ī��', to_date ('210803','yymmdd'));
insert into sample_table2 values (5, '������ �ִ� ����', to_date ('210803','yymmdd'));
insert into sample_table2 values (6, '������ �ִ� ����', to_date ('210803','yymmdd'));

commit;

insert into sample_table (department_id, department_name, manager_id, location_id)
values (1, '���ִ�BHCġŲ',2021-08-13);



create Table �Ǹ����̺�
            (�ŷ�ó varchar2(30),
            ǰ�� varchar2(30) PRIMARY KEY (����,��,���),
            ���԰� number,
            �ǸŰ� number,
            �Ǹŷ� number,
            �Ǹ����ͱ� number);
            
insert into �Ǹ����̺� values ('�뱸��ȸ', '����' , 2500, 4500, 150, 300000);
insert into �Ǹ����̺� values ('�뱸��ȸ', '��' , 7480, 8800, 320, 422400);
insert into �Ǹ����̺� values ('�뱸��ȸ', '����' , 3824, 4500, 280, 189000);
insert into �Ǹ����̺� values ('�뱸��ȸ', '����' , 3100, 3500, 340, 136000);
insert into �Ǹ����̺� values ('��û��ȸ', '���' , 5780, 6800, 200, 204000);
insert into �Ǹ����̺� values ('��û��ȸ', '����' , 3867, 4550, 250, 170750);



�뱸 ��ȸ�� �� �Ǹ� ���ͱ�

sum

����� �� �Ǹż���

select *
from �Ǹ����̺�;
SELECT SUM(MONEY) FROM TABLE ;




�Ǹ����ͱ��� sum���ϱ� �뱸��ȸ��

select sum(�Ǹ����ͱ�)
from �Ǹ����̺�
where �ŷ�ó = '�뱸��ȸ';




�Ǹŷ��� sum�ϱ� �����κи�
--���� �Ǹŷ�
select sum(�Ǹŷ�)
    from �Ǹ����̺�
    where ǰ��  ='����';
    
    
    
�ǸŰ��� 3000 �̻� 6000���� ���    
��ü�� ������ /�Ǹ����̺���
�ǸŰ��� 3000�� �̻�� and 6000�� ���ϸ�

select *
    from �Ǹ����̺� 
    where �ǸŰ� >= 3000
    and �ǸŰ� <=6000;
    
    
    
    ======  �Ǹſ��� ����=====
alter table �Ǹ����̺� add �Ǹſ� NVARCHAR2(20) null;
�Ǹſ����� ������ �ٲ�===6��== 
���԰��� ���ڰ� �ٸ��Ƿ�  1����  2�� �־��ְ�
2���� 4�� �־��� 6���� �۾�����
    
update �Ǹ����̺�
set �Ǹſ� = '2��'
where ���԰� = '3867';


��ü�� �����ؼ�
�Ǹſ� 1���� �����޶�� ����� ����

select *
    from �Ǹ����̺� 
    where �Ǹſ� = '1��';

    
CREATE TABLE �Ǹ����̺�2
    (ǰ�� VARCHAR(20),
    CONSTRAINT pk_fruit_name PRIMARY KEY(ǰ��));

 

INSERT INTO �Ǹ����̺�2 VALUES('����');

INSERT INTO �Ǹ����̺�2 VALUES('���');

INSERT INTO �Ǹ����̺�2 VALUES('��');

 

ALTER TABLE �Ǹ����̺� ADD CONSTRAINT ǰ�� FOREIGN KEY(�Ǹ����̺�2) REFERENCES fruit_names(�Ǹ����̺�2);
    
    
    
    
    
���� �߰� �ϴ� ���

Alter table sample_table2 Add (factory varchar(10));

���̸��� �����ϴ°�

Alter table sample_table2 rename column factory to factory1;

���� �����ϴ°�

Alter table sample_table2 drop column factory1;


--���̺� ������ �����ع��� ���̺��� ����

commit;

--Ŀ���ϱ� ================
truncate table sample_table2;


--���̺� ��ü�� ��������===================
rollback;
drop table sample_table2;

drop table �Ǹ����̺�2;


--
--���� ���̺� ����� ������ �ƴ����� �������� ����°���    
--
--1. ���ú� �ϳ��� ���̺�
--2. ���÷����� �������̺�
--3. �ζ��κ� 1ȸ���


select

employees ���̺�� emp_details_view �� �����Ͽ�
employee_id �� 100�� ������ 
employee_id, hire_date, department_name, job_title
    
    ;
select*
from employees
where employee_id == 100 ;
 a.employee_id,  a.hire_date, B.department_name, b.job_title

select  a.employee_id,  a.hire_date, B.department_name, b.job_title
from employees a, emp_details_view b
where a.employee_id = b.employee_id
and a.employee_id = 100;

