# Project_101: Corporate Travel Data Analysis

**Source:** Datasets from kaggle

**Context:** Argo Solutions - A leading technology company in Latin America, developing solutions to facilitate expense management and corporate travel using technology as an enabler of these processes. Using SQL, we explore user demographics, travel trends, and booking behaviors from 2019 to 2023 to uncover insights that could improve corporate travel management


**Description:** 
The dataset consists of three tables — Users, Hotels, and Flights — covering the years 2019 to 2023.
**Users:** 1,340 rows; 5 columns (code, company, name, gender, age)
**Hotels:** 40,552 rows; 8 columns (travelCode, userCode, name, place, days, price, total, date)
**Flights:** 271,888 rows; 10 columns (travelCode, userCode, travelFrom, travelTo, flightType, price, time, distance, agency, date)


**Key Findings:**

1.) **User Demographics:** Employees from 4You account for 33.81% of the total user base.
**Implication:** "4You" represents a significant portion of the user base, making it a key revenue source and an important client for retention efforts.
**Suggestion:** Develop customized reports, offer tailored features, or provide dedicated support to strengthen the partnership with "4You" and ensure continued business.

2.) **Booking Gaps:** Some flights have been booked without corresponding hotel bookings.
**Implication:** This may indicates that not all travel requires hotel stays, potentially reflecting a trend toward short business trips (day trips) or the use of other lodging arrangements.
**Suggestion:** Implement a feature that recommends hotel bookings during the flight booking process to increase hotel reservation rates and enhance user convenience.

3.) **Hotel Pricing:** Hotel BW offers the lowest daily rate ($60.39), while Hotel A has the highest ($313.02).
**Implication:** The variation in hotel rates indicates potential for significant cost savings depending on the choice of accommodation. Higher rates may not always be needed, depending on the travel purpose.
**Suggestion:** Companies could implement cost-control measures by setting limits on hotel expenditures. Argo Solutions could also negotiate special rates with frequently booked hotels to provide clients with better deals.

4.) **Flight Options:** CloudFy and Rainbow Agencies offer both "economic" and "premium" options. Flying Drops exclusively offers "first class" flights.
**Implication:** The variety in service tiers offered by agencies suggests that companies can cater to different employee travel needs, from budget-friendly to luxury options.
**Suggestion:** Argo Solutions can highlight agencies that offer multiple service tiers as versatile choices for clients. This can help companies align their travel bookings with employee preferences or corporate travel policies.

5.) **Yearly Trends:** Excluding 2023 due to incomplete data, 2020 saw the highest number of hotel bookings, while 2019 had the fewest.
**Implication:** This suggests fluctuations in corporate travel activity, possibly influenced by external factors.
**Suggestion:** Use historical booking data to forecast future travel demands and provide clients with budgeting strategies for peak travel periods. Argo Solutions can also use these insights to anticipate service demands.
