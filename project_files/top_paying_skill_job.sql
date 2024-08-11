/*
Question to Solve : What skills are required for these high-paying IT jobs?
- Find and identify the top skills needed for high paying tech job
- Create Visualization
*/

WITH top_paying_job AS(
  SELECT DISTINCT ON(job_title_short)
      job_title_short,
      job_title,
      salary_year_avg,
      name AS company_name
  FROM 
      job_postings_fact 
  LEFT JOIN 
      company_dim
  ON
      job_postings_fact.company_id = company_dim.company_id
  WHERE
      salary_year_avg IS NOT NULL
  ORDER BY 
      job_title_short, salary_year_avg DESC
  LIMIT 10
)

SELECT * FROM 
  top_paying_job
INNER JOIN


