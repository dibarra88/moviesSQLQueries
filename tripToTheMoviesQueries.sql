-- Select all columns and rows from the movies table
SELECT 
    *
FROM
    movies;
    
-- Select only the title and id of the first 10 rows
SELECT 
    title, movieid
FROM
    movies
LIMIT 10;

-- Find the movie with the id of 485
SELECT 
    *
FROM
    movies
WHERE
    movieid = 485;

-- Find the id (only that column) of the movie Made in America (1993)
SELECT 
    movieid
FROM
    movies
WHERE
    title = 'Made in America (1993)';

-- Find the first 10 sorted alphabetically
SELECT *
FROM movies
ORDER BY title ASC
LIMIT 10;

-- Find all movies from 2002
SELECT 
    *
FROM
    movies
WHERE
    title LIKE '%(2002)%';

-- Find out what year the Godfather came out
SELECT 
    SUBSTRING_INDEX(SUBSTRING_INDEX(title, '(', - 1), ')', 1) as 'Year'
FROM
    movies
WHERE
    title like  'Godfather, The%';
    
-- Without using joins find all the comedies
SELECT 
    *
FROM
    movies
WHERE
    genres LIKE '%comedy%';

-- Find all comedies in the year 2000
SELECT 
    *
FROM
    movies
WHERE
    genres LIKE '%comedy%' AND title LIKE '%(2000)%';

-- Find any movies that are about death and are a comedy
SELECT 
    *
FROM
    movies
WHERE
    title LIKE '%death%'
        AND genres LIKE '%comedy%' ;

-- Find any movies from either 2001 or 2002 with a title containing super
SELECT 
    *
FROM
    movies
WHERE
    title LIKE '%super%'
        AND (title LIKE '%2001%'
        OR title LIKE '%2002%');

-- Use concat and research about internet movie database to produce a valid url from the imdbid
SELECT 
    CONCAT('http://www.imdb.com/title/tt', imdbid) as 'url'
FROM
    links;
    
    
-- Use concat and research about the movie database to produce a valid url from tmdbid
SELECT 
    *,
    CONCAT('https://www.themoviedb.org/movie/',
            tmdbid) AS 'url'
FROM
    links;

-- Using SQL, normalize the tags in the tags table. Make them lowercased and replace the spaces with '-'s
SELECT 
    REPLACE(LOWER(tag), ' ', '-') as  'Tag'
FROM
    tags