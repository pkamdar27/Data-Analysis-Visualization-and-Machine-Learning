-- Table: Employee

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | Id          | int  |
-- | Salary      | int  |
-- +-------------+------+
-- Id is the primary key column for this table.
-- Each row of this table contains information about the salary of an employee.
 

-- Write an SQL query to report the second highest salary from the Employee table. If there is no second highest salary, the query should report null.

-- The query result format is in the following example.

 

-- Example 1:

-- Input: 
-- Employee table:
-- +----+--------+
-- | Id | Salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- Output: 
-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | 200                 |
-- +---------------------+
-- Example 2:

-- Input: 
-- Employee table:
-- +----+--------+
-- | Id | Salary |
-- +----+--------+
-- | 1  | 100    |
-- +----+--------+
-- Output: 
-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | Null                |
-- +---------------------+

# Write your MySQL query statement below
SELECT 
    Salary AS SecondHighestSalary
FROM  
    Employee
ORDER BY
    Salary Desc
LIMIT 1, 1

# Another way
SELECT 
    Max(Salary) AS SecondHighestSalary
FROM  
    Employee
WHERE Salary != (SELECT Max(Salary) 
                    FROM Employee)
