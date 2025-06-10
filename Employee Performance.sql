USE `employee_performance` ;

SELECT * FROM employee_performance_satisfaction;

-- Employee Count -- 
SELECT COUNT(*) AS `Employee Count` FROM employee_performance_satisfaction;

-- Avg Performance -- 
SELECT 
    AVG(Performance_Score) AS `Avg Performance`
FROM employee_performance_satisfaction;

SELECT 
    AVG(Satisfaction_Score) AS `Avg Satisfaction`
FROM employee_performance_satisfaction;

-- Turnover -- 
SELECT 
    Turnover_Status,
    COUNT(*) AS Employee_Count,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM employee_performance_satisfaction), 2) AS Percentage
FROM employee_performance_satisfaction
GROUP BY Turnover_Status;

-- Promotion Percentage -- 
SELECT 
    (SUM(CASE WHEN Promotion_Received = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) AS `Promotion Percentage`
FROM 
    employee_performance_satisfaction;

-- Department Satisfaction -- 
SELECT Department, AVG(Satisfaction_Score) AS `Department Satisfaction`
FROM  employee_performance_satisfaction
GROUP BY Department 
ORDER BY Department DESC;

-- Department Performance -- 
SELECT Department, AVG(Performance_Score) AS `Department Performance`
FROM  employee_performance_satisfaction
GROUP BY Department 
ORDER BY Department DESC;

-- Department Engagement Level -- 
SELECT Department, AVG(Engagement_Level) AS `Department Engagement Level `
FROM  employee_performance_satisfaction
GROUP BY Department 
ORDER BY Department DESC;

-- Dep Work Life Balance  -- 
SELECT Department, AVG(Work_Life_Balance_Score) AS `Work Life Balance `
FROM  employee_performance_satisfaction
GROUP BY Department 
ORDER BY Department DESC;

-- Dep Collaboration -- 
SELECT Department, AVG(Collaboration_Score) AS `Avg Collaboration `
FROM  employee_performance_satisfaction
GROUP BY Department 
ORDER BY Department DESC;

-- Promotion by Departement -- 
SELECT 
    Department,
    (SUM(CASE WHEN Promotion_Received = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) AS `Promotion by Departement`
FROM 
    employee_performance_satisfaction
GROUP BY 
    Department
ORDER BY Department DESC;

SELECT 
    Department,
    COUNT(*) AS Promotioned,
    (SUM(CASE WHEN Promotion_Received = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) AS `Promotion by Departement`
FROM 
    employee_performance_satisfaction
GROUP BY 
    Department
ORDER BY Department DESC;

-- Promotion by Departement -- 
SELECT 
    Department,
	COUNT(*) AS Promotioned
FROM 
    employee_performance_satisfaction
WHERE Promotion_Received = 'YES'
GROUP BY 
    Department
ORDER BY Department DESC;

-- Job Title Count -- 
SELECT Job_Title,
	   COUNT(Job_Title) AS `Job Title Count`
FROM employee_performance_satisfaction
GROUP BY Job_Title;

-- Job Title with MAX Performance
SELECT Job_Title, MAX(Performance_Score) AS `MAX Performance`
FROM  employee_performance_satisfaction
GROUP BY Job_Title 
ORDER BY Job_Title  DESC;

-- Avg Satisfactionby Job Title
SELECT Job_Title, AVG(Satisfaction_Score) AS `Avg Satisfaction`
FROM  employee_performance_satisfaction
GROUP BY Job_Title 
ORDER BY Job_Title  DESC;

-- Avg Work Life Balance Job Title
SELECT Job_Title, AVG(Work_Life_Balance_Score) AS `Avg Work Life Balance`
FROM  employee_performance_satisfaction
GROUP BY Job_Title 
ORDER BY Job_Title  DESC;

-- Promotion Count -- 
SELECT 
    Job_Title,
	COUNT(*) AS `Promotion Count`
FROM 
    employee_performance_satisfaction
WHERE Promotion_Received = 'YES'
GROUP BY 
    Job_Title
ORDER BY Job_Title DESC;

-- Title with Training Completed -- 
SELECT 
    Job_Title,
	COUNT(*) AS `Training Completed`
FROM 
    employee_performance_satisfaction
WHERE Training_Completed = 'YES'
GROUP BY 
    Job_Title
ORDER BY Job_Title DESC;

SELECT Name, Job_Title, MAX(Performance_Score) As Performance
FROM  employee_performance_satisfaction
WHERE Performance_Score > 4
GROUP BY Name, Job_Title, Performance_Score
ORDER BY Name DESC
LIMIT 30;

SELECT name, MIN(performance_score) AS `Min Performance`
FROM   employee_performance_satisfaction
GROUP BY name, Performance_Score
ORDER BY Performance_Score ASC
LIMIT 5;

SELECT name, MIN(Engagement_Level) AS `Min Engagement)`
FROM   employee_performance_satisfaction
GROUP BY name, Satisfaction_Score
ORDER BY Satisfaction_Score DESC
LIMIT 5;

SELECT name, Min(Collaboration_Score) AS `Min Collaboration)`
FROM   employee_performance_satisfaction
WHERE Collaboration_Score < 2
GROUP BY name, Collaboration_Score
ORDER BY Collaboration_Score ASC
LIMIT 5;


SELECT name, Min(Satisfaction_Score) AS `Min Satisfaction Score)`
FROM   employee_performance_satisfaction
GROUP BY name, Satisfaction_Score
ORDER BY Satisfaction_Score ASC
LIMIT 5;


SELECT name, MAX(Collaboration_Score) AS `MAX Collaboration`, MAX(Performance_Score) AS `MAX Performance`
FROM   employee_performance_satisfaction
GROUP BY name, Collaboration_Score
ORDER BY Collaboration_Score DESC
LIMIT 10;
