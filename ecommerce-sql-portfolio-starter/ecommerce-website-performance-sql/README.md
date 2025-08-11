# E-commerce Website Performance Analysis (SQL-first)

> **Status:** Draft • Last updated: August 11, 2025  
> **Role:** Data Analyst (Intern) • **Focus:** SQL → Insights → Dashboard

---

## Project Background
A mid-sized **e-commerce** retailer (consumer goods) operating since 2019 with a hybrid **B2C** model. Core sales channels include website and paid social. Key business metrics include **Revenue, Orders, AOV, Conversion Rate, CTR**, and **Return Rate**.  
As a data analyst embedded in the growth team, my goals are to: (1) ensure clean, reliable data; (2) monitor KPIs via dashboards; and (3) answer targeted business questions to improve performance.

**Insights and recommendations** are provided on the following key areas:
- **Category 1: Sales & Revenue Trends**
- **Category 2: Product & Category Performance**
- **Category 3: Customer Cohorts & RFM**
- **Category 4: Marketing Channel Efficiency**

The SQL used to **inspect and clean** the data can be found here → [`/sql/01_cleaning.sql`](sql/01_cleaning.sql).  
Targeted SQL queries for business questions can be found here → [`/sql/03_ad_hoc_questions.sql`](sql/03_ad_hoc_questions.sql).  
An interactive dashboard (Power BI or Tableau) will be linked here → **[Dashboard link – to be added]**.

---

## Data Structure & Initial Checks
The core dataset comprises four tables with a total of **~100k–500k** rows (placeholder):  
- `orders` — order-level facts (order_id, order_date, customer_id, total_amount, channel)  
- `order_items` — product-level line items (order_id, product_id, qty, price, discount)  
- `customers` — customer info (customer_id, signup_date, segment, region)  
- `products` — product metadata (product_id, category, brand, cost)

> **Entity Relationship Diagram (ERD):** see [`/docs/ERD.png`](docs/ERD.png) (add your diagram here).

**Initial data checks include:**
- Row counts per table, min/max dates
- Null / duplicate checks on primary keys and business keys
- Basic conformance checks (e.g., totals = sum of items, valid categories)

---

## Executive Summary
**Overview of Findings (example template):**  
- Revenue shows **seasonality** with spikes in **Q4**; growth of **+12–18% YoY** concentrated in **Electronics & Home**.  
- A small set of **high-value customers (top 20%)** contributes **~65%** of total revenue; reactivation campaigns show positive lift.  
- **Paid Social** has high reach but lower **ROAS** vs. **Organic/Email**; reallocating spend improves efficiency.

> Replace the bullets above with your confirmed results once analysis is complete.

![Overall KPI Snapshot](images/placeholder_overall_kpis.png "Add your dashboard snapshot here")

---

## Insights Deep Dive

### Category 1: Sales & Revenue Trends
- **Insight 1:** e.g., Revenue grew **15%** in **H2 2024** driven by AOV increases.  
- **Insight 2:** e.g., Conversion rate dips on mobile during flash sales → site friction.  
- **Insight 3:** e.g., Orders peak on weekends; limited weekday promos.  
- **Insight 4:** e.g., Seasonality impacts accessories; consider pre-holiday bundles.

_Add one KPI chart or line chart image here._

### Category 2: Product & Category Performance
- **Insight 1:** e.g., Top 10 SKUs account for **35%** of revenue; long tail underperforms.  
- **Insight 2:** e.g., Category margin variance suggests price optimization.  
- **Insight 3:** e.g., Stockouts correlate with ad spikes.  
- **Insight 4:** e.g., Cross-selling uplift with bundles.

_Add a product/category bar chart here._

### Category 3: Customer Cohorts & RFM
- **Insight 1:** e.g., New-customer cohort from **Nov–Dec** retains at **x%** after 90 days.  
- **Insight 2:** e.g., RFM segmentation highlights **Champions** with highest LTV.  
- **Insight 3:** e.g., Reactivation via email yields **+8%** order lift.  
- **Insight 4:** e.g., VIP free shipping improves AOV.

_Add a cohort heatmap or RFM plot image here._

### Category 4: Marketing Channel Efficiency
- **Insight 1:** e.g., Paid Social ROAS < Email; rebalance budget by **10–20%**.  
- **Insight 2:** e.g., CTR improvements tied to creative refresh cadence.  
- **Insight 3:** e.g., Attribution shows under-reporting in Direct.  
- **Insight 4:** e.g., UTM hygiene fixes reduce dark traffic.

_Add a channel performance chart here._

---

## Recommendations
- If **AOV** drives growth, test **bundles** and **tiered discounts**.  
- Shift **10–20%** budget from low-ROAS channels to **Email/Organic** during off-peak weeks.  
- Implement **VIP program** for RFM “Champions” to lift retention.  
- Fix **UTM governance** and site speed on mobile to reduce drop-offs.  
- Enable **weekly KPI monitoring** with automated dashboards.

---

## Assumptions & Caveats
- Missing country values defaulted to **US**; revisit once data is enriched.  
- **Dec 2021** data unavailable; used adjacent periods for estimation.  
- **3%** invalid refund dates excluded from calculations.  
  
> Replace with your actual assumptions once you explore the data.

---

## How to Reproduce
1. Place raw CSVs into `data/raw/`.  
2. Run the SQL from [`/sql/01_cleaning.sql`](sql/01_cleaning.sql) then the KPI queries in [`/sql/02_kpi_queries.sql`](sql/02_kpi_queries.sql).  
3. Use the notebooks in `/notebooks` to validate results and export charts to `/images`.  
4. Publish your dashboard (Power BI/Tableau) and replace the dashboard link in this README.

---

## Tech Stack
- **SQL:** data checks, cleaning, KPI & ad-hoc analysis  
- **Python:** EDA + plots (Pandas, NumPy, Matplotlib)  
- **BI:** Power BI or Tableau (public link)  

---

## Repository Layout
```
ecommerce-website-performance-sql/
├── data/
│   ├── raw/
│   └── processed/
├── sql/
│   ├── 00_schema_notes.sql
│   ├── 01_cleaning.sql
│   ├── 02_kpi_queries.sql
│   └── 03_ad_hoc_questions.sql
├── notebooks/
│   ├── 01_eda.ipynb
│   └── 02_visualization.ipynb
├── dashboard/
│   ├── powerbi/
│   └── tableau/
├── images/
├── docs/
│   └── ERD.png
├── requirements.txt
├── LICENSE
└── README.md
```
