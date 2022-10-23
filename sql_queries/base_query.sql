-- Base query example

SELECT 
fullVisitorId,
visitId,
date,
visitNumber,
totals.visits,
totals.hits,
totals.pageviews,
totals.timeOnSite,
totals.bounces,
totals.transactions,
totals.totalTransactionRevenue / 1000000 AS totalTransactionRevenue,
device.deviceCategory,
geoNetwork.country,
trafficSource.source,
channelGrouping
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
_TABLE_SUFFIX BETWEEN '20170101' AND '20170331'