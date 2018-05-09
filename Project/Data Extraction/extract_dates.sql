INSERT INTO dbo.sqlEvent
SELECT TOP 1 CONVERT(date, _Date_of_Event_), 3
FROM dbo.temp_dallas_2018_sessions

INSERT INTO dbo.sqlEvent
SELECT TOP 1 CONVERT(date, Date_of_Event), 2
FROM dbo.temp_la_2018_sessions

INSERT INTO dbo.sqlEvent
SELECT TOP 1 CONVERT(date, Date_of_Event), 1
FROM dbo.temp_la_2017_sessions


