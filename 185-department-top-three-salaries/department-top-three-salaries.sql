with salaries as(
select t1.id, t2.salary, rank() over (partition by t1.id order by t2.salary desc) salary_rank
from department t1
join employee t2 on t1.id = t2.departmentId
group by t1.id, t2.salary
)

select d.name Department, e.name Employee, e.salary Salary
from department d
join employee e on d.id = e.departmentid
join (select * from salaries where salary_rank <= 3) s on s.salary = e.salary and s.id = d.id
order by d.id asc, e.salary desc