--while��
declare
    v_dan number :=3; --3��
    v_count number :=1;
begin
    --�ݺ����ȿ��� loop������ �ݵ�� �����ϴ�.
    while v_count<=9 --v_count�� 9���� ������ ����
    Loop
        DBMS_OUTPUT.PUT_LINE(v_dan||'x'||v_count||'= '||v_dan*v_count);
        v_count := v_count +1;--1����
        
    end loop;
    
end;

--Ż�⹮
--EXIT WHEN ����
declare
    v_count number :=1;
begin
    while v_count <=10
    loop
        DBMS_OUTPUT.PUT_LINE(v_count);
        EXIT WHEN v_count =5;--v_count�� 5�̸� Ż��
        v_count := v_count+1;
        
    end loop;
   
end;

--for��
declare
    v_dan number := 3;
begin
    FOR i in 1..9
    loop
        DBMS_OUTPUT.PUT_LINE(v_dan||'x'||i||'= '||v_dan*i);
    end loop;
end;
--continue��
declare
    
begin
    FOR i in 1..9
    loop
        continue when i = 5;--i�� 5�� �� pass
        DBMS_OUTPUT.PUT_LINE(i);
    end loop;

end;
--��� �������� ����ϴ� �͸� ����� �����ϼ���.
declare
    
begin
    FOR i in 2..9
    loop
        FOR j in 1..9
        loop
            DBMS_OUTPUT.PUT_LINE(i||'x'||j||'= '||j*i);
        end loop;
        
    end loop;

end;

