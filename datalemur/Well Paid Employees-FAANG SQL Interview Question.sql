# Companies often perform salary analyses to ensure fair compensation practices. One useful analysis is to check if there are any employees earning more than their direct managers.
#
# As a HR Analyst, you're asked to identify all employees who earn more than their direct managers. The result should include the employee's ID and name.
#
# employee Schema:
# column_name	type	description
# employee_id	integer	The unique ID of the employee.
# name	string	The name of the employee.
# salary	integer	The salary of the employee.
# department_id	integer	The department ID of the employee.
# manager_id	integer	The manager ID of the employee.
# employee Example Input:
# employee_id	name	salary	department_id	manager_id
# 1	Emma Thompson	3800	1	6
# 2	Daniel Rodriguez	2230	1	7
# 3	Olivia Smith	7000	1	8
# 4	Noah Johnson	6800	2	9
# 5	Sophia Martinez	1750	1	11
# 6	Liam Brown	13000	3	NULL
# 7	Ava Garcia	12500	3	NULL
# 8	William Davis	6800	2	NULL
# Example Output:
# employee_id	employee_name
# 3	Olivia Smith
# The output shows that Olivia Smith earns $7,000, surpassing her manager, William David who earns $6,800.
#
# The dataset you are querying against may have different input & output - this is just an example!

SELECT e.employee_id,e.name FROM employee e
                                     left join employee dm
                                               on e.manager_id=dm.employee_id
where e.salary>dm.salary;