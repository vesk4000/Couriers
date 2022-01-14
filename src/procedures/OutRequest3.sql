use CouriersDB

go

create or alter procedure usp_TotalOfOrdersByClient( @input nvarchar(50) )
as
begin
	
	select SUM(o.Total) as 'Total by client' from Clients as c

	inner join Orders as o
	on c.ID = o.ClientID

	where @input = c.Name

end

go

use master

go

/* Example
-- This returns the total of all orders by a specific customer

exec usp_TotalOfOrdersByClient 'Нено Ненов'
exec usp_TotalOfOrdersByClient 'Борис Зарев'

*/