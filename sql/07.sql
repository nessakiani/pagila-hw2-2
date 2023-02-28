/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */

select distinct(title) from film f
join inventory i using(film_id)
where f.film_id not in (
    select film_id from inventory i
    join rental r on(i.inventory_id = r.inventory_id)
    join customer cu on(r.customer_id = cu.customer_id)
    join address a on(cu.address_id = a.address_id)
    join city ci on(a.city_id = ci.city_id)
    join country co on(ci.country_id = co.country_id)
    where country = "United States"
)
order by title;
