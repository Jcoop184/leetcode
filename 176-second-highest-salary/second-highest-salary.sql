select max(e.salary) secondhighestsalary
from employee e
left join (select max(salary) max_salary from employee) m on e.salary = m.max_salary
where isnull(max_salary)


