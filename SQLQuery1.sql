USE CorporateTravelData;

SELECT @@SERVERNAME;


/*USERS TABLE*/

/*There are 1,340 users of the app.*/

SELECT * FROM users;

GO
CREATE VIEW vw_TotalUsers AS
SELECT COUNT(*) AS TotalUser
FROM users
GO

/*Check vw_TotalUsers table*/

SELECT * FROM vw_TotalUsers;


/*The company 4You has the most users with 453 accounts. It accounted for 33.81% of the total user base.*/
GO 
CREATE VIEW vw_CompanyUsers AS 
SELECT company, COUNT(*) AS TotalUser,
ROUND(COUNT(*) * 100.0/SUM(COUNT(*)) OVER(), 2) AS Percentage
FROM users
GROUP BY company
GO

/*Check vw_CompanyUsers table*/

SELECT * FROM vw_CompanyUsers;

/*Check distribution of users by gender*/
GO
CREATE VIEW vw_gender AS
SELECT gender, COUNT(*) AS totalCount
FROM users
GROUP BY gender
GO

/*Count users grouped by age range*/
GO
CREATE VIEW vw_age_min_avg_max AS
SELECT MIN(age) AS minAge,
AVG(age) AS avgAge, 
MAX(age) AS maxAge
FROM users
GO


GO 
CREATE VIEW vw_age_group_distribution AS
WITH age_groups AS(
SELECT
	CASE
		WHEN age <20 THEN 'Under 20'
		WHEN age BETWEEN 20 AND 29 THEN '20-29'
		WHEN age BETWEEN 30 AND 39 THEN '30-39'
		WHEN age BETWEEN 40 AND 49 THEN '40-49'
		WHEN age BETWEEN 50 AND 59 THEN '50-59'
		WHEN age >= 60 THEN 'Over 60'
	END AS ageGroup
	FROM users
	)
SELECT ageGroup, COUNT(*) AS userCount
FROM age_groups
GROUP BY ageGroup
GO

/*Check vw_CompanyUsers table*/

SELECT * FROM vw_age_group_distribution;




/*FLIGHTS TABLE*/

/*Exploring flights table*/
SELECT *
FROM flights;


/*Check whether each booked flight is a round-trip booking*/
SELECT 
	COUNT(travelCode) AS totalFlight,
	COUNT (DISTINCT travelCode) AS totalDistinctFlight
FROM flights;


/*Identify the agency with the highest number of flights*/

GO
CREATE VIEW vw_total_flight_per_agency AS
SELECT 
	agency, 
	COUNT(*) AS totalFlight
FROM flights
GROUP BY agency
GO


/*total flights per User*/

SELECT * FROM flights;

SELECT * FROM users;

WITH total_flights AS
(
SELECT 
	u.name, 
	u.company,
	COUNT(*) AS totalFlight
FROM users u
	JOIN flights f
	ON u.Code = f.userCode
GROUP BY u.name, u.company)
SELECT COUNT(*) 
	FROM total_flights;


/*total flights per company*/
SELECT * FROM users;

SELECT * FROM flights;

GO
CREATE VIEW vw_company_flights AS
SELECT u.company, COUNT(*) AS totalFlight
	FROM users u
	JOIN flights f
		ON u.Code = f.userCode
GROUP BY u.company
GO


/*Determine the flight type with the highest booking count*/

SELECT * FROM flights;

GO
CREATE VIEW vw_flight_type AS
SELECT flightType, COUNT(*) AS totalFlight
FROM flights
	GROUP BY flightType
GO


/*Exploring hotels table*/
SELECT *
FROM hotels;


/*List of hotels booked by users */
SELECT DISTINCT(name)
	FROM hotels;

/*Identify the most frequently booked hotels*/

GO
CREATE VIEW vw_hotel_booking AS
SELECT name, COUNT(*) AS totalBooking
	FROM hotels
	GROUP BY name
GO


/*Checking annual hotel bookings*/
GO
CREATE VIEW vw_yearly_booking AS
SELECT
	YEAR(date) AS year,
	COUNT(*) AS totalBooking
FROM hotels
GROUP BY YEAR(date)
GO


/*Finding cheapest hotel*/
GO
CREATE VIEW vw_hotel_price AS
SELECT DISTINCT
	name,
    price
FROM hotels
GO
