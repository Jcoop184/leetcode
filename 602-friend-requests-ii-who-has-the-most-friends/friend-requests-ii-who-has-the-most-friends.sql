select
    requester_id id, sum(r_num) num
from
(
    select requester_id, count(requester_id) r_num from requestaccepted t1 group by requester_id 
    union all
    select accepter_id, count(accepter_id) a_num from requestaccepted t2 group by accepter_id
) t1
group by requester_id
order by num desc limit 1
