------------------------QUAN LI BAN HANG SACH-----------------------------------
-----Tao bang
---1. Tao bang SÁCH 
CREATE TABLE SACH
(
   MaSach NVARCHAR2(20) 
   CONSTRAINT s_pk PRIMARY KEY ,
   TenSach NVARCHAR2(50),
   GiaSach NUMBER,
   NamXB DATE, 
   Ngaynhap DATE,
   MaTG NVARCHAR2(20),
   MaTheLoai NVARCHAR2(20),
   MaNXB NVARCHAR2(20),
CONSTRAINT tgs_fk FOREIGN KEY (MaTG) REFERENCES TACGIA(MaTG),
CONSTRAINT tls_fk FOREIGN KEY (MaTheLoai) REFERENCES THELOAI(MaTheLoai),
CONSTRAINT nxbs_fk FOREIGN KEY (MaNXB) REFERENCES NHAXUATBAN(MaNXB));
------------------------------------------------------------

--- 2. Tao bang TAC GIA
CREATE TABLE TACGIA
(
  MaTG nvarchar2(50)
  CONSTRAINT tg_pk PRIMARY KEY ,
  TenTG nvarchar2(50),
  SdtTG nvarchar2(50),
  DiaChiTG nvarchar2(50));
  
------------------------------------------------------------

--- 3. Tao bang THE LOAI 
CREATE TABLE THELOAI
(
 MaTheLoai nvarchar2(20),
 TenTheLoai nvarchar2(20),
CONSTRAINT tl_pk PRIMARY KEY (MaTheLoai));
------------------------------------------------------------

--- 4. Tao bang NHA XUAT BAN
CREATE TABLE NHAXUATBAN
(
  MaNXB nvarchar2(50),
  TenNXB nvarchar2(30),
  SdtNXB nvarchar2(50),
  DiaChiNXB nvarchar2(30),
CONSTRAINT nxb_pk PRIMARY KEY (MaNXB));
------------------------------------------------------------

--- 5. Tao bang CHI TIET HOA DON
CREATE TABLE CHITIETHOADON
(
   MaSach NVARCHAR2(20),
   MaHD nvarchar2(20),
   SLBan number,
CONSTRAINT cthd_pk PRIMARY KEY ( MaSach , MaHD ) ,
CONSTRAINT cthds_fk FOREIGN KEY (MaSach) REFERENCES SACH(MaSach),
CONSTRAINT cthdhd_fk FOREIGN KEY (MaHD) REFERENCES HOADON(MaHD));
 
 -----------------------------------------------------------
 --- 6. Tao bang HOA DON
 CREATE TABLE HOADON
(
  MaHD nvarchar2(20) 
  CONSTRAINT hd_pk PRIMARY KEY ,
  Ngaylap date,
  TongTien number ,
  MaNV nvarchar2(20),
  MaKH nvarchar2(20),
  MaCK nvarchar2(30),
CONSTRAINT hdck_fk FOREIGN KEY (MaCK) REFERENCES CHIETKHAU(MaCK),
CONSTRAINT hdnv_fk FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV),
CONSTRAINT hdkh_fk FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH));

------------------------------------------------------------
--- 7. Tao bang KHÁCH HÀNG
CREATE TABLE KHACHHANG
(
 MaKH nvarchar2(20),
 TenKH nvarchar2(30),
 SdtKH number,
 DiachiKH nvarchar2(30),
CONSTRAINT kh_pk PRIMARY KEY (MaKH));

------------------------------------------------------------
--- 8. Tao bang DANH GIA
CREATE TABLE DANHGIA
( MaKH nvarchar2(20) ,
  MaSach nvarchar2(20) ,
  Loidanhgia nvarchar2(20) ,
  Ngaydanhgia date ,
CONSTRAINT dg_pk PRIMARY KEY (MaKH,MaSach),
CONSTRAINT dgs_fk FOREIGN KEY (MaSach) REFERENCES Sach (MaSach),
CONSTRAINT dgkh_fk FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MAKH));

------------------------------------------------------------
--- 9. Tao bang CHIET KHAU
CREATE TABLE CHIETKHAU
(
 MaCK nvarchar2(20)
 CONSTRAINT ck_pk PRIMARY KEY ,
 TenCK nvarchar2(20),
 PhanTramCK number );

------------------------------------------------------------

--- 10. Tao bang NHÂN VIÊN 
CREATE TABLE NHANVIEN
(
 MaNV nvarchar2(20),
 TenNV nvarchar2(25),
 DiachiNV nvarchar2(30),
 SdtNV nvarchar2(30),
CONSTRAINT nv_pk PRIMARY KEY(MaNV));

--------------------------------------------------------------------------------

------ NHAP DU LIEU 
--- Nhap du lieu bang TACGIA
insert into tacgia ( MaTG , TenTG , SdtTG , DiaChiTG )
  values ( 'tg1' , 'Vu Thi Binh' , '09011111' , 'HaNoi');
insert into tacgia ( MaTG , TenTG , SdtTG , DiaChiTG )
  values ( 'tg2' , 'Luu Ngoc Duc' , '09011112' , 'BacNinh');
insert into tacgia ( MaTG , TenTG , SdtTG , DiaChiTG )
  values ( 'tg3' , 'Tran Thu Ha' , '09011113' , 'HaNoi');
insert into tacgia ( MaTG , TenTG , SdtTG , DiaChiTG )
  values ( 'tg4' , 'Dang Thi Hang' , '09011114' , 'HaNam');
insert into tacgia ( MaTG , TenTG , SdtTG , DiaChiTG )
  values ( 'tg5' , 'Ha Thi Hien' , '09011115' , 'BacGiang');
insert into tacgia ( MaTG , TenTG , SdtTG , DiaChiTG )
  values ( 'tg6' , 'Dinh Thuy Hien' , '09011116' , 'LangSon');
