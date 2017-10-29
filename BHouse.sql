create database BHouseDB;

use BHouseDB;

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
	customerID int not null,
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
	extraID int not null,
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
VALUES (0, 'admin', 'admin');
INSERT INTO LoginTBL
VALUES (1, 'tungtt', 'tungtt');
INSERT INTO LoginTBL
VALUES (2, 'thoanvv', 'thoanvv');
INSERT INTO LoginTBL
VALUES (3, 'anhch', 'anhch');

INSERT INTO RoomTypeTBL
Values (1, 1, 1, 'Full option and closed', 1400000);
INSERT INTO RoomTypeTBL
Values (2, 1, 0, 'Full option but not closed', 1300000);
INSERT INTO RoomTypeTBL
Values (3, 0, 1, 'Closed but not full option', 1300000);
INSERT INTO RoomTypeTBL
Values (4, 0, 0, 'neither closed nor full option', 1100000);

INSERT INTO RoomInfoTBL
Values (1, 1, 0, 2);
INSERT INTO RoomInfoTBL
Values (2, 2, 1, 0);
INSERT INTO RoomInfoTBL
Values (3, 3, 1, 0);
INSERT INTO RoomInfoTBL
Values (4, 4, 0, 1);

INSERT INTO CustomerTBL
Values (1, 1, 'Thoan Hamlowjnn', '111111111111', '0912345678', '0912345679', '09/18/2017');
INSERT INTO CustomerTBL
Values (2, 1, 'Tsu Haml', '222222222222', '0987654321', '0987654320', '02/26/2017');
INSERT INTO CustomerTBL
Values (3, 4, 'TungDz', '333333333333', '0123456789', '0123456780', '07/02/2017');