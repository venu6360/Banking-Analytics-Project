/*TOTAL TRANSACTION AMOUNT BY BRANCH */
SELECT
    `Branch`,
    CONCAT(
        ROUND(SUM(`Amount`) / 1000, 1),
        'K'
    ) AS `Total Transaction Amount`
FROM debit_credit
GROUP BY `Branch`
ORDER BY SUM(`Amount`) DESC;