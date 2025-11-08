SELECT
	inventory_id
    ,store_id
    ,film.title
    ,film.description
FROM inventory
	INNER JOIN film ON inventory.film_id = film.film_id
;

SELECT 
	film.film_id
	,film.title
    ,COUNT(film_actor.actor_id)
FROM film
    LEFT JOIN film_actor on film_actor.film_id = film.film_id
    Group by 1
    LIMIT 5000
;

SELECT 
	actor.first_name
    ,actor.last_name
    ,film.title
FROM film
	INNER JOIN film_actor ON film.film_id = film_actor.film_id
    INNER JOIN actor ON film_actor.actor_id = actor.actor_id
;

SELECT 
	DISTINCT(film.title)			AS title
    ,film.description				AS description
FROM film
INNER JOIN inventory ON film.film_id = inventory.film_id
	AND store_id = 2
;

SELECT 
	"advisor" AS type
    ,first_name
    ,last_name
 FROM advisor

UNION

SELECT 
	"staff" AS type
    ,first_name
    ,last_name
FROM staff
;