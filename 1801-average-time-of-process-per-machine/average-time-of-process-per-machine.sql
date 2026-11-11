# Write your MySQL query statement below
with start_time as(
select
    machine_id
    , process_id
    , timestamp
from
    activity
where
    activity_type = 'start'
group by
    machine_id
    , process_id
)

select
    s.machine_id
    , round( (sum(e.timestamp - s.timestamp) / count(distinct s.process_id)), 3) as processing_time
from
    activity as e
join
    start_time as s on e.machine_id = s.machine_id and e.process_id = s.process_id
where
    activity_type = 'end'
group by
    s.machine_id;