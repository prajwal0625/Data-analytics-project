use loan;
select count(*)from bankloan;

-- 1. Total Loan Amount Funded
SELECT SUM(`Funded Amount`) AS Total_Loan_Funded
FROM bankloan;

-- 2. Total Loans
SELECT COUNT(*) AS Total_Loans
FROM bankloan;

-- 3. Total Collection
SELECT SUM(`Total Rec Prncp` + `Total Rrec int` + `Total Rec Late fee` + `Recoveries`) AS Total_Collection
FROM bankloan;

-- 4. Total Interest
SELECT SUM(`Total Rrec int`) AS Total_Interest
FROM bankloan;

-- 5. Branch-Wise Performance
SELECT `Branch Name`,
       SUM(`Total Rrec int` + `Total Fees`) AS Total_Revenue
FROM bankloan
GROUP BY `Branch Name`;

-- 6. State-Wise Loan
SELECT `State Name`,
       SUM(`Funded Amount`) AS Total_Loan_Amount,
       COUNT(*) AS Loan_Count
FROM bankloan
GROUP BY `State Name`;

-- 7. Religion-Wise Loan
SELECT Religion,
       SUM(`Funded Amount`) AS Total_Loan_Amount,
       COUNT(*) AS Loan_Count
FROM bankloan
GROUP BY Religion;

-- 8. Product Group-Wise Loan
SELECT `Purpose Category`,
       SUM(`Funded Amount`) AS Total_Loan_Amount,
       COUNT(*) AS Loan_Count
FROM bankloan
GROUP BY `Purpose Category`;

-- 9. Disbursement Trend
SELECT DATE_FORMAT(`Disbursement Date`, '%Y-%m') AS Month,
       SUM(`Funded Amount`) AS Total_Disbursement
FROM bankloan
GROUP BY DATE_FORMAT(`Disbursement Date`, '%Y-%m')
ORDER BY Month;

-- 10. Grade-Wise Loan
SELECT Grrade,
       SUM(`Funded Amount`) AS Total_Loan_Amount,
       COUNT(*) AS Loan_Count
FROM bankloan
GROUP BY Grrade;

-- 11. Loan Status-Wise Loan
SELECT `Loan Status`,
       COUNT(*) AS Loan_Count,
       SUM(`Funded Amount`) AS Total_Loan_Amount
FROM bankloan
GROUP BY `Loan Status`;

-- 12. Age Group-Wise Loan
SELECT 
    CASE 
        WHEN `Age _T` < 25 THEN '<25'
        WHEN `Age _T` BETWEEN 25 AND 40 THEN '25-40'
        WHEN `Age _T` BETWEEN 41 AND 60 THEN '41-60'
        ELSE '>60'
    END AS Age_Group,
    COUNT(*) AS Loan_Count,
    SUM(`Funded Amount`) AS Total_Loan_Amount
FROM bankloan
GROUP BY Age_Group;

-- 13 No Verified Loans
SELECT COUNT(*) AS No_Verified_Loans
FROM bankloan
WHERE `Verification Status` = 'Not Verified';







