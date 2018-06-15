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

select * from tbLocation
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
exec spAddShoppingCategories  @CategoryType='Outlet'
exec spAddShoppingCategories  @CategoryType='Gourmet Foods'
exec spAddShoppingCategories  @CategoryType='Shopping Malls'

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
Web varchar (max),
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
@Web varchar (max)=null,
@LocationId int=null,
@CategoryId int=null,
@Crud varchar (10)
)
as begin
if @Crud='r'
begin
select
StoreId,StoreName, Description,'.\Shopping\'+ Path as Path,Address,PhoneNumber,Web,LocationId,CategoryId
from tbStores where StoreId=isnull(@StoreId,StoreId)
end
else if
@Crud='c'
begin
insert into tbStores (StoreName, Description,Path,Address,PhoneNumber,Web, LocationId,CategoryId) values
                     (@StoreName, @Description,@Path,@Address,@PhoneNumber,@Web, @LocationId,@CategoryId)
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
Web=@Web,
LocationId=@LocationId,
CategoryId=@CategoryId
where StoreId=@StoreId
end
else if @Crud='x'
begin
select StoreId,StoreName, Description,'.\Shopping\'+ Path as Path,Address,PhoneNumber,Web,LocationId,CategoryId
from tbStores where CategoryId=@CategoryId
end
end
go
go

--exec spStores @Crud='x', @CategoryId=1

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
              @Description='Selim’s Antiques has been in business for almost 50 years. 
			  They have established themselves by specializing in one thing… quality. 
			  Whether it is art, jewelry, furniture, fine collectibles, rugs, tableware or any number of items, 
			  they carry the finest that Winnipeg has to offer.',
              @Path='Selim Antiques.jpg',@Address='801 Corydon Avenue, Winnipeg, MB, R3M 0W6',
			  @PhoneNumber='204.284.9886',@Web='http://www.selimsantiques.com/', @LocationId=5, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Things', 
              @Description='Operated by the Women*s Committee of the Royal Winnipeg Ballet with proceeds going to The Royal Winnipeg Ballet.',
              @Path='Things.jpg',@Address='913 Corydon Avenue, Winnipeg, MB, R3M 0W8 ',
			  @PhoneNumber='204.284.7331',@Web='http://thingsantiquesoncorydon.webs.com/', @LocationId=5, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Frazer*s Antiques', 
              @Description='Frazer*s Antiques Store',
              @Path='Frazer Antiques.jpg',@Address='587 Clifton Street, Winnipeg, MB',
			  @PhoneNumber='204.783.4786',@Web='https://www.tourismwinnipeg.com/play/shopping/display,listing/05768/frazer-s-antiques', @LocationId=7, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Marway Militaria Inc.', 
              @Description='We specialize in many areas, including Canadian militaria from Confederation
			  right up to modern day, we carry British and German Militaria as well. ',
              @Path='Marway Militaria Inc.jpg',@Address='22 - 1865 Sargent Avenue, Winnipeg, MB, R3H 0E4 ',
			  @PhoneNumber='204.775.7159',@Web='http://www.marway-militaria.com/', @LocationId=7, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Thirsty*s Flea Market & Auction', 
              @Description='Thirsty*s Flea Market & Auction Store',
              @Path='Thirsty Flea Market & Auction.png',
			  @Address='1111 Ellice Avenue, Winnipeg, MB ',
			  @PhoneNumber=' 204.783.9800',@Web='http://www.thirstys.ca/',@LocationId=7, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Winnipeg Trading Post', 
              @Description='Winnipeg Trading Post takes pride in showcasing the work of our supportive artistic community. 
			  All products are hand crafted, making each and every item exclusive and unique. 
			  Stop in today to shop our inventory or, simply place a custom order.',
              @Path='Winnipeg Trading Post.jpg',
			  @Address='339 William Ave., Winnipeg, MB, R2W 3S3 ',
			  @PhoneNumber='204.947.0513',@Web='http://www.winnipegtradingpost.com/', @LocationId=7, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Collectibles Canada', 
              @Description='Collectibles Canada features all types of coins and currency from North America and around the world, 
			  gold and silver in many forms, and has an extensive selection of Royal Canadian Mint product both past and present.
			  Our “one stop coin shop” display of mint product and supplies begins where the mint leaves off.',
              @Path='Collectibles Canada.png',
			  @Address='2211 McPhillips Street, Winnipeg, MB, R2V 3M5 ',
			  @PhoneNumber='204.586.6263',@Web='http://www.collectiblescanada.com/', @LocationId=8, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Antiques & Funk', 
              @Description='Antiques & Funk buy Estates, Entire Households, Single Items or Collections, and they Make House Calls!',
              @Path='Antiques & Funk.jpg',
			  @Address='474 Main Street, Winnipeg, MB, R3B 1B6 ',
			  @PhoneNumber='204.943.4782 ',@Web='http://www.antiquesandfunk.com/', @LocationId=9, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Johnston Terminal', 
              @Description='This historic building offers three levels of fabulous shopping and dining. 
			  Originally constructed in the 1920’s, this beautifully restored building now boasts Manitoba-owned 
			  businesses including shops, specialty boutiques, restaurants and a large antique mall.',
              @Path='Johnston Terminal.jpg',
			  @Address='25 Forks Market Road, Winnipeg, MB, R3B 3H6',
			  @PhoneNumber='204.956.5593',@Web='http://www.theforks.com/', @LocationId=9, @CategoryId=1 

