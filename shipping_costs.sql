select 
    customer_name, 
    carrier, 
    mail_class, 
    sum(actual_amount) as total_price, 
    count(distinct order_id) as number_of_shipments, 
    count(distinct service_item_num) as number_of_items
from ANALYSIS.MIRABEL.SHIPPING_COST_ITEM_LEVEL
where 1=1 
//and customer_name ilike '%foot%'
and convert_timezone('UTC', 'America/Los_Angeles', completed_packaging::timestamp_ntz) >= '2022-04-01'
and convert_timezone('UTC', 'America/Los_Angeles', completed_packaging::timestamp_ntz) < '2022-06-01'
group by 1,2,3
order by 1
;