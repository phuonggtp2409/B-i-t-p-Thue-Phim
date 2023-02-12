create table thongTinNguoiDung (
maNguoiDung int,
tenNguoiDung varchar(255),
anhDaiDien varchar(255),
SDT int,
email varchar(255),
maGioiTinh varchar(255),
ngaySinh datetime,
maXa varchar(255),
diaChiChiTiet varchar(255),
primary key (maNguoiDung));
insert into thongTinNguoiDung ( maNguoiDung, tenNguoiDung, anhDaiDien, SDT, email, maGioiTinh, ngaySinh, maXa, diaChiChiTiet)
values (2, 'Giáp Phượng', 'avt1', 01111111, 'phuonggt1@gmail.com', 'GT1', '1999-08-15', 'TL', 'Hà Thượng'),
(3, 'Giáp Lý', 'avt2', 02222222, 'lygt1@gmail.com', 'GT1', '1997-08-15', 'VT', 'Chàng'),
(4, 'Nguyễn An', 'avt3', 0444444, 'ann1@gmail.com', 'GT2', '1996-09-15', 'HL', 'Hoàng Liệt 2'),
(6, 'Nguyễn Bình', 'avt6', 0666666, 'binhnv1@gmail.com', 'GT2', '1997-08-20', 'MT', 'Phạm Hùng'),
(7, 'Nguyễn Mai', 'avt7', 0777777, 'chanh@gmail.com', 'GT2', '1998-09-15', 'HL', 'Linh Đàm');
SeLect * from thongTinNguoiDung;

CREATE TABLE gioiTinh (
maGioiTinh varchar(255),
tenGioiTinh varchar(255),
primary key (maGioiTinh));
insert into gioiTinh (maGioiTinh, tenGioiTinh)
values ('GT1', 'Nữ') , ('GT2', 'Nam'), ('GT3', 'không xác định');
SeLect * from gioiTinh;

SELECT thongTinNguoiDung.tenNguoiDung,thongTinNguoiDung.ngaySinh, thongTinNguoiDung.SDT, thongTinNguoiDung.diaChiChiTiet, quyenNguoiDung.tenQuyen from thongTinNguoiDung
inner Join thongtinTK on thongTinNguoiDung.maNguoiDung = thongtinTK.maNguoiDung
inner Join quyenNguoiDung on quyenNguoiDung.maQuyen = thongtinTK.maQuyen
where tenQuyen = 'Tài Xế';

SELECT thongTinNguoiDung.tenNguoiDung, loaiXe.tenLoaiXe, hangXe.tenHangXe, thongTinPhuongTien.tenPhuongTien, phuongTienNguoiDung.bienSoXe
from phuongTienNguoiDung inner Join thongTinNguoiDung on phuongTienNguoiDung.maNguoiDung = thongTinNguoiDung.maNguoiDung
inner Join loaiXe on phuongTienNguoiDung.maLoaiXe = loaiXe.maLoaiXe
inner Join hangXe on phuongTienNguoiDung.maHangXe =hangXe.maHangXe
inner Join thongTinPhuongTien on phuongTienNguoiDung.maPhuongTien = thongTinPhuongTien.maPhuongTien
Where thongTinNguoiDung.tenNguoiDung = 'Giáp Phượng';

select TINH.TENTINH, count(TINH.TENTINH) as soLuongXa from XA 
inner join HUYEN on XA.MAHUYEN = HUYEN.MAHUYEN
inner join TINH on TINH.MATINH = HUYEN.MATINH group by TINH.TENTINH limit 3
