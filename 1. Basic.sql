use mavenmovies;

SELECT 
	first_name
    ,last_name
    ,email
 FROM customer;
 
 
 SELECT DISTINCT rating FROM film;
 
 SELECT DISTINCT rental_duration FROM film;
 
 SELECT 
	customer_id
    ,rental_id
    ,amount
    ,payment_date
FROM payment WHERE customer_id < 101;

SELECT 
	customer_id
    ,rental_id
    ,amount
    ,payment_date
FROM payment 
WHERE amount = 0.99
	AND payment_date > "2006-01-01";
    
SELECT 
	customer_id
    ,rental_id
    ,amount
    ,payment_date
FROM payment 
WHERE amount > 5
	AND payment_date > "2006-01-01"
    AND customer_id < 101;
    
SELECT 
	customer_id
    ,rental_id
    ,amount
    ,payment_date
FROM payment 
WHERE customer_id = 5
	OR customer_id = 11
    OR customer_id = 29;
    
SELECT 
	customer_id
    ,rental_id
    ,amount
    ,payment_date
FROM payment 
WHERE amount > 5
	AND customer_id = 42
    OR customer_id = 53
    OR customer_id = 60
    OR customer_id = 75;
    
    
SELECT 
	customer_id
    ,rental_id
    ,amount
    ,payment_date
FROM payment 
WHERE amount > 5
	OR customer_id IN (42,53,60,75);
    
SELECT
	title
    ,special_features
FROM film 
WHERE special_features LIKE "%Behind the Scenes%";

SELECT 
	rating
    ,count(film_id)
FROM film
GROUP BY rating;

SELECT 
	rental_duration
	,count(film_id) AS films_with_this_rental_duration
FROM film
GROUP by rental_duration;

SELECT 
	rental_duration
    ,rating
    ,replacement_cost
	,count(film_id) AS films_with_this_rental_duration
FROM film
GROUP by 
	rental_duration
	,rating
    ,replacement_cost;
    
SELECT
	rating
    ,COUNT(film_id) AS count_of_films
    ,MIN(length) AS shortest_film
    ,MAX(length) AS longest_film
    ,AVG(length) AS average_length_of_duration
    ,AVG(rental_duration) AS average_rental_duration
FROM film
GROUP BY 1;

SELECT 
	replacement_cost
	,COUNT(film_id) 	AS number_of_films
    ,MIN(rental_rate) 	AS cheapest_rental
    ,MAX(rental_rate)	AS most_expensive_rental
    ,AVG(rental_rate)	AS average_rental
FROM film
GROUP BY 1
ORDER BY 1 DESC;

SELECT
	customer_id	
	,count(payment_id) AS total_rentals
FROM payment
group by 1
HAVING total_rentals < 15;

SELECT 
	title
    ,length
    ,rental_rate
 FROM film
 ORDER BY length DESC;
 
 SELECT
	first_name
	,last_name,
    CASE 
		WHEN store_id = 1 AND active = 0 THEN "store 1 inactive"
        WHEN store_id = 1 AND active = 1 THEN "store 1 active"
        WHEN store_id = 2 AND active = 0 THEN "store 2 inactive"
        WHEN store_id = 2 AND active = 1 THEN "store 2 active"
        ELSE "Błąd"
	END AS "store_and_status"
 FROM customer;
 
 SELECT 
	store_id
    ,COUNT(CASE WHEN active = 1 THEN store_id else null END) AS active
	,COUNT(CASE WHEN active = 0 THEN store_id else null END) AS inactive
 FROM customer
 GROUP BY 1

 


