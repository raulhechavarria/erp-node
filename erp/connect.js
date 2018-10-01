/**
 * http://usejsdoc.org/
 */

const pg = require('pg');
//var dbpool = "postgres://raul:raul@localhost:5432/erp";

var dbpool = ({
	  user: 'postgres',
	  host: '18.222.14.187',
	  database: 'erp',
	  password: 'day?0208A',
	  port: 5432,
	});

var client = new pg.Client(dbpool);
client.connect();


//npm start

/*
 * pool.on('error', (err, client) => { logger.error({category: 'DB', msg:
 * err.message}); });
 */
exports.dbpool = dbpool;
exports.pg = pg;
exports.client = client;
