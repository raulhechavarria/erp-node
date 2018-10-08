-- TOC entry 1600 (class 1259 OID 381288)
-- Dependencies: 3
-- Name: customer; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE customer (
    id integer NOT NULL,
    name character varying NOT NULL,
    phone character varying,
    email character varying,
    streetandnumber character varying,
    city character varying,
    state character varying,
    zipcode character varying,
    country character varying
);


--
-- TOC entry 1909 (class 0 OID 0)
-- Dependencies: 1600
-- Name: COLUMN customer.phone; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN customer.phone IS 'unique';


--
-- TOC entry 1599 (class 1259 OID 381286)
-- Dependencies: 3 1600
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE customer_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1910 (class 0 OID 0)
-- Dependencies: 1599
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE customer_id_seq OWNED BY customer.id;


--
-- TOC entry 1911 (class 0 OID 0)
-- Dependencies: 1599
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('customer_id_seq', 88, true);


--
-- TOC entry 1602 (class 1259 OID 381304)
-- Dependencies: 3
-- Name: orders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orders (
    id integer NOT NULL,
    numberorder character varying NOT NULL,
    date date,
    idcustomer integer NOT NULL,
    paymenttype character varying
);


--
-- TOC entry 1601 (class 1259 OID 381302)
-- Dependencies: 3 1602
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE orders_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1912 (class 0 OID 0)
-- Dependencies: 1601
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- TOC entry 1913 (class 0 OID 0)
-- Dependencies: 1601
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('orders_id_seq', 157, true);


--
-- TOC entry 1603 (class 1259 OID 381400)
-- Dependencies: 1874 3
-- Name: ordersproduct; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ordersproduct (
    idproduct integer,
    idorders integer,
    count integer DEFAULT 1
);


--
-- TOC entry 1596 (class 1259 OID 381266)
-- Dependencies: 3
-- Name: product; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE product (
    id integer NOT NULL,
    name text NOT NULL,
    weight real,
    price real,
    description character varying
);


--
-- TOC entry 1595 (class 1259 OID 381264)
-- Dependencies: 1596 3
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE product_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1914 (class 0 OID 0)
-- Dependencies: 1595
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE product_id_seq OWNED BY product.id;


--
-- TOC entry 1915 (class 0 OID 0)
-- Dependencies: 1595
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('product_id_seq', 46, true);


--
-- TOC entry 1598 (class 1259 OID 381277)
-- Dependencies: 3
-- Name: shippingaddress; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shippingaddress (
    id integer NOT NULL,
    streetandnumber character varying NOT NULL,
    city character varying,
    state character varying,
    zipcode character varying,
    country character varying,
    idcustomer bigint
);


--
-- TOC entry 1597 (class 1259 OID 381275)
-- Dependencies: 3 1598
-- Name: shippingaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shippingaddress_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1916 (class 0 OID 0)
-- Dependencies: 1597
-- Name: shippingaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shippingaddress_id_seq OWNED BY shippingaddress.id;


--
-- TOC entry 1917 (class 0 OID 0)
-- Dependencies: 1597
-- Name: shippingaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('shippingaddress_id_seq', 68, true);


--
-- TOC entry 1872 (class 2604 OID 381291)
-- Dependencies: 1600 1599 1600
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE customer ALTER COLUMN id SET DEFAULT nextval('customer_id_seq'::regclass);


--
-- TOC entry 1873 (class 2604 OID 381307)
-- Dependencies: 1601 1602 1602
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- TOC entry 1870 (class 2604 OID 381269)
-- Dependencies: 1595 1596 1596
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE product ALTER COLUMN id SET DEFAULT nextval('product_id_seq'::regclass);


--
-- TOC entry 1871 (class 2604 OID 381280)
-- Dependencies: 1597 1598 1598
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE shippingaddress ALTER COLUMN id SET DEFAULT nextval('shippingaddress_id_seq'::regclass);


