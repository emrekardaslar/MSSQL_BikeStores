CREATE OR ALTER   PROCEDURE [dbo].[get_all_products]
AS
BEGIN
	select product_id, product_name, list_price, brand_id, category_id
	from production.products
END;