insert into tacgia ( MaTG , TenTG , SdtTG , DiaChiTG )
  values ( 'tg7' , 'Hoang Thi Hue' , '09011117' , 'NamDinh');
insert into tacgia ( MaTG , TenTG , SdtTG , DiaChiTG )
  values ( 'tg8' , 'Le Viet Hung' , '09011118' , 'HaNoi');
insert into tacgia ( MaTG , TenTG , SdtTG , DiaChiTG )
  values ( 'tg9' , 'Tran Viet Hung' , '09011119' , 'BacNinh');
insert into tacgia ( MaTG , TenTG , SdtTG , DiaChiTG )
  values ( 'tg10' ,'Pham Quang Huy' , '090111110' , 'LangSon');
insert into tacgia ( MaTG , TenTG , SdtTG , DiaChiTG )
  values ( 'tg11' ,'Pham Quang Nui' , '090111111' , 'LangSon');
insert into tacgia ( MaTG , TenTG , SdtTG , DiaChiTG )
  values ( 'tg12' ,'Trinh Trung Nguyen' , '090111112' , 'HoChiMinh');
insert into tacgia ( MaTG , TenTG , SdtTG , DiaChiTG )
  values ( 'tg13' ,'Nguyen Quynh Huong' , '090111113' , 'CaMau');
insert into tacgia ( MaTG , TenTG , SdtTG , DiaChiTG )
  values ( 'tg14' ,'Truong Quynh Anh' , '090111114' , 'HaTinh');
insert into tacgia ( MaTG , TenTG , SdtTG , DiaChiTG )
  values ( 'tg15' ,'Le Ngoc Anh' , '090111115' , 'BacNinh');  
insert into tacgia ( MaTG , TenTG , SdtTG , DiaChiTG )
  values ( 'tg16' ,'Bui Hai Ngoc' , '090111116' , 'LangSon');  
insert into tacgia ( MaTG , TenTG , SdtTG , DiaChiTG )
  values ( 'tg17' ,'Nguyen Quang Huy' , '090111117' , 'TayNguyen');  
insert into tacgia ( MaTG , TenTG , SdtTG , DiaChiTG )
  values ( 'tg18' ,'Tran Canh Toan' , '090111118' , 'NamDinh');
insert into tacgia ( MaTG , TenTG , SdtTG , DiaChiTG )
  values ( 'tg19' ,'Nguyen Thao Linh' , '090111119' , 'LangSon'); 
insert into tacgia ( MaTG , TenTG , SdtTG , DiaChiTG )
  values ( 'tg20' ,'Le Dieu Linh' , '090111120' , 'HaNoi');
  
---Nhap du lieu bang THELOAI
insert into theloai ( MaTheLoai , TenTheLoai ) 
  values ( 'ct1', 'chinhtri');
insert into theloai ( MaTheLoai , TenTheLoai ) 
  values ( 'pl2', 'phapluat');
insert into theloai ( MaTheLoai , TenTheLoai ) 
  values ( 'cn3', 'congnghe');
insert into theloai ( MaTheLoai , TenTheLoai ) 
  values ( 'kt4', 'kinhte');
insert into theloai ( MaTheLoai , TenTheLoai ) 
  values ( 'nght5', 'nghethuat');
insert into theloai ( MaTheLoai , TenTheLoai ) 
  values ( 'xh6', 'xahoi');
insert into theloai ( MaTheLoai , TenTheLoai ) 
  values ( 'ls7', 'lichsu');
insert into theloai ( MaTheLoai , TenTheLoai ) 
  values ( 'tt8', 'tieuthuyet');
insert into theloai ( MaTheLoai , TenTheLoai ) 
  values ( 'tl9', 'tamli');
insert into theloai ( MaTheLoai , TenTheLoai ) 
  values ( 'tn10', 'thieunhi');

---Nhap du lieu bang NHAXUATBAN
insert into nhaxuatban ( MaNXB , TenNXB ,SdtNXB, DiaChiNXB ) 
  values ( 'NXB001', 'giaothongvantai' ,'097981001', 'HoanKiem HaNoi' );
insert into nhaxuatban ( MaNXB , TenNXB ,SdtNXB , DiaChiNXB ) 
  values ( 'NXB002', 'laodong' ,'097981002', 'DongDa HaNoi' );
insert into nhaxuatban ( MaNXB , TenNXB ,SdtNXB , DiaChiNXB ) 
  values ( 'NXB003', 'thongtinvatruyenthong' ,'097981003', 'TranDuyHung HaNoi' );
insert into nhaxuatban ( MaNXB , TenNXB ,SdtNXB , DiaChiNXB ) 
  values ( 'NXB004', 'tuphap' ,'097981004', 'HoanKiem HaNoi'  );
insert into nhaxuatban ( MaNXB , TenNXB ,SdtNXB , DiaChiNXB ) 
  values ( 'NXB005', 'hoinhavan' ,'097981005', 'NguyenDu HaNoi' );
insert into nhaxuatban ( MaNXB , TenNXB ,SdtNXB , DiaChiNXB ) 
  values ( 'NXB006', 'giaoduc' ,'097981006', 'TranHungDao HaNoi' );
insert into nhaxuatban ( MaNXB , TenNXB ,SdtNXB , DiaChiNXB ) 
  values ( 'NXB007', 'chinhtriquocgia' ,'097981007', 'CauGiay HaNoi' );
insert into nhaxuatban ( MaNXB , TenNXB ,SdtNXB , DiaChiNXB ) 
  values ( 'NXB008', 'hochiminh' ,'097981008', 'Quan1 HoChiMinh' );
insert into nhaxuatban ( MaNXB , TenNXB ,SdtNXB ,DiaChiNXB ) 
  values ( 'NXB009', 'tre' ,'097981009', 'Quan3 HoChiMinh' );
insert into nhaxuatban ( MaNXB , TenNXB ,SdtNXB , DiaChiNXB ) 
  values ( 'NXB0010', 'kimdong' ,'097981010','HaiBaTrung HaNoi' );

