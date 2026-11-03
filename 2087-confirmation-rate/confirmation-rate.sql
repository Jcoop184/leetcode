# Write your MySQL query statement below
select 
    t1.user_id
    , round ( (count(t3.user_id) / count(t1.user_id)), 2) as confirmation_rate 
from
    signups as t1
left join
    confirmations as t2 on t1.user_id = t2.user_id
left join
    (select user_id, time_stamp from confirmations where action = 'confirmed') as t3 on t2.user_id = t3.user_id and t2.time_stamp = t3.time_stamp
group by
    t1.user_id