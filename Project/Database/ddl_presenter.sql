USE db25
GO

IF OBJECT_ID (N'presenter', N'U') IS NOT NULL
	DROP TABLE presenter

CREATE TABLE presenter (
	[id]		int identity(1,1) not null,
	[personId]	int	not null,

	primary key clustered ([id] ASC),
	foreign key ([personId]) references person(id)
);