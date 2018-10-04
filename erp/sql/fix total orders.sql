/*SELECT customer.59name as name, count(orders.idcustomer) as total  FROM orders INNER JOIN customer ON customer.id = orders.idcustomer group by name order by total desc limit 3
*/


/*
INSERT INTO ordersproduct(idproduct,idorders) values(4,13);
INSERT INTO ordersproduct(idproduct,idorders) values(4,14);INSERT INTO ordersproduct(idproduct,idorders) values(11,15);
INSERT INTO ordersproduct(idproduct,idorders) values(4,14);
INSERT INTO orders(numberorder,date, idcustomer, paymenttype) values('234f54',22341212,'29','2') RETURNING id/
*/

select o.id, o.numberorder, o.date, o.idcustomer,o.paymenttype, sum(p.price) as total from orders as o inner join ordersproduct as op on o.id = op.idorders inner join product as p on op.idproduct = p.id
group by o.id, o.numberorder, o.date, o.idcustomer,o.paymenttype

/*
(select sum(p.price) from product as p inner join ordersproduct as op on p.id = op.idproduct where op.idorders = 59)


 56.34 +10.99  59 
54    1054.99
57    1010.99


*/