exec spStores @Crud='c', @StoreName='The Old House Revival Company & Antique Mall', 
              @Description='The Old House Revival Company & Antique Mall Stores',
              @Path='The Old House Revival Company & Antique Mall.jpg',
			  @Address='324 Younge Street, Winnipeg, MB, R3B 2S4 ',
			  @PhoneNumber='204.477.4286',@Web='http://www.theoldhouserevival.com/', @LocationId=9, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Vintage Glory', 
              @Description='Vintage Glory is a stylish blend of chic boutique and vintage clothing shop.
			  The shop features the original tin ceiling and solid maple floors, completely restored by shop owner Doug Shand. ',
              @Path='Vintage Glory.jpg',
			  @Address='380 Donald Street, Winnipeg, MB, R3B 1P4 ',
			  @PhoneNumber='204.942.7186',@Web='http://www.vintageglory.ca/', @LocationId=9, @CategoryId=1 

exec spStores @Crud='c', @StoreName='Selkirk Book Exchange', 
              @Description='Selkirk Book Exchange Store',
              @Path='Selkirk Book Exchange.jpg',
			  @Address='442 McGregor Street, Winnipeg, MB, R2W 4X8 ',
			  @PhoneNumber='204.586.5127', @Web='https://www.tourismwinnipeg.com/play/shopping/display,listing/06105/selkirk-book-exchange',@LocationId=1, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Dog Eared Books', 
              @Description='We carry a good selection of gently used paperbacks in fantasy, children*s,
			  cookbooks, horror & mayhem, westerns, humour, inspirational, romance, mysteries & thrillers.',
              @Path='Dog Eared Books.jpg',
			  @Address='1157 Henderson Highway, Winnipeg, MB, R2G 1L5 ',
			  @PhoneNumber='204.338.7042',@Web='https://www.tourismwinnipeg.com/catalysts/www.dogearedbookssite.wordpress.com', @LocationId=2, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Sams Place', 
              @Description='We carry a good selection of gently used paperbacks in fantasy, children*s,
			  cookbooks, horror & mayhem, westerns, humour, inspirational, romance, mysteries & thrillers.',
              @Path='Sams Place.jpg',
			  @Address='159 Henderson Highway, Winnipeg, MB, R2L 1L4',
			  @PhoneNumber='204.415.4728',@Web='http://samscommunity.com/', @LocationId=2, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Coles', 
              @Description='Coles Store',
              @Path='Coles.jpg',
			  @Address='Kildonan Place Shopping Centre, 1555 Regent Avenue West, 1555 Regent Ae. W., Winnipeg, MB, R2C 4J2 ',
			  @PhoneNumber=' 204.661.8142',@Web='https://www.chapters.indigo.ca/en-ca/home/storelocator/storeDetails/153/', @LocationId=2, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Family Book Exchange', 
              @Description='Family Book Exchange has one of the largest romance sections around! 
			  Our romance area covers paranormal, historic, time travel, erotic, and suspense.',
              @Path='Family Book Exchange.jpg',
			  @Address='519 St. Mary*s Road, Winnipeg, MB, R2M 3L2',
			  @PhoneNumber='204.237.4949',@Web='http://www.familybookexchange.ca/', @LocationId=4, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Indigo', 
              @Description='Indigo Store',
              @Path='Indigo.jpg',
			  @Address='1590 Kenaston Blvd., Winnipeg, MB, R3P 0Y4' ,
			  @PhoneNumber='204.488.6621',@Web='http://www.chapters.indigo.ca/', @LocationId=4, @CategoryId=2 


