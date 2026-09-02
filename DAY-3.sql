--  write a query to report median of the searches made by user round median to one decimal point

CREATE TABLE search_frequency (
    searches INT,
    num_users INT
);

INSERT INTO search_frequency (searches, num_users)
VALUES
    (1, 2),
    (2, 2),
    (3, 3),
    (4, 1);

    SELECT * FROM search_frequency;

-- Main Query
WITH cte AS (
    SELECT 
        searches,
        num_users,

        -- Running total of users
        SUM(num_users) OVER (ORDER BY searches) AS cumulative_users,

        -- Total number of users
        SUM(num_users) OVER () AS total_users

    FROM search_frequency
)
SELECT ROUND(AVG(searches), 1) AS median
FROM cte
  
-- Select the middle value(s)
WHERE cumulative_users >= total_users / 2
  AND cumulative_users - num_users < total_users / 2 + 1;
