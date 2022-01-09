-- DROP DATABASE
DROP DATABASE IF EXISTS ecommerce_db;

-- CREATE DATABASE
CREATE DATABASE ecommerce_db;

USE ecommerce_db;

CREATE TABLE Category (
    id INTEGER NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Product (
    id INTEGER NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(30) NOT NULL,
    price DECIMAL(9,2),
    stock INTEGER NUMERIC NOT NULL SET DEFAULT (10.00),
    FOREIGN KEY (category_id) REFERENCES Category(id) INTEGER,
    PRIMARY KEY (id)
);

CREATE TABLE Tag (
    id INTEGER NOT NULL AUTO_INCREMENT,
    tag_name VARCHAR(30),
);

CREATE TABLE ProductTag (
    id INTEGER NOT NULL AUTO_INCREMENT,
    FOREIGN KEY (product_id) REFERENCES product(id) INTEGER,
    FOREIGN KEY (tag_id) REFERENCES tag(id) INTEGER,
);

SELECT category_name 
FROM Category
LEFT JOIN Product
ON Category.id = Product.category_id;

SELECT product_name, price, stock
FROM Product 
LEFT JOIN Category 
ON Product.id = Product.category_id;






