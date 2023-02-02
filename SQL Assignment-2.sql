use mavenmovies;
# 1. Write a SQL query to find the actors who were cast in the movie 'Annie Hall'. Return actor first name, last name and role.

Select * from movie_cast;
Select * from actors;
Select * from movie;
Select act_fname, act_lname, role
from actors
join movie_cast
on actors.act_id= movie_cast.act_id
join movie
on movie.mov_id = movie_cast.mov_id
where mov_title like("Annie Hall");

# 2. From the following tables, write a SQL query to find the director who directed a movie that casted a role for 'Eyes Wide Shut'. 
#Return director first name, last name and movie title.

Select * from movie_direction;
Select dir_fname, dir_lname, mov_title
from director
join movie_direction
on director.dir_id= movie_direction.dir_id
join movie
on movie_direction.mov_id = movie.mov_id
where mov_title like("Eyes Wide Shut");

# 3. Write a SQL query to find who directed a movie that casted a role as ‘Sean Maguire’. Return director first name, last name and movie title.

Select * from movie_cast;
Select dir_fname, dir_lname, mov_title
from director
join movie_direction
on director.dir_id= movie_direction.dir_id
join movie_cast
on movie_direction.mov_id = movie_cast.mov_id
join movie
on movie_cast.mov_id= movie.mov_id
where role like("Sean Maguire");

# 4.Write a SQL query to find the actors who have not acted in any movie between1990 and 2000 (Begin and end values are included.). 
# Return actor first name, last name, movie title and release year. 

Select * from actors;
Select act_fname, act_lname, mov_title, mov_year
from actors
join movie_cast
on actors.act_id = movie_cast.act_id
join movie
on movie_cast.mov_id = movie.mov_id
and mov_year not between 1990 and 2000;

# 5. Write a SQL query to find the directors with number of genres movies. 
# Group the result set on director first name, last name and generic title. Sort the result-set in ascending order by director first name and last name. 
# Return director first name, last name and number of genres movies.

Select dir_fname, dir_lname, gen_title, count(gen_title)
from director
natural join movie_direction
natural join movie_genres
natural join genres
group by dir_fname, dir_lname, gen_title
order by dir_fname, dir_lname ASC;

# 6. Write a SQL query to find the movies with year and genres. Return movie title, movie year and generic title.

Select mov_title, mov_year, gen_title
from movie
natural join movie_genres
natural join genres;

# 7. Write a SQL query to find all the movies with year, genres, and name of the director. 

Select mov_title,mov_year,gen_title,dir_fname, dir_lname
from movie
natural join movie_genres
natural join genres
natural join director
natural join movie_direction;

# 8. Write a SQL query to find the movies released before 1st January 1989. Sort the result-set in descending order by date of release. 
# Return movie title, release year, date of release, duration, and first and last name of the director. 

Select mov_title, mov_year, mov_dt_rel, mov_time, dir_fname, dir_lname
from movie
join movie_direction
on movie.mov_id= movie_direction.mov_id
join director
on movie_direction.dir_id=director.dir_id
where  mov_dt_rel < '1989-01-01' and mov_dt_rel > '0000-00-00'
# when I see the output there were three movies whose date of release was 0000-00-00 but mov_year was more than 1989 so, I put another condition to discard those values from my output.
order by mov_dt_rel desc;