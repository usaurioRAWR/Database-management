-- Creation of the database of sales order of product
-- Datatypes:
	-- VARCHAR ; variable length characters.
		-- Caracteres de longitud variable.
	-- CHAR ; fixed length caracters.
		-- Caracteres de longitud fija.
	-- INT ; integer values, positive and negative.	
		-- Valores enteros, positivos y negativos.
	-- UNSIGNED INT ; integer values only pasitive.
		-- Valores enteros solo pasivos.
	-- DECIMAL ; (n,m) n digits in total, whit m decimal. 
		-- n dígitos enteros, m decimal.
	-- DATE ; yyyy-mm-dd
	-- TIME ; hh:mm:ss
	-- DATE TIME ; yyyy-mm-dd hh:mm:ss
	
CREATE TABLE customer (
	customer_id INT(6) PRIMARY KEY,
	fullname VARCHAR(60),
	street VARCHAR(30),
	city VARCHAR(30),
	zip VARCHAR(5),
	phone VARCHAR(30)
); 

-- Considerar digitos necesarios para la factura.

CREATE TABLE invoice (
	invoice_id INT(8) PRIMARY KEY,
	to_fullname VARCHAR(60),
	to_street VARCHAR(30),
	to_city VARCHAR(30),
	to_zip VARCHAR(30),
	order_date DATE,
	ship_date DATE,
	payment CHAR(1),
	customer_id INT(6),
	FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);

CREATE TABLE product (
	product_id INT(6) PRIMARY KEY,
	desciption VARCHAR(30),
	quantity INT(6),
	price DECIMAL(8,2)
);

CREATE TABLE item (
	item_id  INT(6) PRIMARY KEY,
	invoice_id INT(8),
	product_id INT(6),
	units INT(6),
	price DECIMAL(8,2),
	FOREIGN KEY (invoice_id) REFERENCES invoice (invoice_id),
	FOREIGN KEY (product_id) REFERENCES product (product_id)
);