exec spStores @Crud='c', @StoreName='Burton Lysecki Books', 
              @Description='Burton Lysecki Books buy and sell quality, used books--out-of-print, rare, 
			  vintage, antiquarian, recent, fine bindings, paperbacks, huge coffee table books and tiny miniatures. ',
              @Path='Burton Lysecki Books.jpg',
			  @Address='527 Osborne Street, Winnipeg, MB, R3L 2B2 ' ,
			  @PhoneNumber='204.284.4546 ', @Web='http://www.lysecki.com/',@LocationId=5, @CategoryId=2 

exec spStores @Crud='c', @StoreName='McNally Robinson', 
              @Description='McNally Robinson Store',
              @Path='McNally Robinson.jpg',
			  @Address='1120 Grant Avenue, Winnipeg, MB, R3M 2A6 ' ,
			  @PhoneNumber='204.475.0483', @Web='http://www.mcnallyrobinson.com/',@LocationId=5, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Prairie Sky Books', 
              @Description='This small, locally-owned and operated bookstore has served the community for 30 years.
			  Their focus of interest includes Buddhism, Yoga and Vedanta, Native American, Islam, Judaism, 
			  Christian, Wicca, Paganism, Health, Vegetarian and Vegan cooking, Astrology, Tarot, Occult, 
			  Birthing and Parenting, and other Conscious Lifestyle material.',
              @Path='Prairie Sky Books.jpg',
			  @Address='871 Westminster Avenue, Winnipeg, MB, R3G 1B3 ' ,
			  @PhoneNumber=' 204.774.6152',@Web='http://www.prairieskybooks.com/', @LocationId=5, @CategoryId=2 
			  
exec spStores @Crud='c', @StoreName='Whodunit? Mystery Book Store', 
              @Description='WHODUNIT carries both new and used books and will special-order, 
			  as well as ship to out of town customers and deliver to those unable to reach the bookstore themselves.',
              @Path='Whoodonit.jpg',
			  @Address='165 Lilac Street, Winnipeg, MB, R3M 2S1 ' ,
			  @PhoneNumber='204.284.9100',@Web='http://www.whodunitcanada.com/', @LocationId=6, @CategoryId=2 

exec spStores @Crud='c', @StoreName='A Book Fair', 
              @Description='Book Fair Winnipeg is a used book store and new comic book shop located in downtown 
			  Winnipeg. Book Fair Buys, Sells, & Trades quality slightly used books.
			  Book Fair carries a large selection of current paperback best sellers in all major categories
			  - from Fiction to Science Fiction / Fantasy to Romance and more. ',
              @Path='A Book Fair.jpg',
			  @Address='340 Portage Avenue, Winnipeg, MB, R3C 0C3 ' ,
			  @PhoneNumber='204.944.1630', @Web='http://www.bookfairwinnipeg.com/',@LocationId=9, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Red River Books', 
              @Description='Red River Books Store',
              @Path='Red River Books.jpg',
			  @Address='92 Arthur Street, Winnipeg, MB, R3B 1H3 ' ,
			  @PhoneNumber=' 204.943.9788 ', @Web='https://www.tourismwinnipeg.com/play/shopping/display,listing/06064/red-river-books',@LocationId=9, @CategoryId=2 

