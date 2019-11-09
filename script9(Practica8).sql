USE [Consultorio3]
GO
/****** Object:  Trigger [PacientePru]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP TRIGGER IF EXISTS [dbo].[PacientePru]
GO
/****** Object:  StoredProcedure [dbo].[sobresobrepedido]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[sobresobrepedido]
GO
/****** Object:  StoredProcedure [dbo].[Medicos_Noct]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[Medicos_Noct]
GO
/****** Object:  StoredProcedure [dbo].[Medicina_reorden]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[Medicina_reorden]
GO
/****** Object:  StoredProcedure [dbo].[Med_Temprano]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[Med_Temprano]
GO
/****** Object:  StoredProcedure [dbo].[Anciano]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[Anciano]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paciente]') AND type in (N'U'))
ALTER TABLE [dbo].[Paciente] DROP CONSTRAINT IF EXISTS [Foreign_IdMedPaciente]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Farmacia]') AND type in (N'U'))
ALTER TABLE [dbo].[Farmacia] DROP CONSTRAINT IF EXISTS [DF__Farmacia__IdProd__403A8C7D]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consultorios]') AND type in (N'U'))
ALTER TABLE [dbo].[Consultorios] DROP CONSTRAINT IF EXISTS [DF__Consultor__IdCon__3B75D760]
GO
/****** Object:  Table [dbo].[PacientesBKUP]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP TABLE IF EXISTS [dbo].[PacientesBKUP]
GO
/****** Object:  Table [dbo].[Consulta]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Consulta]
GO
/****** Object:  View [dbo].[pacientePrueba]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP VIEW IF EXISTS [dbo].[pacientePrueba]
GO
/****** Object:  UserDefinedFunction [dbo].[precio_Med]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP FUNCTION IF EXISTS [dbo].[precio_Med]
GO
/****** Object:  View [dbo].[TerceraEdad]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP VIEW IF EXISTS [dbo].[TerceraEdad]
GO
/****** Object:  View [dbo].[Medico_Salida]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP VIEW IF EXISTS [dbo].[Medico_Salida]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Medicos]
GO
/****** Object:  View [dbo].[Consultorio_Vespertino]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP VIEW IF EXISTS [dbo].[Consultorio_Vespertino]
GO
/****** Object:  Table [dbo].[Consultorios]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Consultorios]
GO
/****** Object:  View [dbo].[Medicina_sobrepedido]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP VIEW IF EXISTS [dbo].[Medicina_sobrepedido]
GO
/****** Object:  View [dbo].[Medicina_Faltante]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP VIEW IF EXISTS [dbo].[Medicina_Faltante]
GO
/****** Object:  Table [dbo].[Farmacia]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Farmacia]
GO
/****** Object:  View [dbo].[tercera_edad]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP VIEW IF EXISTS [dbo].[tercera_edad]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Paciente]
GO
USE [master]
GO
/****** Object:  Database [Consultorio3]    Script Date: 02/11/2019 03:26:31 a. m. ******/
DROP DATABASE IF EXISTS [Consultorio3]
GO
/****** Object:  Database [Consultorio3]    Script Date: 02/11/2019 03:26:31 a. m. ******/
CREATE DATABASE [Consultorio3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Consultorio3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Consultorio3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Consultorio3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Consultorio3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Consultorio3] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Consultorio3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Consultorio3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Consultorio3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Consultorio3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Consultorio3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Consultorio3] SET ARITHABORT OFF 
GO
ALTER DATABASE [Consultorio3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Consultorio3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Consultorio3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Consultorio3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Consultorio3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Consultorio3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Consultorio3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Consultorio3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Consultorio3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Consultorio3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Consultorio3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Consultorio3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Consultorio3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Consultorio3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Consultorio3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Consultorio3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Consultorio3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Consultorio3] SET RECOVERY FULL 
GO
ALTER DATABASE [Consultorio3] SET  MULTI_USER 
GO
ALTER DATABASE [Consultorio3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Consultorio3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Consultorio3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Consultorio3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Consultorio3] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Consultorio3', N'ON'
GO
ALTER DATABASE [Consultorio3] SET QUERY_STORE = OFF
GO
USE [Consultorio3]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 02/11/2019 03:26:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tercera_edad]    Script Date: 02/11/2019 03:26:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[tercera_edad] as
select Paciente.NombreCompleto, Paciente.Edad
FROM Paciente
WHERE Edad > 50;
GO
/****** Object:  Table [dbo].[Farmacia]    Script Date: 02/11/2019 03:26:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  View [dbo].[Medicina_Faltante]    Script Date: 02/11/2019 03:26:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Medicina_Faltante] as
select Farmacia.Existencias
FROM Farmacia
WHERE Existencias = 0;

GO
/****** Object:  View [dbo].[Medicina_sobrepedido]    Script Date: 02/11/2019 03:26:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Medicina_sobrepedido] as
select Farmacia.Existencias
FROM Farmacia
WHERE Existencias > 25;

GO
/****** Object:  Table [dbo].[Consultorios]    Script Date: 02/11/2019 03:26:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultorios](
	[IdConsultorio] [uniqueidentifier] NOT NULL,
	[Direccion] [varchar](255) NOT NULL,
	[Especializacion] [varchar](255) NOT NULL,
	[HoraEntrada] [time](7) NOT NULL,
	[HoraSalida] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdConsultorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Consultorio_Vespertino]    Script Date: 02/11/2019 03:26:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Consultorio_Vespertino] as
select Consultorios.HoraEntrada
FROM Consultorios
WHERE HoraEntrada < '9:00';

GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 02/11/2019 03:26:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicos](
	[IdMedico] [int] NOT NULL,
	[Especializacion] [varchar](255) NOT NULL,
	[NombreM] [varchar](255) NOT NULL,
	[PrimerApellidoM] [varchar](255) NOT NULL,
	[SegundoApellidoM] [varchar](255) NULL,
	[HoraEntrada] [time](7) NOT NULL,
	[HoraSalida] [time](7) NOT NULL,
	[Farmacia] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Medico_Salida]    Script Date: 02/11/2019 03:26:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Medico_Salida] as
select Medicos.HoraSalida
FROM Medicos
WHERE HoraSalida > '22:00';

GO
/****** Object:  View [dbo].[TerceraEdad]    Script Date: 02/11/2019 03:26:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[TerceraEdad] as
select Paciente.NombreCompleto, Paciente.Edad, Paciente.IdPaciente
FROM Paciente
WHERE Edad > 50;
GO
/****** Object:  UserDefinedFunction [dbo].[precio_Med]    Script Date: 02/11/2019 03:26:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[precio_Med](@x int)
returns table
	return select * from Farmacia
	where Precio > 200;
GO
/****** Object:  View [dbo].[pacientePrueba]    Script Date: 02/11/2019 03:26:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[pacientePrueba] as
SELECT Paciente.IdPaciente, Paciente.NombreCompleto, Paciente.Edad, Paciente.IdMedico
FROM Paciente
GO
/****** Object:  Table [dbo].[Consulta]    Script Date: 02/11/2019 03:26:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consulta](
	[IdConsulta] [tinyint] NOT NULL,
	[IdConsultorio] [uniqueidentifier] NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[NombreP] [varchar](255) NOT NULL,
	[ApPat] [varchar](255) NOT NULL,
	[ApMat] [varchar](255) NOT NULL,
	[NombreCompletoP]  AS (((([NombreP]+' ')+[ApPat])+' ')+[ApMat]),
	[IdMedico] [int] NOT NULL,
	[Medico] [varchar](255) NOT NULL,
	[IdProducto] [uniqueidentifier] NOT NULL,
	[Precio] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdConsulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PacientesBKUP]    Script Date: 02/11/2019 03:26:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PacientesBKUP](
	[IdPaciente] [int] NOT NULL,
	[NombreP] [varchar](255) NOT NULL,
	[PrimerApellidoP] [varchar](255) NOT NULL,
	[SegundoApellidoP] [varchar](255) NULL,
	[NombreCompleto] [varchar](767) NULL,
	[Edad] [int] NOT NULL,
	[IdMedico] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Consulta] ([IdConsulta], [IdConsultorio], [IdPaciente], [NombreP], [ApPat], [ApMat], [IdMedico], [Medico], [IdProducto], [Precio], [Fecha]) VALUES (1, N'cf5a2aa8-b73a-4c7b-9f90-768bbae14e09', 4, N'Miguel', N'Rosas', N'Mora', 30, N'Simon Corazon Feliz', N'af828ee9-2c64-46d4-be9f-37c6fe9cd35c', 240, CAST(N'2019-11-02T00:16:30.520' AS DateTime))
INSERT [dbo].[Consulta] ([IdConsulta], [IdConsultorio], [IdPaciente], [NombreP], [ApPat], [ApMat], [IdMedico], [Medico], [IdProducto], [Precio], [Fecha]) VALUES (2, N'2aded89d-ff12-4480-9466-399e336b1e7b', 18, N'Pedro', N'Infante', N'Infancia', 80, N'Stephen Vincent Strange', N'2b1a7303-f116-4eac-9dc1-52ca63643099', 350, CAST(N'2019-11-02T00:27:14.100' AS DateTime))
INSERT [dbo].[Consulta] ([IdConsulta], [IdConsultorio], [IdPaciente], [NombreP], [ApPat], [ApMat], [IdMedico], [Medico], [IdProducto], [Precio], [Fecha]) VALUES (3, N'37afe196-a50f-4cee-a999-63879b49cda9', 3, N'Aquiles', N'Bailo', N'Yogu', 10, N'Senku Einstein Penicilina', N'26b773f3-d69a-40b1-a7ee-577d120202ce', 45, CAST(N'2019-11-02T00:27:14.100' AS DateTime))
INSERT [dbo].[Consulta] ([IdConsulta], [IdConsultorio], [IdPaciente], [NombreP], [ApPat], [ApMat], [IdMedico], [Medico], [IdProducto], [Precio], [Fecha]) VALUES (4, N'3937232b-2e9a-4619-8476-6680be38c722', 19, N'Ivan', N'Ramirez', N'Salgon', 10, N'Senku Einstein Penicilina', N'f2a302c1-f14c-46f5-945f-672b28b213cf', 95, CAST(N'2019-11-02T00:27:14.100' AS DateTime))
INSERT [dbo].[Consulta] ([IdConsulta], [IdConsultorio], [IdPaciente], [NombreP], [ApPat], [ApMat], [IdMedico], [Medico], [IdProducto], [Precio], [Fecha]) VALUES (5, N'a72a9df2-71b7-47d1-a6c3-fba8e6a298b6', 13, N'Edgar', N'Lozano', N'Rocha', 30, N'Simon Corazon Feliz', N'ed15b487-aec3-4674-9829-7a72ddc7bdd9', 110, CAST(N'2019-11-02T00:27:14.100' AS DateTime))
INSERT [dbo].[Consultorios] ([IdConsultorio], [Direccion], [Especializacion], [HoraEntrada], [HoraSalida]) VALUES (N'2aded89d-ff12-4480-9466-399e336b1e7b', N'Av. Lazaro Cardenas 600', N'Neurologia', CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time))
INSERT [dbo].[Consultorios] ([IdConsultorio], [Direccion], [Especializacion], [HoraEntrada], [HoraSalida]) VALUES (N'15b158c4-48cd-48bd-a3da-4289ecf6d491', N'Av. Benito Juarez 202', N'Cirugia Plastica', CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time))
INSERT [dbo].[Consultorios] ([IdConsultorio], [Direccion], [Especializacion], [HoraEntrada], [HoraSalida]) VALUES (N'6b0403bf-6552-45d0-88aa-54824353b9ab', N'Av. Constitucion 321', N'Traumatologia', CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time))
INSERT [dbo].[Consultorios] ([IdConsultorio], [Direccion], [Especializacion], [HoraEntrada], [HoraSalida]) VALUES (N'5e7baaac-8aa1-404f-847f-5fde6bcb7a88', N'Calle San Nicolas 034', N'Pediatria', CAST(N'10:00:00' AS Time), CAST(N'20:00:00' AS Time))
INSERT [dbo].[Consultorios] ([IdConsultorio], [Direccion], [Especializacion], [HoraEntrada], [HoraSalida]) VALUES (N'37afe196-a50f-4cee-a999-63879b49cda9', N'Calle Niño Heroe 457', N'General', CAST(N'08:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[Consultorios] ([IdConsultorio], [Direccion], [Especializacion], [HoraEntrada], [HoraSalida]) VALUES (N'3937232b-2e9a-4619-8476-6680be38c722', N'Av. Los Campos 146', N'Geriatria', CAST(N'09:00:00' AS Time), CAST(N'19:00:00' AS Time))
INSERT [dbo].[Consultorios] ([IdConsultorio], [Direccion], [Especializacion], [HoraEntrada], [HoraSalida]) VALUES (N'1e2d6c42-7374-48bb-81c0-b1a4e504ac7e', N'Calle Independencia 589', N'Oftalmologia', CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Consultorios] ([IdConsultorio], [Direccion], [Especializacion], [HoraEntrada], [HoraSalida]) VALUES (N'7cc7965d-a167-49a9-860d-cfeb3fca17b7', N'Calle Bicentenario 890', N'Urologia', CAST(N'09:00:00' AS Time), CAST(N'20:00:00' AS Time))
INSERT [dbo].[Consultorios] ([IdConsultorio], [Direccion], [Especializacion], [HoraEntrada], [HoraSalida]) VALUES (N'a72a9df2-71b7-47d1-a6c3-fba8e6a298b6', N'Av. Buentello 102', N'Cardiologia', CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time))
INSERT [dbo].[Consultorios] ([IdConsultorio], [Direccion], [Especializacion], [HoraEntrada], [HoraSalida]) VALUES (N'8445d335-2084-4e04-a59e-ffef0b0f3ebb', N'Calle Revolucion 069', N'Ginecologia', CAST(N'10:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'e2df2445-8a77-48ac-ac1e-01eceb1e70b2', N'Norfloxacino', 100, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'a30a6a5d-af26-45d4-a3d5-0463856801a2', N'Citalopram Hidrobromuro', 170, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'0d346f4b-5ce2-47a3-bce7-052e3ee85eac', N'Ebastina', 40, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'd31e6f8b-4975-4e7e-ac2e-0d8a474082c3', N'Bisoprolol fumarato', 240, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'ef3de32d-1585-4af9-8e45-1dd0150bf952', N'Amitriptilina Hidrocloruro', 210, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'0c5fb2a7-3cd5-4c03-a69e-2165a5c0d58d', N'Diclofenaco', 30, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'e03c14cf-9c08-4ad8-bdbd-2977540edba9', N'Losartan', 160, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'768b16fc-effe-4dd7-bfc5-4e207ab89630', N'Bendroflumetiazida', 120, 0)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'40e702f1-b3d3-43db-9e84-4e764ce05c7e', N'Simvastatina', 150, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'2b1a7303-f116-4eac-9dc1-52ca63643099', N'Estradiol', 350, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'67d20e20-30bd-433f-b4a7-53abc0d7093e', N'Atorvastatina', 160, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'26b773f3-d69a-40b1-a7ee-577d120202ce', N'Azitromicina', 45, 0)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'0c99463a-7c07-4103-8034-5a414bc09de6', N'Hidrocloruro de metformina', 140, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'f2a302c1-f14c-46f5-945f-672b28b213cf', N'Colecalciferol', 95, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'e951dd86-984f-4326-895d-6d94a01ccbf4', N'Diazepam', 180, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'd80b25f0-f36c-440f-9525-724f19a8f7d9', N'Ramipril', 90, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'c70c80cf-01f2-4562-8803-776a3a0f65d0', N'Lexotiroxina sodica', 70, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'cce07751-7ecf-4e9a-9e82-78ac68448530', N'Paracetamol', 50, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'7f57dcf3-6e5a-4cb2-895e-79187aec0cb6', N'Ciproflocaxino', 90, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'ed15b487-aec3-4674-9829-7a72ddc7bdd9', N'Salbutamol', 110, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'3a6414c9-63b7-469a-88e7-7f5316866704', N'Nolotil', 115, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'e094c3b3-0557-47a6-9b4a-7ff463ae2bc0', N'Aspirina', 80, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'3d2c2b82-d00f-419e-86a4-82bc9ef3f20a', N'Gentamicina', 70, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'24398efd-2469-4999-8eac-82be0433655d', N'Co-codamol', 60, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'd6718667-fee9-42bb-b31f-82c9100c834d', N'Amoxicilina', 110, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'268a2768-ddcb-4b6d-bcc6-890fc7f4c28e', N'Enalapril', 150, 0)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'387215a2-9dc6-473d-ace8-93d81fa39c5d', N'Furosemida', 85, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'89a1e157-7ea0-4c70-8693-9ebef1b3ab9c', N'Etinilestradiol', 400, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'ff5ece46-8541-4a2b-84d3-a73c7a98ce56', N'Omeprazol', 60, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'19335aa8-159d-44e8-82ce-bb2310484dfa', N'Dogmatil', 220, 0)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'37d9607c-8772-4268-a2d4-c25be6ac80b5', N'Warfarina Sodica', 260, 0)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'7fdbe43b-bfff-448d-b63e-c3a64e311bdd', N'Lovastatina', 75, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'57e37221-48fc-476c-aa76-c5ba5e8e6554', N'Amlodipina', 130, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'd7efb695-0b2d-4843-982f-cbba33c94598', N'Atorvastatina', 115, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'd429db19-28bd-4e7a-a0f0-d858aea7b54b', N'Alprazolam', 130, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'9a324e0a-a23c-42d6-8cd2-da679121a435', N'Levenorgestrel', 250, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'3fc33f71-9e10-44b1-a156-e82521c0362d', N'Buscapina', 145, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'2c4757e5-a4db-47c0-9a61-eaadce743058', N'Lansoprazol', 50, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'45ddd75a-b318-456d-9f24-eb875af980ac', N'Simvastatina', 35, 1)
INSERT [dbo].[Farmacia] ([IdProducto], [NomMedicamento], [Precio], [Existencias]) VALUES (N'9afc1e8d-0d07-480c-baa4-f3c9c58394c0', N'Ranitidina', 45, 1)
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM], [HoraEntrada], [HoraSalida], [Farmacia]) VALUES (10, N'General', N'Senku', N'Einstein', N'Penicilina', CAST(N'09:00:00' AS Time), CAST(N'23:00:00' AS Time), N'no')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM], [HoraEntrada], [HoraSalida], [Farmacia]) VALUES (20, N'Geriatra', N'Ramon', N'Field', N'Solorio', CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), N'si')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM], [HoraEntrada], [HoraSalida], [Farmacia]) VALUES (30, N'Cardiologo', N'Simon', N'Corazon', N'Feliz', CAST(N'08:00:00' AS Time), CAST(N'19:00:00' AS Time), N'no')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM], [HoraEntrada], [HoraSalida], [Farmacia]) VALUES (40, N'Traumatologo', N'Alberto', N'Hueso', N'Cortez', CAST(N'10:00:00' AS Time), CAST(N'20:00:00' AS Time), N'si')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM], [HoraEntrada], [HoraSalida], [Farmacia]) VALUES (50, N'Pediatra', N'Ernesto', N'Ludwika', N'Paleta', CAST(N'09:00:00' AS Time), CAST(N'19:00:00' AS Time), N'si')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM], [HoraEntrada], [HoraSalida], [Farmacia]) VALUES (60, N'Oftalmologo', N'Ricardo', N'Ojo', N'Magallan', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), N'si')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM], [HoraEntrada], [HoraSalida], [Farmacia]) VALUES (70, N'Ginecologa', N'Maria', N'Gomez', N'Ferreti', CAST(N'09:00:00' AS Time), CAST(N'19:00:00' AS Time), N'no')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM], [HoraEntrada], [HoraSalida], [Farmacia]) VALUES (80, N'Neurologo', N'Stephen', N'Vincent', N'Strange', CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time), N'no')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM], [HoraEntrada], [HoraSalida], [Farmacia]) VALUES (90, N'Cirugia Plastica', N'Adrian', N'Cara', N'Dura', CAST(N'08:00:00' AS Time), CAST(N'23:00:00' AS Time), N'no')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM], [HoraEntrada], [HoraSalida], [Farmacia]) VALUES (100, N'Urologo', N'Juan', N'Escutia', N'Hernandez', CAST(N'10:00:00' AS Time), CAST(N'20:00:00' AS Time), N'no')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM], [HoraEntrada], [HoraSalida], [Farmacia]) VALUES (110, N'General', N'Eduardo', N'Panes', N'Miel', CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), N'si')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM], [HoraEntrada], [HoraSalida], [Farmacia]) VALUES (120, N'Geriatra', N'Javier', N'Viejo', N'Flores', CAST(N'11:00:00' AS Time), CAST(N'18:00:00' AS Time), N'no')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM], [HoraEntrada], [HoraSalida], [Farmacia]) VALUES (130, N'Cardiologo', N'Raul', N'Ferreti', N'Gonzalez', CAST(N'10:00:00' AS Time), CAST(N'19:00:00' AS Time), N'si')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM], [HoraEntrada], [HoraSalida], [Farmacia]) VALUES (140, N'Traumatologo', N'David', N'Huesos', N'Roto', CAST(N'10:00:00' AS Time), CAST(N'17:00:00' AS Time), N'no')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM], [HoraEntrada], [HoraSalida], [Farmacia]) VALUES (150, N'Pediatra', N'Enrique', N'Rana', N'Muppet', CAST(N'07:00:00' AS Time), CAST(N'20:00:00' AS Time), N'si')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM], [HoraEntrada], [HoraSalida], [Farmacia]) VALUES (160, N'Oftalmologo', N'Gerardo', N'Ojo', N'Bueno', CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), N'si')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM], [HoraEntrada], [HoraSalida], [Farmacia]) VALUES (170, N'Ginecologo', N'Rosa', N'Delgada', N'Rojas', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), N'no')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM], [HoraEntrada], [HoraSalida], [Farmacia]) VALUES (180, N'Neurologo', N'Greogrio', N'House', N'Cabeza', CAST(N'07:00:00' AS Time), CAST(N'22:00:00' AS Time), N'no')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM], [HoraEntrada], [HoraSalida], [Farmacia]) VALUES (190, N'Cirugia Plastica', N'Alfredo', N'Buen', N'Rostro', CAST(N'07:00:00' AS Time), CAST(N'20:00:00' AS Time), N'no')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM], [HoraEntrada], [HoraSalida], [Farmacia]) VALUES (200, N'Urologo', N'Luis', N'Torres', N'Hernandez', CAST(N'09:00:00' AS Time), CAST(N'19:00:00' AS Time), N'si')
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (1, N'Carlos', N'Buentello', N'Cruz', 20, 10)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (2, N'Joel', N'Sampayo', N'Climaco', 58, 20)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (3, N'Aquiles', N'Bailo', N'Yogu', 31, 10)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (4, N'Miguel', N'Rosas', N'Mora', 36, 30)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (5, N'Gignac', N'Lopez', N'Flores', 24, 40)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (6, N'Israel', N'Sobres', N'Mata', 19, 30)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (7, N'Juan', N'DeDios', N'Pantoja', 27, 60)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (8, N'Guillermo', N'Araujo', N'Sornisa', 23, 10)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (9, N'Silvestre', N'Calzon', N'Agujerado', 71, 20)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (10, N'Ana', N'Tomia', N'Rroz', 35, 70)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (11, N'Jesus', N'Leon', N'Mendez', 31, 10)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (12, N'Rodrigo', N'Thomas', N'Flores', 28, 30)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (13, N'Edgar', N'Lozano', N'Rocha', 47, 30)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (14, N'Abelardo', N'Rilla', N'Pluma', 39, 40)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (15, N'Anastacio', N'Base', N'Dato', 25, 10)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (16, N'Osvaldo', N'Disney', N'Campos', 45, 60)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (17, N'Miguel', N'Morgan', N'Cuadros', 51, 100)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (18, N'Pedro', N'Infante', N'Infancia', 30, 80)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (19, N'Ivan', N'Ramirez', N'Salgon', 19, 10)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (20, N'Hugo', N'Jackman', N'Boss', 42, 40)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (21, N'Jose Luis', N'Roble', N'Manzano', 23, 10)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (22, N'Francisco', N'Cortez', N'Juarez', 39, 60)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (23, N'Antonio', N'Ranger', N'Blanco', 24, 30)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (24, N'Pedro', N'Joras', N'Ramos', 46, 80)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (25, N'Alejandro', N'Ramirez', N'Perez', 29, 40)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (26, N'Manuel', N'Juarez', N'Frijol', 34, 30)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (27, N'Margarita', N'Smith', N'Rojas', 23, 70)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (28, N'Maria', N'Carmen', N'Puentes', 36, 90)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (29, N'Daniel', N'Garfield', N'Calles', 42, 40)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (30, N'Jorge', N'Tomas', N'Lonche', 26, 100)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (1, N'Carlos', N'Buentello', N'Cruz', N'Carlos Buentello Cruz', 20, 10)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (2, N'Joel', N'Sampayo', N'Climaco', N'Joel Sampayo Climaco', 58, 20)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (3, N'Aquiles', N'Bailo', N'Yogu', N'Aquiles Bailo Yogu', 31, 10)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (4, N'Miguel', N'Rosas', N'Mora', N'Miguel Rosas Mora', 36, 30)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (5, N'Gignac', N'Lopez', N'Flores', N'Gignac Lopez Flores', 24, 40)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (6, N'Israel', N'Sobres', N'Mata', N'Israel Sobres Mata', 19, 30)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (7, N'Juan', N'DeDios', N'Pantoja', N'Juan DeDios Pantoja', 27, 60)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (8, N'Guillermo', N'Araujo', N'Sornisa', N'Guillermo Araujo Sornisa', 23, 10)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (9, N'Silvestre', N'Calzon', N'Agujerado', N'Silvestre Calzon Agujerado', 71, 20)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (10, N'Ana', N'Tomia', N'Rroz', N'Ana Tomia Rroz', 35, 70)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (11, N'Jesus', N'Leon', N'Mendez', N'Jesus Leon Mendez', 31, 10)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (12, N'Rodrigo', N'Thomas', N'Flores', N'Rodrigo Thomas Flores', 28, 30)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (13, N'Edgar', N'Lozano', N'Rocha', N'Edgar Lozano Rocha', 47, 30)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (14, N'Abelardo', N'Rilla', N'Pluma', N'Abelardo Rilla Pluma', 39, 40)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (15, N'Anastacio', N'Base', N'Dato', N'Anastacio Base Dato', 25, 10)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (16, N'Osvaldo', N'Disney', N'Campos', N'Osvaldo Disney Campos', 45, 60)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (17, N'Miguel', N'Morgan', N'Cuadros', N'Miguel Morgan Cuadros', 51, 100)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (18, N'Pedro', N'Infante', N'Infancia', N'Pedro Infante Infancia', 30, 80)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (19, N'Ivan', N'Ramirez', N'Salgon', N'Ivan Ramirez Salgon', 19, 10)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (20, N'Hugo', N'Jackman', N'Boss', N'Hugo Jackman Boss', 42, 40)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (21, N'Jose Luis', N'Roble', N'Manzano', N'Jose Luis Roble Manzano', 23, 10)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (22, N'Francisco', N'Cortez', N'Juarez', N'Francisco Cortez Juarez', 39, 60)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (23, N'Antonio', N'Ranger', N'Blanco', N'Antonio Ranger Blanco', 24, 30)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (24, N'Pedro', N'Joras', N'Ramos', N'Pedro Joras Ramos', 46, 80)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (25, N'Alejandro', N'Ramirez', N'Perez', N'Alejandro Ramirez Perez', 29, 40)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (26, N'Manuel', N'Juarez', N'Frijol', N'Manuel Juarez Frijol', 34, 30)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (27, N'Margarita', N'Smith', N'Rojas', N'Margarita Smith Rojas', 23, 70)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (28, N'Maria', N'Carmen', N'Puentes', N'Maria Carmen Puentes', 36, 90)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (29, N'Daniel', N'Garfield', N'Calles', N'Daniel Garfield Calles', 42, 40)
INSERT [dbo].[PacientesBKUP] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [NombreCompleto], [Edad], [IdMedico]) VALUES (30, N'Jorge', N'Tomas', N'Lonche', N'Jorge Tomas Lonche', 26, 100)
ALTER TABLE [dbo].[Consultorios] ADD  DEFAULT (newid()) FOR [IdConsultorio]
GO
ALTER TABLE [dbo].[Farmacia] ADD  DEFAULT (newid()) FOR [IdProducto]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [Foreign_IdMedPaciente] FOREIGN KEY([IdMedico])
REFERENCES [dbo].[Medicos] ([IdMedico])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [Foreign_IdMedPaciente]
GO
/****** Object:  StoredProcedure [dbo].[Anciano]    Script Date: 02/11/2019 03:26:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Anciano]
as
SELECT * FROM TerceraEdad
WHERE Edad>70;

GO
/****** Object:  StoredProcedure [dbo].[Med_Temprano]    Script Date: 02/11/2019 03:26:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Med_Temprano]
as
SELECT * FROM Consultorio_Vespertino
WHERE HoraEntrada='7:00';

GO
/****** Object:  StoredProcedure [dbo].[Medicina_reorden]    Script Date: 02/11/2019 03:26:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Medicina_reorden]
as
SELECT * FROM Medicina_Faltante
WHERE Existencias<3;

GO
/****** Object:  StoredProcedure [dbo].[Medicos_Noct]    Script Date: 02/11/2019 03:26:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Medicos_Noct]
as
SELECT * FROM Medico_Salida
WHERE HoraSalida>'21:00';

GO
/****** Object:  StoredProcedure [dbo].[sobresobrepedido]    Script Date: 02/11/2019 03:26:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sobresobrepedido]
as
SELECT * FROM Medicina_sobrepedido
WHERE Existencias>40;
GO
/****** Object:  Trigger [dbo].[PacientePru]    Script Date: 02/11/2019 03:26:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[PacientePru] ON [dbo].[Paciente]
AFTER
insert as
SELECT * FROM Inserted;
GO
ALTER TABLE [dbo].[Paciente] ENABLE TRIGGER [PacientePru]
GO
USE [master]
GO
ALTER DATABASE [Consultorio3] SET  READ_WRITE 
GO
