##### https://datalemur.com/blog/google-sql-interview-questions
###### SQL QUESTION 5: What is database denormalization?
```aidl
Denormalization is the process of modifying a database schema in a way that deviates from the typical rules of normalization (1NF, 2NF, 3NF, etc.).

Denormalization is often used to improve the performance of a database, particularly when it is being used for reporting and analytical purposes (rather than in an Online Transaction Processing (OLTP) manager).

By duplicating data, denormalization can reduce the number of expensive joins required to retrieve data, which can improve query performance. However, denormalization can also cause problems such as increased data redundancy and the need for more complex update and delete operations.
```

###### SQL QUESTION 7: What do stored procedures do?
```aidl
Stored procedures are a lot like functions in programming. They're used to encapsulate and organize business logic into one unit of code, and they can accept multiple input parameters and return multiple output values.

For example, if you were a Data Analyst at Google working on a HR analytics project, you might create a stored procedure to calculate the average salary for a given department:

CREATE FUNCTION get_avg_salary(department_name TEXT)
RETURNS NUMERIC AS
$BODY$
BEGIN
RETURN (SELECT AVG(salary) FROM google_employees WHERE department = department_name);
END;
$BODY$
LANGUAGE 'plpgsql';
To call this stored procedure and find the average salary for the Data Analytics department you'd write the following query:

SELECT get_avg_salary('Data Analytics');
```

###### SQL QUESTION 9: What do the EXCEPT / MINUS operators do, and can you give an example?

```aidl
The MINUS/EXCEPT operator is used to remove to return all rows from the first SELECT statement that are not returned by the second SELECT statement.

Note that EXCEPT is available in PostgreSQL and SQL Server, while MINUS is available in MySQL and Oracle (but don't stress about knowing which DBMS supports what exact commands since the interviewers at Google should be lenient!).
```

###### SQL QUESTION 12: In database design, what do foreign keys do?
```aidl
A foreign key is a column or group of columns in a table that refers to the primary key in another table. The foreign key constraint helps maintain referential integrity between the two tables.

Let's examine employee data from Google's HR database:

google_employees:

+------------+------------+------------+------------+ | employee_id| first_name | last_name | manager_id | +------------+------------+------------+------------+ | 1 | Aubrey | Graham | 3 | | 2 | Marshal | Mathers | 3 | | 3 | Dwayne | Carter | 4 | | 4 | Shawn | Carter | | +------------+------------+------------+------------+

In this table, employee_id serves as the primary key and manager_id functions as a foreign key because it links to the employee_id of the employee's manager. This establishes a relationship between Google employees and their managers, allowing for easy querying to find an employee's manager or see which employees report to a specific manager.

The google_employees table may also have multiple foreign keys that reference primary keys in other tables. For example, department_id and location_id foreign keys could be used to connect each employee to their respective department and location.
```