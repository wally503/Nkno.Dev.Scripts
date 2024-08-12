USE [act]
GO

/****** Object:  Table [dbo].[InstanceData]    Script Date: 2024-08-11 10:18:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[InstanceData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ZoneId] [varchar](36) NULL,
	[Name] [varchar](64) NULL,
	[Job] [varchar](8) NULL,
	[EncID] [varchar](16) NULL,
	[Title] [varchar](64) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Duration] [int] NULL,
	[Damage] [bigint] NULL,
	[EncounterDPS] [float] NULL,
	[Zone] [varchar](64) NULL,
	[Kills] [int] NULL,
	[Deaths] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


