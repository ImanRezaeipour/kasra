<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="ValueSelector.aspx.cs" Inherits="TAPresentation.App_Pages.BaseInfo.ValueSelector" %>

<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Assembly="KasraComponent" Namespace="KasraComponent.Classes" TagPrefix="cc2" %>
<%@ Register Src="../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <%--Toolbar--%>
    <table>
        <tr>
            <td>
                <uc2:ToolBar ID="OToolBar" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="height: 10px">
            </td>
        </tr>
        <tr>
            <td id="TopRow"  style="display: inline; scrollbar-highlight-color: white; overflow: hidden;
                scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 152px" valign="middle"
                align="center">
                <div align="right" style="width: 280px">
                    <table style="width: 280px">
                        <tr id="test">
                            <td class="CssHeaderStyle" align='center' style='width: 10px'>
                                <input type="checkbox" id="Chk" runat="server" onclick="OnClickHeaderChk(this)" />
                            </td>
                            <td class="CssHeaderStyle" align='center' style='width: 100px'>
                                شناسه
                            </td>
                            <td class="CssHeaderStyle" align='center' style='width: 170px'>
                                عنوان
                            </td>
                        </tr>
                    </table>
                    <div style="overflow: auto; width: 300px; height: 370px" align="right">
                        <table id="GrdValueSelector" style="width: 280px;" onclick="onClickGrdValueSelector()">
                        </table>
                    </div>
                </div>
                <%--<asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField ID="txtID" runat="server" />
                        <asp:HiddenField ID="txtMaxNumber" runat="server" />
                        <div style="display: none">
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>--%>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <cc1:MySecurity ID="OnLineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
            runat="server" />
        <input type="text" id="txtType" name="txtType" runat="server" />
        <input type="text" id="txtCodeValue" name="txtCodeValue" runat="server" />
        <input type="text" id="txtXmlChk" name="txtXmlChk" runat="server" />
        <input type="text" id="txtXMLSaved" runat="server" />
        <input type="text" id="txtSearchXml" runat="server" />
        <input type="text" id="txtSearchFlag" runat="server" />
        <input type="text" id="txtXmlValueSelector" runat="server" />
        <asp:DropDownList ID="cmbValueSelector" runat="server" ></asp:DropDownList>
        <%--<asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />--%>
    </div>
    <script language="javascript" type="text/javascript">
        document.body.scroll = "no";
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var strChk;
        //========================================================================================
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
        }
        //---------------------------------------------------------------------------------------
        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
            $get(MasterObj + "txtAlert").value = ""
            LastSelectedRow = null;
            LastSelectedRowClass = "";
        }
        //==========================================Style Grid=====================================
        function onClickGrdValueSelector() {
            var index = -1
            var oRow = event.srcElement
            //_______Find Row
            for (var i = 0; oRow.tagName != "TR"; i++)
                oRow = oRow.parentElement
            index = oRow.rowIndex
            if (oRow.parentElement.parentElement.id == "GrdValueSelector") {
                for (i = 0; i < GrdValueSelector.rows.length; i++) {
                    if (GrdValueSelector.rows(i).className == "CssSelectedItemStyle") {
                        GrdValueSelector.rows(i).className = "CssItemHeader4"
                    }
                }
                oRow.className = "CssSelectedItemStyle"
                LastSelectedRow = oRow
            }
        }
        //===========================================================================================
        BindGrid()
        //=========================================Bind Grid=========================================       
        function BindGrid() {
            clearGrid();
            if (($get(MasterObj + "txtXmlValueSelector").value != "<Root></Root>" || $get(MasterObj + "txtXmlValueSelector").value != "<Root />") && ($get(MasterObj + "txtXmlValueSelector").value.substring(0,1)=="<")) {
                var str = $get(MasterObj + "txtXmlValueSelector").value
                var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                oXmlDoc.async = "false";
                oXmlDoc.loadXML(str)
                var xmlNode = oXmlDoc.documentElement.selectNodes("/Root/Tb");
                if (xmlNode.length > 0) {
                    for (var i = 0; i < xmlNode.length; i++) {
                        addRow(GrdValueSelector
                                , xmlNode.item(i).selectSingleNode("Value").text.toString()
                                , xmlNode.item(i).selectSingleNode("title").text.toString())
                    }
                }
            }
            SelectRow();
        }
        //----------------------------------------------------------------------------------------------
        function addRow(GrdValueSelector, Value, title) {

            var Row = GrdValueSelector.insertRow();

            Row.className = "CssItemHeader4"
            //            Row.setAttribute("ID", ID)

            Row.insertCell();
            Row.cells(0).innerHTML = "<input type='checkbox' />"
            //            " + (ISChk == 1 ? "checked" : "") + "/>";

            Row.insertCell();
            Row.cells(1).innerText = Value;

            Row.insertCell();
            Row.cells(2).innerText = title;

            Row.align = "center"

            Row.cells(0).style.width = "10px"
            Row.cells(1).style.width = "100px"
            Row.cells(2).style.width = "170px"
        }
        //----------------------------------------------------------------------------------------------
        function clearGrid() {
            while (GrdValueSelector.rows.length > 0)
                GrdValueSelector.deleteRow();
        }
        //----------------------------------------------------------------------------------------------
        function OnClickHeaderChk(obj) {
            for (var i = 0; i < GrdValueSelector.rows.length; i++) {
                if (obj.checked)
                    GrdValueSelector.rows(i).cells(0).firstChild.checked = true;
                else
                    GrdValueSelector.rows(i).cells(0).firstChild.checked = false;
            }
        }
        //==============================================================================================
        function SelectRow() {
            //alert($get(MasterObj + "txtCodeValue").value)
            if ($get(MasterObj + "txtCodeValue").value != "") {
                var str = $get(MasterObj + "txtCodeValue").value
                str = str + ",";
                var LenSpl = getCntChar(',', str)
                if (LenSpl == 0)
                    LenSpl += 1
                var ArrCode = new Array(LenSpl)
                for (var i = 0; i < LenSpl; i++) {
                    ArrCode[i] = str.split(",")[i];
                    for (var j = 0; j < GrdValueSelector.rows.length; j++) {
                        if (GrdValueSelector.rows(j).cells(1).innerText == ArrCode[i])
                            GrdValueSelector.rows(j).cells(0).firstChild.checked = true;
                    }
                }
            }
        }
        //==============================================================================================
        function OnClickBtnSet() {
            var Str = ""
            var StrID = ""
            var StrName = ""
            var grdLen = GrdValueSelector.rows.length;
            for (var i = 0; i < grdLen; i++) {
                if (GrdValueSelector.rows(i).cells(0).firstChild.checked == true) {
                    StrID += GrdValueSelector.rows(i).cells(1).innerText + ",";
                    StrName += GrdValueSelector.rows(i).cells(2).innerText + ",";
                }
            }
            StrID = StrID.substr(0, StrID.length - 1);
            Str += "<Root>"
            Str += "<Tb>"
            Str += "<ID>" + StrID + "</ID>"
            Str += "<Name>" + StrName + "</Name>"
            Str += "</Tb>"
            Str += "</Root>"
            window.returnValue = Str;
            window.close();
        }
    </script>
</asp:Content>
