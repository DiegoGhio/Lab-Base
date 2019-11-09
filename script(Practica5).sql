USE [Consultorio7]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__Farmacia__IdProd__1920BF5C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Farmacia] DROP CONSTRAINT [DF__Farmacia__IdProd__1920BF5C]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__Consultor__IdCon__145C0A3F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Consultorios] DROP CONSTRAINT [DF__Consultor__IdCon__145C0A3F]
END

GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 12/10/2019 02:03:27 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paciente]') AND type in (N'U'))
DROP TABLE [dbo].[Paciente]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 12/10/2019 02:03:27 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Medicos]') AND type in (N'U'))
DROP TABLE [dbo].[Medicos]
GO
/****** Object:  Table [dbo].[Farmacia]    Script Date: 12/10/2019 02:03:27 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Farmacia]') AND type in (N'U'))
DROP TABLE [dbo].[Farmacia]
GO
/****** Object:  Table [dbo].[Consultorios]    Script Date: 12/10/2019 02:03:27 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consultorios]') AND type in (N'U'))
DROP TABLE [dbo].[Consultorios]
GO
/****** Object:  Table [dbo].[Consulta]    Script Date: 12/10/2019 02:03:27 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consulta]') AND type in (N'U'))
DROP TABLE [dbo].[Consulta]
GO
/****** Object:  Table [dbo].[Consulta]    Script Date: 12/10/2019 02:03:27 p.m. ******/
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
	[IdProducto] [uniqueidentifier] NOT NULL,
	[Precio] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Consultorios]    Script Date: 12/10/2019 02:03:27 p.m. ******/
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
	[Direccion] [varchar](255) NOT NULL,
	[Especializacion] [varchar](255) NOT NULL,
	[HoraApertura] [time](7) NOT NULL,
	[HoraCierre] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdConsultorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Farmacia]    Script Date: 12/10/2019 02:03:27 p.m. ******/
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
/****** Object:  Table [dbo].[Medicos]    Script Date: 12/10/2019 02:03:27 p.m. ******/
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
	[Especializacion] [varchar](255) NOT NULL,
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
/****** Object:  Table [dbo].[Paciente]    Script Date: 12/10/2019 02:03:27 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Consultorios] ([IdConsultorio], [Direccion], [Especializacion], [HoraApertura], [HoraCierre]) VALUES (N'390d7058-8421-4dfb-b79d-0362202f914c', N'Calle San Nicolas 034', N'Pediatria', CAST(0x070010ACD1530000 AS Time), CAST(0x07002058A3A70000 AS Time))
INSERT [dbo].[Consultorios] ([IdConsultorio], [Direccion], [Especializacion], [HoraApertura], [HoraCierre]) VALUES (N'5852cdd9-7b9c-4ab0-bad6-6ddf971d4508', N'Av. Benito Juarez 202', N'Cirugia Plastica', CAST(0x070040230E430000 AS Time), CAST(0x0700F0E066B80000 AS Time))
INSERT [dbo].[Consultorios] ([IdConsultorio], [Direccion], [Especializacion], [HoraApertura], [HoraCierre]) VALUES (N'7d30ed64-a51c-45c8-a740-77709345846f', N'Av. Buentello 102', N'Cardiologia', CAST(0x070040230E430000 AS Time), CAST(0x0700F0E066B80000 AS Time))
INSERT [dbo].[Consultorios] ([IdConsultorio], [Direccion], [Especializacion], [HoraApertura], [HoraCierre]) VALUES (N'a93285fb-6bab-4ffc-a4c9-904014c1b43e', N'Calle Independencia 589', N'Oftalmologia', CAST(0x070010ACD1530000 AS Time), CAST(0x070050CFDF960000 AS Time))
INSERT [dbo].[Consultorios] ([IdConsultorio], [Direccion], [Especializacion], [HoraApertura], [HoraCierre]) VALUES (N'304d5921-fa87-4d0f-a5c4-9b3e6d70023b', N'Av. Constitucion 321', N'Traumatologia', CAST(0x0700D85EAC3A0000 AS Time), CAST(0x070058A5C8C00000 AS Time))
INSERT [dbo].[Consultorios] ([IdConsultorio], [Direccion], [Especializacion], [HoraApertura], [HoraCierre]) VALUES (N'f57c14f3-258e-4e1e-a89d-b288ae407dd9', N'Av. Los Campos 146', N'Geriatria', CAST(0x0700A8E76F4B0000 AS Time), CAST(0x0700B893419F0000 AS Time))
INSERT [dbo].[Consultorios] ([IdConsultorio], [Direccion], [Especializacion], [HoraApertura], [HoraCierre]) VALUES (N'40b0bce8-c1ee-42f6-bb46-b5d877973100', N'Calle Bicentenario 890', N'Urologia', CAST(0x0700A8E76F4B0000 AS Time), CAST(0x07002058A3A70000 AS Time))
INSERT [dbo].[Consultorios] ([IdConsultorio], [Direccion], [Especializacion], [HoraApertura], [HoraCierre]) VALUES (N'4f9c8eb0-dcdb-4806-8b2e-cfb9c3c8d5f4', N'Av. Lazaro Cardenas 600', N'Neurologia', CAST(0x0700D85EAC3A0000 AS Time), CAST(0x070058A5C8C00000 AS Time))
INSERT [dbo].[Consultorios] ([IdConsultorio], [Direccion], [Especializacion], [HoraApertura], [HoraCierre]) VALUES (N'8b64ae21-7d70-4468-aad6-d6d03b6f562c', N'Calle Revolucion 069', N'Ginecologia', CAST(0x070010ACD1530000 AS Time), CAST(0x0700881C05B00000 AS Time))
INSERT [dbo].[Consultorios] ([IdConsultorio], [Direccion], [Especializacion], [HoraApertura], [HoraCierre]) VALUES (N'67051b7b-fc43-43f1-ba2a-f5828a882e11', N'Calle Niño Heroe 457', N'General', CAST(0x070040230E430000 AS Time), CAST(0x0700881C05B00000 AS Time))
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM]) VALUES (10, N'General', N'Senku', N'Einstein', N'Penicilina')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM]) VALUES (20, N'Geriatra', N'Ramon', N'Field', N'Solorio')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM]) VALUES (30, N'Cardiologo', N'Simon', N'Corazon', N'Feliz')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM]) VALUES (40, N'Traumatologo', N'Alberto', N'Hueso', N'Cortez')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM]) VALUES (50, N'Pediatra', N'Ernesto', N'Ludwika', N'Paleta')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM]) VALUES (60, N'Oftalmologo', N'Ricardo', N'Ojo', N'Magallan')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM]) VALUES (70, N'Ginecologa', N'Maria', N'Gomez', N'Ferreti')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM]) VALUES (80, N'Neurologo', N'Stephen', N'Vincent', N'Strange')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM]) VALUES (90, N'Cirugia Plastica', N'Adrian', N'Cara', N'Dura')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM]) VALUES (100, N'Urologo', N'Juan', N'Escutia', N'Hernandez')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM]) VALUES (110, N'General', N'Eduardo', N'Panes', N'Miel')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM]) VALUES (120, N'Geriatra', N'Javier', N'Viejo', N'Flores')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM]) VALUES (130, N'Cardiologo', N'Raul', N'Ferreti', N'Gonzalez')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM]) VALUES (140, N'Traumatologo', N'David', N'Huesos', N'Roto')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM]) VALUES (150, N'Pediatra', N'Enrique', N'Rana', N'Muppet')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM]) VALUES (160, N'Oftalmologo', N'Gerardo', N'Ojo', N'Bueno')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM]) VALUES (170, N'Ginecologo', N'Rosa', N'Delgada', N'Rojas')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM]) VALUES (180, N'Neurologo', N'Greogrio', N'House', N'Cabeza')
INSERT [dbo].[Medicos] ([IdMedico], [Especializacion], [NombreM], [PrimerApellidoM], [SegundoApellidoM]) VALUES (190, N'Cirugia Plastica', N'Alfredo', N'Buen', N'Rostro')
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (1, N'Carlos', N'Buentello', N'Cruz', 20, 110)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (2, N'Joel', N'Sampayo', N'Climaco', 58, 120)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (3, N'Aquiles', N'Bailo', N'Yogu', 31, 110)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (4, N'Miguel', N'Rosas', N'Mora', 36, 130)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (5, N'Gignac', N'Lopez', N'Flores', 24, 140)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (6, N'Israel', N'Sobres', N'Mata', 19, 130)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (7, N'Juan', N'DeDios', N'Pantoja', 27, 60)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (8, N'Guillermo', N'Araujo', N'Sornisa', 23, 110)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (10, N'Ana', N'Tomia', N'Rroz', 35, 70)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (11, N'Jesus', N'Leon', N'Mendez', 31, 110)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (12, N'Rodrigo', N'Thomas', N'Flores', 28, 130)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (13, N'Edgar', N'Lozano', N'Rocha', 47, 130)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (14, N'Abelardo', N'Rilla', N'Pluma', 39, 140)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (15, N'Anastacio', N'Base', N'Dato', 25, 110)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (16, N'Osvaldo', N'Disney', N'Campos', 45, 60)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (17, N'Miguel', N'Morgan', N'Cuadros', 51, 100)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (18, N'Pedro', N'Infante', N'Infancia', 30, 80)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (19, N'Ivan', N'Ramirez', N'Salgon', 19, 110)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (20, N'Hugo', N'Jackman', N'Boss', 42, 140)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (21, N'Jose Luis', N'Roble', N'Manzano', 23, 110)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (22, N'Francisco', N'Cortez', N'Juarez', 39, 60)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (23, N'Antonio', N'Ranger', N'Blanco', 24, 130)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (24, N'Pedro', N'Joras', N'Ramos', 46, 80)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (25, N'Alejandro', N'Ramirez', N'Perez', 29, 140)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (26, N'Manuel', N'Juarez', N'Frijol', 34, 130)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (27, N'Margarita', N'Smith', N'Rojas', 23, 70)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (28, N'Maria', N'Carmen', N'Puentes', 36, 90)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (29, N'Daniel', N'Garfield', N'Calles', 42, 140)
INSERT [dbo].[Paciente] ([IdPaciente], [NombreP], [PrimerApellidoP], [SegundoApellidoP], [Edad], [IdMedico]) VALUES (30, N'Jorge', N'Tomas', N'Lonche', 26, 100)
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__Consultor__IdCon__145C0A3F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Consultorios] ADD  DEFAULT (newid()) FOR [IdConsultorio]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__Farmacia__IdProd__1920BF5C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Farmacia] ADD  DEFAULT (newid()) FOR [IdProducto]
END

GO
