/*
Question to Solve : What skills are required for these high-paying IT jobs?
- Find and identify the top 5 skills needed for each high paying tech job
*/

WITH top_paying_job AS (
  SELECT
      job_id,
      job_title_short,
      job_title,
      salary_year_avg,
      company_dim.name AS company_name
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
)
SELECT 
    top_paying_job.job_title_short, 
    skills_dim.skills, 
    COUNT(*) AS skill_frequency
FROM 
    top_paying_job
INNER JOIN 
    skills_job_dim 
ON 
    top_paying_job.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim 
ON 
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE
  job_title_short IN (
  'Senior Data Science'/*, 
  'Data Scientist',  
  'Senior Data Analyst', 
  'Senior Data Engineer', 
  'Senior Data Science'*/
  )
GROUP BY
  top_paying_job.job_title_short, skills_dim.skills
ORDER BY
  top_paying_job.job_title_short DESC, skill_frequency DESC
LIMIT 5





