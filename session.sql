--Sessions 
--Write a query that selects userId and average session duration 
--for each user who has more than one session.


--TABLE sessions
--  id INTEGER PRIMARY KEY,
--  userId INTEGER NOT NULL,
--  duration DECIMAL NOT NULL


select userId, avg(duration) from sessions 
group by userId
having count(id) > 1