IF NOT EXISTS (
    SELECT name 
    FROM sys.databases 
    WHERE name = 'tradeportdb'
)
BEGIN
    CREATE DATABASE tradeportdb;
END
GO

USE [tradeportdb]
GO


/****** Object:  Table [dbo].[Users]    Script Date: 2/22/2025 10:54:57 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/22/2025 10:54:57 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
DROP TABLE [dbo].[Products]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 2/22/2025 10:54:57 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductImage]') AND type in (N'U'))
DROP TABLE [dbo].[ProductImage]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/22/2025 10:54:57 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
DROP TABLE [dbo].[Orders]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2/22/2025 10:54:57 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetails]') AND type in (N'U'))
DROP TABLE [dbo].[OrderDetails]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 2/22/2025 10:54:57 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Notification]') AND type in (N'U'))
DROP TABLE [dbo].[Notification]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 2/22/2025 10:54:57 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShoppingCart]') AND type in (N'U'))
DROP TABLE [dbo].[ShoppingCart]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 2/22/2025 10:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NULL,
	[Subject] [nvarchar](255) NULL,
	[Message] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[EmailSend] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/7/2025 12:48:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [uniqueidentifier] NOT NULL,
	[OrderID] [uniqueidentifier] NOT NULL,
	[ProductID] [uniqueidentifier] NOT NULL,
	[ManufacturerID] [uniqueidentifier] NOT NULL,
	[OrderItemStatus] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductPrice] [decimal](10, 2) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_OrderDetails_1] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/7/2025 12:48:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [uniqueidentifier] NOT NULL,
	[RetailerID] [uniqueidentifier] NOT NULL,
	[DeliveryPersonnelID] [uniqueidentifier] NULL,
	[OrderStatus] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[TotalPrice] [decimal](10, 2) NOT NULL,
	[PaymentMode] [int] NOT NULL,
	[PaymentCurrency] [nvarchar](3) NOT NULL,
	[ShippingCost] [decimal](10, 2) NOT NULL,
	[ShippingCurrency] [nvarchar](3) NOT NULL,
	[ShippingAddress] [nvarchar](500) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 3/7/2025 12:48:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[CartID] [uniqueidentifier] NOT NULL,
	[ProductID] [uniqueidentifier] NOT NULL,
	[Status] [int] NOT NULL,
	[RetailerID] [uniqueidentifier] NOT NULL,
	[OrderQuantity] [int] NOT NULL,
	[ManufacturerID] [uniqueidentifier] NOT NULL,
	[ProductPrice] [decimal](10, 2) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[ProductImage]    Script Date: 2/22/2025 10:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[ImageID] [uniqueidentifier] NOT NULL,
	[ProductID] [uniqueidentifier] NOT NULL,
	[ProductImageURL] [nvarchar](max) NOT NULL,
	[FileName] [nvarchar](50) NULL,
	[FileExtension] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/22/2025 10:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [uniqueidentifier] NOT NULL,
	[ProductCode] [nvarchar](10) NOT NULL,
	[ManufacturerID] [uniqueidentifier] NULL,
	[ProductName] [varchar](255) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Category] [int] NOT NULL,
	[WholesalePrice] [decimal](10, 2) NULL,
	[RetailPrice] [decimal](10, 2) NULL,
	[Quantity] [int] NULL,
	[RetailCurrency] [nvarchar](3) NULL,
	[WholeSaleCurrency] [nvarchar](3) NULL,
	[ShippingCost] [decimal](10, 2) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/22/2025 10:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [uniqueidentifier] NOT NULL,
	[loginID] [varchar](255) NOT NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[Password] [binary](50) NOT NULL,
	[Role] [int] NOT NULL,
	[PhoneNo] [varchar](20) NULL,
	[Address] [nvarchar](500) NULL,
	[Remarks] [nvarchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
/****** [StrPassword] [varchar](50) NULL, ******/
	[StrPassword][nvarchar](MAX) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT [dbo].[Products] ([ProductID], [ProductCode], [ManufacturerID], [ProductName], [Description], [Category], [WholesalePrice], [RetailPrice], [Quantity], [RetailCurrency], [WholeSaleCurrency], [ShippingCost], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'163dd606-2643-456c-80fe-1d643381be73', N'P002', N'8f487a9e-c9a3-4d28-b477-6542ba235324', N'Smartphone', N'Flagship smartphone', 2, CAST(500.00 AS Decimal(10, 2)), CAST(700.00 AS Decimal(10, 2)), 100, N'USD', N'USD', CAST(15.00 AS Decimal(10, 2)), CAST(N'2025-02-22T22:37:00.557' AS DateTime), CAST(N'2025-02-22T22:37:00.557' AS DateTime), 1)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ManufacturerID], [ProductName], [Description], [Category], [WholesalePrice], [RetailPrice], [Quantity], [RetailCurrency], [WholeSaleCurrency], [ShippingCost], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'4c2b78c5-6f85-47b0-8fbc-2ed8aa179a4e', N'P005', N'a30a09ba-15b6-4d8e-99a0-16c693e4df78', N'Monitor', N'27-inch 4K monitor', 4, CAST(250.00 AS Decimal(10, 2)), CAST(350.00 AS Decimal(10, 2)), 75, N'USD', N'USD', CAST(25.00 AS Decimal(10, 2)), CAST(N'2025-02-22T22:37:00.557' AS DateTime), CAST(N'2025-02-22T22:37:00.557' AS DateTime), 1)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ManufacturerID], [ProductName], [Description], [Category], [WholesalePrice], [RetailPrice], [Quantity], [RetailCurrency], [WholeSaleCurrency], [ShippingCost], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'ff457543-6fee-4da6-99a6-4ecd62377733', N'P007', N'e961fd8f-5622-438f-94a8-f850e971abe1', N'Graphics Card', N'High-end gaming GPU', 6, CAST(500.00 AS Decimal(10, 2)), CAST(700.00 AS Decimal(10, 2)), 30, N'USD', N'USD', CAST(30.00 AS Decimal(10, 2)), CAST(N'2025-02-22T22:37:00.557' AS DateTime), CAST(N'2025-02-22T22:37:00.557' AS DateTime), 1)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ManufacturerID], [ProductName], [Description], [Category], [WholesalePrice], [RetailPrice], [Quantity], [RetailCurrency], [WholeSaleCurrency], [ShippingCost], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'cacaed1a-b5e0-4c97-aeb6-570572883d5d', N'P004', N'e3450c08-7b34-491c-a14f-17fe7f8a1a30', N'Mechanical Keyboard', N'RGB mechanical keyboard', 3, CAST(50.00 AS Decimal(10, 2)), CAST(80.00 AS Decimal(10, 2)), 150, N'USD', N'USD', CAST(7.00 AS Decimal(10, 2)), CAST(N'2025-02-22T22:37:00.557' AS DateTime), CAST(N'2025-02-22T22:37:00.557' AS DateTime), 1)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ManufacturerID], [ProductName], [Description], [Category], [WholesalePrice], [RetailPrice], [Quantity], [RetailCurrency], [WholeSaleCurrency], [ShippingCost], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'5fc39a2d-1ca7-4a4b-87da-5ecf7a82eca7', N'P010', N'9687db4c-b121-4332-95f2-88390fe367a3', N'Bluetooth Speaker', N'Portable Bluetooth speaker', 9, CAST(40.00 AS Decimal(10, 2)), CAST(60.00 AS Decimal(10, 2)), 130, N'USD', N'USD', CAST(8.00 AS Decimal(10, 2)), CAST(N'2025-02-22T22:37:00.557' AS DateTime), CAST(N'2025-02-22T22:37:00.557' AS DateTime), 1)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ManufacturerID], [ProductName], [Description], [Category], [WholesalePrice], [RetailPrice], [Quantity], [RetailCurrency], [WholeSaleCurrency], [ShippingCost], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'53cfadef-5125-4df4-99cc-7f45d1ec4be6', N'P006', N'6b15d3f6-5110-4b4e-9eb9-272c194d042d', N'External Hard Drive', N'2TB external storage', 5, CAST(60.00 AS Decimal(10, 2)), CAST(90.00 AS Decimal(10, 2)), 120, N'USD', N'USD', CAST(10.00 AS Decimal(10, 2)), CAST(N'2025-02-22T22:37:00.557' AS DateTime), CAST(N'2025-02-22T22:37:00.557' AS DateTime), 1)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ManufacturerID], [ProductName], [Description], [Category], [WholesalePrice], [RetailPrice], [Quantity], [RetailCurrency], [WholeSaleCurrency], [ShippingCost], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'7d79fce3-f9f0-4708-99c9-87f9064c0854', N'P009', N'063e5b14-98ee-4420-8349-07728eca1279', N'Smartwatch', N'Feature-rich smartwatch', 8, CAST(120.00 AS Decimal(10, 2)), CAST(180.00 AS Decimal(10, 2)), 90, N'USD', N'USD', CAST(12.00 AS Decimal(10, 2)), CAST(N'2025-02-22T22:37:00.557' AS DateTime), CAST(N'2025-02-22T22:37:00.557' AS DateTime), 1)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ManufacturerID], [ProductName], [Description], [Category], [WholesalePrice], [RetailPrice], [Quantity], [RetailCurrency], [WholeSaleCurrency], [ShippingCost], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'e34c7c40-66ff-4ae2-8950-8d12f91280b2', N'P001', N'954d9487-2171-4cca-a9a4-0b727ac9dad3', N'Laptop', N'High-performance laptop', 1, CAST(800.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), 50, N'USD', N'USD', CAST(20.00 AS Decimal(10, 2)), CAST(N'2025-02-22T22:37:00.557' AS DateTime), CAST(N'2025-02-22T22:37:00.557' AS DateTime), 1)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ManufacturerID], [ProductName], [Description], [Category], [WholesalePrice], [RetailPrice], [Quantity], [RetailCurrency], [WholeSaleCurrency], [ShippingCost], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'508e850b-676e-4997-b0b9-c6a2048c872b', N'P008', N'f62abbc4-e488-46b4-84ab-70b4338bd740', N'Gaming Chair', N'Comfortable gaming chair', 7, CAST(100.00 AS Decimal(10, 2)), CAST(150.00 AS Decimal(10, 2)), 80, N'USD', N'USD', CAST(20.00 AS Decimal(10, 2)), CAST(N'2025-02-22T22:37:00.557' AS DateTime), CAST(N'2025-02-22T22:37:00.557' AS DateTime), 1)
