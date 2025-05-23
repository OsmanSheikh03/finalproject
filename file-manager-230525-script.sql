USE [master]
GO
/****** Object:  Database [FileMgrApp21May2025]    Script Date: 23-05-2025 18:00:40 ******/
CREATE DATABASE [FileMgrApp21May2025]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FileMgrApp21May2025', FILENAME = N'C:\Users\infoc\FileMgrApp21May2025.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FileMgrApp21May2025_log', FILENAME = N'C:\Users\infoc\FileMgrApp21May2025_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FileMgrApp21May2025] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FileMgrApp21May2025].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FileMgrApp21May2025] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FileMgrApp21May2025] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FileMgrApp21May2025] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FileMgrApp21May2025] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FileMgrApp21May2025] SET ARITHABORT OFF 
GO
ALTER DATABASE [FileMgrApp21May2025] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FileMgrApp21May2025] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FileMgrApp21May2025] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FileMgrApp21May2025] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FileMgrApp21May2025] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FileMgrApp21May2025] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FileMgrApp21May2025] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FileMgrApp21May2025] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FileMgrApp21May2025] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FileMgrApp21May2025] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FileMgrApp21May2025] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FileMgrApp21May2025] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FileMgrApp21May2025] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FileMgrApp21May2025] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FileMgrApp21May2025] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FileMgrApp21May2025] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FileMgrApp21May2025] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FileMgrApp21May2025] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FileMgrApp21May2025] SET  MULTI_USER 
GO
ALTER DATABASE [FileMgrApp21May2025] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FileMgrApp21May2025] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FileMgrApp21May2025] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FileMgrApp21May2025] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FileMgrApp21May2025] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FileMgrApp21May2025] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FileMgrApp21May2025] SET QUERY_STORE = OFF
GO
USE [FileMgrApp21May2025]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 23-05-2025 18:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 23-05-2025 18:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 23-05-2025 18:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 23-05-2025 18:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 23-05-2025 18:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 23-05-2025 18:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 23-05-2025 18:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 23-05-2025 18:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 23-05-2025 18:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Size] [bigint] NOT NULL,
	[UploadDate] [datetime2](7) NOT NULL,
	[Path] [nvarchar](max) NOT NULL,
	[OwnerEmail] [nvarchar](max) NOT NULL,
	[DownloadCount] [int] NOT NULL,
	[LastAccessTime] [datetime2](7) NULL,
	[SharedLink] [nvarchar](max) NULL,
	[LinkPassword] [nvarchar](max) NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250522171510_NewInitialCreate', N'9.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250522171556_AddFileModel', N'9.0.5')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3a0be84d-ee54-47ad-b2bc-779f87a9a8b5', N'test.usr@mydomain.com', N'test.usr@mydomain.com', N'test.usr@mydomain.com', N'test.usr@mydomain.com', 0, N'AQAAAAIAAYagAAAAEOhjPC6wxPd5Lw3+jLHgVNX3o5Bymj89+I+Q9W8poX6hbQtrvPDRfzjNjF+eaN7jlA==', N'KNFREE42HOHMKILV265EPLIYJ6UW52SP', N'252efcac-5e26-411c-9c3e-f0bd3eb1e283', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Files] ON 

