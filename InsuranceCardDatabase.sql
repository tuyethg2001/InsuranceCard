USE [master]
GO
/****** Object:  Database [InsuranceCard]    Script Date: 3/22/2022 01:03:35 ******/
CREATE DATABASE [InsuranceCard]
GO
ALTER DATABASE [InsuranceCard] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InsuranceCard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InsuranceCard] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InsuranceCard] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InsuranceCard] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InsuranceCard] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InsuranceCard] SET ARITHABORT OFF 
GO
ALTER DATABASE [InsuranceCard] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InsuranceCard] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InsuranceCard] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InsuranceCard] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InsuranceCard] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InsuranceCard] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InsuranceCard] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InsuranceCard] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InsuranceCard] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InsuranceCard] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InsuranceCard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InsuranceCard] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InsuranceCard] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InsuranceCard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InsuranceCard] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InsuranceCard] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InsuranceCard] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InsuranceCard] SET RECOVERY FULL 
GO
ALTER DATABASE [InsuranceCard] SET  MULTI_USER 
GO
ALTER DATABASE [InsuranceCard] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InsuranceCard] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InsuranceCard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InsuranceCard] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InsuranceCard] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InsuranceCard] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'InsuranceCard', N'ON'
GO
ALTER DATABASE [InsuranceCard] SET QUERY_STORE = OFF
GO
USE [InsuranceCard]
GO
/****** Object:  Table [dbo].[Accident]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accident](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccidentDate] [datetime] NULL,
	[Title] [nvarchar](600) NULL,
	[CreatedDate] [datetime] NULL,
	[Attachment] [nvarchar](300) NULL,
	[HumanDamage] [ntext] NULL,
	[VehicleDamage] [ntext] NULL,
	[ContractID] [int] NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Accident] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](300) NULL,
	[Password] [nvarchar](256) NULL,
	[Role] [bit] NULL,
	[Status] [smallint] NULL,
	[isDelete] [bit] NULL,
	[GoogleID] [varchar](100) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountStatusCode]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountStatusCode](
	[StatusCode] [smallint] NOT NULL,
	[StatusName] [nvarchar](50) NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_AccountStatusCode] PRIMARY KEY CLUSTERED 
(
	[StatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Brand] [nvarchar](800) NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compensation]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compensation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DriverName] [nvarchar](600) NULL,
	[CreatedDate] [datetime] NULL,
	[ResolveDate] [datetime] NULL,
	[ResolveNote] [ntext] NULL,
	[Status] [smallint] NULL,
	[Description] [ntext] NULL,
	[Attachment] [nvarchar](300) NULL,
	[isDelete] [bit] NULL,
	[AccidentID] [int] NULL,
 CONSTRAINT [PK_Compensation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompensationStatusCode]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompensationStatusCode](
	[StatusCode] [smallint] NOT NULL,
	[StatusName] [nvarchar](50) NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_CompensationStatusCode] PRIMARY KEY CLUSTERED 
(
	[StatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[CustomerID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Status] [smallint] NULL,
	[isDelete] [bit] NULL,
	[ContractFee] [money] NULL,
	[CancelComment] [nvarchar](600) NULL,
	[CancelReason] [nvarchar](600) NULL,
	[CancelDate] [datetime] NULL,
	[CancelRequestDate] [datetime] NULL,
	[VehicleTypeID] [int] NULL,
	[Engine] [nvarchar](100) NULL,
	[LicensePlate] [nvarchar](100) NULL,
	[Color] [nvarchar](100) NULL,
	[CertImage] [nvarchar](300) NULL,
	[BrandID] [int] NULL,
	[Owner] [nvarchar](600) NULL,
	[Chassis] [nvarchar](100) NULL,
	[RequestDate] [datetime] NULL,
	[ResolveDate] [datetime] NULL,
	[StartStaff] [int] NULL,
	[CancelStaff] [int] NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContractStatusCode]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractStatusCode](
	[StatusCode] [smallint] NOT NULL,
	[StatusName] [nvarchar](50) NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_ContractStatusCode] PRIMARY KEY CLUSTERED 
(
	[StatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[AccountID] [int] NOT NULL,
	[FirstName] [nvarchar](300) NULL,
	[LastName] [nvarchar](300) NULL,
	[Address] [nvarchar](600) NULL,
	[Dob] [date] NULL,
	[JoinDate] [datetime] NULL,
	[Phone] [nvarchar](50) NULL,
	[PersonalID] [nvarchar](50) NULL,
	[Province] [nvarchar](100) NULL,
	[District] [nvarchar](100) NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Staff]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Staff](
	[CustomerID] [int] NOT NULL,
	[StaffID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[isDelete] [bit] NULL,
	[NextStaff] [int] NULL,
 CONSTRAINT [PK_Customer_Staff] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[StaffID] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](800) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](300) NULL,
	[Address] [nvarchar](600) NULL,
	[Province] [nvarchar](100) NULL,
	[District] [nvarchar](100) NULL,
	[ContractID] [int] NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [smallint] NULL,
	[URL] [nvarchar](600) NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moderator]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moderator](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](255) NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Moderator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PaidDate] [datetime] NULL,
	[PaymentMethodID] [int] NULL,
	[Note] [nvarchar](600) NULL,
	[Amount] [money] NULL,
	[StartDate] [datetime] NULL,
	[ContractID] [int] NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethod](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentMethod] [nvarchar](800) NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_PaymentMethod] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](300) NULL,
	[Description] [nvarchar](600) NULL,
	[Price] [money] NULL,
	[ImageURL] [nvarchar](300) NULL,
	[Status] [smallint] NULL,
	[isDelete] [bit] NULL,
	[ContentDetail] [ntext] NULL,
	[StartDate] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductStatusCode]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStatusCode](
	[StatusCode] [smallint] NOT NULL,
	[StatusName] [nvarchar](50) NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_ProductStatusCode] PRIMARY KEY CLUSTERED 
(
	[StatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductUpdateTime]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductUpdateTime](
	[ProductID] [int] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_ProductUpdateTime] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[UpdateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleFeature]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleFeature](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_RoleFeature] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_RoleFeature] UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[AccountID] [int] NOT NULL,
	[FirstName] [nvarchar](300) NULL,
	[LastName] [nvarchar](300) NULL,
	[Phone] [nvarchar](50) NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleType]    Script Date: 3/22/2022 01:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VehicleType] [nvarchar](800) NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_VehicleType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accident] ADD  CONSTRAINT [DF_Accident_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Accident] ADD  CONSTRAINT [DF_Accident_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_Role]  DEFAULT ((0)) FOR [Role]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[AccountStatusCode] ADD  CONSTRAINT [DF_AccountStatusCode_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[Brand] ADD  CONSTRAINT [DF_Brand_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[Compensation] ADD  CONSTRAINT [DF_Compensation_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Compensation] ADD  CONSTRAINT [DF_Compensation_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[CompensationStatusCode] ADD  CONSTRAINT [DF_CompensationStatusCode_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[Contract] ADD  CONSTRAINT [DF_Contract_Status]  DEFAULT ((2)) FOR [Status]
GO
ALTER TABLE [dbo].[Contract] ADD  CONSTRAINT [DF_Contract_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[ContractStatusCode] ADD  CONSTRAINT [DF_ContractStatusCode_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_JoinDate]  DEFAULT (getdate()) FOR [JoinDate]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[Customer_Staff] ADD  CONSTRAINT [DF_Customer_Staff_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Customer_Staff] ADD  CONSTRAINT [DF_Customer_Staff_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[Feature] ADD  CONSTRAINT [DF_Feature_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[Moderator] ADD  CONSTRAINT [DF_Moderator_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[PaymentMethod] ADD  CONSTRAINT [DF_PaymentMethod_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[ProductStatusCode] ADD  CONSTRAINT [DF_ProductStatusCode_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[ProductUpdateTime] ADD  CONSTRAINT [DF_ProductUpdateTime_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[RoleFeature] ADD  CONSTRAINT [DF_Role_Feature_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF_Staff_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[VehicleType] ADD  CONSTRAINT [DF_VehicleType_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[Accident]  WITH CHECK ADD  CONSTRAINT [FK_Accident_Contract] FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contract] ([ID])
GO
ALTER TABLE [dbo].[Accident] CHECK CONSTRAINT [FK_Accident_Contract]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_AccountStatusCode] FOREIGN KEY([Status])
REFERENCES [dbo].[AccountStatusCode] ([StatusCode])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_AccountStatusCode]
GO
ALTER TABLE [dbo].[Compensation]  WITH CHECK ADD  CONSTRAINT [FK_Compensation_Accident] FOREIGN KEY([AccidentID])
REFERENCES [dbo].[Accident] ([ID])
GO
ALTER TABLE [dbo].[Compensation] CHECK CONSTRAINT [FK_Compensation_Accident]
GO
ALTER TABLE [dbo].[Compensation]  WITH CHECK ADD  CONSTRAINT [FK_Compensation_CompensationStatusCode] FOREIGN KEY([Status])
REFERENCES [dbo].[CompensationStatusCode] ([StatusCode])
GO
ALTER TABLE [dbo].[Compensation] CHECK CONSTRAINT [FK_Compensation_CompensationStatusCode]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Brand] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([ID])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Brand]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_ContractStatusCode] FOREIGN KEY([Status])
REFERENCES [dbo].[ContractStatusCode] ([StatusCode])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_ContractStatusCode]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([AccountID])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Customer]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Product]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Staff2] FOREIGN KEY([StartStaff])
REFERENCES [dbo].[Staff] ([AccountID])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Staff2]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Staff3] FOREIGN KEY([CancelStaff])
REFERENCES [dbo].[Staff] ([AccountID])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Staff3]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_VehicleType] FOREIGN KEY([VehicleTypeID])
REFERENCES [dbo].[VehicleType] ([ID])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_VehicleType]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Account1] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Account1]
GO
ALTER TABLE [dbo].[Customer_Staff]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Staff_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([AccountID])
GO
ALTER TABLE [dbo].[Customer_Staff] CHECK CONSTRAINT [FK_Customer_Staff_Customer]
GO
ALTER TABLE [dbo].[Customer_Staff]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Staff_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([AccountID])
GO
ALTER TABLE [dbo].[Customer_Staff] CHECK CONSTRAINT [FK_Customer_Staff_Staff]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Contract] FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contract] ([ID])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Contract]
GO
ALTER TABLE [dbo].[Feature]  WITH CHECK ADD  CONSTRAINT [FK_Feature_RoleFeature] FOREIGN KEY([RoleID])
REFERENCES [dbo].[RoleFeature] ([ID])
GO
ALTER TABLE [dbo].[Feature] CHECK CONSTRAINT [FK_Feature_RoleFeature]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Contract] FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contract] ([ID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Contract]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_PaymentMethod] FOREIGN KEY([PaymentMethodID])
REFERENCES [dbo].[PaymentMethod] ([ID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_PaymentMethod]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductStatusCode] FOREIGN KEY([Status])
REFERENCES [dbo].[ProductStatusCode] ([StatusCode])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductStatusCode]
GO
ALTER TABLE [dbo].[ProductUpdateTime]  WITH CHECK ADD  CONSTRAINT [FK_ProductUpdateTime_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductUpdateTime] CHECK CONSTRAINT [FK_ProductUpdateTime_Product]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Account]
GO
USE [master]
GO
ALTER DATABASE [InsuranceCard] SET  READ_WRITE 
GO
