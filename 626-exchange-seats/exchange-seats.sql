select
    case
        when t1.id % 2 = 0 then t1.id - 1
        when t1.id % 2 >= 1 and t1.id < (select max(id) from seat) then t1.id + 1
        else (select max(id) from seat) end as id
    , t1.student
from
    seat as t1
order by
    id