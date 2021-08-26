SHOW databases;
USE sakila;
SHOW tables;

-- 1 
SELECT first_name, last_name 
FROM actor;

-- 2 
SELECT first_name, last_name 
FROM actor 
WHERE first_name LIKE 'John';

-- 3 
SELECT first_name, last_name 
FROM actor 
WHERE last_name LIKE 'Neeson';

-- 4
SELECT actor_id, first_name, last_name 
FROM actor 
WHERE ( actor_id % 10 ) = 0;

-- 5
SELECT film_id, title, description
FROM film
WHERE film_id LIKE 100;

-- 6 
SELECT title, rating
FROM film
WHERE rating LIKE 'R';

-- 7 
SELECT title, rating
FROM film
WHERE rating NOT LIKE 'R';

-- 8
SELECT title, length 
FROM film
ORDER BY length ASC
LIMIT 10
;

-- 9
SELECT title, length
FROM film
WHERE length =(
SELECT MAX(length)
FROM film
);

-- 10
SELECT title, special_features
FROM film
WHERE special_features LIKE '%Deleted Scenes%';

-- 11
SELECT last_name, count(last_name) AS frequency
FROM actor 
GROUP BY last_name
HAVING (count(last_name) = 1)
ORDER BY last_name DESC
;

-- 12
SELECT last_name, count(last_name) AS frequency
FROM actor
GROUP BY last_name
HAVING (count(last_name) > 1)
ORDER BY frequency DESC
;

-- 13
SELECT a.first_name, a.last_name, a.actor_id, count(fa.film_id) AS frequency 
FROM actor a
JOIN film_actor fa
ON a.actor_id=fa.actor_id
GROUP BY fa.film_id
ORDER BY frequency DESC LIMIT 1
;

-- 14
SELECT i.inventory_id, r.rental_id, f.film_id, f.title, max(r.return_date) AS "Latest return date"
FROM film f
JOIN inventory i
ON i.film_id = f.film_id
JOIN rental r
ON r.inventory_id = i.inventory_id
WHERE f.title = 'Academy Dinosaur'
GROUP BY i.inventory_id;

-- 15
SELECT SUM(length)/COUNT(length) AS average
FROM film
;

-- 16
SELECT fc.category_id, c.name, fc.film_id, AVG(f.length) as average_length
FROM film_category fc
JOIN category c
ON fc.category_id=c.category_id
JOIN film f
ON f.film_id=fc.film_id 
GROUP BY name
;

-- 17
SELECT * 
FROM film
WHERE description 
LIKE '%robot%';

-- 18
SELECT *
FROM film
WHERE release_year LIKE 2010
;

-- 19
SELECT title
FROM film
WHERE description LIKE "%horror%";

-- 20
SELECT first_name, last_name 
FROM staff
WHERE staff_id = 2;

-- 21
SELECT title, actors 
FROM film_list
WHERE actors LIKE '%Fred Costner%';

-- 22
SELECT count(DISTINCT country) FROM country; 

-- 23
SELECT name
FROM language
ORDER BY name DESC;

-- 24
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE '%son'
ORDER BY first_name
;

-- 25
SELECT fc.category_id, c.name, count(fc.film_id) AS frequency
FROM film_category fc
JOIN category c
ON fc.category_id=c.category_id
GROUP BY name
ORDER BY frequency DESC LIMIT 1;


