select
    p1.product_id
    , if(p1.product_id = p3.product_id, p3.new_price, 10) as price
from
    products as p1
left join
    (select product_id, max(change_date) as lc from products where change_date <= '2019-08-16' group by product_id) as p2 on p1.product_id = p2.product_id
left join
    (select * from products) as p3 on p2.product_id = p3.product_id and p2.lc = p3.change_date
group by
    p1.product_id
   