USE [BikeStores]
GO
/****** Object:  StoredProcedure [dbo].[get_all_brands]    Script Date: 11/08/2024 12:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[get_all_brands]
AS
BEGIN
	SELECT brand_id, brand_name from production.brands
END;
