INSERT INTO vendor
SELECT Sponsor FROM temp_dallas_2018_sponsors
WHERE NOT EXISTS(SELECT name FROM vendor WHERE name = sponsor)

INSERT INTO vendor
SELECT Sponsor FROM temp_la_2018_sponsors
WHERE NOT EXISTS(SELECT name FROM vendor WHERE name = sponsor)

INSERT INTO vendor
SELECT Sponsor FROM temp_la_2017_sponsors
WHERE NOT EXISTS(SELECT name FROM vendor WHERE name = sponsor)

--Populate event tables table for la 2017
INSERT INTO eventTable
SELECT table__, eventId
FROM temp_la_2017_sponsors
INNER JOIN sqlEvent
	ON CONVERT(date, Date_Of_Event) = sqlEvent.date

--Populate event tables table for la 2017
INSERT INTO eventTable
SELECT table__, eventId
FROM temp_la_2018_sponsors
INNER JOIN sqlEvent
	ON CONVERT(date, Date_Of_Event) = sqlEvent.date

--Populate event tables table for la 2017
INSERT INTO eventTable
SELECT table__, eventId
FROM temp_dallas_2018_sponsors
INNER JOIN sqlEvent
	ON CONVERT(date, Date_Of_Event) = sqlEvent.date

-------------------------------------------------------------------
--Populate vendorTable linking table

INSERT INTO vendorTable
SELECT vendorId, tableId
FROM temp_dallas_2018_sponsors
INNER JOIN sqlEvent
	ON CONVERT(DATE, Date_of_Event) = sqlEvent.date
INNER JOIN eventTable
	ON table__ = tableNumber AND eventTable.eventId = sqlEvent.eventId
INNER JOIN vendor
	ON sponsor = vendor.name

INSERT INTO vendorTable
SELECT vendorId, tableId
FROM temp_la_2017_sponsors
INNER JOIN sqlEvent
	ON CONVERT(DATE, Date_of_Event) = sqlEvent.date
INNER JOIN eventTable
	ON table__ = tableNumber AND eventTable.eventId = sqlEvent.eventId
INNER JOIN vendor
	ON sponsor = vendor.name

INSERT INTO vendorTable
SELECT vendorId, tableId
FROM temp_la_2018_sponsors
INNER JOIN sqlEvent
	ON CONVERT(DATE, Date_of_Event) = sqlEvent.date
INNER JOIN eventTable
	ON table__ = tableNumber AND eventTable.eventId = sqlEvent.eventId
INNER JOIN vendor
	ON sponsor = vendor.name



