with split_orders as (
select order_id, count(*) as num_shipments
from ANALYSIS.MIRABEL.SHIPPING_COST_SHIPMENT_LEVEL
group by 1
having count(*) > 1
order by 2 desc)

select 
    scsl.tracking_number,
    so.order_id, 
    scsl.customer_name, 
    scsl.carrier, 
    scsl.mail_class as ship_method, 
    scsl.actual_amount as cost, 
    scsl.max_completed_packaging as date
from split_orders so
left join ANALYSIS.MIRABEL.SHIPPING_COST_SHIPMENT_LEVEL scsl
    on so.order_id = scsl.order_id
order by 3,2
;