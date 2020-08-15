<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="MultiDepartment1.aspx.cs" Inherits="TAPresentation.App_Utility.MultiDepartment.MultiDepartment1"
    ValidateRequest="false" %>

<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>
<%@ Register TagPrefix="cc1" Namespace="KasraDll" Assembly="KasraDll" %>
<%@ Register Src="../ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
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
            } catch (e) {Node = ""; }
            if (Node == undefined || Node == null || Node == "")
                Node = eventArgs;

            var oXmlNodes = oXmlDoc.documentElement.selectNodes("/Root/Tb [ DepartmentID='" + Node.get_value() + "']");
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
                strChk += "<DepartmentID>" + Node.get_value() + "</DepartmentID>"
                if (Node.get_checked())
                    strChk += "<Selected>1</Selected>"
                else
                    strChk += "<Selected>0</Selected>"
                strChk += "</Tb>"
            }
            
            //---------------------------------------------------------------------
            if (Node.get_checked()) {
                Selected = 1
                addrow(GrdMultiDepartment, Node.get_value(), Selected, Node.Text, Node.get_id());
            }
            else {
                Selected = 0
                Remove_row(Node.get_value())
            }
        }
        //==================================================================
    </script>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td colspan="2">
                <uc1:ToolBar ID="OToolBar" runat="server" PageName="ScriptGroups.aspx" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="border: 1px solid #66CCFF; width: 250px; height: 300px; scrollbar-hightlight-color: white;
                            scrollbar-arrow-color: black; scrollbar-base-color: #B1D3FF;">
                            <ComponentArt:TreeView ID="TVNew" runat="server" Height="98%" Width="245px" AutoPostBackOnSelect="false"
                                KeyboardEnabled="true" MultipleSelectEnabled="true" DisplayMargin="false" ShowLines="true"
                                CssClass="" NodeCssClass="TreeNode" SelectedNodeCssClass="SelectedTreeNode" MultipleSelectedNodeCssClass="MultipleSelectedTreeNode"
                                HoverNodeCssClass="HoverTreeNode" NodeEditCssClass="NodeEdit" CutNodeCssClass="CutTreeNode"
                                MarginWidth="24" DefaultMarginImageWidth="24" DefaultMarginImageHeight="20" LineImageWidth="19"
                                LineImageHeight="20" DefaultImageWidth="16" DefaultImageHeight="16" NodeLabelPadding="3"
                                ParentNodeImageUrl="folders.gif" LeafNodeImageUrl="folder.gif" CollapseImageUrl="exp.gif"
                                ExpandImageUrl="col.gif" ExpandCollapseImageWidth="19" ExpandCollapseImageHeight="20"
                                ImagesBaseUrl="../Images/TreeViewImage/" LineImagesFolderUrl="../Images/TreeViewLine/"
                                ExpandSinglePath="true" ExpandNodeOnSelect="True" CollapseNodeOnSelect="False">
                                <ClientEvents>
                                    <NodeCheckChange EventHandler="TreeView1_onNodeCheckChange" />
                                </ClientEvents>
                            </ComponentArt:TreeView>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnSubmitDepartment" EventName="click" />
                    </Triggers>
                </asp:UpdatePanel>
                <td id="TopRow" style="display: inline; scrollbar-highlight-color: white; overflow: hidden;
                    scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 152px" valign="middle"
                    align="center">
                    <div align="right" style="width: 185px">
                       
                        <table style="width: 165px" dir='rtl'>
                            <tr id="test">
                                <td class="CssHeaderStyle" align='center' style='width: 20px'>
                                </td>
                                <td class="CssHeaderStyle" align='center' style='width: 45px'>
                                    شماره
                                </td>
                                <td class="CssHeaderStyle" align='center' style='width: 100px'>
                                    نام
                                </td>
                            </tr>
                        </table>
                        <div style="overflow: auto; scrollbar-highlight-color: white; scrollbar-arrow-color: black;
                            scrollbar-base-color: #b0c4de; width: 185px; height: 230px" valign="middle" align="right">
                            <table id="GrdMultiDepartment" style="width: 165px;" onclick="onClickGrdMultiDepartment()">
                            </table>
                            <div style="display: none">
                                <input type="text" id="txtSubmitDepartment" name="txtSubmitDepartment" runat="server" />
                                <asp:Button ID="BtnSubmitDepartment" runat="server" Text="BtnSubmitDepartment" OnClick="BtnSubmitDepartment_Click" />
                                <cc1:MySecurity ID="onlineUser" runat="server">
                                </cc1:MySecurity>
                                <input type="text" id="txtHidden" runat="server" />
                                <input type="text" id="txtStr" runat="server" />
                                <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                                <input type="text" id="txtCompanyFinatialPeriodID" runat="server" />
                                <input type="text" id="txtOnLineUser" name="txtOnLineUser" runat="server" />
                            </div>
                            <script type="text/javascript">
        //=============================================java Code=====================
                                var MasterObj = "ctl00_ContentPlaceHolder1_";
