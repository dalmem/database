--트랜잭션-작업수행단위(데이터베이스 안전장치)-
--트랜잭션은 DML에만 적용이 가능합니다
--트랜잭션의 현상태
show autocommit;

set autocommit on;
set autocommit off;

select * from depts;

delete from depts where department_id =10;
--세이브포인트 생성
savepoint delete_10;
delete from depts where department_id =20;
savepoint delete_20;
delete from depts;--다지우기
rollback to delete_10;
rollback;
select * from depts;
































































