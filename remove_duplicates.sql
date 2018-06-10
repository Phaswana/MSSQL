declare @check int = 0;

begin transaction

   delete duplicates 
     from ( select *,
                   row_number() over (partition by pkey order by pkey) as rowNumber
              from dbo.TableWithDuplicates) duplicates 
    where rowNumber > 1;

   -- check for duplicates (if we have duplicates, then rollback tran)
   with cte (counts, pkey)
   as 
   ( select count(1),
            pkey
       from dbo.TableWithDuplicates with (nolock)
      group by pkey 
   )
   select @check = count(*) from cte where counts > 1;

if(@check > 0) rollback tran
else commit tran

