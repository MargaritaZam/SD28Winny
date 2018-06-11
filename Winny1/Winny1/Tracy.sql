use master;
go
drop database dbGroupProject;
go
create database dbGroupProject;
go
use dbGroupProject;
go

create table tbLocation
(
	locationID int identity(1,1) primary key,
	locationName varchar(60)
)
go
insert into tbLocation(locationName)values
	('North'),('Northeast'),('East'),('Southeast'),
	('South'),('Southwest'),('West'),('Northwest'),
	('Downtown'),('Airport/West'),('Just Outside Winnipeg')
go

select * from tbLocation
go

create table tbAbout
(
	AboutID int identity(1,1) primary key,
	Title	varchar(30),
	Description varchar(500)
)
insert into tbAbout (Title, Description) values
	('Origins','The City of Winnipeg lies at the confluence of the Red River and the Assiniboine River, known as The Forks.  It was created on November 8, 1873 near the present day intersection of Portage Avenue and Main Street.'),
	('Now','Winnipeg is the capital and largest city of the province of Manitoba in Canada. It is near the longitudinal centre of North America and is 110 kilometres from the Canada–United States border.'),
	('Population','The city has a population of 749,500, while the Province of Manitoba has a total population of 1.33 million.   (Estimated 2017)')
go

select * from tbAbout
go

create table tbWeather
(
	month varchar(15),
	high varchar(10),
	low varchar(10)
)
insert into tbWeather (month, high, low) values
	('Month','Avg High','Avg Low'),
	('January','-10 C','-20 C'),
	('February','-8 C','-18 C'),
	('March','-0 C','-11 C'),
	('April','10 C','-2 C'),
	('May','18 C','5 C'),
	('June','23 C','12 C'),
	('July','26 C','14 C'),
	('August','26 C','13 C'),
	('September','20 C','8 C'),
	('October','11 C','1 C'),
	('November','1 C','-8 C'),
	('December','-8 C','-17 C')
go

select * from tbWeather
go

create table tbHotels
(
	HotelID int identity(1,1) primary key,
	Name	varchar(30),
	PhoneNumber varchar(15),
	Address varchar(100),
	PostalCode varchar(7),
	Website varchar(100),
	Description varchar(800),
	Hotel_path varchar(200),
	LocationID int foreign key references tbLocation(LocationID)
)
go

create procedure spHotelsCrud
(
	@hotelID int = null,
	@name	varchar(30) = null,
	@phoneNumber varchar(15) = null,
	@address varchar(100) = null,
	@postalCode varchar(7) = null,
	@website varchar(100) = null,
	@description varchar(800) = null,
	@hotel_path varchar(200) = null,
	@locationID int,
	@crud varchar(1)
)
as begin
	if @crud='r'
	begin
		select Name,PhoneNumber,Address,Website,PostalCode,'.\HotelPictures\' + Hotel_path as Hotel_path from tbHotels where HotelId=isnull(@HotelId,HotelId)
	end
	else if @crud='c'
	begin
		insert into tbHotels(Name,PhoneNumber,Address,PostalCode,Website,Description,Hotel_path,LocationID)
								values
								(@name,@phoneNumber,@address,@postalCode,@website,@description,@hotel_path,@locationID)
	end
	else if @crud='u'
	begin
		update tbHotels set
			   Name = @name,
			   PhoneNumber = @phoneNumber,
			   Address = @address,
			   PostalCode = @postalCode,
			   Website = @website,
			   Description = @description,
			   Hotel_path = @hotel_path
		where HotelID = @hotelID
	end
	else if @crud = 'd'
	begin
		delete from tbHotels where HotelID = @hotelID
	end
end
go

exec spHotelsCrud @crud='c',
			  @name='The Fort Garry Hotel',
			  @phoneNumber='204-942-8251',
			  @address='222 Broadway',
			  @postalCode='R3C 0R3',
			  @website='www.fortgarryhotel.com',
			  @description='Located in downtown Winnipeg, the Fort Garry Hotel was built in 1913 as a grand railway hotel.  The century-old Fort Garry Hotel, Spa and Conference Centre ushers in a new era of modern-day style in downtown Winnipeg. Catering to guests who appreciate local history mixed with authentic charm, this iconic 240-room “Grand Dame” is a favorite for weddings, romantic getaways and wellness weekends. Don’t leave without saying hello to one of the hotel’s friendly resident ghosts.',
			  @hotel_path='FortGarryHotel.jpg',
			  @locationId=9

exec spHotelsCrud @crud='c',
			  @name='Viscount Gort Hotel',
			  @phoneNumber='1-800-665-1122',
			  @address='1670 Portage Avenue',
			  @postalCode='R3J 0C9',
			  @website='www.viscount-gort.com',
			  @description='(Pronounced vī kount), the Viscount Gort is located minutes from Polo Park Shopping Centre.  We offer free parking for our guests and a free shuttle to and from the airport. City buses stop close by and there are plenty of taxi and limo services always available.',
			  @hotel_path='ViscountGort.png',
			  @locationId=7

