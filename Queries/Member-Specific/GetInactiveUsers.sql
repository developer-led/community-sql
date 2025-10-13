/* Get number of inactive (those that do not post) users */

SELECT
    users.id,
    users.username_lower AS "username",
    users.created_at,
    users.last_seen_at
FROM users
WHERE users.active = false
ORDER BY users.id ASC;