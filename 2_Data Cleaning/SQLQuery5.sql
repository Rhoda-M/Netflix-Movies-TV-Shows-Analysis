SELECT * 
FROM dbo.netflix_titles;

-- -- Missing Values 
SELECT * 
FROM dbo.netflix_titles
WHERE director IS NULL;

SELECT * 
FROM dbo.netflix_titles
WHERE cast IS NULL;

SELECT * 
FROM dbo.netflix_titles
WHERE country IS NULL;

SELECT * 
FROM dbo.netflix_titles
WHERE date_added IS NULL;

SELECT * 
FROM dbo.netflix_titles
WHERE rating IS NULL;

SELECT * 
FROM dbo.netflix_titles
WHERE duration IS NULL;

-- -- Standardization 
SELECT * 
FROM dbo.netflix_titles;

ALTER TABLE dbo.netflix_titles
ADD date_added_clean DATE;

UPDATE dbo.netflix_titles
SET date_added_clean =
TRY_CONVERT(DATE, date_added);

ALTER TABLE dbo.netflix_titles
DROP COLUMN date_added;

-- -- Check for blank cells 
SELECT *
FROM dbo.netflix_titles
WHERE title LIKE ''
   OR director LIKE ''
   OR country LIKE '';

SELECT duration 
FROM dbo.netflix_titles 
WHERE duration LIKE '%min' 
OR duration LIKE '%Season';







