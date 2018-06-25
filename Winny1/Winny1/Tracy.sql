use master;
go
drop database dbOmegaProject;
go
create database dbOmegaProject;
go
use dbOmegaProject;
go

create table tbLocation
(
	LocationID int identity(1,1) primary key,
	LocationName varchar(25)
)
go
insert into tbLocation(LocationName)values
	('North'),('Northeast'),('East'),('Southeast'),
	('South'),('Southwest'),('West'),('Northwest'),
	('Downtown'),('Airport/West'),('Just Outside Winnipeg')
go

create procedure spLocation
(
	@locationID int = null ,
	@locationName varchar(25) = null
)
as begin
	select * from tbLocation where LocationID = isnull(@locationID, LocationID)
end
go

--exec spLocation
--go

create table tbAbout
(
	AboutID int identity(1,1) primary key,
	AboutTitle	varchar(50),
	AboutDescription varchar(800)
)
go

create procedure spAboutCrud
(
	@aboutID int = null,
	@aboutTitle varchar(50) = null,
	@aboutDescription varchar(800) = null,
	@crud varchar(1)
)
as begin
	if @crud='r'
	begin
		select AboutTitle, AboutDescription from tbAbout where AboutID = isnull(@aboutID,AboutID)
	end
	else if @crud='c'
	begin
		insert into tbAbout(AboutTitle,AboutDescription) values
						(@aboutTitle,@aboutDescription)
	end
	else if @crud='u'
	begin
		update tbAbout set
			   AboutTitle = @aboutTitle,
			   AboutDescription = @aboutDescription
		where AboutID = @aboutID
	end
	else if @crud = 'd'
	begin
		delete from tbAbout where AboutID = @aboutID
	end
end
go

exec spAboutCrud @crud = 'c',
			     @aboutTitle = 'Origins',
			     @aboutDescription = 'The confluence of the Red and the Assiniboine Rivers, known as The Forks, has been a meeting place for 6,000 years.  The city was created on November 8, 1873 near the present day intersection of Portage Avenue and Main Street and is named after the Western Cree words for ''Muddy Water''.'

exec spAboutCrud @crud = 'c',
			     @aboutTitle = 'Now',
			     @aboutDescription = 'Winnipeg is the capital and largest city of the province of Manitoba in Canada. It is near the longitudinal centre of North America and is 110 kilometres from the Canada–United States border.'

exec spAboutCrud @crud = 'c',
			     @aboutTitle = 'Motto',
			     @aboutDescription = '"UNUM CUM VIRTUTE MULTORUM" is Latin for "One with the strength of many"'

exec spAboutCrud @crud = 'c',
			     @aboutTitle = 'Population',
			     @aboutDescription = 'The city has a population of 749,500, while the Province of Manitoba has a total population of 1.33 million.  (Estimated 2017)'

--exec spAboutCrud @crud = 'r'
--go

create table tbWeatherAverages
(
	WeatherAvgID int identity(1,1) primary key,
	Month varchar(15),
	High varchar(10),
	Low varchar(10)
)
insert into tbWeatherAverages (Month, High, Low) values
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

create procedure spReadWeather
(
	@weatherID int = null,
	@month varchar(15) = null,
	@high varchar(10) = null,
	@low varchar(10) = null
)
as begin
	select Month, High, Low from tbWeather where WeatherID = isnull(@weatherID,WeatherID)
end
go

--exec spReadWeather
--go

create table tbHotelStars
(
	StarsID int identity(0,1) primary key,
	NumberOfStars varchar(12)
)
insert into tbHotelStars (NumberOfStars) values
	('0'),   ('*'),    ('* *'),
	('* * *'), ('* * * *'), ('* * * * *')
go

create procedure spHotelStars
(
	@starsID int = null ,
	@numberStars varchar(12) = null
)
as begin
	select * from tbHotelStars where StarsID = isnull(@starsID, StarsID)
