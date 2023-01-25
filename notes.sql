CREATE TABLE "Brand" (
	"brand_id" SERIAL,
	"brand_name" VARCHAR(150),
	"is_trash" BOOLEAN,
	"parent_company" VARCHAR(150),
	PRIMARY KEY ("brand_id")
);

CREATE TABLE "Payment" (
	"payment_id" SERIAL PRIMARY KEY,
	"payment_type" VARCHAR(100),
	"is_default" BOOLEAN  
);

CREATE TABLE "Product" (
	"product_id" SERIAL PRIMARY KEY,
	"price" NUMERIC(5,2),
	"name" VARCHAR(150),
	"category" VARCHAR(150),
	"brand_id" INTEGER,
	"description" VARCHAR(300),
	FOREIGN KEY("brand_id") REFERENCES "Brand"("brand_id")	

);

CREATE TABLE "Inventory" (
	"inventory_id" SERIAL PRIMARY KEY,
	"stock" INTEGER,
	"pack_date" DATE,	
	"product_id" INTEGER,
	FOREIGN KEY("product_id") REFERENCES "Product"("product_id")
  
);

CREATE TABLE "Customer" (
	"customer_id" SERIAL PRIMARY KEY,
	"first_name" VARCHAR(100),
	"last_name" VARCHAR(100),
	"address" VARCHAR(150),
	"payment_id" INTEGER,
	FOREIGN KEY("payment_id")  REFERENCES "Payment"("payment_id")
  
);

CREATE TABLE "User_Qty" (
	"qty_id" SERIAL PRIMARY KEY,
	"quantity" INTEGER,
	"product_id" INTEGER,
	FOREIGN KEY ("product_id") REFERENCES "Product"("product_id")
	
  
);

CREATE TABLE "Cart" (
	"cart_id" SERIAL PRIMARY KEY,
	"qty_id" INTEGER,
	FOREIGN KEY("qty_id") REFERENCES "User_Qty"("qty_id")
);


CREATE TABLE "Order" ( 
	"order_id" SERIAL PRIMARY KEY,
	"order_date" DATE DEFAULT CURRENT_DATE,
	"product_cost" NUMERIC(8,2),
	"shipping_cost" NUMERIC(8,2),
	"total_cost" NUMERIC(8,2),
	"cart_id" INTEGER,
	"customer_id" INTEGER,	
	FOREIGN KEY("cart_id") REFERENCES "Cart"("cart_id"),
	FOREIGN KEY("customer_id") REFERENCES "Customer"("customer_id")
  
);

INSERT INTO "Brand"(
	"brand_name",
	"is_trash",
	"parent_company"
)VALUES(
	'Kellogs',
	True,
	'The Kellog Company'
);

INSERT INTO "Payment"(
	payment_type,
	is_default
)VALUES(
	'Visa',
	true
);

SELECT * FROM "Payment";

INSERT INTO "Product"(
	price,
	"name",
	category,
	brand_id,
	description
)VALUES(
	6.99,
	'Frosted Flakes',
	'Grocery',
	1,
	'They''re more than good theyre GREEEAT'
);
SELECT * FROM "Product";

INSERT INTO "Inventory"(
	stock,
	pack_date,
	product_id
)VALUES(
	10000,
	('2023/1/14'),
	1
);

INSERT INTO "Customer"(
	first_name,
	last_name,
	address,
	payment_id
)VALUES(
	'John',
	'Doe',
	'1234 Really Cool St. Chicago IL',
	1
);

INSERT INTO "User_Qty"(
	quantity,
	product_id
)VALUES(
	100,
	1
);

INSERT INTO "Cart"(
	qty_id
)VALUES(
	1
);

INSERT INTO "Order"(
	product_cost,
	shipping_cost,
	total_cost,
	cart_id,
	customer_id
)VALUES(
	6.99,
	30.00,
	729.00,
	1,
	1
);

-------- ran insert into order twice in order to remove one for example
DELETE FROM "Order"
WHERE order_id = 2;

----alter column
ALTER TABLE "Order"
ALTER COLUMN shipping_cost SET DATA TYPE INTEGER;

ALTER TABLE "Order"
ALTER COLUMN shipping_cost SET DATA TYPE NUMERIC(8,2);


CREATE TABLE "test"(
	test_id SERIAL PRIMARY KEY
);

DROP TABLE "test";

UPDATE "Customer"
SET first_name = 'George'
WHERE customer_id = 1;

SELECT * FROM "Customer";

SELECT * FROM "Order";

