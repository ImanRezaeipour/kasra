Declare @StrSql nvarchar(max)=''

----=======================================================
----ComputedColumns
Declare Crs_DropComputedCol cursor fast_forward read_only local for
	Select	DropComputedCol
	From dbo.TbComputed

open Crs_DropComputedCol
fetch next from Crs_DropComputedCol into @StrSql

While @@FETCH_STATUS=0
Begin
	print (@StrSQL)
	Exec(@StrSQL)
	fetch next from Crs_DropComputedCol into @StrSql
End

Close Crs_DropComputedCol
Deallocate Crs_DropComputedCol
go
------=======================================================
------Constraint
Declare @StrSql nvarchar(max)=''
Declare Crs_DropConstraint cursor fast_forward read_only local for
	Select	DropConstraint
	From dbo.TbConstraint

open Crs_DropConstraint
fetch next from Crs_DropConstraint into @StrSql

While @@FETCH_STATUS=0
Begin
	print (@StrSQL)
	Exec(@StrSQL)
	fetch next from Crs_DropConstraint into @StrSql
End

Close Crs_DropConstraint
Deallocate Crs_DropConstraint
Go
----------=======================================================
------default
Declare @StrSql nvarchar(max)=''
Declare Crs_Dropdefault cursor fast_forward read_only local for
	Select	DropDefult
	From dbo.Tbdefault

open Crs_Dropdefault
fetch next from Crs_Dropdefault into @StrSql

While @@FETCH_STATUS=0
Begin
	print (@StrSQL)
	Exec(@StrSQL)
	fetch next from Crs_Dropdefault into @StrSql
End

Close Crs_Dropdefault
Deallocate Crs_Dropdefault
Go
----=======================================================
------Index
Declare @StrSql nvarchar(max)=''
Declare Crs_DropIndex cursor fast_forward read_only local for
	Select	DropIndex
	From dbo.TbIndex

open Crs_DropIndex
fetch next from Crs_DropIndex into @StrSql

While @@FETCH_STATUS=0
Begin
	print (@StrSQL)
	Exec(@StrSQL)
	fetch next from Crs_DropIndex into @StrSql
End

Close Crs_DropIndex
Deallocate Crs_DropIndex
Go
------=======================================================
--------FK
Declare @StrSql nvarchar(max)=''
Declare Crs_DropFK cursor fast_forward read_only local for
	Select	DropFK
	From dbo.TbFK

open Crs_DropFK
fetch next from Crs_DropFK into @StrSql

While @@FETCH_STATUS=0
Begin
	print (@StrSQL)
	Exec(@StrSQL)
	fetch next from Crs_DropFK into @StrSql
End

Close Crs_DropFK
Deallocate Crs_DropFK
Go
--=======================================================
------PK
Declare @StrSql nvarchar(max)=''
Declare Crs_DropPK cursor fast_forward read_only local for
	Select	DropPK
	From dbo.TbPK

open Crs_DropPK
fetch next from Crs_DropPK into @StrSql

While @@FETCH_STATUS=0
Begin
	print (@StrSQL)
	Exec(@StrSQL)
	fetch next from Crs_DropPK into @StrSql
End

Close Crs_DropPK
Deallocate Crs_DropPK
Go
------------=======================================================
------------View
Declare @StrSql nvarchar(max)=''
Declare Crs_DropView cursor fast_forward read_only local for
	Select	DropView
	From dbo.TbView

open Crs_DropView
fetch next from Crs_DropView into @StrSql

While @@FETCH_STATUS=0
Begin
	print (@StrSQL)
	Exec(@StrSQL)
	fetch next from Crs_DropView into @StrSql
End

Close Crs_DropView
Deallocate Crs_DropView
Go
--------------=======================================================
----------Function
Declare @StrSql nvarchar(max)=''
Declare Crs_DropFunction cursor fast_forward read_only local for
	Select	DropFunction
	From dbo.TbFunction

open Crs_DropFunction
fetch next from Crs_DropFunction into @StrSql

While @@FETCH_STATUS=0
Begin
	print (@StrSQL)
	Exec(@StrSQL)
	fetch next from Crs_DropFunction into @StrSql
End

Close Crs_DropFunction
Deallocate Crs_DropFunction
Go
--------------=======================================================
----------View 
Declare @StrSql nvarchar(max)=''
Declare Crs_DropView cursor fast_forward read_only local for
	Select	DropView
	From dbo.TbView

open Crs_DropView
fetch next from Crs_DropView into @StrSql

While @@FETCH_STATUS=0
Begin
	print (@StrSQL)
	Exec(@StrSQL)
	fetch next from Crs_DropView into @StrSql
End

Close Crs_DropView
Deallocate Crs_DropView
Go
------=======================================================	