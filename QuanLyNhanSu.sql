USE [master]
GO
/****** Object:  Database [QuanLyNhanSu]    Script Date: 2020-12-22 4:16:10 PM ******/
CREATE DATABASE [QuanLyNhanSu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyNhanSu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuanLyNhanSu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyNhanSu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuanLyNhanSu_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyNhanSu] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyNhanSu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyNhanSu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyNhanSu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyNhanSu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyNhanSu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyNhanSu] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyNhanSu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyNhanSu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyNhanSu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyNhanSu] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyNhanSu] SET QUERY_STORE = OFF
GO
USE [QuanLyNhanSu]
GO
/****** Object:  Table [dbo].[BaoHiemNhanVien]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaoHiemNhanVien](
	[MaNhanVien] [varchar](20) NOT NULL,
	[MaBaoHiem] [varchar](20) NOT NULL,
	[NgayBatDau] [date] NULL,
	[NgayHetHan] [date] NULL,
	[SoTienDongMotThang] [int] NULL,
 CONSTRAINT [FK_BaoHiemNhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC,
	[MaBaoHiem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHMUCBAOHIEM]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUCBAOHIEM](
	[MaBaoHiem] [varchar](20) NOT NULL,
	[Ten] [nvarchar](40) NULL,
	[TiLeBH] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBaoHiem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMucChucVu]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMucChucVu](
	[MaChucVu] [varchar](20) NOT NULL,
	[Ten] [nvarchar](40) NULL,
	[PhuCap] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHMUCHINHTHUCTUYENDUNG]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUCHINHTHUCTUYENDUNG](
	[MaHinhThucTuyenDung] [varchar](20) NOT NULL,
	[Ten] [nvarchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHinhThucTuyenDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMucNhanVien]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMucNhanVien](
	[MaNhanVien] [varchar](20) NOT NULL,
	[MaHinhThucTuyenDung] [varchar](20) NULL,
	[MaChucVu] [varchar](20) NULL,
	[MaPhongBan] [varchar](20) NULL,
	[NoiLamViec] [nvarchar](40) NULL,
	[HoTen] [nvarchar](40) NULL,
	[NgaySinh] [date] NULL,
	[QueQuan] [nvarchar](40) NULL,
	[GioiTinh] [nvarchar](4) NULL,
	[SoCMND] [varchar](40) NULL,
	[TrinhDo] [nvarchar](40) NULL,
	[SDT] [varchar](40) NULL,
	[Email] [nvarchar](40) NULL,
	[NoiO] [nvarchar](40) NULL,
	[NoiSinh] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhSachKTKL]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhSachKTKL](
	[MaNhanVien] [varchar](20) NOT NULL,
	[MaKTKL] [varchar](20) NOT NULL,
	[Ngay] [date] NOT NULL,
	[GhiChu] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HopDong]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HopDong](
	[MaHD] [varchar](10) NOT NULL,
	[MaNhanVien] [varchar](20) NOT NULL,
	[LuongHD] [int] NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LuongNhanVien]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LuongNhanVien](
	[MaLuong] [varchar](20) NOT NULL,
	[MaNhanVien] [varchar](20) NOT NULL,
	[LuongHD] [int] NULL,
	[SoNgayCong] [int] NULL,
	[ThangNam] [varchar](10) NOT NULL,
	[TienBH] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[MaPhongBan] [varchar](20) NOT NULL,
	[Ten] [nvarchar](50) NULL,
	[DienThoai] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhongBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuyDinhKTKL]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyDinhKTKL](
	[MaKTKL] [varchar](20) NOT NULL,
	[Ten] [nvarchar](50) NULL,
	[SoTien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKTKL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[Ten] [varchar](10) NULL,
	[MK] [varchar](10) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[BaoHiemNhanVien] ([MaNhanVien], [MaBaoHiem], [NgayBatDau], [NgayHetHan], [SoTienDongMotThang]) VALUES (N'01', N'BH01', CAST(N'2019-05-06' AS Date), CAST(N'2024-05-29' AS Date), 560000)
INSERT [dbo].[BaoHiemNhanVien] ([MaNhanVien], [MaBaoHiem], [NgayBatDau], [NgayHetHan], [SoTienDongMotThang]) VALUES (N'01', N'BH02', CAST(N'2019-05-06' AS Date), CAST(N'2024-05-29' AS Date), 105000)
INSERT [dbo].[BaoHiemNhanVien] ([MaNhanVien], [MaBaoHiem], [NgayBatDau], [NgayHetHan], [SoTienDongMotThang]) VALUES (N'02', N'BH02', CAST(N'2020-01-06' AS Date), CAST(N'2025-02-06' AS Date), 135000)
INSERT [dbo].[BaoHiemNhanVien] ([MaNhanVien], [MaBaoHiem], [NgayBatDau], [NgayHetHan], [SoTienDongMotThang]) VALUES (N'03', N'BH02', CAST(N'2020-03-19' AS Date), CAST(N'2025-04-06' AS Date), 180000)
INSERT [dbo].[BaoHiemNhanVien] ([MaNhanVien], [MaBaoHiem], [NgayBatDau], [NgayHetHan], [SoTienDongMotThang]) VALUES (N'03', N'BH03', CAST(N'2019-12-06' AS Date), CAST(N'2024-02-17' AS Date), 120000)
INSERT [dbo].[BaoHiemNhanVien] ([MaNhanVien], [MaBaoHiem], [NgayBatDau], [NgayHetHan], [SoTienDongMotThang]) VALUES (N'04', N'BH02', CAST(N'2020-03-19' AS Date), CAST(N'2025-04-06' AS Date), 118500)
INSERT [dbo].[BaoHiemNhanVien] ([MaNhanVien], [MaBaoHiem], [NgayBatDau], [NgayHetHan], [SoTienDongMotThang]) VALUES (N'05', N'BH02', CAST(N'2020-03-06' AS Date), CAST(N'2025-04-06' AS Date), 135000)
INSERT [dbo].[BaoHiemNhanVien] ([MaNhanVien], [MaBaoHiem], [NgayBatDau], [NgayHetHan], [SoTienDongMotThang]) VALUES (N'06', N'BH02', CAST(N'2020-03-06' AS Date), CAST(N'2025-04-06' AS Date), 82500)
INSERT [dbo].[DANHMUCBAOHIEM] ([MaBaoHiem], [Ten], [TiLeBH]) VALUES (N'BH01', N'Bảo hiểm xã hội', 0.08)
INSERT [dbo].[DANHMUCBAOHIEM] ([MaBaoHiem], [Ten], [TiLeBH]) VALUES (N'BH02', N'Bảo hiểm y tế', 0.015)
INSERT [dbo].[DANHMUCBAOHIEM] ([MaBaoHiem], [Ten], [TiLeBH]) VALUES (N'BH03', N'Bảo hiểm thất nghiệp', 0.01)
INSERT [dbo].[DanhMucChucVu] ([MaChucVu], [Ten], [PhuCap]) VALUES (N'CV01', N'Truong phong', 3000000)
INSERT [dbo].[DanhMucChucVu] ([MaChucVu], [Ten], [PhuCap]) VALUES (N'CV02', N'To truong', 2000000)
INSERT [dbo].[DanhMucChucVu] ([MaChucVu], [Ten], [PhuCap]) VALUES (N'CV03', N'Nhan vien kinh doanh', 1000000)
INSERT [dbo].[DanhMucChucVu] ([MaChucVu], [Ten], [PhuCap]) VALUES (N'CV04', N'Nhan vien tai chinh', 900000)
INSERT [dbo].[DanhMucChucVu] ([MaChucVu], [Ten], [PhuCap]) VALUES (N'CV05', N'Nhan vien hau can', 500000)
INSERT [dbo].[DanhMucChucVu] ([MaChucVu], [Ten], [PhuCap]) VALUES (N'CV06', N'Nhan vien bảo vệ', 500000)
INSERT [dbo].[DANHMUCHINHTHUCTUYENDUNG] ([MaHinhThucTuyenDung], [Ten]) VALUES (N'TD01', N'Tuyen dung tren website cong ty')
INSERT [dbo].[DANHMUCHINHTHUCTUYENDUNG] ([MaHinhThucTuyenDung], [Ten]) VALUES (N'TD02', N'Qua cac website tuyen dung')
INSERT [dbo].[DANHMUCHINHTHUCTUYENDUNG] ([MaHinhThucTuyenDung], [Ten]) VALUES (N'TD03', N'Tuyen dung qua mang xa hoi')
INSERT [dbo].[DANHMUCHINHTHUCTUYENDUNG] ([MaHinhThucTuyenDung], [Ten]) VALUES (N'TD04', N'Tuyển dụng trực tiếp qua các trường')
INSERT [dbo].[DanhMucNhanVien] ([MaNhanVien], [MaHinhThucTuyenDung], [MaChucVu], [MaPhongBan], [NoiLamViec], [HoTen], [NgaySinh], [QueQuan], [GioiTinh], [SoCMND], [TrinhDo], [SDT], [Email], [NoiO], [NoiSinh]) VALUES (N'01', N'TD01', N'CV01', N'PB01', N'Tang2', N'Nguyen Mai Linh', CAST(N'1980-03-10' AS Date), N'Tay Ho- Ha Noi', N'Nữ', N'187823193', N'Thac si', N'685458206', N'nguyenmailinh@gmail.com', N'Tay Ho - Ha Noi', N'Ba Dinh - Ha Noi')
INSERT [dbo].[DanhMucNhanVien] ([MaNhanVien], [MaHinhThucTuyenDung], [MaChucVu], [MaPhongBan], [NoiLamViec], [HoTen], [NgaySinh], [QueQuan], [GioiTinh], [SoCMND], [TrinhDo], [SDT], [Email], [NoiO], [NoiSinh]) VALUES (N'02', N'TD04', N'CV03', N'PB03', N'Tang3', N'Nguyen Dinh Huy', CAST(N'1972-02-13' AS Date), N'Do Luong - Nghe An', N'Nam', N'187598246', N'12/12', N'985426525', N'nguyendinhhuy@gmail.com', N'Tay Ho - Ha Noi', N'Bac Tu Liem - Ha Noi')
INSERT [dbo].[DanhMucNhanVien] ([MaNhanVien], [MaHinhThucTuyenDung], [MaChucVu], [MaPhongBan], [NoiLamViec], [HoTen], [NgaySinh], [QueQuan], [GioiTinh], [SoCMND], [TrinhDo], [SDT], [Email], [NoiO], [NoiSinh]) VALUES (N'03', N'TD02', N'CV02', N'PB02', N'Tang4', N'Le Huy Khai', CAST(N'1990-05-05' AS Date), N'Ba Dinh - Ha Noi', N'Nam', N'185845962', N'12/12', N'985745268', N'lehuykhai@gmail.com', N'Thanh Chuong - Nghe An', N'Ba Dinh - Ha Noi')
INSERT [dbo].[DanhMucNhanVien] ([MaNhanVien], [MaHinhThucTuyenDung], [MaChucVu], [MaPhongBan], [NoiLamViec], [HoTen], [NgaySinh], [QueQuan], [GioiTinh], [SoCMND], [TrinhDo], [SDT], [Email], [NoiO], [NoiSinh]) VALUES (N'04', N'TD01', N'CV04', N'PB02', N'Tang4', N'Dinh Thu Huong', CAST(N'1985-03-10' AS Date), N'Tu Ky - Hai Duong', N'Nữ', N'175935945', N'Thac si', N'985553812', N'dinhthuhuong@gmail.com', N'Cau Giay - Ha Noi', N'Tu Ky - Hai Duong')
INSERT [dbo].[DanhMucNhanVien] ([MaNhanVien], [MaHinhThucTuyenDung], [MaChucVu], [MaPhongBan], [NoiLamViec], [HoTen], [NgaySinh], [QueQuan], [GioiTinh], [SoCMND], [TrinhDo], [SDT], [Email], [NoiO], [NoiSinh]) VALUES (N'05', N'TD03', N'CV03', N'PB03', N'Tang3', N'Nguyen Dinh Hung', CAST(N'1991-07-11' AS Date), N' Ha Dong- Ha Noi', N'Nam', N'188298462', N'12/12', N'985426854', N'nguyendinhhung@gmail.com', N'Ha Dong - Ha Noi', N'Ha Dong-Ha Noi')
INSERT [dbo].[DanhMucNhanVien] ([MaNhanVien], [MaHinhThucTuyenDung], [MaChucVu], [MaPhongBan], [NoiLamViec], [HoTen], [NgaySinh], [QueQuan], [GioiTinh], [SoCMND], [TrinhDo], [SDT], [Email], [NoiO], [NoiSinh]) VALUES (N'06', N'TD02', N'CV05', N'PB05', N'Tang1', N'Nguyen Huong Linh', CAST(N'1980-03-10' AS Date), N'Loc Ha - Ha Tinh', N'Nữ', N'187395421', N'12/12', N'985126853', N'nguyenhuonglinh@gmail.com', N'Dong Da - Ha Noi', N'Loc Ha - Ha Tinh')
INSERT [dbo].[DanhMucNhanVien] ([MaNhanVien], [MaHinhThucTuyenDung], [MaChucVu], [MaPhongBan], [NoiLamViec], [HoTen], [NgaySinh], [QueQuan], [GioiTinh], [SoCMND], [TrinhDo], [SDT], [Email], [NoiO], [NoiSinh]) VALUES (N'07', N'TD04', N'CV02', N'PB03', N'Tang3', N'Nguyễn đức An', CAST(N'1972-02-13' AS Date), N'Do Luong - Nghe An', N'Nam', N'187598246', N'12/12', N'985426525', N'nguyendinhhuy@gmail.com', N'Tay Ho - Ha Noi', N'Bac Tu Liem - Ha Noi')
INSERT [dbo].[DanhMucNhanVien] ([MaNhanVien], [MaHinhThucTuyenDung], [MaChucVu], [MaPhongBan], [NoiLamViec], [HoTen], [NgaySinh], [QueQuan], [GioiTinh], [SoCMND], [TrinhDo], [SDT], [Email], [NoiO], [NoiSinh]) VALUES (N'08', N'TD02', N'CV04', N'PB02', N'Tang4', N'Lê Đức An', CAST(N'1990-05-05' AS Date), N'Ba Dinh - Ha Noi', N'Nam', N'185845962', N'12/12', N'985745268', N'lehuykhai@gmail.com', N'Thanh Chuong - Nghe An', N'Ba Dinh - Ha Noi')
INSERT [dbo].[DanhMucNhanVien] ([MaNhanVien], [MaHinhThucTuyenDung], [MaChucVu], [MaPhongBan], [NoiLamViec], [HoTen], [NgaySinh], [QueQuan], [GioiTinh], [SoCMND], [TrinhDo], [SDT], [Email], [NoiO], [NoiSinh]) VALUES (N'09', N'TD02', N'CV05', N'PB02', N'Tang4', N'Lê Đức Bình', CAST(N'1990-05-05' AS Date), N'Ba Dinh - Ha Noi', N'Nam', N'185845962', N'12/12', N'985745268', N'lehuykhai@gmail.com', N'Thanh Chuong - Nghe An', N'Ba Dinh - Ha Noi')
INSERT [dbo].[DanhSachKTKL] ([MaNhanVien], [MaKTKL], [Ngay], [GhiChu]) VALUES (N'01', N'KTKL02', CAST(N'2020-05-06' AS Date), N'NULL')
INSERT [dbo].[DanhSachKTKL] ([MaNhanVien], [MaKTKL], [Ngay], [GhiChu]) VALUES (N'04', N'KTKL01', CAST(N'2019-10-07' AS Date), N'NULL')
INSERT [dbo].[DanhSachKTKL] ([MaNhanVien], [MaKTKL], [Ngay], [GhiChu]) VALUES (N'01', N'KTKL05', CAST(N'2020-08-03' AS Date), N'NULL')
INSERT [dbo].[DanhSachKTKL] ([MaNhanVien], [MaKTKL], [Ngay], [GhiChu]) VALUES (N'02', N'KTKL03', CAST(N'2019-09-04' AS Date), N'NULL')
INSERT [dbo].[DanhSachKTKL] ([MaNhanVien], [MaKTKL], [Ngay], [GhiChu]) VALUES (N'03', N'KTKL04', CAST(N'2020-05-07' AS Date), N'NULL')
INSERT [dbo].[DanhSachKTKL] ([MaNhanVien], [MaKTKL], [Ngay], [GhiChu]) VALUES (N'04', N'KTKL04', CAST(N'2020-06-20' AS Date), N'NULL')
INSERT [dbo].[HopDong] ([MaHD], [MaNhanVien], [LuongHD], [NgayBatDau], [NgayKetThuc]) VALUES (N'HD01', N'01', 3000000, CAST(N'2019-05-07' AS Date), CAST(N'2024-05-29' AS Date))
INSERT [dbo].[HopDong] ([MaHD], [MaNhanVien], [LuongHD], [NgayBatDau], [NgayKetThuc]) VALUES (N'HD02', N'02', 8000000, CAST(N'2020-01-06' AS Date), CAST(N'2025-02-06' AS Date))
INSERT [dbo].[HopDong] ([MaHD], [MaNhanVien], [LuongHD], [NgayBatDau], [NgayKetThuc]) VALUES (N'HD03', N'03', 10000000, CAST(N'2019-12-06' AS Date), CAST(N'2024-02-17' AS Date))
INSERT [dbo].[HopDong] ([MaHD], [MaNhanVien], [LuongHD], [NgayBatDau], [NgayKetThuc]) VALUES (N'HD04', N'04', 7000000, CAST(N'2020-01-10' AS Date), CAST(N'2025-02-10' AS Date))
INSERT [dbo].[HopDong] ([MaHD], [MaNhanVien], [LuongHD], [NgayBatDau], [NgayKetThuc]) VALUES (N'HD05', N'05', 8000000, CAST(N'2020-03-06' AS Date), CAST(N'2025-04-06' AS Date))
INSERT [dbo].[HopDong] ([MaHD], [MaNhanVien], [LuongHD], [NgayBatDau], [NgayKetThuc]) VALUES (N'HD06', N'06', 5000000, CAST(N'2019-12-04' AS Date), CAST(N'2020-08-01' AS Date))
INSERT [dbo].[LuongNhanVien] ([MaLuong], [MaNhanVien], [LuongHD], [SoNgayCong], [ThangNam], [TienBH]) VALUES (N'L01', N'01', 5335000, 26, N'5/2018', 665000)
INSERT [dbo].[LuongNhanVien] ([MaLuong], [MaNhanVien], [LuongHD], [SoNgayCong], [ThangNam], [TienBH]) VALUES (N'L02', N'02', 8518846, 25, N'4/2017', 135000)
INSERT [dbo].[LuongNhanVien] ([MaLuong], [MaNhanVien], [LuongHD], [SoNgayCong], [ThangNam], [TienBH]) VALUES (N'L03', N'03', 10776923, 24, N'4/2017', 300000)
INSERT [dbo].[LuongNhanVien] ([MaLuong], [MaNhanVien], [LuongHD], [SoNgayCong], [ThangNam], [TienBH]) VALUES (N'L04', N'04', 7781500, 26, N'5/2019', 118500)
INSERT [dbo].[LuongNhanVien] ([MaLuong], [MaNhanVien], [LuongHD], [SoNgayCong], [ThangNam], [TienBH]) VALUES (N'L05', N'05', 8865000, 26, N'3/2020', 135000)
INSERT [dbo].[LuongNhanVien] ([MaLuong], [MaNhanVien], [LuongHD], [SoNgayCong], [ThangNam], [TienBH]) VALUES (N'L06', N'06', 4782884, 23, N'5/2019', 82500)
INSERT [dbo].[LuongNhanVien] ([MaLuong], [MaNhanVien], [LuongHD], [SoNgayCong], [ThangNam], [TienBH]) VALUES (N'L07', N'04', 7781500, 26, N'5/2019', 118500)
INSERT [dbo].[LuongNhanVien] ([MaLuong], [MaNhanVien], [LuongHD], [SoNgayCong], [ThangNam], [TienBH]) VALUES (N'L08', N'06', 4782884, 23, N'5/2019', 82500)
INSERT [dbo].[PhongBan] ([MaPhongBan], [Ten], [DienThoai]) VALUES (N'PB01', N'Phòng kỹ thuật', N'0658523365')
INSERT [dbo].[PhongBan] ([MaPhongBan], [Ten], [DienThoai]) VALUES (N'PB02', N'Phòng tài chính', N'0255448462')
INSERT [dbo].[PhongBan] ([MaPhongBan], [Ten], [DienThoai]) VALUES (N'PB03', N'Phòng đào tạo', N'0958245856')
INSERT [dbo].[PhongBan] ([MaPhongBan], [Ten], [DienThoai]) VALUES (N'PB04', N'Phòng quản lý', N'0859245325')
INSERT [dbo].[PhongBan] ([MaPhongBan], [Ten], [DienThoai]) VALUES (N'PB05', N'Phòng thanh tra', N'0752692545')
INSERT [dbo].[QuyDinhKTKL] ([MaKTKL], [Ten], [SoTien]) VALUES (N'KTKL01', N'Thưởng thâm niên', 1000000)
INSERT [dbo].[QuyDinhKTKL] ([MaKTKL], [Ten], [SoTien]) VALUES (N'KTKL02', N'Thưởng tháng lương', 600000)
INSERT [dbo].[QuyDinhKTKL] ([MaKTKL], [Ten], [SoTien]) VALUES (N'KTKL03', N'Thưởng lễ', 200000)
INSERT [dbo].[QuyDinhKTKL] ([MaKTKL], [Ten], [SoTien]) VALUES (N'KTKL04', N'Thưởng thâm niên', 1000000)
INSERT [dbo].[QuyDinhKTKL] ([MaKTKL], [Ten], [SoTien]) VALUES (N'KTKL05', N'Phạt đi muộn', 100000)
INSERT [dbo].[QuyDinhKTKL] ([MaKTKL], [Ten], [SoTien]) VALUES (N'KTKL06', N'Phạt vi phạm quy định', 500000)
INSERT [dbo].[TaiKhoan] ([Ten], [MK]) VALUES (N'admin', N'12345')
INSERT [dbo].[TaiKhoan] ([Ten], [MK]) VALUES (N'nv1', N'1234')
INSERT [dbo].[TaiKhoan] ([Ten], [MK]) VALUES (N'nv2', N'1234')
ALTER TABLE [dbo].[BaoHiemNhanVien]  WITH CHECK ADD FOREIGN KEY([MaBaoHiem])
REFERENCES [dbo].[DANHMUCBAOHIEM] ([MaBaoHiem])
GO
ALTER TABLE [dbo].[BaoHiemNhanVien]  WITH CHECK ADD FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[DanhMucNhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[DanhMucNhanVien]  WITH CHECK ADD FOREIGN KEY([MaChucVu])
REFERENCES [dbo].[DanhMucChucVu] ([MaChucVu])
GO
ALTER TABLE [dbo].[DanhMucNhanVien]  WITH CHECK ADD FOREIGN KEY([MaHinhThucTuyenDung])
REFERENCES [dbo].[DANHMUCHINHTHUCTUYENDUNG] ([MaHinhThucTuyenDung])
GO
ALTER TABLE [dbo].[DanhMucNhanVien]  WITH CHECK ADD FOREIGN KEY([MaPhongBan])
REFERENCES [dbo].[PhongBan] ([MaPhongBan])
GO
ALTER TABLE [dbo].[DanhSachKTKL]  WITH CHECK ADD FOREIGN KEY([MaKTKL])
REFERENCES [dbo].[QuyDinhKTKL] ([MaKTKL])
GO
ALTER TABLE [dbo].[DanhSachKTKL]  WITH CHECK ADD FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[DanhMucNhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[DanhMucNhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[LuongNhanVien]  WITH CHECK ADD FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[DanhMucNhanVien] ([MaNhanVien])
GO
/****** Object:  StoredProcedure [dbo].[BaoHiemDK]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BaoHiemDK]
(
	@MaBH varchar(20)
)
AS
BEGIN
	SELECT *FROM DANHMUCBAOHIEM WHERE MaBaoHiem = @MaBH
END
GO
/****** Object:  StoredProcedure [dbo].[BHNhanVien]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BHNhanVien]
AS
BEGIN
SELECT Ten, HoTen, NgayBatDau, NgayHetHan, SoTienDongMotThang FROM BaoHiemNhanVien, DANHMUCBAOHIEM, DanhMucNhanVien
Where BaoHiemNhanVien.MaBaoHiem = DANHMUCBAOHIEM.MaBaoHiem and BaoHiemNhanVien.MaNhanVien = DanhMucNhanVien.MaNhanVien
END
GO
/****** Object:  StoredProcedure [dbo].[ChucVuDK]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ChucVuDK](@MaCV varchar(20))
AS
BEGIN
	SELECT *FROM DanhMucChucVu WHERE MaChucVu = @MaCV
END
GO
/****** Object:  StoredProcedure [dbo].[DangNhapDK]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DangNhapDK](
@Ten varchar(10),
@MK varchar(10)
)
AS
BEGIN
	SELECT *FROM TaiKhoan WHERE Ten = @Ten AND MK = @MK
END
GO
/****** Object:  StoredProcedure [dbo].[DanhSachBH]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DanhSachBH]
AS
BEGIN
SELECT *FROM DANHMUCBAOHIEM
END
GO
/****** Object:  StoredProcedure [dbo].[DanhSachBHNV]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DanhSachBHNV](
@MaBH varchar(20),
@MaNV varchar(20))
AS
BEGIN
	SELECT *FROM BaoHiemNhanVien WHERE MaBaoHiem = @MaBH AND MaNhanVien = @MaNV
END
GO
/****** Object:  StoredProcedure [dbo].[DanhSachHD]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DanhSachHD]
AS
BEGIN
SELECT *FROM HopDong
END
GO
/****** Object:  StoredProcedure [dbo].[DanhSachKhenThuongKiLuat]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DanhSachKhenThuongKiLuat]
AS
BEGIN
SELECT *FROM DanhSachKTKL
END
GO
/****** Object:  StoredProcedure [dbo].[DanhSachKTKLDK]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DanhSachKTKLDK](
@MaKTKL varchar(20),
@MaNV varchar(20))
AS
BEGIN
	SELECT *FROM DanhSachKTKL WHERE MaKTKL = @MaKTKL AND MaNhanVien = @MaNV
END
GO
/****** Object:  StoredProcedure [dbo].[DanhSachLuong]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DanhSachLuong]
AS
BEGIN
SELECT MaLuong, MaNhanVien,LuongHD,SoNgayCong, ThangNam  FROM LuongNhanVien
END
GO
/****** Object:  StoredProcedure [dbo].[DanhSachMaBH]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DanhSachMaBH]
AS
begin
	select MaBaoHiem FROM DANHMUCBAOHIEM
end
GO
/****** Object:  StoredProcedure [dbo].[DanhSachMaCV]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[DanhSachMaCV]
AS
BEGIN
	SELECT MaChucVu FROM DanhMucChucVu
END
GO
/****** Object:  StoredProcedure [dbo].[DanhSachMaPB]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DanhSachMaPB]
AS
begin
	select MaPhongBan FROM PhongBan
end
GO
/****** Object:  StoredProcedure [dbo].[DanhSachMaTD]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DanhSachMaTD]
AS
begin
	select MaHinhThucTuyenDung FROM DANHMUCHINHTHUCTUYENDUNG
end
GO
/****** Object:  StoredProcedure [dbo].[DanhSachNV]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DanhSachNV]
AS
BEGIN
SELECT *FROM DanhMucNhanVien
END
GO
/****** Object:  StoredProcedure [dbo].[DSChucVu]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DSChucVu]
AS
BEGIN
SELECT *FROM DanhMucChucVu
END
GO
/****** Object:  StoredProcedure [dbo].[DsHopDongConHan]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DsHopDongConHan]
AS
BEGIN
	SELECT *FROM HopDong WHERE NgayKetThuc > GETDATE()
END
GO
/****** Object:  StoredProcedure [dbo].[DsHopDongHetHan]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DsHopDongHetHan]
AS
BEGIN
	SELECT *FROM HopDong WHERE NgayKetThuc < GETDATE()
END
GO
/****** Object:  StoredProcedure [dbo].[DSLuongTheoThang]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DSLuongTheoThang]
(@Thang varchar(20))
AS
BEGIN
	SELECT MaLuong, MaNhanVien, LuongHD, SoNgayCong, ThangNam FROM LuongNhanVien WHERE ThangNam = @Thang
END
GO
/****** Object:  StoredProcedure [dbo].[DSPhongBan]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DSPhongBan]
AS
BEGIN
SELECT *FROM PhongBan
END
GO
/****** Object:  StoredProcedure [dbo].[HopDongDK]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[HopDongDK](
@MaHD varchar(20))
AS
BEGIN
	SELECT *FROM HopDong WHERE MaHD = @MaHD
END
GO
/****** Object:  StoredProcedure [dbo].[LoadLuong]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LoadLuong]
AS
BEGIN
DECLARE tro_Luong CURSOR FORWARD_ONLY
FOR SELECT MaLuong, MaNhanVien
FROM LuongNhanVien

OPEN tro_Luong
DECLARE @MaLuong varchar(20),@MaNV varchar(20)
FETCH NEXT FROM tro_Luong INTO @MaLuong,@MaNV
WHILE @@FETCH_STATUS = 0
BEGIN
	DECLARE @TienBH int = (SELECT SUM(SoTienDongMoTThang) FROM BaoHiemNhanVien WHERE MaNhanVien = @MaNV)
	UPDATE LuongNhanVien SET TienBH = @TienBH WHERE MaNhanVien = @MaNV
	DECLARE @LuongCB FLOAT = (SELECT LuongHD FROM HopDong WHERE MaNhanVien = @MaNV)
	
	DECLARE @MaCV VARCHAR(20) = (SELECT MaChucVu FROM DanhMucNhanVien WHERE MaNhanVien = @MaNV)
	DECLARE @PhuCap int = (SELECT PhuCap FROM DanhMucChucVu WHERE MaChucVu = @MaCV)
	DECLARE @SoNgayCong int = (SELECT SoNgayCong FROM LuongNhanVien WHERE MaNhanVien = @MaNV AND MaLuong = @MaLuong)
	UPDATE LuongNhanVien SET LuongHD = ((@LuongCB + @PhuCap)/26)*@SoNgayCong - @TienBH WHERE MaNhanVien = @MaNV AND MaLuong = @MaLuong
FETCH NEXT FROM tro_Luong INTO @MaLuong, @MaNV
END
CLOSE tro_Luong
DEALLOCATE tro_Luong
END
GO
/****** Object:  StoredProcedure [dbo].[LuongDK]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LuongDK](
@MaLuong varchar(20))
AS
BEGIN
	SELECT *FROM LuongNhanVien WHERE MaLuong = @MaLuong
END
GO
/****** Object:  StoredProcedure [dbo].[NhanVienChuaCoHD]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[NhanVienChuaCoHD]
AS
BEGIN
	SELECT MaNhanVien From DanhMucNhanVien EXCEPT SELECT MaNhanVien From HopDong
END
GO
/****** Object:  StoredProcedure [dbo].[NhanVienDK]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[NhanVienDK](
@MaNV varchar(20))
AS
BEGIN
	SELECT *FROM DanhMucNhanVien WHERE MaNhanVien = @MaNV
END
GO
/****** Object:  StoredProcedure [dbo].[PhongBanDK]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PhongBanDK]
(
	@MaPB varchar(20)
)
AS
BEGIN
	SELECT *FROM PhongBan WHERE MaPhongBan = @MaPB
END
GO
/****** Object:  StoredProcedure [dbo].[QuyDinhKTKLDK]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[QuyDinhKTKLDK](@MaKTKL varchar(20))
AS
BEGIN
	SELECT *FROM QuyDinhKTKL WHERE MaKTKL = @MaKTKL
END
GO
/****** Object:  StoredProcedure [dbo].[QuyetDinhKTKL]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[QuyetDinhKTKL]
AS
BEGIN
SELECT *FROM QuyDinhKTKL
END
GO
/****** Object:  StoredProcedure [dbo].[SuaBaoHiemNV]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaBaoHiemNV](
@MaBH varchar(20),
@MaNV varchar(20),
@NgayBatDau Date,
@NgayKetThuc Date,
@SoTien int)
AS
BEGIN
	UPDATE BaoHiemNhanVien SET NgayBatDau = @NgayBatDau,@NgayKetThuc = @NgayKetThuc, SoTienDongMotThang = @SoTien 
	WHERE MaBaoHiem = @MaBH AND MaNhanVien = @MaNV
END
GO
/****** Object:  StoredProcedure [dbo].[SuaBH]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaBH]
(@MaBH varchar(20),
@Ten nvarchar(40),
@TiLeBH float
)
AS
BEGIN
	UPDATE DANHMUCBAOHIEM SET Ten = @Ten, TiLeBH = @TiLeBH WHERE MaBaoHiem = @MaBH
END
GO
/****** Object:  StoredProcedure [dbo].[SuaCV]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaCV]
(@MaChucVu varchar(20),
@Ten nvarchar(40),
@PhuCap int
)
AS
BEGIN
	UPDATE DanhMucChucVu SET Ten = @Ten, PhuCap = @PhuCap WHERE MaChucVu = @MaChucVu
END
GO
/****** Object:  StoredProcedure [dbo].[SuaDanhSachKTKL]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaDanhSachKTKL](
@MaKTKL varchar(20),
@MaNV varchar(20),
@Ngay Date,
@GhiChu nvarchar(50))
AS
BEGIN
	UPDATE DanhSachKTKL SET Ngay = @Ngay,GhiChu = @GhiChu WHERE MaKTKL = @MaKTKL AND MaNhanVien = @MaNV
END
GO
/****** Object:  StoredProcedure [dbo].[SuaHD]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaHD](
@MaHD varchar(20),
@MaNV varchar(20),
@Luong int,
@NgayBatDau date,
@NgayKetThuc date)
AS
BEGIN
	UPDATE HopDong SET MaNhanVien = @MaNV,LuongHD = @Luong, NgayBatDau = @NgayBatDau, NgayKetThuc = @NgayKetThuc 
	WHERE MaHD = @MaHD
END
GO
/****** Object:  StoredProcedure [dbo].[SuaKTKL]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaKTKL](
@MaKTKL varchar(20),
@Ten nvarchar(50),
@SoTien int)
AS
BEGIN
	UPDATE QuyDinhKTKL SET Ten = @Ten,SoTien = SoTien WHERE MaKTKL = @MaKTKL
END
GO
/****** Object:  StoredProcedure [dbo].[SuaLuong]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaLuong](
@MaLuong varchar(20),
@MaNV varchar(20),
@Luong int,
@SoNgayCong int,
@ThangNam varchar(10))
AS
BEGIN
	UPDATE LuongNhanVien SET MaNhanVien = @MaNV,LuongHD = @Luong, SoNgayCong = @SoNgayCong, ThangNam = @ThangNam
	WHERE MaLuong = @MaLuong
END
GO
/****** Object:  StoredProcedure [dbo].[SuaNV]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaNV](
@MaNV varchar(20),
@MaTD varchar(20),
@MaCV varchar(20),
@MaPB varchar(20),
@NoiLV nvarchar(40),
@HoTen nvarchar(40),
@NgaySinh Date,
@QueQuan nvarchar(40),
@GioiTinh nvarchar(4),
@CMND varchar(40),
@TrinhDo nvarchar(40),
@SDT varchar(40),
@Email nvarchar(40),
@NoiO nvarchar(40),
@NoiSinh nvarchar(40)
)
AS
BEGIN
	UPDATE DanhMucNhanVien SET MaHinhThucTuyenDung = @MaTD,MaChucVu = @MaCV, MaPhongBan = @MaPB, 
	NoiLamViec = @NoiLV, HoTen = @HoTen, QueQuan = @QueQuan,NgaySinh = @NgaySinh,GioiTinh = @GioiTinh, SoCMND = @CMND,TrinhDo = @TrinhDo,
	SDT = @SDT, Email = @Email, NoiO = @NoiO, NoiSinh = @NoiSinh
	WHERE MaNhanVien = @MaNV
END
GO
/****** Object:  StoredProcedure [dbo].[SuaPB]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaPB]
(@MaPhongBan varchar(20),
@Ten nvarchar(50),
@DienThoai varchar(15)
)
AS
BEGIN
	UPDATE PhongBan SET Ten = @Ten, DienThoai = @DienThoai WHERE MaPhongBan = @MaPhongBan
END
GO
/****** Object:  StoredProcedure [dbo].[SuaTD]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaTD](
@MaTD varchar(20),
@Ten nvarchar(40))
AS
BEGIN
	UPDATE DANHMUCHINHTHUCTUYENDUNG SET Ten = @Ten WHERE  MaHinhThucTuyenDung = @MaTD
END
GO
/****** Object:  StoredProcedure [dbo].[ThangNam]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThangNam]
AS
BEGIN
	SELECT DISTINCT ThangNam FROM LuongNhanVien
END
GO
/****** Object:  StoredProcedure [dbo].[ThemBaoHiemNV]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThemBaoHiemNV](
@MaBH varchar(20),
@MaNV varchar(20),
@NgayBatDau Date,
@NgayKetThuc Date,
@SoTien int)
AS
BEGIN
	INSERT INTO BaoHiemNhanVien VALUES(@MaNV,@MaBH,@NgayBatDau,@NgayKetThuc,@SoTien)
END
GO
/****** Object:  StoredProcedure [dbo].[ThemBH]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThemBH]
(
@MaBH varchar(20),
@Ten nvarchar(50),
@TiLeBH float
)
AS
BEGIN
	Insert Into DANHMUCBAOHIEM(MaBaoHiem,Ten,TiLeBH) Values(@MaBH,@Ten,@TiLeBH)
END
GO
/****** Object:  StoredProcedure [dbo].[ThemCV]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThemCV]
(
@MaChucVu varchar(20),
@Ten nvarchar(40),
@PhuCap int
)
AS
BEGIN
	Insert Into DanhMucChucVu(MaChucVu,Ten,PhuCap) Values(@MaChucVu,@Ten,@PhuCap)
END
GO
/****** Object:  StoredProcedure [dbo].[ThemDanhSachKTKL]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThemDanhSachKTKL](
@MaKTKL varchar(20),
@MaNV varchar(20),
@Ngay Date,
@GhiChu nvarchar(50))
AS
BEGIN
	INSERT INTO DanhSachKTKL VALUES(@MaNV,@MaKTKL,@Ngay,@GhiChu)
END
GO
/****** Object:  StoredProcedure [dbo].[ThemHD]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThemHD](
@MaHD varchar(20),
@MaNV varchar(20),
@Luong int,
@NgayBatDau date,
@NgayKetThuc date)
AS
BEGIN
	INSERT INTO HopDong VALUES(@MaHD,@MaNV,@Luong,@NgayBatDau,@NgayKetThuc)
END
GO
/****** Object:  StoredProcedure [dbo].[ThemKTKL]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThemKTKL](
@MaKTKL varchar(20),
@Ten nvarchar(50),
@SoTien int)
AS
BEGIN
	INSERT INTO QuyDinhKTKL VALUES(@MaKTKL,@Ten,@SoTien)
END
GO
/****** Object:  StoredProcedure [dbo].[ThemLuong]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThemLuong](
@MaLuong varchar(20),
@MaNV varchar(20),
@Luong int,
@SoNgayCong int,
@ThangNam varchar(10))
AS
BEGIN
	INSERT INTO LuongNhanVien(MaLuong,MaNhanVien,LuongHD,SoNgayCong,ThangNam) VALUES(@MaLuong,@MaNV,@Luong,@SoNgayCong,@ThangNam)
END
GO
/****** Object:  StoredProcedure [dbo].[ThemNV]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThemNV](
@MaNV varchar(20),
@MaTD varchar(20),
@MaCV varchar(20),
@MaPB varchar(20),
@NoiLV nvarchar(40),
@HoTen nvarchar(40),
@NgaySinh Date,
@QueQuan nvarchar(40),
@GioiTinh varchar(4),
@CMND varchar(40),
@TrinhDo nvarchar(40),
@SDT varchar(40),
@Email nvarchar(40),
@NoiO nvarchar(40),
@NoiSinh nvarchar(40)
)
AS
BEGIN
	INSERT INTO DanhMucNhanVien VALUES(@MaNV,@MaTD,@MaCV,@MaPB,@NoiLV,@HoTen,@NgaySinh,@QueQuan,@GioiTinh,@CMND,@TrinhDo,@SDT,@Email,@NoiO,@NoiSinh)
END
GO
/****** Object:  StoredProcedure [dbo].[ThemPB]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThemPB]
(
@MaPhongBan varchar(20),
@Ten nvarchar(50),
@DienThoai varchar(15)
)
AS
BEGIN
	Insert Into PhongBan(MaPhongBan,Ten,DienThoai) Values(@MaPhongBan,@Ten,@DienThoai)
END
GO
/****** Object:  StoredProcedure [dbo].[ThemTD]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThemTD](
@MaTD varchar(20),
@Ten nvarchar(40))
AS
BEGIN
	INSERT INTO DANHMUCHINHTHUCTUYENDUNG VALUES(@MaTD,@Ten)
END
GO
/****** Object:  StoredProcedure [dbo].[TongLuong]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TongLuong]
AS
BEGIN
SELECT Sum(LuongHD) FROM LuongNhanVien
END
GO
/****** Object:  StoredProcedure [dbo].[TongLuongTheoThang]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TongLuongTheoThang]
(@Thang varchar(20))
AS
BEGIN
SELECT Sum(LuongHD) FROM LuongNhanVien Where ThangNam = @Thang 
END
GO
/****** Object:  StoredProcedure [dbo].[TuyenDung]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TuyenDung]
AS
BEGIN
SELECT *FROM DANHMUCHINHTHUCTUYENDUNG
END
GO
/****** Object:  StoredProcedure [dbo].[TuyenDungDK]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TuyenDungDK](@MaTD varchar(20))
AS
BEGIN
	SELECT *FROM DANHMUCHINHTHUCTUYENDUNG WHERE MaHinhThucTuyenDung = @MaTD
END
GO
/****** Object:  StoredProcedure [dbo].[XoaBaoHiemNV]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XoaBaoHiemNV](
@MaBH varchar(20),
@MaNV varchar(20)
)
AS
BEGIN
	DELETE FROM BaoHiemNhanVien WHERE MaBaoHiem = @MaBH AND MaNhanVien = @MaNV
END
GO
/****** Object:  StoredProcedure [dbo].[XoaBH]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XoaBH]
(
@MaBH varchar(20)
)
AS
BEGIN
	DELETE FROM DANHMUCBAOHIEM WHERE MaBaoHiem = @MaBH
END
GO
/****** Object:  StoredProcedure [dbo].[XoaCV]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XoaCV]
(
@MaChucVu varchar(20)
)
AS
BEGIN
	DELETE FROM DanhMucChucVu WHERE MaChucVu = @MaChucVu
END
GO
/****** Object:  StoredProcedure [dbo].[XoaDanhSachKTKL]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XoaDanhSachKTKL](
@MaKTKL varchar(20),
@MaNV varchar(20)
)
AS
BEGIN
	DELETE FROM DanhSachKTKL WHERE MaKTKL = @MaKTKL AND MaNhanVien = @MaNV
END
GO
/****** Object:  StoredProcedure [dbo].[XoaHD]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XoaHD](
@MaHD varchar(20)
)
AS
BEGIN
	DELETE FROM HopDong WHERE MaHD = @MaHD
END
GO
/****** Object:  StoredProcedure [dbo].[XoaKTKL]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XoaKTKL](
@MaKTKL varchar(20)
)
AS
BEGIN
	DELETE FROM QuyDinhKTKL WHERE MaKTKL = @MaKTKL
END
GO
/****** Object:  StoredProcedure [dbo].[XoaLuong]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XoaLuong](
@MaLuong varchar(20)
)
AS
BEGIN
	DELETE FROM LuongNhanVien WHERE MaLuong = @MaLuong
END
GO
/****** Object:  StoredProcedure [dbo].[XoaNV]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XoaNV](
@MaNV varchar(20)
)
AS
BEGIN
	DELETE FROM DanhMucNhanVien WHERE MaNhanVien = @MaNV
END
GO
/****** Object:  StoredProcedure [dbo].[XoaPB]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XoaPB]
(
@MaPB varchar(20)
)
AS
BEGIN
	DELETE FROM PhongBan WHERE MaPhongBan = @MaPB
END
GO
/****** Object:  StoredProcedure [dbo].[XoaTD]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XoaTD](
@MaTD varchar(20)
)
AS
BEGIN
	DELETE FROM DANHMUCHINHTHUCTUYENDUNG WHERE MaHinhThucTuyenDung = @MaTD
END
GO
/****** Object:  StoredProcedure [dbo].[XuatDanhSachKTKL]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XuatDanhSachKTKL]
AS
BEGIN
SELECT MaNhanVien as 'Mã nhân viên', MaKTKL 'Mã khen thưởng, kỉ luật', Ngay as 'Ngày', GhiChu as 'Ghi Chú' FROM DanhSachKTKL
END
GO
/****** Object:  StoredProcedure [dbo].[XuatDanhSachLuongNV]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XuatDanhSachLuongNV]
AS
BEGIN
SELECT MaLuong as 'Mã lương', MaNhanVien 'Mã nhân viên', LuongHD as 'Lương', SoNgayCong as 'Số ngày làm', ThangNam as 'Tháng/năm', TienBH as 'Tiền Bảo hiểm' FROM LuongNhanVien
END
GO
/****** Object:  StoredProcedure [dbo].[XuatDanhSachNV]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XuatDanhSachNV]
AS
BEGIN
SELECT MaNhanVien as 'Mã nhân viên', MaHinhThucTuyenDung 'Mã tuyển dụng', MaChucVu 'Mã chức vụ', MaPhongBan 'Mã phòng ban',NoiLamViec 'Nơi làm việc',
HoTen 'Họ tên', NgaySinh 'Ngày sinh',QueQuan 'Quê quán', GioiTinh 'Giới tính', SoCMND 'CMND', TrinhDo 'Trình độ', SDT 'Số điện thoại',
Email 'Email', NoiO 'Nơi ở', NoiSinh 'Nơi sinh' FROM DanhMucNhanVien
END
GO
/****** Object:  Trigger [dbo].[TG_SuaTienDongBH]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_SuaTienDongBH] ON [dbo].[BaoHiemNhanVien] AFTER UPDATE
AS
BEGIN
DECLARE @MaNV VARCHAR(20) = (SELECT MaNhanVien FROM INSERTED)
DECLARE @MaBH VARCHAR(20) = (SELECT MaBaoHiem FROM INSERTED)
DECLARE @TiLe FLOAT = (SELECT TiLeBH FROM DANHMUCBAOHIEM WHERE MaBaoHiem = @MaBH)
DECLARE @LuongCB int = (SELECT LuongHD FROM HopDong WHERE MaNhanVien = @MaNV)
DECLARE @MaCV VARCHAR(20) = (SELECT MaChucVu FROM DanhMucNhanVien WHERE MaNhanVien = @MaNV)
DECLARE @PhuCap int = (SELECT PhuCap FROM DanhMucChucVu WHERE MaChucVu = @MaCV)
DECLARE @TienBH int = (SELECT SUM(SoTienDongMoTThang) FROM BaoHiemNhanVien WHERE MaNhanVien = @MaNV)
UPDATE BaoHiemNhanVien SET SoTienDongMotThang = (@LuongCB + @PhuCap)*@TiLe WHERE MaNhanVien = @MaNV AND MaBaoHiem = @MaBH
UPDATE LuongNhanVien SET TienBH = @TienBH WHERE MaNhanVien = @MaNV
END
GO
ALTER TABLE [dbo].[BaoHiemNhanVien] ENABLE TRIGGER [TG_SuaTienDongBH]
GO
/****** Object:  Trigger [dbo].[TG_ThemTienDongBH]    Script Date: 2020-12-22 4:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_ThemTienDongBH] ON [dbo].[BaoHiemNhanVien] AFTER INSERT
AS
BEGIN
DECLARE @MaNV VARCHAR(20) = (SELECT MaNhanVien FROM INSERTED)
DECLARE @MaBH VARCHAR(20) = (SELECT MaBaoHiem FROM INSERTED)
DECLARE @TiLe FLOAT = (SELECT TiLeBH FROM DANHMUCBAOHIEM WHERE MaBaoHiem = @MaBH)
DECLARE @LuongCB int = (SELECT LuongHD FROM HopDong WHERE MaNhanVien = @MaNV)
DECLARE @MaCV VARCHAR(20) = (SELECT MaChucVu FROM DanhMucNhanVien WHERE MaNhanVien = @MaNV)
DECLARE @PhuCap int = (SELECT PhuCap FROM DanhMucChucVu WHERE MaChucVu = @MaCV)
DECLARE @TienBH int = (SELECT SUM(SoTienDongMoTThang) FROM BaoHiemNhanVien WHERE MaNhanVien = @MaNV)
UPDATE BaoHiemNhanVien SET SoTienDongMotThang = (@LuongCB + @PhuCap)*@TiLe WHERE MaNhanVien = @MaNV AND MaBaoHiem = @MaBH
UPDATE LuongNhanVien SET TienBH = @TienBH WHERE MaNhanVien = @MaNV
END
GO
ALTER TABLE [dbo].[BaoHiemNhanVien] ENABLE TRIGGER [TG_ThemTienDongBH]
GO
/****** Object:  Trigger [dbo].[TG_XoaTienDongBH]    Script Date: 2020-12-22 4:16:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Trigger [dbo].[TG_XoaTienDongBH] ON [dbo].[BaoHiemNhanVien] AFTER DELETE
AS
BEGIN
DECLARE @MaNV VARCHAR(20) = (SELECT MaNhanVien FROM deleted)
DECLARE @MaBH VARCHAR(20) = (SELECT MaBaoHiem FROM deleted)
DECLARE @TienBHKoDong int = (SELECT SoTienDongMoTThang FROM BaoHiemNhanVien WHERE MaNhanVien = @MaNV AND MaBaoHiem = @MaBH)
UPDATE LuongNhanVien SET TienBH = TienBH - @TienBHKoDong WHERE MaNhanVien = @MaNV
END
GO
ALTER TABLE [dbo].[BaoHiemNhanVien] ENABLE TRIGGER [TG_XoaTienDongBH]
GO
USE [master]
GO
ALTER DATABASE [QuanLyNhanSu] SET  READ_WRITE 
GO
