/* ----------------------------------- CTE ---------------------------------- */

WITH january_jobs AS (
  SELECT * FROM job_postings_fact
  WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)

SELECT * FROM january_jobs

WITH total_job_offered AS (
  SELECT 
    company_id,
    count(*) as total_offer
  FROM 
    job_postings_fact
  GROUP BY
    company_id
)

SELECT 
  company_dim.name as company_name,
  total_job_offered.total_offer
FROM 
  company_dim
LEFT JOIN 
  total_job_offered ON total_job_offered.company_id = company_dim.company_id
ORDER BY
  total_offer DESC

/* ------------------------------- subqueries ------------------------------- */

SELECT 
  company_id,
  name as company_name
FROM 
  company_dim 
WHERE
  company_id IN (
    SELECT 
      company_id
    FROM 
      job_postings_fact
    WHERE
      job_no_degree_mention = true
    ORDER BY
      company_id ASC
  )

/* ------------------------------- Practice 1 ------------------------------- */

SELECT * FROM skills_job_dim
