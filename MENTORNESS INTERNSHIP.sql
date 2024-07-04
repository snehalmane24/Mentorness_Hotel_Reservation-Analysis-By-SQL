CREATE DATABASE MENTORNESS;
USE MENTORNESS;
SELECT * FROM HOTEL_RESERVATION;
-- 1. What is the total number of reservations in the dataset?
SELECT COUNT(*) AS TOTAL_RESERVATIONS FROM HOTEL_RESERVATION; 

-- 2. Which meal plan is the most popular among guests?
SELECT type_of_meal_plan, COUNT(type_of_meal_plan) AS POPULAR_MEAL_PLAN 
FROM HOTEL_RESERVATION
GROUP BY type_of_meal_plan 
ORDER BY COUNT(type_of_meal_plan) DESC ;

-- 3. What is the average price per room for reservations involving children?
SELECT AVG(avg_price_per_room) AS average_price_per_room
FROM HOTEL_RESERVATION
WHERE no_of_children > 0;

-- 4. How many reservations were made for the year 20XX (replace XX with the desired year)?
SELECT YEAR(arrival_date) AS YEARS,COUNT(*) AS RESERVATIONS
FROM HOTEL_RESERVATION
GROUP BY YEAR(arrival_date);

-- 5. What is the most commonly booked room type?
SELECT room_type_reserved,COUNT(*) AS TOTAL_RESERVATION
FROM HOTEL_RESERVATION 
GROUP BY room_type_reserved
ORDER BY  COUNT(*) DESC
LIMIT 1;

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
SELECT COUNT(*) AS WEEKEND_RESERVATIONS 
FROM HOTEL_RESERVATION
WHERE no_of_weekend_nights > 0;

-- 7. What is the highest and lowest lead time for reservations?
SELECT MAX(lead_time) AS HIGHEST_LEADTIME, MIN(lead_time) AS LOWEST_LEADTIME 
FROM HOTEL_RESERVATION;

-- 8. What is the most common market segment type for reservations?
SELECT market_segment_type,COUNT(*) AS MARKET_SEGMENT_COUNT FROM HOTEL_RESERVATION
GROUP BY market_segment_type
ORDER BY COUNT(*)  DESC
LIMIT 1;

-- 9. How many reservations have a booking status of "Confirmed"?
SELECT COUNT(*) FROM HOTEL_RESERVATION
WHERE booking_status = "CONFIRMED";

-- 10. What is the total number of adults and children across all reservations?
SELECT SUM(no_of_adults) AS TOTAL_ADULTS, SUM(no_of_children) AS TOTAL_CHILDREN
FROM HOTEL_RESERVATION;

-- 11. What is the average number of weekend nights for reservations involving children?
SELECT AVG(no_of_weekend_nights) AS AVG_WEEKEND_NIGHTS 
FROM HOTEL_RESERVATION
WHERE no_of_children > 0;

-- 12. How many reservations were made in each month of the year?
SELECT MONTH(arrival_date) AS MONTHS, COUNT(*) AS RESERVATIONS 
FROM HOTEL_RESERVATION
GROUP BY MONTH(arrival_date)
ORDER BY MONTH(arrival_date);

-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
SELECT room_type_reserved, AVG(no_of_weekend_nights + no_of_week_nights) AS AVG_NIGHTS
FROM HOTEL_RESERVATION
GROUP BY room_type_reserved
ORDER BY AVG_NIGHTS DESC ;

-- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
SELECT room_type_reserved, AVG(avg_price_per_room) AS AVG_PRICE_ROOMS
FROM HOTEL_RESERVATION
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 15. Find the market segment type that generates the highest average price per room.
SELECT market_segment_type,AVG(avg_price_per_room) AS HIGHEST_AVG_PRICE 
FROM HOTEL_RESERVATION
GROUP BY market_segment_type
ORDER BY HIGHEST_AVG_PRICE DESC
LIMIT 1;