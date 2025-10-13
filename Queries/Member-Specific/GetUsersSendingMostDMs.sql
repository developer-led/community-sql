/* List of users sending most DMs in specified time interval */
/* This is useful when you want to encourage them and redirect their communication to public threads */

SELECT user_id, count(*) AS message_count
FROM topics
WHERE archetype = 'private_message' AND subtype = 'user_to_user'
    AND age(created_at) < interval '7 days' -- specify your time interval here
GROUP BY user_id
ORDER BY message_count DESC;