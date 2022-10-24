-- Overall Bounce Rate

SELECT 

COUNT(totals.bounces) / COUNT(visitId) * 100 AS bounce_rate

FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
_TABLE_SUFFIX BETWEEN '20170101' AND '20170331'

