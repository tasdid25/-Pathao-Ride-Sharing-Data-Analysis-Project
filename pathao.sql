create database pathao;
use pathao;  

#1. Retrieve all successful bookings:
CREATE VIEW Successful_Bookings AS
SELECT *
FROM bookings
WHERE Booking_Status = 'Success';

#2. Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT
    Vehicle_Type,
    AVG(Ride_Distance) AS avg_distance
FROM
    bookings
GROUP BY
    Vehicle_Type;


#3. Get the total number of cancelled rides by customers:
CREATE VIEW rides_cancelled_by_customers AS
SELECT
    COUNT(*) AS total_cancelled_by_customers
FROM
    bookings
WHERE
    Booking_Status = 'Canceled by Customer';
    
#4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW top_5_customers_by_rides AS
SELECT
    Customer_ID,
    COUNT(Booking_ID) AS total_rides
FROM
    bookings
GROUP BY
    Customer_ID
ORDER BY
    total_rides DESC
LIMIT 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW rides_cancelled_by_driver_issues AS
SELECT
    COUNT(*) AS cancelled_by_driver_issues
FROM
    bookings
WHERE
    Canceled_Rides_by_Driver = 'Personal & Car related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW prime_sedan_driver_ratings AS
SELECT
    MAX(Driver_Ratings) AS max_rating,
    MIN(Driver_Ratings) AS min_rating
FROM
    bookings
WHERE
    Vehicle_Type = 'Prime Sedan';

#7. Retrieve all rides where payment was made using UPI:
CREATE VIEW mfs_bookings AS
SELECT
    *
FROM
    bookings
WHERE
    Payment_Method = 'MFS';

#8. Find the average customer rating per vehicle type:
CREATE VIEW avg_customer_rating_by_vehicle AS
SELECT
    Vehicle_Type,
    AVG(Customer_Rating) AS avg_customer_rating
FROM
    bookings
GROUP BY
    Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
CREATE VIEW total_successful_booking_value AS
SELECT
    SUM(Booking_Value) AS total_successful_value
FROM
    bookings
WHERE
    Booking_Status = 'Success';

#10. List all incomplete rides along with the reason:

CREATE VIEW incomplete_rides AS
SELECT
    Booking_ID,
    Incomplete_Rides_Reason
FROM
    bookings
WHERE
    Incomplete_Rides = 'Yes';
