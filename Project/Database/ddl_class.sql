USE db25
GO

IF OBJECT_ID (N'class', N'U') IS NOT NULL
	DROP TABLE class

CREATE TABLE class (
	[id]		int identity(1,1) not null,
	[presenterId]	int				not null,
	[name]			varchar(75)		not null,
	[duration]		smallint		not null,
	[level]			tinyint			not null,
	[synopsis]		varchar(1000)	not null,
	[venueId]		int				not null

	primary key clustered ([id] ASC),
	foreign key ([presenterId]) references presenter(id),
	foreign key ([venueId]) references venue(id)
	)