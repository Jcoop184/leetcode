# Write your MySQL query statement below
select
    customer_id
from
    customer as c
group by
    c.customer_id
having
    count(distinct c.product_key) = (select count(product_key) from product)
