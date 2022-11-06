# Ecommerce Analytics Dashboard

In this project, an ecommerce analytics dashboard is created in Tableau. The data is from Google's own [Merchandise Store](https://shop.googlemerchandisestore.com/?utm_source=Partners&utm_medium=affiliate&utm_campaign=Data%20Share%20Promo), sourced from their BigQuery sample dataset located [here.](https://console.cloud.google.com/marketplace/product/obfuscated-ga360-data/obfuscated-ga360-data?project=lexical-script-761)

View the dashboard on [Tableau Public](https://public.tableau.com/app/profile/richard.k6822/viz/EcommercePerformanceDashboard_16665439868930/Dashboard1)

## Problem Definition

Did you know that on average, only 5.2% [1] of ecommerce site customers make a purchase?

Did you also know that 20-45% [2] of visitors to an ecommerce site leave after only viewing one page?

These metrics are known as the Sales Conversion Rate and Bounce Rate, and are two of many metrics used to measure the performance of an ecommerce site. In this project, real Google Analytics 360 customer data is analyzed to track the performance of an ecommerce site in order to measure how its performance measures up to the standard.

A data pipeline is developed to transform data from a Google BigQuery data warehouse, and then Tableau is used to visualize the data and calculate key metrics. The key metrics are:

- Total Revenue ($)
- Total Number of Visits
- Sales Conversion Rate (%)
- Bounce Rate (%)
- Average Order Value ($)

## Results

Based on analysis of the data, the metric values are as follows:

- Total Revenue ($) = 372584
- Total Number of Visits = 196817
- Sales Conversion Rate (%) = 1.163
- Bounce Rate (%) = 50.06
- Average Order Value ($) = 162.8

A simple calculation based on the Sales Conversion Rate, Total Number of Visits, and Average Order Value can be performed to estimate the increase in quarterly revenue if strategies are used to increase the Sales Conversion rate to the benchmark value of 5.2%. In this case, the quarterly revenue can be increased by an estimated $1.3 million, or 347%.

**Number of Purchases at Average Sales Conversion Rate:**

$$Sales Conversion Rate = 0.052 = \dfrac{Num Purchases}{196817}$$
$$Num Purchases = 10234$$

$$ Current Number of Purchases = 0.01163 \times 196817 = 2289$$

**Additional Revenue Per Quarter:**

$$(10234 - 2289) purchases \times \dfrac{\$162.8}{purchase} = \$1 293525$$

Strategies to increase the Sales Conversion Rate could take several forms: enhancing the website design, user experience improvements, or more targeted marketing.

## References

[1] https://unbounce.com/conversion-benchmark-report

[2] https://www.customedialabs.com/blog/bounce-rates/

## Helpful Links

Some helpful pages from Shopify to research ecommerce metrics:

https://www.shopify.com/ca/blog/marketing-analytics

https://www.shopify.com/ca/blog/basic-ecommerce-metrics


Helpful pages to get familiar with the Google Merchandise Store Analytics 360 data:

Introduction, Sample Queries
https://support.google.com/analytics/answer/4419694?hl=en&ref_topic=3416089#multiple&zippy=%2Cin-this-article

Data Dictionary (extremely helpful)
https://support.google.com/analytics/answer/3437719?hl=en