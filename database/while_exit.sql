--while문
declare
    v_dan number :=3; --3단
    v_count number :=1;
begin
    --반복문안에는 loop구문을 반드시 적습니다.
    while v_count<=9 --v_count가 9보다 작으면 실행
    Loop
        DBMS_OUTPUT.PUT_LINE(v_dan||'x'||v_count||'= '||v_dan*v_count);
        v_count := v_count +1;--1증가
        
    end loop;
    
end;

--탈출문
--EXIT WHEN 조건
declare
    v_count number :=1;
begin
    while v_count <=10
    loop
        DBMS_OUTPUT.PUT_LINE(v_count);
        EXIT WHEN v_count =5;--v_count가 5이면 탈출
        v_count := v_count+1;
        
    end loop;
   
end;

--for문
declare
    v_dan number := 3;
begin
    FOR i in 1..9
    loop
        DBMS_OUTPUT.PUT_LINE(v_dan||'x'||i||'= '||v_dan*i);
    end loop;
end;
--continue문
declare
    
begin
    FOR i in 1..9
    loop
        continue when i = 5;--i가 5일 때 pass
        DBMS_OUTPUT.PUT_LINE(i);
    end loop;

end;
--모든 구구단을 출력하는 익명 블록을 생성하세요.
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

