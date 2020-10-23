/*trigger�� ���̺� ������ ���·μ�, insert, update, delete �۾��� ����� ��
Ư�� �ڵ尡 ���۵ǵ��� �ϴ� �����Դϴ�.
*/

create table tbl_test(
    id number(10),
    text varchar2(50)
);

create or replace trigger trg_test
    after delete or update --����, ���� ���� ����
    on tbl_test -- ������ ���̺�
    for each row --���࿡ �� ����
begin
    DBMS_OUTPUT.PUT_line('Ʈ���� ����');
end;

insert into tbl_test values(10,'ȫ�浿'); --Ʈ���� ���� x
insert into tbl_test values(20,'ȫ����'); --Ʈ���� ���� x
update tbl_test set text = '�̼���' where id =20;--Ʈ���� ���� o

