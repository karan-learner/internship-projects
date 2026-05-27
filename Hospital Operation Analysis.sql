-- Key Performance Indicators 
SELECT 
    -- 1. Avg Waiting Time
    ROUND(AVG(Waiting_Time_Minutes), 2) AS Avg_Waiting_Time_Minutes,

    -- 2. Total Patient Load
    (SUM(Daily_Outpatients) + SUM(Monthly_Admissions) + SUM(Emergency_Cases)) 
    AS Total_Patient_Load,

    -- 3. Staff Availability
    (SUM(Total_Doctors) + SUM(Nurses) + SUM(Paramedical_Staff)) 
    AS Total_Staff,

    -- 4. Estimated Bed Utilization
    ROUND(SUM(Monthly_Admissions) / SUM(Total_Beds), 2) 
    AS Estimated_Bed_Utilization,

    -- 5. Avg Length of Stay
    ROUND(AVG(Average_Length_of_Stay), 2) 
    AS Avg_Length_of_Stay_Days,

    -- 6. Patient Satisfaction
    ROUND(AVG(Patient_Satisfaction_Score), 2) 
    AS Avg_Patient_Satisfaction
FROM hospital_operations;

-- Analysis
-- Patient Load vs Capacity
SELECT 
    Hospital_Type,
    SUM(Total_Beds) AS Total_Beds,
    SUM(Monthly_Admissions) AS Total_Admissions
FROM hospital_operations
GROUP BY Hospital_Type;

-- Operational Efficiency
SELECT 
    Hospital_Type,
    ROUND(AVG(Waiting_Time_Minutes),2) AS Avg_Wait_Time
FROM hospital_operations
GROUP BY Hospital_Type
ORDER BY Avg_Wait_Time DESC;

-- Staff Sufficiency 
SELECT 
    Hospital_Name,
    (Total_Doctors + Nurses + Paramedical_Staff) AS Total_Staff,
    (Daily_Outpatients + Monthly_Admissions + Emergency_Cases) AS Patient_Load
FROM hospital_operations;

-- Waiting Time Impact 
SELECT 
    Hospital_Name,
    Waiting_Time_Minutes,
    Patient_Satisfaction_Score
FROM hospital_operations;

-- Emergency Preparedness 
SELECT 
    Emergency_Department,
    COUNT(*) AS Hospital_Count
FROM hospital_operations
GROUP BY Emergency_Department;

-- Operational Efficiency 
SELECT 
    Sector,
    ROUND(AVG(Average_Length_of_Stay),2) AS Avg_Stay
FROM hospital_operations
GROUP BY Sector;

-- Operational Efficiency 
SELECT 
    Hospital_Type,
    SUM(Surgeries_Per_Month) AS Total_Surgeries
FROM hospital_operations
GROUP BY Hospital_Type;
