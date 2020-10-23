        ���� 1.
        -EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� �����͸� ��� �ϼ��� ( AVG(�÷�) ���)
        -EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� ���� ����ϼ���
        -EMPLOYEES ���̺��� job_id�� IT_PFOG�� ������� ��ձ޿����� ���� ������� �����͸� ����ϼ���
        
        select first_name, salary  from employees where salary > (select avg(salary) from employees) order by salary;
        ���� 2.
        -DEPARTMENTS���̺��� manager_id�� 100�� ����� department_id��
        EMPLOYEES���̺��� department_id�� ��ġ�ϴ� ��� ����� ������ �˻��ϼ���.
        select * from employees where department_id in (select department_id from departments where manager_id =100);
        
        ���� 3.
        -EMPLOYEES���̺��� ��Pat���� manager_id���� ���� manager_id�� ���� ��� ����� �����͸� ����ϼ���
        -EMPLOYEES���̺��� ��James��(2��)���� manager_id�� ���� ��� ����� �����͸� ����ϼ���.
        select * from employees where manager_id > all(select manager_id from employees where first_name = 'Pat');
        select * from employees where manager_id in(select manager_id from employees where first_name = 'James');
        ���� 4.
        -EMPLOYEES���̺� ���� first_name�������� �������� �����ϰ�, 41~50��° �������� �� ��ȣ, �̸��� ����ϼ���
        select *
            from (
                (select rownum as rn, first_name 
                from 
                    (select * 
                     from employees order by first_name desc))
        )where rn>=41 and rn<=50 ;
        ���� 5.
        -EMPLOYEES���̺��� hire_date�������� �������� �����ϰ�, 31~40��° �������� �� ��ȣ, ���id, �̸�, ��ȣ,
        �Ի����� ����ϼ���.
        select *from(select rownum as rn, employee_id, first_name,phone_number,hire_date 
        from(select * from 
        employees order by hire_date))
        where rn >=31 and rn<=40
        ;
        
        ���� 6.
        employees���̺� departments���̺��� left �����ϼ���
        ����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ��� �� ����մϴ�.
        ����) �������̵� ���� �������� ����
        
        select employee_id,first_name||' '||last_name as name, d.department_id, department_name 
        from employees e 
        left join departments d 
        on e.department_id = d.department_id
        order by employee_id;
        
        ���� 7.
        ���� 6�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
        select  employee_id,
            first_name||' '||last_name,
            (select department_name  from departments d where e.department_id=d.department_id),
            e.department_id
        from employees e 
        order by employee_id asc;
        ���� 8.
        departments���̺� locations���̺��� left �����ϼ���
        ����) �μ����̵�, �μ��̸�, �Ŵ������̵�, �����̼Ǿ��̵�, ��Ʈ��_��巹��, ����Ʈ �ڵ�, ��Ƽ �� ����մϴ�
        ����) �μ����̵� ���� �������� ����
        select department_id, department_name, manager_id, l.location_id, street_address, postal_code, city 
        from departments d 
        left join locations l 
        on d.location_id=l.location_id;
        ���� 9.
        ���� 8�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
        select d.department_id,
            d.department_name,
            d.manager_id,
            d.location_id,
            (select street_address from locations l where d.location_id = l.location_id) as xx,
            (select postal_code from locations l where d.location_id = l.location_id) as yy,
            (select city from locations l where d.location_id = l.location_id) as zz
            from departments d
        order by d.department_id;
        ���� 10.
        locations���̺� countries ���̺��� left �����ϼ���
        ����) �����̼Ǿ��̵�, �ּ�, ��Ƽ, country_id, country_name �� ����մϴ�
        ����) country_name���� �������� ����
        select location_id, street_address, city, c.country_id, country_name 
        from locations l 
        left outer join countries c 
        on l.country_id = c.country_id order by country_name;
        ���� 11.
        ���� 10�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
        select l.location_id, 
            l.street_address, 
            l.city, 
            l.country_id, 
            (select country_name from countries c where l.country_id = c.country_id)
        from locations l order by country_name
        ;
        
        
        ����
        ���ΰ� ��������
        ���� 12.
        employees���̺�, departments���̺��� left���� hire_date�� �������� �������� 1-10��° �����͸� ����մϴ�
        ����) rownum�� �����Ͽ� ��ȣ, �������̵�, �̸�, ��ȭ��ȣ, �Ի���, �μ����̵�, �μ��̸� �� ����մϴ�.
        ����) hire_date�� �������� �������� ���� �Ǿ�� �մϴ�. rownum�� Ʋ������ �ȵ˴ϴ�.
        
        select *
        from (select rownum as rn, 
                employee_id, 
                first_name, 
                hire_date,
                department_id
                from
                    (select e.employee_id ,hire_date,first_name,d.department_id
                    from employees e 
                    left outer join departments d 
                    on e.department_id=d.department_id 
                    order by hire_date))
        where rn <=10;
        ���� 13.
        --EMPLOYEES �� DEPARTMENTS ���̺��� JOB_ID�� SA_MAN ����� ������ LAST_NAME, JOB_ID,
        DEPARTMENT_ID,DEPARTMENT_NAME�� ����ϼ���
        select last_name, job_id, department_id, department_name from (select last_name, job_id, e.department_id, department_name
                    from employees e 
                    left outer join departments d 
                    on e.department_id=d.department_id) where last_name in (select last_name from employees where job_id ='SA_MAN');
                    
        select a.last_name, a.job_id,d.*
        from(select * from employees
            where job_id = 'SA_MAN') a
            left join departments d
            on a.department_id = d.department_id;
        ���� 14
        --DEPARTMENT���̺��� �� �μ��� ID, NAME, MANAGER_ID�� �μ��� ���� �ο����� ����ϼ���.
        --�ο��� ���� �������� �����ϼ���.
        --����� ���� �μ��� ������� ���� �ʽ��ϴ�
        select  d.*,
                e.total        
        from (select department_id,count(*) as total
                from employees 
                group by department_id) e 
                join departments d 
                on e.department_id = d.department_id
        ;
        
        ���� 15
        --�μ��� ���� ���� ���ο�, �ּ�, �����ȣ, �μ��� ��� ������ ���ؼ� ����ϼ���
        --�μ��� ����� ������ 0���� ����ϼ���
        select l.*,
                nvl(d.salary,0)as salary
        from (select * from departments d
                left outer join(select department_id,
                        trunc(avg(salary))as salary
                    from employees 
                    group by department_id) e 
                on d.department_id = e.department_id
        ) d 
        left outer join locations l
        on d.location_id = l.location_id
        ;
        
        
            
        
        
        
        
            
            
            
���� 16
���� 15����� ���� DEPARTMENT_ID�������� �������� �����ؼ� ROWNUM�� �ٿ� 1-10������ ������
����ϼ���
select * from(     
    select rownum as rn,
            department_id,
            department_name,
            street_address,
            postal_code,
            salary
        from(
        select 
                    department_id,
                    department_name,
                    street_address,
                    postal_code,
                    salary
            from(
                    select d.department_id,
                            d.department_name,
                            d.location_id,
                            nvl(salary,0)as salary
                    from departments d
                    left outer join(select department_id,
                            trunc(avg(salary))as salary
                        from employees 
                        group by department_id) e 
                    on d.department_id = e.department_id) a
        left outer join locations l
        on a.location_id = l.location_id
        order by department_id desc 
        )) where rn<=10
;
