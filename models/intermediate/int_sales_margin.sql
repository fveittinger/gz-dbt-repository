-- First I want to connect the staged sales and products datasets (schema) using an inner join on products_id

WITH pro_info AS (
    select
        *,
        sales.quantity * product.purchase_price as purchase_cost 
    from {{ ref('stg_raw__sales') }} as sales
    join {{ ref('stg_raw__product') }} as product
    ON product.products_id = sales.product_id
)

select
    *,
    revenue - purchase_cost as margin
from pro_info

