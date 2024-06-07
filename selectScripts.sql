-- select saff name, last name and store name
select sasta.first_name as staffName, sasta.last_name as staffLastName, sast.store_name from sales.staffs sasta
JOIN sales.stores sast ON sast.store_id =  sasta.store_id

-- select product name, store name and street name
select p.product_name, sast.store_name, sast.street
from production.stocks ps
JOIN sales.stores sast ON sast.store_id = ps.store_id
JOIN production.products p ON p.product_id = ps.product_id