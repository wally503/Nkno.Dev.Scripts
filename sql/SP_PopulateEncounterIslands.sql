SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Author:		Michael Russell
-- Create date: 2024-08-07
-- Description:	Builds essential Gap and Island derived Many-to-Many group ID table.
-- ==========================================================================================
CREATE PROCEDURE PopulateEncounterIslands
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		WITH ZoneChanges AS (
			SELECT
				encid,
				starttime,
				zone,
				LAG(zone) OVER (ORDER BY starttime) AS prev_zone
			FROM encounter_table
			WHERE endtime <= DATEADD(HOUR, -2, GETDATE()) 
		),
		ZoneFlags AS (
			SELECT
				encid,
				starttime,
				zone,
				CASE 
					WHEN zone <> prev_zone OR prev_zone IS NULL THEN 1
					ELSE 0
				END AS zone_change_flag
			FROM ZoneChanges
		),
		GroupIdentifiers AS (
			SELECT
				encid,
				starttime,
				zone,
				SUM(zone_change_flag) OVER (ORDER BY starttime ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS group_id
			FROM ZoneFlags
		),
		GroupGuids AS (
			SELECT
				group_id,
				zone,
				-- Generate a GUID-like string based on the MD5 hash of group_id --- NEWID() will not work because it 
				-- generates every line, rather than the grouping, and thus breaks proceeding queries
				SUBSTRING(LOWER(CONVERT(varchar(32), HASHBYTES('MD5', CAST(group_id AS varchar(10))), 2)), 1, 8) + '-' +
				SUBSTRING(LOWER(CONVERT(varchar(32), HASHBYTES('MD5', CAST(group_id AS varchar(10))), 2)), 9, 4) + '-' +
				SUBSTRING(LOWER(CONVERT(varchar(32), HASHBYTES('MD5', CAST(group_id AS varchar(10))), 2)), 13, 4) + '-' +
				SUBSTRING(LOWER(CONVERT(varchar(32), HASHBYTES('MD5', CAST(group_id AS varchar(10))), 2)), 17, 4) + '-' +
				SUBSTRING(LOWER(CONVERT(varchar(32), HASHBYTES('MD5', CAST(group_id AS varchar(10))), 2)), 21, 12) AS zone_id
			FROM GroupIdentifiers
			GROUP BY group_id, zone
		),
		IslandEncounters AS (
			SELECT
				DISTINCT(isl.encid)
			FROM encounter_zone_islands as isl
		)
		INSERT INTO encounter_zone_islands(zone_id, encid)
		SELECT
			g.zone_id,
			gi.encid
		FROM GroupIdentifiers gi
			JOIN GroupGuids g 
				ON gi.group_id = g.group_id
			LEFT JOIN
				IslandEncounters isl
				ON gi.encid = isl.encid
				WHERE isl.encid IS NULL
			ORDER BY gi.starttime, gi.encid;
END
GO
