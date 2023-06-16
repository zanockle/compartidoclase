/*Importar la base de datos de NorthWnd para realizar sql_evaluation*/

SELECT * FROM northwind.CATEGORIES;
SELECT * FROM northwind.customers;
SELECT * FROM northwind.employees;
SELECT * FROM northwind.order_details;
SELECT * FROM northwind.orders;
SELECT * FROM northwind.PRODUCTS;
SELECT * FROM northwind.shippers;
SELECT * FROM northwind.suppliers;

/*Muestra el nombre de cliente que ha realizado cada pedido*/
SELECT ORDERS.ORDER_ID, CUSTOMERS.CUSTOMER_ID, customers.company_name
FROM ORDERS
INNER JOIN customers ON orders.customer_id=customers.customer_id;

SELECT ORDERS.ORDER_ID, CUSTOMERS.CUSTOMER_ID, customers.company_name
FROM customers
INNER JOIN ORDERS ON orders.customer_id=customers.customer_id;

SELECT ORDERS.ORDER_ID, CUSTOMERS.CUSTOMER_ID, customers.company_name
FROM customers
INNER JOIN ORDERS ON orders.customer_id=customers.customer_id
ORDER BY CUSTOMERS.CUSTOMER_ID ASC;

SELECT customers.company_name, COUNT(customers.company_name) AS PEDIDOS_REALIZADOS
FROM customers
INNER JOIN ORDERS ON orders.customer_id=customers.customer_id
GROUP BY customers.company_name
ORDER BY CUSTOMERS.company_name ASC;

SELECT customers.company_name, COUNT(customers.company_name) AS PEDIDOS_REALIZADOS
FROM customers
INNER JOIN ORDERS ON orders.customer_id=customers.customer_id
GROUP BY customers.company_name
ORDER BY PEDIDOS_REALIZADOS DESC;

SELECT customers.company_name, COUNT(customers.company_name) AS PEDIDOS_REALIZADOS
FROM customers
INNER JOIN ORDERS ON orders.customer_id=customers.customer_id
GROUP BY customers.company_name
ORDER BY PEDIDOS_REALIZADOS DESC
FETCH FIRST 5 ROWS ONLY;

/*cuantos pedidos se han realizado por año - order_date*/
select extract(year from orders.order_date) as año, count(orders.order_id)as numero_pedidos
from orders
group by extract(year from orders.order_date)
order by año;

select extract(month from orders.order_date) as mes, count(orders.order_id)as numero_pedidos
from orders
group by extract(month from orders.order_date)
order by mes;

select extract(month from orders.order_date) as mes, count(orders.order_id)as numero_pedidos96
from orders
where extract(year from orders.order_date)='1996'
group by extract(month from orders.order_date)
order by mes;

select extract(month from orders.order_date) as mes, count(orders.order_id)as numero_pedidos97
from orders
where extract(year from orders.order_date)='1997'
group by extract(month from orders.order_date)
order by mes;

select 
extract(month from orders.order_date) as mes, 
extract(year from orders.order_date) as year ,
count(orders.order_id)as total
from orders
group by extract(month from orders.order_date),extract(year from orders.order_date)
order by mes;

select * from (
select 
extract(month from orders.order_date) as mes, 
extract(year from orders.order_date) as year ,
count(orders.order_id)as total
from orders
group by extract(month from orders.order_date),extract(year from orders.order_date)

)
pivot(
sum(total)   FOR YEAR IN (
    '1996' AS "1996", '1997' AS "1997", '1998' AS "1998"
  )
 
)
 order by mes
 ;

/*total de unidades vendidas por categoria*/

select order_details.quantity,order_details.product_id, products.category_id, categories.category_name
from order_details
inner join products on products.product_id = order_details.product_id
inner join categories on products.category_id = categories.category_id;


select order_details.quantity,order_details.product_id, products.category_id, categories.category_name
from order_details
inner join products on products.product_id = order_details.product_id
inner join categories on products.category_id = categories.category_id;













