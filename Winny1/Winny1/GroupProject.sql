use master;
go
drop database dbGroupProject;
go
create database dbGroupProject;
go
use dbGroupProject;



create table tbEvents(
eventID int identity(1,1) primary key,
type varchar(60),
name varchar(200),
description varchar(max),
website varchar(100),
image varchar(100),
date varchar(max)
)
go

create procedure spEvents(
@eventID int=null,
@name varchar(200)=null,
@type varchar(60) =null,
@description varchar(max)=null,
@web varchar(100)=null,
@image varchar(100)=null,
@date varchar(max)=null,
@crud varchar(1)
)
as begin
if @crud='r'
begin
select eventID, name, type, description, website, './Events/' + image as image, date from tbEvents
where eventID=isnull(@eventID, eventID)
end
else if @crud='c'
begin
insert into tbEvents(name,type, description, website, image, date)values
                   (@name, @type, @description, @web, @image, @date)
 end
 else if @crud='d'
 begin
 delete from tbEvents where eventID=@eventID
	end
 end
 go

 exec spEvents @crud='c',@name='Folklorama',
                         @type='Festival',
                         @description='Experience the energy and excitement of the largest and longest-running multicultural event of its kind in the world! From traditional meals to lively performances by local, national and international entertainers, Folklorama creates a feast for the senses as you experience over 40 cultural pavilions that feature amazing hospitality and a fun, celebratory atmosphere. Enjoy our two-week Festival, the highlight of August in Winnipeg!',
						 @web='https://www.folklorama.ca',
						 @image='folklorama.png',
						 @date='August 5, 2018 to August 18, 2018'

exec spEvents @crud='c',@name='Winnipeg Beer Festival',
                         @type='Festival',
                         @description='Join us for the second Annual Winnipeg Beer Festival! Enjoy locally brewed beer and delicious food inside Fort Gibraltar*s walls. This event is made possible in conjuction with the Manitoba Brewers Association. It will feature over ten Winnipeg breweries and over 20 beers for you to sample on the historic grounds of Fort Gibraltar.',
						 @web='https://www.facebook.com/wpgbeerfest/',
						 @image='beerfest.jpg',
						 @date='August 12, 2018'

exec spEvents @crud='c',@name='Manitoba Night Market & Festival',
                         @type='Festival',
                         @description='Join us for our 3rd Manitoba Night Market & Festival! More than 20 food trucks, 150 plus vendors, live music, beer gardens, microbreweries, kids activities. ',
						 @web='https://www.asdowns.com',
						 @image='night_market.jpg',
						 @date='August 2, 2018'

exec spEvents @crud='c',@name='Lights of the North - Chinese Lantern Light Festival ',
                         @type='Festival',
                         @description='Occupying over 10 acres, the scale of this giant exposition of Chinese lantern art will be sure to amaze! In addition to specially designed lantern exhibits depicting Manitoba, Canada and Chinese icons and symbols illuminated by millions of LED lights, there will be live performances by Chengdu acrobats and dancers. Chinese artisans will demonstrate their talents on site making heritage handcrafts to the delight of audiences and shoppers.',
						 @web='https://www.lightsofthenorth.ca',
						 @image='lights.jpg',
						 @date='August 31, 2018 to October 14, 2018 '

exec spEvents @crud='c',@name='Summer with the Impressionists',
                         @type='Exhibition',
                         @description='Spend summer with the Impressionists and experience 100 works spanning 100 years. See two exhibits – French Moderns: Monet to Matisse, 1850-1950 organized in collaboration with the Brooklyn Museum, New York, and The Impressionists on Paper, organized in partnership with the National Gallery of Canada.',
						 @web='http://impress.wag.ca/',
						 @image='impr.jpg',
						 @date='July 31, 2018 to September 9, 2018 '

 exec spEvents @crud='c',@name='Planetarium*s 50TH Anniversary Laser Shows',
                         @type='Exhibition',
                         @description='A laser show is a music-based Planetarium program combining music with synchronized laser light effects. Take some awesome music. Classic rock, electronic, retro, whatever. Play it really loud in the Planetarium. Shoot lasers at the dome in all sorts of amazing patterns, from hypnotic abstract patterns to animated characters. ',
						 @web='https://manitobamuseum.ca/main/visit/planetarium/lasers/',
						 @image='planetarium.jpg',
						 @date='July 31, 2018 to September 3, 2018 '

exec spEvents @crud='c',@name='Jerry Rubin: Art That Pops',
                         @type='Exhibition',
                         @description='I fall asleep every night thinking about the piece I’m currently painting; working out in my subconscious mind the details, colours, placements, and surmountable obstacles. Every morning I awake with joy, anxious to begin the fun. ',
						 @web='http://pulsegallery.ca/',
						 @image='capture.jpg',
						 @date='August 1, 2018 to August 31, 2018 '

exec spEvents @crud='c',@name='Beauty and the Beast',
                         @type='Play',
                         @description='Step into the enchanted world of Broadway’s modern classic, Disney’s Beauty and the Beast, an international sensation that has played to over 35 million people worldwide in 13 countries. Based on the Academy Award-winning animated feature, the stage version includes all of the wonderful songs written by Alan Menken and the late Howard Ashman, along with new songs by Mr. Menken and Tim Rice. The original Broadway production ran for over thirteen years and was nominated for nine Tony Awards, including Best Musical. The classic story tells of Belle, a young woman in a provincial town, and the Beast, who is really a young prince trapped under the spell of an enchantress. If the Beast can learn to love and be loved, the curse will end and he will be transformed into his former self. But time is running out. If the Beast does not learn his lesson soon, he and his household will be doomed for all eternity.',
						 @web='http://www.rainbowstage.ca/',
						 @image='beauty.jpg',
						 @date='August 14, 2018 to August 30, 2018 '

exec spEvents @crud='r'
go
select*from tbEvents
go

create procedure spSearchFest(
@festival varchar(60)
)
as begin
select eventID,type,name,description,website,date,'/Events/'+image as image from tbEvents
where type=@festival
end
go
create procedure spSearchExhibition(
@exhibition varchar(60)
)
as begin
select eventID,type,name,description,website,date,'/Events/'+image as image from tbEvents
where type=@exhibition
end
go
create procedure spSearchPlay(
@play varchar(60)
)
as begin
select eventID,type,name,description,website,date,'/Events/'+image as image from tbEvents
where type=@play
end
go

create table tbSlide(
	slideID int identity(1,1) primary key,
	slidedesc varchar(60),
	path varchar(60)
)
go

create procedure spSlide
(
	@slideID int=null,
	@slidedesc varchar(60)=null,
	@path varchar(60)=null,
	@crud varchar(1)
)
as begin
	if @crud='r'
	begin
		select slideID, slidedesc, './Slides/'+ path as path from tbSlide
		where slideID=isnull(@slideID, slideID)
	end
	else if @crud='n'
	begin
		insert into tbSlide(slidedesc, path)values
						   (@slidedesc, @path)
	end
end
go

go

create procedure spGetSlides
as begin
	select*from tbSlide
end
go

--  Location Table and Procedure  --

create table tbLocation
(
	locationID int identity(0,1) primary key,
	locationName varchar(60)
)
insert into tbLocation(locationName) values
('North'),('Northeast'),('East'),('Southeast'),
('South'),('Southwest'),('West'),('Northwest'),
('Downtown'),('Airport/West'),('Just Outside Winnipeg')
go

go

create procedure spLocation
(
	@LocationID int=null ,
	@LocationName varchar(30)=null
)
as begin
	select * from tbLocation where LocationID=isnull(@LocationID,LocationID)
end
go

--  Attraction Table and Procedures  --

create table tbAttractions
(
	attractionID int identity(1,1) primary key,
	attractionCategory varchar(150),
	atName varchar(100),
	atDesc varchar(650),
	atAddress varchar(200),
	atPhone varchar(20),
	atWebsite varchar(300),
	atImage varchar(60),
	location int foreign key references tbLocation(locationID)
)
go

create procedure spAttractions
(
	@id int =null,
	@category varchar(150)=null,
	@name varchar(100)=null,
	@desc varchar(650)=null,
	@address varchar(100)=null,
	@phone varchar(20)=null,
	@website varchar(200)=null,
	@image varchar(60)=null,
	@location int=null,
	@crud varchar(10),
	@search varchar(50)=null
)
as begin
	if @crud ='r'
	begin
		select attractionID, attractionCategory,
		atName, atDesc, atAddress, atPhone,
		atWebsite, './Attractions/'+ atImage as atImage, location from tbAttractions
		where attractionID=isnull(@id, attractionID)
	end
	else if @crud='search'
	begin
			select attractionCategory,atName,atDesc,atAddress,atPhone,atWebsite,attractionID,location, './Attractions/' + atImage as atImage from tbAttractions  
						 
						 
where atName like'%'+ @search+'%'
    or attractionCategory like'%'+ @search+'%'
	or location like'%'+ @search+'%'
	end
	else if @crud='c'
	begin
		insert into tbAttractions(attractionCategory, atName, atDesc, 
			atAddress, atPhone, atWebsite, atImage, location) values
			(@category, @name, @desc, @address, @phone, @website, @image, @location)
	end
	else if @crud='AtoF'
	begin
		select atName,atDesc,atAddress,atPhone,atWebsite,attractionID,location, './Attractions/' + atImage as atImage from tbAttractions where atName between 'A%' and 'F%'
	end
	else if @crud='GtoL'
	begin
		select atName,atDesc,atAddress,atPhone,atWebsite,attractionID,location, './Attractions/' + atImage as atImage from tbAttractions where atName between 'G%' and 'L%'
	end
	else if @crud='MtoR'
	begin
		select atName,atDesc,atAddress,atPhone,atWebsite,attractionID,location, './Attractions/' + atImage as atImage from tbAttractions where atName between 'M%' and 'R%'
	end
	else if @crud='StoZ'
	begin
		select atName,atDesc,atAddress,atPhone,atWebsite,attractionID,location, './Attractions/' + atImage as atImage from tbAttractions where atName between 'S%' and 'Z%'
	end
	else if @crud='1to10'
	begin
		select atName,atDesc,atAddress,atPhone,atWebsite,attractionID,location, './Attractions/' + atImage as atImage from tbAttractions  where attractionID between 1 and 10
	end
	else if @crud='a'  --  Select Attractions 
	begin
		select attractionID, attractionCategory, atName, atDesc, atAddress, 
				atPhone, atWebsite, './Attractions/'+ atImage as atImage, location 
			from tbAttractions
			where attractionCategory=isnull (@category, attractionCategory)
	end
	else if @crud='x'  --  Select Attraction's Categories
	begin
		select attractionID, attractionCategory, atName, atDesc, atAddress, 
				atPhone, atWebsite, './Attractions/'+ atImage as atImage, location 
			from tbAttractions
			where attractionCategory=@category
	end
	else if @crud='f'
	begin
	select distinct attractionCategory from tbAttractions
	end
	else if @crud='z'  --  Select attractions by Category
	begin
		select * from tbAttractions where attractionCategory=@category
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

create procedure spGetAttraction
(
	@id int =null
)
as begin
	select*from tbAttractions
	where @id=isnull(@id, attractionID)
end
go

create procedure spGetCategory
as begin
	select distinct attractionCategory as Category from tbAttractions
end
go

--exec spGetCategory

exec spAttractions @crud='c', @category='Museums',
        @name='Winnipeg Police Museum',
        @desc='The Museum is displays artifacts related to the history of the Winnipeg Police Force, dating from its beginning in 1874.', 
		@address='245 Smith Street, Winnipeg', 
		@phone='(204) 986-3976',
        @website='http://winnipeg.ca/police/Museum/', 
		@image='Winnipeg-Police-Museum.jpg', 
		@location=9

exec spAttractions @crud='c', @category='Museums',
        @name='Canadian Museum for Human Right',
        @desc='Canadian Museum for Human Rights is the first national museum in Canada built outside the National Capital Region. The building was designed by Antoine Predock. The museum has 6 levels of exibits and 11 galleries accessible via inclined ramps or elevators.', 
		@address='85 Israel Asper Way, Winnipeg', 
		@phone='(204) 289-2000',
        @website='https://humanrights.ca/', 
		@image='Canadian-Museum-for-Human-Rights.jpg', 
		@location=9


exec spAttractions @crud='c', @category='Museums',
        @name='Winnipeg Railway Museum',
        @desc='Operated by volunteers from Midwestern Rail Association Inc. a non-profit charity, the museum has 37 000 square feet filled with railway artifacts, many more.', 
		@address='123 Main Street, Winnipeg', 
		@phone='(204) 942-4632',
        @website='http://www.wpgrailwaymuseum.com/', 
		@image='Winnipeg-Railway-Museum.jpg', 
		@location=9

exec spAttractions @crud='c', @category='Museums',
        @name='Royal Winnipeg Rifles Museum & Archives',
        @desc='The Museum had its humble beginnings at the Minto Armoury in Winnipeg in the mid-1960’s.  It was started as a local initiative to preserve the Regiment’s history, and was accredited as an official Canadian Forces Museum in the late 1970’s.  The Archives, the Regiments collection of historical documents and records, was formally established in 1994, its holdings having been boxed until that time.', 
		@address='969 St Matthews Avenue, Winnipeg', 
		@phone='',
        @website='https://rwrmuseum.com/', 
		@image='Royal-Winnipeg-Rifles-Museum-Archives.jpg', 
		@location=7

exec spAttractions @crud='c', @category='Museums',
        @name='The Manitoba Museum',
        @desc='Opened in 1932 as the Manitoba Museum of Man and Nature, today The Manitoba Museum is the largest not-for-profit heritage and science centre in Manitoba and is the recipient of many awards.', 
		@address='190 Rupert Avenue, Winnipeg', 
		@phone='(204) 956-2830',
        @website='https://manitobamuseum.ca/main/', 
		@image='Manitoba-Museum.jpg', 
		@location=9

exec spAttractions @crud='c', @category='Museums',
        @name='Manitoba Children*s Museum',
        @desc='The Children*s Museum is housed in the oldest surviving trainbfacility, built 1889, in Western Canada. With 12 permanent galleries presenting various displays and interactive activities, this Museum is a treasure trove of learning and fun.', 
		@address='45 Forks Market Road, Winnipeg', 
		@phone='(204) 924-4000',
        @website='https://childrensmuseum.com/', 
		@image='childrenmuseum.jpg', 
		@location=9

exec spAttractions @crud='c', @category='Museums',
        @name='Costume Museum of Canada',
        @desc='This is the first museum in Canada dedicated to the collection, preservation and presentation of clothing and textiles.', 
		@address='109 Pacific Avenue, Winnipeg', 
		@phone='(204) 989-0072',
        @website='http://www.costumemuseumcanada.com/', 
		@image='Costume-Museum-of-Canada.jpg', 
		@location=9


exec spAttractions @crud='c', @category='Galleries',
        @name='Winnipeg Art Gallery',
        @desc='Manitoba*s premiere public gallery founded in 1912, has nine galleries of contemporary and historical art with an emphasis on work by Manitoba artists. Rooftop restaurant, gift shop. ', 
		@address='300 Memorial Blvd, Winnipeg', 
		@phone='(204) 786-6641',
        @website='https://www.wag.ca/', 
		@image='art-gallery.jpg', 
		@location=9