--
-- TOC entry 1894 (class 0 OID 381288)
-- Dependencies: 1600
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (48, 'Fedex', '1236549877', 'ria@casual.com', 'bdcb', 'bcb', 'cjkhwkk', '12345', 'usa');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (44, 'Stevia', '678123567', 'nenemalo@nom.com', '135', 'miami', 'fl', '12345', 'usa');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (46, 'Omelly', '6754231452', 'greyomelyy@fui.com', 'vudu.ccom', 'guterla', 'giorgia', '12543', 'usa');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (4, 'Staples', '5362296934', 'raul.havarria@yahhoo.comu', 'micro 1', 'neuvitas', 'camgeuy', '10600', 'cuba');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (51, 'Crocs', '1234567897', 'crioc@shoes.com', '45nw 76 ave', 'miami', 'florida', '654123', 'usa');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (32, 'Office depot', '305 34598073', 'daurys@gmdail.comt', 'bayside', 'miami', 'florida', '33012', 'United States');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (47, 'Victoria', '5649871236', 'ria@furia.com', 'wkch', 'tembe', 'giorgia', '76543', 'usa');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (33, 'Spring Water', '78622394296', 'raulhperez@gmail.como', '15311 Vantage  Parkway West Suite 104', 'houston', 'tx', '32313', 'United States');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (65, 'npm', '78965412365', 'pepe@magaya.com', '', '', '', '', '');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (3, 'jhon  willia', '3056982340', 'williz@gmail.cmwilliw', '160 w 64 terr', 'miami', 'fl', '23546', 'usa');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (28, 'Antony H', '30526496364', 'dairys@gmmt.com', 'palmetto and 64', 'hialea', 'fl', '33012', 'usa');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (35, 'Amys', '8598745283', 'anmu@dfgf.codmqf.ki', '42 east 12 stree', 'broward', 'broward', '23456', 'us');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (49, 'Lipton', '8006573001', 'lipton@ssa.com', 'mehi crv', 'monte', 'urug', '23698', 'uruguay');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (27, 'Jose Perez', '7862239429', 'raulhperez@gmail.com', '196 E 41ST ST', 'HIALEAH', 'FL', '33013', 'United States');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (50, 'Scotch', '8719284371', 'scotch@material.com', '3445 west 72 ave', 'miami', 'florida', '33122', 'usa');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (52, 'Amazon', '1234569874', 'amazon@buy.com', 'madrilena', 'La nueva', 'Madrid', '45621', 'espana');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (29, 'RAUL', '7862234', 'raulhperez@gmail.comea', '196 E 41ST STss', 'HIALEAH', 'FL', '33013', 'United States');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (88, 'UPS', '3052649816', 'ups@ups.com.us', '', '', '', '', '');
INSERT INTO customer (id, name, phone, email, streetandnumber, city, state, zipcode, country) VALUES (34, 'MAGAYA', '78630870547', 'ygarcia@magaya.com', '8261 nw 5 terra, 336', 'miami', 'Florida', '33126', 'United States');


--
-- TOC entry 1895 (class 0 OID 381304)
-- Dependencies: 1602
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (133, '2018-754', '2018-10-15', 3, 'Check');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (134, '2018-864', '2018-10-09', 28, 'Check');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (135, '2018-96', '2018-10-16', 46, 'Credit Card');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (136, '2018-241', '2018-10-09', 3, '');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (137, '2018-280', '2018-10-17', 3, 'Check');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (138, '2018-61', '2018-10-17', 28, '');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (142, '2018-921', '2018-10-23', 46, 'Check');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (145, '2018-525', '2018-10-12', 34, 'Credit Card');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (146, '2018-436', '2018-10-20', 3, 'Credit Card');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (147, '2018-7', '2018-10-12', 32, 'Check');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (148, '2018-679', '2018-10-20', 28, 'Check');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (149, '2018-529', '2018-10-27', 47, 'Credit Card');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (150, '2018-853', '2018-10-18', 3, 'Credit Card');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (152, '2018-389', '2018-10-19', 49, 'Check');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (153, '2018-609', '2018-10-25', 28, '');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (154, '2018-135', '2018-10-22', 4, '');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (155, '2018-215', '2018-10-16', 4, 'Credit Card');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (156, '2018-111', '2018-10-17', 51, 'Credit Card');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (157, '2018-785', '2018-10-17', 88, 'Check');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (114, '2018-564', '2018-10-11', 32, 'Credit Card');
INSERT INTO orders (id, numberorder, date, idcustomer, paymenttype) VALUES (115, '2018-595', '2018-10-10', 3, 'Credit Card');