end
go

--exec spHotelStars
--go

create table tbHotels
(
	HotelID int identity(1,1) primary key,
	HotelName	varchar(30),
	HotelPrice int,
	HotelStars int foreign key references tbHotelStars(StarsID),
	HotelDescription varchar(800),
	HotelPhoneNumber varchar(15),
	HotelAddress varchar(100),
	HotelPostalCode varchar(7),
	HotelWebsite varchar(100),
	Hotel_path varchar(200),
	HotelLocationID int foreign key references tbLocation(LocationID)
)
go

create procedure spHotelsCrud
(
	@hotelID int = null,
	@hotelName	varchar(30) = null,
	@hotelPrice int = null,
	@hotelStars int = null,
	@hotelDescription varchar(800) = null,
	@hotelPhoneNumber varchar(15) = null,
	@hotelAddress varchar(100) = null,
	@hotelPostalCode varchar(7) = null,
	@hotelWebsite varchar(100) = null,
	@hotel_path varchar(200) = null,
	@hotelLocationID int = null,
	@crud varchar(1)
)
as begin
	if @crud='r'
	begin
		select HotelName, HotelDescription, '.\HotelPictures\' + Hotel_path 
			as Hotel_path from tbHotels where HotelID = isnull(@hotelID,HotelID)
	end
	else if @crud='c'
	begin
		insert into tbHotels(HotelName,HotelPrice,HotelStars,HotelDescription,
			HotelPhoneNumber,HotelAddress,HotelPostalCode,HotelWebsite,Hotel_path,
			HotelLocationID) values
			(@hotelName,@hotelPrice,@hotelStars,@hotelDescription,
			@hotelPhoneNumber,@hotelAddress,@hotelPostalCode,@hotelWebsite,@hotel_path,
			@hotelLocationID)
	end
	else if @crud='u'
	begin
		update tbHotels set
			   HotelName = @hotelName,
			   HotelPrice = @hotelPrice,
			   HotelStars = @hotelStars,
			   HotelDescription = @hotelDescription,
			   HotelPhoneNumber = @hotelPhoneNumber,
			   HotelAddress = @hotelAddress,
			   HotelPostalCode = @hotelPostalCode,
			   HotelWebsite = @hotelWebsite,
			   Hotel_path = @hotel_path,
			   HotelLocationID = @hotelLocationID
		where HotelID = @hotelID
	end
	else if @crud = 'd'
	begin
		delete from tbHotels where HotelID = @hotelID
	end
	else if @crud = 's'
	begin
		select HotelID, HotelName, HotelDescription,  tbHotelStars.NumberOfStars,
			tbLocation.LocationName  from tbHotels join tbHotelStars on
			tbHotels.HotelStars = tbHotelStars.StarsID join tbLocation on 
			tbHotels.HotelLocationID = tbLocation.LocationID 
			where tbHotels.HotelLocationID = ISNULL(@hotelLocationID, tbHotels.HotelLocationID)
			and tbHotels.HotelStars = ISNULL(@hotelID,tbHotels.hotelID)
	end
end
go

exec spHotelsCrud @crud = 'c',
			  @hotelName = 'Alt Hotel Winnipeg',
			  @hotelPrice = 159,
			  @hotelStars = 3,
			  @hotelDescription = 'Located in the new Sports, Hospitality and Entertainment District (SHED), the hotel is just steps away from the Bell MTS Place, home of the Winnipeg Jets hockey team, an array of businesses such as restaurants, bars and boutiques.',
			  @hotelPhoneNumber = '1-844-946-6258',
			  @hotelAddress = '310 Donald Street',
			  @hotelPostalCode = 'R3B 2H3',
			  @hotelWebsite = 'althotels.com/en/winnipeg/',
			  @hotel_path = 'AltHotel.jpg',
			  @hotelLocationID = 9

