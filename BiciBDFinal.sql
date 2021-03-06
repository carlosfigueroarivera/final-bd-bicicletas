USE [master]
GO
/****** Object:  Database [biciDb]    Script Date: 27/11/2021 3:29:55 p. m. 
******/
/**
Base de datos de Tienda de bicicletas creada por
***Carlos Figueroa - 19-miin-1-082
**/
CREATE DATABASE [biciDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'biciDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SCL2019CORE\MSSQL\DATA\biciDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'biciDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SCL2019CORE\MSSQL\DATA\biciDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [biciDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [biciDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [biciDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [biciDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [biciDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [biciDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [biciDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [biciDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [biciDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [biciDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [biciDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [biciDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [biciDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [biciDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [biciDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [biciDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [biciDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [biciDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [biciDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [biciDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [biciDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [biciDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [biciDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [biciDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [biciDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [biciDb] SET  MULTI_USER 
GO
ALTER DATABASE [biciDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [biciDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [biciDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [biciDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [biciDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [biciDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [biciDb] SET QUERY_STORE = OFF
GO
USE [biciDb]
GO
/****** Object:  Table [dbo].[clientes_fijos]    Script Date: 27/11/2021 3:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes_fijos](
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[cedula] [nvarchar](50) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_clientes_fijos_a] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 27/11/2021 3:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[cedula] [nvarchar](50) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[salario] [money] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_empleado] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marcas]    Script Date: 27/11/2021 3:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marcas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[pais] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_marcas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 1, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materiales]    Script Date: 27/11/2021 3:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materiales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [ntext] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modelos]    Script Date: 27/11/2021 3:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modelos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[peso_lbs] [decimal](18, 0) NOT NULL,
	[material_fk] [int] NOT NULL,
	[tipo_transmision_fk] [int] NOT NULL,
	[cambios] [numeric](18, 0) NOT NULL,
	[marca_fk] [int] NOT NULL,
 CONSTRAINT [PK_modelos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_transmision]    Script Date: 27/11/2021 3:29:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_transmision](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](max) NULL,
 CONSTRAINT [PK_tipos_transmision] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[clientes_fijos] ON 

INSERT [dbo].[clientes_fijos] ([nombre], [apellido], [cedula], [fecha_nacimiento], [id]) VALUES (N'Fulano', N'De tal', N'00198678756', CAST(N'2001-01-01' AS Date), 13)
INSERT [dbo].[clientes_fijos] ([nombre], [apellido], [cedula], [fecha_nacimiento], [id]) VALUES (N'Andres', N'figueroa', N'40200450934', CAST(N'1992-03-06' AS Date), 16)
INSERT [dbo].[clientes_fijos] ([nombre], [apellido], [cedula], [fecha_nacimiento], [id]) VALUES (N'vianess', N'castillo', N'00198678756', CAST(N'2001-01-01' AS Date), 1012)
INSERT [dbo].[clientes_fijos] ([nombre], [apellido], [cedula], [fecha_nacimiento], [id]) VALUES (N'Andres', N'figueroa', N'40200450934', CAST(N'1992-03-06' AS Date), 1013)
INSERT [dbo].[clientes_fijos] ([nombre], [apellido], [cedula], [fecha_nacimiento], [id]) VALUES (N'erikc', N'zoto', N'80200973462', CAST(N'1990-04-09' AS Date), 1014)
INSERT [dbo].[clientes_fijos] ([nombre], [apellido], [cedula], [fecha_nacimiento], [id]) VALUES (N'manuel', N'diaz', N'40200431234', CAST(N'1982-03-04' AS Date), 1015)
INSERT [dbo].[clientes_fijos] ([nombre], [apellido], [cedula], [fecha_nacimiento], [id]) VALUES (N'starling', N'dias', N'6782345431', CAST(N'1999-03-08' AS Date), 1016)
INSERT [dbo].[clientes_fijos] ([nombre], [apellido], [cedula], [fecha_nacimiento], [id]) VALUES (N'viandi', N'catillo', N'40200934565', CAST(N'1970-12-09' AS Date), 1017)
INSERT [dbo].[clientes_fijos] ([nombre], [apellido], [cedula], [fecha_nacimiento], [id]) VALUES (N'gregorio', N'familia', N'34578934573', CAST(N'2001-11-06' AS Date), 1018)
INSERT [dbo].[clientes_fijos] ([nombre], [apellido], [cedula], [fecha_nacimiento], [id]) VALUES (N'teofilo', N'figueroa', N'84756934567', CAST(N'2011-01-01' AS Date), 1019)
INSERT [dbo].[clientes_fijos] ([nombre], [apellido], [cedula], [fecha_nacimiento], [id]) VALUES (N'margarita', N'trinida', N'20345667345', CAST(N'1960-09-02' AS Date), 1020)
INSERT [dbo].[clientes_fijos] ([nombre], [apellido], [cedula], [fecha_nacimiento], [id]) VALUES (N'eddiel', N'meran', N'20345634723', CAST(N'2015-11-02' AS Date), 1021)
SET IDENTITY_INSERT [dbo].[clientes_fijos] OFF
GO
SET IDENTITY_INSERT [dbo].[empleado] ON 

INSERT [dbo].[empleado] ([nombre], [apellido], [cedula], [fecha_nacimiento], [salario], [id]) VALUES (N'Fulano', N'De tal', N'00198678756', CAST(N'2001-01-01' AS Date), 39990.0000, 1)
INSERT [dbo].[empleado] ([nombre], [apellido], [cedula], [fecha_nacimiento], [salario], [id]) VALUES (N'anthoni', N'martinez', N'00198678756', CAST(N'2001-01-01' AS Date), 39990.0000, 2)
INSERT [dbo].[empleado] ([nombre], [apellido], [cedula], [fecha_nacimiento], [salario], [id]) VALUES (N'martin', N'hernandez', N'002092345', CAST(N'2000-12-04' AS Date), 20000.9500, 3)
INSERT [dbo].[empleado] ([nombre], [apellido], [cedula], [fecha_nacimiento], [salario], [id]) VALUES (N'missael', N'ramirez', N'20343567243', CAST(N'1990-01-09' AS Date), 19000.8300, 4)
INSERT [dbo].[empleado] ([nombre], [apellido], [cedula], [fecha_nacimiento], [salario], [id]) VALUES (N'maria', N'trinad', N'00234524361', CAST(N'1988-08-05' AS Date), 30000.3400, 5)
INSERT [dbo].[empleado] ([nombre], [apellido], [cedula], [fecha_nacimiento], [salario], [id]) VALUES (N'miguelina', N'tarnia', N'00276152431', CAST(N'2016-09-03' AS Date), 15000.1200, 6)
INSERT [dbo].[empleado] ([nombre], [apellido], [cedula], [fecha_nacimiento], [salario], [id]) VALUES (N'jordi', N'antonio', N'30456241273', CAST(N'1993-09-02' AS Date), 38000.0400, 7)
INSERT [dbo].[empleado] ([nombre], [apellido], [cedula], [fecha_nacimiento], [salario], [id]) VALUES (N' alex', N'meza', N'10923647342', CAST(N'1990-09-02' AS Date), 57900.0400, 8)
INSERT [dbo].[empleado] ([nombre], [apellido], [cedula], [fecha_nacimiento], [salario], [id]) VALUES (N'esdras', N'meza', N'102834632523', CAST(N'1992-12-02' AS Date), 10000.9000, 9)
INSERT [dbo].[empleado] ([nombre], [apellido], [cedula], [fecha_nacimiento], [salario], [id]) VALUES (N'diomaris', N'flores', N'98356372532', CAST(N'1985-03-04' AS Date), 90000.0000, 10)
INSERT [dbo].[empleado] ([nombre], [apellido], [cedula], [fecha_nacimiento], [salario], [id]) VALUES (N' ramon', N'santos', N'23526173523', CAST(N'1990-04-05' AS Date), 45000.2300, 11)
SET IDENTITY_INSERT [dbo].[empleado] OFF
GO
SET IDENTITY_INSERT [dbo].[marcas] ON 

INSERT [dbo].[marcas] ([id], [nombre], [pais]) VALUES (2, N'specialized', N'europa')
INSERT [dbo].[marcas] ([id], [nombre], [pais]) VALUES (3, N'scott', N'europa')
INSERT [dbo].[marcas] ([id], [nombre], [pais]) VALUES (4, N'chinao', N'china')
INSERT [dbo].[marcas] ([id], [nombre], [pais]) VALUES (5, N'giant', N'europa')
INSERT [dbo].[marcas] ([id], [nombre], [pais]) VALUES (6, N'bianchi', N' estados_unidos')
INSERT [dbo].[marcas] ([id], [nombre], [pais]) VALUES (7, N'bmc', N' estados_unidos')
INSERT [dbo].[marcas] ([id], [nombre], [pais]) VALUES (8, N'orbea', N'estados_unidos')
INSERT [dbo].[marcas] ([id], [nombre], [pais]) VALUES (9, N'canondale', N'estados_unidos')
INSERT [dbo].[marcas] ([id], [nombre], [pais]) VALUES (10, N'canyon', N'estados_unidas')
INSERT [dbo].[marcas] ([id], [nombre], [pais]) VALUES (11, N'darlint', N'italia')
INSERT [dbo].[marcas] ([id], [nombre], [pais]) VALUES (12, N'trek', N'estados unidos')
SET IDENTITY_INSERT [dbo].[marcas] OFF
GO
SET IDENTITY_INSERT [dbo].[materiales] ON 

INSERT [dbo].[materiales] ([id], [nombre], [descripcion]) VALUES (1, N'fibra de carbono', N'Material liviano. Buena resistencia al calor')
INSERT [dbo].[materiales] ([id], [nombre], [descripcion]) VALUES (2, N'hierro', N'Material pesado. Poca resistencia al agua o al sol')
INSERT [dbo].[materiales] ([id], [nombre], [descripcion]) VALUES (3, N'aluminio', N' Material liviano, no tanto como fibra de carbono. Poca resistencia al calor')
INSERT [dbo].[materiales] ([id], [nombre], [descripcion]) VALUES (4, N'fibra de carbono', N'Material liviano. Buena resistencia al calor, frio y agua')
INSERT [dbo].[materiales] ([id], [nombre], [descripcion]) VALUES (5, N'hierro', N'Material pesado. Poca resistencia al agua o al sol.')
INSERT [dbo].[materiales] ([id], [nombre], [descripcion]) VALUES (6, N'aluminio', N' Material semi liviano. Poca resisstencia al calor')
INSERT [dbo].[materiales] ([id], [nombre], [descripcion]) VALUES (7, N'acero', N'Muy pesado. Resistente al agua y altas temperaturas. Poco corrosivo')
INSERT [dbo].[materiales] ([id], [nombre], [descripcion]) VALUES (8, N'titanio', N'Semi liviano. Poco corrosivo')
INSERT [dbo].[materiales] ([id], [nombre], [descripcion]) VALUES (9, N'Aluminio con carbono', N'Liviano. Poco corrosivo')
INSERT [dbo].[materiales] ([id], [nombre], [descripcion]) VALUES (10, N'doble_plato', N'el_mas_usado_es_el_2*10')
SET IDENTITY_INSERT [dbo].[materiales] OFF
GO
SET IDENTITY_INSERT [dbo].[modelos] ON 

INSERT [dbo].[modelos] ([id], [nombre], [peso_lbs], [material_fk], [tipo_transmision_fk], [cambios], [marca_fk]) VALUES (1, N'marlin10', CAST(10 AS Decimal(18, 0)), 3, 3, CAST(10 AS Numeric(18, 0)), 12)
INSERT [dbo].[modelos] ([id], [nombre], [peso_lbs], [material_fk], [tipo_transmision_fk], [cambios], [marca_fk]) VALUES (5, N'spark rc', CAST(23 AS Decimal(18, 0)), 9, 2, CAST(13 AS Numeric(18, 0)), 3)
INSERT [dbo].[modelos] ([id], [nombre], [peso_lbs], [material_fk], [tipo_transmision_fk], [cambios], [marca_fk]) VALUES (6, N'tarmac disc sl6 2020', CAST(12 AS Decimal(18, 0)), 9, 2, CAST(12 AS Numeric(18, 0)), 2)
INSERT [dbo].[modelos] ([id], [nombre], [peso_lbs], [material_fk], [tipo_transmision_fk], [cambios], [marca_fk]) VALUES (7, N'trance x advanced', CAST(25 AS Decimal(18, 0)), 8, 4, CAST(8 AS Numeric(18, 0)), 5)
INSERT [dbo].[modelos] ([id], [nombre], [peso_lbs], [material_fk], [tipo_transmision_fk], [cambios], [marca_fk]) VALUES (8, N'beijing', CAST(30 AS Decimal(18, 0)), 5, 5, CAST(7 AS Numeric(18, 0)), 4)
INSERT [dbo].[modelos] ([id], [nombre], [peso_lbs], [material_fk], [tipo_transmision_fk], [cambios], [marca_fk]) VALUES (9, N'urs lt', CAST(12 AS Decimal(18, 0)), 4, 4, CAST(13 AS Numeric(18, 0)), 7)
INSERT [dbo].[modelos] ([id], [nombre], [peso_lbs], [material_fk], [tipo_transmision_fk], [cambios], [marca_fk]) VALUES (11, N'cross country', CAST(20 AS Decimal(18, 0)), 10, 1, CAST(12 AS Numeric(18, 0)), 12)
INSERT [dbo].[modelos] ([id], [nombre], [peso_lbs], [material_fk], [tipo_transmision_fk], [cambios], [marca_fk]) VALUES (12, N'trail', CAST(14 AS Decimal(18, 0)), 2, 8, CAST(10 AS Numeric(18, 0)), 12)
INSERT [dbo].[modelos] ([id], [nombre], [peso_lbs], [material_fk], [tipo_transmision_fk], [cambios], [marca_fk]) VALUES (13, N'fat bikes', CAST(20 AS Decimal(18, 0)), 3, 3, CAST(11 AS Numeric(18, 0)), 12)
INSERT [dbo].[modelos] ([id], [nombre], [peso_lbs], [material_fk], [tipo_transmision_fk], [cambios], [marca_fk]) VALUES (14, N'Marlin 5', CAST(15 AS Decimal(18, 0)), 1, 1, CAST(9 AS Numeric(18, 0)), 12)
SET IDENTITY_INSERT [dbo].[modelos] OFF
GO
SET IDENTITY_INSERT [dbo].[tipos_transmision] ON 

INSERT [dbo].[tipos_transmision] ([id], [nombre], [descripcion]) VALUES (1, N'triple_platos', N'este_es_el_mas_basico_es_de_3*9_y_casete_de_11/34')
INSERT [dbo].[tipos_transmision] ([id], [nombre], [descripcion]) VALUES (2, N'monoplato', N'este_es_de_1*11_y_1*12')
INSERT [dbo].[tipos_transmision] ([id], [nombre], [descripcion]) VALUES (3, N'rohloff', N'este_es_el_mas_conocid_cuenta_con_4_marchas_y_un_cambio_suave_entre_ellas')
INSERT [dbo].[tipos_transmision] ([id], [nombre], [descripcion]) VALUES (4, N'escalar', N'centa_con_4_cambios_livianos_y_10_pesados')
INSERT [dbo].[tipos_transmision] ([id], [nombre], [descripcion]) VALUES (5, N'continer', N'todos_sus_cambios_son_pesados')
INSERT [dbo].[tipos_transmision] ([id], [nombre], [descripcion]) VALUES (6, N'spreent', N'este_es_de_2*6_con_un_cambio_liviano')
INSERT [dbo].[tipos_transmision] ([id], [nombre], [descripcion]) VALUES (7, N'cornial', N'este_ya_esta_descontinuado')
INSERT [dbo].[tipos_transmision] ([id], [nombre], [descripcion]) VALUES (8, N'carolina', N'est_es_de_3*8')
INSERT [dbo].[tipos_transmision] ([id], [nombre], [descripcion]) VALUES (9, N'triple_accion', N'este_es_de_3*3')
INSERT [dbo].[tipos_transmision] ([id], [nombre], [descripcion]) VALUES (10, N'marlindyt', N'para monta??a. tiene un plato y cuatro en el casete')
SET IDENTITY_INSERT [dbo].[tipos_transmision] OFF
GO
/****** Object:  Index [IX_material]    Script Date: 27/11/2021 3:29:56 p. m. ******/
ALTER TABLE [dbo].[materiales] ADD  CONSTRAINT [IX_material] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[modelos]  WITH CHECK ADD  CONSTRAINT [FK_modelos_marcas] FOREIGN KEY([marca_fk])
REFERENCES [dbo].[marcas] ([id])
GO
ALTER TABLE [dbo].[modelos] CHECK CONSTRAINT [FK_modelos_marcas]
GO
ALTER TABLE [dbo].[modelos]  WITH CHECK ADD  CONSTRAINT [FK_modelos_materiales] FOREIGN KEY([material_fk])
REFERENCES [dbo].[materiales] ([id])
GO
ALTER TABLE [dbo].[modelos] CHECK CONSTRAINT [FK_modelos_materiales]
GO
ALTER TABLE [dbo].[modelos]  WITH CHECK ADD  CONSTRAINT [FK_modelos_tipo_transmision] FOREIGN KEY([tipo_transmision_fk])
REFERENCES [dbo].[tipos_transmision] ([id])
GO
ALTER TABLE [dbo].[modelos] CHECK CONSTRAINT [FK_modelos_tipo_transmision]
GO
USE [master]
GO
ALTER DATABASE [biciDb] SET  READ_WRITE 
GO
