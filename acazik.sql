USE [master]
GO
/****** Object:  Database [Casino_DB]    Script Date: 24.09.2024 14:23:41 ******/
CREATE DATABASE [Casino_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Casino_DB_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Casino_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Casino_DB_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Casino_DB.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Casino_DB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Casino_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Casino_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Casino_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Casino_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Casino_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Casino_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Casino_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Casino_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Casino_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Casino_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Casino_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Casino_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Casino_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Casino_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Casino_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Casino_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Casino_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Casino_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Casino_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Casino_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Casino_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Casino_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Casino_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Casino_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [Casino_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Casino_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Casino_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Casino_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Casino_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Casino_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Casino_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Casino_DB] SET QUERY_STORE = ON
GO
ALTER DATABASE [Casino_DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Casino_DB]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 24.09.2024 14:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[StartSession] [datetime] NOT NULL,
	[EndSession] [datetime] NULL,
	[UserId] [int] NOT NULL,
	[ResultGame] [int] NOT NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoundGame]    Script Date: 24.09.2024 14:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoundGame](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GameId] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[ResultNumber] [int] NOT NULL,
	[ResultMoney] [int] NOT NULL,
 CONSTRAINT [PK_RoundGame] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 24.09.2024 14:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DataTime] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[AmountMoney] [int] NOT NULL,
	[IsTopUp] [bit] NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 24.09.2024 14:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Game] ON 

INSERT [dbo].[Game] ([Id], [Name], [StartSession], [EndSession], [UserId], [ResultGame]) VALUES (1, N'Roulet', CAST(N'2024-09-21T00:29:32.177' AS DateTime), CAST(N'2024-09-21T00:29:53.057' AS DateTime), 1, 9792)
INSERT [dbo].[Game] ([Id], [Name], [StartSession], [EndSession], [UserId], [ResultGame]) VALUES (2, N'Roulet', CAST(N'2024-09-21T00:30:03.083' AS DateTime), CAST(N'2024-09-21T00:30:18.343' AS DateTime), 1, 4000)
INSERT [dbo].[Game] ([Id], [Name], [StartSession], [EndSession], [UserId], [ResultGame]) VALUES (3, N'Roulet', CAST(N'2024-09-21T00:32:37.980' AS DateTime), CAST(N'2024-09-21T00:32:47.940' AS DateTime), 1, 28000)
INSERT [dbo].[Game] ([Id], [Name], [StartSession], [EndSession], [UserId], [ResultGame]) VALUES (4, N'Roulet', CAST(N'2024-09-21T00:33:20.263' AS DateTime), CAST(N'2024-09-21T00:34:35.973' AS DateTime), 1, 1800)
INSERT [dbo].[Game] ([Id], [Name], [StartSession], [EndSession], [UserId], [ResultGame]) VALUES (5, N'Roulet', CAST(N'2024-09-21T00:36:52.087' AS DateTime), CAST(N'2024-09-21T00:39:07.420' AS DateTime), 9, -17000)
INSERT [dbo].[Game] ([Id], [Name], [StartSession], [EndSession], [UserId], [ResultGame]) VALUES (6, N'Roulet', CAST(N'2024-09-21T00:39:35.073' AS DateTime), CAST(N'2024-09-21T00:39:45.587' AS DateTime), 9, 93000)
INSERT [dbo].[Game] ([Id], [Name], [StartSession], [EndSession], [UserId], [ResultGame]) VALUES (7, N'Roulet', CAST(N'2024-09-24T14:22:15.133' AS DateTime), CAST(N'2024-09-24T14:22:23.403' AS DateTime), 10, 1000000)
INSERT [dbo].[Game] ([Id], [Name], [StartSession], [EndSession], [UserId], [ResultGame]) VALUES (8, N'Roulet', CAST(N'2024-09-24T14:22:25.013' AS DateTime), CAST(N'2024-09-24T14:22:29.747' AS DateTime), 10, 500000)
INSERT [dbo].[Game] ([Id], [Name], [StartSession], [EndSession], [UserId], [ResultGame]) VALUES (9, N'Roulet', CAST(N'2024-09-24T14:22:32.160' AS DateTime), CAST(N'2024-09-24T14:22:43.487' AS DateTime), 10, 6000000)
INSERT [dbo].[Game] ([Id], [Name], [StartSession], [EndSession], [UserId], [ResultGame]) VALUES (10, N'Roulet', CAST(N'2024-09-24T14:22:45.687' AS DateTime), CAST(N'2024-09-24T14:22:47.060' AS DateTime), 10, 1000000)
INSERT [dbo].[Game] ([Id], [Name], [StartSession], [EndSession], [UserId], [ResultGame]) VALUES (11, N'Roulet', CAST(N'2024-09-24T14:22:47.573' AS DateTime), CAST(N'2024-09-24T14:22:48.417' AS DateTime), 10, 1000000)
INSERT [dbo].[Game] ([Id], [Name], [StartSession], [EndSession], [UserId], [ResultGame]) VALUES (12, N'Roulet', CAST(N'2024-09-24T14:22:49.470' AS DateTime), CAST(N'2024-09-24T14:22:54.740' AS DateTime), 10, -500000)
SET IDENTITY_INSERT [dbo].[Game] OFF
GO
SET IDENTITY_INSERT [dbo].[RoundGame] ON 

INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (1, 1, CAST(N'2024-09-21T00:29:32.320' AS DateTime), 23, 999)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (2, 1, CAST(N'2024-09-21T00:29:41.867' AS DateTime), 8, 977)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (3, 1, CAST(N'2024-09-21T00:29:43.577' AS DateTime), 10, 977)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (4, 1, CAST(N'2024-09-21T00:29:44.360' AS DateTime), 10, 977)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (5, 1, CAST(N'2024-09-21T00:29:45.060' AS DateTime), 20, 977)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (6, 1, CAST(N'2024-09-21T00:29:45.833' AS DateTime), 27, 977)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (7, 1, CAST(N'2024-09-21T00:29:46.663' AS DateTime), 11, 977)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (8, 1, CAST(N'2024-09-21T00:29:47.530' AS DateTime), 15, 977)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (9, 1, CAST(N'2024-09-21T00:29:48.243' AS DateTime), 25, 977)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (10, 1, CAST(N'2024-09-21T00:29:49.890' AS DateTime), 12, 977)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (11, 2, CAST(N'2024-09-21T00:30:03.087' AS DateTime), 21, 2000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (12, 2, CAST(N'2024-09-21T00:30:05.820' AS DateTime), 32, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (13, 2, CAST(N'2024-09-21T00:30:07.850' AS DateTime), 16, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (14, 2, CAST(N'2024-09-21T00:30:08.873' AS DateTime), 2, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (15, 2, CAST(N'2024-09-21T00:30:10.960' AS DateTime), 24, 2000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (16, 2, CAST(N'2024-09-21T00:30:15.660' AS DateTime), 23, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (17, 2, CAST(N'2024-09-21T00:30:17.407' AS DateTime), 32, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (18, 3, CAST(N'2024-09-21T00:32:37.987' AS DateTime), 14, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (19, 3, CAST(N'2024-09-21T00:32:39.430' AS DateTime), 23, 2000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (20, 3, CAST(N'2024-09-21T00:32:41.073' AS DateTime), 15, 2000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (21, 3, CAST(N'2024-09-21T00:32:41.610' AS DateTime), 6, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (22, 3, CAST(N'2024-09-21T00:32:41.897' AS DateTime), 18, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (23, 3, CAST(N'2024-09-21T00:32:42.113' AS DateTime), 14, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (24, 3, CAST(N'2024-09-21T00:32:42.273' AS DateTime), 15, 2000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (25, 3, CAST(N'2024-09-21T00:32:42.463' AS DateTime), 3, 2000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (26, 3, CAST(N'2024-09-21T00:32:42.630' AS DateTime), 35, 2000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (27, 3, CAST(N'2024-09-21T00:32:42.913' AS DateTime), 28, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (28, 3, CAST(N'2024-09-21T00:32:43.087' AS DateTime), 23, 2000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (29, 3, CAST(N'2024-09-21T00:32:43.410' AS DateTime), 36, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (30, 3, CAST(N'2024-09-21T00:32:43.573' AS DateTime), 17, 2000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (31, 3, CAST(N'2024-09-21T00:32:43.753' AS DateTime), 25, 2000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (32, 3, CAST(N'2024-09-21T00:32:43.940' AS DateTime), 14, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (33, 3, CAST(N'2024-09-21T00:32:44.123' AS DateTime), 22, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (34, 3, CAST(N'2024-09-21T00:32:44.267' AS DateTime), 9, 2000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (35, 3, CAST(N'2024-09-21T00:32:44.423' AS DateTime), 28, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (36, 3, CAST(N'2024-09-21T00:32:44.577' AS DateTime), 9, 2000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (37, 3, CAST(N'2024-09-21T00:32:44.713' AS DateTime), 20, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (38, 3, CAST(N'2024-09-21T00:32:44.847' AS DateTime), 8, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (39, 3, CAST(N'2024-09-21T00:32:44.993' AS DateTime), 13, 2000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (40, 3, CAST(N'2024-09-21T00:32:45.117' AS DateTime), 24, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (41, 3, CAST(N'2024-09-21T00:32:45.263' AS DateTime), 25, 2000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (42, 3, CAST(N'2024-09-21T00:32:45.410' AS DateTime), 30, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (43, 3, CAST(N'2024-09-21T00:32:45.567' AS DateTime), 12, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (44, 3, CAST(N'2024-09-21T00:32:45.720' AS DateTime), 12, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (45, 3, CAST(N'2024-09-21T00:32:45.967' AS DateTime), 35, 2000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (46, 3, CAST(N'2024-09-21T00:32:46.173' AS DateTime), 0, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (47, 3, CAST(N'2024-09-21T00:32:46.290' AS DateTime), 35, 2000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (48, 3, CAST(N'2024-09-21T00:32:46.417' AS DateTime), 22, 0)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (49, 4, CAST(N'2024-09-21T00:33:20.267' AS DateTime), 21, 900)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (50, 4, CAST(N'2024-09-21T00:33:41.880' AS DateTime), 24, 900)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (51, 5, CAST(N'2024-09-21T00:36:52.103' AS DateTime), 32, -9000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (52, 5, CAST(N'2024-09-21T00:36:57.843' AS DateTime), 30, -9000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (53, 5, CAST(N'2024-09-21T00:37:01.703' AS DateTime), 32, 20000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (54, 5, CAST(N'2024-09-21T00:37:03.333' AS DateTime), 30, 20000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (55, 5, CAST(N'2024-09-21T00:37:04.330' AS DateTime), 8, 20000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (56, 5, CAST(N'2024-09-21T00:37:05.170' AS DateTime), 6, 20000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (57, 5, CAST(N'2024-09-21T00:37:06.483' AS DateTime), 21, -9000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (58, 5, CAST(N'2024-09-21T00:38:48.963' AS DateTime), 36, 20000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (59, 5, CAST(N'2024-09-21T00:38:50.530' AS DateTime), 13, -9000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (60, 5, CAST(N'2024-09-21T00:38:53.357' AS DateTime), 29, -9000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (61, 5, CAST(N'2024-09-21T00:38:55.053' AS DateTime), 23, -9000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (62, 5, CAST(N'2024-09-21T00:38:59.973' AS DateTime), 0, -9000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (63, 5, CAST(N'2024-09-21T00:39:00.407' AS DateTime), 11, -9000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (64, 5, CAST(N'2024-09-21T00:39:00.830' AS DateTime), 29, -9000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (65, 5, CAST(N'2024-09-21T00:39:01.317' AS DateTime), 23, -9000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (66, 5, CAST(N'2024-09-21T00:39:01.790' AS DateTime), 24, -9000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (67, 5, CAST(N'2024-09-21T00:39:04.627' AS DateTime), 16, -9000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (68, 5, CAST(N'2024-09-21T00:39:06.400' AS DateTime), 1, -9000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (69, 6, CAST(N'2024-09-21T00:39:35.080' AS DateTime), 31, -9000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (70, 6, CAST(N'2024-09-21T00:39:38.833' AS DateTime), 35, 20000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (71, 6, CAST(N'2024-09-21T00:39:39.353' AS DateTime), 19, 20000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (72, 6, CAST(N'2024-09-21T00:39:39.857' AS DateTime), 21, 20000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (73, 6, CAST(N'2024-09-21T00:39:40.353' AS DateTime), 34, -9000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (74, 6, CAST(N'2024-09-21T00:39:40.853' AS DateTime), 5, 20000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (75, 6, CAST(N'2024-09-21T00:39:41.323' AS DateTime), 24, -9000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (76, 6, CAST(N'2024-09-21T00:39:41.823' AS DateTime), 31, 20000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (77, 6, CAST(N'2024-09-21T00:39:44.197' AS DateTime), 23, 20000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (78, 7, CAST(N'2024-09-24T14:22:15.140' AS DateTime), 26, 1000000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (79, 8, CAST(N'2024-09-24T14:22:25.013' AS DateTime), 24, 1000000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (80, 8, CAST(N'2024-09-24T14:22:26.803' AS DateTime), 3, -500000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (81, 9, CAST(N'2024-09-24T14:22:32.163' AS DateTime), 28, 1000000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (82, 9, CAST(N'2024-09-24T14:22:34.170' AS DateTime), 36, 1000000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (83, 9, CAST(N'2024-09-24T14:22:34.843' AS DateTime), 2, 1000000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (84, 9, CAST(N'2024-09-24T14:22:35.803' AS DateTime), 34, 1000000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (85, 9, CAST(N'2024-09-24T14:22:36.673' AS DateTime), 1, -500000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (86, 9, CAST(N'2024-09-24T14:22:37.737' AS DateTime), 32, 1000000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (87, 9, CAST(N'2024-09-24T14:22:38.560' AS DateTime), 16, 1000000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (88, 9, CAST(N'2024-09-24T14:22:39.033' AS DateTime), 16, 1000000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (89, 9, CAST(N'2024-09-24T14:22:39.617' AS DateTime), 15, -500000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (90, 10, CAST(N'2024-09-24T14:22:45.690' AS DateTime), 26, 1000000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (91, 11, CAST(N'2024-09-24T14:22:47.577' AS DateTime), 22, 1000000)
INSERT [dbo].[RoundGame] ([Id], [GameId], [DateTime], [ResultNumber], [ResultMoney]) VALUES (92, 12, CAST(N'2024-09-24T14:22:49.470' AS DateTime), 19, -500000)
SET IDENTITY_INSERT [dbo].[RoundGame] OFF
GO
SET IDENTITY_INSERT [dbo].[Transaction] ON 

INSERT [dbo].[Transaction] ([Id], [DataTime], [UserId], [AmountMoney], [IsTopUp]) VALUES (1, CAST(N'2024-09-20T18:53:36.173' AS DateTime), 1, 1000, 1)
INSERT [dbo].[Transaction] ([Id], [DataTime], [UserId], [AmountMoney], [IsTopUp]) VALUES (2, CAST(N'2024-09-20T19:04:48.367' AS DateTime), 1, 120, 1)
INSERT [dbo].[Transaction] ([Id], [DataTime], [UserId], [AmountMoney], [IsTopUp]) VALUES (3, CAST(N'2024-09-20T19:12:44.827' AS DateTime), 8, 100000, 1)
INSERT [dbo].[Transaction] ([Id], [DataTime], [UserId], [AmountMoney], [IsTopUp]) VALUES (4, CAST(N'2024-09-20T19:28:25.033' AS DateTime), 1, 1212, 0)
INSERT [dbo].[Transaction] ([Id], [DataTime], [UserId], [AmountMoney], [IsTopUp]) VALUES (5, CAST(N'2024-09-20T20:31:46.080' AS DateTime), 1, 1000, 1)
INSERT [dbo].[Transaction] ([Id], [DataTime], [UserId], [AmountMoney], [IsTopUp]) VALUES (6, CAST(N'2024-09-21T00:30:44.853' AS DateTime), 1, 1000, 1)
INSERT [dbo].[Transaction] ([Id], [DataTime], [UserId], [AmountMoney], [IsTopUp]) VALUES (7, CAST(N'2024-09-21T00:32:13.640' AS DateTime), 1, 155, 0)
INSERT [dbo].[Transaction] ([Id], [DataTime], [UserId], [AmountMoney], [IsTopUp]) VALUES (8, CAST(N'2024-09-21T00:36:41.127' AS DateTime), 9, 1000000, 1)
INSERT [dbo].[Transaction] ([Id], [DataTime], [UserId], [AmountMoney], [IsTopUp]) VALUES (9, CAST(N'2024-09-24T14:22:04.697' AS DateTime), 10, 10000000, 1)
SET IDENTITY_INSERT [dbo].[Transaction] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Name], [Login], [Password]) VALUES (1, N'Карим', N'Qwerty ', N'123123')
INSERT [dbo].[User] ([Id], [Name], [Login], [Password]) VALUES (2, N'2', N'2', N'2')
INSERT [dbo].[User] ([Id], [Name], [Login], [Password]) VALUES (3, N'3', N'3', N'3')
INSERT [dbo].[User] ([Id], [Name], [Login], [Password]) VALUES (4, N'4', N'4', N'4')
INSERT [dbo].[User] ([Id], [Name], [Login], [Password]) VALUES (5, N'5', N'5', N'5')
INSERT [dbo].[User] ([Id], [Name], [Login], [Password]) VALUES (6, N'6', N'6', N'6')
INSERT [dbo].[User] ([Id], [Name], [Login], [Password]) VALUES (7, N'7', N'7', N'7')
INSERT [dbo].[User] ([Id], [Name], [Login], [Password]) VALUES (8, N'qwe', N'qwe', N'qwe')
INSERT [dbo].[User] ([Id], [Name], [Login], [Password]) VALUES (9, N'Карим', N'Qwerty123', N'123123')
INSERT [dbo].[User] ([Id], [Name], [Login], [Password]) VALUES (10, N'Bulat', N'Bulatishe', N'hahaha')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_User]
GO
ALTER TABLE [dbo].[RoundGame]  WITH CHECK ADD  CONSTRAINT [FK_RoundGame_Game] FOREIGN KEY([GameId])
REFERENCES [dbo].[Game] ([Id])
GO
ALTER TABLE [dbo].[RoundGame] CHECK CONSTRAINT [FK_RoundGame_Game]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_User]
GO
USE [master]
GO
ALTER DATABASE [Casino_DB] SET  READ_WRITE 
GO