exec spAttractions @crud='c', @category='Galleries',
        @name='Pulse Gallery',
        @desc='Pulse Gallery showcases the diversity of Manitoba*s talented artists -- with a modern twist. Colour is the star in this gallery. Art can stimulate; art can inspire; art can ignite.', 
		@address='25 Forks Market Rd (Johnston Terminal), Winnipeg', 
		@phone='(204) 957-7140',
        @website='http://www.pulsegallery.ca/', 
		@image='pulse.jpg', 
		@location=9

exec spAttractions @crud='c', @category='Galleries',
        @name='Warehouse Artworks',
        @desc=' The gallery presents original art, in a variety of media, mainly from Manitoba artists. ', 
		@address='222 McDermot Ave, Winnipeg', 
		@phone='(204) 943-1681',
        @website='https://www.facebook.com/pages/Warehouse-Artworks/238848533780', 
		@image='warehouse.jpg', 
		@location=9

exec spAttractions @crud='c', @category='Galleries',
        @name='Ukrainian Cultural & Educational Centre - Oseredok',
        @desc='Oseredok is the largest Ukrainian cultural institution of its kind. It features rotating exhibitions of Canadian and international Ukrainian artists, focusing on a variety of styles, media and artists. ', 
		@address='184 Alexander Ave East, Winnipeg', 
		@phone='(204) 942-0218',
        @website='http://oseredok.ca/', 
		@image='oseredok.jpg', 
		@location=9

exec spAttractions @crud='c', @category='Galleries',
        @name='Loch Gallery',
        @desc='Established in 1972, the Loch Gallery specializes in building collections of quality Canadian, American, British and European paintings and sculpture. ', 
		@address='306 St. Mary*s Road, Winnipeg', 
		@phone='(204) 791-2239 ',
        @website='http://www.lochgallery.com/', 
		@image='loch_winnipeg.jpg', 
		@location=3

exec spAttractions @crud='c', @category='Galleries',
        @name='Woodlands Gallery',
        @desc='Woodlands Gallery represents an engaging selection of contemporary works by emerging and established Canadian artists. In addition to original paintings, the gallery offers hand-made jewellery, ceramics, blown glass and mono-prints as well as professional custom framing.', 
		@address='535 Academy Road, Winnipeg', 
		@phone='(204) 947-0700',
        @website='http://www.woodlandsgallery.com/', 
		@image='woodland.jpg', 
		@location=9

exec spAttractions @crud='c', @category='Parks',
        @name='Assiniboine Park and Zoo',
        @desc='Assiniboine Park and Zoo is your destination for adventure, discovery and four seasons of family fun.', 
		@address='55 Pavilion Crescent, Winnipeg', 
		@phone='(204) 927-6000  ',
        @website='https://www.assiniboinepark.ca/', 
		@image='assiniboine-park-zoo.jpg', 
		@location=6

exec spAttractions @crud='c', @category='Parks',
        @name='Red River Exhibition Park',
        @desc='Spread out over a total of 194 ha (480 acres) and with 36. 4 ha (90 acres) already in use, the Red River Exhibition Park is a multi-purpose facility where a number of popular events are held each year including the Red River Exhibition.', 
		@address='3977 Portage Avenue, Winnipeg', 
		@phone='(204) 888-6990',
        @website='http://www.redriverex.com/', 
		@image='redriverex.jpg', 
		@location=7

exec spAttractions @crud='c', @category='Parks',
        @name='Birds Hill Provincial Park',
        @desc='This provincial park north of Winnipeg offers a number of activities. Featuring Kingfisher Lake, which can be used for swimming and boating, there is also a network of trails that visitors can walk, cycle or horseback ride in the summer, and snowmobile and cross-country ski in winter. The park, which is home to the Winnipeg Folk Festival, contains a number of picnic areas and campgrounds.', 
		@address='Hwy 59, 24 km (15 mi) N of downtown Winnipeg, Winnipeg', 
		@phone='(204) 654-6730',
        @website='http://www.gov.mb.ca/sd/parks/popular_parks/central/birds_info.html#map', 
		@image='birdshill.png', 
		@location=1

exec spAttractions @crud='c', @category='Parks',
        @name='Kildonan Park',
        @desc='Established in 1909, the park features the Peguis Pavilion, Rainbow Stage, the Witch*s Hut, an Olympic-sized outdoor swimming pool, duck pond, and soccer field as well as picnic tables and barbecue pits.There are picnic sites and shelters available for rent.In winter the park features a skating pond and two tobogganing slides.', 
		@address='2015 Main Street, Winnipeg', 
		@phone='311 ',
        @website='http://www.winnipeg.ca/publicworks/parksOpenSpace/default.stm', 
		@image='kildonanpark.jpg', 
		@location=1

exec spAttractions @crud='c', @category='Parks',
        @name='St. Vital Park',
        @desc='Situated on the Red River, this park is the perfect place for family get-togethers and recreational sports. Numerous picnic sites and wedding photo locations can be booked. ', 
		@address='190 River Road, Winnipeg', 
		@phone='(204) 986-7623',
        @website='http://www.winnipeg.ca/publicworks/parksOpenSpace/ParkRentals/BookableParks/StVital.stm', 
		@image='stVital.jpg', 
		@location=5

exec spAttractions @crud='c', @category='Parks',
        @name='King*s Park',
        @desc='King’s Park has many pathways (gravel and paved) to enjoy some of which lead to marshland. In the centre of the park you will find the beautiful Pagoda Gardens and the Carol Shield*s Memorial Labyrinth. The Park also has a soccer field, two baseball diamonds and an off-leash dog park area.', 
		@address='198 King*s Drive (close to the U of M campus), Winnipeg', 
		@phone='311 ',
        @website='http://winnipeg.ca/publicworks/parksOpenSpace/ParkRentals/BookableParks/Kings.stm', 
		@image='King.jpg', 
		@location=5

exec spAttractions @crud='c', @category='Parks',
        @name='FortWhyte Alive',
        @desc='FortWhyte Alive is Winnipeg*s premier nature oasis. Alive with recreation, historical interpretation and environmental education, FortWhyte offers fun for all ages, 364 days a year.', 
		@address='1961 McCreary Road, Winnipeg', 
		@phone='(204) 989-8355',
        @website='https://www.fortwhyte.org/', 
		@image='whytefort.jpg', 
		@location=6

exec spAttractions @crud='c', @category='Parks',
        @name='The Forks - Historic Port and Riverwalk',
        @desc='Discover the beauty of the city along the river as you follow the curves of the Red and Assiniboine Rivers to the grounds of the Legislative Building. Board the River Spirit for a guided river tour, rent a canoe or paddleboat or stroll the winding Riverwalk. In winter, the ice is groomed for skating and cross-country skiing on the popular River Trail.', 
		@address='Forks Market Road, Winnipeg', 
		@phone='(204) 98FORKS (36757)',
        @website='https://www.theforks.com/attractions/the-forks-national-historic-site-of-canada', 
		@image='forks.jpg', 
		@location=9

go

--  Shopping Category Table and Procedures  --

create table tbShoppingCategories
(
	CategoryId int identity (1,1) primary key,
	CategoryType varchar (50) not null
)
go

create procedure spAddShoppingCategories
(
	@CategoryType varchar(50)
)
as begin
	insert into tbShoppingCategories(CategoryType ) values (@CategoryType)
end
go

exec spAddShoppingCategories  @CategoryType='Antiques'
exec spAddShoppingCategories  @CategoryType='Book Stores'
exec spAddShoppingCategories  @CategoryType='Boutique'
exec spAddShoppingCategories  @CategoryType='Outlet'
exec spAddShoppingCategories  @CategoryType='Gourmet Foods'
exec spAddShoppingCategories  @CategoryType='Shopping Malls'

go
create procedure spGetShoppingCategories
as begin
	select* from tbShoppingCategories
end
go

create procedure spGetStoreCategory(
	@storetype varchar(50)=null
)
as begin
	select CategoryType from tbShoppingCategories
	where CategoryType=isnull(@storetype, CategoryType)
end
go


--  Stores Table and Procedures  --

create table tbStores
(
	StoreId		int identity (1,1) primary key,
	StoreName	varchar (max) not null,
	Description varchar (max),
	Path		varchar (100),
	Address		varchar(max) not null,
	PhoneNumber varchar (50),
	Web			varchar (max),
	LocationId	int foreign key references tbLocation(locationID) ,
	CategoryId	int foreign key references tbShoppingCategories(CategoryId)
)
go

create procedure spStores
(
	@StoreId	 int=null,
	@StoreName	 varchar(max)=null,
	@Description varchar(max)=null,
	@Path		 varchar(100)=null,
	@Address	 varchar(max)=null,
	@PhoneNumber varchar (50)=null,
	@Web		 varchar (max)=null,
	@LocationId  int=null,
	@CategoryId  int=null,
	@Crud		 varchar (10)
)
as begin
	if @Crud='r'
	begin
		select
			StoreId,StoreName, Description,'./Shopping/'+ Path as Path,Address,
			PhoneNumber,Web,LocationId,CategoryId
		from tbStores where StoreId=isnull(@StoreId,StoreId)
	end
	else if @Crud='c'
	begin
		insert into tbStores (StoreName, Description,Path,Address,PhoneNumber,Web, LocationId,CategoryId) values
						 (@StoreName, @Description,@Path,@Address,@PhoneNumber,@Web, @LocationId,@CategoryId)
	end
	else if @Crud='d'
	begin
		delete from tbStores where StoreId=@StoreId
	end
	else if @Crud='u'
	begin
		update tbStores set
			StoreName=@StoreName,
			Description=@Description,
			Path=@Path,
			Address=@Address,
			PhoneNumber=@PhoneNumber,
			Web=@Web,
			LocationId=@LocationId,
			CategoryId=@CategoryId
		where StoreId=@StoreId
	end
	else if @Crud='x'
	begin
		select StoreId,StoreName, Description,'.\Shopping\'+ 
		Path as Path,Address,PhoneNumber,
			Web,LocationId,CategoryId
		from tbStores where CategoryId=@CategoryId
	end
end
go

exec spStores @Crud='c', @StoreName='Vintage Veruca Antiques', @Description='Vintage Veruca Antiques Store',
        @Path='VintageVerucaAntiques.jpg',@Address='1342 Main Street, Winnipeg, MB, R2W 3T6 ',
		@PhoneNumber=' 204.339.5301 ', @Web='https://www.tourismwinnipeg.com/play/shopping/display,listing/06311/vintage-veruca-antiques', @LocationId=2, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Mike*s General Store', 
        @Description='Mike General Store is crammed full of Old Toys, Old Tins, Advertising Signs and memorabilia 
		and Unique Collectibles of all kinds.',
        @Path='Mike General Store.jpg',@Address='52 St. Annes Road, Winnipeg, MB, R2M 2Y3 ',
		@PhoneNumber='204.255.3463',@Web='http://www.mikesgeneralstore.com/', @LocationId=4, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Abbey Antiques & Art', 
        @Description='Winnipeg*s premiere Antiques And Vintage Art dealer.',
        @Path='Abbey Antiques & Art.jpg',@Address='914 Corydon Avenue, Winnipeg, MB, R3M 0Y5',
		@PhoneNumber='204.477.0489',@Web='http://www.abbeyantiques.ca/', @LocationId=5, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Nerman*s Books & Collectibles', 
        @Description='Nerman Books & Collectibles Store',
        @Path='Nerman Books & Collectibles.jpg',@Address='700 Osborne Street South, Winnipeg, MB, R3L 2B9 ',
		@PhoneNumber='204.475.1050',@Web='http://www.nermansbooks.com/', @LocationId=5, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Selim*s Antiques', 
        @Description='Selim’s Antiques has been in business for almost 50 years',
        @Path='Selim Antiques.jpg',@Address='801 Corydon Avenue, Winnipeg, MB, R3M 0W6',
		@PhoneNumber='204.284.9886',@Web='http://www.selimsantiques.com/', @LocationId=5, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Things', 
        @Description='Operated by the Women*s Committee.',
        @Path='Things.jpg',@Address='913 Corydon Avenue, Winnipeg, MB, R3M 0W8 ',
		@PhoneNumber='204.284.7331',@Web='http://thingsantiquesoncorydon.webs.com/', @LocationId=5, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Frazer*s Antiques', 
        @Description='Frazer*s Antiques Store',
        @Path='Frazer Antiques.jpg',@Address='587 Clifton Street, Winnipeg, MB',
		@PhoneNumber='204.783.4786',@Web='https://www.tourismwinnipeg.com/play/shopping/display,listing/05768/frazer-s-antiques', @LocationId=7, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Marway Militaria Inc.', 
        @Description='We specialize in many areas, including Canadian militaria. ',
        @Path='Marway Militaria Inc.jpg',@Address='22 - 1865 Sargent Avenue, Winnipeg, MB, R3H 0E4 ',
		@PhoneNumber='204.775.7159',@Web='http://www.marway-militaria.com/', @LocationId=7, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Thirsty*s Flea Market & Auction', 
        @Description='Thirsty*s Flea Market & Auction Store',
        @Path='Thirsty Flea Market & Auction.png',
		@Address='1111 Ellice Avenue, Winnipeg, MB ',
		@PhoneNumber=' 204.783.9800',@Web='http://www.thirstys.ca/',@LocationId=7, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Winnipeg Trading Post', 
        @Description='Winnipeg Trading Post takes pride in showcasing the work of our supportive artistic community. ',
        @Path='Winnipeg Trading Post.jpg',
		@Address='339 William Ave., Winnipeg, MB, R2W 3S3 ',
		@PhoneNumber='204.947.0513',@Web='http://www.winnipegtradingpost.com/', @LocationId=7, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Collectibles Canada', 
        @Description='Collectibles Canada features all types of coins and currency from North America and around the world',
        @Path='Collectibles Canada.png',
		@Address='2211 McPhillips Street, Winnipeg, MB, R2V 3M5 ',
		@PhoneNumber='204.586.6263',@Web='http://www.collectiblescanada.com/', @LocationId=8, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Antiques & Funk', 
        @Description='Antiques & Funk buy Estates, Entire Households, Single Items or Collections, and they Make House Calls!',
        @Path='Antiques & Funk.jpg',
		@Address='474 Main Street, Winnipeg, MB, R3B 1B6 ',
		@PhoneNumber='204.943.4782 ',@Web='http://www.antiquesandfunk.com/', @LocationId=9, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Johnston Terminal', 
        @Description='This historic building offers three levels of fabulous shopping and dining. ',
        @Path='Johnston Terminal.jpg',
		@Address='25 Forks Market Road, Winnipeg, MB, R3B 3H6',
		@PhoneNumber='204.956.5593',@Web='http://www.theforks.com/', @LocationId=9, @CategoryId=1 