exec spHotelsCrud @crud = 'c',
			  @hotelName = 'Canad Inns Destination Centre Health Sciences Centre',
			  @hotelPrice = 143,
			  @hotelStars = 3,
			  @hotelDescription = 'Our hotel is conveniently attached to the Health Sciences Centre, located just a few minutes from downtown Winnipeg, including shopping at Portage Place and The Forks, and just a five minute drive from McPhillips Station Casino.  For your comfort, our hotel offers a number of universally-accessible and wheelchair-friendly rooms.',
			  @hotelPhoneNumber = '204-594-9472',
			  @hotelAddress = '720 William Avenue',
			  @hotelPostalCode = 'R3E 3J7',
			  @hotelWebsite = 'www.canadinns.com/stay/health-sciences-centre',
			  @hotel_path = 'CanadInnsHSC.png',
			  @hotelLocationID = 9
			  

exec spHotelsCrud @crud = 'c',
			  @hotelName = 'Clarion Hotel & Suites',
			  @hotelPrice = 149,
			  @hotelStars = 2,
			  @hotelDescription = 'the hotel is nestled in the hub of Winnipeg’s shopping, restaurant and business neighbourhoods. Located just 6 km from the James Richard Armstrong International Airport (YWG), Ikea and the new Seasons Outlet Collection Mall, and within walking distance to Manitoba’s largest Mall CF Polo Park Shopping Centre. The Clarion Hotel is only 15 minutes from downtown Winnipeg.',
			  @hotelPhoneNumber = '204-774-5110',
			  @hotelAddress = '1445 Portage Avenue',
			  @hotelPostalCode = 'R3G 3P4',
			  @hotelWebsite = 'www.clarionhotelwinnipeg.com',
			  @hotel_path = 'ClarionPoloPark.jpg',
			  @hotelLocationID = 7

exec spHotelsCrud @crud = 'c',
			  @hotelName = 'Delta Hotels by Marriott Winnipeg',
			  @hotelPrice = 175,
			  @hotelStars = 4,
			  @hotelDescription = 'The Delta Hotels Winnipeg has established itself as a premier destination for business travelers and vacationing families here in the heart of the city.  Take a dip in the heated indoor pool, or relax on the rooftop at our seasonal outdoor pool when the weather here in Winnipeg is warm.  Those visiting here in the city will love our hotel''s downtown location and our versatile event venues. And we offer direct Skywalk access to the RBC Convention Centre, BellMTS Place and much more, making exploration easy.',
			  @hotelPhoneNumber = '204-942-0551',
			  @hotelAddress = '350 St Mary Avenue',
			  @hotelPostalCode = 'R3C 3J2',
			  @hotelWebsite = 'www.marriott.com/hotels/travel/ywgdw-delta-hotels-winnipeg',
			  @hotel_path = 'DeltaHotel.png',
			  @hotelLocationID = 9

exec spHotelsCrud @crud = 'c',
			  @hotelName = 'Econo Lodge',
			  @hotelPrice = 110,
			  @hotelStars = 2,
			  @hotelDescription = 'Convenient for accessing the hospital, University of Winnipeg campus and downtown Winnipeg.  Rooms not wheelchair accessible',
			  @hotelPhoneNumber = '204-255-7100',
			  @hotelAddress = '690 Notre Dame Avenue',
			  @hotelPostalCode = 'R3E 0L7',
			  @hotelWebsite = 'www.econolodge.com',
			  @hotel_path = 'EconoLodgeND.jpg',
			  @hotelLocationID = 9

