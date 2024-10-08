/**
 * Exercise #1
 */
select * 
from product;

/**
 * Exercise #2
 */
SELECT product_name 
FROM product 
WHERE unit_price >= 3.5;

/**
 * Exercise #3
 */
SELECT * 
FROM store.product 
where (category_id = 1 or category_id = 3) and unit_price >= 3.5;

/**
 * Exercise #4
 */
select p.product_name, c.name as category_name
from product as p 
inner join category as c on p.category_id =  c.category_id;

/**
 * Exercise #5
 */
select pu.purchase_id, p.product_name, pu_i.unit_price, pu_i.quantity 
from product as p
inner join purchase_item as pu_i on p.product_id = pu_i.product_id
inner join  purchase as pu on pu.purchase_id =  pu_i.purchase_id;

/**
 * Exercise #6
 */
select  c.name, pu.purchase_id
from category as c
inner join product as p on c.category_id = p.product_id
inner join purchase_item as pu_i on pu_i.purchase_id = p.product_id
inner join purchase as pu on pu.purchase_id = pu_i.purchase_id
group by c.name, pu.purchase_id;

/**
 * Exercise #7
 */
select * 
from category 
order by name asc;

/**
 * Exercise #8
 */
select first_name, last_name, birth_date 
from employee 
order by birth_date desc;

/**
 * Exercise #9
 */
select * 
from product as p
order by quantity_per_unit desc, product_name asc;

/**
 * Exercise #10
 */
select c.name, avg(p.unit_price) as average_unit_price
FROM category as c
inner join product as p on c.category_id = p.category_id
group by c.name;

/**
 * Exercise #11
 */
select c.city, count(customer_id) as total
from store.customer AS c
where c.city != "Knoxville" or "Stockton"
group by c.city;

/**
 * Exercise #12
 */
use store;
select last_name, first_name
from employee
where hire_date is null;

/**
 * Exercise #13
 */
use store;

select c.name, sum(p.discontinued) as discontinued_products_number 
from category as c
inner join product as p on c.category_id = p.category_id
group by c.name
having sum(p.discontinued) >= 3
order by discontinued_products_number desc; 

/**
 * Exercise #14
 */
select count(last_name) as employees_without_information
from employee
where hire_date is null and birth_date is null;

/**
 * Exercise #14
 */
 SELECT 
	p1.customer_id, 
    p1.purchase_id, 
    p1.total_price AS price,
    p2.total,
    ROUND(p1.total_price * 100 / p2.total, 2) as percent 
FROM store.purchase AS p1
INNER JOIN (
	SELECT customer_id, SUM(p.total_price) as total
	FROM store.purchase AS p
	GROUP BY p.customer_id
) AS p2 ON p2.customer_id = p1.customer_id
ORDER BY p1.customer_id;

/**
 * Se crea una tabla imaginaria a partir de valores de unas tablas y existententes y luego se hace un join 
 con la tabla real para unir los datos
 */