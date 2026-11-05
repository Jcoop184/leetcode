# Write your MySQL query statement below
select
    t1.product_id
    , t2.first_year
    , t1.quantity
    , t1.price
from
    sales as t1
join
    (select product_id, min(year) as first_year from sales group by product_id) as t2 on t1.product_id = t2.product_id
where
    t1.year = t2.first_year
group by
    sale_id