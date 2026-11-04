# Write your MySQL query statement below
select 
    q1.query_name
    , round(sum(q1.rating / position) / count(q1.query_name), 2) as quality
    , round( ifnull(q2.num_poor, 0)/ count(q1.query_name)*100, 2) as poor_query_percentage
from
    queries as q1
left join
    (select query_name, count(query_name) as num_poor from queries where rating < 3 group by query_name) as q2 on q1.query_name = q2.query_name
group by
    q1.query_name