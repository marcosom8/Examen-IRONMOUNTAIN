USE [db_Contacts]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 24/08/2022 02:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[uId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](14) NULL,
	[Curp] [nvarchar](20) NULL,
	[RegistrationDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[uId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([uId], [Name], [Address], [Phone], [Curp], [RegistrationDate]) VALUES (1, N'Marcos', N'Padre Somera 914', N'555-052-6444', N'OOMM890216HSRXRC01', CAST(N'2022-08-22T22:19:58.320' AS DateTime))
INSERT [dbo].[Users] ([uId], [Name], [Address], [Phone], [Curp], [RegistrationDate]) VALUES (3, N'Antonio', N'Michoacan #4501', N'555-566-9898', N'IURJ040101HSRNYSA5', CAST(N'2022-08-22T16:12:15.643' AS DateTime))
INSERT [dbo].[Users] ([uId], [Name], [Address], [Phone], [Curp], [RegistrationDate]) VALUES (4, N'Jose', N'Girasol 1222', N'663-552-6744', N'OIIJ890512HHDAJS1', CAST(N'2022-08-22T15:45:44.197' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_Users]    Script Date: 24/08/2022 02:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Users]
@Method int,
@uId int=NULL,
@Name nvarchar(50)=NULL,
@Address nvarchar(50)=NULL,
@Phone nvarchar(14)=NULL,
@Curp nvarchar(20)=NULL
AS
IF @Method = 1
BEGIN
-- This method searches for all contact
	SELECT 
		[uId]
		,[Name]
		,[Address]
		,[Phone]
		,[Curp]
		,CONVERT(NVARCHAR(10),[RegistrationDate], 20) AS RegistrationDate
		FROM Users
	ORDER BY [uId] DESC
END
IF @Method = 2
BEGIN
	INSERT INTO Users ([Name], [Address], [Phone], [Curp], [RegistrationDate])
	VALUES (@Name, @Address, @Phone, @Curp, GETDATE())
END
IF @Method = 3
BEGIN
	UPDATE Users 
	SET 
	[Name]=@Name,
	[Address]=@Address,
	[Phone] = @Phone,
	[Curp] = @Curp,
	[RegistrationDate] = GETDATE()
	WHERE [uId] = @uId
END
IF @Method = 4
BEGIN
	DELETE Users 
	WHERE [uId]=@uId
END
GO
