/* Provides stats for consolidated pageviews for crawlers, logged in and anonymous users by month 
allowing you to track real number of views coming from your audience */

-- [params]
-- date :start_date
-- date :end_date

SELECT
  ar.date AS day,
  CASE ar.req_type
    WHEN 6 THEN 'Crawlers'
    WHEN 7 THEN 'Logged-in users'
    WHEN 8 THEN 'Anonymous users'
  END AS audience,
  ar.count AS views
FROM application_requests AS ar
WHERE ar.req_type IN (6, 7, 8)
  AND ar.date BETWEEN :start_date::date AND :end_date::date
ORDER BY day ASC, ar.req_type;