exec spStores @Crud='c', @StoreName='The Old House Revival Company & Antique Mall', 
        @Description='The Old House Revival Company & Antique Mall Stores',
        @Path='The Old House Revival Company & Antique Mall.jpg',
		@Address='324 Younge Street, Winnipeg, MB, R3B 2S4 ',
		@PhoneNumber='204.477.4286',@Web='http://www.theoldhouserevival.com/', @LocationId=9, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Vintage Glory', 
        @Description='Vintage Glory is a stylish blend of chic boutique and vintage clothing shop. ',
        @Path='Vintage Glory.jpg',
		@Address='380 Donald Street, Winnipeg, MB, R3B 1P4 ',
		@PhoneNumber='204.942.7186',@Web='http://www.vintageglory.ca/', @LocationId=9, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Selkirk Book Exchange', 
        @Description='Selkirk Book Exchange Store',
        @Path='Selkirk Book Exchange.jpg',
		@Address='442 McGregor Street, Winnipeg, MB, R2W 4X8 ',
		@PhoneNumber='204.586.5127', @Web='https://www.tourismwinnipeg.com/play/shopping/display,listing/06105/selkirk-book-exchange',@LocationId=1, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Dog Eared Books', 
        @Description='We carry a good selection of gently used paperbacks',
        @Path='Dog Eared Books.jpg',
		@Address='1157 Henderson Highway, Winnipeg, MB, R2G 1L5 ',
		@PhoneNumber='204.338.7042',@Web='https://www.tourismwinnipeg.com/catalysts/www.dogearedbookssite.wordpress.com', @LocationId=2, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Sams Place', 
        @Description='We carry a good selection of gently used paperbacks in fantasy',
        @Path='Sams Place.jpg',
		@Address='159 Henderson Highway, Winnipeg, MB, R2L 1L4',
		@PhoneNumber='204.415.4728',@Web='http://samscommunity.com/', @LocationId=2, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Coles', 
        @Description='Coles Store',
        @Path='Coles.jpg',
		@Address='Kildonan Place Shopping Centre, 1555 Regent Avenue West, 1555 Regent Ae. W., Winnipeg, MB, R2C 4J2 ',
		@PhoneNumber=' 204.661.8142',@Web='https://www.chapters.indigo.ca/en-ca/home/storelocator/storeDetails/153/', @LocationId=2, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Family Book Exchange', 
        @Description='Family Book Exchange has one of the largest romance sections around! ',
        @Path='Family Book Exchange.jpg',
		@Address='519 St. Mary*s Road, Winnipeg, MB, R2M 3L2',
		@PhoneNumber='204.237.4949',@Web='http://www.familybookexchange.ca/', @LocationId=4, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Indigo', 
        @Description='Indigo Store',
        @Path='Indigo.jpg',
		@Address='1590 Kenaston Blvd., Winnipeg, MB, R3P 0Y4' ,
		@PhoneNumber='204.488.6621',@Web='http://www.chapters.indigo.ca/', @LocationId=4, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Burton Lysecki Books', 
        @Description='Burton Lysecki Books buy and sell quality, used books ',
        @Path='Burton Lysecki Books.jpg',
		@Address='527 Osborne Street, Winnipeg, MB, R3L 2B2 ' ,
		@PhoneNumber='204.284.4546 ', @Web='http://www.lysecki.com/',@LocationId=5, @CategoryId=2 

exec spStores @Crud='c', @StoreName='McNally Robinson', 
        @Description='McNally Robinson Store',
        @Path='McNally Robinson.jpg',
		@Address='1120 Grant Avenue, Winnipeg, MB, R3M 2A6 ' ,
		@PhoneNumber='204.475.0483', @Web='http://www.mcnallyrobinson.com/',@LocationId=5, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Prairie Sky Books', 
        @Description='This small, locally-owned and operated bookstore has served the community for 30 years.',
        @Path='Prairie Sky Books.jpg',
		@Address='871 Westminster Avenue, Winnipeg, MB, R3G 1B3 ' ,
		@PhoneNumber=' 204.774.6152',@Web='http://www.prairieskybooks.com/', @LocationId=5, @CategoryId=2 
			  
exec spStores @Crud='c', @StoreName='Whodunit? Mystery Book Store', 
        @Description='WHODUNIT carries both new and used books',
        @Path='Whoodonit.jpg',
		@Address='165 Lilac Street, Winnipeg, MB, R3M 2S1 ' ,
		@PhoneNumber='204.284.9100',@Web='http://www.whodunitcanada.com/', @LocationId=6, @CategoryId=2 

exec spStores @Crud='c', @StoreName='A Book Fair', 
        @Description='Book Fair Winnipeg is a used book store and new comic book shop ',
        @Path='A Book Fair.jpg',
		@Address='340 Portage Avenue, Winnipeg, MB, R3C 0C3 ' ,
		@PhoneNumber='204.944.1630', @Web='http://www.bookfairwinnipeg.com/',@LocationId=9, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Red River Books', 
        @Description='Red River Books Store',
        @Path='Red River Books.jpg',
		@Address='92 Arthur Street, Winnipeg, MB, R3B 1H3 ' ,
		@PhoneNumber=' 204.943.9788 ', @Web='https://www.tourismwinnipeg.com/play/shopping/display,listing/06064/red-river-books',@LocationId=9, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Spalifetstyle & Boutique', 
        @Description='Spalifestyle & Fashion Boutique ',
        @Path='Spalifetstyle Boutique.jpg',
		@Address='2001 Henderson Highway, Winnipeg, MB, R2G 1P7 ' ,
		@PhoneNumber=' 204.661.6111  ',@Web='http://www.slfb.ca/', @LocationId=2, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Bijou Treasures', 
        @Description='Founded in 2000 Bijou offers an eclectic collection of stylish, handcrafted jewellery.',
        @Path='Bijou Treasures.jpg',
		@Address='2539 Osborne St., Winnipeg, MB, R3L 2B2 ' ,
		@PhoneNumber=' 204.233.9744 ',@Web='http://www.bijoutreasures.com/', @LocationId=5, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Hush Clothing', 
        @Description='Located in the hustle & bustle of Winnipeg’s Osborne Village',
        @Path='Hush Clothing.jpg',
		@Address=' 203-99 Osborne Street, Winnipeg, MB, R3L 2R4 ' ,
		@PhoneNumber=' 204.474.1208 ',@Web='http://www.hushclothing.ca/', @LocationId=5, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Jose & Markham', 
        @Description='Jose & Markham develops new and innovative footwear and accessories for men. ',
        @Path='Jose  Markham.png',
		@Address=' 73 Princess Street, Winnipeg, MB, R3B 1K1 ' ,
		@PhoneNumber=' 1.888.872.0701 ',@Web='http://www.jose-markham.com/', @LocationId=5, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Luxe & Charm', 
        @Description='Jose & Markham develops new and innovative footwear and accessories for men. ',
        @Path='Luxe  Charm.jpg',
		@Address=' 109 Osborne Street, Winnipeg, MB, R3L 1Y4 ' ,
		@PhoneNumber=' 204.415.1734  ',@Web='http://www.luxeandcharm.com/', @LocationId=5, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Out of the Blue', 
        @Description='Out of the Blue is the go to place for everything fun ',
        @Path='Out of the Blue.jpg',
		@Address=' 103-99 Osborne Street, Winnipeg, MB, R3L 2R4 ' ,
		@PhoneNumber=' 204.475.9771 ',@Web='http://www.outoftheblue.ca/', @LocationId=5, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Callisto Couture Custom Corsets', 
        @Description='Corsetry is a timeless craft dating back to 1600 B.C. ',
        @Path='Callisto Couture Custom Corsets.jpg',
		@Address='506 - 63 Albert Street, Winnipeg, MB, R3B 1G4 ' ,
		@PhoneNumber=' 204.480.8613',@Web='http://www.callistocouture.ca/', @LocationId=9, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Addition-Elle Outlet', 
        @Description='Addition-Elle Outlet Store',
        @Path='Addition-Elle Outlet.jpg',
        @Address='4 - 1585 Kenaston Boulevard, Winnipeg, MB, R3P 2N3 ' ,
        @PhoneNumber=' 204.488.2857  ',@Web='https://www.additionelle.com/on/demandware.store/Sites-Additionelle_CA-Site/default/Stores-Find/C1582408599',
		@LocationId=6, @CategoryId=4 

exec spStores @Crud='c', @StoreName='Danier Leather Factory Outlet', 
        @Description='Danier began as an independent family owned design house',
        @Path='Danier Leather Factory Outlet.jpg',
        @Address='1 - 1585 Kenaston Boulevard, Winnipeg, MB, R3P 2N3 ' ,
        @PhoneNumber='204.489.1110',@Web='http://www.danier.com/', @LocationId=6, @CategoryId=4 

exec spStores @Crud='c', @StoreName='Roots Fashion Outlet', 
        @Description='Roots Fashion Outlet Store',
        @Path='Roots Fashion Outlet.jpg',
        @Address='5 - 1585 Kenaston Boulevard, Winnipeg, MB, R3P 2N3 ' ,
        @PhoneNumber='204.489.9366  ',@Web='https://www.tourismwinnipeg.com/play/shopping/display,listing/06081/roots-fashion-outlet',
		@LocationId=6, @CategoryId=4 

exec spStores @Crud='c', @StoreName='Le Chateau Outlet', 
        @Description='Le Chateau Outlet Store',
        @Path='Le Chateau Outlet.jpg',
        @Address='1395 Ellice Avenue, Winnipeg, MB ' ,
        @PhoneNumber='204.788.1388  ',@Web='https://www.tourismwinnipeg.com/play/shopping/display,listing/05896/le-chateau-outlet',
		@LocationId=7, @CategoryId=4 

exec spStores @Crud='c', @StoreName='Canada West Boots Factory Outlet', 
        @Description='A family owned company. Three generations of top quality boot manufacturers.',
        @Path='Canada West Boots Factory Outlet.png',
        @Address='17 - 2188 McPhillips Street, Winnipeg, MB, R2X 2N6 ' ,
        @PhoneNumber='204.633.8132  ', @Web='http://www.canadawestbootsfactoryoutlet.com/',
		@LocationId=8, @CategoryId=4 

exec spStores @Crud='c', @StoreName='Jay Set Factory Outlet', 
        @Description='Jay Set Factory Outlet Store',
        @Path='Jay Set Factory Outlet.jpg',
        @Address='1139 McPhillips Street, Winnipeg, MB, R2X 1G4 ' ,
        @PhoneNumber='204.982.5019  ', @Web='https://www.tourismwinnipeg.com/play/shopping/display,listing/05846/jay-set-factory-outlet',
		@LocationId=8, @CategoryId=4 

exec spStores @Crud='c', @StoreName='Winnipeg Outfitters', 
        @Description='Winnipeg Outfitters Store',
        @Path='Winnipeg Outfitters.jpg',
        @Address='1139 McPhillips Street, Winnipeg, MB, R2X 1G4 ' ,
        @PhoneNumber=' 204-775-6953 ',@Web='http://www.outfitters.ca/', @LocationId=8, @CategoryId=4 

exec spStores @Crud='c', @StoreName='Area Rug Store', 
        @Description='Area Rug Store Store',
        @Path='Area Rug Store.png',
        @Address='1360 Sargent Avenue, Winnipeg, MB, R3E 0G5 ' ,
        @PhoneNumber=' 204.772.7767',@Web='https://www.tourismwinnipeg.com/catalysts/www.arearugstorewinnipeg.com',
		@LocationId=10, @CategoryId=4 

exec spStores @Crud='c', @StoreName='A LEpi de Blé', 
        @Description='Authentic French bakery and patisserie serving divine croissants, macarons,etc.',
        @Path='A LEpi de Blé.jpg',
        @Address='1757 Main Street, Winnipeg, MB, R2V 1Z8 ' ,
        @PhoneNumber=' 204.334.2526 ', @Web='https://www.facebook.com/alepideblefrenchbakery',@LocationId=1, @CategoryId=5

exec spStores @Crud='c', @StoreName='Chocolatier Constance Popp', 
        @Description='Chocolatier Constance Popp produces fresh premium artisan chocolate ',
        @Path='Chocolatier Constance Popp.jpg',
        @Address='180 Provencher Boulevard, Winnipeg, MB, R2H 0G3 ' ,
        @PhoneNumber=' 204.897.0689  ',@Web='http://www.artisanchocolates.ca/', @LocationId=3, @CategoryId=5

exec spStores @Crud='c', @StoreName='Bernard Callebaut', 
        @Description='At Chocolaterie Bernard Callebaut they are devoted to making exquisite chocolates.',
        @Path='Bernard Callebaut.jpg',
        @Address='431 Academy Road, Winnipeg, MB, R3N 0C2 ' ,
        @PhoneNumber=' 204.488.4376  ',@Web='http://www.bernardcallebaut.com/', @LocationId=6, @CategoryId=5

exec spStores @Crud='c', @StoreName='Cornelia Bean', 
        @Description='Cornelia Bean is a gourmet tea and coffee emporium.',
        @Path='Cornelia Bean.jpg',
        @Address='417 Academy Road, Winnipeg, MB, R3N 0C1  ' ,
        @PhoneNumber=' 204.489.5460  ',@Web='http://www.corneliabean.com/', @LocationId=7, @CategoryId=5

exec spStores @Crud='c', @StoreName='Sleepy Owl Bread', 
        @Description='At Sleepy Owl Bread we focus on producing from-scratch breads and pastries.',
        @Path='Sleepy Owl Bread.jpg',
        @Address='751 Wall Street, Winnipeg, MB, R3G 2T6' ,
        @PhoneNumber='  204.805.2530  ',@Web='http://www.sleepyowlbread.ca/', @LocationId=8, @CategoryId=5

exec spStores @Crud='c', @StoreName='Fenton*s Gourmet Foods', 
        @Description='Fenton*s Gourmet Foods ',
        @Path='Fentons Gourmet Foods.jpg',
        @Address='Forks Market, Winnipeg, MB ' ,
        @PhoneNumber='  204.942.8984  ',@Web='https://www.tourismwinnipeg.com/play/shopping/display,listing/05749/fenton-s-gourmet-foods',
		@LocationId=9, @CategoryId=5

exec spStores @Crud='c', @StoreName='Garden City Shopping Centre', 
        @Description='Proudly serving northwest Winnipeg ',
        @Path='Garden City Shopping Centre.jpg',
        @Address='2305 McPhillips Street, Winnipeg, MB, R2V 3E1  ' ,
        @PhoneNumber='  204.338.7076  ',@Web='http://www.shopgardencity.ca/', @LocationId=1, @CategoryId=6

exec spStores @Crud='c', @StoreName='Kildonan Place Shopping Centre', 
        @Description='Kildonan Place is northeast Winnipeg’s largest shopping centre ',
        @Path='Kildonan Place Shopping Centre.jpg',
        @Address='1555 Regent Avenue West, Winnipeg, MB, R2C 4J2 ' ,
        @PhoneNumber='  204.661.6116  ',@Web='http://www.kildonanplace.com/', @LocationId=2, @CategoryId=6
			
exec spStores @Crud='c', @StoreName='St. Vital Centre', 
        @Description='Kildonan Place is northeast Winnipeg’s largest shopping centre ',
        @Path='St. Vital Centre.jpg',
        @Address='Bishop Grandin Boulevard at St. Marys Road, Winnipeg, MB, R2M 5E5 ' ,
        @PhoneNumber=' 204.257.5646  ',@Web='http://www.stvitalcentre.com/', @LocationId=4, @CategoryId=6

