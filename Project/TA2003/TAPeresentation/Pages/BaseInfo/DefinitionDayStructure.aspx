<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DefinitionDayStructure.aspx.vb" Inherits="TA.DefinitionDayStructure" validateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>---------------------------------------------------------------------------------------- ⁄—Ì› 
			”«Œ «— —Ê“ 
			--------------------------------------------------------------------------------------------------------------</title></title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<script src="../../../Includes/Script/General.js"></script>
		<LINK href="../../../Includes/Styles/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/XTab.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/XSelectionStyle.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/Paging.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		//=====================================================
		var newrowindex=0 
		var LastSelectedRow=null
		var lastValue=""
		var doNothingFlag=0
		var ID=0
		var NameValue=""
		var DescValue=""
		var Acronym=""
		
		var Mode=0
		//======================================================
		function onfocusTxtTime(obj)
		{
			lastValue=obj.value
		}
		//======================================================
		function OnKeyDownTime2(number){
		var key=window.event.keyCode
		
		window.event.returnValue=
			(
				((key>=96) && (key <=105))||
				((key>=48) && (key <=57 ))||
				(key==8)||(key==9)||(key==46)||
				((key>=35)&& (key<=40)) ||
				(key==186)  )}
		//=======================================================
		
		function Timechk2(obj,txtNum){
		
		var val=""
		val=ReplaceAll(obj.value," ","")	
		var negativeFlag=val.substr(0,1)	
		if (negativeFlag=="-")
			val=val.substr(1,val.length)	
			
		if (( val!="") && (IsvalidTime2(val,txtNum)==false))
		{
			
 			var strQuestion;
 			var intReturn; 		
			strQuestion="  ! ·ÿ›« œ—«Ì‰ ﬁ”„  ”«⁄  ’ÕÌÕ Ê«—œ ﬂ‰Ìœ"
			strQuestion=alert(strQuestion, 0, "”«⁄  «‘ »«Â ")
			obj.focus()
			return;}
		else if ((val!="") && (IsvalidTime2(val,txtNum)==true))
		{
			var arr
			if (getCntChar(':',val)==0){
				arr=val
				if (arr.length==1)
					arr="0"+arr+":00"
				else if (arr.length==2)
					arr=arr+":00"
				else if (arr.length==4)
					arr=arr.substr(0,2)+":"+arr.substr(2,2)
			val=arr
			}
			else
			{
				arr=val.split(":")
				var str1=arr[0]
				var str2=arr[1]
				if (str1.length==0)
					str1="00"
				else if (str1.length==1)
					str1="0"+str1
				if (str2.length==0)
					str2="00"
				else if (str2.length==1)
					str2="0"+str2
			val=str1+":"+str2
			}		
			if (negativeFlag=="-")
				obj.value="-"+val
			else
				obj.value=val
			}
		}
		//======================================================
		var CtrlE=24,CtrlS=0
		function IsvalidTime2(txt,txtNum){
		
		/*if(document.getElementById("txtMode").value==0 && txtNum==2)
		{
			CtrlS=24
			CtrlE=48
		}*/
		var t1;
		var t2;
		var Hour;
		var Min;
		var arr
		var H;
		var M;
		
		if (getCntChar(':',txt)>1)
			return(false)
		else if (getCntChar(':',txt)==0){
			if (txt.length==2){
				if (txt>CtrlE || txt<CtrlS){
					return(false)}
				else{
					return(true)}}
			if(txt.length==4){
				H=txt.substr(0,2)
				M=txt.substr(2,2)
				if (H>CtrlE || M>60 || H<CtrlS){
					return(false)}
				else{
					return(true)}}
			
			if(txt.length==1 && txt<CtrlS)
				return(false)
			if (txt.length==1 || txt.length==2){
				return(true)}
			else if (txt.length>2){
				return(false)}
			if (txt.length>2)
				return (false)}
		else{
			arr=txt.split(":")		
			Hour=parseInt(arr[0])
   			Min=parseInt(arr[1])
   			
   			if(Hour>CtrlE || Hour<CtrlS )
   				return(false)
   				
			if ((Hour>CtrlE && Min>60) || Hour<CtrlS ){
				return(false)}
			else{
				return(true)}}}
		//======================================================
		function onClickGrdSub()
		{
			//try
			//{
			
				var oGrdSub=document.getElementById("grdSub")
				var index=-1
				var oRow=event.srcElement
				
				//_______Find Row
				for(var i=0;oRow.tagName!="TR";i++)
					oRow=oRow.parentElement
				index=oRow.rowIndex
				if(parseInt(index,10)%3==0 && oRow.parentElement.parentElement.id=="grdSub")
				{
					for(i=0;i<oGrdSub.rows.length;i+=3)
					{
						if (oGrdSub.rows(i).className=="CssSelectedItemStyle")
						{
							oGrdSub.rows(i).className="CssItemStyle"
							
						}
					}
					oRow.className="CssSelectedItemStyle"
					LastSelectedRow=oRow
					
					ID=oRow.DetailCollectionID
					NameValue=oRow.cells(2).innerText
					DescValue=oRow.Desc
					
					Acronym=oRow.Acronym
				}
				
			//}
			//catch(e)
			//{
				//alert('«ÿ·«⁄«  ‰«œ—”  «” ')
			//	//alert(e.message)
			//}	
			
		}
		//====================================================
		function onclickBtnDeleteST()
		{
			try
			{
				if(LastSelectedRow!=null)
				{
					if(confirm('¬Ì« »—«Ì Õ–› „ÿ„∆‰ Â” Ìœø'))
					{
						document.getElementById("txtSubmit").value="Delete"
						document.getElementById("txtDetailCollectionID").value=LastSelectedRow.DetailCollectionID
						Form1.submit()
					}
				}
				else
				{
					alert('·ÿ›« Ìò ”ÿ— «“ ÃœÊ· «‰ Œ«» ò‰Ìœ')
				}
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
				
			}
		}
		//=======================================================
		function ondbClickGrdSub()
		{
			try
			{
				
				var oGrdSub=document.getElementById("grdSub")
				var index=-1
				var oRow=event.srcElement
				
				//_______Find Row
				for(var i=0;oRow.tagName!="TR";i++)
					oRow=oRow.parentElement
				index=oRow.rowIndex
				if(parseInt(index,10)%3==0 && oRow.parentElement.parentElement.id=="grdSub")
				{
					onclilcbtnEdit()
				}
					
				
				
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		}
		//==========================================================
		function onBlurTxtSTime(obj)
		{
			try
			{
				if(obj.value=="")
				{
					alert('·ÿ›« ”«⁄  ‘—Ê⁄ —« Ê«—œ ò‰Ìœ')
					obj.focus()
				}
				obj.title=obj.value
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		}
		//======================================================
		function onclickBtnNewSt()
		{
			try
			{
				window.name="DefinitionDayStructure"
				Form1.target=window.name
				var argument='0'
				url = 'NewDayStructure.aspx'+'?SessionID='+Form1.txtSessionID.value 
				var flag=window.showModalDialog(url,argument,'dialogHeight:600px;dialogWidth: 600px;dialogcenter: 1;help: no;scroll:no;status:no')
				if(flag=='1')
				{
					Form1.submit()
				}
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		}
		//==============================================================================
		function onclilcbtnEdit()
		{
			try
			{
				if(LastSelectedRow==null)
				{
					alert('·ÿ›« Ìò ”ÿ— «“ ÃœÊ· «‰ Œ«» ò‰Ìœ')
					return
				}
				window.name="DefinitionDayStructure"
				Form1.target=window.name
				var argument=new Array()
				argument=new Array(5)
				argument[0]=ID
				argument[1]=NameValue
				argument[2]=DescValue				
				argument[3]=Acronym		
				
				url = 'NewDayStructure.aspx'+'?SessionID='+Form1.txtSessionID.value 
				+'&ID='+ID
				var flag=window.showModalDialog(url,argument,'dialogHeight:600px;dialogWidth: 600px;dialogcenter: 1;help: no;scroll:no;status:no')
				if(flag=='1')
				{
					Form1.submit()
				}
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		}
		//=======================================================
		function onclickBtnSave()
		{
			//try
			//{
				var strXML="<BaseInfoEntity>"
				var oGrdSub=document.getElementById("grdSub")
				var oSubTable
				var TimesStructure=""
				var k=0
				var j
				var Nochangflag=0
				var selectedFlag=0
				var dontSaveFlag=1
				var tmp
					
				for(var i=2;i<oGrdSub.rows.length;i=i+3)
				{
					oSubTable=oGrdSub.rows(i).cells(0).firstChild
					j=0
					while(j<oSubTable.rows.length)
					{
						if(oSubTable.rows(j).cells(2).firstChild.innerText=="")
						{
							alert('·ÿ›« ‰Ê⁄ ”«Œ «— —« „‘Œ’ ò‰Ìœ')
							j++
							Nochangflag=1
							return	
						}
						else
						{
							
							if(oSubTable.rows(j).Selected=="1")
							{
								selectedFlag=1
								dontSaveFlag=0
							}
							TimesStructure+=GetMinute(oSubTable.rows(j).cells(0).firstChild.value).toString()+"_"
							TimesStructure+=GetMinute(oSubTable.rows(j).cells(1).firstChild.value).toString()+"$"
							
							TimesStructure+=oSubTable.rows(j).DetailTypeID
							k=j+1
							if(oSubTable.rows(k)!=null && oSubTable.rows(k).cells(0).innerHTML=="")
							{
								while(oSubTable.rows(k)!=null && oSubTable.rows(k).cells(0).innerHTML=="")
								{
									TimesStructure+=","+oSubTable.rows(k).DetailTypeID
									k++
									j=k
								}
							}
							else
							{
								j++
							}	
							TimesStructure+=";"
						}
					}
					
					/*if (oGrdSub.rows(i-2).cells(3).firstChild.value>oGrdSub.rows(i-2).cells(4).firstChild.value)
					{
						alert("“„«‰ ‰—„«· ‘—Ê⁄ »«Ìœ òÊçò — «“ “„«‰ ‰—„«· Œ—ÊÃ »«‘œ")
						return
					}*/
					strXML+="<DetailCollectionTemplate>"
					strXML+="<ID>"+oGrdSub.rows(i-2).DetailCollectionID+"</ID>"
					//---------------------------------------------------------------------
					tmp=oGrdSub.rows(i-2).cells(3).firstChild.value
					if(tmp.indexOf('-')>0 || tmp.indexOf('-')==0)
					{
						tmp=tmp.replace('-','')
						tmp='-'+tmp
					}
					strXML+="<NormalStart>"+tmp+"</NormalStart>"
					//---------------------------------------------------------------------
					tmp=oGrdSub.rows(i-2).cells(4).firstChild.value
					if(tmp.indexOf('-')>0 || tmp.indexOf('-')==0)
					{
						tmp=tmp.replace('-','')
						tmp='-'+tmp
					}
					strXML+="<NormalEnd>"+tmp+"</NormalEnd>"
					//---------------------------------------------------------------------
					strXML+="<TimesStructure>"+TimesStructure+"</TimesStructure>"
					strXML+="<selected>1</selected>"
					strXML+="</DetailCollectionTemplate>"
					//alert((oGrdSub.rows(i-2).cells(4).firstChild.value).substr(5,1))
					TimesStructure=""
					
				}
				

				//if(Nochangflag==1 || dontSaveFlag==1)
				//	return
				//else	
				//{
					strXML+="</BaseInfoEntity>"
					document.getElementById("txtSubmit").value="Save"
					
					document.getElementById("txtXML").value=strXML
					
					document.getElementById("Form1").submit()
				//}
			//}
			//catch(e)
			//{
			//	alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			//}
		}
		//============================================================
		function GetMinute(time)
		{
			try
			{
				if(time=="")
					return 0
				var arr
				arr=time.split(":")
				
				arr[0]=parseInt(arr[0],10)
				arr[1]=parseInt(arr[1],10)
				
				return( arr[0]*60+arr[1])
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		}
		//====================================================
		function onBlurTxtEndTime(oRow)
		{
			
			try
			{
				if(Mode==1)
				{
					fMode1(oRow)
				}
				else
				{
					fMode0(oRow)
				}
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
			
		}
		//==================================================================
		var flagAlert=0
		function onblurtxtNormalTime(obj,WichTxt)
		{
			/*if(flagAlert==1)
			{
				flagAlert=0
				return
			}
			//--------------------------------------
			if(document.getElementById("txtMode").value==1)//—Ê“ ﬁ»·-—Ê“ Ã«—Ì
			{
				var idx=obj.value.indexOf('-')
				if(WichTxt==1)
				{
					if(idx<0)
					{
						alert('“„«‰ ‘—Ê⁄ »«Ìœ „‰›Ì »«‘œ')
						flagAlert=1
						obj.focus()
						return
					}
				}
				else if(WichTxt==2)
				{
					if(idx>0 || idx==0)
					{
						alert('“„«‰ »«Ìœ „À»  »«‘œ')
						flagAlert=1
						obj.focus()
						return
					}
				}
			}
			//--------------------------------------
			if(document.getElementById("txtMode").value==0)//—Ê“ »⁄œ-—Ê“ Ã«—Ì
			{
				var idx=obj.value.indexOf('-')
				if(idx>0 || idx==0)
				{
					alert('“„«‰ »«Ìœ „À»  »«‘œ')
					flagAlert=1
					obj.focus()
					return
				}
			}*/
			obj=obj.parentElement.parentElement
			obj=obj.nextSibling.nextSibling//firstChild
			obj=obj.firstChild				
			for(var i=0;obj.tagName!="TR";i++)
				obj=obj.firstChild				
			
			obj.Selected="1"
			flagAlert=0
			
		}
		//==================================================================
		function fMode1(oRow)
		{
			try
			{
				
				//_______Find Row_______________
				for(var i=0;oRow.tagName!="TR";i++)
					oRow=oRow.parentElement
					
				//_______Find Table_____________
				var oTable=oRow
				for(var i=0;oTable.tagName!="TABLE";i++)
					oTable=oTable.parentElement	
				
				if(doNothingFlag==1)
				{
					doNothingFlag=0
					return
				}
				
				oRow.Selected="1"
				//_________________________________
			
				var oIndex=oRow.rowIndex+1
				var tempIndex=oIndex
				//__________________________________
				if(oRow.cells(1).firstChild.value=="" )
				{
					alert("·ÿ›« ”«⁄  Œ—ÊÃ —« Ê«—œ ò‰Ìœ")
					oRow.cells(1).firstChild.focus()
					return
				}
				else if(oRow.cells(1).firstChild.value=="23:59")
				{
					
					if(oRow.cells(3).firstChild.innerText=="—Ê“ ﬁ»·")
					{
						while(oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(1).innerHTML=="")
						{
							oIndex++
						}
						if(oTable.rows(oIndex)==null)
						{
							insertChildTable(oTable,oIndex,'<font color=green>—Ê“ Ã«—Ì</font>',"","","00:00","23:59","1")
						}
						else
						{
							while(oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(3).firstChild.innerText!="—Ê“ Ã«—Ì")
							{
								oTable.deleteRow(oIndex)
							}
							oRow.cells(1).firstChild.title=oRow.cells(1).firstChild.value
						}
						return
						
					}
					else if(oRow.cells(3).firstChild.innerText=="—Ê“ Ã«—Ì")
					{
						while(oTable.rows(oIndex)!=null)
						{
							oTable.deleteRow(oIndex)
						}
						oRow.cells(1).firstChild.title=oRow.cells(1).firstChild.value
						return
					}	
				}
				//_________________________________________________________________________
				if(oRow.cells(0).firstChild.value==oRow.cells(1).firstChild.value ||compareTimes(oRow.cells(0).firstChild.value,oRow.cells(1).firstChild.value)==true)
				{
					alert('”«⁄  Œ« „Â »«Ìœ »“—ê — «“ ”«⁄  ‘—Ê⁄ »«‘œ')
					oRow.cells(1).firstChild.focus()
					oRow.cells(1).firstChild.select()
					return
				}
				//_________________________________________________________________________
				if(oTable.rows(oIndex)!=null)
				{
					if(oRow.cells(1).firstChild.value!=lastValue)
					{
						var a=confirm('¬Ì« »—«Ì  €ÌÌ— „ÿ„∆‰ Â” Ìœø')
						if(a==false)
						{
							oRow.cells(1).firstChild.value=lastValue
							return
						}
					}
				}
				oRow.cells(1).firstChild.title=oRow.cells(1).firstChild.value
				//----------------------------------------------------------------------
				if(oTable.rows(oIndex)==null)
				{
					var sTime=addTime(oRow.cells(1).firstChild.value)
					insertChildTable(oTable,oIndex,oRow.Caption,"","",sTime,"23:59","1")
					oTable.rows(oIndex).cells(1).firstChild.focus()
					oTable.rows(oIndex).cells(1).firstChild.select()
					return
				}
				//Delete rows that have less EndTimes
				
				for(;oIndex<oTable.rows.length;oIndex++)
				{
					while(oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(1).innerHTML=="")
					{
						oIndex++
					}
					while(oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(1).innerHTML!="" && compareTimes(oTable.rows(oIndex).cells(1).firstChild.value,oRow.cells(1).firstChild.value)==false)
					{
						oTable.deleteRow(oIndex)
						while(oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(1).innerHTML=="")
						{
							oTable.deleteRow(oIndex)
						}	
					}
				}
				while(oTable.rows(tempIndex)!=null && oTable.rows(tempIndex).cells(1).innerHTML=="")
				{
					tempIndex++
				}
			
				if(oTable.rows(tempIndex)!=null)
				{
					if(oTable.rows(tempIndex).cells(3).firstChild.innerText=="—Ê“ Ã«—Ì" && oTable.rows(tempIndex-1).cells(3).firstChild.innerText=="—Ê“ ﬁ»·")
					{
						var sTime=addTime(oRow.cells(1).firstChild.value)
						insertChildTable(oTable,tempIndex,oRow.Caption,"","",sTime,"23:59","1")
						oTable.rows(tempIndex).cells(1).firstChild.focus()
						oTable.rows(tempIndex).cells(1).firstChild.select()
					}
					else
					{
						oTable.rows(tempIndex).cells(0).firstChild.value=addTime(oRow.cells(1).firstChild.value)
					}
					lastValue=""
				}
				else
				{
					var sTime=addTime(oRow.cells(1).firstChild.value)
					insertChildTable(oTable,tempIndex,oRow.Caption,"","",sTime,"23:59","","1")
					oTable.rows(tempIndex).cells(1).firstChild.focus()
					oTable.rows(tempIndex).cells(1).firstChild.select()
				}
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		}
		//=====================================================
		function fMode0(oRow)
		{
			try
			{
				//_______Find Row_________________________
				for(var i=0;oRow.tagName!="TR";i++)
					oRow=oRow.parentElement
					
				//_______Find Table________________________
				var oTable=oRow
				for(var i=0;oTable.tagName!="TABLE";i++)
					oTable=oTable.parentElement	
				if(doNothingFlag==1)
				{
					doNothingFlag=0
					return
				}
				else if(lastValue==oRow.cells(1).firstChild.value || lastValue=="")
				{
					return
				}
				
				oRow.Selected="1"
				//________________________________________
			
				var oIndex=oRow.rowIndex+1
				var tempIndex=oIndex
				//__________________________________________
				if(oRow.cells(1).firstChild.value=="" )
				{
					alert("·ÿ›« ”«⁄  Œ—ÊÃ —« Ê«—œ ò‰Ìœ")
					oRow.cells(1).firstChild.focus()
					return
				}
				else if(oRow.cells(1).firstChild.value=="23:59" )
				{
					if(oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(3).firstChild.innerText=="—Ê“ »⁄œ")
					{
						return
					}
					else if(oTable.rows(oIndex)==null)
					{
						return
					}
					while(oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(0).innerHTML=="" )
					{
						oIndex++
					}
					if(oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(3).firstChild.innerText=="—Ê“ »⁄œ")
					{
						return
					}
					else
					{
						var a=confirm('¬Ì« »—«Ì  €ÌÌ— „ÿ„∆‰ Â” Ìœø')
						if(a==true)
						{	
							while(oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(0).innerHTML=="" )
							{
								oIndex++
							}
							while(oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(3).firstChild.innerText!="—Ê“ »⁄œ")
							{
								oTable.deleteRow(oIndex)
							}
						}
						return
					}
				}
				//______________________________________________
				if(oRow.cells(3).firstChild.innerText=="—Ê“ »⁄œ")
				{
					if(oRow.cells(0).firstChild.value==oRow.cells(1).firstChild.value ||compareTimes(oRow.cells(0).firstChild.value,oRow.cells(1).firstChild.value)==true)
					{
						alert('”«⁄  Œ« „Â »«Ìœ »“—ê — «“ ”«⁄  ‘—Ê⁄ »«‘œ')
						oRow.cells(1).firstChild.focus()
						oRow.cells(1).firstChild.select()
						
						return
					}
					else
					{
						oRow.cells(1).firstChild.title=oRow.cells(1).firstChild.value
						while(oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(1).innerHTML=="")
						{
							oIndex++
						}
						while(oTable.rows(oIndex)!=null)
						{
							oTable.deleteRow(oIndex)
						}
						return
					}
				}
				//__________________________________________
				if(oTable.rows(oIndex)!=null)
				{
					if(oRow.cells(1).firstChild.value!=lastValue)
					{
						var a=confirm('¬Ì« »—«Ì  €ÌÌ— „ÿ„∆‰ Â” Ìœø')
						if(a==false)
						{
							oRow.cells(1).firstChild.value=lastValue
							return
						}
					}
				}
				oRow.cells(1).firstChild.title=oRow.cells(1).firstChild.value


				//_________________________________Tomarrow______________________
				if(compareTimes(oRow.cells(0).firstChild.value,oRow.cells(1).firstChild.value)==true)
				{

					for(;oIndex<oTable.rows.length;oIndex++)
					{
						while(oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(1).innerHTML=="")
						{
							oIndex++
						}
						tempIndex=oIndex
						while(oTable.rows(oIndex)!=null )
						{
							oTable.deleteRow(oIndex)
						}
					}
					var sTime=addTime(oRow.cells(1).firstChild.value)
					oRow.cells(1).firstChild.value="23:59"
					oRow.cells(1).firstChild.title="23:59"
					
					insertChildTable(oTable,tempIndex,'<font color=red>—Ê“ »⁄œ</font>',"","","00:00",sTime,"1")
					oTable.rows(tempIndex).cells(6).style.display="inline"
					oTable.rows(tempIndex).cells(1).firstChild.focus()
					oTable.rows(tempIndex).cells(1).firstChild.select()
					
					return
				}
				
				//_______________________________________________
				if(oTable.rows(oIndex)==null)
				{
					var sTime=addTime(oRow.cells(1).firstChild.value)
					insertChildTable(oTable,oIndex,oRow.Caption,"","",sTime,"23:59","1")
					oTable.rows(oIndex).cells(1).firstChild.focus()
					oTable.rows(oIndex).cells(1).firstChild.select()
					return
				}
				//Delete rows that have less EndTimes
				
				for(;oIndex<oTable.rows.length;oIndex++)
				{
					while(oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(1).innerHTML=="")
					{
						oIndex++
					}
					while(oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(1).innerHTML!=""&& oTable.rows(oIndex).cells(3).firstChild.innerText!="—Ê“ »⁄œ" && compareTimes(oTable.rows(oIndex).cells(1).firstChild.value,oRow.cells(1).firstChild.value)==false)
					{
						//alert(oTable.rows(oIndex).cells(3).firstChild.innerText)
						oTable.deleteRow(oIndex)
						while(oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(1).innerHTML=="")
						{
							oTable.deleteRow(oIndex)
						}	
					}
				}
				while(oTable.rows(tempIndex)!=null && oTable.rows(tempIndex).cells(1).innerHTML=="")
				{
					tempIndex++
				}
			
				if(oTable.rows(tempIndex)!=null)
				{
					if(oTable.rows(tempIndex).cells(3).firstChild.innerText=="—Ê“ »⁄œ")
					{
						var sTime=addTime(oRow.cells(1).firstChild.value)
						insertChildTable(oTable,tempIndex,oRow.Caption,"","",sTime,"23:59","1")
						oTable.rows(tempIndex).cells(1).firstChild.focus()
						oTable.rows(tempIndex).cells(1).firstChild.select()
					}
					else
					{
						oTable.rows(tempIndex).cells(0).firstChild.value=addTime(oRow.cells(1).firstChild.value)
					}
					lastValue=""
				}
				else
				{
					var sTime=addTime(oRow.cells(1).firstChild.value)
					insertChildTable(oTable,tempIndex,oRow.Caption,"","",sTime,"23:59","","1")
					oTable.rows(tempIndex).cells(1).firstChild.focus()
					oTable.rows(tempIndex).cells(1).firstChild.select()
				}
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
				
			}
		}
		//=====================================================
		function onclickBtnProperties()
		{	
			try
			{
				window.name="DefinitionDayStructure"
				Form1.target=window.name
				
				//_______Find Row
				var oRow=window.event.srcElement
				for(var i=0;oRow.tagName!="TR";i++)
					oRow=oRow.parentElement
					
				//_______Find Table
				var oTable=oRow
				for(var i=0;oTable.tagName!="TABLE";i++)
				{
					oTable=oTable.parentElement
				}
				oRow.Selected="1"	
				//_______Find Index
				var oIndex=oRow.rowIndex
				if(oRow.cells(0).innerHTML=="")
				{
					return
				}
				var tempIndex=oIndex+1
				var n=1
				var atrID=oTable.rows(oIndex).DetailTypeID
				while( oTable.rows(tempIndex)!=null && oTable.rows(tempIndex).cells(0).innerHTML=="")
				{
					atrID+=','+oTable.rows(tempIndex).DetailTypeID
					tempIndex++
					n++
				}
				url = 'DayStructureProperties.aspx'
				var strXML=""
				strXML = window.showModalDialog(url,atrID,'dialogHeight:520px;dialogWidth: 220px;dialogleft: 5PX;help: no;scroll:no;status:no')
				if(strXML!=undefined)
				{
					var xmlDoc = new ActiveXObject("Microsoft.XMLDOM")
					xmlDoc.loadXML(strXML)
					xmlDoc.setProperty("SelectionLanguage", "XPath")
					var xmlNodes
					xmlNodes=xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetDetailType")
					if(xmlNodes.length>0)
					{
						oRow.Selected="1"
						oRow.cells(2).firstChild.innerText=xmlNodes.item(0).selectSingleNode('Title').text
						oRow.DetailTypeID=xmlNodes.item(0).selectSingleNode('DetailTypeID').text
						tempIndex=oIndex+1
						while(oTable.rows(tempIndex)!=null && oTable.rows(tempIndex).cells(0).innerHTML=="")
						{
							oTable.deleteRow(tempIndex)
						}
						for(var j=1;j<xmlNodes.length;j++)
						{
							insertChildTable(oTable,oIndex+j,oRow.Caption,xmlNodes.item(j).selectSingleNode('Title').text,xmlNodes.item(j).selectSingleNode('DetailTypeID').text,0,0,"1")
						}	
					}
				}
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		}
		//===================================================
		function onclickbtnDelete(oRow)
		{
			try
			{
				if(Mode==1)
				{
					deleteMode1(oRow)
				}
				else
				{
					deleteMode0(oRow)
				}
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		}
		//=======================================================
		function deleteMode1(oRow)
		{
			try
			{
				//_______Find Row
				for(var i=0;oRow.tagName!="TR";i++)
					oRow=oRow.parentElement
					
				//_______Find Table
				var oTable=oRow
				for(var i=0;oTable.tagName!="TABLE";i++)
					oTable=oTable.parentElement
					
				//_______Find Index
				var oIndex=oRow.rowIndex
				
				oRow.Selected="1"
				//if this row is subGruop
				if(oRow.cells(1).innerHTML=="")
				{
					return
				}
				//if there is only One row
				else if((oTable.rows(oIndex+1))==null  && (oIndex-1)==-1)
				{
					return
				}
				if(!confirm('¬Ì« »—«Ì Õ–› „ÿ„∆‰ Â” Ìœø'))
				{
					return
				}
				//today
				else if(oRow.cells(3).firstChild.innerText=="—Ê“ Ã«—Ì" && (oIndex-1)!=-1)
				{
					
					var tempIndex=oIndex-1
					for(var i=0;oTable.rows(tempIndex).cells(1).innerHTML=="";i++)
					{
						tempIndex=tempIndex-1
					}
					var dayCount=0
					for(var k=0;k<oTable.rows.length;k++)
					{
						if(oTable.rows(k).cells(3).firstChild.innerText=="—Ê“ Ã«—Ì" && oTable.rows(k).cells(1).innerHTML!="")
						{
							dayCount++
						}
					}
					if( dayCount>1 && oTable.rows(tempIndex).cells(3).firstChild.innerText=='—Ê“ ﬁ»·')
					{
						alert('Õ–› «„ò«‰ Å–Ì— ‰„Ì »«‘œ')
						return
					}
					if(oTable.rows(tempIndex).cells(3).firstChild.innerText!='—Ê“ ﬁ»·')
						oTable.rows(tempIndex).cells(1).firstChild.value=oTable.rows(oIndex).cells(1).firstChild.value
					oTable.deleteRow(oIndex)
					
					//Delete SubStructures
					while(oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(1).innerHTML=="")
					{
						oTable.deleteRow(oIndex)
					}	
					setTitles(oTable)
					setSTime(oTable)
				}
				
				//last row without subGroup
				else if(oTable.rows(oIndex+1)==null)	
				{	
					oTable.deleteRow(oIndex)
					while(oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(1).innerHTML=="")
					{
						oTable.deleteRow(oIndex)
					}
					var i=oTable.rows.length-1
					while(oTable.rows(i)!=null && oTable.rows(i).cells(1).innerHTML=="")
					{
						i--
					}
					oTable.rows(i).cells(1).firstChild.value="23:59"
					setTitles(oTable)
				}
				//first Row
				else if((oIndex-1)==-1)	
				{
					var temp=oIndex+1
					var i=1
					if(oTable.rows(temp).cells(1).innerHTML=="")
					{
						while(oTable.rows(temp)!=null && oTable.rows(temp).cells(1).innerHTML=="" )
						{
							i++
							temp++
						}
					}
					if(oTable.rows(temp)==null)
					{
						return
					}
					else if(oTable.rows(temp).cells(3).firstChild.innerText=="—Ê“ Ã«—Ì")
					{
						alert('«„ò«‰ Å–Ì— ‰„Ì »«‘œ')
						return
					}
					for(j=0;j<i;j++)
					{
						oTable.deleteRow(oIndex)
					}
					setTitles(oTable)
					setSTime(oTable)
					return
				}
				else
				{	
					var tempIndex=oIndex-1
					if ( tempIndex!=-1 )
					{
						for(var i=0;oTable.rows(tempIndex).cells(1).innerHTML=="";i++)
						{
							tempIndex=tempIndex-1
						}
					}
					
					oTable.rows(tempIndex).cells(1).firstChild.value=oTable.rows(oIndex).cells(1).firstChild.value
					oTable.deleteRow(oIndex)
					
					//Delete SubStructures
					while(oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(1).innerHTML=="")
					{
						oTable.deleteRow(oIndex)
					}	
					setTitles(oTable)
				 }
				}	
				catch(e)
				{
					alert('«ÿ·«⁄«  ‰«œ—”  «” ')
					//alert(e.message)
				}
			}
			//=======================================================
			function deleteMode0(oRow)
			{
				try
				{
					//_______Find Row
					for(var i=0;oRow.tagName!="TR";i++)
						oRow=oRow.parentElement
						
					//_______Find Table
					var oTable=oRow
					for(var i=0;oTable.tagName!="TABLE";i++)
						oTable=oTable.parentElement
						
					//_______Find Index
					var oIndex=oRow.rowIndex
					
					oRow.Selected="1"
					//if this row is subGruop
					if(oRow.cells(1).innerHTML=="")
					{
						return
					}
					
					//if there is only One row
					else if((oTable.rows(oIndex+1))==null  && (oIndex-1)==-1)
					{
						return
					}
					if(!confirm('¬Ì« »—«Ì Õ–› „ÿ„∆‰ Â” Ìœø'))
					{
						return
					}
					//tomorrow
					else if(oRow.cells(3).firstChild.innerText=="—Ê“ »⁄œ" && (oIndex-1)!=-1)
					{
						
						while(oTable.rows(oIndex)!=null)
						{
							oTable.deleteRow(oIndex)
						}
						setTitles(oTable)
						for(var j=oTable.rows.length-1 ; j>=0; j--)
						{
							if(oTable.rows(j).cells(3).firstChild.innerText=="—Ê“ »⁄œ" && oTable.rows(j).cells(0).innerHTML!="" && oTable.rows(j).cells(6).style.display=="none")
							{
								oTable.rows(j).cells(6).style.display="inline"
								return
							}
						}
					}//last row without subGroup
					else if(oTable.rows(oIndex+1)==null)	
					{	
						oTable.deleteRow(oIndex)
						while(oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(1).innerHTML=="")
						{
							oTable.deleteRow(oIndex)
						}
						var i=oTable.rows.length-1
						while(oTable.rows(i)!=null && oTable.rows(i).innerHTML=="")
						{
							i--
						}
						oTable.rows(i).cells(1).firstChild.value="23:59"
						setTitles(oTable)
					}//first Row
					else if((oIndex-1)==-1)	
					{
						var temp=oIndex+1
						var i=1
						if(oTable.rows(temp).cells(1).innerHTML=="")
						{
							while(oTable.rows(temp)!=null && oTable.rows(temp).cells(1).innerHTML=="" )
							{
								i++
								temp++
							}
						}
						if(oTable.rows(temp)==null)
						{
							return
						}
						else if(oTable.rows(temp).cells(3).firstChild.innerText=="—Ê“ »⁄œ")
						{
							alert('«„ò«‰ Å–Ì— ‰„Ì »«‘œ')
							return
						}
						for(j=0;j<i;j++)
						{
							oTable.deleteRow(oIndex)
						}
						oTable.rows(oIndex).cells(0).firstChild.value="00:00"
						setTitles(oTable)

					}	
					else
					{
						var tempIndex=oIndex-1
						if ( tempIndex!=-1 )
						{
							for(var i=0;oTable.rows(tempIndex).cells(1).innerHTML=="";i++)
							{
								tempIndex=tempIndex-1
							}
						}
						
						oTable.rows(tempIndex).cells(1).firstChild.value=oTable.rows(oIndex).cells(1).firstChild.value
						oTable.deleteRow(oIndex)
						
						//Delete SubStructures
						while(oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(1).innerHTML=="")
						{
							oTable.deleteRow(oIndex)
						}	
						setTitles(oTable)
					}
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		
		}
		//======================================================
		//set all titles of textBox in a Table
		function setTitles(oTable)
		{
			try
				{
					for(var i=0;i<oTable.rows.length;i++)
					{
						if(oTable.rows(i).cells(1).innerHTML!="")
						{
							oTable.rows(i).cells(0).firstChild.title=oTable.rows(i).cells(0).firstChild.value
							oTable.rows(i).cells(1).firstChild.title=oTable.rows(i).cells(1).firstChild.value
						}
					}
				}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		}
		//=======================================================
		function setSTime(oTable)
		{
			for(var i=0;i<oTable.rows.length;i++)
			{
				if(oTable.rows(i).cells(1).innerHTML!='' && oTable.rows(i).cells(3).firstChild.innerText=='—Ê“ Ã«—Ì')
				{
					oTable.rows(i).cells(0).firstChild.value="00:00"
					oTable.rows(i).cells(0).firstChild.title="00:00"
					return
				}
			}
		}
		//======================================================
		function onclickBtnNew()
		{
			try
			{
					//_______Find Row
				var oRow=window.event.srcElement
				for(var i=0;oRow.tagName!="TR";i++)
					oRow=oRow.parentElement
				
					//_______Find Table
				var oTable=oRow
				for(var i=0;oTable.tagName!="TABLE";i++)
				{
					oTable=oTable.parentElement
				}
				
					//_______Find Index
				var oIndex=oRow.rowIndex+1
				var tempIndex=oRow.rowIndex
				
				oRow.Selected="1"
				//when rows have Have SubStructures	
				if (oTable.rows(oIndex)!=null)
				{
					while( oTable.rows(oIndex)!=null && oTable.rows(oIndex).cells(1).innerHTML=="")
					{
						oIndex=oIndex+1
					}
				}
				if(oRow.cells(1).firstChild.value=="23:59" || oRow.cells(1).firstChild.value=="")
					return
				
				//_______Insert New Row Below
				var EndTime=addTime(oRow.cells(1).firstChild.value)
				var StartTime=oRow.cells(0).firstChild.value
				var result=compareTimes(oRow.cells(1).firstChild.value,oRow.cells(0).firstChild.value)
				if(result==true)
				{
					insertChildTable(oTable,oIndex,"<font color='red'>—Ê“ »⁄œ</font>","","",EndTime,EndTime,"1")
					oTable.rows(tempIndex).cells(6).style.display="none"
					oTable.rows(oIndex).cells(6).style.display="inline"
					oTable.rows(oIndex).cells(1).firstChild.focus()
					oTable.rows(oIndex).cells(1).firstChild.select()
				}
				else
				{
					//Tomorrow dont have tomorrow
					alert('”«⁄  Œ« „Â »«Ìœ »“—ê — «“ ”«⁄  ‘—Ê⁄ »«‘œ')
					oRow.cells(1).firstChild.focus()
					oRow.cells(1).firstChild.select()
					
				}
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
			
		}
		//====================================================================
		//Get 2Times and Compare Them
		function compareTimes(Time1,Time2)
		{
			try
			{
				if(Time1=="" || Time2=="")
					return false
				var arr1
				var arr2
				arr1=Time1.split(":")
				arr2=Time2.split(":")
				
				arr1[0]=parseInt(arr1[0],10)
				arr1[1]=parseInt(arr1[1],10)
				
				arr2[0]=parseInt(arr2[0],10)
				arr2[1]=parseInt(arr2[1],10)
				
				if(arr1[0]>arr2[0]) //Hours
					return true
				else if(arr1[0]==arr2[0])
				{
					if(arr1[1]>arr2[1])
						return true
					else
						return false
				}
				else
				{
					return false
				}
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		}
		//===================================================
		//get a time Add with 1 min and return time
		function addTime(sTime)
		{
			try
			{
				if(sTime=="")
					return
				var arr
				arr=sTime.split(":")
				var MinET=parseInt(arr[1],10)
				var HourET=parseInt(arr[0],10)
				if(MinET>=0 && MinET<9)
				{
					MinET=MinET+1
					MinET="0"+MinET
				}
				else if(MinET==59)
				{
					HourET=HourET+1
					MinET="00"
				}
				else if(MinET>=9)
				{
					MinET=MinET+1
					
				}
				if(HourET<10)
				{
					sTime="0"+HourET+":"+MinET
				}
				else
				{
					sTime=HourET+":"+MinET
				}
				return sTime
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		}
		//====================================================
		//get a time sub with 1 min and return time
		function subTime(sTime)
		{
			try
			{
				if(sTime=="")
					return
				var arr
				arr=sTime.split(":")
				var MinET=parseInt(arr[1],10)
				var HourET=parseInt(arr[0],10)
				if(MinET>0 && MinET<11)
				{
					MinET=MinET-1
					MinET="0"+MinET
				}
				else if(MinET==0)
				{
					HourET=HourET-1
					MinET="59"
				}
				else if(MinET>=11)
				{
					MinET=MinET-1
				}
				if(HourET<10)
				{
					sTime="0"+HourET+":"+MinET
				}
				else
				{
					sTime=HourET+":"+MinET
				}
				return sTime
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		}
		//====================================================
		function addRow(oGrid,TimesStructure,StName,DetailCollectionID,Desc,NormalStart,NormalEnd,Acronym)
		//function addRow(oGrid,TimesStructure,StName,SDate,EDate,DetailCollectionID)
		{
			try
			{
				//----------------------
				oGrid.insertRow()
				oGrid.rows(newrowindex).className = "CssItemStyle"
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).insertCell()
				
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).insertCell()
			
				//----visible column
				oGrid.rows(newrowindex).cells(0).innerHTML="<IMG src='../../../Includes/Images/Icons/btnDerakhtvareh.gif' onclick='OnClickTolerance(this)'>"
				oGrid.rows(newrowindex).cells(1).innerHTML="<IMG src='../../../Includes/Images/Icons/btnSubNodes.gif' onclick='OnClickSubNode(this)'>"
				oGrid.rows(newrowindex).cells(2).innerText=StName.slice(0,20)
				oGrid.rows(newrowindex).cells(3).innerHTML="<input type='text' CssClass='txtControls' onkeydown='OnKeyDownTime2(this.value)' onblur='Timechk2(this,1);onblurtxtNormalTime(this,1)' style='WIDTH: 70px' >"
				oGrid.rows(newrowindex).cells(4).innerHTML="<input type='text' CssClass='txtControls' onkeydown='OnKeyDownTime2(this.value)' onblur='Timechk2(this,2);onblurtxtNormalTime(this,2)' style='WIDTH: 70px' >"
				oGrid.rows(newrowindex).cells(3).firstChild.value=NormalStart
				oGrid.rows(newrowindex).cells(4).firstChild.value=NormalEnd
				oGrid.rows(newrowindex).cells(5).innerText=Desc.slice(0,35)
				oGrid.rows(newrowindex).cells(5).title=Desc
				oGrid.rows(newrowindex).cells(2).title=StName
				//oGrid.rows(newrowindex).cells(2).innerText=SDate
				//oGrid.rows(newrowindex).cells(3).innerText=EDate
				
				//----Create Attribute
				oGrid.rows(newrowindex).setAttribute("CssFlag" ,"1")
				oGrid.rows(newrowindex).setAttribute("DetailCollectionID" ,DetailCollectionID)
				oGrid.rows(newrowindex).setAttribute("Desc" ,Desc)
				oGrid.rows(newrowindex).setAttribute("Acronym" ,Acronym)
				
				oGrid.rows(newrowindex).align="center"
				oGrid.rows(newrowindex).cells(0).style.width="40px"
				oGrid.rows(newrowindex).cells(1).style.width="20px"
				oGrid.rows(newrowindex).cells(2).style.width="150px"
				oGrid.rows(newrowindex).cells(3).style.width="100px"
				oGrid.rows(newrowindex).cells(4).style.width="100px"
				oGrid.rows(newrowindex).cells(5).style.width="343px"
				oGrid.rows(newrowindex).cells(5).colspan="2"
				//oGrid.rows(newrowindex).cells(2).style.width="187px"
				//oGrid.rows(newrowindex).cells(3).style.width="185px"
				newrowindex=newrowindex+1
				
				//---------------------------------
				oGrid.insertRow()
				oGrid.rows(newrowindex).insertCell()
				oGrid.rows(newrowindex).cells(0).colSpan="6"
				oGrid.rows(newrowindex).align="center"
				oGrid.rows(newrowindex).style.display="none"
				
				//Create Attribute
				oGrid.rows(newrowindex).setAttribute("CssFlag" ,"2")
				
				var strHTML="<TABLE  width='95%' class='CssItemHeader' dir='rtl' cellspacing='0' cellPadding='0' border='0'><TR>"
				strHTML+="<TD align='center' style='WIDTH:75px'>"+"”«⁄  ‘—Ê⁄"+"</TD>"
				strHTML+="<TD align='center' style='WIDTH:75px'>"+"”«⁄  Œ« „Â"+"</TD>"
				strHTML+="<TD align='center' style='WIDTH:250px'>"+"‰Ê⁄ ”«Œ «—"+"</TD>"
				strHTML+="<TD align='right' style='WIDTH:180px'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+"„ ⁄·ﬁ »Â"+"</TD>"
				strHTML+="</TR></TABLE>"
				oGrid.rows(newrowindex).cells(0).innerHTML=strHTML
				oGrid.rows(newrowindex).cells(0).align="center"
				newrowindex=newrowindex+1
				//-------------------------------
				createRows(oGrid,TimesStructure)
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		}
		//=================================================================
		function createRows(oGrid,TimesStructure)
		{
			try
			{
				oGrid.insertRow()
				oGrid.rows(newrowindex).insertCell()
				
				oGrid.rows(newrowindex).align="center"
				oGrid.rows(newrowindex).cells(0).colSpan="6"
				oGrid.rows(newrowindex).style.display="none"
				var TableID="TABLE"+newrowindex
				
				oGrid.rows(newrowindex).cells(0).innerHTML="<TABLE id='"+TableID+"' width='95%' dir='rtl' id='Test' cellPadding='0' border='0'></TABLE>"
				
				newrowindex=newrowindex+1
				
				var caption=""
				if(Mode==1)
				{
					caption='—Ê“ ﬁ»·'
				}
				else
				{
					caption='—Ê“ Ã«—Ì'
				}
				if(TimesStructure=="")
				{
					//‰Ê⁄ ”«Œ «— ÅÌ‘ ›—÷
					insertChildTable(document.all.item(TableID),0,caption,"¬“«œ »⁄œ","883","00:00","23:59","0")
					if(Mode==1)
					{
						document.getElementById(TableID).rows(0).cells(0).firstChild.disabled=false
						//insertChildTable(document.all.item(TableID),1,"<font color='green'>—Ê“ Ã«—Ì</font>","","","00:00","23:59","0")
					}
					
				}
				else
				{
					var arrRow=TimesStructure.split(';')
					var arrTime=""
					var arrPro=""
					var slice=""
					
					
					
					var oIndex=0
					for(var i=0;i<arrRow.length-1;i++)
					{
						slice=arrRow[i].split('$')
						arrTime=slice[0].split('_')
						arrPro=slice[1].split(',')
												
						insertChildTable(document.all.item(TableID),oIndex,caption,getDetailTypeTitle(arrPro[0]),arrPro[0],GetTime(arrTime[0]),GetTime(arrTime[1]),"0")
						oIndex++
						for(var j=1;j<arrPro.length;j++)
						{
							insertChildTable(document.all.item(TableID),oIndex,caption,getDetailTypeTitle(arrPro[j]),arrPro[j],"0","0","0")
							oIndex++
						}
						if(GetTime(arrTime[1])=="23:59")
						{
							if(caption=='—Ê“ Ã«—Ì')
							{
								caption="<font color='red'>—Ê“ »⁄œ</font>"
							}
							else
							{
								caption="<font color='green'>—Ê“ Ã«—Ì</font>"
							}
						}
					}
					for(var k=document.all.item(TableID).rows.length-1;k>0;k--)
					{
						if(document.all.item(TableID).rows(k).cells(3).innerText=="—Ê“ »⁄œ" && document.all.item(TableID).rows(k).cells(0).innerHTML!="")
						{
							document.all.item(TableID).rows(k).cells(6).style.display="inline"
							return
						}
					}
				}
				if(Mode==1)
				{
					document.getElementById(TableID).rows(0).cells(0).firstChild.disabled=false
				}
				
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		}
		//====================================================================
		//get min and return hour:min
		function GetTime(minute)
		{
			try
			{
				var hour=minute/60
				hour=parseInt(hour,10)
				var min=minute%60
				min=parseInt(min,10)
				var time=""
				if(hour<10)
				{
					time="0"+hour+":"
				}
				else
				{
					time=hour+":"			
				}
				if(min<10)
				{
					time+="0"+min
				}
				else
				{
					time+=min
				}
				return time
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		}
		//================================================================
		function getDetailTypeTitle(DetailTypeID)
		{
			try
			{
				var xmlDoc = new ActiveXObject("Microsoft.XMLDOM")
				xmlDoc.loadXML(document.getElementById("txtDetailType").value)
				xmlDoc.setProperty("SelectionLanguage", "XPath")
				var XmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetDetailType[DetailTypeID="+DetailTypeID+"]")
				if(XmlNodes.length>0)
				{
					return XmlNodes.item(0).selectSingleNode('Title').text
				}
				else
				{
					return ""
				}
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		}
		//=================================================================
		function insertChildTable(oGrid,oIndex,Caption,title,DetailTypeID,STime,ETime,Selected)
		{
			//alert(title)
			
				
			try
			{
				oGrid.insertRow(oIndex)
				oGrid.rows(oIndex).insertCell()
				oGrid.rows(oIndex).insertCell()
				oGrid.rows(oIndex).insertCell()
				oGrid.rows(oIndex).insertCell()
				oGrid.rows(oIndex).insertCell()
				oGrid.rows(oIndex).insertCell()
				oGrid.rows(oIndex).insertCell()
				
				oGrid.rows(oIndex).className = "CssItemHeader2"
				oGrid.rows(oIndex).setAttribute("Caption" ,Caption)
				oGrid.rows(oIndex).setAttribute("Selected" ,Selected)
				oGrid.rows(oIndex).setAttribute("DetailTypeID" ,DetailTypeID)
				
				if(STime.toString()!="0")
				{
					oGrid.rows(oIndex).cells(0).innerHTML="<INPUT type='text' class='txtControls' style='WIDTH:40px'disabled value='"+STime+"'  title='"+STime+"' onkeydown='chekTime(this.value)' onblur='validTime(this),onBlurTxtSTime(this)' onfocus='onfocusTxtTime(this)' />"
					
				}
				else
					oGrid.rows(oIndex).cells(0).innerText=""
					
				if(ETime.toString()!="0")				
				{
					oGrid.rows(oIndex).cells(1).innerHTML="<INPUT type='text' class='txtControls' style='WIDTH:40px' value='"+ETime+"'  title='"+ETime+"' onkeydown='chekTime(this.value)' onblur='validTime(this),onBlurTxtEndTime(this)' onfocus='onfocusTxtTime(this)'/>"
				}
				else
					oGrid.rows(oIndex).cells(1).innerText=""	
				
				oGrid.rows(oIndex).cells(2).innerHTML="<asp:Label  runat='server'>"+title+"</asp:Label>"
				oGrid.rows(oIndex).cells(3).innerHTML="<asp:Label  runat='server'>"+Caption+"</asp:Label>"
				oGrid.rows(oIndex).cells(6).innerHTML="<INPUT type='button' title='ÃœÌœ'  style='BORDER-RIGHT: #346fa4 2px solid; BORDER-TOP: lightsteelblue 2px solid; BACKGROUND-IMAGE: url(/TA/Includes/Images/Icons/NewIcon.gif); BORDER-LEFT: lightsteelblue 2px solid; WIDTH: 24px; CURSOR: hand; BORDER-BOTTOM: #346fa4 2px solid; BACKGROUND-REPEAT: no-repeat; HEIGHT: 22px; BACKGROUND-COLOR:#D5E1FD'  onclick='onclickBtnNew()'>"
				oGrid.rows(oIndex).cells(5).innerHTML="<INPUT type='button'  title='Õ–›'  style='BORDER-RIGHT: #346fa4 2px solid; BORDER-TOP: lightsteelblue 2px solid; BACKGROUND-IMAGE: url(/TA/Includes/Images/Icons/DelIcon.gif); BORDER-LEFT: lightsteelblue 2px solid; WIDTH: 24px; CURSOR: hand; BORDER-BOTTOM: #346fa4 2px solid; BACKGROUND-REPEAT: no-repeat; HEIGHT: 22px; BACKGROUND-COLOR:#D5E1FD'  onclick='onclickbtnDelete(this)'>"
				oGrid.rows(oIndex).cells(4).innerHTML="<INPUT type='button' title='Œ’Ê’Ì« ' style='BORDER-RIGHT: #346fa4 2px solid; BORDER-TOP: lightsteelblue 2px solid; BACKGROUND-IMAGE: url(/TA/Includes/Images/Icons/Pro.gif); BORDER-LEFT: lightsteelblue 2px solid; WIDTH: 24px; CURSOR: hand; BORDER-BOTTOM: #346fa4 2px solid; BACKGROUND-REPEAT: no-repeat; HEIGHT: 22px; BACKGROUND-COLOR:#D5E1FD'  onclick='onclickBtnProperties()' >"
				
				oGrid.rows(oIndex).align="center"
				oGrid.rows(oIndex).cells(6).style.display="none"
				
				oGrid.rows(oIndex).cells(0).style.width="60px"
				oGrid.rows(oIndex).cells(1).style.width="60px"
				oGrid.rows(oIndex).cells(2).style.width="150px"
				oGrid.rows(oIndex).cells(3).style.width="110px"
				oGrid.rows(oIndex).cells(4).style.width="24px"
				oGrid.rows(oIndex).cells(5).style.width="24px"
				oGrid.rows(oIndex).cells(6).style.width="24px"
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
        }
        //=======================================================================
        function OnClickTolerance(SelectedImage)
        {
			
			var oRow=SelectedImage.parentElement.parentElement			
			
			var url="AddTolerance.aspx?DetailCollectionID="+oRow.DetailCollectionID
			+"&Mode="+document.getElementById("txtMode").value
			
			strXML = window.showModalDialog(url,'','dialogHeight:520px;dialogWidth: 550px;dialogleft: 5PX;help: no;scroll:no;status:no')
        }
       //=======================================================================
		function OnClickSubNode(SelectedImage)	
		{
			////try
			//{
				var j;
				var i;
				var oRow=SelectedImage.parentElement.parentElement
				j=oRow.rowIndex
				///for(j=oRow.rowIndex;j<grdSub.rows.length-1;++j)
				//{
					//alert(grdSub.rows.length)
					//if (grdSub.rows(j).cells(1).firstChild==SelectedImage)
						//{
							
							if (grdSub.rows(j+1).style.display=="none")
							{
								
								SelectedImage.src="../../../Includes/Images/Icons/btnNodes.gif"
								
								grdSub.rows(j+1).style.display="inline"
								
								grdSub.rows(j+2).style.display="inline"

							}
							else
							{
								SelectedImage.src="../../../Includes/Images/Icons/btnSubNodes.gif"
								grdSub.rows(j+1).style.display="none"
								grdSub.rows(j+2).style.display="none"
							}
						//}
				//}
			////}
			//catch(e)
			//{
			//	alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			//}
			
		}
		//=========================================================================
		function chekTime(number)
		{
			try
			{
				var key=window.event.keyCode
				window.event.returnValue=
					(
						((key>=96) && (key <=105))||
						((key>=48) && (key <=57 ))||
						(key==8)||(key==9)||(key==46)||
						((key>=35)&& (key<=40)) ||
						(key==186)
						
					)
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		}
		//______________________________________
		function validTime(obj)
		{
			try
			{
				var val=""
				val=ReplaceAll(obj.value," ","")

				if (( val!="") && (IsvalidTime(val)==false))
				{
 					var strQuestion;
 					var intReturn;
			 		
					strQuestion="  ! ·ÿ›« œ—«Ì‰ ﬁ”„  ”«⁄  ’ÕÌÕ Ê«—œ ﬂ‰Ìœ"
					strQuestion=alert(strQuestion, 0, "”«⁄  «‘ »«Â ")
					obj.focus()
					doNothingFlag=1
					return;
					
				}
				else if ((val!="") && (IsvalidTime(val)==true))
				{
					var arr
					if (getCntChar(':',val)==0)
					{
						arr=val
						if (arr.length==1)
							arr="0"+arr+":00"
						else if (arr.length==2)
							arr=arr+":00"
						else if (arr.length==4)
							arr=arr.substr(0,2)+":"+arr.substr(2,2)
					val=arr
					}
					else
					{
						arr=val.split(":")
						var str1=arr[0]
						var str2=arr[1]
						if (str1.length==0)
							str1="00"
						else if (str1.length==1)
							str1="0"+str1
						if (str2.length==0)
							str2="00"
						else if (str2.length==1)
							str2="0"+str2
					val=str1+":"+str2
					
					}
					obj.value=val
					
				}
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		}
		//********************************************
		function IsvalidTime(txt)
		{
			try
			{
				var t1;
				var t2;
				var Hour;
				var Min;
				var arr
				var H;
				var M;
				//************
				if (getCntChar(':',txt)>1)
					return(false)
				//*************	
					
				else if (getCntChar(':',txt)==0)
				{
					if (txt.length==2)
					{
						if (txt>23)
						{
							doNothingFlag=1
							return(false)
						}
						else
						{
							return(true)
						}
					}
					
					if(txt.length==4)
					{
						H=txt.substr(0,2)
						M=txt.substr(2,2)
						
						if (H>23 || M>59)
						{
							doNothingFlag=1
							return(false)
						}
						else
						{
							return(true)
						}
					}
					if (txt.length==1 || txt.length==2)
					{
						return(true)
					}
					else if (txt.length>2)
					{
						doNothingFlag=1
						return(false)
					}
					//************
					if (txt.length>2)
					{
						doNothingFlag=1
						return (false)
					}	
					//***************
				}
				else
				{
					arr=txt.split(":")
					
					Hour=parseInt(arr[0])
   					Min=parseInt(arr[1])
							
					if (Hour>23 || Min>59)
					{
						doNothingFlag=1
						return(false)
					}
					else
					{
						return(true)
					}
				}
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		}

	  //==========================================================================
	  function bindGrid(oGrid)
	  {
		//try
		//{
			var n=0
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM")
			if(document.getElementById("txtXMLDetail").value=="")
				return
			//alert(document.getElementById("txtXMLDetail").value)
			xmlDoc.loadXML(document.getElementById("txtXMLDetail").value)
			xmlDoc.setProperty("SelectionLanguage", "XPath")
			XmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetDetailCollection")
			var XmlLen=XmlNodes.length
			if(XmlNodes.length > 0)
			{
				for(var k=0;k<XmlLen;k++)
				{
					
					addRow(oGrid,XmlNodes.item(k).selectSingleNode('TimesStructure').text.toString(),XmlNodes.item(k).selectSingleNode('Name').text.toString(),XmlNodes.item(k).selectSingleNode('DetailCollectionID').text,XmlNodes.item(k).selectSingleNode('Desc').text,XmlNodes.item(k).selectSingleNode('NormalStart').text.toString(),XmlNodes.item(k).selectSingleNode('NormalEnd').text.toString() ,XmlNodes.item(k).selectSingleNode('Acronym').text)
				}
			}
		//}
		//catch(e)
		//{
			//alert('«ÿ·«⁄«  ‰«œ—”  «” ')
		//}
	  }
		//=====================================================================
		function OnClickbtnTOPCancel()
		{
			window.close()
		}
		////______________________________________________________________________
		function pageLoad()
		{
			window.name="DefinitionDayStructure"
			Form1.target=window.name
			if (Form1.txtModalflag.value =="11")
			{
				document.all.item('btnTOPCancel').style.display='inline'
			}
			try
			{
				if(document.getElementById("txtMode").value==1)
				{
					Mode=1
				}
				else
				{
					Mode=0
				}
				//alert(document.getElementById("txtMode").value)
				var oGrid=document.getElementById("grdSub")
				bindGrid(oGrid)
				if(document.getElementById("txtAlert").value!="")
				{
					alert(document.getElementById("txtAlert").value)
					document.getElementById("txtAlert").value=""
				}
			}
			catch(e)
			{
				alert('«ÿ·«⁄«  ‰«œ—”  «” ')
				//alert(e.message)
			}
		}
	//==========================================================================
		</script>
	</HEAD>
	<body dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="pageLoad()"
		rightMargin="0" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="center" border="0">
				<tr>
					<td vAlign="middle" align="center">
						<table class="CssLayer2" id="Layer2" height="98%" cellSpacing="0" cellPadding="0" width="98%"
							align="center" border="0">
							<tr>
								<td vAlign="middle" align="center">
									<TABLE class="CssPage" id="Page" style=" HEIGHT: 473px" height="473" cellSpacing="1" cellPadding="1"
										align="center" border="0">
										<TR>
											<TD id="TopRow" style="SCROLLBAR-ARROW-COLOR: black; DISPLAY: inline; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 392px; SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: hidden"
												vAlign="middle" align="center">
												<TABLE id="XTabTable_Header" style="WIDTH: 800px; HEIGHT: 31px" width="543">
													<THEAD style="DISPLAY: inline">
														<TR class="ShoperHeaderStyle">
															<TD class="Headerstyle" style="WIDTH: 40px" align="center">
																 ·Ê—«‰”</TD>
															<TD class="Headerstyle" style="WIDTH: 195px" align="center">
																‰«„ ”«Œ «—</TD>
															<TD class="Headerstyle" style="WIDTH: 100px" align="center">
																“„«‰ ‰—„«· ‘—Ê⁄</TD>
															<TD class="Headerstyle" style="WIDTH: 100px" align="center">
																“„«‰ ‰—„«· Œ« „Â</TD>
															<TD class="Headerstyle" align="center" style="WIDTH: 348px"> Ê÷ÌÕ« </TD>
														</TR>
													</THEAD>
												</TABLE>
												<DIV class="DivStyle" style="WIDTH: 800px; HEIGHT: 356px; OVERFLOW: auto">
													<TABLE id="grdSub" ondblclick="ondbClickGrdSub()" onclick="onClickGrdSub()">
														<THEAD style="DISPLAY: none">
														</THEAD>
													</TABLE>
												</DIV>
												<HR style="WIDTH: 58.58%; HEIGHT: 1px; COLOR: black" align="center" width="58.58%" SIZE="1">
												<TABLE id="Table1" style="WIDTH: 162px; HEIGHT: 31px" cellSpacing="3" cellPadding="2" width="162"
													border="0">
													<TR>
														<TD><INPUT class="CssBtnNew" id="btnNewSt" title="«ÌÃ«œ" onclick="onclickBtnNewSt()" type="button"
																name="btnNewSt"></TD>
														<TD><INPUT class="CssBtnEdit" id="btnEdit" title="«’·«Õ" onclick="onclilcbtnEdit()" type="button"
																name="btnEdit"></TD>
														<TD><INPUT class="CssBtnSave" id="btnSave" title="–ŒÌ—Â" onclick="onclickBtnSave()" type="button"
																name="btnSave"></TD>
														<TD><INPUT class="CssBtnDelete" id="btnDeleteST" title="Õ–›" onclick="onclickBtnDeleteST()"
																type="button" name="btnDeleteST"></TD>
														<TD><INPUT class="CssBtnCancel" id="btnTOPCancel" style="DISPLAY: none" onclick="OnClickbtnTOPCancel()"
																type="button" name="btnTOPCancel"></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
								</td>
							</tr>
							<TR>
								<TD style="DISPLAY: none" vAlign="middle" align="center"><input id="txtAlert" name="txtAlert" runat="server"><input id="txtSubmit" name="txtSubmit" runat="server">
									<input id="txtXML" name="txtXML" runat="server"> <input id="txtXMLDetail" name="txtXMLDetail" runat="server">
									<input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
										runat="server" /> <input id="txtDetailType" name="txtDetailType" runat="server">
									<input id="txtMode" name="txtMode" runat="server"> <input runat="server" id="txtDetailCollectionID" name="txtDetailCollectionID">
									<input runat="server" id="txtModalflag" name="txtModalflag"> <input id="txtSessionID" runat="server" NAME="txtSessionID">
									<cc1:mysecurity id="onlineUser" runat="server"></cc1:mysecurity>
								</TD>
							</TR>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
