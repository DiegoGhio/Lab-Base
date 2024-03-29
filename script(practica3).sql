USE [master]
GO
/****** Object:  Database [Consultorio]    Script Date: 09/21/2019 14:10:56 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Consultorio')
BEGIN
CREATE DATABASE [Consultorio] ON  PRIMARY 
( NAME = N'Consultorio', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Consultorio.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Consultorio_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Consultorio_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [Consultorio] SET COMPATIBILITY_LEVEL = 100
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
ALTER DATABASE [Consultorio] SET  READ_WRITE
GO
ALTER DATABASE [Consultorio] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Consultorio] SET  MULTI_USER
GO
ALTER DATABASE [Consultorio] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Consultorio] SET DB_CHAINING OFF
GO
USE [Consultorio]
GO
/****** Object:  ForeignKey [Foreign_IdMedPaciente]    Script Date: 09/21/2019 14:10:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Foreign_IdMedPaciente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paciente]'))
ALTER TABLE [dbo].[Paciente] DROP CONSTRAINT [Foreign_IdMedPaciente]
GO
/****** Object:  ForeignKey [Foreign_IdConsultorio]    Script Date: 09/21/2019 14:10:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Foreign_IdConsultorio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] DROP CONSTRAINT [Foreign_IdConsultorio]
GO
/****** Object:  ForeignKey [Foreign_IdMed]    Script Date: 09/21/2019 14:10:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Foreign_IdMed]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] DROP CONSTRAINT [Foreign_IdMed]
GO
/****** Object:  ForeignKey [Foreign_Nom]    Script Date: 09/21/2019 14:10:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Foreign_Nom]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] DROP CONSTRAINT [Foreign_Nom]
GO
/****** Object:  ForeignKey [Foreign_Producto]    Script Date: 09/21/2019 14:10:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Foreign_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] DROP CONSTRAINT [Foreign_Producto]
GO
/****** Object:  Check [Ch_Precio]    Script Date: 09/21/2019 14:10:57 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[Ch_Precio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Farmacia]'))
BEGIN
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[Ch_Precio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Farmacia]'))
ALTER TABLE [dbo].[Farmacia] DROP CONSTRAINT [Ch_Precio]

END
GO
/****** Object:  Check [Ch_Edad]    Script Date: 09/21/2019 14:10:57 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[Ch_Edad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paciente]'))
BEGIN
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[Ch_Edad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paciente]'))
ALTER TABLE [dbo].[Paciente] DROP CONSTRAINT [Ch_Edad]

END
GO
/****** Object:  Table [dbo].[Consulta]    Script Date: 09/21/2019 14:10:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Foreign_IdConsultorio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] DROP CONSTRAINT [Foreign_IdConsultorio]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Foreign_IdMed]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] DROP CONSTRAINT [Foreign_IdMed]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Foreign_Nom]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] DROP CONSTRAINT [Foreign_Nom]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Foreign_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] DROP CONSTRAINT [Foreign_Producto]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Restriccion_Medicamento]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Consulta] DROP CONSTRAINT [Restriccion_Medicamento]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consulta]') AND type in (N'U'))
DROP TABLE [dbo].[Consulta]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 09/21/2019 14:10:57 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Foreign_IdMedPaciente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paciente]'))
ALTER TABLE [dbo].[Paciente] DROP CONSTRAINT [Foreign_IdMedPaciente]
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[Ch_Edad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paciente]'))
ALTER TABLE [dbo].[Paciente] DROP CONSTRAINT [Ch_Edad]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paciente]') AND type in (N'U'))
DROP TABLE [dbo].[Paciente]
GO
/****** Object:  Table [dbo].[Consultorios]    Script Date: 09/21/2019 14:10:57 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Default_Direccion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Consultorios] DROP CONSTRAINT [Default_Direccion]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consultorios]') AND type in (N'U'))
DROP TABLE [dbo].[Consultorios]
GO
/****** Object:  Table [dbo].[Farmacia]    Script Date: 09/21/2019 14:10:57 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[Ch_Precio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Farmacia]'))
ALTER TABLE [dbo].[Farmacia] DROP CONSTRAINT [Ch_Precio]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Farmacia]') AND type in (N'U'))
DROP TABLE [dbo].[Farmacia]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 09/21/2019 14:10:57 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Default_Especializacion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Medicos] DROP CONSTRAINT [Default_Especializacion]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Medicos]') AND type in (N'U'))
DROP TABLE [dbo].[Medicos]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 09/21/2019 14:10:57 ******/
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
	[Especializacion] [varchar](255) NOT NULL CONSTRAINT [Default_Especializacion]  DEFAULT ('General'),
	[NombreM] [varchar](255) NOT NULL,
	[PrimerApellidoM] [varchar](255) NOT NULL,
	[SegundoApellidoM] [varchar](255) NULL,
	[NombreCompleto]  AS (((([NombreM]+' ')+[PrimerApellidoM])+' ')+[SegundoApellidoM]),
