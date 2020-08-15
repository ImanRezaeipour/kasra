use Framework
go

Declare @StrSql nvarchar(max)=''

--=======================================================
--ChangeCollation
Declare Crs_DropColumn cursor fast_forward read_only local for
	Select	ChangeCollation
	From dbo.TbColumn
	where tablename not in('TbColumn','dbo.TbComputed','dbo.TbConstraint','dbo.Tbdefault','dbo.TbFK','dbo.TbView')

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
--===========================================================
Alter Table Uif.PageGrid Alter column SqlQuery ntext  COLLATE SQL_Latin1_General_CP1_CI_AS null
Alter Table Rpt.PageReport Alter column ReportFile ntext  COLLATE SQL_Latin1_General_CP1_CI_AS null
Alter Table Rpt.Template Alter column Query ntext  COLLATE SQL_Latin1_General_CP1_CI_AS null
