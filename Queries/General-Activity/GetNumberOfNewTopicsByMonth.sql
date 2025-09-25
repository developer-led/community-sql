/* Get number of new topics by month */

SELECT concat(date_part('year', created_at), '-', date_part('month', created_at)) AS month,
    count(id) AS "New_Topics"
FROM topics
WHERE archetype <> 'private_message' -- private DM threads are treated as topics in Discourse and we want to exclude them here
    AND user_id NOT IN ('-1', '-2')
    AND date_part('year', created_at) > '2017' -- from what date point we want to count those topics
GROUP BY month  
ORDER BY month DESC;