using master;
go
drop database dbGroupProject;
go
create database dbGroupProject;
go
use dbGroupProject;
go

create table tbAbout
(
	aboutID int identity(1,1) primary key,
	title	varchar(30),
	description varchar(500)
)
insert into tbAbout (Title, Description) values
	('Origins','The City of Winnipeg lies at the confluence of the Red River and the Assiniboine River, known as The Forks.  It was created on November 8, 1873 near the present day intersection of Portage Avenue and Main Street.'),
	('Now','Winnipeg is the capital and largest city of the province of Manitoba in Canada. It is near the longitudinal centre of North America and is 110 kilometres from the Canada–United States border.'),
	('Population','The city has a population of 749,500, while the Province of Manitoba has a total population of 1.33 million.   (Estimated 2017)')


create table tbWeather
(
	month varchar(10),
	high varchar(7),
	low varchar(7)
)
insert into tbWeather (month, high, low) values
	('Month','Avg High','Avg Low'),
	('January','-10 C','-20 C'),
	('February','-10 C','-20 C'),
	('March','-10 C','-20 C'),
	('April','-10 C','-20 C'),
	('May','-10 C','-20 C'),
	('June','-10 C','-20 C'),
	('July','-10 C','-20 C'),
	('August','-10 C','-20 C'),
	('September','-10 C','-20 C'),
	('October','-10 C','-20 C'),
	('November','-10 C','-20 C'),
	('December','-10 C','-20 C')

create table tbHotels
(
	hotelID int identity(1,1) primary key,
	name	varchar(30),
	phoneNumber varchar(15),
	address varchar(100),
	website varchar(100),
	description varchar(500)
)
insert into tbHotels (name, phoneNumber, address, description) values
	('The Fort Garry Hotel','1-866-500-4938','222 Broadway','www.fortgarryhotel.com','Located in downtown Winnipeg, the Fort Garry Hotel was built in 1913 as a grand railway hotel.  The century-old Fort Garry Hotel, Spa and Conference Centre ushers in a new era of modern-day style in downtown Winnipeg. Catering to guests who appreciate local history mixed with authentic charm, this iconic 240-room “Grand Dame” is a favorite for weddings, romantic getaways and wellness weekends. Don’t leave without saying hello to one of the hotel’s friendly resident ghosts.'),
	('Viscount Gort Hotel','1-866-500-4939','1670 Portage Avenue','www.viscount-gort.com','(Pronounced vī kount), the Viscount Gort is located minutes from Polo Park Shopping Centre.  We offer free parking for our guests and a free shuttle to and from the airport. City buses stop close by and there are plenty of taxi and limo services always available.'),
	('Inn at the Forks','1-866-500-4938','75 Forks Market Road','www.innforks.com','Located in downtown Winnipeg at The Forks, our top tourism attraction, you''re immersed in a convergence of cultures – Aboriginal, French Canadian and Manitoban – at a 6,000-year-old meeting place. The myriad of shopping, arts, and entertainment options on-site and nearby is unmatched.'),
	('Delta Hotels by Marriott Winnipeg','204-942-0551','350 St Mary Avenue','www.marriott.com/hotels/travel/ywgdw-delta-hotels-winnipeg','The Delta Hotels Winnipeg has established itself as a premier destination for business travelers and vacationing families here in the heart of the city.  Take a dip in the heated indoor pool, or relax on the rooftop at our seasonal outdoor pool when the weather here in Winnipeg is warm.  Those visiting here in the city will love our hotel''s downtown location and our versatile event venues. And we offer direct Skywalk access to the RBC Convention Centre, BellMTS Place and much more, making exploration easy.'),
	('Radisson Hotel Winnipeg Downtown','204-956-0410','288 Portage Avenue','www.radisson.com/winnipeg-hotel-mb-r3c0b8/mbwinnip','Conveniently located on Portage Avenue, Radisson Hotel Winnipeg Downtown is within sight of the Burton Cummings Theatre and area shopping centres.  Open on weekdays from 7:30 a.m. to 5 p.m., our skywalk connects you to Cityplace, Bell MTS Place and Winnipeg Square. The Radisson is also less than 20 minutes from Winnipeg James Armstrong Richardson International Airport (YWG) and within a 10-minute walk of the Canadian Museum for Human Rights, the Exchange District, the RBC Convention Centre and Chinatown.'),
	('Canad Inns Destination Centre Health Sciences Centre','204-594-9472','720 William Avenue','www.canadinns.com/stay/health-sciences-centre','Our hotel is conveniently attached to the Health Sciences Centre, located just a few minutes from downtown Winnipeg, including shopping at Portage Place and The Forks, and just a five minute drive from McPhillips Station Casino.  For your comfort, our hotel offers a number of universally-accessible and wheelchair-friendly rooms.'),
	('Hilton Suites Winnipeg Airport Suites','204-783-1700','1800 Wellington Avenue','www3.hilton.com/en/hotels/manitoba/hilton-winnipeg-airport-suites-YWGWIHF/index.html','Located in Winnipeg Airport Industrial Park, we provide easy access to downtown Winnipeg. Use the complimentary airport shuttle service to/from the hotel. Polo Park Mall, the largest shopping center in Manitoba with over 200 stores, is less than 2 miles away. We’re also a short drive to the newest Outlet Collection Winnipeg.')