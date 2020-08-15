<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master" AutoEventWireup="true" CodeBehind="TemplateNewFillCombo.aspx.cs" Inherits="TAPresentation.TemplateNewFillCombo" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td colspan="3">
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td><input type="radio" id="rdBsicInfo" name="RD" onclick="onclickrdBsicInfo()" checked="checked" /></td>
            <td>اطلاعات پايه</td>
            <td ><input id="txtLookup" type="text" class="TxtControls" style="width: 150px" onkeypress="return keyEnter(this,event)"/></td>
        </tr>
        <tr>
            <td><input type="radio" id="rdInputInfo" name="RD" onclick="onclickrdInputInfo()"/></td>
            <td colspan="1">ورود اطلاعات</td>
        </tr>
        <tr>
            <td colspan="3" style="display: inline; scrollbar-highlight-color: white; overflow: hidden;
                scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 152px" valign="middle"
                align="center">
              <div align="right"  style="width:280px">
                <table style="width: 240px" dir='rtl'>
                        <tr>
                            <td align="center" class="CssHeaderStyle" width="50px">
                                مقدار
                            </td>
                            <td align="center" class="CssHeaderStyle" style="width: 105px">
                                مقدار نمايشي
                            </td>
                            <td align="center" class="CssHeaderStyle" width="40px">
                                ايجاد
                            </td>
                            <td align="center" class="CssHeaderStyle" style="width: 40px">
                                حذف
                            </td>
                        </tr>
                </table>
                <div   style="overflow:auto; scrollbar-highlight-color: white;  
                scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de;width: 280px; height: 230px" valign="middle"
                align="right">
                    <table id="XTabTable" style="width: 240px; display:none;">
                    </table>
                </div>
                </div>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>   
         <asp:HiddenField ID="txtAlert" runat="server" />
         <asp:HiddenField ID="txtValidate" runat="server" />
         <input type="text" id="txtHidden" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID" runat="server" />
         <input type="text" id="txtrvalue" name="txtOnLineUser" runat="server" />        
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />       
    </div>
    <script type="text/javascript" language="javascript">
        document.body.scroll = "no";
        var oGrid = document.getElementById("XTabTable")
        var MasterObj = "ctl00_ContentPlaceHolder1_";
//--------------------------------------------------------------------------------------
        if ((document.getElementById(MasterObj + "txtrvalue").value != "") && (document.getElementById(MasterObj + "txtrvalue").value != "<XMLType />")) {
//            alert(document.getElementById(MasterObj + "txtrvalue").value)

            if (document.getElementById(MasterObj + "txtrvalue").value.substr(0, 1) == "<" && document.getElementById(MasterObj + "txtrvalue").value != "<XMLType />" && document.getElementById(MasterObj + "txtrvalue").value != "<XMLType></XMLType>") {
                document.getElementById(MasterObj + "txtrvalue").value = ReplaceAll(document.getElementById(MasterObj + "txtrvalue").value, 'Sum', '+')
                document.getElementById("rdInputInfo").checked = true
                oGrid.style.display = "inline"
                document.getElementById("txtLookup").disabled = true
                 
                var strXml = document.getElementById(MasterObj + "txtrvalue").value;
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(strXml);
                var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");
                var l = oXmlNodes.length

                for (var i = 0; i < l; i++) {
                    addRow()
                    oGrid.rows(i).cells(0).firstChild.value = oXmlNodes.item(i).selectSingleNode("Value").text
                    oGrid.rows(i).cells(1).firstChild.value = oXmlNodes.item(i).selectSingleNode("title").text
                }
            }
            else {
                document.getElementById("rdBsicInfo").checked = true 
                document.getElementById("txtLookup").disabled = false
                if (document.getElementById(MasterObj + "txtrvalue").value != "<XMLType />" && document.getElementById(MasterObj + "txtrvalue").value != "<XMLType></XMLType>") {
                    document.getElementById("txtLookup").value = document.getElementById(MasterObj + "txtrvalue").value
                    addRow();
                }
            }
        }
        else
            addRow();
       
