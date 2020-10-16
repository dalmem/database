--lower - (소문자), upper - (대문자), initcap - (첫글자 대문자)
SELECT  'abcDEF',lower('abcDEF'), upper('abcDEF'), initcap('abcDEF') FROM DUAL;

SELECT  * FROM employees;
select last_name, lower(last_name), UPPER(last_name), INITCAP(last_name) from employees;
select last_name from employees where lower(last_name) = 'bull'; --where 조건에도 함수의 적용이 가능

--length() - 길이, instr - 문자검색
select first_name , LENGTH(first_name) as 길이, instr(first_name , 'a') as 포함위치 from employees;
select length('abc'), instr('abcdefg', 'a') from dual;

--substr() - 문자열자르기, concat() - 문자열붙이기
select substr('abcdef',1,3), concat('abc','def') from dual;
select first_name, substr(first_name,1,3), concat(first_name, last_name) from employees;

-- LPAD, RPAD - 좌우측 지정 문자열로 채우기
select lpad('abc',10,'*') from dual;
select rpad('abc',10,'*') from dual;
select lpad(first_name, 10 ,'-'), rpad(first_name,10,'-') from employees;

-- LTRIM, RTRIM, TRIM - 공백제거, 문자제거
select ltrim('javascript_java', 'java') from dual; --왼쪽에서 java문자 제거
select rtrim('javascript_java', 'java') from dual; --오른쪽에서 java문자 제거
select trim('   java    ') from dual; --양측 공백제거

--REPLACE - 문자열 치환
select 'my dream is president', replace('my dream is president','president','programmer') from dual;
select replace('my dream is president',' ','')from dual;
select ltrim(replace(replace('my dream is president','president','programmer'),' ',''),'my') from dual;


