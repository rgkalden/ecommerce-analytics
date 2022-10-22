/*

Run example queries at the following link on Google BigQuery

https://support.google.com/analytics/answer/4419694?hl=en&ref_topic=3416089#multiple&zippy=%2Cin-this-article

Data Dictionary available at:

https://support.google.com/analytics/answer/3437719?hl=en
*/

-- Total transactions per device browser in July 2017

SELECT
device.browser,
SUM(totals.transactions) AS total_transactions
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
_TABLE_SUFFIX BETWEEN '20170701' AND '20170731'
GROUP BY
device.browser
ORDER BY
total_transactions DESC

-- Bounce rate per traffic source in July 2017

SELECT
source,
total_visits,
total_no_of_bounces,
((total_no_of_bounces / total_visits) * 100) AS bounce_rate
FROM (
  SELECT
  trafficSource.source AS source,
  COUNT(trafficSource.source) AS total_visits,
  SUM(totals.bounces) AS total_no_of_bounces
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE
  _TABLE_SUFFIX BETWEEN '20170701' AND '20170731'
  GROUP BY
  source
)
ORDER BY
total_visits DESC

-- Average number of product pageviews for users who made a purchase in July 2017

SELECT
( SUM(total_pagesviews_per_user) / COUNT(users) ) AS avg_pageviews_per_user
FROM (
    SELECT 
    fullVisitorId AS users,
    SUM(totals.pageviews) AS total_pagesviews_per_user
    FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
    WHERE
    _TABLE_SUFFIX BETWEEN '20170701' AND '20170731'
    AND
    totals.transactions >=1
    GROUP BY
    users 
)

-- Average number of product pageviews for users who did not make a purchase in July 2017

SELECT
( SUM(total_pagesviews_per_user) / COUNT(users) ) AS avg_pageviews_per_user
FROM (
    SELECT
    fullVisitorId AS users,
    SUM(totals.pageviews) AS total_pagesviews_per_user
    FROM`bigquery-public-data.google_analytics_sample.ga_sessions_*`
    WHERE
    _TABLE_SUFFIX BETWEEN '20170701' AND '20170731'
    AND
    totals.transactions IS NULL
    GROUP BY
    users 
) 

-- Average number of transactions per user that made a purchase in July 2017

SELECT
(SUM (total_transactions_per_user) / COUNT(fullVisitorId) ) AS avg_total_transactions_per_user
FROM (
  SELECT
  fullVisitorId,
  SUM (totals.transactions) AS total_transactions_per_user
  FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE
  _TABLE_SUFFIX BETWEEN '20170701' AND '20170731'
  AND totals.transactions IS NOT NULL
  GROUP BY
  fullVisitorId
) 

-- Average amount of money spent per session in July 2017

SELECT
( SUM(total_transactionrevenue_per_user) / SUM(total_visits_per_user) ) AS
avg_revenue_by_user_per_visit
FROM (
  SELECT
  fullVisitorId,
  SUM( totals.visits ) AS total_visits_per_user,
  SUM( totals.transactionRevenue ) AS total_transactionrevenue_per_user
  FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE
  _TABLE_SUFFIX BETWEEN '20170701' AND '20170731'
  AND
  totals.visits > 0
  AND totals.transactions >= 1
  AND totals.transactionRevenue IS NOT NULL
  GROUP BY
  fullVisitorId 
) 

