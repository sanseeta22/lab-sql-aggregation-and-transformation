USE sakila;

-- Display the tables from Sakila data base
SHOW TABLES;

-- Challenge 1
-- 1.1 Determine the shortest and longest movie 
-- durations and name the values as max_duration and min_duration.
-- 1.1

SELECT 
    MAX(length) AS max_duration,
    MIN(length) AS min_duration
FROM film;

-- 1.2
-- Express the average movie duration in hours and minutes. 
-- Don't use decimals.


SELECT 
    CONCAT(AVG(length) DIV 60, ' hours ',
    ROUND( AVG(length) % 60), ' minutes') AS average_duration
FROM film;

-- 2.1 Calculate the number of days that the company has been operating.

SELECT MAX(rental_date) as max_rental_date,
MIN(rental_date) AS min_rental_date,
DATEDIFF(MAX(rental_date), MIN(rental_date)) 
AS days_operating
FROM rental;


-- 2.2 Retrieve rental information and add two additional columns to show the
-- month and weekday of the rental. Return 20 rows of results.

SELECT * FROM rental;

SELECT
    DATE_FORMAT(rental_date, '%Y-%m-%d') AS rental_date,
    DATE_FORMAT(rental_date, '%M') AS rental_month,
    DATE_FORMAT(rental_date, '%W') AS rental_weekday
FROM rental
LIMIT 20;

-- 2.3 rental duration value is NULL, replace it with 
-- the string 'Not Available'.

SELECT 
    title AS film_title,
    IFNULL(rental_duration, 'Not Available') AS rental_duration
FROM film
ORDER BY title ASC;

-- Bonus
SELECT CONCAT(first_name, ' ', last_name) AS full_name,
LEFT(email, 3) AS email_prefix
FROM customer
ORDER BY last_name ASC;



-- Challenge 2

-- 1.1 The total number of films that have been released.

SELECT COUNT(*) AS total_films_released
FROM film;

-- 1.2 The number of films for each rating.

SELECT rating, COUNT(*) AS number_of_films
FROM film
GROUP BY rating;

-- 1.3 The number of films for each rating, 
-- sorting the results in descending order 
SELECT rating, COUNT(*) AS number_of_films
FROM film
GROUP BY rating
ORDER BY number_of_films DESC;

-- 2.1 The mean film duration for each rating

SELECT 
    rating, 
    ROUND(AVG(length), 2) AS mean_film_duration
FROM film
GROUP BY rating
ORDER BY mean_film_duration DESC;

-- 2.2 Identify which ratings have a mean duration of over two hours 

SELECT 
    rating, 
    ROUND(AVG(length), 2) AS mean_film_duration
FROM film
GROUP BY rating
HAVING mean_film_duration >= 120;

-- Bonus

SELECT last_name, COUNT(*) AS last_name_count
FROM actor
GROUP BY last_name;

SELECT last_name from actor 
GROUP BY last_name
HAVING COUNT(*)=1;