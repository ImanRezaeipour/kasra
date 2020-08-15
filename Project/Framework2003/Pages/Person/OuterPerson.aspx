<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Register TagPrefix="uc2" TagName="TextDate" Src="../../Calendar/TextDate.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="OuterPerson.aspx.vb" Inherits="FrameWork.OuterPerson" validateRequest="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>OuterPerson</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript">
        ///////////////////////////////////////////////////////////////////////
        function LoadForm()
        {
			document.all.item('body').scroll="no"
			if(Form1.txtAlert.value!='')
			{
				alert(Form1.txtAlert.value)
				Form1.txtAlert.value=''
				OnClickBtnNew()
			}			
        }
        ///////////////////////////////////////////////////////////////////////////////////////
		function grdPersonOnClick(SelectedRow)
		{  
			var obj
			obj = grdPerson
			if(Form1.LastSelectedgrdPerson.value != '' & Form1.LastSelectedgrdPerson.value<obj.rows.length)
			{ 
				obj.rows(parseInt(Form1.LastSelectedgrdPerson.value)).style.backgroundColor =''
			}
			Form1.LastSelectedgrdPerson.value = SelectedRow.rowIndex
			SelectedRow.style.backgroundColor = '#FFD599'
			Form1.OuterPersonId.value=SelectedRow.OuterPersonId
			LoadData()
		}
        ///////////////////////////////////////////////////////////////////////////////////////
		function LoadData()
		{	     
			var xmlDoc
			xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(document.all.item("XMLPersonInfo").value);

			var XMLNodes
			XMLNodes = xmlDoc.documentElement.selectNodes("/PersonEntity/OuterPerson [ID="+Form1.OuterPersonId.value+"]");
			 
			Form1.txtFirstName.value = XMLNodes.item(0).selectSingleNode('FirstName').text
			Form1.txtLastName.value = XMLNodes.item(0).selectSingleNode('LastName').text
			Form1.txtTitle.value = XMLNodes.item(0).selectSingleNode('Title').text
			Form1.txtRoleTitle.value = XMLNodes.item(0).selectSingleNode('RoleTitle').text
			Form1.txtIssueID.value = XMLNodes.item(0).selectSingleNode('IssuePlaceCode').text
			
			
			var ID
			ID=XMLNodes.item(0).selectSingleNode('IssueDate').text
			Form1.txtIssueDate_txtDay.value = ID.substr(0,2)
			Form1.txtIssueDate_txtMonth.value = ID.substr(3,2)
			Form1.txtIssueDate_txtYear.value = ID.substr(6,4)
			
			if(XMLNodes.item(0).selectSingleNode('Type').text=='U' )
				Form1.optHaghighi.checked = true
			else
				Form1.optHoghoghi.checked = true
		}
        ///////////////////////////////////////////////////////////////////////
		 function OnClickBtnNew()
		 { 
			Form1.OuterPersonId.value = ''
				
			Form1.txtFirstName.value = ''
			Form1.txtLastName.value = ''
			Form1.txtTitle.value = ''
			Form1.txtRoleTitle.value = ''
			Form1.txtIssueID.value = ''
			
			Form1.txtIssueDate_txtDay.value = ''
			Form1.txtIssueDate_txtMonth.value = ''
			Form1.txtIssueDate_txtYear.value = ''
			Form1.optHaghighi.checked = true
			Form1.optHoghoghi.checked = false
       
			var obj
			obj = grdPerson
			if(Form1.LastSelectedgrdPerson.value != '' & Form1.LastSelectedgrdPerson.value<obj.rows.length )
				obj.rows(parseInt(Form1.LastSelectedgrdPerson.value)).style.backgroundColor =''
			Form1.LastSelectedgrdPerson.value = ''
		 }
		 //////////////////////////////////////////////////////////
		 function onClickBtnSave() 
		 { 
   		   if(Form1.optHoghoghi.checked )
   				Form1.Type.value = "R" 
   			else
   				Form1.Type.value = "U"
   		   Form1.txtSumbit.value ="save"
		   Form1.submit()
		 }
		////////////////////////////////////////////////////////////////////////////////
		function onClickBtnDelete()
		{  
		      if( Form1.OuterPersonId.value=='' )
		          alert("ÂÌç ¬Ì „ »—«Ì Õ–› «‰ Œ«» ‰‘œÂ «” .")
		      else
		      {
				Form1.txtSumbit.value = "delete"
				Form1.submit()
		      }
		}
		///////////////////////////////////////////////////////////////////////////////
		function onclickBtnLimitSerach()
		{
			Form1.txtSumbit.value = "LimitSerach"
			Form1.submit()
		}
		///////////////////////////////////////////////////////////////////////////////
		function onclickBtnShow()
		{
			Form1.fTitle.value=''
			Form1.fLastName.value=''
			Form1.txtSumbit.value = "Show"
			Form1.submit()
		}
		</script>
	</HEAD>
	<body id="body" dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="LoadForm()"
		rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE class="CssLayer1" id="Table1" height="100%" width="100%">
				<TR>
					<TD align="center">
						<P>&nbsp;</P>
						<TABLE class="CssLayer2" id="Table2" height="90%" width="95%">
							<TR>
								<TD vAlign="middle" align="center">
									<TABLE class="CssPage" id="Table3" style="WIDTH: 671px; HEIGHT: 132px" height="132" width="671">
										<TR>
											<TD dir="rtl" style="HEIGHT: 33px" vAlign="top" align="center" height="33">
												<TABLE id="Table11" dir="ltr" style="HEIGHT: 8px" cellSpacing="1" cellPadding="1" width="100%"
													align="right" border="0">
													<TR>
														<TD style="DISPLAY: none"><INPUT id="XMLPersonInfo" style="WIDTH: 491px; HEIGHT: 22px" type="text" size="76" name="XMLPersonInfo"
																runat="server"></TD>
														<TD style="WIDTH: 58px"><INPUT class="CssBtnShow" id="btnShow" dir="rtl" onclick="onclickBtnShow()" type="button"
																name="btnSearch" runat="server">
														</TD>
														<TD style="WIDTH: 82px"><INPUT class="CssBtnLimitSerach" id="btnSearch" dir="rtl" style="WIDTH: 99px; HEIGHT: 32px"
																onclick="onclickBtnLimitSerach()" type="button" name="btnSearch" runat="server"></TD>
														<TD dir="rtl" style="WIDTH: 75px"><INPUT class="TxtControls" id="fLastName" style="WIDTH: 150px" type="text" name="fLastName"
																runat="server">
														</TD>
														<TD>‰«„ Œ«‰Ê«œêÌ
														</TD>
														<TD dir="rtl" style="WIDTH: 34px"><INPUT class="TxtControls" id="fTitle" style="WIDTH: 150px" type="text" name="fTitle" runat="server"></TD>
														<TD>⁄‰Ê«‰ „Ê””Â</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD dir="ltr" style="HEIGHT: 340px" vAlign="top" align="center" height="370"><cc1:automationgrid id="grdPerson" dir="rtl" runat="server" HtcAddress=" " ClientSorting="True" CreateClientSideScripts="False"
													UsingKeyBoard="False" SelectRowOnMouseMove="False" ShowHeader="False" EnableClientPager="False" Scrolling="True" ClientPageSize="0" SendXML="DoNotSend" AutoGenerateColumns="False"
													SelectRowOnClick="False" Height="336px" CssClass="CssBackColor" Width="510px">
													<ItemStyle CssClass="CssItemStyle"></ItemStyle>
													<HeaderStyle CssClass="CssHeaderStyle"></HeaderStyle>
													<AlternatingItemStyle CssClass="CssAlternatingItemStyle"></AlternatingItemStyle>
													<FooterStyle CssClass="CssFooterStyle"></FooterStyle>
													<Columns>
														<asp:TemplateColumn>
															<HeaderStyle Width="5px"></HeaderStyle>
															<ItemStyle Width="5px"></ItemStyle>
															<ItemTemplate>
																<IMG align="middle" border="0" name="IMG"  src='<%#SetSrc(DataBinder.Eval(Container.DataItem,"Type"))%>' title='<%#SetTitle(DataBinder.Eval(Container.DataItem,"Type"))%>'>
															</ItemTemplate>
														</asp:TemplateColumn>
														<asp:BoundColumn DataField="Title" HeaderText="⁄‰Ê«‰ „Ê””Â">
															<HeaderStyle Width="300px"></HeaderStyle>
															<ItemStyle Width="300px"></ItemStyle>
														</asp:BoundColumn>
														<asp:BoundColumn DataField="FirstName" HeaderText="‰«„">
															<HeaderStyle HorizontalAlign="Center" Width="60px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center" Width="60px"></ItemStyle>
														</asp:BoundColumn>
														<asp:BoundColumn DataField="LastName" HeaderText="‰«„ Œ«‰Ê«œêÌ ">
															<HeaderStyle HorizontalAlign="Center" Width="150px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center" Width="150px"></ItemStyle>
														</asp:BoundColumn>
														<asp:BoundColumn DataField="RoleTitle" HeaderText="Å”  ”«“„«‰Ì">
															<HeaderStyle Width="150px"></HeaderStyle>
															<ItemStyle Width="150px"></ItemStyle>
														</asp:BoundColumn>
														<asp:BoundColumn visible="false" DataField="ID">
															<HeaderStyle Width="1px"></HeaderStyle>
															<ItemStyle Width="1px"></ItemStyle>
														</asp:BoundColumn>
													</Columns>
													<EditItemStyle CssClass="CssEditItemStyle "></EditItemStyle>
													<SelectedItemStyle CssClass="CssSelectedItemStyle"></SelectedItemStyle>
												</cc1:automationgrid></TD>
										</TR>
										<TR>
											<td style="HEIGHT: 50px" vAlign="top">
												<TABLE id="tblitems" style="HEIGHT: 63px" height="63" cellSpacing="1" cellPadding="0" width="100%"
													align="right" border="0">
													<TR>
														<TD>‰«„ :</TD>
														<TD><asp:textbox id="txtFirstName" runat="server" Height="22px" CssClass="TxtControls" Width="221px"></asp:textbox></TD>
														<TD>‰«„ Œ«‰Ê«œêÌ :</TD>
														<TD><asp:textbox id="txtLastName" runat="server" Height="22px" CssClass="TxtControls" Width="221px"></asp:textbox></TD>
													</TR>
													<TR>
														<TD>Å”  ”«“„«‰Ì :</TD>
														<TD><asp:textbox id="txtRoleTitle" runat="server" Height="22px" CssClass="TxtControls" Width="221px"></asp:textbox></TD>
														<TD>⁄‰Ê«‰ „Ê””Â :</TD>
														<TD><asp:textbox id="txtTitle" runat="server" Height="22px" CssClass="TxtControls" Width="221px"></asp:textbox></TD>
													</TR>
													<TR>
														<TD>‘„«—Â  «”Ì” :</TD>
														<TD><asp:textbox id="txtIssueID" runat="server" Height="22px" CssClass="TxtControls" Width="221px"></asp:textbox></TD>
														<TD> «—ÌŒ  «”Ì” :</TD>
														<TD><uc2:textdate id="txtIssueDate" runat="server" name="txtIssueDate"></uc2:textdate></TD>
													</TR>
													<tr>
														<td colSpan="2">ÕﬁÌﬁÌ <input id="optHaghighi" type="radio" name="GroupType" runat="server">
														<td colSpan="2">ÕﬁÊﬁÌ <input id="optHoghoghi" type="radio" name="GroupType" runat="server"></td>
													</tr>
												</TABLE>
											</td>
										</TR>
										<TR>
											<TD>
												<TABLE id="TblButtonDownRow" dir="ltr" style="WIDTH: 133px; HEIGHT: 46px" height="46" cellSpacing="5"
													cellPadding="2" width="133" align="center" border="0">
													<TR>
														<TD style="WIDTH: 312px"><INPUT class="CssBtnDelete" id="btnDelet" onclick="onClickBtnDelete()" type="button" name="btnDelete"></TD>
														<TD><INPUT class="CssBtnSave" id="btnSave" onclick="onClickBtnSave()" type="button" name="btnSave">
														</TD>
														<TD><INPUT class="CssBtnNew" id="btnNew" onclick="OnClickBtnNew()" type="button" name="btnNew"></TD>
														<TD style="DISPLAY: none"><INPUT id="txtSumbit" type="text" name="txtSumbit" runat="server">
															<INPUT id="xmlText" type="text" name="xmlText" runat="server"> <INPUT id="LastSelectedgrdPerson" type="text" size="17" name="LastSelectedgrdPerson">
															<INPUT id="txtAlert" type="text" name="txtAlert" runat="server"> <INPUT id="CurDate" type="text" name="CurDate" runat="server">
															<INPUT id="OuterPersonId" type="text" name="OuterPersonId" runat="server"> <INPUT id="Type" type="text" name="Type" runat="server">
														</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
			</TD></TR></TABLE></TD></TR></TABLE></form>
	</body>
</HTML>
