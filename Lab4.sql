create table supplier(
sno int(1),
sname varchar(20),
city varchar(20)
);

create table part(
pno int(1),
pname varchar(20),
price int(3)
);

create table sells(
sno int(1),
pno int(1)
)


insert into supplier(sno,sname,city) values
('1','Smith','London'),
('2','Jones','Paris'),
('3','Adams','Vienna'),
('4','Blake','Rome')

insert into part(pno,pname,price) values
('1','Screw','10'),
('2','Nut','8'),
('3','Bolt','15'),
('4','Cam','25')

insert into sells(sno,pno) values
(1,1),
(1,2),
(2,4),
(3,1),
(3,3),
(4,2),
(4,3),
(4,4)

select * 
from part 
where price >10

select pname,price
from part 
where price>10

select pname,price
from part 
where pname = "Bolt" AND (price = 0 OR price<=15)

select pname, 2*price as 'Double Price'
from part
where 2*price<50

select s.sname,p.pname,p.price
from supplier s, part p, sells se
where se.sno = s.sno AND se.pno = p.pno

select count(pno) from part

select s.sname, s.sno, count(se.pno)
from supplier s, sells se
where s.sno = se.sno 
group by s.sname,s.sno

select s.sno,s.sname, count(se.pno)
from supplier s, sells se
where s.sno = se.sno
group by s.sno,s.sname 
having count(se.pno) >1

select pno, pname,price
from part 
where price > (select price from part where pname = "Screw")

select *
from supplier s
where not exists (select * from sells se where se.sno = s.sno)

(select * from supplier where sname = "Jones")
union
(select * from supplier where sname = "Adams")

select * from supplier where sno>1 and not sno>3

create view LondonSuppliers
as select s.sname,p.pname
from supplier s, part p, sells se
where s.sno = se.sno and p.pno = se.pno and s.city = "London"

select * from LondonSuppliers where pname = "Screw"

