use master
go
drop database dbGroupProject
go
create database dbGroupProject
go
use dbGroupProject
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

create table tbRestaurants
(RestaurantId int identity(1,1) primary key,
RestaurantName varchar(50),
Description varchar(800),
Address varchar(30),
PostalCode varchar(7),
ContactNo varchar(20),
Path varchar(500),
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
@FoodId int=null,
@LocationId int=null,
@crud varchar(1)=null
)
as begin
	if @crud='r'
	begin
		select * from tbRestaurants where RestaurantId=isnull(@RestaurantId,RestaurantId)
	end
	else if @crud='c'
	begin
	insert into tbRestaurants(RestaurantName,Description,Address,PostalCode,ContactNo,path,FoodId,LocationId)
							values
							(@RestaurantName,@Description,@Address,@PostalCode,@ContactNo,@Path,@FoodId,@LocationId)

	end
end
go
select * from tbFood_Category
select * from tbLocation
go
exec spRestaurants @crud='c',
				@RestaurantName='Lovey"s BBQ',
				@Description='Bring a bib and dig into slow-and-low-smoked meats. House-made sauces add extra pizzazz to this BBQ-lovers haunt. Brisket, pork shoulder and ribs are stars on the menu.',
				@Address='2, 208 Marion St',
				@PostalCode='R2H 0T6',
				@ContactNo='(204) 233-7427',
				@Path='',
				@FoodId=1,
				@LocationId=9

exec spRestaurants @crud='c',
				@RestaurantName='Muddy Waters',
				@Description='Take a trip to Memphis inside this BBQ joint located at The Forks. Hickory-smoked ribs and pulled pork impress. Also boasts an eclectic menu of chicken wings.',
				@Address='15 Forks Market Rd',
				@PostalCode=' R3C 4Y3',
				@ContactNo='(204) 947-6653',
				@Path='',
				@FoodId=1,
				@LocationId=9

exec spRestaurants @crud='c',
				@RestaurantName='Park Café (Qualico Family Centre)',
				@Description='Take a trip to Memphis inside this BBQ joint located at The Forks. Hickory-smoked ribs and pulled pork impress. Also boasts an eclectic menu of chicken wings. ',
				@Address='330 Assiniboine Park Drive',
				@PostalCode='R3P 2N6',
				@ContactNo='(204) 927-6001',
				@Path='',
				@FoodId=2,
				@LocationId=6



exec spRestaurants @crud='c',
				@RestaurantName='Baked Expectations',
				@Description='Take a trip back in time to this 50s style diner and dessert parlour. Pull up a fork and choose from one (or several) house-made cakes, pies, tortes, cheesecakes or a mile-high pavlova loaded with berries and cream.',
				@Address='161 Osborne St',
				@PostalCode='R3L 1Y7',
				@ContactNo='(204) 452-5176',
				@Path='',
				@FoodId=2,
				@LocationId=5

exec spRestaurants @crud='c',
				@RestaurantName='Deer + Almond',
				@Description='Winnipeg bon vivant and chef Mandel Hitzers menu of multi-cultural fusion food is the epitome of a whimsical modern food adventure.',
				@Address='85 Princess St',
				@PostalCode='R3B 1K4',
				@ContactNo='(204) 504-8562',
				@Path='',
				@FoodId=2,
				@LocationId=9

exec spRestaurants @crud='c',
				@RestaurantName='Bonfire Bistro',
				@Description='A crowd favourite for authentic wood-fired, artisan pizzas. Stand-out pies include: serrano ham and pear with blue and mozzarella cheeses, arugula and finished with balsamic glaze and fig sauce.',
				@Address='1433 Corydon Avenue',
				@PostalCode='R3N 0J2 ',
				@ContactNo='(204) 489-2703',
				@Path='',
				@FoodId=2,
				@LocationId=6

exec spRestaurants @crud='c',
				@RestaurantName='Chew',
				@Description='Husband and wife chefs delight guests with whimsical plates of contemporary cuisine. Local ingredients are essential elements on every plate.',
				@Address=' 532 Waterloo Avenue',
				@PostalCode='R3N 0T3',
				@ContactNo='(204) 667-2439',
				@Path='',
				@FoodId=2,
				@LocationId=6

exec spRestaurants @crud='c',
				@RestaurantName='Saucers Café',
				@Description='Specialty coffees and teas anchor this menu of hunger-busting sandwiches, salads, pizzas and wraps.',
				@Address='570 Academy Road',
				@PostalCode='R3N 0E3',
				@ContactNo='(204) 487-4830',
				@Path='',
				@FoodId=2,
				@LocationId=6

exec spRestaurants @crud='c',
				@RestaurantName='Café Ce Soir',
				@Description='A proponent of the slow food movement, chef/owner Cam Tran delivers French bistro favourites using local and organic ingredients wherever possible.',
				@Address=' 937 Portage Avenue',
				@PostalCode='R3G 0P9',
				@ContactNo='(204) 414-7647',
				@Path='',
				@FoodId=2,
				@LocationId=7

exec spRestaurants @crud='c',
				@RestaurantName='Steves Bistro',
				@Description='Unleash your appetite at this modern Mediterranean dining room. Roasted lemon potatoes and spanakopita are divine, as our the lusciously tender lamb rack chops.',
				@Address='3123 Portage Avenue',
				@PostalCode='R3N 0E3',
				@ContactNo='(204) 831-5531',
				@Path='',
				@FoodId=2,
				@LocationId=7

exec spRestaurants @crud='c',
				@RestaurantName='Dessert Sinsations Cafe',
				@Description='The word café doesnt even begin to cover chef Barbara OHares downtown eatery and dessert parlour. Burgers, weekend breakfasts, salads and hearty favourites like lamb chops, pork tenderloin and a house steak sandwich punctuate this menu of refined comfort food. Vegetarian and gluten-free items dont get short shrift. ',
				@Address='85 Princess St',
				@PostalCode=' R3C 4B8',
				@ContactNo='(204) 284-0934',
				@Path='',
				@FoodId=2,
				@LocationId=9

exec spRestaurants @crud='c',
				@RestaurantName='Le Garage Cafe',
				@Description='This music and eats venue lives in the heart of Winnipegs French Quarter, St. Boniface. This casual spot serves burgers, sandwiches and French favourites like Tourtiere.',
				@Address='166 Provencher Blvd.',
				@PostalCode=' R3C 4B8',
				@ContactNo='(204) 237-0737',
				@Path='',
				@FoodId=2,
				@LocationId=3

exec spRestaurants @crud='r'








