/* -------------------------------- Problem 1 ------------------------------- */
SELECT 
    job_schedule_type,  
    AVG(salary_year_avg) AS average_yearly_salary,
    AVG(salary_hour_avg) AS average_hour_salary
FROM 
    job_postings_fact
WHERE 
    job_posted_date::DATE > '2023-06-01'
GROUP BY 
    job_schedule_type
HAVING 
    job_schedule_type IS NOT NULL 
    AND AVG(salary_hour_avg) IS NOT NULL
    AND AVG(salary_year_avg) IS NOT NULL;

/* -------------------------------- Problem 2 ------------------------------- */

SELECT 
    COUNT(job_id) AS job_count, 
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month
FROM 
    job_postings_fact
WHERE 
    EXTRACT(YEAR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') = 2023
GROUP BY 
    MONTH
ORDER BY 
    MONTH ASC;

/* -------------------------------- Problem 3 ------------------------------- */

SELECT 
    c.name, 
    j.job_title_short
FROM 
    company_dim c 
JOIN 
    job_postings_fact j
ON 
    c.company_id = j.company_id
WHERE 
    EXTRACT(QUARTER FROM j.job_posted_date) = 2
    AND EXTRACT(YEAR FROM j.job_posted_date) = 2023
    AND job_title_short = 'Health Insurance'
ORDER BY 
    c.name;