--
-- TOC entry 1896 (class 0 OID 381400)
-- Dependencies: 1603
-- Data for Name: ordersproduct; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO ordersproduct (idproduct, idorders, count) VALUES (23, 147, 1);
INSERT INTO ordersproduct (idproduct, idorders, count) VALUES (25, 147, 200);
INSERT INTO ordersproduct (idproduct, idorders, count) VALUES (26, 147, 200);
INSERT INTO ordersproduct (idproduct, idorders, count) VALUES (26, 148, 34);
INSERT INTO ordersproduct (idproduct, idorders, count) VALUES (30, 149, 3);
INSERT INTO ordersproduct (idproduct, idorders, count) VALUES (34, 149, 3);
INSERT INTO ordersproduct (idproduct, idorders, count) VALUES (7, 150, 1);
INSERT INTO ordersproduct (idproduct, idorders, count) VALUES (27, 152, 40);
INSERT INTO ordersproduct (idproduct, idorders, count) VALUES (31, 152, 40);
INSERT INTO ordersproduct (idproduct, idorders, count) VALUES (24, 154, 3);
INSERT INTO ordersproduct (idproduct, idorders, count) VALUES (24, 155, 2);
INSERT INTO ordersproduct (idproduct, idorders, count) VALUES (25, 156, 1);
INSERT INTO ordersproduct (idproduct, idorders, count) VALUES (46, 157, 2);


--
-- TOC entry 1892 (class 0 OID 381266)
-- Dependencies: 1596
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO product (id, name, weight, price, description) VALUES (35, 'S9', 0.88999999, 600, 'a lot');
INSERT INTO product (id, name, weight, price, description) VALUES (46, 'ab', 2, 2, 'ab');
INSERT INTO product (id, name, weight, price, description) VALUES (26, 'wipe', 16, 13.45, 'flushable');
INSERT INTO product (id, name, weight, price, description) VALUES (2, 'iphone', 0.23, 50.889999, 'cell phone');
INSERT INTO product (id, name, weight, price, description) VALUES (23, 'keyboard', 7, 16, 'black');
INSERT INTO product (id, name, weight, price, description) VALUES (24, 'tablet 5.11', 9, 256, 'samsung ');
INSERT INTO product (id, name, weight, price, description) VALUES (25, 'erasable pen', 2, 10.67, 'blue');
INSERT INTO product (id, name, weight, price, description) VALUES (27, 'shair pilow', 7, 56.799999, 'memory foam');
INSERT INTO product (id, name, weight, price, description) VALUES (28, 'laptop battery', 22, 65.989998, '2000mAp');
INSERT INTO product (id, name, weight, price, description) VALUES (29, 'laptop table', 48, 123.87, '12" wood');
INSERT INTO product (id, name, weight, price, description) VALUES (7, 'laptop lenovo', 23.34, 56.34, 'productionfghgfh');
INSERT INTO product (id, name, weight, price, description) VALUES (11, 'hard disk', 2.45, 55.990002, '17"');
INSERT INTO product (id, name, weight, price, description) VALUES (30, 'alexa', 1, 1, 'a');
INSERT INTO product (id, name, weight, price, description) VALUES (31, 'cup', 6, 2.45, 'yellow');
INSERT INTO product (id, name, weight, price, description) VALUES (12, 'pendrived', 12.4, 67.989998, '128gb');
INSERT INTO product (id, name, weight, price, description) VALUES (33, 'smart tv', 35, 658.98999, '55"');
INSERT INTO product (id, name, weight, price, description) VALUES (18, 'wifi adapter', 23, 15.45, 'wifi  to i');
INSERT INTO product (id, name, weight, price, description) VALUES (34, 'remote c', 1, 7.9899998, 'black smart');
INSERT INTO product (id, name, weight, price, description) VALUES (32, 'bed', 24, 300.98999, 'blue m');


