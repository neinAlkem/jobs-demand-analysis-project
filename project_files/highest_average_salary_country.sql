SELECT 
  job_country,
  ROUND(AVG(salary_year_avg),0) AS average_salary
FROM
  job_postings_fact
WHERE
  salary_year_avg is NOT NULL
  AND job_country is NOT NULL
GROUP BY
  job_country
ORDER BY
  average_salary DESC
LIMIT 10