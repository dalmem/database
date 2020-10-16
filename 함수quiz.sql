/*���� 1. EMPLOYEES ���̺��� JOB_ID�� it_prog�� ����� �̸�(first_name)�� �޿�(salary)�� ����ϼ���.
���� 1) ���ϱ� ���� ���� �ҹ��ڷ� �Է��ؾ� �մϴ�.(��Ʈ : lower �̿�)
���� 2) �̸��� �� 3���ڱ��� ����ϰ� �������� *�� ����մϴ�.
�� ���� �� ��Ī�� name�Դϴ�.(��Ʈ : rpad�� substr �Ǵ� substr �׸��� length �̿�)
���� 3) �޿��� ��ü 10�ڸ��� ����ϵ� ������ �ڸ��� *�� ����մϴ�.
�� ���� �� ��Ī�� salary�Դϴ�.(��Ʈ : lpad �̿�)*/
select rpad(substr(first_name,1,3),length(first_name),'*') as name, lpad(salary,10,'*') as salary, job_id from employees where lower(job_id) ='it_prog';

/*EMPLOYEES ���̺� ���� �̸�, �Ի����� �÷����� �����ؼ� �̸������� �������� ��� �մϴ�.
���� 1) �̸� �÷��� first_name, last_name�� �ٿ��� ����մϴ�.
���� 2) �Ի����� �÷��� xx/xx/xx�� ����Ǿ� �ֽ��ϴ�. xxxxxx���·� �����ؼ� ����մϴ�.*/
select concat(first_name, last_name) as �̸�, replace(hire_date,'/','') as �Ի����� from employees ORDER BY �̸� asc ;

/*EMPLOYEES ���̺� ���� phone_numbe�÷��� ###.###.####���·� ����Ǿ� �ִ�
���⼭ ó�� �� �ڸ� ���� ��� ���� ������ȣ (02)�� �ٿ� ��ȭ ��ȣ�� ����ϵ��� ������ �ۼ��ϼ���*/
select concat('(02)',substr(phone_number,'5')) as phone_number from employees;

select employee_id as �����ȣ, concat(first_name,last_name)as �����, hire_date as �Ի�����, trunc(to_char((sysdate-hire_date)/365)) as �ټӳ�� from employees order by �ټӳ�� desc;

select * from employees;
select first_name, to_char(manager_id)  as ��� ,decode(manager_id, 100 ,'���',120 , '����',121,  '�븮',122 , '����','�ӿ�') as ����,department_id as �μ� from employees where department_id = 50;

/*���� 1.
��� ���̺��� JOB_ID�� ��� ���� ���ϼ���.
��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���*/
select job_id, count(*), trunc(avg(salary)) from employees group by job_id order by trunc(avg(salary)) desc;

/*���� 2.
��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���.*/
select to_char(hire_date,'YY') ,count(*) from employees  group by to_char(hire_date,'YY');
/*���� 3.
�޿��� 1000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. �� �μ� ��� �޿��� 2000�̻��� �μ��� ���*/
select department_id, trunc(avg(salary)) from employees where salary >= 1000 group by department_id having trunc(avg(salary))>=2000;

/*���� 4.
��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� �������
department_id(�μ���) salary(����)�� ���, �հ�, count�� ���մϴ�.
���� 1) ������ ����� Ŀ�̼��� �����Ų �����Դϴ�.
���� 2) ����� �Ҽ� 2° �ڸ����� ���� �ϼ���.*/
select department_id as �μ�, 
trunc(avg(salary+salary*commission_pct),2) as ���,
sum(salary) as �հ�,
count(*) as �ѿ� 
from employees 
where commission_pct is not null 
group by department_id;

0
