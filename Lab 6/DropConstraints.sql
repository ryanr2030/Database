USE [Company]
GO

ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [PK__Employee__CA1E8E3DA75D87B7] WITH ( ONLINE = OFF )
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK__Employee__DNO__276EDEB3]
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK__Employee__SuperS__267ABA7A]

ALTER TABLE [dbo].[Department] DROP CONSTRAINT [PK__Departme__40A4CC7A619EB6FF] WITH ( ONLINE = OFF )
ALTER TABLE [dbo].[Department] DROP CONSTRAINT [FK__Departmen__MgrSS__286302EC]
ALTER TABLE [dbo].[Department] DROP CONSTRAINT [FK__Departmen__MgrSS__48CFD27E]
ALTER TABLE [dbo].[Department] DROP CONSTRAINT [UQ__Departme__83BFD84946F629DC]


ALTER TABLE [dbo].[Dependent] DROP CONSTRAINT [PK__Dependen__7E4E1C2DFC49894D] WITH ( ONLINE = OFF )
ALTER TABLE [dbo].[Dependent] DROP CONSTRAINT [FK__Dependent__paren__2E1BDC42]


ALTER TABLE [dbo].[Dept_Location] DROP CONSTRAINT [PK__Dept_Loc__ED088203B78A5F43] WITH ( ONLINE = OFF )
ALTER TABLE [dbo].[Dept_Location] DROP CONSTRAINT [FK__Dept_Locati__DNO__2B3F6F97]


ALTER TABLE [dbo].[Project] DROP CONSTRAINT [PK__Project__BBE761DD0227A3CA] WITH ( ONLINE = OFF )
ALTER TABLE [dbo].[Project] DROP CONSTRAINT [FK__Project__Dnum__31EC6D26]
ALTER TABLE [dbo].[Project] DROP CONSTRAINT [UQ__Project__173BB01CFEFD66BB]



ALTER TABLE [dbo].[WORKS_ON] DROP CONSTRAINT [PK__WORKS_ON__B65F9BE817B4F933] WITH ( ONLINE = OFF )
ALTER TABLE [dbo].[WORKS_ON] DROP CONSTRAINT [FK__WORKS_ON__Essn__34C8D9D1]
ALTER TABLE [dbo].[WORKS_ON] DROP CONSTRAINT [FK__WORKS_ON__Pno__35BCFE0A]
GO









