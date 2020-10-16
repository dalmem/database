/*
서브쿼리
-- 사용법은 ()안에 명시함, 서브쿼리의 리턴행이 1줄이하여야 합니다.
-- 서브쿼리절을 먼저 해석하면 됩니다.
*/
select salary from employees where first_name='Nancy';
select * from employees where salary >(select salary from employees where first_name='Nancy');-- 직원들 중에 낸시보다 급여가 많은 사람

--employee_id가 103인 사람의 job_id와 동일한 사람을 찾아라.

select job_id from employees where employee_id=103;
select * from employees where job_id =(select job_id from employees where employee_id=103);

--서브쿼리의 리턴 행이 여러개라면 일반 비교연산으로는 구분할 수 없습니다.
select * 
from employees 
where job_id=(select job_id from employees where job_id = 'IT_PROG');

--서브쿼리의 리턴 행이 여러개라면, 다중행 비교연산자를 사용합니다.
-- 부서번호가 60,80인 사람들
select department_id from employees where first_name = 'David';
select *
from employees
where department_id in(select department_id from employees where first_name = 'David');

--급여가 4800, 6800, 9500인 사람들
select salary from employees where first_name = 'David';
select *
from employees
where salary in(select salary from employees where first_name = 'David');

-- 급여가 4800보다 큰 사람들
select *
from employees
where salary > any(select salary from employees where first_name = 'David');

--급여가 9500보다 작은 사람들
select *
from employees
where salary < any(select salary from employees where first_name = 'David');
--급여가 9500보다 큰 사람들
select *
from employees
where salary > all(select salary from employees where first_name = 'David');
--급여가 4800보다 작은 사람들
select *
from employees
where salary < all(select salary from employees where first_name = 'David');

--스칼라 서브쿼리 (select절 안에 서브쿼리가 오는 것, left join과 같은 결과)
select * from departments;
select * from employees;
select first_name, 
    (select department_name from departments d where e.department_id = d.department_id) 
from employees e
order by first_name asc;

select first_name,
        department_name
from employees e
left outer join departments d
on e.department_id=d.department_id
order by first_name asc;

--인라인 뷰 (from절에 서브쿼리가 오는 것)
select rownum, first_name,salary
from employees
where rownum <=10
order by salary;

select 
    rownum, first_name, salary
from (select *
from employees
order by salary desc
)
where rownum >=10 and rownum <=20; --rownum은 1부터 조회가능

--위 구문을 다시한번 인라인뷰 형식으로 대입
-- 테이블을 만들어(재정의) from절에 넣는 느낌
select *
from(select 
        rownum as rn,
        first_name,
        email,
        hire_date,
        salary
    from(select * 
        from employees
        order by salary desc
))
where rn>=10 and rn<=30; 
--인라인 뷰 (03월01일 데이터만 추출)
--가장 안쪽 select절에서, 필요한 테이블 형식을 생성(alias, rownum 등)
--바깥 select절에서 
select * from(
    select to_char(to_date(test, 'YY/MM/DD'), 'MMDD' ) as mm, name
    from(
        select '홍길동' as name, '20200211' as test from  dual union all
        select '이순신' , '20200301' from  dual union all
        select '강감찬' , '20200501' from  dual union all
        select '김유신' , '20200226' from  dual union all
        select '이성계' , '20200301' from  dual
))where mm ='0301';