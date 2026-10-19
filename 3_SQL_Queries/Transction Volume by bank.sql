/* Transaction Volume by Bank */
SELECT
    `Bank Name`,
    CONCAT(
        ROUND(SUM(`Amount`) / 1000, 1),
        'K'
    ) AS `Transaction Volume`
FROM debit_credit
GROUP BY `Bank Name`
ORDER BY SUM(`Amount`) DESC;