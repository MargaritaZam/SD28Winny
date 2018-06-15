use master
go
drop database dbRestaurants
go
create database dbRestaurants
go
use dbRestaurants
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
create procedure spLocation
(
@LocationId int=null ,
@LocationName varchar(30)=null
)
as begin
	select * from tbLocation where LocationId=isnull(@LocationId,LocationId)
end
go
create table tbRestaurants
(RestaurantId int identity(1,1) primary key,
RestaurantName varchar(50),
Description varchar(800),
Address varchar(30),
PostalCode varchar(7),
ContactNo varchar(20),
path varchar(500),
Website varchar(100), 
FoodId int foreign key references tbFood_Category(FoodId),
LocationId int foreign key references tbLocation(LocationId)
)
go
create procedure spRestaurants
(
@RestaurantId int=null,
@RestaurantName varchar(50)=null,
@Description varchar(800)=null,
@Address varchar(30)=null,
@PostalCode varchar(7)=null,
@ContactNo varchar(20)=null,
@Path varchar(500)=null,
@website varchar(100)=null,
@FoodId int=null,
@LocationId int=null,
@crud varchar(1)=null
)
as begin
	if @crud='a'
	begin
		select RestaurantName,Description,RestaurantId,'./Pictures/Restaurants/' + path as path  from tbRestaurants where RestaurantId=isnull(@RestaurantId,RestaurantId)
	end
	else if @crud='r'
	begin
		select RestaurantId,RestaurantName,Address,ContactNo,Description,'./Pictures/Restaurants/' + path as path,Website from tbRestaurants where RestaurantId=isnull(@RestaurantId,RestaurantId)
	end
	else if @crud='s'
	begin
		
			select RestaurantName,Description,RestaurantId,'./Pictures/Restaurants/' + path as path  from tbRestaurants join tbFood_Category on
			tbRestaurants.FoodId=tbFood_Category.FoodId join tbLocation on 
			tbRestaurants.LocationId=tbLocation.LocationId 
			where tbRestaurants.LocationId=ISNULL(@LocationId,tbRestaurants.LocationId)
			and
			 tbRestaurants.FoodId=ISNULL(@FoodId,tbRestaurants.FoodId)
	end
	else if @crud='c'
	begin
	insert into tbRestaurants(RestaurantName,Description,Address,PostalCode,ContactNo,path,Website,FoodId,LocationId)
							values
							(@RestaurantName,@Description,@Address,@PostalCode,@ContactNo,@Path,@Website,@FoodId,@LocationId)

	end
end
go
select * from tbFood_Category
select * from tbLocation
go
exec spRestaurants @crud='c',
				@RestaurantName='Loveys BBQ',
				@Description='Bring a bib and dig into slow-and-low-smoked meats. House-made sauces add extra pizzazz to this BBQ-lovers haunt. Brisket, pork shoulder and ribs are stars on the menu.',
				@Address='2, 208 Marion St',
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
				@Path='55.jpg',
				@FoodId=9,
				@LocationId=5

exec spRestaurants @crud='c',
				@RestaurantName='Harmans Café',
				@Description='Ethiopian favourites like tibs and wats served alongside fresh injera. Order a traditional coffee at meals end. ',
				@Address='570 Sargent Avenue',
				@PostalCode='R3B 3L5',
				@ContactNo='(204) 774-6997',
				@Website='https://www.zomato.com/winnipeg-mb/harmans-cafe-winnipeg',
				@Path='56.jpg',
				@FoodId=9,
				@LocationId=9

exec spRestaurants @crud='c',
				@RestaurantName='Kokeb',
				@Description='Friendly and charming service at this Winnipeg favourite. Ethiopian favourites like doro tibs and wots (stews) served with house made injera. Make sure to order a traditional Ethiopian coffee to finish the meal.',
				@Address='266 Edmonton Street',
				@PostalCode='R3C 1R9',
				@ContactNo='(204) 784-9267',
				@Website='https://www.facebook.com/Kokeb-Restaurant-264617883578690',
				@Path='57.jpg',
				@FoodId=9,
				@LocationId=9