exec spStores @Crud='c', @StoreName='Grant Park Shopping Centre', 
        @Description='Find over 70 shops and services just minutes west of Pembina Highway 
		in the heart of River Heights.',
        @Path='Grant Park Shopping Centre.jpg',
        @Address='1120 Grant Avenue (just three blocks west of Pembina  ' ,
        @PhoneNumber=' 204.475.8556   ',@Web='http://www.grantparkshoppingcentre.com/', @LocationId=6, @CategoryId=6

exec spStores @Crud='c', @StoreName='CF Polo Park', 
        @Description='CF Polo Park is Winnipeg*s premiere shopping centre',
        @Path='CF Polo Park.jpg',
        @Address='1485 Portage Avenue, Winnipeg, MB, R3G 0W4 ' ,
        @PhoneNumber=' 204.784.2500   ',@Web='http://www.polopark.ca/', @LocationId=7, @CategoryId=6

exec spStores @Crud='c', @StoreName='Cityplace', 
        @Description='cityplace is Downtown Winnipeg*s most convenient shopping destination.',
        @Path='cityplace.jpg',
        @Address=' corner of St Mary Avenue and Hargrave, Winnipeg, MB,' ,
        @PhoneNumber=' 204.989.1800  ',@Web='http://www.cityplacewinnipeg.com/', @LocationId=7, @CategoryId=6

exec spStores @Crud='c', @StoreName='Portage Place Shopping Centre', 
        @Description='Located in the heart of downtown Winnipeg',
        @Path='Portage Place Shopping Centre.jpg',
        @Address='393 Portage Avenue, Winnipeg, MB, R3B 3H6 ' ,
        @PhoneNumber=' 204.925.4636  ',@Web='http://www.portageplace.mb.ca/', @LocationId=7, @CategoryId=6

exec spStores @Crud='c', @StoreName='Winnipeg Square', 
        @Description='Located in the heart of downtown Winnipeg ',
        @Path='Winnipeg Square.jpg',
        @Address='360 Main Street, Winnipeg, MB, R3C 3Z3  ' ,
        @PhoneNumber=' 204.949.7140  ',@Web='http://www.winnipegsquare.com/', @LocationId=7, @CategoryId=6

--exec spStores @Crud='r'
--go
--exec spStores @Crud='r', @StoreId=55
--go

--  Food Category Table and Procedures  --

create table tbFood_Category
(
	FoodId int identity(1,1) Primary key,
	FoodType varchar(30)
)
go
insert into tbFood_Category(FoodType) values
		('Barbeque'),('Bistro'),('Burgers'),
		('Cafe/Bakery'),('Casino Dining'),('Chinese'),
		('Coffee'),('Deli/Diner'),('Ethiopian'),('Family'),
		('Fast Casual'),('French'),('Greek'),('Ice-Cream/Gelti'),
		('Indian'),('International/Classic'),('Inernation/Contemporary'),
		('Italian/Classic'),('Italian/Contemporary'),('Japanese'),('Maxican'),
		('Pub/Lounge'),('Regional/Canadian'),('South American'),('Steak & SeaFood'),
		('Tea House'),('TapRooms'),('Thai/Laotian'),('Vietnamese')
go

Create procedure spFood_Category
(
	@FoodId int=null,
	@FoodType varchar(30)=null
)
as begin
	select * from tbFood_Category where FoodId=isnull(@FoodId,FoodId)
end
go

--  Restaurant Table and Procedures  --

create table tbRestaurants
(
	RestaurantId int identity(1,1) primary key,
	RestaurantName varchar(50),
	Description varchar(800),
	Address varchar(30),
	PostalCode varchar(7),
	ContactNo varchar(20),
	path varchar(500),
	Website varchar(100), 
	FoodId int foreign key references tbFood_Category(FoodId),
	LocationId int foreign key references tbLocation(locationID)
)
go
create procedure spRestaurants
(
	@RestaurantId   int=null,
	@RestaurantName varchar(50)=null,
	@Description	varchar(800)=null,
	@Address		varchar(30)=null,
	@PostalCode		varchar(7)=null,
	@ContactNo		varchar(20)=null,
	@Path			varchar(500)=null,
	@website		varchar(100)=null,
	@FoodId			int=null,
	@LocationId		int=null,
	@crud			varchar(10)=null,
	@search			varchar(50)=null
)
as begin
	if @crud='a'
	begin
		select RestaurantName,Description,RestaurantId,'./Restaurant/' + path as path  from tbRestaurants where RestaurantId=isnull(@RestaurantId,RestaurantId)
	end
	else if @crud='r'
	begin
		select RestaurantId,RestaurantName,Address,ContactNo,Description,'./Restaurant/' + path as path,Website from tbRestaurants where RestaurantId=isnull(@RestaurantId,RestaurantId)
	end
	else if @crud='s'  --  Select Restaurants, join with Location and Food Category
	begin
		
		select RestaurantName,Description,RestaurantId,'./Restaurant/' + path as path  from tbRestaurants join tbFood_Category on
			tbRestaurants.FoodId=tbFood_Category.FoodId join tbLocation on 
			tbRestaurants.LocationId=tbLocation.LocationId 
		where tbRestaurants.LocationId=ISNULL(@LocationId,tbRestaurants.LocationId)
		and	tbRestaurants.FoodId=ISNULL(@FoodId,tbRestaurants.FoodId)
	end
	else if @crud='search'
	begin
		select RestaurantName,Description,RestaurantId,'./Restaurant/' + path as path from tbRestaurants 
			join tbFood_Category on tbRestaurants.FoodId=tbFood_Category.FoodId					
			join tbLocation  on tbRestaurants.LocationId=tbLocation.LocationId 
						 
		where RestaurantName like'%'+ @search+'%'
			or FoodType like'%'+ @search+'%'
			or locationName like'%'+ @search+'%'
	end
	
	else if @crud='w' 
	begin  
	select RestaurantId, RestaurantName, Description, Address, PostalCode, ContactNo, Website, './Restaurant/' + path as path, FoodId, LocationId from tbRestaurants where RestaurantId=isnull(@RestaurantId,RestaurantId) 
	end
	else if @crud='d'
	begin
	delete from tbRestaurants where RestaurantId=@RestaurantId
	end
	else if @crud='c'
	begin
		insert into tbRestaurants(RestaurantName,Description,Address,PostalCode,ContactNo,path,Website,FoodId,LocationId)
								values
								(@RestaurantName,@Description,@Address,@PostalCode,@ContactNo,@Path,@Website,@FoodId,@LocationId)
	end
	else if @crud='u'
	begin
		update tbRestaurants
		set RestaurantName=@RestaurantName,
			Description=@Description,
			Address=@Address,
			PostalCode=@PostalCode,
			ContactNo=@ContactNo,
			path=@Path,
			Website=@website,
			FoodId=@FoodId,
			LocationId=@LocationId
		 where RestaurantId=@RestaurantId
	end
	else if @crud='AtoF'
	begin
		select RestaurantName,Description,RestaurantId,'./Restaurant/' + path as path  from tbRestaurants where RestaurantName between 'A%' and 'F%'
	end
	else if @crud='GtoL'
	begin
		select RestaurantName,Description,RestaurantId,'./Restaurant/' + path as path  from tbRestaurants where RestaurantName between 'G%' and 'L%'
	end
	else if @crud='MtoR'
	begin
		select RestaurantName,Description,RestaurantId,'./Restaurant/' + path as path  from tbRestaurants where RestaurantName between 'M%' and 'R%'
	end
	else if @crud='StoZ'
	begin
		select RestaurantName,Description,RestaurantId,'./Restaurant/' + path as path  from tbRestaurants where RestaurantName between 'S%' and 'Z%'
	end
	else if @crud='1to10'
	begin
		select RestaurantName,Description,RestaurantId,'./Restaurant/' + path as path  from tbRestaurants where RestaurantId between 1 and 10
	end
	
end
go

go
exec spRestaurants @crud='c',
		@RestaurantName='Loveys BBQ',
		@Description='Bring a bib and dig into slow-and-low-smoked meats. House-made sauces add extra pizzazz to this BBQ-lovers haunt. Brisket, pork shoulder and ribs are stars on the menu.',
		@Address='2-208 Marion St',
		@PostalCode='R2H 0T6',
		@ContactNo='(204) 233-7427',
		@Website='http://www.loveysbbq.ca/',
		@Path='1.png',
		@FoodId=1,
		@LocationId=9
exec spRestaurants @crud='u', @RestaurantId=1,
@RestaurantName='Loveys BBQ',
		@Description='Bring a bib and dig into slow-and-low-smoked meats. House-made sauces add extra pizzazz to this BBQ-lovers haunt. Brisket, pork shoulder and ribs are stars on the menu.',
		@Address='2-208 Marion Sth',
		@PostalCode='R2H 0T6',
		@ContactNo='(204) 233-7427',
		@Website='http://www.loveysbbq.ca/',
		@Path='1.png',
		@FoodId=1,
		@LocationId=9
exec spRestaurants @crud='c',
		@RestaurantName='Muddy Waters',
		@Description='Take a trip to Memphis inside this BBQ joint located at The Forks. Hickory-smoked ribs and pulled pork impress. Also boasts an eclectic menu of chicken wings.',
		@Address='15 Forks Market Rd',
		@PostalCode=' R3C 4Y3',
		@ContactNo='(204) 947-6653',
		@Website='http://muddywaters.ca/menus/',
		@Path='2.png',
		@FoodId=1,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='Park Café (Qualico Family Centre)',
		@Description='Take a trip to Memphis inside this BBQ joint located at The Forks. Hickory-smoked ribs and pulled pork impress. Also boasts an eclectic menu of chicken wings. ',
		@Address='330 Assiniboine Park Drive',
		@PostalCode='R3P 2N6',
		@ContactNo='(204) 927-6001',
		@Website='https://www.assiniboineparkzoo.ca/park-landing/home/explore/restaurants',
		@Path='3.jpg',
		@FoodId=2,
		@LocationId=6

exec spRestaurants @crud='c',
		@RestaurantName='Baked Expectations',
		@Description='Take a trip back in time to this 50s style diner and dessert parlour. Pull up a fork and choose from one (or several) house-made cakes, pies, tortes, cheesecakes or a mile-high pavlova loaded with berries and cream.',
		@Address='161 Osborne St',
		@PostalCode='R3L 1Y7',
		@ContactNo='(204) 452-5176',
		@Website='https://www.bakedexpectations.ca/',
		@Path='4.jpg',
		@FoodId=2,
		@LocationId=5

exec spRestaurants @crud='c',
		@RestaurantName='Deer + Almond',
		@Description='Winnipeg bon vivant and chef Mandel Hitzers menu of multi-cultural fusion food is the epitome of a whimsical modern food adventure.',
		@Address='85 Princess St',
		@PostalCode='R3B 1K4',
		@ContactNo='(204) 504-8562',
		@Website='http://www.deerandalmond.com/',
		@Path='5.png',
		@FoodId=2,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='Bonfire Bistro',
		@Description='A crowd favourite for authentic wood-fired, artisan pizzas. Stand-out pies include: serrano ham and pear with blue and mozzarella cheeses, arugula and finished with balsamic glaze and fig sauce.',
		@Address='1433 Corydon Avenue',
		@PostalCode='R3N 0J2 ',
		@ContactNo='(204) 489-2703',
		@Website='https://www.bonfirebistro.ca/',
		@Path='6.jpg',
		@FoodId=2,
		@LocationId=6

exec spRestaurants @crud='c',
		@RestaurantName='Chew',
		@Description='Husband and wife chefs delight guests with whimsical plates of contemporary cuisine. Local ingredients are essential elements on every plate.',
		@Address=' 532 Waterloo Avenue',
		@PostalCode='R3N 0T3',
		@ContactNo='(204) 667-2439',
		@Website='http://www.chewcatering.ca/',
		@Path='7.png',
		@FoodId=2,
		@LocationId=6

exec spRestaurants @crud='c',
		@RestaurantName='Saucers Café',
		@Description='Specialty coffees and teas anchor this menu of hunger-busting sandwiches, salads, pizzas and wraps.',
		@Address='570 Academy Road',
		@PostalCode='R3N 0E3',
		@ContactNo='(204) 487-4830',
		@Website='https://saucerscafe.com/',
		@Path='8.png',
		@FoodId=2,
		@LocationId=6

exec spRestaurants @crud='c',
		@RestaurantName='Café Ce Soir',
		@Description='A proponent of the slow food movement, chef/owner Cam Tran delivers French bistro favourites using local and organic ingredients wherever possible.',
		@Address=' 937 Portage Avenue',
		@PostalCode='R3G 0P9',
		@ContactNo='(204) 414-7647',
		@Website='https://www.cafecesoir.ca/',
		@Path='9.png',
		@FoodId=2,
		@LocationId=7

exec spRestaurants @crud='c',
		@RestaurantName='Steves Bistro',
		@Description='Unleash your appetite at this modern Mediterranean dining room. Roasted lemon potatoes and spanakopita are divine, as our the lusciously tender lamb rack chops.',
		@Address='3123 Portage Avenue',
		@PostalCode='R3N 0E3',
		@ContactNo='(204) 831-5531',
		@Website='http://www.stevesbistro.com/',
		@Path='10.png',
		@FoodId=2,
		@LocationId=7


exec spRestaurants @crud='c',
		@RestaurantName='Le Garage Cafe',
		@Description='This music and eats venue lives in the heart of Winnipegs French Quarter, St. Boniface. This casual spot serves burgers, sandwiches and French favourites like Tourtiere.',
		@Address='166 Provencher Blvd.',
		@PostalCode='R3C 4B8',
		@ContactNo='(204) 237-0737',
		@Website='http://www.garagecafe.ca/',
		@Path='12.png',
		@FoodId=2,
		@LocationId=3

exec spRestaurants @crud='c',
		@RestaurantName='Mrs. Mikes',
		@Description='This burger stand in the heart of Saint Boniface boasts one of the citys biggest burgers, the King Burger. Tender and juicy hand-made burgers make this spot memorable. Open Spring through Fall.',
		@Address='286 Tache Avenue',
		@PostalCode='R2H 2A2',
		@ContactNo='(204) 237-3977',
		@Website='https://www.facebook.com/Mrs-Mikes-165786516814009/?hc_location=ufi',
		@Path='13.png',
		@FoodId=3,
		@LocationId=3

exec spRestaurants @crud='c',
		@RestaurantName='Dairi-Wip Drive-In',
		@Description='This burger stand, located in Winnipegs French Quarter, took top honours for Winnipegs best burger in 2013. The house-cut fries taste like actual potatoes.',
		@Address='383 Marion Street',
		@PostalCode='R2H 0V4',
		@ContactNo='(204) 233-5144',
		@Website='http://www.dairi-wip.com/',
		@Path='14.png',
		@FoodId=3,
		@LocationId=4

