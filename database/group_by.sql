--�׷��Լ� AVG, MAX, MIN, SUM, COUNT
select avg(salary),sum(salary),min(salary),max(salary),count(*)from employees;
select count(*) from employees;-- �� ������ ����
select count(first_name) from employees;--first_name�� null�� �ƴѰ���
select count(commission_pct) from employees; --commission_pct�� null�� �ƴѰ���

--�׷��Լ��� �Ϲ��÷��� ���ÿ� ����� �Ұ��� �մϴ�
--select department_id, sum(salary) from employees;
--�׷� ���� ���� �÷��� ��ȸ�� �����մϴ�
--select department_id , job_id from employees group by department_id;

--group by ���� �̿��� �׷���(group by���� where�� ������ ���ϴ�.)
select department_id,round(avg(salary),2) from employees GROUP BY department_id ;
select department_id, sum(salary), round(avg(salary)),count(*) from employees GROUP by department_id;

--2�� �̻��� �׷�ȭ
select department_id, job_id from employees group by department_id, job_id;--�μ��� job_id 
select job_id, department_id from employees group by job_id, department_id; -- job_id�� �μ���

--�Ʒ� �� ������ ����� �ٸ��ϴ�.
select department_id, sum(salary) from employees  group by department_id;
select department_id, sum(salary) from employees where salary>=5000 group by department_id;

--group by���� ���� having
select department_id, sum(salary)from employees group by department_id having sum(salary)>=100000;

--job_id �� 20�� �̻��� ����
select job_id, count(*) from employees group by job_id having count(*)>=20;

--�μ����̵� 50�̻��� �÷��� �׷�ȭ ��Ű��, �׷������ 5000�̻� ��ȸ
select department_id,count(*), trunc(avg(salary)) from employees where department_id >= 50 group by department_id  having trunc(avg(salary))>=5000 ; 
