**Corporate Travel Data Analysis**

**Source:** Datasets from kaggle

**Context:** Argo Solutions - A leading technology company in Latin America, developing solutions to facilitate expense management and corporate travel using technology as an enabler of these processes. Using SQL, we explore user demographics, travel trends, and booking behaviors from 2019 to 2023 to uncover insights that could help Argo Solutions enhance its services and optimize corporate travel solutions.

**Description:** 
The dataset consists of three tables — Users, Hotels, and Flights — covering the years 2019 to 2023.

**Users:** 1,340 rows; 5 columns (code, company, name, gender, age)

**Hotels:** 40,552 rows; 8 columns (travelCode, userCode, name, place, days, price, total, date)

**Flights:** 271,888 rows; 10 columns (travelCode, userCode, from, to, flightType, price, time, distance, agency, date)



**Key Findings:**

**User Table Findings:**  User Table has the following columns - code, company, name, gender, age.

1. **Finding:** There are 1,340 users of the app.
   
**Implication:** The user base is relatively small, indicating either a highly targeted audience or potential room for growth.

**Consideration:** Argo Solutions could explore opportunities to expand its user base, possibly through partnerships, promotions, or targeted outreach.


2. **Finding:** The company 4You has the most users with 453 accounts. It  accounted for 33.81% of the total user base.

**Implication:** 4You is the platform's most significant client, representing a substantial portion of the user base.

**Consideration:** Argo Solutions could consider developing tailored features or providing exclusive insights for 4You to enhance engagement and retain this client.


3. **Finding:** Most users are in their 30s and 40s.
   
**Implication:** The platform is primarily used by mid-career professionals, likely in managerial or senior roles.

**Consideration:** Argo could explore features that cater to this demographic, such as simplifying travel planning for professionals with tools to manage frequent travel schedules or providing personalized travel recommendations aligned with company policies.



**Flights Table Findings:** Flights table consists of the following columns -  travelCode, userCode, from, to, flightType, price, time, distance, agency date

1. **Finding:** All of the booked flights are round-trip bookings.
   
**Implication:** Since all flights are round-trip, it suggests that users are likely booking business trips with fixed schedules. This could imply a preference for efficiency and cost-effective travel arrangements.

**Consideration:** Argo could consider offering pre-packaged round-trip travel options that include both flights and hotels, potentially streamlining the booking process for users and making it more convenient for companies managing travel.


2. **Finding:** Most users opted for first class, followed by premium and economy.

**Implication:** Users’ tendency to book higher-class flights, like first-class and premium, suggests an opportunity for Argo to better understand user preferences for comfort during business travel.

**Consideration:** Argo could improve its flight booking options by providing customized travel choices based on employee roles, travel purpose, or corporate budget, making it easier for companies to manage both comfort and cost.



**Hotels Table Findings:**  Hotels table consists of the following columns -  travelCode, userCode, name, place, days, price, total, date

1. **Finding:** There are nine (9) distinct hotels users chose.

**Implication:** A limited number of hotels are consistently booked, potentially indicating user loyalty or limited choices on the platform.

**Consideration:** Argo could explore expanding the selection of hotels available on its platform, offering users more choices.


2. **Finding:** Hotel K was the most preferred hotel to book.

**Implication:** Hotel K is generally favored by users, suggesting it may be a popular and trusted option for most business trips.

**Consideration:** Argo could ensure that Hotel K remains easily accessible and visible in its platform’s recommendations, making it a preferred choice for users. They could also explore providing additional features, like preferred booking options for users who frequently choose Hotel K.


3. **Finding:** Hotel BW was the cheapest hotel.

**Implication:** Hotel BW offers a cost-effective option for budget-conscious travelers.

**Consideration:** Argo could enhance the platform by allowing companies to easily identify cost-effective options like Hotel BW based on their travel preferences and budget. This feature could help companies make informed decisions when managing their travel expenses.
