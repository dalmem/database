-- �ܼ� ��¹����� 3x1 = 3 ���ڿ� ���
declare
three number :=3;
one number:=1;
begin
DBMS_OUTPUT.put_line(three||'x'||one||'= '||three);
end;

-- 2. ������̺��� 201���� ����� �̸��� �̸��� �ּҸ� ����ϴ� 
--�͸����� �����ϸ� �˴ϴ�
declare
    v_name employees.last_name%TYPE;
    v_email employees.email%type;
begin
    SELECT
        last_name,email
        into v_name, v_email
    FROM employees
    where employee_id = 201;
    dbms_output.put_line(v_name||v_email);
end;




--3. ������̺��� �����ȣ�� ���� ū ����� ã�� �Ŀ� 
-- �̹�ȣ +1������ �Ʒ������ emps ���̺� �߰��ϼ���
-- name = Steven, email = stevenjobs hire_date = today , job_id = CEO
declare
    v_employee_id employees.employee_id%type;
begin
    SELECT
        max(employee_id)
        into v_employee_id
    FROM employees;    
    INSERT INTO emps(last_name,email,hire_date,job_id,employee_id) VALUES ('Steven','stevenjobs',sysdate,'CEO',v_employee_id+1);
end;
create table emps as select * from employees where 1=2;
select * from emps;
    