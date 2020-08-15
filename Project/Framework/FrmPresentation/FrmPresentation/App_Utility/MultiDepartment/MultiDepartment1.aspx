<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="MultiDepartment1.aspx.cs" Inherits="FrmPresentation.App_Utility.MultiDepartment.MultiDepartment1"
    ValidateRequest="false" %>

<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<%@ Register Src="../ComboBox/ComboBox.ascx" TagName="ComboBox" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        //============================java Codes============================
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        document.body.scroll = "no";
        var Selected = ""
        var strChk = ""

        //==================================================================
        function TreeView1_onNodeCheckChange(sender, eventArgs) {

            var strXml = "<Root>" + strChk + "</Root>"
            var oXmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            oXmlDoc.async = "false";
            oXmlDoc.loadXML(strXml);
            var Node
            try {
                Node = eventArgs.get_node();
            } catch (e) { Node = ""; }
            if (Node == undefined || Node == null || Node == "")
                Node = eventArgs;

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ DepartmentID='" + Node.get_id() + "']");
            //---------------------------------------------------------------------
            if (oXmlNodes.length > 0) {
                if (Node.get_checked())
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 1
                else
                    oXmlNodes.item(0).selectSingleNode("Selected").text = 0
                strXml = oXmlDoc.xml;
                strChk = strXml.replace("<Root>", "");
                strChk = strChk.replace("</Root>", "");
            }
            else {
                strChk += "<Tb>"
                strChk += "<DepartmentID>" + Node.get_id() + "</DepartmentID>"
                if (Node.get_checked())
                    strChk += "<Selected>1</Selected>"
                else
                    strChk += "<Selected>0</Selected>"
                strChk += "</Tb>"
            }
            //---------------------------------------------------------------------
            if (Node.get_checked()) {
                Selected = 1
                addrow(GrdMultiDepartment, Node.get_id(), Selected, Node.Text);
            }
            else {
                Selected = 0
                Remove_row(Node.get_id())
            }

        }
        //==================================================================
    </script>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td colspan="2">
                <table>
                    <tr>
                        <td>
                            واحد سازمانی :
                        </td>
                        <td>
                            <uc2:ComboBox ID="CmbCodeDept" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="ScriptGroups.aspx" />
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="height: 700px" valign="top">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div style="height: 600px; overflow: auto; overflow-y: scroll" id="shadowMessage">
                                        <div style="border: 2px double #6593CF; overflow-y: hidden">
                                            <div style="height: 100%; overflow-y: hidden">
                                                <table width="100%">
                                                    <tr valign="top">
                                                        <td valign="top">
                                                            <div style="border: 1px solid #66CCFF; width: 250px; height: 500px; scrollbar-hightlight-color: white;
                                                                scrollbar-arrow-color: black; scrollbar-base-color: #B1D3FF;">
                                                                <ComponentArt:TreeView ID="TVNew" runat="server" AutoPostBackOnSelect="true" KeyboardEnabled="true"
                                                                    MultipleSelectEnabled="true" DisplayMargin="false" ShowLines="true" CssClass=""
                                                                    NodeCssClass="TreeNode" SelectedNodeCssClass="SelectedTreeNode" MultipleSelectedNodeCssClass="MultipleSelectedTreeNode"
                                                                    HoverNodeCssClass="HoverTreeNode" NodeEditCssClass="NodeEdit" CutNodeCssClass="CutTreeNode"
                                                                    MarginWidth="24" DefaultMarginImageWidth="24" DefaultMarginImageHeight="20" LineImageWidth="19"
                                                                    LineImageHeight="20" DefaultImageWidth="16" DefaultImageHeight="16" NodeLabelPadding="3"
                                                                    ParentNodeImageUrl="folders.gif" LeafNodeImageUrl="folder.gif" CollapseImageUrl="exp.gif"
                                                                    ExpandImageUrl="col.gif" ExpandCollapseImageWidth="19" ExpandCollapseImageHeight="20"
                                                                    ImagesBaseUrl="../Images/TreeViewImage/" LineImagesFolderUrl="../Images/TreeViewLine/"
                                                                    ExpandSinglePath="true" ExpandNodeOnSelect="True" OnNodeSelected="TVNew_NodeSelected"
                                                                    CollapseNodeOnSelect="False">
                                                                    <ClientEvents>
                                                                        <NodeCheckChange EventHandler="TreeView1_onNodeCheckChange" />
                                                                        <NodeSelect EventHandler="onclickTreeNode" />
                                                                    </ClientEvents>
                                                                </ComponentArt:TreeView>
                                                            </div>
                                                            <div style="display: none">
                                                                <input type="text" id="txtStr" runat="server" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmitDepartment" EventName="click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table>
                    <tr>
                        <td id="TopRow" style="display: inline; scrollbar-highlight-color: white; overflow: hidden;
                            scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 700px" valign="top"
                            align="center">
                            <div style="width: 400px">
                                <table style="width: 380px" dir='rtl'>
                                    <tr id="test">
                                        <td class="CssHeaderStyle" align='center' style='width: 20px'>
                                        </td>
                                        <td class="CssHeaderStyle" align='center' style='width: 80px'>
                                            شماره
                                        </td>
                                        <td class="CssHeaderStyle" align='center' style='width: 280px'>
                                            نام
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <div style="overflow: auto; scrollbar-highlight-color: white; scrollbar-arrow-color: black;
                                                scrollbar-base-color: #b0c4de; width: 400px; height: 500px" valign="top" align="right">
                                                <table id="GrdMultiDepartment" style="width: 380px;" onclick="onClickGrdMultiDepartment()">
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="display: none">
        <input type="text" id="txtSubmitDepartment" name="txtSubmitDepartment" runat="server" />
        <asp:Button ID="BtnSubmitDepartment" runat="server" Text="BtnSubmitDepartment" OnClick="BtnSubmitDepartment_Click" />
        <cc1:MySecurity ID="onlineUser" runat="server">
        </cc1:MySecurity>
        <input type="text" id="txtHidden" runat="server" />
        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
        <input type="text" id="txtCompanyFinatialPeriodID" runat="server" />
        <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
        <input type="text" id="ThisIDPerson" runat="server" />
        <input type="text" id="txtDepartmentID" runat="server" />
        <input type="text" id="txtDivWidth" name="txtDivWidth" runat="server" />
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#" + MasterObj + "CmbCodeDept_txtOnChangeFunc").val("OnClickBtnFilter()");
        });
        //=============================================java Code=====================
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        var ParentDialog = dialogArguments;
        //===================لود کردن واحدهای انتخاب شده از صفحه parent برای xml بزرگ==========
        //$get(MasterObj + "ThisIDPerson").value
        var ThisIDPerson = $get(MasterObj + "ThisIDPerson").value;
        $get(MasterObj + "txtHidden").value = ParentDialog.$get(ThisIDPerson + "_txtHidden").value;

        document.getElementById(MasterObj + "txtSubmitDepartment").value = "BindPage";
        document.getElementById(MasterObj + "BtnSubmitDepartment").click();
        //**************************************EndDeclaration*********************************       
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function BeginRequestHandler(sender, args) {

        }
        //====================================================================================
        function EndRequestHandler(sender, args) {
            if (document.getElementById(MasterObj + "txtSubmitDepartment").value == "BindPage")
                Onload()
            if ($get(MasterObj + "txtSubmitDepartment").value == 'FilterTree') {
                var Top, Left;
                var NewObj = $(".SelectedTreeNode")[0];
                var posX = NewObj.offsetLeft;
                var posY = NewObj.offsetTop;
                if (Left != null && Top != null && Div.id == "shadowMessage") {
                    Div.style.top = Top;
                    Div.style.left = Left;
                }
                else {
                    while (NewObj.offsetParent) {
                        posX = posX + NewObj.offsetLeft;
                        posY = posY + NewObj.offsetTop;
                        if (NewObj == document.getElementsByTagName('body')[0]) { break }
                        else { NewObj = NewObj.offsetParent; }
                    }
                }

                $("#shadowMessage")[0].scrollTop = posY - 220;

                $(".SelectedTreeNode").css("background-color", "#edb8db")
            }
            document.getElementById(MasterObj + "txtSubmitDepartment").value = "";
        }
        //==========================================================================================
        function Onload() {
            strChk = document.getElementById(MasterObj + "txtHidden").value
            window.name = "MultiDepartment1.aspx"
            window.target = window.name;
            returnValue = strChk;
            window.target

            if (document.getElementById(MasterObj + "txtStr").value != "" && document.getElementById(MasterObj + "txtStr").value != undefined && document.getElementById(MasterObj + "txtStr").value != "<Root></Root>") {

                var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                xmlDoc.async = "false";
                xmlDoc.loadXML(document.getElementById(MasterObj + "txtStr").value);
                var xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb");
                for (i = 0; i < xmlNodes.length; i++) {
                    addrow(GrdMultiDepartment, xmlNodes[i].selectSingleNode('DepartmentID').text, xmlNodes[i].selectSingleNode('Selected').text, xmlNodes[i].selectSingleNode('DepartmentName').text)
                }
            }
        }
        //=============================================OnClickBtnOk=====================            
        function OnClickBtnOk() {
            returnValue = MakeXml();
            if (returnValue == undefined)
                returnValue = ""
            window.close();
        }
        //========================================OnClickBtnClear==========================
        function OnClickBtnClear() {
            strChk = "";
            document.getElementById(MasterObj + "txtHidden").value = "";
            document.getElementById(MasterObj + "txtStr").value = "";
            ClearGrd(GrdMultiDepartment)
            document.getElementById(MasterObj + "txtSubmitDepartment").value = "Clear";
            document.getElementById(MasterObj + "BtnSubmitDepartment").click();
        }
        //=================================add row to client grid=====================
        function addrow(GrdMultiDepartment, DepartmentID, Selected, DepartmentName) {

            var Row = GrdMultiDepartment.insertRow();

            Row.setAttribute("DepartmentID", DepartmentID);
            Row.className = "CssItemHeader4"

            Row.insertCell()
            Row.cells(0).innerHTML = "<input type='checkbox' " + (Selected == 1 ? "checked" : "") + " onclick='onclickchk(this)'/>"
            Row.cells(0).style.width = "20px"

            Row.insertCell()

            Row.cells(1).innerText = DepartmentID
            Row.cells(1).style.width = "115px"

            Row.insertCell()
            Row.cells(2).innerText = DepartmentName
            Row.cells(2).style.width = "300px"

        }
        //========================================onclickchk==========================
        function onclickchk(obj) {
            var Row = obj.parentElement.parentElement
            var ID = Row.DepartmentID;
            var Chk = Row.cells(0).firstChild.checked;
            var rootNodes = TVNew.get_nodes();
            for (var i = 0; i < rootNodes.get_length(); i++) {
                if (rootNodes.getNode(i).get_id() == ID) {
                    rootNodes.getNode(i).set_checked(Chk)
                    TreeView1_onNodeCheckChange('', rootNodes.getNode(i));
                }
                if (rootNodes.getNode(i).get_nodes().get_length() > 0)
                    childFunc(rootNodes.getNode(i), ID, Chk)
            }
        }

        //======================================childFunc============================
        function childFunc(Node, ID, Chk) {
            var rootNodes = Node.get_nodes();
            for (var j = 0; j < rootNodes.get_length(); j++) {
                if (rootNodes.getNode(j).get_id() == ID) {
                    rootNodes.getNode(j).set_checked(Chk);
                    TreeView1_onNodeCheckChange('', rootNodes.getNode(j));
                }
                if (rootNodes.getNode(j).get_nodes().get_length() > 0)
                    childFunc(rootNodes.getNode(j), ID, Chk);
            }
        }
        //==============================Style on click Grid=====

        function onClickGrdMultiDepartment(obj) {
            var index = -1
            var oRow = event.srcElement
            //_______Find Row
            for (var i = 0; oRow.tagName != "TR"; i++)
                oRow = oRow.parentElement
            index = oRow.rowIndex
            if (oRow.parentElement.parentElement.id == "GrdMultiDepartment") {
                for (i = 0; i < GrdMultiDepartment.rows.length; i++) {
                    if (GrdMultiDepartment.rows(i).className == "CssSelectedItemStyle") {
                        GrdMultiDepartment.rows(i).className = "CssItemHeader4"
                    }
                }
                oRow.className = "CssSelectedItemStyle"
                LastSelectedRow = oRow
            }
        }

        //======================================Remove Row===========================
        function Remove_row(NodeID) {
            var grdLen = GrdMultiDepartment.rows.length;
            for (var i = 0; i < grdLen; i++) {
                if (GrdMultiDepartment.rows(i).getAttribute("DepartmentID") == NodeID) {
                    GrdMultiDepartment.deleteRow(i)
                    return;
                }
            }
        }
        //======================================MakeXml============================
        function MakeXml() {
            var strChk1 = "";
            if (strChk != "" && strChk != undefined && strChk != "<Root></Root>") {
                var xmlDoc1 = new ActiveXObject("Microsoft.XMLDOM");
                xmlDoc1.async = "false";
                xmlDoc1.loadXML("<Root>" + strChk + "</Root>");
                var xmlNodes1 = xmlDoc1.documentElement.selectNodes("/Root/Tb[Selected=1]");
                for (i = 0; i < xmlNodes1.length; i++) {
                    strChk1 = strChk1 + "<Tb><DepartmentID>" + xmlNodes1.item(i).selectSingleNode("DepartmentID").text + "</DepartmentID><Selected>1</Selected></Tb>"
                }

                return strChk1;
            }
        }
        //====================================ClearGrd============================
        function ClearGrd(oGrid) {
            var j = oGrid.rows.length - 1
            for (; j >= 0; --j) {
                oGrid.deleteRow(j)
            }
            newrowindex = 0
        }
        //================================================================
        function OnClickBtnFilter() {
            if ($("#" + MasterObj + "CmbCodeDept_txtCode").val() != '') {
                $("#" + MasterObj + "txtDepartmentID").val($("#" + MasterObj + "CmbCodeDept_txtID").val());
            }
            TVNew.SelectNodeById($("#" + MasterObj + "txtDepartmentID").val());
            document.getElementById(MasterObj + "txtSubmitDepartment").value = "FilterTree";

        }
        //================================================================
        function onclickTreeNode(sender, eventArgs) {
            $("#txtDivWidth").val($("#shadowMessage").css('width'));
        }
    </script>
</asp:Content>
