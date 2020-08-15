/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [kasra]    Script Date: 09/06/2009 16:12:02 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'kasra')
DROP LOGIN [kasra]
GO


USE [Framework]
GO
/****** Object:  User [atalebi]    Script Date: 09/06/2009 16:25:40 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'kasra')
DROP USER [kasra]
GO

USE [model]
GO
/****** Object:  User [atalebi]    Script Date: 09/06/2009 16:25:40 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'kasra')
DROP USER [kasra]
GO

USE [tempdb]
GO
/****** Object:  User [atalebi]    Script Date: 09/06/2009 16:25:40 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'kasra')
DROP USER [kasra]
GO

---------------------------------------------------------------------------

Use master
Go
CREATE LOGIN [kasra] WITH PASSWORD=N'ff763$.@4d3Gg575fwsqxx,bnu76tg'

GO
USE [Framework]
GO
CREATE USER [kasra] FOR LOGIN [kasra]
GO
EXEC sp_addrolemember N'db_owner', N'kasra'
GO

USE [model]
GO
CREATE USER [kasra] FOR LOGIN [kasra]
GO
EXEC sp_addrolemember N'db_owner', N'kasra'
GO

USE [tempdb]
GO
CREATE USER [kasra] FOR LOGIN [kasra]
GO
EXEC sp_addrolemember N'db_owner', N'kasra'
GO
--============================================

Use Framework
--======================================ø================================
EXEC master..sp_addsrvrolemember @loginame = N'kasra', @rolename = N'bulkadmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'kasra', @rolename = N'dbcreator'
GO
EXEC master..sp_addsrvrolemember @loginame = N'kasra', @rolename = N'diskadmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'kasra', @rolename = N'processadmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'kasra', @rolename = N'securityadmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'kasra', @rolename = N'serveradmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'kasra', @rolename = N'setupadmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'kasra', @rolename = N'sysadmin'
GO
--========================================================================


Alter LOGIN [kasra] WITH CHECK_POLICY = OFF

--Alter LOGIN [kasra] WITH PASSWORD = 0x010056049B0E219BCA9076EDB1BC0C7171586C49B975EFAAC0E7 HASHED
Alter LOGIN [kasra] WITH PASSWORD = 0x010056049B0E4A9BE83A250C3DF64BB86C3F680DE0FA8015EBCC HASHED

Alter LOGIN [kasra] WITH CHECK_POLICY = ON