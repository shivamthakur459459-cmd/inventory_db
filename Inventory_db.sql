-- ===========================================
-- INVENTORY MANAGEMENT (MySQL)
-- ===========================================

-- Step 1: Database select
CREATE DATABASE IF NOT EXISTS inventory_db;
USE inventory_db;

-- Step 2: Table create
DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    price DECIMAL(10,2) NOT NULL
);

-- Step 3: Procedure - Add Product
DELIMITER //
CREATE PROCEDURE AddProduct(
    IN p_name VARCHAR(100),
    IN p_stock INT,
    IN p_price DECIMAL(10,2)
)
BEGIN
    INSERT INTO products(product_name, stock, price)
    VALUES (p_name, p_stock, p_price);
END //
DELIMITER ;

-- Step 4: Procedure - Update Stock
DELIMITER //
CREATE PROCEDURE UpdateStock(
    IN p_id INT,
    IN p_new_stock INT
)
BEGIN
    UPDATE products
    SET stock = p_new_stock
    WHERE product_id = p_id;
END //
DELIMITER ;products

-- Step 5: Test Procedures
-- Insert products
CALL AddProduct('Laptop', 10, 75000.00);
CALL AddProduct('Mobile', 25, 30000.00);

-- Update stock of Laptop (id=1)
CALL UpdateStock(1, 15);

-- Final check
SELECT * FROM products;