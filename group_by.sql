--그룹함수 AVG, MAX, MIN, SUM, COUNT
select avg(salary),sum(salary),min(salary),max(salary),count(*)from employees;
select count(*) from employees;-- 행 데이터 개수
select count(first_name) from employees;--first_name이 null이 아닌개수
select count(commission_pct) from employees; --commission_pct이 null이 아닌개수

--그룹함수는 일반컬럼과 동시에 사용이 불가능 합니다
--select department_id, sum(salary) from employees;
--그룹 절에 묶인 컬럼만 조회가 가능합니다
--select department_id , job_id from employees group by department_id;

--group by 절을 이용한 그룹핑(group by절은 where절 다음에 들어갑니다.)
select department_id,round(avg(salary),2) from employees GROUP BY department_id ;
select department_id, sum(salary), round(avg(salary)),count(*) from employees GROUP by department_id;

--2개 이상의 그룹화
select department_id, job_id from employees group by department_id, job_id;--부서별 job_id 
select job_id, department_id from employees group by job_id, department_id; -- job_id별 부서명

--아래 두 구문은 결과가 다릅니다.
select department_id, sum(salary) from employees  group by department_id;
select department_id, sum(salary) from employees where salary>=5000 group by department_id;

--group by절의 조건 having
select department_id, sum(salary)from employees group by department_id having sum(salary)>=100000;

--job_id 가 20명 이상인 조건
select job_id, count(*) from employees group by job_id having count(*)>=20;

--부서아이디가 50이상인 컬럼을 그룹화 시키고, 그룹평균중 5000이상만 조회
select department_id,count(*), trunc(avg(salary)) from employees where department_id >= 50 group by department_id  having trunc(avg(salary))>=5000 ; 
