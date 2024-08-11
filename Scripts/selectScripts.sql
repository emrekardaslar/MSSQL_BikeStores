-- select saff name, last name and store name
select sasta.first_name as staffName, sasta.last_name as staffLastName, sast.store_name from sales.staffs sasta
JOIN sales.stores sast ON sast.store_id =  sasta.store_id

-- select product name, store name and street name
select p.product_name, sast.store_name, sast.street
from production.stocks ps
JOIN sales.stores sast ON sast.store_id = ps.store_id
JOIN production.products p ON p.product_id = ps.product_id


-- Select all products with their category and brand names
SELECT 
    p.product_id, 
    p.product_name, 
    c.category_name, 
    b.brand_name, 
    p.model_year, 
    p.list_price
FROM 
    production.products p
JOIN 
    production.categories c ON p.category_id = c.category_id
JOIN 
    production.brands b ON p.brand_id = b.brand_id;



-- Select all orders along with customer and store information
SELECT 
    o.order_id, 
    c.first_name + ' ' + c.last_name AS customer_name, 
    s.store_name, 
    o.order_status, 
    o.order_date, 
    o.required_date, 
    o.shipped_date
FROM 
    sales.orders o
JOIN 
    sales.customers c ON o.customer_id = c.customer_id
JOIN 
    sales.stores s ON o.store_id = s.store_id;


-- Select all staff members with their store information
SELECT 
    st.staff_id, 
    st.first_name + ' ' + st.last_name AS staff_name, 
    st.email, 
    st.phone, 
    st.active, 
    s.store_name
FROM 
    sales.staffs st
JOIN 
    sales.stores s ON st.store_id = s.store_id;

-- Select all orders placed by a specific customer (example customer_id = 1)
SELECT 
    o.order_id, 
    o.order_status, 
    o.order_date, 
    o.required_date, 
    o.shipped_date, 
    s.store_name, 
    st.first_name + ' ' + st.last_name AS staff_name
FROM 
    sales.orders o
JOIN 
    sales.stores s ON o.store_id = s.store_id
JOIN 
    sales.staffs st ON o.staff_id = st.staff_id
WHERE 
    o.customer_id = 1;


-- Select total sales per store
SELECT 
    s.store_name, 
    SUM(oi.list_price * oi.quantity * (1 - oi.discount / 100)) AS total_sales
FROM 
    sales.order_items oi
JOIN 
    sales.orders o ON oi.order_id = o.order_id
JOIN 
    sales.stores s ON o.store_id = s.store_id
GROUP BY 
    s.store_name;


-- Select the stock levels of products in each store
SELECT 
    st.store_name, 
    p.product_name, 
    ps.quantity
FROM 
    production.stocks ps
JOIN 
    sales.stores st ON ps.store_id = st.store_id
JOIN 
    production.products p ON ps.product_id = p.product_id;


-- Select the number of orders each staff member has processed
SELECT 
    st.first_name + ' ' + st.last_name AS staff_name, 
    COUNT(o.order_id) AS orders_processed
FROM 
    sales.orders o
JOIN 
    sales.staffs st ON o.staff_id = st.staff_id
GROUP BY 
    st.first_name, st.last_name;


-- Select products that have never been ordered
SELECT 
    product_name 
FROM 
    production.products 
WHERE 
    product_id NOT IN (
        SELECT 
            DISTINCT product_id 
        FROM 
            sales.order_items
    );


--Select customers who have placed more than one order
SELECT 
    first_name, 
    last_name, 
    email 
FROM 
    sales.customers 
WHERE 
    customer_id IN (
        SELECT 
            customer_id 
        FROM 
            sales.orders 
        GROUP BY 
            customer_id 
        HAVING 
            COUNT(order_id) > 1
    );


-- Select the names and emails of customers who live in a specific state (e.g., 'CA'):
SELECT 
    first_name, 
    last_name, 
    email 
FROM 
    sales.customers 
WHERE 
    state = 'CA';



-- Select the total quantity of each product sold:
SELECT 
    p.product_name, 
    SUM(oi.quantity) AS total_quantity_sold 
FROM 
    sales.order_items oi 
JOIN 
    production.products p ON oi.product_id = p.product_id 
GROUP BY 
    p.product_name;


-- Select the average list price of products for each brand
SELECT 
    b.brand_name, 
    AVG(p.list_price) AS average_price 
FROM 
    production.products p 
JOIN 
    production.brands b ON p.brand_id = b.brand_id 
GROUP BY 
    b.brand_name;


-- Select the orders that have not been shipped yet
SELECT 
    order_id, 
    order_date, 
    required_date 
FROM 
    sales.orders 
WHERE 
    shipped_date IS NULL;


-- Select the products that are out of stock in all stores
SELECT 
    product_name 
FROM 
    production.products 
WHERE 
    product_id NOT IN (
        SELECT 
            product_id 
        FROM 
            production.stocks 
        WHERE 
            quantity > 0
    );

-- Select the total revenue generated by each store
SELECT 
    s.store_name, 
    SUM(oi.list_price * oi.quantity * (1 - oi.discount / 100)) AS total_revenue 
FROM 
    sales.order_items oi 
JOIN 
    sales.orders o ON oi.order_id = o.order_id 
JOIN 
    sales.stores s ON o.store_id = s.store_id 
GROUP BY 
    s.store_name;

-- Select the most recent order for each store
SELECT 
    store_id, 
    order_id, 
    order_date 
FROM 
    sales.orders o1 
WHERE 
    order_date = (
        SELECT 
            MAX(order_date) 
        FROM 
            sales.orders o2 
        WHERE 
            o1.store_id = o2.store_id
    );

-- Select the total number of customers in each state
SELECT 
    state, 
    COUNT(customer_id) AS total_customers 
FROM 
    sales.customers 
GROUP BY 
    state;


-- Select the average discount given on all order items
SELECT 
    AVG(discount) AS average_discount 
FROM 
    sales.order_items;