/*
The finance team has communicated that they want the following data at a daily granularity:
Date
Total number of transactions
Total revenue
Average Basket
Operational Margin
Total purchase cost
Total shipping fees
Total log costs
Total quantity of products sold.
*/


select
    date_date,
    count(orders_id) as nb_transactions,
    round(sum(revenue),2) as tot_revenue,
    round(avg(revenue), 2) as avg_revenue,
    round(sum(operational_margin), 2) as operational_margin,
    round(sum(purchase_cost), 2) as tot_purchase_cost,
    round(sum(shipping_fee), 2) as tot_shipping_fee,
    round(sum(logcost), 2) as tot_log_costs,
    round(sum(quantity), 2) as tot_pro_sold
from {{ ref('int_orders_operational') }}
group by date_date