--- Nhap du lieu bang Sach 
insert into sach ( MaSach , TenSach , GiaSach , NamXB ,NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S1001' , 'conan' , 10000 , to_date( '1/1/2003 ','dd/mm/yy'),to_date('12/2/2019','dd/mm/yy'), 'tg1' , 'ct1', 'NXB001' ); 
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S1002' , 'doraemon' , 11000 , to_date( '5/7/2003 ','dd/mm/yy'),to_date('13/4/2020','dd/mm/yy'), 'tg1' , 'pl2', 'NXB002' ); 
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S1003' , 'shin' , 15000 , to_date( '1/7/2009 ','dd/mm/yy'),to_date('15/6/2021','dd/mm/yy') , 'tg1' , 'cn3', 'NXB003' );   
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S1004' , 'naruto' , 10000 , to_date( '1/2/2007 ','dd/mm/yy'),to_date('23/9/2021','dd/mm/yy'), 'tg2' , 'kt4', 'NXB004' );   
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S1005' , 'songoku' , 16000 , to_date( '10/1/2003 ','dd/mm/yy'),to_date('22/10/2022','dd/mm/yy'), 'tg2' , 'nght5', 'NXB004' );   
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S1006' , 'blackcover' , 15000 , to_date( '1/10/1998 ','dd/mm/yy'),to_date('21/8/2019','dd/mm/yy') , 'tg3' , 'nght5', 'NXB005' );   
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S1007' , 'onepice' , 11000 , to_date( '13/2/2003 ','dd/mm/yy'), to_date('15/8/2019','dd/mm/yy') , 'tg4' , 'xh6', 'NXB006' );   
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S1008' , 'onepacman' , 20000 , to_date( '14/1/2001 ','dd/mm/yy'),to_date('31/10/2020','dd/mm/yy')  , 'tg4' , 'nght5', 'NXB004' ); 
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S1009' , 'nihon' , 100000 , to_date( '1/1/2000 ','dd/mm/yy'), to_date('9/10/2022','dd/mm/yy') , 'tg5' , 'xh6', 'NXB007' ); 
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10010' , 'katakana' , 30000 , to_date( '1/10/1999 ','dd/mm/yy'), to_date('5/6/2021','dd/mm/yy') , 'tg6' , 'ls7', 'NXB007' ); 
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10011' , 'katakana' , 35000 , to_date( '6/10/2001 ','dd/mm/yy'), to_date('3/4/2019','dd/mm/yy') , 'tg7' , 'tt8', 'NXB007' ); 
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10012' , 'katakana' , 42000 , to_date( '9/10/2002 ','dd/mm/yy'), to_date('4/3/2018','dd/mm/yy') , 'tg8' , 'tl9', 'NXB007' );  
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10013' , 'katakana' , 37000 , to_date( '17/10/2003 ','dd/mm/yy'), to_date('12/12/2022','dd/mm/yy') , 'tg9' , 'tn10', 'NXB008' );   
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10014' , 'shin' , 39000 , to_date( '1/10/2004 ','dd/mm/yy'),to_date('23/9/2018','dd/mm/yy') , 'tg6' , 'tn10', 'NXB009' );   
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10015' , 'conan' , 50000 , to_date( '12/10/2006 ','dd/mm/yy'),to_date('21/2/2018','dd/mm/yy') , 'tg10' , 'tl9', 'NXB0010' );   
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10016' , 'olongvien' , 53000 , to_date( '22/10/2008 ','dd/mm/yy'),to_date('22/2/2018','dd/mm/yy') , 'tg9' , 'tt8', 'NXB009' );
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10017' , 'conanba' , 90000 , to_date( '12/12/2010 ','dd/mm/yy'),to_date('30/3/2022','dd/mm/yy') , 'tg5' , 'ls7', 'NXB004' );
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10018' , 'tindaicuong' , 500000 , to_date( '2/12/2001 ','dd/mm/yy'),to_date('30/5/2021','dd/mm/yy') , 'tg6' , 'tl9', 'NXB003' );
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10019' , 'lichsudang' , 99000 , to_date( '12/2/2010 ','dd/mm/yy'),to_date('3/3/2022','dd/mm/yy') , 'tg7' ,'kt4', 'NXB009' );
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10020' , 'triet' , 7000 , to_date( '12/11/2009 ','dd/mm/yy'),to_date('3/3/2019','dd/mm/yy') , 'tg1' , 'xh6', 'NXB008' );
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10021' , 'toankinhte' , 90000 , to_date( '12/12/2003 ','dd/mm/yy'),to_date('1/5/2018','dd/mm/yy') , 'tg5' , 'ls7', 'NXB007' );
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10022' , 'xacsuat' , 23000 , to_date( '30/4/2001 ','dd/mm/yy'),to_date('6/5/2020','dd/mm/yy') , 'tg9' , 'cn3', 'NXB0010' );
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10023' , 'nguvan' , 45000 , to_date( '29/11/2005 ','dd/mm/yy'),to_date('22/1/2018','dd/mm/yy') , 'tg10' , 'pl2', 'NXB001' );
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10024' , 'anhvan' , 33000 , to_date( '25/11/2004 ','dd/mm/yy'),to_date('23/1/2020','dd/mm/yy') , 'tg11' , 'pl2', 'NXB004' );
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10025' , 'toan' , 43000 , to_date( '2/11/2003 ','dd/mm/yy'),to_date('31/5/2022','dd/mm/yy') , 'tg12' , 'xh6', 'NXB005' );
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10026' , 'mythuat' , 67000 , to_date( '29/11/2001 ','dd/mm/yy'),to_date('22/5/2021','dd/mm/yy') , 'tg13' , 'cn3', 'NXB006' );
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10027' , 'amnhac' , 73000 , to_date( '29/5/2002 ','dd/mm/yy'),to_date('5/6/2019','dd/mm/yy') , 'tg14' , 'kt4', 'NXB007' );
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10028' , 'diali' , 13000 , to_date( '2/9/2000 ','dd/mm/yy'),to_date('24/4/2022','dd/mm/yy') , 'tg15' , 'ct1', 'NXB008' );
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10029' , 'theduc' , 15000 , to_date( '3/10/1999 ','dd/mm/yy'),to_date('13/2/2018','dd/mm/yy') , 'tg16' , 'cn3', 'NXB009' );
insert into sach ( MaSach , TenSach , GiaSach , NamXB , NgayNhap , MaTG , MaTheLoai , MaNXB ) 
  values ( 'S10030' , 'vo' , 19000 , to_date( '30/11/2000 ','dd/mm/yy'),to_date('23/12/2021','dd/mm/yy') , 'tg17' , 'kt4', 'NXB0010' );

---Nhap du lieu bang NHANVIEN
insert into nhanvien ( MaNV , TenNV , DiachiNV , SdtNV ) 
  values ( '23A101' , 'Ho Ngoc Ha' , 'ThanhXuan HaNoi' , '09000121');
insert into nhanvien ( MaNV , TenNV , DiachiNV , SdtNV ) 
  values ( '23A102' , 'Bui Anh Tuan' , 'ThanhXuan BacNinh' , '09000122'); 
insert into nhanvien ( MaNV , TenNV , DiachiNV , SdtNV ) 
  values ( '23A103' , 'Luong Minh Phuong' , 'BaDinh HaNoi' , '09000123');
insert into nhanvien ( MaNV , TenNV , DiachiNV , SdtNV ) 
  values ( '23A104' , 'Le Quang Hieu' , 'LuongTai BacNinh' , '09000124');  
insert into nhanvien ( MaNV , TenNV , DiachiNV , SdtNV ) 
  values ( '23A105' , 'Nguyen Thu Phuong' , 'HuuLung LangSon' , '09000125');  
insert into nhanvien ( MaNV , TenNV , DiachiNV , SdtNV ) 
  values ( '23A106' , 'Bui Tien Dung ' , 'QueVo BacNinh' , '09000126');  
insert into nhanvien ( MaNV , TenNV , DiachiNV , SdtNV ) 
  values ( '23A107' , 'Que Ngoc Hai ' , 'HoGuom HaNoi' , '09000127');  
insert into nhanvien ( MaNV , TenNV , DiachiNV , SdtNV ) 
  values ( '23A108' , 'Nguyen Thuy Nga' , 'KhamThien HaNoi' , '09000128');  
insert into nhanvien ( MaNV , TenNV , DiachiNV , SdtNV ) 
  values ( '23A109' , 'Pham Thu Phuong' , 'BaDinh HaNoi' , '09000129');  
insert into nhanvien ( MaNV , TenNV , DiachiNV , SdtNV ) 
  values ( '23A1010' , 'Pham Thu Phuong' , 'LuongTai BacNinh' , '090001210'); 

---  Nhap du lieu cho bang CHIETKHAU
insert into chietkhau ( MaCK , TenCK , PhanTramCK ) 
  values ( 'CKJA' , 'nhatbanmot' , 10 );
insert into chietkhau ( MaCK , TenCK , PhanTramCK ) 
  values ( 'CKJB' , 'nhatbanhai' , 20 );
insert into chietkhau ( MaCK , TenCK , PhanTramCK ) 
  values ( 'CKJC' , 'nhatbanba' , 30 );
insert into chietkhau ( MaCK , TenCK , PhanTramCK ) 
  values ( 'CKJD' , 'nhatbanbon' , 40 );
insert into chietkhau ( MaCK , TenCK , PhanTramCK ) 
  values ( 'CKJE' , 'nhatbannam' , 50 );
insert into chietkhau ( MaCK , TenCK , PhanTramCK ) 
  values ( 'CKJF' , 'nhatbansau' , 35 );
insert into chietkhau ( MaCK , TenCK , PhanTramCK ) 
  values ( 'CKJG' , 'nhatbanbay' , 45 );
insert into chietkhau ( MaCK , TenCK , PhanTramCK ) 
  values ( 'CKJH' , 'nhatbantam' , 75 );
insert into chietkhau ( MaCK , TenCK , PhanTramCK ) 
  values ( 'CKJI' , 'nhatbanchin' , 89 );
insert into chietkhau ( MaCK , TenCK , PhanTramCK ) 
  values ( 'CKJJ' , 'nhatbanmuoi' , 99 );


---Nhap du lieu vao bang KHACHHANG 
insert into khachhang ( MaKH , TenKH , sdtKH , DiachiKH ) 
  values ( 'KHI' , 'Nguyen Van An' , 099001 , 'HaiPhong');
insert into khachhang ( MaKH , TenKH , sdtKH , DiachiKH ) 
  values ( 'KHII' , 'Tran Viet Anh' , 099002 , 'HaiDuong');
insert into khachhang ( MaKH , TenKH , sdtKH , DiachiKH ) 
  values ( 'KHIII' , 'Le Thanh Huong' , 099003 , 'BacGiang');
insert into khachhang ( MaKH , TenKH , sdtKH , DiachiKH ) 
  values ( 'KHIV' , 'Le Thi Huyen' , 099004 , 'HaNoi'); 
insert into khachhang ( MaKH , TenKH , sdtKH , DiachiKH ) 
  values ( 'KHV' , 'Dao Duy Tuan' , 099005 , 'NamDinh');  
insert into khachhang ( MaKH , TenKH , sdtKH , DiachiKH ) 
  values ( 'KHVI' , 'Tran Le Khanh' , 099006 , 'LaoCai');  
insert into khachhang ( MaKH , TenKH , sdtKH , DiachiKH ) 
  values ( 'KHVII' , 'Dao Quoc Viet' , 099007 , 'HaNoi'); 
insert into khachhang ( MaKH , TenKH , sdtKH , DiachiKH ) 
  values ( 'KHVIII' , 'Nguyen Thi Tu' , 099008 , 'BacGiang');  
insert into khachhang ( MaKH , TenKH , sdtKH , DiachiKH ) 
  values ( 'KHIX' , 'Nguyen Tuan Thanh' , 099009 , 'LangSon'); 
insert into khachhang ( MaKH , TenKH , sdtKH , DiachiKH ) 
  values ( 'KHX' , 'Hoang Hai Ha' , 0990010 , 'BacNinh');  
  
--- Nhap du lieu bang DANHGIA
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHI' , 'S1001' , to_date('3/2/2019' , 'dd/mm/yy') , 'RatHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHII' , 'S1002' , to_date('3/2/2019' , 'dd/mm/yy') , 'CucHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHII' , 'S1003' , to_date('3/2/2019' , 'dd/mm/yy') , 'KhongHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHII' , 'S1004' , to_date('3/2/2019' , 'dd/mm/yy') , '' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHIII' , 'S1005' , to_date('3/2/2019' , 'dd/mm/yy') , 'RatHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHIII' , 'S1006' , to_date('3/2/2019' , 'dd/mm/yy') , 'Hay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHIV' , 'S1007' , to_date('3/2/2019' , 'dd/mm/yy') , 'RatBinhThuongHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHV' , 'S1008' , to_date('3/2/2019' , 'dd/mm/yy') , 'CucHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHVI' , 'S1009' , to_date('3/2/2019' , 'dd/mm/yy') , 'Hay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHVII' , 'S10010' , to_date('3/2/2019' , 'dd/mm/yy') , 'BinhThuong' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHVIII' , 'S10011' , to_date('3/2/2019' , 'dd/mm/yy') , 'KhongHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHIX' , 'S10012' , to_date('3/2/2019' , 'dd/mm/yy') , 'KhongHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHX' , 'S1008' , to_date('3/2/2019' , 'dd/mm/yy') , 'RatHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHX' , 'S10013' , to_date('3/2/2019' , 'dd/mm/yy') , 'KhongHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHV' , 'S10014' , to_date('3/2/2019' , 'dd/mm/yy') , 'KhongHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHVI' , 'S10015' , to_date('3/2/2019' , 'dd/mm/yy') , 'Hay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHVIII' , 'S10010' , to_date('3/2/2019' , 'dd/mm/yy') , 'CucHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHIV' , 'S1006' , to_date('3/2/2019' , 'dd/mm/yy') , 'KhongHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHV' , 'S1009' , to_date('3/2/2019' , 'dd/mm/yy') , 'RatHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHIX' , 'S1003' , to_date('3/2/2019' , 'dd/mm/yy') , 'CucHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHVIII' , 'S10012' , to_date('3/2/2019' , 'dd/mm/yy') , 'Hay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHI' , 'S1007' , to_date('3/2/2019' , 'dd/mm/yy') , 'RatHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHVII' , 'S1006' , to_date('3/2/2019' , 'dd/mm/yy') , 'BinhThuong' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHIV' , 'S10010' , to_date('3/2/2019' , 'dd/mm/yy') , 'CucHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHIX' , 'S10010' , to_date('3/2/2019' , 'dd/mm/yy') , 'KhongHay' ); 
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHI' , 'S10016' , to_date('3/2/2019' , 'dd/mm/yy') , 'KhongHay' );  
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHII' , 'S10017' , to_date('4/2/2022' , 'dd/mm/yy') , 'BinhThuong' ); 
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHIII' , 'S10018' , to_date('23/3/2019' , 'dd/mm/yy') , 'Hay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHIV' , 'S10019' , to_date('1/1/2018' , 'dd/mm/yy') , 'RatHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHV' , 'S10020' , to_date('2/1/2020' , 'dd/mm/yy') , 'CucHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHVI' , 'S10021' , to_date('2/5/2021' , 'dd/mm/yy') , 'KhongHay' ); 
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHVII' , 'S10022' , to_date('4/2/2022' , 'dd/mm/yy') , 'Hay' ); 
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHVIII' , 'S10023' , to_date('4/7/2018' , 'dd/mm/yy') , 'BinhThuong' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHIX' , 'S10024' , to_date('5/2/2020' , 'dd/mm/yy') , 'Hay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHX' , 'S10025' , to_date('5/6/2018' , 'dd/mm/yy') , 'RatHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHI' , 'S10026' , to_date('6/3/2019' , 'dd/mm/yy') , 'CucHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHII' , 'S10024' , to_date('7/4/2020' , 'dd/mm/yy') , 'KhongHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHIII' , 'S10025' , to_date('8/5/2021' , 'dd/mm/yy') , 'BinhThuong' );  
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHIV' , 'S10026' , to_date('9/6/2022' , 'dd/mm/yy') , 'Hay' ); 
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHV' , 'S10027' , to_date('10/7/2018' , 'dd/mm/yy') , 'RatHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHVI' , 'S10028' , to_date('11/8/2019' , 'dd/mm/yy') , 'CucHay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHVII' , 'S10029' , to_date('12/9/2020' , 'dd/mm/yy') , 'Hay' );
insert into danhgia ( MaKH , MaSach , Ngaydanhgia , Loidanhgia ) 
  values ('KHVIII' , 'S10030' , to_date('13/10/2021' , 'dd/mm/yy') , 'Hay' ); 

