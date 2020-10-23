/*문제 1. EMPLOYEES 테이블에서 JOB_ID가 it_prog인 사원의 이름(first_name)과 급여(salary)를 출력하세요.
조건 1) 비교하기 위한 값은 소문자로 입력해야 합니다.(힌트 : lower 이용)
조건 2) 이름은 앞 3문자까지 출력하고 나머지는 *로 출력합니다.
이 열의 열 별칭은 name입니다.(힌트 : rpad와 substr 또는 substr 그리고 length 이용)
조건 3) 급여는 전체 10자리로 출력하되 나머지 자리는 *로 출력합니다.
이 열의 열 별칭은 salary입니다.(힌트 : lpad 이용)*/
select rpad(substr(first_name,1,3),length(first_name),'*') as name, lpad(salary,10,'*') as salary, job_id from employees where lower(job_id) ='it_prog';

/*EMPLOYEES 테이블 에서 이름, 입사일자 컬럼으로 변경해서 이름순으로 오름차순 출력 합니다.
조건 1) 이름 컬럼은 first_name, last_name을 붙여서 출력합니다.
조건 2) 입사일자 컬럼은 xx/xx/xx로 저장되어 있습니다. xxxxxx형태로 변경해서 출력합니다.*/
select concat(first_name, last_name) as 이름, replace(hire_date,'/','') as 입사일자 from employees ORDER BY 이름 asc ;

/*EMPLOYEES 테이블 에서 phone_numbe컬럼은 ###.###.####형태로 저장되어 있다
여기서 처음 세 자리 숫자 대신 서울 지역변호 (02)를 붙여 전화 번호를 출력하도록 쿼리를 작성하세요*/
select concat('(02)',substr(phone_number,'5')) as phone_number from employees;

select employee_id as 사원번호, concat(first_name,last_name)as 사원명, hire_date as 입사일자, trunc(to_char((sysdate-hire_date)/365)) as 근속년수 from employees order by 근속년수 desc;

select * from employees;
select first_name, to_char(manager_id)  as 사번 ,decode(manager_id, 100 ,'사원',120 , '주임',121,  '대리',122 , '과장','임원') as 직급,department_id as 부서 from employees where department_id = 50;

/*문제 1.
사원 테이블에서 JOB_ID별 사원 수를 구하세요.
사원 테이블에서 JOB_ID별 월급의 평균을 구하세요. 월급의 평균 순으로 내림차순 정렬하세요*/
select job_id, count(*), trunc(avg(salary)) from employees group by job_id order by trunc(avg(salary)) desc;

/*문제 2.
사원 테이블에서 입사 년도 별 사원 수를 구하세요.*/
select to_char(hire_date,'YY') ,count(*) from employees  group by to_char(hire_date,'YY');
/*문제 3.
급여가 1000 이상인 사원들의 부서별 평균 급여를 출력하세요. 단 부서 평균 급여가 2000이상인 부서만 출력*/
select department_id, trunc(avg(salary)) from employees where salary >= 1000 group by department_id having trunc(avg(salary))>=2000;

/*문제 4.
사원 테이블에서 commission_pct(커미션) 컬럼이 null이 아닌 사람들의
department_id(부서별) salary(월급)의 평균, 합계, count를 구합니다.
조건 1) 월급의 평균은 커미션을 적용시킨 월급입니다.
조건 2) 평균은 소수 2째 자리에서 절삭 하세요.*/
select department_id as 부서, 
trunc(avg(salary+salary*commission_pct),2) as 평균,
sum(salary) as 합계,
count(*) as 총원 
from employees 
where commission_pct is not null 
group by department_id;

0
