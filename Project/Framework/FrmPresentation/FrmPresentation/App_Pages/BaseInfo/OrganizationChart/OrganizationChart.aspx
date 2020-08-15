<%@ Page Title="" Language="C#" MasterPageFile="~/App_Utility/MasterPage/MasterBule.master"
    AutoEventWireup="true" CodeBehind="OrganizationChart.aspx.cs" Inherits="FrmPresentation.App_Pages.BaseInfo.OrganizationChart.OrganizationChart"
    ValidateRequest="false" %>

<%@ Register Src="../../../App_Utility/ToolBar/ToolBar.ascx" TagName="ToolBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .CssHeaderStyle /*استایل هدر گرید*/
        {
            border-right: #346fa4 2px solid;
            border-top: lightsteelblue 2px solid;
            font-weight: bold;
            font-size: 12px;
            border-left: lightsteelblue 2px solid;
            direction: rtl;
            border-bottom: #346fa4 2px solid;
            font-family:'Kasra Traffic Bold' ,Kasra Traffic Normal;
            background-color: #83afe5;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<link href="../../../App_Utility/Styles/StyleForPages.css" rel="stylesheet" type="text/css" />--%>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <script language="javascript" type="text/javascript">
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "visible";
        }
        function EndRequestHandler(sender, args) {
            document.getElementById('OToolBar_ProgressBar').style.visibility = "hidden";
            var MasterObj = "ctl00_ContentPlaceHolder1_";

            newrowindex = 0
            LastSelectedRow = null;
            var StrVal = $get(MasterObj + "txtSubmit").value
            if ($get(MasterObj + "txtAlert").value != "")
                SetMsg($get(MasterObj + "txtAlert").value);

            $get(MasterObj + "txtSubmit").value = "";
            $get(MasterObj + "txtAlert").value = "";
            
            if (StrVal == "SelectedNodeChanged") {
                var xmlDoc = new ActiveXObject("MICROSOFT.XMLDOM")
                xmlDoc.async = "false"

                xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlGetStep1Department").value)
                var XmlNodes

                XmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/TreeDepartment")
                if (XmlNodes.length > 0) {
                    var oName = '', len = XmlNodes.length
                    ClearGrd(document.getElementById("GrdOrganChart"))
                    for (var i = 0; i < len; i++) {
                        AddRowGrdOrganChart(GrdOrganChart, XmlNodes.item(i).selectSingleNode('Name').text, XmlNodes.item(i).selectSingleNode('TypeName').text)
                    }
                }
                //*******************************************

                newrowindex = 0
                var xmlDoc = new ActiveXObject("MICROSOFT.XMLDOM")
                xmlDoc.async = "false"

                xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlGetDepartmentPosition").value)
                var XmlNodes

                XmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetDepartmentPosition")
                if (XmlNodes.length > 0) {
                    var oName = '', len = XmlNodes.length
                    ClearGrd(document.getElementById("GrdDepartmentPosition"))
                    for (var i = 0; i < len; i++) {
                        AddRowGrdDepartmentPosition(GrdDepartmentPosition, XmlNodes.item(i).selectSingleNode('DepartmentName').text, XmlNodes.item(i).selectSingleNode('RoleTitle').text, XmlNodes.item(i).selectSingleNode('RoleTypeTitle').text)
                    }
                }
            }
            //if (StrVal == "BtnNext" | StrVal == "BtnPrev" | StrVal == "BtnFirst" | StrVal == "BtnLast" | StrVal == "Const") {
                if (StrVal != "") {
                   
                    if ($get(MasterObj + "lblTo").value == "") {
                        document.getElementById('OToolBar_txtFromData').value = "";
                        document.getElementById('OToolBar_txtToData').value = "";
                        document.getElementById('OToolBar_txtTotalData').value = "";

                        document.getElementById('OToolBar_BtnNext').disabled = true;
                        document.getElementById('OToolBar_BtnPrv').disabled = true;
                        document.getElementById('OToolBar_BtnFirst').disabled = true;
                        document.getElementById('OToolBar_BtnLast').disabled = true;
                    }
                    else if ($get(MasterObj + "lblTo").value != "") {
                        document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
                        document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
                        document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
                        document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
                        document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;

                        if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
                            document.getElementById('OToolBar_BtnNext').disabled = true
                        else
                            document.getElementById('OToolBar_BtnNext').disabled = false;

                        if (parseInt($get(MasterObj + "lblFrom").value) == 1)
                            document.getElementById('OToolBar_BtnPrv').disabled = true
                        else
                            document.getElementById('OToolBar_BtnPrv').disabled = false;

                        document.getElementById('OToolBar_BtnFirst').disabled = false;
                        document.getElementById('OToolBar_BtnLast').disabled = false;
                    }
                }
            //}
        }
    </script>

    <table>
        <tr>        
            <td valign="top">
                <table>
                    <tr>
                        <td id="TDTree" align="right" valign="top" style="border-right: lightblue thin inset;
                            border-top: lightblue thin solid; border-left: lightblue thin outset; width: 250px;
                            border-bottom: lightblue thin solid; height: 525px">
                            <div class="cssDiv" style="height: 525px; width: 250px;">
                            <asp:TreeView ID="tvControl" SelectedNodeStyle-ForeColor="Red" runat="server" LineImagesFolder="../../../App_Utility/Images/TreeLineImages"
                                ShowLines="True" AutoGenerateDataBindings="False" OnSelectedNodeChanged="tvControl_SelectedNodeChanged">
                            </asp:TreeView>
                        </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table>
                    <tr>
                        <td align="center">
                            <uc1:ToolBar ID="OToolBar" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 400px; height: 488px" valign="top" align="center" >
                            <table>
                                <tr>
                                    <td style="width: 250px; height: 210px" valign="top">
                                        <table id="GrdOrganChart_Header" style="width: 250px; height: 11px;" cellpadding="0"
                                            align="center" cellspacing="0">
                                            <thead style="display: inline">
                                                <tr class="ShoperHeaderStyle">
                                                    <td class="CssHeaderStyle" style="width: 200px" align="center">
                                                        نام واحد
                                                    </td>
                                                    <td class="CssHeaderStyle" style="width: 50px" align="center">
                                                        نوع واحد
                                                    </td>
                                                </tr>
                                            </thead>
                                        </table>
                                        <table style="width: 100%;height: 200px" >
                                            <td>
                                                <div class="DivStyle" style="scrollbar-highlight-color: white; overflow: auto; width: 100%;
                                                    scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 100%; margin-right: 0px;">
                                                    <table id="GrdOrganChart" style="width=100%" cellspacing="0">
                                                        <thead style="display: none">
                                                        </thead>
                                                    </table>
                                                </div>
                                            </td>
                                        </table>
                                    </td>
                                    <td style="width: 400px; height:210px" valign="top">
                                        <table id="GrdDepartmentPosition_Header" style="width: 400px; height: 11px;" cellpadding="0"
                                            align="center" cellspacing="0">
                                            <thead style="display: inline">
                                                <tr class="ShoperHeaderStyle">
                                                    <td class="CssHeaderStyle" align="center">
                                                        نام واحد
                                                    </td>
                                                    <td class="CssHeaderStyle" style="width: 150px" align="center">
                                                        نام سمت
                                                    </td>
                                                    <td class="CssHeaderStyle" style="width: 100px" align="center">
                                                        نوع سمت
                                                    </td>
                                                </tr>
                                            </thead>
                                        </table>
                                        <table style="width: 100%;height: 200px">
                                            <td>
                                                <div class="DivStyle" style="scrollbar-highlight-color: white; overflow: auto; width: 100%;
                                                    scrollbar-arrow-color: black; scrollbar-base-color: #b0c4de; height: 100%; margin-right: 0px;">
                                                    <table id="GrdDepartmentPosition" cellspacing="0">
                                                        <thead style="display: none">
                                                        </thead>
                                                    </table>
                                                </div>
                                            </td>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top" colspan="2">
                                        <table>
                                            <tr>
                                                <td align="center">
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                            <asp:HiddenField ID="txtSDate" runat="server" />
                                                            <asp:HiddenField ID="txtEDate" runat="server" />
                                                            <asp:HiddenField ID="txtAlert" runat="server" />
                                                            <asp:HiddenField ID="lblFrom" runat="server" />
                                                            <asp:HiddenField ID="lblTo" runat="server" />
                                                            <asp:HiddenField ID="Totalpage" runat="server" />
                                                            <asp:HiddenField ID="txtCurPage" runat="server" />
                                                            <asp:HiddenField ID="lblTotal" runat="server" />
                                                            <asp:HiddenField ID="txtPageSize" runat="server" />
                                                            <asp:HiddenField ID="txtPageNumber" runat="server" />
                                                            <asp:HiddenField ID="txtOrderString" runat="server" />
                                                            <asp:HiddenField ID="txtCodePermision" runat="server" />
                                                            <asp:PlaceHolder ID="GridViewPlaceHolder" runat="Server" />
                                                            <asp:HiddenField ID="CurPage" runat="server" />
                                                            
                                                            <asp:HiddenField ID="txtDepartmentID" runat="server" />
                                                            <asp:HiddenField ID="txtXmlGetStep1Department" runat="server" />
                                                            <asp:HiddenField ID="txtXmlGetDepartmentPosition" runat="server" />
                                                            <div style="display: none">
                                                        <input type="text" id="txtGetCompanyFinatialPeriodID" name="txtGetCompanyFinatialPeriodID"
                                                            runat="server" />
                                                        <input type="text" id="SDate" name="SDate" runat="server" />
                                                        <input type="text" id="EDate" name="EDate" runat="server" />
                                                        <input type="text" id="txtHeaderClick" name="txtHeaderClick" runat="server" />
                                                        <input type="text" id="txtSortIndex" name="txtSortIndex" runat="server" />
                                                        <input type="text" id="txtShowAccess" name="txtShowAccess" runat="server" />
                                                        <input type="text" id="txtTmpFilter" name="txtTmpFilter" runat="server" />
                                                        <input type="text" id="txtSortDirection" enableviewstate="true" name="txtSortDirection"
                                                            runat="server" />
                                                        <input type="text" id="txtSortExpression" enableviewstate="true" name="txtSortExpression"
                                                            runat="server" />
                                                        <input type="text" id="txtHeaderIndex" name="txtHeaderIndex" runat="server" />
                                                        <input type="text" id="txtOldSortExpression" name="txtOldSortExpression" runat="server" />
                                                        <input type="text" id="txtSubmit" name="txtSubmit" runat="server" />
                                                        <asp:Button ID="BtnSubmit" runat="server" Text="BtnSubmit" OnClick="BtnSubmit_Click" />
                                                        <input type="text" id="txtSessionID" name="txtSessionID" runat="server" />
                                                        
                                                    </div>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="BtnSubmit" EventName="click" />
                                                            <asp:AsyncPostBackTrigger ControlID="tvControl" EventName="SelectedNodeChanged" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                    
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                        
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript">
        var LastSelectedRow = null;
        var LastSelectedRowClass = "";
        var MasterObj = "ctl00_ContentPlaceHolder1_";
        ////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!OnLoad!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //alert($get(MasterObj + "txtGetCompanyFinatialPeriodID").value)
        document.getElementById('OToolBar_BtnPrv').disabled = true;
        document.getElementById('OToolBar_txtFromData').value = $get(MasterObj + "lblFrom").value;
        document.getElementById('OToolBar_txtToData').value = $get(MasterObj + "lblTo").value;
        document.getElementById('OToolBar_txtTotalData').value = $get(MasterObj + "lblTotal").value;
        document.getElementById('OToolBar_txtCurPage').value = $get(MasterObj + "txtCurPage").value;
        document.getElementById('OToolBar_txtTotalPage').value = $get(MasterObj + "Totalpage").value;
        if (parseInt(document.getElementById("OToolBar_txtCurPage").value) == parseInt(document.getElementById("OToolBar_txtTotalPage").value))
            document.getElementById('OToolBar_BtnNext').disabled = true
        else
            document.getElementById('OToolBar_BtnNext').disabled = false;
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Paging!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnNext() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnNext";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnPrv() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnPrv";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnBlurtxtCurPage() {
            document.getElementById("OToolBar_txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value.replace(" ", "");

            var TotalPage = parseInt(document.getElementById("OToolBar_txtTotalPage").value);
            if (document.getElementById("OToolBar_txtCurPage").value != "" &&
                        document.getElementById("OToolBar_txtCurPage").value != "0") {
                if (parseInt(document.getElementById("OToolBar_txtCurPage").value) <= parseInt(TotalPage)) {
                    document.getElementById(MasterObj + "txtCurPage").value = document.getElementById("OToolBar_txtCurPage").value
                }
                document.getElementById(MasterObj + "txtSubmit").value = "Const";
                document.getElementById(MasterObj + "BtnSubmit").click();
            }
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnLast() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnLast";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        function OnClickBtnFirst() {
            document.getElementById(MasterObj + "txtSubmit").value = "BtnFirst";
            document.getElementById(MasterObj + "BtnSubmit").click();
        }
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        /*newrowindex = 0
        var xmlDoc = new ActiveXObject("MICROSOFT.XMLDOM")
        xmlDoc.async = "false"
        xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlGetStep1Department").value)
        var XmlNodes
        XmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/TreeDepartment")
        if (XmlNodes.length > 0) {
        var oName = '', len = XmlNodes.length
        ClearGrd(document.getElementById("GrdOrganChart"))
        for (var i = 0; i < len; i++) {
        AddRowGrdOrganChart(GrdOrganChart, XmlNodes.item(i).selectSingleNode('Name').text, XmlNodes.item(i).selectSingleNode('TypeName').text)
        }
        }
        //*******************************************
        newrowindex = 0
        var xmlDoc = new ActiveXObject("MICROSOFT.XMLDOM")
        xmlDoc.async = "false"

        xmlDoc.loadXML(document.getElementById(MasterObj + "txtXmlGetDepartmentPosition").value)
        var XmlNodes
        XmlNodes = xmlDoc.documentElement.selectNodes("/BaseInfoEntity/GetDepartmentPosition")
        if (XmlNodes.length > 0) {
        var oName = '', len = XmlNodes.length
        ClearGrd(document.getElementById("GrdDepartmentPosition"))
        for (var i = 0; i < len; i++) {
        AddRowGrdDepartmentPosition(GrdDepartmentPosition, XmlNodes.item(i).selectSingleNode('DepartmentName').text, XmlNodes.item(i).selectSingleNode('RoleTitle').text, XmlNodes.item(i).selectSingleNode('RoleTypeTitle').text)
        }
        }*/
        //*******************************************************************************
        function AddRowGrdDepartmentPosition(oGrid, DepartmentName, RoleTitle, RoleTypeTitle) {
            oGrid.insertRow()
            if ((oGrid.rows.length - 1) % 2 == 0)
                oGrid.rows(newrowindex).className = "CssItemStyle"
            else
                oGrid.rows(newrowindex).className = "CssAlternatingItemStyle";
            //oGrid.rows(newrowindex).className = "CssAlternatingItemStyle";
            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).insertCell()
            //==
            var TextDepartmentName, TitleDepartmentName
            if (DepartmentName.length > 22) {
                TextDepartmentName = DepartmentName.substr(0, 22)
                TitleDepartmentName = DepartmentName
            }
            else {
                TextDepartmentName = DepartmentName
                TitleDepartmentName = ''
            }
            oGrid.rows(newrowindex).cells(0).innerText = TextDepartmentName
            oGrid.rows(newrowindex).cells(0).title = TitleDepartmentName
            //==
            var TextRoleTitle, TitleRoleTitle
            if (RoleTitle.length > 15) {
                TextRoleTitle = RoleTitle.substr(0, 15)
                TitleRoleTitle = RoleTitle
            }
            else {
                TextRoleTitle = RoleTitle
                TitleRoleTitle = ''
            }
            oGrid.rows(newrowindex).cells(1).innerText = TextRoleTitle
            oGrid.rows(newrowindex).cells(1).title = TitleRoleTitle
            //==
            var TextRoleTypeTitle, TitleRoleTypeTitle
            if (RoleTypeTitle.length > 10) {
                TextRoleTypeTitle = RoleTypeTitle.substr(0, 10)
                TitleRoleTypeTitle = RoleTypeTitle
            }
            else {
                TextRoleTypeTitle = RoleTypeTitle
                TitleRoleTypeTitle = ''
            }
            oGrid.rows(newrowindex).cells(2).innerText = TextRoleTypeTitle
            oGrid.rows(newrowindex).cells(2).title = TitleRoleTypeTitle
            //==
            //Style
            oGrid.rows(newrowindex).align = "center"
            oGrid.rows(newrowindex).cells(0).style.border = "1px solid  #E9E9E9";
            oGrid.rows(newrowindex).cells(1).style.border = "1px solid #E9E9E9";
            oGrid.rows(newrowindex).cells(2).style.border = "1px solid #E9E9E9";
            oGrid.rows(newrowindex).cells(0).style.width = "150px"
            oGrid.rows(newrowindex).cells(1).style.width = "150px"
            oGrid.rows(newrowindex).cells(2).style.width = "100px"

            newrowindex = newrowindex + 1
        }
        //*******************************************************************************
        function AddRowGrdOrganChart(oGrid, Name, TypeName) {
            oGrid.insertRow()
            if ((oGrid.rows.length - 1) % 2 == 0)
                oGrid.rows(newrowindex).className = "CssItemStyle"
            else
                oGrid.rows(newrowindex).className = "CssAlternatingItemStyle";
            //oGrid.rows(newrowindex).className = "CssAlternatingItemStyle";
            oGrid.rows(newrowindex).insertCell()
            oGrid.rows(newrowindex).insertCell()
            var TextName, TitleName
            if (Name.length > 30) {
                TextName = Name.substr(0, 30)
                TitleName = Name
            }
            else {
                TextName = Name
                TitleName = ''
            }
            var TextTypeName, TitleTypeName
            if (TypeName.length > 8) {
                TextTypeName = TypeName.substr(0, 8)
                TitleTypeName = TypeName
            }
            else {
                TextTypeName = TypeName
                TitleTypeName = ''
            }

            oGrid.rows(newrowindex).cells(0).innerText = TextName
            oGrid.rows(newrowindex).cells(0).title = TitleName
            oGrid.rows(newrowindex).cells(1).innerText = TextTypeName
            oGrid.rows(newrowindex).cells(1).title = TitleTypeName
            //Style
            oGrid.rows(newrowindex).align = "center"
            //            oGrid.rows(newrowindex).cells(0).style.border = "1px solid white";
            //            oGrid.rows(newrowindex).cells(1).style.border = "1px solid white";
            oGrid.rows(newrowindex).cells(1).style.border = "1px solid #E9E9E9";
            oGrid.rows(newrowindex).cells(0).style.border = "1px solid #E9E9E9";
            oGrid.rows(newrowindex).cells(0).style.width = "200px"
            oGrid.rows(newrowindex).cells(1).style.width = "50px"

            newrowindex = newrowindex + 1
        }
        //*******************************************************************************
        function ClearGrd(obj) {
            var j = obj.rows.length - 1
            for (; j >= 0; --j)
                obj.deleteRow(j)
            newrowindex = 0
        }
        function OnClickGrd(SelectedRow) {

            if (LastSelectedRow != null) {
                LastSelectedRow.className = LastSelectedRowClass;
            }
            LastSelectedRowClass = SelectedRow.className;
            LastSelectedRow = SelectedRow;
            SelectedRow.className = "CssSelectedItemStyle";
        }
        function OnClickBtnNew() {
            var url = "../../DataEntry/EnterData.aspx?BatchEnterDataType=Department&SessionID=" + document.getElementById(MasterObj + "txtSessionID").value
            var StrFeatur = "dialogHeight: 700px;dialogWidth: 800px;center: Yes;help: no;status: no"
            var returnValue = window.showModalDialog(url, window, StrFeatur)
        }
    </script>

</asp:Content>
