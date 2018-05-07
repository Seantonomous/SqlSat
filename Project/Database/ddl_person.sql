USE db25
GO

IF OBJECT_ID (N'person', N'U') IS NOT NULL
	DROP TABLE person

create table person
    ([id] int identity (1,1),
        [firstName]		varchar(30)		not null,
        [lastName]		varchar(50)		not null,
        [address]		varchar(50)		not null,
        [city]			varchar(50)		not null,
		[zip]			varchar(10)		not null,
		[state]			varchar(30)		not null,
		[email]			varchar(254)	not null,

		constraint PK_ID primary key clustered ([id] ASC)
    )