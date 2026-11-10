select
    round(sum(tiv_2016), 2) tiv_2016
from
    (select *, count(lat and lon) c_cnt from insurance group by lat, lon having c_cnt = 1) t1
join
    (select tiv_2015 from insurance group by tiv_2015 having count(tiv_2015) > 1) t2 on t1.tiv_2015 = t2.tiv_2015
