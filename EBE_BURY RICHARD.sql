
drop database if exists EventbyEvents;
show databases;
create database EventbyEvents;


use   eventbyevents;
create table Venue (
VenueID Int(10) not null,
VenueName Varchar(30) not null,
Capacity Int(20) not null,
Street Varchar(30) not null,
City Varchar(30) not null, 
Zip Int(8) not null,
Parking bool not null, 
LocationContactName varchar(20) default null,
LocationContactPhone int(100) default null,
primary key (VenueID)
);
 insert into venue
 values (22243, 'hood', 200 , 'apple' , 'place' , 33325, 1, 'jimmt',34251023);
select*
From venue
Where VenueID='EBE';

use   eventbyevents;
create table Clients (
ClientID int(20) not null,
ClientName varchar(25) not null,
Street Varchar(30) not null, 
City varchar(30) not null, 
State varchar(20) not null, 
Zip int(8) not null,
primary key (ClientID)
);

insert into clients
values(34132, 'dexter', 'potato', 'crab', 'Jimland', 34412);

select*
From clients
Where ClientID='EBE';

desc clients;

use   eventbyevents;

create Table Events_ (
EventCode Int(11) not null ,
EventName Varchar(30) not null,
Description_ Varchar(30) not null,
Date_ date NOT NULL Default '0000-00-00',
StartTime time default null,
EndTime time default null,
Ticket bool not null,
VenueID Int(10) not null ,
ClientID int(10) not null,
primary key (EventCode),
Constraint FK_VenueID
Foreign key (VenueID)
references venue(venueID),
Constraint FK_ClientID
foreign key (ClientID)
references clients(ClientID)
);

/* Ignore statements for dummy data*/

insert ignore into events_
values(36521,'lit', 'yum','2010-12-11', 4, 6, 1, 43245,13113); 
select*
From events_
Where VenueID='EBE';
select*
From events_
Where ClientID='EBE';

desc events_;

use eventbyevents;
create table Contact (
ClientID int(10) not null,
ContactName varchar(30) not null,
ContactPhone int(100) not null, 
ContactEmail varchar(35) not null,
Primary key (ContactName)
);

alter table Contact
add foreign key (ClientID) references Clients(ClientID);
insert ignore into Contact
values(13411,'max', 4341134123, 'ook@mail.com');

select*
From contact
Where ClientID='EBE';
desc contact;


use   eventbyevents;
create table Event_Contact (
ClientID int(10) not null,
ContactName varchar(20) not null,
EventCode int(10) not null,
Primary key (ClientID)
);
alter table Event_Contact
add foreign key (ClientID) references Clients(ClientID);
insert ignore into Event_Contact
values(13481,"mao", 43410);

select*
From event_contact
Where EventCode='EBE';

desc event_contact;

use   eventbyevents;
create table Ticketed_Event (
EventCode int(10) not null, 
TicketPrice int(10) not null,
TicketsAvailable int(10) not null,
TicketsSold int(10) not null,
WristBands bool not null,
HandStamp bool not null,
Primary key (EventCode)
);
alter table Ticketed_Event
add foreign key (EventCode) references Events_(EventCode);
insert ignore into Ticketed_Event
values(13451,55, 434, 230,1,0 );

select*
From Ticketed_Event
Where EventCode='EBE';

desc Ticketed_Event;

create table Non_Ticketed_Event (
EventCode Int(10) not null,
GuestList bool not null,
ExpectedAttendance int(10) not null,
ActualAttendance int(10) not null,
Primary Key (EventCode)
);
alter table Non_Ticketed_Event
add foreign key (EventCode) references Events_(EventCode);
insert ignore into Non_Ticketed_Event
values(13471,0, 43, 23);

select*
From Non_Ticketed_Event
Where EventCode='EBE' ;

desc Non_ticketed_event;

show tables;

CREATE DATABASE EBE_BuryRichard;