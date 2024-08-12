/*
Question to Solve : What are the top-paying jobs in IT Field?
- Find and identify top 10 average highest paying job in IT Field
- Remove any nulls data
- why these top 10 have the highest paying rate compared to other ?
*/

WITH top_paying_job AS (
  SELECT
      job_title_short,
      ROUND(AVG(salary_year_avg),0) AS average_salary
  FROM 
      job_postings_fact 
  WHERE
      salary_year_avg IS NOT NULL
  GROUP BY
    job_title_short, job_title
)

SELECT *
FROM (
    SELECT DISTINCT ON (job_title_short)
        job_title_short,
        average_salary
    FROM
        top_paying_job
    ORDER BY 
        job_title_short, average_salary DESC
) AS subquery
ORDER BY 
    average_salary DESC
LIMIT 5;

