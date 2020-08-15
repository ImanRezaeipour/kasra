<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultiGroup.ascx.cs" Inherits="FrmPresentation.App_Utility.MultiGroup.MultiGroup" %>
<link href="combobox.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" language="javascript">
    var ThisIDGroup = null;
    function onchangecmbGroup() {
        if (window.event != null && window.event.srcElement != null) {
            this.id = F_GetUserControlID(window.event.srcElement);
            ThisIDGroup = this.id
        }

        if (ThisIDGroup != null && ThisIDGroup != undefined && ThisIDGroup != "") {
            if (document.getElementById(ThisIDGroup + "_txtHidden").value == "") {
                var strXml = "<Root><Tb>"
                strXml += "<GroupId>" + document.getElementById(ThisIDGroup + "_cmbGroup").value + "</GroupId>"
                strXml += "<Selected>1</Selected>"
                strXml += "</Tb></Root>"
                document.getElementById(ThisIDGroup + "_txtHidden").value = strXml
            }
//            alert(document.getElementById(ThisIDGroup + "_txtHidden").value)
        }
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
    function onClickselectGroup() {
        if (window.event != null && window.event.srcElement != null) {
            this.id = F_GetUserControlID(window.event.srcElement);
            ThisIDGroup = this.id
        }
//        alert(document.getElementById(ThisIDGroup + "_txtHidden").value)
        if (ThisIDGroup != null && ThisIDGroup != undefined && ThisIDGroup != "") {
            var strUrl = "/FrmPresentation/App_Pages/BaseInfo/Group/selectGroup.aspx?Type=Check&SessionID=" + document.getElementById(ThisIDGroup + "_txtSessionID").value
             + "&txtHidden=" + document.getElementById(ThisIDGroup + "_txtHidden").value
            var rValue = window.showModalDialog(strUrl, '', 'dialogHeight:500px;dialogWidth: 600px;center: Yes;help: no;status: no')
//            alert(rValue)
            if ((rValue != undefined) && (rValue != "")) {
                    var strXml =rValue
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(strXml);

                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
//                //========================================================
                if (oXmlNodes.length == 1)
                    document.getElementById(ThisIDGroup + "_cmbGroup").value = oXmlNodes.item(0).selectSingleNode("GroupId").text
                else
                    document.getElementById(ThisIDGroup + "_cmbGroup").value = 0
            }
            document.getElementById(ThisIDGroup + "_txtHidden").value = rValue
        }
//         alert(document.getElementById(ThisIDGroup + "_txtHidden").value)
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
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
</script>

<table id="TBMain" IsMainTable="true" runat="server" dir="rtl" align="right" style="height: 20px">
    <tr>
        <td>
        
            <asp:DropDownList ID="cmbGroup" runat="server"  CssClass="txtcontrols" onchange="onchangecmbGroup()"
      
      Width="120"></asp:DropDownList>
        </td>
        <td id="tdBtn" valign="middle">
            <input id="BtnShowActive" name="BtnShowActive" class="CssHeaderStyle" onclick="onClickselectGroup()"
                style="width: 23px; cursor: pointer; height: 20px;" type="button" value="..." />
        </td>
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
