IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TbComputed]') AND type in (N'U'))
DROP TABLE [dbo].[TbComputed]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TbConstraint]') AND type in (N'U'))
DROP TABLE [dbo].[TbConstraint]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbdefault]') AND type in (N'U'))
DROP TABLE [dbo].[Tbdefault]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TbIndex]') AND type in (N'U'))
DROP TABLE [dbo].[TbIndex]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TbFK]') AND type in (N'U'))
DROP TABLE [dbo].[TbFK]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TbPK]') AND type in (N'U'))
DROP TABLE [dbo].[TbPK]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TbView]') AND type in (N'U'))
DROP TABLE [dbo].[TbView]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TbFunction]') AND type in (N'U'))
DROP TABLE [dbo].[TbFunction]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TbColumn]') AND type in (N'U'))
DROP TABLE [dbo].[TbColumn]
----=======================================================
----=======================================================
----ComputedColumns
select distinct 
	' If Exists(Select * From Sys.Columns C inner join Sys.Objects O on C.object_id=O.object_id inner join sys.schemas S on o.schema_id=S.schema_id
					Where C.Name='''+c.name+''' And O.Name='''+t.name+''' and S.name='''+s.name+''') ALTER TABLE ['+S.Name+'].['+t.NAME+'] DROP COLUMN ['+c.name+']' DropComputedCol,
	' If not Exists(Select * From Sys.Columns C inner join Sys.Objects O on C.object_id=O.object_id inner join sys.schemas S on o.schema_id=S.schema_id
					Where C.Name='''+c.name+''' And O.Name='''+t.name+''' and S.name='''+s.name+''') ALTER TABLE ['+S.Name+'].['+t.NAME+'] Add ['+c.name+'] as '+c.[definition] CreateComputedCol
into dbo.TbComputed	
	FROM sys.computed_columns C
	inner join Sys.tables t on t.object_id=c.object_id --and cc.object_id=t.object_id
	inner join sys.schemas s on t.schema_id=s.schema_id
--	INNER JOIN sys.types tt ON (tt.user_type_id = c.user_type_id)
	WHERE c.is_computed = 1 --and tt.[name] IN ('varchar', 'char', 'nvarchar', 'nchar')
--=======================================================	
------Constraint
select 
'ALTER TABLE ['+S.Name+'].['+t.NAME+'] DROP CONSTRAINT ['+o.name+']' DropConstraint,
'ALTER TABLE ['+S.Name+'].['+t.NAME+'] ADD CONSTRAINT ['+o.name+'] CHECK  '+sc.text  CreateConstraint
into dbo.TbConstraint
from sys.objects o
inner join Sys.tables t on t.object_id=o.parent_object_id
inner join sys.schemas s on t.schema_id=s.schema_id
inner join sys.syscomments sc on O.object_id=sc.id
--inner join  sys.columns c on (o.object_id = c.object_id)
--INNER JOIN sys.types tt ON (tt.user_type_id = c.user_type_id)
WHERE 
--tt.[name] IN ('varchar', 'char', 'nvarchar', 'nchar')
--and c.collation_name='Arabic_CI_AS' and
 o.type_desc='CHECK_CONSTRAINT'
--=======================================================
--Index	
declare @ssh nvarchar(500)='',@ss1h nvarchar(500),@ss2h nvarchar(500),@ss3h nvarchar(500),@ss4h nvarchar(500),@ss5h nvarchar(500)=''
,@sssh nvarchar(500)='',@ss33h nvarchar(500),@ss44h nvarchar(500),@ss55h nvarchar(500)=''
create TAble #aah(IncludeCol nvarchar(2000),IndexCol nvarchar(2000),indexName nvarchar (200),
TableName nvarchar(200), SchemaName nvarchar(20))

Declare @StrIndex nvarchar(2000)='',@StrIndexINC nvarchar(2000)=''
Declare @indexName nvarchar(200)='', @TableName nvarchar(100)='', @SchemaName nvarchar(50)=''
 
Declare Crs_Index Cursor Fast_Forward Read_Only Local for
select distinct ind.name indexName, t.name TableName, s.name SchemaName
 FROM sys.indexes ind 
INNER JOIN sys.index_columns ic  ON  ind.object_id = ic.object_id and ind.index_id = ic.index_id 
INNER JOIN sys.columns col ON ic.object_id = col.object_id and ic.column_id = col.column_id 
INNER JOIN sys.tables t ON ind.object_id = t.object_id 
inner join sys.schemas s on t.schema_id=s.schema_id --shm
INNER JOIN sys.types tt ON (tt.user_type_id = col.user_type_id)
WHERE (1=1) 
    AND ind.is_primary_key = 0 
    --AND ind.is_unique = 0 
    AND ind.is_unique_constraint = 0 
    AND t.is_ms_shipped = 0 
   and tt.[name] IN ('varchar', 'char', 'nvarchar', 'nchar')
