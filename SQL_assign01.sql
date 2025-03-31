show databases;
create database sql_assign1;
drop database sql_one;
use company;
show tables;

#table 1
create table Manufacturers(
Code int(1),
Name varcharacter(20)
);


insert into Manufacturers(Code,Name)
values(1,"Sony"),
(2,"Creative Labs"),
(3,"Hewlett-Packard"),
(4,"Iomega"),
(5,"Fujitsu"),
(6,"Winchester");


#table 2
create table product(
Code int(2), Name char(20), Price int(5), Manufacturer int(5)); 


insert into product(Code, Name, Price, Manufacturer)
values(1,"Hard Drive",240,5),
(2,"Memory",120,6),(3,"Zip drive",150,4),(4,"Floppy Disk",5,6),
(5,"Monitor",240,1), (6,"DVD drive",180,2), (7,"CD drive",90,2),
(8,"Printer",270,3), (9,"Toner cartridge",66,3),
(10,"DVD burner",180,2);


select*from product;
select* from manufacturers;

#1 select the names of all the products in the store
select Name from product;

#2 select the names and the price of all the products in the stored 
select Name,Price from product;

#3 select the name of the products with a price less than or equal to $200
select Name,Price from product where Price <=200;

#4 select all the products with a price between $60 and $120
select *from product where Price between 60 and 120;

#5 select the name and price in cents (i.e the price must be multiplied by 100)
select Name,Price, Price*100 as New_Price from product;

#6 Compute the average price of all the products
select Price,avg(Price) from product;

#7 Compute the average price of all products with manufacturer code equal to 2
select avg(price) from product where manufacturer=2;

#8 Compute the number of products with a price larger than or equal to $180
select *from product where Price >=180;

#9 Select the name and price of all products with a price larger than or 
#equal to $180, and sort first by price (in descending order), and then by 
#name (in ascending order)
select Name, Price from product where Price >= 180 order by Price desc, Name asc;

#10 select all the data from the products, including all the data for each products manufacturer
select * from product join Manufacturers on Manufacturers.Code = product.Manufacturer;

#11 select the product name,price and manufacturer name of all the products
select Product.Name,Product.Price , Manufacturers.Name from product join Manufacturers on product.Manufacturer=Manufacturers.Code;

#12 select the average price of each manufacturers product, showing the manufacturers code
select code, avg(Price) from product group by Manufacturer;

#13 select the average price of each manufacturer's products, showing the manufacturer's name.
select Manufacturers.Name as Manu_Name, avg(product.Price) as Avg_Price from product
join Manufacturers on product.Manufacturer=Manufacturers.Code group by Manu_Name order by Avg_Price desc;

#14 select the names of manufacturer whose products have an average price larger than or equal to $150
select Manufacturers.Name as Manu_Name, avg(product.Price) as Avg_Price from product
join Manufacturers on product.Manufacturer = Manufacturers.Code
group by Manu_Name having avg(product.Price)>= 150;

#15 Select the name and price of the cheapest product
#method1
select Name, Price from Product where price = (select min(Price ) from product); 
#method2
select Name,Price from product order by price asc limit 1;

#16 select the name of each manufacturer along with the name and price of its most expensive product
 select Manufacturers.Name , product.Price , MAX(Price) from product join Manufacturers on 
 product.Manufacturer=Manufacturers.code group by Manufacturer;

#17 add a new product: Loudspeaker , 70$ , manufacturer 2
insert into product(Code,Name,Price,Manufacturer)
values(11,"Loudspeaker",70,2);
select * from product;

#18 update the name of product 8 to "Laser Printer"
update product set Name="laser printer" where Code=8;
select * from product;

#19 apply a 10% discount to all products
select Code,Name,Manufacturer,Price, Price*10/100 as Discount, price*90/100 as Sell_Price from product;

update product set Price=Price*0.9;
select * from product;

#20 apply a 10% discount to all products with a price larger than or equal to $120
select * , Price*10/100 as Discount, Price-Price*10/100 as Sell_Price from product where 
price >=120;