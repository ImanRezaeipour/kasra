<%@ Page Language="vb" AutoEventWireup="false" Codebehind="PersonShift.aspx.vb" Inherits="TA.PersonShift" validateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Register TagPrefix="uc1" TagName="TextDate" Src="../../../Includes/Calendar/TextDate.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>-------------------------------------------------------------------------«‰ ”«» 
			Å—”‰· »Â 
			‘Ì› -------------------------------------------------------------------</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../Includes/Styles/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="../../../Includes/Script/General.js"></script>
		<script language="javascript" type="text/javascript">
		////////////////////////////////////for grid Group
		var LastSelectedRowgrd=null;
		var LastSelectedRowClassgrd="";
		/****************************************************************/
		function onLoad()
		{
			window.name="PersonShift"
			Form1.target=window.name
			if (Form1.txtModalflag.value =="11")
			{
				document.all.item('btnTOPCancel').style.display='inline'
			}
			//=================================
			if (Form1.Active.value=='' || Form1.Active.value=='TopRow')
			{
				ClearAll()
				ViewTopRow()
			}
			else if (Form1.Active.value=='NewRow')
			{
				Form1.cmbPersonName2.value=0
				Form1.PersonId2.value=""
				ViewNewRow()
			}	
			
			/*****************************Alert*****************************/
			if (Form1.txtMsg.value!="")
			{
			  alert(Form1.txtMsg.value)
			  Form1.txtMsg.value=""
			}
			
		}
		/****************************************************************/
		function OnClickbtnTOPCancel()
		{
			window.close()
		}
		/****************************************************************/
		function ViewTopRow()
		{
			document.all.item('TopRow').style.display='inline'
			document.all.item('DownRow').style.display='none'
			document.all.item('NewRow').style.display='none'
			Form1.Active.value='TopRow'
		}
		/****************************************************************/
		function ViewDownRow()
		{
			RefreshFrame()
			document.all.item('DownRow').style.display='inline'
			document.all.item('TopRow').style.display='none'
			document.all.item('NewRow').style.display='none'
			Form1.Active.value='DownRow'
		}
		/****************************************************************/
		function ViewNewRow()
		{
			//RefreshFrame()
			document.all.item('NewRow').style.display='inline'
			document.all.item('TopRow').style.display='none'
			document.all.item('DownRow').style.display='none'
			Form1.Active.value='DownRow'
		}
		/****************************************************************/
		function changeGridDate()
		{
			var str=window.frames('FGroupMember').document.all.item('txtXMLMember').value
		
			var SDate=Form1.StartDate_txtYear.value+"/"+Form1.StartDate_txtMonth.value+"/"+Form1.StartDate_txtDay.value
			var EDate=Form1.EndDate_txtYear.value+"/"+Form1.EndDate_txtMonth.value+"/"+Form1.EndDate_txtDay.value
			
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(str);
			var xmlNodes;
			xmlNodes=xmlDoc.documentElement.selectNodes("/GroupEntity/EmployeeGroup[ChangeData=1]");
			if(xmlNodes.length!=0)
			{
				for(var i=0;i<xmlNodes.length;++i)
				{
					xmlNodes.item(i).selectSingleNode('StartDate').text=SDate
					xmlNodes.item(i).selectSingleNode('EndDate').text=EDate
				}
			}
			window.frames('FGroupMember').document.all.item('txtXMLMember').value=xmlDoc.xml
			window.frames('FGroupMember').CreateGrid('First')
		}
		/****************************************************************/
		function onClickbtnNew()
		{
			//alert('«Ì‰ ’›ÕÂ ¬„«œÂ ‰„Ì »«‘œ.')
			ClearAll()
			ViewDownRow()
		}
		/****************************************************************/
		function onClickbtnNewInd()
		{
			//ClearAll()
			Form1.txtEditFlag.value=0
			Form1.cmbShiftGroup2.value=0
			Form1.SDate_txtDay.value='';
			Form1.SDate_txtMonth.value='';
			Form1.SDate_txtYear.value='';
			
			Form1.EDate_txtDay.value='';
			Form1.EDate_txtMonth.value='';
			Form1.EDate_txtYear.value='';
			
			//Form1.PersonId2.disabled=false
			//document.all.item("cmbPersonName2").disabled=false
			
			ViewNewRow()
		}
		/****************************************************************/
		function onclickgrd(SelectedRow)
		{
			Form1.txtEditFlag.value=1
			if(LastSelectedRowgrd!=null)
			{
				LastSelectedRowgrd.className=LastSelectedRowClassgrd;
			}
			LastSelectedRowClassgrd=SelectedRow.className;
			LastSelectedRowgrd=SelectedRow;
			SelectedRow.className="CssSelectedItemStyle";
			LoadData(SelectedRow)
		}
		/****************************************************************/
		function LoadData(SelectedRow)
		{
			Form1.GroupId.value=SelectedRow.GroupId;
			Form1.txtHidePersonId.value=SelectedRow.cells(0).innerText
			Form1.txtHideStartDate.value=SelectedRow.cells(3).innerText
			Form1.txtHideEndDate.value=SelectedRow.cells(4).innerText
			
			Form1.cmbShiftGroup1.value=SelectedRow.GroupId; 
			Form1.cmbShiftGroup2.value=SelectedRow.GroupId; 
			
			Form1.cmbPersonName2.value=SelectedRow.cells(0).innerText
			Form1.PersonId2.value=SelectedRow.cells(0).innerText
			/*if (SelectedRow.Active=="1")
				Form1.RbActive.checked=true
			else
				Form1.RbDeactive.checked=true;	*/
								
			var Sd=SelectedRow.cells(3).innerText;
			
			//Form1.StartDate_txtDay.value=Sd.substr(0,2);
			//Form1.StartDate_txtMonth.value=Sd.substr(3,2);
			//Form1.StartDate_txtYear.value=Sd.substr(6,4);
			
			Form1.SDate_txtDay.value=Sd.substr(0,2);
			Form1.SDate_txtMonth.value=Sd.substr(3,2);
			Form1.SDate_txtYear.value=Sd.substr(6,4);
			
			var Ed=SelectedRow.cells(4).innerText;
			//Form1.EndDate_txtDay.value=Ed.substr(0,2);
			//Form1.EndDate_txtMonth.value=Ed.substr(3,2);
			//Form1.EndDate_txtYear.value=Ed.substr(6,4);
			
			Form1.EDate_txtDay.value=Ed.substr(0,2);
			Form1.EDate_txtMonth.value=Ed.substr(3,2);
			Form1.EDate_txtYear.value=Ed.substr(6,4);
		}
		/****************************************************************/
		function ondblclickgrd()
		{
			//Form1.PersonId2.readOnly=true
			//document.all.item("cmbPersonName2").disabled=true
			
			ViewNewRow()
		}
		/****************************************************************/
		function ClearAll()
		{
			Form1.GroupId.value="0";
			//Form1.Name.value="";
			//Form1.Acronym.value="";
			//Form1.cmbCategory.value="0";
			Form1.cmbShiftGroup1.value=0
			Form1.cmbShiftGroup2.value=0
			
			
			//Form1.cmbPersonName2.value=0
			//Form1.PersonId2.value=""
			
			var d=Form1.txtCurDate.value;
			
			/*Form1.StartDate_txtDay.value='01';
			Form1.StartDate_txtMonth.value='01';
			Form1.StartDate_txtYear.value='1301';
			
			Form1.EndDate_txtDay.value='01';
			Form1.EndDate_txtMonth.value='01';
			Form1.EndDate_txtYear.value='1399';*/
			
			Form1.SDate_txtDay.value='';
			Form1.SDate_txtMonth.value='';
			Form1.SDate_txtYear.value='';
			
			Form1.EDate_txtDay.value='';
			Form1.EDate_txtMonth.value='';
			Form1.EDate_txtYear.value='';
			
					
			Form1.txtXMLMember.value=""
		}
		/****************************************************************/
		function onClickbtnEdit()
		{
			Form1.txtEditFlag.value=1
			if ((Form1.GroupId.value!='')&&(Form1.GroupId.value!="0"))
			{
				//Form1.PersonId2.readOnly=true
				//document.all.item("cmbPersonName2").disabled=true
				ViewNewRow()
			}	
			else	
				alert("«» œ« Ìò ”ÿ— «‰ Œ«» ‰„«ÌÌœ")
		}
		/****************************************************************/
		/*function onClickbtnDownNew()
		{
			ClearAll()
			RefreshFrame()
		}*/
		/****************************************************************/
		function onClickbtnCancel()
		{
			ViewTopRow()
		}
		/****************************************************************/
		/*function MakeXML()
		{
			var Str="<GroupEntity><Group>"
			Str+="<GroupId>"+Form1.GroupId.value+"</GroupId>";
			Str+="<Name>"+Form1.Name.value+"</Name>"
			Str+="<Acronym>"+Form1.Acronym.value+"</Acronym>"
			Str+="<CategoryId>"+Form1.cmbCategory.value+"</CategoryId>"
			Str+="<StartDate>"+Form1.StartDate_txtYear.value+"/"+Form1.StartDate_txtMonth.value+"/"+Form1.StartDate_txtDay.value+"</StartDate>"
			Str+="<EndDate>"+Form1.EndDate_txtYear.value+"/"+Form1.EndDate_txtMonth.value+"/"+Form1.EndDate_txtDay.value+"</EndDate>"
			Str+="<Active>"+((Form1.RbActive.checked==true)? 1:0)+"</Active>"
			Str+="</Group></GroupEntity>"
			Form1.txtGroupXML.value=Str;	
		}*/
		/****************************************************************/
		function onClickbtnSave()
		{
			
			if (Form1.cmbShiftGroup1.value==0)
			{
				alert('ê—ÊÂ ‘Ì›  „Ê—œ ‰Ÿ— —« «‰ Œ«» ‰„«∆Ìœ.')
				document.all.item('cmbShiftGroup1').focus()
				return 
			}
			else if(window.frames('FGroupMember').document.all.item('XTabTable').rows.length==0)
			{
				alert('ÂÌç Å—”‰·Ì «‰ Œ«» ‰‘œÂ «” .')
				return 
			}
			
			Form1.txtXMLMember.value = window.frames('FGroupMember').document.all.item('txtXMLMember').value;
			if (Form1.txtXMLMember.value=="")
				Form1.txtXMLMember.value="<GroupEntity><EmployeeGroup></EmployeeGroup></GroupEntity>"
			
			if(groupOverlapCheck())
				Form1.hBtnSave.click()
			else 
				return
			
		}
		/****************************************************************/
		function onClickbtnSaveInd()
		{
			if(Form1.PersonId2.value=="")
			{
				alert("Å—”‰· „Ê—œ ‰Ÿ— —« «‰ Œ«» ‰„«∆Ìœ.")
				document.all.item('PersonId2').focus()
				return
			}
			else if((Form1.SDate_txtDay.value=="")|(Form1.SDate_txtMonth.value=="")|(Form1.SDate_txtYear.value==""))
			{
				alert(" «—ÌŒ ¬€«“ «⁄ »«— —«  ⁄ÌÌ‰ ‰„«∆Ìœ.")
				
				return			
			}
			else if((Form1.EDate_txtDay.value=="")|(Form1.EDate_txtMonth.value=="")|(Form1.EDate_txtYear.value==""))
			{
				alert(" «—ÌŒ Å«Ì«‰ «⁄ »«— —«  ⁄ÌÌ‰ ‰„«∆Ìœ.")
				
				return			
			}
			else if (Form1.cmbShiftGroup2.value==0)
			{
				alert("ê—ÊÂ ‘Ì›  „Ê—œ ‰Ÿ— —« «‰ Œ«» ‰„«∆Ìœ.")
				document.all.item('cmbShiftGroup2').focus()
				return
			}	
			if(Form1.txtEditFlag.value==0)
			{	
				if(overlapCheck())
					Form1.hBtnSaveInd.click()
				else 
					return
			}
			else if(Form1.txtEditFlag.value==1)
				Form1.hBtnEdit.click()
			
				
			
		}
		/****************************************************************/
		function onClickbtnSaveAndNewInd()
		{
			if(Form1.PersonId2.value=="")
			{
				alert("Å—”‰· „Ê—œ ‰Ÿ— —« «‰ Œ«» ‰„«∆Ìœ.")
				return
			}
			else if((Form1.SDate_txtDay.value=="")|(Form1.SDate_txtMonth.value=="")|(Form1.SDate_txtYear.value==""))
			{
				alert(" «—ÌŒ ¬€«“ «⁄ »«— —«  ⁄ÌÌ‰ ‰„«∆Ìœ.")
				return			
			}
			else if((Form1.EDate_txtDay.value=="")|(Form1.EDate_txtMonth.value=="")|(Form1.EDate_txtYear.value==""))
			{
				alert(" «—ÌŒ Å«Ì«‰ «⁄ »«— —«  ⁄ÌÌ‰ ‰„«∆Ìœ.")
				return			
			}
			else if (Form1.cmbShiftGroup2.value==0)
			{
				alert("ê—ÊÂ ‘Ì›  „Ê—œ ‰Ÿ— —« «‰ Œ«» ‰„«∆Ìœ.")
				return
			}	
			
			if(Form1.txtEditFlag.value==0)
			{
				if(overlapCheck())
					Form1.hBtnSaveAndNewInd.click()
				else
					return
			}
			else if(Form1.txtEditFlag.value==1)
				Form1.hBtnEdit.click()	
						
		}
		/****************************************************************/
		function groupOverlapCheck()
		{
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(Form1.XMLPerson.value);
			var xmlNodes;
			//xmlNodes=xmlDoc.documentElement.selectNodes("/ShiftEntity/GetPersonShift");
			
			var strCurS=new String
			var strCurE=new String
			var strStart=new String
			var strEnd=new String
			var intCurS
			var intCurE
			var intStart
			var intEnd
			
			var oTable=window.frames('FGroupMember').document.all.item('XTabTable')
			for(var i=0;i<oTable.rows.length; ++i)
			{
				//alert(oTable.rows(i).cells(3).firstChild.value)
				strStart=oTable.rows(i).cells(3).firstChild.value
				intStart=SHDtoInt(strStart.substring(6,10)+"/"+strStart.substring(3,5)+"/"+strStart.substring(0,2))
				
				strEnd=oTable.rows(i).cells(4).firstChild.value
				intEnd=SHDtoInt(strEnd.substring(6,10)+"/"+strEnd.substring(3,5)+"/"+strEnd.substring(0,2))
				
				if(intStart>intEnd)	
				{
					alert(" «—ÌŒ ¬€«“ Ê Å«Ì«‰ ‰«œ—”  »—«Ì ‘„«—Â Å—”‰·Ì "+oTable.rows(i).cells(1).innerText+"!!!")
					oTable.rows(i).cells(3).firstChild.focus()
					return	false	
				}
			}
			return true
		}
		/****************************************************************/
		function overlapCheck()
		{
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			xmlDoc.loadXML(Form1.XMLPerson.value);
			var xmlNodes;
			xmlNodes=xmlDoc.documentElement.selectNodes("/ShiftEntity/GetPersonShift[PersonelID="+Form1.PersonId2.value+"]");
			//alert(xmlNodes.length)
			var strCurS=new String
			var strCurE=new String
			var intCurS
			var intCurE
			var intStart
			var intEnd
			if (xmlNodes.length!=0)
			{
				for(var i=0;i<xmlNodes.length;++i)
				{
					strCurS=xmlNodes.item(i).selectSingleNode('StartDate').text
					intCurS=SHDtoInt(strCurS.substring(6,10)+"/"+strCurS.substring(3,5)+"/"+strCurS.substring(0,2))
					
					strCurE=xmlNodes.item(i).selectSingleNode('EndDate').text
					intCurE=SHDtoInt(strCurE.substring(6,10)+"/"+strCurE.substring(3,5)+"/"+strCurE.substring(0,2))
					
					intStart=SHDtoInt(Form1.SDate_txtYear.value+"/"+Form1.SDate_txtMonth.value+"/"+Form1.SDate_txtDay.value)
					
					intEnd=SHDtoInt(Form1.EDate_txtYear.value+"/"+Form1.EDate_txtMonth.value+"/"+Form1.EDate_txtDay.value)
					
					if (!(((intStart<intCurS)&&(intEnd<intCurE))||((intStart>intCurS)&&(intEnd>intCurE))))
						if(confirm("»«“Â Ì “„«‰Ì «‰ Œ«» ‘œÂ œ«—«Ì Overlap „Ì »«‘œ. ¬Ì« „«Ì· »Â «œ«„Â ⁄„·Ì«  „Ì »«‘Ìœø"))
							return true
						else
							return false
				}
				return true
			}
			return true
		}
		/****************************************************************/
		/*function CheckNotEmptyData()
		{
			if (Form1.cmbShiftGroup1.value==0)
			{
				alert('‰«„ ê—ÊÂ —« Ê«—œ ‰„«ÌÌœ')
				document.all.item('Name').focus()
				return false
			}
			
		}*/
		/****************************************************************/
		function onClickbtnDelete()
		{
			
			if((LastSelectedRowgrd==null)||(Form1.GroupId.value=="0"))
			{
				alert("«» œ« Ìò ‘Ì›  «‰ Œ«» ‰„«∆Ìœ!")
				return
			}		
			
			if(confirm("ÃÂ  Õ–› ‘Ì›  «‰ Œ«» ‘œÂ „ÿ„∆‰ Â” Ìœøøø"))
			{
				Form1.hBtnDelete.click()
			}
			
			/*if ((Form1.GroupId.value!="0") && (Form1.GroupId.value!=""))
			{
				var rsp=window.confirm("¬Ì« „«Ì· »Â Õ–› «Ì‰ Ê «⁄÷«Ì ¬‰ Â” Ìœø")
				if (rsp==true)
				{
					Form1.txtSubmit.value="Delete"
					Form1.submit()
				}	
			}
			else
				alert("«» œ« Ìò ”ÿ— «‰ Œ«» ‰„«ÌÌœ")*/	
		}
		/****************************************************************/
		/*function onblurFromCRNo()
		{
			Form1.ToCRNo.value=Form1.FromCRNo.value
		}*/
		/****************************************************************/
		function onblurPersonId()
		{
			Form1.cmbPersonName.value=Form1.PersonId.value;
			if (Form1.cmbPersonName.value=="")
			{
				Form1.cmbPersonName.value="0";
				Form1.PersonId.value="";
			}	
		}
		/****************************************************************/
		function onblurPersonId2()
		{
			Form1.cmbPersonName2.value=Form1.PersonId2.value;
			if (Form1.cmbPersonName2.value=="")
			{
				Form1.cmbPersonName2.value="0";
				Form1.PersonId2.value="";
			}
		}
		/****************************************************************/
		function onChangecmbPersonName()
		{
			Form1.PersonId.value=Form1.cmbPersonName.value
		}
		/****************************************************************/
		function onChangecmbPerson2Name()
		{
			Form1.PersonId2.value=Form1.cmbPersonName2.value
		}
		/****************************************************************/
		function RefreshFrame()
		{
			var url;
			url='EmployeeShiftGroup.aspx?GroupId='+Form1.GroupId.value+'&SessionID='+Form1.txtSessionID.value 
			window.frames('FGroupMember').location=url
		}
		/****************************************************************/
		/****************************************************************/
		function selectPerson()
		{
			//window.frames('FGroupMember').selectPerson()
			
			if (Form1.chkPerson.checked==true)
			{
				window.frames('FGroupMember').onclickBtnSelectPerson()
			}
			else if (Form1.chkGroup.checked==true)
			{
				window.frames('FGroupMember').selectPerson()
			}
		}
		/****************************************************************/
		</script>
		<script language="vbscript">
		dim century
		century="13"
		function datechk()
			dim val
			val=replace(window.event.srcElement.value," ","",1,-1,1)
			if (not (val=""))and(not Isvaliddate(val)) then
 			Dim strQuestion, intReturn
			strQuestion="  ! ·ÿ›« œ—«Ì‰ ﬁ”„   «—ÌŒ ‘„”Ì ’ÕÌÕ Ê«—œ ﬂ‰Ìœ"
			strQuestion=MsgBox(strQuestion, 0, " «—ÌŒ ‘„”Ì «‘ »«Â ")
			window.event.srcElement.focus()
			window.event.returnvalue=false
			else
			if val<>"" then
				dim arr
				arr=split(val,"/",-1,0)
				if arr(2)<100  then  
					century="13"
				else	  
					century=""
				end if
				val=right("0" & arr(1),2) & "/" & century & arr(2)
				val=right("0" & arr(0),2) & "/" & val  
				window.event.srcElement.value=val
			end if
			end if
		end function
		'********************
		function isshleap (sal)
		dim ybase_sh,L1

			if sal<100   then  
				sal=sal+1300
			end if
		      
			ybase_sh=int((sal-125)/ 99)*99+125
		      
			L1=((sal-ybase_sh) mod 99)
			if (L1>=98) then
				isshleap=(((L1-89) mod 4 )=0)
			else
				if (L1 >=61) then
						isshleap=(((L1-62) mod 4)=0)
				else 
					if L1 >=28 then
						isshleap=(((L1-29) mod 4)=0)
					else 
						isshleap=((L1 MOD 4)=0)
					end if
				end if
			end if

		END function

		'********************************************
		function Isvaliddate(txt)
		dim   le,t1,t2,sal,mah,roz,arr
		  
		arr=split(txt,"/",-1,0)
		if ubound(arr)=2 then
			roz=cint("0" & arr(0))
   				mah=cint("0" & arr(1))
 				sal=cint("0" & arr(2))
		        
			le=0
			if sal<100   then 
				sal=sal+1300
			end if
		        
			if isshleap(sal)then 
				le=1 
			end if 
		        
			t1= (mah>=1) and (mah<=12)
			t2= (roz>=1) and (roz<=29+le)
			t2= t2 or ((roz=30) and ((mah>=1) and ( mah<=11)))
			t2= t2 or ((roz=31)and((mah>=1) and ( mah<=6 )))

			Isvaliddate= (t1 and t2)
		else
			Isvaliddate=false
		end if
		end function
		'****************************

		function mi2sh(Mdate)
		dim   roz 
		if  isdate(mdate) then
				roz=(mdate - #22 March 1935#)
				Mi2sh=InttoSHD(roz)
		else
				mi2sh=""
		end if
		end function
		'*********************
		function InttoSHD(roz)
		dim   leap,Esal,sal,mahbase,tag 

				sal=0  :   mah =0  :   leap=0 :  tag=0  : Esal=0

				do while roz<00000  :roz=roz+36159 :sal=sal-99 :loop
				do while roz>36158  :roz=roz-36159 :sal=sal+99 :loop

				select case roz
					case 10591 '{1342/12/30} :roz=365  :sal=sal+1342
					case 22644 '{1375/12/30} :roz=365  :sal=sal+1375
					case 36158 '{1412/12/30} :roz=365  :sal=sal+1412
					case else
        			if (roz>=00000) and (roz<=10225) then
						tag=1  :Esal=0  :base=00000 
						end if
			
					if (roz>=10226) and (roz<=10590) then
						tag=2 :Esal=1  :base=10226 
						end if

					if (roz>=10592) and (roz<=22278) then
        				tag=3 :Esal=1  :base=10592 
						end if
		          
					if (roz>=22279) and (roz<=22643) then
        				tag=4 :Esal=2  :base=22279 
						end if

					if (roz>=22645) and (roz<=35792) then
        				tag=5 :Esal=2 :base=22645  
						end if

					if (roz>=35793) and (roz<=36157) then
        				tag=6 :Esal=3 :base=35793  
						end if
			end select

			if ((tag mod 2)=1 ) and ( ((roz-base+1) mod 1461 )=0 ) then
				roz=roz-1 :leap=1
			end if

			if tag>0 then
				roz=roz-Esal*365 
				roz=roz-int(roz / 1461)
				sal=Esal+sal+ int(roz / 365)+1314
       			roz=roz mod 365+leap
			end if

			if roz>=186 then
				roz=roz-186  :mah=6+int(roz / 30) :roz=roz mod 30
			else
				mah=int(roz / 31) :roz=roz mod 31
			end if
		       
			InttoSHD=cstr(sal)+"/"+right("0"&(mah+1),2)+"/"+right("0"&(roz+1),2)
		end function
		'*************************************************
		function SHDtoInt(shd)
		dim  sal,mah,roz,Tr,arr
		      
		arr=split(shd,"/",-1,1)
		if ubound(arr)=2 then
			sal=cint(arr(0)) 
			mah=cint(arr(1))-1
			roz=cint(arr(2))-1
			Tr=0
		      
			if sal <100 then sal=1300+sal end if
			sal=sal-1314

			do while sal<0  :  tr=tr-36159-366 : sal=sal+100 : loop
			do while sal>98 :  Tr=Tr+36159     : sal=sal-99  : loop
		      

			if (sal>=0 and sal<=27)  then   Tr=Tr+sal*365+(sal\4)      end if
			if (sal>=28 and sal<=60) then   Tr=Tr+sal*365+((sal-1)\ 4) end if
			if (sal>=61 and sal<=97) then   Tr=Tr+sal*365+((sal-2)\ 4) end if
			if  (sal=98)             then   Tr=Tr+sal*365+((sal-3)\ 4) end if
		      
			if mah>6 then
				Tr=Tr+(mah-6)*30+186
			else 
				Tr=Tr+mah*31
			end if

			SHDtoInt=Tr+roz
		else
			alert("«‘ﬂ«· œ—  «—ÌŒ ‘„”Ì")
			SHDtoInt=0
		end if
		end function
		'*******************************
		function Between(date1,date2)
		between=SHDtoInt(date2)-SHDtoInt(date1)+1
		end function
		'*******************************
		function shdAdd(Sdate,days)
		days=cint(days)
		if days<>0 then 
				shdAdd=InttoSHD(SHDtoInt(cstr(Sdate))+days)
		else
				shdAdd=Sdate
		end if
		end function
		'*******************************
		</script>
	</HEAD>
	<body dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="onLoad()"
		rightMargin="0">
		<FORM id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="center" border="0">
				<tr>
					<td vAlign="middle" align="center">
						<table class="CssLayer2" id="Layer2" height="100%" cellSpacing="0" cellPadding="0" width="100%"
							border="0">
							<tr>
								<td vAlign="middle" align="center">
									<TABLE class="CssPage" id="Layer3" style="WIDTH: 642px; HEIGHT: 367px" height="367" cellSpacing="0"
										cellPadding="0" width="642" border="0">
										<TR>
											<TD id="TopRow" style="DISPLAY: inline; HEIGHT: 535px" vAlign="top" align="center" runat="server">
												<TABLE id="Table1" style="WIDTH: 430px; HEIGHT: 16px" cellSpacing="1" cellPadding="1" width="430"
													border="0">
													<TR>
														<TD style="WIDTH: 81px; HEIGHT: 32px">‘„«—Â Å—”‰·Ì</TD>
														<TD style="WIDTH: 112px; HEIGHT: 32px"><INPUT class="txtControls" id="PersonId" onkeydown="OnKeyDownNum('integer',this.value)"
																onblur="onblurPersonId()" style="WIDTH: 110px; HEIGHT: 20px" type="text" size="13" name="PersonId" runat="server"></TD>
														<TD dir="ltr" style="WIDTH: 97px; HEIGHT: 32px" align="right">‰«„ Ê ‰«„ Œ«‰Ê«œêÌ</TD>
														<TD style="WIDTH: 126px; HEIGHT: 32px">&nbsp;
															<cc1:lcombo id="cmbPersonName" runat="server" onchange="onChangecmbPersonName()" Width="116px"
																CssClass="txtControls" LookupName="PersonName" ConnectionName="SysCnn"></cc1:lcombo></TD>
													</TR>
												</TABLE>
												<TABLE id="Table5" style="WIDTH: 430px; HEIGHT: 36px" cellSpacing="1" cellPadding="1" width="430"
													border="0">
													<TR>
														<TD style="WIDTH: 78px">ê—ÊÂ ‘Ì› </TD>
														<TD style="WIDTH: 119px"><cc1:lcombo id="cmbShiftGroup" runat="server" Width="116px" CssClass="txtControls" LookupName="ShiftGroup"
																ConnectionName="GenCnn"></cc1:lcombo></TD>
														<TD align="left"><INPUT class="CssBtnLimitSerach" id="BtnShow" style="WIDTH: 94px; HEIGHT: 32px" type="button"
																name="BtnShow" runat="server"><INPUT class="CssBtnShow" id="BtnShowAll" type="button" name="BtnShowAll" runat="server"></TD>
													</TR>
												</TABLE>
												<TABLE id="Table2" style="WIDTH: 518px; HEIGHT: 368px" cellSpacing="5" cellPadding="2"
													width="518" border="0">
													<TR>
														<TD vAlign="top" align="center">
															<TABLE id="Table11" dir="ltr" style="WIDTH: 264px; HEIGHT: 32px" cellSpacing="1" cellPadding="1"
																align="center" border="0">
																<TR>
																	<TD style="WIDTH: 34px"><asp:button id="FirstBtn" runat="server" Width="29px" CssClass="CssFirstPage" Height="26px"
																			BorderStyle="None" BorderColor="Transparent" ToolTip="«Ê·Ì‰" BackColor="Transparent"></asp:button></TD>
																	<TD align="right"><asp:button id="PrevBtn" runat="server" Width="29px" CssClass="CssPrevPage" Height="24px" BorderStyle="None"
																			BorderColor="Transparent" ToolTip="ﬁ»·Ì" BackColor="Transparent"></asp:button></TD>
																	<TD vAlign="middle" align="right"><asp:textbox id="Totalpage1" runat="server" Width="40px" CssClass="txtControls" Height="24px"
																			BorderStyle="Groove" BackColor="White" ReadOnly="True"></asp:textbox></TD>
																	<TD dir="rtl" vAlign="top" align="right">&nbsp; «“&nbsp;&nbsp;&nbsp;</TD>
																	<TD vAlign="middle"><asp:textbox id="CurPage" tabIndex="1" runat="server" Width="40px" CssClass="txtControls" Height="24px"
																			BorderStyle="Groove" AutoPostBack="True"></asp:textbox></TD>
																	<TD><asp:button id="NextBtn" runat="server" Width="29px" CssClass="CssNextPage" Height="24px" BorderStyle="None"
																			BorderColor="Transparent" ToolTip="»⁄œÌ" BackColor="Transparent"></asp:button></TD>
																	<TD><asp:button id="LastBtn" runat="server" Width="29px" CssClass="CssLastPage" Height="24px" BorderStyle="None"
																			BorderColor="Transparent" ToolTip="¬Œ—Ì‰" BackColor="Transparent"></asp:button></TD>
																	<TD style="DISPLAY: none"><INPUT id="txtReturnMessage1" type="text" name="txtReturnMessage1" runat="server">
																		<asp:button id="Button1" style="DISPLAY: none" runat="server" Width="1px" Text="Button"></asp:button><asp:textbox id="OrderField1" style="DISPLAY: none" runat="server" Width="1px"></asp:textbox></TD>
																</TR>
															</TABLE>
															<cc1:automationgrid id="grdPersonShift" runat="server" Width="701px" Height="296px" AutoGenerateColumns="False"
																SendXML="DoNotSend" SelectRowOnClick="False" ClientPageSize="0" Scrolling="True" EnableClientPager="False"
																ShowHeader="False" SelectRowOnMouseMove="False" UsingKeyBoard="False" CreateClientSideScripts="False"
																ClientSorting="False" HtcAddress=" ">
																<ITEMSTYLE CssClass="CssItemStyle"></ITEMSTYLE>
																<HEADERSTYLE CssClass="CssHeaderStyle" VerticalAlign="Middle" HorizontalAlign="Center"></HEADERSTYLE>
																<ALTERNATINGITEMSTYLE CssClass="CssAlternatingItemStyle"></ALTERNATINGITEMSTYLE>
																<FOOTERSTYLE CssClass="CssEditItemStyle "></FOOTERSTYLE>
																<SELECTEDITEMSTYLE CssClass="CssSelectedItemStyle"></SELECTEDITEMSTYLE>
																<COLUMNS>
																	<ASP:BOUNDCOLUMN HeaderText="‘„«—Â Å—”‰·Ì" DataField="PersonelID">
																		<HEADERSTYLE Width="150px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="150px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="‰«„ Ê ‰«„ Œ«‰Ê«œêÌ" DataField="FullName">
																		<HEADERSTYLE Width="200px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="200px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="ê—ÊÂ ‘Ì› " DataField="GroupName">
																		<HEADERSTYLE Width="150px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="150px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="«“  «—ÌŒ" DataField="StartDate">
																		<HEADERSTYLE Width="100px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="100px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText=" «  «—ÌŒ" DataField="EndDate">
																		<HEADERSTYLE Width="100px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="100px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN DataField="GroupId" Visible="False">
																		<HEADERSTYLE Width="1px"></HEADERSTYLE>
																		<ITEMSTYLE Width="1px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																</COLUMNS>
															</cc1:automationgrid></TD>
													</TR>
												</TABLE>
												<HR class="CssHorizontalLine" style="WIDTH: 367px; HEIGHT: 2px" SIZE="2">
												<TABLE id="Table6" style="WIDTH: 20px; HEIGHT: 46px" cellSpacing="5" cellPadding="2" width="20"
													align="center" border="0">
													<TR>
														<TD style="WIDTH: 76px"><INPUT class="CssBtnNew" id="btnNewInd" title="«ÌÃ«œ ›—œÌ" onclick="onClickbtnNewInd()"
																type="button" name="btnNewDown"></TD>
														<TD style="WIDTH: 75px"><INPUT class="CssbtnEdit" id="btnEdit" title="«’·«Õ ›—œÌ" onclick="onClickbtnEdit()" type="button"
																name="btnEdit"></TD>
														<TD><INPUT class="CssBtnNew" id="btnTopNew" title="«ÌÃ«œ ê—ÊÂÌ" onclick="onClickbtnNew()" type="button"
																name="btnNewDown"></TD>
														<TD><INPUT class="CssBtnDelete" id="btnDelete" onclick="onClickbtnDelete()" type="button" name="btnDelete"></TD>
														<TD><INPUT class="CssBtnCancel" id="btnTOPCancel" style="DISPLAY: none" onclick="OnClickbtnTOPCancel()"
																type="button" name="btnTOPCancel"></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD id="DownRow" style="DISPLAY: none" vAlign="middle" align="center">
												<TABLE id="Table12" cellSpacing="1" cellPadding="1" width="80%" border="0">
													<TR>
														<TD>ê—ÊÂ ‘Ì› </TD>
														<TD><cc1:lcombo id="cmbShiftGroup1" runat="server" Width="124px" CssClass="txtControls" LookupName="ShiftGroup"
																ConnectionName="GenCnn"></cc1:lcombo></TD>
														<TD style="WIDTH: 273px" vAlign="middle" align="right" colSpan="2">
															<TABLE id="Table10" style="BORDER-RIGHT: lightblue thin inset; BORDER-TOP: lightblue thin solid; BORDER-LEFT: lightblue thin outset; WIDTH: 304px; BORDER-BOTTOM: lightblue thin solid; HEIGHT: 38px"
																height="38" cellSpacing="1" cellPadding="1" width="304" border="0">
																<TR>
																	<TD style="WIDTH: 179px"><INPUT id="chkPerson" type="radio" CHECKED value="Radio1" name="Group" runat="server">Å—”‰· 
																		ÃœÌœ&nbsp; <INPUT id="chkGroup" type="radio" value="Radio1" name="Group" runat="server">ê—ÊÂ 
																		ÃœÌœ</TD>
																	<TD id="PersonIDTD" style="COLOR: #ff0000" runat="server"><INPUT class="btnSelectPerson" id="BtnSelectPerson" style="WIDTH: 125px; HEIGHT: 30px"
																			onclick="selectPerson()" type="button" name="BtnSelectPerson"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD> «—ÌŒ ‘—Ê⁄ «⁄ »«—</TD>
														<TD><uc1:textdate id="StartDate" runat="server"></uc1:textdate></TD>
														<TD> «—ÌŒ Œ« „Â «⁄ »«—</TD>
														<TD style="WIDTH: 161px">
															<uc1:textdate id="EndDate" runat="server"></uc1:textdate><INPUT id="btnChangeDate" onclick="changeGridDate()" style="BACKGROUND: url(/TA/Includes/Images/Icons/Down.gif) #edf1ff fixed no-repeat center center; WIDTH: 23px; HEIGHT: 24px"
																type="button" class="CssBtnUp"></TD>
													</TR>
												</TABLE>
												<HR class="CssHorizontalLine" style="WIDTH: 367px; HEIGHT: 2px" SIZE="2">
												<TABLE id="Table7" style="WIDTH: 726px; HEIGHT: 356px" cellSpacing="5" cellPadding="2"
													width="726" border="0">
													<TR>
														<TD vAlign="top" align="center"><IFRAME id="FGroupMember" src='EmployeeShiftGroup.aspx?SessionID=<%=request("SessionID")%>' frameBorder="no" width="100%" height="100%"
																style="WIDTH: 101.42%; HEIGHT: 100%"> </IFRAME>
														</TD>
													</TR>
												</TABLE>
												<HR class="CssHorizontalLine" style="WIDTH: 367px; HEIGHT: 2px" SIZE="2">
												<TABLE id="Table4" style="WIDTH: 6px; HEIGHT: 40px" cellSpacing="5" cellPadding="2" width="6"
													align="center" border="0">
													<TR>
														<TD style="WIDTH: 75px"><INPUT class="CssbtnSave" id="btnSave" onclick="onClickbtnSave()" type="button" name="btnSave"></TD>
														<TD><INPUT class="CssBtnCancel" id="btnCancel" onclick="onClickbtnCancel()" type="button" name="btnCancel"></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD id="NewRow" style="DISPLAY: none" vAlign="middle" align="center">
												<TABLE id="Table8" style="WIDTH: 500px; HEIGHT: 82px" cellSpacing="2" cellPadding="1" width="500"
													border="0">
													<TR>
														<TD width="100">‘„«—Â Å—”‰·Ì</TD>
														<TD><INPUT class="txtControls" id="PersonId2" onkeydown="OnKeyDownNum('integer',this.value)"
																onblur="onblurPersonId2()" style="WIDTH: 110px; HEIGHT: 20px" type="text" size="13"
																name="PersonId2" runat="server"></TD>
														<TD width="100">‰«„ Å—”‰·</TD>
														<TD><cc1:lcombo id="cmbPersonName2" runat="server" onchange="onChangecmbPerson2Name()" Width="116px"
																CssClass="txtControls" LookupName="PersonName" ConnectionName="SysCnn"></cc1:lcombo></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 24px" width="100"> «—ÌŒ ‘—Ê⁄ «⁄ »«—</TD>
														<TD style="HEIGHT: 24px"><uc1:textdate id="SDate" runat="server"></uc1:textdate></TD>
														<TD style="HEIGHT: 24px" width="100"> «—ÌŒ Œ« „Â «⁄ »«—</TD>
														<TD style="HEIGHT: 24px"><uc1:textdate id="EDate" runat="server"></uc1:textdate></TD>
													</TR>
													<TR>
														<TD width="100">ê—ÊÂ ‘Ì› </TD>
														<TD><cc1:lcombo id="cmbShiftGroup2" runat="server" Width="124px" CssClass="txtControls" LookupName="ShiftGroup"
																ConnectionName="GenCnn"></cc1:lcombo></TD>
														<TD width="100"></TD>
														<TD></TD>
													</TR>
												</TABLE>
												<TABLE id="Table9" style="WIDTH: 6px; HEIGHT: 40px" cellSpacing="5" cellPadding="2" width="6"
													align="center" border="0">
													<TR>
														<TD style="WIDTH: 76px"><INPUT class="CssBtnSaveAndNew" id="btnSaveAndNewInd" style="WIDTH: 107px; HEIGHT: 32px"
																onclick="onClickbtnSaveAndNewInd()" type="button" name="btnSaveAndNewInd"></TD>
														<TD style="WIDTH: 75px"><INPUT class="CssbtnSave" id="btnSaveInd" onclick="onClickbtnSaveInd()" type="button" name="btnSaveInd"></TD>
														<TD><INPUT class="CssBtnCancel" id="Button3" onclick="onClickbtnCancel()" type="button" name="btnCancel"></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD style="DISPLAY: none" vAlign="middle" align="center">
												<input type="text" id="txtSessionID" runat="server" NAME="txtSessionID">
												<cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity><input id="XMLPerson" type="text" size="1" name="XMLPerson" runat="server"><INPUT id="Active" type="text" size="1" name="Active" runat="server">
												<INPUT id="txtMsg" type="text" size="1" name="txtMsg" runat="server"><INPUT id="txtHidePersonId" type="text" size="1" name="txtHidePersonId" runat="server"><INPUT id="txtHideStartDate" type="text" size="1" name="txtHideStartDate" runat="server"><INPUT id="txtEditFlag" type="text" size="1" name="txtEditFlag" runat="server"><INPUT id="GroupId" type="text" size="1" name="GroupId" runat="server">
												<input id="txtXMLMember" type="text" size="1" name="txtXMLMember" runat="server"><INPUT id="txtHideEndDate" type="text" size="1" name="txtHideEndDate" runat="server"><input id="txtGroupXML" type="text" size="1" name="txtGroupXML" runat="server">
												<input type="text" id="txtModalflag" runat="server" NAME="txtModalflag"><input id="txtSubmit" type="text" size="1" name="txtSubmit" runat="server"><input id="txtCurDate" type="text" size="1" name="txtCurDate" runat="server">
												<asp:button id="hBtnSave" runat="server" Text="Button"></asp:button><asp:button id="hBtnEdit" runat="server" Text="Button"></asp:button><asp:button id="hBtnSaveInd" runat="server" Text="Button"></asp:button><asp:button id="hBtnSaveAndNewInd" runat="server" Text="Button"></asp:button><asp:button id="hBtnDelete" runat="server" Text="Button"></asp:button></TD>
										</TR>
									</TABLE>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</FORM>
	</body>
</HTML>
