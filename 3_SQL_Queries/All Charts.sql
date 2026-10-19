/* (1)  Top 10 Branches by Loan Amount (Cr) */
SELECT
    `Branch Name`,
    ROUND(SUM(`Loan Amount`) / 10000000, 2) AS `Loan Amount (Cr)`
FROM `new dataset`
GROUP BY `Branch Name`
ORDER BY SUM(`Loan Amount`) DESC
LIMIT 10;
/* (2) State wise Performance */
SELECT
    `State Name`,
    ROUND(SUM(`Loan Amount`) / 10000000, 2) AS `Loan Amount (Cr)`
FROM `new dataset`
GROUP BY `State Name`
ORDER BY SUM(`Loan Amount`) DESC
LIMIT 5;
/* (3) Loan Amount Distribution by Religion*/
SELECT
    `Religion`,
    CONCAT(
        ROUND(
            SUM(`Loan Amount`) * 100 /
            (SELECT SUM(`Loan Amount`)
                FROM `new dataset`
                WHERE `Religion` IS NOT NULL
                  AND TRIM(`Religion`) <> ''),1),'%') AS `Loan Percentage`
FROM `new dataset`
WHERE `Religion` IS NOT NULL
  AND TRIM(`Religion`) <> ''
GROUP BY `Religion`
ORDER BY SUM(`Loan Amount`) DESC;
/* (4) Loan Grade Distribution */
SELECT `Grade`,
    ROUND(SUM(`Loan Amount`) / 10000000, 2) AS `Loan Amount `
FROM `new dataset`
WHERE `Grade` IS NOT NULL
GROUP BY `Grade`
ORDER BY SUM(`Loan Amount`) DESC;
/* (5) Loan distribution by Product */ 
SELECT
    `Purpose Category`,
    ROUND(SUM(`Loan Amount`) / 10000000, 2) AS `Loan Amount `
FROM `new dataset`
WHERE `Purpose Category` IS NOT NULL
GROUP BY `Purpose Category`
ORDER BY SUM(`Loan Amount`) DESC
LIMIT 10;
/* (6 ) Loan Maturity */ 
SELECT
    CASE
        WHEN `Term` LIKE '%36%months%' THEN '1-3 Years'
        WHEN `Term` LIKE '%60%months%' THEN '3-5 Years'
    END AS `Loan Maturity`,
    ROUND(SUM(`Loan Amount`) / 10000000, 2) AS `Loan Amount(Cr) `
FROM `new dataset`
WHERE `Term` LIKE '%36%months%'
   OR `Term` LIKE '%60%months%'
GROUP BY 1
ORDER BY 1;
/* (7 ) Loan Status Distribution */
SELECT `Loan Status`,
    FORMAT(COUNT(`Account ID`), 0) AS `Loan Count`
FROM `new dataset`
WHERE `Loan Status` IS NOT NULL
GROUP BY `Loan Status`
ORDER BY COUNT(`Account ID`) DESC;
/* ( 8) Age Group wise Loan Amount */
SELECT
    CASE
        WHEN CAST(`Age` AS UNSIGNED) BETWEEN 18 AND 25 THEN '18-25'
        WHEN CAST(`Age` AS UNSIGNED) BETWEEN 26 AND 35 THEN '26-35'
        WHEN CAST(`Age` AS UNSIGNED) BETWEEN 36 AND 45 THEN '36-45'
        WHEN CAST(`Age` AS UNSIGNED) BETWEEN 46 AND 55 THEN '46-55'
        WHEN CAST(`Age` AS UNSIGNED) BETWEEN 56 AND 63 THEN '56-63'
        ELSE 'Not Available'
    END AS `Age Group`,
    ROUND(SUM(`Loan Amount`) / 10000000, 2) AS `Loan Amount (Cr)`
FROM `new dataset`
GROUP BY 1
ORDER BY
    CASE
        WHEN `Age Group` = '18-25' THEN 1
        WHEN `Age Group` = '26-35' THEN 2
        WHEN `Age Group` = '36-45' THEN 3
        WHEN `Age Group` = '46-55' THEN 4
        WHEN `Age Group` = '56-63' THEN 5
        ELSE 6
    END;
    /*(9) Loan Disbursement Trend */
SELECT
    CONCAT(`Year`, ' - Q', `Quarter`) AS `Quarter`,
    ROUND(`Loan Amount` / 10000000, 2) AS `Loan Amount (Cr)`
FROM (
    SELECT
        YEAR(STR_TO_DATE(`Disbursement Date`, '%d-%m-%Y')) AS `Year`,
        QUARTER(STR_TO_DATE(`Disbursement Date`, '%d-%m-%Y')) AS `Quarter`,
        SUM(`Loan Amount`) AS `Loan Amount`
    FROM `new dataset`
    WHERE `Disbursement Date` IS NOT NULL
    GROUP BY
        YEAR(STR_TO_DATE(`Disbursement Date`, '%d-%m-%Y')),
        QUARTER(STR_TO_DATE(`Disbursement Date`, '%d-%m-%Y'))
) AS t
ORDER BY `Year`, `Quarter`;
