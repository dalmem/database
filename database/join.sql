/*CREATE TABLE INFO 
(
  ID NUMBER NOT NULL 
, TITLE VARCHAR2(50) 
, COMTENT VARCHAR2(100) 
, REGDATE DATE 
, COLUMN1 VARCHAR2(50) 
, CONSTRAINT INFO_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);*/
/*CREATE TABLE AUTH 
(
  USER_ID VARCHAR2(50) NOT NULL 
, COLUMN2 VARCHAR2(50) 
, JOB VARCHAR2(50) 
, CONSTRAINT AUTH_PK PRIMARY KEY 
  (
    USER_ID 
  )
  ENABLE 
);
*/
select * from info;
select * from auth;
--inner join
select * from info inner join auth on info.user_id = auth.user_id;
-- select������ �ʿ��� �÷� ����
-- ���� ���̺� ������ �̸����� �����ϴ� �÷��� ������ ���� ���ǰ� ��ȣ�ϴٴ� ������ ����մϴ�.
-- �̷� ��� ���̺��̸�.�÷� ���� ��Ī�ؼ� ������ ��ȸ�� �����մϴ�.
select id, 
    title, 
    content, 
    regdate, 
    name, 
    job,
    info.user_id
    from info inner join auth on info.user_id = auth.user_id;
-- ���̺� ��Ī�� �̿��ؼ� join�� �� �� �ֽ��ϴ�
select id, title, content, regdate, name, job, i.user_id
from info i inner join auth a on i.user_id = a.user_id
where name='������';

--  �ƿ��� ���� - left outer, right outer, full outer
select * from info i left outer join auth a on i.user_id = a.user_id;
select * from info i right outer join auth a on i.user_id = a.user_id;
select * from info i full outer join auth a on i.user_id = a.user_id;--�������� �������� ��� �ٿ��� ���
select * from info i cross join auth a ;--�߸��� ������ ������ ��� (Cartesian product)

--������ 3�� ���̺� ���� �մϴ�. Ű ���� ã�Ƽ� ������ �����ؼ� ���� �˴ϴ�.
select * from employees;
select * from departments;
select * from locations;

select * from employees e 
left outer join departments d on e.department_id = d.department_id 
left outer join locations l ON d.location_id = l.location_id;

-- ���̺�auth�� info���� ����� a, i�� �̿��ؼ� left join -job�÷��� DBA�� ����� ID, TITLE,CONTENT, JOB�� ���
SELECT * FROM auth;
SELECT * FROM info;

select id,name,title,content,job from info i  left outer join auth a on i.user_id = a.user_id where job ='DBA';
select id,name,title,content,job from info i  right outer join auth a on i.user_id = a.user_id where job ='DBA';