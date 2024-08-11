SELECT 
 COUNT(job_title_short) AS job_available,
  CASE
    WHEN job_location = 'Anywhere' THEN 'Remote'
    WHEN job_location = 'United States' THEN 'Local'
    ELSE 'Out Country'
  END AS category
FROM
  job_postings_fact
WHERE
  job_title_short = 'Data Analyst'
GROUP BY 
  category


/* ------------------------------- Practice 1 ------------------------------- */

SELECT 
  job_title_short, job_location,
  CASE 
    WHEN salary_year_avg > 30000 THEN 'High Paying'
    WHEN salary_year_avg BETWEEN 20000 AND 30000  THEN 'Medium Paying'
    ELSE 'Low Paying'
  END AS Salary_Category 
FROM 
  job_postings_fact
WHERE
  job_title_short = 'Data Analyst'
ORDER BY
  salary_year_avg ASC

SELECT job_title_short, salary_year_avg
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC 
