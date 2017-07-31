/*
Credits...
Name: Elton Carolus
Email: ecarolus@gmail.com
*/

begin try drop table #fizzbuzz end try begin catch end catch

select top 100 ROW_NUMBER() over(order by a.name) as Rcount into #fizzbuzz
from sys.all_objects a

alter table #fizzbuzz 
	add remark varchar(8)

update #fizzbuzz
	set remark = 'fizz' where (Rcount % 3) = 0
update #fizzbuzz
	set remark = 'buzz' where (Rcount % 5) = 0
update #fizzbuzz
	set remark = 'fizzbuzz' where ( (Rcount % 5)+(Rcount % 3)) = 0
	--set remark = 'fizzbuzz' where ( (Rcount % 15)) = 0

select remark from #fizzbuzz