﻿CREATE PROCEDURE [dbo].[ICESComDis]
AS
BEGIN
SELECT
ICES AS ICES,
ICESIDNO AS ICESIDNO,
ICESName AS ICESName,
ICESInstitutionalEmail AS ICESInstitutionalEmail,
ICESComment AS ICESComment
FROM ICESComments
END