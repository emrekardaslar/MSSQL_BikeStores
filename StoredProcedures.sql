USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[get_all_brands]    Script Date: 06/07/2024 13:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[get_all_brands]
AS
BEGIN
	SELECT brand_id, brand_name from production.brands
END;

USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[get_all_products]    Script Date: 06/07/2024 13:57:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[get_all_products]
AS
BEGIN
	select product_id as Id, product_name as Name, list_price as Price
	from production.products
END;


USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[get_brand_by_id]    Script Date: 06/07/2024 13:58:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[get_brand_by_id]
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


USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[get_product_by_id]    Script Date: 06/07/2024 13:58:27 ******/
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
