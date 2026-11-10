# Write your MySQL query statement below
select
    user_id, concat( ucase(mid(name, 1, 1)), lcase((mid(name, 2, max(length(name))))) ) name
from
    users
group by
    user_id
order by
    user_id