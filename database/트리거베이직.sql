/*trigger는 테이블에 부착된 형태로서, insert, update, delete 작업이 수행될 때
특정 코드가 동작되도록 하는 구문입니다.
*/

create table tbl_test(
    id number(10),
    text varchar2(50)
);

create or replace trigger trg_test
    after delete or update --삭제, 수정 이후 동작
    on tbl_test -- 부착할 테이블
    for each row --각행에 다 적용
begin
    DBMS_OUTPUT.PUT_line('트리거 실행');
end;

insert into tbl_test values(10,'홍길동'); --트리거 실행 x
insert into tbl_test values(20,'홍길자'); --트리거 실행 x
update tbl_test set text = '이순신' where id =20;--트리거 실행 o