--
-- TOC entry 1893 (class 0 OID 381277)
-- Dependencies: 1598
-- Data for Name: shippingaddress; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country, idcustomer) VALUES (48, '196 E 41ST ST', 'HIALEAH', 'Tx', '33013', 'United States', 47);
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country, idcustomer) VALUES (67, '87 leojun', 'hialeah', 'California', '926494', 'usa', 88);
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country, idcustomer) VALUES (47, ' 520 W 49th St,', 'Hialeah', 'FL ', '33012', '', 32);
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country, idcustomer) VALUES (36, '5785 NW 7th St', 'Miami', 'FL', '33126', 'United States', 32);
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country, idcustomer) VALUES (49, '2779 NW 112th Ave,', 'miami', 'fl', '33172', '', 33);
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country, idcustomer) VALUES (68, '7950 NW 53rd St Suite 300', 'Doral', 'FL', '33166', 'United State', 34);
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country, idcustomer) VALUES (38, '4400 NW 87th Ave', 'Doral', 'Miami', '33178', 'USA', 48);
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country, idcustomer) VALUES (39, '595 W 49th S', 'Hialeah', 'fl', '33012', '', 48);
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country, idcustomer) VALUES (40, '4250 Shallowford Rd', 'Chattanooga', 'NT', '37421', 'US', 48);
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country, idcustomer) VALUES (41, '29300 Hempstead Rd', 'Cypress', 'TX', '77433', 'US', 44);
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country, idcustomer) VALUES (45, '5000 Katy Mills Cir', 'Katy,', 'TX', '77450', '', 51);
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country, idcustomer) VALUES (46, '415 S Fry Rd,', 'Katy,', 'TX', 'zfbzf', 'US', 32);
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country, idcustomer) VALUES (44, '2121 Biscayne Blvd,', 'MIAMI', 'FL', '33137', 'US', 4);
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country, idcustomer) VALUES (50, '123 stree  no 23', 'doral', 'fl', '23456', 'usa', 65);
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country, idcustomer) VALUES (34, 'a', 'aaaaaaaaaaa', '', '111111', '', 32);
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country, idcustomer) VALUES (35, 'bbb', 'kendall', '', 'bbb1', '', 32);
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country, idcustomer) VALUES (37, '8261 nw 5 terra, 336', 'miami', 'Florida', '33126', 'United States', 32);
INSERT INTO shippingaddress (id, streetandnumber, city, state, zipcode, country, idcustomer) VALUES (43, 'rtysrth', 'f', '', 'rthrth', '', 46);


--
-- TOC entry 1881 (class 2606 OID 381296)
-- Dependencies: 1600 1600
-- Name: customer_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- TOC entry 1883 (class 2606 OID 381420)
-- Dependencies: 1600 1600
-- Name: emaileunique; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT emaileunique UNIQUE (email);


--
-- TOC entry 1887 (class 2606 OID 381312)
-- Dependencies: 1602 1602
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 1885 (class 2606 OID 381418)
-- Dependencies: 1600 1600
-- Name: phoneunique; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT phoneunique UNIQUE (phone);


--
-- TOC entry 1876 (class 2606 OID 381274)
-- Dependencies: 1596 1596
-- Name: product_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 1879 (class 2606 OID 381285)
-- Dependencies: 1598 1598
-- Name: shippingaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shippingaddress
    ADD CONSTRAINT shippingaddress_pkey PRIMARY KEY (id);


--
-- TOC entry 1877 (class 1259 OID 381426)
-- Dependencies: 1598
-- Name: fki_customeraddresss; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fki_customeraddresss ON shippingaddress USING btree (idcustomer);


--
-- TOC entry 1888 (class 2606 OID 381421)
-- Dependencies: 1600 1598 1880
-- Name: customeraddresss; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shippingaddress
    ADD CONSTRAINT customeraddresss FOREIGN KEY (idcustomer) REFERENCES customer(id) ON DELETE CASCADE;


--
-- TOC entry 1889 (class 2606 OID 381313)
-- Dependencies: 1880 1600 1602
-- Name: orders_idcustomer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_idcustomer_fkey FOREIGN KEY (idcustomer) REFERENCES customer(id);


--
-- TOC entry 1891 (class 2606 OID 381408)
-- Dependencies: 1603 1602 1886
-- Name: ordersproduct_idorders_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ordersproduct
    ADD CONSTRAINT ordersproduct_idorders_fkey FOREIGN KEY (idorders) REFERENCES orders(id);


--
-- TOC entry 1890 (class 2606 OID 381403)
-- Dependencies: 1603 1875 1596
-- Name: ordersproduct_idproduct_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ordersproduct
    ADD CONSTRAINT ordersproduct_idproduct_fkey FOREIGN KEY (idproduct) REFERENCES product(id);


--
-- TOC entry 1901 (class 0 OID 0)
-- Dependencies: 3
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM rhp;
GRANT ALL ON SCHEMA public TO rhp;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-10-08 12:08:49

--
-- PostgreSQL database dump complete
--

