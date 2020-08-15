<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ViewConfermenter.aspx.vb" Inherits="FrameWork.ViewConfermenter" %>
<%@ Register TagPrefix="cc1" Namespace="WEBLib" Assembly="WEBLib" %>
<%@ Register TagPrefix="uc1" TagName="TextDate" Src="../../Calendar/TextDate.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>‰„«Ì‘  ›ÊÌ÷ ò‰‰œÂ</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Includes/StyleForPages.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../Includes/TreeStyles.css" type="text/css" rel="stylesheet">
		<script language="javascript">
			//////////////////////////////////////////////////////////////////////////////////
			function onLoad()
			{
				document.all("Body").scroll="no"
				//RefreshFrameAccessRole()				
			}
			//////////////////////////////////////////////////////////////////////////////////
			function onclickgrdPerson(SelectedRow)
			{
				var obj
				obj=grdPerson
				if(Form1.LastSelectedRowgrdPerson.value!='')
					obj.rows(parseInt(Form1.LastSelectedRowgrdPerson.value)).style.backgroundColor=''
				Form1.LastSelectedRowgrdPerson.value=SelectedRow.rowIndex
				SelectedRow.style.backgroundColor='#FFD599'
				Form1.FromPersonId.value=SelectedRow.cells(0).innerText
				RefreshFrameAccessRole()
			}
			//////////////////////////////////////////////////////////////////////////////////
			function RefreshFrameAccessRole()
			{
				if (Form1.FromPersonId.value=='')
					Form1.FromPersonId.value='0'
				var url
				url='ViewMyCartableAccessRole.aspx?FromPersonId='+Form1.FromPersonId.value+' &ToPersonId='+Form1.ToPersonId.value
				window.frames('FrameAccessRole').location=url
			}
		</script>
	</HEAD>
	<body id="Body" dir="rtl" bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" onload="onLoad()"
		rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE class="CssLayer2" id="Layer1" height="100%" cellSpacing="1" cellPadding="1" width="100%"
				border="0">
				<TR>
					<TD vAlign="middle" align="center">
						<TABLE class="CssPage" id="Table1" style="WIDTH: 824px; POSITION: relative; TOP: 10px; HEIGHT: 334px"
							height="334" cellSpacing="1" cellPadding="1" width="824" border="0">
							<TR>
								<TD vAlign="top" align="right">
									<TABLE id="Table3" style="WIDTH: 751px; HEIGHT: 446px" cellSpacing="1" cellPadding="1"
										width="751" align="right" border="0">
										<TR>
											<TD id="TdFrame" style="WIDTH: 543px" vAlign="top" width="543">
												<cc1:automationgrid id="grdPerson" runat="server" AutoGenerateColumns="False" SendXML="DoNotSend" SelectRowOnClick="False"
													ClientPageSize="0" Scrolling="False" EnableClientPager="False" ShowHeader="False" SelectRowOnMouseMove="False"
													UsingKeyBoard="False" CreateClientSideScripts="False" ClientSorting="False" HtcAddress=" " Height="40px"
													CssClass="CssbackColor" Width="597px">
													<ItemStyle CssClass="CssItemStyle"></ItemStyle>
													<HeaderStyle HorizontalAlign="Center" CssClass="CssHeaderStyle" VerticalAlign="Middle"></HeaderStyle>
													<AlternatingItemStyle CssClass="CssAlternatingItemStyle"></AlternatingItemStyle>
													<FooterStyle CssClass="CssEditItemStyle "></FooterStyle>
													<Columns>
														<asp:BoundColumn DataField="PersonID" HeaderText="‘„«—Â Å—”‰·Ì">
															<HeaderStyle HorizontalAlign="Center" Width="70px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center" Width="70px"></ItemStyle>
														</asp:BoundColumn>
														<asp:BoundColumn DataField="FirstName" HeaderText="‰«„ ">
															<HeaderStyle Width="60px"></HeaderStyle>
															<ItemStyle Width="60px"></ItemStyle>
														</asp:BoundColumn>
														<asp:BoundColumn DataField="LastName" HeaderText="‰«„ Œ«‰Ê«œêÌ ">
															<HeaderStyle Width="100px"></HeaderStyle>
															<ItemStyle Width="100px"></ItemStyle>
														</asp:BoundColumn>
														<asp:BoundColumn DataField="sDepartmentTitle" HeaderText="‰«„ Ê«Õœ">
															<HeaderStyle Width="200px"></HeaderStyle>
															<ItemStyle Width="200px"></ItemStyle>
														</asp:BoundColumn>
														<asp:BoundColumn DataField="RoleTitle" HeaderText="Å”  ”«“„«‰Ì">
															<HeaderStyle Width="200px"></HeaderStyle>
															<ItemStyle Width="200px"></ItemStyle>
														</asp:BoundColumn>
														<asp:BoundColumn DataField="RoleTypeDscr" HeaderText="‰Ê⁄ Å” ">
															<HeaderStyle Width="60px"></HeaderStyle>
															<ItemStyle Width="60px"></ItemStyle>
														</asp:BoundColumn>
													</Columns>
													<SelectedItemStyle CssClass="CssSelectedItemStyle"></SelectedItemStyle>
												</cc1:automationgrid></TD>
											<TD vAlign="top">
												<TABLE id="Table4" style="WIDTH: 219px; HEIGHT: 322px" cellSpacing="1" cellPadding="1"
													width="219" align="right" border="0">
													<TR>
														<TD>
															<TABLE id="Table5" cellSpacing="1" cellPadding="1" width="100%" align="right" border="0">
																<TR>
																	<TD> «—ÌŒ ‘—Ê⁄ :</TD>
																	<TD>
																		<uc1:textdate id="StartDate" runat="server"></uc1:textdate></TD>
																</TR>
																<TR>
																	<TD> «—ÌŒ Å«Ì«‰ :</TD>
																	<TD>
																		<uc1:textdate id="EndDate" runat="server"></uc1:textdate></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD><IFRAME id="FrameAccessRole" style="WIDTH: 100%; HEIGHT: 376px" align="right" marginWidth="0"
																marginHeight="0" src="ViewMyCartableAccessRole.aspx?FromPersonId=0 &amp;ToPersonId=0"
																frameBorder="no" width="100%" scrolling="no" height="100%"></IFRAME>
														</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<td style="DISPLAY:none">
									<cc1:MySecurity id="OnLineUser" runat="server"></cc1:MySecurity>
									<input type="text" id="ToPersonId" name="ToPersonId" runat="server"> <input type="text" id="FromPersonId" name="FromPersonId" runat="server">
									<input type="text" id="LastSelectedRowgrdPerson" name="LastSelectedRowgrdPerson" runat="server">
								</td>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
