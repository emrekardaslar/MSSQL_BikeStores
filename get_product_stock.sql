USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[get_product_stock]    Script Date: 11/08/2024 12:38:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[get_product_stock]
    @product_id INT,
    @store_id INT = NULL  -- Optional parameter to filter by store
AS
BEGIN
    SELECT 
        s.store_id,
        st.store_name,
        s.product_id,
        p.product_name,
        s.quantity
    FROM 
        production.stocks s
    INNER JOIN 
        sales.stores st ON s.store_id = st.store_id
    INNER JOIN 
        production.products p ON s.product_id = p.product_id
    WHERE 
        s.product_id = @product_id
        AND (@store_id IS NULL OR s.store_id = @store_id);
END;