exec spRestaurants @crud='c',
		@RestaurantName='Red Top Drive Inn Restaurant',
		@Description='Casual, old-school diner with red-accented decor serving up burgers, gyros, kids meals & shakes.',
		@Address='219 St. Marys Road',
		@PostalCode='R2H 1J2',
		@ContactNo='(204) 233-3943',
		@Website='http://redtopdriveinn.com/',
		@Path='15.png',
		@FoodId=3,
		@LocationId=4

exec spRestaurants @crud='c',
		@RestaurantName='Cornerstone Bar & Restaurant',
		@Description='casual and contemporary restaurant/pub in the heart of Osborne Village. Burgers and house-made fries draw crowds. Thoughtful menu of salads, soups and sandwiches. Desserts to die for.',
		@Address='93 Osborne Street',
		@PostalCode='R3L 1Y4',
		@ContactNo='(204) 505-7772',
		@Website='http://www.thecornerstonewpg.ca/',
		@Path='16.png',
		@FoodId=3,
		@LocationId=5

exec spRestaurants @crud='c',
		@RestaurantName='Nuburger-Osborne Village',
		@Description='Healthy, fresh, local and tasty are the touchstones at this slick burger boutique in Winnipegs dining, shopping and restaurant district Osborne Village.',
		@Address='472 Stradbrook Avenue',
		@PostalCode='R3L 0J9',
		@ContactNo='(204) 888-1001',
		@Website='http://ilovenuburger.com/',
		@Path='17.jpg',
		@FoodId=3,
		@LocationId=5

exec spRestaurants @crud='c',
		@RestaurantName='Daly Burgers',
		@Description='Dalys fat boy—a chill-slathered burger—is a champ. Homemade style burgers draw big crowds and the retro 50s diner is a blast from the past',
		@Address='619 Corydon Avenue',
		@PostalCode='R3L 0P3',
		@ContactNo='(204) 284-4944',
		@Website='http://www.dalyburgers.com/',
		@Path='18.jpg',
		@FoodId=3,
		@LocationId=6

exec spRestaurants @crud='c',
		@RestaurantName='Market Burger',
		@Description='Concise and creative menu featuring loads of Manitoba ingredients from local producers. Guests can choose from several signature burgers including Butter Chicken, Sun (a veggie creation by Underground Café), Black Bean (vegan and gluten free), Mac n’ Cheese and All-Day Breakfast, among others.',
		@Address='645 Corydon Avenue',
		@PostalCode='R3M 0W3',
		@ContactNo='(204) 505-2510',
		@Website='http://www.marketburgerwpg.com/',
		@Path='19.jpg',
		@FoodId=3,
		@LocationId=6

exec spRestaurants @crud='c',
		@RestaurantName='Nuburger-Kenaston',
		@Description='Dalys fat boy—a chill-slathered burger—is a champ. Homemade style burgers draw big crowds and the retro 50s diner is a blast from the past',
		@Address=' 1-1650 Kenaston Blvd',
		@PostalCode=' R3P 2M6',
		@ContactNo='(204) 615-2009',
		@Website='http://ilovenuburger.com/',
		@Path='20.jpg',
		@FoodId=3,
		@LocationId=6

exec spRestaurants @crud='c',
		@RestaurantName='Gus & Tonys at The Park',
		@Description='Classic Greek meets North American diner at this bright and bustling eatery on Portage Avenue near the footbridge to Assiniboine Park. ',
		@Address='2015 Portage Avenue',
		@PostalCode='R3J 0K3',
		@ContactNo='(204) 414-5508',
		@Website='https://www.facebook.com/GusTonysAtThePark',
		@Path='21.jpg',
		@FoodId=3,
		@LocationId=7

exec spRestaurants @crud='c',
		@RestaurantName='Roblin Grill',
		@Description='Roblin Grill opened in December 2016. Their emphasis is on farm-to-table using sustainable local ingredients. Menu items include chicken n waffle cones, house cut fries, beer can burgers (patty is stuffed with their own housemade three cheese macaroni and then wrapped in bacon).',
		@Address=' 6500 Roblin Boulevard',
		@PostalCode='R3R 3P9 ',
		@ContactNo='(204) 691-2201',
		@Website='https://www.roblingrill.ca/',
		@Path='22.png',
		@FoodId=3,
		@LocationId=7

exec spRestaurants @crud='c',
		@RestaurantName='The Burger Place',
		@Description='Out of this world fat boys and fresh-cut fries are some of the citys best. Family owned no-frills drive-in that has earned a rabid local following. Family friendly spot in the heart of St. James.',
		@Address='1909 Portage Avenue',
		@PostalCode='R3J 0J3 ',
		@ContactNo='(204) 831-7967',
		@Website='https://theburgerplace.ca/',
		@Path='23.png',
		@FoodId=3,
		@LocationId=7

exec spRestaurants @crud='c',
		@RestaurantName='Boon Burger Cafe',
		@Description='With the title of Canadas first vegan burger café, Boon Burger lives up to its calling. House-made patties are made with chick peas, mushrooms and brown rice and a collection of upscale condiments.',
		@Address='79 Sherbrook Street',
		@PostalCode='R3C 2B2',
		@ContactNo='(204) 415-1391',
		@Website='http://boonburger.ca/',
		@Path='24.png',
		@FoodId=3,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='Nuburger-The Forks',
		@Description='Reinventing what a burger could be from familiar classics to outlandishly awesome. Aiming to eliminate the Burger Hangover, we focus on balance and nutrition with tasty sauces with less oil, salt, and sugar, fresh wholesome toppings and locally-raised grass-fed cattle.Delicious, juicy, GUILT-FREE burgers.',
		@Address='131, 1 Forks Market Rd',
		@PostalCode='R3C 4Y3',
		@ContactNo='(204) 414-6021',
		@Website='http://www.ilovenuburger.com/',
		@Path='25.jpg',
		@FoodId=3,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='Tipsy Cow',
		@Description='Out of this world fat boys and fresh-cut fries are some of the citys best. Family owned no-frills drive-in that has earned a rabid local following. Family friendly spot in the heart of St. James.',
		@Address='285 Portage Avenue',
		@PostalCode='R3B 2B4',
		@ContactNo='(204) 944-8928',
		@Path='26.png',
		@Website='https://www.tipsycowwpg.com/',
		@FoodId=3,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='VJs Drive Inn',
		@Description='Come rain, shine or sub-Arctic temperatures, VJs burger stand is open. Serious fans will even line up outside during the chilliest temperatures to get their hands on one of VJs legendary fat boys. ',
		@Address='170 Main Street',
		@PostalCode='R3C 3P1',
		@ContactNo='(204) 943-2655',
		@Website='https://www.tripadvisor.ca/Restaurant_Review-g154954-d812642-Reviews-VJ_s_Drive_Inn-Winnipeg_Manitoba.html',
		@Path='27.jpg',
		@FoodId=3,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='White Star Diner',
		@Description='Simple, Delicious Diner Food from Scratch. ',
		@Address=' 258 Kennedy Street',
		@PostalCode=' R3C 1T2 ',
		@ContactNo='(204) 947-6970',
		@Website='http://www.whitestardiner.ca/',
		@Path='28.png',
		@FoodId=3,
		@LocationId=9

		
exec spRestaurants @crud='c',
		@RestaurantName='Amsterdam Tea Room',
		@Description='This fully licensed European style tea room in Winnipegs Exchange District is the perfect place to go for any social occasion. ',
		@Address='1800 Corydon Avenue',
		@PostalCode='R3N 0C5',
		@ContactNo='(204) 691-0044',
		@Website='http://amsterdamtearoom.com/',
		@Path='29.png',
		@FoodId=4,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='Bermax Caffé + Bistro',
		@Description='This modern stylish café is both kosher certified a designated illy coffee outlet. On top of their barista program, they also serve gourmet breads, pastas, sandwiches, flatbreads, salads and more. ',
		@Address=' 258 Kennedy Street',
		@PostalCode=' R3C 1T2 ',
		@ContactNo='(204) 947-6970',
		@Website='https://www.bermaxcaffe.com/',
		@Path='30.png',
		@FoodId=4,
		@LocationId=6

exec spRestaurants @crud='c',
		@RestaurantName='Cake-ology',
		@Description='Cake-ology makes cakes, all kinds of cakes! They also make cupcakes, cakettes and all kinds of other nibbly goodies.',
		@Address=' 85 Arthur Street',
		@PostalCode='R3B 0S8',
		@ContactNo='(204) 612-9866',
		@Website='https://www.cakeology.ca/',
		@Path='31.png',
		@FoodId=4,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='Cocoabeans on Corydon Cafe/Diner',
		@Description='We are Manitobas only dedicated gluten-free restaurant serving dairy-free and vegan options as well. We are an order at the counter restaurant that sources local food where possible',
		@Address='774 Corydon Avenue',
		@PostalCode='R3M 0Y1',
		@ContactNo='(204) 691-6041',
		@Website='https://www.cocoabeansbakeshop.com/',
		@Path='32.jpg',
		@FoodId=4,
		@LocationId=6

exec spRestaurants @crud='c',
		@RestaurantName='Common Sense Storehouse',
		@Description='Homestyle daytime fare created with fresh-baked bread. Charming hand hewn reclaimed wood furnishings. Soup and chili of the day, substantial salads and sammies.',
		@Address='1-490 Des Meurons Street',
		@PostalCode='R2H 2P5',
		@ContactNo='(204) 453-5156',
		@Website='https://www.zomato.com/winnipeg-mb/common-sense-deli-bakery-winnipeg',
		@Path='33.png',
		@FoodId=4,
		@LocationId=3

exec spRestaurants @crud='c',
		@RestaurantName='Fools And Horses',
		@Description='Fools & Horses sits on one of Canadas grandest old boulevards, at 379 Broadway. We offer a full espresso menu featuring our anchor roaster, Pilot Coffee, made on Manitobas first and only Modbar. In the afternoon, we open the taps for craft beer, including local favourites from Half Pints (MB), Lake of the Woods (ON), and Paddock Wood (SK), and select wines on Manitobas first FreshTAP system. Rishi Tea provides us with premium looseleaf organic tea.',
		@Address='379 Broadway Ave.',
		@PostalCode='R3C 0T9 ',
		@ContactNo='(204) 555-5555',
		@Website='http://www.foolsandhorses.ca/',
		@Path='34.jpg',
		@FoodId=4,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='Jonnies Sticky Buns',
		@Description='Sweet sticky buns have earned a well-deserved following. Playfully themed buns re made from regional ingredients. Daily specials, gluten free and vegan options.',
		@Address='941 Portage Avenue',
		@PostalCode='R3G 0P9',
		@ContactNo='(204) 415-7287',
		@Website='http://www.jonniesstickybuns.com/',
		@Path='35.jpg',
		@FoodId=4,
		@LocationId=7

exec spRestaurants @crud='c',
		@RestaurantName='Prairie Ink Cafe - Grant Park',
		@Description='Located inside Winnipegs renowned independent bookstore, Prairie Ink is a lively spot to catch up with dear friends or celebrate a family milestone. The from-scratch dishes straddle the line between modern diner and refined dining room.',
		@Address='Grant Park Shopping Centre, 1120 Grant Avenue',
		@PostalCode='R3M 2A6',
		@ContactNo='(204) 975-2659',
		@Website='http://www.prairieinkrestaurant.ca/',
		@Path='36.jpg',
		@FoodId=4,
		@LocationId=5

exec spRestaurants @crud='c',
		@RestaurantName='Frenchway Cafe',
		@Description='Simple, Delicious Diner Food from Scratch. ',
		@Address=' 238 Lilac Avenue',
		@PostalCode=' R3C 1T2 ',
		@ContactNo='(204) 421-9002',
		@Website='http://www.frenchway.ca/',
		@Path='37.png',
		@FoodId=4,
		@LocationId=6

exec spRestaurants @crud='c',
		@RestaurantName='Stellas Cafe & Bakery (Plug In)',
		@Description='ocally owned breakfast, brunch and lunch spot is a favourite for all demographics. Local ingredients, house-mades breads and jams and a wickedly divine breakfast menu draw crowds every day of the week. ',
		@Address='460 Portage Avenue',
		@PostalCode='R3C 0E8',
		@ContactNo='(204) 772-1556',
		@Website='http://stellas.ca/',
		@Path='38.jpg',
		@FoodId=4,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='La Belle Baguette',
		@Description='St. Boniface’s newest bakery takes pastry to a whole new level with a display case and counter that is simply stacked with eye-catching creations from chef/owner Alix Loiselle. Loiselle also has an impressive baking resume including working at the Chateau Lake Louise and for Daniel Boulud at the Ritz Carlton.',
		@Address='248 Cathedrale Avenue',
		@PostalCode='R2H 2V9',
		@ContactNo='(204) 219-2123',
		@Website='https://www.labellebaguette.ca/',
		@Path='39.png',
		@FoodId=4,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='The Thaw',
		@Description='Ecology students discover a prehistoric parasite that has been released from the melting polar ice cap threatens the safety of the world.',
		@Address='3 - 1235 Pembina Highway',
		@PostalCode='R3T 2A9',
		@ContactNo='(204) 952-6616',
		@Website='http://www.camillebakehouse.com/',
		@Path='40.png',
		@FoodId=4,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='The Store Next Door',
		@Description='This modern bakery, coffee shop and prepared meals to-go spot is the little sister of Chew restaurant. Freshy baked bread—12 or so daily varieties—are sold alongside French, Asian and Jewish pastries',
		@Address='532 Waterloo Street',
		@PostalCode='R3N 0T1',
		@ContactNo='(204) 667-2439',
		@Website='http://www.chewcatering.ca/the-store-next-door/',
		@Path='41.jpg',
		@FoodId=4,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='The Fyxx Espresso Bar',
		@Description='This java joint has a coffee menu as long as your arm. Here you will find everything from espresso to mochas to lattes and cappuccinos. Hot chocolate, apple cider and imported sodas are also available',
		@Address='310 Broadway Avenue',
		@PostalCode=' R3C 0T2',
		@ContactNo='(204) 989-2470',
		@Website='https://fyxx.weebly.com/',
		@Path='42.jpg',
		@FoodId=4,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='The Crusty Bun',
		@Description='Bakery and café serving traditional and artisanal European baked goods. From-scratch soups and schnitzels make an impression in this bustling and bright spot in St. Vital. Counter service only.',
		@Address=' H-1026 St. Marys Road',
		@PostalCode='R2M 3S7',
		@ContactNo='(204) 257-7311',
		@Website='http://www.crustybun.com/',
		@Path='43.jpg',
		@FoodId=4,
		@LocationId=4

exec spRestaurants @crud='c',
		@RestaurantName='Tea Story Cafe',
		@Description='Tea story is a well designed modern cafe using most of mid century signature furniture, located in Osborne Village. They offer over 100 varieties of premium loose leaf teas and popular fresh fruit bubble tea, as long as unique savory and sweet waffles.',
		@Address='222 Osborne Street',
		@PostalCode='R3L 1Z3',
		@ContactNo='(204) 447-1102',
		@Website='http://teastorycafe.com/',
		@Path='44.png',
		@FoodId=5,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='Tall Grass Prairie Bread Company at The Forks',
		@Description='Located inside the Forks Market this unique bakery offers breads and baked goods made from scratch with organic grains. Also visit the Grass Roots Prairie Kitchen nearby for ready-to-bake whole foods.',
		@Address=' 1 Forks Market Road',
		@PostalCode='R3C 4L8',
		@ContactNo='(204) 943-2818',
		@Website='https://www.tallgrassbakery.ca/',
		@Path='45.jpg',
		@FoodId=4,
		@LocationId=9
		
