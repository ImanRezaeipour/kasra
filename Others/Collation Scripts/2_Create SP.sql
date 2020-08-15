use Framework
Go

Create Proc uspExecSript
@StrSQL ntext
As
	Declare @i int=1,
			@MSG nvarchar(2000)
	--View
	While @i<=(Select top 1 ID From TbView order by ID Desc)
	Begin
		Select @StrSQL=CreateView
		From TbView
		Where ID=@i
		
		--Print @StrSQL
		--begin try
			Exec(@StrSQL)
		--end try
		--begin catch
		--	Set @MSG=ERROR_MESSAGE()+'#'+cast(ERROR_NUMBER() as nvarchar(20))+'#'+Left(cast(@StrSQL as nvarchar(2000)), 500)
		--	if ERROR_NUMBER()=102
		--		print @msg
		--end catch
		
		Set @i=@i+1
	End
	
	Set @i=1
	--Function
	While @i<=(Select top 1 ID From TbFunction order by ID Desc)
	Begin
		Select @StrSQL=CreateFunction
		From TbFunction
		Where ID=@i
		
		--Print @StrSQL
		--begin try
			Exec(@StrSQL)
		--end try
		--begin catch
		--	Set @MSG=ERROR_MESSAGE()+'#'+cast(ERROR_NUMBER() as nvarchar(20))+'#'+Left(cast(@StrSQL as nvarchar(2000)), 500)
		--	if ERROR_NUMBER()=102
		--		print @msg
		--end catch
		
		Set @i=@i+1
	End
	
	Set @i=1
	--View
	While @i<=(Select top 1 ID From TbView order by ID Desc)
	Begin
		Select @StrSQL=CreateView
		From TbView
		Where ID=@i
		
		--Print @StrSQL
		--begin try
			Exec(@StrSQL)
		--end try
		--begin catch
		--	Set @MSG=ERROR_MESSAGE()+'#'+cast(ERROR_NUMBER() as nvarchar(20))+'#'+Left(cast(@StrSQL as nvarchar(2000)), 500)
		--	if ERROR_NUMBER()=102
		--		print @msg
		--end catch
		
		Set @i=@i+1
	End
	
	Set @i=1
	--Function
	While @i<=(Select top 1 ID From TbFunction order by ID Desc)
	Begin
		Select @StrSQL=CreateFunction
		From TbFunction
		Where ID=@i
		
		--Print @StrSQL
		--begin try
			Exec(@StrSQL)
		--end try
		--begin catch
		--	Set @MSG=ERROR_MESSAGE()+'#'+cast(ERROR_NUMBER() as nvarchar(20))+'#'+Left(cast(@StrSQL as nvarchar(2000)), 500)
		--	if ERROR_NUMBER()=102
		--		print @msg
		--end catch
		
		Set @i=@i+1
	End
Go	
