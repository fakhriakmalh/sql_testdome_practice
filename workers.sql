--Workers 
--The following data definition defines an organization's employee hierarchy.

--An employee is a manager if any other employee has their managerId set to this employee's id. 
--That means John is a manager if at least one other employee has their managerId set to John's id.

--Write a query that selects the names of employees who are not managers.

select name from employees 
where id not in (select managerId from employees where managerId is not null)