exec spRestaurants @crud='c',
		@RestaurantName='Mini Donuts Factory',
		@Description='The smell of cinnamon and sugar will draw you in to this carnival favourite. Mini donuts are made right in front of your eyes. Orders are available by the half-dozen and by the dozen, and all types of drinks are available. Located just off The Market courtyard.',
		@Address='he Forks Market, #150',
		@PostalCode='R3C 4L9',
		@ContactNo='(204) 253-7600',
		@Website='https://www.facebook.com/minidonutsfactory/',
		@Path='46.jpg',
		@FoodId=4,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='Oh Doughnuts',
		@Description='Oh Doughnuts offers gourmet specialty doughnuts in the Winnipeg area.There are vegan & gluten free options, & ingredients are local & organic when possible.',
		@Address='326 Broadway Avenue',
		@PostalCode='R3C 0S6',
		@ContactNo='(204) 555-5555',
		@Website='https://ohdoughnuts.com/',
		@Path='47.jpg',
		@FoodId=4,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='Micheles Restaurant',
		@Description='Oh Doughnuts offers gourmet specialty doughnuts in the Winnipeg area.There are vegan & gluten free options, & ingredients are local & organic when possible.',
		@Address='484 McPhillips St.',
		@PostalCode='R2X 2H2',
		@ContactNo='(204) 982-3791',
		@Website='https://www.opentable.ca/r/micheles-restaurant-mcphillips-station-casino-winnipeg',
		@Path='48.jpg',
		@FoodId=5,
		@LocationId=1

exec spRestaurants @crud='c',
		@RestaurantName='Dancing Noodle',
		@Description='Dancing noodle is culinary wizardry at its finest, a little beef-noodle soup shop where chef Xiaofei Zuo is hand-pulling outrageously toothy noodles over a hundred times a day.',
		@Address='1393 A Pembina Highway',
		@PostalCode='R3T 2B8 ',
		@ContactNo='(204) 691-0205',
		@Website='https://www.zomato.com/winnipeg-mb/dancing-noodle-fort-garry',
		@Path='49.jpg',
		@FoodId=6,
		@LocationId=5

exec spRestaurants @crud='c',
		@RestaurantName='Evergreen Restaurant',
		@Description='Join us as we celebrate over 30 years serving BBQ specialties and authentic Chinese cuisine. We offer a variety of traditional Chinese dishes all prepared fresh and made to order! We have everything from beef in a black bean sauce to to sweet and sour chicken.',
		@Address='331 Pembina Highway',
		@PostalCode='R3L 2E3 ',
		@ContactNo='(204) 555-5555',
		@Website='https://www.tripadvisor.ca/Restaurant_Review-g154954-d809924-Reviews-Evergreen_Restaurant-Winnipeg_Manitoba.html',
		@Path='50.png',
		@FoodId=6,
		@LocationId=5

exec spRestaurants @crud='c',
		@RestaurantName='Emerald Palace',
		@Description='Locals know that Emerald Palace is the place to discover authentic Chinese cuisine in Winnipeg. Our passion is for preparing fresh, traditional Chinese dishes at prices families can afford. No matter your preferences, our wide variety of menu options is sure to satisfy even the most particular taste buds.',
		@Address='704 Sargent Avenue',
		@PostalCode='R3E 0A9',
		@ContactNo='(204) 788-4573',
		@Website='https://www.zomato.com/winnipeg-mb/emerald-palace-winnipeg/menu',
		@Path='51.jpg',
		@FoodId=6,
		@LocationId=7

exec spRestaurants @crud='c',
		@RestaurantName='Kum Koon Garden',
		@Description='Winnipegs largest restaurant is never short on customers. Crowds descend for expertly delivered dim sum lunches. Cantonese specials populate the dinner menu inside this family friendly dining room. ',
		@Address='257 King Street',
		@PostalCode='R3B 1J6',
		@ContactNo='(204) 943-4655',
		@Website='http://www.kumkoongarden.com/',
		@Path='52.jpg',
		@FoodId=6,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='King + Bannatyne',
		@Description='We are the first Sandwich Shop in Winnipeg dedicated to making Hand-Crafted, Slow Roasted Sandwiches. We are located in the Heart of Winnipegs Historical Exchange District on the Southwest corner of King St. Bannatyne Ave. ',
		@Address='4-100 King Street',
		@PostalCode='R3B 0P6 ',
		@ContactNo='(204) 691-9757',
		@Website='https://www.kingandbannatyne.com/',
		@Path='53.jpg',
		@FoodId=8,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='Miss Browns',
		@Description='At MISS BROWNS Hot Pressed Sandwich & Coffee Co. they pride themselves on creating the best possible fresh handcrafted sandwiches and coffee.',
		@Address='288 William Avenue',
		@PostalCode='R3B 0R1 ',
		@ContactNo='(204) 962-3143',
		@Website='http://www.missbrownswinnipeg.com/',
		@Path='54.jpg',
		@FoodId=8,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='Massawa',
		@Description='Busy and popular spot serving Eritrean and Ethiopian classics like wots (stews) and tibs (sautéed meats) with piles of injera (sour flatbreads).',
		@Address='200-121 Osborne Street',
		@PostalCode='R3L 1Y4',
		@ContactNo='(204) 284-3194',
		@Website='https://www.google.com/search?ei=xNQiW4DLI8HBjwTKxZuADQ&q=massawa+winnipeg&oq=Massawa&gs_l=psy-ab.1.1.0l10.2459.2459.0.4609.1.1.0.0.0.0.122.122.0j1.1.0....0...1c.1.64.psy-ab..0.1.122....0.eWvl8s05QiE',
		@Path='55.png',
		@FoodId=9,
		@LocationId=5

exec spRestaurants @crud='c',
		@RestaurantName='Harmans Café',
		@Description='Ethiopian favourites like tibs and wats served alongside fresh injera. Order a traditional coffee at meals end. ',
		@Address='570 Sargent Avenue',
		@PostalCode='R3B 3L5',
		@ContactNo='(204) 774-6997',
		@Website='https://www.zomato.com/winnipeg-mb/harmans-cafe-winnipeg',
		@Path='56.png',
		@FoodId=9,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='Kokeb',
		@Description='Friendly and charming service at this Winnipeg favourite. Ethiopian favourites like doro tibs and wots (stews) served with house made injera. Make sure to order a traditional Ethiopian coffee to finish the meal.',
		@Address='266 Edmonton Street',
		@PostalCode='R3C 1R9',
		@ContactNo='(204) 784-9267',
		@Website='https://www.facebook.com/Kokeb-Restaurant-264617883578690',
		@Path='57.png',
		@FoodId=9,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='Mon Ami Louis',
		@Description='Located on the iconic Esplanade Riel, Mon Ami Louis is the newest addition to the WOW! Family of restaurants!',
		@Address=' Esplanade Riel',
		@PostalCode='R2H 2B9',
		@ContactNo='(204) 942-1090',
		@Website='http://monamilouis.ca/',
		@Path='58.png',
		@FoodId=12,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='Peasant Cookery',
		@Description='A favourite amongst Winnipegs downtown business and creatives crowd, Peasant Cookery is a dance between classic and modern French with a helping of down home sense. House charcuterie is a must try on chef Tristan Foucaults menu. ',
		@Address='100-283 Bannatyne Avenue',
		@PostalCode=' R3B 1M3',
		@ContactNo='(204) 989-7700',
		@Website='http://peasantcookery.ca/',
		@Path='59.png',
		@FoodId=12,
		@LocationId=9

exec spRestaurants @crud='c',
		@RestaurantName='Creme deLEssence',
		@Description='hef RJ Urbano is making gorgeous, inventive food — especially for brunch — in this small café, reworking dishes that combine his Filipino roots with his French training. ',
		@Address='1833 Inkster Boulevard',
		@PostalCode='R2X 1R3',
		@ContactNo='(204) 694-2225',
		@Website='https://www.cremedelessence.net/',
		@Path='60.png',
		@FoodId=12,
		@LocationId=8

exec spRestaurants @crud='c',
		@RestaurantName='Café Ce Soir',
		@Description='A proponent of the slow food movement, chef/owner Cam Tran delivers French bistro favourites using local and organic ingredients wherever possible.',
		@Address=' 937 Portage Avenue',
		@PostalCode='R3G 0P9',
		@ContactNo='(204) 414-7647',
		@Website='https://www.cafecesoir.ca/',
		@Path='61.png',
		@FoodId=12,
		@LocationId=7

exec spRestaurants @crud='c',
		@RestaurantName='Infernos on Academy',
		@Description='French Canadian meets Mediterranean meats global fusion at this Academy location, baby brother to the original St. Boniface spot. Chef/owner Fern Kirouacs imagination runs wild on his plates. ',
		@Address='414 Academy Road',
		@PostalCode='R3N 0B9',
		@ContactNo='(204) 475-7400',
		@Website='http://www.infernosbistro.com/',
		@Path='62.png',
		@FoodId=12,
		@LocationId=6

exec spRestaurants @crud='c',
		@RestaurantName='Sous Sol',
		@Description='From the candlelight interior, to the antique chairs and tables, the persian rugs that line the floor, the gypsy jazz that plays on the stereo, and the hilariously old-school server’s station in the dining room',
		@Address='22-222 Osborne Street',
		@PostalCode='R3L 1Z3',
		@ContactNo='(204) 867-5309',
		@Website='http://www.soussolosborne.com/',
		@Path='63.png',
		@FoodId=12,
		@LocationId=5

exec spRestaurants @crud='c',
		@RestaurantName='Resto Gare',
		@Description='Dine on contemporary French cuisine with a touch of Manitoba flair inside a 19th century refurbished rail station and attached rail car. Touches of industrial chic mingle with French salon at this St. Boniface haunt',
		@Address='630 Des Meurons Street',
		@PostalCode='R2H 2P9',
		@ContactNo='(204) 837-3624',
		@Website='http://restogare.com/',
		@Path='64.png',
		@FoodId=12,
		@LocationId=4

exec spRestaurants @crud='c',
		@RestaurantName='Beaujenas French Table',
		@Description='Mediterranean and French dhôte table service. Chef/owner Randy Reynolds delights dinners with his modern interpretations of classic dishes.' ,
		@Address='302 Hamel Avenue',
		@PostalCode=' R2H 3E9',
		@ContactNo='(204) 943-2924',
		@Website='http://beaujenas.com/',
		@Path='65.png',
		@FoodId=12,
		@LocationId=3
		go

--  'About Winnipeg' Table and Procedures  --

create table tbAbout
(
	AboutID			 int identity(1,1) primary key,
	AboutTopic		 varchar(60),
	AboutDescription varchar(800)
)
go

create procedure spAboutCrud
(
	@aboutID		  int = null,
	@aboutTopic		  varchar(60) = null,
	@aboutDescription varchar(800) = null,
	@crud			  varchar(1)
)
as begin
	if @crud='r'  --  Read by AboutID  --
	begin
		select AboutID, AboutTopic, AboutDescription 
		from tbAbout 
		where AboutID = isnull(@aboutID,AboutID)
	end
	else if @crud='c'  --  Create  --
	begin
		insert into tbAbout(AboutTopic, AboutDescription) values
						(@aboutTopic,@aboutDescription)
	end
	else if @crud='u'  --  Update  --
	begin
		update tbAbout set
			   AboutTopic = @aboutTopic,
			   AboutDescription = @aboutDescription
		where AboutID = @aboutID
	end
	else if @crud = 'd'  --  Delete  --
	begin
		delete from tbAbout where AboutID = @aboutID
	end
end
go

exec spAboutCrud @crud = 'c',
			     @aboutTopic = 'Origins',
			     @aboutDescription = 'The confluence of the Red and the Assiniboine Rivers, known as ''The Forks'', has been a meeting place for 6,000 years.  The city was created on November 8, 1873 near the present day intersection of Portage Avenue and Main Street and is named after the Western Cree words for ''Muddy Water''.'

exec spAboutCrud @crud = 'c',
			     @aboutTopic = 'Now',
			     @aboutDescription = 'Winnipeg is the capital and largest city of the province of Manitoba. It is near the longitudinal centre of North America and is 110 kilometres from the Canada–United States border.'

exec spAboutCrud @crud = 'c',
			     @aboutTopic = 'Motto',
			     @aboutDescription = '"UNUM CUM VIRTUTE MULTORUM" is Latin for "One with the strength of many"'

exec spAboutCrud @crud = 'c',
			     @aboutTopic = 'Population',
			     @aboutDescription = 'The city has a population of 749,500, while the Province of Manitoba has a total population of 1.33 million.  (Estimated 2017)'

exec spAboutCrud @crud = 'c',
			     @aboutTopic = 'Average Monthly Temperatures',
			     @aboutDescription = 'Being in the middle of the continent, Winnipeg''s weather varies greatly between summer and winter.  The following table shows the average monthly highs and lows:'


create table tbAvgTemps
(
		MonthID int identity(1,1) primary key,
		Month	varchar(15),
		AvgHigh varchar(12),
		AvgLow	varchar(12)
)
go

create procedure spAvgTempCrud
(
	@monthID int = null,
	@month	 varchar(15) = null,
	@avgHigh varchar(12) = null,
	@avgLow  varchar(12) = null,
	@crud	 varchar(1)
)
as begin
	if @crud='r'
	begin
		select MonthID, Month, AvgHigh, AvgLow from tbAvgTemps
		where MonthID = isnull(@monthID,MonthID)
	end
	else if @crud='c'
	begin
		insert into tbAvgTemps(Month, AvgHigh, AvgLow) values
							 (@month,@avgHigh,@avgLow)
	end
	else if @crud='u'
	begin
		update tbAvgTemps set
			   Month = @month,
			   AvgHigh = @avgHigh,
			   AvgLow = @avgLow
		where MonthID = @monthID
	end
end
go

exec spAvgTempCrud @crud = 'c',
				   @month = 'January',
				   @avgHigh = '-10 C',
				   @avgLow = '-20 C'

exec spAvgTempCrud @crud = 'c',
				   @month = 'February',
				   @avgHigh = ' -8 C',
				   @avgLow = '-20 C'

exec spAvgTempCrud @crud = 'c',
				   @month = 'March',
				   @avgHigh = '  0 C',
				   @avgLow = '-11 C'

exec spAvgTempCrud @crud = 'c',
				   @month = 'April',
				   @avgHigh = ' 10 C',
				   @avgLow = ' -2 C'

exec spAvgTempCrud @crud = 'c',
				   @month = 'May',
				   @avgHigh = ' 18 C',
				   @avgLow = '  5 C'

exec spAvgTempCrud @crud = 'c',
				   @month = 'June',
				   @avgHigh = ' 23 C',
				   @avgLow = ' 12 C'

exec spAvgTempCrud @crud = 'c',
				   @month = 'July',
				   @avgHigh = ' 26 C',
				   @avgLow = ' 14 C'

