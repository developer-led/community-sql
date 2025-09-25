/* Number of ambassadors' replies in a specific time frame */

-- [params]
-- string :interval = 1 week

SELECT posts.user_id,
       COUNT(posts.id) AS replies
FROM posts
WHERE posts.created_at >= DATE_TRUNC('week', CURRENT_TIMESTAMP - INTERVAL :interval)
  AND posts.created_at <  DATE_TRUNC('week', CURRENT_TIMESTAMP)
  AND posts.user_id IN (
        SELECT users.id
        FROM users
        WHERE users.primary_group_id = 42 -- replace with your group ID
  )
  AND posts.user_id NOT IN ('-1', '-2')
GROUP BY posts.user_id
ORDER BY replies DESC;