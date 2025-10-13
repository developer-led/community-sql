/* Number of active users (posted at least once) within time period */

--[params]
--string :interval = 1 month
--string :trunc = month

SELECT COUNT(*)
FROM users u
WHERE u.last_posted_at >= DATE_TRUNC(:trunc, CURRENT_TIMESTAMP - INTERVAL :interval)
  AND u.last_posted_at <  DATE_TRUNC(:trunc, CURRENT_TIMESTAMP);
