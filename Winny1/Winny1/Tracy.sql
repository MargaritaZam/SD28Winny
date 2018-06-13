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
	AboutTitle	varchar(30),
	AboutDescription varchar(500)
)
insert into tbAbout (AboutTitle, AboutDescription) values
	('Origins','The confluence of the Red and the Assiniboine Rivers, known as The Forks, has been a meeting place for 6,000 years.  The city was created on November 8, 1873 near the present day intersection of Portage Avenue and Main Street and is named after the Western Cree words for ''Muddy Water''.'),
	('Now','Winnipeg is the capital and largest city of the province of Manitoba in Canada. It is near the longitudinal centre of North America and is 110 kilometres from the Canada–United States border.'),
	('Population','The city has a population of 749,500, while the Province of Manitoba has a total population of 1.33 million.  (Estimated 2017)')
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
	HotelName	varchar(30),
	HotelPhoneNumber varchar(15),
	HotelAddress varchar(100),
	HotelPostalCode varchar(7),
	HotelWebsite varchar(100),
	HotelDescription varchar(800),
	Hotel_path varchar(200),
	HotelLocationID int foreign key references tbLocation(LocationID)
)
go

create table tbUniversitiesColleges
(
	SchoolID int identity(1,1) primary key,
	SchoolName varchar(100),
	SchoolPhoneNumber varchar(15),
	SchoolAddress varchar(100),
	SchoolPostalCode varchar(7),
	SchoolWebsite varchar(100),
	SchoolDescription varchar(800),
	School_path varchar(200),
	SchoolLocationID int foreign key references tbLocation(LocationID)
)
go

create procedure spHotelsCrud
(
	@hotelID int = null,
	@hotelName	varchar(30) = null,
	@hotelPhoneNumber varchar(15) = null,
	@hotelAddress varchar(100) = null,
	@hotelPostalCode varchar(7) = null,
	@hotelWebsite varchar(100) = null,
	@hotelDescription varchar(800) = null,
	@hotel_path varchar(200) = null,
	@hotelLocationID int,
	@crud varchar(1)
)
as begin
	if @crud='r'
	begin
		select HotelName, HotelPhoneNumber, HotelAddress, HotelPostalCode, HotelWebsite, HotelDescription,'.\HotelPictures\' + Hotel_path as Hotel_path from tbHotels where HotelId=isnull(@HotelId,HotelId)
	end
	else if @crud='c'
	begin
		insert into tbHotels(HotelName,HotelPhoneNumber,HotelAddress,HotelPostalCode,HotelWebsite,HotelDescription,Hotel_path,HotelLocationID)
								values
								(@hotelName,@hotelPhoneNumber,@hotelAddress,@hotelPostalCode,@hotelWebsite,@hotelDescription,@hotel_path,@hotelLocationID)
	end
	else if @crud='u'
	begin
		update tbHotels set
			   HotelName = @hotelName,
			   HotelPhoneNumber = @hotelPhoneNumber,
			   HotelAddress = @hotelAddress,
			   HotelPostalCode = @hotelPostalCode,
			   HotelWebsite = @hotelWebsite,
			   HotelDescription = @hotelDescription,
			   Hotel_path = @hotel_path,
			   HotelLocationID = @hotelLocationID
		where HotelID = @hotelID
	end
	else if @crud = 'd'
	begin
		delete from tbHotels where HotelID = @hotelID
	end
end
go

exec spHotelsCrud @crud='c',
			  @hotelName='Canad Inns Destination Centre Health Sciences Centre',
			  @hotelPhoneNumber='204-594-9472',
			  @hotelAddress='720 William Avenue',
			  @hotelPostalCode='R3E 3J7',
			  @hotelWebsite='www.canadinns.com/stay/health-sciences-centre',
			  @hotelDescription='Our hotel is conveniently attached to the Health Sciences Centre, located just a few minutes from downtown Winnipeg, including shopping at Portage Place and The Forks, and just a five minute drive from McPhillips Station Casino.  For your comfort, our hotel offers a number of universally-accessible and wheelchair-friendly rooms.',
			  @hotel_path='CanadInnsHSC.png',
			  @hotelLocationId=9
			  