--- Nhap du lieu bang  HOADON
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD001', to_date ('2/2/2020' , 'dd/mm/yy') , 34000 , '23A101', 'KHI' , 'CKJA');
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD002', to_date ('2/3/2020' , 'dd/mm/yy') , 50000 , '23A102', 'KHIII' , 'CKJB'); 
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD003', to_date ('20/5/2020' , 'dd/mm/yy') , 550000 , '23A103', 'KHII' , 'CKJC'); 
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD004', to_date ('4/7/2021' , 'dd/mm/yy') , 490000 , '23A104', 'KHIV' , 'CKJD');
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD005', to_date ('2/2/2020' , 'dd/mm/yy') , 520000 , '23A105', 'KHV' , 'CKJJ');  
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD006', to_date ('25/9/2022' , 'dd/mm/yy') , 78000 , '23A106', 'KHVI' , 'CKJI'); 
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD007', to_date ('23/2/2021' , 'dd/mm/yy') , 89000 , '23A107', 'KHVII' , 'CKJG');  
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD008', to_date ('20/5/2020' , 'dd/mm/yy') , 90000 , '23A108', 'KHVIII' , 'CKJH'); 
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD009', to_date ('2/8/2021' , 'dd/mm/yy') , 73000 ,  '23A109', 'KHIX' , 'CKJF'); 
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0010', to_date ('3/5/2022' , 'dd/mm/yy') , 89000 , '23A1010', 'KHX' , 'CKJE'); 
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0011', to_date ('3/9/2019' , 'dd/mm/yy') , 99000 , '23A101', 'KHII' , 'CKJB'); 
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0012', to_date ('20/2/2019' , 'dd/mm/yy') , 102000 , '23A101', 'KHIII' , 'CKJC');
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0013', to_date ('20/5/2019' , 'dd/mm/yy') , 334000 , '23A106', 'KHIX' , 'CKJH');  
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0014', to_date ('30/3/2018' , 'dd/mm/yy') , 23000 , '23A108', 'KHV' , 'CKJC');  
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0015', to_date ('20/9/2022' , 'dd/mm/yy') , 69000 , '23A106', 'KHVI' , 'CKJF');
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0016', to_date ('30/3/2022' , 'dd/mm/yy') , 78000 , '23A104', 'KHII' , 'CKJG');  
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0017', to_date ('25/2/2019' , 'dd/mm/yy') , 88000 , '23A106', 'KHX' , 'CKJJ');  
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0018', to_date ('25/2/2020' , 'dd/mm/yy') , 56000 , '23A1010', 'KHVIII' , 'CKJD');  
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0019', to_date ('29/5/2021' , 'dd/mm/yy') , 94000 , '23A108', 'KHIV' , 'CKJE');  
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0020', to_date ('20/2/2018' , 'dd/mm/yy') , 10000 , '23A105', 'KHIII' , 'CKJC');  
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0021', to_date ('13/1/2018' , 'dd/mm/yy') , 190000 , '23A1010', 'KHV' , 'CKJC');
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0022', to_date ('14/2/2019' , 'dd/mm/yy') , 120000 , '23A101', 'KHVI' , 'CKJD');
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0023', to_date ('15/3/2020' , 'dd/mm/yy') , 34000 , '23A102', 'KHVII' , 'CKJE');
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0024', to_date ('16/4/2021' , 'dd/mm/yy') , 56000 , '23A103', 'KHVIII' , 'CKJF');
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0025', to_date ('17/5/2022' , 'dd/mm/yy') , 190000 , '23A104', 'KHIX' , 'CKJA');
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0026', to_date ('19/6/2018' , 'dd/mm/yy') , 89000 , '23A105', 'KHX' , 'CKJB');
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0027', to_date ('20/7/2019' , 'dd/mm/yy') , 35000 , '23A106', 'KHI' , 'CKJC');
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0028', to_date ('21/8/2020' , 'dd/mm/yy') , 104000 , '23A107', 'KHII' , 'CKJD');
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0029', to_date ('22/9/2021' , 'dd/mm/yy') , 234000 , '23A108', 'KHIII' , 'CKJE');
insert into hoadon (MaHD , Ngaylap , TongTien , MaNV , MaKH , MaCK ) 
  values ( 'HD0030', to_date ('23/10/2022' , 'dd/mm/yy') , 144000 , '23A108', 'KHI' , 'CKJG');

