/**
 * http://usejsdoc.org/
 */

const pg = require('pg');
//var dbpool = "postgres://raul:raul@localhost:5432/erp";

var dbpool = ({
	  user: 'raul',
	  host: 'localhost',
	  database: 'erp',
	  password: 'raul',
	  port: 5432,
	});

var client = new pg.Client(dbpool);
client.connect();

/*
 * pool.on('error', (err, client) => { logger.error({category: 'DB', msg:
 * err.message}); });
 */
exports.dbpool = dbpool;
exports.pg = pg;
exports.client = client;