exec spStores @Crud='c', @StoreName='Spalifetstyle & Boutique', 
              @Description='Spalifestyle & Fashion Boutique is devoted to relaxation,
			  fashion and premium customer service.',
              @Path='Spalifetstyle Boutique.jpg',
			  @Address='2001 Henderson Highway, Winnipeg, MB, R2G 1P7 ' ,
			  @PhoneNumber=' 204.661.6111  ',@Web='http://www.slfb.ca/', @LocationId=2, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Bijou Treasures', 
              @Description='Founded in 2000 Bijou offers an eclectic collection of stylish, handcrafted jewellery.
			  Bijou is devoted to providing original and creatively designed jewellery. 
			  Based in Winnipeg, Manitoba they make inspired jewellery from conception to realization.',
              @Path='Bijou Treasures.jpg',
			  @Address='2539 Osborne St., Winnipeg, MB, R3L 2B2 ' ,
			  @PhoneNumber=' 204.233.9744 ',@Web='http://www.bijoutreasures.com/', @LocationId=5, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Hush Clothing', 
              @Description='Located in the hustle & bustle of Winnipeg’s Osborne Village,
			  Hush Clothing provides affordable & fashionable clothing & accessories in a relaxed place.',
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
              @Description='Out of the Blue is the go to place for 
			  everything fun, fabulous and wonderful in clothes, shoes, accessories, jewellery and more. ',
              @Path='Out of the Blue.jpg',
			  @Address=' 103-99 Osborne Street, Winnipeg, MB, R3L 2R4 ' ,
			  @PhoneNumber=' 204.475.9771 ',@Web='http://www.outoftheblue.ca/', @LocationId=5, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Rockabetty', 
              @Description='Rockabetty is a 1950*s inspired boutique with clothing for men, 
			  women and children. Along with carrying international brands, 
			  they design and manufacture the Rockabetty & Vintage Betty Brands right in Manitoba. ',
              @Path='Rockabetty.jpg',
			  @Address='121-B Osborne Street, Winnipeg, MB, R3L 1Y4 ' ,
			  @PhoneNumber=' 204.414.5511 ',@Web='http://www.rockabetty.ca/', @LocationId=5, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Rooster Shoes', 
              @Description='Designer shoes, handbags and luggage.
			  Popular brands include Mat & Nat, Fly, Kenneth Cole and much more.',
              @Path='Rooster Shoes.jpg',
			  @Address='452 River Avenue, Winnipeg, MB, R3L 0C7 ' ,
			  @PhoneNumber='204.219.7008 ',@Web='http://www.roostershoes.net/', @LocationId=5, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Shakti', 
              @Description='Located in Winnipeg*s Osborne Village, Shakti is a boutique store offering beads,
			  clothing, housewares, jewelry and jewelry making supplies.',
              @Path='Shakti.png',
			  @Address='194 B Osborne Street, Winnipeg, MB, R3L 1Y8 ' ,
			  @PhoneNumber='204.415.3338',@Web='http://www.shaktishine.ca/', @LocationId=5, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Silver Lotus', 
              @Description='Silver jewellery and accessories',
              @Path='Silver Lotus.jpg',
			  @Address='103 Osborne Street, Winnipeg, MB, R3L 1Y4 ' ,
			  @PhoneNumber='204.452.3648',@Web='http://www.silverlotus.biz/', @LocationId=5, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Sophia*s Boutique', 
              @Description='Silver jewellery and accessories',
              @Path='Sophias Boutique.jpg',
			  @Address=' 836 St. Mary Road, Winnipeg, MB, R2M 3P4 ' ,
			  @PhoneNumber='204.254.2595', @Web='http://www.sofias-boutique.com/',@LocationId=5, @CategoryId=3 

exec spStores @Crud='c', @StoreName='The Closet on River', 
              @Description='Guys and gal*s trendy fashion bar selling new, vintage and consignment 
			  clothing and accessories priced at least 50-90% off retail value.',
              @Path='The Closet on River.jpg',
			  @Address='470 River Avenue, Winnipeg, MB, R3L 0C8' ,
			  @PhoneNumber='204.233.2442',@Web='http://www.theclosetonriver.com/', @LocationId=5, @CategoryId=3 


