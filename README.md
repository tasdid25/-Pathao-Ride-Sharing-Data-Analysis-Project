# 🛵 Pathao Ride-Sharing Data Analysis Project

![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Excel](https://img.shields.io/badge/Microsoft%20Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)

---

## 📌 Project Overview

This end-to-end data analysis project explores **Pathao**, one of Bangladesh's leading ride-sharing platforms, operating primarily in **Dhaka**. The project simulates a real-world analyst workflow — from raw data ingestion and SQL-based querying to interactive Power BI dashboards — offering actionable business insights into ride bookings, cancellations, revenue, and customer-driver satisfaction.

The dataset contains **100,000 booking records** spanning one month of ride activity, covering vehicle types, pickup/drop locations, booking statuses, payment methods, and rating data.

---

## 🎯 Business Objectives

- Understand **ride volume trends** over time and identify peak demand periods
- Analyze **booking status distribution** (successful, cancelled by customer, cancelled by driver, incomplete)
- Identify **top-performing vehicle types** by ride distance and revenue
- Investigate **cancellation patterns** and their root causes
- Evaluate **driver and customer satisfaction** through rating analysis
- Measure **revenue performance** across different payment methods and customer segments

---

## 🗂️ Dataset Description

The dataset was generated to reflect realistic Pathao ride-sharing patterns in Dhaka city.

| Column | Description |
|---|---|
| `Date` | Date of the booking |
| `Time` | Time of the booking |
| `Booking_ID` | Unique 10-digit booking identifier (format: `CNR` + digits) |
| `Booking_Status` | Success / Cancelled by Customer / Cancelled by Driver / Incomplete |
| `Customer_ID` | Unique customer identifier |
| `Vehicle_Type` | Bike, eBike, Auto, Mini, Prime Sedan, Prime Plus, Prime SUV |
| `Pickup_Location` | Pickup area within Dhaka |
| `Drop_Location` | Drop-off area within Dhaka |
| `V_TAT` | Avg. Vehicle Turnaround Time (time to reach pickup point) |
| `C_TAT` | Avg. Customer Turnaround Time (time to reach customer) |
| `Cancelled_Rides_by_Customer` | Reason for customer cancellation |
| `Cancelled_Rides_by_Driver` | Reason for driver cancellation |
| `Incomplete_Rides` | Yes / No |
| `Incomplete_Rides_Reason` | Reason for incomplete ride |
| `Booking_Value` | Fare charged (BDT) |
| `Payment_Method` | Cash / Mobile Banking / Card |
| `Ride_Distance` | Distance covered (km) |
| `Driver_Ratings` | Rating given to driver (1–5) |
| `Customer_Rating` | Rating given to customer (1–5) |

### 📊 Dataset Statistics

- **Total Records:** 100,000 bookings
- **Successful Bookings:** ~62%
- **Customer Cancellations:** < 7%
- **Driver Cancellations:** < 18%
- **Incomplete Rides:** < 6%
- **Booking Value:** ~70% under ৳500 | ~28% between ৳500–৳1000 | ~2% above ৳1000

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **Microsoft Excel** | Data storage, initial exploration, and cleaning |
| **MySQL** | Data querying, view creation, and business logic validation |
| **Power BI Desktop** | Interactive dashboards and visual storytelling |

---

## 🗃️ SQL Analysis

### Database Setup
```sql
CREATE DATABASE Pathao;
USE Pathao;
```

### Key Queries Performed

1. **Retrieve all successful bookings**
```sql
CREATE VIEW Successful_Bookings AS
SELECT * FROM bookings
WHERE Booking_Status = 'Success';
```

2. **Average ride distance by vehicle type**
```sql
CREATE VIEW Ride_Distance_Per_Vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance
FROM bookings
GROUP BY Vehicle_Type;
```

3. **Total cancellations by customers**
```sql
CREATE VIEW Cancelled_By_Customer AS
SELECT COUNT(*) AS total_cancelled
FROM bookings
WHERE Booking_Status = 'Cancelled by Customer';
```

4. **Top 5 customers by total rides**
```sql
CREATE VIEW Top_5_Customers AS
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;
```

5. **Driver cancellations due to personal/car issues**
```sql
CREATE VIEW Driver_Cancelled_PC_Issues AS
SELECT COUNT(*) FROM bookings
WHERE Cancelled_Rides_by_Driver = 'Personal & Car related issue';
```

6. **Max & Min driver ratings for Prime Sedan**
```sql
CREATE VIEW Prime_Sedan_Ratings AS
SELECT MAX(Driver_Ratings) AS max_rating,
       MIN(Driver_Ratings) AS min_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';
```

7. **Revenue from successfully completed rides**
```sql
CREATE VIEW Total_Successful_Revenue AS
SELECT SUM(Booking_Value) AS total_revenue
FROM bookings
WHERE Booking_Status = 'Success';
```

8. **Incomplete rides with reasons**
```sql
CREATE VIEW Incomplete_Rides_Detail AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';
```

> All queries are saved as **SQL Views** for reusability and efficient reporting.

---

## 📊 Power BI Dashboard

The Power BI report is organized into **5 interactive pages**:

### 1. 🌐 Overall
- **Ride Volume Over Time** — Line chart showing daily/weekly booking trends, highlighting weekend and event-day peaks
- **Booking Status Breakdown** — Donut chart showing the proportion of successful, cancelled, and incomplete rides

### 2. 🚗 Vehicle Type
- **Top 5 Vehicle Types by Ride Distance** — Bar chart ranking vehicle categories by total km covered
- **Average Customer Rating by Vehicle Type** — Column chart comparing satisfaction scores across vehicle types

### 3. 💰 Revenue
- **Revenue by Payment Method** — Stacked bar chart showing income split across Cash, Mobile Banking, and Card
- **Top 5 Customers by Total Booking Value** — Leaderboard of highest-spending customers
- **Ride Distance Distribution Per Day** — Scatter plot showing daily ride distance spread

### 4. ❌ Cancellations
- **Cancellation Reasons by Customers** — Bar chart of common customer-side cancellation causes
- **Cancellation Reasons by Drivers** — Bar chart of driver-side cancellation causes

### 5. ⭐ Ratings
- **Driver Ratings Distribution** — Box plot showing rating spread across vehicle types
- **Customer vs. Driver Ratings** — Scatter plot exploring correlation between customer and driver satisfaction scores

---

## 📁 Project Structure

```
pathao-data-analysis/
│
├── 📂 data/
│   └── Bookings-100000-Rows.xlsx       # Raw dataset
│
├── 📂 sql/
│   └── pathao_queries.sql              # All SQL queries and view definitions
│
├── 📂 powerbi/
│   └── pathao_data_analysis.pbix       # Power BI dashboard file
│
└── README.md                           # Project documentation
```

---

## 💡 Key Insights

- **Weekends and match days** drive significantly higher ride volumes and booking values
- **Bike and eBike** categories dominate ride counts due to Dhaka's traffic congestion patterns
- The majority of cancellations are driver-initiated, with **personal/car-related issues** as the leading cause
- **Mobile Banking (bKash/Nagad)** is the most preferred payment method, reflecting Bangladesh's digital payment landscape
- Customer and driver ratings show a **positive correlation**, indicating that mutual respect between parties leads to better ride experiences
- Approximately **62% of all bookings** result in successful rides, consistent with regional ride-sharing benchmarks

---

## 🚀 How to Use This Project

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/pathao-data-analysis.git
   cd pathao-data-analysis
   ```

2. **Explore the data** — Open `data/Bookings-100000-Rows.xlsx` in Excel or load it into MySQL

3. **Run SQL queries** — Import `sql/pathao_queries.sql` into MySQL Workbench and execute

4. **Open the dashboard** — Open `powerbi/pathao_data_analysis.pbix` in Power BI Desktop

---

## 👤 Author

**[Tasdid Hasnat]**
- 📧 Email: tasdidnirzor@gmail.com
- 🐙 GitHub: [github.com/your-username](https://github.com/tasdid25)

---

## 📄 License

This project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute with attribution.

---

## 🙏 Acknowledgements

- Inspired by the **OLA Data Analyst Project** framework by [Top Varsity](https://www.youtube.com/@TopVarSity/videos)
- Adapted for the **Bangladeshi ride-sharing context** using Pathao's operational model and local geography

---

> ⭐ *If you found this project helpful, please consider giving it a star on GitHub!*
