
/* Drop Triggers */

DROP TRIGGER TRI_board_bno;
DROP TRIGGER TRI_lecture_lno;
DROP TRIGGER TRI_reply_rno;



/* Drop Tables */

DROP TABLE admins CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE lecture_list CASCADE CONSTRAINTS;
DROP TABLE lecture CASCADE CONSTRAINTS;
DROP TABLE members CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_board_bno;
DROP SEQUENCE SEQ_lecture_lno;
DROP SEQUENCE SEQ_reply_rno;




/* Create Sequences */

CREATE SEQUENCE SEQ_board_bno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_lecture_lno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_reply_rno INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE admins
(
	id varchar2(50) NOT NULL,
	regdate date DEFAULT sysdate,
	PRIMARY KEY (id)
);


CREATE TABLE board
(
	bno number(10,0) NOT NULL,
	id varchar2(50) NOT NULL,
	tiltle varchar2(50),
	content varchar2(100),
	regdate date DEFAULT SYSDATE,
	PRIMARY KEY (bno)
);


CREATE TABLE lecture
(
	lno number(10,0) NOT NULL,
	teacher varchar2(50) NOT NULL,
	l_list varchar2(50) NOT NULL,
	PRIMARY KEY (lno)
);


CREATE TABLE lecture_list
(
	id varchar2(50) NOT NULL,
	lno number(10,0) NOT NULL,
	PRIMARY KEY (id, lno)
);


CREATE TABLE members
(
	id varchar2(50) NOT NULL,
	info varchar2(50),
	regdate date DEFAULT sysdate,
	PRIMARY KEY (id)
);


CREATE TABLE reply
(
	rno number(10,0) NOT NULL,
	content varchar2(100),
	regdate date DEFAULT sysdate,
	bno number(10,0) NOT NULL,
	id varchar2(50) NOT NULL,
	PRIMARY KEY (rno)
);



/* Create Foreign Keys */

ALTER TABLE reply
	ADD FOREIGN KEY (bno)
	REFERENCES board (bno)
;


ALTER TABLE lecture_list
	ADD FOREIGN KEY (lno)
	REFERENCES lecture (lno)
;


ALTER TABLE admins
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE board
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE lecture_list
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE reply
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_board_bno BEFORE INSERT ON board
FOR EACH ROW
BEGIN
	SELECT SEQ_board_bno.nextval
	INTO :new.bno
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_lecture_lno BEFORE INSERT ON lecture
FOR EACH ROW
BEGIN
	SELECT SEQ_lecture_lno.nextval
	INTO :new.lno
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_reply_rno BEFORE INSERT ON reply
FOR EACH ROW
BEGIN
	SELECT SEQ_reply_rno.nextval
	INTO :new.rno
	FROM dual;
END;

/




