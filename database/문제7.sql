create table sales(
    sno number(5),
    name varchar2(30),
    total number(10),
    price number(10),
    regdate date default sysdate
);

create table day_of_sales(
    regdate date,
    final_total number(10)
    );
    
select * from sales;
select regdate,sum(final_total) from day_of_sales group by regdate;

create or replace procedure  salesProc(
    p_regdate sales.regdate%type
    ) is
        v_final_total number :=0;
    begin
        select sum(total * price)
        into v_final_total
        from sales
        where to_char(regdate,'YY/MM/DD') = to_char(p_regdate,'YY/MM/DD');
    end;
    
execute salesProc(sysdate);

desc employees;