INSERT [dbo].[Products] ([ProductID], [ProductCode], [ManufacturerID], [ProductName], [Description], [Category], [WholesalePrice], [RetailPrice], [Quantity], [RetailCurrency], [WholeSaleCurrency], [ShippingCost], [CreatedOn], [UpdatedOn], [IsActive]) VALUES (N'9106da5e-4655-4c40-b7eb-d0320fae06a1', N'P003', N'f996a182-6e0f-4925-adf7-38e8c9771c03', N'Wireless Mouse', N'Ergonomic wireless mouse', 3, CAST(15.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), 200, N'USD', N'USD', CAST(5.00 AS Decimal(10, 2)), CAST(N'2025-02-22T22:37:00.557' AS DateTime), CAST(N'2025-02-22T22:37:00.557' AS DateTime), 1)
GO
INSERT [dbo].[Users] ([UserID], [loginID], [UserName], [Password], [Role], [PhoneNo], [Address], [Remarks], [CreatedOn], [IsActive]) VALUES (N'4bd97ff5-e20d-4d47-8f6e-285e0f1ffc3a', N'admin@gmail.com', N'su', 0xFCC5F691B5D61F3C42EAA77BA7977EFEF8A5B6B155744967261967621979A97E000000000000000000000000000000000000, 1, N'00100230', N'SG', N'Nil', CAST(N'2025-02-03T22:45:50.000' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [loginID], [UserName], [Password], [Role], [PhoneNo], [Address], [Remarks], [CreatedOn], [IsActive]) VALUES (N'6d0f5be2-1e4e-47b1-9081-60320b8a9d60', N'retailer@gmail.com', N'su', 0xFCC5F691B5D61F3C42EAA77BA7977EFEF8A5B6B155744967261967621979A97E000000000000000000000000000000000000, 2, N'00100230', N'SG', N'Nil', CAST(N'2025-02-03T22:46:06.000' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [loginID], [UserName], [Password], [Role], [PhoneNo], [Address], [Remarks], [CreatedOn], [IsActive]) VALUES (N'1b675eb0-367b-49aa-a92f-6c572c0d7d39', N'manfacture@gmail.com', N'su', 0xFCC5F691B5D61F3C42EAA77BA7977EFEF8A5B6B155744967261967621979A97E000000000000000000000000000000000000, 3, N'00100230', N'SG', N'Nil', CAST(N'2025-02-03T22:46:25.000' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [loginID], [UserName], [Password], [Role], [PhoneNo], [Address], [Remarks], [CreatedOn], [IsActive]) VALUES (N'7d6dd769-8f98-43aa-bdf6-9d4416d36559', N'deliver@gmail.com', N'su', 0xFCC5F691B5D61F3C42EAA77BA7977EFEF8A5B6B155744967261967621979A97E000000000000000000000000000000000000, 4, N'00100230', N'SG', N'Nil', CAST(N'2025-02-03T22:46:38.000' AS DateTime), 1)
GO
ALTER TABLE [dbo].[Notification] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Notification] ADD  DEFAULT ((1)) FOR [EmailSend]
GO
