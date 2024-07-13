CREATE OR ALTER PROCEDURE get_products_by_category_name
    @CategoryName NVARCHAR(100)  -- Adjust the length as per your category name column
AS
BEGIN
    SET NOCOUNT ON;

    SELECT p.product_name, p.list_price, b.brand_name
    FROM production.products p
    JOIN production.categories c ON p.category_id = c.category_id
	JOIN production.brands b ON p.brand_id = b.brand_id
    WHERE c.category_name = @CategoryName;
END