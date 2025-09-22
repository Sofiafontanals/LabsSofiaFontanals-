USE sakila;

SELECT * FROM actor;
SELECT * FROM customer;
SELECT * FROM  film;


SELECT title FROM  film;



SELECT name AS language
FROM language;

SELECT COUNT(*) AS count_stores
FROM store;

SELECT COUNT(*) AS count_empleados
FROM staff;

SELECT first_name
FROM staff;

SELECT * FROM actor
WHERE first_name = 'Scarlett';


SELECT * FROM actor
WHERE last_name = 'Johansson';

SELECT COUNT(*) FROM inventory;

SELECT COUNT(*) FROM rental;

SELECT MIN(rental_duration) AS minduration, MAX(rental_duration) AS maxduration
FROM film;

SELECT MIN(length) AS alquilerminimo, MAX(length) AS alquilermaximo
FROM film;

SELECT AVG(length) AS avgduration
FROM film;

SELECT AVG(length) AS avgduration,
  FLOOR(AVG(length) / 60) AS hours,
  FLOOR(AVG(length) % 60) AS minutes
FROM film;

SELECT COUNT(*) AS peliculasmasde3horas
FROM film
WHERE length > 180;


SELECT CONCAT(CONCAT(LEFT(first_name, 1), LOWER(SUBSTRING(first_name, 2))), ' ', UPPER(last_name), ' - ', LOWER(email)) AS output
FROM customer;

SELECT title FROM film 
ORDER BY LENGTH(title) DESC
LIMIT 1;
 