exec spRestaurants @crud='c',
				@RestaurantName='Mon Ami Louis',
				@Description='Located on the iconic Esplanade Riel, Mon Ami Louis is the newest addition to the WOW! Family of restaurants!',
				@Address=' Esplanade Riel',
				@PostalCode='R2H 2B9',
				@ContactNo='(204) 942-1090',
				@Website='http://monamilouis.ca/',
				@Path='58.jpg',
				@FoodId=12,
				@LocationId=9

exec spRestaurants @crud='c',
				@RestaurantName='Peasant Cookery',
				@Description='A favourite amongst Winnipegs downtown business and creatives crowd, Peasant Cookery is a dance between classic and modern French with a helping of down home sense. House charcuterie is a must try on chef Tristan Foucaults menu. ',
				@Address='100-283 Bannatyne Avenue',
				@PostalCode=' R3B 1M3',
				@ContactNo='(204) 989-7700',
				@Website='http://peasantcookery.ca/',
				@Path='59.jpg',
				@FoodId=12,
				@LocationId=9

exec spRestaurants @crud='c',
				@RestaurantName='Creme deLEssence',
				@Description='hef RJ Urbano is making gorgeous, inventive food — especially for brunch — in this small café, reworking dishes that combine his Filipino roots with his French training. ',
				@Address='1833 Inkster Boulevard',
				@PostalCode='R2X 1R3',
				@ContactNo='(204) 694-2225',
				@Website='https://www.cremedelessence.net/',
				@Path='60.jpg',
				@FoodId=12,
				@LocationId=8

exec spRestaurants @crud='c',
				@RestaurantName='Café Ce Soir',
				@Description='A proponent of the slow food movement, chef/owner Cam Tran delivers French bistro favourites using local and organic ingredients wherever possible.',
				@Address=' 937 Portage Avenue',
				@PostalCode='R3G 0P9',
				@ContactNo='(204) 414-7647',
				@Website='https://www.cafecesoir.ca/',
				@Path='61.jpg',
				@FoodId=12,
				@LocationId=7

exec spRestaurants @crud='c',
				@RestaurantName='Infernos on Academy',
				@Description='French Canadian meets Mediterranean meats global fusion at this Academy location, baby brother to the original St. Boniface spot. Chef/owner Fern Kirouacs imagination runs wild on his plates. ',
				@Address='414 Academy Road',
				@PostalCode='R3N 0B9',
				@ContactNo='(204) 475-7400',
				@Website='http://www.infernosbistro.com/',
				@Path='62.jpg',
				@FoodId=12,
				@LocationId=6

exec spRestaurants @crud='c',
				@RestaurantName='Sous Sol',
				@Description='From the candlelight interior, to the antique chairs and tables, the persian rugs that line the floor, the gypsy jazz that plays on the stereo, and the hilariously old-school server’s station in the dining room',
				@Address='22-222 Osborne Street',
				@PostalCode='R3L 1Z3',
				@ContactNo='(204) 867-5309',
				@Website='http://www.soussolosborne.com/',
				@Path='63.jpg',
				@FoodId=12,
				@LocationId=5

exec spRestaurants @crud='c',
				@RestaurantName='Resto Gare',
				@Description='Dine on contemporary French cuisine with a touch of Manitoba flair inside a 19th century refurbished rail station and attached rail car. Touches of industrial chic mingle with French salon at this St. Boniface haunt',
				@Address='630 Des Meurons Street',
				@PostalCode='R2H 2P9',
				@ContactNo='(204) 837-3624',
				@Website='http://restogare.com/',
				@Path='64.jpg',
				@FoodId=12,
				@LocationId=4

exec spRestaurants @crud='c',
				@RestaurantName='Beaujenas French Table',
				@Description='Mediterranean and French dhôte table service. Chef/owner Randy Reynolds delights dinners with his modern interpretations of classic dishes.' ,
				@Address='302 Hamel Avenue',
				@PostalCode=' R2H 3E9',
				@ContactNo='(204) 943-2924',
				@Website='http://beaujenas.com/',
				@Path='65.jpg',
				@FoodId=12,
				@LocationId=3

exec spRestaurants @crud='r'

--exec spRestaurants @crud='a'
--exec spFood_Category
--exec spRestaurants @crud='s',@FoodId=1







