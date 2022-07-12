-- Table: Employee

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | salary      | int  |
-- +-------------+------+
-- id is the primary key column for this table.
-- Each row of this table contains information about the salary of an employee.
 

-- Write an SQL query to report the nth highest salary from the Employee table. If there is no nth highest salary, the query should report null.

-- The query result format is in the following example.

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
        SELECT DISTINCT salary as 'getNthHighestSalary(2)'
        FROM (
            SELECT salary, dense_rank() over (ORDER BY salary DESC) AS rnk
            FROM Employee) sal_rank
            WHERE rnk = 2
        );            
END