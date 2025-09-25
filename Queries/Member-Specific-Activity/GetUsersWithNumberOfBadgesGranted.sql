/* In Discourse forums, users can get badges for their activity, which is also a sign of their activation*/

-- [params]
-- string :interval = 1 month
-- string :trunc = month

SELECT user_id,
       COUNT(id) AS badge_count
FROM user_badges
WHERE granted_at >= DATE_TRUNC(:trunc, CURRENT_TIMESTAMP - INTERVAL :interval)
  AND granted_at <  DATE_TRUNC(:trunc, CURRENT_TIMESTAMP)
GROUP BY user_id
ORDER BY badge_count DESC;