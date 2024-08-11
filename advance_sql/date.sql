SELECT
  COUNT(job_id) AS total_job_posted,
  EXTRACT(MONTH FROM job_posted_date) AS month
FROM 
  job_postings_fact
GROUP BY 
  month
ORDER BY
  month DESC;