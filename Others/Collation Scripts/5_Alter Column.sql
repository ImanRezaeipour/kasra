Declare @StrSql nvarchar(max)=''

--=======================================================
--ChangeType
Declare Crs_DropColumn cursor fast_forward read_only local for
	Select	ChangeType
	From dbo.TbColumn
	where tablename <>'TbColumn'
		and TypeName in ('varchar', 'char', 'text')

open Crs_DropColumn
fetch next from Crs_DropColumn into @StrSql

While @@FETCH_STATUS=0
Begin
	print (@StrSQL)
	Exec(@StrSQL)
	fetch next from Crs_DropColumn into @StrSql
End

Close Crs_DropColumn
Deallocate Crs_DropColumn

--=======================================================
Alter Table [Rpt].[RptOption] Add  Header1 ntext  COLLATE SQL_Latin1_General_CP1_CI_AS
Alter Table [Rpt].[RptOption] Add Footer1 ntext  COLLATE SQL_Latin1_General_CP1_CI_AS
Alter Table [Rpt].[RptOption] Add [PageNumber1] [int] NULL
Alter Table [Rpt].[RptOption] Add	[CompanyName1] [nvarchar](200) NULL
Alter Table [Rpt].[RptOption] Add	[Logo1] [image] NULL
Alter Table [Rpt].[RptOption] Add	[LogoFormat1] [nvarchar](10) NULL
Alter Table [Rpt].[RptOption] Add	[ShowFilter1] [int] NULL
Alter Table [Rpt].[RptOption] Add	[ReportFile1] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS
Alter Table [Rpt].[RptOption] Add	[ShowAdvFilterInPage1] [int] NULL
Alter Table [Rpt].[RptOption] Add	[setControl1] [int] NULL

declare @Str nvarchar(max)=N'
update Rpt.RptOption Set 
Header=Header1,
Footer=Footer1, 
PageNumber=PageNumber1, 
CompanyName=CompanyName1, 
Logo=Logo1, 
LogoFormat=LogoFormat1, 
ShowFilter=ShowFilter1, 
ReportFile=ReportFile1, 
ShowAdvFilterInPage=ShowAdvFilterInPage1, 
setControl=setControl1'

exec(@Str)

Alter Table [Rpt].[RptOption] drop column  Header
Alter Table [Rpt].[RptOption] drop column  Footer 
Alter Table [Rpt].[RptOption] drop column  [PageNumber]
Alter Table [Rpt].[RptOption] drop column 	[CompanyName] 
Alter Table [Rpt].[RptOption] drop column 	[Logo]
Alter Table [Rpt].[RptOption] drop column 	[LogoFormat] 
Alter Table [Rpt].[RptOption] drop column 	[ShowFilter] 
Alter Table [Rpt].[RptOption] drop column 	[ReportFile] 
Alter Table [Rpt].[RptOption] drop column 	[ShowAdvFilterInPage]
Alter Table [Rpt].[RptOption] drop column 	[setControl]


exec sp_Rename  '[Rpt].[RptOption].Header1','Header'
exec sp_Rename  '[Rpt].[RptOption].Footer1' ,'Footer'
exec sp_Rename  '[Rpt].[RptOption].[PageNumber1]','PageNumber'
exec sp_Rename  '[Rpt].[RptOption].[CompanyName1]' ,'CompanyName'
exec sp_Rename  '[Rpt].[RptOption].[Logo1]','Logo'
exec sp_Rename  '[Rpt].[RptOption].[LogoFormat1]' ,'LogoFormat'
exec sp_Rename  '[Rpt].[RptOption].[ShowFilter1]' ,'ShowFilter'
exec sp_Rename  '[Rpt].[RptOption].[ReportFile1]','ReportFile'
exec sp_Rename  '[Rpt].[RptOption].[ShowAdvFilterInPage1]','ShowAdvFilterInPage'
exec sp_Rename  '[Rpt].[RptOption].[setControl1]','setControl'





