/* High-Risk Transaction Flag*/

SELECT
    CASE
        WHEN `Amount` > 4000 THEN 'High Risk'
        ELSE 'Normal'
    END AS `Risk Flag`,
    CONCAT(
        ROUND(
            COUNT(*) * 100.0 / (SELECT COUNT(*) FROM debit_credit),
            2
        ),
        '%'
    ) AS `Percentage`
FROM debit_credit
GROUP BY
    CASE
        WHEN `Amount` > 4000 THEN 'High Risk'
        ELSE 'Normal'
    END;