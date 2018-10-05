/**
 * http://usejsdoc.org/
 */

const conn = require('../common/connect.js');
const exc = require('../common/HandlerException.js')
const ordersproduct = require('../models/ordersproduct');


function find(res1){	
	conn.client.query('select o.id, o.numberorder, o.date, o.idcustomer,o.paymenttype, sum(p.price) as total from orders as o inner join ordersproduct as op on o.id = op.idorders inner join product as p on op.idproduct = p.id group by o.id, o.numberorder, o.date, o.idcustomer,o.paymenttype', (err, res) => {
	  if (err) console.log("Error to select")
	  res1.status(200).json(res.rows)
	});
  //   
};


function findTopCustomer(res1){	
	/*conn.client.query('SELECT customer.name as name, count(orders.idcustomer) as total  FROM orders INNER JOIN customer ON customer.id = orders.idcustomer group by name order by total desc', (err, res) => {
	  */
	conn.client.query('SELECT c.id, c.name, sum(p.price)as total FROM customer as c INNER JOIN orders as o ON c.id = o.idcustomer inner join ordersproduct as op on o.id = op.idorders inner join product as p on op.idproduct = p.id group by c.id, c.name order by total desc', (err, res) => {
	if (err) console.log(res.rows)
	  
	  res1.status(200).json(res.rows)
	// conn.client.end()
	});	  
};

function findbyid(id,res1){
	conn.client.query("SELECT * FROM orders WHERE id = $1", [id], (err, res) => {
		  if (err) throw err
		// console.log(res)
		  res1.status(200).json(res.rows[0])
		// conn.client.end()
		});	  

};

function save(order, res1){
		  var  sql = 'INSERT INTO orders(numberorder,date, idcustomer, paymenttype) values($1,$2,$3,$4) RETURNING id';
		  var  values = [ order.numberorder, order.date, order.idcustomer,  order.paymenttype];
		  var idorders1;
		  conn.client.query(sql, values, (err, res) => {
			  exc.predicError(err, res,res1)
			  if (!err) {
					  idorders1 = res.rows[0].id;
					  order.products.forEach( function(value, index, array) {
						  const ordersproduct1 = ({
							  idproduct : value.id,
							  idorders: idorders1,
							});
						  ordersproduct.save(ordersproduct1);  
						});
				  } 
			  
			  
		});
};

function del(id,res1){
	ordersproduct.delOrder(id);	
		conn.client.query("DELETE FROM orders WHERE id = $1 returning id", [id], (err,res) =>{
			exc.predicError(err, res,res1)
		});
};

exports.findTopCustomer = findTopCustomer;
exports.save = save;
exports.del = del;
exports.find = find;
exports.findbyid = findbyid;