exec spHotelsCrud @crud='c',
			  @hotelName='Clarion Hotel & Suites',
			  @hotelPhoneNumber='204-774-5110',
			  @hotelAddress='1445 Portage Avenue',
			  @hotelPostalCode='R3G 3P4',
			  @hotelWebsite='www.clarionhotelwinnipeg.com',
			  @hotelDescription='the hotel is nestled in the hub of Winnipeg’s shopping, restaurant and business neighbourhoods. Located just 6 km from the James Richard Armstrong International Airport (YWG), Ikea and the new Seasons Outlet Collection Mall, and within walking distance to Manitoba’s largest Mall CF Polo Park Shopping Centre. The Clarion Hotel is only 15 minutes from downtown Winnipeg.',
			  @hotel_path='ClarionPoloPark.jpg',
			  @hotelLocationId=7

exec spHotelsCrud @crud='c',
			  @hotelName='Delta Hotels by Marriott Winnipeg',
			  @hotelPhoneNumber='204-942-0551',
			  @hotelAddress='350 St Mary Avenue',
			  @hotelPostalCode='R3C 3J2',
			  @hotelWebsite='www.marriott.com/hotels/travel/ywgdw-delta-hotels-winnipeg',
			  @hotelDescription='The Delta Hotels Winnipeg has established itself as a premier destination for business travelers and vacationing families here in the heart of the city.  Take a dip in the heated indoor pool, or relax on the rooftop at our seasonal outdoor pool when the weather here in Winnipeg is warm.  Those visiting here in the city will love our hotel''s downtown location and our versatile event venues. And we offer direct Skywalk access to the RBC Convention Centre, BellMTS Place and much more, making exploration easy.',
			  @hotel_path='DeltaHotel.png',
			  @hotelLocationId=9

exec spHotelsCrud @crud='c',
			  @hotelName='The Fort Garry Hotel',
			  @hotelPhoneNumber='204-942-8251',
			  @hotelAddress='222 Broadway',
			  @hotelPostalCode='R3C 0R3',
			  @hotelWebsite='www.fortgarryhotel.com',
			  @hotelDescription='Located in downtown Winnipeg, the Fort Garry Hotel was built in 1913 as a grand railway hotel.  The century-old Fort Garry Hotel, Spa and Conference Centre ushers in a new era of modern-day style in downtown Winnipeg. Catering to guests who appreciate local history mixed with authentic charm, this iconic 240-room “Grand Dame” is a favorite for weddings, romantic getaways and wellness weekends. Don’t leave without saying hello to one of the hotel’s friendly resident ghosts.',
			  @hotel_path='FortGarryHotel.jpg',
			  @hotelLocationId=9

exec spHotelsCrud @crud='c',
			  @hotelName='Hilton Winnipeg Airport Suites',
			  @hotelPhoneNumber='204-783-1700',
			  @hotelAddress='1800 Wellington Avenue',
			  @hotelPostalCode='R3H 1B2',
			  @hotelWebsite='www3.hilton.com/en/hotels/manitoba/hilton-winnipeg-airport-suites-YWGWIHF/index.html',
			  @hotelDescription='Located in Winnipeg Airport Industrial Park, we provide easy access to downtown Winnipeg. Use the complimentary airport shuttle service to/from the hotel. Polo Park Mall, the largest shopping center in Manitoba with over 200 stores, is less than 2 miles away. We’re also a short drive to the newest Outlet Collection Winnipeg.',
			  @hotel_path='HiltonAirport.jpg',
			  @hotelLocationId=10

exec spHotelsCrud @crud='c',
			  @hotelName='Inn at the Forks',
			  @hotelPhoneNumber='1-866-500-4938',
			  @hotelAddress='75 Forks Market Road',
			  @hotelPostalCode='R3C 0A2',
			  @hotelWebsite='www.innforks.com',
			  @hotelDescription='Located in downtown Winnipeg at The Forks, our top tourism attraction, you''re immersed in a convergence of cultures – Aboriginal, French Canadian and Manitoban – at a 6,000-year-old meeting place. The myriad of shopping, arts, and entertainment options on-site and nearby is unmatched.',
			  @hotel_path='InnAtTheForks.jpg',
			  @hotelLocationId=9

