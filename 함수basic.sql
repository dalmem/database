--lower - (�ҹ���), upper - (�빮��), initcap - (ù���� �빮��)
SELECT  'abcDEF',lower('abcDEF'), upper('abcDEF'), initcap('abcDEF') FROM DUAL;

SELECT  * FROM employees;
select last_name, lower(last_name), UPPER(last_name), INITCAP(last_name) from employees;
select last_name from employees where lower(last_name) = 'bull'; --where ���ǿ��� �Լ��� ������ ����

--length() - ����, instr - ���ڰ˻�
select first_name , LENGTH(first_name) as ����, instr(first_name , 'a') as ������ġ from employees;
select length('abc'), instr('abcdefg', 'a') from dual;

--substr() - ���ڿ��ڸ���, concat() - ���ڿ����̱�
select substr('abcdef',1,3), concat('abc','def') from dual;
select first_name, substr(first_name,1,3), concat(first_name, last_name) from employees;

-- LPAD, RPAD - �¿��� ���� ���ڿ��� ä���
select lpad('abc',10,'*') from dual;
select rpad('abc',10,'*') from dual;
select lpad(first_name, 10 ,'-'), rpad(first_name,10,'-') from employees;

-- LTRIM, RTRIM, TRIM - ��������, ��������
select ltrim('javascript_java', 'java') from dual; --���ʿ��� java���� ����
select rtrim('javascript_java', 'java') from dual; --�����ʿ��� java���� ����
select trim('   java    ') from dual; --���� ��������

--REPLACE - ���ڿ� ġȯ
select 'my dream is president', replace('my dream is president','president','programmer') from dual;
select replace('my dream is president',' ','')from dual;
select ltrim(replace(replace('my dream is president','president','programmer'),' ',''),'my') from dual;


