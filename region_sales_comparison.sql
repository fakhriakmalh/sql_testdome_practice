--Regional Sales Comparison 


--An insurance company maintains records of sales made by its employees. Each employee is assigned 
--to a state. States are grouped under regions. The following tables contain the data:

--TABLE regions
--  id INTEGER PRIMARY KEY
--  name VARCHAR(50) NOT NULL

--TABLE states
--  id INTEGER PRIMARY KEY
--  name VARCHAR(50) NOT NULL
--  regionId INTEGER NOT NULL REFERENCES regions(id)

--TABLE employees
--  id INTEGER PRIMARY KEY
--  name VARCHAR(50) NOT NULL
--  stateId INTEGER NOT NULL REFERENCES states(id)

--TABLE sales
--  id INTEGER PRIMARY KEY
--  amount INTEGER NOT NULL
--  employeeId INTEGER NOT NULL REFERENCES employees(id)  

--Management requires a comparative region sales analysis report.

--Write a query that returns:

--The region name.
--Average sales per employee for the region (Average sales = Total sales made for the region / Number of employees in the region).
--The difference between the average sales of the region with the highest average sales, and the average sales per employee for the region (average sales to be calculated as explained above).
--Employees can have multiple sales. A region with no sales should be also returned. Use 0 for average sales per employee for such a region when calculating the 2nd and the 3rd column.


select y.* , ifnull(max(y.sales) over() - y.sales,0) as diff from 
(select x.region , ifnull(avg(x.amount),0) as sales from 
(select e.name, st.region as region, st.state as state, sl.amount 
from employees e
left join 
(select r.id as regionId, r.name as region , s.id as stateId, s.name as state 
from regions r left join states s on r.id = s.regionId) st 
on e.stateId = st.regionId
left join sales sl on sl.employeeId = e.id) x
group by x.region ) y