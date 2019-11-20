USE [master]
GO
/****** Object:  Database [AppDeMusica]    Script Date: 31/10/2019 10:09:03 ******/
CREATE DATABASE [AppDeMusica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AppDeMusica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AppDeMusica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AppDeMusica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AppDeMusica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AppDeMusica] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AppDeMusica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AppDeMusica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AppDeMusica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AppDeMusica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AppDeMusica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AppDeMusica] SET ARITHABORT OFF 
GO
ALTER DATABASE [AppDeMusica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AppDeMusica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AppDeMusica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AppDeMusica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AppDeMusica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AppDeMusica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AppDeMusica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AppDeMusica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AppDeMusica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AppDeMusica] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AppDeMusica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AppDeMusica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AppDeMusica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AppDeMusica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AppDeMusica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AppDeMusica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AppDeMusica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AppDeMusica] SET RECOVERY FULL 
GO
ALTER DATABASE [AppDeMusica] SET  MULTI_USER 
GO
ALTER DATABASE [AppDeMusica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AppDeMusica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AppDeMusica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AppDeMusica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AppDeMusica] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AppDeMusica', N'ON'
GO
ALTER DATABASE [AppDeMusica] SET QUERY_STORE = OFF
GO
USE [AppDeMusica]
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
USE [AppDeMusica]
GO
/****** Object:  User [alumno]    Script Date: 31/10/2019 10:09:03 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 31/10/2019 10:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[ID_Album] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[FechaPublicacion] [date] NULL,
	[Imagen] [varchar](50) NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[ID_Album] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artista]    Script Date: 31/10/2019 10:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artista](
	[ID_Artista] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[CantSeguidores] [int] NULL,
	[Imagen] [varchar](50) NULL,
 CONSTRAINT [PK_Artista] PRIMARY KEY CLUSTERED 
(
	[ID_Artista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArtistaPorAlbum]    Script Date: 31/10/2019 10:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtistaPorAlbum](
	[ID_ArtistaPorAlbum] [int] IDENTITY(1,1) NOT NULL,
	[ID_Album] [int] NULL,
	[ID_Artista] [int] NULL,
 CONSTRAINT [PK_ArtistaPorAlbum] PRIMARY KEY CLUSTERED 
(
	[ID_ArtistaPorAlbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArtistaPorCancion]    Script Date: 31/10/2019 10:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtistaPorCancion](
	[ID_ArtistaPorCancion] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cancion] [int] NULL,
	[ID_Artista] [int] NULL,
 CONSTRAINT [PK_ArtistaPorCancion] PRIMARY KEY CLUSTERED 
(
	[ID_ArtistaPorCancion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cancion]    Script Date: 31/10/2019 10:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cancion](
	[ID_Cancion] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[FechaPublicacion] [date] NULL,
	[ID_Album] [int] NULL,
	[Imagen] [varchar](max) NULL,
 CONSTRAINT [PK_Cancion] PRIMARY KEY CLUSTERED 
(
	[ID_Cancion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CancionPorPlaylist]    Script Date: 31/10/2019 10:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CancionPorPlaylist](
	[ID_CancionPorPlaylist] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cancion] [int] NULL,
	[ID_Playlist] [int] NULL,
 CONSTRAINT [PK_CancionPorPlaylist] PRIMARY KEY CLUSTERED 
(
	[ID_CancionPorPlaylist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GeneroMusical]    Script Date: 31/10/2019 10:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeneroMusical](
	[ID_GeneroMusical] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_GeneroMusical] PRIMARY KEY CLUSTERED 
(
	[ID_GeneroMusical] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GeneroPorCancion]    Script Date: 31/10/2019 10:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeneroPorCancion](
	[ID_GeneroPorCancion] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cancion] [int] NULL,
	[ID_GeneroMusical] [int] NULL,
 CONSTRAINT [PK_GeneroPorCancion] PRIMARY KEY CLUSTERED 
(
	[ID_GeneroPorCancion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 31/10/2019 10:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupo](
	[ID_Grupo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Imagen] [varchar](50) NULL,
 CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED 
(
	[ID_Grupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IntegrantesGrupo]    Script Date: 31/10/2019 10:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IntegrantesGrupo](
	[ID_IntegrantesGrupo] [int] IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [int] NULL,
	[ID_Grupo] [int] NULL,
 CONSTRAINT [PK_IntegrantesGrupo] PRIMARY KEY CLUSTERED 
(
	[ID_IntegrantesGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Playlist]    Script Date: 31/10/2019 10:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlist](
	[ID_Playlist] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Imagen] [varchar](max) NULL,
 CONSTRAINT [PK_Playlist] PRIMARY KEY CLUSTERED 
(
	[ID_Playlist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistDelGrupo]    Script Date: 31/10/2019 10:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistDelGrupo](
	[ID_PlaylistDelGrupo] [int] IDENTITY(1,1) NOT NULL,
	[ID_Playlist] [int] NULL,
	[ID_Grupo] [int] NULL,
 CONSTRAINT [PK_PlaylistDelGrupo] PRIMARY KEY CLUSTERED 
(
	[ID_PlaylistDelGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroLogin]    Script Date: 31/10/2019 10:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroLogin](
	[ID_Login] [int] IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [int] NULL,
	[Fecha] [date] NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[ID_Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 31/10/2019 10:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Username] [varchar](50) NULL,
	[Contraseña] [varchar](50) NULL,
	[Mail] [varchar](50) NULL,
	[Imagen] [varchar](50) NULL,
	[ID_Spotify] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioSpotify]    Script Date: 31/10/2019 10:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioSpotify](
	[ID_Spotify] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[TipoCuenta] [varchar](50) NULL,
 CONSTRAINT [PK_UsuarioSpotify] PRIMARY KEY CLUSTERED 
(
	[ID_Spotify] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GeneroMusical] ON 

INSERT [dbo].[GeneroMusical] ([ID_GeneroMusical], [Nombre]) VALUES (1, N'Rock')
INSERT [dbo].[GeneroMusical] ([ID_GeneroMusical], [Nombre]) VALUES (2, N'Hip Hop')
INSERT [dbo].[GeneroMusical] ([ID_GeneroMusical], [Nombre]) VALUES (3, N'Pop')
INSERT [dbo].[GeneroMusical] ([ID_GeneroMusical], [Nombre]) VALUES (4, N'Indie')
INSERT [dbo].[GeneroMusical] ([ID_GeneroMusical], [Nombre]) VALUES (5, N'Latina')
INSERT [dbo].[GeneroMusical] ([ID_GeneroMusical], [Nombre]) VALUES (6, N'Fitness')
INSERT [dbo].[GeneroMusical] ([ID_GeneroMusical], [Nombre]) VALUES (7, N'Reggae')
INSERT [dbo].[GeneroMusical] ([ID_GeneroMusical], [Nombre]) VALUES (8, N'Jazz')
INSERT [dbo].[GeneroMusical] ([ID_GeneroMusical], [Nombre]) VALUES (9, N'Mexicano')
INSERT [dbo].[GeneroMusical] ([ID_GeneroMusical], [Nombre]) VALUES (10, N'Brazileño')
INSERT [dbo].[GeneroMusical] ([ID_GeneroMusical], [Nombre]) VALUES (11, N'Arabe')
INSERT [dbo].[GeneroMusical] ([ID_GeneroMusical], [Nombre]) VALUES (12, N'Argentino')
INSERT [dbo].[GeneroMusical] ([ID_GeneroMusical], [Nombre]) VALUES (13, N'Country')
INSERT [dbo].[GeneroMusical] ([ID_GeneroMusical], [Nombre]) VALUES (14, N'Clasica')
INSERT [dbo].[GeneroMusical] ([ID_GeneroMusical], [Nombre]) VALUES (15, N'Metal')
INSERT [dbo].[GeneroMusical] ([ID_GeneroMusical], [Nombre]) VALUES (16, N'Punk')
INSERT [dbo].[GeneroMusical] ([ID_GeneroMusical], [Nombre]) VALUES (17, N'Blues')
INSERT [dbo].[GeneroMusical] ([ID_GeneroMusical], [Nombre]) VALUES (18, N'K-Pop')
INSERT [dbo].[GeneroMusical] ([ID_GeneroMusical], [Nombre]) VALUES (19, N'Reggaeton')
SET IDENTITY_INSERT [dbo].[GeneroMusical] OFF
SET IDENTITY_INSERT [dbo].[RegistroLogin] ON 

INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (1, NULL, CAST(N'2019-10-23' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (2, NULL, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (3, NULL, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (4, NULL, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (5, NULL, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (6, NULL, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (7, NULL, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (8, NULL, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (9, NULL, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (10, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (11, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (12, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (13, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (14, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (15, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (16, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (17, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (18, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (19, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (20, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (21, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (22, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (23, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (24, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (25, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (26, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (27, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (28, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (29, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (30, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (31, 9, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (32, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (33, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (34, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (35, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (36, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (37, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (38, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (39, NULL, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (40, NULL, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (41, NULL, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (42, NULL, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (43, NULL, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (44, NULL, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (45, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (46, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (47, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (48, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (49, NULL, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (50, NULL, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (51, NULL, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (52, NULL, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (53, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (54, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (55, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (56, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (57, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (58, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (59, NULL, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (60, NULL, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (61, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (62, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (63, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (64, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (65, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (66, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (67, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (68, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (69, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (70, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (71, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (72, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (73, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (74, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (75, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (76, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (77, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (78, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (79, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (80, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (81, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (82, 9, CAST(N'2019-10-30' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (83, 9, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (84, 9, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (85, 9, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (86, 9, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (87, 9, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (88, 9, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (89, 9, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (90, 9, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (91, NULL, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (92, NULL, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (93, NULL, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (94, NULL, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (95, 9, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (96, 9, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (97, 9, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (98, 9, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (99, NULL, CAST(N'2019-10-31' AS Date))
GO
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (100, NULL, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (101, 9, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (102, 9, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (103, 9, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (104, 9, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (105, 9, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (106, 9, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (107, NULL, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (108, NULL, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (109, NULL, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (110, NULL, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (111, NULL, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (112, NULL, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (113, NULL, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (114, NULL, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (115, NULL, CAST(N'2019-10-31' AS Date))
INSERT [dbo].[RegistroLogin] ([ID_Login], [ID_Usuario], [Fecha]) VALUES (116, NULL, CAST(N'2019-10-31' AS Date))
SET IDENTITY_INSERT [dbo].[RegistroLogin] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([ID_Usuario], [Nombre], [Apellido], [Username], [Contraseña], [Mail], [Imagen], [ID_Spotify]) VALUES (9, N'Ivan', N'Smelec', N'ivansito', N'®	J,´4÷<™c·:ºà\„z[Ù', N'ivan@gmail.com', N'Act2img.png', NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[ArtistaPorAlbum]  WITH CHECK ADD  CONSTRAINT [FK_ArtistaPorAlbum_Album] FOREIGN KEY([ID_Album])
REFERENCES [dbo].[Album] ([ID_Album])
GO
ALTER TABLE [dbo].[ArtistaPorAlbum] CHECK CONSTRAINT [FK_ArtistaPorAlbum_Album]
GO
ALTER TABLE [dbo].[ArtistaPorAlbum]  WITH CHECK ADD  CONSTRAINT [FK_ArtistaPorAlbum_Artista] FOREIGN KEY([ID_Artista])
REFERENCES [dbo].[Artista] ([ID_Artista])
GO
ALTER TABLE [dbo].[ArtistaPorAlbum] CHECK CONSTRAINT [FK_ArtistaPorAlbum_Artista]
GO
ALTER TABLE [dbo].[ArtistaPorCancion]  WITH CHECK ADD  CONSTRAINT [FK_ArtistaPorCancion_Artista] FOREIGN KEY([ID_Artista])
REFERENCES [dbo].[Artista] ([ID_Artista])
GO
ALTER TABLE [dbo].[ArtistaPorCancion] CHECK CONSTRAINT [FK_ArtistaPorCancion_Artista]
GO
ALTER TABLE [dbo].[ArtistaPorCancion]  WITH CHECK ADD  CONSTRAINT [FK_ArtistaPorCancion_Cancion] FOREIGN KEY([ID_Cancion])
REFERENCES [dbo].[Cancion] ([ID_Cancion])
GO
ALTER TABLE [dbo].[ArtistaPorCancion] CHECK CONSTRAINT [FK_ArtistaPorCancion_Cancion]
GO
ALTER TABLE [dbo].[Cancion]  WITH CHECK ADD  CONSTRAINT [FK_Cancion_Album] FOREIGN KEY([ID_Album])
REFERENCES [dbo].[Album] ([ID_Album])
GO
ALTER TABLE [dbo].[Cancion] CHECK CONSTRAINT [FK_Cancion_Album]
GO
ALTER TABLE [dbo].[CancionPorPlaylist]  WITH CHECK ADD  CONSTRAINT [FK_CancionPorPlaylist_Cancion] FOREIGN KEY([ID_Cancion])
REFERENCES [dbo].[Cancion] ([ID_Cancion])
GO
ALTER TABLE [dbo].[CancionPorPlaylist] CHECK CONSTRAINT [FK_CancionPorPlaylist_Cancion]
GO
ALTER TABLE [dbo].[CancionPorPlaylist]  WITH CHECK ADD  CONSTRAINT [FK_CancionPorPlaylist_Playlist] FOREIGN KEY([ID_Playlist])
REFERENCES [dbo].[Playlist] ([ID_Playlist])
GO
ALTER TABLE [dbo].[CancionPorPlaylist] CHECK CONSTRAINT [FK_CancionPorPlaylist_Playlist]
GO
ALTER TABLE [dbo].[GeneroPorCancion]  WITH CHECK ADD  CONSTRAINT [FK_GeneroPorCancion_Cancion] FOREIGN KEY([ID_Cancion])
REFERENCES [dbo].[Cancion] ([ID_Cancion])
GO
ALTER TABLE [dbo].[GeneroPorCancion] CHECK CONSTRAINT [FK_GeneroPorCancion_Cancion]
GO
ALTER TABLE [dbo].[GeneroPorCancion]  WITH CHECK ADD  CONSTRAINT [FK_GeneroPorCancion_GeneroMusical] FOREIGN KEY([ID_GeneroMusical])
REFERENCES [dbo].[GeneroMusical] ([ID_GeneroMusical])
GO
ALTER TABLE [dbo].[GeneroPorCancion] CHECK CONSTRAINT [FK_GeneroPorCancion_GeneroMusical]
GO
ALTER TABLE [dbo].[IntegrantesGrupo]  WITH CHECK ADD  CONSTRAINT [FK_IntegrantesGrupo_Grupo] FOREIGN KEY([ID_Grupo])
REFERENCES [dbo].[Grupo] ([ID_Grupo])
GO
ALTER TABLE [dbo].[IntegrantesGrupo] CHECK CONSTRAINT [FK_IntegrantesGrupo_Grupo]
GO
ALTER TABLE [dbo].[IntegrantesGrupo]  WITH CHECK ADD  CONSTRAINT [FK_IntegrantesGrupo_Usuario] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuario] ([ID_Usuario])
GO
ALTER TABLE [dbo].[IntegrantesGrupo] CHECK CONSTRAINT [FK_IntegrantesGrupo_Usuario]
GO
ALTER TABLE [dbo].[PlaylistDelGrupo]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistDelGrupo_Grupo] FOREIGN KEY([ID_Grupo])
REFERENCES [dbo].[Grupo] ([ID_Grupo])
GO
ALTER TABLE [dbo].[PlaylistDelGrupo] CHECK CONSTRAINT [FK_PlaylistDelGrupo_Grupo]
GO
ALTER TABLE [dbo].[PlaylistDelGrupo]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistDelGrupo_Playlist] FOREIGN KEY([ID_Playlist])
REFERENCES [dbo].[Playlist] ([ID_Playlist])
GO
ALTER TABLE [dbo].[PlaylistDelGrupo] CHECK CONSTRAINT [FK_PlaylistDelGrupo_Playlist]
GO
ALTER TABLE [dbo].[RegistroLogin]  WITH CHECK ADD  CONSTRAINT [FK_Login_Usuario] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuario] ([ID_Usuario])
GO
ALTER TABLE [dbo].[RegistroLogin] CHECK CONSTRAINT [FK_Login_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_UsuarioSpotify] FOREIGN KEY([ID_Spotify])
REFERENCES [dbo].[UsuarioSpotify] ([ID_Spotify])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_UsuarioSpotify]
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 31/10/2019 10:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Login] @Username varchar(50), @Contraseña varchar(50)
AS
DECLARE @ContraseñaLocal varchar(MAX)
SET @ContraseñaLocal = (HASHBYTES('SHA1',@Contraseña))
INSERT INTO RegistroLogin (Fecha,ID_Usuario) VALUES (GETDATE(),(SELECT ID_Usuario FROM Usuario WHERE Usuario.Username = @Username AND Usuario.Contraseña = @ContraseñaLocal))
SELECT ID_Usuario,Nombre,Apellido,Username,Contraseña,Mail,Imagen,ID_Spotify FROM Usuario WHERE Usuario.Username = @Username AND Usuario.Contraseña = @ContraseñaLocal
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarContraseña]    Script Date: 31/10/2019 10:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ModificarContraseña] @ID_Usuario int, @ContraseñaVieja varchar(MAX), @ContraseñaNueva varchar(MAX)
AS
UPDATE Usuario SET Contraseña = HASHBYTES('SHA1',@ContraseñaNueva) WHERE ID_Usuario = @ID_Usuario AND Contraseña = HASHBYTES('SHA1',@ContraseñaVieja)
SELECT ID_Usuario FROM Usuario WHERE ID_Usuario = @ID_Usuario AND Contraseña = HASHBYTES('SHA1',@ContraseñaNueva)
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarUsuario]    Script Date: 31/10/2019 10:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RegistrarUsuario] @Nombre varchar(50), @Apellido varchar(50), @Username varchar(50), @Contraseña varchar(50), @Mail varchar(50), @Imagen varchar(50)
AS
INSERT INTO Usuario (Nombre,Apellido,Username,Contraseña,Mail,Imagen)
VALUES (@Nombre,@Apellido,@Username,(HASHBYTES('SHA1',@Contraseña)),@Mail,@Imagen)
GO
USE [master]
GO
ALTER DATABASE [AppDeMusica] SET  READ_WRITE 
GO