exec spHotelsCrud @crud = 'c',
			  @hotelName = 'The Fort Garry Hotel',
			  @hotelPrice = 149,
			  @hotelStars = 3,
			  @hotelDescription = 'Located in downtown Winnipeg, the Fort Garry Hotel was built in 1913 as a grand railway hotel.  The century-old Fort Garry Hotel, Spa and Conference Centre ushers in a new era of modern-day style in downtown Winnipeg. Catering to guests who appreciate local history mixed with authentic charm, this iconic 240-room “Grand Dame” is a favorite for weddings, romantic getaways and wellness weekends. Don’t leave without saying hello to one of the hotel’s friendly resident ghosts.',
			  @hotelPhoneNumber = '204-942-8251',
			  @hotelAddress = '222 Broadway',
			  @hotelPostalCode = 'R3C 0R3',
			  @hotel_path = 'FortGarryHotel.jpg',
			  @hotelLocationID = 9

exec spHotelsCrud @crud = 'c',
			  @hotelName = 'Hilton Winnipeg Airport Suites',
			  @hotelPrice = 123,
			  @hotelStars = 3,
			  @hotelDescription = 'Located in Winnipeg Airport Industrial Park, we provide easy access to downtown Winnipeg. Use the complimentary airport shuttle service to/from the hotel. Polo Park Mall, the largest shopping center in Manitoba with over 200 stores, is less than 2 miles away. We’re also a short drive to the newest Outlet Collection Winnipeg.',
			  @hotelPhoneNumber = '204-783-1700',
			  @hotelAddress = '1800 Wellington Avenue',
			  @hotelPostalCode = 'R3H 1B2',
			  @hotelWebsite = 'www3.hilton.com/en/hotels/manitoba/hilton-winnipeg-airport-suites-YWGWIHF/index.html',
			  @hotel_path = 'HiltonAirport.jpg',
			  @hotelLocationID = 10

exec spHotelsCrud @crud = 'c',
			  @hotelName = 'Inn at the Forks',
			  @hotelPrice = 186,
			  @hotelStars = 3,
			  @hotelDescription = 'Located in downtown Winnipeg at The Forks, our top tourism attraction, you''re immersed in a convergence of cultures – Aboriginal, French Canadian and Manitoban – at a 6,000-year-old meeting place. The myriad of shopping, arts, and entertainment options on-site and nearby is unmatched.',
			  @hotelPhoneNumber = '1-866-500-4938',
			  @hotelAddress = '75 Forks Market Road',
			  @hotelPostalCode = 'R3C 0A2',
			  @hotelWebsite = 'www.innforks.com',
			  @hotel_path = 'InnAtTheForks.jpg',
			  @hotelLocationID = 9

exec spHotelsCrud @crud = 'c',
			  @hotelName = 'Queen Bee Hotel',
			  @hotelPrice = '89',
			  @hotelStars = 2,
			  @hotelDescription = 'Located just outside of the main gates of the University of Manitoba, the Queen Bee Hotel is within walking distance to many restaurants, cultural venues and other conveniences.',
			  @hotelPhoneNumber = '204-269-4666',
			  @hotelAddress = '2615 Pembina Hwy.',
			  @hotelPostalCode = 'R3T 2H5',
			  @hotelWebsite = 'www.queenbeehotel.com',
			  @hotel_path = 'QueenBee.jpg',
			  @hotelLocationID = 5

exec spHotelsCrud @crud = 'c',
			  @hotelName = 'Radisson Hotel Winnipeg Downtown',
			  @hotelPrice = 152,
			  @hotelStars = 3,
			  @hotelDescription = 'Conveniently located on Portage Avenue, Radisson Hotel Winnipeg Downtown is within sight of the Burton Cummings Theatre and area shopping centres.  Open on weekdays from 7:30 a.m. to 5 p.m., our skywalk connects you to Cityplace, Bell MTS Place and Winnipeg Square. The Radisson is also less than 20 minutes from Winnipeg James Armstrong Richardson International Airport (YWG) and within a 10-minute walk of the Canadian Museum for Human Rights, the Exchange District, the RBC Convention Centre and Chinatown.',
			  @hotelPhoneNumber = '204-956-0410',
			  @hotelAddress = '288 Portage Avenue',
			  @hotelPostalCode = 'R3C 0B8',
			  @hotelWebsite = 'www.radisson.com/winnipeg-hotel-mb-r3c0b8/mbwinnip',
			  @hotel_path = 'RadissonHotel.jpg',
			  @hotelLocationID = 9

