/*
Question to Solve : What are the top-paying jobs in IT Field?
- Find and identify top 5 highest paying job in IT Field
- Remove any nulls data
- why these top 5 have the highest paying rate compared to other ?
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

SELECT * FROM top_paying_job;
