/*
Question to Solve : What skills are most in demand in the market?
- Find and identify top 10 most frequent/demanded skills for programming
- Use all jobs posting
- Remove any nulls data
- Give reason why this top 10 most demanded in the market
*/

SELECT
  skills,
  COUNT(skills_job_dim.job_id) AS demand_count
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
  skills_dim.type IN (
    'programming'/*,
    'databases',
    'cloud',
    'libraries',
    'webframeworks',
    'os',
    'analyst_tools',
    'async'*/
    )
GROUP BY 
  skills_dim.skills
ORDER BY 
  demand_count DESC
LIMIT 10;