exec spHotelsCrud @crud = 'c',
			  @hotelName = 'Royal Albert Arms',
			  @hotelPrice = 20,
			  @hotelStars = 0,
			  @hotelDescription = 'The Royal Albert Hotel with its 54 rooms, restaurant, coffee shop and cigar stand opened its doors on November 5, 1913.  The façade of the hotel was designed with a continental flair. A red-tiled roof forms a cornice over a brick front accentuated with ornamental iron fretwork, elaborate iron lights and arched main floor windows and doors which combine to create an Italian effect.',
			  @hotelPhoneNumber = '204-943-8433',
			  @hotelAddress = '48 Albert Street',
			  @hotelPostalCode = 'R3B 1E7',
			  @hotelWebsite = 'Not available',
			  @hotel_path = 'RoyalAlbertArmsHotel.jpg',
			  @hotelLocationID = 9

exec spHotelsCrud @crud = 'c',
			  @hotelName = 'Travelodge Winnipeg East',
			  @hotelPrice = 95,
			  @hotelStars = 2,
			  @hotelDescription = 'The Travelodge Winnipeg East is located close to downtown Winnipeg and major attractions, such as the Children’s Museum, Club Regent Casino, Fun Mountain Waterpark and the Royal Canadian Mint.',
			  @hotelPhoneNumber = '204-255-6000',
			  @hotelAddress = '20 Alpine Avenue',
			  @hotelPostalCode = 'R2M 0Y5',
			  @hotelWebsite = 'www.wyndhamhotels.com',
			  @hotel_path = 'TravelodgeEast.jpg',
			  @hotelLocationID = 4

exec spHotelsCrud @crud = 'c',
			  @hotelName = 'Viscount Gort Hotel',
			  @hotelPrice = 115,
			  @hotelStars = 3,
			  @hotelDescription = 'Pronounced vī kount, the Viscount Gort is located minutes from Polo Park Shopping Centre.  We offer free parking for our guests and a free shuttle to and from the airport. City buses stop close by and there are plenty of taxi and limo services always available.',
			  @hotelPhoneNumber = '1-800-665-1122',
			  @hotelAddress = '1670 Portage Avenue',
			  @hotelPostalCode = 'R3J 0C9',
			  @hotelWebsite = 'www.viscount-gort.com',
			  @hotel_path = 'ViscountGort.png',
			  @hotelLocationID = 7

--------  ADD Hotel template  ----------------

--exec spHotelsCrud @crud = 'c',
--			  @hotelName = '',
--			  @hotelPrice = '',
--			  @hotelStars = ?,
--			  @hotelDescription = '',
--			  @hotelPhoneNumber = '',
--			  @hotelAddress = '',
--			  @hotelPostalCode = '',
--			  @hotelWebsite = '',
--			  @hotel_path = '',
--			  @hotelLocationID = ?

exec spHotelsCrud @crud = 'r'
exec spHotelsCrud @crud = 's'
go

create table tbTypeOfSchool
(
	TypeID int identity(1,1) primary key,
	TypeOfSchool varchar(40)
)
insert into tbTypeOfSchool (TypeOfSchool) values
	('Undergraduate'), ('Graduate / Undergraduate'), ('College')
go

create procedure spGetSchoolTypes
as begin
	select* from tbTypeOfSchool
end
go

--exec spGetSchoolTypes
--go

create table tbUniversitiesColleges
(
	SchoolID int identity(1,1) primary key,
	SchoolName varchar(50),
	TypeID int foreign key references tbTypeOfSchool(TypeID),
	SchoolPhoneNumber varchar(15),
	SchoolAddress varchar(100),
	SchoolPostalCode varchar(7),
	SchoolWebsite varchar(100),
	SchoolDescription varchar(800),
	School_path varchar(200),
	SchoolLocationID int foreign key references tbLocation(LocationID)
)
go