and col.collation_name='Arabic_CI_AS'
and ind.is_primary_key=0


 open Crs_Index
 Fetch next from Crs_Index Into @indexName, @TableName, @SchemaName
 
 while @@fetch_status=0
 Begin
	Select @StrIndex='', @StrIndexINC=''
	Select distinct @StrIndex=@StrIndex+case @StrIndex when '' then col.name+' ASC ' else ','+col.name+' ASC ' end
		 FROM sys.indexes ind 
		 INNER JOIN sys.tables t ON ind.object_id = t.object_id 
		inner join sys.schemas s on t.schema_id=s.schema_id --shm
		INNER JOIN sys.index_columns ic ON  ind.object_id = ic.object_id and ind.index_id = ic.index_id
		INNER JOIN sys.columns col 
			ON ic.object_id = col.object_id and ic.column_id = col.column_id 
		where is_included_Column=0 and ind.name=@indexName --'IX_Date_CardKhanNo_INC'
			and t.name=@TableName and s.name=@SchemaName 
		 
		 Select distinct @StrIndexINC=@StrIndexINC+case @StrIndexINC when '' then col.name else ','+col.name end
		 FROM sys.indexes ind 
		 INNER JOIN sys.tables t ON ind.object_id = t.object_id 
		inner join sys.schemas s on t.schema_id=s.schema_id --shm
		INNER JOIN sys.index_columns ic ON  ind.object_id = ic.object_id and ind.index_id = ic.index_id
		INNER JOIN sys.columns col 
			ON ic.object_id = col.object_id and ic.column_id = col.column_id 
		where is_included_Column=1 and ind.name=@indexName --'IX_Date_CardKhanNo_INC' 
		and t.name=@TableName and s.name=@SchemaName

		--select @StrIndex, @StrIndexINC
		
		 insert into #aah (IncludeCol,IndexCol,indexName, TableName, SchemaName)
		values(@StrIndexINC, @StrIndex, @indexName, @TableName, @SchemaName) 
	
	 Fetch next from Crs_Index Into @indexName, @TableName, @SchemaName	
 End
 
 Close Crs_Index
 Deallocate Crs_Index

