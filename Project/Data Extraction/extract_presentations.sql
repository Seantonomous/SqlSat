
INSERT INTO dbo.class
SELECT presenterId, _Session_Name_, _Duration__min__, _Level_, _Synopsis_, eventId
FROM person LEFT JOIN presenter
	ON id = personId
INNER JOIN temp_dallas_2018_sessions
	ON firstName = _First_Name_ AND lastName = _Last_Name_
INNER JOIN sqlEvent
	ON sqlEvent.date = CONVERT(date, _Date_of_Event_)

INSERT INTO dbo.class
SELECT presenterId, Session_Name, Duration__min_, Level, Synopsis, eventId
FROM person LEFT JOIN presenter
	ON id = personId
INNER JOIN temp_la_2018_sessions
	ON firstName = First_Name AND lastName = Last_Name
INNER JOIN sqlEvent
	ON sqlEvent.date = CONVERT(date, Date_of_Event)

INSERT INTO dbo.class
SELECT presenterId, Session_Name, Duration__min_, Level, Synopsis, eventId
FROM person LEFT JOIN presenter
	ON id = personId
INNER JOIN temp_la_2017_sessions
	ON firstName = First_Name AND lastName = Last_Name
INNER JOIN sqlEvent
	ON sqlEvent.date = CONVERT(date, Date_of_Event)