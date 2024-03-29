USE [master]
GO
/****** Object:  Database [atmdb]    Script Date: 12/4/2019 2:20:13 AM ******/
CREATE DATABASE [atmdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'atmdb', FILENAME = N'C:\Users\Анастасия\atmdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'atmdb_log', FILENAME = N'C:\Users\Анастасия\atmdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [atmdb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [atmdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [atmdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [atmdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [atmdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [atmdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [atmdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [atmdb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [atmdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [atmdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [atmdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [atmdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [atmdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [atmdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [atmdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [atmdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [atmdb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [atmdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [atmdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [atmdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [atmdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [atmdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [atmdb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [atmdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [atmdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [atmdb] SET  MULTI_USER 
GO
ALTER DATABASE [atmdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [atmdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [atmdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [atmdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [atmdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [atmdb] SET QUERY_STORE = OFF
GO
USE [atmdb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [atmdb]
GO
/****** Object:  Table [dbo].[Cards]    Script Date: 12/4/2019 2:20:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CardNumber] [nvarchar](max) NULL,
	[Balance] [float] NOT NULL,
	[PINCode] [nvarchar](max) NULL,
	[IsBlocked] [bit] NOT NULL,
	[AttemptCounter] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Cards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operation]    Script Date: 12/4/2019 2:20:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Time] [datetime2](7) NOT NULL,
	[OperationCodeId] [int] NOT NULL,
	[CardId] [int] NOT NULL,
 CONSTRAINT [PK_Operation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationCode]    Script Date: 12/4/2019 2:20:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationCode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodeName] [nvarchar](max) NULL,
 CONSTRAINT [PK_OperationCode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/4/2019 2:20:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Patronymic] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cards] ON 

INSERT [dbo].[Cards] ([Id], [CardNumber], [Balance], [PINCode], [IsBlocked], [AttemptCounter], [UserId]) VALUES (1, N'1111-1111-1111-1111', 0, N'1111', 0, 0, 1)
INSERT [dbo].[Cards] ([Id], [CardNumber], [Balance], [PINCode], [IsBlocked], [AttemptCounter], [UserId]) VALUES (3, N'2222-2222-2222-2222', 22.65, N'2222', 0, 0, 2)
INSERT [dbo].[Cards] ([Id], [CardNumber], [Balance], [PINCode], [IsBlocked], [AttemptCounter], [UserId]) VALUES (4, N'3333-3333-3333-3333', 12.649999999999999, N'3333', 0, 0, 1002)
INSERT [dbo].[Cards] ([Id], [CardNumber], [Balance], [PINCode], [IsBlocked], [AttemptCounter], [UserId]) VALUES (5, N'4444-4444-4444-4444', 943.65, N'4444', 0, 0, 1003)
INSERT [dbo].[Cards] ([Id], [CardNumber], [Balance], [PINCode], [IsBlocked], [AttemptCounter], [UserId]) VALUES (6, N'5555-5555-5555-5555', 23, N'5555', 0, 0, 1004)
SET IDENTITY_INSERT [dbo].[Cards] OFF
SET IDENTITY_INSERT [dbo].[Operation] ON 

INSERT [dbo].[Operation] ([Id], [Time], [OperationCodeId], [CardId]) VALUES (1, CAST(N'2019-12-04T02:10:33.8173446' AS DateTime2), 1, 4)
INSERT [dbo].[Operation] ([Id], [Time], [OperationCodeId], [CardId]) VALUES (2, CAST(N'2019-12-04T02:10:39.3000602' AS DateTime2), 2, 4)
SET IDENTITY_INSERT [dbo].[Operation] OFF
SET IDENTITY_INSERT [dbo].[OperationCode] ON 

INSERT [dbo].[OperationCode] ([Id], [CodeName]) VALUES (1, N'Cash withdrawal')
INSERT [dbo].[OperationCode] ([Id], [CodeName]) VALUES (2, N'View balance')
SET IDENTITY_INSERT [dbo].[OperationCode] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Surname], [Name], [Patronymic]) VALUES (1, N'Pribytkova', N'Anastasia', N'Andreevna')
INSERT [dbo].[Users] ([Id], [Surname], [Name], [Patronymic]) VALUES (2, N'Panoshylo', N'Aleksey', N'Nikolayevich')
INSERT [dbo].[Users] ([Id], [Surname], [Name], [Patronymic]) VALUES (1002, N'Koshkina', N'Nadezhda', N'Vasilyevna')
INSERT [dbo].[Users] ([Id], [Surname], [Name], [Patronymic]) VALUES (1003, N'Ivanova', N'Valeriya', N'Krykunova')
INSERT [dbo].[Users] ([Id], [Surname], [Name], [Patronymic]) VALUES (1004, N'Zabegalov', N'Konstantin', N'Sergeevich')
INSERT [dbo].[Users] ([Id], [Surname], [Name], [Patronymic]) VALUES (1005, N'Pribytkova', N'Anastasia', N'Andreevna')
INSERT [dbo].[Users] ([Id], [Surname], [Name], [Patronymic]) VALUES (1006, N'Pribytkova', N'Anastasia', N'Andreevna')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [IX_Cards_UserId]    Script Date: 12/4/2019 2:20:13 AM ******/
CREATE NONCLUSTERED INDEX [IX_Cards_UserId] ON [dbo].[Cards]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Operation_CardId]    Script Date: 12/4/2019 2:20:13 AM ******/
CREATE NONCLUSTERED INDEX [IX_Operation_CardId] ON [dbo].[Operation]
(
	[CardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Operation_OperationCodeId]    Script Date: 12/4/2019 2:20:13 AM ******/
CREATE NONCLUSTERED INDEX [IX_Operation_OperationCodeId] ON [dbo].[Operation]
(
	[OperationCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [FK_Cards_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [FK_Cards_Users_UserId]
GO
ALTER TABLE [dbo].[Operation]  WITH CHECK ADD  CONSTRAINT [FK_Operation_Cards_CardId] FOREIGN KEY([CardId])
REFERENCES [dbo].[Cards] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Operation] CHECK CONSTRAINT [FK_Operation_Cards_CardId]
GO
ALTER TABLE [dbo].[Operation]  WITH CHECK ADD  CONSTRAINT [FK_Operation_OperationCode_OperationCodeId] FOREIGN KEY([OperationCodeId])
REFERENCES [dbo].[OperationCode] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Operation] CHECK CONSTRAINT [FK_Operation_OperationCode_OperationCodeId]
GO
USE [master]
GO
ALTER DATABASE [atmdb] SET  READ_WRITE 
GO
