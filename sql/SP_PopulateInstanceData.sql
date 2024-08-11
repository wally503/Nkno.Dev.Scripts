SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ======================================================================================================================
-- Author:		Michael Russell
-- Create date: 2024-08-07
-- Description:	Builds InstanceData derived from encounters and combatants tables based using the Gap and Island table.
-- ======================================================================================================================
CREATE PROCEDURE PopulateInstanceData
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- After building an Island and Gap, we need to:
	-- Insert all values that arent currently in the final output table

	WITH
	-- Make example data set that will go into the other table
	TempInstanceData AS(
		SELECT isl.[zone_id], cmb.[name], UPPER(cmb.[job]) as job, enc.encid, enc.title, enc.starttime, enc.endtime, cmb.duration, cmb.damage, cmb.encdps, enc.zone, cmb.kills, cmb.deaths
			FROM [dbo].[encounter_table] as enc
			INNER JOIN 
				encounter_zone_islands as isl
				ON enc.[encid] = isl.[encid]
			INNER JOIN
				combatant_table as cmb
				ON enc.[encid] = cmb.[encid]
					AND cmb.[ally] = 'T'
					AND cmb.job IS NOT NULL
					and cmb.job != ''		
	),
	-- Make temp encounters with distinct values not in Instance data
	TempIslandsEncounters AS(
		SELECT DISTINCT(isl.encid)
			FROM dbo.[encounter_zone_islands] as isl
				LEFT JOIN
					(SELECT DISTINCT(encid) FROM [dbo].InstanceData) as insdt
					ON isl.encid = insdt.EncID
					WHERE insdt.EncID IS NULL
	)		

	-- Execute Left Outer Join and Insert
	INSERT INTO [dbo].[InstanceData] 
		(ZoneId, Name, Job, EncID, Title, StartTime, EndTime, Duration, Damage, EncounterDps, Zone, Kills, Deaths)
		SELECT tempInst.*
			FROM TempInstanceData as tempInst
			INNER JOIN 
				TempIslandsEncounters AS tempIsl
				ON tempInst.EncID = tempIsl.encid

END
GO
