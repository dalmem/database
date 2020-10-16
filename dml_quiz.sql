select * from depts;
rollback;
--문제 1
insert into depts(department_id,department_name,manager_id,location_id) values(280,'개발',null,1800);
insert into depts(department_id,department_name,manager_id,location_id) values(290,'회계부',null,1800);
insert into depts(department_id,department_name,manager_id,location_id) values(300,'재정',301,1800);
insert into depts(department_id,department_name,manager_id,location_id) values(310,'인사',302,1800);
insert into depts(department_id,department_name,manager_id,location_id) values(320,'영업',303,1800);
--문제 2
update depts set department_name ='IT bank' where department_name = 'IT Support';
update depts set department_id =301 where department_id= 290;
update depts set department_name='IT Help',manager_id=303,location_id=1800 where department_name= 'IT Helpdesk';
update depts set manager_id = 301 where manager_id>300;
--문제 3
--DELETE FROM depts WHERE department_name='영업';
--DELETE FROM depts WHERE department_name='NOC';--이렇게 하면 안됨, PK를 확인하고 PK를 이용하여 제거
delete from depts where department_id=320;
create table depts_c as (select * from depts);
select * from depts;
delete from depts_c where department_id >200;
update depts_c set manager_id=100 where manager_id is not null;

--문제 4
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
INSERT INTO jobs_it VALUES ('IT_DEV','아이티개발팀',6000,20000);
INSERT INTO jobs_it VALUES ('NET_DEV','네트워크개발팀',5000,20000);
INSERT INTO jobs_it VALUES ('SEC_DEV','보안개발팀',6000,19000);

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
