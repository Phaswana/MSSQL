select t1.company_code, 
       t1.founder,
       count(distinct t5.lead_manager_code) as 'total number of lead managers',
       count(distinct t5.senior_manager_code) as 'total number of senior managers',
       count(distinct t5.manager_code) as 'total number of managers',
       count(distinct t5.employee_code) as 'total number of employees'
  from Company t1
         join
       Employee       t5 on t5.company_code  = t1.company_code
 group by t1.company_code, t1.founder
 order by 1;