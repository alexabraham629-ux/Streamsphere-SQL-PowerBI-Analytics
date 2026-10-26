CREATE DATABASE IF NOT EXISTS Streamsphere;
USE Streamsphere;

DROP TABLE IF EXISTS VIEWING_SESSIONS;
DROP TABLE IF EXISTS PLATFORM_INTERACTION;
DROP TABLE IF EXISTS SUBSCRIPTIONS;
DROP TABLE IF EXISTS CONTENT;
DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS GENRES;

CREATE TABLE GENRES (
    GenreID    INT          NOT NULL AUTO_INCREMENT,
    Genre_Name VARCHAR(100) NOT NULL,
    Description VARCHAR(255),
    PRIMARY KEY (GenreID)
);

CREATE TABLE USERS (
    UserID    INT          NOT NULL AUTO_INCREMENT,
    Age_Group VARCHAR(50)  NOT NULL,
    Region    VARCHAR(100) NOT NULL,
    Join_Date DATE,
    PRIMARY KEY (UserID)
);

CREATE TABLE CONTENT (
    ContentID       INT          NOT NULL AUTO_INCREMENT,
    GenreID         INT          NOT NULL,
    Title           VARCHAR(255) NOT NULL,
    Format          VARCHAR(50)  NOT NULL,
    Promotion_Level VARCHAR(50)  NOT NULL,
    PRIMARY KEY (ContentID),
    FOREIGN KEY (GenreID) REFERENCES GENRES(GenreID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE SUBSCRIPTIONS (
    SubscriptionID INT         NOT NULL AUTO_INCREMENT,
    UserID         INT         NOT NULL,
    Plan_Type      VARCHAR(50),
    Status         VARCHAR(50),
    Renewal_Count  INT DEFAULT 0,
    PRIMARY KEY (SubscriptionID),
    FOREIGN KEY (UserID) REFERENCES USERS(UserID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE VIEWING_SESSIONS (
    SessionID            INT         NOT NULL AUTO_INCREMENT,
    UserID               INT         NOT NULL,
    ContentID            INT         NOT NULL,
    Watch_Date           DATE,
    Day_of_Week          VARCHAR(20),
    Time_of_Day          VARCHAR(20),
    Watch_Durations_Mins INT,
    Completion_Status    VARCHAR(50),
    PRIMARY KEY (SessionID),
    FOREIGN KEY (UserID)    REFERENCES USERS(UserID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (ContentID) REFERENCES CONTENT(ContentID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE PLATFORM_INTERACTION (
    InteractionID    INT          NOT NULL AUTO_INCREMENT,
    UserID           INT          NOT NULL,
    Interaction_Date DATE,
    Action_Type      VARCHAR(100),
    Outcome          VARCHAR(100),
    PRIMARY KEY (InteractionID),
    FOREIGN KEY (UserID) REFERENCES USERS(UserID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


INSERT INTO GENRES (Genre_Name, Description) VALUES
    ('Sci-Fi',         'High-budget futuristic and space adventures'),
    ('Thriller',       'Suspenseful and psychological narratives'),
    ('Comedy',         'Lighthearted and humorous sitcoms'),
    ('Documentary',    'Real-world true crime and nature series'),
    ('Regional Drama', 'Locally produced, culturally relevant storytelling');


INSERT INTO USERS (Age_Group, Region, Join_Date) VALUES
    ('18-24', 'Urban - West',     '2023-01-15'),
    ('25-34', 'Urban - East',     '2023-03-22'),
    ('35-44', 'Suburban - North', '2023-06-10'),
    ('18-24', 'Urban - South',    '2023-08-05'),
    ('45-54', 'Rural - West',     '2023-09-12'),
    ('25-34', 'Urban - North',    '2023-10-01'),
    ('18-24', 'Suburban - East',  '2023-11-20'),
    ('35-44', 'Urban - South',    '2023-12-05'),
    ('25-34', 'Rural - East',     '2024-01-10'),
    ('45-54', 'Suburban - South', '2024-02-14');


INSERT INTO CONTENT (GenreID, Title, Format, Promotion_Level) VALUES
    (1, 'Galactic Wars',     'Series',      'High'),
    (2, 'The Silent Room',   'Movie',       'Medium'),
    (3, 'Laugh Track',       'Short-form',  'Low'),
    (4, 'Ocean Deep',        'Documentary', 'Medium'),
    (5, 'Mumbai Chronicles', 'Series',      'Minimal'),
    (1, 'Cyber City',        'Movie',       'High'),
    (2, 'Midnight Train',    'Short-form',  'Low'),
    (5, 'Kerala Nights',     'Movie',       'Minimal');


INSERT INTO SUBSCRIPTIONS (UserID, Plan_Type, Status, Renewal_Count) VALUES
    (1,  'Annual',  'Active',    1),
    (2,  'Monthly', 'Active',    12),
    (3,  'Annual',  'Active',    0),
    (4,  'Monthly', 'Active',    8),
    (5,  'Monthly', 'Cancelled', 2),
    (6,  'Annual',  'Active',    0),
    (7,  'Monthly', 'Cancelled', 4),
    (8,  'Monthly', 'Active',    5),
    (9,  'Annual',  'Active',    0),
    (10, 'Monthly', 'Active',    3);


INSERT INTO PLATFORM_INTERACTION (UserID, Interaction_Date, Action_Type, Outcome) VALUES
    (1,  '2024-03-01', 'Clicked Recommendation', 'Started Video'),
    (2,  '2024-03-02', 'Searched Title',          'Started Video'),
    (3,  '2024-03-03', 'Browsed Category',        'Started Video'),
    (4,  '2024-03-04', 'Browsed Category',        'Exited App'),
    (4,  '2024-03-04', 'Clicked Recommendation', 'Exited App'),
    (4,  '2024-03-05', 'Searched Title',          'Exited App'),
    (4,  '2024-03-06', 'Browsed Category',        'Exited App'),
    (4,  '2024-03-07', 'Clicked Recommendation', 'Exited App'),
    (4,  '2024-03-07', 'Browsed Category',        'Exited App'),
    (5,  '2024-03-08', 'Searched Title',          'Started Video'),
    (6,  '2024-03-09', 'Clicked Recommendation', 'Started Video'),
    (7,  '2024-03-10', 'Browsed Category',        'Started Video'),
    (8,  '2024-03-11', 'Clicked Recommendation', 'Started Video'),
    (9,  '2024-03-12', 'Searched Title',          'Started Video'),
    (10, '2024-03-13', 'Browsed Category',        'Started Video');


INSERT INTO VIEWING_SESSIONS (UserID, ContentID, Watch_Date, Day_of_Week, Time_of_Day, Watch_Durations_Mins, Completion_Status) VALUES
    (1,  1, '2024-03-01', 'Friday',    'Late Evening', 15,  'Dropped'),
    (2,  1, '2024-03-02', 'Saturday',  'Night',        10,  'Dropped'),
    (6,  1, '2024-03-03', 'Sunday',    'Afternoon',    22,  'Dropped'),
    (8,  1, '2024-03-04', 'Monday',    'Evening',      5,   'Dropped'),
    (2,  5, '2024-03-05', 'Tuesday',   'Evening',      45,  'Completed'),
    (8,  5, '2024-03-06', 'Wednesday', 'Night',        50,  'Completed'),
    (9,  5, '2024-03-07', 'Thursday',  'Late Evening', 42,  'Completed'),
    (10, 5, '2024-03-08', 'Friday',    'Evening',      48,  'Completed'),
    (3,  3, '2024-03-09', 'Saturday',  'Morning',      8,   'Completed'),
    (3,  7, '2024-03-09', 'Saturday',  'Morning',      12,  'Completed'),
    (5,  3, '2024-03-10', 'Sunday',    'Afternoon',    9,   'Completed'),
    (1,  2, '2024-03-11', 'Saturday',  'Night',        120, 'Completed'),
    (1,  4, '2024-03-11', 'Saturday',  'Late Evening', 60,  'Completed'),
    (2,  6, '2024-03-12', 'Sunday',    'Evening',      90,  'Completed'),
    (6,  2, '2024-03-13', 'Monday',    'Night',        30,  'Paused'),
    (8,  8, '2024-03-14', 'Tuesday',   'Evening',      110, 'Completed'),
    (9,  6, '2024-03-15', 'Wednesday', 'Night',        85,  'Completed'),
    (10, 4, '2024-03-16', 'Thursday',  'Morning',      45,  'Paused'),
    (7,  2, '2024-02-15', 'Thursday',  'Night',        110, 'Completed'),
    (7,  4, '2024-02-22', 'Thursday',  'Evening',      30,  'Paused'),
    (7,  6, '2024-02-28', 'Wednesday', 'Afternoon',    15,  'Dropped'),
    (7,  1, '2024-03-05', 'Tuesday',   'Morning',      5,   'Dropped'),
    (5,  1, '2024-03-06', 'Wednesday', 'Night',        10,  'Dropped'),
    (5,  2, '2024-03-07', 'Thursday',  'Evening',      20,  'Dropped'),
    (4,  3, '2024-03-08', 'Friday',    'Afternoon',    7,   'Completed');


-- Row count checks
SELECT 'GENRES'                AS TableName, COUNT(*) AS Total_Rows FROM GENRES
UNION ALL
SELECT 'USERS'                 AS TableName, COUNT(*) AS Total_Rows FROM USERS
UNION ALL
SELECT 'CONTENT'               AS TableName, COUNT(*) AS Total_Rows FROM CONTENT
UNION ALL
SELECT 'SUBSCRIPTIONS'         AS TableName, COUNT(*) AS Total_Rows FROM SUBSCRIPTIONS
UNION ALL
SELECT 'PLATFORM_INTERACTION'  AS TableName, COUNT(*) AS Total_Rows FROM PLATFORM_INTERACTION
UNION ALL
SELECT 'VIEWING_SESSIONS'      AS TableName, COUNT(*) AS Total_Rows FROM VIEWING_SESSIONS;

-- =========================================
--     REPORTS (INITIAL QUERIES)
-- =========================================

-- 1. Content Engagement & Completion Report
SELECT 
    c.Title,
    g.Genre_Name,
    COUNT(vs.SessionID) AS Total_Views,
    SUM(CASE WHEN vs.Completion_Status = 'Completed' THEN 1 ELSE 0 END) * 100.0 / COUNT(vs.SessionID) AS Completion_Rate_Pct
FROM CONTENT c
JOIN GENRES g ON c.GenreID = g.GenreID
JOIN VIEWING_SESSIONS vs ON c.ContentID = vs.ContentID
GROUP BY c.Title, g.Genre_Name
ORDER BY Completion_Rate_Pct DESC;

-- 2. Subscription Health Report
SELECT 
    Plan_Type,
    Status,
    COUNT(SubscriptionID) AS Subscriber_Count,
    AVG(Renewal_Count) AS Avg_Renewals
FROM SUBSCRIPTIONS
GROUP BY Plan_Type, Status;

-- 3. User Interaction Friction Report
SELECT 
    Action_Type,
    Outcome,
    COUNT(*) AS Incident_Count
FROM PLATFORM_INTERACTION
GROUP BY Action_Type, Outcome
ORDER BY Incident_Count DESC;

-- 4. Peak Traffic & Behavioral Heatmap
SELECT 
    Day_of_Week,
    Time_of_Day,
    COUNT(SessionID) AS Total_Active_Sessions
FROM VIEWING_SESSIONS
GROUP BY Day_of_Week, Time_of_Day
ORDER BY Total_Active_Sessions DESC;

-- 5. Demographic Consumption Report
SELECT 
    u.Age_Group,
    COUNT(vs.SessionID) AS Total_Sessions,
    SUM(vs.Watch_Durations_Mins) AS Total_Minutes_Watched
FROM USERS u
JOIN VIEWING_SESSIONS vs ON u.UserID = vs.UserID
GROUP BY u.Age_Group
ORDER BY Total_Minutes_Watched DESC;

-- =========================================
--     ADVANCED ANALYTICAL QUERIES
-- =========================================

-- 6. High Engagement Content (Uses Subquery & HAVING)
-- Goal: Find content titles that have a total watch time greater than the platform's overall average session length.
SELECT 
    c.Title,
    SUM(vs.Watch_Durations_Mins) AS Total_Watch_Time
FROM CONTENT c
JOIN VIEWING_SESSIONS vs ON c.ContentID = vs.ContentID
GROUP BY c.Title
HAVING SUM(vs.Watch_Durations_Mins) > (
    -- Subquery 1: Simply calculates the average watch time across all sessions
    SELECT AVG(Watch_Durations_Mins) 
    FROM VIEWING_SESSIONS
)
ORDER BY Total_Watch_Time DESC;

-- 7. Demographic Deep Dive for Promoted Genres (Uses 3 JOINs & Subquery)
-- Goal: See exactly which user demographics (Age & Region) are watching our highly promoted genres.
SELECT 
    u.Age_Group,
    u.Region,
    g.Genre_Name,
    COUNT(vs.SessionID) AS Total_Views
FROM USERS u
JOIN VIEWING_SESSIONS vs ON u.UserID = vs.UserID
JOIN CONTENT c ON vs.ContentID = c.ContentID
JOIN GENRES g ON c.GenreID = g.GenreID
WHERE c.GenreID IN (
    -- Subquery 2: Filters to only look at genres that contain 'High' promotion level content
    SELECT DISTINCT GenreID 
    FROM CONTENT 
    WHERE Promotion_Level = 'High'
)
GROUP BY u.Age_Group, u.Region, g.Genre_Name
ORDER BY Total_Views DESC;
