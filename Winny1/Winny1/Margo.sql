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
atWebsite, './Pictures/'+ atImage as image, location from tbAttractions
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

exec spAttractions @crud='c', @category='Museums',
                              @name='Winnipeg Police Museum',
                              @desc='The Museum is displays artifacts related to the history of the Winnipeg Police Force, dating from its beginning in 1874.', 
							  @address='245 Smith Street, Winnipeg', 
							  @phone='(204) 986-3976',
                              @website='http://winnipeg.ca/police/Museum/', 
							  @image='Attractions/Winnipeg-Police-Museum.jpg', 
							  @location=9

exec spAttractions @crud='c', @category='Museums',
                              @name='Canadian Museum for Human Right',
                              @desc='Canadian Museum for Human Rights is the first national museum in Canada built outside the National Capital Region. The building was designed by Antoine Predock. The museum has 6 levels of exibits and 11 galleries accessible via inclined ramps or elevators.', 
							  @address='85 Israel Asper Way, Winnipeg', 
							  @phone='(204) 289-2000',
                              @website='https://humanrights.ca/', 
							  @image='Attractions/Canadian-Museum-for-Human-Rights.jpg', 
							  @location=9

exec spAttractions @crud='c', @category='Museums',
                              @name='Winnipeg Railway Museum',
                              @desc='Operated by volunteers from Midwestern Rail Association Inc. a non-profit charity, the museum has 37 000 square feet filled with railway artifacts, many more.', 
							  @address='123 Main Street, Winnipeg', 
							  @phone='(204) 942-4632',
                              @website='http://www.wpgrailwaymuseum.com/', 
							  @image='Attractions/Winnipeg-Railway-Museum.jpg', 
							  @location=9

exec spAttractions @crud='c', @category='Museums',
                              @name='Royal Winnipeg Rifles Museum & Archives',
                              @desc='The Museum had its humble beginnings at the Minto Armoury in Winnipeg in the mid-1960’s.  It was started as a local initiative to preserve the Regiment’s history, and was accredited as an official Canadian Forces Museum in the late 1970’s.  The Archives, the Regiments collection of historical documents and records, was formally established in 1994, its holdings having been boxed until that time.', 
							  @address='969 St Matthews Avenue, Winnipeg', 
							  @phone='',
                              @website='https://rwrmuseum.com/', 
							  @image='Attractions/Royal-Winnipeg-Rifles-Museum-Archives.jpg', 
							  @location=7

exec spAttractions @crud='c', @category='Museums',
                              @name='The Manitoba Museum',
                              @desc='Opened in 1932 as the Manitoba Museum of Man and Nature, today The Manitoba Museum is the largest not-for-profit heritage and science centre in Manitoba and is the recipient of many awards.', 
							  @address='190 Rupert Avenue, Winnipeg', 
							  @phone='(204) 956-2830',
                              @website='https://manitobamuseum.ca/main/', 
							  @image='Attractions/Manitoba-', 
							  @location=9

exec spAttractions @crud='c', @category='Museums',
                              @name='Manitoba Children*s Museum',
                              @desc='The Children*s Museum is housed in the oldest surviving trainbfacility, built 1889, in Western Canada. With 12 permanent galleries presenting various displays and interactive activities, this Museum is a treasure trove of learning and fun.', 
							  @address='45 Forks Market Road, Winnipeg', 
							  @phone='(204) 924-4000',
                              @website='https://childrensmuseum.com/', 
							  @image='Attractions/childrenmuseum.jpg', 
							  @location=9

exec spAttractions @crud='c', @category='Museums',
                              @name='Costume Museum of Canada',
                              @desc='This is the first museum in Canada dedicated to the collection, preservation and presentation of clothing and textiles.', 
							  @address='109 Pacific Avenue, Winnipeg', 
							  @phone='(204) 989-0072',
                              @website='http://www.costumemuseumcanada.com/', 
							  @image='Attractions/Costume-Museum-of-Canada.jpg', 
							  @location=9


exec spAttractions @crud='c', @category='Galleries',
                              @name='Winnipeg Art Gallery',
                              @desc='Manitoba*s premiere public gallery founded in 1912, has nine galleries of contemporary and historical art with an emphasis on work by Manitoba artists. Rooftop restaurant, gift shop. ', 
							  @address='300 Memorial Blvd, Winnipeg', 
							  @phone='(204) 786-6641',
                              @website='https://www.wag.ca/', 
							  @image='Attractions/art-gallery.jpg', 
							  @location=9

