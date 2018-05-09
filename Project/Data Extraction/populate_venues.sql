INSERT INTO addressTable VALUES('13031 W. Jefferson Blvd Suite 200', 'Los Angeles',  ' 90094', 'California', 'United States')

INSERT INTO dbo.venue(name, addressId)
SELECT 'Microsoft Technology Center aka MTC', addressId
FROM addressTable WHERE streetAddress = '13031 W. Jefferson Blvd Suite 200'

-------------------------------------------------------------------------------
INSERT INTO addressTable VALUES('1 LMU Drive, Los Angeles', 'Los Angeles', '90045', 'California', 'United States')

INSERT INTO dbo.venue(name, addressId)
SELECT 'Loyola Marymount University (""LMU"")', addressId
FROM addressTable WHERE streetAddress = '1 LMU Drive, Los Angeles'

-------------------------------------------------------------------------------
INSERT INTO addressTable VALUES('800 W. Campbell Road', 'Richardson', '75080', 'Dallas', 'Texas')

INSERT INTO dbo.venue(name, addressId)
SELECT 'UTDallas, The Erik Jonsson School of Engineering and Computer Science', addressId
FROM addressTable WHERE streetAddress = '800 W. Campbell Road'