//                                alert("safhe" + document.getElementById(MasterObj + "txtHidden").value)
        var strChk = document.getElementById(MasterObj + "txtHidden").value
        window.name = "MultiDepartment1.aspx"
        window.target = window.name;
        returnValue = strChk;
        window.target
        if (document.getElementById(MasterObj + "txtStr").value != "" || document.getElementById(MasterObj + "txtStr").value != undefiend || document.getElementById(MasterObj + "txtStr").value != "<Root></Root>") {

            var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            xmlDoc.async = "false";
            xmlDoc.loadXML(document.getElementById(MasterObj + "txtStr").value);
            var xmlNodes = xmlDoc.documentElement.selectNodes("/Root/Tb");
            for (i = 0; i < xmlNodes.length; i++) {
                addrow(GrdMultiDepartment, xmlNodes[i].selectSingleNode('DepartmentID').text, xmlNodes[i].selectSingleNode('Selected').text,  xmlNodes[i].selectSingleNode('DepartmentName').text,  xmlNodes[i].selectSingleNode('DepartmentCode').text)
            }
        }
        //=============================================OnClickBtnOk=====================            

        function OnClickBtnOk() {
            returnValue = MakeXml();
            window.close();
        }
        //========================================OnClickBtnClear==========================
        function OnClickBtnClear() {
            strChk = "";
            document.getElementById(MasterObj + "txtHidden").value = "";
            ClearGrd(GrdMultiDepartment)
            document.getElementById(MasterObj + "txtSubmitDepartment").value = "Clear";
            document.getElementById(MasterObj + "BtnSubmitDepartment").click();
        }
        //=================================add row to client grid=====================
        function addrow(GrdMultiDepartment, DepartmentID, Selected, DepartmentName, DepartmentCode) {
           
            var Row = GrdMultiDepartment.insertRow();

            Row.setAttribute("DepartmentID", DepartmentID);

            Row.insertCell()
            Row.cells(0).innerHTML = "<input type='checkbox' " + (Selected == 1 ? "checked" : "") + " onclick='onclickchk(this)'/>"
            Row.cells(0).style.width = "10px"

            Row.insertCell()

            Row.cells(1).innerText = DepartmentCode
            Row.cells(1).style.width = "35px"

            Row.insertCell()
            Row.cells(2).innerText = DepartmentName
            Row.cells(2).style.width = "90px"

        }
        //========================================onclickchk==========================
        function onclickchk(obj) {
            var Row = obj.parentElement.parentElement
            var ID = Row.DepartmentID;
            var Chk = Row.cells(0).firstChild.checked;
                var rootNodes = TVNew.get_nodes();
                for (var i = 0; i < rootNodes.get_length(); i++) {
                    if (rootNodes.getNode(i).get_value() == ID) {
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
                if (rootNodes.getNode(j).get_value() == ID) {
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
            if (document.getElementById(MasterObj + "txtStr").value != "" || document.getElementById(MasterObj + "txtStr").value != undefiend || document.getElementById(MasterObj + "txtStr").value != "<Root></Root>") {
                var xmlDoc1 = new ActiveXObject("Microsoft.XMLDOM");
                xmlDoc1.async = "false";
                xmlDoc1.loadXML("<Root>" + strChk + "</Root>");
                var xmlNodes1 = xmlDoc1.documentElement.selectNodes("/Root/Tb[Selected=1]");                
                for (i = 0; i < xmlNodes1.length; i++) {
                    strChk1=strChk1+ "<Tb><DepartmentID>" + xmlNodes1.item(i).selectSingleNode("DepartmentID").text + "</DepartmentID><Selected>1</Selected></Tb>"
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
 </script>
</asp:Content>
