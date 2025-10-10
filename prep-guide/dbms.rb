

Q. Key Properties of Transactions (ACID)

A database transaction is a sequence of operations performed as a single logical unit of work.

1. Atomicity
Definition: A transaction is an atomic unit of work; it either completes entirely or does not execute at all. If any part of the transaction fails, the entire transaction is rolled back, and no changes are applied to the database.
Example: In a bank transfer scenario, the transaction of transferring money from one account to another must either debit the amount from one account and credit it to another, or neither operation should occur.

2. Consistency
Definition: Transactions must transition the database from one consistent state to another consistent state. The database must satisfy all defined constraints, rules, and triggers throughout the transaction.
Example: If an account balance must always be greater than zero, a transaction should ensure that this constraint is maintained throughout its execution.

3. Isolation
Definition: Transactions are isolated from each other, meaning the intermediate state of a transaction is not visible to other transactions until it is committed. This prevents transactions from interfering with each other.
Example: If two transactions are simultaneously attempting to update the same record, isolation ensures that each transaction sees a consistent snapshot of the data and does not interfere with the other.

4. Durability
Definition: Once a transaction is committed, its changes are permanent and must persist even in the event of a system crash or failure. The data is saved to durable storage.
Example: After completing a bank transfer, the changes to account balances should persist even if the database server crashes immediately afterward.


Q. How Databse Transactions Work

Start a Transaction: A transaction begins when the first operation (such as an INSERT, UPDATE, or DELETE statement) is executed.
Execute Operations: Various operations are performed as part of the transaction.
Commit the Transaction: If all operations succeed and the transaction can be safely completed, the changes are committed to the database. This makes all changes permanent.
Rollback the Transaction: If an error occurs or the transaction cannot be completed, a rollback is performed. This undoes all changes made during the transaction, returning the database to its previous consistent state.


SQL query -

https://www.w3resource.com/
1. Knows AI/ML
2. Knows Basics of programming
3. Knows DBMS
4. Have logical thinking"sql-exercises/joins-hr/index.php

1. SELECT e.first_name, e.last_name, d.department_name, d.department_id
FROM EMPLOYEE AS e
INNER JOIN DEPARTMENT AS d
ON d.department_id = e.department_id

2. SELECT e.first_name, e.last_name, d.department_name, l.city, l.province
FROM EMPLOYEE AS e
JOIN DEPARTMENT AS d
ON d.department_id = e.department_id
JOIN LOCATION AS l
ON l.location_id = d.location_id

3. SELECT e.first_name, e.last_name, e.salary, j.grade_level
FROM employee e
JOIN job_grades j
ON e.salary BETWEEN j.lowest_sal AND j.highest_sal

4. SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
AND d.department_id IN (80, 40)
ORDER BY e.last_name

5. SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l300-200 million y
ON l.location_id = d.location_id
WHERE e.first_name LIKE "%z%"

6. SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id

7. SELECT e.first_name, e.last_name, e.salary
FROM employees e
JOIN employees s
ON e.salary < s.salary AND s.employee_id = 182

Alternatively

SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary < ( SELECT salary FROM employees WHERE employee_id = 182 )

8. SELECT e.first_name, m.first_name
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id

9. SELECT d.department_name, l.city, l.state, l.province
FROM departments d
LEFT OUTER JOIN locations l
ON d.location_id = l.location_id

12. SELECT e.first_name, e.last_name, e.department_id
FROM employees e
JOIN employees m
ON e.department_id = m.department_id AND m.last_name = 'Taylor'

13. SELECT e.first_name, d.department_name, j.job_title, jh.start_date
FROM employees e
WHERE e.hire_date BETWEEN 1993-01-01 AND 1997-07-31

14. SELECT job_title, first_name || ' ' || last_name AS Employee_name, max_salary - salary As Salary Difference
FROM employees
NATURAL JOIN jobs

15. SELECT department_name, AVG(salary) AS avg, COUNT(commission_pct)
FROM departments
JOIN employees USING (department_id)
GROUP_BY department_name

16. SELECT job_title, first_name ||  ' '  || last_name AS employee_name, max_salary - salary AS salary_difference
FROM employees e
JOIN jobs USING (job_id)
WHERE e.department_id = 80

17. SELECT c.country_name, l.city, d.department_name
FROM countries c
JOIN locations l USING (country_id)
JOIN departments d USING (location_id)

18. SELECT e.first_name || " " || e.last_name, d.department_name
FROM employees e
JOIN departments d
ON e.employee_id = d.manager_id

19. SELECT AVG(salary) AS avg_salary, job_title
FROM employees
JOIN jobs USING (job_id)
GROUP_BY job_title

20. SELECT jh.*
FROM job_history jh
JOIN employees USING (employee_id)
WHERE salary > 120000

21. SELECT (CASE WHEN GRADES.GRADE >= 8 THEN STUDENTS.NAME ELSE 'NULL' END), GRADES.GRADE, STUDENTS.MARKS FROM STUDENT
 JOIN GRADES ON STUDENT.MARKS BETWEEN GRADES.MIN_MARK AND GRADES.MAX_MARK
 ORDER BY GRADES.GRADE DESC, STUDENT.NAME ASC;

Some Advance SQL Function:
  WITH vote_values AS (
    SELECT voter,
          candidate,
          1.0 / COUNT(*) OVER (PARTITION BY voter) AS vote_value
   FROM voting_results
   WHERE candidate IS NOT NULL
     AND candidate <> ''
  )

# window function in



Prep Resources

https://datalemur.com/questions?category=SQL
https://www.sql-practice.com/
https://leetcode.com/studyplan/top-sql-50/
https://pgexercises.com/questions/aggregates/
https://platform.stratascratch.com/coding?code_type=3&is_freemium=1&page_size=10&order_field=difficulty&difficulties=1&difficulties=2
