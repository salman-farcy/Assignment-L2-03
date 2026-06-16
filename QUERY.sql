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


-- STEP 4: insert sample data in users
INSERT INTO users (user_id, full_name, email, role, phone_number)
VALUES
(1, 'Tanvir Rahman', 'tanvir@mail.com', 'Football Fan', '+8801711111111'), 
(2, 'Asif Haque', 'asif@mail.com', 'Football Fan', '+8801722222222'), 
(3, 'Sajjad Rahman', 'sajjad@mail.com', 'Ticket Manager', '+8801733333333'), 
(4, 'Jannat Ara', 'jannat@mail.com', 'Football Fan', NULL);



-- STEP 5: insert sample data in matches 
INSERT INTO matches (match_id, fixture, tournament_category, base_ticket_price, match_status)
VALUES
(101, 'Real Madrid vs Barcelona', 'Champions League', 150, 'Available'), 
(102, 'Man City vs Liverpool', 'Premier League', 120, 'Selling Fast'), 
(103, 'Bayern Munich vs PSG', 'Champions League', 130, 'Available'), 
(104, 'AC Milan vs Inter Milan', 'Serie A', 90, 'Sold Out'), 
(105, 'Juventus vs Roma', 'Serie A', 80, 'Available');



-- STEP 6: insert sample data in bookings
INSERT INTO bookings (booking_id, user_id, match_id, seat_number, payment_status, total_cost)
VALUES
(501, 1, 101, 'A-12', 'Confirmed', 150), 
(502, 1, 102, 'B-04', 'Confirmed', 120), 
(503, 2, 101, 'A-13', 'Confirmed', 150), 
(504, 2, 101, NULL, NULL, 150), 
(505, 3, 102, 'C-20', 'Pending', 120);



-- ====================================================
-- SQL QUERIES
-- ====================================================



-- STEP 7 : Query 1, SQL Queries
SELECT 
  match_id, fixture, base_ticket_price
FROM matches
WHERE tournament_category = 'Champions League'
  AND MATCH_STATUS = 'Available';




-- STEP 8 : Query 2, SQL Queries
SELECT 
  user_id, full_name, email
FROM users
WHERE full_name ILIKE 'Tanvir%'
  OR full_name ILIKE '%Haque%';




-- STEP 9 : Query 3, SQL Queries
SELECT 
  booking_id,
  user_id,
  match_id,
  COALESCE(payment_status, 'Action Required') AS systematic_status
FROM bookings
WHERE payment_status IS NULL;



-- STEP 10 : Query 4, SQL Queries
SELECT 
  b.booking_id, u.full_name, m.fixture, b.total_cost
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN matches m ON b.match_id = m.match_id;