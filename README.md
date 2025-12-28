# Indian Election Result Analysis

A SQL-based data analysis project using MySQL to analyze Indian election results and uncover insights through structured queries on real-world datasets.


## Project Objective

The objective of this project is to analyze Indian election results using SQL queries on a MySQL database to identify trends, party performance, and state-wise outcomes. This project demonstrates the ability to work with real-world datasets, write optimized SQL queries, and extract meaningful insights for data-driven decision-making.


## Tech Stack

- **Database:** MySQL  
- **Query Language:** SQL  
- **Tools:** MySQL Workbench  
- **Data Source:** Indian Election Result Datasets (CSV files)  
- **Version Control:** Git & GitHub  


## Dataset Overview

The dataset used in this project contains detailed information about Indian election results. It includes multiple CSV files covering state-wise results, constituency-wise details, party-wise performance, and related metadata. These datasets were imported into a MySQL database and used to perform analytical queries.

### Dataset Files
- `states.csv` – state-level information  
- `statewise_results.csv` – Election results aggregated by state  
- `constituencywise_results.csv` – Winning candidates and results by constituency  
- `constituencywise_details.csv` – Detailed constituency-level voting data  
- `partywise_results.csv` – Party-wise seat counts and performance data


## Project Structure

```text
Indian-Election-Result-Analysis/
├── dataset/
│   ├── states.csv
│   ├── statewise_results.csv
│   ├── constituencywise_results.csv
│   ├── constituencywise_details.csv
│   └── partywise_results.csv
├── sql_queries/
│   └── indian_election_analysis.sql
├── README.md
└── LICENSE
```

## Key SQL Analysis Performed

The project includes SQL queries that perform the following analyses:

- Party-wise total seats won across India  
- State-wise distribution of winning parties  
- Constituency-level election results analysis  
- Identification of top-performing parties by number of seats  
- Comparison of election outcomes across different states  
- Use of JOINs, GROUP BY, ORDER BY, and aggregate functions to derive insights


## How to Run the Project

1. Download or clone the repository.
2. Import the CSV files from the `dataset` folder into a MySQL database.
3. Open the `indian_election_analysis.sql` file from the `sql_queries` folder.
4. Execute the SQL queries in MySQL to analyze the election results and generate insights.
