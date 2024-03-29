USE [Consultorio]
GO
/****** Object:  Index [Indx_NombreP]    Script Date: 07/09/2019 01:53:05 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Paciente]') AND name = N'Indx_NombreP')
DROP INDEX [Indx_NombreP] ON [dbo].[Paciente]
GO
/****** Object:  Index [Indx_Medicamento]    Script Date: 07/09/2019 01:53:05 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Farmacia]') AND name = N'Indx_Medicamento')
DROP INDEX [Indx_Medicamento] ON [dbo].[Farmacia]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 07/09/2019 01:53:05 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paciente]') AND type in (N'U'))
DROP TABLE [dbo].[Paciente]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 07/09/2019 01:53:05 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Medicos]') AND type in (N'U'))
DROP TABLE [dbo].[Medicos]
GO
/****** Object:  Table [dbo].[Farmacia]    Script Date: 07/09/2019 01:53:05 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Farmacia]') AND type in (N'U'))
DROP TABLE [dbo].[Farmacia]
GO
/****** Object:  Table [dbo].[Consultorios]    Script Date: 07/09/2019 01:53:05 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consultorios]') AND type in (N'U'))
DROP TABLE [dbo].[Consultorios]
GO
/****** Object:  Table [dbo].[Consulta]    Script Date: 07/09/2019 01:53:05 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consulta]') AND type in (N'U'))
DROP TABLE [dbo].[Consulta]
GO
USE [master]
GO
/****** Object:  Database [Consultorio]    Script Date: 07/09/2019 01:53:05 p.m. ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'Consultorio')
DROP DATABASE [Consultorio]
GO
/****** Object:  Database [Consultorio]    Script Date: 07/09/2019 01:53:05 p.m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Consultorio')
BEGIN
CREATE DATABASE [Consultorio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Consultorio', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Consultorio.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Consultorio_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Consultorio_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [Consultorio] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Consultorio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Consultorio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Consultorio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Consultorio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Consultorio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Consultorio] SET ARITHABORT OFF 
GO
ALTER DATABASE [Consultorio] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Consultorio] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Consultorio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Consultorio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Consultorio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Consultorio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Consultorio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Consultorio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Consultorio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Consultorio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Consultorio] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Consultorio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Consultorio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Consultorio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Consultorio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Consultorio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Consultorio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Consultorio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Consultorio] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Consultorio] SET  MULTI_USER 
GO
ALTER DATABASE [Consultorio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Consultorio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Consultorio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Consultorio] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Consultorio]
GO
/****** Object:  Table [dbo].[Consulta]    Script Date: 07/09/2019 01:53:05 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consulta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Consulta](
	[IdConsulta] [tinyint] NOT NULL,
	[NombrePaciente] [varchar](255) NOT NULL,
	[PrimerApellidoP] [varchar](255) NOT NULL,
	[SegundoApellidoP] [varchar](255) NULL,
	[NombreCompletoP]  AS (((([NombrePaciente]+' ')+[PrimerApellidoP])+' ')+[SegundoApellidoP]),
	[Medico] [varchar](255) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdConsulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Consultorios]    Script Date: 07/09/2019 01:53:05 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consultorios]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Consultorios](
	[Direccion] [varchar](255) NOT NULL,
	[Especializacion] [varchar](255) NOT NULL,
	[HoraApertura] [time](7) NOT NULL,
	[HoraCierre] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Especializacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Farmacia]    Script Date: 07/09/2019 01:53:05 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Farmacia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Farmacia](
	[IdProducto] [uniqueidentifier] NOT NULL,
	[NomMedicamento] [varchar](50) NOT NULL,
	[Precio] [int] NOT NULL,
	[Existencias] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 07/09/2019 01:53:05 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Medicos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Medicos](
	[IdMedico] [int] NOT NULL,
	[NombreM] [varchar](255) NOT NULL,
	[PrimerApellidoM] [varchar](255) NOT NULL,
	[SegundoApellidoM] [varchar](255) NULL,
	[NombreCompleto]  AS (((([NombreM]+' ')+[PrimerApellidoM])+' ')+[SegundoApellidoM]),
PRIMARY KEY CLUSTERED 
(
	[IdMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 07/09/2019 01:53:05 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paciente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Paciente](
	[IdPacient] [tinyint] NOT NULL,
	[NombreP] [varchar](255) NOT NULL,
	[PrimerApellidoP] [varchar](255) NOT NULL,
	[SegundoApellidoP] [varchar](255) NULL,
	[NombreCompleto]  AS (((([NombreP]+' ')+[PrimerApellidoP])+' ')+[SegundoApellidoP]),
PRIMARY KEY CLUSTERED 
(
	[IdPacient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Indx_Medicamento]    Script Date: 07/09/2019 01:53:05 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Farmacia]') AND name = N'Indx_Medicamento')
CREATE NONCLUSTERED INDEX [Indx_Medicamento] ON [dbo].[Farmacia]
(
	[NomMedicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Indx_NombreP]    Script Date: 07/09/2019 01:53:05 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Paciente]') AND name = N'Indx_NombreP')
CREATE NONCLUSTERED INDEX [Indx_NombreP] ON [dbo].[Paciente]
(
	[NombreP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Consultorio] SET  READ_WRITE 
GO
