--������ �̱�
declare
    v_num number := round(DBMS_random.value(0,10));
begin
    DBMS_OUTPUT.PUT_LINE(v_num);
end;

--IF��
DECLARE
    v_num1 number :=1;
    v_num2 number :=2;
BEGIN
    IF v_num1 > v_num2 THEN
        DBMS_OUTPUT.PUT_LINE(v_num1 || '�� ū��');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_num2 || '�� ū��');    
    END IF;--IF������ ��
END;

--ELS IF��
--employees���� salary���� ����
declare
    v_salary number :=0;
    v_department_id number :=0;
begin
    v_department_id := round(DBMS_RANDOM.value(10,110),-1 );
    DBMS_OUTPUT.PUT_LINE(v_department_id);   
    --������̺��� ������ department_id�� �̾Ƽ� salary�� ��ȸ
    select salary
    into v_salary
    from employees
    where department_id = v_department_id and rownum = 1;
       IF v_salary <=5000 THEN
       DBMS_OUTPUT.PUT_LINE('����');
       ELSIF v_salary <=9000 THEN
       DBMS_OUTPUT.PUT_LINE('�߰�');
       ELSE
       DBMS_OUTPUT.PUT_LINE('����');
    END IF;
    
  --case����
  DBMS_OUTPUT.PUT_LINE(v_salary);   
  CASE WHEN V_salary <=5000 THEN
        DBMS_OUTPUT.PUT_LINE('����');
        WHEN v_salary <=9000 THEN
        DBMS_OUTPUT.PUT_LINE('�߰�');
        ELSE --default��
        DBMS_OUTPUT.PUT_LINE('����');
    END CASE;
end;

    
