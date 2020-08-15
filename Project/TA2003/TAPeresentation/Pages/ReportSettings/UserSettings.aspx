<%@ Page Language="vb" AutoEventWireup="false" Codebehind="UserSettings.aspx.vb" Inherits="TA.UserSettings" validateRequest="false"%>
<%@ Register TagPrefix="uc1" TagName="TextDate" Src="../../../Includes/Calendar/TextDate.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="WEbLib" Assembly="WEBLib" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir="rtl">
	<HEAD>
		<title>UserSettings</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../Includes/Styles/StyleLib.css" type="text/css" rel="stylesheet">
		<LINK href="../../../Includes/Styles/StyleForPages.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		////////////////////////////////////Global Variable
		var oReqHttp;
		/*****************************************************************************/
		function PageLoad()
		{
			
			if (Form1.txtSDate.value!="" && Form1.txtEDate.value!="")
			{
				Form1.SDate_txtDay.value=Form1.txtSDate.value.substr(8,2);
				Form1.SDate_txtMonth.value=Form1.txtSDate.value.substr(5,2);
				Form1.SDate_txtYear.value=Form1.txtSDate.value.substr(0,4);
				
				Form1.EDate_txtDay.value=Form1.txtEDate.value.substr(8,2);
				Form1.EDate_txtMonth.value=Form1.txtEDate.value.substr(5,2);
				Form1.EDate_txtYear.value=Form1.txtEDate.value.substr(0,4);
				Form1.rdbMonthSet.checked=true
				Form1.rdbMonthDefault.checked=false
			}
			else
			{
				Form1.rdbMonthSet.checked=false
				Form1.rdbMonthDefault.checked=true
				Form1.SDate_txtDay.value="";
				Form1.SDate_txtMonth.value="";
				Form1.SDate_txtYear.value="";
				
				Form1.EDate_txtDay.value="";
				Form1.EDate_txtMonth.value="";
				Form1.EDate_txtYear.value="";
			}
			/*-----Alert--------------------------------------*/
			if (Form1.txtMessage.value!="")
			{
				alert(Form1.txtMessage.value)
				Form1.txtMessage.value=""
			}
		}
		/*****************************************************************************/
		function onClickbtnOk()
		{
			if (Form1.rdbMonthSet.checked)
			{
				var Sd=Form1.SDate_txtYear.value+"/"+Form1.SDate_txtMonth.value+"/"+Form1.SDate_txtDay.value;
				var Ed=Form1.EDate_txtYear.value+"/"+Form1.EDate_txtMonth.value+"/"+Form1.EDate_txtDay.value;
				Form1.txtSDate.value=Sd
				Form1.txtEDate.value=Ed
				if ((Sd != "" && Ed != "") && (Sd != "//" && Ed != "//"))
				{
					if(CompareDate())
					{
						Form1.txtSubmit.value="Save"
						Form1.submit()
					}
				}
				else
					alert("«ÿ·«⁄«  —«  ò„Ì· ‰„«ÌÌœ")	
			}
			else
			{
				Form1.txtSubmit.value="Delete"
				Form1.submit()
			}
		}
		/*****************************************************************************/
		function CompareDate()
		{
			var ED=document.getElementById("EDate_txtYear").value+document.getElementById("EDate_txtMonth").value+document.getElementById("EDate_txtDay").value
			var SD=document.getElementById("SDate_txtYear").value+document.getElementById("SDate_txtMonth").value+document.getElementById("SDate_txtDay").value
			if(ED<SD)
			{
				alert(' «—ÌŒ Å«Ì«‰ »«Ìœ »“—ê — «“  «—ÌŒ ‘—Ê⁄ »«‘œ')
				return false
			}
			return true
				
		}
		/*****************************************************************************/
		function RequestProcessor()
		{
			//If the readyState is in the "Ready" state
			if (oReqHttp.readyState == 4 || oReqHttp.readyState == 'complete')
			{
				//Returned status code 200 means Everything is fine.
				if(oReqHttp.status == 200)
				{
					//If responseText is not blank
					//req.responseText is actually a string written by AJAXServer.aspx by its 	
					if(oReqHttp.responseText != "")
					{
						var Result = oReqHttp.responseText.split("<!")[0];
						if (Result=1)
						{
							alert("À»  ‘œ")
							if (Form1.rdbMonthDefault.checked)
							{
								Form1.SDate_txtDay.value="";
								Form1.SDate_txtMonth.value="";
								Form1.SDate_txtYear.value="";
								
								Form1.EDate_txtDay.value="";
								Form1.EDate_txtMonth.value="";
								Form1.EDate_txtYear.value="";
							}
							Form1.txtSDate.value=Form1.SDate_txtYear.value+"/"+Form1.SDate_txtMonth.value+"/"+Form1.SDate_txtDay.value;
							Form1.txtEDate.value=Form1.EDate_txtYear.value+"/"+Form1.EDate_txtMonth.value+"/"+Form1.EDate_txtDay.value;
						}	
						else
						{
							alert("À»  «ÿ·«⁄«  »« „‘ò· —Ê»—Ê ‘œ")
							Form1.txtEDate.value="";
							Form1.txtSDate.value="";
							
							Form1.SDate_txtDay.value=Form1.txtSDate.value.substr(8,2);
							Form1.SDate_txtMonth.value=Form1.txtSDate.value.substr(6,2);
							Form1.SDate_txtYear.value=Form1.txtSDate.value.substr(0,4);
							
							Form1.EDate_txtDay.value=Form1.txtEDate.value.substr(8,2);
							Form1.EDate_txtMonth.value=Form1.txtEDate.value.substr(6,2);
							Form1.EDate_txtYear.value=Form1.txtEDate.value.substr(0,4);
						}	
					}
				}
			}
			return true;
		}
		/*****************************************************************************/
		/*****************************************************************************/
		</script>
	</HEAD>
	<body bottomMargin="0" leftMargin="0" topMargin="0" onload="PageLoad()" rightMargin="0"
		scroll="no">
		<FORM id="Form1" method="post" runat="server">
			<TABLE class="CssLayer1" id="Layer1" height="100%" cellSpacing="0" cellPadding="10" width="100%"
				align="right" border="0">
				<TBODY>
					<TR>
						<TD vAlign="middle" align="center">
							<TABLE class="CssLayer2" id="Layer2" style="WIDTH: 654px; HEIGHT: 401px" height="401" cellSpacing="0"
								cellPadding="0" width="654" border="0">
								<TBODY>
									<TR>
										<TD vAlign="middle" align="center">
											<TABLE class="CssPage" id="Layer3" style="WIDTH: 424px; HEIGHT: 128px" height="128" cellSpacing="0"
												cellPadding="0" width="424" border="0">
												<TBODY>
													<TR>
														<TD id="Td2" style="HEIGHT: 71px" vAlign="middle" align="center" runat="server">
															<TABLE id="Table2" style="WIDTH: 420px; HEIGHT: 57px" cellSpacing="1" cellPadding="1" width="420"
																border="0">
																<TR>
																	<TD><INPUT id="rdbMonthSet" type="radio" name="Month"></TD>
																	<TD>«“  «—ÌŒ</TD>
																	<TD>
																		<uc1:textdate id="SDate" runat="server"></uc1:textdate></TD>
																	<TD> «  «—ÌŒ</TD>
																	<TD>
																		<uc1:textdate id="EDate" runat="server"></uc1:textdate></TD>
																</TR>
																<TR>
																	<TD colSpan="5"><INPUT id="rdbMonthDefault" type="radio" name="Month">&nbsp;&nbsp; 
																		„«Â Ã«—Ì</TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD vAlign="middle" align="center">
															<HR class="CssHorizontalLine" style="WIDTH: 290px; HEIGHT: 2px" SIZE="2">
															<TABLE id="Table3" style="WIDTH: 83px; HEIGHT: 46px" cellSpacing="5" cellPadding="2" width="83"
																border="0">
																<TR>
																	<TD style="WIDTH: 68px"><INPUT class="CssbtnOK" id="btnOk" onclick="onClickbtnOk()" type="button" style="cursor:hand" name="btnOk"></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD vAlign="middle" align="center" style="DISPLAY:none"><input type="text" runat="server" id="txtMessage"><input type="text" id="txtSubmit" runat="server"><cc1:mysecurity id="OnLineUser" runat="server"></cc1:mysecurity>
															<input id="txtSDate" type="text" name="txtSDate" runat="server"><input id="txtEDate" type="text" name="txtEDate" runat="server">
														</TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</FORM>
		</TR></TBODY></TABLE></TR></TBODY></TABLE></TR></TBODY></TABLE></TR></TBODY></TABLE></FORM>
	</body>
</HTML>
