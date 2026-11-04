# Write your MySQL query statement below
with first_order as (
select  
    customer_id
    , min(order_date) as min_order
from
    delivery
group by
    customer_id
)
select 
    round(sum(case when t2.min_order = t1.customer_pref_delivery_date then 1 else 0 end) / count(distinct t1.customer_id)*100, 2) as immediate_percentage
from
    delivery as t1
join
    first_order as t2 on t1.customer_id = t2.customer_id