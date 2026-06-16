-- Create Database Assignment03
CREATE DATABASE Assignment03;



-- Step 00: Drop Tables (optional safety step)
DROP TABLE IF EXISTS bookings; 
DROP TABLE IF EXISTS matches; 
DROP TABLE IF EXISTS users;


-- Step 01: create Tables (schema)
CREATE TABLE users ( 
     user_id INT PRIMARY KEY, 
     full_name VARCHAR(100) NOT NULL, 
     email VARCHAR(100) UNIQUE NOT NULL, 
     role VARCHAR(50) NOT NULL, 
     phone_number VARCHAR(20) 
);
