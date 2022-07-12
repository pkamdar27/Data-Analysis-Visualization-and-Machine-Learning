

WITH a AS
(SELECT *
FROM (SELECT DISTINCT platform
      from Experiments) a,
     (SELECT DISTINCT experiment_name
      from Experiments) b)
      

SELECT a.platform, a.experiment_name, count(*) as num_experiments
FROM a
LEFT JOIN Experiments e
using (platform, experiment_name)
GROUP BY a.platform, e.experiment_name
ORDER BY platform, num_experiments
