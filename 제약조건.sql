--------���̺� ����--------
create table dept2 (dept_no number(2,0),--2�ڸ� ����, �Ǽ��� ���������ʴ´�
                    dept_name varchar2(14), --byte��� ���� ���ڿ�
                    loca varchar(13),
                    dept_date date,
                    dept_bonus number(10)
                   );
                    
select * from dept2;
insert into dept2 values(99,'����','����',sysdate, 20000);

------���̺� ���� alter table---
alter table dept2--�÷� �߰�
add dept_count number(3);
desc dept2;

alter table dept2--�÷� Ÿ�� ����
modify loca varchar(13);


alter table dept2-- �÷��� ����
rename column dept_count to emp_count;
alter table dept2
rename column deot_bunus to dept_bonus;

alter table dept2-- �÷� ����
drop column emp_count;
desc dept2;

--���̺� ����
drop table dept3;
drop table dept2;
drop table dept2 cascade constraints ;--�ش����̺� FK���������� ����ִ��� ������ �����Ѵ�

--���̺����� ���λ���
--truncate table dept2;

--���̺� ������ ��������
/*

������ ��������(PK,FK,not null, check, unique)
1. PK - ���̺� ���� �ĺ��÷� (not null����, unique����)
2. UNIQUE - ������ ���� �����ϴ� �÷� (�ߺ��������� ����)
3. not null - null�� ������� ����
4. FK - �����ϴ� ���̺��� PK�� �����ϴ� �÷�
5. CHECK - ���ǵ� ���ĸ� �������� ���
*/

create table dept2(
    dept_no number(2) PRIMARY KEY,
    dept_name varchar(14) not null unique,
    loca number(4) REFERENCES locations(location_id),
    dept_date date default sysdate, --�ƹ��͵� �������� ������ �⺻���� ���ݽð�
    dept_bonus number(10),
    dept_gender char(1) check(dept_gender in('F','M'))
);
desc dept2;
drop table dept2;

--���̺� ���� ��������(��� ���� ������ �Ŀ� �Ʒ��ʿ� �������� �߰�)
create table dept2(
    dept_no number(2),
    constraints dept_no_pk primary key (dept_no), --�������� ���������̸� ������������ �����÷�
    
    dept_name varchar(14) not null,
    constraints dept_name_uk unique (dept_name),
    
    loca number(4),
    constraints dept_loca_fk foreign key (loca) references locations(location_id),
    
    dept_date date default sysdate,
    dept_bonus number(10),
    
    dept_gender char(1),
    constraints dept_gender_ck check (dept_gender in ('M','F'))       
    
);
desc dept2;   
select * from managers;
    
--���� ������ �߰�, ������ �����մϴ�

drop table dept2;
create table dept2(
    dept_no number(2),
    dept_name varchar(14),    
    loca number(4),    
    dept_date date default sysdate,
    dept_bonus number(10),
    dept_gender char(1)
);
--pk�߰�
alter table dept2 add constraints dept_no_pk PRIMARY KEY (dept_no);
--fk
alter table dept2 add constraints dept_loca_fk foreign key(loca)references locations(location_id);
--check�߰�
alter table dept2 add constraints dept_jender_check check(dept_gender in('Y','N'));
--unique�߰�
alter table dept2 add constraints dept_name_uk unique (dept_name);
desc dept2;
--not null�� �� �������·� �����մϴ�
alter table dept2 modify dept_name varchar(14) not null;

--�������� ���� (�������� �̸�����)
alter table dept2 drop contraints dept_no_pk;

--FK�� �θ����̺� ���� ���ٸ� ������ �Ұ���
select * from locations;
insert into dept2 values(10, 'test', 100, sysdate,5000,'Y'); --locations�� location_id 100�� ���� ����

