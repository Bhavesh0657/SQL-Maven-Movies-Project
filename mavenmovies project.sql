use mavenmovies;

show tables;

-- Q1.Find the titles of movies except starting with a that have been rented more than 30 times, and sort them in desc order.

select title, (rental_duration*rental_rate) as rented
from film  
where title not like 'A%' and rental_duration * rental_rate > 30
order by title desc;

-- Q2. Find the total revenue generated by store1.
select s.store_id, sum(p.amount) as total_revenue from store s 
join staff sf 
on s.store_id = sf.store_id
join payment p
on sf.staff_id = p.staff_id
where s.store_id = 1
group by s.store_id;

-- Q3. Find the titles of movies in the 'horror' category and sort them based on the last character of the title

select f.title from film f
inner join film_category fc
on f.film_id = fc.film_id
inner join category c
on fc.category_id = c.category_id
where c.name = 'Horror'
order by right(title, 1) asc;

-- Q4 Retrieve the top 5 customers whose name starts with E and have made the highest number of rentals. Display their customer IDs and the total number of rentals they have made.

select c.customer_id, count(rental_id) as total_no_of_rentals from customer c
inner join rental r 
on c.customer_id = r.customer_id
where first_name like 'E%'
group by c.customer_id
order by count(rental_id) desc
limit 5;
 
-- Q5. Find the total number of films available in each category, and list the categories in descending order of film count.
 
 select c.name as category, count(f.film_id) as total_number_of_films
 from film f 
 inner join film_category fc
 on f.film_id = fc.film_id
 inner join category c
 on fc.category_id = c.category_id
 group by category
 order by count(film_id) desc