exec spStores @Crud='c', @StoreName='Cha Cha Palace', 
              @Description='Shoe brands include Fly London, Frye, Fluevog, Camper, Neosens, and OTBT, to name a few.',
              @Path='Cha Cha Palace.jpg',
			  @Address='A-580 Academy Road, Winnipeg, MB, R3N 0E3 ' ,
			  @PhoneNumber=' 204.284.4128 ', @Web='https://chacha-palace.squarespace.com/',@LocationId=6, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Luxe Label', 
              @Description='Luxe Label sells women clothing that has been edited with timelss modern
			  and effortless appeal.  Luxe Label carries name brands such as Bailey 44,
			  Black Halo, David Lerner, Mackage, Rebecca Minkoff , Rich & Skinny, Spanx, Three Dots  and many more.',
              @Path='Luxe Label.jpg',
			  @Address='1693 Corydon Avenue, Winnipeg, MB, R3N 0J9 ' ,
			  @PhoneNumber='204.415.1415',@Web='http://www.luxelabel.com/', @LocationId=6, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Soul Shoes and Accessories', 
              @Description='Soul Shoes carries fashionable footwear, hanbags and accessories for both men and women. 
			  The owners constantly source new product lines to introduce to the Winnipeg market. ',
              @Path='Soul Shoes and Accessories.jpg',
			  @Address='167 Lilac Street, Winnipeg, MB, R3M 2S1 ' ,
			  @PhoneNumber=' 204.452.7685 ', @Web='https://www.facebook.com/SoulShoesAndAccessories',@LocationId=6, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Uomo Casual Fine Clothing For Men', 
              @Description='European Style clothing, custom made suits, formal wear rental & sales.',
              @Path='Uomo Casual Fine Clothing For Men.jpg',
			  @Address='610 Corydon Avenue, Winnipeg, MB, R3L 0P2 ' ,
			  @PhoneNumber=' 204.475.7244',@Web='https://www.facebook.com/VintageVerucaAntiques', @LocationId=6, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Aboriginal Designers Cooperative', 
              @Description='The Aboriginal Designers Cooperative is located on the main floor of
			  Neechi Commons at 865 Main Street, Winnipeg Mb. 
			  The cooperative is made up of 6 Aboriginal Designers from Manitoba and Saskatchewan.',
              @Path='Aboriginal Designers Cooperative.jpg',
			  @Address='865 Main Street, Winnipeg, MB, R2W 3N9  ' ,
			  @PhoneNumber='204.949.1338',@Web='https://www.facebook.com/Aboriginal.Designers.Cooperative/?ref=bookmarks', @LocationId=9, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Paperdoll Clothing', 
              @Description='Paperdoll Clothing offers an array of glamourous, spohisticated and sexy dresses, 
			  cute tops, skirts, handbags and jewellery.  They do not repeat any piece of clothing ',
              @Path='Paperdoll Clothing.jpg',
			  @Address='1-214 McDermot Avenue, Winnipeg, MB, R3B 0S3 ' ,
			  @PhoneNumber='204.947.9790',@Web='http://paperdollclothing.ca/', @LocationId=9, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Tara Davis Studio Boutique', 
              @Description='Located in the heart of the Exchange District, Tara Davis Studio Boutique is a combination studio, 
			  boutique, gallery and whimsical treasure hunt filled with unique pieces tara has made herself 
			  or selected from more than 50 Canadian makers.
			  You will find jewellery, handbags, pillows, candles, baby items, men*s accessories, clocks, cards 
			  and more.',
              @Path='Tara Davis Studio Boutique.jpg',
			  @Address='246 McDermot Avenue, Winnipeg, MB, R3B 0S5 ' ,
			  @PhoneNumber='204.504.8272 ', @Web='http://www.taradavis.ca/',@LocationId=9, @CategoryId=3 

exec spStores @Crud='c', @StoreName='The Foxy Shoppe', 
              @Description='Paperdoll Clothing offers an array of glamourous, spohisticated and sexy dresses, 
			  cute tops, skirts, handbags and jewellery.  They do not repeat any piece of clothing ',
              @Path='The Foxy Shoppe.jpg',
			  @Address='87 King Street, Winnipeg, MB, R3B 1H7 ' ,
			  @PhoneNumber=' 204.338.3699 ',@Web='http://www.thefoxyshoppe.com/', @LocationId=9, @CategoryId=3 

exec spStores @Crud='c', @StoreName='The Haberdashery', 
              @Description='The Haberdashery is a men*s and women*s accessory shop that carries 
			  a variety of quality accessories, including hats, neck ties, bow ties, scarves, gloves,
			  buckles, and sunglasses.',
              @Path='The Haberdashery.jpg',
			  @Address='84 Albert Street, Winnipeg, MB, R3B 1G2  ' ,
			  @PhoneNumber=' 204.256.3758 ',@Web='http://www.haberdashery.ca/', @LocationId=9, @CategoryId=3 

