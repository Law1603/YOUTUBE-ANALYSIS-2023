SELECT *
  FROM [projects].[dbo].[Global YouTube Statistics]

 SELECT title
 FROM [projects].[dbo].[Global YouTube Statistics]

 DELETE FROM [projects].[dbo].[Global YouTube Statistics]
 WHERE [subscribers_for_last_30_days] IS NULL OR [Longitude] IS NULL;

 UPDATE [projects].[dbo].[Global YouTube Statistics]
 SET Longitude = COALESCE(Longitude, 'Default Value'),
    Latitude = COALESCE(Latitude, 'Default Value');
	
	
WITH Duplicate_Rows AS (
  SELECT
    ROW_NUMBER() OVER (PARTITION BY rank, Youtuber, subscribers ORDER BY (SELECT NULL)) AS RowNum,
    *
  FROM [projects].[dbo].[Global YouTube Statistics]
)
DELETE FROM Duplicate_Rows
WHERE RowNum > 1;

