CREATE OR ALTER PROCEDURE [dbo].[get_customer_orders_by_email]
    @customer_email NVARCHAR(100)
AS
BEGIN
    SELECT 
        o.order_id,
        o.order_status,
        o.order_date,
        o.required_date,
        o.shipped_date,
        st.store_name,
        sf.first_name AS staff_first_name,
        sf.last_name AS staff_last_name,
        SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_order_value
    FROM 
        sales.orders o
    INNER JOIN 
        sales.customers c ON o.customer_id = c.customer_id
    INNER JOIN 
        sales.stores st ON o.store_id = st.store_id
    INNER JOIN 
        sales.staffs sf ON o.staff_id = sf.staff_id
    INNER JOIN 
        sales.order_items oi ON o.order_id = oi.order_id
    WHERE 
        c.email = @customer_email
    GROUP BY 
        o.order_id, o.order_status, o.order_date, o.required_date, o.shipped_date, st.store_name, sf.first_name, sf.last_name
    ORDER BY 
        o.order_date DESC;
END;