INSERT [dbo].[Files] ([Id], [Name], [Size], [UploadDate], [Path], [OwnerEmail], [DownloadCount], [LastAccessTime], [SharedLink], [LinkPassword]) VALUES (1, N'TestFile1', 11, CAST(N'2025-05-22T17:18:55.0861463' AS DateTime2), N'C:\Users\infoc\source\repos\File-Mgr-EF-JWT3\wwwroot/uploads\TestFile1', N'amit.ellipsis@gmail.com', 4, CAST(N'2025-05-23T10:30:52.5428201' AS DateTime2), NULL, N'1307')
INSERT [dbo].[Files] ([Id], [Name], [Size], [UploadDate], [Path], [OwnerEmail], [DownloadCount], [LastAccessTime], [SharedLink], [LinkPassword]) VALUES (2, N'AARU-HEART.png', 21, CAST(N'2025-05-23T04:18:52.0497855' AS DateTime2), N'wwwroot/uploads\AARU-HEART.png', N'amit.ellipsis@gmail.com', 0, NULL, NULL, N'1307')
INSERT [dbo].[Files] ([Id], [Name], [Size], [UploadDate], [Path], [OwnerEmail], [DownloadCount], [LastAccessTime], [SharedLink], [LinkPassword]) VALUES (3, N'AARUS  CARD.png', 57, CAST(N'2025-05-23T05:41:25.9224033' AS DateTime2), N'wwwroot/uploads\AARUS  CARD.png', N'amit.ellipsis@gmail.com', 0, NULL, NULL, N'1307')
INSERT [dbo].[Files] ([Id], [Name], [Size], [UploadDate], [Path], [OwnerEmail], [DownloadCount], [LastAccessTime], [SharedLink], [LinkPassword]) VALUES (4, N'BioIndia-Sangadak-Logo-3x25.jpg', 23, CAST(N'2025-05-23T07:14:50.2284348' AS DateTime2), N'wwwroot/uploads\BioIndia-Sangadak-Logo-3x25.jpg', N'amit.ellipsis@gmail.com', 0, NULL, NULL, NULL)
INSERT [dbo].[Files] ([Id], [Name], [Size], [UploadDate], [Path], [OwnerEmail], [DownloadCount], [LastAccessTime], [SharedLink], [LinkPassword]) VALUES (5, N'Infocorp_Logo_2.png', 47, CAST(N'2025-05-23T07:16:43.7809563' AS DateTime2), N'wwwroot/uploads\Infocorp_Logo_2.png', N'amit.ellipsis@gmail.com', 0, NULL, NULL, NULL)
INSERT [dbo].[Files] ([Id], [Name], [Size], [UploadDate], [Path], [OwnerEmail], [DownloadCount], [LastAccessTime], [SharedLink], [LinkPassword]) VALUES (6, N'Escalera_YT_BackPage_2.png', 115, CAST(N'2025-05-23T07:18:31.1014073' AS DateTime2), N'wwwroot/uploads\Escalera_YT_BackPage_2.png', N'amit.ellipsis@gmail.com', 0, NULL, NULL, NULL)
INSERT [dbo].[Files] ([Id], [Name], [Size], [UploadDate], [Path], [OwnerEmail], [DownloadCount], [LastAccessTime], [SharedLink], [LinkPassword]) VALUES (7, N'Code_Review_Pyramid.png', 1065, CAST(N'2025-05-23T07:27:57.1313754' AS DateTime2), N'wwwroot/uploads\Code_Review_Pyramid.png', N'amit.ellipsis@gmail.com', 0, NULL, NULL, N'abc123$$')
INSERT [dbo].[Files] ([Id], [Name], [Size], [UploadDate], [Path], [OwnerEmail], [DownloadCount], [LastAccessTime], [SharedLink], [LinkPassword]) VALUES (8, N'Final_Logo_IIITL.png', 76, CAST(N'2025-05-23T10:05:16.9950921' AS DateTime2), N'wwwroot/uploads\Final_Logo_IIITL.png', N'amit.ellipsis@gmail.com', 0, NULL, NULL, N'abc123$$')
INSERT [dbo].[Files] ([Id], [Name], [Size], [UploadDate], [Path], [OwnerEmail], [DownloadCount], [LastAccessTime], [SharedLink], [LinkPassword]) VALUES (9, N'test-file-1.png', 11, CAST(N'2025-05-23T12:00:06.4040232' AS DateTime2), N'wwwroot/uploads\test-file-1.png', N'test.usr@mydomain.com', 1, CAST(N'2025-05-23T12:00:48.1273200' AS DateTime2), NULL, N'abc123$$')
INSERT [dbo].[Files] ([Id], [Name], [Size], [UploadDate], [Path], [OwnerEmail], [DownloadCount], [LastAccessTime], [SharedLink], [LinkPassword]) VALUES (10, N'test-file-2.png', 11, CAST(N'2025-05-23T12:02:21.7956525' AS DateTime2), N'wwwroot/uploads\test-file-2.png', N'test.usr@mydomain.com', 0, NULL, NULL, N'abc123$$')
INSERT [dbo].[Files] ([Id], [Name], [Size], [UploadDate], [Path], [OwnerEmail], [DownloadCount], [LastAccessTime], [SharedLink], [LinkPassword]) VALUES (11, N'test-file-3-renamed', 11, CAST(N'2025-05-23T12:02:55.0957607' AS DateTime2), N'C:\Users\infoc\source\repos\File-Mgr-EF-JWT3\wwwroot/uploads\test-file-3-renamed', N'test.usr@mydomain.com', 0, NULL, NULL, N'abc123$$')
SET IDENTITY_INSERT [dbo].[Files] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 23-05-2025 18:00:40 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 23-05-2025 18:00:40 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 23-05-2025 18:00:40 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 23-05-2025 18:00:40 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 23-05-2025 18:00:40 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 23-05-2025 18:00:40 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 23-05-2025 18:00:40 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [FileMgrApp21May2025] SET  READ_WRITE 
GO
