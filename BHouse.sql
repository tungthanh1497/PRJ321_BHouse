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



INSERT INTO RoomTypeTBL
Values (1, 1, 1, 1400000, 'Full option and closed');
INSERT INTO RoomTypeTBL
Values (2, 1, 0, 1300000, 'Full option but not closed');
INSERT INTO RoomTypeTBL
Values (3, 0, 1, 1300000, 'Closed but not full option');
INSERT INTO RoomTypeTBL
Values (4, 0, 0, 1100000, 'neither closed nor full option');

INSERT INTO RoomInfoTBL
Values (1, 2, 1, 1);
INSERT INTO RoomInfoTBL
Values (2, 2, 2, 1);
INSERT INTO RoomInfoTBL
Values (3, 4, 1, 1);
INSERT INTO RoomInfoTBL
Values (4, 2, 1, 1);
INSERT INTO RoomInfoTBL
Values (5, 2, 2, 1);
INSERT INTO RoomInfoTBL
Values (6, 2, 2, 1);
INSERT INTO RoomInfoTBL
Values (7, 1, 3, 0);
INSERT INTO RoomInfoTBL
Values (8, 1, 1, 1);
INSERT INTO RoomInfoTBL
Values (9, 1, 1, 1);
INSERT INTO RoomInfoTBL
Values (10, 1, 3, 0);
INSERT INTO RoomInfoTBL
Values (11, 1, 2, 1);
INSERT INTO RoomInfoTBL
Values (12, 1, 1, 1);
INSERT INTO RoomInfoTBL
Values (13, 1, 2, 1);
INSERT INTO RoomInfoTBL
Values (14, 1, 1, 1);
INSERT INTO RoomInfoTBL
Values (15, 1, 1, 1);
INSERT INTO RoomInfoTBL
Values (16, 1, 1, 1);
INSERT INTO RoomInfoTBL
Values (17, 1, 1, 1);
INSERT INTO RoomInfoTBL
Values (18, 1, 2, 1);
INSERT INTO RoomInfoTBL
Values (19, 3, 3, 0);
INSERT INTO RoomInfoTBL
Values (20, 3, 3, 0);
INSERT INTO RoomInfoTBL
Values (21, 3, 3, 0);
INSERT INTO RoomInfoTBL
Values (22, 4, 1, 1);
INSERT INTO RoomInfoTBL
Values (23, 2, 3, 0);
INSERT INTO RoomInfoTBL
Values (24, 1, 3, 1);
INSERT INTO RoomInfoTBL
Values (25, 1, 1, 1);



