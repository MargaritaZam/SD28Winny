use master;
go
drop database dbGroupProject;
go
create database dbGroupProject;
go
use dbGroupProject;


create table tbLocation(
locationID int identity(1,1) primary key,
locationName varchar(60)
)
go
insert into tbLocation(locationNAme)values
("Anywhere"), ("North"), ("Northeast"), ("East"), ("Southeast"), ("South"), ("Southwest"),
("West"), ("Northwest"), ("Downtown"), ("Airport/West"), ("Just Outside Winnipeg")
go

create table tbAttractions(
attractionID int identity(1,1) primary key,
attractionCategory varchar(150),
atName varhar(100),
atDesc varchar(650),
atAddress varchar(100),
atPhone varchar(20),
atWebsite varchar(200),
atImage varchar(60),
location int foreign key references tbLocation(locationID)

)
go
