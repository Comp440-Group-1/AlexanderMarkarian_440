USE [master]
GO
/****** Object:  Database [dbclass440]    Script Date: 5/2/2016 4:08:53 PM ******/
CREATE DATABASE [dbclass440]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbclass440', FILENAME = N'c:\databases\dbclass440\dbclass440.mdf' , SIZE = 3264KB , MAXSIZE = 20971520KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'dbclass440_log', FILENAME = N'c:\databases\dbclass440\dbclass440_log.ldf' , SIZE = 1024KB , MAXSIZE = 1048576KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbclass440] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbclass440].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbclass440] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbclass440] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbclass440] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbclass440] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbclass440] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbclass440] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbclass440] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [dbclass440] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbclass440] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbclass440] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbclass440] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbclass440] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbclass440] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbclass440] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbclass440] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbclass440] SET AUTO_UPDATE_STATISTICS_ASYNC ON 
GO
ALTER DATABASE [dbclass440] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbclass440] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbclass440] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbclass440] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbclass440] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbclass440] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbclass440] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbclass440] SET  MULTI_USER 
GO
ALTER DATABASE [dbclass440] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbclass440] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbclass440] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbclass440] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [dbclass440] SET DELAYED_DURABILITY = DISABLED 
GO
USE [dbclass440]
GO
/****** Object:  User [GEAR\Domain Admins]    Script Date: 5/2/2016 4:08:54 PM ******/
CREATE USER [GEAR\Domain Admins] FOR LOGIN [GEAR\Domain Admins]
GO
ALTER ROLE [db_owner] ADD MEMBER [GEAR\Domain Admins]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 5/2/2016 4:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[address_id] [int] NOT NULL,
	[street_address] [nchar](20) NOT NULL,
	[city_id] [int] NOT NULL,
	[state_id] [int] NULL,
	[country_id] [int] NOT NULL,
	[zip_code] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Branch]    Script Date: 5/2/2016 4:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[branch_id] [int] NOT NULL,
	[branch_name] [nchar](20) NULL,
	[iteration_id] [int] NOT NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 5/2/2016 4:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[city_id] [int] NOT NULL,
	[city_name] [nchar](20) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 5/2/2016 4:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[company_id] [int] NOT NULL,
	[company_name] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompanyAddress]    Script Date: 5/2/2016 4:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyAddress](
	[company_id] [int] NULL,
	[address_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 5/2/2016 4:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[country_id] [int] NOT NULL,
	[country_name] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/2/2016 4:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [int] NOT NULL,
	[first_name] [nchar](20) NULL,
	[last_name] [nchar](20) NULL,
	[email_address] [nchar](20) NULL,
	[company_id] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Download]    Script Date: 5/2/2016 4:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Download](
	[download_id] [int] NOT NULL,
	[download_date] [nchar](20) NULL,
	[customer_id] [int] NOT NULL,
	[release_id] [int] NOT NULL,
 CONSTRAINT [PK_Download] PRIMARY KEY CLUSTERED 
(
	[download_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feature]    Script Date: 5/2/2016 4:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[feature_id] [int] NOT NULL,
	[feature_name] [nchar](20) NOT NULL,
	[feature_description] [nchar](100) NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[feature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Iteration]    Script Date: 5/2/2016 4:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Iteration](
	[iteration_id] [int] NOT NULL,
	[iteration_label] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Iteration] PRIMARY KEY CLUSTERED 
(
	[iteration_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phone]    Script Date: 5/2/2016 4:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone](
	[phone_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[phone_number] [nchar](10) NOT NULL,
	[phone_type_id] [int] NOT NULL,
 CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED 
(
	[phone_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhoneType]    Script Date: 5/2/2016 4:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneType](
	[phone_type_id] [int] NOT NULL,
	[phone_type] [nchar](10) NOT NULL,
 CONSTRAINT [PK_PhoneType] PRIMARY KEY CLUSTERED 
(
	[phone_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Platform]    Script Date: 5/2/2016 4:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Platform](
	[platform_id] [int] NOT NULL,
	[platform_type] [nchar](10) NULL,
 CONSTRAINT [PK_Platform] PRIMARY KEY CLUSTERED 
(
	[platform_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/2/2016 4:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] NOT NULL,
	[product_name] [nchar](20) NULL,
	[product_description] [nchar](100) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Release]    Script Date: 5/2/2016 4:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Release](
	[release_id] [int] NOT NULL,
	[release_date] [nchar](20) NOT NULL,
	[download_link] [nchar](50) NOT NULL,
	[version_id] [int] NOT NULL,
 CONSTRAINT [PK_Release] PRIMARY KEY CLUSTERED 
(
	[release_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[State]    Script Date: 5/2/2016 4:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[state_id] [int] NOT NULL,
	[state_name] [nchar](20) NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Version]    Script Date: 5/2/2016 4:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Version](
	[version_id] [int] NOT NULL,
	[version_number] [nchar](10) NOT NULL,
	[product_id] [int] NOT NULL,
	[platform_id] [int] NOT NULL,
	[release_date] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Version] PRIMARY KEY CLUSTERED 
(
	[version_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VersionFeature]    Script Date: 5/2/2016 4:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VersionFeature](
	[version_id] [int] NOT NULL,
	[feature_id] [int] NOT NULL,
 CONSTRAINT [PK_VersionFeature] PRIMARY KEY CLUSTERED 
(
	[version_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_City] FOREIGN KEY([city_id])
REFERENCES [dbo].[City] ([city_id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_City]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Country] FOREIGN KEY([country_id])
REFERENCES [dbo].[Country] ([country_id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Country]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_State] FOREIGN KEY([state_id])
REFERENCES [dbo].[State] ([state_id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_State]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_Iteration] FOREIGN KEY([iteration_id])
REFERENCES [dbo].[Iteration] ([iteration_id])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_Iteration]
GO
ALTER TABLE [dbo].[CompanyAddress]  WITH CHECK ADD  CONSTRAINT [FK_CompanyAddress_Address] FOREIGN KEY([address_id])
REFERENCES [dbo].[Address] ([address_id])
GO
ALTER TABLE [dbo].[CompanyAddress] CHECK CONSTRAINT [FK_CompanyAddress_Address]
GO
ALTER TABLE [dbo].[CompanyAddress]  WITH CHECK ADD  CONSTRAINT [FK_CompanyAddress_Company] FOREIGN KEY([company_id])
REFERENCES [dbo].[Company] ([company_id])
GO
ALTER TABLE [dbo].[CompanyAddress] CHECK CONSTRAINT [FK_CompanyAddress_Company]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Company] FOREIGN KEY([company_id])
REFERENCES [dbo].[Company] ([company_id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Company]
GO
ALTER TABLE [dbo].[Download]  WITH CHECK ADD  CONSTRAINT [FK_Download_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Download] CHECK CONSTRAINT [FK_Download_Customer]
GO
ALTER TABLE [dbo].[Download]  WITH CHECK ADD  CONSTRAINT [FK_Download_Release] FOREIGN KEY([release_id])
REFERENCES [dbo].[Release] ([release_id])
GO
ALTER TABLE [dbo].[Download] CHECK CONSTRAINT [FK_Download_Release]
GO
ALTER TABLE [dbo].[Phone]  WITH CHECK ADD  CONSTRAINT [FK_Phone_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Phone] CHECK CONSTRAINT [FK_Phone_Customer]
GO
ALTER TABLE [dbo].[Phone]  WITH CHECK ADD  CONSTRAINT [FK_Phone_PhoneType] FOREIGN KEY([phone_type_id])
REFERENCES [dbo].[PhoneType] ([phone_type_id])
GO
ALTER TABLE [dbo].[Phone] CHECK CONSTRAINT [FK_Phone_PhoneType]
GO
ALTER TABLE [dbo].[Release]  WITH CHECK ADD  CONSTRAINT [FK_Release_Version] FOREIGN KEY([version_id])
REFERENCES [dbo].[Version] ([version_id])
GO
ALTER TABLE [dbo].[Release] CHECK CONSTRAINT [FK_Release_Version]
GO
ALTER TABLE [dbo].[Version]  WITH CHECK ADD  CONSTRAINT [FK_Version_Platform] FOREIGN KEY([platform_id])
REFERENCES [dbo].[Platform] ([platform_id])
GO
ALTER TABLE [dbo].[Version] CHECK CONSTRAINT [FK_Version_Platform]
GO
ALTER TABLE [dbo].[Version]  WITH CHECK ADD  CONSTRAINT [FK_Version_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Version] CHECK CONSTRAINT [FK_Version_Product]
GO
ALTER TABLE [dbo].[VersionFeature]  WITH CHECK ADD  CONSTRAINT [FK_VersionFeature_Feature] FOREIGN KEY([feature_id])
REFERENCES [dbo].[Feature] ([feature_id])
GO
ALTER TABLE [dbo].[VersionFeature] CHECK CONSTRAINT [FK_VersionFeature_Feature]
GO
ALTER TABLE [dbo].[VersionFeature]  WITH CHECK ADD  CONSTRAINT [FK_VersionFeature_Version] FOREIGN KEY([version_id])
REFERENCES [dbo].[Version] ([version_id])
GO
ALTER TABLE [dbo].[VersionFeature] CHECK CONSTRAINT [FK_VersionFeature_Version]
GO
USE [master]
GO
ALTER DATABASE [dbclass440] SET  READ_WRITE 
GO
