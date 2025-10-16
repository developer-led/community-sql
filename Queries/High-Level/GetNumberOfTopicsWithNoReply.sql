/* Get number of topics with no reply per month */

SELECT date_part('month', created_at) AS Month, date_part('year', created_at) AS Year, count(id) AS "Unanswered Topics"
FROM topics t
WHERE archetype <> 'private_message' -- we want to exclude private messaging threads as they are also treated as topics in Discourse
    AND deleted_at IS NULL
    AND posts_count = 1
    
GROUP BY Year, Month
ORDER BY Year DESC, Month DESC;