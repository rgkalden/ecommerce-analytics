-- Average Order Value

SELECT 

SUM(totals.totalTransactionRevenue / 1000000) / COUNT(totals.totalTransactionRevenue) AS average_order_value

FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
_TABLE_SUFFIX BETWEEN '20170101' AND '20170331'
