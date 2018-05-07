USE db25
GO

IF OBJECT_ID (N'sqlEvent', N'U') IS NOT NULL
	DROP TABLE SqlSaturdayEvent 

CREATE TABLE sqlEvent
	(	[id]		int	identity(1,1) not null,
        [date]		date		not null,
        [venueId]	int			not null,

		constraint PK_ID primary key clustered ([id] ASC),
        constraint FK_Venue foreign key (venueId)
            references venue(id)
    )