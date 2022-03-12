/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch similar movies.
 * You've already watched all other movies with the same actors,
 * so now you need a new strategy for finding similar movies.
 * You decide that two movies X and Y are similar if they have been rented by the same customer,
 * and you further quantify this similarity by defining the "similarity score" to be the number of distinct customers that have rented both X and Y.
 *
 * Write a SQL SELECT query that:
 * computes the "similarity score" for all movies with 'AMERICAN CIRCUS'
 * and orders the results from highest to lowest.
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 *
 * NOTE:
 * You do not have to include movies with similarity score 0 in your results (but you may if you like).
 */

SELECT title, count(*) as "similarity score"
FROM (
   SELECT DISTINCT title, customer_id
   FROM rental
   JOIN inventory USING (inventory_id)
   JOIN film USING (film_id)
   WHERE customer_id IN (
      SELECT customer_id
      FROM rental
      JOIN inventory USING (inventory_id)
      JOIN film USING (film_id)
      WHERE title = 'AMERICAN CIRCUS'
   )
   AND title != 'AMERICAN CIRCUS'
   GROUP BY title, customer_id
) t
GROUP BY title
ORDER BY "similarity score" desc;
