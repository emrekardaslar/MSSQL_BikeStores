CREATE PROCEDURE get_low_stock_items
AS
BEGIN
    SELECT 
        p.product_name AS ProductName, 
        s.store_name AS StoreName, 
        COALESCE(ps.quantity, 0) AS Quantity
    FROM 
        production.products p
    INNER JOIN 
        production.stocks ps ON ps.product_id = p.product_id
    INNER JOIN 
        sales.stores s ON ps.store_id = s.store_id
    WHERE 
        COALESCE(ps.quantity, 0) < 10;
END;