---Nhap du lieu bang CHITIETHOADON 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1001' , 'HD001' , 23  );
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1002' , 'HD001' , 12  );  
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1003' , 'HD001' , 14  );  
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1004' , 'HD001' , 19  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1005' , 'HD001' , 23  );  
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1003' , 'HD002' , 2  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1007' , 'HD002' , 2  );
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1008' , 'HD003' , 7  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1009' , 'HD004' , 4  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10010' , 'HD005' , 2  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10011' , 'HD005' , 9  );   
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10012' , 'HD005' , 7  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10013' , 'HD006' , 27  );  
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10014' , 'HD006' , 21  );  
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10012' , 'HD007' , 15  );   
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10011' , 'HD008' , 11  );  
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10014' , 'HD009' , 12  );  
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1009' , 'HD0010' , 21  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1007' , 'HD0011' , 5  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1002' , 'HD0011' , 3  );  
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1009' , 'HD0011' , 9  );  
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1004' , 'HD0012' , 4  );  
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1007' , 'HD0013' , 1  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1005' , 'HD0014' , 28  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10011' , 'HD0014' , 24 );  
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10013' , 'HD0015' , 17  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10011' , 'HD0016' , 14  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1001' , 'HD0017' , 21   ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1002' , 'HD0018' , 13  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10023' , 'HD0018' , 10  );
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1009' , 'HD0018' , 9 );
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1004' , 'HD0019' , 7  );  
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S1008' , 'HD0020' , 4  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10016' , 'HD0021' , 4  );  
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10017' , 'HD0022' , 8  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10018' , 'HD0023' , 10  );  
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10019' , 'HD0024' , 11  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10020' , 'HD0025' , 3  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10021' , 'HD0026' , 6  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10022' , 'HD0027' , 4  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10026' , 'HD0028' , 8  );  
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10024' , 'HD0029' , 11  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10025' , 'HD0030' , 3  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10026' , 'HD001' , 3  );
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10027' , 'HD0030' , 13  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10028' , 'HD0023' , 2  );
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10029' , 'HD0025' , 5  );
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10030' , 'HD0027' , 8  );
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10021' , 'HD0029' , 7  );
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10024' , 'HD004' , 3  ); 
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10026' , 'HD003' , 5  );  
insert into chitiethoadon ( MaSach , MaHD , SLBan  ) 
  values ( 'S10025' , 'HD0014' , 2  );  
  
