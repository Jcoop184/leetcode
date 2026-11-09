with moving_calc as(
select 
    visited_on,
    sum(t1.total) over (order by visited_on rows between 6 preceding and current row) amount,
    round(avg(t1.total) over (order by visited_on rows between 6 preceding and current row), 2) as average_amount
from
    (select *, sum(amount) as total from customer group by visited_on) as t1
)
select
    c2.visited_on
    , c2.amount
    , c2.average_amount
from
    customer c1
join
    moving_calc as c2 on c1.visited_on = c2.visited_on
where
    datediff(c1.visited_on, (select min(visited_on) from customer)) >= 6
group by
    c2.visited_on

