﻿/*
Deployment script for ICES_Database

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "ICES_Database"
:setvar DefaultFilePrefix "ICES_Database"
:setvar DefaultDataPath "C:\Users\User\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\User\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creating Table [dbo].[accounts]...';


GO
CREATE TABLE [dbo].[accounts] (
    [accountId] INT          IDENTITY (1, 1) NOT NULL,
    [username]  VARCHAR (50) NULL,
    [password]  VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([accountId] ASC)
);


GO
PRINT N'Creating Procedure [dbo].[Create]...';


GO
CREATE PROCEDURE [dbo].[Create]
	@username varchar(50),
	@password varchar(50)
AS
BEGIN 
INSERT INTO [dbo].[accounts](username, password)
VALUES (@username, @password);

END;
GO
PRINT N'Creating Procedure [dbo].[Login]...';


GO
CREATE PROCEDURE [dbo].[Login]
	@username NVARCHAR(50),
    @password NVARCHAR(50)
AS
	BEGIN
    SELECT [D].[username] AS username, [D].[password] AS password
    FROM [dbo].[accounts] AS D
    WHERE [D].[username] = @username AND [D].[password] = @password
END;
GO
PRINT N'Update complete.';


GO
