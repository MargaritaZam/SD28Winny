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
('North'),('Northeast'),('East'),('Southeast'),
('South'),('Southwest'),('West'),('Northwest'),
('Downtown'),('Airport/West'),('Just Outside Winnipeg')
go

select*from tbLocation
go
create table tbAttractions(
attractionID int identity(1,1) primary key,
attractionCategory varchar(150),
atName varchar(100),
atDesc varchar(650),
atAddress varchar(100),
atPhone varchar(20),
atWebsite varchar(200),
atImage varchar(60),
location int foreign key references tbLocation(locationID)

)
go

select*from tbAttractions
go

create procedure spAttractions(
@id int =null,
@category varchar(150)=null,
@name varchar(100)=null,
@desc varchar(650)=null,
@address varchar(100)=null,
@phone varchar(20)=null,
@website varchar(200)=null,
@image varchar(60)=null,
@location varchar(60)=null,
@crud varchar(1)
)
as begin
if @crud ='r'
begin
select attractionID, attractionCategory,
atName, atDesc, atAddress, atPhone,
atWebsite, './Pictures/'+ atImage, location from tbAttractions
where attractionID=isnull(@id, attractionID)
end

else if @crud='c'
begin
insert into tbAttractions(attractionCategory, atName,
atDesc, atAddress, atPhone,
atWebsite, atImage, location)values
(@category, @name,
@desc, @address, @phone,
@website, @image, @location)
end
else if @crud='d'
begin
delete from tbAttractions where attractionID=@id
end
else if @crud='u'
begin
update tbAttractions
set  attractionCategory =@category,
     atName =@name,
     atDesc=@desc,
     atAddress =@desc,
     atPhone =@phone,
     atWebsite =@website,
     atImage =@image,
     location =@location
	 where attractionID=@id
end
end
go

exec spAttractions @crud='c', @category='',
                              @name='',
                              @desc='', 
							  @address='', 
							  @phone='',
                              @website='', 
							  @image='', 
							  @location=''
exec spAttractions @crud='c', @category='',
                              @name='',
                              @desc='', 
							  @address='', 
							  @phone='',
                              @website='', 
							  @image='', 
							  @location=''
exec spAttractions @crud='c', @category='',
                              @name='',
                              @desc='', 
							  @address='', 
							  @phone='',
                              @website='', 
							  @image='', 
							  @location=''
exec spAttractions @crud='c', @category='',
                              @name='',
                              @desc='', 
							  @address='', 
							  @phone='',
                              @website='', 
							  @image='', 
							  @location=''
exec spAttractions @crud='c', @category='',
                              @name='',
                              @desc='', 
							  @address='', 
							  @phone='',
                              @website='', 
							  @image='', 
							  @location=''
exec spAttractions @crud='c', @category='',
                              @name='',
                              @desc='', 
							  @address='', 
							  @phone='',
                              @website='', 
							  @image='', 
							  @location=''
exec spAttractions @crud='c', @category='',
                              @name='',
                              @desc='', 
							  @address='', 
							  @phone='',
                              @website='', 
							  @image='', 
							  @location=''