with salaries as(
select t1.name Department, t2.name Employee, t2.salary Salary, dense_rank() over (partition by t1.id order by t2.salary desc) salary_rank
from department t1
join employee t2 on t1.id = t2.departmentId
)

select Department, Employee, Salary
from salaries
where salary_rank <= 3