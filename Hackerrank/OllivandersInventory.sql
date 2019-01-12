declare @temp table (
  id int,
          code int,
          coins_needed int,
          [power] int)
insert @temp
select case when
             min(coins_needed) = (select min(w.coins_needed)  
                                    from Wands w
                                    join Wands_Property wp on wp.code = w.code
                                                           and wp.is_evil != 1 
                                   where wp.age = t2.age
                                     and w.power = t1.power) then t1.id end, 
       t2.age,
       min (t1.coins_needed),
       t1.power
  from Wands t1
         join
       Wands_Property t2 on t2.code = t1.code
                         and t2.is_evil != 1
 group by t1.id, 
       t2.age,
       t1.coins_needed, 
       t1.power

 select *
   from @temp
  where id is not null 
  order by 4 desc, 2 desc