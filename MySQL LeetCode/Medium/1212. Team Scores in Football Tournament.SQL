-- Table: Teams

-- +---------------+----------+
-- | Column Name   | Type     |
-- +---------------+----------+
-- | team_id       | int      |
-- | team_name     | varchar  |
-- +---------------+----------+
-- team_id is the primary key of this table.
-- Each row of this table represents a single football team.
 

-- Table: Matches

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | match_id      | int     |
-- | host_team     | int     |
-- | guest_team    | int     | 
-- | host_goals    | int     |
-- | guest_goals   | int     |
-- +---------------+---------+
-- match_id is the primary key of this table.
-- Each row is a record of a finished match between two different teams. 
-- Teams host_team and guest_team are represented by their IDs in the Teams table (team_id), and they scored host_goals and guest_goals goals, respectively.
 

-- You would like to compute the scores of all teams after all matches. Points are awarded as follows:
-- A team receives three points if they win a match (i.e., Scored more goals than the opponent team).
-- A team receives one point if they draw a match (i.e., Scored the same number of goals as the opponent team).
-- A team receives no points if they lose a match (i.e., Scored fewer goals than the opponent team).
-- Write an SQL query that selects the team_id, team_name and num_points of each team in the tournament after all described matches.

-- Return the result table ordered by num_points in decreasing order. In case of a tie, order the records by team_id in increasing order.

-- The query result format is in the following example.


# Write your MySQL query statement below

SELECT team_id, team_name, IFNULL(SUM(num_points),0) as num_points
FROM 
(SELECT t.team_id, t.team_name,
    sum(CASE WHEN m.host_goals > m.guest_goals THEN 3
        WHEN m.host_goals = m.guest_goals THEN 1
        WHEN m.host_goals < m.guest_goals THEN 0 END) as num_points
FROM Teams t
LEFT JOIN Matches m
ON t.team_id = m.host_team
GROUP BY t.team_id

UNION ALL

SELECT t.team_id, t.team_name,
    sum(CASE WHEN m.guest_goals > m.host_goals THEN 3
        WHEN m.guest_goals = m.host_goals THEN 1
        WHEN m.guest_goals < m.host_goals THEN 0 END) as num_points
FROM Teams t
LEFT JOIN Matches m
ON t.team_id = m.guest_team
GROUP BY t.team_id) as a

GROUP BY team_id
ORDER BY num_points DESC, team_id ASC



 