INSERT INTO LoginTBL
VALUES ('admin', 'admin');
INSERT INTO LoginTBL
VALUES ('hoangdl', 'hoangdl');
INSERT INTO LoginTBL
VALUES ('thainv', 'thainv');
INSERT INTO LoginTBL
VALUES ('hiepth', 'hiepth');
INSERT INTO LoginTBL
VALUES ('nguyenvd', 'nguyenvd');
INSERT INTO LoginTBL
VALUES ('longth', 'longth')
INSERT INTO LoginTBL
VALUES ('thaihv', 'thaihv')
INSERT INTO LoginTBL
VALUES ('congnv', 'congnv')
INSERT INTO LoginTBL
VALUES ('hunghv', 'hunghv')
INSERT INTO LoginTBL
VALUES ('khanhn', 'khanhn')
INSERT INTO LoginTBL
VALUES ('phuongdt', 'phuongdt')
INSERT INTO LoginTBL
VALUES ('trangd', 'trangd')
INSERT INTO LoginTBL
VALUES ('thuyv', 'thuyv')
INSERT INTO LoginTBL
VALUES ('maint', 'maint')
INSERT INTO LoginTBL
VALUES ('quynhnv', 'quynhnv')
INSERT INTO LoginTBL
VALUES ('ducpv', 'dupv')
INSERT INTO LoginTBL
VALUES ('tiennm', 'tiennm')
INSERT INTO LoginTBL
VALUES ('anhdd', 'anhdd')
INSERT INTO LoginTBL
VALUES ('duongdx', 'duongdx')
INSERT INTO LoginTBL
VALUES ('thaont', 'thaont')
INSERT INTO LoginTBL
VALUES ('thomdt', 'thomdt')
INSERT INTO LoginTBL
VALUES ('quangnb', 'quangnb')
INSERT INTO LoginTBL
VALUES ('thanglt', 'thanglt')
INSERT INTO LoginTBL
VALUES ('sanglq', 'sanglq')
INSERT INTO LoginTBL
VALUES ('ducd', 'ducd')
INSERT INTO LoginTBL
VALUES ('tientm', 'tientm')
INSERT INTO LoginTBL
VALUES ('hinhx', 'hinhx')
INSERT INTO LoginTBL
VALUES ('binhpd', 'binhpd')
INSERT INTO LoginTBL
VALUES ('hanht', 'hanht')
INSERT INTO LoginTBL
VALUES ('taitd', 'taitd')
INSERT INTO LoginTBL
VALUES ('thuongv', 'thuongv')
INSERT INTO LoginTBL
VALUES ('datnt', 'datnt')
INSERT INTO LoginTBL
VALUES ('anhnd', 'anhnd')
INSERT INTO LoginTBL
VALUES ('tungdk', 'tungdk')
INSERT INTO LoginTBL
VALUES ('tuannd', 'tuannd')
INSERT INTO LoginTBL
VALUES ('hailx', 'hailx')
INSERT INTO LoginTBL
VALUES ('hieud', 'hieud')
INSERT INTO LoginTBL
VALUES ('huyt', 'huyt')
INSERT INTO LoginTBL
VALUES ('thanhv', 'thanhv')
INSERT INTO LoginTBL
VALUES ('huandb', 'huandb')
INSERT INTO LoginTBL
VALUES ('hopnq', 'hopnq')
INSERT INTO LoginTBL
VALUES ('trungnh', 'trungnh')
INSERT INTO LoginTBL
VALUES ('hanhnd', 'hanhnd')
INSERT INTO LoginTBL
VALUES ('thil', 'thil')
INSERT INTO LoginTBL
VALUES ('phuclv', 'phuclv')
INSERT INTO LoginTBL
VALUES ('hienth', 'hienth')

