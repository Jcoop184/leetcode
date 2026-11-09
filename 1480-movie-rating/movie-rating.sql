with names as (
select
   t2.name results
from
    (select user_id, count(movie_id) as num_ratings from movierating group by user_id) t1
join
    users t2 on t1.user_id = t2.user_id
order by
    t1.num_ratings desc, t2.name asc
limit 1
),
movie_rating as (
select
    t4.title
from
    (select movie_id, avg(rating) avg_rating from movierating where '2020-02-01' <= created_at and created_at <= '2020-02-29' group by movie_id) t3
join
    movies as t4 on t3.movie_id = t4.movie_id
order by
    t3.avg_rating desc, t4.title asc
limit 1
)
select * from names union all select * from movie_rating