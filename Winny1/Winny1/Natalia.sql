use master
go
drop database dbShopping
go
create database dbShopping
go
use dbShopping
go
create table tbLocation
(
LocationId int identity(1,1) Primary key,
LocationName varchar(30)
)
go
insert into tbLocation(LocationName) values
					('North'),('Northeast'),('East'),('Southeast'),
					('South'),('Southwest'),('West'),('Northwest'),
					('Downtown'),('Airport/West'),('Just Outside Winnipeg')
go
create table tbShoppingCategories(
CategoryId int identity (1,1) primary key,
CategoryType varchar (50) not null
)
go
create procedure spAddShoppingCategories(
@CategoryType varchar(50)
)
as begin
insert into tbShoppingCategories(CategoryType ) values (@CategoryType)
end
go
exec spAddShoppingCategories  @CategoryType='Antiques'
exec spAddShoppingCategories  @CategoryType='Book Stores'
exec spAddShoppingCategories  @CategoryType='Boutique'
exec spAddShoppingCategories  @CategoryType='Districts'
exec spAddShoppingCategories  @CategoryType='Outlet'
exec spAddShoppingCategories  @CategoryType='Farmer*s Markets'
exec spAddShoppingCategories  @CategoryType='Gourmet Foods'
exec spAddShoppingCategories  @CategoryType='Shopping Malls'
exec spAddShoppingCategories  @CategoryType='Specialty&Hobby'
exec spAddShoppingCategories  @CategoryType='Wine&Spirits'
go
create procedure spGetShoppingCategories
as begin
select* from tbShoppingCategories
end
go
exec spGetShoppingCategories
go

create table tbStores(
StoreId int identity (1,1) primary key,
StoreName varchar (max) not null,
Description varchar (max),
Path varchar (100),
Address varchar(max) not null,
PhoneNumber varchar (50),
LocationId int foreign key references tbLocation(LocationId) ,
CategoryId int foreign key references tbShoppingCategories(CategoryId)
)
go

create procedure spStores(
@StoreId int=null,
@StoreName varchar(max)=null,
@Description varchar(max)=null,
@Path varchar(100)=null,
@Address varchar(max)=null,
@PhoneNumber varchar (50)=null,
@LocationId int=null,
@CategoryId int=null,
@Crud varchar (10)
)
as begin
if @Crud='r'
begin
select
StoreId,StoreName, Description,'.\Pictures\Shopping\'+ Path as Path,Address,PhoneNumber,LocationId,CategoryId
from tbStores where StoreId=isnull(@StoreId,StoreId)
end
else if
@Crud='c'
begin
insert into tbStores (StoreName, Description,Path,Address,PhoneNumber, LocationId,CategoryId) values
                     (@StoreName, @Description,@Path,@Address,@PhoneNumber, @LocationId,@CategoryId)
end
else if
@Crud='d'
begin
delete from tbStores where StoreId=@StoreId
end
else if
@Crud='u'
begin
update tbStores set
StoreName=@StoreName,
Description=@Description,
Path=@Path,
Address=@Address,
PhoneNumber=@PhoneNumber,
LocationId=@LocationId,
CategoryId=@CategoryId
where StoreId=@StoreId
end
end
go
go
exec spStores @Crud='c', @StoreName='Vintage Veruca Antiques', @Description='Vintage Veruca Antiques Store',
              @Path='Vintage Veruca Antiques.jpg',@Address='1342 Main Street, Winnipeg, MB, R2W 3T6 ',
			  @PhoneNumber=' 204.339.5301 ', @LocationId=2, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Mike*s General Store', 
              @Description='Mike General Store is crammed full of Old Toys, Old Tins, Advertising Signs and memorabilia 
			  and Unique Collectibles of all kinds.',
              @Path='Mike General Store.jpg',@Address='52 St. Annes Road, Winnipeg, MB, R2M 2Y3 ',
			  @PhoneNumber='204.255.3463', @LocationId=4, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Abbey Antiques & Art', 
              @Description='Winnipeg*s premiere Antiques And Vintage Art dealer.',
              @Path='Abbey Antiques & Art.jpg',@Address='914 Corydon Avenue, Winnipeg, MB, R3M 0Y5',
			  @PhoneNumber='204.477.0489', @LocationId=5, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Nerman*s Books & Collectibles', 
              @Description='Nerman Books & Collectibles Store',
              @Path='Nerman Books & Collectibles.jpg',@Address='700 Osborne Street South, Winnipeg, MB, R3L 2B9 ',
			  @PhoneNumber='204.475.1050', @LocationId=5, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Selim*s Antiques', 
              @Description='Selim’s Antiques has been in business for almost 50 years. 
			  They have established themselves by specializing in one thing… quality. 
			  Whether it is art, jewelry, furniture, fine collectibles, rugs, tableware or any number of items, 
			  they carry the finest that Winnipeg has to offer.',
              @Path='Selim Antiques.jpg',@Address='801 Corydon Avenue, Winnipeg, MB, R3M 0W6',
			  @PhoneNumber='204.284.9886', @LocationId=5, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Things', 
              @Description='Operated by the Women*s Committee of the Royal Winnipeg Ballet with proceeds going to The Royal Winnipeg Ballet.',
              @Path='Things.jpg',@Address='913 Corydon Avenue, Winnipeg, MB, R3M 0W8 ',
			  @PhoneNumber='204.284.7331', @LocationId=5, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Frazer*s Antiques', 
              @Description='Frazer*s Antiques Store',
              @Path='Frazer Antiques.jpg',@Address='587 Clifton Street, Winnipeg, MB',
			  @PhoneNumber='204.783.4786', @LocationId=7, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Marway Militaria Inc.', 
              @Description='We specialize in many areas, including Canadian militaria from Confederation
			  right up to modern day, we carry British and German Militaria as well. ',
              @Path='Marway Militaria Inc.jpg',@Address='22 - 1865 Sargent Avenue, Winnipeg, MB, R3H 0E4 ',
			  @PhoneNumber='204.775.7159', @LocationId=7, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Thirsty*s Flea Market & Auction', 
              @Description='Thirsty*s Flea Market & Auction Store',
              @Path='Thirsty Flea Market & Auction.png',
			  @Address='1111 Ellice Avenue, Winnipeg, MB ',
			  @PhoneNumber=' 204.783.9800', @LocationId=7, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Winnipeg Trading Post', 
              @Description='Winnipeg Trading Post takes pride in showcasing the work of our supportive artistic community. 
			  All products are hand crafted, making each and every item exclusive and unique. 
			  Stop in today to shop our inventory or, simply place a custom order.',
              @Path='Winnipeg Trading Post.jpg',
			  @Address='339 William Ave., Winnipeg, MB, R2W 3S3 ',
			  @PhoneNumber='204.947.0513', @LocationId=7, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Collectibles Canada', 
              @Description='Collectibles Canada features all types of coins and currency from North America and around the world, 
			  gold and silver in many forms, and has an extensive selection of Royal Canadian Mint product both past and present.
			  Our “one stop coin shop” display of mint product and supplies begins where the mint leaves off.',
              @Path='Collectibles Canada.png',
			  @Address='2211 McPhillips Street, Winnipeg, MB, R2V 3M5 ',
			  @PhoneNumber='204.586.6263', @LocationId=8, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Antiques & Funk', 
              @Description='Antiques & Funk buy Estates, Entire Households, Single Items or Collections, and they Make House Calls!',
              @Path='Antiques & Funk.jpg',
			  @Address='474 Main Street, Winnipeg, MB, R3B 1B6 ',
			  @PhoneNumber='204.943.4782 ', @LocationId=9, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Johnston Terminal', 
              @Description='This historic building offers three levels of fabulous shopping and dining. 
			  Originally constructed in the 1920’s, this beautifully restored building now boasts Manitoba-owned 
			  businesses including shops, specialty boutiques, restaurants and a large antique mall.',
              @Path='Johnston Terminal.jpg',
			  @Address='25 Forks Market Road, Winnipeg, MB, R3B 3H6',
			  @PhoneNumber='204.956.5593', @LocationId=9, @CategoryId=1 

