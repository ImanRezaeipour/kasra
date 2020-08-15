<%@ Control Language="vb" AutoEventWireup="false" Codebehind="TextDate.ascx.vb" Inherits="TA.TextDate" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<script language="javascript" src="/TA/Includes/Calendar/Scripts/JScripts/TextDate.js"></script>
<script language="javascript" src="/TA/Includes/Calendar/Scripts/JScripts/KasraDate.js"></script>
<TABLE id="MainTable" style="WIDTH: 129px; HEIGHT: 8px" cellSpacing="0" cellPadding="0"
	align="right" border="0" runat="server" IsMainTable="true">
	<tr>
		<td vAlign="top" align="right">
			<table dir="rtl" style="BORDER-RIGHT: #b0c4de 2px groove; BORDER-TOP: #b0c4de 2px groove; BORDER-LEFT: #b0c4de 2px groove; WIDTH: 128px; BORDER-BOTTOM: #b0c4de 2px groove; HEIGHT: 8px"
				cellSpacing="0" cellPadding="0" align="right" border="0">
				<tr>
					<td>
						<table id="tblTextDate" dir="rtl" style="WIDTH: 100px; HEIGHT: 8px" cellSpacing="0" cellPadding="0"
							align="right" bgColor="#ffffff" runat="server">
							<tr>
								<td dir="rtl"><asp:textbox id="txtDay" onkeydown="txtonkeydown()" onblur="txtonblur()" onkeyup="txtDayonkeyup()"
										onfocus="txtonfocus()" runat="server" ReadOnly="True" MaxLength="2" DatePartintion="Day" BorderWidth="0px"
										Height="17px" Width="20px"></asp:textbox></td>
								<td dir="rtl"><asp:label id="lblRightSlash" runat="server" BorderWidth="0px" Height="17px" Width="10px" BackColor="#ffffff">/</asp:label></td>
								<td dir="rtl"><asp:textbox id="txtMonth" onkeydown="txtonkeydown()" onblur="txtonblur()" onkeyup="txtMonthonkeyup()"
										onfocus="txtonfocus()" runat="server" ReadOnly="True" MaxLength="2" DatePartintion="Month" BorderWidth="0px"
										Height="17px" Width="20px"></asp:textbox></td>
								<td dir="rtl"><asp:label id="lblLeftSlash" runat="server" BorderWidth="0px" Height="17px" Width="10px" BackColor="#ffffff">/</asp:label></td>
								<td dir="rtl"><asp:textbox id="txtYear" onkeydown="txtonkeydown()" onblur="txtonblur()" onfocus="txtonfocus()"
										runat="server" ReadOnly="True" MaxLength="4" DatePartintion="Year" BorderWidth="0px" Height="17px"
										Width="30px"></asp:textbox></td>
							</tr>
						</table>
					</td>
					<TD id="btnShowCalender" style="BACKGROUND-IMAGE: url(/TA/Includes/Calendar/Images/calendar2.GIF); WIDTH: 22px; BORDER-TOP-STYLE: none; BACKGROUND-REPEAT: no-repeat; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; HEIGHT: 16px; BORDER-BOTTOM-STYLE: none"
						onclick="btnShowCalenderOnClick()" vAlign="middle"></TD>
					<td style="DISPLAY: none"><input id="txtKeyCodeHid" style="WIDTH: 10px" type="hidden" name="txtKeyCodeHid" runat="server">
						<input id="txtFocusTextsHid" style="WIDTH: 10px" type="hidden" name="txtFocusTextsHid"
							runat="server"> <input id="txtFocusCountHid" style="WIDTH: 10px" type="hidden" value="0" name="txtFocusCountHid"
							runat="server"> <input id="OnSetDateEvent" style="WIDTH: 10px" type="hidden" value="0" name="OnSetDateEvent"
							runat="server"> <INPUT id="txtXmlHoliday" type="text" name="txtXmlHoliday" runat="server">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</TABLE>
<script language="vbscript" src="/TA/Includes/Calendar/Scripts/VBScripts/TextDate.vbs"></script>
