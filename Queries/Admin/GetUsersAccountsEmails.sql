/* Get users' accounts emails */

-- params:
-- :interval = '365 days'
-- :trunc    = 'day'

WITH t AS (
  SELECT
    DATE_TRUNC(:trunc, CURRENT_TIMESTAMP - (:interval)::interval) AS start_ts,
    DATE_TRUNC(:trunc, CURRENT_TIMESTAMP) AS end_ts
)
SELECT
  ue.user_id,
  ue.email,
  ue.created_at
FROM user_emails AS ue
CROSS JOIN t
WHERE ue.created_at >= t.start_ts
  AND ue.created_at <  t.end_ts
ORDER BY ue.created_at DESC;
