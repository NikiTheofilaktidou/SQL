USE Company;
-- ***  1. �� ������ ���� ���������� ��� �������� ��� ���������� �����
SELECT*FROM employees WHERE salary = (SELECT MAX(salary) FROM employees);

-- ***  2. �� ������ ���� ���������� ��� ���������� ��� ���� ����� �� �� �������� 324
SELECT*FROM employees WHERE depid=(SELECT depid FROM employees WHERE id=324);

-- ***  3. �� ������ �� ����� ��� ��������  ��� ����� ���������� ��������� �� ������ �� ������ ������ ���� 5%� ������ ��� �� ������ ���� 100 ����
SELECT DISTINCT name FROM departments,employees WHERE departments.id=employees.depid  AND salary*0.05 = 100;

-- ***  4. �� ������ �� ���� �� �� ���������� ���������� �������
SELECT title FROM projects WHERE startdate=(SELECT MIN(startdate) FROM projects);

-- ***  5. �� ������� �� ��������� ��� � ������ ���� ����� ����������� ��� �� ���� ����� ��� ��������� ��� �������� 4
SELECT firstname, lastname, salary FROM employees WHERE salary>(SELECT AVG(salary) FROM employees WHERE depid=4);

-- ***  6. �� ������� �� ������� ��� ��������� ��� �� ����� ��� �������� ���� ��� ���� ���������� ��� ������������� �� ���� �� ������� ������� ���������� ��� 50% �� ������� ���������� �� ���� ��� ������ ��������
SELECT firstname, lastname, [name] AS 'Dep Name' FROM employees,workson,departments,projects WHERE departments.id=employees.depid 
AND employees.id=workson.empid AND projects.id=workson.proid AND progress>50 ORDER BY depid;

-- ***  7. �� ������ �� id ��� �������� ���� � ������ ����� ����������� ��� �� ���� ��� ��� ������ ��������������� �� 1.5 ��� �� ����� 5
SELECT DISTINCT depid FROM employees WHERE salary>(SELECT AVG(salary)*1.5 FROM employees WHERE depid=5);

-- ***  8. �� ������ �� ��������� ��� ��������� ��� ��� ������� ��� id ��� �������� ���� � ������ ����� ����������� ��� �� ���� ��� ��� ������ ��������������� �� 1.5 ��� �� ����� 5
SELECT DISTINCT * FROM employees WHERE NOT (salary > (SELECT AVG(salary)* 1.5 FROM employees WHERE depid = 5));