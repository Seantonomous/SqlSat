USE db25
GO

INSERT INTO dbo.presenter
SELECT id FROM person
INNER JOIN temp_la_2017_sessions ON temp_la_2017_sessions.First_Name = person.firstName AND temp_la_2017_sessions.Last_Name = person.lastName
WHERE NOT EXISTS (SELECT personId FROM presenter WHERE personId = id)

INSERT INTO dbo.presenter
SELECT id FROM person
INNER JOIN temp_la_2018_sessions ON temp_la_2018_sessions.First_Name = person.firstName AND temp_la_2018_sessions.Last_Name = person.lastName
WHERE NOT EXISTS (SELECT personId FROM presenter WHERE personId = id)

INSERT INTO dbo.presenter
SELECT id FROM person
INNER JOIN temp_dallas_2018_sessions ON temp_dallas_2018_sessions._First_Name_ = person.firstName AND temp_dallas_2018_sessions._Last_Name_ = person.lastName
WHERE NOT EXISTS (SELECT personId FROM presenter WHERE personId = id)