exec spStores @Crud='c', @StoreName='Callisto Couture Custom Corsets', 
              @Description='Corsetry is a timeless craft dating back to 1600 B.C. 
			  At Callisto Couture we enjoy using elements from the past to inspire out contemporary designs.
			  Fine workmanship and attention to detail go into every Callisto Couture corset.',
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
              @Description='Danier began as an independent family owned design house, manufacturer and retailer 
              in 1972. With an expertise and heritage creating leather garments, handbags and accessories we have 
              evolved into an essential fashion destination with a modern sensibility and timeless aesthetic.',
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
              @Description='A family owned company. Three generations of top quality boot manufacturers.
			  Proudly made in Winnipeg, Manitoba since 1978.',
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
              @Description='Authentic French bakery and patisserie serving divine croissants, macarons,
			  fruit tarts and a small menu of lunch items like quiche and sweet and savoury popovers.',
              @Path='A LEpi de Blé.jpg',
              @Address='1757 Main Street, Winnipeg, MB, R2V 1Z8 ' ,
              @PhoneNumber=' 204.334.2526 ', @Web='https://www.facebook.com/alepideblefrenchbakery',@LocationId=1, @CategoryId=5

exec spStores @Crud='c', @StoreName='Chocolatier Constance Popp', 
              @Description='Chocolatier Constance Popp produces fresh premium artisan chocolate using
			  Manitoba-produced ingredients and exotic single-origin chocolate, in Winnipeg.',
              @Path='Chocolatier Constance Popp.jpg',
              @Address='180 Provencher Boulevard, Winnipeg, MB, R2H 0G3 ' ,
              @PhoneNumber=' 204.897.0689  ',@Web='http://www.artisanchocolates.ca/', @LocationId=3, @CategoryId=5

exec spStores @Crud='c', @StoreName='Bernard Callebaut', 
              @Description='At Chocolaterie Bernard Callebaut they are devoted to making exquisite chocolates.',
              @Path='Bernard Callebaut.jpg',
              @Address='431 Academy Road, Winnipeg, MB, R3N 0C2 ' ,
              @PhoneNumber=' 204.488.4376  ',@Web='http://www.bernardcallebaut.com/', @LocationId=6, @CategoryId=5

exec spStores @Crud='c', @StoreName='Cornelia Bean', 
              @Description='Cornelia Bean is a gourmet tea and coffee emporium.
			  A retail store providing an outstanding selection of loose leaf tea, freshly
			  roasted coffee and Callebaut chocolates along with state of the art accessories.',
              @Path='Cornelia Bean.jpg',
              @Address='417 Academy Road, Winnipeg, MB, R3N 0C1  ' ,
              @PhoneNumber=' 204.489.5460  ',@Web='http://www.corneliabean.com/', @LocationId=7, @CategoryId=5

exec spStores @Crud='c', @StoreName='Sleepy Owl Bread', 
              @Description='At Sleepy Owl Bread we focus on producing from-scratch breads and pastries.
			  All of our products are baked fresh daily. Our menu maybe small but it allows us to ensure
			  a high quality product which is the core of our bakery.',
              @Path='Sleepy Owl Bread.jpg',
              @Address='751 Wall Street, Winnipeg, MB, R3G 2T6' ,
              @PhoneNumber='  204.805.2530  ',@Web='http://www.sleepyowlbread.ca/', @LocationId=8, @CategoryId=5

exec spStores @Crud='c', @StoreName='Fenton*s Gourmet Foods', 
              @Description='Fenton*s Gourmet Foods - The Cheese Shop is located in the Forks Market. 
			  With a selection of over 750 Cheeses, 24 Pâtés, as well as a full line of Olives & Crackers,
			  we are confident that you will leave the store satisfied that you have found exactly what you
			  were looking for.',
              @Path='Fentons Gourmet Foods.jpg',
              @Address='Forks Market, Winnipeg, MB ' ,
              @PhoneNumber='  204.942.8984  ',@Web='https://www.tourismwinnipeg.com/play/shopping/display,listing/05749/fenton-s-gourmet-foods',
			  @LocationId=9, @CategoryId=5

