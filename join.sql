/*CREATE TABLE INFO 
(
  ID NUMBER NOT NULL 
, TITLE VARCHAR2(50) 
, COMTENT VARCHAR2(100) 
, REGDATE DATE 
, COLUMN1 VARCHAR2(50) 
, CONSTRAINT INFO_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);*/
/*CREATE TABLE AUTH 
(
  USER_ID VARCHAR2(50) NOT NULL 
, COLUMN2 VARCHAR2(50) 
, JOB VARCHAR2(50) 
, CONSTRAINT AUTH_PK PRIMARY KEY 
  (
    USER_ID 
  )
  ENABLE 
);
*/
select * from info;
select * from auth;
--inner join
select * from info inner join auth on info.user_id = auth.user_id;
-- select구문에 필요한 컬럼 지정
-- 양쪽 테이블에 동일한 이름으로 존재하는 컬럼을 적으면 열의 정의가 모호하다는 에러를 출력합니다.
-- 이런 경우 테이블이름.컬럼 으로 지칭해서 정상적 조회가 가능합니다.
select id, 
    title, 
    content, 
    regdate, 
    name, 
    job,
    info.user_id
    from info inner join auth on info.user_id = auth.user_id;
-- 테이블에 별칭을 이용해서 join을 할 수 있습니다
select id, title, content, regdate, name, job, i.user_id
from info i inner join auth a on i.user_id = a.user_id
where name='가나다';

--  아우터 조인 - left outer, right outer, full outer
select * from info i left outer join auth a on i.user_id = a.user_id;
select * from info i right outer join auth a on i.user_id = a.user_id;
select * from info i full outer join auth a on i.user_id = a.user_id;--양쪽행을 기준으로 모두 붙여서 출력
select * from info i cross join auth a ;--잘못된 형태의 조인의 결과 (Cartesian product)

--조인이 3개 테이블도 가능 합니다. 키 값만 찾아서 구문을 연결해서 쓰면 됩니다.
select * from employees;
select * from departments;
select * from locations;

select * from employees e 
left outer join departments d on e.department_id = d.department_id 
left outer join locations l ON d.location_id = l.location_id;

-- 테이블auth와 info에서 엘리어스 a, i를 이용해서 left join -job컬럼이 DBA인 사람의 ID, TITLE,CONTENT, JOB만 출력
SELECT * FROM auth;
SELECT * FROM info;

select id,name,title,content,job from info i  left outer join auth a on i.user_id = a.user_id where job ='DBA';
select id,name,title,content,job from info i  right outer join auth a on i.user_id = a.user_id where job ='DBA';