INSERT INTO CustomerTBL
Values (1, 1, 'Dinh Le Hoang', '111111111111', '0912345678', '0912345679', '05/01/2017');
INSERT INTO CustomerTBL
Values (2, 2, 'Nguyen Van Thai', '222222222222', '0987654321', '0987654320', '03/01/2017');
INSERT INTO CustomerTBL
Values (3, 2, 'Tran Huu Hiep', '333333333333', '0123456789', '0123456780', '08/01/2017');
INSERT INTO CustomerTBL
Values (4, 3, 'Vuong Dinh Nguyen', '333333333333', '0123456789', '0123456780', '03/01/2017');
INSERT INTO CustomerTBL
Values (5, 4, 'Tran Hoang Long', '333333333333', '0123456789', '0123456780', '08/01/2017');
INSERT INTO CustomerTBL
Values (6, 5, 'Ha Van Thai', '333333333333', '0123456789', '0123456780', '08/01/2017');
INSERT INTO CustomerTBL
Values (7, 5, 'Nguyen Thanh Cong', '333333333333', '0123456789', '0123456780', '08/01/2017');
INSERT INTO CustomerTBL
Values (8, 6, 'Hoang Van Hung', '333333333333', '0123456789', '0123456780', '08/01/2017');
INSERT INTO CustomerTBL
Values (9, 6, 'Nam Khanh', '333333333333', '0123456789', '0123456780', '08/01/2017');
INSERT INTO CustomerTBL
Values (10, 7, 'Dao Thi Phuong', '333333333333', '0123456789', '0123456780', '07/01/2017');
INSERT INTO CustomerTBL
Values (11, 7, 'Dinh Trang', '333333333333', '0123456789', '0123456780', '07/01/2017');
INSERT INTO CustomerTBL
Values (12, 7, 'Vu Thuy', '333333333333', '0123456789', '0123456780', '08/01/2017');
INSERT INTO CustomerTBL
Values (13, 8, 'Nguyen Thi Mai', '333333333333', '0123456789', '0123456780', '03/01/2017');
INSERT INTO CustomerTBL
Values (14, 9, 'Nguyen Van Quynh', '333333333333', '0123456789', '0123456780', '10/01/2017');
INSERT INTO CustomerTBL
Values (15, 10, 'Phan Van Duc', '333333333333', '0123456789', '0123456780', '03/01/2017');
INSERT INTO CustomerTBL
Values (16, 10, 'Nguyen Manh Tien', '333333333333', '0123456789', '0123456780', '03/01/2017');
INSERT INTO CustomerTBL
Values (17, 10, 'Dao Duy Anh', '333333333333', '0123456789', '0123456780', '08/01/2017');
INSERT INTO CustomerTBL
Values (18, 11, 'Do Xuan Duong', '333333333333', '0123456789', '0123456780', '08/01/2017');
INSERT INTO CustomerTBL
Values (19, 11, 'Nguyen Thi Thao', '333333333333', '0123456789', '0123456780', '08/01/2017');
INSERT INTO CustomerTBL
Values (20, 12, 'Dinh Thi Thom', '333333333333', '0123456789', '0123456780', '05/01/2017');
INSERT INTO CustomerTBL
Values (21, 13, 'Nguyen Ba Quang', '333333333333', '0123456789', '0123456780', '05/01/2017');
INSERT INTO CustomerTBL
Values (22, 13, 'Nguyen Trong Thang', '333333333333', '0123456789', '0123456780', '05/01/2017');
INSERT INTO CustomerTBL
Values (23, 14, 'Le Quang Sang', '333333333333', '0123456789', '0123456780', '03/01/2017');
INSERT INTO CustomerTBL
Values (24, 15, 'Do Duc', '333333333333', '0123456789', '0123456780', '03/01/2017');
INSERT INTO CustomerTBL
Values (25, 16, 'Tran Manh Tien', '333333333333', '0123456789', '0123456780', '03/01/2017');
INSERT INTO CustomerTBL
Values (26, 17, 'Xuan Hinh', '333333333333', '0123456789', '0123456780', '08/01/2017');
INSERT INTO CustomerTBL
Values (27, 18, 'Pham Duy Binh', '333333333333', '0123456789', '0123456780', '08/01/2017');
INSERT INTO CustomerTBL
Values (28, 18, 'Tran Hanh', '333333333333', '0123456789', '0123456780', '08/01/2017');
INSERT INTO CustomerTBL
Values (29, 19, 'Tran Danh Tai', '333333333333', '0123456789', '0123456780', '03/01/2017');
INSERT INTO CustomerTBL
Values (30, 19, 'Vu Thuong', '333333333333', '0123456789', '0123456780', '05/01/2017');
INSERT INTO CustomerTBL
Values (31, 19, 'Nguyen Tien Dat', '333333333333', '0123456789', '0123456780', '03/01/2017');
INSERT INTO CustomerTBL
Values (32, 20, 'Nguyen Duc Anh', '333333333333', '0123456789', '0123456780', '08/01/2017');
INSERT INTO CustomerTBL
Values (33, 20, 'Dao Khanh Tung', '333333333333', '0123456789', '0123456780', '08/01/2017');
INSERT INTO CustomerTBL
Values (34, 20, 'Nguyen Dung Tuan', '333333333333', '0123456789', '0123456780', '08/01/2017');
INSERT INTO CustomerTBL
Values (35, 21, 'Le Xuan Hai', '333333333333', '0123456789', '0123456780', '09/01/2017');
INSERT INTO CustomerTBL
Values (36, 21, 'Doan Hieu', '333333333333', '0123456789', '0123456780', '09/01/2017');
INSERT INTO CustomerTBL
Values (37, 21, 'Trung Huy', '333333333333', '0123456789', '0123456780', '08/01/2017');
INSERT INTO CustomerTBL
Values (38, 22, 'Vu Thanh', '333333333333', '0123456789', '0123456780', '05/01/2017');
INSERT INTO CustomerTBL
Values (39, 23, 'Do Bao Huan', '333333333333', '0123456789', '0123456780', '05/01/2017');
INSERT INTO CustomerTBL
Values (40, 23, 'Ninh Quang Hop', '333333333333', '0123456789', '0123456780', '05/01/2017');
INSERT INTO CustomerTBL
Values (41, 23, 'Nguyen Hoang Trung', '333333333333', '0123456789', '0123456780', '05/01/2017');
INSERT INTO CustomerTBL
Values (42, 24, 'Nghiem Duc Hanh', '333333333333', '0123456789', '0123456780', '07/01/2017');
INSERT INTO CustomerTBL
Values (43, 24, 'Le Thi', '333333333333', '0123456789', '0123456780', '07/01/2017');
INSERT INTO CustomerTBL
Values (44, 24, 'Le Van Phuc', '333333333333', '0123456789', '0123456780', '07/01/2017');
INSERT INTO CustomerTBL
Values (45, 25, 'Tran Thanh Hien', '333333333333', '0123456789', '0123456780', '11/01/2017');

