
/* Drop Tables */

DROP TABLE order_list CASCADE CONSTRAINTS;
DROP TABLE deliDetail CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE customer CASCADE CONSTRAINTS;
DROP TABLE products CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE customer
(
	phone_num number(15) NOT NULL,
	name varchar2(10) NOT NULL,
	address varchar2(20) NOT NULL,
	PRIMARY KEY (phone_num, address)
);


CREATE TABLE deliDetail
(
	phone_num number(15) NOT NULL,
	address varchar2(20) NOT NULL,
	dePhone number(14) NOT NULL,
	deNum number(10,0) NOT NULL,
	company varchar2(20) NOT NULL,
	massage varchar2(100),
	order_num number(10,0),
	PRIMARY KEY (deNum)
);


CREATE TABLE orders
(
	price number(10,0) NOT NULL,
	num number(3,0),
	payment varchar2(20) NOT NULL,
	message varchar2(100),
	product varchar2(20) NOT NULL,
	phone_num number(15) NOT NULL,
	order_num number(10,0) NOT NULL,
	address varchar2(20) NOT NULL,
	PRIMARY KEY (order_num)
);


CREATE TABLE order_list
(
	order_date date DEFAULT sysdate NOT NULL,
	totalprice number(10,0) NOT NULL,
	product number(10,0) NOT NULL,
	order_num number(10,0) NOT NULL
);


CREATE TABLE products
(
	product varchar2(20) NOT NULL,
	price number(10,0) NOT NULL,
	num number(10,0),
	explanation varchar2(300),
	PRIMARY KEY (product)
);



/* Create Foreign Keys */

ALTER TABLE deliDetail
	ADD FOREIGN KEY (phone_num, address)
	REFERENCES customer (phone_num, address)
;


ALTER TABLE orders
	ADD FOREIGN KEY (phone_num, address)
	REFERENCES customer (phone_num, address)
;


ALTER TABLE order_list
	ADD FOREIGN KEY (product)
	REFERENCES deliDetail (deNum)
;


ALTER TABLE deliDetail
	ADD FOREIGN KEY (order_num)
	REFERENCES orders (order_num)
;


ALTER TABLE order_list
	ADD FOREIGN KEY (order_num)
	REFERENCES orders (order_num)
;


ALTER TABLE orders
	ADD FOREIGN KEY (product)
	REFERENCES products (product)
;



