select name+'('+substring(occupation,1,1)+')' 
  from occupations 
 order by name

select 'There are total '+ cast(a as char) +  lower(b) +'s.' 
  from (select count(occupation) as a, 
                occupation as b 
           from occupations 
          group by occupation) d 
 order by a asc, 
          b asc;