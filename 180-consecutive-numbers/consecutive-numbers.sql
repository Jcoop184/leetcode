with cons as(
select
    *,
     case 
        when num = lag(num, 1) over (order by id asc) and num = lead(num, 1) over (order by id asc) then num end as test
from
    logs
)
select test as ConsecutiveNums
from cons
where test is not null
group by test