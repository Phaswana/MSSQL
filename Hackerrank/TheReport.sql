select case 
         when Grade >= 8 then Name
         else Null
       end,
       Grade,
       Marks
  from students t1
         join
       grades  t2 on t1.marks between t2.min_mark and t2.max_mark
 order by 2 desc, 
          1 asc, 
          3;