-- Main
use ProjectGiang;
drop database ProjectGiang;
-- Xây dựng Website bán phụ kiện máy tính qua mạng
create table Loaihang (
	maloai varchar(10) primary key,
    tenloai varchar(50)
);
create table SanPham (
	maSP varchar(10) primary key,
    maloai varchar(10),
    tenSP varchar(50) not null
);
create table NhaCungCap (
	maNCC varchar(10) primary key,
    tenNCC varchar(50),
    diachi varchar(100),
    dienthoai varchar(15)
);
    
create table KhachHang(
	maKH varchar(10) primary key,
    tenKH varchar(50),
    diachi varchar(100),
    dienthoai varchar(15)
);
    
create table NhanVien(
	maNV varchar(10) primary key,
    tenNV varchar(50),
    gioitinh enum('M', 'F', 'O'),
    ngayvaolam date,
    userName varchar(20),
    pass_Word varchar(20)
);
create table HoadonNhap(
	maHD varchar(10) primary key,
    ngay date,
    maNCC varchar(10),
    maNV varchar(10),
    diengiai varchar(100)
);
create table CTHoadonNhap(
	maHD varchar(10) primary key,
    maSP varchar(10),
    soluong int,
    dongia float(10,2)
);
create table HoadonXuat(
	maHD varchar(10) primary key,
    ngay date,
    maKH varchar(10),
    maNV varchar(10),
    diengiai varchar(100)
);
create table CTHoadonXuat(
	maHD varchar(10) primary key,
    maSP varchar(10),
    soluong int,
    dongia float(10,2)
);
----------------------------------------------------------------------------
select*from Loaihang;
select*from SanPham;
select*from NhaCungCap;
select*from KhachHang;
select*from NhanVien;
select*from HoadonNhap;
select*from CTHoadonNhap;
select*from HoadonXuat;
select*from CTHoadonXuat;
-------------------------------------------------------------------------------
ALTER TABLE SanPham ADD FOREIGN KEY (maloai) REFERENCES LoaiHang(maloai);
ALTER TABLE HoadonNhap ADD FOREIGN KEY (maNCC) REFERENCES NhaCungCap(maNCC);
ALTER TABLE HoadonNhap ADD FOREIGN KEY (maNV) REFERENCES NhanVien(maNV);
ALTER TABLE CTHoadonNhap ADD FOREIGN KEY (maSP) REFERENCES SanPham(maSP);
ALTER TABLE CTHoadonNhap ADD FOREIGN KEY (maHD) REFERENCES HoadonNhap(maHD);
ALTER TABLE HoadonXuat ADD FOREIGN KEY (maNV) REFERENCES NhanVien(maNV);
ALTER TABLE HoadonXuat ADD FOREIGN KEY (maKH) REFERENCES KhachHang(maKH);
ALTER TABLE CTHoadonXuat ADD FOREIGN KEY (maSP) REFERENCES SanPham(maSP);
ALTER TABLE CTHoadonXuat ADD FOREIGN KEY (maHD) REFERENCES HoadonXuat(maHD);
-------------------------------------------------------------------------------
insert into LoaiHang
values 
	('KBRZ085','Razer BlackWidows V3 Pink'),
    ('KBRZ083','Razer Huntsman Mini Mercury Purple'),
    ('KBAK136','Razer Huntsman Mini Mercury Red'),
    ('KBAK137','không dây Razer BlackWidow V3 Pro'),
    ('KBAK133','Razer BlackWidows V3 White'),
    ('KBRZ084','Razer BlackWidows V3 Gray'),
    ('KBRZ089','Akko 3087 DS Midnight'),
    ('MEMI107','Không dây Microsoft Bluetooth Blutrack Modern Mobile Pink'),
    ('MEMI109','Không dây Microsoft Bluetooth Blutrack Modern Mobile Orange  '),
    ('MEMI108','Không dây Microsoft Bluetooth Blutrack Modern Mobile Gray'),
    ('MEMI102','Không dây Microsoft Bluetooth Blutrack Modern Mobile Black'),
    ('TPK321','Tai Nghe Chụp Tai Chuyên Chơi Game Qinlian A6 jack 3.5 Có Micro, Dây Chống Đứt'),
    ('TPK322','Tai Nghe Chụp Tai Gaming Zidli V2000 Có Micro Dành Cho Chơi Game'),
    ('TPK333','Tai nghe livestream siêu hot - Tai nghe mèo cute'),
    ('TPK342','Tai nghe có dây chuyên game có dây và micro cho máy tính, điện thoại PC PS5, PS4');