create procedure spSchoolCrud
(
	@schoolID int = null,
	@schoolName varchar(50) = null,
	@typeID int = null,
	@schoolPhoneNumber varchar(15) = null,
	@schoolAddress varchar(100) = null,
	@schoolPostalCode varchar(7) = null,
	@schoolWebsite varchar(100) = null,
	@schoolDescription varchar(800) = null,
	@school_path varchar(200) = null,
	@schoolLocationID int = null,
	@schoolCrud varchar(1)
)
as begin
	if @schoolCrud='r'
	begin
		select SchoolName, TypeID, SchoolPhoneNumber, SchoolAddress, SchoolPostalCode,
			SchoolWebsite, SchoolDescription,'.\SchoolPictures\' + School_path as
			School_path from tbUniversitiesColleges where SchoolID = isnull(@schoolID,SchoolID)
	end
	else if @schoolCrud='c'
	begin
		insert into tbUniversitiesColleges(SchoolName,TypeID,SchoolPhoneNumber,SchoolAddress,SchoolPostalCode,SchoolWebsite,SchoolDescription,School_path,SchoolLocationID)
								values
								(@schoolName,@typeID,@schoolPhoneNumber,@schoolAddress,@schoolPostalCode,@schoolWebsite,@schoolDescription,@school_path,@schoolLocationID)
	end
	else if @schoolCrud='u'
	begin
		update tbUniversitiesColleges set
			   SchoolName = @schoolName,
			   TypeID = @typeID,
			   SchoolPhoneNumber = @schoolPhoneNumber,
			   SchoolAddress = @schoolAddress,
			   SchoolPostalCode = @schoolPostalCode,
			   SchoolWebsite = @schoolWebsite,
			   SchoolDescription = @schoolDescription,
			   School_path = @school_path,
			   SchoolLocationID = @schoolLocationID
		where SchoolID = @schoolID
	end
	else if @schoolCrud = 'd'
	begin
		delete from tbUniversitiesColleges where SchoolID = @schoolID
	end
	else if @schoolCrud = 's'
	begin
		select SchoolID, SchoolName, SchoolDescription,  tbTypeOfSchool.TypeOfSchool,
			tbLocation.LocationName  from tbUniversitiesColleges join tbTypeOfSchool on
			tbUniversitiesColleges.TypeID = tbTypeOfSchool.TypeID join tbLocation on 
			tbUniversitiesColleges.SchoolLocationID = tbLocation.LocationID 
			where tbUniversitiesColleges.SchoolLocationID = ISNULL(@schoolLocationID, tbUniversitiesColleges.SchoolLocationID)
			and tbUniversitiesColleges.TypeID = ISNULL(@schoolID,tbUniversitiesColleges.SchoolID)
	end
end
go

exec spSchoolCrud @schoolCrud = 'c',
		@schoolName = 'Booth University College',
		@typeID = 3,
		@schoolPhoneNumber = '204-942-3856',
		@schoolAddress = '447 Webb Place',
		@schoolPostalCode = 'R3B 2P2',
		@schoolWebsite = 'www.boothuc.ca',
		@schoolDescription = 'William and Catherine Booth University College, rooted in The Salvation Army’s Wesleyan theological tradition, brings together Christian faith, rigorous scholarship and a passion for service.  A small campus with just 250 students, located in downtown Winnipeg.',
		@school_path = 'BoothUC.png',
		@schoolLocationID = 7