exec spStores @Crud='c', @StoreName='The Old House Revival Company & Antique Mall', 
              @Description='The Old House Revival Company & Antique Mall Stores',
              @Path='The Old House Revival Company & Antique Mall.jpg',
			  @Address='324 Younge Street, Winnipeg, MB, R3B 2S4 ',
			  @PhoneNumber='204.477.4286', @LocationId=9, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Vintage Glory', 
              @Description='Vintage Glory is a stylish blend of chic boutique and vintage clothing shop.
			  The shop features the original tin ceiling and solid maple floors, completely restored by shop owner Doug Shand. ',
              @Path='Vintage Glory.jpg',
			  @Address='380 Donald Street, Winnipeg, MB, R3B 1P4 ',
			  @PhoneNumber='204.942.7186', @LocationId=9, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Selkirk Book Exchange', 
              @Description='Selkirk Book Exchange Store',
              @Path='Selkirk Book Exchange.jpg',
			  @Address='442 McGregor Street, Winnipeg, MB, R2W 4X8 ',
			  @PhoneNumber='204.586.5127', @LocationId=1, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Dog Eared Books', 
              @Description='We carry a good selection of gently used paperbacks in fantasy, children*s,
			  cookbooks, horror & mayhem, westerns, humour, inspirational, romance, mysteries & thrillers.',
              @Path='Dog Eared Books.jpg',
			  @Address='1157 Henderson Highway, Winnipeg, MB, R2G 1L5 ',
			  @PhoneNumber='204.338.7042', @LocationId=2, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Sams Place', 
              @Description='We carry a good selection of gently used paperbacks in fantasy, children*s,
			  cookbooks, horror & mayhem, westerns, humour, inspirational, romance, mysteries & thrillers.',
              @Path='Sams Place.jpg',
			  @Address='159 Henderson Highway, Winnipeg, MB, R2L 1L4',
			  @PhoneNumber='204.415.4728', @LocationId=2, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Coles', 
              @Description='Coles Store',
              @Path='Coles.jpg',
			  @Address='Kildonan Place Shopping Centre, 1555 Regent Avenue West, 1555 Regent Ae. W., Winnipeg, MB, R2C 4J2 ',
			  @PhoneNumber=' 204.661.8142', @LocationId=2, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Family Book Exchange', 
              @Description='Family Book Exchange has one of the largest romance sections around! 
			  Our romance area covers paranormal, historic, time travel, erotic, and suspense.',
              @Path='Family Book Exchange.jpg',
			  @Address='519 St. Mary*s Road, Winnipeg, MB, R2M 3L2',
			  @PhoneNumber='204.237.4949', @LocationId=4, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Indigo', 
              @Description='Indigo Store',
              @Path='Indigo.jpg',
			  @Address='1590 Kenaston Blvd., Winnipeg, MB, R3P 0Y4' ,
			  @PhoneNumber='204.488.6621', @LocationId=4, @CategoryId=2 


exec spStores @Crud='c', @StoreName='Indigo', 
              @Description='Indigo Store',
              @Path='Indigo.jpg',
			  @Address='1590 Kenaston Blvd., Winnipeg, MB, R3P 0Y4' ,
			  @PhoneNumber='204.488.6621', @LocationId=4, @CategoryId=2 
			  
go
exec spStores @Crud='r'
go