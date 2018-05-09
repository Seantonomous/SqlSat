USE db25
GO


INSERT INTO dbo.person(firstName, lastName, addressId, email)
SELECT firstName, lastName, addressId, email
FROM addressTable LEFT JOIN attendees
	ON streetAddress = taddress AND addressTable.city = attendees.city

INSERT INTO dbo.person(firstName, lastName, addressId, email)
SELECT First_Name, Last_Name, 101, 'UNKNOWN'
FROM dbo.temp_la_2017_sessions
WHERE NOT EXISTS (SELECT firstName, lastName FROM dbo.person WHERE firstName = First_Name AND lastName = Last_Name)

INSERT INTO dbo.person(firstName, lastName, addressId, email)
SELECT _First_Name_, _Last_Name_, 101, 'UNKNOWN'
FROM dbo.temp_dallas_2018_sessions
WHERE NOT EXISTS (SELECT firstName, lastName FROM dbo.person WHERE firstName = _First_Name_ AND lastName = _Last_Name_)

INSERT INTO dbo.person(firstName, lastName, addressId, email)
SELECT First_Name, Last_Name, 101, 'UNKNOWN'
FROM dbo.temp_la_2018_sessions
WHERE NOT EXISTS (SELECT firstName, lastName FROM dbo.person WHERE firstName = First_Name AND lastName = Last_Name)
