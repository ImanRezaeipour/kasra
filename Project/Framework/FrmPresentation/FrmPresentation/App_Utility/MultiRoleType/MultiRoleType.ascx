<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultiRoleType.ascx.cs"
    Inherits="FrmPresentation.App_Utility.MultiRoleType.MultiRoleType" %>
<link href="combobox.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" language="javascript">
    var ThisIDRoleType = null;
    function onchangecmbRoleType(obj) {
        if (window.event != null && window.event.srcElement != null)
            ThisIDRoleType = ThisIDRoleType = obj.getAttribute("UserControlID"); // this.id

        if (ThisIDRoleType != null && ThisIDRoleType != undefined && ThisIDRoleType != "") {
//            if (document.getElementById(ThisIDRoleType + "_txtHidden").value == "") {
                var strXml = "<Root><Tb>"
                strXml += "<Chk>1</Chk>"
                strXml += "<RoleTypeID>" + document.getElementById(ThisIDRoleType + "_cmbRoleType").value + "</RoleTypeID>"

                strXml += "</Tb></Root>"
                document.getElementById(ThisIDRoleType + "_txtHidden").value = strXml + "++<RoleType>" + document.getElementById(ThisIDRoleType + "_cmbRoleType").value + "</RoleType>";
                document.getElementById(ThisIDRoleType + "_txtXml").value = "<RoleType>" + document.getElementById(ThisIDRoleType + "_cmbRoleType").value + "</RoleType>";
//            }
        }
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
    function onClickselectRoleType(obj) {
        if (window.event != null && window.event.srcElement != null) 
            ThisIDRoleType = obj.getAttribute("UserControlID");  

        if (ThisIDRoleType != null && ThisIDRoleType != undefined && ThisIDRoleType != "") {

            var strUrl = "/FrmPresentation/App_Pages/BaseInfo/RoleType/selectRoleType.aspx?Type=Check&SessionID=" + document.getElementById(ThisIDRoleType + "_txtSessionID").value
             + "&txtHidden=" + document.getElementById(ThisIDRoleType + "_txtHidden").value

            var rValue = window.showModalDialog(strUrl, '', 'dialogHeight:500px;dialogWidth: 600px;center: Yes;help: no;status: no')
         
            if ((rValue != undefined) && (rValue != "")) {

                var strReturn = rValue;
                document.getElementById(ThisIDRoleType + "_txtHidden").value = strReturn.substring(0, strReturn.indexOf('++'));
                document.getElementById(ThisIDRoleType + "_txtXml").value = strReturn.substring(strReturn.indexOf('++') + 2, strReturn.length);
                var strXml = document.getElementById(ThisIDRoleType + "_txtHidden").value;
                var oXmlDoc = "";
                if (window.ActiveXObject) {
                    oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                    oXmlDoc.async = "false";
                    oXmlDoc.loadXML(strXml)
                }
                else {
                    var parser = new DOMParser();
                    oXmlDoc = parser.parseFromString(strXml, 'text/xml');
                }

                //               
                var counter = 0;
                var IdRoletype;
                $(oXmlDoc)
                  .find("RoleTypeID")
                  .each(function () {
                      if ($(this).parent(0).find("Chk").text() == '1') {
                          counter++;
                          IdRoletype = $(this).text();
                      }
                  });
                if (counter == 1)
                    document.getElementById(ThisIDRoleType + "_cmbRoleType").value = IdRoletype
                else
                    document.getElementById(ThisIDRoleType + "_cmbRoleType").value = 0
                document.getElementById(ThisIDRoleType + "_txtHidden").value = rValue
            }

        }
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
<table id="TBMain" ismaintable="true" runat="server" dir="rtl" align="right" style="height: 20px">
    <tr>
        <td>
            <asp:DropDownList ID="cmbRoleType" runat="server" CssClass="txtcontrols" onchange="onchangecmbRoleType(this)"
                Width="120">
            </asp:DropDownList>
        </td>
        <td id="tdBtn" valign="middle">
            <input id="BtnShowActive" name="BtnShowActive" class="CssHeaderStyle" onclick="onClickselectRoleType(this)"
                style="width: 23px; cursor: pointer; height: 20px;" type="button" value="..." runat="server" />
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
     <asp:TextBox ID="txtXmlRq" runat="server" ClientIDMode="Static"></asp:TextBox>
</div>

