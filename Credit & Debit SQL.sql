SELECT * FROM debit_credit.creditdebit;
use debit_credit;

#1-Total Credit Amount:
SELECT SUM(Amount) AS Total_Credit_Amount
FROM creditdebit
WHERE `Transaction Type` = 'Credit';

#2-Total Debit Amount:

SELECT SUM(Amount) AS Total_Debit_Amount
FROM creditdebit
WHERE `Transaction Type` = 'Debit';

#3 3-Credit to Debit Ratio:
SELECT 
  SUM(CASE WHEN `Transaction Type` = 'Credit' THEN Amount ELSE 0 END) /
  SUM(CASE WHEN `Transaction Type` = 'Debit' THEN Amount ELSE 0 END) 
  AS Credit_To_Debit_Ratio
FROM creditdebit;

#4-Net Transaction Amount:
SELECT 
  SUM(CASE WHEN `Transaction Type` = 'Credit' THEN Amount ELSE 0 END) -
  SUM(CASE WHEN `Transaction Type` = 'Debit' THEN Amount ELSE 0 END) 
  AS Net_Trxn_Amount
FROM creditdebit;

#5-Account Activity Ratio
SELECT COUNT(*) / SUM(Balance) AS Account_Activity_Ratio
FROM creditdebit;

#6-Transactions per Day: 
SELECT `Transaction Date`, COUNT(*) AS Transactions_Per_Day
FROM creditdebit
GROUP BY `Transaction Date`;

#6-Transactions per Week: 
SELECT `Week of Year`, COUNT(*) AS Transactions_Per_Week
FROM creditdebit
GROUP BY `Week of Year`;

#6-Transactions per Month: 
SELECT `Month Name`, COUNT(*) AS Transactions_Per_Month
FROM creditdebit
GROUP BY `Month Name`;

#7-Total Transaction Amount by Branch
SELECT Branch, SUM(Amount) AS Total_Transaction_Amount
FROM creditdebit
GROUP BY Branch;

#8 Transaction Volume by Bank:
SELECT `Bank Name`, SUM(Amount) AS Transaction_Volume
FROM creditdebit
GROUP BY `Bank Name`;

#9-Transaction Method Distribution
SELECT 
  `Transaction Method`, 
  COUNT(*) / (SELECT COUNT(*) FROM creditdebit) * 100 AS Percentage
FROM creditdebit
GROUP BY `Transaction Method`;

#10 Branch Transaction Growth
SELECT Branch, `Month Name`, SUM(Amount) AS Total_Amount
FROM creditdebit
GROUP BY Branch, `Month Name`;

#11-High-Risk Transaction Flag:
SELECT 
  `High-Risk Transaction Flag`, 
  COUNT(*) AS Transaction_Count
FROM creditdebit
GROUP BY `High-Risk Transaction Flag`;

#12-Suspicious Transaction Frequency
SELECT 
  CASE 
    WHEN `Month Name` IN ('January','February','March') THEN 'Q1'
    WHEN `Month Name` IN ('April','May','June') THEN 'Q2'
    WHEN `Month Name` IN ('July','August','September') THEN 'Q3'
    WHEN `Month Name` IN ('October','November','December') THEN 'Q4'
  END AS Quarter,
  `High-Risk Transaction Flag`,
  COUNT(*) AS Count
FROM creditdebit
GROUP BY Quarter, `High-Risk Transaction Flag`;
