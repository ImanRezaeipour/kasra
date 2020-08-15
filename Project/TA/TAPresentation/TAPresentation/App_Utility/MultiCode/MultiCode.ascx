<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultiCode.ascx.cs" Inherits="TAPresentation.App_Utility.MultiCode.MultiCode" %>
<%@ Register src="../ComboBox/ComboBox.ascx" tagname="ComboBox" tagprefix="uc1" %>
<%--<%@ Register Src="../ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc1" %>--%>
<link href="combobox.css" type="text/css" rel="stylesheet" />
<table id="TBMain" class="MultiCodeClassTbMain" IsMainTable="true" runat="server"
    dir="rtl" align="right" style="height: 20px">
    <tr>
        <td>
            <div style="z-index: 10">
                <uc1:combobox ID="cmbCode" runat="server" />
            </div>
        </td>
        <td id="tdBtn" valign="middle">
            <input id="BtnShowActive" name="BtnShowActive" class="CssHeaderStyle" onclick="onClickselectCode()"
                style="width: 23px; cursor: hand; height: 20px;" type="button" value="..." />

        &nbsp;</td>
    </tr>
</table>
<div style="display: none;">
    <asp:TextBox ID="txtSessionID" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtOnLineUserID" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtHidden" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtGetCompanyFinatialPeriodID" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtXml" runat="server"></asp:TextBox>
    <input type="text" id="txtOnLineUser" runat="server" />
</div>
<script src="/TAPresentation/App_Utility/Scripts/jquery-1.6.3.min.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript">
    var ThisIDCode = null;
    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    //===========================================================================
    function BeginRequestHandler(sender, args) {

    }
    //================================================================================
    function EndRequestHandler(sender, args) {
        //به دست آوردن ID کنترل جاری که روی آن event صورت گرفته است
        var PCode
        if (document.getElementById(ThisIDCode + "_txtHidden") != null) {
            PCode = document.getElementById(ThisIDCode + "_cmbCode_txtPCode").value;
            document.getElementById(ThisIDCode + "_txtHidden").value = PCode;
        }
    }
    //=============================================================================
    function onkeydownDivForGrid() {
        if (window.event != null && window.event.srcElement != null) {
            this.id = GetUserControl(window.event.srcElement);
            ThisIDCode = this.id
        }
        if (ThisIDCode != null && ThisIDCode != undefined && ThisIDCode != "") {
            document.getElementById(ThisIDCode + "_txtHidden").value = window.event.srcElement.parentElement.cells(0).innerText
        }
    }
    //=============================================================================
    function onchangecmbCode() {
        if (window.event != null && window.event.srcElement != null) {
            this.id = GetUserControl(window.event.srcElement);
            ThisIDCode = this.id
        }
        if (ThisIDCode != null && ThisIDCode != undefined && ThisIDCode != "") {
            document.getElementById(ThisIDCode + "_txtHidden").value = document.getElementById(ThisIDCode + "_cmbCode_txtPCode").value
        }
    }
    //============================================================================
    function GetUserControl(obj) {
        try {
            var strUserControlID = "";
            var iCounter = 0;

            while (++iCounter < 20 && obj != null && obj.IsMainTable == null) {
                obj = obj.parentElement;

            }

            if (obj != null && obj.IsMainTable != null && obj.IsMainTable == "true") {
                strUserControlID = obj.UserControlID;

            }
            return strUserControlID;
        }
        catch (e) {
        }
    }
    //=============================================================================
    function onClickselectCode() {

        var lenID = 0;
        if (window.event != null && window.event.srcElement != null) {
            this.id = GetUserControl(window.event.srcElement);
            this.id = GetUserControl(window.event.srcElement);
            ThisIDCode = this.id
        }
        if (ThisIDCode != null && ThisIDCode != undefined && ThisIDCode != "") {
            if (document.getElementById(ThisIDCode + "_cmbCode_txtPCode").value != "") {
                document.getElementById(ThisIDCode + "_txtHidden").value = document.getElementById(ThisIDCode + "_cmbCode_txtPCode").value
            }

            var strUrl = "/TAPresentation/App_Pages/BaseInfo/CodeSelector.aspx?&Type=MultiCode"
                        + "&SessionID=" + document.getElementById(ThisIDCode + "_txtSessionID").value
                        + "&CodeVlue=" + document.getElementById(ThisIDCode + "_txtHidden").value
            var rValue = window.showModalDialog(strUrl, '', 'dialogHeight:500px;dialogWidth: 750px;center: Yes;help: no;status: no')
            if ((rValue != undefined) && (rValue != "")) {
                var strXml = rValue
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(strXml);
                //-------------------------------------------------------
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
                //-------------------------------------------------------
                if (oXmlNodes.length > 0) {
                    lenID = oXmlNodes.item(0).selectSingleNode('ID').text.split(",").length;
                    if (lenID == 1) {
                        document.getElementById(ThisIDCode + "_cmbCode_txtPCode").value = oXmlNodes.item(0).selectSingleNode('ID').text;
                        document.getElementById(ThisIDCode + "_cmbCode_txtCode").value = oXmlNodes.item(0).selectSingleNode('ID').text;
                        document.getElementById(ThisIDCode + "_cmbCode_txtName").value = oXmlNodes.item(0).selectSingleNode('Name').text;
                    }
                    else {
                        document.getElementById(ThisIDCode + "_cmbCode_txtCode").value = ""
                        document.getElementById(ThisIDCode + "_cmbCode_txtPCode").value = ""
                        document.getElementById(ThisIDCode + "_cmbCode_txtName").value = oXmlNodes.item(0).selectSingleNode('ID').text;
                    }
                    document.getElementById(ThisIDCode + "_txtHidden").value = oXmlNodes.item(0).selectSingleNode('ID').text;
                }
            }
        }
    }
    //=============================================================================
</script>

