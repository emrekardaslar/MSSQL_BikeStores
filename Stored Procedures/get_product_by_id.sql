CREATE OR ALTER PROCEDURE [dbo].[get_product_by_id]
    @ProductId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * 
    FROM production.products 
    WHERE product_id = @ProductId;
END;