exec spStores @Crud='c', @StoreName='Garden City Shopping Centre', 
              @Description='Proudly serving northwest Winnipeg, Garden City offers over 75 retailers
			  and services including: Winners, Canadian Tire, and GoodLife Fitness. ',
              @Path='Garden City Shopping Centre.jpg',
              @Address='2305 McPhillips Street, Winnipeg, MB, R2V 3E1  ' ,
              @PhoneNumber='  204.338.7076  ',@Web='http://www.shopgardencity.ca/', @LocationId=1, @CategoryId=6

exec spStores @Crud='c', @StoreName='Kildonan Place Shopping Centre', 
              @Description='Kildonan Place is northeast Winnipeg’s largest shopping centre with more than 110 stores
			  and services such as Sears, Marshalls/HomeSense, H&M, Urban Planet, and State & Main.',
              @Path='Kildonan Place Shopping Centre.jpg',
              @Address='1555 Regent Avenue West, Winnipeg, MB, R2C 4J2 ' ,
              @PhoneNumber='  204.661.6116  ',@Web='http://www.kildonanplace.com/', @LocationId=2, @CategoryId=6
			
exec spStores @Crud='c', @StoreName='St. Vital Centre', 
              @Description='Kildonan Place is northeast Winnipeg’s largest shopping centre with more than 110 stores
			  and services such as Sears, Marshalls/HomeSense, H&M, Urban Planet, and State & Main.',
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
              @Description='CF Polo Park is Winnipeg*s premiere shopping, dining and entertainment destination
			  with 190 stores, 3 restaurants and a multiplex movie theatre.',
              @Path='CF Polo Park.jpg',
              @Address='1485 Portage Avenue, Winnipeg, MB, R3G 0W4 ' ,
              @PhoneNumber=' 204.784.2500   ',@Web='http://www.polopark.ca/', @LocationId=7, @CategoryId=6


exec spStores @Crud='c', @StoreName='Cityplace', 
              @Description='cityplace is Downtown Winnipeg*s most convenient shopping destination.
			   Located in the heart of the Sports, Hospitality & Entertainment District, cityplace
			   is connected to the indoor walkway system, linking it to an abundance of popular downtown
			   destinations like The MTS Centre, RBC Convention Centre, Millennium Library and Portage & Main.
			   With over 30 restaurants, retail shops & services and downtown Winnipeg*s only gaming centre, 
			   cityplace has something for everyone.',
              @Path='cityplace.jpg',
              @Address=' corner of St Mary Avenue and Hargrave, Winnipeg, MB,' ,
              @PhoneNumber=' 204.989.1800  ',@Web='http://www.cityplacewinnipeg.com/', @LocationId=7, @CategoryId=6

exec spStores @Crud='c', @StoreName='Portage Place Shopping Centre', 
              @Description='Located in the heart of downtown Winnipeg, Portage Place is the hub of downtown 
			  shopping with more than 100 services, restaurants, and stores as well as the spectacular 
			  Prairie Theatre Exchange on the 3rd level. It is the place to Meet, Shop and start your Downtown
			  excursion. Plus, take advantage of free* heated underground weekend parking and skywalk access to
			  the MTS Centre. ',
              @Path='Portage Place Shopping Centre.jpg',
              @Address='393 Portage Avenue, Winnipeg, MB, R3B 3H6 ' ,
              @PhoneNumber=' 204.925.4636  ',@Web='http://www.portageplace.mb.ca/', @LocationId=7, @CategoryId=6

exec spStores @Crud='c', @StoreName='Winnipeg Square', 
              @Description='Located in the heart of downtown Winnipeg, Portage Place is the hub of downtown 
			  shopping with more than 100 services, restaurants, and stores as well as the spectacular 
			  Prairie Theatre Exchange on the 3rd level. It is the place to Meet, Shop and start your Downtown
			  excursion. Plus, take advantage of free* heated underground weekend parking and skywalk access to
			  the MTS Centre. ',
              @Path='Winnipeg Square.jpg',
              @Address='360 Main Street, Winnipeg, MB, R3C 3Z3  ' ,
              @PhoneNumber=' 204.949.7140  ',@Web='http://www.winnipegsquare.com/', @LocationId=7, @CategoryId=6


exec spStores @Crud='r'
go
