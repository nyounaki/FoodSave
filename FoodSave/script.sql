USE [master]
GO
/****** Object:  Database [FoodSave]    Script Date: 2/15/2018 9:25:55 PM ******/
CREATE DATABASE [FoodSave]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FoodSave', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\FoodSave.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FoodSave_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\FoodSave_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FoodSave] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FoodSave].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FoodSave] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FoodSave] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FoodSave] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FoodSave] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FoodSave] SET ARITHABORT OFF 
GO
ALTER DATABASE [FoodSave] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FoodSave] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FoodSave] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FoodSave] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FoodSave] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FoodSave] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FoodSave] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FoodSave] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FoodSave] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FoodSave] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FoodSave] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FoodSave] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FoodSave] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FoodSave] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FoodSave] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FoodSave] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FoodSave] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FoodSave] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FoodSave] SET  MULTI_USER 
GO
ALTER DATABASE [FoodSave] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FoodSave] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FoodSave] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FoodSave] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FoodSave] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FoodSave] SET QUERY_STORE = OFF
GO
USE [FoodSave]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [FoodSave]
GO
/****** Object:  Table [dbo].[AvailableMeal]    Script Date: 2/15/2018 9:25:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AvailableMeal](
	[AvailableMealID] [int] IDENTITY(1,1) NOT NULL,
	[MealCostID] [int] NULL,
	[Quantity] [int] NULL,
	[Active] [bit] NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
 CONSTRAINT [PK_AvailableMeal] PRIMARY KEY CLUSTERED 
(
	[AvailableMealID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 2/15/2018 9:25:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](100) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuisine]    Script Date: 2/15/2018 9:25:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuisine](
	[CuisineID] [int] IDENTITY(1,1) NOT NULL,
	[Cuisine] [nvarchar](100) NULL,
 CONSTRAINT [PK_Cuisine] PRIMARY KEY CLUSTERED 
(
	[CuisineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2/15/2018 9:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [nvarchar](50) NULL,
	[Lname] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[City] [nvarchar](50) NULL,
	[CountryID] [int] NULL,
	[PostalCode] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[ProvinceID] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerPaymentInfo]    Script Date: 2/15/2018 9:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPaymentInfo](
	[CustomerPaymentID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[PaymentMethodID] [int] NULL,
	[CardNum] [nvarchar](50) NULL,
	[CardHolderName] [nvarchar](50) NULL,
	[ExpYear] [int] NULL,
	[ExpMonth] [int] NULL,
	[SecurityNum] [int] NULL,
 CONSTRAINT [PK_CustomerPaymentInfo] PRIMARY KEY CLUSTERED 
(
	[CustomerPaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodStore]    Script Date: 2/15/2018 9:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodStore](
	[FoodStoreID] [int] IDENTITY(1,1) NOT NULL,
	[FoodStoreName] [nvarchar](150) NULL,
	[Logo] [image] NULL,
	[OverallRate] [decimal](1, 1) NULL,
	[CanDeliver] [bit] NULL,
	[FoodQualityRate] [decimal](1, 1) NULL,
	[DeliveryTimeRate] [decimal](1, 1) NULL,
	[TakeawayService] [bit] NULL,
	[Comment] [nvarchar](3000) NULL,
	[FreeDelivey] [bit] NULL,
	[DeliveryFee] [decimal](3, 2) NULL,
	[Phonenum1] [nvarchar](50) NULL,
	[Phonenum2] [nvarchar](50) NULL,
	[ServiceAlcohol] [bit] NULL,
	[OutdoorSeating] [bit] NULL,
	[WIFI] [bit] NULL,
	[SportBar] [bit] NULL,
	[LuxuryDining] [bit] NULL,
	[GlutenFree] [bit] NULL,
	[HealtyFood] [bit] NULL,
	[Vegeterian] [bit] NULL,
	[DeliveryOnly] [bit] NULL,
 CONSTRAINT [PK_FoodStore] PRIMARY KEY CLUSTERED 
(
	[FoodStoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodStoreCuisine]    Script Date: 2/15/2018 9:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodStoreCuisine](
	[FoodStoreCuisineID] [int] IDENTITY(1,1) NOT NULL,
	[FoodStoreID] [int] NULL,
	[CuisineID] [int] NULL,
 CONSTRAINT [PK_FoodStoreCuisine] PRIMARY KEY CLUSTERED 
(
	[FoodStoreCuisineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodStoreHour]    Script Date: 2/15/2018 9:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodStoreHour](
	[FoodStoreHourID] [int] IDENTITY(1,1) NOT NULL,
	[FoodStoreID] [int] NULL,
	[Day] [nvarchar](50) NULL,
	[TimeFrom] [nvarchar](50) NULL,
	[TimeTo] [nvarchar](50) NULL,
	[Closed] [bit] NULL,
	[Note] [nchar](10) NULL,
 CONSTRAINT [PK_FoodStoreHour] PRIMARY KEY CLUSTERED 
(
	[FoodStoreHourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodStoreLocation]    Script Date: 2/15/2018 9:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodStoreLocation](
	[FoodStoreLocationID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](200) NULL,
	[City] [nvarchar](100) NULL,
	[CountryID] [int] NULL,
	[PostalCode] [nvarchar](10) NULL,
	[UnitNum] [nvarchar](50) NULL,
	[provinceID] [int] NULL,
	[Phone1] [nvarchar](50) NULL,
	[Phone2] [nvarchar](50) NULL,
	[FoodStoreID] [int] NULL,
 CONSTRAINT [PK_FoodStoreLocation] PRIMARY KEY CLUSTERED 
(
	[FoodStoreLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodStorePhoto]    Script Date: 2/15/2018 9:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodStorePhoto](
	[FoodStorePhotoID] [int] IDENTITY(1,1) NOT NULL,
	[FoodStoreID] [int] NULL,
	[PhotoName] [nvarchar](200) NULL,
	[FoodStorePhoto] [image] NULL,
 CONSTRAINT [PK_FoodStorePhoto] PRIMARY KEY CLUSTERED 
(
	[FoodStorePhotoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodStoreReview]    Script Date: 2/15/2018 9:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodStoreReview](
	[FoodStoreReviewID] [int] IDENTITY(1,1) NOT NULL,
	[Reviewer] [nvarchar](200) NULL,
	[Rate] [decimal](1, 1) NULL,
	[FoodStoreReview] [nvarchar](3000) NULL,
	[FoodStoreID] [int] NULL,
 CONSTRAINT [PK_FoodStoreReview] PRIMARY KEY CLUSTERED 
(
	[FoodStoreReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meal]    Script Date: 2/15/2018 9:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meal](
	[MealID] [int] IDENTITY(1,1) NOT NULL,
	[FoodStoreID] [int] NULL,
	[CategoryID] [int] NULL,
	[CuisineID] [int] NULL,
	[MealName] [nvarchar](200) NULL,
	[Description] [nvarchar](3000) NULL,
	[Photo] [image] NULL,
	[Popular] [bit] NULL,
	[Takeaway] [bit] NULL,
	[Stayin] [bit] NULL,
	[AlergyInfo] [nvarchar](1000) NULL,
	[ContainNutes] [bit] NULL,
	[ContainMilk] [bit] NULL,
 CONSTRAINT [PK_Meal] PRIMARY KEY CLUSTERED 
(
	[MealID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MealCategory]    Script Date: 2/15/2018 9:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealCategory](
	[MealCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[MealCategory] [nvarchar](200) NULL,
 CONSTRAINT [PK_MealCategory] PRIMARY KEY CLUSTERED 
(
	[MealCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MealCost]    Script Date: 2/15/2018 9:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealCost](
	[MealCostID] [int] IDENTITY(1,1) NOT NULL,
	[MealID] [int] NULL,
	[MealSizeID] [int] NULL,
	[Cost] [decimal](5, 2) NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[DiscountType] [nvarchar](1) NULL,
	[DiscountAmount] [decimal](5, 2) NULL,
 CONSTRAINT [PK_MealCost] PRIMARY KEY CLUSTERED 
(
	[MealCostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MealPhoto]    Script Date: 2/15/2018 9:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealPhoto](
	[MealPhotoID] [int] IDENTITY(1,1) NOT NULL,
	[MealID] [int] NULL,
	[MealPhotoName] [nvarchar](200) NULL,
	[MealPhoto] [image] NULL,
 CONSTRAINT [PK_MealPhoto] PRIMARY KEY CLUSTERED 
(
	[MealPhotoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MealReview]    Script Date: 2/15/2018 9:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealReview](
	[MealReviewID] [int] IDENTITY(1,1) NOT NULL,
	[Reviewer] [nvarchar](100) NULL,
	[Rate] [decimal](1, 1) NULL,
	[MealReview] [nvarchar](3000) NULL,
 CONSTRAINT [PK_MealReview] PRIMARY KEY CLUSTERED 
(
	[MealReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MealSize]    Script Date: 2/15/2018 9:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealSize](
	[MealSizeID] [int] IDENTITY(1,1) NOT NULL,
	[MealSize] [nvarchar](50) NULL,
 CONSTRAINT [PK_MealSize] PRIMARY KEY CLUSTERED 
(
	[MealSizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2/15/2018 9:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[AvailableMealID] [int] NULL,
	[Quantity] [int] NULL,
	[UPrice] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderMaster]    Script Date: 2/15/2018 9:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderMaster](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[TotalCost] [decimal](18, 2) NULL,
	[DeliveryFee] [decimal](18, 2) NULL,
	[SiteFee] [decimal](18, 2) NULL,
	[HST] [decimal](18, 2) NULL,
	[Tip] [decimal](18, 2) NULL,
	[OrderCost] [decimal](18, 2) NULL,
	[Adderss] [nvarchar](250) NULL,
	[City] [nvarchar](50) NULL,
	[CountryID] [int] NULL,
	[PostalCode] [nvarchar](50) NULL,
	[PhoneNum] [nvarchar](50) NULL,
	[DeliveryMethodID] [int] NULL,
	[Note] [nvarchar](2000) NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[Cancel] [bit] NULL,
	[CancelDate] [datetime] NULL,
	[ProvinceID] [int] NULL,
 CONSTRAINT [PK_OrderMaster] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 2/15/2018 9:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[ProvinceID] [int] IDENTITY(1,1) NOT NULL,
	[Province] [nvarchar](50) NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[ProvinceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Country]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Province] FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Province]
GO
ALTER TABLE [dbo].[CustomerPaymentInfo]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPaymentInfo_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[CustomerPaymentInfo] CHECK CONSTRAINT [FK_CustomerPaymentInfo_Customer]
GO
ALTER TABLE [dbo].[FoodStoreCuisine]  WITH CHECK ADD  CONSTRAINT [FK_FoodStoreCuisine_Cuisine] FOREIGN KEY([CuisineID])
REFERENCES [dbo].[Cuisine] ([CuisineID])
GO
ALTER TABLE [dbo].[FoodStoreCuisine] CHECK CONSTRAINT [FK_FoodStoreCuisine_Cuisine]
GO
ALTER TABLE [dbo].[FoodStoreCuisine]  WITH CHECK ADD  CONSTRAINT [FK_FoodStoreCuisine_FoodStore] FOREIGN KEY([FoodStoreID])
REFERENCES [dbo].[FoodStore] ([FoodStoreID])
GO
ALTER TABLE [dbo].[FoodStoreCuisine] CHECK CONSTRAINT [FK_FoodStoreCuisine_FoodStore]
GO
ALTER TABLE [dbo].[FoodStoreHour]  WITH CHECK ADD  CONSTRAINT [FK_FoodStoreHour_FoodStore] FOREIGN KEY([FoodStoreID])
REFERENCES [dbo].[FoodStore] ([FoodStoreID])
GO
ALTER TABLE [dbo].[FoodStoreHour] CHECK CONSTRAINT [FK_FoodStoreHour_FoodStore]
GO
ALTER TABLE [dbo].[FoodStoreLocation]  WITH CHECK ADD  CONSTRAINT [FK_FoodStoreLocation_FoodStore] FOREIGN KEY([FoodStoreID])
REFERENCES [dbo].[FoodStore] ([FoodStoreID])
GO
ALTER TABLE [dbo].[FoodStoreLocation] CHECK CONSTRAINT [FK_FoodStoreLocation_FoodStore]
GO
ALTER TABLE [dbo].[FoodStorePhoto]  WITH CHECK ADD  CONSTRAINT [FK_FoodStorePhoto_FoodStore] FOREIGN KEY([FoodStoreID])
REFERENCES [dbo].[FoodStore] ([FoodStoreID])
GO
ALTER TABLE [dbo].[FoodStorePhoto] CHECK CONSTRAINT [FK_FoodStorePhoto_FoodStore]
GO
ALTER TABLE [dbo].[FoodStoreReview]  WITH CHECK ADD  CONSTRAINT [FK_FoodStoreReview_FoodStore] FOREIGN KEY([FoodStoreID])
REFERENCES [dbo].[FoodStore] ([FoodStoreID])
GO
ALTER TABLE [dbo].[FoodStoreReview] CHECK CONSTRAINT [FK_FoodStoreReview_FoodStore]
GO
ALTER TABLE [dbo].[OrderMaster]  WITH CHECK ADD  CONSTRAINT [FK_OrderMaster_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[OrderMaster] CHECK CONSTRAINT [FK_OrderMaster_Customer]
GO
USE [master]
GO
ALTER DATABASE [FoodSave] SET  READ_WRITE 
GO
