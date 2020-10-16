--숫자 함수
--round - 반올림, trunc - 절삭
select round(34.145,2),trunc(34.145,2) ,round(34.145) ,trunc(34.145), round(31.145,-1),trunc(34.145,-1) from dual; 
select trunc(34.145,2), trunc(34.145), trunc(34.145,-1) from dual;


--날짜 함수
select sysdate from dual;
select systimestamp from dual;

--날짜 연산
select sysdate + 3 from dual;
select sysdate -3 from dual;
select trunc(sysdate - hire_date) from employees; --일수
select round((sysdate - hire_date)/7) from employees; --주
select first_name, round((sysdate - hire_date)/365) from employees; -- 년

--날짜 반올림, 절삭
select trunc(sysdate - hire_date) from employees;

--특정포멧형식으로 날짜 절삭
select trunc(sysdate, 'year') from dual; --년 기준으로 절삭
select trunc(sysdate, 'month') from dual; --월 기준으로 절삭
select trunc(sysdate, 'day') from dual;--일 기준으로 절삭(해당주의 일요일)


