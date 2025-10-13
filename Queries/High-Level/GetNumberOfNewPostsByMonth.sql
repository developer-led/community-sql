/* Get number of new posts by month */

SELECT concat(date_part('year', created_at), '-', date_part('month', created_at)) AS month,
    count(id) AS "New_Posts"
FROM posts
WHERE post_type = 1 -- Discourse Post Types: https://meta.discourse.org/t/webhook-event-post-type/249088
    AND user_id not in ('-1', '-2')
    AND post_number > 1 -- if we don't want to count the initial posts starting the topics
GROUP BY month
ORDER BY month DESC;