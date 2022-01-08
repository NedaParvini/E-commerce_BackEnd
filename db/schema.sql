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
    stock INTEGER NOT NULL SET DEFAULT '10',
    FOREIGN KEY (category_id) REFERENCES Category(id)INTEGER,
    PRIMARY Key (id)
);

CREATE TABLE Tag (
    id INTEGER NOT NULL AUTO_INCREMENT,
    tag_name VARCHAR(30),
);

CREATE TABLE ProductTag (
    id INTEGER NOT NULL AUTO_INCREMENT,
    FOREIGN KEY (product_id) REFERENCES product(id)INTEGER,
    FOREIGN KEY (tag_id) REFERENCES tag(id)INTEGER,
);



SELECT name 
FROM department 
LEFT JOIN role 
ON department.id = role.department_id;

SELECT title, salary, department_id 
FROM role 
LEFT JOIN department 
ON role.department_id = department.id;

SELECT first_name, last_name, role_id, manager_id 
FROM employee 
JOIN role 
ON employee.role_id = role.department_id;

