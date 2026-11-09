with bus_total as (
select
    person_id
    , turn
    , weight
    , sum(weight) over (order by turn asc) as total_weight
from 
    queue
)
select
    person_name
from
    queue t1
join
    (select max(turn) as last from bus_total where total_weight <= 1000) as t2 on t1.turn = t2.last




