--형변환 함수 TO_CHAR, TO_NUMBER, TO_DATE

--날짜를 문자로 TO_CHAR(날짜, 형식)
select TO_CHAR(sysdate, 'YYYY-MM-DD') from dual; --날짜fmt 형식은 대문자로 표기
select to_char(sysdate,'YYYY/MM/DD HH:MI:SS') from dual;
select to_char(sysdate,'YY-MM-DD HH24:MI pm')from dual;
select TO_CHAR(sysdate, 'YYYY"년"MM"월"DD"일"') from dual;--날짜fmt형식이 아니면 사용이 불가능한경우 ""로 묶어서 표현
select first_name, to_char(hire_date,'YYYY-MM-DD "입사"') from employees;

--숫자를 문자로 TO_CHAR(숫자, 형식)
select to_char(20000,'99999999') from dual;-- 9는 자리수의 표현
select to_char(20000,'9999') from dual; --자리수 부족한경우 # 로 표현됨
select to_char(20000.21,'99999') from dual;
select to_char(20000.21,'99999.99') from dual;
select to_char(salary,'$9999999') from employees; --$. 도 숫자에서 사용가능한 fmt형식입니다 

-- 문자를 숫자로 TO_NUMBER(문자, 형식)
select '2000' + 2000 from dual;--자동형변환
select to_number('2000') + 2000 from dual;--명시적형변환
select '$2000' + 2000 from dual;--문자형이 $나 , 같은 특정 문자를 지니고 있을 때는 자동 형변환이 불가능합니다
select to_number('$2000', '$9999') + 2000 from dual;--숫자fmt이 지원하는 형식을 가진경우, 명시적형변환이 가능합니다.

-- 문자를 날짜로 TO_DATE(문자, 형식)
select to_date('2020-03-31') from dual; --이런 경우는 바로 사용이 가능합니다.
select to_date('2020/12/12', 'YY/MM/DD') from dual;-- 날짜 fmt를 이용해서 변경도 가능
select to_date('2020-03-21 12:23:03', 'YYYY-MM-DD HH:MI:SS') from dual; -- 날짜 fmt이 지원하는 형식을 가진경우, 형변환이 가능

-- **NVL(데이터, null일경우 처리할 값) -null제거
select nvl(null,0) from dual;
select first_name, salary, salary + salary * nvl(commission_pct, 0) from employees; --null연산이 들어가는 경우 null값이 나오게 되는데, null인 경우 0으로 변경해서 사용


--** NVL2(데이터, null이 아닌경우 처리, null인경우 처리) -null제거
select nvl2(null,'널아님','널') from dual;
select first_name, nvl2(commission_pct, 'true', 'false') from employees;
select first_name, nvl2(commission_pct, salary + salary * commission_pct, salary) as 최종급여 from employees;

--DECODE(데이터,비교값,결과,비교값,결과...)***
select decode('EEE','A','A입니다',
                'B','B입니다',
                'C','C입니다',
                'A,B,C가 아닙니다')from dual;

SELECT job_id, salary, decode(job_id,'IT_PROG', salary*100,
                                      'AD_VP', salary*200,
                                      'FI_MGR', salary*300,
                                      salary)as salary1 FROM employees;
                                      
-- case when then end
select job_id,salary,(case job_Id when 'IT_PROG' then salary * 100
                                    when 'AD_VF' then salary * 200
                                    when 'FI_MGR' then salary * 300 
                                    else salary
                                    end)from employees;
                                    
                                    
                                    