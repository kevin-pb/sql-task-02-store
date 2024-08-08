/**
 * Exercise #1
 */
select * 
from product

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
select p.product_name, c.category_name 
from product as p 
inner join category as c on p.product_id =  c.category_id;

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
select p.category_id, c.category_name 
from category as c
inner join product as p on c.category_id = p.product_id

/**
 * Exercise #7
 */
select * 
from category 
order by category_name asc;

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
select product_name, avg(unit_price) 
FROM product
group by product_name

/**
 * Exercise #11
 */
select c.city, count(customer_id) as total
from store.customer AS c
where c.city != "Knoxville"
group by c.city;
