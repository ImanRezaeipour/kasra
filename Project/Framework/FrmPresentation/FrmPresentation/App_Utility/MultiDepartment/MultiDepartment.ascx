<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultiDepartment.ascx.cs"
    Inherits="FrmPresentation.App_Utility.MultiDepartment.MultiDepartment" %>
<%@ Register Src="../ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc1" %>
<link href="combobox.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" language="javascript">
    var ThisIDDepartment = null;
    function onchangecmbDepartment() {
        if (window.event != null && window.event.srcElement != null) {
            this.id = F_GetUserControlID(window.event.srcElement);
            ThisIDDepartment = this.id
        }

        if (ThisIDDepartment != null && ThisIDDepartment != undefined && ThisIDDepartment != "") {
            var strXml = "<Tb>"
            strXml += "<DepartmentID>" + document.getElementById(ThisIDDepartment + "_cmbDepartment").value + "</DepartmentID>"
            strXml += "<Selected>1</Selected>"
            strXml += "</Tb>"
            document.getElementById(ThisIDDepartment + "_txtHidden").value = strXml
        }
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
    function onClickselectDepartment() {
        if (window.event != null && window.event.srcElement != null) {
            this.id = F_GetUserControlID(window.event.srcElement);
            ThisIDDepartment = this.id
        }

        if (ThisIDDepartment != null && ThisIDDepartment != undefined && ThisIDDepartment != "") {
            var strUrl = "/TAPresentation/App_Utility/MultiDepartment/MultiDepartment1.aspx?txtHidden=" + document.getElementById(ThisIDDepartment + "_txtHidden").value + "&SessionID=" + document.getElementById(ThisIDDepartment + "_txtSessionID").value + "&CompanyPeriodID=" + document.getElementById(ThisIDDepartment + "_txtGetCompanyFinatialPeriodID").value;
            strUrl = encodeURI(strUrl)
            var rValue = window.showModalDialog(strUrl, '', 'dialogHeight: 400px;dialogWidth: 300px;center: Yes;help: no;status: no')

            if ((rValue != undefined) && (rValue != "")) {
                var strXml = "<Root>" + rValue + "</Root>"
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(strXml);

                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ Selected=1]");
                //========================================================
                if (oXmlNodes.length == 1)
                    document.getElementById(ThisIDDepartment + "_cmbDepartment").value = oXmlNodes.item(0).selectSingleNode("DepartmentID").text
                else
                    document.getElementById(ThisIDDepartment + "_cmbDepartment").value = 0
            }
            document.getElementById(ThisIDDepartment + "_txtHidden").value = rValue
        }
        // alert(document.getElementById(ThisIDDepartment + "_txtHidden").value)
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
        
            <asp:DropDownList ID="cmbDepartment" runat="server"  CssClass="txtcontrols" onchange="onchangecmbDepartment()"
      
      Width="120"></asp:DropDownList>
        </td>
        <td id="tdBtn" valign="middle">
            <input id="BtnShowActive" name="BtnShowActive" class="CssHeaderStyle" onclick="onClickselectDepartment()"
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
</div>
