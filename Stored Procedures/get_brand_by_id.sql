CREATE OR ALTER PROCEDURE [dbo].[get_brand_by_id]
    @BrandId INT
AS
BEGIN
    -- Set NOCOUNT to ON to prevent extra result sets from interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Select the brand with the specified ID
    SELECT 
        brand_id, 
        brand_name
    FROM 
        production.brands
    WHERE 
        brand_id = @BrandId;
END;
