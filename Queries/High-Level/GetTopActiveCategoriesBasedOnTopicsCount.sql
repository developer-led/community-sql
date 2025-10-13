/* Get top active categories based on topics created count */

-- [params]
-- string :month = 10
-- string :year = 2018

WITH cat AS (
    SELECT id, name
        FROM categories
        WHERE id NOT IN ('1','4','24') -- specify categories that you want to exclude
        ORDER BY id ASC
)

SELECT cat.name, count(t.id) as topic_count
FROM cat, topics t
WHERE t.category_id = cat.id
    AND t.category_id IN (SELECT id FROM cat)
    AND date_part('month', created_at) = :month
    AND date_part('year', created_at) = :year
    AND category_id IS NOT NULL
GROUP BY cat.name
ORDER BY topic_count DESC;