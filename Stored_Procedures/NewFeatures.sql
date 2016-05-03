-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE NewFeatures
	-- Add the parameters for the stored procedure here
	@feature_id int,
	@version_id int,
	@release_id int
AS
BEGIN
	DECLARE @number_features int

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


    -- Insert statements for procedure here
	SELECT @feature_id FROM VersionFeature WHERE @version_id=version_id
	IF(@@ROWCOUNT < 1)
	BEGIN
		PRINT 'THIS VERSION HAS NOT BEEN RELEASED YET'
		RETURN
	END

	SELECT @number_features = Count (*) FROM Feature WHERE @feature_id=feature_id

	SELECT @release_id FROM Release WHERE @version_id=version_id

	if(@number_features > 0)
		PRINT 'THERE ARE ' + @number_features + ' FEATURES IN ' + @release_id

END
GO
