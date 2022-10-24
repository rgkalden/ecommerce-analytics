-- Sales conversion rate

SELECT 

COUNT(totals.totalTransactionRevenue / 1000000) / COUNT(visitId) * 100 AS sales_conversion_rate

FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
_TABLE_SUFFIX BETWEEN '20170101' AND '20170331'