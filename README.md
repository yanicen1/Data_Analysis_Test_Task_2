# Test Task for Data Analyst Position 

This repository contains the solution of the test task that sent by employer.

### Job description:
<b>Responsibilities</b>:
- Building regular and custom data exports for clients.
- Communicating with clients to identify report requirements.
- Developing data collection methodologies (what data to collect and for what purpose, how to collect it into the final report), prototyping.
- Systematizing and defining data requirements in the database: determining which tables are needed for reports, and collaborating with data engineers.
- Creating and maintaining up-to-date documentation (tables, dashboards, exports).

<b>Requirements</b>:
- Experience in building dashboard systems.
- Experience in developing performance indicator methodologies.
- Experience working with a Data Warehouse (DWH): ability to write queries efficiently for optimization.
- Experience in managing ETL processes: configuring aggregates for dashboards.
- Profound knowledge of SQL (complex queries, analytical functions).
- Experience in analyzing real data using Python.

<b>Would be a plus</b>:
- Experience conducting A/B tests.
- Knowledge of mathematical statistics.
- A strong desire to learn and adapt to new technologies.
- Understanding of Machine Learning principles.
- Previous experience working with Business Intelligence (BI) systems.

### Test Task
You are invited to write SQL queries to solve the following 5 tasks. Each task provides a description of the data in the database and specifies what needs to be displayed in the result. Your script can contain any operations, including the creation of intermediate tables; the evaluation will be based on criteria such as the correctness of the result, conciseness, and code structure.

<b>1. Task 1. Data Description</b>:
The ACTIVE_CLIENTS table contains a monthly snapshot of bank clients who made any transactions. Attributes: reporting month (report_month) and client identifier (client_id). We consider a client to have "churned" from the bank in month N if they are active (present in the ACTIVE_CLIENTS table) in month N and inactive in months N+1, N+2, N+3.
| REPORT_MONTH | CLIENT_ID  |
|--------------|------------|
| 2018-01-01   | 1847982357 |
| 2018-01-01   | 938475     |
| 2018-02-01   | 1847982357 |
| 2018-02-01   | 6789998   |
| 2018-03-01   | 67900001  |
| ...          | ...        |

<b>Task</b>: Display the number of active clients for each month; display the proportion of clients who "churned" in each month.
