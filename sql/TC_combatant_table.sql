USE [act]
GO

/****** Object:  Table [dbo].[combatant_table]    Script Date: 2024-08-11 10:19:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[combatant_table](
	[encid] [char](8) NULL,
	[ally] [char](1) NULL,
	[name] [varchar](64) NULL,
	[starttime] [datetime] NULL,
	[endtime] [datetime] NULL,
	[duration] [int] NULL,
	[damage] [bigint] NULL,
	[damageperc] [varchar](4) NULL,
	[kills] [int] NULL,
	[healed] [bigint] NULL,
	[healedperc] [varchar](4) NULL,
	[critheals] [int] NULL,
	[heals] [int] NULL,
	[curedispels] [int] NULL,
	[powerdrain] [bigint] NULL,
	[powerreplenish] [bigint] NULL,
	[dps] [float] NULL,
	[encdps] [float] NULL,
	[enchps] [float] NULL,
	[hits] [int] NULL,
	[crithits] [int] NULL,
	[blocked] [int] NULL,
	[misses] [int] NULL,
	[swings] [int] NULL,
	[healstaken] [bigint] NULL,
	[damagetaken] [bigint] NULL,
	[deaths] [int] NULL,
	[tohit] [float] NULL,
	[critdamperc] [varchar](8) NULL,
	[crithealperc] [varchar](8) NULL,
	[crittypes] [varchar](32) NULL,
	[threatstr] [varchar](32) NULL,
	[threatdelta] [bigint] NULL,
	[job] [varchar](8) NULL,
	[parrypct] [varchar](8) NULL,
	[blockpct] [varchar](8) NULL,
	[inctohit] [varchar](8) NULL,
	[overhealpct] [varchar](8) NULL,
	[directhitpct] [varchar](8) NULL,
	[directhitcount] [int] NULL,
	[critdirecthitcount] [int] NULL,
	[critdirecthitpct] [varchar](8) NULL
) ON [PRIMARY]
GO


