USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[get_product_by_id]    Script Date: 11/08/2024 12:41:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[get_product_by_id]
    @ProductId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * 
    FROM production.products 
    WHERE product_id = @ProductId;
END;
