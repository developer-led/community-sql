/* Get all-time number of solutions per user */

SELECT user_id, COUNT(1) AS solved_count
FROM user_actions
WHERE action_type = 15 -- Discourse Action Types: https://meta.discourse.org/t/user-actions-action-types/322267/2

GROUP BY user_id
ORDER BY solved_count DESC;