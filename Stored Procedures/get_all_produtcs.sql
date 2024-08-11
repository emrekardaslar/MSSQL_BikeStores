USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[get_all_products]    Script Date: 13/07/2024 15:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[get_all_products]
AS
BEGIN
	select product_id, product_name, list_price, brand_id, category_id
	from production.products
END;