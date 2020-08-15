<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.Master" AutoEventWireup="true" CodeBehind="Select CardReader.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.CardReader.Select_CardReader" %>
<%@ Register src="../../../App_Utility/ToolBar/ToolBar.ascx" tagname="ToolBar" tagprefix="uc1" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }     
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">       
        <tr>
            <td>
                <uc1:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
               <cc2:KasraGrid ID="GrdCardReaders" runat="server" OnRowDataBound="Grid_RowDataBound" >
                </cc2:KasraGrid>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtPageID" name="txtPageID" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="SDate" name="SDate" runat="server" />
        <input type="text" id="EDate" name="EDate" runat="server" />
        <input type="text" id="txtXmlCardReader" name="txtXmlCardReader" runat="server" />
    </div>
    <script>
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var strChk = "";

        if (document.getElementById(MasterObj + "txtXmlCardReader").value != ""
        && document.getElementById(MasterObj + "txtXmlCardReader").value != "<Root></Root>") {
            SetChk();
            strChk = document.getElementById(MasterObj + "txtXmlCardReader").value.replace("<Root>", "")
            strChk = strChk.replace("</Root>", "")
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickGrd(SelectedRow) {

            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickHeaderChk(obj) {
            var oGrid = obj.parentElement;
            while (oGrid.tagName != "TABLE")
                oGrid = oGrid.parentElement
            var oLen = oGrid.rows.length
            for (var i = 1; i < oLen; i++) {
                oGrid.rows(i).cells(0).firstChild.checked = obj.checked
                OnClickChk(oGrid.rows(i).cells(0).firstChild);
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickChk(obj) {
            var oGrid = obj.parentElement;
            while (oGrid.tagName != "TABLE")
                oGrid = oGrid.parentElement

            var oRow = obj.parentElement;
            while (oRow.tagName != "TR")
                oRow = oRow.parentElement
            var oIndex = oRow.rowIndex
            //========================================================
            var strXml = "<Root>" + strChk + "</Root>"

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ ID=" + oGrid.rows(oIndex).getAttribute("ID") + "]");
            //========================================================
            if (oXmlNodes.length > 0) {
                if (oGrid.rows(oIndex).cells(0).firstChild.checked == true) {
                    var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
                    f.selectSingleNode("Chk").text = 1;
                    oXmlDoc.childNodes[0].appendChild(f);
                }
                else {
                    var f = oXmlDoc.documentElement.removeChild(oXmlNodes.item(0));
                    f.selectSingleNode("Chk").text = 0;
                    oXmlDoc.childNodes[0].appendChild(f);
                }
                strXml = oXmlDoc.xml;
                strChk = strXml.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            else {
                strChk += "<Tb>"
                strChk += "<ID>" + oGrid.rows(oIndex).getAttribute("ID") + "</ID>"
                strChk += "<CardReaderNo>" + oGrid.rows(oIndex).cells(1).innerText + "</CardReaderNo>"
                if (oGrid.rows(oIndex).cells(0).firstChild.checked == false)
                    strChk += "<Chk>0</Chk>"
                else
                    strChk += "<Chk>1</Chk>"

                strChk += "</Tb>"
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnOK() {
            window.returnValue = "<Root>" + strChk + "</Root>";
            window.close();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function SetChk() {
            var i = 0;
            var j = 0;

            var OGrid = document.getElementById(MasterObj + "GrdCardReaders");

            if (OGrid == null)
                return
            var PageSize = OGrid.rows.length
            var strXml = document.getElementById(MasterObj + "txtXmlCardReader").value

            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb");

            for (j = 0; j < oXmlNodes.length; j++) {
                for (i = 1; i < PageSize; i++) {
                    if (OGrid.rows(i).getAttribute("ID") == oXmlNodes.item(j).selectSingleNode("ID").text) {
                        if (oXmlNodes.item(j).selectSingleNode("Chk").text == "1")
                            OGrid.rows(i).cells(0).firstChild.checked = true;
                        else
                            OGrid.rows(i).cells(0).firstChild.checked = false;
                    }
                }
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    </script>
</asp:Content>
