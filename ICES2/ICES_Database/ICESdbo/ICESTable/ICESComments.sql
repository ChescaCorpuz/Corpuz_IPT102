﻿CREATE TABLE [dbo].[ICESComments]
(
	[ICES] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ICESIDNO] NVARCHAR(50) NULL, 
    [ICESName] NVARCHAR(50) NULL, 
    [ICESInstitutionalEmail] NVARCHAR(50) NULL, 
    [ICESComment] NVARCHAR(50) NULL
)
