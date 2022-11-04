create database quanlybanhang;
use quanlybanhang;
create table customer(
cid nvarchar(4) primary key,
cname nvarchar(50) not null,
cage int not null
);

create table Orders(
oid int primary key auto_increment,
cid nvarchar(4) not null,
oDate date not null,
oTotalPrice double not null,
foreign key (cid) references customer(cid)
);

create table Product(
pid nvarchar(4) primary key,
pname nvarchar(50) not null,
pprice float not null
);

create table OrdersDetail(
pid nvarchar(4),
oid int,
odQty int,
foreign key (oid) references orders(oid),
foreign key (pid) references product(pid),
primary key (oid,pid)
);

insert into customer values ('1','Minh Quan',10),
('2','Ngoc Oanh',20),('3','Hong Ha',50);

insert into orders(cid,odate) 
values('1','2006-03-21'),('2','2006-03-23'),('1','2006-03-16');

insert into product 
values('1','MayGiat',3),
('2','TuLanh',5),
('3','DieuHoa',7),
('4','Quat',1),
('5','BepDien',2);

insert into ordersdetail
values('1',1,3),
('3',1,7),
('4',1,2),
('1',2,1),
('1',3,8),
('5',2,4),
('3',2,3);

-- 1
select c.cid,c.cname,c.cage,p.pname
from customer c join orders o on c.cid = o.cid join ordersdetail od on od.oid = o.oid join product p on p.pid = od.pid;
-- 2
select * from customer where cid
in(select c.cid
from customer c join orders o on c.cid = o.cid);
-- 3
select o.oid, o.odate, (od.odqty*p.pprice)as'Gia ban'
from orders o join ordersdetail od on o.oid = od.oid join product p on p.pid = od.pid;



select * from customer;
select * from orders;
select * from product;
select * from ordersdetail;


