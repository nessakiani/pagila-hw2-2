/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

select first_name||$$ $$||last_name as "Actor Name" from actor
join film_actor using(actor_id)
join (
    select film.film_id, unnest(special_features) as special_feature from film) T using (film_id)
where special_feature = 'Behind the Scenes'
group by "Actor Name"
order by "Actor Name"

