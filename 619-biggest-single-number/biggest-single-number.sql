# Write your MySQL query statement below
with num_count as (
select
    num,
    count(num)
from
    MyNumbers
group by
    num
having
    count(num) = 1
)
select max(num) as num
from num_count
