-- create new intermediate table 


select  
    orders_id,
    date_date,
    sum(revenue) as revenue,
    sum(quantity) as quantity,
    sum(purchase_cost) as purchase_cost,
    sum(margin) as margin
from {{ ref('int_sales_margin') }}
GROUP BY
    orders_id,
    date_date