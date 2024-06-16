# Challenge

-- Display all available tables in the Sakila database.
SHOW TABLES FROM sakila;

-- Retrieve all the data from the tables actor, film and customer.
select * from sakila.actor, sakila.film, sakila.customer;

-- Retrieve the following columns from their respective tables:
-- 3.1 Titles of all films from the film table
-- 3.2 List of languages used in films, with the column aliased as language from the language table
-- 3.3 List of first names of all employees from the staff table
select title from film;
select name as language from sakila.language;
select first_name from sakila.staff;

-- Retrieve unique release years.
select distinct release_year from sakila.film;

-- Counting records for database insights:
-- 5.1 Determine the number of stores that the company has.
-- 5.2 Determine the number of employees that the company has.
-- 5.3 Determine how many films are available for rent and how many have been rented.
-- 5.4 Determine the number of distinct last names of the actors in the database.
select count(store_id) from sakila.store;
select count(staff_id) from sakila.staff;
select count(rental_id) from sakila.rental;
select count(return_date) from sakila.rental;
select count(distinct last_name) from sakila.actor;

-- Retrieve the 10 longest films.
select length
from sakila.film
group by length
order by length desc
limit 10;

-- Use filtering techniques in order to:
-- 7.1 Retrieve all actors with the first name "SCARLETT".
-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
-- Hint: use LIKE operator. More information here.
-- 7.3 Determine the number of films that include Behind the Scenes content

select actor_id, first_name, last_name, 
left(first_name, 'Scarlett')
from sakila.actor;

select *
from sakila.film
where title like '%armageddon%'
and length > 100;

select count(special_features) 
from sakila.film;