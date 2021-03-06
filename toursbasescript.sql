USE [master]
GO
/****** Object:  Database [Ple_BDOne]    Script Date: 06.10.2020 12:26:54 ******/
CREATE DATABASE [Ple_BDOne]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ple_BDOne', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXP14\MSSQL\DATA\Ple_BDOne.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Ple_BDOne_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXP14\MSSQL\DATA\Ple_BDOne_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Ple_BDOne] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ple_BDOne].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ple_BDOne] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ple_BDOne] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ple_BDOne] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ple_BDOne] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ple_BDOne] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ple_BDOne] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ple_BDOne] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ple_BDOne] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ple_BDOne] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ple_BDOne] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ple_BDOne] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ple_BDOne] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ple_BDOne] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ple_BDOne] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ple_BDOne] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ple_BDOne] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ple_BDOne] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ple_BDOne] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ple_BDOne] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ple_BDOne] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ple_BDOne] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ple_BDOne] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ple_BDOne] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ple_BDOne] SET  MULTI_USER 
GO
ALTER DATABASE [Ple_BDOne] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ple_BDOne] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ple_BDOne] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ple_BDOne] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Ple_BDOne] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Ple_BDOne]
GO
/****** Object:  Table [dbo].[country]    Script Date: 06.10.2020 12:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[code] [nchar](2) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hotel]    Script Date: 06.10.2020 12:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotel](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[countofstars] [int] NOT NULL,
	[countrycode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hotelcomment]    Script Date: 06.10.2020 12:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotelcomment](
	[id] [int] NOT NULL,
	[hotelid] [int] NOT NULL,
	[text] [nvarchar](max) NOT NULL,
	[author] [nvarchar](100) NOT NULL,
	[creationdate] [datetime] NOT NULL,
 CONSTRAINT [PK_hotelcomment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hotelimage]    Script Date: 06.10.2020 12:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[hotelimage](
	[id] [int] NOT NULL,
	[hotelid] [int] NOT NULL,
	[imagesource] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_hotelimage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[hoteloftour]    Script Date: 06.10.2020 12:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoteloftour](
	[hotelid] [int] NOT NULL,
	[tourid] [int] NOT NULL,
 CONSTRAINT [PK_hoteloftour] PRIMARY KEY CLUSTERED 
(
	[hotelid] ASC,
	[tourid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tour]    Script Date: 06.10.2020 12:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tour](
	[id] [int] NOT NULL,
	[ticketcount] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[imagepreview] [varbinary](max) NULL,
	[price] [money] NOT NULL,
	[isactual] [bit] NOT NULL,
 CONSTRAINT [PK_tour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[type]    Script Date: 06.10.2020 12:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[typeoftour]    Script Date: 06.10.2020 12:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[typeoftour](
	[tourid] [int] NOT NULL,
	[typeid] [int] NOT NULL,
 CONSTRAINT [PK_typeoftour] PRIMARY KEY CLUSTERED 
(
	[tourid] ASC,
	[typeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[type] ON 

INSERT [dbo].[type] ([id], [name], [description]) VALUES (1, N'Тип 1', NULL)
INSERT [dbo].[type] ([id], [name], [description]) VALUES (2, N'Тип 2', NULL)
INSERT [dbo].[type] ([id], [name], [description]) VALUES (3, N'Тип 3', NULL)
INSERT [dbo].[type] ([id], [name], [description]) VALUES (4, N'Тип 4', NULL)
INSERT [dbo].[type] ([id], [name], [description]) VALUES (5, N'Тип 5', NULL)
SET IDENTITY_INSERT [dbo].[type] OFF
ALTER TABLE [dbo].[hotel]  WITH CHECK ADD  CONSTRAINT [FK_hotel_country] FOREIGN KEY([countrycode])
REFERENCES [dbo].[country] ([code])
GO
ALTER TABLE [dbo].[hotel] CHECK CONSTRAINT [FK_hotel_country]
GO
ALTER TABLE [dbo].[hotelcomment]  WITH CHECK ADD  CONSTRAINT [FK_hotelcomment_hotel] FOREIGN KEY([hotelid])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[hotelcomment] CHECK CONSTRAINT [FK_hotelcomment_hotel]
GO
ALTER TABLE [dbo].[hotelimage]  WITH CHECK ADD  CONSTRAINT [FK_hotelimage_hotel] FOREIGN KEY([hotelid])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[hotelimage] CHECK CONSTRAINT [FK_hotelimage_hotel]
GO
ALTER TABLE [dbo].[hoteloftour]  WITH CHECK ADD  CONSTRAINT [FK_hoteloftour_hotel] FOREIGN KEY([hotelid])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[hoteloftour] CHECK CONSTRAINT [FK_hoteloftour_hotel]
GO
ALTER TABLE [dbo].[hoteloftour]  WITH CHECK ADD  CONSTRAINT [FK_hoteloftour_tour] FOREIGN KEY([tourid])
REFERENCES [dbo].[tour] ([id])
GO
ALTER TABLE [dbo].[hoteloftour] CHECK CONSTRAINT [FK_hoteloftour_tour]
GO
ALTER TABLE [dbo].[typeoftour]  WITH CHECK ADD  CONSTRAINT [FK_typeoftour_tour] FOREIGN KEY([tourid])
REFERENCES [dbo].[tour] ([id])
GO
ALTER TABLE [dbo].[typeoftour] CHECK CONSTRAINT [FK_typeoftour_tour]
GO
ALTER TABLE [dbo].[typeoftour]  WITH CHECK ADD  CONSTRAINT [FK_typeoftour_type] FOREIGN KEY([typeid])
REFERENCES [dbo].[type] ([id])
GO
ALTER TABLE [dbo].[typeoftour] CHECK CONSTRAINT [FK_typeoftour_type]
GO
USE [master]
GO
ALTER DATABASE [Ple_BDOne] SET  READ_WRITE 
GO
