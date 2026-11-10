
(
select if(income < 20000, 'Low Salary', 'Low Salary') category, ifnull(count(account_Id), 0) accounts_count
from accounts t1
where income < 20000
)
union all
(
select if(20000 < income and income < 50000, 'Average Salary', 'Average Salary') category, ifnull(count(account_Id), 0) accounts_count
from accounts t2
where 20000 <= income and income <= 50000
)
union all
(
select if(income > 50000, 'High Salary', 'High Salary') category, ifnull(count(account_Id), 0) accounts_count
from accounts t2
where income > 50000
)