exec spAvgTempCrud @crud = 'c',
				   @month = 'August',
				   @avgHigh = ' 26 C',
				   @avgLow = ' 13 C'

exec spAvgTempCrud @crud = 'c',
				   @month = 'September',
				   @avgHigh = ' 20 C',
				   @avgLow = ' 8 C'

exec spAvgTempCrud @crud = 'c',
				   @month = 'October',
				   @avgHigh = ' 11 C',
				   @avgLow = '  1 C'

exec spAvgTempCrud @crud = 'c',
				   @month = 'November',
				   @avgHigh = '  1 C',
				   @avgLow = ' -8 C'

exec spAvgTempCrud @crud = 'c',
				   @month = 'December',
				   @avgHigh = ' -8 C',
				   @avgLow = '-17 C'

create table tbRating
(
	RatingID int identity(0,1) primary key,
	Rating	 varchar(12)
)
go
insert into tbRating(Rating)values
	('- -'), ('*'), ('* *'), ('* * *'), ('* * * *'), ('* * * * *')
go

create procedure spGetRating
(
	@ratingID int = null,
	@rating   varchar(12) = null
)
as begin
	select * from tbRating where RatingID = isnull(@ratingID, RatingID)
end
go


go
create table tbHotels
(
	HotelID			 int identity(1,1) primary key,
	HotelName		 varchar(30),
	HotelPrice		 int,
	HotelRatingID	 int foreign key references tbRating (RatingID),
	HotelDescription varchar(800),
	HotelPhoneNumber varchar(15),
	HotelAddress	 varchar(100),
	HotelPostalCode  varchar(7),
	HotelWebsite	 varchar(100),
	Hotel_path		 varchar(200),
	HotelLocationID  int foreign key references tbLocation(LocationID)
)
go

create procedure spHotelCrud
(
	@hotelID		  int = null,
	@hotelName		  varchar(30) = null,
	@hotelPrice		  int = null,
	@hotelRatingID	  int = null,
	@hotelDescription varchar(800) = null,
	@hotelPhoneNumber varchar(15) = null,
	@hotelAddress	  varchar(100) = null,
	@hotelPostalCode  varchar(7) = null,
	@hotelWebsite	  varchar(100) = null,
	@hotel_path		  varchar(200) = null,
	@hotelLocationID  int = null,
	@crud			  varchar(1)
)
as begin

	if @crud='r'  --  Read & Search
	begin
		SELECT h.HotelID, r.Rating, l.LocationName, h.HotelName, h.HotelPrice, 
			h.HotelDescription, h.HotelPhoneNumber, h.HotelAddress, h.HotelPostalCode, 
			h.HotelWebsite, '.\HotelPictures\' + Hotel_path AS Hotel_path 
			FROM tbHotels h JOIN tbLocation l ON h.HotelLocationID = l.LocationID
			JOIN  tbRating r ON h.HotelRatingID = r.RatingID
			where H.HotelRatingID = isnull(@hotelRatingID,HotelRatingID) or h.HotelLocationID = isnull(@hotelLocationID, HotelLocationID)
	end
	else if @crud='h'
	begin
	select HotelID,HotelName,HotelPrice,HotelRatingID,HotelDescription,HotelPhoneNumber,HotelAddress,HotelPostalCode,HotelWebsite,HotelLocationID, '.\HotelPictures\' + Hotel_path as Hotel_path from tbHotels
	where HotelID=isnull(@hotelID,HotelID)
	end
	else if @crud='c'  --  Create
	begin
		insert into tbHotels(HotelName, HotelPrice, HotelRatingID, HotelDescription, HotelPhoneNumber, HotelAddress, HotelPostalCode, HotelWebsite, Hotel_path, HotelLocationID)
								values
							(@hotelName,@hotelPrice,@hotelRatingID,@hotelDescription,@hotelPhoneNumber,@hotelAddress,@hotelPostalCode,@hotelWebsite,@hotel_path,@hotelLocationID)
	end
	else if @crud='u'  --  Update
	begin
		update tbHotels set
			   HotelName = @hotelName,
			   HotelPrice = @hotelPrice,
			   HotelRatingID = @hotelRatingID,
			   HotelDescription = @hotelDescription,
			   HotelPhoneNumber = @hotelPhoneNumber,
			   HotelAddress = @hotelAddress,
			   HotelPostalCode = @hotelPostalCode,
			   HotelWebsite = @hotelWebsite,
			   Hotel_path = @hotel_path,
			   HotelLocationID = @hotelLocationID
		where HotelID = @hotelID
	end
	else if @crud = 'd'  --  Delete
	begin
		delete from tbHotels where HotelID = @hotelID
	end
end
go

exec spHotelCrud @crud = 'c',
		@hotelName = 'Alt Hotel Winnipeg',
		@hotelPrice = 159,
		@hotelRatingID = 3,
		@hotelDescription = 'Located in the new Sports, Hospitality and Entertainment District (SHED), the hotel is just steps away from the Bell MTS Place, home of the Winnipeg Jets hockey team, an array of businesses such as restaurants, bars and boutiques.',
		@hotelPhoneNumber = '1-844-946-6258',
		@hotelAddress = '310 Donald Street',
		@hotelPostalCode = 'R3B 2H3',
		@hotelWebsite = 'http://www.althotels.com/en/winnipeg/',
		@hotel_path = 'AltHotel.jpg',
		@hotelLocationID = 9

exec spHotelCrud @crud = 'c',
		@hotelName = 'Canad Inns Destination Centre Health Sciences Centre',
		@hotelPrice = 143,
		@hotelRatingID = 3,
		@hotelDescription = 'Our hotel is conveniently attached to the Health Sciences Centre, located just a few minutes from downtown Winnipeg, including shopping at Portage Place and The Forks, and just a five minute drive from McPhillips Station Casino.  For your comfort, our hotel offers a number of universally-accessible and wheelchair-friendly rooms.',
		@hotelPhoneNumber = '204-594-9472',
		@hotelAddress = '720 William Avenue',
		@hotelPostalCode = 'R3E 3J7',
		@hotelWebsite = 'http://www.canadinns.com/stay/health-sciences-centre/',
		@hotel_path = 'CanadInnsHSC.png',
		@hotelLocationID = 9
			  
exec spHotelCrud @crud = 'c',
		@hotelName = 'Clarion Hotel & Suites',
		@hotelPrice = 149,
		@hotelRatingID = 2,
		@hotelDescription = 'The hotel is nestled in the hub of Winnipeg’s shopping, restaurant and business neighbourhoods. Located just 6 km from the James Richard Armstrong International Airport (YWG), Ikea and the new Seasons Outlet Collection Mall, and within walking distance to Manitoba’s largest Mall CF Polo Park Shopping Centre. The Clarion Hotel is only 15 minutes from downtown Winnipeg.',
		@hotelPhoneNumber = '204-774-5110',
		@hotelAddress = '1445 Portage Avenue',
		@hotelPostalCode = 'R3G 3P4',
		@hotelWebsite = 'http://www.clarionhotelwinnipeg.com/',
		@hotel_path = 'ClarionPoloPark.jpg',
		@hotelLocationID = 7

exec spHotelCrud @crud = 'c',
		@hotelName = 'Delta Hotels by Marriott Winnipeg',
		@hotelPrice = 175,
		@hotelRatingID = 4,
		@hotelDescription = 'The Delta Hotels Winnipeg has established itself as a premier destination for business travelers and vacationing families here in the heart of the city.  Take a dip in the heated indoor pool, or relax on the rooftop at our seasonal outdoor pool when the weather here in Winnipeg is warm.  Those visiting here in the city will love our hotel''s downtown location and our versatile event venues. And we offer direct Skywalk access to the RBC Convention Centre, BellMTS Place and much more, making exploration easy.',
		@hotelPhoneNumber = '204-942-0551',
		@hotelAddress = '350 St Mary Avenue',
		@hotelPostalCode = 'R3C 3J2',
		@hotelWebsite = 'http://www.marriott.com/hotels/travel/ywgdw-delta-hotels-winnipeg/',
		@hotel_path = 'DeltaHotel.png',
		@hotelLocationID = 9

exec spHotelCrud @crud = 'c',
		@hotelName = 'Econo Lodge',
		@hotelPrice = 110,
		@hotelRatingID = 2,
		@hotelDescription = 'Convenient for accessing the hospital, University of Winnipeg campus and downtown Winnipeg.  Rooms not wheelchair accessible',
		@hotelPhoneNumber = '204-255-7100',
		@hotelAddress = '690 Notre Dame Avenue',
		@hotelPostalCode = 'R3E 0L7',
		@hotelWebsite = 'http://www.econolodge.com/',
		@hotel_path = 'EconoLodgeND.jpg',
		@hotelLocationID = 9

exec spHotelCrud @crud = 'c',
		@hotelName = 'The Fort Garry Hotel',
		@hotelPrice = 149,
		@hotelRatingID = 3,
		@hotelDescription = 'Located in downtown Winnipeg, the Fort Garry Hotel was built in 1913 as a grand railway hotel.  The century-old Fort Garry Hotel, Spa and Conference Centre ushers in a new era of modern-day style in downtown Winnipeg. Catering to guests who appreciate local history mixed with authentic charm, this iconic 240-room “Grand Dame” is a favorite for weddings, romantic getaways and wellness weekends. Don’t leave without saying hello to one of the hotel’s friendly resident ghosts.',
		@hotelPhoneNumber = '204-942-8251',
		@hotelAddress = '222 Broadway',
		@hotelPostalCode = 'R3C 0R3',
		@hotelWebsite = 'https://www.fortgarryhotel.com/',
		@hotel_path = 'FortGarryHotel.jpg',
		@hotelLocationID = 9

exec spHotelCrud @crud = 'c',
		@hotelName = 'Hilton Winnipeg Airport Suites',
		@hotelPrice = 123,
		@hotelRatingID = 3,
		@hotelDescription = 'Located in Winnipeg Airport Industrial Park, we provide easy access to downtown Winnipeg. Use the complimentary airport shuttle service to/from the hotel. Polo Park Mall, the largest shopping center in Manitoba with over 200 stores, is less than 2 miles away. We’re also a short drive to the newest Outlet Collection Winnipeg.',
		@hotelPhoneNumber = '204-783-1700',
		@hotelAddress = '1800 Wellington Avenue',
		@hotelPostalCode = 'R3H 1B2',
		@hotelWebsite = 'http://www3.hilton.com/en/hotels/manitoba/hilton-winnipeg-airport-suites-YWGWIHF/index.html/',
		@hotel_path = 'HiltonAirport.jpg',
		@hotelLocationID = 10

exec spHotelCrud @crud = 'c',
		@hotelName = 'Inn at the Forks',
		@hotelPrice = 186,
		@hotelRatingID = 3,
		@hotelDescription = 'Located in downtown Winnipeg at The Forks, our top tourism attraction, you''re immersed in a convergence of cultures – Aboriginal, French Canadian and Manitoban – at a 6,000-year-old meeting place. The myriad of shopping, arts, and entertainment options on-site and nearby is unmatched.',
		@hotelPhoneNumber = '1-866-500-4938',
		@hotelAddress = '75 Forks Market Road',
		@hotelPostalCode = 'R3C 0A2',
		@hotelWebsite = 'http://www.innforks.com/',
		@hotel_path = 'InnAtTheForks.jpg',
		@hotelLocationID = 9

exec spHotelCrud @crud = 'c',
		@hotelName = 'Queen Bee Hotel',
		@hotelPrice = 89,
		@hotelRatingID = 2,
		@hotelDescription = 'Located just outside of the main gates of the University of Manitoba, the Queen Bee Hotel is within walking distance to many restaurants, cultural venues and other conveniences.',
		@hotelPhoneNumber = '204-269-4666',
		@hotelAddress = '2615 Pembina Hwy.',
		@hotelPostalCode = 'R3T 2H5',
		@hotelWebsite = 'http://www.queenbeehotel.com/',
		@hotel_path = 'QueenBee.jpg',
		@hotelLocationID = 5

exec spHotelCrud @crud = 'c',
		@hotelName = 'Radisson Hotel Winnipeg Downtown',
		@hotelPrice = 152,
		@hotelRatingID = 3,
		@hotelDescription = 'Conveniently located on Portage Avenue, Radisson Hotel Winnipeg Downtown is within sight of the Burton Cummings Theatre and area shopping centres.  Open on weekdays from 7:30 a.m. to 5 p.m., our skywalk connects you to Cityplace, Bell MTS Place and Winnipeg Square. The Radisson is also less than 20 minutes from Winnipeg James Armstrong Richardson International Airport (YWG) and within a 10-minute walk of the Canadian Museum for Human Rights, the Exchange District, the RBC Convention Centre and Chinatown.',
		@hotelPhoneNumber = '204-956-0410',
		@hotelAddress = '288 Portage Avenue',
		@hotelPostalCode = 'R3C 0B8',
		@hotelWebsite = 'http://www.radisson.com/winnipeg-hotel-mb-r3c0b8/mbwinnip/',
		@hotel_path = 'RadissonHotel.jpg',
		@hotelLocationID = 9

exec spHotelCrud @crud = 'c',
		@hotelName = 'Royal Albert Arms',
		@hotelPrice = 0,
		@hotelRatingID = 0,
		@hotelDescription = 'The Royal Albert Hotel with its 54 rooms, restaurant, coffee shop and cigar stand opened its doors on November 5, 1913.  The façade of the hotel was designed with a continental flair. A red-tiled roof forms a cornice over a brick front accentuated with ornamental iron fretwork, elaborate iron lights and arched main floor windows and doors which combine to create an Italian effect.',
		@hotelPhoneNumber = '204-943-8433',
		@hotelAddress = '48 Albert Street',
		@hotelPostalCode = 'R3B 1E7',
		@hotelWebsite = 'none',
		@hotel_path = 'RoyalAlbertArmsHotel.jpg',
		@hotelLocationID = 9

exec spHotelCrud @crud = 'c',
		@hotelName = 'Travelodge Winnipeg East',
		@hotelPrice = 95,
		@hotelRatingID = 2,
		@hotelDescription = '',
		@hotelPhoneNumber = '204-255-6000',
		@hotelAddress = '20 Alpine Avenue',
		@hotelPostalCode = 'R2M 0Y5',
		@hotelWebsite = 'http://www.wyndhamhotels.com/',
		@hotel_path = 'TravelodgeEast.jpg',
		@hotelLocationID = 4

exec spHotelCrud @crud = 'c',
		@hotelName = 'Viscount Gort Hotel',
		@hotelPrice = 115,
		@hotelRatingID = 3,
		@hotelDescription = 'Pronounced vī kount, the Viscount Gort is located minutes from Polo Park Shopping Centre.  We offer free parking for our guests and a free shuttle to and from the airport. City buses stop close by and there are plenty of taxi and limo services always available.',
		@hotelPhoneNumber = '1-800-665-1122',
		@hotelAddress = '1670 Portage Avenue',
		@hotelPostalCode = 'R3J 0C9',
		@hotelWebsite = 'http://www.viscount-gort.com/',
		@hotel_path = 'ViscountGort.png',
		@hotelLocationID = 7
