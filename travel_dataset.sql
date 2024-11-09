
/*SQL Server*/

USE TravelDataset;

/*Exploring users table*/
SELECT *
FROM users;


/*Checking total number of users*/
SELECT COUNT(*) AS totalUser
FROM users;


/*Total number of users per company*/
SELECT company,
	COUNT(*) AS totalUser
FROM users
GROUP BY company
ORDER BY totalUser DESC;


/*Check distribution of users by gender*/
SELECT 
	gender,
	COUNT(*) AS totalUser
FROM users
GROUP BY gender 
ORDER BY totalUser DESC;


/*Calculate the minimum, average, and maximum age of users */
SELECT 
	MIN(age) AS minAge,
	AVG(age) AS avgAge,
	MAX(age) AS maxAge
FROM users;


/*Count users grouped by age range*/
SELECT 
	ageGroup,
	COUNT(*) AS totalUser
FROM (
	SELECT
		CASE
		WHEN age BETWEEN 20 AND 29 THEN '20s'
		WHEN age BETWEEN 30 AND 39 THEN '30s'
		WHEN age BETWEEN 40 AND 49 THEN '40s'
		WHEN age BETWEEN 50 AND 59 THEN '50s'
		WHEN age >= 60 THEN '60s and above'
	END AS ageGroup
	FROM users) AS ageGroup
GROUP BY ageGroup
ORDER BY ageGroup;


/*Exploring flights table*/
SELECT *
FROM flights;


/*Check whether each booked flight is a round-trip booking*/
SELECT 
	COUNT(travelCode) AS totalFlight,
	COUNT(DISTINCT travelCode) AS totalDistinctFlight
FROM flights;


/*Identify the agency with the highest number of flights*/
SELECT 
	agency,
	count(*) AS totalFlights
FROM flights
GROUP BY agency
ORDER BY totalFlights DESC;


/*total flights per User*/
SELECT 
	name,
	company,
	COUNT(*) AS totalFlights
FROM flights
	JOIN users
		ON flights.userCode = users.code
GROUP BY name, company
ORDER BY totalFlights DESC;


/*total flights per company*/
SELECT 
	company,
	COUNT(*) AS totalFlights
FROM flights
	JOIN users
		ON flights.userCode = users.code
GROUP BY company
ORDER BY totalFlights DESC;


/*Determine the flight type with the highest booking count*/
SELECT 
	flightType,
	COUNT(*) AS totalFlights
FROM flights
GROUP BY flightType
ORDER BY totalFlights DESC;



/*Exploring hotels table*/
SELECT *
FROM hotels;


/*List of hotels booked by users */
SELECT COUNT(DISTINCT name) AS hotelNames
FROM hotels;


/*Identify the most frequently booked hotels*/
SELECT
	name,
	COUNT(*) AS totalBooking
FROM hotels
GROUP BY name
ORDER BY totalBooking DESC;



/*Identify the most frequently booked hotels per Year*/
SELECT 
        year,
	name,
	totalBooking
FROM 
	(SELECT 
        	name,
       		COUNT(*) AS totalBooking,
        	YEAR(date) AS year,
        	ROW_NUMBER() OVER (PARTITION BY YEAR(date) ORDER BY COUNT(*) DESC) AS rank
    	FROM hotels
   	GROUP BY 
        	name, 
        	YEAR(date)
	) AS hotelRank
WHERE rank <= 3
ORDER BY 
    year DESC,
    rank;


/*Finding cheapest hotel*/
SELECT DISTINCT
	name,
    	price
FROM hotels
ORDER BY price;



/*Checking the year with the highest hotel bookings*/
SELECT
	YEAR(date) AS year,
   	COUNT(travelCode) AS totalBookings
FROM hotels
GROUP BY YEAR(date)
ORDER BY totalBookings DESC;