insert into SanPham
values
	('KB001','KBRZ085','Bàn phím'),
    ('KB002','KBRZ083','Bàn phím'),
    ('KB003','KBAK136','Bàn phím'),
    ('KB004','KBAK137','Bàn phím'),
    ('KB005','KBAK133','Bàn phím'),
    ('KB006','KBRZ084','Bàn phím'),
    ('KB007','KBRZ089','Bàn phím'),
    ('MOS111','MEMI107','Chuột'),
    ('MOS112','MEMI109','Chuột'),
    ('MOS113','MEMI108','Chuột'),
    ('MOS114','MEMI102','Chuột'),
    ('HEP222','TPK321','Tai nghe'),
    ('HEP223','TPK333','Tai nghe'),
    ('HEP224','TPK333','Tai nghe'),
    ('HEP225','TPK342','Tai nghe');
insert into NhaCungCap
values
	('NCC01','Nova Computer','TP Hồ Chí Minh','0795 235 246'),
    ('NCC02','Sài Gòn Computer','TP Hồ Chí Minh','0953 324 565'),
    ('NCC03','Gearvn','TP Hồ Chí Minh','0982 345 672'),
    ('NCC04','An Khang','Hà Nội','0782 346 157'),
    ('NCC05','An Phát','Hải Phòng','0789 431 145'),
    ('NCC06','Gia Hưng','Đà Nẵng','08452 246 754');
insert into KhachHang
values
	('KH001','Phạm Hương','Đà Nẵng','0812 346 954'),
    ('KH002','Mai Phương Dung','Thái Nguyên','0975 326 456'),
    ('KH003','Ngô Dĩnh Thịnh','Hà Nội','0789 245 124'),
    ('KH004','Trần Dũng','Quảng Ngãi','0985 124 346'),
    ('KH005','Nguyễn Trần Trung Quân','Bến Tre','0985 312 648'),
    ('KH006','Hồ Văn Phong','Long An','0392 345 462'),
    ('KH007','Phạm Văn Việt','Cà Mau','0396 452 765'),
    ('KH008','Ngô Tấn Tài','Đà Nẵng','0368 524 153'),
    ('KH009','Nguyễn Quang Hải','Đà Nẵng','0956 376 769');
insert into NhanVien
values
	('NV001','Hồ Thị Na','F','2020-01-15','naHo','na6245'),
    ('NV002','Nguyễn Thi Trang','F','2020-01-17','trangNguyen','65@trang'),
    ('NV003','Đỗ Sơn','M','2020-01-20','sonDo','jshfdu67@'),
    ('NV004','Thái Văn Quyết','M','2021-05-09','quyetThai','gfdjj@97'),
    ('NV005','Phùng Văn Thành','M','2021-02-23','thanhPhung','954749bjhxgf');
insert into HoadonNhap
values
	('HDN001','2019-05-29','NCC01','NV001',null),
    ('HDN002','2019-06-24','NCC02','NV005',null),
    ('HDN003','2020-03-29','NCC03','NV005',null),
    ('HDN004','2020-04-23','NCC05','NV004',null),
    ('HDN005','2020-05-12','NCC05','NV005',null),
    ('HDN006','2020-05-30','NCC06','NV004',null),
    ('HDN007','2020-07-25','NCC02','NV001',null),
    ('HDN008','2020-9-24','NCC03','NV001',null),
    ('HDN009','2020-12-15','NCC04','NV005',null),
    ('HDN010','2021-01-26','NCC06','NV001',null),
    ('HDN011','2021-02-23','NCC01','NV001',null),
    ('HDN012','2021-03-04','NCC01','NV001',null),
    ('HDN013','2021-09-04','NCC01','NV001',null),
    ('HDN014','2021-09-23','NCC01','NV001',null),
    ('HDN015','2021-10-13','NCC01','NV001',null);
