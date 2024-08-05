SELECT 
	first_name,
	last_name,
	followers
FROM 
	users
WHERE	
	-- followers >= 4600 AND followers <= 4700
	followers BETWEEN  4600 AND 4700
ORDER BY 
	followers ASC;


	
SELECT 
	COUNT(*) AS total_users,
	MIN(followers) AS min_followers,
	MAX(followers) AS max_followers,
	ROUND(AVG(followers)) AS avg_followers,
	SUM(followers) / count(*) AS avg_manual 
FROM 
	users;
	
	
SELECT 
	first_name,
	last_name,
	followers
FROM 
	users
WHERE followers = 4 OR followers = 4999;

SELECT 
	COUNT(*) as contador, followers
FROM 
	users
WHERE 
	followers BETWEEN 4500 AND 4999
GROUP BY 
	followers
ORDER BY
	contador DESC;
	
	
SELECT
	count(*),
	country
FROM
	users
GROUP BY
	country
HAVING
	count(*) > 7
ORDER BY 
	count(*) DESC;
	

SELECT DISTINCT country from users;
SELECT
    count(*),
    SUBSTRING(email, POSITION('@' in email) + 1) as domain
FROM
    users
GROUP BY
    domain
HAVING
    count(*) > 3;

