USE travel;

/* Create table hotels, can't use data table import due to file size*/
/* Create table structure*/

CREATE TABLE hotels
(
travelCode INT,
userCode INT,
name VARCHAR(200),
place VARCHAR(200),
days INT,
price DOUBLE,
total DOUBLE,
date DATE);

SELECT *
FROM hotels;

/*Load data*/

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/hotels.csv' INTO TABLE hotels
FIELDS TERMINATED BY ','
IGNORE 1 LINES;


/* Create table flights, can't use data table import due to file size*/
/* Create table structure*/

CREATE TABLE flights
(
travelCode INT,
userCode INT,
travelFrom VARCHAR(200),
travelTo VARCHAR(200),
flightType VARCHAR(200),
price DOUBLE,
time DOUBLE,
distance DOUBLE,
agency VARCHAR(200),
date DATE);

SELECT *
FROM flights;

/*Load data*/

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/flights.csv' INTO TABLE flights
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

/*Explore users table*/

SELECT company, COUNT(company) AS totalUsers
FROM users
GROUP BY company
ORDER BY totalUsers DESC;


/*Explore hotels table*/

SELECT COUNT(DISTINCT travelCode)
 FROM travel.hotels;


/*Explore flights table*/

SELECT COUNT(DISTINCT travelCode)
 FROM travel.flights;


/*totalFlights per User*/

SELECT 
	users.name,
	users.company,
	COUNT(userCode) AS totalFlights
FROM flights
	JOIN users
		ON flights.userCode = users.code
GROUP BY users.name, users.company
ORDER BY totalFlights DESC;


/*total flights per Company*/
SELECT 
	users.company,
	COUNT(userCode) AS totalFlights
FROM flights
	JOIN users
		ON flights.userCode = users.code
GROUP BY users.company
ORDER BY totalFlights DESC;



/*Joins*/

SELECT users.name, 
		users.company,
		hotels.name,
        hotels.days,
        hotels.price,
        hotels.total,
        hotels.date
FROM travel.hotels
    JOIN travel.users
		ON hotels.userCode = users.code;
        
        
/*Check total hotel expenses per company*/

SELECT users.company,
        CONCAT('$', FORMAT(SUM(hotels.total), 2)) AS totalExpenses
FROM travel.hotels
    JOIN travel.users
		ON hotels.userCode = users.code
GROUP BY users.company
ORDER BY SUM(hotels.total) DESC;


/*Check total hotel expenses per company and per user*/

SELECT users.name,
		users.company,
        CONCAT('$',FORMAT(SUM(hotels.total),2)) AS totalExpenses
FROM travel.hotels
    JOIN travel.users
		ON hotels.userCode = users.code
GROUP BY users.company, users.name
HAVING company = 'Wonka Company'
ORDER BY SUM(hotels.total) DESC;




/*Check total Expenses (hotel+flight) per User*/

SELECT 
	users.name,
	users.company,
	CONCAT('$',FORMAT(SUM(hotels.total),2)) AS hotelExpenses,
	CONCAT('$',FORMAT(SUM(flights.price),2)) AS transpoExpenses,
    CONCAT('$',FORMAT(SUM(hotels.total) + SUM(flights.price),2)) AS travelExpenses
FROM travel.users
	JOIN travel.hotels
		ON users.code = hotels.userCode
	JOIN travel.flights
		ON hotels.travelCode=flights.travelCode
GROUP BY users.company, users.name
ORDER BY SUM(hotels.total) + SUM(flights.price) DESC;


/*Check total Expenses (hotel+flight) per Company*/

SELECT 
	users.company,
	CONCAT('$',FORMAT(SUM(hotels.total),2)) AS hotelExpenses,
	CONCAT('$',FORMAT(SUM(flights.price),2)) AS transpoExpenses,
    CONCAT('$',FORMAT(SUM(hotels.total) + SUM(flights.price),2)) AS travelExpenses
FROM travel.users
	JOIN travel.hotels
		ON users.code = hotels.userCode
	JOIN travel.flights
		ON hotels.travelCode=flights.travelCode
GROUP BY users.company
ORDER BY SUM(hotels.total) + SUM(flights.price) DESC;


/*Check total Expenses (hotel+flight) per Year, per Company*/

SELECT 
	users.company,
    YEAR(hotels.date) AS year,
	CONCAT('$',FORMAT(SUM(hotels.total),2)) AS hotelExpenses,
	CONCAT('$',FORMAT(SUM(flights.price),2)) AS transpoExpenses,
    CONCAT('$',FORMAT(SUM(hotels.total) + SUM(flights.price),2)) AS travelExpenses
FROM travel.users
	JOIN travel.hotels
		ON users.code = hotels.userCode
	JOIN travel.flights
		ON hotels.travelCode=flights.travelCode
GROUP BY year, users.company
ORDER BY year, SUM(hotels.total) + SUM(flights.price) DESC;


/*Finding cheapest hotel*/
SELECT DISTINCT
	name,
    price
FROM travel.hotels
ORDER BY price;


/*Finding the cheapest travel fare*/

SELECT
	agency,
	flightType,
    distance,
    price
FROM travel.flights
GROUP BY distance, flightType, agency, price
HAVING flightType = 'firstClass'
ORDER BY distance, price;



/*Checking the year with the highest hotel bookings*/

SELECT
	YEAR(hotels.date) AS year,
    COUNT(travelCode) AS totalBookings
FROM travel.hotels
GROUP BY year
ORDER BY totalBookings DESC;



