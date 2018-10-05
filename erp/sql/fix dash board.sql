/*SELECT * FROM customer as c INNER JOIN orders as o ON c.id = o.idcustomer  order by c.name desc*/

/*
select o.id, o.numberorder, o.date, o.idcustomer,o.paymenttype, sum(p.price) as total from orders as o inner join ordersproduct as op on o.id = op.idorders inner join product as p on op.idproduct = p.id
group by o.id, o.numberorder, o.date, o.idcustomer,o.paymenttype
*/

SELECT c.id, c.name, sum(p.price)as total FROM customer as c INNER JOIN orders as o ON c.id = o.idcustomer inner join ordersproduct as op on o.id = op.idorders inner join product as p on op.idproduct = p.id 
group by c.id, c.name order by total desc