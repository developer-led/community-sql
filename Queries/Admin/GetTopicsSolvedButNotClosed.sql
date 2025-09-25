/* Get a list of topics that were solved but not closed */

SELECT 'https://community.auth0.com/t/' || id AS "TopicID", title
FROM topics
WHERE id IN (
        SELECT target_topic_id FROM user_actions WHERE action_type = '15') -- Discourse Action Types: https://meta.discourse.org/t/user-actions-action-types/322267/2
        AND closed is false;