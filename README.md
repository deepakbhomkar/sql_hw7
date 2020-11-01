# sql_hw7 - Looking for suspicious transactions

## Data Modeling
    1.Created a database **transaction_db** in Postgres
    2.Created the following Tables in the database using SQL query. See the file schema.sql for details
        * cctransaction
        * cardholder
        * creditcard
        * merchantcategory
        * merchant

    3.Uploaded files using the provide csv files in Postgres SQl
    4.Created Views for all queries used. See the file schema_view.sql for details

## Data Analysis

Created a Jupyter Notebook with the following reports using database tables and pandas

    1.Isolate the transactions for each card holder
    2.Analyze transactions between 7:00 AM and 9:00 AM for 100 highest transactions and fraudulent transactions
    3.Analyze small payments less than 2 dollars and top 5 merchants prone to be hacked
    4.Create view of the aboev queries
    5.Analyze any fraudulent transactions occured for two of the important customers
    6.Cretae a box plot and analysis for cardholder 25 to identify outliers for abnormalities
    
## Challenge

Create a Juoyter Notebaook with the following reports

    1.Using Python standard deviation figure out the transactions that identify as the outliers
    2.Using IQR method figure out the transactions that identify as the outliers