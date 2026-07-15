SELECT * 
FROM dbo.netflix_titles;

-- --Data Validation - Invalid entries
SELECT title, duration, rating 
FROM dbo.netflix_titles 
WHERE rating LIKE '%min' 
OR rating LIKE '%Season%';

UPDATE dbo.netflix_titles
SET
    duration = rating,
    rating = NULL
WHERE rating LIKE '%min'
   OR rating LIKE '%Season%';

SELECT title, duration, rating
FROM dbo.netflix_titles
WHERE title LIKE 'Louis C.K.%';

SELECT * 
FROM dbo.netflix_titles;

SELECT MIN(release_year) AS MinYear,
       MAX(release_year)AS MaxYear
FROM dbo.netflix_titles;

-- -- Summary Statistics 
SELECT
    MIN(release_year) AS Min_Year,
    MAX(release_year) AS Max_Year,
    AVG(CAST(release_year AS FLOAT)) AS Mean_Year,
    STDEV(release_year) AS Std_Dev_Year
FROM dbo.netflix_titles;

SELECT DISTINCT
PERCENTILE_CONT(0.5)
WITHIN GROUP (ORDER BY release_year)
OVER () AS Median_Release_Year
FROM dbo.netflix_titles;

-- -- Count
SELECT
    type,
    COUNT(*) AS Total
FROM dbo.netflix_titles
GROUP BY type;

SELECT
    rating,
    COUNT(*) AS Total
FROM dbo.netflix_titles
GROUP BY rating
ORDER BY Total DESC;

SELECT TOP 10
    listed_in,
    COUNT(*) AS Total
FROM dbo.netflix_titles
GROUP BY listed_in
ORDER BY Total DESC;

SELECT * 
FROM dbo.netflix_titles;



