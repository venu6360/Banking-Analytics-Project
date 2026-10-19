# 🏦 Banking Analytics Project

End-to-end banking analytics using **Excel, Power BI, SQL and Tableau**. The project covers two areas:

1. **Loan Portfolio Analytics:** loan performance, delinquency, defaults and collections
2. **Debit & Credit Transaction Analytics:** transaction flow and high-risk activity

---

## 📌 Project Overview

This project analyzes banking data to understand loan performance, customer behavior, delinquency, defaults and recovery trends. Raw data is cleaned, analyzed and turned into interactive dashboards and KPI reports that support data-driven decisions.

## 🎯 Objectives

- Analyze loan performance and customer behavior
- Identify delinquent clients and loan defaults
- Track collections, interest and disbursement trends over time
- Monitor debit/credit flow and flag risky transactions
- Build interactive dashboards with slicers and KPI cards

## 🛠️ Tools & Technologies

| # | Tool | Used for |
|---|------|----------|
| 1 | **Microsoft Excel** | Pivot tables, pivot charts, KPI dashboard, Power Query |
| 2 | **Power BI** | Interactive multi-page dashboards, slicers, KPI cards |
| 3 | **SQL (MySQL)** | Aggregations, CASE logic, subqueries, date functions |
| 4 | **Tableau** | KPI sheets, charts and dashboards |

---

## 📁 Repository Structure

```
Banking-Analytics-Project/
├── 1_Excel_Dashboard/
├── 2_PowerBI_Dashboard/
├── 3_SQL_Queries/
├── 4_Tableau_Dashboard/
└── README.md
```

---

## 📊 Project Modules

### 1. Excel Dashboard
- Created KPI indicators
- Analyzed delinquent client counts
- Evaluated default loan rates
- Visualized loan performance by state
- Used pivot tables, charts and filters

### 2. Power BI Dashboards

**A. Loan Portfolio & Performance (3 pages)**

| Page | What it shows |
|------|---------------|
| **Overview** | KPI cards, loan disbursement trend, state-wise loan distribution, loan portfolio status |
| **Portfolio Analysis** | Unverified loans, loan maturity, age-wise, religion-wise, product-wise and grade-wise distribution |
| **Risk & Branch** | Delinquent and default counts and rates, top 10 branches by revenue, top 5 states on a map |

Slicers: State Name · Branch Name · Loan Status Group · Purpose Group · Religion · Age Group · Product Group

**B. Bank Debit & Credit Analysis**
- KPI cards: total credit, total debit, credit-to-debit ratio, net transaction amount, account activity ratio
- Transactions per month, total transaction amount by branch, transaction volume by bank
- High-risk transaction flag, transaction method distribution, suspicious transaction frequency
- Slicers: Months · Risk Flag · Transaction Method · Branch · Bank Name

### 3. SQL Analysis
Queries in `3_SQL_Queries/All Charts.sql` answer these questions:
1. Top 10 branches by loan amount (₹ Cr)
2. Top 5 states by loan amount
3. Loan amount share by religion
4. Loan grade distribution
5. Loan distribution by purpose/product
6. Loan maturity (36 months vs 60 months)
7. Loan status distribution
8. Age-group-wise loan amount
9. Quarterly loan disbursement trend

Further queries cover branch transaction growth and high-risk transaction flags.

### 4. Tableau Dashboard
- Loan KPIs: total loans, total funded, total interest, total collection, verified loans, delinquent clients, default loan count
- Charts for age group, religion, grade, maturity, status, product category, top branches and top states
- Debit/credit dashboard with credit-to-debit ratio, net transactions, high-risk flags and bank-wise volume

---

## 📈 Key Performance Indicators

### Loan Portfolio
| KPI | Value |
|-----|-------|
| Total Funded Amount | ₹732.70M |
| Total Collections | ₹814.90M |
| Total Interest | ₹155.29M |
| Total Loans | 66K |
| Delinquent Loans | 7K |
| Default Loans | 1K |
| Delinquent Loan Rate | 0.11 |
| Default Loan Rate | 0.02 |
| Unverified Loans | 17K |

### Debit & Credit Transactions
| KPI | Value |
|-----|-------|
| Total Credit Amount | 127.60M |
| Total Debit Amount | 127.29M |
| Credit to Debit Ratio | 99.75% |
| Net Transaction Amount | 318.12K |
| Account Activity Ratio | 1.00 |

---

## 💡 Key Insights

**Loan portfolio**
- Collections (₹814.90M) exceeded the funded amount (₹732.70M), and interest earned was ₹155.29M.
- About 11% of loans are delinquent (7K of 66K) and about 2% are in default (1K of 66K).
- 36-month loans (46K) are more than double the 60-month loans (20K).
- About 86.8% of loans fall in one product group, which shows a concentrated portfolio.
- Loan volume is highest among younger age groups and falls steadily in older age groups.
- Mathura, Fatehgarh Sahib and Haridwar are the top branches by revenue. Punjab, Haryana, Uttar Pradesh, Rajasthan and Bihar are the top 5 states by loans.
- Monthly disbursement is highest at the start of the period and then declines steadily.

**Debit & credit transactions**
- Credit (127.60M) and debit (127.29M) are almost balanced, so the credit-to-debit ratio is close to 100%.
- Transactions are split nearly evenly across Bank Transfer, Credit Card and Debit Card (about 33% each).
- Transaction volume is also close across the six banks (about 41.9M to 42.8M each).
- High-risk and normal transactions split roughly 51% / 49%, so risk monitoring is important.
- Monthly transaction counts decline slowly from about 9.3K and then drop sharply in December (305).

---

## 🚀 How to Use

1. Clone the repo: `git clone https://github.com/venu6360/Banking-Analytics-Project.git`
2. **Excel:** open the files in `1_Excel_Dashboard/`
3. **Power BI:** open the `.pbix` files in `2_PowerBI_Dashboard/` with Power BI Desktop
4. **SQL:** load the dataset into MySQL as `new dataset`, then run the queries in `3_SQL_Queries/`
5. **Tableau:** open the `.twbx` files in `4_Tableau_Dashboard/` with Tableau Desktop or Tableau Public

> **Note:** This is a practice project built on a sample dataset. The bank name and logo are used only for dashboard theming and do not represent real company data.

---

## 📚 Key Learnings

- Data cleaning and transformation
- Exploratory data analysis
- KPI development and reporting
- Building interactive dashboards with slicers and navigation
- Comparing how Excel, Power BI, SQL and Tableau handle the same analysis
- Turning business questions into analytical insights

---

## 👨‍💻 Author

**Venugopal Rao M**
Computer Science and Engineering Graduate

GitHub: [venu6360](https://github.com/venu6360)

⭐ If you found this project useful, please star the repo!
