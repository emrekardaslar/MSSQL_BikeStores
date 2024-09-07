USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[get_customer_by_id]    Script Date: 07/09/2024 11:27:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[get_customer_by_id] @customer_id INT
AS
BEGIN
select * from sales.customers
where customer_id = @customer_id

end;