exec spHotelsCrud @crud='c',
			  @hotelName='Radisson Hotel Winnipeg Downtown',
			  @hotelPhoneNumber='204-956-0410',
			  @hotelAddress='288 Portage Avenue',
			  @hotelPostalCode='R3C 0B8',
			  @hotelWebsite='www.radisson.com/winnipeg-hotel-mb-r3c0b8/mbwinnip',
			  @hotelDescription='Conveniently located on Portage Avenue, Radisson Hotel Winnipeg Downtown is within sight of the Burton Cummings Theatre and area shopping centres.  Open on weekdays from 7:30 a.m. to 5 p.m., our skywalk connects you to Cityplace, Bell MTS Place and Winnipeg Square. The Radisson is also less than 20 minutes from Winnipeg James Armstrong Richardson International Airport (YWG) and within a 10-minute walk of the Canadian Museum for Human Rights, the Exchange District, the RBC Convention Centre and Chinatown.',
			  @hotel_path='RadissonHotel.jpg',
			  @hotelLocationId=9

exec spHotelsCrud @crud='c',
			  @hotelName='Royal Albert Arms',
			  @hotelPhoneNumber='204-943-8433',
			  @hotelAddress='48 Albert Street',
			  @hotelPostalCode='R3B 1E7',
			  @hotelWebsite='none',
			  @hotelDescription='The Royal Albert Hotel with its 54 rooms, restaurant, coffee shop and cigar stand opened its doors on November 5, 1913.  The façade of the hotel was designed with a continental flair. A red-tiled roof forms a cornice over a brick front accentuated with ornamental iron fretwork, elaborate iron lights and arched main floor windows and doors which combine to create an Italian effect.',
			  @hotel_path='RoyalAlbertArmsHotel.jpg',
			  @hotelLocationId=9

exec spHotelsCrud @crud='c',
			  @hotelName='Viscount Gort Hotel',
			  @hotelPhoneNumber='1-800-665-1122',
			  @hotelAddress='1670 Portage Avenue',
			  @hotelPostalCode='R3J 0C9',
			  @hotelWebsite='www.viscount-gort.com',
			  @hotelDescription='Pronounced vī kount, the Viscount Gort is located minutes from Polo Park Shopping Centre.  We offer free parking for our guests and a free shuttle to and from the airport. City buses stop close by and there are plenty of taxi and limo services always available.',
			  @hotel_path='ViscountGort.png',
			  @hotelLocationId=7

--------  ADD Hotel template  ----------------

--exec spHotelsCrud @crud = 'c',
--			  @hotelName = '',
--			  @hotelPhoneNumber = '',
--			  @hotelAddress = '',
--			  @hotelPostalCode = '',
--			  @hotelWebsite = '',
--			  @hotelDescription = '',
--			  @hotel_path = '',
--			  @hotelLocationId = ?

select * from tbHotels
go

