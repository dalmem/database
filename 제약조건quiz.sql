create table members(
    m_name varchar(5),
    m_num number(10),
    reg_date date,
    gender varchar(1),
    loca number(10)
);
alter table members modify  m_name varchar(5) not null;
alter table members add constraints  mem_memnum_pk primary key(m_num);
alter table members modify reg_date date not null;
alter table members add constraints mem_regdate_uk unique (reg_date);
alter table members add constraints mem_loca_loc_locid_fk foreign key (loca) REFERENCES locations(location_id);

INSERT INTO members VALUES ('AAA',1,'2018-07-01','M',1800);
INSERT INTO members VALUES ('BBB',2,'2018-07-02','F',1900);
INSERT INTO members VALUES ('CCC',3,'2018-07-03','M',2000);
INSERT INTO members VALUES ('DDD',4,sysdate,'M',2000);
select * from members;
select m_name,
       m_num,
       street_address,
       l.location_id,
       reg_date
       from members m 
       inner join locations l 
       on m.loca = l.location_id 
       order by m_num;
       
commit;