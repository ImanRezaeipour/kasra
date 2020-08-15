		dim  frmBuff
		frmBuff=frmCapture()
		'---------------------
		function frmCapture()
			dim  retval,itm
			retval=""
			for each itm in  Form1.all
				select case  LCase(itm.tagName)
					case "input": 
						select case LCase(itm.type) 
							case "text","file","password"  :retval = retval & itm.value
							case "checkbox" , "radio":		retval = retval & itm.checked
						end select
					case "textarea" ,"select"  : retval =retval & itm.value
				End Select
			next
			frmCapture=retval
		End Function
		' ----------------------------------
		Function frmChenged()
			frmChenged = (frmCapture()<>frmBuff)
		End Function
		' ----------------------------------		
		
		Function frmNewClick()
			If  frmChenged()  Then
				If ( confirm("Do you want to save last changed?")) Then InitSave
			End If
			InitNew
			frmBuff = frmCapture()
		End Function
		' ----------------------------------
		Function frmSaveClick()
			If ( frmChenged() )	Then
			if InitSave() then 	frmBuff=frmCapture()
			End If
		End Function	
		'------------------------------------
		
		function GetCheckedValues(objCollection)
				Dim item
				Dim Result
				for each item in objCollection.all
					if lcase(item.tagname)="input" then
						if item.checked then Result=result+item.accid+","
					end if
				next
				if len(result)<>0 then result=left(result,len(result)-1)
				GetCheckedValues=Result		
		End Function 
		