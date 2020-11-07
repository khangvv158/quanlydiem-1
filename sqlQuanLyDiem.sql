﻿create database QL_Diem

use QL_Diem
GO

CREATE TABLE [dbo].[PHANQUYEN] (MaPhanQuyen INT PRIMARY KEY NOT NULL,TenPhanQuyen NVARCHAR (MAX) NULL)

CREATE TABLE [dbo].[GIAOVIEN] (MaGV NCHAR(20) PRIMARY KEY NOT NULL, TenGV NVARCHAR (MAX) NULL,NgaySinh DATETIME,GioiTinh NVARCHAR(20),SoDienThoai NVARCHAR(20),DiaChi NVARCHAR(MAX),HinhAnh NVARCHAR(MAX))

CREATE TABLE [dbo].[TAIKHOAN] (MaTK INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,TaiKhoan NCHAR(30) NULL,MatKhau NCHAR (30) NULL,MaPhanQuyen INT REFERENCES PHANQUYEN NOT NULL,MaGV NCHAR(20) REFERENCES GIAOVIEN NOT NULL)

CREATE TABLE [dbo].[KHOILOP] (MaKhoi NCHAR(20) PRIMARY KEY NOT NULL, TenKhoi NVARCHAR (100) NULL)

CREATE TABLE [dbo].[NAMHOC] (MaNamHoc NCHAR(20) PRIMARY KEY,TenNamHoc NVARCHAR(50))

CREATE TABLE [dbo].[LOP] (MaLop NCHAR(20) PRIMARY KEY NOT NULL,TenLop NVARCHAR(MAX) NULL,MaGV NCHAR(20) REFERENCES GIAOVIEN NOT NULL,MaKhoi NCHAR(20) REFERENCES KHOILOP NOT NULL,MaNamHoc NCHAR(20) REFERENCES NAMHOC)

CREATE TABLE [dbo].[HOCSINH] (MaHS NCHAR(20) PRIMARY KEY NOT NULL, TenHS NVARCHAR(MAX) NULL, MaLop NCHAR(20) REFERENCES LOP NOT NULL,NgaySinh DATETIME NULL,GioiTinh NVARCHAR (20) NULL,DiaChi NVARCHAR (MAX) NULL,HinhAnh NVARCHAR(MAX))

CREATE TABLE [dbo].[MONHOC] (MaMH NCHAR(20) PRIMARY KEY NOT NULL,TenMH NVARCHAR (MAX) NULL)

CREATE TABLE [dbo].[HOCKY] (MaHK NCHAR(5) PRIMARY KEY,TenHK NVARCHAR(20))

CREATE TABLE [dbo].[BANGDIEM] (MaBD INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,MaHS NCHAR(20) REFERENCES HOCSINH NOT NULL,MaMH NCHAR(20) REFERENCES MONHOC NOT NULL, DiemMieng NUMERIC(18) NULL, Diem15Phut NUMERIC(18) NULL,Diem1Tiet NUMERIC(18) NULL,DiemHK NUMERIC(18) NULL,MaHK NCHAR(5) REFERENCES HOCKY)

INSERT INTO PHANQUYEN VALUES(1,'Admin')
INSERT INTO PHANQUYEN VALUES(2,'Giao Vien')

INSERT INTO HOCKY VALUES ('HK1',N'Học Kỳ I')
INSERT INTO HOCKY VALUES ('HK2',N'Học Kỳ II')

INSERT INTO GIAOVIEN VALUES ('admin','admin','','','','','')
INSERT INTO GIAOVIEN VALUES ('GV01',N'Võ Văn Khang',CONVERT(datetime,'15/08/1999',103),'Nam','0123456789',N'Quảng Nam','')

INSERT INTO TAIKHOAN VALUES('admin','admin',1,'admin')
INSERT INTO TAIKHOAN VALUES('khang','123456',2,'GV01')

INSERT INTO KHOILOP VALUES('KH01',N'Khối lớp 10')
INSERT INTO KHOILOP VALUES('KH02',N'Khối lớp 11')
INSERT INTO KHOILOP VALUES('KH03',N'Khối lớp 12')

SELECT * FROM GIAOVIEN
SELECT * FROM TAIKHOAN

