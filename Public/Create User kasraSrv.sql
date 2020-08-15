/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [kasraSrv]    Script Date: 09/06/2009 16:12:02 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'kasraSrv')
DROP LOGIN [kasraSrv]
GO


USE [Framework]
GO
/****** Object:  User [atalebi]    Script Date: 09/06/2009 16:25:40 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'kasraSrv')
DROP USER [kasraSrv]
GO

USE [model]
GO
/****** Object:  User [atalebi]    Script Date: 09/06/2009 16:25:40 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'kasraSrv')
DROP USER [kasraSrv]
GO

USE [tempdb]
GO
/****** Object:  User [atalebi]    Script Date: 09/06/2009 16:25:40 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'kasraSrv')
DROP USER [kasraSrv]
GO

---------------------------------------------------------------------------

Use master
Go
CREATE LOGIN [kasraSrv] WITH PASSWORD=N'ff763$.@4d3Gg575fwsqxx,bnu76tg'

GO
USE [Framework]
GO
CREATE USER [kasraSrv] FOR LOGIN [kasraSrv]
GO
EXEC sp_addrolemember N'db_owner', N'kasraSrv'
GO


USE [model]
GO
CREATE USER [kasraSrv] FOR LOGIN [kasraSrv]
GO
EXEC sp_addrolemember N'db_owner', N'kasraSrv'
GO

USE [tempdb]
GO
CREATE USER [kasraSrv] FOR LOGIN [kasraSrv]
GO
EXEC sp_addrolemember N'db_owner', N'kasraSrv'
GO
--============================================

Use Framework
--======================================ø================================
EXEC master..sp_addsrvrolemember @loginame = N'kasraSrv', @rolename = N'bulkadmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'kasraSrv', @rolename = N'dbcreator'
GO
EXEC master..sp_addsrvrolemember @loginame = N'kasraSrv', @rolename = N'diskadmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'kasraSrv', @rolename = N'processadmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'kasraSrv', @rolename = N'securityadmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'kasraSrv', @rolename = N'serveradmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'kasraSrv', @rolename = N'setupadmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'kasraSrv', @rolename = N'sysadmin'
GO
--========================================================================
