/* Get number of topics solved by employees by month */

-- [params]
-- string :interval = 1 month
-- string :trunc = month

WITH timeframe AS (
SELECT date_trunc(:trunc, CURRENT_TIMESTAMP - INTERVAL :interval) AS start,
    date_trunc(:trunc, CURRENT_TIMESTAMP) AS end),

employees AS (
    SELECT id
    FROM users
    WHERE primary_group_id = '41' -- replace with your employee group_id
    )
SELECT concat(
        date_part('year', ua.created_at), '-',
        date_part('month', ua.created_at)) AS month,
    count(ua.id) AS Solved
FROM user_actions ua, employees, timeframe
WHERE action_type = '15' AND ua.user_id = employees.id -- Discourse Action Types: https://meta.discourse.org/t/description-of-fields-returned-by-discourse-api/168968
GROUP BY month
ORDER BY month DESC;