--------------------------------------------------------------------------------
----- 10 câu truy van KHACH HANG hay su dung 
--- 1. Cho biet cac masach , tensach , giasach co loi danh gia la 'Hay' 'RatHay' 'CucHay' 
SELECT MaSach , TenSach , GiaSach , LoiDanhGia
FROM Sach JOIN DanhGia USING ( MaSach ) 
WHERE loidanhgia IN ( 'Hay' , 'RatHay' , 'CucHay');

--- 2. Cho biet thong tin hoa don ma khach hang ten 'Le Thanh Huong' da mua 
SELECT MaHD , NgayLap , TongTien , MaNV , MaKH , MaCK 
FROM HoaDon JOIN KhachHang USING ( MaKH ) 
WHERE TenKH = 'Le Thanh Huong';

--- 3. Cho biet thong tin cac sach tac gia 'Vu Thi Binh' da viet trong nam 2003
SELECT MaSach , TenSach , GiaSach , MaTG , MaTheLoai , MaNXB
FROM SACH JOIN TACGIA USING (MaTG) 
WHERE EXTRACT ( year from sach.namxb ) = '2003' AND TenTG = 'Vu Thi Binh' ;

--- 4. Cho biet masach , tensach cac sach chua ban duoc 
SELECT MaSach , TenSach 
FROM SACH 
WHERE MaSach NOT IN ( SELECT MaSach FROM ChiTietHoaDon ) ;

