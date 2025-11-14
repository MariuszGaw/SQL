use mavenmovies;
/* 
1. My partner and I want to come by each of the stores in person and meet the managers. 
Please send over the managers’ names at each store, with the full address 
of each property (street address, district, city, and country please).  
*/ 

SELECT * FROM staff;
SELECT * FROM address
;
SELECT 
	staff.first_name 	AS First_name
	,staff.last_name 	AS Last_name
    ,address.address	-- AS Street
    ,address.district	-- AS Disctrict
    ,city.city 			AS City
    ,country.country 	AS country
FROM staff
INNER JOIN address ON staff.address_id = address.address_id
INNER JOIN city	ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id

;
/*
2.	I would like to get a better understanding of all of the inventory that would come along with the business. 
Please pull together a list of each inventory item you have stocked, including the store_id number, 
the inventory_id, the name of the film, the film’s rating, its rental rate and replacement cost. 
*/

SELECT * FROM inventory;
SELECT* FROM film;

SELECT 	
	inventory.store_id 			AS Store_id
    ,inventory.inventory_id		AS inventory_id
	,film.title 				AS Title
    ,film.rating 				AS Rating
    ,film.rental_rate			AS Rental_rate
    ,film.replacement_cost		AS Replacemnt_cost
FROM inventory
LEFT JOIN film ON inventory.film_id = film.film_id

;

/* 
3.	From the same list of films you just pulled, please roll that data up and provide a summary level overview 
of your inventory. We would like to know how many inventory items you have with each rating at each store. 
*/
;
SELECT DISTINCT 
	inventory.store_id					AS Store_id
    ,film.rating 						AS Rating
	,COUNT(inventory.inventory_id)		AS Number_of_inventory
FROM inventory
LEFT JOIN film ON inventory.film_id = film.film_id
GROUP BY 1,2

;

/* 
4. Similarly, we want to understand how diversified the inventory is in terms of replacement cost. We want to 
see how big of a hit it would be if a certain category of film became unpopular at a certain store.
We would like to see the number of films, as well as the average replacement cost, and total replacement cost, 
sliced by store and film category. 
*/ 

;
SELECT distinct
	inventory.store_id							AS Store_id
    ,category.name								AS Category
    ,COUNT(inventory.inventory_id)				AS Number_of_films
    ,ROUND(AVG(film.replacement_cost),2)		AS "AVG(Replacement_cost)"
	,SUM(film.replacement_cost)					AS "SUM(Replacement_cost)"
FROM inventory
LEFT JOIN film ON inventory.film_id = film.film_id
LEFT JOIN film_category ON film.film_id = film_category.film_id
LEFT JOIN category ON film_category.category_id = category.category_id
GROUP BY 1,2
ORDER BY 1



;
/*
5.	We want to make sure you folks have a good handle on who your customers are. Please provide a list 
of all customer names, which store they go to, whether or not they are currently active, 
and their full addresses – street address, city, and country. 
*/
;

SELECT 
	store_id,
	first_name,
    last_name,
    CASE WHEN active = 1 THEN 'Active' WHEN active = 0 THEN 'Inactive' ELSE 'Error' END AS is_active,
    address,
    city,
    country
FROM customer
LEFT JOIN address ON address.address_id = customer.address_id
LEFT JOIN city ON address.city_id = city.city_id
LEFT JOIN country ON city.country_id = country.country_id
    
;
/*
6.	We would like to understand how much your customers are spending with you, and also to know 
who your most valuable customers are. Please pull together a list of customer names, their total 
lifetime rentals, and the sum of all payments you have collected from them. It would be great to 
see this ordered on total lifetime value, with the most valuable customers at the top of the list. 
*/

SELECT 
	customer.customer_id		AS ID
	,customer.first_name		AS First_name
    ,customer.last_name			AS Last_name
    ,COUNT(payment.rental_id)	AS Rentals
    ,SUM(amount)				As Amount
FROM customer
LEFT JOIN rental ON customer.customer_id = rental.customer_id
LEFT JOIN payment ON rental.rental_id = payment.rental_id

GROUP BY 1
ORDER BY 5 DESC

;
/*
7. My partner and I would like to get to know your board of advisors and any current investors.
Could you please provide a list of advisor and investor names in one table? 
Could you please note whether they are an investor or an advisor, and for the investors, 
it would be good to include which company they work with. 
*/

SELECT 
	'advisor'		AS Name
    ,first_name
    ,last_name
    ,null 			AS company_name
FROM advisor

UNION 

SELECT 
	'investor'
    ,first_name
    ,last_name
    ,company_name
FROM investor

;
/*
8. We're interested in how well you have covered the most-awarded actors. 
Of all the actors with three types of awards, for what % of them do we carry a film?
And how about for actors with two types of awards? Same questions. 
Finally, how about actors with just one award? 
*/
SELECT * FROM actor; -- actor_id
SELECT * FROM actor_award;
SELECT * FROM film_actor


SELECT actor_id, awards FROM actor_award 
WHERE awards LIKE "%Emmy%" AND awards LIKE "%Oscar%" AND awards LIKE "%Tony%" AND actor_id is not null
INNER 

;
SELECT * FROM film_actor;