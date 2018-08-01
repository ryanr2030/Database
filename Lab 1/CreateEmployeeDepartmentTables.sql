USE [Company]
GO

/****** Object:  Table [dbo].[Department]    Script Date: 1/30/2018 8:44:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Department](
	[Dname] [char](15) NULL,
	[Dnumber] [int] NULL,
	[Mgrssn] [char](9) NULL,
	[Mgrstartdate] [date] NULL
) ON [PRIMARY]

/****** Object:  Table [dbo].[Employee]    Script Date: 1/30/2018 8:45:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[fname] [varchar](10) NOT NULL,
	[mint] [varchar](1) NULL,
	[lname] [varchar](15) NOT NULL,
	[ssn] [char](9) NOT NULL,
	[birthday] [date] NULL,
	[address] [varchar](30) NULL,
	[sex] [char](1) NULL,
	[salary] [decimal](10, 0) NULL,
	[superssn] [char](9) NULL,
	[dno] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



