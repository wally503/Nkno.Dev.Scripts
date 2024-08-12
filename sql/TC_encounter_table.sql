USE [act]
GO

/****** Object:  Table [dbo].[encounter_table]    Script Date: 2024-08-11 10:20:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[encounter_table](
	[encid] [char](8) NULL,
	[title] [varchar](64) NULL,
	[starttime] [datetime] NULL,
	[endtime] [datetime] NULL,
	[duration] [int] NULL,
	[damage] [bigint] NULL,
	[encdps] [float] NULL,
	[zone] [varchar](64) NULL,
	[kills] [int] NULL,
	[deaths] [int] NULL
) ON [PRIMARY]
GO


