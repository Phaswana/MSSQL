SELECT t1.[N],
       CASE 
	      WHEN t1.N = t2.P
		   THEN CASE 
		          WHEN t1.P IS NULL then 
				        'Root'
				  ELSE 'Inner'
				END
          WHEN t1.N = t3.N 
		   THEN 'Leaf'
		  ELSE 'Inner'
	   END AS [Type]
  from bst t1
        left outer join
	   bst t2 ON t2.P = t1.N
	    left outer join
	    bst t3  ON t3.N = t1.N
 group by t1.N, 
          t1.P, 
          t2.P, 
          t3.N
 ORDER BY t1.N; 