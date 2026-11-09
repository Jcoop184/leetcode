select
    t1.employee_id
from
    employees as t1
left join
    (select employee_id, manager_id from employees) as t2 on t1.manager_id = t2.employee_id
where
    t1.salary < 30000 and t1.manager_id is not null and isnull(t2.employee_id)
order by
    t1.employee_id asc
