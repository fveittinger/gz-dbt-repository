-- creating a new model to calculate the operational margin
-- first I need to join the ship table




select
    *,
    margin.margin + ship.shipping_fee - ship.logcost - ship.ship_cost as operational_margin
from {{ ref("int_orders_margin") }} as margin
join {{ ref("stg_raw__ship") }} as ship
using(orders_id)


