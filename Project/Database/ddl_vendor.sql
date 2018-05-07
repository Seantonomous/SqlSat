USE db25
GO

IF OBJECT_ID (N'vendor', N'U') IS NOT NULL
	DROP TABLE vendor

CREATE TABLE vendor (
	[id]		int identity(1,1) not null,
	[name]		varchar(50)		not null,
	[eventId]	int				not null,
	[tableId]	int				not null

	primary key clustered([id] ASC),
	foreign key ([eventId]) references sqlEvent(id),
	foreign key ([tableId]) references sqlTable(id)
	)