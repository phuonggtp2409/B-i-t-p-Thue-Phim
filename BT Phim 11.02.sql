create database thuePhim;
use thuePhim;
create table User (
ID_User int,
hoTen varchar(255),
SDT varchar(255),
gioiTinh varchar(255),
primary key (ID_User));

Insert into User (ID_User, hoTen, SDT, gioiTinh)
values (1, 'Giáp Phượng', '123456', 'Nữ'), (2, 'Giáp Mai', '112233', 'Nữ'), (3, 'Nguyễn Lan', '113344', 'Nam'),
(4, 'Nguyễn Minh', '223344', 'Nam');
SELECT * FROM User;

create table Phim (
ID_Phim varchar(255),
tenPhim varchar(255),
ID_theLoaiPhim varchar(255),
ID_DanhMuc varchar(255),
ngaySanXuan datetime,
giaPhim int,
primary key (ID_Phim), 
FOREIGN KEY (ID_DanhMuc) REFERENCES danhMucPhim(ID_DanhMuc),
FOREIGN KEY (ID_theLoaiPhim) REFERENCES theLoaiPhim(ID_theLoaiPhim));

INSERT INTO Phim (ID_Phim, tenPhim, ID_theLoaiPhim, ID_DanhMuc, ngaySanXuan, giaPhim)
VALUES ('P1', 'Nhà bà nữ', 'TC', 'DM4', '2023-01-01', 150000),
('P2', 'Để mai tính', 'HAI', 'DM1', '2020-02-01', 110000),
('P3', 'Để mai tính 2', 'HAI', 'DM3','2021-02-15', 140000),
('P4', 'Mối tình đầu của tôi', 'TC', 'DM3','2022-06-15', 160000);
SELECT * FROM Phim;


create table danhMucPhim (
ID_DanhMuc varchar(255),
tenDanhMuc varchar(255),
primary key (ID_DanhMuc));

INSERT INTO danhMucPhim (ID_DanhMuc, tenDanhMuc)
VALUES ('DM1', 'Phim hot năm 2020'), ('DM2', 'Phim hot năm 2021'), ('DM3', 'Phim hay nhất năm 2022'),
('DM4', 'Phim được yêu thích nhất năm 2022');
SELECT * FROM danhMucPhim;

create table thuePhim (
ID_ThuePhim varchar(255),
ID_User int,
ID_Phim varchar(255),
thoiGianBatDau datetime,
thoiGianTra datetime,
tongTien int,
primary key (ID_ThuePhim), foreign key (ID_User) REFERENCES User(ID_User), 
foreign key (ID_Phim) REFERENCES Phim(ID_Phim));

INSERT INTO thuePhim (ID_ThuePhim, ID_User,ID_Phim, thoiGianBatDau, thoiGianTra, tongTien)
VALUES ('TP1', 1 ,'P1','2023-01-15','2023-01-20', 150000), 
('TP2', 1 ,'P2','2023-02-05','2023-02-08', 110000),
('TP3', 1 ,'P3','2023-01-15','2023-01-20', 140000), 
('TP4', 2 ,'P1','2023-02-05','2023-02-08', 150000),
('TP5', 2 ,'P1','2023-01-15','2023-01-20', 150000), 
('TP6', 3 ,'P2','2023-02-05','2023-02-08', 110000),
('TP7', 3 ,'P3','2023-01-15','2023-01-20', 140000);
SELECT * FROM thuePhim;

create table theLoaiPhim (
ID_theLoaiPhim varchar(255),
tenTheLoaiPhim varchar(255),
primary key (ID_theLoaiPhim));

INSERT INTO theLoaiPhim (ID_theLoaiPhim, tenTheLoaiPhim)
VALUES ('TC', 'Phim tình cảm'), ('HAI', 'Phim hài'), ('KD', 'Phim kinh dị');
SELECT * FROM theLoaiPhim;

SELECT User.hoTen, Phim.tenPhim, theLoaiPhim.tenTheLoaiPhim, thuePhim.tongTien, thuePhim.thoiGianBatDau, thuePhim.thoiGianTra 
FROM thuePhim INNER JOIN User ON thuePhim.ID_User = User.ID_User
INNER JOIN Phim ON thuePhim.ID_Phim = Phim.ID_Phim
INNER JOIN theLoaiPhim ON Phim.ID_theLoaiPhim = theLoaiPhim.ID_theLoaiPhim
Where tongTien <= 300000 AND theLoaiPhim.tenTheLoaiPhim != 'Phim hài'



