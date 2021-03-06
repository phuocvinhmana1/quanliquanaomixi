USE [master]
GO
/****** Object:  Database [QuanLyQuanAo]    Script Date: 22-08-2021 12:01:26 SA ******/
CREATE DATABASE [QuanLyQuanAo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyMyPham', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyMyPham.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyMyPham_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyMyPham_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyQuanAo] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyQuanAo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyQuanAo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyQuanAo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyQuanAo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyQuanAo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyQuanAo] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyQuanAo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyQuanAo] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyQuanAo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyQuanAo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyQuanAo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyQuanAo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyQuanAo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyQuanAo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyQuanAo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyQuanAo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyQuanAo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyQuanAo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyQuanAo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyQuanAo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyQuanAo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyQuanAo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyQuanAo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyQuanAo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyQuanAo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyQuanAo] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyQuanAo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyQuanAo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyQuanAo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyQuanAo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QuanLyQuanAo]
GO
/****** Object:  Table [dbo].[ChiTietGioHang]    Script Date: 22-08-2021 12:01:26 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietGioHang](
	[MaCT] [int] IDENTITY(1,1) NOT NULL,
	[MaGioHang] [int] NULL,
	[MaSP] [int] NULL,
	[SoLuong] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChiTietGioHang] PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietSanPham]    Script Date: 22-08-2021 12:01:26 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSanPham](
	[MaChiTietSP] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NULL,
	[KichThuoc] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_ChiTietSanPham] PRIMARY KEY CLUSTERED 
(
	[MaChiTietSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FeedbackKH]    Script Date: 22-08-2021 12:01:26 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbackKH](
	[MaFB] [int] IDENTITY(1,1) NOT NULL,
	[TenFB] [nvarchar](50) NULL,
	[HinhAnh] [nvarchar](50) NULL,
 CONSTRAINT [PK_FeedbackKH] PRIMARY KEY CLUSTERED 
(
	[MaFB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 22-08-2021 12:01:26 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[MaGioHang] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayMua] [date] NULL,
	[TrangThai] [nvarchar](50) NULL,
	[TongTien] [money] NULL,
 CONSTRAINT [PK_GioHang] PRIMARY KEY CLUSTERED 
(
	[MaGioHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 22-08-2021 12:01:26 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[MaKM] [int] IDENTITY(1,1) NOT NULL,
	[TenMaKM] [nvarchar](50) NULL,
	[ThongTinKM] [nvarchar](100) NULL,
	[GiaTienKM] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[MaKM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 22-08-2021 12:01:26 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiSP] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuanLySlider]    Script Date: 22-08-2021 12:01:26 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanLySlider](
	[MaSlider] [int] IDENTITY(1,1) NOT NULL,
	[TenSlider] [nvarchar](50) NULL,
	[HinhAnh] [nvarchar](50) NULL,
 CONSTRAINT [PK_QuanLySlider] PRIMARY KEY CLUSTERED 
(
	[MaSlider] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuanLyThongBao]    Script Date: 22-08-2021 12:01:26 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanLyThongBao](
	[MaThongBao] [int] IDENTITY(1,1) NOT NULL,
	[TenThongBao] [nvarchar](50) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[HinhAnh] [nvarchar](50) NULL,
 CONSTRAINT [PK_QuanLyThongBao] PRIMARY KEY CLUSTERED 
(
	[MaThongBao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuanLyVeChungToi]    Script Date: 22-08-2021 12:01:26 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanLyVeChungToi](
	[MaVCT] [int] IDENTITY(1,1) NOT NULL,
	[TenVCT] [nvarchar](50) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[HinhAnh] [nvarchar](50) NULL,
 CONSTRAINT [PK_QuanLyVeChungToi] PRIMARY KEY CLUSTERED 
(
	[MaVCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 22-08-2021 12:01:26 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[MaLoai] [int] NULL,
	[SoLuong] [nvarchar](50) NULL,
	[ThuongHieu] [nvarchar](50) NULL,
	[XuatXu] [nvarchar](50) NULL,
	[NgayThem] [date] NULL,
	[MoTa] [nvarchar](max) NULL,
	[MauSac] [nvarchar](50) NULL,
	[KichThuoc] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[GiaBan] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
	[HinhAnh] [nvarchar](50) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongTinTaiKhoan]    Script Date: 22-08-2021 12:01:26 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinTaiKhoan](
	[MaTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[LoaiTK] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
 CONSTRAINT [PK_ThongTinTaiKhoan_1] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ChiTietGioHang] ON 

INSERT [dbo].[ChiTietGioHang] ([MaCT], [MaGioHang], [MaSP], [SoLuong]) VALUES (10, 1, 7, N'2')
INSERT [dbo].[ChiTietGioHang] ([MaCT], [MaGioHang], [MaSP], [SoLuong]) VALUES (11, 1, 1, N'1')
INSERT [dbo].[ChiTietGioHang] ([MaCT], [MaGioHang], [MaSP], [SoLuong]) VALUES (13, 2, 1, N'3')
INSERT [dbo].[ChiTietGioHang] ([MaCT], [MaGioHang], [MaSP], [SoLuong]) VALUES (14, 2, 3, N'1')
INSERT [dbo].[ChiTietGioHang] ([MaCT], [MaGioHang], [MaSP], [SoLuong]) VALUES (15, 2, 2, N'2')
INSERT [dbo].[ChiTietGioHang] ([MaCT], [MaGioHang], [MaSP], [SoLuong]) VALUES (17, 4, 3, N'2')
INSERT [dbo].[ChiTietGioHang] ([MaCT], [MaGioHang], [MaSP], [SoLuong]) VALUES (19, 4, 8, N'3')
SET IDENTITY_INSERT [dbo].[ChiTietGioHang] OFF
SET IDENTITY_INSERT [dbo].[ChiTietSanPham] ON 

INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [KichThuoc], [SoLuong]) VALUES (1, 1, N'S', 9)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [KichThuoc], [SoLuong]) VALUES (2, 1, N'M', 56)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [KichThuoc], [SoLuong]) VALUES (3, 1, N'L', 5)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [KichThuoc], [SoLuong]) VALUES (5, 2, N'S', 6)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [KichThuoc], [SoLuong]) VALUES (6, 2, N'M', 7)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [KichThuoc], [SoLuong]) VALUES (7, 3, N'S', 10)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [KichThuoc], [SoLuong]) VALUES (8, 3, N'XL', 3)
INSERT [dbo].[ChiTietSanPham] ([MaChiTietSP], [MaSP], [KichThuoc], [SoLuong]) VALUES (9, 4, N'XL', 5)
SET IDENTITY_INSERT [dbo].[ChiTietSanPham] OFF
SET IDENTITY_INSERT [dbo].[GioHang] ON 

INSERT [dbo].[GioHang] ([MaGioHang], [MaKH], [NgayMua], [TrangThai], [TongTien]) VALUES (1, 1, CAST(0xE6420B00 AS Date), N'Đã đặt hàng 123', 600000.0000)
INSERT [dbo].[GioHang] ([MaGioHang], [MaKH], [NgayMua], [TrangThai], [TongTien]) VALUES (2, 1, CAST(0x90400B00 AS Date), N'123', 3000.0000)
INSERT [dbo].[GioHang] ([MaGioHang], [MaKH], [NgayMua], [TrangThai], [TongTien]) VALUES (3, 17, CAST(0xE6420B00 AS Date), N'Đang trong quá trình mua', 600000.0000)
INSERT [dbo].[GioHang] ([MaGioHang], [MaKH], [NgayMua], [TrangThai], [TongTien]) VALUES (4, 18, CAST(0xE6420B00 AS Date), N'Đã đặt hàng', 1000000.0000)
SET IDENTITY_INSERT [dbo].[GioHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (1, N'Áo ba lỗ')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (2, N'Áo CSGO')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (3, N'Áo Mixi')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (4, N'Áo Pubg')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (5, N'Áo Refund Gaming')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (6, N'Đồ lưu niệm Mixi')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (7, N'Áo không xác định 2')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (8, N'Áo không xác định 4')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (9, N'Áo không xác định 7')
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [SoLuong], [ThuongHieu], [XuatXu], [NgayThem], [MoTa], [MauSac], [KichThuoc], [GioiTinh], [GiaBan], [GhiChu], [HinhAnh]) VALUES (1, N'Áo 3 lỗ Mixi - Mẫu 1', 1, N'16', N'Mixi', N'Việt Nam', CAST(0xE2420B00 AS Date), N'ko', N'Đen', N'S-XL', N'Nam', N'200000', N'', N'/HinhAnh/AnhSanPham/aobalo1.png')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [SoLuong], [ThuongHieu], [XuatXu], [NgayThem], [MoTa], [MauSac], [KichThuoc], [GioiTinh], [GiaBan], [GhiChu], [HinhAnh]) VALUES (2, N'Áo 3 lỗ Mixi - Mẫu 2', 1, N'2', N'Mixi', N'Việt Nam', CAST(0xDB420B00 AS Date), N'ko', N'Đen', N'S-XL', N'Nam', N'200000', N'Còn bán', N'/HinhAnh/AnhSanPham/aobalo2.png')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [SoLuong], [ThuongHieu], [XuatXu], [NgayThem], [MoTa], [MauSac], [KichThuoc], [GioiTinh], [GiaBan], [GhiChu], [HinhAnh]) VALUES (3, N'Áo 3 lỗ Mixi - Mẫu 3', 1, N'76', N'Mixi', N'Việt Nam', CAST(0xDD420B00 AS Date), N'ko', N'Đen', N'S-XL', N'Nam', N'200000', N'Còn bán', N'/HinhAnh/AnhSanPham/aobalo3.png')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [SoLuong], [ThuongHieu], [XuatXu], [NgayThem], [MoTa], [MauSac], [KichThuoc], [GioiTinh], [GiaBan], [GhiChu], [HinhAnh]) VALUES (4, N'Áo 3 lỗ Mixi - Mẫu 4', 1, N'3', N'Mixi', N'Việt Nam', CAST(0xDF420B00 AS Date), N'ko', N'Đen', N'S-XL', N'Nam', N'200000', N'Còn bán', N'/HinhAnh/AnhSanPham/aobalo4.png')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [SoLuong], [ThuongHieu], [XuatXu], [NgayThem], [MoTa], [MauSac], [KichThuoc], [GioiTinh], [GiaBan], [GhiChu], [HinhAnh]) VALUES (5, N'Áo 3 lỗ Mixi - Mẫu 5', 1, N'33', N'Mixi', N'Việt Nam', CAST(0x68420B00 AS Date), N'ko', N'Đen', N'S-XL', N'Nam', N'200000', N'Còn bán', N'/HinhAnh/AnhSanPham/aobalo5.png')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [SoLuong], [ThuongHieu], [XuatXu], [NgayThem], [MoTa], [MauSac], [KichThuoc], [GioiTinh], [GiaBan], [GhiChu], [HinhAnh]) VALUES (6, N'Áo Mixi - Tộc trưởng', 3, N'22', N'Mixi', N'Việt Nam', CAST(0xA5420B00 AS Date), N'ko', N'Đen', N'M-XL', N'Nam', N'350000', N'Còn bán', N'/HinhAnh/AnhSanPham/aomixi1.png')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [SoLuong], [ThuongHieu], [XuatXu], [NgayThem], [MoTa], [MauSac], [KichThuoc], [GioiTinh], [GiaBan], [GhiChu], [HinhAnh]) VALUES (7, N'Áo Mixi - Phòng Stream', 3, N'65', N'Mixi', N'Việt Nam', CAST(0xE1420B00 AS Date), N'ko', N'Đen', N'M-XL', N'Nam và nữ', N'320000', N'Còn bán', N'/HinhAnh/AnhSanPham/aomixiphongstream.png')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [SoLuong], [ThuongHieu], [XuatXu], [NgayThem], [MoTa], [MauSac], [KichThuoc], [GioiTinh], [GiaBan], [GhiChu], [HinhAnh]) VALUES (8, N'Áo Mixi - Trắng', 3, N'43', N'Mixi', N'Việt Nam', CAST(0xE2420B00 AS Date), N'ko', N'Đen', N'M-XL', N'Nam và nữ', N'320000', N'Còn bán', N'/HinhAnh/AnhSanPham/aophongmixitrang.png')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [SoLuong], [ThuongHieu], [XuatXu], [NgayThem], [MoTa], [MauSac], [KichThuoc], [GioiTinh], [GiaBan], [GhiChu], [HinhAnh]) VALUES (9, N'Áo Hoodie Mixi', 3, N'11', N'Mixi', N'Việt Nam', CAST(0xDE420B00 AS Date), N'ko', N'Đen', N'M-XXL', N'Nam và nữ', N'500000', N'Còn bán', N'/HinhAnh/AnhSanPham/aohoodiemixi.png')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [SoLuong], [ThuongHieu], [XuatXu], [NgayThem], [MoTa], [MauSac], [KichThuoc], [GioiTinh], [GiaBan], [GhiChu], [HinhAnh]) VALUES (10, N'Áo Mixi - Đen', 3, N'4', N'Mixi', N'Việt Nam', CAST(0x2D420B00 AS Date), N'ko', N'Đen', N'M-XL', N'Nam và nữ', N'330000', N'Còn bán', N'/HinhAnh/AnhSanPham/aophongmixiden.png')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [SoLuong], [ThuongHieu], [XuatXu], [NgayThem], [MoTa], [MauSac], [KichThuoc], [GioiTinh], [GiaBan], [GhiChu], [HinhAnh]) VALUES (11, N'Áo thun đen logo counter strike C07', 2, N'8', N'Mixi', N'Việt Nam', CAST(0x0E420B00 AS Date), N'ko', N'Đen', N'S-XL', N'Nam', N'150000', N'Còn bán', N'/HinhAnh/AnhSanPham/aothundenlogocounterstrike.png')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[ThongTinTaiKhoan] ON 

INSERT [dbo].[ThongTinTaiKhoan] ([MaTaiKhoan], [TenDangNhap], [MatKhau], [LoaiTK], [HoTen], [SDT], [Email], [DiaChi]) VALUES (1, N'vinh', N'123', N'Khách hàng', N'vinh', N'123', N'123', N'123')
INSERT [dbo].[ThongTinTaiKhoan] ([MaTaiKhoan], [TenDangNhap], [MatKhau], [LoaiTK], [HoTen], [SDT], [Email], [DiaChi]) VALUES (2, N'vinhne', N'vinhne', N'Khách hàng', N'vinhne', N'vinhne', N'vinhne', N'vinhne')
INSERT [dbo].[ThongTinTaiKhoan] ([MaTaiKhoan], [TenDangNhap], [MatKhau], [LoaiTK], [HoTen], [SDT], [Email], [DiaChi]) VALUES (12, N'admin', N'123', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ThongTinTaiKhoan] ([MaTaiKhoan], [TenDangNhap], [MatKhau], [LoaiTK], [HoTen], [SDT], [Email], [DiaChi]) VALUES (13, N'333333', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ThongTinTaiKhoan] ([MaTaiKhoan], [TenDangNhap], [MatKhau], [LoaiTK], [HoTen], [SDT], [Email], [DiaChi]) VALUES (15, N'phuocvinhmana5', N'123', N'Khách hàng', N'123', N'123', N'123', N'123')
INSERT [dbo].[ThongTinTaiKhoan] ([MaTaiKhoan], [TenDangNhap], [MatKhau], [LoaiTK], [HoTen], [SDT], [Email], [DiaChi]) VALUES (16, N'phuocvinhmana8', N'', N'Khách hàng', N'123', N'123', N'123', N'123')
INSERT [dbo].[ThongTinTaiKhoan] ([MaTaiKhoan], [TenDangNhap], [MatKhau], [LoaiTK], [HoTen], [SDT], [Email], [DiaChi]) VALUES (17, N'phuocvinh1', N'123456', N'Khách hàng', N'phuoc vinh', N'0834566525', N'phuocvinhmana1@gmail.com', N'TPHCM')
INSERT [dbo].[ThongTinTaiKhoan] ([MaTaiKhoan], [TenDangNhap], [MatKhau], [LoaiTK], [HoTen], [SDT], [Email], [DiaChi]) VALUES (18, N'phuocvinhmana123', N'123456', N'Khách hàng', N'phuoc vinh', N'0834566525', N'phuocvinhmana1@gmail.com', N'TPHCM')
SET IDENTITY_INSERT [dbo].[ThongTinTaiKhoan] OFF
USE [master]
GO
ALTER DATABASE [QuanLyQuanAo] SET  READ_WRITE 
GO
