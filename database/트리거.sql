/*
after - insert, update, delete�۾� ���Ŀ� �����ϴ� Ʈ���� �Դϴ�
before - insert, update, delete�۾� ������ �����ϴ� Ʈ���� �Դϴ�
instead of - insert, update, delete �۾� ������ view�� �����Ǽ� ����Ǵ� Ʈ���� �Դϴ�

:OLD = ���� �� �� ��(update : �����ϱ� �� ������, delete : �����ϱ� �� ������)
:NEW = ���� �� �� ��(insert : �Է��� �ڷ�, update: ���� �� �ڷ�)

*/
--���� ���, ȸ���� ���̺� update, delete�۾��� ����Ǹ�, �̷��� ���ܳ��´�
create table tbl_user(
    id varchar2(50) primary key,
    name varchar2(50),
    address varchar2(50)
);

create table tbl_user_backup(  
     id varchar2(50), 
    name varchar2(50),
    address varchar2(50),
    updatedate date default sysdate,
    m_type char(1),--����� Ÿ��
    m_user varchar2(50)--������ �����
);
--after Ʈ���� - 
create or replace trigger trg_user_backup
    after update or delete
    on tbl_user --����
    for each row
declare --���� ����
    v_type char(1);
begin --������
    
    if updating then --updating �Ǿ��ٴ� �ý��ۺ���
        v_type :='U';
    elsif deleting then --deleting �Ǿ��ٴ� �ý��� ����
        v_type :='D';
    end if;
    
    --:old - ���̺� ���� �� �����͸� �ǹ���
    insert into tbl_user_backup values(:old.id, :old.name, :old.address, sysdate, v_type, user());
end;

--Ȯ�� 
insert into tbl_user values('test01','ȫ�浿','����');
insert into tbl_user values('test02','ȫ����','�λ�');
insert into tbl_user values('test03','�̼���','���');
select * from tbl_user_backup;
select * from tbl_user;
update tbl_user set address = '����' where id ='test01';
delete from tbl_user where id='test01';


--beforeƮ���� - dml���� ������
--���� ��� insert �Ǳ� ����, �����͸� �����ϴ� ����
create or replace trigger trg_user_insert
    before insert
    on tbl_user
    for each row
declare
    
begin
    --:new.�÷� - insert���������� ���޵Ǵ� ������.
    :new.name := substr(:new.name, 1, 1) || '**';--'**�� ����'
end;

insert into tbl_user values('test04','�̹��','�λ�');
insert into tbl_user values('test05','�̼���','���');
insert into tbl_user values('test06','�̺���','���');

select * from tbl_user;

------------------------------------------------  Ʈ���� Ȱ��  ------------------------------------------------
--�ֹ��� ���̺� insert(�ֹ� �� after trigger) ->��ǰ���̺� update ��Ŵ

--�ֹ������̺�
create SEQUENCE order_history_seq nocache; --�ֹ��� ������
create table order_history(
    history_no number(5) primary key,
    order_no number(5),  --FK �ֹ���ȣ
    product_no number(5), --FK ��ǰ��ȣ
    total number(10), --����
    price number(10)
);
--��ǰ���̺�
create SEQUENCE product_seq nocache;
create table product(
    product_no number(5) primary key,
    product_name varchar2(30),
    total number(10),
    price number(10)
);

insert into product values(product_seq.nextval,'����',100,10000);
insert into product values(product_seq.nextval,'ġŲ',100,15000);
insert into product values(product_seq.nextval,'�ܹ���',100,5000);

select * from product;
--�ֹ��󼼿� insert�� ������ ���� trigger
create or replace trigger trg_order_history_insert
    after insert
    on order_history
    for each row
declare
    v_total number; --����
    v_product_no number; --��ǰ��ȣ
    
begin
    select :new.total, :new.product_no
    into v_total, v_product_no
    from dual; --�������̺�
    
    --��ǰ���� ������Ʈ
    update product set total = total - v_total --���� ��ǰ ���� - ���Ű���
    where product_no = v_product_no;

end;
--Ȯ��
insert into order_history values(order_history_seq.nextval, 50000, 1, 10, 10000); --���� 10��
insert into order_history values(order_history_seq.nextval, 50000, 2, 5, 15000); -- ġŲ 5��
insert into order_history values(order_history_seq.nextval, 50000, 3,1, 5000); --�ܹ��� 1��

select * from product;
select * from order_history;



