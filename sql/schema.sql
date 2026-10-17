DROP TABLE IF EXISTS reviews, order_items, orders, customers, menu_items, outlets CASCADE;

CREATE TABLE outlets (
  outlet_id INT PRIMARY KEY,
  outlet_name VARCHAR(100) NOT NULL,
  city VARCHAR(60) NOT NULL,
  state VARCHAR(60) NOT NULL,
  opening_date DATE NOT NULL
);

CREATE TABLE menu_items (
  item_id INT PRIMARY KEY,
  item_name VARCHAR(100) NOT NULL,
  category VARCHAR(50) NOT NULL,
  price NUMERIC(10,2) NOT NULL CHECK (price >= 0),
  cost NUMERIC(10,2) NOT NULL CHECK (cost >= 0)
);

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  signup_date DATE NOT NULL,
  city VARCHAR(15) NOT NULL
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT NOT NULL REFERENCES customers(customer_id),
  outlet_id INT NOT NULL REFERENCES outlets(outlet_id),
  order_date TIMESTAMP NOT NULL,
  order_status VARCHAR(20) NOT NULL CHECK (order_status IN ('Delivered','Cancelled','Refunded')),
  delivery_minutes INT,
  discount NUMERIC(10,2) NOT NULL DEFAULT 0 CHECK (discount >= 0)
);

CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY,
  order_id INT NOT NULL REFERENCES orders(order_id),
  item_id INT NOT NULL REFERENCES menu_items(item_id),
  quantity INT NOT NULL CHECK (quantity > 0),
  unit_price NUMERIC(10,2) NOT NULL CHECK (unit_price >= 0)
);

CREATE TABLE reviews (
  review_id INT PRIMARY KEY,
  order_id INT NOT NULL UNIQUE REFERENCES orders(order_id),
  rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
  review_text TEXT
);


ALTER TABLE orders
ALTER COLUMN delivery_minutes TYPE NUMERIC(5,2)