insert into CTHoadonNhap
values
	('HDN001','KB001',50,'369000'),
    ('HDN002','KB002',60,'909000'),
    ('HDN003','KB003',30,'3290000'),
    ('HDN004','KB004',20,'1320000'),
    ('HDN005','KB005',40,'857000'),
    ('HDN006','KB006',24,'921300'),
    ('HDN007','KB007',30,'425000'),
    ('HDN008','MOS111',10,'220000'),
    ('HDN009','MOS112',20,'220000'),
    ('HDN010','MOS113',20,'225000'),
    ('HDN011','MOS114',10,'200000'),
    ('HDN012','HEP222',40,'200000'),
	('HDN013','HEP223',30,'130000'),
	('HDN014','HEP224',34,'130000'),
	('HDN015','HEP225',34,'130000');

insert into HoadonXuat
values
	('HDX001','2021-02-12','KH001','NV002','Đã giao hàng'),
    ('HDX002','2021-04-24','KH002','NV003','Đã giao hàng'),
    ('HDX003','2021-05-29','KH003','NV003','Đã giao hàng'),
    ('HDX004','2021-11-23','KH002','NV003','Đã giao hàng'),
    ('HDX005','2020-03-12','KH004','NV002','Đã giao hàng'),
    ('HDX006','2020-08-23','KH005','NV003','Đã giao hàng'),
    ('HDX007','2020-01-15','KH006','NV002','Đã giao hàng'),
    ('HDX008','2020-01-22','KH006','NV005','Đã giao hàng'),
    ('HDX009','2020-01-29','KH006','NV005','Đã giao hàng'),
    ('HDX010','2020-02-09','KH005','NV002','Đã giao hàng'),
    ('HDX011','2020-03-11','KH006','NV002','Đã giao hàng'),
    ('HDX012','2020-04-10 ','KH007','NV002','Đã giao hàng'),
    ('HDX013','2020-05-14 ','KH003','NV003','Đã giao hàng'),
    ('HDX014','2021-06-02','KH007','NV002','Đã giao hàng'),
    ('HDX015','2021-08-25','KH001','NV003','Đã giao hàng'),
    ('HDX016','2021-10-05','KH002','NV003','Đã giao hàng'),
    ('HDX017','2021-10-15','KH008','NV002','Đang lấy hàng');
insert into CTHoadonXuat
values
	('HDX001','KB001',1,'382000'),
    ('HDX002','KB002',2,'990000'),
    ('HDX003','KB003',1,'3590000'),
    ('HDX004','KB004',1,'1520000'),
    ('HDX005','KB005',20,'940000'),
    ('HDX006','KB005',2,'940300'),
    ('HDX007','KB004',2,'1520000'),
    ('HDX008','MOS111',1,'260000'),
    ('HDX009','MOS112',2,'260000'),
    ('HDX010','MOS112',3,'260000'),
	('HDX011','HEP223',30,'170000'),
	('HDX012','HEP224',2,'170000'),
    ('HDX013','HEP222',3,'240000'),
    ('HDX014','MOS112',2,'260000'),
    ('HDX015','MOS112',1,'260000'),
    ('HDX016','HEP222',1,'240000'),
    ('HDX017','HEP222',1,'240000');
----------------------------------------------------------------------

-- Tạo View
-- Câu 1. Liệt kê mã sản phẩm, tên sản phẩm, tổng số lượng của từng sản phẩm trong cửa hàng bán được trong năm 2020.
create view cau1_view
as 
	select CTHDX.maSP, SP.tenSP, LH.tenloai, sum(CTHDX.soluong) as Tổng_số_lượng from SanPham SP 
    join CTHoadonXuat CTHDX on CTHDX.maSP = SP.maSP
    join HoadonXuat HDX on HDX.maHD = CTHDX.maHD
    join LoaiHang LH on LH.maloai=SP.maloai
    where year(HDX.ngay) = 2020
    group by CTHDX.maSP;
select*from cau1_view;

-- Câu 2. Liệt kê mã nhân viên, tên nhân viên, chưa nhập hàng trong năm 2021
create view cau2_view
as 
	select NV.maNV, NV.tenNV from NhanVien NV
    where NV.maNV not in (select NV.maNV from NhanVien NV 
    join HoadonNhap HDN on NV.maNV= HDN.maNV
    where year(HDN.ngay)=2021);
select*from cau2_view;

-- Câu 3.Liệt kê mã khách hàng, tên khách hàng, số điện thoại, địa chỉ có số lượt mua nhiều nhất năm 2020
--  a. Hiển thị tổng lượt mua của các khách hàng trong năm 2020
create view cau3a_view
as 
	select KH.maKH, tenKH, dienthoai as Số_điện_thoại, diachi, count(HDX.maKH) as Tổng_lượt_mua
    from KhachHang KH
    join HoadonXuat HDX on HDX.maKH = KH.maKH
    where year(HDX.ngay)=2020 
    group by KH.maKH
    order by count(HDX.maKH) desc;
