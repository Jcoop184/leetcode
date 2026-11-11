select
    * 
from
    users
where
    substring(mail, 1, 1) rlike '[a-zA-Z]+' and right(mail, 13) = BINARY '@leetcode.com' and substring(mail, 1, length(mail) - 13) rlike '^[a-zA-Z0-9_.-]+$'
    
