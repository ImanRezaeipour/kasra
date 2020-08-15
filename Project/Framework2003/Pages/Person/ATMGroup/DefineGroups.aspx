<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DefineGroups.aspx.vb" Inherits="FrameWork.DefineGroups" validateRequest="false" %>
<%@ Register TagPrefix="cc1" Namespace="WEBLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>DefineGroups</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../Includes/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/TreeStyles.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Pages/Person/XSelectionStyle.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Pages/Person/Paging.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Pages/Person/XTab.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<script src="../../../Pages/Person/General.js"></script>
		<script language="javascript">
		var root='/UserEntity/Person'
		var PageSize  = 8
		var currentPage_X = 0
		var newrowindex=0
		//////////////////////////////////////////////////////////////////////////////////
		function ConfigActionsForMenuItemId()
		{
			xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(Form1.XMLActionsForMenuItemId.value);
			var xmlNodes;
			xmlNodes=xmlDoc.documentElement.selectNodes("/NewDataSet/ActionsForMenuItemId [Name='Public']");
			if(xmlNodes.length>0)
			{
				Form1.OptPublic.disabled=false
				Form1.OptPrivet.disabled=false
				Form1.chkPublic.disabled=false
				Form1.chkPrivate.disabled=false
				return
			}
			else
			{
				Form1.OptPublic.disabled=true
				Form1.OptPrivet.disabled=true
				Form1.chkPublic.disabled=true
				Form1.chkPrivate.disabled=true
			}
			
			xmlNodes=xmlDoc.documentElement.selectNodes("/NewDataSet/ActionsForMenuItemId [Name='Private']");
			if(xmlNodes.length>0)
			{
				Form1.OptPrivet.disabled=false
				Form1.chkPrivate.disabled=false
			}
			else
			{
				Form1.OptPrivet.disabled=true
				Form1.chkPrivate.disabled=true
			}
		}
		////_____________________________page___________________________________________
		function onLoad()
		{
			document.all("Body").scroll="no"
			ConfigActionsForMenuItemId()
			if(Form1.txtSubmit.value=='')
				XTabShowAll()
			
			switch (Form1.Active.value)
			{
				case "":
					ViewGrid()
					break;
				case "Grid":
					ViewGrid()
					break;
				case "Edit":
					ViewEdit()
					break
			}
			if(Form1.TxtAlert.value !="")
			{
				alert(Form1.TxtAlert.value)
				Form1.TxtAlert.value=''
				Form1.txtSubmit.value=''
				onclickbtnNew()
			}
			Form1.CurPage_X.value=0
		}
		//////////////////////////////////////////////////////////////////////////////////
		function ViewGrid() 
		{
			document.all.item("RowGrid").style.display="inline"  	
			document.all.item("RowEdit").style.display="none"
			Form1.Active.value="Grid"
		}
		//////////////////////////////////////////////////////////////////////////////////
		function ViewEdit() 
		{
			if(Form1.GroupId.value!='')
				LoadSelectedPerson('First')
			document.all.item("RowGrid").style.display="none"  	
			document.all.item("RowEdit").style.display="inline" 
			Form1.Active.value="Edit"
			
		}
		////______________________________mode click Grids_______________________________
		function onclickgrdGroup(SelectedRow)
		{
			var obj
			obj=grdGroup
			if(Form1.LastSelectedRowgrdGroup.value!='')
				obj.rows(parseInt(Form1.LastSelectedRowgrdGroup.value)).style.backgroundColor=''
			Form1.LastSelectedRowgrdGroup.value=SelectedRow.rowIndex
			SelectedRow.style.backgroundColor='#FFD599'
			Form1.GroupId.value=SelectedRow.GroupId
			
			Form1.GroupName.value=SelectedRow.cells(2).innerText
			Form1.Descr.value=SelectedRow.cells(3).innerText
			
			if(SelectedRow.Type=='U')
			{
				Form1.OptOwn.checked=true
				Form1.OptDepartment.checked=false
			}
			else
			{
				Form1.OptOwn.checked=false
				Form1.OptDepartment.checked=true
			}
			
			if(SelectedRow.PrivateOrPublic==1)
			{
				Form1.OptPrivet.checked=true
				Form1.OptPublic.checked=false
			}
			else
			{
				Form1.OptPrivet.checked=false
				Form1.OptPublic.checked=true
			}
			
		}
		//////////////////////////////////////////////////////////////////////////////////
		function ondblclickgrdGroup()
		{
			Form1.CurPage_X.value=0
			
			LoadSelectedPerson('Next')
			document.all.item("RowGrid").style.display="none"  	
			document.all.item("RowEdit").style.display="inline" 
			Form1.Active.value="Edit"
		}
		//////////////////////////////////////////////////////////////////////////////////
		function onclickbtnCancel()
		{
			Form1.SelectedMamber.value=''
			Form1.tSelectedMamber.value=''
			Form1.CurPage_X.value=''
			Form1.ToatalPage_X.value=''
			ViewGrid()
		}
		//////////////////////////////////////////////////////////////////////////////////
		 function onclickBtnSelectPerson()
		{
			var url
			var url="/TA/TAPeresentation/Pages/Person/PersonTab.aspx?TypeAccess="+1+"&MenuItemID="+5+'&SessionID='+Form1.txtSessionID.value 
			//url="../PersonTab.aspx"+'?SessionID='+Form1.txtSessionID.value 
			Form1.SelectedMamber.value=window.showModalDialog(url,"","dialogHeight:800px;dialogWidth: 800px;center: Yes;help: no;status: no")
			if (Form1.SelectedMamber.value!='')
			{
				if(grdPerson.rows.length>1)
					if(confirm('Å—”‰· «‰ Œ«» ‘œÂ Ã«Ìê“Ì‰ Å—”‰· ﬁ»·Ì ê—œ‰œø'))
					{
						Cleargrd(grdPerson)
						Form1.tSelectedMamber.value=''
					}
				Form1.SelectedMamber.value=GetDataPerson()
				OnClickChkAllSelected()
			}
		}
		//////////////////////////////////////////////////////////////////////////////////
		function GetDataPerson()
		{
			xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(Form1.SelectedMamber.value);
			xmlDoc.setProperty("SelectionLanguage", "XPath");
			var xmlNodes;
			xmlNodes=xmlDoc.documentElement.selectNodes("/UserEntity/Person[Selected=1]");
			
			var strSelectedMamber=Form1.tSelectedMamber.value
			
			xmlTestUniq = new ActiveXObject("MsXml2.DomDocument");
			var t='<UserEntity>'+strSelectedMamber+'</UserEntity>'
			xmlTestUniq.loadXML(t);
			xmlTestUniq.setProperty("SelectionLanguage", "XPath");

			var xmlNodesTestUniq
			for(x=0;x<xmlNodes.length;x++)
			{
				xmlNodesTestUniq=xmlTestUniq.documentElement.selectNodes("/UserEntity/Person[PersonID="+xmlNodes.item(x).selectSingleNode('PersonID').text+"]");
				if(xmlNodesTestUniq.length==0)
				{
					strSelectedMamber+='<Person>'
						strSelectedMamber+='<PersonID>'+xmlNodes.item(x).selectSingleNode('PersonID').text+'</PersonID>'
						strSelectedMamber+='<Family>'+xmlNodes.item(x).selectSingleNode('Family').text+'</Family>'
						strSelectedMamber+='<Selected>1</Selected>'
					strSelectedMamber+='</Person>'
				}
			}
			
			strSelectedMamber='<UserEntity>'+strSelectedMamber+'</UserEntity>'
			return(strSelectedMamber)
		}
		//////////////////////////////////////////////////////////////////////////////////
		function LoadSelectedPerson(direction)
		{
			Cleargrd(grdPerson)
			//Deine xml variable
			var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false" ;
			var xmlNodes;
			var x;
			var totalRecords 
			var Param
			var endFor 
			if(Form1.GroupId.value=='')
				Form1.GroupId.value='0'
			
			
			//mode  edit
			if(Form1.SelectedMamber.value=='' & Form1.GroupId.value!='0' )
			{
				xmlDoc.loadXML(Form1.XMLGroupMember.value);
				xmlNodes=xmlDoc.documentElement.selectNodes("/ATMGroupEntity/GetGroups[GroupID="+Form1.GroupId.value+"]");
				var strSelectedMamber=''
				for(x=0;x<xmlNodes.length;x++)
				{
					strSelectedMamber+='<Person>'
						strSelectedMamber+='<PersonID>'+xmlNodes.item(x).selectSingleNode('MemberId').text+'</PersonID>'
						strSelectedMamber+='<Family>'+xmlNodes.item(x).selectSingleNode('Title').text+'</Family>'
						strSelectedMamber+='<Selected>1</Selected>'
					strSelectedMamber+='</Person>'
				}
				
				Form1.tSelectedMamber.value=strSelectedMamber
				Form1.SelectedMamber.value='<UserEntity>'+strSelectedMamber+'</UserEntity>'
				totalRecords = xmlNodes.length
				Form1.ToatalPage_X.value =Math.ceil(totalRecords / PageSize)
				if (totalRecords > 0)
				{
					currentPage_X =parseInt(Form1.CurPage_X.value)
					switch (direction)
					{
						case "Const":
							currentPage_X = currentPage_X
							break
						case "Next":
							currentPage_X = parseInt(currentPage_X)+1
							break
						case "Previous":
							currentPage_X =parseInt(currentPage_X)-1
							break
						case "First":
							currentPage_X = 1
							break
						case "Last":
							currentPage_X = parseInt(Form1.ToatalPage_X.value)
							break
					}
					
					Form1.CurPage_X.value = currentPage_X
					if(currentPage_X*PageSize-1 < 0)
						return
					if(totalRecords <= currentPage_X*PageSize-1)
						endFor =totalRecords-1
					else
						endFor = parseInt(Form1.CurPage_X.value)*PageSize-1
		            
              		x=(currentPage_X-1)*PageSize
					
					for(;x<=endFor;++x)
					{
						Param='"'+xmlNodes.item(x).selectSingleNode('MemberId').text+'","'+xmlNodes.item(x).selectSingleNode('Title').text+'",'
						AddRow(grdPerson,"MemberId",xmlNodes.item(x).selectSingleNode('MemberId').text,1,Param)
					}
				}
				return
			}
			
			//mode new
			if(Form1.SelectedMamber.value!='')
			{
				var t=new String
				var l
				t='<UserEntity>'
				l=t.length
				t=Form1.SelectedMamber.value
				Form1.tSelectedMamber.value=t.substring(l,t.length-l-1)
				xmlDoc.loadXML(Form1.SelectedMamber.value);
				xmlNodes=xmlDoc.documentElement.selectNodes(root+"[Selected=1]");
				totalRecords = xmlNodes.length
				
				Form1.ToatalPage_X.value =Math.ceil(totalRecords / PageSize)
				if (totalRecords > 0)
				{
					currentPage_X =parseInt(Form1.CurPage_X.value)
					switch (direction)
					{
						case "Const":
							currentPage_X = currentPage_X
							break
						case "Next":
							currentPage_X = parseInt(currentPage_X)+1
							break
						case "Previous":
							currentPage_X =parseInt(currentPage_X)-1
							break
						case "First":
							currentPage_X = 1
							break
						case "Last":
							currentPage_X = parseInt(Form1.ToatalPage_X.value)
							break
					}
					Form1.CurPage_X.value = currentPage_X
					if(currentPage_X*PageSize-1 < 0)
						return
					if(totalRecords <= currentPage_X*PageSize-1)
						endFor =totalRecords-1
					else
						endFor = parseInt(Form1.CurPage_X.value)*PageSize-1
		            
              		x=(currentPage_X-1)*PageSize
					for(;x<=endFor;++x)
					{
						Param='"'+xmlNodes.item(x).selectSingleNode('PersonID').text+'","'+xmlNodes.item(x).selectSingleNode('Family').text+'",'
						AddRow(grdPerson,"MemberId",xmlNodes.item(x).selectSingleNode('PersonID').text,xmlNodes.item(x).selectSingleNode('Selected').text,Param)
					}
				}
			}
		}
		//////////////////////////////////////////////////////////////////////////////////
		function Cleargrd(obj)
		{
			j=obj.rows.length-1
			for(;j>=0;--j)
				obj.deleteRow(j)
		}
		//////////////////////////////////////////////////////////////////////////////////
		function AddRow(oGrid,AttrName,AttrValue,Selected,Param)
		{
			newrowindex=oGrid.rows.length
			//Ìò ”ÿ— «÷«›Â „Ìò‰œ
			oGrid.insertRow()
			oGrid.rows(newrowindex).className = "XItemStyle";
			//‘‰«”Â ”ÿ— —« ”  „Ìò‰œ
			oGrid.rows(newrowindex).setAttribute(AttrName ,AttrValue)
			//” Ê‰ «‰ Œ«» —« «ÌÃ«œ „Ìò‰œ
			oGrid.rows(newrowindex).insertCell()
			if (Selected==1)
				oGrid.rows(newrowindex).cells(0).innerHTML="<input type='checkbox' checked onclick='chkOnClick(this)'/>"
			else
				oGrid.rows(newrowindex).cells(0).innerHTML="<input type='checkbox' onclick='chkOnClick(this)'/>"

			//»Â  ⁄œ«œ ¬Ì „Â«Ì „ €Ì— Å«—«„ ” Ê‰ »« „ﬁ«œÌ—‘«‰ «ÌÃ«œ „Ìò‰œ								
			var cell
			cell=1
			var p=new String
			var x=0
			while (x<getCntChar(',',Param))
			{
					p=getArray(Param,x,',')
					oGrid.rows(newrowindex).insertCell()
					oGrid.rows(newrowindex).cells(cell).innerText=p.substring(1,p.length-1)
					cell=cell+1	
					x=x+1
			}
			//align
			oGrid.rows(newrowindex).align="center"
			//width
			oGrid.rows(newrowindex).cells(0).style.width="40px"
			oGrid.rows(newrowindex).cells(1).style.width="150px"
			oGrid.rows(newrowindex).cells(2).style.width="250px"
		}	
		//////////////////////////////////////////////////////////////////////////////////
		 function CurPage_XTextChanged()
		 {
			if (Form1.CurPage_X.value <= Form1.ToatalPage_X.value && Form1.CurPage_X.value > 0)
				LoadSelectedPerson('Const')
		 }
		//////////////////////////////////////////////////////////////////////////////////
		function NextBtn_XClick()
		{
			if(parseInt(Form1.CurPage_X.value) < parseInt(Form1.ToatalPage_X.value))
				LoadSelectedPerson('Next')
		}
		//////////////////////////////////////////////////////////////////////////////////
	    function PrevBtn_XClick()
	    {
			if(parseInt(Form1.CurPage_X.value) > 1)
				LoadSelectedPerson('Previous')
	    }
		//////////////////////////////////////////////////////////////////////////////////
		function FirstBtn_XClick()
		{
			LoadSelectedPerson('First')
		}
		//////////////////////////////////////////////////////////////////////////////////
	    function LastBtn_XClick()
	    {
			LoadSelectedPerson('Last')
		}
		//////////////////////////////////////////////////////////////////////////////////
		function chkOnClick(chk)
		{
			var PersonID
			PersonID=chk.parentElement.parentElement.MemberId
			if(Form1.SelectedMamber.value=='')
				Form1.SelectedMamber.value='<UserEntity>'+Form1.tSelectedMamber.value+'</UserEntity>'
			if(Form1.SelectedMamber.value!='')
			{
				xmlDoc = new ActiveXObject("MsXml2.DomDocument");
				xmlDoc.loadXML(Form1.SelectedMamber.value);
				xmlDoc.setProperty("SelectionLanguage", "XPath");
		
				var xmlNodes;
				xmlNodes=xmlDoc.documentElement.selectNodes(root+"[PersonID="+PersonID+"]");
				if (chk.checked)
					xmlNodes.item(0).selectSingleNode('Selected').text=1
				else
					xmlNodes.item(0).selectSingleNode('Selected').text=0
				Form1.SelectedMamber.value=xmlDoc.xml
				//if (Form1.ChkSelected.checked)
					LoadSelectedPerson('First')
				
			}
			
		}
		//////////////////////////////////////////////////////////////////////////////////
		//«› œ „Ì « ›«ﬁ Â« ‘œÂ «‰ Œ«» ‰„«Ì‘ »Â „—»Êÿ CheckBox ò·Ìò Â‰ê«„
		function OnClickChkAllSelected()
		{
			var obj;
			obj=grdPerson					
			Form1.CurPage_X.value=0
			LoadSelectedPerson('First')	
			/*if(Form1.SelectedMamber.value=='')
			{
				Form1.ChkSelected.checked=true
				Form1.ChkSelected.disabled=true	
			}
			else
			{
				Form1.ChkSelected.disabled=false	
			}*/
		}	
		//////////////////////////////////////////////////////////////////////////////////
		function onclickbtnNew1()
		{
			ClearData()
			ViewEdit()
		}	
		//////////////////////////////////////////////////////////////////////////////////
		function ClearData()
		{
			Cleargrd(grdPerson)
			Form1.GroupName.value=""
			Form1.GroupId.value=""
			Form1.Descr.value=""
			Form1.OptOwn.checked=true
			Form1.OptPrivet.checked=true
			Form1.SelectedMamber.value=''
			Form1.tSelectedMamber.value=''
		}
		//////////////////////////////////////////////////////////////////////////////////
		function onchangefPersonID()
		{
			if(Form1.fPersonID.value=='')
				Form1.selPerson.value=0
			else
				Form1.selPerson.value=Form1.fPersonID.value
		}
		//////////////////////////////////////////////////////////////////////////////////
		function onchangeselPerson()
		{
			if(Form1.selPerson.value==0)
				Form1.fPersonID.value=''
			else
				Form1.fPersonID.value=Form1.selPerson.value
		}
		//////////////////////////////////////////////////////////////////////////////////
		function XTabShowAll()
		{
			Form1.fPersonID.value=''
			Form1.selPerson.value=0
			if(Form1.chkPrivate.disabled==false)
			{
				Form1.chkPrivate.checked=true
				Form1.txtPrivate.value=1
			}
			else
			{
				Form1.chkPrivate.checked=false
				Form1.txtPrivate.value=0
			}
			
			if(Form1.chkPublic.disabled==false)
			{
				Form1.chkPublic.checked=true
				Form1.txtPublic.value=1
			}
			else
			{
				Form1.chkPublic.checked=false
				Form1.txtPublic.value=0
			}
			Form1.chkUser.checked=true
			Form1.chkRole.checked=true	
			Form1.txtRole.value=1
			Form1.txtUser.value=1
			Form1.LastSelectedRowgrdGroup.value=''
			Form1.txtSubmit.value="Show"
			Form1.submit()		
		}
		//////////////////////////////////////////////////////////////////////////////////
		function XTabSearch()
		{
			if(Form1.chkUser.checked)
				Form1.txtUser.value=1
			else
				Form1.txtUser.value=0
				
			if(Form1.chkRole.checked)
				Form1.txtRole.value=1
			else
				Form1.txtRole.value=0
				
			if(Form1.chkPublic.checked)
				Form1.txtPublic.value=1
			else
				Form1.txtPublic.value=0
			
			if(Form1.chkPrivate.checked)
				Form1.txtPrivate.value=1
			else
				Form1.txtPrivate.value=0
			Form1.LastSelectedRowgrdGroup.value=''				
			Form1.txtSubmit.value="Search"
			Form1.submit()
		}
		//////////////////////////////////////////////////////////////////////////////////
		function onclickbtnEdit1()
		{
			if(Form1.GroupId.value=="")
			{
				alert("Ìò ê—ÊÂ «‰ Œ«» ò‰Ìœ!")
				return
			}
			
			LoadSelectedPerson('First')
			ViewEdit()
		}
		//////////////////////////////////////////////////////////////////////////////////
		function onclickbtnDelete1()
		{
			if(Form1.GroupId.value=='')
			{
				alert("Ìò ê—ÊÂ «‰ Œ«» ò‰Ìœ!")
				return
			}
			Form1.hbtnDelete.click()
		}
		//////////////////////////////////////////////////////////////////////////////////
		function MakePersonGroupXML()
		{
			var strxml=''	
			var j
			var strGroupTitle=''
			
			for(j=0;j<grdPerson.rows.length;++j)
			{
				if (grdPerson.rows(j).cells(0).firstChild.checked==true)
					{
						strxml+="<PersonGroup>"
						strxml+="<PersonID>"+parseInt(grdPerson.rows(j).MemberId)+"</PersonID>"
						strxml+="</PersonGroup>"
					}
			}
			var Type
			Type='R'
			if (Form1.OptOwn.checked==true)
				Type='U'
			
			var Private
			Private='0'
			if (Form1.OptPrivet.checked==true)
				Private='1'
	
			strGroupTitle="<ATMGroupEntity><GroupTitle>"
			strGroupTitle+="<GroupID>"+Form1.GroupId.value+"</GroupID>"
			strGroupTitle+="<GroupName>"+Form1.GroupName.value+"</GroupName>"
			strGroupTitle+="<Descr>"+Form1.Descr.value+"</Descr>"
			strGroupTitle+="<Type>"+Type+"</Type>"
			strGroupTitle+="<PrivateOrPublic>"+Private+"</PrivateOrPublic>"
			strGroupTitle+="<OwnerID>"+Form1.OwnerId.value+"</OwnerID>"
			strGroupTitle+="</GroupTitle>"
			Form1.XMLSave.value=strGroupTitle+strxml+"</ATMGroupEntity>"
			//Form1.XMLSave.value=strGroupTitle
		}
		//////////////////////////////////////////////////////////////////////////////////
		function onclickbtnSave()
		{
			if(Form1.GroupName.value=="")
			{
				alert("Ìò ‰«„ »—«Ì ê—ÊÂ «‰ Œ«» ò‰Ìœ!")
				return
			}
			MakePersonGroupXML()
			Form1.hbtnSave.click()
		}
		//////////////////////////////////////////////////////////////////////////////////
		function onclickbtnNew()
		{
			ClearData()
		}
		//////////////////////////////////////////////////////////////////////////////////
		</script>
	</HEAD>
	<body id="Body" dir="ltr" bottomMargin="0" leftMargin="0" topMargin="0" scroll="yes" onload="onLoad()"
		rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE class="CssLayer2" id="Table1" height="100%" cellSpacing="1" cellPadding="1" width="100%"
				border="0">
				<TR>
					<TD vAlign="middle" align="center">
						<P>&nbsp;</P>
						<TABLE class="CssPage" id="Table2" style="WIDTH: 681px; HEIGHT: 472px" cellSpacing="1"
							cellPadding="1" width="681" border="0">
							<TR>
								<TD id="RowGrid" style="DISPLAY: inline" align="center">
									<TABLE id="Table16" style="WIDTH: 672px; HEIGHT: 488px"  cellSpacing="1" cellPadding="1"
										width="672" align="right" border="0">
										<TR>
											<TD style="DISPLAY: inline; HEIGHT: 28px" vAlign="top" align="center">
												<TABLE id="Table7" dir="rtl" cellSpacing="1" cellPadding="1" width="719" align="right"
													border="0" style="WIDTH: 719px; HEIGHT: 8px">
													<TR>
														<TD>‘„«—Â Å—”‰·Ì :</TD>
														<TD><input type="text" runat="server" onchange="onchangefPersonID()" id="fPersonID" name="fPersonID"
																class="XTabTxt" style="WIDTH: 60px"></TD>
														<TD>‰«„ Œ«‰Ê«œêÌ Ê ‰«„ :</TD>
														<TD><cc1:lcombo id="selPerson" runat="server" LookupName="Personel" onchange="onchangeselPerson()"
																CssClass="XTabTxt" Width="120px" BackColor="White" ConnectionName="GenCnn"></cc1:lcombo></TD>
														<TD style="WIDTH: 260px" vAlign="top"><TABLE id="Table8" style="WIDTH: 265px; HEIGHT: 28px" cellSpacing="1" cellPadding="1" width="265"
																align="right" border="0">
																<TR>
																	<TD><INPUT id="chkUser" type="checkbox" name="chkUser" runat="server">‘Œ’Ì</TD>
																	<TD><INPUT id="chkRole" type="checkbox" name="chkRole" runat="server">”«“„«‰Ì</TD>
																	<TD><INPUT id="chkPrivate" type="checkbox" name="chkPrivate" runat="server">Œ’Ê’Ì</TD>
																	<TD><INPUT id="chkPublic" type="checkbox" name="chkPublic" runat="server">⁄„Ê„Ì</TD>
																</TR>
															</TABLE>
														</TD>
														<TD>&nbsp;<INPUT class="CssBtnLimitSerach" id="XTabRestrictedSearchBtn" style="WIDTH: 35px; HEIGHT: 32px"
																onclick="XTabSearch()" type="button" name="XTabRestrictedSearchBtn">&nbsp;<INPUT class="CssBtnShow" id="XTabShowAllBtn" style="WIDTH: 35px" onclick="XTabShowAll()"
																type="button" name="XTabShowAllBtn"></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD id="RowGridGroup" dir="rtl" style="DISPLAY: inline; HEIGHT: 305px" vAlign="top"
												align="center">
												<cc1:MySecurity id="OnLineUser" runat="server"></cc1:MySecurity><cc1:automationgrid id="grdGroup" runat="server" CssClass="CssbackColor" Width="401px" HtcAddress=" "
													ClientSorting="False" CreateClientSideScripts="False" UsingKeyBoard="False" SelectRowOnMouseMove="False" ShowHeader="False" EnableClientPager="False" Scrolling="True"
													ClientPageSize="0" SelectRowOnClick="False" SendXML="DoNotSend" AutoGenerateColumns="False" Height="345px"><ITEMSTYLE CssClass="CssItemStyle"></ITEMSTYLE>
													<HEADERSTYLE CssClass="CssHeaderStyle" VerticalAlign="Middle" HorizontalAlign="Center"></HEADERSTYLE>
													<ALTERNATINGITEMSTYLE CssClass="CssAlternatingItemStyle"></ALTERNATINGITEMSTYLE>
													<FOOTERSTYLE CssClass="CssEditItemStyle "></FOOTERSTYLE>
													<COLUMNS>
														<ASP:TEMPLATECOLUMN>
															<HEADERSTYLE Width="5px"></HEADERSTYLE>
															<ITEMSTYLE Width="5px"></ITEMSTYLE>
															<ITEMTEMPLATE>
																<IMG 
                  title='<%#SetTitleType(DataBinder.Eval(Container.DataItem,"Type"))%>' 
                  src='<%#SetSrcType(DataBinder.Eval(Container.DataItem,"Type"))%>' 
                  align=middle border=0 name=IMG>
															</ITEMTEMPLATE>
														</ASP:TEMPLATECOLUMN>
														<ASP:TEMPLATECOLUMN>
															<HEADERSTYLE Width="5px"></HEADERSTYLE>
															<ITEMSTYLE Width="5px"></ITEMSTYLE>
															<ITEMTEMPLATE>
																<IMG 
                  title='<%#SetTitlePrivate(DataBinder.Eval(Container.DataItem,"PrivateOrPublic"))%>' 
                  src='<%#SetSrcPrivate(DataBinder.Eval(Container.DataItem,"PrivateOrPublic"))%>' 
                  align=middle border=0 name=IMG>
															</ITEMTEMPLATE>
														</ASP:TEMPLATECOLUMN>
														<ASP:BOUNDCOLUMN HeaderText="‰«„ ê—ÊÂ" DataField="GroupName">
															<HEADERSTYLE Width="200px" HorizontalAlign="Center"></HEADERSTYLE>
															<ITEMSTYLE Width="200px" HorizontalAlign="Center"></ITEMSTYLE>
														</ASP:BOUNDCOLUMN>
														<ASP:BOUNDCOLUMN HeaderText="‘—Õ" DataField="Descr">
															<HEADERSTYLE Width="250px"></HEADERSTYLE>
															<ITEMSTYLE Width="250px"></ITEMSTYLE>
														</ASP:BOUNDCOLUMN>
														<ASP:BOUNDCOLUMN DataField="GroupID" Visible="False">
															<HEADERSTYLE Width="1px"></HEADERSTYLE>
															<ITEMSTYLE Width="1px"></ITEMSTYLE>
														</ASP:BOUNDCOLUMN>
														<ASP:BOUNDCOLUMN DataField="Type" Visible="False">
															<HEADERSTYLE Width="1px"></HEADERSTYLE>
															<ITEMSTYLE Width="1px"></ITEMSTYLE>
														</ASP:BOUNDCOLUMN>
														<ASP:BOUNDCOLUMN DataField="PrivateOrPublic" Visible="False">
															<HEADERSTYLE Width="1px"></HEADERSTYLE>
															<ITEMSTYLE Width="1px"></ITEMSTYLE>
														</ASP:BOUNDCOLUMN>
													</COLUMNS>
													<SELECTEDITEMSTYLE CssClass="CssSelectedItemStyle"></SELECTEDITEMSTYLE>
												</cc1:automationgrid>
												<HR class="CssHorizontalLine" style="WIDTH: 591px; HEIGHT: 2px" SIZE="2">
												<TABLE id="Table17" style="WIDTH: 232px; HEIGHT: 16px" cellSpacing="5" cellPadding="2"
													width="232" border="0">
													<TR>
														<TD><INPUT class="CssBtnNew" id="btnNew1" onclick="onclickbtnNew1()" type="button" name="btnNew1"></TD>
														<TD><INPUT class="CssBtnEdit" id="btnEdit1" onclick="onclickbtnEdit1()" type="button" name="btnEdit1"></TD>
														<TD><INPUT class="CssBtnDelete" id="btnDelete1" onclick="onclickbtnDelete1()" type="button"
																name="btnDelete1">
															<asp:button id="hbtnDelete" style="DISPLAY: none" runat="server" Width="1px" Height="8px"></asp:button></TD>
													</TR>
												</TABLE>
												<INPUT id="TxtAlert" style="DISPLAY: none; WIDTH: 6px; HEIGHT: 8px" type="text" size="1"
													name="TxtAlert" runat="server"></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD id="RowEdit" dir="rtl">
									<TABLE id="Table5" style="WIDTH: 240px; HEIGHT: 502px" cellSpacing="1" cellPadding="1"
										width="240" align="center" border="0">
										<TR>
											<TD style="WIDTH: 74px; HEIGHT: 24px">‰«„:
											</TD>
											<TD style="HEIGHT: 24px"><INPUT class="TxtControls" id="GroupName" style="WIDTH: 366px; HEIGHT: 20px" type="text"
													size="55" runat="server"></TD>
										</TR>
										<TR>
											<TD style="WIDTH: 74px; HEIGHT: 18px" vAlign="top">‘—Õ:</TD>
											<TD style="HEIGHT: 18px"><TEXTAREA class="TxtControls" id="Descr" style="WIDTH: 366px; HEIGHT: 42px" rows="2" cols="43"
													runat="server">															</TEXTAREA></TD>
										</TR>
										<TR>
											<TD style="WIDTH: 102px; HEIGHT: 18px" vAlign="top" colSpan="2">
												<TABLE id="Table3" style="WIDTH: 414px; HEIGHT: 28px" cellSpacing="1" cellPadding="1" width="414"
													align="right" border="0">
													<TR>
														<TD style="WIDTH: 39px">‰Ê⁄ :</TD>
														<TD><INPUT id="OptOwn" type="radio" name="OptType">‘Œ’Ì</TD>
														<TD style="WIDTH: 134px"><INPUT id="OptDepartment" type="radio" name="OptType">”«“„«‰Ì</TD>
														<TD>Ê÷⁄Ì  :</TD>
														<TD><INPUT id="OptPrivet" type="radio" name="OptGroupStatus" CHECKED>Œ’Ê’Ì</TD>
														<TD><INPUT id="OptPublic" type="radio" name="OptGroupStatus">⁄„Ê„Ì</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD vAlign="top" colSpan="2">
												<DIV class="DivStyle" style="WIDTH: 346px; HEIGHT: 300px">
													<DIV class="DivStyle" style="WIDTH: 345px; HEIGHT: 230px">
														<TABLE id="Table4" style="WIDTH: 344px; HEIGHT: 230px" cellSpacing="1" cellPadding="1"
															width="344" align="right" border="0">
															<TR>
																<TD style="HEIGHT: 18px" align="center">
																	<TABLE id="Table12" style="WIDTH: 409px; HEIGHT: 20px" cellSpacing="1" cellPadding="1"
																		align="right" border="0">
																		<TR>
																			<TD><INPUT class="btnSelectPerson" id="btnSelectPerson" style="WIDTH: 125px; HEIGHT: 30px"
																					onclick="onclickBtnSelectPerson()" type="button" name="btnSelectPerson">
																			</TD>
																			<TD><INPUT class="CssLastPage" id="LastBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="LastBtn_XClick()"
																					type="button" name="LastBtn_X"></TD>
																			<TD align="right"><INPUT class="CssNextPage" id="NextBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="NextBtn_XClick()"
																					type="button" name="NextBtn_X"></TD>
																			<TD vAlign="middle" align="right"><INPUT id="CurPage_X" style="WIDTH: 50px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; HEIGHT: 25px; BORDER-BOTTOM-STYLE: groove"
																					type="text" onchange="CurPage_XTextChanged()" name="CurPage_X"></TD>
																			<TD dir="rtl" vAlign="middle" align="right">&nbsp;«“</TD>
																			<TD vAlign="middle"><INPUT id="ToatalPage_X" style="WIDTH: 50px; BORDER-TOP-STYLE: groove; BORDER-RIGHT-STYLE: groove; BORDER-LEFT-STYLE: groove; HEIGHT: 25px; BORDER-BOTTOM-STYLE: groove"
																					type="text" size="6" name="ToatalPage_X"></TD>
																			<TD><INPUT class="CssPrevPage" id="PrevBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="PrevBtn_XClick()"
																					type="button" name="PrevBtn_X"></TD>
																			<TD><INPUT class="CssFirstPage" id="FirstBtn_X" style="WIDTH: 35px; HEIGHT: 35px" onclick="FirstBtn_XClick()"
																					type="button" name="FirstBtn_X"></TD>
																			<TD style="DISPLAY: none"></TD>
																		</TR>
																	</TABLE>
																</TD>
															</TR>
															<TR>
																<TD vAlign="top">
																	<TABLE id="grdPerson_Header">
																		<THEAD style="DISPLAY: inline">
																			<TR class="ShoperHeaderStyle">
																				<TD class="Headerstyle" align="center" width="35">&nbsp;</TD>
																				<TD class="Headerstyle" align="center" width="150">‘„«—Â Å—”‰·Ì</TD>
																				<TD class="Headerstyle" align="center" width="250">⁄‰Ê«‰</TD>
																			</TR>
																		</THEAD>
																	</TABLE>
																	<TABLE id="grdPerson" >
																		<THEAD style="DISPLAY: inline">
																		</THEAD>
																	</TABLE>
																</TD>
															</TR>
														</TABLE>
													</DIV>
												</DIV>
												<HR class="CssHorizontalLine" style="WIDTH: 318px; HEIGHT: 2px" SIZE="2">
												<TABLE id="Table6" style="WIDTH: 3px; HEIGHT: 38px" align="center" border="0">
													<TR>
														<TD width="33%"><INPUT class="CssbtnNew" id="btnNew" onclick="onclickbtnNew()" type="button" name="btnNew"></TD>
														<TD width="33%"><INPUT class="CssbtnSave" id="btnSave" onclick="onclickbtnSave()" type="button" name="btnSave"></TD>
														<TD width="33%"><INPUT class="CssbtnCancel" id="btnCancel" onclick="onclickbtnCancel()" type="button" name="btnCancel"></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD id="RowNone" style="DISPLAY: none">
									<input type="text" id="txtSessionID" runat="server" NAME="txtSessionID"> <INPUT id="SelectedMamber" type="text" name="SelectedMamber" runat="server">
									<INPUT id="tSelectedMamber" type="text" name="tSelectedMamber" runat="server"> <INPUT id="XMLGroupTitle" type="text" name="XMLGroupTitle" runat="server">
									<INPUT id="LastSelectedRowgrdGroup" type="text" name="LastSelectedRowgrdGroup" runat="server">
									<INPUT id="GroupId" type="text" name="GroupId" runat="server"> <INPUT id="XMLGroupMember" type="text" name="XMLGroupMember" runat="server">
									<INPUT id="Active" type="text" name="Active" runat="server"> <input id="OwnerId" type="text" name="OwnerId" runat="server">
									<input id="XMLSave" type="text" name="XMLSave" runat="server"> <input id="XMLActionsForMenuItemId" type="text" name="XMLActionsForMenuItemId" runat="server">
									<input id="txtSubmit" type="text" name="txtSubmit" runat="server"> <input id="txtUser" type="text" name="txtUser" runat="server">
									<input id="txtRole" type="text" name="txtRole" runat="server"> <input id="txtPublic" type="text" name="txtPublic" runat="server">
									<input id="txtPrivate" type="text" name="txtPrivate" runat="server">
									<asp:button id="hbtnSave" runat="server"></asp:button></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
