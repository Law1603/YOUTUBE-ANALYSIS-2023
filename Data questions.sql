
-- Questions 
-- 1. Which YouTube channels have the highest subscriber count and view count in the last year? 
SELECT TOP 5 Youtuber, subscribers, [video views]
FROM [projects].[dbo].[Global YouTube Statistics]
ORDER BY subscribers DESC, [video views] DESC;

--2. Find the category with the highest average number of video views?
SELECT TOP 1 category, AVG(CAST([video views] AS FLOAT)) AS avg_views
FROM [projects].[dbo].[Global YouTube Statistics]
GROUP BY category
ORDER BY avg_views DESC;

-- 3 Count the number of YouTubers from each country?
SELECT Country, COUNT(*) AS number_of_youtubers
FROM [projects].[dbo].[Global YouTube Statistics]
GROUP BY Country;

-- 4 Find the total number of video views for the 'Music' category?
SELECT SUM(CAST([video views] AS FLOAT)) AS total_views
FROM [projects].[dbo].[Global YouTube Statistics]
WHERE category = 'Music';
--  5 Find the top 3 countries by total subscribers
SELECT TOP 3 Country, SUM(CAST(subscribers AS FLOAT)) AS total_subscribers
FROM [projects].[dbo].[Global YouTube Statistics]
GROUP BY Country
ORDER BY total_subscribers DESC;

-- 6 hIGHEST EARNING YOUTUBER AND COUNTRY
SELECT TOP 5 [Youtuber], [highest_yearly_earnings], [Country]
FROM [projects].[dbo].[Global YouTube Statistics]
ORDER BY CAST([highest_monthly_earnings] AS FLOAT) DESC;

-- 7 Find the top 5 YouTubers by video views in the 'Entertainment' category
SELECT TOP 5 Youtuber, [video views]
FROM [projects].[dbo].[Global YouTube Statistics]
WHERE category = 'Entertainment'
ORDER BY CAST([video views] AS FLOAT) DESC;

-- 8 Find the YouTuber with the highest number of uploads
SELECT TOP 1 Youtuber, uploads
FROM [projects].[dbo].[Global YouTube Statistics]
ORDER BY uploads DESC;

-- 9. Find the top 5 countries with the highest unemployment rate with lowest yealry earnings?
SELECT TOP 5 [Country], AVG(CAST([lowest_yearly_earnings] AS FLOAT)) AS average_earnings, MAX([Unemployment rate]) AS unemployment_rate
FROM [projects].[dbo].[Global YouTube Statistics]
GROUP BY [Country]
ORDER BY average_earnings ASC;

-- 10. Find the average number of video views and subscribers for each channel type?
SELECT channel_type,
       AVG(CAST([video views] AS FLOAT)) AS avg_video_views,
       AVG(CAST(subscribers AS FLOAT)) AS avg_subscribers
FROM [projects].[dbo].[Global YouTube Statistics]
GROUP BY channel_type
ORDER BY avg_video_views DESC;

-- 11 tOP 5 CATEGRORIES ACCORDING TO VIEWS
SELECT  TOP 5 [category], SUM(CAST([video views] AS FLOAT)) AS total_views
FROM [projects].[dbo].[Global YouTube Statistics]
GROUP BY [category]
ORDER BY total_views DESC;

