--- 5. cho biet thong tin ma chiet khau giam gia duoc nhieu nhat
SELECT MaCK , TenCK , PhanTramCK 
FROM ChietKhau 
WHERE PhanTramCK IN ( SELECT Max (PhanTramCK ) FROM ChietKhau ) ;

--- 6. Cho biet thong tin cua cac nhan vien lap hoa don cho khach hang co ten 'Le Thi Huyen'
SELECT NhanVien.MaNV , TenNV , DiaChiNV , SdtNV 
FROM HoaDon 
INNER JOIN NhanVien ON HoaDon.MaNV = NhanVien.MaNV 
INNER JOIN KhachHang ON HoaDon.MaKH = KhachHang.MaKH 
WHERE TenKH = 'Le Thi Huyen';
              
--- 7. cho biet so lan danh gia cua sach có ma 'S1006'
SELECT tensach , COUNT ( loidanhgia ) " tongsolandanhgia"
FROM danhgia JOIN sach USING (masach)
WHERE masach = 'S1006'
GROUP BY tensach ;

--- 8. Cho biet ten cac the loai nha xuat ban tu phap cung cap 
SELECT DISTINCT TenTheLoai 
FROM Sach 
INNER JOIN TheLoai ON Sach.MaTheLoai = TheLoai.MaTheLoai
INNER JOIN NhaXuatBan ON Sach.MaNXB = NhaXuatBan.MaNXB 
WHERE TenNXB = 'tuphap';

--- 9. Cho biet thong tin sach co gia ban lon nhat 
SELECT Sach.MaSach , TenSach ,GiaSach , NamXB , MaTG , MaTheLoai , MaNXB 
FROM Sach
WHERE GiaSach >= ALL ( SELECT GiaSach FROM Sach ) ;

--- 10. Cho biet tong so luong sach da ban cua cuon sach 'doraemon'
SELECT TenSach , SUM (SLBan) "tong so luong ban" 
FROM ChiTietHoaDon JOIN Sach USING (MaSach)
WHERE TenSach = 'doraemon'
GROUP BY TenSach;

drop table chitiethoadon ;1
drop table tacgia ;1
drop table theloai ;1
drop table nhaxuatban ;1
drop table chietkhau ;1
drop table nhanvien ;1
drop table khachhang ;1
drop table hoadon ;1
drop table sach ;1
drop table danhgia ;1


DROP TABLE TACGIA  CASCADE CONSTRAINTS
DROP TABLE SACH  CASCADE CONSTRAINTS
DROP TABLE THELOAI  CASCADE CONSTRAINTS
DROP TABLE NHAXUATBAN  CASCADE CONSTRAINTS
DROP TABLE CHITIETHOADON  CASCADE CONSTRAINTS
DROP TABLE HOADON  CASCADE CONSTRAINTS
DROP TABLE KHACHHANG  CASCADE CONSTRAINTS
DROP TABLE DANHGIA  CASCADE CONSTRAINTS
DROP TABLE CHIETKHAU  CASCADE CONSTRAINTS
DROP TABLE NHANVIEN  CASCADE CONSTRAINTS
-------------------------------------------------------------------------------
----- 10 yêu c?u NGIEP VU ch?c n?ng phù h?p
--1  nhap vao ho ten cua mot nhan vien cho biet nhan vien do co trong CSDL ko ?
SET SERVEROUTPUT ON
DECLARE
    ten_nhan_vien  NHANVIEN.TenNV%TYPE;
    thong_bao nvarchar2(30);
BEGIN
    ten_nhan_vien := '&ten_nhan_vien';
    FOR item IN (Select TenNV from NHANVIEN)
    LOOP
        IF(ten_nhan_vien = item.TenNV)then thong_bao := 'Co ton tai'; exit;
        ELSE thong_bao := 'Khong ton tai'; 
        END IF;
    END LOOP;
    dbms_output.put_line('Thong bao:' || thong_bao);
END;

--TenNV: Ho Ngoc Ha

--2 Nhap vao ten tac gia cho biet ten sach cua ho 
SET SERVEROUTPUT ON
DECLARE
    ten_sach NVARCHAR2(20);
    ten_tac_gia NVARCHAR2(20);
