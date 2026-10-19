/*Suspicious Transaction Frequency*/

SELECT
    DATE_FORMAT(
        STR_TO_DATE(`Transaction Date`, '%d-%m-%Y'),
        '%M'
    ) AS `Month`,
    FORMAT(COUNT(*), 0) AS `Suspicious Transaction Frequency`
FROM debit_credit
GROUP BY
    MONTH(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y')),
    DATE_FORMAT(
        STR_TO_DATE(`Transaction Date`, '%d-%m-%Y'),
        '%M'
    )
ORDER BY MONTH(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y'));