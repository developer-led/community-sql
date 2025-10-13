/* Get number of topics solved by month*/

SELECT concat(
        date_part('year', created_at), '-',
        date_part('month', created_at)) AS month,
    count(id) AS total_solved
FROM user_actions
WHERE action_type = '15' -- Discourse Action Types: https://meta.discourse.org/t/user-actions-action-types/322267/2
    AND date_part('year', created_at) > '2017'
GROUP BY month
ORDER BY month;