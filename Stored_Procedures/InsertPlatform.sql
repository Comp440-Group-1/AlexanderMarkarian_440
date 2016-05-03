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
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE InsertPlatform
	-- Add the parameters for the stored procedure here
	@platform_id int,
	@platform_type nchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF(@platform_type = 'Windows' OR @platform_type = 'Linuxs')
		BEGIN
			IF(@platform_type = 'Windows')
				SET @platform_id = 1;
			IF(@platform_type = 'Linux')
				SET @platform_id = 2;
			INSERT INTO Platform VALUES(@platform_id, @platform_type)
		END
	ELSE 
		PRINT 'ERROR'
END
GO
