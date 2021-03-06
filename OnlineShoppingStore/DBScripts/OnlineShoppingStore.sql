USE master;
GO


DROP DATABASE IF EXISTS OnlineShoppingStore;
GO


CREATE DATABASE [OnlineShoppingStore];
GO


USE [OnlineShoppingStore];
GO


CREATE TABLE [dbo].[Cart] (
	[CartId] [INT] IDENTITY(1, 1) NOT NULL
	,[DateCreated] [DATETIME2](2) NOT NULL CONSTRAINT DF_Cart_DateCreated DEFAULT GETDATE()
	,[DateModified] [DATETIME2](2) NOT NULL CONSTRAINT DF_Cart_DateModified DEFAULT GETDATE()
	,[ProductId] [INT] NULL
	,[MemberId] [INT] NULL
	,[CartStatusId] [INT] NULL
	,PRIMARY KEY CLUSTERED ([CartId] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CartStatus] (
	[CartStatusId] [INT] IDENTITY(1, 1) NOT NULL
	,[DateCreated] [DATETIME2](2) NOT NULL CONSTRAINT DF_CartStatus_DateCreated DEFAULT GETDATE()
	,[DateModified] [DATETIME2](2) NOT NULL CONSTRAINT DF_CartStatus_DateModified DEFAULT GETDATE()
	,[CartStatus] [VARCHAR](500) NULL
	,PRIMARY KEY CLUSTERED ([CartStatusId] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Category] (
	[CategoryId] [INT] IDENTITY(1, 1) NOT NULL
	,[DateCreated] [DATETIME2](2) NOT NULL CONSTRAINT DF_Category_DateCreated DEFAULT GETDATE()
	,[DateModified] [DATETIME2](2) NOT NULL CONSTRAINT DF_Category_DateModified DEFAULT GETDATE()
	,[CategoryName] [VARCHAR](500) NULL
	,[IsActive] [BIT] NULL
	,[IsDelete] [BIT] NULL
	,PRIMARY KEY CLUSTERED ([CategoryId] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	,UNIQUE NONCLUSTERED ([CategoryName] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MemberRole] (
	[MemberRoleID] [INT] IDENTITY(1, 1) NOT NULL
	,[DateCreated] [DATETIME2](2) NOT NULL CONSTRAINT DF_MemberRole_DateCreated DEFAULT GETDATE()
	,[DateModified] [DATETIME2](2) NOT NULL CONSTRAINT DF_MemberRole_DateModified DEFAULT GETDATE()
	,[memberId] [INT] NOT NULL
	,[RoleId] [INT] NOT NULL
	,PRIMARY KEY CLUSTERED ([MemberRoleID] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Member] (
	[MemberId] [INT] IDENTITY(1, 1) NOT NULL
	,[DateCreated] [DATETIME2](2) NOT NULL CONSTRAINT DF_Member_DateCreated DEFAULT GETDATE()
	,[DateModified] [DATETIME2](2) NOT NULL CONSTRAINT DF_Member_DateModified DEFAULT GETDATE()
	,[FirstName] [VARCHAR](200) NULL
	,[LastName] [VARCHAR](200) NULL
	,[Email] [VARCHAR](200) NULL
	,[Password] [VARCHAR](500) NULL
	,[IsActive] [BIT] NULL
	,[IsDelete] [BIT] NULL
	,PRIMARY KEY CLUSTERED ([MemberId] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	,UNIQUE NONCLUSTERED (
		[LastName] ASC
		,[FirstName]
		) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	,UNIQUE NONCLUSTERED ([Email] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Product] (
	[ProductId] [INT] IDENTITY(1, 1) NOT NULL
	,[DateCreated] [DATETIME2](2) NOT NULL CONSTRAINT DF_Product_DateCreated DEFAULT GETDATE()
	,[DateModified] [DATETIME2](2) NOT NULL CONSTRAINT DF_Product_DateModified DEFAULT GETDATE()
	,[ProductName] [VARCHAR](50) NOT NULL
	,[CategoryId] [INT] NOT NULL
	,[IsActive] [BIT] NOT NULL CONSTRAINT DF_Product_IsActive DEFAULT 1
	,[IsDelete] [BIT] NOT NULL CONSTRAINT DF_Product_IsDelete DEFAULT 0
	,[Description] [VARCHAR](500) NULL
	,[ProductImage] [VARCHAR](MAX) NULL
	,[IsFeatured] [BIT] NOT NULL CONSTRAINT DF_Product_IsFeatured DEFAULT 0
	,[Quantity] [INT] NULL
	,[Price] [DECIMAL](18, 2) NOT NULL CONSTRAINT CHK_Product_Price CHECK (Price > 0.00)
	,PRIMARY KEY CLUSTERED ([ProductId] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	,UNIQUE NONCLUSTERED ([ProductName] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Role] (
	[RoleId] [INT] IDENTITY(1, 1) NOT NULL
	,[DateCreated] [DATETIME2](2) NOT NULL CONSTRAINT DF_Role_DateCreated DEFAULT GETDATE()
	,[DateModified] [DATETIME2](2) NOT NULL CONSTRAINT DF_Role_DateModified DEFAULT GETDATE()
	,[RoleName] [VARCHAR](200) NULL
	,PRIMARY KEY CLUSTERED ([RoleId] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	,UNIQUE NONCLUSTERED ([RoleName] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PaymentType] (
	PaymentTypeId INT IDENTITY(1, 1) NOT NULL
	,[DateCreated] [DATETIME2](2) NOT NULL CONSTRAINT DF_PaymentType_DateCreated DEFAULT GETDATE()
	,[DateModified] [DATETIME2](2) NOT NULL CONSTRAINT DF_PaymentType_DateModified DEFAULT GETDATE()
	,[PaymentTypeName] [VARCHAR](50) NULL
	,PRIMARY KEY CLUSTERED ([PaymentTypeId] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	,UNIQUE NONCLUSTERED ([PaymentTypeName] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	) ON [PRIMARY]

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ShippingDetail] (
	[ShippingDetailId] [INT] IDENTITY(1, 1) NOT NULL
	,[DateCreated] [DATETIME2](2) NOT NULL CONSTRAINT DF_ShippingDetail_DateCreated DEFAULT GETDATE()
	,[DateModified] [DATETIME2](2) NOT NULL CONSTRAINT DF_ShippingDetail_DateModified DEFAULT GETDATE()
	,[MemberId] [INT] NOT NULL
	,[Address] [VARCHAR](100) NOT NULL
	,[City] [VARCHAR](100) NOT NULL
	,[State] [VARCHAR](20) NOT NULL
	,[Country] [VARCHAR](50) NOT NULL
	,[ZipCode] [VARCHAR](50) NOT NULL
	,[OrderId] [INT] NULL
	,[AmountPaid] [DECIMAL](18, 2) NOT NULL CONSTRAINT CHK_ShippingDetail_AmountPaid CHECK (AmountPaid > 0.00)
	,[PaymentTypeId] [INT] NOT NULL
	,PRIMARY KEY CLUSTERED ([ShippingDetailId] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SlideImage] (
	[SlideId] [INT] IDENTITY(1, 1) NOT NULL
	,[SlideTitle] [VARCHAR](500) NULL
	,[SlideImage] [VARCHAR](max) NULL
	,PRIMARY KEY CLUSTERED ([SlideId] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Cart]
	WITH CHECK ADD FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product]([ProductId])
GO

ALTER TABLE [dbo].[Product]
	WITH CHECK ADD FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Category]([CategoryId])
GO

ALTER TABLE [dbo].[ShippingDetail]
	WITH CHECK ADD FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member]([MemberId])
GO

ALTER TABLE [dbo].[ShippingDetail]
	WITH CHECK ADD FOREIGN KEY ([PaymentTypeId]) REFERENCES [dbo].[PaymentType]([PaymentTypeId])
GO

USE [master]
GO

ALTER DATABASE [OnlineShoppingStore]

SET READ_WRITE
GO

USE OnlineShoppingStore;
GO

INSERT INTO dbo.Category (
	CategoryName
	,IsActive
	,IsDelete
	)
VALUES (
	'Mobile'
	,1
	,0
	)
	,(
	'Laptop'
	,1
	,0
	)
	,(
	'Accessories'
	,1
	,0
	);

INSERT INTO dbo.Product (
	ProductName
	,CategoryId
	,IsActive
	,IsDelete
	,[Description]
	,ProductImage
	,IsFeatured
	,Quantity
	,Price
	)
VALUES (
	'Nokia 6'
	,1
	,0
	,0
	,'The Nokia 6'
	,'download.jpg'
	,1
	,6
	,6000.00
	)
	,(
	'Samsung S9'
	,1
	,1
	,0
	,'The Samsung S9'
	,'thumb_103692_product_td_300.jpg'
	,0
	,90
	,500.00
	)
	,(
	'Lenovo G2345'
	,2
	,1
	,0
	,'The Lenovo G2345'
	,NULL
	,1
	,5
	,4500.00
	)
	,(
	'Test 1'
	,3
	,1
	,0
	,'The Test 1'
	,NULL
	,1
	,4
	,44.00
	)
	,(
	'Test 2'
	,3
	,1
	,0
	,'The Test 2'
	,NULL
	,0
	,2
	,22.00
	)
	,(
	'Test 3'
	,3
	,1
	,0
	,'The Test 3'
	,'49838193_281668699171021_8996337024751370240_n.jpg'
	,1
	,3
	,500.00
	);

INSERT INTO dbo.Member (
	FirstName
	,LastName
	,Email
	,Password
	,IsActive
	)
VALUES (
	'Joe'
	,'Blow'
	,'j.blow@gmail.com'
	,'bite-me'
	,1
	)
	,(
	'Richie'
	,'Blackmore'
	,'r.blackmored@blackmoresrainbow.com'
	,'smokeonthewater'
	,1
	)

INSERT INTO dbo.[Role] (RoleName)
VALUES ('Administrator')
	,('Inventory')
	,('Sales');

INSERT INTO dbo.MemberRole (
	MemberId
	,RoleId
	)
VALUES (
	1
	,1
	)
	,(
	1
	,2
	)
	,(
	1
	,3
	)
	,(
	2
	,3
	);

INSERT INTO dbo.PaymentType (PaymentTypeName)
VALUES ('American Express')
	,('Master Card')
	,('Paypal')
	,('Square')
	,('Venmo')
	,('VISA');