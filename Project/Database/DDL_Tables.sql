-------------------------------------------------------------------------
IF OBJECT_ID (N'person', N'U') IS NOT NULL
	DROP TABLE person

create table person
    (	[id]			int identity (1,1) not null,
        [firstName]		varchar(30)		not null,
        [lastName]		varchar(50)		not null,
        [addressId]		int				not null,
		[email]			varchar(254)	not null,

		constraint pk_personId primary key clustered ([id] ASC)
    )

create unique nonclustered index ak_name on person (firstName, lastName)

-------------------------------------------------------------------------
IF OBJECT_ID (N'addressTable', N'U') IS NOT NULL
	DROP TABLE addressTable

create table addressTable 
	(	[addressId]		int identity(1,1) not null,
		[streetAddress]	varchar(255) not null,
		[city]			varchar(75) not null,
		[zip]			varchar(10) not null,
		[addressState]	varchar(50),
		[country]		varchar(75) not null,

		constraint pk_id primary key (addressId) 
	)

create unique nonclustered index ak_address on addressTable(streetAddress, city)

---------------------------------------------------------------
IF OBJECT_ID (N'sqlEvent', N'U') IS NOT NULL
	DROP TABLE SqlSaturdayEvent 

CREATE TABLE sqlEvent
	(	[eventId]		int	identity(1,1) not null,
        [date]			date		not null,
        [venueId]		int			not null,

		constraint pk_eventId primary key clustered ([eventId] ASC),
        constraint fk_venue foreign key (venueId)
            references venue(id)
    )

----------------------------------------------------------------
IF OBJECT_ID (N'venue', N'U') IS NOT NULL
	DROP TABLE venue

create table venue
    (	[venueId]			int identity(1,1) not null,
		[name]				varchar(255)	not null,
		[addressId]			int				not null,

		constraint pk_venueId primary key clustered ([venueId] ASC),
		constraint fk_addressId foreign key (addressId)
			references addressTable(addressId)
    )

create unique nonclustered index ak_venue on venue (name)

---------------------------------------------------------------
IF OBJECT_ID (N'organizer', N'U') IS NOT NULL
	DROP TABLE organizer

create table organizer
    (	[personId]		int not null,
        [eventId]		int not null,

		constraint pk_personEvent primary key (personId, eventId),
        constraint fk_person foreign key (personId)
            references person(id),
        constraint fk_event foreign key (eventId)
            references sqlEvent(eventId)
    )

---------------------------------------------------------------
IF OBJECT_ID (N'volunteer', N'U') IS NOT NULL
	DROP TABLE volunteer

create table volunteer
    (	[personId] int not null,
        [eventId] int not null,

		constraint pk_personEvent primary key (personId, eventId),
        constraint fk_person foreign key (personId)
            references person(id),
        constraint fk_event foreign key (eventId)
            references sqlEvent(eventId)
    )

------------------------------------------------------------
IF OBJECT_ID (N'vendor', N'U') IS NOT NULL
	DROP TABLE vendor

CREATE TABLE vendor (
	[vendorId]	int identity(1,1) not null,
	[name]		varchar(50)		not null,

	constraint pk_vendorId primary key clustered([vendorId] ASC)
	)

create unique nonclustered index ak_vendor on vendor (name)

-------------------------------------------------------------
IF OBJECT_ID (N'eventTable', N'U') IS NOT NULL
	DROP TABLE eventTable

create table eventTable
    (	[tableId]		int identity(1,1) not null,
		[tableNumber]	int not null,
        [eventId]		int not null,

		constraint pk_tableId primary key (tableId),
        constraint fk_event foreign key (eventId)
            references sqlEvent(eventId)
    )

---------------------------------------------------------------
IF OBJECT_ID (N'vendorTable', N'U') IS NOT NULL
	DROP TABLE vendorTable

create table vendorTable
    (	[vendorId]		int not null,
        [tableId]		int not null,

		constraint pk_vendorTable primary key (vendorId, tableId),
        constraint fk_vendor foreign key (vendorId)
            references vendor(vendorId),
        constraint fk_table foreign key (tableId)
            references eventTable(tableId)
    )

---------------------------------------------------------------
IF OBJECT_ID (N'presenter', N'U') IS NOT NULL
	DROP TABLE presenter

CREATE TABLE presenter (
	[presenterId]		int identity(1,1) not null,
	[personId]			int	not null,

	constraint pk_presenterId primary key clustered ([presenterId] ASC),
	constraint fk_person foreign key ([personId]) references person(id)
);

---------------------------------------------------------------
IF OBJECT_ID (N'room', N'U') IS NOT NULL
	DROP TABLE room

create table room 
    (	[roomId]		int identity(1,1) not null,
        [roomNumber]	int,
        [roomName]		varchar(100),
        [capacity]		int not null,
        [venueId]		int not null,

		constraint pk_roomId primary key clustered ([roomId] ASC),
        constraint fk_venue foreign key (venueId)
            references venue(venueId)
    )

---------------------------------------------------------------
IF OBJECT_ID (N'class', N'U') IS NOT NULL
	DROP TABLE class

CREATE TABLE class (
	[classId]		int identity(1,1) not null,
	[presenterId]	int				not null,
	[name]			varchar(75)		not null,
	[duration]		smallint		not null,
	[level]			tinyint			not null,
	[synopsis]		varchar(1000)	not null,
	[eventId]		int				not null

	constraint pk_classId primary key clustered ([classId] ASC),
	constraint fk_presenter foreign key ([presenterId]) references presenter(presenterId),
	constraint fk_event foreign key ([eventId]) references sqlEvent(eventId)
	)

-----------------------------------------------------------------------
IF OBJECT_ID (N'track', N'U') IS NOT NULL
	DROP TABLE track

create table track (
		[trackId]	int identity(1,1) not null,
        [title]		varchar(50)	not null,

		constraint pk_trackId primary key clustered ([trackId] ASC)
    )

create unique nonclustered index ak_title on track (title)

-----------------------------------------------------------------------
IF OBJECT_ID (N'classTrack', N'U') IS NOT NULL
	DROP TABLE classTrack

create table classTrack
    (	[trackId]	int not null,
        [classId]	int not null,

        constraint fk_track foreign key (trackId)
            references track(trackId),
        constraint fk_class foreign key (classId)
            references class(classId),
        constraint pk_classTrack primary key (trackId, classId)
    )



