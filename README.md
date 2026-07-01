<div align="center">

# 🍔 Thapar-Treats: Enterprise SQL Food Delivery System

**A highly normalized (3NF), ACID-compliant relational database system simulating a scalable, high-throughput food delivery ecosystem.**

[![Oracle SQL](https://img.shields.io/badge/Oracle-SQL-F80000?logo=oracle&logoColor=white)](https://www.oracle.com/database/)
[![PL/SQL](https://img.shields.io/badge/PL%2FSQL-Stored%20Procedures-4479A1?logo=database&logoColor=white)](#)
[![Normalization](https://img.shields.io/badge/Normalization-3NF-brightgreen)](#)

</div>

---

## 📌 Overview

Thapar-Treats is a robust, backend database architecture designed to manage the complex, highly-concurrent entities of a modern food delivery network. Built entirely in **Oracle SQL**, this project demonstrates strong proficiency in **Database System Design, Schema Normalization, and PL/SQL Transaction Management**.

Rather than relying on application-level logic, critical business rules and transactional integrity are enforced strictly at the database layer using advanced constraints and stored procedures.

---

## 🏗️ Relational Schema & Normalization

The database schema is strictly normalized to the **Third Normal Form (3NF)** to eliminate data redundancy and ensure referential integrity across 11 interrelated tables:

*   **User Entities:** `Customer`, `Manager`, `DeliveryPartner`, `Seller`
*   **Transaction Entities:** `Orders`, `Catalogue`, `Item`
*   **Analytics Entities:** `Feedback`, `Rating`
*   **Resolution Tables:** `CustPhone`, `CustAddress` (Handling Multi-valued Attributes)

### Key Architectural Decisions:
- **Foreign Key Constraints:** Enforced strict referential integrity across the `Orders` and `Catalogue` tables to prevent orphaned records.
- **CHECK Constraints:** Deployed database-level data validation (e.g., `CHECK (closing_time > opening_time)` and `CHECK (rating >= 0 AND rating <= 5)`).
- **Composite Primary Keys:** Utilized in mapping tables (e.g., `CustPhone`, `Feedback`) to guarantee uniqueness without artificial keys.

---

## ⚡ PL/SQL Business Logic (Stored Procedures)

The core functionality of the delivery system is driven by **PL/SQL Stored Procedures** designed with **ACID (Atomicity, Consistency, Isolation, Durability)** compliance in mind. 

### 1. `place_order_if_available` (Transactional Integrity)
Handles the highly concurrent action of placing an order. It verifies item availability, maps the correct seller, generates a primary key sequence, and executes the `INSERT`. Uses explicit `COMMIT` and `ROLLBACK` blocks to prevent partial inserts in the event of a constraint violation.

### 2. `CheckSpecificRestaurantRisk` (Analytics Engine)
A procedural analytics block that scans the `Rating` and `Feedback` tables. If a restaurant's average rating drops below 2.5, or if string-matching detects multiple negative keywords (`%poor%`, `%smelly%`, `%insects%`), it triggers an automated risk alert.

### 3. `update_cod_based_on_rating` (Dynamic Privileges)
Dynamically calculates a user's average rating (as reviewed by sellers/delivery partners) and automatically revokes Cash-on-Delivery (COD) privileges if their score drops below a reliable threshold.

### 4. `CheckCustomerDiscountEligibility` (Retention Logic)
Evaluates historical order frequency and average seller-awarded ratings to automatically qualify top-tier users for checkout discounts.

---

## 🚀 How to Run

You can execute the schema and populate the mock data in any Oracle Database environment (e.g., Oracle Live SQL, SQL*Plus).

1. Clone the repository:
```bash
git clone https://github.com/Smarth2005/Thapar-Treats.git
```
2. Open your Oracle SQL client.
3. Run the master script to build tables, insert data, and compile the PL/SQL procedures:
```sql
@food_delivery_system.sql
```

---

## 👨‍💻 Author

**Smarth Kaushal**
Backend & Systems Engineering
[GitHub](https://github.com/Smarth2005) | [LinkedIn](#) 
