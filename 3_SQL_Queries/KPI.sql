create database loan;
use loan;
/* 1. Total Amount Funded (KPI) */
SELECT 
    CONCAT('₹', ROUND(SUM(`Funded Amount`) / 10000000, 2), ' Cr') 
    AS 'Total Amount Funded'
FROM `new dataset`;
/* 2. Total Loans (KPI) */
SELECT COUNT(`Account ID`) AS 'Total Loans'
FROM `new dataset`;
/* 3. Total Collection*/
SELECT CONCAT('₹', ROUND(SUM(`Total Pymnt`) / 10000000, 2), ' Cr') AS 'Total Collection'
FROM `new dataset`;
/* 4.Total Interest */
SELECT CONCAT('₹', FORMAT(SUM(`Total Rec int`) / 10000000, 2), ' Cr') AS `Total Interest`
FROM `new dataset`;
/* 5. Default Loan Count */
 SELECT COUNT(*) AS `Default Loan Count`
FROM `new dataset`
WHERE `Is Default Loan` = 'Y';
/* 6.Delinquent Client */
SELECT FORMAT(COUNT(*), 0) AS `Delinquent Client Count`
FROM `new dataset`
WHERE `Is Delinquent Loan` = 'Y';
/* 7.No Verified Loans */
SELECT FORMAT(COUNT(*), 0) AS `No Verified Loans`
FROM `new dataset`
WHERE `Verification Status` = 'Not Verified';
/* 8. Delinquent Loan Rate */
SELECT CONCAT(
    ROUND(
        COUNT(CASE WHEN `Is Delinquent Loan` = 'Y' THEN 1 END) * 100.0 / COUNT(*),
        2
    ),
    '%'
) AS `Delinquent Loan Rate`
FROM `new dataset`;
/* 9. Default Loan Rate */
SELECT CONCAT(
    ROUND(
        COUNT(CASE WHEN `Is Default Loan` = 'Y' THEN 1 END) * 100.0 / COUNT(*),
        2
    ),
    '%'
) AS `Default Loan Rate`
FROM `new dataset`;
