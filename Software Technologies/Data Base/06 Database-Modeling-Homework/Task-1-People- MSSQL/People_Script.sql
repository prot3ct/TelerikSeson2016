USE [master]
GO
/****** Object:  Database [PEOPLE]    Script Date: 10/23/2016 8:24:50 AM ******/
CREATE DATABASE [PEOPLE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PEOPLE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\PEOPLE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PEOPLE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\PEOPLE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PEOPLE] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PEOPLE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PEOPLE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PEOPLE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PEOPLE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PEOPLE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PEOPLE] SET ARITHABORT OFF 
GO
ALTER DATABASE [PEOPLE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PEOPLE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PEOPLE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PEOPLE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PEOPLE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PEOPLE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PEOPLE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PEOPLE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PEOPLE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PEOPLE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PEOPLE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PEOPLE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PEOPLE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PEOPLE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PEOPLE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PEOPLE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PEOPLE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PEOPLE] SET RECOVERY FULL 
GO
ALTER DATABASE [PEOPLE] SET  MULTI_USER 
GO
ALTER DATABASE [PEOPLE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PEOPLE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PEOPLE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PEOPLE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PEOPLE] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PEOPLE', N'ON'
GO
ALTER DATABASE [PEOPLE] SET QUERY_STORE = OFF
GO
USE [PEOPLE]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [PEOPLE]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 10/23/2016 8:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[adress_text] [nvarchar](200) NULL,
	[town_id] [int] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Continent]    Script Date: 10/23/2016 8:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Continent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 10/23/2016 8:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[continent_id] [int] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 10/23/2016 8:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NULL,
	[address_id] [int] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Town]    Script Date: 10/23/2016 8:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Town](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[country_id] [int] NULL,
 CONSTRAINT [PK_Town] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([id], [adress_text], [town_id]) VALUES (1, N'NUts96shB5ftpvLL', 1)
INSERT [dbo].[Address] ([id], [adress_text], [town_id]) VALUES (2, N'Praesent in enim nec libero fringilla tincidunt at scelerisque ', 3)
INSERT [dbo].[Address] ([id], [adress_text], [town_id]) VALUES (3, N'NUNulla orci sem, eleifend in ornare vel, mattis sit LL', 4)
INSERT [dbo].[Address] ([id], [adress_text], [town_id]) VALUES (4, N'scelerisque velit sit amet libero ornare cursus. Integer viverra lectus ac turpis dign', 8)
INSERT [dbo].[Address] ([id], [adress_text], [town_id]) VALUES (5, N'ulla enim ante, tempus sodales an', 1)
INSERT [dbo].[Address] ([id], [adress_text], [town_id]) VALUES (6, N'tium est. Nunc molli', 1)
INSERT [dbo].[Address] ([id], [adress_text], [town_id]) VALUES (7, N'Morbi rutrum nulla non dui semper ullamcorper', 6)
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[Continent] ON 

INSERT [dbo].[Continent] ([id], [name]) VALUES (1, N'Europe')
INSERT [dbo].[Continent] ([id], [name]) VALUES (2, N'Asia')
INSERT [dbo].[Continent] ([id], [name]) VALUES (3, N'America')
INSERT [dbo].[Continent] ([id], [name]) VALUES (4, N'Australia')
SET IDENTITY_INSERT [dbo].[Continent] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([id], [name], [continent_id]) VALUES (1, N'Bulgaria', 1)
INSERT [dbo].[Country] ([id], [name], [continent_id]) VALUES (2, N'France', 1)
INSERT [dbo].[Country] ([id], [name], [continent_id]) VALUES (3, N'Canada', 3)
INSERT [dbo].[Country] ([id], [name], [continent_id]) VALUES (4, N'Turkey', 2)
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([id], [first_name], [last_name], [address_id]) VALUES (1, N'Prter', N'Petrov', 2)
INSERT [dbo].[Person] ([id], [first_name], [last_name], [address_id]) VALUES (2, N'Mike', NULL, 4)
INSERT [dbo].[Person] ([id], [first_name], [last_name], [address_id]) VALUES (3, N'Robert', N'Pain', 7)
INSERT [dbo].[Person] ([id], [first_name], [last_name], [address_id]) VALUES (4, N'Pesho', N'Popov', 2)
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Town] ON 

INSERT [dbo].[Town] ([id], [name], [country_id]) VALUES (1, N'Sofia', 1)
INSERT [dbo].[Town] ([id], [name], [country_id]) VALUES (2, N'Plovdiv', 1)
INSERT [dbo].[Town] ([id], [name], [country_id]) VALUES (3, N'Paris', 2)
INSERT [dbo].[Town] ([id], [name], [country_id]) VALUES (4, N'Kale', 2)
INSERT [dbo].[Town] ([id], [name], [country_id]) VALUES (5, N'Varna', 1)
INSERT [dbo].[Town] ([id], [name], [country_id]) VALUES (6, N'Monreal', 3)
INSERT [dbo].[Town] ([id], [name], [country_id]) VALUES (7, N'Ankara', 4)
INSERT [dbo].[Town] ([id], [name], [country_id]) VALUES (8, N'Toronto', 3)
SET IDENTITY_INSERT [dbo].[Town] OFF
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Town] FOREIGN KEY([town_id])
REFERENCES [dbo].[Town] ([id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Town]
GO
ALTER TABLE [dbo].[Country]  WITH CHECK ADD  CONSTRAINT [FK_Country_Continent] FOREIGN KEY([continent_id])
REFERENCES [dbo].[Continent] ([id])
GO
ALTER TABLE [dbo].[Country] CHECK CONSTRAINT [FK_Country_Continent]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Address] FOREIGN KEY([address_id])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Address]
GO
ALTER TABLE [dbo].[Town]  WITH CHECK ADD  CONSTRAINT [FK_Town_Country] FOREIGN KEY([country_id])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Town] CHECK CONSTRAINT [FK_Town_Country]
GO
USE [master]
GO
ALTER DATABASE [PEOPLE] SET  READ_WRITE 
GO