PRIMARY KEY CLUSTERED 
(
	[IdMedico] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Farmacia]    Script Date: 09/21/2019 14:10:57 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Farmacia]') AND name = N'Indx_Medicamento')
CREATE NONCLUSTERED INDEX [Indx_Medicamento] ON [dbo].[Farmacia] 
(
	[NomMedicamento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consultorios]    Script Date: 09/21/2019 14:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consultorios]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Consultorios](
	[IdConsultorio] [uniqueidentifier] NOT NULL,
	[Direccion] [varchar](255) NOT NULL CONSTRAINT [Default_Direccion]  DEFAULT ('NE'),
	[Especializacion] [varchar](255) NOT NULL,
	[HoraApertura] [time](7) NOT NULL,
	[HoraCierre] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdConsultorio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 09/21/2019 14:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paciente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Paciente](
	[IdPaciente] [int] NOT NULL,
	[NombreP] [varchar](255) NOT NULL,
	[PrimerApellidoP] [varchar](255) NOT NULL,
	[SegundoApellidoP] [varchar](255) NULL,
	[NombreCompleto]  AS (((([NombreP]+' ')+[PrimerApellidoP])+' ')+[SegundoApellidoP]),
	[Edad] [int] NOT NULL,
	[IdMedico] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Paciente]') AND name = N'Indx_NombreP')
CREATE NONCLUSTERED INDEX [Indx_NombreP] ON [dbo].[Paciente] 
(
	[NombreP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consulta]    Script Date: 09/21/2019 14:10:57 ******/
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
	[IdConsultorio] [uniqueidentifier] NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[NombrePaciente] [varchar](255) NOT NULL,
	[PrimerApellidoP] [varchar](255) NOT NULL,
	[SegundoApellidoP] [varchar](255) NULL,
	[NombreCompletoP]  AS (((([NombrePaciente]+' ')+[PrimerApellidoP])+' ')+[SegundoApellidoP]),
	[IdMedico] [int] NOT NULL,
	[Medico] [varchar](255) NOT NULL,
	[IdProducto] [uniqueidentifier] NOT NULL CONSTRAINT [Restriccion_Medicamento]  DEFAULT ('No Recetado'),
	[Precio] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdConsulta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Check [Ch_Precio]    Script Date: 09/21/2019 14:10:57 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[Ch_Precio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Farmacia]'))
ALTER TABLE [dbo].[Farmacia]  WITH CHECK ADD  CONSTRAINT [Ch_Precio] CHECK  (([Precio]<=(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[Ch_Precio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Farmacia]'))
ALTER TABLE [dbo].[Farmacia] CHECK CONSTRAINT [Ch_Precio]
GO
/****** Object:  Check [Ch_Edad]    Script Date: 09/21/2019 14:10:57 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[Ch_Edad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paciente]'))
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [Ch_Edad] CHECK  (([Edad]<=(18)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[Ch_Edad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paciente]'))
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [Ch_Edad]
GO
/****** Object:  ForeignKey [Foreign_IdMedPaciente]    Script Date: 09/21/2019 14:10:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Foreign_IdMedPaciente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paciente]'))
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [Foreign_IdMedPaciente] FOREIGN KEY([IdMedico])
REFERENCES [dbo].[Medicos] ([IdMedico])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Foreign_IdMedPaciente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paciente]'))
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [Foreign_IdMedPaciente]
GO
/****** Object:  ForeignKey [Foreign_IdConsultorio]    Script Date: 09/21/2019 14:10:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Foreign_IdConsultorio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [Foreign_IdConsultorio] FOREIGN KEY([IdConsultorio])
REFERENCES [dbo].[Consultorios] ([IdConsultorio])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Foreign_IdConsultorio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [Foreign_IdConsultorio]
GO
/****** Object:  ForeignKey [Foreign_IdMed]    Script Date: 09/21/2019 14:10:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Foreign_IdMed]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [Foreign_IdMed] FOREIGN KEY([IdMedico])
REFERENCES [dbo].[Medicos] ([IdMedico])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Foreign_IdMed]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [Foreign_IdMed]
GO
/****** Object:  ForeignKey [Foreign_Nom]    Script Date: 09/21/2019 14:10:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Foreign_Nom]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [Foreign_Nom] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPaciente])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Foreign_Nom]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [Foreign_Nom]
GO
/****** Object:  ForeignKey [Foreign_Producto]    Script Date: 09/21/2019 14:10:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Foreign_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [Foreign_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Farmacia] ([IdProducto])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Foreign_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [Foreign_Producto]
GO
