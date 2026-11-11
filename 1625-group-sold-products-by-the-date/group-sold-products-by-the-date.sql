select t1.sell_date, count(distinct t1.product) num_sold, t2.products
from activities t1
join (select sell_date, group_concat(distinct product order by product asc separator ',') products from activities group by sell_date) t2
on t1.sell_date = t2.sell_date
group by t1.sell_date
order by t1.sell_date asc



