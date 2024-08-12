/*Question to Solve : Which skills are associated with higher salaries in the top 10 IT Field?
- Find and identify top 10 skills that contribute to higher salary
- Use all jobs posting that remote
- Remove any nulls data
- Create Visualization
*/

SELECT
  skills,
  ROUND(AVG(salary_year_avg),0) AS salary
FROM
  job_postings_fact
INNER JOIN 
  skills_job_dim 
ON 
  job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN 
  skills_dim 
ON 
  skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
   job_title_short IN (
  'Business Analyst'
  /*'Cloud Engineer', 
  'Data Analyst', 
  'Data Engineer', 
  'Data Scientist', 
  'Machine Learning Engineer', 
  'Senior Data Analyst', 
  'Senior Data Engineer', 
  'Senior Data Science', 
  'Software Engineer'*/)
AND
  salary_year_avg is NOT NULL
AND 
  job_location = 'Anywhere'
GROUP BY 
  skills
ORDER BY 
  salary DESC
LIMIT 10;