select*from cau3a_view;

-- b.Khách hàng có số lượt mua nhiều nhất năm 2020
create view cau3b_view
as
	select*from cau3a_view
    where Tổng_lượt_mua = (select max(Tổng_lượt_mua) from cau3a_view);
select*from cau3b_view;
 
-- Câu 4. Liệt kê thông tin của khách hàng đã mua hàng trong năm 2021
create view cau4_view
as
	select*from KhachHang KH where maKH 
    in (select HDX.maKH from HoadonXuat HDX where year(ngay)=2021);
select*from cau4_view;

-- Câu 5. Liệt kê mã loại, mã sản phẩm, tên sản phẩm chưa bán được trong năm 2020
create view cau5_view
as
	select*from SanPham SP 
    where maSP not in (select CTHDX.maSP from CTHoadonXuat CTHDX 
    join SanPham SP on CTHDX.maSP = SP.maSP
    join HoadonXuat HDX on HDX.maHD = CTHDX.maHD
    where year(HDX.ngay)=2020);
select*from cau5_view;

-- Câu 6. Liệt kê nhân viên nào bán được số lượng sản phẩm nhiều nhất và tổng số lượng là bao nhiêu trong năm 2021.
create view cau6_view
as
	select NV.maNV, tenNV, gioitinh, sum(CTHDX.soluong) as Tổng_số_lượng 
    from NhanVien NV join HoadonXuat HDX on NV.maNV = HDX.maNV
    join CTHoadonXuat CTHDX on HDX.maHD=CTHDX.maHD
    where year(HDX.ngay)=2021
	group by NV.maNV
    order by sum(CTHDX.soluong) desc
    limit 1;
select*from cau6_view;

-- Câu 7. Thống kê năm 2021, mỗi một mặt hàng trong cả năm bán được với số lượng bao nhiêu.
create view cau7_view
as
	select SP.maSP, tenSP, LH.maloai, tenloai, sum(CTHDX.soluong) as Số_lượng from SanPham SP
    join LoaiHang LH on LH.maloai=SP.maloai
    join CTHoadonXuat CTHDX on CTHDX.maSP = SP.maSP
    join HoadonXuat HDX on HDX.maHD = CTHDX.maHD
    where year(HDX.ngay)=2021
    group by CTHDX.maSP
    order by sum(CTHDX.soluong) desc;
select*from cau7_view;

-- Câu 8. Cho biết doanh số xuất của từng mặt hàng trong năm 2020
create view cau8_view
as 
	select SP.maSP, tenSP, sum(CTHDX.soluong) as Doanh_số
    from CTHoadonXuat CTHDX 
    join SanPham SP on CTHDX.maSP = SP.maSP
    join HoadonXuat HDX on HDX.maHD = CTHDX.maHD
    where year(HDX.ngay)=2020
    group by SP.maSP;
select*from cau8_view;

-- Câu 9. Liệt kê sản phẩm bán được số lượng nhiều nhất năm 2020
create view cau9_view
as
	select SP.maSP, tenSP, LH.maloai, tenloai, max(CTHDX.soluong) 
	from SanPham SP 
    join LoaiHang LH on LH.maloai=SP.maloai 
    join CTHoadonXuat CTHDX on CTHDX.maSP=SP.maSP 
    join HoadonXuat HDX on HDX.maHD=CTHDX.maHD
    where year(HDX.ngay)=2020
    group by SP.maSP
    order by max(CTHDX.soluong) desc
    limit 1;
select*from cau9_view;

-- Trigger
create table SanPham_backup(
	ID int(11) auto_increment primary key,
    maSP varchar(10),
    sukien varchar(100),
    ngaythang date
);

CREATE TRIGGER `DeleteSP` BEFORE DELETE ON `sanpham`
 FOR EACH ROW insert into sanpham_backup 
values(null, old.maSP, 'Xóa',now());

CREATE TRIGGER `InsertSP` AFTER INSERT ON `sanpham`
 FOR EACH ROW insert into sanpham_backup 
values(null, new.maSP, 'Chèn',now());

CREATE TRIGGER `UpdateSP` AFTER UPDATE ON `sanpham`
 FOR EACH ROW insert into sanpham_backup 
