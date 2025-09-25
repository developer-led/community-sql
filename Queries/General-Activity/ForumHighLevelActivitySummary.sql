/* Get a summary of solutions, new users, active users, new topics created, FAQ views and reply rate by month */

-- [params]
-- string :interval = 1 month

SELECT
/* SOLUTIONS */
    (SELECT count(*)
    FROM user_actions ua WHERE ua.created_at >= date_trunc('month', CURRENT_DATE - INTERVAL :interval)
    AND created_at < date_trunc('month', CURRENT_DATE)
    AND action_type = 15 -- Discourse Action Types: https://meta.discourse.org/t/description-of-fields-returned-by-discourse-api/168968
    ) AS solutions,

/* USERS */
    /* NEW USERS */
    (SELECT count(*)
    FROM users u WHERE u.id > 0
    AND created_at >= CURRENT_DATE - INTERVAL :interval
    ) AS new_users,
    
    /* ACTIVE USERS */
    (SELECT count(*)
    FROM users u WHERE (u.last_posted_at >= date_trunc('month', CURRENT_DATE - INTERVAL :interval) 
    AND u.last_posted_at < date_trunc('month', CURRENT_DATE)) -- active user defined as somebody who posted at least one
    ) AS active_users,

/* TOPICS */
    /* NEW TOPICS */
    (SELECT count(*)
    FROM topics t WHERE t.created_at >= date_trunc('month', CURRENT_DATE - INTERVAL :interval) 
    AND created_at < date_trunc('month', CURRENT_DATE)
    AND t.deleted_at IS NULL -- takes into account only existing topics
    AND t.user_id NOT IN ('-1', '-2')
    ) AS new_topics,
    
/* FAQs*/    
    /* FAQ Views */
    (SELECT SUM(views)
    FROM topics t WHERE t.created_at >= date_trunc('month', CURRENT_DATE - INTERVAL :interval)
    AND created_at < date_trunc('month', CURRENT_DATE)
    AND category_id = 42 -- replace with your FAQ category_id
    ) AS faq_views,
    
/* REPLIES */
    /* REPLY RATE */
    concat(((1 - ((SELECT COUNT(id)
    FROM topics WHERE archetype <> 'private_message' -- excluding replies in private DMs
    AND deleted_at IS NULL -- takes into account only existing replies
    AND posts_count = 1
    AND created_at >= date_trunc('month', CURRENT_DATE - INTERVAL :interval)
    AND created_at < date_trunc('month', CURRENT_DATE)
    )::float /
    (SELECT COUNT(id)
    FROM topics WHERE archetype <> 'private_message' -- excluding replies in private DMs
    AND user_id not in ('-1', '-2')
    AND created_at >= date_trunc('month', CURRENT_DATE - INTERVAL :interval)
    AND created_at < date_trunc('month', CURRENT_DATE)
    ))) * 100)::decimal(4,2),'%') AS reply_rate;