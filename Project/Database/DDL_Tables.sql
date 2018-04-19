create table person
    (id int primary key nonclustered not null,
        firstName varchar(20) not null,
        lastName varchar(25) not null,
        gender varchar(1) not null,
        address varchar(100) not null
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
        eventDate

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
        constraint FK_Person foreign key (personId)
            references person(id)
    )

create table volunteer
    (id int primary key nonclustered not null,
        personId int not null,


create table vendor
    (id int primary key nonclustered not null,
        personId int not null,
        companyId int not null
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
        
create table usergroup
    (id int primary key nonclustered not null,
        groupname varchar(50) not null,
        totalmembers int not null,
        cityid int not null,
        constraint fk_city foreign key (cityid)
            references city(id)
    )