values(null, new.maSP, 'Cập nhật',now());

-- Store Procedure
-- Câu 1
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Tong_SP`()
select count(maSP) from SanPham$$
DELIMITER ;

-- Câu 2
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Doanh_thu_tung_thang_trong_nam_2020`()
    NO SQL
begin
	select CTHDX.maSP,month(HDX.ngay) as 'Tháng',HDX.ngay, 	sum(soluong*dongia) as'Doanh thu' from cthoadonxuat CTHDX 
    join HoadonXuat HDX on CTHDX.maHD=HDX.maHD 
    join SanPham SP on SP.maSP=CTHDX.maSP
    where year(HDX.ngay)=2020
    group by month(HDX.ngay);
end$$
DELIMITER ;

-- Câu 3
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Thong_tin_cac_san_pham_nhap_tu_nam_2020`()
begin 
	select SP.maSP, tenSP, LH.maloai, CTHDN.dongia, HDN.ngay  
    from SanPham SP 	 
    join CTHoadonNhap CTHDN on CTHDN.maSP=SP.maSP 
    join HoadonNhap HDN on HDN.maHD=CTHDN.maHD 
    join loaihang LH on LH.maloai=SP.maloai 
    where year(HDN.ngay)=2020;
end$$
DELIMITER ;
-- Câu 4
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ThemNV`(IN `MaNV` VARCHAR(10), IN `TênNV` VARCHAR(50), IN `Giới tính` ENUM('Nam','Nữ','Khác',''), IN `Ngày vào làm` DATE, IN `UserName` VARCHAR(20), IN `Password` VARCHAR(20))
    NO SQL
begin
    INSERT INTO NhanVien 
  VALUES(maNV,tenNV,gioitinh,ngayvaolam,userName,pass_Word);
end$$
DELIMITER ;

-- Câu 5
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Tim_NCC_theo_ID`(IN `Mã` VARCHAR(10))
    NO SQL
begin
	select*from NhaCungCap where maNCC=Mã;
end$$
DELIMITER ;
-- Câu 6
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Tong_Nhan_vien`()
select count(maNV) from NhanVien$$
DELIMITER ;

-- Câu 7
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Doanh_thu_ngay`()
    NO SQL
begin
	select CTHDX.maSP,date(HDX.ngay) as 'Ngay',HDX.ngay, sum(soluong*dongia) as'Doanh thu' from cthoadonxuat CTHDX 
    join HoadonXuat HDX on CTHDX.maHD=HDX.maHD 
    join SanPham SP on SP.maSP=CTHDX.maSP
    group by date(HDX.ngay);
end$$
DELIMITER ;
-- Câu 8
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Tim_KH_theo_ID`(IN `Ma` VARCHAR(10))
begin 
	select*from KhachHang where maKH=Ma;
end$$
DELIMITER ;

-- Function
-- Câu 1
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `Ton_Kho`(`NhapMaSP` VARCHAR(10)) RETURNS int(11)
BEGIN
	declare tonkho int(11);
    set tonkho=(select cthdn.soluong- cthdx.soluong
	from cthoadonnhap cthdn, cthoadonxuat cthdx
	where cthdn.maSP=cthdx.maSP and cthdn.maSP= 	NhapMaSP);
	return tonkho;
END$$
DELIMITER ;
-- Câu 2
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `DemSP_cua_NCC`(`NhaCungCap` VARCHAR(10)) RETURNS int(11)
BEGIN
    DECLARE soluong int(10);
    set soluong= (select count(CTHDN.soluong) 
    from NhaCungCap NCC 
    join HoadonNhap HDN on HDN.maNCC=NCC.maNCC 
    join CTHoadonNhap CTHDN on HDN.maHD=CTHDN.maHD
    join SanPham SP on SP.maSP=CTHDN.maSP
    where NCC.maNCC=NhaCungCap
	group by HDN.maNCC);
	return soluong;
END$$
DELIMITER ;
-- Câu 3.
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `TinhGiaTridonHang`(`MaHoadon` VARCHAR(10)) RETURNS int(11)
    NO SQL
begin 
	declare thanhtien float(10,2);
    set thanhtien=(select (cthoadonxuat.soluong*cthoadonxuat.dongia) from cthoadonxuat where maHD=MaHoaDon);
    return thanhtien;
end$$
DELIMITER ;

