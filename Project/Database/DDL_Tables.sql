create table person
    (id int primary key nonclustered not null,
        firstName varchar(20) not null,
        lastName varchar(25) not null,
        gender varchar(1) not null,
        email varchar(254) not null
        address varchar(100) not null,
        cityId int not null,
        countryId int not null,
        constraint FK_City foreign key (cityId),
            references city(id),
        constraint FK_Country foreign key (countryId)
            references country(id)
    )

create table city
    (id int primary key nonclustered not null,
        name varchar(100) not null,
        region varchar(100) not null,
        countryId int not null,
        constraint FK_Country foreign key (countryId)
            references country(id)
    )

create table country
    (id int primary key nonclustered not null,
        name varchar(100) not null
    )

create table sqlSaturdayEvent
    (id int primary key nonclustered not null,
        eventStart datetime2 not null,
        eventEnd datetime2 not null,
        venueId not null,
        constraint FK_Venue foreign key (venueId)
            references venue(id)
    )

create table venue
    (id int primary key nonclustered not null,
        name varchar(100) not null,
        address varchar(100) not null,
        zip varchar(10) not null,
        cityId int not null,
        countryId int not null,
        constraint FK_City foreign key (cityId)
            references city(id),
        constraint FK_Country foreign key (countryId)
            references country(id)
    )

create table student
    (id int primary key nonclustered not null,
        personId int not null,
        companyId int not null,
        constraint FK_Person foreign key (personId)
            references person(id),
        constraint FK_Company foreign key (companyId)
            references company(id)
    )

create table company
    (id int primary key nonclustered not null,
        name varchar(50) not null,
        description varchar(200) not null,
        address varchar(100) not null,
        zip varchar(10) not null,
        cityId int not null,
        countryId int not null,
        constraint FK_City foreign key (cityId)
            references city(id),
        constraint FK_Country foreign key (countryId)
            references country(id)
    )

create table organizer
    (id int primary key nonclustered not null,
        personId int not null,
        eventId int not null,
        constraint FK_Person foreign key (personId)
            references person(id),
        constraint FK_Event foreign key (eventId)
            references sqlSaturdayEvent(id)
    )

create table volunteer
    (id int primary key nonclustered not null,
        personId int not null,
        eventId int not null,
        constraint FK_Person foreign key (personId)
            references person(id),
        constraint FK_Event foreign key (eventId)
            references sqlSaturdayEvent(id)
    )


create table vendor
    (id int primary key nonclustered not null,
        personId int not null,
        companyId int not null
    )

create table rafflePrize
    (id int primary key nonclustered not null,
        item varchar(50) int not null,
        vendorId int not null,
        eventId int not null,
        


create table eventTable
    (id int primary key nonclustered not null,
        venueId int not null,
        tableDate date not null,
        location varchar(50),
        constraint FK_Venue foreign key (venueId)
            references venue(id)
    )

create table vendorTable
    (vendorId int not null,
        eventTableId int not null,
        constraint FK_Vendor foreign key (vendorId)
            references vendor(id),
        constraint FK_Table foreign key (eventTableId)
            references eventTable(id)
    )

create table presenter
    (id int primary key nonclustered not null,
        personId int not null,
        vendorId int,
        constraint FK_Person foreign key (personId)
            references person(id),
        constraint FK_Vendor foreign key (vendorId)
            references vendor(id)
    )

create table room 
    (id int primary key nonclustered not null,
        roomNumber int,
        roomName varchar(100),
        capacity int,
        venueId int not null,
        constraint FK_Venue foreign key (venueId)
            references venue(id)
    )

create table class
    (id int primary key nonclustered not null,
        title varchar(100) not null,
        description varchar(250) not null,
        presenterId int not null,
        roomId int not null,
        startTime datetime2 not null,
        --difficulty scale 1-10
        difficultyLevel smallint not null,
        --complexity scale 1-10
        complexity smallint not null,
        --readiness (beginner, intermediate, advanced)
        readiness varchar(12) not null,
        constraint FK_Presenter foreign key (presenterId)
            references presenter(id),
        constraint FK_Room foreign key (roomId)
            references room(id)
    )

create table track
    (id int primary key nonclustered not null,
        title varchar(50) not null
    )


create table classTrack
    (trackId int not null,
        classId int not null,
        constraint FK_Track foreign key (trackId)
            references track(id),
        constraint FK_Class foreign key (classId)
            references class(id),
        constraint PK_ClassTrack primary key (trackId, classId)
    )

create table usergroup
    (id int primary key nonclustered not null,
        groupname varchar(50) not null,
        totalmembers int not null,
        cityid int not null,
        constraint fk_city foreign key (cityid)
            references city(id)
    )


