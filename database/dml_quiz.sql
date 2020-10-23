select * from depts;
rollback;
--���� 1
insert into depts(department_id,department_name,manager_id,location_id) values(280,'����',null,1800);
insert into depts(department_id,department_name,manager_id,location_id) values(290,'ȸ���',null,1800);
insert into depts(department_id,department_name,manager_id,location_id) values(300,'����',301,1800);
insert into depts(department_id,department_name,manager_id,location_id) values(310,'�λ�',302,1800);
insert into depts(department_id,department_name,manager_id,location_id) values(320,'����',303,1800);
--���� 2
update depts set department_name ='IT bank' where department_name = 'IT Support';
update depts set department_id =301 where department_id= 290;
update depts set department_name='IT Help',manager_id=303,location_id=1800 where department_name= 'IT Helpdesk';
update depts set manager_id = 301 where manager_id>300;
--���� 3
--DELETE FROM depts WHERE department_name='����';
--DELETE FROM depts WHERE department_name='NOC';--�̷��� �ϸ� �ȵ�, PK�� Ȯ���ϰ� PK�� �̿��Ͽ� ����
delete from depts where department_id=320;
create table depts_c as (select * from depts);
select * from depts;
delete from depts_c where department_id >200;
update depts_c set manager_id=100 where manager_id is not null;

--���� 4
merge INTO depts_c a
    using(select * from departments) b
    on(a.department_id = b.department_id)
when matched then
        update set a.department_name = b.department_name,
                a.manager_id = b.manager_id,
                a.location_id = b.location_id
when not matched then
        insert values(b.department_id,
                      b.department_name,
                      b.manager_id,
                      b.location_id);
                      
select * from jobs;
create table jobs_it as (select * from jobs where min_salary > 6000);
select * from jobs_it;
INSERT INTO jobs_it VALUES ('IT_DEV','����Ƽ������',6000,20000);
INSERT INTO jobs_it VALUES ('NET_DEV','��Ʈ��ũ������',5000,20000);
INSERT INTO jobs_it VALUES ('SEC_DEV','���Ȱ�����',6000,19000);

merge into jobs_it a
    using(select * from jobs where min_salary >0) b
    on(a.job_id = b.job_id )
when matched then
    UPDATE set a.min_salary=b.min_salary,
            a.max_salary = b.max_salary
            
when not matched then
    insert values(b.job_id,b.job_title,b.min_salary,b.max_salary);
select * from jobs_it;    

commit;
