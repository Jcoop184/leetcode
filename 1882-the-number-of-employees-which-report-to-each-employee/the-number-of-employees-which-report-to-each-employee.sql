# Write your MySQL query statement below
select
    t2.employee_id
    , t2.name
    , count(t1.reports_to) as reports_count
    , round(avg(t1.age)) as average_age
from
    employees as t1
left join
    employees as t2 on t1.reports_to = t2.employee_id
group by
    t2.employee_id
having
    count(t1.reports_to) >= 1
order by
    t2.employee_id asc;