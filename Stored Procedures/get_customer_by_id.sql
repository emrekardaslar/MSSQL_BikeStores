CREATE OR ALTER procedure [dbo].[get_customer_by_id] @customer_id INT
AS
BEGIN
select * from sales.customers
where customer_id = @customer_id

end;