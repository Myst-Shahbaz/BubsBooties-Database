-- =========================================
-- Database: BubsBooties
-- Description: Tracks customers, employees, products, and customer purchases
-- =========================================

-- Create database
CREATE DATABASE IF NOT EXISTS bubsbooties;

-- Use the database
USE bubsbooties;

-- =========================================
-- Table: customers
-- Stores customer details
-- =========================================
CREATE TABLE IF NOT EXISTS customers (
    customer_id BIGINT PRIMARY KEY NOT NULL,      -- Unique customer ID
    first_name VARCHAR(100) NOT NULL,            -- Customer first name
    last_name VARCHAR(100) NOT NULL,             -- Customer last name
    email_address VARCHAR(50) NOT NULL           -- Customer email
);

-- =========================================
-- Table: products
-- Stores product details
-- =========================================
CREATE TABLE IF NOT EXISTS products (
    product_id BIGINT PRIMARY KEY NOT NULL,      -- Unique product ID
    product_name VARCHAR(50) NOT NULL,           -- Name of the product
    launch_date DATE                             -- Optional launch date
);

-- =========================================
-- Table: employees
-- Stores employee details
-- =========================================
CREATE TABLE IF NOT EXISTS employees (
    employee_id BIGINT PRIMARY KEY NOT NULL,     -- Unique employee ID
    first_name VARCHAR(50) NOT NULL,             -- Employee first name
    last_name VARCHAR(50) NOT NULL,              -- Employee last name
    position VARCHAR(50),                        -- Job position
    start_date TIMESTAMP                          -- Start date
);

-- =========================================
-- Table: customer_purchases
-- Tracks purchases made by customers
-- =========================================
CREATE TABLE IF NOT EXISTS customer_purchases (
    customer_purchase_id BIGINT PRIMARY KEY NOT NULL,  -- Unique purchase ID
    customer_id BIGINT NOT NULL,                       -- ID of purchasing customer
    product_id BIGINT NOT NULL,                        -- Purchased product ID
    employee_id BIGINT NOT NULL,                       -- Employee who handled purchase
    purchased_at TIMESTAMP,                            -- Purchase timestamp
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- =========================================
-- Insert sample data into customers
-- =========================================
INSERT INTO customers (customer_id, first_name, last_name, email_address)
VALUES
(1, 'Muhammad', 'Ali', 'm.ali@example.com'),
(2, 'Ayesha', 'Khan', 'ayesha.khan@example.com'),
(3, 'Hamza', 'Sheikh', 'hamza.sheikh@example.com'),
(4, 'Sara', 'Iqbal', 'sara.iqbal@example.com'),
(5, 'Usman', 'Raza', 'usman.raza@example.com'),
(6, 'Zara', 'Hassan', 'zara.hassan@example.com'),
(7, 'Bilal', 'Naeem', 'bilal.naeem@example.com'),
(8, 'Hira', 'Tariq', 'hira.tariq@example.com'),
(9, 'Faraz', 'Ahmed', 'faraz.ahmed@example.com'),
(10, 'Laiba', 'Noman', 'laiba.noman@example.com');

-- =========================================
-- Insert sample data into products
-- =========================================
INSERT INTO products (product_id, product_name, launch_date)
VALUES
(1, 'Premium Plan', '2024-02-10'),
(2, 'Starter Pack', '2023-11-05'),
(3, 'Analytics Add-on', '2024-05-20'),
(4, 'Automation Suite', '2023-12-01'),
(5, 'Mobile App Upgrade', '2024-03-15');

-- =========================================
-- Insert sample data into employees
-- =========================================
INSERT INTO employees (employee_id, first_name, last_name, position, start_date)
VALUES
(1, 'Ahmed', 'Saleem', 'Sales Associate', '2022-01-15'),
(2, 'Fatima', 'Rashid', 'Customer Support', '2021-09-10'),
(3, 'Omar', 'Khalid', 'Senior Sales Executive', '2020-06-21'),
(4, 'Nimra', 'Awan', 'Store Manager', '2019-03-12'),
(5, 'Hassan', 'Shah', 'Cashier', '2023-02-18');

-- =========================================
-- Insert sample data into customer_purchases
-- =========================================
INSERT INTO customer_purchases (customer_purchase_id, customer_id, product_id, employee_id, purchased_at)
VALUES
(1, 1, 2, 1, '2024-06-15 10:23:00'),
(2, 3, 1, 2, '2024-06-16 12:45:00'),
(3, 2, 3, 3, '2024-06-17 14:10:00'),
(4, 5, 5, 1, '2024-06-18 09:55:00'),
(5, 4, 4, 4, '2024-06-18 16:30:00'),
(6, 7, 1, 2, '2024-06-19 11:05:00'),
(7, 8, 2, 5, '2024-06-19 17:20:00'),
(8, 10, 3, 3, '2024-06-20 13:40:00'),
(9, 6, 5, 4, '2024-06-20 15:55:00'),
(10, 9, 4, 1, '2024-06-21 10:10:00');