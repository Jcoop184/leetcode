with first_login as(
    select
        player_id
        , min(event_date) f_login
    from
        activity
    group by player_id
)
select
    round(count(distinct IF(datediff(a.event_date, f.f_login) = 1, f.player_id, null)) / count(distinct a.player_id), 2) as fraction
from
    activity as a
join
    first_login as f on a.player_id = f.player_id