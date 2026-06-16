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


-- Step 02: create Tables (schema)
CREATE TABLE matches ( 
  match_id INT PRIMARY KEY, 
  fixture VARCHAR(150) NOT NULL, 
  tournament_category VARCHAR(100) NOT NULL, 
  base_ticket_price NUMERIC(10,2) NOT NULL, 
  match_status VARCHAR(50) NOT NULL 
);


-- STEP 3: CREATE TABLES (SCHEMA)
CREATE TABLE bookings(
  booking_id INT PRIMARY KEY,
  user_id INT NOT NULL,
  match_id INT NOT NULL,
  seat_number VARCHAR(20),
  payment_status VARCHAR(50),
  total_cost NUMERIC(10,2) NOT NULL,

  CONSTRAINT fk_booking_user
    FOREIGN KEY (user_id)
    REFERENCES users(user_id),

  CONSTRAINT fk_booking_match
    FOREIGN KEY (match_id)
    REFERENCES matches(match_id)
);