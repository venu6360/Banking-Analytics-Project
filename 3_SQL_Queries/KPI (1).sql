create database credit; 
use credit;
/*  1.Total Credit Amount */
SELECT CONCAT(
    ROUND(SUM(`Amount`) / 1000000, 2),
    'M'
) AS `Total Credit Amount`
FROM debit_credit
WHERE `Transaction Type` = 'Credit';
RENAME TABLE `debit and credit new set` TO `debit_credit`;
/* 2.Total Debit Amount */
SELECT CONCAT(
    ROUND(SUM(`Amount`) / 1000000, 2),
    'M'
) AS `Total Debit Amount`
FROM debit_credit
WHERE `Transaction Type` = 'Debit';
/* 3. Credit to Debit Ratio */
SELECT CONCAT(
    ROUND(
        SUM(CASE WHEN `Transaction Type` = 'Credit' THEN `Amount` ELSE 0 END)
        /
        SUM(CASE WHEN `Transaction Type` = 'Debit' THEN `Amount` ELSE 0 END)
        * 100,
        2
    ),
    '%'
) AS `Credit to Debit Ratio`
FROM debit_credit;
/* 4. Net Transction */
SELECT CONCAT(
    ROUND(
        (
            SUM(CASE WHEN `Transaction Type` = 'Credit' THEN `Amount` ELSE 0 END)
            -
            SUM(CASE WHEN `Transaction Type` = 'Debit' THEN `Amount` ELSE 0 END)
        ) / 1000,
        2
    ),
    'K'
) AS `Net Transaction`
FROM debit_credit;
/* 5. Account Activity Ratio */
SELECT CONCAT(
    ROUND(
        COUNT(`Transaction Date`) / SUM(`Balance`) * 100,
        3
    ),
    '%'
) AS `Account Activity Ratio`
FROM debit_credit;

