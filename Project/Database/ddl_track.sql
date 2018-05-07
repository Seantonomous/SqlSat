USE db25
GO

IF OBJECT_ID (N'track', N'U') IS NOT NULL
	DROP TABLE track

create table track (
		id		int identity(1,1) not null,
        title	varchar(50)	not null,

		primary key clustered ([id] ASC)
    )