USE [master]
GO
/****** Object:  Database [EmployeeDB]    Script Date: 10.3.2017 г. 22:19:47 ч. ******/
CREATE DATABASE [EmployeeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\EmployeeDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EmployeeDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\EmployeeDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EmployeeDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmployeeDB] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [EmployeeDB]
GO
/****** Object:  Table [dbo].[CEO]    Script Date: 10.3.2017 г. 22:19:48 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CEO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Salary] [float] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Table_1_3] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeliveryDirectors]    Script Date: 10.3.2017 г. 22:19:48 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryDirectors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Salary] [float] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[ManagerID] [int] NOT NULL,
 CONSTRAINT [PK_Table_1_2] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Intermediates]    Script Date: 10.3.2017 г. 22:19:48 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Intermediates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Salary] [float] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[ManagerID] [int] NULL,
 CONSTRAINT [PK_Intermediate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Juniors]    Script Date: 10.3.2017 г. 22:19:48 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Juniors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Salary] [float] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[ManagerID] [int] NULL,
 CONSTRAINT [PK_Junior] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectManagers]    Script Date: 10.3.2017 г. 22:19:48 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectManagers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Salary] [float] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[ManagerID] [int] NOT NULL,
 CONSTRAINT [PK_ProjectManager] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Projects]    Script Date: 10.3.2017 г. 22:19:48 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](50) NOT NULL,
	[ManagerID] [int] NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Seniors]    Script Date: 10.3.2017 г. 22:19:48 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seniors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Salary] [float] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[ManagerID] [int] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TeamLeaders]    Script Date: 10.3.2017 г. 22:19:48 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamLeaders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Salary] [float] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[ManagerID] [int] NULL,
 CONSTRAINT [PK_TeamLeader] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trainees]    Script Date: 10.3.2017 г. 22:19:48 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Salary] [float] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[ManagerID] [int] NULL,
 CONSTRAINT [PK_Trainee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CEO] ON 

INSERT [dbo].[CEO] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone]) VALUES (1, N'Donald Trump', N'CEO', 50000, N'New York', N'trump@yahoo.com', N'055585482838')
SET IDENTITY_INSERT [dbo].[CEO] OFF
SET IDENTITY_INSERT [dbo].[DeliveryDirectors] ON 

INSERT [dbo].[DeliveryDirectors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ManagerID]) VALUES (1, N'David Cameron', N'Delivery Director', 30000, N'London', N'david@gmail.com', N'04584593234', 1)
INSERT [dbo].[DeliveryDirectors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ManagerID]) VALUES (2, N'Fransoa Oland', N'Delivery Director', 30000, N'Paris', N'fransoa@gmail.com', N'04687123209', 1)
INSERT [dbo].[DeliveryDirectors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ManagerID]) VALUES (3, N'Angela Merkel', N'Delivery Director', 30000, N'Berlin', N'angela@gmail.com', N'04299320201', 1)
SET IDENTITY_INSERT [dbo].[DeliveryDirectors] OFF
SET IDENTITY_INSERT [dbo].[Intermediates] ON 

INSERT [dbo].[Intermediates] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (1, N'Tsanko Tsvetanov', N'Intermediate', 2500, N'Sofia', N'tsanko@abv.bg', N'0897878810', 8, 6)
INSERT [dbo].[Intermediates] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (2, N'Ivaylo Arnaudov', N'Intermediate', 2500, N'Sevlievo', N'ivayloar@abv.bg', N'0897878811', 7, 7)
INSERT [dbo].[Intermediates] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (3, N'Rumen Hristov', N'Intermediate', 2500, N'Gabrovo', N'rumen@abv.bg', N'0897878812', 1, 4)
INSERT [dbo].[Intermediates] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (4, N'Plamen Pekov', N'Intermediate', 2500, N'Sofia', N'plamen@abv.bg', N'0897878813', 10, NULL)
INSERT [dbo].[Intermediates] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (5, N'Hristo Ivanov', N'Intermediate', 2500, N'Sofia', N'ico88@abv.bg', N'0897878814', 5, 2)
INSERT [dbo].[Intermediates] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (6, N'Ivanka Angelova', N'Intermediate', 2500, N'Plovdiv', N'ivanka@abv.bg', N'0897878815', 6, 3)
INSERT [dbo].[Intermediates] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (7, N'Boqn Ivanov', N'Intermediate', 2500, N'Plovdiv', N'bobi99@abv.bg', N'0897878816', 4, 8)
INSERT [dbo].[Intermediates] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (8, N'Denica Hristova', N'Intermediate', 2500, N'Pleven', N'denica@abv.bg', N'0897878817', 3, 1)
INSERT [dbo].[Intermediates] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (9, N'Kiril Efremov', N'Intermediate', 2500, N'Sofia', N'kirilef@abv.bg', N'0897878818', 10, NULL)
INSERT [dbo].[Intermediates] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (10, N'Emil Georgiev', N'Intermediate', 2500, N'Sofia', N'emo123@abv.bg', N'0897878819', 2, 9)
SET IDENTITY_INSERT [dbo].[Intermediates] OFF
SET IDENTITY_INSERT [dbo].[Juniors] ON 

INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (1, N'Svetlio Todorov', N'Junior', 1500, N'Sofia', N'svetliot@abv.bg', N'0894556610', 6, 3)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (2, N'Valentin Parvanov', N'Junior', 1500, N'Sofia', N'valio3456@abv.bg', N'0894556611', 6, 3)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (3, N'Georgi Ivanov', N'Junior', 1500, N'Sofia', N'joroteam@abv.bg', N'0894556612', 1, 4)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (4, N'Viara Ankova', N'Junior', 1500, N'Varna', N'viara@abv.bg', N'0894556613', 2, 9)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (5, N'Mihaela Fileva', N'Junior', 1500, N'Burgas', N'mihaela@abv.bg', N'0894556614', 2, 9)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (6, N'Konstantin Todorov', N'Junior', 1500, N'Burgas', N'kosio@abv.bg', N'0894556615', 3, 1)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (7, N'Kosta Nikolov', N'Junior', 1500, N'Varna', N'kosta@abv.bg', N'0894556616', 9, 5)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (8, N'Iliana Raeva', N'Junior', 1500, N'Sofia', N'iliana@abv.bg', N'0894556617', 7, 7)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (9, N'Tsvetozar Getov', N'Junior', 1500, N'Vidin', N'tsetso@abv.bg', N'0894556618', 4, 8)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (10, N'Genadi Lilov', N'Junior', 1500, N'Sofia', N'genadi@abv.bg', N'0894556619', 4, 8)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (11, N'Stefan Ivanov', N'Junior', 1500, N'Pernik', N'stefaniv@abv.bg', N'0877123440', 10, NULL)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (12, N'Yordan Stefanov', N'Junior', 1500, N'Sofia', N'yordan@abv.bg', N'0877123441', 5, 2)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (13, N'Boris Georgiev', N'Junior', 1500, N'Veliko Tarnovo', N'boris@abv.bg', N'0877123442', 5, 2)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (14, N'Liliana Pavlova', N'Junior', 1500, N'Pleven', N'liliana@abv.bg', N'0877123443', 8, 6)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (15, N'Tatiana Kirilova', N'Junior', 1500, N'Pleven', N'tatiana@abv.bg', N'0877123444', 10, NULL)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (16, N'Viktor Videnov', N'Junior', 1500, N'Haskovo', N'viktor@abv.bg', N'0877123445', 1, 4)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (17, N'Ginka Yordanova', N'Junior', 1500, N'Stara Zagora', N'ginka@abv.bg', N'0877123446', 1, 4)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (18, N'Niki Stefanov', N'Junior', 1500, N'Sofia', N'nikistef@abv.bg', N'0877123447', 4, 8)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (19, N'Desislava Ivanova', N'Junior', 1500, N'Sofia', N'desi567@abv.bg', N'0877123448', 3, 1)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (20, N'Gergana Staneva', N'Junior', 1500, N'Sofia', N'gergana@abv.bg', N'0877123449', 3, 1)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (21, N'Krasimir Todorov', N'Junior', 1500, N'Montana', N'krasi987@abv.bg', N'0888456780', 5, 2)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (22, N'Nikola Pavlov', N'Junior', 1500, N'Lovech', N'nikola111@abv.bg', N'0888456781', 9, 5)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (23, N'Zahari Stefanov', N'Junior', 1500, N'Sofia', N'zahari@abv.bg', N'0888456782', 7, 7)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (24, N'Aneta Petrova', N'Junior', 1500, N'Sofia', N'aneta1234556@abv.bg', N'0888456783', 8, 6)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (25, N'Ana Chaleva', N'Junior', 1500, N'Sofia', N'anach@abv.bg', N'0888456784', 10, NULL)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (26, N'Stoyan Ralchev', N'Junior', 1500, N'Varna', N'stoyanr@abv.bg', N'0888456785', 1, 4)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (27, N'Svetlomir Stefanov', N'Junior', 1500, N'Plovdiv', N'svetlomir@abv.bg', N'0888456786', 6, 3)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (28, N'Rumen Ivanov', N'Junior', 1500, N'Plovdiv', N'rumen8787@abv.bg', N'0888456787', 6, 3)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (29, N'Sotir Petrov', N'Junior', 1500, N'Sofia', N'sotir@abv.bg', N'0888456788', 7, 7)
INSERT [dbo].[Juniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (30, N'Pavel Georgiev', N'Junior', 1500, N'Sofia', N'pavelgeor@abv.bg', N'0888456789', 9, 5)
SET IDENTITY_INSERT [dbo].[Juniors] OFF
SET IDENTITY_INSERT [dbo].[ProjectManagers] ON 

INSERT [dbo].[ProjectManagers] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ManagerID]) VALUES (1, N'Ian Harte', N'Project Manager', 10000, N'Dublin', N'ian@gmail.com', N'0412324345445', 2)
INSERT [dbo].[ProjectManagers] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ManagerID]) VALUES (2, N'Duncan Ferguson', N'Project Manager', 10000, N'Liverpool', N'duncan@gmail.com', N'0489749392212', 3)
INSERT [dbo].[ProjectManagers] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ManagerID]) VALUES (3, N'Damian Duff', N'Project Manager', 10000, N'Newcastle', N'damian@gmail.com', N'0497623132424', 1)
INSERT [dbo].[ProjectManagers] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ManagerID]) VALUES (4, N'Francesco Totti', N'Project Manager', 10000, N'Rome', N'francesco@yahoo.com', N'0554332132421', 1)
INSERT [dbo].[ProjectManagers] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ManagerID]) VALUES (5, N'Fernando Hierro', N'Project Manager', 10000, N'Madrid', N'fernando@gmail.com', N'0675898423423', 3)
INSERT [dbo].[ProjectManagers] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ManagerID]) VALUES (6, N'Tom Brady', N'Project Manager', 10000, N'New England', N'tom@gmail.com', N'0558763423211', 2)
SET IDENTITY_INSERT [dbo].[ProjectManagers] OFF
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([ID], [ProjectName], [ManagerID]) VALUES (1, N'Fast and Furious', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [ManagerID]) VALUES (2, N'Mortal Kombat', 3)
INSERT [dbo].[Projects] ([ID], [ProjectName], [ManagerID]) VALUES (3, N'World Cup', 4)
INSERT [dbo].[Projects] ([ID], [ProjectName], [ManagerID]) VALUES (4, N'Nat GEO', 2)
INSERT [dbo].[Projects] ([ID], [ProjectName], [ManagerID]) VALUES (5, N'Assassin''s Creed', 3)
INSERT [dbo].[Projects] ([ID], [ProjectName], [ManagerID]) VALUES (6, N'Hollywood', 6)
INSERT [dbo].[Projects] ([ID], [ProjectName], [ManagerID]) VALUES (7, N'Cup of Nations', 4)
INSERT [dbo].[Projects] ([ID], [ProjectName], [ManagerID]) VALUES (8, N'Daytona', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [ManagerID]) VALUES (9, N'Euro 2020', 4)
INSERT [dbo].[Projects] ([ID], [ProjectName], [ManagerID]) VALUES (10, N'No project assigned', NULL)
SET IDENTITY_INSERT [dbo].[Projects] OFF
SET IDENTITY_INSERT [dbo].[Seniors] ON 

INSERT [dbo].[Seniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (1, N'Ivan Ivanov', N'Senior', 4000, N'Sofia', N'ivan999@abv.bg', N'0898956990', 4, 8)
INSERT [dbo].[Seniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (2, N'Georgi Georgiev', N'Senior', 4000, N'Stara Zagora', N'joro123@abv.bg', N'0898956991', 2, 9)
INSERT [dbo].[Seniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (3, N'Sergei Petrov', N'Senior', 4000, N'Varna', N'sergo@abv.bg', N'0898956992', 5, 2)
INSERT [dbo].[Seniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (4, N'Predrag Pazin', N'Senior', 4000, N'Veliko Tarnovo', N'predrag@abv.bg', N'0898956993', 7, 7)
INSERT [dbo].[Seniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (5, N'Stefania Koleva', N'Senior', 4000, N'Sofia', N'stefania@abv.bg', N'0898956994', 10, NULL)
INSERT [dbo].[Seniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (6, N'Svetlin Stankov', N'Senior', 4000, N'Sofia', N'svetlio@abv.bg', N'0898956995', 1, 4)
INSERT [dbo].[Seniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (7, N'Ivo Parvanov', N'Senior', 4000, N'Plovdiv', N'ivop@abv.bg', N'0898956996', 3, 1)
INSERT [dbo].[Seniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (8, N'Kristina Marinova', N'Senior', 4000, N'Sofia', N'krisito@abv.bg', N'0898956997', 6, 3)
INSERT [dbo].[Seniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (9, N'Petar Krastev', N'Senior', 4000, N'Blagoevgrad', N'pepo@abv.bg', N'0898956998', 8, 6)
INSERT [dbo].[Seniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (10, N'Pavel Dimitrov', N'Senior', 4000, N'Lovech', N'pacho@abv.bg', N'0898956999', 9, 5)
INSERT [dbo].[Seniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (11, N'Iveta Tsvetkova', N'Senior', 4000, N'Sofia', N'iveta@abv.bg', N'0898956910', 10, NULL)
INSERT [dbo].[Seniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (12, N'Dimitar Nikolov', N'Senior', 4000, N'Sofia', N'mitko@abv.bg', N'0898956911', 6, 3)
INSERT [dbo].[Seniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (13, N'Nikolai Kirilov', N'Senior', 4000, N'Burgas', N'nikik@abv.bg', N'0898956912', 6, 3)
INSERT [dbo].[Seniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (14, N'Gerogi Terziev', N'Senior', 4000, N'Burgas', N'georgiter@abv.bg', N'0898956913', 4, 8)
INSERT [dbo].[Seniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (15, N'Dimo Tonev', N'Senior', 4000, N'Varna', N'dimo@abv.bg', N'0898956914', 9, 5)
INSERT [dbo].[Seniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (16, N'Velin Petrov', N'Senior', 4000, N'Vratsa', N'velin@abv.bg', N'0898956915', 9, 5)
INSERT [dbo].[Seniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (17, N'Petya Stoyanova', N'Senior', 4000, N'Sofia', N'petya@abv.bg', N'0898956916', 5, 2)
INSERT [dbo].[Seniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (18, N'Marin Dimitrov', N'Senior', 4000, N'Sofia', N'marin@abv.bg', N'0898956917', 7, 7)
INSERT [dbo].[Seniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (19, N'Yulian Ivanov', N'Senior', 4000, N'Sofia', N'yuli@abv.bg', N'0898956181', 2, 9)
INSERT [dbo].[Seniors] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (20, N'Bogdan Kanev', N'Senior', 4000, N'Sofia', N'bogdan@abv.bg', N'0898956919', 1, 4)
SET IDENTITY_INSERT [dbo].[Seniors] OFF
SET IDENTITY_INSERT [dbo].[TeamLeaders] ON 

INSERT [dbo].[TeamLeaders] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (1, N'Petar Petrov', N'Team Leader', 5000, N'Sofia', N'petar@abv.bg', N'0897354658', 3, 4)
INSERT [dbo].[TeamLeaders] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (2, N'Piotr Zielinski', N'Team Leader', 5000, N'Gdansk', N'piotr@gmail.com', N'032848484398', 5, 3)
INSERT [dbo].[TeamLeaders] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (3, N'Stefan Zlatev', N'Team Leader', 5000, N'Plovdiv', N'stefan@abv.bg', N'0897129349', 6, 6)
INSERT [dbo].[TeamLeaders] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (4, N'Kiril Jelev', N'Team Leader', 5000, N'Varna', N'kiro@abv.bg', N'0899990021', 1, 1)
INSERT [dbo].[TeamLeaders] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (5, N'Dilian Ivanov', N'Team Leader', 5000, N'Sofia', N'dido@abv.bg', N'0886354647', 9, 4)
INSERT [dbo].[TeamLeaders] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (6, N'Andriy Yarmolenko', N'Team Leader', 5000, N'Kiev', N'andriy@gmail.com', N'032983626374', 8, 1)
INSERT [dbo].[TeamLeaders] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (7, N'Diana Ivanova', N'Team Leader', 5000, N'Varna', N'diana@abv.bg', N'0888124209', 7, 4)
INSERT [dbo].[TeamLeaders] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (8, N'John Snow', N'Team Leader', 5000, N'London', N'john@yahoo.com', N'055541232312', 4, 2)
INSERT [dbo].[TeamLeaders] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (9, N'Kristian Georgiev', N'Team Leader', 5000, N'Pleven', N'kris@abv.bg', N'0895027644', 2, 3)
SET IDENTITY_INSERT [dbo].[TeamLeaders] OFF
SET IDENTITY_INSERT [dbo].[Trainees] ON 

INSERT [dbo].[Trainees] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (1, N'Yoana Petrova', N'Trainee', 1000, N'Pleven', N'yoana@abv.bg', N'0885876540', 1, 4)
INSERT [dbo].[Trainees] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (2, N'Ivailo Tsvetkov', N'Trainee', 1000, N'Vidin', N'kronik666@abv.bg', N'0885876541', 2, 9)
INSERT [dbo].[Trainees] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (3, N'Vladimir Lukanov', N'Trainee', 1000, N'Sofia', N'vladol@abv.bg', N'0885876542', 3, 1)
INSERT [dbo].[Trainees] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (4, N'Petya Petrova', N'Trainee', 1000, N'Pleven', N'peteto@abv.bg', N'0885876543', 5, 2)
INSERT [dbo].[Trainees] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (5, N'Pavel Penkov', N'Trainee', 1000, N'Sofia', N'pavel1986@abv.bg', N'0885876544', 2, 9)
INSERT [dbo].[Trainees] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (6, N'Ilian Popov', N'Trainee', 1000, N'Batak', N'ilianpopov@abv.bg', N'0885876545', 6, 3)
INSERT [dbo].[Trainees] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (7, N'Pavel Krastev', N'Trainee', 1000, N'Sofia', N'pavkata@abv.bg', N'0885876546', 4, 8)
INSERT [dbo].[Trainees] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (8, N'Daniel Stoyanov', N'Trainee', 1000, N'Sofia', N'danist@abv.bg', N'0885876547', 7, 7)
INSERT [dbo].[Trainees] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (9, N'Stela Jekova', N'Trainee', 1000, N'Sevlievo', N'stela@abv.bg', N'0885876548', 8, 6)
INSERT [dbo].[Trainees] ([ID], [Name], [Position], [Salary], [City], [Email], [Phone], [ProjectID], [ManagerID]) VALUES (10, N'Stanimir Borisov', N'Trainee', 1000, N'Sofia', N'stanimir@abv.bg', N'0885876549', 9, 5)
SET IDENTITY_INSERT [dbo].[Trainees] OFF
ALTER TABLE [dbo].[DeliveryDirectors]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryDirector_CEO] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[CEO] ([ID])
GO
ALTER TABLE [dbo].[DeliveryDirectors] CHECK CONSTRAINT [FK_DeliveryDirector_CEO]
GO
ALTER TABLE [dbo].[Intermediates]  WITH CHECK ADD  CONSTRAINT [FK_Intermediate_TeamLeader] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[TeamLeaders] ([ID])
GO
ALTER TABLE [dbo].[Intermediates] CHECK CONSTRAINT [FK_Intermediate_TeamLeader]
GO
ALTER TABLE [dbo].[Intermediates]  WITH CHECK ADD  CONSTRAINT [FK_Intermediates_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[Intermediates] CHECK CONSTRAINT [FK_Intermediates_Projects]
GO
ALTER TABLE [dbo].[Juniors]  WITH CHECK ADD  CONSTRAINT [FK_Junior_TeamLeader] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[TeamLeaders] ([ID])
GO
ALTER TABLE [dbo].[Juniors] CHECK CONSTRAINT [FK_Junior_TeamLeader]
GO
ALTER TABLE [dbo].[Juniors]  WITH CHECK ADD  CONSTRAINT [FK_Juniors_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[Juniors] CHECK CONSTRAINT [FK_Juniors_Projects]
GO
ALTER TABLE [dbo].[ProjectManagers]  WITH CHECK ADD  CONSTRAINT [FK_ProjectManager_DeliveryDirector] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[DeliveryDirectors] ([ID])
GO
ALTER TABLE [dbo].[ProjectManagers] CHECK CONSTRAINT [FK_ProjectManager_DeliveryDirector]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_ProjectManagers] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[ProjectManagers] ([ID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_ProjectManagers]
GO
ALTER TABLE [dbo].[Seniors]  WITH CHECK ADD  CONSTRAINT [FK_Senior_TeamLeader] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[TeamLeaders] ([ID])
GO
ALTER TABLE [dbo].[Seniors] CHECK CONSTRAINT [FK_Senior_TeamLeader]
GO
ALTER TABLE [dbo].[Seniors]  WITH CHECK ADD  CONSTRAINT [FK_Seniors_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[Seniors] CHECK CONSTRAINT [FK_Seniors_Projects]
GO
ALTER TABLE [dbo].[TeamLeaders]  WITH CHECK ADD  CONSTRAINT [FK_TeamLeader_ProjectManager] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[ProjectManagers] ([ID])
GO
ALTER TABLE [dbo].[TeamLeaders] CHECK CONSTRAINT [FK_TeamLeader_ProjectManager]
GO
ALTER TABLE [dbo].[TeamLeaders]  WITH CHECK ADD  CONSTRAINT [FK_TeamLeaders_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[TeamLeaders] CHECK CONSTRAINT [FK_TeamLeaders_Projects]
GO
ALTER TABLE [dbo].[Trainees]  WITH CHECK ADD  CONSTRAINT [FK_Trainee_TeamLeader] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[TeamLeaders] ([ID])
GO
ALTER TABLE [dbo].[Trainees] CHECK CONSTRAINT [FK_Trainee_TeamLeader]
GO
ALTER TABLE [dbo].[Trainees]  WITH CHECK ADD  CONSTRAINT [FK_Trainees_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[Trainees] CHECK CONSTRAINT [FK_Trainees_Projects]
GO
USE [master]
GO
ALTER DATABASE [EmployeeDB] SET  READ_WRITE 
GO
