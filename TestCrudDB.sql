USE [master]
GO
/****** Object:  Database [TestCrud]    Script Date: 12/1/2022 11:44:31 ******/
CREATE DATABASE [TestCrud]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestCrud', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestCrud.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestCrud_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestCrud_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TestCrud] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestCrud].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestCrud] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestCrud] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestCrud] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestCrud] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestCrud] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestCrud] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestCrud] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestCrud] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestCrud] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestCrud] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestCrud] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestCrud] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestCrud] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestCrud] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestCrud] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestCrud] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestCrud] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestCrud] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestCrud] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestCrud] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestCrud] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestCrud] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestCrud] SET RECOVERY FULL 
GO
ALTER DATABASE [TestCrud] SET  MULTI_USER 
GO
ALTER DATABASE [TestCrud] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestCrud] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestCrud] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestCrud] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestCrud] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestCrud] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestCrud', N'ON'
GO
ALTER DATABASE [TestCrud] SET QUERY_STORE = OFF
GO
USE [TestCrud]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/1/2022 11:44:31 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[DNI] [int] NOT NULL,
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/1/2022 11:44:32 ******/
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
/****** Object:  UserDefinedFunction [dbo].[FN_UsersConRoles]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[FN_UsersConRoles]
(	
)
RETURNS TABLE 
AS
RETURN 
(
	select u.UserName, u.Email, r.Name RoleName, u.Id UserId, r.Id RoleId
	from AspNetUsers u
	inner join AspNetUserRoles ur
		on u.Id = ur.UserId
	inner join AspNetRoles r
		on r.Id = ur.RoleId
)
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/1/2022 11:44:32 ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 12/1/2022 11:44:32 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/1/2022 11:44:32 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Devoluciones]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devoluciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Devuelto] [bit] NOT NULL,
	[OperacionId] [int] NOT NULL,
 CONSTRAINT [PK_Devoluciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GeneroPelicula]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeneroPelicula](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PeliculaId] [int] NOT NULL,
	[GeneroId] [int] NOT NULL,
 CONSTRAINT [PK_GeneroPelicula] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Generos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operaciones]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operaciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [int] NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[PeliculaId] [int] NULL,
 CONSTRAINT [PK_Operaciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Peliculas]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peliculas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](max) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Disp_Alquiler] [int] NOT NULL,
	[Disp_Venta] [int] NOT NULL,
	[Precio_Base] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Peliculas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 12/1/2022 11:44:32 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/1/2022 11:44:32 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 12/1/2022 11:44:32 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 12/1/2022 11:44:32 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 12/1/2022 11:44:32 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 12/1/2022 11:44:32 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUsers_DNI]    Script Date: 12/1/2022 11:44:32 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AspNetUsers_DNI] ON [dbo].[AspNetUsers]
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/1/2022 11:44:32 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Devoluciones_OperacionId]    Script Date: 12/1/2022 11:44:32 ******/
CREATE NONCLUSTERED INDEX [IX_Devoluciones_OperacionId] ON [dbo].[Devoluciones]
(
	[OperacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GeneroPelicula_GeneroId]    Script Date: 12/1/2022 11:44:32 ******/
CREATE NONCLUSTERED INDEX [IX_GeneroPelicula_GeneroId] ON [dbo].[GeneroPelicula]
(
	[GeneroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GeneroPelicula_PeliculaId]    Script Date: 12/1/2022 11:44:32 ******/
CREATE NONCLUSTERED INDEX [IX_GeneroPelicula_PeliculaId] ON [dbo].[GeneroPelicula]
(
	[PeliculaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Operaciones_PeliculaId]    Script Date: 12/1/2022 11:44:32 ******/
CREATE NONCLUSTERED INDEX [IX_Operaciones_PeliculaId] ON [dbo].[Operaciones]
(
	[PeliculaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Operaciones_UserId]    Script Date: 12/1/2022 11:44:32 ******/
CREATE NONCLUSTERED INDEX [IX_Operaciones_UserId] ON [dbo].[Operaciones]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
ALTER TABLE [dbo].[Devoluciones]  WITH CHECK ADD  CONSTRAINT [FK_Devoluciones_Operaciones_OperacionId] FOREIGN KEY([OperacionId])
REFERENCES [dbo].[Operaciones] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Devoluciones] CHECK CONSTRAINT [FK_Devoluciones_Operaciones_OperacionId]
GO
ALTER TABLE [dbo].[GeneroPelicula]  WITH CHECK ADD  CONSTRAINT [FK_GeneroPelicula_Generos_GeneroId] FOREIGN KEY([GeneroId])
REFERENCES [dbo].[Generos] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GeneroPelicula] CHECK CONSTRAINT [FK_GeneroPelicula_Generos_GeneroId]
GO
ALTER TABLE [dbo].[GeneroPelicula]  WITH CHECK ADD  CONSTRAINT [FK_GeneroPelicula_Peliculas_PeliculaId] FOREIGN KEY([PeliculaId])
REFERENCES [dbo].[Peliculas] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GeneroPelicula] CHECK CONSTRAINT [FK_GeneroPelicula_Peliculas_PeliculaId]
GO
ALTER TABLE [dbo].[Operaciones]  WITH CHECK ADD  CONSTRAINT [FK_Operaciones_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Operaciones] CHECK CONSTRAINT [FK_Operaciones_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Operaciones]  WITH CHECK ADD  CONSTRAINT [FK_Operaciones_Peliculas_PeliculaId] FOREIGN KEY([PeliculaId])
REFERENCES [dbo].[Peliculas] ([Id])
GO
ALTER TABLE [dbo].[Operaciones] CHECK CONSTRAINT [FK_Operaciones_Peliculas_PeliculaId]
GO
/****** Object:  StoredProcedure [dbo].[SP_AlquilarPelicula]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AlquilarPelicula]
	@PeliculaId int,
	@Cantidad int,
	@UserId varchar(450)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@Cantidad > 0)
		begin transaction Trans1
			begin try
				update Peliculas 
					set Disp_Alquiler = case when @Cantidad <= Disp_Alquiler 
							then 
								Disp_Alquiler - @Cantidad
							else 
								null
							end
				where Id = @PeliculaId

				Insert into Operaciones (Tipo, Fecha, Precio, UserId, PeliculaId)
				select 1, GETDATE(), Precio_Base, @UserId, @PeliculaId
				from Peliculas p, AspNetUsers u
				where p.Id = @PeliculaId and u.Id = @UserId

				insert into Devoluciones (Devuelto, OperacionId)
				values (0, SCOPE_IDENTITY())

				commit transaction Trans1

			end try
			begin catch
				rollback transaction Trans1
			end catch
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AsignarGeneroPelicula]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AsignarGeneroPelicula]
	@GeneroId int,
	@PeliculaId int
AS
BEGIN
	SET NOCOUNT ON;
	insert into GeneroPelicula (GeneroId, PeliculaId)
	select @GeneroId, @PeliculaId
	from Peliculas p
	where @GeneroId not in (
					select GeneroId
					from Peliculas p
					inner join GeneroPelicula gp
						on p.Id = gp.PeliculaId
					inner join Generos g
						on gp.GeneroId = g.Id
				)
			and p.Id = @PeliculaId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AuditoriaPeliculasAlquiladas]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AuditoriaPeliculasAlquiladas]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	with PeliculasAlquiladas as (
		select p.Id PeliculaId, COUNT(p.Id) VecesAlquilada, SUM(o.Precio) TotalRecaudado
		from Peliculas p
		inner join Operaciones o
			on  p.Id = o.PeliculaId
		group by p.Id
	)

	select p.Titulo, p.Descripcion, pa.VecesAlquilada, pa.TotalRecaudado
	from Peliculas p, PeliculasAlquiladas pa
	where p.Id = pa.PeliculaId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_BorrarPeliculas]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_BorrarPeliculas]
	@id int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Peliculas
		set Disp_Alquiler = 0,
			Disp_Venta = 0
	where Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CrearGenero]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CrearGenero]
	@Nombre varchar(100),
	@Descripcion varchar(200)
AS
BEGIN
	SET NOCOUNT ON;
	if (@Nombre != '' and @Descripcion != '')
		insert into Generos (Nombre, Descripcion)
			values (@Nombre, @Descripcion);
	else 
		throw 50001, 'Algunos de los parámetros provistos son cadenas vacias', 1;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CrearPelicula]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CrearPelicula]
	@Titulo varchar(30),
	@Descripcion varchar(200),
	@Disp_Alquiler tinyint,
	@Disp_Venta tinyint,
	@Precio_Base decimal,
	@Genero int
AS
BEGIN
	SET NOCOUNT ON;

	begin transaction [Trans1]
		begin try
			iNSERT into Peliculas (Titulo, Descripcion, Disp_Alquiler, Disp_Venta, Precio_Base)
			VALUES (
				@Titulo,
				@Descripcion,
				@Disp_Alquiler,
				@Disp_Venta,
				@Precio_Base
			)

			Insert into GeneroPelicula (GeneroId, PeliculaId) values (@Genero, SCOPE_IDENTITY())

			commit transaction [Trans1]
		end try
	begin catch
		rollback transaction [Trans1]
	end catch

END
GO
/****** Object:  StoredProcedure [dbo].[SP_DevolverPelicula]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DevolverPelicula]
	@PeliculaId int,
	@OperacionId int
AS
BEGIN
	
	SET NOCOUNT ON;
	
			begin transaction Trans1
					begin try
						update Peliculas 
							set Disp_Alquiler = Disp_Alquiler + 1
						where Id = @PeliculaId

						Insert into Devoluciones (Devuelto, OperacionId)
						values (1, @OperacionId)

						commit transaction Trans1

					end try
					begin catch
						rollback transaction Trans1
					end catch
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ModificarPeliculas]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ModificarPeliculas]
	@id int,
	@Titulo varchar(80) = '',
	@Descripcion varchar(200) = '',
	@Disp_Alquiler int = 0,
	@Disp_Venta int = 0,
	@Precio_Base decimal = 0,
	@GeneroId int = 0
AS
BEGIN
	SET NOCOUNT ON;

	begin transaction Trans1
		begin try
			update Peliculas
				set 
					Titulo = case when (@Titulo != '') then @Titulo else Titulo end,
					Descripcion = case when @Descripcion != '' then @Descripcion else Descripcion end,
					Disp_Alquiler = case when @Disp_Alquiler != 0 then @Disp_Alquiler else Disp_Alquiler end,
					Disp_Venta = case when @Disp_Venta != 0 then @Disp_Venta else Disp_Venta end,
					Precio_Base = case when @Precio_Base != 0 then @Precio_Base else Precio_Base end
			where Id = @id

			update GeneroPelicula
				set GeneroId = case when @GeneroId != 0 then @GeneroId else @GeneroId end
			where PeliculaId = @id

			commit transaction Trans1
		end try
		begin catch 
			rollback transaction Trans1
		end catch
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PeliculasAlquiladasPorUsuario]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_PeliculasAlquiladasPorUsuario]
	@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select p.Titulo, p.Descripcion, o.Precio, CONVERT(date, o.Fecha) Fecha
	from Operaciones o
	inner join Peliculas p
		on o.PeliculaId = p.Id
	where o.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PeliculasDisponiblesParaAlquilar]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_PeliculasDisponiblesParaAlquilar]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Select *
	from Peliculas p
	where p.Disp_Alquiler > 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PeliculasDisponiblesParaVender]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_PeliculasDisponiblesParaVender]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Select *
	from Peliculas p
	where p.Disp_Venta > 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PeliculasNoDevueltas]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_PeliculasNoDevueltas]
	
AS
BEGIN
	
	SET NOCOUNT ON;
	select p.Titulo, p.Descripcion, u.UserName, u.Email, u.DNI, o.Id OperacionId
	from Devoluciones d
	inner join Operaciones o
		on d.OperacionId = o.Id
	inner join AspNetUsers u
		on u.Id = o.UserId
	inner join Peliculas p
		on p.Id = o.PeliculaId
	where Devuelto = 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_VenderPelicula]    Script Date: 12/1/2022 11:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_VenderPelicula]
	@PeliculaId int,
	@Cantidad int,
	@UserId varchar(450)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@Cantidad > 0)
		begin transaction Trans1
			begin try
				update Peliculas 
					set Disp_Venta = case when @Cantidad <= Disp_Venta 
							then 
								Disp_Venta - @Cantidad
							else 
								null
							end
				where Id = @PeliculaId

				Insert into Operaciones (Tipo, Fecha, Precio, UserId, PeliculaId)
				select 0, GETDATE(), Precio_Base, @UserId, @PeliculaId
				from Peliculas p, AspNetUsers u
				where p.Id = @PeliculaId and u.Id = @UserId

				commit transaction Trans1

			end try
			begin catch
				rollback transaction Trans1
			end catch
END
GO
USE [master]
GO
ALTER DATABASE [TestCrud] SET  READ_WRITE 
GO