BEGIN 
    ten_tac_gia :='&ten_tac_gia';
    FOR item IN (
       SELECT TenSach 
       INTO ten_sach
       FROM tacgia JOIN sach USING ( matg) 
       WHERE TenTG = ten_tac_gia )
    LOOP
       dbms_output.put_line('ten tac gia la ' || ten_tac_gia || ', ten sach la ' || item.tensach);
    END LOOP;
END;

--TenTG: Bui Hai Ngoc

--3 Nhap vao ten khach hang cho biet tong so hoa don cua khach da mua 
SET SERVEROUTPUT ON  
DECLARE 
   ten_khach_hang nvarchar2(30) ;
   tong_so_hoa_don nvarchar2(30);
BEGIN 
   ten_khach_hang := '&ten_khach_hang';
   SELECT COUNT( mahd )
   INTO tong_so_hoa_don 
   FROM hoadon JOIN khachhang USING ( makh ) 
   WHERE tenkh = ten_khach_hang ;
   dbms_output.put_line(' Ten khach la ' || ten_khach_hang || ', Tong so hoa don la : ' || tong_so_hoa_don );
END ;

--TenKH: Nguyen Van An

--4 Them mot nhan vien moi vao bang nhan vien 
DECLARE 
    rownv nhanvien%rowtype ; 
BEGIN 
    rownv .MaNV :=&MaNV ;
    rownv .TenNV :=&TenNV ;
    rownv .DiachiNV :=&DiachiNV ; 
    rownv .SdtNV :=&SdtNV ;
    INSERT INTO nhanvien(MaNV,TenNV,DiachiNV,SdtNV)
    VALUES(rownv .MaNV , rownv .TenNV , rownv .DiachiNV , rownv .SdtNV);
END;

--5 cho biet danh sach cac nhan vien co que o noi nhap vao 
SET SERVEROUTPUT ON
DECLARE
    dia_chi_nv nvarchar2(30);
BEGIN
    dia_chi_nv := '&dia_chi_nv';
    FOR item IN( SELECT manv,tennv FROM nhanvien WHERE diachinv = dia_chi_nv)
    LOOP
       DBMS_OUTPUT.PUT_LINE('Nhan vien co ma nhan vien la : '|| item.manv|| ', ten la :'|| item.tennv);
    END LOOP;
END;

--DiaChiNV: ThanhXuan BacNinh

--6 cho danh sach cac hoa don da lap trong nam 2020 
SET SERVEROUTPUT ON
BEGIN
   FOR item IN (
     SELECT mahd,ngaylap 
     FROM hoadon 
     WHERE EXTRACT ( YEAR FROM ngaylap)=2020)
   LOOP
      DBMS_OUTPUT.PUT_LINE('Danh sach hoa don lap nam 2020 la  : '||item.mahd||item.ngaylap);
   END LOOP;
END;

--- 7. Nhap vao ma chiet khau cho biet so luong hoa don co chua ma chiet khau do
CREATE OR REPLACE FUNCTION
  Tong_HD(ck chietkhau.mack%type)
  RETURN NUMBER
  AS so NUMBER;
BEGIN
  SELECT COUNT (MaHD) INTO so FROM hoadon JOIN chietkhau USING ( mack )
  WHERE mack=ck;
  RETURN so;
END;
----- thuc thi
  SELECT Tong_HD('&ck')FROM dual;
  --MaCK: CKJA

--- 8. Chuong trinh tra ve danh sach nhung quyen Sach duoc xuat ban nam 2003
SET SERVEROUTPUT ON 
CREATE OR REPLACE PROCEDURE ds_s 
IS
BEGIN
   FOR item IN(SELECT masach , tensach  FROM sach WHERE EXTRACT(YEAR FROM namxb)=2003)
   LOOP
      dbms_output.put_line('sach xuat ban nam 2003 co ma la : ' ||item.masach||' ten sach la: '||item.tensach);
   END LOOP;
END;
--- THUC THI
  EXEC ds_s;

--- 9. Dem so sach da ban cua ma sach nhap vao 
CREATE OR REPLACE FUNCTION 
  dem_s( ms Sach.MaSach%TYPE)
  RETURN NUMBER
  AS TongSoLuong NUMBER;
BEGIN
  SELECT SUM (SLBan)INTO TongSoLuong  FROM chitiethoadon  WHERE MaSach=ms;
  RETURN TongSoLuong;
END;
--- THUCTHI
    SELECT dem_s('S10012') FROM dual;
    
--- 10. Tao trigger hien thi ra thông báo moi khi có su thay doi trên bang hoa don 
CREATE OR REPLACE TRIGGER test_hoa_don 
    BEFORE 
       INSERT OR
       UPDATE OF MaHD OR
       UPDATE OF NgayLap OR
       UPDATE OF TongTien OR
       UPDATE OF MaNV OR
       UPDATE OF MaKH OR 
       UPDATE OF MaCK OR
       DELETE
    ON HoaDon
BEGIN 
  CASE 
    WHEN INSERTING THEN 
      DBMS_OUTPUT.PUT_LINE('INSERTING bang hoa don');
    WHEN UPDATING ('MaHD') THEN 
      DBMS_OUTPUT.PUT_LINE('UPDATING MaHD cua bang hoa don');
    WHEN UPDATING ('NgayLap') THEN 
      DBMS_OUTPUT.PUT_LINE('UPDATING NgayLap cua bang hoa don');
    WHEN UPDATING ('TongTien') THEN 
      DBMS_OUTPUT.PUT_LINE('UPDATING TongTien cua bang hoa don');
    WHEN UPDATING ('MaNV') THEN 
      DBMS_OUTPUT.PUT_LINE('UPDATING MaKH cua bang hoa don');
    WHEN UPDATING ('MaCK') THEN 
      DBMS_OUTPUT.PUT_LINE('UPDATING MaCK cua bang hoa don');
    WHEN DELETING THEN 
      DBMS_OUTPUT.PUT_LINE('DELETING bang hoa don');
END CASE ;
END ;
          
        



