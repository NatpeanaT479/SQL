BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "shop_owners" (
	"id"	INTEGER,
	"owner_name"	TEXT,
	"address"	TEXT,
	"postal_code"	TEXT,
	"state"	TEXT,
	"country"	TEXT,
	"phone_no"	TEXT,
	"email"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "product" (
	"id"	INTEGER,
	"name"	TEXT,
	"SKU"	TEXT,
	"description"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "product_category" (
	"id"	INTEGER,
	"product_id"	INTEGER,
	"category_type"	TEXT,
	"description"	TEXT,
	PRIMARY KEY("id"),
	FOREIGN KEY("product_id") REFERENCES "product"("id")
);
CREATE TABLE IF NOT EXISTS "shops" (
	"id"	INTEGER,
	"shop_owners_id"	INTEGER,
	"name"	TEXT,
	"category"	TEXT,
	"address"	TEXT,
	"state"	TEXT,
	"country"	TEXT,
	"rating"	REAL,
	"payment_opt"	TEXT,
	"chat_performance"	NUMERIC,
	"followers"	INTEGER,
	"follow"	INTEGER,
	"website"	TEXT,
	PRIMARY KEY("id"),
	FOREIGN KEY("shop_owners_id") REFERENCES "shop_owners"("id")
);
CREATE TABLE IF NOT EXISTS "product_shops" (
	"product_id"	,
	"shops_id"	,
	FOREIGN KEY("product_id") REFERENCES "product"("id"),
	FOREIGN KEY("shops_id") REFERENCES "shops"("id")
);
CREATE TABLE IF NOT EXISTS "user" (
	"id"	INTEGER,
	"user_type"	TEXT,
	"first_name"	TEXT,
	"last_name"	TEXT,
	"address"	TEXT,
	"postal_code"	TEXT,
	"city"	TEXT,
	"state"	TEXT,
	"country"	TEXT,
	"email"	TEXT,
	"display_name"	TEXT,
	"gender"	TEXT,
	"age"	INTEGER,
	"phone_no"	TEXT,
	"password"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "orders" (
	"id"	INTEGER,
	"product_id"	INTEGER,
	"user_id"	INTEGER,
	"order_date"	TEXT,
	"quantity"	INTEGER,
	"price"	NUMERIC,
	"RA_no"	TEXT,
	"RA_issued_date"	TEXT,
	"RA_issued_by"	TEXT,
	"order_status"	TEXT,
	PRIMARY KEY("id"),
	FOREIGN KEY("product_id") REFERENCES "product"("id"),
	FOREIGN KEY("user_id") REFERENCES "user"("id")
);
CREATE TABLE IF NOT EXISTS "payment" (
	"orders_id"	INTEGER,
	"payment_method"	TEXT,
	"bank_card_no"	TEXT,
	"bank_name"	TEXT,
	"pay_date"	TEXT,
	"discount_name"	TEXT,
	"discount_percent"	NUMERIC,
	"discount_exp_date"	TEXT,
	"amount"	NUMERIC,
	"status"	TEXT,
	FOREIGN KEY("orders_id") REFERENCES "orders"("id")
);
CREATE TABLE IF NOT EXISTS "shipping" (
	"id"	INTEGER,
	"shipping_date"	TEXT,
	"shipping_address"	TEXT,
	"service_provider"	TEXT,
	"tracking_no"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "shipping_orders" (
	"shipping_id"	INTEGER,
	"orders_id"	INTEGER,
	FOREIGN KEY("shipping_id") REFERENCES "shipping"("id"),
	FOREIGN KEY("orders_id") REFERENCES "orders"("id")
);
COMMIT;
