/*Transaction Method Distribution*/

SELECT
    `Transaction Method`,
    CONCAT(
        ROUND(
            COUNT(*) * 100.0 / (SELECT COUNT(*) FROM debit_credit),
            2
        ),
        '%'
    ) AS ` Percentage Distribution `
FROM debit_credit
GROUP BY `Transaction Method`
ORDER BY COUNT(*) DESC;