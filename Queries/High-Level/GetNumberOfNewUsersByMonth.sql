/* Get number of new users by month */

SELECT concat(date_part('year', created_at), '-', date_part('month', created_at)) AS month,
        count(id) AS count
FROM "users"
GROUP BY month
ORDER BY month DESC;