select 
'IF not EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'''+'['+s.name+'].['+t.name+']'+''') AND name = N'''+ind.name+''') 
CREATE NONCLUSTERED INDEX ['+ind.name+'] ON ['+s.name+'].['+t.name+'] 
('+ah.IndexCol+ ')'
+case when isnull(IncludeCol, '')='' then '' else 'Include ('+ah.IncludeCol COLLATE SQL_Latin1_General_CP1_CI_AS+')' end
+'WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON'+
case when ind.fill_factor>0 then ' ,FILLFACTOR='+CAST(fill_factor as nvarchar(20)) else '' end +') ON [PRIMARY]
' CreateIndex,
'IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'''+'['+s.name+'].['+t.name+']'+''') AND name = N'''+ind.name+''')
DROP INDEX ['+ind.name+'] ON ['+s.name+'].['+t.name+'] WITH ( ONLINE = OFF )' DropIndex
into dbo.TbIndex
FROM sys.indexes ind 
INNER JOIN sys.tables t 
    ON ind.object_id = t.object_id 
    inner join sys.schemas s on t.schema_id=s.schema_id --shm
INNER join #aah ah on ah.indexName COLLATE SQL_Latin1_General_CP1_CI_AS=ind.name --and ah.IncludeCol<>''
and t.name=ah.TableName and s.name=ah.SchemaName
WHERE (1=1) 
    AND ind.is_primary_key = 0 
    AND ind.is_unique_constraint = 0 
    AND t.is_ms_shipped = 0 
    
ORDER BY 
    t.name, ind.name, ind.index_id

drop table #aah	

--=======================================================	
--PK
Declare @SchName nvarchar(3), @TbName nvarchar(100), @CONSTRAINTNAME nvarchar(500), @StrPK nvarchar(2000)=''
 
Create Table dbo.TbPK(CreatePK nvarchar(4000), DropPK nvarchar(4000)) 

Declare Crs_PK Cursor Fast_Forward Read_Only For
SELECT  TC.TABLE_SCHEMA, TABLE_NAME, CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS TC
WHERE
TC.CONSTRAINT_TYPE = 'PRIMARY KEY'----FOREIGN KEY 
--and TC.TABLE_NAME='Attendance' and TC.TABLE_SCHEMA='Att'

open Crs_PK
Fetch next from Crs_PK into @SchName, @TbName, @CONSTRAINTNAME

While @@FETCH_STATUS=0
Begin
	Set @StrPK=''
	Select @StrPK=@StrPK+case @StrPK when '' then KCU.COLUMN_NAME+' ASC ' else ','+KCU.COLUMN_NAME+' ASC ' end
	from INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU
	Where  	CONSTRAINT_NAME = @CONSTRAINTNAME
		AND TABLE_NAME = @TbName
		AND TABLE_SCHEMA = @SchName

	Insert dbo.TbPK
	(DropPK, CreatePK)
	Select 'IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'''+'['+@SchName+'].['+@TbName+']'+''') AND name = N'''+@CONSTRAINTNAME+''')
	ALTER TABLE ['+@SchName+'].['+@TbName+'] DROP CONSTRAINT ['+case @CONSTRAINTNAME when 'PK_Gnr].[BatchEnterDataType' 
	then 'PK_Gnr]].[BatchEnterDataType' else @CONSTRAINTNAME end+']' ,
	'IF not EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'''+'['+@SchName+'].['+@TbName+']'+''') AND name = N'''+@CONSTRAINTNAME+''')
	alter table ['+@SchName+'].['+@TbName+'] add constraint ['+case @CONSTRAINTNAME when 'PK_Gnr].[BatchEnterDataType' 
	then 'PK_BatchEnterDataType' else @CONSTRAINTNAME end +']
	primary key('+@StrPK COLLATE SQL_Latin1_General_CP1_CI_AS+')' 


	Fetch next from Crs_PK into @SchName, @TbName, @CONSTRAINTNAME
End

Close Crs_PK
Deallocate Crs_PK
--=======================================================	
--FK
SELECT distinct 
	'IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'''+'['+TC.TABLE_SCHEMA+'].'+'['+fk.name+']'+''') AND parent_object_id = OBJECT_ID(N'''+'['+TC.TABLE_SCHEMA+'].'+'['+OBJECT_NAME(fk.parent_object_id)+']'+'''))
	ALTER TABLE ['+TC.TABLE_SCHEMA+'].['+OBJECT_NAME(fk.parent_object_id)+'] DROP CONSTRAINT ['+fk.name+']' dropFK,
	'IF  Not EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'''+'['+TC.TABLE_SCHEMA+'].'+'['+fk.name+']'+''') AND parent_object_id = OBJECT_ID(N'''+'['+TC.TABLE_SCHEMA+'].'+'['+OBJECT_NAME(fk.parent_object_id)+']'+''')) 
	ALTER TABLE ['+TC.TABLE_SCHEMA+'].['+OBJECT_NAME(fk.parent_object_id)+']'+case fk.is_not_trusted when 1 then ' WITH NOCHECK ' else '' end +
	' add CONSTRAINT '+fk.name+' FOREIGN KEY ('+COL_NAME(fkc.parent_object_id,fkc.parent_column_id)+') 
	REFERENCES ['+Sr.Name+'].['+OBJECT_NAME (fk.referenced_object_id)+'] (['+COL_NAME(fkc.referenced_object_id,fkc.referenced_column_id)+'])' CreateFK
Into dbo.TbFK
From
	sys.foreign_keys AS fk
	INNER JOIN sys.foreign_key_columns AS fkc ON fk.OBJECT_ID = fkc.constraint_object_id
	INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS TC on TC.TABLE_NAME=OBJECT_NAME(fk.parent_object_id) --(fk.referenced_object_id)--(fk.parent_object_id)
	and TC.CONSTRAINT_Name=fk.Name 
	JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KCU
ON KCU.CONSTRAINT_SCHEMA = TC.CONSTRAINT_SCHEMA
AND KCU.CONSTRAINT_NAME = TC.CONSTRAINT_NAME
AND KCU.TABLE_SCHEMA = TC.TABLE_SCHEMA
AND KCU.TABLE_NAME = TC.TABLE_NAME
inner join sys.tables t on t.object_id=fk.parent_object_id ---referenced_object_id 
inner join sys.schemas s on t.schema_id=s.schema_id and Tc.CONSTRAINT_SCHEMA=s.name
inner join sys.tables tr on tr.object_id=fk.referenced_object_id ---referenced_object_id 
inner join sys.schemas sr on tr.schema_id=sr.schema_id 
where TC.CONSTRAINT_TYPE = 'FOREIGN KEY'----FOREIGN KEY 	
--=======================================================
----View
Create Table dbo.TbView(ID int Identity(1, 1), CreateView ntext, DropView nvarchar(2000))

Insert dbo.TbView
(CreateView , DropView)
Select sc.text CreateView, 
--'IF not EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'''+s.name+'.'+o.name+''')) ' CreateCondition,
'IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'''+s.name+'.'+o.name+''')) Drop  VIEW '+s.name+'.'+o.name DropView
----Into dbo.TbView
FROM sys.syscomments sc
	inner join sys.objects  O on O.object_id=sc.id
	inner join sys.schemas S on S.SCHEMA_ID=o.schema_id
WHERE  [type] in (N'V')	
--=======================================================	
----Function
Create Table dbo.TbFunction(ID int Identity(1, 1), CreateFunction ntext, DropFunction nvarchar(2000))

Insert dbo.TbFunction
(CreateFunction , DropFunction)
Select  --' IF not EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'''+s.name+'.'+o.name+''') AND type in (N''FN'', N''IF'', N''TF'', N''FS'', N''FT'')) ' CreateCondition,
sc.text CreateFunction, 
' IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'''+s.name+'.'+o.name+''') AND type in (N''FN'', N''IF'', N''TF'', N''FS'', N''FT'')) Drop  FUNCTION '+s.name+'.'+o.name DropFunction
----Into dbo.TbFunction
FROM sys.syscomments sc
	inner join sys.objects  O on O.object_id=sc.id
	inner join sys.schemas S on S.SCHEMA_ID=o.schema_id
WHERE  [type] in (N'FN', N'IF', N'TF', N'FS', N'FT')	
--=======================================================
--char_Column
SELECT --IDENTITY(1, 1) ID,
s.[name] schemaName
, o.[name] TableName, c.[name] columnName, t.[name] TypeName
, 'If Exists(Select * From Sys.Columns C inner join Sys.Objects O on C.object_id=O.object_id inner join sys.schemas S on o.schema_id=S.schema_id
					Where C.Name='''+c.name+''' And O.Name='''+o.name+''' and S.name='''+s.name+''')	 ALTER TABLE [' + s.[name] + '].[' + o.[name] + '] ALTER COLUMN [' + c.[name] + '] ' 
+ case when t.[name]='varchar' then 'nvarchar' when t.[name]='char' then 'nchar' when t.[name]='text' then 'ntext' else t.[name] end+ '(' + 
CASE WHEN c.max_length = -1 THEN 'MAX' ELSE Case When t.[name] IN ('nvarchar', 'nchar')Then CONVERT(VARCHAR(50), c.max_length/2)Else CONVERT(VARCHAR(50), c.max_length)End  END + ') '
+case when c.IS_Nullable=1 then ' Null' else ' NOT NULL' end AS ChangeType
, 'If Exists(Select * From Sys.Columns C inner join Sys.Objects O on C.object_id=O.object_id inner join sys.schemas S on o.schema_id=S.schema_id
					Where C.Name='''+c.name+''' And O.Name='''+o.name+''' and S.name='''+s.name+''') ALTER TABLE [' + s.[name] + '].[' + o.[name] + '] ALTER COLUMN [' + c.[name] + '] '
+ case when t.[name]='varchar' then 'nvarchar' when t.[name]='char' then 'nchar' when t.[name]='text' then 'ntext' else t.[name] end+ '(' + 
CASE WHEN c.max_length = -1 THEN 'MAX' ELSE Case When t.[name] IN ('nvarchar', 'nchar')Then CONVERT(VARCHAR(50), c.max_length/2)Else CONVERT(VARCHAR(50), c.max_length)End  END + ') 
					COLLATE SQL_Latin1_General_CP1_CI_AS '
+case when c.IS_Nullable=1 then ' Null' else ' NOT NULL' end AS ChangeCollation
into dbo.TbColumn
FROM sys.columns c
INNER JOIN sys.objects o ON (o.object_id = c.object_id)
INNER JOIN sys.schemas s ON (s.schema_id = o.schema_id)
INNER JOIN sys.types t ON (t.user_type_id = c.user_type_id)
WHERE
-- s.[name] = 'dbo' AND 
t.[name] IN ('varchar', 'char', 'nvarchar', 'nchar','ntext', 'xml')
--and c.collation_name='Arabic_CI_AS'
--and s.[name]<>'sys'
and type_desc ='USER_TABLE'	
--=======================================================	
--default 
Select 'If Exists(Select * from sys.default_constraints where name='''+ dc.name+''' ) ALTER TABLE ['+S.Name+'].['+t.NAME+'] DROP CONSTRAINT ['+dc.name+']' DropDefult,
		'If not Exists(Select * from sys.default_constraints where name='''+ dc.name+''' ) ALTER TABLE ['+S.Name+'].['+t.NAME+']  ADD CONSTRAINT '+ dc.name+' DEFAULT '+dc.[definition]+' FOR '+c.name CreateDefult
into Tbdefault		
from sys.default_constraints dc
inner join sys.tables t on dc.parent_object_id=t.object_id
inner join sys.schemas s on t.schema_id=s.schema_id
inner join sys.columns c on c.object_id=t.object_id and c.column_id=dc.parent_column_id
	
----------------------------------------------------------








