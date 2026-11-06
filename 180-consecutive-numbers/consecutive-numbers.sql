with prev_num as(
select
    id as p_id,
    lag(num, 1) over (order by id asc) as prev_row
from
    logs
),
next_num as(
select
    id as n_id,
    lead(num, 1) over (order by id asc) as nn
from
    logs
),
cons as ( 
select
    *,
     case 
        when t1.num = t2.prev_row and t1.num = t3.nn then t1.num end as test
from
    logs as t1
join
    prev_num as t2 on t1.id = t2.p_id
join
    next_num as t3 on t2.p_id = t3.n_id
)

select
    test as ConsecutiveNums
from
    cons
where
    test is not null
group by test