exec spSchoolCrud @schoolCrud = 'c',
		@schoolName = 'Canadian Mennonite University',
		@typeID = 1,
		@schoolPhoneNumber = '204-487-3300',
		@schoolAddress = '500 Shaftesbury Boulevard',
		@schoolPostalCode = 'R3P 2N2',
		@schoolWebsite = 'www.cmu.ca/',
		@schoolDescription = 'CMU offers comprehensive university education within a dynamic and diverse Christian community. Exemplary academic studies across the arts and sciences are distinguished by interdisciplinary interaction, experiential learning, and quality connection between students and faculty.',
		@school_path = 'CanadianMennoniteUniversity.jpg',
		@schoolLocationID = 9

exec spSchoolCrud @schoolCrud = 'c',
		@schoolName = 'Herzing College Winnipeg',
		@typeID = 3,
		@schoolPhoneNumber = '204-775-8175',
		@schoolAddress = '1700 Portage Avenue',
		@schoolPostalCode = 'R3J 0E1',
		@schoolWebsite = 'www.herzing.ca/winnipeg',
		@schoolDescription = 'We provide a career-focused education that provides students with marketable skills that employers are seeking.  Each campus works closely with local and regional employers to ensure that Herzing programs encompass the skills and knowledge needed for our students to succeed.',
		@school_path = 'Herzing.png',
		@schoolLocationID = 7

exec spSchoolCrud @schoolCrud = 'c',
		@schoolName = 'Red River College',
		@typeID = 3,
		@schoolPhoneNumber = '204-632-2327',
		@schoolAddress = '2055 Notre Dame Avenue',
		@schoolPostalCode = 'R3H 0J9',
		@schoolWebsite = 'www.rrc.mb.ca',
		@schoolDescription = 'We have 4 campuses scattered throughout Winnipeg, and 5 more outside Winnipeg.  We are Manitoba’s largest institute of applied learning and research, with more than 200 full- and part-time degree, diploma and certificate options.  We have close to 22,000 students each year from more than 60 countries.',
		@school_path = 'RedRiverCollege.jpg',
		@schoolLocationID = 10

exec spSchoolCrud @schoolCrud = 'c',
		@schoolName = 'Robertson College',
		@typeID = 3,
		@schoolPhoneNumber = '204-926-8325',
		@schoolAddress = '265 Notre Dame Avenue',
		@schoolPostalCode = 'R3B 1N9',
		@schoolWebsite = 'www.robertsoncollege.com',
		@schoolDescription = 'Having been in operation for over 100 years, Robertson College has established itself as a leading private post-secondary institution in Canada.  There are 12 locations in Canada and one in China.',
		@school_path = 'RobertsonCollege.png',
		@schoolLocationID = 9

exec spSchoolCrud @schoolCrud = 'c',
		@schoolName = 'University of Manitoba',
		@typeID = 2,
		@schoolPhoneNumber = '204-474-8880',
		@schoolAddress = '66 Chancellors Circle',
		@schoolPostalCode = 'R3T 2N2',
		@schoolWebsite = 'www.umanitoba.ca',
		@schoolDescription = 'Since 1877, the University of Manitoba has been driving discovery and inspiring minds through innovative teaching and research excellence. The U of M has 24,000 undergraduate and graduate students studying more than 90 degree programs.',
		@school_path = 'UniversityManitoba.png',
		@schoolLocationID = 5

exec spSchoolCrud @schoolCrud='c',
		@schoolName = 'University of Winnipeg',
		@typeID = 2,
		@schoolPhoneNumber = '204-786-7811',
		@schoolAddress = '515 Portage Avenue',
		@schoolPostalCode = 'R3B 2E9',
		@schoolWebsite = 'www.uwinnipeg.ca',
		@schoolDescription = 'The University of Winnipeg was founded in 1871 and offers high-quality undergraduate and graduate programs. The U of W consistently ranks highly in national surveys for overall reputation, small class sizes, academic excellence and commitment to the environment.  There are 9,175 undergraduate students and 274 graduate students.',
		@school_path = 'UniversityWinnipeg',
		@schoolLocationID = 9

--exec spSchoolCrud @schoolCrud = 'r'
--exec spSchoolCrud @schoolCrud = 's'
--go