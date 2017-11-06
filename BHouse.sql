create database BHouseDB
use BHouseDB

create table RoomTypeTBL(
	roomTypeID int not null,
	optional bit not null,
	closed bit not null,
	price int not null,
	note varchar(200),
	primary key (roomTypeID)
);

create table RoomInfoTBL(
	roomNumber int not null,
	roomTypeID int not null,
	numPerson int not null,
	available bit not null,
	primary key (roomNumber),
	foreign key (roomTypeID) references RoomTypeTBL (roomTypeID)
);

create table LoginTBL(
	customerID int not null identity(0,1),
	uname varchar(20) not null unique,
	psw varchar(200) not null,
	primary key (customerID)
);

create table CustomerTBL(
	customerID int not null,
	roomNumber int not null,
	customerName nvarchar(200) not null,
	identityCard varchar(12) not null,
	phoneNumber varchar(13) not null,
	parentsPhoneNumber varchar(13),
	dateJoin date not null,
	primary key (customerID),
	foreign key (customerID) references LoginTBL(customerID),
	foreign key (roomNumber) references RoomInfoTBL(roomNumber)
);

create table BillTBL(
	roomNumber int not null,
	defaultFee int not null,
	electricity int,
	extraFee int,
	monthBill date not null,
	primary key (roomNumber, monthBill),
	foreign key (roomNumber) references RoomInfoTBL(roomNumber)
);

create table ExtraTBL(
	extraID int not null identity(1,1),
	roomNumber int not null,
	extraName nvarchar(200) not null,
	extraNumber int not null,
	price int not null,
	detail nvarchar(200),
	extraDate date not null,
	primary key(extraID),
	foreign key (roomNumber) references RoomInfoTBL(roomNumber)
);



INSERT INTO LoginTBL
VALUES ('admin', 'admin');
INSERT INTO LoginTBL
VALUES ('tungtt', 'tungtt');
INSERT INTO LoginTBL
VALUES ('thoanvv', 'thoanvv');
INSERT INTO LoginTBL
VALUES ('anhch', 'anhch');

INSERT INTO RoomTypeTBL
Values (1, 1, 1, 1400000, 'Full option and closed');
INSERT INTO RoomTypeTBL
Values (2, 1, 0, 1300000, 'Full option but not closed');
INSERT INTO RoomTypeTBL
Values (3, 0, 1, 1300000, 'Closed but not full option');
INSERT INTO RoomTypeTBL
Values (4, 0, 0, 1100000, 'neither closed nor full option');

INSERT INTO RoomInfoTBL
Values (1, 1, 2, 0);
INSERT INTO RoomInfoTBL
Values (2, 2, 0, 1);
INSERT INTO RoomInfoTBL
Values (3, 3, 0, 1);
INSERT INTO RoomInfoTBL
Values (4, 4, 1, 0);

INSERT INTO CustomerTBL
Values (2, 1, 'Vu Vi Thoan', '111111111111', '0912345678', '0912345679', '09/01/2017');
INSERT INTO CustomerTBL
Values (3, 1, 'Chu Hoang Anh', '222222222222', '0987654321', '0987654320', '06/01/2017');
INSERT INTO CustomerTBL
Values (1, 4, 'Trinh Thanh Tung', '333333333333', '0123456789', '0123456780', '07/01/2017');

INSERT INTO BillTBL
Values (1, 200000, 0, 0, '06/01/2017');
INSERT INTO BillTBL
Values (1, 200000, 0, 0, '07/01/2017');
INSERT INTO BillTBL
Values (1, 200000, 0, 0, '08/01/2017');
INSERT INTO BillTBL
Values (1, 200000, 0, 0, '09/01/2017');
INSERT INTO BillTBL
Values (1, 200000, 0, 0, '10/01/2017');
INSERT INTO BillTBL
Values (1, 200000, 0, 0, '11/01/2017');
INSERT INTO BillTBL
Values (4, 200000, 0, 0, '11/01/2017');

Insert into ExtraTBL
values (1, 'bong den', 3, 6000, 'no bong', '07/15/2017');
Insert into ExtraTBL
values (4, 'ban dai', 2, 700000, 'gay ban', '08/19/2017');
Insert into ExtraTBL
values (1, 'binh nong lanh', 1, 2300000, 'chap binh nong lanh', '10/04/2017');
Insert into ExtraTBL
values (1, 'air blade', 6, 8000000, 'hacker', '10/14/2017');

create table Notification(
 NotificationID int not null identity(1,1),
 Title varchar(200) not null,
 Detail varchar (1000),
 DateCreated date not null,
 primary key(NotificationID),
);


===================================================================================


roomNumber int not null,
	extraName nvarchar(200) not null,
	extraNumber int not null,
	price int not null,
	detail nvarchar(200),
	extraDa

select * from CustomerTBL cus join RoomInfoTBL roomInfo on cus.roomNumber=roomInfo.roomNumber
where cus.customerID = 3

select * from RoomTypeTBL type join RoomInfoTBL info on type.roomTypeID=info.roomTypeID
where info.roomNumber = 1



INSERT INTO ExtraTBL
VALUES (1, 'Bong den', 4, 20000, 'anh sua den may man', '10/16/2017');

roomNumber int not null,
	defaultFee int not null,
	electricity int,
	extraFee int,
	monthBill date not null,

INSERT into BillTBL
Values(1,200000,150000,0,'11/01/2017');

select price 
from ExtraTBL 
where roomNumber=1 
and extraDate>='06/01/2017' and  extraDate<'07/01/2017'
and (select extraDate from ExtraTBL where roomNumber=1) > (select dateJoin from CustomerTBL where roomNumber=1)



SELECT ((Select price 
		from RoomTypeTBL 
		where roomTypeID=(select roomTypeID 
							from RoomInfoTBL 
							where roomNumber=1)
		)+extraFee+defaultFee+electricity)as showup
FROM BillTBL
where roomNumber=1 and monthBill='11/01/2017'

UPDATE BillTBL
SET extraFee = (SELECT SUM(price*extraNumber) as result
FROM ExtraTBL
where roomNumber=1 and extraDate>='10/01/2017' and extraDate<'11/01/2017')
where roomNumber=1 and monthBill='10/01/2017'

select COUNT(*) from BillTBL
where roomNumber=1 and monthBill='10/01/2017'
