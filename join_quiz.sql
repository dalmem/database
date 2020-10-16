/*���� 1.
-EMPLOYEES ���̺��, DEPARTMENTS ���̺��� DEPARTMENT_ID�� ����Ǿ� �ֽ��ϴ�.
-EMPLOYEES, DEPARTMENTS ���̺��� ������� �̿��ؼ�
���� INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER ���� �ϼ���. (�޶����� ���� ���� Ȯ��)*/
select * from employees e join departments d on e.department_id = d.department_id;
select * from employees e left outer join departments d on e.department_id = d.department_id;
select * from employees e right outer join departments d on e.department_id = d.department_id;
select * from employees e full outer join departments d on e.department_id = d.department_id;

/*���� 2.
-EMPLOYEES, DEPARTMENTS ���̺��� INNER JOIN�ϼ���
����)employee_id�� 200�� ����� �̸�, department_id�� ����ϼ���
����)�̸� �÷��� first_name�� last_name�� ���ļ� ����մϴ�*/
select * from employees;
select first_name||' '||last_name as name, e.department_id from employees e join departments d on e.department_id = d.department_id where e.employee_id = '200';

/*���� 3.
-EMPLOYEES, JOBS���̺��� INNER JOIN�ϼ���
����) ��� ����� �̸��� �������̵�, ���� Ÿ��Ʋ�� ����ϰ�, �̸� �������� �������� ����
HINT) � �÷����� ���� ����� �ִ��� Ȯ��*/
SELECT first_name||' '||last_name as name, e.job_id, job_title from employees e join jobs j on e.job_id = j.job_id order by name;

/*���� 4.
--JOBS���̺�� JOB_HISTORY���̺��� LEFT_OUTER JOIN �ϼ���.*/
select * from jobs j left outer join job_history jh on j.job_id = jh.job_id;

/*���� 5.
--Steven King�� �μ����� ����ϼ���.*/
select first_name||' '||last_name as name, e.department_id, d.department_name 
from employees e join departments d on e.department_id = d.department_id where first_name||' '||last_name ='Steven King';

/*���� 6.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� Cartesian Product(Cross join)ó���ϼ���*/
select * from employees e cross join departments d;

/*���� 7.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� SA_MAN ������� �����ȣ, �̸�,
�޿�, �μ���, �ٹ����� ����ϼ���. (Alias�� ���)*/
select * from locations;
select e.employee_id, job_id, first_name ||' '||last_name as name, salary as �޿�, d.department_name as �μ���,
l.postal_code||' '||l.street_address ||' '|| l.city ||' '|| l.state_province||' '||l.country_id as �ٹ���
from employees e 
left outer join departments d on e.department_id = d.department_id 
left outer join locations l on d.location_id = l.location_id where JOB_ID = 'SA_MAN';

/*���� 8.
-- employees, jobs ���̺��� ���� �����ϰ� job_title�� 'Stock Manager', 'Stock Clerk'�� ���� ������
����ϼ���.*/
select * from employees e left outer join jobs j on e.job_id = j.job_id where job_title in('Stock Manager','Stock Clerk') ;

/*���� 9.
-- departments ���̺��� ������ ���� �μ��� ã�� ����ϼ���. LEFT OUTER JOIN ���*/
select * from employees order by manager_id;
select  d.department_name from departments d left outer join employees e on d.department_id = e.department_id where e.employee_id is null;

/*���� 10.
-join�� �̿��ؼ� ����� �̸��� �� ����� �Ŵ��� �̸��� ����ϼ���
��Ʈ) EMPLOYEES ���̺�� EMPLOYEES ���̺��� �����ϼ���.*/
select e1.first_name||' '||e1.last_name as �����, e2.first_name||' '||e2.last_name as �Ŵ���
from employees e1 join employees e2 on e1.manager_id = e2.employee_id;

/*���� 11.
--6. EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)��, �Ŵ����� �̸�, �Ŵ����� �޿� ���� ����ϼ���
--�Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� ����ϼ���*/
select e2.first_name||' '||e2.last_name as ������, e1.first_name||' '||e1.last_name as �Ŵ���, e2.salary 
from employees e1 left join employees e2 on e2.manager_id = e1.employee_id where e2.manager_id is not null order by e2.salary desc;
