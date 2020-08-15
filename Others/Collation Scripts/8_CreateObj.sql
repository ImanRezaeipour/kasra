use Framework
go

Declare @StrSql nvarchar(max)=''

----=======================================================
----PK
Declare Crs_CreatePK cursor fast_forward read_only local for
	Select distinct	CreatePK
	From dbo.TbPK

open Crs_CreatePK
fetch next from Crs_CreatePK into @StrSql

While @@FETCH_STATUS=0
Begin
	print (@StrSQL)
	Exec(@StrSQL)
	fetch next from Crs_CreatePK into @StrSql
End

Close Crs_CreatePK
Deallocate Crs_CreatePK
print 'Create PK'
Go
----=======================================================
Declare @StrSql nvarchar(max)=''
--Function & View
Exec uspExecSript null
Go
print 'Function & View'
----=======================================================
------ComputedColumns
Declare @StrSql nvarchar(max)=''
Declare Crs_CreateComputedCol cursor fast_forward read_only local for
	Select	CreateComputedCol
	From dbo.TbComputed

open Crs_CreateComputedCol
fetch next from Crs_CreateComputedCol into @StrSql

While @@FETCH_STATUS=0
Begin
	print (@StrSQL)
	Exec(@StrSQL)
	fetch next from Crs_CreateComputedCol into @StrSql
End

Close Crs_CreateComputedCol
Deallocate Crs_CreateComputedCol
Go
print 'ComputedColumns'
----=======================================================
------------Function
--------Declare Crs_CreateFunction cursor fast_forward read_only local for
--------	Select	CreateFunction
--------	From dbo.TbFunction

--------open Crs_CreateFunction
--------fetch next from Crs_CreateFunction into @StrSql

--------While @@FETCH_STATUS=0
--------Begin
--------	print (@StrSQL)
--------	Exec(@StrSQL)
--------	fetch next from Crs_CreateFunction into @StrSql
--------End

--------Close Crs_CreateFunction
--------Deallocate Crs_CreateFunction
----------=======================================================
--------------View
--------Declare Crs_CreateView cursor fast_forward read_only local for
--------	Select	CreateView
--------	From dbo.TbView

--------open Crs_CreateView
--------fetch next from Crs_CreateView into @StrSql

--------While @@FETCH_STATUS=0
--------Begin
--------	print (@StrSQL)
--------	Exec(@StrSQL)
--------	fetch next from Crs_CreateView into @StrSql
--------End

--------Close Crs_CreateView
--------Deallocate Crs_CreateView
--------=======================================================
----FK
Declare @StrSql nvarchar(max)=''
Declare Crs_CreateFK cursor fast_forward read_only local for
	Select	CreateFK
	From dbo.TbFK

open Crs_CreateFK
fetch next from Crs_CreateFK into @StrSql

While @@FETCH_STATUS=0
Begin
	print (@StrSQL)
	Exec(@StrSQL)
	fetch next from Crs_CreateFK into @StrSql
End

Close Crs_CreateFK
Deallocate Crs_CreateFK
Go
print 'Create FK'
--=======================================================
------Constraint
Declare @StrSql nvarchar(max)=''
Declare Crs_CreateConstraint cursor fast_forward read_only local for
	Select	CreateConstraint
	From dbo.TbConstraint

open Crs_CreateConstraint
fetch next from Crs_CreateConstraint into @StrSql

While @@FETCH_STATUS=0
Begin
	print (@StrSQL)
	Exec(@StrSQL)
	fetch next from Crs_CreateConstraint into @StrSql
End

Close Crs_CreateConstraint
Deallocate Crs_CreateConstraint
Go
print 'Create Constraint'
--=======================================================
------default
Declare @StrSql nvarchar(max)=''
Declare Crs_Createdefault cursor fast_forward read_only local for
	Select	CreateDefult
	From dbo.Tbdefault

open Crs_Createdefault
fetch next from Crs_Createdefault into @StrSql

While @@FETCH_STATUS=0
Begin
	print (@StrSQL)
	Exec(@StrSQL)
	fetch next from Crs_Createdefault into @StrSql
End

Close Crs_Createdefault
Deallocate Crs_Createdefault
Go
print 'Create default'
--=======================================================
------Index
Declare @StrSql nvarchar(max)=''
Declare Crs_CreateIndex cursor fast_forward read_only local for
	Select	CreateIndex
	From dbo.TbIndex

open Crs_CreateIndex
fetch next from Crs_CreateIndex into @StrSql

While @@FETCH_STATUS=0
Begin
	print (@StrSQL)
	Exec(@StrSQL)
	fetch next from Crs_CreateIndex into @StrSql
End

Close Crs_CreateIndex
Deallocate Crs_CreateIndex
Go
print 'Create Index'
----=======================================================
----ComputedColumns
Declare @StrSql nvarchar(max)=''
Declare Crs_CreateComputedCol cursor fast_forward read_only local for
	Select	CreateComputedCol
	From dbo.TbComputed

open Crs_CreateComputedCol
fetch next from Crs_CreateComputedCol into @StrSql

While @@FETCH_STATUS=0
Begin
	print (@StrSQL)
	Exec(@StrSQL)
	fetch next from Crs_CreateComputedCol into @StrSql
End

Close Crs_CreateComputedCol
Deallocate Crs_CreateComputedCol
Go
print 'Create ComputedColumns'
------=======================================================	