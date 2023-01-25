CREATE TABLE "Customer" (
	"customer_id" SERIAL PRIMARY KEY,
	"first_name" VARCHAR(100),
	"last_name" VARCHAR(100),
	"phone" VARCHAR(15),
	"is_member" BOOLEAN
);
CREATE TABLE "Concessions" (
  "concession_id" SERIAL PRIMARY KEY,
  "food_cost_total" NUMERIC(8,2),
  "food_count" INTEGER
);

CREATE TABLE "Movies" (
  "movie_id" SERIAL PRIMARY KEY,
  "name" VARCHAR(100),
  "rating" VARCHAR(5)
);

CREATE TABLE "Items" (
  "item_id" SERIAL PRIMARY KEY,
  "name" VARCHAR(100),
  "price" NUMERIC(4,2),
  "description" VARCHAR(200)
);


CREATE TABLE "Showtimes" (
  "showtime_id" SERIAL PRIMARY KEY,
  "movie_id" INTEGER REFERENCES "Movies"("movie_id"),
  "showtime" TIME,
  "date" DATE
);

CREATE TABLE "Ticket" (
	"ticket_id" SERIAL PRIMARY KEY,
	"date" DATE,
	"price" NUMERIC(5,2),
	"concession_id" INTEGER REFERENCES "Concessions"("concession_id"),
	"customer_id" INTEGER REFERENCES "Customer"("customer_id"),
	"showtime_id" INTEGER REFERENCES "Showtimes"("showtime_id")
);

CREATE TABLE "User_Qty" (
  "qty_id" SERIAL PRIMARY KEY,
  "item_id" INTEGER REFERENCES "Items"(item_id),
  "quantity" INTEGER,
  "concession_id" INTEGER REFERENCES "Concessions"("concession_id")
);

INSERT INTO "Customer"(
	first_name,
	last_name,
	phone,
	is_member
)VALUES(
	'John',
	'Kim',
	'443-474-2430',
	true
);
SELECT * FROM "Customer";

INSERT INTO "Items"(
	"name",
	price,
	description
)VALUES(
	'extra-large popcorn',
	12.99,
	'...buttery and oversized'
);

INSERT INTO "Items"(
	"name",
	price,
	description
)VALUES(
	'large-ICEE',
	7.99,
	'...sugary and oversized'
);
SELECT * FROM "Items";

INSERT INTO "Movies"(
	"name",
	rating
)VALUES(
	'Avatar: The Way of Water',
	'PG-13'
);

INSERT INTO "Movies"(
	"name",
	rating
)VALUES(
	'The Whale',
	'R'
);

INSERT INTO "Movies"(
	"name",
	rating
)VALUES(
	'M3GAN',
	'PG-13'
);
SELECT * FROM "Movies";

INSERT INTO "Concessions"(
	food_cost_total,
	food_count
)VALUES(
	20.98,
	2
);
SELECT * FROM "Concessions";
INSERT INTO "User_Qty"(
	item_id,
	quantity,
	concession_id
)VALUES(
	1,
	1,
	1
);
INSERT INTO "User_Qty"(
	item_id,
	quantity,
	concession_id
)VALUES(
	2,
	1,
	1
);
SELECT * FROM "User_Qty";

INSERT INTO "Showtimes"(
	movie_id,
	showtime,
	"date"
)VALUES(
	2,
	('01:30'),
	('2023/1/25')
);
INSERT INTO "Showtimes"(
	movie_id,
	showtime,
	"date"
)VALUES(
	2,
	('07:30'),
	('2023/1/25')
);
INSERT INTO "Showtimes"(
	movie_id,
	showtime,
	"date"
)VALUES(
	1,
	('04:00'),
	('2023/1/25')
);
INSERT INTO "Showtimes"(
	movie_id,
	showtime,
	"date"
)VALUES(
	3,
	('10:30'),
	('2023/1/25')
);

SELECT * FROM "Showtimes";

INSERT INTO "Ticket"(
	"date",
	price,
	concession_id,
	customer_id,
	showtime_id
)VALUES(
	('2023/1/25'),
	17.99,
	1,
	1,
	1
);
SELECT * FROM "Ticket";

INSERT INTO "Customer"(
	first_name,
	last_name,
	phone,
	is_member
)VALUES(
	'Laura',
	'Lunz',
	'443-240-4000',
	false
);
INSERT INTO "Customer"(
	first_name,
	last_name,
	phone,
	is_member
)VALUES(
	'Agatha',
	'Candleburnson',
	'703-999-9833',
	true
);
SELECT * FROM "Customer";
