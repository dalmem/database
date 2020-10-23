--랜덤수 뽑기
declare
    v_num number := round(DBMS_random.value(0,10));
begin
    DBMS_OUTPUT.PUT_LINE(v_num);
end;

--IF문
DECLARE
    v_num1 number :=1;
    v_num2 number :=2;
BEGIN
    IF v_num1 > v_num2 THEN
        DBMS_OUTPUT.PUT_LINE(v_num1 || '이 큰수');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_num2 || '이 큰수');    
    END IF;--IF구문의 끝
END;

--ELS IF문
--employees에서 salary값을 구함
declare
    v_salary number :=0;
    v_department_id number :=0;
begin
    v_department_id := round(DBMS_RANDOM.value(10,110),-1 );
    DBMS_OUTPUT.PUT_LINE(v_department_id);   
    --사원테이블에서 랜덤한 department_id를 뽑아서 salary를 조회
    select salary
    into v_salary
    from employees
    where department_id = v_department_id and rownum = 1;
       IF v_salary <=5000 THEN
       DBMS_OUTPUT.PUT_LINE('낮음');
       ELSIF v_salary <=9000 THEN
       DBMS_OUTPUT.PUT_LINE('중간');
       ELSE
       DBMS_OUTPUT.PUT_LINE('높음');
    END IF;
    
  --case구문
  DBMS_OUTPUT.PUT_LINE(v_salary);   
  CASE WHEN V_salary <=5000 THEN
        DBMS_OUTPUT.PUT_LINE('낮음');
        WHEN v_salary <=9000 THEN
        DBMS_OUTPUT.PUT_LINE('중간');
        ELSE --default문
        DBMS_OUTPUT.PUT_LINE('높음');
    END CASE;
end;

    