INSERT INTO BillTBL
Values (1, 100000, 110000, 0, '05/01/2017');
INSERT INTO BillTBL
Values (1, 100000, 120000, 0, '06/01/2017');
INSERT INTO BillTBL
Values (1, 100000, 113000, 0, '07/01/2017');
INSERT INTO BillTBL
Values (1, 100000, 92000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (1, 100000, 115000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (1, 100000, 103000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (1, 100000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (2, 100000, 130000, 0, '03/01/2017');
INSERT INTO BillTBL
Values (2, 100000, 120000, 0, '04/01/2017');
INSERT INTO BillTBL
Values (2, 100000, 100000, 0, '05/01/2017');
INSERT INTO BillTBL
Values (2, 100000, 105000, 0, '06/01/2017');
INSERT INTO BillTBL
Values (2, 100000, 108000, 0, '07/01/2017');
INSERT INTO BillTBL
Values (2, 200000, 220000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (2, 200000, 215000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (2, 200000, 202000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (2, 200000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (3, 100000, 60000, 0, '03/01/2017');
INSERT INTO BillTBL
Values (3, 100000, 70000, 0, '04/01/2017');
INSERT INTO BillTBL
Values (3, 100000, 54000, 0, '05/01/2017');
INSERT INTO BillTBL
Values (3, 100000, 65000, 0, '06/01/2017');
INSERT INTO BillTBL
Values (3, 100000, 68000, 0, '07/01/2017');
INSERT INTO BillTBL
Values (3, 100000, 77000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (3, 100000, 80000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (3, 100000, 67000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (3, 100000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (4, 100000, 79000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (4, 100000, 97000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (4, 100000, 59000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (4, 100000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (5, 200000, 150000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (5, 200000, 133000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (5, 200000, 110000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (5, 200000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (6, 200000, 140000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (6, 200000, 131000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (6, 200000, 108000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (6, 200000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (7, 200000, 140000, 0, '07/01/2017');
INSERT INTO BillTBL
Values (7, 300000, 2030000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (7, 300000, 205000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (7, 300000, 221000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (7, 300000, 0, 0, '11/01/2017');


INSERT INTO BillTBL
Values (8, 100000, 60000, 0, '03/01/2017');
INSERT INTO BillTBL
Values (8, 100000, 70000, 0, '04/01/2017');
INSERT INTO BillTBL
Values (8, 100000, 54000, 0, '05/01/2017');
INSERT INTO BillTBL
Values (8, 100000, 65000, 0, '06/01/2017');
INSERT INTO BillTBL
Values (8, 100000, 68000, 0, '07/01/2017');
INSERT INTO BillTBL
Values (8, 100000, 77000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (8, 100000, 80000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (8, 100000, 67000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (8, 100000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (9, 100000, 77000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (9, 100000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (10, 200000, 160000, 0, '03/01/2017');
INSERT INTO BillTBL
Values (10, 200000, 170000, 0, '04/01/2017');
INSERT INTO BillTBL
Values (10, 200000, 154000, 0, '05/01/2017');
INSERT INTO BillTBL
Values (10, 200000, 165000, 0, '06/01/2017');
INSERT INTO BillTBL
Values (10, 200000, 168000, 0, '07/01/2017');
INSERT INTO BillTBL
Values (10, 300000, 277000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (10, 300000, 180000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (10, 300000, 167000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (10, 300000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (11, 200000, 179000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (11, 200000, 197000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (11, 200000, 159000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (11, 200000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (12, 100000, 110000, 0, '05/01/2017');
INSERT INTO BillTBL
Values (12, 100000, 120000, 0, '06/01/2017');
INSERT INTO BillTBL
Values (12, 100000, 113000, 0, '07/01/2017');
INSERT INTO BillTBL
Values (12, 100000, 92000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (12, 100000, 115000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (12, 100000, 103000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (12, 100000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (13, 200000, 210000, 0, '05/01/2017');
INSERT INTO BillTBL
Values (13, 200000, 220000, 0, '06/01/2017');
INSERT INTO BillTBL
Values (13, 200000, 213000, 0, '07/01/2017');
INSERT INTO BillTBL
Values (13, 200000, 292000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (13, 200000, 215000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (13, 200000, 203000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (13, 200000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (14, 100000, 60000, 0, '03/01/2017');
INSERT INTO BillTBL
Values (14, 100000, 70000, 0, '04/01/2017');
INSERT INTO BillTBL
Values (14, 100000, 54000, 0, '05/01/2017');
INSERT INTO BillTBL
Values (14, 100000, 65000, 0, '06/01/2017');
INSERT INTO BillTBL
Values (14, 100000, 68000, 0, '07/01/2017');
INSERT INTO BillTBL
Values (14, 100000, 77000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (14, 100000, 80000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (14, 100000, 67000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (14, 100000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (15, 100000, 60000, 0, '03/01/2017');
INSERT INTO BillTBL
Values (15, 100000, 70000, 0, '04/01/2017');
INSERT INTO BillTBL
Values (15, 100000, 54000, 0, '05/01/2017');
INSERT INTO BillTBL
Values (15, 100000, 65000, 0, '06/01/2017');
INSERT INTO BillTBL
Values (15, 100000, 68000, 0, '07/01/2017');
INSERT INTO BillTBL
Values (15, 100000, 77000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (15, 100000, 80000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (15, 100000, 67000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (15, 100000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (16, 100000, 64000, 0, '03/01/2017');
INSERT INTO BillTBL
Values (16, 100000, 73000, 0, '04/01/2017');
INSERT INTO BillTBL
Values (16, 100000, 56000, 0, '05/01/2017');
INSERT INTO BillTBL
Values (16, 100000, 62000, 0, '06/01/2017');
INSERT INTO BillTBL
Values (16, 100000, 68000, 0, '07/01/2017');
INSERT INTO BillTBL
Values (16, 100000, 76000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (16, 100000, 81000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (16, 100000, 77000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (16, 100000, 0, 0, '11/01/2017');


INSERT INTO BillTBL
Values (17, 100000, 79000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (17, 100000, 67000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (17, 100000, 59000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (17, 100000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (18, 200000, 179000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (18, 200000, 197000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (18, 200000, 159000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (18, 200000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (19, 200000, 160000, 0, '03/01/2017');
INSERT INTO BillTBL
Values (19, 200000, 170000, 0, '04/01/2017');
INSERT INTO BillTBL
Values (19, 300000, 254000, 0, '05/01/2017');
INSERT INTO BillTBL
Values (19, 300000, 265000, 0, '06/01/2017');
INSERT INTO BillTBL
Values (19, 300000, 268000, 0, '07/01/2017');
INSERT INTO BillTBL
Values (19, 300000, 277000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (19, 300000, 280000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (19, 300000, 267000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (19, 300000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (20, 300000, 179000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (20, 300000, 267000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (20, 300000, 259000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (20, 300000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (21, 100000, 79000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (21, 300000, 167000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (21, 300000, 159000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (21, 300000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (22, 100000, 56000, 0, '05/01/2017');
INSERT INTO BillTBL
Values (22, 100000, 62000, 0, '06/01/2017');
INSERT INTO BillTBL
Values (22, 100000, 68000, 0, '07/01/2017');
INSERT INTO BillTBL
Values (22, 100000, 76000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (22, 100000, 81000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (22, 100000, 77000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (22, 100000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (23, 300000, 256000, 0, '05/01/2017');
INSERT INTO BillTBL
Values (23, 300000, 262000, 0, '06/01/2017');
INSERT INTO BillTBL
Values (23, 300000, 268000, 0, '07/01/2017');
INSERT INTO BillTBL
Values (23, 300000, 276000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (23, 300000, 181000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (23, 300000, 177000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (23, 300000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (24, 300000, 168000, 0, '07/01/2017');
INSERT INTO BillTBL
Values (24, 300000, 176000, 0, '08/01/2017');
INSERT INTO BillTBL
Values (24, 300000, 181000, 0, '09/01/2017');
INSERT INTO BillTBL
Values (24, 300000, 177000, 0, '10/01/2017');
INSERT INTO BillTBL
Values (24, 300000, 0, 0, '11/01/2017');

INSERT INTO BillTBL
Values (25, 100000, 0, 0, '11/01/2017');


create table Notification(
 NotificationID int not null identity(1,1),
 Title varchar(200) not null,
 Detail varchar (1000),
 DateCreated date not null,
 primary key(NotificationID),
);