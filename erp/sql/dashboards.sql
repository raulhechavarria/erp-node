/*SELECT p.name, (sum(op.count)* p.price)as amount, sum(op.count)as total FROM product as p INNER JOIN ordersproduct as op ON p.id = op.idproduct group by name, p.price order by amount desc*/



SELECT c.id, c.name, sum(p.price * op.count)as total,sum(op.count)as amount FROM customer as c INNER JOIN orders as o ON c.id = o.idcustomer inner join ordersproduct as op on o.id = op.idorders inner join product as p on op.idproduct = p.id group by c.id, c.name order by total desc