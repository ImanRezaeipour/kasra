<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ComboBox.ascx.cs" Inherits="TAPresentation.App_Utility.ComboBox.ComboBox" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<link href="/TAPresentation/App_Utility/ComboBox/Style/PersonComboStyle.css" rel="stylesheet"
    type="text/css" />
<%--ie10--%>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<script src="/TAPresentation/App_Utility/Scripts/jquery-1.6.3.min.js" type="text/javascript"></script>
<script src="/TAPresentation/App_Utility/ComboBox/ComboBox.js?v=1.3" type="text/javascript"></script>
<asp:Literal ID="LitraltxtPCode" runat="server"></asp:Literal>
<table border="0" id="TBMain" ismaintable="true" runat="server" dir="rtl" align="right"
    cellpadding="0" cellspacing="0" style="border: 1px solid #6699FF; width: 210px;
    height: 20px">
    <tr>
        <td id="tdText" valign="middle">
            <asp:TextBox IsTxtCombo="True" timeout="" class="TxtControls" ID="txtPCode" OldVal="" 
                onblur="onBlurtxtPCode(this)" onclick="onFocusTxt(this)" runat="server" onkeydown="txtPCodeOnKeyDown(this)"
                oncontextmenu="txtPCodeonmousedown(this)" Width="70px" AutoCompleteType="Disabled"></asp:TextBox>
        </td>
        <td id="tdBtn" valign="middle">
            <input id="BtnDown" runat="server" type="button" onclick="return BtnDown_onclick(this)"
                class="CssBtnDownCombo" />
        </td>
        <td id="Td1" runat="server" align="right" style="width: 160px; font-family: KasraTahoma;
            font-size: 12px; font-weight: bold;">
            <asp:TextBox ID="txtName" runat="server" ReadOnly="true" Width="100" Height="20px"
                BorderStyle="None" BackColor="Transparent" Font-Names="tahoma" Font-Size="12px"
                Font-Bold="True" ForeColor="#006600"></asp:TextBox>
        </td>
    </tr>
</table>
<div style="display: none;">
    <cc1:MySecurity ID="OnLineUser" runat="server">
    </cc1:MySecurity>    
    <asp:TextBox ID="txtOnMouseOver" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtSessionID" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtOnLineUserID" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtGetCompanyFinatialPeriodID" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
    <asp:TextBox ID="NotExitDate" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtOnChangeFunc" runat="server"></asp:TextBox>
</div>
<div runat="server" iscombo="true" id="DivPopup" dir="rtl" style="border: 2px solid #858585;
    width: 211px; background-color: #FFFFF2; position: absolute; display: none;">
    <table id="grd_Header" style="width: 100%; height: 20px" border="0" cellpadding="0"
        cellspacing="0">
        <tr>
            <td align="center" style="width: 90px; height: 20px" class="CssGridHeader">
                كد
            </td>
            <td align="right" style="width: 171px; height: 20px" class="CssGridHeader">
                نام
            </td>
        </tr>
    </table>
    <div dir="rtl" id="DivForGrid" runat="server" style="width: 100%" onmouseover="onmouseoverDiv(this)"
        onmouseout="onMouseOutDiv(this)">
        <table runat="server" id="grd" style="width: 100%" border="0" cellpadding="0" cellspacing="0"
            onkeydown="grd_OnKeyDown(this)">
            <tr>
                <td align="center" style="width: 90px">
                    &nbsp;
                </td>
                <td align="center" style="width: 171px">
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
</div>
<div style="display: none">    
    <input type="text" id="txtMode" runat="server" style="display: none" />
    <input type="text" id="txtSDate" runat="server" style="display: none" />
    <input type="text" id="txtEDate" runat="server" style="display: none" />
    <input type="text" id="txtSWPID" runat="server" style="display: none" />
    <input type="text" id="txtEWPID" runat="server" style="display: none" />
    <input type="text" id="txtMenuItemID" runat="server" style="display: none" />
    <input type="text" id="txtSP" runat="server" style="display: none" /> 
    <input type="text" id="txtSetLanguageCombo" runat="server" style="display: none" />    
</div>

