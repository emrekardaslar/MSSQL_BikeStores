CREATE OR ALTER PROCEDURE [dbo].[get_all_brands]
AS
BEGIN
	SELECT brand_id, brand_name from production.brands
END;
