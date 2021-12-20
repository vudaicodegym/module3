create database quanlysinhvien2;
use quanlysinhvien2;
-- select * FROm sinhvien;
-- tạo bàng --
create table Sinhvien
(
maSV int auto_increment primary key,
hoTen nvarchar(30) not null,
gioiTinh varchar(10),
ngaySinh date,
maLop int, 
hocBong nvarchar(50),
diaChi nvarchar(30),
foreign key (maLop) references lop(Malop)
);
create table lop
(
MaLop int auto_increment primary key,
tenlop varchar(10) not null,
makhoa int not null,
foreign key (maKhoa) references khoa(maKhoa)
);
create table khoa
(
maKhoa int auto_increment primary key,
tenKhoa varchar(10) not null,
SoCBGD varchar(50)
);
create table MonHoc
(
MaMonHoc int auto_increment primary key,
tenMonHoc nvarchar(50) not null,
soTiet int,
check (soTiet >= 0)
);
create table Ketqua
(
MaSinhVien int,
MaMonHoc int,
DiemThi float(4,2),
primary key(MaSinhVien, MaMonHoc),
foreign key (MaSinhVien) references SinhVien(maSV),
foreign key (MaMonHoc) references monhoc(MaMonHoc)
);

-- thêm dữ liệu -- 
insert into sinhvien(hoTen, gioitinh ,ngaySinh ,maLop, hocBong, diaChi)
values 
('Nguyễn Huy Du', 'nam' , '1999/04/10', 1, 'co', 'hà nội'),
('phạm vũ đại', 'nam' , '1997/11/18', 1, 'co', 'hà nội'),
('trần xuân đạt', 'nam' , '1996/02/22', 1,'co', 'hà nội'),
('tạ văn tài', 'nam' , '1994/12/11', 1, 'co', 'hà nội'),
('vũ thị thảo', 'nữ', '1993/04/10', 1, 'co', 'sài gòn'),
('bùi tùng lâm', 'nữ', '1997/01/30', 1, 'co', 'quảng ninh');
insert into lop(tenlop, maKhoa)
values
('java', 1),
('php', 1);
insert into khoa(tenkhoa, soCBGD)
values
('CNTT', 5 );
insert into MonHoc(tenMonHoc, sotiet)
values
('java', 45),
('php', 30),
('C++', 30);
insert into Ketqua(MaSinhVien, MaMonHoc, Diemthi)
values
(25,1,7.5),
(26,1,8),
(27,1,8.5),
(28,1,9),
(29,1,9.5),
(30,1,10);

 
-- Câu 1: Liệt kê danh sách các lớp của khoa, thông tin cần Malop, TenLop, MaKhoa
select MaLop,TenLop,MaKhoa
from lop;
-- Câu 2: Lập danh sách sinh viên gồm: MaSV, HoTen, HocBong
select MaSV,HoTen,HocBong
from sinhvien;
-- Câu 3: Lập danh sách sinh viên có học bổng. Danh sách cần MaSV, Nu, HocBong
select MaSV,HoTen,GioiTinh,HocBong
from sinhvien
where HocBong like 'Co';
-- Câu 5: Lập danh sách sinh viên có họ ‘Trần’
select *
from sinhvien
where HoTen like 'Tran%';
-- Câu 6: Lập danh sách sinh viên nữ có học bổng
select *
from sinhvien
where GioiTinh like 'Nu' and HocBong like 'Co';
-- Câu 7: Lập danh sách sinh viên nữ hoặc danh sách sinh viên có học bổng
select *
from sinhvien
where GioiTinh like 'Nu' or HocBong like 'Co';
-- Câu 8: Lập danh sách sinh viên có năm sinh từ 1850 đến 1995.
-- Danh sách cần các thuộc tính của quan hệ SinhVien
select *
from sinhvien
where year(NgaySinh) between 1850 and 1995;
-- Câu 9: Liệt kê danh sách sinh viên được sắp xếp tăng dần theo Năm Sinh
select *
from sinhvien
order by year(NgaySinh);
-- Câu 10: Liệt kê danh sách sinh viên được sắp xếp giảm dần theo HocBong
select *
from sinhvien
order by HocBong;
--  Lập danh sách sinh viên có học bổng của khoa CNTT.
select sinhvien.*,MaKhoa
from sinhvien
join lop on lop.MaLop = sinhvien.MaLop
where HocBong like 'Co' and MaKhoa like 'CNTT';
-- Câu 14: Cho biết số sinh viên của mỗi lớp
select MaLop,count(HoTen) as 'SoLuongSVTheoHoc'
from sinhvien
group by MaLop;
-- Câu 15: Cho biết số lượng sinh viên của mỗi khoa.
