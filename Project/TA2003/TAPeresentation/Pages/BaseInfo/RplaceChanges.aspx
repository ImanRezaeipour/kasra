<%@ Page Language="vb" AutoEventWireup="false" Codebehind="RplaceChanges.aspx.vb" Inherits="TA.RplaceChanges" validateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Register TagPrefix="uc1" TagName="TextDate" Src="../../../Includes/Calendar/TextDate.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>----------------------------------------------------------------- €ÌÌ—«  
			Ã«»Ã«ÌÌ Ê 
			Ã«Ìê“Ì‰Ì-----------------------------------------------------------------</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../Includes/Styles/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="../../../Includes/Script/General.js"></script>
		<script language="javascript" src="../../../Includes/Script/KeySorting.js"></script>
		<script language="javascript">
		/****************************************************************/
		var LastSelectedRowgrd=null;
		var LastSelectedRowClassgrd = "";
	
		function onLoad() {
			window.name="RplaceChanges"
			Form1.target = window.name

			if (Form1.txtStartDate.value != "") {

			    var SDateArr = Form1.txtStartDate.value.split("/")
			    if(parseInt(SDateArr[0],10)<100)
			        Form1.StartDate_txtYear.value = '13' + SDateArr[0]
			    else
			        Form1.StartDate_txtYear.value = SDateArr[0]

			    Form1.StartDate_txtMonth.value = SDateArr[1]
			    Form1.StartDate_txtDay.value = SDateArr[2]
			}

			if (Form1.txtEndDate.value != "") {

			    var EDateArr = Form1.txtEndDate.value.split("/")
			    if (parseInt(EDateArr[0], 10) < 100)
			        Form1.EndDate_txtYear.value = '13' + EDateArr[0]
			    else
			        Form1.EndDate_txtYear.value = EDateArr[0]

			    Form1.EndDate_txtMonth.value = EDateArr[1]
			    Form1.EndDate_txtDay.value = EDateArr[2]
			}
			
			if (Form1.txtModalflag.value =="11")
			{
				document.all.item('btnTOPCancel').style.display='inline'
			}

			onblurtxtMotaghaziId()
		
			onblurtxttxtJaneshinId()
			onblurtxtMot()
			onblurtxttxtJan()
			if (Form1.txtNew.value=="New")
			{
				onclickbtnNew()
				Form1.txtNew.value=""
			}
			if (Form1.Active.value=='DownRow')
			{
				onblurtxttxtJaneshinId()
				onblurtxtMotaghaziId()
				ViewDownRow()
			}
			else if (Form1.Active.value=='TopRow')
				ViewTopRow()
				if(document.getElementById("txtAlert").value!="")
				{
					alert(document.getElementById("txtAlert").value)
					document.getElementById("txtAlert").value=""
					
				}
			
			var grdName='<%=request("grdName")%>'
			var strCells='<%=request("strCells")%>'
			var strType='<%=request("strType")%>'	
			onLoadGrdHeaderForSort(grdName,strCells,strType)
			
		}
		/****************************************************************/
		function OnClickbtnTOPCancel()
		{
			window.close()
		}
		/****************************************************************/
		function onclickbtnNew()
		{
			ClearAll()
			ViewDownRow()	
		}
		/****************************************************************/
		function onclickBtnCancel()
		{
			ViewTopRow()
		}
		/****************************************************************/
		function ClearAll()
		{
			Form1.tDate_txtYear.value=Form1.txtToday.value.substr(0,4)
			Form1.tDate_txtMonth.value=Form1.txtToday.value.substr(5,2)
			Form1.tDate_txtDay.value=Form1.txtToday.value.substr(8,2)
			Form1.txtMotaghaziId.value=""
			Form1.txtJaneshinId.value =""
			Form1.txtdesc.value =""
			Form1.ReplacementID.value ="0"
			Form1.rdojbj.checked=false
			Form1.rdoJgz.checked=true
			Form1.cmbJaneshinName.value="0";
			Form1.cmbMotaghaziName.value="0";
		}
		/****************************************************************/
		function ViewTopRow()
		{
			document.all.item('TopRow').style.display='inline'
			document.all.item('DownRow').style.display='none'
			Form1.Active.value='TopRow'
		}
		/****************************************************************/
		function ViewDownRow()
		{
			document.all.item('DownRow').style.display='inline'
			document.all.item('TopRow').style.display='none'
			Form1.Active.value='DownRow'
		}
		/****************************************************************/
		function onClickBtnSaveAndContinue()
		{
			Form1.txtNew.value="New"
			onclickbtnSave()
			
		}
		/****************************************************************/
		function onclickbtnSave()
		{
			if(Form1.ReplacementID.value=="")
			{
				Form1.ReplacementID.value=0
			}
			/*******************/
			if(Form1.rdojbj.checked==true)
				Form1.txtFlag.value=1
			else if(Form1.rdoJgz .checked==true)
				Form1.txtFlag.value=2
			else 
				Form1.txtFlag.value=3
			/*********************/
			Form1.txtDate.value=Form1.tDate_txtYear.value+"/"+ Form1.tDate_txtMonth.value+"/"+	Form1.tDate_txtDay.value
			Form1.txtSDate.value= Form1.txtDate.value.substr(2,10)
			if(Form1.txtJaneshinId.value==""||Form1.txtMotaghaziId.value=="" || Form1.txtSDate.value=="" ||Form1.txtFlag.value==3)
			{
				alert('«ÿ·«⁄«  —« ò«„· ò‰Ìœ')
			}
			else
			{
				if(flag==1)
				{
					Form1.txtSubmit.value="Update"
					flag=0
				}
				else
				{
					//Form1.ReplacementID.value=0
					Form1.txtSubmit.value="Save"
				}
				Form1.submit()
			}
	    }
		/****************************************************************/
		function onblurtxtMotaghaziId()
		{
		
			Form1.cmbMotaghaziName.value=Form1.txtMotaghaziId .value;
			if ((Form1.cmbMotaghaziName.value=="0")||(Form1.cmbMotaghaziName.value==""))
			{
				Form1.cmbMotaghaziName.value="0"
				Form1.txtMotaghaziId.value="";
			}
			if (Form1.txtMotaghaziId.value=="0")
				Form1.txtMotaghaziId.value=""
		}	
		/***************************************************************/
		function onblurtxttxtJaneshinId()
		{
		
			Form1.cmbJaneshinName.value=Form1.txtJaneshinId.value;
			if ((Form1.cmbJaneshinName.value=="0")||(Form1.cmbJaneshinName.value==""))
			{
				Form1.cmbJaneshinName.value="0"
				Form1.txtJaneshinId.value="";
			}
			if (Form1.txtJaneshinId.value=="0")
				Form1.txtJaneshinId.value=""
		}	
		/**************************************************************/
		function onChangecmbJaneshinName()
		{
			Form1.txtJaneshinId.value=Form1.cmbJaneshinName.value
			if (Form1.txtJaneshinId.value=="0")
				Form1.txtJaneshinId.value=""
		}
		/**************************************************************/
		function onChangecmbMotaghaziName()
		{
			Form1.txtMotaghaziId.value=Form1.cmbMotaghaziName.value
			if (Form1.txtMotaghaziId.value=="0")
				Form1.txtMotaghaziId.value=""
		}
		/*******************************************/
		function onblurtxtMot()
		{
			Form1.cmbMot.value=Form1.txtMot.value;
			if (Form1.cmbMot.value=="")
			{
				Form1.cmbMot.value="0";
				Form1.txtMot.value="";
			}
			if (Form1.txtMot.value=="0")
				Form1.txtMot.value=""
		}	
		/***************************************************************/
		function onblurtxttxtJan()
		{
		
			Form1.cmbJan.value=Form1.txtJan.value;
			if (Form1.cmbJan.value=="")
			{
				Form1.cmbJan.value="0";
				Form1.txtJan.value="";
			}
			if (Form1.txtJan.value=="0")
				Form1.txtJan.value=""
		}	
		/**************************************************************/
		function onChangecmbJan()
		{
			Form1.txtJan.value=Form1.cmbJan.value
			if (Form1.txtJan.value=="0")
				Form1.txtJan.value=""
		}
		/**************************************************************/
		function onChangecmbMot()
		{
			Form1.txtMot.value=Form1.cmbMot.value
			if (Form1.txtMot.value=="0")
				Form1.txtMot.value=""
		}
		/***************************************************************/
		function onclickbtnShowlimit() {

		    var SDate, EDate;
		    SDate = Form1.StartDate_txtYear.value + "/" + Form1.StartDate_txtMonth.value + "/" + Form1.StartDate_txtDay.value
		    EDate = Form1.EndDate_txtYear.value + "/" + Form1.EndDate_txtMonth.value + "/" + Form1.EndDate_txtDay.value

		    if (Between(SDate, EDate) <= 0) {
		        alert(" «—ÌŒ ‘—Ê⁄ ﬂÊçﬂ — «“  «—ÌŒ Œ« „Â „Ì »«‘œ")
		        return
		    }
		        
		    
			Form1.txtStartDate.value=Form1.StartDate_txtYear.value+"/"+ Form1.StartDate_txtMonth.value+"/"+	Form1.StartDate_txtDay.value
			Form1.txtStartDate.value=Form1.txtStartDate.value.substr(2,10)
			Form1.txtEndDate.value=Form1.EndDate_txtYear.value+"/"+ Form1.EndDate_txtMonth.value+"/"+Form1.EndDate_txtDay.value
			Form1.txtEndDate.value = Form1.txtEndDate.value.substr(2, 10)


			
			
			if(Form1.chMot.checked==true && Form1.chJAy.checked==true)
			{
				Form1.txtChk.value=0
			}
			else if(Form1.chMot.checked==true)
			{
				Form1.txtChk.value=1
			}
			else if(Form1.chJAy.checked==true)
			{
				Form1.txtChk.value=2
			}	
			else if(Form1.chMot.checked==false && Form1.chJAy.checked==false)
			{
				Form1.txtChk.value=0
			}
			Form1.txtSubmit .value="Show"
			Form1.submit()
		}
		/***************************************************************/
			function onclickgrd(SelectedRow)
		{
			if(LastSelectedRowgrd!=null)
			{
				LastSelectedRowgrd.className=LastSelectedRowClassgrd;
			}
			LastSelectedRowClassgrd=SelectedRow.className;
			LastSelectedRowgrd=SelectedRow;
			SelectedRow.className="CssSelectedItemStyle";
			Form1.ReplacementID.value=LastSelectedRowgrd.ReplacementID	
			Form1.txtType.value=LastSelectedRowgrd.Type
			
		}
		////////////////////////////////////////////////////////////////
		var flag
		function onclickbtnEdit()
		{
			ClearAll()
			if (LastSelectedRowgrd!=null)
			{
				flag=1
				ViewDownRow()
				Form1.txtJaneshinId.value=LastSelectedRowgrd.cells(3).innerText
				Form1.txtMotaghaziId.value=LastSelectedRowgrd.cells(1).innerText
				Form1.tDate_txtYear.value=LastSelectedRowgrd.cells(5).innerText.substr(6,4)
				Form1.tDate_txtMonth.value=LastSelectedRowgrd.cells(5).innerText.substr(3,2)
				Form1.tDate_txtDay.value=LastSelectedRowgrd.cells(5).innerText.substr(0,2)
				Form1.ReplacementID.value=LastSelectedRowgrd.ReplacementID	
				Form1.txtdesc.value=LastSelectedRowgrd.cells(6).innerText
					if(Form1.txtType.value==1)
					{
						Form1.rdojbj.checked=true
					}
					else if(Form1.txtType.value==2)
					{
						Form1.rdoJgz.checked=true
					}
				onblurtxttxtJaneshinId()
				onblurtxtMotaghaziId()
			}	
			else
				alert(' ›—œÌ »—«Ì «’·«Õ «‰ Œ«» ‰‘œÂ')
		
		}
		///////////////////////////////////////////////////////
		function ondblclickgrd()
		{
			onclickbtnEdit()
		}
		////////////////////////////////////////////////////////
		function onclickbtnDelete()
		{
		
			if(Form1.ReplacementID.value=="")
			{
				alert('›—œÌ »—«Ì Õ–› «‰ Œ«» ‰‘œÂ ')
			}
		
			else {

			    if (LastSelectedRowgrd != null) {
			        if (confirm("¬Ì« »—«Ì Ã–› „ÿ„∆‰ Â” Ìœø")) {
			            Form1.txtSubmit.value = "Delete"
			            Form1.submit()
			        }
			    }
			    else {
			        alert("›—œÌ »—«Ì Õ–› «‰ Œ«» ‰‘œÂ «” ")
			        return
			    }
			}
		}
		/////////////////////////////////////////////////////
		
		</script>
		<script language="vbscript">
		'#ccaecc
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
	<body dir="rtl" onclick="onclickBodyForSort('RplaceChanges.aspx',grdGroup)" bottomMargin="0"
		leftMargin="0" topMargin="0" scroll="no" onload="onLoad()" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="center" border="0">
				<tr>
					<td vAlign="middle" align="center">
						<table class="CssLayer2" id="Layer2" height="100%" cellSpacing="0" cellPadding="10" width="100%"
							border="0">
							<tr>
								<td vAlign="middle" align="center">
									<TABLE class="CssPage" id="Layer3" cellSpacing="0" cellPadding="0" border="0">
										<TR>
											<TD id="TopRow" style="DISPLAY: inline; HEIGHT: 460px" vAlign="top" align="center">
												<TABLE id="Table1" style="WIDTH: 799px; HEIGHT: 432px" height="432" cellSpacing="1" cellPadding="1"
													width="799" border="0">
													<tr>
														<td class="DivStyle" style="SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; HEIGHT: 66px; SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; TOP: 5px"
															vAlign="top" align="center">
															<TABLE id="Table8" style="WIDTH: 100%; HEIGHT: 8px" cellSpacing="3" cellPadding="2" border="0">
																<TR>
																	<TD style="WIDTH: 148px" align="right">«“  «—ÌŒ</TD>
																	<TD style="WIDTH: 121px" align="right"><uc1:textdate id="StartDate" style="WIDTH: 144px; HEIGHT: 36px" runat="server"></uc1:textdate></TD>
																	<TD style="WIDTH: 150px" align="left"> «  «—ÌŒ</TD>
																	<TD align="right"><uc1:textdate id="EndDate" style="WIDTH: 144px; HEIGHT: 36px" runat="server"></uc1:textdate></TD>
																	<TD align="left">‘.„ ﬁ«÷Ì</TD>
																	<TD style="WIDTH: 65px" align="right"><INPUT class="txtControls" id="txtMot" onblur="onblurtxtMot()" style="WIDTH: 58px; HEIGHT: 22px"
																			size="4" name="Text1" runat="server"></TD>
																	<TD style="WIDTH: 187px" align="left">‰«„ „ ﬁ«÷Ì</TD>
																	<TD style="WIDTH: 195px" align="right"><cc1:lcombo onkeypress="return KeySort(this,false)" id="cmbMot" onblur="onChangecmbMot()" runat="server"
																			onchange="onChangecmbMot()" CssClass="txtControls"  ConnectionName="GenCnn" DataTextField="Title" DataValueField="Val" LookupName="PersonName" Width="124px"></cc1:lcombo></TD>
																</TR>
																<TR>
																	<TD style="WIDTH: 148px" align="right">‘. Ã«‰‘Ì‰</TD>
																	<TD style="WIDTH: 121px" align="right"><INPUT class="txtControls" id="txtJan" onblur="onblurtxttxtJan()" style="WIDTH: 58px; HEIGHT: 22px"
																			size="4" name="Text2" runat="server"></TD>
																	<TD style="WIDTH: 150px" align="left">‰«„ Ã«‰‘Ì‰</TD>
																	<TD align="right"><cc1:lcombo onkeypress="return KeySort(this,false)" id="cmbJan" onblur="onChangecmbJan()" runat="server"
																			onchange="onChangecmbJan()" CssClass="txtControls" ConnectionName="GenCnn" DataTextField="Title" DataValueField="Val" LookupName="PersonName" Width="124px"></cc1:lcombo></TD>
																	<TD align="right"><asp:checkbox id="chJAy" runat="server" Text="Ã«Ìê“Ì‰Ì"></asp:checkbox></TD>
																	<TD align="right"><asp:checkbox id="chMot" runat="server" Text="Ã«»Ã«ÌÌ"></asp:checkbox></TD>
																	<TD align="left" colSpan="2"><INPUT class="CssBtnLimitSerach" id="BtnShow" 
                                                                            title="‰„«Ì‘ „ÕœÊœ" style="WIDTH: 100px; HEIGHT: 32px; cursor: pointer;"
																			onclick="onclickbtnShowlimit()" type="button" name="BtnShow"><INPUT 
                                                                            class="CssBtnShow" id="BtnShowAll" title="‰„«Ì‘ ò·" style="WIDTH: 70px; HEIGHT: 32px; cursor: pointer;"
																			type="button" name="BtnShowAll" runat="server"></TD>
																</TR>
															</TABLE>
															<cc1:automationgrid id="grdGroup" runat="server" Width="813px" Height="328px" HtcAddress=" " ClientSorting="False"
																CreateClientSideScripts="False" UsingKeyBoard="False" SelectRowOnMouseMove="False" ShowHeader="False"
																EnableClientPager="False" Scrolling="True" ClientPageSize="0" SelectRowOnClick="False" SendXML="DoNotSend"
																AutoGenerateColumns="False">
																<ITEMSTYLE CssClass="CssItemStyle"></ITEMSTYLE>
																<HEADERSTYLE CssClass="CssHeaderStyle" VerticalAlign="Middle" HorizontalAlign="Center"></HEADERSTYLE>
																<ALTERNATINGITEMSTYLE CssClass="CssAlternatingItemStyle"></ALTERNATINGITEMSTYLE>
																<FOOTERSTYLE CssClass="CssEditItemStyle "></FOOTERSTYLE>
																<SELECTEDITEMSTYLE CssClass="CssSelectedItemStyle"></SELECTEDITEMSTYLE>
																<COLUMNS>
																	<ASP:TEMPLATECOLUMN HeaderText="‰Ê⁄  €ÌÌ—">
																		<HEADERSTYLE Width="60px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="60px" HorizontalAlign="Center"></ITEMSTYLE>
																		<ITEMTEMPLATE>
																			<asp:Label id=Label1 runat="server" Text='<%#SEtTitle( DataBinder.Eval(Container, "DataItem.Type")) %>'>
																			</asp:Label>
																		</ITEMTEMPLATE>
																	</ASP:TEMPLATECOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="‘.Å.„ ﬁ«÷Ì" DataField="FPersonelID">
																		<HEADERSTYLE Width="80px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="80px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:TEMPLATECOLUMN HeaderText="„ ﬁ«÷Ì">
																		<HEADERSTYLE Width="160px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="160px" HorizontalAlign="Right"></ITEMSTYLE>
																		<ITEMTEMPLATE>
																			<asp:Label id=Label2 title='<%# DataBinder.Eval(Container, "DataItem.FullFPerson") %>' runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.FPerson") %>'>
																			</asp:Label>
																		</ITEMTEMPLATE>
																	</ASP:TEMPLATECOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="‘.Å.Ã«‰‘Ì‰" DataField="SPersonelID">
																		<HEADERSTYLE Width="80px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="80px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:TEMPLATECOLUMN HeaderText="Ã«‰‘Ì‰">
																		<HEADERSTYLE Width="160px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="160px" HorizontalAlign="Right"></ITEMSTYLE>
																		<ITEMTEMPLATE>
																			<asp:Label id=Label3 title='<%# DataBinder.Eval(Container, "DataItem.FullSPerson") %>' runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SPerson") %>'>
																			</asp:Label>
																		</ITEMTEMPLATE>
																	</ASP:TEMPLATECOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText=" «—ÌŒ" DataField="SDate">
																		<HEADERSTYLE Width="70px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="70px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="ReplacementID" DataField="ReplacementID" Visible="False">
																		<HEADERSTYLE Width="1px" HorizontalAlign="Center"></HEADERSTYLE>
																		<ITEMSTYLE Width="1px" HorizontalAlign="Center"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:TEMPLATECOLUMN HeaderText=" Ê÷ÌÕ« ">
																		<HEADERSTYLE Width="200px"></HEADERSTYLE>
																		<ITEMSTYLE Width="200px"></ITEMSTYLE>
																		<ITEMTEMPLATE>
																			<asp:Label id=Label4 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Descr") %>'>
																			</asp:Label>
																		</ITEMTEMPLATE>
																	</ASP:TEMPLATECOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="Type" DataField="Type" Visible="False">
																		<HEADERSTYLE Width="1px"></HEADERSTYLE>
																		<ITEMSTYLE Width="1px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																	<ASP:BOUNDCOLUMN HeaderText="RSDate" DataField="RSDate" Visible="False">
																		<HEADERSTYLE Width="1px"></HEADERSTYLE>
																		<ITEMSTYLE Width="1px"></ITEMSTYLE>
																	</ASP:BOUNDCOLUMN>
																</COLUMNS>
															</cc1:automationgrid></td>
													</tr>
												</TABLE>
												<HR class="CssHorizontalLine" style="WIDTH: 331px; HEIGHT: 2px" SIZE="2">
												<INPUT class="CSSbtnNew" id="btnNew" onclick="onclickbtnNew()" type="button" name="btnNew"
													title="«ÌÃ«œ" style="CURSOR: pointer"><INPUT class="CssbtnEdit" 
                                                    id="btnEdit" onclick="onclickbtnEdit()" type="button" name="btnEdit"
													title="«’·«Õ" style="CURSOR: pointer"><INPUT class="CssbtnDelete" id="btnDelete" onclick="onclickbtnDelete()" type="button" name="btnDelete"
													title="Õ–›" style="CURSOR:pointer"><INPUT class="CssBtnCancel" id="btnTOPCancel" style="DISPLAY: none; CURSOR: hand" onclick="OnClickbtnTOPCancel()"
													type="button" name="btnTOPCancel" title="«‰’—«›">
											</TD>
										</TR>
										<tr>
											<td id="DownRow" style="DISPLAY: none; HEIGHT: 100px" vAlign="top" align="center">
												<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="100%" border="0">
													<TR>
														<TD align="left" style="WIDTH: 86px">‘„«—Â „ ﬁ«÷Ì</TD>
														<TD align="right" style="WIDTH: 139px"><INPUT class="txtControls" id="txtMotaghaziId" onblur="onblurtxtMotaghaziId()" style="WIDTH: 114px; HEIGHT: 22px"
																size="13" name="txtMotaghaziId" runat="server"></TD>
														<TD align="left" style="WIDTH: 102px">‰«„ Ê ‰«„ Œ«‰Ê«œêÌ</TD>
														<TD><cc1:lcombo onkeypress="return KeySort(this,false)" id="cmbMotaghaziName" onblur="onChangecmbMotaghaziName()"
																runat="server" onchange="onChangecmbMotaghaziName()" CssClass="txtControls" ConnectionName="GenCnn" DataTextField="Title" DataValueField="Val" LookupName="PersonName"
																Width="158px"></cc1:lcombo></TD>
													</TR>
												</TABLE>
												<TABLE id="Table3" cellSpacing="1" cellPadding="1" width="100%" border="0">
													<TR>
														<TD align="left" style="WIDTH: 86px">‘„«—Â Ã«‰‘Ì‰</TD>
														<TD style="WIDTH: 139px"><INPUT class="txtControls" id="txtJaneshinId" onblur="onblurtxttxtJaneshinId()" style="WIDTH: 114px; HEIGHT: 22px"
																size="13" name="txtJaneshinId" runat="server"></TD>
														<TD align="left" style="WIDTH: 102px">‰«„ Ê ‰«„ Œ«‰Ê«œêÌ</TD>
														<TD><cc1:lcombo onkeypress="return KeySort(this,false)" id="cmbJaneshinName" onblur="onChangecmbJaneshinName()"
																runat="server" onchange="onChangecmbJaneshinName()" CssClass="txtControls" ConnectionName="GenCnn" DataTextField="Title" DataValueField="Val" LookupName="PersonName"
																Width="158px"></cc1:lcombo></TD>
													</TR>
												</TABLE>
												<TABLE id="Table5" cellSpacing="1" cellPadding="1" width="529" border="0">
													<TR>
														<TD align="left"> «—ÌŒ</TD>
														<TD><uc1:textdate id="tDate" style="WIDTH: 144px; HEIGHT: 36px" runat="server"></uc1:textdate></TD>
														<TD>‰Ê⁄  €ÌÌ—</TD>
														<TD><INPUT id="rdojbj" type="radio" CHECKED runat="server" name="rdo">Ã«»Ã«ÌÌ</TD>
														<TD><INPUT id="rdoJgz" type="radio" runat="server" name="rdo">Ã«Ìê“Ì‰Ì</TD>
													</TR>
												</TABLE>
												<TABLE id="Table4" style="WIDTH: 533px; HEIGHT: 28px" cellSpacing="1" cellPadding="1" width="533"
													border="0">
													<TR>
														<TD style="WIDTH: 97px" align="left"> Ê÷ÌÕ« </TD>
														<TD><INPUT id="txtdesc" style="WIDTH: 425px; HEIGHT: 28px" size="65" name="txtdesc" runat="server"></TD>
													</TR>
												</TABLE>
												<HR class="CssHorizontalLine" style="WIDTH: 269px; HEIGHT: 2px" SIZE="2">
												<INPUT class="CSSbtnNew" id="btnNew1" onclick="onclickbtnNew()" type="button" title="«ÌÃ«œ"
													style="CURSOR:pointer"> <INPUT class="CssbtnSave" id="btnSave" onclick="onclickbtnSave()" type="button" name="btnSave"
													title="–ŒÌ—Â" style="CURSOR:pointer"><INPUT class="CssBtnSaveAndNew" id="BtnSaveAndContinue" style="WIDTH: 107px; HEIGHT: 32px; CURSOR:pointer"
													onclick="onClickBtnSaveAndContinue()" title="–ŒÌ—Â Ê «œ«„Â" type="button" name="Button2"><INPUT class="CssbtnCancel" id="btnCancel" onclick="onclickBtnCancel()" type="button" name="btnCancel"
													title="«‰’—«›" style="CURSOR:pointer">
											</td>
										</tr>
									</TABLE>
								</td>
							</tr>
							<tr>
								<td style="DISPLAY: none">
								    <input id="txtPersonID" name="txtPersonID" runat="server">
									<cc1:MySecurity id="OnLineUser" runat="server"></cc1:MySecurity><input id="Active" name="Active" runat="server">
									<input id="txtDate" name="txtDate" runat="server"><input id="txtSubmit" name="txtSubmit" runat="server">
									<input id="txtAlert" name="txtAlert" runat="server"><input id="txtSDate" name="txtSDate" runat="server">
									<input id="txtFlag" name="txtFlag" runat="server"><input id="txtChk" name="txtChk" runat="server">
									<input id="txtStartDate" name="txtStartDate" runat="server"> <input id="txtEndDate" name="txtEndDate" runat="server">
									<input id="ReplacementID" name="ReplacementID" runat="server"> <input id="txtToday" runat="server">
									<input id="txtModalflag" name="txtModalflag" runat="server"> <input id="txtNew" runat="server"><input id="txtType" name="txtType" runat="server">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
