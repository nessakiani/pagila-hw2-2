/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

select t1.title from (
    select title from (
        select title, unnest(special_features) as special_feature from film
    ) t
    where t.special_feature = 'Behind the Scenes'
) as t1 join ( select title from (
    select title, unnest(special_features) as special_feature from film
) t
where t.special_feature = 'Trailers'
)
as t2 on (t1.title = t2.title)
order by title;
