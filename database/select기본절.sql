select * from employees;

--행 제한 where절 between, in, like
select first_name, last_name, job_id from employees where job_id = 'IT_PROG';
select * from employees where last_name = 'King'; --같은
select * from employees where department_id = 90;
select * from employees where salary >= 15000;
select * from employees where salary <> 15000; --15000이 아닌 사람
select * from employees where hire_date = '06/03/30';

--between연산자
select * from employees where salary BETWEEN 10000 and 12000; -- 10000, 12000사이
select * from employees where salary >= 10000 and salary <=12000;-- 10000이상 ~ 12000이하
select * from employees where hire_date BETWEEN '03/01/01' and '03/12/31';

--in 연산자(목록의 특정값을 비교 할 때 사용)
select * from employees WHERE manager_id in(100,101,102);
select * from employees WHERE job_id in('AD_VP','FI_MGR','SA_MAN');

-- like 연산자(%는 모든, _는 데이터의 위치를 찾아낼 때 )
select first_name || ' ' || last_name, hire_date from employees where hire_date like '03%';--03으로 시작하는 사람
select first_name || ' ' || last_name, hire_date from employees where hire_date like '%15';--15로 끝나는
select first_name || ' ' || last_name, hire_date from employees where hire_date like '%05%';--05가 포함된
select first_name || ' ' || last_name, hire_date from employees where hire_date like '___05%';--05월 찾기 

-- is null, is not null (null값 조회)
select * from employees where manager_id is null;
select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;

-- and, or (and가 or 보다 우선순위가 빠름)
select * from employees where department_id = 100 and salary >=5000;
select * from employees where job_id = 'IT_PROG' or job_id = 'FI_MGR' and salary >=6000;
select * from employees where (job_id = 'IT_PROG' or  job_id = 'FI_MGR') and salary >=6000;

-- 데이터 정렬 ( select구문의 가장 마지막에 씁니다) order by [asc(오름차순)/desc(내림차순)]
select * from employees ORDER BY hire_date asc;
select * from employees ORDER BY hire_date DESC;
select * from employees where job_id = 'IT_PROG' order by first_name asc; -- 문자도 정렬이 가능함
select * from employees where salary >= 5000 order by employee_id desc;

-- alias 도 order by절에 적용할수 있습니다
select FIRST_name, salary * 12 as pay from employees order by pay asc;




