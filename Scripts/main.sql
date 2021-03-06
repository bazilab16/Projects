USE [master]
GO
/****** Object:  Database [IbuCollection]    Script Date: 8/22/2019 4:49:40 PM ******/
CREATE DATABASE [IbuCollection]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IbuCollection', FILENAME = N'C:\Users\sufiy\IbuCollection.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IbuCollection_log', FILENAME = N'C:\Users\sufiy\IbuCollection_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [IbuCollection] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IbuCollection].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IbuCollection] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IbuCollection] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IbuCollection] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IbuCollection] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IbuCollection] SET ARITHABORT OFF 
GO
ALTER DATABASE [IbuCollection] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IbuCollection] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IbuCollection] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IbuCollection] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IbuCollection] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IbuCollection] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IbuCollection] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IbuCollection] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IbuCollection] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IbuCollection] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IbuCollection] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IbuCollection] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IbuCollection] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IbuCollection] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IbuCollection] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IbuCollection] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IbuCollection] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IbuCollection] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IbuCollection] SET  MULTI_USER 
GO
ALTER DATABASE [IbuCollection] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IbuCollection] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IbuCollection] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IbuCollection] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IbuCollection] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IbuCollection] SET QUERY_STORE = OFF
GO
USE [IbuCollection]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [IbuCollection]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 8/22/2019 4:49:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Status] [int] NULL,
	[Count] [nchar](10) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/22/2019 4:49:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[DtOrderPlaced] [datetime] NOT NULL,
	[DtDelivery] [datetime] NOT NULL,
	[BillAmount] [decimal](18, 2) NOT NULL,
	[PaymentStatus] [nvarchar](50) NOT NULL,
	[Status] [int] NULL,
	[ExtraInfo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 8/22/2019 4:49:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[ExtraInfo] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[DtCreated] [datetime] NULL,
	[CreatedById] [bigint] NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/22/2019 4:49:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Code] [nvarchar](50) NOT NULL,
	[SupplierName] [nvarchar](50) NULL,
	[DtCreated] [datetime] NULL,
	[CreatedById] [bigint] NULL,
	[ExtraInfo] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 8/22/2019 4:49:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profiles](
	[Id] [bigint] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[WorkContact] [nvarchar](50) NULL,
	[HomeContact] [nvarchar](50) NULL,
	[StreetAddress1] [nvarchar](255) NULL,
	[StreetAddress2] [nvarchar](255) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Latitude] [nvarchar](50) NULL,
	[Longitude] [nvarchar](50) NULL,
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Profiles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/22/2019 4:49:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[MobileNumber] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[ProductCategories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories]
GO
ALTER TABLE [dbo].[Profiles]  WITH CHECK ADD  CONSTRAINT [FK_Profiles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Profiles] CHECK CONSTRAINT [FK_Profiles_Users]
GO
USE [master]
GO
ALTER DATABASE [IbuCollection] SET  READ_WRITE 
GO