go

exec spHotelCrud @crud = 'r'

exec spHotelCrud @crud = 'r', @hotelLocationID = 4, @hotelRatingID = 2

exec spHotelCrud @crud = 'r', @hotelLocationID = 9, @hotelRatingID = 4

go

--  Universities and Colleges  --

--  School Types Table and Procedures  --

go
create table tbSchoolTypes
(
	SchTypeID int identity(1,1) primary key,
	SchType   varchar(40)
)
insert into tbSchoolTypes (SchType) values
	('Undergraduate'), ('Graduate & Undergraduate'), ('College')
go

create procedure spGetSchoolTypes
(
	@schTypeID int = null,
	@schType   varchar(40) = null
)
as begin
	select * from tbSchoolTypes where SchTypeID = isnull(@schTypeID, SchTypeID)
end
go

--  School Table and Procedures  --

create table tbUniversitiesColleges
(
	SchoolID int identity(1,1) primary key,
	SchoolName varchar(50),
	SchoolTypeID int foreign key references tbSchoolTypes(SchTypeID),
	SchoolDescription varchar(800),
	SchoolPhoneNumber varchar(15),
	SchoolAddress varchar(100),
	SchoolPostalCode varchar(7),
	SchoolWebsite varchar(100),
	School_path varchar(200),
	SchoolLocationID int foreign key references tbLocation(LocationID)
)
go

create procedure spSchoolsCrud
(
	@schoolID int = null,
	@schoolName varchar(50) = null,
	@schoolTypeId int = null,
	@schoolDescription varchar(800) = null,
	@schoolPhoneNumber varchar(15) = null,
	@schoolAddress varchar(100) = null,
	@schoolPostalCode varchar(7) = null,
	@schoolWebsite varchar(100) = null,
	@school_path varchar(200) = null,
	@schoolLocationID int = null,
	@schoolCrud varchar(1)
)
as begin
	if @schoolCrud='r'
	begin
		select tbUniversitiesColleges.SchoolID, tbUniversitiesColleges.SchoolName, tbSchoolTypes.SchType,
			tbUniversitiesColleges.SchoolDescription, tbUniversitiesColleges.SchoolPhoneNumber, tbUniversitiesColleges.SchoolAddress,
			tbUniversitiesColleges.SchoolPostalCode, tbUniversitiesColleges.SchoolWebsite,
			'.\UniversityPictures\' + School_path as School_path 
		from tbUniversitiesColleges
		inner join tbSchoolTypes on tbUniversitiesColleges.SchoolTypeID = tbSchoolTypes.SchTypeID
		where SchoolID = isnull(@schoolID,SchoolID)
	end
	if @schoolCrud='s'
	begin
		select SchoolID, SchoolName, SchoolTypeID, SchoolDescription, SchoolPhoneNumber,
			SchoolAddress, SchoolPostalCode, SchoolWebsite,'.\UniversityPictures\' + School_path as School_path
		from tbUniversitiesColleges where SchoolId = isnull(@schoolID,SchoolID)
	end
	else if @schoolCrud='c'
	begin
		insert into tbUniversitiesColleges(SchoolName, SchoolTypeId, SchoolDescription, SchoolPhoneNumber, SchoolAddress, SchoolPostalCode, SchoolWebsite, School_path, SchoolLocationID) values
				(@schoolName,@schoolTypeId,@schoolDescription,@schoolPhoneNumber,@schoolAddress,@schoolPostalCode,@schoolWebsite,@school_path,@schoolLocationID)
	end
	else if @schoolCrud='u'
	begin
		update tbUniversitiesColleges set
			   SchoolName = @schoolName,
			   SchoolTypeId = @schoolTypeId,
			   SchoolDescription = @schoolDescription,
			   SchoolPhoneNumber = @schoolPhoneNumber,
			   SchoolAddress = @schoolAddress,
			   SchoolPostalCode = @schoolPostalCode,
			   SchoolWebsite = @schoolWebsite,
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

exec spSchoolsCrud @schoolCrud = 'c',
		@schoolName = 'Booth University College',
		@schoolTypeId = 3,
		@schoolDescription = 'William and Catherine Booth University College, rooted in The Salvation Army’s Wesleyan theological tradition, brings together Christian faith, rigorous scholarship and a passion for service.  A small campus with just 250 students, located in downtown Winnipeg.',
		@schoolPhoneNumber = '204-942-3856',
		@schoolAddress = '447 Webb Place',
		@schoolPostalCode = 'R3B 2P2',
		@schoolWebsite = 'http://www.boothuc.ca/',
		@school_path = 'BoothUC.png',
		@schoolLocationId = 7

exec spSchoolsCrud @schoolCrud = 'c',
		@schoolName = 'Canadian Mennonite University',
		@schoolTypeId = 1,
		@schoolDescription = 'CMU offers comprehensive university education within a dynamic and diverse Christian community. Exemplary academic studies across the arts and sciences are distinguished by interdisciplinary interaction, experiential learning, and quality connection between students and faculty.',
		@schoolPhoneNumber = '204-487-3300',
		@schoolAddress = '500 Shaftesbury Boulevard',
		@schoolPostalCode = 'R3P 2N2',
		@schoolWebsite = 'http://www.cmu.ca/',
		@school_path = 'CanadianMennoniteUniversity.jpg',
		@schoolLocationId = 9

exec spSchoolsCrud @schoolCrud = 'c',
		@schoolName = 'Herzing College Winnipeg',
		@schoolTypeId = 3,
		@schoolDescription = 'Herzing College has been recognized as a leader in high quality, credible training for market driven programs since 1965.  Over the years, the college has expanded its breadth of career-focused education and has expanded geographically to include campus locations across the country. Our reputation is built on a foundation of high ethical standards, and a commitment to the success of our students.',
		@schoolPhoneNumber = '204-775-8175',
		@schoolAddress = '1700 Portage Avenue',
		@schoolPostalCode = 'R3J 0E1',
		@schoolWebsite = 'http://www.herzing.ca/winnipeg/',
		@school_path = 'Herzing.png',
		@schoolLocationId = 7

exec spSchoolsCrud @schoolCrud = 'c',
		@schoolName = 'Red River College',
		@schoolTypeId = 3,
		@schoolDescription = 'We have 4 campuses scattered throughout Winnipeg, and 5 more outside Winnipeg.  We are Manitoba’s largest institute of applied learning and research, with more than 200 full- and part-time degree, diploma and certificate options.  We have close to 22,000 students each year from more than 60 countries.',
		@schoolPhoneNumber = '204-632-2327',
		@schoolAddress = '2055 Notre Dame Avenue',
		@schoolPostalCode = 'R3H 0J9',
		@schoolWebsite = 'http://www.rrc.mb.ca/',
		@school_path = 'RedRiverCollege.jpg',
		@schoolLocationId = 10

exec spSchoolsCrud @schoolCrud = 'c',
		@schoolName = 'Robertson College',
		@schoolTypeId = 3,
		@schoolDescription = 'Having been in operation for over 100 years, Robertson College has established itself as a leading private post-secondary institution in Canada.  There are 12 locations in Canada and one in China.',
		@schoolPhoneNumber = '204-926-8325',
		@schoolAddress = '265 Notre Dame Avenue',
		@schoolPostalCode = 'R3B 1N9',
		@schoolWebsite = 'http://www.robertsoncollege.com/',
		@school_path = 'RobertsonCollege.png',
		@schoolLocationId = 9

exec spSchoolsCrud @schoolCrud = 'c',
		@schoolName = 'University of Manitoba',
		@schoolTypeId = 2,
		@schoolDescription = 'Since 1877, the University of Manitoba has been driving discovery and inspiring minds through innovative teaching and research excellence. The U of M has 24,000 undergraduate and graduate students studying more than 90 degree programs.',
		@schoolPhoneNumber = '204-474-8880',
		@schoolAddress = '66 Chancellors Circle',
		@schoolPostalCode = 'R3T 2N2',
		@schoolWebsite = 'http://www.umanitoba.ca/',
		@school_path = 'UniversityManitoba.png',
		@schoolLocationId = 5
go

create table tbUsers(
id int identity (1,1) primary key,
firstName varchar (50) not null,
lastName varchar (50) not null,
phoneNumber varchar (20) not null,
address varchar (max) not null,
email varchar (60) not null,
password varchar (30) not null,
accessLevel varchar(1)
)
go
select * from tbUsers
go
create table tbWrongLogins(
id int identity(1,1) primary key,
email varchar (60)  null,
password varchar (30)  null,
date date 
)
go
select * from tbWrongLogins
go
create procedure spUser(
@id int=null,
@firstName varchar (50)=null,
@lastName varchar (50)=null,
@phoneNumber varchar(20)= null,
@address varchar (max)= null,
@email varchar(60)=null,
@password varchar(30)=null,
@accessLevel varchar(1)=null,
@crud varchar(10))
as begin
if @crud='r'
begin
select
id,firstName,lastName,phoneNumber,address,email,password,accessLevel
from tbUsers where id=isnull(@id,id)
end
else if
@crud='c'
begin
insert into tbUsers(firstName,lastName,phoneNumber,address,email,password,accessLevel) values
                    (@firstName,@lastName, @phoneNumber,@address,@email,@password,@accessLevel)  
end
else if
@Crud='d'
begin
delete from tbUsers where id=@id
end
else if
@Crud='u'
begin
update tbUsers set
firstName=@firstName,
lastName=@lastName,
phoneNumber=@phoneNumber,
address=@address,
accessLevel=@accessLevel
where id=@id
end
end
go

create procedure spLogin(
@email varchar(60),
@password varchar(30)
)
as begin
if exists
( select accessLevel from tbUsers where email=@email and
          password=@password)
begin

select
id ,
firstName ,
lastName ,
phoneNumber,
address ,
email ,
password ,
accessLevel 
from tbUsers where email=@email and
          password=@password
end
else 
select 'x' as accessLevel
begin
insert into tbWrongLogins(email,password,date) values(@email,@password,getdate())
end
end
go
exec spLogin @email='margo@winny', @password='pass2'

 exec spUser @crud='c', @firstName='Anjali', @lastName='Patel', @phoneNumber='777-55-55', @address='555 Main Str., Winnipeg, MB ',
              @email='anjali.patel@robertsoncollege.net', @password='pass1', @accessLevel='a' --a=admin
 exec spUser @crud='c', @firstName='Margarita', @lastName='Zamoshch', @phoneNumber='222-55-55', @address='111 Main Str., Winnipeg, MB ',
              @email='margarita.zamoshch@robertsoncollege.net', @password='pass2', @accessLevel='c' --c=client
 exec spUser @crud='c', @firstName='Tracy', @lastName='McCormack', @phoneNumber='333-55-55', @address='444 Main Str., Winnipeg, MB ',
              @email='tracy.mccormack@robertsoncollege.net', @password='pass3', @accessLevel='c' 
 exec spUser @crud='c', @firstName='Natalia', @lastName='Shmer', @phoneNumber='555-55-55', @address='777 Main Str., Winnipeg, MB ',
              @email='natalia.shmer@robertsoncollege.net', @password='pass4', @accessLevel='c' 

select * from tbUsers
go
exec spUser @crud='r'
go

create procedure spReports(
@crud varchar(50)
)
as begin
if @crud='f'
begin
select (firstName + ''+ lastName) as fullName, email, accessLevel

from tbUsers
end
else if @crud='i'
begin
select*from tbWrongLogins
end
else if @crud='at'
begin
select count(attractionID) as [attraction qnt], attractionCategory
from tbAttractions
group by attractionCategory
end
else if @crud='st'
select count(CategoryId) as [ qnt], CategoryType from tbShoppingCategories 
group by CategoryType
end
go
exec spReports @crud='f'
exec spReports @crud='i'
exec spReports @crud='at'
exec spReports @crud='st'

--Coupons
create table tbCouponType(
TypeId int identity (1,1) primary key,
CouponType varchar (max)not null)
go
insert into tbCouponType(CouponType) values
('Restaurants'),('Attractions'),('Shopping'),('Hotels')
go

create table tbCoupons(
CouponId int identity (1,1) primary key,
CouponName varchar (max) not null,
Path varchar(max),
TypeId int foreign key references tbCouponType (TypeId))
go
create procedure spCoupon(
@CouponId int=null,
@CouponName varchar(max)=null,
@Path varchar (max)=null,
@TypeId int= null,
@Crud varchar(10))
as begin
if @Crud='r'
begin select
CouponId,CouponName, '.\Coupons\' +Path as Path, TypeId from tbCoupons where CouponId=isnull(@CouponId, CouponId)
end
else if
@Crud='c'
begin 
insert into tbCoupons (CouponName,Path, TypeId) values
(@CouponName,@Path, @TypeId)
end
else if
@Crud='d'
begin
delete from tbCoupons where CouponId=@CouponId
end
else if
@Crud='u'
begin
update tbCoupons set
CouponName=@CouponName,
Path=@Path,
TypeId=@TypeId
where
CouponId=@CouponId
end
else if
@Crud='x'
begin
select CouponId, CouponName, Path, TypeId from tbCoupons where
TypeId=@TypeId
end
end
go
go
exec spCoupon @Crud='c', @CouponName='Boston Pizza', @Path='boston_pizza_coupon.jpg', @TypeId=1
exec spCoupon @Crud='c', @CouponName='Taco Del Mar', @Path='TacoDelMar_coupon.jpg', @TypeId=1
exec spCoupon @Crud='c', @CouponName='Tim Hortons', @Path='TimHortons_coupon.jpg', @TypeId=1
exec spCoupon @Crud='c', @CouponName='Hudson Bay', @Path='HudsonBay_coupon.gif', @TypeId=3
exec spCoupon @Crud='c', @CouponName='Michaels', @Path='Michaels_coupon.jpg', @TypeId=3
exec spCoupon @Crud='c', @CouponName='Rona', @Path='Rona_coupon.jpg', @TypeId=3
go
create table tbCouponOrder(
OrderId int identity(1,1) primary key,
UserId int foreign key references tbUsers(id),
CouponId int foreign key references tbCoupons(CouponId)
)
go
create procedure spAddCouponOrder(
@UserId int,
@CouponId int)
as begin
if exists
(select OrderId from tbCouponOrder where UserId=@UserId and CouponId=@CouponId)
begin
select 'Something went wrong' as message
end
else
begin
insert into tbCouponOrder (UserId, CouponId) values (@UserId,@CouponId)
select 'Great!' as message
end
end
go
create procedure spGetCouponOrder(
@id int=null
)
as begin
select* from tbtbCouponOrder where OrderId=isnull(@id,OrderId)
end
go
exec spAttractions @crud='u', @id=1, @category='Museums',
        @name='Winnipeg Police Museum1111',
        @desc='The Museum is displays artifacts related to the history of the Winnipeg Police Force, dating from its beginning in 1874.', 
		@address='245 Smith Street, Winnipeg', 
		@phone='(204) 986-3976',
        @website='http://winnipeg.ca/police/Museum/', 
		@image='Winnipeg-Police-Museum.jpg', 
		@location=9
		go
select*from tbAttractions
select * from tbRestaurants where LocationId=9
select * from tbFood_Category
select * from tbUsers
