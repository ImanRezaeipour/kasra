use Framework
Go
---------------------------------------------------------
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[udfGetPriceFood]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[udfGetPriceFood]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[GetSettingAndError]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[GetSettingAndError]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Att].[udfGetCardexRemain]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Att].[udfGetCardexRemain]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[GetFoodsName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[GetFoodsName]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[GetRemainDetailCreditOld]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[GetRemainDetailCreditOld]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[GetRemainDetailCredit]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[GetRemainDetailCredit]

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Gnr].[BatchEnterDataType]') AND name = N'PK_Gnr].[BatchEnterDataType')  
 ALTER TABLE [Gnr].[BatchEnterDataType]  DROP CONSTRAINT [PK_Gnr]].[BatchEnterDataType]
 
IF not EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Gnr].[BatchEnterDataType]') AND name = N'PK_Gnr].[BatchEnterDataType')   
alter table [Gnr].[BatchEnterDataType] add constraint [PK_BatchEnterDataType]   primary key(ID ASC ) 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Att].[udfMakevScripts]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Att].[udfMakevScripts]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[GetFoodName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[GetFoodName]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Att].[udfCheckCodeLimitation]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Att].[udfCheckCodeLimitation]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[GetRemainDetailCreditOld]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[GetRemainDetailCreditOld]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[GetrangeDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[GetrangeDate]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[GetCreditByDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[GetCreditByDate]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[GetServiceName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[GetServiceName]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[GetCredit]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[GetCredit]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[GetServicePrice]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[GetServicePrice]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[GetQtyMaterial]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[GetQtyMaterial]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[udfGetReserveDetailFoodNametitle]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[udfGetReserveDetailFoodNametitle]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[udfGetReserveFoodName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[udfGetReserveFoodName]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[GetRemainCreditForShowCardex]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[GetRemainCreditForShowCardex]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[udfGetFoodNoTitle]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[udfGetFoodNoTitle]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[udfGetReserveDetailFoodName_UnUsage]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[udfGetReserveDetailFoodName_UnUsage]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[GetPriceOfReserveInNowDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[GetPriceOfReserveInNowDate]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[GetPriceOfReserve]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[GetPriceOfReserve]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[udfGetPriceAllFood]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[udfGetPriceAllFood]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rst].[udfGetFoodName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [Rst].[udfGetFoodName]

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Att].[VScriptforexec]'))
DROP VIEW [Att].[VScriptforexec]

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Att].[vScripts]'))
DROP VIEW [Att].[vScripts]

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Att].[vWFLogTa_Deleted]'))
DROP VIEW [Att].[vWFLogTa_Deleted]

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Karaee]'))
DROP VIEW [dbo].[Karaee]

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PersJob]'))
DROP VIEW [dbo].[PersJob]

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vCredit]'))
DROP VIEW [dbo].[vCredit]

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vCredit_All]'))
DROP VIEW [dbo].[vCredit_All]

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vHasFlow]'))
DROP VIEW [dbo].[vHasFlow]

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VIEW1]'))
DROP VIEW [dbo].[VIEW1]

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VIEW2]'))
DROP VIEW [dbo].[VIEW2]

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vIfCredit]'))
DROP VIEW [dbo].[vIfCredit]

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vIsStartHasFlow]'))
DROP VIEW [dbo].[vIsStartHasFlow]

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vNotHasFlow]'))
DROP VIEW [dbo].[vNotHasFlow]

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vTACardTaradodCredit]'))
DROP VIEW [dbo].[vTACardTaradodCredit]

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vTACardTaradodCredit_All]'))
DROP VIEW [dbo].[vTACardTaradodCredit_All]

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Rst].[vPersonCardId]'))
DROP VIEW [Rst].[vPersonCardId]

Declare @StrView nvarchar(4000)=''
Select @StrView=@StrView+' DROP VIEW [dbo].'+o.name
FROM sys.objects o
inner join sys.schemas s on s.schema_id=o.schema_id
where [type] in ('V')	
and O.name like 'vTACredit%' and s.name='dbo'

Exec(@StrView)

----=======================================================

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Gim].[FK_PermissionGuest _DLookup1]') AND parent_object_id = OBJECT_ID(N'[Gim].[PermissionGuest]'))
ALTER TABLE [Gim].[PermissionGuest] DROP CONSTRAINT [FK_PermissionGuest _DLookup1]

IF not EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Gim].[FK_PermissionGuest_DLookup1]') AND parent_object_id = OBJECT_ID(N'[Gim].[PermissionGuest]'))
ALTER TABLE [Gim].[PermissionGuest]  WITH NOCHECK ADD  CONSTRAINT [FK_PermissionGuest_DLookup1] FOREIGN KEY([CardTypeID])
REFERENCES [Gnr].[DLookup] ([ID])

