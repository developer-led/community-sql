/* Get reply-rate for specific month and year */

-- [params]
-- string :month = 6
-- string :year = 2020

SELECT
    concat(((1 - ((SELECT COUNT(id)
        FROM topics
        WHERE archetype <> 'private_message'
            AND deleted_at IS NULL
            AND posts_count = 1
            AND date_part('month', created_at) = :month
            AND date_part('year', created_at) = :year
            AND category_id <> 42 -- specify category_id that you want to exclude

    )::float /
    (SELECT COUNT(id)
    FROM topics
    WHERE archetype <> 'private_message'
        AND user_id not in ('-1', '-2')
        AND date_part('month', created_at) = :month
        AND date_part('year', created_at) = :year
        AND category_id <> 42 -- specify category_id that you want to exclude
    ))) * 100)::decimal(4,2),'%') AS "Reply Rate";