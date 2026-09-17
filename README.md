# Global AI Talent Intelligence Consulting

A full end-to-end Business Intelligence project analyzing the **global AI job market** — salaries, hiring demand, remote work trends, and experience-based compensation — built with Python, SQL, and Power BI.

> Simulates a BI consulting engagement: taking a raw dataset, engineering it into a proper data warehouse, and delivering an interactive dashboard that supports real HR and workforce planning decisions.

---

## Overview

**AI Talent Intelligence Consulting** analyzes 15,000+ AI job postings across 19 countries to answer questions companies actually face when hiring AI talent:

- What should we pay for a given role and seniority level?
- Which countries offer the best cost-to-talent ratio?
- Is remote work actually cheaper, or does it pay just as well?
- How much of a premium does experience really command?

The project follows a complete BI pipeline: **data cleaning → dimensional modeling → SQL analysis → interactive dashboard**.

---

## Key Insights

- **Salaries scale sharply with seniority** — Executive-level AI roles pay ~2.7x more than entry-level roles (Senior-to-Junior ratio: 2.71).
- **Two distinct hiring markets exist**: high-volume markets (Germany, France, India) vs. high-paying specialist markets (Switzerland, Norway, UK).
- **Remote work is fully normalized, not dominant** — postings split almost evenly across Onsite (33.9%), Hybrid (33.3%), and Remote (32.8%).
- **Remote roles are not a pay cut** — in several countries, remote salaries matched or exceeded onsite pay.
- **Compensation is stable, not speculative** — average salary grew modestly (~$109K → ~$110K) year-over-year, suggesting a maturing market rather than a hype bubble.
- **Core AI roles are consistently priced** (~$111K–$112K average across Data Engineer, ML Engineer, AI Specialist, Robotics Engineer), indicating market standardization.

---

## Tech Stack

| Layer | Tools |
|---|---|
| **Data Source** | [Global AI Job Market & Salary Trends 2025](https://www.kaggle.com/datasets/bismasajjad/global-ai-job-market-and-salary-trends-2025) dataset (Kaggle) — 15,000 records, 19 variables |
| **Data Cleaning / ETL** | Python (pandas, numpy) |
| **Data Warehouse** | MySQL — Star Schema |
| **Analysis** | SQL (ROLAP-style multi-dimensional queries) |
| **Dashboard** | Power BI + DAX |

---

## Data Pipeline

**1. Data Gathering** — Raw CSV (15,000 rows × 19 columns) covering job title, salary, experience level, employment type, company location/size, remote ratio, required skills, and more.

**2. Data Preparation** — Using pandas:
- Removed duplicates, validated nulls
- Converted date fields to `datetime64` and salary fields to numeric types
- Mapped coded values (`EN`, `MI`, `SE`, `EX`) to readable labels (Entry-level, Mid-level, Senior-level, Executive)
- Removed salary outliers using the IQR method (15,000 → 14,517 clean records)
- Auto-generated a data dictionary for documentation

**3. Data Warehouse Design** — Modeled as a **Star Schema** in MySQL:

- **Fact table:** `fact_ai_jobs` (salary, remote ratio, foreign keys)
- **Dimension tables:** `dim_job`, `dim_company`, `dim_date`, `dim_location`
- Indexed foreign keys for fast analytical joins

**4. Analysis (ROLAP + SQL)** — Multi-dimensional queries covering:
- Total/average salary by job title
- Job postings per company
- Remote vs. hybrid vs. onsite distribution
- Salary trends by year
- Top-paying locations and roles
- Combined job × company × year aggregations

**5. Dashboard (Power BI + DAX)** — Interactive dashboard with custom DAX measures:
- Average / Median Salary
- Remote Share %
- Senior-to-Junior Salary Ratio
- Salary Difference (Remote vs. Onsite)
- Total Postings

---

## Dashboard Preview

<img src="https://raw.githubusercontent.com/zeynebjagh/Global-AI-Talent-Intelligence-Consulting-/main/dashboard/dashboard_preview.png" alt="Global AI Talent Intelligence Power BI Dashboard" width="900">


---

## Repository Structure

```
Global-AI-Talent-Intelligence-Consulting/
│
├── data/              # Raw + cleaned datasets, data dictionary
├── notebooks/         # Python ETL notebook (cleaning, transformation)
├── etl/               # SQL scripts: schema creation, star schema (DBML)
├── dashboard/         # Power BI file + exported dashboard screenshots
├── docs/              # Supporting documents (use case proposal, full report)
├── README.md
└── .gitignore
```

---

## How to Reproduce

1. Clone the repo and open `notebooks/` in Jupyter or Colab
2. Run the ETL notebook to regenerate `cleaned_dataset.csv`
3. Run the SQL scripts in `etl/` to build the MySQL star schema
4. Load the cleaned data into MySQL
5. Open the `.pbix` file in `dashboard/` with Power BI Desktop to explore the live dashboard

---

## About

Originally developed as an academic Business Intelligence project (Tunis Business School), framed as a consulting engagement to practice the full BI lifecycle — from raw data to a decision-ready dashboard.

**Contributors:** Zeyneb Jaghmoun, Mayssa Ben Youssef
