-- 1. Count Movies vs TV Shows
SELECT type, COUNT(*) 
FROM netflix
GROUP BY type;

-- 2. Top 10 countries with most content
SELECT country, COUNT(*) 
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY COUNT(*) DESC
LIMIT 10;

-- 3. Most common ratings
SELECT rating, COUNT(*) 
FROM netflix
GROUP BY rating
ORDER BY COUNT(*) DESC;

--4. Yearly Content Trend
SELECT release_year, COUNT(*)
FROM netflix
GROUP BY release_year
ORDER BY release_year DESC;

--5. Longest Movie
SELECT *
FROM netflix
WHERE type = 'Movie'
ORDER BY SPLIT_PART(duration, ' ', 1)::INT DESC
LIMIT 1;

--6. Movies Longer Than 120 Minutes
SELECT title, duration
FROM netflix
WHERE type = 'Movie'
AND SPLIT_PART(duration, ' ', 1)::INT > 120;

-- 7. Titles Added Each Year
SELECT 
    SPLIT_PART(date_added, ',', 2)::INT AS year_added,
    COUNT(*)
FROM netflix
WHERE date_added IS NOT NULL
GROUP BY year_added
ORDER BY year_added;

-- 8. Duplicated Titles
SELECT title, COUNT(*)
FROM netflix
GROUP BY title
HAVING COUNT(*) > 1;

--9. Indian Movies
SELECT *
FROM netflix
WHERE country ILIKE '%India%'
AND type = 'Movie';

-- 10. Documentaries
SELECT *
FROM netflix
WHERE listed_in ILIKE '%Documentaries%';

--11. TV Shows with only 1 Season
SELECT title, duration
FROM netflix
WHERE type = 'TV Show'
AND duration ILIKE '1 Season';

--12. Content directed by a specific director

SELECT title, director, type
FROM netflix
WHERE director ILIKE '%Steven Spielberg%';

--13. Most frequent cast members

--(This shows actors/actresses appearing most)

SELECT cast_members, COUNT(*) AS appearances
FROM netflix
WHERE cast_members IS NOT NULL
GROUP BY cast_members
ORDER BY appearances DESC
LIMIT 15;

--14. Movies released between 2010 and 2020
SELECT title, release_year
FROM netflix
WHERE release_year BETWEEN 2010 AND 2020
AND type = 'Movie';

--15. Top genres by number of titles
SELECT listed_in AS genre, COUNT(*) AS total
FROM netflix
GROUP BY listed_in
ORDER BY total DESC
LIMIT 10;