//=========================================Add row============================================================
        function addRow() {
            var oRow = oGrid.insertRow();
            var type = 0;
            var oCell0 = oRow.insertCell();

            oRow.setAttribute("type", type) //ControlRuleMemberID

//            if ((oGrid.rows.length - 1) % 2 == 0)
//                oRow.className = "CssItemStyle"
//            else
                oRow.className = "CssAlternatingItemStyle";

                oCell0.innerHTML = "<INPUT type='text' style='width: 40px' class='TxtControls' onfocus='onfocustxt(this)'/>";
            oCell0.className = "XTabTable";
             oCell0.style.width = "50px"
            oCell0.align = "center"

            var oCell1 = oRow.insertCell();
            oCell1.innerHTML = "<INPUT  type='text' style='width:80px' class='TxtControls' onfocus='onfocustxt(this)'/>";
            oCell1.style.width = "100px"
            oCell1.align = "center";

            var oCell2 = oRow.insertCell();
            oCell2.innerHTML = "<img src='/TAPresentation/App_Utility/Images/Icons/NewIcon.gif' onclick='addRow()' style='cursor:pointer' />";
            oCell2.style.width = "40px"
            oCell2.align = "center";

            var oCell3 = oRow.insertCell();
            oCell3.innerHTML = "<img src='/TAPresentation/App_Utility/Images/Icons/deleteallink.gif' onclick='Remove_row(this)' style='cursor:pointer' />";
            oCell3.className = "XTabTable";
            oCell3.style.width = "40px"
            oCell3.align = "center"
        }
//================================Remove Row===========================
        function Remove_row(obj) {
            var oRow = obj.parentElement.parentElement;
            var RowIndex = oRow.rowIndex
            if(oGrid.rows.length>1)
            oGrid.deleteRow(RowIndex)
        }
//====================================================================
        function MakeXML() {
            var StrXml=""
            var l = oGrid.rows.length
            if (document.getElementById("rdBsicInfo").checked == true)
                StrXml += document.getElementById("txtLookup").value
            else {
                StrXml += "<Root>"
                for (var i = 0; i < l; i++) {
                    StrXml += "<Tb>"
                    StrXml += "<Value>" + oGrid.rows(i).cells(0).firstChild.value + "</Value>"
                    StrXml += "<title>" + oGrid.rows(i).cells(1).firstChild.value + "</title>"
                    StrXml += "</Tb>"
                }
                StrXml += "</Root>"
            }
            return StrXml;
        }
//===============================تایید=================================
        function OnClickBtnSet() {
            if (CheckRepitition()) {
                window.returnValue = MakeXML();
                window.close();
            }
        }
        //======================================================================
        function CheckRepitition() { 
         var l = oGrid.rows.length
         for (var i = 0; i < l-1 ; i++)
             for (var j = i + 1; j < l; j++) {
                 if (oGrid.rows(i).cells(0).firstChild.value == oGrid.rows(j).cells(0).firstChild.value && oGrid.rows(i).cells(1).firstChild.value == oGrid.rows(j).cells(1).firstChild.value) {
                     oGrid.rows(i).className = "CssSelectedItemStyle";
                     oGrid.rows(j).className = "CssSelectedItemStyle";
                     i = i + 1;
                     j = j + 1;
                     alert("مقدار و مقدار نمايشي سطر" + i + "و" + j + "برابر است")
                     return false;
                 }
                 else if (oGrid.rows(i).cells(0).firstChild.value == oGrid.rows(j).cells(0).firstChild.value && oGrid.rows(i).cells(1).firstChild.value != oGrid.rows(j).cells(1).firstChild.value) {
//                     oGrid.rows(i).className = "CssSelectedItemStyle";
//                     oGrid.rows(j).className = "CssSelectedItemStyle";
                     i = i + 1;
                     j = j + 1;
                     alert("مقدار سطر"+i+"و"+j+"برابر است")
                     return false;
                 }

                 else if (oGrid.rows(i).cells(0).firstChild.value != oGrid.rows(j).cells(0).firstChild.value && oGrid.rows(i).cells(1).firstChild.value == oGrid.rows(j).cells(1).firstChild.value) {
//                     oGrid.rows(i).className = "CssSelectedItemStyle";
//                     oGrid.rows(j).className = "CssSelectedItemStyle";
                     i = i + 1;
                     j = j + 1;
                     alert("مقدار نمايشي سطر" + i + "و" + j + "برابر است")
                     return false;
                 }
             }
             return true;
         }
         //======================================================================
         function onclickrdBsicInfo() {
             document.getElementById("txtLookup").disabled = false
             oGrid.style.display = "none"
     }
     //======================================================================
     function onclickrdInputInfo() {
         var oGrid = document.getElementById("XTabTable")
         oGrid.style.display = "inline"
         document.getElementById("txtLookup").disabled = true
//         alert(document.getElementById(MasterObj + "txtrvalue").value)
         }
         //================================================
         function onfocustxt(obj) {
             obj.select()
         }
    </script>
</asp:Content>
