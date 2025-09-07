-- Question 1 🧑‍💼Write an SQL query to get the firstName, lastName, email, and officeCode of all employees.Use an INNER JOIN to combine the employees table with the offices table using the officeCode 
-- Create the office table FIRST
CREATE TABLE IF NOT EXISTS office (
    office_code VARCHAR(7) PRIMARY KEY,
    office_name VARCHAR(50),
    office_capacity INT
);

-- Now create the users table referencing office_code
CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    office_code VARCHAR(7),
    FOREIGN KEY (office_code) REFERENCES office(office_code)
);

INSERT INTO users(first_name,last_name,email)
VALUES('James','Nderangu','hgyt@gmail.com'),
      ('Horace','Witaba','WItaba@gmail.com');

INSERT INTO office(office_name,office_capacity,office_code)
VALUES('Marketing',20,'345'),
      ('IT',4,'346');
SELECT * FROM users;

SELECT * FROM office 
INNER JOIN users ON 
office.office_code = users.office_code;

SELECT * FROM users;



-- question 2
SELECT 
    p.productName, 
    p.productVendor, 
    pl.productLine
FROM products p
LEFT JOIN productlines pl 
    ON p.productLine = pl.productLine;

-- qn 3
SELECT 
    o.orderDate, 
    o.shippedDate, 
    o.status, 
    o.customerNumber
FROM customers c
RIGHT JOIN orders o 
    ON c.customerNumber = o.customerNumber
LIMIT 10;

