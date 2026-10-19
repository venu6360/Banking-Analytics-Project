/*Branch Transaction Growth*/


WITH monthly_branch AS (
    SELECT
        `Branch`,
        MONTH(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y')) AS `Month No`,
        DATE_FORMAT(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y'), '%b') AS `Month`,
        SUM(`Amount`) AS `Transaction Amount`
    FROM debit_credit
    GROUP BY
        `Branch`,
        MONTH(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y')),
        DATE_FORMAT(STR_TO_DATE(`Transaction Date`, '%d-%m-%Y'), '%b')
),
growth AS (
    SELECT
        `Branch`,
        `Month`,
        `Month No`,
        `Transaction Amount`,
        LAG(`Transaction Amount`) OVER (
            PARTITION BY `Branch`
            ORDER BY `Month No`
        ) AS `Previous Month Amount`
    FROM monthly_branch
)
SELECT
    `Branch`,
    `Month`,
    CONCAT(
        ROUND(
            (`Transaction Amount` - `Previous Month Amount`)
            / `Previous Month Amount` * 100,
            2
        ),
        '%'
    ) AS `Branch Transaction Growth Rate`
FROM growth
WHERE `Previous Month Amount` IS NOT NULL
ORDER BY `Branch`, `Month No`;