USE [master]
GO
/****** Object:  Database [alquimiaDB]    Script Date: 30/5/2025 12:32:52 ******/
CREATE DATABASE [alquimiaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'alquimiaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\alquimiaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'alquimiaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\alquimiaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
USE alquimiaDB;
GO
ALTER DATABASE [alquimiaDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [alquimiaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [alquimiaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [alquimiaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [alquimiaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [alquimiaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [alquimiaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [alquimiaDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [alquimiaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [alquimiaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [alquimiaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [alquimiaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [alquimiaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [alquimiaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [alquimiaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [alquimiaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [alquimiaDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [alquimiaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [alquimiaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [alquimiaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [alquimiaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [alquimiaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [alquimiaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [alquimiaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [alquimiaDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [alquimiaDB] SET  MULTI_USER 
GO
ALTER DATABASE [alquimiaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [alquimiaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [alquimiaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [alquimiaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [alquimiaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [alquimiaDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [alquimiaDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [alquimiaDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200)
GO
USE [alquimiaDB]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Design]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Design](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TipoProductoId] [int] NULL,
	[IdProducto] [int] NULL,
	[Text] [nvarchar](50) NOT NULL,
	[Volume] [int] NULL,
	[Image] [varchar](100) NULL,
	[Shape] [varchar](20) NULL,
	[LabelColor] [varchar](10) NULL,
	[Typography] [varchar](50) NULL,
	[TextColor] [varchar](50) NULL,
 CONSTRAINT [PK_Design] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FamilyCompatibilities]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FamilyCompatibilities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Familia1Id] [int] NOT NULL,
	[Familia2Id] [int] NOT NULL,
	[GradoDeCompatibilidad] [int] NOT NULL,
	[FamiliaMenor]  AS (case when [Familia1Id]<[Familia2Id] then [Familia1Id] else [Familia2Id] end) PERSISTED NOT NULL,
	[FamiliaMayor]  AS (case when [Familia1Id]<[Familia2Id] then [Familia2Id] else [Familia1Id] end) PERSISTED NOT NULL,
 CONSTRAINT [PK_FamilyCompatibilities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinalEntity]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinalEntity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[ProductosId] [int] NULL,
	[DesignId] [int] NULL,
 CONSTRAINT [PK_FinalEntity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormulaNote]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormulaNote](
	[FormulaNotaId] [int] NOT NULL,
	[NotaId1] [int] NOT NULL,
	[NotaId2] [int] NULL,
	[NotaId3] [int] NULL,
	[NotaId4] [int] NULL,
 CONSTRAINT [PK_FormulaNote] PRIMARY KEY CLUSTERED 
(
	[FormulaNotaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Formulas]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Formulas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FormulaCorazon] [int] NOT NULL,
	[FormulaSalida] [int] NOT NULL,
	[FormulaFondo] [int] NOT NULL,
	[IntensidadId] [int] NOT NULL,
	[ConcentracionAlcohol] [float] NOT NULL,
	[ConcentracionAgua] [float] NOT NULL,
	[ConcentracionEsencia] [float] NOT NULL,
	[CreadorId] [int] NULL,
 CONSTRAINT [PK_Formulas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncompatibleNotes]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncompatibleNotes](
	[NotaId] [int] NOT NULL,
	[NotaIncompatibleId] [int] NOT NULL,
	[NotaMenor]  AS (case when [NotaId]<[NotaIncompatibleId] then [NotaId] else [NotaIncompatibleId] end) PERSISTED NOT NULL,
	[NotaMayor]  AS (case when [NotaId]<[NotaIncompatibleId] then [NotaIncompatibleId] else [NotaId] end) PERSISTED NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NotaId] ASC,
	[NotaIncompatibleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Intensities]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Intensities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Intensities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE Intensities ADD Description VARCHAR(100);
UPDATE Intensities
SET Description = 'Dura alrededor de 1-3 horas y tiene poca proyección'
WHERE Id = 1;
UPDATE Intensities
SET Description = 'Dura alrededor de 3-5 horas y tiene buena proyección'
WHERE Id = 2;
UPDATE Intensities
SET Description = 'Dura alrededor de 5-8 horas y tiene buena proyección'
WHERE Id = 3;

/****** Object:  Table [dbo].[Notes]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[FamiliaOlfativaId] [int] NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[PiramideOlfativaId] [int] NOT NULL,
 CONSTRAINT [PK_Notas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OlfactoryFamilies]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OlfactoryFamilies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](80) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Image1] [varbinary](max) NULL,
 CONSTRAINT [PK_OlfactoryFamilies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OlfactoryPyramid]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OlfactoryPyramid](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sector] [nvarchar](max) NOT NULL,
	[Duracion] [time](7) NOT NULL,
 CONSTRAINT [PK_OlfactoryPyramid] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Options]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Options](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Option1] [nvarchar](256) NULL,
	[Option2] [nvarchar](256) NULL,
	[Option3] [nvarchar](256) NULL,
	[Option4] [nvarchar](256) NULL,
	[Image1] [varbinary](max) NULL,
	[Image2] [varbinary](max) NULL,
	[Image3] [varbinary](max) NULL,
	[Image4] [varbinary](max) NULL,
 CONSTRAINT [PK_Options] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[PedidoProductoId] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NULL,
	[ProductosId] [int] NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[PedidoProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[UsuarioId] [int] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EstadoId] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TipoProductoId] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[IdProveedor] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductVariant]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVariant](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Volume] [decimal](10, 0) NOT NULL,
	[Unit] [nvarchar](20) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[IsHypoallergenic] [bit] NULL,
 CONSTRAINT [PK_ProductVariant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Pregunta] [nvarchar](256) NOT NULL,
	[IdOpciones] [int] NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPregunta] [int] NULL,
 CONSTRAINT [PK_Quiz] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscription](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Monto] [decimal](18, 0) NOT NULL,
	[IdEstado] [int] NULL,
 CONSTRAINT [PK_Subscription] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProductReviews]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProductReviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[IdProducto] [int] NULL,
	[FechaPublicacion] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserProductReviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProducts]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductoId] [int] NOT NULL,
	[UsuarioId] [int] NOT NULL,
 CONSTRAINT [PK_UserProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProviderReviews]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProviderReviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[FechaPublicacion] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserProviderReviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 30/5/2025 12:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IdEstado] [int] NULL,
	[IdFormulas] [int] NULL,
	[IdQuiz] [int] NULL,
	[IdSuscripcion] [int] NULL,
	[EsProveedor] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AspNetRoles] ON 

INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (1, N'Activo', N'Activo', N'Activo')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (2, N'Proveedor', N'PROVEEDOR', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (3, N'Creador', N'CREADOR', NULL)
SET IDENTITY_INSERT [dbo].[AspNetRoles] OFF
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (16, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (18, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (19, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (20, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (21, 3)
GO
SET IDENTITY_INSERT [dbo].[FamilyCompatibilities] ON 

INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (1, 1, 8, 75)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (2, 1, 11, 80)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (3, 1, 12, 85)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (4, 2, 6, 75)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (5, 3, 16, 80)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (6, 4, 11, 70)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (7, 5, 12, 70)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (8, 6, 7, 70)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (9, 7, 12, 75)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (10, 8, 11, 75)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (11, 8, 16, 70)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (12, 9, 11, 70)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (13, 10, 12, 80)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (14, 11, 12, 75)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (15, 13, 14, 70)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (16, 15, 8, 65)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (17, 16, 13, 65)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (18, 17, 6, 80)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (19, 1, 1, 100)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (20, 2, 2, 100)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (21, 3, 3, 100)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (22, 4, 4, 100)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (23, 5, 5, 100)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (24, 6, 6, 100)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (25, 7, 7, 100)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (26, 8, 8, 100)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (27, 9, 9, 100)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (28, 10, 10, 100)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (29, 11, 11, 100)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (30, 12, 12, 100)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (31, 13, 13, 100)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (32, 14, 14, 100)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (33, 15, 15, 100)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (34, 16, 16, 100)
INSERT [dbo].[FamilyCompatibilities] ([Id], [Familia1Id], [Familia2Id], [GradoDeCompatibilidad]) VALUES (35, 17, 17, 100)
SET IDENTITY_INSERT [dbo].[FamilyCompatibilities] OFF
GO
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (1, 24)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (1, 31)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (1, 32)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (2, 29)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (2, 32)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (2, 36)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (3, 26)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (3, 31)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (3, 33)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (3, 34)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (6, 24)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (6, 27)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (6, 40)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (6, 41)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (6, 44)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (7, 40)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (7, 44)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (7, 45)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (7, 48)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (8, 27)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (8, 29)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (8, 40)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (8, 44)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (8, 45)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (8, 48)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (9, 40)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (9, 44)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (9, 45)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (9, 48)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (10, 15)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (10, 41)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (11, 15)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (11, 25)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (11, 32)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (11, 41)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (12, 15)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (12, 32)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (12, 33)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (12, 41)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (13, 3)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (13, 34)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (15, 4)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (15, 38)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (15, 43)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (16, 19)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (22, 10)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (22, 11)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (22, 12)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (25, 6)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (25, 10)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (25, 12)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (25, 27)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (25, 28)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (25, 42)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (26, 42)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (27, 14)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (28, 6)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (28, 10)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (28, 11)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (28, 12)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (29, 4)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (29, 5)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (29, 6)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (29, 17)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (30, 8)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (30, 10)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (30, 11)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (30, 12)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (31, 10)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (31, 12)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (31, 19)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (31, 42)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (31, 48)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (32, 10)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (32, 42)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (33, 4)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (33, 5)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (33, 13)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (33, 43)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (34, 42)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (35, 7)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (36, 12)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (38, 31)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (38, 33)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (38, 34)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (39, 31)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (39, 33)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (39, 34)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (40, 11)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (40, 20)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (40, 34)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (40, 35)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (40, 36)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (42, 37)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (42, 40)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (42, 41)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (42, 44)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (43, 14)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (43, 40)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (43, 41)
GO
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (43, 44)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (44, 20)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (44, 35)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (44, 36)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (45, 20)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (45, 35)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (45, 36)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (46, 1)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (46, 4)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (47, 1)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (47, 4)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (47, 38)
INSERT [dbo].[IncompatibleNotes] ([NotaId], [NotaIncompatibleId]) VALUES (48, 12)
GO
SET IDENTITY_INSERT [dbo].[Intensities] ON 

INSERT [dbo].[Intensities] ([Id], [Nombre]) VALUES (1, N'Baja')
INSERT [dbo].[Intensities] ([Id], [Nombre]) VALUES (2, N'Media')
INSERT [dbo].[Intensities] ([Id], [Nombre]) VALUES (3, N'Alta')
SET IDENTITY_INSERT [dbo].[Intensities] OFF
GO
SET IDENTITY_INSERT [dbo].[Notes] ON 

INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (1, N'Albahaca', 13, N'Picante fresca', 2)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (2, N'Hinojo', 13, N'Anisado dulce', 2)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (3, N'Salvia', 13, N'Amaderada terrosa', 2)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (4, N'Alcanfor', 3, N'Frescura medicinal y penetrante', 1)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (5, N'Eucalipto', 3, N'Fresco herbáceo', 1)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (6, N'Menta Piperita', 3, N'Refrescante intenso', 1)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (7, N'Aldehído C-12', 4, N'Aroma a jabón limpio metálico', 1)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (8, N'Aldehído C-14', 4, N'Afrutado, similar al durazno', 1)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (9, N'Aldehído C-16', 4, N'Fuerte, frutal, fresa', 1)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (10, N'Algas', 15, N'Verde salado con toque acuático', 3)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (11, N'Calone', 15, N'Mar abierto y frescor oceánico', 3)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (12, N'Ozono', 15, N'Aire limpio antes de la lluvia', 3)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (13, N'Ámbar Gris', 7, N'Marino animálico', 3)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (14, N'Benjuí', 7, N'Resina suave con dulzor balsámico', 3)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (15, N'Haba tonka', 7, N'Recuerda a aroma de vainilla amarga', 3)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (16, N'Ambrette', 5, N'Semillas florales', 3)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (17, N'Musk Blanco', 5, N'Limpio suave', 3)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (18, N'Bergamota', 8, N'Dulce-amargo elegante', 1)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (19, N'Limón', 8, N'Ácido vibrante', 1)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (20, N'Mandarina', 8, N'Jugosa alegre', 1)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (21, N'Naranja', 8, N'Aroma dulce y cítrico', 1)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (22, N'Heliotropo', 9, N'Dulce almendrado', 2)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (23, N'Iris', 9, N'Terroso cremoso', 2)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (24, N'Talco', 9, N'Limpio suave', 2)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (25, N'Canela', 10, N'Dulce picante', 2)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (26, N'Cardamomo', 10, N'Cítrico-especiado', 2)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (27, N'Clavo', 10, N'Amaderado intenso', 2)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (28, N'Jazmín', 11, N'Floral, afrutado y suave', 2)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (29, N'Rosa', 11, N'Nota floral pesada y polvosa', 2)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (30, N'Ylang-Ylang', 11, N'Tropical cremoso', 2)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (31, N'Caramelo', 12, N'Dulce acaramelado', 3)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (32, N'Chocolate', 12, N'Cacao tentador', 3)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (33, N'Vainilla', 12, N'Cremosa cálida y dulce', 3)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (34, N'Frambuesa', 1, N'Afrutado jugoso', 2)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (35, N'Manzana Verde', 1, N'Crujiente frescor afrutado', 2)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (36, N'Melocotón', 1, N'Fruta aterciopelada y cálida', 2)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (37, N'Lavanda', 14, N'Floral-herbal relajante', 2)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (38, N'Romero', 14, N'Verde limpio silvestre', 2)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (39, N'Tomillo', 14, N'Terroso cálido', 2)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (40, N'Cuero', 2, N'Animalico intenso', 3)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (41, N'Tabaco', 2, N'Dulce seco', 3)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (42, N'Menta Poleo', 16, N'Terrosa intensa', 1)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (43, N'Menta Verde', 16, N'Fresca herbal', 1)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (44, N'Musgo', 17, N'Húmedo verde', 3)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (45, N'Vetiver', 17, N'Raíces secas', 3)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (46, N'Cedro', 6, N'Madera seca y suave.', 3)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (47, N'Sándalo', 6, N'Amaderada, cálida, suave.', 3)
INSERT [dbo].[Notes] ([Id], [Nombre], [FamiliaOlfativaId], [Descripcion], [PiramideOlfativaId]) VALUES (48, N'Pachuli', 6, N'Profundo, cálido y poderoso.', 3)
SET IDENTITY_INSERT [dbo].[Notes] OFF
GO
SET IDENTITY_INSERT [dbo].[OlfactoryFamilies] ON 

INSERT [dbo].[OlfactoryFamilies] ([Id], [Nombre], [Description], [Image1]) VALUES (1, N'Frutal', N'Dulce y jugoso, frutas como manzana, pera, melocotón.', NULL)
INSERT [dbo].[OlfactoryFamilies] ([Id], [Nombre], [Description], [Image1]) VALUES (2, N'Ahumado', N'Aroma profundo y seco, leña quemada, incienso.', NULL)
INSERT [dbo].[OlfactoryFamilies] ([Id], [Nombre], [Description], [Image1]) VALUES (3, N'Alcanforado', N'Fresco y penetrante, eucalipto, ungüentos.', NULL)
INSERT [dbo].[OlfactoryFamilies] ([Id], [Nombre], [Description], [Image1]) VALUES (4, N'Aldehídico', N'Aroma limpio, jabonoso, brillante.', NULL)
INSERT [dbo].[OlfactoryFamilies] ([Id], [Nombre], [Description], [Image1]) VALUES (5, N'Almizclado', N'Cálido, sensual, terroso y suave.', NULL)
INSERT [dbo].[OlfactoryFamilies] ([Id], [Nombre], [Description], [Image1]) VALUES (6, N'Amaderado', N'Notas secas y cálidas de madera.', NULL)
INSERT [dbo].[OlfactoryFamilies] ([Id], [Nombre], [Description], [Image1]) VALUES (7, N'Ámbar', N'Cálidos, sensuales, resinosos, empolvados.', NULL)
INSERT [dbo].[OlfactoryFamilies] ([Id], [Nombre], [Description], [Image1]) VALUES (8, N'Cítrico', N'Refrescante y chispeante.', NULL)
INSERT [dbo].[OlfactoryFamilies] ([Id], [Nombre], [Description], [Image1]) VALUES (9, N'Empolvado', N'Suave, seco y limpio, como talco.', NULL)
INSERT [dbo].[OlfactoryFamilies] ([Id], [Nombre], [Description], [Image1]) VALUES (10, N'Especiado', N'Cálido y vibrante, canela, clavo, pimienta.', NULL)
INSERT [dbo].[OlfactoryFamilies] ([Id], [Nombre], [Description], [Image1]) VALUES (11, N'Floral', N'Fragancia de flores.', NULL)
INSERT [dbo].[OlfactoryFamilies] ([Id], [Nombre], [Description], [Image1]) VALUES (12, N'Gourmand', N'Aromas cálidos y dulces, comestibles.', NULL)
INSERT [dbo].[OlfactoryFamilies] ([Id], [Nombre], [Description], [Image1]) VALUES (13, N'Herbal', N'Verde y terroso, hojas, tallos.', NULL)
INSERT [dbo].[OlfactoryFamilies] ([Id], [Nombre], [Description], [Image1]) VALUES (14, N'Hierbas aromáticas', N'Notas frescas y verdes, romero, lavanda.', NULL)
INSERT [dbo].[OlfactoryFamilies] ([Id], [Nombre], [Description], [Image1]) VALUES (15, N'Marino', N'Fresco y salino, evoca el mar.', NULL)
INSERT [dbo].[OlfactoryFamilies] ([Id], [Nombre], [Description], [Image1]) VALUES (16, N'Mentolado', N'Frescor intenso y frío, menta.', NULL)
INSERT [dbo].[OlfactoryFamilies] ([Id], [Nombre], [Description], [Image1]) VALUES (17, N'Terroso', N'Húmedo y natural, tierra mojada, raíces.', NULL)
SET IDENTITY_INSERT [dbo].[OlfactoryFamilies] OFF
GO
SET IDENTITY_INSERT [dbo].[OlfactoryPyramid] ON 

INSERT [dbo].[OlfactoryPyramid] ([Id], [Sector], [Duracion]) VALUES (1, N'Salida', CAST(N'00:15:00' AS Time))
INSERT [dbo].[OlfactoryPyramid] ([Id], [Sector], [Duracion]) VALUES (2, N'Corazón', CAST(N'01:00:00' AS Time))
INSERT [dbo].[OlfactoryPyramid] ([Id], [Sector], [Duracion]) VALUES (3, N'Fondo', CAST(N'06:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[OlfactoryPyramid] OFF
GO
SET IDENTITY_INSERT [dbo].[Options] ON 

INSERT [dbo].[Options] ([Id], [Option1], [Option2], [Option3], [Option4], [Image1], [Image2], [Image3], [Image4]) VALUES (1, N'Fresca y energética ☀️', N'Romántica y suave 🌸', N'Misteriosa y sensual 🌙', N'Aventurera y única 🌍', NULL, NULL, NULL, NULL)
INSERT [dbo].[Options] ([Id], [Option1], [Option2], [Option3], [Option4], [Image1], [Image2], [Image3], [Image4]) VALUES (2, N'Playa tropical 🏖️', N'Campo florido 🌼', N'Ciudad antigua 🏛️', N'Montañas nevadas 🏔️', NULL, NULL, NULL, NULL)
INSERT [dbo].[Options] ([Id], [Option1], [Option2], [Option3], [Option4], [Image1], [Image2], [Image3], [Image4]) VALUES (3, N'Limonada con menta 🍋', N'Té de rosas 🌹', N'Vino tinto 🍷', N'Café especiado ☕', NULL, NULL, NULL, NULL)
INSERT [dbo].[Options] ([Id], [Option1], [Option2], [Option3], [Option4], [Image1], [Image2], [Image3], [Image4]) VALUES (4, N'Lino fresco 👕', N'Seda suave 🧣', N'Cuero elegante 🧥', N'Lana acogedora 🧶', NULL, NULL, NULL, NULL)
INSERT [dbo].[Options] ([Id], [Option1], [Option2], [Option3], [Option4], [Image1], [Image2], [Image3], [Image4]) VALUES (5, N'Primavera 🌸', N'Verano ☀️', N'Otoño 🍂', N'Invierno ❄️', NULL, NULL, NULL, NULL)
INSERT [dbo].[Options] ([Id], [Option1], [Option2], [Option3], [Option4], [Image1], [Image2], [Image3], [Image4]) VALUES (6, N'Azul celeste 🔵', N'Rosa pálido 🌷', N'Borgoña profundo 🍷', N'Verde bosque 🌲', NULL, NULL, NULL, NULL)
INSERT [dbo].[Options] ([Id], [Option1], [Option2], [Option3], [Option4], [Image1], [Image2], [Image3], [Image4]) VALUES (7, N'Mañana soleada 🌅', N'Atardecer dorado 🌇', N'Noche estrellada 🌌', N'Amanecer brumoso 🌫️', NULL, NULL, NULL, NULL)
INSERT [dbo].[Options] ([Id], [Option1], [Option2], [Option3], [Option4], [Image1], [Image2], [Image3], [Image4]) VALUES (8, N'Girasol 🌻', N'Rosa 🌹', N'Orquídea 🦋', N'Lavanda 💜', NULL, NULL, NULL, NULL)
INSERT [dbo].[Options] ([Id], [Option1], [Option2], [Option3], [Option4], [Image1], [Image2], [Image3], [Image4]) VALUES (9, N'Minimalista ✨', N'Clásico 👑', N'Dramático 💎', N'Bohemio 🌈', NULL, NULL, NULL, NULL)
INSERT [dbo].[Options] ([Id], [Option1], [Option2], [Option3], [Option4], [Image1], [Image2], [Image3], [Image4]) VALUES (10, N'Agua 💧', N'Fuego 🔥', N'Tierra 🌱', N'Aire 🌬️', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Options] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [TipoProductoId], [Name], [Description], [IdProveedor]) VALUES (1, 1, N'Bergamota', N'La bergamota es la reina de las notas de salida', 23)
INSERT [dbo].[Products] ([Id], [TipoProductoId], [Name], [Description], [IdProveedor]) VALUES (2, 1, N'Esencia Pura Bergamota', N'Esencia Pura para diferentes usos', 22)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([Id], [Description]) VALUES (1, N'Esencia')
INSERT [dbo].[ProductTypes] ([Id], [Description]) VALUES (2, N'Alcohol')
INSERT [dbo].[ProductTypes] ([Id], [Description]) VALUES (3, N'Envase')
INSERT [dbo].[ProductTypes] ([Id], [Description]) VALUES (4, N'Etiqueta')
INSERT [dbo].[ProductTypes] ([Id], [Description]) VALUES (5, N'Agua destilada')
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductVariant] ON 

INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Volume], [Unit], [Price], [Stock], [IsHypoallergenic]) VALUES (1, 1, CAST(10 AS Decimal(10, 0)), N'ml', CAST(5300.00 AS Decimal(10, 2)), 50, NULL)
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Volume], [Unit], [Price], [Stock], [IsHypoallergenic]) VALUES (2, 1, CAST(20 AS Decimal(10, 0)), N'ml', CAST(7000.00 AS Decimal(10, 2)), 80, NULL)
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Volume], [Unit], [Price], [Stock], [IsHypoallergenic]) VALUES (3, 1, CAST(120 AS Decimal(10, 0)), N'ml', CAST(19100.00 AS Decimal(10, 2)), 50, NULL)
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Volume], [Unit], [Price], [Stock], [IsHypoallergenic]) VALUES (4, 1, CAST(250 AS Decimal(10, 0)), N'ml', CAST(30000.00 AS Decimal(10, 2)), 30, NULL)
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Volume], [Unit], [Price], [Stock], [IsHypoallergenic]) VALUES (5, 1, CAST(500 AS Decimal(10, 0)), N'ml', CAST(54000.00 AS Decimal(10, 2)), 40, NULL)
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Volume], [Unit], [Price], [Stock], [IsHypoallergenic]) VALUES (6, 2, CAST(50 AS Decimal(10, 0)), N'ml', CAST(5100.00 AS Decimal(10, 2)), 6, 0)
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Volume], [Unit], [Price], [Stock], [IsHypoallergenic]) VALUES (7, 2, CAST(100 AS Decimal(10, 0)), N'ml', CAST(8000.00 AS Decimal(10, 2)), 4, 0)
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Volume], [Unit], [Price], [Stock], [IsHypoallergenic]) VALUES (8, 2, CAST(250 AS Decimal(10, 0)), N'ml', CAST(16800.00 AS Decimal(10, 2)), 4, 0)
INSERT [dbo].[ProductVariant] ([Id], [ProductId], [Volume], [Unit], [Price], [Stock], [IsHypoallergenic]) VALUES (9, 2, CAST(1 AS Decimal(10, 0)), N'lt', CAST(40000.00 AS Decimal(10, 2)), 2, 0)
SET IDENTITY_INSERT [dbo].[ProductVariant] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [IdEstado], [IdFormulas], [IdQuiz], [IdSuscripcion], [EsProveedor], [UserName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [NormalizedEmail], [NormalizedUserName], [PhoneNumber], [PhoneNumberConfirmed]) VALUES (16, N'string', NULL, NULL, NULL, NULL, 0, N'string@gmail.com', N'string@gmail.com', 0, N'AQAAAAIAAYagAAAAEEfIbmh9dEAg+llJMwCg3IKGWQaeszOQliZAR/43Px5vRlPAF59VuqDidIuoFshFuQ==', N'D2I465ZNENH6FDVIXPZC3VT2AVPHNKQR', N'a2373632-6f24-454c-82ca-3038cc1b1208', 0, NULL, 1, 0, N'STRING@GMAIL.COM', N'STRING@GMAIL.COM', NULL, 0)
INSERT [dbo].[Users] ([Id], [Name], [IdEstado], [IdFormulas], [IdQuiz], [IdSuscripcion], [EsProveedor], [UserName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [NormalizedEmail], [NormalizedUserName], [PhoneNumber], [PhoneNumberConfirmed]) VALUES (18, N'string', NULL, NULL, NULL, NULL, 0, N'strRERRing@gmail.com', N'strRERRing@gmail.com', 0, N'AQAAAAIAAYagAAAAEBgwpb/wUO0kFC0yuV6pUpVWlv4bJ1Bxhmk95CqBQtajcFaZ8SRwb6krY73Lg9GNYw==', N'4V4VI452KUZW3ARDVH5VSQ4OILUTYARM', N'17075433-116b-4306-acf7-f9c457bc8b58', 0, NULL, 1, 0, N'STRRERRING@GMAIL.COM', N'STRRERRING@GMAIL.COM', NULL, 0)
INSERT [dbo].[Users] ([Id], [Name], [IdEstado], [IdFormulas], [IdQuiz], [IdSuscripcion], [EsProveedor], [UserName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [NormalizedEmail], [NormalizedUserName], [PhoneNumber], [PhoneNumberConfirmed]) VALUES (19, N'string', NULL, NULL, NULL, NULL, 0, N'strRERRGFDGFDGFDGFing@gmail.com', N'strRERRGFDGFDGFDGFing@gmail.com', 0, N'AQAAAAIAAYagAAAAEJEibse//dHshYh8knYDiDLAWn6LceZuFPWqSuErunLmEnn6g4yrluEapKIP8R/v/w==', N'WQXEMFG3HPBAZ7OF4SICDU6ZN3YA3DHX', N'5d8ef6ea-06ca-4e0a-a751-6019a04083d5', 0, NULL, 1, 0, N'STRRERRGFDGFDGFDGFING@GMAIL.COM', N'STRRERRGFDGFDGFDGFING@GMAIL.COM', NULL, 0)
INSERT [dbo].[Users] ([Id], [Name], [IdEstado], [IdFormulas], [IdQuiz], [IdSuscripcion], [EsProveedor], [UserName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [NormalizedEmail], [NormalizedUserName], [PhoneNumber], [PhoneNumberConfirmed]) VALUES (20, N'strinssg', NULL, NULL, NULL, NULL, 0, N'string@sasd.com', N'string@sasd.com', 0, N'AQAAAAIAAYagAAAAEOCSlPtzrDiF8KYwocTAlSXbgUXH6bN5+YHf8V06f7iVqgaSJdKe+m/qxfBxwY/Udw==', N'M7JGLM5HP4K5LT6PI752J77PRGX2S62T', N'8d498be1-e610-4325-b089-1015a3d5c3a5', 0, NULL, 1, 0, N'STRING@SASD.COM', N'STRING@SASD.COM', NULL, 0)
INSERT [dbo].[Users] ([Id], [Name], [IdEstado], [IdFormulas], [IdQuiz], [IdSuscripcion], [EsProveedor], [UserName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [NormalizedEmail], [NormalizedUserName], [PhoneNumber], [PhoneNumberConfirmed]) VALUES (21, N'mica', NULL, NULL, NULL, NULL, 0, N'micaelazara0@gmail.com', N'micaelazara0@gmail.com', 0, N'AQAAAAIAAYagAAAAEItZXcNe7gwMN1OI3OLkZFfEOXp8gJgCqIPbUDPrCan84GLgmkm6f5+5EItfspoyzg==', N'3A2TBP7BKJ65K22EIO34PWVOGCIB24AG', N'80a43152-89cb-462f-86c6-e7969edc26ed', 0, NULL, 1, 0, N'MICAELAZARA0@GMAIL.COM', N'MICAELAZARA0@GMAIL.COM', NULL, 0)
INSERT [dbo].[Users] ([Id], [Name], [IdEstado], [IdFormulas], [IdQuiz], [IdSuscripcion], [EsProveedor], [UserName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [NormalizedEmail], [NormalizedUserName], [PhoneNumber], [PhoneNumberConfirmed]) VALUES (22, N'Esencia Body and Home', NULL, NULL, NULL, NULL, 1, N'esenciabodyandhome', N'local@esenciabodyandhome.com.ar', 1, NULL, NULL, NULL, 1, NULL, 1, 1, N'LOCAL@ESENCIABODYANDHOME.COM.AR', N'ESENCIABODYANDHOME', N'1130911302', 1)
INSERT [dbo].[Users] ([Id], [Name], [IdEstado], [IdFormulas], [IdQuiz], [IdSuscripcion], [EsProveedor], [UserName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [NormalizedEmail], [NormalizedUserName], [PhoneNumber], [PhoneNumberConfirmed]) VALUES (23, N'Vezzo Perfumes', NULL, NULL, NULL, NULL, 1, N'vezzoperfumes', N'perfumesvezzo@gmail.com', 1, NULL, NULL, NULL, 1, NULL, 1, 1, N'PERFUMESVEZZO@GMAIL.COM', N'VEZZOPERFUMES', N'1132384189', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Intensities] ADD  DEFAULT (N'') FOR [Nombre]
GO
ALTER TABLE [dbo].[ProductVariant] ADD  CONSTRAINT [DF__ProductVa__IsHyp__47A6A41B]  DEFAULT ((0)) FOR [IsHypoallergenic]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [PhoneNumberConfirmed]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_Usuarios_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_Usuarios_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_Usuarios_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_Usuarios_UserId]
GO
ALTER TABLE [dbo].[Design]  WITH CHECK ADD  CONSTRAINT [FK_design_productId] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Design] CHECK CONSTRAINT [FK_design_productId]
GO
ALTER TABLE [dbo].[FamilyCompatibilities]  WITH CHECK ADD  CONSTRAINT [FK_CompatibilidadesFamilias_FamiliasOlfativas_Familia1Id] FOREIGN KEY([Familia1Id])
REFERENCES [dbo].[OlfactoryFamilies] ([Id])
GO
ALTER TABLE [dbo].[FamilyCompatibilities] CHECK CONSTRAINT [FK_CompatibilidadesFamilias_FamiliasOlfativas_Familia1Id]
GO
ALTER TABLE [dbo].[FamilyCompatibilities]  WITH CHECK ADD  CONSTRAINT [FK_CompatibilidadesFamilias_FamiliasOlfativas_Familia2Id] FOREIGN KEY([Familia2Id])
REFERENCES [dbo].[OlfactoryFamilies] ([Id])
GO
ALTER TABLE [dbo].[FamilyCompatibilities] CHECK CONSTRAINT [FK_CompatibilidadesFamilias_FamiliasOlfativas_Familia2Id]
GO
ALTER TABLE [dbo].[FinalEntity]  WITH CHECK ADD  CONSTRAINT [FK_EntidadFinal_Design] FOREIGN KEY([DesignId])
REFERENCES [dbo].[Design] ([Id])
GO
ALTER TABLE [dbo].[FinalEntity] CHECK CONSTRAINT [FK_EntidadFinal_Design]
GO
ALTER TABLE [dbo].[FinalEntity]  WITH CHECK ADD  CONSTRAINT [FK_EntidadFinal_IdUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[FinalEntity] CHECK CONSTRAINT [FK_EntidadFinal_IdUsuario]
GO
ALTER TABLE [dbo].[FinalEntity]  WITH CHECK ADD  CONSTRAINT [FK_EntidadFinal_ProductoId] FOREIGN KEY([ProductosId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[FinalEntity] CHECK CONSTRAINT [FK_EntidadFinal_ProductoId]
GO
ALTER TABLE [dbo].[FormulaNote]  WITH CHECK ADD  CONSTRAINT [FK_nota1] FOREIGN KEY([NotaId1])
REFERENCES [dbo].[Notes] ([Id])
GO
ALTER TABLE [dbo].[FormulaNote] CHECK CONSTRAINT [FK_nota1]
GO
ALTER TABLE [dbo].[FormulaNote]  WITH CHECK ADD  CONSTRAINT [FK_nota2] FOREIGN KEY([NotaId2])
REFERENCES [dbo].[Notes] ([Id])
GO
ALTER TABLE [dbo].[FormulaNote] CHECK CONSTRAINT [FK_nota2]
GO
ALTER TABLE [dbo].[FormulaNote]  WITH CHECK ADD  CONSTRAINT [FK_nota3] FOREIGN KEY([NotaId3])
REFERENCES [dbo].[Notes] ([Id])
GO
ALTER TABLE [dbo].[FormulaNote] CHECK CONSTRAINT [FK_nota3]
GO
ALTER TABLE [dbo].[FormulaNote]  WITH CHECK ADD  CONSTRAINT [FK_nota4] FOREIGN KEY([NotaId4])
REFERENCES [dbo].[Notes] ([Id])
GO
ALTER TABLE [dbo].[FormulaNote] CHECK CONSTRAINT [FK_nota4]
GO
ALTER TABLE [dbo].[Formulas]  WITH CHECK ADD  CONSTRAINT [FK_Formulas_corazon] FOREIGN KEY([FormulaCorazon])
REFERENCES [dbo].[FormulaNote] ([FormulaNotaId])
GO
ALTER TABLE [dbo].[Formulas] CHECK CONSTRAINT [FK_Formulas_corazon]
GO
ALTER TABLE [dbo].[Formulas]  WITH CHECK ADD  CONSTRAINT [FK_Formulas_fondo] FOREIGN KEY([FormulaFondo])
REFERENCES [dbo].[FormulaNote] ([FormulaNotaId])
GO
ALTER TABLE [dbo].[Formulas] CHECK CONSTRAINT [FK_Formulas_fondo]
GO
ALTER TABLE [dbo].[Formulas]  WITH CHECK ADD  CONSTRAINT [FK_Formulas_intensidad] FOREIGN KEY([IntensidadId])
REFERENCES [dbo].[Intensities] ([Id])
GO
ALTER TABLE [dbo].[Formulas] CHECK CONSTRAINT [FK_Formulas_intensidad]
GO
ALTER TABLE [dbo].[Formulas]  WITH CHECK ADD  CONSTRAINT [FK_Formulas_salida] FOREIGN KEY([FormulaSalida])
REFERENCES [dbo].[FormulaNote] ([FormulaNotaId])
GO
ALTER TABLE [dbo].[Formulas] CHECK CONSTRAINT [FK_Formulas_salida]
GO
ALTER TABLE [dbo].[IncompatibleNotes]  WITH CHECK ADD  CONSTRAINT [FK_NotaIncompatible_nota] FOREIGN KEY([NotaId])
REFERENCES [dbo].[Notes] ([Id])
GO
ALTER TABLE [dbo].[IncompatibleNotes] CHECK CONSTRAINT [FK_NotaIncompatible_nota]
GO
ALTER TABLE [dbo].[IncompatibleNotes]  WITH CHECK ADD  CONSTRAINT [FK_NotaIncompatible_notaIncompatible] FOREIGN KEY([NotaIncompatibleId])
REFERENCES [dbo].[Notes] ([Id])
GO
ALTER TABLE [dbo].[IncompatibleNotes] CHECK CONSTRAINT [FK_NotaIncompatible_notaIncompatible]
GO
ALTER TABLE [dbo].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_notasFamiliaOlfativa] FOREIGN KEY([FamiliaOlfativaId])
REFERENCES [dbo].[OlfactoryFamilies] ([Id])
GO
ALTER TABLE [dbo].[Notes] CHECK CONSTRAINT [FK_notasFamiliaOlfativa]
GO
ALTER TABLE [dbo].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_notasPiramideOlfativa] FOREIGN KEY([PiramideOlfativaId])
REFERENCES [dbo].[OlfactoryPyramid] ([Id])
GO
ALTER TABLE [dbo].[Notes] CHECK CONSTRAINT [FK_notasPiramideOlfativa]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_pedidoIdPedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_pedidoIdPedido]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_pedidoProductoId] FOREIGN KEY([ProductosId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_pedidoProductoId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_pedido_usuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_pedido_usuario]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_pedidosEstado] FOREIGN KEY([EstadoId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_pedidosEstado]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_productIdProv] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_productIdProv]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_ProductTypes] FOREIGN KEY([TipoProductoId])
REFERENCES [dbo].[ProductTypes] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_ProductTypes]
GO
ALTER TABLE [dbo].[ProductVariant]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariant_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductVariant] CHECK CONSTRAINT [FK_ProductVariant_Product]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_QuestionsOptions] FOREIGN KEY([IdOpciones])
REFERENCES [dbo].[Options] ([Id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_QuestionsOptions]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_quizPreguntas] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_quizPreguntas]
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Status_Subscription] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_Status_Subscription]
GO
ALTER TABLE [dbo].[UserProductReviews]  WITH CHECK ADD  CONSTRAINT [FK_opinion_ProductoId] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[UserProductReviews] CHECK CONSTRAINT [FK_opinion_ProductoId]
GO
ALTER TABLE [dbo].[UserProductReviews]  WITH CHECK ADD  CONSTRAINT [FK_opinionUsuario_producto] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserProductReviews] CHECK CONSTRAINT [FK_opinionUsuario_producto]
GO
ALTER TABLE [dbo].[UserProducts]  WITH CHECK ADD  CONSTRAINT [FK_UserProducts_producto] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[UserProducts] CHECK CONSTRAINT [FK_UserProducts_producto]
GO
ALTER TABLE [dbo].[UserProducts]  WITH CHECK ADD  CONSTRAINT [FK_UserProducts_usuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserProducts] CHECK CONSTRAINT [FK_UserProducts_usuario]
GO
ALTER TABLE [dbo].[UserProviderReviews]  WITH CHECK ADD  CONSTRAINT [FK_opinionProveedor] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserProviderReviews] CHECK CONSTRAINT [FK_opinionProveedor]
GO
ALTER TABLE [dbo].[UserProviderReviews]  WITH CHECK ADD  CONSTRAINT [FK_opinionUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserProviderReviews] CHECK CONSTRAINT [FK_opinionUsuario]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_estado_Users] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_estado_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_formulas_Users] FOREIGN KEY([IdFormulas])
REFERENCES [dbo].[Formulas] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_formulas_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_quiz_Users] FOREIGN KEY([IdQuiz])
REFERENCES [dbo].[Quiz] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_quiz_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_suscripcion_Users] FOREIGN KEY([IdSuscripcion])
REFERENCES [dbo].[Subscription] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_suscripcion_Users]
GO
ALTER TABLE [dbo].[IncompatibleNotes]  WITH CHECK ADD  CONSTRAINT [CHK_Notas_Distintas] CHECK  (([NotaId]<>[NotaIncompatibleId]))
GO
ALTER TABLE [dbo].[IncompatibleNotes] CHECK CONSTRAINT [CHK_Notas_Distintas]
GO
USE [master]
GO
ALTER DATABASE [alquimiaDB] SET  READ_WRITE 
GO
