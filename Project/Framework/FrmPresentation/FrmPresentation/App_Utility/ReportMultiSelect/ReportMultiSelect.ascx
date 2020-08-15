<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReportMultiSelect.ascx.cs" Inherits="FrmPresentation.App_Utility.ReportMultiSelect.ReportMultiSelect" %>

<table align="right" dir="rtl" id="TBMain" IsMainTable="true" runat="server" style="height: 20px">
    <tr>
        <td>
            <asp:TextBox ID="txtSelection" runat="server" Enabled="False" onchannge="onchangeSelection()"></asp:TextBox>
        </td>
        <td style="vertical-align: middle" id="tdBtn">
            <input class="CssHeaderStyle" id="BtnShowActive" name="BtnShowActive" onclick="onClickselectReport()" style="width: 23px; cursor: pointer; height: 20px;" type="button" value="..." /><%----%>
        </td>
    </tr>
</table>
<div style="display: none;">
    <asp:TextBox ID="txtSessionID" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtOnLineUserID" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtPersonID" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtGetCompanyFinatialPeriodID" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtXml" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtHidden" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtSplitXml" runat="server" ></asp:TextBox>
    <asp:TextBox ID="TxtStrParams" runat="server" ></asp:TextBox>
</div>
<script type="text/javascript">
    //=====================================================================================================================
    var ThisIDPerson = null;
    var strXml = "";

    //=========================================onchangecmbPerson=========================================================================
    //function onchangeSelection(clientId) {
    //    ThisIDPerson = clientId;
    //    if (ThisIDPerson != null && ThisIDPerson != undefined && ThisIDPerson != "") {
    //        $("#" + ThisIDPerson + "_txtXml").val($("#" + ThisIDPerson + "_txtSelection").val());
    //            strXml = "<Root><Tb>";
    //            strXml += "<SelectionID>" + document.getElementById(ThisIDPerson + "_txtSelection").value + "</SelectionID>";
    //            strXml += "<Selected>1</Selected>";
    //            strXml += "</Tb></Root>";
    //        $("#"+ThisIDPerson + "_txtHidden").val(strXml);
    //    }
    //}
    //========================================onClickselectPerson=================================================
    function onClickselectReport() {
        if (window.event != null && window.event.srcElement != null) {
            this.id = F_GetUserControlID(window.event.srcElement);
            ThisIDPerson = this.id;
        }
        
        if (ThisIDPerson != null && ThisIDPerson != undefined && ThisIDPerson != "") {
            var strUrl;
            strUrl = "";
            //if (document.getElementById(ThisIDPerson + "_txtSelection").value != "") {

            //    strXml = "<Root><Tb><SelectionID>" + document.getElementById(ThisIDPerson + "_txtSelection").value + "</SelectionID><Selected>1</Selected></Tb></Root>";

            //    document.getElementById(ThisIDPerson + "_txtHidden").value = strXml;
            //    document.getElementById(ThisIDPerson + "_txtXml").value = document.getElementById(ThisIDPerson + "_txtSelection").value;
            //}
            //---------------------------------------------------------------------------
            //$("#" + ThisIDPerson + "_txtSelection").val("");
            //$("#" + ThisIDPerson + "_txtXml").val("");
            
            var strParam = $("#" + ThisIDPerson + "_TxtStrParams").val()
                //"MenuItemID=" + $("#" + ThisIDPerson + "_TxtMenuItemID").val() + "&OnLineUser=" + $("#" + ThisIDPerson + "_txtOnLineUserID").val() + "&SessionID=" + $("#" + ThisIDPerson + "txtSessionID").val() + "&ToPersonId=" + $("#" + ThisIDPerson + "txtPersonID").val();
            strUrl = "/FrmPresentation/App_Pages/FormGenerator/ReportShow.aspx?" + strParam+"&btnOk=1";

            var rValue = window.showModalDialog(encodeURI(strUrl), '', 'dialogHeight: 1000px;dialogWidth: 1000px;center: Yes;help: no;status: no');

            if ((rValue != undefined)) {

                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(rValue);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
                //=====================================================================                        
                if (oXmlNodes.length > 0) {
                    
                    $("#" + ThisIDPerson + "_txtSelection").val(oXmlNodes.item(0).selectSingleNode("Name").text);
                    //$("#"+ThisIDPerson + "_txtSelection").val("چندين انتخاب");

                } else if (oXmlNodes.length != 1)
                    $("#" + ThisIDPerson + "_txtSelection").val("");
                
//                //-------------------
//                document.getElementById(ThisIDPerson + "_txtHidden").value = rValue
//                var endFor = oXmlNodes.length;
//                document.getElementById(ThisIDPerson + "_txtXml").value = ""
//                for (var i = 0; i < endFor; i++) {
//                    document.getElementById(ThisIDPerson + "_txtXml").value += (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Department" ? oXmlNodes.item(i).selectSingleNode('DepartmentID').text : (document.getElementById(ThisIDPerson + "_txtSplitXml").value == "Group" ? oXmlNodes.item(i).selectSingleNode('GroupId').text : (oXmlNodes.item(i).selectSingleNode("PCode") != null && oXmlNodes.item(i).selectSingleNode("PCode") != undefined) ? oXmlNodes.item(i).selectSingleNode("PCode").text : oXmlNodes.item(i).selectSingleNode("PID").text));
//                    document.getElementById(ThisIDPerson + "_txtXml").value += ",";
//                }
//                (document.getElementById(ThisIDPerson + "_txtXml").value) = (document.getElementById(ThisIDPerson + "_txtXml").value).substr(document.getElementById(ThisIDPerson + "_txtXml").value, parseInt((document.getElementById(ThisIDPerson + "_txtXml").value).length) - 1)
////-----------------------------------


                $("#"+ThisIDPerson + "_txtHidden").val(rValue);
                var endFor = oXmlNodes.length;
                var strname = "";
                var strvalue = "";
                $("#"+ThisIDPerson + "_txtXml").val("");
                for (var i = 0; i < endFor; i++) {
                    
                    strvalue += oXmlNodes.item(i).selectSingleNode("ID").text;
                    strvalue += ",";
                    strname += oXmlNodes.item(i).selectSingleNode("Name").text;
                    strname += ",";
                }
                strvalue = strvalue.substr(strvalue, (strvalue.length) - 1);
                strname = strname.substr(strname, (strname.length) - 1);
                
                $("#" + ThisIDPerson + "_txtXml").val(strvalue);
                $("#" + ThisIDPerson + "_txtSelection").val(strname);
            }
        }
    }
    //===============================================F_GetUserControlID============================================================================
    function F_GetUserControlID(obj) {
        // در نظر می گیرد userControlID ان را به عنوان ID اصلی برسدو table تاحداکثر 20 لول بالا میرود تا به 
        var strUserControlId = "";
        try {
            
            var iCounter = 0;

            while (++iCounter < 20 && obj != null && obj.IsMainTable == null) {
                obj = obj.parentElement;

            }
            if (obj != null && obj.IsMainTable != null && obj.IsMainTable == "true") {
                strUserControlId = obj.UserControlID;

            }
            return strUserControlId;
        }
        catch (e) {
        }
        return strUserControlId;
    }
</script>