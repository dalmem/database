
/* Drop Tables */

DROP TABLE lists CASCADE CONSTRAINTS;
DROP TABLE book CASCADE CONSTRAINTS;
DROP TABLE members_test CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE books
(
	bno number NOT NULL,
	code varchar2(1),
	bname varchar2(20),
	rentYN varchar2(1) NOT NULL,
	PRIMARY KEY (bno)
);


CREATE TABLE lists
(
	lno number NOT NULL,
	returndate date,
	bno number NOT NULL,
	mno number NOT NULL,
    returnYN varchar2(1) NOT NULL,
	PRIMARY KEY (lno)
);


CREATE TABLE members_test
(
	mno number NOT NULL,
	phone number NOT NULL,
	name varchar2(20) NOT NULL,
	PRIMARY KEY (mno)
);



/* Create Foreign Keys */

ALTER TABLE lists
	ADD FOREIGN KEY (bno)
	REFERENCES book (bno)
;


ALTER TABLE lists
	ADD FOREIGN KEY (mno)
	REFERENCES members_test (mno)
;
commit;

select * from lists;
select * from books;
select * from members_test;
select *  
    from members_test m left outer join 
    (select * 
        from lists l 
        left outer join books b
        on l.bno = b.bno) a 
    on m.mno = a.mno where name ='ȫ�浿';
update