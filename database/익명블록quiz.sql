-- 단순 출력문으로 3x1 = 3 문자열 출력
declare
three number :=3;
one number:=1;
begin
DBMS_OUTPUT.put_line(three||'x'||one||'= '||three);
end;

-- 2. 사원테이블에서 201번의 사원의 이름과 이메일 주소를 출력하는 
--익명블록을 생성하면 됩니다
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




--3. 사원테이블에서 사원번호가 가장 큰 사원을 찾은 후에 
-- 이번호 +1번으로 아래사원을 emps 테이블에 추가하세요
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
    