exec spAttractions @crud='c', @category='Galleries',
                              @name='Pulse Gallery',
                              @desc='Pulse Gallery showcases the diversity of Manitoba*s talented artists -- with a modern twist. Colour is the star in this gallery. Art can stimulate; art can inspire; art can ignite.', 
							  @address='25 Forks Market Rd (Johnston Terminal), Winnipeg', 
							  @phone='(204) 957-7140',
                              @website='http://www.pulsegallery.ca/', 
							  @image='Attractions/pulse.jpg', 
							  @location=9

exec spAttractions @crud='c', @category='Galleries',
                              @name='Warehouse Artworks',
                              @desc=' The gallery presents original art, in a variety of media, mainly from Manitoba artists. ', 
							  @address='222 McDermot Ave, Winnipeg', 
							  @phone='(204) 943-1681',
                              @website='https://www.facebook.com/pages/Warehouse-Artworks/238848533780', 
							  @image='Attractions/warehouse.jpg', 
							  @location=9

exec spAttractions @crud='c', @category='Galleries',
                              @name='Ukrainian Cultural & Educational Centre - Oseredok',
                              @desc='Oseredok is the largest Ukrainian cultural institution of its kind. It features rotating exhibitions of Canadian and international Ukrainian artists, focusing on a variety of styles, media and artists. ', 
							  @address='184 Alexander Ave East, Winnipeg', 
							  @phone='(204) 942-0218',
                              @website='http://oseredok.ca/', 
							  @image='Attractions/oseredok.jpg', 
							  @location=9

exec spAttractions @crud='c', @category='Galleries',
                              @name='Loch Gallery',
                              @desc='Established in 1972, the Loch Gallery specializes in building collections of quality Canadian, American, British and European paintings and sculpture. ', 
							  @address='306 St. Mary*s Road, Winnipeg', 
							  @phone='(204) 791-2239 ',
                              @website='http://www.lochgallery.com/', 
							  @image='Attractions/loch_winnipeg.jpg', 
							  @location=3

exec spAttractions @crud='c', @category='Galleries',
                              @name='Woodlands Gallery',
                              @desc='Woodlands Gallery represents an engaging selection of contemporary works by emerging and established Canadian artists. In addition to original paintings, the gallery offers hand-made jewellery, ceramics, blown glass and mono-prints as well as professional custom framing.', 
							  @address='535 Academy Road, Winnipeg', 
							  @phone='(204) 947-0700',
                              @website='http://www.woodlandsgallery.com/', 
							  @image='Attractions/woodland.jpg', 
							  @location=9

exec spAttractions @crud='c', @category='Parks',
                              @name='Assiniboine Park and Zoo',
                              @desc='Assiniboine Park and Zoo is your destination for adventure, discovery and four seasons of family fun.', 
							  @address='55 Pavilion Crescent, Winnipeg', 
							  @phone='(204) 927-6000  ',
                              @website='https://www.assiniboinepark.ca/', 
							  @image='Attractions/assiniboine-park-zoo.jpg', 
							  @location=7

exec spAttractions @crud='c', @category='Parks',
                              @name='Red River Exhibition Park',
                              @desc='Spread out over a total of 194 ha (480 acres) and with 36. 4 ha (90 acres) already in use, the Red River Exhibition Park is a multi-purpose facility where a number of popular events are held each year including the Red River Exhibition.', 
							  @address='3977 Portage Avenue, Winnipeg', 
							  @phone='(204) 888-6990',
                              @website='http://www.redriverex.com/', 
							  @image='Attractions/redriverex.jpg', 
							  @location=7

exec spAttractions @crud='c', @category='Parks',
                              @name='',
                              @desc='', 
							  @address='', 
							  @phone='(204) ',
                              @website='', 
							  @image='Attractions/', 
							  @location=9

exec spAttractions @crud='c', @category='Parks',
                              @name='',
                              @desc='', 
							  @address='', 
							  @phone='(204) ',
                              @website='', 
							  @image='Attractions/', 
							  @location=9

exec spAttractions @crud='c', @category='Parks',
                              @name='',
                              @desc='', 
							  @address='', 
							  @phone='(204) ',
                              @website='', 
							  @image='Attractions/', 
							  @location=9

exec spAttractions @crud='c', @category='Parks',
                              @name='',
                              @desc='', 
							  @address='', 
							  @phone='(204) ',
                              @website='', 
							  @image='Attractions/', 
							  @location=9


exec spAttractions @crud='r'