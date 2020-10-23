/*
--���ν��� ����
create or replace procedure ���ν����̸�(
�Է� �Ķ����
)

*/
/*
create or replace procedure new_job_proc(

    p_job_id in jobs.job_id%type,
    p_job_title in jobs.job_title%type,
    p_min_salary in jobs.min_salary%type,
    p_max_salary in jobs.max_salary%type
)
is
--���� ���� ����
begin
    insert into jobs (job_id, job_title, min_salary, max_salary)
    values(p_job_id, p_job_title, p_min_salary, p_max_salary);
    commit;
end;*/
--���ν��� ����
EXECUTE new_job_proc('TEST_JOBS1','test...', 1000, 5000);
EXECUTE new_job_proc('TEST_JOBS2','test2...', 2000, 10000);--�ι� ������ ���Ἲ �������� ����


--���ν��� ������ ������ �̸����� ����
create or replace procedure new_job_proc(--�Ű����� ������
    p_job_id in jobs.job_id%type,
    p_job_title in jobs.job_title%type,
    p_min_salary in jobs.min_salary%type :=0, --�⺻�� ����
    p_max_salary in jobs.max_salary%type :=100 -- �⺻�� 100
)is
    v_count number := 0;
begin
    select count(*)
    into v_count
    from jobs 
    where job_id = p_job_id;--�Ű����� p_job_id������� ��ȸ�ؼ� ī��Ʈ
    --���ٸ� insert
    if v_count = 0 then
        insert into jobs(job_id, job_title, min_salary, max_salary)
        values(p_job_id, p_job_title, p_min_salary, p_max_salary);
    else --�ִٸ� update
        update jobs set job_title = p_job_title,
                        min_salary = p_min_salary,
                        max_salary = p_max_salary
        where job_id = p_job_id;
    end if;
    
end;

--���๮
   EXECUTE new_job_proc('JOBS2','test2...', 5000, 20000); 
--���ν����� �⺻�Ű����� ����Ǿ� �ִٸ�, ������ �����մϴ�.
   EXECUTE new_job_proc('JOBS3','test3...');
   select * from jobs;
   
--out �Ű�����
--out ������ ����ϴ� ���ν����� �͸��Ͽ��� ������ �մϴ�.
create or replace procedure new_job_proc02(
    p_job_id in jobs.job_id%type,
    p_job_title in jobs.job_title%type,
    p_min_salary in jobs.min_salary%type :=0,
    p_max_salary in jobs.max_salary%type:=100,
    p_result out varchar2 --����� ���� ����
)is
     v_count number :=0;
     v_result varchar2(100) :='���� ��� insertó�� �Ǿ����ϴ�';
begin
    --������ ���̵� �ִ��� üũ
    select count(*)
    into v_count
    from jobs
    where job_id = p_job_id;
    --���ٸ� �Ķ���Ͱ� insert
    if v_count =0 then
        insert into jobs
        values (p_job_id, p_job_title, p_min_salary, p_max_salary);
    else--�ʿ��� ��� ����
        select p_job_id || '�� �ִ� ����: '|| max_salary || ', �ּҿ��� : '||min_salary 
        into v_result
        from jobs
        where job_id = p_job_id;
    end if;
    p_result := v_result; --out������ ��� �Ҵ�
end;

--out ���ν����� ����
declare
    str varchar2(100); --���ڿ� ũ�� ���� (�ݵ��)
begin
    --out������ ���ν����� �����ؼ�, �Ҵ�� ������� �޾Ƽ� ó��.
    new_job_proc02('SM_JOB1','sample job1',2000,6000,str);
    DBMS_OUTPUT.put_line(str);
    new_job_proc02('CEO','sample ceo',10000,90000,str);
    DBMS_OUTPUT.put_line(str);
end;

select * from jobs;

--in out ó������ 
create or replace procedure testProc(
    p_var1 in varchar2,
    p_var2 out varchar2,
    p_var3 in out varchar2
    )
is
begin
    --in, out�� ���ٸ� �ܼ��� ��븸 ����
    DBMS_OUTPUT.PUT_LINE(p_var1);
    --out������ ���ν����� ������ ������ ���� �Ҵ��� �ȵ�.
    DBMS_OUTPUT.PUT_LINE(p_var2);
    -- in, out�� �Ѵ� ����� ����.
    DBMS_OUTPUT.PUT_LINE(p_var3);
   -- p_var1 := '���1';
    p_var2 := '���2';
    p_var3 := '���3';
end;

declare
    var1 varchar2(50):='A';
    var2 varchar2(50):='B';
    var3 varchar2(50):='C';
begin
    testProc(var1,var2,var3);
    DBMS_OUTPUT.put_line(var2); --���2
    DBMS_OUTPUT.put_line(var3);
end;
set SERVEROUTPUT ON; --���� 


--return����
/*
1.employees���� job_id�� in������ �Է¹޾Ƽ�, �ش� ���̵� �ִ��� Ȯ���ϰ�,
���ٸ�, �ܼ��� ���ν��� �ȿ��� ��¸� ���ݴϴ�.
2. job_id�� �ִٸ�, ������ job_id�� ���� �޿��� �հ踦 ���
*/

create or REPLACE procedure quiz1(
    p_job_id in employees.job_id%type
    
)is
    v_count number :=0;
    v_total number :=0;
begin
    select count(*), sum(salary)
    into v_count,v_total
    from employees
    where job_id = p_job_id;
    IF v_count=0 then
    DBMS_OUTPUT.put_line(p_job_id||'�� �����ϴ�');
    return;
    else
    DBMS_OUTPUT.put_line(v_total);
    end if; 
end;


execute quiz1('SA_MAN');
execute quiz1('aSA_MAN');
select * from employees;

--����ó�� ���� EXCEPTION when others then

declare
    v_num number := 0;
begin
    v_num := 10/0;
    EXCEPTION when others then
        DBMS_OUTPUT.PUT_LINE('0���� ���� �� �����ϴ�');
end;
--���ν��� ����
drop procedure new_job_proc;