exec spHotelsCrud @crud='c',
			  @name='Inn at the Forks',
			  @phoneNumber='1-866-500-4938',
			  @address='75 Forks Market Road',
			  @postalCode='R3C 0A2',
			  @website='www.innforks.com',
			  @description='Located in downtown Winnipeg at The Forks, our top tourism attraction, you''re immersed in a convergence of cultures – Aboriginal, French Canadian and Manitoban – at a 6,000-year-old meeting place. The myriad of shopping, arts, and entertainment options on-site and nearby is unmatched.',
			  @hotel_path='InnAtTheForks.jpg',
			  @locationId=9

exec spHotelsCrud @crud='c',
			  @name='Delta Hotels by Marriott Winnipeg',
			  @phoneNumber='204-942-0551',
			  @address='350 St Mary Avenue',
			  @postalCode='R3C 3J2',
			  @website='www.marriott.com/hotels/travel/ywgdw-delta-hotels-winnipeg',
			  @description='The Delta Hotels Winnipeg has established itself as a premier destination for business travelers and vacationing families here in the heart of the city.  Take a dip in the heated indoor pool, or relax on the rooftop at our seasonal outdoor pool when the weather here in Winnipeg is warm.  Those visiting here in the city will love our hotel''s downtown location and our versatile event venues. And we offer direct Skywalk access to the RBC Convention Centre, BellMTS Place and much more, making exploration easy.',
			  @hotel_path='DeltaHotel.png',
			  @locationId=9

exec spHotelsCrud @crud='c',
			  @name='Radisson Hotel Winnipeg Downtown',
			  @phoneNumber='204-956-0410',
			  @address='288 Portage Avenue',
			  @postalCode='R3C 0B8',
			  @website='www.radisson.com/winnipeg-hotel-mb-r3c0b8/mbwinnip',
			  @description='Conveniently located on Portage Avenue, Radisson Hotel Winnipeg Downtown is within sight of the Burton Cummings Theatre and area shopping centres.  Open on weekdays from 7:30 a.m. to 5 p.m., our skywalk connects you to Cityplace, Bell MTS Place and Winnipeg Square. The Radisson is also less than 20 minutes from Winnipeg James Armstrong Richardson International Airport (YWG) and within a 10-minute walk of the Canadian Museum for Human Rights, the Exchange District, the RBC Convention Centre and Chinatown.',
			  @hotel_path='RadissonHotel.jpg',
			  @locationId=9

exec spHotelsCrud @crud='c',
			  @name='Canad Inns Destination Centre Health Sciences Centre',
			  @phoneNumber='204-594-9472',
			  @address='720 William Avenue',
			  @postalCode='R3E 3J7',
			  @website='www.canadinns.com/stay/health-sciences-centre',
			  @description='Our hotel is conveniently attached to the Health Sciences Centre, located just a few minutes from downtown Winnipeg, including shopping at Portage Place and The Forks, and just a five minute drive from McPhillips Station Casino.  For your comfort, our hotel offers a number of universally-accessible and wheelchair-friendly rooms.',
			  @hotel_path='CanadInnsHSC.png',
			  @locationId=9

exec spHotelsCrud @crud='c',
			  @name='Hilton Winnipeg Airport Suites',
			  @phoneNumber='204-783-1700',
			  @address='1800 Wellington Avenue',
			  @postalCode='R3H 1B2',
			  @website='www3.hilton.com/en/hotels/manitoba/hilton-winnipeg-airport-suites-YWGWIHF/index.html',
			  @description='Located in Winnipeg Airport Industrial Park, we provide easy access to downtown Winnipeg. Use the complimentary airport shuttle service to/from the hotel. Polo Park Mall, the largest shopping center in Manitoba with over 200 stores, is less than 2 miles away. We’re also a short drive to the newest Outlet Collection Winnipeg.',
			  @hotel_path='HiltonAirport.jpg',
			  @locationId=10

exec spHotelsCrud @crud='c',
			  @name='Royal Albert Arms',
			  @phoneNumber='204-943-8433',
			  @address='48 Albert Street',
			  @postalCode='R3B 1E7',
			  @website='none',
			  @description='The Royal Albert Hotel with its 54 rooms, restaurant, coffee shop and cigar stand opened its doors on November 5, 1913.  The façade of the hotel was designed with a continental flair. A red-tiled roof forms a cornice over a brick front accentuated with ornamental iron fretwork, elaborate iron lights and arched main floor windows and doors which combine to create an Italian effect.',
			  @hotel_path='RoyalAlbertArmsHotel.jpg',
			  @locationId=9

--------  ADD Hotel template  ----------------

--exec spHotelsCrud @crud='c',
--			  @name='',
--			  @phoneNumber='',
--			  @address='',
--			  @postalCode='',
--			  @website='',
--			  @description='',
--			  @hotel_path='',
--			  @locationId=

select * from tbHotels
go