select t2.product_name, sum(unit) unit
from (select * from orders where date('2020-02-01') <= order_date and order_date < date('2020-03-01')) t1
join products t2 on t1.product_id = t2.product_id
group by t2.product_name
having sum(unit) >= 100

