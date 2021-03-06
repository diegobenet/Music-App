USE [master]
GO
/****** Object:  Database [musicAppDB]    Script Date: 06-Mar-22 9:20:16 PM ******/
CREATE DATABASE [musicAppDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'musicAppDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\musicAppDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'musicAppDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\musicAppDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [musicAppDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [musicAppDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [musicAppDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [musicAppDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [musicAppDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [musicAppDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [musicAppDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [musicAppDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [musicAppDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [musicAppDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [musicAppDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [musicAppDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [musicAppDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [musicAppDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [musicAppDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [musicAppDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [musicAppDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [musicAppDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [musicAppDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [musicAppDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [musicAppDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [musicAppDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [musicAppDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [musicAppDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [musicAppDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [musicAppDB] SET  MULTI_USER 
GO
ALTER DATABASE [musicAppDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [musicAppDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [musicAppDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [musicAppDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [musicAppDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [musicAppDB] SET QUERY_STORE = OFF
GO
USE [musicAppDB]
GO
/****** Object:  Table [dbo].[Agrupacion]    Script Date: 06-Mar-22 9:20:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agrupacion](
	[Id_agrupacion] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Ciudad] [varchar](100) NOT NULL,
	[Genero_musical] [varchar](100) NOT NULL,
	[Foto] [varchar](100) NOT NULL,
	[Busca_integrantes] [char](10) NOT NULL,
	[Descripcion] [varchar](max) NULL,
 CONSTRAINT [PK_Agrupacion] PRIMARY KEY CLUSTERED 
(
	[Id_agrupacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgrupacionesUsuarios]    Script Date: 06-Mar-22 9:20:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgrupacionesUsuarios](
	[Id_agrupacionesUsuarios] [int] IDENTITY(1,1) NOT NULL,
	[Id_usuario] [int] NOT NULL,
	[Id_agrupacion] [int] NOT NULL,
 CONSTRAINT [PK_AgrupacionesUsuarios_1] PRIMARY KEY CLUSTERED 
(
	[Id_agrupacionesUsuarios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgrupacionExterna]    Script Date: 06-Mar-22 9:20:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgrupacionExterna](
	[Id_agrupacion_externa] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NULL,
	[Fecha_inicio] [datetime] NULL,
	[Fecha_fin] [datetime] NULL,
	[Id_usuario] [int] NULL,
 CONSTRAINT [PK_AgrupacionExterna] PRIMARY KEY CLUSTERED 
(
	[Id_agrupacion_externa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 06-Mar-22 9:20:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentario](
	[Id_comentario] [int] IDENTITY(1,1) NOT NULL,
	[Comentario] [varchar](255) NULL,
	[Fecha] [datetime] NULL,
	[Id_post] [int] NULL,
	[Id_usuario] [int] NULL,
 CONSTRAINT [PK_Comentario] PRIMARY KEY CLUSTERED 
(
	[Id_comentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Follow]    Script Date: 06-Mar-22 9:20:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follow](
	[id_follows] [int] IDENTITY(1,1) NOT NULL,
	[Id_follower] [int] NULL,
	[Id_following] [int] NULL,
 CONSTRAINT [PK_Follow] PRIMARY KEY CLUSTERED 
(
	[id_follows] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Like]    Script Date: 06-Mar-22 9:20:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Like](
	[Id_like] [int] IDENTITY(1,1) NOT NULL,
	[Id_post] [int] NOT NULL,
	[Id_usuario] [int] NOT NULL,
 CONSTRAINT [PK_Like] PRIMARY KEY CLUSTERED 
(
	[Id_like] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 06-Mar-22 9:20:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id_post] [int] IDENTITY(1,1) NOT NULL,
	[Mensaje] [varchar](max) NULL,
	[Archivo_mp3] [varchar](max) NULL,
	[Fecha_creacion] [datetime] NOT NULL,
	[Id_usuario] [int] NULL,
	[Id_agrupacion] [int] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id_post] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solicitud]    Script Date: 06-Mar-22 9:20:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solicitud](
	[Id_usuario] [int] NOT NULL,
	[Id_agrupacion] [int] NOT NULL,
	[Estatus] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Solicitud_1] PRIMARY KEY CLUSTERED 
(
	[Id_usuario] ASC,
	[Id_agrupacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Token]    Script Date: 06-Mar-22 9:20:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Token](
	[Id_token] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NULL,
	[Fecha] [datetime] NULL,
	[Expiracion] [int] NULL,
	[Id_usuario] [int] NULL,
 CONSTRAINT [PK_Token] PRIMARY KEY CLUSTERED 
(
	[Id_token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 06-Mar-22 9:20:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellidos] [varchar](100) NOT NULL,
	[Contraseña] [varchar](100) NOT NULL,
	[Fecha_nac] [varchar](100) NOT NULL,
	[Ciudad] [varchar](100) NOT NULL,
	[Genero] [varchar](100) NOT NULL,
	[Instrumentos_fav] [varchar](100) NULL,
	[Genero_musical_fav] [varchar](100) NULL,
	[Es_cantante] [varchar](50) NULL,
	[Estado_en_banda_concierto] [varchar](50) NULL,
	[Desc_personal] [varchar](100) NULL,
	[Foto_perfil] [varchar](max) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comentario] ON 

INSERT [dbo].[Comentario] ([Id_comentario], [Comentario], [Fecha], [Id_post], [Id_usuario]) VALUES (1, N'Hola Alejandro', CAST(N'2021-07-08T00:00:00.000' AS DateTime), 5, 16)
INSERT [dbo].[Comentario] ([Id_comentario], [Comentario], [Fecha], [Id_post], [Id_usuario]) VALUES (2, N'dasfs', CAST(N'2021-07-23T15:08:32.257' AS DateTime), 5, 13)
INSERT [dbo].[Comentario] ([Id_comentario], [Comentario], [Fecha], [Id_post], [Id_usuario]) VALUES (3, N'HOLA A TODOS', CAST(N'2021-07-23T15:11:49.367' AS DateTime), 5, 13)
INSERT [dbo].[Comentario] ([Id_comentario], [Comentario], [Fecha], [Id_post], [Id_usuario]) VALUES (5, N'prueba 2', CAST(N'2021-07-23T16:01:09.340' AS DateTime), 17, 13)
INSERT [dbo].[Comentario] ([Id_comentario], [Comentario], [Fecha], [Id_post], [Id_usuario]) VALUES (6, N'Hola ', CAST(N'2021-07-24T12:20:16.290' AS DateTime), 17, 2)
INSERT [dbo].[Comentario] ([Id_comentario], [Comentario], [Fecha], [Id_post], [Id_usuario]) VALUES (7, N'Escuchen mi nueva cancion', CAST(N'2021-07-27T11:14:59.103' AS DateTime), 23, 28)
INSERT [dbo].[Comentario] ([Id_comentario], [Comentario], [Fecha], [Id_post], [Id_usuario]) VALUES (8, N'Hola', CAST(N'2021-07-27T11:15:34.547' AS DateTime), 5, 28)
INSERT [dbo].[Comentario] ([Id_comentario], [Comentario], [Fecha], [Id_post], [Id_usuario]) VALUES (9, N'Hola!', CAST(N'2022-02-03T19:32:13.023' AS DateTime), 20, 29)
SET IDENTITY_INSERT [dbo].[Comentario] OFF
GO
SET IDENTITY_INSERT [dbo].[Follow] ON 

INSERT [dbo].[Follow] ([id_follows], [Id_follower], [Id_following]) VALUES (2, 2, 14)
INSERT [dbo].[Follow] ([id_follows], [Id_follower], [Id_following]) VALUES (3, 2, 13)
INSERT [dbo].[Follow] ([id_follows], [Id_follower], [Id_following]) VALUES (4, 28, 13)
SET IDENTITY_INSERT [dbo].[Follow] OFF
GO
SET IDENTITY_INSERT [dbo].[Like] ON 

INSERT [dbo].[Like] ([Id_like], [Id_post], [Id_usuario]) VALUES (1, 17, 13)
INSERT [dbo].[Like] ([Id_like], [Id_post], [Id_usuario]) VALUES (4, 8, 13)
INSERT [dbo].[Like] ([Id_like], [Id_post], [Id_usuario]) VALUES (5, 5, 13)
INSERT [dbo].[Like] ([Id_like], [Id_post], [Id_usuario]) VALUES (16, 8, 2)
INSERT [dbo].[Like] ([Id_like], [Id_post], [Id_usuario]) VALUES (17, 5, 2)
INSERT [dbo].[Like] ([Id_like], [Id_post], [Id_usuario]) VALUES (18, 6, 2)
INSERT [dbo].[Like] ([Id_like], [Id_post], [Id_usuario]) VALUES (19, 7, 2)
INSERT [dbo].[Like] ([Id_like], [Id_post], [Id_usuario]) VALUES (21, 17, 2)
INSERT [dbo].[Like] ([Id_like], [Id_post], [Id_usuario]) VALUES (22, 17, 27)
INSERT [dbo].[Like] ([Id_like], [Id_post], [Id_usuario]) VALUES (23, 7, 27)
INSERT [dbo].[Like] ([Id_like], [Id_post], [Id_usuario]) VALUES (24, 6, 27)
INSERT [dbo].[Like] ([Id_like], [Id_post], [Id_usuario]) VALUES (26, 8, 27)
INSERT [dbo].[Like] ([Id_like], [Id_post], [Id_usuario]) VALUES (30, 18, 2)
INSERT [dbo].[Like] ([Id_like], [Id_post], [Id_usuario]) VALUES (31, 20, 2)
INSERT [dbo].[Like] ([Id_like], [Id_post], [Id_usuario]) VALUES (32, 7, 13)
INSERT [dbo].[Like] ([Id_like], [Id_post], [Id_usuario]) VALUES (33, 7, 28)
INSERT [dbo].[Like] ([Id_like], [Id_post], [Id_usuario]) VALUES (35, 5, 28)
INSERT [dbo].[Like] ([Id_like], [Id_post], [Id_usuario]) VALUES (36, 17, 28)
INSERT [dbo].[Like] ([Id_like], [Id_post], [Id_usuario]) VALUES (37, 6, 13)
INSERT [dbo].[Like] ([Id_like], [Id_post], [Id_usuario]) VALUES (1038, 20, 29)
SET IDENTITY_INSERT [dbo].[Like] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Id_post], [Mensaje], [Archivo_mp3], [Fecha_creacion], [Id_usuario], [Id_agrupacion]) VALUES (5, N'HELLO!', N'https://res.cloudinary.com/musicapp123/video/upload/v1626998032/jroeei6nolgznanntj4s.mp3', CAST(N'2021-07-22T18:53:51.007' AS DateTime), 13, NULL)
INSERT [dbo].[Post] ([Id_post], [Mensaje], [Archivo_mp3], [Fecha_creacion], [Id_usuario], [Id_agrupacion]) VALUES (6, N'Check out my new SONG!', N'https://res.cloudinary.com/musicapp123/video/upload/v1626998105/eadumptc4tzfrhbvu4of.mp3', CAST(N'2021-07-22T18:55:04.837' AS DateTime), 13, NULL)
INSERT [dbo].[Post] ([Id_post], [Mensaje], [Archivo_mp3], [Fecha_creacion], [Id_usuario], [Id_agrupacion]) VALUES (7, N'sadfdsa', N'https://res.cloudinary.com/musicapp123/video/upload/v1626998132/hppbyzbwlsxhxphrmlpg.mp3', CAST(N'2021-07-22T18:55:31.147' AS DateTime), 13, NULL)
INSERT [dbo].[Post] ([Id_post], [Mensaje], [Archivo_mp3], [Fecha_creacion], [Id_usuario], [Id_agrupacion]) VALUES (8, N'How is everyone?', NULL, CAST(N'2021-07-22T00:00:00.000' AS DateTime), 14, NULL)
INSERT [dbo].[Post] ([Id_post], [Mensaje], [Archivo_mp3], [Fecha_creacion], [Id_usuario], [Id_agrupacion]) VALUES (17, N'prueba', NULL, CAST(N'2021-07-23T15:16:18.250' AS DateTime), 13, NULL)
INSERT [dbo].[Post] ([Id_post], [Mensaje], [Archivo_mp3], [Fecha_creacion], [Id_usuario], [Id_agrupacion]) VALUES (18, N'prueba', NULL, CAST(N'2021-07-24T12:41:26.870' AS DateTime), 2, NULL)
INSERT [dbo].[Post] ([Id_post], [Mensaje], [Archivo_mp3], [Fecha_creacion], [Id_usuario], [Id_agrupacion]) VALUES (19, N'', N'https://res.cloudinary.com/musicapp123/video/upload/v1627148496/seky9uhkfmx3wpwc1m2t.mp3', CAST(N'2021-07-24T12:41:34.223' AS DateTime), 2, NULL)
INSERT [dbo].[Post] ([Id_post], [Mensaje], [Archivo_mp3], [Fecha_creacion], [Id_usuario], [Id_agrupacion]) VALUES (20, N'haha', N'https://res.cloudinary.com/musicapp123/video/upload/v1627148530/syjpqvgk2wwww7nikxqi.mp3', CAST(N'2021-07-24T12:42:09.697' AS DateTime), 2, NULL)
INSERT [dbo].[Post] ([Id_post], [Mensaje], [Archivo_mp3], [Fecha_creacion], [Id_usuario], [Id_agrupacion]) VALUES (21, N'Hola a todos', NULL, CAST(N'2021-07-27T11:13:09.613' AS DateTime), 28, NULL)
INSERT [dbo].[Post] ([Id_post], [Mensaje], [Archivo_mp3], [Fecha_creacion], [Id_usuario], [Id_agrupacion]) VALUES (22, N'', NULL, CAST(N'2021-07-27T11:13:15.213' AS DateTime), 28, NULL)
INSERT [dbo].[Post] ([Id_post], [Mensaje], [Archivo_mp3], [Fecha_creacion], [Id_usuario], [Id_agrupacion]) VALUES (23, N'Hola', N'https://res.cloudinary.com/musicapp123/video/upload/v1627402487/de842jph5eo0aljodff0.mp3', CAST(N'2021-07-27T11:14:37.947' AS DateTime), 28, NULL)
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Token] ON 

INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (1, N'XMNftxZYr0unP26AItaqnQ==', CAST(N'2021-07-20T14:41:49.233' AS DateTime), 1, 14)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (2, N't/zz3Amx7kCjct/FjV1e/Q==', CAST(N'2021-07-20T14:43:08.267' AS DateTime), 1, 14)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (3, N'TTHe5ZC7okaD770GhTEEQ=1', CAST(N'2021-07-20T14:45:17.293' AS DateTime), 1, 14)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (4, N'oQ1gs7Kja0KgtELWDHE/MA==', CAST(N'2021-07-20T19:02:11.273' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (5, N'ORY3SCWGC0KsPrVvhsfpCA==', CAST(N'2021-07-20T19:02:26.593' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (6, N'9yTT1byVBE203jceN47Sw==', CAST(N'2021-07-20T19:02:47.057' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (7, N'0xDYiWHwEqaqTaxHnKAbA==', CAST(N'2021-07-20T19:51:51.467' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (8, N'pO3mNrbx02TjUREkfwnxw==', CAST(N'2021-07-20T19:53:04.517' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (9, N'i20KS8jAX0mbt6WYnB6vig==', CAST(N'2021-07-20T19:54:49.090' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (10, N'fr6UUl0p4kykrTTN0au1MQ==', CAST(N'2021-07-21T11:48:08.763' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (11, N'dvah6z6Kg022H9t4qdqHZQ==', CAST(N'2021-07-21T12:01:51.717' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (12, N'yTZHGyNx/USdZY0YFXphow==', CAST(N'2021-07-21T15:30:12.080' AS DateTime), 1, 9)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (13, N'9CQmhTMwE2drjp1g/IO6A==', CAST(N'2021-07-21T15:30:23.593' AS DateTime), 1, 9)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (14, N'lYg9w36Kq0mM55q7O58oQ==', CAST(N'2021-07-21T15:30:29.833' AS DateTime), 1, 9)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (15, N'Aa/CqsXuikCB9Lph6P4sHA==', CAST(N'2021-07-21T15:30:31.463' AS DateTime), 1, 9)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (16, N'12grLT6LjkuZuThSYr2lkQ==', CAST(N'2021-07-21T15:31:05.143' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (17, N'kbZigMv9LUumj3N2Whhdqw==', CAST(N'2021-07-21T15:31:16.013' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (18, N'wTm8n/v707nDyozwHSmA==', CAST(N'2021-07-21T15:33:12.013' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (19, N'TNRrTOpRA0G5Cb9wcp4kTg==', CAST(N'2021-07-21T19:41:03.493' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (20, N'4T3MEvXqL0iZxMCKn71MPg==', CAST(N'2021-07-21T19:51:37.433' AS DateTime), 1, 15)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (21, N'2W6vGjNsOkiZYK1eWwTlJA==', CAST(N'2021-07-21T19:56:55.573' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (22, N'd9u0PzW/AUGTtREdQDcanw==', CAST(N'2021-07-21T19:59:52.840' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (23, N'feTx74c51kSQkLc25/pftQ==', CAST(N'2021-07-21T20:10:01.103' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (24, N'D6n9LuDx/kienUP3d9nH0g==', CAST(N'2021-07-21T20:12:07.513' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (25, N'G2ZuPJLGkEmMpVYKuM6uhQ==', CAST(N'2021-07-21T20:12:43.153' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (26, N'C73FaGbMbkq7KYTtQWgfuw==', CAST(N'2021-07-21T20:22:53.647' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (27, N'XGHGh6tviEyShwYq1LRbdQ==', CAST(N'2021-07-21T22:24:18.063' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (28, N'kMsJccQY0WjStfBF5hKw==', CAST(N'2021-07-22T10:11:33.517' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (29, N'NkEwKQpXQ0qHvl7D/v9Fdw==', CAST(N'2021-07-22T10:20:05.483' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (30, N'8o5ydxgslE2QbOfrLHwWg==', CAST(N'2021-07-22T10:35:05.180' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (31, N'VATpVIU3iUGJeJmL8MMbZg==', CAST(N'2021-07-22T10:37:26.470' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (32, N'2Trg5tYlIEyg7TORfpjQ==', CAST(N'2021-07-22T10:45:07.697' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (33, N'bMZ/wwxUdEWgZrNnK7Igyw==', CAST(N'2021-07-22T10:46:18.657' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (34, N'u5gn/g3StkWTb3jocI5WoQ==', CAST(N'2021-07-22T10:53:33.643' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (35, N'uGHl3ACs4EqaiQvqAQ8SgA==', CAST(N'2021-07-22T10:58:38.110' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (36, N'dXMIUe5MxUiP52o1xIgKA==', CAST(N'2021-07-22T11:04:00.160' AS DateTime), 1, 16)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (37, N'p/veKgfpBUOGOLW3KLMMrg==', CAST(N'2021-07-22T12:07:02.280' AS DateTime), 1, 15)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (38, N'1YedqRBrDUSLVnvQH4jNg==', CAST(N'2021-07-22T12:43:08.623' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (39, N'JKdj/jiF0yCTMaiQifpUg==', CAST(N'2021-07-22T12:45:43.893' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (40, N'ZG27XT5qEauTyzlgdUNAg==', CAST(N'2021-07-22T12:46:24.533' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (41, N'vg4PxP0YREO9CWPbToisA==', CAST(N'2021-07-22T13:20:48.590' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (42, N'LRv3Vow4CE6VpnqWtGCFyA==', CAST(N'2021-07-22T13:28:28.780' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (43, N'lWIbWm63okaLKmiz8SX0A==', CAST(N'2021-07-22T13:50:04.640' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (44, N'yc4E8qphREO1WFZdt5gVQ==', CAST(N'2021-07-22T13:55:29.733' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (45, N'PU4Rqe2M40yeqFyXDSr5Q==', CAST(N'2021-07-22T14:15:15.517' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (46, N'prtKX5ISGUS4ozpZoROOng==', CAST(N'2021-07-22T23:19:27.970' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (47, N'/ZGaWGGNUkOuqGzwpyaUw==', CAST(N'2021-07-23T12:42:55.323' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (48, N'vKUdoGY/QEqZtxbAWW8g==', CAST(N'2021-07-23T15:05:47.787' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (49, N'd1ISJM8E2Zd8XeRf0ATA==', CAST(N'2021-07-23T15:08:26.210' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (50, N'EbgkT4Gj0me2/3QZvq8tQ==', CAST(N'2021-07-24T12:14:56.410' AS DateTime), 1, 2)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (51, N'Maz6kVRIn06fEZh5ikdvBg==', CAST(N'2021-07-24T12:30:26.813' AS DateTime), 1, 27)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (52, N'L2bUyX4prEOGqrLCgYlG/A==', CAST(N'2021-07-24T12:38:25.483' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (53, N'at6Q1OEG20O9CMlXt2EYOQ==', CAST(N'2021-07-24T12:38:44.140' AS DateTime), 1, 2)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (54, N'iqrAQkdC30ebNzj3kRtmnQ==', CAST(N'2021-07-24T16:31:53.487' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (55, N'IaRhnUrAUK84R7QWdLLrQ==', CAST(N'2021-07-24T16:47:18.990' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (56, N'Uarfvn09lkyBqK4YSSAZ5Q==', CAST(N'2021-07-27T11:09:50.397' AS DateTime), 1, 28)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (57, N'SLwrAV4JU2c5xjpsFlbDQ==', CAST(N'2021-07-27T16:30:41.360' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (58, N'/au2gx5MlECTl45Sfj8aGg==', CAST(N'2021-07-28T23:16:37.077' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (59, N'ugqX47AZJkOf2dS3Qi607A==', CAST(N'2021-08-03T18:47:31.340' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (60, N'wOzIGchYDEI7GReOTfILA==', CAST(N'2021-08-05T11:34:20.833' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (1058, N'Kurun4Ru0k6VPQdNGhbqWA==', CAST(N'2021-08-12T21:53:53.783' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (1059, N'xRXxJcEtDkC2uunCZWK/QQ==', CAST(N'2021-08-16T15:18:01.693' AS DateTime), 1, 13)
INSERT [dbo].[Token] ([Id_token], [Nombre], [Fecha], [Expiracion], [Id_usuario]) VALUES (1060, N'BS8koQfWz0SOu1Y4TX4BhA==', CAST(N'2022-02-03T19:31:10.837' AS DateTime), 1, 29)
SET IDENTITY_INSERT [dbo].[Token] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id_usuario], [Email], [Nombre], [Apellidos], [Contraseña], [Fecha_nac], [Ciudad], [Genero], [Instrumentos_fav], [Genero_musical_fav], [Es_cantante], [Estado_en_banda_concierto], [Desc_personal], [Foto_perfil]) VALUES (2, N'diego@hotmail.com', N'Diego', N'Elizondo Benet', N'X+csoFYnoio=', N'1997-02-27', N'Monterrey', N'M', NULL, NULL, NULL, NULL, NULL, N'https://res.cloudinary.com/musicapp123/image/upload/v1626981339/hbzfndyrfyyds6a9li7y.jpg')
INSERT [dbo].[Usuario] ([Id_usuario], [Email], [Nombre], [Apellidos], [Contraseña], [Fecha_nac], [Ciudad], [Genero], [Instrumentos_fav], [Genero_musical_fav], [Es_cantante], [Estado_en_banda_concierto], [Desc_personal], [Foto_perfil]) VALUES (9, N'diego@udem.edu', N'Diego', N'Elizondo Benet', N'X+csoFYnoio=', N'1997-02-27', N'Monterrey', N'M', NULL, NULL, NULL, NULL, NULL, N'https://res.cloudinary.com/musicapp123/image/upload/v1626981339/hbzfndyrfyyds6a9li7y.jpg')
INSERT [dbo].[Usuario] ([Id_usuario], [Email], [Nombre], [Apellidos], [Contraseña], [Fecha_nac], [Ciudad], [Genero], [Instrumentos_fav], [Genero_musical_fav], [Es_cantante], [Estado_en_banda_concierto], [Desc_personal], [Foto_perfil]) VALUES (10, N'diego@gmail.com', N'Juan', N'Perez Garza', N'X+csoFYnoio=', N'1997-02-27', N'Oaxaca', N'M', NULL, NULL, NULL, NULL, NULL, N'https://res.cloudinary.com/musicapp123/image/upload/v1626981339/hbzfndyrfyyds6a9li7y.jpg')
INSERT [dbo].[Usuario] ([Id_usuario], [Email], [Nombre], [Apellidos], [Contraseña], [Fecha_nac], [Ciudad], [Genero], [Instrumentos_fav], [Genero_musical_fav], [Es_cantante], [Estado_en_banda_concierto], [Desc_personal], [Foto_perfil]) VALUES (11, N'sad@sad.com', N'sad', N'asd', N'X+csoFYnoio=', N'2021-07-08', N'asd', N'M', NULL, NULL, NULL, NULL, NULL, N'https://res.cloudinary.com/musicapp123/image/upload/v1626981339/hbzfndyrfyyds6a9li7y.jpg')
INSERT [dbo].[Usuario] ([Id_usuario], [Email], [Nombre], [Apellidos], [Contraseña], [Fecha_nac], [Ciudad], [Genero], [Instrumentos_fav], [Genero_musical_fav], [Es_cantante], [Estado_en_banda_concierto], [Desc_personal], [Foto_perfil]) VALUES (12, N'diego.elizondob@udem.edu', N'Diego', N'Elizondo', N'Uwph08ngDLg=', N'2021-07-01', N'Monterrey, San Pedro', N'M', NULL, NULL, NULL, NULL, NULL, N'https://res.cloudinary.com/musicapp123/image/upload/v1626981339/hbzfndyrfyyds6a9li7y.jpg')
INSERT [dbo].[Usuario] ([Id_usuario], [Email], [Nombre], [Apellidos], [Contraseña], [Fecha_nac], [Ciudad], [Genero], [Instrumentos_fav], [Genero_musical_fav], [Es_cantante], [Estado_en_banda_concierto], [Desc_personal], [Foto_perfil]) VALUES (13, N'alejandor@flojres.com', N'Alejandro', N'Fernandez', N'X+csoFYnoio=', N'2021-07-02', N'Monterrey, San Pedro', N'M', N'Guitarra', N'Pop', N'Si', N'Si', N'Hola a todos', N'https://res.cloudinary.com/musicapp123/image/upload/v1627165013/goq8xm9nfzprscnnr88k.jpg')
INSERT [dbo].[Usuario] ([Id_usuario], [Email], [Nombre], [Apellidos], [Contraseña], [Fecha_nac], [Ciudad], [Genero], [Instrumentos_fav], [Genero_musical_fav], [Es_cantante], [Estado_en_banda_concierto], [Desc_personal], [Foto_perfil]) VALUES (14, N'Fernanda@gmail.com', N'Fernanda', N'Guajardo Flores', N'X+csoFYnoio=', N'2021-07-02', N'Playa del Carmen', N'F', NULL, NULL, NULL, NULL, NULL, N'https://res.cloudinary.com/musicapp123/image/upload/v1626981339/hbzfndyrfyyds6a9li7y.jpg')
INSERT [dbo].[Usuario] ([Id_usuario], [Email], [Nombre], [Apellidos], [Contraseña], [Fecha_nac], [Ciudad], [Genero], [Instrumentos_fav], [Genero_musical_fav], [Es_cantante], [Estado_en_banda_concierto], [Desc_personal], [Foto_perfil]) VALUES (15, N'ree@mail.com', N'Sebastian', N'Lopez Garcia', N'X+csoFYnoio=', N'1997-02-27', N'Guanajuato', N'M', NULL, NULL, N'Si        ', NULL, NULL, N'https://res.cloudinary.com/musicapp123/image/upload/v1626981339/hbzfndyrfyyds6a9li7y.jpg')
INSERT [dbo].[Usuario] ([Id_usuario], [Email], [Nombre], [Apellidos], [Contraseña], [Fecha_nac], [Ciudad], [Genero], [Instrumentos_fav], [Genero_musical_fav], [Es_cantante], [Estado_en_banda_concierto], [Desc_personal], [Foto_perfil]) VALUES (16, N'edgar@mail.com', N'Edgar', N'Luna', N'X+csoFYnoio=', N'2009-02-10', N'Monterrey', N'M', NULL, NULL, NULL, NULL, NULL, N'https://res.cloudinary.com/musicapp123/image/upload/v1626981339/hbzfndyrfyyds6a9li7y.jpg')
INSERT [dbo].[Usuario] ([Id_usuario], [Email], [Nombre], [Apellidos], [Contraseña], [Fecha_nac], [Ciudad], [Genero], [Instrumentos_fav], [Genero_musical_fav], [Es_cantante], [Estado_en_banda_concierto], [Desc_personal], [Foto_perfil]) VALUES (18, N'rodrigo@mail.com', N'Rodrigo', N'Cantu', N'X+csoFYnoio=', N'2009-02-10', N'Monterrey', N'M', NULL, NULL, NULL, NULL, NULL, N'https://res.cloudinary.com/musicapp123/image/upload/v1626981339/hbzfndyrfyyds6a9li7y.jpg')
INSERT [dbo].[Usuario] ([Id_usuario], [Email], [Nombre], [Apellidos], [Contraseña], [Fecha_nac], [Ciudad], [Genero], [Instrumentos_fav], [Genero_musical_fav], [Es_cantante], [Estado_en_banda_concierto], [Desc_personal], [Foto_perfil]) VALUES (27, N'federicog@mail.com', N'Federico', N'Guzman', N'X+csoFYnoio=', N'2021-07-08', N'Monterrey, San Pedro', N'M', N'Guitarra', N'Rock Clasico', N'Si', N'No', N'Hola! me encanta la musica y tocar la guitarra.', N'https://res.cloudinary.com/musicapp123/image/upload/v1626981339/hbzfndyrfyyds6a9li7y.jpg')
INSERT [dbo].[Usuario] ([Id_usuario], [Email], [Nombre], [Apellidos], [Contraseña], [Fecha_nac], [Ciudad], [Genero], [Instrumentos_fav], [Genero_musical_fav], [Es_cantante], [Estado_en_banda_concierto], [Desc_personal], [Foto_perfil]) VALUES (28, N'obed@mail.com', N'Obed', N'Gutierrez', N'X+csoFYnoio=', N'2013-02-13', N'Monterrey', N'M', N'Bajo', N'Pop', N'No', N'Si', N'Hola', N'https://res.cloudinary.com/musicapp123/image/upload/v1627402265/p2ahdmbzquusgucukbep.jpg')
INSERT [dbo].[Usuario] ([Id_usuario], [Email], [Nombre], [Apellidos], [Contraseña], [Fecha_nac], [Ciudad], [Genero], [Instrumentos_fav], [Genero_musical_fav], [Es_cantante], [Estado_en_banda_concierto], [Desc_personal], [Foto_perfil]) VALUES (29, N'mrenegzz@gmail.com', N'Mau', N'Rene', N'Z1MiqUso4Mo=', N'2022-02-02', N'Sabinas', N'M', N'guitarra', N'', N'Si', N'No', N'hola', N'https://res.cloudinary.com/musicapp123/image/upload/v1643938447/pfmpzmaseykou8jpx4qj.jpg')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[AgrupacionesUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_Agrupaciones_usuarios_Agrupacion] FOREIGN KEY([Id_agrupacion])
REFERENCES [dbo].[Agrupacion] ([Id_agrupacion])
GO
ALTER TABLE [dbo].[AgrupacionesUsuarios] CHECK CONSTRAINT [FK_Agrupaciones_usuarios_Agrupacion]
GO
ALTER TABLE [dbo].[AgrupacionesUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_Agrupaciones_usuarios_usuario] FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[Usuario] ([Id_usuario])
GO
ALTER TABLE [dbo].[AgrupacionesUsuarios] CHECK CONSTRAINT [FK_Agrupaciones_usuarios_usuario]
GO
ALTER TABLE [dbo].[AgrupacionExterna]  WITH CHECK ADD  CONSTRAINT [FK_AgrupacionExterna_Usuario] FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[Usuario] ([Id_usuario])
GO
ALTER TABLE [dbo].[AgrupacionExterna] CHECK CONSTRAINT [FK_AgrupacionExterna_Usuario]
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Post] FOREIGN KEY([Id_post])
REFERENCES [dbo].[Post] ([Id_post])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Post]
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Usuario] FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[Usuario] ([Id_usuario])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Usuario]
GO
ALTER TABLE [dbo].[Follow]  WITH CHECK ADD  CONSTRAINT [FK_Follow_Usuario] FOREIGN KEY([Id_follower])
REFERENCES [dbo].[Usuario] ([Id_usuario])
GO
ALTER TABLE [dbo].[Follow] CHECK CONSTRAINT [FK_Follow_Usuario]
GO
ALTER TABLE [dbo].[Follow]  WITH CHECK ADD  CONSTRAINT [FK_Follow_Usuario1] FOREIGN KEY([Id_following])
REFERENCES [dbo].[Usuario] ([Id_usuario])
GO
ALTER TABLE [dbo].[Follow] CHECK CONSTRAINT [FK_Follow_Usuario1]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_Post] FOREIGN KEY([Id_post])
REFERENCES [dbo].[Post] ([Id_post])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_Post]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_Usuario] FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[Usuario] ([Id_usuario])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_Usuario]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Agrupacion] FOREIGN KEY([Id_agrupacion])
REFERENCES [dbo].[Agrupacion] ([Id_agrupacion])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Agrupacion]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Usuario] FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[Usuario] ([Id_usuario])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Usuario]
GO
ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_Agrupacion] FOREIGN KEY([Id_agrupacion])
REFERENCES [dbo].[Agrupacion] ([Id_agrupacion])
GO
ALTER TABLE [dbo].[Solicitud] CHECK CONSTRAINT [FK_Solicitud_Agrupacion]
GO
ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_Usuario] FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[Usuario] ([Id_usuario])
GO
ALTER TABLE [dbo].[Solicitud] CHECK CONSTRAINT [FK_Solicitud_Usuario]
GO
ALTER TABLE [dbo].[Token]  WITH CHECK ADD  CONSTRAINT [FK_Token_Usuario] FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[Usuario] ([Id_usuario])
GO
ALTER TABLE [dbo].[Token] CHECK CONSTRAINT [FK_Token_Usuario]
GO
USE [master]
GO
ALTER DATABASE [musicAppDB] SET  READ_WRITE 
GO
