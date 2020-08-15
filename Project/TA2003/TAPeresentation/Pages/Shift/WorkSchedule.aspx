<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WorkSchedule.aspx.vb" Inherits="TA.WorkSchedule" validateRequest="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>--------------------------»—‰«„Â 
			ò«—Ì----------------------------------</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		var LastSelectedRow=null
		var LastSelectedRowClass=""
		//============================================================================================
		function OnClickGrdWGroup(SelectedRow)
		{	
			//====================
				if(LastSelectedRow!=null)
				{
					LastSelectedRow.className=LastSelectedRowClass;
				}
				LastSelectedRowClass=SelectedRow.className;
				LastSelectedRow=SelectedRow;
				SelectedRow.className="CssSelectedItemStyle";
		}
		function OndblClickGrdWGroup(SelectedRow)
		{
		
		}
		//====================================================================
		function OnClickBtnOK()
		{
			returnValue=document.getElementById("txtXML").value
			window.close()
		}
		//====================================================================
		function chkOnClick(chk)
		{
			var TablID
			TablID=chk.parentElement.parentElement.ScheduleID
			xmlDoc = new ActiveXObject("MsXml2.DomDocument");
			xmlDoc.loadXML(document.getElementById("txtXML").value);
			xmlDoc.setProperty("SelectionLanguage", "XPath");
			var xmlNodes;
			xmlNodes=xmlDoc.documentElement.selectNodes("/ShiftEntity/GetWorkSchedule"+"[ScheduleID="+TablID+"]");
			if (chk.checked)
				xmlNodes.item(0).selectSingleNode('selected').text=1
			else
				xmlNodes.item(0).selectSingleNode('selected').text=0
			document.getElementById("txtXML").value=xmlDoc.xml
		}
		//====================================================================
		function pageLoad()
		{
			returnValue=""
			window.name="WorkSchedule"
			document.getElementById("Form1").target=window.name
		}
		//=======================================================================
		function OnClickBtnCancel()
		{
			returnValue=""
			window.close()
		}
		 

        </script>
	</HEAD>
	<body dir="ltr" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="pageLoad()"
		rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table class="CssLayer2" id="Layer2" height="100%" cellSpacing="0" cellPadding="20" width="100%"
				align="center" border="0">
				<tr>
					<td style="HEIGHT: 509px" vAlign="top" align="center">
						<TABLE class="CssPage" id="Layer3" dir="rtl" style="WIDTH: 289px; HEIGHT: 368px" cellSpacing="0"
							cellPadding="8" align="center" border="0">
							<TBODY>
								<TR>
									<TD style="HEIGHT: 17px" vAlign="top" align="left"></TD>
								</TR>
								<TR>
									<TD id="TopRow" dir="rtl" vAlign="top" align="left" style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de"> 
										<cc1:automationgrid id="grdWGroup" runat="server" HtcAddress=" " ClientSorting="False" CreateClientSideScripts="False"
											UsingKeyBoard="False" SelectRowOnMouseMove="False" ShowHeader="False" EnableClientPager="False"
											Scrolling="True" ClientPageSize="0" SelectRowOnClick="False" SendXML="DoNotSend" AutoGenerateColumns="False"
											Height="224px" Width="206px">
											<ItemStyle CssClass="CssItemStyle"></ItemStyle>
											<HeaderStyle HorizontalAlign="Center" CssClass="CssHeaderStyle" VerticalAlign="Middle"></HeaderStyle>
											<AlternatingItemStyle CssClass="CssAlternatingItemStyle"></AlternatingItemStyle>
											<FooterStyle CssClass="CssEditItemStyle "></FooterStyle>
											<SelectedItemStyle CssClass="CssSelectedItemStyle"></SelectedItemStyle>
											<Columns>
												<asp:BoundColumn Visible="False" DataField="ScheduleID" HeaderText="ScheduleID">
													<HeaderStyle Width="1px"></HeaderStyle>
													<ItemStyle Width="1px"></ItemStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn>
													<HeaderStyle HorizontalAlign="Center" Width="25px"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center" Width="25px"></ItemStyle>
													<ItemTemplate>
														<input type="checkbox" onclick="chkOnClick(this)">
													</ItemTemplate>
													<FooterStyle HorizontalAlign="Center"></FooterStyle>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="‰«„">
													<HeaderStyle HorizontalAlign="Center" Width="100px"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
													<ItemTemplate>
														<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SName") %>' title='<%# DataBinder.Eval(Container, "DataItem.Name") %>' ID="Label1">
														</asp:Label>
													</ItemTemplate>
													<FooterStyle HorizontalAlign="Center"></FooterStyle>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="GroupCount" HeaderText=" ⁄œ«œ ê—ÊÂ">
													<HeaderStyle HorizontalAlign="Center" Width="80px"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center" Width="80px"></ItemStyle>
													<FooterStyle HorizontalAlign="Center"></FooterStyle>
												</asp:BoundColumn>
											</Columns>
										</cc1:automationgrid></TD>
									<P></P>
								</TR>
								<TR>
									<TD style="SCROLLBAR-HIGHLIGHT-COLOR: white; OVERFLOW: auto; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-BASE-COLOR: #b0c4de; TOP: 5px"
										vAlign="top" align="center" dir="rtl">
										<HR class="CssHorizontalLine" style="WIDTH: 67.39%; HEIGHT: 2px" SIZE="2">
										<TABLE id="Table5" cellSpacing="2" cellPadding="3" border="0">
											<TR>
												<TD><INPUT class="CssBtnOK" id="btnOk" onclick="OnClickBtnOK()" type="button" name="btnOk"></TD>
												<TD><INPUT class="CssBtnCancel" id="btnCancel" onclick="OnClickBtnCancel()" type="button" name="btnCancel"></TD>
												<TD style="DISPLAY: none">
												</TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
								<P></P>
							</TBODY>
						</TABLE>
					</td>
				</tr>
				<TR>
                    <td valign="top" style="display: none" align="center">
                        <cc1:mysecurity id="OnLineUser" runat="server">
                        </cc1:mysecurity>
                        <input id="txtXML" type="text" name="txtXML" runat="server" />
                        <input type="text" id="txtCompanyID" name="txtCompanyID" runat="server"   />
                    </td>
				</TR>
			</table>
		</form>
	</body>
</HTML>
