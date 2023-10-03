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

<b>1. Data Description</b>:
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

<b>2. Data Description</b>: 
The OFFERS table contains information about credit offers for bank customers. Each offer has an identifier (offer_id), a start date (offer_start_date), and an expiration date (offer_expiration_date).

<b>Task</b>: Display the number of active offers for each day in the year 2018.
| OFFER_ID | OFFER_START_DATE | OFFER_EXPIRATION_DATE |
|----------|------------------|-----------------------|
|   83942  |  2017-12-01      |  2018-02-01           |
|   94859  |  2018-05-03      |  2018-10-19           |
|   ...    |  ...             |  ...                  |

<b>3. Data Description</b>:
The CARDS table contains information about all the bank's customers' cards. Attributes include customer identifier (client_id), card identifier (card_id), card issue date (open_date), card closure date (close_date), and card type - debit (DC) or credit (CC) (card_type).

<b>Task</b>: Select the debit card of a customer, among all working debit cards on the date 2018-09-01, which was issued last. Output format: client_id, card_id.
| CLIENT_ID | CARD_ID     | OPEN_DATE  | CLOSE_DATE | CARD_TYPE |
|-----------|------------|------------|------------|-----------|
| 1232110   | 49582985729 | 2019-01-12 | NULL       | DC        |
| 234235    | 48574092749 | 2017-03-29 | 2018-09-01 | CC        |
| ...       | ...        | ...        | ...        | ...       |

<b>4. Description of the data</b>: 
The BONUS table contains information about bonus points awarded for purchases under the loyalty program. Attributes: client identifier (client_id), date of bonus accrual (bonus_date), the amount of accrued bonuses (bonus_cnt), the MCC code of the transaction for which the bonuses were accrued (mcc_code). The MCC_CATEGORIES table is a reference of MCC codes. Attributes: MCC code (mcc_code), category (e.g., supermarkets, transportation, pharmacies, etc., mcc_category). 

<b>Task</b>: Indicate 1000 clients who were the first to accumulate 1000 bonus points for purchases in the "Airline Tickets" and "Hotels" categories.
CLIENT_ID | BONUS_DATE | BONUS_CNT | MCC_CODE
--------- | ---------- | --------- | --------
1232110   | 2018-01-01 | 12        | 3617
234235    | 2018-06-17 | 5         | 5931
...       | ...        | ...       | ...

MCC_CODE | MCC_CATEGORY
-------- | -------------
3031     | Авиабилеты
5735     | Музыка
...      | ...

<b>5.</b>
The sum(X) command sums all the values of column X, how do you multiply all the values of one column in SQL?

Solutions are presented in [1_mysql.sql](https://github.com/yanicen1/Data_Analysis_Test_Task_2/blob/main/1_mysql.sql), [2_mysql.sql](https://github.com/yanicen1/Data_Analysis_Test_Task_2/blob/main/2_mysql.sql), [3_mysql.sql](https://github.com/yanicen1/Data_Analysis_Test_Task_2/blob/main/3_mysql.sql), [4_mysql.sql](https://github.com/yanicen1/Data_Analysis_Test_Task_2/blob/main/4_mysql.sql), and [5_mysql.sql](https://github.com/yanicen1/Data_Analysis_Test_Task_2/blob/main/5_mysql.sql) in MySQL format, as well as in the Jupyter Notebook named 'Solution.ipynb' in SQLite format.