create procedure spUniversitiesCollegesCrud
(
	@schoolID int = null,
	@schoolName varchar(100) = null,
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
		select SchoolName, SchoolPhoneNumber, SchoolAddress, SchoolPostalCode, SchoolWebsite, SchoolDescription,'.\SchoolPictures\' + School_path as School_path from tbUniversitiesColleges where SchoolId=isnull(@SchoolId,SchoolId)
	end
	else if @schoolCrud='c'
	begin
		insert into tbUniversitiesColleges(SchoolName,SchoolPhoneNumber,SchoolAddress,SchoolPostalCode,SchoolWebsite,SchoolDescription,School_path,SchoolLocationID)
								values
								(@schoolName,@schoolPhoneNumber,@schoolAddress,@schoolPostalCode,@schoolWebsite,@schoolDescription,@school_path,@schoolLocationID)
	end
	else if @schoolCrud='u'
	begin
		update tbUniversitiesColleges set
			   SchoolName = @schoolName,
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
end
go

exec spUniversitiesCollegesCrud @schoolCrud = 'c',
		@schoolName = 'Booth University College',
		@schoolPhoneNumber = '204-942-3856',
		@schoolAddress = '447 Webb Place',
		@schoolPostalCode = 'R3B 2P2',
		@schoolWebsite = 'www.boothuc.ca',
		@schoolDescription = 'William and Catherine Booth University College, rooted in The Salvation Army’s Wesleyan theological tradition, brings together Christian faith, rigorous scholarship and a passion for service.  A small campus with just 250 students, located in downtown Winnipeg.',
		@school_path = 'BoothUC.png',
		@schoolLocationId = 7

exec spUniversitiesCollegesCrud @schoolCrud = 'c',
		@schoolName = 'Canadian Mennonite University',
		@schoolPhoneNumber = '204-487-3300',
		@schoolAddress = '500 Shaftesbury Boulevard',
		@schoolPostalCode = 'R3P 2N2',
		@schoolWebsite = 'www.cmu.ca/',
		@schoolDescription = 'CMU offers comprehensive university education within a dynamic and diverse Christian community. Exemplary academic studies across the arts and sciences are distinguished by interdisciplinary interaction, experiential learning, and quality connection between students and faculty.',
		@school_path = 'CanadianMennoniteUniversity.jpg',
		@schoolLocationId = 9

exec spUniversitiesCollegesCrud @schoolCrud = 'c',
		@schoolName = 'Herzing College Winnipeg',
		@schoolPhoneNumber = '204-775-8175',
		@schoolAddress = '1700 Portage Avenue',
		@schoolPostalCode = 'R3J 0E1',
		@schoolWebsite = 'www.herzing.ca/winnipeg',
		@schoolDescription = '',
		@school_path = 'Herzing.png',
		@schoolLocationId = 7

exec spUniversitiesCollegesCrud @schoolCrud = 'c',
		@schoolName = 'Red River College',
		@schoolPhoneNumber = '204-632-2327',
		@schoolAddress = '2055 Notre Dame Avenue',
		@schoolPostalCode = 'R3H 0J9',
		@schoolWebsite = 'www.rrc.mb.ca',
		@schoolDescription = 'We have 4 campuses scattered throughout Winnipeg, and 5 more outside Winnipeg.  We are Manitoba’s largest institute of applied learning and research, with more than 200 full- and part-time degree, diploma and certificate options.  We have close to 22,000 students each year from more than 60 countries.',
		@school_path = 'RedRiverCollege.jpg',
		@schoolLocationId = 10

exec spUniversitiesCollegesCrud @schoolCrud = 'c',
		@schoolName = 'Robertson College',
		@schoolPhoneNumber = '204-926-8325',
		@schoolAddress = '265 Notre Dame Avenue',
		@schoolPostalCode = 'R3B 1N9',
		@schoolWebsite = 'www.robertsoncollege.com',
		@schoolDescription = 'Having been in operation for over 100 years, Robertson College has established itself as a leading private post-secondary institution in Canada.  There are 12 locations in Canada and one in China.',
		@school_path = 'RobertsonCollege.png',
		@schoolLocationId = 9

exec spUniversitiesCollegesCrud @schoolCrud = 'c',
		@schoolName = 'University of Manitoba',
		@schoolPhoneNumber = '204-474-8880',
		@schoolAddress = '66 Chancellors Circle',
		@schoolPostalCode = 'R3T 2N2',
		@schoolWebsite = 'www.umanitoba.ca',
		@schoolDescription = 'Since 1877, the University of Manitoba has been driving discovery and inspiring minds through innovative teaching and research excellence. The U of M has 24,000 undergraduate and graduate students studying more than 90 degree programs.',
		@school_path = 'UniversityManitoba.png',
		@schoolLocationId = 5

exec spUniversitiesCollegesCrud @schoolCrud='c',
		@schoolName = 'University of Winnipeg',
		@schoolPhoneNumber = '204-786-7811',
		@schoolAddress = '515 Portage Avenue',
		@schoolPostalCode = 'R3B 2E9',
		@schoolWebsite = 'www.uwinnipeg.ca',
		@schoolDescription = 'The University of Winnipeg was founded in 1871 and offers high-quality undergraduate and graduate programs. The U of W consistently ranks highly in national surveys for overall reputation, small class sizes, academic excellence and commitment to the environment.  There are 9,175 undergraduate students and 274 graduate students.',
		@school_path = 'UniversityWinnipeg',
		@schoolLocationId = 9

select * from tbUniversitiesColleges
go