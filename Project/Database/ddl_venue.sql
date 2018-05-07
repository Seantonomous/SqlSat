USE db25
GO

IF OBJECT_ID (N'venue', N'U') IS NOT NULL
	DROP TABLE venue

create table venue
    (	[id]		int identity(1,1) not null,
		[name]			varchar(255)	not null,
		[address]		varchar(75)		not null,
        [city]			varchar(50)		not null,
		[zip]			varchar(15)		not null,
		[state]			varchar(30)		not null,
        [country]		varchar(50)		not null,

		primary key clustered ([id] ASC)
    )