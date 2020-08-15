<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SimpleComboBox.ascx.cs" Inherits="frmpresentation.App_Utility.SimpleComboBox.SimpleComboBox" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<link href="/frmpresentation/App_Utility/SimpleComboBox/Style/PersonComboStyle.css" rel="stylesheet" type="text/css" />
 <%--ie10--%>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />

<table border="0" id="TBMain"  IsMainTable="true" runat="server" dir="rtl" align="right"
    cellpadding="0" cellspacing="0" style="border: 1px solid #6699FF; width: 220px;
    height: 20px">
    <tr>
        <td id="TDSearchTxt">
            <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <input id="txtPersonCode" type="text" runat="server" dir="rtl" style="width: 80px"
                        onkeydown="OnKeyDownInt(this),onkeydownEnterPersonCode()" onblur="OnBlurtxtPersonCode()"
                        class="TxtControls" />
                    <input id="txtPersonName" runat="server" name="txtPersonName" style="width: 99px"
                        type="text" class="TxtControls" />
                    <input id="btnRefreshPerson" class="CssHeaderStyle" onclick="onClickbtnRefreshPerson(this)"
                        style="width: 25px; cursor: pointer; height: 22px" type="button" value="..." />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ImgRefreshPersonSubmit" EventName="click" />
                    <asp:AsyncPostBackTrigger ControlID="RefreshPersonGridSubmit" EventName="click" />
                </Triggers>
            </asp:UpdatePanel>
        </td>
    </tr>
</table>
<div style="display: none">
    <cc1:MySecurity ID="OnLineUser" runat="server">
    </cc1:MySecurity>
    <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
    <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
    <asp:Button ID="ImgRefreshPersonSubmit" runat="server" OnClick="BtnSubmit_Click" />
    <asp:Button ID="RefreshPersonGridSubmit" runat="server" OnClick="BtnSubmit_Click" />
    <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
    <input type="text" id="txtCompanyID" name="txtCompanyID" runat="server" />
    <input type="text" id="txtPageID" name="txtPageID" runat="server" />
</div>
<script language="javascript" type="text/javascript">
//تا زمانی که موس روی دیو است یک متغییر 1 و با رفتن از روی آن صفر می شود و به این ترتیب تصمیم گرفته می شود که ایا دیو باز بماند یا بسته شود
var ThisIDPerson = null;
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
//--------------------------------------------------------------------
function EndRequestHandler(sender, args) {
    if (window.event != null && window.event.srcElement != null) {
        this.id = F_GetUserControlID(window.event.srcElement);
        ThisIDPerson = this.id
    }
    if (ThisIDPerson != null) {
        if (document.getElementById(ThisIDPerson + "_txtSubmit").value != "") {

            if (document.getElementById(ThisIDPerson + "_txtSubmit").value == "RefreshPerson" || document.getElementById(ThisIDPerson + "_txtSubmit").value == "RefreshPersonGridSubmit") {
                if (document.getElementById(ThisIDPerson + "_txtPersonName").value == "" && document.getElementById(ThisIDPerson + "_txtPersonCode").value != "") {
                    alert("کد پرسنلي نا معتبر است")
                    document.getElementById(ThisIDPerson + "_txtPersonCode").value = "";
                    document.getElementById(ThisIDPerson + "_txtPersonName").setAttribute("PersonCode", "");
                }
                else
                    document.getElementById(ThisIDPerson + "_txtPersonName").setAttribute("PersonCode", document.getElementById(ThisIDPerson + "_txtPersonCode").value);
            }
        }
    }
}
//--------------------------------------------------------------------
function onkeydownEnterPersonCode() {
    if (window.event != null && window.event.srcElement != null) {
        this.id = F_GetUserControlID(window.event.srcElement);
        ThisIDPerson = this.id
    }
    if (window.event != null)
        if (window.event.keyCode == 13) {
            if (event.srcElement.id == ThisIDPerson + "_txtPersonCode")
                OnClickBtnRefreshPersonGrid();
        } 
}
/******************************************************************************************/
function OnBlurtxtPersonCode() {
    if (window.event != null && window.event.srcElement != null) {
        this.id = F_GetUserControlID(window.event.srcElement);
        ThisIDPerson = this.id
    }
    if (ThisIDPerson != null) {
        if (document.getElementById(ThisIDPerson + "_txtPersonCode").value == "" || document.getElementById(ThisIDPerson + "_txtPersonCode").value == "0") {
            document.getElementById(ThisIDPerson + "_txtPersonName").value = "";
            document.getElementById(ThisIDPerson + "_txtPersonName").setAttribute("PersonCode", "");
        }
        else {
            document.getElementById(ThisIDPerson + "_txtSubmit").value = "RefreshPerson";
            document.getElementById(ThisIDPerson + "_ImgRefreshPersonSubmit").click();
        }
    }
}
/******************************************************************************************/
function onClickbtnRefreshPerson(obj) {
    if (window.event != null && window.event.srcElement != null) {
        this.id = F_GetUserControlID(window.event.srcElement);
        ThisIDPerson = this.id
    }
    if (ThisIDPerson != null) {
        var url = "/FrmPresentation/App_Pages/BaseInfo/Person/SelectPerson.aspx?Type=radio&SessionID=" + document.getElementById(ThisIDPerson + "_txtSessionID").value
    + "&OnLineUser=" + document.getElementById(ThisIDPerson + "_txtOnlineUser").value
    + "&MenuItemID=" + document.getElementById(ThisIDPerson + "_txtPageID").value;
        var strOptions = "dialogHeight: 640px;dialogWidth: 800px;center: Yes;help: no;status: no"
        var Result = Result = window.showModalDialog(url, "", strOptions);
        if (Result != "" && Result != undefined) {
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(Result);
            oXmlDoc.setProperty("SelectionLanguage", "XPath");
            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
            if (oXmlNodes.length != 0) {
                document.getElementById(ThisIDPerson + "_txtPersonCode").value = oXmlNodes.item(0).selectSingleNode('PCode').text;
                document.getElementById(ThisIDPerson + "_txtPersonName").value = oXmlNodes.item(0).selectSingleNode('PName').text;
                document.getElementById(ThisIDPerson + "_txtPersonName").setAttribute("PersonCode", oXmlNodes.item(0).selectSingleNode('PCode').text);
            }
        }
    }
}
/******************************************************************************************/
function OnClickBtnRefreshPersonGrid() {
    if (window.event != null && window.event.srcElement != null) {
        this.id = F_GetUserControlID(window.event.srcElement);
        ThisIDPerson = this.id
    }
    if (ThisIDPerson != null) {
        document.getElementById(ThisIDPerson + "_txtSubmit").value = "RefreshPersonGridSubmit";
        document.getElementById(ThisIDPerson + "_RefreshPersonGridSubmit").click();
    }
}
//===============================================F_GetUserControlID============================================================================
function F_GetUserControlID(obj) {
    // در نظر می گیرد userControlID ان را به عنوان ID اصلی برسدو table تاحداکثر 20 لول بالا میرود تا به 

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
/******************************************************************************************/
</script>
