use demo;

-- step 3, create unique index on productcode;
create unique index pro_index on products(productcode);
create index com_index on products(productname, productprice);

explain select * from products where productcode = 'i003';

-- step 4: create view;
create view products_view as
select productcode, productname, productprice, productstatus
from products; 

select * from products_view;

insert into products_view values
('i008', 'iphone 8', 950, 1);
select * from products_view;

drop view products_view;

-- step 5;
delimiter //
create procedure products_sp ()
begin 
select * from products;
end //
delimiter ;
 call products_sp();

drop procedure products_sp;

delimiter //
create procedure products_sp (id int, 
productcode varchar(5), 
productname varchar (50), 
productprice double, 
productamount int, 
productdecription varchar(50),
productstatus int )
begin 
insert into products
values (id, 
productcode,
productname, 
productprice, 
productamount, 
productdecription, 
productstatus);
select * from products;
end //
delimiter ;


 call products_sp(12, 'i0012', 'iphone 12', 1200, 5,'ready', 1);
 
 -- sua sp theo id;
 drop procedure products_sp;
 
 delimiter //
create procedure products_sp (upproductname varchar(50), uid int)
begin 
update products
set productname = upproductname where id = uid;
select * from products;
end //
delimiter ;

 call products_sp('iphone 15',2);
 
 -- xoa sp theo id;
 drop procedure products_sp;
 
  delimiter //
create procedure products_sp (in id1 int)
begin 
delete from products where id = id1;
select * from products;
end //
delimiter ;

 call products_sp(10);
 
 
 